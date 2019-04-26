unit ncaFrmConfigFid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcaoImgTxtCheckBox, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxTextEdit,
  cxCurrencyEdit, StdCtrls, cxButtons, cxLabel, cxCheckBox, dxGDIPlusClasses,
  ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxDBEdit, cxMaskEdit, cxSpinEdit, cxGroupBox;

type
  TFrmConfigFid = class(TFrmBaseOpcaoImgTxtCheckBox)
    cbProdutos: TcxGroupBox;
    cbFidParcial: TcxCheckBox;
    panPremium: TLMDSimplePanel;
    Image1: TImage;
    cxLabel3: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    lbPontos: TcxLabel;
    edFidVendasPontos: TcxSpinEdit;
    lbAcumular: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    lbGastos: TcxLabel;
    edFidVendasValor: TcxCurrencyEdit;
    lbACada: TcxLabel;
    procedure panPremiumClick(Sender: TObject);
    procedure CBClick(Sender: TObject);
  private
    { Private declarations }

    procedure EnableDisable;
  public

    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;

    procedure Renumera; override;
    function NumItens: Integer; override;
  
    { Public declarations }
  end;

var
  FrmConfigFid: TFrmConfigFid;

implementation

uses ncaFrmPri, ncaDM, ncClassesBase;

{$R *.dfm}

resourcestring
  SInformarPontos = 'É necessário informar a quantidade de pontos';
  SInformarValor  = 'É necessário informar o valor';

{ TFrmBaseOpcaoImgTxtCheckBox1 }

function TFrmConfigFid.Alterou: Boolean;
begin
  Result := True;
  if CB.Checked <> gConfig.FidAtivo then Exit;
  if edFidVendasPontos.Value <> gConfig.FidVendaPontos then Exit;
  if edFidVendasValor.Value <> gConfig.FidVendaValor then Exit;
  if cbFidParcial.Checked <> gConfig.FidParcial then Exit;
  Result := False;
end;

procedure TFrmConfigFid.CBClick(Sender: TObject);
begin
  inherited;
  EnableDisable;
  if CB.Focused and CB.Checked then
    edFidVendasPontos.SetFocus;
end;

procedure TFrmConfigFid.EnableDisable;
begin
  lbAcumular.Enabled := CB.Checked and CB.Enabled;
  edFidVendasPontos.Enabled := lbAcumular.Enabled;
  lbPontos.Enabled := lbAcumular.Enabled;
  lbAcada.Enabled := lbAcumular.Enabled;
  edFidVendasValor.Enabled := lbAcumular.Enabled;
  lbGastos.Enabled := lbAcumular.Enabled;
  cbFidParcial.Enabled := lbAcumular.Enabled;
  cbProdutos.Enabled := lbAcumular.Enabled;
end;

procedure TFrmConfigFid.Ler;
begin
  inherited;
  panPremium.Visible := not gConfig.IsPremium;
  CB.Enabled := gConfig.IsPremium;
  CB.Checked := gConfig.FidAtivo;
  edFidVendasPontos.Value := gConfig.FidVendaPontos;
  edFidVendasValor.Value := gConfig.FidVendaValor;
  cbFidParcial.Checked := gConfig.FidParcial;
  EnableDisable;
end;

function TFrmConfigFid.NumItens: Integer;
begin
  Result := 4;
end;

procedure TFrmConfigFid.panPremiumClick(Sender: TObject);
begin
  inherited;
  OpenPremium('fidelidade');
end;

procedure TFrmConfigFid.Renumera;
begin
  inherited;
  CB.Caption := IntToStr(InicioNumItem)+'. '+CB.Caption;
  lbAcada.Caption := IntToStr(InicioNumItem+2)+lbACada.Caption;
  lbAcumular.Caption := IntToStr(InicioNumItem+1)+lbAcumular.Caption;
  cbFidParcial.Caption := IntToStr(InicioNumItem+3)+cbFidParcial.Caption;
end;

procedure TFrmConfigFid.Salvar;
begin
  inherited;

  if CB.Checked then begin;
    if VarIsNull(edFidVendasPontos.Value) or (edFidVendasPontos.Value<0.01) then begin
      edFidVendasPontos.SetFocus;
      raise Exception.Create(SInformarPontos);
    end;

    if edFidVendasValor.Value<0.01 then begin
      edFidVendasValor.SetFocus;
      raise Exception.Create(SInformarValor);
    end;
  end;
  gConfig.FidAtivo := CB.Checked;
  gConfig.FidVendaPontos := edFidVendasPontos.Value;
  gConfig.FidVendaValor := edFidVendasValor.Value;
  gConfig.FidParcial := cbFidParcial.Checked;
end;

end.
