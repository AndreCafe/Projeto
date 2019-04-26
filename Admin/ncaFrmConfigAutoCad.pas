unit ncaFrmConfigAutoCad;
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
  TFrmConfigAutoCad = class(TFrmBaseOpcaoImgTxtCheckBox)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;
  end;

var
  FrmConfigAutoCad: TFrmConfigAutoCad;

implementation

uses ncClassesBase, ncaDM;

{$R *.dfm}

{ TFrmConfigAutoCad }

function TFrmConfigAutoCad.Alterou: Boolean;
begin
  Result := (CB.Checked <> gConfig.AutoCad);
end;

procedure TFrmConfigAutoCad.Ler;
begin
  inherited;
  CB.Checked := gConfig.Autocad;
end;

procedure TFrmConfigAutoCad.Salvar;
begin
  inherited;
  gConfig.Autocad := CB.Checked;
end;

end.
