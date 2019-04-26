unit ncaFrmPMNaoPausar;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxLabel, cxTextEdit,
  cxMemo, cxDBEdit;

type
  TFrmPMNaoPausar = class(TForm)
    edPMNaoPausar: TcxMemo;
    lbInfoImpNex: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
  private
    { Private declarations }
  public
    procedure Editar;
    { Public declarations }
  end;

var
  FrmPMNaoPausar: TFrmPMNaoPausar;

implementation

{$R *.dfm}

{ TForm2 }

procedure TFrmPMNaoPausar.Editar;
var Save: String;
begin
  Save := edPMNaoPausar.Lines.Text;
  ShowModal;
  if ModalResult<>mrOk then
    edPMNaoPausar.Lines.Text := Save;
end;

end.
