program Project26;

uses
  Forms,
  Unit33 in 'Unit33.pas' {Form33},
  ncShellStart in 'ncShellStart.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm33, Form33);
  Application.Run;
end.
