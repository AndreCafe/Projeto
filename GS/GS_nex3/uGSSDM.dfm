object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 288
  Top = 255
  Height = 190
  Width = 391
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
    SessionName = 'WIZARDSESSION'
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
    ServerEngine = nxRSE
    Left = 24
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'GS'
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
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 224
    Top = 16
  end
  object mwServ: TkbmMWServer
    Active = False
    GatherStatistics = False
    CPUAffinityMask = 1
    GarbageCollection = True
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 60
    EarlyAuthentication = False
    Left = 224
    Top = 80
  end
  object TCPIP: TkbmMWTCPIPIndyServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3000
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    Left = 280
    Top = 16
  end
end
