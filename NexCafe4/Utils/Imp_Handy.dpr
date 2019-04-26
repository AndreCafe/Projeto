program Imp_Handy;

uses
  nxseAllEngines,
  Forms,
  uImp_Handy in 'uImp_Handy.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
