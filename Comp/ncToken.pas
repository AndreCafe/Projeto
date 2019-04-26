unit ncToken;

interface

uses
  MD5,
  SysUtils;

function CreateToken: String;

function GetTokenPass(S: String): String;

function Format2dig(S: String): String;

function TokenPassOk(T, Pass: String): Boolean;

implementation

function CreateToken: String;
begin
  Result := IntToStr(Random(9))+
            IntToStr(Random(9))+
            
            IntToStr(Random(9))+
            IntToStr(Random(9))+
            
            IntToStr(Random(9))+
            IntToStr(Random(9))+
            
            IntToStr(Random(9))+
            IntToStr(Random(9));
end;


type
  IMD5 = packed record 
    i1, i2, i3, i4 : cardinal;
  end;

function SoDig(S: String): String;
var I: integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9'] then 
      Result := Result + S[I];
end;

function TokenPassOk(T, Pass: String): Boolean;
begin
  Result := (SoDig(Pass) = GetTokenPass(T));
end;  
  
function GetTokenPass(S: String): String;
var 
  D : MD5Digest;
  C : Cardinal;
  I : IMD5;
begin
  D := MD5String('nextoken'+S+'nextoken');
  Move(D, I, 16);
  C := I.i1 + I.i2 + I.i3 + I.i4;
  Result := IntToStr(C);
  while (Length(Result) Mod 2 ) <> 0 do Result := Result + '0';
end;

function Format2dig(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do begin
    if (I>1) and ((I mod 2)=1) then
      Result := Result + ' ';
    Result := Result + S[I];
  end;
end;

initialization
  Randomize;

end.
