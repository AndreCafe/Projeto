unit ncaFrmConfigVendaProdSemSaldo;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcaoImgTxtCheckBox, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls,
  cxButtons, cxLabel, cxCheckBox, LMDPNGImage, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmConfigVendaProdSemSaldo = class(TFrmBaseOpcaoImgTxtCheckBox)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;
  end;

var
  FrmConfigVendaProdSemSaldo: TFrmConfigVendaProdSemSaldo;

implementation

uses ncClassesBase;

{$R *.dfm}

{ TFrmConfigVendaProdSemSaldo }

function TFrmConfigVendaProdSemSaldo.Alterou: Boolean;
begin
  Result := (CB.Checked<>gConfig.NaoVenderAlemEstoque);
end;

procedure TFrmConfigVendaProdSemSaldo.Ler;
begin
  inherited;
  CB.Checked := gConfig.NaoVenderAlemEstoque;
end;

procedure TFrmConfigVendaProdSemSaldo.Salvar;
begin
  inherited;
  gConfig.NaoVenderAlemEstoque := CB.Checked;
end;

end.
