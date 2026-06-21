program CMAdmin;

uses
  nxReplacementMemoryManager,
  Forms,
  ucmaPri in 'ucmaPri.pas' {FrmPri},
  ucmaDM in 'ucmaDM.pas' {Dados: TDataModule},
  ufmImagens in '..\..\..\FormMgr\ufmImagens.pas' {dmImagens: TDataModule},
  ufmFormBase in '..\..\..\FormMgr\ufmFormBase.pas' {FrmBase: TFrmBasePai},
  ucmafbMaquinas in 'ucmafbMaquinas.pas' {fbMaquinas: TFrmBasePai},
  ucmaLogin in 'ucmaLogin.pas' {FrmLogin},
  ucmaFrmAcesso in 'ucmaFrmAcesso.pas' {FrmAcesso},
  ucmafbTran in 'ucmafbTran.pas' {fbTran: TFrmBasePai},
  ucmaFrmTipos in 'ucmaFrmTipos.pas' {FrmTipos},
  ucmafbPass in 'ucmafbPass.pas' {fbPassaportes: TFrmBasePai},
  cmAuxPassaporte in '..\Comum\cmAuxPassaporte.pas',
  ucmaFrmCliente in 'ucmaFrmCliente.pas' {FrmCliente},
  ucmaFrmCredito in 'ucmaFrmCredito.pas' {FrmCredito},
  ucmaFrmVendaPac in 'ucmaFrmVendaPac.pas' {FrmVendaPac},
  ucmafbPesqCli in 'ucmafbPesqCli.pas' {fbPesqCli: TFrmBasePai},
  ucmaFrmDeb in 'ucmaFrmDeb.pas' {FrmDeb},
  ucmafbProdutos in 'ucmafbProdutos.pas' {fbProdutos: TFrmBasePai},
  ucmaFrmProduto in 'ucmaFrmProduto.pas' {FrmProduto},
  ucmafbMovEst in 'ucmafbMovEst.pas' {fbMovEst: TFrmBasePai},
  ucmaFrmME in 'ucmaFrmME.pas' {FrmME},
  ucmaFrmUsuario in 'ucmaFrmUsuario.pas' {FrmUsuario},
  ucmaFrmSenha in 'ucmaFrmSenha.pas' {FrmAlteraSenha},
  ucmafbCaixa in 'ucmafbCaixa.pas' {fbCaixa: TFrmBasePai},
  ucmaFrmPass in 'ucmaFrmPass.pas' {FrmPassaporte},
  ucmafbCaixasA in 'ucmafbCaixasA.pas' {fbCaixasA: TFrmBasePai},
  ucmaFrmCaixa in 'ucmaFrmCaixa.pas' {FrmCaixa},
  ucmafbOpcoes in 'ucmafbOpcoes.pas' {fbOpcoes: TFrmBasePai},
  ucmafbTiposAcesso in 'ucmafbTiposAcesso.pas' {fbTiposAcesso: TFrmBasePai},
  ucmafbTipoPass in 'ucmafbTipoPass.pas' {fbTiposPass: TFrmBasePai},
  ucmafbTarBasica in 'ucmafbTarBasica.pas' {fbTarBasica: TFrmBasePai},
  ucmaFrmCorPreco in 'ucmaFrmCorPreco.pas' {FrmCorPreco},
  ucmafbTarifas in 'C:\iconexperience\ap\16x16\plain\ucmafbTarifas.pas' {fbTarifas: TFrmBasePai},
  ucmaFrmTipoAcesso in 'ucmaFrmTipoAcesso.pas' {FrmTipoAcesso},
  ucmaFrmVendaPass in 'ucmaFrmVendaPass.pas' {FrmVendaPass},
  ucmafbUsuarios in 'ucmafbUsuarios.pas' {fbUsuarios: TFrmBasePai},
  ucmafbImp in 'ucmafbImp.pas' {fbImp: TFrmBasePai},
  ucmaFrmDesliga in 'ucmaFrmDesliga.pas' {FrmDesliga},
  ucmaFrmCaptura in 'ucmaFrmCaptura.pas' {FrmCapt},
  ucmaFrmImpPrePago in 'ucmaFrmImpPrePago.pas' {FrmImpPrePago},
  ucmaLancExtra in 'ucmaLancExtra.pas' {FrmLancExtra},
  ucmaFrmContato in 'ucmaFrmContato.pas' {FrmContato},
  ucmaHistVer in 'ucmaHistVer.pas' {FrmRTF},
  ucmafbPacotes in 'ucmafbPacotes.pas' {fbPacotes: TFrmBasePai},
  ucmaFrmAviso in 'ucmaFrmAviso.pas' {FrmAviso},
  ucmafbAvisos in 'ucmafbAvisos.pas' {fbAvisos: TFrmBasePai},
  ucmaFrmPacote in 'ucmaFrmPacote.pas' {FrmPacote},
  cmClassesBase in '..\Comum\cmClassesBase.pas',
  ucmaFrmZerarTempo in 'ucmaFrmZerarTempo.pas' {FrmZeraTempo},
  cmIDRecursos in '..\Comum\cmIDRecursos.pas',
  ucmaFrmFundo in 'ucmaFrmFundo.pas' {FrmFundo},
  gifimage in 'C:\comp\gif\Sources\gifimage.pas',
  ucmaFrmSessao in 'ucmaFrmSessao.pas' {FrmSessao},
  ucmaColorConv in 'ucmaColorConv.pas',
  ucmaFrmEtapa in 'ucmaFrmEtapa.pas' {FrmEtapa},
  ucmaFrmBaseCHAT in '..\Comum\ucmaFrmBaseCHAT.pas' {FrmBaseChat},
  ucmaFrmChat in 'ucmaFrmChat.pas' {FrmChat},
  ucmaFrmTempo in 'ucmaFrmTempo.pas' {FrmTempo},
  ucmafbClientes in 'ucmafbClientes.pas' {fbClientes: TFrmBasePai};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'CM-Admin';
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TdmImagens, dmImagens);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TfbClientes, fbClientes);
  Application.Run;
end.
