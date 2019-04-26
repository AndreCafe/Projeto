program nexap2;

{
    nunca ativar Project -> options -> linker - Generate Console Application
    nem adicionar  diretiva $APPTYPE CONSOLE.

    Assim nao temos stdOut/stdIn mas app nao abre a janela de consola

    Dario 01/10/2011


    Incluir NOLOG como diretiva em Project->Options->Directoties/Conditional->conditional defines
    Dario 4/11/2011
}

{  Lógica de pastas
    0 = acabou de ser criado
    1 = pasta onde ficam PDF's que precisam ser revisados pelo usuário
    2 = pasta onde ficam PDF's que foram aprovados e falta enviar pro servidor ... qdo terminar de enviar pro serv apaga o arquivo
}

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
  uLogs in '..\..\uLogs.pas',
  madKernel in 'C:\Comp\madCollection\madKernel\Sources\madKernel.pas',
  ncNomeMaquina in '..\..\ncNomeMaquina.pas',
  ncShellStart in '..\..\..\Comp\ncShellStart.pas',
  uMd5,
  uJson,
  ncDebug in '..\..\..\Comp\ncDebug.pas';

Const
    WM_STARTPRINT_MESSAGE   = WM_APP + 1;
    WM_PROGRESS_MESSAGE     = WM_APP + 2;
    WM_STARTRETURN_MESSAGE  = WM_APP + 3;
    WM_CANCELPRINT_MESSAGE  = WM_APP + 4;
    WM_ENDPRINT_MESSAGE     = WM_APP + 5;
    WM_AFTERPRINTSTART      = WM_APP + 6;
    WM_AFTERPRINTENDS       = WM_APP + 7;

//    kTargetExeName_C = 'nexCafe5PrintMan.exe';
    kTargetExeName_C = 'nexguard.exe';
    kTargetExeName_S = 'nexadmin.exe';
    kConsoleTitle    = 'nexap';
    kThumbWidth      = 200;

var
    oriPath, 
    fFullFileName, 
    fTargetExeName : string;
    
    sMD5: string;
    p : IProcesses;
    reTry, wParam, lParam : integer;
    fPDFDocument : TgtExProPDFDocument;
    infofile : TStringList;
    fFullDestFileName : string;
    fFullDestDirName : string;
    err, j : integer;
    res : boolean;
    hwnd_server : DWORD = 0;


    procedure postmsg(amsg, wparam2, lparam2: integer);
    var j: integer;
    begin
      if hwnd_server=0 then begin
        P := processes(fTargetExename);
        for j:=p.ItemCount-1 downto 0 do begin
            sleep(1); 
            p[j].Windows_.PostMessage( WM_ENDPRINT_MESSAGE, wParam2, lParam2);
        end;
      end else
        PostMessage(hwnd_server, amsg, wparam2, lparam2);
    end;
    
    procedure cancel(ai:integer);
    begin
        {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Cancel '+inttostr(ai));{$ENDIF}
        PostMsg(WM_ENDPRINT_MESSAGE, 0, ai);
        {$IFNDEF NOLOG} GLog.Log(nil,[lcMsgs],'WM_ENDPRINT_MESSAGE');{$ENDIF}
    end;

    function CancelledByRemote(var msg: TMsg):boolean;
    var
        S: PChar;
        remoteMD5 : string;
    begin
        {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'CancelledByRemote');{$ENDIF}
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

    procedure procDoc;
    var
        i, maxp, j, x, sSize : integer;
        C: Cardinal;
        bmp : TBitmap ;
        Jpg: TJPEGImage;
        thumb : TBitmap;
        reTry2 : integer;
        res : boolean;
        Msg : TMsg;
        pmRes : integer;
        fMessageStr  : TStringList;
        aJsonSl  : TStringList;
        aJson  : TJSONObject;
    begin
        {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'procDoc');{$ENDIF}

         fPDFDocument.FileName := fFullDestFileName;
         {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'PageCount: '+inttostr(fPDFDocument.PageCount));{$ENDIF}
         // processar primeiras 5

         aJsonSl :=  TStringList.create;
         aJsonSl.Text := '{}';
         maxp := 0;
         try
            if fileexists(fFullDestFileName+'.json') then
                aJsonSl.LoadFromFile(fFullDestFileName+'.json');

            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'pro<5');{$ENDIF}
            for i:=1 to fPDFDocument.PageCount do begin
                if i>5 then break;

                Jpg := TJPEGImage.Create;
                thumb := TBitmap.Create;
                try
                    if not ( fileexists(fFullDestDirName+inttostr(i)+'.bnexprint') and
                             fileexists(fFullDestDirName+inttostr(i)+'.jnexprint') ) then begin
                             
                        try
                          C := GetTickCount;
                          bmp := fPDFDocument.GetBitmap(i, 100, 100);
                          C := GetTickCount-C;
                          DebugMsg('Página ' + IntToStr(i) + ' - Tempo Bitmap = ' + IntToStr(C));
                        except
                          if maxp=0 then maxp := I-1;
                          if maxp>0 then begin
                            X := i mod maxp;
                            if x=0 then x := maxp;
                            C := GetTickCount;
                            bmp := fPDFDocument.GetBitmap(x, 100, 100);
                            C := GetTickCount-C;
                            DebugMsg('Página ' + IntToStr(i) + ' - Tempo Bitmap = ' + IntToStr(C));
                          end;
                        end;
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

                            if not directoryExists(fFullDestDirName) then begin
                                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'directory not Exists: '+fFullDestDirName);{$ENDIF}
                                cancel(i);
                                exit;
                            end;

                            thumb.SaveToFile(fFullDestDirName+inttostr(i)+'.bnexprint');
                            Jpg.SaveToFile(fFullDestDirName+inttostr(i)+'.jnexprint');
                            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'image save '+inttostr(i));{$ENDIF}


                            if i=1 then begin
                                aJson  := TJSONObject.create(aJsonSl.Text);
                                aJson.put('PageCount',fPDFDocument.PageCount);
                                aJson.put('ThumbWidth',kThumbWidth);
                                aJson.put('ThumbHeight',thumb.Height);
                                aJson.put('BmpWidth',bmp.Width);
                                aJson.put('BmpHeight',bmp.Height);
                                aJson.put('MD5',sMD5);
                                aJson.put('Session',CurrentProcess.Session);
                                aJsonSl.Text := aJson.toString;
                                aJsonSl.SaveToFile(fFullDestFileName+'.json');
                                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace], 'aJsonSl.SaveToFile '+sMD5);{$ENDIF}
                                {$IFNDEF NOLOG} GLog.ForceLogWrite;{$ENDIF}

                                p := Processes(fTargetExeName);
                                for j:=p.ItemCount-1 downto 0 do begin

                                    wParam := GlobalFindAtom(PChar(sMD5));
                                    if wParam=0 then
                                        wParam := GlobalAddAtom(PChar(sMD5));
                                    sSize  := Length(sMD5);
                                    reTry := 0;
                                    repeat
                                        sleep(1); inc(reTry);
                                        res := p[j].Windows_.PostMessage( WM_AFTERPRINTSTART, wParam, sSize);
                                        {$IFNDEF NOLOG} GLog.Log(nil,[lcMsgs],'WM_AFTERPRINTSTART');{$ENDIF}
                                    until (res) or (reTry=3);

                                end;
                               {$IFNDEF NOLOG} GLog.ForceLogWrite;{$ENDIF}
                            end;

                        finally
                           bmp.free;
                        end;

                    end else begin
                        {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'image existis '+inttostr(i));{$ENDIF}
                    end;
                finally
                    thumb.free;
                    Jpg.free;
                end;
                {$IFNDEF NOLOG} GLog.ForceLogWrite;{$ENDIF}
            end;

            // iniciar manager

            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'iniciar manager');{$ENDIF}
            p := Processes(fTargetExeName);
            for j:=p.ItemCount-1 downto 0 do begin

                wParam := GlobalFindAtom(PChar(sMD5));
                if wParam=0 then
                    wParam := GlobalAddAtom(PChar(sMD5));
                sSize  := Length(sMD5);
                reTry := 0;
                repeat
                    sleep(1); inc(reTry);
                    res := p[j].Windows_.PostMessage( WM_STARTPRINT_MESSAGE, wParam, sSize);
                    {$IFNDEF NOLOG} GLog.Log(nil,[lcMsgs],'WM_STARTPRINT_MESSAGE');{$ENDIF}
                    if res then begin
                        reTry2 := 0;
                        while reTry2<20 do begin
                            pmRes := Integer(PeekMessage(Msg, hwnd(0), lParam, wParam, PM_REMOVE));
                            if pmRes <> 0 then begin

                                TranslateMessage(Msg);
                                DispatchMessage(Msg);

                                case Msg.message of
                                  WM_STARTRETURN_MESSAGE : begin
                                      {$IFNDEF NOLOG} GLog.Log(nil,[lcMsgs],'WM_STARTRETURN_MESSAGE');{$ENDIF}
                                      reTry2 := 1000;
                                  end;
                                  WM_CANCELPRINT_MESSAGE :
                                      if CancelledByRemote(Msg) then
                                          exit;
                                end;

                            end else
                                sleep(250);
                            inc(reTry2);
                        end;
                    end;
                until (res) or (reTry=5);

            end;


            // processar restantes

            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'processar restantes');{$ENDIF}
            if fPDFDocument.PageCount>5 then
            for i:=6 to fPDFDocument.PageCount do begin

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

                if not ( fileexists(fFullDestDirName+inttostr(i)+'.bnexprint') and
                         fileexists(fFullDestDirName+inttostr(i)+'.jnexprint') ) then begin
                    try     
                      bmp := fPDFDocument.GetBitmap(i, 100, 100);
                    except
                      if maxp>0 then begin
                        X := i mod maxp;
                        if x=0 then x := maxp;
                        bmp := fPDFDocument.GetBitmap(x, 100, 100);
                      end else
                        raise;
                    end;
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

                        if not directoryExists(fFullDestDirName) then begin
                            cancel(i);
                            exit;
                        end;

                        thumb.SaveToFile(fFullDestDirName+inttostr(i)+'.bnexprint');
                        Jpg.SaveToFile(fFullDestDirName+inttostr(i)+'.jnexprint');
                        {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'image save '+inttostr(i));{$ENDIF}
                    finally
                        thumb.free;
                        bmp.free;
                        Jpg.free;
                    end;
                end else begin
                    {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'image existis '+inttostr(i));{$ENDIF}
                end;

                p := Processes(fTargetExeName);
                for j:=p.ItemCount-1 downto 0 do begin
                    fMessageStr  := TStringList.create;
                    try
                        fMessageStr.add(sMD5);
                        fMessageStr.add(intToStr(CurrentProcess.Session));
                        fMessageStr.add(intToStr(i));
                        {$IFNDEF NOLOG} GLog.Log(nil,[lcMsgs],'WM_PROGRESS_MESSAGE '+inttostr(i));{$ENDIF}
                        wParam := GlobalFindAtom(PChar(fMessageStr.text));
                        if wParam=0 then begin
                            wParam := GlobalAddAtom(PChar(fMessageStr.text));
                            if wParam=0 then begin
                                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'GlobalAddAtom error: '+SysErrorMessage(GetLastError));{$ENDIF}
                            end;
                        end else begin
                            {$IFNDEF NOLOG} GLog.Log(nil,[lcMsgs],'globalAtomE '+inttostr(i));{$ENDIF}
                        end;
                        lParam := Length(fMessageStr.text);
                        reTry := 0;
                        repeat sleep(1); inc(reTry);
                        until p[j].Windows_.PostMessage( WM_PROGRESS_MESSAGE, wParam, lParam) or (reTry=5);
                    finally
                        fMessageStr.free;
                    end;
                 end;
                 {$IFNDEF NOLOG} GLog.ForceLogWrite;{$ENDIF}
            end;

         finally
            aJsonSl.Free;
         end;
    end;

    procedure versaoclient;
    var
        fn, desPath, sprof, sJson : string;
    begin
            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'versaoclient');{$ENDIF}
            fTargetExeName :=kTargetExeName_C;
            
            //OEMSaveFile="[YMD][HIS]_[C]_[P]"
            {
              [YMD] - Date in the format YYYYMMDD (year, month, day)
              [HIS] - time in the format hhmmss (hour, minute, second)
              [P] - Name of the profile currently loaded
              [C] - Counter in the format cc (it begins with 01 and increases at each printed document, if a file with the same name exists in the save folder)
            }
            infofile := TStringList.create;
            try
                fn      := copy(fFullFileName, length(oriPath)+1, maxint);
                sJson := '{"novaFileName"="'+fn+'"';
                fn      := copy(fn, 1, pos('.pdf', fn)-1);
                sprof   := fn;
                sJson   := sJson + ',"novaDatetime"="'+copy(sprof, 1, pos('_', sprof)-1)+'"';
                sprof   := copy(fn, pos('_', fn)+1, maxint);
                sJson   := sJson + ',"novaCounter"="'+copy(sprof, 1, pos('_', sprof)-1)+'"';
                sprof   := copy(sprof, pos('_', sprof)+1, maxint);
                sJson   := sJson + ',"novaProfile"="'+sprof+'"}';
                fFullDestDirName :=copy(fn, 1, length(fn)-length(sprof)-1);

                desPath := copy(oriPath, 1, pos('\0\', oriPath)-1) + '\1\';
                forcedirectories(desPath);


                if (fileexists (fFullFileName)) then begin
                    fFullDestFileName     := strUtils.ReplaceStr( desPath+ GetNomeMaquina +'_' +
                                             inttostr(CurrentProcess.Session)+'_'+fFullDestDirName+'.nexprint', '\\', '\');
                    fFullDestDirName      := strUtils.ReplaceStr( desPath+ GetNomeMaquina +'_' +
                                             inttostr(CurrentProcess.Session)+'_'+fFullDestDirName+'\', '\\', '\');
                    sMD5 := uMd5.H( formatfloat('000', CurrentProcess.Session) + fFullDestFileName);
                    {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],fFullDestFileName +' / '+sMD5);{$ENDIF}

                    if copyfile(pchar(fFullFileName), pchar(fFullDestFileName), false) then begin

                        forcedirectories(fFullDestDirName);
                        infofile.Text := sJson;
                        infofile.SaveToFile(fFullDestFileName+'.json');
                        fPDFDocument := TgtExProPDFDocument.create(nil);
                        try
                            procDoc;
                        finally
                            fPDFDocument.free;
                            deletefile(pchar(fFullFileName));
                        end;
                    end;
                end;

            finally
                infofile.free;
            end;
    end;

    procedure versaoserver;
    var
        fn, desPath : string;
    begin
            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'versaoserver');{$ENDIF}
            fTargetExeName :=kTargetExeName_S;
            //oriPath := ExtractFilePath(fFullFileName);
            fn      := copy(fFullFileName, length(oriPath)+1, maxint);
            fn      := copy(fn, 1, pos('.nexprint', fn)-1);
            desPath := copy(oriPath, 1, pos('\2\', oriPath)-1) + '\3\';
            forcedirectories(desPath);

            if (fileexists (fFullFileName)) then begin
                fFullDestFileName := strUtils.ReplaceStr( desPath+ fn+'.nexprint', '\\', '\');
                fFullDestDirName  := strUtils.ReplaceStr( desPath+ fn+'\', '\\', '\');
                sMD5 := uMd5.H( formatfloat('000', CurrentProcess.Session) + fFullDestFileName);

                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],fFullDestFileName +' / '+sMD5);{$ENDIF}

                //if (copyfile(pchar(fFullFileName), pchar(fFullDestFileName), false)) and
                //   (copyfile(pchar(fFullFileName+'.json'), pchar(fFullDestFileName+'.json'), false)) then begin

                if copyfile(pchar(fFullFileName), pchar(fFullDestFileName), false) then begin

                    forcedirectories(fFullDestDirName);
                    fPDFDocument := TgtExProPDFDocument.create(nil);
                    try
                        procDoc;
                    finally
                        fPDFDocument.free;
                    end;
                end;
            end;
    end;


procedure GetAtomMD5;
begin
  wParam := GlobalFindAtom(PChar(sMD5));
  if wParam=0 then
    wParam := GlobalAddAtom(PChar(sMD5));
  lParam  := Length(sMD5);
end;

begin
    SetConsoleTitle(kConsoleTitle);
    GLog.LogCategoriesStr := '+lcAll';
    DebugMsg('Start NexAP');
    

    try
        fFullFileName := '';
        if paramcount>0 then begin
            fFullFileName := strUtils.ReplaceStr( paramstr(1) , '\\', '\');

            oriPath := ExtractFilePath(fFullFileName);
            if pos('\0\', oriPath)>0 then
                versaoclient
            else
            if pos('\2\', oriPath)>0 then begin
                hwnd_server := StrToIntDef( paramstr(2), 0);
                versaoserver;
            end;

        end; // if paramcount>0

    except
      on E:Exception do begin
        {$IFNDEF NOLOG} GLog.Log(nil,[lcExcept],e.Message);{$ENDIF}
      end;
    end;

    if hwnd_server=0 then begin
      p := Processes(fTargetExeName);
      for j:=p.ItemCount-1 downto 0 do begin
          GetAtomMD5;
          reTry := 0;
          repeat
              sleep(1); inc(reTry);
              res := p[j].Windows_.PostMessage( WM_AFTERPRINTENDS, wParam, lParam);
              {$IFNDEF NOLOG} GLog.Log(nil,[lcMsgs],'WM_AFTERPRINTENDS');{$ENDIF}
          until (res) or (reTry=3);

      end;
    end else begin
      GetAtomMD5;
      PostMessage(hwnd_server, WM_AFTERPRINTENDS, wParam, lParam);
    end;

    err := GetLastError;
    {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'lastError: '+inttostr(err));{$ENDIF}
    if err > 0 then begin
        {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'sysErrorMessage: '+SysErrorMessage(GetLastError));{$ENDIF}
    end;
    
    {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'fim');{$ENDIF}
    {$IFNDEF NOLOG} GLog.ForceLogWrite;{$ENDIF}




end.
