unit CSCQueue;

interface

uses
  SysUtils,
  Messages,
  WinProcs,
  Math,
  Windows,
  WinTypes,
  SyncObjs,
  CSCTimerList,
  CSCBase,
  Dialogs,
  ScktComp,
  Classes;

type
  PCSCMessage = ^TCSCMessage;
  TCSCMessage = record
    dmMsg            : longint;
    dmEvent          : Boolean;
    dmClientSck      : TCustomWinSocket;
    dmErrorCode      : word;
    dmData           : pointer;
    dmDataLen        : integer;
    dmDataType       : TNetMsgDataType;
    dmOffSet         : integer;
  end;

  PFileTransmissionItem = ^TFileTransmissionItem;
  TFileTransmissionItem = record
    ftiFS          : TFileStream;
    ftiHandle      : Integer;
    ftiSending     : Boolean;
    ftiClientSck   : TCustomWinSocket;
    ftiSourceFN    : String;
    ftiDestFN      : String;
    ftiFileInfo    : String;
    ftiUserInfo    : Array[1..512] of Byte;
    ftiFileSize    : Integer;
    ftiSubMsgID    : Integer;
    ftiTimeoutTimer: Integer;
  end;

  TCSCMessageQueue = class
    FItems          : TList;
    FEvents         : TList;
    FPartialMsgs    : TList;
    FFTList         : TList;
    FFTQueue         : TList;
    FCS             : TCriticalSection;
    FCommBase       : TCSCCommBase;
    FTimerPool      : TCSCTimerList;
    FFTQHandle      : HWND;
    protected
      procedure CreateFTQWindow;
      
      procedure nmFirstFilePacket(var Msg : TCSCMessage);
                message cscnmFirstFilePacket;
      procedure nmGetFile(var Msg : TCSCMessage);
                message cscnmGetFileReq;
      procedure nmNextFilePacketReq(var Msg : TCSCMessage);
                message cscnmNextFilePacketReq;
      procedure nmFilePacket(var Msg : TCSCMessage);
                message cscnmFilePacket;
      procedure nmLastPacketRcv(var Msg : TCSCMessage);
                message cscnmLastPacketRcv;

      procedure RemoveTimer(var Handle: Integer);
      procedure AddTimeoutTimer(var Handle: Integer);
      procedure TimeoutTrigger(Sender : TObject; Handle : Integer);

      function FindRcvFTI(aHandle: Integer; aClientSck: TCustomWinSocket): PFileTransmissionItem;
      function FindSndFTI(aHandle: Integer): PFileTransmissionItem;

      function GetCount : Integer;
      function GetEventsCount : Integer;
      function GetFTQueueCount : Integer;
      function GetPMsgCount : Integer;
      function GetItem(Index : integer) : PCSCMessage;
      function GetEvent(Index : integer) : PCSCMessage;
      function GetPartialItem(Index : Integer): PCSCMessage;
      function GetFTQItem(Index: integer): PCSCMessage;
      function GetPartialMsg(aMsg: longint; aClientSck: TCustomWinSocket): PCSCMessage;

      procedure MsgComplete(DM: PCSCMessage);

      procedure AddToData(aMsg      : longint;
                          aClientSck: TCustomWinSocket;
                          aData     : pointer;
                          aPartLen  : longint);

    public
      constructor Create(aCommBase: TCSCCommBase);

      destructor Destroy; override;

      procedure ProcessFTQueue;          

      procedure SendTransmissionEvent(aFTI: PFileTransmissionItem; aPos: Byte; aError: Integer);

      procedure DeleteSocketMessages(Socket: TCustomWinSocket);

      function TransmitFile(aClientSck: TCustomWinSocket;
                            aSourceFN, aDestFN, aFileInfo: String;
                            var aUserInfo; aUserInfoSize: Integer;
                            aSubMsgID: Word): Word;

      procedure AddPacket(aPacket   : PByteArray;
                          aClientSck: TCustomWinSocket;
                          aLen      : integer);

      procedure Append(aMsg      : longint;
                       aEvent    : Boolean;
                       aClientSck: TCustomWinSocket;
                       aError    : word;
                       aData     : pointer;
                       aDataLen  : integer;
                       aPartLen  : integer;
                       aDataType : TNetMsgDataType);

      property Items[Index : Integer]: PCSCMessage
        read GetItem;

      property FTQItem[Index: Integer]: PCSCMessage
        read GetFTQItem;  

      property Events[Index : Integer]: PCSCMessage
        read GetEvent;

      property PartialMsgs[Index : Integer]: PCSCMessage
        read GetPartialItem;

      function Examine : PCSCMessage;
      function ExamineEvents : PCSCMessage;
      function ExamineFileEvents : PCSCMessage;
      function ExamineFTQueue: PCSCMessage;
        {-return the data message at the top of the queue; no pop
          occurs, the message remains at the top of the queue}

      function IsEmpty : boolean;
      function IsEventsEmpty : boolean;
      function IsFTQueueEmpty : boolean;
        {-return true if there are no data messages in the queue}

      procedure Lock;
        {-multithreaded only: locks the queue whilst being updated}

      procedure Pop;
      procedure PopFTQueue;
      procedure RemoveFirstEvent;
      procedure RemoveEventFromQueue(Event: PCSCMessage);
      procedure DisposeEvent(Event: PCSCMessage);
        {-destroys the data message at the top of the queue; the data
          memory block is also freed}
      procedure Unlock;
        {-multithreaded only: unlocks the queue}
      property EventsCount : integer read GetEventsCount;
        {-number of events messages in the queue}
      property Count : integer read GetCount;
        {-number of messages in the queue}
      property PMsgCount : integer read GetPMsgCount;
        {-number of messages in partial queue}
      property FTQueueCount: Integer read GetFTQueueCount;  
  end;


function MsgQueueWndFunc(hWindow : Hwnd; Msg : UINT;
                         wParam : WPARAM;
                         lParam : LPARAM) : LRESULT; stdcall export;
  
const
  MsgQueueClassName = 'TCSCMessageQueueWindow';

implementation

procedure DisposeDM(DM: PCSCMessage);
begin
  with DM^ do
  if dmDataLen>0 then begin
    if dmDataType=nmdByteArray
      then FreeMem(dmData, dmDataLen)
      else TMemoryStream(dmData).Free;
  end;
  Dispose(DM);
end;

procedure DisposeFTI(FTI: PFileTransmissionItem);
begin
  FTI^.ftiFS.Free;
  Dispose(FTI);
end;

function TCSCMessageQueue.FindRcvFTI(aHandle: Integer; aClientSck: TCustomWinSocket): PFileTransmissionItem;
var I : Integer;
begin
  for I := 0 to FFTList.Count-1 do begin
    Result := FFTList[I];
    with Result^ do
    if (not ftiSending) and (ftiClientSck=aClientSck) and (ftiHandle=aHandle)
      then Exit;
  end;
  Result := nil;
end;

function TCSCMessageQueue.FindSndFTI(aHandle: Integer): PFileTransmissionItem;
var I : Integer;
begin
  for I := 0 to FFTList.Count-1 do begin
    Result := FFTList[I];
    with Result^ do
    if ftiSending and (ftiFS.Handle=aHandle)
      then Exit;
  end;
  Result := nil;
end;

procedure TCSCMessageQueue.nmFirstFilePacket(var Msg : TCSCMessage);
var
  FS  : TFileStream;
  S   : TStream;
  FTI : PFileTransmissionItem;
  FP  : TCSCnmFilePacket;
  FFP : TCSCnmFirstFilePacket;
  Len : Integer;
  Reply: TCSCnmNextFilePacketReq;
  Error: Word;


function CreateNewFTI: Word;
begin
  FS := nil;
  FTI := nil;
  with Msg do
  try
    try
      FS := TFileStream.Create(FFP.nmDestFN, fmCreate);
    except
      Result := CSCErr_CannotOpenFile;
      Exit;
    end;
    New(FTI);
    with FTI^ do begin
      ftiFS       := FS;
      ftiHandle   := FP.nmSourceHandle;
      ftiSending  := False;
      ftiClientSck:= dmClientSck;
      ftiSourceFN := FFP.nmSourceFN;
      ftiDestFN   := FFP.nmDestFN;
      ftiFileInfo := FFP.nmFileInfo;
      ftiFileSize := FP.nmFileSize;
      FillChar(ftiUserInfo, SizeOf(ftiUserInfo), 0);
      Move(FFP.nmUserInfo, ftiUserInfo, SizeOf(ftiUserInfo));
      ftiTimeoutTimer:= -1;
      ftiSubMsgID    := FFP.nmSubMsgID;
    end;
    FFTList.Add(FTI);
    Result := 0;
  except
    if FTI<>nil then Dispose(FTI);
    if FS<>nil then FS.Free;
    Result := CSCErr_Unknow;
  end;
end;

begin
  Lock;
  with Msg do
  try
    S := TStream(dmData);
    Len := S.Size;
    S.Position := 0;
    if dmMsg = CSCnmFirstFilePacket then begin
      S.ReadBuffer(FFP, SizeOf(FFP));
      S.ReadBuffer(FP, SizeOf(FP));
      Error := CreateNewFTI;
    end else begin
      S.ReadBuffer(FP, SizeOf(FP));
      FTI := FindRcvFTI(FP.nmSourceHandle, dmClientSck);
      if FTI=nil then
        Exit;
      RemoveTimer(FTI^.ftiTimeoutTimer);
    end;

    with FTI^ do begin
      ftiFS.CopyFrom(S, Len-S.Position);
      if dmMsg = CSCnmFirstFilePacket then 
        SendTransmissionEvent(FTI, tpStart, 0)
      else 
        SendTransmissionEvent(FTI, tpMiddle, 0);
      if FP.nmLast then begin
        RemoveTimer(FTI^.ftiTimeoutTimer);
        SendTransmissionEvent(FTI, tpEnd, 0);
        Reply.nmSourceHandle := ftiHandle;
        FCommBase.SendMsg(CSCnmLastPacketRcv, True, ftiClientSck,
                          @Reply, SizeOf(Reply), nmdByteArray, 0);
        FFTList.Remove(FTI);
        ftiFS.Free;
        Dispose(FTI);
      end else begin
        Reply.nmSourceHandle := ftiHandle;
        FCommBase.SendMsg(CSCnmNextFilePacketReq, True, ftiClientSck,
                          @Reply, SizeOf(Reply), nmdByteArray, 0);
        AddTimeoutTimer(ftiTimeoutTimer);
      end;
    end;
  finally
    Unlock;
  end;
end;

procedure TCSCMessageQueue.nmGetFile(var Msg : TCSCMessage);
var Error: Word;
begin
  with Msg, TCSCnmGetFileReq(dmData^) do begin
    Error := TransmitFile(dmClientSck, nmSourceFN, nmDestFN,
                          nmFileInfo, nmUserInfo, 512, nmSubMsgID);
    FCommBase.SendMsg(CSCnmDownloadFile, False, dmClientSck,
                      nil, 0, nmdByteArray, Error);
  end;
end;

procedure TCSCMessageQueue.nmNextFilePacketReq(var Msg : TCSCMessage);
var
  FTI : PFileTransmissionItem;
  FP  : TCSCnmFilePacket;
begin
  Lock;
  with Msg, TCSCnmNextFilePacketReq(dmData^) do
  try
    FTI := FindSndFTI(nmSourceHandle);
    if FTI=nil then Exit;
    RemoveTimer(FTI^.ftiTimeoutTimer);
    with FTI^ do begin
      AddTimeoutTimer(ftiTimeoutTimer);
      FP.nmFileSize     := ftiFileSize;
      FP.nmSourceHandle := ftiFS.Handle;
      FCommBase.SendFilePacket(dmClientSck, nil, FP, ftiFS);
      SendTransmissionEvent(FTI, tpMiddle, 0);
    end;
  finally
    Unlock;
  end;
end;

procedure TCSCMessageQueue.nmFilePacket(var Msg : TCSCMessage);
begin
  nmFirstFilePacket(Msg);
end;

procedure TCSCMessageQueue.nmLastPacketRcv(var Msg : TCSCMessage);
var FTI : PFileTransmissionItem;
begin
  Lock;
  with Msg, TCSCnmNextFilePacketReq(dmData^) do
  try
    FTI := FindSndFTI(nmSourceHandle);
    if FTI=nil
      then Exit;
    RemoveTimer(FTI^.ftiTimeoutTimer);
    with FTI^ do begin
      FFTList.Remove(FTI);
      SendTransmissionEvent(FTI, tpEnd, 0);
      DisposeFTI(FTI);
    end;
  finally
    Unlock;
  end;
end;

constructor TCSCMessageQueue.Create(aCommBase: TCSCCommBase);
begin
  CreateFTQWindow;
  
  FTimerPool      := TCSCTimerList.Create(nil);
  FCommBase       := aCommBase;
  FItems          := TList.Create;
  FFTQueue         := TList.Create;
  FEvents         := TList.Create;
  FPartialMsgs    := TList.Create;
  FFTList         := TList.Create;
  FCS             := TCriticalSection.Create;
end;

procedure TCSCMessageQueue.CreateFTQWindow;
var XClass : TWndClass;
begin
  XClass.hInstance := HInstance;
  with XClass do begin
    Style         := 0;
    lpfnWndProc   := @MsgQueueWndFunc;
    cbClsExtra    := 0;
    cbWndExtra    := SizeOf(Pointer);
    hIcon         := LoadIcon(hInstance, 'DEFICON');
    hCursor       := LoadCursor(0, idc_Arrow);
    hbrBackground := 0;
    lpszMenuName  := nil;
    lpszClassName := MsgQueueClassName;
  end;
  WinProcs.RegisterClass(XClass);

  FFTQHandle :=
    CreateWindow(MsgQueueClassName,     {window class name}
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
                 
  SetWindowLong(FFTQHandle, 0, Longint(Self));
end;

destructor TCSCMessageQueue.Destroy;
var FTI : PFileTransmissionItem;
begin
  FTimerPool.Free;
  while not IsEmpty do Pop;
  while not IsEventsEmpty do RemoveFirstEvent;
  while not IsFTQueueEmpty do PopFTQueue;
  
  Lock;
  try
    while FFTList.Count>0 do begin
      FTI := PFileTransmissionItem(FFTList[0]);
      DisposeFTI(FTI);
      FFTList.Delete(0);
    end;
  except
  end;
  Unlock;
  FCS.Free;
  FPartialMsgs.Free;
  FItems.Free;
  FEvents.Free;
  FFTList.Free;
  FFTQueue.Free;
  DestroyWindow(FFTQHandle);
  inherited;
end;

procedure TCSCMessageQueue.AddPacket(aPacket   : PByteArray;
                                     aClientSck: TCustomWinSocket;
                                     aLen      : integer);
begin
  Lock;
  try
    // Pacote do tamnho exato da mensagem, adicionar
    with PnmHeader(aPacket)^ do begin

      FCommBase.MsgReceived(aClientSck, PnmHeader(aPacket));

      if nmhMsgID <> cscnmAck then 
      if nmhFirst
        then Append(nmhMsgID,
                    nmhEvent,
                    aClientSck,
                    nmhErrorCode,
                    @nmhData,
                    nmhTotalSize,
                    nmhMsgLen - NetMsgHeaderSize,
                    nmhDataType)
        else AddToData(nmhMsgID,
                       aClientSck,
                       @nmhData,
                       nmhMsgLen - NetMsgHeaderSize);
    end;
  finally
    Unlock;
  end;
end;

procedure TCSCMessageQueue.RemoveTimer(var Handle: Integer);
begin
  if Handle<>-1 then begin
    FTimerPool.Remove(Handle);
    Handle := -1;
  end;
end;

procedure TCSCMessageQueue.AddTimeoutTimer(var Handle: Integer);
begin
  RemoveTimer(Handle);
  Handle := FTimerPool.AddTimer(TimeoutTrigger, FileTransTimeout);
end;

procedure TCSCMessageQueue.SendTransmissionEvent(aFTI: PFileTransmissionItem;
                                                 aPos: Byte;
                                                 aError: Integer);
var
  Msg : TCSCnmFileTransmissionEv;
begin
  if FCommBase.IsServer then Exit;
  with aFTI^ do begin
    Msg.nmHandle   := ftiFS.Handle;
    Msg.nmPos      := aPos;
    Msg.nmSending  := ftiSending;
    if ftiSending then 
      Msg.nmFileName := ftiSourceFN
    else 
      Msg.nmFileName := ftiDestFN;

    Msg.nmFileInfo := ftiFileInfo;
    Move(ftiUserInfo, Msg.nmUserInfo, SizeOf(ftiUserInfo));
    Msg.nmFileSize := ftiFileSize;
    Msg.nmFilePos  := ftiFS.Position;
    Msg.nmSubMsgID := ftiSubMsgID;
    Msg.nmError    := aError;
    if aPos>1 then
      Msg.nmError := aError;
    Append(CSCnmFileTransmissionEv, True, ftiClientSck, 0, @Msg, SizeOf(Msg), SizeOf(Msg), nmdByteArray);

{    if (not FCommBase.IsServer) and (aPos=tpEnd) then begin
      if ftiSending
        then MsgID := CSCnmUploadFile
        else MsgID := CSCnmDownloadFile;
      Append(MsgID, False, ftiClientSck, aError, nil, 0, 0, nmdByteArray);
    end;}
  end;
end;


procedure TCSCMessageQueue.TimeoutTrigger(Sender : TObject; Handle : Integer);
var
  I: Integer;
  FTI: PFileTransmissionItem;
begin
  Lock;
  try
    for I := 0 to FFTList.Count-1 do begin
      FTI := PFileTransmissionItem(FFTList[I]);
      if FTI^.ftiTimeoutTimer=Handle then begin
        FFTList.Remove(FTI);
        SendTransmissionEvent(FTI, tpEnd, CSCErr_Timeout);
        DisposeFTI(FTI);
        Exit;
      end;
    end;
  finally
    Unlock;
  end;
end;

function TCSCMessageQueue.TransmitFile(aClientSck: TCustomWinSocket;
                                       aSourceFN, aDestFN, aFileInfo: String;
                                       var aUserInfo; aUserInfoSize: Integer;
                                       aSubMsgID: Word): Word;
var
  FS  : TFileStream;
  FTI : PFileTransmissionItem;
  FP  : TCSCnmFilePacket;
  FFP : TCSCnmFirstFilePacket;
begin
  try
    try
      FS := TFileStream.Create(aSourceFN, fmShareDenyWrite);
    except
      Result := CSCErr_CannotOpenFile;
      Exit;
    end;
    FS.Position := 0;
    FTI := nil;
    try
      New(FTI);
      with FTI^ do begin
        ftiFS          := FS;
        ftiHandle      := -1;
        ftiSending     := True;
        ftiClientSck   := aClientSck;
        ftiSourceFN    := aSourceFN;
        ftiDestFN      := aDestFN;
        ftiFileInfo    := aFileInfo;
        ftiFileSize    := FS.Size;
        FS.Position := 0;
        FillChar(ftiUserInfo, SizeOf(ftiUserInfo), 0);
        if aUserInfoSize>SizeOf(ftiUserInfo)
          then Move(aUserInfo, ftiUserInfo, SizeOf(ftiUserInfo))
          else Move(aUserInfo, ftiUserInfo, aUserInfoSize);
        ftiTimeoutTimer:= -1;
        ftiSubMsgID := aSubMsgID;
        AddTimeoutTimer(ftiTimeoutTimer);
        Lock;
        try
          FFTList.Add(FTI);
          StrECopy(FFP.nmSourceFN, PChar(ftiSourceFN));
          StrECopy(FFP.nmDestFN, PChar(ftiDestFN));
          StrECopy(FFP.nmFileInfo, PChar(aFileInfo));
          Move(ftiUserInfo, FFP.nmUserInfo, SizeOf(ftiUserInfo));
          FFP.nmSubMsgID    := aSubMsgID;
          FP.nmFileSize     := ftiFileSize;
          FP.nmSourceHandle := ftiFS.Handle;
          FCommBase.SendFilePacket(aClientSck, @FFP, FP, ftiFS);
          SendTransmissionEvent(FTI, tpStart, 0);
          Result := 0;
        except
          on E: Exception do begin
            FFTList.Remove(FTI);
            UnLock;
            Raise;
          end;
        end;
        UnLock;
      end;
    except
      on E: Exception do begin
        if FTI<>nil then Dispose(FTI);
        FS.Free;
        Result := CSCErr_Unknow;
      end;
    end;
  except
    Result := CSCErr_Unknow;
  end;
end;

procedure TCSCMessageQueue.MsgComplete(DM: PCSCMessage);
begin
  case DM^.dmMsg of
    CSCnmFirstFilePacket..CSCnmLastPacketRcv : begin
      FFTQueue.Add(DM);
      PostMessage(FFTQHandle, cscm_FTQItemReceived, 0, 0);
    end;
    else begin
      if DM^.dmEvent then begin
        FEvents.Add(DM);
        if (DM^.dmDataType=nmdStream) and (DM^.dmDataLen>0)
          then TStream(DM^.dmData).Position := 0;
        if DM^.dmMsg=CSCnmFileTransmissionEv
          then PostMessage(FCommBase.NotifyHandle, cscm_FileEventReceived, 0, 0)
          else PostMessage(FCommBase.NotifyHandle, cscm_EventReceived, 0, 0);
      end else begin
        if (DM^.dmDataType=nmdStream) and (DM^.dmDataLen>0)
          then TStream(DM^.dmData).Position := 0;
        FItems.Add(DM);
      end;
    end;
  end;    
end;

procedure TCSCMessageQueue.AddToData(aMsg      : longint;
                                     aClientSck: TCustomWinSocket;
                                     aData     : pointer;
                                     aPartLen  : longint);
var
  DM: PCSCMessage;
  BytesToCopy : integer;
begin
  DM := GetPartialMsg(aMsg, aClientSck);
  if DM = nil then Exit;
  with DM^ do begin
    BytesToCopy := MinIntValue([aPartLen, dmDataLen-dmOffSet]);
    if dmDataType = nmdByteArray
      then Move(aData^, PByteArray(dmData)^[dmOffSet], BytesToCopy)
      else TMemoryStream(dmData).Write(aData^, BytesToCopy);
    dmOffSet := dmOffSet + BytesToCopy;
    if dmOffSet>=dmDataLen then begin
      FPartialMsgs.Remove(DM);
      MsgComplete(DM);
    end;
  end;
end;
                                        
procedure TCSCMessageQueue.Append(aMsg      : longint;
                                  aEvent    : Boolean;
                                  aClientSck: TCustomWinSocket;
                                  aError    : word;
                                  aData     : pointer;
                                  aDataLen  : integer;
                                  aPartLen  : integer;
                                  aDataType : TNetMsgDataType);
var 
  DM : PCSCMessage;                                     
begin
  New(DM);
  FillChar(DM^, SizeOf(TCSCMessage), 0);
  with DM^ do begin
    dmMsg       := aMsg;
    dmEvent     := aEvent;
    dmClientSck := aClientSck;
    dmDataLen   := aDataLen;
    dmErrorcode := aError;
    dmDataType  := aDataType;
    dmOffset    := aPartLen;
    if aDataLen>0 then begin
      if aDataType=nmdByteArray then begin
        GetMem(dmData, dmDataLen);
        Move(aData^, dmData^, aPartLen);
      end else begin
        dmData := pointer(TMemoryStream.Create);
        TMemoryStream(dmData).Write(aData^, aPartLen);
      end;
    end;
    Lock;
    try
      if dmOffset>=aDataLen
        then MsgComplete(DM)
        else FPartialMsgs.Add(DM);
    finally
      UnLock;
    end;
  end;
end;

function TCSCMessageQueue.Examine : PCSCMessage;
begin
  Lock;
  try
    if Count > 0
      then Result := Items[0]
      else Result := nil;
  finally
    Unlock;
  end;      
end;

function TCSCMessageQueue.ExamineEvents : PCSCMessage;
begin
  Lock;
  try
    if EventsCount > 0
      then Result := Events[0]
      else Result := nil;
  finally
    UnLock;
  end;      
end;

function TCSCMessageQueue.ExamineFileEvents : PCSCMessage;
var I : integer;
begin
  Lock;
  try
    Result := nil;
    for I := 0 to EventsCount-1 do
    if Events[I]^.dmMsg=CSCnmFileTransmissionEv then begin
      Result := Events[I];
      Exit;
    end;
  finally
    Unlock
  end;
end;

function TCSCMessageQueue.ExamineFTQueue: PCSCMessage;
begin
  Lock;
  try
    if FTQueueCount > 0
      then Result := Self.FTQItem[0]
      else Result := nil;
  finally
    UnLock;
  end;      
end;

function TCSCMessageQueue.IsEventsEmpty : boolean;
begin
  Result := (EventsCount=0);
end;

function TCSCMessageQueue.IsFTQueueEmpty: boolean;
begin
  Result := (FTQueueCount=0);
end;

function TCSCMessageQueue.IsEmpty : boolean;
begin
  Result := (Count=0);
end;

procedure TCSCMessageQueue.Lock;
begin
  FCS.Enter;
end;

procedure TCSCMessageQueue.RemoveFirstEvent;
var DM : PCSCMessage;
begin
  if IsEventsEmpty then Exit;
  Lock;
  try
    DM := Events[0];
    FEvents.Delete(0);
    DisposeDM(DM);
  finally
    Unlock;
  end;
end;

procedure TCSCMessageQueue.Pop;
var DM : PCSCMessage;
begin
  if IsEmpty then Exit;
  Lock;
  try
    DM := Items[0];
    FItems.Delete(0);
    DisposeDM(DM);
  finally
    Unlock;
  end;
end;

procedure TCSCMessageQueue.PopFTQueue;
var DM : PCSCMessage;
begin
  if IsFTQueueEmpty then Exit;
  Lock;
  try
    DM := FTQItem[0];
    FFTQueue.Delete(0);
    DisposeDM(DM);
  finally
    Unlock;
  end;
end;

procedure TCSCMessageQueue.ProcessFTQueue;
var DM : PCSCMessage;
begin
  while true do begin
    DM := ExamineFTQueue;
    if (DM = nil) then Exit;
    try
      Dispatch(DM^);
    except
    end;
    PopFTQueue;
  end;
end;

procedure TCSCMessageQueue.DeleteSocketMessages(Socket: TCustomWinSocket);
var
  DM : PCSCMessage;
  i  : Integer;
  FTI : PFileTransmissionItem;
begin
  Lock;
  try
    I := 0;
    while i < (FEvents.Count-1) do begin
      DM := FEvents[i];
      if DM^.dmClientSck=Socket then begin
        FEvents.Delete(i);
        DisposeDM(DM);
      end else Inc(i);
    end;
    I := 0;
    while i < (FItems.Count-1) do begin
      DM := FItems[i];
      if DM^.dmClientSck=Socket then begin
        FItems.Delete(i);
        DisposeDM(DM);
      end else Inc(i);
    end;
    I := 0;
    while i < (FPartialMsgs.Count-1) do begin
      DM := FPartialMsgs[i];
      if DM^.dmClientSck=Socket then begin
        FPartialMsgs.Delete(i);
        DisposeDM(DM);
      end else Inc(i);
    end;

    while i < (FFTList.Count-1) do begin
      FTI := FFTList[i];
      if FTI^.ftiClientSck=Socket then begin
        FFTList.Delete(i);
        DisposeFTI(FTI);
      end else Inc(i);
    end;
    
  finally
    Unlock;
  end;
end;

procedure TCSCMessageQueue.RemoveEventFromQueue(Event: PCSCMessage);
begin
  Lock;
  try
    FEvents.Remove(Event);
  finally
    Unlock;
  end;
end;

procedure TCSCMessageQueue.DisposeEvent(Event: PCSCMessage);
begin
  DisposeDM(Event);
end;

procedure TCSCMessageQueue.Unlock;
begin
  FCS.Leave;
end;

function TCSCMessageQueue.GetPMsgCount : Integer;
begin
  Result := FPartialMsgs.Count;
end;

function TCSCMessageQueue.GetPartialMsg(aMsg: longint; aClientSck: TCustomWinSocket): PCSCMessage;
var I : Integer;
begin
  Result := nil;
  for I := 0 to PMsgCount-1 do with PartialMsgs[I]^ do
  if (dmMsg=aMsg) and (aClientSck=dmClientSck) then begin
    Result := PartialMsgs[I];
    Exit;
  end;
end;

function TCSCMessageQueue.GetCount : Integer;
begin
  Result := FItems.Count;
end;

function TCSCMessageQueue.GetEventsCount : Integer;
begin
  Result := FEvents.Count;
end;

function TCSCMessageQueue.GetFTQItem(Index: integer): PCSCMessage;
begin
  Result := FFTQueue[Index];
end;

function TCSCMessageQueue.GetFTQueueCount: Integer;
begin
  Result := FFTQueue.Count;
end;

function TCSCMessageQueue.GetPartialItem(Index : Integer): PCSCMessage;
begin
  Result := FPartialMsgs[Index];
end;

function TCSCMessageQueue.GetEvent(Index : integer) : PCSCMessage;
begin
  Result := FEvents[Index];
end;

function TCSCMessageQueue.GetItem(Index : integer) : PCSCMessage;
begin
  Result := FItems[Index];
end;


function MsgQueueWndFunc(hWindow : Hwnd; Msg : UINT;
                         wParam : WPARAM;
                         lParam : LPARAM) : LRESULT; stdcall export;
var
  Obj : TCSCMessageQueue;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  if MSG<>wm_Create then begin
    Obj := TCSCMessageQueue(GetWindowLong(hWindow, 0));
    if Obj=nil then begin 
      Result := DefWndFunc;
      Exit;
    end;
  end;

  try
    if Msg=cscm_FTQItemReceived then 
      Obj.ProcessFTQueue else
      Result := DefWndFunc;
  except
  end;
end;



end.
