unit ucmafbMovEst;

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
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore;

type
  TfbMovEst = class(TFrmBase)
    Tab: TnxTable;
    TabNumSeq: TAutoIncField;
    TabTransacao: TIntegerField;
    TabProduto: TStringField;
    TabQuant: TFloatField;
    TabUnitario: TCurrencyField;
    TabTotal: TCurrencyField;
    TabItem: TWordField;
    TabDesconto: TCurrencyField;
    TabDataMov: TDateTimeField;
    TabDataPag: TDateTimeField;
    TabEntrada: TBooleanField;
    TabCancelado: TBooleanField;
    TabEstoqueAnt: TFloatField;
    TabTipoTran: TWordField;
    TabContato: TIntegerField;
    TabCaixaMov: TIntegerField;
    TabCaixaPag: TIntegerField;
    TabCategoria: TStringField;
    TabQuantFator: TFloatField;
    TabEstoquePost: TFloatField;
    TabNomeContato: TStringField;
    TabTotalFinal: TCurrencyField;
    TabUnitarioFinal: TCurrencyField;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVDataMov: TcxGridDBColumn;
    TVTipoTran: TcxGridDBColumn;
    TVUnitarioFinal: TcxGridDBColumn;
    TVTotal: TcxGridDBColumn;
    TVQuantFator: TcxGridDBColumn;
    TVEstoquePost: TcxGridDBColumn;
    TVNomeContato: TcxGridDBColumn;
    GL: TcxGridLevel;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure TVDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Descricao: String; override;

    procedure FiltraDados; override;
  
    { Public declarations }
  end;

var
  fbMovEst: TfbMovEst;

implementation

uses ucmaDM, ucmaPri, ufmImagens, ucmaFrmAcesso, cmAuxPassaporte,
  ucmaFrmME, cmClassesBase;

{$R *.dfm}

{ TfbMovEst }

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
    Tab.SetRange([Filtro, DataI], [Filtro, DataF]);
    Tab.Refresh;
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbMovEst.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  if TabEntrada.Value then
    TabQuantFator.Value := TabQuant.Value
  else
    TabQuantFator.Value := TabQuant.Value * -1;
  TabEstoquePost.Value := TabEstoqueAnt.Value + TabQuantFator.Value;
  TabTotalFinal.Value := TabTotal.Value - TabDesconto.Value;
  if TabDesconto.Value > 0.009 then
    TabUnitarioFinal.Value := (TabDesconto.Value / TabTotal.Value) * TabUnitario.Value
  else
    TabUnitarioFinal.Value := TabUnitario.Value;  
end;

procedure TfbMovEst.TVDblClick(Sender: TObject);
begin
  inherited;
  with Dados do
  if tbAcesso.Locate('Numero', TabTransacao.Value, []) then
  if TabTipoTran.Value = ttAcessoVenda then
    TFrmAcesso.Create(Self).Editar(tbAcesso, 2)
  else
    TFrmME.Create(Self).Editar(tbAcesso);
end;

end.
