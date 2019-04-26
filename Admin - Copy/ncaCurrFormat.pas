unit ncaCurrFormat;
{
    ResourceString: Dario 10/03/13 Achou nada
}

interface

uses SysUtils;

implementation

initialization
  if NegCurrFormat=0 then
    NegCurrFormat := 1;
  if NegCurrFormat=4 then
    NegCurrFormat := 5; 

end.
