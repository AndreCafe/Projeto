unit uFmtTel;

interface

  function DDDTel(Tel: String): String;
  
  function FormataTelEntradaCustom(DDD, Tel: String): String;
  function FormataTelSaidaCustom(DDD, Tel: String): String;
  function ObtemOperadora(Tel: String): String;
  function E0800(Tel: String): Boolean;
  function ECelular(Tel: String): Boolean;
  function DiscouDDD(Discou: String): Boolean;

implementation

function DDDTel(Tel: String): String;
begin
  if (Copy(Tel, 1, 4) <> '0800') and
     (Length(Tel)>8) then begin
    Result := '(' + Copy(Tel, 1, 2) + ') ';
    if Length(Tel)>9 then
      Result := Result + Copy(Tel, 3, 4) + '-' + Copy(Tel, 7, 10)
    else  
      Result := Result + Copy(Tel, 3, 3) + '-' + Copy(Tel, 6, 10)
  end else
    Result := Tel;
end;

function FormataTelEntradaCustom(DDD, Tel: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(Tel) do
  if Tel[I] in ['0'..'9'] then
    Result := Result + Tel[I];
  if Length(Result) < 7 then Exit;
  if Result[1] = '0' then Delete(Result, 1, 1);
  if Length(Result) < 9 then
    Result := DDD + Result;
end;

function DiscouDDD(Discou: String): Boolean;
begin
  Discou := FormataTelSaidaCustom('', Discou);  
  Result := (not E0800(Discou)) and (Length(Discou)>8);
end;

function FormataTelSaidaCustom(DDD, Tel: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(Tel) do
  if Tel[I] in ['0'..'9'] then
    Result := Result + Tel[I];
  if Length(Result) < 7 then Exit;

  if Copy(Result, 1, 4) <> '0800' then
  begin
    if Copy(Result, 1, 2)='90' then 
      Delete(Result, 1, 1);
      
    if Result[1] = '0' then
    begin
      Delete(Result, 1, 1);
      Result := Copy(Result, 1, 12);
    end else
      Result := Copy(Result, 1, 8);

    if Length(Result) > 10 then
      Delete(Result, 1, 2);
    if Length(Result) < 9 then
      Result := DDD + Result;
  end else
    Result := Copy(Result, 1, 10);
end;

function ObtemOperadora(Tel: String): String;
var 
  I : Integer;
  S : String;
begin
  Result := '';
  S := '';
  for I := 1 to Length(Tel) do
  if Tel[I] in ['0'..'9'] then
    S := S + Tel[I];
    
  if (Length(S) > 7) and (Copy(S, 1, 4) <> '0800') then
  begin
    if S[1] = '0' then
      Delete(S, 1, 1);
      
    if Length(S) > 10 then
      Result := Copy(S, 1, 2);
  end;
end;

function E0800(Tel: String): Boolean;
begin
  Result := (Copy(Tel, 1, 4)='0800');
end;

function ECelular(Tel: String): Boolean;
begin
  Result := (Length(Tel)>7) and ((Copy(Tel, 3, 1)='9') or (Copy(Tel, 3, 1)='8'));
end;


end.                                      
