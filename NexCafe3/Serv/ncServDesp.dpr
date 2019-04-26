program ncServDesp;

uses
  Forms,
  ncsFrmBackup in 'ncsFrmBackup.pas' {FrmCopia},
  ncsFrmLogin in 'ncsFrmLogin.pas' {FrmLogin},
  ncsFrmPri in 'ncsFrmPri.pas' {frmPri},
  ncAuxPassaporte in '..\Comp\ncAuxPassaporte.pas',
  ncClassesBase in '..\Comp\ncClassesBase.pas',
  ncEstruturaTabs in '..\Comp\ncEstruturaTabs.pas',
  ncMsgCom in '..\Comp\ncMsgCom.pas',
  ncServAtualizaLic in '..\Comp\ncServAtualizaLic.pas' {dmAtualizaLic: TDataModule},
  ncServBase in '..\Comp\ncServBase.pas',
  ncServBD in '..\Comp\ncServBD.pas' {dmServidorBD: TDataModule},
  ncTarifador in '..\Comp\ncTarifador.pas',
  ncTran in '..\Comp\ncTran.pas',
  ncDMServ in '..\Comp\ncDMServ.pas' {DM: TDataModule},
  ncPassaportes in '..\Comp\ncPassaportes.pas',
  ncSessao in '..\Comp\ncSessao.pas',
  ncCredTempo in '..\Comp\ncCredTempo.pas',
  ncImpressao in '..\Comp\ncImpressao.pas',
  ncDebito in '..\Comp\ncDebito.pas',
  ncDMCaixa in '..\Comp\ncDMCaixa.pas' {dmCaixa: TDataModule},
  ncErros in '..\Comp\ncErros.pas',
  uDMEmail in '..\..\Email\uDMEmail.pas' {dmEmail: TDataModule},
  ncDMProcEmail in '..\Comp\ncDMProcEmail.pas' {dmProcEmail: TDataModule},
  ncListaEspera in '..\Comp\ncListaEspera.pas',
  ncLancExtra in '..\Comp\ncLancExtra.pas',
  ncDebTempo in '..\Comp\ncDebTempo.pas',
  ncImpCM in '..\Comp\ncImpCM.pas' {dmCM: TDataModule},
  ncVersoes in '..\Comp\ncVersoes.pas',
  uFrmTransfReg in '..\..\GS\uFrmTransfReg.pas' {FrmTransfReg},
  uFrmDadosReg in '..\..\GS\uFrmDadosReg.pas' {FrmDadosReg},
  uLicEXECryptor in '..\..\GS\uLicEXECryptor.pas',
  WindowList in 'C:\comp\WindowList\WindowList.pas',
  ncFrmSuporteRem in '..\Comp\ncFrmSuporteRem.pas' {FrmSuporte},
  ncIPAddr in '..\Comp\ncIPAddr.pas',
  EXECryptor in 'C:\Program Files\EXECryptor\SDK\Delphi\EXECryptor.pas',
  ncSyncLic in '..\Comp\ncSyncLic.pas',
  ncFrmProgress in '..\Comp\ncFrmProgress.pas' {FrmProg},
  ncsFrmSemRegistro in 'ncsFrmSemRegistro.pas' {FrmSemReg},
  ncsFrmRecuperaReg in 'ncsFrmRecuperaReg.pas' {FrmRecReg},
  uFrmCodLoja in '..\..\gs\uFrmCodLoja.pas' {FrmCodLoja},
  uWakeOnLan in '..\..\Utils\uWakeOnLan.pas',
  ncDMDBProc in '..\Comp\ncDMDBProc.pas' {dmDBProc: TDataModule},
  uObjPool in '..\..\Utils\uObjPool.pas',
  ncAppUrlLog in '..\Comp\ncAppUrlLog.pas',
  ncsRecalcPass in '..\Comp\ncsRecalcPass.pas' {dmRecalcPass: TDataModule},
  ncDebug in '..\Comp\ncDebug.pas',
  ncMovEst in '..\Comp\ncMovEst.pas',
  ncVersionInfo in '..\Comp\ncVersionInfo.pas',
  ncShellStart in '..\Comp\ncShellStart.pas',
  ncnxServerPlugin in '..\Comp\ncnxServerPlugin.pas',
  ncNetMsg in '..\Comp\ncNetMsg.pas',
  ncsFrmImpNX2 in 'ncsFrmImpNX2.pas' {FrmImpNX2},
  uDMImpNX2 in '..\Utils\uDMImpNX2.pas',
  uDMBaseImpNX2 in '..\Utils\uDMBaseImpNX2.pas' {dmBaseImpNX2: TDataModule};

{$R *.res}

begin
  NomeArqDebug := 'DebugNexServ.txt';
  Application.Initialize;
  Application.Title := 'NexCafé - Servidor';
  Application.CreateForm(TfrmPri, frmPri);
  Application.Run;
end.
