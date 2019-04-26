object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar MDB SmartLaunch'
  ClientHeight = 470
  ClientWidth = 841
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
    Width = 841
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 0
    Top = 16
    Width = 841
    Height = 25
    Align = alTop
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 0
    Top = 61
    Width = 841
    Height = 409
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object nxSession1: TnxSession
    ServerEngine = nxSE
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\nexcafe\dados'
    Left = 64
    Top = 24
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    Exclusive = True
    IndexName = 'IUsername'
    Left = 120
    Top = 152
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
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1:16200'
    Left = 104
    Top = 24
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
    Left = 232
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = tF
    Left = 360
    Top = 80
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;User ID=Admin;Data Source=c:\n' +
      'excafe\Smartlaunch.mdb;Mode=Read;Persist Security Info=False;Jet' +
      ' OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:D' +
      'atabase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database L' +
      'ocking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Glob' +
      'al Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OL' +
      'EDB:Create System Database=False;Jet OLEDB:Encrypt Database=Fals' +
      'e;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact' +
      ' Without Replica Repair=False;Jet OLEDB:SFP=False;Jet OLEDB:Supp' +
      'ort Complex Data=False'
    LoginPrompt = False
    Mode = cmRead
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 216
    Top = 304
  end
  object tF: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Users'
    Left = 352
    Top = 344
    object tFID: TAutoIncField
      DisplayWidth = 12
      FieldName = 'ID'
      ReadOnly = True
    end
    object tFUsername: TWideStringField
      DisplayWidth = 24
      FieldName = 'Username'
    end
    object tFPasswordHash: TWideStringField
      DisplayWidth = 39
      FieldName = 'PasswordHash'
      Size = 255
    end
    object tFAccountStatus: TBooleanField
      DisplayWidth = 14
      FieldName = 'AccountStatus'
    end
    object tFCreatedDateTime: TDateTimeField
      DisplayWidth = 22
      FieldName = 'CreatedDateTime'
    end
    object tFUsergroupID: TIntegerField
      DisplayWidth = 12
      FieldName = 'UsergroupID'
    end
    object tFUsergroupDateTime: TDateTimeField
      DisplayWidth = 22
      FieldName = 'UsergroupDateTime'
    end
    object tFUsergroupExpirationDate: TDateTimeField
      DisplayWidth = 24
      FieldName = 'UsergroupExpirationDate'
    end
    object tFOverruleGameRating: TIntegerField
      DisplayWidth = 20
      FieldName = 'OverruleGameRating'
    end
    object tFAllowedCredit: TFloatField
      DisplayWidth = 13
      FieldName = 'AllowedCredit'
    end
    object tFNotes: TWideMemoField
      DisplayWidth = 12
      FieldName = 'Notes'
      BlobType = ftWideMemo
    end
    object tFFingerprint: TVarBytesField
      DisplayWidth = 12
      FieldName = 'Fingerprint'
      Size = 510
    end
    object tFUsedOfferLastTime: TBooleanField
      DisplayWidth = 19
      FieldName = 'UsedOfferLastTime'
    end
    object tFLastLogin: TDateTimeField
      DisplayWidth = 22
      FieldName = 'LastLogin'
    end
    object tFAlarm: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Alarm'
    end
    object tFPrepaidTicketID: TIntegerField
      DisplayWidth = 15
      FieldName = 'PrepaidTicketID'
    end
    object tFCardHashCode: TWideStringField
      DisplayWidth = 306
      FieldName = 'CardHashCode'
      Size = 255
    end
    object tFAskAtNextLogin: TIntegerField
      DisplayWidth = 15
      FieldName = 'AskAtNextLogin'
    end
    object tFCreditLimit: TIntegerField
      DisplayWidth = 12
      FieldName = 'CreditLimit'
    end
    object tFInfoFirstname: TWideStringField
      DisplayWidth = 60
      FieldName = 'InfoFirstname'
      Size = 50
    end
    object tFInfoLastname: TWideStringField
      DisplayWidth = 60
      FieldName = 'InfoLastname'
      Size = 50
    end
    object tFInfoBirthday: TDateTimeField
      DisplayWidth = 22
      FieldName = 'InfoBirthday'
    end
    object tFInfoAddress: TWideStringField
      DisplayWidth = 300
      FieldName = 'InfoAddress'
      Size = 250
    end
    object tFInfoCity: TWideStringField
      DisplayWidth = 120
      FieldName = 'InfoCity'
      Size = 100
    end
    object tFInfoZip: TWideStringField
      DisplayWidth = 48
      FieldName = 'InfoZip'
      Size = 40
    end
    object tFInfoState: TWideStringField
      DisplayWidth = 60
      FieldName = 'InfoState'
      Size = 50
    end
    object tFInfoCountry: TWideStringField
      DisplayWidth = 60
      FieldName = 'InfoCountry'
      Size = 50
    end
    object tFInfoEmail: TWideStringField
      DisplayWidth = 120
      FieldName = 'InfoEmail'
      Size = 100
    end
    object tFInfoTelephone: TWideStringField
      DisplayWidth = 60
      FieldName = 'InfoTelephone'
      Size = 50
    end
    object tFInfoMobilephone: TWideStringField
      DisplayWidth = 48
      FieldName = 'InfoMobilephone'
      Size = 40
    end
    object tFInfoSex: TWordField
      DisplayWidth = 12
      FieldName = 'InfoSex'
    end
    object tFInfoPersonalnumber: TWideStringField
      DisplayWidth = 60
      FieldName = 'InfoPersonalnumber'
      Size = 50
    end
    object tFInfoPersonalnumberVerified: TWordField
      DisplayWidth = 27
      FieldName = 'InfoPersonalnumberVerified'
    end
    object tFBanned: TBooleanField
      DisplayWidth = 7
      FieldName = 'Banned'
    end
    object tFHasSentReminderEmail: TIntegerField
      DisplayWidth = 22
      FieldName = 'HasSentReminderEmail'
    end
    object tFHasSentSignupEmail: TIntegerField
      DisplayWidth = 19
      FieldName = 'HasSentSignupEmail'
    end
    object tFBarcode: TWideStringField
      DisplayWidth = 60
      FieldName = 'Barcode'
      Size = 50
    end
  end
end
