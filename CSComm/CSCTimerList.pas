unit CSCTimerList;

{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{$W-} {Windows Stack Frame}
{$X+} {Extended Syntax}


interface

uses
  Windows,
  Classes, 
  Forms, 
  Messages, 
  SysUtils,
  CSCTimer;

type  
  TTriggerEvent =
    procedure(Sender : TObject; Handle : Integer) of object;
    
  PEventRec       = ^TEventRec;
  TEventRec       = packed record                                      {!!.05}
    erHandle      : Integer;        
    erOnTrigger   : TTriggerEvent;  
    erRecurring   : Boolean;        
    erTimer       : TCSCTimer;
    erInterval    : Integer;
  end;

  TCSCTimerList = class(TComponent)
  protected
    FOnAllTriggers : TTriggerEvent;

    {internal variables}
    FList          : TList;    {list of event TEventRec records}
    FHandle        : hWnd;     {our window handle}
    FInterval      : Cardinal; {the actual Window's timer interval}

    {internal methods}
    procedure CalcNewInterval;
      {-calculates the needed interval for the window's timer}
    function EventIndex(Handle : Integer) : Integer;
      {-returns the internal list index corresponding to the trigger handle}
    procedure SortTriggers;
      {-sorts the internal list of timer trigger event records}
    procedure TimerWndProc(var Msg : TMessage);
      {-window procedure to catch timer messages}
    procedure UpdateTimer;
      {-re-create the windows timer with a new timer interval}
    procedure RemoveER(ER: PEventRec);  
  protected
    procedure DoTriggerNotification;
      virtual;
      {-conditionally sends notification of all events}

    function GetTimersCount: Integer; 
    function CreateTriggerHandle: Integer; 

  public
    constructor Create(AOwner: TComponent);
      override;
    destructor Destroy;
      override;

    function AddTimer(OnTrigger : TTriggerEvent; Interval : Cardinal) : Integer;
    procedure Remove(Handle : Integer);
    procedure RemoveAll;

    {public properties}
    property Count : Integer
      read GetTimersCount;

  published
  end;
  
implementation

const
  DefMinInterval     = 55;     {smallest timer interval allowed}
  DefHalfMinInterval = DefMinInterval div 2;



{*** internal routines ***}

function NewEventRec : PEventRec;
begin
  GetMem(Result, SizeOf(TEventRec));
  FillChar(Result^, SizeOf(TEventRec), #0);
end;

procedure FreeEventRec(ER : PEventRec);
begin
  if (ER <> nil) then
    FreeMem(ER, SizeOf(TEventRec));
end;


{*** TCSCTimerList ***}

constructor TCSCTimerList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  {create internal list for trigger event records}
  FList := TList.Create;

  {allocate a window handle for the timer}
  FHandle := AllocateHWnd(TimerWndProc);
end;

destructor TCSCTimerList.Destroy;
var
  I : Integer;
begin
  {force windows timer to be destroyed}
  FInterval := 0;
  UpdateTimer;

  {free contents of list}
  for I := 0 to FList.Count-1 do
    FreeEventRec(FList[I]);

  {destroy the internal list}
  FList.Free;
  FList := nil;

  {deallocate our window handle}
  DeallocateHWnd(FHandle);

  inherited Destroy;
end;

function TCSCTimerList.AddTimer(OnTrigger : TTriggerEvent; Interval : Cardinal) : Integer;
var
  ER : PEventRec;
begin
  Result := -1;  {assume error}
  {create new event record}
  ER := NewEventRec;
  if (ER = nil) then
    Exit;

  {force interval to be at least the minimum}
  if Interval < DefMinInterval then
    Interval := DefMinInterval;

  {fill event record}
  with ER^ do begin
    CSCTimer.SetTimer(erTimer, Interval);
    erInterval    := Interval;
    erOnTrigger   := OnTrigger;
    erRecurring   := False;
  end;
  
  ER^.erHandle := CreateTriggerHandle;
  FList.Add(ER);

  {return the trigger event handle}
  Result := ER^.erHandle;

  {calculate new interval for the windows timer}
  CalcNewInterval;
  SortTriggers;
  UpdateTimer;
end;

procedure TCSCTimerList.DoTriggerNotification;
var
  ER : PEventRec;
  I  : Integer;
begin
  I := 0;
  while I < FList.Count do begin
    ER := PEventRec(FList[I]);
    if HasTimerExpired(ER^.erTimer) then begin
      try
        if Assigned(ER^.erOnTrigger) then
          ER^.erOnTrigger(Self, ER^.erHandle);
      finally
        RemoveER(ER);
      end;    
    end else
      Inc(I);
  end;
end;

function TCSCTimerList.GetTimersCount : Integer;
  {-returns the number of maintained timer triggers}
begin
  Result := FList.Count;
end;

procedure TCSCTimerList.RemoveER(ER: PEventRec);
begin
  FList.Remove(ER);
  FreeEventRec(ER);
  CalcNewInterval;
  UpdateTimer;
end;

procedure TCSCTimerList.Remove(Handle : Integer);
var I : Integer;
begin
  I := EventIndex(Handle);
  if (I > -1) and (I < Count) then 
    RemoveER(PEventRec(FList[I]));
end;

procedure TCSCTimerList.RemoveAll;
begin
  while Count > 0 do RemoveER(PEventRec(FList[0]));
  FInterval := 0;
  UpdateTimer;
end;

procedure TCSCTimerList.CalcNewInterval;
  {-calculates the needed interval for the window's timer}
var
  I    : Integer;
  TTE  : Integer;
  N, V : LongInt;
  ER   : PEventRec;
  TC   : LongInt;
  Done : Boolean;
begin
  {find shortest trigger interval}
  TC := GetTickCount;
  FInterval := High(Cardinal);
  for I := 0 to FList.Count-1 do begin
    ER := PEventRec(FList[I]);
    TTE := TimeToExpireTC(ER^.erTimer, TC);
    if (TTE < FInterval) then
      FInterval := TTE;
  end;

  {limit to smallest allowable interval}
  if FInterval < DefMinInterval then
    FInterval := DefMinInterval;

  if FInterval = High(Cardinal) then
    FInterval := 0
  else begin
    {find interval that evenly divides into all trigger intervals}
    V := FInterval; {use LongInt so it is possible for it to become (-)}
    repeat
      Done := True;
      for I := 0 to FList.Count-1 do begin
        N := PEventRec(FList[I])^.erInterval;
        if (N mod V) <> 0 then begin
          Dec(V, N mod V);
          Done := False;
          Break;
        end;
      end;
    until Done or (V <= DefMinInterval);

    {limit to smallest allowable interval}
    if V < DefMinInterval then
      V := DefMinInterval;

    FInterval := V;
  end;
end;

function TCSCTimerList.CreateTriggerHandle : Integer;
var
  I : Integer;
  H : Integer;
begin
  Result := 0;
  for I := 0 to FList.Count-1 do begin
    H := PEventRec(FList[I])^.erHandle;
    if H >= Result then
      Result := H + 1;
  end;
end;

function TCSCTimerList.EventIndex(Handle : Integer) : Integer;
  {-returns the internal list index corresponding to Handle}
var
  I : Integer;
begin
  Result := -1;
  for I := 0 to FList.Count-1 do
    if PEventRec(FList[I])^.erHandle = Handle then begin
      Result := I;
      Break;
    end;
end;

procedure TCSCTimerList.SortTriggers;
  {-sorts the internal list of timer trigger event records}
var
  I    : Integer;
  Done : Boolean;
begin
  repeat
    Done := True;
    for I := 0 to FList.Count-2 do begin
      if (PEventRec(FList[I])^.erInterval >
          PEventRec(FList[I+1])^.erInterval) then begin
        FList.Exchange(I, I+1);
        Done := False;
      end;
    end;
  until Done;
end;

procedure TCSCTimerList.TimerWndProc(var Msg : TMessage);
  {-window procedure to catch timer messages}
begin
  with Msg do
    if Msg = WM_TIMER then
      try
        DoTriggerNotification;
      except
        Application.HandleException(Self);
      end
    else
      Result := DefWindowProc(FHandle, Msg, wParam, lParam);
end;

procedure TCSCTimerList.UpdateTimer;
begin
  KillTimer(FHandle, 1);
  if (FInterval <> 0) then
    Windows.SetTimer(FHandle, 1, FInterval, nil);
end;


end.
