object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 452
  Width = 518
  object nxSession: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 24
    Top = 16
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 72
    Top = 16
  end
  object tTran: TnxTable
    Database = nxDB
    OnCalcFields = tTranCalcFields
    TableName = 'Tran'
    IndexName = 'ISessao'
    Left = 24
    Top = 88
    object tTranID: TAutoIncField
      FieldName = 'ID'
    end
    object tTranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tTranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object tTranFunc: TStringField
      FieldName = 'Func'
    end
    object tTranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tTranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tTranObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tTranCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object tTranCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tTranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tTranMaq: TWordField
      FieldName = 'Maq'
    end
    object tTranNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tTranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tTranDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object tTranDebito: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Debito'
      Calculated = True
    end
    object tTranQtdTempo: TFloatField
      FieldName = 'QtdTempo'
    end
    object tTranCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object tTranFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
  end
  object tITran: TnxTable
    Database = nxDB
    BeforePost = tITranBeforePost
    BeforeDelete = tITranBeforeDelete
    OnCalcFields = tITranCalcFields
    TableName = 'ITran'
    IndexName = 'IID'
    Left = 72
    Top = 88
    object tITranID: TAutoIncField
      FieldName = 'ID'
    end
    object tITranTran: TIntegerField
      FieldName = 'Tran'
    end
    object tITranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tITranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tITranTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tITranTipoItem: TWordField
      FieldName = 'TipoItem'
    end
    object tITranSubTipo: TWordField
      FieldName = 'SubTipo'
    end
    object tITranItemID: TIntegerField
      FieldName = 'ItemID'
    end
    object tITranSubItemID: TIntegerField
      FieldName = 'SubItemID'
    end
    object tITranItemPos: TWordField
      FieldName = 'ItemPos'
    end
    object tITranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tITranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tITranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tITranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tITranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tITranDebito: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Debito'
      Calculated = True
    end
    object tITranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tITranFidFator: TSmallintField
      FieldName = 'FidFator'
    end
    object tITranFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tITranFidMov: TBooleanField
      FieldName = 'FidMov'
    end
    object tITranFidOpe: TWordField
      FieldName = 'FidOpe'
    end
  end
  object tUsuario: TnxTable
    Database = nxDB
    TableName = 'Usuario'
    IndexName = 'IUsername'
    Left = 24
    Top = 144
    object tUsuarioUsername: TStringField
      FieldName = 'Username'
    end
    object tUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object tUsuarioSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object tUsuarioGrupos: TMemoField
      FieldName = 'Grupos'
      BlobType = ftMemo
    end
    object tUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
    object tUsuarioMaxTempoManut: TIntegerField
      FieldName = 'MaxTempoManut'
    end
    object tUsuarioMaxMaqManut: TIntegerField
      FieldName = 'MaxMaqManut'
    end
  end
  object tTarifa: TnxTable
    Database = nxDB
    TableName = 'Tarifa'
    IndexName = 'ICor'
    Left = 24
    Top = 200
    object tTarifaTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tTarifaCor: TIntegerField
      FieldName = 'Cor'
    end
    object tTarifaCorFonte: TIntegerField
      FieldName = 'CorFonte'
    end
    object tTarifaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object tTarifaReinicia: TBooleanField
      FieldName = 'Reinicia'
    end
    object tTarifaPrecosStr: TnxMemoField
      FieldName = 'PrecosStr'
      BlobType = ftMemo
    end
    object tTarifaDivQtd: TIntegerField
      FieldName = 'DivQtd'
    end
    object tTarifaReiniciaDesde: TWordField
      FieldName = 'ReiniciaDesde'
    end
    object tTarifaDivTipo: TWordField
      FieldName = 'DivTipo'
    end
    object tTarifaArredondar: TWordField
      FieldName = 'Arredondar'
    end
    object tTarifaSemValorMin: TBooleanField
      FieldName = 'SemValorMin'
    end
  end
  object tConfig: TnxTable
    Database = nxDB
    TableName = 'Config'
    Left = 120
    Top = 88
    object tConfigNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tConfigFecharProgramas: TBooleanField
      FieldName = 'FecharProgramas'
    end
    object tConfigAutoExecutar: TStringField
      FieldName = 'AutoExecutar'
      Size = 200
    end
    object tConfigLimiteTempoPadrao: TDateTimeField
      FieldName = 'LimiteTempoPadrao'
    end
    object tConfigPacoteTempoReal: TBooleanField
      FieldName = 'PacoteTempoReal'
    end
    object tConfigPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tConfigEncerramentoPrePago: TWordField
      FieldName = 'EncerramentoPrePago'
    end
    object tConfigPermiteCapturaTela: TBooleanField
      FieldName = 'PermiteCapturaTela'
    end
    object tConfigVariosTiposAcesso: TBooleanField
      FieldName = 'VariosTiposAcesso'
    end
    object tConfigModoPagtoAcesso: TWordField
      FieldName = 'ModoPagtoAcesso'
    end
    object tConfigMostraPrePagoDec: TBooleanField
      FieldName = 'MostraPrePagoDec'
    end
    object tConfigTempoMaxAlerta: TDateTimeField
      FieldName = 'TempoMaxAlerta'
    end
    object tConfigAbre1: TDateTimeField
      FieldName = 'Abre1'
    end
    object tConfigAbre2: TDateTimeField
      FieldName = 'Abre2'
    end
    object tConfigAbre3: TDateTimeField
      FieldName = 'Abre3'
    end
    object tConfigAbre4: TDateTimeField
      FieldName = 'Abre4'
    end
    object tConfigAbre5: TDateTimeField
      FieldName = 'Abre5'
    end
    object tConfigAbre6: TDateTimeField
      FieldName = 'Abre6'
    end
    object tConfigAbre7: TDateTimeField
      FieldName = 'Abre7'
    end
    object tConfigFecha1: TDateTimeField
      FieldName = 'Fecha1'
    end
    object tConfigFecha2: TDateTimeField
      FieldName = 'Fecha2'
    end
    object tConfigFecha3: TDateTimeField
      FieldName = 'Fecha3'
    end
    object tConfigFecha4: TDateTimeField
      FieldName = 'Fecha4'
    end
    object tConfigFecha5: TDateTimeField
      FieldName = 'Fecha5'
    end
    object tConfigFecha6: TDateTimeField
      FieldName = 'Fecha6'
    end
    object tConfigFecha7: TDateTimeField
      FieldName = 'Fecha7'
    end
    object tConfigCorLivre: TIntegerField
      FieldName = 'CorLivre'
    end
    object tConfigCorFLivre: TIntegerField
      FieldName = 'CorFLivre'
    end
    object tConfigCorUsoPrePago: TIntegerField
      FieldName = 'CorUsoPrePago'
    end
    object tConfigCorFUsoPrePago: TIntegerField
      FieldName = 'CorFUsoPrePago'
    end
    object tConfigCorUsoPosPago: TIntegerField
      FieldName = 'CorUsoPosPago'
    end
    object tConfigCorFUsoPosPago: TIntegerField
      FieldName = 'CorFUsoPosPago'
    end
    object tConfigCorAguardaPagto: TIntegerField
      FieldName = 'CorAguardaPagto'
    end
    object tConfigCorFAguardaPagto: TIntegerField
      FieldName = 'CorFAguardaPagto'
    end
    object tConfigCorManutencao: TIntegerField
      FieldName = 'CorManutencao'
    end
    object tConfigCorFManutencao: TIntegerField
      FieldName = 'CorFManutencao'
    end
    object tConfigCorPausado: TIntegerField
      FieldName = 'CorPausado'
    end
    object tConfigCorFPausado: TIntegerField
      FieldName = 'CorFPausado'
    end
    object tConfigCorDesktop: TIntegerField
      FieldName = 'CorDesktop'
    end
    object tConfigCorFDesktop: TIntegerField
      FieldName = 'CorFDesktop'
    end
    object tConfigCampoLocalizaCli: TWordField
      FieldName = 'CampoLocalizaCli'
    end
    object tConfigManterSaldoCaixa: TBooleanField
      FieldName = 'ManterSaldoCaixa'
    end
    object tConfigNaoMostrarMsgDebito: TBooleanField
      FieldName = 'NaoMostrarMsgDebito'
    end
    object tConfigTolerancia: TDateTimeField
      FieldName = 'Tolerancia'
    end
    object tConfigRegImp98: TBooleanField
      FieldName = 'RegImp98'
    end
    object tConfigLimitePadraoDebito: TCurrencyField
      FieldName = 'LimitePadraoDebito'
    end
    object tConfigRecPorta: TStringField
      FieldName = 'RecPorta'
      Size = 10
    end
    object tConfigRecSalto: TWordField
      FieldName = 'RecSalto'
    end
    object tConfigRecLargura: TWordField
      FieldName = 'RecLargura'
    end
    object tConfigRecRodape: TMemoField
      FieldName = 'RecRodape'
      BlobType = ftMemo
    end
    object tConfigRecImprimir: TWordField
      FieldName = 'RecImprimir'
    end
    object tConfigRecMatricial: TBooleanField
      FieldName = 'RecMatricial'
    end
    object tConfigRecNomeLoja: TStringField
      FieldName = 'RecNomeLoja'
      Size = 40
    end
    object tConfigMostraProgAtual: TBooleanField
      FieldName = 'MostraProgAtual'
    end
    object tConfigMostraObs: TBooleanField
      FieldName = 'MostraObs'
    end
    object tConfigEscondeTextoBotoes: TBooleanField
      FieldName = 'EscondeTextoBotoes'
    end
    object tConfigEscondeTipoAcesso: TBooleanField
      FieldName = 'EscondeTipoAcesso'
    end
    object tConfigExigirRG: TBooleanField
      FieldName = 'ExigirRG'
    end
    object tConfigTipoFDesktop: TStringField
      FieldName = 'TipoFDesktop'
      Size = 3
    end
    object tConfigTipoFLogin: TStringField
      FieldName = 'TipoFLogin'
      Size = 3
    end
    object tConfigNumFDesktop: TIntegerField
      FieldName = 'NumFDesktop'
    end
    object tConfigNumFLogin: TIntegerField
      FieldName = 'NumFLogin'
    end
    object tConfigMostrarApenasPIN: TBooleanField
      FieldName = 'MostrarApenasPIN'
    end
    object tConfigTextoPIN: TStringField
      FieldName = 'TextoPIN'
      Size = 30
    end
    object tConfigAlterarSenhaCli: TBooleanField
      FieldName = 'AlterarSenhaCli'
    end
    object tConfigVerSenhaCli: TBooleanField
      FieldName = 'VerSenhaCli'
    end
    object tConfigCliCadPadrao: TBooleanField
      FieldName = 'CliCadPadrao'
    end
    object tConfigControlaImp: TWordField
      FieldName = 'ControlaImp'
    end
    object tConfigFiltrarWEB: TBooleanField
      FieldName = 'FiltrarWEB'
    end
    object tConfigSiteRedirFiltro: TStringField
      FieldName = 'SiteRedirFiltro'
      Size = 80
    end
    object tConfigBloqDownload: TBooleanField
      FieldName = 'BloqDownload'
    end
    object tConfigBloqMenuIniciar: TBooleanField
      FieldName = 'BloqMenuIniciar'
    end
    object tConfigBloqPainelCtrl: TBooleanField
      FieldName = 'BloqPainelCtrl'
    end
    object tConfigBloqCtrlAltDel: TBooleanField
      FieldName = 'BloqCtrlAltDel'
    end
    object tConfigBloqExecutar: TBooleanField
      FieldName = 'BloqExecutar'
    end
    object tConfigBloqMeusLocaisRede: TBooleanField
      FieldName = 'BloqMeusLocaisRede'
    end
    object tConfigPaginaInicial: TStringField
      FieldName = 'PaginaInicial'
      Size = 200
    end
    object tConfigEsconderCronometro: TBooleanField
      FieldName = 'EsconderCronometro'
    end
    object tConfigAposEncerrar: TWordField
      FieldName = 'AposEncerrar'
    end
    object tConfigAlinhaBarraGuard: TWordField
      FieldName = 'AlinhaBarraGuard'
    end
    object tConfigNoNet: TWordField
      FieldName = 'NoNet'
    end
    object tConfigTempoSumirLogin: TWordField
      FieldName = 'TempoSumirLogin'
    end
    object tConfigEmailMetodo: TWordField
      FieldName = 'EmailMetodo'
    end
    object tConfigEmailServ: TStringField
      FieldName = 'EmailServ'
      Size = 50
    end
    object tConfigEmailUsername: TStringField
      FieldName = 'EmailUsername'
      Size = 50
    end
    object tConfigEmailSenha: TStringField
      FieldName = 'EmailSenha'
      Size = 50
    end
    object tConfigEmailDestino: TMemoField
      FieldName = 'EmailDestino'
      BlobType = ftMemo
    end
    object tConfigEmailEnviarCaixa: TBooleanField
      FieldName = 'EmailEnviarCaixa'
    end
    object tConfigEsconderDrives: TStringField
      FieldName = 'EsconderDrives'
      Size = 30
    end
    object tConfigBloqTray: TBooleanField
      FieldName = 'BloqTray'
    end
    object tConfigTempoB1: TWordField
      FieldName = 'TempoB1'
    end
    object tConfigTempoB2: TWordField
      FieldName = 'TempoB2'
    end
    object tConfigTempoB3: TWordField
      FieldName = 'TempoB3'
    end
    object tConfigTempoB4: TWordField
      FieldName = 'TempoB4'
    end
    object tConfigTempoB5: TWordField
      FieldName = 'TempoB5'
    end
    object tConfigTempoB6: TWordField
      FieldName = 'TempoB6'
    end
    object tConfigCredPadraoTipo: TWordField
      FieldName = 'CredPadraoTipo'
    end
    object tConfigCredPadraoCod: TIntegerField
      FieldName = 'CredPadraoCod'
    end
    object tConfigPgVendas: TBooleanField
      FieldName = 'PgVendas'
    end
    object tConfigPgAcesso: TBooleanField
      FieldName = 'PgAcesso'
    end
    object tConfigPgTempo: TBooleanField
      FieldName = 'PgTempo'
    end
    object tConfigPgImp: TBooleanField
      FieldName = 'PgImp'
    end
    object tConfigPgVendaAvulsa: TBooleanField
      FieldName = 'PgVendaAvulsa'
    end
    object tConfigMostraNomeMaq: TBooleanField
      FieldName = 'MostraNomeMaq'
    end
    object tConfigBloqBotaoDir: TBooleanField
      FieldName = 'BloqBotaoDir'
    end
    object tConfigBloquearUsoEmHorarioNP: TBooleanField
      FieldName = 'BloquearUsoEmHorarioNP'
    end
    object tConfigMinutosDesligaMaq: TWordField
      FieldName = 'MinutosDesligaMaq'
    end
    object tConfigOpcaoChat: TWordField
      FieldName = 'OpcaoChat'
    end
    object tConfigSalvarCodUsername: TBooleanField
      FieldName = 'SalvarCodUsername'
    end
    object tConfigCorMaqManut: TIntegerField
      FieldName = 'CorMaqManut'
    end
    object tConfigCorFMaqManut: TIntegerField
      FieldName = 'CorFMaqManut'
    end
    object tConfigContinuarCredTempo: TBooleanField
      FieldName = 'ContinuarCredTempo'
    end
    object tConfigNaoGuardarCreditoCli: TBooleanField
      FieldName = 'NaoGuardarCreditoCli'
    end
    object tConfigEncerramentoCartao: TWordField
      FieldName = 'EncerramentoCartao'
    end
    object tConfigTempoEPrePago: TWordField
      FieldName = 'TempoEPrePago'
    end
    object tConfigTempoECartao: TWordField
      FieldName = 'TempoECartao'
    end
    object tConfigCorPrevisao: TIntegerField
      FieldName = 'CorPrevisao'
    end
    object tConfigCorFPrevisao: TIntegerField
      FieldName = 'CorFPrevisao'
    end
    object tConfigRelCaixaAuto: TBooleanField
      FieldName = 'RelCaixaAuto'
    end
    object tConfigAlteraLoginSemCred: TBooleanField
      FieldName = 'AlteraLoginSemCred'
    end
    object tConfigNaoCobrarImpFunc: TBooleanField
      FieldName = 'NaoCobrarImpFunc'
    end
    object tConfigSincronizarHorarios: TBooleanField
      FieldName = 'SincronizarHorarios'
    end
    object tConfigMostrarDebitoNoGuard: TBooleanField
      FieldName = 'MostrarDebitoNoGuard'
    end
    object tConfigBloquearLoginAlemMaxDeb: TBooleanField
      FieldName = 'BloquearLoginAlemMaxDeb'
    end
    object tConfigClienteNaoAlteraSenha: TBooleanField
      FieldName = 'ClienteNaoAlteraSenha'
    end
    object tConfigNaoObrigarSenhaCliente: TBooleanField
      FieldName = 'NaoObrigarSenhaCliente'
    end
    object tConfigNaoVenderAlemEstoque: TBooleanField
      FieldName = 'NaoVenderAlemEstoque'
    end
    object tConfigCreditoComoValor: TBooleanField
      FieldName = 'CreditoComoValor'
    end
    object tConfigCliAvulsoNaoEncerra: TBooleanField
      FieldName = 'CliAvulsoNaoEncerra'
    end
    object tConfigAutoSortGridCaixa: TBooleanField
      FieldName = 'AutoSortGridCaixa'
    end
    object tConfigAvisoFimTempoAdminS: TWordField
      FieldName = 'AvisoFimTempoAdminS'
    end
    object tConfigDetectarImpServ: TBooleanField
      FieldName = 'DetectarImpServ'
    end
    object tConfigAvisoCreditos: TBooleanField
      FieldName = 'AvisoCreditos'
    end
    object tConfigClientePodeVerCred: TBooleanField
      FieldName = 'ClientePodeVerCred'
    end
    object tConfigChatAlertaSonoro: TBooleanField
      FieldName = 'ChatAlertaSonoro'
    end
    object tConfigChatMostraNotificacao: TBooleanField
      FieldName = 'ChatMostraNotificacao'
    end
    object tConfigModoCredGuard: TWordField
      FieldName = 'ModoCredGuard'
    end
    object tConfigMsgFimCred: TStringField
      FieldName = 'MsgFimCred'
      Size = 150
    end
    object tConfigSemLogin: TBooleanField
      FieldName = 'SemLogin'
    end
    object tConfigFidAtivo: TBooleanField
      FieldName = 'FidAtivo'
    end
    object tConfigFidSessaoValor: TCurrencyField
      FieldName = 'FidSessaoValor'
    end
    object tConfigFidSessaoPontos: TIntegerField
      FieldName = 'FidSessaoPontos'
    end
    object tConfigFidVendaValor: TCurrencyField
      FieldName = 'FidVendaValor'
    end
    object tConfigFidVendaPontos: TIntegerField
      FieldName = 'FidVendaPontos'
    end
    object tConfigFidImpValor: TCurrencyField
      FieldName = 'FidImpValor'
    end
    object tConfigFidImpPontos: TIntegerField
      FieldName = 'FidImpPontos'
    end
    object tConfigFidParcial: TBooleanField
      FieldName = 'FidParcial'
    end
    object tConfigFidAutoPremiar: TBooleanField
      FieldName = 'FidAutoPremiar'
    end
    object tConfigFidTipoPremioAuto: TWordField
      FieldName = 'FidTipoPremioAuto'
    end
    object tConfigFidPremioAuto: TIntegerField
      FieldName = 'FidPremioAuto'
    end
    object tConfigAutoObsAoCancelar: TBooleanField
      FieldName = 'AutoObsAoCancelar'
    end
    object tConfigFidMostrarSaldoGuard: TBooleanField
      FieldName = 'FidMostrarSaldoGuard'
    end
    object tConfigFidMostrarSaldoAdmin: TBooleanField
      FieldName = 'FidMostrarSaldoAdmin'
    end
    object tConfigCliCadNaoEncerra: TBooleanField
      FieldName = 'CliCadNaoEncerra'
    end
    object tConfigImpedirPosPago: TBooleanField
      FieldName = 'ImpedirPosPago'
    end
    object tConfigAutoLigarMaqCli: TBooleanField
      FieldName = 'AutoLigarMaqCli'
    end
    object tConfigPastaDownload: TStringField
      FieldName = 'PastaDownload'
      Size = 1024
    end
    object tConfigBiometria: TBooleanField
      FieldName = 'Biometria'
    end
    object tConfigPMPausaAutomatica: TBooleanField
      FieldName = 'PMPausaAutomatica'
    end
    object tConfigPMConfirmaImpCliente: TBooleanField
      FieldName = 'PMConfirmaImpCliente'
    end
    object tConfigPMMostrarPaginasCli: TBooleanField
      FieldName = 'PMMostrarPaginasCli'
    end
    object tConfigPMMostrarValorCli: TBooleanField
      FieldName = 'PMMostrarValorCli'
    end
    object tConfigPMCalcValorCli: TWordField
      FieldName = 'PMCalcValorCli'
    end
    object tConfigPMPromptValorCli: TStringField
      FieldName = 'PMPromptValorCli'
      Size = 100
    end
    object tConfigPMObsValorCli: TStringField
      FieldName = 'PMObsValorCli'
      Size = 300
    end
    object tConfigPubHomePage: TBooleanField
      FieldName = 'PubHomePage'
    end
    object tConfigPubAd: TBooleanField
      FieldName = 'PubAd'
    end
    object tConfigPubToolbar: TBooleanField
      FieldName = 'PubToolbar'
    end
    object tConfigMaxTempoSessao: TWordField
      FieldName = 'MaxTempoSessao'
    end
    object tConfigTarifaPadrao: TIntegerField
      FieldName = 'TarifaPadrao'
    end
    object tConfigTarifaPorHorario: TBooleanField
      FieldName = 'TarifaPorHorario'
    end
    object tConfigFidMsg: TBooleanField
      FieldName = 'FidMsg'
    end
    object tConfigFidMsgTitulo: TStringField
      FieldName = 'FidMsgTitulo'
      Size = 50
    end
    object tConfigFidMsgTexto: TnxMemoField
      FieldName = 'FidMsgTexto'
      BlobType = ftMemo
    end
    object tConfigBloqMeuComputador: TBooleanField
      FieldName = 'BloqMeuComputador'
    end
    object tConfigBloqLixeira: TBooleanField
      FieldName = 'BloqLixeira'
    end
    object tConfigFiltrarDesktop: TBooleanField
      FieldName = 'FiltrarDesktop'
    end
    object tConfigFiltrarMenuIniciar: TBooleanField
      FieldName = 'FiltrarMenuIniciar'
    end
    object tConfigBloqDownloadExe: TBooleanField
      FieldName = 'BloqDownloadExe'
    end
    object tConfigBloqMeusDocumentos: TBooleanField
      FieldName = 'BloqMeusDocumentos'
    end
    object tConfigClassicStartMenu: TBooleanField
      FieldName = 'ClassicStartMenu'
    end
    object tConfigBloqueiaCliAvulso: TBooleanField
      FieldName = 'BloqueiaCliAvulso'
    end
    object tConfigExigeDadosMinimos: TBooleanField
      FieldName = 'ExigeDadosMinimos'
    end
    object tConfigDadosMinimos: TStringField
      FieldName = 'DadosMinimos'
      Size = 300
    end
    object tConfigCidadePadrao: TStringField
      FieldName = 'CidadePadrao'
      Size = 50
    end
    object tConfigUFPadrao: TStringField
      FieldName = 'UFPadrao'
      Size = 2
    end
    object tConfigPedirSaldoI: TBooleanField
      FieldName = 'PedirSaldoI'
    end
    object tConfigPedirSaldoF: TBooleanField
      FieldName = 'PedirSaldoF'
    end
    object tConfigPMPausarServ: TBooleanField
      FieldName = 'PMPausarServ'
    end
    object tConfigPMNaoPausar: TnxMemoField
      FieldName = 'PMNaoPausar'
      BlobType = ftMemo
    end
    object tConfigPMCotas: TBooleanField
      FieldName = 'PMCotas'
    end
    object tConfigPMCotasMaxPagDia: TIntegerField
      FieldName = 'PMCotasMaxPagDia'
    end
    object tConfigPMCotasMaxPagMes: TIntegerField
      FieldName = 'PMCotasMaxPagMes'
    end
    object tConfigPMCotasOpCota: TWordField
      FieldName = 'PMCotasOpCota'
    end
    object tConfigPMCotasOpExcesso: TWordField
      FieldName = 'PMCotasOpExcesso'
    end
    object tConfigPMCotasMaxExcesso: TIntegerField
      FieldName = 'PMCotasMaxExcesso'
    end
    object tConfigPMCotasPorCli: TBooleanField
      FieldName = 'PMCotasPorCli'
    end
    object tConfigEmailIdent: TStringField
      FieldName = 'EmailIdent'
    end
    object tConfigEmailConteudo: TStringField
      FieldName = 'EmailConteudo'
    end
    object tConfigAlertaAssinatura: TBooleanField
      FieldName = 'AlertaAssinatura'
    end
    object tConfigCamposCliCC: TMemoField
      FieldName = 'CamposCliCC'
      BlobType = ftMemo
    end
    object tConfigBloqToolbars: TBooleanField
      FieldName = 'BloqToolbars'
    end
    object tConfigBloqPosPago: TBooleanField
      FieldName = 'BloqPosPago'
    end
    object tConfigCliCongelado: TBooleanField
      FieldName = 'CliCongelado'
    end
    object tConfigMinutosDesligaMon: TWordField
      FieldName = 'MinutosDesligaMon'
    end
    object tConfigBRT: TWordField
      FieldName = 'BRT'
    end
    object tConfigExCookie: TBooleanField
      FieldName = 'ExCookie'
    end
    object tConfigHPOpenBef: TBooleanField
      FieldName = 'HPOpenBef'
    end
    object tConfigQtdMaqOk: TBooleanField
      FieldName = 'QtdMaqOk'
    end
    object tConfigSenhaAdminOk: TBooleanField
      FieldName = 'SenhaAdminOk'
    end
  end
  object tImp: TnxTable
    Database = nxDB
    TableName = 'Impressao'
    IndexName = 'IID'
    Left = 72
    Top = 248
    object tImpID: TAutoIncField
      FieldName = 'ID'
    end
    object tImpCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tImpManual: TBooleanField
      FieldName = 'Manual'
    end
    object tImpDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tImpComputador: TStringField
      FieldName = 'Computador'
      Size = 200
    end
    object tImpMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tImpPaginas: TWordField
      FieldName = 'Paginas'
    end
    object tImpImpressora: TStringField
      FieldName = 'Impressora'
      Size = 200
    end
    object tImpDocumento: TMemoField
      FieldName = 'Documento'
      BlobType = ftMemo
    end
    object tImpSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tImpResultado: TWordField
      FieldName = 'Resultado'
    end
    object tImpq1: TWordField
      FieldName = 'q1'
    end
    object tImpq2: TWordField
      FieldName = 'q2'
    end
    object tImpq3: TWordField
      FieldName = 'q3'
    end
    object tImpq4: TWordField
      FieldName = 'q4'
    end
    object tImpq5: TWordField
      FieldName = 'q5'
    end
    object tImpq6: TWordField
      FieldName = 'q6'
    end
    object tImpq7: TWordField
      FieldName = 'q7'
    end
    object tImpq8: TWordField
      FieldName = 'q8'
    end
    object tImpq9: TWordField
      FieldName = 'q9'
    end
    object tImpq10: TWordField
      FieldName = 'q10'
    end
    object tImpv1: TCurrencyField
      FieldName = 'v1'
    end
    object tImpv2: TCurrencyField
      FieldName = 'v2'
    end
    object tImpv3: TCurrencyField
      FieldName = 'v3'
    end
    object tImpv4: TCurrencyField
      FieldName = 'v4'
    end
    object tImpv5: TCurrencyField
      FieldName = 'v5'
    end
    object tImpv6: TCurrencyField
      FieldName = 'v6'
    end
    object tImpv7: TCurrencyField
      FieldName = 'v7'
    end
    object tImpv8: TCurrencyField
      FieldName = 'v8'
    end
    object tImpv9: TCurrencyField
      FieldName = 'v9'
    end
    object tImpv10: TCurrencyField
      FieldName = 'v10'
    end
    object tImpDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tImpTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tImpTran: TIntegerField
      FieldName = 'Tran'
    end
    object tImpPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tImpFunc: TStringField
      FieldName = 'Func'
    end
    object tImpCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tImpCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tImpPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tImpDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tImpx75: TBooleanField
      FieldName = 'x75'
    end
  end
  object tMaq: TnxTable
    Database = nxDB
    TableName = 'Maquina'
    IndexName = 'INumero'
    Left = 72
    Top = 144
    object tMaqNumero: TWordField
      FieldName = 'Numero'
    end
    object tMaqNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object tMaqMenu: TMemoField
      FieldName = 'Menu'
      BlobType = ftMemo
    end
    object tMaqRecursos: TMemoField
      FieldName = 'Recursos'
      BlobType = ftMemo
    end
    object tMaqComputerName: TStringField
      FieldName = 'ComputerName'
      Size = 200
    end
    object tMaqTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tMaqEmManutencao: TBooleanField
      FieldName = 'EmManutencao'
    end
    object tMaqObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tMaqIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object tMaqMacAddress: TStringField
      FieldName = 'MacAddress'
    end
    object tMaqPatrocinio: TStringField
      FieldName = 'Patrocinio'
    end
    object tMaqAvisaFimTempo: TBooleanField
      FieldName = 'AvisaFimTempo'
    end
    object tMaqProgramaAtual: TMemoField
      FieldName = 'ProgramaAtual'
      BlobType = ftMemo
    end
    object tMaqSiteAtual: TMemoField
      FieldName = 'SiteAtual'
      BlobType = ftMemo
    end
    object tMaqDisplayH: TWordField
      FieldName = 'DisplayH'
    end
    object tMaqDisplayW: TWordField
      FieldName = 'DisplayW'
    end
    object tMaqRAM: TIntegerField
      FieldName = 'RAM'
    end
    object tMaqCPU: TStringField
      FieldName = 'CPU'
      Size = 50
    end
    object tMaqOS: TStringField
      DisplayWidth = 50
      FieldName = 'OS'
      Size = 50
    end
    object tMaqPrinters: TnxMemoField
      FieldName = 'Printers'
      BlobType = ftMemo
    end
    object tMaqDrives: TStringField
      FieldName = 'Drives'
      Size = 25
    end
    object tMaqHDTotal: TIntegerField
      FieldName = 'HDTotal'
    end
    object tMaqHDFree: TIntegerField
      FieldName = 'HDFree'
    end
    object tMaqDisplayWH: TStringField
      FieldName = 'DisplayWH'
      Size = 10
    end
    object tMaqLastScan: TDateTimeField
      FieldName = 'LastScan'
    end
    object tMaqSessionID: TIntegerField
      FieldName = 'SessionID'
    end
    object tMaqConnectTime: TDateTimeField
      FieldName = 'ConnectTime'
    end
  end
  object tCli: TnxTable
    Database = nxDB
    BeforePost = tCliBeforePost
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 168
    Top = 360
    object tCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tCliEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tCliMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tCliMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tCliIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tCliPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tCliMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
    end
    object tCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tCliEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tCliEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tCliLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tCliIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tCliAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tCliIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tCliAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
    object tCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tCliHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tCliPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object tCliTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object tCliFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tCliFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object tCliFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object tCliAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object tCliCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object tCliCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object tCliCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object tCliSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object tCliCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object tCliOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object tCliFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
  end
  object tHTar: TnxTable
    Database = nxDB
    TableName = 'HTar'
    IndexName = 'IPrim'
    Left = 120
    Top = 144
    object tHTarTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tHTarDia: TWordField
      FieldName = 'Dia'
    end
    object tHTarHora: TWordField
      FieldName = 'Hora'
    end
    object tHTarCor: TIntegerField
      FieldName = 'Cor'
    end
  end
  object tTipoAcesso: TnxTable
    Database = nxDB
    TableName = 'TipoAcesso'
    IndexName = 'IID'
    Left = 120
    Top = 304
    object tTipoAcessoID: TWordField
      FieldName = 'ID'
    end
    object tTipoAcessoNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object tTipoAcessoTarifaPadrao: TIntegerField
      FieldName = 'TarifaPadrao'
    end
    object tTipoAcessoHoraTarifaStr: TnxMemoField
      FieldName = 'HoraTarifaStr'
      BlobType = ftMemo
    end
  end
  object tETar: TnxTable
    Database = nxDB
    TableName = 'ETar'
    IndexName = 'IPrim'
    Left = 72
    Top = 200
    object tETarTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tETarCor: TIntegerField
      FieldName = 'Cor'
    end
    object tETarPos: TWordField
      FieldName = 'Pos'
    end
    object tETarValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tETarTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object tETarValorMin: TCurrencyField
      FieldName = 'ValorMin'
    end
    object tETarTolerancia: TDateTimeField
      FieldName = 'Tolerancia'
    end
  end
  object tLog: TnxTable
    Database = nxDB
    TableName = 'Log'
    IndexName = 'IProgramaMaq'
    Left = 120
    Top = 200
    object tLogID: TAutoIncField
      FieldName = 'ID'
    end
    object tLogDiaHora: TDateTimeField
      FieldName = 'DiaHora'
    end
    object tLogMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tLogUsuario: TStringField
      FieldName = 'Usuario'
    end
    object tLogPrograma: TWordField
      FieldName = 'Programa'
    end
    object tLogOperacao: TStringField
      FieldName = 'Operacao'
      Size = 70
    end
    object tLogHoras: TDateTimeField
      FieldName = 'Horas'
    end
    object tLogDias: TWordField
      FieldName = 'Dias'
    end
  end
  object tMovEst: TnxTable
    Database = nxDB
    OnCalcFields = tMovEstCalcFields
    TableName = 'MovEst'
    IndexName = 'ITranItem'
    Left = 216
    Top = 88
    object tMovEstID: TAutoIncField
      FieldName = 'ID'
    end
    object tMovEstTran: TIntegerField
      FieldName = 'Tran'
    end
    object tMovEstProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tMovEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object tMovEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tMovEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMovEstCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tMovEstItem: TWordField
      FieldName = 'Item'
    end
    object tMovEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMovEstPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tMovEstDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tMovEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMovEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMovEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tMovEstTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tMovEstCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tMovEstCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tMovEstCategoria: TStringField
      FieldName = 'Categoria'
    end
    object tMovEstNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tMovEstFator: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Fator'
      Calculated = True
    end
    object tMovEstSaldoPost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SaldoPost'
      Calculated = True
    end
    object tMovEstITran: TIntegerField
      FieldName = 'ITran'
    end
    object tMovEstSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tMovEstPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tMovEstDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tMovEstFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tMovEstFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
  end
  object tCaixa: TnxTable
    Database = nxDB
    TableName = 'Caixa'
    IndexName = 'IAberto'
    Left = 168
    Top = 248
    object tCaixaID: TAutoIncField
      FieldName = 'ID'
    end
    object tCaixaAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tCaixaUsuario: TStringField
      DisplayWidth = 20
      FieldName = 'Usuario'
    end
    object tCaixaAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tCaixaDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tCaixaObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCaixaTotalFinal: TCurrencyField
      FieldName = 'TotalFinal'
    end
    object tCaixaCancelamentos: TCurrencyField
      FieldName = 'Cancelamentos'
    end
    object tCaixaSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tCaixaFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tCaixaSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object tCaixaSupr: TCurrencyField
      FieldName = 'Supr'
    end
    object tCaixaReproc: TDateTimeField
      FieldName = 'Reproc'
    end
    object tCaixaEstSessoesQtd: TIntegerField
      FieldName = 'EstSessoesQtd'
    end
    object tCaixaEstSessoesTempo: TFloatField
      FieldName = 'EstSessoesTempo'
    end
    object tCaixaEstUrls: TIntegerField
      FieldName = 'EstUrls'
    end
    object tCaixaEstSyncOk: TBooleanField
      FieldName = 'EstSyncOk'
    end
    object tCaixaEstBuscasEng: TMemoField
      FieldName = 'EstBuscasEng'
      BlobType = ftMemo
    end
    object tCaixaEstRes: TMemoField
      FieldName = 'EstRes'
      BlobType = ftMemo
    end
    object tCaixaSaldoF: TCurrencyField
      FieldName = 'SaldoF'
    end
    object tCaixaQuebra: TCurrencyField
      FieldName = 'Quebra'
    end
    object tCaixaIDLivre: TStringField
      FieldName = 'IDLivre'
    end
  end
  object tProduto: TnxTable
    Database = nxDB
    TableName = 'Produto'
    IndexName = 'IID'
    Left = 168
    Top = 88
    object tProdutoID: TAutoIncField
      FieldName = 'ID'
    end
    object tProdutoCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object tProdutoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 55
    end
    object tProdutoUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object tProdutoPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tProdutoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProdutoImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tProdutoCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProdutoSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProdutoEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tProdutoCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProdutoEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tProdutoEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tProdutoPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProdutoNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProdutoFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tProdutoFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object tProdutoEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tProdutoEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tProdutoAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tProdutoAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object tProdutoEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
  end
  object tHPass: TnxTable
    Database = nxDB
    TableName = 'HPass'
    IndexName = 'ISessaoPass'
    Left = 168
    Top = 144
    object tHPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tHPassPassaporte: TIntegerField
      FieldName = 'Passaporte'
    end
    object tHPassSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tHPassDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tHPassMinutosAnt: TFloatField
      FieldName = 'MinutosAnt'
    end
    object tHPassMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
  end
  object tTempo: TnxTable
    Database = nxDB
    TableName = 'Tempo'
    IndexName = 'IID'
    Left = 216
    Top = 144
    object tTempoID: TAutoIncField
      FieldName = 'ID'
    end
    object tTempoDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tTempoFunc: TStringField
      FieldName = 'Func'
    end
    object tTempoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tTempoMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tTempoIDPacPass: TIntegerField
      FieldName = 'IDPacPass'
    end
    object tTempoPassaporte: TIntegerField
      FieldName = 'Passaporte'
    end
    object tTempoDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tTempoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tTempoMaq: TWordField
      FieldName = 'Maq'
    end
    object tTempoSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tTempoCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tTempoTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tTempoPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tTempoCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tTempoTran: TIntegerField
      FieldName = 'Tran'
    end
    object tTempoPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tTempoDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tTempoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tTempoSenha: TStringField
      FieldName = 'Senha'
    end
    object tTempoTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tTempoObs: TStringField
      FieldName = 'Obs'
      Size = 50
    end
    object tTempoCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object tTempoFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tTempoFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
  end
  object tSessao: TnxTable
    Database = nxDB
    TableName = 'Sessao'
    IndexName = 'IID'
    Left = 216
    Top = 304
    object tSessaoID: TAutoIncField
      FieldName = 'ID'
    end
    object tSessaoInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tSessaoTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object tSessaoMinutosR: TFloatField
      FieldName = 'MinutosR'
    end
    object tSessaoMinutosC: TFloatField
      FieldName = 'MinutosC'
    end
    object tSessaoMaq: TWordField
      FieldName = 'Maq'
    end
    object tSessaoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tSessaoTransfMaq: TBooleanField
      FieldName = 'TransfMaq'
    end
    object tSessaoTipoCli: TWordField
      FieldName = 'TipoCli'
    end
    object tSessaoCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tSessaoTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tSessaoDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tSessaoPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tSessaoNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tSessaoFuncI: TStringField
      FieldName = 'FuncI'
      Size = 30
    end
    object tSessaoFuncF: TStringField
      FieldName = 'FuncF'
      Size = 30
    end
    object tSessaoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tSessaoTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tSessaoCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object tSessaoCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object tSessaoTicksI: TIntegerField
      FieldName = 'TicksI'
    end
    object tSessaoPausado: TBooleanField
      FieldName = 'Pausado'
    end
    object tSessaoInicioPausa: TIntegerField
      FieldName = 'InicioPausa'
    end
    object tSessaoMinTicksUsados: TIntegerField
      FieldName = 'MinTicksUsados'
    end
    object tSessaoMinTicksTotal: TIntegerField
      FieldName = 'MinTicksTotal'
    end
    object tSessaoFimTicksUsados: TIntegerField
      FieldName = 'FimTicksUsados'
    end
    object tSessaoStrPausas: TMemoField
      FieldName = 'StrPausas'
      BlobType = ftMemo
    end
    object tSessaoMinutosCli: TFloatField
      FieldName = 'MinutosCli'
    end
    object tSessaoMinutosPrev: TFloatField
      FieldName = 'MinutosPrev'
    end
    object tSessaoMinutosMax: TFloatField
      FieldName = 'MinutosMax'
    end
    object tSessaoEncerrou: TBooleanField
      FieldName = 'Encerrou'
    end
    object tSessaoMinutosCliU: TFloatField
      FieldName = 'MinutosCliU'
    end
    object tSessaoValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object tSessaoValorCliU: TFloatField
      FieldName = 'ValorCliU'
    end
    object tSessaoTranI: TIntegerField
      FieldName = 'TranI'
    end
    object tSessaoTranF: TIntegerField
      FieldName = 'TranF'
    end
    object tSessaoPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tSessaoDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tSessaoMaqI: TWordField
      FieldName = 'MaqI'
    end
    object tSessaoStrTransfMaq: TMemoField
      FieldName = 'StrTransfMaq'
      BlobType = ftMemo
    end
    object tSessaoStrFechamentoCaixa: TMemoField
      FieldName = 'StrFechamentoCaixa'
      BlobType = ftMemo
    end
    object tSessaoFimTicksTotal: TIntegerField
      FieldName = 'FimTicksTotal'
    end
    object tSessaoPermitirDownload: TBooleanField
      FieldName = 'PermitirDownload'
    end
    object tSessaoVersaoRegistro: TIntegerField
      FieldName = 'VersaoRegistro'
    end
    object tSessaoDisableAD: TBooleanField
      FieldName = 'DisableAD'
    end
    object tSessaoJobID: TIntegerField
      FieldName = 'JobID'
    end
    object tSessaoJobPages: TWordField
      FieldName = 'JobPages'
    end
    object tSessaoIPs: TMemoField
      FieldName = 'IPs'
      BlobType = ftMemo
    end
    object tSessaoCartaoTempo: TBooleanField
      FieldName = 'CartaoTempo'
    end
    object tSessaoHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tSessaoHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tSessaoHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tSessaoHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tSessaoHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tSessaoHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tSessaoHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tSessaoFiltrarWEB: TBooleanField
      FieldName = 'FiltrarWEB'
    end
    object tSessaoDesktopSinc: TBooleanField
      FieldName = 'DesktopSinc'
    end
    object tSessaoPermitirDownloadExe: TBooleanField
      FieldName = 'PermitirDownloadExe'
    end
  end
  object tChat: TnxTable
    Database = nxDB
    TableName = 'Chat'
    IndexName = 'IID'
    Left = 216
    Top = 200
    object tChatID: TAutoIncField
      FieldName = 'ID'
    end
    object tChatDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tChatTexto: TMemoField
      FieldName = 'Texto'
      BlobType = ftMemo
    end
    object tChatDe: TIntegerField
      FieldName = 'De'
    end
    object tChatPara: TIntegerField
      FieldName = 'Para'
    end
  end
  object tAvisos: TnxTable
    Database = nxDB
    TableName = 'Aviso'
    IndexName = 'IMinutos'
    Left = 24
    Top = 304
    object tAvisosMinutos: TWordField
      FieldName = 'Minutos'
    end
    object tAvisosAvisoTexto: TStringField
      FieldName = 'AvisoTexto'
      Size = 50
    end
    object tAvisosSegAvisoTexto: TWordField
      FieldName = 'SegAvisoTexto'
    end
    object tAvisosPiscarAvisoTexto: TBooleanField
      FieldName = 'PiscarAvisoTexto'
    end
    object tAvisosSom: TBlobField
      FieldName = 'Som'
    end
    object tAvisosTipo: TWordField
      FieldName = 'Tipo'
    end
  end
  object tHCred: TnxTable
    Database = nxDB
    TableName = 'HCred'
    IndexName = 'IID'
    Left = 120
    Top = 248
    object tHCredID: TAutoIncField
      FieldName = 'ID'
    end
    object tHCredDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tHCredTipo: TWordField
      FieldName = 'Tipo'
    end
    object tHCredCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tHCredSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tHCredTran: TIntegerField
      FieldName = 'Tran'
    end
    object tHCredSaldoAnt: TFloatField
      FieldName = 'SaldoAnt'
    end
    object tHCredQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object tPassaporte: TnxTable
    Database = nxDB
    TableName = 'Passaporte'
    IndexName = 'IID'
    Left = 168
    Top = 200
    object tPassaporteID: TAutoIncField
      FieldName = 'ID'
    end
    object tPassaporteTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object tPassaporteCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tPassaporteExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object tPassaporteSenha: TStringField
      FieldName = 'Senha'
    end
    object tPassaportePrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object tPassaporteTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tPassaporteTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tPassaporteExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tPassaporteMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tPassaporteSegundos: TIntegerField
      FieldName = 'Segundos'
    end
    object tPassaporteAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object tPassaporteDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tPassaporteDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tPassaporteDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tPassaporteDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tPassaporteDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tPassaporteDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tPassaporteDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tPassaporteTran: TIntegerField
      FieldName = 'Tran'
    end
    object tPassaporteDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object tPassaporteValido: TBooleanField
      FieldName = 'Valido'
    end
    object tPassaporteValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tPassaporteSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tPassaporteNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object tPacote: TnxTable
    Database = nxDB
    TableName = 'Pacote'
    IndexName = 'IID'
    Left = 216
    Top = 248
    object tPacoteID: TAutoIncField
      FieldName = 'ID'
    end
    object tPacoteMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object tPacoteValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tPacoteDescr: TStringField
      FieldName = 'Descr'
      Size = 30
    end
    object tPacoteFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tPacoteFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
  object tTipoPass: TnxTable
    Database = nxDB
    TableName = 'TipoPass'
    IndexName = 'IID'
    Left = 216
    Top = 360
    object tTipoPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tTipoPassNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tTipoPassValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tTipoPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tTipoPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tTipoPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tTipoPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tTipoPassObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTipoPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tTipoPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tTipoPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tTipoPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tTipoPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tTipoPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tTipoPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tTipoPassFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tTipoPassFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
  object tTipoImp: TnxTable
    Database = nxDB
    TableName = 'TipoImp'
    IndexName = 'IID'
    Left = 120
    Top = 360
    object tTipoImpID: TWordField
      FieldName = 'ID'
    end
    object tTipoImpNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object tTipoImpImpressora: TStringField
      FieldName = 'Impressora'
      Size = 500
    end
    object tTipoImpValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tTipoImpContador: TIntegerField
      FieldName = 'Contador'
    end
  end
  object tAuxITran: TnxTable
    Database = nxDB
    OnCalcFields = tAuxITranCalcFields
    TableName = 'ITran'
    IndexName = 'IID'
    Left = 272
    Top = 96
    object tAuxITranID: TAutoIncField
      FieldName = 'ID'
    end
    object tAuxITranTran: TIntegerField
      FieldName = 'Tran'
    end
    object tAuxITranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tAuxITranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tAuxITranTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tAuxITranTipoItem: TWordField
      FieldName = 'TipoItem'
    end
    object tAuxITranSubTipo: TWordField
      FieldName = 'SubTipo'
    end
    object tAuxITranItemID: TIntegerField
      FieldName = 'ItemID'
    end
    object tAuxITranSubItemID: TIntegerField
      FieldName = 'SubItemID'
    end
    object tAuxITranItemPos: TWordField
      FieldName = 'ItemPos'
    end
    object tAuxITranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tAuxITranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tAuxITranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tAuxITranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tAuxITranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tAuxITranDebito: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Debito'
      Calculated = True
    end
    object tAuxITranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tAuxITranFidFator: TSmallintField
      FieldName = 'FidFator'
    end
    object tAuxITranFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tAuxITranFidMov: TBooleanField
      FieldName = 'FidMov'
    end
    object tAuxITranFidOpe: TWordField
      FieldName = 'FidOpe'
    end
  end
  object tAuxME: TnxTable
    Database = nxDB
    OnCalcFields = tAuxMECalcFields
    TableName = 'MovEst'
    IndexName = 'IProduto'
    Left = 272
    Top = 168
    object tAuxMEID: TAutoIncField
      FieldName = 'ID'
    end
    object tAuxMETran: TIntegerField
      FieldName = 'Tran'
    end
    object tAuxMEProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tAuxMEQuant: TFloatField
      FieldName = 'Quant'
    end
    object tAuxMEUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tAuxMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tAuxMECustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tAuxMEItem: TWordField
      FieldName = 'Item'
    end
    object tAuxMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tAuxMEPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tAuxMEDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tAuxMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tAuxMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tAuxMEEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tAuxMETipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tAuxMECliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tAuxMECaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tAuxMECategoria: TStringField
      FieldName = 'Categoria'
    end
    object tAuxMENaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tAuxMEFator: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Fator'
      Calculated = True
    end
    object tAuxMESaldoPost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SaldoPost'
      Calculated = True
    end
    object tAuxMEITran: TIntegerField
      FieldName = 'ITran'
    end
  end
  object tDebito: TnxTable
    Database = nxDB
    TableName = 'Debito'
    IndexName = 'ITipoID'
    Left = 272
    Top = 248
    object tDebitoData: TDateTimeField
      FieldName = 'Data'
    end
    object tDebitoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tDebitoValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tDebitoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tDebitoID: TIntegerField
      FieldName = 'ID'
    end
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCPIP
    Left = 120
    Top = 16
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 176
    Top = 16
  end
  object tOcupacao: TnxTable
    Database = nxDB
    TableName = 'Ocupacao'
    IndexName = 'ISessao'
    Left = 288
    Top = 304
    object tOcupacaoID: TAutoIncField
      FieldName = 'ID'
    end
    object tOcupacaoSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tOcupacaoMaq: TIntegerField
      FieldName = 'Maq'
    end
    object tOcupacaoData: TDateField
      FieldName = 'Data'
    end
    object tOcupacaoHora: TWordField
      FieldName = 'Hora'
    end
    object tOcupacaoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tOcupacaoTipoCli: TWordField
      FieldName = 'TipoCli'
    end
    object tOcupacaoMinutosU: TFloatField
      FieldName = 'MinutosU'
    end
    object tOcupacaoMinutosP: TFloatField
      FieldName = 'MinutosP'
    end
    object tOcupacaoCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tOcupacaoFunc: TStringField
      FieldName = 'Func'
    end
  end
  object tRec: TnxTable
    Database = nxDB
    TableName = 'Recibo'
    IndexName = 'ICliente'
    Left = 368
    Top = 168
    object tRecID: TAutoIncField
      FieldName = 'ID'
    end
    object tRecCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tRecTran: TIntegerField
      FieldName = 'Tran'
    end
  end
  object tEsp: TnxTable
    Database = nxDB
    TableName = 'Espera'
    IndexName = 'IID'
    Left = 336
    Top = 80
    object tEspID: TAutoIncField
      FieldName = 'ID'
    end
    object tEspPos: TIntegerField
      FieldName = 'Pos'
    end
    object tEspCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tEspNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tEspDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tEspPrevisao: TDateTimeField
      FieldName = 'Previsao'
    end
    object tEspPrevMaq: TWordField
      FieldName = 'PrevMaq'
    end
    object tEspPrevSessao: TIntegerField
      FieldName = 'PrevSessao'
    end
    object tEspObs: TStringField
      FieldName = 'Obs'
      Size = 50
    end
    object tEspCartao: TStringField
      FieldName = 'Cartao'
    end
  end
  object tProc: TnxTable
    Database = nxDB
    TableName = 'Processos'
    IndexName = 'ICliReq'
    Left = 352
    Top = 336
    object tProcClienteID: TIntegerField
      FieldName = 'ClienteID'
    end
    object tProcRequest: TIntegerField
      FieldName = 'Request'
    end
    object tProcProcessID: TIntegerField
      FieldName = 'ProcessID'
    end
    object tProcExeName: TStringField
      FieldName = 'ExeName'
      Size = 80
    end
  end
  object tFW: TnxTable
    Database = nxDB
    TableName = 'FiltroWeb'
    IndexName = 'IURL'
    Left = 328
    Top = 168
    object tFWID: TAutoIncField
      FieldName = 'ID'
    end
    object tFWURL: TStringField
      FieldName = 'URL'
      Size = 300
    end
    object tFWCateg: TIntegerField
      FieldName = 'Categ'
    end
  end
  object qAux: TnxQuery
    Database = nxDB
    Timeout = 240000
    Left = 232
    Top = 16
  end
  object tPatro: TnxTable
    Database = nxDB
    TableName = 'Patrocinio'
    IndexName = 'INome'
    Left = 384
    Top = 80
    object tPatroNome: TStringField
      FieldName = 'Nome'
    end
    object tPatroURLArea1: TMemoField
      FieldName = 'URLArea1'
      BlobType = ftMemo
    end
    object tPatroURLArea2: TMemoField
      FieldName = 'URLArea2'
      BlobType = ftMemo
    end
    object tPatroDominiosPerm: TMemoField
      FieldName = 'DominiosPerm'
      BlobType = ftMemo
    end
  end
  object tSessaoCli: TnxTable
    Database = nxDB
    TableName = 'Sessao'
    IndexName = 'IEncerrouCli'
    Left = 320
    Top = 248
    object tSessaoCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tSessaoCliInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tSessaoCliTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object tSessaoCliMinutosR: TFloatField
      FieldName = 'MinutosR'
    end
    object tSessaoCliMinutosC: TFloatField
      FieldName = 'MinutosC'
    end
    object tSessaoCliMaq: TWordField
      FieldName = 'Maq'
    end
    object tSessaoCliMaqI: TWordField
      FieldName = 'MaqI'
    end
    object tSessaoCliEncerrou: TBooleanField
      FieldName = 'Encerrou'
    end
    object tSessaoCliCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tSessaoCliTransfMaq: TBooleanField
      FieldName = 'TransfMaq'
    end
    object tSessaoCliTipoCli: TWordField
      FieldName = 'TipoCli'
    end
    object tSessaoCliCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tSessaoCliTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tSessaoCliDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tSessaoCliPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tSessaoCliDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tSessaoCliPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tSessaoCliNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tSessaoCliFuncI: TStringField
      FieldName = 'FuncI'
      Size = 30
    end
    object tSessaoCliFuncF: TStringField
      FieldName = 'FuncF'
      Size = 30
    end
    object tSessaoCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tSessaoCliTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tSessaoCliCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object tSessaoCliCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object tSessaoCliTicksI: TIntegerField
      FieldName = 'TicksI'
    end
    object tSessaoCliPausado: TBooleanField
      FieldName = 'Pausado'
    end
    object tSessaoCliInicioPausa: TIntegerField
      FieldName = 'InicioPausa'
    end
    object tSessaoCliMinTicksUsados: TIntegerField
      FieldName = 'MinTicksUsados'
    end
    object tSessaoCliMinTicksTotal: TIntegerField
      FieldName = 'MinTicksTotal'
    end
    object tSessaoCliFimTicksUsados: TIntegerField
      FieldName = 'FimTicksUsados'
    end
    object tSessaoCliFimTicksTotal: TIntegerField
      FieldName = 'FimTicksTotal'
    end
    object tSessaoCliStrPausas: TMemoField
      FieldName = 'StrPausas'
      BlobType = ftMemo
    end
    object tSessaoCliStrTransfMaq: TMemoField
      FieldName = 'StrTransfMaq'
      BlobType = ftMemo
    end
    object tSessaoCliStrFechamentoCaixa: TMemoField
      FieldName = 'StrFechamentoCaixa'
      BlobType = ftMemo
    end
    object tSessaoCliMinutosCli: TFloatField
      FieldName = 'MinutosCli'
    end
    object tSessaoCliMinutosPrev: TFloatField
      FieldName = 'MinutosPrev'
    end
    object tSessaoCliMinutosMax: TFloatField
      FieldName = 'MinutosMax'
    end
    object tSessaoCliMinutosCliU: TFloatField
      FieldName = 'MinutosCliU'
    end
    object tSessaoCliValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object tSessaoCliValorCliU: TFloatField
      FieldName = 'ValorCliU'
    end
    object tSessaoCliTranI: TIntegerField
      FieldName = 'TranI'
    end
    object tSessaoCliTranF: TIntegerField
      FieldName = 'TranF'
    end
    object tSessaoCliPermitirDownload: TBooleanField
      FieldName = 'PermitirDownload'
    end
    object tSessaoCliVersaoRegistro: TIntegerField
      FieldName = 'VersaoRegistro'
    end
    object tSessaoCliCartaoTempo: TBooleanField
      FieldName = 'CartaoTempo'
    end
    object tSessaoCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tSessaoCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tSessaoCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tSessaoCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tSessaoCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tSessaoCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tSessaoCliHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tSessaoCliFiltrarWEB: TBooleanField
      FieldName = 'FiltrarWEB'
    end
    object tSessaoCliIPs: TnxMemoField
      FieldName = 'IPs'
      BlobType = ftMemo
    end
    object tSessaoCliDesktopSinc: TBooleanField
      FieldName = 'DesktopSinc'
    end
    object tSessaoCliDisableAD: TBooleanField
      FieldName = 'DisableAD'
    end
    object tSessaoCliJobID: TIntegerField
      FieldName = 'JobID'
    end
    object tSessaoCliJobPages: TWordField
      FieldName = 'JobPages'
    end
    object tSessaoCliPermitirDownloadExe: TBooleanField
      FieldName = 'PermitirDownloadExe'
    end
  end
  object tLApp: TnxTable
    Database = nxDB
    TableName = 'LogApp'
    IndexName = 'IID'
    Left = 288
    Top = 16
    object tLAppID: TAutoIncField
      FieldName = 'ID'
    end
    object tLAppSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tLAppCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tLAppInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tLAppFim: TDateTimeField
      FieldName = 'Fim'
    end
    object tLAppMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tLAppExe: TStringField
      FieldName = 'Exe'
      Size = 16
    end
    object tLAppCaminho: TStringField
      FieldName = 'Caminho'
      Size = 16
    end
    object tLAppTitulo: TStringField
      FieldName = 'Titulo'
      Size = 16
    end
    object tLAppURL: TIntegerField
      FieldName = 'URL'
    end
    object tLAppMaq: TWordField
      FieldName = 'Maq'
    end
    object tLAppCaixa: TIntegerField
      FieldName = 'Caixa'
    end
  end
  object tLUrl: TnxTable
    Database = nxDB
    TableName = 'LogUrl'
    IndexName = 'ISessaoHostPagina'
    Left = 328
    Top = 16
    object tLUrlID: TAutoIncField
      FieldName = 'ID'
    end
    object tLUrlCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tLUrlMaq: TWordField
      FieldName = 'Maq'
    end
    object tLUrlSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tLUrlHost: TStringField
      FieldName = 'Host'
      Size = 16
    end
    object tLUrlDominio: TStringField
      FieldName = 'Dominio'
      Size = 16
    end
    object tLUrlPagina: TStringField
      FieldName = 'Pagina'
      Size = 16
    end
    object tLUrlSearchArg: TStringField
      FieldName = 'SearchArg'
      Size = 16
    end
    object tLUrlSearchEng: TStringField
      FieldName = 'SearchEng'
      Size = 2
    end
    object tLUrlViewTime: TFloatField
      FieldName = 'ViewTime'
    end
    object tLUrlFirstView: TDateTimeField
      FieldName = 'FirstView'
    end
    object tLUrlCaixa: TIntegerField
      FieldName = 'Caixa'
    end
  end
  object tLNom: TnxTable
    Database = nxDB
    TableName = 'LogNom'
    IndexName = 'IID'
    Left = 368
    Top = 16
    object tLNomID: TStringField
      FieldName = 'ID'
      Size = 16
    end
    object tLNomType: TStringField
      FieldName = 'Type'
      Size = 1
    end
    object tLNomNome: TMemoField
      FieldName = 'Nome'
      BlobType = ftMemo
    end
  end
  object tPM: TnxTable
    Database = nxDB
    TableName = 'PrintMon'
    IndexName = 'IPrinterIndexJobID'
    Left = 440
    Top = 248
    object tPMJobID: TIntegerField
      FieldName = 'JobID'
    end
    object tPMComputer: TStringField
      FieldName = 'Computer'
      Size = 100
    end
    object tPMMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tPMPrinterName: TStringField
      FieldName = 'PrinterName'
      Size = 300
    end
    object tPMPrinterShare: TStringField
      FieldName = 'PrinterShare'
      Size = 300
    end
    object tPMPrinterPort: TStringField
      FieldName = 'PrinterPort'
      Size = 300
    end
    object tPMPrinterServer: TStringField
      FieldName = 'PrinterServer'
      Size = 300
    end
    object tPMUser: TStringField
      FieldName = 'User'
      Size = 300
    end
    object tPMDocument: TnxMemoField
      FieldName = 'Document'
      BlobType = ftMemo
    end
    object tPMPages: TIntegerField
      FieldName = 'Pages'
    end
    object tPMTotalPages: TIntegerField
      FieldName = 'TotalPages'
    end
    object tPMCopies: TIntegerField
      FieldName = 'Copies'
    end
    object tPMClientPages: TIntegerField
      FieldName = 'ClientPages'
    end
    object tPMStatus: TWordField
      FieldName = 'Status'
    end
    object tPMPrinterIndex: TIntegerField
      FieldName = 'PrinterIndex'
    end
    object tPMPausou: TBooleanField
      FieldName = 'Pausou'
    end
    object tPMLiberacao: TWordField
      FieldName = 'Liberacao'
    end
    object tPMImpID: TIntegerField
      FieldName = 'ImpID'
    end
    object tPMSpooling: TBooleanField
      FieldName = 'Spooling'
    end
    object tPMJobCliID: TIntegerField
      FieldName = 'JobCliID'
    end
  end
  object tMsgCli: TnxTable
    Database = nxDB
    TableName = 'MsgCli'
    IndexName = 'IClienteID'
    Left = 440
    Top = 312
    object tMsgCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tMsgCliCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tMsgCliTitulo: TStringField
      FieldName = 'Titulo'
      Size = 50
    end
    object tMsgCliTexto: TnxMemoField
      FieldName = 'Texto'
      BlobType = ftMemo
    end
    object tMsgCliRef: TIntegerField
      FieldName = 'Ref'
    end
  end
  object tCHora: TnxTable
    Database = nxDB
    TableName = 'CHorario'
    IndexName = 'IID'
    Left = 440
    Top = 176
    object tCHoraID: TAutoIncField
      FieldName = 'ID'
    end
    object tCHoraNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCHoraHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tCHoraHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tCHoraHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tCHoraHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tCHoraHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tCHoraHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tCHoraHP7: TIntegerField
      FieldName = 'HP7'
    end
  end
  object tCategFW: TnxTable
    Database = nxDB
    TableName = 'CategFW'
    IndexName = 'IID'
    Left = 376
    Top = 256
    object tCategFWID: TAutoIncField
      FieldName = 'ID'
    end
    object tCategFWNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
  end
  object tNomes: TnxTable
    Database = nxDB
    TableName = 'Nomes'
    IndexName = 'INome'
    Left = 296
    Top = 368
    object tNomesNome: TStringField
      FieldName = 'Nome'
      Size = 17
    end
    object tNomesSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
  end
end
