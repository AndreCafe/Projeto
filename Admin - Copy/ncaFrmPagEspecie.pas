unit ncaFrmPagEspecie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxTextEdit, cxCurrencyEdit, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, StdCtrls, cxButtons, LMDBaseEdit,
  LMDCustomEdit, LMDEdit, LMDCustomMaskEdit, LMDMaskEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxLabel, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxImageComboBox, ImgList,
  cxCheckBox, LMDButtonControl, LMDCustomCheckBox, LMDCheckBox, cxButtonEdit,
  dxScreenTip, dxCustomHint, cxHint, cxMemo, LMDPNGImage, ExtCtrls,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseGraphicButton, ncEspecie,
  LMDCustomSpeedButton, LMDSpeedButton, cxControls, cxEdit, cxContainer,
  cxPCdxBarPopupMenu, cxPC;

type
  TFrmPagEspecie = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    ValorStyle: TcxStyle;
    cxStyle2: TcxStyle;
    cxImageList1: TcxImageList;
    EspStyle: TcxStyle;
    cxStyle4: TcxStyle;
    LMDSimplePanel1: TLMDSimplePanel;
    gridEsp: TcxGrid;
    tvEsp: TcxGridTableView;
    tvEspImg: TcxGridColumn;
    tvEspValor: TcxGridColumn;
    glEsp: TcxGridLevel;
    LMDSimplePanel3: TLMDSimplePanel;
    EspStyle_Focus: TcxStyle;
    ValorStyle_Focus: TcxStyle;
    LMDSimplePanel2: TLMDSimplePanel;
    btnSalvar: TcxButton;
    cxButton3: TcxButton;
    cxHintStyleController1: TcxHintStyleController;
    LMDSimplePanel5: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxMemo1: TcxMemo;
    btnCancelar: TcxButton;
    panPremium: TLMDSimplePanel;
    Image1: TImage;
    cxImageList2: TcxImageList;
    LMDSimplePanel7: TLMDSimplePanel;
    lbTotalPagar: TcxLabel;
    cxLabel6: TcxLabel;
    panDesconto: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    edDesconto: TcxCurrencyEdit;
    TimerDesc: TTimer;
    TimerDesc2: TTimer;
    pgTrocoCred: TcxPageControl;
    tsFalta: TcxTabSheet;
    tsTroco: TcxTabSheet;
    cbDebitar: TLMDCheckBox;
    TimerCred: TTimer;
    cbCreditar: TcxCheckBox;
    lbTroco: TcxLabel;
    lbValorTroco: TcxLabel;
    tsOk: TcxTabSheet;
    imgOk: TImage;
    tsErro: TcxTabSheet;
    imgWarning: TImage;
    lbErro: TcxLabel;
    lbValorFalta: TcxLabel;
    cxLabel5: TcxLabel;
    tsPassou: TcxTabSheet;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    Timer1: TTimer;
    tvEspDescr: TcxGridColumn;
    cbDebAnt: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tvEspCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvEspFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tvEspCanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure tvEspImgStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure tvEspValorStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvEspValorPropertiesChange(Sender: TObject);
    procedure cbDebitarClick(Sender: TObject);
    procedure tvEspDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure tvEspDataControllerDataChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvEspValorGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cbCredChange(Sender: TObject);
    procedure gridEspEnter(Sender: TObject);
    procedure gridEspExit(Sender: TObject);
    procedure edDescontoEnter(Sender: TObject);
    procedure edDescontoExit(Sender: TObject);
    procedure cxLabel2Click(Sender: TObject);
    procedure panDescontoClick(Sender: TObject);
    procedure TimerDescTimer(Sender: TObject);
    procedure edDescontoPropertiesChange(Sender: TObject);
    procedure TimerDesc2Timer(Sender: TObject);
    procedure tvEspKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerCredTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tvEspDescrCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure cbDebAntClick(Sender: TObject);
  private
    { Private declarations }
    FTotalDig : Currency;
    FShowed   : Boolean;
    FDentroGrid: Boolean;
    FAlterouDesc: Boolean;
    FTotalPag : Currency;
    FSaveDesc : Currency;
    FDesconto : Currency;
    FSaldoCC  : Currency;
    FCredUsado : Currency;
    FAutomatico : Boolean;
    FPagEsp : TncPagEspecies;
    FNovo : Boolean;
    FValores : Array of Currency;
    procedure AtualizaTotais;
    procedure Load;
    procedure TotalizaDig;

    procedure ValorAutomatico(const aResetarCred: Boolean = False);
    procedure CorrigeValorAutomatico;

    function IFrom: Integer;

    function CredCli: Currency;

    function DebCli: Currency;

    function Troco: Boolean;

    function TrocoOk: Boolean;

    function TrocoCredOk: Boolean;

    function TotalComDesc: Currency;
    procedure SetDesconto(const Value: Currency);
    function MaxCred: Currency;
  public
    function Editar(aNovo: Boolean; aPagEsp: TncPagEspecies; aSaldoCC: Currency; var aCredUsado, aDesconto: Currency): Boolean;

    property Desconto: Currency
      read FDesconto write SetDesconto;
    
    { Public declarations }
  end;

var
  FrmPagEspecie: TFrmPagEspecie;

resourcestring
  rsDesconto   = 'Desconto';  
  rsCredito    = 'Crédito em Conta';
  rsTotalFinal = 'Total Final';

  rsErroDesc   = 'Desconto não pode ser maior que o total à pagar';
  rsErroPagouMais = 'Valor pago não pode ser maior que o valor à pagar';

implementation


{$R *.dfm}

const
  Key_Enter      = 13;
  Key_Up         = 38;
  Key_Down       = 40;
  Key_F2         = $71;
  Key_Esc        = 27;

  IndValor = 2;


function FiltraCur(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9', ',', '.'] then
      Result := Result + S[I];
end;


procedure TFrmPagEspecie.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  CorrigeValorAutomatico;
end;

procedure TFrmPagEspecie.TimerCredTimer(Sender: TObject);
begin
  TimerCred.Enabled := False;
  with tvEsp.DataController do begin 
    Values[0, IndValor] := MaxCred;
    FValores[0] := MaxCred;
  end;
  TotalizaDig;
end;

procedure TFrmPagEspecie.TimerDesc2Timer(Sender: TObject);
begin
  TimerDesc2.Enabled := False;
  edDesconto.EditValue := FTotalPag;
  edDesconto.PostEditValue;
  edDesconto.SelectAll;
  AtualizaTotais;
end;

procedure TFrmPagEspecie.TimerDescTimer(Sender: TObject);
begin
  TimerDesc.Enabled := False;
  edDesconto.SelectAll;
end;

function TFrmPagEspecie.TotalComDesc: Currency;
begin
  Result := FTotalPag;
  if cbDebAnt.Checked then
    Result := Result + DebCli;
  lbTotalPagar.Caption := FloatToStrF(Result, ffCurrency, 10 , 2);
  Result := Result - FDesconto;  
end;

procedure TFrmPagEspecie.TotalizaDig;
var 
  I : Integer;
begin
  FTotalDig := 0;
  for I := 0 to High(FValores) do
    FTotalDig := FTotalDig + FValores[I];
  AtualizaTotais;
end;

function TFrmPagEspecie.Troco: Boolean;
begin
  Result := (FTotalDig > TotalComDesc);
end;

function TFrmPagEspecie.TrocoCredOk: Boolean;
var 
  I: Integer;
  T: Currency;
  E : TncEspecie;
begin
  Result := False;
  if (not Troco) or (not gEspecies.AlgumPermiteCred) then begin
    Result := True;
    Exit;
  end;

  T := 0;

  with tvEsp.DataController do 
  for I := IFrom to RecordCount - 1 do 
  if (Values[I, 0]>0) then begin
    E := gEspecies.PorID[Values[I, 0]];
    if (E=nil) or (not E.PermiteCred) then
      T := T + FValores[I];
  end;

  if T>(TotalComDesc-FCredUsado) then Exit;

  Result := True;
end;

function TFrmPagEspecie.TrocoOk: Boolean;
var 
  I: Integer;
  T: Currency;
  E : TncEspecie;
begin
  Result := False;
  if not Troco then begin
    Result := True;
    Exit;
  end;

  T := 0;
    
  with tvEsp.DataController do 
  for I := IFrom to RecordCount - 1 do 
  if (Values[I, 0]>0) then begin
    E := gEspecies.PorID[Values[I, 0]];
    if (E=nil) or (not E.PermiteTroco) then
      T := T + FValores[I];
  end;

  if T>(TotalComDesc-FCredUsado) then Exit;

  Result := True;
end;

procedure TFrmPagEspecie.AtualizaTotais;
begin
  if FTotalDig>=TotalComDesc then
    cbDebitar.Checked := False;

  if cbDebitar.Checked then
    cbDebitar.Font.Style := [fsBold] else
    cbDebitar.Font.Style := []; 
    
  if FTotalDig>TotalComDesc then begin
    lbValorTroco.Caption := FloatToStrF(FTotalDig-TotalComDesc, ffCurrency, 10 , 2);
    pgTrocoCred.ActivePage := tsTroco;
  end else
  if FTotalDig<TotalComDesc then begin
    lbValorFalta.Caption := FloatToStrF(TotalComDesc-FTotalDig, ffCurrency, 10, 2);
    pgTrocoCred.ActivePage := tsFalta;
  end else 
    pgTrocoCred.ActivePage := tsOk;

  if not (TrocoOk and TrocoCredOk) then begin
    pgTrocoCred.ActivePage := tsErro;
    lbErro.Caption := rsErroPagouMais;
  end; 
end;

procedure TFrmPagEspecie.cbCredChange(Sender: TObject);
begin
  AtualizaTotais;
  gridEsp.SetFocus;
end;

procedure TFrmPagEspecie.cbDebAntClick(Sender: TObject);
begin
  ValorAutomatico;
  AtualizaTOtais;
end;

procedure TFrmPagEspecie.cbDebitarClick(Sender: TObject);
var 
  I : Integer;
begin
  if (FTotalDig>=FTotalPag) and cbDebitar.Checked then begin
    FTotalDig := 0;
    FAutomatico := False;
    with tvEsp.DataController do 
    for I := 0 to RecordCount - 1 do begin
      Values[I, IndValor] := null;
      FValores[I] := 0;
    end;
  end;
  AtualizaTotais;
  gridEsp.SetFocus;
end;

procedure TFrmPagEspecie.CorrigeValorAutomatico;
var I: Integer;
begin
  if not FAutomatico then Exit;
  with tvEsp.DataController do 
  for I := IFrom to RecordCount - 1 do
    if (Values[I, IndValor]<>null) and (Values[I, IndValor]>0) then begin
      Values[I, IndValor] := TotalComDesc - FCredUsado;
      FValores[I] := TotalComDesc - FCredUsado;
      Exit;
    end;
end;

function TFrmPagEspecie.CredCli: Currency;
begin
  if FSaldoCC>=0.01 then
    Result := FSaldoCC else
    Result := 0;
end;

procedure TFrmPagEspecie.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPagEspecie.btnSalvarClick(Sender: TObject);
var 
  i : Integer;
  aux : Tlist;

procedure SavePag(aEspecie: Word; aValor: Currency);
var 
  j: integer;
  p: TncPagEspecie;
  e: TncEspecie;
begin
  p := nil;
  j := 0;
  while (p=nil) and (j<FPagEsp.Count) do 
    if (FPagEsp[j].peEspecie = aEspecie) and (Aux.IndexOf(FPagEsp[j])=-1) then
      p := FPagEsp[j] else
      Inc(j);
      
  if p=nil then begin
    p:= FPagEsp.NewItem;
    P.peEspecie := aEspecie;
  end;
  
  e := gEspecies.PorID[aEspecie];
  p.peTipo  := e.Tipo;
  p.peValor := aValor;
  Aux.Add(p);
end;

begin
  if pgTrocoCred.ActivePage=tsErro then begin
    Beep;
    ShowMessage(lbErro.Caption);
    Exit;
  end;

  
  aux := tList.Create;
  try
    with tvEsp.DataController do
    for I := IFrom to RecordCount-1 do 
      if FValores[I]>0.009 then
        SavePag(Values[I, 0], FValores[I]);

    for I := FPagEsp.Count - 1 downto 0 do 
      if Aux.IndexOf(FPagEsp[i])=-1 then FPagEsp.Delete(I);
      
  finally
    aux.Free;
  end;
  Close;
end;

procedure TFrmPagEspecie.cxLabel2Click(Sender: TObject);
begin
  edDesconto.SetFocus;
end;

function TFrmPagEspecie.DebCli: Currency;
begin
  if FSaldoCC<=-0.01 then
    Result := FSaldoCC * -1 else
    Result := 0;
end;

procedure TFrmPagEspecie.edDescontoEnter(Sender: TObject);
begin
  FSaveDesc := FDesconto;
  FAlterouDesc := False;
  panDesconto.Color := $00AAFFFF;
  TimerDesc.Enabled := True;
end;

procedure TFrmPagEspecie.edDescontoExit(Sender: TObject);
begin
  panDesconto.Color := clBtnFace;
  if FAlterouDesc then begin
    FAutomatico := True;
    ValorAutomatico;
  end;
end;

procedure TFrmPagEspecie.edDescontoPropertiesChange(Sender: TObject);
var 
  S: String; 
  C: Currency;
  I: Integer;
begin
  S := FiltraCur(edDesconto.EditingText);
  Caption := S;
  C := StrToCurrDef(S, 0);
  with tvEsp.DataController do 
  if C<>FSaveDesc then begin
    FAlterouDesc := True;
    FSaveDesc := C;
    if C>FTotalPag then begin
      FDesconto := FTotalPag;
      TimerDesc2.Enabled := True;
    end else begin
      FDesconto := C;
      TimerDesc2.Enabled := False;
    end; 
    FTotalDig := 0;
    for I := 0 to RecordCount - 1 do
      if Values[I, 0] = 0 then begin
        Values[I, IndValor] := MaxCred;
        FValores[I] := MaxCred;
        FTotalDig := MaxCred;
        FCredUsado := MaxCred;
      end else begin
        Values[I, IndValor] := 0;
        FValores[I] := 0;
      end;
    AtualizaTotais;
    if TimerDesc2.Enabled then
      pgTrocoCred.ActivePage := tsErro;
    FAutomatico := False;   
  end;
end;

function TFrmPagEspecie.Editar(aNovo: Boolean; aPagEsp: TncPagEspecies; aSaldoCC: Currency; var aCredUsado, aDesconto: Currency): Boolean;
begin
  FNovo := aNovo;
  FSaldoCC := aSaldoCC;
  FCredUsado := aCredUsado; 
  FDesconto := aDesconto;
  FPagEsp := aPagEsp;
  FTotalPag := aPagEsp.TotalPagar;
  cbDebAnt.Visible := (DebCli>0);
  cbDebAnt.Caption := cbDebAnt.Caption + ' ('+FloatToStrF(DebCli, ffCurrency, 10, 2)+')';
  lbTotalPagar.Caption := FloatToStrF(FTotalPag, ffCurrency, 10 , 2);
  Load;
  ShowModal;
  Result := (ModalResult=mrOk);
  if Result then begin
    aCredUsado := FCredUsado;
    aDesconto := FDesconto;
  end;
end;

procedure TFrmPagEspecie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPagEspecie.FormCreate(Sender: TObject);
var i: integer;
begin
  FSaveDEsc := 0;
  SetLength(FValores, 0);
  if not gEspecies.AlgumPermiteCred then
    cbCreditar.Visible := False;
    
  FDentroGrid := False;
  FTotalDig := 0;
  FShowed := False;
  FAutomatico := True;
  with TcxImageComboBoxProperties(tvEspImg.Properties).Items do begin
    Clear;
    with Add do begin
      Value := 0;
      Description := rsCredito;
      ImageIndex := 0;
    end;
    for I := 0 to gEspecies.Count - 1 do
      with Add do begin
        Value := gEspecies.Itens[i].ID;
        Description := gEspecies.Itens[i].Nome;
        ImageIndex := gEspecies.Itens[i].Img+1;
      end;
  end;
end;

procedure TFrmPagEspecie.FormShow(Sender: TObject);
begin
  TotalizaDig;
  FShowed := True;
end;

procedure TFrmPagEspecie.gridEspEnter(Sender: TObject);
begin
  FDentroGrid := True;
end;

procedure TFrmPagEspecie.gridEspExit(Sender: TObject);
begin
  FDentroGrid := False;
end;

function TFrmPagEspecie.IFrom: Integer;
begin
  if CredCli>0 then
    Result := 1 else
    Result := 0;
end;

procedure TFrmPagEspecie.Load;
var 
  i, j, c: integer;
  ok: boolean;

procedure Add(aEspecie: Integer; aValor: Currency);
begin
  Inc(C);
  ok := True;
  tvEsp.DataController.AppendRecord;
  tvEsp.DataController.Values[c-1, 0] := aEspecie;
  tvEsp.DataController.Values[c-1, 1] := aEspecie;
  tvEsp.DataController.Values[c-1, IndValor] := aValor;

  SetLength(FValores, C);
  FValores[C-1] := aValor;
end;

begin
  c := 0;
  if CredCli>0 then
  if FNovo then begin
    Add(0, MaxCred);
    FCredUsado := MaxCred;
  end else
    Add(0, FCredUsado);
    
  for I := 0 to gEspecies.Count - 1 do begin
    ok := False;
    for j := 0 to FPagEsp.Count - 1 do
      if FPagEsp[j].peEspecie=gEspecies[i].ID then 
        Add(gEspecies[i].ID, FPagEsp[j].peValor);
    if not ok then Add(gEspecies[i].ID, 0);
  end;

  if FPagEsp.Count=0 then begin
    if CredCli>0 then 
      I := 1 else
      I := 0;
    tvEsp.DataController.Values[I, IndValor] := TotalComDesc - FCredUsado;
    FValores[I] := TotalComDesc - FCredUsado;
    tvEsp.DataController.FocusedRecordIndex := I;
  end;
end;

function TFrmPagEspecie.MaxCred: Currency;
begin
  if TotalComDesc > CredCli then
    Result := CredCli else
    Result := TotalComDesc;
end;

procedure TFrmPagEspecie.panDescontoClick(Sender: TObject);
begin
  edDesconto.SetFocus;
end;

procedure TFrmPagEspecie.SetDesconto(const Value: Currency);
begin
  if FDesconto = Value then Exit;
  
  if Value>0 then
    edDesconto.Value := Value else
    edDesconto.Clear;
end;

procedure TFrmPagEspecie.tvEspCanSelectRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
  AAllow := (ARecord.Index>0);
end;

procedure TFrmPagEspecie.tvEspCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var R: TRect;  
begin
{  with AViewInfo do 
  if Item=tvEspImg then
    if GridRecord.Values[0]<1 then begin
      ACanvas.Font.Size := 10;
      ACanvas.Font.Style := [fsBold];
    end;  }
  
  if FDentroGrid and AViewInfo.RecordViewInfo.Focused then
  begin
    ACanvas.Brush.Color := $00AAFFFF;
    ACanvas.Font.Color := clBlack;
{    ACanvas.FillRect(AviewInfo.RecordViewInfo.ContentBounds, ACanvas.Brush.Color);
    AViewInfo.EditViewInfo.Paint(ACanvas);
    if AViewInfo.Item.VisibleIndex = 0 then
      ACanvas.DrawComplexFrame(AViewInfo.ClientBounds, clBlack, clBlack, [bLeft, bTop, bBottom], 3);
    if AViewInfo.Item.VisibleIndex = Sender.VisibleItemCount - 1 then
      ACanvas.DrawComplexFrame(AViewInfo.ClientBounds, clBlack, clBlack, [bRight, bTop, bBottom], 3)
    else      
      ACanvas.DrawComplexFrame(AViewInfo.ClientBounds, clBlack, clBlack, [bTop, bBottom], 3);
    ADone := True;   }
  end else 
    ACanvas.Brush.Color := clWhite;
{  if AViewInfo.GridRecord.Index=0 then begin
    ACanvas.Font.Size := 10;
    ACanvas.Font.Style := [];
    ACanvas.FillRect(AviewInfo.RecordViewInfo.ContentBounds, ACanvas.Brush.Color);
    ACanvas.DrawTexT('Selecione uma forma de pagamento:', AViewInfo.RecordViewInfo.ContentBounds, taCenter, vaCenter, False, False);
    R := AViewInfo.RecordViewInfo.ClientBounds;
    R.Right := R.Right-1;
    R.Bottom := R.Bottom-1;
    ADone := True;
  end;}
end;

procedure TFrmPagEspecie.tvEspDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  with ADataController do
  if FShowed and (FocusedRecordIndex>=IFrom) then
    FAutomatico := (Values[FocusedRecordIndex, IndValor]=(TotalComDesc-FCredUsado));
end;

procedure TFrmPagEspecie.tvEspDataControllerDataChanged(Sender: TObject);
begin
  if (not FShowed) then Exit;
  with tvEsp.DataController do 
     if (Values[FocusedRecordIndex, IndValor] <> null) and (Values[FocusedRecordIndex, IndValor]=0) then
        Values[FocusedRecordIndex, IndValor] := null;
end;

procedure TFrmPagEspecie.tvEspDescrCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var 
  va: TcxAlignmentVert;
  r: TRect;
begin
  if AViewInfo.GridRecord.Focused and FDentroGrid then
    ACanvas.FillRect(AViewInfo.RealBounds, EspStyle_Focus.Color) else
    ACanvas.FillRect(AViewInfo.RealBounds, clWhite);
  ACanvas.Font.Color := clBlack;
  ACanvas.Font.Size := 18;
  if aViewInfo.Value=0 then
    va := vaTop else
    va := vaCenter;
  ACanvas.DrawTexT(TcxImageComboBoxProperties(tvEspImg.Properties).GetDisplayText(AViewInfo.Value), 
    AViewInfo.RealBounds, 
    taLeftJustify,
    va, False, True);
  if va=vaTop then begin
    ACanvas.Font.Size := 10;
    R := AViewInfo.RealBounds;
    R.Left := R.Left + 2;
    R.Top := R.Top + ((R.Bottom-R.Top) div 2);
    ACanvas.DrawText('Credito Total = '+FloatToStrF(CredCli, ffCurrency, 10, 2), R, taLeftJustify, vaCenter, False, True);
  end;
  ADone := True;
end;

procedure TFrmPagEspecie.tvEspFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if (CredCli>0) and (AFocusedRecord.Index=0) then Exit;

  ValorAutomatico;
end;

procedure TFrmPagEspecie.tvEspImgStylesGetContentStyle(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
begin
  if ARecord.Focused then
    AStyle := EspStyle_Focus else
    AStyle := EspStyle;
end;

procedure TFrmPagEspecie.tvEspKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FDentroGrid then begin
    if (Key=Key_Up) and (tvEsp.DataController.FocusedRecordIndex=0) then
      edDesconto.SetFocus;
  end else
  if edDesconto.Focused and (Key=Key_Down) then
    gridEsp.SetFocus;
  if (Key=Key_F2) and btnSalvar.Enabled then btnSalvarClick(nil);
  if (Key=Key_Esc) then btnCancelarClick(nil);
  
end;

procedure TFrmPagEspecie.tvEspValorGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if (ARecord.Values[IndValor]=null) or (ARecord.Values[IndValor]=0) then
    AText := '';
end;

procedure TFrmPagEspecie.tvEspValorPropertiesChange(Sender: TObject);
var 
  C: Currency;
  S: String;
begin
  with tvEsp, Controller.EditingController do
    if IsEditing then
      if Edit is TcxCustomCurrencyEdit then begin
        S := FiltraCur(TcxCustomCurrencyEdit(Edit).EditingText);
        C := StrToCurrDef(S, 0);
        if (CredCli>0) and (DataController.FocusedRecordIndex=0) then begin
          FCredUsado := C;
//          Timer1.Enabled := True;
        end;
        with DataController do
          FValores[FocusedRecordIndex] := C;
        if (CredCli>0) and (DataController.FocusedRecordIndex=0) and (C>MaxCred) then
          TimerCred.Enabled := True else
          TimerCred.Enabled := False;
        
        TotalizaDig;
      end;
end;

procedure TFrmPagEspecie.tvEspValorStylesGetContentStyle(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
begin
  if FDentroGrid and ARecord.Focused then
    AStyle := ValorStyle_Focus else
    AStyle := ValorStyle;
end;

procedure TFrmPagEspecie.ValorAutomatico(const aResetarCred: Boolean = False);
var 
  I: Integer;
begin
  if (not FShowed) or (not FAutomatico) then Exit;

  with tvEsp.DataController do begin 
    if CredCli>0 then begin
      if aResetarCred or (FCredUsado>MaxCred) then begin
        Values[0, IndValor] := MaxCred;
        FValores[0] := MaxCred;
        FCredUsado := MaxCred;
      end;
    end;
  
    for I := IFrom to RecordCount-1 do
    if (I=FocusedRecordIndex) then begin
      Values[I, IndValor] := TotalComDesc-FCredUsado;
      FValores[I] := TotalComDesc-FCredUsado;
    end else begin
      Values[I, IndValor] := null;
      FValores[I] := 0;
    end;
  end;

  TotalizaDig;
end;

end.
