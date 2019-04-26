unit uPagesScrollBox;

interface

uses
   Windows, Messages, SysUtils, ExtCtrls, classes, controls,
   StdCtrls, graphics, forms, jpeg, Int64List, uImagem,
   uPrintManBaseClasses, uThumbsScrollBox, uImagesScrollBox,
   uJson;

const
   kBmpLabelPos    = 8;
   kBmpBorderWidth = 6;
   kDefaultColumns = 2;
   kDefBmpLeft = 10;
   kPageIniTop = 8;
   kPagesLoadAtOnce = 12;
   kMaxLoadedPages = 40;

   kMax_ZOOM_STD_VALUES = 9;
   kZOOM_STD_VALUES: array[0..kMax_ZOOM_STD_VALUES] of Double = ( 0.17, 0.25, 0.34, 0.5, 0.75, 0.75, 1, 1.5, 2, 4);

type

  TZoomType  = (zoomUsr, zoomHeight, zoomWidth);

  TPagesManagerThread         = class;
  TLoadPagesThread            = class;

  TPagesScrollBox = class(TImagesScrollBox)
    private
      fCurrentPage  : integer;
      fZoomFactor       : double;
      fbmpWidth, fbmpHeight      : integer;
      fpanelWidth, fpanelHeight  : Integer;
      fMD5 : string;
      fLeftmostX      : integer;
      fOnPageChange   : TPageEvent;
      fOnStatusChange : TPageEvent;
      fOnIniRead      : TIniReadEvent;
      fOnFirstBmp     : TBitmapEvent;
      fNoPrintCount   : integer;
      fBmpLeft        : integer;
      fPagesManagerThread : TPagesManagerThread;
      fParentWidth   : integer;
      fFilesPath     : string;
      fZoomType      : TZoomType;
      fForceZoom     : boolean;
      fDontPrintBmp  : TBitmap;
      fShadowBmp     : TBitmap;
      fPagePanelList : TPagePanelList;
      fThumbsScrollBox: TThumbsScrollBox;
      procedure ScrollBoxResize(Sender: TObject);
      function  GetPagePanel(aPageNum: integer):TPagePanel;
      function  getPrintablePageCount:integer;
      procedure SetZoomFactor(const Value: double);
      procedure SetZoomFactorUsr(const Value: double);
      procedure SetCurrentPage(const Value: integer);
      procedure SetCurrentPageInternal(const Value: integer);
      procedure imgOnClick(Sender: TObject);
      procedure imgOnDblClick(Sender: TObject);
      procedure PagesManagerThreadOnBmpReady(Sender: TObject; aPageNum:integer; aBmp:TBitmap);
      procedure PagesManagerThreadOnUnload(Sender: TObject; aPageNum:integer);
      procedure PagesManagerThreadOnFirstBmp(Sender: TObject; aPageNum:integer; aBmp:TBitmap);
      procedure PagesManagerThreadOnIniRead(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight: integer; aMD5:string);
      procedure doParentResize;
      procedure calcVisiblePages;
      procedure requisitar(aInicio, aFim:integer; const aForce:boolean=false);
    protected
      procedure doAfterVScroll; override;
      procedure SetParent(AParent: TWinControl); override;
      procedure repaginar;
    public
      property MD5: string read fMD5;
      property Pagina[aPageNum:integer]: TPagePanel read GetPagePanel;
      property ZoomFactor: double read fZoomFactor write SetZoomFactorUsr;
      property OnPageChange: TPageEvent read fOnPageChange write fOnPageChange;
      property OnStatusChange: TPageEvent read fOnStatusChange write fOnStatusChange;
      property OnIniRead : TIniReadEvent read fOnIniRead write fOnIniRead;
      property OnFirstBmp : TBitmapEvent read fOnFirstBmp write fOnFirstBmp;
      property CurrentPage: integer read fCurrentPage write SetCurrentPage;
      property  PrintablePageCount : integer read getPrintablePageCount;
      property  DontPrintBmp  : TBitmap read fDontPrintBmp;
      property  ShadowBmp     : TBitmap read fShadowBmp;
      procedure incNoPrintCount;
      procedure decNoPrintCount;
      procedure doStatusChange(aPageNum:integer);
      procedure ToggleImprimir(aPageNum:integer);
      procedure ToggleZoom;
      procedure ZoomToUsr;
      procedure ZoomToHeight;
      procedure ZoomToWidth;
      procedure ZoomIn;
      procedure ZoomOut;
      procedure First;
      procedure Last;
      procedure Prior;
      procedure Next;
      procedure Clear;
      procedure NotifyProgressPrintMessage(aPage:integer); override;
      function  SelectPage(aPageNum:integer):TPagePanel;
      procedure StartLoad(aFilesPath:string; aThumbsScrollBox:TThumbsScrollBox);
      function  deletedRange:string;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
  end;

  TPagesManagerThread = class(TImageManagerThread)
    private
      fImagesScrollBox : TPagesScrollBox;
      fThumbManagerThread : TThumbManagerThread;
      fOnIniRead    : TIniReadEvent;
      fParentWidth  : integer;
      fFilesPath    : string;
      fTotalPages   : integer;
      fImageWidth   : integer;
      fThumbHeight  : integer;
      fBmpWidth     : integer;
      fBmpHeight    : integer;
      fMD5          : string;
      procedure SyncOnIniRead;
      procedure doOnIniRead(aTotalPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight: integer; aMD5:string);
      procedure LoadFirst;
      procedure Load(aFirstPageID, aLastPageID: integer);
    protected
      //procedure FinalizeImageManagerThread; override;
      procedure Execute; override;
    public
      property ThumbManagerThread : TThumbManagerThread read fThumbManagerThread write fThumbManagerThread;
      property OnIniRead  : TIniReadEvent read fOnIniRead write fOnIniRead;
      constructor Create(aImagesScrollBox : TPagesScrollBox; aFilesPath:string; aParentWidth:integer);
      destructor Destroy; override;
  end;

  TLoadPagesThread = class(TLoadImagesThread)
    protected
      function  loadBitmap(i:integer):boolean; override;
  end;

implementation

   uses
  {$IFNDEF NOLOG}
   uLogs,
  {$ENDIF}
   madKernel,
   math;

{ TPagesScrollBox }

constructor TPagesScrollBox.Create(AOwner: TComponent);
begin
    inherited;
    borderStyle := bsNone;
    Align := alClient;
    OnResize := ScrollBoxResize;
    fVisibleCols  := kDefaultColumns;
    doParentResize;
    fPagePanelList := TPagePanelList.create;
    fShadowBmp := TBitmap.Create;
    fShadowBmp.PixelFormat := pf24bit;
    fDontPrintBmp := TBitmap.Create;
    fDontPrintBmp.PixelFormat := pf24bit;
end;

function TPagesScrollBox.deletedRange: string;
var
    i : integer;
begin
    result := '';
    for i:=0 to ControlCount-1 do begin
      if (Controls[i] is TPagePanel) and
         (TPagePanel(Controls[i]).NaoImprimir)  then
            result := result + inttostr(TPagePanel(Controls[i]).PageNum)+ ',';
    end;
    if result<>'' then
        setlength(result,length(result)-1);
end;

procedure TPagesScrollBox.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);
  if AParent<> nil then begin
      doParentResize;
      fBmpLeft := kDefBmpLeft;
  end;
end;

destructor TPagesScrollBox.Destroy;
begin
  Clear;
  fShadowBmp.free;
  fDontPrintBmp.Free;
  fPagePanelList.Free;
  Parent := nil;
  inherited;
end;

procedure TPagesScrollBox.Clear;
begin
    inherited;
    fbmpWidth := 0; fbmpHeight := 0;
    fpanelWidth  := 0; fpanelHeight := 0;
    fVisibleCols  := kDefaultColumns;
    fNoPrintCount := 0;
    fMD5 := '';

    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'Clear');{$ENDIF}

    if fPagesManagerThread<>nil then begin
        fPagesManagerThread.Terminate;
        fPagesManagerThread.WaitFor;
        fPagesManagerThread.free;
        fPagesManagerThread := nil;
    end;
    if fShadowBmp <> nil then
       fShadowBmp.Empty;
    if fDontPrintBmp <> nil then
       fDontPrintBmp.Empty;
    fPagePanelList.Clear;
    Invalidate;
end;

procedure TPagesScrollBox.imgOnClick(Sender: TObject);
begin
    doImageClick ( TImagem(Sender).PageNum );
end;

procedure TPagesScrollBox.imgOnDblClick(Sender: TObject);
begin
    doImageDblClick ( TImagem(Sender).PageNum );
end;


procedure TPagesScrollBox.decNoPrintCount;
begin
    dec(fNoPrintCount);
end;

procedure TPagesScrollBox.incNoPrintCount;
begin
    inc(fNoPrintCount);
end;

procedure TPagesScrollBox.doParentResize;
begin
      fScrollW  := GetSystemMetrics(SM_CXHTHUMB);
      if Parent<>nil then begin
          fParentWidth := Parent.Width - fScrollW;
          if fPagesManagerThread<>nil then
             fPagesManagerThread.fParentWidth := fParentWidth;
      end;
end;

procedure TPagesScrollBox.doStatusChange(aPageNum: integer);
begin
    if assigned(fOnStatusChange) then
        fOnStatusChange(Self, aPageNum);
end;

{
#define DEFAULT_QUALITY         0
#define DRAFT_QUALITY           1
#define PROOF_QUALITY           2
#if(WINVER >= 0x0400)
#define NONANTIALIASED_QUALITY  3
#define ANTIALIASED_QUALITY     4
#endif /* WINVER >= 0x0400 */
}

procedure AngleTextOut(ACanvas: TCanvas; Angle, X, Y: integer; AStr: string);
var
    LogFont: TLogFont;
    hOldFont, hNewFont: HFONT;
begin
    GetObject(ACanvas.Font.Handle, SizeOf(LogFont), Addr(LogFont));
    LogFont.lfEscapement  := Angle;// *10;
    LogFont.lfOrientation := Angle;// *10;
    LogFont.lfQuality := 2;
    hNewFont := CreateFontIndirect(LogFont);
    hOldFont := SelectObject(ACanvas.Handle, hNewFont);
    ACanvas.TextOut(X, Y, AStr);
    hNewFont := SelectObject(ACanvas.Handle, hOldFont);
    DeleteObject(hNewFont);
end;

procedure TPagesScrollBox.PagesManagerThreadOnFirstBmp(Sender: TObject;
  aPageNum: integer; aBmp: TBitmap);
begin
    fbmpWidth  := aBmp.width;
    fbmpHeight := aBmp.Height;
    fLastVPos  := -1;

    fZoomFactor := (width - 40) / (fbmpWidth+(kDefaultColumns*kBmpBorderWidth)) /2 ;
    ZoomOut;
    SelectPage(1);


    if assigned(fOnFirstBmp) then
        fOnFirstBmp(self, 1, aBmp);
end;

procedure TPagesScrollBox.calcVisiblePages;
var
    proxrange : integer;
begin
    fVisibleRows := (Height div fpanelHeight) + 1;
    if fpanelWidth > fParentWidth then
        fVisibleCols := 1
    else
        fVisibleCols := trunc(fParentWidth / fpanelWidth);

    proxrange := ((fImageCount div fVisibleCols) * fPanelHeight ) + (2*kPageIniTop);
    if(fImageCount mod fVisibleCols) <> 0 then
       proxrange:= proxrange + fPanelHeight;
    if proxrange <> VertScrollBar.Range then begin
         if proxrange < Height+1 then
             VertScrollBar.Range := Height+ 1
         else
             VertScrollBar.Range := proxrange;
    end;

    fFirstVisiblePage := ((VertScrollBar.position div fPanelHeight) * fVisibleCols) + 1;
    fLastVisiblePage  := (fFirstVisiblePage + (fVisibleRows * fVisibleCols)) - 1;

    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'calcVisiblePages pos '+inttostr(VertScrollBar.position)+' dwn '+booltostr(fScrollDown, true));{$ENDIF}
    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],
             'calcVisiblePages CP FV LV COLS ROWS = '+inttostr(fCurrentPage) +
             ' '+inttostr(fFirstVisiblePage) +
             ' '+inttostr(fLastVisiblePage) +
             ' '+inttostr(fVisibleCols) +
             ' '+inttostr(fVisibleRows)
             );
             GLog.ForceLogWrite;
             {$ENDIF}
end;

procedure TPagesScrollBox.repaginar;
var
    inicio, fim:integer;
    c, i, m : integer;
    margimL : integer;
    pagePanel : TPagePanel;
    pagePanelLeft : integer;
begin
    fLeftmostX := maxint;
    c := 1; m:=1;
    if fPanelHeight = 0 then exit;

    calcVisiblePages;
    inicio := fFirstVisiblePage - fVisibleCols;
    if inicio<1 then inicio:=1;
    fim    := fLastVisiblePage + fVisibleCols;
    if fim>fImageCount then fim := fImageCount;

    if (frepagLastInicio = inicio) and
       (frepagLastFim = fim) and
       (frepagLastPanelHeight = fPanelHeight) then
       exit;

    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'repaginar Start '+inttostr(inicio)+'-'+inttostr(fim));{$ENDIF}

    frepagLastInicio := inicio;
    frepagLastFim := fim;
    frepagLastPanelHeight := fPanelHeight;

    // ------------------------------

    pagePanelLeft := kDefBmpLeft;
    for i:=Inicio-1 to Fim-1 do begin
        pagePanel := fPagePanelList[i];
        pagePanel.Top    := kPageIniTop + ((i div fVisibleCols) * fPanelHeight ) - VertScrollBar.position;
        pagePanel.Width  := fpanelWidth;
        pagePanel.Height := fpanelHeight;
        pagePanel.img.Width  := pagePanel.Width  - (2*kBmpBorderWidth);
        pagePanel.img.Height := pagePanel.Height - (2*kBmpBorderWidth);

        if (fVisibleCols * (fpanelWidth)) > fParentWidth then begin
          pagePanel.Left := kDefBmpLeft;
          margimL := 0;
        end else begin
          margimL  := (fParentWidth - (fVisibleCols * (fpanelWidth)) ) div 2;
          pagePanel.Left := margimL + (c-1)*(fpanelWidth);
        end;
        if fLeftmostX>(pagePanelLeft+margimL) then
           fLeftmostX := (pagePanelLeft+margimL);
        if (c=fVisibleCols) and (m<fImageCount) then
          c:=1
        else
           inc(c);
        if pagePanel.parent = nil then
            pagePanel.parent := self;
        inc(m);
    end;

    for i:=0 to inicio-2 do begin
        fPagePanelList[i].Parent := nil;
    end;


    for i:=fim to fImageCount-1 do begin
        fPagePanelList[i].Parent := nil;
    end;

    requisitar( Inicio, fim);

    {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}

end;

procedure TPagesScrollBox.PagesManagerThreadOnBmpReady(Sender: TObject;
  aPageNum: integer; aBmp: TBitmap);
var
    pagePanel  : TPagePanel;
begin
    pagePanel := fPagePanelList[aPageNum-1];
    try
        if pagePanel.parent = nil then begin
             {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'PagesManagerThreadOnBmpReady  parent=nil '+inttostr(aPageNum));{$ENDIF}
             exit;
        end;

        if pagePanel.img.Bitmap<>fLoadingBmp then begin
            {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'PagesManagerThread page '+inttostr(aPageNum)+' already exists');{$ENDIF}
            exit;
        end;
        {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'PagesManagerThread page '+inttostr(aPageNum));{$ENDIF}
        if pagePanel.bmpImagem<>nil then
            pagePanel.bmpImagem.free;
        pagePanel.bmpImagem := TBitmap.Create;
        pagePanel.bmpImagem.PixelFormat := pf24bit;
        pagePanel.bmpImagem.Assign(aBmp);
        FreeAndNil(aBmp);
        pagePanel.img.Bitmap:= pagePanel.bmpImagem;

        if pagePanel.NaoImprimir then
            pagePanel.paintDeleted;

    finally
        {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}
    end;
end;

procedure TPagesScrollBox.PagesManagerThreadOnUnload(Sender: TObject; aPageNum: integer);
var
    pagePanel  : TPagePanel;
begin
        pagePanel := fPagePanelList[aPageNum-1];
        if pagePanel.img.Bitmap=fLoadingBmp then begin
            {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'PagesManagerThreadOnUnload page '+inttostr(aPageNum)+' do not exist');{$ENDIF}
            exit;
        end;
        {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'PagesManagerThreadOnUnload page '+inttostr(aPageNum));{$ENDIF}
        pagePanel.img.Bitmap:= fLoadingBmp;
        FreeAndNil(pagePanel.bmpImagem);
        if pagePanel.bmpDeleted <> nil then
            FreeAndNil(pagePanel.bmpDeleted);

    {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}
end;


procedure TPagesScrollBox.StartLoad(aFilesPath:string; aThumbsScrollBox: TThumbsScrollBox);
begin
    fFilesPath := aFilesPath;
    fThumbsScrollBox := aThumbsScrollBox;
    if fFilesPath <> '' then begin
        fPagesManagerThread := TPagesManagerThread.Create(self, fFilesPath, fParentWidth);
        fPagesManagerThread.ThumbManagerThread := fThumbsScrollBox.ThumbManagerThread;
        fPagesManagerThread.OnBmpReady := PagesManagerThreadOnBmpReady;
        fPagesManagerThread.OnFirstBmp := PagesManagerThreadOnFirstBmp;
        fPagesManagerThread.OnIniRead  := PagesManagerThreadOnIniRead;
        fPagesManagerThread.OnUnload   := PagesManagerThreadOnUnload;
        fPagesManagerThread.Resume;
    end;


end;

procedure TPagesScrollBox.PagesManagerThreadOnIniRead(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight: integer; aMD5:string);
var
    sobraX, sobraY, lastSobraX, lastSobraY : integer;
    tz : TSize;
    angulo : double;
    lastFSize, FSize, i : integer;
    pagePanel : TPagePanel;
begin
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'PagesManagerThreadOnIniRead '+inttostr(aTotPages) +
             ' '+inttostr(aTotPages) +
             ' '+inttostr(aThumbWidth) +
             ' '+inttostr(aThumbHeight) +
             ' '+inttostr(aBmpWidth) +
             ' '+inttostr(aBmpHeight) +
             ' '+ aMD5
    );{$ENDIF}

    fImageCount := aTotPages;
    fImageWidth := aThumbWidth;
    fImageHeight := aThumbHeight;
    fBmpWidth := aBmpWidth;
    fBmpHeight := aBmpHeight;
    fMD5 := aMD5;

    fShadowBmp.Transparent := false;
    fShadowBmp.Width  := fbmpWidth;
    fShadowBmp.Height := fbmpHeight;
    fShadowBmp.Canvas.Brush.Color := $00C0F0F0;
    fShadowBmp.Canvas.Brush.Style := bsSolid;
    fShadowBmp.Canvas.FillRect(rect(0,0,fShadowBmp.Width, fShadowBmp.Height));

    fLoadingBmp.TransparentMode := tmAuto;
    fLoadingBmp.Transparent     := false;
    fLoadingBmp.Width  := fbmpWidth;
    fLoadingBmp.Height := fbmpHeight;
    fLoadingBmp.Canvas.Brush.Color := $00D0D0D0;
    fLoadingBmp.Canvas.Brush.Style := bsSolid;
    fLoadingBmp.Canvas.FillRect(rect(0,0,fLoadingBmp.Width, fLoadingBmp.Height));
    fLoadingBmp.Canvas.Font.Name  := 'Verdana';
    fLoadingBmp.Canvas.Font.Style := [];
    fLoadingBmp.Canvas.Font.Color  := $00F0E0E0;

    lastFSize := 0;
    sobraX := 0;
    lastSobraX := 0;
    FSize := 20;
    while FSize<=150 do begin
        lastSobraX := sobraX;
        lastFSize := FSize;
        inc(FSize,10);
        fLoadingBmp.Canvas.Font.Size  := FSize;
        tz := fLoadingBmp.Canvas.TextExtent( kCarregando);

        sobraX := (fLoadingBmp.Width  - tz.cx) div 2;

        if (sobraX<100) then
           break;
    end;
    lastSobraY := (fLoadingBmp.Height  - tz.cy) div 2;
    fLoadingBmp.Canvas.Font.Size  := lastFSize;
    fLoadingBmp.Canvas.TextOut( lastSobraX, lastSobraY, kCarregando);

    fDontPrintBmp.TransparentMode  := tmFixed;
    fDontPrintBmp.Transparent      := true;
    fDontPrintBmp.TransparentColor := $00C0C0C0;
    fDontPrintBmp.Width  := fbmpWidth;
    fDontPrintBmp.Height := fbmpHeight;
    fDontPrintBmp.Canvas.Brush.Color := $00C0C0C0;
    fDontPrintBmp.Canvas.Brush.Style := bsSolid;
    fDontPrintBmp.Canvas.FillRect(rect(0,0,fDontPrintBmp.Width, fDontPrintBmp.Height));
    fDontPrintBmp.Canvas.Font.Name  := 'Verdana';
    fDontPrintBmp.Canvas.Font.Style := [fsBold];
    fDontPrintBmp.Canvas.Font.Color  := clRed;
    angulo := math.ArcTan2( fDontPrintBmp.Height,fDontPrintBmp.Width);

    lastFSize := 0;
    sobraX := 0;
    sobraY := 0;
    FSize := 40;
    while FSize<=150 do begin
        lastSobraX := sobraX;
        lastSobraY := sobraY;
        lastFSize := FSize;
        inc(FSize,10);
        fDontPrintBmp.Canvas.Font.Size  := FSize;
        tz := fDontPrintBmp.Canvas.TextExtent( kNaoImprimir);

        sobraX := (fDontPrintBmp.Width  - trunc(tz.cx*cos(angulo))) div 2 - (trunc(tz.cy*sin(angulo)) div 2);
        sobraY := ((fDontPrintBmp.height - trunc(tz.cx*sin(angulo))) div 2) + (trunc(tz.cy*cos(angulo)) div 2);

        if (sobraX<0) or (sobraY<0) then
           break;
    end;
    fDontPrintBmp.Canvas.Font.Size  := lastFSize;
    AngleTextOut( fDontPrintBmp.Canvas, trunc( RadToDeg( angulo ) * 10 ),
            lastSobraX, fDontPrintBmp.height - lastSobraY, kNaoImprimir);

    for i:=1 to aTotPages do begin
        pagePanel := TPagePanel.create(nil);
        pagePanel.PageNum := i;
        pagePanel.BevelOuter := bvNone;
        pagePanel.Color := kPrintBmpsPanel;
        pagePanel.DoubleBuffered := true;
        pagePanel.Width  := fpanelWidth;
        pagePanel.Height := fpanelHeight;

        with pagePanel do begin
            img.Stretch := true;
            img.Top    := kBmpBorderWidth;
            img.Left   := kBmpBorderWidth;
            img.Bitmap := fLoadingBmp;
            img.OnClick := imgOnClick;
            img.OnDblClick := imgOnDblClick;
            img.Parent := pagePanel;

            lb.Top    := kBmpLabelPos;
            lb.Left   := kBmpLabelPos;
            lb.Transparent := true;
            lb.font.color := $000080FF;
            lb.font.name := 'Verdana';
            lb.font.size := 18;
            lb.font.Style := [fsBold];
            lb.Caption := inttostr(i);
            lb.Parent := pagePanel;
        end;
        pagePanel.parent := nil;

        fPagePanelList.Add(pagePanel);
    end;

    if assigned(fOnIniRead) then
        fOnIniRead(self, aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight, aMD5);
    SetCurrentPage(1);
end;

function TPagesScrollBox.GetPagePanel(aPageNum: integer):TPagePanel;
begin
        result := fPagePanelList[aPageNum-1];
end;

function TPagesScrollBox.getPrintablePageCount: integer;
begin
    result := fImageCount - fNoPrintCount;
end;

procedure TPagesScrollBox.First;
begin
    CurrentPage := 1;
end;

procedure TPagesScrollBox.Last;
begin
    CurrentPage := fImageCount;
end;

procedure TPagesScrollBox.Next;
begin
    CurrentPage := fCurrentPage + 1;
end;

procedure TPagesScrollBox.NotifyProgressPrintMessage(aPage: integer);
begin
    inherited;

    if (aPage>=fFirstVisiblePage) and (aPage<=fLastVisiblePage) then
        requisitar( fFirstVisiblePage, fLastVisiblePage, true);
end;

procedure TPagesScrollBox.Prior;
begin
    CurrentPage := fCurrentPage - 1;
end;

function TPagesScrollBox.SelectPage(aPageNum: integer): TPagePanel;
var
    p : TPagePanel;
begin
    if fLastSelected > 0 then begin
        p := GetPagePanel(fLastSelected);
        if p<> nil then
           p.Selected := false;
    end;
    result := GetPagePanel(aPageNum);
    if (result<>nil)  then begin
        result.Selected := true;
        fLastSelected := aPageNum;
    end;
end;

procedure TPagesScrollBox.SetCurrentPage(const Value: integer);
var
    bp : TPagePanel;
begin
    if Value<1 then exit;
    if Value>fImageCount then exit;

    if fCurrentPage <> Value then begin
        fCurrentPage := Value;
        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'SetCurrentPage '+inttostr(fCurrentPage));{$ENDIF}
        if assigned(fOnPageChange) then
            fOnPageChange(Self, fCurrentPage);
    end;

    bp := SelectPage(fCurrentPage);
    if bp<>nil then begin
        if bp.parent<>nil then
            ScrollInView( bp )
        else begin
            VertScrollBar.Position := kPageIniTop + (((fCurrentPage-1) div fVisibleCols) * fPanelHeight );
            repaginar;
        end;
    end;
end;

procedure TPagesScrollBox.SetCurrentPageInternal(const Value: integer);
begin
    if Value<1 then exit;
    if Value>fImageCount then exit;

    if fCurrentPage <> Value then begin
        fCurrentPage := Value;
        {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'SetCurrentPageInternal '+inttostr(fCurrentPage));{$ENDIF}
        if fLastSelected>0 then
            GetPagePanel(fLastSelected).Selected := false;
        GetPagePanel(fCurrentPage).setSelectedInternal(true);
        fLastSelected := fCurrentPage;
        if assigned(fOnPageChange) then
            fOnPageChange(Self, fCurrentPage);
    end;
end;

procedure TPagesScrollBox.ZoomIn;
var
    i : integer;
begin
    for i:=0 to kMax_ZOOM_STD_VALUES-1 do
        if fZoomFactor< kZOOM_STD_VALUES[i] then begin
            fZoomType := zoomUsr;
            SetZoomFactor(kZOOM_STD_VALUES[i]);
            break;
        end;
end;

procedure TPagesScrollBox.ZoomOut;
var
    i : integer;
begin
    for i:=kMax_ZOOM_STD_VALUES-1 downto 0 do
        if fZoomFactor > kZOOM_STD_VALUES[i] then begin
            fZoomType := zoomUsr;
            SetZoomFactor(kZOOM_STD_VALUES[i]);
            break;
        end;
end;

procedure TPagesScrollBox.ToggleImprimir(aPageNum: integer);
var
    bp  : TPagePanel;
begin
    bp := GetPagePanel(fCurrentPage);
    if bp<>nil then begin
        if (PrintablePageCount=1) and (not bp.NaoImprimir) then exit;
        bp.NaoImprimir := not bp.NaoImprimir ;
    end;
end;


procedure TPagesScrollBox.ToggleZoom;
begin
    case fZoomType of
      zoomUsr: ZoomToHeight;
      zoomHeight: ZoomToWidth;
      zoomWidth: ZoomToUsr;
    end;
end;

procedure TPagesScrollBox.ZoomToHeight;
var
    zf  : double;
    bp  : TPagePanel;
    img : TImagem;
begin
    if fImageCount>0 then begin
       bp := TPagePanel(Controls[0]);
       img := TImagem(bp.Controls[0]);
       zf := Height/(img.Bitmap.height + kBmpBorderWidth + kBmpBorderWidth);
       fZoomType := zoomHeight;
       SetZoomFactor(zf);
    end;
end;

procedure TPagesScrollBox.ZoomToUsr;
begin
    fZoomType := zoomUsr;
    fForceZoom := true;
    SetZoomFactor(fZoomFactor);
end;

procedure TPagesScrollBox.ZoomToWidth;
var
    zf  : double;
    bp  : TPagePanel;
    img : TImagem;
begin
    if fImageCount>0 then begin
       bp := TPagePanel(Controls[0]);
       img := TImagem(bp.Controls[0]);
       zf := Width/(img.Bitmap.Width + kBmpBorderWidth + kBmpBorderWidth + GetSystemMetrics(SM_CXHTHUMB));
       fZoomType := zoomWidth;
       SetZoomFactor(zf);
    end;
end;

procedure TPagesScrollBox.ScrollBoxResize(Sender: TObject);
begin
   doParentResize;
end;

procedure TPagesScrollBox.SetZoomFactor(const Value: double);
var
    zf : double;
    pagActual: integer;
begin
    zf := fZoomFactor;

    if (fZoomFactor <> value) or (fForceZoom) then begin
        {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'SetZoomFactor '+ floattostr(value) );{$ENDIF}
        fForceZoom := false;
        fZoomFactor := value;
        fpanelWidth  := trunc((fbmpWidth +(2*kBmpBorderWidth))*fZoomFactor);
        fpanelHeight := trunc((fbmpHeight+(2*kBmpBorderWidth))*fZoomFactor);
        pagActual := fLastSelected;
        repaginar;
        //SelectPage(pagActual);
        self.doImageClick(pagActual);
    end;

    if fZoomType <> zoomUsr then
        fZoomFactor := zf;
end;

procedure TPagesScrollBox.SetZoomFactorUsr(const Value: double);
begin
    fZoomType := zoomUsr;
    SetZoomFactor(Value);
end;

procedure TPagesScrollBox.doAfterVScroll;
var
    aVisiblePanel: TPagePanel;
    aPage, offset : integer;
begin

    if fScrollDown then
        offset := fPanelHeight div 3
    else
        offset := height - (fPanelHeight div 3);

    if fPanelHeight=0 then exit;
    
    aPage := trunc( ((VertScrollBar.position - kPageIniTop + offset) div fPanelHeight) * fVisibleCols )+1;
    if aPage > self.fImageCount then
        aPage := fImageCount;

    {//$IFNDEF NOLOG}//GLog.Log(self,[lcTrace],'doAfterVScroll page '+inttostr(aPage));{$ENDIF}
    aVisiblePanel := GetPagePanel( aPage );

    {//$IFNDEF NOLOG}{GLog.Log(self,[lcTrace],'doAfterVScroll panel '+inttostr(aVisiblePanel.PageNum)+
             ' top '+inttostr(aVisiblePanel.top)+
             ' top-vp '+inttostr(aVisiblePanel.top-fLastVPos));{$ENDIF}

    SetCurrentPageInternal(aVisiblePanel.PageNum);
    repaginar;
end;

procedure TPagesScrollBox.requisitar(aInicio, aFim:integer; const aForce:boolean=false);
var
    retry : integer;
    bres   : boolean;
begin
    if not aForce and ((aInicio=fRequisitarLastInicio) and (aFim=fRequisitarLastFim)) then exit;
    fRequisitarLastInicio := aInicio;
    fRequisitarLastFim := aFim;
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'requisitar '+inttostr(aInicio)+' até '+inttostr(aFim));{$ENDIF}
    // esta em pag, diminuir
    if not fPagesManagerThread.Running then begin
        {$IFNDEF NOLOG}GLog.Log(self,[lcExcept],'fPagesManagerThread is not running');{$ENDIF}
        exit;
    end;

    retry := 0;
    repeat
        GLog.Log(self,[lcMsgs],'PostThreadMessage THMSG_Load '+inttostr(aInicio-1)+' '+inttostr(aFim-1));
        bres := PostThreadMessage (fPagesManagerThread.ThreadID, THMSG_Load, aInicio-1,aFim-1);
        if not bres then begin
           inc(retry);
           sleep(kMsgRetrySleep);
        end;
    until (retry=kMaxMsgRetry) or bres;
    {$IFNDEF NOLOG}
    if not bres then
       GLog.Log(self,[lcExcept],'requisitar PostThreadMessage THMSG_Load FAILED '+inttostr(aInicio-1)+' até '+inttostr(aFim-1));
    {$ENDIF}
end;

{ TPagesManagerThread }

constructor TPagesManagerThread.Create(aImagesScrollBox : TPagesScrollBox; aFilesPath:string; aParentWidth:integer);
begin
  inherited Create;

  fMaxLoadedPages := kMaxLoadedPages;
  fImagesScrollBox := aImagesScrollBox;
  fParentWidth := aParentWidth;
  fFilesPath := aFilesPath;
end;

destructor TPagesManagerThread.Destroy;
begin
    inherited Destroy;
end;

procedure TPagesManagerThread.doOnIniRead(aTotalPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight: integer; aMD5:string);
var
    bres   : boolean;
    retry  : Integer;
begin
    fTotalPages   := aTotalPages;
    fImageWidth   := aThumbWidth;
    fThumbHeight  := aThumbHeight;
    fBmpWidth     := aBmpWidth;
    fBmpHeight    := aBmpHeight;
    fMD5          := aMD5;

    retry := 0;
    repeat
        GLog.Log(self,[lcMsgs],'PostThreadMessage THMSG_SetThumbCount '+inttostr(aTotalPages));
        bres := PostThreadMessage (fThumbManagerThread.ThreadID, THMSG_SetThumbCount, aTotalPages, 0);
        if not bres then begin
           inc(retry);
           sleep(kMsgRetrySleep);
        end;
        {$IFNDEF NOLOG}
        if not bres then
             GLog.Log(self,[lcExcept],'doOnIniRead PostThreadMessage THMSG_SetThumbCount FAILED '+inttostr(aTotalPages));
        {$ENDIF}
    until terminated or (retry=kMaxMsgRetry) or bres;

    retry := 0;
    repeat
        GLog.Log(self,[lcMsgs],'PostThreadMessage THMSG_SetThumbSizes '+inttostr(aThumbWidth)+' '+inttostr(aThumbWidth));
        bres := PostThreadMessage (fThumbManagerThread.ThreadID, THMSG_SetThumbSizes, aThumbWidth, aThumbHeight);
        if not bres then begin
           inc(retry);
           sleep(kMsgRetrySleep);
        end;
    until terminated or (retry=kMaxMsgRetry) or bres;
    {$IFNDEF NOLOG}
    if not bres then
         GLog.Log(self,[lcExcept],'doOnIniRead PostThreadMessage THMSG_SetThumbSizes FAILED '+inttostr(aThumbWidth)+' até '+inttostr(aThumbHeight));
    {$ENDIF}

    Synchronize(SyncOnIniRead);
end;

procedure TPagesManagerThread.SyncOnIniRead;
begin
    if assigned(fOnIniRead) then
        fOnIniRead(self, fTotalPages, fImageWidth, fThumbHeight, fBmpWidth, fBmpHeight, fMD5);
end;

procedure TPagesManagerThread.Execute;
var
    sl     : TStringList;
    pmRes  : Integer;
    Msg    : TMsg;
    sMD5    : string;
    sMSG   : string;
    sJsonFilename : string;
    aJson  : TJSONObject;
begin
   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'Execute Start');{$ENDIF}

   try
       fIsFirstBmp       := true;
       sJsonFilename := fFilesPath;
       if sJsonFilename[length(sJsonFilename)]='\'then
           setlength(sJsonFilename, length(sJsonFilename)-1);
       sJsonFilename := sJsonFilename+'.nexprint.json';

       if not fileexists(sJsonFilename) then begin
           GLog.Log(self,[lcExcept], sJsonFilename+' Do not exists.');
           exit;
       end;

       sl := TStringList.create;
       sl.LoadFromFile(sJsonFilename);
       {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'JsonFilename '+sJsonFilename);{$ENDIF}
       {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],sl.text);{$ENDIF}

       aJson  := TJSONObject.create(sl.text);
       try
           fTotalPages  := aJson.getInt('PageCount');
           fImageWidth  := aJson.getInt('ThumbWidth');
           fThumbHeight := aJson.getInt('ThumbHeight');
           fBmpWidth    := aJson.getInt('BmpWidth');
           fBmpHeight   := aJson.getInt('BmpHeight');
           sMD5         := aJson.getString('MD5');
           {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'aJson.MD5 '+sMD5);{$ENDIF}

       finally
           aJson.free;
           sl.Free;
       end;

       fLoadImagesThread := TLoadPagesThread.Create(self);
       fLoadImagesThread.PageCount := fTotalPages;
       fLoadImagesThread.FilesPath := fFilesPath;
       fLoadImagesThread.OnBmpLoaded   := imageManagerThreadOnBmpLoaded;
       fLoadImagesThread.OnBmpLoadFail := imageManagerThreadOnBmpLoadFail;
       fLoadImagesThread.resume;
       doOnIniRead(fTotalPages, fImageWidth, fThumbHeight, fBmpWidth, fBmpHeight, sMD5);

       fRunning := true;
       try
           LoadFirst;

           repeat
              pmRes := Integer(PeekMessage (Msg, hwnd(0), 0, 0, PM_REMOVE));
              if pmRes <> 0 then begin

                  TranslateMessage(Msg);
                  DispatchMessage(Msg);

                  case Msg.message of
                      THMSG_Load         : sMSG := 'THMSG_Load';
                  end;

                 {$IFNDEF NOLOG}GLog.Log(self,[lcMsgs], 'Mensagem recebida: ' + sMSG + ' w:' +inttostr(Msg.wParam)+ ' l:'+inttostr(Msg.lParam)); {$ENDIF}

                  case Msg.message of
                      THMSG_Load         : begin
                                               Load(Msg.wParam, Msg.lParam);
                      end;
                  end;
              end else begin
                  ScheduleLoadBitmap;
              end;
              sleep(50);
           until terminated;

       finally
          fRunning := false;
       end;

       FinalizeImageManagerThread;

       {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'Execute End');{$ENDIF}
       {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}

  except
      on e: exception do begin
           {$IFNDEF NOLOG}GLog.Log(self,[lcExcept], e.message); {$ENDIF}
      end;
  end;
end;

procedure TPagesManagerThread.Load(aFirstPageID, aLastPageID: integer);
var
    i : integer;
begin
   try
      {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadB start from '+inttostr(aFirstPageID+1)+' to '+inttostr(aLastPageID+1));{$ENDIF}
      fbmpGrantNoUnload.Clear;
      for i:=aLastPageID downto aFirstPageID do begin
        fbmpGrantNoUnload.add(i);
        if (fbmpCarregados.IndexOf(i)=-1) and
           (fbmpRequisitados.IndexOf(i)=-1) and
           (fbmpSchedulados.IndexOf(i)=-1) then
            fbmpRequisitados.Add(i);
      end;
      {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'fbmpRequisitados: '+fbmpRequisitados.asStringSeries);{$ENDIF}
      {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadB end from '+inttostr(aFirstPageID+1)+' to '+inttostr(aLastPageID+1));{$ENDIF}
  except
      on e: exception do begin
           {$IFNDEF NOLOG}GLog.Log(self,[lcExcept], e.message); {$ENDIF}
      end;
  end;

end;


procedure TPagesManagerThread.LoadFirst;
var
    i : integer;
    lastPageID : integer;
begin
    lastPageID := kStartLoadAtOnce-1;
    if lastPageID>fTotalPages-1 then
        lastPageID := fTotalPages-1;
    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadA from 1 to '+inttostr(lastPageID+1));{$ENDIF}

    fbmpGrantNoUnload.Clear;
    for i:=0 to lastPageID do begin                   
      fbmpGrantNoUnload.add(i);
      if (fbmpCarregados.IndexOf(i)=-1) and
         (fbmpRequisitados.IndexOf(i)=-1) then
          fbmpRequisitados.Add(i);
    end;
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'fbmpRequisitados: '+fbmpRequisitados.asStringSeries);{$ENDIF}
    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadA end from 1 to '+inttostr(LastPageID+1));{$ENDIF}

end;

{ TLoadPagesThread }

function TLoadPagesThread.loadBitmap(i: integer): boolean;
var
    retries, aMaxReadRetries : integer;
    Bmp     : TBitmap;
    Jpg     : TJPEGImage;
begin
      result := false;
      {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadBitmap '+inttostr(i));{$ENDIF}

      aMaxReadRetries := kMaxReadRetries;
      if i<kStartLoadAtOnce then aMaxReadRetries := kFirstReadTimeout div kReadInterval;
      retries := 0;
      Jpg := TJPEGImage.Create;
      Bmp := TBitmap.Create;
      try
          repeat
              try
                  Jpg.LoadFromFile(fFilesPath+inttostr(i+1)+'.jnexprint');
                  result := true;
              except
                  on e:EFOpenError do begin
                      inc(retries);
                      if (retries >= aMaxReadRetries) or terminated then begin
                          {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'loadBitmap FAILED '+inttostr(i)+' '+fFilesPath+inttostr(i+1)+'.jnexprint');{$ENDIF}
                          {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'Retries '+inttostr(aMaxReadRetries)+ ' interval '+inttostr(kReadInterval));{$ENDIF}
                          break;
                      end;
                      sleep(kReadInterval) ;
                  end;
              end;
          until result;

          if result then begin
              Bmp.Assign(Jpg);
              if (not terminated) then
              try
                 doBmpLoaded(i, Bmp);
              except
                  on e:exception do begin
                     {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'doBmpLoaded '+inttostr(i)+ 'e:'+e.message);{$ENDIF}
                  end;
              end;
          end else begin
              try
                 doBmpLoadedFail(i);
              except
                  on e:exception do begin
                     {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'doBmpLoadedFail '+inttostr(i)+ 'e:'+e.message);{$ENDIF}
                  end;
              end;
          end;

      finally
          Jpg.free;                                                                        
      end;

      {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadBitmap end');{$ENDIF}
end;


end.
