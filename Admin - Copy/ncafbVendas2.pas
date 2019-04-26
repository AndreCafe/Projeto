unit ncafbVendas2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxBar, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, ExtCtrls, uParentedPanel, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox, cxMaskEdit,
  cxCalendar, cxTimeEdit, cxTextEdit, cxCurrencyEdit, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, nxdb, cxNavigator, Menus, dxBarExtItems, StdCtrls, cxButtons, OoMisc,
  AdPort, cxPropertiesStore, dxBarApplicationMenu, dxRibbon, cxCheckBox,
  cxBarEditItem;

type
  TfbVendas2 = class(TFrmBase)
    cmCancelar: TdxBarLargeButton;
    dsTab: TDataSource;
    Tab: TnxTable;
    TabID: TAutoIncField;
    TabDataHora: TDateTimeField;
    TabCliente: TIntegerField;
    TabFunc: TStringField;
    TabTotal: TCurrencyField;
    TabDesconto: TCurrencyField;
    TabPago: TCurrencyField;
    TabObs: TMemoField;
    TabCancelado: TBooleanField;
    TabCanceladoPor: TStringField;
    TabCanceladoEm: TDateTimeField;
    TabCaixa: TIntegerField;
    TabMaq: TWordField;
    TabTotalFinal: TCurrencyField;
    TabNomeCliente: TStringField;
    TabTipo: TWordField;
    TabSessao: TIntegerField;
    TabDescr: TStringField;
    TabDebito: TCurrencyField;
    TabQtdTempo: TFloatField;
    TabCredValor: TBooleanField;
    TabFidResgate: TBooleanField;
    TabImg: TSmallintField;
    TabTotLiq: TCurrencyField;
    TabplusID: TGuidField;
    TabplusTran: TBooleanField;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVImg: TcxGridDBColumn;
    TVID: TcxGridDBColumn;
    TVMaquina: TcxGridDBColumn;
    TVData: TcxGridDBColumn;
    TVInicio: TcxGridDBColumn;
    TVTipo: TcxGridDBColumn;
    TVDescr: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVTotal: TcxGridDBColumn;
    TVDesconto: TcxGridDBColumn;
    TVTotalFinal: TcxGridDBColumn;
    TVPago: TcxGridDBColumn;
    TVDebito: TcxGridDBColumn;
    TVNomeFuncI: TcxGridDBColumn;
    TVSessao: TcxGridDBColumn;
    TVCancelado: TcxGridDBColumn;
    TVCanceladoPor: TcxGridDBColumn;
    TVCanceladoEm: TcxGridDBColumn;
    TVObs: TcxGridDBColumn;
    GL: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cmImpRecibo: TdxBarLargeButton;
    dxBarButton3: TdxBarButton;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    cxPropertiesStore1: TcxPropertiesStore;
    dxBarLargeButton1: TdxBarLargeButton;
    BarMgrBar2: TdxBar;
    cmFiltro: TdxBarSubItem;
    cmSoCaixaAtual: TdxBarButton;
    cmTodosCaixas: TdxBarButton;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVTotalGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVDebitoStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure cmImpReciboClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure cmCfgClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmSoCaixaAtualChange(Sender: TObject);
    procedure cmSoCaixaAtualClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SalvaFiltro;
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
    
    { Public declarations }
  end;

var
  fbVendas2: TfbVendas2;

implementation

uses ncaFrmPri, ncClassesBase, ncIDRecursos, ncaDM, ncaFrmConfigRec, ncaDMComp,
  ncaFrmConfigQuickCad, ncaFrmConfigCodProdutoDuplicado,
  ncaFrmConfigVendaProdSemSaldo, ncaFrmOpcoes, ufmImagens, ncaFrmVenda;

{$R *.dfm}

{ TfbVendas2 }

procedure TfbVendas2.AtualizaDireitos;
begin
  inherited;
  cmCancelar.Enabled := Permitido(daTraCancelar) and (not Tab.IsEmpty);
end;

procedure TfbVendas2.cmCancelarClick(Sender: TObject);
begin
  inherited;
  if Tab.IsEmpty or TabCancelado.Value then Exit;
  if TabplusID.Value>'' then 
    raise exception.Create('Não é permitido cancelar uma Venda Plus');
  if SimNao('Deseja realmente cancelar a venda selecionada?') then
  begin
    Dados.CM.CancelaTran(TabID.Value, Dados.CM.Username);
    Tab.Refresh;
{    if gConfig.AutoObsAoCancelar then
      cmObsClick(cmCancelar);}
  end;
end;

procedure TfbVendas2.cmCfgClick(Sender: TObject);
begin
  inherited;
  TFrmOpcoes.Create(Self).Editar('Opções para Vendas', [TFrmConfigRec, TFrmConfigQuickCad, TFrmConfigCodProdutoDuplicado, TFrmConfigVendaProdSemSaldo], True);
end;

procedure TfbVendas2.cmEditarClick(Sender: TObject);
begin
  inherited;
  if Tab.IsEmpty then Exit;
  Dados.EditarTran(TabID.Value);
  Tab.Refresh;
end;

procedure TfbVendas2.cmNovoClick(Sender: TObject);
begin
  inherited;
  Dados.NovoMovEst(trEstVenda, 0);
  Tab.Refresh;
end;

procedure TfbVendas2.cmSoCaixaAtualChange(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbVendas2.cmSoCaixaAtualClick(Sender: TObject);
begin
  inherited;
  SalvaFiltro;
  FiltraDados;
end;

procedure TfbVendas2.dxBarLargeButton1Click(Sender: TObject);
var
  cancelou : boolean;
begin
  inherited;
  repeat
    cancelou := not Dados.NovaVenda(0, False, tamTelaPDV1);
    Tab.Refresh;
  until cancelou;
end;

class function TfbVendas2.Descricao: String;
begin
  Result := 'Vendas';
end;

procedure TfbVendas2.cmImpReciboClick(Sender: TObject);
begin
  inherited;

  if gConfig.RecImprimir=0 then begin
    if not Dados.CM.UA.Admin then begin
      ShowMessage('Ainda não foi feito a configuração da emissão de recibos. Somente um usuário com direitos de administrador é que poderá configurar.');
      Exit;
    end;
    if SimNao('Essa é a primeira vez que você imprime recibos. É necessário ajustar os parâmetros para emissão de recibos. Deseja fazer isso agora?') then
      TFrmConfigRec.Create(Self).Editar;
  end;
  if gConfig.RecImprimir=0 then Exit;
  if Tab.RecordCount=0 then 
    ShowMessage('Você ainda não vendeu nenhum produto por isso não há recibos para imprimir.') else
    dmComp.Imprime(TabID.Value);
end;

procedure TfbVendas2.FiltraDados;
var S: String;
begin
  LockWindowUpdate(panPri.Parent.Handle);
  try
    if cmSoCaixaAtual.Down then
      cmFiltro.Caption := cmSoCaixaAtual.Caption else
      cmFiltro.Caption := cmTodosCaixas.Caption;
    Tab.DisableControls;
    try
      Tab.IndexName := 'ICaixaID';
      S := 'Tipo=' + IntToStr(trEstVenda);
      if TV.DataController.Filter.FilterText>'' then begin
        if S>'' then S := '('+S+') AND ';
        S := S+'('+TV.DataController.Filter.FilterText+')';
      end;  
      Tab.Filter := S;
      Tab.Filtered := True;
      if not Tab.Active then 
        Tab.Active := True;
      if cmSoCaixaAtual.Down then begin
        if NumAberto>0 then
           Tab.SetRange([NumAberto], [NumAberto]) else
           Tab.SetRange([High(Cardinal)], [High(Cardinal)]);
      end else
        Tab.CancelRange;
      Tab.Refresh;   
    finally
      Tab.EnableControls;
    end;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TfbVendas2.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  cmTodosCaixas.Down := (slConfig.Values[Self.Name+'.cmTodosCaixas']='1');
end;

procedure TfbVendas2.SalvaFiltro;
begin
  inherited;
  if cmTodosCaixas.Down then 
    slConfig.Values[Self.Name+'.cmTodosCaixas']:='1' else
    slConfig.Values[Self.Name+'.cmTodosCaixas']:='0';
  ncaDM.SaveConfig;
end;

procedure TfbVendas2.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabTotalFinal.Value := TabTotal.Value - TabDesconto.Value;
end;

procedure TfbVendas2.TVDebitoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with AViewInfo do 
  if (VarIsFloat(Value)) and (Value>0.009) then begin
    ACanvas.Brush.Color := clRed;
    ACanvas.Font.Color := clWhite;
  end;
end;

procedure TfbVendas2.TVDebitoStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[TVCancelado.Index];
  if (V<>null) and (V=True) then
    AStyle := cxStyle2;
end;

procedure TfbVendas2.TVTotalGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if (AText='R$ 0') or (AText='R$ 0,00') then AText := '';
end;

end.
