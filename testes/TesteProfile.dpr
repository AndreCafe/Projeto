program TesteProfile;

uses
  Forms,
  uTesteProfile in 'uTesteProfile.pas' {Form20},
  ncPrinterInfo8 in '..\Comp\ncPrinterInfo8.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm20, Form20);
  Application.Run;
end.
