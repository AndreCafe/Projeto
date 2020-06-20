unit ncaFrmVendaProd;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxCurrencyEdit, cxImageComboBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxTextEdit,
  cxDBLookupComboBox, cxMaskEdit, ExtCtrls, nxdb, kbmMemTable, dxBarExtItems,
  dxBar, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxMemo,
  cxDBEdit, cxVGrid, cxDBVGrid, cxInplaceContainer, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxRadioGroup, 
  ncMovEst,
  ncClassesBase,
  Menus, StdCtrls, cxLabel, cxCheckBox, cxSpinEdit, cxLookAndFeels,
  cxLookAndFeelPainters, ncaFrmTotal, cxNavigator, ncEspecie;

type
  TFrmVendaProd = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    Timer1: TTimer;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    panProd: TLMDSimplePanel;
    MT: TkbmMemTable;
    MTProduto: TIntegerField;
    MTCodigo: TStringField;
    MTDescr: TStringField;
    MTUnitario: TCurrencyField;
    MTQuant: TFloatField;
    DS: TDataSource;
    MTUnitProd: TCurrencyField;
    MTPodeAlterar: TBooleanField;
    tProd: TnxTable;
    tProdID: TAutoIncField;
    tProdCodigo: TStringField;
    tProdDescricao: TStringField;
    tProdUnid: TStringField;
    tProdPreco: TCurrencyField;
    tProdObs: TMemoField;
    tProdImagem: TGraphicField;
    tProdCategoria: TStringField;
    tProdSubCateg: TStringField;
    tProdEstoqueAtual: TFloatField;
    tProdCustoUnitario: TCurrencyField;
    tProdEstoqueACE: TFloatField;
    tProdEstoqueACS: TFloatField;
    tProdPodeAlterarPreco: TBooleanField;
    tProdNaoControlaEstoque: TBooleanField;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    MainMenu1: TMainMenu;
    dsProd: TDataSource;
    TVCodigo: TcxGridDBColumn;
    TVPreco: TcxGridDBColumn;
    TVDescricao: TcxGridDBColumn;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    MTID: TIntegerField;
    MTTran: TIntegerField;
    MTCustoU: TCurrencyField;
    MTItem: TWordField;
    MTDataHora: TDateTimeField;
    MTSessao: TIntegerField;
    MTTipoTran: TWordField;
    MTCategoria: TStringField;
    MTCliente: TIntegerField;
    MTITran: TIntegerField;
    MTNaoControlaEstoque: TBooleanField;
    MTCancelado: TBooleanField;
    MTEstoqueAnt: TFloatField;
    MTCaixa: TIntegerField;
    MTEntrada: TBooleanField;
    LMDSimplePanel2: TLMDSimplePanel;
    rgDescr: TcxRadioButton;
    rgCodigo: TcxRadioButton;
    cmRecibo: TdxBarControlContainerItem;
    TVPontos: TcxGridDBColumn;
    tProdFidelidade: TBooleanField;
    tProdFidPontos: TIntegerField;
    MTFidPontosU: TIntegerField;
    MTFidPontos: TFloatField;
    MTFidResgate: TBooleanField;
    TVObs: TcxGridDBColumn;
    tProdplus: TBooleanField;
    panTot: TLMDSimplePanel;
    cbRecibo: TcxCheckBox;
    panQtdUnit: TLMDSimplePanel;
    cxLabel4: TcxLabel;
    edQtd: TcxCurrencyEdit;
    panUnitario: TLMDSimplePanel;
    edUnitario: TcxCurrencyEdit;
    lbUnit: TcxLabel;
    cxLabel1: TcxLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    MTTotal: TCurrencyField;
    MTDesconto: TCurrencyField;
    MTPago: TCurrencyField;
    cxStyle7: TcxStyle;
    MTPermSemEstoque: TBooleanField;
    tProdPrecoAuto: TBooleanField;
    tProdMargem: TFloatField;
    tProdFornecedor: TIntegerField;
    tProdPermiteVendaFracionada: TBooleanField;
    tProdEstoqueMin: TFloatField;
    tProdEstoqueMax: TFloatField;
    tProdAbaixoMin: TBooleanField;
    tProdAbaixoMinDesde: TDateTimeField;
    tProdEstoqueRepor: TFloatField;
    tProdplusURL: TnxMemoField;
    tProdplusCodParceiro: TStringField;
    tProdplusCodProduto: TStringField;
    tProdAtivo: TBooleanField;
    tProdmd5Imagem: TStringField;
    tProdlastProdModif: TDateTimeField;
    tProdCadastroRapido: TBooleanField;
    tProdIncluidoEm: TDateTimeField;
    tProdRecVer: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure MTCalcFields(DataSet: TDataSet);
    procedure VGCodigoEditPropertiesInitPopup(Sender: TObject);
    procedure VGEdited(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure FormShow(Sender: TObject);
    procedure TVCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TVMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MTAfterInsert(DataSet: TDataSet);
    procedure rgDescrClick(Sender: TObject);
    procedure rgCodigoClick(Sender: TObject);
    procedure VGDescontoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TVColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure TVColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure edQtdPropertiesChange(Sender: TObject);
    procedure edUnitarioPropertiesChange(Sender: TObject);
    procedure cxLabel4Click(Sender: TObject);
    procedure lbUnitClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dxBarButton1Click(Sender: TObject);
  private
    ProdAnt : Integer;
    FIME    : TncItemMovEst;
    FRes    : Boolean;
    FNovo   : Boolean;
    FLoading: Boolean;
    FSalvarLay : Boolean;
    FTot    : TFrmTotal;
    { Private declarations }
    procedure AjustaValorPago;
    procedure MudouProduto;
    procedure AjustaOrdem(aSalvaOrdem: Boolean = False);
    function FidResgate: Boolean;
    procedure LoadLay(aVenda: Boolean);
    procedure SaveLay(aVenda: Boolean);
  public
    { Public declarations }
    function Editar(aIME: TncItemMovEst; aNovo, aEditaPag, aPodeSalvar: Boolean): Boolean;
    
  end;

var
  FrmVendaProd: TFrmVendaProd;

implementation

uses ncaDM, ncIDRecursos, ncaFrmPri, ufmImagens;

// START resource string wizard section
resourcestring
  SValorPagoNãoPodeSerMaiorQueOTota = 'Valor pago não pode ser maior que o total final';
  SOProdutoLançadoAnteriormenteNãoE = 'O produto lançado anteriormente não existe mais! Selecione um novo produto';
  SAjustaDeEstoqueENTRADA = 'Ajusta de Estoque - ENTRADA';
  SAjusteDeEstoqueSAIDA = 'Ajuste de Estoque - SAIDA';
  SCompra = 'Compra';
  SCustoUnitário = 'Custo Unitário';

// END resource string wizard section


{$R *.dfm}

procedure TFrmVendaProd.AjustaOrdem(aSalvaOrdem: Boolean = False);
begin
  if rgCodigo.Checked then begin
    tProd.IndexName := 'ICodigo'; // do not localize
    TV.OptionsBehavior.IncSearchItem := TVCodigo;
//    TVCodigo.Index := 0;
    slConfig.Values['OrdemProd'] := '1'; // do not localize
  end else begin
    tProd.IndexName := 'IDescricao'; // do not localize
    TV.OptionsBehavior.IncSearchItem := TVDescricao;
//    TVDescricao.Index := 0;
    slConfig.Values['OrdemProd'] := '0'; // do not localize
  end;
  if aSalvaOrdem then SaveConfig;
  Grid.SetFocus;
end;

procedure TFrmVendaProd.AjustaValorPago;
begin
  if not (MT.State in [dsEdit, dsInsert]) then MT.Edit;
  if FidResgate then Exit;
  
end;

procedure TFrmVendaProd.cmCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmVendaProd.cmGravarClick(Sender: TObject);
begin
  FIME.LoadFromDataset(MT);
  FIME.imQuant := edQtd.Value;
  FIME.imUnitario := edUnitario.Value;
  FIME.imTotal := FTot.SubTotal;
  FIME.imPago := FTot.Pago;
  FIME.imDesconto := FTot.Desconto;
  FIME.imFidPontos := FTot.PontosNec;
  FIME.imObs := FTot.Obs;

  if not FidResgate then
    if (FIME.imPago - (FIME.imTotal - FIME.imDesconto)) > 0.001 then
      Raise ENexCafe.Create(SValorPagoNãoPodeSerMaiorQueOTota);
  FIME._Recibo := cbRecibo.Checked;
  FRes := True;
  ModalResult := mrOk;
end;

procedure TFrmVendaProd.cxLabel4Click(Sender: TObject);
begin
  edQtd.SetFocus;
end;

procedure TFrmVendaProd.dxBarButton1Click(Sender: TObject);
begin
  FTot.edRec.SetFocus;
end;

function TFrmVendaProd.FidResgate: Boolean;
begin
  Result := FIME.imFidResgate;
end;

procedure TFrmVendaProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FSalvarLay then
    SaveLay((FIME.imTipoTran=trEstVenda));
  Action := caFree;
end;

procedure TFrmVendaProd.FormCreate(Sender: TObject);
begin
  edQtd.Value := 1;
  FTot := TFrmTotal.Create(Self);
  FTot.PagarFimAcesso;
  FSalvarLay := False;
  FLoading := True;
  FRes := False;
  ProdAnt := -1;
  tProd.Open;
  MT.Open;
end;

procedure TFrmVendaProd.FormDestroy(Sender: TObject);
begin
  FTot.Free;
end;

procedure TFrmVendaProd.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : 
      if (cmGravar.Enabled) then
      if ((ssCtrl in Shift) or (FTot.edRec.Focused)) then 
        cmGravarClick(nil)
      else
      if Grid.Focused then
        edQtd.SetFocus
      else
      if edQtd.Focused then begin
        FTot.edRec.SetFocus;
      end else
      if edUnitario.Focused then 
        FTot.edRec.SetFocus;
        
    Key_Esc   : Close;

    $7B {F12} : FTot.edRec.SetFocus;
  end;
end;

procedure TFrmVendaProd.FormShow(Sender: TObject);
begin
  if not FNovo then begin
    if not tProd.Locate('ID', FIME.imProduto, []) then  // do not localize
      ShowMessage(SOProdutoLançadoAnteriormenteNãoE);
    FIME.SaveToDataset(MT);
    
    MTID.Value := FIME.imID;
  end else 
    MudouProduto;

  rgCodigo.Checked := (slConfig.Values['OrdemProd']='1'); // do not localize
  AjustaOrdem;
    
  Grid.SetFocus;
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  Timer1.Enabled := True;
end;

procedure TFrmVendaProd.lbUnitClick(Sender: TObject);
begin
  edUnitario.SetFocus;
end;

procedure TFrmVendaProd.LoadLay(aVenda: Boolean);
begin
  LeLayout(Grid, 'TFrmVendaProd.'+ BoolStr[aVenda]); // do not localize
end;

procedure TFrmVendaProd.MTAfterInsert(DataSet: TDataSet);
begin
  MTID.Value := -1;
end;

procedure TFrmVendaProd.MTCalcFields(DataSet: TDataSet);
begin
  MTFidPontos.Value := MTFidPontosU.Value * edQtd.Value;
end;

procedure TFrmVendaProd.MudouProduto;
begin
  MTProduto.Value := tProdID.Value;
  case FIME.imTipoTran of
    trEstEntrada, trEstSaida : begin
      edUnitario.Value := 0;
      MTCustoU.Value := 0;
    end;
    trEstCompra : begin
      edUnitario.Value := tProdCustoUnitario.Value;
      MTCustoU.Value := MTUnitario.Value;
    end;
    trEstVenda : begin
      if FidResgate then begin
        FTot.PontosNec := tProdFidPontos.Value;
        edUnitario.Value := 0;
      end else begin
        edUnitario.Value := tProdPreco.Value;
        FTot.PontosNec := 0;
      end;
      MTCustoU.Value := tProdCustoUnitario.Value;
    end;
  end;
  MTItem.Value := 1;
  MTNaoControlaEstoque.Value := tProdNaoControlaEstoque.Value;

  edUnitario.TabStop := (FIME.imTipoTran=trEstCompra) or tProdPodeAlterarPreco.Value;
  edUnitario.Properties.ReadOnly := not ((FIME.imTipoTran=trEstCompra) or tProdPodeAlterarPreco.Value);

  FTot.SubTotal := edQtd.Value * edUnitario.Value;
  AjustaValorPago;
end;

procedure TFrmVendaProd.rgCodigoClick(Sender: TObject);
begin
  AjustaOrdem(true);
end;

procedure TFrmVendaProd.rgDescrClick(Sender: TObject);
begin
  AjustaOrdem(true);
end;

procedure TFrmVendaProd.SaveLay(aVenda: Boolean);
begin
  SalvaLayout(Grid, 'TFrmVendaProd.'+ BoolStr[aVenda]); // do not localize
end;

function TFrmVendaProd.Editar(aIME: TncItemMovEst; aNovo, aEditaPag, aPodeSalvar: Boolean): Boolean;
begin
  FIME := aIME;
  if FidResgate then begin
    FTot.InitPontos(aIME.imFidPontos, 0, '', panTot);
    TVPreco.Visible := False;
    TVPontos.Visible := True;
    tProd.Filter := '(Fidelidade=True) and (FidPontos>0)'; // do not localize
    tProd.Filtered := True;
  end else
  if aEditaPag then 
    FTot.InitVal(aIME.imPagEsp, aIME.imTotal, aIME.imDesconto, aIME.imPago, 0, 0, '', panTot) else
    FTot.InitCusto(aIME.imTotal, '', panTot, False);

  FTot.Obs := aIME.imObs;  

  edUnitario.Value := aIME.imUnitario;  
    
  FNovo := aNovo;
  Dados.tbPro.Refresh;
  cmGravar.Enabled := aPodeSalvar and (aNovo or Permitido(daTraAlterar)) and (not Dados.tbPro.IsEmpty);
  with Dados.CM.Config do begin
    if (RecImprimir>0) and aEditaPag then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := aNovo and (RecImprimir=2);  
  end;

  LoadLay((aIME.imTipoTran = trEstVenda));

  panTot.Visible := not (aIME.imTipoTran in [trEstEntrada, trEstSaida]);
  panUnitario.Visible := panTot.Visible;

  case aIME.imTipoTran of
    trEstEntrada : Caption := SAjustaDeEstoqueENTRADA;
    trEstSaida   : Caption := SAjusteDeEstoqueSAIDA;
    trEstCompra  : begin
      Caption := SCompra;
      lbUnit.Caption := SCustoUnitário;
    end;
  end;
  
  if aIME.imTipoTran in [trEstEntrada, trEstSaida] then begin
    TVPreco.Visible := False;
{    VGTotal.Visible := False;
    VGUnitario.Visible := False;}
  end;
  
  if not aEditaPag then begin
{    VGDesconto.Visible := False;
    VGTotalF.Visible := False;
    VGPagTotal.Visible := False;
    VGPago.Visible := False;}
    panTot.Height := 73;
  end;
  FIME := aIME;
  
  MT.Insert;                                                                      
  MTQuant.Value := 1;
  MTFidResgate.Value := FidResgate;
  MTTipoTran.Value := aIME.imTipoTran;

{  if aEditaPag and aNovo then
    MTPagTotal.Value := Dados.CM.Config.PgVendas;}
    
  ShowModal;
  Result := FRes;
end;

procedure TFrmVendaProd.edQtdPropertiesChange(Sender: TObject);
begin
  edQtd.PostEditValue;
  FTot.SubTotal := edQtd.Value * edUnitario.Value;
end;

procedure TFrmVendaProd.edUnitarioPropertiesChange(Sender: TObject);
begin
  edQtd.PostEditValue;
  FTot.SubTotal := edQtd.Value * edUnitario.Value;
end;

procedure TFrmVendaProd.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FLoading := False;
end;

procedure TFrmVendaProd.TVColumnPosChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  FSalvarLay := True;
end;

procedure TFrmVendaProd.TVColumnSizeChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  FSalvarLay := True;
end;

procedure TFrmVendaProd.TVCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Selected then
    ACanvas.Font.Style := [fsBold];
end;

procedure TFrmVendaProd.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if MT.Active and (not FLoading) then
    MudouProduto;
end;

procedure TFrmVendaProd.TVMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then cmGravarClick(nil);
end;

procedure TFrmVendaProd.VGCodigoEditPropertiesInitPopup(Sender: TObject);
begin
  ProdAnt := MTProduto.Value;
end;

procedure TFrmVendaProd.VGDescontoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmVendaProd.VGEdited(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  AjustaValorPago;
end;

end.

