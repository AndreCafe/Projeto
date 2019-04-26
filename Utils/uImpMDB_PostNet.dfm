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
    ExplicitTop = 13
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
      'excafe\clientes.mdb;Mode=Read;Jet OLEDB:System database="";Jet O' +
      'LEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:E' +
      'ngine Type=5;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global ' +
      'Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLED' +
      'B:New Database Password="";Jet OLEDB:Create System Database=Fals' +
      'e;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale o' +
      'n Compact=False;Jet OLEDB:Compact Without Replica Repair=False;J' +
      'et OLEDB:SFP=False;Jet OLEDB:Support Complex Data=False;Jet OLED' +
      'B:Bypass UserInfo Validation=False;'
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
    TableName = 'Clientes'
    Left = 352
    Top = 344
    object TFCod: TIntegerField
      DisplayWidth = 12
      FieldName = 'C'#243'digo'
    end
    object TFNumero: TAutoIncField
      DisplayWidth = 12
      FieldName = 'N'#250'mero'
      ReadOnly = True
    end
    object TFNome: TWideStringField
      DisplayWidth = 50
      FieldName = 'Nome Do Cliente'
      Size = 75
    end
    object TFRG: TWideStringField
      DisplayWidth = 16
      FieldName = 'N'#250'mero Do RG'
      Size = 30
    end
    object TFEnd: TWideStringField
      DisplayWidth = 306
      FieldName = 'Endere'#231'o'
      Size = 255
    end
    object tFBairro: TWideStringField
      DisplayWidth = 60
      FieldName = 'Bairro'
      Size = 50
    end
    object tFCidade: TWideStringField
      DisplayWidth = 32
      FieldName = 'Cidade'
      Size = 50
    end
    object tFEstado: TWideStringField
      DisplayWidth = 306
      FieldName = 'Estado'
      Size = 255
    end
    object tFCEP: TWideStringField
      DisplayWidth = 24
      FieldName = 'CEP'
    end
    object tFTelefone: TWideStringField
      DisplayWidth = 36
      FieldName = 'Telefone'
      Size = 30
    end
    object tFCelular: TWideStringField
      DisplayWidth = 36
      FieldName = 'Celular'
      Size = 30
    end
    object tFDataNasc: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Data Nasc'
    end
    object tFDataCadastro: TDateTimeField
      DisplayWidth = 22
      FieldName = 'Data Cadastro'
    end
    object tFObs: TWideMemoField
      DisplayWidth = 13
      FieldName = 'Observa'#231#245'es'
      BlobType = ftWideMemo
    end
    object tFEmail: TWideStringField
      DisplayWidth = 60
      FieldName = 'E-mail'
      Size = 50
    end
    object TFEscola: TWideStringField
      DisplayWidth = 60
      FieldName = 'Nome da Escola'
      Size = 50
    end
    object tFTurno: TWideStringField
      DisplayWidth = 24
      FieldName = 'Turno'
    end
  end
end
