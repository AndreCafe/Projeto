unit uNexRegPri;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxVGrid, cxDBVGrid,
  cxInplaceContainer, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent, nxsdServerEngine,
  nxreRemoteServerEngine, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBarDBNav, cxPC, dxBar, dxBarExtItems,
  cxGroupBox, cxContainer, cxTextEdit, cxMemo, cxDBEdit, cxMaskEdit,
  cxRadioGroup, cxImageComboBox, cxSpinEdit, cxLabel, ExtCtrls, StdCtrls,
  cxCurrencyEdit, cxDBLabel, cxPropertiesStore, cxCalendar,
  cxDBLookupComboBox, cxDropDownEdit, cxCheckBox, cxDBExtLookupComboBox,
  cxLookAndFeelPainters, cxButtons, cxGridCustomPopupMenu, cxGridPopupMenu,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  ImgList, kbmMWCustomConnectionPool, kbmMWClientDataset,
  kbmMWClient, kbmMemTable, kbmMWStreamFormat, kbmMWBinaryStreamFormat,
  kbmMWCustomTransport, kbmMWTCPIPIndyTransport, kbmMWCustomDataset, 
  dxDockControl,
  dxDockPanel, ufmFormBase, dxPScxCommon,
  PngImageList, cxTL, cxDBTL, cxTLData, LMDCustomScrollBox, LMDScrollBox,
  lmdsplt, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, cxRichEdit,
  cxDBRichEdit, Buttons, PngSpeedButton, LMDSimplePanel, uFreeBoletoImage,
  uFreeBoleto, LMDControl, cxLookAndFeels, Menus, cxPCdxBarPopupMenu,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, dxSkinsdxDockControlPainter;

type
  TFrmPri = class(TForm)
    BarMgr: TdxBarManager;
    cmFechar: TdxBarButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxVerticalGridStyleSheetPlumHighColor: TcxVerticalGridStyleSheet;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxVerticalGridStyleSheetDevExpress: TcxVerticalGridStyleSheet;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxGridPopupMenu1: TcxGridPopupMenu;
    cmImprimir: TdxBarButton;
    CP: TdxComponentPrinter;
    cmExcel: TdxBarButton;
    cxGridPopupMenu2: TcxGridPopupMenu;
    cmArquivo: TdxBarSubItem;
    cmExibir: TdxBarSubItem;
    cmEditarSub: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    cmExibir2: TdxBarSubItem;
    cmNomeOper: TdxBarStatic;
    dxDockingManager1: TdxDockingManager;
    cmNovoMenu: TdxBarButton;
    cmEditMenu: TdxBarButton;
    cmApagarMenu: TdxBarButton;
    FM: TFormManager;
    cmConfigMenu: TdxBarButton;
    cmVoltar: TdxBarButton;
    cmAvancar: TdxBarButton;
    cmAlterarSenha: TdxBarButton;
    im32: TPngImageList;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    LMDSplitterPanel1: TLMDSplitterPanel;
    LMDSplitterPane1: TLMDSplitterPane;
    LMDSplitterPane2: TLMDSplitterPane;
    Paginas: TcxPageControl;
    tHist: TnxTable;
    tHistID: TAutoIncField;
    tHistTipo: TStringField;
    tHistLoja: TIntegerField;
    tHistPor: TStringField;
    tHistDataHora: TDateTimeField;
    tHistMeio: TStringField;
    tHistTexto: TMemoField;
    dsHist: TDataSource;
    tTar: TnxTable;
    tTarID: TAutoIncField;
    tTarDataHora: TDateTimeField;
    tTarPor: TStringField;
    tTarPara: TStringField;
    tTarLoja: TIntegerField;
    tTarPendente: TBooleanField;
    tTarResolvidoEm: TDateTimeField;
    tTarNomeLoja: TStringField;
    tTarRealizarEm: TDateTimeField;
    tTarTexto: TMemoField;
    dsTar: TDataSource;
    tFin: TnxTable;
    tFinID: TAutoIncField;
    tFinLoja: TIntegerField;
    tFinVencimento: TDateField;
    tFinPagamento: TDateField;
    tFinValor: TCurrencyField;
    tFinValorPago: TCurrencyField;
    tFinObs: TMemoField;
    tFinDoc: TStringField;
    tFinDescricao: TStringField;
    tFinLancamento: TDateTimeField;
    dsFin: TDataSource;
    tAut: TnxTable;
    tAutID: TAutoIncField;
    tAutLoja: TIntegerField;
    tAutAutorizacao: TStringField;
    tAutVencimento: TDateField;
    tAutCodigoEquip: TStringField;
    tAutMaquinas: TWordField;
    tAutTipo: TWordField;
    tAutCriadaEm: TDateTimeField;
    tAutCriadaPor: TStringField;
    tAutInativadaEm: TDateTimeField;
    tAutInativadaPor: TStringField;
    tAutAtiva: TBooleanField;
    tAutObs: TMemoField;
    tAutGerar: TBooleanField;
    tAutPrograma: TWordField;
    tAutEnviouCli: TBooleanField;
    dsAut: TDataSource;
    PagR: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    GridFin: TcxGrid;
    tvFin: TcxGridDBTableView;
    tvFinColumn1: TcxGridDBColumn;
    tvFinLancamento: TcxGridDBColumn;
    tvFinVencimento: TcxGridDBColumn;
    tvFinValor: TcxGridDBColumn;
    tvFinPagamento: TcxGridDBColumn;
    tvFinValorPago: TcxGridDBColumn;
    tvFinDoc: TcxGridDBColumn;
    tvFinDescricao: TcxGridDBColumn;
    tvFinObs: TcxGridDBColumn;
    lvFin: TcxGridLevel;
    LMDSimplePanel7: TLMDSimplePanel;
    btnGerarBoleto: TPngSpeedButton;
    btnEditar: TPngSpeedButton;
    btnAdd: TPngSpeedButton;
    btnApagarFin: TPngSpeedButton;
    cxTabSheet6: TcxTabSheet;
    gridAut: TcxGrid;
    tvAut: TcxGridDBTableView;
    tvAutEnviouCli: TcxGridDBColumn;
    tvAutAtiva: TcxGridDBColumn;
    tvAutTipo: TcxGridDBColumn;
    tvAutPrograma: TcxGridDBColumn;
    tvAutMaquinas: TcxGridDBColumn;
    tvAutVencimento: TcxGridDBColumn;
    tvAutAutorizacao: TcxGridDBColumn;
    tvAutCodigoEquip: TcxGridDBColumn;
    tvAutCriadaEm: TcxGridDBColumn;
    tvAutCriadaPor: TcxGridDBColumn;
    tvAutInativadaEm: TcxGridDBColumn;
    tvAutInativadaPor: TcxGridDBColumn;
    tvAutObs: TcxGridDBColumn;
    glAut: TcxGridLevel;
    LMDSimplePanel14: TLMDSimplePanel;
    btnAtualizarLic: TPngSpeedButton;
    rbInativas: TcxRadioButton;
    rbTodas: TcxRadioButton;
    rbAtivas: TcxRadioButton;
    cxLabel3: TcxLabel;
    tsHist: TcxTabSheet;
    LMDSimplePanel3: TLMDSimplePanel;
    btnEditaHC: TPngSpeedButton;
    btnAddHC: TPngSpeedButton;
    btnApagaHC: TPngSpeedButton;
    LMDSimplePanel6: TLMDSimplePanel;
    gridHist: TcxGrid;
    tvHist: TcxGridDBTableView;
    tvHistID: TcxGridDBColumn;
    tvHistDataHora: TcxGridDBColumn;
    tvHistTipo: TcxGridDBColumn;
    tvHistPor: TcxGridDBColumn;
    tvHistMeio: TcxGridDBColumn;
    lvHist: TcxGridLevel;
    LMDSimplePanel8: TLMDSimplePanel;
    edHist: TcxDBRichEdit;
    LMDSimplePanel9: TLMDSimplePanel;
    FB: TFreeBoleto;
    FBI: TFreeBoletoImagem;
    btnEditarLic: TPngSpeedButton;
    cmEmailCli: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    cmNextar: TdxBarButton;
    cmPCPhone: TdxBarButton;
    tFinClienteLancou: TBooleanField;
    tFinPremium: TBooleanField;
    tFinPremiumDias: TWordField;
    tFinCancelado: TBooleanField;
    tFinCanceladoEm: TDateTimeField;
    tFinCanceladoPor: TStringField;
    tFinBaixou: TBooleanField;
    PngSpeedButton1: TPngSpeedButton;
    cxStyle44: TcxStyle;
    btnBaixar: TcxButton;
    edDataBaixa: TcxDateEdit;
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure cmExcelClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmAlterarSenhaClick(Sender: TObject);
    procedure tvAutEnviouCliCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvAutAtivaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure rbAtivasClick(Sender: TObject);
    procedure rbTodasClick(Sender: TObject);
    procedure rbInativasClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnApagarFinClick(Sender: TObject);
    procedure btnGerarBoletoClick(Sender: TObject);
    procedure btnAddHCClick(Sender: TObject);
    procedure btnEditaHCClick(Sender: TObject);
    procedure btnApagaHCClick(Sender: TObject);
    procedure btnAddTarClick(Sender: TObject);
    procedure btnEdTarClick(Sender: TObject);
    procedure btnApagaTarClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure btnEditarLicClick(Sender: TObject);
    procedure btnAtualizarLicClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BaixarBoleto(aNum: Integer);
    procedure DisableDatasets;
    procedure EnableDatasets;
    function CodigoCliente: Integer;
    procedure SalvaBoleto;
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;
  Fechando : Boolean = False;

implementation

uses 
  Clipbrd,
  cxGridExportLink, 
  uNexRegDM, 
  uNRfbClientes, 
  uNRFrmLogin, 
  ufmImagens, 
  uNRFrmSenha, 
  cxGridPopupMenuConsts,
  cxGridStrs, 
  cxFilterConsts,
  cxFilterControlStrs, uNRfbTitulos, nrAutorizacao,
  uFrmAutorizacao, uNRFrmTitulo, uFrmHC, uFrmTar, uNRfbAut, uLinkBol;
  

{$R *.dfm}

function GridININame: String;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'NexRegGrid.ini';
end;

procedure TFrmPri.dxBarLargeButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.EnableDatasets;
begin
  dsHist.Dataset := tHist;
  dsTar.Dataset := tTar;
  dsFin.Dataset := tFin;
  dsAut.Dataset := tAut;

  tHist.EnableControls;
  tTar.EnableControls;
  tFin.EnableControls;
  tAut.EnableControls;
end;

procedure TFrmPri.cmExcelClick(Sender: TObject);
var 
  V : Variant;
  G : TcxGrid;
begin
  V := ivNever;
  cmNovoMenu.Visible := V;
  G := FM.FormAtivo.GetGrid;
  if G <> nil then
    ExportGridToExcel(ExtractFilePath(ParamStr(0))+'Exportar.xls', G);
end;

procedure TFrmPri.cmFecharClick(Sender: TObject);
begin
  Close;
end;

function TFrmPri.CodigoCliente: Integer;
begin
  Result := FM.FormAtivo.GetDataset.FieldByName('CodLoja').AsInteger;
end;

procedure TFrmPri.DisableDatasets;
begin
  tHist.DisableControls;
  tTar.DisableControls;
  tFin.DisableControls;
  tAut.DisableControls;

  dsHist.Dataset := nil;
  dsTar.Dataset := nil;
  dsFin.Dataset := nil;
  dsAut.Dataset := nil;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  edDataBaixa.Date := Date-1;
  FM.RegistraForm(TfbClientes);
  FM.RegistraForm(TfbTitulos);
  FM.RegistraForm(TfbAut);
 { FM.RegistraForm(TfbPREstat); 
  FM.RegistraForm(TfbLog);
  FM.RegistraForm(TfbPC);
  FM.RegistraForm(TfbUsuario);
  FM.RegistraForm(TfbStatus); }
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fechando := True;
  FM.OnPageControlChange := nil;
  Paginas.OnChange := nil;
  FM.Free;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  if TFrmLogin.Create(Self).Login then begin
    FM.Mostrar(TfbClientes, 0, 0);
    FM.Mostrar(TfbTitulos, 0, 0);
    FM.Mostrar(TfbAut, 0, 0);
    Paginas.ActivePageIndex := 0;
    tFin.Active := True;
    tHist.Active := True;
    tTar.Active := True;
    tAut.Active := True;
  end else begin
    Close;
    Exit;
  end;  
end;

procedure TFrmPri.PaginasChange(Sender: TObject);
var aFieldName: String;
begin
  tHist.MasterSource := nil;
  tTar.MasterSource := nil;
  tFin.MasterSource := nil;
  tAut.MasterSource := nil;
  if FM.FormAtivo.GetDataSource.DataSet.FindField('CodLoja')=nil then begin
    tHist.MasterFields := 'Loja';
    tTar.MasterFields := 'Loja';
    tFin.MasterFields := 'Loja';
    tAut.MasterFields := 'Loja';
  end else begin
    tHist.MasterFields := 'CodLoja';
    tTar.MasterFields := 'CodLoja';
    tFin.MasterFields := 'CodLoja';
    tAut.MasterFields := 'CodLoja';
  end;
  tHist.MasterSource := FM.FormAtivo.GetDataSource;
  tTar.MasterSource := tHist.MasterSource;
  tFin.MasterSource := tHist.MasterSource;
  tAut.MasterSource := tHist.MasterSource;
end;

procedure TFrmPri.PngSpeedButton1Click(Sender: TObject);
begin
  Clipboard.AsText := LinkBoleto(tFinID.Value, False, True);  
end;

procedure TFrmPri.btnAddHCClick(Sender: TObject);
begin
  tHist.Insert;
  tHistLoja.Value := CodigoCliente;
  tHistDataHora.Value := Now;
  tHistMeio.Value := 'MSN';
  tHistTipo.Value := 'Vendas';
  tHistPor.Value := UsuarioLogin;
  TFrmHC.Create(Self).Editar(tHist);
end;

procedure TFrmPri.btnAddTarClick(Sender: TObject);
begin
  tTar.Insert;
  tTarLoja.Value := CodigoCliente;
  tTarDataHora.Value := Now;
  tTarPendente.Value := True;
  tTarPor.Value := UsuarioLogin;
  tTarPara.Value := UsuarioLogin;
  TFrmTar.Create(Self).Editar(tTar);
end;

procedure TFrmPri.rbAtivasClick(Sender: TObject);
begin
  tAut.Filter := 'Ativa = True';
  tAut.Filtered := True;
  tAut.Refresh;
end;

procedure TFrmPri.rbInativasClick(Sender: TObject);
begin
  tAut.Filter := 'Ativa = False';
  tAut.Filtered := True;
  tAut.Refresh;
end;

procedure TFrmPri.rbTodasClick(Sender: TObject);
begin
  tAut.Filtered := False;
end;

procedure TFrmPri.SalvaBoleto;
begin
  with DM do begin
    tFin.Edit;
    FB.Vencimento := tFinVencimento.Value;
    FB.DataDocumento := tFinLancamento.Value;
    FB.Valor := tFinValor.Value;
    FB.NossoNumero := tFinID.AsString;
    FB.Documento := tFinID.AsString;
    FB.Preparar;
    tFinDoc.Value := FB.DadosGerados.LinhaDigitavel;
    tFin.Post;
  end;
end;

procedure TFrmPri.tvAutAtivaCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.Value=null) or (AviewInfo.Value=False) then begin
    ACanvas.Font.Color := clGray;
    ACanvas.Font.Style := [];
  end else begin
    ACanvas.Font.Color := clGreen;
    ACanvas.Font.Style := [fsBold];
  end;
  ACanvas.Brush.Color := clWhite;
end;

procedure TFrmPri.tvAutEnviouCliCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  inherited;
  V := AViewInfo.GridRecord.Values[tvAutAtiva.Index];

  if (AViewInfo.Value=null) or (AviewInfo.Value=False) then begin
    ACanvas.Font.Style := [fsBold];
    if (V=null) or (V=False) then
      ACanvas.Font.Color := clGray else
      ACanvas.Font.Color := clBlack;
  end else begin
    if (V=null) or (V=False) then
      ACanvas.Font.Color := clGray else
      ACanvas.Font.Color := clBlack;
  end;
  ACanvas.Brush.Color := clWhite;
end;

procedure TFrmPri.BaixarBoleto(aNum: Integer);
begin
  PagR.ActivePageIndex := 0;
  if tFin.Locate('ID', aNum, []) and tFinPagamento.IsNull then 
    btnBaixarClick(nil);
end;

procedure TFrmPri.btnAddClick(Sender: TObject);
begin
  if TFrmTitulo.Create(nil).Novo(CodigoCliente, tFin) then
    SalvaBoleto;
end;

procedure TFrmPri.btnApagaHCClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente esse histórico de contato ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
  if MessageDlg('Tem certeza ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
    tHist.Delete;
end;

procedure TFrmPri.btnApagarFinClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente apagar essa parcela ?', mtConfirmation, [mbNo, mbYes], 0, mbNo)=mrYes then
  if MessageDlg('Confirma realmente que deseja apagar essa parcela ?', mtConfirmation, [mbNo, mbYes], 0, mbNo)=mrYes then
    tFin.Delete;
end;

procedure TFrmPri.btnApagaTarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente essa tarefa ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
  if MessageDlg('Tem certeza ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
    tTar.Delete;
end;

procedure TFrmPri.btnAtualizarLicClick(Sender: TObject);
begin
  tAut.Refresh;
end;

procedure TFrmPri.btnBaixarClick(Sender: TObject);
begin
  if TFrmTitulo.Create(nil).Editar(CodigoCliente, tFin, edDataBaixa.Date) then
  begin
    SalvaBoleto;
    PagR.ActivePageIndex := 1;
    btnEditarLicClick(nil);
  end;
end;

procedure TFrmPri.btnEditaHCClick(Sender: TObject);
begin
  tHist.Edit;
  TFrmHC.Create(Self).Editar(tHist);
end;

procedure TFrmPri.btnEditarClick(Sender: TObject);
begin
  if TFrmTitulo.Create(nil).Editar(CodigoCliente, tFin) then
    SalvaBoleto;
end;

procedure TFrmPri.btnEditarLicClick(Sender: TObject);
begin
  TFrmAut.Create(Self).Editar(CodigoCliente);
  tAut.Refresh;
end;

procedure TFrmPri.btnEdTarClick(Sender: TObject);
begin
  tTar.Edit;
  tFrmTar.Create(Self).Editar(tTar);
end;

function ApenasDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  if (S[I] in  ['0'..'9']) then
    Result := Result + S[I];
end;

procedure TFrmPri.btnGerarBoletoClick(Sender: TObject);
begin
  with DM do begin
    if not tCli.Locate('Codigo', CodigoCliente, []) then 
      raise exception.Create('Loja não encontrada');
      
    if cmNextar.Down then
      FB.Cedente.Nome := 'NEXTAR TECNOLOGIA DE SOFTWARE LTDA' else
      FB.Cedente.Nome := 'PC PHONE TELEF COMPUT LTDA';
    FB.Vencimento := tFinVencimento.Value;
    FB.DataDocumento := tFinLancamento.Value;
    FB.Valor := tFinValor.Value;
    FB.NossoNumero := tFinID.AsString;
    FB.Documento := tFinID.AsString;
    FB.Sacado.Nome := tCliRazaoSocial.Value;
    if Length(ApenasDig(tCliCNPJ.Value))>11 then
      FB.Sacado.Pessoa := pJuridica else
      FB.Sacado.Pessoa := pFisica;
    FB.Sacado.CNPJ_CPF := ApenasDig(tCliCNPJ.Value);  
    FB.Sacado.Endereco := tCliEndereco.Value;
    FB.Sacado.Estado := tCliUF.Value;
    FB.Sacado.Cidade := tCliCidade.Value;
    FB.Sacado.Cep  := tCliCEP.Value;
    FB.Sacado.Bairro := tCliBairro.Value;  
    FB.Preparar;
    FBI.ListaBoletos.Add(FB);
    FBI.ShowPreview;
  end;
end;

procedure TFrmPri.cmAlterarSenhaClick(Sender: TObject);
var 
  S: String;
begin
  with DM do begin
    S := TFrmAlteraSenha.Create(Self).Editar(tUsuarioSenha.Value, tUsuarioUsername.Value);
    if S <> tUsuarioSenha.Value then begin
      tUsuario.Edit;
      tUsuarioSenha.Value := S;
      tUsuario.Post;
    end;  
  end
end;

initialization
  MostrarTextoBotoes := True;
  cxSetResourceString(@cxSGridNone, 'Nenhum');
  cxSetResourceString(@cxSGridSortColumnAsc, 'Ordenar Crescente');
  cxSetResourceString(@cxSGridSortColumnDesc, 'Ordenar Decrescente');
  cxSetResourceString(@cxSGridClearSorting, 'Não Ordenar');
  cxSetResourceString(@cxSGridGroupByThisField, 'Agrupar por esta coluna');
  cxSetResourceString(@cxSGridRemoveThisGroupItem, 'Remover do agrupamento');
  cxSetResourceString(@cxSGridGroupByBox, 'Agrupamento') ;
  cxSetResourceString(@cxSGridAlignmentSubMenu, 'Alinhamento');
  cxSetResourceString(@cxSGridAlignLeft, 'à Esquerda');
  cxSetResourceString(@cxSGridAlignRight, 'à Direita');
  cxSetResourceString(@cxSGridAlignCenter, 'ao Centro');        
  cxSetResourceString(@cxSGridRemoveColumn, 'Remover esta coluna');
  cxSetResourceString(@cxSGridFieldChooser, 'Selecionar Colunas');
  cxSetResourceString(@cxSGridBestFit, 'Tamanho ideal');
  cxSetResourceString(@cxSGridBestFitAllColumns, 'Tamanho ideal (Todas colunas)');
  cxSetResourceString(@cxSGridShowFooter, 'Rodapé');
  cxSetResourceString(@cxSGridShowGroupFooter, 'Rodapé em agrupamento');
  cxSetResourceString(@cxSGridSumMenuItem, 'Somar');
  cxSetResourceString(@cxSGridMinMenuItem, 'Min');
  cxSetResourceString(@cxSGridMaxMenuItem, 'Max');
  cxSetResourceString(@cxSGridCountMenuItem, 'Contar');
  cxSetResourceString(@cxSGridAvgMenuItem, 'Media');
  cxSetResourceString(@cxSGridNoneMenuItem, 'Nenhum');

  cxSetResourceString(@scxGridRecursiveLevels, 'Você não pode criar niveis recursivos');

  cxSetResourceString(@scxGridDeletingConfirmationCaption, 'Confirmar');
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, 'Apagar registro?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, 'Apagar todos registros selecionados?');

  cxSetResourceString(@scxGridNewItemRowInfoText, 'Clique aqui para adicionar um novo registro');

  cxSetResourceString(@scxGridFilterIsEmpty, '<Filtro está vazio>');

  cxSetResourceString(@scxGridCustomizationFormCaption, 'Customização');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Colunas');
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Arraste aqui o cabeçalho de uma coluna para agrupar por esta coluna');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Customizar...');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Bandas');

  cxSetResourceString(@scxGridConverterNotExistGrid, 'cxGrid não existet');
  cxSetResourceString(@scxGridConverterNotExistComponent, 'Componente não existe');
  cxSetResourceString(@scxImportErrorCaption, 'Erro de importação');

  cxSetResourceString(@scxNotExistGridView, 'Grid view não existe');
  cxSetResourceString(@scxNotExistGridLevel, 'Grid level ativo não existe');
  cxSetResourceString(@scxCantCreateExportOutputFile, 'Falha na criação do arquivo de exportação');
  
  cxSetResourceString(@cxSFilterRootButtonCaption, 'Filtro');
  cxSetResourceString(@cxSFilterAddCondition, 'Nova &Condição');
  cxSetResourceString(@cxSFilterAddGroup, 'Novo &Grupo');
  cxSetResourceString(@cxSFilterRemoveRow , '&Remover Linha');
  cxSetResourceString(@cxSFilterClearAll, 'Limpar &Tudo');
  cxSetResourceString(@cxSFilterFooterAddCondition, 'pressione o botão para adicionar uma nova condição');
  cxSetResourceString(@cxSFilterGroupCaption, 'se aplica as seguintes condições');
  cxSetResourceString(@cxSFilterRootGroupCaption , '<raiz>');
  cxSetResourceString(@cxSFilterControlNullString , '<vazio>');
  cxSetResourceString(@cxSFilterErrorBuilding, 'Não é possível montar o filtro nessa origem');
  cxSetResourceString(@cxSFilterDialogCaption, 'Filtro Customizado');
  cxSetResourceString(@cxSFilterDialogInvalidValue, 'Valor inválido');
  cxSetResourceString(@cxSFilterDialogUse, 'Usar');
  cxSetResourceString(@cxSFilterDialogSingleCharacter, 'para representar qualquer caracter');
  cxSetResourceString(@cxSFilterDialogCharactersSeries, 'para representar qualquer série de caracteres');
  cxSetResourceString(@cxSFilterDialogOperationAnd, 'E');
  cxSetResourceString(@cxSFilterDialogOperationOr, 'OU');
  cxSetResourceString(@cxSFilterDialogRows, 'Mostrar registros onde:');
  cxSetResourceString(@cxSFilterControlDialogCaption, 'Criador de Filtro');
  cxSetResourceString(@cxSFilterControlDialogNewFile, 'semtitulo.flt');
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption, 'Abrir um filtro existente');
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption, 'Salvar o filtro ativo para um arquivo');
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption , '&Salvar como...');
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption , '&Abrir...');
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption , 'A&plicar');
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption, 'OK');
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption, 'Cancelar');
  cxSetResourceString(@cxSFilterControlDialogFileExt, 'flt');
  cxSetResourceString(@cxSFilterControlDialogFileFilter, 'Filttros (*.flt)|*.flt');

  cxSetResourceString(@cxSFilterOperatorEqual, 'seja igual a');
  cxSetResourceString(@cxSFilterOperatorNotEqual, 'seja diferente de');
  cxSetResourceString(@cxSFilterOperatorLess, 'seja menor que');
  cxSetResourceString(@cxSFilterOperatorLessEqual, 'seja menor que ou igual a');
  cxSetResourceString(@cxSFilterOperatorGreater, 'seja maior que');
  cxSetResourceString(@cxSFilterOperatorGreaterEqual, 'seja maior que ou igual a');
  cxSetResourceString(@cxSFilterOperatorLike, 'contenha');
  cxSetResourceString(@cxSFilterOperatorNotLike, 'não contenha');
  cxSetResourceString(@cxSFilterOperatorBetween, 'tenha valor entre');
  cxSetResourceString(@cxSFilterOperatorNotBetween, 'não tenha valor entre');
  cxSetResourceString(@cxSFilterOperatorInList, 'dentro de');
  cxSetResourceString(@cxSFilterOperatorNotInList, 'fora de');
  cxSetResourceString(@cxSFilterOperatorYesterday, 'seja ontem');
  cxSetResourceString(@cxSFilterOperatorToday, 'seja hoje');
  cxSetResourceString(@cxSFilterOperatorTomorrow, 'seja amanhã');
  cxSetResourceString(@cxSFilterOperatorLastWeek, 'seja semana passada');
  cxSetResourceString(@cxSFilterOperatorLastMonth, 'seja mês passado');
  cxSetResourceString(@cxSFilterOperatorLastYear, 'seja ano passado');
  cxSetResourceString(@cxSFilterOperatorThisWeek, 'seja esta semana');
  cxSetResourceString(@cxSFilterOperatorThisMonth, 'seja este mês');
  cxSetResourceString(@cxSFilterOperatorThisYear, 'seja este ano');
  cxSetResourceString(@cxSFilterOperatorNextWeek, 'seja a próxima semana');
  cxSetResourceString(@cxSFilterOperatorNextMonth, 'seja o próximo mês');
  cxSetResourceString(@cxSFilterOperatorNextYear, 'seja o próximo ano');
  cxSetResourceString(@cxSFilterAndCaption, 'e');
  cxSetResourceString(@cxSFilterOrCaption, 'ou');
  cxSetResourceString(@cxSFilterNotCaption, 'não');
  cxSetResourceString(@cxSFilterBlankCaption, 'branco');
  cxSetResourceString(@cxSFilterOperatorIsNull, 'esteja em branco');
  cxSetResourceString(@cxSFilterOperatorIsNotNull, 'nao esteja em branco');
  cxSetResourceString(@cxSFilterOperatorBeginsWith, 'comece com');
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith, 'não comece com');
  cxSetResourceString(@cxSFilterOperatorEndsWith, 'termine com');
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith, 'não termine com');
  cxSetResourceString(@cxSFilterOperatorContains, 'contenha');
  cxSetResourceString(@cxSFilterOperatorDoesNotContain, 'nao contenha');
  cxSetResourceString(@cxSFilterBoxAllCaption , '(Todos)');
  cxSetResourceString(@cxSFilterBoxCustomCaption , '(Customizado...)');
  cxSetResourceString(@cxSFilterBoxBlanksCaption , '(Brancos)');
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption , '(não Brancos)');


end.


           



                                                                    
