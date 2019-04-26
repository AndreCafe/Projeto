unit ncafbMovEst;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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
  cxLookAndFeelPainters, uParentedPanel, cxNavigator;

type
  TfbMovEst = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVDataMov: TcxGridDBColumn;
    TVTipoTran: TcxGridDBColumn;
    TVUnitarioFinal: TcxGridDBColumn;
    TVTotal: TcxGridDBColumn;
    TVQuantFator: TcxGridDBColumn;
    TVEstoquePost: TcxGridDBColumn;
    GL: TcxGridLevel;
    TabID: TAutoIncField;
    TabTran: TIntegerField;
    TabProduto: TIntegerField;
    TabQuant: TFloatField;
    TabUnitario: TCurrencyField;
    TabTotal: TCurrencyField;
    TabCustoU: TCurrencyField;
    TabItem: TWordField;
    TabDesconto: TCurrencyField;
    TabPago: TCurrencyField;
    TabDataHora: TDateTimeField;
    TabEntrada: TBooleanField;
    TabCancelado: TBooleanField;
    TabEstoqueAnt: TFloatField;
    TabCliente: TIntegerField;
    TabCaixa: TIntegerField;
    TabCategoria: TStringField;
    TabNaoControlaEstoque: TBooleanField;
    TabITran: TIntegerField;
    TabTipoTran: TWordField;
    TabSessao: TIntegerField;
    TabQuantFator: TFloatField;
    TabEstoquePost: TFloatField;
    TVCaixa: TcxGridDBColumn;
    TVTran: TcxGridDBColumn;
    TabPagoPost: TCurrencyField;
    TabDescPost: TCurrencyField;
    TabFidResgate: TBooleanField;
    TabFidPontos: TFloatField;
    TVFidResgate: TcxGridDBColumn;
    cmEditarTran: TdxBarButton;
    cmImprimirGrid: TdxBarButton;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure TVDblClick(Sender: TObject);
    procedure cmImprimirGridClick(Sender: TObject);
    procedure TVUnitarioFinalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
  public
    class function Descricao: String; override;

    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
  
    { Public declarations }
  end;

var
  fbMovEst: TfbMovEst;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ufmImagens, 
  ncAuxPassaporte,
  ncClassesBase, ncMovEst, ncDMServ;

// START resource string wizard section
resourcestring
  SHistóricoDeTransações = 'Histórico de transações';
  STransaçãoNãoEncontrada = 'Transação não encontrada!';

// END resource string wizard section


{$R *.dfm}

{ TfbMovEst }

procedure TfbMovEst.AtualizaDireitos;
begin
  inherited;
  dxBarDockControl1.SunkenBorder := False;
  BarMgr.Bars[0].BorderStyle := bbsNone;
end;

procedure TfbMovEst.cmImprimirGridClick(Sender: TObject);
begin
  inherited;
  cmImprimirClick(nil);
end;

class function TfbMovEst.Descricao: String;
begin
  Result := SHistóricoDeTransações;
end;

procedure TfbMovEst.FiltraDados;
begin
  inherited;
  Tab.DisableControls;
  try
    if not Tab.Active then Tab.Open;

    Tab.IndexName := 'IProduto'; // do not localize
    Tab.SetRange([Filtro], [Filtro]);
    Tab.Refresh;
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbMovEst.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  if TabEntrada.Value then
    TabQuantFator.Value := TabQuant.Value else
    TabQuantFator.Value := TabQuant.Value * -1;
    
  if TabCancelado.Value then
    TabEstoquePost.Value := TabEstoqueAnt.Value else
    TabEstoquePost.Value := TabEstoqueAnt.Value + TabQuantFator.Value;
end;

procedure TfbMovEst.TVDblClick(Sender: TObject);
var ME : TncMovEst;
begin
  inherited;
  ME := TncMovEst.Create;
  try
    if not DM.tTran.Locate('ID', TabTran.Value, []) then // do not localize
      raise ENexCafe.Create(STransaçãoNãoEncontrada);
    ME.LeDataset(DM.tTran);
    DM.LoadIMEs(ME);
    Dados.EditarMovEst(ME);
  finally
    ME.Free;
  end;
end;

procedure TfbMovEst.TVUnitarioFinalGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[TVTipoTran.Index];
  if (not VarIsNull(V)) and ((V=trEstEntrada) or (V=trEstSaida)) then
    AText := '';
end;

end.

