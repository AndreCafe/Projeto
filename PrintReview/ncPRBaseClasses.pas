unit ncPRBaseClasses;
{
    ResourceString: Dario 13/03/13
}

interface

uses
   ExtCtrls, SysUtils, Classes, Controls, Forms, Graphics, StdCtrls, messages;

const
   kNaoImprimir = 'N Ã O   I M P R I M I R';
   //kPrintThumbsPanel = $00737373;
   kPrintThumbsPanelColor = clBtnFace;
   kCarregando = 'Carregando...';
   kThumbSelectedColor = clNavy;
   kPrintBmpsPanelColor = $009E9E9E;
   kBmpSelectedColor = clNavy;
   kScrollPage       = 36;
   kMaxMsgRetry      = 20;
   kMsgRetrySleep    = 5;
   kMaxReadRetries   = 2;
   kFirstReadTimeout = 15000;
   kReadInterval     = 250;
   kStartLoadAtOnce  = 4;
   kResamplerCN      = 'TNearestResampler';

   THMSG_Load                 = WM_USER + 11;

   THMSG_LoadBMP              = WM_USER + 30;

   THMSG_SetThumbCount        = WM_USER + 40;
   THMSG_SetThumbSizes        = WM_USER + 41;
   THMSG_ThumbLoad            = WM_USER + 43;

   THMSG_Repaginar            = WM_USER + 50;
type
  TCanvasHack = class ( TGraphicControl )
  public 
      property Canvas;
  end;
  
  TImageR = class ( TImage )
  protected
     procedure Paint; override;

     procedure ReloadBitmap;

     function ShadowBmp: graphics.TBitmap;
     function DontPrintBmp: graphics.TBitmap;
     function NaoImprimir: Boolean;
  end;
  
  TLabel2 = class(TLabel)
  protected
    function getPageNum: integer;
  public
    property PageNum : integer read getPageNum;
    constructor Create(AOwner: TComponent); override;
  end;

  TPanel = class(ExtCtrls.TPanel)
  public
    property Canvas;
  end;

  TImagemPanel = class(TPanel)
    private
      fImg      : TImage;
      fSelected : boolean;
      fPageNum  : integer;
      procedure CreateImg;
      procedure DestroyImg;
      procedure RefreshLB;
      function GetCorFundo: TColor; virtual; abstract;
    function GetNaoImprimir: boolean;
    procedure SetPageNum(const Value: Integer);
    protected
      procedure SetSelected(value: boolean); virtual;

      procedure Paint; override;
      

      function DontPrintBmp: graphics.TBitmap;
      function ShadowBmp: graphics.TBitmap;

      procedure wmReloadImg(var Message: TMessage); message wm_user + 1;
      
    public
      lb  : TLabel2;
      property PageNum: Integer
        read FPageNum write SetPageNum;
        
      property NaoImprimir : boolean read GetNaoImprimir;
      property Selected : boolean read fSelected write SetSelected;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure SetSelectedCustom(Value: Boolean; aScroll: Boolean);
      procedure Reload;

      procedure Load(aBmp: graphics.TBitmap);
      procedure Unload;
  end;

  TPagePanel = class(TImagemPanel)
    private
      function GetCorFundo: TColor; override;
  end;

  TThumbPanel = class(TImagemPanel)
    private
      function GetCorFundo: TColor; override;
    
    protected
      procedure SetSelected(value: boolean); override;
  end;

  TThumbPanelList = class(TList)
   protected
    function Get(Index: Integer): TThumbPanel;
    procedure Put(Index: Integer; Item: TThumbPanel);
   public
    procedure Clear; override;
    property Items[Index: Integer]: TThumbPanel read Get write Put; default;
    destructor Destroy; override;
  end;

  TPagePanelList = class(TList)
   protected
    function Get(Index: Integer): TPagePanel;
    procedure Put(Index: Integer; Item: TPagePanel);
   public
    procedure Clear; override;
    property Items[Index: Integer]: TPagePanel read Get write Put; default;
    destructor Destroy; override;
  end;

implementation

uses
   jpeg,
   Windows,
   madGraphics,
   ncPRImagesScrollBox,
   ncPRPagesScrollBox,
  {$IFNDEF NOLOG}
   uLogs,
  {$ENDIF}
   ncPRThumbsScrollBox;

// START resource string wizard section
resourcestring
  SCarregando = '  -  Carregando';

// END resource string wizard section


{ TPagePanel }

function TPagePanel.GetCorFundo: TColor;
begin
  Result := kPrintBmpsPanelColor;
end;


{ TImagemPanel }

constructor TImagemPanel.Create(AOwner: TComponent);
begin
  inherited;
  fSelected := False;
  fImg := nil;
  lb  := TLabel2.create(Self);
  lb.Top := 0;
  lb.Left := kBmpBorderWidth;
  lb.AlignWithMargins := True;
  lb.Margins.Left   := kBmpBorderWidth;
  lb.Margins.Top    := kBmpBorderWidth;
  lb.Margins.Right  := kBmpBorderWidth;
  lb.Margins.Bottom := kBmpBorderWidth;
  lb.font.color := clNavy;
  lb.font.name := 'Verdana'; // do not localize
  lb.font.size := 18;
  lb.font.Style := [fsBold];
  lb.Parent := Self;
end;

procedure TImagemPanel.CreateImg;
begin
  if fImg=nil then begin
    fImg := TImageR.create(Self);
    fImg.Tag := Tag;
    fImg.Stretch := True;
    fImg.Proportional := True;
    fImg.Parent := Self;
    fImg.AlignWithMargins := True;
    fImg.Margins.Left   := kBmpBorderWidth;
    fImg.Margins.Top    := kBmpBorderWidth;
    fImg.Margins.Right  := kBmpBorderWidth;
    fImg.Margins.Bottom := kBmpBorderWidth;
    fImg.Align := alClient;
    fImg.OnClick := OnClick;
    fImg.OnDblClick := OnDblClick;
    fImg.Cursor := crHandPoint;
    lb.BringToFront;
  end;
  RefreshLB;
end;

destructor TImagemPanel.Destroy;
begin
  DestroyImg;
  lb.Free;
  inherited;
end;

procedure TImagemPanel.DestroyImg;
begin
  if Assigned(FImg) then begin
    try FImg.Free; except end;
    FImg := nil;
  end;
  RefreshLB;
end;

function TImagemPanel.DontPrintBmp: graphics.TBitmap;
begin
  Result := TImagesScrollBox(Parent).DontPrintBmp;
end;

function TImagemPanel.GetNaoImprimir: boolean;
begin
  if Parent=nil then
    Result := False else
    Result := TImagesScrollBox(Parent).NaoImprimir(PageNum);
end;

procedure TImagemPanel.Load(aBmp: graphics.TBitmap);
begin
  CreateImg;
  FImg.Picture.Bitmap := aBmp;
  Invalidate;
end;

procedure TImagemPanel.Paint;
var 
  SaveMode: TCopyMode;
  DestRect : TRect;
begin

  inherited;
  if NaoImprimir and (not Assigned(FImg)) then  begin
    SaveMode := Canvas.CopyMode;
    try
      DestRect := GetClientRect;
      Canvas.CopyMode := cmSrcAnd;
      Canvas.StretchDraw(DestRect, ShadowBmp);
      Canvas.CopyMode := cmMergeCopy;
      Canvas.StretchDraw(DestRect, DontPrintBmp);
    finally
      Canvas.CopyMode := SaveMode;
    end;
  end;
end;

procedure TImagemPanel.RefreshLB;
begin
  if FImg=nil then begin
    lb.Align := alClient;
    lb.Caption := IntToStr(FPageNum) + SCarregando;
    lb.Transparent := False;
    lb.Color       := $00EEEEEE;
    lb.Font.Color   := clGray;
    lb.Top         := kBmpLabelPos;
    lb.Left   := kBmpLabelPos;
  end else begin
    lb.Font.Color := clNavy;
    lb.Align := alNone;
    lb.Caption := IntToStr(FPageNum);
    lb.Transparent := True;
  end;
end;

procedure TImagemPanel.Reload;
begin
  Invalidate;
end;

procedure TImagemPanel.wmReloadImg(var Message: TMessage);
begin
  try
    gLog.Log(Self, [lcTrace], 'ReloadImg - 1'); // do not localize
    if FImg<>nil then begin
      gLog.Log(Self, [lcTrace], 'ReloadImg - 2'); // do not localize
      FImg.Picture.Assign(graphics.TBitmap(Message.WParam));
      FImg.Invalidate;
    end;
  except
  end;
  try graphics.TBitmap(Message.WParam).Free; except end;
end;

procedure TImagemPanel.Unload;
begin
  DestroyImg;
  GLog.Log(self,[lcTrace], 'Unload '+inttostr(PageNum)); // do not localize
end;

procedure TImagemPanel.SetPageNum(const Value: Integer);
begin
  FPageNum := Value;
  Tag := Value;
  if Assigned(FImg) then FImg.Tag := Value;
  RefreshLB;
end;

procedure TImagemPanel.SetSelected(value: boolean);
begin
  SetSelectedCustom(Value, True);
end;

procedure TImagemPanel.SetSelectedCustom(Value, aScroll: Boolean);
begin

    if value<>fSelected then begin
          fSelected := value;
          if (fSelected) then begin
             color := kThumbSelectedColor;
             if aScroll and (Parent<>nil) then begin
               TScrollBox(Parent).ScrollInView(self);
               TScrollBox(Parent).ScrollInView(lb);
             end;
          end else 
            color := GetCorFundo;
    end;


end;

function TImagemPanel.ShadowBmp: graphics.TBitmap;
begin
  Result := TImagesScrollBox(Parent).ShadowBmp;
end;

{ TThumbPanel }

function TThumbPanel.GetCorFundo: TColor;
begin
  Result := kPrintThumbsPanelColor;
end;

procedure TThumbPanel.SetSelected(value: boolean);
begin
    if value<>fSelected then begin
      inherited;
      if (fSelected) and (Parent<>nil) then 
        TScrollBox(Parent).ScrollInView(lb);
    end;
end;

{ TLabel2 }

constructor TLabel2.Create(AOwner: TComponent);
begin
  inherited;
  Height := kLabelHeight;
end;

function TLabel2.getPageNum: integer;
begin
    result := TImagemPanel(owner).PageNum;
end;

{ TThumbPanelList }

destructor TThumbPanelList.Destroy;
begin
  Clear;
  inherited;
end;

procedure TThumbPanelList.Clear;
var
    i : integer;
begin
    for i:=count-1 downto 0 do
       Get(i).free;
    count := 0;
end;

function TThumbPanelList.Get(Index: Integer): TThumbPanel;
begin
    result := inherited Get(Index);
end;

procedure TThumbPanelList.Put(Index: Integer; Item: TThumbPanel);
begin
    inherited  Put(Index, Item);
end;


{ TPagePanelList }

procedure TPagePanelList.Clear;
var
    i : integer;
begin
    for i:=count-1 downto 0 do
       Get(i).free;
    count := 0;
end;

destructor TPagePanelList.Destroy;
begin
  Clear;
  inherited;
end;

function TPagePanelList.Get(Index: Integer): TPagePanel;
begin
    result := inherited Get(Index);
end;

procedure TPagePanelList.Put(Index: Integer; Item: TPagePanel);
begin
    inherited  Put(Index, Item);
end;

{ TImageR }

function TImageR.DontPrintBmp: graphics.TBitmap;
begin
  Result := TImagemPanel(Parent).DontPrintBmp;
end;

function TImageR.NaoImprimir: Boolean;
begin
  Result := TImagemPanel(Parent).NaoImprimir;
end;


type 

  TThreadReload = Class ( TThread )
  private
     FArq : String;
     FHWND : HWND;
     FWidth : Integer;
     FHeight : Integer;
  protected 
    procedure Execute; override;
  public
    constructor Create(aArq: String; aHWND: HWND; aWidth, aHeight: Integer);
  end;

  TThreadStretch = Class ( TThread )
  private
     FBmp : graphics.TBitmap;
     FHWND : HWND;
     FWidth : Integer;
     FHeight : Integer;
  protected 
    procedure Execute; override;
  public
    constructor Create(aBmp: graphics.TBitmap; aHWND: HWND; aWidth, aHeight: Integer);
  end;
  
  
procedure TImageR.Paint;
var 
  SaveMode: TCopyMode;
begin
  if Width <> Picture.Width then begin
    if Width > Picture.Width then begin
      gLog.Log(Self, [lcTrace], 'Paint - Need Reload'); // do not localize
      TThreadReload.Create(TPagesScrollBox(Parent.Parent).PageFileName(Tag), Parent.Handle, Width, Height);
    end else begin
//      TThreadStretch.Create(Picture.Bitmap, Parent.Handle, Width, Height);
      gLog.Log(Self, [lcTrace], 'Paint - StretchBitmap'); // do not localize
      StretchBitmap(Picture.Bitmap, nil, Width, Height, sqVeryHigh);
      gLog.Log(Self, [lcTrace], 'Paint - StretchBitmap - Done'); // do not localize
    end;
  end;
    
  inherited;

  gLog.Log(Self, [lcTrace], 'Paint - 1'); // do not localize
  
  if NaoImprimir then begin
    SaveMode := TCanvasHack(Self).Canvas.CopyMode;
    try
      TCanvasHack(Self).Canvas.CopyMode := cmSrcAnd;
      TCanvasHack(Self).Canvas.StretchDraw(DestRect, ShadowBmp);
      TCanvasHack(Self).Canvas.CopyMode := cmMergeCopy;
      TCanvasHack(Self).Canvas.StretchDraw(DestRect, DontPrintBmp);
    finally
      TCanvasHack(Self).Canvas.CopyMode := SaveMode;
    end;
  end;
end;

procedure TImageR.ReloadBitmap;
begin
  gLog.Log(Self, [lcTrace], 'ReloadBitmap - Tag: ' + IntToStr(Tag)); // do not localize
  TPagesScrollBox(Parent.Parent).Requisitar(Tag, Tag, True);
end;

function TImageR.ShadowBmp: graphics.TBitmap;
begin
  Result := TImagemPanel(Parent).ShadowBmp;
end;

{ TThreadReload }

constructor TThreadReload.Create(aArq: String; aHWND : HWND; aWidth, aHeight: Integer);
begin
  FArq := aArq;
  FHWND := aHWND;
  FWidth := aWidth;
  FHeight := aHeight;
  inherited Create(True);
  FreeOnTerminate := True;
  Priority := tpLowest;
  Resume;
end;

procedure TThreadReload.Execute;
var
  j : TjpegImage;
  b : graphics.TBitmap;
begin
  try
    gLog.Log(Self, [lcTrace], 'Execute - FArq: '+FArq); // do not localize
  
    J := TjpegImage.Create;
    b := graphics.TBitmap.Create;
    try
      J.LoadFromFile(FArq);
      B.Assign(J);
      StretchBitmap(B, nil, FWidth, FHeight, sqVeryHigh);
      PostMessage(FHWND, wm_user+1, WParam(B), 0);
    except
      b.free;
    end;
    J.Free;
  except
  end;
end;

{ TThreadStretch }

constructor TThreadStretch.Create(aBmp: graphics.TBitmap; aHWND: HWND; aWidth,
  aHeight: Integer);
begin
  FBmp := graphics.TBitmap.Create;
  FBmp.Assign(aBmp);
  FHWND := aHWND;
  FWidth := aWidth;
  FHeight := aHeight;
  inherited Create(True);
  Priority := tpLowest;
  FreeOnTerminate := True;
  Resume;
end;

procedure TThreadStretch.Execute;
begin
  try
    StretchBitmap(FBmp, nil, FWidth, FHeight, sqVeryHigh);
    PostMessage(FHWND, wm_user+1, WParam(FBmp), 0);
  except
  end;
end;

end.

