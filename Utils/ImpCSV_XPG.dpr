program ImpCSV_XPG;

uses
  Forms,
  uImpCSV_XPG in 'uImpCSV_XPG.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
