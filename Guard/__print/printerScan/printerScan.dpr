program printerScan;

uses
  Forms,
  Unit5 in 'Unit5.pas' {Form5},
  ncPrinters in '..\..\ncPrinters.pas',
  ncgPrintInstall in '..\..\ncgPrintInstall.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
