unit ucmaFrmCaixa;

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
    Tab: TkbmMemTable;
    dsTab: TDataSource;
    Panel1: TPanel;
    dsQVP: TDataSource;
    qVP: TnxQuery;
    qVC: TnxQuery;
    dsQVC: TDataSource;
    cmFechar: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    Panel2: TPanel;
    cmCancela: TdxBarLargeButton;
    LMDSimplePanel3: TLMDSimplePanel;
    cmImprimir: TdxBarLargeButton;
    panAguarde: TLMDSimplePanel;
    LMDLabel5: TLMDLabel;
    mtTot: TkbmMemTable;
    mtTotItem: TIntegerField;
    mtTotDescricao: TStringField;
    mtTotFatTot: TCurrencyField;
    mtTotPagDeb: TCurrencyField;
    dsTot: TDataSource;
    Timer1: TTimer;
    mtTotFatNP: TCurrencyField;
    mtTotTotal: TCurrencyField;
    TabNumero: TAutoIncField;
    TabAberto: TBooleanField;
    TabUsuario: TStringField;
    TabAbertura: TDateTimeField;
    TabFechamento: TDateTimeField;
    TabAcesso: TCurrencyField;
    TabAcessoNaoPago: TCurrencyField;
    TabAcessoDebPago: TCurrencyField;
    TabAcessoQuant: TCurrencyField;
    TabVenda: TCurrencyField;
    TabVendaNaoPago: TCurrencyField;
    TabVendaDebPago: TCurrencyField;
    TabVendaQuant: TCurrencyField;
    TabSuprimento: TCurrencyField;
    TabSangria: TCurrencyField;
    TabSaldoAnt: TCurrencyField;
    TabDescontos: TCurrencyField;
    TabTempoAcesso: TFloatField;
    TabTempoManutencao: TFloatField;
    qTempo: TnxQuery;
    dsTempo: TDataSource;
    qTempoMaquina: TWordField;
    qTempoDias: TFloatField;
    qTempoHoras: TFloatField;
    qTempoMinutos: TFloatField;
    TabObs: TMemoField;
    qHora: TnxQuery;
    mtHora: TkbmMemTable;
    mtHoraHora: TIntegerField;
    mtHoraHoras: TFloatField;
    mtHoraMin: TFloatField;
    dsHora: TDataSource;
    qManut: TnxQuery;
    qManutTempo: TFloatField;
    qManutUsuario: TStringField;
    qManutHoras: TFloatField;
    qManutNomeUsuario: TStringField;
    dsManut: TDataSource;
    qManutMin: TFloatField;
    qTempoQuant: TFloatField;
    qManutQuant: TFloatField;
    CompPrint: TdxComponentPrinter;
    dplComposto: TdxCompositionReportLink;
    dxPrintStyleManager1: TdxPrintStyleManager;
    dxPrintStyleManager1Style1: TdxPSPrintStyle;
    mtEst: TkbmMemTable;
    mtEstSaldoInicial: TFloatField;
    mtEstEntradas: TFloatField;
    mtEstCompras: TFloatField;
    mtEstSaidas: TFloatField;
    mtEstVendas: TFloatField;
    mtEstValorVendas: TCurrencyField;
    tME: TnxTable;
    tMENumSeq: TAutoIncField;
    tMETransacao: TIntegerField;
    tMEProduto: TStringField;
    tMEQuant: TFloatField;
    tMEUnitario: TCurrencyField;
    tMETotal: TCurrencyField;
    tMEItem: TWordField;
    tMEDesconto: TCurrencyField;
    tMEDataMov: TDateTimeField;
    tMEDataPag: TDateTimeField;
    tMEEntrada: TBooleanField;
    tMECancelado: TBooleanField;
    tMEEstoqueAnt: TFloatField;
    tMETipoTran: TWordField;
    tMEContato: TIntegerField;
    tMECaixaMov: TIntegerField;
    tMECaixaPag: TIntegerField;
    tMECategoria: TStringField;
    tMESaldoFinal: TFloatField;
    tProd: TnxTable;
    tProdCodigo: TStringField;
    tProdDescricao: TStringField;
    mtEstDescricao: TStringField;
    mtEstSaldoFinal: TFloatField;
    dsEst: TDataSource;
    mtEstCodigo: TStringField;
    tMEQuantF: TFloatField;
    qVCCategoria: TStringField;
    qVCTotal: TCurrencyField;
    qVCDesconto: TCurrencyField;
    qVCQuant: TFloatField;
    qVCTotFinal: TCurrencyField;
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
    tvRes: TcxGridDBBandedTableView;
    tvResDescricao: TcxGridDBBandedColumn;
    tvResFatTot: TcxGridDBBandedColumn;
    tvResFatNP: TcxGridDBBandedColumn;
    tvResPagDeb: TcxGridDBBandedColumn;
    tvResTotal: TcxGridDBBandedColumn;
    tvResItem: TcxGridDBBandedColumn;
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
    mtEstLucro: TCurrencyField;
    tMECustoU: TCurrencyField;
    procedure cmFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmCancelaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure qTempoCalcFields(DataSet: TDataSet);
    procedure btnTotalizarClick(Sender: TObject);
    procedure qManutCalcFields(DataSet: TDataSet);
    procedure cmImprimirClick(Sender: TObject);
    procedure tMECalcFields(DataSet: TDataSet);
    procedure qVCCalcFields(DataSet: TDataSet);
    procedure tvResDescricaoCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvResFatTotCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvResTotalCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    Acesso,
    AcessoNaoPago,
    AcessoDebPago,
    Venda,
    VendaNaoPago,
    VendaDebPago,
    Suprimento,
    Sangria,
    Descontos,
    TempoAcesso,
    TempoManut : Extended;
    QuantAcesso,
    QuantVenda : Integer;

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

uses ucmaPri, ucmaDM, cmTotCaixa, cmClassesBase, cmIDRecursos, ucmaFrmOpcaoRelCaixa,
  ucmafbTran;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmCaixa.Editar(aTab: TnxTable);
begin
  Timer1.Enabled := True;
  FTab := aTab;
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
  Agora := Now;
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
  end;
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
  FM.RegistraForm(TfbTran);
  FPeriodo := False;
  Tab.Open;
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
var
  Q: TnxQuery;
  Num,
  I,
  CaixaI,
  CaixaF : Integer;
  CustoU : Double;
begin
  Timer1.Enabled := False;
  Application.ProcessMessages;
  panAguarde.Visible := True;
  CaixaI := 0;
  CaixaF := 0;
  Num := 0;
  qTempo.Active := False;
  qVP.Active := False;
  qVC.Active := False;
  qHora.Active := False;
  qManut.Active := False;

  if FPeriodo then begin
    Q := TnxQuery.Create(Self);
    try
      Q.Database := Dados.DB;
      Q.SQL.Add('SELECT MIN(Numero) as CaixaI, MAX(Numero) as CaixaF FROM CAIXA');
      Q.SQL.Add('WHERE (Abertura >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataI.Date))+') AND ' +
                '      (Abertura <  ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataF.Date+1))+')');
      Q.Open;
      CaixaI := Q.FieldByName('CaixaI').AsInteger;
      CaixaF := Q.FieldByName('CaixaF').AsInteger;
    finally
      Q.Free;
    end;
  end else begin
    Tab.Insert;
    TransfDados(FTab, Tab);
    Tab.Post;
    Tab.Edit;
    Num := FTab.FieldByName('Numero').AsInteger;
  end;
  TotalizaCaixa(Dados.DB, Num, CaixaI, CaixaF,
                Acesso, AcessoNaoPago, AcessoDebPago,
                Venda, VendaNaoPago, VendaDebPago,
                Suprimento, Sangria, Descontos, 
                TempoAcesso, TempoManut, QuantAcesso, QuantVenda);

  if Num > 0 then begin
    CaixaI := Num;
    CaixaF := Num;
  end;

  FM.Mostrar(TfbTran, ftran_Caixa, CaixaI);
  TfbTran(FM.FormAtivo).FiltroF := CaixaF;
  FM.FormAtivo.FiltraDados;
  Paginas.ActivePageIndex := 0;

  tProd.First;
  while not tProd.Eof do begin
    tME.SetRange([tProdCodigo.Value, CaixaI], [tProdCodigo.Value, CaixaF]);
    if not (tME.Eof and tME.Bof) then begin
      mtEst.Append;
      mtEstCodigo.Value := tProdCodigo.Value;
      mtEstDescricao.Value := tProdDescricao.Value;
      mtEstSaldoInicial.Value := tMEEstoqueAnt.Value;
      while not tME.Eof do begin
        if not tMECancelado.Value then
        case tMETipoTran.Value of
          ttAcessoVenda,
          ttEstVenda : begin
            mtEstVendas.Value := mtEstVendas.Value + tMEQuant.Value;
            mtEstValorVendas.Value := mtEstValorVendas.Value + tMETotal.Value - tMEDesconto.Value;
            CustoU := tMECustoU.Value;
            with Dados do
            if (CustoU < 0.00009) and tbPro.FindKey([tMEProduto.Value]) then
              CustoU := tbProCustoUnitario.Value;
            mtEstLucro.Value := mtEstLucro.Value + (tMETotal.Value - (CustoU * tMEQuant.Value) - tMEDesconto.Value);
          end;
          ttEstCompra  : mtEstCompras.Value := mtEstCompras.Value + tMEQuant.Value;
          ttEstEntrada : mtEstEntradas.Value := mtEstEntradas.Value + tMEQuant.Value;
          ttEstSaida   : mtEstSaidas.Value := mtEstSaidas.Value + tMEQuant.Value;
        end;
        tME.Next;
      end;
      mtEstSaldoFinal.Value := tMESaldoFinal.Value;  
      mtEst.Post;
    end;
    tProd.Next;
    Application.ProcessMessages;
  end;
  
  mtTot.Open;
  mtTot.EmptyTable;
  mtTot.Append;
  mtTotItem.Value := 1;
  mtTotDescricao.Value := 'Acessos';
  mtTotFatTot.Value := Acesso;
  mtTotFatNP.Value := AcessoNaoPago;
  mtTotPagDeb.Value := AcessoDebPago;
  mtTotTotal.Value := (Acesso-AcessoNaoPago) + AcessoDebPago;
  mtTot.Post;

  mtTot.Open;
  mtTot.Append;
  mtTotItem.Value := 2;
  mtTotDescricao.Value := 'Vendas';
  mtTotFatTot.Value := Venda;
  mtTotFatNP.Value := VendaNaoPago;
  mtTotPagDeb.Value := VendaDebPago;
  mtTotTotal.Value := (Venda-VendaNaoPago) + VendaDebPago;
  mtTot.Post;

  mtTot.Open;
  mtTot.Append;
  mtTotItem.Value := 3;
  mtTotDescricao.Value := 'Total do Caixa';
  mtTotFatTot.Value := Acesso + Venda;
  mtTotFatNP.Value := AcessoNaoPago + VendaNaoPago;
  mtTotPagDeb.Value := AcessoDebPago + VendaDebPago;
  mtTotTotal.Value := ((Acesso-AcessoNaoPago) + AcessoDebPago) +
                      ((Venda-VendaNaoPago) + VendaDebPago);
  mtTot.Post;

  if not FPeriodo then begin
    mtTot.Append;
    mtTotItem.Value := 4;
    mtTotDescricao.Value := 'Saldo Inicial';
    mtTotTotal.Value := TabSaldoAnt.Value;
    mtTot.Post;
  end;  

  mtTot.Append;
  mtTotItem.Value := 5;
  mtTotDescricao.Value := 'Suprimento';
  mtTotTotal.Value := Suprimento;
  mtTot.Post;

  mtTot.Append;
  mtTotItem.Value := 6;
  mtTotDescricao.Value := 'Sangria';
  mtTotTotal.Value := Sangria;
  mtTot.Post;

  if FPeriodo then begin
    mtTot.Append;
    mtTotItem.Value := 7;
    mtTotDescricao.Value := 'Total Final';
    mtTotTotal.Value := (Acesso+AcessoDebPago+Venda+VendaDebPago+Suprimento) -
                        (AcessoNaoPago + VendaNaoPago + Sangria);
    mtTot.Post;
  end else begin 
    mtTot.Append;
    mtTotItem.Value := 7;
    mtTotDescricao.Value := 'Saldo Final';
    mtTotTotal.Value := (Acesso+AcessoDebPago+Venda+VendaDebPago+Suprimento+TabSaldoAnt.Value) -
                        (AcessoNaoPago + VendaNaoPago + Sangria);
    mtTot.Post;
  end;

  mtTot.Append;
  mtTotItem.Value := 8;
  mtTotDescricao.Value := '';
  mtTot.Post;

  mtTot.Append;
  mtTotItem.Value := 9;
  mtTotDescricao.Value := 'Descontos Concedidos';
  mtTotTotal.Value := Descontos;
  mtTot.Post;

  if not FPeriodo then begin
    qTempo.ParamByName('NumCaixa').AsInteger := FTab.FieldByName('Numero').AsInteger;
    qVP.ParamByName('NumCaixa').AsInteger := FTab.FieldByName('Numero').AsInteger;
    qVC.ParamByName('NumCaixa').AsInteger := FTab.FieldByName('Numero').AsInteger;
    qHora.ParamByName('NumCaixa').AsInteger := FTab.FieldByName('Numero').AsInteger;
    qManut.ParamByName('NumCaixa').AsInteger := FTab.FieldByName('Numero').AsInteger;

    qTempo.Prepare;
    qVP.Prepare;
    qVC.Prepare;
    qHora.Prepare;
    qManut.Prepare;
  end else begin
    qVP.SQL[3] := ' (CaixaMov>='+IntToStr(CaixaI)+') AND (CaixaMov<='+IntToStr(CaixaF)+') AND ';
    qVC.SQL[3] := qVP.SQL[3];
    qTempo.SQL[8] := ' (CaixaF>='+IntToStr(CaixaI)+') AND (CaixaF<='+IntToStr(CaixaF)+') ';
    qHora.SQL[30] := ' (CaixaF>='+IntToStr(CaixaI)+') AND (CaixaF<='+IntToStr(CaixaF)+') ';
    qManut.SQL[8] := ' (CaixaF>='+IntToStr(CaixaI)+') AND (CaixaF<='+IntToStr(CaixaF)+') ';
  end;

  qTempo.Open;
  qVP.Open;
  qVC.Open;
  qHora.Open;
  qManut.Open;
  mtHora.Open;
  mtHora.EmptyTable;
  for I := 0 to 23 do
  if qHora.FieldByName('TM'+IntToStr(I)).AsFloat > 0.01 then begin
    mtHora.Append;
    mtHoraHora.Value := I;
    mtHoraMin.Value := qHora.FieldByName('TM'+IntToStr(I)).AsFloat;
    mtHoraHoras.Value := mtHoraMin.Value / 60;
    mtHora.Post;
  end;

  panAguarde.Visible := False;

  if FPeriodo then
    Caption := 'Caixa de '+FormatDateTime('dd/mm/yyyy', edDataI.Date)+' a '+
               FormatDateTime('dd/mm/yyyy', edDataF.Date)
  else
    Caption := 'Caixa de ' + FormatDateTime('dd/mm/yyyy hh:mm', TabAbertura.Value);

  Paginas.Visible := Permitido(daCaiVerAtual);
end;

procedure TFrmCaixa.qTempoCalcFields(DataSet: TDataSet);
begin
  qTempoHoras.Value := qTempoDias.Value * 24;
  qTempoMinutos.Value := qTempoHoras.Value * 60;
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

procedure TFrmCaixa.qManutCalcFields(DataSet: TDataSet);
begin
  qManutHoras.Value := qManutTempo.Value * 24;
  qManutMin.Value := qManutTempo.Value * 24 * 60;
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
      'Caixa ' + TabNumero.AsString + #13#10#13#10 +
      'Abertura   : ' + FormatDateTime('dd/mm/yyyy hh:mm', TabAbertura.Value)+ #13#10 +
      'Fechamento : ' + FormatDateTime('dd/mm/yyyy hh:mm', TabFechamento.Value)+ #13#10 +
      'Funcionário: ' + TabUsuario.Value + #13#10#13#10 +
      'Total Financeiro';
  CompPrint.Preview;
end;

procedure TFrmCaixa.tMECalcFields(DataSet: TDataSet);
begin
  if not tMECancelado.Value then
  if tMETipoTran.Value in [ttAcessoVenda, ttEstVenda, ttEstSaida] then
    tMEQuantF.Value := tMEQuant.Value * -1
  else
    tMEQuantF.Value := tMEQuant.Value;  
  tMESaldoFinal.Value := tMEEstoqueAnt.Value + tMEQuantF.Value;  
end;

procedure TFrmCaixa.qVCCalcFields(DataSet: TDataSet);
begin
  qVCTotFinal.Value := qVCTotal.Value - qVCDesconto.Value;
end;

procedure TFrmCaixa.tvResDescricaoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var V : Variant;
begin
  V := AViewInfo.GridRecord.Values[tvResItem.Index];
  if (not VarIsNull(V)) and ((V=3) or (V=7) or (V=9)) then
    ACanvas.Font.Style := [fsBold];
end;

procedure TFrmCaixa.tvResFatTotCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var V : Variant;
begin
  V := AViewInfo.GridRecord.Values[tvResItem.Index];
  if (not VarIsNull(V)) and ((V=3) or (V=7)) then
    ACanvas.Font.Style := [fsBold];
end;

procedure TFrmCaixa.tvResTotalCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var V : Variant;
begin
  V := AViewInfo.GridRecord.Values[tvResItem.Index];
  if (not VarIsNull(V)) then
  if (V=3) or (V=7) or (V=9) then begin
    ACanvas.Font.Style := [fsBold];
    if V=9 then ACanvas.Font.Color := clRed;
  end;
end;

end.
