unit ncShellStart;

interface

uses
  Windows,
  SysUtils,
  ShellApi;

procedure ShellStart(aCmd: String; aParams: String=''; aDirectory: String=''; FormHWND: HWND = 0);

implementation

procedure ShellStart(aCmd: String; aParams: String=''; aDirectory: String=''; FormHWND: HWND = 0);
var
  ExecInfo: TShellExecuteInfo;
begin
  if Trim(aCmd)='' then Exit;
  
  ExecInfo.hProcess := 0;
  
  ExecInfo.cbSize       := SizeOf(TShellExecuteInfo);
  ExecInfo.fMask        := SEE_MASK_NOCLOSEPROCESS;
  ExecInfo.Wnd          := FormHWND;
  ExecInfo.lpVerb       := PChar('open');
  ExecInfo.lpFile       := PChar(aCmd);
  ExecInfo.lpParameters := PChar(aParams);
  ExecInfo.lpDirectory  := PChar(aDirectory);
  ExecInfo.nShow        := SW_SHOWNORMAL;

  //open - execute the specified file
  ShellExecuteEx(@ExecInfo);
  if ExecInfo.hProcess<>0 then CloseHandle(ExecInfo.hProcess);
end;

end.
