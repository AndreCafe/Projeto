unit NR_WebServ_DM;

interface

uses
  SysUtils, Classes, nxllTransport, nxptBasePooledTransport, Messages, Windows,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, Dialogs,
  
  DB, ExtCtrls, nxdb, 
  SyncObjs,
  nxDbBase,
  nxllComponent, 
  rtcConn, rtcDataSrv, rtcHttpSrv,
  rtcInfo, uObjPool, uRSdmEmail, IdHTTP, rtcFunction, rtcSrvModule,
  LMDCustomComponent, LMDStrList;

type
  TDM = class(TDataModule)
    dpOpen: TRtcDataProvider;
    HS: TRtcHttpServer;
    dpCriaConta: TRtcDataProvider;
    dpAtivar: TRtcDataProvider;
    dpTransferir: TRtcDataProvider;
    dpBoleto: TRtcDataProvider;
    dpAssinar: TRtcDataProvider;
    dpEsqueci: TRtcDataProvider;
    dpDados: TRtcDataProvider;
    dpTrocarSenha: TRtcDataProvider;
    rsmNexServ: TRtcServerModule;
    rfgGeral: TRtcFunctionGroup;
    rfChecaConta: TRtcFunction;
    dpListaLans: TRtcDataProvider;
    dpWebTabs: TRtcDataProvider;
    dpLogoff: TRtcDataProvider;
    dpRedirAjuda: TRtcDataProvider;
    dpValidar: TRtcDataProvider;
    dpSenhaPorEmail: TRtcDataProvider;
    dpAdminPopup: TRtcDataProvider;
    dpContaAtivada: TRtcDataProvider;
    strAnalytics: TLMDStrList;
    dpContaCriada: TRtcDataProvider;
    dpCriarContaBasica: TRtcDataProvider;
    dpMailchimp_Signup: TRtcDataProvider;
    dpUpdate: TRtcDataProvider;
    dpGetAutoconnInfo: TRtcDataProvider;
    dpObtemReg: TRtcDataProvider;
    dpObtemChaveSeg: TRtcDataProvider;
    dpReconfirma: TRtcDataProvider;
    dpEsqueci2: TRtcDataProvider;
    dpSalvaInfoCampanha: TRtcDataProvider;
    dpObtemInfoCampanha: TRtcDataProvider;
    dpCorrigirEmail: TRtcDataProvider;
    dpVerDadosLoja: TRtcDataProvider;
    dpContaSessao: TRtcDataProvider;
    procedure DataModuleCreate(Sender: TObject);
    procedure dpOpenCheckRequest(Sender: TRtcConnection);
    procedure dpOpenDataReceived(Sender: TRtcConnection);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dpCriaContaCheckRequest(Sender: TRtcConnection);
    procedure dpCriaContaDataReceived(Sender: TRtcConnection);
    procedure dpAtivarCheckRequest(Sender: TRtcConnection);
    procedure dpAtivarDataReceived(Sender: TRtcConnection);
    procedure dpTransferirCheckRequest(Sender: TRtcConnection);
    procedure dpTransferirDataReceived(Sender: TRtcConnection);
    procedure dpBoletoCheckRequest(Sender: TRtcConnection);
    procedure dpBoletoDataReceived(Sender: TRtcConnection);
    procedure dpAssinarCheckRequest(Sender: TRtcConnection);
    procedure dpAssinarDataReceived(Sender: TRtcConnection);
    procedure dpEsqueciCheckRequest(Sender: TRtcConnection);
    procedure dpEsqueciDataReceived(Sender: TRtcConnection);
    procedure dpDadosCheckRequest(Sender: TRtcConnection);
    procedure dpDadosDataReceived(Sender: TRtcConnection);
    procedure dpTrocarSenhaCheckRequest(Sender: TRtcConnection);
    procedure dpTrocarSenhaDataReceived(Sender: TRtcConnection);
    procedure rfChecaContaExecute(Sender: TRtcConnection;
      Param: TRtcFunctionInfo; Result: TRtcValue);
    procedure dpListaLansCheckRequest(Sender: TRtcConnection);
    procedure dpListaLansDataReceived(Sender: TRtcConnection);
    procedure dpWebTabsCheckRequest(Sender: TRtcConnection);
    procedure dpWebTabsDataReceived(Sender: TRtcConnection);
    procedure dpLogoffCheckRequest(Sender: TRtcConnection);
    procedure dpLogoffDataReceived(Sender: TRtcConnection);
    procedure dpRedirAjudaCheckRequest(Sender: TRtcConnection);
    procedure dpRedirAjudaDataReceived(Sender: TRtcConnection);
    procedure dpValidarCheckRequest(Sender: TRtcConnection);
    procedure dpValidarDataReceived(Sender: TRtcConnection);
    procedure dpSenhaPorEmailCheckRequest(Sender: TRtcConnection);
    procedure dpSenhaPorEmailDataReceived(Sender: TRtcConnection);
    procedure dpAdminPopupCheckRequest(Sender: TRtcConnection);
    procedure dpAdminPopupDataReceived(Sender: TRtcConnection);
    procedure dpContaAtivadaCheckRequest(Sender: TRtcConnection);
    procedure dpContaAtivadaDataReceived(Sender: TRtcConnection);
    procedure dpContaCriadaCheckRequest(Sender: TRtcConnection);
    procedure dpContaCriadaDataReceived(Sender: TRtcConnection);
    procedure dpCriarContaBasicaCheckRequest(Sender: TRtcConnection);
    procedure dpCriarContaBasicaDataReceived(Sender: TRtcConnection);
    procedure dpMailchimp_SignupCheckRequest(Sender: TRtcConnection);
    procedure dpMailchimp_SignupDataReceived(Sender: TRtcConnection);
    procedure dpUpdateCheckRequest(Sender: TRtcConnection);
    procedure dpUpdateDataReceived(Sender: TRtcConnection);
    procedure dpGetAutoconnInfoCheckRequest(Sender: TRtcConnection);
    procedure dpGetAutoconnInfoDataReceived(Sender: TRtcConnection);
    procedure dpObtemRegCheckRequest(Sender: TRtcConnection);
    procedure dpObtemRegDataReceived(Sender: TRtcConnection);
    procedure dpObtemChaveSegCheckRequest(Sender: TRtcConnection);
    procedure dpObtemChaveSegDataReceived(Sender: TRtcConnection);
    procedure dpReconfirmaCheckRequest(Sender: TRtcConnection);
    procedure dpReconfirmaDataReceived(Sender: TRtcConnection);
    procedure dpEsqueci2CheckRequest(Sender: TRtcConnection);
    procedure dpEsqueci2DataReceived(Sender: TRtcConnection);
    procedure dpSalvaInfoCampanhaCheckRequest(Sender: TRtcConnection);
    procedure dpSalvaInfoCampanhaDataReceived(Sender: TRtcConnection);
    procedure dpObtemInfoCampanhaCheckRequest(Sender: TRtcConnection);
    procedure dpObtemInfoCampanhaDataReceived(Sender: TRtcConnection);
    procedure dpCorrigirEmailCheckRequest(Sender: TRtcConnection);
    procedure dpCorrigirEmailDataReceived(Sender: TRtcConnection);
    procedure dpVerDadosLojaCheckRequest(Sender: TRtcConnection);
    procedure dpVerDadosLojaDataReceived(Sender: TRtcConnection);
    procedure dpContaSessaoCheckRequest(Sender: TRtcConnection);
    procedure dpContaSessaoDataReceived(Sender: TRtcConnection);
    procedure HSSessionClose(Sender: TRtcConnection);
  private
    FdmOpenPool : TObjectPool;
    FdmContasPool : TObjectPool;
    FdmEmailPool : TObjectPool;
    FdmAutoconnPool : TObjectPool;
    { Private declarations }
    function CreateDMOpen: TObject;
    function CreateDMContas: TObject;
    function CreateDMEmail: TObject;
    function CreateDMAutoconn: TObject;
    procedure WriteEx(aErro: String; Sender: TRTCConnection);
    procedure Write_Exception(aException: String; Sender: TRTCConnection);
  public
    { Public declarations }
  end;

  TThreadIncOpenPages = class ( TThread )
  private
    FDM: TDM;
    FIP: String;
    FConta: String;
  protected
    procedure Execute; override;
  public
    constructor Create(aDM: TDM; aIP, aConta: String);
  end;

  TThreadSalvaUObtemLic = class ( TThread )
  private
    FDM: TDM;
    FIP: String;
    FConta: String;
  protected
    procedure Execute; override;
  public
    constructor Create(aDM: TDM; aConta, aIP: String);
  end;

  function Venceu7Dias(D: TDataset): Boolean;

  function capOk(aChallenge, aResp, aIP: String): Boolean;

  function LoadHTMLArq(aArq: String): String;
  procedure SaveArqText(aArq, aText: String);

  procedure UpdateHTML(var S: String; aID, aValue: String; aEncodeValue: Boolean = False);

  function LoginHTML(aOp: Byte; aConta, aSessao, aErro: String): String;

  function GeraCodAtivacao: String;
  
//  function GetNextAutoInc(ATableName, AFieldName, AWhere: String): Integer;

  
var
  DM: TDM;
  DBServer: String;
  slCfg : TStrings;
  SLSeq : TStrings;
  CSSeq : TCriticalSection;
  FimApp : Boolean = False;
  DisconnectAfterDone : Boolean = False;
  ScriptStr : String;
  BaseFileName : String;
  gBRT : Word = 30;
  gDiscAfterDone : Boolean = False;
  gExCookie : String = 'N';
  gDebugIncOpen : Boolean = False;
  gHPOpenBef : String = 'N';
  gHPUrl, 
  gHPPar, 
  gHPTab,
  gHPAddConta : String;
  keyLL : String = 'adskjhIASUEWRmxzZMSlkjPIEKJHGASGYakka';

  minVerFree     : Integer;
  minVerPremium  : Integer;
  minVerArq      : String;

  nRequests : Array[0..1] of Integer;  

threadvar
  TicksAccepted: Cardinal;
  
  
  
implementation

uses 
//  JwaWtsApi32,
  MD5,
  nrAutorizacao, 
  ursDMOpen, 
  uDMContas,
  uLicEXECryptor, nr_consts, nr_db_conn, nrDebug, uNR_chaveseg, nr_cc_add,
  nr_autoconn;

{$R *.dfm}


function IniFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'RegistroServ.ini';
end;

{procedure LogoffRDP;
var
  PSessionInfo: PWTS_SESSION_INFO;
  SessionInfo: WTS_SESSION_INFO;
  SessionCount,
  BuffSize: DWord;
  i,
  lstCount: Integer;
  res: boolean;
  S: String;
begin
    res := WTSEnumerateSessions(WTS_CURRENT_SERVER_HANDLE, 0, 1, PSessionInfo, SessionCount);
    if res then
      begin
        for i := 1 to SessionCount do
          begin
            SessionInfo := PWTS_SESSION_INFO(Integer(PSessionInfo) + (i-1) * SizeOf(WTS_SESSION_INFO))^;
//            if SessionInfo.State <> WTSDisconnected then Continue;
//            WTSQuerySessionInformation(WTS_CURRENT_SERVER_HANDLE, SessionInfo.SessionId, WTSUserName, UserName, BuffSize);

              S := UpperCase(SessionInfo.pWinStationName);
              if Pos('RDP-TCP#', S)>0 then
                WTSLogoffSession(WTS_CURRENT_SERVER_HANDLE, SessionInfo.SessionId, False);
              
              
            
           
          end;
      end;
    WTSFreeMemory(PSessionInfo);
end;}

function GeraCodAtivacao: String;
var 
  I : Integer;
  S : String;
begin
  S := IntToStr(Random(9999999));
  Result := '';
  for I := 1 to Length(S) do
    Result := S[I] + Result;
  while Length(Result)<7 do
    Result := Result + IntToStr(Random(9)); 
end;


function capOk(aChallenge, aResp, aIP: String): Boolean;
var 
  H : TidHttp;
  sl: TStrings;
begin
  Result := False;
  if Trim(aResp)='' then  Exit;
  H := TidHttp.Create(nil);
  try
    H.HandleRedirects := True;
    H.Port := 80;
    sl := TStringList.Create;
    try
      sl.Values['privatekey'] := capKey;
      sl.Values['remoteip'] := aIP;
      sl.Values['challenge'] := aChallenge;
      sl.Values['response'] := aResp;
      try
        sl.Text := H.Post('http://www.google.com/recaptcha/api/verify', sl);
      except
        Exit;
      end;
      Result := SameText('true', sl[0]);
    finally
      sl.Free;
    end;
  finally
    H.Free;
  end;
end;

procedure UpdateHTML(var S: String; aID, aValue: String; aEncodeValue: Boolean = False);
var P: Integer;
begin
  if aEncodeValue then
    aValue := AnsiToUTF8(aValue); 
    
  repeat
    P := Pos(aID, S);
    if P>0 then
      S := Copy(S, 1, P-1) + aValue + Copy(S, P+Length(aID), High(Integer));
  until (P<1);
end;


function EncodeText(const Str: WideString; CodePage: Word): AnsiString;
var
    len: Integer;
begin
    Result := '';
    if Str <> '' then
    begin
        len := WideCharToMultiByte(CodePage, 0, PWideChar(Str), Length(Str), nil, 0, nil, nil);
        if (len > 1) then
        begin
            SetLength(Result, len-1);
            WideCharToMultiByte(CodePage, 0, PWideChar(Str), Length(Str), PAnsiChar(Result), len, nil, nil);
        end;
    end;
end;

function LoginHTML(aOp: Byte; aConta, aSessao, aErro: String): String;
begin
  Result := LoadHTMLArq('login.html');
  case aOp of
    opTrocaHD : begin
      UpdateHTML(Result, '%titulo', 'Ativar conta NexCafé nesse computador', True);
      UpdateHTML(Result, '%instrucoes', 'Para ativar sua conta NexCafé nesse computador digite sua senha e clique em "Ativar".', True);
      UpdateHTML(Result, '%submit', 'Ativar', True);
      UpdateHTML(Result, '%action', '');
    end; 
    opAssinar, opAtualizaDadosConta : begin
      UpdateHTML(Result, '%titulo', 'Login conta NexCafé', True);
      UpdateHTML(Result, '%instrucoes', 'Para prosseguir, faça o login na sua conta NexCafé.', True);
      UpdateHTML(Result, '%submit', 'Login');
      UpdateHTML(Result, '%action', '?pg=1');
    end;
  end;

  UpdateHTML(Result, '%conta', aConta);
  UpdateHTML(Result, '%sessao', aSessao);
  UpdateHTML(Result, '%erro', aErro, True);
end;


function VenceuSemana(D: TDateTime): Boolean;
begin
  Result := (Now>D) and ((Now-D)>6);
end;

function Venceu7Dias(D: TDataset): Boolean;
begin
  Result := (D.FieldByName('Tipo').AsInteger<>taDefinitiva) and 
             VenceuSemana(D.FieldByName('Vencimento').AsDateTime);
end;

function TDM.CreateDMAutoconn: TObject;
begin
  DebugMsgEsp('TDM.CreateDM_Autoconn', False, True);
  Result := Tdm_Autoconn.Create(nil);
end;

function TDM.CreateDMContas: TObject;
begin
  DebugMsgEsp('TDM.CreateDMContas', False, True);
  Result := TdmContas.Create(nil);
end;

function TDM.CreateDMEmail: TObject;
begin
  DebugMsgEsp('TDM.CreateDMEmail', False, True);
  Result := TdmEmail.Create(nil);
end;

function TDM.CreateDMOpen: TObject;
begin
  DebugMsgEsp('TDM.CreateDMOpen', False, True);
  Result := TdmOpen.Create(nil);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  
  Start_DBConn(nil);
  FdmOpenPool := TObjectPool.Create;
  FdmOpenPool.CreateNewPoolObj := CreatedmOpen;

  FdmContasPool := TObjectPool.Create;
  FdmContasPool.CreateNewPoolObj := CreatedmContas;

  FdmEmailPool := TObjectPool.Create;
  FdmEmailPool.CreateNewPoolObj := CreatedmEmail;

  FdmAutoconnPool := TObjectPool.Create;
  FdmAutoconnPool.CreateNewPoolObj := CreateDMAutoconn;
  
  HS.Listen;

  TThread_autoconn.Create(False).FreeOnTerminate := True;
  TThread_cc_Add.Create(False).FreeOnTerminate := True;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  nr_cc_add.Terminar := True;
  nr_autoconn.Terminar := True;
  
  FdmOpenPool.Free;
  FdmContasPool.Free;
  FdmEmailPool.Free;
  FdmAutoconnPool.Free;
end;

procedure TDM.dpAtivarCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/ativar');
end;

procedure TDM.dpAtivarDataReceived(Sender: TRtcConnection);
var dm : TdmContas;
begin
  with TRTCDataServer(Sender) do
  try
    if Request.Complete then begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        with Request.Query do
          Write(dm.LinkAtivar(trim(asString['conta']), asString['codativacao'], asString['codequip'], PeerAddr, (asString['ret']<>'nohtml')));
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpAtivarDataReceived - '+Request.Query.AsString['conta']+' - '+E.message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpBoletoCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/boleto');
end;

procedure TDM.dpBoletoDataReceived(Sender: TRtcConnection);
var  
  dm : TdmContas;
  S : String;
begin
  try
    with TRTCDataServer(Sender) do
    if Request.Complete then begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        with Request.Query do 
          Write(dm.GetHTMLBoleto(StrToIntDef(asString['num'], 0), (asString['codbar']='1'), asString['chave']));
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  except
    on E: Exception do  begin
      DebugMsgEsp('TDM.dpBoletoDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpAdminPopupCheckRequest(Sender: TRtcConnection);
var S: String;
begin
  with TRTCDataServer(Sender) do begin
    S := Request.Host;
    Request.Accepted := (Request.Filename='/getmsg') or
      ((Request.Filename='/') and (SameText(S, 'nexmsg.nextar.com.br') or SameText(S, 'nexmsg.nexcafe.com.br')));
  end;
end;

procedure TDM.dpAdminPopupDataReceived(Sender: TRtcConnection);
var 
  dm: TdmContas;
  s : String;
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then
      if SameText(Request.Method, 'get') then  begin
        dm := TdmContas(FdmContasPool.GetObjFromPool);
        try
          with Request.Query do 
          S := dm.GetWebMsg(trim(asString['conta']), trim(asString['ver']));
          Write(S);
          if S='' then Sender.Disconnect;
        finally
          FdmContasPool.ReleaseObj(dm);
        end;  
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpAdminPopupDataReceived - '+E.Message, False, True);
      Sender.Disconnect;
    end;
  end;
end;

procedure TDM.dpAssinarCheckRequest(Sender: TRtcConnection);
var S: String;
begin
  with TRTCDataServer(Sender) do begin
    S := Request.Host;
    Request.Accepted := 
      (Request.Filename='/assinar') or
      ((Request.Filename='/') and (SameText(S, 'assinar.nextar.com.br') or SameText(S, 'assinar.nexcafe.com.br'))) or
      ((Request.Filename='/') and (SameText(S, 'boleto.nextar.com.br') or SameText(S, 'boleto.nexcafe.com.br')));
  end;
end;

procedure TDM.dpAssinarDataReceived(Sender: TRtcConnection);
var dm : TdmContas; S: String;
begin
  try
    with TRTCDataServer(Sender) do begin
      if not Request.Complete then Exit;

      DebugMsg(IntToStr(GetCurrentThreadID)+' - TDM.Assinar 1');
      if SameText(Request.Method, 'get') then begin
        Write(LoginHTML(opAssinar, 
                        trim(Request.Query.asString['conta']), 
                        '', ''));
      end else begin
        S := '';
        DebugMsg(IntToStr(GetCurrentThreadID)+' - TDM.Assinar 2');
        Request.Params.AddText(URL_Decode(Read));
        dm := TdmContas(FdmContasPool.GetObjFromPool);
        try
          if Request.Query.asString['pg']='1' then begin
            with Request.Params do 
            if DM.LoginAssinar(trim(asString['conta']), asString['senha'], S) then begin
              OpenSession;
              Session.KeepAlive := 600;
              UpdateHTML(S, '%sessao', Session.ID, False);
            end;
          end else begin
            if not FindSession(Request.Params.asString['sessao']) then
              S := LoginHTML(opAssinar, trim(Request.Params.asString['conta']), '', 'Sua sessão expirou. Por favor faça login novamente')
            else begin
              case StrToIntDef(Request.Query.asString['pg'], 0) of
                2 : begin
                  Session.asString['meses'] := Request.Params.asString['rgass'];
                  with Request.Params do 
                  DM.GetHTMLDados(trim(asString['conta']), asString['rgass'], S);
                end;
                
                3 : S := DM.SalvaHTMLDados(Request.Params, False);
                
                4 : 
                begin
                  with Request.Params do 
                  S := DM.ConfirmaCompra(trim(asString['conta']), asString['rgass']);
                  Session.Close;
                end
              else
                S := LoadHTMLArq('linkinvalido.html');
              end;
              UpdateHTML(S, '%sessao', Session.ID, False);
            end;
          end;
          DebugMsg(IntToStr(GetCurrentThreadID)+' - TDM.Assinar 3');
          Write(S);
        finally
          DebugMsg(IntToStr(GetCurrentThreadID)+' - TDM.Assinar 4');
          FdmContasPool.ReleaseObj(dm);
        end;
      end;
    end;
  except 
    on E: Exception do begin
      DebugMsgEsp('TDM.dpAssinarDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpContaAtivadaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := SameText(Request.Filename, '/contaativada');
end;

procedure TDM.dpContaAtivadaDataReceived(Sender: TRtcConnection);
var s : String;
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then
      if SameText(Request.Method, 'get') then  begin
        s := LoadHTMLArq('contaativada.html');
        Write(s);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpContaAtivadaDataReceived - '+E.Message, False, True);
      Sender.Disconnect;
    end;
  end;
end;

procedure TDM.dpContaCriadaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do 
    Request.Accepted := SameText(Request.Filename, '/contacriada');
end;

procedure TDM.dpContaCriadaDataReceived(Sender: TRtcConnection);
var s : String;
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then
      if SameText(Request.Method, 'get') then 
      with Request.Query do begin
        s := LoadHTMLArq('contacriada.html');
        UpdateHTML(s, '%email', asString['email']);
        UpdateHTML(s, '%ajustaconta', 'http://127.0.0.1:16201/ajustarconta?conta='+asString['email']+'&chaves='+asString['chaves']);
        Write(s);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpContaCriadaReceived - '+E.Message, False, True);
      Sender.Disconnect;
    end;
  end;
end;

procedure TDM.dpContaSessaoCheckRequest(Sender: TRtcConnection);
var S: String;
begin
  with TRTCDataServer(Sender) do 
    Request.Accepted := (Pos('scnt.nexcafe.com.br', Request.Host)>0);
end;

procedure TDM.dpContaSessaoDataReceived(Sender: TRtcConnection);
var s: string;
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then begin
        s := Request.Query.asString['conta'];
//      TThreadIncOpenPages.Create(Self, Sender.PeerAddr, s);
        Write('ok');
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpOpenDataReceived - '+E.Message, False, True);
      Sender.Disconnect;
    end;
  end;
end;

procedure TDM.dpCorrigirEmailCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do 
    Request.Accepted := (Request.Filename='/corrigiremail');
end;

procedure TDM.dpCorrigirEmailDataReceived(Sender: TRtcConnection);
var dm : TdmContas; 
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
    begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        with Request.Query do begin 
          if (not gChaves.ValidaChave(asString['chaveseg'], asString['senhaseg'])) then begin
            Write('erro=Falha de segurança no contato com o servidor de registro Nextar.');
            Exit;
          end;
          Write(dm.CorrigirEmail(asString['email'], asString['novoemail']));
        end;
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpCorrigirEmailDataReceived - '+E.Message, False, True);
      Write_Exception(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpCriaContaCheckRequest(Sender: TRtcConnection);
var S: String;
begin
  with TRTCDataServer(Sender) do begin
    S := Request.Host;
    Request.Accepted := 
       SameText(Request.Filename, '/criarconta') or SameText(Request.Filename, '/criar') or
      ((Request.Filename='/') and (SameText(S, 'criarconta.nextar.com.br') or SameText(S, 'criarconta.nexcafe.com.br')));
  end;
end;

function LoadHTMLArq(aArq: String): String;
var SL : TStringList;
begin
  if FileExists(BaseFileName+aArq) then begin
    SL := TStringList.Create;
    try
      SL.LoadFromFile(BaseFileName+aArq);
      Result := SL.Text;
    finally
      SL.Free;
    end;
  end else begin
    Result := '';
    DebugMsgEsp('LoadHTMLArq - ERRO - Arquivo não encontrado: '+aArq, False, True);
  end;
end;

procedure SaveArqText(aArq, aText: String);
var SL : TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Text := aText;
    SL.SaveToFile(BaseFileName+aArq);
  finally
    SL.Free;
  end;
end;

function getRedirCriaConta: String;
var sl : TStrings;
begin
  Result := '';
  try
    if FileExists(IniFName) then begin
      sl := TStringList.Create;
      try
        sl.LoadFromFile(IniFName);
        Result := Trim(sl.Values['RedirCriaConta']);
      finally
        sl.Free;
      end;
    end;
  except 
  end;
end;

function EmailValido(sEmail: String): Boolean;
begin
  Result := False;
  if (Pos('@', sEmail)=0) then Exit;
  Delete(sEmail, 1, Pos('@', sEmail));
  if (Pos('.', sEmail)=0) then Exit;
  Delete(sEmail, 1, Pos('.', sEmail));
  Result := (Length(sEmail)>0);
end;

procedure TDM.dpCriaContaDataReceived(Sender: TRtcConnection);
var 
  S, sEquip, sRes, sRedir : String; I: integer;
  sl: TStrings;
  dm : TdmContas;

procedure UpdateStr(aID, aValue: String);
begin
  UpdateHTML(S, aID, aValue);
end;

procedure Erro(aErroEmail, aErroSenha: String; aErroGeral: String = '');
begin
  S := LoadHTMLArq('criarconta3.html');
  UpdateStr('%erro_email', aErroEmail);
  UpdateStr('%erro_senha', aErroSenha);
  UpdateStr('%erro_geral', aErroGeral);
  with TRTCDataServer(Sender).Request.Params do begin
    UpdateStr('%email_value', asString['email']);
    UpdateStr('%email2_value', asString['email2']);
    UpdateStr('%senha_value', asString['senha']);
    UpdateStr('%senha2_value', asString['senha2']);
    UpdateStr('%prop_value', asString['prop']);
    UpdateStr('%loja_value', asString['loja']);
    UpdateStr('%tel1', asString['tel1']);
    UpdateStr('%cidade_value', asString['cidade']);
    UpdateStr('%estado_value', asString['estado']);
    UpdateStr('%codequip_value', asString['codequip']);
  end;
end;

begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then 
      if SameText(Request.Method, 'get') then begin

        sRedir := getRedirCriaConta;
        
        if sRedir>'' then begin
          Write('<html>'+sLinebreak+
                '<script>'+sLineBreak+
                'window.location = ' + QuotedStr(sRedir+'?codequip='+Request.Query.asString['codequip']) + sLineBreak +
                '</script>'+sLineBreak+
                '</html>');
          Exit;
        end;
      
        S := LoadHTMLArq('criarconta3.html');
        UpdateStr('%email_value', '');
        UpdateStr('%email2_value', '');
        UpdateStr('%senha_value', '');
        UpdateStr('%senha2_value', '');
        UpdateStr('%prop_value', '');
        UpdateStr('%loja_value', '');
        UpdateStr('%cidade_value', '');
        UpdateStr('%estado_value', '0');
        UpdateStr('%email_value', '');
        UpdateStr('%erro_email', '');
        UpdateStr('%erro_senha', '');
        UpdateStr('%erro_geral', '');
        UpdateStr('%tel1', '');
  
        UpdateStr('%codequip_value', Trim(Request.Query.asString['codequip']));
        Write(S);
      end else 
      with Request.Params do begin
        Request.Params.AddText(URL_Decode(Read));
        
        if Trim(asString['email'])='' then
          Erro('É necessário informar o seu endereço de e-mail.', '')
        else
        if not SameText(Trim(asString['email']), Trim(asString['email2'])) then
          Erro('E-mails diferentes.', '')
        else
        if not EmailValido(asString['email']) then
          Erro('O E-mail informado não é válido.', '')
        else 
        if Trim(asString['senha'])='' then
          Erro('', 'É necessário informar uma senha.')
        else
        if Trim(asString['senha'])<>Trim(asString['senha2']) then
          Erro('Senhas diferentes.', '')
        else
{        if not capOk(asString['recaptcha_challenge_field'], asString['recaptcha_response_field'], PeerAddr) then 
          Erro('', '', 'Você não informou corretamente as palavras contidas na imagem de validação.')
        else}
        if asString['estado']='0' then 
          Erro('', '', 'É necessário selecionar o seu ESTADO.')
        else begin
          dm := TdmContas(FdmContasPool.GetObjFromPool);
          try
            sRes := dm.CriarConta(asString['email'], 
                                  asString['senha'],
                                  asString['prop'], 
                                  asString['loja'], 
                                  asString['cidade'],
                                  asString['estado'], 
                                  asString['codequip'],
                                  Sender.PeerAddr,
                                  asString['tel1'],
                                  asString['tipo'],
                                  asString['atividade']);
            if sRes>'' then
              Erro('', '', sRes) 
            else 
            begin
               S := '<html><head>'+strAnalytics.Items.Text+'</head><body><script language="javascript">window.location.href = '+QuotedStr(
                   'http://contas.nextar.com.br/contacriada?email='+asString['email']+'&chaves='+ChaveAtivar)+';'+
                   '</script></body></html>';
            end;
          finally
            FdmContasPool.ReleaseObj(dm);
          end;
        end;
        Write(S);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpCriarContaDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpCriarContaBasicaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := SameText(Request.Filename, '/criarcontabasica');
end;

procedure TDM.dpCriarContaBasicaDataReceived(Sender: TRtcConnection);
var dmc : TdmContas; S: String;
begin
  try
    with TRTCDataServer(Sender) do begin
      S := Request.Method;
      if Request.Complete then
      if SameText(S, 'get') then begin  
        dmc := TdmContas(FdmContasPool.GetObjFromPool);
        try
          with Request.Query do
            S := dmc.CriarContaBasica(Trim(URL_Decode(asString['email'])), 
                                      UTF8ToAnsi(URL_Decode(asString['senha'])), 
                                      URL_Decode(asString['tel']),
                                      URL_Decode(asString['tipotel']),                                      
                                      UTF8ToAnsi(URL_Decode(asString['nome'])),
                                      UTF8ToAnsi(URL_Decode(asString['loja'])),
                                      UTF8ToAnsi(URL_Decode(asString['codequip'])), 
                                      UTF8ToAnsi(URL_Decode(asString['campanha'])),
                                      UTF8ToAnsi(URL_Decode(asString['utmccn'])),
                                      UTF8ToAnsi(URL_Decode(asString['utmcct'])),
                                      UTF8ToAnsi(URL_Decode(asString['utmctr'])),
                                      UTF8ToAnsi(URL_Decode(asString['utmcmd'])),
                                      UTF8ToAnsi(URL_Decode(asString['utmcsr'])),
                                      UTF8ToAnsi(URL_Decode(asString['preregip'])),
                                      UTF8ToAnsi(URL_Decode(asString['optin'])),
                                      UTF8ToAnsi(URL_Decode(asString['atividade'])),
                                      asString['tipo']);
        finally
          FdmContasPool.ReleaseObj(dmc);
        end;
        Write(S);  
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpCriarContaBasicaDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpDadosCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/atualizardados');
end;

procedure TDM.dpDadosDataReceived(Sender: TRtcConnection);
var dm : TdmContas; S: String;
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then
      if SameText(Request.Method, 'get') then begin
        Write(LoginHTML(opAtualizaDadosConta, 
                        trim(Request.Query.asString['conta']), 
                        '', ''));
      end else begin
        S := '';
        Request.Params.AddText(URL_Decode(Read));
        dm := TdmContas(FdmContasPool.GetObjFromPool);
        try
          if Request.Query.asString['pg']='1' then begin
            with Request.Params do 
            if DM.GetHTMLDados(trim(asString['conta']), '', S, asString['senha']) then begin
              OpenSession;
              Session.KeepAlive := 600;
              UpdateHTML(S, '%sessao', Session.ID);
            end;
          end else begin
            if not FindSession(Request.Params.asString['sessao']) then
              S := LoginHTML(opAtualizaDadosConta, trim(Request.Params.asString['conta']), '', 'Sua sessão expirou. Por favor faça login novamente')
            else begin
              S := DM.SalvaHTMLDados(Request.Params, True);
              Session.Close;
            end;
          end;
          Write(S);
        finally
          FdmContasPool.ReleaseObj(dm);
        end;
      end;
    end;
  except 
    on E: Exception do begin
      DebugMsgEsp('TDM.dpDadosDataReceived', False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpEsqueci2CheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/esquecisenha');
end;

procedure TDM.dpEsqueci2DataReceived(Sender: TRtcConnection);
var dm : TdmContas; 
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
    begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        with Request.Query do begin 
          if (not gChaves.ValidaChave(asString['chaveseg'], asString['senhaseg'])) then begin
            Write('erro=Falha de segurança no contato com o servidor de registro Nextar.');
            Exit;
          end;
          Write(dm.Esqueci2(trim(asString['conta']), PeerAddr));
        end;
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpEsqueci2DataReceived - '+E.Message, False, True);
      Write_Exception(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpEsqueciCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/esqueci');
end;

procedure TDM.dpEsqueciDataReceived(Sender: TRtcConnection);
var dm : TdmContas; 
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
    begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        if SameText(Request.Method, 'post') then
          Request.Params.AddText(URL_Decode(Read));
        with Request.Query do  
        Write(dm.Esqueci(trim(asString['conta']), asString['returnto'], Request.Params, Request.Method, PeerAddr));
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpEsqueciDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpGetAutoconnInfoCheckRequest(Sender: TRtcConnection);
var S: String;
begin
  with TRTCDataServer(Sender) do begin
    S := Request.Host;
    Request.Accepted := 
       SameText(Request.Filename, '/getautoconninfo') or 
      ((Request.Filename='/') and (SameText(S, 'autoconninfo.nextar.com.br') or SameText(S, 'autoconninfo.nexcafe.com.br')));
  end;
end;

procedure TDM.dpGetAutoconnInfoDataReceived(Sender: TRtcConnection);
var 
  dma : Tdm_Autoconn;
  S, sChave   : String;
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete and SameText(Request.Method, 'get') then begin                                           
        dma := Tdm_Autoconn(FdmAutoconnPool.GetObjFromPool);
        try
          sChave := Request.Query.asString['chave'];
          S := dma.ObtemAutoconn(Sender.PeerAddr);
          if sChave>'' then S := GetMD5Str(sChave) + sLineBreak + S;
          Write(S);
        finally
          FdmAutoconnPool.ReleaseObj(dma);
        end;
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpGetAutoconnInfo - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpObtemInfoCampanhaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/obteminfocampanha');
end;

procedure TDM.dpObtemInfoCampanhaDataReceived(Sender: TRtcConnection);
var dm : TdmContas; 
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
    begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        with Request.Query do 
          Write(dm.ObtemCampanha(PeerAddr));
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpObtemInfoCampanha - '+E.Message, False, True);
      Write_Exception(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpListaLansCheckRequest(Sender: TRtcConnection);
begin
{  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/listalans.json');}
end;

procedure TDM.dpListaLansDataReceived(Sender: TRtcConnection);
var dmc : TdmContas; S: String;
begin
  try
    with TRTCDataServer(Sender) do begin
      S := Request.Method;
      if Request.Complete then
      if SameText(S, 'get') then begin                                           
        if SameText(keyLL, Request.Query.asString['key']) then begin
          dmc := TdmContas(FdmContasPool.GetObjFromPool);
          try
            with Request.Params do 
              S := dmc.GetListaLans;
          finally
            FdmContasPool.ReleaseObj(dmc);
          end;
        end else
          S := 'invalid key';
        Write(S);  
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpListaLansDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpLogoffCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/logoff123');
end;

procedure TDM.dpLogoffDataReceived(Sender: TRtcConnection);
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then {};
      Write('Comando recebido');
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpLogoff - '+E.Message, False, True);
      Sender.Disconnect;
    end;
  end;

end;

procedure TDM.dpMailchimp_SignupCheckRequest(Sender: TRtcConnection);
var S: String;
begin
  with TRTCDataServer(Sender) do begin
    S := Request.Host;
    Request.Accepted := SameText(S, 'mailchimp.nextar.com.br') and (Request.FileName='/ativou');
  end;
end;

procedure TDM.dpMailchimp_SignupDataReceived(Sender: TRtcConnection);
var I : Integer;
    S : String;
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
    begin
        if SameText(Request.Method, 'post') then begin
          Request.Params.AddText(URL_Decode(Read));
          S := '';
          for I := 0 to Request.Params.ItemCount-1 do begin
            if I>0 then
              S := S + ' | ';
            S := S + Request.Params.ItemName[I] + '=' + Request.Params.ItemValue[I];
          end;
          DebugMsgEsp('TDM.dpMailchimp_Signup - Params: ' + S, False, True);
          Write('Ok');
        end else
          Write('Must use POST');
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpMailchimp_Signup - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpObtemChaveSegCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do 
    Request.Accepted := (Request.Filename='/obtemchaveseg');
end;

procedure TDM.dpObtemChaveSegDataReceived(Sender: TRtcConnection);
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
      Write(gChaves.NovaChave);
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpObtemChaveSegDataReceived - '+E.Message, False, True);
    end;
  end;
end;

procedure TDM.dpObtemRegCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/obtemregistro');
end;

procedure TDM.dpObtemRegDataReceived(Sender: TRtcConnection);
var dm : TdmContas; 
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
    begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        with Request.Query do  
        Write(dm.ChecaConta2(trim(asString['conta']), asString['codequip'], PeerAddr, asString['computername'],asString['iplocal'], asString['versao']));
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpObtemRegDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpOpenCheckRequest(Sender: TRtcConnection);
var S: String;
begin
  with TRTCDataServer(Sender) do begin
    S := Request.Host;
    Request.Accepted := (Request.Filename='/') and (SameText(S, 'open.nextar.com.br') or SameText(S, 'open.nexcafe.com.br'));
  end;
end;

procedure TDM.dpOpenDataReceived(Sender: TRtcConnection);
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then begin
        Write(ScriptStr);
//        TThreadIncOpenPages.Create(Self, '', Sender.PeerAddr);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpOpenDataReceived - '+E.Message, False, True);
      Sender.Disconnect;
    end;
  end;
end;

procedure TDM.dpReconfirmaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do 
    Request.Accepted := (Request.Filename='/reenviaconfirmacao');
end;

procedure TDM.dpReconfirmaDataReceived(Sender: TRtcConnection);
var dm : TdmContas; 
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
    begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        with Request.Query do  
        Write(dm.Reconfirma(trim(asString['conta'])));
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpReconfirmaDataReceived - '+E.Message, False, True);
      Write_Exception(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpRedirAjudaCheckRequest(Sender: TRtcConnection);
var S: String;
begin
  with TRTCDataServer(Sender) do begin
    S := Request.Host;
    Request.Accepted := SameText(S, 'ajuda.nextar.com.br');
  end;
end;

procedure TDM.dpRedirAjudaDataReceived(Sender: TRtcConnection);
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then begin
        Write('<html>'+sLinebreak+
              '<script>'+sLineBreak+
              'window.location = ' + QuotedStr('http://ajuda.nexcafe.com.br'+Request.URI) + sLineBreak +
              '</script>'+sLineBreak+
              '</html>');
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpRedirAjudaDataReceived - '+E.Message, False, True);
      Sender.Disconnect;
    end;
  end;
end;

procedure TDM.dpSalvaInfoCampanhaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/salvainfocampanha');
end;

procedure TDM.dpSalvaInfoCampanhaDataReceived(Sender: TRtcConnection);
var dm : TdmContas; 
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
    begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        with Request.Query do begin 
          dm.SalvaCampanha(asString['ip'], 
                           UTF8ToAnsi(URL_Decode(asString['campanha'])), 
                           UTF8ToAnsi(URL_Decode(asString['utmccn'])), 
                           UTF8ToAnsi(URL_Decode(asString['utmcct'])), 
                           UTF8ToAnsi(URL_Decode(asString['utmctr'])), 
                           UTF8ToAnsi(URL_Decode(asString['utmcsr'])), 
                           UTF8ToAnsi(URL_Decode(asString['utmcmd'])));
          Write('erro=0');
        end;
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpSalvaInfoCampanha - '+E.Message, False, True);
      Write_Exception(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpSenhaPorEmailCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := SameText(Request.Filename, '/senhaporemail');
end;

procedure TDM.dpSenhaPorEmailDataReceived(Sender: TRtcConnection);
var dmc : TdmContas; S: String;
begin
  try
    with TRTCDataServer(Sender) do begin
      S := Request.Method;
      if Request.Complete then
      if SameText(S, 'get') then begin  
        dmc := TdmContas(FdmContasPool.GetObjFromPool);
        try
          with Request.Query do
            S := dmc.SenhaPorEmail(trim(asString['conta']), asString['ip']);
        finally
          FdmContasPool.ReleaseObj(dmc);
        end;
        Write(S);  
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpSenhaPorEmail - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpTransferirCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/transferir');
end;

procedure TDM.dpTransferirDataReceived(Sender: TRtcConnection);
var 
  dmc : TdmContas;
  S: String;
  aHTML : Boolean;

procedure Erro(aErro: String);
begin
  with TRTCDataServer(Sender) do begin
    S := LoadHTMLArq('transferir_get.html');
    with Request.Query do  begin
      UpdateHTML(S, '%conta', trim(asString['conta']));
      UpdateHTML(S, '%codequip', asString['codequip']);
      UpdateHTML(S, '%erro', aErro);
    end;
    Write(S);
  end;
end; 
 
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then 
      if SameText(Request.Method, 'get') then  begin
        dmc := TdmContas(FdmContasPool.GetObjFromPool);
        try
          with Request.Query do begin
            aHTML := not SameText(asString['ret'], 'nohtml');
            if (not aHTML) and (not gChaves.ValidaChave(asString['chaveseg'], asString['senhaseg'])) then begin
              Write('erro=Falha de segurança no contato com o servidor de registro Nextar.');
              Exit;
            end;

            Write(dmc.Transferir(True, trim(URL_Decode(asString['conta'])), 
                                       URL_Decode(UTF8ToAnsi(asString['senha'])), 
                                       URL_Decode(asString['codequip']), 
                                       PeerAddr, aHTML));
          end;
        finally
          FdmContasPool.ReleaseObj(dmc);
        end;
      end
      else begin
        Request.Params.AddText(URL_Decode(Read));
        with Request.Params do
        if capOk(asString['recaptcha_challenge_field'], asString['recaptcha_response_field'], PeerAddr) then 
        begin
          dmc := TdmContas(FdmContasPool.GetObjFromPool);
          try
            with Request.Params do 
              Write(dmc.Transferir(False, trim(asString['conta']), asString['senha'], asString['codequip'], PeerAddr, True));
          finally
            FdmContasPool.ReleaseObj(dmc);
          end;
        end else
          Erro('Você não informou corretamente as palavras contidas na imagem de validação.');
      end;
    end;
  except
    on E: Exception do  begin
      DebugMsgEsp('TDM.dpTransferirDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpTrocarSenhaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/alterasenha');
end;

procedure TDM.dpTrocarSenhaDataReceived(Sender: TRtcConnection);
var dmc : TdmContas; S: String;
begin
  try
    with TRTCDataServer(Sender) do begin
      S := Request.Method;
      if Request.Complete then
      if SameText(S, 'get') then begin
        S := LoadHTMLArq('alterarsenha.html');
        UpdateHTML(S, '%conta', trim(Request.Query.asString['conta']));
        UpdateHTML(S, '%erro', '');
        Write(S);
      end else begin
        Request.Params.AddText(URL_Decode(Read));
        dmc := TdmContas(FdmContasPool.GetObjFromPool);
        try
          with Request.Params do 
            S := dmc.TrocarSenha(trim(asString['conta']), 
                                 asString['senha'], 
                                 asString['senha1'], 
                                 asString['senha2']);
          Write(S);
        finally
          FdmContasPool.ReleaseObj(dmc);
        end;
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpTrocarSenhaDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpUpdateCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := SameText(Request.Filename, '/update');
end;

procedure TDM.dpUpdateDataReceived(Sender: TRtcConnection);
var dmc : TdmContas; S: String;
begin
  try
    with TRTCDataServer(Sender) do begin
      S := Request.Method;
      if Request.Complete then
      if SameText(S, 'get') then begin  
        dmc := TdmContas(FdmContasPool.GetObjFromPool);
        try
          S := dmc.Update(Request.Query);
        finally
          FdmContasPool.ReleaseObj(dmc);
        end;
        Write(S);  
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpUpdate - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpValidarCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := SameText(Request.Filename, '/validar');
end;

procedure TDM.dpValidarDataReceived(Sender: TRtcConnection);
var dmc : TdmContas; S: String;
begin
  try
    with TRTCDataServer(Sender) do begin
      S := Request.Method;
      if Request.Complete then
      if SameText(S, 'get') then begin  
        dmc := TdmContas(FdmContasPool.GetObjFromPool);
        try
          with Request.Query do
            S := dmc.Validar(trim(asString['conta']), URL_Decode(asString['senha']), asString['idreq']);
        finally
          FdmContasPool.ReleaseObj(dmc);
        end;
        Write(S);  
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpValidarDataReceived - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpVerDadosLojaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/verdados');
end;

procedure TDM.dpVerDadosLojaDataReceived(Sender: TRtcConnection);
var dm : TdmContas; s: String;
begin
  try
    with TRTCDataServer(Sender) do 
    if Request.Complete then
    if SameText(Request.Method, 'post') then begin
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        Request.Params.AddText(URL_Decode(Read));
        with Request.Params do 
        if not SameText(asString['senha'], 'popopo') then begin
          S := LoadHTMLArq('verdadosloja.html');
          UpdateHTML(S, '%erro', 'Senha incorreta');
          UpdateHTML(S, '%conta', trim(asString['conta']));
          UpdateHTML(S, '%senha', 'popopo');
          UpdateHTML(S, '%dados', '');
          Write(S);
        end else
          Write(dm.VerDadosLoja(trim(asString['conta'])));
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end else begin
      S := LoadHTMLArq('verdadosloja.html');
      UpdateHTML(S, '%erro', '');
      UpdateHTML(S, '%conta', '');
      UpdateHTML(S, '%dados', '');  
      UpdateHTML(S, '%senha', '');
      Write(S);
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpVerDadosLoja - '+E.Message, False, True);
      WriteEx(E.Message, Sender);
    end;
  end;
end;

procedure TDM.dpWebTabsCheckRequest(Sender: TRtcConnection);
var S: String;
begin
  with TRTCDataServer(Sender) do begin
    S := Request.Host;
    Request.Accepted := (Request.Filename='/webtabs') or
      ((Request.Filename='/') and (SameText(S, 'nextabs.nextar.com.br') or SameText(S, 'nextabs.nexcafe.com.br')));
  end;
end;

procedure TDM.dpWebTabsDataReceived(Sender: TRtcConnection);
var 
  s: string;
  dm: TdmContas;
begin
  try
    with TRTCDataServer(Sender) do begin
      if Request.Complete then
      if SameText(Request.Method, 'get') then begin
        S := trim(Request.Query.asString['conta']);
        if trim(S)>'' then begin
          dm := TdmContas(FdmContasPool.GetObjFromPool);
          try
            S := dm.ObtemWebTabs(S, Sender.PeerAddr);
          finally
            FdmContasPool.ReleaseObj(dm);
          end;
          Write(S);
        end else
          Write(LoadHTMLArq('webtabs.html'));
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TDM.dpWebTabsDataReceived - '+E.Message, False, True);
      Sender.Disconnect;
    end;
  end;
end;

procedure TDM.HSSessionClose(Sender: TRtcConnection);
begin
  if gDiscAfterDone then
    Sender.Disconnect;
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TDM.rfChecaContaExecute(Sender: TRtcConnection;
  Param: TRtcFunctionInfo; Result: TRtcValue);
var 
  dmc : TdmContas;
  s   : String;
begin
  with Sender as TRtcDataServer do 
  try
    S := '';
    with Param do 
    if Trim(asString['conta'])>'' then begin
      dmc := TdmContas(FdmContasPool.GetObjFromPool);
      try
        S := dmc.ChecaConta(
               trim(asString['conta']), 
               asString['maq'], 
               asString['versao'], 
               Sender.PeerAddr, 
               asString['ComputerName'], 
               asString['IPLocal']);
      finally
        FdmContasPool.ReleaseObj(dmc);
      end;
    end else 
    if (asString['ComputerName']>'') or (asString['IPLocal']>'') then 
      autoconn_add(Sender.PeerAddr, asString['IPLocal'], asString['ComputerName']);

    with Param do 
    if Trim(asString['key'])>'' then begin
      if S>'' then S := S + sLineBreak;
      S := S + 'key='+GetMD5Str(asString['key']+'aksdjhWEIUYWAEKjhDfsdfzOIasdm')+sLineBreak+
           'HPUrl='+gHPUrl+sLineBreak+
           'HPPar='+gHPPar+sLineBreak+
           'HPAddConta='+gHPAddConta+sLineBreak+
           'HPTab='+gHPTab;
    end;

    Result.asString := S;
  except
    on E: Exception do  begin
      DebugMsgEsp('TDM.rfChecaContaExecute - '+E.Message, False, True);
      Sender.Disconnect;
    end;
  end;
end;


procedure TDM.WriteEx(aErro: String; Sender: TRTCConnection);
var S: String;
begin
  try
    S := LoadHTMLArq('erroservidor.html');
    UpdateHTML(S, '%erro', aErro);
    Sender.Write(S);
  except
  end;
end;

procedure TDM.Write_Exception(aException: String; Sender: TRTCConnection);
begin
  Sender.Write('erro=Nosso servidor de registro está temporariamente fora do ar. '+
               'Por favor, aguarde alguns instantes e tente novamente. '+
               'Se o erro persistir faça contato com a Nextar.' + sLineBreak + sLineBreak + 
               'Erro = '+aException);
end;

{ TThreadIncOpenPages }

constructor TThreadIncOpenPages.Create(aDM: TDM; aIP, aConta: String);
begin
  FDM := aDM;
  FIP := aIP;
  FConta := aConta;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TThreadIncOpenPages.Execute;
var O: TdmOpen;
begin
  try
    O := TdmOpen(FDM.FdmOpenPool.GetObjFromPool);
    try
      O.IncOpen(FIP, FConta);
    finally
      FDM.FdmOpenPool.ReleaseObj(O);
    end;
  except
    on E: Exception do 
      DebugMsgEsp('TThreadIncOpenPages.Execute - ' + E.Message, False, True);
  end;
end;

{ TThreadSalvaUObtemLic }


constructor TThreadSalvaUObtemLic.Create(aDM: TDM; aConta, aIP: String);
begin
  FDM := aDM;
  FIP := aIP;
  FConta := aConta;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TThreadSalvaUObtemLic.Execute;
var D: TdmContas;
begin
  try
    D := TdmContas(FDM.FdmContasPool.GetObjFromPool);
    try
      D.SalvaUObtemLic(FConta, FIP);
    finally
      FDM.FdmContasPool.ReleaseObj(D);
    end;
  except
    on E: Exception do 
      DebugMsgEsp('TThreadSalvaUObtemLic.Execute - ' + E.Message, False, True);
  end;
end;

function StrIsTrue(S: String): Boolean;
begin
  Result := SameText(S, 'S') or 
            SameText(S, '1') or 
            SameText(S, 'Y') or
            SameText(S, 'T');
end;

initialization
  BaseFileName := ExtractFilePath(ParamStr(0));
  
  Randomize;
  nRequests[0] := 0;
  nRequests[1] := 0;
  
  slCFG := TStringList.Create;
  try
    if FileExists(IniFName) then 
      slCFG.LoadFromFile(IniFName);

    if SameText(slCFG.Values['ExCookie'], 'S') or SameText(slCFG.Values['ExCookie'], 'N') then
      gExCookie := UpperCase(slCFG.Values['ExCookie']);

    gDiscAfterDone := SameText(slCFG.Values['DiscAfterDone'], 'S');
      
    gBRT := StrToIntDef(slCFG.Values['BRT'], 60);
    if slCFG.Values['DBServer'] = '' then begin
      slCFG.Values['DBServer'] := '127.0.0.1';
      slCFG.Values['OpenNextar'] := 'http://www.kitlandoyahoo.com.br/nexcafe/promo.php';
      slCFG.SaveToFile(IniFName);
    end;  
    DBServer := slCFG.Values['DBServer'];
    DisconnectAfterDone := StrIsTrue(slCFG.Values['DisconnectAfterDone']);
    gHPUrl := slCFG.Values['OpenNextar'];
    gHPPar := slCfg.Values['HPPar'];
    gHPAddConta := slCfg.Values['HPAddConta'];
    gHPTab := slCfg.Values['HPTab'];
    gDebugIncOpen := (slCfg.Values['DebugIncOpen']='S');

    minVerFree := StrToIntDef(slCfg.Values['minVerFree'], 0);
    minVerPremium := StrToIntDef(slCfg.Values['minVerPremium'], 0);
    minVerArq := slCfg.Values['minVerArq'];

    ScriptStr := 
      '<html>'+sLinebreak+
      '<script>'+sLineBreak+
      'window.location = ' //+ QuotedStr('http://open2.nextar.com.br') + sLineBreak +
      +QuotedStr(slCFG.Values['OpenNextar'])+';'+sLinebreak+
  //    +QuotedStr('http://br.rd.yahoo.com/kityahoolan/nexcafe/*http:/br.yahoo.com/')+';'+sLinebreak+
      '</script>'+sLineBreak+
      '</html>';
    
  finally
    slCFG.Free;
  end;    
  CSSeq := TCriticalSection.Create;
  SLSeq := TStringList.Create;

finalization
  CSSeq.Free;
  SLSeq.Free;  


end.
