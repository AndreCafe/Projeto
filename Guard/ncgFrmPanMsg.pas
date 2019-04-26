unit ncgFrmPanMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, LMDPNGImage, ExtCtrls, LMDCustomParentPanel,
  LMDCustomPanelFill, LMDPanelFill, StdCtrls, cxButtons, cxLabel, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type

  TpanMsgPos = (pmpAbove, pmpBelow, pmpScreenCenter);
  TpanMsgAlign = (pmaLeft, pmaRight, pmaCenter);
  
  TFrmPanMsg = class(TForm)
    panMsg: TLMDSimplePanel;
    panCab: TLMDPanelFill;
    imClose: TImage;
    lbCab: TcxLabel;
    panPri: TLMDSimplePanel;
    lbTexto: TcxLabel;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
    procedure imCloseClick(Sender: TObject);
    procedure panMsgExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Init(aParent: TWinControl);

    procedure ShowMsg(aCab, aTexto: String; aPos: TpanMsgPos; aAlign: TpanMsgAlign; aControl: TWinControl);
    { Public declarations }
  end;

var
  FrmPanMsg: TFrmPanMsg;

implementation

{$R *.dfm}

procedure TFrmPanMsg.imCloseClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  panMsg.Visible := False;
end;

procedure TFrmPanMsg.Init(aParent: TWinControl);
begin
  panMsg.Parent := aParent;
  panMsg.BringToFront;
end;

procedure TFrmPanMsg.panMsgExit(Sender: TObject);
begin
  Timer1.Enabled := False;
  panMsg.Visible := False;
end;

function FormTop(W: TWinControl): Integer;
begin
  Result := W.Top;
  if (W.Parent<>nil) and (not (W.Parent is TForm)) then
    Result := Result + FormTop(W.Parent);
end;

function FormLeft(W: TWinControl): Integer;
begin
  Result := W.Left;
  if (W.Parent<>nil) and (not (W.Parent is TForm)) then
    Result := Result + FormLeft(W.Parent);
end;


procedure TFrmPanMsg.ShowMsg(aCab, aTexto: String; aPos: TpanMsgPos;
  aAlign: TpanMsgAlign; aControl: TWinControl);
var P : TPoint;  
begin
  if aPos=pmpScreenCenter then begin
    panMsg.Top := (Screen.WorkAreaHeight - panMsg.Height) div 2;
    panMsg.Left := (Screen.WorkAreaWidth - panMsg.Width) div 2;
  end else begin
    P.Y := FormTop(aControl);
    P.X := FormLeft(aControl);
    if aAlign = pmaRight then
      P.X := (P.X+aControl.Width) - panMsg.Width 
    else
    if aAlign = pmaCenter then
      P.X := (P.X + (aControl.Width div 2)) -  (panMsg.Width div 2);
      
    if aPos = pmpAbove then
      P.Y := P.Y - panMsg.Height - 1 else
      P.Y := P.Y + aControl.Height + 1;
      
    panMsg.Top := P.Y;
    panMsg.Left := P.X;
    if (P.Y<0) or (P.Y>Screen.WorkAreaHeight) or (P.X<0) or (P.X>Screen.WorkAreaWidth) then begin
      P.Y := FormTop(aControl);
      P.X := FormLeft(aControl);
    
      aTexto := 'X: ' + IntToStr(P.X) + ' Y: '+IntToStr(P.Y) + ' aControl.Top: ' + IntToStr(aControl.Top) + ' aControl.Width: ' + IntToStr(aControl.Width);
      panMsg.Top := (Screen.WorkAreaHeight - panMsg.Height) div 2;
      panMsg.Left := (Screen.WorkAreaWidth - panMsg.Width) div 2;
    end;
  end;

  lbCab.Caption := aCab;
  lbTexto.Caption := aTexto;
  panMsg.Visible := True;
  btnOk.SetFocus;
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TFrmPanMsg.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  panMsg.Visible := False;
end;

end.
