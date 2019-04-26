unit ncMWServer;

interface

uses
  SysUtils, Classes, WinProcs, Messages, Windows, kbmMWGlobal, kbmMWCustomConnectionPool, kbmMWCustomSQLMetaData,
  kbmMWNexusDB, kbmMWServer, kbmMWCustomTransport, ncMsgCom, kbmMWSecurity,
  kbmMWCustomMessagingTransport, idTCPServer, kbmMWTCPIPIndyMessagingServerTransport, 
  kbmMWFileService, ExtCtrls, ncClassesBase, kbmMWMT;

type
  TdmMWServer = class(TDataModule)
    mqOutz: TkbmMWMemoryMessageQueue;
    mqInz: TkbmMWMemoryMessageQueue;
    mwTCPIPz: TkbmMWTCPIPIndyMessagingServerTransport;
    mwServ: TkbmMWServer;
    mwNexusMD: TkbmMWNexusDBMetaData;
    mwFilePool: TkbmMWFilePool;
    TimerLic: TTimer;
    TimerH: TTimer;
    mwTCPIPs: TkbmMWTCPIPIndyMessagingServerTransport;
    mqOuts: TkbmMWMemoryMessageQueue;
    mqIns: TkbmMWMemoryMessageQueue;
    kbmMWMTConnectionPool1: TkbmMWMTConnectionPool;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure TimerLicTimer(Sender: TObject);
    procedure TimerHTimer(Sender: TObject);
    procedure mwTCPIPzDisconnect(AThread: TIdPeerThread);
  private
    { Private declarations }
    FCI : TkbmMWClientIdentity;
    FWinHandle : HWND;
    FHandle : Integer;
    FSockLic : Integer;
    FServidor : TncServidorBase;
    FAtivo : Boolean;
    procedure SetServidor(const Value: TncServidorBase);

    procedure CriaWinHandle;
    procedure SetAtivo(const Value: Boolean);
  protected
    procedure DespachaMC(var Msg: TMessage);
  
  {---- MsgCom Handlers ---------------------------------------------------}
  
    procedure tcAtualizaObj(var Msg: TMessage);
              message ncmc_AtualizaObj;
              
    procedure tcNovoObj(var Msg: TMessage);
              message ncmc_NovoObj;
              
    procedure tcDestroiObj(var Msg: TMessage);
              message ncmc_DestroiObj;

    procedure tcServidorDesativado(var Msg: TMessage);
              message ncmc_ServidorDesativado;

    procedure tcPedeTela(var Msg: TMessage);
              message ncmc_CapturaTela;

    procedure tcShutdown(var Msg: TMessage);
              message ncmc_Shutdown;

    procedure tcChatEv(var Msg: TMessage);
              message ncmc_ChatEv;

    procedure tcSuporteRemEv(var Msg: TMessage);
              message ncmc_SuporteRemEv;              

    procedure tcAbriuFechouCaixaEv(var Msg: TMessage);
              message ncmc_AbriuFechouCaixa; 

    procedure tcSiteBloqueadoEv(var Msg: TMessage);
              message ncmc_SiteBloqueado; 

    procedure tcObtemProcessosEv(var Msg: TMessage);
              message ncmc_ObtemProcessos;

    procedure tcFinalizaProcessoEv(var Msg: TMessage);
              message ncmc_FinalizaProcesso;    
  public
    { Public declarations }
    property Servidor: TncServidorBase
      read FServidor write SetServidor;

    property Ativo: Boolean
      read FAtivo write SetAtivo;
  end;

  function mwServerWndFunc(hWindow : Hwnd; Msg : UINT;
                         wParam : WPARAM;
                         lParam : LPARAM) : LRESULT; stdcall export;

var
  dmMWServer: TdmMWServer;

const
  NomeClassemwServer = 'ncMWServerClass';

implementation

uses ncMWFileServer, ncMWNex, ncServBase, ncServBD;

{$R *.dfm}

{ TDataModule1 }

procedure TdmMWServer.CriaWinHandle;
var XClass : TWndClass;
begin
  XClass.hInstance := HInstance;
  with XClass do begin
    Style         := 0;
    lpfnWndProc   := @mwServerWndFunc;
    cbClsExtra    := 0;
    cbWndExtra    := SizeOf(Pointer);
    hIcon         := LoadIcon(hInstance, 'DEFICON');
    hCursor       := LoadCursor(0, idc_Arrow);
    hbrBackground := 0;
    lpszMenuName  := nil;
    lpszClassName := NomeClassemwServer;
  end;
  WinProcs.RegisterClass(XClass);

  FWinHandle :=
    CreateWindow(NomeClasseMWServer,     {window class name}
                 '',                     {caption}
                 0,                      {window style}
                 0,                      {X}
                 0,                      {Y}
                 1,                      {width}
                 1,                      {height}
                 0,                      {parent}
                 0,                      {menu}
                 HInstance,              {instance}
                 nil);                   {parameter}
                 
  SetWindowLong(FWinHandle, 0, Longint(Self));
end;

function mwServerWndFunc(hWindow : Hwnd; Msg : UINT;
                         wParam : WPARAM;
                         lParam : LPARAM) : LRESULT; stdcall export;
var
  Obj : TdmMWServer;
  M   : TMessage;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  if MSG<>wm_Create then begin
    Obj := TdmMWServer(GetWindowLong(hWindow, 0));
    if Obj=nil then begin 
      Result := DefWndFunc;
      Exit;
    end;
  end;

  case Msg of
    ncmc_Primeira..ncmc_Ultima : 
    begin
      M.Msg := Msg;
      M.WParam := WParam;
      M.LParam := LParam;
      Obj.DespachaMC(M);
    end;
    
  else 
    Result := DefWndFunc;
  end;
end;

procedure TdmMWServer.DataModuleCreate(Sender: TObject);
var
  fsd:TkbmMWFileServiceDefinition;
begin
  mwFilePool.GarbageCollect;
  FSockLic := -1;
  FCI := TkbmMWClientIdentity.Create;
  FCI.Username := 'NexServer';
  FCI.Token := 'NexServer';

  CriaWinHandle;
  CliNotifyHandle := FWinHandle;

  TkbmMWServiceDefinition(mwServ.RegisterService(TmwNex, False)).Stateful := False;
  fsd := TkbmMWFileServiceDefinition(mwServ.RegisterService(TmwFileServer, False));

  fsd.RootPath:= ExtractFilePath(ParamStr(0));
  fsd.BlockSize:=8192;
  fsd.ListAttributesOptional:=false;
  fsd.ListAttributes:=faReadOnly+faDirectory+faArchive;
  fsd.StorageAttributes:=faArchive;
end;

procedure TdmMWServer.DataModuleDestroy(Sender: TObject);
begin
  DestroyWindow(FWinHandle);
end;

procedure TdmMWServer.DespachaMC(var Msg: TMessage);
begin
  try
    Dispatch(Msg);
  finally
    FreeDados(Msg.Msg, Pointer(Msg.LParam));
  end;    
end;

procedure TdmMWServer.mwTCPIPzDisconnect(AThread: TIdPeerThread);
var aThreadID : Cardinal;
begin
  TncServidor(Servidor).Lock;
  try
    aThreadID := AThread.ThreadID;
    Servidor.LogoutSocket(aThreadID);
  finally
    TncServidor(Servidor).Unlock;
  end;
end;

procedure TdmMWServer.SetAtivo(const Value: Boolean);
begin
  if Value=FAtivo then Exit;
  FAtivo := Value;
  if Value then begin
    mwServ.Active := True;
    mwTCPIPz.Listen;
    mwTCPIPs.Listen;
    FServidor.Login(proxyusername, proxysenha, 0, false, false, FWinHandle, 0, 0, 0, '', FHandle);
  end else begin
    try FServidor.Logout(FHandle); except end;
    FHandle := -1;
    mwTCPIPz.Close;
    mwTCPIPs.Close;
    mwServ.Active := False;
  end;
end;

procedure TdmMWServer.SetServidor(const Value: TncServidorBase);
begin
  FServidor := Value;
end;

procedure TdmMWServer.tcAbriuFechouCaixaEv(var Msg: TMessage);
begin
  mwTCPIPz.SendMessage('Eventos', '', FCI, nil, [ncmc_AbriuFechouCaixa]);
  mwTCPIPs.SendMessage('Eventos', '', FCI, nil, [ncmc_AbriuFechouCaixa]);
end;

procedure TdmMWServer.tcAtualizaObj(var Msg: TMessage);
begin
  TMemoryStream(Msg.LParam).Position := 0;
  mwTCPIPz.SendMessage('Eventos', '', FCI, TMemoryStream(Msg.lParam), [ncmc_AtualizaObj]);
  mwTCPIPs.SendMessage('Eventos', '', FCI, TMemoryStream(Msg.lParam), [ncmc_AtualizaObj]);
end;

procedure TdmMWServer.tcChatEv(var Msg: TMessage);
begin
  TMemoryStream(Msg.LParam).Position := 0;
  mwTCPIPz.SendMessage('Eventos', '', FCI, TMemoryStream(Msg.lParam), [ncmc_ChatEv]);
  mwTCPIPs.SendMessage('Eventos', '', FCI, TMemoryStream(Msg.lParam), [ncmc_ChatEv]);
end;

procedure TdmMWServer.tcDestroiObj(var Msg: TMessage);
begin
  with PmsgDestroiObj(Msg.LParam)^ do begin
    mwTCPIPz.SendMessage('Eventos', '', FCI, nil, [ncmc_DestroiObj, msgTipoClasse, msgChave]);
    mwTCPIPs.SendMessage('Eventos', '', FCI, nil, [ncmc_DestroiObj, msgTipoClasse, msgChave]);
  end;
end;

procedure TdmMWServer.tcFinalizaProcessoEv(var Msg: TMessage);
var 
  aProcessID: Integer;
  aMaq: Word;
  
begin
  with PmsgFinalizaProcesso(Msg.LParam)^ do begin
    aMaq := msgMaq;
    aProcessID := msgProcessID;
    mwTCPIPz.SendMessage('Eventos', '', FCI, nil, [ncmc_FinalizaProcesso, aProcessID, aMaq]);
    mwTCPIPs.SendMessage('Eventos', '', FCI, nil, [ncmc_FinalizaProcesso, aProcessID, aMaq]);
  end;
end;

procedure TdmMWServer.tcNovoObj(var Msg: TMessage);
begin
  TMemoryStream(Msg.lParam).Position := 0;
  mwTCPIPz.SendMessage('Eventos', '', FCI, TMemoryStream(Msg.lParam), [ncmc_NovoObj]);
  mwTCPIPs.SendMessage('Eventos', '', FCI, TMemoryStream(Msg.lParam), [ncmc_NovoObj]);
end;

procedure TdmMWServer.tcObtemProcessosEv(var Msg: TMessage);
begin
  with PmsgObtemProcessos(Msg.LParam)^ do begin
    mwTCPIPz.SendMessage('Eventos', '', FCI, nil, [ncmc_ObtemProcessos, msgIDCliente, msgIDRequest, msgMaq]);
    mwTCPIPs.SendMessage('Eventos', '', FCI, nil, [ncmc_ObtemProcessos, msgIDCliente, msgIDRequest, msgMaq]);
  end;
end;

procedure TdmMWServer.tcPedeTela(var Msg: TMessage);
begin
  mwTCPIPz.SendMessage('Eventos', '', FCI, nil, [ncmc_CapturaTela, Msg.WParam]);
  mwTCPIPs.SendMessage('Eventos', '', FCI, nil, [ncmc_CapturaTela, Msg.WParam]);
end;

procedure TdmMWServer.tcServidorDesativado(var Msg: TMessage);
begin
  FHandle := -1;
  mwTCPIPz.Close;
  mwTCPIPs.Close;
end;

procedure TdmMWServer.tcShutdown(var Msg: TMessage);
begin
  with PmsgShutdown(Msg.LParam)^ do begin
    mwTCPIPz.SendMessage('Eventos', '', FCI, nil, [ncmc_Shutdown, msgMaq, msgOper]);
    mwTCPIPs.SendMessage('Eventos', '', FCI, nil, [ncmc_Shutdown, msgMaq, msgOper]);
  end;
end;

procedure TdmMWServer.tcSiteBloqueadoEv(var Msg: TMessage);
begin
  TMemoryStream(Msg.lParam).Position := 0;
  mwTCPIPz.SendMessage('Eventos', '', FCI, TMemoryStream(Msg.lParam), [ncmc_SiteBloqueado]);
  mwTCPIPs.SendMessage('Eventos', '', FCI, TMemoryStream(Msg.lParam), [ncmc_SiteBloqueado]);
end;

procedure TdmMWServer.tcSuporteRemEv(var Msg: TMessage);
begin
  with PmsgSuporteRemEv(Msg.LParam)^ do begin
    mwTCPIPz.SendMessage('Eventos', '', FCI, nil, [ncmc_SuporteRemEv, msgMaq, msgTec]);
    mwTCPIPs.SendMessage('Eventos', '', FCI, nil, [ncmc_SuporteRemEv, msgMaq, msgTec]);
  end;
end;

procedure TdmMWServer.TimerHTimer(Sender: TObject);
begin
  if gConfig.SincronizarHorarios then begin
    if mwTCPIPz.IsListening then 
      mwTCPIPz.SendMessage('Eventos', '', FCI, nil, [ncmc_HorarioEv, Now]);
      
    if mwTCPIPs.IsListening then 
      mwTCPIPs.SendMessage('Eventos', '', FCI, nil, [ncmc_HorarioEv, Now]);
  end;
end;

procedure TdmMWServer.TimerLicTimer(Sender: TObject);
var M: Integer;
begin
  try
    TimerLic.Enabled  := False;
    TimerLic.Interval := (4*60*1000) + Random(3*60*1000);

    if not (mwTCPIPz.IsListening or mwTCPIPs.IsListening) then Exit;

    TncServidor(Servidor).Lock;
    try
      FSockLic := Servidor.GetProxSocketLic(FSockLic, M);
    finally
      TncServidor(Servidor).Unlock;
    end;

    if FSockLic<>-1 then begin
      mwTCPIPz.SendMessage('Eventos', '', FCI, nil, [ncmc_ChecaLicEv, M]);
      mwTCPIPs.SendMessage('Eventos', '', FCI, nil, [ncmc_ChecaLicEv, M]);
    end;
  finally
    TimerLic.Enabled := True;
  end;

end;

end.
