program Token;

uses
  Forms,
  uToken in 'uToken.pas' {Form19},
  ncToken in '..\Comp\ncToken.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm19, Form19);
  Application.Run;
end.
