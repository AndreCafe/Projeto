unit uCommonProc;

interface

uses
    SysUtils, Classes, Windows, forms, shellapi, strutils, winsvc, svcMgr;

type
    TBatFileEndsEvent = procedure(Sender:TObject; aTextoutput:string) of object;

    TExecBatFileThread  = class(TThread)
    private
      FBat: string;
      FTextoutput: string;
      fCurrDir:string;
      fOnBatEnds :TBatFileEndsEvent;
    protected
      procedure SyncOnBatEnds;
      procedure Execute; override;
      { Private declarations }
    public
      property OnBatEnds: TBatFileEndsEvent read fOnBatEnds write fOnBatEnds;
      property Bat: string read FBat write FBat;
      property Textoutput: string read FTextoutput;
      constructor Create(aCurrDir:string); reintroduce;
      { Public declarations }
    end;

    function Is64bit:boolean;
    function Capitalize(s:string):string;
    function GetSystem32:string;
    procedure ExecBatFile(aBat, aCurrDir: string; var aTextoutput:string);
    function ExecBatFileAsync(aBat, aCurrDir: string; evt: TBatFileEndsEvent):TThread;
    function GetErrorString(var errnum:Cardinal): string;
    function GetTempFolder:string;
    function NormalizarFilePath (const fp:string):string;
    function ServiceStart(sMachine, sService : string ) : boolean;
    function ServiceStop( sMachine, sService : string ) : boolean;
    function isServiceStarted( sMachine, sService : string ) : boolean;

implementation

function NormalizarFilePath (const fp:string):string;
var
     sfp : string;
begin
     sfp := fp;
     sfp := replaceStr(sfp, '/', '\');
     sfp := replaceStr(sfp, '\\', '\');
     if (length(sfp)>0) and ( sfp[length(sfp)]<>'\' ) then
       sfp := sfp + '\';
     result := sfp;
end;

function GetTempFolder:string;
begin
  result := NormalizarFilePath(SysUtils.GetEnvironmentVariable('TEMP'));
  if not directoryexists(result) then begin
      result := NormalizarFilePath(SysUtils.GetEnvironmentVariable('TMP'));
      if not directoryexists(result) then begin
          result := NormalizarFilePath(extractfilepath(forms.application.ExeName))+ 'temp\';
          forcedirectories(result);
          if not directoryexists(result) then
             result := '.\temp\';
      end;
  end;
end;

function Is64bit:boolean;
begin
    result := sametext (
        SysUtils.GetEnvironmentVariable('PROCESSOR_ARCHITEW6432'),
        'amd64');
end;

function GetSystem32:string;
begin
    result :=
        NormalizarFilePath(SysUtils.GetEnvironmentVariable('windir')+'\System32');
end;

function Capitalize(s:string):string;
begin
  result := s;
  if result<'' then
      result[1]:=UpCase(result[1]);
end;

function GetErrorString(var errnum:Cardinal): string;
var
    err: array[0..512] of Char;
begin
     errnum := GetLastError;
     FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, errnum, 0, @err,
512, nil);
     Result := string(err);
end;


procedure  ExecBatFile(aBat, aCurrDir: string; var aTextoutput:string);
var
    ExecBatFileThread : TExecBatFileThread;
begin
    ExecBatFileThread := TExecBatFileThread.Create(aCurrDir);
    try
       ExecBatFileThread.bat  := aBat;
       ExecBatFileThread.Resume;
       repeat
          forms.application.ProcessMessages;
       until ExecBatFileThread.Terminated;
       aTextoutput := ExecBatFileThread.textoutput;
       ExecBatFileThread.WaitFor;
    finally
       ExecBatFileThread.Free;
    end;
end;

function ExecBatFileAsync(aBat, aCurrDir: string; evt: TBatFileEndsEvent):TThread;
begin
    result := TExecBatFileThread.Create(aCurrDir);
    with result as TExecBatFileThread do begin
        OnBatEnds := evt;
        FreeOnTerminate := true;
        bat  := aBat;
        Resume;
    end;
end;

{ TExecBatFileThread }

constructor TExecBatFileThread.Create(aCurrDir:string);
begin
    inherited create(true);
    FreeOnTerminate := false;
    fCurrDir := aCurrDir;
end;

procedure TExecBatFileThread.Execute;
var
    sz : array[0..255] of char;
    winpath, inputfn, outputfn : string;
    StartupInfo:TStartupInfo;
    ProcessInfo:TProcessInformation;
    err : cardinal;
    txtfile : TStringList;
    sCmdLine : string;
begin
     txtfile := TStringList.Create;
     try
          chdir(fCurrDir);
          inputfn := 'input_'+  inttostr(GetCurrentProcess) + '_' +inttostr(ThreadID) + '.bat';
          outputfn:= 'output_'+  inttostr(GetCurrentProcess) + '_' +inttostr(ThreadID) + '.txt';

          txtfile.Text := FBat;
          txtfile.SaveToFile(inputfn);

          Fillchar(sz, 256,0);
          GetSystemDirectory (sz, 255);
          {$WARNINGS OFF}
          winpath :=  IncludeTrailingBackslash(sz);
          {$WARNINGS ON}

          sCmdLine := inputfn +' > '+outputfn;

          FillChar(StartupInfo,Sizeof(StartupInfo),#0);
          StartupInfo.cb := Sizeof(StartupInfo);
          StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
          StartupInfo.wShowWindow := SW_HIDE;
          // If the function fails, the return value is zero. To get extended error information, call GetLastError.
          if not CreateProcess( pchar(winpath+'cmd.exe'),
            pchar(winpath+'cmd.exe /c "'+ sCmdLine +'"'),  { pointer to command line string }
            nil,                           { pointer to process security attributes }
            nil,                           { pointer to thread security attributes }
            false,                         { handle inheritance flag }
            CREATE_NEW_CONSOLE or          { creation flags }
            NORMAL_PRIORITY_CLASS,
            nil,                           { pointer to new  environment block }
            pchar(fCurrDir),               { pointer to current directory name }
            StartupInfo,                   { pointer to STARTUPINFO }
            ProcessInfo)                   { pointer to PROCESS_INF }
          then begin
             // error
             FTextoutput := GetErrorString(err);
          end else begin
             WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
             GetExitCodeProcess(ProcessInfo.hProcess, cardinal(err));
             CloseHandle( ProcessInfo.hProcess );
             CloseHandle( ProcessInfo.hThread );
          end;

         if fileexists (outputfn) then begin
             txtfile.LoadFromFile(outputfn);
             FTextoutput := txtfile.Text;
             deletefile(pchar(outputfn));
         end;

         deletefile(pchar(inputfn));
     finally
         txtfile.Free
     end;

     Synchronize(SyncOnBatEnds);

     terminate;
end;

procedure TExecBatFileThread.SyncOnBatEnds;
begin
    if assigned(fOnBatEnds) then
        fOnBatEnds(self, FTextoutput);
end;

// start service
// return TRUE if successful
// sMachine:
//   machine name, ie: \\SERVER
//   empty = local machine
// sService
//   service name, ie: Alerter
var
  schm   : SC_Handle;  // service control manager handle
  schs   : SC_Handle;  // service handle
  ss     : TServiceStatus; // service status
  psTemp : PChar;  // temp char pointer
  dwChkP : DWord; // check point
function ServiceStart(sMachine, sService : string ) : boolean;
begin
  ss.dwCurrentState := maxint;
  
  // connect to the service control manager
  schm := OpenSCManager( PChar(sMachine), Nil, SC_MANAGER_CONNECT);
  // if successful...
  if(schm > 0)then begin
    // open a handle to
    // the specified service
    schs := OpenService( schm, PChar(sService), SERVICE_START or SERVICE_QUERY_STATUS);
    // if successful...
    if(schs > 0)then begin
      psTemp := Nil;
      if(StartService( schs, 0, psTemp))then begin
        // check status
        if(QueryServiceStatus( schs, ss))then begin
          while(SERVICE_RUNNING <> ss.dwCurrentState)do begin
            // dwCheckPoint contains a value that the service increments periodically
            // to report its progress during a lengthy operation. save current value
            dwChkP := ss.dwCheckPoint;
            // wait a bit before checking status again
            // dwWaitHint is the estimated amount of time  the calling program
            // should wait before calling QueryServiceStatus() again
            // idle events should be  handled here...
            Sleep(ss.dwWaitHint);

            if(not QueryServiceStatus( schs, ss))then begin
              // couldn't check status  break from the loop
              break;
            end;

            if(ss.dwCheckPoint < dwChkP)then
            begin
              // QueryServiceStatus didn't increment dwCheckPoint as it should have.
              // avoid an infinite  loop by breaking
              break;
            end;
          end;
        end;
      end;
      // close service handle
      CloseServiceHandle(schs);
    end;
    // close service control  manager handle
    CloseServiceHandle(schm);
  end;

  // return TRUE if  the service status is running
  Result := SERVICE_RUNNING = ss.dwCurrentState;
end;

// stop service
// return TRUE if successful
// sMachine:
//   machine name, ie: \\SERVER
//   empty = local machine
// sService
//   service name, ie: Alerter
//
function ServiceStop( sMachine, sService : string ) : boolean;
var
  schm   : SC_Handle; // service control manager handle
  schs   : SC_Handle; // service handle
  ss     : TServiceStatus; // service status
  dwChkP : DWord; // check point
begin
  // connect to the service control manager
  schm := OpenSCManager( PChar(sMachine), Nil, SC_MANAGER_CONNECT);

  // if successful...
  if(schm > 0)then begin
    // open a handle to the specified service
    schs := OpenService( schm, PChar(sService), SERVICE_STOP or SERVICE_QUERY_STATUS);

    // if successful...
    if(schs > 0)then
    begin
      if(ControlService( schs, SERVICE_CONTROL_STOP, ss))then begin
        // check status
        if(QueryServiceStatus( schs, ss))then begin
          while(SERVICE_STOPPED <> ss.dwCurrentState)do begin
            // dwCheckPoint contains a value that the service increments periodically
            // to report its progress during a lengthy operation. save current value
            dwChkP := ss.dwCheckPoint;
            // wait a bit before checking status again
            // dwWaitHint is the estimated amount of time the calling program
            // should wait before calling QueryServiceStatus() again
            // idle events should be handled here...
            Sleep(ss.dwWaitHint);

            if(not QueryServiceStatus( schs, ss))then begin
              // couldn't check status break from the loop
              break;
            end;

            if(ss.dwCheckPoint < dwChkP)then begin
              // QueryServiceStatus didn't increment dwCheckPoint as it should have.
              // avoid an infinite loop by breaking
              break;
            end;
          end;
        end;
      end;
      // close service handle
      CloseServiceHandle(schs);
    end;
    // close service control manager handle
    CloseServiceHandle(schm);
  end;

  // return TRUE if the service status is stopped
  Result := SERVICE_STOPPED = ss.dwCurrentState;
end;

function isServiceStarted( sMachine, sService : string ) : boolean;
var
  schm   : SC_Handle; // service control manager handle
  schs   : SC_Handle; // service handle
  ss     : TServiceStatus; // service status
begin
  result := false;
  // connect to the service control manager
  schm := OpenSCManager( PChar(sMachine), Nil, SC_MANAGER_CONNECT);
  // if successful...
  if(schm > 0)then begin
    // open a handle to the specified service
    schs := OpenService( schm, PChar(sService), SERVICE_STOP or SERVICE_QUERY_STATUS);
    // if successful...
    if(schs > 0)then begin
        if(QueryServiceStatus( schs, ss))then
          result := (SERVICE_RUNNING = ss.dwCurrentState);
        // close service handle
        CloseServiceHandle(schs);
    end;
    // close service control manager handle
    CloseServiceHandle(schm);
  end;

end;


end.
