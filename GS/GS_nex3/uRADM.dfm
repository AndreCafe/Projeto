object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 372
  object mwPS: TkbmMWPooledSession
    ConnectionPool = mwCCP
    AutoSessionName = False
    SessionName = 'mwPS'
    Left = 24
    Top = 16
  end
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = [sfSaveLargeFields]
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 120
    Top = 16
  end
  object mwCCP: TkbmMWClientConnectionPool
    Transport = mwTCPIP
    Left = 72
    Top = 16
  end
  object mwCli: TkbmMWPooledSimpleClient
    ConnectionPool = mwCCP
    ConnectionWaitTimeout = 0
    Username = 'jlborges'
    Password = 'jj'
    Left = 72
    Top = 72
  end
  object Resolver: TkbmMWClientTransactionResolver
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    TransportStreamFormat = BSF
    Client = mwCli
    ClientAsTemplate = False
    ConnectionPool = mwCCP
    ConnectionWaitTimeout = 0
    Left = 120
    Top = 72
  end
  object qCli: TkbmMWClientQuery
    Client = mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      '@qCli')
    Params = <>
    TransportStreamFormat = BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'Codigo'
    TableName = 'Cliente'
    OnResolveError = qCliResolveError
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Senha'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CadastroEm'
        DataType = ftDateTime
      end
      item
        Name = 'CadastroPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'AtualizadoEm'
        DataType = ftDateTime
      end
      item
        Name = 'AtualizadoPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Loja'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RazaoSocial'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Endereco'
        DataType = ftMemo
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SerieHD'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NumMaq'
        DataType = ftWord
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 19
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Telefones'
        DataType = ftMemo
      end
      item
        Name = 'EmailReg'
        DataType = ftMemo
      end
      item
        Name = 'FormaPagto'
        DataType = ftMemo
      end
      item
        Name = 'LicMaq'
        DataType = ftWord
      end
      item
        Name = 'LicTipo'
        DataType = ftWord
      end
      item
        Name = 'LicVenc'
        DataType = ftDate
      end
      item
        Name = 'ManInicio'
        DataType = ftDate
      end
      item
        Name = 'ManVenc'
        DataType = ftDate
      end
      item
        Name = 'Proprietarios'
        DataType = ftMemo
      end
      item
        Name = 'Gerente'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TipoLoja'
        DataType = ftWord
      end
      item
        Name = 'EmailTec'
        DataType = ftMemo
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'ValorRec'
        DataType = ftCurrency
      end
      item
        Name = 'EmitirNF'
        DataType = ftBoolean
      end
      item
        Name = 'Messenger'
        DataType = ftMemo
      end
      item
        Name = 'ICQ'
        DataType = ftMemo
      end
      item
        Name = 'UVersao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UObtemLic'
        DataType = ftDateTime
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Status'
        DataType = ftInteger
      end
      item
        Name = 'ContatarEm'
        DataType = ftDateTime
      end>
    IndexFieldNames = 'Codigo'
    IndexDefs = <
      item
        Name = 'qCliIndex1'
        Fields = 'Codigo'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    VersioningMode = mtvmAllSinceCheckPoint
    FilterOptions = []
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    CommaTextFormat = BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    BeforeInsert = qCliBeforeEdit
    BeforeEdit = qCliBeforeEdit
    BeforePost = qCliBeforePost
    AfterDelete = qCliAfterDelete
    Left = 176
    Top = 16
    object qCliCodigoStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodigoStr'
      Size = 9
      Calculated = True
    end
    object qCliLicencaStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'LicencaStr'
      Size = 30
      Calculated = True
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
      Alignment = taLeftJustify
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
      Alignment = taLeftJustify
      FieldName = 'LicMaq'
    end
    object qCliLicTipo: TWordField
      Alignment = taLeftJustify
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
      Alignment = taLeftJustify
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
    object qCliUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object qCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object qCliCodigo: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Codigo'
    end
    object qCliStatus: TIntegerField
      FieldName = 'Status'
    end
    object qCliContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object qCliDescrStatus: TStringField
      FieldKind = fkLookup
      FieldName = 'DescrStatus'
      LookupDataSet = qStatus
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Status'
      Size = 50
      Lookup = True
    end
    object qCliFonteStatus: TIntegerField
      FieldKind = fkLookup
      FieldName = 'FonteStatus'
      LookupDataSet = qStatus
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CorFonte'
      KeyFields = 'Status'
      Lookup = True
    end
    object qCliFundoStatus: TIntegerField
      FieldKind = fkLookup
      FieldName = 'FundoStatus'
      LookupDataSet = qStatus
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CorFundo'
      KeyFields = 'Status'
      Lookup = True
    end
  end
  object dsCli: TDataSource
    DataSet = qCli
    Left = 176
    Top = 64
  end
  object qFinCli: TkbmMWClientQuery
    Client = mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      'select * from receber')
    Params = <>
    TransportStreamFormat = BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'ID'
    TableName = 'Receber'
    OnResolveError = qCliResolveError
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Loja'
        DataType = ftInteger
      end
      item
        Name = 'Vencimento'
        DataType = ftDate
      end
      item
        Name = 'Pagamento'
        DataType = ftDate
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'ValorPago'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Doc'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Lancamento'
        DataType = ftDateTime
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PC'
        DataType = ftInteger
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    VersioningMode = mtvmAllSinceCheckPoint
    FilterOptions = []
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    CommaTextFormat = BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    BeforeInsert = qFinCliBeforeInsert
    AfterInsert = qFinCliAfterInsert
    BeforeEdit = qFinCliBeforeInsert
    BeforeDelete = qFinCliBeforeInsert
    Left = 216
    Top = 16
    object qFinCliID: TIntegerField
      FieldName = 'ID'
    end
    object qFinCliLoja: TIntegerField
      FieldName = 'Loja'
    end
    object qFinCliVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object qFinCliPagamento: TDateField
      FieldName = 'Pagamento'
    end
    object qFinCliValor: TCurrencyField
      FieldName = 'Valor'
    end
    object qFinCliValorPago: TCurrencyField
      FieldName = 'ValorPago'
    end
    object qFinCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qFinCliDoc: TStringField
      FieldName = 'Doc'
      Size = 60
    end
    object qFinCliDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qFinCliLancamento: TDateTimeField
      FieldName = 'Lancamento'
    end
    object qFinCliTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qFinCliPC: TIntegerField
      FieldName = 'PC'
    end
    object qFinCliNomePC: TStringField
      FieldKind = fkLookup
      FieldName = 'NomePC'
      LookupDataSet = qPC
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'PC'
      Lookup = True
    end
  end
  object dsFinCli: TDataSource
    DataSet = qFinCli
    Left = 216
    Top = 64
  end
  object dsFin: TDataSource
    DataSet = qFinT
    Left = 256
    Top = 64
  end
  object qFinT: TkbmMWClientQuery
    Client = mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Params = <>
    TransportStreamFormat = BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    OnResolveError = qCliResolveError
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    CommaTextFormat = BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 256
    Top = 16
  end
  object qLog: TkbmMWClientQuery
    Client = mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      'select * from "Log"'
      'where DataHora >= '#39'2004-12-06'#39)
    Params = <>
    TransportStreamFormat = BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = '*'
    OnResolveError = qCliResolveError
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Num'
        DataType = ftInteger
      end
      item
        Name = 'DataHora'
        DataType = ftDateTime
      end
      item
        Name = 'Loja'
        DataType = ftInteger
      end
      item
        Name = 'Detalhes'
        DataType = ftMemo
      end
      item
        Name = 'IP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OperID'
        DataType = ftWord
      end
      item
        Name = 'OK'
        DataType = ftBoolean
      end
      item
        Name = 'SerieHD'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    CommaTextFormat = BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 296
    Top = 16
    object qLogNum: TIntegerField
      FieldName = 'Num'
    end
    object qLogDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object qLogLoja: TIntegerField
      FieldName = 'Loja'
    end
    object qLogDetalhes: TMemoField
      FieldName = 'Detalhes'
      BlobType = ftMemo
    end
    object qLogIP: TStringField
      FieldName = 'IP'
    end
    object qLogOperID: TWordField
      FieldName = 'OperID'
    end
    object qLogOK: TBooleanField
      FieldName = 'OK'
    end
    object qLogSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object qLogNomeLoja: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeLoja'
      LookupDataSet = qCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Loja'
      KeyFields = 'Loja'
      LookupCache = True
      Size = 50
      Lookup = True
    end
  end
  object dsLog: TDataSource
    DataSet = qLog
    Left = 296
    Top = 64
  end
  object qPC: TkbmMWClientQuery
    Client = mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      'select * from PlanoContas')
    Params = <>
    TransportStreamFormat = BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'ID'
    TableName = 'PlanoContas'
    OnResolveError = qCliResolveError
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Pai'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Sintetico'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    VersioningMode = mtvmAllSinceCheckPoint
    FilterOptions = []
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    CommaTextFormat = BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    BeforeInsert = qPCBeforeInsert
    AfterInsert = qPCAfterInsert
    BeforeEdit = qCliBeforeEdit
    AfterPost = qPCAfterPost
    BeforeDelete = qCliBeforeEdit
    AfterDelete = qPCAfterPost
    Left = 72
    Top = 122
    object qPCID: TIntegerField
      FieldName = 'ID'
    end
    object qPCPai: TIntegerField
      FieldName = 'Pai'
    end
    object qPCNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qPCSintetico: TBooleanField
      FieldName = 'Sintetico'
    end
  end
  object dsPC: TDataSource
    AutoEdit = False
    DataSet = qPC
    Left = 72
    Top = 170
  end
  object qUsuario: TkbmMWClientQuery
    Client = mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      'select * from Usuario')
    Params = <>
    TransportStreamFormat = BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'Username'
    TableName = 'Usuario'
    OnResolveError = qCliResolveError
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Username'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Admin'
        DataType = ftBoolean
      end
      item
        Name = 'Direitos'
        DataType = ftMemo
      end>
    IndexDefs = <
      item
        Name = 'qUsuarioIndex1'
        Fields = 'Username'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    VersioningMode = mtvmAllSinceCheckPoint
    FilterOptions = []
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    CommaTextFormat = BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    BeforeInsert = qCliBeforeEdit
    BeforeEdit = qCliBeforeEdit
    AfterPost = qPCAfterPost
    BeforeDelete = qCliBeforeEdit
    AfterDelete = qPCAfterPost
    Left = 24
    Top = 122
    object qUsuarioUsername: TStringField
      FieldName = 'Username'
      Required = True
    end
    object qUsuarioSenha: TStringField
      FieldName = 'Senha'
    end
    object qUsuarioNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
    object qUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object qUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
  end
  object dsUsuario: TDataSource
    AutoEdit = False
    DataSet = qUsuario
    Left = 24
    Top = 170
  end
  object qMenu: TkbmMWClientQuery
    Client = mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      'select * from Menu')
    Params = <>
    TransportStreamFormat = BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'ID'
    TableName = 'Menu'
    OnResolveError = qCliResolveError
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Username'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Pai'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Form'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OperID'
        DataType = ftWord
      end>
    Filtered = True
    IndexName = 'qMenuIID'
    IndexDefs = <
      item
        Name = 'qMenuIID'
        Fields = 'ID'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    VersioningMode = mtvmAllSinceCheckPoint
    FilterOptions = []
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    CommaTextFormat = BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    BeforeInsert = qCliBeforeEdit
    AfterInsert = qMenuAfterInsert
    BeforeEdit = qCliBeforeEdit
    AfterPost = qPCAfterPost
    BeforeDelete = qCliBeforeEdit
    AfterDelete = qPCAfterPost
    OnFilterRecord = qMenuFilterRecord
    Left = 120
    Top = 122
    object qMenuUsername: TStringField
      FieldName = 'Username'
    end
    object qMenuID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
    end
    object qMenuPai: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Pai'
    end
    object qMenuDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qMenuForm: TStringField
      FieldName = 'Form'
      Size = 50
    end
    object qMenuOperID: TWordField
      Alignment = taLeftJustify
      FieldName = 'OperID'
    end
  end
  object dsMenu: TDataSource
    AutoEdit = False
    DataSet = qMenu
    Left = 120
    Top = 170
  end
  object msgTCPIP: TkbmMWTCPIPIndyMessagingClientTransport
    Port = 3000
    Host = 'fran'
    StringConversion = mwscFixed
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    Direction = [mwmdSubscribe, mwmdPublish]
    InboundMessageQueue = msgQIn
    OutboundMessageQueue = msgQOut
    Subscriptions.Strings = (
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.73M50346T.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.S03WJ20Y152977.>'
      'MSG.CHAT.TODOS.>'
      'MSG.CHAT.S03WJ20Y152977.>')
    NodeID = '000A5EF97D'
    Active = False
    Left = 24
    Top = 72
  end
  object msgQIn: TkbmMWMemoryMessageQueue
    Left = 280
    Top = 168
  end
  object msgQOut: TkbmMWMemoryMessageQueue
    Left = 232
    Top = 168
  end
  object mwTCPIP: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3010
    Host = 'fran'
    StreamFormat = 'ZIPPED'
    VerifyTransfer = False
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 180
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 10
    StringConversion = mwscFixed
    Left = 176
    Top = 168
  end
  object qStatus: TkbmMWClientQuery
    Client = mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      '@qStatus')
    Params = <>
    TransportStreamFormat = BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = '*'
    TableName = 'Status'
    OnResolveError = qCliResolveError
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CorFonte'
        DataType = ftInteger
      end
      item
        Name = 'CorFundo'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'qCliIndex1'
        Fields = 'Codigo'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    VersioningMode = mtvmAllSinceCheckPoint
    FilterOptions = []
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    CommaTextFormat = BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    BeforeInsert = qCliBeforeEdit
    AfterInsert = qStatusAfterInsert
    BeforeEdit = qCliBeforeEdit
    AfterPost = qPCAfterPost
    AfterDelete = qStatusAfterDelete
    Left = 176
    Top = 112
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
  object dsStatus: TDataSource
    DataSet = qStatus
    Left = 224
    Top = 112
  end
  object qMax: TkbmMWClientQuery
    Client = mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      'select Max(Codigo) as Ultimo from cliente')
    Params = <>
    TransportStreamFormat = BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Senha'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CadastroEm'
        DataType = ftDateTime
      end
      item
        Name = 'CadastroPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'AtualizadoEm'
        DataType = ftDateTime
      end
      item
        Name = 'AtualizadoPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Loja'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RazaoSocial'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Endereco'
        DataType = ftMemo
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SerieHD'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NumMaq'
        DataType = ftWord
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 19
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Telefones'
        DataType = ftMemo
      end
      item
        Name = 'EmailReg'
        DataType = ftMemo
      end
      item
        Name = 'FormaPagto'
        DataType = ftMemo
      end
      item
        Name = 'LicMaq'
        DataType = ftWord
      end
      item
        Name = 'LicTipo'
        DataType = ftWord
      end
      item
        Name = 'LicVenc'
        DataType = ftDate
      end
      item
        Name = 'ManInicio'
        DataType = ftDate
      end
      item
        Name = 'ManVenc'
        DataType = ftDate
      end
      item
        Name = 'Proprietarios'
        DataType = ftMemo
      end
      item
        Name = 'Gerente'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TipoLoja'
        DataType = ftWord
      end
      item
        Name = 'EmailTec'
        DataType = ftMemo
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'ValorRec'
        DataType = ftCurrency
      end
      item
        Name = 'EmitirNF'
        DataType = ftBoolean
      end
      item
        Name = 'Messenger'
        DataType = ftMemo
      end
      item
        Name = 'ICQ'
        DataType = ftMemo
      end
      item
        Name = 'UVersao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UObtemLic'
        DataType = ftDateTime
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Status'
        DataType = ftInteger
      end
      item
        Name = 'ContatarEm'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    VersioningMode = mtvmAllSinceCheckPoint
    FilterOptions = []
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    CommaTextFormat = BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 24
    Top = 224
    object qMaxUltimo: TIntegerField
      FieldName = 'Ultimo'
    end
  end
end
