program TesteSerial;

uses
  Forms,
  EXECryptorKeyGen in 'C:\Program Files\EXECryptor\SDK\Delphi\EXECryptorKeyGen.pas',
  uTesteSerial in 'uTesteSerial.pas' {FrmPri},
  uLicEXECryptor in '..\..\..\GS\uLicEXECryptor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
