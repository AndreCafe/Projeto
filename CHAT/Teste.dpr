program Teste;

uses
  Forms,
  uTeste in 'uTeste.pas' {Form1},
  chBase in 'chBase.pas',
  chKBM in 'chKBM.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
