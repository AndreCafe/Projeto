unit uCMFrmCaixa;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp,
  ExtCtrls, dxBar, nxdb, ComCtrls, dxTL, dxDBCtrl, dxDBGrid, dxExEdtr,
  dxBarExtItems, dxEdLib,
  dxEditor,
  dxDBELib,
  LMDCustomControl, LMDCustomPanel,
  uCMfbgTran,
  LMDCustomBevelPanel, LMDSimplePanel, dxPageControl, LMDDBLabel,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, dxDBTLCl, dxGrClms, LMDFormDisplay, StdCtrls,
  DBCtrls, OvcBase, OvcEF, OvcPB, OvcPF, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, dxPSCore, dxPSdxTLLnk,
  dxPSdxDBCtrlLnk, dxPSdxDBGrLnk, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPgsDlg;

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
    Paginas: TdxPageControl;
    dxTabSheet2: TdxTabSheet;
    dxTabSheet3: TdxTabSheet;
    gridVP: TdxDBGrid;
    gridVPDescricao: TdxDBGridMaskColumn;
    gridVPQuant: TdxDBGridMaskColumn;
    gridVPTotal: TdxDBGridMaskColumn;
    gridVC: TdxDBGrid;
    gridVCCategoria: TdxDBGridMaskColumn;
    gridVCQuant: TdxDBGridMaskColumn;
    gridVCTotal: TdxDBGridMaskColumn;
    LMDSimplePanel1: TLMDSimplePanel;
    pagCab: TdxPageControl;
    tsCaixa: TdxTabSheet;
    tsPeriodo: TdxTabSheet;
    dxEditStyleController1: TdxEditStyleController;
    tsResumo: TdxTabSheet;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDLabel2: TLMDLabel;
    LMDLabel3: TLMDLabel;
    LMDLabel4: TLMDLabel;
    LMDDBLabel1: TLMDDBLabel;
    LMDDBLabel2: TLMDDBLabel;
    LMDDBLabel3: TLMDDBLabel;
    lbNum: TLMDDBLabel;
    cmImprimir: TdxBarLargeButton;
    panAguarde: TLMDSimplePanel;
    LMDLabel5: TLMDLabel;
    mtTot: TkbmMemTable;
    mtTotItem: TIntegerField;
    mtTotDescricao: TStringField;
    mtTotFatTot: TCurrencyField;
    mtTotPagDeb: TCurrencyField;
    gridResumo: TdxDBGrid;
    dsTot: TDataSource;
    gridResumoDescricao: TdxDBGridMaskColumn;
    gridResumoFatTot: TdxDBGridCurrencyColumn;
    gridResumoFatNP: TdxDBGridMaskColumn;
    gridResumoPagDeb: TdxDBGridColumn;
    gridResumoTotal: TdxDBGridColumn;
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
    gridResumoItem: TdxDBGridColumn;
    tsTransacoes: TdxTabSheet;
    Tempos: TdxTabSheet;
    qTempo: TnxQuery;
    dsTempo: TDataSource;
    qTempoMaquina: TWordField;
    qTempoDias: TFloatField;
    qTempoHoras: TFloatField;
    qTempoMinutos: TFloatField;
    fdTran: TLMDFormDisplay;
    TabObs: TMemoField;
    tsObs: TdxTabSheet;
    edObs: TDBMemo;
    btnTotalizar: TLMDSpeedButton;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDLabel8: TLMDLabel;
    LMDLabel9: TLMDLabel;
    edDataI: TOvcPictureField;
    OvcController1: TOvcController;
    edDataF: TOvcPictureField;
    dxPageControl1: TdxPageControl;
    dxTabSheet1: TdxTabSheet;
    dxTabSheet4: TdxTabSheet;
    dxTabSheet5: TdxTabSheet;
    gridTempo: TdxDBGrid;
    gridTempoMaquina: TdxDBGridMaskColumn;
    gridTempoHoras: TdxDBGridMaskColumn;
    gridTempoMin: TdxDBGridColumn;
    qHora: TnxQuery;
    mtHora: TkbmMemTable;
    mtHoraHora: TIntegerField;
    mtHoraHoras: TFloatField;
    mtHoraMin: TFloatField;
    dsHora: TDataSource;
    gridHora: TdxDBGrid;
    gridHoraHora: TdxDBGridColumn;
    gridHoraHoras: TdxDBGridMaskColumn;
    gridHoraMin: TdxDBGridMaskColumn;
    qManut: TnxQuery;
    qManutTempo: TFloatField;
    qManutUsuario: TStringField;
    qManutHoras: TFloatField;
    qManutNomeUsuario: TStringField;
    gridManut: TdxDBGrid;
    dsManut: TDataSource;
    gridManutHoras: TdxDBGridColumn;
    gridManutMin: TdxDBGridColumn;
    gridManutNomeUsuario: TdxDBGridLookupColumn;
    qManutMin: TFloatField;
    gridTempoColumn4: TdxDBGridColumn;
    qTempoQuant: TFloatField;
    qManutQuant: TFloatField;
    gridManutColumn4: TdxDBGridColumn;
    CompPrint: TdxComponentPrinter;
    dplResFin: TdxDBGridReportLink;
    dplTempoMaq: TdxDBGridReportLink;
    dplTempoHora: TdxDBGridReportLink;
    dplManutencao: TdxDBGridReportLink;
    dplVendasCateg: TdxDBGridReportLink;
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
    dxTabSheet6: TdxTabSheet;
    gridEst: TdxDBGrid;
    dsEst: TDataSource;
    mtEstCodigo: TStringField;
    gridEstDescricao: TdxDBGridMaskColumn;
    gridEstSaldoInicial: TdxDBGridMaskColumn;
    gridEstEntradas: TdxDBGridMaskColumn;
    gridEstCompras: TdxDBGridMaskColumn;
    gridEstSaidas: TdxDBGridMaskColumn;
    gridEstVendas: TdxDBGridMaskColumn;
    gridEstValorVendas: TdxDBGridCurrencyColumn;
    gridEstSaldoFinal: TdxDBGridMaskColumn;
    tMEQuantF: TFloatField;
    dplEstoque: TdxDBGridReportLink;
    qVCCategoria: TStringField;
    qVCTotal: TCurrencyField;
    qVCDesconto: TCurrencyField;
    qVCQuant: TFloatField;
    qVCTotFinal: TCurrencyField;
    procedure cmFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InspSaldoFinalDrawCaption(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure InspSaldoFinalDrawValue(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmCancelaClick(Sender: TObject);
    procedure InspDescontosDrawCaption(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure InspDescontosDrawValue(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure gridResumoDescricaoCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure gridResumoTotalCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure gridResumoFatTotCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure qTempoCalcFields(DataSet: TDataSet);
    procedure btnTotalizarClick(Sender: TObject);
    procedure qManutCalcFields(DataSet: TDataSet);
    procedure cmImprimirClick(Sender: TObject);
    procedure tMECalcFields(DataSet: TDataSet);
    procedure qVCCalcFields(DataSet: TDataSet);
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

    FrmAcessos : TfbgTran;
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

uses uCMFrmPri, uCMDados, cmTotCaixa, cmClassesBase, cmIDRecursos, uCMFrmOpcaoRelCaixa;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmCaixa.Editar(aTab: TnxTable);
begin
  pagCab.ActivePageIndex := 0;
  Timer1.Enabled := True;
  FrmAcessos := TfbgTran.Create(Self);
  FTab := aTab;
  if not aTab.FieldByName('Aberto').AsBoolean then begin
    cmFechar.Visible := ivNever;
    edObs.ReadOnly := True;
  end;
  cmFechar.Enabled := Permitido(daCaiAbrirFechar);
  Paginas.Visible := Permitido(daCaiVerAtual);
  cmImprimir.Enabled := Permitido(daCaiVerAtual);
  
  ShowModal;
end;

procedure TFrmCaixa.cmFecharClick(Sender: TObject);
var Agora: TDateTime;
begin
  Agora := Now;
  if (Agora < FTab.FieldByName('Abertura').AsDateTime ) then
  begin
    Beep;
    ShowMessage('Data ou Hora de fechamento anterior a abertura!');
    Exit;
  end;

  with Dados do begin
    tbTran.IndexName := 'IPagto';
    tbTran.SetRange([spAguardaPagto], [spAguardaPagto]);
    if tbTran.RecordCount>0 then begin
      Beep;
      ShowMessage('Não é possível fechar o caixa. Existem itens aguardando pagamento');
      Exit;
    end;
  end;

  if MessageDlg('Deseja realmente fechar o caixa ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

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
  except
    Dados.DB.Rollback;
    Raise;
  end;
  Close;
end;

procedure TFrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Esc   : Close;
  end;
end;

procedure TFrmCaixa.InspSaldoFinalDrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := [fsBold];
end;

procedure TFrmCaixa.InspSaldoFinalDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := [fsBold];
  AFont.Size  := 12;
end;

procedure TFrmCaixa.FormCreate(Sender: TObject);
begin
  FrmAcessos := nil;
  FPeriodo := False;
  Tab.Open;
end;

procedure TFrmCaixa.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  Paginas.ActivePageIndex := 0;
end;

procedure TFrmCaixa.cmCancelaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCaixa.InspDescontosDrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Color := clRed;
end;

procedure TFrmCaixa.InspDescontosDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Color := clRed;
end;

procedure TFrmCaixa.Timer1Timer(Sender: TObject);
var
  Q: TnxQuery;
  Num,
  I,
  CaixaI,
  CaixaF : Integer;
begin
  Timer1.Enabled := False;
  Application.ProcessMessages;
  panAguarde.Visible := True;
  Q := nil;
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
      Q.SQL.Add('WHERE (Abertura >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataI.AsDateTime))+') AND ' +
                '      (Abertura <  ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edDataF.AsDateTime+1))+')');
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
  TotalizaCaixa(Dados.DB,
                Num, CaixaI, CaixaF,
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
                TempoManut,
                QuantAcesso,
                QuantVenda);

  if Num > 0 then begin
    CaixaI := Num;
    CaixaF := Num;
  end;

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

  if FrmAcessos<>nil then begin
    FrmAcessos.Inicializar(True, FiltroCaixa, FTab.FieldByName('Numero').AsInteger);
    fdTran.AddForm(FrmAcessos, True);
  end;  

  if FPeriodo then
    Caption := 'Caixa de '+FormatDateTime('dd/mm/yyyy', edDataI.AsDateTime)+' a '+
               FormatDateTime('dd/mm/yyyy', edDataF.AsDateTime)
  else
    Caption := 'Caixa de ' + FormatDateTime('dd/mm/yyyy hh:mm', TabAbertura.Value);

  Paginas.Visible := Permitido(daCaiVerAtual);
end;

procedure TFrmCaixa.gridResumoDescricaoCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  V : Variant;
begin
  AColor := gridResumoDescricao.Color;
  AFont.Color := gridResumoDescricao.Font.Color;
  V := ANode.Values[gridResumoItem.Index];
  if (not VarIsNull(V)) and ((V=3) or (V=7) or (V=9)) then
    AFont.Style := [fsBold];
end;

procedure TFrmCaixa.gridResumoTotalCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  V : Variant;
begin
  AColor := gridResumoTotal.Color;
  AFont.Color := gridResumoTotal.Font.Color;
  V := ANode.Values[gridResumoItem.Index];
  if (not VarIsNull(V)) then
  if (V=3) or (V=7) or (V=9) then begin
    AFont.Style := [fsBold];
    if V=9 then AFont.Color := clRed;
  end;  
end;

procedure TFrmCaixa.gridResumoFatTotCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  V : Variant;
begin
  V := ANode.Values[gridResumoItem.Index];
  if (not VarIsNull(V)) and ((V=3) or (V=7)) then
    AFont.Style := [fsBold];
end;

procedure TFrmCaixa.qTempoCalcFields(DataSet: TDataSet);
begin
  qTempoHoras.Value := qTempoDias.Value * 24;
  qTempoMinutos.Value := qTempoHoras.Value * 60;
end;

procedure TFrmCaixa.CaixaPeriodo;
begin
  tsObs.TabVisible := False;
  cmFechar.Visible := ivNever;
  tsTransacoes.TabVisible := False;
  Paginas.Visible := False;
  FPeriodo := True;
  pagCab.ActivePageIndex := 1;
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
    for I := 0 to 5 do
      AT[I] := (SL.Values['Rel'+IntToStr(I)]='S');
  end;

  TFrmOpcaoRelCaixa.Create(Self).Selecionar(@AT);

  for I := 0 to 5 do SL.Values['Rel'+IntToStr(I)] := TFSt[AT[I]];
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
    
  if FPeriodo then
    dplResFin.ReportTitle.Text :=
      'Caixa de ' + FormatDateTime('dd/mm/yyyy', edDataI.AsDateTime) + ' a ' +
                    FormatDateTime('dd/mm/yyyy', edDataF.AsDateTime) + #13#10 + #13#10 +
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

end.
