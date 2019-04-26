program Installl_NexPrinter;

uses
  Forms,
  uInstallNexPrinter in 'uInstallNexPrinter.pas' {Form10},
  ncgPrintInstall in '..\Guard\ncgPrintInstall.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm10, Form10);
  Application.Run;
end.
