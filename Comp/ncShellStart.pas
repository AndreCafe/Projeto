unit ncShellStart;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  Windows,
  SysUtils,
  ShellApi;

procedure ShellStart(aCmd: String; aParams: String=''; aDirectory: String=''; FormHWND: HWND = 0);
procedure ShellStartCustom(aCmd, aParams, aDir: String; FormHWND: HWND; nShow: Integer = SW_SHOWNORMAL; aVerb: String = 'open'; aWait:boolean=false; aWaitTime: cardinal = INFINITE); // do not localize


implementation

procedure ShellStart(aCmd: String; aParams: String=''; aDirectory: String=''; FormHWND: HWND = 0);
begin
  ShellStartCustom(aCmd, aParams, aDirectory, FormHWND);
end;

procedure ShellStartCustom(aCmd, aParams, aDir: String; FormHWND: HWND; nShow: Integer = SW_SHOWNORMAL; aVerb: String = 'open'; aWait:boolean=false; aWaitTime: Cardinal = INFINITE); // do not localize
var
  ExecInfo: TShellExecuteInfo;
begin
  if Trim(aCmd)='' then Exit;
  
  ExecInfo.hProcess := 0;
  
  ExecInfo.cbSize       := SizeOf(TShellExecuteInfo);
//  if aWait then
    ExecInfo.fMask        := SEE_MASK_NOCLOSEPROCESS;
  ExecInfo.Wnd          := FormHWND;
  ExecInfo.lpVerb       := PChar(aVerb);
  ExecInfo.lpFile       := PChar(aCmd);
  ExecInfo.lpParameters := PChar(aParams);
  ExecInfo.lpDirectory  := PChar(aDir);
  ExecInfo.nShow        := nShow;

  //open - execute the specified file
  ShellExecuteEx(@ExecInfo);
  if (ExecInfo.hProcess<>0) then begin
    if aWait then
      WaitforSingleObject(ExecInfo.hProcess, aWaitTime);
    CloseHandle( ExecInfo.hProcess );
  end;

end;

end.

