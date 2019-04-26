object dmServidorBD: TdmServidorBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 325
  Width = 510
  object EventLog: TnxEventLog
    Enabled = True
    FileName = 'nxServer.log'
    MaxSize = 0
    TruncateSize = 1024
    Left = 40
    Top = 22
  end
  object ServerEngine: TnxServerEngine
    EventLog = EventLog
    EventLogEnabled = True
    SqlEngine = nxSQLEng
    ServerName = 'NexCafe'
    Options = [seoCloseInactiveFolders, seoCloseInactiveTables, seoIsSecure]
    Left = 40
    Top = 78
  end
  object nxSQLEng: TnxSqlEngine
    EventLog = EventLog
    ActiveDesigntime = True
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
    EventLogOptions = [nxtpLogErrors, nxtpLogRequests, nxtpLogReplies]
    Mode = nxtmListen
    OnRemoveSession = nxTCPIPRemoveSession
    RespondToBroadcasts = True
    ServerNameRuntime = 'NexCafe'
    ServerNameDesigntime = 'NexCafe'
    MaxBytesPerSecond = 0
    PingTime = 0
    Port = 16200
    HeartbeatThreadPriority = tpLower
    HeartbeatInterval = 3000
    WatchdogThreadPriority = tpNormal
    WatchdogInterval = 15000
    Left = 120
    Top = 22
  end
  object nxSimpleMon: TnxSimpleMonitor
    ServerEngine = ServerEngine
    AttachTo = [natCursor]
    OnRecordInsert = nxSimpleMonRecordInsert
    OnRecordModify = nxSimpleMonRecordModify
    OnRecordDelete = nxSimpleMonRecordDelete
    Left = 184
    Top = 25
  end
  object SecMon: TnxSecurityMonitor
    EventLog = EventLog
    ServerEngine = ServerEngine
    Left = 120
    Top = 136
  end
  object NexPlugin: TncnxServerPlugin
    DisplayCategory = 'Plugins'
    EventLog = EventLog
    EventLogEnabled = True
    Left = 304
    Top = 72
  end
  object NexCmdHandler: TncnxCmdHandler
    EventLog = EventLog
    EventLogEnabled = True
    CommandHandler = CommandHandler
    PluginEngine = NexPlugin
    Left = 304
    Top = 128
  end
end
