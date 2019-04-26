unit ncaFrmConfigCodProdutoDuplicado;
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
  TFrmConfigCodProdutoDuplicado = class(TFrmBaseOpcaoImgTxtCheckBox)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;
    
  end;

var
  FrmConfigCodProdutoDuplicado: TFrmConfigCodProdutoDuplicado;

implementation

uses ncaDM, ncClassesBase;

{$R *.dfm}

{ TFrmConfigCodProdutoDuplicado }

function TFrmConfigCodProdutoDuplicado.Alterou: Boolean;
begin
  Result := (CB.Checked <> gConfig.CodProdutoDuplicados);
end;

procedure TFrmConfigCodProdutoDuplicado.Ler;
begin
  inherited;
  CB.Checked := gConfig.CodProdutoDuplicados;
end;

procedure TFrmConfigCodProdutoDuplicado.Salvar;
begin
  inherited;
  gConfig.CodProdutoDuplicados := CB.Checked;
end;

end.
