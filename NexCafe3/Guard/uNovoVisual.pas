unit uNovoVisual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, dxGDIPlusClasses, ExtCtrls,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxTextEdit, StdCtrls,
  cxPC, Menus, cxLookAndFeelPainters, cxGraphics, cxSpinEdit, cxMaskEdit,
  cxDropDownEdit, cxButtons, cxGroupBox, cxProgressBar, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, pngimage, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDGraphicControl, LMDFill, cxLookAndFeels, dxBar,
  dxBarExtItems, cxClasses, cxBarEditItem, cxStyles, ComCtrls;

type
  TForm1 = class(TForm)
    Paginas: TcxPageControl;
    teReconectar: TcxTabSheet;
    tsLoginFunc: TcxTabSheet;
    tsConfig: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel7: TcxLabel;
    panCentro1: TLMDPanelFill;
    panDiv1: TLMDPanelFill;
    LMDPanelFill1: TLMDPanelFill;
    panA1: TLMDSimplePanel;
    Imagem1: TImage;
    lbMensagem1: TcxLabel;
    panB1: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDPanelFill3: TLMDPanelFill;
    LMDSimplePanel9: TLMDSimplePanel;
    LMDSimplePanel10: TLMDSimplePanel;
    cxLabel9: TcxLabel;
    panCentro2: TLMDPanelFill;
    panDiv2: TLMDPanelFill;
    LMDPanelFill6: TLMDPanelFill;
    panA2: TLMDSimplePanel;
    cxLabel10: TcxLabel;
    panB2: TLMDSimplePanel;
    LMDSimplePanel16: TLMDSimplePanel;
    cxLabel16: TcxLabel;
    LMDPanelFill7: TLMDPanelFill;
    Image5: TImage;
    LMDSimplePanel6: TLMDSimplePanel;
    LMDSimplePanel13: TLMDSimplePanel;
    cxLabel13: TcxLabel;
    panCentro3: TLMDPanelFill;
    panDiv3: TLMDPanelFill;
    LMDPanelFill10: TLMDPanelFill;
    panA3: TLMDSimplePanel;
    Image6: TImage;
    cxLabel14: TcxLabel;
    panB3: TLMDSimplePanel;
    LMDSimplePanel17: TLMDSimplePanel;
    cxLabel20: TcxLabel;
    LMDPanelFill11: TLMDPanelFill;
    cmAlterarParametros: TcxButton;
    cmSairWindows: TcxButton;
    Timer1: TTimer;
    cxGroupBox1: TcxGroupBox;
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    Button1: TButton;
    Ok: TButton;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    PopupMenu1: TPopupMenu;
    cxGroupBox2: TcxGroupBox;
    Label3: TLabel;
    edServidor: TcxComboBox;
    Label5: TLabel;
    edMaq: TcxSpinEdit;
    btnVoltarC: TButton;
    btnSalvar: TButton;
    cxLabel4: TcxLabel;
    pbConexao: TcxProgressBar;
    tsLoginMaq: TcxTabSheet;
    panLoginMaq: TLMDSimplePanel;
    cxPageControl1: TcxPageControl;
    tsLogin: TcxTabSheet;
    LMDPanelFill2: TLMDPanelFill;
    tsErro: TcxTabSheet;
    btnErro: TcxButton;
    gbErro: TcxGroupBox;
    cxLabel6: TcxLabel;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDPanelFill4: TLMDPanelFill;
    LMDPanelFill5: TLMDPanelFill;
    LMDPanelFill8: TLMDPanelFill;
    cxLookAndFeelController1: TcxLookAndFeelController;
    Image4: TImage;
    lbInstrucoes: TcxLabel;
    edUsername: TcxTextEdit;
    cbTipoAcesso: TcxComboBox;
    lbTipoAcesso: TcxLabel;
    lbUsuario: TcxLabel;
    lbSenha: TcxLabel;
    lbRG: TcxLabel;
    edRG: TcxTextEdit;
    btnOk: TcxButton;
    cxTextEdit1: TcxTextEdit;
    lbVersao: TcxLabel;
    LMDPanelFill9: TLMDPanelFill;
    cxLabel5: TcxLabel;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    dxBarDockControl1: TdxBarDockControl;
    lbErro: TcxLabel;
    imErro: TImage;
    dxBarLargeButton3: TdxBarLargeButton;
    cxStyle2: TcxStyle;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    lbMaq: TcxLabel;
    cmConfigurar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cxLabel3: TcxLabel;
    dxBarManager1Bar4: TdxBar;
    Image2: TImage;
    cxLabel15: TcxLabel;
    panErroConn: TLMDSimplePanel;
    imErroConn: TImage;
    lbErroConn: TcxLabel;
    ScrollBox1: TScrollBox;
    LMDSimplePanel11: TLMDSimplePanel;
    Image9: TImage;
    cxLabel22: TcxLabel;
    cxTabSheet1: TcxTabSheet;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    PopupMenu2: TPopupMenu;
    imAjuda1: TImage;
    lbAjuda1: TcxLabel;
    procedure cmSairWindowsClick(Sender: TObject);
    procedure cxLabel3Click(Sender: TObject);
    procedure cxLabel17Click(Sender: TObject);
    procedure cxLabel21Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxLabel22Click(Sender: TObject);
    procedure cxLabel8Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure cmConfigurarClick(Sender: TObject);
    procedure lbAjuda1MouseEnter(Sender: TObject);
    procedure lbAjuda1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AjustaTela;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AjustaTela;
const Gap = 22;
begin
  panDiv1.Left := (panCentro1.Width - panDiv1.Width) div 2;
  panDiv2.Left := panDiv1.Left;
  panDiv3.Left := panDiv1.Left;
  panDiv1.Height := panCentro1.Height;
  panDiv2.Height := panCentro1.Height;
  panDiv3.Height := panCentro1.Height;
  panA1.Left := panDiv1.Left - Gap - panA1.Width;
  panA1.Top  := ((panCentro1.Height-panA1.Height) div 2) - 20;
  panB1.Left := panDiv1.Left + panDiv1.Width + Gap;
  panB1.Top  := panA1.Top;

  panA2.Left := panDiv2.Left - Gap - panA2.Width;
  panA2.Top  := ((panCentro2.Height-panA2.Height) div 2) - 20;
  panB2.Left := panDiv2.Left + panDiv2.Width + Gap;
  panB2.Top  := panA2.Top;

  panA3.Left := panDiv3.Left - Gap - panA3.Width;
  panA3.Top  := ((panCentro3.Height-panA3.Height) div 2) - 20;
  panB3.Left := panDiv3.Left + panDiv3.Width + Gap;
  panB3.Top  := panA3.Top;

  panLoginMaq.Left := (Width - panLoginMaq.Width) div 2;
  panLoginMaq.Top := ((Height - panLoginMaq.Height) div 2) - 20;

{  panAjuda.Width := (panCentro1.Width div 2) - 40;
  panAjuda.Left := 20;
  panAjuda.Height := panCentro1.Height - 40;
  panAjuda.Top := 20;}
end;

procedure TForm1.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := Paginas.ActivePageIndex + 1;
end;

procedure TForm1.cmSairWindowsClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.cxLabel17Click(Sender: TObject);
begin
     Paginas.ActivePageIndex := 2;
end;

procedure TForm1.cxLabel21Click(Sender: TObject);
begin
 Paginas.ActivePageIndex := 3;
end;

procedure TForm1.cxLabel22Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.lbAjuda1MouseEnter(Sender: TObject);
begin
  lbAjuda1.Style.TextStyle := [fsBold, fsUnderline];  
end;

procedure TForm1.lbAjuda1MouseLeave(Sender: TObject);
begin
  lbAjuda1.Style.TextStyle := [fsBold];  
end;

procedure TForm1.cxLabel3Click(Sender: TObject);
begin
  Paginas.ActivePageIndex := 1;
end;

procedure TForm1.cxLabel8Click(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
end;

procedure TForm1.dxBarButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.dxBarLargeButton1Click(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
end;

procedure TForm1.dxBarLargeButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.dxBarLargeButton3Click(Sender: TObject);
begin
  Paginas.ActivePageIndex := Paginas.ActivePageIndex + 1;
end;

procedure TForm1.cmConfigurarClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
end;

procedure TForm1.cmFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  AjustaTela;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
{  RichEdit2.Text := Memo1.Lines.Text;
  Paginas.HideTabs := True;
  AjustaTela;
  Paginas.ActivePageIndex := 0;}
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
//  Timer1.Enabled := False;
  AjustaTela;
end;

end.
