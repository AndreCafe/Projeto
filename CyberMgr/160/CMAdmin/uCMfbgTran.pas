unit uCMfbgTran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCMFrmBaseGrid, dxExEdtr, ExtCtrls, dxBar, dxBarExtItems,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, DB, cmClassesBase, nxdb, dxDBTLCl,
  dxGrClms, Menus, am2000utils, am2000popupmenu, am2000, SubMenu2000,
  am2000menubar, am2000menuitem, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, dxEditor,
  dxEdLib, am2000mainmenu;


const
  FiltroNenhum  = 0;
  FiltroCliente = 1;
  FiltroCaixa   = 2;
  FiltroCliDeb  = 3;

type
  TfbgTran = class(TFrmBaseGrid)
    Timer1: TTimer;
    dsTab: TDataSource;
    Tab: TnxTable;
    TabData: TDateTimeField;
    TabValorFinal: TCurrencyField;
    TabNomeTipoAcesso: TStringField;
    TabNumero: TAutoIncField;
    TabCaixaI: TIntegerField;
    TabCaixaF: TIntegerField;
    TabCaixaP: TIntegerField;
    TabTipoAcesso: TWordField;
    TabInicio: TDateTimeField;
    TabFim: TDateTimeField;
    TabDataPagto: TDateTimeField;
    TabContato: TIntegerField;
    TabNome: TStringField;
    TabMaquina: TWordField;
    TabTipo: TWordField;
    TabFuncI: TStringField;
    TabFuncF: TStringField;
    TabTempo: TDateTimeField;
    TabTempoCobrado: TDateTimeField;
    TabCredUsado: TIntegerField;
    TabCredAnterior: TIntegerField;
    TabDesconto: TCurrencyField;
    TabProdutos: TCurrencyField;
    TabValor: TCurrencyField;
    TabObs: TMemoField;
    TabIsento: TBooleanField;
    TabNaoUsarPacote: TBooleanField;
    TabCodPacote: TWordField;
    TabSinal: TCurrencyField;
    TabTransacaoVinculada: TIntegerField;
    TabValorFinalAcesso: TCurrencyField;
    TabDescontoProduto: TCurrencyField;
    TabNumDoc: TStringField;
    TabStatusPagto: TWordField;
    cmOrdenar: TdxBarCombo;
    GridData: TdxDBGridColumn;
    GridValorFinal: TdxDBGridColumn;
    GridTipoAcesso: TdxDBGridLookupColumn;
    GridNome: TdxDBGridMaskColumn;
    GridMaquina: TdxDBGridMaskColumn;
    GridTempo: TdxDBGridDateColumn;
    GridInicio: TdxDBGridTimeColumn;
    GridFim: TdxDBGridTimeColumn;
    GridPagto: TdxDBGridImageColumn;
    MenuBar20001: TMenuBar2000;
    MenuBar20002: TMenuBar2000;
    LMDSimplePanel4: TLMDSimplePanel;
    GridTipo: TdxDBGridImageColumn;
    LMDSimplePanel5: TLMDSimplePanel;
    panMostrar: TLMDSimplePanel;
    cmMostrar: TdxPickEdit;
    cmFiltroTipo: TLMDSpeedButton;
    LMDSimplePanel6: TLMDSimplePanel;
    TabObsSt: TStringField;
    GridObs: TdxDBGridColumn;
    lbQuant: TLMDLabel;
    GridDesconto: TdxDBGridCurrencyColumn;
    GridDescProd: TdxDBGridCurrencyColumn;
    GridNomeFuncF: TdxDBGridLookupColumn;
    TabNomeFuncF: TStringField;
    procedure cmMostrarChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmFiltroTipoClick(Sender: TObject);
    procedure GridPagtoCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure GridFilterChanged(Sender: TObject; ADataSet: TDataSet;
      const AFilterText: String);
    procedure cmOrdenarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Tipos : TArrayTipoTran;

    procedure NenhumTipo;
    procedure Editar; override;
    procedure Novo; override;
    procedure FiltraDados; override;
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;
  end;

var
  fbgTran: TfbgTran;

implementation

uses uCMDados, uCMFrmPri, uCMFrmAcesso, uCMFrmVendaPac, uCMFrmCredito,
  uCMFrmLancExtra, uCMFrmDeb, uCMFrmTipos;

{$R *.dfm}

procedure TfbgTran.FiltraDados;
var
  S: String;
  I: Integer;
  Filtrar : Boolean;
begin
  inherited;
  Tab.DisableControls;
  Fim := Int(Fim) + 0.9999999;
  try
    if not Tab.Active then Tab.Open;
    Tab.Filtered := False;
    GridTipoAcesso.Visible := Dados.CM.Config.VariosTiposAcesso;
    GridTipoAcesso.DisableCustomizing := not GridTipoAcesso.Visible;

    case TipoFiltro of
      FiltroCliente : begin
        Tab.IndexName := 'IContato';
        Tab.SetRange([Filtro, Inicio], [Filtro, Fim]);
        GridNome.Visible := False;
        GridNome.DisableCustomizing := True;
        btnPeriodo.Visible := True;
        panMostrar.Visible := False;
        cmFiltroTipo.Visible := True;
      end;
      FiltroCliDeb : begin
        Tab.IndexName := 'IDebito';
        Tab.SetRange([Filtro, spDebitado, 0], [Filtro, spDebitado, 0]);
        panMostrar.Visible := False;
        btnPeriodo.Visible := False;
        btnLayout.Visible := False;
        cmExportar.PaintStyle := psCaptionGlyph;
        cmRefresh.Visible := ivNever;
      end;
      FiltroCaixa : begin
        Tab.IndexName := 'ICaixaF';
        Tab.SetRange([Filtro], [Filtro]);
        panMostrar.Visible := False;
        btnPeriodo.Visible := False;
        btnLayout.Visible := False;
        cmImprimir.Visible := ivNever;
        cmExportar.PaintStyle := psCaptionGlyph;
        cmRefresh.Visible := ivNever;
      end
    else
      panMostrar.Visible := True;
      btnPeriodo.Visible := False;
      btnLayout.Visible := True;

      case cmMostrar.ItemIndex of
        0 : begin
          Tab.IndexName := 'IPagto';
          Tab.SetRange([spAguardaPagto], [spAguardaPagto]);
        end;
        1 : begin
            Tab.IndexName := 'ICaixaF';
            Tab.SetRange([NumAberto], [NumAberto]);
        end;
        2 : begin
            Tab.IndexName := 'IFim';
            Tab.SetRange([Date], [Date+0.9999999]);
        end;
        4 : begin
          Tab.IndexName := 'IPagto';
          Tab.SetRange([spDebitado, 0], [spDebitado, 0]);
        end;
      else
        btnPeriodo.Visible := True;
        Tab.IndexName := 'IFim';
        Tab.SetRange([Inicio], [Fim]);
      end;
    end;

    Tab.Refresh;

    Filtrar := False;
    for I := ttAcesso to ttSangriaCaixa do
    if Tipos[I] then 
      Filtrar := True;

    S := '';
    if Filtrar then begin
      for I := 0 to ttSangriaCaixa do
      if Tipos[I] then 
        if S>'' then
          S := S + ' OR (Tipo=' + IntToStr(I) +') '
        else
          S := ' (Tipo=' + IntToStr(I) +') ';
      if Grid.Filter.FilterText>'' then begin
        if S>'' then S := '('+S+') AND ';
        S := S+'('+Grid.Filter.FilterText+')';
      end;
      Tab.Filter := S;
    end else
      Tab.Filter := Grid.Filter.FilterText;
    Tab.Filtered := (Tab.Filter>'');
    Tab.Last;
    lbQuant.Caption := IntToStr(Tab.RecordCount) + ' itens';
    if Grid.DataSource = nil then
      Grid.Datasource := dsTab;
  finally
    Tab.EnableControls;
  end;
  Grid.GotoFirst;
end;

procedure TfbgTran.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant);
begin
  Grid.DataSource := nil;
  btnPeriodo.Visible := False;
  inherited;
end;

procedure TfbgTran.Editar;
begin
  if Tab.RecordCount > 0 then
  case TabTipo.Value of
    ttAcesso,
    ttManutencao,
    ttAcessoVenda : TFrmAcesso.Create(Self).Editar(Tab, 2);
    ttVendaPacote : TFrmVendaPac.Create(Self).Editar(Tab);
    ttCreditoTempo : TFrmCredito.Create(Self).Editar(Tab);
    ttSangriaCaixa,
    ttSuprimentoCaixa : TFrmLancExtra.Create(Self).Editar(Tab);
    ttEstVenda,
    ttEstCompra,
    ttEstEntrada,
    ttEstSaida    : FrmPri.EditarME(TabNumero.Value);
    ttPagtoDebito : TFrmDeb.Create(Self).Editar(TabNumero.Value);
    ttSinal :
    if Dados.tbAcesso.Locate('Numero', TabTransacaoVinculada.Value, []) then
      TFrmAcesso.Create(Self).Editar(Dados.tbAcesso, 0);
  end;
  Tab.Refresh;
end;

procedure TfbgTran.Novo;
begin
  TFrmVendaPac.Create(Self).Novo(Tab);
end;

procedure TfbgTran.cmMostrarChange(Sender: TObject);
begin
  inherited;
  if (cmMostrar.ItemIndex=3) then 
    cmSubPeriodo.Visible := ivAlways
  else
    cmSubPeriodo.Visible := ivNever;

  if (cmMostrar.ItemIndex>0) and (cmMostrar.ItemIndex<4) then
    cmOrdenar.Visible := ivAlways
  else
    cmOrdenar.Visible := ivNever;
        
  FiltraDados;
end;

procedure TfbgTran.cmOrdenarChange(Sender: TObject);
begin
  FiltraDados;
end;

procedure TfbgTran.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FiltraDados;
end;

procedure TfbgTran.NenhumTipo;
var I : Integer;
begin
  for I := 0 to ttSangriaCaixa do
    Tipos[I] := False;
end;

procedure TfbgTran.TabCalcFields(DataSet: TDataSet);
var S : String;
begin
  S := TabObs.Value;
  if Pos(#13, S) > 0 then
    S := Copy(S, 1, Pos(#13, S)-1);
  TabObsSt.Value := S;
  TabData.Value := TabInicio.Value;
  if TabTipo.Value in [ttSuprimentoCaixa, ttSangriaCaixa] then
    TabValorFinal.Value := TabValor.Value
  else
    TabValorFinal.Value := TabProdutos.Value + TabValorFinalAcesso.Value;     
end;

procedure TfbgTran.cmFiltroTipoClick(Sender: TObject);
begin
  TFrmTipos.Create(Self).Selecionar(@Tipos);
  FiltraDados;
end;

procedure TfbgTran.GridPagtoCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  V : Variant; 
begin
  inherited;
  V := ANode.Values[gridPagto.Index];
  if (not VarIsNull(V)) and (V=spDebitado) then begin
    AFont.Style := [fsBold];
    AFont.Color := clRed;
  end;  
end;

procedure TfbgTran.GridFilterChanged(Sender: TObject; ADataSet: TDataSet;
  const AFilterText: String);
begin
  FiltraDados;
end;


procedure TfbgTran.FormCreate(Sender: TObject);
var I : Integer;
begin
  inherited;
  panNovo.Visible := True;
  for I := ttAcesso to ttSangriaCaixa do
    Tipos[I] := False;

  if Dados.CM.Config.ModoPagtoAcesso<>mpgSomenteTransacoes then
    cmMostrar.ItemIndex := 1
  else
    cmMostrar.ItemIndex := 0;  
end;

end.
