object Form28: TForm28
  Left = 0
  Top = 0
  Caption = 'Form28'
  ClientHeight = 297
  ClientWidth = 564
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
    Left = 184
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object PB: TProgressBar
    Left = 72
    Top = 176
    Width = 345
    Height = 17
    TabOrder = 1
  end
  object Button2: TButton
    Left = 424
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 440
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
    OnClick = Button3Click
  end
  object nxServerEngine1: TnxServerEngine
    SqlEngine = nxSqlEngine1
    Options = []
    TableExtension = 'nx1'
    Left = 216
    Top = 128
  end
  object nxSession1: TnxSession
    ServerEngine = nxServerEngine1
    Left = 144
    Top = 192
  end
  object nxDatabase1: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas'
    Left = 112
    Top = 120
  end
  object T: TnxTable
    Database = nxDatabase1
    TableName = 'Associado'
    Left = 80
    Top = 56
    object TUsuario: TStringField
      FieldName = 'Usuario'
      Size = 40
    end
    object TSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
  end
  object tA: TnxTable
    Database = nxDatabase1
    TableName = 'Associado'
    Left = 344
    Top = 72
    object tAUsuario: TStringField
      FieldName = 'Usuario'
      Size = 17
    end
    object tASexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
  end
  object tN: TnxTable
    Database = nxDatabase1
    TableName = 'Nomes'
    IndexName = 'INome'
    Left = 512
    Top = 112
    object tNNome: TStringField
      FieldName = 'Nome'
      Size = 17
    end
    object tNSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tNQtd: TIntegerField
      FieldName = 'Qtd'
    end
  end
  object Q: TnxQuery
    Database = nxDatabase1
    SQL.Strings = (
      'Select Usuario, Sexo, Count(Usuario) as Qtd from Associado'
      'group by Usuario, Sexo'
      '')
    Left = 336
    Top = 232
    object QUsuario: TStringField
      FieldName = 'Usuario'
      Size = 17
    end
    object QSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object QQtd: TLargeintField
      FieldName = 'Qtd'
    end
  end
  object nxSqlEngine1: TnxSqlEngine
    ActiveDesigntime = True
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    Left = 368
    Top = 136
  end
  object tNA: TnxTable
    Database = nxDatabase1
    TableName = 'NomesA'
    Left = 472
    Top = 208
    object tNAUsuario: TStringField
      FieldName = 'Usuario'
      Size = 17
    end
    object tNASexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tNAQtd: TIntegerField
      FieldName = 'Qtd'
    end
  end
end
