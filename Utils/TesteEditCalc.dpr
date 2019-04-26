program TesteEditCalc;

uses
  Forms,
  Unit35 in 'C:\Users\Joao\Documents\RAD Studio\Projects\Unit35.pas' {Form35},
  uTesteEditCalc in '..\..\Testes\uTesteEditCalc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm35, Form35);
  Application.Run;
end.
