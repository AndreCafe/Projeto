unit ncaFrmConfigCaixaFechamento;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, StdCtrls, cxRadioGroup, cxLabel,
  LMDPNGImage, ExtCtrls, cxButtons, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxCheckBox;

type
  TFrmConfigCaixaFechamento = class(TFrmBaseOpcao)
    img: TImage;
    cbSaldoFinal: TcxCheckBox;
    cbRelAutomatico: TcxCheckBox;
  private
    { Private declarations }
  public
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;

    procedure Renumera; override;

    function NumItens: Integer; override;
  
    { Public declarations }
  end;

var
  FrmConfigCaixaFechamento: TFrmConfigCaixaFechamento;

implementation

uses ncClassesBase;

{$R *.dfm}

{ TFrmConfigCaixaAbertura }

function TFrmConfigCaixaFechamento.Alterou: Boolean;
begin
  Result := True;
  if cbSaldoFinal.Checked <> gConfig.PedirSaldoF then Exit;
  if cbRelAutomatico.Checked <> gConfig.RelCaixaAuto then Exit;
  Result := False;
end;

procedure TFrmConfigCaixaFechamento.Ler;
begin
  inherited;
  cbSaldoFinal.Checked := gConfig.PedirSaldoF;
  cbRelAutomatico.Checked := gConfig.RelCaixaAuto;
end;

function TFrmConfigCaixaFechamento.NumItens: Integer;
begin
  Result := 2;
end;

procedure TFrmConfigCaixaFechamento.Renumera;
begin
  inherited;
  cbSaldoFinal.Caption := IntToStr(InicioNumItem) + '. ' + cbSaldoFinal.Caption;
  cbRelAutomatico.Caption := IntToStr(InicioNumItem+1) + '. ' + cbRelAutomatico.Caption;
end;

procedure TFrmConfigCaixaFechamento.Salvar;
begin
  inherited;
  gConfig.PedirSaldoF := cbSaldoFinal.Checked;
  gConfig.RelCaixaAuto := cbRelAutomatico.Checked;
end;

end.
