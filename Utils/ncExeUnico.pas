{$I NEX.INC}
unit ncExeUnico;

interface

uses SysUtils, Windows;

procedure InitExeUnico;

var
  ExeJaExiste: Boolean = False;
  MutexHandle : THandle = 0;

implementation

procedure InitExeUnico;
var buffer: String;
begin
{$ifdef LOJA}
  buffer:=ExtractFileName(ParamStr(0))+'_exeunico_nex';
{$else}
  buffer:=ExtractFileName(ParamStr(0))+'_exeunico';
{$endif}  
  MutexHandle:=CreateMutex(nil, false, PChar(buffer));
  if MutexHandle<>0 then
    ExeJaExiste := (GetLastError=ERROR_ALREADY_EXISTS);
end;

initialization
  ExeJaExiste := False;
  MutexHandle := 0;

finalization
  if (MutexHandle<>0) then
    CloseHandle(MutexHandle);

end.
