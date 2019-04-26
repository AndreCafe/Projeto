unit ncMyImage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCore, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, 
  Menus, StdCtrls, cxButtons, ImgList,
  cxLabel, ExtCtrls;

type

  TcxMyAlphaBitmap = class (TcxAlphaBitmap)
    function IsColorTransparent(const AColor: TRGBQuad): Boolean;
    procedure MyTransform;
  end;

  TMyImage = class(TcxControl)
  private
    procedure SetImageIndex(const Value: Integer);
    procedure SetImageList(const Value: TcxImageList);
    procedure SetMouseDownDrawMode(const Value: TcxImageDrawMode);
    procedure SetMouseOffDrawMode(const Value: TcxImageDrawMode);
    procedure SetMouseOverDrawMode(const Value: TcxImageDrawMode);
    procedure SetColorize(const Value: Boolean);
  protected
    FColorize: Boolean;
    FHot: Boolean;
    FMouseDown: Boolean;
    FMouseOverDrawMode: TcxImageDrawMode;
    FMouseOffDrawMode: TcxImageDrawMode;
    FMouseDownDrawMode: TcxImageDrawMode;
    FImageList : TcxImageList;
    FImageIndex : Integer;
    procedure MouseEnter(AControl: TControl); override;
    procedure MouseLeave(AControl: TControl); override;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    
  
    procedure Paint; override;
  public
    constructor Create(ASelf: TComponent); override;
  published
    property Align;
    property ParentColor;
    property OnClick;
    property Enabled;
    property Visible;

    property MouseOverDrawMode: TcxImageDrawMode
      read FMouseOverDrawMode write SetMouseOverDrawMode;

    property MouseOffDrawMode: TcxImageDrawMode
      read FMouseOffDrawMode write SetMouseOffDrawMode;
      
    property MouseDownDrawMode: TcxImageDrawMode
      read FMouseDownDrawMode write SetMouseDownDrawMode;
    
    property ImageList: TcxImageList
      read FImageList write SetImageList;

    property ImageIndex: Integer
      read FImageIndex write SetImageIndex;

    property Colorize: Boolean
      read FColorize write SetColorize;  
  end;

  procedure Register;


implementation

var  
  DrawBitmap, ImageBitmap, MaskBitmap: TcxAlphaBitmap;
  cxNullPoint: TPoint;
  cxNullSize: TSize;

procedure cxBitmapInit(var ABitmap: TcxAlphaBitmap; AWidth, AHeight: Integer);
begin
  if ABitmap = nil then
    ABitmap := TcxAlphaBitmap.CreateSize(AWidth, AHeight, True)
  else
    ABitmap.RefreshImage(AWidth, AHeight);
end;

function GetDrawBitmap(AWidth, AHeight: Integer): TcxAlphaBitmap;
begin
  cxBitmapInit(DrawBitmap, AWidth, AHeight);
  Result := DrawBitmap;
end;

function cxRectWidth(const R: TRect): Integer;
begin
  Result := R.Right - R.Left;
end;

function cxRectHeight(const R: TRect): Integer;
begin
  Result := R.Bottom - R.Top;
end;

function cxSizeIsEqual(const S1, S2: TSize): Boolean;
begin
  Result := (S1.cx = S2.cx) and (S1.cy = S2.cy);
end;


procedure myDrawImage(ADC: THandle; AGlyphRect, ABackgroundRect: TRect; AGlyph: TBitmap;
  AImages: TCustomImageList; AImageIndex: Integer; ADrawMode: TcxImageDrawMode;
  ASmoothImage: Boolean = False; ABrush: THandle = 0;
  ATransparentColor: TColor = clNone; AUseLeftBottomPixelAsTransparent: Boolean = True);

  procedure DrawBackGround(ABitmap: TcxAlphaBitmap);
  begin
    if ABrush = 0 then
      cxBitBlt(ABitmap.Canvas.Handle, ADC, ABitmap.ClientRect, ABackgroundRect.TopLeft, SRCCOPY)
    else
      FillRect(ABitmap.Canvas.Handle, ABitmap.ClientRect, ABrush);
  end;

  procedure DrawImage(ABitmap: TcxAlphaBitmap; ADrawMode: TcxImageDrawMode);
  const
    AImageShadowSize = 2;
  var
    AImageBitmap, AMaskBitmap: TcxAlphaBitmap;
    AConstantAlpha: Byte;
    AIsAlphaUsed: Boolean;
  begin
    OffsetRect(AGlyphRect, -ABackgroundRect.Left, -ABackgroundRect.Top);
    if not Assigned(CustomDrawImageProc) or not CustomDrawImageProc(ABitmap.Canvas, AImages, AImageIndex, AGlyph, AGlyphRect, ADrawMode) then
    begin
      cxPrepareBitmapForDrawing(AGlyph, AImages, AImageIndex, AUseLeftBottomPixelAsTransparent, ATransparentColor, AImageBitmap, AMaskBitmap, AIsAlphaUsed);
      AConstantAlpha := $FF;

      TcxMyAlphaBitmap(aImageBitmap).MyTransform;
      AImageBitmap.AlphaBlend(ABitmap, AGlyphRect, ASmoothImage, AConstantAlpha);
    end;
  end;

var
  ADrawBitmap: TcxAlphaBitmap;
  AImageSize: TSize;
begin
  if not (IsGlyphAssigned(AGlyph) or IsImageAssigned(AImages, AImageIndex)) then
    Exit;
    
  AImageSize := dxGetImageSize(AGlyph, AImages, AImageIndex);
  if cxSizeIsEqual(AImageSize, cxNullSize) then Exit;
  AGlyphRect := cxGetImageRect(AGlyphRect, AImageSize, ifmNormal);
  

  ADrawBitmap := GetDrawBitmap(cxRectWidth(ABackgroundRect), cxRectHeight(ABackgroundRect));
  DrawBackGround(ADrawBitmap);
  DrawImage(ADrawBitmap, ADrawMode);
  cxDrawBitmap(ADC, ADrawBitmap, ABackgroundRect, cxNullPoint);
end;

constructor TMyImage.Create(ASelf: TComponent);
begin
  inherited;
  FocusOnClick := False;
  FMouseDownDrawMode := idmGrayScale;
  FMouseOverDrawMode := idmNormal;
  FMouseOffDrawMode := idmFaded;
  FMouseDown := False;
  FHot := False;
  FImageIndex := -1;
  FImageList := nil;
end;

procedure TMyImage.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  FMouseDown := True;
  Invalidate;
  Update;
end;

procedure TMyImage.MouseEnter(AControl: TControl);
begin
  inherited;
  FHot := True;
  Invalidate;
  Update;
end;

procedure TMyImage.MouseLeave(AControl: TControl);
begin
  inherited;
  FMouseDown := False;
  FHot := False;
  Invalidate;
  Update;
end;

procedure TMyImage.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  FMouseDown := False;
  Invalidate;
  Update;
end;

procedure TMyImage.Paint;
var R: TRect;
begin
  inherited;

  if FImageList=nil then Exit;
  if (FImageIndex<0) or (FImageIndex>(FImageList.Count-1)) then Exit;
  
  R.Left := Left;
  R.Top := Top;
  R.Bottom := Left+Width-1;
  R.Right := Top+Height-1;
  R := GetBounds;
  if not Enabled then
    cxDrawImage(Canvas, R, nil, FImageList, FImageIndex, ifmNormal, idmFaded)
  else
  if FHot then begin
    if FMouseDown then
      cxDrawImage(Canvas, R, nil, FImageList, FImageIndex, ifmNormal, FMouseDownDrawMode) 
    else
    if FColorize then
      MyDrawImage(Canvas.Handle, R, R, nil, FImageList, FImageIndex, idmNormal) else
      cxDrawImage(Canvas,        R, nil, FImageList, FImageIndex, ifmNormal, FMouseOverDrawMode);
  end else
    cxDrawImage(Canvas, R, nil, FImageList, FImageIndex, ifmNormal, FMouseOffDrawMode);
end;

procedure TMyImage.SetColorize(const Value: Boolean);
begin
  FColorize := Value;
  Invalidate;
  Update;
end;

procedure TMyImage.SetImageIndex(const Value: Integer);
begin
  FImageIndex := Value;
  Invalidate;
  Update;
end;

procedure TMyImage.SetImageList(const Value: TcxImageList);
begin
  FImageList := Value;
  Invalidate;
  Update;
end;

procedure TMyImage.SetMouseDownDrawMode(const Value: TcxImageDrawMode);
begin
  FMouseDownDrawMode := Value;
  Invalidate;
  Update;
end;

procedure TMyImage.SetMouseOffDrawMode(const Value: TcxImageDrawMode);
begin
  FMouseOffDrawMode := Value;
  Invalidate;
  Update;
end;

procedure TMyImage.SetMouseOverDrawMode(const Value: TcxImageDrawMode);
begin
  FMouseOverDrawMode := Value;
  Invalidate;
  Update;
end;

procedure Register;
begin
  RegisterComponents('NexCafe', [TMyImage]);
end;


{ TcxMyAlphaBitmap }

function cxColorEssence(const AColor: TRGBQuad): DWORD; {$IFDEF DELPHI9} inline; {$ENDIF}
begin
  Result := DWORD(AColor) and $00FFFFFF;
end;

function TcxMyAlphaBitmap.IsColorTransparent(const AColor: TRGBQuad): Boolean;

  function IsTransparentPixel(AColor: DWORD): Boolean;
  begin
    Result := TransparentPixels.IndexOf(Pointer(AColor)) <> -1;
  end;

begin
  Result := cxColorIsEqual(AColor, TransparentBkColor) or IsTransparentPixel(cxColorEssence(AColor));
end;

procedure TcxMyAlphaBitmap.MyTransform;
var
  AColors: TRGBColors;
  I, J: Integer;

procedure MakeBlue(var AColor: TRGBQuad);
begin
  if not IsColorTransparent(AColor) then
  begin
    AColor.rgbRed := GetRValue(clBlue);
    AColor.rgbGreen := GetGValue(clBlue);
    AColor.rgbBlue := GetBValue(clBlue);
  end;
end;
  
begin

  GetBitmapColors(AColors);

  for I := 0 to Width - 1 do
    for J := 0 to Height - 1 do
      MakeBlue(AColors[J * Width + I]);

  SetBitmapColors(AColors);
  Changed(Self);
end;

end.
