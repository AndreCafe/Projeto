unit ncaFrmOperMaq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxRadioGroup, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxLabel, pngimage, Buttons, PngSpeedButton, PngBitBtn,
  cxLookAndFeelPainters, cxButtons, Menus, cxGroupBox, LMDGraph, LMDPNGImage, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDTypes, LMDBevel, LMDCustomBevelPanel, LMDSimplePanel,
  cxPC, cxGraphics, cxLookAndFeels;

type
  TFrmOperMaq = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    rbMaq: TcxRadioButton;
    rbTodas: TcxRadioButton;
    btnCancelar: TcxButton;
    btnOk: TcxButton;
    Paginas: TcxPageControl;
    tsLogoff: TcxTabSheet;
    Image2: TImage;
    LMDSimplePanel6: TLMDSimplePanel;
    lbOperacao: TcxLabel;
    cxLabel1: TcxLabel;
    tsDesligar: TcxTabSheet;
    Image1: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    tsReiniciar: TcxTabSheet;
    tsFecharNex: TcxTabSheet;
    Image3: TImage;
    LMDSimplePanel3: TLMDSimplePanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    Image4: TImage;
    LMDSimplePanel4: TLMDSimplePanel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    rbLivres: TcxRadioButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Mostrar(aMaq: Integer; aOpcao: Byte);
  end;

var
  FrmOperMaq: TFrmOperMaq;

implementation

uses 
  ncaDM, 
  ncaFrmUsuario, 
  ncIDRecursos;

{$R *.dfm}

const
  SelColor : Array[Boolean] of TColor = (clBtnFace, clWhite);

procedure TFrmOperMaq.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOperMaq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmOperMaq.FormCreate(Sender: TObject);
begin
  Paginas.HideTabs := True;
end;

procedure TFrmOperMaq.Mostrar(aMaq: Integer; aOpcao: Byte);
begin
  rbMaq.Tag := aMaq;
  rbMaq.Caption := 'Máquina ' + IntToStr(AMaq);
  Paginas.ActivePageIndex := aOpcao;
  ShowModal;
end;

procedure TFrmOperMaq.btnOkClick(Sender: TObject);
begin
  with Dados.CM do   
  if rbMaq.Checked then 
    ShutDownMaq(rbMaq.Tag, Paginas.ActivePageIndex)
  else
  if rbLivres.Checked then
    ShutdownMaq(High(Word), Paginas.ActivePageIndex)
  else  
    ShutDownMaq(0, Paginas.ActivePageIndex);
         
  Close;
end;


end.
