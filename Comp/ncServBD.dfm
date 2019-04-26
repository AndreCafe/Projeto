object dmServidorBD: TdmServidorBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 293
  Width = 569
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
    EventLogEnabled = True
    SqlEngine = nxSQLEng
    ServerName = 'NexCafe'
    Options = [seoCloseInactiveFolders, seoCloseInactiveTables, seoIsSecure]
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
    EventLogEnabled = True
    CommandHandler = CommandHandler
    EventLogOptions = [nxtpLogErrors]
    Mode = nxtmListen
    OnRemoveSession = nxTCPIPRemoveSession
    RespondToBroadcasts = True
    ServerNameRuntime = 'NexCafe'
    ServerNameDesigntime = 'NexCafe'
    KeepStats = False
    Port = 16200
    HeartbeatThreadPriority = tpLower
    HeartbeatInterval = 3000
    WatchdogThreadPriority = tpNormal
    WatchdogInterval = 15000
    LostConnectionTimeout = 20000
    ConnectionFilter = FiltroTCPIP
    Left = 120
    Top = 22
  end
  object nxSimpleMon: TnxSimpleMonitor
    ServerEngine = ServerEngine
    AttachTo = [natDatabase, natCursor]
    OnRecordInsert = nxSimpleMonRecordInsert
    OnRecordModify = nxSimpleMonRecordModify
    OnRecordDelete = nxSimpleMonRecordDelete
    Left = 200
    Top = 25
  end
  object SecMon: TnxSecurityMonitor
    EventLog = EventLog
    ServerEngine = ServerEngine
    MaxSessionCount = -1
    AlwaysLoginAdmins = False
    Left = 120
    Top = 136
  end
  object FiltroTCPIP: TnxCustomConnectionFilter
    ActiveRuntime = True
    OnAcceptConnection = FiltroTCPIPAcceptConnection
    Left = 216
    Top = 152
  end
  object sessao: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = ServerEngine
    Left = 120
    Top = 216
  end
end
