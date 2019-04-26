unit ncaFrmDebito;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxDropDownEdit, cxCurrencyEdit,
  cxMaskEdit, cxRadioGroup, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  kbmMemTable, dxBarExtItems, dxBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, cxVGrid,
  cxDBVGrid, cxInplaceContainer, LMDCustomControl, LMDCustomPanel, ncDebito,
  LMDCustomBevelPanel, LMDSimplePanel, cxCheckBox, cxContainer, cxLabel,
  cxImageComboBox, Buttons, ncClassesBase, LMDControl,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator;

type
  TFrmDebito = class(TForm)
    panCab2: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    panTotais: TLMDSimplePanel;
    vgT: TcxVerticalGrid;
    vgTTotal: TcxEditorRow;
    vgTDesconto: TcxEditorRow;
    vgTTotalF: TcxEditorRow;
    vgTPagTotal: TcxEditorRow;
    vgTPago: TcxEditorRow;
    Grid: TcxGrid;
    TV: TcxGridTableView;
    TVDescr: TcxGridColumn;
    TVTotal: TcxGridColumn;
    GL: TcxGridLevel;
    LMDSimplePanel5: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    cmTodos: TdxBarButton;
    cmNenhum: TdxBarButton;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cmEditar: TdxBarButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    TVPagar: TcxGridColumn;
    TVDataHora: TcxGridColumn;
    lbNomeCli: TcxLabel;
    cxLabel2: TcxLabel;
    vgTSel: TcxEditorRow;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    cmRecibo: TdxBarControlContainerItem;
    cbRecibo: TcxCheckBox;
    cxLabel1: TcxLabel;
    procedure cmNenhumClick(Sender: TObject);
    procedure cmTodosClick(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TVPagarCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure vgTDescontoEditPropertiesChange(Sender: TObject);
    procedure vgTPagTotalEditPropertiesChange(Sender: TObject);
    procedure vgTDescontoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FDeb : TncDebito;
    FRes : Boolean;

    procedure LeItem(aItem: Integer);
  public
    function Editar(aNovo: Boolean; aDeb: TncDebito; aNomeCli: String): Boolean;
    procedure Totaliza;
    { Public declarations }
  end;

var
  FrmDebito: TFrmDebito;

implementation

uses ncaDM, ncIDRecursos, ncaFrmPri, ufmImagens;

// START resource string wizard section
resourcestring
  SValorPagoNãoPodeSerMaiorQueTotal = 'Valor pago não pode ser maior que total final';
  SValorDoDescontoNãoPodeSerMaiorQu = 'Valor do desconto não pode ser maior que o valor a pagar';
  SDébitoPago = 'Débito Pago';
  SAcessoMáq = 'Acesso Máq: ';
  SAcesso = 'Acesso';
  SVenda = 'Venda';
  SVenda_1 = 'Venda: ';
  SImpressão = 'Impressão';
  STempo = 'Tempo';
  STempo_1 = 'Tempo: ';

// END resource string wizard section


{$R *.dfm}

{ TFrmDebito }

procedure TFrmDebito.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDebito.cmGravarClick(Sender: TObject);
begin
  vgT.HideEdit;
  if vgTPago.Properties.Value > vgTTotalF.Properties.Value then
    raise ENexCafe.Create(SValorPagoNãoPodeSerMaiorQueTotal);

  if vgTDEsconto.Properties.Value > vgTSel.Properties.Value then
    raise ENexCafe.Create(SValorDoDescontoNãoPodeSerMaiorQu); 
  
  FRes := True;
  Close;
  FDeb.Recibo := cbRecibo.Checked;
  FDeb.Total := vgTSel.Properties.Value;
  FDeb.Desconto := vgTDesconto.Properties.Value;
  FDeb.pago := vgTPago.Properties.Value;
end;

procedure TFrmDebito.cmNenhumClick(Sender: TObject);
var I: Integer;
begin
  with TV.DataController do 
  for I := 0 to FDeb.Itens.Count - 1 do
    Values[I, 0] := False;
  
  vgTSel.Properties.Value := 0;
  vgTDesconto.Properties.Value := 0;
  vgTTotalF.Properties.Value := 0;
  vgTPago.Properties.Value := 0;

  vgT.HideEdit;
  vgT.ShowEdit; 
end;

procedure TFrmDebito.cmTodosClick(Sender: TObject);
var 
  I: Integer;
  T: Currency;
begin
  T := 0; 
  with TV.DataController do 
  for I := 0 to FDeb.Itens.Count - 1 do begin
    Values[I, 0] := True;
    T := T + FDeb.Itens[I].idTotal;
  end;
  
  vgTSel.Properties.Value := T;
  vgTTotalF.Properties.Value := T - vgTDesconto.Properties.Value;
  if vgTPagTotal.Properties.Value=True then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value else
    vgTPago.Properties.Value := 0;

  vgT.HideEdit;
  VGT.ShowEdit; 
end;

function TFrmDebito.Editar(aNovo: Boolean; aDeb: TncDebito; aNomeCli: String): Boolean;
var I : Integer;
begin
  FDeb := aDeb;
  FRes := False;
  lbNomeCli.Caption := aNomeCli;

  with Dados.CM.Config do begin
    if (RecImprimir>0) then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := aNovo and (RecImprimir=2);  
  end;

  if not aNovo then begin
    TVTotal.Caption := SDébitoPago;
    cmGravar.Enabled := False;
    panTotais.Enabled := False;
  end;
  
  with TV.DataController do 
  for I := 0 to FDeb.Itens.Count - 1 do begin
    AppendRecord;
    Values[I, 0] := True;
    LeItem(I);
    Values[I, 3] := FDeb.Itens[I].idTotal;
  end;

  vgTDesconto.Properties.Value := FDeb.Desconto;
  vgTPago.Properties.Value := FDeb.Pago;
  vgTPagTotal.Properties.Value := True;

  Totaliza;
  vgTPago.Properties.Value := vgTTotalF.Properties.Value;
  
  ShowModal;

  Result := FRes;
end;

procedure TFrmDebito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDebito.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmDebito.FormShow(Sender: TObject);
begin
  Grid.SetFocus;
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmDebito.LeItem(aItem: Integer);
begin
  with TV.DataController do
  with Dados, FDeb.Itens[aItem] do
  case idTipoItem of
    itSessao : begin
      if tbSessao.Locate('ID', idItemID, []) then begin // do not localize
        Values[aItem, 1] := SAcessoMáq+tbSessaoMaq.AsString;
        Values[aItem, 2] := tbSessaoTermino.Value;
      end else
        Values[aItem, 1] := SAcesso;
    end;
    
    itMovEst : begin
      Values[aItem, 1] := SVenda;
      if not tbMovEst.Locate('ID', idItemID, []) then Exit; // do not localize
      Values[aItem, 2] := tbMovEstDataHora.Value;
      if not tbPro.Locate('ID', tbMovEstProduto.Value, []) then Exit; // do not localize
      Values[aItem, 1] := SVenda_1 + tbMovEstQuant.AsString + '-' + tbProDescricao.Value;
    end;

    itImpressao : begin
      Values[aItem, 1] := SImpressão;
      if tbImp.Locate('ID', idItemID, []) then // do not localize
        Values[aItem, 2] := tbImpDataHora.Value;
    end;

    itTempo : begin
      Values[aItem, 1] := STempo;
      if not tbTempo.FindKey([idItemID]) then Exit;
      Values[aItem, 2] := tbTempoDataHora.Value;
      if not tbTran.Locate('ID', tbTempoTran.Value, []) then Exit; // do not localize
      Values[aItem, 1] := STempo_1+tbTranDescr.Value
    end;
  end;
end;

procedure TFrmDebito.Totaliza;
var
  I: Integer;
  V: Variant; 
  T, S: Currency;
begin
  T := 0;
  S := 0;
  with TV.DataController do
  for I := 0 to RecordCount-1 do begin
    V := Values[I, 0];
    if (V<>null) and (V=True) then
      S := S + FDeb.Itens[I].idTotal;
    T := T + FDeb.Itens[I].idTotal;
  end;
  vgTTotal.Properties.Value := T;
  vgTSel.Properties.Value := S;
  vgTTotalF.Properties.Value := S-vgTDesconto.Properties.Value;
end;

procedure TFrmDebito.TVDblClick(Sender: TObject);
var
  V: Variant;
  I: Integer;
begin
  if not panTotais.Enabled then Exit;
  
  with TV.DataController do begin
    I := FocusedRecordIndex;
    V := not Values[I, 0];
    Values[I, 0] := V;
    if V=True then 
      vgTSel.Properties.Value := vgTSel.Properties.Value + FDeb.Itens[I].idTotal else
      vgTSel.Properties.Value := vgTSel.Properties.Value - FDeb.Itens[I].idTotal;
    if vgTDesconto.Properties.Value > vgTSel.Properties.Value then
      vgTDesconto.Properties.Value := vgTSel.Properties.Value;
    vgTTotalF.Properties.Value := vgTSel.Properties.Value - vgTDesconto.Properties.Value;   
    if vgTPagTotal.Properties.Value=True then
      vgTPago.Properties.Value := vgTTotalF.Properties.Value else
    if vgTPago.Properties.Value > vgTTotalF.Properties.Value then
      vgTPago.Properties.Value := vgTTotalF.Properties.Value; 
  end;
end;

procedure TFrmDebito.TVPagarCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  with AViewInfo do
  if (Value <>null) and (Value=True) then 
    ACanvas.Font.Style := [fsBold];
end;

procedure TFrmDebito.vgTDescontoEditPropertiesChange(Sender: TObject);
begin
  vgTTotalF.Properties.Value := vgTSel.Properties.Value - vgTDesconto.Properties.Value;
  if vgTPago.Properties.Value > vgTTotalF.Properties.Value then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value;
  if vgTPagTotal.Properties.Value then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value;
end;

procedure TFrmDebito.vgTDescontoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmDebito.vgTPagTotalEditPropertiesChange(Sender: TObject);
begin
  if vgTPagTotal.Properties.Value then
    vgTPago.Properties.Value := vgTTotalF.Properties.Value else
    vgTPago.Properties.Value := 0;
end;

end.

