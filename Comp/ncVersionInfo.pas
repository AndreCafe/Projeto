unit ncVersionInfo;
{
    ResourceString: Dario 13/03/13
}

interface

uses Windows, SysUtils;

{$I NEX.INC}

function GetVersionInfo(fn:string = ''):String;

var
  SelfVersion: String = '';
  SelfShortVer: String = '';
  ProgShortVer: String = '';

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
    if VerQueryValue(Buf, PChar('\StringFileInfo\041604E4\FileVersion'), Pointer(Value), Len) then // do not localize
        if trim(value)<>'' then
          result := Value;
    FreeMem(Buf, n);
  end
end;

initialization
  try
    SelfVersion := GetVersionInfo;
    SelfShortVer := Copy(SelfVersion, 7, 20);

{$IFDEF LAN}
    ProgShortVer := 'X'+SelfShortVer;
{$ELSE}
    ProgShortVer := 'C'+SelfShortVer;
{$ENDIF}    
  except
  end;


end.

