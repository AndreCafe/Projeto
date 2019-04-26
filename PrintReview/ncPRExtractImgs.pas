unit ncPRExtractImgs;

interface

uses
  SysUtils,
  strUtils,
  windows,
  messages,
  classes,
  graphics,
  jpeg,
  gtPDFClasses,
  gtCstPDFDoc,
  gtExPDFDoc,
  gtExProPDFDoc,
  gtPDFDoc,
  ncPRConsts,
  uLogs,
  madKernel,
  ncDebug;

const
    kThumbWidth      = 200;  
    kMinPages        = 5;

    kThumbExt = '.bnexprint';
    kPageExt  = '.jpg';

type
   TncExtImgInfo = class
     iiTotPages,
     iiThumbW,
     iiThumbH,
     iiBmpW,
     iiBmpH     : Integer;
   end;
  
   TOnTerminar = function : Boolean of object;

   TncPDFExtractImgs = class
   private
     FOnTerminar : TOnTerminar;
     FPDFDoc     : TgtExProPDFDocument;
     FViewerHWND : HWND;
     FDirDest : String;
     FArq : String;
     FArqID : Integer;
     FuseMMF : Boolean;
     FAdmin : Boolean;
     FmmfHandle : HWND;
     FmmfData   : Pointer;
     FWinSession : Integer;
     
     function Terminar: Boolean;

     procedure PostMsg(aMsg: Integer; lPar: lParam);

     procedure PrepareDirDest;
     
     procedure SetUseMMF(const Value: Boolean);
   public
     constructor Create(aArq: String; aArqID: Integer; aViewerHWND: HWND; aAdmin: Boolean; aWinSession: Integer = -1); 
      
     destructor Destroy; override;

     property UseMMF: Boolean
       read FUseMMF write SetUseMMF;

     function Processar: Boolean;  

     property OnTerminar: TOnTerminar read FOnTerminar write FOnTerminar;
   end;  

   TThreadExtImgs = class ( TThread )
   private
     FViewerHWND : HWND;
     FArq : String;
     FArqID: Integer;
     FAdmin: Boolean;
   protected
     procedure Execute; override;
     function OnTerminar: Boolean;
   public
     constructor Create(aArq: String; aArqID: Integer; aAdmin: Boolean; aViewerHWND: HWND);  
   end;
   
implementation


{ TncPDFExtractImgs }

constructor TncPDFExtractImgs.Create(aArq: String; aArqID: Integer; aViewerHWND: HWND; aAdmin: Boolean; aWinSession: Integer = -1);
begin
  FOnTerminar := nil;
  FViewerHWND := aViewerHWND;
  FArq := aArq;
  FAdmin := aAdmin;
  FArqID := aArqID;
  FPDFDoc := TgtExProPDFDocument.create(nil); 
  FUseMMF := False;
  FMMFHandle := 0;
  FWinSession := aWinSession;
  FMMFData := nil;
end;

destructor TncPDFExtractImgs.Destroy;
begin
  UseMMF := False;
  FPDFDoc.Free;
  inherited;
end;

function TncPDFExtractImgs.Terminar: Boolean;
begin
  if Assigned(FOnTerminar) then 
    Result := FOnTerminar 
  else
  if FUseMMF then 
    Result := (Byte(FMMFData^)=1);
end;

procedure TncPDFExtractImgs.PostMsg(aMsg: Integer; lPar: lParam);
begin
  if FViewerHWND = 0 then Exit;
  PostMessage(FViewerHWND, aMsg, FArqID, lPar);
end;

procedure TncPDFExtractImgs.PrepareDirDest;
begin
  FDirDest := ExtractFileName(FArq);
  Delete(FDirDest, Length(FDirDest)-3, 4);

  FDirDest := ExtractFilePath(FArq) + FDirDest;
  if not DirectoryExists(FDirDest) then ForceDirectories(FDirDest);

  FDirDest := FDirDest + '\';
end;

function TncPDFExtractImgs.Processar;
var
  i, maxp, x, maxpages: integer;
  bmp : TBitmap ;
  Jpg: TJPEGImage;
  sl : TStringList;
  s : String;
  dpi : integer;
  DC : HDC;
  T : Cardinal;
begin
  Result := False;
  try
    DebugMsg('Processar '+FArq);
    if not FileExists(FArq) Then begin
      DebugMsg('Processar - Arquivo nao encontrado'+FArq);
      Exit;
    end;
    FPDFDoc.FileName := FArq;
    maxpages := FPDFDoc.PageCount;
    DebugMsg('PageCount: '+inttostr(maxpages));
    PrepareDirDest;
    maxp := 0;
    
    DC := GetDC(0);
    DPI := GetDeviceCaps(DC, LOGPIXELSY);
    ReleaseDC(0, DC);
    DebugMsg('DPI: ' + IntToStr(DPI));
    dpi := 96;
    
    for i:=1 to maxpages do begin
      if Terminar then Break;
  
      bmp := nil;
  
      try
        DebugMsg('Processar 1');
        bmp := FPDFDoc.GetBitmap(i, DPI, DPI);
        DebugMsg('Processar 2');
      except
        if maxp=0 then maxp := I-1;
        if maxp>0 then begin
          X := i mod maxp;
          if x=0 then x := maxp;
          bmp := FPDFDoc.GetBitmap(x, DPI, DPI);
        end;
      end;
  
      if BMP = nil then begin
        DebugMsg('Falha no GetBitmap');
        Break;
      end;
  
      DebugMsg('Processar 3');
      
      
      jpg := Tjpegimage.Create;
//      thumb := TBitmap.Create;
      
      try
        DebugMsg('Processar 4');
        
        Jpg.Assign(Bmp);
        jpg.PixelFormat    :=jf24bit;
        Jpg.CompressionQuality := 100;
        Jpg.ProgressiveDisplay := False;
        Jpg.ProgressiveEncoding := False;
  
        DebugMsg('Processar 5');
      
{        thumb.PixelFormat := pf24bit;
        thumb.Width  := kThumbWidth;
        thumb.Height := trunc( ( bmp.Height/bmp.Width ) * thumb.Width );
        thumb.Canvas.StretchDraw(rect(0,0,thumb.Width, thumb.Height), bmp);}
  
        DebugMsg('Processar 6');
        
//        thumb.SaveToFile(FDirDest + inttostr(i) + kThumbExt);
        jpg.SaveToFile(FDirDest + IntToStr(i) + kPageExt);
  
        DebugMsg('Processar 7');
  
        if I=1 then begin
          if (FViewerHWND<>0) and (not FAdmin) then begin
            sl := TStringList.Create;
            try
              S := copy(FArq, 1, Length(FArq)-3)+'ini';
              if FileExists(S) then sl.LoadFromFile(S);
            
              sl.Values['doctitle'] := FPdfDoc.DocInfo.Title;
              sl.Values['TotPages'] := IntToStr(maxpages);
              sl.Values['BmpW']     := IntToStr(bmp.width);
              sl.Values['BmpH']     := IntToStr(bmp.Height);
              sl.Values['ThumbW']   := IntToStr(bmp.width);
              sl.Values['ThumbH']   := IntToStr(bmp.Height);
              

              if FWinSession<>-1 then
                sl.Values['WinSession'] := IntToStr(FWinSession);
              
              sl.SaveToFile(copy(FArq, 1, Length(FArq)-3)+'ini');
            finally
              sl.Free;
            end;
          end;
          PostMsg(WM_PR_EXTRACTIMG_START, 0);
        end else
          PostMsg(WM_PR_EXTRACTIMG_PROGRESS, I);

        Result := (I=maxpages);  
  
        DebugMsg('Processar - Salvou Pagina '+inttostr(i));
      finally
        jpg.free;
//        thumb.free;
        bmp.free;
      end;
    end;
    
    DebugMsg('Processar - FIM'+inttostr(i));
  finally
    if not Result then 
      PostMsg(WM_PR_EXTRACTIMG_ERROR, 0);
  end;
    
end;
            
procedure TncPDFExtractImgs.SetUseMMF(const Value: Boolean);
begin
  if FUseMMF = Value then Exit;

  if Value then begin
     FMMFHandle :=
       CreateFileMapping(
         $FFFFFFFF, {to virtual memory}
         nil,
         page_readwrite,
         0,
         1,
         PAnsiChar(kMMFPrefix+ExtractFileName(FArq)));

     if FMMFHandle<>0 then     
       FMMFData := MapViewOfFile(FMMFHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0) else
       FMMFData := nil;
       
     FUseMMF := (FMMFHandle<>0) and (FMMFData<>nil);  
  end else begin
    FUseMMF := False;
    if FMMFData<>nil then
      UnmapViewOfFile(FMMFData);
    if FMMFHandle<>0 then
      CloseHandle(FMMFHandle);  
  end;
end;

{ TThreadExtImgs }

constructor TThreadExtImgs.Create(aArq: String; aArqID: Integer; aAdmin: Boolean; aViewerHWND: HWND);
begin
  FArq := aArq;
  FViewerHWND := aViewerHWND;
  FAdmin := aAdmin;
  FArqID := aArqID;
  inherited Create(True);
end;

procedure TThreadExtImgs.Execute;
var EI: TncPDFExtractImgs;
begin
  DebugMsg('Execute Start');

  EI := TncPDFExtractImgs.Create(FArq, FArqID, FViewerHWND, FAdmin);
  try
    try
      EI.OnTerminar := OnTerminar;
      EI.Processar;
    except
      on E: Exception do
        DebugMsg('TThreadExtImgs.Execute - E.Message: ' + E.Message);
    end;
  finally
    EI.Free;
  end;
  
  DebugMsg('Execute End');
end;

function TThreadExtImgs.OnTerminar: Boolean;
begin
  Result := Terminated;
end;

end.
