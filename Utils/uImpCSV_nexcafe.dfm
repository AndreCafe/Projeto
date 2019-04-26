object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar CEPs'
  ClientHeight = 467
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 16
    Width = 994
    Height = 451
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 994
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 254
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxSE
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasPath = 'c:\nexcafe'
    Left = 64
    Top = 24
  end
  object tCEP: TnxTable
    Database = nxDB
    TableName = 'CEP'
    Exclusive = True
    IndexName = 'ICEP'
    Left = 32
    Top = 104
    object tCEPCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object tCEPCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object tCEPEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
    end
    object tCEPBairro: TStringField
      FieldName = 'Bairro'
      Size = 72
    end
    object tCEPUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object nxSE: TnxServerEngine
    ActiveDesigntime = True
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
    Left = 64
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = tCEP
    Left = 136
    Top = 120
  end
end
