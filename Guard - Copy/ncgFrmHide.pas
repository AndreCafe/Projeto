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
  public
    { Public declarations }
  end;

var
  FrmHide: TFrmHide;
  LastStartH : HWND = 0;
  LastCmd : Boolean = False;
  HideStartMenu : Boolean = False;

implementation

{$R *.dfm}

procedure TFrmHide.Timer1Timer(Sender: TObject);
var H : HWND;
begin
  H := FindWindow('Shell_TrayWnd', nil);
  if H > 0 then 
    H := FindWindowEx(H, 0, 'Button', nil);
  if H=0 then
    H := FindWindow('BUTTON', 'START');
  if H=0 then
    H := FindWindow('BUTTON', 'INICIAR');
    
  if ((LastStartH<>H) or (LastCmd<>HideStartMenu)) then begin
    LastCmd := HideStartMenu;
    if not HideStartMenu then begin
      Windows.SetParent(LastStartH, FindWindow('Shell_TrayWnd', nil));
      ShowWindow(LastStartH, SW_SHOW);
      EnableWindow(LastStartH, True);
    end else 
    if H>0 then begin
      EnableWindow(H, False);
      Windows.SetParent(H, Handle);
      ShowWindow(H, SW_HIDE);
      LastStartH := H;

      SetCursorPos(32,Screen.Height-15);
      // Click One
      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
      Sleep(10);
      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
      Sleep(10);
      // Click Two
      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
      Sleep(10);
      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    end;
  end;  
end;

initialization

end.
