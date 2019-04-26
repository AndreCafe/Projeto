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
  object TF: TDbf
    FilePath = 'C:\meus programas\nexcafe\'
    Indexes = <
      item
        IndexFile = 'CARD'
        SortField = 'CARD'
        Options = [ixExpression]
      end
      item
        IndexFile = 'DATE'
        SortField = 'DATE'
        Options = [ixExpression]
      end
      item
        IndexFile = 'GRADE'
        SortField = 'GRADE'
        Options = [ixExpression]
      end
      item
        IndexFile = 'ID'
        SortField = 'ID'
        Options = [ixUnique, ixExpression]
      end
      item
        IndexFile = 'JUMINID'
        SortField = 'JUMINID'
        Options = [ixExpression]
      end
      item
        IndexFile = 'LASTMODIFI'
        SortField = 'LASTMODIFI'
        Options = [ixExpression]
      end
      item
        IndexFile = 'MILEAGE'
        SortField = 'MILEAGE'
        Options = [ixExpression]
      end
      item
        IndexFile = 'MUG'
        SortField = 'MUG'
        Options = [ixExpression]
      end
      item
        IndexFile = 'NAME'
        SortField = 'NAME'
        Options = [ixExpression]
      end
      item
        IndexFile = 'PRIMARYKEY'
        SortField = 'UID'
        Options = [ixUnique, ixExpression]
      end
      item
        IndexFile = 'USEDMILEAG'
        SortField = 'USEDMILEAG'
        Options = [ixExpression]
      end
      item
        IndexFile = 'USERID'
        SortField = 'USERID'
        Options = [ixUnique, ixExpression]
      end
      item
        IndexFile = 'IDIASVALID'
        SortField = 'IDIAS'
        Options = [ixExpression]
      end>
    TableName = 'Usuarios.DBF'
    Active = True
    Left = 168
    Top = 184
    object TFOBJUSUARIO: TFloatField
      DisplayWidth = 13
      FieldName = 'OBJUSUARIO'
    end
    object TFSLOGIN: TStringField
      DisplayWidth = 16
      FieldName = 'SLOGIN'
    end
    object TFSNOME: TStringField
      DisplayWidth = 18
      FieldName = 'SNOME'
      Size = 15
    end
    object TFSSOBRENOME: TStringField
      DisplayWidth = 24
      FieldName = 'SSOBRENOME'
      Size = 50
    end
    object TFSENDERECO: TStringField
      DisplayWidth = 34
      FieldName = 'SENDERECO'
      Size = 100
    end
    object TFSBAIRRO: TStringField
      DisplayWidth = 60
      FieldName = 'SBAIRRO'
      Size = 50
    end
    object TFSCIDADE: TStringField
      DisplayWidth = 60
      FieldName = 'SCIDADE'
      Size = 50
    end
    object TFICEP: TFloatField
      DisplayWidth = 12
      FieldName = 'ICEP'
    end
    object TFSSENHA: TStringField
      DisplayWidth = 12
      FieldName = 'SSENHA'
      Size = 10
    end
    object TFDCADASTRO: TDateField
      DisplayWidth = 17
      FieldName = 'DCADASTRO'
    end
    object TFITELEFONED: TFloatField
      DisplayWidth = 18
      FieldName = 'ITELEFONED'
    end
    object TFITELEFONE: TFloatField
      DisplayWidth = 12
      FieldName = 'ITELEFONE'
    end
    object TFBSTATUS: TBooleanField
      DisplayWidth = 9
      FieldName = 'BSTATUS'
    end
    object TFIACESSOS: TFloatField
      DisplayWidth = 12
      FieldName = 'IACESSOS'
    end
    object TFMDEBITO: TFloatField
      DisplayWidth = 12
      FieldName = 'MDEBITO'
    end
    object TFSOBS: TMemoField
      DisplayWidth = 12
      FieldName = 'SOBS'
      BlobType = ftMemo
    end
    object TFSEMAIL: TStringField
      DisplayWidth = 60
      FieldName = 'SEMAIL'
      Size = 50
    end
    object TFBCORTESIA: TBooleanField
      DisplayWidth = 12
      FieldName = 'BCORTESIA'
    end
    object TFBPOSPAGO: TBooleanField
      DisplayWidth = 11
      FieldName = 'BPOSPAGO'
    end
    object TFBTICKET: TBooleanField
      DisplayWidth = 8
      FieldName = 'BTICKET'
    end
    object TFIDIAS: TFloatField
      DisplayWidth = 12
      FieldName = 'IDIAS'
    end
    object TFIDESC: TFloatField
      DisplayWidth = 12
      FieldName = 'IDESC'
    end
    object TFMVALORDIF: TFloatField
      DisplayWidth = 12
      FieldName = 'MVALORDIF'
    end
    object TFSIDENTIDAD: TStringField
      DisplayWidth = 24
      FieldName = 'SIDENTIDAD'
    end
    object TFDDATANASC: TDateField
      DisplayWidth = 12
      FieldName = 'DDATANASC'
    end
    object TFOBJFUNCION: TFloatField
      DisplayWidth = 13
      FieldName = 'OBJFUNCION'
    end
    object TFBLOCKUSER: TBooleanField
      DisplayWidth = 12
      FieldName = 'BLOCKUSER'
    end
    object TFSPAI: TStringField
      DisplayWidth = 120
      FieldName = 'SPAI'
      Size = 100
    end
    object TFSMAE: TStringField
      DisplayWidth = 120
      FieldName = 'SMAE'
      Size = 100
    end
    object TFSESCOLA: TStringField
      DisplayWidth = 120
      FieldName = 'SESCOLA'
      Size = 100
    end
    object TFSHORARIO1: TStringField
      DisplayWidth = 12
      FieldName = 'SHORARIO1'
      Size = 8
    end
    object TFSHORARIO2: TStringField
      DisplayWidth = 12
      FieldName = 'SHORARIO2'
      Size = 8
    end
  end
  object DataSource1: TDataSource
    DataSet = TF
    Left = 360
    Top = 80
  end
end
