object dmKBMserv: TdmKBMserv
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 199
  Width = 231
  object mwServ: TkbmMWServer
    Active = False
    CPUAffinityMask = 1
    GarbageCollection = True
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 60
    EarlyAuthentication = False
    Left = 56
    Top = 32
  end
  object mwTCPIP: TkbmMWTCPIPIndyMessagingServerTransport
    Server = mwServ
    Bindings = <
      item
        Port = 41592
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    StringConversion = mwscFixed
    Direction = [mwmdSubscribe, mwmdPublish]
    Subscriptions.Strings = (
      'REQ.>'
      'SUB.>'
      'MSG.>')
    NodeID = 'nxcserver'
    ClusterID = 'nxcafe'
    InboundMessageQueue = mmqIn
    OutboundMessageQueue = mmqOut
    AutoRelay = True
    RelayOptions = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypes = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    AutoRelayAlt = False
    RelayOptionsAlt = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypesAlt = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    Left = 104
    Top = 32
  end
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 152
    Top = 32
  end
  object mmqIn: TkbmMWMemoryMessageQueue
    Left = 56
    Top = 112
  end
  object mmqOut: TkbmMWMemoryMessageQueue
    Left = 104
    Top = 112
  end
  object FilePool: TkbmMWFilePool
    MaxAge = 60
    GarbageInterval = 15
    GarbageCollection = True
    AutoCreateDirectories = False
    Left = 152
    Top = 112
  end
end
