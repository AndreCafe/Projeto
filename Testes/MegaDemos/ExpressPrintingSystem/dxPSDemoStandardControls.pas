unit dxPSDemoStandardControls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxInplaceContainer, DB, DBTables, cxTLData, cxDBTL,
  cxMaskEdit, cxMemo, cxBlobEdit, dxPSDemoCommon, cxVariants, cxClasses, cxEdit,
  cxCustomPivotGrid, cxDBPivotGrid, dxPScxPivotGridLnk, Grids, dxPSCore,
  dxPSStdGrLnk, StdCtrls, CheckLst, cxPC, ImgList, dxPSChLbxLnk, dxPSLbxLnk;

type

  { TfrStandardControlsFrame }

  TfrStandardControlsFrame = class(TdxPrintingSystemDemoFrame)
    StringGrid: TStringGrid;
    CountryCodeList: TCheckListBox;
    pcMain: TcxPageControl;
    tsStringGrid: TcxTabSheet;
    tsCheckListBox: TcxTabSheet;
    tsDrawGrid: TcxTabSheet;
    ilFlags: TcxImageList;
    DrawGrid: TDrawGrid;
    ilFontImages: TcxImageList;
    tsListBox: TcxTabSheet;
    FontsList: TListBox;
    procedure DrawGridDrawCell(Sender: TObject;
      ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure DrawGridCustomDrawCell(Sender: TBasedxReportLink;
      ACol, ARow: Integer; ACanvas: TCanvas; ABoundsRect, AClientRect: TRect);
    procedure FontsListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormShow(Sender: TObject);
  protected
    FCheckListBoxReportLink: TBasedxReportLink;
    FDrawGridReportLink: TdxDrawGridReportLink;
    FListBoxItemBitmap: array[Boolean] of TBitmap;
    FListBoxReportLink: TdxListBoxReportLink;
    FStringGridReportLink: TBasedxReportLink;
    function CreateReportLink(AComponentPrinter: TdxComponentPrinter): TBasedxReportLink; override;
    function GetReportLinkComponent: TComponent; override;
    procedure DoDrawFlag(ACanvas: TCanvas; R: TRect; ACol, ARow: Integer);
    procedure InitializeListBox;
    procedure InitializeStringGrid;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}

type
  { TdxPSStandardControlsFrameInfo }

  TdxPSStandardControlsFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

function EnumFontFamProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: TfrStandardControlsFrame): Integer; stdcall;
begin
  case FontType of
    TRUETYPE_FONTTYPE:
      Data.FontsList.AddItem(LogFont.lfFaceName, Data.FListBoxItemBitmap[False]);
    RASTER_FONTTYPE, DEVICE_FONTTYPE:
      Data.FontsList.AddItem(LogFont.lfFaceName, Data.FListBoxItemBitmap[True]);
  end;
  Result := 1;
end;

{ TdxPSStandardControlsFrameInfo }

constructor TdxPSStandardControlsFrameInfo.Create;
begin
  inherited Create;
  Caption := 'Standard Controls';
end;

function TdxPSStandardControlsFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrStandardControlsFrame;
end;

function TdxPSStandardControlsFrameInfo.GetImageIndex: Integer;
begin
  Result := 22;
end;

{ TfrStandardControlsFrame }

constructor TfrStandardControlsFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FListBoxItemBitmap[False] := TBitmap.Create;
  FListBoxItemBitmap[True] := TBitmap.Create;
  ilFontImages.GetBitmap(0, FListBoxItemBitmap[False]);
  ilFontImages.GetBitmap(1, FListBoxItemBitmap[True]);
end;

destructor TfrStandardControlsFrame.Destroy;
begin
 (ReportLink as TdxCompositionReportLink).Items.Clear;
  FreeAndNil(FListBoxItemBitmap[False]);
  FreeAndNil(FListBoxItemBitmap[True]);
  FreeAndNil(FCheckListBoxReportLink);
  FreeAndNil(FStringGridReportLink);
  FreeAndNil(FDrawGridReportLink);
  FreeAndNil(FListBoxReportLink);
  inherited Destroy;
end;

procedure TfrStandardControlsFrame.DrawGridDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  DoDrawFlag(TDrawGrid(Sender).Canvas, Rect, ACol, ARow);
end;

procedure TfrStandardControlsFrame.DrawGridCustomDrawCell(
  Sender: TBasedxReportLink; ACol, ARow: Integer; ACanvas: TCanvas;
  ABoundsRect, AClientRect: TRect);
begin
  DoDrawFlag(ACanvas, AClientRect, ACol, ARow);
end;

procedure TfrStandardControlsFrame.FontsListDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  ACanvas: TCanvas;
  AListBox: TListBox;
begin
  AListBox := Control as TListBox;
  ACanvas := AListBox.Canvas;
  ACanvas.FillRect(Rect);
  ACanvas.Draw(Rect.Left + 2, Rect.Top, TBitmap(AListBox.Items.Objects[Index]));
  ACanvas.Font.Name := AListBox.Items.Strings[Index];
  ACanvas.TextOut(Rect.Left + 2 + ilFontImages.Width, Rect.Top, AListBox.Items.Strings[Index]);
end;

procedure TfrStandardControlsFrame.FormShow(Sender: TObject);
begin
  InitializeStringGrid;
  InitializeListBox;
end;

procedure TfrStandardControlsFrame.DoDrawFlag(
  ACanvas: TCanvas; R: TRect; ACol, ARow: Integer);
var
  ABitmap: TBitmap;
begin
  ACanvas.Pen.Color := clWhite;
  ACanvas.MoveTo(R.Left, R.Bottom);
  ACanvas.LineTo(R.Right, R.Bottom);
  ACanvas.LineTo(R.Right, R.Top-1);

  ACanvas.Pen.Color := clBtnShadow;
  ACanvas.MoveTo(ACanvas.PenPos.x - 1, ACanvas.PenPos.y + 1);
  ACanvas.LineTo(R.Left, R.Top);
  ACanvas.LineTo(R.Left, R.Bottom);

  ACanvas.Pen.Color := clBtnFace;
  ACanvas.MoveTo(R.Left + 1, R.Bottom - 1);
  ACanvas.LineTo(R.Right - 1, R.Bottom - 1);
  ACanvas.LineTo(R.Right - 1, R.Top);
  ACanvas.MoveTo(ACanvas.PenPos.x - 1, ACanvas.PenPos.y + 1);

  ACanvas.Pen.Color := clBlack;
  ACanvas.LineTo(R.Left + 1, R.Top + 1);
  ACanvas.LineTo(R.Left + 1, R.Bottom - 1);

  ABitmap := TBitmap.Create;
  try
    ilFlags.GetBitmap(ACol + ARow * DrawGrid.ColCount, ABitmap);
    InflateRect(R, -2, -2);
    ACanvas.StretchDraw(R, ABitmap);
  finally
    ABitmap.Free;
  end;
end;

procedure TfrStandardControlsFrame.InitializeListBox;
var
  DC: HDC;
begin
  DC := GetDC(0);
  try
    EnumFontFamilies(DC, nil, @EnumFontFamProc, Integer(Self));
  finally
    ReleaseDC(0, DC);
  end;
end;

procedure TfrStandardControlsFrame.InitializeStringGrid;
var
  I, J: Integer;
begin
  for I := 1 to StringGrid.RowCount - 1 do
  begin
    StringGrid.Cells[0, I] := IntToStr(I);
    for J := 1 to StringGrid.ColCount - 1 do
    begin
      StringGrid.Cells[J, 0] := IntToStr(J);
      StringGrid.Cells[J, I] := IntToStr(I * J);
    end;
  end;
end;

function TfrStandardControlsFrame.CreateReportLink(
  AComponentPrinter: TdxComponentPrinter): TBasedxReportLink;
var
  ACompositionLink: TdxCompositionReportLink;
begin
  FStringGridReportLink := AComponentPrinter.AddLink(StringGrid);
  FStringGridReportLink.Caption := 'StringGrid Report';
  FCheckListBoxReportLink := AComponentPrinter.AddLink(CountryCodeList);
  FCheckListBoxReportLink.Caption := 'CheckListBox Report';
  FListBoxReportLink := TdxListBoxReportLink(AComponentPrinter.AddEmptyLink(TdxListBoxReportLink));
  FListBoxReportLink.Component := FontsList;
  FListBoxReportLink.TransparentGraphics := True;
  FListBoxReportLink.PaintItemsGraphics := True;
  FListBoxReportLink.Caption := 'ListBox Report';

  FDrawGridReportLink := TdxDrawGridReportLink(AComponentPrinter.AddEmptyLink(TdxDrawGridReportLink));
  FDrawGridReportLink.OnCustomDrawCell := DrawGridCustomDrawCell;
  FDrawGridReportLink.SupportedCustomDraw := True;
  FDrawGridReportLink.Component := DrawGrid;
  FDrawGridReportLink.Caption := 'DrawGrid Report';

  ACompositionLink := AComponentPrinter.AddComposition;
  ACompositionLink.Items.AddLink(FStringGridReportLink);
  ACompositionLink.Items.AddLink(FCheckListBoxReportLink);
  ACompositionLink.Items.AddLink(FDrawGridReportLink);
  ACompositionLink.Items.AddLink(FListBoxReportLink);
  ACompositionLink.IsCurrentLink := True;
  Result := ACompositionLink;
end;

function TfrStandardControlsFrame.GetReportLinkComponent: TComponent;
begin
  Result := nil;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSStandardControlsFrameInfo.Create);

end.
