object dmServidorBD: TdmServidorBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 333
  Width = 494
  object EventLog: TnxEventLog
    Enabled = True
    NumRotations = 0
    RotationSize = 32
    FileName = 'nxServer.log'
    MaxSize = 0
    Left = 40
    Top = 22
  end
  object ServerEngine: TnxServerEngine
    EventLog = EventLog
    SqlEngine = nxSQLEng
    ServerName = 'NexCafe'
    Options = [seoCloseInactiveFolders, seoCloseInactiveTables]
    TableExtension = 'nx1'
    Left = 40
    Top = 78
  end
  object nxSQLEng: TnxSqlEngine
    EventLog = EventLog
    ActiveDesigntime = True
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    Left = 120
    Top = 78
  end
  object CommandHandler: TnxServerCommandHandler
    EventLog = EventLog
    ServerEngine = ServerEngine
    Left = 40
    Top = 134
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
    Port = 16301
    HeartbeatThreadPriority = tpLower
    WatchdogThreadPriority = tpNormal
    Left = 120
    Top = 22
  end
  object nxSimpleMon: TnxSimpleMonitor
    ServerEngine = ServerEngine
    AttachTo = [natCursor]
    Left = 200
    Top = 73
  end
  object nxSe: TnxSession
    ServerEngine = ServerEngine
    Left = 120
    Top = 136
  end
  object nxDB: TnxDatabase
    Session = nxSe
    AliasPath = 'c:\meus programas\nexreg_copia\dados'
    Left = 200
    Top = 136
  end
end
