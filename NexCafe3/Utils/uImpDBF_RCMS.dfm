object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar DBF'
  ClientHeight = 383
  ClientWidth = 718
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
    Width = 718
    Height = 16
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 629
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
    Width = 718
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
    FilePath = 'C:\Meus Programas\NexCafe\'
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
      end
      item
        IndexFile = 'INTCLIID'
        SortField = 'ICLIID'
        Options = [ixExpression]
      end
      item
        IndexFile = 'INTTIPID'
        SortField = 'IGCID'
        Options = [ixExpression]
      end>
    TableName = 'TCliente.DBF'
    Active = True
    Left = 144
    Top = 136
    object TFICLIID: TFloatField
      DisplayWidth = 12
      FieldName = 'ICLIID'
    end
    object TFICODIGO: TFloatField
      DisplayWidth = 12
      FieldName = 'ICODIGO'
    end
    object TFIGCID: TFloatField
      DisplayWidth = 12
      FieldName = 'IGCID'
    end
    object TFSNOME: TStringField
      DisplayWidth = 120
      FieldName = 'SNOME'
      Size = 100
    end
    object TFSNICK: TStringField
      DisplayWidth = 36
      FieldName = 'SNICK'
      Size = 30
    end
    object TFSSENHA: TStringField
      DisplayWidth = 19
      FieldName = 'SSENHA'
      Size = 16
    end
    object TFSRG: TStringField
      DisplayWidth = 60
      FieldName = 'SRG'
      Size = 50
    end
    object TFSCPF: TStringField
      DisplayWidth = 60
      FieldName = 'SCPF'
      Size = 50
    end
    object TFMCREDITO: TFloatField
      DisplayWidth = 12
      FieldName = 'MCREDITO'
    end
    object TFDCREDITO: TDateField
      DisplayWidth = 18
      FieldName = 'DCREDITO'
    end
    object TFDCADASTRO: TDateField
      DisplayWidth = 13
      FieldName = 'DCADASTRO'
    end
    object TFIUSUID: TFloatField
      DisplayWidth = 12
      FieldName = 'IUSUID'
    end
    object TFSEMAIL: TStringField
      DisplayWidth = 120
      FieldName = 'SEMAIL'
      Size = 100
    end
    object TFDNASCIMENT: TDateField
      DisplayWidth = 18
      FieldName = 'DNASCIMENT'
    end
    object TFSENDERECO: TStringField
      DisplayWidth = 120
      FieldName = 'SENDERECO'
      Size = 100
    end
    object TFSFONE: TStringField
      DisplayWidth = 30
      FieldName = 'SFONE'
      Size = 25
    end
    object TFSOBS: TMemoField
      DisplayWidth = 12
      FieldName = 'SOBS'
      BlobType = ftMemo
    end
    object TFBATIVO: TBooleanField
      DisplayWidth = 8
      FieldName = 'BATIVO'
    end
    object TFDINATIVACA: TDateField
      DisplayWidth = 13
      FieldName = 'DINATIVACA'
    end
    object TFBAVISO: TBooleanField
      DisplayWidth = 8
      FieldName = 'BAVISO'
    end
    object TFBCUSTO: TBooleanField
      DisplayWidth = 8
      FieldName = 'BCUSTO'
    end
    object TFBAUTORIZAC: TBooleanField
      DisplayWidth = 13
      FieldName = 'BAUTORIZAC'
    end
    object TFBLOGAR: TBooleanField
      DisplayWidth = 8
      FieldName = 'BLOGAR'
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
    object TFSCEP: TStringField
      DisplayWidth = 10
      FieldName = 'SCEP'
      Size = 8
    end
    object TFSNUMERO: TStringField
      DisplayWidth = 12
      FieldName = 'SNUMERO'
      Size = 10
    end
    object TFSCOMPLEMEN: TStringField
      DisplayWidth = 120
      FieldName = 'SCOMPLEMEN'
      Size = 100
    end
    object TFSBAIRRO: TStringField
      DisplayWidth = 120
      FieldName = 'SBAIRRO'
      Size = 100
    end
    object TFSCIDADE: TStringField
      DisplayWidth = 120
      FieldName = 'SCIDADE'
      Size = 100
    end
    object TFSESTADO: TStringField
      DisplayWidth = 60
      FieldName = 'SESTADO'
      Size = 50
    end
    object TFITURNOID: TFloatField
      DisplayWidth = 12
      FieldName = 'ITURNOID'
    end
    object TFSESCOLA: TStringField
      DisplayWidth = 240
      FieldName = 'SESCOLA'
      Size = 200
    end
    object TFDINICIOAUL: TDateField
      DisplayWidth = 12
      FieldName = 'DINICIOAUL'
    end
    object TFDFINALAULA: TDateField
      DisplayWidth = 13
      FieldName = 'DFINALAULA'
    end
  end
  object DataSource1: TDataSource
    DataSet = TF
    Left = 360
    Top = 80
  end
end
