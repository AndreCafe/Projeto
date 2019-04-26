unit ncaFrmSaibaMaisClonar;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, StdCtrls, cxButtons,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxTextEdit, cxCurrencyEdit, cxCheckBox;

type
  TFrmSaibaMaisClonar = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
    Image1: TImage;
    cxLabel2: TcxLabel;
    procedure btnOkClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSaibaMaisClonar: TFrmSaibaMaisClonar;

implementation

uses ncClassesBase, ncaDM;

{$R *.dfm}

procedure TFrmSaibaMaisClonar.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSaibaMaisClonar.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSaibaMaisClonar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
