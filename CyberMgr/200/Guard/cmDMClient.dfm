object dmClient: TdmClient
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 181
  Width = 280
  object Client: TkbmMWFileClient
    Transport = mwTCPIPmsg
    Username = '_@_guard_username_@_'
    Password = '1'
    FileService = 'KBMMW_FILE'
    FileServiceVersion = 'kbmMW_1.0'
    BlockSize = 8192
    AllowOverwrite = False
    KeepPartialFileOnCancel = True
    KeepPartialFileOnException = False
    Left = 80
    Top = 16
  end
  object msgQIn: TkbmMWMemoryMessageQueue
    Left = 32
    Top = 64
  end
  object msgQOut: TkbmMWMemoryMessageQueue
    Left = 128
    Top = 64
  end
  object Client2: TkbmMWSimpleClient
    Transport = mwTCPIPmsg
    Username = '_@_guard_username_@_'
    Password = '1'
    Left = 128
    Top = 16
  end
  object CCP: TkbmMWClientConnectionPool
    Left = 80
    Top = 64
  end
  object mwTCPIP: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = '127.0.0.1'
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    StringConversion = mwscFixed
    Left = 32
    Top = 16
  end
  object mwTCPIPmsg: TkbmMWTCPIPIndyMessagingClientTransport
    Port = 3500
    Host = '127.0.0.1'
    StringConversion = mwscFixed
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    Direction = [mwmdSubscribe, mwmdPublish]
    InboundMessageQueue = msgQIn
    OutboundMessageQueue = msgQOut
    NodeID = '00078C91AD'
    Active = False
    Left = 192
    Top = 16
  end
end
