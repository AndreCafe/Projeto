object Form1: TForm1
  Left = 192
  Top = 133
  Width = 584
  Height = 289
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 88
    Width = 576
    Height = 174
    Align = alBottom
    DataSource = DataSource1
    Enabled = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 104
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = T
    Left = 64
    Top = 24
  end
  object T: TffTable
    DatabaseName = 'CyberMgr'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftAutoInc
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nasc'
        DataType = ftDateTime
      end
      item
        Name = 'Sexo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Cpf'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Rg'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Email'
        DataType = ftMemo
      end
      item
        Name = 'CreditoM'
        DataType = ftInteger
      end
      item
        Name = 'TempoTotal'
        DataType = ftInteger
      end
      item
        Name = 'TempoInicial'
        DataType = ftInteger
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UltVisita'
        DataType = ftDateTime
      end
      item
        Name = 'Debito'
        DataType = ftCurrency
      end
      item
        Name = 'Escola'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NickName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DataNasc'
        DataType = ftDateTime
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 15
      end>
    SessionName = '[automatic]'
    TableName = 'Contato'
    Left = 24
    Top = 24
    object TCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object TNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object TBairro: TStringField
      FieldName = 'Bairro'
    end
    object TCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object TUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object TSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object TObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object TRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object TTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object TEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object TCreditoM: TIntegerField
      FieldName = 'CreditoM'
    end
    object TTempoTotal: TIntegerField
      FieldName = 'TempoTotal'
    end
    object TTempoInicial: TIntegerField
      FieldName = 'TempoInicial'
    end
    object TIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object TSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object TUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object TDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object TEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object TNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object TDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object TCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
  end
end
