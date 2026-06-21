unit ncafbEst;
{
    ResourceString: Dario 10/03/13
}

interface

{$I NEX.INC}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, dxBar, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxClasses, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxControls, cxGridCustomView, cxGrid, kbmMemTable, dxBarExtItems,
  cxMaskEdit, cxTextEdit, cxDBLookupComboBox, cxLabel, cxContainer, cxSpinEdit,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, cxGridChartView, cxGridDBChartView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxPC, ComCtrls, nxdb,
  LMDPNGImage, GIFImg, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxPCdxBarPopupMenu, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomPivotGrid, cxDBPivotGrid, dxPScxPivotGridLnk,
  dxPScxCommon, cxNavigator, cxCurrencyEdit, uParentedPanel, dxBarBuiltInMenu;

type
  TfbEst = class(TFrmBase)
    MT: TkbmMemTable;
    MTID: TIntegerField;
    MTNome: TStringField;
    DS: TDataSource;
    MTTipo: TStringField;
    MTDescr: TMemoField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    edDataI: TdxBarDateCombo;
    cmGerar: TdxBarLargeButton;
    edDataF: TdxBarDateCombo;
    cmVoltar: TdxBarLargeButton;
    Paginas: TcxPageControl;
    tsTempoPorMaq: TcxTabSheet;
    gridTMaq: TcxGrid;
    tvTMaq: TcxGridDBBandedTableView;
    tvTMaqMaquina1: TcxGridDBBandedColumn;
    tvTMaqQuant: TcxGridDBBandedColumn;
    tvTMaqMinutosU: TcxGridDBBandedColumn;
    tvTMaqMinutosP: TcxGridDBBandedColumn;
    gridTMaqDBChartView1: TcxGridDBChartView;
    gridTMaqDBChartView1Series1: TcxGridDBChartSeries;
    glTMaq: TcxGridLevel;
    gridTMaqLevel1: TcxGridLevel;
    tsTempoHorario: TcxTabSheet;
    gridTHora: TcxGrid;
    tvTHora: TcxGridDBBandedTableView;
    tvTHoraHora1: TcxGridDBBandedColumn;
    tvTHoraQuant: TcxGridDBBandedColumn;
    tvTHoraMinutosU: TcxGridDBBandedColumn;
    tvTHoraMinutosP: TcxGridDBBandedColumn;
    cvTHora: TcxGridDBChartView;
    cvTHoraSeries1: TcxGridDBChartSeries;
    glTHora: TcxGridLevel;
    glTHoraGraf: TcxGridLevel;
    tsTempoManut: TcxTabSheet;
    gridTManut: TcxGrid;
    tvTManut: TcxGridDBBandedTableView;
    tvTManutNomeUsuario1: TcxGridDBBandedColumn;
    tvTManutQuant1: TcxGridDBBandedColumn;
    tvTManutTempo: TcxGridDBBandedColumn;
    glTManut: TcxGridLevel;
    cxTabSheet1: TcxTabSheet;
    gridTempoCli: TcxGrid;
    tvTempoCli: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    tvTempoCliSessoes: TcxGridDBBandedColumn;
    TVTempoCliTempo: TcxGridDBBandedColumn;
    tvTempoCilValor: TcxGridDBBandedColumn;
    glTempoCli: TcxGridLevel;
    pagIsentos: TcxTabSheet;
    gridGratis: TcxGrid;
    tvGratis: TcxGridDBBandedTableView;
    tvGratisNome: TcxGridDBBandedColumn;
    tvGratisQuant: TcxGridDBBandedColumn;
    tvGratisTempo: TcxGridDBBandedColumn;
    glGratis: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    GridTUsado: TcxGrid;
    tvTUsado: TcxGridDBTableView;
    tvTUsadoTempo: TcxGridDBColumn;
    tvTUsadoQuant: TcxGridDBColumn;
    tvTUsadoColumn1: TcxGridDBColumn;
    glTUsado: TcxGridLevel;
    LMDSimplePanel6: TLMDSimplePanel;
    edFracaoTU: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    tsPar: TcxTabSheet;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVID: TcxGridDBColumn;
    TVTipo: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVDescr: TcxGridDBColumn;
    GL: TcxGridLevel;
    Timer1: TTimer;
    cxStyle4: TcxStyle;
    tsAguarde: TcxTabSheet;
    cxLabel4: TcxLabel;
    Animate1: TAnimate;
    cmVerGraf: TdxBarLargeButton;
    dsTU: TDataSource;
    mtTU: TkbmMemTable;
    mtTUTempo: TIntegerField;
    mtTUQuant: TIntegerField;
    mtTUPerc: TFloatField;
    qTUsado: TnxQuery;
    qTUsadoMinutosR: TFloatField;
    dsTempo: TDataSource;
    qTempo: TnxQuery;
    qTempoMaq: TIntegerField;
    qTempoMinutosU: TFloatField;
    qTempoMinutosP: TFloatField;
    qTempoQuant: TIntegerField;
    qAuxTempo: TnxQuery;
    qAuxTempoMaq: TIntegerField;
    qAuxTempoQuant: TLargeintField;
    mtTotCli: TkbmMemTable;
    mtTotCliCliente: TIntegerField;
    mtTotCliQuant: TFloatField;
    mtTotCliMinutosU: TFloatField;
    mtTotCliMinutosP: TFloatField;
    mtTotCliNomeCli: TStringField;
    mtTotCliValor: TCurrencyField;
    dsTotCli: TDataSource;
    qCliValor: TnxQuery;
    qCliValorcliente: TIntegerField;
    qCliValorvalor: TCurrencyField;
    qAuxTempoCli: TnxQuery;
    qAuxTempoCliCliente: TIntegerField;
    qAuxTempoCliMinutosU: TFloatField;
    qAuxTempoCliMinutosP: TFloatField;
    qTempoCli: TnxQuery;
    qTempoCliCliente: TIntegerField;
    qTempoCliQuant: TLargeintField;
    tCli: TnxTable;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    panAguarde: TLMDSimplePanel;
    cxLabel6: TcxLabel;
    glTUsadoGraf: TcxGridLevel;
    ViewTUsadoGraf: TcxGridDBChartView;
    ViewTUsadoGrafSeries1: TcxGridDBChartSeries;
    mtTUTempoStr: TStringField;
    tvTUsadoColumn2: TcxGridDBColumn;
    dsManut: TDataSource;
    qManut: TnxQuery;
    qManutFunc: TStringField;
    qManutQuant: TLargeintField;
    qManutMinutosU: TFloatField;
    dsGratis: TDataSource;
    qGratis: TnxQuery;
    qGratisCliente: TIntegerField;
    qGratisQuant: TLargeintField;
    qGratisMinutosU: TFloatField;
    qGratisMinutosP: TFloatField;
    qGratisNomeCliente: TStringField;
    qAuxHora: TnxQuery;
    qAuxHoraHora: TWordField;
    qAuxHoraQuant: TLargeintField;
    dsHora: TDataSource;
    qHora: TnxQuery;
    qHoraHora: TWordField;
    qHoraMinutosU: TFloatField;
    qHoraMinutosP: TFloatField;
    qHoraQuant: TIntegerField;
    tsVendas: TcxTabSheet;
    tME: TnxTable;
    tMEID: TAutoIncField;
    tMEProduto: TIntegerField;
    tMEQuant: TFloatField;
    tMETotal: TCurrencyField;
    tMEDesconto: TCurrencyField;
    tMEPago: TCurrencyField;
    tMEDataHora: TDateTimeField;
    tMECancelado: TBooleanField;
    tMECaixa: TIntegerField;
    tMENomeProduto: TStringField;
    tMETotalF: TCurrencyField;
    tMETran: TIntegerField;
    tMEFunc: TStringField;
    pgVendas: TcxDBPivotGrid;
    dsME: TDataSource;
    pgVendasQuant: TcxDBPivotGridField;
    pgVendasNomeProduto: TcxDBPivotGridField;
    pgVendasTotalF: TcxDBPivotGridField;
    pgVendasCategoria: TcxDBPivotGridField;
    pgVendasFunc: TcxDBPivotGridField;
    tMETipoTran: TWordField;
    tMECateg: TStringField;
    cplVendas: TcxPivotGridReportLink;
    tMENomeFunc: TStringField;
    tMEComissao: TCurrencyField;
    pgVendasComissao: TcxDBPivotGridField;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cmGerarClick(Sender: TObject);
    procedure cmVoltarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cmVerGrafClick(Sender: TObject);
    procedure edFracaoTUPropertiesChange(Sender: TObject);
    procedure tvTHoraMinutosPCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvTHoraMinutosUCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvTManutTempoCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvTMaqMinutosPCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvTMaqMinutosUCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvTMaqMinutosUGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvGratisTempoCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure TVTempoCliTempoCustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure GridResize(Sender: TObject);
    procedure mtTUCalcFields(DataSet: TDataSet);
    procedure tMECalcFields(DataSet: TDataSet);
    procedure tMEFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cmImprimirClick(Sender: TObject);
    procedure cmExportarClick(Sender: TObject);
  private
    { Private declarations }
    FDataI, FDataF : TDateTime;
    FCaixaI, FCaixaF : Integer;
    
    procedure PopulateTU;
    procedure CalcCaixas;

    procedure ProcessaTempoMaq;
    procedure ProcessaTempoHorario; 
    procedure ProcessaTempoFunc;
    procedure ProcessaTempoCli;
    procedure ProcessaTempoGratis;
    procedure ProcessaTempoDuracao;
    procedure ProcessaVendaProduto;
    procedure ProcessaVendaCateg;
    procedure ProcessaVendas;
    

  public
    class function Descricao: String; override;

    function GetGrid: TcxGrid; override;

    procedure AjustaLayoutLargeButton(B : TdxBarLargeButton); override;
    
    { Public declarations }
  end;

var
  fbEst: TfbEst;
  FracaoTempoUsado : Integer = 15;
  SessoesTU : Integer = 0;
       
implementation

uses ncaFrmPri, ncClassesBase, ncaDM, cxExportPivotGridLink, ufmImagens;

// START resource string wizard section
resourcestring
  SVerDados = 'Ver Dados';
  SVerGráfico = 'Ver Gráfico';
  SEstatísticasERelatórios = 'Estatísticas e Relatórios';
  S1PorMáquina = '1 - por Máquina';
  SSaibaQuaisSãoAsMáquinasMaisEMeno = 'Saiba quais são as máquinas mais e menos utilizadas';
  S2PorHorário = '2 - por Horário';
  SSaibaQuaisSãoOsHoráriosDePicoEOs = 'Saiba quais são os horários de pico e os momentos que a loja fica mais vazia';
  S3PorFuncionário = '3 - por Funcionário';
  SSaibaAQuantidadeDeVezesEOTempoTo = 'Saiba a quantidade de vezes e o tempo total que os funcionários utilizaram as máquinas clientes';
  S4PorCliente = '4 - por Cliente';
  SRankingDeClientesPorValorGastoNa = 'Ranking de clientes por valor gasto na loja';
  S5PorClienteGrátis = '5 - por Cliente Grátis';
  SSaibaAQuantidadeDeVezesEOTempoTo_1 = 'Saiba a quantidade de vezes e o tempo total de uso por clientes gratuítos';
  S6PorDuraçãoDoAcesso = '6 - por Duração do Acesso';
  SFaçaUmaAnáliseDoTempoMédioDasSes = 'Faça uma análise do tempo médio das sessões';
  S7PorCategoriaProdutoFuncionário = '7 - por Categoria/Produto/Funcionário';
  SSaibaComoForamAsVendas = 'Saiba como foram as vendas';
  S1Clientes = '1 - Clientes';
  S2ProdutosVendas = '2 - Produtos / Vendas';
  STotalDeVendasPorCategoriaProduto = 'Total de vendas por Categoria/Produto/Funcionário';
  SOutros = 'Outros';
  SCLIENTESSEMCADASTROAVULSO = '* CLIENTES SEM CADASTRO (AVULSO)';

// END resource string wizard section


{$R *.dfm}

const
  idTempoMaq = 1;
  idTempoHorario = 2;
  idTempoFunc = 3;
  idTempoCli = 4;
  idTempoGratis = 5;
  idTempoDuracao = 6;
  idVendaProduto = 7;
  idVendaCateg = 8;
  idImpressao = 9;
  idVendas = 7;

procedure TfbEst.AjustaLayoutLargeButton(B: TdxBarLargeButton);
begin

end;

procedure TfbEst.CalcCaixas;
var Q: TnxQuery;
begin
  Q := TnxQuery.Create(Self);
  try
    Q.Database := Dados.DB;
    Q.SQL.Add('SELECT MIN(ID) as CaixaI, MAX(ID) as CaixaF FROM CAIXA'); // do not localize
    Q.SQL.Add('WHERE (Abertura >= TIMESTAMP ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', FDataI))+') AND ' + // do not localize
              '      (Abertura <  TIMESTAMP ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', FDataF+1))+') AND (Aberto = False)'); // do not localize
    Q.Open;
    FCaixaI := Q.FieldByName('CaixaI').AsInteger; // do not localize
    FCaixaF := Q.FieldByName('CaixaF').AsInteger; // do not localize
  finally
    Q.Free;
  end;
end;

procedure TfbEst.cmExportarClick(Sender: TObject);
const
  Exts: Array[1..3] of String = ('xls', 'htm', 'txt');
begin
  if MTID.Value=idVendas then begin
    if Pos('.', dlgExp.FileName)>0 then
      dlgExp.FileName := Copy(dlgExp.FileName, 1, Pos('.', dlgExp.FileName)-1);

    if not (dlgExp.FilterIndex in [1..3]) then
      dlgExp.FilterIndex := 1;
  
    if dlgExp.Execute and (dlgExp.FileName <> '') then begin
      if Pos('.', dlgExp.FileName)=0 then
        dlgExp.FileName := dlgExp.FileName + '.' + Exts[dlgExp.FilterIndex];
      case dlgExp.FilterIndex of
        1: cxExportPivotGridToExcel(dlgExp.FileName, pgVendas);
        2: cxExportPivotGridToHtml(dlgExp.FileName, pgVendas);
        3: cxExportPivotGridToText(dlgExp.FileName, pgVendas);
      end;
    end;
  end else
    inherited;
end;

procedure TfbEst.cmGerarClick(Sender: TObject);
begin
  inherited;
  FDataI := edDataI.Date;
  FDataF := edDataF.Date;

  edDataI.Enabled := False;
  edDataF.Enabled := False;
  cmGerar.Enabled := False;
  panAguarde.Visible := True;
  
  Timer1.Enabled := True;
end;

procedure TfbEst.cmImprimirClick(Sender: TObject);
begin
  inherited;
  if MTID.Value=idVendas then
    CP.Preview(True, cplVendas);
end;

procedure TfbEst.cmVerGrafClick(Sender: TObject);
begin
  inherited;
  if cmVerGraf.LargeImageIndex=18 then begin
    cmVerGraf.LargeImageIndex := 19;
    cmVerGraf.Caption := SVerDados;
  end else begin
    cmVerGraf.LargeImageIndex := 18;
    cmVerGraf.Caption := SVerGráfico;
  end;

  case MTID.Value of
    idTempoMaq :  
      if cmVerGraf.LargeImageIndex=19 then
        gridTMaq.ActiveLevel := gridTMaq.Levels[1] else
        gridTMaq.ActiveLevel := gridTMaq.Levels[0];

    idTempoHorario :
      if cmVerGraf.LargeImageIndex=19 then
        gridTHora.ActiveLevel := gridTHora.Levels[1] else
        gridTHora.ActiveLevel := gridTHora.Levels[0];

    idTempoDuracao :    
      if cmVerGraf.LargeImageIndex=19 then
        gridTUsado.ActiveLevel := gridTUsado.Levels[1] else
        gridTUsado.ActiveLevel := gridTUsado.Levels[0];
  end;
      
{  if gridTHora.ActiveLevel = gridTHora.Levels[0] then begin
    gridTHora.ActiveLevel := gridTHora.Levels[1];
    btnGrafHora.Caption := 'Ver Dados';
  end else begin
    gridTHora.ActiveLevel := gridTHora.Levels[0];
    btnGrafHora.Caption := 'Ver Gráfico';
  end;}

end;

procedure TfbEst.cmVoltarClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 0;
  edDataI.Enabled := True;
  edDataF.Enabled := True;
  cmGerar.Enabled := True;
  cmVoltar.Visible := ivNever;
  cmVerGraf.Visible := ivNever;
  cmImprimir.Visible := ivNever;
  cmExportar.Visible := ivNever;
end;

procedure TfbEst.TVTempoCliTempoCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var V: Variant;  
begin
  V := tvTempoCli.DataController.Summary.FooterSummaryValues[0];
  if V<>null then
  with AViewInfo do begin
    LookAndFeelPainter.DrawFooterCell(ACanvas, Bounds, AlignmentHorz,
      AlignmentVert, MultiLinePainting, MinutosToHoraStr(V), Params.Font, Params.TextColor, Params.Color,
      nil);
    ADone := True;
  end;
end;

class function TfbEst.Descricao: String;
begin
  Result := SEstatísticasERelatórios;
end;

procedure TfbEst.edFracaoTUPropertiesChange(Sender: TObject);
begin
  FracaoTempoUsado := edFracaoTU.Value;
  PopulateTU;
end;

procedure TfbEst.FrmBasePaiCreate(Sender: TObject);
var 
  S: TStream;

const
  sTempo = 'A - Análise de tempo de uso';
  sVendas = 'B - Análise de vendas';
  sImp = 'C - Análise das impressões';

procedure Add(aID: Integer; aTipo, aNome, aDescr: String);
begin
  MT.Append;
  MTTipo.Value := aTipo;
  MTID.Value := aID;
  MTNome.Value := aNome;
  MTDescr.Value := aDescr;
  MT.Post;
end;

begin
  inherited;
  pgVendasComissao.Visible := gConfig.IsPremium;
  cmGerar.Enabled := gConfig.IsPremium;
  Paginas.HideTabs := True;
  Paginas.ActivePageIndex := 0;
  cmVoltar.Visible := ivNever;
  cmVerGraf.Visible := ivNever;
  MT.Open;
  {$ifdef LAN}
  Add(idTempoMaq    , sTempo,  S1PorMáquina, SSaibaQuaisSãoAsMáquinasMaisEMeno);
  Add(idTempoHorario, sTempo,  S2PorHorário, SSaibaQuaisSãoOsHoráriosDePicoEOs);
  Add(idTempoFunc   , sTempo,  S3PorFuncionário, SSaibaAQuantidadeDeVezesEOTempoTo);
  Add(idTempoCli    , sTempo,  S4PorCliente, SRankingDeClientesPorValorGastoNa);
  Add(idTempoGratis , sTempo,  S5PorClienteGrátis, SSaibaAQuantidadeDeVezesEOTempoTo_1);
  Add(idTempoDuracao, sTempo,  S6PorDuraçãoDoAcesso, SFaçaUmaAnáliseDoTempoMédioDasSes);
  Add(idVendas,       sVendas,  S7PorCategoriaProdutoFuncionário, SSaibaComoForamAsVendas);
  
//Add(idVendaProduto, sVendas, '1 - por Produto', 'Saiba como foram as vendas e lucro de cada produto');
//Add(idVendaCateg  , sVendas, '2 - por Categoria', 'Saiba como foram as vendas e lucro por categoria de produto');
//Add(idImpressao   , sImp,    '1 - por Tipo de Impressão', 'Saiba a quantidade e valor das impressões por tipo');
  {$endif}
  {$ifdef Loja}
  TVTipo.GroupIndex := -1;
  TVTipo.Visible := False;
  TVTipo.VisibleForCustomization := False;
  tvtempoclisessoes.VisibleForCustomization := False;
  tvtempoclitempo.VisibleForCustomization := False;
  tvtempoclisessoes.Visible := False;
  tvtempoclitempo.Visible := False;
  Add(idTempoCli    , sTempo,  S1Clientes, SRankingDeClientesPorValorGastoNa);
  Add(idVendas,       sVendas,  S2ProdutosVendas, STotalDeVendasPorCategoriaProduto);
  {$endif}


  TV.DataController.Groups.FullExpand;
  MT.First;
end;

function TfbEst.GetGrid: TcxGrid;
begin
  case Paginas.ActivePageIndex of
    idTempoMaq : Result := gridTMaq;
    idTempoHorario : Result := gridTHora;
    idTempoFunc : Result := gridTManut;
    idTempoCli : Result := gridTempoCli;
    idTempoGratis : Result := gridGratis;
    idTempoDuracao : Result := gridTUsado;
  else
    Result := nil;
  end;
end;

procedure TfbEst.GridResize(Sender: TObject);
begin
  inherited;
  panAguarde.Left := ((Grid.Width-panAguarde.Width) div 2) + Grid.Left;
  panAguarde.Top := ((Grid.Height-panAguarde.Height) div 2) + Grid.Top;
end;

procedure TfbEst.mtTUCalcFields(DataSet: TDataSet);
begin
  inherited;
  if SessoesTU>0 then 
    mtTUPerc.Value := (mtTUQuant.Value / SessoesTU) * 100;
end;

procedure TfbEst.PopulateTU;
var 
  T: Integer;
begin
  dsTU.DataSet := nil;
  try
    mtTU.Active := False;
    mtTU.Active := True;
    qTUsado.First;
    SessoesTU := qTUsado.RecordCount;
    while not qTUsado.Eof do begin
      T := (Trunc(qTUsadoMinutosR.Value) div FracaoTempoUsado) * FracaoTempoUsado;
      if mtTU.FindKey([T]) then
        mtTU.Edit else
        mtTU.Insert;
      mtTUTempo.Value := T;
      mtTUTempoStr.Value := IntToStr(T) + ' a ' + IntToStr(T+FracaoTempoUsado)+'m';
      mtTUQuant.Value := mtTUQuant.Value + 1;
      mtTU.Post;  
      qTUsado.Next;
    end;
    mtTU.First; T := 0;
    while not mtTU.Eof do begin
      if mtTUPerc.Value <= 5 then begin
        T := T + mtTUQuant.Value;
        mtTU.Delete;
      end else
        mtTU.Next;
    end;
    if T>0 then begin
      mtTU.Insert;
      mtTUTempo.Value := High(Integer);
      mtTUTempoStr.Value := SOutros;
      mtTUQuant.Value := T;
      mtTU.Post;  
    end;
    mtTU.First;
  finally
    dsTU.DataSet := mtTU;
  end;
end;

procedure TfbEst.ProcessaTempoCli;
begin
  tCli.Active := True;
  
  qAuxTempoCli.Active := False;
  qAuxTempoCli.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
  qAuxTempoCli.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
  qAuxTempoCli.Active := True;
  
  qTempoCli.Active := False;
  qTempoCli.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
  qTempoCli.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
  qTempoCli.Active := True;

  dsTotCli.Dataset := nil;
  try
    mtTotCli.Active := False;
    mtTotCli.Active := True;

    
    qTempoCli.First;
    while not qTempoCli.Eof do begin
      mtTotCli.Append;
      mtTotCliCliente.Value := qTempoCliCliente.Value;
      mtTotCliQuant.Value := qTempoCliQuant.Value;

      if mtTotCliCliente.Value=0 then
        mtTotCliNomeCli.Value := SCLIENTESSEMCADASTROAVULSO 
      else 
        mtTotCliNomeCli.AsVariant := tCli.Lookup('ID', mtTotCliCliente.Value, 'Nome'); // do not localize
        
      mtTotCli.Post;
      qTempoCli.Next;
    end;

    qAuxTempoCli.First;
    while not qAuxTempoCli.Eof do begin
      if mtTotCli.FindKey([qAuxTempoCliCliente.Value]) then begin
        mtTotCli.Edit;
        mtTotCliMinutosU.Value := qAuxTempoCliMinutosU.Value;
        mtTotCliMinutosP.Value := qAuxTempoCliMinutosP.Value;
        mtTotCli.Post;
      end;
      qAuxTempoCli.Next;
    end;

    qCliValor.Active := False;
    qCliValor.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
    qCliValor.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
    qCliValor.Active := True;
    
    qCliValor.First;
    while not qCliValor.Eof do begin
      if mtTotCli.FindKey([qCliValorCliente.Value]) then 
        mtTotCli.Edit else
        mtTotCli.Insert;
      mtTotCliCliente.Value := qCliValorCliente.Value;
      mtTotCliValor.Value := qCliValorValor.Value;

      if mtTotCliNomeCli.Value='' then
      if mtTotCliCliente.Value=0 then
        mtTotCliNomeCli.Value := SCLIENTESSEMCADASTROAVULSO 
      else
        mtTotCliNomeCli.AsVariant := tCli.Lookup('ID', mtTotCliCliente.Value, 'Nome'); // do not localize
      
      mtTotCli.Post;
      
      qCliValor.Next;
    end;

    mtTotCli.First;
    
    
  finally
    dsTotCli.Dataset := mtTotCli;
  end;
end;

procedure TfbEst.ProcessaTempoDuracao;
begin
  qTUsado.Active := False;
  qTUsado.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
  qTUsado.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
  qTUsado.Active := True;
  PopulateTU;
end;

procedure TfbEst.ProcessaTempoFunc;
begin
  qManut.Active := False;
  qManut.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
  qManut.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
  qManut.Active := True;
end;

procedure TfbEst.ProcessaTempoGratis;
begin
  tCli.Active := True;
  qGratis.Active := False;
  qGratis.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
  qGratis.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
  qGratis.Active := True;
end;

procedure TfbEst.ProcessaTempoHorario;
begin
  qAuxHora.Active := False;
  qAuxHora.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
  qAuxHora.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
  qAuxHora.Active := True;
  
  qHora.Active := False;
  qHora.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
  qHora.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
  qHora.Active := True;


end;

procedure TfbEst.ProcessaTempoMaq;
begin
  qTempo.Active := False;
  qAuxTempo.Active := False;
  qAuxTempo.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
  qAuxTempo.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
  qAuxTempo.Open;
  
  qTempo.ParamByName('CaixaI').AsInteger := FCaixaI; // do not localize
  qTempo.ParamByName('CaixaF').AsInteger := FCaixaF; // do not localize
  qTempo.Open;
end;

procedure TfbEst.ProcessaVendaCateg;
begin

end;

procedure TfbEst.ProcessaVendaProduto;
begin

end;

procedure TfbEst.ProcessaVendas;
begin
  dsME.DataSet := nil;
  try
    tME.Active := True;
    tME.SetRange([trEstVenda, FCaixaI], [trEstVenda, FCaixaF]);
    pgVendasNomeProduto.ExpandAll;
    pgVendasFunc.ExpandAll;
    pgVendasCategoria.ExpandAll;
  finally
    dsME.Dataset := tME;
  end;
end;

procedure TfbEst.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;

  try
    try
      CalcCaixas;
      case MTID.Value of
        idTempoMaq : ProcessaTempoMaq; 
        idTempoHorario : ProcessaTempoHorario; 
        idTempoFunc : ProcessaTempoFunc; 
        idTempoCli : ProcessaTempoCli;
        idTempoGratis : ProcessaTempoGratis; 
        idTempoDuracao : ProcessaTempoDuracao;
        idVendas : ProcessaVendas;
      end;
      if MTID.Value in [idTempoMaq, idTempoHorario, idTempoDuracao] then
        cmVerGraf.Visible := ivAlways;
      Paginas.ActivePageIndex := MTID.Value;
      cmVoltar.Visible := ivAlways;
      cmImprimir.Visible := ivAlways;
      cmExportar.Visible := ivAlways;
    except
      Paginas.ActivePageIndex := 0;
      Raise;
    end;
  finally
    panAguarde.Visible := False;
  end;
  
end;

procedure TfbEst.tMECalcFields(DataSet: TDataSet);
begin
  inherited;
  tMETotalF.Value := tMETotal.Value - tMEDesconto.Value;
end;

procedure TfbEst.tMEFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := not tMECancelado.Value;
end;

procedure TfbEst.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  cmGerar.Enabled := AFocusedRecord.IsData;
end;

procedure TfbEst.tvGratisTempoCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var V: Variant;
begin
  V := tvGratis.DataController.Summary.FooterSummaryValues[0];
  if V<>null then
  with AViewInfo do begin
    LookAndFeelPainter.DrawFooterCell(ACanvas, Bounds, AlignmentHorz,
      AlignmentVert, MultiLinePainting, MinutosToHoraStr(V), Params.Font, Params.TextColor, Params.Color,
      nil);
    ADone := True;
  end;
end;

procedure TfbEst.tvTHoraMinutosPCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  V := tvTHora.DataController.Summary.FooterSummaryValues[1];
  if V<>null then
  with AViewInfo do begin
    LookAndFeelPainter.DrawFooterCell(ACanvas, Bounds, AlignmentHorz,
      AlignmentVert, MultiLinePainting, MinutosToHoraStr(V), Params.Font, Params.TextColor, Params.Color,
      nil);
    ADone := True;
  end;
end;

procedure TfbEst.tvTHoraMinutosUCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var V: Variant;
begin
  V := tvTHora.DataController.Summary.FooterSummaryValues[0];
  if V<>null then
  with AViewInfo do begin
    LookAndFeelPainter.DrawFooterCell(ACanvas, Bounds, AlignmentHorz,
      AlignmentVert, MultiLinePainting, MinutosToHoraStr(V), Params.Font, Params.TextColor, Params.Color,
      nil);
    ADone := True;
  end;
end;

procedure TfbEst.tvTManutTempoCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  V := tvTManut.DataController.Summary.FooterSummaryValues[0];
  if V<>null then
  with AViewInfo do begin
    LookAndFeelPainter.DrawFooterCell(ACanvas, Bounds, AlignmentHorz,
      AlignmentVert, MultiLinePainting, MinutosToHoraStr(V), Params.Font, Params.TextColor, Params.Color,
      nil);
    ADone := True;
  end;
end;

procedure TfbEst.tvTMaqMinutosPCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  V := tvTMaq.DataController.Summary.FooterSummaryValues[1];
  if V<>null then
  with AViewInfo do begin
    LookAndFeelPainter.DrawFooterCell(ACanvas, Bounds, AlignmentHorz,
      AlignmentVert, MultiLinePainting, MinutosToHMSStr(V), Params.Font, Params.TextColor, Params.Color,
      nil);
    ADone := True;
  end;
end;

procedure TfbEst.tvTMaqMinutosUCustomDrawFooterCell(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  V := tvTMaq.DataController.Summary.FooterSummaryValues[0];
  if V<>null then 
  with AViewInfo do begin
    LookAndFeelPainter.DrawFooterCell(ACanvas, Bounds, AlignmentHorz,
      AlignmentVert, MultiLinePainting, MinutosToHoraStr(V), Params.Font, Params.TextColor, Params.Color,
      nil);
    ADone := True;
  end;
end;

procedure TfbEst.tvTMaqMinutosUGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V := ARecord.Values[Sender.Index];
  if V<>null then
    AText := ncClassesBase.MinutosToHoraStr(V); 
end;

end.

