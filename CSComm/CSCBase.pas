unit CSCBase;

interface

uses Dialogs, SysUtils, Windows, Messages, Controls, Classes, ScktComp;

const
  Socket_Error = -1;
type

  ECSError = class(Exception)
  public
    ErrorCode: Integer;
    SocketError: Integer;
    constructor Create(EC: Integer);
    constructor CreateSckError(EC: Integer);
  end;
  
  TNetMsgDataType = Byte;
  
  PnmHeader = ^TnmHeader;
  TnmHeader = packed record            {..General message header}
    nmhEvent     : Boolean;            {..True if it is an event}
    nmhMsgID     : longint;            {..message identifier}
    nmhMsgLen    : longint;            {..size of this message, incl. header}
    nmhTotalSize : longint;            {..size of all messages}
    nmhFirst     : Boolean;            {..First of possible many parts}
    nmhLast      : Boolean;            {..Last of possible many parts}
    nmhDataType  : TNetMsgDataType;    {..Byte array or Stream}
    nmhErrorCode : word;               {..error code, or 0 for success}
    nmhData      : byte;               {..data marker}
  end;

  PCSCPacket = ^TCSCPacket;
  TCSCPacket = packed record
    pkLength  : longint;
    pkStart   : longint;
    pkData    : PByteArray;
    pkNext    : PCSCPacket;
  end;

const
  ptVocare         = $7577;
  ptVocareScript   = $8577;
  ptWinPBX         = $9577;
  ptVocareGuardiao = $A077;
  ptTelemanager    = $A177;
  ptCyberMgr       = $A277;
  ptOpera          = $A377;
  ptNexCafe        = 16201;

  tpStart  = 0;
  tpMiddle = 1;
  tpEnd    = 2;

  FileTransTimeout = 30000;  // 30 seconds

  CSCErr_None              = 0;
  CSCErr_ServerCommLost    = 30001;
  CSCErr_ServerNotFound    = 30002;
  CSCErr_SystemBusy        = 30003;
  CSCErr_Timeout           = 30004;
  CSCErr_CannotOpenFile    = 30005;
  CSCErr_Unknow            = 30006;
  CSCErr_Socket            = 30007;
  

  nmdByteArray = 0;
  nmdStream    = 1;

  MaxNetMsgSize            : Integer = 1024 * 24;
  CSCMaxFileNameSize       = 512;

  NetMsgHeaderSize = sizeof(TnmHeader) - Sizeof(byte);
  SendAllClients   = $FFFF;

  cscm_DataReceived         = WM_USER + $0FF1;
  cscm_EventReceived        = WM_USER + $0FF2;
  cscm_FileEventReceived    = WM_USER + $0FF3;
  cscm_RefreshLic           = WM_USER + $0FF4;
  cscm_FTQItemReceived      = WM_USER + $0FF5;

  cscnmAck                  = $0001;
  cscnmNewConnection        = $0002;
  cscnmEndConnection        = $0003;

  cscnmFirstFilePacket      = 30001;
  cscnmGetFileReq           = 30002;
  cscnmNextFilePacketReq    = 30003;

  cscnmFilePacket           = 30004;
  cscnmLastPacketRcv        = 30005;

  cscnmUploadFile           = 30006;
  cscnmDownloadFile         = 30007;

  cscnmFileTransmissionEv   = 30008;

type
  TCSCFileName = Array[0..CSCMaxFileNameSize-1] of Char;

  PCSCnmFirstFilePacket = ^TCSCnmFirstFilePacket;
  TCSCnmFirstFilePacket = packed record
    nmSourceFN: TCSCFileName;
    nmDestFN  : TCSCFileName;
    nmFileInfo: TCSCFileName;
    nmUserInfo: Array[1..512] of Byte;
    nmSubMsgID: Integer;
  end;

  TCSCnmGetFileReq = TCSCnmFirstFilePacket;


  TCSCnmNextFilePacketReq = packed record
    nmSourceHandle: Integer;
  end;

  TCSCnmFilePacket = packed record
    nmSourceHandle: Integer;
    nmFileSize    : Integer;
    nmLast        : Boolean;
  end;

  TCSCUserInfo = Array[1..512] of Byte;

  PCSCnmFileTransmissionEv = ^TCSCnmFileTransmissionEv;
  TCSCnmFileTransmissionEv = record
    nmHandle    : Integer;
    nmPos       : Byte;    // Start=0; Middle=1; End=2
    nmSending   : Boolean;
    nmFileName  : String[255];
    nmFileInfo  : String[255];
    nmUserInfo  : TCSCUserInfo;
    nmFileSize  : Integer;
    nmFilePos   : Integer;
    nmSubMsgID  : Integer;
    nmError     : Integer;
  end;

  TCSCCommBase = class ( TComponent )
  protected
    FIsServer: Boolean;
    FNotifyHandle : HWND;
    procedure SetNotifyHandle(Value: HWND);  
  public
    procedure MsgReceived(aClientSck: TCustomWinSocket; aMsg: PnmHeader); virtual; abstract;
    procedure SendFilePacket(aClientSck: TCustomWinSocket;
                             aFFP: PCSCnmFirstFilePacket;
                             aFP : TCSCnmFilePacket;
                             aFS : TFileStream); virtual; abstract;

    procedure SendMsg(aMsg        : longint;
                      aEvent      : Boolean;
                      aClient     : TCustomWinSocket;
                      aData       : pointer;
                      aDataLen    : LongInt;
                      aDataType   : TNetMsgDataType;
                      aErrorCode  : Word); virtual; abstract;

    property IsServer: Boolean
      read FIsServer;

    property NotifyHandle: HWND
      read FNotifyHandle write SetNotifyHandle;  

  end;

  TCSCMsgReceivedEvent = procedure (Socket: TCustomWinSocket; Data: Pointer; DataLen: Integer) of object;

  TCSCSenderReceiver = class
  private
    FSocket    : TCustomWinSocket;
    FPacketHead: PCSCPacket;
    FPacketTail: PCSCPacket;
    FSending   : Boolean;
    FRcvBuffer : PByteArray;
    FRcvOffSet : integer;
    FOnMsgRcv  : TCSCMsgReceivedEvent;
  private
    procedure WinsockBreath;
  public
    constructor Create(aSocket: TCustomWinSocket);
    destructor Destroy; override;
    function Send(aData      : PByteArray;
                  aDataLen   : longint;
                  aDataStart : longint;
                  var aBytesSent : longint) : integer;
    procedure Read;
    procedure Write;

    property OnMsgReceived  : TCSCMsgReceivedEvent
      read FOnMsgRcv write FOnMsgRcv;
  end;

  function GetCSErrorString(EC: Integer): String;

implementation

function GetCSErrorString(EC: Integer): String;
begin
  case EC of
    CSCErr_ServerCommLost :
      Result := 'Falha de comunicação com servidor';
    CSCErr_ServerNotFound :
      Result := 'Servidor não encontrado';
    CSCErr_SystemBusy     :
      Result := 'Sistema Está Ocupado';
    CSCErr_Timeout        :
      Result := 'Tempo máximo aguardando transmissão de arquivo';
    CSCErr_CannotOpenFile :
      Result := 'Arquivo não pode ser aberto';
    CSCErr_Unknow         :
      Result := 'Erro Desconhecido';
    CSCErr_Socket :
      Result := 'Erro de comunicação TCP/IP';
    else Result := '';
  end;
end;

constructor ECSError.Create(EC: Integer);
begin
  inherited Create('CS Communication Error '+IntToStr(EC)+': '+GetCSErrorString(EC));
  ErrorCode := EC;
  SocketError := 0;
end;

constructor ECSError.CreateSckError(EC: Integer);
begin
  inherited Create(GetCSErrorString(CSCErr_Socket) + ' (' + IntToStr(EC) +')');
  ErrorCode := CSCErr_Socket;
  SocketError := EC;
end;

procedure TCSCCommBase.SetNotifyHandle(Value: HWND);  
begin
  FNotifyHandle := Value;
end;

constructor TCSCSenderReceiver.Create(aSocket: TCustomWinSocket);
begin
  inherited Create;
  FOnMsgRcv  := nil;
  FSocket    := aSocket;
  FPacketHead:= nil;
  FPacketTail:= nil;
  FSending   := False;
  GetMem(FRcvBuffer, MaxNetMsgSize);
  FRcvOffSet := 0;
end;

destructor TCSCSenderReceiver.Destroy;
begin
  FreeMem(FRcvBuffer, maxNetMsgSize);
  inherited;
end;

function TCSCSenderReceiver.Send(aData      : PByteArray;
                                 aDataLen   : longint;
                                 aDataStart : longint;
                                 var aBytesSent : longint) : integer;
var
  BytesSent    : longint;
  PacketBuffer : PCSCPacket;
begin
  Result := 0;
  if (aDataLen-aDataStart) > 0 then begin
    {Add the data packet to the wscPacketList }
    New(PacketBuffer);
    GetMem(PacketBuffer^.pkData, aDataLen);
    PacketBuffer^.pkLength := aDataLen;
    PacketBuffer^.pkStart := aDataStart;
    Move(aData^[0], PacketBuffer^.pkData^, PacketBuffer^.pkLength);
    PacketBuffer^.pkNext := Nil;
    {Add the packet to the end of the list }
    if not assigned(FPacketHead) then
      FPacketHead := PacketBuffer
    else if assigned(FPacketTail) then
      FPacketTail^.pkNext := PacketBuffer;
    FPacketTail := PacketBuffer;
    aBytesSent := aDataLen-aDataStart; {Always report all bytes sent}
  end;
  if (not FSending) and Assigned(FPacketHead) then begin
    {now try to send some data}
    try
      {send the first waiting data packet}
      with FPacketHead^ do
      BytesSent := FSocket.SendBuf(pkData^[pkStart], pkLength-pkStart);
    except
      BytesSent := SOCKET_ERROR;
    end;
    if (BytesSent = SOCKET_ERROR) then begin
      Result := 0;
      FSending := True;
    end else if BytesSent < (FPacketHead^.pkLength - FPacketHead^.pkStart) then begin
      if BytesSent=0 then 
        WinsockBreath;
      { we didn't send the whole thing, so re-size the data packet}
      inc(FPacketHead^.pkStart, BytesSent);
      { now try sending the remaining data again }
      Result := Send(nil, 0, 0, BytesSent);
    end else begin
      {we sent the packet, so remove it and continue }
      FreeMem(FPacketHead^.pkData, FPacketHead^.pkLength);
      PacketBuffer := FPacketHead;
      FPacketHead := FPacketHead^.pkNext;
      if not Assigned(FPacketHead) then
        FPacketTail := Nil;
      Dispose(PacketBuffer);
      Result := 0;
    end;
  end;
end;

procedure TCSCSenderReceiver.WinsockBreath;
var Msg : TMsg;
begin
  while PeekMessage(Msg, FSocket.Handle, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;  
end;

procedure TCSCSenderReceiver.Write;
var Dummy: integer;
begin
  FSending := False;
  while (not FSending) and Assigned(FPacketHead) do
    Send(nil, 0, 0, Dummy);
end;

procedure TCSCSenderReceiver.Read;
var
  MsgLen,
  BytesRead: Integer;
begin
  try
    BytesRead := FSocket.ReceiveBuf(FRcvBuffer^[FRcvOffSet], MaxNetMsgSize-FRcvOffSet);
  except
    BytesRead := 0;
  end;
  if BytesRead<1 then 
    Exit;
  Inc(FRcvOffSet, BytesRead);
  while FRcvOffSet >= NetMsgHeaderSize do begin
    MsgLen := PnmHeader(FRcvBuffer)^.nmhMsgLen;
    if (FRcvOffset >= MsgLen) then begin
      FRcvOffset := FRcvOffset - MsgLen;
      if Assigned(FOnMsgRcv)
        then FOnMsgRcv(FSocket, FRcvBuffer, MsgLen);
      if (FRcvOffset > 0) then
        Move(FRcvBuffer^[MsgLen], FRcvBuffer^[0], FRcvOffset);
    end else Exit;
  end;
end;

end.











