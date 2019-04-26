program ImpCSV_anderson;

uses
  Forms,
  uImpCSV_anderson in 'uImpCSV_anderson.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
