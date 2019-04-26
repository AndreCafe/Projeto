object dmAtualizaLic: TdmAtualizaLic
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 187
  Width = 277
  object mwCli: TkbmMWSimpleClient
    Transport = mwTransp
    Left = 40
    Top = 16
  end
  object mwTransp: TkbmMWTCPIPIndyClientTransport
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
    Left = 88
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 136
    Top = 16
  end
  object nxDB: TnxDatabase
    AliasName = 'NexCafe'
    Left = 184
    Top = 16
  end
  object tCaixa: TnxTable
    Database = nxDB
    TableName = 'Caixa'
    IndexName = 'IAbertoEstSyncOk'
    Left = 224
    Top = 16
    object tCaixaID: TAutoIncField
      Alignment = taLeftJustify
      FieldName = 'ID'
    end
    object tCaixaAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tCaixaUsuario: TStringField
      FieldName = 'Usuario'
    end
    object tCaixaAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tCaixaFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tCaixaTotalFinal: TCurrencyField
      FieldName = 'TotalFinal'
    end
    object tCaixaDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tCaixaCancelamentos: TCurrencyField
      FieldName = 'Cancelamentos'
    end
    object tCaixaSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tCaixaObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCaixaSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object tCaixaSupr: TCurrencyField
      FieldName = 'Supr'
    end
    object tCaixaReproc: TDateTimeField
      FieldName = 'Reproc'
    end
    object tCaixaEstSessoesQtd: TIntegerField
      FieldName = 'EstSessoesQtd'
    end
    object tCaixaEstSessoesTempo: TFloatField
      FieldName = 'EstSessoesTempo'
    end
    object tCaixaEstUrls: TIntegerField
      FieldName = 'EstUrls'
    end
    object tCaixaEstSyncOk: TBooleanField
      FieldName = 'EstSyncOk'
    end
    object tCaixaEstBuscasEng: TMemoField
      FieldName = 'EstBuscasEng'
      BlobType = ftMemo
    end
    object tCaixaEstRes: TMemoField
      FieldName = 'EstRes'
      BlobType = ftMemo
    end
  end
  object HC: TRtcHttpClient
    ServerAddr = 'contas.nextar.com.br'
    ServerPort = '80'
    ReconnectOn.ConnectLost = True
    AutoConnect = True
    UseProxy = True
    Left = 48
    Top = 120
  end
  object rcmApp: TRtcClientModule
    AutoSyncEvents = True
    Client = HC
    AutoRepost = 2
    ModuleFileName = '/app'
    Left = 104
    Top = 120
  end
  object resChecaConta: TRtcResult
    OnReturn = resChecaContaReturn
    RequestAborted = resChecaContaRequestAborted
    Left = 168
    Top = 120
  end
end
