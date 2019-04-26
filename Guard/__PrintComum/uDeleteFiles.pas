unit uDeleteFiles;

interface

uses
   Windows, SysUtils, classes, SyncObjs, uDirUtils;

type
   TFolderEvent     = procedure(Sender: TObject; Dirname : string) of object;

   TDeleteFilesThread = class(TThread)
    private
      fOnDelete     : TFolderEvent;
      fDirName      : string;
      fPasta        : string;
      fFileNames    : TStringList;
      procedure SyncDelete;
      procedure doOnDelete(Dirname : string);
    protected
      procedure Execute; override;
    public
      property OnDelete : TFolderEvent read fOnDelete write fOnDelete;
      constructor Create(aPasta:string; aFileNames:TStringList);
      destructor Destroy; override;
   end;


implementation

uses
   uLogs;
   
{ TDeleteFilesThread }

constructor TDeleteFilesThread.Create(aPasta:string; aFileNames:TStringList);
begin
    inherited Create(true);
    fPasta := aPasta;
    fFileNames := TStringList.create;
    fFileNames.assign(aFileNames);
    FreeOnTerminate   := true;
end;

destructor TDeleteFilesThread.Destroy;
begin
  fFileNames.free;
  inherited;
end;

procedure TDeleteFilesThread.doOnDelete(Dirname: string);
begin
    fDirName := DirName;
    Synchronize(SyncDelete);
end;

procedure TDeleteFilesThread.SyncDelete;
begin
   {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'fOnDelete '+fDirName );{$ENDIF}
   if (assigned(fOnDelete)) then
        fOnDelete(self, fDirName);
end;

procedure TDeleteFilesThread.Execute;
var
    ok : boolean;
    i  : integer;
begin
    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'executing '+fPasta  );{$ENDIF}
    ok := false;
    for i:=0 to fFileNames.count-1 do begin
        ok := false;
        repeat
            if deletefile(fFileNames[i]) then
                ok := true
            else
                sleep(250);
        until ok or terminated;
    end;

    if ok then begin
        CleanUpAndDeleteDirectory(fPasta, nil,nil);

        doOnDelete(fPasta);
    end;

    {$IFNDEF NOLOG} GLog.Log(self,[lcTrace],'Terminating '+fPasta );{$ENDIF}
    {$IFNDEF NOLOG} GLog.ForceLogWrite;{$ENDIF}
end;


end.
