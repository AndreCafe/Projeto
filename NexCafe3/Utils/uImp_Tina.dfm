object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o do Tina Soft'
  ClientHeight = 416
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 731
    Height = 351
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 731
    Height = 49
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmEdge
    TabOrder = 1
    object Button1: TButton
      Left = 14
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 112
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object PB: TProgressBar
    Left = 0
    Top = 49
    Width = 731
    Height = 16
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 24
    ExplicitTop = 104
    ExplicitWidth = 150
  end
  object Tab: TTable
    Active = True
    DatabaseName = 'c:\meus programas\nexcafe\database'
    TableName = 'maindbex.DB'
    Left = 128
    Top = 96
    object TabKULLANICIKODU: TStringField
      DisplayWidth = 18
      FieldName = 'KULLANICIKODU'
      Size = 15
    end
    object TabSIFRE: TStringField
      DisplayWidth = 18
      FieldName = 'SIFRE'
      Size = 15
    end
    object TabADI: TStringField
      DisplayWidth = 18
      FieldName = 'ADI'
      Size = 15
    end
    object TabSOYADI: TStringField
      DisplayWidth = 30
      FieldName = 'SOYADI'
      Size = 25
    end
    object TabADRES1: TMemoField
      DisplayWidth = 12
      FieldName = 'ADRES1'
      BlobType = ftMemo
      Size = 50
    end
    object TabSEMT: TStringField
      DisplayWidth = 24
      FieldName = 'SEMT'
    end
    object TabPOSTAKODU: TStringField
      DisplayWidth = 12
      FieldName = 'POSTAKODU'
      Size = 5
    end
    object TabSEHIR: TStringField
      DisplayWidth = 30
      FieldName = 'SEHIR'
      Size = 25
    end
    object TabTEL: TStringField
      DisplayWidth = 24
      FieldName = 'TEL'
    end
    object TabACILISTARIHI: TDateField
      DisplayWidth = 18
      FieldName = 'ACILISTARIHI'
    end
    object TabBITISTARIHI: TDateField
      DisplayWidth = 12
      FieldName = 'BITISTARIHI'
    end
    object TabEMAIL: TStringField
      DisplayWidth = 120
      FieldName = 'EMAIL'
      Size = 100
    end
    object TabWEB: TStringField
      DisplayWidth = 306
      FieldName = 'WEB'
      Size = 255
    end
    object TabFOTO: TGraphicField
      DisplayWidth = 12
      FieldName = 'FOTO'
      BlobType = ftGraphic
      Size = 20
    end
    object TabDESCRIPTION: TMemoField
      DisplayWidth = 14
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = 50
    end
    object TabEXT1: TStringField
      DisplayWidth = 30
      FieldName = 'EXT1'
      Size = 25
    end
    object TabEXT2: TCurrencyField
      DisplayWidth = 12
      FieldName = 'EXT2'
    end
    object TabSAATUCRETI: TCurrencyField
      DisplayWidth = 13
      FieldName = 'SAATUCRETI'
    end
    object TabDAKIKAHAKKI: TFloatField
      DisplayWidth = 14
      FieldName = 'DAKIKAHAKKI'
    end
    object TabKULLANILANSURE: TFloatField
      DisplayWidth = 17
      FieldName = 'KULLANILANSURE'
    end
    object TabAKTIF: TBooleanField
      DisplayWidth = 6
      FieldName = 'AKTIF'
    end
    object TabKREDI: TCurrencyField
      DisplayWidth = 12
      FieldName = 'KREDI'
    end
    object TabICQ: TFloatField
      DisplayWidth = 12
      FieldName = 'ICQ'
    end
    object TabUCRETTIPI: TStringField
      DisplayWidth = 11
      FieldName = 'UCRETTIPI'
      Size = 1
    end
    object TabISKONTO: TFloatField
      DisplayWidth = 12
      FieldName = 'ISKONTO'
    end
    object TabRESERVED1STR: TStringField
      DisplayWidth = 36
      FieldName = 'RESERVED1STR'
      Size = 30
    end
    object TabRESERVED2STR: TStringField
      DisplayWidth = 24
      FieldName = 'RESERVED2STR'
    end
    object TabRESERVED3STR: TStringField
      DisplayWidth = 36
      FieldName = 'RESERVED3STR'
      Size = 30
    end
    object TabRESERVED1NUM: TFloatField
      DisplayWidth = 16
      FieldName = 'RESERVED1NUM'
    end
    object TabRESERVED2NUM: TFloatField
      DisplayWidth = 16
      FieldName = 'RESERVED2NUM'
    end
    object TabRESERVED3NUM: TFloatField
      DisplayWidth = 16
      FieldName = 'RESERVED3NUM'
    end
    object TabRESERVED1CUR: TCurrencyField
      DisplayWidth = 16
      FieldName = 'RESERVED1CUR'
    end
    object TabRESERVED2CUR: TCurrencyField
      DisplayWidth = 16
      FieldName = 'RESERVED2CUR'
    end
    object TabRESERVED3CUR: TCurrencyField
      DisplayWidth = 16
      FieldName = 'RESERVED3CUR'
    end
    object TabRESERVED1DATE: TDateField
      DisplayWidth = 17
      FieldName = 'RESERVED1DATE'
    end
    object TabRESERVED2DATE: TDateField
      DisplayWidth = 17
      FieldName = 'RESERVED2DATE'
    end
    object TabRESERVED1TIME: TDateField
      DisplayWidth = 16
      FieldName = 'RESERVED1TIME'
    end
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 168
    Top = 96
  end
  object nxSession1: TnxSession
    ServerEngine = nxSE
    Left = 288
    Top = 336
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 328
    Top = 336
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1:16200'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 368
    Top = 336
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    Left = 328
    Top = 376
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    Exclusive = True
    IndexName = 'IID'
    Left = 288
    Top = 376
    object tCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tCliNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object tCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tCliMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tCliMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tCliIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tCliPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tCliMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
    end
    object tCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tCliEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tCliEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tCliLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tCliIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tCliAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tCliIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tCliAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
    object tCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
  end
end
