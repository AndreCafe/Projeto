object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar DBF'
  ClientHeight = 383
  ClientWidth = 1001
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
    Width = 1001
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
    Top = 198
    Width = 1001
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
    Left = 248
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
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
    Left = 104
    Top = 24
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
    Left = 64
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = Q
    Left = 360
    Top = 80
  end
  object tF: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TCliente'
    Left = 168
    Top = 104
    object tFiCliID: TAutoIncField
      FieldName = 'iCliID'
      ReadOnly = True
    end
    object tFiCodigo: TIntegerField
      FieldName = 'iCodigo'
    end
    object tFiGCID: TIntegerField
      FieldName = 'iGCID'
    end
    object tFsNome: TWideStringField
      FieldName = 'sNome'
      Size = 100
    end
    object tFsNick: TWideStringField
      FieldName = 'sNick'
      Size = 30
    end
    object tFsSenha: TWideStringField
      FieldName = 'sSenha'
      Size = 16
    end
    object tFsRG: TWideStringField
      FieldName = 'sRG'
      Size = 50
    end
    object tFsCPF: TWideStringField
      FieldName = 'sCPF'
      Size = 50
    end
    object tFmCredito: TBCDField
      FieldName = 'mCredito'
      Precision = 19
    end
    object tFdCredito: TDateTimeField
      FieldName = 'dCredito'
    end
    object tFdCadastro: TDateTimeField
      FieldName = 'dCadastro'
    end
    object tFiUsuID: TIntegerField
      FieldName = 'iUsuID'
    end
    object tFsEmail: TWideStringField
      FieldName = 'sEmail'
      Size = 100
    end
    object tFdNascimento: TDateTimeField
      FieldName = 'dNascimento'
    end
    object tFsEndereco: TWideStringField
      FieldName = 'sEndereco'
      Size = 100
    end
    object tFsFone: TWideStringField
      FieldName = 'sFone'
      Size = 25
    end
    object tFsObs: TWideMemoField
      FieldName = 'sObs'
      BlobType = ftWideMemo
    end
    object tFbAtivo: TBooleanField
      FieldName = 'bAtivo'
    end
    object tFdInativacao: TDateTimeField
      FieldName = 'dInativacao'
    end
    object tFbAviso: TBooleanField
      FieldName = 'bAviso'
    end
    object tFbCusto: TBooleanField
      FieldName = 'bCusto'
    end
    object tFbAutorizacao: TBooleanField
      FieldName = 'bAutorizacao'
    end
    object tFbLogar: TBooleanField
      FieldName = 'bLogar'
    end
    object tFsPai: TWideStringField
      FieldName = 'sPai'
      Size = 100
    end
    object tFsMae: TWideStringField
      FieldName = 'sMae'
      Size = 100
    end
    object tFsCEP: TWideStringField
      FieldName = 'sCEP'
      Size = 8
    end
    object tFsNumero: TWideStringField
      FieldName = 'sNumero'
      Size = 10
    end
    object tFsComplemento: TWideStringField
      FieldName = 'sComplemento'
      Size = 100
    end
    object tFsBairro: TWideStringField
      FieldName = 'sBairro'
      Size = 100
    end
    object tFsCidade: TWideStringField
      FieldName = 'sCidade'
      Size = 100
    end
    object tFsEstado: TWideStringField
      FieldName = 'sEstado'
      Size = 50
    end
    object tFiTurnoID: TIntegerField
      FieldName = 'iTurnoID'
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Meus Programas\N' +
      'exCafe\dbman.mdb;Mode=Share Deny None;Persist Security Info=Fals' +
      'e;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OL' +
      'EDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Datab' +
      'ase Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB' +
      ':Global Bulk Transactions=1;Jet OLEDB:New Database Password="";J' +
      'et OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database' +
      '=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Co' +
      'mpact Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 608
    Top = 88
  end
  object Q: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from log'
      'where slogin = '#39'namorada'#39)
    Left = 552
    Top = 128
    object QsLogin: TWideStringField
      DisplayWidth = 23
      FieldName = 'sLogin'
      Size = 50
    end
    object QsSenha: TWideStringField
      DisplayWidth = 34
      FieldName = 'sSenha'
      Size = 50
    end
    object QdData: TDateTimeField
      DisplayWidth = 22
      FieldName = 'dData'
    end
    object QobjMaquina: TIntegerField
      DisplayWidth = 12
      FieldName = 'objMaquina'
    end
    object QiStatus: TIntegerField
      DisplayWidth = 12
      FieldName = 'iStatus'
    end
    object QsTempo: TWideStringField
      DisplayWidth = 60
      FieldName = 'sTempo'
      Size = 50
    end
  end
end
