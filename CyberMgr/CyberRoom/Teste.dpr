program Teste;

uses
  Forms,
  uTeste in 'uTeste.pas' {Form1},
  uLicenca in '..\GS\uLicenca.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
