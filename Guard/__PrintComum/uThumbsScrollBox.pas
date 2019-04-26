unit uThumbsScrollBox;

interface

uses
   Windows, SysUtils, ExtCtrls, classes, controls, StdCtrls, graphics, forms,
   uImagem, uPrintManBaseClasses, uImagesScrollBox;

const
   kThumbWidth = 200;
   kThumbBorderWidth = 4;
   kThumbIniTop = 2;
   kLabelHeight = 16;
   kPopulateQThumbs = 100;

type
  TThumbManagerThread = class;
  TLoadThumbsThread   = class;
  TPopulateThumbsThread  = class;
  
  TThumbsScrollBox = class(TImagesScrollBox)
    private
      fThumbLeft : integer;
      fLastTop : integer;
      fThumbManagerThread: TThumbManagerThread;
      fThumbsPanelList : TThumbPanelList;
      fFilesPath : string;
      fPopulateThumbsThread : TPopulateThumbsThread;
      procedure ScrollBoxResize(Sender: TObject);
      procedure imgOnClick(Sender: TObject);
      procedure imgOnDblClick(Sender: TObject);
      procedure ThumbManagerThreadOnThumbReady(Sender: TObject; aPageNum:integer; aThumb:TBitmap);
      procedure ThumbManagerThreadOnUnload(Sender: TObject; aPageNum:integer);
      procedure ThumbManagerThreadOnThumbSize(Sender: TObject);
      procedure doParentResize;
      function  GetPageControl(aPageNum: integer):TThumbPanel;
      procedure calcVisiblePages;
      procedure requisitar(aInicio, aFim:integer; const aForce:boolean=false);
      procedure make1Panel(aPage:integer);
      procedure PopulateThumbsThreadOnPopulate(Sender: TObject; aInicio, aFim:integer);
      procedure PopulateThumbsThreadOnContinue(Sender: TObject);
    protected
      procedure doAfterVScroll; override;
      procedure SetParent(AParent: TWinControl); override;
    public
      property ThumbManagerThread : TThumbManagerThread read fThumbManagerThread;
      procedure Clear;
      procedure goUp(const aX:integer =1);
      procedure goDown(const aX:integer =1);
      function  GetLabel(aPageNum: integer):TLabel2;
      procedure StartLoad(aFilesPath:string);
      function  SelectThumb(aPageNum:integer):TThumbPanel;
      procedure doIniRead(aTotPages, aThumbWidth, aThumbHeight: integer);
      procedure NotifyProgressPrintMessage(aPage:integer); override;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
  end;

  TThumbManagerThread = class(TImageManagerThread)
    private
      fThumbsScrollBox : TThumbsScrollBox;
      fFilesPath : string;
      fOnThumbSize  : TNotifyEvent;
      fImageCount  : integer;
      fImageWidth   : integer;
      fImageHeight  : integer;
      procedure SyncOnThumbSize;
      procedure doOnThumbSize;
      procedure Load(aFirstPageID, aLastPageID: integer);
    protected
      //procedure FinalizeImageManagerThread; override;
      procedure Execute; override;
      procedure doOnFirstBmp(aIdx:integer; aBmp:TBitmap); override;
    public
      property FilesPath : string read fFilesPath write fFilesPath;
      property OnThumbSize : TNotifyEvent read fOnThumbSize write fOnThumbSize;
      constructor Create(aFilesPath:string; aThumbsScrollBox : TThumbsScrollBox);
      destructor Destroy; override;
  end;

  TPopulateThumbsThread = class(TThread)
    private
      fOnPopulate    : TPopulateEvent;
      fOnContinue    : TNotifyEvent;
      fInicio      : integer;
      fFim         : integer;
      fTotalPages  : integer;
      procedure SyncOnPopulate;
      procedure doOnPopulate(aInicio, aFim:integer);
      procedure SyncOnContinue;
      procedure doOnContinue;
    protected
      procedure Execute; override;
    public
      property TotalPages    : integer read fTotalPages write fTotalPages;
      property OnPopulate    : TPopulateEvent read fOnPopulate    write fOnPopulate;
      property OnContinue    : TNotifyEvent   read fOnContinue    write fOnContinue;
      constructor Create;
  end;

  TLoadThumbsThread = class(TLoadImagesThread)
    protected
      function  loadBitmap(i:integer):boolean; override;
  end;

implementation
  uses
  {$IFNDEF NOLOG}
  math,
  uLogs;
  {$ENDIF}

{ TThumbManagerThread }

constructor TThumbManagerThread.Create(aFilesPath:string; aThumbsScrollBox : TThumbsScrollBox);
begin
  inherited Create;

  fMaxLoadedPages := kScrollPage;
  fFilesPath      := aFilesPath;
  fThumbsScrollBox := aThumbsScrollBox;
end;

destructor TThumbManagerThread.Destroy;
begin
  inherited Destroy;
end;

procedure TThumbManagerThread.doOnFirstBmp(aIdx: integer; aBmp: TBitmap);
begin
  // do nothing
end;

procedure TThumbManagerThread.doOnThumbSize;
begin
      Synchronize(SyncOnThumbSize);
end;

procedure TThumbManagerThread.SyncOnThumbSize;
begin
    if assigned(fOnThumbSize) then
        fOnThumbSize(self);
end;

procedure TThumbManagerThread.Execute;
var
    i, a2 : integer;
    thumb : TBitmap;
    pmRes  : Integer;
    Msg : TMsg;
    canLoadFirst : boolean;
    sMSG : string;
begin
   {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'Execute Start');{$ENDIF}


   canLoadFirst := false;
   fRunning := true;
   try
       repeat
          pmRes := Integer(PeekMessage (Msg, hwnd(0), 0, 0, PM_REMOVE));
          if pmRes <> 0 then begin

              TranslateMessage(Msg);
              DispatchMessage(Msg);

              case Msg.message of
                  THMSG_ThumbLoad     : sMSG := 'THMSG_ThumbLoad';
                  THMSG_SetThumbCount : sMSG := 'THMSG_SetThumbCount';
                  THMSG_SetThumbSizes : sMSG := 'THMSG_SetThumbSizes';
              end;

              GLog.Log(self,[lcMsgs], 'Mensagem recebida: ' + sMSG + ' w:' +inttostr(Msg.wParam)+ ' l:'+inttostr(Msg.lParam));

              case Msg.message of
                  THMSG_SetThumbCount : begin
                      fImageCount := msg.wParam;
                      fThumbsScrollBox.ImageCount := fImageCount;
                  end;
                  THMSG_SetThumbSizes : begin
                      fImageWidth  := msg.wParam;
                      fImageHeight := msg.lParam;
                      fThumbsScrollBox.ImageWidth  := fImageWidth;
                      fThumbsScrollBox.ImageHeight := fImageHeight;
                      doOnThumbSize;
                  end;

                  THMSG_ThumbLoad         : begin
                      if fLoadImagesThread=nil then begin
                          fLoadImagesThread := TLoadThumbsThread.Create(self);
                          fLoadImagesThread.PageCount := fImageCount;
                          fLoadImagesThread.FilesPath := fFilesPath;
                          fLoadImagesThread.OnBmpLoaded   := imageManagerThreadOnBmpLoaded;
                          fLoadImagesThread.OnBmpLoadFail := imageManagerThreadOnBmpLoadFail;
                          fLoadImagesThread.resume;
                      end;
                      Load(Msg.wParam, Msg.lParam);
                  end;
              end;
          end else begin
              ScheduleLoadBitmap;
              if canLoadFirst then begin
                  a2 := kScrollPage;
                  if a2> fImageCount then
                      a2 := fImageCount;
                  for i:=0 to a2-1 do begin
                      if terminated then break;
                      thumb := TBitmap.Create;
                      thumb.LoadFromFile(fFilesPath+inttostr(i+1)+'.bnexprint');
                      if not terminated then
                          doOnBmpReady(i, thumb);
                  end;
                  canLoadFirst := false;
              end;
          end;
          sleep(50);

       until terminated;
   finally
       fRunning := false;
   end;

   FinalizeImageManagerThread;

   {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'Execute End');{$ENDIF}
   {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}

end;

procedure TThumbManagerThread.Load(aFirstPageID, aLastPageID: integer);
var
    i : integer;
begin
    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadC start from '+inttostr(aFirstPageID+1)+' to '+inttostr(aLastPageID+1));{$ENDIF}
    fbmpGrantNoUnload.Clear;
    for i:=aLastPageID downto aFirstPageID do begin
      fbmpGrantNoUnload.add(i);
      if (fbmpCarregados.IndexOf(i)=-1) and
         (fbmpRequisitados.IndexOf(i)=-1) and
         (fbmpSchedulados.IndexOf(i)=-1) then
          fbmpRequisitados.Add(i);
    end;
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'fbmpRequisitados: '+fbmpRequisitados.asStringSeries);{$ENDIF}
    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadC end from '+inttostr(aFirstPageID+1)+' to '+inttostr(aLastPageID+1));{$ENDIF}

end;

{ TThumbsScrollBox }

constructor TThumbsScrollBox.Create(AOwner: TComponent);
begin
  inherited;
  fVisibleCols  := 1;
  Align := alClient;
  borderStyle := bsNone;
  fLastTop := kThumbIniTop;
  OnResize := ScrollBoxResize;
  fThumbsPanelList := TThumbPanelList.create;
  fThumbManagerThread := TThumbManagerThread.Create(fFilesPath, self);
  fThumbManagerThread.OnBmpReady := ThumbManagerThreadOnThumbReady;
  fThumbManagerThread.OnUnload   := ThumbManagerThreadOnUnload;
  fThumbManagerThread.OnThumbSize  := ThumbManagerThreadOnThumbSize;
  fThumbManagerThread.Resume;
  doParentResize;
end;

destructor TThumbsScrollBox.Destroy;
begin
  Clear;
  if fThumbManagerThread<>nil then begin
      fThumbManagerThread.Terminate;
      fThumbManagerThread.WaitFor;
      fThumbManagerThread.free;
      fThumbManagerThread := nil;
  end;
  fThumbsPanelList.free;
  Parent := nil;
  inherited;
end;

procedure TThumbsScrollBox.Clear;
begin
    inherited;

    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'Clear');{$ENDIF}
    fLastTop := kThumbIniTop;
    if fThumbManagerThread<>nil then begin
        fThumbManagerThread.Terminate;
        fThumbManagerThread.WaitFor;
        fThumbManagerThread.free;
        fThumbManagerThread := nil;
    end;
    fThumbManagerThread := TThumbManagerThread.Create(fFilesPath, self);
    fThumbManagerThread.OnBmpReady := ThumbManagerThreadOnThumbReady;
    fThumbManagerThread.OnUnload   := ThumbManagerThreadOnUnload;
    fThumbManagerThread.OnThumbSize  := ThumbManagerThreadOnThumbSize;
    fThumbManagerThread.Resume;
    fThumbsPanelList.Clear;
    Invalidate;

end;

procedure TThumbsScrollBox.doAfterVScroll;
begin
    calcVisiblePages;
end;

procedure TThumbsScrollBox.make1Panel(aPage:integer);
var
    ThumbPanel : TThumbPanel;
begin
        {//$IFNDEF NOLOG}//GLog.Log(self,[lcTrace],'PopulateThumbPanel '+inttostr(aPageNum) );{$ENDIF}
        ThumbPanel := TThumbPanel.create(nil);
        ThumbPanel.Width  := fImageWidth  + kThumbBorderWidth + kThumbBorderWidth;
        ThumbPanel.Height := fImageHeight + kThumbBorderWidth + kThumbBorderWidth;
        ThumbPanel.left   := fThumbLeft;
        ThumbPanel.PageNum := aPage;
        ThumbPanel.BevelOuter := bvNone;
        ThumbPanel.Color := kPrintThumbsPanel;

        with ThumbPanel do begin
            lb.font.color := clWhite;
            lb.font.name := 'Verdana';
            lb.font.size := 10;
            lb.left := fThumbLeft + kThumbBorderWidth;
            lb.font.Style := [fsBold];
            lb.Caption := inttostr(aPage);
            lb.top :=  ((aPage-1) * fPageHeight) + kThumbIniTop;
            ThumbPanel.top := lb.top + lb.height;
            lb.Parent := self;

            img.Width      := fImageWidth;
            img.Height     := fImageHeight;
            img.Top        := kThumbBorderWidth;
            img.left       := kThumbBorderWidth;
            img.Bitmap     := LoadingBmp;
            img.OnClick    := imgOnClick;
            img.OnDblClick := imgOnDblClick;
            img.Parent := ThumbPanel;
        end;
        ThumbPanel.Parent := self;

        fThumbsPanelList.Add(ThumbPanel);
end;

procedure TThumbsScrollBox.doIniRead(aTotPages, aThumbWidth, aThumbHeight: integer);
begin
    if aTotPages=0 then exit;
    fImageWidth  := aThumbWidth;
    fImageHeight := aThumbHeight;
    fPageHeight  := fImageHeight + kThumbBorderWidth + kThumbBorderWidth + kLabelHeight;

    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'doIniRead TotPages '+inttostr(aTotPages) );{$ENDIF}
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}
    fPopulateThumbsThread := TPopulateThumbsThread.Create;
    fPopulateThumbsThread.TotalPages := aTotPages;
    fPopulateThumbsThread.OnPopulate := PopulateThumbsThreadOnPopulate;
    fPopulateThumbsThread.OnContinue := PopulateThumbsThreadOnContinue;
    fPopulateThumbsThread.Resume;

    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'doIniRead ends' );{$ENDIF}
    {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}
end;

procedure TThumbsScrollBox.PopulateThumbsThreadOnContinue(Sender: TObject);
begin
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'PopulateThumbsThreadOnContinue' );{$ENDIF}
    calcVisiblePages;
end;

procedure TThumbsScrollBox.PopulateThumbsThreadOnPopulate(Sender: TObject;
  aInicio, aFim: integer);
var
    i : integer;
begin
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'PopulateThumbPanel '+inttostr(aInicio) + ' ' +inttostr(aFim) );{$ENDIF}
    for i:=aInicio to aFim do
       make1Panel(i);
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'PopulateThumbsThreadOnPopulate end' );{$ENDIF}
end;

procedure TThumbsScrollBox.calcVisiblePages;
var
    aVisiblePanel, p: TThumbPanel;
    aPage : integer;
    panelHeight   : integer;
begin
    if fImageHeight = 0 then exit;
    panelHeight := fImageHeight + kLabelHeight + kThumbBorderWidth + kThumbBorderWidth;

    aPage := trunc( ((VertScrollBar.position - kThumbIniTop) div panelHeight) )+1;
    if aPage > (ControlCount div 2) then
        aPage := ControlCount div 2;
    aVisiblePanel := GetPageControl( aPage );
    assert(aVisiblePanel<>nil);

    fFirstVisiblePage := aPage;

    fVisibleRows := (Height div panelHeight) + 1;
    fLastVisiblePage := aPage + fVisibleRows -1;
    if fLastVisiblePage > (ControlCount div 2)  then
        fLastVisiblePage := ControlCount div 2;
    p := GetPageControl( fLastVisiblePage );
    if (p<>nil) and (
        (Height)>
        ((PanelHeight + aVisiblePanel.top) + ((fVisibleRows-1)*PanelHeight))
        ) then begin
            inc(fVisibleRows);
            fLastVisiblePage := aPage + (fVisibleRows*fVisibleCols) -1;
            if fLastVisiblePage > (ControlCount div 2)  then
               fLastVisiblePage := ControlCount div 2;
        end;


    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'calcVisiblePages pos '+inttostr(VertScrollBar.position)+' dwn '+booltostr(fScrollDown, true));{$ENDIF}
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'calcVisiblePages panel '+inttostr(aVisiblePanel.PageNum)+
             ' top '+inttostr(aVisiblePanel.top)+
             ' top-vp '+inttostr(aVisiblePanel.top-VertScrollBar.position));{$ENDIF}

    requisitar( fFirstVisiblePage, fLastVisiblePage)
end;

procedure TThumbsScrollBox.requisitar(aInicio, aFim:integer; const aForce:boolean=false);
var
    retry : integer;
    bres   : boolean;
begin
    if not aForce and ((aInicio=fRequisitarLastInicio) and (aFim=fRequisitarLastFim)) then exit;
    fRequisitarLastInicio := aInicio;
    fRequisitarLastFim := aFim;
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'requisitar '+inttostr(aInicio)+' até '+inttostr(aFim));{$ENDIF}
    // esta em pag, diminuir
    if not fThumbManagerThread.Running then begin
        {$IFNDEF NOLOG}GLog.Log(self,[lcExcept],'fThumbManagerThread is not running');{$ENDIF}
        exit;
    end;

    retry := 0;
    repeat
        GLog.Log(self,[lcMsgs],'PostThreadMessage THMSG_ThumbLoad '+inttostr(aInicio-1)+' '+inttostr(aFim-1));
        bres := PostThreadMessage (fThumbManagerThread.ThreadID, THMSG_ThumbLoad, aInicio-1,aFim-1);
        if not bres then begin
           inc(retry);
           sleep(kMsgRetrySleep);
        end;
    until (retry=kMaxMsgRetry) or bres;
    {$IFNDEF NOLOG}
    if not bres then
       GLog.Log(self,[lcExcept],'requisitar PostThreadMessage THMSG_ThumbLoad FAILED '+inttostr(aInicio-1)+' até '+inttostr(aFim-1));
    {$ENDIF}
end;

procedure TThumbsScrollBox.doParentResize;
begin
      fScrollW  := GetSystemMetrics(SM_CXHTHUMB);
      if Parent<>nil then begin
          Width := Parent.Width;// - ScrollW;
          fThumbLeft := ((Width - fScrollW - kThumbWidth ) div 2) -  kThumbBorderWidth;
      end;
end;

procedure TThumbsScrollBox.ThumbManagerThreadOnThumbSize(Sender: TObject);
var
    proxrange : integer;
    sobraX, lastSobraX, lastSobraY : integer;
    tz : TSize;
    lastFSize, FSize : integer;
begin
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ThumbManagerThreadOnThumbSize');{$ENDIF}
    fLoadingBmp.TransparentMode := tmAuto;
    fLoadingBmp.Transparent     := true;
    fLoadingBmp.Width  := fImageWidth;
    fLoadingBmp.Height := fImageHeight;
    fLoadingBmp.Canvas.Brush.Color := $00D0D0D0;
    fLoadingBmp.Canvas.Brush.Style := bsSolid;
    fLoadingBmp.Canvas.FillRect(rect(0,0,fLoadingBmp.Width, fLoadingBmp.Height));
    fLoadingBmp.Canvas.Font.Name  := 'Verdana';
    fLoadingBmp.Canvas.Font.Style := [];
    fLoadingBmp.Canvas.Font.Color  := $00F0E0E0;

    lastFSize := 0;
    sobraX := 0;
    lastSobraX := 0;
    FSize := 4;
    while FSize<=36 do begin
        lastSobraX := sobraX;
        lastFSize := FSize;
        inc(FSize,1);
        fLoadingBmp.Canvas.Font.Size  := FSize;
        tz := fLoadingBmp.Canvas.TextExtent( kCarregando);

        sobraX := (fLoadingBmp.Width  - tz.cx) div 2;

        if (sobraX<10) then
           break;
    end;
    lastSobraY := (fLoadingBmp.Height  - tz.cy) div 2;
    fLoadingBmp.Canvas.Font.Size  := lastFSize;
    fLoadingBmp.Canvas.TextOut( lastSobraX, lastSobraY, kCarregando);

    proxrange := fImageCount * fPageHeight;
    if proxrange < Height+1 then
        VertScrollBar.Range := Height+ 1
    else
        VertScrollBar.Range := proxrange;

end;

procedure TThumbsScrollBox.ThumbManagerThreadOnUnload(Sender: TObject;
  aPageNum: integer);
var
    ThumbPanel : TThumbPanel;
begin
    ThumbPanel := fThumbsPanelList[aPageNum-1];
    if ThumbPanel.img.Bitmap=fLoadingBmp then begin
        {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ThumbManagerThreadOnUnload page '+inttostr(aPageNum)+' do not exist');{$ENDIF}
        exit;
    end;
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ThumbManagerThreadOnUnload page '+inttostr(aPageNum));{$ENDIF}
    ThumbPanel.img.Bitmap:= fLoadingBmp;
    FreeAndNil(ThumbPanel.bmpImagem);

    {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}
end;

procedure TThumbsScrollBox.ThumbManagerThreadOnThumbReady(Sender: TObject;
  aPageNum: integer; aThumb: TBitmap);
var
    ThumbPanel : TThumbPanel;
begin
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ThumbManagerThreadOnThumbReady '+inttostr(aPageNum));{$ENDIF}

        ThumbPanel := fThumbsPanelList[aPageNum-1];
        assert(ThumbPanel<>nil);
        with ThumbPanel do begin
            bmpImagem := TBitmap.Create;
            bmpImagem.PixelFormat := pf24bit;
            bmpImagem.Assign(aThumb);
            FreeAndNil(aThumb);
            img.Bitmap := bmpImagem;
            img.Parent := ThumbPanel;
        end;

end;

function TThumbsScrollBox.GetLabel(aPageNum: integer): TLabel2;
var
    i : integer;
begin
    result := nil;
    for i:=0 to ControlCount-1 do begin
      if (Controls[i] is TLabel2) and
         (TLabel2(Controls[i]).PageNum = aPageNum)  then begin
           result := TLabel2(Controls[i]);
           break;
         end;
    end;
end;

function TThumbsScrollBox.GetPageControl(aPageNum: integer): TThumbPanel;
var
    i : integer;
begin
    result := nil;
    for i:=0 to ControlCount-1 do begin
      if (Controls[i] is TThumbPanel) and
         (TThumbPanel(Controls[i]).pageNum = aPageNum)  then begin
           result := TThumbPanel(Controls[i]);
           break;
         end;
    end;
end;

procedure TThumbsScrollBox.goDown(const aX: integer);
var
    newVal : integer;
    fY : integer;
begin
    fy := 1;
    case aX of
      2 : fy := (VertScrollBar.Range div fPageHeight) div 20;
      3 : fy := (VertScrollBar.Range div fPageHeight) div 10;
    end;
    newVal := VertScrollBar.position +
       (((height div fPageHeight)*fPageHeight) * fy);

    if newVal>VertScrollBar.Range then newVal := VertScrollBar.Range;
    VertScrollBar.position := newVal;
    doAfterVScroll;
end;

procedure TThumbsScrollBox.goUp(const aX: integer);
var
    newVal : integer;
    fY : integer;
begin
    fy := 1;
    case aX of
      2 : fy := (VertScrollBar.Range div fPageHeight) div 20;
      3 : fy := (VertScrollBar.Range div fPageHeight) div 10;
    end;
    newVal := VertScrollBar.position -
       (((height div fPageHeight)*fPageHeight) * fy);
    if newVal<0 then newVal := 0;
    VertScrollBar.position := newVal;
    doAfterVScroll;
end;

function TThumbsScrollBox.SelectThumb(aPageNum: integer):TThumbPanel;
begin
    if fLastSelected > 0 then
        GetPageControl(fLastSelected).Selected := false;
    result := GetPageControl(aPageNum);
    if result<>nil then begin
        result.Selected := true;
        fLastSelected := aPageNum;
        calcVisiblePages;
    end;
end;

procedure TThumbsScrollBox.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);
  if AParent<> nil then begin
      doParentResize;
      fThumbLeft := ( Width - kThumbWidth ) div 2;
  end;
end;

procedure TThumbsScrollBox.StartLoad(aFilesPath:string);
begin
    fFilesPath := aFilesPath;
    fThumbManagerThread.FilesPath := fFilesPath;
end;

procedure TThumbsScrollBox.imgOnClick(Sender: TObject);
begin
    doImageClick ( TImagem(Sender).PageNum );
end;

procedure TThumbsScrollBox.imgOnDblClick(Sender: TObject);
begin
    doImageDblClick ( TImagem(Sender).PageNum );
end;

procedure TThumbsScrollBox.NotifyProgressPrintMessage(aPage: integer);
begin
    inherited;

    if (aPage>=fFirstVisiblePage) and (aPage<=fLastVisiblePage) then
        requisitar( fFirstVisiblePage, fLastVisiblePage, true);
end;

procedure TThumbsScrollBox.ScrollBoxResize(Sender: TObject);
begin
   doParentResize;
end;


{ TLoadThumbsThread }


function TLoadThumbsThread.loadBitmap(i: integer): boolean;
var
    retries, aMaxReadRetries : integer;
    thumb     : TBitmap;
begin
      result := false;
      {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadBitmap '+inttostr(i));{$ENDIF}

      aMaxReadRetries := kMaxReadRetries;
      if i<kStartLoadAtOnce then aMaxReadRetries := kFirstReadTimeout div kReadInterval;
      retries := 0;
      thumb := TBitmap.Create;
      repeat
          try
              thumb.LoadFromFile(fFilesPath+inttostr(i+1)+'.bnexprint');
              result := true;
          except
              on e:EFOpenError do begin
                  inc(retries);
                  if (retries >= aMaxReadRetries) or terminated then begin
                      {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'loadBitmap FAILED '+inttostr(i)+' '+fFilesPath+inttostr(i+1)+'.bnexprint');{$ENDIF}
                      {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'Retries '+inttostr(aMaxReadRetries)+ ' interval '+inttostr(kReadInterval));{$ENDIF}
                      break;
                  end;
                  sleep(kReadInterval) ;
              end;
          end;
      until result;

      if result then begin
          if (not terminated) then
             doBmpLoaded(i, thumb);
      end else
             doBmpLoadedFail(i);
      {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'loadBitmap end');{$ENDIF}
end;


{ TPopulateThumbsThread }



procedure TPopulateThumbsThread.SyncOnContinue;
begin
    if assigned(fOnContinue) then
        fOnContinue(self);
end;

procedure TPopulateThumbsThread.SyncOnPopulate;
begin
    if assigned(fOnPopulate) then
        fOnPopulate(self, fInicio, fFim);
end;

constructor TPopulateThumbsThread.Create;
begin
    inherited create(true);
    freeonterminate := true;
end;

procedure TPopulateThumbsThread.doOnContinue;
begin
    Synchronize(SyncOnContinue);
end;

procedure TPopulateThumbsThread.doOnPopulate(aInicio, aFim:integer);
begin
    fInicio := aInicio;
    fFim    := aFim;
    Synchronize(SyncOnPopulate);
end;

procedure TPopulateThumbsThread.Execute;
var
   Inicio, Fim : integer;
begin
  {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'TPopulateThumbsThread start');{$ENDIF}
  inherited;

  Inicio := 1;
  Fim    := kPopulateQThumbs;
  while Fim < fTotalPages+kPopulateQThumbs do begin
     if Fim>fTotalPages then
        Fim := fTotalPages;
     doOnPopulate(Inicio, Fim);
     if inicio=1 then doOnContinue;
     inc(Inicio, kPopulateQThumbs);
     inc(Fim, kPopulateQThumbs);
     sleep(200);
  end;

  {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'TPopulateThumbsThread end');{$ENDIF}
  {$IFNDEF NOLOG} GLog.ForceLogWrite; {$ENDIF}

end;

end.
