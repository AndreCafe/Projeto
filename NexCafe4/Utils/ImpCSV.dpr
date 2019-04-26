program ImpCSV;

uses
  Forms,
  uImpCSV in 'uImpCSV.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
