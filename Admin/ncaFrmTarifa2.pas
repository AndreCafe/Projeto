unit ncaFrmTarifa2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxCurrencyEdit,
  cxInplaceContainer, cxControls, StdCtrls, 
  dxBar, cxClasses, cxMaskEdit, cxSpinEdit, cxTimeEdit, cxContainer, cxEdit,
  cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxCheckBox, cxPC, Menus, cxLookAndFeelPainters, cxRadioGroup,
  cxButtons, cxDropDownEdit, cxFilter, cxData, cxDataStorage,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGridLevel, cxGrid,
  cxButtonEdit, cxGroupBox, cxEditRepositoryItems, cxCalc, cxHint;

type
  TFrmTarifa = class(TForm)
    dxBarManager1: TdxBarManager;
    cmTM1: TdxBarButton;
    cmTM5: TdxBarButton;
    cmTM10: TdxBarButton;
    cmTM15: TdxBarButton;
    cmTM20: TdxBarButton;
    cmTM25: TdxBarButton;
    cmTM30: TdxBarButton;
    cmTM60: TdxBarButton;
    cm1c: TdxBarButton;
    dxBarButton2: TdxBarButton;
    cm10c: TdxBarButton;
    cm25c: TdxBarButton;
    cm50c: TdxBarButton;
    Paginas: TcxPageControl;
    tsMinutos: TcxTabSheet;
    panMin: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    btnAvancar: TcxButton;
    btnVoltar: TcxButton;
    tsHoras: TcxTabSheet;
    dxBarButton1: TdxBarButton;
    panHoras: TLMDSimplePanel;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    LMDSimplePanel4: TLMDSimplePanel;
    lbPromptHora: TcxLabel;
    edValor1h: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    btnOkHoras: TcxButton;
    cxTabSheet1: TcxTabSheet;
    LMDSimplePanel5: TLMDSimplePanel;
    cxLabel6: TcxLabel;
    cxLabel4: TcxLabel;
    edTempoI: TcxSpinEdit;
    cxLabel3: TcxLabel;
    edValorI: TcxCurrencyEdit;
    cxLabel9: TcxLabel;
    cxLabel7: TcxLabel;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    btnOkInicio: TcxButton;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    edDivMin: TcxComboBox;
    cxLabel8: TcxLabel;
    cxLabel10: TcxLabel;
    btnAplicarMin: TcxButton;
    SC: TcxEditStyleController;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    tvMin: TcxGridTableView;
    tvMinTempoStr: TcxGridColumn;
    tvMinValor: TcxGridColumn;
    tvMinTempo: TcxGridColumn;
    LMDSimplePanel3: TLMDSimplePanel;
    gridH: TcxGrid;
    tvH: TcxGridTableView;
    tvHTempoUso: TcxGridColumn;
    tvHCobrar: TcxGridColumn;
    tvHTarifa: TcxGridColumn;
    glH: TcxGridLevel;
    cxEditRepository1: TcxEditRepository;
    tvCurEdit_ReadOnly: TcxEditRepositoryCurrencyItem;
    tvCurEdit: TcxEditRepositoryCurrencyItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    LMDSimplePanel8: TLMDSimplePanel;
    cxGroupBox2: TcxGroupBox;
    edArr: TcxComboBox;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    LMDSimplePanel9: TLMDSimplePanel;
    cxGroupBox1: TcxGroupBox;
    lbComoTarifar: TcxLabel;
    rbRepetirUltima: TcxRadioButton;
    rbRepetirTodas: TcxRadioButton;
    rbRepetirDesde: TcxRadioButton;
    edRepetirHora: TcxSpinEdit;
    cxLabel14: TcxLabel;
    cxLabel2: TcxLabel;
    edNumH: TcxSpinEdit;
    cxLabel5: TcxLabel;
    HC: TcxHintStyleController;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cmRemoverTempoClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnOkHorasClick(Sender: TObject);
    procedure btnAplicarMinClick(Sender: TObject);
    procedure edValor1hKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkInicioClick(Sender: TObject);
    procedure edValorIKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edTempoIKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edArrPropertiesCloseUp(Sender: TObject);
    procedure tlHorasCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure tlHorasInitEdit(Sender, AItem: TObject; AEdit: TcxCustomEdit);
    procedure tvMinCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure tvMinInitEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure tvMinInitEditValue(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var AValue: Variant);
    procedure tvMinCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure tvHCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvHEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure tvMinEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure edNumHPropertiesChange(Sender: TObject);
    procedure rbRepetirDesdeClick(Sender: TObject);
    procedure rbRepetirUltimaClick(Sender: TObject);
    procedure rbRepetirTodasClick(Sender: TObject);
    procedure tvHDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure edRepetirHoraPropertiesChange(Sender: TObject);
    procedure tvMinTempoStrCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvMinMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tvMinMouseLeave(Sender: TObject);
    procedure GridMouseLeave(Sender: TObject);
    procedure tvMinMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FValorI : Currency;
    FTempoI : Integer;
    FDivMin : Integer;
    FArr    : Byte;
    FShowing : Boolean;
    FRepetir : Byte;
    FDisableCalcHoras : Boolean;
    FMouseOverDel : Boolean;
    FShowHint : Boolean;
    { Private declarations }

    procedure Load;
    procedure LoadMin;
    procedure ValidaMinutos;

    procedure AjustaOpcoesHora;

    procedure HideHint;

    procedure CalcHorasExtras;
    procedure SetRepetir(const Value: Byte);

    procedure SetMouseOverDel(const AValue: Boolean);
  public
    property Repetir: Byte
      read FRepetir write SetRepetir;
    { Public declarations }
  end;

var
  FrmTarifa: TFrmTarifa;

implementation

uses ufmImagens, ncaFrmPri, ncClassesBase;

{$R *.dfm}

procedure TFrmTarifa.AjustaOpcoesHora;
begin
  lbComoTarifar.Caption := 'Como tarifar tempo de uso maior que ' + IntToStr(edNumH.Value)+'?';
  rbRepetirUltima.Caption := 'Aplicar a tarifa da ' + IntToStr(edNumH.Value) + 'a. hora nas demais horas';
  edRepetirHora.Properties.MaxValue := edNumH.Value;
  if edRepetirHora.Value > edNumH.Value then
    edRepetirHora.Value := edNumH.Value;
  edRepetirHora.Enabled := rbRepetirDesde.Checked;
end;

procedure TFrmTarifa.btnAplicarMinClick(Sender: TObject);
begin
  FDivMin := StrToIntDef(Trim(edDivMin.Text), 1);
  ValidaMinutos;
  panMin.Visible := True;
  Load;
  Grid.SetFocus;
  tvMin.DataController.FocusedRecordIndex := 1;
  tvMin.Controller.FocusedColumnIndex := 1;
  tvMin.Controller.EditingController.ShowEdit;
end;

procedure TFrmTarifa.btnAvancarClick(Sender: TObject);
var I: Integer;
begin
{  case Paginas.ActivePageIndex of 
    0 : ValidaP;
    
    1 : if edValor1h.Value<FValorI then
          Raise Exception.Create('O valor para 1h de uso não pode ser menor que o valor inicial');

    2 : for I := 1 to 23  do
          if tlHoras.Items[i].Values[1] < tlHoras.Items[i-1].Values[1] then
            Raise Exception.Create('O valor das horas não pode dimuir');
  end;}
  
  Paginas.ActivePageIndex := Paginas.ActivePageIndex + 1;
{  case Paginas.ActivePageIndex of
    1 : edValor1H.SetFocus;
    2 : for I := 0 to 23 do tlHoras.Nodes.Items[I].Values[1] := ((I+1)*edValor1H.Value);
    3 : Load;
  end;}
end;

procedure TFrmTarifa.btnOkHorasClick(Sender: TObject);
var i: integer;
begin
  lbPromptHora.Style.TextColor := clGray;
  lbPromptHora.Caption := 'Informe abaixo o valor total a ser cobrado conforme a quantidade de horas utilizada';
  panHoras.Visible := True;
  FDisableCalcHoras := True;
  try
    for I := 0 to 23 do 
      tvH.DataController.Values[I, 1] := ((I+1)*edValor1H.Value);
  finally
    FDisableCalcHoras := False;
  end;
  gridH.SetFocus;
  tvH.DataController.FocusedRecordIndex := 1;
  tvH.Controller.FocusedColumnIndex := 1;
  tvH.Controller.EditingController.ShowEdit;
  btnAvancar.Enabled := True;
  Load;
  tsMinutos.Enabled := True;
end;

procedure TFrmTarifa.btnOkInicioClick(Sender: TObject);
begin
  ValidaMinutos;
  tsHoras.Enabled := True;
  Paginas.ActivePageIndex := 1;
end;

procedure TFrmTarifa.btnVoltarClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := Paginas.ActivePageIndex - 1;
end;

procedure TFrmTarifa.CalcHorasExtras;
var 
  I, R: Integer;
  V : Currency;
begin
  if FDisableCalcHoras then Exit;

  FDisableCalcHoras := True;
  try
    case FRepetir of
      rtTodas : R := 0; 
      rtUltima : R := edNumH.Value - 1;
      rtDesde : R := edRepetirHora.Value - 1; 
    end;
    for I := edNumH.Value to 23 do with tvH.DataController do begin
      if R=0 then
        V := Values[0, 1] else
        V := Values[R, 1] - Values[R-1, 1];
        
      V := V + Values[I-1, 1];  
      Values[I, 1] := V;
      case FRepetir of
        rtTodas : begin
          Inc(R);
          if R>=edNumH.Value then R := 0;
        end;
        rtDesde : begin
          Inc(R);
          if R>=edNumH.Value then R := edRepetirHora.Value - 1;
        end;
      end;
    end;
  finally
    FDisableCalcHoras := False;
  end;
end;

procedure TFrmTarifa.cmRemoverTempoClick(Sender: TObject);
begin
  tvMin.DataController.DeleteFocused;
end;

procedure TFrmTarifa.edArrPropertiesCloseUp(Sender: TObject);
begin
  FArr := StrToInt(Trim(edArr.Text));
end;

procedure TFrmTarifa.edNumHPropertiesChange(Sender: TObject);
begin
  tvH.Invalidate(True);
  tvMin.Invalidate(True);
  AjustaOpcoesHora;
  gridH.SetFocus;
end;

procedure TFrmTarifa.edRepetirHoraPropertiesChange(Sender: TObject);
begin
  CalcHorasExtras;
end;

procedure TFrmTarifa.edTempoIKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Key_Enter then btnOkInicio.Click;
end;

procedure TFrmTarifa.edValor1hKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Key_Enter then
    btnOkHoras.Click;
end;

procedure TFrmTarifa.edValorIKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Key_Enter then
    edTempoI.SetFocus;
end;

procedure TFrmTarifa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTarifa.FormCreate(Sender: TObject);
var I: Integer;
begin
  FShowHint := False;
  FMouseOverDel := False;
  FRepetir := rtUltima;
  FShowing := False;
  FArr := 5;
  edArr.ItemIndex := 1;
  FDivMin := 15;
  Paginas.ActivePageIndex := 0;
  ActiveControl := edValorI;
//  tlHoras.OptionsView.Headers := False;
  FTempoI := 0;
//  TL.OptionsView.Headers := False;
  FDisableCalcHoras := True;
  try
    for I := 1 to 24 do with tvH.DataController do  begin
      AppendRecord;
      Values[I-1, 0] := IntToStr(I) + ' h';
    end;
  finally
    FDisableCalcHoras := False;
  end;
end;

procedure TFrmTarifa.FormShow(Sender: TObject);
begin
  FShowing := True;
end;

procedure TFrmTarifa.GridMouseLeave(Sender: TObject);
begin
  HideHint;
end;

procedure TFrmTarifa.HideHint;
begin
  HC.HideHint;
  FShowHint := False;
end;

procedure TFrmTarifa.Load;
var 
  I, H, M, T, MR, TA : Integer;  
  V, VR: Currency;
  Diminuiu : Boolean;

begin
  tvMin.BeginUpdate;
  try
    while tvMin.DataController.RecordCount>0 do tvMin.DataController.DeleteRecord(0);
    
    with tvMin.DataController do
    if FTempoI < 60 then begin
      I := AppendRecord;
      Values[I, 0] := IntToStr(FTempoI)+'m';
      Values[I, 1] := FValorI;
      Values[I, 2] := FTempoI;

      if FTempoI>0 then
        Diminuiu := ((FValorI / (FTempoI/60)) < edValor1H.Value) else
        Diminuiu := True;
        
      MR := 60 - FTempoI;
      VR := edValor1h.Value - FValorI;

      TA := FTempoI;
      M := FDivMin;
      while M < 60 do begin
        if M>FTempoI then begin
          I := AppendRecord;
          Values[I, 0] := IntToStr(M)+'m';
          if Diminuiu then
            V := (M/60) * edValor1H.Value else
            V := (((M-FTempoI)/MR) * VR) + FValorI;
              
          if Frac(V/(FArr/100))>0 then
            V := (Int(V/(FArr/100)) + 1) * (FArr/100);
          Values[I, 1] := V;
          Values[I, 2] := M;
          TA := M;
        end;
            
        M := M + FDivMin;
      end;

    end; 
  
    with tvMin.DataController do 
    for H := 1 to 24 do begin  
      I := AppendRecord;
      Values[I, 0] := IntToStr(h)+'h';
      Values[I, 1] := tvH.DataController.Values[h-1, 1];
      Values[I, 2] := (h*60);
      if H<24 then begin
        M := FDivMin;
        while (M < 60) do begin 
          I := AppendRecord;
          Values[I, 0] := IntToStr(M)+'m';
          V := tvH.DataController.Values[h-1, 1] + ((M/60) * edValor1H.Value);
          if Frac(V/(FArr/100))>0 then
            V := (Int(V/(FArr/100)) + 1) * (FArr/100);
          Values[I, 1] := V;  
          Values[I, 2] := (h*60) + m;
          M := M + FDivMin;
        end;
      end;
    end;
  finally
    tvMin.EndUpdate;
  end;
end;

procedure TFrmTarifa.LoadMin;
begin

end;

procedure TFrmTarifa.PaginasChange(Sender: TObject);
begin
  btnVoltar.Visible := (Paginas.ActivePageIndex>0);
  btnAvancar.Visible := (Paginas.ActivePageIndex=1);

  if not FShowing then Exit;
  
  case Paginas.ActivePageIndex of
    0 : edValorI.SetFocus;
    1 : if panHoras.Visible then 
      gridH.SetFocus else
      edValor1h.SetFocus;
    2 : Grid.SetFocus;
  end;
  if Paginas.ActivePage = tsHoras then
    if panHoras.Visible then
      gridH.SetFocus else
      edValor1h.SetFocus;
end;

procedure TFrmTarifa.rbRepetirDesdeClick(Sender: TObject);
begin
  FRepetir := rtDesde;
  edRepetirHora.Enabled := True;
  CalcHorasExtras;
  gridH.SetFocus;
end;

procedure TFrmTarifa.rbRepetirTodasClick(Sender: TObject);
begin
  FRepetir := rtTodas;
  CalcHorasExtras;
  gridH.Setfocus;
end;

procedure TFrmTarifa.rbRepetirUltimaClick(Sender: TObject);
begin
  FRepetir := rtUltima;
  CalcHorasExtras;
  gridH.SetFocus;
end;

procedure TFrmTarifa.SetMouseOverDel(const AValue: Boolean);
begin
  if FMouseOverDel=AValue then Exit;
  if not AValue then HideHint;

  FMouseOverDel := AValue;
  tvMin.ViewData.Records[tvMin.DataController.FocusedRecordIndex].Invalidate(tvMinTempoStr);
end;

procedure TFrmTarifa.SetRepetir(const Value: Byte);
begin
  if FRepetir=Value then Exit;
  
  FRepetir := Value;

  case FRepetir of
    rtUltima : rbRepetirUltima.Checked := True;
    rtTodas  : rbRepetirTodas.Checked := True;
    rtDesde  : rbRepetirDesde.Checked := True;
  end;

  edRepetirHora.Enabled := (FRepetir=rtDesde);
end;

procedure TFrmTarifa.tlHorasCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
  if aviewinfo.Focused then
    ACanvas.Font.Style := [fsBold];
end;

procedure TFrmTarifa.tlHorasInitEdit(Sender, AItem: TObject;
  AEdit: TcxCustomEdit);
begin
  AEdit.Style.StyleController := SC;
  AEdit.Style.TextStyle := [fsBold];
  AEdit.StyleFocused.TextStyle := [fsBold];
end;

procedure TFrmTarifa.tvHCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Index >= edNumH.Value then begin
    if AViewInfo.Focused then
      ACanvas.Brush.Color := $00BFFFFF;
    ACanvas.Font.Color := clGray;
  end;
  
end;

procedure TFrmTarifa.tvHDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex, AItemIndex: Integer);
var Tar: Currency;  
begin
  if AItemIndex=2 then Exit;
  if ARecordIndex=0 then 
    ADataController.Values[ARecordIndex, 2] := ADataController.Values[ARecordIndex, 1] else
    ADataController.Values[ARecordIndex, 2] := ADataController.Values[ARecordIndex, 1] - ADataController.Values[ARecordIndex-1, 1];

  CalcHorasExtras;
end;

procedure TFrmTarifa.tvHEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  AAllow := (tvH.DataController.FocusedRecordIndex < edNumH.Value);
end;

procedure TFrmTarifa.tvMinCanFocusRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
var 
  V: Variant;
  I: Integer;
begin
  V := ARecord.Values[2];
  if V<>null then begin
    I := V;
    AAllow := ((I mod 60) <> 0);
  end else 
    AAllow := False;
end;

procedure TFrmTarifa.tvMinCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var 
  V: Variant;
  I: Integer;
begin
  V := AViewInfo.GridRecord.Values[2];
  if V<>null then begin
    I := V;
    if ((I mod 60) = 0) then begin
      ACanvas.Brush.Color := clBtnFace;
      ACanvas.Font.Style := [fsBold];
      if I > (edNumH.Value*60) then
        ACanvas.Font.Color := $00ADADAD else
        ACanvas.Font.Color := clBlack;
    end else begin
      if AViewInfo.Focused then
        ACanvas.Brush.Color := $00BFFFFF;
      if I>(edNumH.Value*60) then
        ACanvas.Font.Color := $00ADADAD; 
    end;
  end;
end;

procedure TFrmTarifa.tvMinEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  with tvMin.DataController do begin
    AAllow := (FocusedRecordIndex > 0) and
              (Values[FocusedRecordIndex, 2]<(edNumH.Value*60));
  end;
end;

procedure TFrmTarifa.tvMinInitEdit(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
begin
  AEdit.Style.StyleController := SC;
  AEdit.Style.TextStyle := [fsBold];
  
  AEdit.StyleFocused.TextStyle := [fsBold];
end;

procedure TFrmTarifa.tvMinInitEditValue(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var AValue: Variant);
begin
  AEdit.Style.StyleController := SC;
  AEdit.Style.TextStyle := [fsBold];

  AEdit.StyleFocused.TextStyle := [fsBold];
end;

procedure TFrmTarifa.tvMinMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var V: Variant;  

procedure SetNextFocus;
var I : Integer;
begin
  with tvMin.DataController do begin
    for I := FocusedRecordIndex to RecordCount - 1 do
      if (Values[I, 2]<>null) and (Values[I, 2] mod 60) > 0 then begin
        FocusedRecordIndex := I;
        Exit;
      end;
    FocusedRecordIndex := 0;
  end;
end;

begin
  if FShowHint then begin
    with tvMin.DataController do begin
      DeleteFocused;
      SetNextFocus;
    end;
    HideHint;
  end;
end;

procedure TFrmTarifa.tvMinMouseLeave(Sender: TObject);
begin
  SetMouseOverDel(False);
end;

procedure TFrmTarifa.tvMinMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  AHitTest: TcxCustomGridHitTest;
  AGridSite: TcxGridSite;
  RCH : TcxGridRecordCellHitTest;
  P : TPoint;
begin
  P.X := X;
  P.Y := Y;
  P := Grid.ClientToScreen(P);
  P.Y := P.Y+22;
  AGridSite := Sender as TcxGridSite;
  AHitTest := tvMin.GetHitTest(X, Y);
  if AHitTest<>nil then
    AGridSite.Cursor := AHitTest.Cursor;
  if (AHitTest is TcxGridRecordCellHitTest) then
  begin
    RCH := TcxGridRecordCellHitTest(AHitTest);
    X := X - 15;
    SetMouseOverDel((RCH.Item=tvMinTempoStr) and RCH.GridRecord.Focused and (X in [1..30]));
    if FMouseOverDel then begin
      AGridSite.Cursor := crHandPoint;
      if not FShowHint then begin
        HC.ShowHint(P.X, P.Y, 'Remover Tarifa', 'Clique aqui para remover essa tarifa/tempo');
        FShowHint := True;
      end;
    end;
  end else 
    SetMouseOverDel(False);
end;

procedure TFrmTarifa.tvMinTempoStrCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V : Variant;  
begin
  with AViewInfo do begin
    if not (Selected or Focused) then Exit;
    V := GridRecord.Values[2];
    if (V=null) or (V>(edNumH.Value*60)) then Exit;
    ACanvas.FillRect(Bounds);
    ACanvas.DrawTexT(Text, Bounds, cxAlignCenter);
    if (GridRecord.Index>0) and (Selected or Focused) then 
      if FMouseOverDel then
        ACanvas.DrawImage(dmImagens.Imagens, Bounds.Left+5, Bounds.Top, 64) else
        ACanvas.DrawImage(dmImagens.Imagens, Bounds.Left+5, Bounds.Top, 79);
    ADone := True;
  end;
end;

procedure TFrmTarifa.ValidaMinutos;
begin
  FValorI := edValorI.Value;
  FTempoI := edTempoI.Value;

  if (FValorI>0) and (FTempoI<1) then
    Raise Exception.Create('O tempo inicial tem que ser informado');
end;

end.
