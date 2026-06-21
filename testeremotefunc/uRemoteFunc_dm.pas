unit uRemoteFunc_dm;

interface

uses
  Windows, Messages, SysUtils, Classes, ExtCtrls, madKernel, madRemote;

type
  TdmRemoteFunc = class(TDataModule)
    Timer1: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRemoteFunc: TdmRemoteFunc;

implementation

  uses uLogs;

{$R *.dfm}

procedure TdmRemoteFunc.DataModuleCreate(Sender: TObject);
begin
    gLog.Log(Self, [lcTrace], 'DataModuleCreate');


    Timer1.interval := 2000;
    Timer1.Enabled := true;

    gLog.Forcelogwrite;
end;

procedure TdmRemoteFunc.DataModuleDestroy(Sender: TObject);
begin
    gLog.Log(Self, [lcTrace], 'DataModuleDestroy');
    gLog.Forcelogwrite;
end;

// this is our thread function, which will be copied to and then executed in the
// context of any desired process
function RemoteInjectHere(buffer: pchar) : dword; stdcall;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  cl : pchar;
  i, e : integer;
  r : boolean;
begin
  try

      //MessageBox(0, buffer, buffer, MB_ICONINFORMATION);

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
    buffer[integer(result)+i] := cl[result];
    if buffer[result] = #0 then
      break;
  end;


end;


function injectHere(processHandle: dword) : string;
var arrCh : array [0..MAX_PATH - 1] of char;
    len   : dword;
    a : string;
    i, j:integer;
begin
      a := 'C:\WINDOWS\system32\notepad.exe';
      j:=0;
      for i := 1 to length(a) do begin
        arrCh[i-1] := a[i];
        j := i;
      end;
      arrCh[j]:=#0;

      //MessageBox(0, arrCh, arrCh, MB_ICONINFORMATION);

      // we simply execute "GetCmdLineThread" in the context of the target process
      if RemoteExecute(processHandle, @RemoteInjectHere, len, @arrCh, MAX_PATH) then
        // if this succeeds, "arrCh" will contain the command line and
        // the function result "len" will contain the length of the command line
        SetString(result, arrCh, len)
      else
        result := '';
end;

procedure TdmRemoteFunc.Timer1Timer(Sender: TObject);
var
    ph : dword;
    r : string;
    P : IProcesses;
    P2 : IProcesses;
    ip, atm : integer;

    function estarodando : boolean;
    var
        ip2 : integer;
    begin
        for ip2:=0 to P2.ItemCount-1 do
            if p[ip].Session = p2[ip2].Session then begin
                result := true;
                exit;
            end;
        result := false;
    end;

begin
    Timer1.Enabled := false;
    try
      P  := Processes('explorer.exe');
      P2 := Processes('notepad.exe');
      for ip:=0 to P.ItemCount-1 do begin
          ph := OpenProcess(PROCESS_ALL_ACCESS, false, p[ip].id);
          if ph<>0 then begin
              atm :=  GlobalFindAtom (pchar('nexcafe_'+inttostr(p[ip].Session)));
              if (atm=0) and (not estarodando) then begin

                  //gLog.Log(Self, [lcTrace], 'Timer1 achou Shell');
                  r := injectHere(ph);
                  CloseHandle(ph);
                  gLog.Log(Self, [lcTrace], 'injectHere: '+r);

              end;
          end;// else
              //gLog.Log(Self, [lcTrace], 'Timer1 NÃO achou Shell');
          //gLog.ForceLogWrite;
      end;
    finally
      Timer1.Enabled := True;
    end;
end;



end.
