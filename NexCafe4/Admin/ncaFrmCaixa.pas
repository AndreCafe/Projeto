unit ncaFrmCaixa;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, 
  dxBar, 
  nxdb, 
  ComCtrls, 
  LMDCustomControl, 
  LMDCustomPanel,
  LMDCustomBevelPanel, 
  LMDSimplePanel, 
  LMDControl, 
  LMDBaseControl, 
  LMDBaseGraphicControl, 
  LMDBaseLabel,
  LMDCustomLabel, 
  LMDLabel, 
  LMDFormDisplay, 
  StdCtrls,
  DBCtrls, 
  LMDBaseGraphicButton,
  LMDCustomSpeedButton, 
  LMDSpeedButton, 
  dxPSCore, 
  dxPSGlbl, 
  dxPSUtl, 
  dxPSEngn, 
  dxPrnPg,
  dxBkgnd, 
  dxWrap, 
  dxPrnDev, 
  dxPSCompsProvider, 
  dxPSFillPatterns,
  dxPSEdgePatterns, 
  dxPgsDlg, 
  cxStyles, 
  cxCustomData, 
  cxGraphics, 
  cxFilter,
  cxData, 
  cxDataStorage, 
  cxEdit, 
  cxDBData, 
  cxMaskEdit, 
  cxCurrencyEdit,
  cxTextEdit, 
  cxGridCustomTableView, 
  cxGridTableView,
  cxGridBandedTableView, 
  cxGridDBBandedTableView, 
  cxClasses, 
  cxControls,
  cxGridCustomView, 
  cxGridLevel, 
  cxGrid, 
  cxPC, 
  cxDBLookupComboBox,
  dxPScxCommon, 
  dxPScxGrid6Lnk, 
  cxContainer, 
  cxMemo, 
  cxDBEdit,
  cxGridDBTableView, dxBarExtItems, 
  cxVGrid, cxDBVGrid, cxInplaceContainer, cxCalendar, ufmFormBase,
  cxTimeEdit, cxImageComboBox, cxGridChartView, cxGridDBChartView, cxSpinEdit,
  cxLabel, cxGridCustomPopupMenu, cxGridPopupMenu;
  

type
  TFrmCaixa = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    Panel2: TPanel;
    cmCancela: TdxBarLargeButton;
    cmImprimir: TdxBarLargeButton;
    panAguarde: TLMDSimplePanel;
    LMDLabel5: TLMDLabel;
    Timer1: TTimer;
    CompPrint: TdxComponentPrinter;
    dplComposto: TdxCompositionReportLink;
    dxPrintStyleManager1: TdxPrintStyleManager;
    dxPrintStyleManager1Style1: TdxPSPrintStyle;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyleRepository5: TcxStyleRepository;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyleRepository6: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyleRepository7: TcxStyleRepository;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyleRepository8: TcxStyleRepository;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    Paginas: TcxPageControl;
    tsResumo: TcxTabSheet;
    gridRes: TcxGrid;
    glResumo: TcxGridLevel;
    tsVendas: TcxTabSheet;
    gridEst: TcxGrid;
    tvEst: TcxGridDBTableView;
    tvEstDescricao1: TcxGridDBColumn;
    tvEstSaldoInicial1: TcxGridDBColumn;
    tvEstEntradas1: TcxGridDBColumn;
    tvEstCompras1: TcxGridDBColumn;
    tvEstSaidas1: TcxGridDBColumn;
    tvEstVendas1: TcxGridDBColumn;
    tvEstValorVendas1: TcxGridDBColumn;
    tvEstSaldoFinal1: TcxGridDBColumn;
    glEst: TcxGridLevel;
    tsVC: TcxTabSheet;
    gridVC: TcxGrid;
    tvVC: TcxGridDBTableView;
    tvVCCategoria1: TcxGridDBColumn;
    tvVCQuant1: TcxGridDBColumn;
    tvVCTotFinal1: TcxGridDBColumn;
    glVC: TcxGridLevel;
    dplResFin: TdxGridReportLink;
    dplTempoMaq: TdxGridReportLink;
    dplTempoHora: TdxGridReportLink;
    dplManutencao: TdxGridReportLink;
    dplEstoque: TdxGridReportLink;
    dplVendasCateg: TdxGridReportLink;
    edDataI: TdxBarDateCombo;
    edDataF: TdxBarDateCombo;
    btnTotalizar: TdxBarLargeButton;
    cxStyle41: TcxStyle;
    VG: TcxDBVerticalGrid;
    VGDBEditorRow1: TcxDBEditorRow;
    VGDBEditorRow2: TcxDBEditorRow;
    VGFechamento: TcxDBEditorRow;
    VGDBEditorRow4: TcxDBEditorRow;
    vgObs: TcxDBEditorRow;
    LMDSimplePanel1: TLMDSimplePanel;
    FM: TFormManager;
    dplTran: TdxGridReportLink;
    tvEstLucro: TcxGridDBColumn;
    tvRes: TcxGridDBTableView;
    tvResDescricao: TcxGridDBColumn;
    tvResFaturamento: TcxGridDBColumn;
    tvResDebitado: TcxGridDBColumn;
    tvResRecebido: TcxGridDBColumn;
    tvResPgDebito: TcxGridDBColumn;
    tvResTotal: TcxGridDBColumn;
    tvResItem: TcxGridDBColumn;
    dsCaixa: TDataSource;
    dplGratis: TdxGridReportLink;
    tsImp: TcxTabSheet;
    gridImp: TcxGrid;
    tvImp: TcxGridDBTableView;
    tvImpNomeTipoImp: TcxGridDBColumn;
    tvImpQuant: TcxGridDBColumn;
    tvImpValor: TcxGridDBColumn;
    glImp: TcxGridLevel;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    LMDSimplePanel8: TLMDSimplePanel;
    LMDSimplePanel9: TLMDSimplePanel;
    dplCliente: TdxGridReportLink;
    cxTabSheet3: TcxTabSheet;
    TVSessoes: TcxGridDBTableView;
    glSessoes: TcxGridLevel;
    gridSessoes: TcxGrid;
    LMDSimplePanel10: TLMDSimplePanel;
    TVSessoesInicio: TcxGridDBColumn;
    TVSessoesTermino: TcxGridDBColumn;
    TVSessoesMinutosR: TcxGridDBColumn;
    TVSessoesMaq: TcxGridDBColumn;
    TVSessoesTipoCli: TcxGridDBColumn;
    TVSessoesNomeCliente: TcxGridDBColumn;
    TVSessoesFuncI: TcxGridDBColumn;
    TVSessoesFuncF: TcxGridDBColumn;
    TVSessoesCaixaI: TcxGridDBColumn;
    TVSessoesCaixaF: TcxGridDBColumn;
    TVSessoesTranI: TcxGridDBColumn;
    TVSessoesTranF: TcxGridDBColumn;
    TVSessoesEndereco: TcxGridDBColumn;
    TVSessoesBairro: TcxGridDBColumn;
    TVSessoesCidade: TcxGridDBColumn;
    TVSessoesUF: TcxGridDBColumn;
    TVSessoesCEP: TcxGridDBColumn;
    TVSessoesCpf: TcxGridDBColumn;
    TVSessoesRg: TcxGridDBColumn;
    TVSessoesTelefone: TcxGridDBColumn;
    TVSessoesEmail: TcxGridDBColumn;
    TVSessoesDataNasc: TcxGridDBColumn;
    TVSessoesCelular: TcxGridDBColumn;
    cxGridPopupMenu1: TcxGridPopupMenu;
    dplSessoes: TdxGridReportLink;
    TVSessoesUsername: TcxGridDBColumn;
    tvEstPremioFid: TcxGridDBColumn;
    tsPrePos: TcxTabSheet;
    dplPrePos: TdxGridReportLink;
    gridPrePos: TcxGrid;
    TVPrePos: TcxGridDBTableView;
    glPrePos: TcxGridLevel;
    TVPrePosTipo: TcxGridDBColumn;
    TVPrePosQuant: TcxGridDBColumn;
    TVPrePosValor: TcxGridDBColumn;
    tvTeste: TcxGridDBTableView;
    cxStyle42: TcxStyle;
    TVIPs: TcxGridDBColumn;
    dxBarButton1: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmCancelaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnTotalizarClick(Sender: TObject);
    procedure cmImprimirClick(Sender: TObject);
    procedure tvResDescricaoCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvResFaturamentoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvResTotalCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVSessoesMinutosRGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVSessoesInicioGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure dxBarButton1Click(Sender: TObject);
  private
    FPeriodo : Boolean;
    { Private declarations }
  public
    FTab : TnxTable;
    FImprimir : Boolean;
    procedure Editar(aTab: TnxTable; aImprimir: Boolean = False);
    procedure CaixaPeriodo;
    { Public declarations }
  end;

var
  FrmCaixa: TFrmCaixa;

implementation

uses 
  ncaFrmPri, 
  ncaDM,
  ncClassesBase,
  ncIDRecursos, 
  ncaFrmOpcaoRelCaixa,
  ncafbTran, ncDMCaixa;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmCaixa.Editar(aTab: TnxTable; aImprimir: Boolean = False);
begin
  FImprimir := aImprimir;
  FPeriodo := False;
  FTab := aTab;
  dsCaixa.Dataset := FTab;
  if aTab.FieldByName('Aberto').AsBoolean then
    vgFechamento.Visible := False else
    vgObs.Properties.EditProperties.ReadOnly := True;
//  Paginas.Visible := Permitido(daCaiVerAtual);
  tvEstLucro.Visible := Permitido(daVerLucroProdutos);
  cmImprimir.Enabled := Permitido(daCaiVerAtual);
  ShowModal;
end;

procedure TFrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FM.Clear;
  Action := caFree;
end;

procedure TFrmCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Esc   : Close;
  end;
end;

procedure TFrmCaixa.FormCreate(Sender: TObject);
begin
  FImprimir := False;
  FPeriodo := False;
end;

procedure TFrmCaixa.FormShow(Sender: TObject);
begin
  if not FPeriodo then 
    Timer1.Enabled := True;
  Paginas.ActivePageIndex := 0;
end;

procedure TFrmCaixa.cmCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCaixa.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  panAguarde.Visible := True;
  Application.ProcessMessages;

  dmCaixa.nxDB.Active := False;
  dmCaixa.nxDB.Session := Dados.Session;
  dmCaixa.AbreConn;
  FM.RegistraForm(TfbTran);

  if FPeriodo then 
    dmCaixa.Processa(0, True, edDataI.Date, edDataF.Date) 
  else begin
    dmCaixa.Processa(FTab.FieldByName('ID').AsInteger, False, 0, 0);
    dsCaixa.Dataset.FieldByName('ID').Alignment := taLeftJustify;
  end;

  FM.Mostrar(TfbTran, ftran_Caixa, dmCaixa.CaixaI);
  TfbTran(FM.FormAtivo).FiltroF := dmCaixa.CaixaF;
  FM.FormAtivo.FiltraDados;
  with TfbTran(FM.FormAtivo) do begin
    TV.OptionsView.Footer := True;
    TV.DataController.DataModeController.GridMode := False;
  end;
  

  dplTran.Component := TfbTran(FM.FormAtivo).Grid;
  
  Paginas.ActivePageIndex := 0;

  panAguarde.Visible := False;

  if FPeriodo then
    Caption := 'Caixa de '+FormatDateTime('dd/mm/yyyy', edDataI.Date)+' a '+
               FormatDateTime('dd/mm/yyyy', edDataF.Date)
  else
    Caption := 'Caixa de ' + FormatDateTime('dd/mm/yyyy hh:mm', FTab.FieldByName('Abertura').AsDateTime);

  Paginas.Visible := Permitido(daCaiVerAtual);
  if FImprimir then
  try
    cmImprimirClick(nil);
  finally
    FImprimir := False;  
  end;
end;

procedure TFrmCaixa.CaixaPeriodo;
begin
  edDataI.Visible := ivAlways;
  edDataF.Visible := ivAlways;
  btnTotalizar.Visible := ivAlways;
  Paginas.Visible := False;
  FPeriodo := True;
  VG.Visible := False;
  panAguarde.Visible := False;
  ShowModal;
end;

procedure TFrmCaixa.btnTotalizarClick(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFrmCaixa.cmImprimirClick(Sender: TObject);
const
  TFSt : Array[Boolean] of Char = ('N', 'S');
  
var
  AT: TArrayTipoTran;
  I : Integer;
  SL : TStrings;
  S : String;
begin
  SL := TStringList.Create;
  FillChar(AT, SizeOf(AT), 0);
  AT[0] := True;
  S := ExtractFilePath(ParamStr(0))+'caixa.ini';
  if FileExists(S) then begin
    SL.LoadFromFile(S);
    for I := 0 to 5 do
      AT[I] := (SL.Values['Rel'+IntToStr(I)]='S');
  end;

  if not FImprimir then begin
    TFrmOpcaoRelCaixa.Create(Self).Selecionar(@AT);

    for I := 0 to 5 do 
      SL.Values['Rel'+IntToStr(I)] := TFSt[AT[I]];
    
    SL.SaveToFile(S);
  end;
  SL.Free;

  dplComposto.Items.Clear;
  if AT[0] then
    dplComposto.Items.AddLink(dplResFin);
  if AT[1] then
    dplComposto.Items.AddLink(dplEstoque);
  if AT[2] then
    dplComposto.Items.AddLink(dplVendasCateg);
  if AT[3] then
    dplComposto.Items.AddLink(dplTran);  
  if AT[4] then 
    dplComposto.items.AddLink(dplSessoes);
  if AT[5] then 
    dplComposto.items.AddLink(dplPrePos);
    

  if FPeriodo then
    dplResFin.ReportTitle.Text :=
      'Caixa de ' + FormatDateTime('dd/mm/yyyy', edDataI.Date) + ' a ' +
                    FormatDateTime('dd/mm/yyyy', edDataF.Date) + #13#10 + #13#10 +
      'Total Financeiro'
  else
    dplResFin.ReportTitle.Text :=
      'Caixa ' + FTab.FieldByName('ID').AsString + #13#10#13#10 +
      'Abertura   : ' + FormatDateTime('dd/mm/yyyy hh:mm', FTab.FieldByName('Abertura').AsDateTime)+ #13#10 +
      'Fechamento : ' + FormatDateTime('dd/mm/yyyy hh:mm', FTab.FieldByName('Fechamento').AsDateTime) + #13#10 +
      'Funcionário: ' + FTab.FieldByName('Usuario').AsString + #13#10#13#10 +
      'Total Financeiro';
  CompPrint.Preview;
end;

procedure TFrmCaixa.dxBarButton1Click(Sender: TObject);
begin
  dmCaixa.repCaixa.ShowReport;
end;

procedure TFrmCaixa.tvResDescricaoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var V : Variant;
begin
  V := AViewInfo.GridRecord.Values[tvResItem.Index];
  if (not VarIsNull(V)) and ((V=4) or (V>=8)) then
    ACanvas.Font.Style := [fsBold];
end;

procedure TFrmCaixa.tvResFaturamentoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var V : Variant;
begin
  V := AViewInfo.GridRecord.Values[tvResItem.Index];
  if (not VarIsNull(V)) and ((V=4) or (V=8)) then
    ACanvas.Font.Style := [fsBold];
end;

procedure TFrmCaixa.tvResTotalCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var V : Variant;
begin
  V := AViewInfo.GridRecord.Values[tvResItem.Index];
  if (not VarIsNull(V)) then
  if (V=4) or (V>=8) then begin
    ACanvas.Font.Style := [fsBold];
    if (V>=10) then ACanvas.Font.Color := clRed;
  end;
end;

procedure TFrmCaixa.TVSessoesInicioGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var 
  V: Variant;  
begin
  V := ARecord.Values[Sender.Index];
  if (V=null) or (V<10) then
    AText := '';
end;

procedure TFrmCaixa.TVSessoesMinutosRGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[TVSessoesMinutosR.Index];
  if V<>null then
    AText := MinutosToHMSStr(V);
end;

end.
