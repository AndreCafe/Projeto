unit uFaixaInteger;

interface

type
  TFaixaInteger = record
    fiDe, fiAte : Integer;
  end;

  TArrayFaixaInteger = Array of TFaixaInteger;

function ArrayFaixaIntegerToString(A: TArrayFaixaInteger): String;

procedure ArrayFaixaIntegerFromString(var A: TArrayFaixaInteger; S: String);

function IntegerDentroFaixa(A: TArrayFaixaInteger; V: Integer): Boolean;

implementation

uses sysutils;

function IntegerDentroFaixa(A: TArrayFaixaInteger; V: Integer): Boolean;
var I : Integer;
begin
  for I := 0 to High(A) do with A[I] do
    if (V>=fiDe) and (V<=fiAte) then begin
      Result := True;
      Exit;
    end;
  Result := False;
end;


function ArrayFaixaIntegerToString(A: TArrayFaixaInteger): String;
var i: integer;
begin
  Result := '';
  for I := 0 to High(A) do with A[i] do begin
    if I>0 then Result := Result+',';
    Result := Result + IntToStr(fiDe);
    if fiAte<>fiDe then
      Result := Result + '-' + IntToStr(fiAte);
  end;
end;

procedure ArrayFaixaIntegerFromString(var A: TArrayFaixaInteger; S: String);
var 
  Prox: String;
  I, F, T: Integer;

function Proximo: String;
var P: Integer;
begin
  P := Pos(',', S);
  if P>0 then begin
    Result := Copy(S, 1, P-1);
    Delete(S, 1, P);
  end else begin
    Result := S;
    S := '';
  end;
  Result := Trim(Result);
end;  

function CalcIF(Str: String): Boolean;
var P: Integer;
begin
  Result := False;
  F := 0;
  I := 0;
  P := Pos('-', Str);
  if P>0 then begin
    if not TryStrToInt(Trim(Copy(Str, 1, P-1)), I) then Exit;
    if not TryStrToInt(Trim(Copy(Str, P+1, 100)), F) then Exit;
  end else begin
    if not TryStrToInt(Trim(Str), I) then Exit;
    F := I;
  end;
  Result := True;
end;

begin
  SetLength(A, 0);
  T := 0;
  repeat
    Prox := Proximo;
    if (prox>'') and CalcIF(Prox) then begin
      SetLength(A, T+1);
      A[T].fiDe := I;
      A[T].fiAte := I;
      Inc(T);
    end;
  until S='';
end;

end.
