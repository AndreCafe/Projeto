program TesteSerial;

uses
  Forms,
  uTesteSerial in 'uTesteSerial.pas' {Form13},
  uLicEXECryptor in 'uLicEXECryptor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
