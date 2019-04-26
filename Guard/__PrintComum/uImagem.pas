unit uImagem;

interface

uses Messages, Windows, SysUtils, Classes, Contnrs,
  Controls, Forms, Menus, Graphics, StdCtrls, GraphUtil, ShellApi;

type

  TImagem = class(TGraphicControl)
  private
    FBitmap: TBitmap;
    FOnProgress: TProgressEvent;
    FStretch: Boolean;
    FCenter: Boolean;
    FIncrementalDisplay: Boolean;
    FTransparent: Boolean;
    FDrawing: Boolean;
    FProportional: Boolean;
    function GetCanvas: TCanvas;
    procedure PictureChanged(Sender: TObject);
    procedure SetCenter(Value: Boolean);
    procedure SetBitmap(Value: TBitmap);
    procedure SetStretch(Value: Boolean);
    procedure SetTransparent(Value: Boolean);
    procedure SetProportional(Value: Boolean);
  protected
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    function DestRect: TRect;
    function DoPaletteChange: Boolean;
    function getPageNum: integer;
    function GetPalette: HPALETTE; override;
    procedure Paint; override;
    procedure Progress(Sender: TObject; Stage: TProgressStage;
      PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string); dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Canvas: TCanvas read GetCanvas;
    property PageNum : integer read getPageNum;
  published
    property Align;
    property Anchors;
    property AutoSize;
    property Center: Boolean read FCenter write SetCenter default False;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property IncrementalDisplay: Boolean read FIncrementalDisplay write FIncrementalDisplay default False;
    property ParentShowHint;
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property PopupMenu;
    property Proportional: Boolean read FProportional write SetProportional default false;
    property ShowHint;
    property Stretch: Boolean read FStretch write SetStretch default False;
    property Transparent: Boolean read FTransparent write SetTransparent default False;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
    property OnStartDock;
    property OnStartDrag;
  end;

implementation

uses Consts, Dialogs, Themes, Math, UxTheme, DwmApi, uPrintManBaseClasses;

{ TImagem }

constructor TImagem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable, csPannable];
  FBitmap := nil;
  Height := 105;
  Width := 105;
end;

destructor TImagem.Destroy;
begin
  inherited Destroy;
end;

function TImagem.GetPalette: HPALETTE;
begin
  Result := 0;
  if FBitmap <> nil then
    Result := FBitmap.Palette;
end;

function TImagem.DestRect: TRect;
var
  w, h, cw, ch: Integer;
  xyaspect: Double;
begin
  w := FBitmap.Width;
  h := FBitmap.Height;
  cw := ClientWidth;
  ch := ClientHeight;
  if Stretch or (Proportional and ((w > cw) or (h > ch))) then
  begin
    if Proportional and (w > 0) and (h > 0) then
    begin
      xyaspect := w / h;
      if w > h then
      begin
        w := cw;
        h := Trunc(cw / xyaspect);
        if h > ch then  // woops, too big
        begin
          h := ch;
          w := Trunc(ch * xyaspect);
        end;
      end
      else
      begin
        h := ch;
        w := Trunc(ch * xyaspect);
        if w > cw then  // woops, too big
        begin
          w := cw;
          h := Trunc(cw / xyaspect);
        end;
      end;
    end
    else
    begin
      w := cw;
      h := ch;
    end;
  end;

  with Result do
  begin
    Left := 0;
    Top := 0;
    Right := w;
    Bottom := h;
  end;

  if Center then
    OffsetRect(Result, (cw - w) div 2, (ch - h) div 2);
end;

procedure TImagem.Paint;

  procedure DoBufferedPaint(Canvas: TCanvas);
  var
    MemDC: HDC;
    Rect: TRect;
    PaintBuffer: HPAINTBUFFER;
  begin
    Rect := DestRect;
    PaintBuffer := BeginBufferedPaint(Canvas.Handle, Rect, BPBF_TOPDOWNDIB, nil, MemDC);
    try
      Canvas.Handle := MemDC;
      Canvas.StretchDraw(DestRect, FBitmap);
      BufferedPaintMakeOpaque(PaintBuffer, @Rect);
    finally
      EndBufferedPaint(PaintBuffer, True);
    end;
  end;

var
  Save: Boolean;
  LForm: TCustomForm;
  PaintOnGlass: Boolean;
begin
  if csDesigning in ComponentState then
    with inherited Canvas do
    begin
      Pen.Style := psDash;
      Brush.Style := bsClear;
      Rectangle(0, 0, Width, Height);
    end;
  Save := FDrawing;
  FDrawing := True;
  try
    PaintOnGlass := DwmCompositionEnabled and not (csDesigning in ComponentState);
    if PaintOnGlass then
    begin
      LForm := GetParentForm(Self);
      PaintOnGlass := (LForm <> nil) and LForm.GlassFrame.FrameExtended and
        LForm.GlassFrame.IntersectsControl(Self);
    end;

    if PaintOnGlass then
      DoBufferedPaint(inherited Canvas)
    else
      with inherited Canvas do
        StretchDraw(DestRect, FBitmap);
  finally
    FDrawing := Save;
  end;
end;

function TImagem.DoPaletteChange: Boolean;
var
  ParentForm: TCustomForm;
  Tmp: TGraphic;
begin
  Result := False;
  Tmp := FBitmap;
  if Visible and (not (csLoading in ComponentState)) and (Tmp <> nil) and
    (Tmp.PaletteModified) then
  begin
    if (Tmp.Palette = 0) then
      Tmp.PaletteModified := False
    else
    begin
      ParentForm := GetParentForm(Self);
      if Assigned(ParentForm) and ParentForm.Active and Parentform.HandleAllocated then
      begin
        if FDrawing then
          ParentForm.Perform(wm_QueryNewPalette, 0, 0)
        else
          PostMessage(ParentForm.Handle, wm_QueryNewPalette, 0, 0);
        Result := True;
        Tmp.PaletteModified := False;
      end;
    end;
  end;
end;

procedure TImagem.Progress(Sender: TObject; Stage: TProgressStage;
  PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
begin
  if FIncrementalDisplay and RedrawNow then
  begin
    if DoPaletteChange then Update
    else Paint;
  end;
  if Assigned(FOnProgress) then FOnProgress(Sender, Stage, PercentDone, RedrawNow, R, Msg);
end;

function TImagem.GetCanvas: TCanvas;
begin
  Result := nil;
  if FBitmap <> nil then
    Result := FBitmap.Canvas;
end;

function TImagem.getPageNum: integer;
begin
    result := TImagemPanel(owner).PageNum;
end;

procedure TImagem.SetCenter(Value: Boolean);
begin
  if FCenter <> Value then
  begin
    FCenter := Value;
    PictureChanged(Self);
  end;
end;

procedure TImagem.SetBitmap(Value: TBitmap);
begin
  if FBitmap <> Value then
  begin
    FBitmap := Value;
    if FBitmap<>nil then
        PictureChanged(Self);
  end;
end;

procedure TImagem.SetStretch(Value: Boolean);
begin
  if Value <> FStretch then
  begin
    FStretch := Value;
    PictureChanged(Self);
  end;
end;

procedure TImagem.SetTransparent(Value: Boolean);
begin
  if Value <> FTransparent then
  begin
    FTransparent := Value;
    PictureChanged(Self);
  end;
end;

procedure TImagem.SetProportional(Value: Boolean);
begin
  if FProportional <> Value then
  begin
    FProportional := Value;
    PictureChanged(Self);
  end;
end;

procedure TImagem.PictureChanged(Sender: TObject);
var
  G: TGraphic;
  D : TRect;
begin
  if AutoSize and (FBitmap.Width > 0) and (FBitmap.Height > 0) then
	SetBounds(Left, Top, FBitmap.Width, FBitmap.Height);
  G := FBitmap;
  if G <> nil then
  begin
    G.Transparent := FTransparent;
    D := DestRect;
    if (not G.Transparent) and (D.Left <= 0) and (D.Top <= 0) and
       (D.Right >= Width) and (D.Bottom >= Height) then
      ControlStyle := ControlStyle + [csOpaque]
    else  // picture might not cover entire clientrect
      ControlStyle := ControlStyle - [csOpaque];
    if DoPaletteChange and FDrawing then Update;
  end
  else ControlStyle := ControlStyle - [csOpaque];
  if not FDrawing then Invalidate;
end;

function TImagem.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
  if not (csDesigning in ComponentState) or (FBitmap.Width > 0) and
    (FBitmap.Height > 0) then
  begin
    if Align in [alNone, alLeft, alRight] then
      NewWidth := FBitmap.Width;
    if Align in [alNone, alTop, alBottom] then
      NewHeight := FBitmap.Height;
  end;
end;


end.
