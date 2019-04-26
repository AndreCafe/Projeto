program ncServ;

{%ToDo 'ncServ.todo'}

uses
  Forms,
  ncsFrmBackup in 'ncsFrmBackup.pas' {FrmCopia},
  ncsFrmLogin in 'ncsFrmLogin.pas' {FrmLogin},
  ncsFrmPri in 'ncsFrmPri.pas' {frmPri},
  ncServCom in '..\Comp\ncServCom.pas',
  ncAuxPassaporte in '..\Comp\ncAuxPassaporte.pas',
  ncClassesBase in '..\Comp\ncClassesBase.pas',
  ncEstruturaTabs in '..\Comp\ncEstruturaTabs.pas',
  ncMsgCom in '..\Comp\ncMsgCom.pas',
  ncNetMsg in '..\Comp\ncNetMsg.pas',
  ncServAtualizaLic in '..\Comp\ncServAtualizaLic.pas' {dmAtualizaLic: TDataModule},
  ncServBase in '..\Comp\ncServBase.pas',
  ncServBD in '..\Comp\ncServBD.pas' {dmServidorBD: TDataModule},
  ncTarifador in '..\Comp\ncTarifador.pas',
  ncTran in '..\Comp\ncTran.pas',
  ncDMServ in '..\Comp\ncDMServ.pas' {DM: TDataModule},
  ncPassaportes in '..\Comp\ncPassaportes.pas',
  ncMovEst in '..\Comp\ncMovEst.pas',
  ncSessao in '..\Comp\ncSessao.pas',
  ncCredTempo in '..\Comp\ncCredTempo.pas',
  ncImpressao in '..\Comp\ncImpressao.pas',
  ncDebito in '..\Comp\ncDebito.pas',
  ncDMCaixa in '..\Comp\ncDMCaixa.pas' {dmCaixa: TDataModule},
  ncErros in '..\Comp\ncErros.pas',
  uDMEmail in '..\..\Email\uDMEmail.pas' {dmEmail: TDataModule},
  ncDMProcEmail in '..\Comp\ncDMProcEmail.pas' {dmProcEmail: TDataModule},
  ncListaEspera in '..\Comp\ncListaEspera.pas',
  ncCompCliente in '..\Comp\ncCompCliente.pas',
  ncLancExtra in '..\Comp\ncLancExtra.pas',
  ncImpCM in '..\Comp\ncImpCM.pas' {dmCM: TDataModule},
  ncDebTempo in '..\Comp\ncDebTempo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'NexCafé - Servidor';
  Application.CreateForm(TfrmPri, frmPri);
  Application.Run;
end.
