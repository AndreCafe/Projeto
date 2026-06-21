unit CSCMsgProcessor;

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
  CSCBase,
  CSCQueue,
  CSCCustomBase,
  SysUtils;

type  

  TCSCOnMsgRec = procedure (Sender: TObject; Msg: TCSCMessage) of object;
  
  TCSCMsgProcessor = class(TComponent)
  protected
    FCCBase        : TCSCCustomCommBase;
    FHandle        : hWnd;     {our window handle}
    FOnMsgRec      : TCSCOnMsgRec;

    procedure MsgWndProc(var Msg : TMessage);
    procedure SetCCBase(Value: TCSCCustomCommBase);
    
  public
  
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
  published       
  
    property CustomCommBase: TCSCCustomCommBase
      read FCCBase  write SetCCBase;

    property OnMsgRec : TCSCOnMsgRec
      read FOnMsgRec write FOnMsgRec;
      
  end;
  
implementation

constructor TCSCMsgProcessor.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCCBase := nil;
  FOnMsgRec := nil;
  FHandle := AllocateHWnd(MsgWndProc);
end;

destructor TCSCMsgProcessor.Destroy;
begin
  DeallocateHWnd(FHandle);
  inherited Destroy;
end;

procedure TCSCMsgProcessor.MsgWndProc(var Msg : TMessage);
var DataMsg : PCSCMessage;
begin
  with Msg do
  if Msg <> cscm_EventReceived then
    DefWindowProc(FHandle, Msg, wParam, lParam)
  else 
  while true do begin
    if (FCCBase=nil) then Exit;
    DataMsg := FCCBase.MsgQueue.ExamineEvents;
    if (DataMsg = nil) then Exit;
    FCCBase.MsgQueue.RemoveEventFromQueue(DataMsg);
    try
      if Assigned(FOnMsgRec) then
        FOnMsgRec(Self, DataMsg^);
    finally
      FCCBase.MsgQueue.DisposeEvent(DataMsg);
    end;
  end;
end;

procedure TCSCMsgProcessor.SetCCBase(Value: TCSCCustomCommBase);
begin
  if Value = FCCBase then Exit;

  
  if FCCBase <> nil then
  try
    FCCBase.NotifyHandle := 0;
  except
  end;  

  FCCBase := Value;

  if FCCBase <> nil then
  try
    FCCBase.NotifyHandle := FHandle;
  except
  end;  
end;


end.
