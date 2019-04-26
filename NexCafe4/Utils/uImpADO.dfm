object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar DBF'
  ClientHeight = 305
  ClientWidth = 629
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
    Width = 629
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
    Top = 120
    Width = 629
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
  object nxSession1: TnxSession
    ServerEngine = nxSE
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 64
    Top = 24
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    Exclusive = True
    Left = 24
    Top = 64
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
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1:16200'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 104
    Top = 24
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    Left = 64
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = T
    Left = 192
    Top = 168
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=cafes' +
      'uite2'
    DefaultDatabase = 'c:\accounts'
    Mode = cmRead
    Left = 400
    Top = 64
  end
  object T: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Accounts'
    Left = 288
    Top = 56
    object TID: TAutoIncField
      DisplayWidth = 12
      FieldName = 'ID'
      ReadOnly = True
    end
    object TUserName: TWideStringField
      DisplayWidth = 306
      FieldName = 'UserName'
      Size = 255
    end
    object TAccountID: TWideStringField
      DisplayWidth = 306
      FieldName = 'AccountID'
      Size = 255
    end
    object TPasswordAvailable: TBooleanField
      DisplayWidth = 18
      FieldName = 'PasswordAvailable'
    end
    object TPassword: TWideStringField
      DisplayWidth = 306
      FieldName = 'Password'
      Size = 255
    end
    object TType: TIntegerField
      DisplayWidth = 12
      FieldName = 'Type'
    end
    object TTotalMinutes: TIntegerField
      DisplayWidth = 12
      FieldName = 'TotalMinutes'
    end
    object TMinutesUsed: TIntegerField
      DisplayWidth = 12
      FieldName = 'MinutesUsed'
    end
    object TTotalCash: TBCDField
      DisplayWidth = 24
      FieldName = 'TotalCash'
      Precision = 19
    end
    object TCashUsed: TBCDField
      DisplayWidth = 24
      FieldName = 'CashUsed'
      Precision = 19
    end
    object TToPay: TBCDField
      DisplayWidth = 24
      FieldName = 'ToPay'
      Precision = 19
    end
    object TPoints: TIntegerField
      DisplayWidth = 12
      FieldName = 'Points'
    end
    object TCreationDate: TDateTimeField
      DisplayWidth = 22
      FieldName = 'CreationDate'
    end
    object TValidSinceDate: TDateTimeField
      DisplayWidth = 22
      FieldName = 'ValidSinceDate'
    end
    object TValidToDate: TDateTimeField
      DisplayWidth = 22
      FieldName = 'ValidToDate'
    end
    object TValidFromTime: TDateTimeField
      DisplayWidth = 22
      FieldName = 'ValidFromTime'
    end
    object TValidToTime: TDateTimeField
      DisplayWidth = 22
      FieldName = 'ValidToTime'
    end
    object TChangePasswordAllowed: TBooleanField
      DisplayWidth = 24
      FieldName = 'ChangePasswordAllowed'
    end
    object TLogonAllowed: TBooleanField
      DisplayWidth = 13
      FieldName = 'LogonAllowed'
    end
    object TWithoutPassword: TBooleanField
      DisplayWidth = 17
      FieldName = 'WithoutPassword'
    end
    object TUseWorkstationRates: TBooleanField
      DisplayWidth = 21
      FieldName = 'UseWorkstationRates'
    end
    object TChargingRate: TWideStringField
      DisplayWidth = 306
      FieldName = 'ChargingRate'
      Size = 255
    end
    object TFirstName: TWideStringField
      DisplayWidth = 306
      FieldName = 'FirstName'
      Size = 255
    end
    object TMiddleName: TWideStringField
      DisplayWidth = 47
      FieldName = 'MiddleName'
      Size = 50
    end
    object TLastName: TWideStringField
      DisplayWidth = 306
      FieldName = 'LastName'
      Size = 255
    end
    object TTitle: TWideStringField
      DisplayWidth = 60
      FieldName = 'Title'
      Size = 50
    end
    object TPhone: TWideStringField
      DisplayWidth = 306
      FieldName = 'Phone'
      Size = 255
    end
    object TMobile: TWideStringField
      DisplayWidth = 306
      FieldName = 'Mobile'
      Size = 255
    end
    object TFax: TWideStringField
      DisplayWidth = 306
      FieldName = 'Fax'
      Size = 255
    end
    object TAddress: TWideStringField
      DisplayWidth = 306
      FieldName = 'Address'
      Size = 255
    end
    object TCity: TWideStringField
      DisplayWidth = 60
      FieldName = 'City'
      Size = 50
    end
    object TCountry: TWideStringField
      DisplayWidth = 60
      FieldName = 'Country'
      Size = 50
    end
    object TEmail: TWideStringField
      DisplayWidth = 306
      FieldName = 'Email'
      Size = 255
    end
    object TGender: TIntegerField
      DisplayWidth = 12
      FieldName = 'Gender'
    end
    object TBirthday: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Birthday'
    end
    object TComment: TWideStringField
      DisplayWidth = 306
      FieldName = 'Comment'
      Size = 255
    end
    object TDescription: TWideStringField
      DisplayWidth = 306
      FieldName = 'Description'
      Size = 255
    end
    object TCustom1: TWideStringField
      DisplayWidth = 306
      FieldName = 'Custom1'
      Size = 255
    end
    object TCustom2: TWideStringField
      DisplayWidth = 306
      FieldName = 'Custom2'
      Size = 255
    end
    object TCustom3: TWideStringField
      DisplayWidth = 306
      FieldName = 'Custom3'
      Size = 255
    end
    object TCustom4: TWideStringField
      DisplayWidth = 306
      FieldName = 'Custom4'
      Size = 255
    end
    object TCustom5: TWideStringField
      DisplayWidth = 306
      FieldName = 'Custom5'
      Size = 255
    end
    object TCustom6: TWideStringField
      DisplayWidth = 306
      FieldName = 'Custom6'
      Size = 255
    end
  end
end
