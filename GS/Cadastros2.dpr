  program Cadastros2;

uses
  nxllZipCompressor,
  Forms,
  cxGraphics,
  Graphics,
  uCadastros2 in 'uCadastros2.pas' {Form13},
  uLicEXECryptor in 'uLicEXECryptor.pas',
  uCadastros_FrmCidade in 'uCadastros_FrmCidade.pas' {FrmCidade};

{$R *.res}

begin

  Application.Initialize;
  cxDoubleBufferedBitmapPixelFormat := pf24bit;  
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Nextar - Estatísticas';
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
