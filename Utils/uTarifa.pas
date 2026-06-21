unit uTarifa;

interface

uses
  SysUtils;

type
  TMedicaoLocal = (mlSimples, mlTempo);

  THoraCel = (hcNormal, hcReduzida);

  THoraDDD = (hdNormal, hdDif, hdRed, hdSuperRed);

  TDistGeo = (dgDC, dgD1, dgD2, dgD3, dgD4);

  TComCelular = (ccVC1, ccVC2, ccVC3);


const  
  hcStrings : Array[THoraCel] of Char = ('N', 'R');
  hdStrings : Array[THoraDDD] of String[2] = (
    'N', 'D', 'R', 'SR');

  mlStrings : Array[TMedicaoLocal] of Char = ('S', 'T');  

  dgStrings : Array[TDistGeo] of String[2] = (
    'DC', 'D1', 'D2', 'D3', 'D4');

  ccStrings : Array[TComCelular] of String[3] = (
    'VC1', 'VC2', 'VC3');

type
  POperadora = ^TOperadora;

  TArrayTarifasF = Array[TDistGeo, THoraDDD] of Extended;
  TArrayTarifasC = Array[TComCelular, THoraCel] of Extended;
  
  TOperadora = packed record
    opCodigo     : Byte;
    opTempoFI    : Integer; 
    opTempoFA    : Integer;
    opTempoCI    : Integer;
    opTempoCA    : Integer;
    opTarifasF   : TArrayTarifasF;
    opTarifasFA  : TArrayTarifasF;
    opTarifasC   : TArrayTarifasC;
    opTarifasCA  : TArrayTarifasC;
    opFatiarFixo : Boolean;
    opTempoMinFF : Integer;
    opFatiarCel  : Boolean;
    opTempoMinFC : Integer;
  end;
  
  function DateTimeToSegundos(D: TDateTime): Integer;
  
  function CalcNumPulsos(Inicio, Fim: TDateTime; Aleatorio: Byte): Integer;
  function CalcNumPulsosSeg(Inicio: TDateTime; Seg: Integer; Aleatorio: Byte): Integer;
  function CalcNumPulsosTicks(Inicio: TDateTime; Ticks: Cardinal; Aleatorio: Byte): Integer;

  function CalcCelular(Inicio, Fim: TDateTime; Oper: TOperadora; TCC: TComCelular): Extended;
  function CalcCelularSeg(Inicio: TDateTime; Seg: Integer; Oper: TOperadora; TCC: TComCelular): Extended;
  function CalcCelularTicks(Inicio: TDateTime; Ticks: Cardinal; Oper: TOperadora; TCC: TComCelular): Extended;

  function CalcDDD(Inicio, Fim: TDateTime; Oper: TOperadora; DG: TDistGeo): Extended;
  function CalcDDDSeg(Inicio: TDateTime; Seg: Integer; Oper: TOperadora; DG: TDistGeo): Extended;
  function CalcDDDTicks(Inicio: TDateTime; Ticks: Cardinal; Oper: TOperadora; DG: TDistGeo): Extended;

  function ArrayTarFToStr(A: TArrayTarifasF): String;
  procedure StrToArrayTarF(var A: TArrayTarifasF; S: String);

  function ArrayTarCToStr(A: TArrayTarifasC): String;
  procedure StrToArrayTarC(var A: TArrayTarifasC; S: String);
  
  function ObtemMedicaoLocal(DS, H: Integer): TMedicaoLocal;
  function ObtemHoraCel(DS, H: Integer): THoraCel;
  function ObtemHoraDDD(DS, H: Integer): THoraDDD;

  function CalcFimSeg(Inicio: TDateTime; Seg: Integer): TDateTime;

implementation

const
  SegDia = 60 * 60 * 24;
  MinSegTar = 0;
  DelimitaString = #13#10;
  
procedure SetaValor(var S: String; Campo, Valor: String);
var i, b, Ant : Integer;
begin
  Ant := 0;
  Campo := Campo + '=';
  
  for I := 1 to Length(S) do 
    if AnsiCompareText(Copy(S, Ant+1, I-Ant), Campo)=0 then begin
      Ant := I;
      b := I+1;
      while (b<=Length(S)) and (Pos(S[b], DelimitaString)=0) do Inc(b);
      S := Copy(S, 1, Ant) + Valor + Copy(S, b, Length(S));
      Exit;
    end else 
    if Pos(S[I], DelimitaString)>0 then
      Ant := I;

  if Length(S)>0 then     
    S := S + DelimitaString;
  S := S + Campo + Valor;    
end;

function ObtemValor(S, Campo: String): String;
var i, b, Ant : Integer;
begin
  Ant := 0;
  Campo := Campo + '=';
  
  for I := 1 to Length(S) do 
    if AnsiCompareText(Copy(S, Ant+1, I-Ant), Campo)=0 then begin
      Delete(S, 1, I);
      b := 1;
      while (b<=Length(S)) and (Pos(S[b], DelimitaString)=0) do Inc(b);
      Result := Copy(S, 1, pred(b));
      Exit;
    end else 
    if Pos(S[I], DelimitaString)>0 then
      Ant := I;

  Result := '';    
end;
  

function StrToExt(S: String): Extended;
var I: Integer;
begin
  Result := 0;
  if S='' then Exit;
  for I := 1 to Length(S) do 
    if not (S[I] in ['0'..'9', '.', ',']) then 
      Exit
    else
    if (S[I] in [',', '.']) and (S[I] <> DecimalSeparator) then
      S[I] := DecimalSeparator;
  try
    Result := StrToFloat(S);
  except
  end;    
end;

function ArrayTarFToStr(A: TArrayTarifasF): String;
var 
  D : TDistGeo;
  H : THoraDDD;
begin
  Result := '';
  for D := Low(TDistGeo) to High(TDistGeo) do
  for H := Low(THoraDDD) to High(THoraDDD) do
    SetaValor(Result, dgStrings[D] + '/' + hdStrings[H], FloatToStr(A[D, H]));
end;
  
procedure StrToArrayTarF(var A: TArrayTarifasF; S: String);
var 
  D : TDistGeo;
  H : THoraDDD;
begin
  if S > '' then begin
    for D := Low(TDistGeo) to High(TDistGeo) do
    for H := Low(THoraDDD) to High(THoraDDD) do
      A[D, H] := StrToExt(ObtemValor(S, dgStrings[D] + '/' + hdStrings[H]));
  end else    
    FillChar(A, SizeOf(A), 0);
end;

function ArrayTarCToStr(A: TArrayTarifasC): String;
var 
  C : TComCelular;
  H : THoraCel;
begin
  Result := '';
  for C := Low(TComCelular) to High(TComCelular) do
  for H := Low(THoraCel) to High(THoraCel) do
    SetaValor(Result, ccStrings[C] + '/' + hcStrings[H], FloatToStr(A[C, H]));
end;
  
procedure StrToArrayTarC(var A: TArrayTarifasC; S: String);
var 
  C : TComCelular;
  H : THoraCel;
begin
  if S > '' then begin
    for C := Low(TComCelular) to High(TComCelular) do
    for H := Low(THoraCel) to High(THoraCel) do
      A[C, H] := StrToExt(ObtemValor(S, ccStrings[C] + '/' + hcStrings[H]));
  end else    
    FillChar(A, SizeOf(A), 0);
end;

function CalcFimSeg(Inicio: TDateTime; Seg: Integer): TDateTime;
var 
  D, S, SF: Integer;
  T: Extended;
begin
  D := Trunc(Inicio - Frac(Inicio));  
  T := Frac(Inicio);
  while Seg > 0 do begin
    S := Trunc(T * SegDia);
    SF := SegDia - S;
    if Seg < SF then begin
      T := (S + Seg) / SegDia;
      Seg := 0;
    end else begin
      Inc(D);
      Seg := Seg - SF;
      T := 0;
    end;    
  end;
  Result := D+T;
end;
  
function DateTimeToSegundos(D: TDateTime): Integer;
var H, M, S, MS : Word;
begin
  DecodeTime(D, H, M, S, MS);
  Result := (H * 60 * 60) + (M * 60) + S;
end;  

function ObtemMedicaoLocal(DS, H: Integer): TMedicaoLocal;
begin
  case DS of 
    1    : Result := mlSimples;
    
    2..6 : 
      if H >= 6 then
        Result := mlTempo
      else
        Result := mlSimples;  
        
  else
      if (H >= 6) and (H < 14) then
        Result := mlTempo
      else
        Result := mlSimples;  
  end;  
end;

function ObtemHoraCel(DS, H: Integer): THoraCel;
begin
  case DS of 
    1 : Result := hcReduzida;
  else  
    if H in [7..21] then
      Result := hcNormal
    else
      Result := hcReduzida;
  end;  
end;

function ObtemHoraDDD(DS, H: Integer): THoraDDD;
begin
  case DS of 
    1    : {Domingos e Feriados}
      if H in [6..23] then
        Result := hdRed
      else 
        Result := hdSuperRed;
            
    2..6 : {Dias Úteis}
      if (H in [7..8]) or (H in [12..13]) or (H in [18..20]) then
        Result := hdNormal
      else
      if (H in [9..11]) or (H in [14..17]) then 
        Result := hdDif
      else
      if (H=6) or (H in [21..23]) then 
        Result := hdRed
      else
        Result := hdSuperRed;
          
  else { sábados }
      if (H in [7..13]) then
        Result := hdNormal
      else  
      if (H=6) or (H in [14..23]) then
        Result := hdRed
      else
        Result := hdSuperRed;
  end;  
end;

function DTMaiorIgual(DI, HI, MI, SI: Integer; DF: TDateTime): Boolean;
begin
  Result := ( ((DI) + EncodeTime(HI, MI, SI, 0)) >= DF);
end;  

function HoraIgual(DI, HI, DF, HF: Integer): Boolean;
begin
  Result := (DI=DF) and (HI=HF);
end;

function NumSegHora(M, S: Integer): Integer;
begin
  Result := (60-S) + (((60-M)-1)*60);
end;

function NumSegDif(MI, SI, MF, SF: Integer): Integer;
begin
  Result := ((MF*60) + SF) - ((MI*60) + SI);
  if Result < 0 then Result := 0;
end;

function CalcDDD(Inicio, Fim: TDateTime; Oper: TOperadora; DG: TDistGeo): Extended;
var 
  DS          : Integer;
  DI, DF      : Integer;
  H, M, S, MS : Word;
  HF, MF, SF  : Word;
  HD          : THoraDDD;
  HDI         : THoraDDD;
  Segundos    : Array[THoraDDD] of Integer;
begin
  Inicio := Inicio + MinSegTar;
  if Inicio > Fim then begin
    Result := 0;
    Exit;
  end;  
    
  
  DS := DayOfWeek(Inicio);
  DI := Trunc(Inicio-Frac(Inicio));
  DF := Trunc(Fim-Frac(Fim));
  DecodeTime(Inicio, H, M, S, MS);
  DecodeTime(Fim, HF, MF, SF, MS);
  FillChar(Segundos, SizeOf(Segundos), 0);
  HD  := ObtemHoraDDD(DS, H);
  HDI := HD;
  with Oper do
  while not DTMaiorIgual(DI, H, M, S, Fim) do begin
    if opFatiarFixo then HD := ObtemHoraDDD(DS, H);
    
    if HoraIgual(DI, H, DF, HF) then
      Segundos[HD] := Segundos[HD] + NumSegDif(M, S, MF, SF) 
    else
      Segundos[HD] := Segundos[HD] + NumSegHora(M, S);

    M := 0;
    S := 0;
    
    if H<23 then
      Inc(H)
    else begin
      H := 0;
      Inc(DI);
      if DS < 7 then
        Inc(DS)
      else
        DS := 1;  
    end; 
  end;
  
  Result := 0;
  with Oper do
  for HD := hdNormal to hdSuperRed do begin
    if HDI = HD then begin
      Result := Result + opTarifasF[DG, HD];
      Segundos[HD] := Segundos[HD] - opTempoFI;
    end;  

    if Segundos[HD] > 0 then begin
      Result := Result + ((Segundos[HD] div opTempoFA) * opTarifasFA[DG, HD]);
      if (Segundos[HD] mod opTempoFA) > 0 then
        Result := Result + opTarifasFA[DG, HD];
    end;    
  end;  
end;

function CalcDDDSeg(Inicio: TDateTime; Seg: Integer; Oper: TOperadora; DG: TDistGeo): Extended;
begin
  Result := CalcDDD(Inicio, CalcFimSeg(Inicio, Seg), Oper, DG);
end;

function CalcDDDTicks(Inicio: TDateTime; Ticks: Cardinal; Oper: TOperadora; DG: TDistGeo): Extended;
begin
  Result := CalcDDDSeg(Inicio, (Ticks div 1000), Oper, DG);
end;

function CalcCelular(Inicio, Fim: TDateTime; Oper: TOperadora; TCC: TComCelular): Extended;
var 
  DS          : Integer;
  DI, DF      : Integer;
  H, M, S, MS : Word;
  HF, MF, SF  : Word;
  HC          : THoraCel;
  HCI         : THoraCel;
  Segundos    : Array[THoraCel] of Integer;
begin
  Inicio := Inicio + MinSegTar;
  if Inicio > Fim then begin
    Result := 0;
    Exit;
  end;  

  DS := DayOfWeek(Inicio);
  DI := Trunc(Inicio-Frac(Inicio));
  DF := Trunc(Fim-Frac(Fim));
  DecodeTime(Inicio, H, M, S, MS);
  DecodeTime(Fim, HF, MF, SF, MS);
  FillChar(Segundos, SizeOf(Segundos), 0);
  HC := ObtemHoraCel(DS, H);
  HCI := HC;
  with Oper do
  while not DTMaiorIgual(DI, H, M, S, Fim) do begin
    if opFatiarCel then HC := ObtemHoraCel(DS, H);
      
    if HoraIgual(DI, H, DF, HF) then
      Segundos[HC] := Segundos[HC] + NumSegDif(M, S, MF, SF) 
    else
      Segundos[HC] := Segundos[HC] + NumSegHora(M, S);

    M := 0;
    S := 0;
    
    if H<23 then
      Inc(H)
    else begin
      H := 0;
      Inc(DI);
      if DS < 7 then
        Inc(DS)
      else
        DS := 1;  
    end; 
  end;
  
  Result := 0;
  with Oper do
  for HC := hcNormal to hcReduzida do begin
    if HCI = HC then begin
      Result := Result + opTarifasC[TCC, HC];
      Segundos[HC] := Segundos[HC] - opTempoCI;
    end;  

    if Segundos[HC] > 0 then begin
      Result := Result + ((Segundos[HC] div opTempoCA) * opTarifasCA[TCC, HC]);
      if (Segundos[HC] mod opTempoCA) > 0 then
        Result := Result + opTarifasCA[TCC, HC];
    end;    
  end;  
end;

function CalcCelularSeg(Inicio: TDateTime; Seg: Integer; Oper: TOperadora; TCC: TComCelular): Extended;
begin
  Result := CalcCelular(Inicio, CalcFimSeg(Inicio, Seg), Oper, TCC);
end;

function CalcCelularTicks(Inicio: TDateTime; Ticks: Cardinal; Oper: TOperadora; TCC: TComCelular): Extended;
begin
  Result := CalcCelularSeg(Inicio, (Ticks div 1000), Oper, TCC);
end;

function CalcNumPulsos(Inicio, Fim: TDateTime; Aleatorio: Byte): Integer;
var 
  DS              : Integer;
  DI, DF          : Integer;
  H, M, S, MS     : Word;
  HF, MF, SF      : Word;
  ML              : TMedicaoLocal;
  Resto           : Integer;
begin
  Inicio := Inicio + MinSegTar;
  if Inicio > Fim then begin
    Result := 0;
    Exit;
  end;  

  DS := DayOfWeek(Inicio);
  DI := Trunc(Inicio-Frac(Inicio));
  DF := Trunc(Fim-Frac(Fim));
  DecodeTime(Inicio, H, M, S, MS);
  DecodeTime(Fim, HF, MF, SF, MS);
  Result := 0;
  while not DTMaiorIgual(DI, H, M, S, Fim) do begin
    ML := ObtemMedicaoLocal(DS, H);
    if ML=mlTempo then begin
      if HoraIgual(DI, H, DF, HF) then
        Result := Result + NumSegDif(M, S, MF, SF) 
      else
        Result := Result + NumSegHora(M, S);
    end;  

    M := 0;
    S := 0;
    
    if H<23 then
      Inc(H)
    else begin
      H := 0;
      Inc(DI);
      if DS < 7 then
        Inc(DS)
      else
        DS := 1;  
    end; 
  end;
  Resto  := Result mod 240;
  Result := 1 + (Result div 240);
  if (Resto>0) and (Resto > Aleatorio) then
    Result := Result + 1;
end;

function CalcNumPulsosSeg(Inicio: TDateTime; Seg: Integer; Aleatorio: Byte): Integer;
begin
  Result := CalcNumPulsos(Inicio, CalcFimSeg(Inicio, Seg), Aleatorio);
end;

function CalcNumPulsosTicks(Inicio: TDateTime; Ticks: Cardinal; Aleatorio: Byte): Integer;
begin
  Result := CalcNumPulsosSeg(Inicio, (Ticks div 1000), Aleatorio);
end;

end.
