unit ncaFrmConfigComanda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcaoImgTxt, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxCheckBox, StdCtrls, cxButtons, cxLabel, LMDPNGImage, ExtCtrls,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, uFrmPanFaixas;

type
  TFrmConfigComanda = class(TFrmBaseOpcaoImgTxt)
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    panEdit: TLMDSimplePanel;
    lbComandaNumeracao: TcxLabel;
    cbUsarComandas: TcxCheckBox;
    procedure cbUsarComandasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    panFaixas : TFrmFaixas;
  public
    { Public declarations }
    procedure Atualizar; 
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;

    procedure Renumera; override;

    function NumItens: Integer; override;
  end;

var
  FrmConfigComanda: TFrmConfigComanda;

implementation

{$R *.dfm}

uses ncClassesBase, ncaDM;

{ TFrmConfigComanda }

resourcestring
  SNumeracaoComandaInvalida = 'O número final das comandas deve ser maior que o número inicial';
  SNumeracaoComandaIgualMaq = 'Comandas e mesas devem ter numeração diferente';
  
function TFrmConfigComanda.Alterou: Boolean;
begin
  Result := (cbUsarComandas.Checked<>(not gConfig.ComandaOff)) or
            (panFaixas.AsString<>gConfig.FaixaComanda);
end;

procedure TFrmConfigComanda.Atualizar;
begin
  panFaixas.Habilitar(cbUsarComandas.Checked);
  lbComandaNumeracao.Enabled := cbUsarComandas.Checked;
{  if cbUsarComandas.Checked and (cbUsarComandas.Focused) then
    edComandaI.SetFocus;}
end;

procedure TFrmConfigComanda.cbUsarComandasClick(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

procedure TFrmConfigComanda.FormCreate(Sender: TObject);
begin
  panFaixas := TFrmFaixas.Create(Self);
  panFaixas.panPri.Parent := panEdit;
  panFaixas.panPri.Top := 1000;
  panFaixas.panPri.Margins.Left := 26;
  panFaixas.panPri.AlignWithMargins := True;
  inherited;
end;

procedure TFrmConfigComanda.Ler;
begin
  inherited;
  cbUsarComandas.Checked := not gConfig.ComandaOff;
  panFaixas.AsString := gConfig.FaixaComanda;
  Atualizar;
end;

function TFrmConfigComanda.NumItens: Integer;
begin
  Result := 2;
end;

procedure TFrmConfigComanda.Renumera;
begin
  inherited;
  cbUsarComandas.Caption := IntToStr(InicioNumItem)+'. '+cbUsarComandas.Caption;
  lbComandaNumeracao.Caption := IntToStr(InicioNumItem+1)+'. '+lbComandaNumeracao.Caption;
end;

procedure TFrmConfigComanda.Salvar;
var I: Integer;
begin
  inherited;
  if cbUsarComandas.Checked then begin

    panFaixas.Valida;

    with Dados.CM do
    for I := 0 to Maquinas.Count-1 do
      if panFaixas.DentroFaixa(Maquinas[I].Numero) then 
        raise Exception.Create(SNumeracaoComandaIgualMaq);
  end;

  gConfig.AtualizaCache;
  gConfig.ComandaOff := not cbUsarComandas.Checked;
  gConfig.FaixaComanda := panFaixas.AsString;
end;

end.
