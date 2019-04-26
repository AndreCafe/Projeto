program ImpCSV_OAB;

uses
  Forms,
  uImpCSV_OAB in 'uImpCSV_OAB.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
