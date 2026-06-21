object DMServ: TDMServ
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 263
  Top = 197
  Height = 225
  Width = 453
  object nxSE: TnxServerEngine
    EventLog = nxEvLov
    SqlEngine = nxSQL
    Options = []
    Left = 16
    Top = 16
  end
  object nxSQL: TnxSqlEngine
    EventLog = nxEvLov
    ActiveDesigntime = True
    Left = 64
    Top = 16
  end
  object nxEvLov: TnxEventLog
    TruncateSize = 1024
    Left = 112
    Top = 16
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    EventLog = nxEvLov
    CommandHandler = nxCmdH
    Mode = nxtmListen
    RespondToBroadcasts = True
    ServerNameDesigntime = 'NexusDB@169.254.59.115'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 160
    Top = 16
  end
  object nxCmdH: TnxServerCommandHandler
    EventLog = nxEvLov
    ServerEngine = nxSE
    Left = 208
    Top = 16
  end
  object nxSession: TnxSession
    ServerEngine = nxSE
    Left = 16
    Top = 128
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\cybermgr2\dados'
    Left = 64
    Top = 128
  end
  object tConexao: TnxTable
    Database = nxDB
    TableName = 'Conexao'
    IndexName = 'IThreadID'
    Left = 112
    Top = 128
    object tConexaoNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tConexaoMaq: TWordField
      FieldName = 'Maq'
    end
    object tConexaoThreadID: TIntegerField
      FieldName = 'ThreadID'
    end
    object tConexaoUsername: TStringField
      FieldName = 'Username'
    end
    object tConexaoDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
    object tConexaoIP: TStringField
      FieldName = 'IP'
    end
    object tConexaoPrograma: TWordField
      FieldName = 'Programa'
    end
    object tConexaoInicio: TIntegerField
      FieldName = 'Inicio'
    end
  end
  object tUsuario: TnxTable
    Database = nxDB
    TableName = 'Usuario'
    IndexName = 'IUsername'
    Left = 160
    Top = 128
    object tUsuarioID: TAutoIncField
      FieldName = 'ID'
    end
    object tUsuarioUsername: TStringField
      FieldName = 'Username'
    end
    object tUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object tUsuarioSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object tUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
  end
  object tLogProg: TnxTable
    Database = nxDB
    TableName = 'LogProg'
    IndexName = 'INumSeq'
    Left = 208
    Top = 72
    object tLogProgNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tLogProgInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tLogProgTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object tLogProgMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tLogProgUsuario: TStringField
      FieldName = 'Usuario'
    end
    object tLogProgPrograma: TWordField
      FieldName = 'Programa'
    end
    object tLogProgTempo: TFloatField
      FieldName = 'Tempo'
    end
    object tLogProgThreadID: TIntegerField
      FieldName = 'ThreadID'
    end
    object tLogProgNomeRede: TStringField
      FieldName = 'NomeRede'
      Size = 50
    end
    object tLogProgIP: TStringField
      FieldName = 'IP'
    end
  end
  object tMaq: TnxTable
    Database = nxDB
    TableName = 'Maquina'
    IndexName = 'INumero'
    Left = 208
    Top = 128
    object tMaqNumero: TWordField
      FieldName = 'Numero'
    end
    object tMaqNomeRede: TStringField
      FieldName = 'NomeRede'
      Size = 50
    end
    object tMaqUltimoIP: TStringField
      FieldName = 'UltimoIP'
    end
    object tMaqInativa: TBooleanField
      FieldName = 'Inativa'
    end
    object tMaqObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tMaqSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tMaqRecursos: TMemoField
      FieldName = 'Recursos'
      BlobType = ftMemo
    end
    object tMaqGrupo: TStringField
      FieldName = 'Grupo'
    end
    object tMaqThreadID: TIntegerField
      FieldName = 'ThreadID'
    end
  end
  object mwServ: TkbmMWServer
    Active = False
    OnAuthenticate = mwServAuthenticate
    GatherStatistics = False
    CPUAffinityMask = 1
    GarbageCollection = True
    GarbageInterval = 60
    EnableDefaultService = False
    ShutdownWait = 60
    EarlyAuthentication = True
    Left = 16
    Top = 72
  end
  object msgQIn: TkbmMWMemoryMessageQueue
    Left = 112
    Top = 72
  end
  object msgQOut: TkbmMWMemoryMessageQueue
    Left = 160
    Top = 72
  end
  object mwTCPIP: TkbmMWTCPIPIndyServerTransport
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
    Left = 64
    Top = 72
  end
  object mwTCPIPmsg: TkbmMWTCPIPIndyMessagingServerTransport
    Server = mwServ
    Bindings = <
      item
        IP = '0.0.0.0.'
        Port = 3500
      end>
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    Direction = [mwmdSubscribe, mwmdPublish]
    Subscriptions.Strings = (
      'REQ.>'
      'SUB.>')
    InboundMessageQueue = msgQIn
    OutboundMessageQueue = msgQOut
    AutoRelay = True
    RelayOptions = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypes = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    AutoRelayAlt = False
    RelayOptionsAlt = [mwmroSubscribed, mwmroUnsubscribed, mwroPeerSubscribe]
    RelayTypesAlt = [mwmtUnknown, mwmtRequest, mwmtResponse, mwmtServiceCall, mwmtMessage, mwmtSubscribe, mwmtUnsubscribe, mwmtCache, mwmtThrottle]
    Left = 272
    Top = 16
  end
end
