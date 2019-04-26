unit GrFingerComp;
{
    ResourceString: Dario 12/03/13
}

interface

uses
  Windows,
  Messages,
  Winprocs,
  SysUtils,
  Classes,
  GrFinger;

const
  wm_InitEvent   = wm_user + 1;
  wm_FingerEvent = wm_user + 2;
  wm_ImageEvent  = wm_user + 3; 
  

type
  TGrFingerComp = class ( TComponent )
  private
    FOnFingerprint: TNotifyEvent;
    FSensor : PAnsiChar;
    FActive: Boolean;
    
    FTpt     : PChar;
    FTptSize : Integer;
    FTptQuality : Byte;
    FWndHandle : HWND;

    procedure pCapInitCallBack(idSensor: Pchar; event: GRCAP_STATUS_EVENTS); 
    procedure pCapFingerEvent(idSensor: Pchar; event: GRCAP_FINGER_EVENTS); 
    procedure pCapImageEvent(idSensor: PChar; width: Integer; height: Integer; rawImage: PChar; res: Integer);
    
    procedure SetActive(const Value: Boolean);

    procedure CriaWndHandle;
  protected
    procedure DispMessage(var Msg: TMessage); 

    procedure wmInitEvent(var Msg: TMessage);
      message wm_InitEvent;

    procedure wmFingerEvent(var Msg: TMessage);
      message wm_FingerEvent;

    procedure wmImageEvent(var Msg: TMessage);
      message wm_ImageEvent;  
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure PrepareIdentify;
    function Match(aTpt: PChar): Integer;  

    property Tpt: PChar
      read FTpt;

    property TptSize: Integer
      read FTptSize;

    property TptQuality: Byte
      read FTptQuality;    
        
  published
    property Active: Boolean
      read FActive write SetActive; 

    property OnFingerPrint: TNotifyEvent
      read FOnFingerPrint write FOnFingerPrint;
  end;

  TInitEventMsg = class
    fSensor : String;
    fEvent : GRCAP_STATUS_EVENTS;
  end;

  TFingerEventMsg = class
    fSensor : String;
    fEvent : GRCAP_FINGER_EVENTS;
  end;

  TImageEventMsg = class
    fSensor : String;
    fWidth : Integer;
    fHeight : Integer;
    fRawImage : String;
    fRes : Integer;
  end;

  procedure CapInitCallBack(idSensor: Pchar; event: GRCAP_STATUS_EVENTS); stdcall;
  procedure CapFingerEvent(idSensor: Pchar; event: GRCAP_FINGER_EVENTS); stdcall;
  procedure CapImageEvent(idSensor: PChar; width: Integer; height: Integer; rawImage: PChar; res: Integer); stdcall;

  function GrFingerCompWndFunc(hWindow : Hwnd; Msg : UINT;
                               wParam : WPARAM;
                               lParam : LPARAM) : LRESULT; stdcall export;

  procedure Register;

const
  NomeClasseFingerComp = 'TGrFingerComp';  

var
  GlobalGrComp : TGrFingerComp;  

implementation

// START resource string wizard section
resourcestring
  SJ·ExisteUmTGrFingerCompInstancia = 'J· existe um TGrFingerComp instanciado';

// END resource string wizard section


{ TGrFingerComp }

procedure CapInitCallBack(idSensor: Pchar; event: GRCAP_STATUS_EVENTS); stdcall;
var IEM : TInitEventMsg;
begin
  IEM := TInitEventMsg.Create;
  IEM.fSensor := idSensor;
  IEM.fEvent := event;
  PostMessage(GlobalGrComp.FWndHandle, wm_InitEvent, 0, Integer(IEM));
end;

procedure CapFingerEvent(idSensor: Pchar; event: GRCAP_FINGER_EVENTS); stdcall;
var FEM : TFingerEventMsg;
begin
  FEM := TFingerEventMsg.Create;
  FEM.fSensor := idSensor;
  FEM.fEvent := event;
  PostMessage(GlobalGrComp.FWndHandle, wm_FingerEvent, 0, Integer(FEM));
end;

procedure CapImageEvent(idSensor: PChar; width: Integer; height: Integer; rawImage: PChar; res: Integer); stdcall;
var 
  IEM : TImageEventMsg;
  L : Integer;
begin
  IEM := TImageEventMsg.Create;
  IEM.fSensor := idSensor;
  IEM.fWidth := Width;
  IEM.fHeight := Height;
  IEM.fRes := Res;
  L := StrLen(rawImage);
  SetLength(IEM.fRawImage, L);
  Move(rawImage^, IEM.fRawImage[1], L);
  PostMessage(GlobalGrComp.FWndHandle, wm_ImageEvent, 0, Integer(IEM));
end;

constructor TGrFingerComp.Create(AOwner: TComponent);
begin
  if Assigned(GlobalGrComp) then
    raise Exception.Create(SJ·ExisteUmTGrFingerCompInstancia);
    
  inherited;
  FActive := False;
  FTpt := StrAlloc(GR_MAX_SIZE_TEMPLATE);
  FTptSize := 0;
  FTptQuality := 0;
  FOnFingerprint := nil;
  CriaWndHandle;
  GlobalGrComp := Self;
end;

procedure TGrFingerComp.CriaWndHandle;
var XClass : TWndClass;
begin
  XClass.hInstance := HInstance;
  with XClass do begin
    Style         := 0;
    lpfnWndProc   := @GrFingerCompWndFunc;
    cbClsExtra    := 0;
    cbWndExtra    := SizeOf(Pointer);
    hIcon         := LoadIcon(hInstance, 'DEFICON'); // do not localize
    hCursor       := LoadCursor(0, idc_Arrow);
    hbrBackground := 0;
    lpszMenuName  := nil;
    lpszClassName := NomeClasseFingerComp;
  end;
  WinProcs.RegisterClass(XClass);

  FWndHandle :=
    CreateWindow(NomeClasseFingerComp,     {window class name}
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

destructor TGrFingerComp.Destroy;
begin
  Active := False;
  GlobalGrComp := nil;
  inherited;
end;

procedure TGrFingerComp.DispMessage(var Msg: TMessage);
begin
  try
    Dispatch(Msg);
  finally
    TObject(Msg.LParam).Free;
  end;
end;

function TGrFingerComp.Match(aTpt: PChar): Integer;
begin
  if GrIdentify(aTpt, Result, GR_DEFAULT_CONTEXT)<>GR_Match then
    Result := GR_NOT_MATCH;
end;

procedure TGrFingerComp.pCapFingerEvent(idSensor: Pchar;
  event: GRCAP_FINGER_EVENTS);
begin

end;

procedure TGrFingerComp.pCapImageEvent(idSensor: PChar; width, height: Integer;
  rawImage: PChar; res: Integer);
var ret: Integer;  
begin
  FTptSize := GR_MAX_SIZE_TEMPLATE;
  ret := GrExtract(rawImage, Width, Height, res, FTpt, FTptSize, GR_DEFAULT_CONTEXT);
  if ret<0 then 
    FTptSize := 0 
  else begin
    FTptQuality := ret;
    if Assigned(FOnFingerprint) then
      FOnFingerprint(Self);
  end;
end;

procedure TGrFingerComp.pCapInitCallBack(idSensor: Pchar;
  event: GRCAP_STATUS_EVENTS);
begin
  if (not SameText(idSensor, 'File')) and (event=gr_plug) then begin // do not localize
    FSensor := idSensor;
    GrCapStartCapture(FSensor, CapFingerEvent, CapImageEvent);
  end;
end;

procedure TGrFingerComp.PrepareIdentify;
begin
  GrIdentifyPrepare(FTpt, GR_DEFAULT_CONTEXT);
end;

procedure TGrFingerComp.SetActive(const Value: Boolean);
var res: integer;
begin
  if FActive = Value then Exit;

  if Value then begin
    LoadGrFingerLib;
    GrFinalize;
    res := GrInitialize;
    if res<>GR_OK then Exit;
    res := GrCapInitialize(CapInitCallback);
    if res<>GR_OK then Exit;
  end else begin
    GrCapFinalize;
    GrFinalize;
  end;

  FActive := Value;
end;

procedure TGrFingerComp.wmFingerEvent(var Msg: TMessage);
begin
  with TFingerEventMsg(Msg.LParam) do
    pCapFingerEvent(PChar(fSensor), fEvent);
end;

procedure TGrFingerComp.wmImageEvent(var Msg: TMessage);
begin
  with TImageEventMsg(Msg.LParam) do 
    pCapImageEvent(PChar(fSensor), fWidth, fHeight, PChar(fRawImage), fRes);
end;

procedure TGrFingerComp.wmInitEvent(var Msg: TMessage);
begin
  with TInitEventMsg(Msg.LParam) do 
    pCapInitCallBack(PChar(fSensor), fEvent);
end;

function GrFingerCompWndFunc(hWindow : Hwnd; Msg : UINT;
                             wParam : WPARAM;
                             lParam : LPARAM) : LRESULT; stdcall export;
var
  Obj : TGrFingerComp;
  M   : TMessage;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;
  Obj := nil;

  if MSG<>wm_Create then begin
    Obj := TGrFingerComp(GetWindowLong(hWindow, 0));
    if Obj=nil then begin 
      Result := DefWndFunc;
      Exit;
    end;
  end;

  case Msg of
    wm_InitEvent..wm_ImageEvent :
    begin
      M.Msg := Msg;
      M.WParam := WParam;
      M.LParam := LParam;
      Obj.DispMessage(M);
    end;
    
  else 
    Result := DefWndFunc;
  end;
end;


procedure Register;
begin
  RegisterComponents('NexCafe', [TGrFingerComp]); // do not localize
end;
 

initialization
  GlobalGrComp := nil;

finalization
  GlobalGrComp := nil;  

end.

