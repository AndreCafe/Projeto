unit nr_dm_webserv;

interface

uses
  SysUtils, Classes, nxllTransport, nxptBasePooledTransport, Messages, Windows,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, Dialogs,
  kbmMWCustomMessagingTransport, kbmMWTCPIPIndyMessagingTransport,
  kbmMemTable, IdPOP3, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, DB, ExtCtrls, nxdb, idThread,
  kbmMWCustomTransport, kbmMWServer, kbmMWTCPIPIndyServerTransport, kbmMWTCPIPIndyTransport, 
  idTcpServer,
  kbmMWSecurity,
  SyncObjs,
  nxDbBase,
  kbmMWHTTPStdTransStream,
  nxllComponent, kbmMWCustomConnectionPool, kbmMWCustomSQLMetaData,
  kbmMWNexusDB, kbmMWTCPIPIndyMessagingServerTransport, IdMessage, IdIMAP4,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, rtcConn, rtcDataSrv, rtcHttpSrv,
  rtcInfo, uObjPool, uRSdmEmail, IdHTTP, rtcFunction, rtcSrvModule;

type
  TDM = class(TDataModule)
    mwNXDBCP: TkbmMWNexusDBConnectionPool;
    mwPS: TkbmMWPooledSession;
    mwNXMD: TkbmMWNexusDBMetaData;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    mwServ: TkbmMWServer;
    TCPIP: TkbmMWTCPIPIndyServerTransport;
    TCPHTTP: TkbmMWTCPIPIndyServerTransport;
    qSeq: TnxQuery;
    tCorpo: TnxTable;
    tEnvio: TnxTable;
    tCorpoAssunto: TStringField;
    tCorpoInclusao: TDateTimeField;
    tCorpoTipo: TWordField;
    tCorpoEnviarEm: TDateTimeField;
    tCorpoProcessou: TBooleanField;
    tEnvioID: TAutoIncField;
    tEnvioCorpo: TIntegerField;
    tEnvioInclusao: TDateTimeField;
    tEnvioEnvio: TDateTimeField;
    tEnvioTentativas: TWordField;
    tEnvioEnviar: TBooleanField;
    tEnvioMsgErro: TMemoField;
    tEnvioOK: TBooleanField;
    tEmail: TTimer;
    tCli: TnxTable;
    tCliTipo: TWordField;
    tCliEmailReg: TMemoField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliEmailTec: TMemoField;
    tEnvioDestino: TMemoField;
    pop: TIdPOP3;
    TCPIPMsg: TkbmMWTCPIPIndyMessagingServerTransport;
    tConexao: TnxTable;
    tConexaoID: TAutoIncField;
    tConexaoAberta: TBooleanField;
    tConexaoTipo: TWordField;
    tConexaoHD: TStringField;
    tConexaoLogin: TDateTimeField;
    tConexaoLogout: TDateTimeField;
    tConexaoLoja: TIntegerField;
    tConexaoUsuario: TStringField;
    tConexaoNome: TStringField;
    tConexaoStatus: TStringField;
    tConexaoIP: TStringField;
    tConexaoThreadID: TIntegerField;
    msgQIn: TkbmMWMemoryMessageQueue;
    msgQOut: TkbmMWMemoryMessageQueue;
    Timer1: TTimer;
    TCP2: TkbmMWTCPIPIndyServerTransport;
    tCliCodigo: TAutoIncField;
    Msg: TIdMessage;
    tCorpoCType: TStringField;
    IdIMAP41: TIdIMAP4;
    tCorpoAnexos: TnxMemoField;
    tCorpoCorpo: TnxMemoField;
    tCorpoDestino: TnxMemoField;
    tCorpoID: TAutoIncField;
    SMTP: TIdSMTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    tAut: TnxTable;
    tAutID: TAutoIncField;
    tAutPrograma: TWordField;
    tAutLoja: TIntegerField;
    tAutAutorizacao: TStringField;
    tAutVencimento: TDateField;
    tAutCodigoEquip: TStringField;
    tAutMaquinas: TWordField;
    tAutTipo: TWordField;
    tAutCriadaEm: TDateTimeField;
    tAutCriadaPor: TStringField;
    tAutInativadaEm: TDateTimeField;
    tAutInativadaPor: TStringField;
    tAutAtiva: TBooleanField;
    tAutObs: TnxMemoField;
    tAutGerar: TBooleanField;
    tAutEnviouCli: TBooleanField;
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
    tCorpoConta: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tEmailTimer(Sender: TObject);
    procedure TCPIPMsgDisconnected(Sender: TObject;
      Info: TkbmMWCustomTransportInfo);
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
  private
    FdmOpenPool : TObjectPool;
    FdmContasPool : TObjectPool;
    FdmEmailPool : TObjectPool;
    { Private declarations }
    function CreateDMOpen: TObject;
    function CreateDMContas: TObject;
    function CreateDMEmail: TObject;
    function EnviaEmail(aDestino, aAssunto, aCorpo, aAnexos, aCType: String): String;
    procedure EnviarEmails;
  public
    { Public declarations }
    function AbreTabelas: Boolean;
  end;

  TThreadIncOpenPages = class ( TThread )
  private
    FDM: TDM;
    FIP: String;
  protected
    procedure Execute; override;
  public
    constructor Create(aDM: TDM; aIP: String);
  end;

  TThreadSendEmail = class ( TThread )
  private
    FTo, FAssunto, FCorpo, FAnexos, FUsername, FPassword: String;
  protected
    procedure Execute; override;
  public
    constructor Create(aTo: String; aAssunto, aCorpo, aAnexos: String; 
                     const aUsername: string = ''; 
                     const aPassword: string = '');
  end;
  

  function Venceu7Dias(D: TDataset): Boolean;

  function capOk(aChallenge, aResp, aIP: String): Boolean;

  function LoadHTMLArq(aArq: String): String;
  procedure SaveArqText(aArq, aText: String);

  procedure UpdateHTML(var S: String; aID, aValue: String; aEncodeValue: Boolean = True);

  function LoginHTML(aOp: Byte; aConta, aSessao, aErro: String): String;

  

//  function GetNextAutoInc(ATableName, AFieldName, AWhere: String): Integer;

  procedure InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean);
  
const
  Email_TodosCli    = '__TODOSCLIENTES';
  Email_Cybermgr    = '__TODOSCYBERMGR';
  Email_Definitivos = '__TODOSDEF';
  MaxTriesEmail     = 10;

var
  DM: TDM;
  DBServer: String;
  slCfg : TStrings;
  SLSeq : TStrings;
  CSSeq : TCriticalSection;
  FimApp : Boolean = False;
  ScriptStr : String;
  BaseFileName : String;
  gBRT : Word = 30;
  gExCookie : String = 'N';
  gHPOpenBef : String = 'N';

  nRequests : Array[0..1] of Integer;  
  
  
implementation

uses 
  uRSqsRegistro100, 
  uRSQSAdmin100, 
  ursCHAT100,
  kbmMWZipStdTransStream,
  uRSServBD, 
  uRSQSRegistro200,
  nrAutorizacao, uRSQSRegistro300, ursDMOpen, uDMContas, uLicEXECryptor;

{$R *.dfm}

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

procedure UpdateHTML(var S: String; aID, aValue: String; aEncodeValue: Boolean = True);
var P: Integer;
begin
{  if aEncodeValue then
    aValue := AnsiToUTF8(aValue); }
    
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
      UpdateHTML(Result, '%titulo', 'Ativar conta NexCafé nesse computador');
      UpdateHTML(Result, '%instrucoes', 'Para ativar sua conta NexCafé nesse computador digite sua senha e clique em "Ativar".');
      UpdateHTML(Result, '%submit', 'Ativar');
      UpdateHTML(Result, '%action', '');
    end; 
    opAssinar, opAtualizaDadosConta : begin
      UpdateHTML(Result, '%titulo', 'Login conta NexCafé');
      UpdateHTML(Result, '%instrucoes', 'Para prosseguir, faça o login na sua conta NexCafé.');
      UpdateHTML(Result, '%submit', 'Login');
      UpdateHTML(Result, '%action', '?pg=1');
    end;
  end;

  UpdateHTML(Result, '%conta', aConta);
  UpdateHTML(Result, '%sessao', aSessao);
  UpdateHTML(Result, '%erro', aErro);
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

procedure InitTran(aDB: TnxDatabase;
                   const aTables : array of TnxTable;
                   aWith : Boolean);
var I : Integer;
begin
  if aDB.InTransaction then Exit;
  I := 10;
  while I > 0 do begin
    try
      if aWith then
        aDB.StartTransactionWith(aTables)
      else
        aDB.StartTransaction;
      I := 0;
    except
      Dec(I);
      Random(500);
    end
  end;
end;

{function GetNextAutoInc(ATableName, AFieldName,
  AWhere: String): Integer;
var
  I : Integer;
begin
  CSSeq.Enter;
  with DM do
  try
    I := SLSeq.IndexOf(ATableName+AFieldName+AWhere);
    if I>=0 then begin
      Result := Integer(SLSeq.Objects[I])+1;
      SLSeq.Objects[I] := TObject(Result);
    end else begin
      qSeq.SQL.Clear;
      qSeq.SQL.Add('SELECT MAX(' + AFieldName + ') AS IDMAX FROM ' + ATableName);
      if AWhere>'' then qSeq.SQL.Add(AWhere);
      qSeq.Open;
      try
        if qSeq.RecordCount>0 then
          Result := qSeq.FieldByName('IDMAX').AsInteger + 1
        else
          Result := 1;
      finally    
        qSeq.Close;
      end;  
      SLSeq.AddObject(ATableName + AFieldName + AWhere, TObject(Result));
    end;
  finally
    CSSeq.Leave;
  end;  
end;}

function TDM.AbreTabelas: Boolean;
begin
  Result := False;
  try
    nxSession.Open;
    nxDB.Open;
    tEnvio.Open;
    tCorpo.Open;
    Result := True;
  except
  end;
end;

function TDM.CreateDMContas: TObject;
begin
  Result := TdmContas.Create(nil);
end;

function TDM.CreateDMEmail: TObject;
begin
  Result := TdmEmail.Create(nil);
end;

function TDM.CreateDMOpen: TObject;
begin
  Result := TdmOpen.Create(nil);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FdmOpenPool := TObjectPool.Create;
  FdmOpenPool.CreateNewPoolObj := CreatedmOpen;

  FdmContasPool := TObjectPool.Create;
  FdmContasPool.CreateNewPoolObj := CreatedmContas;

  FdmEmailPool := TObjectPool.Create;
  FdmEmailPool.CreateNewPoolObj := CreatedmEmail;
  
  nxDB.AliasPath := '';
  nxDB.AliasName := 'Registro';
  mwServ.RegisterService(TqsRegistro100, False);
  mwServ.RegisterService(TqsRegistro200, False);
  mwServ.RegisterService(TqsRegistro300, False);
  mwServ.RegisterService(TqsAdmin100, False);
  mwServ.RegisterService(TqsChat100, False);
  mwServ.Active := True;
  TCPIP.Listen;
  TCP2.Listen;
  TCPIPmsg.Listen;
  TCPIPmsg.AnnounceSubscriptions;
  HS.Listen;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FdmOpenPool.Free;
  FdmContasPool.Free;
  FdmEmailPool.Free;
end;

procedure TDM.dpAtivarCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/ativar');
end;

procedure TDM.dpAtivarDataReceived(Sender: TRtcConnection);
var  dm : TdmContas;
begin
  with TRTCDataServer(Sender) do
  if Request.Complete then begin
    dm := TdmContas(FdmContasPool.GetObjFromPool);
    try
      with Request.Query do
        Write(dm.LinkAtivar(asString['conta'], asString['codativacao'], asString['codequip'], PeerAddr));
    finally
      FdmContasPool.ReleaseObj(dm);
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
end;

procedure TDM.dpAssinarCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/assinar');
end;

procedure TDM.dpAssinarDataReceived(Sender: TRtcConnection);
var dm : TdmContas; S: String;
begin
  with TRTCDataServer(Sender) do begin
    if Request.Complete then
    if SameText(Request.Method, 'get') then begin
      Write(LoginHTML(opAssinar, 
                      Request.Query.asString['conta'], 
                      '', ''));
    end else begin
      S := '';
      Request.Params.AddText(URL_Decode(Read));
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        if Request.Query.asString['pg']='1' then begin
          with Request.Params do 
          if DM.LoginAssinar(asString['conta'], asString['senha'], S) then begin
            OpenSession;
            Session.KeepAlive := 600;
            UpdateHTML(S, '%sessao', Session.ID);
          end;
        end else begin
          if not FindSession(Request.Params.asString['sessao']) then
            S := LoginHTML(opAssinar, Request.Params.asString['conta'], '', 'Sua sessão expirou. Por favor faça login novamente')
          else begin
            case StrToIntDef(Request.Query.asString['pg'], 0) of
              2 : begin
                Session.asString['meses'] := Request.Params.asString['rgass'];
                with Request.Params do 
                DM.GetHTMLDados(asString['conta'], asString['rgass'], S);
              end;
              
              3 : S := DM.SalvaHTMLDados(Request.Params, False);
              
              4 : 
              begin
                with Request.Params do 
                S := DM.ConfirmaCompra(asString['conta'], asString['rgass']);
                Session.Close;
              end
            else
              S := LoadHTMLArq('linkinvalido.html');
            end;
            UpdateHTML(S, '%sessao', Session.ID);
          end;
        end;
        Write(S);
      finally
        FdmContasPool.ReleaseObj(dm);
      end;
    end;
  end;
end;

procedure TDM.dpCriaContaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do 
    Request.Accepted := (Request.Filename='/criarconta');
end;

function LoadHTMLArq(aArq: String): String;
var SL : TStringList;
begin
  SL := TStringList.Create;
  try
    SL.LoadFromFile(BaseFileName+aArq);
    Result := SL.Text;
  finally
    SL.Free;
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
  S, sEquip, sRes : String; I: integer;
  dm : TdmContas;

procedure UpdateStr(aID, aValue: String);
begin
  UpdateHTML(S, aID, aValue);
end;

procedure Erro(aErroEmail, aErroSenha: String; aErroGeral: String = '');
begin
  S := LoadHTMLArq('criarconta2.html');
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
    UpdateStr('%cidade_value', asString['cidade']);
    UpdateStr('%estado_value', asString['estado']);
    UpdateStr('%codequip_value', asString['codequip']);
  end;
end;

begin
  with TRTCDataServer(Sender) do begin
    if Request.Complete then 
    if SameText(Request.Method, 'get') then begin
      S := LoadHTMLArq('criarconta2.html');
      UpdateStr('%email_value', '');
      UpdateStr('%email2_value', '');
      UpdateStr('%senha_value', '');
      UpdateStr('%senha2_value', '');
      UpdateStr('%prop_value', '');
      UpdateStr('%loja_value', '');
      UpdateStr('%cidade_value', '');
      UpdateStr('%estado_value', '');
      UpdateStr('%email_value', '');
      UpdateStr('%erro_email', '');
      UpdateStr('%erro_senha', '');
      UpdateStr('%erro_geral', '');

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
      if not capOk(asString['recaptcha_challenge_field'], asString['recaptcha_response_field'], PeerAddr) then 
        Erro('', '', 'Você não informou corretamente as palavras contidas na imagem de validação.')
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
                                Sender.PeerAddr);
          if sRes>'' then
            Erro('', '', sRes) 
          else begin
            S := LoadHTMLArq('contacriada.html');
            UpdateStr('%email', asString['email']);
            UpdateStr('%ajustaconta', 'http://127.0.0.1:16201/ajustarconta?conta='+asString['email']+'&chaves='+ChaveAtivar);
          end;
        finally
          FdmContasPool.ReleaseObj(dm);
        end;
      end;
      Write(S);
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
  with TRTCDataServer(Sender) do begin
    if Request.Complete then
    if SameText(Request.Method, 'get') then begin
      Write(LoginHTML(opAtualizaDadosConta, 
                      Request.Query.asString['conta'], 
                      '', ''));
    end else begin
      S := '';
      Request.Params.AddText(URL_Decode(Read));
      dm := TdmContas(FdmContasPool.GetObjFromPool);
      try
        if Request.Query.asString['pg']='1' then begin
          with Request.Params do 
          if DM.GetHTMLDados(asString['conta'], '', S, asString['senha']) then begin
            OpenSession;
            Session.KeepAlive := 600;
            UpdateHTML(S, '%sessao', Session.ID);
          end;
        end else begin
          if not FindSession(Request.Params.asString['sessao']) then
            S := LoginHTML(opAtualizaDadosConta, Request.Params.asString['conta'], '', 'Sua sessão expirou. Por favor faça login novamente')
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
end;

procedure TDM.dpEsqueciCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do 
    Request.Accepted := (Request.Filename='/esqueci');
end;

procedure TDM.dpEsqueciDataReceived(Sender: TRtcConnection);
var dm : TdmContas; 
begin
  with TRTCDataServer(Sender) do if Request.Complete then
  begin
    dm := TdmContas(FdmContasPool.GetObjFromPool);
    try
      if SameText(Request.Method, 'post') then
        Request.Params.AddText(URL_Decode(Read));
      Write(dm.Esqueci(Request.Query.asString['conta'], Request.Params, Request.Method, PeerAddr));
    finally
      FdmContasPool.ReleaseObj(dm);
    end;
  end;
end;

procedure TDM.dpOpenCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do
    Request.Accepted := (Request.Filename='/');
end;

procedure TDM.dpOpenDataReceived(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do begin
    if Request.Complete then begin
      Write(ScriptStr);
      TThreadIncOpenPages.Create(Self, Sender.PeerAddr);
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

procedure Erro(aErro: String);
begin
  with TRTCDataServer(Sender) do begin
    S := LoadHTMLArq('transferir_get.html');
    with Request.Query do  begin
      UpdateHTML(S, '%conta', asString['conta']);
      UpdateHTML(S, '%codequip', asString['codequip']);
      UpdateHTML(S, '%erro', aErro);
    end;
    Write(S);
  end;
end; 
 
begin
  with TRTCDataServer(Sender) do begin
    if Request.Complete then 
    if SameText(Request.Method, 'get') then  begin
      dmc := TdmContas(FdmContasPool.GetObjFromPool);
      try
        Write(dmc.Transferir(True, Request.Query.asString['conta'], '', Request.Query.asString['codequip'], PeerAddr));
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
            Write(dmc.Transferir(False, asString['conta'], asString['senha'], asString['codequip'], PeerAddr));
        finally
          FdmContasPool.ReleaseObj(dmc);
        end;
      end else
        Erro('Você não informou corretamente as palavras contidas na imagem de validação.');
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
  with TRTCDataServer(Sender) do begin
    S := Request.Method;
    if Request.Complete then
    if SameText(S, 'get') then begin
      S := LoadHTMLArq('alterarsenha.html');
      UpdateHTML(S, '%conta', Request.Query.asString['conta']);
      UpdateHTML(S, '%erro', '');
      Write(S);
    end else begin
      Request.Params.AddText(URL_Decode(Read));
      dmc := TdmContas(FdmContasPool.GetObjFromPool);
      try
        with Request.Params do 
          S := dmc.TrocarSenha(asString['conta'], 
                               asString['senha'], 
                               asString['senha1'], 
                               asString['senha2']);
        Write(S);
      finally
        FdmContasPool.ReleaseObj(dmc);
      end;
    end;
  end;
end;

function TDM.EnviaEmail(aDestino, aAssunto, aCorpo, aAnexos, aCType: String): String;
var 
  SL: TStrings;
  I: Integer;
begin
  Result := '';
  SL := TStringList.Create;
  try
    try
      Msg.Subject := aAssunto;
      Msg.Recipients.Clear;
      SL.Text := aDestino;
      Msg.Recipients.Clear;
      Msg.ContentType := aCType; 
      for I := 0 to SL.Count-1 do 
        Msg.Recipients.Add.Address := SL[I];
      SL.Text := aAnexos;
      Msg.Body.Text := aCorpo;
      Msg.Subject := aAssunto;
      Msg.MessageParts.Clear;
      for I := 0 to SL.Count - 1 do
        with TidAttachment.Create(Msg.MessageParts, SL.ValueFromIndex[I]) do
          FileName := SL.Names[I];
      Smtp.Send(Msg);
    except
      on E: Exception do 
        Result := E.Message
    end;
  finally
    SL.Free;
  end;
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TDM.tEmailTimer(Sender: TObject);
begin
  tEmail.Enabled := False;
  try
    EnviarEmails;
  except
    tEmail.Enabled := True;
  end;
end;

procedure TDM.EnviarEmails;
var 
  SL : TStrings;
  I, P  : Integer;
  Enviar : Boolean;
  S: String;

procedure _Add(sEmail: String);
begin
  if (sEmail>'') and (SL.IndexOf(sEmail)<0) then
    SL.Add(sEmail);
end;
  
procedure AddEmail(sEmail: String);
begin
  while Trim(sEmail)>'' do begin
    P := Pos(',', sEmail);
    if P=0 then P := Pos(';', sEmail);
    if P>0 then begin
      _Add(Trim(Copy(sEmail, 1, P-1)));
      Delete(sEmail, 1, P);
    end else begin
      _Add(Trim(sEmail));
      sEmail := '';
    end;
  end;
end;
  
procedure ObtemDestinatarios;
begin
  SL.Clear;
  if tCorpoDestino.Value=Email_TodosCli then begin
    SL.Add('todos@nextar.com.br');
    tCli.Open;
    try
      tCli.First;
      while not tCli.Eof do begin
        ProcessMessages;
        AddEmail(tCliEmailReg.Value);
        AddEmail(tCliEmailTec.Value);
        Sleep(0);
      end;
    finally
      tCli.Close;
    end;    
  end else
  if tCorpoDestino.Value=Email_Definitivos then begin
    SL.Add('todos@nextar.com.br');
    tCli.Open;
    try
      tCli.First;
      while not tCli.Eof do begin
        ProcessMessages;
        if tAut.FindKey([tCliCodigo.Value, True]) and (tAutTipo.Value=2) then begin
          AddEmail(tCliEmailReg.Value);
          AddEmail(tCliEmailTec.Value);
        end;
        tCli.Next;
      end;
    finally
      tCli.Close;
    end;    
  end else
    SL.Add(tCorpoDestino.Value);
end;

begin
  tEmail.Enabled := False;
  try
    SL := TStringList.Create;
    if not AbreTabelas then Exit;
    tCorpo.CancelRange;
    tCorpo.IndexName := 'IProcessou';
    tCorpo.SetRange([False, EncodeDate(1900, 1, 1)], [False, Now]);
    tAut.Active := True;
   
    while (not tCorpo.Eof) do begin
      nxDB.StartTransactionWith([tCorpo, tEnvio]);
      try
        ObtemDestinatarios;
        for I := 0 to SL.Count-1 do begin
          tEnvio.Insert;
          tEnvioCorpo.Value := tCorpoID.Value;
          tEnvioDestino.Value := SL[I];
          tEnvioInclusao.Value := Now;
          tEnvioTentativas.Value := 0;
          tEnvioOK.Value := False;
          tEnvioEnviar.Value := True;
          tEnvio.Post;
          Sleep(5);
        end;  
        tCorpo.Edit;
        tCorpoProcessou.Value := True;
        tCorpo.Post;
        Sleep(5);
        nxDB.Commit;
      except
        nxDB.Rollback;
        Raise;
      end;  
    end;

    tCorpo.CancelRange;
    tCorpo.IndexName := 'IID';
    tEnvio.SetRange([True], [True]);
    tEnvio.Refresh;
    
{    if not tEnvio.Eof then
     try
      pop.Connect(0);
    except
    end;}
    
    while (not tEnvio.Eof) and (not FimApp) do begin  
      tEnvio.Edit;
      tEnvioTentativas.Value := tEnvioTentativas.Value + 1;
      tEnvio.Post;
      try
        
        if tCorpo.FindKey([tEnvioCorpo.Value]) then begin
          Smtp.Connect;
          try
            EnviaEmail(tEnvioDestino.Value, 
                       tCorpoAssunto.Value, 
                       tCorpoCorpo.Value, 
                       tCorpoAnexos.Value,
                       tCorpoCType.Value);
          finally
            smtp.Disconnect;
            Sleep(500);
          end;
          tEnvio.Edit;
          tEnvioEnvio.Value := Now;
          tEnvioOK.Value := True;
          tEnvioEnviar.Value := False;
          tEnvio.Post;
        end else begin
          tEnvio.Edit;
          tEnvioOk.Value := False;
          tEnvioEnviar.Value := False;
          tEnvioMsgErro.Value := 'Corpo da mensagem não encontrado';
          tEnvio.Post;
        end; 
      except  
        On E: EnxDatabaseError do Exit;
        On E: Exception do begin
          tEnvioMsgErro.Value := E.Message;
          Enviar := (tEnvioTentativas.Value < MaxTriesEmail);
          if not (tEnvio.State in [dsEdit, dsInsert]) then tEnvio.Edit;
          tEnvioEnviar.Value := Enviar;
          tEnvio.Post;
          if Enviar then 
            tEnvio.Next;
        end;  
      end;  
      Sleep(5);
    end;
  {  try
      if pop.Connected then
        pop.Disconnect;
    except
    end;  }
  finally
    if SMTP.Connected then
      SMTP.Disconnect;
    SL.Free;
    tEmail.Enabled := True;
    tCorpo.Close;
    tEnvio.Close;
    nxDB.Close;
    nxSession.Close;
  end;
end;

procedure TDM.rfChecaContaExecute(Sender: TRtcConnection;
  Param: TRtcFunctionInfo; Result: TRtcValue);
var dmc : TdmContas;
begin
  with Sender as TRtcDataServer do 
  try
    dmc := TdmContas(FdmContasPool.GetObjFromPool);
    try
      Result.asString := dmc.ChecaConta(Param.asString['conta'], Param.asString['maq'], Param.asString['versao'])
    finally
      FdmContasPool.ReleaseObj(dmc);
    end;
  except
    Result.asString := '';
  end;
end;

procedure TDM.TCPIPMsgDisconnected(Sender: TObject;
  Info: TkbmMWCustomTransportInfo);
var 
  C : TkbmMWClientIdentity;
  ThID : Cardinal;
begin
  CSSeq.Enter;
  try
    tConexao.Active := True;
    tConexao.IndexName := 'IAbertaThreadID';
    tConexao.Refresh;
    ThID := GetCurrentThreadID;
    
    InitTran(nxDB, [tConexao], True);
    try
      if not tConexao.FindKey([True, ThID]) then begin
        nxDB.Rollback;
        Exit;
      end;  
      tConexao.Edit;
      tConexaoLogout.Value := Now;
      tConexaoAberta.Value := False;
      tConexao.Post;
      
      C := TkbmMWClientIdentity.Create;
      try
        TCPIPMsg.SendMessage('MSG.CHAT.TODOS.LOGOUT', '', C, nil, [tConexaoHD.Value]);
      finally
        C.Free;
      end;    
      
      nxDB.Commit;
    except
      nxDB.Rollback;
      if tConexao.State in [dsEdit, dsInsert] then tConexao.Cancel;
      Raise;
    end;  
  finally
    CSSeq.Leave;
  end;
end;

function IniFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'RegistroServ.ini';
end;  


{ TThreadIncOpenPages }

constructor TThreadIncOpenPages.Create(aDM: TDM; aIP: String);
begin
  FDM := aDM;
  FIP := aIP;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TThreadIncOpenPages.Execute;
var dmOpen: TdmOpen;
begin
  dmOpen := TdmOpen(FDM.FdmOpenPool.GetObjFromPool);
  try
    dmOpen.IncOpen(FIP);
  finally
    FDM.FdmOpenPool.ReleaseObj(dmOpen);
  end;
end;

{ TThreadSendEmail }

constructor TThreadSendEmail.Create(aTo, aAssunto, aCorpo, aAnexos: String;
  const aUsername, aPassword: string);
begin
  FTo := aTo;
  FAssunto := aAssunto;
  FCorpo := aCorpo;
  FAnexos := aAnexos;
  FUsername := aUsername;
  FPassword := aPassword;
  FreeOnTerminate := True;
  inherited Create(False);
  FreeOnTerminate := True;
end;

procedure TThreadSendEmail.Execute;
var dmEmail : TdmEmail;
begin
  dmEmail := TdmEmail(DM.FdmEmailPool.GetObjFromPool);
  try
    dmEmail.SendEmail(FTo, FAssunto, FCorpo, FAnexos, FUsername, FPassword);
  finally
    dm.FdmEmailPool.ReleaseObj(dmEmail);
  end;
end;

initialization
  BaseFileName := ExtractFilePath(ParamStr(0));
  
  ScriptStr := 
    '<html>'+sLinebreak+
    '<script>'+sLineBreak+
    'window.location = ' //+ QuotedStr('http://open2.nextar.com.br') + sLineBreak +
    +QuotedStr('http://br.rd.yahoo.com/kityahoolan/nexcafe/*http:/br.yahoo.com/')+';'+sLinebreak+
    '</script>'+sLineBreak+
    '</html>';

  Randomize;
  nRequests[0] := 0;
  nRequests[1] := 0;
  
  slCFG := TStringList.Create;
  try
    if FileExists(IniFName) then 
      slCFG.LoadFromFile(IniFName);

    if SameText(slCFG.Values['ExCookie'], 'S') or SameText(slCFG.Values['ExCookie'], 'N') then
      gExCookie := UpperCase(slCFG.Values['ExCookie']);
      
    gBRT := StrToIntDef(slCFG.Values['BRT'], 60);
    if slCFG.Values['DBServer'] = '' then begin
      slCFG.Values['DBServer'] := '127.0.0.1';
      slCFG.SaveToFile(IniFName);
    end;  
    DBServer := slCFG.Values['DBServer'];
  finally
    slCFG.Free;
  end;    
  CSSeq := TCriticalSection.Create;
  SLSeq := TStringList.Create;

finalization
  CSSeq.Free;
  SLSeq.Free;  


end.
