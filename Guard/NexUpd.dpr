program NexUpd;

uses SysUtils, Windows;

{$R *.res}

var
  sFonte, sDest : String;
  TickEnd : Cardinal;

procedure ExecFile(CmdLine: string);
var
  zCmdLine: array[0..512] of char;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zCmdLine, CmdLine);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb:= Sizeof(StartupInfo);
{  StartupInfo.dwFlags:= STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow:= Visibility;}
  CreateProcess(nil,
      zCmdLine, { pointer to command line string }
      nil, { pointer to process security attributes }
      nil, { pointer to thread security attributes }
      False, { handle inheritance flag }
      CREATE_NEW_CONSOLE or
      NORMAL_PRIORITY_CLASS, { creation flags }
      nil, { pointer to new environment block }
      nil, { pointer to current directory name }
      StartupInfo,
      ProcessInfo);
  CloseHandle(ProcessInfo.hProcess);
  CloseHandle(ProcessInfo.hThread);
end;

begin
  sFonte := ParamStr(1);
  if not FileExists(sFonte) then Exit;
  sDest  := ExtractFilePath(ParamStr(0)) + 'NexGuard.EXE';
  TickEnd := GetTickCount + 30000;
  while FileExists(sDest) and (GetTickCount<TickEnd) do begin
    Sleep(100);
    DeleteFile(PAnsiChar(sDest));
  end;

  if FileExists(sDest) then Exit;
  
  RenameFile(sFonte, sDest);

  ExecFile(sDest);
end.
