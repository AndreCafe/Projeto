unit uRAfbTitulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxContainer, cxLabel, kbmMemTable,
  kbmMWCustomConnectionPool, kbmMWCustomDataset, kbmMWClientDataset,
  dxBar, cxCalendar, cxCurrencyEdit, cxMemo, cxGridCustomPopupMenu,
  cxGridPopupMenu, dxBarExtItems, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxNavigator, nxdb, cxSpinEdit, cxCheckBox;

type
  TfbTitulos = class(TFrmBase)
    Grid: TcxGrid;
    tvFin: TcxGridDBTableView;
    glFin: TcxGridLevel;
    cmMostrar: TdxBarCombo;
    cmBaixar: TdxBarButton;
    tvFinNomedaLoja: TcxGridDBColumn;
    tvFinVencimento: TcxGridDBColumn;
    tvFinPagamento: TcxGridDBColumn;
    tvFinValor: TcxGridDBColumn;
    tvFinValorPago: TcxGridDBColumn;
    tvFinObs: TcxGridDBColumn;
    tvFinDoc: TcxGridDBColumn;
    tvFinDescricao: TcxGridDBColumn;
    tvFinLancamento: TcxGridDBColumn;
    tvFinTipo: TcxGridDBColumn;
    tvFinPC: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    LMDSimplePanel1: TLMDSimplePanel;
    cbPag: TcxComboBox;
    cbSitPag: TcxCheckBox;
    cxCheckBox1: TcxCheckBox;
    edCod: TcxSpinEdit;
    nxQuery1: TnxQuery;
    cxNavigator1: TcxNavigator;
    procedure FormCreate(Sender: TObject);
    procedure cmAtualizarClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure tvFinDblClick(Sender: TObject);
    procedure QBeforePost(DataSet: TDataSet);
    procedure QAfterPost(DataSet: TDataSet);
    procedure QResolveError(Sender: TObject; ErrorType: Integer;
      Message: String; RecordID: Integer; Current: Boolean;
      var Retry: Boolean);
    procedure QBeforeEdit(DataSet: TDataSet);
    procedure dxBarLargeButton1Click(Sender: TObject);
  private
    { Private declarations }
    FContato : Variant;
  protected
    procedure QueryTitulos;
  public
    procedure Atualizar; 

    class function Descricao: String; override;
    
  
    { Public declarations }
  end;

var
  fbTitulos: TfbTitulos;

implementation


uses uNexRegPri, uNRFrmTitulo, uNexRegDM;

{$R *.dfm}


procedure TfbTitulos.Atualizar;
begin
  if cmMostrar.ItemIndex=-1 then
    cmMostrar.ItemIndex := 0;

  Q.Active := False;
  Q.Query.Clear;
  tvFin.BeginUpdate;
  with DM do
  try
    QueryTitulos;
    Q.Open;  
  finally
    tvFin.EndUpdate;
  end;  
  tvFin.ApplyBestFit;  
end;

procedure TfbTitulos.FormCreate(Sender: TObject);
begin
  inherited;
  FContato := Null;
  Atualizar;
end;

class function TfbTitulos.Descricao: String;
begin
  Result := 'Pagar / Receber - Títulos';
end;

procedure TfbTitulos.cmAtualizarClick(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

procedure TfbTitulos.cmMostrarChange(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

procedure TfbTitulos.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmTitulo.Create(Self).Editar(Null, Q);
end;

procedure TfbTitulos.tvFinDblClick(Sender: TObject);
begin
  inherited;
  if cmEditar.Visible = ivAlways then
    cmEditarClick(nil);
end;

procedure TfbTitulos.QueryTitulos;
var S : String;
begin
  if FContato <> Null then 
    S := 'and (L.Codigo = ' + FContato + ') '
  else
    S := '';
      
  case cmMostrar.ItemIndex of
    0 : // Não Pagos
      Q.Query.Text :=
        'SELECT L.Loja as "Nome da Loja", R.* FROM "Receber" R, Cliente L '+
        'where (pagamento is null) and (L.Codigo = R.Loja) '+S+
        'order by vencimento';
        
    1 : // Recebidos
      Q.Query.Text := 
        'SELECT L.Loja as "Nome da Loja", R.* FROM "Receber" R, Cliente L ' +
        'where (pagamento is not null) and (L.Codigo = R.Loja) '+S+
        'order by pagamento';
        
    2 : // Todos
     Q.Query.Text := 
       'SELECT L.Loja as "Nome da Loja", R.* FROM "Receber" R, Cliente L ' +
       'where (L.Codigo = R.Loja) '+S+
       'order by lancamento';  
  end;        
end;

procedure TfbTitulos.QBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DM do 
  if Q.State in [dsInsert] then 
    QID.Value := mwCli.Request('Admin', '100', 'GetNextAutoInc', ['Receber', 'ID', '']);
end;

procedure TfbTitulos.QAfterPost(DataSet: TDataSet);
begin
  inherited;
  try
    Q.Resolve;
    Q.Commit;
  except
    Q.Rollback;
    Raise;
  end;    
end;

procedure TfbTitulos.QResolveError(Sender: TObject; ErrorType: Integer;
  Message: String; RecordID: Integer; Current: Boolean;
  var Retry: Boolean);
begin
  inherited;
  Raise Exception.Create(Message);
end;

procedure TfbTitulos.QBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if Q.TransactionLevel=0 then
    Q.StartTransaction;
end;

procedure TfbTitulos.dxBarLargeButton1Click(Sender: TObject);
begin
  inherited;
  with DM do 
    if qCli.Locate('Codigo', qLoja.Value, []) then
      TFrmCli.Create(Self).Editar(0);
end;

end.







                                                                  