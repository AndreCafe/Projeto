object dmOpen: TdmOpen
  OldCreateOrder = False
  Height = 254
  Width = 330
  object tIPLoja: TnxTable
    Database = nxDB
    TableName = 'IPLoja'
    IndexName = 'IIP'
    Left = 144
    Top = 16
    object tIPLojaIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object tIPLojaLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tIPLojaDH: TDateTimeField
      FieldName = 'DH'
    end
  end
  object nxSession: TnxSession
    BeepOnLoginError = False
    Timeout = 60000
    ServerEngine = dm_conn.nxRSE
    Left = 32
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 88
    Top = 16
  end
  object tOpenStatL: TnxTable
    Database = nxDB
    TableName = 'OpenStatL'
    IndexName = 'ILojaAnoMesDia'
    Left = 24
    Top = 80
    object tOpenStatLLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tOpenStatLAno: TWordField
      FieldName = 'Ano'
    end
    object tOpenStatLMes: TWordField
      FieldName = 'Mes'
    end
    object tOpenStatLDia: TWordField
      FieldName = 'Dia'
    end
    object tOpenStatLQtd: TWordField
      FieldName = 'Qtd'
    end
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 120
    Top = 88
    object tCliEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliRedirU: TDateTimeField
      FieldName = 'RedirU'
    end
    object tCliRedirT: TIntegerField
      FieldName = 'RedirT'
    end
    object tCliRedirI: TDateTimeField
      FieldName = 'RedirI'
    end
  end
  object tOpenStatH: TnxTable
    Database = nxDB
    TableName = 'OpenStatH'
    IndexName = 'IAnoMesDiaH'
    Left = 224
    Top = 88
    object tOpenStatHH: TWordField
      FieldName = 'H'
    end
    object tOpenStatHAno: TWordField
      FieldName = 'Ano'
    end
    object tOpenStatHMes: TWordField
      FieldName = 'Mes'
    end
    object tOpenStatHDia: TWordField
      FieldName = 'Dia'
    end
    object tOpenStatHQtd: TIntegerField
      FieldName = 'Qtd'
    end
  end
end
