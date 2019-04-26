program ImpCSV_Bradesco;

uses
  Forms,
  uImpCSVBradesco in 'uImpCSVBradesco.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Importador NexCafé';
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
