program Imp_SmartLaunch;

uses
  nxseAllEngines,
  Forms,
  uImp_SmartLaunch in 'uImp_SmartLaunch.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
