unit ucmafbMaquinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, ImgList, dxBarExtItems, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxMaskEdit, cxImageComboBox, cxTextEdit, cxCurrencyEdit,
  cmClassesBase,
  cxDBLookupComboBox, cxCheckBox, nxdb, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxCalendar, cxGridCardView, cxGridDBCardView, cxMemo,
  cxHint, ActnList, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore;

const
  Max_Maq  = 255;

type 
  TfbMaquinas = class;

  TDadosGridMaq = class 
  private
    FMaq: TCMMaquina;
    FGuardOk: Boolean;
    FVendas: Boolean;
    FImp: Boolean;
    FStatus: Byte;
    FStatusSt: String;
    FValor: String;
    FTempo: String;
    FForm : TfbMaquinas;
    FIndex: Integer;
    
    procedure SetGuardOk(const Value: Boolean);
    procedure SetImp(const Value: Boolean);
    procedure SetStatus(const Value: Byte);
    procedure SetStatusSt(const Value: String);
    procedure SetTempo(const Value: String);
    procedure SetValor(const Value: String);
    procedure SetVendas(const Value: Boolean);
  public      
    constructor Create(AMaq: TCMMaquina; AForm: TfbMaquinas; aIndex: Integer);

    procedure Recalc;
    procedure Invalida(cellCV: TcxCustomGridTableItem);

    property Status: Byte read FStatus write SetStatus;
    property StatusSt: String read FStatusSt write SetStatusSt;
    property Tempo: String read FTempo write SetTempo;
    property Valor: String read FValor write SetValor;
    property GuardOk: Boolean read FGuardOk write SetGuardOk;
    property Vendas: Boolean read FVendas write SetVendas;
    property Imp: Boolean read FImp write SetImp;
    property RecordIndex: Integer read FIndex;
  end;
  
  TfbMaquinas = class(TFrmBase)
    cmLiberar: TdxBarLargeButton;
    cmPausar: TdxBarLargeButton;
    cmFinalizar: TdxBarLargeButton;
    imGuard: TImageList;
    Grid: TcxGrid;
    GL: TcxGridLevel;
    cmEditarMaq: TdxBarLargeButton;
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
    tAcesso: TnxTable;
    cmMaquinasDest: TdxBarListItem;
    CV: TcxGridDBCardView;
    CVNumero: TcxGridDBCardViewRow;
    CVTempo: TcxGridDBCardViewRow;
    CVPrograma: TcxGridDBCardViewRow;
    ActionList1: TActionList;
    CVNome: TcxGridDBCardViewRow;
    CVRodape: TcxGridDBCardViewRow;
    Image1: TImage;
    cxsPequeno: TcxStyle;
    cmDesligar: TdxBarLargeButton;
    pmVenda: TdxBarPopupMenu;
    pmCred: TdxBarPopupMenu;
    cmVendaCredTempo: TdxBarButton;
    cmVendaPacote: TdxBarButton;
    cmVendaPass: TdxBarButton;
    cmVendaCodPreImp: TdxBarButton;
    cmVendaAcesso: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    CVObs: TcxGridDBCardViewRow;
    procedure Timer1Timer(Sender: TObject);
    procedure TVStatusGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure TVInicioTicksGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cmFinalizarClick(Sender: TObject);
    procedure cmLiberarClick(Sender: TObject);
    procedure cmPausarClick(Sender: TObject);
    procedure cmEditarMaqClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmTransferirClick(Sender: TObject);
    procedure cmMaquinasDestClick(Sender: TObject);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cmCapturarClick(Sender: TObject);
    procedure cmVenderCredClick(Sender: TObject);
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
    procedure cmVendaCredTempoClick(Sender: TObject);
    procedure cmVendaPacoteClick(Sender: TObject);
    procedure cmVendaPassClick(Sender: TObject);
    procedure cmVendaCodPreImpClick(Sender: TObject);
    procedure cmDesligarClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure CVStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure CVDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure cmVendaAcessoClick(Sender: TObject);
    procedure cmVendaClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
  private
    FMouseDown: Boolean;
    bmpCompras : TBitmap;
    bmpImp     : TBitmap;
    DragM      : Integer;
    Maquinas   : Array[0..Max_Maq-1] of TDadosGridMaq;
    { Private declarations }
    function ObtemTempo(aMaq, aAcesso: Integer): String;
  public
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure RefreshCacheMaq;
  
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
  smManut  = 5;

  
var
  fbMaquinas: TfbMaquinas;
  FCores    : Array[smLivre..smManut] of TCorStatus;
  FCab, FCabC: TColor;

implementation

uses ufmImagens, ucmaDM, ucmaPri, ucmaFrmAcesso, cmIDRecursos,
  ucmaFrmCredito, GraphUtil, ucmaFrmVendaPac, ucmaFrmVendaPass,
  cmAuxPassaporte, ucmaFrmDesliga, ucmaFrmME, ucmaFrmCaptura, ucmaFrmTempo;

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


class function TfbMaquinas.Descricao: String;
begin
  Result := 'Máquinas';
end;

procedure TfbMaquinas.Timer1Timer(Sender: TObject);
var I : Integer;
begin
  if FMouseDown then Exit;
  try
    for I := 0 to Max_Maq-1 do 
    if Maquinas[I]<>nil then
      Maquinas[I].Recalc;
  except
  end;
end;

procedure TfbMaquinas.TVStatusGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText := Maquinas[ARecord.RecordIndex].StatusSt;
end;

procedure TfbMaquinas.TVInicioTicksGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if Maquinas[ARecord.RecordIndex]=nil then Exit;
  AText := Maquinas[ARecord.RecordIndex].Tempo;
end;

procedure TfbMaquinas.cmFinalizarClick(Sender: TObject);
begin
  inherited;
  with Dados do begin
    if (mtMaquinaAcesso.Value < 1) and (not mtMaquinaManutencao.Value) then begin
      Beep;
      ShowMessage('Não existe acesso em andamento na máquina '+mtMaquinaNumero.AsString);
      Exit;
    end;

    if mtMaquinaAguardaPagto.Value then begin
      Beep;
      ShowMessage('O Acesso para essa máquina já foi finalizado e aguarda pagamento. '+
                  'Você poderá registrar o pagamento através do duplo-clique ou do botão "Editar"');
      Exit;
    end;
  
    if SimNao('Deseja realmente finalizar o acesso na máquina ' +mtMaquinaNumero.AsString + ' ?')
    then begin
      if mtMaquinaManutencao.Value then
        CM.ModoManutencao(mtMaquinaNumero.Value, False)
      else begin              
        CM.LogoutMaq(mtMaquinaNumero.Value);
        ListaAcessoFin.Add(mtMaquinaAcesso.AsString);
      end;  
    end;  
  end;      
end;

procedure TfbMaquinas.cmLiberarClick(Sender: TObject);
var M : TCMMaquina;
begin
  inherited;
  ChecaCaixa;
  with Dados do begin
    M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
    if (M<>nil) and (M.Acesso>0) then begin
      if M.Parado then begin
        CM.PararMaq(M.Numero, False);
        Exit;
      end else
      if M.ParadoPacote then begin
        CM.LiberarAlemPacote(M.Numero);
        Exit;
      end;
    end;  
  end;  
    
  with Dados do
  if mtMaquinaAcesso.Value > 0 then begin
    Beep;
    if mtMaquinaAguardaPagto.Value then 
      ShowMessage('Para iniciar um novo acesso nessa máquina é necessário registrar o pagamento. '+
                  'Você poderá registrar o pagamento através do duplo-clique ou do botão "Editar"')
                  
    else
      ShowMessage('Já existe um acesso em andamento na máquina '+mtMaquinaNumero.AsString);
    Exit;
  end;

  TFrmAcesso.Create(Self).Iniciar;
end;

procedure TfbMaquinas.cmPausarClick(Sender: TObject);
var M: TCMMaquina;
begin
  inherited;
  with Dados do begin
    M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
    if (M=nil) or (M.Acesso=0) then Exit;
    CM.PararMaq(M.Numero, not M.Parado);
  end;  
end;

procedure TfbMaquinas.cmEditarMaqClick(Sender: TObject);
begin
  tAcesso.Refresh;
  with Dados do
  if (mtMaquinaAcesso.Value>0) and tAcesso.FindKey([mtMaquinaAcesso.Value]) then
  if mtMaquinaAguardaPagto.Value then
    TFrmAcesso.Create(Self).Editar(Self.tAcesso, 2)
  else  
    TFrmAcesso.Create(Self).Editar(Self.tAcesso, 0);
end;

procedure TfbMaquinas.FrmBasePaiCreate(Sender: TObject);
var 
  I : Integer;
begin
  inherited;
  for I := 0 to Max_Maq-1 do Maquinas[I] := nil;
  bmpCompras := TBitmap.Create;
  bmpImp     := TBitmap.Create;
  imGuard.GetBitmap(2, bmpCompras);
  imGuard.GetBitmap(3, bmpImp);
  tAcesso.Open;
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
    FCores[smManut].cmCabFundo := CorManutencao;
    FCores[smManut].cmCabFonte := CorFManutencao;
    FCab := clWhite;
    CorClara(FCab, FCabC);
    for I := smLivre to smManut do with FCores[I] do begin
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
var 
  I : Integer;
  P: TPoint;
begin
  inherited;
  with Dados, CM do begin
    if (mtMaquinaAcesso.Value=0) or mtMaquinaAguardaPagto.Value then Exit;
    cmMaquinasDest.Items.Clear;
    for I := 0 to pred(Maquinas.Count) do with Maquinas.Itens[I] do
    if Acesso=0 then 
      cmMaquinasDest.Items.AddObject('Máquina '+IntToStr(Numero), TObject(Numero));
  end;
  P := ItemLinkScreenPoint(cmTransferir.ClickItemLink);
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

procedure TfbMaquinas.cmCapturarClick(Sender: TObject);
begin
  with Dados do 
  if mtMaquinaConectado.Value then
    TFrmCapt.Create(Self).Capturar(mtMaquinaNumero.Value);
end;

procedure TfbMaquinas.cmVenderCredClick(Sender: TObject);
var 
  P: TPoint;
begin
  P := ItemLinkScreenPoint(cmVenderCred.ClickItemLink);
  ChecaCaixa;
  pmCred.Popup(P.X, P.Y);
end;

function TfbMaquinas.ObtemTempo(aMaq, aAcesso: Integer): String;
begin
end;

function CodStatus(M: TCMMaquina): Integer;
begin
  if M.Acesso>0 then begin
    if M.Parado or M.ParadoPacote then 
      Result := smPausa
    else  
    if M.AguardaPagto then 
      Result := smPagto
    else begin
      if (M.CreditoTotal>5000) or (M.Sinal>0.0009) then 
        Result := smUsoPre 
      else  
        Result := smUsoPos;
    end;  
  end else
  if M.Manutencao then 
    Result := smManut
  else
    Result := smLivre;  
end;

function StrStatus(M: TCMMaquina): String;
begin
  if M.Acesso > 0 then begin
    if M.Parado or M.ParadoPacote then begin
      if M.ParadoPacote then 
        Result := 'Fim de Tempo' 
      else
        Result := 'Pausado';  
    end else  
    if M.AguardaPagto then 
      Result := 'Aguarda Pagto.'
    else 
      Result := 'Em uso';
  end else
  if M.Manutencao then
    Result := 'Manutenção'
  else
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

  ACanvas.Font.Color := Cor.cmFonte[AViewInfo.Selected];
  ACanvas.Brush.Color := Cor.cmFundo[AViewInfo.Selected];
      
  if (S=smLivre) or ((S=smManut) and (AViewInfo.Item<>CVTempo)) then 
    ACanvas.Font.Color := ACanvas.Brush.Color;
end;

procedure TfbMaquinas.CVTempoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if Maquinas[ARecord.RecordIndex]=nil then Exit;
  with Maquinas[ARecord.RecordIndex] do 
    AText := Tempo + ' = ' + Valor;
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
  RX, RY, X, Y: Integer;  
  Cor : TCorStatus;
  S : Integer;
  R : TRect;
  M : TCMMaquina;
  V: Variant;
begin
  if Maquinas[AViewInfo.GridRecord.RecordIndex]=nil then exit;
  S := Maquinas[AViewInfo.GridRecord.RecordIndex].Status;
  M := Maquinas[AViewInfo.GridRecord.RecordIndex].FMaq;
  
//  if (S=smLivre) or (S=smManut) then Exit;
  Cor := FCores[S];                                         
  ACanvas.Font.Color := Cor.cmFonte[AViewInfo.Selected];
  ACanvas.Brush.Color := Cor.cmFundo[AViewInfo.Selected];
  ACanvas.FillRect(AviewInfo.Bounds);
  R := AViewInfo.Bounds;
  R.Left := R.Left+2;
  R.Top  := R.Top + 1;

  ACanvas.DrawImage(imGuard, R.Left, R.Top-1, Byte((M.Cliente>0)));
  R.Left := R.Left + imGuard.Width;

  if M.Acesso>0 then begin 
    if M.Vendas>0.009 then
    with bmpCompras, R do
    for X := 0 to Width-1 do
    for Y := 0 to Height-1 do
      if Canvas.Pixels[X, Y] = clBlack then
        ACanvas.Pixels[Left+X, Top+Y] := Cor.cmFonte[AViewInfo.Selected];
  
{    R.Left := R.Left + bmpCompras.Width + 3;
    if M.Numero in [1, 6, 11, 12, 15] then
    with bmpImp, R do
    for X := 0 to Width-1 do
    for Y := 0 to Height-1 do
      if Canvas.Pixels[X, Y] = clBlack then
        ACanvas.Pixels[Left+X, Top+Y] := Cor.cmFonte[AviewInfo.Selected];
    R.Left := R.Left + bmpCompras.Width;}
  end;  

  ACanvas.Font.Name := 'Tahoma';
  ACanvas.Font.Size := 7;
  ACanvas.Font.Style := [];

  if (M.Acesso>0) and not M.Manutencao then begin
    V := Dados.tbTipoAcesso.Lookup('Codigo', M.TipoAcesso, 'Nome');
    if V=Null then V := '';
    ACanvas.DrawTexT(V, R, cxAlignRight + cxAlignVCenter);
  end;  
      
  ADone := True;
end;

procedure TfbMaquinas.CVNumeroCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  R : TRect;
  X, Y : Integer;
  Cor : TCorStatus;
  Fator : Double;
  M : TCMMaquina;
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
  if not AViewInfo.Selected then begin
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
  if not AViewInfo.Selected then
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
    FCores[smManut].cmCabFundo := CorManutencao;
    FCores[smManut].cmCabFonte := CorFManutencao;
    CVPrograma.Visible := MostraProgAtual;
    CVObs.Visible := MostraObs;
    FCab := clWhite;
    CorClara(FCab, FCabC);
    for I := smLivre to smManut do with FCores[I] do begin
      CorClara(cmCabFundo, cmCabFundoC);
//    cmCabFonte := CorMuitoClara(cmCabFundoC);
      cmFundo[False] := SetLum(clBlack, 220);
      cmFonte[False] := clBlack;
      
      cmFundo[True] := SetLum(cmCabFundoC, 200);
      cmFonte[True] := SetLum(cmFUndo[True], 30);
    end;  
  end;  
end;

procedure TfbMaquinas.RefreshCacheMaq;
var
  I,C : Integer;
  M : TCMMaquina;
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

constructor TDadosGridMaq.Create(AMaq: TCMMaquina; AForm: TfbMaquinas; aIndex: Integer);
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
end;

procedure TDadosGridMaq.Invalida(cellCV: TcxCustomGridTableItem);
begin
  if FForm.CV.ViewData.RecordCount>=FMaq.Numero then
    FForm.CV.ViewData.Records[FIndex].Invalidate(cellCV);
end;

procedure TDadosGridMaq.Recalc;
var
  ATempo, AValor: String;
  dValor : Double;
  cTempo, TempoCobrado, CredUsado : Cardinal;
  TA : TCMTipoAcesso;
begin
  with Dados.CM do
  if FMaq.Manutencao then begin
    ATempo := TicksToHMSSt(FMaq.NumTicks);
    AValor := FloatToStrF(0, ffCurrency, 10, 2);
  end else  
  if FMaq.Acesso > 0 then begin
    TA := TiposAcesso.PorCodigo[FMaq.TipoAcesso];
    if TA = nil then begin
      ATempo := 'ERRO';
      AValor := 'ERRO';
    end else begin
      FMaq.Calculo(cTempo, TempoCobrado, CredUsado, dValor, 
                  TA.PHoraCor^, CorPrecos, Config.PacoteTempoReal);
      if Config.MostraPrePagoDec then
      if (FMaq.LimiteTempo>0) and (cTempo<=FMaq.LimiteTempo) and (FMaq.CreditoTotal<10000) then
        cTempo := FMaq.LimiteTempo - cTempo;
      ATempo := TicksToHMSSt(cTempo);
      if (FMaq.Sinal>dValor) then
        dValor := 0
      else
        dValor := dValor - FMaq.Sinal;
          
      if FMaq.Vendas > 0.00009 then
        dValor := dValor + FMaq.Vendas;
      AValor := Trim(FloatToStrF(dValor, ffCurrency, 10, 2));
    end;              
  end else begin
    ATempo := '';
    AValor := '';
  end;
  Status := CodStatus(FMaq);
  StatusSt := StrStatus(FMaq);
  Valor := AValor;
  Tempo := ATempo;
  GuardOk := (FMaq.Cliente>0);
  Vendas := (FMaq.Vendas>0.00009);
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
begin
  inherited;
  if NumAberto<1 then begin
    Beep;
    ShowMessage('Caixa está fechado!');
    Exit;
  end;
    
  with Dados do   
  if (not mtMaquinaManutencao.Value) and (mtMaquinaAcesso.Value < 1) then 
    cmLiberarClick(nil)
  else
  if mtMaquinaAguardaPagto.Value then begin
    if tAcesso.FindKey([mtMaquinaAcesso.Value]) then
      TFrmAcesso.Create(Self).Editar(Self.tAcesso, 2);
  end else  
    cmFinalizarClick(nil);
end;

procedure TfbMaquinas.cmVendaCredTempoClick(Sender: TObject);
begin
  TFrmCredito.Create(Self).Novo(Dados.tbTran, Dados.mtMaquinaContato.Value, True);
end;

procedure TfbMaquinas.cmVendaPacoteClick(Sender: TObject);
begin
  TFrmVendaPac.Create(Self).Novo(Dados.tbTran, Dados.mtMaquinaContato.Value);
end;

procedure TfbMaquinas.cmVendaPassClick(Sender: TObject);
begin
  TFrmVendaPass.Create(Self).Novo(Dados.tbTran, Dados.mtMaquinaContato.Value, False);
end;

procedure TfbMaquinas.cmVendaCodPreImpClick(Sender: TObject);
begin
  TFrmVendaPass.Create(Self).Novo(Dados.tbTran, 0, True);
end;

procedure TfbMaquinas.cmDesligarClick(Sender: TObject);
begin
  with Dados do
  TFrmDesliga.Create(Self).Mostrar(mtMaquinaNumero.Value);
end;

procedure TfbMaquinas.cmEditarClick(Sender: TObject);
begin
  with Dados do 
  if (not mtMaquinaManutencao.Value) and (mtMaquinaAcesso.Value > 0) then 
    if tAcesso.FindKey([mtMaquinaAcesso.Value]) then
      TFrmAcesso.Create(Self).Editar(tAcesso, 0);
end;

procedure TfbMaquinas.CVStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
  with Dados do
  if mtMaquinaAcesso.Value<=0 then
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
begin
  ChecaCaixa;
  tAcesso.Refresh;
  with Dados do
  if (mtMaquinaAcesso.Value>0) and tAcesso.FindKey([mtMaquinaAcesso.Value]) then
    TFrmAcesso.Create(Self).Editar(Self.tAcesso, 1);
end;

procedure TfbMaquinas.cmVendaClick(Sender: TObject);
begin
  ChecaCaixa;
  TFrmME.Create(Self).Criar(Dados.tbTran, ttEstVenda);
end;

procedure TfbMaquinas.cmNovoClick(Sender: TObject);
var 
  Num: String;
  I  : Integer;
  M : TCMMaquina;
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
      M := TCMMaquina.Create(True);
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

procedure TfbMaquinas.cmApagarClick(Sender: TObject);
var M : TCMMaquina;
begin
  inherited;
  with Dados do begin
    if mtMaquina.RecordCount=0 then Exit;
    if mtMaquinaAcesso.Value>0 then begin
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

end.
