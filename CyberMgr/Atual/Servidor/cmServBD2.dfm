object dmServBD: TdmServBD
  OldCreateOrder = False
  Height = 0
  Width = 0
  object nxServer: TnxServerEngine
    SqlEngine = nxSql
    ServerName = 'Cyber Manager'
    Options = [seoCloseInactiveFolders, seoCloseInactiveTables]
    Left = 40
    Top = 32
  end
  object nxSCH: TnxServerCommandHandler
    ServerEngine = nxServer
    Left = 104
    Top = 32
  end
  object nxSql: TnxSqlEngine
    Left = 104
    Top = 96
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    CommandHandler = nxSCH
    Mode = nxtmListen
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 40
    Top = 96
  end
  object nx1xAllEngines1: Tnx1xAllEngines
    Left = 176
    Top = 32
  end
end
