program NRDB_Copy;

uses
  Forms,
  nxllZipCompressor,
  nrdb_copia_frmPri in 'nrdb_copia_frmPri.pas' {FrmPri},
  uLicenca in 'uLicenca.pas',
  uLicEXECryptor in 'uLicEXECryptor.pas',
  nrAutorizacao in 'nrAutorizacao.pas',
  nrTablesDef in 'nrTablesDef.pas',
  cadNxFields in '..\CAD\comp\cadNxFields.pas',
  md5 in 'md5.pas',
  nr_consts in 'nr_consts.pas',
  uRSServBD_Copia in 'uRSServBD_Copia.pas' {dmServidorBD: TDataModule};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Registro Nextar - Servidor Banco de Dados';
  Application.CreateForm(TdmServidorBD, dmServidorBD);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
