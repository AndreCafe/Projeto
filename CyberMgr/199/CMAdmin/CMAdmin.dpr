program CMAdmin;

uses
  nxReplacementMemoryManager,
  Forms,
  Windows,
  Consts in 'Consts.pas',
  uCMDados in 'uCMDados.pas' {Dados},
  uCMFrmPesqCli in 'uCMFrmPesqCli.pas' {FrmPesqCli},
  uCMFrmCliente in 'uCMFrmCliente.pas' {FrmCliente},
  uCMFrmLogin in 'uCMFrmLogin.pas' {FrmLogin},
  uCMFrmMudaSenha in 'uCMFrmMudaSenha.pas' {FrmMudaSenha},
  uCMFrmProduto in 'uCMFrmProduto.pas' {FrmProduto},
  uCMFrmDeb in 'uCMFrmDeb.pas' {FrmDeb},
  dxGridMenus in '..\..\Utils\dxGridMenus.pas',
  uCMFrmBaseGrid in 'uCMFrmBaseGrid.pas' {FrmBaseGrid},
  uFrmDadosTot in '..\..\Utils\uFrmDadosTot.pas' {FrmDadosTot},
  uTotGrid in '..\..\Utils\uTotGrid.pas' {FrmTotGrid},
  uCMfbgClientes in 'uCMfbgClientes.pas' {fbgClientes},
  uCMfbgProdutos in 'uCMfbgProdutos.pas' {fbgProdutos},
  uCMfbgUsuarios in 'uCMfbgUsuarios.pas' {fbgUsuarios},
  uCMFrmAguarde in 'uCMFrmAguarde.pas' {FrmAguarde},
  uCMfbgImpressoes in 'uCMfbgImpressoes.pas' {fbgImpressoes},
  uCMfbgMaquinas in 'uCMfbgMaquinas.pas' {fbgMaquinas},
  uCMfbgTipoTarifas in 'uCMfbgTipoTarifas.pas' {fbgTarifas},
  uCMFrmAcesso in 'uCMFrmAcesso.pas' {FrmAcesso},
  uCMFrmCaixa in 'uCMFrmCaixa.pas' {FrmCaixa},
  uCMFrmCredito in 'uCMFrmCredito.pas' {FrmCredito},
  uCMFrmVendaPass in 'uCMFrmVendaPass.pas' {FrmVendaPass},
  uCMfbgLog in 'uCMfbgLog.pas' {fbgLog},
  uCMFrmLancExtra in 'uCMFrmLancExtra.pas' {FrmLancExtra},
  uCMFrmPri in 'uCMFrmPri.pas' {FrmPri},
  uCMFrmCapt in 'uCMFrmCapt.pas' {FrmCapt},
  uCMFrmUsuario in 'uCMFrmUsuario.pas' {FrmUsuario},
  uCMAShutdown in 'uCMAShutdown.pas' {FrmShutdown},
  uCMSplash in 'uCMSplash.pas' {FrmSplash},
  uCMfbgCaixas in 'uCMfbgCaixas.pas' {fbgCaixas},
  uCMFrmCorPreco in 'uCMFrmCorPreco.pas' {FrmCorPreco},
  uCMfbgTipoPass in 'uCMfbgTipoPass.pas' {fbgTipoPass},
  uCMFrmConfig in 'uCMFrmConfig.pas' {FrmConfig},
  uCMFrmContato in 'uCMFrmContato.pas' {FrmContato},
  cmTotCaixa in '..\Comum\cmTotCaixa.pas',
  uCMFrmME in 'uCMFrmME.pas' {FrmME},
  uCMFrmOpcaoRelCaixa in 'uCMFrmOpcaoRelCaixa.pas' {FrmOpcaoRelCaixa},
  uCMfbgTran in 'uCMfbgTran.pas' {fbgTran},
  uCMFrmPeriodo in 'uCMFrmPeriodo.pas' {FrmPeriodo},
  uCMFrmTipos in 'uCMFrmTipos.pas' {FrmTipos},
  uCMfbgMovEst in 'uCMfbgMovEst.pas' {fbgMovEst},
  uCMFrmHoraCor in 'uCMFrmHoraCor.pas' {FrmHoraCor},
  uCMFrmPassaporte in 'uCMFrmPassaporte.pas' {FrmPassaporte},
  uCMfbgPassaportes in 'uCMfbgPassaportes.pas' {fbgPassaportes},
  cmAuxPassaporte in '..\Comum\cmAuxPassaporte.pas',
  uCMFrmVendaPac in 'uCMFrmVendaPac.pas' {FrmVendaPac},
  uCMfbgPacotes in 'uCMfbgPacotes.pas' {fbgPacotes},
  uCMFrmHistorico in 'uCMFrmHistorico.pas' {FrmHistVer},
  uCMFrmAlteraSenha in 'uCMFrmAlteraSenha.pas' {FrmAlteraSenha},
  uCMFrmImpPrePagoValido in 'uCMFrmImpPrePagoValido.pas' {FrmImpPrePagoValido},
  cmTarifador in '..\Comum\cmTarifador.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'CM-Admin';
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TFrmPri, FrmPri);
  if not MaisDeUm then
    Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.



