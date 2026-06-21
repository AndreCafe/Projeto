unit uCMfbgVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, Db, ffdb, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, lmdcctrl, lmdctrl, dxDBTLCl, dxGrClms, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

const
  FiltroNenhum  = 0;
  FiltroCliente = 1;
  FiltroUsuario = 2;
  FiltroProduto = 3;
  
type
  TfbgVendas = class(TFrmBaseGrid)
    Tab: TffTable;
    dsTab: TDataSource;
    TabNumSeq: TAutoIncField;
    TabEmissor: TIntegerField;
    TabSerie: TStringField;
    TabNumero: TIntegerField;
    TabProduto: TStringField;
    TabQuant: TFloatField;
    TabUnitario: TCurrencyField;
    TabTotal: TCurrencyField;
    TabItem: TWordField;
    TabDesconto: TCurrencyField;
    TabData: TDateTimeField;
    TabMovEst: TBooleanField;
    TabEntrada: TBooleanField;
    TabCancelado: TBooleanField;
    TabEstoqueAnt: TFloatField;
    TabTipoMov: TStringField;
    TabContato: TIntegerField;
    TabCaixa: TIntegerField;
    TabChaveUnica: TStringField;
    GridData: TdxDBGridDateColumn;
    GridTipoMov: TdxDBGridMaskColumn;
    GridSerie: TdxDBGridMaskColumn;
    GridNumero: TdxDBGridMaskColumn;
    GridProduto: TdxDBGridMaskColumn;
    GridQuant: TdxDBGridMaskColumn;
    GridUnitario: TdxDBGridCurrencyColumn;
    GridTotal: TdxDBGridCurrencyColumn;
    GridDesconto: TdxDBGridCurrencyColumn;
    GridCancelado: TdxDBGridCheckColumn;
    TabQuantFator: TFloatField;
    TabNomeProduto: TStringField;
    TabNomeCliente: TStringField;
    GridContato: TdxDBGridColumn;
    GridEstoque: TdxDBGridColumn;
    TabEstoque: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FSoVendas: Boolean;
  public
    { Public declarations }
    procedure SetFiltro(aTipoFiltro: Byte; aFiltro: Variant); override;
    procedure FiltraDados; override;
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;

    property SoVendas: Boolean
      read FSoVendas write FSoVendas;
  end;

var
  fbgVendas: TfbgVendas;

implementation

uses uCMFrmPri, uCMDados;

{$R *.DFM}

procedure TfbgVendas.FiltraDados;

function AddToFilter(Filter, NewSt: String): String;
begin
  if Trim(NewSt) > '' then
    if Filter > '' then
      Result := Filter + ' AND ' + NewSt
    else
      Result := NewSt
  else
    Result := Filter;
end;

begin
  Tab.DisableControls;
  try
    Fim := Int(Fim) + 0.9999999;
    if not Tab.Active then Tab.Open;
    case TipoFiltro of
      FiltroProduto : begin
        Tab.IndexName := 'IProd';
        Tab.SetRange([Filtro, Inicio], [Filtro, Fim]);
      end;
      FiltroCliente : begin
        Tab.IndexName := 'IContato';
        Tab.SetRange([Filtro, Inicio], [Filtro, Fim]);
      end;  
    end;  
    if dsTab.Dataset = nil then
      dsTab.Dataset := Tab;
  finally
    Tab.EnableControls;
  end;   
end;

procedure TfbgVendas.SetFiltro(aTipoFiltro: Byte; aFiltro: Variant);
begin
  GridContato.Visible := (aTipoFiltro<>FiltroCliente);
  GridContato.DisableCustomizing := (aTipoFiltro=FiltroCliente);

  GridProduto.Visible := (aTipoFiltro<>FiltroProduto);
  GridProduto.DisableCustomizing := (aTipoFiltro=FiltroProduto);

  inherited;
end;

procedure TfbgVendas.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant);
begin
  cmSubPeriodo.Visible := ivAlways;
  inherited;
end;

procedure TfbgVendas.FormCreate(Sender: TObject);
begin
  inherited;
  FSoVendas := False;
  dsTab.DataSet := nil;
end;

procedure TfbgVendas.GridDblClick(Sender: TObject);
begin
  inherited;
  FrmPri.EditarME(TabEmissor.Value, TabSerie.Value, TabNumero.Value);
end;

procedure TfbgVendas.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabChaveUnica.Value := TabSerie.AsString + TabNumero.AsString;
  if TabCancelado.Value then
    TabQuantFator.Value := 0
  else
  if TabEntrada.Value then
    TabQuantFator.Value := TabQuant.Value  
  else
    TabQuantFator.Value := -1 * TabQuant.Value;
  TabEstoque.Value := TabEstoqueAnt.Value + TabQuantFator.Value;    
end;

end.
