program remove;

uses
  SysUtils,
  Windows,
  madRemote,
  madKernel,
  ncShellStart,
  ncProtecao98;

{$R *.res}


function RemoteFechaProc(ExitCode: dword): dword; stdcall;
begin
  Result := 0;
  ExitProcess(ExitCode);
end;  

procedure FechaProcesso(PID: DWORD);
var ph, dummy, exitcode: dword;
begin
  // then we open the process, which is the explorer, of course
  ph := OpenProcess(PROCESS_ALL_ACCESS, false, pid);
  try
    GetExitCodeProcess(PH, ExitCode);
    RemoteExecute(ph, @RemoteFechaProc, dummy, @ExitCode, SizeOf(dword));
  finally  
    CloseHandle(ph);
  end;
end;

procedure FechaProc(ProcessID: Cardinal);
VAR ProcessHandle: THANDLE;
    ExitCode: DWORD;
begin
   ExitCode:= 0;
   ProcessHandle:= OpenProcess(PROCESS_CREATE_THREAD OR
                               PROCESS_VM_OPERATION
                               OR PROCESS_VM_WRITE OR PROCESS_VM_READ OR
                               PROCESS_TERMINATE,
                               FALSE,ProcessID);
   if (ProcessHandle > 0) then
   BEGIN
       GetExitCodeProcess(ProcessHandle, ExitCode);
       TerminateProcess(ProcessHandle,ExitCode);
       CloseHandle(ProcessHandle);
   END;
end;

begin
  try
    ShellStart(ExtractFilePath(ParamStr(0))+'wguard.exe', 'REMOVER SILENT');
  except
  end; 

  with TncProtege98.Create(nil) do
  try
    AutoStart(False);
    BloqueiaCtrlAltDel := False;
    Free;
  except
  end;

  Processes('nexguard.exe');

  Processes[0].

  FechaProcesso(Processes[0].ID);
end.
