unit uRAfbPagRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxContainer, cxLabel, kbmMemTable,
  kbmMWCustomConnectionPool, kbmMWCustomDataset, kbmMWClientDataset,
  dxBar;

type
  TfbPagRec = class(TFrmBase)
    Grid: TcxGrid;
    tvFin: TcxGridDBTableView;
    glFin: TcxGridLevel;
    Q: TkbmMWClientQuery;
    dsQ: TDataSource;
    cmMostrar: TdxBarCombo;
    cmBaixar: TdxBarButton;
    procedure cbMostrarPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmAtualizarClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure tvFinDblClick(Sender: TObject);
    procedure QBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FContato : Variant;
  protected
    procedure SetOperacao(const Value: Integer); override;
    procedure QueryTitulos;
    procedure QueryEstat;  
  public
    procedure Atualizar; 

    class function GetOperacoes(AIDOper: Integer;
                                var ADescricao: String): Boolean; override;
    
    class function Descricao: String; override;
    
  
    { Public declarations }
  end;

const
  op_pagrec_Titulos      = 0;
  op_pagrec_Estatisticas = 1;
  

var
  fbPagRec: TfbPagRec;

implementation


uses uRAPri, uRADM, uRSFrmCli;

{$R *.dfm}


{ TfbPagRec }

procedure TfbPagRec.Atualizar;
begin
  if not (Operacao in [op_pagrec_Titulos..op_pagrec_Estatisticas]) then Exit;
  
  if cmMostrar.ItemIndex=-1 then
    cmMostrar.ItemIndex := 0;

  if (Operacao=op_pagrec_Titulos) then begin 
    cmNovo.Visible := ivAlways;
    cmEditar.Visible := ivAlways;
    cmBaixar.Visible := ivAlways;
  end else begin
    cmNovo.Visible := ivNever;
    cmEditar.Visible := ivNever;
    cmBaixar.Visible := ivNever;
  end;  

  Q.Active := False;
  Q.Query.Clear;
  tvFin.BeginUpdate;
  with DM do
  try
    tvFin.ClearItems;
    tvFin.DataController.Summary.FooterSummaryItems.Clear;
    
    if Operacao = op_pagrec_Titulos then
      QueryTitulos
    else
      QueryEstat;
        
    Q.Open;  
    tvFin.DataController.CreateAllItems;
    with TcxGridDBTableSummaryItem(tvFin.DataController.Summary.FooterSummaryItems.Add) do
    begin
      Kind := skSum;
      Position := spFooter;
      FieldName := 'Valor';
      Column := tvFin.GetColumnByFieldName('Valor');
    end;
        
  finally
    tvFin.EndUpdate;
  end;  
  tvFin.ApplyBestFit;  
end;

procedure TfbPagRec.cbMostrarPropertiesChange(Sender: TObject);
begin
  Atualizar;
end;

procedure TfbPagRec.FormCreate(Sender: TObject);
begin
  inherited;
  FContato := Null;
  Atualizar;
end;

class function TfbPagRec.Descricao: String;
begin
  Result := 'Contas à Pagar / Receber';
end;

procedure TfbPagRec.cmAtualizarClick(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

procedure TfbPagRec.cmMostrarChange(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

procedure TfbPagRec.cmEditarClick(Sender: TObject);
begin
  inherited;
  with DM do 
  if qCli.Locate('Codigo', Q.FieldByName('Loja').Value, []) then
    TFrmCli.Create(Self).Editar(1);
end;

procedure TfbPagRec.tvFinDblClick(Sender: TObject);
begin
  inherited;
  if cmEditar.Visible = ivAlways then
    cmEditarClick(nil);
end;

class function TfbPagRec.GetOperacoes(AIDOper: Integer;
  var ADescricao: String): Boolean;
begin
  Result := True;
  case AIDOper of
    op_pagrec_Titulos        : ADescricao := 'Títulos';
    op_pagrec_Estatisticas   : ADescricao := 'Estatisticas';
  else
    Result := False;
  end;  
end;

procedure TfbPagRec.SetOperacao(const Value: Integer);
begin
  if Value = Operacao then Exit;
  inherited;    
  try
    case Value of
      op_pagrec_Titulos : begin
        cmMostrar.Items[0] := 'Em aberto';
        cmMostrar.Items[1] := 'Baixados';
        cmMostrar.Items[2] := 'Todos';
      end;
        
      op_pagrec_Estatisticas : begin
        cmMostrar.Items[0] := 'Recebidos por mês';
        cmMostrar.Items[1] := 'Lançados por mês';
        cmMostrar.Items[2] := 'A Vencer por mês';
      end;
    end;
  finally
  end; 

  Atualizar;
end;

procedure TfbPagRec.QueryTitulos;
var S : String;
begin
  if FContato <> Null then 
    S := 'and (L.Codigo = ' + FContato + ') '
  else
    S := '';
      
  case cmMostrar.ItemIndex of
    0 : // Não Pagos
      Q.Query.Text := 
        'SELECT L.Loja as "Nome da Loja", R.Vencimento, R.Lancamento, R.Valor, R.Descricao, '+
        'R.Obs, R.Loja FROM "Receber" R, Cliente L '+
        'where (pagamento is null) and (L.Codigo = R.Loja) '+S+
        'order by vencimento';
        
    1 : // Recebidos
      Q.Query.Text := 
        'SELECT L.Loja as "Nome da Loja", R.Pagamento, R.Vencimento, R.Lancamento, R.Valor, '+
        'R.ValorPago, R.Descricao, R.Obs, R.Loja FROM "Receber" R, Cliente L ' +
        'where (pagamento is not null) and (L.Codigo = R.Loja) '+S+
        'order by pagamento';
        
    2 : // Todos
     Q.Query.Text := 
       'SELECT L.Loja as "Nome da Loja", R.Pagamento, R.Vencimento, R.Lancamento, R.Valor, '+
       'R.ValorPago, R.Descricao, R.Obs, R.Loja FROM "Receber" R, Cliente L ' +
       'where (L.Codigo = R.Loja) '+S+
       'order by lancamento';  
  end;        
end;

procedure TfbPagRec.QueryEstat;
begin
  case cmMostrar.ItemIndex of
    0 : // Total recebido por mês
      Q.Query.Text := 
        'SELECT Extract(Year from Pagamento) as Ano, Extract(Month from Pagamento) as Mes, '+
        'Sum(ValorPago) as Valor from Receber '+
        'where (pagamento is not null) '+
        'group by ano, mes '+
        'order by ano, mes';
        
    1 : // Total lançado por mês
      Q.Query.Text := 
        'SELECT Extract(Year from Lancamento) as Ano, Extract(Month from Lancamento) as Mes, '+
        'Sum(Valor) as Valor from Receber '+
        'group by ano, mes '+
        'order by ano, mes';
        
    2 : // Total a receber por mês
      Q.Query.Text := 
        'SELECT Extract(Year from Vencimento) as Ano, Extract(Month from Vencimento) as Mes, '+
        'Sum(Valor) as Valor from Receber '+
        'where (pagamento is null) '+
        'group by ano, mes '+
        'order by ano, mes';
  end;      
end;

procedure TfbPagRec.QBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DM do 
  if Q.State in [dsInsert] then 
    Q.FieldByName('ID').AsInteger := mwCli.Request('Admin', '100', 'GetNextAutoInc', ['Receber', 'ID', '']);
end;

end.







                                                                  