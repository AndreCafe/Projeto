unit chKBM;

interface

uses
  Classes,
  SysUtils,
  Windows,
  WinProcs,
  Messages,
  kbmMemTable,
  kbmMWGlobal,
  kbmMWCustomTransport, 
  kbmMWClient,
  kbmMWSecurity,
  kbmMWClientDataset,
  kbmMWCustomMessagingTransport, 
  kbmMWTCPIPIndyMessagingClientTransport,
  chBase;

const
  wm_kbmevNodeLogin = wm_user + 1;
  wm_kbmevNodeLogout = wm_user + 2;
  wm_kbmevMsg = wm_user + 3;
  wm_kbmevAlterouNome = wm_user + 4;
  wm_kbmevAlterouStatus = wm_user + 5;  

type  

  TkbmEvNodeLogin = class
  public 
    NodeID: String;
    Username: String;
    Nome: String;
    IP: String;
    Tipo: Integer;
    Status: String;
  end;    

  TkbmEvMsg = class
  public 
    NodeID: String;
    Texto: String;
  end;    

  TkbmEvAlterouNome = class
  public
    NodeID: String;
    Nome: String;
  end;

  TkbmEvAlterouStatus = class
  public
    NodeID: String;
    Status: String;
  end;    

  TkbmEvNodeID = class
    NodeID: String
  end;
   
  TchKBMMW = class ( TClienteChat )
  private
    FClient: TkbmMWCustomClient;
    FCI: TkbmMWClientIdentity;
    FmsgAction : TkbmMWMessageAction;
    FHelpDesk: Boolean;
    FWndHandle : HWND;
    procedure SetClient(const Value: TkbmMWCustomClient);
    function GetTransp: TkbmMWTCPIPIndyMessagingClientTransport;

    procedure MWMessage(Sender:TObject; 
                        const TransportStream:TkbmMWCustomMessageTransportStream; 
                        const Args:TkbmMWArrayVariant; 
                        UserStream:TMemoryStream);

    procedure CriaWndHandle;
                        
  protected
    procedure SetConectado(const Value: Boolean); override;
    procedure SetStatus(const Value: String); override;
    procedure SetNome(const Value: String); override;
    function ObtemContatos: String; override;
    procedure ObtemNodes(MT: TkbmMemTable); override;
    procedure AlteraStatus(const Value: String);
    procedure AlteraNome(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Transp: TkbmMWTCPIPIndyMessagingClientTransport
      read GetTransp;

    procedure EnviaMsg(ANodeID: String; AMsg: String); override;
  published
    property Client: TkbmMWCustomClient
      read FClient write SetClient;

    property HelpDesk: Boolean
      read FHelpDesk write FHelpDesk;
  end;

  procedure Register;

  function chKBMMWWndFunc(hWindow : Hwnd; Msg : UINT;
                          wParam : WPARAM;
        lParam : LPARAM) : LRESULT; stdcall export;
  

const
  SvcName = 'Chat';
  SvcVersion = '100';
  chkbmMWClassName = 'chkbmMWClass';

implementation

uses uMWChatConst;

{ TchKBMMW }

function UltimaPalavra(S: String): String;
var I : Integer;
begin
  I := Length(S);
  while (I>0) and (S[I]<>'.') do Dec(I);
  Result := Copy(S, I+1, Length(S));  
end;

procedure TchKBMMW.AlteraStatus(const Value: String);
begin
  FClient.SendRequest(SvcName, SvcVersion, 'AlteraStatus', [Value]);
end;

procedure TchKBMMW.AlteraNome(const Value: String);
begin
  FClient.SendRequest(SvcName, SvcVersion, 'AlteraNome', [Value]);
end;

constructor TchKBMMW.Create(AOwner: TComponent);
begin
  inherited;
  FClient := nil;
  FCI := TkbmMWClientIdentity.Create;
  CriaWndHandle;
  FHelpDesk := False;
  FmsgAction := TkbmMWMessageAction.Create(Self);
  FmsgAction.OnMessage := MWMessage;
  FmsgAction.Subscriptions.Add('MSG.CHAT.TODOS.>');
  FmsgAction.Subscriptions.Add('MSG.CHAT.'+NodeID+'.>');
end;

destructor TchKBMMW.Destroy;
begin
  Conectado := False;
  FmsgAction.Free;
  FCI.Free;
  DestroyWindow(FWndHandle);
  inherited;
end;

function TchKBMMW.GetTransp: TkbmMWTCPIPIndyMessagingClientTransport;
begin
  Result := nil;
  if FClient <> nil then 
  if (FClient is TkbmMWPooledSimpleClient) then begin
    with TkbmMWPooledSimpleClient(FClient) do 
      if (ConnectionPool<>nil) and 
         (ConnectionPool.Transport<>nil) and 
         (ConnectionPool.Transport is TkbmMWTCPIPIndyMessagingClientTransport) then
        Result := TkbmMWTCPIPIndyMessagingClientTransport(ConnectionPool.Transport);
        
  end else 
  if (FClient.Transport<>nil) and 
     (FClient.Transport is TkbmMWTCPIPIndyMessagingClientTransport) 
  then
    Result := TkbmMWTCPIPIndyMessagingClientTransport(FClient.Transport);
end;

function TchKBMMW.ObtemContatos: String;
begin
  if FHelpDesk then
//    Result := FClient.Request(SvcName, SvcVersion, 'OBTEMLOJAS', [])
    Result := ''
  else
    Result := FClient.SendRequest(SvcName, SvcVersion, 'OBTEMUSUARIOS', [])
end;

procedure TchKBMMW.ObtemNodes(MT: TkbmMemTable);
begin
  MT.AllData := FClient.SendRequest(SvcName, SvcVersion, 'OBTEMNODES', []);
end;

procedure TchKBMMW.SetClient(const Value: TkbmMWCustomClient);
var Cache: TkbmMWCustomClient;
begin
  if Value=FClient then Exit;
  if Value=nil then 
    FmsgAction.Transport := nil
  else begin
    Cache := FClient;
    try
      FClient := Value;
      if Transp=nil then
        Raise Exception.Create('Transport not set on Client');
      if not (Transp is TkbmMWTCPIPIndyMessagingClientTransport) then
        Raise Exception.Create('Invalid transport type on Client');
    except
      FClient := Cache;
      Raise;
    end;      
  end;    
  if Transp <> nil then begin
    FmsgAction.Transport := Transp;
    Transp.Subscriptions.Add('MSG.CHAT.TODOS.>');
    Transp.Subscriptions.Add('MSG.CHAT.'+NodeID+'.>');
  end;  
end;

procedure TchKBMMW.SetConectado(const Value: Boolean);
begin
  if Value = Conectado then Exit;
  
  try
    if Value then begin
      if not FHelpDesk then 
        FClient.Password := SenhaLoja
      else
        FClient.Password := Password;  
      FClient.Username := Username;
      FClient.Location := NodeID;
      Transp.NodeID := NodeID;
      Transp.Active := True;
      RefreshContatos;
      RefreshNodes;
      FCI.Username := Username;
      FCI.Password := FClient.Password;
      FCI.Token := FClient.Token;
      FCI.ClientLocation := FClient.Location;
      Transp.AnnounceSubscriptions;
    end else begin
      Nodes.EmptyTable;
      Contatos.EmptyTable;
      Transp.Active := False;
    end;  
  except
    Transp.Active := False;
    Raise;
  end;  
  
  inherited;
end;

procedure TchKBMMW.SetStatus(const Value: String);
begin
  if Value = Status then Exit;
  if Conectado then 
    AlteraStatus(Value);
  inherited;  
end;

procedure TchKBMMW.SetNome(const Value: String);
begin
  if Value = Nome then Exit;
  if Conectado then 
    AlteraNome(Value);
  inherited;  
end;

procedure Register;
begin
  RegisterComponents('Standard', [TchKBMMW]);
end;
  
procedure TchKBMMW.EnviaMsg(ANodeID, AMsg: String);
begin
  inherited;
  Transp.SendMessage('MSG.CHAT.'+ANodeID+'.TEXTO', '', FCI, nil, [AMsg]);
end;

procedure TchKBMMW.MWMessage(Sender: TObject;
  const TransportStream: TkbmMWCustomMessageTransportStream;
  const Args: TkbmMWArrayVariant; UserStream: TMemoryStream);
var
  S : String;  
  objLogin : TkbmEvNodeLogin;
  objMsg : TkbmEvMsg;
  objNome : TkbmEvAlterouNome;
  objStatus : TkbmEvAlterouStatus;
  objNodeID : TkbmEvNodeID;
begin
  S := TransportStream.Subject;
  if Copy(S, 1, 9) <> 'MSG.CHAT.' then Exit;
  S := UltimaPalavra(S);
  with TransportStream do 
  if S='TEXTO' then begin
    objMsg := TkbmEvMsg.Create;
    objMsg.NodeID := ClientLocation;
    objMsg.Texto := Args[0];
    PostMessage(FWndHandle, wm_kbmevMsg, Integer(ObjMsg), 0);
  end else
  if S='LOGIN' then begin
    objLogin := TkbmevNodeLogin.Create;
    objLogin.NodeID := Args[0];
    objLogin.Username := Args[1];
    objLogin.Nome := Args[2];
    objLogin.Status := Args[3];
    objLogin.IP := Args[4];
    objLogin.Tipo := Args[5];
    PostMessage(FWndHandle, wm_kbmevNodeLogin, Integer(ObjLogin), 0);
  end else 
  if S='LOGOUT' then begin
    objNodeID := TkbmevNodeID.Create;
    objNodeID.NodeID := Args[0];
    PostMessage(FWndHandle, wm_kbmevNodeLogout, Integer(ObjNodeID), 0);
  end else
  if S='NOME' then begin
    objNome := TkbmEvAlterouNome.Create;
    objNome.NodeID := ClientLocation;
    objNome.Nome := Args[0];
    PostMessage(FWndHandle, wm_kbmevAlterouNome, Integer(ObjNome), 0);
  end else
  if S='STATUS' then begin
    objStatus := TkbmEvAlterouStatus.Create;
    objStatus.NodeID := ClientLocation;
    objStatus.Status := Args[0];
    PostMessage(FWndHandle, wm_kbmevAlterouStatus, Integer(ObjStatus), 0);
  end;  
end;

procedure TchKBMMW.CriaWndHandle;
var XClass : TWndClass;
begin
  XClass.hInstance := HInstance;
  with XClass do begin
    Style         := 0;
    lpfnWndProc   := @chkbmMWWndFunc;
    cbClsExtra    := 0;
    cbWndExtra    := SizeOf(Pointer);
    hIcon         := LoadIcon(hInstance, 'DEFICON');
    hCursor       := LoadCursor(0, idc_Arrow);
    hbrBackground := 0;
    lpszMenuName  := nil;
    lpszClassName := chkbmMWClassName;
  end;
  WinProcs.RegisterClass(XClass);

  FWndHandle :=
    CreateWindow(chkbmMWClassName,     {window class name}
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
                 
  SetWindowLong(FWndHandle, 0, Longint(Self));
end;

function chkbmMWWndFunc(hWindow : Hwnd; Msg : UINT;
                        wParam : WPARAM;
                        lParam : LPARAM) : LRESULT; stdcall export;
var
  Obj : TchKBMMW;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  if MSG<>wm_Create then begin
    Obj := TchKBMMW(GetWindowLong(hWindow, 0));
    if Obj=nil then begin 
      Result := DefWndFunc;
      Exit;
    end;
  end;

  if (Msg >= wm_kbmEvNodeLogin) and (Msg<=wm_kbmEvAlterouStatus) then begin
    try
      case Msg of
        wm_kbmevMsg : with TkbmEvMsg(WParam) do 
          Obj.RecebeuMsg(NodeID, Texto);
        wm_kbmevNodeLogin : with TkbmEvNodeLogin(WParam) do 
          Obj.NodeLogin(NodeID, Username, Nome, Status, IP, Tipo);
        wm_kbmevNodeLogout : with TkbmEvNodeID(WParam) do
          Obj.NodeLogout(NodeID);
        wm_kbmevAlterouNome : with TkbmEvAlterouNome(WParam) do 
          Obj.NodeMudouNome(NodeID, Nome);    
        wm_kbmevAlterouStatus : with TkbmEvAlterouStatus(WParam) do 
          Obj.NodeMudouNome(NodeID, Status);    
      end;  
    finally
      TObject(WParam).Free;
    end;    
  end else 
    Result := DefWndFunc;
end;

end.
