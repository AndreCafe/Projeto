program ImpCSV_LinuxBR;

uses
  Forms,
  uImpCSV_LinuxBR in 'uImpCSV_LinuxBR.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
