object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 118
  Top = 226
  Height = 315
  Width = 356
  object mwNXDBCP: TkbmMWNexusDBConnectionPool
    MetaData = mwNXMD
    Database = nxDB
    Session = nxSession
    Left = 94
    Top = 80
  end
  object mwPS: TkbmMWPooledSession
    ConnectionPool = mwNXDBCP
    AutoSessionName = False
    SessionName = 'mwPS'
    Left = 22
    Top = 80
  end
  object mwNXMD: TkbmMWNexusDBMetaData
    FieldNameQuote = '"'
    FieldNameCase = kbmmwncUnaltered
    TableNameQuote = '"'
    TableNameCase = kbmmwncUnaltered
    QuoteAllFieldNames = False
    QuoteTableName = True
    StringQuote = '"'
    QuoteStringQuote = '"'
    DateLayout = 'yyyy-mm-dd'
    TimeLayout = 'hh:mm:ss.zzz'
    DateTimeLayout = 'yyyy-mm-dd hh:mm:ss.zzz'
    TrueValue = 'TRUE'
    FalseValue = 'FALSE'
    PrependTableName = False
    Left = 160
    Top = 80
  end
  object nxSession: TnxSession
    ActiveRuntime = True
    ActiveDesigntime = True
    ServerEngine = nxRSE
    Left = 24
    Top = 16
  end
  object nxDB: TnxDatabase
    ActiveRuntime = True
    ActiveDesigntime = True
    Session = nxSession
    AliasName = 'Registro'
    Left = 96
    Top = 16
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCPIP
    Left = 160
    Top = 16
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveRuntime = True
    ActiveDesigntime = True
    ServerNameRuntime = '200.215.37.27'
    ServerNameDesigntime = '200.215.37.27'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 224
    Top = 16
  end
  object mwServ: TkbmMWServer
    Active = False
    OnAuthenticate = mwServAuthenticate
    GatherStatistics = False
    CPUAffinityMask = 1
    GarbageCollection = True
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 30
    EarlyAuthentication = True
    Left = 224
    Top = 80
  end
  object mwTCPIP: TkbmMWTCPIPIndyServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3005
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    TransportStateOptions = []
    OnDisconnect = mwTCPIPDisconnect
    StringConversion = mwscFixed
    Left = 280
    Top = 16
  end
  object qSeq: TnxQuery
    Database = nxDB
    Left = 24
    Top = 144
  end
  object mtConn: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Loja'
        DataType = ftInteger
      end
      item
        Name = 'ThreadID'
        DataType = ftInteger
      end>
    IndexFieldNames = 'ThreadID'
    IndexName = 'IThread'
    IndexDefs = <
      item
        Name = 'ILoja'
        Fields = 'Loja'
      end
      item
        Name = 'IThread'
        Fields = 'ThreadID'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 96
    Top = 144
    object mtConnLoja: TIntegerField
      FieldName = 'Loja'
    end
    object mtConnThreadID: TIntegerField
      FieldName = 'ThreadID'
    end
    object mtConnURefresh: TLargeintField
      FieldName = 'URefresh'
    end
    object mtConnMacAddress: TStringField
      FieldName = 'MacAddress'
      Size = 30
    end
    object mtConnLocalIP: TStringField
      FieldName = 'LocalIP'
    end
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 160
    Top = 144
    object tCliCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCliTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCliLoja: TStringField
      FieldName = 'Loja'
      Size = 50
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
    object tCliSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
  end
  object mtLoja: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftInteger
      end>
    IndexFieldNames = 'Codigo'
    IndexName = 'ICodigo'
    IndexDefs = <
      item
        Name = 'ICodigo'
        Fields = 'Codigo'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 224
    Top = 144
    object mtLojaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object mtLojaQuant: TIntegerField
      FieldName = 'Quant'
    end
  end
  object TimerRefresh: TTimer
    Interval = 30000
    OnTimer = TimerRefreshTimer
    Left = 280
    Top = 144
  end
  object mySQLDB: TmySQLDatabase
    DatabaseName = 'dbradius'
    UserName = 'cybermgr'
    UserPassword = '0o9i8u7y6t'
    Host = 'mysql.cbroom.com.br'
    ConnectOptions = []
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30'
      'PWD=0o9i8u7y6t'
      'UID=cybermgr'
      'Host=mysql.cbroom.com.br'
      'DatabaseName=dbradius')
    Left = 96
    Top = 200
  end
  object qMySql: TmySQLQuery
    Database = mySQLDB
    SQL.Strings = (
      '')
    Left = 160
    Top = 200
  end
  object tSessao: TnxTable
    Database = nxDB
    TableName = 'SessaoCyberroom'
    IndexName = 'IThreadIDStop'
    Left = 224
    Top = 200
  end
end
