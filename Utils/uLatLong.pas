unit uLatLong;

interface

uses
  Math,
  SysUtils;

  function LongitudeToStr(L: double): String;
  function LatitudeToStr(L: double): String;

  function StrToLatitude(S: String): double;
  function StrToLongitude(S: String): double;

  function EncodeLatitude(G, M: Integer; S: Double): double;
  function EncodeLongitude(G, M: Integer; S: Double): double;
  procedure DecodeLatitude(L: double; var G, M: Integer; var S: Double);
  procedure DecodeLongitude(L: double; var G, M: Integer; var S: Double);
  function DistanciaCG(lat1, lat2, long1, long2: double): double;

const
  sGrau = '°';
  sMin  = '''';
  sSeg  = '"';

implementation

function DistanciaCG(lat1, lat2, long1, long2: double): double;
begin
  try
    Result := 180*111.2*arccos(sin(PI*lat1/180)*sin(PI*lat2/180)+cos(PI*lat1/180)*cos(PI*lat2/180)*cos(PI*(long1-long2)/180))/PI;
  except
    Result := 0;
  end;
end;

function StrToLatitude(S: String): double;
var
  G, M, P, Code: Integer;
  LS : Double;
begin
  P := Pos(sGrau, S);
  if P=0 then
    Exception.Create('Latitude inválida');
  try
    G := StrToInt(Copy(S, 1, P-1));
    Delete(S, 1, P);
  except
    Raise Exception.Create('Latitude Inválida');
  end;
  
  P := Pos(sMin, S);
  if P=0 then
    Exception.Create('Latitude inválida');
  try
    M := StrToInt(Copy(S, 1, P-1));
    Delete(S, 1, P);
  except
    Raise Exception.Create('Latitude Inválida');
  end;

  P := Pos(sSeg, S);
  if P=0 then
    Exception.Create('Latitude inválida');
  try
    LS := 0;
    Val(Copy(S, 1, P-1), LS, Code);
    Delete(S, 1, P);
    if LS>60 then Exception.Create('Seconds must be less than 60');
  except
    Raise Exception.Create('Latitude Inválida');
  end;

  Result := EncodeLatitude(G, M, LS);  
end;

function StrToLongitude(S: String): double;
var
  G, M, P, Code: Integer;
  LS : Double;
begin
  P := Pos(sGrau, S);
  if P=0 then
    Exception.Create('Longitude inválida');
  try
    G := StrToInt(Copy(S, 1, P-1));
    Delete(S, 1, P);
  except
    Raise Exception.Create('Longitude Inválida');
  end;
  
  P := Pos(sMin, S);
  if P=0 then
    Exception.Create('Longitude inválida');
  try
    M := StrToInt(Copy(S, 1, P-1));
    Delete(S, 1, P);
  except
    Raise Exception.Create('Longitude Inválida');
  end;

  P := Pos(sSeg, S);
  if P=0 then
    Exception.Create('Longitude inválida');
  try
    LS := 0;
    Val(Copy(S, 1, P-1), LS, Code);
    Delete(S, 1, P);
    if LS>60 then Exception.Create('Seconds must be less than 60');
  except
    Raise Exception.Create('Longitude Inválida');
  end;

  Result := EncodeLongitude(G, M, LS);  
end;

function EncodeLatitude(G, M: Integer; S: Double): double;
begin
  if (G < -90) or (G > 90) then
    Raise Exception.Create('Grau da latitude tem que estar dentro da faixa -90 a 90');

  if (M < 0) or (M>59) then
    Raise Exception.Create('Minuto tem que estar dentro da faixa 0 a 59');

  if (S < 0) or (S>=60) then
    Raise Exception.Create('Segundo tem que estar dentro da faixa 0 a 59');

  if G<0 then begin
    S := -1 * S;
    M := -1 * M;
  end;  

  Result := G + (S / 3600) + (M / 60);
end;

function EncodeLongitude(G, M: Integer; S: Double): double;
begin
  if (G < -180) or (G > 180) then
    Raise Exception.Create('Grau da longitude tem que estar dentro da faixa -180 a 180');

  if (M < 0) or (M>59) then
    Raise Exception.Create('Minuto tem que estar dentro da faixa 0 a 59');

  if (S < 0) or (S>=60) then
    Raise Exception.Create('Segundo tem que estar dentro da faixa 0 a 59');
    
  if G<0 then begin
    S := -1 * S;
    M := -1 * M;
  end;  
  
  Result := G + (S / 3600) + (M / 60);
end;

procedure DecodeLatitude(L: double; var G, M: Integer; var S: Double);
begin
  G := Trunc(Int(L));
  M := Trunc(Frac(L) * 60);
  S := Abs((Frac(L)*3600) - (M*60));
  M := Abs(M);
end;

procedure DecodeLongitude(L: double; var G, M: Integer; var S: Double);
begin
  DecodeLatitude(L, G, M, S);
end;

function ZeroPad(N: Double; T: Integer; Decimais: Integer=0): String;
var
  SDec: String;
begin
  Str(N:0:Decimais, Result);
  if Decimais>0 then begin
    SDec := Copy(Result, Pos('.', Result)+1, Decimais);
    while length(SDec) < Decimais do SDec := SDec + '0';
    SDec := '.'+SDec;
  end else
    SDec := '';
  Delete(Result, Pos('.', Result), length(Result));
  
  while Length(Result) < T do 
    if Result[1]='-' then
      Result := '-0'+Copy(Result, 2, T)
    else
      Result := '0' + Result;
  Result := Result + SDec;    
end;  

function LatitudeToStr(L: double): String;
var G, M: Integer; S: Double;
begin
  DecodeLatitude(L, G, M, S);
  Result := ZeroPad(G, 3) + sGrau + 
            ZeroPad(M, 2) + sMin +
            ZeroPad(S, 2, 2) + sSeg;
end;

function LongitudeToStr(L: double): String;
var G, M: Integer; S: Double;
begin
  DecodeLongitude(L, G, M, S);
  Result := ZeroPad(G, 4) + sGrau +
            ZeroPad(M, 2) + sMin +
            ZeroPad(S, 2, 2) + sSeg;
end;


end.
