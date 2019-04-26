object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o do Smartlaunch'
  ClientHeight = 518
  ClientWidth = 652
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
    Width = 652
    Height = 453
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
    Width = 652
    Height = 49
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
      Left = 102
      Top = 13
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
    Width = 652
    Height = 16
    Align = alTop
    TabOrder = 2
  end
  object Tab: TTable
    DatabaseName = 'c:\nexcafe'
    SessionName = 'SessionBDE'
    TableName = 'Users.DB'
    Left = 128
    Top = 96
    object TabID: TAutoIncField
      DisplayWidth = 12
      FieldName = 'ID'
      ReadOnly = True
    end
    object TabUsername: TStringField
      DisplayWidth = 24
      FieldName = 'Username'
    end
    object TabPasswordHash: TStringField
      DisplayWidth = 306
      FieldName = 'PasswordHash'
      Size = 255
    end
    object TabAccountStatus: TBooleanField
      DisplayWidth = 14
      FieldName = 'AccountStatus'
    end
    object TabCreatedDateTime: TDateTimeField
      DisplayWidth = 22
      FieldName = 'CreatedDateTime'
    end
    object TabUsergroupID: TIntegerField
      DisplayWidth = 12
      FieldName = 'UsergroupID'
    end
    object TabUsergroupDateTime: TDateTimeField
      DisplayWidth = 22
      FieldName = 'UsergroupDateTime'
    end
    object TabUsergroupExpirationDate: TDateTimeField
      DisplayWidth = 24
      FieldName = 'UsergroupExpirationDate'
    end
    object TabOverruleGameRating: TIntegerField
      DisplayWidth = 20
      FieldName = 'OverruleGameRating'
    end
    object TabAllowedCredit: TFloatField
      DisplayWidth = 13
      FieldName = 'AllowedCredit'
    end
    object TabNotes: TMemoField
      DisplayWidth = 12
      FieldName = 'Notes'
      BlobType = ftMemo
      Size = 16
    end
    object TabFingerprint: TBytesField
      DisplayWidth = 12
      FieldName = 'Fingerprint'
      Size = 255
    end
    object TabUsedOfferLastTime: TBooleanField
      DisplayWidth = 19
      FieldName = 'UsedOfferLastTime'
    end
    object TabLastLogin: TDateTimeField
      DisplayWidth = 22
      FieldName = 'LastLogin'
    end
    object TabAlarm: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Alarm'
    end
    object TabPrepaidTicketID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PrepaidTicketID'
    end
    object TabCardHashCode: TStringField
      DisplayWidth = 24
      FieldName = 'CardHashCode'
      Size = 255
    end
    object TabAskAtNextLogin: TIntegerField
      DisplayWidth = 15
      FieldName = 'AskAtNextLogin'
    end
    object TabCreditLimit: TIntegerField
      DisplayWidth = 12
      FieldName = 'CreditLimit'
    end
    object TabInfoFirstname: TStringField
      DisplayWidth = 60
      FieldName = 'InfoFirstname'
      Size = 50
    end
    object TabInfoLastname: TStringField
      DisplayWidth = 60
      FieldName = 'InfoLastname'
      Size = 50
    end
    object TabInfoBirthday: TDateTimeField
      DisplayWidth = 22
      FieldName = 'InfoBirthday'
    end
    object TabInfoAddress: TStringField
      DisplayWidth = 300
      FieldName = 'InfoAddress'
      Size = 250
    end
    object TabInfoCity: TStringField
      DisplayWidth = 120
      FieldName = 'InfoCity'
      Size = 100
    end
    object TabInfoZip: TStringField
      DisplayWidth = 48
      FieldName = 'InfoZip'
      Size = 40
    end
    object TabInfoState: TStringField
      DisplayWidth = 60
      FieldName = 'InfoState'
      Size = 50
    end
    object TabInfoCountry: TStringField
      DisplayWidth = 60
      FieldName = 'InfoCountry'
      Size = 50
    end
    object TabInfoEmail: TStringField
      DisplayWidth = 120
      FieldName = 'InfoEmail'
      Size = 100
    end
    object TabInfoTelephone: TStringField
      DisplayWidth = 60
      FieldName = 'InfoTelephone'
      Size = 50
    end
    object TabInfoMobilephone: TStringField
      DisplayWidth = 48
      FieldName = 'InfoMobilephone'
      Size = 40
    end
    object TabInfoSex: TSmallintField
      DisplayWidth = 12
      FieldName = 'InfoSex'
    end
    object TabInfoPersonalnumber: TStringField
      DisplayWidth = 60
      FieldName = 'InfoPersonalnumber'
      Size = 50
    end
    object TabInfoPersonalnumberVerifie: TSmallintField
      DisplayWidth = 26
      FieldName = 'InfoPersonalnumberVerifie'
    end
    object TabBanned: TBooleanField
      DisplayWidth = 7
      FieldName = 'Banned'
    end
    object TabHasSentReminderEmail: TIntegerField
      DisplayWidth = 22
      FieldName = 'HasSentReminderEmail'
    end
    object TabHasSentSignupEmail: TIntegerField
      DisplayWidth = 19
      FieldName = 'HasSentSignupEmail'
    end
    object TabBarcode: TStringField
      DisplayWidth = 60
      FieldName = 'Barcode'
      Size = 50
    end
    object TabTimeDifferenceDueToExpire: TIntegerField
      DisplayWidth = 27
      FieldName = 'TimeDifferenceDueToExpire'
    end
    object TabLastLogout: TDateTimeField
      DisplayWidth = 22
      FieldName = 'LastLogout'
    end
    object TabLastSessionExpired: TBooleanField
      DisplayWidth = 19
      FieldName = 'LastSessionExpired'
    end
    object TabFingerprintLong: TMemoField
      DisplayWidth = 15
      FieldName = 'FingerprintLong'
      BlobType = ftMemo
      Size = 16
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
    AliasPath = 'c:\nexcafe\dados'
    Left = 328
    Top = 336
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1:16200'
    Left = 368
    Top = 336
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
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
    object tCliPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object tCliTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object tCliFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tCliFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object tCliFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object tCliAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object tCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tCliHP7: TIntegerField
      FieldName = 'HP7'
    end
  end
  object Database1: TDatabase
    DatabaseName = 'c:\meus programas\nexcafe'
    DriverName = 'Microsoft Paradox Driver (*.db '
    SessionName = 'Default'
    Left = 104
    Top = 280
  end
  object Session1: TSession
    Active = True
    NetFileDir = 'C:\MEUS PROGRAMAS\NEXCAFE'
    SessionName = 'SessionBDE'
    Left = 272
    Top = 176
  end
end
