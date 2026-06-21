object kbmProcs: TkbmProcs
  OldCreateOrder = True
  OnCreate = kbmMWCustomServiceCreate
  GatherStatistics = False
  Height = 294
  Width = 425
  object nxSession: TnxSession
    ServerEngine = dmServidorBD.ServerEngine
    Left = 56
    Top = 64
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'cybermgr'
    Left = 112
    Top = 64
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Contato'
    IndexName = 'ICodigo'
    Left = 168
    Top = 64
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
    end
  end
  object tConfig: TnxTable
    Database = nxDB
    TableName = 'Config'
    Left = 168
    Top = 128
    object tConfigNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tConfigModulos: TMemoField
      FieldName = 'Modulos'
      BlobType = ftMemo
    end
    object tConfigTiposLancExtra: TMemoField
      FieldName = 'TiposLancExtra'
      BlobType = ftMemo
    end
    object tConfigProgramasPermitidos: TMemoField
      FieldName = 'ProgramasPermitidos'
      BlobType = ftMemo
    end
    object tConfigCMGuard: TMemoField
      FieldName = 'CMGuard'
      BlobType = ftMemo
    end
    object tConfigJanelasExplorer: TMemoField
      FieldName = 'JanelasExplorer'
      BlobType = ftMemo
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
    object tConfigProdutoImpressao: TStringField
      FieldName = 'ProdutoImpressao'
      Size = 15
    end
    object tConfigPermiteCapturaTela: TBooleanField
      FieldName = 'PermiteCapturaTela'
    end
    object tConfigAlertaFimTempo: TDateTimeField
      FieldName = 'AlertaFimTempo'
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
    object tConfigMostraCliCadAntesAvulso: TBooleanField
      FieldName = 'MostraCliCadAntesAvulso'
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
    object tConfigPortaImpRec: TStringField
      FieldName = 'PortaImpRec'
      Size = 10
    end
    object tConfigSaltoImpRec: TWordField
      FieldName = 'SaltoImpRec'
    end
    object tConfigLargImpRec: TWordField
      FieldName = 'LargImpRec'
    end
    object tConfigCabecalhoImpRec: TMemoField
      FieldName = 'CabecalhoImpRec'
      BlobType = ftMemo
    end
    object tConfigRodapeImpRec: TMemoField
      FieldName = 'RodapeImpRec'
      BlobType = ftMemo
    end
    object tConfigImprimirImpRec: TBooleanField
      FieldName = 'ImprimirImpRec'
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
    object tConfigDesativaRegAutImp: TBooleanField
      FieldName = 'DesativaRegAutImp'
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
  end
end
