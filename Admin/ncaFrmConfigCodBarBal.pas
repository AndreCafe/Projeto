unit ncaFrmConfigCodBarBal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcaoImgTxtCheckBox, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus,
  cxDropDownEdit, cxImageComboBox, cxSpinEdit, cxTextEdit, cxMaskEdit, StdCtrls,
  cxButtons, cxLabel, cxCheckBox, PngImage, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmConfigCodBarBal = class(TFrmBaseOpcaoImgTxtCheckBox)
    panDadosCod: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    lbTam: TcxLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    lbIdent: TcxLabel;
    edIdent: TcxMaskEdit;
    edTam: TcxSpinEdit;
    LMDSimplePanel5: TLMDSimplePanel;
    lbInicioCod: TcxLabel;
    edInicioCod: TcxSpinEdit;
    LMDSimplePanel6: TLMDSimplePanel;
    lbPPValor: TcxLabel;
    lbDigitos: TcxLabel;
    lbCod: TcxLabel;
    lbPP: TcxLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    lbInicioPP: TcxLabel;
    edInicioPP: TcxSpinEdit;
    LMDSimplePanel2: TLMDSimplePanel;
    lbCom: TcxLabel;
    edPPDig: TcxSpinEdit;
    edFimCod: TcxSpinEdit;
    lbFimCod: TcxLabel;
    edFimPP: TcxSpinEdit;
    lbFimPP: TcxLabel;
    edValor: TcxImageComboBox;
    lbDigPP: TcxLabel;
    btnPremium: TcxButton;
    procedure edValorPropertiesEditValueChanged(Sender: TObject);
    procedure edValorPropertiesChange(Sender: TObject);
    procedure CBClick(Sender: TObject);
    procedure btnPremiumClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure EnableDisable;

    function TamCod: Integer;
    function TamPP: Integer;
  public
    procedure Ler; override;
    procedure Salvar; override;
    function Alterou: Boolean; override;

    procedure Renumera; override;

    function NumItens: Integer; override;

    { Public declarations }
  end;

var
  FrmConfigCodBarBal: TFrmConfigCodBarBal;

implementation

uses ncaFrmPri, ncClassesBase, ncaFrmBaseOpcao, ufmImagens, ncaDM;

{$R *.dfm}

resourcestring
  rsDigPeso = 'dígitos de fração';
  rsDigValor = 'dígitos de casas decimais';

  rsErroIdentBranco = 'Erro, dígitos iniciais devem ser informados';
  rsTamBranco = 'É necessário informar o tamanho do código de barras gerado pela balança';

  rsInicioCodBranco = 'É necessário informar onde inicia o código do produto';
  rsFimCodIncorreto = 'É necessário informar corretamente onde termina o código do produto';

  rsInicioPPBranco = 'É necessário informar onde inicia o peso ou valor do produto';
  rsFimPPIncorreto = 'É necessário informar corretamente onde termina o peso ou valor do produto';

{ TFrmBaseOpcaoImgTxtCheckBox1 }

function TFrmConfigCodBarBal.Alterou: Boolean;
begin
  Result := True;
  if gConfig.CodBarBal <> CB.Checked then Exit;
  if gConfig.CodBarBalTam <> edTam.Value then Exit;
  if gConfig.CodBarBalIdent <> Trim(edIdent.Text) then Exit;
  if gConfig.CodBarBalInicioCod <> edInicioCod.Value then Exit;
  if gConfig.CodBarBalTamCod <> TamCod then Exit;
  if gConfig.CodBarBalPPInicio <> edInicioPP.Value then Exit;
  if gConfig.CodBarBalPPTam <> TamPP then Exit;
  if gConfig.CodBarBalValor <> edValor.EditValue then Exit;
  if gConfig.CodBarBalPPDig <> edPPDig.Value then Exit;
  Result := False;
end;

procedure TFrmConfigCodBarBal.btnPremiumClick(Sender: TObject);
begin
  inherited;
  OpenPremium('balanca');
end;

procedure TFrmConfigCodBarBal.CBClick(Sender: TObject);
begin
  inherited;
  EnableDisable;
end;

procedure TFrmConfigCodBarBal.edValorPropertiesChange(Sender: TObject);
begin
  inherited;
  edValor.PostEditValue;
end;

procedure TFrmConfigCodBarBal.edValorPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  EnableDisable;
end;

procedure TFrmConfigCodBarBal.EnableDisable;
begin
  btnPremium.Visible := not gConfig.IsPremium;
  CB.Enabled := gConfig.IsPremium;
  CB.Width := cxTextWidth(CB.Style.Font, CB.Caption)+40;

  EnableControls([lbIdent, edIdent, lbTam, edTam, lbDigitos, lbCod, lbInicioCod, edInicioCod, lbFimCod, edFimCod,
                  lbPP, lbInicioPP, edInicioPP, lbFimPP, edFimPP, lbPPValor, edValor, lbCom, edPPDig, lbDigPP], CB.Checked and CB.Enabled);
  
  if edValor.ItemIndex=1 then
    lbDigPP.Caption := rsDigValor else
    lbDigPP.Caption := rsDigPeso;
  callRefreshSize;
end;

procedure TFrmConfigCodBarBal.FormShow(Sender: TObject);
begin
  inherited;
  EnableDisable;
end;

procedure TFrmConfigCodBarBal.Ler;
begin
  inherited;
  CB.Checked := gConfig.CodBarBal;
  edTam.Value := gConfig.CodBarBalTam;
  edIdent.Text := gConfig.CodBarBalIdent;
  edInicioCod.Value := gConfig.CodBarBalInicioCod;
  edFimCod.Value := gConfig.CodBarBalInicioCod + gConfig.CodBarBalTamCod - 1;
  edInicioPP.Value := gConfig.CodBarBalPPInicio;
  edFimPP.Value := gConfig.CodBarBalPPTam + gConfig.CodBarBalPPInicio - 1;
  edValor.EditValue := gConfig.CodBarBalValor;
  edPPDig.Value := gConfig.CodBarBalPPDig;
  EnableDisable;
end;

function TFrmConfigCodBarBal.NumItens: Integer;
begin
  Result := 5;
end;

procedure TFrmConfigCodBarBal.Renumera;
begin
  inherited;
  RenumLB(lbIdent, 1);
  RenumLB(lbTam, 2);
  RenumLB(lbCod, 3);
  RenumLB(lbPP, 4);
end;

procedure TFrmConfigCodBarBal.Salvar;
begin
  inherited;
  if CB.Checked then begin
    if Trim(edIdent.Text)='' then begin
      edIdent.SetFocus;
      Raise exception.Create(rsErroIdentBranco);
    end;

    if VarIsNull(edTam.Value) or (edTam.Value<3) then
    begin
      edTam.SetFocus;
      Raise exception.Create(rsTamBranco);
    end;

    if VarIsNull(edInicioCod.Value) or (edInicioCod.Value<2) then
    begin
      edInicioCod.SetFocus;
      Raise exception.Create(rsInicioCodBranco);
    end;

    if VarIsNull(edFimCod.Value) or (edFimCod.Value<edInicioCod.Value) then
    begin
      edFimCod.SetFocus;
      Raise exception.Create(rsFimCodIncorreto);
    end;

    if VarIsNull(edInicioPP.Value) or (edInicioPP.Value<=edFimCod.Value) then
    begin
      edInicioPP.SetFocus;
      Raise exception.Create(rsInicioPPBranco);
    end;

    if VarIsNull(edFimPP.Value) or (edFimPP.Value<edInicioPP.Value) then
    begin
      edFimPP.SetFocus;
      Raise exception.Create(rsFimPPIncorreto);
    end;

    gConfig.CodBarBal := True;
    gConfig.CodBarBalTam := edTam.Value;
    gConfig.CodBarBalIdent := Trim(edIdent.Text);
    gConfig.CodBarBalInicioCod := edInicioCod.Value;
    gConfig.CodBarBalTamCod := TamCod;
    gConfig.CodBarBalPPInicio := edInicioPP.Value;
    gConfig.CodBarBalPPTam := TamPP;
    gConfig.CodBarBalValor := edValor.EditValue;
    gConfig.CodBarBalPPDig := edPPDig.Value;
  end else
    gConfig.CodBarBal := False;
end;

function TFrmConfigCodBarBal.TamCod: Integer;
begin
  if (not VarIsNull(edFimCod.Value)) and (not VarIsNull(edInicioCod.Value)) and (edFimCod.Value >= edInicioCod.Value)  then
    Result := (edFimCod.Value - edInicioCod.Value) + 1 else
    Result := 0;
end;

function TFrmConfigCodBarBal.TamPP: Integer;
begin
  if (not VarIsNull(edFimPP.Value)) and (not VarIsNull(edInicioPP.Value)) and (edFimPP.Value >= edInicioPP.Value)  then
    Result := (edFimPP.Value - edInicioPP.Value) + 1 else
    Result := 0;
end;

end.
