unit ncaFrmConfigConfirmaDeb;
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
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  PngImage;

type
  TFrmConfigConfirmaDeb = class(TFrmBaseOpcaoImgTxtCheckBox)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;
  end;

var
  FrmConfigConfirmaDeb: TFrmConfigConfirmaDeb;

implementation

uses ncClassesBase, ncaDM;

{$R *.dfm}

{ TFrmConfigAutoCad }

function TFrmConfigConfirmaDeb.Alterou: Boolean;
begin
  Result := ((not CB.Checked) <> gConfig.ConfirmarDebito);
end;

procedure TFrmConfigConfirmaDeb.Ler;
begin
  inherited;
  CB.Checked := not gConfig.ConfirmarDebito;
end;

procedure TFrmConfigConfirmaDeb.Salvar;
begin
  inherited;
  gConfig.ConfirmarDebito := not CB.Checked;
end;

end.
