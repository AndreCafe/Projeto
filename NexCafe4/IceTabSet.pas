{
  IceTabSet v1.0.1
  Developed by Norbert Mereg
    (Thanks for Stefan Ascher (TMDTabSet))


  Description:
    This component is a 'Google Chrome style' TTabSet component for Delphi.

  Required:
    - Delphi GDI+ API (http://www.progdigy.com/files/gdiplus.zip)

  Features:
    - Show icon in tab items
    - Gradient color tab and component background
    - Close icon in tab
    - Rounded tab edges
    - Scrollable, if have more item
    - TabItems has a Modified property


  History:
    v1.0.1  2010.07.14:
      - Bug fixed: Icon draw problem, when a foreground window goes to hide.


    v1.0.0  2010.06.14 - First release.
}

unit IceTabSet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ImgList, GDIPAPI, GDIPOBJ;

const
  DEF_DOWNCOLOR = 198 or (190 shl 8) or (239 shl 16);
  DEF_DOWNBORDER = 126 or (106 shl 8) or (218 shl 16);

type
  TIceTab = class(TCollectionItem)
  private
    fCaption: TCaption;
    fSelected: boolean;
    fData: TObject;
    fModified: boolean;
    fImageIndex: TImageIndex;
    procedure SetSelected(Value: boolean);
    procedure SetModified(Value: boolean);
    procedure DoChange;
    procedure SetCaption(Value: TCaption);
    procedure SetImageIndex(Value: TImageIndex);
  protected
    fStartPos: integer;
    fSize: integer;
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    property Data: TObject read fData write fData;
  published
    property Caption: TCaption read fCaption write SetCaption;
    property Selected: boolean read fSelected write SetSelected;
    property Modified: boolean read fmodified write SetModified;
    property ImageIndex: TImageIndex read fImageIndex write SetImageIndex default -1;
  end;

  TIceTabList = class(TOwnedCollection)
  protected
    procedure DoSelected(ATab: TIceTab; ASelected: boolean); dynamic;
    procedure DoChanged(ATab: TIceTab); dynamic;
    procedure SetItem(Index: Integer; Value: TIceTab);
    function GetItem(Index: Integer): TIceTab;
  public
    function IndexOf(ATab: TIceTab): integer;
    property Items[Index: Integer]: TIceTab read GetItem write SetItem; default;
  end;

  TScrollButton = (sbLeft, sbRight);

  TScrollButtonClickEvent = procedure(Sender: TObject; const AButton: TScrollButton) of object;

  TIceTabScroller = class(TCustomControl)
  private
    fOnClick: TScrollButtonClickEvent;
    fCurrent: TScrollButton;
    fDown: boolean;
    fPressed: boolean;
    fWidth: integer;
    fHeight: integer;
    fPosition: integer;
    fMin: integer;
    fMax: integer;
    fChange: integer;
    fDownColor: TColor;
    fDownBorder: TColor;
    FArrowColor: TColor;
    function CanScrollLeft: Boolean;
    function CanScrollRight: Boolean;
    procedure DoMouseDown(const X: Integer);
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetPosition(Value: Integer);
    procedure SetDownColor(Value: TColor);
    procedure SetDownBorder(Value: TColor);
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure DrawRightArrow(Canvas: TCanvas; X, Y: integer;
      Button: TScrollButton; State: boolean);
    procedure DrawLeftArrow(Canvas: TCanvas; X, Y: integer;
      Button: TScrollButton; State: boolean);
    procedure SetArrowColor(const Value: TColor);
  protected
    procedure Paint; override;
    procedure DoOnClick(const AButton: TScrollButton); dynamic;
  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DownColor: TColor read fDownColor write SetDownColor default DEF_DOWNCOLOR;
    property DownBorder: TColor read fDownBorder write SetDownBorder default DEF_DOWNBORDER;
    property ArrowColor: TColor read FArrowColor write SetArrowColor;

    property Min: Longint read fMin write SetMin default 0;
    property Max: Longint read fMax write SetMax default 0;
    property Position: Longint read fPosition write SetPosition default 0;
    property Change: Integer read fChange write fChange default 1;
    property OnClick: TScrollButtonClickEvent read fOnClick write fOnClick;
  end;

  TBeforeShowPopupMenuEvent = procedure(Sender: TObject; ATab: TIceTab; MousePos: TPoint) of object;

  TTabSelectedEvent = procedure(Sender: TObject; ATab: TIceTab; ASelected: boolean) of object;
  TTabCloseEvent = procedure(Sender: TObject; ATab: TIceTab) of object;

  TIceTabSet = class(TCustomControl)
  private
    fTabs: TIceTabList;
    fScroller: TIceTabScroller;
    fTabBorderColor: TColor;
    fListMenu: TPopupMenu;
    fFont: TFont;
    fSelectedFont: TFont;
    fFirstIndex: integer;
    fVisibleTabs: Integer;
    fTabIndex: integer;
    fMaxTabWidth: integer;
    fImages: TCustomImageList;
    fMaintainMenu: boolean;
    fOnScrollButtonClick: TScrollButtonClickEvent;
    fOnTabSelected: TTabSelectedEvent;
    FTabHeight: integer;
    FEdgeWidth: integer;
    FCloseTab: boolean;
    FTabStopColor: TColor;
    FTabStartColor: TColor;
    FSelectedTabStopColor: TColor;
    FSelectedTabStartColor: TColor;
    FModifiedTabStopColor: TColor;
    FModifiedTabStartColor: TColor;
    FTabCloseColor: TColor;
    FModifiedFont: TFont;
    FBackgroundStopColor: TColor;
    FBackgroundStartColor: TColor;
    FOnBeforeShowPopupMenu: TBeforeShowPopupMenuEvent;
    FOnTabClose: TTabCloseEvent;
    FHighlightTabClose: TIceTab;
    FArrowColor: TColor;

    procedure CreateScoller;
    procedure Scroller_Click(Sender: TObject; const AButton: TScrollButton);
    function GetTabHeight: integer;
    procedure SetTabIndex(Value: Integer); overload;
    procedure SetTabIndex(NewTab: TIceTab); overload;
    function CalcTabPositions(Start, Stop: Integer; Canvas: TCanvas;
      First: Integer): Integer;

    function GetSelected: TIceTab;
    procedure SetSelected(Value: TIceTab);
    procedure SetFont(Value: TFont);
    procedure SetSelectedFont(Value: TFont);
    procedure SetTabBorderColor(Value: TColor);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure SetMaxTabWidth(Value: integer);
    procedure SetTabHeight(const Value: integer);
    function GetGDIPFont(Canvas: TCanvas; Font: TFont): TGPFont;
    function GetTextSize(Canvas: TCanvas; Font: TGPFont; Text: string): TSize;
    procedure SetEdgeWidth(const Value: integer);
    procedure SetCloseTab(const Value: boolean);
    function GetItemFromPos(X, Y: integer): TIceTab;
    procedure SetTabStartColor(const Value: TColor);
    procedure SetTabStopColor(const Value: TColor);
    procedure SetSelectedTabStartColor(const Value: TColor);
    procedure SetSelectedTabStopColor(const Value: TColor);
    procedure SetModifiedTabStartColor(const Value: TColor);
    procedure SetModifiedTabStopColor(const Value: TColor);
    procedure SetTabCloseColor(const Value: TColor);
    procedure SetModifiedFont(const Value: TFont);
    procedure SetBackgroundStartColor(const Value: TColor);
    procedure SetBackgroundStopColor(const Value: TColor);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetOnBeforeShowPopupMenu(const Value: TBeforeShowPopupMenuEvent);
    function IsInCloseButton(ATab: TIceTab; X, Y: integer): boolean;
    procedure SetOnTabClose(const Value: TTabCloseEvent);
    procedure SetHighlightTabClose(const Value: TIceTab);
    procedure ClearSelection;
    procedure InnerDraw(Canvas: TCanvas; TabRect: TRect; Item: TIceTab);
    procedure SetArrowColor(const Value: TColor);
  protected
    property HighlightTabClose: TIceTab read FHighlightTabClose write SetHighlightTabClose;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;

    procedure ShowRightPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);

    procedure DoOnScrollButtonClick(const AButton: TScrollButton); dynamic;
    procedure TabSelected(ATab: TIceTab; ASelected: boolean); dynamic;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

    procedure MouseMove(Shift: TShiftState; X: Integer; Y: Integer); override;
    procedure CMHintShow(var Message: TCMHintShow); message CM_HINTSHOW;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X: Integer;
      Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetButtonRect(const AButton: TScrollButton): TRect;

    function AddTab(const ACaption: string; const ImageIndex: integer = -1; const Data: TObject = nil): TIceTab;
    function RemoveTab(ATab: TIceTab): integer;
    procedure SelectNext(ANext: boolean);
    function IndexOfTabData(Data: TObject): integer;

    property Selected: TIceTab read GetSelected write SetSelected;
  published
    property Align;
    property Anchors;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Visible;

    property Font: TFont read fFont write SetFont;
    property SelectedFont: TFont read fSelectedFont write SetSelectedFont;
    property ModifiedFont: TFont read FModifiedFont write SetModifiedFont;
    property Tabs: TIceTabList read fTabs write fTabs;
    property TabIndex: integer read fTabIndex write SetTabIndex default -1;
    property TabBorderColor: TColor read fTabBorderColor write SetTabBorderColor default $00706453;
    property ListMenu: TPopupMenu read fListMenu write fListMenu;
    property Images: TCustomImageList read fImages write SetImages;
    property MaintainMenu: boolean read fMaintainMenu write fMaintainMenu;
    property MaxTabWidth: integer read fMaxTabWidth write SetMaxTabWidth default 0;
    property TabHeight: integer read FTabHeight write SetTabHeight default 24;
    property EdgeWidth: integer read FEdgeWidth write SetEdgeWidth default 20;
    property CloseTab: boolean read FCloseTab write SetCloseTab default true;
    property TabCloseColor: TColor read FTabCloseColor write SetTabCloseColor default $00B8AFA9;
    property ArrowColor: TColor read FArrowColor write SetArrowColor default clBlack;

    property TabStartColor: TColor read FTabStartColor write SetTabStartColor default $00A19078;
    property TabStopColor: TColor read FTabStopColor write SetTabStopColor default $00A19078;

    property SelectedTabStartColor: TColor read FSelectedTabStartColor write SetSelectedTabStartColor default $00FBF9F7;
    property SelectedTabStopColor: TColor read FSelectedTabStopColor write SetSelectedTabStopColor default $00EAE6E1;

    property ModifiedTabStartColor: TColor read FModifiedTabStartColor write SetModifiedTabStartColor;
    property ModifiedTabStopColor: TColor read FModifiedTabStopColor write SetModifiedTabStopColor;

    property BackgroundStartColor: TColor read FBackgroundStartColor write SetBackgroundStartColor default $00C8BDB0;
    property BackgroundStopColor: TColor read FBackgroundStopColor write SetBackgroundStopColor default $00C8BDB0;

    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;

    property OnScrollButtonClick: TScrollButtonClickEvent read fOnScrollButtonClick write fOnScrollButtonClick;
    property OnTabSelected: TTabSelectedEvent read fOnTabSelected write fOnTabSelected;
    property OnBeforeShowPopupMenu: TBeforeShowPopupMenuEvent read FOnBeforeShowPopupMenu write SetOnBeforeShowPopupMenu;
    property OnTabClose: TTabCloseEvent read FOnTabClose write SetOnTabClose;
  end;

procedure Register;

implementation

uses
  CommCtrl, Consts, Math;

const
  BMP_SIZE = 12;
  BTN_MARGIN = 2;
  BTN_SIZE = BMP_SIZE + BTN_MARGIN * 2;

procedure Register;
begin
  RegisterComponents('IcePackage', [TIceTabSet]);
end;

function MakeGDIPColor(C: TColor): Cardinal;
var
  tmpRGB : TColorRef;
begin
  tmpRGB := ColorToRGB(C);
  result := ((DWORD(GetBValue(tmpRGB)) shl  BlueShift) or
             (DWORD(GetGValue(tmpRGB)) shl GreenShift) or
             (DWORD(GetRValue(tmpRGB)) shl   RedShift) or
             (DWORD(255) shl AlphaShift));
end;

{ TIceTabScroller }

constructor TIceTabScroller.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csOpaque];
  fWidth := BTN_SIZE * 2 + 1;
  fHeight := BTN_SIZE;
  fMin := 0;
  fMax := 0;
  fPosition := 0;
  fChange := 1;
  fArrowColor := clBlack;
  fDownColor := DEF_DOWNCOLOR;
  fDownBorder := DEF_DOWNBORDER;
end;

destructor TIceTabScroller.Destroy;
begin
  inherited;
end;

procedure TIceTabScroller.Paint;
const
  DWN: array[Boolean] of Integer = (0, 4);

var
  ParRect: TRect;
  P: TPoint;
begin
  if (Parent <> nil) and Parent.HandleAllocated then
    InvalidateRect(Parent.Handle, @Rect, True);

  with Canvas do
  begin
    // Draw parent background
    P := ClientToParent(ClientRect.TopLeft);
    ParRect := Rect(P, Point(P.X + ClientRect.Right - ClientRect.Left, P.Y + ClientRect.Bottom - ClientRect.Top));
    Canvas.CopyRect(ClientRect, TIceTabSet(Parent).Canvas, ParRect);

    // Left
    if (fCurrent = sbLeft) and fDown then begin
      Brush.Color := fDownColor;
      Canvas.Rectangle(0, 0, BTN_SIZE, BTN_SIZE);
    end;
    if CanScrollLeft then
      DrawLeftArrow(Canvas, BTN_MARGIN, BTN_MARGIN, sbLeft, CanScrollLeft);

    // Right
    if (fCurrent = sbRight) and fDown then begin
      Brush.Color := fDownColor;
      Canvas.Rectangle(BTN_SIZE, 0, BTN_SIZE * 2, BTN_SIZE);
    end;
    if CanScrollRight then
      DrawRightArrow(Canvas, BTN_SIZE + BTN_MARGIN, BTN_MARGIN, sbRight, CanScrollRight);
  end;
end;

procedure TIceTabScroller.DrawRightArrow(Canvas: TCanvas; X, Y: integer; Button: TScrollButton; State: boolean);
var
  graphics: TGPGraphics;
  path: TGPGraphicsPath;
  brush: TGPSolidBrush;
  innerRect: TRect;
begin
  graphics := TGPGraphics.Create(Canvas.Handle);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);

  path := TGPGraphicsPath.Create();
  innerRect := Rect(X + 2, Y + 2, X + 2 + 6, Y + 2 + 8);
  path.AddLine(innerRect.Left, innerRect.Top, InnerRect.Right, InnerRect.Top + 4);
  path.AddLine(innerRect.Right, innerRect.Top + 4, InnerRect.Left, InnerRect.Bottom);
  path.AddLine(innerRect.Left, innerRect.Bottom, InnerRect.Left, InnerRect.Top);

  brush:= TGPSolidBrush.Create(MakeGDIPColor(clBlack));
  graphics.FillPath(brush, path);

  brush.Free;
  path.Free;
  graphics.Free;
end;

procedure TIceTabScroller.DrawLeftArrow(Canvas: TCanvas; X, Y: integer; Button: TScrollButton; State: boolean);
var
  graphics: TGPGraphics;
  path: TGPGraphicsPath;
  brush: TGPSolidBrush;
  innerRect: TRect;
begin
  graphics := TGPGraphics.Create(Canvas.Handle);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);

  path := TGPGraphicsPath.Create();
  innerRect := Rect(X + 3, Y + 2, X + 3 + 6, Y + 2 + 8);
  path.AddLine(innerRect.Right, innerRect.Top, InnerRect.Left, InnerRect.Top + 4);
  path.AddLine(innerRect.Left, innerRect.Top + 4, InnerRect.Right, InnerRect.Bottom);
  path.AddLine(innerRect.Right, innerRect.Bottom, InnerRect.Right, InnerRect.Top);

  brush:= TGPSolidBrush.Create(MakeGDIPColor(fArrowColor));
  graphics.FillPath(brush, path);

  brush.Free;
  path.Free;
  graphics.Free;
end;


procedure TIceTabScroller.DoOnClick(const AButton: TScrollButton);
begin
  if Assigned(fOnClick) then
    fOnClick(Self, AButton);
end;

function TIceTabScroller.CanScrollLeft: Boolean;
begin
  Result := fPosition > fMin;
end;

function TIceTabScroller.CanScrollRight: Boolean;
begin
  Result := fPosition < fMax;
end;

procedure TIceTabScroller.DoMouseDown(const X: Integer);
begin
  fCurrent := TScrollButton(X div BTN_SIZE);
  case fCurrent of
    sbLeft: if not CanScrollLeft then Exit;
    sbRight: if not CanScrollRight then Exit;
  end;
  fPressed := True;
  fDown := True;
  Invalidate;
  SetCapture(Handle);
end;

procedure TIceTabScroller.WMLButtonDown(var Message: TWMLButtonDown);
begin
  DoMouseDown(Message.XPos);
end;

procedure TIceTabScroller.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  DoMouseDown(Message.XPos);
end;

procedure TIceTabScroller.WMMouseMove(var Message: TWMMouseMove);
var
  P: TPoint;
  R: TRect;
begin
  if fPressed then begin
    P := Point(Message.XPos, Message.YPos);
    R := Rect(0, 0, BTN_SIZE * Ord(fCurrent), fHeight);
    if PtInRect(R, P) <> fDown then begin
      fDown := not fDown;
      Invalidate;
    end;
  end;
end;

procedure TIceTabScroller.WMLButtonUp(var Message: TWMLButtonUp);
var
  NewPos: Longint;
begin
  ReleaseCapture;
  fPressed := False;

  if fDown then begin
    fDown := False;
    NewPos := Position;
    case fCurrent of
      sbLeft: Dec(NewPos, fChange);
      sbRight: Inc(NewPos, fChange);
    end;
    Position := NewPos;
    DoOnClick(fCurrent);
  end;
end;

procedure TIceTabScroller.WMSize(var Message: TWMSize);
begin
  inherited;
  Width := fWidth - 1;
  Height := fHeight;
end;

procedure TIceTabScroller.SetMin(Value: Integer);
begin
  if Value < fMax then
    fMin := Value;
end;

procedure TIceTabScroller.SetMax(Value: Integer);
begin
  if Value >= fMin then
    fMax := Value;
end;

procedure TIceTabScroller.SetPosition(Value: Integer);
begin
  if Value <> fPosition then begin
    if Value < Min then
      Value := Min;
    if Value > Max then
      Value := Max;
    fPosition := Value;
  end;
  Invalidate;
end;

procedure TIceTabScroller.SetDownColor(Value: TColor);
begin
  if fDownColor <> Value then begin
    fDownColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabScroller.SetArrowColor(const Value: TColor);
begin
  if FArrowColor <> Value then begin
    FArrowColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabScroller.SetDownBorder(Value: TColor);
begin
  if fDownBorder <> Value then begin
    fDownBorder := Value;
    Invalidate;
  end;
end;

{ TMDTab }

constructor TIceTab.Create(Collection: TCollection);
begin
  inherited;
  fImageIndex := -1;
end;

destructor TIceTab.Destroy;
begin
  inherited;
end;

procedure TIceTab.SetModified(Value: boolean);
begin
  if fModified <> Value then begin
    fModified := Value;
    DoChange;
  end;
end;

procedure TIceTab.SetSelected(Value: boolean);
var
  i: integer;
begin
  if fSelected <> Value then begin
    fSelected := Value;
    if fSelected then begin
      with (GetOwner as TIceTabList) do begin
        for i := 0 to Count - 1 do begin
          // Only one can be selected
          if (Items[i] <> Self) and (Items[i].Selected) then begin
            Items[i].Selected := false;
          end;
        end;
      end;
    end;
    (Collection as TIceTabList).DoSelected(Self, fSelected);
  end;
end;

function TIceTab.GetDisplayName: string;
begin
  if fCaption <> '' then
    Result := fCaption
  else
    Result := inherited GetDisplayName;
end;

procedure TIceTab.DoChange;
begin
  (Collection as TIceTabList).DoChanged(Self)
end;

procedure TIceTab.SetCaption(Value: TCaption);
begin
  if fCaption <> Value then begin
    fCaption := Value;
    DoChange;
  end;
end;

procedure TIceTab.SetImageIndex(Value: TImageIndex);
begin
  if fImageIndex <> Value then begin
    fImageIndex := Value;
    DoChange;
  end;
end;

{ TMDTabList }

procedure TIceTabList.DoSelected(ATab: TIceTab; ASelected: boolean);
begin
  (GetOwner as TIceTabSet).TabSelected(ATab, ASelected);
end;

procedure TIceTabList.DoChanged(ATab: TIceTab);
begin
  (GetOwner as TIceTabSet).Invalidate;
end;

procedure TIceTabList.SetItem(Index: Integer; Value: TIceTab);
begin
  inherited SetItem(Index, Value);
end;

function TIceTabList.GetItem(Index: Integer): TIceTab;
begin
  Result := inherited GetItem(Index) as TIceTab;
end;

function TIceTabList.IndexOf(ATab: TIceTab): integer;
var
  i, c: integer;
begin
  c := Count;
  for i := 0 to c - 1 do
    if Items[i] = ATab then begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

{ TMDTabSet }

constructor TIceTabSet.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := [csCaptureMouse, csDoubleClicks, csOpaque];
  Width := 185;
  Height := 30;
  fTabHeight := 24;
  fEdgeWidth := 20;
  fCloseTab := true;
  Align := alTop;
  FHighlightTabClose := nil;

  OnContextPopup := ShowRightPopup;

  fTabs := TIceTabList.Create(Self, TIceTab);
  fFont := TFont.Create;
  fFont.Color := clWhite;
  fModifiedFont := TFont.Create;
  fModifiedFont.Color := $00B3B3FF;
  fSelectedFont := TFont.Create;
  fSelectedFont.Color := clBlack;
  fTabBorderColor := $00706453;
  fTabCloseColor := $00B8AFA9;
  FArrowColor := clBlack;

  FBackgroundStartColor := $00C8BDB0;
  FBackgroundStopColor := $00C8BDB0;

  fTabStartColor := $00A19078;
  fTabStopColor := $00A19078;

  FSelectedTabStartColor := $00FBF9F7;
  FSelectedTabStopColor := $00EAE6E1;

  FModifiedTabStartColor := $00A19078;
  FModifiedTabStopColor := $00A19078;

  fTabIndex := -1;
  CreateScoller;
end;

destructor TIceTabSet.Destroy;
begin
  fTabs.Free;
  fFont.Free;
  fSelectedFont.Free;
  fModifiedFont.Free;
  inherited;
end;

procedure TIceTabSet.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params.WindowClass do begin
    style := style and not (CS_VREDRAW or CS_HREDRAW);
  end;
end;

procedure TIceTabSet.CreateScoller;
begin
  fScroller := TIceTabScroller.Create(Self);
  with fScroller do begin
    Parent := Self;
    ArrowColor := Self.fArrowColor;
    Top := 3;
    Min := 0;
    Max := 0;
    Position := 0;
    Visible := true;
    OnClick := Scroller_Click;
  end;
  fScroller.Top := (Height div 2) - (fScroller.fHeight div 2);
  fScroller.Left := Width - fScroller.fWidth - 1;
end;

procedure TIceTabSet.Scroller_Click(Sender: TObject; const AButton: TScrollButton);
begin
  if (AButton in [sbLeft, sbRight]) then begin
    fFirstIndex := TIceTabScroller(Sender).Position;
    Invalidate;
  end;
  DoOnScrollButtonClick(AButton);
end;

procedure TIceTabSet.DoOnScrollButtonClick(const AButton: TScrollButton);
begin
  if Assigned(fOnScrollButtonClick) then
    fOnScrollButtonClick(Self, AButton);
end;

function TIceTabSet.CalcTabPositions(Start, Stop: Integer; Canvas: TCanvas;
  First: Integer): Integer;
var
  Index: Integer;
  W: Integer;
  tw: integer;
  Tab: TIceTab;
  actFont, prevFont: TGPFont;

begin
  Index := First;
  actFont := GetGDIPFont(Canvas, fFont);
  tw := GetTextSize(Canvas, actFont, 'WOWOWOWOWOWOWOW').cx;
  actFont.Free;
  actFont := GetGDIPFont(Canvas, fSelectedFont);
  if tw > GetTextSize(Canvas, actFont, 'WOWOWOWOWOWOWOW').cx then
  begin
    actFont.Free;
    actFont := GetGDIPFont(Canvas, fFont);
  end;
  prevFont := actFont;
  actFont := GetGDIPFont(Canvas, fModifiedFont);
  if tw > GetTextSize(Canvas, actFont, 'WOWOWOWOWOWOWOW').cx then
  begin
    actFont.Free;
    actFont := prevFont;
  end
  else
    prevFont.Free;

  while (Start < Stop) and (Index < fTabs.Count) do begin
    Tab := fTabs[Index];
    Tab.fStartPos := Start;
    W := GetTextSize(Canvas, actFont, Tab.Caption).cx + fEdgeWidth * 2 + 10;
    if fCloseTab then
      Inc(W, 10);
    if Assigned(fImages) and (Tab.ImageIndex > -1) then begin
      Inc(W, fImages.Width + 4);
    end;
    if (fMaxTabWidth > 0) and (W > fMaxTabWidth) then
      W := fMaxTabWidth;

    Tab.fSize := W;
    Inc(Start, Tab.fSize - fEdgeWidth);    { next usable position }

    if Start <= Stop then begin
      Inc(Index);
    end;
  end;
  Result := Index - First;
  actFont.Free;
end;

procedure TIceTabSet.CMHintShow(var Message: TCMHintShow);
var
  Item: TIceTab;
begin
  Item := GetItemFromPos(Message.HintInfo^.CursorPos.X, Message.HintInfo^.CursorPos.Y);
  if Assigned(Item) then
    Message.HintInfo^.HintStr := Item.Caption;
end;

function TIceTabset.GetGDIPFont(Canvas: TCanvas; Font: TFont): TGPFont;
var
  style: integer;
begin
  style := FontStyleRegular;
  if fsBold in Font.Style then
    style := style + FontStyleBold;
  if fsItalic in Font.Style then
    style := style + FontStyleItalic;
  if fsUnderLine in Font.Style then
    style := style + FontStyleUnderline;
  if fsStrikeOut in Font.Style then
    style := style + FontStyleStrikeout;

  result := TGPFont.Create(Font.Name, Font.Size, style, UnitPoint);
end;

function TIceTabset.GetTextSize(Canvas: TCanvas; Font: TGPFont; Text: string): TSize;
var
  graphics: TGPGraphics;
  rect: TGPRectF;
begin
  graphics := TGPGraphics.Create(Canvas.Handle);
  graphics.MeasureString(Text, -1, Font, MakePoint(0.0, 0.0), rect);
  result.cx := Round(rect.Width);
  result.cy := Round(rect.Height);

  graphics.Free;
end;

procedure TIceTabSet.Paint;
var
  I: Integer;
  TabStart, LastTabPos: integer;
  Tab: TIceTab;
  TabHeight: integer;

  graphics: TGPGraphics;
  linGrBrush: TGPLinearGradientBrush;
begin
  if not HandleAllocated then Exit;

  graphics := TGPGraphics.Create(Canvas.Handle);

  linGrBrush := TGPLinearGradientBrush.Create(
    MakePoint(0, ClientRect.Top),
    MakePoint(0, ClientRect.Bottom),
    MakeGDIPColor(FBackgroundStartColor),
    MakeGDIPColor(FBackgroundStopColor));
  graphics.FillRectangle(linGrBrush, MakeRect(ClientRect));

  linGrBrush.Free;
  graphics.Free;

  TabStart := 0;
  LastTabPos := Width - fScroller.fWidth;
  fVisibleTabs := CalcTabPositions(TabStart, LastTabPos - fEdgeWidth, Canvas, fFirstIndex);
  TabHeight := GetTabHeight;
  fScroller.Min := 0;
  fScroller.Max := fTabs.Count - fVisibleTabs;
  fScroller.Position := fFirstIndex;
  for i := fFirstIndex + fVisibleTabs - 1 downto fFirstIndex do
  begin
    Tab := fTabs[i];
    if not Tab.Selected then
      InnerDraw(Canvas, Rect(Tab.fStartPos, ClientHeight - TabHeight, Tab.fStartPos + Tab.fSize, ClientHeight), Tab);
  end;

  for i := fFirstIndex + fVisibleTabs - 1 downto fFirstIndex do
  begin
    Tab := fTabs[i];
    if Tab.Selected then
      InnerDraw(Canvas, Rect(Tab.fStartPos, ClientHeight - TabHeight, Tab.fStartPos + Tab.fSize, ClientHeight), Tab);
  end;
end;

procedure TIceTabSet.InnerDraw(Canvas: TCanvas; TabRect: TRect; Item: TIceTab);
var
  graphics : TGPGraphics;
  Pen: TGPPen;
  path, linePath: TGPGraphicsPath;
  linGrBrush: TGPLinearGradientBrush;

  font: TGPFont;
  pointF: TGPPointF;
  solidBrush, mainBrush: TGPSolidBrush;

  rectF: TGPRectF;
  stringFormat: TGPStringFormat;
  DC: HDC;
  marginRight: integer;

  iconY, iconX: integer;
  textStart: Extended;

  startColor, EndColor, textColor, borderColor: cardinal;
begin
  DC := Canvas.Handle;

  if Item.Selected then
  begin
    startColor := MakeGDIPColor(FSelectedTabStartColor); // MakeColor(255, 247, 249, 251);
    endColor := MakeGDIPColor(FSelectedTabStopColor); // MakeColor(255, 225, 230, 234);
    textColor := MakeGDIPColor(fSelectedFont.Color); // MakeColor(255, 0, 0, 0);
  end
  else if Item.Modified then
  begin
    startColor := MakeGDIPColor(FModifiedTabStartColor);
    endColor := MakeGDIPColor(FModifiedTabStopColor);
    textColor := MakeGDIPColor(fModifiedFont.Color);
  end
  else
  begin
    startColor := MakeGDIPColor(FTabStartColor);
    endColor := MakeGDIPColor(FTabStopColor);
    textColor := MakeGDIPColor(fFont.Color); // MakeColor(255, 255, 255, 255);
  end;
  borderColor := MakeGDIPColor(fTabBorderColor); // MakeColor(255, 83, 100, 112);

  graphics := TGPGraphics.Create(DC);
  graphics.SetSmoothingMode(SmoothingModeAntiAlias);
  Pen:= TGPPen.Create(borderColor);

  path := TGPGraphicsPath.Create();
  path.AddBezier(TabRect.Left, TabRect.Bottom, TabRect.Left + fEdgeWidth / 2, TabRect.Bottom, TabRect.Left + fEdgeWidth / 2, TabRect.Top, TabRect.Left + fEdgeWidth, TabRect.Top);
  path.AddLine(TabRect.Left + fEdgeWidth, TabRect.Top, TabRect.Right - fEdgeWidth, TabRect.Top);
  path.AddBezier(TabRect.Right - fEdgeWidth, TabRect.Top, TabRect.Right - fEdgeWidth / 2, TabRect.Top, TabRect.Right - fEdgeWidth / 2, TabRect.Bottom, TabRect.Right, TabRect.Bottom);
  linePath := TGPGraphicsPath.Create();
  linePath.AddPath(path, false);
  path.AddLine(TabRect.Right, TabRect.Bottom, TabRect.Left, TabRect.Bottom);

  linGrBrush := TGPLinearGradientBrush.Create(
    MakePoint(0, TabRect.Top),
    MakePoint(0, TabRect.Bottom),
    startColor,
    endColor);

  graphics.DrawPath(pen, linePath);
  graphics.FillPath(linGrBrush, path);

  marginRight := 0;
  if fCloseTab then
  begin
    pen.SetWidth(2);
    if HighLightTabClose = Item then
      pen.SetColor(MakeGDIPColor(clRed))
    else
      pen.SetColor(MakeGDIPColor(fTabCloseColor));

    graphics.DrawLine(pen, TabRect.Right - fEdgeWidth - 7, TabRect.Top + ((TabRect.Bottom - TabRect.Top - 7) div 2),
                           TabRect.Right - fEdgeWidth, TabRect.Top + ((TabRect.Bottom - TabRect.Top + 7) div 2));

    graphics.DrawLine(pen, TabRect.Right - fEdgeWidth, TabRect.Top + ((TabRect.Bottom - TabRect.Top - 7) div 2),
                           TabRect.Right - fEdgeWidth - 7, TabRect.Top + ((TabRect.Bottom - TabRect.Top + 7) div 2));
    marginRight := 10;
  end;

  if Item.Selected then
    font := GetGDIPFont(Canvas, fSelectedFont)
  else if Item.Modified then
    font := GetGDIPFont(Canvas, fModifiedFont)
  else
    font := GetGDIPFont(Canvas, fFont);

  solidBrush:= TGPSolidBrush.Create(textColor);
  stringFormat:= TGPStringFormat.Create;
  // Center-justify each line of text.
  stringFormat.SetAlignment(StringAlignmentNear);

  // Center the block of text (top to bottom) in the rectangle.
  stringFormat.SetLineAlignment(StringAlignmentCenter);
  stringFormat.SetTrimming(StringTrimmingEllipsisCharacter);
  stringFormat.SetFormatFlags(StringFormatFlagsNoWrap);

  SelectClipRgn(Canvas.Handle, 0);
  textStart := TabRect.Left + fEdgeWidth;
  if Assigned(Images) and (Item.ImageIndex <> -1) then
  begin
    iconY := TabRect.Top + ((TabRect.Bottom - TabRect.Top - Images.Height) div 2);
    iconX := Round(textStart);
    textStart := textStart + Images.Width + 4;
  end;

  rectF := MakeRect(textStart, TabRect.Top, TabRect.Right - fEdgeWidth - marginRight, TabRect.Bottom - TabRect.Top);
  graphics.DrawString(Item.Caption, -1, font, rectF, stringFormat, solidBrush);

  mainBrush := TGPSolidBrush.Create(endColor);

  font.Free;
  solidBrush.Free;
  linGrBrush.Free;
  linePath.Free;
  path.Free;
  Pen.Free;
  graphics.Free;

  if Assigned(Images) and (Item.ImageIndex <> -1) then
    Images.Draw(Canvas, iconX, iconY, Item.ImageIndex, true);
end;

procedure TIceTabSet.SetCloseTab(const Value: boolean);
begin
  if FCloseTab <> Value then begin
    FCloseTab := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetEdgeWidth(const Value: integer);
begin
  if FEdgeWidth <> Value then begin
    FEdgeWidth := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.WMSize(var Message: TWMSize);
begin
  inherited;
  fScroller.Top := (Height div 2) - (fScroller.fHeight div 2);
  fScroller.Left := Width - fScroller.fWidth - 1;
  Invalidate;
end;

function TIceTabSet.GetButtonRect(const AButton: TScrollButton): TRect;
begin
  Result.Left := fScroller.Left + Ord(AButton) * BTN_SIZE;
  Result.Top := fScroller.Top;
  Result.Bottom := fScroller.Top + fScroller.fHeight;
  Result.Right := Result.Left + BTN_SIZE;
end;

function TIceTabSet.AddTab(const ACaption: string; const ImageIndex: integer = -1; const Data: TObject = nil): TIceTab;
begin
  Result := fTabs.Add as TIceTab;
  Result.Caption := ACaption;
  Result.Data := Data;
  Result.ImageIndex := ImageIndex;
  Invalidate;
end;

function TIceTabSet.IndexOfTabData(Data: TObject): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to fTabs.Count - 1 do
    if fTabs[I].Data = Data then begin
      Result := I;
      Exit;
    end;
end;

function TIceTabSet.RemoveTab(ATab: TIceTab): integer;
var
  s: boolean;
  i: integer;
begin
  Result := fTabs.IndexOf(ATab);
  if Result <> -1 then
  begin
    s := ATab.Selected;
    i := ATab.Index;
    fTabs.Delete(Result);
    if s then
    begin
      if (i >= 0) and (i < fTabs.Count) then
        SetTabIndex(i)
      else if i >= fTabs.Count then
        SetTabIndex(fTabs.Count - 1);
    end;
    Invalidate;
  end;
end;

procedure TIceTabSet.TabSelected(ATab: TIceTab; ASelected: boolean);
begin
  Invalidate;
  if ASelected then
    fTabIndex := ATab.Index;
  if Assigned(fOnTabSelected) then
    fOnTabSelected(Self, ATab, ASelected);
end;

procedure TIceTabSet.SetFont(Value: TFont);
begin
  fFont.Assign(Value);
  Invalidate;
end;

procedure TIceTabSet.SetHighlightTabClose(const Value: TIceTab);
begin
  if FHighlightTabClose <> Value then
  begin
    FHighlightTabClose := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetImages(const Value: TCustomImageList);
begin
  if fImages <> Value then
  begin
    fImages := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetSelectedFont(Value: TFont);
begin
  fSelectedFont.Assign(Value);
  Invalidate;
end;

procedure TIceTabSet.SetSelectedTabStartColor(const Value: TColor);
begin
  if FSelectedTabStartColor <> Value then
  begin
    FSelectedTabStartColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetSelectedTabStopColor(const Value: TColor);
begin
  if FSelectedTabStopColor <> Value then
  begin
    FSelectedTabStopColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetArrowColor(const Value: TColor);
begin
  if FArrowColor <> Value then begin
    FArrowColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetBackgroundStartColor(const Value: TColor);
begin
  if FBackgroundStartColor <> Value then begin
    FBackgroundStartColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetBackgroundStopColor(const Value: TColor);
begin
  if FBackgroundStopColor <> Value then begin
    FBackgroundStopColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Tab: TIceTab;
begin
  inherited MouseDown(Button, Shift, X, Y);

  if (Button = mbLeft) then
  begin
    Tab := GetItemFromPos(X, Y);
    if Assigned(Tab) then
      SetTabIndex(Tab);
  end;
end;

function TIceTabSet.GetItemFromPos(X, Y: integer): TIceTab;
var
  th, I, MinLeft, MaxRight: integer;
begin
  result := nil;
  th := GetTabHeight;
  if (Y <= ClientHeight) and (Y >= ClientHeight - th) then
  begin
    for I := fFirstIndex to fTabs.Count - 1 do
    begin
      MinLeft := fTabs.Items[i].fStartPos;
      MaxRight := fTabs.Items[i].fStartPos + fTabs.Items[i].fSize;
      if (X >= MinLeft) and (X <= MaxRight) then
      begin
        Result := fTabs.Items[I];
        Break;
      end;
    end;
  end;
end;

procedure TIceTabSet.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Tab: TIceTab;
begin
  inherited MouseMove(Shift, X, Y);

  Tab := GetItemFromPos(X, Y);
  if FCloseTab then
  begin
    if Assigned(Tab) and IsInCloseButton(Tab, X, Y) then
      HighlightTabClose := Tab
    else
      HighlightTabClose := nil;
  end;
end;

function TIceTabSet.IsInCloseButton(ATab: TIceTab; X, Y: integer): boolean;
var
  closeRect: TRect;
  TabRight, TabTop: integer;
begin
  TabRight := ATab.fStartPos + ATab.fSize;
  TabTop := Height - TabHeight;

  closeRect := Rect(TabRight - fEdgeWidth - 9,
                    TabTop + ((Height - TabTop - 10) div 2),
                    TabRight - fEdgeWidth + 2,
                    TabTop + ((Height - TabTop + 10) div 2));
  result := PtInRect(closeRect, Point(X, Y));

end;

procedure TIceTabSet.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  Tab: TIceTab;
begin
  inherited;

  Tab := GetItemFromPos(X, Y);
  if Assigned(Tab) and FCloseTab and IsInCloseButton(Tab, X, Y) then
  begin
    if Assigned(OnTabClose) then
      OnTabClose(Self, Tab);
  end;
end;

function TIceTabSet.GetTabHeight: integer;
begin
  Result := FTabHeight;
end;

procedure TIceTabSet.SetTabIndex(NewTab: TIceTab);
begin
  if Assigned(NewTab) then
    NewTab.Selected := true
  else
    TabIndex := -1;
end;

procedure TIceTabSet.SetTabIndex(Value: Integer);
var
  t: TIceTab;
begin
//  if fTabIndex <> Value then
  begin
    fTabIndex := Value;
    if (Value < -1) or (Value >= fTabs.Count) then
      raise Exception.CreateRes(@SInvalidTabIndex);
    if Value <> -1 then
    begin
      t := fTabs.Items[Value];
      t.Selected := true;
    end
    else
      ClearSelection;
  end;
end;

procedure TIceTabSet.ClearSelection;
var
  I: Integer;
begin
  for I := 0 to fTabs.Count - 1 do
    fTabs[I].Selected := false;
end;

procedure TIceTabSet.SetTabStartColor(const Value: TColor);
begin
  if FTabStartColor <> Value then
  begin
    FTabStartColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetTabStopColor(const Value: TColor);
begin
  if FTabStopColor <> Value then
  begin
    FTabStopColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.ShowRightPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Tab: TIceTab;
  Poz: TPoint;
begin
  Poz := Mouse.CursorPos;
  Tab := GetItemFromPos(MousePos.X, MousePos.Y);
  if Assigned(OnBeforeShowPopupMenu) then
    OnBeforeShowPopupMenu(Self, Tab, MousePos);

  if Assigned(PopupMenu) then
  begin
    Handled := true;
    PopupMenu.Popup(Poz.X, Poz.Y);
  end;
end;

procedure TIceTabSet.SelectNext(ANext: boolean);
var
  NewIndex: Integer;
begin
  if fTabs.Count > 1 then begin
    NewIndex := fTabIndex;
    if ANext then
      Inc(NewIndex)
    else
      Dec(NewIndex);
    if NewIndex = fTabs.Count then
      NewIndex := 0
    else if NewIndex < 0 then
      NewIndex := fTabs.Count - 1;
    SetTabIndex(NewIndex);
  end;
end;

function TIceTabSet.GetSelected: TIceTab;
begin
  if (fTabIndex > -1) and (fTabIndex < fTabs.Count) then
    Result := fTabs[fTabIndex]
  else
    Result := nil;
end;

procedure TIceTabSet.SetSelected(Value: TIceTab);
begin
  if Assigned(Value) then
    Value.Selected := true;
end;

procedure TIceTabSet.SetModifiedFont(const Value: TFont);
begin
  FModifiedFont.Assign(Value);
  Invalidate;
end;

procedure TIceTabSet.SetModifiedTabStartColor(const Value: TColor);
begin
  if FModifiedTabStartColor <> Value then
  begin
    FModifiedTabStartColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetModifiedTabStopColor(const Value: TColor);
begin
  if FModifiedTabStopColor <> Value then
  begin
    FModifiedTabStopColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetOnBeforeShowPopupMenu(
  const Value: TBeforeShowPopupMenuEvent);
begin
  FOnBeforeShowPopupMenu := Value;
end;

procedure TIceTabSet.SetOnTabClose(const Value: TTabCloseEvent);
begin
  FOnTabClose := Value;
end;

procedure TIceTabSet.SetTabBorderColor(Value: TColor);
begin
  if fTabBorderColor <> Value then begin
    fTabBorderColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetTabCloseColor(const Value: TColor);
begin
  if FTabCloseColor <> Value then begin
    FTabCloseColor := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetTabHeight(const Value: integer);
begin
  if FTabHeight <> Value then begin
    FTabHeight := Value;
    Invalidate;
  end;
end;

procedure TIceTabSet.SetMaxTabWidth(Value: integer);
begin
  if fMaxTabWidth <> Value then begin
    fMaxTabWidth := Value;
    Invalidate;
  end;
end;

end.
