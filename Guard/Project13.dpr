program Project13;

uses
  Forms,
  Unit19 in 'Unit19.pas' {Form19},
  ncgPrintInstall in 'ncgPrintInstall.pas',
  Unit1 in 'Unit1.pas',
  ncPrinterInfo8 in '..\Comp\ncPrinterInfo8.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm19, Form19);
  Application.Run;
end.
