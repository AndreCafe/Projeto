unit ncServAtualizaLic;

interface

uses
  SysUtils, ncErros, Classes, kbmMWCustomTransport, kbmMWClient,
  kbmMWHTTPStdTransStream, Variants, nxDB,
  kbmMWTCPIPIndyClientTransport, Windows, Messages, ExtCtrls, uLicEXECryptor,
  DB, nxllComponent, uRSAss, rtcInfo, rtcConn, rtcDataCli, rtcHttpCli,
  rtcFunction, rtcCliModule;

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
    HC: TRtcHttpClient;
    rcmApp: TRtcClientModule;
    resChecaConta: TRtcResult;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure resChecaContaReturn(Sender: TRtcConnection; Data,
      Result: TRtcValue);
    procedure resChecaContaRequestAborted(Sender: TRtcConnection; Data,
      Result: TRtcValue);
  private
//    FReg : TRegistro;
    { Private declarations }
    FRes: TStrings;
    function SalvaEst(aConta, aCodEquip: String; 
                      aData: TDateTime; 
                      aCaixa: Integer; 
                      aURLs: Integer;
                      aQtdSessoes: Integer;
                      aTempoSessoes: Double;
                      aRes: String;
                      aSearch: String): Boolean;
    procedure PubEst(aConta, aCodEquip: String);
    function Req(AFunc: String; const Args : Array of Variant): Variant;
  public
    function Conecta(RaiseEx: Boolean = False): Boolean;
    function ChecaConta(RaiseEx: Boolean = False): String;
    function ChecaConta1(RaiseEx: Boolean = False): String;
    function ChecaConta2(RaiseEx: Boolean = False): String;
    function UpgradeNex(aTrocaHD: Boolean; aSenha: String): String;

    function ObtemContaPorEmail(aEmail: String): Boolean;
    function ObtemContaPorEquip(aCodEquip: String): String;
    function ObtemSenha(aConta: String): String;
    procedure ObtemParamAss(var sOqueE, sTermos: String; var A : TArrayAssinatura);

    function Ativar(aConta, aCodAtivacao: String): String;

    procedure AlterarSenha(aConta, aAtual, aNova: String);
    procedure AtualizaDadosConta(aConta, aSenha, aDados: String);
                             
    procedure CriarConta(S: String);
    function ObtemDadosCobranca(aConta, aSenha: String): String;
    function ObtemDadosConta(aConta, aSenha: String): String;
    procedure ObtemBoletos(aConta, aSenha: String; aPend: Boolean; var D: TDadosEmissaoBol; var A: TArrayBoleto);
    function CancelaBoleto(aConta, aSenha: String; aID: Integer): TDateTime;
    
    procedure Assinar(aConta, aSenha: String; aMeses: Byte; aDadosCobranca: String; var D: TDadosEmissaoBol; var B : TDadosBoleto);
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
  hndNotify    : HWND = 0;
  

const
  SvcName = 'CONTAS'; 
  SvcVer  = '3.00'; 

implementation

uses
  JTimer, ncClassesBase, ncSyncLic, ncDebug, ncMsgCom;

{$R *.dfm}

const  
  TempoTimer = 5{m}* 60{s} * 1000{ms};

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
  SetLength(HostRegistro, 3);
  HostRegistro[0] := 'registro.nextar.com.br';
  HostRegistro[1] := 'joaoborges.dyndns.org';
  HostRegistro[2] := 'contas.nextar.com.br';
  
  while (I < High(HostRegistro)) and (not Result) do
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
  FRes := TStringList.Create;
//  FReg := TRegistro.Create;
end;

procedure TdmAtualizaLic.DataModuleDestroy(Sender: TObject);
begin
  FRes.Free;
//  FReg.Free;
end;

procedure TdmAtualizaLic.ObtemBoletos(aConta, aSenha: String; aPend: Boolean;
  var D: TDadosEmissaoBol; var A: TArrayBoleto);
var V: Variant;  
begin
  SetLength(A, 0);
  Conecta(True);
  V := Req('ObtemBoletos', [aConta, aSenha, aPend]);
  if V[0]='OK' then begin
    VariantToDadosEmissaoBol(V[1], D);
    VariantToArrayBoleto(V[2], A);
  end else
    Raise ENexCafe.Create(V[0]);
end;

function TdmAtualizaLic.ObtemContaPorEmail(aEmail: String): Boolean;
var V: Variant;
begin
{$I crypt_start.inc}
  Result := False;
  if not Conecta(True) then Exit;
  V := Req('OBTEMCONTAPOREMAIL', [aEmail, VerProg]);
  Result := (V[0]='OK') and (V[1]>'');
{$I crypt_end.inc}
end;

function TdmAtualizaLic.ObtemContaPorEquip(aCodEquip: String): String;
var V: Variant;
begin
{$I crypt_start.inc}
  Result := '';
  if not Conecta(True) then Exit;
  V := Req('OBTEMCONTAPOREQUIP', [aCodEquip, VerProg]);
  if V[0]='OK' then
    Result := V[1] else
    Result := '';
{$I crypt_end.inc}
end;

function TdmAtualizaLic.ObtemDadosConta(aConta, aSenha: String): String;
var V: Variant;
begin
  Conecta(True);
  V := Req('OBTEMDADOSCONTA', [aConta, aSenha]);
  if (V[0] = 'OK')  then 
    Result := V[1] else
    Raise ENexCafe.Create(V[0]);
end;

function TdmAtualizaLic.ObtemDadosCobranca(aConta, aSenha: String): String;
var V: Variant;
begin
  Conecta(True);
  V := Req('OBTEMDADOSCOBRANCA', [aConta, aSenha]);
  if (V[0] = 'OK')  then 
    Result := V[1] else
    Raise ENexCafe.Create(V[0]);
end;

procedure TdmAtualizaLic.ObtemParamAss(var sOqueE, sTermos: String;
  var A: TArrayAssinatura);
var V: Variant;  
begin
  SetLength(A, 0);
  sOqueE := '';
  sTermos := '';
  Conecta(True);
  V := Req('ObtemParamAss', []);
  sOqueE := V[0];
  sTermos := V[1];
  VariantToArrayAssinatura(V[2], A);
end;

procedure TdmAtualizaLic.AlterarSenha(aConta, aAtual, aNova: String);
var V: Variant;  
begin
  Conecta(True);
  V := Req('AlterarSenha', [aConta, aAtual, aNova]);
  if V[0]<>'OK' then 
    Raise ENexCafe.Create(V[0]);
end;

procedure TdmAtualizaLic.Assinar(aConta, aSenha: String; aMeses: Byte; aDadosCobranca: String;
  var D: TDadosEmissaoBol; var B: TDadosBoleto);
var V: Variant;  
begin
  Conecta(True);
  V := Req('Assinar', [aConta, aSenha, aMeses, aDadosCobranca]);
  if V[0]='OK' then begin
    VariantToDadosEmissaoBol(V[1], D);
    VariantToBoleto(V[2], B);
    if RegistroGlobal.BoletosPendentes<1 then begin
      RegistroGlobal.BoletosPendentes := 1;
      RegistroGlobal.SalvaArqPadrao;
    end;
  end else
    Raise ENexCafe.Create(V[0]);
end;

function TdmAtualizaLic.Ativar(aConta, aCodAtivacao: String): String;
var 
  V: Variant;
  aCE, aSN: String;
begin
{$I crypt_start.inc}
  Result := '';
  if not Conecta(True) then Exit;
  V := Req('ATIVARCONTA', [aConta, aCodAtivacao]);
  if (V[0] = 'OK') then begin
    RegistroGlobal.CodEquipSerial(aCE, aSN);
    Result := V[2];
    if RegistroGlobal.ChavesOk(Result) then
    begin
       RegistroGlobal.StringChaves := V[2];
       RegistroGlobal.BoletosPendentes := V[3];  
       RegistroGlobal.JaFoiPremium := V[4];
       RegistroGlobal.SalvaArqPadrao;
    end;
  end else
    raise ENexCafe.Create(V[0]);
{$I crypt_end.inc}
end;

procedure TdmAtualizaLic.AtualizaDadosConta(aConta, aSenha, aDados: String);
var V: Variant;  
begin
  Conecta(True);
  V := Req('AtualizaDadosConta', [aConta, aSenha, aDados]);
  if V[0]<>'OK' then 
    Raise ENexCafe.Create(V[0]);
end;

function TdmAtualizaLic.CancelaBoleto(aConta, aSenha: String; aID: Integer): TDateTime;
var V: Variant;  
begin
  Conecta(True);
  V := Req('CancelarBoleto', [aConta, aSenha, aID]);
  if V[0]='OK' then 
    Result := V[1] else
    Raise ENexCafe.Create(V[0]);
end;

function TdmAtualizaLic.ChecaConta(RaiseEx: Boolean): String;
begin
  Result := ChecaConta2(RaiseEx);
end;

function TdmAtualizaLic.ChecaConta1(RaiseEx: Boolean = False): String;
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
    V := Req('CHECACONTA', [RegistroGlobal.Conta, VerProg, MaxMaquinas]);
    if (V[0] = 'OK') then begin
      Result := V[2];
      if RegistroGlobal.ChavesOk(Result) then
      begin
        RegistroGlobal.StringChaves := V[2];
        RegistroGlobal.BoletosPendentes := V[3];  
        RegistroGlobal.JaFoiPremium := V[4];
        RegistroGlobal.SalvaArqPadrao;
      end;
{        if not RaiseEx then
          PubEst(RegistroGlobal.CodLoja, aCE); }
    end else
      if RaiseEx then Raise ENexCafe.Create(V[0]);
         
    mwTransp.Active := False;
  except
    if RaiseEx then
      Raise;
  end;
{$I crypt_end.inc}
end;

function TdmAtualizaLic.ChecaConta2(RaiseEx: Boolean): String;
var 
  V: Variant;
  S: String;
  SL: TStrings;
  I : Integer;
  B : Boolean;
  aCE, aSN: String;
  P : PmsgPubPar;
begin
{$I crypt_start.inc}
  try
    Result := '';
    with rcmApp, Data do begin
      RegistroGlobal.CodEquipSerial(aCE, aSN);
      with NewFunction('checaconta') do begin
        asString['conta'] := RegistroGlobal.Conta;
        asString['maq'] := IntToStr(MaxMaquinas);
        asString['versao'] := VerProg;
      end;
      Call(resChecaConta);
      Result := FRes.Values['Chaves'];
      if RegistroGlobal.ChavesOk(Result) then
      begin
        RegistroGlobal.StringChaves := Result;
        RegistroGlobal.BoletosPendentes := StrToIntDef(FRes.Values['BP'], 0);
        RegistroGlobal.JaFoiPremium := SameText(FRes.Values['JFP'], 'S');
        
        if hndNotify>0 then begin
          New(P);
          P^.pbBRT := null;
          P^.pbHPOpenBef := null;
          P^.pbExCookie := null;

          try
          
            if (Trim(FRes.Values['BRT'])>'') then begin
              I := StrToIntDef(FRes.Values['BRT'], 0);
              if (I>0) or (I<>gConfig.BRT) then
                P^.pbBRT := I;
            end;
  
            if (Trim(FRes.Values['ExCookie'])>'') then begin
              B := SameText(FRes.Values['ExCookie'], 'S');
              if (B<>gConfig.ExCookie) then
                P^.pbExCookie := B;
            end;
  
            if (Trim(FRes.Values['HPOpenBef'])>'') then begin
              B := SameText(FRes.Values['HPOpenBef'], 'S');
              if (B<>gConfig.HPOpenBef) then
                P^.pbHPOpenBef := B;
            end;
          
          finally
            if (P^.pbBRT<>null) or (P^.pbHPOpenBef<>null) or (P^.pbExCookie<>null) then
              PostMessage(hndNotify, wm_user+2, Integer(P), 0) else
              Dispose(P);
          end;
        end;  
        RegistroGlobal.SalvaArqPadrao;
      end;
    end;  
    HC.Disconnect;
  except
    if RaiseEx then
      Raise;
  end;
{$I crypt_end.inc}
end;

function TdmAtualizaLic.ObtemSenha(aConta: String): String;
var V: Variant;
begin
{$I crypt_start.inc}
  Result := '';
  if not Conecta(True) then Exit;
  V := Req('OBTEMSENHA', [aConta, VerProg]);
  if V[0]='OK' then
    Result := V[1];
  mwTransp.Active := False;
{$I crypt_end.inc}
end;

procedure TdmAtualizaLic.PubEst(aConta, aCodEquip: String);
var S: TnxSession;
begin
  Exit;
{  try
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
          if SalvaEst(aConta, aCodEquip,
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
  end;}
end;

function TdmAtualizaLic.Req(AFunc: String;
  const Args: array of Variant): Variant;
begin
  Result := mwCli.Request(SvcName, SvcVer, AFunc, Args);
end;

procedure TdmAtualizaLic.resChecaContaRequestAborted(Sender: TRtcConnection;
  Data, Result: TRtcValue);
begin
  FRes.Text := '';
end;

procedure TdmAtualizaLic.resChecaContaReturn(Sender: TRtcConnection; Data,
  Result: TRtcValue);
begin
  FRes.Text := Result.asString
end;

procedure TdmAtualizaLic.CriarConta(S: String);
var V: Variant;
begin
{$I crypt_start.inc}
  if not Conecta then raise 
    ENexCafe.Create('Não foi possível conectar ao serviço de contas de usuário do NexCafé.'+sLineBreak+sLineBreak+
                     '- Verifique se o NexCafé está liberado em seu firewall;' + sLineBreak +
                     '- Verifique se sua conexão de internet está funcionando corretamente agora;' + sLineBreak +
                     '- Tente novamente, se o erro persistir faça contato com nossa equipe de atendimento online.');
  V := Req('CRIARCONTA', [S]);
  if V[0] <> 'OK' then raise ENexCafe.Create(V[0]);
  RegistroGlobal.Conta := V[1];
  RegistroGlobal.StringChaves := V[2];
  RegistroGlobal.SalvaArqPadrao;
{$I crypt_end.inc}
end;

function TdmAtualizaLic.SalvaEst(aConta, aCodEquip: String;
  aData: TDateTime; aCaixa, aURLs, aQtdSessoes: Integer; aTempoSessoes: Double; aRes,
  aSearch: String): Boolean;
var V: Variant;  
begin
  Conecta(True);
  V := Req('SALVAEST', [aConta, aCodEquip, aData, aCaixa, aURLs, aQtdSessoes, aTempoSessoes, aRes, aSearch]);
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
  try
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
  except
    on E: Exception do 
      DebugMsgEsp('TThreadAtualizaLic.Execute - E.message: ' + E.Message, False, True);
  end;
end;

procedure TdmAtualizaLic.Timer1Timer(Sender: TObject);
var S: TnxSession;
begin
  Timer1.Enabled := False;
  try
    try
      ChecaConta;
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
  if not Conecta then 
    raise ENexCafe.Create('Não foi possível conectar ao servidor de contas Nextar');
    
  try
    if aTrocaHD then 
      S := 'TROCAHD' else
      S := 'UPGRADENEX';
    RegistroGlobal.CodEquipSerial(aCE, aSN);  
    V := Req(S, [RegistroGlobal.Conta, aSenha, aCE]);
    if (V[0] = 'OK') then begin
      Result := V[2];
      if RegistroGlobal.ChavesOk(V[2]) then  begin
        RegistroGlobal.StringChaves := V[2];
        RegistroGlobal.BoletosPendentes := V[3];  
        RegistroGlobal.JaFoiPremium := V[4];
        RegistroGlobal.SalvaArqPadrao;
      end;
    end else
      Raise ENexCafe.Create(V[0]);
  finally
    mwTransp.Active := False;
  end;
{$I crypt_end.inc}
end;

end.
