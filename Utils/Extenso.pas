unit Extenso;

interface

uses
  sysutils;

function ExtensoSt(Valor: Extended; 
                   DinSing, DinPlural, 
                   CentSing, CentPlural: String): String;

const
  milst: array[1..3, Boolean] of string = 
    (('milhao', 'milhoes'), ('mil', 'mil'), ('', ''));

  mildiv : Array[1..3] of integer =
    (1000000, 1000, 1);   
  
  palavras: Array[1..3, 1..9] of String = 
    (('cento', 'duzentos', 'trezentos', 'quatrocentos', 'quinhentos',
     'seiscentos', 'setecentos', 'oitocentos', 'novecentos'),
    ('dez', 'vinte', 'trinta', 'quarenta', 
      'cinquenta', 'sessenta', 'setenta',
      'oitenta', 'noventa'),
    ('um', 'dois', 'tres', 'quatro', 'cinco', 'seis', 
    'sete', 'oito', 'nove'));

  divcasas : array[1..3] of byte = (100, 10, 1);   

  onzedezenove : Array[11..19] of String = 
    ('onze', 'doze', 'treze', 'quatorze', 'quinze', 
     'dezesseis', 'dezessete', 'dezoito', 'dezenove');  

implementation

function ExtensoSt(Valor: Extended; 
                   DinSing, DinPlural, 
                   CentSing, CentPlural: String): String;
var 
  V, VAntes, Inteiro, C, D, I, IAntes, mil: Integer;
  St: String;
  Dinheiro, Centavos, CentSt: String;

procedure AddE(S: String);  
begin
  if St > '' then
    St := St + ' e ' + S
  else
    St := S;  
end;

begin
  Str(Valor:0:4, St);
  I := Pos('.', St);
  V := StrToIntDef(Copy(St, 1, pred(I)), 0);
  C := StrToIntDef(Copy(St, succ(I), 2), 0);
  
  
  Result := '';
  if V = 1 then
    Dinheiro := DinSing
  else
    Dinheiro := DinPlural;
      
  for mil := 1 to 3 do begin
    Inteiro := V div mildiv[mil];
    St := '';
    if inteiro > 0 then begin
      IAntes := Inteiro;
      if (IAntes <> 1) or (Result <> '') or (mil <> 2) then
      for I := 1 to 3 do begin
        D := inteiro div divcasas[I];
        if D > 0 then begin
          if inteiro in [11..19] then begin
            AddE(onzedezenove[inteiro]);
            inteiro := 0;
          end else  
          if (inteiro=100) then
            AddE('cem')
          else 
            AddE(palavras[I, D]);
        end;
        inteiro := inteiro mod divcasas[I];
      end;
      if mil < 3 then 
        St := St + ' ' + milst[mil, (IAntes>1)];
      if Result > '' then begin
        if ((V mod mildiv[mil]) = 0)
        then begin
          if (IAntes mod 100 = 0) or (V=1) or (V<100) then
            Result := Result + ' e ' + St
          else
            Result := Result + ' , ' + St;
        end else
          Result := Result + ' , ' + St;
      end else
        Result := St;  
    end;
    VAntes := V div mildiv[mil];
    V := V mod mildiv[mil];  
  end;      
  if Result > '' then begin
    Result := Result + ' ' + Dinheiro;
    if C > 0 then 
      Result := Result + ' e ' + ExtensoSt(C, CentSing, CentPlural, '', '');
  end else
  if C > 0 then 
    Result := ExtensoSt(C, CentSing, CentPlural, '', '');
end;

end.
 