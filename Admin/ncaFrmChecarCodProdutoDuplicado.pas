unit ncaFrmChecarCodProdutoDuplicado;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, StdCtrls, cxButtons,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxTextEdit, cxCurrencyEdit, cxCheckBox;

type
  TFrmChecarCodProdutoDuplicado = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
    Image1: TImage;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChecarCodProdutoDuplicado: TFrmChecarCodProdutoDuplicado;

implementation

uses
   ncClassesBase, ncaDM, ncaFrmConfigCodProdutoDuplicado;

{$R *.dfm}

procedure TFrmChecarCodProdutoDuplicado.FormShow(Sender: TObject);
begin
    btnOk.enabled := Dados.CM.UA.Admin;
end;

procedure TFrmChecarCodProdutoDuplicado.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmChecarCodProdutoDuplicado.cxButton1Click(Sender: TObject);
begin
  TFrmConfigCodProdutoDuplicado.Create(self).ShowModal;
end;

procedure TFrmChecarCodProdutoDuplicado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
