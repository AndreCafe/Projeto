unit ncaCurrFormat;

interface

uses SysUtils;

implementation

initialization
  if NegCurrFormat=0 then
    NegCurrFormat := 1;
  if NegCurrFormat=4 then
    NegCurrFormat := 5; 

end.
