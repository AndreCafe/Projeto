program ImpCSV_scancool;

uses
  Forms,
  uImpCSV_scancool in 'uImpCSV_scancool.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
