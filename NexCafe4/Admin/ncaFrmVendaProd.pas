unit ncaFrmVendaProd;

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
  Menus, StdCtrls, cxLabel, cxCheckBox, cxSpinEdit;

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
    LMDSimplePanel1: TLMDSimplePanel;
    MT: TkbmMemTable;
    MTProduto: TIntegerField;
    MTCodigo: TStringField;
    MTDescr: TStringField;
    MTUnitario: TCurrencyField;
    MTQuant: TFloatField;
    MTTotal: TCurrencyField;
    MTDesconto: TCurrencyField;
    MTTotalF: TCurrencyField;
    MTPagTotal: TBooleanField;
    DS: TDataSource;
    MTPago: TCurrencyField;
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
    panTot: TLMDSimplePanel;
    VG: TcxDBVerticalGrid;
    VGUnitario: TcxDBEditorRow;
    VGQuant: TcxDBEditorRow;
    VGTotal: TcxDBEditorRow;
    VGDesconto: TcxDBEditorRow;
    VGTotalF: TcxDBEditorRow;
    VGPagTotal: TcxDBEditorRow;
    VGPago: TcxDBEditorRow;
    MTEntrada: TBooleanField;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    rgDescr: TcxRadioButton;
    rgCodigo: TcxRadioButton;
    cmRecibo: TdxBarControlContainerItem;
    cbRecibo: TcxCheckBox;
    TVPontos: TcxGridDBColumn;
    tProdFidelidade: TBooleanField;
    tProdFidPontos: TIntegerField;
    VGPontos: TcxDBEditorRow;
    VGTotalP: TcxDBEditorRow;
    MTFidPontosU: TIntegerField;
    MTFidPontos: TFloatField;
    MTFidResgate: TBooleanField;
    TVObs: TcxGridDBColumn;
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
    procedure VGPagTotalEditPropertiesEditValueChanged(Sender: TObject);
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
  private
    ProdAnt : Integer;
    FIME    : TncItemMovEst;
    FRes    : Boolean;
    FNovo   : Boolean;
    FLoading: Boolean;
    FSL     : TStrings;
    FSalvarLay : Boolean;
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

uses ncaDM, ncIDRecursos, ncaFrmPri;

{$R *.dfm}

function configname: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'NexAdmin.ini';
end;

procedure TFrmVendaProd.AjustaOrdem(aSalvaOrdem: Boolean = False);
begin
  if rgCodigo.Checked then begin
    tProd.IndexName := 'ICodigo';
    TV.OptionsBehavior.IncSearchItem := TVCodigo;
    TVCodigo.Index := 0;
    FSL.Values['OrdemProd'] := '1';
  end else begin
    tProd.IndexName := 'IDescricao';
    TV.OptionsBehavior.IncSearchItem := TVDescricao;
    TVDescricao.Index := 0;
    FSL.Values['OrdemProd'] := '0';
  end;
  if aSalvaOrdem then FSL.SaveToFile(configname);
  Grid.SetFocus;
end;

procedure TFrmVendaProd.AjustaValorPago;
begin
  if not (MT.State in [dsEdit, dsInsert]) then MT.Edit;
  if FidResgate then Exit;

  if MTPagTotal.Value then
    MTPago.Value := MTTotalF.Value;
end;

procedure TFrmVendaProd.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendaProd.cmGravarClick(Sender: TObject);
begin
  VG.DataController.PostEditingData;
  VG.DataController.Post;
  FIME.LoadFromDataset(MT);
  if not FidResgate then
    if (FIME.imPago - (FIME.imTotal - FIME.imDesconto)) > 0.001 then
      Raise ENexCafe.Create('Valor pago não pode ser maior que o total final');
  FIME._Recibo := cbRecibo.Checked;
  FRes := True;
  Close;
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
  FSalvarLay := False;
  FLoading := True;
  FSL := TStringList.Create;
  if FileExists(configname) then
    FSL.LoadFromFile(configname);
  FRes := False;
  ProdAnt := -1;
  tProd.Open;
  MT.Open;
end;

procedure TFrmVendaProd.FormDestroy(Sender: TObject);
begin
  FSL.Free;
end;

procedure TFrmVendaProd.FormShow(Sender: TObject);
begin
  if not FNovo then begin
    if not tProd.Locate('ID', FIME.imProduto, []) then 
      ShowMessage('O produto lançado anteriormente não existe mais! Selecione um novo produto');
    FIME.SaveToDataset(MT);
    if not FidResgate then
      MTPagTotal.Value := Abs(FIME.imTotal - FIME.imDesconto - FIME.imPago) < 0.01;
    MTID.Value := FIME.imID;
  end else 
    MudouProduto;

  rgCodigo.Checked := (FSL.Values['OrdemProd']='1');
  AjustaOrdem;
    
  Grid.SetFocus;
  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  Timer1.Enabled := True;
end;

procedure TFrmVendaProd.LoadLay(aVenda: Boolean);
begin
  LeLayout(Grid, 'TFrmVendaProd.'+ BoolStr[aVenda]);
end;

procedure TFrmVendaProd.MTAfterInsert(DataSet: TDataSet);
begin
  MTID.Value := -1;
end;

procedure TFrmVendaProd.MTCalcFields(DataSet: TDataSet);
begin
  MTTotal.Value := MTQuant.Value * MTUnitario.Value;
  MTTotalF.Value := MTTotal.Value - MTDesconto.Value;
  MTFidPontos.Value := MTFidPontosU.Value * MTQuant.Value;
end;

procedure TFrmVendaProd.MudouProduto;
begin
  MTProduto.Value := tProdID.Value;
  case FIME.imTipoTran of
    trEstEntrada, trEstSaida : begin
      MTUnitario.Value := 0;
      MTCustoU.Value := 0;
    end;
    trEstCompra : begin
      MTUnitario.Value := tProdCustoUnitario.Value;
      MTCustoU.Value := MTUnitario.Value;
    end;
    trEstVenda : begin
      if FidResgate then begin
        MTFidPontosU.Value := tProdFidPontos.Value;
        MTUnitario.Value := 0;
      end else begin
        MTUnitario.Value := tProdPreco.Value;
        MTFidPontosU.Value := 0;
      end;
      MTCustoU.Value := tProdCustoUnitario.Value;
    end;
  end;
  MTItem.Value := 1;
  MTNaoControlaEstoque.Value := tProdNaoControlaEstoque.Value;
  VGUnitario.Options.TabStop := (FIME.imTipoTran=trEstCompra) or tProdPodeAlterarPreco.Value;
  VGUnitario.Options.Focusing := (FIME.imTipoTran=trEstCompra) or tProdPodeAlterarPreco.Value;
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
  SalvaLayout(Grid, 'TFrmVendaProd.'+ BoolStr[aVenda]);
end;

function TFrmVendaProd.Editar(aIME: TncItemMovEst; aNovo, aEditaPag, aPodeSalvar: Boolean): Boolean;
begin
  FIME := aIME;
  if FidResgate then begin
    VGUnitario.Visible := False;
    VGTotal.Visible := False;
    VGDesconto.Visible := False;
    VGTotalF.Visible := False;
    VGPagTotal.Visible := False;
    VGPago.Visible := False;
    VGPontos.Visible := True;
    VGTotalP.Visible := True;
    TVPreco.Visible := False;
    TVPontos.Visible := True;
    tProd.Filter := '(Fidelidade=True) and (FidPontos>0)';
    tProd.Filtered := True;
  end;
  FNovo := aNovo;
  cmGravar.Enabled := aPodeSalvar and (aNovo or Permitido(daTraAlterar));
  with Dados.CM.Config do begin
    if (RecImprimir>0) and aEditaPag then
      cmRecibo.Visible := ivAlways else
      cmRecibo.Visible := ivNever;

    cbRecibo.Checked := aNovo and (RecImprimir=2);  
  end;

  LoadLay((aIME.imTipoTran = trEstVenda));

  case aIME.imTipoTran of
    trEstEntrada : Caption := 'Ajusta de Estoque - ENTRADA';
    trEstSaida   : Caption := 'Ajuste de Estoque - SAIDA';
    trEstCompra  : begin
      Caption := 'Compra';
      VGUnitario.Properties.Caption := 'Custo Unitário';
    end;
  end;
  
  if aIME.imTipoTran in [trEstEntrada, trEstSaida] then begin
    TVPreco.Visible := False;
    VGTotal.Visible := False;
    VGUnitario.Visible := False;
  end;
  
  if not aEditaPag then begin
    VGDesconto.Visible := False;
    VGTotalF.Visible := False;
    VGPagTotal.Visible := False;
    VGPago.Visible := False;
    panTot.Height := 73;
  end;
  FIME := aIME;
  MT.Insert;
  MTPagTotal.Value := True;
  MTQuant.Value := 1;
  MTFidResgate.Value := FidResgate;
  MTTipoTran.Value := aIME.imTipoTran;
  if aEditaPag and aNovo then
    MTPagTotal.Value := Dados.CM.Config.PgVendas;
  ShowModal;
  Result := FRes;
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

procedure TFrmVendaProd.VGPagTotalEditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if MTPagTotal.Value then
    MTPago.Value := MTTotalF.Value else
    MTPago.Value := 0;
end;

end.
