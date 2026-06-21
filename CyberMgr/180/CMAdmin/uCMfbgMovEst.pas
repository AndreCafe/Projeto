unit uCMfbgMovEst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCMFrmBaseGrid, dxExEdtr, dxDBTLCl, dxGrClms, dxDBCtrl,
  dxDBGrid, dxTL, DB, nxdb, Menus, am2000mainmenu, am2000, dxCntner,
  am2000menuitem, am2000utils, am2000popupmenu, ExtCtrls, dxBar,
  dxBarExtItems, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  cmClassesBase,
  LMDCustomSpeedButton, LMDSpeedButton, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type

  TfbgMovEst = class(TFrmBaseGrid)
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
    dsTab: TDataSource;
    GridDataMov: TdxDBGridDateColumn;
    GridQuant: TdxDBGridMaskColumn;
    GridTotal: TdxDBGridCurrencyColumn;
    GridEstoquePost: TdxDBGridMaskColumn;
    GridTipoTran: TdxDBGridImageColumn;
    TabQuantFator: TFloatField;
    TabEstoquePost: TFloatField;
    TabNomeContato: TStringField;
    GridContato: TdxDBGridLookupColumn;
    TabTotalFinal: TCurrencyField;
    GridUnitario: TdxDBGridMaskColumn;
    TabUnitarioFinal: TCurrencyField;
    procedure TabCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure Editar; override;
    { Public declarations }
  end;

var
  fbgMovEst: TfbgMovEst;

implementation

uses uCMDados, uCMFrmAcesso, uCMFrmME;

{$R *.dfm}

{ TfbgMovEst }

procedure TfbgMovEst.Editar;
begin
  with Dados do
  if tbAcesso.Locate('Numero', TabTransacao.Value, []) then
  if TabTipoTran.Value = ttAcessoVenda then
    TFrmAcesso.Create(Self).Editar(tbAcesso, 2)
  else
    TFrmME.Create(Self).Editar(TabTransacao.Value);
end;

procedure TfbgMovEst.FiltraDados;
begin
  inherited;
  Tab.DisableControls;
  Fim := Int(Fim) + 0.9999999;
  try
    if not Tab.Active then Tab.Open;

    Tab.IndexName := 'IProduto';
    Tab.SetRange([Filtro, Inicio], [Filtro, Fim]);
    Tab.Refresh;
    
    if Grid.DataSource = nil then
      Grid.Datasource := dsTab;
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbgMovEst.TabCalcFields(DataSet: TDataSet);
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

end.
