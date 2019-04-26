unit ncafbMovEst;

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
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, cxSpinEdit;

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
  Result := 'Histórico de transações';
end;

procedure TfbMovEst.FiltraDados;
begin
  inherited;
  Tab.DisableControls;
  try
    if not Tab.Active then Tab.Open;

    Tab.IndexName := 'IProduto';
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
    if not DM.tTran.Locate('ID', TabTran.Value, []) then
      raise ENexCafe.Create('Transação não encontrada!');
    ME.LeDataset(DM.tTran);
    DM.LoadIMEs(ME);
    Dados.EditarMovEst(ME);
  finally
    ME.Free;
  end;
end;

end.
