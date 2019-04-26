object dmMWServer: TdmMWServer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 374
  Width = 445
  object mqOutz: TkbmMWMemoryMessageQueue
    Left = 136
    Top = 186
  end
  object mqInz: TkbmMWMemoryMessageQueue
    Left = 88
    Top = 186
  end
  object mwTCPIPz: TkbmMWTCPIPIndyMessagingServerTransport
    Server = mwServ
    Bindings = <
      item
        Port = 16202
      end>
    StreamFormat = 'ZIPPED'
    VerifyTransfer = False
    OnDisconnect = mwTCPIPzDisconnect
    StringConversion = mwscFixed
    Direction = [mwmdSubscribe, mwmdPublish]
    Subscriptions.Strings = (
      'REQ.>'
      'SUB.>')
    InboundMessageQueue = mqInz
    OutboundMessageQueue = mqOutz
    AutoRelay = False
    RelayOptions = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypes = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    AutoRelayAlt = False
    RelayOptionsAlt = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypesAlt = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    PoolSize = 3
    Left = 64
    Top = 120
  end
  object mwServ: TkbmMWServer
    Active = False
    CPUAffinityMask = 3
    GarbageCollection = False
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 20
    EarlyAuthentication = False
    Left = 64
    Top = 64
  end
  object mwNexusMD: TkbmMWNexusDBMetaData
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
    Left = 136
    Top = 72
  end
  object mwFilePool: TkbmMWFilePool
    MaxAge = 60
    GarbageInterval = 15
    GarbageCollection = False
    AutoCreateDirectories = False
    Left = 136
    Top = 128
  end
  object TimerLic: TTimer
    Interval = 30000
    OnTimer = TimerLicTimer
    Left = 240
    Top = 96
  end
  object TimerH: TTimer
    Interval = 60000
    OnTimer = TimerHTimer
    Left = 232
    Top = 168
  end
  object mwTCPIPs: TkbmMWTCPIPIndyMessagingServerTransport
    Server = mwServ
    Bindings = <
      item
        Port = 16202
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    OnDisconnect = mwTCPIPzDisconnect
    StringConversion = mwscFixed
    Direction = [mwmdSubscribe, mwmdPublish]
    Subscriptions.Strings = (
      'REQ.>'
      'SUB.>')
    InboundMessageQueue = mqIns
    OutboundMessageQueue = mqOuts
    AutoRelay = False
    RelayOptions = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypes = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    AutoRelayAlt = False
    RelayOptionsAlt = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypesAlt = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    PoolSize = 3
    Left = 296
    Top = 224
  end
  object mqOuts: TkbmMWMemoryMessageQueue
    Left = 128
    Top = 298
  end
  object mqIns: TkbmMWMemoryMessageQueue
    Left = 80
    Top = 298
  end
  object kbmMWMTConnectionPool1: TkbmMWMTConnectionPool
    Left = 232
    Top = 312
  end
end
