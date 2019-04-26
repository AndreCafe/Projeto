program ImpCSV_nexcafe;

uses
  Forms,
  uImpCSV_nexcafe in 'uImpCSV_nexcafe.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
