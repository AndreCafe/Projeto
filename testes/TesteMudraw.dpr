program TesteMudraw;

uses
  Forms,
  uTesteMudraw in 'uTesteMudraw.pas' {Form20},
  ncShellStart in '..\Comp\ncShellStart.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm20, Form20);
  Application.Run;
end.
