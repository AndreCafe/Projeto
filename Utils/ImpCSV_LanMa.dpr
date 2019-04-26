program ImpCSV_LanMa;

uses
  Forms,
  uImpCSV_LanMa in 'uImpCSV_LanMa.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
