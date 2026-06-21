object DM: TDM
  OldCreateOrder = False
  Height = 407
  Width = 429
  object Q: TnxQuery
    Database = dbUp
    SQL.Strings = (
      
        'SELECT  Cliente as ID, Tipo, Sum(ValorTec) as Valor FROM "RAItem' +
        '"'
      'group by ID, Tipo')
    Left = 248
    Top = 14
    object QID: TStringField
      FieldName = 'ID'
      Size = 8
    end
    object QTipo: TWordField
      FieldName = 'Tipo'
    end
    object QValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object tOSFaseDesc: TnxTable
    Database = dbUp
    FilterTimeout = 5000
    TableName = 'UOSFaseDesc'
    IndexName = 'ILogID'
    MasterFields = 'ID'
    MasterSource = dsLog
    Left = 216
    Top = 80
  end
  object tOSFase: TnxTable
    Database = dbUp
    FilterTimeout = 5000
    TableName = 'UOSFase'
    IndexName = 'ILogID'
    MasterFields = 'ID'
    MasterSource = dsLog
    Left = 160
    Top = 80
  end
  object dsOSFase: TDataSource
    DataSet = tOSFase
    Left = 160
    Top = 136
  end
  object dsOSFaseDesc: TDataSource
    DataSet = tOSFaseDesc
    Left = 208
    Top = 136
  end
  object dsOS: TDataSource
    DataSet = tOS
    Left = 120
    Top = 136
  end
  object tOS: TnxTable
    Database = dbUp
    FilterTimeout = 5000
    TableName = 'UOS'
    IndexName = 'ILogID'
    MasterFields = 'ID'
    MasterSource = dsLog
    Left = 120
    Top = 80
  end
  object Tab: TnxTable
    Database = dbPar
    FilterTimeout = 5000
    TableName = 'Parametro'
    IndexName = 'Sequential Access Index'
    Left = 72
    Top = 80
    object TabMaxDiasUpload: TWordField
      FieldName = 'MaxDiasUpload'
    end
    object TabMaxDiasDown: TWordField
      FieldName = 'MaxDiasDown'
    end
    object TabDataDown: TDateTimeField
      FieldName = 'DataDown'
    end
    object TabNomeFranquia: TStringField
      FieldName = 'NomeFranquia'
      Size = 40
    end
    object TabBitMap: TGraphicField
      FieldName = 'BitMap'
      BlobType = ftGraphic
    end
    object TabObedeceListaProj: TBooleanField
      FieldName = 'ObedeceListaProj'
    end
    object TabListaProjDefault: TStringField
      FieldName = 'ListaProjDefault'
      Size = 1
    end
    object TabRestringeDiurno: TBooleanField
      FieldName = 'RestringeDiurno'
    end
    object TabTravarTranslado: TBooleanField
      FieldName = 'TravarTranslado'
    end
    object TabCampoLocalOS: TBooleanField
      FieldName = 'CampoLocalOS'
    end
    object TabInicioDiurno: TDateTimeField
      FieldName = 'InicioDiurno'
      DisplayFormat = 'hh:mm'
    end
    object TabFimDiurno: TDateTimeField
      DisplayLabel = 'InicioDiurno'
      FieldName = 'FimDiurno'
      DisplayFormat = 'hh:mm'
    end
    object TabUploadApontamentoSemOS: TBooleanField
      FieldName = 'UploadApontamentoSemOS'
    end
    object TabPermitirRateio: TBooleanField
      FieldName = 'PermitirRateio'
    end
    object TabConflitoHoraTodosCli: TBooleanField
      FieldName = 'ConflitoHoraTodosCli'
    end
    object TabExigeAutorizadoPor: TBooleanField
      FieldName = 'ExigeAutorizadoPor'
    end
    object TabMostraReemb: TBooleanField
      FieldName = 'MostraReemb'
    end
    object TabForcaTransladoProj: TBooleanField
      FieldName = 'ForcaTransladoProj'
    end
    object TabTransladoUnicoPorCliente: TBooleanField
      FieldName = 'TransladoUnicoPorCliente'
    end
    object TabImprimeAndamentoProjeto: TBooleanField
      FieldName = 'ImprimeAndamentoProjeto'
    end
    object TabValidarEDT: TBooleanField
      FieldName = 'ValidarEDT'
    end
    object TabEstimarFaseNoApontamento: TBooleanField
      FieldName = 'EstimarFaseNoApontamento'
    end
    object TabExigirEstimativa: TBooleanField
      FieldName = 'ExigirEstimativa'
    end
    object TabVlHosp: TCurrencyField
      FieldName = 'VlHosp'
    end
    object TabVlKMCli: TCurrencyField
      FieldName = 'VlKMCli'
    end
    object TabVlKMTec: TCurrencyField
      FieldName = 'VlKMTec'
    end
    object TabVlAlim: TCurrencyField
      FieldName = 'VlAlim'
    end
    object TabMostrarRA: TBooleanField
      FieldName = 'MostrarRA'
    end
    object TabChecarVersaoProj: TBooleanField
      FieldName = 'ChecarVersaoProj'
    end
    object TabPermiteApagarOSSincronizada: TBooleanField
      FieldName = 'PermiteApagarOSSincronizada'
    end
    object TabAtivarIntervalo: TBooleanField
      FieldName = 'AtivarIntervalo'
    end
  end
  object DS: TDataSource
    DataSet = Tab
    Left = 72
    Top = 136
  end
  object dsLog: TDataSource
    DataSet = tLog
    Left = 16
    Top = 136
  end
  object tLog: TnxTable
    Database = dbLog
    FilterOptions = [foCaseInsensitive]
    FilterTimeout = 5000
    BeforePost = tLogBeforePost
    TableName = 'Log'
    IndexName = 'IData'
    Left = 16
    Top = 80
    object tLogID: TAutoIncField
      FieldName = 'ID'
    end
    object tLogTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tLogData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss:zzz'
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
      DisplayFormat = 'hh:mm:ss:zzz'
    end
    object tLogUUpload: TIntegerField
      FieldName = 'UUpload'
    end
  end
  object dbLog: TnxDatabase
    Session = nxSession
    AliasName = 'diatec250proj'
    Left = 200
    Top = 16
  end
  object dbPar: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasPath = 'c:\meus programas\diatec'
    Left = 160
    Top = 16
  end
  object dbUp: TnxDatabase
    Session = nxSession
    AliasName = 'diatecproj270'
    Left = 120
    Top = 16
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    Timeout = 120000
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 72
    Top = 16
  end
  object nxSession: TnxSession
    ActiveDesigntime = True
    Timeout = 240000
    ServerEngine = nxRSE
    Left = 16
    Top = 16
  end
  object kbmCli: TkbmMWSimpleClient
    Transport = mwTCPIP
    Left = 72
    Top = 200
  end
  object mwTCPIP: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = '127.0.0.1'
    StreamFormat = 'ZIPPED'
    VerifyTransfer = False
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    StringConversion = mwscFixed
    Left = 16
    Top = 200
  end
  object mtCli: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Translado'
        DataType = ftDateTime
      end
      item
        Name = 'Assinou'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Noturno'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FimSem'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Abono'
        DataType = ftDateTime
      end
      item
        Name = 'MotAbono'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'KM'
        DataType = ftInteger
      end
      item
        Name = 'VlPedag'
        DataType = ftCurrency
      end
      item
        Name = 'PgAlim'
        DataType = ftBoolean
      end
      item
        Name = 'PgHosp'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'ID'
    IndexName = 'IID'
    IndexDefs = <
      item
        Name = 'IID'
        Fields = 'ID'
        Options = [ixPrimary, ixCaseInsensitive]
      end>
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
    Left = 120
    Top = 200
    object mtCliID: TStringField
      FieldName = 'ID'
      Size = 8
    end
    object mtCliNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object mtCliTranslado: TDateTimeField
      FieldName = 'Translado'
    end
    object mtCliAssinou: TStringField
      FieldName = 'Assinou'
      Size = 30
    end
    object mtCliNoturno: TStringField
      FieldName = 'Noturno'
      Size = 1
    end
    object mtCliFimSem: TStringField
      FieldName = 'FimSem'
      Size = 1
    end
    object mtCliAbono: TDateTimeField
      FieldName = 'Abono'
    end
    object mtCliMotAbono: TStringField
      FieldName = 'MotAbono'
      Size = 2
    end
    object mtCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object mtCliKM: TIntegerField
      FieldName = 'KM'
    end
    object mtCliVlPedag: TCurrencyField
      FieldName = 'VlPedag'
    end
    object mtCliPgAlim: TBooleanField
      FieldName = 'PgAlim'
    end
    object mtCliPgHosp: TBooleanField
      FieldName = 'PgHosp'
    end
    object mtCliValorKM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorKM'
      Calculated = True
    end
  end
  object mtTec: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Empresa'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ListaProj'
        DataType = ftString
        Size = 1
      end>
    IndexFieldNames = 'ID'
    IndexName = 'IID'
    IndexDefs = <
      item
        Name = 'IID'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique, ixCaseInsensitive]
      end>
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
    Left = 168
    Top = 200
    object mtTecNome: TStringField
      DisplayWidth = 30
      FieldName = 'Nome'
      Size = 30
    end
    object mtTecSenha: TStringField
      FieldName = 'Senha'
      Visible = False
      Size = 6
    end
    object mtTecID: TStringField
      FieldName = 'ID'
      Size = 6
    end
    object mtTecEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 3
    end
    object mtTecListaProj: TStringField
      FieldName = 'ListaProj'
      Size = 1
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
    AllDataFormat = BSF
    Left = 216
    Top = 200
  end
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 320
    Top = 200
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCPIP
    Left = 296
    Top = 16
  end
  object tRAF: TnxTable
    Database = dbUp
    FilterOptions = [foCaseInsensitive]
    TableName = 'RAF'
    IndexName = 'IID'
    Left = 32
    Top = 280
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
  object tRAItem: TnxTable
    Database = dbUp
    OnCalcFields = tRAItemCalcFields
    TableName = 'RAItem'
    IndexName = 'INumFStatusCli'
    Left = 80
    Top = 280
    object tRAItemSync: TBooleanField
      FieldName = 'Sync'
    end
    object tRAItemTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tRAItemCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
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
    object tRAItemChave: TStringField
      FieldKind = fkCalculated
      FieldName = 'Chave'
      Size = 35
      Calculated = True
    end
    object tRAItemNomeCli: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCli'
      LookupDataSet = mtCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 40
      Lookup = True
    end
    object tRAItemNomeTec: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTec'
      LookupDataSet = mtTec
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Tecnico'
      Size = 40
      Lookup = True
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
    object tRAItemONServ: TBooleanField
      FieldName = 'ONServ'
    end
    object tRAItemExcluirServ: TBooleanField
      FieldName = 'ExcluirServ'
    end
  end
  object tRAOS: TnxTable
    Database = dbUp
    TableName = 'RAOS'
    IndexName = 'IRA'
    MasterFields = 'Tecnico;Cliente;IDRA'
    MasterSource = dsRAItem
    Left = 136
    Top = 280
    object tRAOSSync: TBooleanField
      FieldName = 'Sync'
    end
    object tRAOSTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tRAOSCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tRAOSDataOS: TDateTimeField
      FieldName = 'DataOS'
    end
    object tRAOSIDOS: TIntegerField
      FieldName = 'IDOS'
    end
    object tRAOSLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tRAOSNumF: TIntegerField
      FieldName = 'NumF'
    end
    object tRAOSHoras: TTimeField
      FieldName = 'Horas'
    end
    object tRAOSIDRA: TWordField
      FieldName = 'IDRA'
    end
  end
  object dsRAF: TDataSource
    DataSet = tRAF
    Left = 32
    Top = 336
  end
  object dsRAItem: TDataSource
    DataSet = tRAItem
    Left = 80
    Top = 336
  end
  object dsRAOS: TDataSource
    DataSet = tRAOS
    Left = 136
    Top = 336
  end
  object tExp: TDbf
    FilePath = 'c:\'
    IndexDefs = <>
    OpenMode = omAutoCreate
    TableLevel = 4
    Left = 320
    Top = 256
    object tExpCodigo: TStringField
      FieldName = 'Codigo'
      Size = 6
    end
    object tExpValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tExpIDCons: TStringField
      FieldName = 'IDCons'
      Size = 5
    end
  end
  object tAuxRAOS: TnxTable
    Database = dbUp
    TableName = 'RAOS'
    IndexName = 'IOS'
    Left = 200
    Top = 280
    object tAuxRAOSSync: TBooleanField
      FieldName = 'Sync'
    end
    object tAuxRAOSTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object tAuxRAOSCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object tAuxRAOSDataOS: TDateTimeField
      FieldName = 'DataOS'
    end
    object tAuxRAOSIDOS: TWordField
      FieldName = 'IDOS'
    end
    object tAuxRAOSLogID: TIntegerField
      FieldName = 'LogID'
    end
    object tAuxRAOSNumF: TWordField
      FieldName = 'NumF'
    end
    object tAuxRAOSHoras: TTimeField
      FieldName = 'Horas'
    end
    object tAuxRAOSIDRA: TWordField
      FieldName = 'IDRA'
    end
  end
end
