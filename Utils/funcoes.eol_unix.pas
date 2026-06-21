unit funcoes;

interface

uses stdctrls,forms,comctrls,mask, CurrEdit,classes,ToolEdit,Spin;

type
    TPar = record
           Data: String;
           Valo: Real;
           Bx  : Boolean;
           end;
    TParc = array[0..40] of TPar;



const _Entrada   = 1;
      _Saida     = 2;
      _pedidos   = 3;
      _orcamento = 4;
      _outros    = 5;
      _Pagar     = 1;
      _Receber   = 2;

      _Alterar   = 1;
      _Deletar   = 2;
      _Consultar = 3;
      _Incluir   = 4;

      K_F2       = 113;
      K_F3       = 114;
      K_F4       = 115;

Var aParc: TParc;
    VrTot,VrVis: Real;
    dataVista: TDateTime;

Function AnsiToAscii ( str: String ): String;
Function Strzero(n,n1:integer) : String;
Function CompData(s:string) : string;
Function space(n:Integer) : String;
Function left(s:String ; n : Integer) : String;
Function right(s:String; n : Integer) : String;
Function substr(s:String; n : Integer;  n2 :integer) : String;
Function replicate(s:string; n : Integer) : String;
Function Conf(s:String) : Boolean;
Function SemPonto(n:real;p:integer) : string;
Function Padr(s:string;t:integer) : string;
Function SepDataD(dt : TDateTime) : string;
Function SepDataS(dtS : string) : string;
Function RetZero(ZEROS:string;QUANT:integer):String;
Function NumDiasExtenso(NumDias:integer):string;
Function WordsCount( s : string ) : integer;
Procedure Atencao(s : string);
Procedure LimpaEdit(Form: TComponent);
Function Alltrim(S: string):string;


implementation

uses Dialogs,controls, SysUtils, Db, dbtables, ShellApi;


Function AnsiToAscii ( str: String ): String;

var
   i: Integer;
begin
for i := 1 to Length ( str ) do
    case str[i] of
         'á': str[i] := 'a';
         'é': str[i] := 'e';
         'í': str[i] := 'i';
         'ó': str[i] := 'o';
         'ú': str[i] := 'u';
         'à': str[i] := 'a';
         'è': str[i] := 'e';
         'ì': str[i] := 'i';
         'ò': str[i] := 'o';
         'ù': str[i] := 'u';
         'â': str[i] := 'a';
         'ê': str[i] := 'e';
         'î': str[i] := 'i';
         'ô': str[i] := 'o';
         'û': str[i] := 'u';
         'ä': str[i] := 'a';
         'ë': str[i] := 'e';
         'ï': str[i] := 'i';
         'ö': str[i] := 'o';
         'ü': str[i] := 'u';
         'ã': str[i] := 'a';
         'õ': str[i] := 'o';
         'ñ': str[i] := 'n';
         'ç': str[i] := 'c';
         'Á': str[i] := 'A';
         'É': str[i] := 'E';
         'Í': str[i] := 'I';
         'Ó': str[i] := 'O';
         'Ú': str[i] := 'U';
         'À': str[i] := 'A';
         'È': str[i] := 'E';
         'Ì': str[i] := 'I';
         'Ò': str[i] := 'O';
         'Ù': str[i] := 'U';
         'Â': str[i] := 'A';
         'Ê': str[i] := 'E';
         'Î': str[i] := 'I';
         'Ô': str[i] := 'O';
         'Û': str[i] := 'U';
         'Ä': str[i] := 'A';
         'Ë': str[i] := 'E';
         'Ï': str[i] := 'I';
         'Ö': str[i] := 'O';
         'Ü': str[i] := 'U';
         'Ã': str[i] := 'A';
         'Õ': str[i] := 'O';
         'Ñ': str[i] := 'N';
         'Ç': str[i] := 'C';
         'º': str[i] := '.';
         'ª': str[i] := 'a';
    end;
Result:=str;
end;

{Preenche com Zeros a Esquerda de uma String}
Function RetZero(ZEROS:string;QUANT:integer):String;
var
   I,Tamanho:integer;
   aux: string;
begin
aux:=zeros;
Tamanho:=length(ZEROS);
ZEROS:='';
for I:=1 to quant-tamanho do
    ZEROS:=ZEROS+'0';
    aux:=zeros+aux;
    RetZero:=aux;
end;

{IDEM SPACE DO CLIPPER}
Function space(n : Integer) : String;
var
   a : string;
   x : integer;
begin
a:= '';
for x := 1 to n do a:= a +' ';
    result := a;
end;

{IDEM REPLICATE DO CLIPPER}
Function replicate(s:string; n : Integer) : String;
var
   a : string;
   x : integer;
begin
a:= '';
for x := 1 to n do a:= a +s;
    result := a;
end;

{IDEM LEFT DO CLIPPER}
Function left(s:String; n : Integer) : string;
begin
result := copy(s,1,n);
end;

{IDEM RIGHT DO CLIPPER}
Function right(s:String; n : Integer) : string;
begin
   result := copy(s,(length(s)-n),n);
end;

{IDEM SUBSTR DO CLIPPER}
Function substr(s:String; n : Integer; n2 :integer) : string;
begin
result := copy(s,n,n2);
end;

{CONFIRMAÇÃO}
Function Conf(s:String) : Boolean;
begin
result := (MessageDlg(s,mtConfirmation, [mbYes, mbNo],0) = mrYes)
end;

{CONFIRMAÇÃO}
Procedure Atencao(s:String);
begin
  MessageDlg(s,mtError,[mbOk],0)
end;



{Permide digitar 17/11/71 e ele completa p/ 17/11/1971}
Function CompData(s:string) : string;
var
   ano, mes, dia : word;
begin
strtodate(s); // Força o teste da data
if strtoint(trim(Copy(s,7,4))) < 100 then
   begin
        decodedate(date,ano,mes,dia);
        Result := Copy(s,1,6)+Copy(IntToStr(ano),1,2)+trim(Copy(s,7,4));
   end;
end;

{Completa com Zeros Esquerda}
Function Strzero(n,n1:integer) : String;
var
   s : string;
   t : integer;
begin
s := trim(inttostr(n));
t := length(s);
s := replicate('0',n1)+s;
s := copy(s,t+1,length(s));
result := s;
end;


{Retira o Ponto decimal de um nro retornando este no formato string}
Function SemPonto(n:real;p:integer) : string;
var
   vlr,vlr2:string;
   i : integer;
begin
str(n:15:2,vlr);
vlr2 := '';
for i := 1 to length(vlr) do
    begin
         if vlr[i] <> '.' then
         vlr2 := vlr2+vlr[i];
     end;
Result := strzero(strtoint(vlr2),p);
end;

{Impressao Direta, Define a String e o Tamanho dela na Impressão}
Function Padr(s:string;t:integer) : string;
begin
    result := copy(s+space(t),1,t);
end;

{}
Function SepDataD(dt : TDateTime) : string;
var
   dts : string;
begin
     dts := datetostr(dt);
     result := copy(dts,1,2)+copy(dts,4,2)+copy(dts,7,4);
end;

Function SepDataS(dts : string) : string;
begin
     result := copy(dts,1,2)+copy(dts,4,2)+copy(dts,7,4);
end;

{Função que devolve tempo decorrido em uma string}
Function NumDiasExtenso(NumDias:integer):string;
var
Anos, Meses, Dias : integer;
sAnos, sMeses, sDias : string;
begin
{ --- Calcula o número de anos --- }
Anos := 0;
while NumDias >= 365 do
      begin
           Anos := Anos + 1;
           NumDias := NumDias - 365;
      end;
if Anos > 1 then
   sAnos := ' anos,'
else
   sAnos := ' ano,';
{ --- Calcula o número de meses --- }
Meses := 0;
while NumDias >= 30 do
      begin
           Meses := Meses + 1;
           NumDias := NumDias - 30;
      end;
if Meses > 1 then
   sMeses := ' meses e '
else
   sAnos := ' mês e ';
{ --- O Número de dias é a sobra --- }
Dias := NumDias;
if Dias > 1 then
   sDias := 'dias'
else
   sDias := 'dia';

Result := Inttostr(Anos)+sAnos+inttostr(Meses)+sMeses+inttostr(Dias)+sDias;
end;
{Contador de Letras}
function WordsCount( s : string ) : integer;
var
   ps       : PChar;
   nSpaces,n: integer;
begin
n  := 0;
s  := s + #0;
ps := @s[ 1 ];
while( #0 <> ps^ ) do begin
       while((' ' = ps^)and(#0 <> ps^)) do begin
       inc( ps );
       end;

       nSpaces := 0;
       while((' ' <> ps^)and(#0 <> ps^))do begin

       inc( nSpaces );
            inc( ps );
	end;
	if ( nSpaces > 0 ) then begin
	   inc( n );
	end;
       end;
Result := n;
end;


Procedure LimpaEdit(Form: TComponent);
var i: integer;
begin
For i:= 0 to Form.ComponentCount -1 do
  begin
    if Form.Components[i].Tag = 0 then
     begin
      if (Form.Components[i].classType = TEdit)  then
            TEdit(Form.Components[i]).Clear;
      if Form.Components[i].classType = TMaskEdit then
            TMaskEdit(Form.Components[i]).Clear;
      if Form.Components[i].classType = TComboBox then
            TComboBox(Form.Components[i]).text:= '';
      if Form.Components[i].classType = TCurrencyEdit then
            TCurrencyEdit(Form.Components[i]).value:= 0;
      if Form.Components[i].classType = TMemo then
            TMemo(Form.Components[i]).Clear;
      if Form.Components[i].classType = TComboEdit then
            TComboEdit(Form.Components[i]).clear;
      if Form.Components[i].classType = TDateTimePicker then
         if not(TDateTimePicker(Form.Components[i]).ShowCheckbox) then
            begin
                TDateTimePicker(Form.Components[i]).date:= date;
                TDateTimePicker(Form.Components[i]).time:= time;
            end;
      if Form.Components[i].classType = TSpinEdit then
            TSpinEdit(Form.Components[i]).value:= 0;
      if Form.Components[i].classType = TCheckBox then
            TCheckBox(Form.Components[i]).checked:= false;

     end;
   end;
end;

Function Alltrim(S: string): String;
begin
Result:= TrimRight(TrimLeft(s));
end;


end.
