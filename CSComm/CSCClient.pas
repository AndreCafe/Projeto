unit CSCClient;

interface

uses
  Classes,
  Consts,
  Controls,
  Dialogs,
  Windows,
  Forms,
  Math,
  ExtCtrls,
  SysUtils,
  Messages,
  SyncObjs,
  CSCBase,
  CSCQueue,
  CSCTimer,
  CSCCustomBase,
  ScktComp;

type
  TCSCClient = class( TCSCCustomCommBase )
    protected
      FIPPort         : TClientSocket;
      FSndRcv         : TCSCSenderReceiver;
      FConnected      : Boolean;
      FBusy           : Boolean;
      FBuffer         : PByteArray;
      FSndBuffer      : PnmHeader;
      FReplyTimer     : TCSCTimer;
      FBufPos         : Integer;
      FBufMaxPos      : Integer;
      FAckMsg         : TnmHeader;
      FAckReceived    : Boolean;
      FOnConnect      : TNotifyEvent;
      FOnDisconnect   : TNotifyEvent;
      
      FAutoReconnect  : Boolean;
      FRetryConnection: Boolean;
      FAlreadyConn    : Boolean;
      FUserDisconnect : Boolean;
      FTryReconnect   : Boolean;
      FReconnTimer    : TTimer;
      FServerOffLine  : Boolean;
      FConnErrorStr   : String;
      FWinsockError   : Integer;
      FSockHWND       : HWND;
      FConnecting     : Boolean;

      FTicksLastCom   : Cardinal;

    protected
      procedure HandleAppException(Sender: TObject; E: Exception);
    
      procedure SetConnected(Value : Boolean);

      function WaitForAckReply : Word;
      function WaitForReply : Word;

      function GetAddress: String;
      function GetHost: String;
      function GetPort: Integer;
      procedure SetPort(Value: Integer);
      procedure SetAddress(Value: String);
      procedure SetHost(Value: String);

      procedure OnReconnTimer(Sender: TObject);
      
      procedure OnSckConnect(Sender: TObject;
                             Socket: TCustomWinSocket);

      procedure OnRead(Sender: TObject;
                       Socket: TCustomWinSocket);

      procedure OnWrite(Sender: TObject;
                        Socket: TCustomWinSocket);

      procedure OnSckDisconnect(Sender: TObject;
                                Socket: TCustomWinSocket);

      procedure OnError(Sender: TObject;
                        Socket: TCustomWinSocket;
                        ErrorEvent: TErrorEvent;
                        var ErrorCode: Integer);

      procedure OnMsgReceived(Socket: TCustomWinSocket; Data: Pointer; DataLen: Integer);

      procedure SocketConnected; virtual; 
      procedure SocketDisconnected; virtual;

      procedure SendACK;

      procedure TryReconnect;
      procedure Reconnect;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      property TicksLastCom: Cardinal
        read FTicksLastCom;

      procedure MsgReceived(aClientSck: TCustomWinSocket; aMsg: PnmHeader); override;
      procedure SendFilePacket(aClientSck: TCustomWinSocket;
                               aFFP: PCSCnmFirstFilePacket;
                               aFP : TCSCnmFilePacket;
                               aFS : TFileStream); override;

      procedure SendMsg(aMsg        : longint;
                        aEvent      : Boolean;
                        aClient     : TCustomWinSocket;
                        aData       : pointer;
                        aDataLen    : LongInt;
                        aDataType   : TNetMsgDataType;
                        aErrorCode  : Word); override;


      function UploadFile(SourceFN, DestFN, Info: String; var UserInfo; UserInfoSize: Integer): Word;
      function DownloadFile(SourceFN, DestFN, Info: String; var UserInfo; UserInfoSize: Integer): Word;
      procedure ProcessSocketMessages;
      procedure ProcessAllMessages;

      function RequestData(aMsg        : longint;
                           aRequest    : pointer;
                              aReqLen  : LongInt;
                              aReqType : TNetMsgDataType;
                           aReply      : pointer;
                              aRpyLen  : LongInt;
                              aRpyType : TNetMsgDataType) : Word;

      procedure ConnectAndWait;                        

      property Connected : Boolean read FConnected write SetConnected;

      property WinsockError: Integer
        read FWinsockError;

      property IPPort: TClientSocket
        read FIPPort;
    published
      property Address: String
          read GetAddress write SetAddress;

      property Host: String
          read GetHost write SetHost;

      property Port: Integer
          read GetPort write SetPort;

      property AutoReconnect: Boolean
          read FAutoReconnect write FAutoReconnect;    

      property RetryConnection: Boolean
          read FRetryConnection write FRetryConnection;    

      property OnConnect: TNotifyEvent
          read FOnConnect write FOnConnect;

      property OnDisconnect: TNotifyEvent
          read FOnDisconnect write FOnDisconnect;
  end;

  TemClient = record
    fCli : TCSCClient;
    fThreadID : Cardinal;
  end;

  PemClient = ^TemClient;
  
  TCSCExceptionManager = class
  private
    FThreads : TList;
    FCS : TCriticalSection;
    FSaveAppEH : TExceptionEvent;

    function GetByThread: PemClient;

    procedure HandleAppException(Sender: TObject; E: Exception);
  public 
    constructor Create;
    destructor Destroy; override;

    function Count: Integer;

    procedure Add(aCli: TCSCClient);
    procedure Remove(aCli: TCSCClient); 
  end;

var
  ExceptionMgr : TCSCExceptionManager;
  Reply_Timeout : Integer = 23000;

implementation

const
  CM_EXECPROC = $8FFF;

{===TCSCClient=========================================}

function TCSCClient.GetPort: Integer;
begin
  Result := FIPPort.Port;
end;

procedure TCSCClient.SetPort(Value: Integer);
begin
  FIPPort.Port := Value;
end;

function TCSCClient.GetAddress: String;
begin
  Result := FIPPort.Address;
end;

function TCSCClient.GetHost: String;
begin
  Result := FIPPort.Host;
end;

procedure TCSCClient.SetAddress(Value: String);
begin
  FIPPort.Address := Value;
end;

procedure TCSCClient.SetHost(Value: String);
begin
  FIPPort.Host := Value;
end;
      
procedure TCSCClient.ProcessAllMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TCSCClient.ProcessSocketMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, FSockHWND, 0, 0, PM_REMOVE) do begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
  while PeekMessage(Msg, NotifyHandle, cscm_FileEventReceived, cscm_FileEventReceived, PM_REMOVE) do
    DispatchMessage(Msg);    
end;

function TCSCClient.WaitForReply : Word;
begin
  {wait for data or timeout, whichever occurs first}
  SetTimer(FReplyTimer, Reply_Timeout);
  while FMsgQueue.IsEmpty and
        (not HasTimerExpired(FReplyTimer)) and
        FConnected do ProcessSocketMessages;
        
  if not FConnected or FMsgQueue.IsEmpty then 
  begin
    Connected := False;
    Result := CSCErr_ServerCommLost;
    Exit;
  end;
  
  {otherwise, everything's OK}
  Result := CSCERR_NONE;
end;  

procedure TCSCClient.SetConnected(Value : Boolean);
begin
  try
    if not Value then begin
      FUserDisconnect := True;
      FIPPort.Socket.Close;
      FIPPort.Close;
    end;
  except
  end;

  if FConnected=Value then Exit;
  
  FTryReconnect := False;
  if Value then begin
{    if FRetryConnection then begin
      FTryReconnect := True;
      TryReconnect;
    end else begin  }
      FUserDisconnect := False;
      FIPPort.Socket.Close;
      FIPPort.Open;
{    end;  }
  end else begin
    FUserDisconnect := True;
    FIPPort.Socket.Close;
    FIPPort.Close;
  end;  
end;

constructor TCSCClient.Create(AOwner: TComponent);
begin
  inherited;
  FConnecting      := False;
  FTicksLastCom    := 0;
  FAutoReconnect   := False;
  FRetryConnection := False;
  FAlreadyConn     := False;
  FUserDisconnect  := False;
  FTryReconnect    := False;
  FConnected       := False;
  FIsServer        := False;
  FAckReceived     := False;
  FAckMsg.nmhEvent := True;
  FAckMsg.nmhMsgID := cscnmAck;
  FAckMsg.nmhFirst := True;
  FAckMsg.nmhLast  := True;
  FAckMsg.nmhErrorCode := 0;
  FAckMsg.nmhMsgLen    := NetMsgHeaderSize;
  FAckMsg.nmhTotalSize := 0;

  FBusy := False;
  FBufPos := 0;

  FReconnTimer := TTimer.Create(nil);
  FReconnTimer.Interval := 10000;
  FReconnTimer.Enabled := False;
  FReconnTimer.OnTimer := OnReconnTimer;

  GetMem(FBuffer, MaxNetMsgSize);
  FSndBuffer := PnmHeader(FBuffer);

  FIPPort := TClientSocket.Create(nil);
  FSndRcv := TCSCSenderReceiver.Create(FIPPort.Socket);
  FIPPort.ClientType := ctNonBlocking;
  FSockHWND := FIPPort.Socket.Handle;
  
  FIPPort.OnConnect := OnSckConnect;
  FIPPort.OnRead := OnRead;
  FIPPort.OnWrite := OnWrite;
  FIPPort.OnDisconnect := OnSckDisconnect;
  FIPPort.OnError := OnError;
  FSndRcv.OnMsgReceived := OnMsgReceived;
  FOnConnect := nil;
  FOnDisconnect := nil;
end;
{--------}
destructor TCSCClient.Destroy;
begin
  FReconnTimer.Free;
  FTryReconnect := False;
  FIPPort.Close;
  FSndRcv.Free;
  FIPPort.Free;
  FreeMem(FBuffer, MaxNetMsgSize);
  inherited Destroy;
end;
{--------}
procedure TCSCClient.OnSckDisconnect(Sender: TObject;
                                     Socket: TCustomWinSocket);
begin
  if FConnected then begin
    FConnected := False;
    FMsgQueue.DeleteSocketMessages(nil);
    SocketDisconnected;
    if Assigned(FOnDisconnect) then 
      FOnDisconnect(Self);
    Reconnect;  
  end else
    FConnected := False;   
end;                                                 
{--------}
procedure TCSCClient.OnError(Sender: TObject;
                             Socket: TCustomWinSocket;
                             ErrorEvent: TErrorEvent;
                             var ErrorCode: Integer);
begin
  FWinsockError := ErrorCode;
  if FConnecting then begin
    ErrorCode := 0;
    FConnErrorStr := 'Socket error';
  end else
  if ErrorCode = 10053 then begin
    OnSckDisconnect(Sender, Socket);
    ErrorCode := 0;
    Reconnect;  
  end else 
  if FTryReconnect and (ErrorCode=10061) then begin
    ErrorCode := 0;
    FServerOffLine := True;
  end;
end;                      
{--------}
procedure TCSCClient.OnSckConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  FConnected := True;
  FAlreadyConn := True;
  FTryReconnect := False;
  SocketConnected;
  if Assigned(FOnConnect) then 
      FOnConnect(Self);
end;                                              

procedure TCSCClient.MsgReceived(aClientSck: TCustomWinSocket; aMsg: PnmHeader);
begin
  with aMsg^ do 
  if nmhMsgID = cscnmAck then 
    FAckReceived := True
  else if not nmhLast then 
    SendAck;
end;

procedure TCSCClient.SocketConnected; 
begin
end;

procedure TCSCClient.SocketDisconnected; 
begin
end;
      
procedure TCSCClient.OnMsgReceived(Socket: TCustomWinSocket; Data: Pointer; DataLen: Integer);
begin
  FMsgQueue.AddPacket(Data, nil, DataLen);
end;

procedure TCSCClient.OnRead(Sender: TObject; Socket: TCustomWinSocket);
begin
  FSndRcv.Read;
end;

procedure TCSCClient.OnWrite(Sender: TObject;
                             Socket: TCustomWinSocket);
begin
  FSndRcv.Write;
end;


{--------}
function TCSCClient.WaitForAckReply : Word;
begin
  {wait for data or timeout, whichever occurs first}
  FAckReceived := False;
  SetTimer(FReplyTimer, Reply_Timeout);
  while not FAckReceived and
       (not HasTimerExpired(FReplyTimer)) and
       FConnected do ProcessSocketMessages;
  {do we still have a connection?}
  if not FConnected or (not FAckReceived) then begin
    Connected := False;
    Result := CSCERR_ServerCommLost;
    Exit;
  end;
  {otherwise, everything's hunky dory}
  Result := CSCErr_None;
end;  

procedure TCSCClient.SendACK;
var BytesSent: integer;
begin
  FSndRcv.Send(PByteArray(@FAckMsg), NetMsgHeaderSize, 0, BytesSent);
end;

procedure TCSCClient.OnReconnTimer(Sender: TObject);
begin
  FReconnTimer.Enabled := False;
  if not FTryReconnect then Exit;
  TryReconnect;
end;

procedure TCSCClient.TryReconnect;
begin
  FUserDisconnect := False;
  try
    FServerOffLine := False;
    FIPPort.Socket.Close;
    FIPPort.Open;
    while FTryReconnect and (not FServerOffLine) do begin
      FServerOffLine := False;
      ProcessAllMessages;
      Sleep(5);
    end;
    if FServerOffLine then
      FReconnTimer.Enabled := True;
  except
    FReconnTimer.Enabled := True;
  end;
end;

procedure TCSCClient.Reconnect;
begin
  if FUserDisconnect or 
     (not FAutoReconnect) or 
     (not FAlreadyConn) then Exit;
  FTryReconnect := True;
  FReconnTimer.Enabled := True;   
end;     

function TCSCClient.UploadFile(SourceFN, DestFN, Info: String; var UserInfo; UserInfoSize: Integer): Word;
begin
  if DestFN = ''
    then DestFN := SourceFN;
  Result := MsgQueue.TransmitFile(nil, SourceFN, DestFN, '', UserInfo, UserInfoSize, 0);
{  if Result = 0 then begin
    Result := WaitForReply;
    if Result = 0 then begin
      Result := MsgQueue.Examine^.dmErrorCode;
      MsgQueue.Pop;
    end;
  end;}
  if Result <> 0
    then Raise ECSError.Create(Result);
end;

function TCSCClient.DownloadFile(SourceFN, DestFN, Info: String; var UserInfo; UserInfoSize: Integer): Word;
var
  Request: TCSCnmGetFileReq;
begin
  Result := 0;
  if DestFN = ''
    then DestFN := SourceFN;
  with Request do begin
    StrECopy(nmSourceFN, PChar(SourceFN));
    StrECopy(nmDestFN, PChar(DestFN));
    StrECopy(nmFileInfo, PChar(Info));
    if UserInfoSize > SizeOf(nmUserInfo)
      then Move(UserInfo, nmUserInfo, SizeOf(nmUserInfo))
      else Move(UserInfo, nmUserInfo, UserInfoSize);
    SendMsg(CSCnmGetFileReq, True, nil,
            @Request, SizeOf(Request), nmdByteArray, 0);
    Result := WaitForReply;
    if Result = 0 then begin
      Result := MsgQueue.Examine^.dmErrorCode;
      MsgQueue.Pop;
    end;
  end;
end;

procedure TCSCClient.SendFilePacket(aClientSck: TCustomWinSocket;
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
    end else MsgID := CSCnmFilePacket;
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

procedure TCSCClient.SendMsg(aMsg        : longint;
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
  StartOfs := 0;

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
     FSndRcv.Send(PByteArray(FSndBuffer), NetMsgHeaderSize + BytesToSend, 0, BytesSent);
     if not LastMsg then begin
       LastMsg := (WaitForAckReply<>0);
       dec(BytesToGo, BytesToSend);
       if (aDataType = nmdByteArray)
         then inc(StartOfs, BytesToSend);
       FirstMsg := false;
    end;
  until LastMsg;
end;
{--------}

function TCSCClient.RequestData(aMsg     : longint;
                                aRequest : pointer;
                                aReqLen  : LongInt;          
                                aReqType : TNetMsgDataType;
                                aReply   : pointer;
                                aRpyLen  : LongInt;          
                                aRpyType : TNetMsgDataType) : Word;
var
  RequestAsStream : TStream absolute aRequest;
  RequestAsBytes  : PByteArray absolute aRequest;
  ReplyAsStream   : TStream absolute aReply;
  ReplyAsBytes    : PByteArray absolute aReply;
  DataMsg         : PCSCMessage;
  TotalDataLen    : longint;
  DataLen         : LongInt;
  BytesToGo       : longint;
  BytesToSend     : longint;
  BytesSent       : longint;
  StartOfs        : longint;
  FirstMsg        : boolean;
  LastMsg         : boolean;
  SkipSend        : boolean;
begin
  Result := 0;
  StartOfs := 0;
  
  {check for connection}
  if not FConnected then begin
    Result := CSCERR_ServerNotFound;
    Exit;
  end;
  
  {check for reentrancy}
  if FBusy then begin
    Result := CSCERR_SystemBusy;
    Exit;
  end;                          
  FBusy := true;                                          
  try
    DataMsg := nil;
    {check to see whether we've got the reply already}
    SkipSend := false;
    if not FMsgQueue.IsEmpty then begin
      DataMsg := FMsgQueue.Examine;
      while (DataMsg^.dmMsg <> aMsg) do begin
        FMsgQueue.Pop;
        if not FMsgQueue.IsEmpty then
          DataMsg := FMsgQueue.Examine
        else
          Break;
      end;
      if (not FMsgQueue.IsEmpty) then
        SkipSend := true;
    end;

    {do we need to send a message?}
    if not SkipSend then begin
      {calculate the total message data length}
      if (aReqType = nmdByteArray) 
        then TotalDataLen := aReqLen
        else TotalDataLen := RequestAsStream.Size;
      {we're just about to send the first message of (maybe) many}
      FirstMsg := true;
      {send the message}
      {..initialize loop variables}
      BytesToGo := TotalDataLen;
      if (aReqType = nmdByteArray) 
        then StartOfs := 0
        else RequestAsStream.Position := 0;
       {..send data in reasonably sized chunks}
      repeat
        {..set up the invariant parts of the message header}
        with FSndBuffer^ do begin
          nmhMsgID := aMsg;
          nmhEvent := True;
          nmhTotalSize := TotalDataLen;
          nmhErrorCode := 0;
          nmhDataType := aReqType;
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
          if (aReqType = nmdByteArray) 
            then Move(RequestAsBytes^[StartOfs], FSndBuffer^.nmhData, BytesToSend)
            else RequestAsStream.Read(FSndBuffer^.nmhData, BytesToSend);
        end;

        FSndRcv.Send(PByteArray(FSndBuffer), NetMsgHeaderSize + BytesToSend, 0, BytesSent);

        if not LastMsg then begin
          Result := WaitForAckReply;
          dec(BytesToGo, BytesToSend);
          if (aReqType = nmdByteArray) then
            inc(StartOfs, BytesToSend);
          FirstMsg := false;
        end;
      until LastMsg or (Result<>0);

      if Result <> 0 then Exit;

      {Request sent - waiting to receive (multiple?) packets}
      if (aRpyType <> nmdByteArray) 
        then ReplyAsStream.Position := 0;

      {wait for the reply to arrive from the server}
      Result := WaitForReply;
      if (Result <> CSCErr_None)
        then Exit;

      DataMsg := FMsgQueue.Examine;
    end;
    {check if there was an error code passed back; if so this will
     be the only message and there's no data whatsoever}
    if (DataMsg^.dmErrorCode <> 0) then begin
      Result := DataMsg^.dmErrorCode;
      FMsgQueue.Pop;
      Exit;
    end;
    {if there is no error code, there is (presumably) data: copy the
     data over}
    Result := DataMsg^.dmErrorCode;
    if (aRpyType = nmdByteArray) then begin
      DataLen := MinIntValue([aRpyLen, DataMsg^.dmDataLen]);
      if (DataLen > 0)
        then Move(DataMsg^.dmData^, ReplyAsBytes^[0], DataLen);
    end
    else {it's a stream} begin
      DataLen := DataMsg^.dmDataLen;
      if (DataLen > 0) then begin
        TMemoryStream(DataMsg^.dmData).Position := 0;
        ReplyAsStream.CopyFrom(TMemoryStream(DataMsg^.dmData), DataLen);
      end;
    end;
    {we've done with the message, pop it from the queue}
    FMsgQueue.Pop;

  finally   
    FTicksLastCom := GetTickCount;
                 
    {we're no longer busy} 
    FBusy := false; 
  end;              
end;
{--------}

{====================================================================}

procedure TCSCClient.ConnectAndWait;
var 
  NovoValor : Boolean;
begin
  FWinsockError := 0;
  FConnErrorStr := '';
  NovoValor := not FConnected;
  Connected := NovoValor;
  ExceptionMgr.Add(Self);
  try
    FConnecting := True;
    while (NovoValor <> FConnected) and (FConnErrorStr='') and (FWinsockError=0) do begin
      try
        ProcessSocketMessages;
      except
        on E: Exception do begin
          if E is ESocketError then
            Raise ECSError.CreateSckError(FWinsockError) else
            Raise;
        end;
      end;
      Sleep(5);
    end;  
  finally
    FConnecting := False;
    ExceptionMgr.Remove(Self);
  end;
  
  if FConnErrorStr > '' then
  if FWinsockError > 0 then
    Raise ECSError.CreateSckError(FWinsockError)
  else  
    Raise Exception.Create(FConnErrorStr); 
end;

procedure TCSCClient.HandleAppException(Sender: TObject; E: Exception);
begin
  FConnErrorStr := E.Message;
  if not (E is ESocketError) then FWinsockError := 0;
end;

{ TCSCExceptionManager }

procedure TCSCExceptionManager.Add(aCli: TCSCClient);
var C : PemClient;
begin
  FCS.Enter;
  try
    if GetByThread<>nil then
      Raise Exception.Create('Já existe outro CSCClient nessa mesma tarefa!');
    New(C);
    C^.fCli := aCli;
    C^.fThreadID := GetCurrentThreadID;
    FThreads.Add(C);  
    if FThreads.Count=1 then begin
      FSaveAppEH := Application.OnException;
      Application.OnException := HandleAppException;
    end;
  finally
    FCS.Leave;
  end;
end;

function TCSCExceptionManager.Count: Integer;
begin
  FCS.Enter;
  try
    Result := FThreads.Count;
  finally
    FCS.Leave;
  end;
end;

constructor TCSCExceptionManager.Create;
begin
  FCS := TCriticalSection.Create;
  FThreads := TList.Create;
  FSaveAppEH := nil;
end;

destructor TCSCExceptionManager.Destroy;
begin
  FCS.Free;
  FThreads.Free;
  inherited;
end;

function TCSCExceptionManager.GetByThread: PemClient;
var 
  thid: Cardinal;
  i: Integer;
begin
  thid := GetCurrentThreadID;
  for I := 0 to FThreads.Count - 1 do
    if (thid=PemClient(FThreads[i])^.fThreadID) then begin
      Result := FThreads[i];
      Exit;
    end;
  Result := nil;  
end;

procedure TCSCExceptionManager.HandleAppException(Sender: TObject;
  E: Exception);
var C: PemClient;  
begin
  FCS.Enter;
  try
    C := GetByThread;
    if C=nil then
      Application.ShowException(E)
    else begin
      C.fCli.FConnErrorStr := E.Message;
      if not (E is ESocketError) then
        C.fCli.FWinsockError := 0;
    end;
  finally
    FCS.Leave;
  end;
end;

procedure TCSCExceptionManager.Remove(aCli: TCSCClient);
var C: PemClient;
begin
  FCS.Enter;
  try
    C := GetByThread;
    if (C<>nil) and (C.fCli=aCli) then begin
      FThreads.Remove(C);
      Dispose(C);
      if FThreads.Count=0 then begin
        Application.OnException := FSaveAppEH;
        FSaveAppEH := nil;
      end;
    end;
  finally
    FCS.Leave;
  end;
end;

initialization
  ExceptionMgr := TCSCExceptionManager.Create;

finalization
  ExceptionMgr.Free;  

end.
