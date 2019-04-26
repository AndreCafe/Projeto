// ***************************************************************
//  RemoteCmdLine             version:  1.0   ·  date: 2003-06-15
//  -------------------------------------------------------------
//  demo: executing code in the context of another process
//  -------------------------------------------------------------
//  Copyright (C) 1999 - 2003 www.madshi.net, All Rights Reserved
// ***************************************************************

// 2003-06-15 1.0  initial release

program migraguard;



uses
  Windows,
  ShellApi,
  madRemote;

// ***************************************************************

// this is our remote function
// it can be executed in the context of any desired process
function RemoteGetCmdLine(buffer: pchar) : dword; stdcall;
begin
  result := 0;
  // let's copy the command line of the current process to the specified buffer
  lstrcpyA(buffer, GetCommandLine);
end;

function Finaliza(buffer: pchar) : dword; stdcall;
begin
  result := 0;
  ExitProcess(0);
end;


// this function can give us the command line of any specified 32bit process
function GetProcessCmdLine(processHandle: dword) : string;
var arrCh : array [0..MAX_PATH] of char;
    dummy : dword;
begin
  // we simply execute "GetCmdLineThread" in the context of the target process
  if RemoteExecute(processHandle, @RemoteGetCmdLine, dummy, @arrCh, MAX_PATH) then
    // if this succeeds, "arrCh" will contain the command line 
    result := arrCh
  else
    result := '';
end;

function ExecFinaliza(processHandle: dword) : boolean;
var dummy : dword;
begin
  Result := RemoteExecute(processHandle, @Finaliza, dummy, nil, 0);
end;

function FiltraQuotes(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] <> '"' then Result := Result + S[I];
end;

function ExtractFilePath(S: String): String;
begin
  Result := S;
  while (Length(Result)>0) and (Result[Length(Result)]<>'\') do
    Delete(Result, Length(Result), 1);
end;

procedure ShowExplorerCmdLine;
// this demo shows us the command line of the explorer
// this is not possible when using normal win32 APIs
var 
  wnd, pid, ph : dword;
  str, str1, str2 : String;
begin               
  wnd := FindWindow('CMServComunicacao', '');
  if Wnd=0 then Exit;
  GetWindowThreadProcessID(wnd, @pid);
  ph := OpenProcess(PROCESS_ALL_ACCESS, false, pid);
  str := FiltraQuotes(GetProcessCmdLine(ph));
  str2 := ExtractFilePath(str)+'Atualiza\CMGuard.exe';
  str1 := ExtractFilePath(ParamStr(0))+'Atualiza\NexGuard.exe';
  if CopyFile(pchar(str1), pchar(str2), False) then
    ExecFinaliza(ph);
  CloseHandle(ph); 
  Sleep(2000);
  ShellExecute(0, 'open', pchar(str), '', '', SW_NORMAL);       
end;

begin
  ShowExplorerCmdLine;
end.
