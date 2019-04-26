unit ncafbTotCaixa;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  kbmMemTable, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxBar, dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, ExtCtrls,
  cxContainer, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxSpinEdit, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLookAndFeels,
  cxLookAndFeelPainters, dxPScxPivotGridLnk, uParentedPanel, cxNavigator;

type
  TfbTotCaixa = class(TFrmBase)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    MT: TkbmMemTable;
    DS: TDataSource;
    MTID: TIntegerField;
    MTDescr: TStringField;
    MTValor: TCurrencyField;
    dxBarLargeButton1: TdxBarLargeButton;
    cxStyle2: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle3: TcxStyle;
    LMDSimplePanel1: TLMDSimplePanel;
    gridCedula: TcxGrid;
    glCedula: TcxGridLevel;
    mtCedulas: TkbmMemTable;
    cxLabel1: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVID: TcxGridDBColumn;
    TVDescr: TcxGridDBColumn;
    TVValor: TcxGridDBColumn;
    GL: TcxGridLevel;
    cxLabel2: TcxLabel;
    tvCedula: TcxGridTableView;
    tvCedulaDescr: TcxGridColumn;
    tvCedulaQuant: TcxGridColumn;
    tvCedulaTotal: TcxGridColumn;
    tvCedulaValor: TcxGridColumn;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TVCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVDataControllerDetailHasChildren(Sender: TcxDBDataController;
      ARecordIndex, ARelationIndex: Integer;
      const AMasterDetailKeyFieldNames: string;
      const AMasterDetailKeyValues: Variant; var HasChildren: Boolean);
    procedure tvCedulaTotalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvCedulaQuantGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVValorGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
  private
    { Private declarations }
    procedure Add(aID: Integer; aDescr: String; aValor: Currency);
    procedure AddCedula(aDescr: String; aValor: Currency);
  public
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbTotCaixa: TfbTotCaixa;

implementation

uses ncDMCaixa, ncaFrmPri, ufmImagens;

// START resource string wizard section
resourcestring
  STotalDeCaixa = 'Total de Caixa';
  S1Centavo = '1 centavo';
  S5Centavos = '5 centavos';
  S10Centavos = '10 centavos';
  S25Centavos = '25 centavos';
  S50Centavos = '50 centavos';
  S1Moeda = '1 (moeda)';
  S1Cédula = '1 (cédula)';
  S10 = '10';
  S20 = '20';
  S50 = '50';
  S100 = '100';
  SSaldoInicial = 'Saldo inicial';
  SValoresRecebidos = 'Valores Recebidos';
  SAcessos = '   Acessos';
  SImpressões = '   Impressões';
  SVendas = '   Vendas';
  SDébitosPagos = '   Débitos Pagos';
  SSuprimentos = 'Suprimentos';
  SSangrias = 'Sangrias';
  STotal = 'Total';
  SDebitado = 'Debitado';
  SDescontos = 'Descontos';
  SCancelamentos = 'Cancelamentos';

// END resource string wizard section


{$R *.dfm}

procedure TfbTotCaixa.Add(aID: Integer; aDescr: String; aValor: Currency);
begin
//  TV.OptionsView.Header := False;
  MT.Append;
  MTID.Value := aID;
  MTDescr.Value := aDescr;
  MTValor.Value := aValor;
  MT.Post;
end;

procedure TfbTotCaixa.AddCedula(aDescr: String; aValor: Currency);
var I: Integer;
begin
  I := tvCedula.DataController.AppendRecord;
  tvCedula.DataController.Values[I, 0] := aDescr;
  tvCedula.DataController.Values[I, 3] := aValor;
  tvCedula.DataController.Values[I, 1] := 0;
  tvCedula.DataController.Values[I, 2] := 0;
end;

class function TfbTotCaixa.Descricao: String;
begin
  Result := STotalDeCaixa;
end;

procedure TfbTotCaixa.FrmBasePaiCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  TV.OptionsView.Header := False;
  AddCedula(S1Centavo, 0.01);
  AddCedula(S5Centavos, 0.05);
  AddCedula(S10Centavos, 0.10);
  AddCedula(S25Centavos, 0.25);
  AddCedula(S50Centavos, 0.50);
  AddCedula(S1Moeda, 1);
  AddCedula(S1Cédula, 1);
  AddCedula('2', 2);
  AddCedula('5', 5);
  AddCedula(S10, 10);
  AddCedula(S20, 20);
  AddCedula(S50, 50);
  AddCedula(S100, 100);

  MT.Open;
  i := 0;
  inc(i);
  Add(i, SSaldoInicial, 15);
  inc(i);
  Add(i, '', 0);
  inc(i);
  Add(i, SValoresRecebidos, 117.5);
  inc(i);
  Add(i, SAcessos, 46.7);
  {$IFNDEF LOJA}
  inc(i);
  Add(i, SImpressões, 35);
  {$ENDIF}
  inc(i);
  Add(i, SVendas, 14.30);
  inc(i);
  Add(i, SDébitosPagos, 11);
  inc(i);
  Add(i, '', 0);
  inc(i);
  Add(i, SSuprimentos, 50.3);
  inc(i);
  Add(i, SSangrias, 35.5);
  inc(i);
  Add(i, '', 0);
  inc(i);
  Add(i, STotal, 220.7);
  inc(i);
  Add(i, '', 0);
  inc(i);
  Add(i, SDebitado, 13.5);
  inc(i);
  Add(i, SDescontos, 15.3);
  inc(i);
  Add(i, SCancelamentos, 11.2);
end;

procedure TfbTotCaixa.TVCanFocusRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
var 
  V: Variant;  
  I: Integer;
begin
  inherited;
  V := ARecord.Values[0];
  if (V<>null) then begin
    I := V;
    AAllow := not (I in [2, 8, 11, 13]);
  end;

end;

procedure TfbTotCaixa.tvCedulaQuantGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[1];
  if (V=null) or (V=0) then AText := '';
end;

procedure TfbTotCaixa.tvCedulaTotalGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[2];
  if (V=null) or (V=0) then AText := '';
end;

procedure TfbTotCaixa.TVCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var 
  V: Variant;  
  I: Integer;
begin
  inherited;
  V := AViewInfo.GridRecord.Values[0];
  if V=null then Exit;
  I := V;
  if (AViewInfo.Item.Index<>tvCedulaTotal.Index) and (I<>12) then Exit;
  
  if (I in [1,3,12]) then
    ACanvas.Font.Style := [fsBold]
  else
  if I>13 then
    ACanvas.Font.Color := clRed;

{  if I=12 then 
    ACanvas.Brush.Color := clBlack;
    ACanvas.Font.Color := clWhite;
    ACanvas.Font
  end; }
end;

procedure TfbTotCaixa.TVDataControllerDetailHasChildren(
  Sender: TcxDBDataController; ARecordIndex, ARelationIndex: Integer;
  const AMasterDetailKeyFieldNames: string;
  const AMasterDetailKeyValues: Variant; var HasChildren: Boolean);
begin
  inherited;
  HasChildren := False;
end;

procedure TfbTotCaixa.TVValorGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[2];
  if (V=null) or (V=0) then AText := '';
end;

end.

