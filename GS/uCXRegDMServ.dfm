object dmServ: TdmServ
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 224
  Top = 238
  Height = 194
  Width = 236
  object udpServ: TkbmMWUDPIndyMessagingServerTransport
    Server = kbmServ
    SendPort = 4001
    SendIP = '255.255.255.255'
    ListenPort = 4000
    ListenIP = '0.0.0.0'
    ListenBindings = <
      item
        IP = '0.0.0.0'
        Port = 4000
      end>
    StreamFormat = 'STANDARD'
    Direction = [mwmdSubscribe, mwmdPublish]
    NodeID = 'cxreg_serv'
    InboundMessageQueue = mmqIn
    OutboundMessageQueue = mmqOut
    OnMessage = udpServMessage
    StringConversion = mwscFixed
    AutoRelay = False
    RelayOptions = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypes = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    AutoRelayAlt = False
    RelayOptionsAlt = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypesAlt = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    Left = 64
    Top = 24
  end
  object kbmServ: TkbmMWServer
    Active = False
    GatherStatistics = False
    CPUAffinityMask = 1
    GarbageCollection = True
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 60
    EarlyAuthentication = False
    Left = 136
    Top = 24
  end
  object mmqIn: TkbmMWMemoryMessageQueue
    Left = 64
    Top = 80
  end
  object mmqOut: TkbmMWMemoryMessageQueue
    Left = 136
    Top = 80
  end
  object OneOnly: TLMDOneInstance
    Mode = oiCustom
    Left = 24
    Top = 40
  end
end
