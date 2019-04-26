{$I NEX.INC}

unit ncServAtualizaLic_Indy;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  SysUtils,  DateUtils, ncErros, Classes, 
  Variants, nxDB, SyncObjs,
  Windows, Messages, ExtCtrls, uLicEXECryptor,
  DB, nxllComponent,
  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type

  TdmAtualizaLic = class(TDataModule)
    Timer1: TTimer;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
//    FReg : TRegistro;
    { Private declarations }
    FRes: TStrings;
  public
    function GetApp: Boolean;
  
    function ChecaConta(RaiseEx: Boolean = False): String;

    { Public declarations }
  end;

  TThreadAtualizaLic = class ( TThread )
  protected
    procedure Execute; override;
  public 
    constructor Create;   
  end;

  TDadosAutoconn = class
  private
    FCS : TCriticalSection;
    FComputerName : String;
    FIPs : String;
    function GetComputerName: String;
    function GetIPs: String;
    procedure SetComputerName(const Value: String);
    procedure SetIPs(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    property ComputerName: String
      read GetComputerName write SetComputerName;

    property IPs: String
      read GetIPs write SetIPs;   
  end;

  procedure PostAppUpdate(sl: TStrings);

  function GetApp(const aFromAdmin: Boolean = True): String;
  

var
  dmAtualizaLic: TdmAtualizaLic;
  hndNotify    : HWND = 0;
  gDadosAutoconn : TDadosAutoconn;
  SendAutoConnInfo : Boolean = True;
  
implementation

uses
  JTimer, ncClassesBase, ncSyncLic, ncDebug, ncMsgCom, md5, nexUrls;

{$R *.dfm}

const  
  TempoTimer = 5{m}* 60{s} * 1000{ms};

threadvar  
  NextAppTime : Cardinal;  
  
function GetApp(const aFromAdmin: Boolean = True): String;
var DM : TdmAtualizaLic;
begin
  DM := TdmAtualizaLic.Create(nil);
  try
    if DM.GetApp then 
      Result := DM.FRes.Text else
      Result := '';
  finally
    DM.Free;
  end;
end;

function YYYYMMDDToDate(S: String): TDateTime;
var D, M, Y: Word;
begin
  Result := 0;
  Y := StrToIntDef(Copy(S, 1, 4), 0);
  M := StrToIntDef(Copy(S, 6, 2), 0);
  D := StrToIntDef(Copy(S, 9, 2), 0);
  if Y<1 then Exit;
  if (M<1) or (M>12) then Exit;
  if (D<1) or (DaysInAMonth(Y, M)<D) then Exit;
  try
    Result := EncodeDate(Y, M, D);
  except
  end;
end;

procedure PostAppUpdate(sl: TStrings);
var 
  P : TmsgPubPar;
  I : Integer;
  D : TDateTime;
  B : Boolean;
  s : String;
  aChaves: String;
begin
  aChaves := sl.Values['Chaves'];
  if RegistroGlobal.ChavesOk(aChaves) then begin
    DebugMsg('ncServAtualizaLic_Indy.PostAppUpdate - App Text: ' + sl.Text); // do not localize
    RegistroGlobal.StringChaves := aChaves;
    RegistroGlobal.BoletosPendentes := StrToIntDef(sl.Values['BP'], 0); // do not localize
    RegistroGlobal.JaFoiPremium := SameText(sl.Values['JFP'], 'S'); // do not localize
    if RegistroGlobal.Conta='' then
      RegistroGlobal.Conta := sl.Values['conta']; // do not localize
    RegistroGlobal.SalvaArqPadrao;
    PostMessage(handleFrmPri, wm_user+1, 0, 0);
  end;


  if hndNotify>0 then begin
    P := TmsgPubPar.Create;

    try
      if (Trim(sl.Values['BRT'])>'') then begin // do not localize
        I := StrToIntDef(sl.Values['BRT'], 0); // do not localize
        if (I>0) or (I<>gConfig.BRT) then
          P.pbBRT := I;
      end;

      if (Trim(sl.Values['DTol'])>'') then begin // do not localize
        I := StrToIntDef(sl.Values['DTol'], 0); // do not localize
        if (I>0) or (I<>gConfig.DTol) then
          P.pbDTol := I;
      end;

      if (Trim(sl.Values['PreLib'])>'') then begin // do not localize
        B := StrToBool(sl.Values['PreLib']);
        if (B<>gConfig.PreLib) then
          P.pbPreLib := B;
      end;  

      if (Trim(sl.Values['AlertaAss'])>'') then begin // do not localize
        B := StrToBool(sl.Values['AlertaAss']);
        if (B<>gConfig.AlertaAssinatura) then
          P.pbAlertaAss := B;
      end;        

      D := YYYYMMDDToDate(sl.Values['DVA']);
      if (D<>gConfig.DVA) then
        P.pbDVA := D;
      
      if (Trim(sl.Values['ExCookie'])>'') then begin // do not localize
        B := StrToBool(sl.Values['ExCookie']);
        if (B<>gConfig.ExCookie) then
          P.pbExCookie := B;
      end;
  
      if (Trim(sl.Values['HPOpenBef'])>'') then begin // do not localize
        B := SameText(sl.Values['HPOpenBef'], 'S'); // do not localize
        if (B<>gConfig.HPOpenBef) then
          P.pbHPOpenBef := B;
      end;

      if not SameText(sl.Values['HPUrl'], gConfig.HomePage_Url) then  // do not localize
        P.pbHPURL := sl.Values['HPUrl']; // do not localize

      if not SameText(sl.Values['TbUrl'], gConfig.Toolbar_Url) then  // do not localize
        P.pbTbUrl := sl.Values['TbUrl']; // do not localize

      if not SameText(sl.Values['SkyUrl'], gConfig.Sky_Url) then  // do not localize
        P.pbSkyUrl := sl.Values['SkyUrl']; // do not localize

      if not SameText(sl.Values['banners'], gConfig.Banners) then
        P.pbBanners := sl.Values['banners'];

      if not SameText(sl.Values['botoes'], gConfig.Botoes) then
        P.pbBotoes := sl.Values['botoes'];
          
      B := not SameText(sl.Values['HPTab'], 'N'); // do not localize
      if B<>gConfig.HomePage_Tab then 
        P.pbHPTab := B;
    finally
      if P.AllNull then
        P.Free 
      else
        PostMessage(hndNotify, wm_user+2, Integer(P), 0);
    end;
  end;

end;



function LinhasPV(S: String): String;
var 
  I : Integer;

procedure Add(aLinha: String);
begin
  aLinha := Trim(aLinha);
  if aLinha='' then Exit;
  if Result>'' then
    Result := Result +';';
  Result := Result + aLinha;
end;

begin
  Result := '';
  with TStringList.Create do 
  try
    Text := S;
    for I := 0 to Count - 1 do Add(Strings[I]);
  finally
    Free;
  end;
end;  

procedure TdmAtualizaLic.DataModuleCreate(Sender: TObject);
begin
  FRes := TStringList.Create;
end;

procedure TdmAtualizaLic.DataModuleDestroy(Sender: TObject);
begin
  FRes.Free;
end;

function TdmAtualizaLic.GetApp: Boolean;
var 
  aCE, aSN, aKey, aUrl: String;
  H : TIdHttp;

  S: String;

  s1, s2: String;

procedure Add(aPar, aValue: String);
begin
  if S>'' then S := S + '&';
  S := S + aPar+'='+aValue;
end;
  
begin
{$I crypt_start.inc}
  Result := False;
  S := '';

  DebugMsg('TdmAtualizaLic.GetApp - 1'); // do not localize
    
  if LadoServidor then begin
    RegistroGlobal.CodEquipSerial(aCE, aSN);
    Add('conta', RegistroGlobal.Conta);
    Add('codequip', aCE);
    if SendAutoConnInfo then begin
      Add('ComputerName', gDadosAutoconn.ComputerName);
      Add('IPLocal', LinhasPV(gDadosAutoconn.IPs));
    end;
    aUrl := 'contas_app_server';
  end else begin
    Add('conta', gConfig.Conta);
    Add('fromadmin', '1');
    aUrl := 'contas_app_admin';
  end;  
    
  Add('versao', VerProg);
  aKey := IntToStr(Random(99999999));
  Add('key', aKey);
  Add('sw', '0');
  
  H := TidHttp.Create(nil);
  try
    H.HandleRedirects := True;
    DebugMsg('TdmAtualizaLic.GetApp - Parâmetros: '+S);
    try
      FRes.Text := H.Get(gUrls.Url(aUrl, S));
      NextAppTime := gUrls.AppTimeMS;
    except
      NextAppTime := gUrls.AppRetryMS;
      raise;
    end;
    S := FRes.Text;
    DebugMsg('TdmAtualizaLic.GetApp - Resposta:'+S);
  finally
    H.Free;
  end;
  s1 := GetMD5Str(aKey+'aksdjhWEIUYWAEKjhDfsdfzOIasdm');
  s2 := FRes.Values['key'];
  Result := SameText(s1, s2);
  if not Result then 
    DebugMsg('TdmAtualizaLic.GetApp - key invalida - servidor: '+s2+' - programa: '+s1);
{$I crypt_end.inc}
end;

function TdmAtualizaLic.ChecaConta(RaiseEx: Boolean): String;
begin
{$I crypt_start.inc}
  try
    if Self.GetApp then begin
      Result := FRes.Values['Chaves'];
      PostAppUpdate(FRes);
    end;  
  except
    if RaiseEx then
      Raise;
  end;
{$I crypt_end.inc}
end;                                                 

function StrToBool(S: String): Boolean;
begin
  Result := SameText(S, 'S') or (StrToIntDef(S, 0)>0) or SameText(S, 'Y');
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
      DebugMsgEsp('TThreadAtualizaLic.Execute - E.message: ' + E.Message, False, True); // do not localize
  end;
end;

procedure TdmAtualizaLic.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
    try
      NextAppTime := gUrls.AppTimeMS;
      ChecaConta;
    except
      On E: Exception do 
        DebugMsgEsp('TdmAtualizaLic.Timer1Timer - Exception: '+E.Message, False, True);
    end;
  finally
    Timer1.Interval := NextAppTime;
    DebugMsg('TdmAtualizaLic.Timer1.Interval: ' + IntToStr(Timer1.Interval));
    Timer1.Enabled := True;
  end;  
end;

{ TDadosAutoconn }

constructor TDadosAutoconn.Create;
begin
  FCS := TCriticalSection.Create;
  FComputerName := '';
  FIPs := '';
end;

destructor TDadosAutoconn.Destroy;
begin
  FCS.Free;
  inherited;
end;

function TDadosAutoconn.GetComputerName: String;
begin
  FCS.Enter;
  try
    Result := FComputerName;
  finally
    FCS.Leave;
  end;
end;

function TDadosAutoconn.GetIPs: String;
begin
  FCS.Enter;
  try
    Result := FIPs;
  finally
    FCS.Leave;
  end;
end;

procedure TDadosAutoconn.SetComputerName(const Value: String);
begin
  FCS.Enter;
  try
    FComputerName := Value;
  finally
    FCS.Leave;
  end;
end;

procedure TDadosAutoconn.SetIPs(const Value: String);
begin
  FCS.Enter;
  try
    FIPs := Value;
  finally
    FCS.Leave;
  end;
end;

initialization
  gDadosAutoconn := TDadosAutoconn.Create;

finalization
  gDadosAutoconn.Free;  

end.

