unit uNGPriYahoo2;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, Graphics, 
  Menus, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, ImgList,
  cxGraphics, dxBar, dxBarExtItems, cxClasses, OleCtrls, SHDocVw, SHDocVw_EWB,
  EmbeddedWB, pngimage, cxImage, cxBarEditItem, cxControls, cxContainer, cxEdit,
  cxLabel, cxTextEdit, cxStyles, LMDCustomComponent, DdeMan, AppBar,
  cxLookAndFeelPainters, cxButtons, LMDPNGImage, LMDImageListVCLConnector,
  LMDBaseGraphicControl, Buttons, PngSpeedButton, LMDCustomParentPanel,
  LMDCustomPanelFill, LMDPanelFill, AdvGlassButton;

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
    barMgr: TdxBarManager;
    panPri: TLMDSimplePanel;
    cxBarEditItem1: TcxBarEditItem;
    Timer2: TTimer;
    cmHora: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    im24: TcxImageList;
    dxBarLargeButton2: TdxBarLargeButton;
    cxStyle2: TcxStyle;
    dxBarStatic1: TdxBarStatic;
    edBusca: TcxBarEditItem;
    cxStyle3: TcxStyle;
    cmChat: TdxBarLargeButton;
    Timer3: TTimer;
    dxBarLargeButton3: TdxBarLargeButton;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    cxStyle6: TcxStyle;
    Timer4: TTimer;
    cxStyle7: TcxStyle;
    Timer5: TTimer;
    DDE: TDdeClientConv;
    Timer6: TTimer;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    PngSpeedButton1: TPngSpeedButton;
    panBarY: TLMDPanelFill;
    panChat: TLMDSimplePanel;
    imChat: TImage;
    Image1: TImage;
    lbChat: TcxLabel;
    panValor: TLMDSimplePanel;
    lbValor: TcxLabel;
    panHora: TLMDSimplePanel;
    imHora: TImage;
    lbHora: TcxLabel;
    panEncerrar: TLMDSimplePanel;
    imEncerrar: TImage;
    Image5: TImage;
    lbEncerrar: TcxLabel;
    panNome: TLMDSimplePanel;
    imNome: TImage;
    Image9: TImage;
    lbNome: TcxLabel;
    panConfig: TLMDSimplePanel;
    imConfig: TImage;
    Image4: TImage;
    lbConfig: TcxLabel;
    panDeb: TLMDSimplePanel;
    imDebitos: TImage;
    lbDeb: TcxLabel;
    panFecharNex: TLMDSimplePanel;
    imFecharNex: TImage;
    Image6: TImage;
    lbFecharNex: TcxLabel;
    panPontos: TLMDSimplePanel;
    imPontos: TImage;
    lbPontos: TcxLabel;
    imValor: TImage;
    lbDebPrompt: TcxLabel;
    procedure AppBar1Unhiding(Sender: TObject;
      var AllowOperation: Boolean);
    procedure AppBar1Activate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LMDSpeedButton1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure lbValorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure panPontosMouseEnter(Sender: TObject);
    procedure panPontosMouseExit(Sender: TObject);
    procedure lbEncerrarClick(Sender: TObject);
  private
    FInicio : Cardinal;
    FBuscando : Boolean;
    FBuf : PChar;
    FUrlAtual : String;
    FSL : TStrings;
    FPrim : Boolean;
    procedure SetUrlAtual(const Value: String);
    { Private declarations }
  public
    procedure ObtemSiteProg;
    property UrlAtual: String
      read FUrlAtual write SetUrlAtual;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, madCodeHook, ncAppUrlLog, ncClassesBase;

{$R *.DFM}

procedure TForm1.dxBarLargeButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPrim := True;
  GetMem(FBuf, 1024);
  FInicio := GetTickCount;
  FBuscando := False;
  FSL := TStringList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeMem(FBuf, 1024);
  FSL.Free;
end;

procedure TForm1.panPontosMouseEnter(Sender: TObject);
begin
  TLmdSimplePanel(Sender).Color := $00775628;
end;

procedure TForm1.panPontosMouseExit(Sender: TObject);
begin
  TLmdSimplePanel(Sender).Color := $0059401E;
end;

procedure TForm1.LMDSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ObtemSiteProg;
begin
end;

procedure TForm1.PngSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.SetUrlAtual(const Value: String);
begin
end;

procedure TForm1.lbEncerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.lbValorClick(Sender: TObject);
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

procedure TForm1.Timer3Timer(Sender: TObject);
begin
{  if FPrim then
    FormWinPopup.WB.Navigate(ExtractFilePath(ParamStr(0))+'tagyahoo.html') else
    FormWinPopup.WB.Refresh;  }
    
  FPrim := True;
  Timer6.Enabled := True;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
  lbHora.Caption := FormatDateTime('hh:mm:ss', (GetTickCount-FInicio)/1000/60/60/24);
//  Form2.Visible := True;
end;

end.
