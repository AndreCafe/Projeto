unit ncgFrmPTProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxProgressBar, LMDPNGImage, ExtCtrls;

type
  TFrmPTProgress = class(TForm)
    Image1: TImage;
    PB: TcxProgressBar;
    TimerHide: TTimer;
    procedure TimerHideTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    
  public
    { Public declarations }
    procedure Centraliza;
  end;

var
  FrmPTProgress: TFrmPTProgress;

  FrmPTProgress_Parent : HWND;

implementation

{$R *.dfm}

procedure TFrmPTProgress.Centraliza;
begin
  BringWindowToTop(Handle);
  Caption := 'Enviando ' + IntToStr(PB.PercentDone)+'%';
end;

procedure TFrmPTProgress.CreateParams(var Params: TCreateParams);
begin
  inherited;
  params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
  params.WndParent := FrmPTProgress_Parent;
end;

procedure TFrmPTProgress.FormShow(Sender: TObject);
begin
  Top := Screen.WorkAreaTop;
  Left := (Screen.WorkAreaWidth - Width) div 2;
end;

procedure TFrmPTProgress.TimerHideTimer(Sender: TObject);
begin
  TimerHide.Enabled := False;
  Hide;
end;

end.
