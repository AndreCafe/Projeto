program ImpMDB_SmartLaunch;

uses
  Forms,
  uImpMDB_SmartLaunch in 'uImpMDB_SmartLaunch.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
