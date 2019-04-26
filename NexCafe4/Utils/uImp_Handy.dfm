object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o do HandyCaf'#233
  ClientHeight = 518
  ClientWidth = 1056
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
    Width = 1056
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
    Width = 1056
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
      Left = 95
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
    end
  end
  object PB: TProgressBar
    Left = 0
    Top = 49
    Width = 1056
    Height = 16
    Align = alTop
    TabOrder = 2
  end
  object DBMemo1: TDBMemo
    Left = 520
    Top = 312
    Width = 273
    Height = 89
    DataField = 'DAddress'
    DataSource = DataSource1
    TabOrder = 3
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
    SessionName = 'Default'
    Left = 104
    Top = 280
  end
  object Session1: TSession
    Active = True
    NetFileDir = 'C:\MEUS PROGRAMAS\NEXCAFE'
    SessionName = 'SessionBDE'
    Left = 272
    Top = 216
  end
  object Tab: TTable
    Active = True
    DatabaseName = 'c:\meus programas\nexcafe\handy'
    SessionName = 'SessionBDE'
    TableName = 'Customers.DB'
    Left = 136
    Top = 96
    object TabDUserName: TStringField
      FieldName = 'DUserName'
      Required = True
    end
    object TabDPassword: TStringField
      FieldName = 'DPassword'
    end
    object TabDFirstName: TStringField
      FieldName = 'DFirstName'
    end
    object TabDLastName: TStringField
      FieldName = 'DLastName'
    end
    object TabDPhone: TStringField
      FieldName = 'DPhone'
    end
    object TabDAddress: TMemoField
      FieldName = 'DAddress'
      BlobType = ftMemo
      Size = 1
    end
    object TabDEmail: TStringField
      FieldName = 'DEmail'
      Size = 25
    end
    object TabDUsedTime: TIntegerField
      FieldName = 'DUsedTime'
    end
    object TabDRemainTime: TIntegerField
      FieldName = 'DRemainTime'
    end
    object TabDPicture: TGraphicField
      FieldName = 'DPicture'
      BlobType = ftGraphic
      Size = 1
    end
    object TabDCreateDate: TDateField
      FieldName = 'DCreateDate'
    end
    object TabDActive: TBooleanField
      FieldName = 'DActive'
    end
    object TabDBytesReceived: TFloatField
      FieldName = 'DBytesReceived'
    end
    object TabDBytesSent: TFloatField
      FieldName = 'DBytesSent'
    end
    object TabDWeb: TStringField
      FieldName = 'DWeb'
      Size = 50
    end
    object TabDMemo: TMemoField
      FieldName = 'DMemo'
      BlobType = ftMemo
      Size = 1
    end
    object TabDExpireDate: TDateField
      FieldName = 'DExpireDate'
    end
    object TabDDebt: TCurrencyField
      FieldName = 'DDebt'
    end
    object TabDLastUsed: TIntegerField
      FieldName = 'DLastUsed'
    end
    object TabDLastRecv: TFloatField
      FieldName = 'DLastRecv'
    end
    object TabDLastSent: TFloatField
      FieldName = 'DLastSent'
    end
    object TabDDiscount: TFloatField
      FieldName = 'DDiscount'
    end
    object TabDMemberPrice: TCurrencyField
      FieldName = 'DMemberPrice'
    end
    object TabDPriceType: TSmallintField
      FieldName = 'DPriceType'
    end
    object TabDAccountType: TSmallintField
      FieldName = 'DAccountType'
    end
    object TabDMemberType: TIntegerField
      FieldName = 'DMemberType'
    end
    object TabDTicketId: TFloatField
      FieldName = 'DTicketId'
    end
  end
end
