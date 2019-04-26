program Corrige_Debitos;

uses
  Forms,
  uCorrige_Debitos in 'uCorrige_Debitos.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
