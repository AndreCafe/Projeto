object dmCli: TdmCli
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 247
  Top = 178
  Height = 119
  Width = 302
  object mmqIn: TkbmMWMemoryMessageQueue
    Left = 80
    Top = 16
  end
  object mmqOut: TkbmMWMemoryMessageQueue
    Left = 136
    Top = 16
  end
  object udpCli: TkbmMWUDPIndyMessagingClientTransport
    ListenBindings = <
      item
        IP = '0.0.0.0'
        Port = 4001
      end>
    SendPort = 4000
    SendIP = '255.255.255.255'
    ListenPort = 4001
    ListenIP = '0.0.0.0'
    StreamFormat = 'STANDARD'
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    Direction = [mwmdSubscribe, mwmdPublish]
    InboundMessageQueue = mmqIn
    OutboundMessageQueue = mmqOut
    Subscriptions.Strings = (
      'MSG.SERVER.>')
    Active = False
    OnMessage = udpCliMessage
    StringConversion = mwscFixed
    Left = 24
    Top = 16
  end
  object Starter: TLMDStarter
    AutoStart = True
    Left = 192
    Top = 16
  end
end
