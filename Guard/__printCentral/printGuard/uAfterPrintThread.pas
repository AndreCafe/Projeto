unit uAfterPrintThread;

interface

uses
    Windows, SysUtils, ExtCtrls, classes, controls, StdCtrls, graphics, forms,
    strUtils,
    jpeg,
    gtPDFClasses,
    gtCstPDFDoc,
    gtExPDFDoc,
    gtExProPDFDoc,
    gtPDFDoc,
    {$IFNDEF NOLOG}
    uLogs,
    {$ENDIF}
    //madKernel,
    ncgPrintInstall,
    ncShellStart,
    md5,
    Messages, Int64List, SyncObjs;

type

   TAfterPrintThread = class(TThread)
    private
      fFullFileName : String;
      fTargetHandle:integer;
    protected
      procedure Execute; override;
    public
      procedure Resume(aFullFileName: String; aTargetHandle:integer); reintroduce;
      constructor Create;
    end;

implementation

uses
  uNexCafe5PrintCentral;

{ TAfterPrintThread }

constructor TAfterPrintThread.Create;
begin
    inherited Create(true);
    FreeOnTerminate := true;
end;

procedure TAfterPrintThread.Resume(aFullFileName: String; aTargetHandle:integer);
begin
  fFullFileName := aFullFileName;
  fTargetHandle := aTargetHandle;
  inherited resume;

end;

procedure TAfterPrintThread.Execute;
var
    fn, oriPath, desPath,  fFullDestFileName : string;
    fFullDestDirName : string;
    i, wParam, lParam, sSize : integer;
    bmp : TBitmap ;
    Jpg: TJPEGImage;
    thumb : TBitmap;
    fPDFDocument : TgtExProPDFDocument;
    infofile : TStringList;
    sMD5: string;
    reTry : integer;
    res : boolean;
    Msg : TMsg;
    pmRes : integer;
    fMessageStr  : TStringList;

    procedure cancel;
    begin
            wParam := 0; //p[j].Session;
            lParam := i;
            reTry := 0;
            repeat sleep(1); inc(reTry);
            until PostMessage( fTargetHandle, WM_ENDPRINT_MESSAGE, wParam, lParam) or (reTry=5) or (terminated);
           {$IFNDEF NOLOG} GLog.Log(nil,[lcMsgs],'WM_ENDPRINT_MESSAGE');{$ENDIF}
    end;

    function CancelledByRemote(var msg: TMsg):boolean;
    var
        S: PChar;
        remoteMD5 : string;
    begin
        GetMem(S, msg.LParam+1);
        try
          GlobalGetAtomName(msg.WParam,S, msg.LParam+1);
          remoteMD5 := string(S);
         {$IFNDEF NOLOG}
         GLog.Log(nil,[lcMsgs],'WM_CANCELPRINT_MESSAGE '+remoteMD5 +'/'+sMD5);
         {$ENDIF}
          GlobalDeleteAtom(msg.WParam);
          result := sMD5 = remoteMD5;
        finally
          freeMem(s);               
        end;
    end;

begin
            oriPath := ExtractFilePath(fFullFileName);
            fn      := copy(fFullFileName, length(oriPath)+1, maxint);
            fn      := copy(fn, 1, pos('.nexprint', fn)-1);
            desPath := copy(oriPath, 1, pos('\2\', oriPath)-1) + '\3\';
            forcedirectories(desPath);

            if (fileexists (fFullFileName)) then begin
                fFullDestFileName := strUtils.ReplaceStr( desPath+ fn+'.nexprint', '\\', '\');
                fFullDestDirName  := strUtils.ReplaceStr( desPath+ fn+'\', '\\', '\');
                sMD5 := md5.H( fFullDestFileName);
                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],fFullDestFileName +'/'+sMD5);{$ENDIF}

                if copyfile(pchar(fFullFileName), pchar(fFullDestFileName), false) then begin

                    forcedirectories(fFullDestDirName);
                    fPDFDocument := TgtExProPDFDocument.create(nil);
                    infofile := TStringList.create;
                    try
                        fPDFDocument.FileName := fFullDestFileName;
                        while not (fPDFDocument.IsLoaded) and not(terminated) do
                           sleep(100);

                        if fPDFDocument.IsLoaded then
                        for i:=1 to fPDFDocument.PageCount do begin

                            if terminated then break;

                            pmRes := Integer(PeekMessage(Msg, hwnd(0), lParam, wParam, PM_REMOVE));
                            if pmRes <> 0 then begin

                                TranslateMessage(Msg);
                                DispatchMessage(Msg);

                                case Msg.message of
                                  WM_CANCELPRINT_MESSAGE : begin
                                      if CancelledByRemote(Msg) then
                                          break;
                                  end;
                                end;

                            end;

                            sleep(100);
                            bmp := fPDFDocument.GetBitmap(i, 100, 100);
                            Jpg := TJPEGImage.Create;
                            thumb := TBitmap.Create;
                            try
                                Jpg.Assign(Bmp);
                                jpg.PixelFormat    :=jf24bit;
                                Jpg.CompressionQuality := 100;
                                Jpg.ProgressiveDisplay := False;
                                Jpg.ProgressiveEncoding := False;

                                thumb.PixelFormat := pf24bit;
                                thumb.Width  := kThumbWidth;
                                thumb.Height := trunc( ( bmp.Height/bmp.Width ) * thumb.Width );
                                thumb.Canvas.StretchDraw(rect(0,0,thumb.Width, thumb.Height), bmp);

                                if i=1 then begin
                                    infofile.add( 'PageCount='+inttostr(fPDFDocument.PageCount));
                                    infofile.add( 'ThumbWidth='+inttostr(kThumbWidth));
                                    infofile.add( 'ThumbHeight='+inttostr(thumb.Height));
                                    infofile.add( 'BmpWidth='+inttostr(bmp.Width));
                                    infofile.add( 'BmpHeight='+inttostr(bmp.Height));
                                    infofile.add( 'MD5='+sMD5);
                                    infofile.add( 'Session=0');//'+inttostr(CurrentProcess.Session));
                                    infofile.SaveToFile(fFullDestDirName+'file.info');
                                end;


                                if not directoryExists(fFullDestDirName) then begin
                                    cancel;
                                    exit;
                                end;

                                thumb.SaveToFile(fFullDestDirName+inttostr(i)+'.bnexprint');
                                Jpg.SaveToFile(fFullDestDirName+inttostr(i)+'.jnexprint');


                                if i=1 then begin
                                    wParam := GlobalFindAtom(PChar(sMD5));
                                    if wParam=0 then
                                        wParam := GlobalAddAtom(PChar(sMD5));
                                    sSize  := Length(sMD5);
                                    reTry := 0;
                                    repeat
                                        sleep(1); inc(reTry);
                                        res := PostMessage( fTargetHandle, WM_STARTPRINT_MESSAGE, wParam, sSize);
                                        {$IFNDEF NOLOG}GLog.Log(nil,[lcMsgs],'WM_STARTPRINT_MESSAGE');{$ENDIF}
                                        {if res then begin
                                            reTry2 := 0;
                                            while (reTry2<20) and not(terminated) do begin
                                                pmRes := Integer(PeekMessage(Msg, hwnd(0), lParam, wParam, PM_REMOVE));
                                                if pmRes <> 0 then begin

                                                    TranslateMessage(Msg);
                                                    DispatchMessage(Msg);

                                                    case Msg.message of
                                                      WM_STARTRETURN_MESSAGE : begin
                                                          {//$IFNDEF NOLOG}// GLog.Log(nil,[lcMsgs],'WM_STARTRETURN_MESSAGE');{$ENDIF}
                                                          {reTry2 := 1000;
                                                      end;
                                                      WM_CANCELPRINT_MESSAGE :
                                                          if CancelledByRemote(Msg) then
                                                              exit;
                                                    end;

                                                end else
                                                    sleep(250);
                                                inc(reTry2);
                                            end;
                                        end;}
                                    until (res) or (reTry=5) or (terminated);
                                end; 

                            finally
                                thumb.free;
                                bmp.free;
                                Jpg.free;
                            end;

                            fMessageStr  := TStringList.create;
                            try
                                fMessageStr.add(sMD5);
                                fMessageStr.add('0');//intToStr(CurrentProcess.Session));
                                fMessageStr.add(intToStr(i));
                                wParam := GlobalFindAtom(PChar(fMessageStr.text));
                                if wParam=0 then begin
                                    wParam := GlobalAddAtom(PChar(fMessageStr.text));
                                    lParam := Length(fMessageStr.text);
                                    reTry := 0;
                                    repeat sleep(1); inc(reTry);
                                    until PostMessage( fTargetHandle, WM_PROGRESS_MESSAGE, wParam, lParam) or (reTry=5) or (terminated);
                                    {$IFNDEF NOLOG} GLog.Log(nil,[lcMsgs],'WM_PROGRESS_MESSAGE '+inttostr(i));{$ENDIF}
                                end;
                            finally
                                fMessageStr.free;
                            end;

                            sleep(100);
                        end;

                    finally
                        infofile.Free;
                        fPDFDocument.free;
                        //deletefile(pchar(fFullFileName));
                    end;
                end;
            end;

end;


end.
