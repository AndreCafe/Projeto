program NR_DBServ;

uses
  Forms,
  nrdb_FrmPri in 'nrdb_FrmPri.pas' {FrmPri},
  uLicenca in 'uLicenca.pas',
  uLicEXECryptor in 'uLicEXECryptor.pas',
  nrAutorizacao in 'nrAutorizacao.pas',
  nrTablesDef in 'nrTablesDef.pas',
  md5 in 'md5.pas',
  nr_consts in 'nr_consts.pas',
  uRSServBD in 'uRSServBD.pas' {dmServidorBD: TDataModule},
  nr_status in 'nr_status.pas',
  nrTablesDef_cc in 'nrTablesDef_cc.pas',
  nrTablesDef_autoconn in 'nrTablesDef_autoconn.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Registro Nextar - Servidor Banco de Dados';
  Application.CreateForm(TdmServidorBD, dmServidorBD);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
