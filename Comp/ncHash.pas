unit ncHash;

interface

uses SysUtils, DCPcrypt2, DCPsha256;


function nexHashKey(S: String): String;

implementation

function nexHashKey(S: String): String;
var 
  H: TDCP_sha256;
  I: Integer;
  Digest : Array[0..63] of Byte;
begin
  H := TDCP_sha256.Create(nil);
  try
    H.Init;
    H.UpdateStr(S);
    H.Final(Digest);
    Result := '';
    for I := 0 to 31 do 
      Result := Result + IntToHex(Digest[I], 2);
    Result := LowerCase(result);  
  finally
    H.Free;
  end;
end;

end.
