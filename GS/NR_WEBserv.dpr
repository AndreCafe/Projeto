program NR_WEBserv;

uses
  Forms,
  nrweb_FrmPri in 'nrweb_FrmPri.pas' {FrmPri},
  uLicenca in 'uLicenca.pas',
  uLicEXECryptor in 'uLicEXECryptor.pas',
  nrAutorizacao in 'nrAutorizacao.pas',
  md5 in 'md5.pas',
  nr_consts in 'nr_consts.pas',
  NR_WebServ_DM in 'NR_WebServ_DM.pas' {DM: TDataModule},
  uDMContas in 'uDMContas.pas' {dmContas: TDataModule},
  ursDMOpen in 'ursDMOpen.pas' {dmOpen: TDataModule},
  nr_db_conn in 'nr_db_conn.pas' {dm_conn: TDataModule},
  uRSdmEmail in 'uRSdmEmail.pas' {dmEmail: TDataModule};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Registro Nextar - Servidor Banco de Dados';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
