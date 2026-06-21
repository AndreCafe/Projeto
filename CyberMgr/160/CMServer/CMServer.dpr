program CMServer;

uses
  Forms,
  uCMSPri in 'uCMSPri.pas' {frmPri},
  uCMFrmChave in 'uCMFrmChave.pas' {FrmChave},
  uCMSrvCfgBackup in 'uCMSrvCfgBackup.pas' {FrmBackup},
  cmConverteArq in '..\Servidor\cmConverteArq.pas' {FrmConv},
  cmDMConv15 in '..\Servidor\cmDMConv15.pas' {dmConv15: TDataModule},
  cmServBD in '..\Servidor\cmServBD.pas' {dmServidorBD: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'CM-Server';
  Application.CreateForm(TfrmPri, frmPri);
  Application.Run;
end.
