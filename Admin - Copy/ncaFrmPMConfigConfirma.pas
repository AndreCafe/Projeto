unit ncaFrmPMConfigConfirma;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxMemo, cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, cxCheckBox, cxLabel, StdCtrls, cxButtons, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmConfigConfirma = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    LMDSimplePanel2: TLMDSimplePanel;
    lbInfoImpNex: TcxLabel;
    edPMMostrarPaginasCli: TcxCheckBox;
    edPMMostrarValorCli: TcxCheckBox;
    edPMCalcValorCli: TcxImageComboBox;
    lbPMCalcValorCli: TcxLabel;
    edPMObs: TcxMemo;
    lbPMObs: TcxLabel;
  private
    { Private declarations }
  public
    procedure Editar;
    { Public declarations }
  end;

var
  FrmConfigConfirma: TFrmConfigConfirma;

implementation

{$R *.dfm}

{ TFrmConfigConfirma }

procedure TFrmConfigConfirma.Editar;
var
  saveMostrarPaginasCli,
  saveMostrarValorCli : Boolean;
  saveCalcValorCli : Integer;
  saveObs: String;
begin
  saveMostrarPaginasCli := edPMMostrarPaginasCli.Checked;
  saveMostrarValorCli := edPMMostrarValorCli.Checked;
  saveCalcValorCli := edPMCalcValorCli.EditValue;
  saveObs := edPMObs.Lines.Text;
  ShowModal;
  if ModalResult<>mrOk then begin
    edPMMostrarPaginasCli.Checked := saveMostrarPaginasCli;
    edPMMostrarValorCli.Checked := saveMostrarValorCli;
    edPMCalcValorCli.EditValue := saveCalcValorCli;
    edPMObs.Lines.Text := saveObs;
  end;
end;

end.
