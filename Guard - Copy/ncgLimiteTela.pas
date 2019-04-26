unit ncgLimiteTela;

interface

uses
  classes,
  Windows,
  Messages,
  SysUtils,
  Forms,
  madKernel;

type
  
  TThreadLimiteTela = class ( TThread )
  private
    R : TRect;
    W : IWindows;
    SleepTime : Cardinal;
    RemWidth : Integer;
  protected
     procedure Execute; override;
  public
    constructor Create(aSleepTime: Cardinal; aRemoveWidth: Integer);   
  end;

var
  ThLimTela : TThreadLimiteTela = nil;

  procedure StartLimiteTela(aSleepTime: Cardinal; aRemoveWidth: Integer);
  procedure StopLimiteTela; 

implementation

{ TThreadLimiteTela }

constructor TThreadLimiteTela.Create(aSleepTime: Cardinal;
  aRemoveWidth: Integer);
begin
  inherited Create(False);
  SleepTime := aSleepTime;
  RemWidth := aRemoveWidth;
end;

procedure TThreadLimiteTela.Execute;
var Bottom, Right, I: Integer;
begin
  inherited;
  W := TaskbarWindows;
  while not Terminated do begin
    Bottom := Screen.WorkAreaHeight;
    Right := Screen.WorkAreaWidth-RemWidth;
    for I := 0 to W.ItemCount-1 do 
    if (W[i].Maximized) then begin
      R := W[i].Rect;
      if R.Right > Right then begin
        R.Top := 0;
        R.Left := 0;
        R.Right := Right;
        R.Bottom := Bottom;
        W[i].NormalPos := R;
        PostMessage(W[i].Handle, WM_SYSCOMMAND, SC_Restore, 0);
      end;
    end;
    Sleep(SleepTime);
    if not Terminated then
      W.RefreshItems;
  end;
end;

procedure StartLimiteTela(aSleepTime: Cardinal; aRemoveWidth: Integer);
begin
  if not Assigned(ThLimTela) then 
    ThLimTela := TThreadLimiteTela.Create(aSleepTime, aRemoveWidth);
end;

procedure StopLimiteTela; 
begin
  if Assigned(ThLimTela) then begin
    ThLimTela.Terminate;
    FreeAndNil(ThLimTela);
  end;
end;


initialization
  ThLimTela := nil;

finalization
  if Assigned(ThLimTela) then FreeAndNil(ThLimTela);
    
end.
