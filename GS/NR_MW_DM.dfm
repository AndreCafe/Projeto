object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 200
  Width = 619
  object mwNXDBCP: TkbmMWNexusDBConnectionPool
    MetaData = mwNXMD
    Left = 94
    Top = 80
  end
  object mwPS: TkbmMWPooledSession
    ConnectionPool = mwNXDBCP
    AutoSessionName = False
    SessionName = 'mwPS'
    Left = 22
    Top = 80
  end
  object mwNXMD: TkbmMWNexusDBMetaData
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
    Left = 160
    Top = 80
  end
  object mwServ: TkbmMWServer
    Active = False
    CPUAffinityMask = 1
    GarbageCollection = True
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 60
    EarlyAuthentication = False
    Left = 224
    Top = 80
  end
  object TCPIP: TkbmMWTCPIPIndyServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3000
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    TransportStateOptions = [mwtsoDisconnectAfterResponse]
    StringConversion = mwscFixed
    Left = 280
    Top = 16
  end
  object TCPHTTP: TkbmMWTCPIPIndyServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3001
      end>
    StreamFormat = 'HTTP'
    VerifyTransfer = False
    TransportStateOptions = [mwtsoDisconnectAfterResponse]
    StringConversion = mwscFixed
    Left = 280
    Top = 80
  end
  object TCP2: TkbmMWTCPIPIndyServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 3010
      end>
    StreamFormat = 'ZIPPED'
    VerifyTransfer = False
    TransportStateOptions = [mwtsoDisconnectAfterResponse]
    StringConversion = mwscFixed
    Left = 336
    Top = 16
  end
end
