program Project13;

uses
  Forms,
  Unit19 in 'Unit19.pas' {Form19},
  ncToken in 'ncToken.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm19, Form19);
  Application.Run;
end.
