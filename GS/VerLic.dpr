program VerLic;

uses
  Forms,
  uVerLic in 'uVerLic.pas' {Form1},
  uLicenca in 'uLicenca.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
