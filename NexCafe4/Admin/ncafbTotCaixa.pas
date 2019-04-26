unit ncafbTotCaixa;

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
  LMDCustomBevelPanel, LMDSimplePanel, cxSpinEdit;

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

uses ncDMCaixa, ncaFrmPri;

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
  Result := 'Total de Caixa';
end;

procedure TfbTotCaixa.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  TV.OptionsView.Header := False;
  AddCedula('1 centavo', 0.01);
  AddCedula('5 centavos', 0.05);
  AddCedula('10 centavos', 0.10);
  AddCedula('25 centavos', 0.25);
  AddCedula('50 centavos', 0.50);
  AddCedula('1 (moeda)', 1);
  AddCedula('1 (cédula)', 1);
  AddCedula('2', 2);
  AddCedula('5', 5);
  AddCedula('10', 10);
  AddCedula('20', 20);
  AddCedula('50', 50);
  AddCedula('100', 100);
  
  MT.Open;
  Add(1, 'Saldo inicial', 15);
  Add(2, '', 0);
  Add(3, 'Valores Recebidos', 117.5);
  Add(4, '   Acessos', 46.7);
  Add(5, '   Impressões', 35);
  Add(6, '   Vendas', 14.30);
  Add(7, '   Débitos Pagos', 11);
  Add(8, '', 0);
  Add(9, 'Suprimentos', 50.3);
  Add(10, 'Sangrias', 35.5);
  Add(11, '', 0);
  Add(12, 'Total', 220.7);
  Add(13, '', 0);
  Add(14, 'Debitado', 13.5);
  Add(15, 'Descontos', 15.3);
  Add(16, 'Cancelamentos', 11.2);
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
