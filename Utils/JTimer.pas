unit JTimer;

interface

uses Windows;

type
  
  TJTimer = packed record
    Inicio: DWord;
    Termino: DWord;
    Extrapolou: Boolean;
  end;

  procedure JTInicia(var JT: TJTimer; Intervalo: DWord);
  function JTFaltam(JT: TJTimer): DWord;
  function JTExpirou(JT: TJTimer): Boolean;

  
const
  JTMinTime = 1; // 1 milisegundo
  JTMaxTime = 1000 * 60 * 60;  // 1 Hora
  JTDefTime = 30 * 1000;  // 30 segundos

implementation

procedure JTInicia(var JT: TJTimer; Intervalo: DWord);
begin
  if (Intervalo < JTMinTime) or (Intervalo > JTMaxTime) then
    Intervalo := JTDefTime;
  JT.Inicio  := GetTickCount;
  JT.Termino := JT.Inicio + Intervalo;
  if JT.Termino = 0 then
    Inc(JT.Termino);
  JT.Extrapolou := (JT.Termino < JT.Inicio);
end;

function JTFaltam(JT: TJTimer): DWord;
var 
  R : Int64;
  Now : DWord;
begin
  with JT do begin
    Now := GetTickCount;
    if Extrapolou then
      R := High(DWord) + Termino
    else 
      R := Termino;
    if Now = Inicio then
      Result := R - Inicio
    else if (R > Now) and ((Now > Inicio) or Extrapolou) then
      Result := (R - Now)
    else
      Result := 0;
  end;      
end;

function JTExpirou(JT: TJTimer): Boolean;
begin
  Result := (JTFaltam(JT) = 0);
end;

end.
