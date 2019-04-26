unit ncaFrmConfigQuickCad;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcaoImgTxtCheckBox, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls,
  cxButtons, cxLabel, cxCheckBox, ExtCtrls, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, LMDPNGImage;

type
  TFrmConfigQuickCad = class(TFrmBaseOpcaoImgTxtCheckBox)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;
    
  end;

var
  FrmConfigQuickCad: TFrmConfigQuickCad;

implementation

uses ncaDM, ncClassesBase;

{$R *.dfm}

{ TFrmBaseOpcaoImgTxtCheckBox1 }

function TFrmConfigQuickCad.Alterou: Boolean;
begin
  Result := (gConfig.QuickCad<>CB.Checked);
end;

procedure TFrmConfigQuickCad.Ler;
begin
  inherited;
  CB.Enabled := Dados.CM.UA.Admin;
  CB.Checked := gConfig.Quickcad;
end;

procedure TFrmConfigQuickCad.Salvar;
begin
  inherited;
  gConfig.QuickCad := CB.Checked;
end;

end.
