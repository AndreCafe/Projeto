program Imp_Tina;

uses
  nx1xAllEngines,
  Forms,
  uImp_Tina in 'uImp_Tina.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
