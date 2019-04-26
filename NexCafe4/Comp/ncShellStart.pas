unit ncShellStart;

interface

uses
  Windows,
  SysUtils,
  ShellApi;

procedure ShellStart(aCmd: String; aParams: String=''; aDirectory: String=''; FormHWND: HWND = 0);
procedure ShellStartCustom(aCmd, aParams, aDir: String; FormHWND: HWND; nShow: Integer = SW_SHOWNORMAL; aVerb: String = 'open');


implementation

procedure ShellStart(aCmd: String; aParams: String=''; aDirectory: String=''; FormHWND: HWND = 0);
begin
  ShellStartCustom(aCmd, aParams, aDirectory, FormHWND);
end;

procedure ShellStartCustom(aCmd, aParams, aDir: String; FormHWND: HWND; nShow: Integer = SW_SHOWNORMAL; aVerb: String = 'open');
var
  ExecInfo: TShellExecuteInfo;
begin
  if Trim(aCmd)='' then Exit;
  
  ExecInfo.hProcess := 0;
  
  ExecInfo.cbSize       := SizeOf(TShellExecuteInfo);
  ExecInfo.fMask        := SEE_MASK_NOCLOSEPROCESS;
  ExecInfo.Wnd          := FormHWND;
  ExecInfo.lpVerb       := PChar(aVerb);
  ExecInfo.lpFile       := PChar(aCmd);
  ExecInfo.lpParameters := PChar(aParams);
  ExecInfo.lpDirectory  := PChar(aDir);
  ExecInfo.nShow        := nShow;

  //open - execute the specified file
  ShellExecuteEx(@ExecInfo);
  if ExecInfo.hProcess<>0 then CloseHandle(ExecInfo.hProcess);
end;

end.
