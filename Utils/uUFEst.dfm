object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar DBF'
  ClientHeight = 548
  ClientWidth = 968
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 968
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 363
    Width = 968
    Height = 185
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 488
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object nxSession1: TnxSession
    ServerEngine = nxRemoteServerEngine1
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasName = 'Registro'
    Left = 64
    Top = 24
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16300
    Left = 104
    Top = 24
  end
  object nxSE: TnxServerEngine
    SqlEngine = nxSqlEngine1
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
    Left = 64
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = Q2
    Left = 360
    Top = 80
  end
  object Q: TnxQuery
    Database = nxDB
    Timeout = 540000
    SQL.Strings = (
      
        'SELECT uf, count(distinct(loja)) as qtd FROM "openstat" o left o' +
        'uter join cliente on (o.loja = codigo)'
      'where o.data > :data'
      'group by uf'
      'order by qtd desc')
    Left = 80
    Top = 208
    ParamData = <
      item
        DataType = ftDate
        Name = 'data'
        ParamType = ptInput
      end>
    object Quf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object Qqtd: TLargeintField
      FieldName = 'qtd'
    end
  end
  object nxSqlEngine1: TnxSqlEngine
    ActiveDesigntime = True
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    Left = 288
    Top = 184
  end
  object nxRemoteServerEngine1: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 136
    Top = 112
  end
  object Q2: TnxQuery
    Database = nxDB
    Timeout = 540000
    SQL.Strings = (
      'SELECT UF, count(codigo) as Qtd FROM "cliente"'
      'where (UObtemLic > :Data) or (LicTipo=2)'
      'group by UF')
    Left = 144
    Top = 208
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'data'
        ParamType = ptInput
      end>
    object Q2UF: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object Q2Qtd: TLargeintField
      FieldName = 'qtd'
    end
  end
end
