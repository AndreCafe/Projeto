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
    Options = []
    TableExtension = 'nx1'
    Left = 40
    Top = 78
  end
  object nxSQLEng: TnxSqlEngine
    EventLog = EventLog
    ActiveDesigntime = True
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    UseFieldCache = False
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
    Port = 16300
    HeartbeatThreadPriority = tpLower
    WatchdogThreadPriority = tpNormal
    Left = 120
    Top = 22
  end
  object nxSimpleMon: TnxSimpleMonitor
    ServerEngine = ServerEngine
    AttachTo = [natCursor]
    OnRecordInsert = nxSimpleMonRecordInsert
    OnRecordModify = nxSimpleMonRecordModify
    Left = 232
    Top = 81
  end
  object nxSe: TnxSession
    ServerEngine = ServerEngine
    Left = 40
    Top = 216
  end
  object nxDB: TnxDatabase
    Session = nxSe
    AliasName = 'Registro'
    Left = 168
    Top = 208
  end
  object T: TnxTable
    Database = nxDB
    Left = 272
    Top = 200
  end
  object Timer1: TTimer
    Interval = 120000
    OnTimer = Timer1Timer
    Left = 376
    Top = 80
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    Left = 384
    Top = 184
  end
  object nxShMem: TnxSharedMemoryTransport
    DisplayCategory = 'Transports'
    EventLog = EventLog
    CommandHandler = CommandHandler
    EventLogOptions = [nxtpLogErrors]
    Mode = nxtmListen
    ServerNameRuntime = 'registro'
    ServerNameDesigntime = 'registro'
    Port = 16300
    Left = 120
    Top = 136
  end
end
