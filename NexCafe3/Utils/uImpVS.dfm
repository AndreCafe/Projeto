object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar TXT - Mega Rede'
  ClientHeight = 429
  ClientWidth = 739
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
    Top = 413
    Width = 739
    Height = 16
    Align = alBottom
    TabOrder = 0
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 41
    Width = 739
    Height = 372
    ActivePage = cxTabSheet1
    Align = alClient
    TabOrder = 1
    ClientRectBottom = 372
    ClientRectRight = 739
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 739
        Height = 348
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 739
        Height = 259
        Align = alClient
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 259
        Width = 739
        Height = 89
        Align = alBottom
        DataField = 'PW'
        DataSource = DataSource2
        TabOrder = 1
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'cxTabSheet3'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 41
        Width = 739
        Height = 307
        Align = alClient
        DataSource = DataSource3
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 739
        Height = 41
        Align = alTop
        TabOrder = 1
        object cbTab: TComboBox
          Left = 8
          Top = 8
          Width = 257
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'cbTab'
        end
        object btnABre: TButton
          Left = 280
          Top = 10
          Width = 75
          Height = 25
          Caption = 'btnABre'
          TabOrder = 1
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 41
    Align = alTop
    TabOrder = 2
    object Button1: TButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
    object cbZerar: TCheckBox
      Left = 244
      Top = 13
      Width = 177
      Height = 17
      Caption = 'Zerar tabela atual de clientes'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object nxSession1: TnxSession
    ServerEngine = nxSE
    Left = 288
    Top = 336
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexcafe3\dados'
    Left = 328
    Top = 336
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    Exclusive = True
    IndexName = 'IID'
    Left = 408
    Top = 336
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
    Left = 368
    Top = 336
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    Left = 448
    Top = 336
  end
  object DataSource1: TDataSource
    Left = 32
    Top = 88
  end
  object DataSource2: TDataSource
    Left = 96
    Top = 96
  end
  object DataSource3: TDataSource
    Left = 184
    Top = 104
  end
  object dbI: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexcafe'
    Left = 328
    Top = 256
  end
  object tRG: TnxTable
    ActiveRuntime = True
    Database = dbI
    TableName = 'IDENTFPESS'
    Left = 200
    Top = 200
    object tRGIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
    end
    object tRGREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
  end
  object tDataNasc: TnxTable
    ActiveRuntime = True
    Database = dbI
    TableName = 'DATAPESSOA'
    Left = 232
    Top = 200
    object tDataNascIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
    end
    object tDataNascDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object tPessoa: TnxTable
    ActiveRuntime = True
    Database = dbI
    TableName = 'PESSOA'
    IndexName = 'Sequential Access Index'
    Left = 168
    Top = 200
    object tPessoaIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
    end
    object tPessoaNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 50
    end
    object tPessoaNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 50
    end
    object tPessoaTPPESSOA: TStringField
      FieldName = 'TPPESSOA'
      Size = 1
    end
    object tPessoaBINATIVA: TSmallintField
      FieldName = 'BINATIVA'
    end
    object tPessoaIDINC: TIntegerField
      FieldName = 'IDINC'
    end
    object tPessoaDHINC: TDateTimeField
      FieldName = 'DHINC'
    end
    object tPessoaIDALT: TIntegerField
      FieldName = 'IDALT'
    end
    object tPessoaDHALT: TDateTimeField
      FieldName = 'DHALT'
    end
  end
  object tLogin: TnxTable
    ActiveRuntime = True
    Database = dbI
    TableName = 'LOGIN'
    Left = 136
    Top = 200
    object tLoginIDLOGIN: TIntegerField
      FieldName = 'IDLOGIN'
    end
    object tLoginLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
  end
  object D: TDbf
    FilePath = 'C:\Meus Programas\NexCafe\'
    IndexDefs = <
      item
        IndexFile = 'CODIGOINDE'
        SortField = 'CODIGO'
        Options = [ixUnique, ixExpression]
      end>
    TableName = 'clientes.dbf'
    TableLevel = 4
    Left = 344
    Top = 120
    object DNOME: TStringField
      FieldName = 'NOME'
      Size = 24
    end
    object DUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 17
    end
    object DCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object DSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 7
    end
    object DTIPO: TStringField
      FieldName = 'TIPO'
      Size = 14
    end
    object DDEBITO: TStringField
      FieldName = 'DEBITO'
      Size = 10
    end
    object DCREDTEMPO: TStringField
      FieldName = 'CREDTEMPO'
      Size = 17
    end
    object DCREDVALOR: TStringField
      FieldName = 'CREDVALOR'
      Size = 13
    end
    object DPASSAPORTE: TStringField
      FieldName = 'PASSAPORTE'
      Size = 19
    end
    object DDATANASC: TDateField
      FieldName = 'DATANASC'
    end
    object DTUSADO: TStringField
      FieldName = 'TUSADO'
      Size = 11
    end
    object DSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
    object DRG: TStringField
      FieldName = 'RG'
      Size = 13
    end
    object DENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 22
    end
    object DBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 11
    end
    object DCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 18
    end
    object DUF: TStringField
      FieldName = 'UF'
      Size = 4
    end
    object DCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object DSEXO: TStringField
      FieldName = 'SEXO'
      Size = 5
    end
    object DEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 16
    end
    object DTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 12
    end
    object DESCOLA: TStringField
      FieldName = 'ESCOLA'
      Size = 25
    end
    object DNICKNAME: TStringField
      FieldName = 'NICKNAME'
      Size = 13
    end
    object DCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 11
    end
    object DDTINC: TDateField
      FieldName = 'DTINC'
    end
    object DLIMITEDEB: TStringField
      FieldName = 'LIMITEDEB'
      Size = 13
    end
    object DINCPOR: TStringField
      FieldName = 'INCPOR'
      Size = 9
    end
    object DALTERACAO: TDateField
      FieldName = 'ALTERACAO'
    end
    object DALTERADOPO: TStringField
      FieldName = 'ALTERADOPO'
      Size = 15
    end
    object DTITELEITOR: TStringField
      FieldName = 'TITELEITOR'
      Size = 13
    end
    object DPAI: TStringField
      FieldName = 'PAI'
      Size = 35
    end
    object DPDISP: TStringField
      FieldName = 'PDISP'
      Size = 13
    end
    object DPACUMULADO: TStringField
      FieldName = 'PACUMULADO'
      Size = 14
    end
    object DPRESG: TStringField
      FieldName = 'PRESG'
      Size = 14
    end
    object DMAE: TStringField
      FieldName = 'MAE'
      Size = 35
    end
  end
  object tSaldo: TnxTable
    Database = dbI
    TableName = 'SLDCLI'
    Left = 64
    Top = 120
    object tSaldoIDCLI: TIntegerField
      FieldName = 'IDCLI'
    end
    object tSaldoSLD: TCurrencyField
      FieldName = 'SLD'
    end
  end
end
