unit ncVersionInfo;

interface

uses Windows, SysUtils;

function GetVersionInfo(fn:string = ''):String;

var
  SelfVersion: String = '';

implementation

function GetVersionInfo(fn:string = ''):String;
var
  n, Len: DWORD;
  Buf: PChar;
  Value: PChar;
begin
  if fn='' then fn := paramstr(0);
  
  result :='';
  n := GetFileVersionInfoSize(PChar(fn), n);
  if n > 0 then
  begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(fn), 0, n, Buf);
    if VerQueryValue(Buf, PChar('\StringFileInfo\041604E4\FileVersion'), Pointer(Value), Len) then
        if trim(value)<>'' then
          result := Value;
    FreeMem(Buf, n);
  end
end;

initialization
  try
    SelfVersion := GetVersionInfo;
  except
  end;


end.
