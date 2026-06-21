unit uGridStyles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxControls, cxGrid, StdCtrls, ExtCtrls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGraphics, cxStyles, 
  cxCustomData, cxFilter, cxData, cxEdit, DB, cxDBData, cxClasses,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckBox,
  cxButtons, cxLookAndFeelPainters, cxDataStorage, cxCalc, cxSpinEdit,
  cxLookAndFeels, Menus, cxLabel;

type

  TfrmStyleGrid = class(TdxGridFrame)
    GridLevel: TcxGridLevel;
    DBTableView: TcxGridDBTableView;
    DBTableViewFIRSTNAME: TcxGridDBColumn;
    DBTableViewLASTNAME: TcxGridDBColumn;
    DBTableViewCOMPANYNAME: TcxGridDBColumn;
    DBTableViewPAYMENTTYPE: TcxGridDBColumn;
    DBTableViewPRODUCTID: TcxGridDBColumn;
    DBTableViewCUSTOMER: TcxGridDBColumn;
    DBTableViewPURCHASEDATE: TcxGridDBColumn;
    DBTableViewPAYMENTAMOUNT: TcxGridDBColumn;
    DBTableViewCOPIES: TcxGridDBColumn;
    DBTableViewPreview: TcxGridDBColumn;
    SplitterStyle: TSplitter;
    StyleRepository: TcxStyleRepository;
    Panel1: TPanel;
    Label1: TcxLabel;
    cbStyleSheetList: TcxComboBox;
    btnNew: TcxButton;
    btnEdit: TcxButton;
    btnCopy: TcxButton;
    btnDelete: TcxButton;
    cbShading: TcxCheckBox;
    procedure DBTableViewPreviewGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure DBTableViewCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure cbStyleSheetListClick(Sender: TObject);
    procedure cbShadingClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBTableViewCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
  private
    procedure CreateStyles;
  protected
    function GetInitialShowInspector: Boolean; override;
    function GetDescription: String; override;
    function CurrentStyleSheet: TcxCustomStyleSheet;
    function Shading: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  maindata, dxFrames, FrameIDs, dxOperationTypes, uStrsConst,
  cxStyleSheetEditor, cxStyleSheetsLoad, cxGridStyleSheetsPreview;


constructor TfrmStyleGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CreateStyles;
  DoFullExpand(otFullExpand);
end;

function TfrmStyleGrid.GetInitialShowInspector: Boolean;
begin
  Result := False;
end;

function TfrmStyleGrid.CurrentStyleSheet: TcxCustomStyleSheet;
begin
  if cbStyleSheetList.ItemIndex > -1 then
    Result := cbStyleSheetList.Properties.Items.Objects[cbStyleSheetList.ItemIndex] as TcxCustomStyleSheet
  else Result := nil;
end;

function TfrmStyleGrid.Shading: Boolean;
begin
  Result := cbShading.Checked;
end;

procedure TfrmStyleGrid.CreateStyles;
var
  I: Integer;
begin
  LoadStyleSheetsFromIniFile(ExtractFilePath(Application.EXEName) + 'gridstyles.ini',
    StyleRepository, TcxGridTableViewStyleSheet);
  for I := 0 to StyleRepository.StyleSheetCount - 1 do
    cbStyleSheetList.Properties.Items.AddObject(StyleRepository.StyleSheets[I].Caption,
        StyleRepository.StyleSheets[I]);
  if StyleRepository.StyleSheetCount > 0 then
    cbStyleSheetList.ItemIndex := 0;
  cbStyleSheetListClick(nil);  
end;

procedure TfrmStyleGrid.DBTableViewPreviewGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText := sdxFramePreview_DescriptionText1 +
    ARecord.DisplayTexts[DBTableViewFIRSTNAME.Index] + ' ' +
    ARecord.DisplayTexts[DBTableViewLASTNAME.Index] + '.' + #13 +
    sdxFramePreview_DescriptionText2;
end;

{Painting}
procedure DrawGradientRect(DC: HDC; R: TRect; StartColor, EndColor: TColor);

  function GetGradientColor(StartColor, EndColor: TColor; LevelCount, Level: Integer): TColor;
  var
    Red, Green, Blue: Byte;
  begin
    Red :=
      GetRValue(StartColor) + MulDiv(GetRValue(EndColor) - GetRValue(StartColor), Level, LevelCount);
    Green :=
      GetGValue(StartColor) + MulDiv(GetGValue(EndColor) - GetGValue(StartColor), Level, LevelCount);
    Blue :=
      GetBValue(StartColor) + MulDiv(GetBValue(EndColor) - GetBValue(StartColor), Level, LevelCount);
    Result := RGB(Red, Green, Blue);
  end;

var
  I, LevelCount: Integer;
  Color: TColor;
  Brush: HBRUSH;
begin
  LevelCount := R.Bottom - R.Top;
  for I := 0 to LevelCount - 1 do
  begin
    Color := GetGradientColor(StartColor, EndColor, LevelCount, I);
    Brush := CreateSolidBrush(GetNearestColor(DC, Color));
    FillRect(DC, Rect(R.Left, R.Top + I, R.Right, R.Top + I + 1), Brush);
    DeleteObject(Brush);
  end;
end;


type
  TcxUserGridColumnHeaderPainter = class(TcxGridColumnHeaderPainter)
  private
    procedure InternalDrawContent(ACanvas: TcxCanvas;
      const ABounds, ATextAreaBounds: TRect; AAlignmentHorz: TAlignment;
      AAlignmentVert: TcxAlignmentVert; AMultiLine: Boolean; const AText: string;
      AFont: TFont; ATextColor, ABkColor: TColor);
  protected
    procedure DrawContent; override;
  end;


procedure TcxUserGridColumnHeaderPainter.InternalDrawContent(ACanvas: TcxCanvas;
  const ABounds, ATextAreaBounds: TRect; AAlignmentHorz: TAlignment;
  AAlignmentVert: TcxAlignmentVert; AMultiLine: Boolean; const AText: string;
  AFont: TFont; ATextColor, ABkColor: TColor);
const
  AlignmentsHorz: array[TAlignment] of Integer =
    (cxAlignLeft, cxAlignRight, cxAlignHCenter);
  AlignmentsVert: array[TcxAlignmentVert] of Integer =
    (cxAlignTop, cxAlignBottom, cxAlignVCenter);
  MultiLines: array[Boolean] of Integer = (cxSingleLine, cxWordBreak);
begin
  with ACanvas do
  begin
    Brush.Color := ABkColor;
    DrawGradientRect(Handle, ABounds, clWhite, ABkColor);
    if AText <> '' then
    begin
      Font := AFont;
      Font.Color := ATextColor;
      Brush.Style := bsClear;

      DrawText(AText, ATextAreaBounds, AlignmentsHorz[AAlignmentHorz] or
        AlignmentsVert[AAlignmentVert] or MultiLines[AMultiLine]);
    end;
  end;
end;

type
  TcxGridColumnHeaderViewInfoAccess = class(TcxGridColumnHeaderViewInfo);

procedure TcxUserGridColumnHeaderPainter.DrawContent;
var
  I: Integer;
begin
  with ViewInfo do
  begin
    LookAndFeelPainter.DrawHeaderBorder(Self.Canvas, Bounds, Neighbors, Borders);
    InternalDrawContent(Self.Canvas, LookAndFeelPainter.HeaderContentBounds(Bounds, Borders),
      TextAreaBounds, AlignmentHorz, AlignmentVert, MultiLine, Text, Params.Font,
      Params.TextColor, Params.Color);

  end;
  for I := 0 to TcxGridColumnHeaderViewInfoAccess(ViewInfo).AreaViewInfoCount - 1 do
    TcxGridColumnHeaderViewInfoAccess(ViewInfo).AreaViewInfos[I].Paint(Canvas);
end;


procedure TfrmStyleGrid.DBTableViewCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var
  APainter: TcxUserGridColumnHeaderPainter;
begin
  if Shading then
  begin
    APainter := TcxUserGridColumnHeaderPainter.Create(ACanvas, AViewInfo);
    try
      APainter.DrawContent;
    finally
      APainter.Free;
    end;
    ADone := True;
  end;
end;

procedure TfrmStyleGrid.cbStyleSheetListClick(Sender: TObject);
begin
  DBTableView.Styles.StyleSheet := CurrentStyleSheet;
end;

procedure TfrmStyleGrid.cbShadingClick(Sender: TObject);
begin
  DBTableView.LayoutChanged(True);
end;

procedure TfrmStyleGrid.btnNewClick(Sender: TObject);
var
  AStyleSheet: TcxCustomStyleSheet;
begin
  AStyleSheet := StyleRepository.CreateStyleSheet(TcxGridTableViewStyleSheet);
  AStyleSheet.Caption := sdxNewStyleSheet;
  if ShowcxStyleSheetEditor(AStyleSheet, nil) then
  begin
    cbStyleSheetList.Properties.Items.AddObject(AStyleSheet.Caption, AStyleSheet);
    cbStyleSheetList.ItemIndex := cbStyleSheetList.Properties.Items.Count - 1;
    cbStyleSheetListClick(nil);
  end else  AStyleSheet.Free;
end;

procedure TfrmStyleGrid.btnEditClick(Sender: TObject);
begin
  ShowcxStyleSheetEditor(CurrentStyleSheet, nil)
end;

procedure TfrmStyleGrid.btnCopyClick(Sender: TObject);
var
  AStyleSheet: TcxCustomStyleSheet;
begin
  AStyleSheet := StyleRepository.CreateStyleSheet(TcxGridTableViewStyleSheet);
  AStyleSheet.Caption := sdxCopyOf + CurrentStyleSheet.Caption;
  AStyleSheet.CopyFrom(CurrentStyleSheet);
  if ShowcxStyleSheetEditor(AStyleSheet, nil) then
  begin
    cbStyleSheetList.Properties.Items.AddObject(AStyleSheet.Caption, AStyleSheet);
    cbStyleSheetList.ItemIndex := cbStyleSheetList.Properties.Items.Count - 1;
    cbStyleSheetListClick(nil);
  end else  AStyleSheet.Free;
end;

procedure TfrmStyleGrid.btnDeleteClick(Sender: TObject);
var
  S: string;
  AStyleSheet: TcxCustomStyleSheet;
begin
  AStyleSheet := CurrentStyleSheet;
  if AStyleSheet <> nil then
  begin
    S := Format(sdxDeletePresentationStyle, [AStyleSheet.Caption]);
    if Application.MessageBox(PChar(S), PChar('Confirm'), MB_YESNO) = IDYES then
    begin
      cbStyleSheetList.Properties.Items.Delete(
        cbStyleSheetList.Properties.Items.IndexOfObject(AStyleSheet));
      AStyleSheet.Free;
      cbStyleSheetListClick(nil);
    end;
  end;
end;


function TfrmStyleGrid.GetDescription: String;
begin
  Result := sdxFrameStyleDescription;
end;

procedure TfrmStyleGrid.DBTableViewCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  if Shading then
  begin
    DrawGradientRect(ACanvas.Handle,  AViewInfo.Bounds, clWhite, AViewInfo.Params.Color);
    ADone := True;
  end;  
end;

initialization
  dxFrameManager.RegisterFrame(GridStyleFrameID, TfrmStyleGrid,
    GridStylesFrameName, GridStyleImageIndex, AppearanceGroupIndex, -1, -1);

end.
