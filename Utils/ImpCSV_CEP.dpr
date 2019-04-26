program ImpCSV_CEP;

uses
  Forms,
  uImpCSV_CEP in 'uImpCSV_CEP.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
