unit uOlhaPasta;

interface

uses
   Windows, SysUtils, ExtCtrls, classes, controls, StdCtrls, graphics,
   Messages, Int64List, SyncObjs, uDirWatch;

type
    TFolderEvent     = procedure(Sender: TObject; aPrintName:string) of object;

    TOlhaPastaThread = class(TThread)
    private
      fOnNewPrint : TFolderEvent;
      procedure SyncNewPrint;
    protected
      fFilesPath    : string;
      fPrintName    : string;
      procedure doNewPrint(aPrintName:string);
      procedure Execute; override;
      procedure DirectoryWatchOnChange(Sender : TObject);
    public
      property OnNewPrint : TFolderEvent  read fOnNewPrint write fOnNewPrint;
      constructor Create(aFilesPath: string);
  end;

implementation

{$IFNDEF NOLOG}
uses
   uLogs;
{$ENDIF}

{ TOlhaPastaThread }

constructor TOlhaPastaThread.Create(aFilesPath: string);
begin
   {$IFNDEF NOLOG}GLog.Log(self,[lcTrace],'Create');{$ENDIF}
    fFilesPath := aFilesPath;
    inherited Create(true);
end;

procedure TOlhaPastaThread.DirectoryWatchOnChange(Sender: TObject);
var
   sr: TSearchRec;
   pName :string;
begin
    {$WARNINGS OFF}
    if SysUtils.FindFirst(fFilesPath + '\*.nexprint', faArchive, sr) = 0 then begin
        repeat
            if sametext( ExtractFileExt(sr.Name), '.nexprint') then begin
                pName := copy(sr.Name, 1, length(sr.Name)-9);
                if (fileexists(fFilesPath + '\' +pName+ '.nexprint.json' )) then begin
                    doNewPrint(pName);
                end;
            end;
        until FindNext(sr) <> 0;
        SysUtils.FindClose(sr);
    end;
    {$WARNINGS ON}

end;

procedure TOlhaPastaThread.doNewPrint(aPrintName: string);
begin
    fPrintName := aPrintName;
    Synchronize(SyncNewPrint);
end;

procedure TOlhaPastaThread.Execute;
var
   Msg : TMsg;
   pmRes : integer;
   sFilesPath:string;
   DirectoryWatch : TDirectoryWatch;
begin
  inherited;
    DirectoryWatchOnChange(nil);
    
    sFilesPath := fFilesPath;
    if (sFilesPath>'')and(sFilesPath[length(sFilesPath)]<>'\') then
          sFilesPath := sFilesPath + '\';

    DirectoryWatch := TDirectoryWatch.Create(nil);
    DirectoryWatch.Directory := sFilesPath;
    DirectoryWatch.WatchSubDirs := false;
    DirectoryWatch.NotifyFilters := [nfFilename];
    DirectoryWatch.OnChange := DirectoryWatchOnChange;
    DirectoryWatch.Active := true;

    repeat
      pmRes := Integer(PeekMessage(Msg, hwnd(0), 0, 0, PM_REMOVE));
      if pmRes <> 0 then begin
          TranslateMessage(Msg);
          DispatchMessage(Msg);
      end;
    until terminated;

    DirectoryWatch.Active := false;
    DirectoryWatch.Free
end;

procedure TOlhaPastaThread.SyncNewPrint;
begin
    if assigned(fOnNewPrint) then
        fOnNewPrint(self, fPrintName);
end;


end.
