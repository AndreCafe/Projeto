program Teste;

uses
  Forms,
  uTeste in '..\..\200\Comum\uTeste.pas' {Form1},
  cmClassesBase in '..\..\200\Comum\cmClassesBase.pas',
  cmTarifador in '..\..\200\Comum\cmTarifador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
