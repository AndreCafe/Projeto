unit ncPRPagesScrollBox;

interface

uses
   Windows, Messages, SysUtils, ExtCtrls, classes, controls,
   StdCtrls, graphics, forms, jpeg, Int64List, ncPRImagem, madGraphics,
   ncPRBaseClasses, ncPRThumbsScrollBox, ncPRImagesScrollBox;

const
   kBmpLabelPos    = 8;
   kBmpBorderWidth = 6;
   kDefaultColumns = 2;
   kDefBmpLeft = 10;
   kPageIniTop = 8;
   kPagesLoadAtOnce = 12;
   kMaxLoadedPages = 12;

   kMax_ZOOM_STD_VALUES = 9;
   kZOOM_STD_VALUES: array[0..kMax_ZOOM_STD_VALUES] of Double = 
    (0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 1);

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
      fLeftmostX      : integer;
      fOnPageChange   : TPageEvent;
      fOnStatusChange : TPageEvent;
      fOnIniRead      : TIniReadEvent;
      fOnFirstBmp     : TBitmapEvent;
      fBmpLeft        : integer;
      fPagesManagerThread : TPagesManagerThread;
      fParentWidth   : integer;
      fFilesPath     : string;
      fZoomType      : TZoomType;
      fForceZoom     : boolean;
      fPagePanelList : TPagePanelList;
//      fThumbsScrollBox: TThumbsScrollBox;
      procedure ScrollBoxResize(Sender: TObject);
      function  GetPagePanel(aPageNum: integer):TPagePanel;
      procedure SetZoomFactor(const Value: double; const aRepaginar: Boolean = True);
      procedure SetZoomFactorProp(const Value: double);
      procedure SetCurrentPage(const Value: integer);
      procedure SetCurrentPageInternal(const Value: integer);
      procedure imgOnClick(Sender: TObject);
      procedure imgOnDblClick(Sender: TObject);
      procedure PagesManagerThreadOnBmpReady(Sender: TObject; aPageNum:integer; aBmp:TBitmap; var aCarregou: Boolean);
      procedure PagesManagerThreadOnUnload(Sender: TObject; aPageNum:integer);
      procedure PagesManagerThreadOnFirstBmp(Sender: TObject; aPageNum:integer; aBmp:TBitmap; var aCarregou: Boolean);
      procedure PagesManagerThreadOnIniRead(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight: integer);
      procedure doParentResize;
      procedure calcVisiblePages;
      procedure SetZoomFactorUsr(const Value: double; const aRepaginar: Boolean = True);
    protected
      procedure doAfterVScroll; override;
      procedure SetParent(AParent: TWinControl); override;
      procedure repaginar;
    public
      procedure Reload(aPagNum: Integer);
      procedure requisitar(aInicio, aFim:integer; const aForce:boolean=false);
      function PageFileName(aPag: Integer): String;
      
      property Pagina[aPageNum:integer]: TPagePanel read GetPagePanel;
      property ZoomFactor: double read fZoomFactor write SetZoomFactorProp;
      property OnPageChange: TPageEvent read fOnPageChange write fOnPageChange;
      property OnStatusChange: TPageEvent read fOnStatusChange write fOnStatusChange;
      property OnIniRead : TIniReadEvent read fOnIniRead write fOnIniRead;
      property OnFirstBmp : TBitmapEvent read fOnFirstBmp write fOnFirstBmp;
      property CurrentPage: integer read fCurrentPage write SetCurrentPage;
      procedure doStatusChange(aPageNum:integer);
      procedure ToggleZoom;
      procedure ZoomToUsr(aFactor: Double; const aRepaginar: Boolean = True);
      procedure ZoomToHeight;
      procedure ZoomToWidth;
      procedure ZoomIn;
      procedure ZoomOut;
      procedure ZoomOutToMin(aMaxPages: Integer);
      procedure First;
      procedure Last;
      procedure Prior;
      procedure Next;
      procedure Clear;
      procedure NotifyProgressPrintMessage(aPage:integer); override;
      function  SelectPage(aPageNum:integer):TPagePanel;
      procedure StartLoad(aFilesPath:string; aThumbsScrollBox:TThumbsScrollBox; aPgCount, aThumbW, aThumbH, aBmpW, aBmpH: Integer);
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
      procedure SyncOnIniRead;
      procedure doOnIniRead;
      procedure LoadFirst;
      procedure Load(aFirstPageID, aLastPageID: integer);
    protected
      //procedure FinalizeImageManagerThread; override;
      procedure Execute; override;
    public
      property ThumbManagerThread : TThumbManagerThread read fThumbManagerThread write fThumbManagerThread;
      property OnIniRead  : TIniReadEvent read fOnIniRead write fOnIniRead;
      constructor Create(aImagesScrollBox : TPagesScrollBox; aFilesPath:string; aParentWidth:integer; aTotPages, aThW, aThH, aBmpW, aBmpH: Integer);
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

    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'Clear');{$ENDIF}

    if fPagesManagerThread<>nil then begin
      fPagesManagerThread.Terminate;
      fPagesManagerThread.WaitFor;
      fPagesManagerThread.free;
      fPagesManagerThread := nil;
    end;
    fPagePanelList.Clear;
    Invalidate;
end;

procedure TPagesScrollBox.imgOnClick(Sender: TObject);
begin
    doImageClick ( TComponent(Sender).Tag );
end;

procedure TPagesScrollBox.imgOnDblClick(Sender: TObject);
begin
    doImageDblClick ( TComponent(Sender).Tag );
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

procedure TPagesScrollBox.PagesManagerThreadOnFirstBmp(Sender: TObject;
  aPageNum: integer; aBmp: TBitmap; var aCarregou : Boolean);
begin
    fbmpWidth  := aBmp.width;
    fbmpHeight := aBmp.Height;
    fLastVPos  := -1;

    fZoomType := zoomUsr;
    SetZoomFactor(1);
    ZoomOut;
    ZoomIn;
    ZoomOut;

    if fImageCount>1 then 
      ZoomOutToMin(4) 
    else begin
      SetZoomFactor(1);
      while (fpanelwidth > fparentwidth) and (fZoomFactor>kZOOM_STD_VALUES[0]) do ZoomOut;
    end;
    
    SelectPage(1);

    if assigned(fOnFirstBmp) then
        fOnFirstBmp(self, 1, aBmp, aCarregou);
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
        pagePanel.Height := fpanelHeight-3;
        pagePanel.AlignWithMargins := True;
        pagePanel.Margins.Bottom := 10;
        pagePanel.Margins.Top    := 10;
        pagePanel.Margins.Left   := 0;
        pagePanel.Margins.Right  := 0;
        
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

function TPagesScrollBox.PageFileName(aPag: Integer): String;
begin
  Result := fFilesPath+inttostr(aPag)+'.jpg';
end;

procedure TPagesScrollBox.PagesManagerThreadOnBmpReady(Sender: TObject;
  aPageNum: integer; aBmp: TBitmap; var aCarregou: Boolean);
var
    pagePanel  : TPagePanel;
begin
  pagePanel := fPagePanelList[aPageNum-1];
  try
    aCarregou := False;
    if pagePanel.parent = nil then begin
      GLog.Log(self,[lcTrace],'PagesManagerThreadOnBmpReady  parent=nil '+inttostr(aPageNum));
      exit;
    end;

{    if pagePanel.img.Bitmap<>fLoadingBmp then begin
      GLog.Log(self,[lcTrace],'PagesManagerThread page '+inttostr(aPageNum)+' already exists');
      exit;
    end;}
        
    GLog.Log(self,[lcTrace],'PagesManagerThread page '+inttostr(aPageNum));
    pagePanel.Load(aBmp);
    aCarregou := True;
  finally
    FreeAndNil(aBmp);
  end;
end;

procedure TPagesScrollBox.PagesManagerThreadOnUnload(Sender: TObject; aPageNum: integer);
begin
  gLog.Log(Self, [lcTrace], 'PagesManagerThreadOnUnload - aPageNum: ' + IntToStr(aPageNum));
  TImagemPanel(fPagePanelList[aPageNum-1]).Unload;
end;

procedure TPagesScrollBox.StartLoad(aFilesPath:string; aThumbsScrollBox: TThumbsScrollBox; aPgCount, aThumbW, aThumbH, aBmpW, aBmpH: Integer);
begin
    fFilesPath := aFilesPath;
//    fThumbsScrollBox := aThumbsScrollBox;
    if fFilesPath <> '' then begin
        fPagesManagerThread := TPagesManagerThread.Create(self, fFilesPath, fParentWidth, aPgCount, aThumbW, aThumbH, aBmpW, aBmpH);
//        fPagesManagerThread.ThumbManagerThread := fThumbsScrollBox.ThumbManagerThread;
        fPagesManagerThread.OnBmpReady := PagesManagerThreadOnBmpReady;
        fPagesManagerThread.OnFirstBmp := PagesManagerThreadOnFirstBmp;
        fPagesManagerThread.OnIniRead  := PagesManagerThreadOnIniRead;
        fPagesManagerThread.OnUnload   := PagesManagerThreadOnUnload;
        fPagesManagerThread.Resume;
    end;


end;

procedure TPagesScrollBox.PagesManagerThreadOnIniRead(Sender: TObject; aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight: integer);
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
             ' '+inttostr(aBmpHeight)
    );{$ENDIF}

    fImageCount := aTotPages;
    fImageWidth := aThumbWidth;
    fImageHeight := aThumbHeight;
    fBmpWidth := aBmpWidth;
    fBmpHeight := aBmpHeight;

    InitBmps(aBmpWidth, aBmpHeight);
    
    for i:=1 to aTotPages do begin
        pagePanel := TPagePanel.create(nil);
        pagePanel.PageNum := i;
        pagePanel.BevelOuter := bvNone;
        pagePanel.ParentColor := False;
        pagePanel.Cursor := crHandPoint;
        pagePanel.ParentBackground := False;
        pagePanel.Color := kPrintBmpsPanelColor;
        pagePanel.DoubleBuffered := true;
        pagePanel.Width  := fpanelWidth;
        pagePanel.Height := fpanelHeight-3;
        pagePanel.AlignWithMargins := True;
        pagePanel.Margins.Bottom := 10;
        pagePanel.Margins.Top    := 10;
        pagePanel.Margins.Left   := 0;
        pagePanel.Margins.Right  := 0;
        pagePanel.OnClick := imgOnClick;
        pagePanel.OnDblClick := imgOnDblClick;
        pagePanel.parent := nil;

        fPagePanelList.Add(pagePanel);
    end;

    if assigned(fOnIniRead) then
        fOnIniRead(self, aTotPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight);
    SetCurrentPage(1);
end;

function TPagesScrollBox.GetPagePanel(aPageNum: integer):TPagePanel;
begin
        result := fPagePanelList[aPageNum-1];
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

procedure TPagesScrollBox.Reload(aPagNum: Integer);
var pp: TPagePanel;
begin
  pp := GetPagePanel(aPagNum);
  if pp<>nil then pp.Reload;
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
        GetPagePanel(fCurrentPage).setSelectedCustom(true, false);
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

procedure TPagesScrollBox.ZoomOutToMin(aMaxPages: Integer);
var m : integer;
begin
  if fImageCount<aMaxPages then
    m := fImagecount else
    m := aMaxPages;

  SetZoomFactor(1);
  while (fVisibleCols<m) and (fZoomFactor>kZOOM_STD_VALUES[0]) do ZoomOut;
end;

procedure TPagesScrollBox.ToggleZoom;
begin
    case fZoomType of
      zoomUsr: ZoomToHeight;
      zoomHeight: ZoomToWidth;
//      zoomWidth: ZoomToUsr;
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
       zf := Height/(img.height + kBmpBorderWidth + kBmpBorderWidth);
       fZoomType := zoomHeight;
       SetZoomFactor(zf);
    end;
end;

procedure TPagesScrollBox.ZoomToUsr(aFactor: Double; const aRepaginar: Boolean = True);
begin
    fZoomType := zoomUsr;
    fForceZoom := true;
    SetZoomFactor(aFactor, aRepaginar);
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
       zf := Width/(img.Width + kBmpBorderWidth + kBmpBorderWidth + GetSystemMetrics(SM_CXHTHUMB));
       fZoomType := zoomWidth;
       SetZoomFactor(zf);
    end;
end;

procedure TPagesScrollBox.ScrollBoxResize(Sender: TObject);
begin
   doParentResize;
end;

procedure TPagesScrollBox.SetZoomFactor(const Value: double; const aRepaginar: Boolean = True);
var
    zf : double;
    pagActual: integer;
begin
    zf := fZoomFactor;

    if (fZoomFactor <> value) or (fForceZoom) then begin
        GLog.Log(self,[lcTrace],'SetZoomFactor '+ floattostr(value) );
        fForceZoom := false;
        fZoomFactor := value;
        fpanelWidth  := trunc((fbmpWidth {+(2*kBmpBorderWidth))}*fZoomFactor));
        fpanelHeight := trunc((fbmpHeight{+(2*kBmpBorderWidth))}*fZoomFactor));
        pagActual := fLastSelected;
        if aRepaginar then 
          repaginar;
          //SelectPage(pagActual);
        self.doImageClick(pagActual);
    end;

    if fZoomType <> zoomUsr then
        fZoomFactor := zf;
end;

procedure TPagesScrollBox.SetZoomFactorProp(const Value: double);
begin
  SetZoomFactor(Value);
end;

procedure TPagesScrollBox.SetZoomFactorUsr(const Value: double; const aRepaginar: Boolean = True);
begin
    fZoomType := zoomUsr;
    SetZoomFactor(Value, aRepaginar);
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

constructor TPagesManagerThread.Create(aImagesScrollBox : TPagesScrollBox; aFilesPath:string; aParentWidth:integer; aTotPages, aThW, aThH, aBmpW, aBmpH: Integer);
begin
  inherited Create;

  fMaxLoadedPages := kMaxLoadedPages;
  fImagesScrollBox := aImagesScrollBox;
  fParentWidth := aParentWidth;
  fFilesPath := aFilesPath;

  fImageWidth := aThW;
  fThumbHeight := aThH;
  fBmpWidth := aBmpW;
  fBmpHeight := aBmpH;
  fTotalPages := aTotPages; 
end;

procedure TPagesManagerThread.doOnIniRead;
var
    bres   : boolean;
    retry  : Integer;
begin
    retry := 0;
    repeat
        GLog.Log(self,[lcMsgs],'PostThreadMessage THMSG_SetThumbCount '+inttostr(fTotalPages));
//        bres := PostThreadMessage (fThumbManagerThread.ThreadID, THMSG_SetThumbCount, fTotalPages, 0);
        if not bres then begin
           inc(retry);
           sleep(kMsgRetrySleep);
        end;
        {$IFNDEF NOLOG}
        if not bres then
             GLog.Log(self,[lcExcept],'doOnIniRead PostThreadMessage THMSG_SetThumbCount FAILED '+inttostr(fTotalPages));
        {$ENDIF}
    until terminated or (retry=kMaxMsgRetry) or bres;

    retry := 0;
    repeat
        GLog.Log(self,[lcMsgs],'PostThreadMessage THMSG_SetThumbSizes '+inttostr(fImageWidth)+' '+inttostr(fImageWidth));
//        bres := PostThreadMessage (fThumbManagerThread.ThreadID, THMSG_SetThumbSizes, fImageWidth, fThumbHeight);
        if not bres then begin
           inc(retry);
           sleep(kMsgRetrySleep);
        end;
    until terminated or (retry=kMaxMsgRetry) or bres;
    {$IFNDEF NOLOG}
    if not bres then
         GLog.Log(self,[lcExcept],'doOnIniRead PostThreadMessage THMSG_SetThumbSizes FAILED '+inttostr(fImageWidth)+' até '+inttostr(fThumbHeight));
    {$ENDIF}

    Synchronize(SyncOnIniRead);
end;

procedure TPagesManagerThread.SyncOnIniRead;
begin
    if assigned(fOnIniRead) then
        fOnIniRead(self, fTotalPages, fImageWidth, fThumbHeight, fBmpWidth, fBmpHeight);
end;
                                                         
procedure TPagesManagerThread.Execute;
var
    pmRes, Dummy : Integer;
    Msg    : TMsg;
    sMSG   : string;
begin
   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'Execute Start');{$ENDIF}

   try
       fIsFirstBmp       := true;

       fLoadImagesThread := TLoadPagesThread.Create(self);
       fLoadImagesThread.PageCount := fTotalPages;
       fLoadImagesThread.FilesPath := fFilesPath;
       fLoadImagesThread.OnBmpLoaded   := imageManagerThreadOnBmpLoaded;
       fLoadImagesThread.OnBmpLoadFail := imageManagerThreadOnBmpLoadFail;
       fLoadImagesThread.resume;
       
       doOnIniRead;

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
              Sleep(1);
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
                  Jpg.LoadFromFile(fFilesPath+inttostr(i+1)+'.jpg');
                  result := true;
              except
                  on e:EFOpenError do begin
                      inc(retries);
                      if (retries >= aMaxReadRetries) or terminated then begin
                          {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'loadBitmap FAILED '+inttostr(i)+' '+fFilesPath+inttostr(i+1)+'.jpg');{$ENDIF}
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
