unit ncPRTransfer;
{
    ResourceString: Dario 13/03/13
}
interface

uses
  Windows,
  ncNetMsg,
  ncPRConsts,
  ComObj,
  SysUtils,
  nxllTypes,
  nxllComponent,
  nxllMemoryManager,
  nxllTransport,
  nxllPluginBase,
  nxllDataMessageQueue,
  nxptBasePooledTransport,
  nxllSimpleSession,
  nxstMessages,
  SyncObjs,
  Classes;

const
   kptBlockSize = 1024 * 1000;
  
type
  TncPTDirection = (ptdir_download, ptdir_upload);

  TncPTProgress = procedure (Sender: TObject; Arq: TGUID; aPos, aTotal: Cardinal; aFailed: Boolean) of object;


  TncPTItem = class ( TStringList )
  public
    function Arq: TGUID;
    function ArqStr: String;
    function ArqFullName: String; virtual; abstract;
    function Sessao: Integer;
  end;

  TncPTItemUp = class ( TncPTItem )
    function ArqFullName: String; override;
  end;

  TncPTItemDown = class ( TncPTItem )
    function ArqFullName: String; override;
  end;

  TncPrintTransfer = class ( TThread )
  private
    FItems        : TList;
    FCS           : TCriticalSection;
    FOnPTProgress : TncPTProgress;

    FArq           : TGUID;
    FFullArq       : String;
    FPos           : Cardinal;
    FBlockLen      : Cardinal;
    FLastBlock     : Boolean;
    FTotal         : Cardinal;
    FFS            : TFileStream;
    FTransp        : TnxBasePooledTransport;
    FSS            : TnxSimpleSession;
    FRestam        : Cardinal;
    FFailed        : Boolean;
    FReqUp         : PnmSendPTBlock;
    FDirection     : TncPTDirection;

    procedure SyncProgress;
    function FindArq(aArq: TGUID): TncPTItem;

    function ConnectSession: Boolean;

    function StillExists: Boolean;

    
    procedure TransferArq;
    function GetNext: Boolean;

    function StartPrintTransfer: Boolean;
    function SendPTBlock: Boolean;
    function GetPTBlock: Boolean;
    procedure SendBlocks;
    procedure GetPrintDoc;

  protected
    procedure Execute; override;
  public
    constructor Create(aDirection: TncPTDirection);
    destructor Destroy; override;
    
    procedure AddArqUpload(aInfo: TStrings);
    procedure AddArqDownload(aArq: String);
    procedure DelArq(aArq: TGUID);
    procedure ClearArqs;

    procedure SetTransp(aTransp: TnxBasePooledTransport);

    procedure SetPTProgress(aOnProgress: TncPTProgress);

  end;
  
implementation

uses ncClassesBase, uLogs;

{ TncPTItem }


{ TncPTItem }

function TncPTItem.Arq: TGUID;
begin
  Result := StringToGuid(Values['Arq']); // do not localize
end;

function TncPTItem.ArqStr: String;
begin
  Result := Values['Arq']; // do not localize
end;

function TncPTItem.Sessao: Integer;
begin
  Result := StrToIntDef(Values['Sessao'], 0); // do not localize
end;

{ TncPrintTransfer }

procedure TncPrintTransfer.AddArqDownload(aArq: String);
var A: TncPTItem;
begin
  FCS.Enter;
  try
    A := TncPTItemDown.Create;
    A.Values['Arq'] := aArq; // do not localize
    FItems.Add(A);
  finally
    FCS.Leave;
  end;
end;

procedure TncPrintTransfer.AddArqUpload(aInfo: TStrings);
var 
  S: String;
  A: TncPTItem;
begin
  S := PRFolder('2')+aInfo.Values['Arq']+'.pdf'; // do not localize
  if not FileExists(S) then Exit;
  
  FCS.Enter;
  try
    A := TncPTItemUp.Create;
    A.Text := aInfo.Text;
    FItems.Add(A);
  finally
    FCS.Leave;
  end;
end;

procedure TncPrintTransfer.ClearArqs;
begin
  FCS.Enter;
  try
    while FItems.Count>0 do begin
      TObject(FItems[0]).Free;
      FItems.Delete(0);
    end;
  finally
    FCS.Leave;
  end;
end;

function TncPrintTransfer.ConnectSession: Boolean;
begin
  Result := False;
  
  FCS.Enter;
  try
    if (FTransp=nil) or (not FTransp.Active) then Exit;
    if FSS.Transport= nil then 
      FSS.Transport := FTransp;
  finally
    FCS.Leave;
  end;
  
  try
    FSS.UserName := 'admin'; // do not localize
    FSS.Password := 'delphi9856';   // do not localize
    FSS.Active := True;  
    Result := True;
  except
  end;
end;

constructor TncPrintTransfer.Create(aDirection: TncPTDirection);
begin
  FDirection := aDirection;
  FCS := TCriticalSection.Create;
  FItems := TList.Create;
  FPos   := 0;
  FTotal := 0;
  FFullArq := '';
  FOnPTProgress := nil;
  FTransp := nil;
  FFS := nil;
  FReqUp := nil;
  
  if FDirection = ptdir_upload then
    nxGetZeroMem(FReqUp, SizeOf( TnmSendPTBlock ) - SizeOf( TnxVarMsgField ) + kptBlockSize + 1);
    
  inherited Create(True);
end;

procedure TncPrintTransfer.DelArq(aArq: TGUID);
var A: TncPTItem;
begin
  FCS.Enter;
  try
    A := FindArq(aArq);
    if A<> nil then begin
      FItems.Remove(A);
      A.Free;
    end;
  finally
    FCS.Leave;
  end;
end;

destructor TncPrintTransfer.Destroy;
begin
  ClearArqs;
  FCS.Free;
  if FDirection = ptdir_upload then
    nxFreeMem(FReqUp);
  inherited;
end;

procedure TncPrintTransfer.Execute;
begin
  FSS := TnxSimpleSession.Create(nil);
  try
    FCS.Enter;
    try
      FSS.Transport := FTransp;
    finally
      FCS.Leave;
    end;
    
    while not Terminated do begin
      try
        if GetNext then
        try
          TransferArq;
        finally
          DelArq(FArq);
          FreeAndNil(FFS);
        end;
      except
      end;
      Sleep(5);
    end;
  finally
   FSS.Free;
  end;
end;

function TncPrintTransfer.FindArq(aArq: TGUID): TncPTItem;
var 
  i : integer;
  s: String;
begin
  s := GUIDToString(aArq);

  for i := 0 to FItems.Count-1 do
    if TncPTItem(FItems[i]).ArqStr=S then begin
      Result := TncPTItem(FItems[i]);
      Exit;
    end;
  Result := nil;
end;

function TncPrintTransfer.GetPTBlock: Boolean;
var 
  R : TnmGetPrintDoc;
  ReqLen : Integer;
  SessionRequests: InxSessionRequests;
  aCommOk : Boolean;
  P : Pointer;
  I : Integer;
begin
  R.nmArq := FArq;
  R.nmPos := FPos;
  ReqLen := 0;
  aCommOk := False;
  
  if Supports(FSS, InxSessionRequests, SessionRequests) then
  while (not aCommOk) and (not Terminated) and ((FDirection=ptdir_download) or StillExists) do begin
    try
      if ConnectSession then begin
        I := SessionRequests.ProcessRequest(Self, 0, ncnmGetPrintDoc, 120000, @R, SizeOf(R), @P, @ReqLen, nmdByteArray);
        if I=034923947 then Exit;
        Result := (I=0);
        FFailed := not Result;
        if FFailed then begin
          FTotal := 0;
          FRestam := 0;
        end else
        with PnmGetPrintDocReply(P)^ do begin
          FBlockLen := nmTamBlock;
          FPos := FPos + FBlockLen;
          FTotal := nmTamTotal;
          FRestam := nmTamTotal - FPos;
          I := FBlockLen;
          if I=2132123 then Exit;
          FFS.WriteBuffer(nmBlock, FBlockLen);
        end;
        aCommOk := True;
      end;
    except
    end;
    if not aCommOk then begin
      Sleep(1000);
      try FSS.Active := False; except end;
    end;
  end;
  Result := aCommOk;
end;

function TncPrintTransfer.GetNext: Boolean;
var A: TncPTItem;
begin
  FCS.Enter;
  try
    if FItems.Count>0 then begin
      A := TncPTItem(FItems[0]);
      FArq := A.Arq;
      FPos := 0;
      FFullArq := A.ArqFullName;
      ForceDirectories(ExtractFilePath(FFullArq));
      if FDirection = ptdir_upload then
        FFS := TFileStream.Create(FFullArq, fmOpenRead) else
        FFS := TFileStream.Create(FFullArq, fmCreate);
      FTotal := FFS.Size;
      Result := True;
    end else
      Result := False;
  finally
    FCS.Leave;
  end;
end;

procedure TncPrintTransfer.GetPrintDoc;
begin
  FPos := 0;
  FRestam := High(Integer);
  while (FRestam>0) and (not Terminated) and (not FFailed) do begin
    Sleep(5);
    
    if GetPTBlock then
      Synchronize(SyncProgress);
  end;
end;

procedure TncPrintTransfer.SendBlocks;
begin
  if FPos>FFS.Size then FPos := 0;
  FRestam := FFS.Size - FPos;
  if FRestam > 0 then 
    FFS.Position := FPos;
  while (FRestam>0) and (not Terminated) and StillExists and (not FFailed) do begin
    Sleep(5);
    if FRestam<kptBlockSize then
      FBlockLen := FRestam else
      FBlockLen := kptBlockSize;

    FFS.Read(FReqUp^.nmBlock, FBlockLen);  
    FLastBlock := ((FRestam-FBlockLen)=0);
    if SendPTBlock then begin
      FRestam := FRestam - FBlockLen;
      FPos := FPos + FBlockLen;
    end;
    Synchronize(SyncProgress);
  end;
end;

function TncPrintTransfer.SendPTBlock: Boolean;
var 
  ReqLen : Integer;
  SessionRequests: InxSessionRequests;
  aCommOk : Boolean;
begin
  ReqLen := SizeOf( TnmSendPTBlock ) - SizeOf( TnxVarMsgField ) + FBlockLen + 1;
  FReqUp^.nmArq := FArq;
  FReqUp^.nmLast := FLastBlock;
  FReqUp^.nmTamanho := FBlockLen;
  FReqUp^.nmPos := FPos;

  if Supports(FSS, InxSessionRequests, SessionRequests) then
  while (not aCommOk) and (not Terminated) and StillExists do begin
    try
      if ConnectSession then begin
        Result := (SessionRequests.ProcessRequest(Self, 0, ncnmSendPTBlock, 120000, FReqUp, ReqLen, nil, 0, nmdByteArray)=0);
        FFailed := not Result;
        aCommOk := True;
      end;
    except
    end;
    if not aCommOk then begin
      Sleep(1000);
      try FSS.Active := False; except end;
    end;
  end;
end;

procedure TncPrintTransfer.SetPTProgress(aOnProgress: TncPTProgress);
begin
  FCS.Enter;
  try
    FOnPTProgress := aOnProgress;
  finally
    FCS.Leave;
  end;
end;

procedure TncPrintTransfer.SetTransp(aTransp: TnxBasePooledTransport);
begin
  FCS.Enter;
  try
    if aTransp=FTransp then Exit;
    FTransp := aTransp;
    FSS.Transport := FTransp;
  finally
    FCS.Leave;
  end;
end;

function TncPrintTransfer.StartPrintTransfer: Boolean;
var 
  S: TMemoryStream;
  SessionRequests: InxSessionRequests;
  Res: Integer;
  RepLen: TnxWord32;
  aCommOk: Boolean;
begin
  S := nil;
  try
    FCS.Enter;
    try
      if FItems.Count=0 then Exit;
      S := TMemoryStream.Create;
      TncPTItem(FItems[0]).SaveToStream(S);
    finally
      FCS.Leave;
    end;
    S.Position := 0;
    Result := False;
    
    aCommOk := False;
    
    if Supports(FSS, InxSessionRequests, SessionRequests) then
    while (not aCommOk) and (not Terminated) and StillExists do begin
      try
        if ConnectSession then begin
          RepLen := SizeOf(FPos);
          Result := (SessionRequests.ProcessRequest(Self, 0, ncnmStartPrintTransfer, 120000, S.Memory, S.Size, @FPos, @RepLen, nmdByteArray)=0);
          FFailed := not Result;
          aCommOk := True;
        end;
      except
      end;
      if not aCommOk then begin
        Sleep(1000);
        try FSS.Active := False; except end;
      end;
    end;

  finally
    if S<>nil then S.Free;
  end;
end;

function TncPrintTransfer.StillExists: Boolean;
begin
  FCS.Enter;
  try
    Result := (FindArq(FArq)<>nil);
  finally
    FCS.Leave;
  end;
end;

procedure TncPrintTransfer.SyncProgress;
begin
  if Assigned(FOnPTProgress) then
    FOnPTProgress(Self, FArq, FPos, FTotal, FFailed);
end;

procedure TncPrintTransfer.TransferArq;
begin
  try
    try
      FFailed := False;
      case FDirection of
        ptdir_upload : if StartPrintTransfer then SendBlocks;
        ptdir_download : GetPrintDoc;
      end;
    finally
      FreeAndNil(FFS);
    end;
  finally
    if FFailed or ((FDirection=ptdir_upload) and (FRestam=0)) then begin
      DeleteFile(FFullArq);
      DeleteFile(Copy(FFullArq, 1, Length(FFullArq)-3)+'ini'); // do not localize
    end;
  end;
end;

{ TncPTItemUp }

function TncPTItemUp.ArqFullName: String;
begin
  Result := PRFolder('2')+Values['Arq']+'.pdf'; // do not localize
end;

{ TncPTItemDown }

function TncPTItemDown.ArqFullName: String;
begin
  Result := PRFolder(#0)+Values['Arq']+'.pdf'; // do not localize
end;

end.

 
 
