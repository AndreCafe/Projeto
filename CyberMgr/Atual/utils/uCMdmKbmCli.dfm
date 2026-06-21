object dmKBMCli: TdmKBMCli
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 209
  Width = 247
  object mwCli: TkbmMWFileClient
    Transport = Transp
    FileService = 'servidor_arquivos'
    FileServiceVersion = 'kbmMW_1.0'
    BlockSize = 8192
    AllowOverwrite = True
    KeepPartialFileOnCancel = False
    KeepPartialFileOnException = False
    OnProgress = mwCliProgress
    Left = 24
    Top = 24
  end
  object Transp: TkbmMWTCPIPIndyMessagingClientTransport
    Port = 41592
    Host = '127.0.0.1'
    StringConversion = mwscFixed
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    OnConnectionLost = TranspConnectionLost
    OnDisconnected = TranspDisconnected
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    Direction = [mwmdSubscribe, mwmdPublish]
    InboundMessageQueue = mmqIn
    OutboundMessageQueue = mmqOut
    Subscriptions.Strings = (
      'RES.1.>'
      'MSG.TODOS.>'
      'MSG.1.>')
    NodeID = '1'
    Active = False
    OnMessage = TranspMessage
    Left = 24
    Top = 80
  end
  object mmqIn: TkbmMWMemoryMessageQueue
    Left = 80
    Top = 24
  end
  object mmqOut: TkbmMWMemoryMessageQueue
    Left = 80
    Top = 80
  end
end
