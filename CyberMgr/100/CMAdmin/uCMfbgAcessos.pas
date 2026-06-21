unit uCMfbgAcessos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  {$ifdef Ver150}
  Variants,
  {$endif}
  Db, ffdb, dxDBTLCl, dxGrClms, dxExEdtr, ExtCtrls;

const
  FiltroNenhum  = 0;
  FiltroCliente = 1;

  
type
  TfbgAcessos = class(TFrmBaseGrid)
    Tab: TffTable;
    dsTab: TDataSource;
    TabNumero: TAutoIncField;
    TabAberto: TBooleanField;
    TabInicio: TDateTimeField;
    TabFim: TDateTimeField;
    TabContato: TIntegerField;
    TabNome: TStringField;
    TabMaquina: TWordField;
    TabFuncI: TStringField;
    TabFuncF: TStringField;
    TabTempo: TDateTimeField;
    TabMotivoDesc: TWordField;
    TabValor: TCurrencyField;
    TabObs: TMemoField;
    GridNumero: TdxDBGridMaskColumn;
    GridContato: TdxDBGridMaskColumn;
    GridNome: TdxDBGridMaskColumn;
    GridMaquina: TdxDBGridMaskColumn;
    GridFuncI: TdxDBGridMaskColumn;
    GridFuncF: TdxDBGridMaskColumn;
    GridMotivo: TdxDBGridMaskColumn;
    GridTotal: TdxDBGridCurrencyColumn;
    GridObs: TdxDBGridMemoColumn;
    TabCredUsado: TIntegerField;
    TabCredAnterior: TIntegerField;
    TabIsento: TBooleanField;
    TabData: TDateTimeField;
    GridIsento: TdxDBGridCheckColumn;
    GridData: TdxDBGridColumn;
    GridInicio: TdxDBGridColumn;
    GridFim: TdxDBGridColumn;
    TabCredUsadoT: TDateTimeField;
    TabCredAntT: TDateTimeField;
    GridCredAnt: TdxDBGridTimeColumn;
    GridCredUsado: TdxDBGridTimeColumn;
    TabDataPagto: TDateTimeField;
    TabDesconto: TCurrencyField;
    TabTipo: TWordField;
    TabFormaPagto: TStringField;
    GridTempo: TdxDBGridTimeColumn;
    GridDesconto: TdxDBGridCurrencyColumn;
    TabMotivo: TStringField;
    TabValorFinal: TCurrencyField;
    TabCaixa: TIntegerField;
    TabTempoCobrado: TDateTimeField;
    GridTempoCobrado: TdxDBGridColumn;
    GridProdutos: TdxDBGridCurrencyColumn;
    TabNaoUsarPacote: TBooleanField;
    TabProdutos: TCurrencyField;
    GridAcesso: TdxDBGridCurrencyColumn;
    cmMostrar: TdxBarCombo;
    TabCodPacote: TWordField;
    TabTipoAcesso: TWordField;
    TabNomeTipoAcesso: TStringField;
    GridTipo: TdxDBGridLookupColumn;
    cmOrdenar: TdxBarCombo;
    GridTipoTrans: TdxDBGridImageColumn;
    GridSinal: TdxDBGridCurrencyColumn;
    TabSinal: TCurrencyField;
    TabAcessoPago: TIntegerField;
    TabValorFinalAcesso: TCurrencyField;
    TabDescontoProduto: TCurrencyField;
    Timer1: TTimer;
    TabManutencao: TBooleanField;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmPeriodoTudoClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
    procedure cmOrdenarChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Editar; override;
    procedure Novo; override;
    
    procedure FiltraDados; override;
    
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;
    
    { Public declarations }
  end;

var
  fbgAcessos: TfbgAcessos;

implementation

uses cmClassesBase, uCMFrmAcesso, uCMFrmVendaPac, uCMDados, uCMFrmCredito;

{$R *.DFM}

procedure TfbgAcessos.FiltraDados;
begin
  Tab.DisableControls;
  Fim := Int(Fim) + 0.9999999;
  try
    if not Tab.Active then Tab.Open;

    GridTipo.Visible := Dados.CM.Config.VariosTiposAcesso;
    GridTipo.DisableCustomizing := not GridTipo.Visible;

    if TipoFiltro = FiltroCliente then begin
      Tab.IndexName := 'IContato';
      Tab.SetRange([Filtro, Inicio], [Filtro, Fim]);
      GridNome.Visible := False;
      GridNome.DisableCustomizing := True;
    end else 
    case cmMostrar.ItemIndex of
      0 : begin
        Tab.IndexName := 'IPagto';
        Tab.SetRange([False, null], [False, null]);
      end;
      1 : begin
        if cmOrdenar.ItemIndex=0 then
          Tab.IndexName := 'ICaixaFim'
        else
          Tab.IndexName := 'ICaixa';  
        Tab.SetRange([NumAberto], [NumAberto]);
      end;
      2 : begin
        if cmOrdenar.ItemIndex=0 then
          Tab.IndexName := 'IFim'
        else  
          Tab.IndexName := 'IData';
          
        Tab.SetRange([Date], [Date+0.9999999]);
      end;
    else 
      if cmOrdenar.ItemIndex=0 then
        Tab.IndexName := 'IFim'
      else  
        Tab.IndexName := 'IData';
        
      Tab.SetRange([Inicio], [Fim]);
    end;  

    Tab.Refresh;
    Tab.Filtered := True;
    Tab.Last;

    if Grid.DataSource = nil then
      Grid.Datasource := dsTab;
  finally
    Tab.EnableControls;
  end;
  Grid.GotoFirst;
end;

procedure TfbgAcessos.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); 
begin
  Grid.DataSource := nil;
  cmSubPeriodo.Visible := ivNever;
  cmOrdenar.Visible := ivNever;
  inherited;
end;

procedure TfbgAcessos.TabCalcFields(DataSet: TDataSet);
begin
  TabData.Value := TabInicio.Value;
  if TabCredUsado.Value=0 then
    TabCredUsadoT.Clear
  else  
    TabCredUsadoT.Value := TicksToDateTime(TabCredUsado.Value);

  if TabCredAnterior.Value=0 then
    TabCredAntT.Clear
  else
    TabCredAntT.Value   := TicksToDateTime(TabCredAnterior.Value);

  TabValorFinal.Value := TabProdutos.Value + CalcAcesso(TabValor.Value, TabSinal.Value, TabDesconto.Value);     
end;

procedure TfbgAcessos.Editar;
begin
  if Tab.RecordCount > 0 then
  case TabTipo.Value of
    0,3,4 : TFrmAcesso.Create(Self).Editar(Tab, 2);
    1 : TFrmVendaPac.Create(Self).Editar(Tab);
    2 : TFrmCredito.Create(Self).Editar(Tab);
    taSinal :
    if Dados.tbAcesso.Locate('Numero', TabAcessoPago.Value, []) then
      TFrmAcesso.Create(Self).EditarEsp(Dados.tbAcesso, False, 0);
  end;  
end;

procedure TfbgAcessos.Novo;
begin
  TFrmVendaPac.Create(Self).Novo(Tab);
end;

procedure TfbgAcessos.cmPeriodoTudoClick(Sender: TObject);
begin
  inherited cmPeriodoTudoClick(Sender);
end;

procedure TfbgAcessos.cmMostrarChange(Sender: TObject);
begin
  inherited;
  if cmMostrar.ItemIndex>2 then 
    cmSubPeriodo.Visible := ivAlways
  else
    cmSubPeriodo.Visible := ivNever;  

  if cmMostrar.ItemIndex>0 then
    cmOrdenar.Visible := ivAlways
  else
    cmOrdenar.Visible := ivNever;
        
  FiltraDados;
end;

procedure TfbgAcessos.cmOrdenarChange(Sender: TObject);
begin
  FiltraDados;
end;

procedure TfbgAcessos.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FiltraDados;
end;

procedure TfbgAcessos.FormCreate(Sender: TObject);
begin
  inherited;
  if Dados.CM.Config.ModoPagtoAcesso<>mpgSomenteTransacoes then 
    cmMostrar.ItemIndex := 1;
end;

end.
