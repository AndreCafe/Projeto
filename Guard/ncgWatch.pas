unit ncgWatch;

interface

uses SysUtils, Windows;

function MySessionID: Integer;

procedure KeepMeRunning;
procedure KeepMeClosed;

implementation

function MySessionID: Integer;
 // Getting the session id from the current process
type
  TProcessIdToSessionId = function(dwProcessId: DWORD; pSessionId: DWORD): BOOL; stdcall;
var
  ProcessIdToSessionId: TProcessIdToSessionId;
  Lib : THandle;
  pSessionId : DWord;
begin
  Result := 0;
  Lib := GetModuleHandle('kernel32');
  if Lib <> 0 then
  begin
    ProcessIdToSessionId := GetProcAddress(Lib, 'ProcessIdToSessionId');
    if Assigned(ProcessIdToSessionId) then
    begin
      if ProcessIdToSessionId(GetCurrentProcessId(), DWORD(@pSessionId)) then
        Result:= pSessionId;
    end;
  end;
end; 

function KeepMeFile: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'nexguard'+IntToStr(MySessionID)+'.ini';
end;

procedure KeepMeRunning;
var S: String;
begin
  S := KeepMeFile;
  DeleteFile(PAnsiChar(S));
end;

procedure KeepMeClosed;
var Arq: TextFile;
begin
  Try
    Assign(Arq, KeepMeFile);
    try
      Rewrite(Arq);
      Writeln(Arq, 'NexGuard');
    finally
      CloseFile(Arq);
    end;
  Except
  End;
end;


end.
