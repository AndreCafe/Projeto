unit uRAfbPREstat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxContainer, cxLabel, kbmMemTable,
  kbmMWCustomConnectionPool, kbmMWCustomDataset, kbmMWClientDataset,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore;

type
  TfbPREstat = class(TFrmBase)
    Grid: TcxGrid;
    tvFin: TcxGridDBTableView;
    glFin: TcxGridLevel;
    Q: TkbmMWClientQuery;
    dsQ: TDataSource;
    cmMostrar: TdxBarCombo;
    cmBaixar: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure cmAtualizarClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
  protected
    procedure QueryEstat;  
  public
    procedure Atualizar; 

    class function Descricao: String; override;
    
  
    { Public declarations }
  end;

var
  fbPREstat: TfbPREstat;

implementation


uses uRAPri, uRADM;

{$R *.dfm}

procedure TfbPREstat.Atualizar;
begin
  if cmMostrar.ItemIndex=-1 then
    cmMostrar.ItemIndex := 0;
  Q.Active := False;
  Q.Query.Clear;
  tvFin.BeginUpdate;
  with DM do
  try
    tvFin.ClearItems;
    tvFin.DataController.Summary.FooterSummaryItems.Clear;
    
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

procedure TfbPREstat.FormCreate(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

class function TfbPREstat.Descricao: String;
begin
  Result := 'Pagar / Receber - Estatísticas';
end;

procedure TfbPREstat.cmAtualizarClick(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

procedure TfbPREstat.cmMostrarChange(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

procedure TfbPREstat.QueryEstat;
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

end.







                                                                  