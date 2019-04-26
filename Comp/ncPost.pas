unit ncPost;

interface

uses 
  SysUtils, Classes, IdTCPConnection, IdTCPClient, IdHTTP;

  procedure httpPost(aURL, aParams: String);

implementation

procedure httpPost(aURL, aParams: String);  
var 
  H : TidHttp;
  sl : TStrings;
  i : integer;
begin
  try
    H := TidHttp.Create;
    sl := TStringList.Create;
    try
      sl.Text := aParams;
      for I := 0 to sl.Count - 1 do
        sl.ValueFromIndex[i] := AnsiToUTF8(sl.ValueFromIndex[i]);
      H.Post(aUrl, sl);  
    finally
      H.Free;
      sl.Free;
    end;
  except
  end;
end;


end.
