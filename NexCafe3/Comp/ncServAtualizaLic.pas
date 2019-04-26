unit ncServAtualizaLic;

interface

uses
  SysUtils, Classes, kbmMWCustomTransport, kbmMWClient,
  kbmMWHTTPStdTransStream, Variants, nxDB,
  kbmMWTCPIPIndyClientTransport, Windows, Messages, ExtCtrls, uLicEXECryptor,
  DB, nxllComponent;

type

  TdmAtualizaLic = class(TDataModule)
    mwCli: TkbmMWSimpleClient;
    mwTransp: TkbmMWTCPIPIndyClientTransport;
    Timer1: TTimer;
    nxDB: TnxDatabase;
    tCaixa: TnxTable;
    tCaixaID: TAutoIncField;
    tCaixaAberto: TBooleanField;
    tCaixaUsuario: TStringField;
    tCaixaAbertura: TDateTimeField;
    tCaixaFechamento: TDateTimeField;
    tCaixaTotalFinal: TCurrencyField;
    tCaixaDescontos: TCurrencyField;
    tCaixaCancelamentos: TCurrencyField;
    tCaixaSaldoAnt: TCurrencyField;
    tCaixaObs: TMemoField;
    tCaixaSangria: TCurrencyField;
    tCaixaSupr: TCurrencyField;
    tCaixaReproc: TDateTimeField;
    tCaixaEstSessoesQtd: TIntegerField;
    tCaixaEstSessoesTempo: TFloatField;
    tCaixaEstUrls: TIntegerField;
    tCaixaEstSyncOk: TBooleanField;
    tCaixaEstBuscasEng: TMemoField;
    tCaixaEstRes: TMemoField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
//    FReg : TRegistro;
    { Private declarations }
    function SalvaEst(aCodLoja: Integer; aCodEquip: String; 
                      aData: TDateTime; 
                      aCaixa: Integer; 
                      aURLs: Integer;
                      aQtdSessoes: Integer;
                      aTempoSessoes: Double;
                      aRes: String;
                      aSearch: String): Boolean;
    procedure PubEst(aLoja: Integer; aCodEquip: String);                      
  public
    function Conecta(RaiseEx: Boolean = False): Boolean;
    function ObtemNovaLic(RaiseEx: Boolean = False): String;
    function UpgradeNex(aTrocaHD: Boolean; aSenha: String): String;

    function ObtemCodLojaPorEmail(aEmail: String): Boolean;
    function ObtemCodLojaPorEquip(aCodEquip: String): String;
    function ObtemSenha(aCodLoja: Integer): String;

                             
    procedure RegistraTesteGratuito(S: String);
    { Public declarations }
  end;

  TThreadAtualizaLic = class ( TThread )
  protected
    procedure Execute; override;
  public 
    constructor Create;   
  end;

var
  dmAtualizaLic: TdmAtualizaLic;

implementation

uses
  JTimer, ncServBase, ncClassesBase, ncSyncLic, ncServBD;

{$R *.dfm}

const  
  TempoTimer = 300000;

function TdmAtualizaLic.Conecta(RaiseEx: Boolean=False): Boolean;
var 
  ProxyIP : String;
  ProxyPort: Integer;
  I : Integer;
  HostRegistro : Array of String;
begin
{$I crypt_start.inc}
  Result := False;
  I := -1;
  SetLength(HostRegistro, 2);
  HostRegistro[0] := 'registro.nextar.com.br';
  HostRegistro[1] := 'joaoborges.dyndns.org';
  
  while (I < 1) and (not Result) do
  try
    Inc(I);
    mwTransp.Active := False;
    mwTransp.Host := HostRegistro[I];
    if ObtemProxy(ProxyIP, ProxyPort) then begin
      mwTransp.Port := ProxyPort;
      mwTransp.Host := ProxyIP;
      mwTransp.Params.Values['KBMMWHTTPPOSTURL'] := 'http://'+HostRegistro[I];
      mwTransp.StreamFormat := 'HTTP';
    end else begin
      mwTransp.Host := HostRegistro[I];
      mwTransp.Port := 3000;
      mwTransp.Params.Clear;
      mwTransp.StreamFormat := 'STANDARD';
    end;  
    mwTransp.Active := True;
    Result := True;
  except
    if RaiseEx and (I>=1) then raise;
  end;
{$I crypt_end.inc}
end;

procedure TdmAtualizaLic.DataModuleCreate(Sender: TObject);
begin
//  FReg := TRegistro.Create;
end;

procedure TdmAtualizaLic.DataModuleDestroy(Sender: TObject);
begin
//  FReg.Free;
end;

function TdmAtualizaLic.ObtemCodLojaPorEmail(aEmail: String): Boolean;
var V: Variant;
begin
{$I crypt_start.inc}
  Result := False;
  if not Conecta(True) then Exit;
  V := mwCli.Request('REGISTRO', '2.00', 'OBTEMCODLOJAPOREMAIL', [aEmail, VersaoCMServer]);
  Result := (V[0]='OK') and (V[1]>'');
{$I crypt_end.inc}
end;

function TdmAtualizaLic.ObtemCodLojaPorEquip(aCodEquip: String): String;
var V: Variant;
begin
{$I crypt_start.inc}
  Result := '';
  if not Conecta(True) then Exit;
  V := mwCli.Request('REGISTRO', '2.00', 'OBTEMCODLOJAPOREQUIP', [aCodEquip, VersaoCMServer]);
  if V[0]='OK' then
    Result := V[1] else
    Result := '';
{$I crypt_end.inc}
end;

function TdmAtualizaLic.ObtemNovaLic(RaiseEx: Boolean = False): String;
var 
  V: Variant;
  S: String;
  SL: TStrings;
  P: ncPString;
  aCE, aSN: String;
begin
{$I crypt_start.inc}
  try
    Result := '';
    RegistroGlobal.CodEquipSerial(aCE, aSN);
    if not Conecta(raiseex) then Exit;
    V := mwCli.Request('REGISTRO', '2.00', 'OBTEMREGISTRO', [RegistroGlobal.CodLoja, VersaoCMServer, aCE, RegistroGlobal.LicencasValidas(False, aCE, aSN)]);
    if (V[0] = 'OK') then begin
      Result := V[2];
      if RegistroGlobal.ChavesOk(Result) and
         ((RegistroGlobal.StringChaves<>Result) or 
          (Pos(ChaveCybermgr, Result)>0)) then 
      begin
        if Pos(ChaveCybermgr, Result)>0 then
          RegistroGlobal.StringChaves := '' else
          RegistroGlobal.StringChaves := V[2];

        RegistroGlobal.SalvaArqPadrao;
      end;
      if (Result<>ChaveCybermgr) and (V[3] <> aCE) then
        Result := 'OUTROHD';

{        if not RaiseEx then
          PubEst(RegistroGlobal.CodLoja, aCE); }
    end else
      if RaiseEx then Raise Exception.Create(V[0]);
         
    mwTransp.Active := False;
  except
    if RaiseEx then
      Raise;
  end;
{$I crypt_end.inc}
end;

function TdmAtualizaLic.ObtemSenha(aCodLoja: Integer): String;
var V: Variant;
begin
{$I crypt_start.inc}
  Result := '';
  if not Conecta(True) then Exit;
  V := mwCli.Request('REGISTRO', '2.00', 'OBTEMSENHA', [aCodLoja, VersaoCMServer]);
  if V[0]='OK' then
    Result := V[1];
  mwTransp.Active := False;
{$I crypt_end.inc}
end;

procedure TdmAtualizaLic.PubEst(aLoja: Integer; aCodEquip: String);
var S: TnxSession;
begin
  Exit;
  try
    S := CreateSession;
    if S=nil then Exit;
    try
      nxDB.Session := S;
      nxDB.Connected := True;
      try
        tCaixa.Session := nxDB.Session;
        tCaixa.Database := nxDB;
        tCaixa.Open;
        try
          if tCaixa.FindKey([False, False]) then 
          if SalvaEst(aLoja, aCodEquip,
                      tCaixaAbertura.Value, 
                      tCaixaID.Value, 
                      tCaixaEstUrls.Value, 
                      tCaixaEstSessoesQtd.Value, 
                      tCaixaEstSessoesTempo.Value, 
                      tCaixaEstRes.Value, 
                      tCaixaEstBuscasEng.Value) then begin
                        tCaixa.Edit;
                        tCaixaEstSyncOk.Value := True; 
                        tCaixa.Post;
                      end;
        finally
          tCaixa.Close;
        end;
      finally
        nxDB.Connected := False;
        nxDB.Session := nil;
      end;
    finally
      S.Free;
    end;
  except
  end;
end;

procedure TdmAtualizaLic.RegistraTesteGratuito(S: String);
var V: Variant;
begin
{$I crypt_start.inc}
  if not Conecta then raise exception.Create('Não foi possível conectar ao servidor de registro da Nextar');
  V := mwCli.Request('REGISTRO', '2.00', 'OBTEMLICENCATESTE', [S]);
  if V[0] <> 'OK' then raise exception.Create(V[0]);
  RegistroGlobal.CodLoja := V[1];
  RegistroGlobal.StringChaves := V[2];
  RegistroGlobal.SalvaArqPadrao;
{$I crypt_end.inc}
end;

function TdmAtualizaLic.SalvaEst(aCodLoja: Integer; aCodEquip: String;
  aData: TDateTime; aCaixa, aURLs, aQtdSessoes: Integer; aTempoSessoes: Double; aRes,
  aSearch: String): Boolean;
var V: Variant;  
begin
  V := mwCli.Request('REGISTRO', '2.00', 'SALVAEST', [aCodLoja, aCodEquip, aData, aCaixa, aURLs, aQtdSessoes, aTempoSessoes, aRes, aSearch]);
  Result := (V<>null) and (V=True);
end;

{ TThreadAtualizaLic }

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

constructor TThreadAtualizaLic.Create;
begin
  inherited Create(False);
  FreeOnTerminate := True;
end;

procedure TThreadAtualizaLic.Execute;
var 
  DM : TdmAtualizaLic;
  Dummy: Integer;
begin
  DM := TdmAtualizaLic.Create(nil);
  DM.Timer1.Interval := TempoTimer;
  DM.Timer1.Enabled := True;
  try
    DM.Timer1Timer(nil);
    while not Terminated do begin
      MsgWaitForMultipleObjects(0, Dummy, False, 200, QS_ALLINPUT);
      try
        ProcessMessages;
      except
      end;
    end;
  finally
    DM.Free;
  end;
end;

procedure TdmAtualizaLic.Timer1Timer(Sender: TObject);
var S: TnxSession;
begin
  Timer1.Enabled := False;
  try
    try
      ObtemNovaLic;
    except
    end;
  finally
    Timer1.Enabled := True;
  end;  
end;

function TdmAtualizaLic.UpgradeNex(aTrocaHD: Boolean; aSenha: String): String;
var 
  V: Variant;
  S, aCE, aSN: String;
  SL: TStrings;
begin
{$I crypt_start.inc}
  Result := '';
  if not Conecta then raise exception.Create('Não foi possível conectar ao servidor de registro');
  try
    if aTrocaHD then 
      S := 'TROCAHD' else
      S := 'UPGRADENEX';
    RegistroGlobal.CodEquipSerial(aCE, aSN);  
    V := mwCli.Request('REGISTRO', '2.00', S, [RegistroGlobal.CodLoja, aSenha, aCE]);
    if (V[0] = 'OK') then begin
      Result := V[2];
      if (RegistroGlobal.CodLoja<>V[1]) or (RegistroGlobal.StringChaves<>V[2]) then begin
        if Pos(ChaveCybermgr, Result)>0 then
          RegistroGlobal.StringChaves := '' else
          RegistroGlobal.StringChaves := V[2];
        RegistroGlobal.SalvaArqPadrao;
      end;
    end else
      Raise Exception.Create(V[0]);
  finally
    mwTransp.Active := False;
  end;
{$I crypt_end.inc}
end;

end.
