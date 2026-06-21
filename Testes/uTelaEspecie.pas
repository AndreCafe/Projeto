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
  dxScreenTip, dxCustomHint, cxHint, cxMemo;

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
    cxLabel3: TcxLabel;
    EspStyle_Focus: TcxStyle;
    ValorStyle_Focus: TcxStyle;
    LMDCheckBox1: TLMDCheckBox;
    LMDSimplePanel2: TLMDSimplePanel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    cxHintStyleController1: TcxHintStyleController;
    LMDSimplePanel4: TLMDSimplePanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    LMDSimplePanel5: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxMemo1: TcxMemo;
    procedure FormCreate(Sender: TObject);
    procedure tvEspCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvEspFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tvEspCanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure tvEspGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
    procedure tvEspImgStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure tvEspValorStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

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
{  tvEsp.DataController.AppendRecord;
  tvEsp.DataController.Values[0, 0] := null;  }
  tvEsp.DataController.AppendRecord;
  tvEsp.DataController.Values[0, 0] := 0;
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

procedure TForm4.tvEspFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var I : Integer;
begin
  with tvEsp.DataController do begin
    for I := 0 to RecordCount-1 do 
      if (I=FocusedRecordIndex) then
        Values[I, 1] := 100 else
        Values[I, 1] := null;
  end;
end;


procedure TForm4.tvEspGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
//if ARecord.Index=0 then AHeight := 32;
end;

procedure TForm4.tvEspImgStylesGetContentStyle(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
begin
  if ARecord.Focused then
    AStyle := EspStyle_Focus else
    AStyle := EspStyle;
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
