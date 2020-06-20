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
  cxImageComboBox, Buttons, ncClassesBase, LMDControl, ncaFrmTotal,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, dxBarBuiltInMenu,
  cxTextEdit, cxPC;

type
  TFrmDebito = class(TForm)
    panCab2: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
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
    LMDSimplePanel3: TLMDSimplePanel;
    cmRecibo: TdxBarControlContainerItem;
    cbRecibo: TcxCheckBox;
    panTot: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    pgValPontos: TcxPageControl;
    tsTotVal: TcxTabSheet;
    panTot1: TLMDSimplePanel;
    panSubTotal: TLMDSimplePanel;
    edTotalDebito: TcxCurrencyEdit;
    lbSubTotal: TcxLabel;
    LMDSimplePanel7: TLMDSimplePanel;
    LMDSimplePanel8: TLMDSimplePanel;
    tsTotPontos: TcxTabSheet;
    LMDSimplePanel9: TLMDSimplePanel;
    LMDSimplePanel10: TLMDSimplePanel;
    cxLabel5: TcxLabel;
    lbDisp: TcxLabel;
    LMDSimplePanel11: TLMDSimplePanel;
    cxLabel6: TcxLabel;
    lbNec: TcxLabel;
    LMDSimplePanel12: TLMDSimplePanel;
    LMDSimplePanel13: TLMDSimplePanel;
    tsCusto: TcxTabSheet;
    panTotCusto: TLMDSimplePanel;
    edCustoT: TcxCurrencyEdit;
    lbTotCusto: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel3: TcxLabel;
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
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDeb : TncDebito;
    FRes : Boolean;
    FTot      : TFrmTotal;

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
var I: Integer;
begin
  //vgT.HideEdit;
  //if vgTPago.Properties.Value > FTot.Total then
    //raise ENexCafe.Create(SValorPagoNãoPodeSerMaiorQueTotal);

  if FTot.Desconto > FTot.SubTotal then
    raise ENexCafe.Create(SValorDoDescontoNãoPodeSerMaiorQu); 
  
  FRes := True;
  Close;

  with TV.DataController do 
  for I := FDeb.Itens.Count-1 downto 0 do 
    if Values[I, 0]=False then begin
      FDeb.Itens[I].Free;
      FDeb.Itens.Delete(I);
    end;

  FDeb.Recibo := cbRecibo.Checked;
  FDeb.Total := FTot.SubTotal; //edTotalDebito.Value; //FTot.SubTotal;
  FDeb.Desconto := FTot.Desconto;
  FDeb.Obs := FTot.Obs;
  if FTot.Pago=0 then
    Fdeb.Pago := FTot.Total else
    Fdeb.Pago := FTot.Pago;


 end;

procedure TFrmDebito.cmNenhumClick(Sender: TObject);
var I: Integer;
begin
  with TV.DataController do
  for I := 0 to FDeb.Itens.Count - 1 do
    Values[I, 0] := False;

  FTot.SubTotal := 0;
  FTot.Desconto := 0;
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

  FTot.SubTotal := T;
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
    panTot.Enabled := False;
  end;

  FTot.InitVal(FDeb.PagEsp, FDeb.Total, FDeb.Desconto, FDeb.Pago, 0, 0, FDeb.Obs, panTot);
  FTot.PagandoDebito;

  with TV.DataController do
  for I := 0 to FDeb.Itens.Count - 1 do begin
    AppendRecord;
    Values[I, 0] := True;
    LeItem(I);
    Values[I, 3] := FDeb.Itens[I].idTotal;
  end;

  FTot.Desconto := FDeb.Desconto;

  Totaliza;

  ShowModal;

  Result := FRes;
end;

procedure TFrmDebito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDebito.FormCreate(Sender: TObject);
begin
  FTot := TFrmTotal.Create(Self);
  FTot.panTot.Parent := Self.panTot;

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
  edTotalDebito.Value := T;
  FTot.SubTotal := S;
  //FTot.Total := S-FTot.Desconto;

  Ftot.SubTotal := T;
end;

procedure TFrmDebito.TVDblClick(Sender: TObject);
var
  V: Variant;
  I: Integer;
begin
  if not panTot.Enabled then Exit;

  with TV.DataController do begin
    I := FocusedRecordIndex;
    V := not Values[I, 0];
    Values[I, 0] := V;
    if V=True then
      FTot.SubTotal := FTot.SubTotal + FDeb.Itens[I].idTotal else
      FTot.SubTotal := FTot.SubTotal - FDeb.Itens[I].idTotal;
    if FTot.Desconto > FTot.SubTotal then
      FTot.Desconto := FTot.SubTotal;
    //FTot.Total := FTot.SubTotal - FTot.Desconto;
//    if vgTPagTotal.Properties.Value=True then
//      vgTPago.Properties.Value := FTot.Total else
//    if vgTPago.Properties.Value > FTot.Total then
//      vgTPago.Properties.Value := FTot.Total;
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




end.

