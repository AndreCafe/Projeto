unit ncgBackupPrinters;

interface

uses SysUtils, Windows, Classes, WinSvc;

procedure BackupPrinters(const aIgnoraSeJaExiste: Boolean = True);
procedure RestorePrinters(const aApagaArqs: Boolean = True);

implementation

uses ncPRConsts, ncDebug, ncShellStart;

const
   DeleteKey1 = 'HKCU\Printers';
   DeleteKey2 = 'HKCU\Software\Microsoft\Windows NT\CurrentVersion\Devices';
   DeleteKey3 = 'HKCU\Software\Microsoft\Windows NT\CurrentVersion\PrinterPorts';
   DeleteKey4 = 'HKLM\SYSTEM\CurrentControlSet\Control\Print';

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

var
  schm   : SC_Handle;  // service control manager handle
  schs   : SC_Handle;  // service handle
  ss     : _Service_Status; // service status
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
        if ControlService(schs, SERVICE_CONTROL_INTERROGATE, ss) then begin
          while(SERVICE_RUNNING <> ss.dwCurrentState)do begin
            // dwCheckPoint contains a value that the service increments periodically
            // to report its progress during a lengthy operation. save current value
            dwChkP := ss.dwCheckPoint;
            // wait a bit before checking status again
            // dwWaitHint is the estimated amount of time  the calling program
            // should wait before calling QueryServiceStatus() again
            // idle events should be  handled here...
            Sleep(ss.dwWaitHint);

            if not ControlService(schs, SERVICE_CONTROL_INTERROGATE, ss) then
              // couldn't check status  break from the loop
              break;

            if(ss.dwCheckPoint < dwChkP)then
              // QueryServiceStatus didn't increment dwCheckPoint as it should have.
              // avoid an infinite  loop by breaking
              break;
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
  ss     : _Service_Status; // service status
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
      if (ControlService( schs, SERVICE_CONTROL_STOP, ss))then begin
        // check status
        if ControlService(schs, SERVICE_CONTROL_INTERROGATE, ss) then begin
          while(SERVICE_STOPPED <> ss.dwCurrentState)do begin
            // dwCheckPoint contains a value that the service increments periodically
            // to report its progress during a lengthy operation. save current value
            dwChkP := ss.dwCheckPoint;
            // wait a bit before checking status again
            // dwWaitHint is the estimated amount of time the calling program
            // should wait before calling QueryServiceStatus() again
            // idle events should be handled here...
            Sleep(ss.dwWaitHint);

            if not ControlService(schs, SERVICE_CONTROL_INTERROGATE, ss) then 
              Break;

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


function WinExecAndWait32(FileName: string; Dir: String; Visibility: Integer; aWait: Boolean): Longword;
var { by Pat Ritchey }
  zAppName: array[0..512] of Char;
  zCurDir: array[0..255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb          := SizeOf(StartupInfo);
  StartupInfo.dwFlags     := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil,
    zAppName, // pointer to command line string
    nil, // pointer to process security attributes
    nil, // pointer to thread security attributes
    False, // handle inheritance flag
    CREATE_NEW_CONSOLE or // creation flags
    NORMAL_PRIORITY_CLASS,
    nil, //pointer to new environment block
    PChar(Dir), // pointer to current directory name
    StartupInfo, // pointer to STARTUPINFO
    ProcessInfo) // pointer to PROCESS_INF
    then Result := WAIT_FAILED
  else
  begin
    if aWait then begin
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      GetExitCodeProcess(ProcessInfo.hProcess, Result);
    end;
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
end; 

function SaveRegKey(k,fn,dir:string):boolean;
var s: string;
begin
    s := '/ES '+fn+' "'+k+'"';
    DebugMsg('SaveRegKey - '+s);
    WinExecAndWait32(SysUtils.GetEnvironmentVariable('windir')+'\regedit.exe '+s, dir, sw_hide, true);
End;

function RestoreRegKey(k,fn, dir:string):boolean;
var s: string;
begin
    s := '/CS '+fn+' "'+k+'"';
    DebugMsg('RestoreRegKey - '+s);
    WinExecAndWait32(SysUtils.GetEnvironmentVariable('windir')+'\regedit.exe '+s, dir, sw_hide, true);
End;

function DeleteRegKey(k, dir:string):boolean;
var s: string;
begin
  s := '  DELETE ' + K + ' /f';
  DebugMsg('DeleteRegKey - '+k);
  WinExecAndWait32(SysUtils.GetEnvironmentVariable('windir')+'\system32\reg.exe '+s, dir, sw_hide, true);
End;

procedure BackupPrinters(const aIgnoraSeJaExiste: Boolean = true);
var s: string;
begin
  DebugMsg('BackupPrinters');

  S := PRFolder(prfolder_backup);
  if (not aIgnoraSeJaExiste) or
     (not FileExists(S+'printers.reg')) or
     (not FileExists(S+'devices.reg')) or 
     (not FileExists(S+'printerports.reg')) or
     (not FileExists(S+'print.reg'))
  then begin   
    S := ExtractFileDir(S);
    DebugMsg('BackupPrinters - Destino: ' + S);
    ForceDirectories(S);
    ChDir(ExtractFileDir(S));
    SaveRegKey( 'HKEY_CURRENT_USER\Printers', 'printers.reg', s);
    SaveRegKey( 'HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Devices', 'devices.reg', s);
    SaveRegKey( 'HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\PrinterPorts', 'printerports.reg', s);
    SaveRegKey( 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print', 'print.reg', s);
  end;
end;

procedure RestorePrinters(const aApagaArqs: Boolean = true);
var 
  s: string;
begin
  S := PRFolder(prfolder_backup);

  if not DirectoryExists(S) then Exit;


  DebugMsg('RestorePrinters - Origem: ' + S); 

  if FileExists(S+'printers.reg') and
     FileExists(S+'devices.reg') and
     FileExists(S+'printerports.reg') and
     FileExists(S+'print.reg') then
  begin
      if isServiceStarted('','Spooler') then ServiceStop('','Spooler');
      DeleteRegKey(DeleteKey1, s);
      DeleteRegKey(DeleteKey2, s);
      DeleteRegKey(DeleteKey3, s);
      DeleteRegKey(DeleteKey4, s);
      ChDir(S);
      RestoreRegKey( 'HKEY_CURRENT_USER\Printers', 'printers.reg', s);
      RestoreRegKey( 'HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Devices', 'devices.reg', s);
      RestoreRegKey( 'HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\PrinterPorts', 'printerports.reg', s);
      RestoreRegKey( 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print', 'print.reg', s); 
      if not isServiceStarted('','Spooler') then ServiceStart('','Spooler');
  end;

  if aApagaArqs then begin
    DebugMsg('RestorePrinters - Apagar');
    DeleteFile(PAnsiChar(S+'devices.reg'));
    DeleteFile(PAnsiChar(S+'printerports.reg'));
    DeleteFile(PAnsiChar(S+'print.reg'));
    DeleteFile(PAnsiChar(S+'printers.reg'));
  end else
    DebugMsg('RestorePrinters - Não apagar');
end;


end.
