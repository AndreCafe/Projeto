//##############################################################################
//  DELPHI UNIT: uWINPOPUP
//  VERSION: 0.1 freeware (08/10/2007)
//  AUTHOR: GIANCARLO ONEGLIO (gian55@gmail.com)
//
//  PARAMETERS:
//      WINLABEL   = the window alert name
//      WINMESSAGE = the main alert message
//      STYLE      = 0->light blue
//                   1->lightgray
//                   2->silver
//                   ...you can use your own theme by adding bmp into ImageListStyles
//      ICON       = 0->information
//                   1->question
//                   2->warning
//                   3->stop
//                   ...please see other icons in ImageListIcon
//      SLEEP      = milliseconds before disappear
//      FX         = 0->fading out
//                   1->slide to screen bottom
//
//      USAGE: 1) add uWinPopUp unit to your delphi mainform
//             2) add the variable Popup:TFormWinPopUp into mainform var lists
//             3) create the POPUP window in the create event with:
//                   PopUp:=TFormWinPopUp.Create(application);
//      EXAMPLES:
//            PopUp.WinPopUp('Program name','Hello!',0,0,2000,0);
//            PopUp.WinPopUp('Message from Charlie','Hello, isn''t anybout out there?',1,4,2000,1);
//            PopUp.WinPopUp('Program','Connection is lost',3,8,2000,0);
//
//
//  WINPOPUP is a Delphi unit to speed up the use of windows taskbar alerts without
//  using commercial components or complicated WinApi interfaces
//  Copyright (C) 2007 Giancarlo Oneglio.

//  This units is FREEWARE with source code. I still hold the copyright, but
//  you can use it for whatever you like: freeware, shareware or commercial software.
//  If you have any ideas for improvement or bug reports, don't hesitate to e-mail
//  me <gian55@gmail.com>
//##############################################################################

unit uWinPopUp;

interface

uses
    Windows, SysUtils, Classes, Graphics, Forms,
    ExtCtrls, ImgList, StdCtrls, Controls, ShellApi, pngimage, OleCtrls,
  SHDocVw_EWB, EmbeddedWB, EwbCore;

type
    TFormWinPopUp = class(TForm)
        Timer1: TTimer;
        WB: TEmbeddedWB;
        procedure LabelCloseClick(Sender: TObject);
        procedure Timer1Timer(Sender: TObject);
    private
        function TaskBarPosition: integer;
    public
        procedure WinPopUp(WinLabel, WinMessage: string; Style, Icon, SleepTimer, FX: integer);
    end;

var
    FormWinPopUp: TFormWinPopUp;
    TimeToStop: integer;
    FX, i, WinTop: integer;
implementation

{$R *.dfm}

function TaskBarHeight: integer;
var
    hTB: HWND;
    TBRect: TRect;
begin
    hTB := FindWindow('Shell_TrayWnd', '');
    if hTB = 0 then
        Result := 0
    else
    begin
        GetWindowRect(hTB, TBRect);
        Result := TBRect.Bottom - TBRect.Top;
    end;
end;

procedure TFormWinPopUp.LabelCloseClick(Sender: TObject);
begin
    Self.Visible := false;
end;

function TFormWinPopUp.TaskBarPosition: integer;
var
    tabd: TAppBarData;
    PosString: string;
begin
    FillChar(tabd, SizeOf(TAppBarData), 0);
    tabd.cbSize := SizeOf(TAppBarData);
    if SHAppBarMessage(ABM_GETTASKBARPOS, Tabd) = 0 then Exit;
    case tabd.uEdge of
        ABE_BOTTOM: result := 0;
        ABE_LEFT: result := 1;
        ABE_TOP: result := 2;
        ABE_RIGHT: result := 3;
    end;
end;

procedure TFormWinPopUp.WinPopUp(WinLabel, WinMessage: string; Style, Icon, SleepTimer, FX: integer);
var x, y: integer;
begin
    FormStyle := fsNormal;
    FormStyle := fsStayOnTop;
    Timer1.Enabled := false;
    Self.AlphaBlendValue := 255;
    Self.Top := Screen.Height;
    Self.Visible := true;
    x := Screen.WorkAreaWidth;
    y := Screen.Height;
    Self.Left := x - Self.Width - 20;

    if TaskBarPosition = 0 then
        WinTop := y - Self.Height - TaskBarHeight
    else
        WinTop := y - Self.Height;

    i := y;
    repeat
        Dec(i, 1);
        Self.Top := i;
        Self.Refresh;
        Application.ProcessMessages;
    until i <= WinTop;

    Timer1.Tag := FX;
    Timer1.Interval := (SleepTimer);
    Timer1.Enabled := True;
end;


procedure TFormWinPopUp.Timer1Timer(Sender: TObject);
begin
    FX := Timer1.Tag;
    Timer1.Enabled := false;
    case FX of
        0: begin
                i := 255;
                repeat
                    Dec(i, 5); Self.AlphaBlendValue := i; Sleep(1);
                    Application.ProcessMessages;
                until i <= 1;
            end;
        1: begin
                i := 0;
                repeat
                    Inc(i, 1); Self.Top := WinTop + i; Self.Refresh;
                    Application.ProcessMessages;
                until i >= Screen.Height;
            end;

    end;
    Self.Visible := false;
end;

end.

