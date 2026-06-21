unit uTesteRemoteFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, madRemote, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
//procedure getExeGuardThread(var params);

var
  Form1: TForm1;

implementation

{$R *.dfm}

// this is our thread function, which will be copied to and then executed in the
// context of any desired process
function RemoteGetCmdLine(buffer: pchar) : dword; stdcall;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  cl : pchar;
  i, e : integer;
  r : boolean;
begin
  try

      MessageBox(0, buffer, buffer, MB_ICONINFORMATION);

      StartupInfo.lpReserved := nil;
      StartupInfo.lpDesktop := nil;
      StartupInfo.lpTitle := nil;
      StartupInfo.dwX := 0;
      StartupInfo.dwY := 0;
      StartupInfo.dwXSize := 0;
      StartupInfo.dwYSize := 0;
      StartupInfo.dwXCountChars := 0;
      StartupInfo.dwYCountChars := 0;
      StartupInfo.dwFillAttribute := 0;
      StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
      StartupInfo.wShowWindow := SW_NORMAL;
      StartupInfo.cbReserved2 := 0;
      StartupInfo.lpReserved2 := nil;
      StartupInfo.hStdInput := 0;
      StartupInfo.hStdOutput := 0;
      StartupInfo.hStdError := 0;
      StartupInfo.cb:= Sizeof(StartupInfo);

      r := CreateProcess(nil,
          buffer, // pointer to command line string
          nil,    // pointer to process security attributes
          nil,    // pointer to thread security attributes
          False,  //handle inheritance flag
          CREATE_NEW_CONSOLE or
          NORMAL_PRIORITY_CLASS, // creation flags
          nil, // pointer to new environment block
          nil, // pointer to current directory name
          StartupInfo,
          ProcessInfo);
      e := getLastError();
      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread);

  except
      on e : Exception do begin
          cl := pchar(e.Message);
          for result := 0 to MAX_PATH - 1 do begin
            buffer[result] := cl[result];
            if buffer[result] = #0 then
              break;
          end;

          exit;
      end;
  end;


  // first let's get the command line of the current process
  //cl := StrCat (cl , pchar(' / '));
  //cl := StrCat (cl , GetCommandLine);
  cl := GetCommandLine ;
  // now let's copy the characters to the specified buffer
  // we can't use StrPCopy, because that's not available in other processes
  // we use "result" as the loop variable, so the length of the copied
  // command line is automatically the exit code of the thread
  i := 1;
  if r then
       buffer[0] := 't'
  else begin
       buffer[0] := 'e';
       buffer[8] := char( (e and $0000000F) or $30);
       buffer[7] := char(((e and $000000F0)shr 4) or $30);
       buffer[6] := char(((e and $00000F00)shr 8) or $30);
       buffer[5] := char(((e and $0000F000)shr 12) or $30);
       buffer[4] := char(((e and $000F0000)shr 16) or $30);
       buffer[3] := char(((e and $00F00000)shr 20) or $30);
       buffer[2] := char(((e and $0F000000)shr 24) or $30);
       buffer[1] := char(((e and $F0000000)shr 28) or $30);
       i := 9;
  end;
  for result := 0 to MAX_PATH - 1 do begin
    buffer[result+i] := cl[result];
    if buffer[result] = #0 then
      break;
  end;


end;


function GetProcessCmdLine(processHandle: dword) : string;
var arrCh : array [0..MAX_PATH - 1] of char;
    len   : dword;
    a : string;
    i:integer;
begin
      a := 'C:\WINDOWS\system32\notepad.exe';
  for i := 1 to length(a) do begin
    arrCh[i-1] := a[i];
  end;
  arrCh[i]:=#0;

  MessageBox(0, arrCh, arrCh, MB_ICONINFORMATION);

  // we simply execute "GetCmdLineThread" in the context of the target process
  if RemoteExecute(processHandle, @RemoteGetCmdLine, len, @arrCh, MAX_PATH) then
    // if this succeeds, "arrCh" will contain the command line and
    // the function result "len" will contain the length of the command line
    SetString(result, arrCh, len)
  else
    result := '';
end;


procedure TForm1.Button1Click(Sender: TObject);
// now we demonstrate the functionality by showing the explorer's command line
var wnd, pid, ph : dword;
begin
  // first we ask the taskbar's window handle and the corresponding process ID
  wnd := FindWindow('Shell_TrayWnd', '');
  GetWindowThreadProcessID(wnd, @pid);

  // then we open the process, which is the explorer, of course
  ph := OpenProcess(PROCESS_ALL_ACCESS, false, pid);

  // and finally show it's command line
  MessageBox(0, pchar('"' + GetProcessCmdLine(ph) + '"'),
             'explorer''s command line...', MB_ICONINFORMATION);

  // again: don't forget to close the handles
  CloseHandle(ph);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  params : array[0..255] of char;
  a : pchar;
  i : integer;
begin
      a := pchar('C:\WINDOWS\system32\notepad.exe');

      for i := 0 to 255 do begin
        params[i] := a[i];
        if params[i] = #0 then
          break;
      end;

      StartupInfo.lpReserved := nil;
      StartupInfo.lpDesktop := nil;
      StartupInfo.lpTitle := nil;
      StartupInfo.dwX := 0;
      StartupInfo.dwY := 0;
      StartupInfo.dwXSize := 0;
      StartupInfo.dwYSize := 0;
      StartupInfo.dwXCountChars := 0;
      StartupInfo.dwYCountChars := 0;
      StartupInfo.dwFillAttribute := 0;
      StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
      StartupInfo.wShowWindow := SW_NORMAL;
      StartupInfo.cbReserved2 := 0;
      StartupInfo.lpReserved2 := nil;
      StartupInfo.hStdInput := 0;
      StartupInfo.hStdOutput := 0;
      StartupInfo.hStdError := 0;
      StartupInfo.cb:= Sizeof(StartupInfo);

      CreateProcess(nil,
          params, // pointer to command line string
          nil,    // pointer to process security attributes
          nil,    // pointer to thread security attributes
          False,  //handle inheritance flag
          CREATE_NEW_CONSOLE or
          NORMAL_PRIORITY_CLASS, // creation flags
          nil, // pointer to new environment block
          nil, // pointer to current directory name
          StartupInfo,
          ProcessInfo);
      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread);
      
end;

procedure TForm1.Button3Click(Sender: TObject);
var
   params : array[0..255] of char;
begin
   RemoteGetCmdLine(params);
end;

end.
