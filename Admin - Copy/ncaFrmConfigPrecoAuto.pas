unit ncaFrmConfigPrecoAuto;
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
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, LMDPNGImage, cxTextEdit,
  cxCurrencyEdit, DB, nxdb;


type
  TFrmConfigPrecoAuto = class(TFrmBaseOpcaoImgTxtCheckBox)
    panMargem: TLMDSimplePanel;
    lbMargem: TcxLabel;
    edMargem: TcxCurrencyEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;

    procedure Renumera; override;
    function NumItens: Integer; override;
    
  end;

var
  FrmConfigPrecoAuto: TFrmConfigPrecoAuto;

implementation

uses ncaDM, ncClassesBase;

{$R *.dfm}

{ TFrmBaseOpcaoImgTxtCheckBox1 }

function TFrmConfigPrecoAuto.Alterou: Boolean;
begin
  Result := (gConfig.PrecoAuto<>CB.Checked) or
            (gConfig.Margem<>edMargem.Value);
end;

procedure TFrmConfigPrecoAuto.Ler;
begin
  inherited;
  CB.Enabled := Dados.CM.UA.Admin;
  CB.Checked := gConfig.PrecoAuto;
  edMargem.Value := gConfig.Margem;
end;

function TFrmConfigPrecoAuto.NumItens: Integer;
begin
  Result := 2;
end;

procedure TFrmConfigPrecoAuto.Renumera;
begin
  inherited;
  lbMargem.Caption := IntToStr(InicioNumItem+1)+'. ' + lbMargem.Caption;
end;

procedure TFrmConfigPrecoAuto.Salvar;
begin
  inherited;
  gConfig.PrecoAuto := CB.Checked;
  gConfig.Margem    := edMargem.Value;
end;

end.
