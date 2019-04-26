unit ncafbMesas;
{
    ResourceString: Dario 10/03/13
    João: TODO List!
}

interface

{$I nex.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, ImgList, dxBarExtItems, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxMaskEdit, cxImageComboBox, cxTextEdit, cxCurrencyEdit,
  ncClassesBase,
  cxDBLookupComboBox, cxCheckBox, nxdb, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxCalendar, cxGridCardView, cxGridDBCardView, cxMemo,
  cxHint, ActnList, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, 
  ncCredTempo,
  ncaPanVendaProdBase,
  ncSessao, LMDCustomComponent, LMDWaveComp, LMDSysInfo, 
  LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxPC, cxImage, cxBarEditItem, Buttons,
  cxContainer, cxLabel,
  dxPSCompsProvider, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  LMDPNGImage, cxLookAndFeels, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxScreenTip, dxCustomHint, cxGridCustomLayoutView, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, cxNavigator, dxPScxPivotGridLnk,
  cxPCdxBarPopupMenu, LMDCustomScrollBox, LMDScrollBox, LMDSplt, cxSpinEdit, 
  ncaPanItensVendaBase, 
  ncaPanItensVendaGrid, kbmMemTable, ncaFrmConfigComanda, cxSplitter,
  cxButtonEdit;

const

  MAX_MAQ = 512;
  
type 
  TfbMesas = class;

  TDadosGridMaq = class 
  private
    FMaq: TncMaquina;
    FVendas: Boolean;
    FStatus: Byte;
    FStatusSt: String;
    FValor: String;
    FTempo: String;
    FPontosCli: String;
    FNome: String;
    FObs: String;
    FForm : TfbMesas;
    FIndex: Integer;
    FFocusBtn : Byte;   
    FHot : Boolean;
    
    procedure SetStatus(const Value: Byte);
    procedure SetStatusSt(const Value: String);
    procedure SetTempo(const Value: String);
    procedure SetValor(const Value: String);
    procedure SetVendas(const Value: Boolean);
    procedure SetNome(const Value: String);
    procedure SetObs(const Value: String);
    procedure SetPontosCli(const Value: String);
    procedure SetFocusBtn(const Value: Byte);

    function FocusItem(aFocusBtn: Byte): TcxCustomGridTableItem;
    procedure SetHot(const Value: Boolean);
  public      
    constructor Create(AMaq: TncMaquina; AForm: TfbMesas; aIndex: Integer);

    procedure Recalc;
    procedure RecalcNome;
    procedure Invalida(cellCV: TcxCustomGridTableItem);

    property Hot: Boolean read FHot write SetHot;

    property Status: Byte read FStatus write SetStatus;
    property Nome: String read FNome write SetNome;
    property PontosCli: String read FPontosCli write SetPontosCli;
    property StatusSt: String read FStatusSt write SetStatusSt;
    property Tempo: String read FTempo write SetTempo;
    property Valor: String read FValor write SetValor;
    property Vendas: Boolean read FVendas write SetVendas;
    property Obs: String read FObs write SetObs;
    property RecordIndex: Integer read FIndex;
    property FocusBtn: Byte
      read FFocusBtn write SetFocusBtn;
  end;
  
  TfbMesas = class(TFrmBase)
    cmFinalizar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxsLivre: TcxStyle;
    cxsEmUso: TcxStyle;
    cxsAguardaPagto: TcxStyle;
    Timer1: TTimer;
    cmMaquinasDest: TdxBarListItem;
    ActionList1: TActionList;
    Image1: TImage;
    pmMaq: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    cmSubTransf: TdxBarSubItem;
    cmAddProduto: TdxBarButton;
    cmPMIniciar: TdxBarButton;
    cmPMFinalizar: TdxBarButton;
    cmPMEditar: TdxBarButton;
    cmVendaAvulsa: TdxBarButton;
    Timer2: TTimer;
    Wav: TLMDWaveComp;
    TimerWav: TTimer;
    cmEditarCliente: TdxBarButton;
    pmFidelidade: TdxBarPopupMenu;
    Timer3: TTimer;
    LMDSysInfo1: TLMDSysInfo;
    panImpSimNao: TLMDSimplePanel;
    dxBarButton5: TdxBarButton;
    cxHint: TcxHintStyleController;
    cxBarEditItem1: TcxBarEditItem;
    dxBarSubItem2: TdxBarSubItem;
     cmSubPag: TdxBarSubItem;
    cmConfig: TdxBarButton;
    cmFidelidade: TdxBarLargeButton;
    cmResgProduto: TdxBarButton;
    cmSubFidelidade: TdxBarSubItem;
    cmPropMaq: TdxBarButton;
    cmVendaPLUS: TdxBarLargeButton;
    cmAddVendaPlus: TdxBarButton;
    dxBarButton2: TdxBarButton;
    spCentral: TLMDSplitterPanel;
    spGridMesas: TLMDSplitterPane;
    spConta: TLMDSplitterPane;
    pmTransf: TdxBarPopupMenu;
    pgConsumoContas: TcxPageControl;
    cxTabSheet6: TcxTabSheet;
    BarMgrBar2: TdxBar;
    panConsumo: TLMDSimplePanel;
    panConta: TLMDSimplePanel;
    panVendaProd: TLMDSimplePanel;
    cxTabSheet1: TcxTabSheet;
    pancli: TLMDSimplePanel;
    pgConta: TcxPageControl;
    tsAbreConta: TcxTabSheet;
    tsConta: TcxTabSheet;
    btnAbrirConta: TcxButton;
    imgConta: TcxImageList;
    cmAbrirFechar: TdxBarButton;
    cmTransferir: TdxBarButton;
    Image2: TImage;
    LMDSimplePanel1: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    ActionList2: TActionList;
    mtComanda: TkbmMemTable;
    mtComandaSessao: TIntegerField;
    mtComandaComanda: TIntegerField;
    mtAvulso: TkbmMemTable;
    mtAvulsoSessao: TIntegerField;
    dsComanda: TDataSource;
    dsAvulso: TDataSource;
    pgMesasComandas: TcxPageControl;
    tsMesas: TcxTabSheet;
    tsComandas: TcxTabSheet;
    gridComanda: TcxGrid;
    cvComanda: TcxGridDBCardView;
    cxGridDBCardViewRow1: TcxGridDBCardViewRow;
    cxGridDBTableView1: TcxGridDBTableView;
    glComanda: TcxGridLevel;
    gridMesa: TcxGrid;
    cvMesa: TcxGridDBCardView;
    cvMesaNumero: TcxGridDBCardViewRow;
    gridMesaDBTableView1: TcxGridDBTableView;
    glMesa: TcxGridLevel;
    dxBarButton3: TdxBarButton;
    cmExibir: TdxBarSubItem;
    cmExibirComandas: TdxBarButton;
    cmExibirCliente: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    cxBarEditItem2: TcxBarEditItem;
    cmExibirMesas: TdxBarButton;
    procedure Timer1Timer(Sender: TObject);
    procedure TVStatusGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure TVInicioTicksGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cmFinalizarClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmTransferirClick(Sender: TObject);
    procedure cmMaquinasDestClick(Sender: TObject);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cvMesaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cvMesaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure cvMesaDblClick(Sender: TObject);
    procedure cvMesaStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure cvMesaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure cmVendaAcessoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cvMesaFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure cvMesaCanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure cmMaquinasDestGetData(Sender: TObject);
    procedure TimerWavTimer(Sender: TObject);
    procedure cmEditarClienteClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure cvMesaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cvMesaMouseLeave(Sender: TObject);
    procedure cmFidelidadeClick(Sender: TObject);
    procedure cmResgProdutoClick(Sender: TObject);
    procedure pmMaqPopup(Sender: TObject);
    procedure cmVendaPLUSClick(Sender: TObject);
    procedure cvMesaGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
    procedure cvMesaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAbrirContaMouseEnter(Sender: TObject);
    procedure btnAbrirContaMouseLeave(Sender: TObject);
    procedure panConsumoResize(Sender: TObject);
    procedure btnAbrirContaClick(Sender: TObject);
    procedure cmClienteClick(Sender: TObject);
    procedure lbAlterarQuantMesasClick(Sender: TObject);
    procedure spGridMesasClick(Sender: TObject);
    procedure cmExibirMesasClick(Sender: TObject);
    procedure cmExibirComandasClick(Sender: TObject);
    procedure cmExibirClienteClick(Sender: TObject);
  private
    FLerLayout: Boolean;
    FLastRecChange : Cardinal;
    FMouseDownEdit : Boolean;
    FMouseDown: Boolean;
    DragM      : Integer;
    FUltimoAvisoFimTempo : Cardinal;
    FNumAvisoFimTempo : Integer;
    Maquinas   : Array[0..MAX_MAQ-1] of TDadosGridMaq;
    FLastFocus : TDadosGridMaq;
    FHotMaq    : TDadosGridMaq;
    FShowingHint : Byte;
    FCardW : Integer;
    FAddProd : TFrmPanVendaProdBase;
    FpanItens : TpanItensVendaBase;
    FConfigComanda : TFrmConfigComanda;
    { Private declarations }
    function ObtemTempo(aMaq, aAcesso: Integer): String;

    procedure SetHotMaq(const Value: TDadosGridMaq);
    procedure SetCardW(const Value: Integer);

    procedure OnAddProd(Sender: TFrmPanVendaProdBase; aProdID: Cardinal; aValorUnit, aTotal: Currency; aQuant: Extended; aDescr: String; aPermSemEstoque: Boolean; aFidPontos: Double);

    procedure OnClicouCancelarItem(Sender: TObject; aBotao: TBotaoItemVenda);

    procedure OnAlterouMesa(Sender: TObject);

    procedure OnAlterouSessao(S: TncSessao; Destruiu: Boolean);
    function GetExibirCliente: Boolean;
    function GetExibirComandas: Boolean;
    function GetExibirMesas: Boolean;
    procedure SetExibirCliente(const Value: Boolean);
    procedure SetExibirComandas(const Value: Boolean);
    procedure SetExibitMesas(const Value: Boolean);
    
    property CardW: Integer
      read FCardW write SetCardW;

    property HotMaq: TDadosGridMaq
      read FHotMaq write SetHotMaq;

  public
    class function Descricao: String; override;
    function ToolbarIsRibbonGroup(aBar: TdxBar): Boolean; override;

    procedure AjustaLayoutLargeButton(B : TdxBarLargeButton); override;

    procedure ParentChanged; override;

    procedure AjustaVisBotoes;
    
    procedure AtualizaDireitos; override;
    procedure RefreshCacheMaq;
    procedure DeleteMaq(aMaq: TncMaquina);
    procedure RefreshBotoes;

    property ExibirComandas: Boolean
      read GetExibirComandas write SetExibirComandas;

    property ExibirCliente: Boolean
      read GetExibirCliente write SetExibirCliente;

    property ExibirMesas: Boolean
      read GetExibirMesas write SetExibitMesas;

    procedure TocaAvisoFimTempo;

    procedure IncAvisoFimTempo;
    procedure DecAvisoFimTempo;

    procedure FocusMesa;

    { Public declarations }
  end;

  TSelCor = Array[Boolean] of TColor;
                                               
  TCorStatus = record
    cmCabFundo : TColor;
    cmCabFonte : TColor;
    cmCabFundoC: TColor;
    
    cmFundo    : TSelCor;
    cmFonte    : TSelCor;
  end;  

const
  smLivre  = 0;
  smUsoPre = 1;
  smUsoPos = 2;  
  smPausa  = 3;
  smPagto  = 4;
  smFunc   = 5;
  smForaAr = 6;
  smUsoPrev = 7;

  ibtnGuardOk   = 1;
  ibtnVenda     = 2;
  ibtnImpressao = 3;
  ibtnControleRem = 4;
  ibtnNome = 5;
  ibtnChat = 6;
  ibtnMenu = 7;
  ibtnTempoAdd = 8;
  ibtnVendaAdd = 9;
  ibtnPlusAdd  = 10;

var
  fbMesas: TfbMesas;
  FCores    : Array[smLivre..smUsoPrev] of TCorStatus;
  FCab, FCabC: TColor;
  

implementation

uses ufmImagens, ncaDM, ncaFrmPri, ncIDRecursos,
  GraphUtil, 
  ncMovEst, ncaFrmVendaProd, ncaFrmME, ncDMServ, ncaFrmSite,
  ncVersoes, ncFrmSuporteRem, ncaFrmContato,
  ncaFrmOperMaq, ncaFrmInfoMaq, ncaFrmCadCli, ncaFrmMsgChat, ncafbVendasTab,
  ncDebug, ncaFrmTempoIniciar, ncaFrmIniciarSessao, 
  ncaPlusAPI, ncaFrmVendaPlus, ncaFrmPanTopo, ncapanVendaProd2;

// START resource string wizard section
resourcestring
  SConsumoMesas = 'Consumo';
  SNãoExisteAcessoEmAndamentoNaMáqu = 'Essa conta não está aberta';
  SDesejaRealmenteFinalizarOAcessoN = 'Deseja realmente fechar a conta?';
  SParaIniciarUmNovoAcessoNessaMáqu = 'Já existe uma conta aberta para essa mesa';
  SVocêPoderáRegistrarOPagamentoAtr = 'Você poderá registrar o pagamento através do duplo-clique ou do botão "Editar"';
  SJáExisteUmAcessoEmAndamentoNaMáq = 'A conta já está aberta';
  SConfirmaTransferênciaDoAcessoDaM = 'Confirma transferência?';
  SParaAMáquina = ' para ';
  SAguardaPagto = 'Aguarda Pagto.';
  SFuncionário = 'Funcionário';
  SHoraNãoPerm = 'Hora Não Perm.';
  SEmUso = 'Em uso';
  SLivre = 'Livre';
  SProdutosVendidos = 'Produtos Vendidos';
  SCliqueParaEditarCorrigirAVendaMa = 'Clique para editar/corrigir a venda mais recente dessa mesa';
  SEditarCliente = 'Editar Cliente';
  SMantenhaATeclaCTRLApertadaECliqu = 'Mantenha a tecla CTRL apertada e clique no nome do cliente para editar.';
  SCadastrarMáquina = 'Cadastrar Mesa';
  SIndisponível = '-- Indisponível --';
  SDuploCliqueAqui = '(duplo clique aqui)';
  SReservado_1 = 'Reservado: ';
  SCaixaEstáFechado = 'Caixa está fechado!';  
  SEmManutenção = 'Mesa inativa';

  SAbrirConta = 'Abrir (F2)';
  SFecharConta = 'Fechar (F2)';
  SPagarConta = 'Pagar (F2)';
  STransferirPara = 'para';


// END resource string wizard section


{$R *.dfm}

{ TfbMesas }
procedure DrawGradient(Canvas: TCanvas; const ARect: TRect;
  FromColor, ToColor: TColor; AStepCount: Integer; IsVertical: Boolean = False);
var
  SR: TRect;
  H, I: Integer;
  R, G, B: Byte;
  FromR, ToR, FromG, ToG, FromB, ToB: Byte;
begin
  FromR := GetRValue(FromColor);
  FromG := GetGValue(FromColor);
  FromB := GetBValue(FromColor);
  ToR := GetRValue(ToColor);
  ToG := GetGValue(ToColor);
  ToB := GetBValue(ToColor);
  SR := ARect;
  with ARect do
    if IsVertical then
      H := Bottom - Top
    else
      H := Right - Left;

  for I := 0 to AStepCount - 1 do
  begin
    if IsVertical then
      SR.Bottom := ARect.Top + MulDiv(I + 1, H, AStepCount)
    else
      SR.Right := ARect.Left + MulDiv(I + 1, H, AStepCount);
    with Canvas do
    begin
      R := FromR + MulDiv(I, ToR - FromR, AStepCount - 1);
      G := FromG + MulDiv(I, ToG - FromG, AStepCount - 1);
      B := FromB + MulDiv(I, ToB - FromB, AStepCount - 1);
      Brush.Color := RGB(R, G, B);
      FillRect(SR);
    end;
    if IsVertical then
      SR.Top := SR.Bottom
    else
      SR.Left := SR.Right;
  end;
end;

procedure CorClara(var CorO, CorC: TColor);
var  H, L, S: Word;
begin
  ColorRGBToHLS(CorO, H, L, S);
  if L > 100 then begin
    CorC := CorO;
    CorO := ColorHLSToRGB(H, Trunc(L*0.8), S)
  end else
  if L < 30 then
    CorC := ColorHLSToRGB(H, 70, S)
  else
    CorC := ColorHLSToRGB(H, Trunc(L*1.25), S);
end;

function CorMuitoClara(Cor: TColor): TColor;
var  H, L, S: Word;
begin
  ColorRGBToHLS(Cor, H, L, S);
  if ((S>0) and (L > 100)) or ((S=0) and (L>130)) then 
    Result := ColorHLSToRGB(H, Trunc(L*0.40), S)
  else
  if L < 30 then
    Result := ColorHLSToRGB(H, 210, S)
  else
  if L < 70 then
    Result := ColorHLSToRGB(H, Trunc(L*2.7), S)
  else
    Result := ColorHLSToRGB(H, Trunc(L*2), S);
end;

function CorMaxHigh(Cor: TColor): TColor;
var  H, L, S: Word;
begin
  ColorRGBToHLS(Cor, H, L, S);
  Result := ColorHLSToRGB(H, Trunc(180), S);
end;

function SetLum(Cor: TColor; NewL : Word): TColor;
var  H, L, S: Word;
begin
  ColorRGBToHLS(Cor, H, L, S);
  Result := ColorHLSToRGB(H, NewL, S);
end;


procedure TfbMesas.DecAvisoFimTempo;
begin
  Dec(FNumAvisoFimTempo);
  TimerWav.Enabled := TimerWav.Enabled and (FNumAvisoFimTempo>0);
end;

procedure TfbMesas.DeleteMaq(aMaq: TncMaquina);
var I, P : Integer;
begin
  for I := 0 to Max_Maq-1 do
    if Maquinas[I].FMaq=aMaq then begin
      for P := I to Max_Maq-2 do
        Maquinas[P] := Maquinas[P+1];
      Exit;
    end;
end;

class function TfbMesas.Descricao: String;
begin
  Result := SConsumoMesas;
end;

procedure TfbMesas.cmResgProdutoClick(Sender: TObject);
begin
  inherited;
  Dados.NovoMovEst(trEstVenda, 0, True);
end;

procedure TfbMesas.Timer1Timer(Sender: TObject);
var I : Integer;
begin
  CardW := cvMesa.OptionsView.CardWidth;
  
  if FMouseDown then Exit;
   
  try
    for I := 0 to Max_Maq-1 do 
    if Maquinas[I]<>nil then
      Maquinas[I].Recalc;
    Timer2.Enabled := True;  
  except
  end;
end;

procedure TfbMesas.Timer2Timer(Sender: TObject);
var I : Integer;
begin
  try
    if FMouseDown then Exit;
    for I := 0 to Max_Maq-1 do 
    if Maquinas[I]<>nil then
      Maquinas[I].RecalcNome;
  except
  end;
end;

procedure TfbMesas.Timer3Timer(Sender: TObject);
begin
  inherited;
  Timer3.Enabled := False;
  FLerLayout := False;
  ParentChanged;
end;

procedure TfbMesas.TimerWavTimer(Sender: TObject);
begin
  inherited;
  TocaAvisoFimTempo;
end;

procedure TfbMesas.TocaAvisoFimTempo;
begin
  if (GetTickCount - FUltimoAvisoFimTempo) > 2000 then begin
    FUltimoAvisoFimTempo := GetTickCount;
    Wav.Play;
    TimerWav.Enabled := False;
    TimerWav.Enabled := (gConfig.AvisoFimTempoAdminS>4) and (FNumAvisoFimTempo>0);
  end;
end;

function TfbMesas.ToolbarIsRibbonGroup(aBar: TdxBar): Boolean;
begin
  Result := (aBar = BarMgr.BarByComponentName('BarMgrBar1')); // do not localize
end;

procedure TfbMesas.TVStatusGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText := Maquinas[ARecord.RecordIndex].StatusSt;
end;

procedure TfbMesas.TVInicioTicksGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if Maquinas[ARecord.RecordIndex]=nil then Exit;
  AText := Maquinas[ARecord.RecordIndex].Tempo;
end;

procedure TfbMesas.cmFidelidadeClick(Sender: TObject);
var P: TPoint;
begin
  inherited;
  P := ItemLinkScreenPoint(cmFidelidade.ClickItemLink);
  pmFidelidade.Popup(P.X, P.Y);
end;

procedure TfbMesas.cmFinalizarClick(Sender: TObject);
var S: TncSessao;
begin
  inherited;
  with Dados do begin
    S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
    if S=nil then begin
      Beep;
      ShowMessage(SNãoExisteAcessoEmAndamentoNaMáqu+mtMaquinaNumero.AsString);
      Exit;
    end;

    if S.Encerrou then begin
      Beep;
      
      cmEditarClick(nil);
      
      Exit;
    end;
  
    if SimNao(SDesejaRealmenteFinalizarOAcessoN +mtMaquinaNumero.AsString + ' ?')
    then begin
      if S.TipoCli=tcManutencao then begin
        CM.LogoutMaq(mtMaquinaNumero.Value);
        SessoesFinalizadas.Add(IntToStr(S.ID));
//        CM.ModoManutencao(mtMaquinaNumero.Value, False)
      end else begin              
        CM.LogoutMaq(mtMaquinaNumero.Value);
        SessoesFinalizadas.Add(IntToStr(S.ID));
      end;
      RefreshBotoes;  
    end;  
  end;      
end;

procedure TfbMesas.FocusMesa;
begin
  FAddProd.FocusMesa;
end;

procedure TfbMesas.FrmBasePaiCreate(Sender: TObject);
var 
  I : Integer;
begin
  inherited;
//  SetLength(Maquinas, MAX_MAQ);

  Dados.OnAlterouSessao := OnAlterouSessao;
  
  FAddProd := TFrmPanVendaProd2.Create(Self);
  FAddProd.panVendaProd.Parent := panVendaProd;
  FAddProd.TipoTran := trEstVenda;
  FAddProd.OnAddProd := OnAddProd;
  FAddProd.MostrarMesa := False;
//  FAddProd.OnAlterouMesa := OnAlterouMesa;

  FpanItens := TPanItensVendaGrid.Create(Self);
  FpanItens.panPri.Parent := tsConta;
  FpanItens.OnClicouBotao := OnClicouCancelarItem;
  FpanItens.MostrarBotao(bivCancelarItem, True);
  FpanItens.TipoTran := trEstVenda;
  FpanItens.ResgateFidelidade := False;
  FpanItens.SetFontSize(12);

  FCardW := 0;
  fbMesas := Self;
  FHotMaq := nil;
  FShowingHint := 0;
  FMouseDownEdit := False;
  FLastRecChange := 0;
  FLastFocus := nil;
  FLerLayout := True;
  FUltimoAvisoFimTempo := 0;
  FNumAvisoFimTempo := 0;
  for I := 0 to Max_Maq-1 do Maquinas[I] := nil;
  FMouseDown := False;
  with Dados.CM, Config do begin
    Self.RefreshCacheMaq;
    FCores[smLivre].cmCabFundo := CorLivre;
    FCores[smLivre].cmCabFonte := CorFLivre;
    FCores[smUsoPre].cmCabFundo := CorUsoPrePago;
    FCores[smUsoPre].cmCabFonte := CorFUsoPrePago;
    FCores[smUsoPos].cmCabFundo := CorUsoPosPago;
    FCores[smUsoPos].cmCabFonte := CorFUsoPosPago;
    FCores[smPausa].cmCabFundo := CorPausado;
    FCores[smPausa].cmCabFonte := CorFPausado;
    FCores[smPagto].cmCabFundo := CorAguardaPagto;
    FCores[smPagto].cmCabFonte := CorFAguardaPagto;
    FCores[smFunc].cmCabFundo := CorManutencao;
    FCores[smFunc].cmCabFonte := CorFManutencao;
    FCores[smForaAr].cmCabFundo := CorMaqManut;
    FCores[smForaAr].cmCabFonte := CorFMaqManut;
    FCores[smUsoPrev].cmCabFundo := CorPrevisao;
    FCores[smUsoPrev].cmCabFonte := CorFPrevisao;
    
    FCab := clWhite;
    CorClara(FCab, FCabC);
    for I := smLivre to smUsoPrev do with FCores[I] do begin
      CorClara(cmCabFundo, cmCabFundoC);
//    cmCabFonte := CorMuitoClara(cmCabFundoC);
      cmFundo[False] := SetLum(clBlack, 220);
      cmFonte[False] := clBlack;
      
      cmFundo[True] := SetLum(cmCabFundoC, 200);
      cmFonte[True] := SetLum(cmFUndo[True], 30);
    end;  
  end;

  mtComanda.Active := True;
  mtAvulso.Active := True;

  dsComanda.Dataset := nil;
  dsAvulso.Dataset := nil;

  try
    with Dados.CM do
    for I := 0 to Sessoes.Count-1 do
      OnAlterouSessao(Sessoes[I], False);
  finally
    dsAvulso.Dataset := mtAvulso;
    dsComanda.Dataset := mtComanda;
  end;
end;

procedure TfbMesas.cmTransferirClick(Sender: TObject);
var P: TPoint;
begin
  inherited;
  P := ItemLinkScreenPoint(cmTransferir.ClickItemLink);
  pmTransf.ItemLinks.Clear;
  pmTransf.ItemLinks.Add.Item := cmMaquinasDest;
  pmTransf.Popup(P.X, P.Y);
end;

procedure TfbMesas.cmMaquinasDestClick(Sender: TObject);
var NumD: Integer;
begin
  inherited;
  with cmMaquinasDest do
  NumD := Integer(Items.Objects[ItemIndex]);

  with Dados, CM do
  if SimNao(SConfirmaTransferênciaDoAcessoDaM + 
                mtMaquinaNumero.AsString + SParaAMáquina+IntToStr(NumD)+' ?') then
    TransferirMaq(mtMaquinaNumero.Value, NumD);
end;

procedure TfbMesas.cmMaquinasDestGetData(Sender: TObject);
var 
  I : Integer;
  S: TncSessao;
begin
  inherited;
  with Dados, CM do begin
    cmMaquinasDest.Items.Clear;
    S := Sessoes.PorMaq[mtMaquinaNumero.Value];
    if (S=nil) or (S.Encerrou) then Exit;
    for I := 0 to pred(Maquinas.Count) do with Maquinas[I] do 
    if Sessoes.PorMaq[Numero]=nil then
      cmMaquinasDest.Items.AddObject(STransferirPara+' '+IntToStr(Numero), TObject(Numero)); // TODO : check string
  end;
end;

function TfbMesas.GetExibirCliente: Boolean;
begin
  Result := cmExibirCliente.Down;
end;

function TfbMesas.GetExibirComandas: Boolean;
begin
  Result := cmExibirComandas.Down;
end;

function TfbMesas.GetExibirMesas: Boolean;
begin
  Result := cmExibirMesas.Down;
end;

procedure TfbMesas.GridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Timer1.Enabled := False;
end;

procedure TfbMesas.GridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Timer1.Enabled := True;
end;

procedure TfbMesas.IncAvisoFimTempo;
begin
end;

procedure TfbMesas.lbAlterarQuantMesasClick(Sender: TObject);
begin
  inherited;
  if not Dados.CM.UA.Admin then begin
    ShowMessage(SSomenteAdmin);
    Exit;
  end;
end;

function TfbMesas.ObtemTempo(aMaq, aAcesso: Integer): String;
begin
end;

procedure TfbMesas.OnAddProd(Sender: TFrmPanVendaProdBase; aProdID: Cardinal;
  aValorUnit, aTotal: Currency; aQuant: Extended; aDescr: String; aPermSemEstoque: Boolean; aFidPontos: Double);
var
  S: TncSessao;
  IME : TncItemMovEst;
  ME : TncMovEst;
begin
  if CaixaFechado then Exit;
  
  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
  
  if (S=nil) then Exit;
  
  IME := TncItemMovEst.Create(nil);
  try
    IME.imTipoTran := trEstVenda;
    IME.imProduto := aProdID;
    IME.imQuant := aQuant;
    IME.imUnitario := aValorUnit;
    IME.imTotal := aQuant * aValorUnit;
    IME.imPermSemEstoque := aPermSemEstoque;
    ME := TncMovEst.Create;
    try
      IME.imSessao := S.ID;
      IME.imCliente := S.Cliente;
      IME._Operacao := osIncluir;
      ME.Itens.NewItem.AssignFrom(IME);
      ME.Sessao := S.ID;
      ME.Cliente := S.Cliente;
      ME.Total := IME.imTotal;
      ME.Desconto := IME.imDesconto;
      ME.Pago := IME.imPago;
      ME.DataHora := IME.imDataHora;
      ME.Tipo := trEstVenda;
      ME.Maq := S.Maq;
      ME.NomeCliente := S.NomeCliente;
      ME.Recibo := IME._Recibo;
      ME.Obs := IME.imObs;
      ME.Operacao := osIncluir;
      Dados.CM.SalvaMovEst(ME);
    finally
      ME.Free;
    end;
  finally
    IME.Free;
  end;
end;

procedure TfbMesas.OnAlterouMesa(Sender: TObject);
begin
  Dados.MTMaquina.Locate('Numero', FAddProd.Mesa, []);
end;

procedure TfbMesas.OnAlterouSessao(S: TncSessao; Destruiu: Boolean);
begin
  mtComanda.DisableControls;
  mtAvulso.DisableControls;
  try
    if mtComanda.FindKey([S.ID]) then begin
      if Destruiu or (S.TipoMaq<>tipomaq_comanda) then 
        mtComanda.Delete
      else begin
        mtComanda.Edit;
        mtComandaComanda.Value := S.Maq;
        mtComanda.Post;
      end;
    end else begin
      if (not Destruiu) and (S.TipoMaq=tipomaq_comanda) then begin
        mtComanda.Insert;
        mtComandaSessao.Value := S.ID;
        mtComandaComanda.Value := S.Maq;
        mtComanda.Post;
      end;
    end;

    if mtAvulso.FindKey([S.ID]) then begin
      if Destruiu or (S.TipoMaq<>tipomaq_avulso) then mtAvulso.Delete;
    end else 
    if (not Destruiu) and (S.TipoMaq=tipomaq_avulso) then begin
      mtAvulso.Insert;
      mtAvulsoSessao.Value := S.ID;
      mtAvulso.Post;
    end;
  finally
    mtAvulso.EnableControls;
    mtComanda.EnableControls
  end;
end;

procedure TfbMesas.OnClicouCancelarItem(Sender: TObject;
  aBotao: TBotaoItemVenda);
var 
  IM: TncItemMovEst;  
  S, SN : TncSessao;
begin
  with Dados do begin
    SN := TncSessao.Create(True);
    try
      S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
      if S<>nil then begin
        SN.Assign(S);
        IM := SN.Vendas[FpanItens.FocusedItemIndex];
        if (IM<>nil) and (not IM.imCancelado) then begin
          IM.imCancelado := True;
          IM._Operacao := osCancelar;
          CM.SalvaAlteracoesObj(SN, False);
        end;
      end;
    finally
      SN.Free;
    end;
  end;
end;

procedure TfbMesas.panConsumoResize(Sender: TObject);
begin
  inherited;
  btnAbrirConta.Left := (panConsumo.Width - btnAbrirConta.Width) div 2;
end;

procedure TfbMesas.ParentChanged;
begin
end;

procedure TfbMesas.pmMaqPopup(Sender: TObject);
begin
  inherited;
  pmMaq.Tag := Dados.mtMaquinaNumero.Value;
end;

function CodStatus(S: TncSessao): Integer;
var T: Cardinal;
begin
  if S=nil then
    Result := smLivre
  else
  if S.TipoCli=tcManutencao then
    Result := smFunc
  else begin  
    T := S.FimTempo.Ticks;
    if S.Encerrou then 
      Result := smPagto
    else  
    if S.MotivoPausa <> mpNaoEstaPausado then
      Result := smPausa
    else begin
      if (S.Tarifador.Valor>0.009) or (S.TotalGeral>0.009) then begin
        if S.TemTempoPrevisto then
          Result := smUsoPrev else
          Result := smUsoPos;
      end else
        if S.TipoCli=tcCliGratis then
          Result := smUsoPrev else
          Result := smUsoPre;
    end;  
  end;
end;

function StrStatus(S: TncSessao): String;
begin
  if S<>nil then begin
    if S.Encerrou then 
      Result := SAguardaPagto
    else  
    if S.TipoCli=tcManutencao then
      Result := SFuncionário     
    else 
    case S.MotivoPausa of
      mpPausaFimTempo : Result := SEmUso;
      mpPausaAdmin    : Result := SEmUso;
      mpPausaHorarioNP: Result := SHoraNãoPerm;
    else
      Result := SEmUso;  
    end;
  end else
    Result := SLivre;  
end;

procedure TfbMesas.cvMesaDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited;
  with cvMesa.DataController do 
    Accept := (DragM>0) and
              (Maquinas[FocusedRecordIndex]<>nil) and
              (Maquinas[FocusedRecordIndex].Status=smLivre);
end;

procedure TfbMesas.cvMesaFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var S: String;
begin
  inherited;

  FLastRecChange := GetTickCount;
  RefreshBotoes;
end;

procedure TfbMesas.cvMesaGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
  inherited;
  AHeight := cvMesa.OptionsView.CardWidth;
end;

procedure TfbMesas.cvMesaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = Key_ENTER) then 
    FAddProd.FocusProd;
end;

procedure TfbMesas.cvMesaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseDownEdit := ((GetTickCount - FLastRecChange) > 500);
  if FShowingHint>0 then 
    FrmPri.HC.HideHint;
end;

procedure TfbMesas.cvMesaMouseLeave(Sender: TObject);
begin
  inherited;
  FrmPri.HC.HideHint;
  HotMaq := nil;
end;

function ValorZero(S: String): Boolean;
var I : Integer;
begin
  for I  := Length(S) downto 1 do 
    if not (S[I] in ['1'..'9']) then
      Delete(S, I, 1);
  Result := (S='');    
end;

procedure TfbMesas.cvMesaCanSelectRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
  inherited;
  aAllow := True;
end;

procedure TfbMesas.cvMesaCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if Maquinas[AViewInfo.GridRecord.RecordIndex]=nil then exit;
  ACanvas.Font.Color := clWhite;

  
  if Maquinas[AViewInfo.GridRecord.RecordIndex].Status = smLivre then 
      ACanvas.Pen.Color := $74A928 else
      ACanvas.Pen.Color := $0125DA;
  
  if AViewInfo.GridRecord.Selected then 
      ACanvas.Brush.Color := aCanvas.Pen.Color
  else begin
    ACanvas.Brush.Color := clWhite;
    ACanvas.Font.Color := ACanvas.Pen.Color;
  end;
    
  ACanvas.Pen.Width := 3;
{  if AViewInfo.GridRecord.Selected then
    ACanvas.Pen.Color := clBlack else}
//  with aViewInfo.Bounds do begin

  ACanvas.Rectangle(AViewInfo.RealBounds);

  ACanvas.Pen.Width := 1;

  ACanvas.Font.Size := 14;
  ACanvas.Font.Style := [fsBold];

  ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.Bounds, taCenter, vaCenter, False, False);  

  ADone := True;  
end;

procedure TfbMesas.FrmBasePaiDestroy(Sender: TObject);
var I : Integer;
begin
  inherited;
  fbMesas := nil;
  for I := 0 to Max_Maq-1 do FreeAndNil(Maquinas[I]);
end;

procedure TfbMesas.AjustaLayoutLargeButton(B: TdxBarLargeButton);
begin
//
end;

procedure TfbMesas.AjustaVisBotoes;
begin
  
end;

procedure TfbMesas.AtualizaDireitos;
var I : Integer;
begin
  inherited;

{  if gConfig.FreePremium and (gConfig.AssinaturaVenceEm>=Date) then
    MAX_MAQ := 1000 else          
    MAX_MAQ := 255;               

  if Length(Maquinas)<>MAX_MAQ then begin
    SetLength(Maquinas, MAX_MAQ);
    RefreshCacheMaq;
  end;   

                           }

                           
  if gConfig.ComandaOff then begin
    cmExibirComandas.Visible := ivNever;
    ExibirComandas := False;
  end else begin
    tsComandas.Visible := True;
    ExibirComandas := cmExibirComandas.Down;
  end;

  Dados.mtMaquina.Filtered := SameText(slConfig.Values['RemoveAddMaq'], 'S'); // do not localize
  
  if FLerLayout then Timer3.Enabled := True;
  TimerWav.Interval := gConfig.AvisoFimTempoAdminS * 1000;

  if Permitido(daAtenderClientes) then
    for I := 0 to BarMgr.ItemCount - 1 do
      BarMgr.Items[I].Enabled := True;
      
  Timer2.Enabled := True;
  
  cmLayCustomize.Visible := ivNever;
    
  cmApagar.Enabled := Dados.CM.UA.Admin;
  with Dados.CM.Config do begin
    FCores[smLivre].cmCabFundo := CorLivre;
    FCores[smLivre].cmCabFonte := CorFLivre;
    FCores[smUsoPre].cmCabFundo := CorUsoPrePago;
    FCores[smUsoPre].cmCabFonte := CorFUsoPrePago;
    FCores[smUsoPos].cmCabFundo := CorUsoPosPago;
    FCores[smUsoPos].cmCabFonte := CorFUsoPosPago;
    FCores[smPausa].cmCabFundo := CorPausado;
    FCores[smPausa].cmCabFonte := CorFPausado;
    FCores[smPagto].cmCabFundo := CorAguardaPagto;
    FCores[smPagto].cmCabFonte := CorFAguardaPagto;
    FCores[smFunc].cmCabFundo := CorManutencao;
    FCores[smFunc].cmCabFonte := CorFManutencao;
    FCores[smForaAr].cmCabFundo := CorMaqManut;
    FCores[smForaAr].cmCabFonte := CorFMaqManut;
    FCores[smUsoPrev].cmCabFundo := CorPrevisao;
    FCores[smUsoPrev].cmCabFonte := CorFPrevisao;

    FCab := clWhite;
    CorClara(FCab, FCabC);
    for I := smLivre to smUsoPrev do with FCores[I] do begin
      CorClara(cmCabFundo, cmCabFundoC);
//    cmCabFonte := CorMuitoClara(cmCabFundoC);
      cmFundo[False] := SetLum(clBlack, 220);
      cmFonte[False] := clBlack;
      
      cmFundo[True] := SetLum(cmCabFundoC, 200);
      cmFonte[True] := SetLum(cmFUndo[True], 30);
    end;  
  end;

  if not Permitido(daAtenderClientes) then
    for I := 0 to BarMgr.ItemCount - 1 do
      BarMgr.Items[I].Enabled := False;

  RefreshBotoes;
end;

procedure TfbMesas.RefreshBotoes;
var
  S : TncSessao;
  M : TncMaquina;
  LigT : Boolean;
  I : Integer;
  Str : String;
begin
  try
    with Dados, CM do begin
      if FAddProd.Mesa <> mtMaquinaNumero.Value then 
        FAddProd.Mesa := mtMaquinaNumero.Value;
        
        
      S := Sessoes.PorMaq[mtMaquinaNumero.Value];
      if S<>nil then begin
        pgConta.ActivePageIndex := 1;
        FpanItens.LoadFromItensMovEst(S.Vendas);
//        cmMesa.Style := cxsEmuso;
      end else begin
        pgConta.ActivePageIndex := 0;
        FpanItens.Count := 0;
//        cmMesa.Style := cxsLivre;
      end;
      M := Maquinas.PorNumero[mtMaquinaNumero.Value];
      if M=nil then begin
        for I := 0 to BarMgr.ItemCount - 1 do
          BarMgr.Items[I].Enabled := False;
        cmSubPag.Enabled := True;
        cmConfig.Enabled := True;  
        Exit;
      end;

      if S<>nil then begin
        if S.Encerrou then begin
          cmAbrirFechar.Caption := SPagarConta;
//          cmAbrirFechar.LargeImageIndex := 133;
        end else begin
          cmAbrirFechar.Caption := SFecharConta;
//          cmAbrirFechar.LargeImageIndex := 5;
        end;
      
      end else begin
//        cmAbrirFechar.LargeImageIndex := 3;
        cmAbrirFechar.Caption := SAbrirConta;
      end;

      for I := 0 to BarMgr.ItemCount - 1 do
        BarMgr.Items[I].Enabled := True;
      
      cmFidelidade.Enabled := Versoes.PodeUsar(idre_fidelidade) and gConfig.FidAtivo;
      cmSubFidelidade.Enabled := cmFidelidade.Enabled;
      
      cmSubPag.Enabled := True;
  
      cmPMFinalizar.Enabled := (S<>nil);
      cmFinalizar.Enabled := cmPMFinalizar.Enabled;
      cmPMEditar.Enabled := (S<>nil);
      cmEditar.Enabled := cmPMEditar.Enabled;
      cmPMIniciar.Enabled := (S=nil);
      cmAddProduto.Enabled := (S<>nil) and (S.TipoCli<>tcManutencao);
      cmAddVendaPlus.Enabled := (S<>nil);
      cmEditarCliente.Enabled := (S<>nil) and (S.Cliente>0);
      if cmEditarCliente.Enabled then
        cmEditarCliente.Tag := S.Cliente else
        cmEditarCliente.Tag := 0;
      cmSubTransf.Enabled := (S<>nil) and (not S.Encerrou);
      cmTransferir.Enabled := cmSubTransf.Enabled;
    end;
  
    if not Permitido(daAtenderClientes) then
      for I := 0 to BarMgr.ItemCount - 1 do
        BarMgr.Items[I].Enabled := False;
  except
  end;
end;

procedure TfbMesas.RefreshCacheMaq;
var
  I,C : Integer;
  M : TncMaquina;
begin
  for I := 0 to Max_Maq-1 do FreeAndNil(Maquinas[I]);
    
  C := -1;  
  with Dados.CM do 
  for I := 0 to Max_Maq-1 do begin
    M := Maquinas.PorNumero[I+1];
    if M<>nil then begin
      Inc(C);
      Self.Maquinas[C] := TDadosGridMaq.Create(M, Self, C);
    end;
  end;    
end;

procedure TfbMesas.SetCardW(const Value: Integer);

procedure BtnVis(B: TdxBarLargeButton; M: Integer);
begin
  if FCardW>=M then
    B.Visible := ivNever else
    B.Visible := ivAlways;
end;

begin
  if FCardW=Value then Exit;
  FCardW := Value;
end;

procedure TfbMesas.SetExibirCliente(const Value: Boolean);
begin
  cmExibirCliente.Down := Value;
  panCli.Visible := Value;
end;

procedure TfbMesas.SetExibirComandas(const Value: Boolean);
begin
  cmExibirComandas.Down := Value;
  tsComandas.TabVisible := Value;
  spGridMesas.Visible := tsComandas.TabVisible or tsMesas.TabVisible;
end;

procedure TfbMesas.SetExibitMesas(const Value: Boolean);
begin
  cmExibirMesas.Down := Value;
  tsMesas.TabVisible := Value;
  spGridMesas.Visible := tsComandas.TabVisible or tsMesas.TabVisible;
end;

procedure TfbMesas.SetHotMaq(const Value: TDadosGridMaq);
begin
  if FHotMaq=Value then Exit;

  if FHotMaq<>nil then
    FHotMaq.Hot := False;
    
  FHotMaq := Value;

  if Value<>nil then
    FHotMaq.Hot := True;
end;

procedure TfbMesas.spGridMesasClick(Sender: TObject);
begin
  inherited;

end;

{ TDadosGridMaq }

constructor TDadosGridMaq.Create(AMaq: TncMaquina; AForm: TfbMesas; aIndex: Integer);
begin
  FHot := False;
  FMaq := AMaq;
  FForm := AForm;
  FFocusBtn := 0;
  FVendas := False;
  FStatus := 0;
  FStatusSt := '';
  FValor := '';
  FTempo := '';
  FIndex := aIndex;
end;

function TDadosGridMaq.FocusItem(aFocusBtn: Byte): TcxCustomGridTableItem;
begin
  Result := nil;    
end;

procedure TDadosGridMaq.Invalida(cellCV: TcxCustomGridTableItem);
begin
  if (FForm.cvMesa.ViewData.RecordCount>FIndex) then
    FForm.cvMesa.ViewData.Records[FIndex].Invalidate(cellCV);
end;

procedure TDadosGridMaq.Recalc;
var
  ATempo, AValor, S2: String;
  dValor, v1, v2, v3 : Double;
  cTempo : Cardinal;
  S : TncSessao;
  TA : TncTipoAcesso;
begin
  S := Dados.CM.Sessoes.PorMaq[FMaq.Numero];
  with Dados.CM do
  if (S<>nil) {and (S.TipoCli=tcManutencao)} then begin
//    ATempo := TicksToHMSSt(S.TempoUsado.Ticks);
//    AValor := FloatToStrF(0, ffCurrency, 10, 2);
{  end else  
  if S<>nil then begin}
    S.AtualizaCalculo;
    cTempo := S.TempoUsado.Ticks;
    if Config.MostraPrePagoDec then
    if (S.TempoMaximo.Ticks>0) and (cTempo<=S.TempoMaximo.Ticks) then
        cTempo := S.TempoMaximo.Ticks - cTempo;
    ATempo := TicksToHMSSt(cTempo);

    if S.Encerrou then
      dValor := S.Total else    
      dValor := S.Tarifador.Valor;
    v1 := S.Transacoes.TotalPendente(trEstVenda);
    v2 := S.Transacoes.TotalPendente(trCredTempo);
    v3 := S.Transacoes.TotalPendente(trImpressao);
    
    dValor := dValor + v1 + v2 + v3;
{              S.Transacoes.TotalPendente(trEstVenda) +
              S.Transacoes.TotalPendente(trCredTempo) +
              S.Transacoes.TotalPendente(trImpressao);}
    AValor := Trim(FloatToStrF(dValor, ffCurrency, 10, 2));
    if gConfig.FidMostrarSaldoAdmin and 
       gConfig.FidAtivo and 
       (S.PontosCli>0.0001) and 
       Versoes.PodeUsar(idre_fidelidade) then
    begin
      Str(S.PontosCli:0:1, S2);
      S2 := Copy(S2, 1, Pos('.', S2)+1);
      if (S2>'') and (S2[Length(S2)]='0') then
        Delete(S2, Pos('.', S2), 10);
      PontosCli := S2;
    end else
      PontosCli := '';
      
  end else begin
    ATempo := '';
    AValor := '';
    PontosCli := '';
  end;

  Status := CodStatus(S);
  StatusSt := StrStatus(S);
  if (Status=smLivre) and FMaq.EmManutencao then begin
    Status := smForaAr;
    StatusSt := SEmManutenção;
  end;

  Valor := AValor;
  Tempo := ATempo;
  Vendas := (S<>nil) and (S.UltimaTranVenda>0);
end;

procedure TDadosGridMaq.RecalcNome;
var  S : TncSessao;
begin
  S := Dados.CM.Sessoes.PorMaq[FMaq.Numero];
  if S = nil then begin
    if DM.tEsp.IsEmpty then
      Nome := ''
    else begin
      if DM.tEsp.Locate('PrevMaq; PrevSessao', VarArrayOf([FMaq.Numero, 0]), []) then
        Nome := SReservado_1 + DM.tEspNomeCliente.Value else
        Nome := '';
    end;
    Obs := '';
  end else begin
    Obs := S.Obs;
    if S.Cliente>0 then begin
      case Dados.CM.Config.CampoLocalizaCli of
        0 : Nome := S.NomeCliente;
        1 : Nome := S.UsernameLogin;
        2 : Nome := IntToStr(S.Cliente)+'-'+S.NomeCliente;
      end;
    end else
      Nome := S.NomeCliente;
  end;
end;

procedure TDadosGridMaq.SetFocusBtn(const Value: Byte);
begin
  if FFocusBtn = Value then Exit;

  if (FocusItem(FFocusBtn)<>nil) and  
     (FocusItem(FFocusBtn)<>FocusItem(Value)) then
    Invalida(nil);      
//    Invalida(FocusItem(FFocusBtn)); 
  
  FFocusBtn := Value;

  if FocusItem(Value)<>nil then
    Invalida(nil);
//    Invalida(FocusItem(Value));
end;

procedure TDadosGridMaq.SetHot(const Value: Boolean);
begin
  if Value=FHot then Exit;
  FHot := Value;
  Invalida(nil);
end;

procedure TDadosGridMaq.SetNome(const Value: String);
begin
  if Value = FNome then Exit;
  FNome := Value;
end;

procedure TDadosGridMaq.SetObs(const Value: String);
begin
  if Value = FObs then Exit;
  FObs := Value;
end;

procedure TDadosGridMaq.SetPontosCli(const Value: String);
begin
  if Value = FPontosCli then Exit;
  FPontosCli := Value;
end;

procedure TDadosGridMaq.SetStatus(const Value: Byte);
begin
  if Value = FStatus then Exit;
  FStatus := Value;
  Invalida(nil);
end;

procedure TDadosGridMaq.SetStatusSt(const Value: String);
begin
  if Value = FStatusSt then Exit;
  FStatusSt := Value;
  Invalida(nil);
end;

procedure TDadosGridMaq.SetTempo(const Value: String);
begin
  if Value = FTempo then Exit;
  FTempo := Value;
  Invalida(nil);
end;

procedure TDadosGridMaq.SetValor(const Value: String);
begin
  if Value = FValor then Exit;
  FValor := Value;
  Invalida(nil);
end;

procedure TDadosGridMaq.SetVendas(const Value: Boolean);
begin
  if Value = FVendas then Exit;
  FVendas := Value;
end;

procedure TfbMesas.cvMesaDblClick(Sender: TObject);
begin
  inherited;
  FAddProd.FocusProd;
end;

procedure TfbMesas.cmClienteClick(Sender: TObject);
begin
  inherited;
  ExibirCliente := cmExibirCliente.Down;
end;

procedure TfbMesas.cmEditarClick(Sender: TObject);
begin
  with Dados do
    EditarSessao(CM.Sessoes.PorMaq[mtMaquinaNumero.Value]);
end;

procedure TfbMesas.cmEditarClienteClick(Sender: TObject);
begin
  inherited;
  with Dados do 
    if tbCli.Locate('ID', cmEditarCliente.Tag, []) then // do not localize
      TFrmCadCli.Create(nil).Editar(tbCli, nil);
end;

procedure TfbMesas.cmExibirClienteClick(Sender: TObject);
begin
  inherited;
  ExibirCliente := cmExibirCliente.Down;
end;

procedure TfbMesas.cmExibirComandasClick(Sender: TObject);
begin
  inherited;
  ExibirComandas := cmExibirComandas.Down;
end;

procedure TfbMesas.cmExibirMesasClick(Sender: TObject);
begin
  inherited;
  ExibirMesas := cmExibirMesas.Down;
end;

procedure TfbMesas.cvMesaStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;

  with Dados do
  if CM.Sessoes.PorMaq[mtMaquinaNumero.Value]=nil then 
    DragM := -1
  else  
    DragM := mtMaquinaNumero.Value;
end;

procedure TfbMesas.btnAbrirContaClick(Sender: TObject);
var S: TncSessao;
begin
  S := TncSessao.Create(True);
  try
    S.Maq := Dados.mtMaquinaNumero.Value;
    S.UsernameLogin := 'nexanon'; // do not localize
    S.SenhaLogin := ')(*&^!@#$%';
    S.TipoCli:= tcNormal;
    Dados.CM.LoginMaq(S);
  finally
    S.Free;
  end;
end;

procedure TfbMesas.btnAbrirContaMouseEnter(Sender: TObject);
begin
  inherited;
  btnAbrirConta.OptionsImage.ImageIndex := 1;
  btnAbrirConta.Font.Color := clBlack; 
end;

procedure TfbMesas.btnAbrirContaMouseLeave(Sender: TObject);
begin
  inherited;
  btnAbrirConta.OptionsImage.ImageIndex := 0;
  btnAbrirConta.Font.Color := clWhite;
end;

procedure TfbMesas.cvMesaDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  with Dados, CM do
  if SimNao(SConfirmaTransferênciaDoAcessoDaM +
             IntToStr(DragM) + SParaAMáquina + mtMaquinaNumero.AsString + '?') then
    TransferirMaq(DragM, mtMaquinaNumero.Value);
end;

procedure TfbMesas.cmVendaAcessoClick(Sender: TObject);
var
  S: TncSessao;
  IME : TncItemMovEst;
  ME : TncMovEst;
begin
  if CaixaFechado then Exit;
  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
  if (S=nil) or (S.TipoCli=tcManutencao) then Exit;
  
  IME := TncItemMovEst.Create(nil);
  try
    IME.imTipoTran := trEstVenda;
    if TFrmVendaProd.Create(nil).Editar(IME, True, True, True) then begin
      ME := TncMovEst.Create;
      try
        IME.imSessao := S.ID;
        IME.imCliente := S.Cliente;
        IME._Operacao := osIncluir;
        ME.Itens.NewItem.AssignFrom(IME);
        ME.Sessao := S.ID;
        ME.Cliente := S.Cliente;
        ME.Total := IME.imTotal;
        ME.Desconto := IME.imDesconto;
        ME.Pago := IME.imPago;
        ME.DataHora := IME.imDataHora;
        ME.Tipo := trEstVenda;
        ME.Maq := S.Maq;
        ME.NomeCliente := S.NomeCliente;
        ME.Recibo := IME._Recibo;
        ME.Obs := IME.imObs;
        ME.Operacao := osIncluir;
        Dados.CM.SalvaMovEst(ME);
      finally
        ME.Free;
      end;
    end;
  {  try
      S.Vendas.NewItem.AssignFrom(IME);
      for I := 0 to S.Vendas.Count - 1 do
        S.Vendas[I]._Operacao := osNenhuma;
      for I := 0 to S.Tempos.Count - 1 do
        S.Tempos[I]._Operacao := osNenhuma;
      for I := 0 to S.Impressoes.Count - 1 do
        S.Impressoes[I]._Operacao := osNenhuma;
      S.Vendas[S.Vendas.Count-1]._Operacao := osIncluir;
      S.Vendas[S.Vendas.Count-1].imSessao := S.ID;
      Dados.CM.AlteraSessao(S);
    finally
      S.Vendas.Remove(IME);
    end;}
  finally
    IME.Free;
  end;

end;

procedure TfbMesas.cmVendaPLUSClick(Sender: TObject);
begin
  inherited;
  if CaixaFechado then Exit;
  if PodeVenderPlus then
    TFrmVendaPlus.Create(Self).Vender(0, False);
end;

initialization
  fbMesas := nil;

end.

