unit cmProxyProt;

interface

uses
  SysUtils, Classes, Windows, cmProtecao;

  function CriaProt: TCMProtegeWindows;
  
type  
  TCriaProtecao = function : Integer;
  

implementation

function CriaProt: TCMProtegeWindows;
var 
  CP: TCriaProtecao;
  H : THandle;
begin
{  if Win32Platform = VER_PLATFORM_WIN32_NT then 
    H := LoadLibrary('ProtNT.dll')
  else       }
    H := LoadLibrary('Prot98.dll');  
  @CP := GetProcAddress(H, 'CriaProtecao');
  Result := TCMProtegeWindows(CP);
end;  


end.
