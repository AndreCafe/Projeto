unit ncgFrmHide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFrmHide = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure ClickMenuMouseDown(Sender: TObject);
    procedure ClickMenuMouseUp(Sender: TObject);
    procedure ClickForaMenuMouseDown(Sender: TObject);
    procedure ClickForaMenuMouseUp(Sender: TObject);
    
  public
    { Public declarations }
  end;

var
  FrmHide: TFrmHide;
  LastStartH : HWND = 0;
  LastParent : HWND = 0;
  LastDV : HWND = 0;
  BloqTick : Integer = 0;
  LastCmd : Boolean = False;
  HideStartMenu : Boolean = False;

const
  StartBName  = 'Button';
  TaskBarName = 'Shell_TrayWnd';  // whole taskbar
  

implementation

uses dwlDesktop, ncDebug, madKernel;

{$R *.dfm}

function WndTaskBar: Hwnd;stdcall;
begin
   result := FindWindow(TASKBARNAME, nil);
end;

function WndVistaStartButton: HWnd;stdcall;
begin
  result := FindWindow( STARTBNAME,nil);
end;


function WndStartButton: HWnd;stdcall;
begin
  result := FindWindowEx(WndTaskbar, 0, STARTBNAME,nil);
end;

procedure SetDisableStartButton(Value : boolean);stdcall;
var
  SButton : HWnd;
begin
  if Win32MajorVersion >= 6 then Exit;
{  begin
    SButton := FindWindow(STARTBNAME,nil);
    if SButton <> 0  then
    begin
      if Value then
        ShowWindow (SButton,SW_Hide)
      else
        ShowWindow (SButton,SW_SHOW);
    end;
  end;}

  if Value then begin
    ShowWindow (WndStartButton ,SW_Hide);
  end else begin
    ShowWindow (WndStartButton ,SW_SHOW);
  end;
end;


procedure TFrmHide.ClickForaMenuMouseDown(Sender: TObject);
begin
  try
    SetCursorPos(screen.Width div 2, 32);
    mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);

    with TTimer.Create(Self) do begin
      Interval := 100;
      OnTimer := ClickForaMenuMouseUp;
      Tag := TTimer(Sender).Tag;
      Enabled := True;
    end;
  finally
    Sender.Free;
  end;
end;

procedure TFrmHide.ClickForaMenuMouseUp(Sender: TObject);
var H : HWND;
begin
  try
    SetCursorPos(screen.Width div 2, 32);
    mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);

    if TTimer(Sender).Tag=0 then begin
      with TTimer.Create(Self) do begin
        Interval := 2000;
        Enabled := True;
        OnTimer := ClickMenuMouseDown;
        Tag := 1;
      end;
    end else begin
      H := FindWindow('Shell_TrayWnd', nil);
      if H > 0 then 
        H := FindWindowEx(H, 0, 'Button', nil);
      if H=0 then
        H := FindWindow('BUTTON', 'START');
      if H=0 then
        H := FindWindow('BUTTON', 'INICIAR');

      if H=0 then Exit;  

      EnableWindow(H, False);
      Windows.SetParent(H, Handle);
      ShowWindow(H, SW_HIDE);
      LastStartH := H;
    end;
  finally
    Sender.Free;
  end;
end;

procedure TFrmHide.ClickMenuMouseDown(Sender: TObject);
begin
  try
    SetCursorPos(32,Screen.Height-15);
    mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);

    with TTimer.Create(Self) do begin
      Interval := 100;
      OnTimer := ClickMenuMouseUp;
      Tag := TTimer(Sender).Tag;
      Enabled := True;
    end;
  finally
    Sender.Free;
  end;
end;

procedure TFrmHide.ClickMenuMouseUp(Sender: TObject);
begin
  try
    SetCursorPos(32,Screen.Height-15);
    mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);

    with TTimer.Create(Self) do begin
      Interval := 1000;
      OnTimer := ClickForaMenuMouseDown;
      Tag := TTimer(Sender).Tag;
      Enabled := True;
    end;
  finally
    Sender.Free;
  end;
end;

procedure TFrmHide.Timer1Timer(Sender: TObject);
const BoolStr : Array[Boolean] of String[5] = ('false', 'true');
var 
  H, H2 : HWND;
  W : IWindow;


procedure GetStartBtnH;
begin
  H := FindWindow('Shell_TrayWnd', nil);
  if H > 0 then 
    H := FindWindowEx(H, 0, 'Button', nil);
  if H=0 then
    H := FindWindow('BUTTON', 'START');
  if H=0 then
    H := FindWindow('BUTTON', 'INICIAR');
end;

begin
  if Win32MajorVersion < 6 then begin
    GetStartBtnH;
    if (H=0) and HideStartMenu and (LastStartH>0) then ShowWindow(LastStartH, SW_HIDE);
    
    if ((LastStartH<>H) or (LastCmd<>HideStartMenu)) then begin
      DebugMsg('TFrmHide.StartButton HWND: ' + IntToStr(H));
      if not HideStartMenu then begin
        if H=0 then H := LastStartH;
        if H=0 then Exit;
        DebugMsg('TFrmHide.Timer1Timer - SHOW STARTMENU - H: '+IntToStr(H));
        H2 := FindWindow('Shell_TrayWnd', nil);
        if H2 <> 0 then 
          Windows.SetParent(H, H2) else    
          Windows.SetParent(H, LastParent);
        ShowWindow(H, SW_SHOW);
        EnableWindow(H, True);
      end else begin 
        if H=0 then Exit;
        DebugMsg('TFrmHide.Timer1Timer - HIDE STARTMENU');
        EnableWindow(H, False);
        LastParent := Windows.GetParent(H);
        Windows.SetParent(H, Handle);
        ShowWindow(H, SW_HIDE);
      end;
      LastCmd := HideStartMenu;
      LastStartH := H;
    end; 
  end else begin
    H := FindWindow('dv2controlhost', nil);

{    if H<>0 then 
    if (H<>LastStartH) or (LastCmd<>HideStartMenu) then begin
      LastCmd := HideStartMenu;
      EnableWindow(H, not HideStartMenu);
      LastStartH := H;
    end;}
    
    if (H<>0) and (LastDV<>h) then begin
      LastDV := H;
      H := FindWindowEx(H, 0, 'desktoplogoffpane', nil);
      if H<>0 then begin
        H := FindWindowEx(H, 0, 'button', nil);
        if H<>0 then ShowWindow(H, SW_Hide);
      end;  
    end;  
    
  end;  
   
end;

end.
