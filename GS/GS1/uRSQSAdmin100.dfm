object qsAdmin100: TqsAdmin100
  OldCreateOrder = True
  OnCreate = kbmMWQueryServiceCreate
  GatherStatistics = False
  OnAuthenticate = kbmMWQueryServiceAuthenticate
  Query = qTemplate
  AllowClientStatement = True
  AllowClientKeyFields = True
  AllowClientNamedQuery = True
  AllowClientTableName = True
  TransportStreamFormat = BSF
  OnAuthenticateQuery = kbmMWQueryServiceAuthenticateQuery
  Height = 245
  Width = 248
  object Resolver: TkbmMWNexusDBResolver
    OnInsert = ResolverInsert
    AllOrNothing = True
    InsertKeyFields = True
    Left = 16
    Top = 8
  end
  object qCli: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'WIZARDSESSION'
    ConnectionPool = DM.mwNXDBCP
    Resolver = Resolver
    TableName = 'Cliente'
    KeyFieldNames = 'Codigo'
    Published = True
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = True
    AutoAddIndexes = True
    EnableVersioning = True
    IndexDefs = <>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    SQL.Strings = (
      'Select * from Cliente')
    Params = <>
    Left = 120
    Top = 8
    object qCliCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qCliTipo: TWordField
      FieldName = 'Tipo'
    end
    object qCliSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object qCliCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object qCliCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object qCliAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object qCliAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object qCliLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object qCliRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object qCliPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object qCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qCliEndereco: TMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object qCliCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object qCliBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object qCliSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object qCliNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object qCliCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object qCliIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object qCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qCliTelefones: TMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object qCliEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object qCliFormaPagto: TMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object qCliLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object qCliLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object qCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object qCliManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object qCliManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object qCliProprietarios: TMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object qCliGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object qCliTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object qCliEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object qCliValor: TCurrencyField
      FieldName = 'Valor'
    end
    object qCliValorRec: TCurrencyField
      FieldName = 'ValorRec'
    end
    object qCliEmitirNF: TBooleanField
      FieldName = 'EmitirNF'
    end
    object qCliMessenger: TMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object qCliICQ: TMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object qCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object qCliUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object qCliNegociacao: TWordField
      FieldName = 'Negociacao'
    end
    object qCliStatus: TIntegerField
      FieldName = 'Status'
    end
    object qCliContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
  end
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 68
    Top = 8
  end
  object qTemplate: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'WIZARDSESSION'
    ConnectionPool = DM.mwNXDBCP
    Resolver = Resolver
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = True
    EnableVersioning = True
    IndexDefs = <>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    SQL.Strings = (
      '')
    Params = <>
    Left = 176
    Top = 8
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCPIP
    Left = 136
    Top = 72
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 80
    Top = 72
  end
  object nxSession: TnxSession
    ServerEngine = nxRSE
    Left = 24
    Top = 72
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '192.168.0.1'
    ServerNameDesigntime = '192.168.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 80
    Top = 128
  end
  object tUsuario: TnxTable
    Database = nxDB
    TableName = 'Usuario'
    IndexName = 'IUsername'
    Left = 24
    Top = 128
    object tUsuarioUsername: TStringField
      FieldName = 'Username'
    end
    object tUsuarioSenha: TStringField
      FieldName = 'Senha'
    end
    object tUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object tUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
    object tUsuarioNomeCHAT: TStringField
      FieldName = 'NomeCHAT'
      Size = 50
    end
    object tUsuarioStatusCHAT: TStringField
      FieldName = 'StatusCHAT'
      Size = 30
    end
    object tUsuarioCHAT: TBooleanField
      FieldName = 'CHAT'
    end
  end
  object qStatus: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'WIZARDSESSION'
    ConnectionPool = DM.mwNXDBCP
    Resolver = Resolver
    TableName = 'Status'
    KeyFieldNames = 'Codigo'
    Published = True
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = True
    EnableVersioning = True
    IndexDefs = <>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    SQL.Strings = (
      'Select * from Status')
    Params = <>
    Left = 136
    Top = 128
    object qStatusCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qStatusDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qStatusCorFonte: TIntegerField
      FieldName = 'CorFonte'
    end
    object qStatusCorFundo: TIntegerField
      FieldName = 'CorFundo'
    end
  end
end
