program TesteShell;

uses
  Forms,
  uTesteShell in 'uTesteShell.pas' {Form19},
  ncgShell in '..\Guard\ncgShell.pas',
  ncShellStart in '..\Comp\ncShellStart.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm19, Form19);
  Application.Run;
end.
