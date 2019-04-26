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
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, 
  ncCredTempo,
  ncSessao, LMDCustomComponent, LMDWaveComp, LMDSysInfo, dxSkinsCore,
  dxSkinsdxBarPainter, dxSkinOffice2007Black, dxSkinSeven,
  dxSkinsDefaultPainters;


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
  public      
    constructor Create(AMaq: TncMaquina; AForm: TfbMaquinas; aIndex: Integer);

    procedure Recalc;
    procedure RecalcNome;
    procedure Invalida(cellCV: TcxCustomGridTableItem);

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
    property RecordIndex: Integer read FIndex;
    property TerminouTempo: Boolean read FTerminouTempo write SetTerminouTempo;
  end;
  
  TfbMaquinas = class(TFrmBase)
    cmLiberar: TdxBarLargeButton;
    cmPausar: TdxBarLargeButton;
    cmFinalizar: TdxBarLargeButton;
    imGuard: TImageList;
    Grid: TcxGrid;
    GL: TcxGridLevel;
    cmTransferir: TdxBarLargeButton;
    cmCapturar: TdxBarLargeButton;
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
    CV: TcxGridDBCardView;
    CVNumero: TcxGridDBCardViewRow;
    CVTempo: TcxGridDBCardViewRow;
    CVPrograma: TcxGridDBCardViewRow;
    ActionList1: TActionList;
    CVRodape: TcxGridDBCardViewRow;
    Image1: TImage;
    cxsPequeno: TcxStyle;
    cmDesligar: TdxBarLargeButton;
    pmMaq: TdxBarPopupMenu;
    cmVendaAcesso: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    CVObs: TcxGridDBCardViewRow;
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
    cmSuporteRem: TdxBarButton;
    cmPropMaq: TdxBarButton;
    CVNomeMaq: TcxGridDBCardViewRow;
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
    cmFidelidade: TdxBarLargeButton;
    pmFidelidade: TdxBarPopupMenu;
    cmResgTempo: TdxBarButton;
    cmResgProduto: TdxBarButton;
    cmSubFidelidade: TdxBarSubItem;
    CVNomeCli: TcxGridDBCardViewRow;
    Timer3: TTimer;
    LMDSysInfo1: TLMDSysInfo;
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
    procedure cmNovoClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
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
    procedure cmSuporteRemClick(Sender: TObject);
    procedure cmPropMaqClick(Sender: TObject);
    procedure cmMaquinasDestGetData(Sender: TObject);
    procedure cmPausarTodasClick(Sender: TObject);
    procedure cmDespausarTodasClick(Sender: TObject);
    procedure TimerWavTimer(Sender: TObject);
    procedure cmEditarClienteClick(Sender: TObject);
    procedure cmCreditosClick(Sender: TObject);
    procedure cmLigarMaqClick(Sender: TObject);
    procedure cmLigarTodasClick(Sender: TObject);
    procedure cmFidelidadeClick(Sender: TObject);
    procedure cmResgProdutoClick(Sender: TObject);
    procedure cmResgTempoClick(Sender: TObject);
    procedure CVNomeCliCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure Timer3Timer(Sender: TObject);
  private
    FLerLayout: Boolean;
    FMouseDown: Boolean;
    bmpCompras : TBitmap;
    bmpImp     : TBitmap;
    DragM      : Integer;
    FUltimoAvisoFimTempo : Cardinal;
    FNumAvisoFimTempo : Integer;
    Maquinas   : Array[0..Max_Maq-1] of TDadosGridMaq;
    { Private declarations }
    function ObtemTempo(aMaq, aAcesso: Integer): String;

    procedure VenderCred(Sender: TObject; aFidResg : Boolean);
  public
    class function Descricao: String; override;
    function ToolbarIsRibbonGroup(aBar: TdxBar): Boolean; override;
    
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

  
var
  fbMaquinas: TfbMaquinas;
  FCores    : Array[smLivre..smUsoPrev] of TCorStatus;
  FCab, FCabC: TColor;

implementation

uses ufmImagens, ncaDM, ncaFrmPri, ncIDRecursos,
  GraphUtil, 
  ncAuxPassaporte, ncaFrmDesliga, ncaFrmCaptura, ncaFrmTempo, ncaFrmSessao,
  ncMovEst, ncaFrmVendaProd, ncaFrmME, ncDMServ, ncaFrmProcessos, ncaFrmSite,
  ncVersoes, ncImpressao, ncaFrmImp, ncFrmSuporteRem, ncaFrmMaq, ncaFrmContato,
  ncaFrmCliente, ncFrmCreditos, ncPassaportes, ncaFrmPass, synamisc;

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
  Result := 'Máquinas';
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

procedure TfbMaquinas.cmPropMaqClick(Sender: TObject);
var M : TncMaquina;
begin
  inherited;
  with Dados do 
  M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
  if M=nil then Exit;
  TFrmMaq.Create(Self).Editar(M);
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

  S := TFrmSessao.Create(nil).Iniciar(Dados.mtMaquinaNumero.Value);
  if S<>nil then
  try
    S.UsernameLogin := 'anonimo';
    S.SenhaLogin := 'anonimo';
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
  inherited;
  M := Dados.CM.Maquinas.PorNumero[Dados.mtMaquinaNumero.Value];
  if (M<>nil) and (M.IDCliente<1) and (M.MacAddress>'') then
    WakeOnLan(M.MacAddress, '');
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
  TFrmDesliga.Create(nil).Mostrar(Dados.mtMaquinaNumero.Value, TdxBarButton(Sender).Tag);
end;

procedure TfbMaquinas.cmProgUsoClick(Sender: TObject);
begin
  inherited;
  TFrmProcessos.Create(nil).Mostrar(Dados.mtMaquinaNumero.Value);
end;

procedure TfbMaquinas.cmSuporteRemClick(Sender: TObject);
var Maq: Integer;
begin
  Maq := Dados.mtMaquinaNumero.Value;
  if TFrmSuporte.Create(nil).ObterSuporte(Maq, Dados.CM.Ativo, Dados.CM.Maquinas) then
  if Maq=0 then
    with Dados.CM.UA do 
      ChamaSuporte(Username + ': ' + Nome, FrmPri.VersaoStr) 
    else
      Dados.CM.SuporteRem(Maq, 0);    
end;

procedure TfbMaquinas.FrmBasePaiCreate(Sender: TObject);
var 
  I : Integer;
begin
  inherited;
  FLerLayout := True;
  FUltimoAvisoFimTempo := 0;
  FNumAvisoFimTempo := 0;
  for I := 0 to Max_Maq-1 do Maquinas[I] := nil;
  bmpCompras := TBitmap.Create;
  bmpImp     := TBitmap.Create;
  imGuard.GetBitmap(2, bmpCompras);
  imGuard.GetBitmap(3, bmpImp);
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
  RefreshBotoes;
end;

procedure TfbMaquinas.CVMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin
    if ssCtrl in Shift then
      cmVenderCredClick(nil) 
    else
    if ssAlt in Shift then
      cmVendaAcessoClick(nil) 
    else begin
      RefreshBotoes;
      pmMaq.PopupFromCursorPos;
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
begin
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
begin
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
  for I := 0 to Max_Maq-1 do FreeAndNil(Maquinas[I]);
  bmpCompras.Free;
end;

procedure TfbMaquinas.CVRodapeCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var 
  X, Y: Integer;  
  Cor : TCorStatus;
  S : Integer;
  R : TRect;
  M : TncMaquina;
  V: Variant;
  Sessao : TncSessao;
begin
  if Maquinas[AViewInfo.GridRecord.RecordIndex]=nil then exit;
  S := Maquinas[AViewInfo.GridRecord.RecordIndex].Status;
  M := Maquinas[AViewInfo.GridRecord.RecordIndex].FMaq;
  
//  if (S=smLivre) or (S=smFunc) then Exit;
  Cor := FCores[S];                                         
  ACanvas.Font.Color := Cor.cmFonte[AViewInfo.GridRecord.Selected];
  ACanvas.Brush.Color := Cor.cmFundo[AViewInfo.GridRecord.Selected];
  ACanvas.FillRect(AviewInfo.Bounds);
  R := AViewInfo.Bounds;
  R.Left := R.Left+2;
  R.Top  := R.Top + 1;

  ACanvas.DrawImage(imGuard, R.Left, R.Top-1, Byte((M.IDCliente>0)));
  R.Left := R.Left + imGuard.Width;

  Sessao := Dados.CM.Sessoes.PorMaq[M.Numero];

  if Sessao<>nil then begin 
    if Sessao.Transacoes.Total(trEstVenda)>0.009 then
    with bmpCompras, R do
    for X := 0 to Width-1 do
    for Y := 0 to Height-1 do
      if Canvas.Pixels[X, Y] = clBlack then
        ACanvas.Pixels[Left+X, Top+Y] := Cor.cmFonte[AViewInfo.GridRecord.Selected];
  
    R.Left := R.Left + bmpCompras.Width + 3;
    if Sessao.Transacoes.Total(trImpressao)>0.009 then
    with bmpImp do
    for X := 0 to Width-1 do
    for Y := 0 to Height-1 do
      if Canvas.Pixels[X, Y] = clBlack then
        ACanvas.Pixels[R.Left+X, R.Top+Y] := Cor.cmFonte[AviewInfo.GridRecord.Selected];
    R.Left := R.Left + bmpImp.Width + 3;
  end;  

  ACanvas.Font.Name := 'Tahoma';
  ACanvas.Font.Size := 7;
  ACanvas.Font.Style := [];

  if (Sessao<>nil) and (Sessao.TipoCli<>tcManutencao) then begin
    if Sessao.TipoAcesso>=0 then
      V := Dados.tbTipoAcesso.Lookup('ID', Sessao.TipoAcesso, 'Nome') else
      V := null;
      
    if V=Null then V := '';
    ACanvas.DrawTexT(V, R, cxAlignRight + cxAlignVCenter);
  end;
      
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
  ACanvas.Font.Style := [];

  if M.PontosCli > '' then R.Right := R.Right - 53;
  ACanvas.DrawTexT(M.Nome, R, cxAlignCenter or cxShowEndEllipsis);
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
begin
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
  ACanvas.DrawTexT(Maquinas[AViewInfo.GridRecord.RecordIndex].StatusSt, R, cxAlignLeft + cxAlignVCenter);
  ADone := True;
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
    if M<>nil then begin
      if M.Numero=1 then begin
        Str := M.ProgramaAtual;
        if Str='sdfsdfsdfsfdsdf' then exit;
      end;
      
      AText := M.ProgramaAtual;
    end else
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

procedure TfbMaquinas.AtualizaDireitos;
var I : Integer;
begin
  inherited;
  if FLerLayout then Timer3.Enabled := True;
  TimerWav.Interval := gConfig.AvisoFimTempoAdminS * 1000;

  if Permitido(daAtenderClientes) then
    for I := 0 to BarMgr.ItemCount - 1 do
      BarMgr.Items[I].Enabled := True;
      
  cmFidelidade.Enabled := Versoes.PodeUsar(idre_fidelidade) and gConfig.FidAtivo;
  cmSubFidelidade.Enabled := cmFidelidade.Enabled;

  Timer2.Enabled := True;
  
  cmLayCustomize.Visible := ivNever;
  cmCapturar.Enabled := Permitido(daCapturar) and Dados.tbConfigPermiteCapturaTela.Value;
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
end;

procedure TfbMaquinas.RefreshBotoes;
var
  S : TncSessao;
  M : TncMaquina;
  LigT : Boolean;
  I : Integer;
begin
  with Dados, CM do begin
    S := Sessoes.PorMaq[mtMaquinaNumero.Value];
    M := Maquinas.PorNumero[mtMaquinaNumero.Value];
    if M=nil then Exit;
    
    cmPMPausar.Enabled := (S<>nil) and (not S.Encerrou) and (S.FimTempo.Minutos=0);
    if (S<>nil) and S.Pausado then
      cmPMPausar.Caption := 'Despausar máq. '+IntToStr(M.Numero) else
      cmPMPausar.Caption := 'Pausar máq. '+IntToStr(M.Numero);
    cmPMFinalizar.Enabled := (S<>nil) and (not S.Encerrou);
    cmPMEditar.Enabled := (S<>nil);
    if M<>nil then
      cmBloqSite.Caption := '&P. Bloquear site: ' + DomainAndSubdomain(FormataSiteStr(M.SiteAtual)) else
      cmBloqSite.Caption := '&P. Bloquear site';
    cmPMIniciar.Enabled := (S=nil);
    cmAddTempo.Enabled := (S<>nil) and (S.TipoCli<>tcManutencao) and (not S.Encerrou);
    cmAddProduto.Enabled := (S<>nil) and (S.TipoCli<>tcManutencao);
    cmAddImp.Enabled := (S<>nil);
    cmCreditos.Enabled := (S<>nil);
    cmEditarCliente.Enabled := (S<>nil) and (S.Cliente>0);
    if cmEditarCliente.Enabled then
      cmEditarCliente.Tag := S.Cliente else
      cmEditarCliente.Tag := 0;
    cmSubTransf.Enabled := (S<>nil) and (not S.Encerrou);
    cmDownload.Enabled := (S<>nil) and (not S.Encerrou) and (S.TipoCli<>tcManutencao);
    cmDownload.Down := (S<>nil) and (S.PermitirDownload);
    cmPMDesligar.Enabled := (M<>nil) and (M.IDCliente>0); 
    cmPMFecharGuard.Enabled := cmPMDesligar.Enabled and ncaDM.Permitido(daMaqFecharCMGuard);
    cmPMReiniciar.Enabled := cmPMDesligar.Enabled;
    cmPMCapturar.Enabled := cmPMDesligar.Enabled and ncaDM.Permitido(daCapturar);
    cmProgUso.Enabled := cmPMDesligar.Enabled;
    cmSuporteRem.Enabled := cmPMDesligar.Enabled;
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

{ TDadosGridMaq }

constructor TDadosGridMaq.Create(AMaq: TncMaquina; AForm: TfbMaquinas; aIndex: Integer);
begin
  FMaq := AMaq;
  FForm := AForm;
  FGuardOk := False;
  FVendas := False;
  FImp := False;
  FStatus := 0;
  FStatusSt := '';
  FValor := '';
  FTempo := '';
  FIndex := aIndex;
  FTerminouTempo := False;
end;

procedure TDadosGridMaq.Invalida(cellCV: TcxCustomGridTableItem);
begin
  if FForm.CV.ViewData.RecordCount>=FMaq.Numero then
    FForm.CV.ViewData.Records[FIndex].Invalidate(cellCV);
end;

procedure TDadosGridMaq.Recalc;
var
  ATempo, AValor, S2: String;
  dValor, v1, v2, v3 : Double;
  cTempo : Cardinal;
  S : TncSessao;
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
  Vendas := (S<>nil) and (S.Transacoes.Total(trEstVenda)>0.009);
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

procedure TDadosGridMaq.SetGuardOk(const Value: Boolean);
begin
  if Value = FGuardOK then Exit;
  FGuardOk := Value;
  Invalida(FForm.CVRodape);
end;

procedure TDadosGridMaq.SetImp(const Value: Boolean);
begin
  if Value = FImp then Exit;
  FImp := Value;
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

procedure TfbMaquinas.cmDownloadClick(Sender: TObject);
var S: TncSessao;
begin
  with Dados do
  S := CM.Sessoes.PorMaq[mtMaquinaNumero.Value];
  if (S=nil) or (S.TipoCli=tcManutencao) then Exit;
  Dados.CM.PermitirDownload(S.ID, not S.PermitirDownload);
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
      TFrmCliente.Create(nil).Editar(tbCli, nil);
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

procedure TfbMaquinas.cmNovoClick(Sender: TObject);
var 
  Num: String;
  I  : Integer;
  M : TncMaquina;
  sMenu : String;
begin
  inherited;
  with Dados do begin
    if CM.Maquinas.Count > 0 then
      M := CM.Maquinas[pred(CM.Maquinas.Count)]
    else
      M := nil;

    if (M<>nil) then begin
      Num := IntToStr(M.Numero+1);
      sMenu := M.Menu;
    end  else begin
      Num := '1';
      sMenu := '';
    end;
      
    if InputQuery(Application.Title, 'Número da nova máquina: ', Num) then begin
      I := StrToIntDef(Num, 0);
      if I=0 then Exit;
      M := TncMaquina.Create;
      M.Numero := I;
      M.Menu := sMenu;
      try
        CM.SalvaAlteracoesObj(M, True);
      finally
        M.Free;
      end;    
    end;  
    
  end;    
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

procedure TfbMaquinas.cmApagarClick(Sender: TObject);
var M : TncMaquina;
begin
  inherited;
  with Dados do begin
    if mtMaquina.RecordCount=0 then Exit;
    if CM.Sessoes.PorMaq[mtMaquinaNumero.Value]<>nil then begin
      Beep;
      ShowMessage('Não é possível apagar uma máquina com acesso em andamento');
      Exit;
    end;  
    M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
    if M<>nil then
    if MessageDlg('Confirma a exclusão da Máquina '+mtMaquinaNumero.AsString, mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
      CM.ApagaObj(M);
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

end.
