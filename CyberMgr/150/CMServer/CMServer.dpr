program CMServer;

uses
  Forms,
  uCMSPri in 'uCMSPri.pas' {frmPri},
  uCMFrmChave in 'uCMFrmChave.pas' {FrmChave},
  uCMSrvCfgBackup in 'uCMSrvCfgBackup.pas' {FrmBackup};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'CM-Server';
  Application.CreateForm(TfrmPri, frmPri);
  Application.Run;
end.
