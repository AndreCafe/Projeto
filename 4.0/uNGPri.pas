unit uNGPri;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, Graphics, 
  Menus, ExtCtrls, AppBar, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, ImgList,
  cxGraphics, dxBar, dxBarExtItems, cxClasses, OleCtrls, SHDocVw, SHDocVw_EWB,
  EmbeddedWB, pngimage, cxImage, cxBarEditItem, cxControls, cxContainer, cxEdit,
  cxLabel, cxTextEdit, cxStyles;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    DocktoLeft1: TMenuItem;
    DocktoTop1: TMenuItem;
    DocktoRight1: TMenuItem;
    DocktoBottom1: TMenuItem;
    N1: TMenuItem;
    Undock1: TMenuItem;
    N2: TMenuItem;
    CloseAppBardemo1: TMenuItem;
    AppBar1: TAppBar;
    Timer1: TTimer;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    panPri: TLMDSimplePanel;
    panBar: TLMDSimplePanel;
    dxBarDockControl1: TdxBarDockControl;
    cxBarEditItem1: TcxBarEditItem;
    panBusca: TLMDSimplePanel;
    lbClick: TcxLabel;
    lbQuery: TcxLabel;
    lbObtenha: TcxLabel;
    Timer2: TTimer;
    cmBuscar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    im24: TcxImageList;
    dxBarLargeButton2: TdxBarLargeButton;
    cxStyle2: TcxStyle;
    dxBarStatic1: TdxBarStatic;
    edBusca: TcxBarEditItem;
    cxStyle3: TcxStyle;
    cmChat: TdxBarLargeButton;
    imOn: TImage;
    imOff: TImage;
    Image1: TImage;
    Timer3: TTimer;
    panIm: TLMDSimplePanel;
    Image2: TImage;
    cxLabel1: TcxLabel;
    procedure DocktoLeft1Click(Sender: TObject);
    procedure DocktoTop1Click(Sender: TObject);
    procedure DocktoRight1Click(Sender: TObject);
    procedure DocktoBottom1Click(Sender: TObject);
    procedure Undock1Click(Sender: TObject);
    procedure CloseAppBardemo1Click(Sender: TObject);
    procedure AppBar1Unhiding(Sender: TObject;
      var AllowOperation: Boolean);
    procedure AppBar1Activate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LMDSpeedButton1Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure cxBarEditItem1Change(Sender: TObject);
    procedure cmSHClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure lbClickMouseEnter(Sender: TObject);
    procedure lbClickMouseLeave(Sender: TObject);
    procedure edBuscaEnter(Sender: TObject);
    procedure edBuscaExit(Sender: TObject);
    procedure edBuscaPropertiesChange(Sender: TObject);
    procedure cmChatClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, uWinPopUp;

{$R *.DFM}

procedure TForm1.DocktoLeft1Click(Sender: TObject);
begin
  AppBar1.Placement := bpLeft;
end;

procedure TForm1.DocktoTop1Click(Sender: TObject);
begin
  AppBar1.Placement := bpTop;
end;

procedure TForm1.dxBarLargeButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.cmChatClick(Sender: TObject);
begin
  FormWinPopup.WinPopUp('', '', 0, 0, 5000, 0);
end;

procedure TForm1.cmSHClick(Sender: TObject);
begin
    if AppBar1.Docking.Height=60 then begin
      AppBar1.Docking.Height := 30 ;
    end else begin
      AppBar1.Docking.Height := 60;
      edBusca.EditValue := 'gerenciador de lan house';
    end;
end;

procedure TForm1.edBuscaEnter(Sender: TObject);
begin
  with TcxBarEditItemControl(edBusca.CurItemLink.Control).Edit do begin
    StyleFocused.TextColor := clBlack;
    StyleFocused.TextStyle := [fsBold];
  end;
  cxStyle2.TextColor := clGray;
  cxStyle2.Font.Style := [fsBold];
  
  if edBusca.EditValue<>'' then
  if SameText('Busca na internet', edBusca.EditValue) then
    TcxBarEditItemControl(edBusca.CurItemLink.Control).Edit.EditValue := '';
end;

procedure TForm1.edBuscaExit(Sender: TObject);
begin
  if edBusca.EditValue='' then
    edBusca.EditValue := 'Busca na internet';
end;

procedure TForm1.edBuscaPropertiesChange(Sender: TObject);
begin
  TcxBarEditItemControl(edBusca.CurItemLink.Control).Edit.PostEditValue;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Windows.SetParent(panIm.Handle, FindWindow('ProgMan', nil));
  panIm.Left := Screen.Width - panIm.Width;
  panIm.Top := (Screen.Height - panIm.Height) div 2;
end;

procedure TForm1.lbClickMouseEnter(Sender: TObject);
begin
  lbClick.Style.Color := clNavy;
  lbObtenha.Style.Color := clNavy;
  lbQuery.Style.Color := clNavy;
  panBusca.Color := clNavy;
end;

procedure TForm1.lbClickMouseLeave(Sender: TObject);
begin
  lbClick.Style.Color := $00313131;
  lbObtenha.Style.Color := $00313131;
  lbQuery.Style.Color := $00313131;
  panBusca.Color := $00313131;
end;

procedure TForm1.LMDSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.DocktoRight1Click(Sender: TObject);
begin
  AppBar1.Placement := bpRight;
end;

procedure TForm1.DocktoBottom1Click(Sender: TObject);
begin
  AppBar1.Placement := bpBottom;
end;

procedure TForm1.Undock1Click(Sender: TObject);
begin
  AppBar1.Placement := bpFloat;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.CloseAppBardemo1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.cxBarEditItem1Change(Sender: TObject);
begin

end;

{ }

procedure TForm1.AppBar1Unhiding(Sender: TObject;
  var AllowOperation: Boolean);
begin
  AllowOperation := False;
  Timer1.Enabled := True;
end;

procedure TForm1.AppBar1Activate(Sender: TObject);
begin
  AppBar1.ShowHiddenAppBar(True);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if AppBar1.IsMouseOverAppBar then
    AppBar1.ShowHiddenAppBar(True);
  Timer1.Enabled := False;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if Image1.Tag=0 then begin
    Image1.Tag := 1;
    Image1.Picture.Assign(imOff.Picture);
  end
  else begin
    Image1.Tag := 0;
    Image1.Picture.Assign(imOn.Picture);
  end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  FormWinPopup.WinPopUp('', '', 0, 0, 5000, 0);
end;

end.
