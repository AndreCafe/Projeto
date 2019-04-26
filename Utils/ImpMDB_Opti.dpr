program ImpMDB_Opti;

uses
  Forms,
  uImpMDB_Opti in 'uImpMDB_Opti.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
