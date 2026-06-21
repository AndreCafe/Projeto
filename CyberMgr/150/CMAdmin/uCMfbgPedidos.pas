unit uCMfbgPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  lmdcctrl, lmdctrl, Db, nxdb, dxDBTLCl, dxGrClms, LMDCustomControl,
  {$ifdef Ver150}
  Variants,
  {$endif}
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, dxExEdtr, ExtCtrls;

const
  FiltroNenhum  = 0;
  FiltroCliente = 1;
  FiltroUsuario = 2;
  FiltroTel     = 3;

  F_Todas     = 0;
  F_Entregue  = 1;
  F_Pentregar = 2;
  F_Nentregar = 3;
  
type
  TfbgPedidos = class(TFrmBaseGrid)
    Tab: TnxTable;
    TabNumero: TAutoIncField;
    TabDiaHora: TDateTimeField;
    TabChamada: TIntegerField;
    TabNomeContato: TStringField;
    TabUsuario: TStringField;
    TabEntregador: TWordField;
    TabFormaPagto: TStringField;
    TabTotal: TCurrencyField;
    TabDesconto: TCurrencyField;
    TabVrLiq: TFloatField;
    TabObs: TMemoField;
    TabBaiEnt: TStringField;
    TabCidEnt: TStringField;
    TabUFEnt: TStringField;
    TabEndEnt: TStringField;
    dsTab: TDataSource;
    GridNumero: TdxDBGridMaskColumn;
    GridDiaHora: TdxDBGridDateColumn;
    GridNomeCli: TdxDBGridLookupColumn;
    GridUsuario: TdxDBGridMaskColumn;
    GridTotal: TdxDBGridCurrencyColumn;
    GridDesconto: TdxDBGridCurrencyColumn;
    GridVrLiq: TdxDBGridColumn;
    TabSerie: TStringField;
    TabTipo: TStringField;
    TabEntrada: TBooleanField;
    TabMovEst: TBooleanField;
    TabContato: TIntegerField;
    TabCancelado: TBooleanField;
    TabEmissor: TIntegerField;
    TabDtMovimentacao: TDateTimeField;
    GridSerie: TdxDBGridColumn;
    GridTipo: TdxDBGridColumn;
    TabEntregar: TBooleanField;
    TabSituacao: TStringField;
    TabCaixa: TIntegerField;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetFiltro(aTipoFiltro: Byte; aFiltro: Variant); override;
    procedure FiltraDados; override;
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;
    { Public declarations }

    procedure Novo; override;
    procedure Editar; override;
    procedure Apagar; override;

    procedure AplicaDireitosUsuario; override;

  end;

var
  fbgPedidos: TfbgPedidos;

implementation

uses cmIDRecursos, uCMFrmPri, uCMDados;

{$R *.DFM}

procedure TfbgPedidos.FiltraDados;
var
  FiltroBasico,
  FiltroEnt : string;

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
  Fim := Int(Fim) + 0.9999999;
  try
    if not Tab.Active then Tab.Open;
    Tab.IndexName := 'IEmissao';
    Tab.SetRange([Inicio], [Fim]);

    case TipoFiltro of
      FiltroCliente : FiltroBasico := '(Contato = ' + IntToStr(Filtro) + ')';
      FiltroUsuario : FiltroBasico := '(Usuario = ' + QuotedStr(Filtro) + ')';
      FiltroTel     : FiltroBasico := '(Telefone = ' + QuotedStr(Filtro) + ')';
    else
      FiltroBasico := '';
    end;

    with Tab do begin
      Filter := FiltroBasico;
      Filter := AddToFilter(Filter, FiltroEnt);
    end;

    Tab.Refresh;
    Tab.Filtered := True;
    Tab.Last;

    if Grid.DataSource = nil then
      Grid.Datasource := dsTab;
  finally
    Tab.EnableControls;
  end;
end;


procedure TfbgPedidos.Inicializar(DentroTab : Boolean; aTipoFiltro: Byte; aFiltro: Variant);
begin
  Grid.DataSource := nil;
  cmSubPeriodo.Visible := ivAlways;
  inherited;
end;

procedure TfbgPedidos.SetFiltro(aTipoFiltro: Byte; aFiltro: Variant);
begin
  gridNomeCli.Visible := (aTipoFiltro<>FiltroCliente);
  gridNomeCli.DisableCustomizing := (aTipoFiltro=FiltroCliente);
  gridUsuario.Visible := (aTipoFiltro<>FiltroUsuario);
  gridUsuario.DisableCustomizing := (aTipoFiltro=FiltroUsuario);
  inherited;
end;

procedure TfbgPedidos.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabVrLiq.Value    := TabTotal.Value - TabDesconto.Value;
end;

procedure TfbgPedidos.GridDblClick(Sender: TObject);
begin
  FrmPri.EditarME(TabEmissor.Value, TabSerie.Value, TabNumero.Value);
end;

procedure TfbgPedidos.Apagar;
begin
  inherited;
  Dados.ApagarME(TabEmissor.Value, TabSerie.Value, TabNumero.Value);
  Tab.Refresh;
end;

procedure TfbgPedidos.Editar;
begin
  inherited;
  FrmPri.EditarME(TabEmissor.Value, TabSerie.Value, TabNumero.Value);
end;

procedure TfbgPedidos.Novo;
begin
end;

procedure TfbgPedidos.AplicaDireitosUsuario;
begin
  inherited;
//  cmNovo.Enabled := Permitido(reMovEstoque, ta
end;

end.
