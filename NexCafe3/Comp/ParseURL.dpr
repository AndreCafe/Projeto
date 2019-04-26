program ParseURL;

uses
  Forms,
  uParseURL in '..\..\Testes\uParseURL.pas' {Form6},
  ncAppUrlLog in 'ncAppUrlLog.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
