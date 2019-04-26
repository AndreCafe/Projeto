unit ncPRImagesScrollBox;

interface

uses
   Windows, SysUtils, ExtCtrls, classes, controls, StdCtrls, graphics, forms, 
   ncPRImagem, ncPRBaseClasses, Messages, Int64List, SyncObjs;

type
   TPageEvent     = procedure(Sender: TObject; aPageNum:integer) of object;
   TBitmapEvent   = procedure(Sender: TObject; idx:integer; aBmp:TBitmap; var aCarregou: Boolean) of object;
   TPopulateEvent = procedure(Sender: TObject; aInicio, aFim:integer) of object;
   TIniReadEvent  = procedure(Sender: TObject; aTotalPages, aThumbWidth, aThumbHeight, aBmpWidth, aBmpHeight:integer) of object;
   TProgressEvent = procedure(Sender: TObject; aPos, aTotal:integer) of object;
   TNaoImprimirEv = function(aPagNum: Integer): boolean of object; 

   TLoadImagesThread = class;
   
   TImagesScrollBox = class(TScrollBox)
    private
      fOnImageClick     : TPageEvent;
      fOnImageDblClick  : TPageEvent;
      fLastAfterPrintPage : integer;
      procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    protected
      fImageCount   : integer;
      fImageWidth   : integer;
      fImageHeight  : integer;
      fPageHeight   : integer;
      fLastVPos     : integer;
      fScrollDown   : boolean;
      fLastSelected : integer;
      fVisibleCols  : integer;
      fVisibleRows  : integer;
      fFirstVisiblePage : integer;
      fLastVisiblePage  : integer;
      fRequisitarLastInicio : integer;
      fRequisitarLastFim    : integer;
      fLoadingBmp   : TBitmap;
      fDontPrintBmp  : TBitmap;
      fShadowBmp     : TBitmap;
      fNaoImprimir : TNaoImprimirEv;
      
      frepagLastInicio      : integer;
      frepagLastFim         : integer;
      frepagLastPanelHeight : integer;
      fScrollW  : integer;
      procedure doAfterVScroll; virtual; abstract;
      procedure doImageClick ( aPageNum:integer );
      procedure doImageDblClick ( aPageNum:integer );
      procedure ClearPanels;

      procedure InitBmps(aWidth, aHeight: Integer);
    public
      procedure CMMouseWheel(var Message: TCMMouseWheel); message CM_MOUSEWHEEL;
    
      property ScrollW : integer read fScrollW;
      property ImageCount : integer read fImageCount write fImageCount;
      property ImageWidth  : integer read fImageWidth  write fImageWidth;
      property ImageHeight : integer read fImageHeight write fImageHeight;
      property OnImageClick : TPageEvent read fOnImageClick write fOnImageClick;
      property OnImageDblClick : TPageEvent read fOnImageDblClick write fOnImageDblClick;
      property LoadingBmp    : TBitmap read fLoadingBmp;
      property DontPrintBmp: TBitmap read fDontPrintBmp;
      property ShadowBmp: TBitmap read fShadowBmp;
      procedure NotifyProgressPrintMessage(aPage:integer); virtual;
      procedure Clear;

      property NaoImprimir: TNaoImprimirEv 
        read fNaoImprimir write fNaoImprimir;

      constructor Create(AOwner: TComponent); override;
      
      destructor Destroy; override;
   end;

   TImageManagerThread = class(TThread)
    private
      fOnFirstBmp   : TBitmapEvent;
      fOnBmpReady   : TBitmapEvent;
      fOnUnload     : TPageEvent;
    protected
      fLoadImagesThread : TLoadImagesThread;
      fIdx              : integer;
      fRunning          : boolean;
      fbmpSchedulados   : TInt64List;
      fbmpFailed        : TInt64List;
      fbmpRequisitados  : TInt64List;
      fbmpCarregados    : TInt64List;
      fbmpGrantNoUnload : TInt64List;
      fBmp              : TBitmap;
      fCarregou         : Boolean;
      fIsFirstBmp       : boolean;
      fMaxLoadedPages : integer;
      procedure FinalizeImageManagerThread; 
      procedure ScheduleLoadBitmap;
      procedure SyncOnBmpReady;
      procedure doOnBmpReady(aIdx:integer; aBmp:TBitmap);
      procedure ImageManagerThreadOnBmpLoaded(Sender: TObject; idx:integer; aBmp:TBitmap; var aCarregou: Boolean);
      procedure ImageManagerThreadOnBmpLoadFail(Sender: TObject; idx:integer);
      procedure SyncOnFirstBmp;
      procedure doOnFirstBmp(aIdx:integer; aBmp:TBitmap); virtual;
    public
      property Running    : boolean read fRunning;
      property OnBmpReady : TBitmapEvent read fOnBmpReady write fOnBmpReady;
      property OnUnload   : TPageEvent read fOnUnload write fOnUnload;
      property OnFirstBmp : TBitmapEvent read fOnFirstBmp write fOnFirstBmp;
      constructor Create;
      destructor Destroy; override;
   end;

  TLoadImagesThread = class(TThread)
    private
      fIdx : integer;
      fBmp : TBitmap;
      fBusy : boolean;
      fOnBmpLoaded   : TBitmapEvent;
      fOnBmpLoadFail : TPageEvent;
      fImagesManagerThread : TImageManagerThread;
      fPageCount    : integer;
      fCarregou : Boolean;
      procedure SyncBmpLoaded;
      procedure SyncBmpLoadFail;
    protected
      fFilesPath    : string;
      function  loadBitmap(i:integer):boolean; virtual; abstract;
      procedure doBmpLoaded(idx:integer; aBmp:TBitmap);
      procedure doBmpLoadedFail(idx:integer);
      procedure Execute; override;
    public
      property Busy : boolean read fBusy;
      property FilesPath : string  read fFilesPath write fFilesPath;
      property PageCount : integer read fPageCount write fPageCount;
      property OnBmpLoaded : TBitmapEvent read fOnBmpLoaded write fOnBmpLoaded;
      property OnBmpLoadFail : TPageEvent read fOnBmpLoadFail write fOnBmpLoadFail;
      constructor Create(aImagesManagerThread : TImageManagerThread);
  end;

  procedure AngleTextOut(ACanvas: TCanvas; Angle, X, Y: integer; AStr: string);
  

implementation

{$IFNDEF NOLOG}
uses
   math,
   uLogs;
{$ENDIF}

{ TImagesScrollBox }


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

constructor TImagesScrollBox.Create(AOwner: TComponent);
begin
  inherited;
  fNaoImprimir := nil;
  fLoadingBmp := TBitmap.Create;
//  fLoadingBmp.ResamplerClassName := kResamplerCN;

  fDontPrintBmp  := TBitmap.Create;
//  fDontPrintBmp.ResamplerClassName := kResamplerCN;
  
  fShadowBmp     := TBitmap.Create;
//  fShadowBmp.ResamplerClassName := kResamplerCN;
  
  //AutoScroll  := false;
  //VertScrollBar.Visible := true;
  //HorzScrollBar.Visible := false;
end;

destructor TImagesScrollBox.Destroy;
begin
  fLoadingBmp.Free;
  fDontPrintBmp.Free;
  fShadowBmp.Free;
  inherited;
end;

procedure TImagesScrollBox.Clear;
begin
    fImageCount           :=0;
    fImageWidth           :=0;
    fImageHeight          :=0;
    fLastVPos             :=0;
    fLastSelected         :=0;
    fVisibleCols          :=1;
    fVisibleRows          :=1;
    fFirstVisiblePage     :=0;
    fLastVisiblePage      :=0;
    fRequisitarLastInicio :=0;
    fRequisitarLastFim    :=0;
    frepagLastInicio      :=-1;
    frepagLastFim         :=-1;
    frepagLastPanelHeight :=-1;

    if fLoadingBmp <> nil then
       fLoadingBmp.Empty;

    if fShadowBmp <> nil then
       fShadowBmp.Empty;

    if fDontPrintBmp <> nil then
       fDontPrintBmp.Empty;
       
    ClearPanels;
end;

procedure TImagesScrollBox.ClearPanels;
var
    i : integer;
begin
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ClearPanels ');{$ENDIF}
    for i:=ControlCount-1 downto 0 do
       Controls[i].Parent := nil;
end;

procedure TImagesScrollBox.CMMouseWheel(var Message: TCMMouseWheel);
begin
     VertScrollBar.position :=  VertScrollBar.position - Message.WheelDelta;
     if fLastVPos <> VertScrollBar.position then begin
         fScrollDown := VertScrollBar.position - fLastVPos > 0;
         {//$IFNDEF NOLOG}//GLog.Log(self,[lcMsgs],'CMMouseWheel '+inttostr(Message.WheelDelta)+ ' dwn '+inttostr(VertScrollBar.position)+' up '+booltostr(fScrollDown, true));{$ENDIF}
         fLastVPos := VertScrollBar.position;
         doAfterVScroll;
     end;
     Message.Result := 1;
     {//$IFNDEF NOLOG}//GLog.ForceLogWrite;{$ENDIF}
end;

procedure TImagesScrollBox.WMVScroll(var Message: TWMVScroll);
begin
     inherited;
     if fLastVPos <> VertScrollBar.position then begin
         fScrollDown := VertScrollBar.position - fLastVPos > 0;
         {//$IFNDEF NOLOG}//GLog.Log(self,[lcMsgs],'WMVScroll pos '+inttostr(VertScrollBar.position)+' dwn '+booltostr(fScrollDown, true));{$ENDIF}
         fLastVPos := VertScrollBar.position;
         doAfterVScroll;
     end;
     Message.Result := 1;
     {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}
end;

procedure TImagesScrollBox.doImageClick(aPageNum: integer);
begin
   if assigned(fOnImageClick) then
      fOnImageClick(Self, aPageNum);
end;

procedure TImagesScrollBox.doImageDblClick(aPageNum: integer);
begin
   if assigned(fOnImageDblClick) then
      fOnImageDblClick(Self, aPageNum);
end;

procedure TImagesScrollBox.InitBmps(aWidth, aHeight: Integer);
var
    sobraX, sobraY, lastSobraX, lastSobraY : integer;
    tz : TSize;
    angulo : double;
    lastFSize, FSize, i : integer;
begin
    fShadowBmp.Transparent := false;
    fShadowBmp.Width  := aWidth;
    fShadowBmp.Height := aHeight;
    fShadowBmp.Canvas.Brush.Color := $00C0F0F0;
    fShadowBmp.Canvas.Brush.Style := bsSolid;
    fShadowBmp.Canvas.FillRect(rect(0, 0, fShadowBmp.Width, fShadowBmp.Height));

    fLoadingBmp.TransparentMode := tmAuto;
    fLoadingBmp.Transparent     := false;
    fLoadingBmp.Width  := aWidth;
    fLoadingBmp.Height := aHeight;
    fLoadingBmp.Canvas.Brush.Color := $00D0D0D0;
    fLoadingBmp.Canvas.Brush.Style := bsSolid;
    fLoadingBmp.Canvas.FillRect(rect(0, 0, fLoadingBmp.Width, fLoadingBmp.Height));
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
    fDontPrintBmp.Width  := aWidth;
    fDontPrintBmp.Height := aHeight;
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
    FSize := 5;
    while FSize<=150 do begin
        lastSobraX := sobraX;
        lastSobraY := sobraY;
        lastFSize := FSize;
        inc(FSize,5);
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

end;

procedure TImagesScrollBox.NotifyProgressPrintMessage(aPage:integer);
begin
    fLastAfterPrintPage := aPage;
end;

{ TImageManagerThread }

constructor TImageManagerThread.Create;
begin
   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'Create');{$ENDIF}
    inherited Create(true);

    fbmpRequisitados            := TInt64List.create;
    fbmpRequisitados.SortType   := Int64SortNoneNoDup;
    fbmpSchedulados             := TInt64List.create;
    fbmpSchedulados.SortType    := Int64SortNoneNoDup;
    fbmpCarregados              := TInt64List.create;
    fbmpCarregados.SortType     := Int64SortNoneNoDup;
    fbmpGrantNoUnload           := TInt64List.create;
    fbmpFailed                  := TInt64List.create;
    fbmpFailed.SortType         := Int64SortNoneNoDup;
   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace], classname + 'created');{$ENDIF}
end;

destructor TImageManagerThread.Destroy;
begin
   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace], 'destroying '+classname);{$ENDIF}

    fbmpRequisitados.free;
    fbmpCarregados.free;
    fbmpSchedulados.free;
    fbmpGrantNoUnload.free;
    fbmpFailed.free;

    inherited;
   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace], 'Destroyed');{$ENDIF}
end;

procedure TImageManagerThread.doOnBmpReady(aIdx: integer; aBmp: TBitmap);
var
     i : integer;
begin
   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'doOnBmpReady '+inttostr(aIdx));{$ENDIF}
      fIdx := aIdx;
      fBmp := aBmp;

      i := fbmpRequisitados.IndexOf(aIdx);
      if i>-1 then begin
         gLog.Log(Self, [lcTrace], 'doOnBmpReady Requisitado ' + IntToStr(aIdx));
         fbmpRequisitados.Delete(i);
      end;
      i := fbmpSchedulados.IndexOf(aIdx);
      if i>-1 then begin
         gLog.Log(Self, [lcTrace], 'doOnBmpReady Scheduled ' + IntToStr(aIdx));
         fbmpSchedulados.Delete(i);
      end;

     {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'fbmpRequisitados: '+fbmpRequisitados.asStringSeries);{$ENDIF}
     {//$IFNDEF NOLOG}//GLog.Log(self,[lcTrace],'fbmpCarregados: '+fbmpCarregados.asStringSeries);{$ENDIF}
     {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'doOnBmpReady go Sync');{$ENDIF}
        Synchronize(SyncOnBmpReady);
      if fCarregou then  
        fbmpCarregados.add(aIdx);
     {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'doOnBmpReady SyncEvt done');{$ENDIF}
     {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}
end;


procedure TImageManagerThread.doOnFirstBmp(aIdx: integer; aBmp: TBitmap);
var
     i : integer;
begin
   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'doOnFirstBmp '+inttostr(aIdx));{$ENDIF}
      fIdx := aIdx;
      fBmp := aBmp;

      fbmpCarregados.add(aIdx);
      i := fbmpRequisitados.IndexOf(aIdx);
      if i>-1 then
         fbmpRequisitados.Delete(i);
      i := fbmpSchedulados.IndexOf(aIdx);
      if i>-1 then
         fbmpSchedulados.Delete(i);
     {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'fbmpRequisitados: '+fbmpRequisitados.asStringSeries);{$ENDIF}
     {//$IFNDEF NOLOG}//GLog.Log(self,[lcTrace],'fbmpCarregados: '+fbmpCarregados.asStringSeries);{$ENDIF}
     {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'doOnFirstBmp go Sync');{$ENDIF}
        Synchronize(SyncOnFirstBmp);
     {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'doOnFirstBmp SyncEvt done');{$ENDIF}
     {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}

end;


procedure TImageManagerThread.FinalizeImageManagerThread;
var
    i,idx: integer;
begin
    if fLoadImagesThread <> nil then begin
        fLoadImagesThread.Terminate;
        fLoadImagesThread.WaitFor;
        fLoadImagesThread.free;
        fLoadImagesThread := nil;
    end;

    if (assigned(fOnUnload)) and
       (fbmpCarregados.count>0) then begin
        {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'FinalizeImageManagerThread fbmpCarregados: '+fbmpCarregados.asStringSeries);{$ENDIF}
        {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'FinalizeImageManagerThread fbmpRequisitados: '+fbmpRequisitados.asStringSeries);{$ENDIF}
        {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'FinalizeImageManagerThread fbmpSchedulados: '+fbmpSchedulados.asStringSeries);{$ENDIF}
        {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'FinalizeImageManagerThread fbmpGrantNoUnload: '+fbmpGrantNoUnload.asStringSeries);{$ENDIF}
        for i:=fbmpCarregados.count-1 downto 0 do begin
            idx := fbmpCarregados[i];
            fOnUnload(self, idx+1);
            fbmpCarregados.delete(i);
            {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'FinalizeImageManagerThread UNLOADED : '+inttostr(idx));{$ENDIF}
        end;
    end;
end;


procedure TImageManagerThread.ScheduleLoadBitmap;
var
    i,k,idx: integer;
    bres   : boolean;
    retry  : Integer;
begin
    try
        if fbmpRequisitados.count>0 then begin
            {//$IFNDEF NOLOG}//GLog.Log(self,[lcTrace],'ScheduleLoadBitmap');{$ENDIF}
            try
               idx := fbmpRequisitados[0];
            except
               exit;
            end;
            if fbmpSchedulados.indexof(idx)=-1 then begin
                 fbmpSchedulados.Add(idx);
                 {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ScheduleLoadBitmap goPost THMSG_LoadBMP');{$ENDIF}

                 retry := 0;
                 repeat
                      GLog.Log(self,[lcMsgs],'PostThreadMessage THMSG_LoadBMP '+inttostr(idx)+' 0');
                      bres := PostThreadMessage (fLoadImagesThread.ThreadID, THMSG_LoadBMP, idx, 0);
                      if not bres then begin
                         inc(retry);
                         sleep(kMsgRetrySleep);
                      end;
                 until terminated or (retry=kMaxMsgRetry) or bres;
                 {$IFNDEF NOLOG}
                 if not bres then
                     GLog.Log(self,[lcExcept],'ScheduleLoadBitmap PostThreadMessage THMSG_LoadBMP FAILED '+inttostr(idx));
                 {$ENDIF}

            end;
        end;
        if (assigned(fOnUnload)) and
           (fbmpCarregados.count>fMaxLoadedPages) then begin
            {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ScheduleLoadBitmap fbmpCarregados: '+fbmpCarregados.asStringSeries);{$ENDIF}
            {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ScheduleLoadBitmap fbmpRequisitados: '+fbmpRequisitados.asStringSeries);{$ENDIF}
            {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ScheduleLoadBitmap fbmpSchedulados: '+fbmpSchedulados.asStringSeries);{$ENDIF}
            {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ScheduleLoadBitmap fbmpGrantNoUnload: '+fbmpGrantNoUnload.asStringSeries);{$ENDIF}
            i:=0; k:=fbmpCarregados.count-1;
            while i<k do begin
                idx := fbmpCarregados[i];
                if (fbmpGrantNoUnload.indexof(idx)=-1) then begin
                    fOnUnload(self, idx+1);
                    fbmpCarregados.delete(i);
                    dec(k);
                   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'ScheduleLoadBitmap UNLOADED : '+inttostr(idx));{$ENDIF}
                end else
                    inc(i);
                if fbmpCarregados.count<=fMaxLoadedPages then break;
            end;
        end;

    except
        on e: exception do begin
              {$IFNDEF NOLOG}GLog.Log(self,[lcExcept], e.message); {$ENDIF}
        end;
    end;
end;


procedure TImageManagerThread.SyncOnBmpReady;
begin
    if assigned(fOnBmpReady) then
        fOnBmpReady(self, fIdx+1, fBmp, fCarregou);
end;

procedure TImageManagerThread.SyncOnFirstBmp;
begin
    if assigned(fOnFirstBmp) then
        fOnFirstBmp(self, fIdx+1, fBmp, fCarregou);
end;



procedure TImageManagerThread.ImageManagerThreadOnBmpLoaded(Sender: TObject;
  idx: integer; aBmp: TBitmap; var aCarregou: Boolean);
var
     i : integer;
begin
      {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'pagesManagerThreadOnBmpLoaded '+inttostr(idx));{$ENDIF}
      if (fIsFirstBmp)  then begin
          fIsFirstBmp := false;
          try
             doOnFirstBmp(idx, aBmp);
          except
             on e:Exception do
                {$IFNDEF NOLOG}GLog.Log(self,[lcExcept],'pagesManagerThreadOnBmpLoaded doOnFirstBmp e:'+e.message);{$ENDIF}
          end;
      end;
      if not terminated then begin
          doOnBmpReady(idx, aBmp);
      end;
      i := fbmpFailed.IndexOf(Idx);
      if i>-1 then
         fbmpFailed.Delete(i);
      {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'pagesManagerThreadOnBmpLoaded end');{$ENDIF}
 end;

procedure TImageManagerThread.ImageManagerThreadOnBmpLoadFail(Sender: TObject;
  idx: integer);
var
     i : integer;
begin
    {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'pagesManagerThreadOnBmpLoadFail '+inttostr(Idx));{$ENDIF}
    i := fbmpRequisitados.IndexOf(Idx);
    if i>-1 then
       fbmpRequisitados.Delete(i);
    i := fbmpSchedulados.IndexOf(Idx);
    if i>-1 then
       fbmpSchedulados.Delete(i);
    fbmpFailed.add(idx);
    {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}
end;


{ TLoadImagesThread }

constructor TLoadImagesThread.Create(aImagesManagerThread : TImageManagerThread);
begin
    inherited Create(true);
    fImagesManagerThread := aImagesManagerThread;
end;

procedure TLoadImagesThread.Execute;
var
  Msg : TMsg;
  pmRes, Dummy : integer;
  sMSG : string;
begin
  {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'Execute start');{$ENDIF}
  while not Terminated do begin
      pmRes := Integer(PeekMessage(Msg, hwnd(0), 0, 0, PM_REMOVE));
      if pmRes <> 0 then begin

          TranslateMessage(Msg);
          DispatchMessage(Msg);

          case Msg.message of
              THMSG_LoadBMP  : sMSG := 'THMSG_LoadBMP';
          end;

          GLog.Log(self,[lcMsgs], 'Mensagem recebida: ' + sMSG + ' w:' +inttostr(Msg.wParam)+ ' l:'+inttostr(Msg.lParam));

          case Msg.message of
            THMSG_LoadBMP : begin
                            {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'THMSG_LoadBMP '+inttostr(msg.wParam));{$ENDIF}
                            fBusy := true;
                            try
                               loadBitmap(msg.wParam);
                            finally
                               fBusy := false;
                            end;
              end;
          end;

      end else
        Sleep(1);
  end;
  {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'Execute end');{$ENDIF}
  {$IFNDEF NOLOG}GLog.ForceLogWrite;{$ENDIF}
end;


procedure TLoadImagesThread.doBmpLoaded(idx:integer; aBmp:TBitmap);
begin
    fIdx := idx;
    fBmp := aBmp;
    try
        Synchronize(fImagesManagerThread, SyncBmpLoaded);
    except
      on e:exception do begin
           {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'doBmpLoaded '+inttostr(idx)+ ' e:'+e.message );{$ENDIF}
      end
    end;
end;

procedure TLoadImagesThread.doBmpLoadedFail(idx: integer);
begin
    fIdx := idx;
    try
        Synchronize(fImagesManagerThread, SyncBmpLoadFail);
    except
      on e:exception do begin
           {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'doBmpLoadedFail '+inttostr(idx)+ 'e:'+e.message );{$ENDIF}
      end
    end;
end;

procedure TLoadImagesThread.SyncBmpLoaded;
begin
   if (assigned(fOnBmpLoaded)) then
    try
        fCarregou := False;
        fOnBmpLoaded(self, fIdx, fBmp, fCarregou);
    except
      on e:exception do begin
           {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'SyncBmpLoaded '+inttostr(fIdx)+ ' e:'+e.message );{$ENDIF}
      end
    end;
end;

procedure TLoadImagesThread.SyncBmpLoadFail;
begin
   if (assigned(fOnBmpLoadFail)) then
    try
        fOnBmpLoadFail(self, fIdx);
    except
      on e:exception do begin
           {$IFNDEF NOLOG} GLog.Log(self,[lcExcept],'SyncBmpLoadFail '+inttostr(fIdx)+ 'e:'+e.message );{$ENDIF}
      end
    end;
end;

end.
