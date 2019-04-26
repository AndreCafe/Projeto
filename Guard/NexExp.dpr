program NexExp;

uses
  Windows,
  madCodeHook,
  madKernel;

{$R *.res}


var 
  P : IProcesses;
  C : Cardinal;
  I : Integer;
  H : HWND;

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
  C := GetCurrentSessionID;

  H := FindWindow(pchar('Shell_TrayWnd'), nil);
  if H > 0 then  begin
    PostMessage(h, $05B4, 0, 0);
    Sleep(500);
  end;

  P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do
    if C=P.Items[I].Session then begin
      if P.Items[I].IsStillValid then
        P.Items[I].Quit;
      Sleep(200);  
    end;

  P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do
    if C=P.Items[I].Session then begin
      if P.Items[I].IsStillValid then 
        P.Items[I].Terminate;
      Sleep(200);   
    end;
  
 P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do begin
    if C=P.Items[I].Session then begin
      if P.Items[I].IsStillValid then 
        FechaProc(P[I].ID);
    end;
  end;  
      
end.

