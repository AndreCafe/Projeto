object qsRegistro300: TqsRegistro300
  OldCreateOrder = True
  OnCreate = kbmMWQueryServiceCreate
  OnDestroy = kbmMWQueryServiceDestroy
  GatherStatistics = False
  AllowClientStatement = True
  AllowClientKeyFields = True
  AllowClientNamedQuery = True
  AllowClientTableName = True
  TransportStreamFormat = BSF
  Height = 486
  Width = 490
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = [sfSaveLargeFields]
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 156
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\nexreg\dados'
    Left = 224
    Top = 80
  end
  object nxSession: TnxSession
    Timeout = 60000
    Left = 224
    Top = 16
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 56
    Top = 144
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object tCliCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object tCliCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object tCliAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object tCliAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object tCliLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object tCliRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object tCliPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object tCliSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object tCliCodEquip: TStringField
      FieldName = 'CodEquip'
      Size = 60
    end
    object tCliNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object tCliCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object tCliIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object tCliObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliEmailReg: TnxMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object tCliFormaPagto: TnxMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object tCliLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object tCliLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object tCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object tCliManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object tCliManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object tCliGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object tCliTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object tCliEmailTec: TnxMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object tCliValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tCliValorRec: TCurrencyField
      FieldName = 'ValorRec'
    end
    object tCliEmitirNF: TBooleanField
      FieldName = 'EmitirNF'
    end
    object tCliMessenger: TnxMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object tCliICQ: TnxMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object tCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tCliUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object tCliNegociacao: TWordField
      FieldName = 'Negociacao'
    end
    object tCliContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object tCliPrograma: TWordField
      FieldName = 'Programa'
    end
    object tCliBloqueado: TBooleanField
      FieldName = 'Bloqueado'
    end
    object tCliCliente: TBooleanField
      FieldName = 'Cliente'
    end
    object tCliAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object tCliCodAtivacao: TStringField
      FieldName = 'CodAtivacao'
      Size = 10
    end
    object tCliEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tCliAtivadoEm: TDateTimeField
      FieldName = 'AtivadoEm'
    end
    object tCliTipoConta: TWordField
      FieldName = 'TipoConta'
    end
    object tCliPremiumAte: TDateTimeField
      FieldName = 'PremiumAte'
    end
    object tCliCodDesc: TStringField
      FieldName = 'CodDesc'
      Size = 10
    end
    object tCliProprietario: TStringField
      FieldName = 'Proprietario'
      Size = 70
    end
    object tCliCadastroCompleto: TBooleanField
      FieldName = 'CadastroCompleto'
    end
    object tCliCadastroCompletoEm: TDateTimeField
      FieldName = 'CadastroCompletoEm'
    end
    object tCliRegistroEm: TDateTimeField
      FieldName = 'RegistroEm'
    end
    object tCliCidade_geoip: TStringField
      FieldName = 'Cidade_geoip'
      Size = 50
    end
    object tCliUF_geoip: TStringField
      FieldName = 'UF_geoip'
      Size = 2
    end
    object tCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
    end
    object tCliTels: TnxMemoField
      FieldName = 'Tels'
      BlobType = ftMemo
    end
    object tCliProp: TnxMemoField
      FieldName = 'Prop'
      BlobType = ftMemo
    end
    object tCliContaTrocada: TBooleanField
      FieldName = 'ContaTrocada'
    end
    object tCliCAno: TWordField
      FieldName = 'CAno'
    end
    object tCliCMes: TWordField
      FieldName = 'CMes'
    end
    object tCliCDia: TWordField
      FieldName = 'CDia'
    end
    object tCliAAno: TWordField
      FieldName = 'AAno'
    end
    object tCliAMes: TWordField
      FieldName = 'AMes'
    end
    object tCliADia: TWordField
      FieldName = 'ADia'
    end
    object tCliUAno: TWordField
      FieldName = 'UAno'
    end
    object tCliUMes: TWordField
      FieldName = 'UMes'
    end
    object tCliUDia: TWordField
      FieldName = 'UDia'
    end
    object tCliUDias: TWordField
      FieldName = 'UDias'
    end
    object tCliMotivoDesist: TStringField
      FieldName = 'MotivoDesist'
      Size = 30
    end
    object tCliLastAdminPopup: TDateTimeField
      FieldName = 'LastAdminPopup'
    end
    object tCliCampanha: TStringField
      FieldName = 'Campanha'
      Size = 50
    end
    object tCliutmccn: TIntegerField
      FieldName = 'utmccn'
    end
    object tCliutmctr: TIntegerField
      FieldName = 'utmctr'
    end
    object tCliutmcct: TIntegerField
      FieldName = 'utmcct'
    end
    object tCliutmcsr: TIntegerField
      FieldName = 'utmcsr'
    end
    object tCliutmcmd: TIntegerField
      FieldName = 'utmcmd'
    end
    object tCliOrigem: TStringField
      FieldName = 'Origem'
      Size = 50
    end
    object tCliRedirT: TIntegerField
      FieldName = 'RedirT'
    end
    object tCliRedirI: TDateTimeField
      FieldName = 'RedirI'
    end
    object tCliTel1: TStringField
      FieldName = 'Tel1'
    end
    object tCliTel2: TStringField
      FieldName = 'Tel2'
    end
    object tCliTel3: TStringField
      FieldName = 'Tel3'
    end
    object tCliTel4: TStringField
      FieldName = 'Tel4'
    end
    object tCliTipoTel1: TWordField
      FieldName = 'TipoTel1'
    end
    object tCliTipoTel2: TWordField
      FieldName = 'TipoTel2'
    end
    object tCliTipoTel3: TWordField
      FieldName = 'TipoTel3'
    end
    object tCliTipoTel4: TWordField
      FieldName = 'TipoTel4'
    end
    object tCliUpdateCad: TIntegerField
      FieldName = 'UpdateCad'
    end
    object tCliUpdateMkt: TIntegerField
      FieldName = 'UpdateMkt'
    end
    object tCliUpdateContato: TIntegerField
      FieldName = 'UpdateContato'
    end
    object tCliDBounce: TDateTimeField
      FieldName = 'DBounce'
    end
    object tCliDInativo: TDateTimeField
      FieldName = 'DInativo'
    end
    object tCliInstalouEm: TDateTimeField
      FieldName = 'InstalouEm'
    end
    object tCliBounce: TBooleanField
      FieldName = 'Bounce'
    end
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tCliConfirmouLocal: TBooleanField
      FieldName = 'ConfirmouLocal'
    end
    object tCliPreRegistro: TBooleanField
      FieldName = 'PreRegistro'
    end
    object tCliPreRegistroIP: TStringField
      FieldName = 'PreRegistroIP'
      Size = 15
    end
    object tCliPreRegistroEm: TDateTimeField
      FieldName = 'PreRegistroEm'
    end
    object tCliContatoCC: TBooleanField
      FieldName = 'ContatoCC'
    end
    object tCliStatusDesde: TDateTimeField
      FieldName = 'StatusDesde'
    end
    object tCliRecente: TBooleanField
      FieldName = 'Recente'
    end
    object tCliParouRedir: TBooleanField
      FieldName = 'ParouRedir'
    end
    object tCliPremium: TBooleanField
      FieldName = 'Premium'
    end
    object tCliFezRedir: TBooleanField
      FieldName = 'FezRedir'
    end
    object tCliRedirU: TDateTimeField
      FieldName = 'RedirU'
    end
    object tCliRedirD: TWordField
      FieldName = 'RedirD'
    end
    object tCliUsou: TBooleanField
      FieldName = 'Usou'
    end
    object tCliSaiu: TBooleanField
      FieldName = 'Saiu'
    end
    object tCliVaiVoltar: TBooleanField
      FieldName = 'VaiVoltar'
    end
    object tCliVaiVoltarAte: TDateTimeField
      FieldName = 'VaiVoltarAte'
    end
    object tCliCCContatoOk: TBooleanField
      FieldName = 'CCContatoOk'
    end
    object tCliCCContatoFail: TBooleanField
      FieldName = 'CCContatoFail'
    end
    object tCliCCPContatoOk: TDateTimeField
      FieldName = 'CCPContatoOk'
    end
    object tCliCCPContatoFail: TDateTimeField
      FieldName = 'CCPContatoFail'
    end
    object tCliCCUContatoOk: TDateTimeField
      FieldName = 'CCUContatoOk'
    end
    object tCliCCUContatoFail: TDateTimeField
      FieldName = 'CCUContatoFail'
    end
    object tCliCCQContatoOK: TIntegerField
      FieldName = 'CCQContatoOK'
    end
    object tCliCCQContatoFail: TIntegerField
      FieldName = 'CCQContatoFail'
    end
    object tCliCCAgente: TIntegerField
      FieldName = 'CCAgente'
    end
    object tCliStatus: TWordField
      FieldName = 'Status'
    end
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    DefaultFormat = MTBSF
    PersistentFormat = MTBSF
    AllDataFormat = MTBSF
    Left = 152
    Top = 80
    object MTCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object MTSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object MTCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object MTCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object MTAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object MTAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object MTLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object MTRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object MTPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object MTCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object MTUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object MTEndereco: TMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object MTCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object MTBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object MTSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object MTNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object MTCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object MTIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object MTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object MTTelefones: TMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object MTEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object MTFormaPagto: TMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object MTLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object MTLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object MTLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object MTManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object MTManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object MTProprietarios: TMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object MTGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object MTTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object MTEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object MTCodAtivacao: TStringField
      FieldName = 'CodAtivacao'
      Size = 10
    end
    object MTAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object MTEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
  end
  object MTBSF: TkbmBinaryStreamFormat
    Version = '3.00'
    sfUsingIndex = [sfSaveUsingIndex]
    sfData = [sfSaveData, sfLoadData]
    sfCalculated = []
    sfLookup = []
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef, sfLoadDef]
    sfIndexDef = [sfSaveIndexDef, sfLoadIndexDef]
    sfFiltered = [sfSaveFiltered]
    sfIgnoreRange = [sfSaveIgnoreRange]
    sfIgnoreMasterDetail = [sfSaveIgnoreMasterDetail]
    sfDeltas = []
    sfDontFilterDeltas = []
    sfAppend = []
    sfFieldKind = [sfSaveFieldKind]
    sfFromStart = [sfLoadFromStart]
    sfDataTypeHeader = [sfSaveDataTypeHeader, sfLoadDataTypeHeader]
    BufferSize = 16384
    Left = 144
    Top = 144
  end
  object tLog: TnxTable
    Database = nxDB
    TableName = 'Log'
    IndexName = 'INum'
    Left = 224
    Top = 144
    object tLogNum: TAutoIncField
      FieldName = 'Num'
    end
    object tLogDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tLogLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tLogDetalhes: TMemoField
      FieldName = 'Detalhes'
      BlobType = ftMemo
    end
    object tLogIP: TStringField
      FieldName = 'IP'
    end
    object tLogOperID: TWordField
      FieldName = 'OperID'
    end
    object tLogOK: TBooleanField
      FieldName = 'OK'
    end
    object tLogSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
  end
  object tCorpo: TnxTable
    Database = nxDB
    TableName = 'EmailCorpo'
    IndexName = 'IProcessou'
    Left = 296
    Top = 144
    object tCorpoID: TAutoIncField
      FieldName = 'ID'
    end
    object tCorpoCorpo: TnxMemoField
      FieldName = 'Corpo'
      BlobType = ftMemo
    end
    object tCorpoDestino: TnxMemoField
      FieldName = 'Destino'
      BlobType = ftMemo
    end
    object tCorpoAssunto: TStringField
      FieldName = 'Assunto'
      Size = 100
    end
    object tCorpoInclusao: TDateTimeField
      FieldName = 'Inclusao'
    end
    object tCorpoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCorpoEnviarEm: TDateTimeField
      FieldName = 'EnviarEm'
    end
    object tCorpoProcessou: TBooleanField
      FieldName = 'Processou'
    end
    object tCorpoCType: TStringField
      FieldName = 'CType'
      Size = 100
    end
    object tCorpoAnexos: TnxMemoField
      FieldName = 'Anexos'
      BlobType = ftMemo
    end
  end
  object tAut: TnxTable
    Database = nxDB
    TableName = 'Autorizacao'
    IndexName = 'ILoja'
    Left = 56
    Top = 72
  end
  object qCli: TnxQuery
    Database = nxDB
    Left = 56
    Top = 224
  end
  object tEst: TnxTable
    Database = nxDB
    TableName = 'Est'
    IndexName = 'ILojaData'
    Left = 160
    Top = 224
    object tEstID: TAutoIncField
      FieldName = 'ID'
    end
    object tEstLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tEstData: TDateField
      FieldName = 'Data'
    end
    object tEstCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tEstDataAtu: TDateTimeField
      FieldName = 'DataAtu'
    end
    object tEstSessoesQtd: TIntegerField
      FieldName = 'SessoesQtd'
    end
    object tEstSessoesTempo: TFloatField
      FieldName = 'SessoesTempo'
    end
    object tEstURLs: TIntegerField
      FieldName = 'URLs'
    end
    object tEstCodEquip: TStringField
      FieldName = 'CodEquip'
    end
  end
  object tEstSearch: TnxTable
    Database = nxDB
    TableName = 'EstSearch'
    IndexName = 'ILojaData'
    Left = 216
    Top = 224
    object tEstSearchID: TAutoIncField
      FieldName = 'ID'
    end
    object tEstSearchLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tEstSearchData: TDateField
      FieldName = 'Data'
    end
    object tEstSearchCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tEstSearchCodEquip: TStringField
      FieldName = 'CodEquip'
    end
    object tEstSearchDataAtu: TDateTimeField
      FieldName = 'DataAtu'
    end
    object tEstSearchQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tEstSearchPag: TIntegerField
      FieldName = 'Pag'
    end
    object tEstSearchEst: TIntegerField
      FieldName = 'Est'
    end
    object tEstSearchEng: TStringField
      FieldName = 'Eng'
      Size = 2
    end
  end
  object tEstRes: TnxTable
    Database = nxDB
    TableName = 'EstRes'
    IndexName = 'ICodEquipRes'
    Left = 272
    Top = 224
    object tEstResLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tEstResCodEquip: TStringField
      FieldName = 'CodEquip'
    end
    object tEstResRes: TStringField
      FieldName = 'Res'
      Size = 10
    end
    object tEstResQtd: TIntegerField
      FieldName = 'Qtd'
    end
  end
  object tPrecos: TnxTable
    Database = nxDB
    TableName = 'Precos'
    IndexName = 'IMeses'
    Left = 336
    Top = 80
  end
  object tRec: TnxTable
    Database = nxDB
    TableName = 'Receber'
    IndexName = 'IPremiumLojaBaixou'
    Left = 336
    Top = 184
    object tRecID: TAutoIncField
      FieldName = 'ID'
    end
    object tRecLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tRecVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object tRecPagamento: TDateField
      FieldName = 'Pagamento'
    end
    object tRecValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tRecValorPago: TCurrencyField
      FieldName = 'ValorPago'
    end
    object tRecObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tRecDoc: TStringField
      FieldName = 'Doc'
      Size = 60
    end
    object tRecDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object tRecLancamento: TDateTimeField
      FieldName = 'Lancamento'
    end
    object tRecClienteLancou: TBooleanField
      FieldName = 'ClienteLancou'
    end
    object tRecPremium: TBooleanField
      FieldName = 'Premium'
    end
    object tRecPremiumDias: TWordField
      FieldName = 'PremiumDias'
    end
    object tRecCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tRecCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tRecCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
    end
    object tRecBaixou: TBooleanField
      FieldName = 'Baixou'
    end
  end
  object FBI: TFreeBoletoImagem
    DestruirBoletos = False
    TrackBarDelay = 0
    Left = 192
    Top = 314
  end
  object FB: TFreeBoleto
    Cedente.Nome = 'NEXTAR TECNOLOGIA DE SOFTWARE LTDA'
    Cedente.CodigoBanco = '341'
    Cedente.Agencia = '0125'
    Cedente.ContaCorrente = '58079'
    Cedente.DigitoContaCorrente = '5'
    Cedente.Banco001.Convenio = '1168094'
    Sacado.Nome = 'Andr'#233' Borges'
    Sacado.Endereco = 'R. Laurindo Janu'#225'rio da Silveira 5530 sl 5'
    Sacado.Cidade = 'Florian'#243'polis'
    Sacado.Estado = 'SC'
    Sacado.Cep = '88062200'
    Sacado.Pessoa = pFisica
    Sacado.CNPJ_CPF = '16392012893'
    Vencimento = 39161.000000000000000000
    Valor = 150.000000000000000000
    NossoNumero = '115'
    LocalPagamento = 'QUALQUER BANCO AT'#201' O VENCIMENTO'
    DataDocumento = 39161.000000000000000000
    Documento = '254910'
    Especie = 'R$'
    EspecieDoc = 'DS'
    Aceite = 'N'
    Carteira = '109'
    Instrucoes.Strings = (
      'SOFTWARE NEXCAF'#201)
    Left = 160
    Top = 314
  end
  object tIPLoja: TnxTable
    Database = nxDB
    TableName = 'IPLoja'
    IndexName = 'IIP'
    Left = 288
    Top = 304
    object tIPLojaIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object tIPLojaLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tIPLojaDH: TDateTimeField
      FieldName = 'DH'
    end
  end
end
