program CMServer;

uses
  Forms,
  uCMSPri in 'uCMSPri.pas' {frmPri},
  uCMSrvCfgBackup in 'uCMSrvCfgBackup.pas' {FrmBackup},
  cmConverteArq in '..\Servidor\cmConverteArq.pas' {FrmConv},
  cmDMConv15 in '..\Servidor\cmDMConv15.pas' {dmConv15: TDataModule},
  cmServBD in '..\Servidor\cmServBD.pas' {dmServidorBD: TDataModule},
  uCMSFrmLogin in 'uCMSFrmLogin.pas' {FrmLogin},
  uFrmRegistro in '..\..\GS\uFrmRegistro.pas' {FrmRegistro},
  cmServAtualizaLic in '..\Servidor\cmServAtualizaLic.pas' {dmAtualizaLic: TDataModule},
  cmAuxPassaporte in '..\Comum\cmAuxPassaporte.pas',
  CMChecaBD in '..\Servidor\CMChecaBD.pas',
  cmServBase in '..\Servidor\cmServBase.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'CM-Server';
  Application.CreateForm(TfrmPri, frmPri);
  Application.Run;
end.
