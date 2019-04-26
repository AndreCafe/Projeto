unit ncHttp;

interface

uses 
  SysUtils, Classes, IdTCPConnection, IdTCPClient, IdHTTP;

  function httpPost(aURL, aParams: String): String;
  function httpGet(aURL: String): String;
  function MesmaURL(A, B: String): Boolean;
  
  

implementation

uses uNR_chaveseg;

function MesmaURL(A, B: String): Boolean;

function NormURL(S: String): String;
begin
  if pos('http://', S)=1 then
    Delete(S, 1, 7);
  if pos('www.', S)=1 then
    Delete(S, 1, 4);
  if Copy(S, Length(S), 1)='/' then
    Delete(S, Length(S), 1);
end;

begin
  A := LowerCase(A);
  B := LowerCase(B);
  Result := SameText(NormURL(A), NormURL(B));
end;

function httpPost(aURL, aParams: String): String;
var 
  H : TidHttp;
  sl : TStrings;
  i : integer;
begin
  try
    H := TidHttp.Create(nil);
    sl := TStringList.Create;
    try
      H.HandleRedirects := True;
      sl.Text := aParams;
      for I := 0 to sl.Count - 1 do
        sl.ValueFromIndex[i] := AnsiToUTF8(sl.ValueFromIndex[i]);
      Result := H.Post(aUrl, sl);  
    finally
      H.Free;
      sl.Free;
    end;
  except
  end;
end;

function httpGet(aURL: String): String;
var 
  H : TidHttp;
begin
  try
    H := TidHttp.Create(nil);
    try
      H.HandleRedirects := True;
      Result := H.Get(aUrl);
    finally
      H.Free;
    end;
  except
  end;
end;



end.
