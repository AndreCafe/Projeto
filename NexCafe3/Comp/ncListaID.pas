unit ncListaID;

interface

uses
  SysUtils;

  
type
  TFuncTraduzModulo = function (ID: Integer): String; 
  TFuncTraduzTipoAcesso = function (aModulo, aID: Integer): String; 
  TFuncTraduzSt = function (S: String): String; 

const  
  DelimitaString = #13#10;
  TamDS = 2;
  
  
  function LINumIDs(S: String): Integer;
  function LIAddID(S: String; ID: Integer): String;
  function LIRemoveID(S: String; ID: Integer): String;
  function LIContemID(S: String; ID: Integer): Boolean;
  function LIIDporIndice(S: String; Indice: Integer): Integer;
  function LISoma(S1, S2: String): String;
  function LISomaListas(L1, L2: String): String;
  function LITraduzModulos(S: String; Func: TFuncTraduzModulo): String;
  function LITraduzTipoAcesso(S: String; Modulo: Integer; Func: TFuncTraduzTipoAcesso): String;
  function LITraduzLista(L: String; FuncCampo: TFuncTraduzModulo; FuncValor: TFuncTraduzTipoAcesso): String;

  function ListaContemStr(L, Contem: String): Boolean;
  function ListaRemoveStr(L, Remover: String): String;
  function ListaTraduz(L: String; Func: TFuncTraduzSt): String;
  function ListaRemoveLinha(L: String; I: Integer): String;
  function ListaAddStr(L, Str: String): String;
  function ListaRemovidos(Antes, Depois: String): String;
  function ListaAdicionados(Antes, Depois: String): String;
  function ListaIntersecao(L, L2: String): String;
  function ListaContemAlgumCampo(L, Campos: String): Boolean;
  function ListaSomaDireitosGrupos(L, Grupos: String): String;
  function ListaNumStr(L: String): Integer;
  function ListaGetStr(L: String; Index: Integer): String;
  
  function ObtemValor(S, Campo: String): String;
  function ObtemCampo(S: String): String;
  function EliminaCampo(S: String): String;
  function CampoTraduzido(S: String; Func: TFuncTraduzModulo): String;
  procedure SetaValor(var S: String; Campo, Valor: String);
  
implementation

function LINumIDs(S: String): Integer;
var I: Integer;
begin
  Result := 0;
  for I := 2 to Length(S) do 
    if S[I]='|' then Inc(Result);
end;

function LIAddID(S: String; ID: Integer): String;
begin
  if LIContemID(S, ID) then 
    Result := S
  else begin  
    if (S='') then S := '|';
    S := S + IntToStr(ID) + '|';
    Result := S;
  end;  
end;

function LIRemoveID(S: String; ID: Integer): String;
var 
  P : Integer;
  IDSt : String;
begin
  IDSt := IntToStr(ID);
  P := Pos('|'+IDSt+'|', S);
  if P > 0 then Delete(S, P, Length(IDSt)+1);
  Result := S;
end;

function LIContemID(S: String; ID: Integer): Boolean;
begin
  Result := (Pos('|'+IntToStr(ID)+'|', S)>0);
end;

function LIIDporIndice(S: String; Indice: Integer): Integer;
var I, Ant: Integer;
begin
  Result := 0;
  Ant := 1;
  for I := 2 to Length(S) do 
  if S[I]='|' then begin
    Dec(Indice);
    if Indice=0 then begin
      Result := StrToIntDef(Copy(S, Ant+1, (I-Ant-1)), 0);
      Exit;
    end;  
    Ant := I;
  end;  
end;

function LISoma(S1, S2: String): String;
var I, Ant, I2: Integer;
begin
  Result := S1;
  Ant := 1;
  for I := 2 to Length(S2) do 
  if S2[I]='|' then begin
    I2 := StrToIntDef(Copy(S2, Ant+1, (I-Ant-1)), 0);
    if I2 > 0 then
      Result := LIAddID(Result, I2);
    Ant := I;
  end;  
end;

function LITraduzModulos(S: String; Func: TFuncTraduzModulo): String;
var I, Ant, I2: Integer;
begin
  Result := S;
  Ant := 1;
  Result := '';
  for I := 2 to Length(S) do 
  if S[I]='|' then begin
    I2 := StrToIntDef(Copy(S, Ant+1, (I-Ant-1)), 0);
    if I2 > 0 then begin
      if Result > '' then Result := Result + ', ';
      Result := Result + Func(I2) + '';
    end;  
    Ant := I;
  end;  
end;

function LITraduzTipoAcesso(S: String; Modulo: Integer; Func: TFuncTraduzTipoAcesso): String;
var I, Ant, I2: Integer;
begin
  Result := S;
  Ant := 1;
  Result := '';
  for I := 2 to Length(S) do 
  if S[I]='|' then begin
    I2 := StrToIntDef(Copy(S, Ant+1, (I-Ant-1)), 0);
    if I2 > 0 then begin
      if Result > '' then Result := Result + ', ';
      Result := Result + Func(Modulo, I2) + '';
    end;  
    Ant := I;
  end;  
end;

function LISomaListas(L1, L2: String): String;
var 
  i, Ant : Integer;
  Campo, Valor : String;
begin                               
  Ant := 0;
  Result := L1;
  for I := 1 to Length(L2) do 
    if L2[I]='=' then begin
      Campo := Copy(L2, Ant+1, (I-Ant)-1);
      Valor := LISoma(ObtemValor(L1, Campo), ObtemValor(L2, Campo));
      SetaValor(Result, Campo, Valor);
    end else 
    if Pos(L2[I], DelimitaString)>0 then
      Ant := I;
end;

function LITraduzLista(L: String; FuncCampo: TFuncTraduzModulo; FuncValor: TFuncTraduzTipoAcesso): String;
var 
  i, intCampo, Ant : Integer;
  Campo, Valor : String;
begin                               
  Ant := 0;
  Result := '';
  for I := 1 to Length(L) do 
    if L[I]='=' then begin
      Campo := Copy(L, Ant+1, (I-Ant)-1);
      Valor := ObtemValor(L, Campo);
      if Result > '' then
        Result := Result + DelimitaString;
      intCampo := StrToIntDef(Campo, 0);
      if intCampo > 0 then
        Campo := FuncCampo(intCampo);  
      Result := Result + Campo+' = '+LITraduzTipoAcesso(Valor, intCampo, FuncValor);
    end else 
    if Pos(L[I], DelimitaString)>0 then
      Ant := I;
end;

function ListaTraduz(L: String; Func: TFuncTraduzSt): String;
var 
  S, S2 : String;
begin                               
  Result := '';
  S := '';
  S2 := '';
  while L>'' do begin
    if Pos(L[1], DelimitaString)=0 then
      S := S + L[1]
    else
      S2 := S2 + L[1];
    Delete(L, 1, 1);
    if (L='') or (S2=DelimitaString) then begin
      if Result > '' then Result := Result + DelimitaString;
      Result := Result + Func(S);
      S2 := '';
      S := '';
    end;
  end;    
end;

function ListaSomaDireitosGrupos(L, Grupos: String): String;
var 
  S, S2 : String;
begin                               
  S := '';
  S2 := '';
  Result := '';
  L := UpperCase(L);
  Grupos := UpperCase(Grupos);
  while Grupos>'' do begin
    if Pos(Grupos[1], DelimitaString)=0 then
      S := S + Grupos[1]
    else
      S2 := S2 + Grupos[1];
    Delete(Grupos, 1, 1);
    if (Grupos='') or (S2=DelimitaString) then begin
      Result := LISoma(Result, ObtemValor(L, S));
      S2 := '';
      S := '';
    end;
  end;
end;

function ListaContemAlgumCampo(L, Campos: String): Boolean;
var 
  S, S2 : String;
begin                               
  S := '';
  S2 := '';
  L := UpperCase(L);
  Campos := UpperCase(Campos);
  while Campos>'' do begin
    if Pos(Campos[1], DelimitaString)=0 then
      S := S + Campos[1]
    else
      S2 := S2 + Campos[1];
    Delete(Campos, 1, 1);
    if (Campos='') or (S2=DelimitaString) then begin
      if ObtemValor(L, S)>'' then begin
        Result := True;
        Exit;
      end;  
      S2 := '';
      S := '';
    end;
  end;
  Result := False;    
end;

function ListaIntersecao(L, L2: String): String;
var 
  S, S2 : String;
begin                               
  S := '';
  S2 := '';
  L := UpperCase(L);
  L2 := UpperCase(L2);
  Result := '';
  while L>'' do begin
    if Pos(L[1], DelimitaString)=0 then
      S := S + L[1]
    else
      S2 := S2 + L[1];
    Delete(L, 1, 1);
    if (L='') or (S2=DelimitaString) then begin
      if ListaContemStr(L2, S) then 
        ListaAddStr(Result, S);
      S2 := '';
      S := '';
    end;
  end;    
end;

function ListaRemoveLinha(L: String; I: Integer): String;
var 
  S, S2 : String;
begin                               
  Result := '';
  S := '';
  S2 := '';
  while L>'' do begin
    if Pos(L[1], DelimitaString)=0 then
      S := S + L[1]
    else
      S2 := S2 + L[1];
    Delete(L, 1, 1);
    if (L='') or (S2=DelimitaString) then begin
      Dec(I);
      if I <> 0 then begin
        if Result > '' then Result := Result + DelimitaString;
        Result := Result + S;
      end;  
      S2 := '';
      S := '';
    end;
  end;    
end;

function ListaNumStr(L: String): Integer;
var 
  S2 : String;
begin                               
  Result := 0;
  S2 := '';
  while L>'' do begin
    if Pos(L[1], DelimitaString)>0 then S2 := S2 + L[1];
    Delete(L, 1, 1);
    if (L='') or (S2=DelimitaString) then begin
      Result := Result + 1;
      S2 := '';
    end;
  end;    
end;

function ListaGetStr(L: String; Index: Integer): String;
var 
  S, S2 : String;
  I : Integer;
begin                               
  S := '';
  S2 := '';
  I := 0;
  Result := '';
  while L>'' do begin
    if Pos(L[1], DelimitaString)=0 then
      S := S + L[1]
    else
      S2 := S2 + L[1];
    Delete(L, 1, 1);
    if (L='') or (S2=DelimitaString) then begin
      if I=Index then begin
        Result := S;
        Exit;
      end;  
      S2 := '';
      S := '';
      Inc(I)
    end;
  end;    
end;
  
function ListaContemStr(L, Contem: String): Boolean;
var 
  S, S2 : String;
begin                               
  S := '';
  S2 := '';
  Contem := UpperCase(Contem);
  while L>'' do begin
    if Pos(L[1], DelimitaString)=0 then
      S := S + L[1]
    else
      S2 := S2 + L[1];
    Delete(L, 1, 1);
    if (L='') or (S2=DelimitaString) then begin
      if UpperCase(Trim(S))=Contem then begin
        Result := True;
        Exit;
      end;  
      S2 := '';
      S := '';
    end;
  end;    
  Result := False;    
end;

function ListaAddStr(L, Str: String): String;
begin
  if ListaContemStr(L, Str) then
    Result := L
  else begin
    Result := L;
    if Result > '' then Result := Result + DelimitaString;
    Result := Result + Str;
  end;  
end;


function ListaRemoveStr(L, Remover: String): String;
var 
  S, S2 : String;
begin                               
  Result := '';
  S := '';
  S2 := '';
  Remover := UpperCase(Remover);
  while L>'' do begin
    if Pos(L[1], DelimitaString)=0 then
      S := S + L[1]
    else
      S2 := S2 + L[1];
    Delete(L, 1, 1);
    if (L='') or (S2=DelimitaString) then begin
      if UpperCase(Trim(S))<>Remover then begin
        if Result > '' then Result := Result + DelimitaString;
        Result := Result + S;
      end;  
      S2 := '';
      S := '';
    end;
  end;    
end;

function ListaRemovidos(Antes, Depois: String): String;
var 
  S, S2 : String;
begin                               
  Result := '';
  S := '';
  S2 := '';
  while Antes>'' do begin
    if Pos(Antes[1], DelimitaString)=0 then
      S := S + Antes[1]
    else
      S2 := S2 + Antes[1];
    Delete(Antes, 1, 1);
    if (Antes='') or (S2=DelimitaString) then begin
      if not ListaContemStr(Depois, S) then begin
        if Result > '' then Result := Result + DelimitaString;
        Result := Result + S;
      end;  
      S2 := '';
      S := '';
    end;
  end;    
end;

function ListaAdicionados(Antes, Depois: String): String;
var 
  S, S2 : String;
begin                               
  Result := '';
  S := '';
  S2 := '';
  while Depois>'' do begin
    if Pos(Depois[1], DelimitaString)=0 then
      S := S + Depois[1]
    else
      S2 := S2 + Depois[1];
    Delete(Depois, 1, 1);
    if (Depois='') or (S2=DelimitaString) then begin
      if not ListaContemStr(Antes, S) then begin
        if Result > '' then Result := Result + DelimitaString;
        Result := Result + S;
      end;  
      S2 := '';
      S := '';
    end;
  end;    
end;


function ObtemValor(S, Campo: String): String;
var i, b, Ant : Integer;
begin
  Ant := 0;
  Campo := Campo + '=';
  
  for I := 1 to Length(S) do 
    if Copy(S, Ant+1, I-Ant)=Campo then begin
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

procedure SetaValor(var S: String; Campo, Valor: String);
var i, b, Ant : Integer;
begin
  Ant := 0;
  Campo := Campo + '=';
  
  for I := 1 to Length(S) do 
    if Copy(S, Ant+1, I-Ant)=Campo then begin
      Ant := I;
      b := I+1;
      while (b<=Length(S)) and (Pos(S[b], DelimitaString)=0) do Inc(b);
      S := Copy(S, 1, Ant) + Valor + Copy(S, b, Length(S));
      Exit;
    end else 
    if Pos(S[I], DelimitaString)>0 then
      Ant := I;

  if (Length(S)>0) and (Copy(S, Length(S)-TamDS+1, TamDS)<>DelimitaString) then     
    S := S + DelimitaString;
  S := S + Campo + Valor;    
end;

function ObtemCampo(S: String): String;
begin
  Result := Copy(S, 1, Pos('=', S)-1);
end;

function EliminaCampo(S: String): String;
begin
  Result := Copy(S, Pos('=', S)+1, Length(S));
end;

function CampoTraduzido(S: String; Func: TFuncTraduzModulo): String;
var I : Integer;
begin
  I := StrToIntDef(ObtemCampo(S), 0);
  if I = 0 then
    Result := ObtemCampo(S)
  else
    Result := Func(I);  
end;




end.




  
