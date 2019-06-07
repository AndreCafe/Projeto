unit ncafbVendas2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, LMDGraph,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxBar, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox, cxMaskEdit,
  cxCalendar, cxTimeEdit, cxTextEdit, cxCurrencyEdit, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, nxdb, cxNavigator, Menus, dxBarExtItems, StdCtrls, cxButtons, OoMisc,
  AdPort, cxPropertiesStore, dxBarApplicationMenu, dxRibbon, cxCheckBox,
  cxBarEditItem, LMDControl, LMDCustomControl, LMDCustomPanel, ncMovEst, ncEspecie,
  LMDCustomBevelPanel, LMDSimplePanel, dxPScxPivotGridLnk, ncaFrmPagEspecie,
  cxPC, dxDockControl, dxDockPanel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxSpinEdit, ncaFramePagamento, LMDCustomScrollBox,
  LMDScrollBox, LMDSplt, cxContainer, cxLabel, cxPCdxBarPopupMenu,
  dxBarBuiltInMenu, uParentedPanel;

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
    cmVendaCaixa: TdxBarLargeButton;
    cmFiltro: TdxBarSubItem;
    cmSoCaixaAtual: TdxBarButton;
    cmTodosCaixas: TdxBarButton;
    TabDebitoAnt: TCurrencyField;
    TabDebitoPago: TCurrencyField;
    TabCreditoAnt: TCurrencyField;
    TabCredito: TCurrencyField;
    TabCreditoUsado: TCurrencyField;
    TabTroco: TCurrencyField;
    tbME: TnxTable;
    tbMEID: TAutoIncField;
    tbMETran: TIntegerField;
    tbMEProduto: TIntegerField;
    tbMEQuant: TFloatField;
    tbMEUnitario: TCurrencyField;
    tbMETotal: TCurrencyField;
    tbMECustoU: TCurrencyField;
    tbMEItem: TWordField;
    tbMEDesconto: TCurrencyField;
    tbMEPago: TCurrencyField;
    tbMEPagoPost: TCurrencyField;
    tbMEDescPost: TCurrencyField;
    tbMEDataHora: TDateTimeField;
    tbMEEntrada: TBooleanField;
    tbMECancelado: TBooleanField;
    tbMEEstoqueAnt: TFloatField;
    tbMECliente: TIntegerField;
    tbMECaixa: TIntegerField;
    tbMECategoria: TStringField;
    tbMENaoControlaEstoque: TBooleanField;
    tbMEITran: TIntegerField;
    tbMETipoTran: TWordField;
    tbMESessao: TIntegerField;
    tbMEplusID: TGuidField;
    tbMEplusTran: TBooleanField;
    tbMEPermSemEstoque: TBooleanField;
    tbMEFidResgate: TBooleanField;
    tbMEFidPontos: TFloatField;
    tbMERecVer: TIntegerField;
    cxStyle6: TcxStyle;
    dckMgr: TdxDockingManager;
    cxStyle7: TcxStyle;
    dxBarStatic1: TdxBarStatic;
    cxStyle8: TcxStyle;
    tPend: TnxTable;
    dsPend: TDataSource;
    tPendID: TAutoIncField;
    tPendDataHora: TDateTimeField;
    tPendCliente: TIntegerField;
    tPendTipo: TWordField;
    tPendFunc: TStringField;
    tPendTotal: TCurrencyField;
    tPendDesconto: TCurrencyField;
    tPendTotLiq: TCurrencyField;
    tPendPago: TCurrencyField;
    tPendDebitoAnt: TCurrencyField;
    tPendDebito: TCurrencyField;
    tPendDebitoPago: TCurrencyField;
    tPendCreditoAnt: TCurrencyField;
    tPendCredito: TCurrencyField;
    tPendCreditoUsado: TCurrencyField;
    tPendTroco: TCurrencyField;
    tPendObs: TnxMemoField;
    tPendCancelado: TBooleanField;
    tPendCanceladoPor: TStringField;
    tPendCanceladoEm: TDateTimeField;
    tPendCaixa: TIntegerField;
    tPendMaq: TWordField;
    tPendNomeCliente: TStringField;
    tPendSessao: TIntegerField;
    tPendDescr: TStringField;
    tPendQtdTempo: TFloatField;
    tPendCredValor: TBooleanField;
    tPendFidResgate: TBooleanField;
    tPendplusID: TGuidField;
    tPendplusTran: TBooleanField;
    tPendPagFunc: TStringField;
    tPendPagPend: TBooleanField;
    tPendTotalFinal: TCurrencyField;
    tPendNomeFunc: TStringField;
    Paginas: TcxPageControl;
    tsVendas: TcxTabSheet;
    tsPend: TcxTabSheet;
    gridPend: TcxGrid;
    tvPend: TcxGridDBTableView;
    tvPendID: TcxGridDBColumn;
    tvPendDataHora: TcxGridDBColumn;
    tvPendDescr: TcxGridDBColumn;
    tvPendNomeCliente: TcxGridDBColumn;
    tvPendTotal: TcxGridDBColumn;
    tvPendDesconto: TcxGridDBColumn;
    tvPendTotalFinal: TcxGridDBColumn;
    tvPendFunc: TcxGridDBColumn;
    tvPendObs: TcxGridDBColumn;
    glPend: TcxGridLevel;
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
    TVCredUsado: TcxGridDBColumn;
    TVDebito: TcxGridDBColumn;
    TVTroco: TcxGridDBColumn;
    TVNomeFuncI: TcxGridDBColumn;
    TVSessao: TcxGridDBColumn;
    TVCancelado: TcxGridDBColumn;
    TVCanceladoPor: TcxGridDBColumn;
    TVCanceladoEm: TcxGridDBColumn;
    TVObs: TcxGridDBColumn;
    TVCredito: TcxGridDBColumn;
    GL: TcxGridLevel;
    dsPag: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dpPag: TdxDockPanel;
    BarMgrBar2: TdxBar;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cmPagamento: TdxBarLargeButton;
    TVPagPend: TcxGridDBColumn;
    TabPagFunc: TStringField;
    TabPagPend: TBooleanField;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    cbFecharAuto: TcxCheckBox;
    tPendDescPerc: TFloatField;
    tPendDescPorPerc: TBooleanField;
    tPendCaixaPag: TIntegerField;
    TabDescPerc: TFloatField;
    TabDescPorPerc: TBooleanField;
    TabCaixaPag: TIntegerField;
    procedure cmNovoClick(Sender: TObject);
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
    procedure cmVendaCaixaClick(Sender: TObject);
    procedure cmCfgClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmSoCaixaAtualChange(Sender: TObject);
    procedure cmSoCaixaAtualClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TVBPagamentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tPendCalcFields(DataSet: TDataSet);
    procedure tvPendTotalFinalCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure PaginasDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure cmEditarClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure TVPagoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvPendCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure TVPagoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmPagamentoClick(Sender: TObject);
    procedure cbFecharAutoClick(Sender: TObject);
  private
    FFrmPag : TFramePagamento;
    FPagEsp : TncPagEspecies;
    FLastCxFiltro : Integer;
    { Private declarations }

    procedure RefreshPagEsp;
    procedure RefreshPend;
  public
    procedure SalvaFiltro;
    procedure AtualizaPanPag(aLeft: Integer);
    procedure OnClicouPagamento(Sender: TObject);
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
    
    { Public declarations }
  end;

var
  fbVendas2: TfbVendas2;

resourcestring
  rsAguardandoPagamento = 'Aguardando Pagamento';  
  rsSemVendasImpRec = 'Você ainda não vendeu nenhum produto por isso não há recibos para imprimir.';
  rsPendente = 'Pendente';

implementation

uses ncaFrmPri, ncClassesBase, ncIDRecursos, ncaDM, ncaFrmConfigRec, ncaDMComp,
  ncaFrmConfigQuickCad, ncaFrmConfigCodProdutoDuplicado,
  ncaFrmConfigVendaProdSemSaldo, ncaFrmOpcoes, ufmImagens, ncaFrmVenda,
  ncaFrmConfigEspecies, ncDMServ, cxGridCommon, ncaFrmConfigCodBarBal,
  ncaFrmConfigComissao;

{$R *.dfm}

{ TfbVendas2 }

procedure TfbVendas2.AtualizaDireitos;
begin
  inherited;
  RefreshPend;

  
  cmCancelar.Enabled := Permitido(daTraCancelar) and (not Tab.IsEmpty);
  cmVendaCaixa.Enabled := Permitido(daVendaCaixa);
  cmNovo.Enabled := Permitido(daVendaBalcao);
  
  if cmSoCaixaAtual.Down and (FLastCxFiltro<>NumAberto) then 
    FiltraDados;
end;

procedure TfbVendas2.AtualizaPanPag(aLeft: Integer);
begin
{  panPag.Left := aLeft;
  panPag.Height := Grid.Height - panPag.Top + Grid.Top - 17;;
  panPag.Width := TVBPagamento.Width;}
end;

procedure TfbVendas2.cbFecharAutoClick(Sender: TObject);
begin
  inherited;
  SalvaFiltro;
  RefreshPend;
end;

procedure TfbVendas2.cmCancelarClick(Sender: TObject);
begin
  inherited;
  if Paginas.ActivePage=tsVendas then begin
    if Tab.IsEmpty or TabCancelado.Value then Exit;
    if TabplusID.Value>'' then 
      raise exception.Create('Não é permitido cancelar uma Venda Plus');
  end else 
    if tPend.IsEmpty or tPendCancelado.Value then Exit;

  if SimNao('Deseja realmente cancelar a venda selecionada?') then
  begin
    if Paginas.ActivePage=tsVendas then
      Dados.CM.CancelaTran(TabID.Value, Dados.CM.Username) else
      Dados.CM.CancelaTran(tPendID.Value, Dados.CM.Username);
      
    RefreshPend;
    Tab.Refresh;
    
{    if gConfig.AutoObsAoCancelar then
      cmObsClick(cmCancelar);}
  end;
end;

procedure TfbVendas2.cmCfgClick(Sender: TObject);
begin
  inherited;
  TFrmOpcoes.Create(Self).Editar('Opções para Vendas', [TFrmConfigRec, TFrmConfigQuickCad, TFrmConfigCodProdutoDuplicado, TFrmConfigVendaProdSemSaldo, TFrmConfigCodBarBal, TFrmConfigComissao], True);
end;

procedure TfbVendas2.cmEditarClick(Sender: TObject);
begin
  inherited;
  if Paginas.ActivePageIndex=0 then begin
    if Tab.IsEmpty then Exit;
    Dados.EditarTran(TabID.Value);
  end else begin
    if tPend.IsEmpty then Exit;
    Dados.EditarTran(tPendID.Value);
  end;
  Tab.Refresh;  
  RefreshPend;
  RefreshPagEsp;
end;

procedure TfbVendas2.cmNovoClick(Sender: TObject);
begin
  inherited;
  Dados.NovaVenda(0, True, False, tamTelaPDV1);
  RefreshPend;
  Tab.Refresh;
end;

procedure TfbVendas2.cmPagamentoClick(Sender: TObject);
begin
  inherited;
  if not tPend.IsEmpty then begin
    Dados.EditarPagamento(tPendID.Value);
    RefreshPend;
  end;
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

procedure TfbVendas2.cmVendaCaixaClick(Sender: TObject);
var
  cancelou : boolean;
begin
  inherited;
  repeat
    cancelou := not Dados.NovaVenda(0, False, False, tamTelaPDV1);
    Tab.Refresh;
  until cancelou;
  RefreshPend;
end;

procedure TfbVendas2.PaginasChange(Sender: TObject);
begin
  inherited;
  if not Tab.Active then Exit;
  
  if Paginas.ActivePageIndex=0 then begin
    grid.SetFocus;
    Tab.Refresh;
    RefreshPagEsp;
  end else
    gridPend.SetFocus;
end;

procedure TfbVendas2.PaginasDrawTabEx(AControl: TcxCustomTabControl;
  ATab: TcxTab; Font: TFont);
begin
  inherited;
  if aTab.Index=1 then
  if not tPend.IsEmpty then begin
    Font.Color := clBlue;
//    Font.Style := [fsBold];
  end;
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
  if Paginas.ActivePageIndex=0 then begin
    if Tab.RecordCount=0 then
      ShowMessage(rsSemVendasImpRec) else
      dmComp.Imprime(TabID.Value);
  end else begin
    if tPend.RecordCount=0 then
      ShowMessage(rsSemVendasImpRec) else
      dmComp.Imprime(tPendID.Value);
  end;
end;

procedure TfbVendas2.FiltraDados;
var S: String;
begin
  LockWindowUpdate(panPri.Parent.Handle);
  try
    if cmSoCaixaAtual.Down then
      cmFiltro.Caption := cmSoCaixaAtual.Caption else
      cmFiltro.Caption := cmTodosCaixas.Caption;
    tsVendas.Caption := cmFiltro.Caption;  
    if not tPend.Active then
      tPend.Open;
    tPend.SetRange([True], [True]);
    RefreshPend;
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
        FLastCxFiltro := NumAberto;
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
  FLastCxFiltro := 0;
  Paginas.ActivePageIndex := 0;
  cmTodosCaixas.Down := (slConfig.Values[Self.Name+'.cmTodosCaixas']='1');
  cbFecharAuto.Checked := (slConfig.Values[Self.Name+'.cbFecharAuto']<>'0');
  dsPag.Visible := False;
  dpPag.Visible := False;
  FFrmPag := TFramePagamento.Create(Self);
  FFrmPag.panPri.Parent := dpPag;
  FFrmPag.OnClicouPagamento := OnClicouPagamento;
{  FFrmPag.panPri.AlignWithMargins := False;
  FFrmPag.panPri.Bevel.StandardStyle := lsNone;}
  FPagEsp := TncPagEspecies.Create;
end;

procedure TfbVendas2.OnClicouPagamento(Sender: TObject);
begin
  if Paginas.ActivePageIndex=0 then begin
    if not Tab.IsEmpty then begin
      Dados.EditarPagamento(TabID.Value);
      Tab.Refresh;
    end;
  end else
  if not tPend.IsEmpty then 
    Dados.EditarPagamento(tPendID.Value);
  Tab.Refresh;
  RefreshPagEsp;
  RefreshPend;
  if Paginas.ActivePageIndex=0 then
    Grid.SetFocus else
    gridPend.SetFocus;
end;

procedure TfbVendas2.RefreshPagEsp;
begin
  if not Tab.IsEmpty then begin
    dpPag.Visible := True;
    dsPag.Visible := True;
    DM.LoadPagEsp(TabID.Value, FPagEsp);
    FFrmPag.Load(FPagEsp, TabTotal.Value, TabDesconto.Value, TabTroco.Value, TabCreditoUsado.Value, TabCredito.Value);
  end else begin
    dpPag.Visible := False;
    dsPag.Visible := False;
  end;
  
//  FFrmPag.LoadData(FPagEsp, TabTotal.Value, TabCreditoUsado.Value, 0, TabDesconto.Value);
  
end;

procedure TfbVendas2.RefreshPend;
begin
  if not tPend.Active then Exit;
  tPend.Refresh;
  if tPend.IsEmpty then begin
    tsPend.Caption := rsAguardandoPagamento;
    if cbFecharAuto.Checked then begin
      Paginas.HideTabs := True;
      Paginas.ActivePageIndex := 0;
    end;
  end else begin
    Paginas.HideTabs := False;
    tsPend.Caption := IntToStr(tPend.RecordCount) + ' ' + rsAguardandoPagamento;
  end;
    
{  if panPend.Visible then
    Grid.RootLevelOptions.DetailTabsPosition := dtpTop else
    Grid.RootLevelOptions.DetailTabsPosition := dtpNone;}
end;

procedure TfbVendas2.SalvaFiltro;
begin
  inherited;
  if cmTodosCaixas.Down then 
    slConfig.Values[Self.Name+'.cmTodosCaixas']:='1' else
    slConfig.Values[Self.Name+'.cmTodosCaixas']:='0';
  slConfig.Values[Self.Name+'.cbFecharAuto'] := IntToStr(Byte(cbFecharAuto.Checked));
  ncaDM.SaveConfig;
end;

procedure TfbVendas2.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabTotalFinal.Value := TabTotal.Value - TabDesconto.Value;
end;

procedure TfbVendas2.tPendCalcFields(DataSet: TDataSet);
begin
  inherited;
  tPendTotalFinal.Value := tPendTotal.Value - tPendDesconto.Value;
end;

procedure TfbVendas2.TVBPagamentoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  AtualizaPanPag(AViewInfo.Bounds.Left);
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

procedure TfbVendas2.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  RefreshPagEsp;
end;

function ValueIsZero(V: Variant): Boolean;
begin
  Result := VarIsNull(V) or (V=0);
end;

procedure TfbVendas2.TVPagoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  inherited;
  V := AviewInfo.GridRecord.Values[tvPagPend.Index];

  if (not VarIsNull(V)) and (V=True) then begin
    ACanvas.Brush.Color := clBlue;
    ACanvas.Font.Color := clWhite;
  end;
end;

procedure TfbVendas2.TVPagoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  inherited;
  V := ARecord.Values[TVPagPend.Index];
  if (not VarIsNull(V)) and (V=True) then 
    AText := rsPendente 
  else
  if ValueisZero(ARecord.Values[Sender.Index]) then
    AText := '';
end;

procedure TfbVendas2.tvPendCustomDrawColumnHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var
  I: Integer;
begin

  ACanvas.Brush.Color := clWhite;
  ACanvas.FillRect(AViewInfo.Bounds);
  with AViewInfo, Bounds do
  begin
    ACanvas.Brush.Color := $00F4F4F4;

{    if bLeft in ABorders then

      ACanvas.FillRect(Rect(Left, Top, Left + 1, Bottom));

    if bTop in ABorders then

      ACanvas.FillRect(Rect(Left, Top, Right, Top + 1));}

    ACanvas.FillRect(Rect(Right - 1, Top, Right, Bottom));

//    ACanvas.FillRect(Rect(Left, Bottom - 1, Right, Bottom));

    ACanvas.Brush.Color := clWhite;

    ACanvas.DrawTexT(Column.Caption, Rect(Left+2, Top+2, Right-2, Bottom-2), AlignmentHorz, AlignmentVert, Multiline, False);
  

     for I := 0 to AreaViewInfoCount - 1 do

    begin

      if AreaViewInfos[I] is TcxGridColumnHeaderFilterButtonViewInfo then
      if TMYcxGridColumnHeaderFilterButtonViewInfo(AreaViewInfos[I]).GetVisible then

        LookAndFeelPainter.DrawFilterDropDownButton(ACanvas, AreaViewInfos[I].Bounds,

        GridCellStateToButtonState(AreaViewInfos[I].State), TcxGridColumnHeaderFilterButtonViewInfo(AreaViewInfos[I]).Active);

    end;
  end;
  ADone := True;

end;

procedure TfbVendas2.tvPendTotalFinalCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  ACanvas.Font.Style := [fsBold];
end;

procedure TfbVendas2.TVTotalGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ValueisZero(ARecord.Values[Sender.Index]) then
    AText := '';
end;



end.
