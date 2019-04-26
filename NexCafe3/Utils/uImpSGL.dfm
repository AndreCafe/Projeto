object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar DBF'
  ClientHeight = 489
  ClientWidth = 849
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
    Width = 849
    Height = 16
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 629
  end
  object Button1: TButton
    Left = 0
    Top = 16
    Width = 849
    Height = 25
    Align = alTop
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitLeft = 168
    ExplicitTop = 54
    ExplicitWidth = 75
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 849
    Height = 448
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
    DataSet = IBTable1
    Left = 192
    Top = 168
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Meus Programas\NexCafe\Dados_Clientes\sgl\Sgl.gdb'
    Params.Strings = (
      'user_name=sysdba')
    SQLDialect = 1
    Left = 368
    Top = 120
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'LOGIN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DATANASC'
        DataType = ftDateTime
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NUM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COMPL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DATACAD'
        DataType = ftDateTime
      end
      item
        Name = 'NIVEL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'STATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EDITAR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCONTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TEMPODESCONTO'
        DataType = ftInteger
      end
      item
        Name = 'OBS'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'FOTO'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'TEMPOJOGO'
        DataType = ftInteger
      end
      item
        Name = 'MONETARIO'
        DataType = ftFloat
      end
      item
        Name = 'TEMPOCOMPRADO'
        DataType = ftInteger
      end
      item
        Name = 'CODBARRA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CELULAR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TIPOCLIENTE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ATIVO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BILHETE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RG'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ICQ'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'EMAIL2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ESTUDANTE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SERIE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PERIODO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ESCOLA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DEL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMPRIMIU'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOTE'
        DataType = ftInteger
      end
      item
        Name = 'VALORBILHETE'
        DataType = ftFloat
      end
      item
        Name = 'NOMEPAI'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOMEMAE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'HORAINI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'HORAFIM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DATAGANHOUVIP'
        DataType = ftDateTime
      end
      item
        Name = 'BONUSVALOR'
        DataType = ftFloat
      end
      item
        Name = 'LIMITECREDITO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CLIENTES_COD'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'CLIENTES_LOGIN'
        Fields = 'LOGIN'
      end
      item
        Name = 'CLIENTES_NOME'
        Fields = 'NOME'
      end>
    StoreDefs = True
    TableName = 'CLIENTES'
    Left = 448
    Top = 56
    object IBTable1CODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object IBTable1LOGIN: TIBStringField
      FieldName = 'LOGIN'
      Size = 15
    end
    object IBTable1SENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object IBTable1NOME: TIBStringField
      FieldName = 'NOME'
      Size = 40
    end
    object IBTable1DATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object IBTable1ENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object IBTable1NUM: TIBStringField
      FieldName = 'NUM'
      Size = 5
    end
    object IBTable1COMPL: TIBStringField
      FieldName = 'COMPL'
    end
    object IBTable1BAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object IBTable1CEP: TIBStringField
      FieldName = 'CEP'
      Size = 9
    end
    object IBTable1CIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object IBTable1UF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object IBTable1DATACAD: TDateTimeField
      FieldName = 'DATACAD'
    end
    object IBTable1NIVEL: TIBStringField
      FieldName = 'NIVEL'
      Size = 1
    end
    object IBTable1EMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object IBTable1STATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object IBTable1EDITAR: TIBStringField
      FieldName = 'EDITAR'
      Size = 1
    end
    object IBTable1TIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 15
    end
    object IBTable1DESCONTO: TIBStringField
      FieldName = 'DESCONTO'
      Size = 5
    end
    object IBTable1TEMPODESCONTO: TIntegerField
      FieldName = 'TEMPODESCONTO'
    end
    object IBTable1OBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object IBTable1FOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object IBTable1TEMPOJOGO: TIntegerField
      FieldName = 'TEMPOJOGO'
    end
    object IBTable1MONETARIO: TFloatField
      FieldName = 'MONETARIO'
    end
    object IBTable1TEMPOCOMPRADO: TIntegerField
      FieldName = 'TEMPOCOMPRADO'
    end
    object IBTable1CODBARRA: TIBStringField
      FieldName = 'CODBARRA'
    end
    object IBTable1FONE: TIBStringField
      FieldName = 'FONE'
      Size = 15
    end
    object IBTable1CELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object IBTable1TIPOCLIENTE: TIBStringField
      FieldName = 'TIPOCLIENTE'
    end
    object IBTable1ATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBTable1BILHETE: TIBStringField
      FieldName = 'BILHETE'
      Size = 1
    end
    object IBTable1RG: TIBStringField
      FieldName = 'RG'
    end
    object IBTable1CPF: TIBStringField
      FieldName = 'CPF'
    end
    object IBTable1ICQ: TIBStringField
      FieldName = 'ICQ'
      Size = 10
    end
    object IBTable1EMAIL2: TIBStringField
      FieldName = 'EMAIL2'
      Size = 30
    end
    object IBTable1ESTUDANTE: TIBStringField
      FieldName = 'ESTUDANTE'
      Size = 1
    end
    object IBTable1SERIE: TIBStringField
      FieldName = 'SERIE'
    end
    object IBTable1PERIODO: TIBStringField
      FieldName = 'PERIODO'
      Size = 10
    end
    object IBTable1ESCOLA: TIBStringField
      FieldName = 'ESCOLA'
      Size = 30
    end
    object IBTable1DEL: TIBStringField
      FieldName = 'DEL'
      Size = 1
    end
    object IBTable1IMPRIMIU: TIBStringField
      FieldName = 'IMPRIMIU'
      Size = 1
    end
    object IBTable1LOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object IBTable1VALORBILHETE: TFloatField
      FieldName = 'VALORBILHETE'
    end
    object IBTable1NOMEPAI: TIBStringField
      FieldName = 'NOMEPAI'
      Size = 40
    end
    object IBTable1NOMEMAE: TIBStringField
      FieldName = 'NOMEMAE'
      Size = 40
    end
    object IBTable1HORAINI: TIBStringField
      FieldName = 'HORAINI'
      Size = 5
    end
    object IBTable1HORAFIM: TIBStringField
      FieldName = 'HORAFIM'
      Size = 5
    end
    object IBTable1DATAGANHOUVIP: TDateTimeField
      FieldName = 'DATAGANHOUVIP'
    end
    object IBTable1BONUSVALOR: TFloatField
      FieldName = 'BONUSVALOR'
    end
    object IBTable1LIMITECREDITO: TFloatField
      FieldName = 'LIMITECREDITO'
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 392
    Top = 56
  end
end
