object dmServidorBD: TdmServidorBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 227
  Width = 283
  object EventLog: TnxEventLog
    Enabled = True
    FileName = 'nxServer.log'
    TruncateSize = 1024
    Left = 40
    Top = 8
  end
  object ServerEngine: TnxServerEngine
    EventLog = EventLog
    SqlEngine = nxSQLEng
    ServerName = 'Cybermgr'
    Options = [seoCloseInactiveFolders, seoCloseInactiveTables]
    Left = 40
    Top = 64
  end
  object nxSQLEng: TnxSqlEngine
    EventLog = EventLog
    ActiveDesigntime = True
    Left = 120
    Top = 64
  end
  object CommandHandler: TnxServerCommandHandler
    EventLog = EventLog
    ServerEngine = ServerEngine
    Left = 40
    Top = 120
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    EventLog = EventLog
    CommandHandler = CommandHandler
    EventLogOptions = [nxtpLogErrors]
    Mode = nxtmListen
    RespondToBroadcasts = True
    ServerNameRuntime = 'Opera'
    ServerNameDesigntime = 'Opera'
    MaxBytesPerSecond = 0
    PingTime = 0
    Port = 16100
    HeartbeatThreadPriority = tpLower
    WatchdogThreadPriority = tpNormal
    Left = 120
    Top = 8
  end
  object nxSession: TnxSession
    ServerEngine = ServerEngine
    Left = 192
    Top = 8
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\cybermgr\dados'
    Left = 120
    Top = 120
  end
end
