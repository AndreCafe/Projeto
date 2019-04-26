object dmServidorBD: TdmServidorBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 364
  Width = 541
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
    Left = 184
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
  object FiltroTCPIP: TnxCustomConnectionFilter
    ActiveRuntime = True
    OnAcceptConnection = FiltroTCPIPAcceptConnection
    Left = 224
    Top = 152
  end
  object HS: TRtcHttpServer
    ServerPort = '16201'
    Left = 232
    Top = 240
  end
  object dpAjustarConta: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpAjustarContaCheckRequest
    OnDataReceived = dpAjustarContaDataReceived
    Left = 304
    Top = 240
  end
  object dpAtivar: TRtcDataProvider
    Server = HS
    OnCheckRequest = dpAtivarCheckRequest
    OnDataReceived = dpAtivarDataReceived
    Left = 408
    Top = 240
  end
end
