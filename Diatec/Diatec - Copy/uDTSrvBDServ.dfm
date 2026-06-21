object dmBDServ: TdmBDServ
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 149
  Width = 194
  object kbmServ: TkbmMWServer
    Active = False
    CPUAffinityMask = 1
    GarbageCollection = False
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 60
    EarlyAuthentication = False
    Left = 128
    Top = 16
  end
  object Timer1: TTimer
    Interval = 120000
    OnTimer = Timer1Timer
    Left = 24
    Top = 64
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    Timeout = 10000
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    HeartbeatThreadPriority = tpLowest
    HeartbeatInterval = 300000
    WatchdogThreadPriority = tpLowest
    WatchdogInterval = 60000
    Left = 24
    Top = 16
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCPIP
    Left = 72
    Top = 16
  end
  object mwTCPIP: TkbmMWTCPIPIndyServerTransport
    Server = kbmServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3000
      end>
    StreamFormat = 'ZIPPED'
    VerifyTransfer = False
    TransportStateOptions = []
    OnConnect = mwTCPIPConnect
    OnDisconnect = mwTCPIPDisconnect
    StringConversion = mwscFixed
    Left = 128
    Top = 64
  end
  object mwHTTP: TkbmMWTCPIPIndyServerTransport
    Server = kbmServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 8000
      end>
    StreamFormat = 'HTTP'
    VerifyTransfer = False
    TransportStateOptions = []
    StringConversion = mwscFixed
    Left = 72
    Top = 67
  end
end
