unit uFrmYAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppBar, pngimage, ExtCtrls, OleCtrls, SHDocVw_EWB, EmbeddedWB,
  EwbCore, ImgList, cxGraphics, dxBar, cxClasses, Buttons, PngSpeedButton,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill;

type
  TForm2 = class(TForm)
    AppBar1: TAppBar;
    Timer1: TTimer;
    WB: TEmbeddedWB;
    dxBarManager1: TdxBarManager;
    cxImageList1: TcxImageList;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PngSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

const
  sHTML : String = 
  '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' +
'<html xmlns="http://www.w3.org/1999/xhtml">' +
'<head>' +
'<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />' +
'<title>Untitled Document</title>' +
'<style type="text/css">' +
'<!--' +
'.style2 {color: #333333}' +
'.style3 {color: #666666}' +
'-->' +
'</style>' +
'</head>' +
'<body style="margin: 0px 0px 0px 0px;">' +
'<!-- BEGIN STANDARD TAG - 120 x 600 - Nextar: Run-of-site - DO NOT MODIFY -->' +
'<IFRAME FRAMEBORDER=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=NO WIDTH=120 HEIGHT=600 SRC="http://ad.yieldmanager.com/st?ad_type=iframe&ad_size=120x600&section=526860"></IFRAME>' +
'<!-- END TAG -->' +
'</body>' +
'</html>';


implementation

{$R *.dfm}

procedure TForm2.FormResize(Sender: TObject);
begin
  WB.Top := (Height - WB.Height) div 2;
end;

procedure TForm2.FormShow(Sender: TObject);
var S: String;
begin
  Timer1.Enabled := True;
  WB.Top := (Height - WB.Height) div 2;
  S := ExtractFilePath(ParamStr(0))+'tagyahoo2.html';
  WB.Navigate(S);
end;

procedure TForm2.PngSpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  WB.Refresh;
end;

end.
