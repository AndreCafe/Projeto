unit ncafbMaquinas;

interface

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
  ncSessao, LMDCustomComponent, LMDWaveComp, LMDSysInfo, 
  LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxPC, cxImage, cxBarEditItem, Buttons,
  PngSpeedButton, cxContainer, cxLabel,
  dxPSCompsProvider, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  LMDPNGImage, cxLookAndFeels;


const
  Max_Maq  = 255;

type 
  TfbMaquinas = class;

  TDadosGridMaq = class 
  private
    FMaq: TncMaquina;
    FGuardOk: Boolean;
    FVendas: Boolean;
    FImp: Boolean;
    FImpJob: Boolean;
    FStatus: Byte;
    FStatusSt: String;
    FValor: String;
    FTempo: String;
    FPontosCli: String;
    FNome: String;
    FObs: String;
    FForm : TfbMaquinas;
    FIndex: Integer;
    FTerminouTempo : Boolean;
    FTipoAcesso: String;
    FFocusBtn : Byte;   
    FHot : Boolean;
    
    procedure SetGuardOk(const Value: Boolean);
    procedure SetImp(const Value: Boolean);
    procedure SetStatus(const Value: Byte);
    procedure SetStatusSt(const Value: String);
    procedure SetTempo(const Value: String);
    procedure SetValor(const Value: String);
    procedure SetVendas(const Value: Boolean);
    procedure SetNome(const Value: String);
    procedure SetObs(const Value: String);
    procedure SetTerminouTempo(const Value: Boolean);
    procedure SetPontosCli(const Value: String);
    procedure SetImpJob(const Value: Boolean);
    procedure SetTipoAcesso(const Value: String);
    procedure SetFocusBtn(const Value: Byte);

    function FocusItem(aFocusBtn: Byte): TcxCustomGridTableItem;
    procedure SetHot(const Value: Boolean);
  public      
    constructor Create(AMaq: TncMaquina; AForm: TfbMaquinas; aIndex: Integer);

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
    property GuardOk: Boolean read FGuardOk write SetGuardOk;
    property Vendas: Boolean read FVendas write SetVendas;
    property Obs: String read FObs write SetObs;
    property Imp: Boolean read FImp write SetImp;
    property ImpJob: Boolean read FImpJob write SetImpJob;
    property RecordIndex: Integer read FIndex;
    property TerminouTempo: Boolean read FTerminouTempo write SetTerminouTempo;
    property TipoAcesso: String read FTipoAcesso write SetTipoAcesso;
    property FocusBtn: Byte
      read FFocusBtn write SetFocusBtn;
  end;
  
  TfbMaquinas = class(TFrmBase)
    cmLiberar: TdxBarLargeButton;
    cmPausar: TdxBarLargeButton;
    cmFinalizar: TdxBarLargeButton;
    cmTransferir: TdxBarLargeButton;
    cmVenda: TdxBarLargeButton;
    cmVenderCred: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxsLivre: TcxStyle;
    cxsPausa: TcxStyle;
    cxsUsoPos: TcxStyle;
    cxsAguardaPagto: TcxStyle;
    cxsManut: TcxStyle;
    cxsUsoPre: TcxStyle;
    Timer1: TTimer;
    pmTransf: TdxBarPopupMenu;
    cmMaquinasDest: TdxBarListItem;
    ActionList1: TActionList;
    Image1: TImage;
    cxsPequeno: TcxStyle;
    pmMaq: TdxBarPopupMenu;
    cmVendaAcesso: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    cmSubTransf: TdxBarSubItem;
    cmAddTempo: TdxBarButton;
    cmAddProduto: TdxBarButton;
    cmPMIniciar: TdxBarButton;
    cmPMPausar: TdxBarButton;
    cmPMFinalizar: TdxBarButton;
    cmPMEditar: TdxBarButton;
    cmVendaAvulsa: TdxBarButton;
    cmPMDesligar: TdxBarButton;
    cmPMReiniciar: TdxBarButton;
    cmPMFecharGuard: TdxBarButton;
    cmDownload: TdxBarButton;
    cmProgUso: TdxBarButton;
    cmEnviarChat: TdxBarButton;
    Timer2: TTimer;
    cmBloqSite: TdxBarButton;
    cmPMCapturar: TdxBarButton;
    cmAddImp: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    cmPausarTodas: TdxBarButton;
    cmDespausarTodas: TdxBarButton;
    Wav: TLMDWaveComp;
    TimerWav: TTimer;
    cmSubMaq: TdxBarSubItem;
    cmEditarCliente: TdxBarButton;
    cmCreditos: TdxBarButton;
    cmLogoffWin: TdxBarButton;
    cmLigarMaq: TdxBarButton;
    cmLigarTodas: TdxBarButton;
    pmFidelidade: TdxBarPopupMenu;
    Timer3: TTimer;
    LMDSysInfo1: TLMDSysInfo;
    BarMgrBar2: TdxBar;
    cmLigar: TdxBarButton;
    cmDesligar: TdxBarButton;
    cmCapturar: TdxBarButton;
    cmAcessoRemoto: TdxBarButton;
    cmComando: TdxBarButton;
    panImpSimNao: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    cxStyle1: TcxStyle;
    cmReiniciar: TdxBarButton;
    dxBarButton3: TdxBarButton;
    cmProcessos: TdxBarButton;
    dxBarButton5: TdxBarButton;
    cmDesbloquear: TdxBarButton;
    cxStyle2: TcxStyle;
    Grid: TcxGrid;
    CV: TcxGridDBCardView;
    CVNumero: TcxGridDBCardViewRow;
    CVTempo: TcxGridDBCardViewRow;
    CVNomeMaq: TcxGridDBCardViewRow;
    CVNomeCli: TcxGridDBCardViewRow;
    CVPrograma: TcxGridDBCardViewRow;
    CVObs: TcxGridDBCardViewRow;
    CVRodape: TcxGridDBCardViewRow;
    GL: TcxGridLevel;
    cxHint: TcxHintStyleController;
    imRod: TcxImageList;
    cxStyle3: TcxStyle;
    cxBarEditItem1: TcxBarEditItem;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    dxBarSubItem2: TdxBarSubItem;
    ilChat: TcxImageList;
    TimerRealinha: TTimer;
    cmSubPag: TdxBarSubItem;
    cmConfig: TdxBarButton;
    cxsAddMaq: TcxStyle;
    cmNumM: TdxBarStatic;
    cxStyle9: TcxStyle;
    cmFidelidade: TdxBarLargeButton;
    cmResgTempo: TdxBarButton;
    cmResgProduto: TdxBarButton;
    cmSubFidelidade: TdxBarSubItem;
    cmPropMaq: TdxBarButton;
    panConfImp: TLMDSimplePanel;
    Image2: TImage;
    panCotaDia: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lbCotaDia: TcxLabel;
    cxLabel4: TcxLabel;
    lbImpDia: TcxLabel;
    panCotaMes: TLMDSimplePanel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    lbCotaMes: TcxLabel;
    cxLabel9: TcxLabel;
    lbImpMes: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel11: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    Image3: TImage;
    lbPaginas: TcxLabel;
    cmJobResume: TcxButton;
    cmJobDelete: TcxButton;
    LMDSimplePanel1: TLMDSimplePanel;
    lbImp: TcxLabel;
    lbDoc: TcxLabel;
    Image4: TImage;
    Image5: TImage;
    cmDesativarFW: TdxBarButton;
    cmSubMonitor: TdxBarSubItem;
    cmMonitorOn: TdxBarButton;
    cmMonitorOff: TdxBarButton;
    cmMonitorConfig: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    cmDownloadExe: TdxBarButton;
    procedure Timer1Timer(Sender: TObject);
    procedure TVStatusGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure TVInicioTicksGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cmFinalizarClick(Sender: TObject);
    procedure cmLiberarClick(Sender: TObject);
    procedure cmPausarClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmTransferirClick(Sender: TObject);
    procedure cmMaquinasDestClick(Sender: TObject);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cmCapturarClick(Sender: TObject);
    procedure CVDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure CVCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure CVTempoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure CVRodapeCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure CVNumeroCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVNumeroCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure CVDblClick(Sender: TObject);
    procedure CVStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure CVDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure cmVendaAcessoClick(Sender: TObject);
    procedure cmVendaClick(Sender: TObject);
    procedure CVMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CVNomeCliGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cmVenderCredClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure CVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure cmProgUsoClick(Sender: TObject);
    procedure cmBloqSiteClick(Sender: TObject);
    procedure CVProgramaGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cmDownloadClick(Sender: TObject);
    procedure cmPMDesligarClick(Sender: TObject);
    procedure cmEnviarChatClick(Sender: TObject);
    procedure CVObsGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cmAddImpClick(Sender: TObject);
    procedure CVCanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure cmMaquinasDestGetData(Sender: TObject);
    procedure cmPausarTodasClick(Sender: TObject);
    procedure cmDespausarTodasClick(Sender: TObject);
    procedure TimerWavTimer(Sender: TObject);
    procedure cmEditarClienteClick(Sender: TObject);
    procedure cmCreditosClick(Sender: TObject);
    procedure cmLigarMaqClick(Sender: TObject);
    procedure cmLigarTodasClick(Sender: TObject);
    procedure CVNomeCliCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure Timer3Timer(Sender: TObject);
    procedure cmDisableADClick(Sender: TObject);
    procedure cmLigarClick(Sender: TObject);
    procedure cmAcessoRemotoClick(Sender: TObject);
    procedure cmReiniciarClick(Sender: TObject);
    procedure cmDesbloquearClick(Sender: TObject);
    procedure cmLogoffWinClick(Sender: TObject);
    procedure cmJobResumeClick(Sender: TObject);
    procedure cmJobDeleteClick(Sender: TObject);
    procedure CVMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure CVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CVMouseLeave(Sender: TObject);
    procedure TimerRealinhaTimer(Sender: TObject);
    procedure cmConfigClick(Sender: TObject);
    procedure CVNumeroGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cmFidelidadeClick(Sender: TObject);
    procedure cmResgTempoClick(Sender: TObject);
    procedure cmResgProdutoClick(Sender: TObject);
    procedure cmPropMaqClick(Sender: TObject);
    procedure cmDesativarFWClick(Sender: TObject);
    procedure cmMonitorOnClick(Sender: TObject);
    procedure cmMonitorOffClick(Sender: TObject);
    procedure cmMonitorConfigClick(Sender: TObject);
    procedure pmMaqPopup(Sender: TObject);
    procedure cmDownloadExeClick(Sender: TObject);
  private
    FLerLayout: Boolean;
    FLastRecChange : Cardinal;
    FMouseDownEdit : Boolean;
    FMouseDown: Boolean;
    DragM      : Integer;
    FUltimoAvisoFimTempo : Cardinal;
    FNumAvisoFimTempo : Integer;
    Maquinas   : Array[0..Max_Maq-1] of TDadosGridMaq;
    FLastFocus : TDadosGridMaq;
    FHotMaq    : TDadosGridMaq;
    FShowingHint : Byte;
    { Private declarations }
    function ObtemTempo(aMaq, aAcesso: Integer): String;

    procedure VenderCred(Sender: TObject; aFidResg : Boolean);

    procedure SetHotMaq(const Value: TDadosGridMaq);

    property HotMaq: TDadosGridMaq
      read FHotMaq write SetHotMaq;
  public
    class function Descricao: String; override;
    function ToolbarIsRibbonGroup(aBar: TdxBar): Boolean; override;

    procedure AjustaLayoutLargeButton(B : TdxBarLargeButton); override;
    
    procedure AtualizaDireitos; override;
    procedure RefreshCacheMaq;
    procedure DeleteMaq(aMaq: TncMaquina);
    procedure RefreshBotoes;

    procedure TocaAvisoFimTempo;

    procedure IncAvisoFimTempo;
    procedure DecAvisoFimTempo;

    procedure EditarPass(Sender: TObject);

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
  
var
  fbMaquinas: TfbMaquinas;
  FCores    : Array[smLivre..smUsoPrev] of TCorStatus;
  FCab, FCabC: TColor;

implementation

uses ufmImagens, ncaDM, ncaFrmPri, ncIDRecursos,
  GraphUtil, 
  ncAuxPassaporte, ncaFrmCaptura, ncaFrmTempo, ncaFrmSessao,
  ncMovEst, ncaFrmVendaProd, ncaFrmME, ncDMServ, ncaFrmProcessos, ncaFrmSite,
  ncVersoes, ncImpressao, ncaFrmImp, ncFrmSuporteRem, ncaFrmMaq, ncaFrmContato,
  ncFrmCreditos, ncPassaportes, ncaFrmPass, synamisc, ncaFrmLiga,
  ncaFrmOperMaq, ncJob, ncaFrmInfoMaq, ncaFrmCadCli, ncaFrmMsgChat, ncafbMaq,
  ncDebug, ncaFrmTempoIniciar, ncaFrmIniciarSessao, ncaFrmTempoDesligaMon;

{$R *.dfm}


{ TfbMaquinas }
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


procedure TfbMaquinas.DecAvisoFimTempo;
begin
  Dec(FNumAvisoFimTempo);
  TimerWav.Enabled := TimerWav.Enabled and (FNumAvisoFimTempo>0);
end;

procedure TfbMaquinas.DeleteMaq(aMaq: TncMaquina);
var I, P : Integer;
begin
  for I := 0 to Max_Maq-1 do
    if Maquinas[I].FMaq=aMaq then begin
      for P := I to Max_Maq-2 do
        Maquinas[P] := Maquinas[P+1];
      Exit;
    end;
end;

class function TfbMaquinas.Descricao: String;
begin
  Result := 'Sessões / Atendimento';
end;

procedure TfbMaquinas.cmLigarClick(Sender: TObject);
var M : Integer;
begin
  inherited;
  M := TFrmLiga.Create(Self).Ligar(Dados.mtMaquinaNumero.Value);
  if M<>-1 then
  if M=0 then
    cmLigarTodasClick(nil) else
    cmLigarMaqClick(nil);
end;

procedure TfbMaquinas.EditarPass(Sender: TObject);
var 
  S: TncSessao;
  P, P2: TncPassaporte;
begin
  with TFrmCreditos(Sender) do begin
    S := Dados.CM.Sessoes.PorID[IDSessao];
    if S<>nil then
      P := S.Passaportes.PorID(MTIDPass.Value) else
      P := nil;
    if P=nil then Exit;

    P2 := TncPassaporte.Create;
    try
      P2.AssignFrom(P);
      TFrmPassaporte.Create(Self).Editar(False, P2);
    finally
      P2.Free;
    end;
  end;
end;

procedure TfbMaquinas.cmReiniciarClick(Sender: TObject);
begin
  inherited;
  TFrmOperMaq.Create(nil).Mostrar(Dados.mtMaquinaNumero.Value, operReboot);
end;

procedure TfbMaquinas.cmResgProdutoClick(Sender: TObject);
begin
  inherited;
  Dados.NovoMovEst(trEstVenda, 0, True);
end;

procedure TfbMaquinas.cmResgTempoClick(Sender: TObject);
begin
  inherited;
  VenderCred(Sender, True);
end;

procedure TfbMaquinas.Timer1Timer(Sender: TObject);
var I : Integer;
begin
  if FMouseDown then Exit;
  try
    for I := 0 to Max_Maq-1 do 
    if Maquinas[I]<>nil then
      Maquinas[I].Recalc;
    Timer2.Enabled := True;  
  except
  end;
end;

procedure TfbMaquinas.Timer2Timer(Sender: TObject);
var I : Integer;
begin
  try
    Timer2.Enabled := False;
    try 
      DM.tEsp.Refresh; 
    except 
      Exit;
    end;
    
    if FMouseDown then Exit;
    for I := 0 to Max_Maq-1 do 
    if Maquinas[I]<>nil then
      Maquinas[I].RecalcNome;
  except
  end;
end;

procedure TfbMaquinas.Timer3Timer(Sender: TObject);
begin
  inherited;
  Timer3.Enabled := False;
  FLerLayout := False;
  ParentChanged;
end;

procedure TfbMaquinas.TimerRealinhaTimer(Sender: TObject);
begin
  inherited;
  TimerRealinha.Enabled := False;
  Exit;
  
  Grid.Align := alNone;
  Grid.Align := alClient;
  if TimerRealinha.Tag=0 then begin
    TimerRealinha.Enabled := True;
    TimerRealinha.Tag := 1;
  end;
end;

procedure TfbMaquinas.TimerWavTimer(Sender: TObject);
begin
  inherited;
  TocaAvisoFimTempo;
end;

procedure TfbMaquinas.TocaAvisoFimTempo;
begin
  if (GetTickCount - FUltimoAvisoFimTempo) > 2000 then begin
    FUltimoAvisoFimTempo := GetTickCount;
    Wav.Play;
    TimerWav.Enabled := False;
    TimerWav.Enabled := (gConfig.AvisoFimTempoAdminS>4) and (FNumAvisoFimTempo>0);
  end;
end;

function TfbMaquinas.ToolbarIsRibbonGroup(aBar: TdxBar): Boolean;
begin
  Result := (aBar = BarMgr.BarByComponentName('BarMgrBar1'));
end;

procedure TfbMaquinas.TVStatusGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText := Maquinas[ARecord.RecordIndex].StatusSt;
end;

procedure TfbMaquinas.VenderCred(Sender: TObject; aFidResg: Boolean);
var
  DT: TDadosTempo;  
  CT: TncCredTempo;
  S: TncSessao;
  MinutosT: Double;
  ValorT: Currency;
begin
  inherited;
  DT.Limpa;
  MinutosT := 0;
  ValorT := 0;
  
  with Dados do
{  if aFidResg then
    S := nil else}
    S := CM.Sessoes.PorMaq[mtMaquinaNumero.AsInteger];
    
  if S<>nil then begin
    DT.dtMaq := S.Maq;
    DT.dtTipoAcesso := S.TipoAcesso;
    DT.dtDadosCli.dcCodigo := S.Cliente;
    if S.Cliente>0 then
      DT.dtDadosCli.dcNome := S.NomeCliente;
    MinutosT := S.MinutosTotCredTempo;
    ValorT := S.ValorTotCredTempo;  
  end;
  if aFidResg then DT.dtFidResgate := True;
  
  if TFrmTempo.Create(Self).Editar(True, True, @DT, 0, (Sender=cmVenderCred) or aFidResg, MinutosT, ValorT) then  
    try
      CT := TncCredTempo.Create;
      DT.SaveToCredTempo(CT);
      if (Dt.dtMaq>0) and (S<>nil) then CT.teSessao := S.ID;
      CT._Operacao := osIncluir;
      Dados.CM.SalvaCredTempo(CT);
    finally
      CT.Free;
    end;
end;

procedure TfbMaquinas.TVInicioTicksGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if Maquinas[ARecord.RecordIndex]=nil then Exit;
  AText := Maquinas[ARecord.RecordIndex].Tempo;
end;

procedure TfbMaquinas.cmFidelidadeClick(Sender: TObject);
var P: TPoint;
begin
  inherited;
  P := ItemLinkScreenPoint(cmFidelidade.ClickItemLink);
  pmFidelidade.Popup(P.X, P.Y);
end;

procedure TfbMaquinas.cmFinalizarClick(Sender: TObject);
var S: TncSessao;
begin
  inherited;
  with Dados do begin
    S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
    if S=nil then begin
      Beep;
      ShowMessage('Não existe acesso em andamento na máquina '+mtMaquinaNumero.AsString);
      Exit;
    end;

    if S.Encerrou then begin
      Beep;
      ShowMessage('O Acesso para essa máquina já foi finalizado e aguarda pagamento. '+
                  'Você poderá registrar o pagamento através do duplo-clique ou do botão "Editar"');
      Exit;
    end;
  
    if SimNao('Deseja realmente finalizar o acesso na máquina ' +mtMaquinaNumero.AsString + ' ?')
    then begin
      if S.TipoCli=tcManutencao then begin
        CM.LogoutMaq(mtMaquinaNumero.Value);
        SessoesFinalizadas.Add(IntToStr(S.ID));
//        CM.ModoManutencao(mtMaquinaNumero.Value, False)
      end else begin              
        CM.LogoutMaq(mtMaquinaNumero.Value);
        SessoesFinalizadas.Add(IntToStr(S.ID));
      end;  
    end;  
  end;      
end;

procedure TfbMaquinas.cmJobDeleteClick(Sender: TObject);
var J : TncJob;
begin
  with Dados, CM do begin
    J := Jobs.PorJobID[panConfImp.Tag, lbPaginas.Tag];
    if (J<>nil) then
      JobControl(J.PrinterIndex, J.JobID, jc_delete);
  end;
end;

procedure TfbMaquinas.cmJobResumeClick(Sender: TObject);
var J : TncJob;
begin
  with Dados, CM do begin
    J := Jobs.PorJobID[panConfImp.Tag, lbPaginas.Tag];
    if (J<>nil) then
      JobControl(J.PrinterIndex, J.JobID, jc_resume);
  end;
end;

procedure TfbMaquinas.cmLiberarClick(Sender: TObject);
var 
  S : TncSessao;
begin
  inherited;
  ChecaCaixa;
  with Dados do begin
    S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
    if (S<>nil) then begin
      if S.Pausado then begin
        CM.PararMaq(S.Maq, False);
        Exit;
      end;
    end;  
  end;  
    
  with Dados do
  if S<>nil then begin
    Beep;
    if S.Encerrou then 
      ShowMessage('Para iniciar um novo acesso nessa máquina é necessário registrar o pagamento. '+
                  'Você poderá registrar o pagamento através do duplo-clique ou do botão "Editar"')
    else
      ShowMessage('Já existe um acesso em andamento na máquina '+mtMaquinaNumero.AsString);
    Exit;
  end;

  S := TFrmIniciarSessao.Create(nil).Iniciar(Dados.mtMaquinaNumero.Value);
  if S<>nil then
  try
    S.UsernameLogin := 'anonimo';
    S.SenhaLogin := 'anonimo';
    if (not Permitido(daIniciarAcessoGratis)) and (S.Cliente>0) and Dados.tbCli.Locate('ID', S.Cliente, []) and Dados.tbCliIsento.Value then
    begin
      Beep;
      ShowMessage('Acesso gratuito só pode ser aberto diretamente na máquina cliente.');
      Exit;
    end;
    
    if S.TipoCli=tcManutencao then
      Dados.CM.ModoManutencao(S.Maq, True) else
      Dados.CM.LoginMaq(S);
  finally
    S.Free;
  end;
end;

procedure TfbMaquinas.cmLigarMaqClick(Sender: TObject);
var M : TncMaquina;
begin
  M := Dados.CM.Maquinas.PorNumero[Dados.mtMaquinaNumero.Value];
  if (M<>nil) then begin
    if (M.IDCliente<1) then begin
      if (M.MacAddress>'') then begin
        DebugMsg('TfbMaquinas.cmLigarMaqClick - Mac Address: ' + M.MacAddress);
        WakeOnLan(M.MacAddress, '');
      end else
        DebugMsg('TfbMaquinas.cmLigarMaqClick - SEM Mac Address');
    end else
      DebugMsg('TfbMaquinas.cmLigarMaqClick - IDCliente='+IntToStr(M.IDCliente));
  end else 
    DebugMsg('TfbMaquinas.cmLigarMaqClick - M = nil');
end;

procedure TfbMaquinas.cmLigarTodasClick(Sender: TObject);
var I : Integer;
begin
  inherited;      
  with Dados.CM.Maquinas do
  for I := 0 to count-1 do with Itens[I] do 
  if (IDCliente<1) and (MacAddress>'') then
    WakeOnLan(MacAddress, '');
end;

procedure TfbMaquinas.cmLogoffWinClick(Sender: TObject);
begin
  inherited;
  TFrmOperMaq.Create(nil).Mostrar(Dados.mtMaquinaNumero.Value, operLogoff);
end;

procedure TfbMaquinas.cmPausarClick(Sender: TObject);
var S: TncSessao;
begin
  inherited;
  with Dados do begin
    S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
    if (S=nil) then Exit;
    CM.PararMaq(S.Maq, not S.Pausado);

    if (S<>nil) and S.Pausado then
      cmPMPausar.Caption := '&E. Despausar' else
      cmPMPausar.Caption := '&E. Pausar';
  end;  
end;

procedure TfbMaquinas.cmPausarTodasClick(Sender: TObject);
var I: Integer;
begin
  with Dados, CM do 
  for I := 0 to Sessoes.Count-1 do with Sessoes[I] do 
  try
    if (not Pausado) and (not Encerrou) then
      CM.PararMaq(Sessoes[I].Maq, True);
  except
  end;
end;

procedure TfbMaquinas.cmPMDesligarClick(Sender: TObject);
begin
  inherited;
  TFrmOperMaq.Create(nil).Mostrar(Dados.mtMaquinaNumero.Value, operShutdown);
end;

procedure TfbMaquinas.cmProgUsoClick(Sender: TObject);
begin
  inherited;
  TFrmProcessos.Create(nil).Mostrar(Dados.mtMaquinaNumero.Value);
end;

procedure TfbMaquinas.cmPropMaqClick(Sender: TObject);
var M : TncMaquina;
begin
  inherited;
  
  with Dados do 
  M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
  if M=nil then Exit;
  TFrmMaq.Create(Self).Editar(M);
end;

procedure TfbMaquinas.FrmBasePaiCreate(Sender: TObject);
var 
  I : Integer;
begin
  inherited;
  fbMaquinas := Self;
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

  
end;

procedure TfbMaquinas.cmTransferirClick(Sender: TObject);
var P: TPoint;
begin
  inherited;
  P := ItemLinkScreenPoint(cmTransferir.ClickItemLink);
  pmTransf.ItemLinks.Clear;
  pmTransf.ItemLinks.Add.Item := cmMaquinasDest;
  pmTransf.Popup(P.X, P.Y);
end;

procedure TfbMaquinas.cmMaquinasDestClick(Sender: TObject);
var NumD: Integer;
begin
  inherited;
  with cmMaquinasDest do
  NumD := Integer(Items.Objects[ItemIndex]);

  with Dados, CM do
  if SimNao('Confirma transferência do acesso da máquina ' + 
                mtMaquinaNumero.AsString + ' para a máquina '+IntToStr(NumD)+' ?') then
    TransferirMaq(mtMaquinaNumero.Value, NumD);
end;

procedure TfbMaquinas.cmMaquinasDestGetData(Sender: TObject);
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
      cmMaquinasDest.Items.AddObject('Máquina '+IntToStr(Numero), TObject(Numero));
  end;
end;

procedure TfbMaquinas.cmMonitorConfigClick(Sender: TObject);
var T: Word;
begin
  inherited;
  T := gConfig.MinutosDesligaMon;
  if TFrmTempoDesligaMon.Create(Self).Editar(T) then
  begin
    gConfig.AtualizaCache;
    gConfig.MinutosDesligaMon := T;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);
  end;

end;

procedure TfbMaquinas.cmMonitorOffClick(Sender: TObject);
begin
  inherited;
  Dados.CM.MonitorOnOff(pmMaq.Tag, False);
end;

procedure TfbMaquinas.cmMonitorOnClick(Sender: TObject);
begin
  inherited;
  Dados.CM.MonitorOnOff(pmMaq.Tag, True);
end;

procedure TfbMaquinas.GridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Timer1.Enabled := False;
end;

procedure TfbMaquinas.GridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Timer1.Enabled := True;
end;

procedure TfbMaquinas.IncAvisoFimTempo;
begin
  Inc(FNumAvisoFimTempo);
  TocaAvisoFimTempo
end;

procedure TfbMaquinas.cmCapturarClick(Sender: TObject);
begin
  if cmPMCapturar.Enabled then
    TFrmCapt.Create(Self).Capturar(Dados.mtMaquinaNumero.Value);
end;

procedure TfbMaquinas.cmConfigClick(Sender: TObject);
begin
  inherited;
  TfbMaq(FrmPri.FM.FormAtivo).Paginas.ActivePageIndex := 1;
end;

procedure TfbMaquinas.cmCreditosClick(Sender: TObject);
var  S : TncSessao;
begin
  S := Dados.CM.Sessoes.PorMaq[Dados.mtMaquinaNumero.Value];
  if S<>nil then
    TFrmCreditos.Create(Self).Mostra(S, Self.EditarPass);
end;

function TfbMaquinas.ObtemTempo(aMaq, aAcesso: Integer): String;
begin
end;

procedure TfbMaquinas.pmMaqPopup(Sender: TObject);
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
      Result := 'Aguarda Pagto.'
    else  
    if S.TipoCli=tcManutencao then
      Result := 'Funcionário'     
    else 
    case S.MotivoPausa of
      mpPausaFimTempo : Result := 'Fim de Tempo';
      mpPausaAdmin    : Result := 'Pausado';
      mpPausaHorarioNP: Result := 'Hora Não Perm.';
    else
      Result := 'Em Uso';  
    end;
  end else
    Result := 'Livre';  
end;

procedure TfbMaquinas.CVDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited;
  with CV.DataController do 
    Accept := (DragM>0) and
              (Maquinas[FocusedRecordIndex]<>nil) and
              (Maquinas[FocusedRecordIndex].Status=smLivre);
end;

procedure TfbMaquinas.CVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  FLastRecChange := GetTickCount;
  RefreshBotoes;
end;

procedure TfbMaquinas.CVMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseDownEdit := ((GetTickCount - FLastRecChange) > 500);
  if FShowingHint>0 then 
    FrmPri.HC.HideHint;
end;

procedure TfbMaquinas.CVMouseLeave(Sender: TObject);
begin
  inherited;
  FrmPri.HC.HideHint;
  HotMaq := nil;
end;

procedure TfbMaquinas.CVMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  AHitTest: TcxCustomGridHitTest;
  AGridSite: TcxGridSite;
  AView: TcxGridDBCardView;
  M : TDadosGridMaq;
  RCH : TcxGridRecordCellHitTest;
  XCell : Integer;
  hItem : Integer;
  P : TPoint;
begin
  P.X := X;
  P.Y := Y;
  P := Grid.ClientToScreen(P);
  P.Y := P.Y+22;
  AGridSite := Sender as TcxGridSite;
  AView := AGridSite.GridView as TcxGridDBCardView;
  AHitTest := AView.GetHitTest(X, Y);
  if AHitTest<>nil then
    AGridSite.Cursor := AHitTest.Cursor;
//  FrmPri.Caption := 'X: '+IntToStr(X) + ' Y: '+IntToStr(Y);
  if (AHitTest is TcxGridRecordCellHitTest) then
  begin
    RCH := TcxGridRecordCellHitTest(AHitTest);
    hItem := TcxGridRecordCellHitTest(AHitTest).Item.Index;
    M := Maquinas[RCH.GridRecord.Index];
    HotMaq := M;
    xCell := -1;
    if M<>nil then
    if (hItem = CVRodape.Index) then begin
      with CV.OptionsView do begin
        XCell := X mod (CardWidth+CardIndent);
        if (xCell<CardWidth) and (xCell>(CardWidth-46)) then begin
          if (gConfig.OpcaoChat<>ochDesabilitar) and M.GuardOk and (M.Status in [smUsoPre, smUsoPos, smPausa, smFunc, smUsoPrev]) then
            xCell := ibtnChat
        end else
        if xCell>(CardIndent+2) then begin
          XCell := ((XCell - CardIndent - 3) div 20) + 1;
          if xCell>ibtnImpressao then xCell := 0;
          case xCell of
            ibtnImpressao : if not M.Imp then xCell := 0;
            ibtnGuardOk : if M.GuardOk then xCell := 0;
            ibtnVenda : if not M.Vendas then xCell := 0;
          end;
        end else
          xCell := 0;
      end;
      if not (xCell in [ibtnGuardOk..ibtnChat]) then
        M := nil;
    end else
    if (hItem = CVNomeCli.Index) and (M<>nil) and (Trim(M.Nome)>'') then begin
      M := Maquinas[RCH.GridRecord.Index];
      xCell := ibtnNome;
    end else
      M := nil;

    if (FLastFocus<>nil) and ((FLastFocus<>M) or (FLastFocus.FocusBtn<>xCell)) then 
      FLastFocus.FocusBtn := 0;

    if (FShowingHint<>0) and (M=nil) or (FShowingHint<>xCell) then begin
      FrmPri.HC.HideHint;
      FShowingHint := 0;
    end;
      
    if M<>nil then begin
      aGridSite.Cursor := crHandPoint;
      M.FocusBtn := xCell;
      if (FShowingHint<>xCell) and (xCell<>0) then
      case xCell of
        ibtnVenda : 
          if M.Vendas then begin
            FrmPri.MostraHint(P.X, P.Y, 'Produtos Vendidos', 'Clique para editar/corrigir a venda mais recente para essa máquina');
            FShowingHint := ibtnVenda;
          end;
        ibtnImpressao : 
          if M.Imp then begin
            FrmPri.MostraHint(P.X, P.Y, 'Impressões', 'Clique para editar/corrigir a impressão mais recente dessa máquina');
            FShowingHint := ibtnImpressao;
          end;

        ibtnChat : 
          begin
            FrmPri.MostraHint(P.X, P.Y, 'Chat', 'Clique para enviar uma mensagem de chat para essa máquina');
            FShowingHint := ibtnChat;
          end;
          
        ibtnGuardOk : 
          if not M.GuardOk then begin
            FrmPri.MostraHint(P.X, P.Y, 'Sem conexão', 'Essa máquina não está conectada no servidor NexCafé. Clique para saber mais.');
            FShowingHint := ibtnGuardOk;
          end;

        ibtnNome : 
          if (Trim(M.Nome)>'') then begin
            FrmPri.MostraHint(P.X, P.Y, 'Editar Cliente', 'Mantenha a tecla CTRL apertada e clique no nome do cliente para editar.');
            FShowingHint := ibtnNome;
          end;
      end;
    end;

    FLastFocus := M;  
  end else begin
    HotMaq := nil;
    if FLastFocus<>nil then begin
      FLastFocus.FocusBtn := 0;
      FLastFocus := nil;
    end;
    if FShowingHint<>0 then begin
      FrmPri.HC.HideHint;
      FShowingHint := 0;
    end;
  end;

end;

procedure TfbMaquinas.CVMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var 
  T, I: Integer;  
  S : TncSessao;
  Str: String;
  
begin
  if Dados.mtMaquinaNumero.Value=9999 then Exit;
  
  if Button=mbRight then begin
    if ssCtrl in Shift then
      cmVenderCredClick(nil)
    else
    if ssAlt in Shift then
      cmVendaAcessoClick(nil) 
{    else begin
      RefreshBotoes;
      pmMaq.PopupFromCursorPos;
    end;}
  end else 
  if (FLastFocus<>nil) then
    case FLastFocus.FocusBtn of
      ibtnGuardOk   : if not FLastFocus.GuardOk then TFrmInfoMaq.Create(Self).ShowModal;
      ibtnVenda     : if FLastFocus.Vendas then begin
        with Dados do
        S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
        if S<>nil then
          T := S.UltimaTranVenda else
          T := 0;
        if (T>0) then 
          Dados.EditarTran(T);
      end;
      ibtnImpressao : if FLastFocus.Imp then begin
        with Dados do
        S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
        if S<>nil then
          T := S.UltimaTranImp else
          T := 0;
        if (T>0) then 
          Dados.EditarTran(T);
      end;
      ibtnChat : 
        if TFrmMsgChat.Create(Self).EnviarMsg(Str, Dados.mtMaquinaNumero.Value) then 
          Dados.CM.EnviaChat(Dados.mtMaquinaNumero.Value, Str);
      ibtnNome : if (ssCtrl in Shift) then
      with Dados do begin
        S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
        if (S<>nil) and (S.Cliente>0) then
          if tbCli.Locate('ID', S.Cliente, []) then
            TFrmCadCli.Create(nil).Editar(tbCli, nil);
      end;
    end;
end;

function ValorZero(S: String): Boolean;
var I : Integer;
begin
  for I  := Length(S) downto 1 do 
    if not (S[I] in ['1'..'9']) then
      Delete(S, I, 1);
  Result := (S='');    
end;

procedure TfbMaquinas.CVCanSelectRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
  inherited;
  aAllow := True;
end;

procedure TfbMaquinas.CVCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  Cor : TCorStatus;
  S   : Integer;
  V   : Variant;
begin
  V := AViewInfo.GridRecord.Values[CVNumero.Index];
  if (V<>null) and (V=9999) then begin
//    if AViewInfo.GridRecord.Selected then 
      ACanvas.Font.Color := clGray{ else 
      ACanvas.Font.Color := $00E4E4E4};
    Exit;
  end;
  
  if Maquinas[AViewInfo.GridRecord.RecordIndex]=nil then exit;
  if AViewInfo.Item=CVNumero then Exit;

  S := Maquinas[AViewInfo.GridRecord.RecordIndex].Status;
  Cor := FCores[S];
  ACanvas.Font.Name := 'Tahoma';

  ACanvas.Font.Color := Cor.cmFonte[AViewInfo.GridRecord.Selected];

  if Pos('Reservado', AViewInfo.Text)>0  then
    ACanvas.Brush.Color := clYellow else
    ACanvas.Brush.Color := Cor.cmFundo[AViewInfo.GridRecord.Selected];

{  if (AViewInfo.Item=CVTempo) and (S=smPausa) and 
     (not ValorZero(Maquinas[AViewInfo.GridRecord.RecordIndex].Valor)) then begin
    ACanvas.Brush.Color := clBlack;
    ACanvas.Font.Color := clWhite;
  end;}
      
{  if (S=smLivre) or ((S=smFunc) and (AViewInfo.Item<>CVTempo)) then 
    ACanvas.Font.Color := ACanvas.Brush.Color;}
end;

procedure TfbMaquinas.CVTempoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var V: Variant;  
begin
  V := ARecord.Values[CVNumero.Index];
  if (V<>null) and (V=9999) then begin
    AText := 'Cadastrar Máquina';
    Exit;
  end;

  if (ARecord.RecordIndex<0) or (ARecord.RecordIndex>255) then Exit;
  if Maquinas[ARecord.RecordIndex]=nil then Exit;
  try
    with Maquinas[ARecord.RecordIndex] do 
    if Status=smForaAr then
      AText := '-- Indisponível --' else
      AText := Tempo + ' = ' + Valor;
    if Trim(AText)='=' then
      AText := '';
  except
  end;
end;

procedure TfbMaquinas.FrmBasePaiDestroy(Sender: TObject);
var I : Integer;
begin
  inherited;
  fbMaquinas := nil;
  for I := 0 to Max_Maq-1 do FreeAndNil(Maquinas[I]);
end;

procedure TfbMaquinas.CVRodapeCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var 
  X, Y: Integer;  
  Cor : TCorStatus;
  S, I : Integer;
  R : TRect;
  M : TDadosGridMaq;
  V: Variant;
begin
  if Maquinas[AViewInfo.GridRecord.RecordIndex]=nil then exit;
  S := Maquinas[AViewInfo.GridRecord.RecordIndex].Status;
  M := Maquinas[AViewInfo.GridRecord.RecordIndex];
  
//  if (S=smLivre) or (S=smFunc) then Exit;
  Cor := FCores[S];                                         
  ACanvas.Font.Color := Cor.cmFonte[AViewInfo.GridRecord.Selected];
  ACanvas.Brush.Color := Cor.cmFundo[AViewInfo.GridRecord.Selected];
  ACanvas.FillRect(AviewInfo.Bounds);
  R := AViewInfo.Bounds;
  R.Left := R.Left+2;
  R.Top  := R.Top + 1;

  if M.FocusBtn=ibtnGuardOK then
    I := 1 else
    I := 0;

  if not M.GuardOK then begin
    if M.FocusBtn=ibtnGuardOk then
      I := 1 else
      I := 0;
{  end else begin
    if M.FocusBtn=ibtnGuardOk then
      I := 1 else
      I := 0;}
    ACanvas.DrawImage(imRod, R.Left, R.Top-1, I) ;
  end;
    
  R.Left := R.Left + 20;

  if M.FocusBtn=ibtnVenda then
    I := 3 else
    I := 2;
  
  if M.Vendas then
    ACanvas.DrawImage(imRod, R.Left, R.Top-1, I);
    
  R.Left := R.Left + 20;

  if M.ImpJob then begin
    if M.FocusBtn=ibtnImpressao then
      I := 7 else
      I := 6;
    ACanvas.DrawImage(imRod, R.Left, R.Top-1, I);
  end else
  if M.Imp then begin
    if M.FocusBtn=ibtnImpressao then
      I := 5 else
      I := 4;
    ACanvas.DrawImage(imRod, R.Left, R.Top-1, I);
  end;
      
//  R.Left := R.Left + 25;  

  R.Left := R.Right - 45;   

  if M.Hot and M.GuardOk and (M.Status in [smUsoPre, smUsoPos, smPausa, smFunc, smUsoPrev]) then
    if M.FocusBtn=ibtnChat then
      ACanvas.DrawImage(ilChat, R.Left, R.Top-1, 1) else
      ACanvas.DrawImage(ilChat, R.Left, R.Top-1, 0);
    
  ADone := True;
end;

procedure TfbMaquinas.CVNomeCliCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var 
  X, Y: Integer;  
  Cor : TCorStatus;
  R : TRect;
  M : TDadosGridMaq;
  V: Variant;
  Sessao : TncSessao;
begin
  V := AViewInfo.GridRecord.Values[CVNumero.Index];
  if (V<>null) and (V=9999) then begin
    if AViewInfo.GridRecord.Selected then 
      ACanvas.Font.Color := clGray else 
      ACanvas.Font.Color := $00E4E4E4;
    Exit;
  end;
  if Maquinas[AViewInfo.GridRecord.RecordIndex]=nil then exit;
  M := Maquinas[AViewInfo.GridRecord.RecordIndex];
  
//  if (S=smLivre) or (S=smFunc) then Exit;
  Cor := FCores[M.Status];                                         
  ACanvas.Font.Color := Cor.cmFonte[AViewInfo.GridRecord.Selected];

  if Pos('Reservado', AViewInfo.Text)>0  then
    ACanvas.Brush.Color := clYellow else
    ACanvas.Brush.Color := Cor.cmFundo[AViewInfo.GridRecord.Selected];
    
  ACanvas.FillRect(AviewInfo.Bounds);
  R := AViewInfo.Bounds;
  
  Sessao := Dados.CM.Sessoes.PorMaq[M.FMaq.Numero];

  ACanvas.Font.Name := 'Tahoma';
  ACanvas.Font.Size := 7;
  if M.FocusBtn=ibtnNome then
    ACanvas.Font.Style := [fsUnderline] else
    ACanvas.Font.Style := [];

  if M.PontosCli > '' then R.Right := R.Right - 53;
  ACanvas.DrawTexT(M.Nome, R, cxAlignCenter or cxShowEndEllipsis);
  ACanvas.Font.Style := [];
  R := AViewInfo.Bounds;
  if M.PontosCli > ''  then begin
    R.Left := R.Right - 34;
    ACanvas.DrawTexT(M.PontosCli, R, cxAlignLeft or cxAlignVCenter);
    R.Left := R.Right - 50;
    ACanvas.DrawImage(Dados.im16, R.Left, R.Top, 1);
  end;

  ADone := True;
end;

procedure TfbMaquinas.CVNomeCliGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;
begin
  V := ARecord.Values[CVNumero.Index];
  if (V<>null) and (V=9999) then begin
    AText := '(duplo clique aqui)';
    Exit;
  end;
  if Maquinas[aRecord.RecordIndex]=nil then exit;
  with Maquinas[ARecord.RecordIndex] do 
    AText := Nome;
end;

procedure TfbMaquinas.CVNumeroCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  R : TRect;
  Cor : TCorStatus;
  M : TncMaquina;
  Cor1, Cor2 : TColor;
  S : String;

procedure Grad;
begin
  with R do 
    Bottom := Top + ((Bottom-Top) div 2);
  DrawGradient(ACanvas.Canvas, R, Cor1, Cor2, 10, True);
  with R do begin
    Top := Bottom;
    Bottom := AViewInfo.Bounds.Bottom;
  end;   
  DrawGradient(ACanvas.Canvas, R, Cor2, Cor1, 10, True);
end;
  
begin
  if Maquinas[AViewInfo.GridRecord.RecordIndex]=nil then exit;
  Cor := FCores[Maquinas[AViewInfo.GridRecord.RecordIndex].Status];
  M := Maquinas[AViewInfo.GridRecord.RecordIndex].FMaq;
    
  ACanvas.Font.Color := Cor.cmCabFonte;
  
  R := AViewInfo.Bounds;
{  ACanvas.Brush.Color := Cor.cmCabFundo;
  ACanvas.FillRect(R);}
  Cor1 := Cor.cmCabFundo;
  Cor2 := Cor.cmCabFundoC;
  if not AViewInfo.GridRecord.Selected then begin
    R.Right := R.Left + 28;
    Grad;
    R := AViewInfo.Bounds;
    R.Left := R.Left + 28;
    Cor1 := FCab;
    Cor2 := FCabC;
  end;  
  Grad;
  
  R := AViewInfo.Bounds;
  R.Right := R.Left + 28;

  ACanvas.Brush.Color := Cor.cmCabFundo;
  ACanvas.Brush.Style := bsClear;
  SetBkMode(ACanvas.Handle, Transparent);
  SetTextColor(ACanvas.Handle, ColorToRGB(ACanvas.Font.Color)); 
  ACanvas.Font.Name  := 'Tahoma';
  ACanvas.Font.Style := [fsBold];
  ACanvas.Font.Size  := 8;
  ACanvas.DrawText(IntToStr(M.Numero), R, cxAlignHCenter + cxAlignVCenter);
  
  ACanvas.Font.Style := [];  
  R := AViewInfo.Bounds;
  if not AViewInfo.GridRecord.Selected then
    ACanvas.Font.Color := clBlack;
  R.Left := AViewInfo.Bounds.Left + 28;
  R.Right := R.Left+1;              
  ACanvas.Brush.Color := Cor.cmCabFundo;
  ACanvas.FillRect(R);
  R.Right := AViewInfo.Bounds.Right;
  SetBkMode(ACanvas.Handle, Transparent);
  SetTextColor(ACanvas.Handle, ColorToRGB(ACanvas.Font.Color)); 
  R.Left := R.Left + 4;
  with Maquinas[AViewInfo.GridRecord.RecordIndex] do begin
    S := StatusSt;
    if gConfig.VariosTiposAcesso and (gTiposAcesso.Count>1) and (Status in [smUsoPre, smUsoPos, smPausa, smUsoPrev]) then
      S := S + ' (' + TipoAcesso + ')';
  end;
  
  ACanvas.DrawTexT(S, R, cxAlignLeft + cxAlignVCenter);
  ADone := True;
end;

procedure TfbMaquinas.CVNumeroGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if AText='9999' then AText := '';

end;

procedure TfbMaquinas.CVObsGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if Maquinas[aRecord.RecordIndex]=nil then exit;
  AText := Maquinas[ARecord.RecordIndex].Obs;
end;

procedure TfbMaquinas.CVProgramaGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var 
  M : TncMaquina;
  Str : String;
begin
  inherited;
  if Maquinas[ARecord.RecordIndex]=nil then exit;
  if Maquinas[ARecord.RecordIndex].FStatus = smLivre then
    AText := '' 
  else
  begin  
    M := Maquinas[ARecord.RecordIndex].FMaq;
    if M<>nil then 
      AText := M.ProgramaAtual else
      AText := '';
  end;
end;

procedure TfbMaquinas.TVNumeroCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Cor : TCorStatus;
begin
  if Maquinas[AViewInfo.GridRecord.RecordIndex]=nil then exit;
  Cor := FCores[Maquinas[AViewInfo.GridRecord.RecordIndex].Status];
  ACanvas.Font.Color := Cor.cmCabFonte;
  ACanvas.Brush.Color := Cor.cmCabFundo;
end;

procedure TfbMaquinas.AjustaLayoutLargeButton(B: TdxBarLargeButton);
begin
//
end;

procedure TfbMaquinas.AtualizaDireitos;
var I : Integer;
begin
  inherited;
  cmMonitorConfig.Enabled := Dados.CM.UA.Admin;
  
  Dados.mtMaquina.Filtered := SameText(slConfig.Values['RemoveAddMaq'], 'S');
  
  CVNomeCli.Properties.Alignment.Horz := taCenter;
  if FLerLayout then Timer3.Enabled := True;
  TimerWav.Interval := gConfig.AvisoFimTempoAdminS * 1000;

  if Permitido(daAtenderClientes) then
    for I := 0 to BarMgr.ItemCount - 1 do
      BarMgr.Items[I].Enabled := True;
      
//  cmFidelidade.Enabled := Versoes.PodeUsar(idre_fidelidade) and gConfig.FidAtivo;
//  cmSubFidelidade.Enabled := cmFidelidade.Enabled;

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
    
    CVPrograma.Visible := MostraProgAtual;
    CVObs.Visible := MostraObs;
    CVNomeMaq.Visible := MostraNomeMaq;
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

  TimerRealinha.Enabled := False;
  TimerRealinha.Enabled := True;
  

  RefreshBotoes;
end;

procedure TfbMaquinas.RefreshBotoes;
var
  S : TncSessao;
  M : TncMaquina;
  LigT : Boolean;
  I : Integer;
  J : TncJob;
  Str : String;
begin
  try
    with Dados, CM do begin
      S := Sessoes.PorMaq[mtMaquinaNumero.Value];
      M := Maquinas.PorNumero[mtMaquinaNumero.Value];
      if M=nil then begin
        cmNumM.Visible := ivNever;
        panConfImp.Visible := False;
        for I := 0 to BarMgr.ItemCount - 1 do
          BarMgr.Items[I].Enabled := False;
        cmSubPag.Enabled := True;
        cmConfig.Enabled := True;  
        Exit;
      end;
  
      cmNumM.Visible := ivAlways;
      cmNumM.Caption := 'Máquina ' + IntToStr(M.Numero);
  
      for I := 0 to BarMgr.ItemCount - 1 do
        BarMgr.Items[I].Enabled := True;
      
      if S<>nil then
        J := Jobs.JobPendMaq(M.Numero, False) else
        J := nil;

      if (J<>nil) then begin
        panConfImp.Tag := J.PrinterIndex;
        lbPaginas.Tag := J.JobID;
        panConfImp.Visible  := True;
        lbPaginas.Caption := IntToStr(J.PaginasReg);
        lbDoc.Caption := J.Document;
        lbImp.Caption := J.PrinterName;

        if J.MaxImpDia>0 then begin
          lbCotaDia.Caption := IntToStr(J.MaxImpDia)+'pg';
          lbImpDia.Caption := IntToStr(J.ImpDia)+'pg';
          panCotaDia.Visible := True;
        end else
          panCotaDia.Visible := False;

        if J.MaxImpMes>0 then begin
          lbCotaDia.Caption := IntToStr(J.MaxImpDia)+'pg';
          lbImpDia.Caption := IntToStr(J.ImpDia)+'pg';
          panCotaMes.Visible := True;
        end else
          panCotaMes.Visible := False;
          
        if J.PaginasReg=1 then
          lbPaginas.Caption := lbPaginas.Caption + ' página' else
          lbPaginas.Caption := lbPaginas.Caption + ' páginas';
          
      end else
        panConfImp.Visible := False;
  
      cmFidelidade.Enabled := Versoes.PodeUsar(idre_fidelidade) and gConfig.FidAtivo;
      cmSubFidelidade.Enabled := cmFidelidade.Enabled;
      
  
      cmLigar.Enabled := True;
      cmSubPag.Enabled := True;
  
      cmPMPausar.Enabled := (S<>nil) and (not S.Encerrou) and (S.FimTempo.Minutos=0);
      cmPausar.Enabled := cmPMPausar.Enabled;
      if (S<>nil) and S.Pausado then
        cmPMPausar.Caption := 'Despausar máq. '+IntToStr(M.Numero) else
        cmPMPausar.Caption := 'Pausar máq. '+IntToStr(M.Numero);
      cmPMFinalizar.Enabled := (S<>nil) and (not S.Encerrou);
      cmFinalizar.Enabled := cmPMFinalizar.Enabled;
      cmPMEditar.Enabled := (S<>nil);
      cmEditar.Enabled := cmPMEditar.Enabled;
      if M<>nil then
        cmBloqSite.Caption := '&P. Bloquear site: ' + DomainAndSubdomain(FormataSiteStr(M.SiteAtual)) else
        cmBloqSite.Caption := '&P. Bloquear site';
      cmBloqSite.Enabled := ncaDM.Permitido(daFWAlterar);  
      cmPMIniciar.Enabled := (S=nil);
      cmLiberar.Enabled := cmPMIniciar.Enabled;
      cmAddTempo.Enabled := (S<>nil) and (S.TipoCli<>tcManutencao) and (not S.Encerrou);
      cmAddProduto.Enabled := (S<>nil) and (S.TipoCli<>tcManutencao);
      cmVendaAcesso.Enabled := cmAddProduto.Enabled;
      cmAddImp.Enabled := (S<>nil);
      cmCreditos.Enabled := (S<>nil);
      cmEditarCliente.Enabled := (S<>nil) and (S.Cliente>0);
      if cmEditarCliente.Enabled then
        cmEditarCliente.Tag := S.Cliente else
        cmEditarCliente.Tag := 0;
      cmSubTransf.Enabled := (S<>nil) and (not S.Encerrou);
      cmTransferir.Enabled := cmSubTransf.Enabled;
      cmDownload.Enabled := (S<>nil) and (not S.Encerrou) and (S.TipoCli<>tcManutencao);
      cmDownloadExe.Enabled := cmDownload.Enabled;
      
      cmDownload.Down := (S<>nil) and (S.PermitirDownload);
      cmDownloadExe.Down := (S<>nil) and (S.PermitirDownloadExe);

      cmDesativarFW.Enabled := (S<>nil) and 
                               (not S.Encerrou) and 
                               ncaDM.Permitido(daFWSessao);

      cmDesativarFW.Down := (S<>nil) and (not S.FiltrarWEB);                               
      
      cmPMDesligar.Enabled := (M<>nil) and (M.IDCliente>0); 
      cmDesligar.Enabled := cmPMDesligar.Enabled;
      cmPMFecharGuard.Enabled := cmPMDesligar.Enabled and ncaDM.Permitido(daMaqFecharCMGuard);
      cmDesbloquear.Enabled := cmPMFecharGuard.Enabled;
      cmPMReiniciar.Enabled := cmPMDesligar.Enabled;
      cmReiniciar.Enabled := cmDesligar.Enabled;

      cmMonitorOn.Enabled := cmDesligar.Enabled;
      cmMonitorOff.Enabled := cmDesligar.Enabled;
      
      cmPMCapturar.Enabled := cmPMDesligar.Enabled and ncaDM.Permitido(daCapturar);
      cmCapturar.Enabled := cmPMCapturar.Enabled;
  //    cmAcessoRemoto.Enabled := cmCapturar.Enabled;
      cmAcessoRemoto.Enabled := (ar_users.IndexOf(mtMaquinaNumero.AsString)>=0) and ncaDM.Permitido(daCapturar) and Versoes.PodeUsar(idre_controleremoto);
      cmComando.Enabled := cmCapturar.Enabled;
      cmProgUso.Enabled := cmPMDesligar.Enabled;
      cmProcessos.Enabled := cmProgUso.Enabled;
      cmEnviarChat.Enabled := cmPMDesligar.Enabled and (S<>nil) and (not S.Encerrou);
  
      cmLigarMaq.Enabled := Versoes.PodeUsar(idre_ligarmaq);
      cmLigarTodas.Enabled := cmLigarMaq.Enabled;
  
      if cmLigarMaq.Enabled then begin
        cmLigarMaq.Caption := '&5. Ligar máq.'+IntToStr(M.Numero);
        cmLigarMaq.Enabled := (M.MacAddress>'') and (M.IDCliente<1);
        LigT := cmLigarMaq.Enabled;
        if not LigT then 
        for I := 0 to CM.Maquinas.Count-1 do with CM.Maquinas[I] do
        if (MacAddress>'') and (IDCliente<1) then begin
          LigT := True;
          Break;
        end;
        cmLigarTodas.Enabled := LigT;
      end;
  
      if Versoes.PodeUsar(idre_bloqueiosite) then
        cmBloqSite.Visible := ivAlways else
        cmBloqSite.Visible := ivNever;
  
      if Versoes.PodeUsar(idre_listaprocessos) then
        cmProgUso.Visible := ivAlways else
        cmProgUso.Visible := ivNever;
  
      if Versoes.Podeusar(idre_chat) then
        cmEnviarChat.Visible := ivAlways else
        cmEnviarChat.Visible := ivNever; 
      
    end;
  
    if not Permitido(daAtenderClientes) then
      for I := 0 to BarMgr.ItemCount - 1 do
        BarMgr.Items[I].Enabled := False;
  except
  end;
end;

procedure TfbMaquinas.RefreshCacheMaq;
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

procedure TfbMaquinas.SetHotMaq(const Value: TDadosGridMaq);
begin
  if FHotMaq=Value then Exit;

  if FHotMaq<>nil then
    FHotMaq.Hot := False;
    
  FHotMaq := Value;

  if Value<>nil then
    FHotMaq.Hot := True;
end;

{ TDadosGridMaq }

constructor TDadosGridMaq.Create(AMaq: TncMaquina; AForm: TfbMaquinas; aIndex: Integer);
begin
  FHot := False;
  FMaq := AMaq;
  FForm := AForm;
  FGuardOk := False;
  FFocusBtn := 0;
  FVendas := False;
  FImp := False;
  FImpJob := False;
  FStatus := 0;
  FStatusSt := '';
  FTipoAcesso := '';
  FValor := '';
  FTempo := '';
  FIndex := aIndex;
  FTerminouTempo := False;
end;

function TDadosGridMaq.FocusItem(aFocusBtn: Byte): TcxCustomGridTableItem;
begin
  case aFocusBtn of
    ibtnChat,
    ibtnGuardOk,
    ibtnVenda,
    ibtnImpressao,
    ibtnControleRem : Result := FForm.CVRodape;
    ibtnNome        : Result := FForm.CVNomeCli;
  else
    Result := nil;    
  end;
end;

procedure TDadosGridMaq.Invalida(cellCV: TcxCustomGridTableItem);
begin
  if (FForm.CV.ViewData.RecordCount>FIndex) then
    FForm.CV.ViewData.Records[FIndex].Invalidate(cellCV);
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
  TerminouTempo := (S<>nil) and (not S.Encerrou) and (S.MotivoPausa=mpPausaFimTempo);
  StatusSt := StrStatus(S);
  if (Status=smLivre) and FMaq.EmManutencao then begin
    Status := smForaAr;
    StatusSt := 'Em Manutenção';
  end;

  Valor := AValor;
  Tempo := ATempo;
  GuardOk := (FMaq.IDCliente>0);
  Vendas := (S<>nil) and (S.UltimaTranVenda>0);
  Imp := (S<>nil) and (S.UltimaTranImp>0);
  ImpJob := (S<>nil) and (Dados.CM.Jobs.JobPendMaq(S.Maq, False)<>nil);
  
  if (S=nil) or (S.TipoCli=tcManutencao) then
    TA := nil else
    TA := gTiposAcesso.PorCodigo[S.TipoAcesso];
    
  if TA=nil then
    TipoAcesso := '' else
    TipoAcesso := TA.Nome;
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
        Nome := 'Reservado: ' + DM.tEspNomeCliente.Value else
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
    Invalida(FocusItem(FFocusBtn)); 
  
  FFocusBtn := Value;

  if FocusItem(Value)<>nil then
    Invalida(FocusItem(Value));
end;

procedure TDadosGridMaq.SetGuardOk(const Value: Boolean);
begin
  if Value = FGuardOK then Exit;
  FGuardOk := Value;
  Invalida(FForm.CVRodape);
end;

procedure TDadosGridMaq.SetHot(const Value: Boolean);
begin
  if Value=FHot then Exit;
  FHot := Value;
  Invalida(FForm.CVRodape);
end;

procedure TDadosGridMaq.SetImp(const Value: Boolean);
begin
  if Value = FImp then Exit;
  FImp := Value;
  Invalida(FForm.CVRodape);
end;

procedure TDadosGridMaq.SetImpJob(const Value: Boolean);
begin
  if Value = FImpJob then Exit;
  FImpJob := Value;
  Invalida(FForm.CVRodape);
end;

procedure TDadosGridMaq.SetNome(const Value: String);
begin
  if Value = FNome then Exit;
  FNome := Value;
  Invalida(FForm.CVNomeCli);
end;

procedure TDadosGridMaq.SetObs(const Value: String);
begin
  if Value = FObs then Exit;
  FObs := Value;
  Invalida(FForm.CVObs);
end;

procedure TDadosGridMaq.SetPontosCli(const Value: String);
begin
  if Value = FPontosCli then Exit;
  FPontosCli := Value;
  Invalida(FForm.CVNomeCli);
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
  Invalida(FForm.CVNumero);
end;

procedure TDadosGridMaq.SetTempo(const Value: String);
begin
  if Value = FTempo then Exit;
  FTempo := Value;
  Invalida(FForm.CVTempo);
end;

procedure TDadosGridMaq.SetTerminouTempo(const Value: Boolean);
var V : Boolean;
begin
  V := Value and (FMaq<>nil) and FMaq.AvisaFimTempo;
  if V = FTerminouTempo then Exit;
  FTerminouTempo := V;
  if V then
    FForm.IncAvisoFimTempo else
    FForm.DecAvisoFimTempo;
end;

procedure TDadosGridMaq.SetTipoAcesso(const Value: String);
begin
  if FTipoAcesso=Value then Exit;
  FTipoAcesso := Value;
  Invalida(FForm.CVNumero);
end;

procedure TDadosGridMaq.SetValor(const Value: String);
begin
  if Value = FValor then Exit;
  FValor := Value;
  Invalida(FForm.CVTempo);
end;

procedure TDadosGridMaq.SetVendas(const Value: Boolean);
begin
  if Value = FVendas then Exit;
  FVendas := Value;
  Invalida(FForm.CVRodape);
end;

procedure TfbMaquinas.CVDblClick(Sender: TObject);
var S: TncSessao;
begin
  inherited;

  if Dados.mtMaquinaNumero.Value=9999 then begin
    Dados.NovaMaq;
    Dados.mtMaquina.Filtered := SameText(slConfig.Values['RemoveAddMaq'], 'S');
    Exit;
  end;
  
  
  if NumAberto<1 then begin
    Beep;
    ShowMessage('Caixa está fechado!');
    Exit;
  end;

  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
    
  if S=nil then 
    cmLiberarClick(nil)
  else
  if S.Encerrou then
    cmEditarClick(nil)
  else
    cmFinalizarClick(nil);
end;

procedure TfbMaquinas.cmDesativarFWClick(Sender: TObject);
var S: TncSessao;
begin
  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
  if (S=nil) or (S.TipoCli=tcManutencao) then Exit;
  Dados.CM.DesativarFWSessao(S.ID, not S.FiltrarWEB);
end;

procedure TfbMaquinas.cmDesbloquearClick(Sender: TObject);
begin
  inherited;
  TFrmOperMaq.Create(nil).Mostrar(Dados.mtMaquinaNumero.Value, operFecharNex);
end;

procedure TfbMaquinas.cmDespausarTodasClick(Sender: TObject);
var I: Integer;
begin
  with Dados, CM do 
  for I := 0 to Sessoes.Count-1 do with Sessoes[I] do 
  try
    if Pausado then 
      CM.PararMaq(Sessoes[I].Maq, False);
  except
  end;
end;

procedure TfbMaquinas.cmDisableADClick(Sender: TObject);
var S: TncSessao;
begin
  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
  if (S=nil) or (S.TipoCli=tcManutencao) then Exit;
  Dados.CM.DisableAD(S.ID, not S.DisableAD);
end;

procedure TfbMaquinas.cmDownloadClick(Sender: TObject);
var S: TncSessao;
begin
  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
  if (S=nil) or (S.TipoCli=tcManutencao) then Exit;
  Dados.CM.PermitirDownload(S.ID, False, not S.PermitirDownload);
end;

procedure TfbMaquinas.cmDownloadExeClick(Sender: TObject);
var S: TncSessao;
begin
  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
  if (S=nil) or (S.TipoCli=tcManutencao) then Exit;
  Dados.CM.PermitirDownload(S.ID, True, not S.PermitirDownloadExe);
end;

procedure TfbMaquinas.cmEditarClick(Sender: TObject);
begin
  with Dados do
    EditarSessao(CM.Sessoes.PorMaq[mtMaquinaNumero.Value]);
end;

procedure TfbMaquinas.cmEditarClienteClick(Sender: TObject);
begin
  inherited;
  with Dados do 
    if tbCli.Locate('ID', cmEditarCliente.Tag, []) then
      TFrmCadCli.Create(nil).Editar(tbCli, nil);
end;

procedure TfbMaquinas.cmEnviarChatClick(Sender: TObject);
begin
  inherited;
  if Dados.mtMaquina.IsEmpty then Exit;
  FrmPri.MakeChatVisible(nil);
  FrmPri.FrmChat.edMaq.ItemIndex := Dados.mtMaquinaNumero.Value;
  FrmPri.FrmChat.meTexto.SetFocus;
end;

procedure TfbMaquinas.CVStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;

  with Dados do
  if CM.Sessoes.PorMaq[mtMaquinaNumero.Value]=nil then 
    DragM := -1
  else  
    DragM := mtMaquinaNumero.Value;
end;

procedure TfbMaquinas.CVDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  with Dados, CM do
  if SimNao('Confirma transferência do acesso da máquina ' + 
             IntToStr(DragM) + ' para a máquina ' + mtMaquinaNumero.AsString + '?') then
    TransferirMaq(DragM, mtMaquinaNumero.Value);
end;

procedure TfbMaquinas.cmVendaAcessoClick(Sender: TObject);
var
  S: TncSessao;
  IME : TncItemMovEst;
  ME : TncMovEst;
begin
  ChecaCaixa;
  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
  if (S=nil) or (S.TipoCli=tcManutencao) then Exit;
  
  IME := TncItemMovEst.Create;
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

procedure TfbMaquinas.cmVendaClick(Sender: TObject);
begin
  Dados.NovoMovEst(trEstVenda, 0);
end;

procedure TfbMaquinas.cmVenderCredClick(Sender: TObject);
begin
  VenderCred(Sender, False);
end;

procedure TfbMaquinas.cmAcessoRemotoClick(Sender: TObject);
begin
  inherited;
  Dados.AcessoRemoto(Dados.mtMaquinaNumero.AsString);
end;

procedure TfbMaquinas.cmAddImpClick(Sender: TObject);
var
  S: TncSessao;
  Imp : TncImpressao;
begin
  ChecaCaixa;
  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
  if (S=nil) then Exit;
  Imp := TncImpressao.Create;
  try
    Imp.impSessao := S.ID;
    Imp.impMaquina := S.Maq;
    Imp.impManual := True;
    if TFrmImp.Create(nil).Editar(True, True, Imp) then
    try
      Imp._Operacao := osIncluir;
      Imp.impCliente := S.Cliente;
      Dados.CM.SalvaImpressao(Imp);
    finally
      S.Impressoes.Remove(Imp);
    end;
  finally
    Imp.Free;
  end;
end;

procedure TfbMaquinas.cmBloqSiteClick(Sender: TObject);
var 
  S: String;
  M: TncMaquina;
begin
  inherited;
  with Dados do 
  M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
  if M<>nil then
    S := DomainAndSubdomain(FormataSiteStr(M.SiteAtual)) else
    S := '';
    
  S := TFrmSite.Create(nil).ObtemURL(S);
  if S>'' then begin
    DM.tFW.Insert;
    DM.tFWURL.Value := S;
    DM.tFW.Post;
  end;
end;

initialization
  fbMaquinas := nil;

end.
