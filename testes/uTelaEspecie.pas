unit uTelaEspecie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, StdCtrls, cxButtons, LMDBaseEdit,
  LMDCustomEdit, LMDEdit, LMDCustomMaskEdit, LMDMaskEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxLabel, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxImageComboBox, ImgList,
  cxCheckBox, LMDButtonControl, LMDCustomCheckBox, LMDCheckBox, cxButtonEdit,
  dxScreenTip, dxCustomHint, cxHint, cxMemo, LMDPNGImage, ExtCtrls,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton;

type
  TForm4 = class(TForm)
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
    lbDif: TcxLabel;
    EspStyle_Focus: TcxStyle;
    ValorStyle_Focus: TcxStyle;
    cbDebitar: TLMDCheckBox;
    LMDSimplePanel2: TLMDSimplePanel;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    cxHintStyleController1: TcxHintStyleController;
    LMDSimplePanel4: TLMDSimplePanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    LMDSimplePanel5: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxMemo1: TcxMemo;
    lbTroco: TcxLabel;
    cxButton4: TcxButton;
    panPremium: TLMDSimplePanel;
    Image1: TImage;
    LMDSpeedButton1: TLMDSpeedButton;
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
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvEspValorPropertiesChange(Sender: TObject);
    procedure cbDebitarClick(Sender: TObject);
    procedure tvEspDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure tvEspDataControllerDataChanged(Sender: TObject);
  private
    { Private declarations }
    FTotalDig : Currency;
    FShowed   : Boolean;
    FTotalPag : Currency;
    FAutomatico : Boolean;
    procedure AtualizaTotais;
    procedure TotalizaDig(aEditando: Boolean = False; aValor: Currency = 0);
  public
    
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.TotalizaDig(aEditando: Boolean; aValor: Currency);
var 
  I : Integer;
begin
  FTotalDig := 0;
  with tvEsp.DataController do 
  for I := 0 to RecordCount - 1 do begin
    if aEditando and (I=FocusedRecordIndex) then
      FTotalDig := FTotalDig + aValor
    else
    if Values[I, 1]<>null then
      FTotalDig := FTotalDig + Values[I, 1];
  end;
  AtualizaTotais;
end;

procedure TForm4.AtualizaTotais;
begin
  if FTotalDig>=FTotalPag then
    cbDebitar.Checked := False;

  if cbDebitar.Checked then
    cbDebitar.Font.Style := [fsBold] else
    cbDebitar.Font.Style := []; 
    
  if FTotalDig>FTotalPag then begin
    lbDif.Caption := FloatToStrF(FTotalDig-FTotalPag, ffCurrency, 10 , 2);
    lbDif.Style.TextColor := clGreen;
    lbTroco.Style.TextColor := clGreen;
    lbTroco.Caption := 'Troco:';
  end else
  if FTotalDig<FTotalPag then begin
    lbTroco.Style.TextColor := clRed;
    if FTotalDig>0 then
      lbTroco.Caption := 'Falta:' else
      lbTroco.Caption := '';
    lbDif.Style.TextColor := clRed;
    lbDif.Caption := FloatToStrF(FTotalPag-FTotalDig, ffCurrency, 10, 2);
  end else begin
    lbDif.Style.TextColor := clBtnFace;
    lbTroco.Style.TextColor := clBtnFace;
  end;
end;

procedure TForm4.cbDebitarClick(Sender: TObject);
var 
  I : Integer;
begin
  if (FTotalDig>=FTotalPag) and cbDebitar.Checked then begin
    FTotalDig := 0;
    FAutomatico := False;
    with tvEsp.DataController do 
    for I := 0 to RecordCount - 1 do Values[I, 1] := null;
  end;
  AtualizaTotais;
  gridEsp.SetFocus;
end;

procedure TForm4.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm4.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FTotalDig := 0;
  FShowed := False;
  FAutomatico := True;
  FTotalPag := 100;
  tvEsp.DataController.AppendRecord;
  tvEsp.DataController.Values[0, 0] := 0;
  tvEsp.DataController.Values[0, 1] := 100;
  tvEsp.DataController.AppendRecord;
  tvEsp.DataController.Values[1, 0] := 1;
  tvEsp.DataController.AppendRecord;
  tvEsp.DataController.Values[2, 0] := 2;
  tvEsp.DataController.AppendRecord;
  tvEsp.DataController.Values[3, 0] := 3;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  tvEsp.DataController.FocusedRecordIndex := 0;
  TotalizaDig;
  FShowed := True;
end;

procedure TForm4.tvEspCanSelectRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
  AAllow := (ARecord.Index>0);
end;

procedure TForm4.tvEspCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var R: TRect;  
begin
  if AViewInfo.RecordViewInfo.Focused then
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
  end;
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

procedure TForm4.tvEspDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  with ADataController do
  if FShowed then
    FAutomatico := (Values[FocusedRecordIndex, 1]=FTotalPag);
end;

procedure TForm4.tvEspDataControllerDataChanged(Sender: TObject);
begin
  if (not FShowed) then Exit;
  with tvEsp.DataController do 
     if (Values[FocusedRecordIndex, 1] <> null) and (Values[FocusedRecordIndex, 1]=0) then
        Values[FocusedRecordIndex, 1] := null;
end;

procedure TForm4.tvEspFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var I : Integer;
begin
  if (not FShowed) or (not FAutomatico) then Exit;
  
  with tvEsp.DataController do begin
    for I := 0 to RecordCount-1 do 
      if (I=FocusedRecordIndex) then
        Values[I, 1] := 100 else
        Values[I, 1] := null;
  end;
end;


procedure TForm4.tvEspImgStylesGetContentStyle(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
begin
  if ARecord.Focused then
    AStyle := EspStyle_Focus else
    AStyle := EspStyle;
end;

function FiltraCur(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9', ',', '.'] then
      Result := Result + S[I];
end;

procedure TForm4.tvEspValorPropertiesChange(Sender: TObject);
var 
  C: Currency;
  S: String;
begin
  with tvEsp.Controller.EditingController do
    if IsEditing then
      if Edit is TcxCustomCurrencyEdit then begin
        S := FiltraCur(TcxCustomCurrencyEdit(Edit).EditingText);
        C := StrToCurrDef(S, 0);
        TotalizaDig(True, C);
      end;
end;

procedure TForm4.tvEspValorStylesGetContentStyle(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
begin
  if ARecord.Focused then
    AStyle := ValorStyle_Focus else
    AStyle := ValorStyle;
end;

end.
