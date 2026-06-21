object dmServidorBD: TdmServidorBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 285
  Top = 161
  Height = 479
  Width = 741
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
    ServerName = 'Opera'
    Options = [seoCloseInactiveTables]
    Left = 40
    Top = 64
  end
  object nxSQLEng: TnxSqlEngine
    EventLog = EventLog
    Left = 120
    Top = 120
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
    Left = 120
    Top = 8
  end
end
