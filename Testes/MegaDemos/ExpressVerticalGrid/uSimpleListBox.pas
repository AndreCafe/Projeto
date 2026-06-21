unit uSimpleListBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, dxPSCore, dxPSLbxLnk, ImgList, dxPSGlbl;

type
  TfrmSimpleListbox = class(TdxFrame)
    ListBox: TListBox;
    FontImages: TImageList;
    procedure ListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
  private
    TtfBitmap, DevBitmap, SysBitmap : TBitmap;
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    function GetPrintableComponent: TComponent; override;
    procedure PrepareLink(AReportLink: TBasedxReportLink); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, dxOperationTypes, uStrsConst;

{$R *.dfm}

var
  ABitmapForm: TfrmSimpleListbox;

function EnumFontFamProc(var LogFont : TLogFont; var TextMetric : TTextMetric;
  FontType : Integer; Data : Pointer) : Integer; stdcall;
begin
  case FontType of
    TRUETYPE_FONTTYPE : TStrings(Data).AddObject(LogFont.lfFaceName, Pointer(ABitmapForm.TtfBitmap));
    RASTER_FONTTYPE : TStrings(Data).AddObject(LogFont.lfFaceName, Pointer(ABitmapForm.SysBitmap));
    DEVICE_FONTTYPE : TStrings(Data).AddObject(LogFont.lfFaceName, Pointer(ABitmapForm.DevBitmap));
  end;
  Result := 1;
end;

constructor TfrmSimpleListbox.Create(AOwner: TComponent);
var
  DC: HDC;
begin
  inherited Create(AOwner);

  ABitmapForm := self;

  TtfBitmap := TBitmap.Create;
  FontImages.GetBitmap(0, TtfBitmap);
  DevBitmap := TBitmap.Create;
  FontImages.GetBitmap(2, DevBitmap);
  SysBitmap := TBitmap.Create;
  FontImages.GetBitmap(1, SysBitmap);

  DC := GetDC(0);
  try
    EnumFontFamilies(DC, nil, @EnumFontFamProc, Integer(ListBox.Items));
  finally
    ReleaseDC(0, DC);
  end;
end;

destructor TfrmSimpleListbox.Destroy;
begin
  TtfBitmap.Free;
  DevBitmap.Free;
  SysBitmap.Free;
  inherited Destroy;
end;

procedure TfrmSimpleListbox.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
end;

procedure TfrmSimpleListbox.AddOperations;
begin
  inherited;
  with Operations do
  begin
    AddOperation(otPrintStyles, nil);
    AddOperation(otDefinePrintStyles, nil);
    AddOperation(otPrintPreview, nil);
    AddOperation(otPrint, nil);
    AddOperation(otStyles, nil);
  end;
end;

function TfrmSimpleListbox.GetPrintableComponent: TComponent;
begin
  Result := ListBox;
end;

procedure TfrmSimpleListbox.PrepareLink(AReportLink: TBasedxReportLink);
begin
  inherited;
  TdxListBoxReportLink(AReportLink).AutoWidth := True;
  TdxListBoxReportLink(AReportLink).PaintItemsGraphics := True;
end;

procedure TfrmSimpleListbox.ListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Offset : Integer;
  ABitmap : TBitmap;
begin
  with TListBox(Control), Canvas do
  begin
    FillRect(Rect);
    Offset := 2;
    ABitmap := TBitmap(Items.Objects[Index]);
    if Assigned(ABitmap) then
    begin
      BrushCopy(Classes.Bounds(Rect.Left, Rect.Top, ABitmap.Width, ABitmap.Height), 
        ABitmap, Classes.Rect(0, 0, ABitmap.Width, ABitmap.Height), 
        ABitmap.Canvas.Pixels[0, 0]);
      Offset := ABitmap.Width + 6;
    end;
    TextOut(Rect.Left + Offset, Rect.Top, Items.Strings[Index]);
  end;
end;

initialization
  dxFrameManager.RegisterFrame(StandardControlSimpleListBoxIndex, TfrmSimpleListbox,
    StandardControlsSimpleListBoxName, StandardControlsSimpleListBoxImageIndex, 
    StandardControlsSimpleListBoxImageIndex, StandardControlsGroupIndex);

end.
