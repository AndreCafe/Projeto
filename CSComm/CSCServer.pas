unit CSCServer;

interface

uses
  Classes,
  Windows,
  WinSock,
  Dialogs,
  Math,
  SysUtils,
  Messages,
  CSCBase,
  CSCCustomBase,
  CSCQueue,
  CSCTimer,
  ScktComp;

type
  TMyServerWinSocket = class (TServerWinSocket);
  
  TCSCServerClientWinsocket = class (TServerClientWinSocket)
  private
    FSndRcv: TCSCSenderReceiver;
  public
    constructor Create(Socket: TSocket; ServerWinSocket: TServerWinSocket);
    destructor Destroy; override;

    property SndRcv: TCSCSenderReceiver
      read FSndRcv write FSndRcv;

  end;

  TCSCServer = class ( TCSCCustomCommBase )
    protected
      FDaemon       : TServerSocket;
      FConnected    : Boolean;
      FBusy         : Boolean;
      FBuffer       : PByteArray;
      FSndBuffer    : PnmHeader;
      FTimeout      : integer;
      FAckReceived  : Boolean;
      FReplyTimer   : TCSCTimer;
      FAckMsg       : TnmHeader;
  private
//    FMsgQueue: TCSCMessageQueue;
    protected
      procedure OnClientRead(Sender: TObject;
                             Socket: TCustomWinSocket);

      procedure OnClientWrite(Sender: TObject;
                              Socket: TCustomWinSocket);

      procedure OnClientError(Sender: TObject;
                              Socket: TCustomWinSocket;
                              ErrorEvent: TErrorEvent;
                              var ErrorCode: Integer);

      procedure OnGetSocket(Sender: TObject; Socket: TSocket; var ClientSocket: TServerClientWinSocket);

      procedure SetListening(Value : Boolean);
      function GetListening: Boolean;
      function WaitForAckReply(aHandle: HWND) : Boolean;
      function GetPort: Integer;
      procedure SetPort(Value: Integer);

      function GetOnConnect: TSocketNotifyEvent;
      procedure SetOnConnect(Value: TSocketNotifyEvent);

      function GetOnDisconnect: TSocketNotifyEvent;
      procedure SetOnDisconnect(Value: TSocketNotifyEvent);
  published
      
    public
      constructor Create(Owner: TComponent); override;
      destructor Destroy; override;

      procedure WinsockBreath(aHandle: HWND);
      function LockSocket(Socket: TCustomWinSocket): Boolean;
      
      procedure OnMsgReceived(Socket: TCustomWinSocket; Data: Pointer; DataLen: Integer);
      procedure MsgReceived(aClientSck: TCustomWinSocket; aMsg: PnmHeader); override;
      procedure SendFilePacket(aClientSck: TCustomWinSocket;
                               aFFP: PCSCnmFirstFilePacket;
                               aFP: TCSCnmFilePacket;
                               aFS: TFileStream); override;

      procedure Disconnect(NH : HWND);

      procedure SendInternalMsg(aMsg        : longint;
                                aEvent      : Boolean;
                                aClient     : TCustomWinSocket;
                                aData       : pointer;
                                aDataLen    : LongInt; 
                                aDataType   : TNetMsgDataType;
                                aErrorCode  : Word); 
                        
      procedure SendMsg(aMsg        : longint;
                        aEvent      : Boolean;
                        aClient     : TCustomWinSocket;
                        aData       : pointer;
                        aDataLen    : LongInt;
                        aDataType   : TNetMsgDataType;
                        aErrorCode  : Word); override;

      procedure SendACK(Socket: TCustomWinSocket);

      property Daemon: TServerSocket read FDaemon;   

      property Listening: Boolean read GetListening write SetListening;
                            
{      property MsgQueue: TCSCMessageQueue
         read FMsgQueue;   }

    published     
      property Port: Integer
         read GetPort write SetPort;

      property OnConnect: TSocketNotifyEvent
         read GetOnConnect write SetOnConnect;

      property OnDisconnect: TSocketNotifyEvent
         read GetOnDisconnect write SetOnDisconnect;
         
  end;

implementation


{===TCSCServer=========================================}

function TCSCServer.GetPort: Integer;
begin
  Result := FDaemon.Port;
end;

function TCSCServer.LockSocket(Socket: TCustomWinSocket): Boolean;
var I : Integer;
begin
  FDaemon.Socket.Lock;
  try
    for I := 0 to FDaemon.Socket.ActiveConnections-1 do 
    if Socket = FDaemon.Socket.Connections[I]  then begin
      Socket.Lock;
      Result := True;
      Exit;
    end;
  finally
    FDaemon.Socket.Unlock;
  end;
  Result := False;
end;

procedure TCSCServer.SetPort(Value: Integer);
begin
  FDaemon.Port := Value;
end;
      
procedure TCSCServer.WinsockBreath(aHandle: HWND);
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, CM_SOCKETMESSAGE, CM_LOOKUPCOMPLETE, PM_REMOVE) do  begin
//  while PeekMessage(Msg, 0, WM_User, WM_User+100, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;  
end;

function TCSCServer.WaitForAckReply(aHandle: HWND) : Boolean;
begin
  {wait for reply or timeout, whichever occurs first}
  SetTimer(FReplyTimer, 10000);
  FAckReceived := False;
  while not FAckReceived and
       (not HasTimerExpired(FReplyTimer)) 
        do WinsockBreath(aHandle);
        
  Result := FAckReceived;
  if not FAckReceived then begin
    Result := False;
  end;
end;  

{function TCSCServer.SocketByHWND(NH : HWND) : TCustomWinSocket;
var I : Integer;
begin
  with FDaemon.Socket do
  for I := 0 to ActiveConnections-1 do
  if Connections[I].Handle=NH then begin
    Result := Connections[I];
    Exit;
  end;
  Result := nil;
end;}

procedure TCSCServer.Disconnect(NH : HWND);
var I : Integer;
begin
  with FDaemon.Socket do 
  for I := 0 to ActiveConnections-1 do 
  if Connections[I].Handle=NH then begin
    FDaemon.Socket.Disconnect(NH);
    Exit;
  end;
end;

procedure TCSCServer.SetListening(Value : Boolean);
begin
  if Value=FDaemon.Active then Exit;
  if Value then 
    FDaemon.Open
  else 
    FDaemon.Close;
end;

function TCSCServer.GetListening: Boolean;
begin
  Result := FDaemon.Active;
end;

constructor TCSCServer.Create(Owner: TComponent);
begin
  inherited;
  FIsServer := True;
  FAckMsg.nmhEvent := False;
  FAckMsg.nmhMsgID := cscnmAck;
  FAckMsg.nmhFirst := True;
  FAckMsg.nmhLast  := True;
  FAckMsg.nmhErrorCode := 0;
  FAckMsg.nmhMsgLen    := NetMsgHeaderSize;
  FAckMsg.nmhTotalSize := 0;
  
  FBusy := False;

  GetMem(FBuffer, MaxNetMsgSize);
  FSndBuffer := PnmHeader(FBuffer);

  FTimeout := CSCTimerMaxExpiry;
  
  FDaemon := TServerSocket.Create(nil);
  FDaemon.OnClientRead := OnClientRead;
  FDaemon.OnClientWrite := OnClientWrite;
  FDaemon.OnClientError := OnClientError;
  FDaemon.OnGetSocket := OnGetSocket;
  FDaemon.ServerType := stNonBlocking;
  FDaemon.Active := False;
end;

function TCSCServer.GetOnConnect: TSocketNotifyEvent;
begin
  Result := FDaemon.OnClientConnect;
end;

procedure TCSCServer.SetOnConnect(Value: TSocketNotifyEvent);
begin
  FDaemon.OnClientConnect := Value;
end;

function TCSCServer.GetOnDisconnect: TSocketNotifyEvent;
begin
  Result := FDaemon.OnClientDisconnect;
end;

procedure TCSCServer.SetOnDisconnect(Value: TSocketNotifyEvent);
begin
  FDaemon.OnClientDisconnect := Value;
end;

{--------}
procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

destructor TCSCServer.Destroy;
var I : Integer;
begin
  with FDaemon.Socket do begin
    for I := 0 to pred(ActiveConnections) do 
      Connections[I].Close;
    while ActiveConnections > 0 do ProcessMessages;
  end;
    
  FDaemon.Close;
  FDaemon.Free;
  FreeMem(FBuffer, MaxNetMsgSize);
  inherited Destroy;
end;
{--------}
procedure TCSCServer.OnClientError(Sender: TObject;
                                   Socket: TCustomWinSocket;
                                   ErrorEvent: TErrorEvent;
                                   var ErrorCode: Integer);
begin
  if (ErrorEvent=eeDisconnect) then begin
    TMyServerWinSocket(FDaemon.Socket).ClientDisconnect(Socket);
    ErrorCode := 0;
  end;
end;
{--------}
procedure TCSCServer.OnMsgReceived(Socket: TCustomWinSocket; Data: Pointer; DataLen: Integer);
begin
  MsgQueue.AddPacket(Data, Socket, DataLen);
end;

procedure TCSCServer.OnClientRead(Sender: TObject;
                                  Socket: TCustomWinSocket);
{var DataLen    : Integer;}
begin
{  DataLen := Socket.ReceiveBuf(FBuffer^[0], MaxNetMsgSize);
  MsgQueue.AddPacket(FBuffer, Socket.Handle, DataLen);}
  TCSCServerClientWinsocket(Socket).SndRcv.Read;
end;

procedure TCSCServer.OnClientWrite(Sender: TObject;
                                   Socket: TCustomWinSocket);
begin
  TCSCServerClientWinsocket(Socket).SndRcv.Write;
end;

{--------}
procedure TCSCServer.MsgReceived(aClientSck: TCustomWinSocket; aMsg: PnmHeader);
begin
  with aMsg^ do begin
    if nmhMsgID = cscnmAck then
      FAckReceived := True 
    else
    if (not nmhLast) then
      SendAck(aClientSck);
  end;  
end;

procedure TCSCServer.SendFilePacket(aClientSck: TCustomWinSocket;
                                    aFFP: PCSCnmFirstFilePacket;
                                    aFP: TCSCnmFilePacket;
                                    aFS: TFileStream);
var
  S : TMemoryStream;
  MsgID,
  FPLen,
  HeaderLen: Integer;
begin
  S := TMemoryStream.Create;
  try
    HeaderLen := 0;
    if aFFP<>nil then begin
      HeaderLen := SizeOf(TCSCnmFirstFilePacket);
      S.WriteBuffer(aFFP^, HeaderLen);
      MsgID := CSCnmFirstFilePacket;
    end else 
      MsgID := CSCnmFilePacket;
    HeaderLen := HeaderLen + SizeOf(aFP);
    FPLen := MaxNetMsgSize-NetMsgHeaderSize-HeaderLen-1;
    if FPLen > (aFP.nmFileSize - aFS.Position) then begin
      FPLen := aFP.nmFileSize - aFS.Position;
      aFP.nmLast := True;
    end else aFP.nmLast := False;
    S.WriteBuffer(aFP, SizeOf(aFP));
    S.CopyFrom(aFS, FPLen);
    SendMsg(MsgID, True, aClientSck, Pointer(S), S.Size, nmdStream, 0);
  finally
    S.Free;
  end;
end;

procedure TCSCServer.SendACK(Socket: TCustomWinSocket);
var BytesSent: integer;
begin
  with TCSCServerClientWinSocket(Socket) do
  SndRcv.Send(PByteArray(@FAckMsg), NetMsgHeaderSize, 0, BytesSent);
end;
{--------}

procedure TCSCServer.SendInternalMsg(aMsg        : longint;
                                     aEvent      : Boolean;
                                     aClient     : TCustomWinSocket;
                                     aData       : pointer;
                                     aDataLen    : LongInt;
                                     aDataType   : TNetMsgDataType;
                                     aErrorCode  : Word);
var
  DataAsStream    : TStream absolute aData;
  DataAsBytes     : PByteArray absolute aData;
  TotalDataLen    : longint;
  BytesToGo       : longint;
  BytesToSend     : longint;
  StartOfs        : longint;
  FirstMsg        : boolean;
  LastMsg         : boolean;
begin
  {check for reentrancy}   
  if FBusy then Exit;

  FBusy := true;                                          
  StartOfs := 0;
  try

{    if (aDataType = nmdByteArray)
      then TotalDataLen := aDataLen
      else TotalDataLen := DataAsStream.Size;}
    TotalDataLen := aDataLen;

    {we're just about to send the first message of (maybe) many}
    FirstMsg := true;
    {send the message}
    {..initialize loop variables}
    BytesToGo := TotalDataLen;
    if (aDataType = nmdByteArray) 
      then StartOfs := 0
      else if aDataLen > 0 
        then DataAsStream.Position := 0;
    {..send data in reasonably sized chunks}
    repeat
      {..set up the invariant parts of the message header}
      with FSndBuffer^ do begin
        nmhMsgID := aMsg;
        nmhEvent := aEvent;
        nmhTotalSize := TotalDataLen;
        nmhErrorCode := aErrorCode;
        nmhDataType := aDataType;
      end;
    
      {calculate the size of data in this message packet}
      BytesToSend := MinIntValue([BytesToGo,
                                  MaxNetMsgSize-NetMsgHeaderSize]);
      LastMsg := (BytesToSend = BytesToGo);
      with FSndBuffer^ do begin
        nmhMsgLen := NetMsgHeaderSize + BytesToSend;
        nmhFirst  := FirstMsg;
        nmhLast   := LastMsg;
      end;
      if (BytesToSend > 0) then begin
        if (aDataType = nmdByteArray) 
          then Move(DataAsBytes^[StartOfs], FSndBuffer^.nmhData, BytesToSend)
          else DataAsStream.Read(FSndBuffer^.nmhData, BytesToSend);
      end;

      MsgQueue.AddPacket(PByteArray(FSndBuffer), aClient, NetMsgHeaderSize + BytesToSend);
      
      if not LastMsg then begin
        dec(BytesToGo, BytesToSend);
        if (aDataType = nmdByteArray) 
          then inc(StartOfs, BytesToSend);
        FirstMsg := false;
      end;
    until LastMsg;

  finally                  
    {we're no longer busy}
    FBusy := false; 
  end;              
end;
                                                
procedure TCSCServer.SendMsg(aMsg        : longint;
                             aEvent      : Boolean;
                             aClient     : TCustomWinSocket;
                             aData       : pointer;
                             aDataLen    : LongInt;
                             aDataType   : TNetMsgDataType;
                             aErrorCode  : Word);
var
  DataAsStream    : TStream absolute aData;
  DataAsBytes     : PByteArray absolute aData;
  TotalDataLen    : longint;
  BytesToGo       : longint;
  BytesToSend     : longint;
  BytesSent       : longint;
  StartOfs        : longint;
  FirstMsg        : boolean;
  LastMsg         : boolean;
begin
  {check for reentrancy}
  if FBusy then 
    Exit;
  StartOfs := 0;

  FBusy := true;
  try
{    if (aDataType = nmdByteArray) 
      then TotalDataLen := aDataLen
      else TotalDataLen := DataAsStream.Size;}
    TotalDataLen := aDataLen;  

    {we're just about to send the first message of (maybe) many}
    FirstMsg := true;
    {send the message}
    {..initialize loop variables}
    BytesToGo := TotalDataLen;
    if (aDataType = nmdByteArray) 
      then StartOfs := 0
      else if aDataLen > 0
        then DataAsStream.Position := 0;
    {..send data in reasonably sized chunks}
    repeat
      {..set up the invariant parts of the message header}
      with FSndBuffer^ do begin
        nmhMsgID := aMsg;
        nmhEvent := aEvent;
        nmhTotalSize := TotalDataLen;
        nmhErrorCode := aErrorCode;
        nmhDataType := aDataType;
      end;

      {calculate the size of data in this message packet}
      BytesToSend := MinIntValue([BytesToGo,
                                  MaxNetMsgSize-NetMsgHeaderSize]);
      LastMsg := (BytesToSend = BytesToGo);
      with FSndBuffer^ do begin
        nmhMsgLen := NetMsgHeaderSize + BytesToSend;
        nmhFirst  := FirstMsg;
        nmhLast   := LastMsg;
      end;

      if (BytesToSend > 0) then begin
        if (aDataType = nmdByteArray) 
          then Move(DataAsBytes^[StartOfs], FSndBuffer^.nmhData, BytesToSend)
          else DataAsStream.Read(FSndBuffer^.nmhData, BytesToSend);
      end;

      if not LockSocket(aClient) then begin 
        Exit;
      end;
      try
        with TCSCServerClientWinSocket(aClient) do
        SndRcv.Send(PByteArray(FSndBuffer), NetMsgHeaderSize + BytesToSend, 0, BytesSent);
      finally
        aClient.Unlock;
      end;

      if not LastMsg then begin
        LastMsg := not WaitForAckReply(aClient.Handle);
        
        dec(BytesToGo, BytesToSend);
        if (aDataType = nmdByteArray)
          then inc(StartOfs, BytesToSend);
        FirstMsg := false;
      end;
    until LastMsg;

  finally
    {we're no longer busy}
    FBusy := false;
  end;
end;
{--------}

procedure TCSCServer.OnGetSocket(Sender: TObject; Socket: TSocket; var ClientSocket: TServerClientWinSocket);
begin
  ClientSocket := TCSCServerClientWinsocket.Create(Socket, FDaemon.Socket);
  TCSCServerClientWinSocket(ClientSocket).SndRcv.OnMsgReceived := OnMsgReceived;
end;

{====================================================================}

constructor TCSCServerClientWinsocket.Create(Socket: TSocket; ServerWinSocket: TServerWinSocket);
begin
  FSndRcv := TCSCSenderReceiver.Create(Self);
  inherited Create(Socket, ServerWinSocket);
end;

destructor TCSCServerClientWinsocket.Destroy;
begin
  FSndRcv.Free;
  inherited;
end;

end.
