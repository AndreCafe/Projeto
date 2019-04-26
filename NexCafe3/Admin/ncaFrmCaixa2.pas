unit ncaFrmCaixa2;

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
  LMDDBLabel,
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
  dxPScxGridLnk, 
  cxContainer, 
  cxMemo, 
  cxDBEdit,
  cxGridDBTableView, dxBarExtItems, ovcbase, ovcef, ovcpb,
  ovcpf, cxVGrid, cxDBVGrid, cxInplaceContainer, cxCalendar, ufmFormBase,
  cxTimeEdit, cxImageComboBox;
  

type
  TFrmCaixa = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmFechar: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    Panel2: TPanel;
    cmCancela: TdxBarLargeButton;
    LMDSimplePanel3: TLMDSimplePanel;
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
    tsTempos: TcxTabSheet;
    pagTempos: TcxPageControl;
    tsTempoPorMaq: TcxTabSheet;
    gridTMaq: TcxGrid;
    tvTMaq: TcxGridDBBandedTableView;
    tvTMaqMaquina1: TcxGridDBBandedColumn;
    tvTMaqHoras1: TcxGridDBBandedColumn;
    tvTMaqMinutos1: TcxGridDBBandedColumn;
    tvTMaqQuant1: TcxGridDBBandedColumn;
    glTMaq: TcxGridLevel;
    tsTempoHorario: TcxTabSheet;
    gridTHora: TcxGrid;
    tvTHora: TcxGridDBBandedTableView;
    tvTHoraHora1: TcxGridDBBandedColumn;
    tvTHoraHoras1: TcxGridDBBandedColumn;
    tvTHoraMin1: TcxGridDBBandedColumn;
    glTHora: TcxGridLevel;
    tsTempoManut: TcxTabSheet;
    gridTManut: TcxGrid;
    tvTManut: TcxGridDBBandedTableView;
    tvTManutHoras1: TcxGridDBBandedColumn;
    tvTManutMin1: TcxGridDBBandedColumn;
    tvTManutNomeUsuario1: TcxGridDBBandedColumn;
    tvTManutQuant1: TcxGridDBBandedColumn;
    glTManut: TcxGridLevel;
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
    VGDBEditorRow3: TcxDBEditorRow;
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
    pagIsentos: TcxTabSheet;
    dsCaixa: TDataSource;
    procedure cmFecharClick(Sender: TObject);
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
  private
    FPeriodo : Boolean;
    { Private declarations }
  public
    FTab : TnxTable;
    procedure Editar(aTab: TnxTable);
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

procedure TFrmCaixa.Editar(aTab: TnxTable);
begin
  FPeriodo := False;
  Timer1.Enabled := True;
  FTab := aTab;
  dsCaixa.Dataset := FTab;
  if not aTab.FieldByName('Aberto').AsBoolean then begin
    cmFechar.Visible := ivNever;
    vgObs.Properties.EditProperties.ReadOnly := True;
  end;
  cmFechar.Enabled := Permitido(daCaiAbrirFechar);
  Paginas.Visible := Permitido(daCaiVerAtual);
  tvEstLucro.Visible := Permitido(daVerLucroProdutos);
  cmImprimir.Enabled := Permitido(daCaiVerAtual);
  FM.Mostrar(TfBTran, ftran_Caixa, FTab.FieldByName('Numero').AsInteger);
  dplTran.Component := TfbTran(FM.FormAtivo).Grid;
  ShowModal;
end;

procedure TFrmCaixa.cmFecharClick(Sender: TObject);
var 
  Agora: TDateTime;
  SIndex : String;
begin
{ Agora := Now;
  if (Agora < FTab.FieldByName('Abertura').AsDateTime ) then
  begin
    Beep;
    ShowMessage('Data ou Hora de fechamento anterior a abertura!');
    Exit;
  end;

  with Dados do begin
    SIndex := tbTran.IndexName;
    tbTran.IndexName := 'IPagto';
    try
      tbTran.SetRange([spAguardaPagto], [spAguardaPagto]);
      if tbTran.RecordCount>0 then begin
        Beep;
        ShowMessage('Não é possível fechar o caixa. Existem itens aguardando pagamento');
        Exit;
      end;
    finally
      tbTran.CancelRange;  
      tbTran.IndexName := SIndex;  
    end;
  end;

  if not SimNaoH('Deseja realmente fechar o caixa ?', Handle) then Exit;

  Tab.Post;

  Dados.DB.StartTransactionWith([FTab]);;
  try
    FTab.Edit;
    FTab.FieldByName('Aberto').AsBoolean := False;
    FTab.FieldByName('Fechamento').AsDateTime := Now;
    FTab.FieldByName('Obs').Value := TabObs.Value;
    
    FTab.FieldByName('Acesso').AsFloat := Acesso;
    FTab.FieldByName('AcessoNaoPago').AsFloat := AcessoNaoPago;
    FTab.FieldByName('AcessoDebPago').AsFloat := AcessoDebPago;
    FTab.FieldByName('Venda').AsFloat := Venda;
    FTab.FieldByName('VendaNaoPago').AsFloat := VendaNaoPago;
    FTab.FieldByName('VendaDebPago').AsFloat := VendaDebPago;
    FTab.FieldByName('Suprimento').AsFloat := Suprimento;
    FTab.FieldByName('Sangria').AsFloat := Sangria;
    FTab.FieldByName('Descontos').AsFloat := Descontos;
    FTab.FieldByName('TempoAcesso').AsFloat := TempoAcesso;
    FTab.FieldByName('TempoManutencao').AsFloat := TempoManut;
    FTab.FieldByName('AcessoQuant').AsInteger := QuantAcesso;
    FTab.FieldByName('VendaQuant').AsInteger := QuantVenda;

    FTab.Post;

    Dados.DB.Commit;
    
    DiaAberto := 0;
    NumAberto := -1;
    cmFechar.Visible := ivNever;
    vgObs.Properties.EditProperties.ReadOnly := True;
    Tab.Edit;
    TabFechamento.Value := FTab.FieldByName('Fechamento').AsDateTime;
    Tab.Post;
  except
    Dados.DB.Rollback;
    Raise;
  end; }
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
  dmCaixa.nxDB.Session := Dados.Session;
  FM.RegistraForm(TfbTran);
  FPeriodo := False;
end;

procedure TFrmCaixa.FormShow(Sender: TObject);
begin
  Paginas.ActivePageIndex := 0;
end;

procedure TFrmCaixa.cmCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCaixa.Timer1Timer(Sender: TObject);
var DC: TDadosCaixa;
begin
  Timer1.Enabled := False;
  panAguarde.Visible := True;
  Application.ProcessMessages;

  FillChar(DC, SizeOf(DC), 0);
  if not FPeriodo then begin
    DC.dcID := FTab.FieldByName('ID').AsInteger;
    DC.dcAbertura := FTab.FieldByName('Abertura').AsDateTime;
    DC.dcFechamento := FTab.FieldByName('Fechamento').AsDateTime;
    DC.dcSaldoInicial := FTab.FieldByName('SaldoAnt').AsCurrency;
    DC.dcUsuario := FTab.FieldByname('Usuario').AsString;
  end;

  dmCaixa.Processa(FPeriodo, DC, edDataI.Date, edDataF.Date);

  FM.Mostrar(TfbTran, ftran_Caixa, dmCaixa.CaixaI);
  TfbTran(FM.FormAtivo).FiltroF := dmCaixa.CaixaF;
  FM.FormAtivo.FiltraDados;
  Paginas.ActivePageIndex := 0;

  panAguarde.Visible := False;

  if FPeriodo then
    Caption := 'Caixa de '+FormatDateTime('dd/mm/yyyy', edDataI.Date)+' a '+
               FormatDateTime('dd/mm/yyyy', edDataF.Date)
  else
    Caption := 'Caixa de ' + FormatDateTime('dd/mm/yyyy hh:mm', FTab.FieldByName('Abertura').AsDateTime);

  Paginas.Visible := Permitido(daCaiVerAtual);
end;

procedure TFrmCaixa.CaixaPeriodo;
begin
  cmFechar.Visible := ivNever;
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
    for I := 0 to 6 do
      AT[I] := (SL.Values['Rel'+IntToStr(I)]='S');
  end;

  TFrmOpcaoRelCaixa.Create(Self).Selecionar(@AT);

  for I := 0 to 6 do 
    SL.Values['Rel'+IntToStr(I)] := TFSt[AT[I]];
    
  SL.SaveToFile(S);
  SL.Free;

  dplComposto.Items.Clear;
  if AT[0] then
    dplComposto.Items.AddLink(dplResFin);
  if AT[1] then
    dplComposto.Items.AddLink(dplTempoMaq);
  if AT[2] then
    dplComposto.Items.AddLink(dplTempoHora);
  if AT[3] then
    dplComposto.Items.AddLink(dplManutencao);
  if AT[4] then
    dplComposto.Items.AddLink(dplEstoque);
  if AT[5] then
    dplComposto.Items.AddLink(dplVendasCateg);
  if AT[6] then
    dplComposto.Items.AddLink(dplTran);  
    
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

procedure TFrmCaixa.tvResDescricaoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var V : Variant;
begin
  V := AViewInfo.GridRecord.Values[tvResItem.Index];
  if (not VarIsNull(V)) and ((V=4) or (V=8) or (V=10) or (V=11)) then
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
  if (V=4) or (V=8) or (V=10) or (V=11) then begin
    ACanvas.Font.Style := [fsBold];
    if (V=10) or (V=11) then ACanvas.Font.Color := clRed;
  end;
end;

end.
