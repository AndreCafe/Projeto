object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'FrmPri'
  ClientHeight = 292
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object PB: TProgressBar
    Left = 48
    Top = 192
    Width = 313
    Height = 16
    TabOrder = 1
  end
  object Button2: TButton
    Left = 160
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object RSE: TnxRemoteServerEngine
    Transport = nxWinsockTransport1
    Left = 136
    Top = 88
  end
  object nxSession1: TnxSession
    ServerEngine = RSE
    Left = 192
    Top = 40
  end
  object nxDatabase1: TnxDatabase
    Session = nxSession1
    AliasName = 'registro'
    Left = 264
    Top = 80
  end
  object nxWinsockTransport1: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = 'nexusdb@127.0.0.1'
    ServerNameDesigntime = 'nexusdb@127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 144
    Top = 40
  end
  object Tab: TnxTable
    Database = nxDatabase1
    TableName = 'Cliente'
    Left = 144
    Top = 136
  end
  object tAut: TnxTable
    ActiveRuntime = True
    Database = nxDatabase1
    TableName = 'Autorizacao'
    IndexName = 'ILoja'
    Left = 56
    Top = 232
    object tAutID: TAutoIncField
      FieldName = 'ID'
    end
    object tAutPrograma: TWordField
      FieldName = 'Programa'
    end
    object tAutLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tAutAutorizacao: TStringField
      FieldName = 'Autorizacao'
      Size = 30
    end
    object tAutVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object tAutCodigoEquip: TStringField
      FieldName = 'CodigoEquip'
      Size = 30
    end
    object tAutMaquinas: TWordField
      FieldName = 'Maquinas'
    end
    object tAutTipo: TWordField
      FieldName = 'Tipo'
    end
    object tAutCriadaEm: TDateTimeField
      FieldName = 'CriadaEm'
    end
    object tAutCriadaPor: TStringField
      FieldName = 'CriadaPor'
      Size = 30
    end
    object tAutInativadaEm: TDateTimeField
      FieldName = 'InativadaEm'
    end
    object tAutInativadaPor: TStringField
      FieldName = 'InativadaPor'
      Size = 30
    end
    object tAutAtiva: TBooleanField
      FieldName = 'Ativa'
    end
    object tAutObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tAutGerar: TBooleanField
      FieldName = 'Gerar'
    end
    object tAutEnviouCli: TBooleanField
      FieldName = 'EnviouCli'
    end
  end
end
