{$I NEX.INC}

unit ncServAtualizaLic;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  SysUtils, ncErros, Classes, 
  Variants, nxDB, SyncObjs,
  Windows, Messages, ExtCtrls, uLicEXECryptor,
  DB, nxllComponent, rtcInfo, rtcConn, rtcDataCli, rtcHttpCli,
  rtcFunction, rtcCliModule;

type

  TdmAtualizaLic = class(TDataModule)
    Timer1: TTimer;
    HC: TRtcHttpClient;
    rcmApp: TRtcClientModule;
    resChecaConta: TRtcResult;
    resAtivar: TRtcResult;
    res: TRtcResult;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure resChecaContaReturn(Sender: TRtcConnection; Data,
      Result: TRtcValue);
    procedure resChecaContaRequestAborted(Sender: TRtcConnection; Data,
      Result: TRtcValue);
    procedure HCConnectError(Sender: TRtcConnection; E: Exception);
    procedure HCConnectFail(Sender: TRtcConnection);
    procedure HCConnect(Sender: TRtcConnection);
  private
//    FReg : TRegistro;
    { Private declarations }
    FRes: TStrings;
    procedure ResChave(aChave: String);
  public
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

var
  dmAtualizaLic: TdmAtualizaLic;
  hndNotify    : HWND = 0;
  gDadosAutoconn : TDadosAutoconn;
  SendAutoConnInfo : Boolean = True;
  

const
  SvcName = 'CONTAS'; 
  SvcVer  = '3.00'; 

implementation

uses
  JTimer, ncClassesBase, ncSyncLic, ncDebug, ncMsgCom, md5;

{$R *.dfm}

const  
  TempoTimer = 5{m}* 60{s} * 1000{ms};

function SoDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;  

function yyyymmddtodate(S: String): TDateTime;
begin
  S := SoDig(S);
  if S='' then
    Result := 0 else
    Result := EncodeDate(StrToInt(Copy(S, 5, 4)),
                         StrToInt(Copy(S, 3, 2)),
                         StrToInt(Copy(S, 1, 2)));
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

procedure TdmAtualizaLic.HCConnect(Sender: TRtcConnection);
begin
  DebugMsg('TdmAtualizaLic.HCConnect OK'); // do not localize
end;

procedure TdmAtualizaLic.HCConnectError(Sender: TRtcConnection; E: Exception);
begin
  DebugMsg('TdmAtualizaLic.HCConnectError - E.Msg: ' + E.Message); // do not localize
end;

procedure TdmAtualizaLic.HCConnectFail(Sender: TRtcConnection);
begin
  DebugMsg('TdmAtualizaLic.HCConnectFail'); // do not localize
end;

function TdmAtualizaLic.ChecaConta(RaiseEx: Boolean): String;
var aCE, aSN, aKey: String;
begin
{$I crypt_start.inc}
  try
    Result := '';

    DebugMsg('TdmAtualizaLic.ChecaConta2 - 1'); // do not localize
    
    with rcmApp, Data do begin
      RegistroGlobal.CodEquipSerial(aCE, aSN);
      with NewFunction('checaconta') do begin // do not localize
        aKey := IntToStr(Random(99999999));
        asString['key'] := aKey; // do not localize
        asString['conta'] := RegistroGlobal.Conta; // do not localize
        asString['maq'] := IntToStr(MaxMaquinas); // do not localize
        asString['versao'] := VerProg; // do not localize
        asString['codequip'] := aCE; // do not localize
        if SendAutoConnInfo then begin
          asString['ComputerName'] := gDadosAutoconn.ComputerName; // do not localize
          asString['IPLocal'] := gDadosAutoconn.IPs; // do not localize
        end;
      end;
//      FRes.Text := '';
      Call(resChecaConta);
      DebugMsg('TdmAtualizaLic.ChecaConta2 - FRes.Text: ' + FRes.Text); // do not localize
      if SameText(GetMD5Str(aKey+'aksdjhWEIUYWAEKjhDfsdfzOIasdm'), FRes.Values['key']) then begin // do not localize
        Result := FRes.Values['Chaves']; // do not localize
        ResChave(Result);
      end;
    end;  
    HC.Disconnect;
  except
    if RaiseEx then
      Raise;
  end;
{$I crypt_end.inc}
end;

procedure TdmAtualizaLic.ResChave(aChave: String);
var  
  P : TmsgPubPar;
  I : Integer;
  B : Boolean;
  D : TDateTime;
  s : String;
begin
  if RegistroGlobal.ChavesOk(aChave) then begin
    DebugMsg('TdmAtualizaLic.ResChave - FRes.Text: ' + FRes.Text); // do not localize
    RegistroGlobal.StringChaves := aChave;
    RegistroGlobal.BoletosPendentes := StrToIntDef(FRes.Values['BP'], 0); // do not localize
    RegistroGlobal.JaFoiPremium := SameText(FRes.Values['JFP'], 'S'); // do not localize
    if RegistroGlobal.Conta='' then
      RegistroGlobal.Conta := FRes.Values['conta']; // do not localize
    RegistroGlobal.SalvaArqPadrao;
  end;
        
  if hndNotify>0 then begin
    P := TmsgPubPar.Create;

    try
      if (Trim(FRes.Values['BRT'])>'') then begin // do not localize
        I := StrToIntDef(FRes.Values['BRT'], 0); // do not localize
        if (I>0) or (I<>gConfig.BRT) then
          P.pbBRT := I;
      end;

      if (Trim(FRes.Values['DTol'])>'') then begin // do not localize
        I := StrToIntDef(FRes.Values['DTol'], 0); // do not localize
        if (I>0) or (I<>gConfig.DTol) then
          P.pbDTol := I;
      end;

      if (Trim(FRes.Values['PreLib'])>'') then begin // do not localize
        B := StrToBool(FRes.Values['PreLib']);
        if (B<>gConfig.PreLib) then
          P.pbPreLib := B;
      end;  

      if (Trim(FRes.Values['AlertaAss'])>'') then begin // do not localize
        B := StrToBool(FRes.Values['AlertaAss']);
        if (B<>gConfig.AlertaAssinatura) then
          P.pbAlertaAss := B;
      end;        

      D := YYYYMMDDToDate(FRes.Values['DVA']);
      if (D<>gConfig.DVA) then
        P.pbDVA := D;
      
      if (Trim(FRes.Values['ExCookie'])>'') then begin // do not localize
        B := StrToBool(FRes.Values['ExCookie']);
        if (B<>gConfig.ExCookie) then
          P.pbExCookie := B;
      end;
  
      if (Trim(FRes.Values['HPOpenBef'])>'') then begin // do not localize
        B := SameText(FRes.Values['HPOpenBef'], 'S'); // do not localize
        if (B<>gConfig.HPOpenBef) then
          P.pbHPOpenBef := B;
      end;

      if not SameText(FRes.Values['HPUrl'], gConfig.HomePage_Url) then  // do not localize
        P.pbHPURL := FRes.Values['HPUrl']; // do not localize

      if not SameText(FRes.Values['TbUrl'], gConfig.Toolbar_Url) then  // do not localize
        P.pbTbUrl := FRes.Values['TbUrl']; // do not localize

      if not SameText(FRes.Values['SkyUrl'], gConfig.Sky_Url) then  // do not localize
        P.pbSkyUrl := FRes.Values['SkyUrl']; // do not localize

      if not SameText(FRes.Values['banners'], gConfig.Banners) then
        P.pbBanners := FRes.Values['banners'];

      if not SameText(FRes.Values['botoes'], gConfig.Botoes) then
        P.pbBotoes := FRes.Values['botoes'];
          
      B := not SameText(FRes.Values['HPTab'], 'N'); // do not localize
      if B<>gConfig.HomePage_Tab then 
        P.pbHPTab := B;
        
          
    finally
      if P.AllNull then
        P.Free else
        PostMessage(hndNotify, wm_user+2, Integer(P), 0);
    end;
  end;
end;

procedure TdmAtualizaLic.resChecaContaRequestAborted(Sender: TRtcConnection;
  Data, Result: TRtcValue);
begin
  DebugMsg('TdmAtualizaLic.resChecaContaRequestAborted - '+Data.AsText+' - Result: '+Result.AsText); // do not localize

  FRes.Text := '';
end;

procedure TdmAtualizaLic.resChecaContaReturn(Sender: TRtcConnection; Data,
  Result: TRtcValue);
var S: String;  
begin
  S := Result.AsString;
  if S='asdasdasd' then Exit;

  DebugMsg('TdmAtualizaLic.resChecaContaReturn - result: '+Result.asString); // do not localize

  FRes.Text := Result.asString
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
      DebugMsgEsp('TThreadAtualizaLic.Execute - E.message: ' + E.Message, False, True); // do not localize
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

