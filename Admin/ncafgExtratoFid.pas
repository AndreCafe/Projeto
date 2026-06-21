unit ncafgExtratoFid;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxImageComboBox,
  cxMaskEdit, cxCurrencyEdit, cxDBLookupComboBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, nxdb, cxGridCustomPopupMenu,
  cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls, cxTextEdit, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, cxSpinEdit, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, dxPScxPivotGridLnk, uNexTransResourceStrings_PT,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, uParentedPanel;

type
  TfbExtratoFid = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVDataMov: TcxGridDBColumn;
    TVTipoTran: TcxGridDBColumn;
    GL: TcxGridLevel;
    TVCaixa: TcxGridDBColumn;
    TVTran: TcxGridDBColumn;
    TabID: TAutoIncField;
    TabTran: TIntegerField;
    TabCaixa: TIntegerField;
    TabCliente: TIntegerField;
    TabSessao: TIntegerField;
    TabDataHora: TDateTimeField;
    TabTipoTran: TWordField;
    TabTipoItem: TWordField;
    TabSubTipo: TWordField;
    TabItemID: TIntegerField;
    TabSubItemID: TIntegerField;
    TabItemPos: TWordField;
    TabPago: TCurrencyField;
    TabCancelado: TBooleanField;
    TabFidFator: TSmallintField;
    TabFidPontos: TFloatField;
    TabFidMov: TBooleanField;
    TVPontos: TcxGridDBColumn;
    TabFidPontosFat: TFloatField;
    TVTipoItem: TcxGridDBColumn;
    TVCanc: TcxGridDBColumn;
    TabFunc: TStringField;
    TVNomeFunc: TcxGridDBColumn;
    TabNomeFunc: TStringField;
    TVFunc: TcxGridDBColumn;
    TVTipoOpe: TcxGridDBColumn;
    TabFidOpe: TWordField;
    TVPago: TcxGridDBColumn;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure TVPontosCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVPontosGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmEditarClick(Sender: TObject);
    procedure TVNomeFuncGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
  public
    class function Descricao: String; override;

    procedure FiltraDados; override;
  
    { Public declarations }
  end;

var
  fbExtratoFid: TfbExtratoFid;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ufmImagens, 
  ncAuxPassaporte,
  ncClassesBase, ncMovEst, ncDMServ;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

{ TfbMovEst }

procedure TfbExtratoFid.cmEditarClick(Sender: TObject);
begin
  inherited;
  Dados.EditarTran(TabTran.Value);
end;

class function TfbExtratoFid.Descricao: String;
begin
  Result := 'Extrato de movimentação de pontos';
end;

procedure TfbExtratoFid.FiltraDados;
begin
  inherited;
  Tab.DisableControls;
  try
    if not Tab.Active then Tab.Open;
    Tab.SetRange([True, Filtro], [True, Filtro]);
    Tab.Refresh;
    TV.DataController.DataModeController.GridMode := False;
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbExtratoFid.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  if TabFidFator.Value=1 then
    TabFidPontosFat.Value := TabFidPontos.Value 
  else
  if TabFidFator.Value=-1 then
    TabFidPontosFat.Value := TabFidPontos.Value * -1
  else
    TabFidPontosFat.Value := 0;
end;

procedure TfbExtratoFid.TVCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V : Variant;  
begin
  inherited;
  if AViewInfo.Item<>TVPontos then begin
    V := AViewInfo.GridRecord.Values[TVCanc.Index];
    if (V<>null) and (V=True) then
      ACanvas.Font.Color := clGray;
  end;
end;

procedure TfbExtratoFid.TVNomeFuncGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  if Trim(AText)='' then begin
    V := ARecord.Values[TVFunc.Index];
    if V<>null then AText := V;
  end;
end;

procedure TfbExtratoFid.TVPontosCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  inherited;
  with AViewInfo do 
  if (not Selected) and (Value<>null) then
  if Value>0 then
    ACanvas.Font.Color := clGreen else
    ACanvas.Font.Color := clRed;
    
  V := AViewInfo.GridRecord.Values[TVCanc.Index];
  if (V<>null) and (V=True) then 
    ACanvas.Font.Style := [fsBold, fsStrikeOut];
end;

procedure TfbExtratoFid.TVPontosGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if Copy(AText, 1, 1)<>'-' then
    AText := '+'+AText;
end;

end.

