unit uCMGDesliga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

function Desliga(Flags: Cardinal): Boolean;

{
EWX_FORCE	Forces processes to terminate. When this flag is set, Windows does not
          send the messages WM_QUERYENDSESSION and WM_ENDSESSION to the
          applications currently running in the system. This can cause the
          applications to lose data. Therefore, you should only use this flag
          in an emergency.

EWX_LOGOFF	Shuts down all processes running in the security context of the
            process that called the ExitWindowsEx function. Then it logs
            the user off.

EWX_POWEROFF	Shuts down the system and turns off the power. The system must
              support the power-off feature.

EWX_REBOOT	Shuts down the system and then restarts the system.

EWX_SHUTDOWN Shuts down the system to a point at which it is safe to turn
             off the power. All file buffers have been flushed to disk, and all
             running processes have stopped.
}

implementation

function Desliga(Flags: Cardinal): Boolean;
var
   buffer: DWord;
   tkp, tpko: TTokenPrivileges;
   hToken: THandle;
begin
  Result := False;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    if not OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
      hToken) then
    begin
      exit;
    end;
    LookupPrivilegeValue(nil, 'SeShutdownPrivilege', tkp.Privileges[0].Luid);
    tkp.PrivilegeCount := 1;
    tkp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
    if not Windows.AdjustTokenPrivileges(hToken, FALSE, tkp, sizeof(tkp), tpko, buffer) then
    begin
      exit;
    end;
  end;
  Result := ExitWindowsEx(Flags, 0);
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Windows.AdjustTokenPrivileges(hToken, FALSE,tpko, sizeOf(tpko), tkp, Buffer);
    Windows.CloseHandle(hToken);
  end;
end;

end.
