unit ncErros;
{
    ResourceString: Dario 12/03/13
}

interface

uses
  SysUtils,
  classes,
  uNexTransResourceStrings_PT;

type
  ENexCafe = class(Exception);

const
  ncerrTipoClasseInvalido   = 1;
  ncerrItemInexistente      = 3;
  ncerrItemSemAlteracoes    = 4;
  ncerrInfoLoginInvalida    = 5;
  ncerrErroBD               = 6;
  ncerrClienteInvalido      = 7;
  ncerrItemJaExiste         = 8;
  ncerrAcessoEmAndamento    = 9;
  ncerrClienteJaAtivo       = 10;
  ncerrSemCreditoDisp       = 11;
  ncerrMaquinaInexistente   = 12;
  ncerrMaquinaJaConectada   = 13;
  ncerrTelaNaoDisponivel    = 14;
  ncerrMaquinaSemAcesso     = 15;
  ncerrEmModoDemo           = 16;
  ncerrNumMaxMaq            = 17;
  ncerrSemNovaVersao        = 18;
  ncerrErroSocket           = 19;
  ncerrMaqJaEstaManutencao  = 20;
  ncerrMaqNaoEstaManutencao = 21;
  ncerrAcessoNaoPermitido   = 22;
  ncerrPassaporteEmUso      = 23;
  ncerrRGErrado             = 24;
  ncerrRGNaoCadastrado      = 25;
  ncerrCaixaFechado         = 26;
  ncerrClienteInativo       = 27;
  ncerrTransfAguardaPagto   = 28;
  ncerrLimiteManutUsuario   = 29;  
  ncerrArqNaoEncontrado     = 30; 
  ncerrFundoTemQueSerJPG    = 31;
  ncerrFundoTemQueSerJPGouGIF = 32;
  ncerrClienteNaoEncontrado = 33;
  ncerrMaqNaoLic            = 34;
  ncerrCaixaDiferente       = 35;
  ncerrImpossivelCancFimSessao = 36;
  ncerrImpossivelCancPassaporteUsado = 37;
  ncerrSemCreditoDispCanc            = 38;
  ncerrExisteTranPosterior           = 39;
  ncerrUsuarioInexistente            = 40;
  ncerrJaTemCaixaAberto              = 41;
  ncerrCaixaJaFoiFechado             = 42;
  ncerrAguardaPagto                  = 43;
  ncerrMaqReservada                  = 44;
  ncerrSaldoTempoInsuficiente        = 45;
  ncerrSenhaInvalida                 = 46;
  ncerrLimiteDebitoExcedido          = 47;
  ncerrHorarioNaoPermitido           = 48;
  ncerrMaquinaEmManutencao           = 49;
  ncerrTransacaoSoPodeAlterarViaFimSessao = 50;
  ncerrLoginNaoPermitidoLimDeb = 51;
  ncerrProdutoSemSaldo = 52;
  ncerrSaldoValorInsuficiente = 53;
  ncerrAcessoAlteradoPorOutroUsuario = 54;
  ncerrSessaoJaEncerrou = 55;
  ncerrSaldoFidInsuficiente = 56;
  ncerrFalhaTransfArq = 57;
  ncerrConexaoPerdida = 58;
  ncerrFalhaConexao   = 59;
  ncerrCliAvulsoBloqueado = 60;
  ncerrCliSemDadosMinimos = 61;
  ncerrTipoImpNaoExiste = 62;
  ncerrLoginAvulsoNaoPerm = 63;
  ncerrImpressaoPendente = 64;
  ncerrFalhaDownloadInt = 65;
  ncerrComandaInvalida = 66;

  ncerrExcecaoNaoTratada_TdmCaixa_AbreCaixa                     = 500;
  ncerrExcecaoNaoTratada_TdmCaixa_FechaCaixa                    = 501;
  ncerrExcecaoNaoTratada_TDM_ExcluiIME                          = 502;
  ncerrExcecaoNaoTratada_TncServidor_ObtemStreamListaObj        = 503;
  ncerrExcecaoNaoTratada_TncServidor_EnviarMsg                  = 504;
  ncerrExcecaoNaoTratada_TncServidor_FechaCaixa                 = 505;
  ncerrExcecaoNaoTratada_TncServidor_DisableAD                  = 506;
  ncerrExcecaoNaoTratada_TncServidor_AlteraSessao               = 507;
  ncerrExcecaoNaoTratada_TncServidor_DesativarFWSessao          = 508;
  ncerrExcecaoNaoTratada_TncServidor_DesktopSincronizado        = 509;
  ncerrExcecaoNaoTratada_TncServidor_AtualizaUsuarioBD          = 510;
  ncerrExcecaoNaoTratada_TncServidor_AtualizaConfigBD           = 511;
  ncerrExcecaoNaoTratada_TncServidor_AtualizaTarifaBD           = 512;
  ncerrExcecaoNaoTratada_TncServidor_AtualizaTipoAcessoBD       = 513;
  ncerrExcecaoNaoTratada_TncServidor_AtualizaTipoImpBD          = 514;
  ncerrExcecaoNaoTratada_TncServidor_SalvaCredTempo             = 515;
  ncerrExcecaoNaoTratada_TncServidor_SalvaDebito                = 516;
  ncerrExcecaoNaoTratada_TncServidor_SalvaDebTempo              = 517;
  ncerrExcecaoNaoTratada_TncServidor_SalvaImpressao             = 518;
  ncerrExcecaoNaoTratada_TncServidor_SalvaClientPages           = 519;
  ncerrExcecaoNaoTratada_TncServidor_SalvaLancExtra             = 520;
  ncerrExcecaoNaoTratada_TncServidor_SalvaLogAppUrl             = 521;
  ncerrExcecaoNaoTratada_TncServidor_SalvaMovEst                = 522;
  ncerrExcecaoNaoTratada_TncServidor_SalvaProcessos             = 523;
  ncerrExcecaoNaoTratada_TncServidor_SalvaSenhaCli              = 524;
  ncerrExcecaoNaoTratada_TncServidor_AtualizaSessaoBD           = 525;
  ncerrExcecaoNaoTratada_TncServidor_AtualizaMaquinaBD          = 526;
  ncerrExcecaoNaoTratada_TncServidor_ApagaMsgCli                = 527;
  ncerrExcecaoNaoTratada_TncServidor_ApagaObj                   = 528;
  ncerrExcecaoNaoTratada_TncServidor_LimpaFundo                 = 529;
  ncerrExcecaoNaoTratada_TncServidor_ArqFundoEnviado            = 530;
  ncerrExcecaoNaoTratada_TncServidor_ObtemSenhaCli              = 531;
  ncerrExcecaoNaoTratada_TncServidor_ObtemSitesBloqueados       = 532;
  ncerrExcecaoNaoTratada_TncServidor_ObtemStreamAvisos          = 533;
  ncerrExcecaoNaoTratada_TncServidor_ObtemStreamConfig          = 534;
  ncerrExcecaoNaoTratada_TncServidor_SalvaStreamObj             = 535;
  ncerrExcecaoNaoTratada_TncServidor_ShutdownMaq                = 536;
  ncerrExcecaoNaoTratada_TncServidor_SuporteRem                 = 537;
  ncerrExcecaoNaoTratada_TncServidor_RefreshEspera              = 538;
  ncerrExcecaoNaoTratada_TncServidor_RefreshPrecos              = 539;
  ncerrExcecaoNaoTratada_TncServidor_ModoManutencao             = 540;
  ncerrExcecaoNaoTratada_TncServidor_PermitirDownload           = 541;
  ncerrExcecaoNaoTratada_TncServidor_CorrigeDataCaixa           = 542;
  ncerrExcecaoNaoTratada_TncServidor_Login                      = 543;
  ncerrExcecaoNaoTratada_TncServidor_TransferirMaq              = 544;
  ncerrExcecaoNaoTratada_TncServidor_PararTempoMaq              = 545;
  ncerrExcecaoNaoTratada_TncServidor_AbreCaixa                  = 546;
  ncerrExcecaoNaoTratada_TncServidor_AdicionaPassaporte         = 547;
  ncerrExcecaoNaoTratada_TncServidor_AjustaPontosFid            = 548;
  ncerrExcecaoNaoTratada_TncServidor_LoginMaq                   = 549;
  ncerrExcecaoNaoTratada_TncServidor_PreLogoutMaq               = 550;
  ncerrExcecaoNaoTratada_TncServidor_CancelaTran                = 551;
  ncerrExcecaoNaoTratada_TncServidor_CancLogoutMaq              = 552;
  ncerrExcecaoNaoTratada_TncServidor_LogoutMaq                  = 553;
  ncerrExcecaoNaoTratada_TncServidor_AtualizaEspecieBD          = 554;
  

  ncerrUltimo = ncerrExcecaoNaoTratada_TncServidor_AtualizaEspecieBD;

  
  function StringErro(Erro: Integer): String;

implementation

// START resource string wizard section
// END resource string wizard section


function StringErro(Erro: Integer): String;
begin
  case Erro of
    ncerrTipoClasseInvalido :
      Result := SncErros_TipoDeClasseInválido;
    ncerrItemInexistente    :
      Result := SncErros_ItemInexistente;
    ncerrItemSemAlteracoes  :
      Result := SncErros_ItemSemAlterações;
    ncerrInfoLoginInvalida  :
      Result := SncErros_UsernameOuSenhaInválida;
    ncerrErroBD :
      Result := SncErros_ErroAcessandoBancoDeDadosDoServi;
    ncerrClienteInvalido :
      Result := SncErros_HandleDeClienteInválido;
    ncerrItemJaExiste :
      Result := SncErros_ItemRepetido;  
    ncerrAcessoEmAndamento :
      Result := SncErros_OAcessoAnteriorDessaMáquinaAinda;  
    ncerrClienteJaAtivo :
      Result := SncErros_JáExisteMáquinaSendoUsadaPorEsse;
    ncerrSemCreditoDisp :
      Result := SncErros_NãoHáCréditoDisponível;
    ncerrMaquinaInexistente : 
      Result := SncErros_NúmeroDeMáquinaInexistente;     
    ncerrMaquinaJaConectada :
      Result := SncErros_EstaMáquinaJáEstáConectada;
    ncerrTelaNaoDisponivel :
      Result := SncErros_TelaNãoDisponível;  
    ncerrMaquinaSemAcesso :
      Result := SncErros_NãoExisteAcessoEmAndamentoNessaM;
    ncerrEmModoDemo :  
      Result := SncErros_ONexCaféEstáSendoExecutadoEmModo;
    ncerrNumMaxMaq :
      Result := SncErros_LimiteDeMáquinasLicenciadasFoiAt;
    ncerrSemNovaVersao : 
      Result := SncErros_NãoHáNovaVersãoDisponívelNoServi;  
    ncerrErroSocket :
      Result := SncErros_ErroDeComunicaçãoTCPIP;  
    ncerrMaqJaEstaManutencao  :
      Result := SncErros_MáquinaEstáEmManutenção;
    ncerrMaqNaoEstaManutencao :
      Result := SncErros_MáquinaNãoEstáEmModoManutenção;
    ncerrAcessoNaoPermitido :
      Result := SncErros_VocêNãoPossuiDireitoDeExecutarEs; 
    ncerrPassaporteEmUso :
      Result := SncErros_EsseCartãoDeTempoOuPassaporteJáE;
    ncerrRGErrado :
      Result := SncErros_ONúmeroDeRGInformadoEstáDiferent;
    ncerrRGNaoCadastrado :
      Result := SncErros_ParaUsarSuaContaéNecessárioCadas;
    ncerrCaixaFechado :
      Result := SncErros_ÉNecessárioAbrirUmCaixaParaReali;
    ncerrClienteInativo :
      Result := SncErros_EssaContaDeClienteEstáInativada; 
    ncerrTransfAguardaPagto :
      Result := SncErros_NãoéPossívelTransferirUmAcessoQu;
    ncerrLimiteManutUsuario :
      Result := SncErros_LimiteMáximoDeMáquinasEmManutenç;
    ncerrArqNaoEncontrado :
      Result := SncErros_ArquivoNãoEncontrado;
    ncerrFundoTemQueSerJPG :  
      Result := SncErros_OArquivoDeFundoParaáreaDeTrabalh;
    ncerrFundoTemQueSerJPGouGIF :  
      Result := SncErros_OArquivoDeFundoParaATelaDeLoginT;
    ncerrClienteNaoEncontrado :
      Result := SncErros_ClienteNãoEncontrado;
    ncerrMaqNaoLic : 
      Result := SncErros_SuaContaNexCaféNãoPermiteOUsoDes; 
    ncerrCaixaDiferente : 
      Result := SncErros_NãoéPossívelAlterarUmaTransaçãoQ; 
    ncerrImpossivelCancFimSessao : 
      Result := SncErros_NãoéPermitidoCancelarUmFimDeAces;
    ncerrImpossivelCancPassaporteUsado :
      Result := SncErros_NãoéPermitidoCancelarAVendaDeUmP;
    ncerrSemCreditoDispCanc :
      Result := SncErros_SemCréditoDisponívelParaCancelar;
    ncerrExisteTranPosterior :
      Result := SncErros_ExisteTransaçãoPosteriorAEssaQue;
    ncerrUsuarioInexistente :
      Result := SncErros_NomeDeUsuárioInexistente;
    ncerrJaTemCaixaAberto :
      Result := SncErros_JáExisteUmCaixaAberto;  
    ncerrCaixaJaFoiFechado :
      Result := SncErros_EsteCaixaJáEstáFechado;  
    ncerrAguardaPagto :
      Result := SncErros_ExistemItensAguardandoConfirmaçã;
    ncerrMaqReservada :
      Result := SncErros_EstaMáquinaEstáReservadaParaOutr; 
    ncerrSaldoTempoInsuficiente :
      Result := SncErros_CréditoDeTempoAtualDoClienteNãoé;
    ncerrSaldoValorInsuficiente :
      Result := SncErros_OClienteNãoPossuiSaldoSuficiente;
    ncerrSenhaInvalida :
      Result := SncErros_SenhaInválida;  
    ncerrLimiteDebitoExcedido :
      Result := SncErros_OLimiteMáximoDeDébitoPermitidoPa;
    ncerrHorarioNaoPermitido :
      Result := SncErros_ClienteNãoAutorizadoAUsarComputa;
    ncerrMaquinaEmManutencao :
      Result := SncErros_EssaMáquinaEstáEmManutençãoForaD;  
    ncerrTransacaoSoPodeAlterarViaFimSessao :
      Result := SncErros_EssaTransaçãoNãoPodeSerAlteradaD+
                SncErros_FaçaAAlteraçãoAtravésDaTelaDeFim;
    ncerrLoginNaoPermitidoLimDeb :
      Result := SncErros_LoginNãoPermitidoValorLimiteDeDé;
    ncerrProdutoSemSaldo :
      Result := SncErros_SaldoDeProdutoInsuficiente;
    ncerrAcessoAlteradoPorOutroUsuario :
      Result := SncErros_OAcessoFoiAlteradoAntesDeVocêSal;
    ncerrSessaoJaEncerrou :
      Result := SncErros_NãoéPossívelRealizarEssaOperação;
    ncerrSaldoFidInsuficiente :
      Result := SncErros_SaldoDePontosDoFidelidadeDoClien;
    ncerrFalhaTransfArq :
      Result := SncErros_FalhaNaTransferênciaDeArquivo;
    ncerrConexaoPerdida : 
      Result := SncErros_AConexãoDeRedeComOServidorFoiPer;
    ncerrFalhaConexao : 
      Result := SncErros_FalhaDeConexãoComOServidorNexCaf;  
    ncerrCliAvulsoBloqueado :
      Result := SncErros_NãoéPossívelLiberarAcessoParaCli;
    ncerrCliSemDadosMinimos :
      Result := SncErros_OClienteNãoPossuiOsDadosCadastra;
    ncerrTipoImpNaoExiste :
      Result := SncErros_ÉNecessárioSelecionarUmTipoDeImp;
    ncerrLoginAvulsoNaoPerm :
      Result := SncErros_NãoéPermitidoOAcessoDeClienteSem;
    ncerrImpressaoPendente : 
      Result := SncErros_NãoéPossívelEncerrarOAcessoPoisH;
    ncerrFalhaDownloadInt :
      Result := SncErros_FalhaDownloadInt; 
    ncerrComandaInvalida :
      Result := SncErros_ComandaInvalida;

    ncerrExcecaoNaoTratada_TdmCaixa_AbreCaixa  :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TdmCaixa_AbreCaixa;
    ncerrExcecaoNaoTratada_TdmCaixa_FechaCaixa  :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TdmCaixa_FechaCaixa;
    ncerrExcecaoNaoTratada_TDM_ExcluiIME  :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TDM_ExcluiIME;
    ncerrExcecaoNaoTratada_TncServidor_ObtemStreamListaObj  :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_ObtemStreamListaObj;
    ncerrExcecaoNaoTratada_TncServidor_EnviarMsg :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_EnviarMsg;
    ncerrExcecaoNaoTratada_TncServidor_FechaCaixa :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_FechaCaixa;
    ncerrExcecaoNaoTratada_TncServidor_DisableAD :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_DisableAD;
    ncerrExcecaoNaoTratada_TncServidor_AlteraSessao :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AlteraSessao;
    ncerrExcecaoNaoTratada_TncServidor_DesativarFWSessao :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_DesativarFWSessao;
    ncerrExcecaoNaoTratada_TncServidor_DesktopSincronizado :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_DesktopSincronizado;
    ncerrExcecaoNaoTratada_TncServidor_AtualizaUsuarioBD :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AtualizaUsuarioBD;
    ncerrExcecaoNaoTratada_TncServidor_AtualizaConfigBD :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AtualizaConfigBD;
    ncerrExcecaoNaoTratada_TncServidor_AtualizaTarifaBD :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AtualizaTarifaBD;
    ncerrExcecaoNaoTratada_TncServidor_AtualizaTipoAcessoBD :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AtualizaTipoAcessoBD;
    ncerrExcecaoNaoTratada_TncServidor_AtualizaTipoImpBD :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AtualizaTipoImpBD;
    ncerrExcecaoNaoTratada_TncServidor_SalvaCredTempo :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaCredTempo;
    ncerrExcecaoNaoTratada_TncServidor_SalvaDebito :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaDebito;
    ncerrExcecaoNaoTratada_TncServidor_SalvaDebTempo :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaDebTempo;
    ncerrExcecaoNaoTratada_TncServidor_SalvaImpressao :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaImpressao;
    ncerrExcecaoNaoTratada_TncServidor_SalvaClientPages :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaClientPages;
    ncerrExcecaoNaoTratada_TncServidor_SalvaLancExtra :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaLancExtra ;
    ncerrExcecaoNaoTratada_TncServidor_SalvaLogAppUrl :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaLogAppUrl;
    ncerrExcecaoNaoTratada_TncServidor_SalvaMovEst :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaMovEst;
    ncerrExcecaoNaoTratada_TncServidor_SalvaProcessos :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaProcessos;
    ncerrExcecaoNaoTratada_TncServidor_SalvaSenhaCli :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaSenhaCli;
    ncerrExcecaoNaoTratada_TncServidor_AtualizaSessaoBD :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AtualizaSessaoBD;
    ncerrExcecaoNaoTratada_TncServidor_AtualizaMaquinaBD :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AtualizaMaquinaBD;
    ncerrExcecaoNaoTratada_TncServidor_ApagaMsgCli :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_ApagaMsgCli;
    ncerrExcecaoNaoTratada_TncServidor_ApagaObj :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_ApagaObj;
    ncerrExcecaoNaoTratada_TncServidor_LimpaFundo :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_LimpaFundo;
    ncerrExcecaoNaoTratada_TncServidor_ArqFundoEnviado :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_ArqFundoEnviado;
    ncerrExcecaoNaoTratada_TncServidor_ObtemSitesBloqueados :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_ObtemSitesBloqueados;
    ncerrExcecaoNaoTratada_TncServidor_ObtemStreamAvisos :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_ObtemStreamAvisos;
    ncerrExcecaoNaoTratada_TncServidor_ObtemStreamConfig :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_ObtemStreamConfig;
    ncerrExcecaoNaoTratada_TncServidor_SalvaStreamObj :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SalvaStreamObj;
    ncerrExcecaoNaoTratada_TncServidor_ShutdownMaq :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_ShutdownMaq;
    ncerrExcecaoNaoTratada_TncServidor_SuporteRem :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_SuporteRem;
    ncerrExcecaoNaoTratada_TncServidor_RefreshEspera :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_RefreshEspera;
    ncerrExcecaoNaoTratada_TncServidor_RefreshPrecos :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_RefreshPrecos;
    ncerrExcecaoNaoTratada_TncServidor_ModoManutencao :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_ModoManutencao;
    ncerrExcecaoNaoTratada_TncServidor_PermitirDownload :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_PermitirDownload;
    ncerrExcecaoNaoTratada_TncServidor_CorrigeDataCaixa :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_CorrigeDataCaixa;
    ncerrExcecaoNaoTratada_TncServidor_Login :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_Login;
    ncerrExcecaoNaoTratada_TncServidor_TransferirMaq :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_TransferirMaq;
    ncerrExcecaoNaoTratada_TncServidor_PararTempoMaq :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_PararTempoMaq;
    ncerrExcecaoNaoTratada_TncServidor_AbreCaixa :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AbreCaixa;
    ncerrExcecaoNaoTratada_TncServidor_AdicionaPassaporte :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AdicionaPassaporte;
    ncerrExcecaoNaoTratada_TncServidor_AjustaPontosFid :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AjustaPontosFid;
    ncerrExcecaoNaoTratada_TncServidor_LoginMaq :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_LoginMaq;
    ncerrExcecaoNaoTratada_TncServidor_PreLogoutMaq :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_PreLogoutMaq;
    ncerrExcecaoNaoTratada_TncServidor_CancelaTran :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_CancelaTran;
    ncerrExcecaoNaoTratada_TncServidor_CancLogoutMaq :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_CancLogoutMaq;
    ncerrExcecaoNaoTratada_TncServidor_LogoutMaq :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_LogoutMaq;

    ncerrExcecaoNaoTratada_TncServidor_AtualizaEspecieBD :
      Result := SncErros_ExceçãoNãoTratadaNoServidor_TncServidor_AtuaizaEspecieBD;
      


    
    
  else
    Result := '';    
  end;
end;
  

end.

