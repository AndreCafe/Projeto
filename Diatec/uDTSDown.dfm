object kbmDown: TkbmDown
  OldCreateOrder = False
  OnCreate = kbmMWCustomServiceCreate
  OnDestroy = kbmMWCustomServiceDestroy
  GatherStatistics = False
  Height = 409
  Width = 455
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = [sfSaveLargeFields]
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 12
    Top = 8
  end
  object qCli: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    TableName = 'CLIENTE'
    KeyFieldNames = 'ID'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
    EnableVersioning = True
    IndexName = 'qCliIndex1'
    IndexDefs = <
      item
        Name = 'qCliIndex1'
        Fields = 'ID'
        Options = [ixCaseInsensitive]
      end>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    SQL.Strings = (
      'select ID, NOME from Cliente'
      'where (id = '#39'PAIOM'#39')')
    Params = <>
    Left = 16
    Top = 64
  end
  object qOSFaseDesc: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from OS')
    Params = <>
    Left = 141
    Top = 64
  end
  object qOSFase: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from OS')
    Params = <>
    Left = 76
    Top = 128
  end
  object qOSCli: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from OS')
    Params = <>
    Left = 201
    Top = 128
  end
  object qSolicita: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from OS')
    Params = <>
    Left = 16
    Top = 192
  end
  object qFaseTec: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from OS')
    Params = <>
    Left = 141
    Top = 192
  end
  object qSolicitaDesc: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from OS')
    Params = <>
    Left = 76
    Top = 192
  end
  object qOS: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from OS')
    Params = <>
    Left = 16
    Top = 128
  end
  object qAmarra: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from OS')
    Params = <>
    Left = 201
    Top = 64
  end
  object qFase: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from OS')
    Params = <>
    Left = 141
    Top = 128
  end
  object qPar: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'psPar'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from Parametro')
    Params = <>
    Left = 201
    Top = 192
    object qParMaxDiasUpload: TWordField
      FieldName = 'MaxDiasUpload'
    end
    object qParMaxDiasDown: TWordField
      FieldName = 'MaxDiasDown'
    end
    object qParDataDown: TDateTimeField
      FieldName = 'DataDown'
    end
    object qParNomeFranquia: TStringField
      FieldName = 'NomeFranquia'
      Size = 40
    end
    object qParBitMap: TGraphicField
      FieldName = 'BitMap'
      BlobType = ftGraphic
    end
    object qParObedeceListaProj: TBooleanField
      FieldName = 'ObedeceListaProj'
    end
    object qParListaProjDefault: TStringField
      FieldName = 'ListaProjDefault'
      Size = 1
    end
    object qParRestringeDiurno: TBooleanField
      FieldName = 'RestringeDiurno'
    end
    object qParTravarTranslado: TBooleanField
      FieldName = 'TravarTranslado'
    end
    object qParCampoLocalOS: TBooleanField
      FieldName = 'CampoLocalOS'
    end
    object qParInicioDiurno: TDateTimeField
      FieldName = 'InicioDiurno'
    end
    object qParFimDiurno: TDateTimeField
      FieldName = 'FimDiurno'
    end
    object qParUploadApontamentoSemOS: TBooleanField
      FieldName = 'UploadApontamentoSemOS'
    end
    object qParPermitirRateio: TBooleanField
      FieldName = 'PermitirRateio'
    end
    object qParConflitoHoraTodosCli: TBooleanField
      FieldName = 'ConflitoHoraTodosCli'
    end
    object qParExigeAutorizadoPor: TBooleanField
      FieldName = 'ExigeAutorizadoPor'
    end
    object qParMostraReemb: TBooleanField
      FieldName = 'MostraReemb'
    end
    object qParForcaTransladoProj: TBooleanField
      FieldName = 'ForcaTransladoProj'
    end
    object qParTransladoUnicoPorCliente: TBooleanField
      FieldName = 'TransladoUnicoPorCliente'
    end
    object qParImprimeAndamentoProjeto: TBooleanField
      FieldName = 'ImprimeAndamentoProjeto'
    end
    object qParValidarEDT: TBooleanField
      FieldName = 'ValidarEDT'
    end
    object qParEstimarFaseNoApontamento: TBooleanField
      FieldName = 'EstimarFaseNoApontamento'
    end
    object qParExigirEstimativa: TBooleanField
      FieldName = 'ExigirEstimativa'
    end
    object qParVlHosp: TCurrencyField
      FieldName = 'VlHosp'
    end
    object qParVlKMCli: TCurrencyField
      FieldName = 'VlKMCli'
    end
    object qParVlKMTec: TCurrencyField
      FieldName = 'VlKMTec'
    end
    object qParVlAlim: TCurrencyField
      FieldName = 'VlAlim'
    end
    object qParMostrarRA: TBooleanField
      FieldName = 'MostrarRA'
    end
    object qParChecarVersaoProj: TBooleanField
      FieldName = 'ChecarVersaoProj'
    end
    object qParPermiteApagarOSSincronizada: TBooleanField
      FieldName = 'PermiteApagarOSSincronizada'
    end
    object qParAtivarIntervalo: TBooleanField
      FieldName = 'AtivarIntervalo'
    end
    object qParAtivarValorTrans: TBooleanField
      FieldName = 'AtivarValorTrans'
    end
    object qParPermiteCorrigirOS: TBooleanField
      FieldName = 'PermiteCorrigirOS'
    end
    object qParTodasHorasNoFeriado: TBooleanField
      FieldName = 'TodasHorasNoFeriado'
    end
  end
  object qTec: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from Tecnico')
    Params = <>
    Left = 257
    Top = 192
    object qTecID: TStringField
      FieldName = 'ID'
      Size = 6
    end
    object qTecNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object qTecSenha: TStringField
      FieldName = 'Senha'
      Size = 6
    end
    object qTecEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 3
    end
    object qTecListaProj: TStringField
      FieldName = 'ListaProj'
      Size = 1
    end
  end
  object qMotivo: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from Motivo')
    Params = <>
    Left = 80
    Top = 8
  end
  object qOcorrencia: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from Ocorrencia')
    Params = <>
    Left = 136
    Top = 8
  end
  object qTipoHora: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from TipoHora')
    Params = <>
    Left = 200
    Top = 8
  end
  object qProj: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from projeto')
    Params = <>
    Left = 72
    Top = 64
  end
  object cpDown: TkbmMWNexusDBConnectionPool
    Active = False
    Database = dbDown
    Session = nxSession
    Left = 253
    Top = 64
  end
  object seDown: TkbmMWPooledSession
    ConnectionPool = cpDown
    AutoSessionName = False
    SessionName = 'seDown'
    Left = 312
    Top = 64
  end
  object dbDown: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\diatecserv\tabelas'
    Left = 312
    Top = 8
  end
  object nxSession: TnxSession
    ServerEngine = dmBDServ.nxRSE
    Left = 256
    Top = 8
  end
  object dbPar: TnxDatabase
    Session = nxSession
    AliasPath = 'C:\Projetos\Diatec\270\Tabelas'
    Left = 256
    Top = 128
  end
  object psPar: TkbmMWPooledSession
    ConnectionPool = cpPar
    AutoSessionName = False
    SessionName = 'psPar'
    Left = 376
    Top = 192
  end
  object cpPar: TkbmMWNexusDBConnectionPool
    Database = dbPar
    Session = nxSession
    Left = 317
    Top = 192
  end
  object dbLog: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\diatecserv\tabelas\log'
    Left = 376
    Top = 8
  end
  object tLog: TnxTable
    Database = dbLog
    TableName = 'Log'
    IndexName = 'IOperTecData'
    Left = 376
    Top = 64
    object tLogID: TAutoIncField
      FieldName = 'ID'
    end
    object tLogTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tLogData: TDateTimeField
      FieldName = 'Data'
    end
    object tLogDetalhes: TMemoField
      FieldName = 'Detalhes'
      BlobType = ftMemo
    end
    object tLogOper: TWordField
      FieldName = 'Oper'
    end
    object tLogOK: TBooleanField
      FieldName = 'OK'
    end
    object tLogDuracao: TDateTimeField
      FieldName = 'Duracao'
    end
    object tLogUUpload: TIntegerField
      FieldName = 'UUpload'
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
    DefaultFormat = BSF
    PersistentFormat = BSF
    AllDataFormat = BSF
    Left = 376
    Top = 128
  end
  object qCliT: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    TableName = 'CLIENTE'
    KeyFieldNames = 'ID'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
    EnableVersioning = True
    IndexName = 'qCliIndex1'
    IndexDefs = <
      item
        Name = 'qCliIndex1'
        Fields = 'ID'
        Options = [ixCaseInsensitive]
      end>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    SQL.Strings = (
      'select * from Cliente')
    Params = <>
    Left = 312
    Top = 128
  end
  object dbUP: TnxDatabase
    Session = nxSession
    AliasPath = 'C:\Projetos\Diatec\270\Tabelas'
    Left = 88
    Top = 264
  end
  object qRA: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seUP'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from RA')
    Params = <>
    Left = 8
    Top = 320
  end
  object seUP: TkbmMWPooledSession
    ConnectionPool = cpUP
    AutoSessionName = False
    SessionName = 'seUP'
    Left = 48
    Top = 264
  end
  object cpUP: TkbmMWNexusDBConnectionPool
    Database = dbUP
    Session = nxSession
    Left = 13
    Top = 264
  end
  object qRAOS: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seUP'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from RAOS')
    Params = <>
    Left = 48
    Top = 320
  end
  object qRAItem: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seUP'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from RAItem')
    Params = <>
    Left = 88
    Top = 320
  end
  object tRAF: TnxTable
    Database = dbUP
    TableName = 'RAF'
    IndexName = 'IID'
    Left = 160
    Top = 320
    object tRAFID: TAutoIncField
      FieldName = 'ID'
    end
    object tRAFDHCriacao: TDateTimeField
      FieldName = 'DHCriacao'
    end
    object tRAFDHFechaCli: TDateTimeField
      FieldName = 'DHFechaCli'
    end
    object tRAFDHFechaTec: TDateTimeField
      FieldName = 'DHFechaTec'
    end
    object tRAFDataI: TDateTimeField
      FieldName = 'DataI'
    end
    object tRAFDataF: TDateTimeField
      FieldName = 'DataF'
    end
  end
  object tRA: TnxTable
    Database = dbUP
    TableName = 'RA'
    IndexName = 'INumFDataF'
    Left = 216
    Top = 320
    object tRASync: TBooleanField
      FieldName = 'Sync'
    end
    object tRATecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tRACliente: TStringField
      FieldName = 'Cliente'
      Size = 6
    end
    object tRADataI: TDateField
      FieldName = 'DataI'
    end
    object tRADataF: TDateField
      FieldName = 'DataF'
    end
    object tRAID: TWordField
      FieldName = 'ID'
    end
    object tRALogID: TIntegerField
      FieldName = 'LogID'
    end
    object tRANumF: TIntegerField
      FieldName = 'NumF'
    end
    object tRAStatusCli: TWordField
      FieldName = 'StatusCli'
    end
    object tRAStatusTec: TWordField
      FieldName = 'StatusTec'
    end
    object tRADHUpload: TDateTimeField
      FieldName = 'DHUpload'
    end
  end
  object tRAItem: TnxTable
    Database = dbUP
    TableName = 'RAItem'
    IndexName = 'IRA'
    Left = 280
    Top = 320
    object tRAItemSync: TBooleanField
      FieldName = 'Sync'
    end
    object tRAItemTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tRAItemCliente: TStringField
      FieldName = 'Cliente'
      Size = 6
    end
    object tRAItemData: TDateField
      FieldName = 'Data'
    end
    object tRAItemID: TWordField
      FieldName = 'ID'
    end
    object tRAItemIDRA: TWordField
      FieldName = 'IDRA'
    end
    object tRAItemTipo: TWordField
      FieldName = 'Tipo'
    end
    object tRAItemValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tRAItemJustDiverg: TMemoField
      FieldName = 'JustDiverg'
      BlobType = ftMemo
    end
    object tRAItemDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object tRAItemNumF: TIntegerField
      FieldName = 'NumF'
    end
    object tRAItemValorDef: TCurrencyField
      FieldName = 'ValorDef'
    end
    object tRAItemValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object tRAItemValorTec: TCurrencyField
      FieldName = 'ValorTec'
    end
    object tRAItemStatusTec: TWordField
      FieldName = 'StatusTec'
    end
    object tRAItemLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tRAItemStatusCli: TWordField
      FieldName = 'StatusCli'
    end
    object tRAItemONServ: TBooleanField
      FieldName = 'ONServ'
    end
    object tRAItemExcluirServ: TBooleanField
      FieldName = 'ExcluirServ'
    end
  end
  object tRAOS: TnxTable
    Database = dbUP
    TableName = 'RAOS'
    IndexName = 'IRA'
    Left = 336
    Top = 320
    object tRAOSSync: TBooleanField
      FieldName = 'Sync'
    end
    object tRAOSTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tRAOSCliente: TStringField
      FieldName = 'Cliente'
      Size = 6
    end
    object tRAOSDataOS: TDateTimeField
      FieldName = 'DataOS'
    end
    object tRAOSIDOS: TWordField
      FieldName = 'IDOS'
    end
    object tRAOSLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tRAOSHoras: TTimeField
      FieldName = 'Horas'
    end
    object tRAOSIDRA: TWordField
      FieldName = 'IDRA'
    end
    object tRAOSNumF: TWordField
      FieldName = 'NumF'
    end
  end
  object tUOS: TnxTable
    Database = dbUP
    TableName = 'UOS'
    IndexName = 'IID'
    Left = 160
    Top = 264
  end
  object tUOSFase: TnxTable
    Database = dbUP
    TableName = 'UOSFase'
    IndexName = 'IProjFase'
    Left = 216
    Top = 264
  end
  object tUOSFaseDesc: TnxTable
    Database = dbUP
    TableName = 'UOSFaseDesc'
    IndexName = 'IChave'
    Left = 288
    Top = 264
  end
  object qFer: TkbmMWNexusDBQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'seDown'
    TableName = 'CLIENTE'
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = False
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
      'select * from Feriado')
    Params = <>
    Left = 368
    Top = 256
  end
end
