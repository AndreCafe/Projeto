program Teste_PLUS;

uses
  Forms,
  uTestePlus in '..\..\Utils\uTestePlus.pas' {Form41},
  ncaK in '..\Comp\ncaK.pas',
  ncClassesBase in '..\Comp\ncClassesBase.pas',
  ncCommPlus in '..\Comp\ncCommPlus.pas',
  ncShellStart in '..\Comp\ncShellStart.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm41, Form41);
  Application.Run;
end.
