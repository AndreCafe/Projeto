program CMAdmin;

uses
  nxReplacementMemoryManager,
  Forms,
  Windows,
  uCMDados in 'uCMDados.pas' {Dados},
  uCMFrmPesqCli in 'uCMFrmPesqCli.pas' {FrmPesqCli},
  uCMFrmCliente in 'uCMFrmCliente.pas' {FrmCliente},
  uCMFrmLogin in 'uCMFrmLogin.pas' {FrmLogin},
  uCMFrmMudaSenha in 'uCMFrmMudaSenha.pas' {FrmMudaSenha},
  uCMFrmProduto in 'uCMFrmProduto.pas' {FrmProduto},
  uCMFrmGrupo in 'uCMFrmGrupo.pas' {FrmGrupo},
  uCMFrmME in 'uCMFrmME.pas' {FrmME},
  uCMFrmRepView in 'uCMFrmRepView.pas' {FrmRepView},
  dxGridMenus in '..\..\Utils\dxGridMenus.pas',
  uCMFrmBaseGrid in 'uCMFrmBaseGrid.pas' {FrmBaseGrid},
  uFrmDadosTot in '..\..\Utils\uFrmDadosTot.pas' {FrmDadosTot},
  uTotGrid in '..\..\Utils\uTotGrid.pas' {FrmTotGrid},
  uCMfbgPedidos in 'uCMfbgPedidos.pas' {fbgPedidos},
  uCMfbgVendas in 'uCMfbgVendas.pas' {fbgVendas},
  uCMfbgClientes in 'uCMfbgClientes.pas' {fbgClientes},
  uCMfbgProdutos in 'uCMfbgProdutos.pas' {fbgProdutos},
  uCMfbgUsuarios in 'uCMfbgUsuarios.pas' {fbgUsuarios},
  uCMFrmAguarde in 'uCMFrmAguarde.pas' {FrmAguarde},
  uCMfbgImpressoes in 'uCMfbgImpressoes.pas' {fbgImpressoes},
  uCMFrmDireito in 'uCMFrmDireito.pas' {FrmDireito},
  uCMfbgMaquinas in 'uCMfbgMaquinas.pas' {fbgMaquinas},
  uCMfbgPacVen in 'uCMfbgPacVen.pas' {fbgPacVen},
  uCMfbgTipoTarifas in 'uCMfbgTipoTarifas.pas' {fbgTarifas},
  uCMFrmAcesso in 'uCMFrmAcesso.pas' {FrmAcesso},
  uCMFrmCaixa in 'uCMFrmCaixa.pas' {FrmCaixa},
  uCMFrmCredito in 'uCMFrmCredito.pas' {FrmCredito},
  uCMFrmVendaPac in 'uCMFrmVendaPac.pas' {FrmVendaPac},
  uCMfbgLog in 'uCMfbgLog.pas' {fbgLog},
  uCMfbgLancExtras in 'uCMfbgLancExtras.pas' {fbgLancExtras},
  uCMFrmLancExtra in 'uCMFrmLancExtra.pas' {FrmLancExtra},
  uCMFrmPri in 'uCMFrmPri.pas' {FrmPri},
  uCMFrmCapt in 'uCMFrmCapt.pas' {FrmCapt},
  uCMFrmUsuario in 'uCMFrmUsuario.pas' {FrmUsuario},
  uCMAShutdown in 'uCMAShutdown.pas' {FrmShutdown},
  uCMfbgAcessos in 'uCMfbgAcessos.pas' {fbgAcessos},
  uCMFrmRel in 'uCMFrmRel.pas' {FrmRel},
  uCMSplash in 'uCMSplash.pas' {FrmSplash},
  uCMfbgCaixas in 'uCMfbgCaixas.pas' {fbgCaixas},
  uCMFrmCorPreco in 'uCMFrmCorPreco.pas' {FrmCorPreco},
  uCMFrmHoraCor in 'uCMFrmHoraCor.pas' {FrmHoraCor},
  uCMfbgGrupos in 'uCMfbgGrupos.pas' {fbgGrupos},
  uCMfbgPacotes in 'uCMfbgPacotes.pas' {fbgPacotes},
  uCMFrmConfig in 'uCMFrmConfig.pas' {FrmConfig},
  uCMFrmPolicy in 'uCMFrmPolicy.pas' {FrmPolicy},
  uCMFrmContato in 'uCMFrmContato.pas' {FrmContato},
  uCMFrmChave in '..\CMServer\uCMFrmChave.pas' {FrmChave};

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



