object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 454
  object mwNXDBCP: TkbmMWNexusDBConnectionPool
    MetaData = mwNXMD
    Database = nxDB
    Session = nxSession
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
  object nxSession: TnxSession
    ServerEngine = nxRSE
    Left = 24
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 96
    Top = 16
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCPIP
    Left = 160
    Top = 16
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '192.168.0.1'
    ServerNameDesigntime = '192.168.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 224
    Top = 16
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
    TransportStateOptions = []
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
    TransportStateOptions = []
    StringConversion = mwscFixed
    Left = 280
    Top = 80
  end
  object qSeq: TnxQuery
    Database = nxDB
    Left = 24
    Top = 144
  end
  object tCorpo: TnxTable
    Database = nxDB
    TableName = 'EmailCorpo'
    IndexName = 'IProcessou'
    Left = 96
    Top = 144
    object tCorpoID: TAutoIncField
      FieldName = 'ID'
    end
    object tCorpoCorpo: TMemoField
      FieldName = 'Corpo'
      BlobType = ftMemo
    end
    object tCorpoAssunto: TStringField
      FieldName = 'Assunto'
      Size = 100
    end
    object tCorpoInclusao: TDateTimeField
      FieldName = 'Inclusao'
    end
    object tCorpoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCorpoEnviarEm: TDateTimeField
      FieldName = 'EnviarEm'
    end
    object tCorpoProcessou: TBooleanField
      FieldName = 'Processou'
    end
    object tCorpoDestino: TMemoField
      FieldName = 'Destino'
      BlobType = ftMemo
    end
  end
  object tEnvio: TnxTable
    Database = nxDB
    TableName = 'EmailEnvio'
    IndexName = 'IEnviar'
    Left = 160
    Top = 144
    object tEnvioID: TAutoIncField
      FieldName = 'ID'
    end
    object tEnvioCorpo: TIntegerField
      FieldName = 'Corpo'
    end
    object tEnvioInclusao: TDateTimeField
      FieldName = 'Inclusao'
    end
    object tEnvioEnvio: TDateTimeField
      FieldName = 'Envio'
    end
    object tEnvioTentativas: TWordField
      FieldName = 'Tentativas'
    end
    object tEnvioEnviar: TBooleanField
      FieldName = 'Enviar'
    end
    object tEnvioMsgErro: TMemoField
      FieldName = 'MsgErro'
      BlobType = ftMemo
    end
    object tEnvioOK: TBooleanField
      FieldName = 'OK'
    end
    object tEnvioDestino: TMemoField
      FieldName = 'Destino'
      BlobType = ftMemo
    end
  end
  object tEmail: TTimer
    Interval = 10000
    OnTimer = tEmailTimer
    Left = 224
    Top = 144
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 280
    Top = 144
    object tCliCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCliTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCliEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object tCliLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object tCliLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object tCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object tCliEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
  end
  object SMTP: TIdSMTP
    MaxLineAction = maException
    Host = 'www.cybermgr.com'
    Port = 25
    AuthenticationType = atNone
    Password = 'delphi'
    Username = 'cybermgr'
    Left = 24
    Top = 200
  end
  object pop: TIdPOP3
    MaxLineAction = maException
    Host = 'www.cybermgr.com'
    Password = 'delphi'
    Username = 'cybermgr'
    Left = 96
    Top = 200
  end
  object TCPIPMsg: TkbmMWTCPIPIndyMessagingServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 5000
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    OnDisconnected = TCPIPMsgDisconnected
    StringConversion = mwscFixed
    Direction = [mwmdSubscribe, mwmdPublish]
    Subscriptions.Strings = (
      'MSG.>'
      'SUB.>'
      'REQ.>')
    NodeID = 'server'
    InboundMessageQueue = msgQIn
    OutboundMessageQueue = msgQOut
    AutoRelay = True
    RelayOptions = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypes = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    AutoRelayAlt = False
    RelayOptionsAlt = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypesAlt = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    Left = 160
    Top = 200
  end
  object tConexao: TnxTable
    Database = nxDB
    TableName = 'Conexao'
    IndexName = 'IAbertaThreadID'
    Left = 224
    Top = 200
    object tConexaoID: TAutoIncField
      FieldName = 'ID'
    end
    object tConexaoAberta: TBooleanField
      FieldName = 'Aberta'
    end
    object tConexaoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tConexaoHD: TStringField
      FieldName = 'HD'
      Size = 60
    end
    object tConexaoLogin: TDateTimeField
      FieldName = 'Login'
    end
    object tConexaoLogout: TDateTimeField
      FieldName = 'Logout'
    end
    object tConexaoLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tConexaoUsuario: TStringField
      FieldName = 'Usuario'
      Size = 30
    end
    object tConexaoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tConexaoStatus: TStringField
      FieldName = 'Status'
      Size = 30
    end
    object tConexaoIP: TStringField
      FieldName = 'IP'
    end
    object tConexaoThreadID: TIntegerField
      FieldName = 'ThreadID'
    end
  end
  object msgQIn: TkbmMWMemoryMessageQueue
    Left = 288
    Top = 200
  end
  object msgQOut: TkbmMWMemoryMessageQueue
    Left = 344
    Top = 144
  end
  object Timer1: TTimer
    Enabled = False
    Left = 344
    Top = 88
  end
end
