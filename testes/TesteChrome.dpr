program TesteChrome;

uses
  Forms,
  uTesteChrome in 'uTesteChrome.pas' {MainForm},
  ncShellStart in '..\Comp\ncShellStart.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
