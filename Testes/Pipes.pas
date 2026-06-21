unit Pipes;

//Please note any bugs/modifications to
//MrPMorris@hotmail.com

interface

uses
  Windows, Classes, SysUtils;

const
  cBufferSize = 8192;

type
  TCharArray = Array[0..32767] of char;
  PCharArray = ^TCharArray;

  EPipeError = Class(Exception);

  TReadDataEvent = procedure(Sender : TObject; Buffer : Pointer; BuffSize : DWord) of object;

  TMultiServerPipe = Class;

  TAbstractPipe = class(TThread)
  private
    OL                        : TOVERLAPPED;
    FEvent                    : THandle;
    hPipe                     : THandle;
    FBuffer                   : Pointer;
    FConnected                : Boolean;
    FPipeName                 : AnsiString;
    FSecurityAttributes       : PSecurityAttributes;
    FOnReadData               : TReadDataEvent;
    fServername               : String;
  protected
    procedure CreatePipe; virtual; abstract;
    procedure DoReadData(Buffer : Pointer; BuffSize : DWord); virtual;
    procedure ReadData;
  public
    constructor Create(aPipeName, aServerName : AnsiString; aSecurityAttributes : PSecurityAttributes); virtual;
    destructor Destroy; override;

    procedure Execute; override;
    procedure Write(var Buffer; BuffSize: DWord; var BytesWritten: DWord);
  published
    property OnReadData       : TReadDataEvent
      read FOnReadData
      write FOnReadData;
  end;

  TMultiReadDataEvent = procedure(Sender : TObject; ServerPipe : TAbstractPipe;
    Buffer : Pointer; BuffSize : DWord) of object;

  TServerPipe = class(TAbstractPipe)
  private
    FMultiServer              : TMultiServerPipe;
    procedure SetMultiServer(aValue : TMultiServerPipe);
  protected
    procedure CreatePipe; override;
    procedure DoReadData(Buffer : Pointer; BuffSize : DWord); override;
  public
    constructor CreateOwned(aMultiServer : TMultiServerPipe); virtual;
    destructor Destroy; override;

    procedure Execute; override;
    property MultiServer      : TMultiServerPipe
      read FMultiServer;
  end;

  TClientPipe = class(TAbstractPipe)
  protected
    procedure CreatePipe; override;
  public
    property ServerName: String read fServerName write fServerName;
  end;

  TMultiServerPipe = class(TObject)
  private
    FCriticalSection          : TRTLCriticalSection;
    FServers                  : TList;
    FPipeName                 : AnsiString;
    FSecurityAttributes       : PSecurityAttributes;
    FOnReadData               : TMultiReadDataEvent;
    function GetServer(Index : Integer) : TServerPipe;
    procedure RemoveItem(aItem : TServerPipe);
    procedure InsertItem(aItem : TServerPipe);
  protected
    procedure DoReadData(Server : TServerPipe; Buffer : Pointer; BuffSize : DWord);
  public
    constructor CreateWithSecurity(aPipeName : AnsiString; aSecurityAttributes : PSecurityAttributes); virtual;
    constructor Create(aPipeName : AnsiString); virtual;
    destructor Destroy; override;

    function Add : TServerPipe;
    function ServerCount : Integer;

    property Servers[Index : Integer] : TServerPipe
      read GetServer;

    property OnReadData       : TMultiReadDataEvent
      read FOnReadData
      write FOnReadData;
  published
  end;

// code of Hannes Danzl
  
  TSWHCustomPipe = class(TComponent)
  protected
    fOnReceived: TReadDataEvent;
    fData: TCharArray;
    fPipe: TAbstractPipe;
    fPipeName: String;
    fServername: String;
    function CreatePipe:TAbstractPipe;virtual;abstract;
  public
    constructor Create(aOwner:TComponent);override;
    destructor Destroy; override;
    procedure Send(var Data; Size:integer);virtual;
    procedure Open;virtual;
    procedure Close;virtual;
    property Data: TCharArray read fData;
    property PipeName: String read fPipeName write fPipeName;
    property OnReceived: TReadDataEvent read fOnReceived write fOnReceived;
  end;

  TSWHServerPipe = class(TSWHCustomPipe)
  protected
    function CreatePipe:TAbstractPipe;override;
  published
    property PipeName;
    property OnReceived;
  end;

  TSWHMultiServerPipe = class(TSWHServerPipe)
  protected
    fList: TList;
    fInstances:word;
  public
    constructor Create(aOwner:TComponent);override;
    procedure Open;override;
    procedure Close;override;
  published
    property Instances: word read fInstances write fInstances;
    property PipeName;
    property OnReceived;
  end;

  TSWHClientPipe = class(TSWHCustomPipe)
    function CreatePipe:TAbstractPipe;override;
  published
    property PipeName;
    property OnReceived;
    property Servername:String read fServername write fServername;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('SWH Pipes',[TSWHServerPipe,TSWHMultiServerPipe,TSWHClientPipe]);
end;

destructor TSWHCustomPipe.Destroy;
begin
  Close;
  inherited;
end;

constructor TSWHCustomPipe.Create(aOwner:TComponent);
begin
  inherited;
  fPipe:=nil;
  fServername:='.';
end;

procedure TSWHCustomPipe.Open;
begin
  if fPipe<>nil then
    raise EPipeError.Create('Pipe exists! Call close first');
  fPipe:=CreatePipe;
  fPipe.FOnReadData:=fOnReceived;
  fPipe.FreeOnTerminate:=true;
  fPipe.Resume;
end;

procedure TSWHCustomPipe.Close;
begin
  if fPipe<>nil then
  begin
    fPipe.Terminate;
    fPipe:=nil;
  end;
end;

procedure TSWHCustomPipe.Send(var Data; Size:integer);
var
  BytesWritten:Cardinal;
begin
  if fPipe<>nil then
    fPipe.Write(Data,size,BytesWritten)
  else
    raise EPipeError.Create('No pipe opened');
end;

function TSWHServerPipe.CreatePipe:TAbstractPipe;
begin
  result:=TServerPipe.Create(fPipeName,fServerName,nil);
end;

function TSWHClientPipe.CreatePipe:TAbstractPipe;
begin
  result:=TClientPipe.Create(fPipeName,fServerName,nil);
end;

constructor TSWHMultiServerPipe.Create(aOwner:TComponent);
begin
  inherited;
  fInstances:=1;
end;

procedure TSWHMultiServerPipe.Open;
var
  j: Integer;
begin
  if fPipe<>nil then
    raise EPipeError.Create('Pipe exists! Call close first');
  fList:=TList.Create;
  for j:=1 to Instances do
  begin
    fPipe:=CreatePipe;
    fPipe.FOnReadData:=fOnReceived;
    fPipe.FreeOnTerminate:=true;
    fPipe.Resume;
    fList.Add(fPipe);
  end;
end;

procedure TSWHMultiServerPipe.Close;
var
  j: Integer;
begin
  if fList<>nil then
    for j:=fList.Count-1 downto 0 do
    begin
      TThread(fList[j]).Terminate;
      fList.Delete(j);
    end;
  flist.free;
  flist:=nil;
end;

// Code of P.Morris

function LastError: string;
var
  OutputMessage: PChar;
begin
  FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_ALLOCATE_BUFFER,
    nil,
    GetLastError,
    0,
    @OutputMessage,
    0,
    nil);

  Result := string(OutputMessage);
end;

{ TAbstractPipe }

constructor TAbstractPipe.Create(aPipeName,aServerName: AnsiString;
  aSecurityAttributes: PSecurityAttributes);
begin
  inherited Create(True);
  fServerName:='.';
  FEvent := CreateEvent(nil, True, True, nil);
  OL.hEvent := FEvent;
  fServername:=aServerName;

  FConnected := False;
  FPipeName := aPipeName;
  UniqueString(FPipeName);
  FSecurityAttributes := aSecurityAttributes;
  CreatePipe;
  GetMem(FBuffer,cBufferSize);
end;

destructor TAbstractPipe.Destroy;
begin
  if hPipe <> 0 then
  begin
    CancelIO(hPipe);
    CloseHandle(hPipe);
  end;
  CloseHandle(FEvent);
  FreeMem(FBuffer);
  inherited;
end;

procedure TAbstractPipe.DoReadData(Buffer: Pointer; BuffSize: DWord);
begin
  if Assigned(FOnReadData) then FOnReadData(Self, FBuffer, BuffSize);
end;

procedure TAbstractPipe.Execute;
begin
  while not Terminated do ReadData;
end;

procedure TAbstractPipe.ReadData;
var
  BytesRead                   : DWord;
begin
  with OL do begin
    Internal := 0;
    InternalHigh := 0;
    Offset := 0;
    OffsetHigh := 0;
  end;
  ReadFile(hPipe, FBuffer^, cBufferSize, BytesRead, @OL);
  WaitForSingleObject(FEvent, INFINITE);
  if GetOverlappedResult(hPipe, OL, BytesRead, False) then
    if BytesRead > 0 then DoReadData(FBuffer, BytesRead);
  ResetEvent(FEvent);
end;

procedure TAbstractPipe.Write(var Buffer; BuffSize : DWord; var BytesWritten: DWord);
var
  Error                       : Boolean;
begin
  Error := not WriteFile(hPipe, Buffer, BuffSize, BytesWritten, nil);
  if Error then
    raise EPipeError.Create('TPipe.Write : Broken pipe, error = ' + IntToStr(GetLastError) + ' ' + LastError);
end;

{ TServerPipe }

constructor TServerPipe.CreateOwned(aMultiServer: TMultiServerPipe);
begin
  if aMultiServer = nil then
    raise EPipeError.Create('CreateOwned was passed NIL');
  inherited Create(aMultiServer.FPipeName, '.', aMultiServer.FSecurityAttributes);
  FMultiServer := aMultiServer;
end;

procedure TServerPipe.CreatePipe;
var
  anError: integer;
begin
  hPipe := CreateNamedPipe(
    PChar('\\'+fServername+'\Pipe\' + FPipeName),
    PIPE_ACCESS_DUPLEX or FILE_FLAG_OVERlAPPED,
    PIPE_TYPE_MESSAGE or PIPE_READMODE_MESSAGE or PIPE_WAIT,
    PIPE_UNLIMITED_INSTANCES,
    0, 0, 150, FSecurityAttributes);

  if hPipe = INVALID_HANDLE_VALUE then
  begin
    anError:=GetLastError;
    raise EPipeError.Create('TPipeServer.Create, error = ' + IntToStr(GetLastError) + ' ' + LastError);
  end;
end;

destructor TServerPipe.Destroy;
begin
  SetMultiServer(nil);
  inherited;
end;

procedure TServerPipe.DoReadData(Buffer: Pointer; BuffSize: DWord);
begin
  inherited;
  if FMultiServer <> nil then
    FMultiServer.DoReadData(Self, Buffer, Buffsize);
end;

procedure TServerPipe.Execute;
var
  Res                         : DWord;
begin
  if not FConnected then begin
    ConnectNamedPipe(hPipe, @OL);
    Res := WaitForSingleObject(FEvent, INFINITE);
    ResetEvent(FEvent);
    FConnected := (Res <> WAIT_TIMEOUT);
    if FConnected then
      if FMultiServer <> nil then
        if FConnected then FMultiServer.Add;
  end;
  inherited;
end;

procedure TServerPipe.SetMultiServer(aValue: TMultiServerPipe);
begin
  if FMultiServer <> aValue then
  begin
    if FMultiServer <> nil then FMultiServer.RemoveItem(Self);
    if aValue <> nil then aValue.InsertItem(Self);
    FMultiServer := aValue;
  end;
end;

{ TClientPipe }

procedure TClientPipe.CreatePipe;
begin
  hPipe := CreateFile(PChar('\\.\Pipe\' + FPipeName), GENERIC_READ + GENERIC_WRITE,
                          FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING,
                          FILE_ATTRIBUTE_NORMAL or FILE_FlAG_OVERLAPPED, 0);
  if hPipe = INVALID_HANDLE_VALUE then
    raise EPipeError.Create('TPipeServer.Create, error = ' + IntToStr(GetLastError) + ' ' + LastError);
  FConnected := True;
end;

{ TMultiServerPipe }

function TMultiServerPipe.Add: TServerPipe;
begin
  Result := TServerPipe.CreateOwned(Self);
  InsertItem(Result);
end;

constructor TMultiServerPipe.CreateWithSecurity(aPipeName: AnsiString;
  aSecurityAttributes: PSecurityAttributes);
begin
  inherited Create;
  FServers := TList.Create;
  InitializeCriticalSection(FCriticalSection);
  FPipeName := aPipeName;
  UniqueString(FPipeName);
  FSecurityAttributes := aSecurityAttributes;
  InsertItem(Add);
end;

constructor TMultiServerPipe.Create(aPipeName: AnsiString);
var
  SA                          : PSecurityAttributes;
  PSD                         : TSecurityDescriptor;
begin
  InitializeSecurityDescriptor(@PSD, SECURITY_DESCRIPTOR_REVISION);
  SetSecurityDescriptorDacl(@PSD, True, Nil, False);
  SA.nLength := Sizeof(SA);
  SA.lpSecurityDescriptor := @PSD;
  SA.bInheritHandle := True;
  CreateWithSecurity(aPipeName, SA);
end;

destructor TMultiServerPipe.Destroy;
begin
  DeleteCriticalSection(FCriticalSection);
  inherited;
end;

procedure TMultiServerPipe.DoReadData(Server: TServerPipe; Buffer: Pointer;
  BuffSize: DWord);
begin
  if Assigned(FOnReadData) then
    FOnReadData(Self, Server, Buffer, BuffSize);
end;

function TMultiServerPipe.GetServer(Index: Integer): TServerPipe;
begin
  Result := TServerPipe(FServers[Index]);
end;

procedure TMultiServerPipe.InsertItem(aItem: TServerPipe);
begin
  if FServers.IndexOf(aItem) < 0 then begin
    EnterCriticalSection(FCriticalSection);
    try
      FServers.Add(aItem);
      aItem.FMultiServer := Self;
    finally
      LeaveCriticalSection(FCriticalSection);
    end;
  end;
end;

procedure TMultiServerPipe.RemoveItem(aItem: TServerPipe);
begin
  if FServers.IndexOf(aItem) > -1 then begin
    EnterCriticalSection(FCriticalSection);
    try
      aItem.FMultiServer := nil;
      FServers.Remove(aItem);
    finally
      LeaveCriticalSection(FCriticalSection);
    end;
  end;
end;

function TMultiServerPipe.ServerCount: Integer;
begin
  Result := FServers.Count;
end;

end.
