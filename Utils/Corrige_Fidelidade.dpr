program Corrige_Fidelidade;

uses
  Forms,
  uCorrige_Fidelidade in 'uCorrige_Fidelidade.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
