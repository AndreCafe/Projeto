unit uDirUtils;

interface

uses
  {$IFNDEF NOLOG}
  uLogs,
  {$ENDIF}
  classes, sysutils, windows, dateutils;

type
  TCleanDirEvent = procedure (Dirname : string) of object;
  TFileDirEvent  = procedure (Sender:TObject; aDir, aFileName : string; aWin32FindData: TWin32FindData) of object;
  TFileDirProc   = procedure (Sender:TObject; aDir, aFileName : string; aWin32FindData: TWin32FindData);
  TCopyMoveDirEvent = procedure (aOrigem, aDestino : string) of object;

   procedure ScanDir(Sender:TObject; d:string; recursar:boolean; devt, fevt : TFileDirProc);
   procedure CleanUpDirectory(Directory:string; evt : TCleanDirEvent; const fevt : TFileDirEvent=nil);
   procedure CleanUpAndDeleteDirectory(Directory:string; evt : TCleanDirEvent; const fevt : TFileDirEvent=nil);
   procedure CleanUpDirectoryIfOlderThan(days:integer; Directory:string; evt : TCleanDirEvent; const fevt : TFileDirEvent=nil);
   procedure CleanUpAndDeleteDirectoryIfOlderThan(days:integer; Directory:string; evt : TCleanDirEvent; const fevt : TFileDirEvent=nil);

implementation

procedure _CleanUpDir(days:integer; d:string; deletar: boolean; evt : TCleanDirEvent; const fevt : TFileDirEvent=nil);
var
     data : TDateTime;
     sr : TSearchRec;
     dl : TStringList;
     i : integer;
begin
  {$WARNINGS OFF}

   // protecção contra del c:\*.*
   if trim(d)='' then exit;

   if assigned(evt) then
      evt(d);

   dl := TStringList.Create;
   try
      if FindFirst( d + '*.*', faDirectory , sr) = 0 then begin
      repeat
            if (sr.Attr and faDirectory) = faDirectory then
            if (sr.Name<>'.') and (sr.Name<>'..') then begin
                 data :=  FileDateToDateTime(sr.Time);
                 if (days=0) or (daysbetween(now , data) > days) then
                    dl.Add(d + sr.Name + '\') ;
            end;
      until FindNext(sr) <> 0;
      sysutils.FindClose(sr);
      end;

      for i:=0 to dl.count-1 do
          _CleanUpDir(days, dl[i], deletar, evt, fevt);

   finally
       dl.Free;
   end;

   if FindFirst( d + '*.*', faArchive + fahidden + faReadOnly, sr) = 0 then begin
      repeat
            if sr.FindData.dwFileAttributes and FILE_ATTRIBUTE_READONLY = FILE_ATTRIBUTE_READONLY then
                 SetFileAttributes(PChar(d + sr.Name), sr.FindData.dwFileAttributes and (not FILE_ATTRIBUTE_READONLY));
            if sr.FindData.dwFileAttributes and FILE_ATTRIBUTE_HIDDEN = FILE_ATTRIBUTE_HIDDEN then
                 SetFileAttributes(PChar(d + sr.Name), sr.FindData.dwFileAttributes and (not FILE_ATTRIBUTE_HIDDEN));
            if assigned(fevt) then
                fevt({Sender}nil, d , sr.Name, sr.FindData);
            windows.DeleteFile ( pchar(d + sr.Name) ) ;
      until FindNext(sr) <> 0;
      sysutils.FindClose(sr);
   end;

   if deletar then
      RemoveDir( pchar( d ) );
  {$WARNINGS ON}

end;

procedure CleanUpDirectoryIfOlderThan(days:integer; Directory:string; evt : TCleanDirEvent; const fevt : TFileDirEvent=nil);
begin
     _CleanUpDir (days, Directory, false, evt, fevt);
end;

procedure CleanUpAndDeleteDirectoryIfOlderThan(days:integer; Directory:string; evt : TCleanDirEvent; const fevt : TFileDirEvent=nil);
begin
     _CleanUpDir (days, Directory, true, evt, fevt);
end;

procedure CleanUpAndDeleteDirectory(Directory:string; evt : TCleanDirEvent; const fevt : TFileDirEvent=nil);
begin
     {$IFNDEF NOLOG}
     GLog.Log(nil, [lcTrace], 'CleanUpAndDeleteDirectory: '+Directory);
     {$ENDIF}
     _CleanUpDir (0, Directory, true, evt, fevt);
end;

procedure CleanUpDirectory(Directory:string; evt : TCleanDirEvent; const fevt : TFileDirEvent=nil);
begin
     {$IFNDEF NOLOG}
     GLog.Log(nil, [lcTrace], 'CleanUpDirectory: '+Directory);
     {$ENDIF}
     _CleanUpDir (0, Directory, false, evt, fevt);
end;


procedure _ScanDir(Sender:TObject; d:string; recursar:boolean; devt, fevt : TFileDirProc);
var
     sr : TSearchRec;
     dl : TStringList;
     i : integer;
begin
  {$WARNINGS OFF}

   // protecção contra del c:\*.*
   if trim(d)='' then exit;

   dl := TStringList.Create;
   try
      if FindFirst( d + '*.*', faDirectory , sr) = 0 then begin
      repeat
            if (sr.Attr and faDirectory) = faDirectory then
                if (sr.Name<>'.') and (sr.Name<>'..') then begin
                     dl.Add(d + sr.Name + '\') ;
                     if assigned(devt) then
                         devt(Sender, d , sr.Name, sr.FindData);
                end;
      until FindNext(sr) <> 0;
      sysutils.FindClose(sr);
      end;

      if recursar then
          for i:=0 to dl.count-1 do
              _ScanDir(Sender, dl[i], recursar, devt, fevt);

   finally
       dl.Free;
   end;

   if FindFirst( d + '*.*', faArchive + fahidden + faReadOnly, sr) = 0 then begin
      repeat
         if assigned(fevt) then
            fevt(Sender, d , sr.Name, sr.FindData);
      until FindNext(sr) <> 0;
      sysutils.FindClose(sr);
   end;

  {$WARNINGS ON}

end;

procedure ScanDir(Sender:TObject; d:string; recursar:boolean; devt, fevt : TFileDirProc);
begin
    _ScanDir(Sender, d, recursar, devt, fevt);
end;

end.
