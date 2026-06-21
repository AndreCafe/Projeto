unit uCMfbgPacVen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  {$ifdef Ver150}
  Variants,
  {$endif}
  Db, ffdb, dxDBTLCl, dxGrClms, dxExEdtr;

const
  FiltroNenhum  = 0;
  FiltroCliente = 1;

  
type
  TfbgPacVen = class(TFrmBaseGrid)
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
    GridFuncI: TdxDBGridMaskColumn;
    GridTotal: TdxDBGridCurrencyColumn;
    TabCredUsado: TIntegerField;
    TabCredAnterior: TIntegerField;
    TabIsento: TBooleanField;
    TabData: TDateTimeField;
    GridData: TdxDBGridColumn;
    TabCredUsadoT: TDateTimeField;
    TabCredAntT: TDateTimeField;
    TabDataPagto: TDateTimeField;
    TabDesconto: TCurrencyField;
    TabTipo: TWordField;
    TabFormaPagto: TStringField;
    GridDesconto: TdxDBGridCurrencyColumn;
    TabMotivo: TStringField;
    TabValorFinal: TCurrencyField;
    TabCaixa: TIntegerField;
    TabTempoCobrado: TDateTimeField;
    TabNaoUsarPacote: TBooleanField;
    TabProdutos: TCurrencyField;
    cmMostrar: TdxBarCombo;
    TabNomeContato: TStringField;
    GridTempo: TdxDBGridMaskColumn;
    GridContato: TdxDBGridLookupColumn;
    TabCodPacote: TWordField;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmPeriodoTudoClick(Sender: TObject);
    procedure cmMostrarChange(Sender: TObject);
    procedure GridFilterChanged(Sender: TObject; ADataSet: TDataSet;
      const AFilterText: String);
    procedure GridTempoGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure FormShow(Sender: TObject);
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
  fbgPacVen: TfbgPacVen;

implementation

uses cmClassesBase, uCMFrmAcesso, uCMFrmVendaPac, uCMDados, uCMFrmCredito;

{$R *.DFM}

procedure TfbgPacVen.FiltraDados;
begin
  Tab.DisableControls;
  Fim := Int(Fim) + 0.9999999;
  try
    if not Tab.Active then Tab.Open;

    if TipoFiltro = FiltroCliente then begin
      Tab.IndexName := 'IContato';
      Tab.SetRange([Filtro, Inicio], [Filtro, Fim]);
      GridContato.Visible := False;
      GridContato.DisableCustomizing := True;
    end else 
    case cmMostrar.ItemIndex of
      0 : begin
        Tab.IndexName := 'ICaixa';
        Tab.SetRange([NumAberto], [NumAberto]);
      end;
      1 : begin
        Tab.IndexName := 'IData';
        Tab.SetRange([Date], [Date+0.9999999]);
      end;
    else 
      Tab.IndexName := 'IData';
      Tab.SetRange([Inicio], [Fim]);
    end;  

    if Grid.Filter.FilterText > '' then
      Tab.Filter := '(' + Grid.Filter.FilterText + ') AND (Tipo = 1)'
    else
      Tab.Filter := '(Tipo = 1)';  

    Tab.Refresh;
    Tab.Filtered := (Tab.Filter>'');
    Tab.Last;

    if Grid.DataSource = nil then
      Grid.Datasource := dsTab;
  finally
    Tab.EnableControls;
  end;
  Grid.GotoFirst;
end;

procedure TfbgPacVen.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant);
begin
  Grid.DataSource := nil;
  cmSubPeriodo.Visible := ivNever;
  inherited;
end;

procedure TfbgPacVen.TabCalcFields(DataSet: TDataSet);
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

  TabValorFinal.Value := TabValor.Value + TabProdutos.Value - TabDesconto.Value;     
end;

procedure TfbgPacVen.Editar;
begin
  if Tab.RecordCount > 0 then
  case TabTipo.Value of
    0,3,4 : TFrmAcesso.Create(Self).Editar(Tab, 2);
    1 : TFrmVendaPac.Create(Self).Editar(Tab);
    2 : TFrmCredito.Create(Self).Editar(Tab);
  end;  
end;

procedure TfbgPacVen.Novo;
begin
  TFrmVendaPac.Create(Self).Novo(Tab);
end;

procedure TfbgPacVen.cmPeriodoTudoClick(Sender: TObject);
begin
  inherited cmPeriodoTudoClick(Sender);
end;

procedure TfbgPacVen.cmMostrarChange(Sender: TObject);
begin
  inherited;
  if cmMostrar.ItemIndex>1 then 
    cmSubPeriodo.Visible := ivAlways
  else
    cmSubPeriodo.Visible := ivNever;  
  FiltraDados;
end;

procedure TfbgPacVen.GridFilterChanged(Sender: TObject; ADataSet: TDataSet;
  const AFilterText: String);
begin
  FiltraDados;
end;

procedure TfbgPacVen.GridTempoGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
var 
  V : Variant;  
  E : Extended;
begin
  V := ANode.Values[gridTempo.Index];
  if V <> null then begin
    E := V;
    AText := IntToStr(Trunc(E));
  end;  
end;

procedure TfbgPacVen.FormShow(Sender: TObject);
begin
  cm2DiasClick(cm1Semana);
end;

end.
