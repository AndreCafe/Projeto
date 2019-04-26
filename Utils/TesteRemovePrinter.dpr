program TesteRemovePrinter;

uses
  Forms,
  uTesteRemovePrinter in 'uTesteRemovePrinter.pas' {Form33};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm33, Form33);
  Application.Run;
end.
