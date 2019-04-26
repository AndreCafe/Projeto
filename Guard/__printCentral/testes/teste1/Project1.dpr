program Project1;

uses
  Forms,
  unit1 in 'unit1.pas' {Form4},
  ncgPrintInstall in '..\..\..\ncgPrintInstall.pas',
  ncShellStart in '..\..\..\..\Comp\ncShellStart.pas',
  uLogs in '..\..\..\uLogs.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
