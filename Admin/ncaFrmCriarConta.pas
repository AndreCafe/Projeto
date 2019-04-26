unit ncaFrmCriarConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxMaskEdit, cxTextEdit, cxLabel, LMDPNGImage, ExtCtrls,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, Menus, StdCtrls, cxButtons, cxDropDownEdit, cxClasses;

type
  TFrmCriarConta = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edProprietario: TcxTextEdit;
    cxLabel3: TcxLabel;
    edTel: TcxMaskEdit;
    cxLabel4: TcxLabel;
    edOperadora: TcxComboBox;
    cxLabel5: TcxLabel;
    edEmail: TcxTextEdit;
    edSenha: TcxTextEdit;
    cxLabel6: TcxLabel;
    edSenha2: TcxTextEdit;
    cxLabel7: TcxLabel;
    edLoja: TcxTextEdit;
    cxLabel8: TcxLabel;
    btnCriarConta: TcxButton;
    btnVoltar: TcxButton;
    panTop: TLMDSimplePanel;
    Image2: TImage;
    cxLabel9: TcxLabel;
    Image3: TImage;
    cxLabel10: TcxLabel;
    cxEditStyleController1: TcxEditStyleController;
    procedure btnCriarContaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCriarConta: TFrmCriarConta;

implementation

{$R *.dfm}

procedure TFrmCriarConta.btnCriarContaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCriarConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
