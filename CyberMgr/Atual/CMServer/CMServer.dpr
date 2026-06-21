program CMServer;

uses
  Forms,
  uCMSPri in 'uCMSPri.pas' {frmPri},
  cmConverteArq in '..\Servidor\cmConverteArq.pas' {FrmConv},
  cmDMConv15 in '..\Servidor\cmDMConv15.pas' {dmConv15: TDataModule},
  cmServBD in '..\Servidor\cmServBD.pas' {dmServidorBD: TDataModule},
  uCMSFrmLogin in 'uCMSFrmLogin.pas' {FrmLogin},
  uLicEXECryptor,
  cmServAtualizaLic in '..\Servidor\cmServAtualizaLic.pas' {dmAtualizaLic: TDataModule},
  cmAuxCredito in '..\Comum\cmAuxCredito.pas',
  cmServBase in '..\Servidor\cmServBase.pas',
  cmClassesBase in '..\Comum\cmClassesBase.pas',
  cmServCom in '..\Servidor\cmServCom.pas',
  CMChecaBD in '..\Servidor\CMChecaBD.pas',
  cmErros in '..\Comum\cmErros.pas',
  uCMSBackup in 'uCMSBackup.pas' {FrmCopia},
  uFrmChave in '..\..\..\GS\uFrmChave.pas' {FrmChave};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'CM-Server';
  Application.CreateForm(TfrmPri, frmPri);
  Application.Run;
end.
