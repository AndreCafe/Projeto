object qsCHAT100: TqsCHAT100
  OldCreateOrder = True
  OnCreate = kbmMWQueryServiceCreate
  GatherStatistics = False
  OnAuthenticate = kbmMWQueryServiceAuthenticate
  AllowClientStatement = False
  AllowClientKeyFields = False
  AllowClientNamedQuery = False
  AllowClientTableName = False
  TransportStreamFormat = BSF
  Height = 179
  Width = 353
  object BSF: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 16
    Top = 8
  end
  object tConexao: TnxTable
    Database = nxDB
    TableName = 'Conexao'
    IndexName = 'IAbertaThreadID'
    Left = 16
    Top = 64
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
  object nxSession: TnxSession
    ActiveRuntime = True
    ServerEngine = nxRSE
    Left = 72
    Top = 8
  end
  object nxDB: TnxDatabase
    ActiveRuntime = True
    Session = nxSession
    AliasName = 'Registro'
    Left = 128
    Top = 8
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCPIP
    Left = 176
    Top = 8
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveRuntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 176
    Top = 64
  end
  object tUsuario: TnxTable
    Database = nxDB
    TableName = 'Usuario'
    IndexName = 'IUsername'
    Left = 72
    Top = 64
    object tUsuarioUsername: TStringField
      FieldName = 'Username'
    end
    object tUsuarioSenha: TStringField
      FieldName = 'Senha'
    end
    object tUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object tUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
    object tUsuarioNomeCHAT: TStringField
      FieldName = 'NomeCHAT'
      Size = 50
    end
    object tUsuarioStatusCHAT: TStringField
      FieldName = 'StatusCHAT'
      Size = 30
    end
    object tUsuarioCHAT: TBooleanField
      FieldName = 'CHAT'
    end
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 128
    Top = 64
    object tCliCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCliLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
  end
end
