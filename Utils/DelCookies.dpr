program DelCookies;

uses
  Forms,
  uDelCookies in 'uDelCookies.pas' {Form27},
  SsBase in 'C:\Comp\ShellShock\source\SsBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm27, Form27);
  Application.Run;
end.
