object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar VS'
  ClientHeight = 429
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
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
    ActivePage = cxTabSheet3
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
      Visible = False
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
    AliasPath = 'c:\meus programas\nexcafe\dados'
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
    Left = 368
    Top = 336
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
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
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 448
    Top = 144
  end
  object tLogin: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'IDLOGIN'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LOGIN'
        Attributes = [faRequired]
        DataType = ftString
        Size = 32
      end
      item
        Name = 'PW'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'FLAGS'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'LOGIN_PK'
        Fields = 'IDLOGIN'
        Options = [ixUnique]
      end
      item
        Name = 'LOGIN_AK1'
        Fields = 'LOGIN'
        Options = [ixUnique]
      end
      item
        Name = 'PESSOA_LOGIN'
        Fields = 'IDLOGIN'
      end>
    StoreDefs = True
    TableName = 'LOGIN'
    Left = 520
    Top = 88
    object tLoginIDLOGIN: TIntegerField
      FieldName = 'IDLOGIN'
      Required = True
    end
    object tLoginLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Required = True
      Size = 32
    end
    object tLoginPW: TBlobField
      FieldName = 'PW'
      Size = 8
    end
    object tLoginFLAGS: TIntegerField
      FieldName = 'FLAGS'
    end
  end
  object tPessoa: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMEFANTASIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMECOMPLETO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TPPESSOA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BINATIVA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'IDINC'
        DataType = ftInteger
      end
      item
        Name = 'DHINC'
        DataType = ftDateTime
      end
      item
        Name = 'IDALT'
        DataType = ftInteger
      end
      item
        Name = 'DHALT'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'PESSOA_PK'
        Fields = 'IDPESSOA'
        Options = [ixUnique]
      end
      item
        Name = 'PESSOA_IE1'
        Fields = 'NOMEFANTASIA'
      end>
    StoreDefs = True
    TableName = 'PESSOA'
    Left = 560
    Top = 88
    object tPessoaIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object tPessoaNOMEFANTASIA: TIBStringField
      FieldName = 'NOMEFANTASIA'
      Required = True
    end
    object tPessoaNOMECOMPLETO: TIBStringField
      FieldName = 'NOMECOMPLETO'
      Size = 50
    end
    object tPessoaTPPESSOA: TIBStringField
      FieldName = 'TPPESSOA'
      Required = True
      Size = 1
    end
    object tPessoaBINATIVA: TSmallintField
      FieldName = 'BINATIVA'
      Required = True
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
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'localhost:C:\Arquivos de programas\Firebird\Firebird_1_5\bin\VSC' +
      'YBER.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 464
    Top = 208
  end
  object tDataNasc: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'IDDTPESSOA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IDPESSOA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SITPDATA'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end
      item
        Name = 'IDINC'
        DataType = ftInteger
      end
      item
        Name = 'DHINC'
        DataType = ftDateTime
      end
      item
        Name = 'IDALT'
        DataType = ftInteger
      end
      item
        Name = 'DHALT'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'PESSOA_PK'
        Fields = 'IDPESSOA'
        Options = [ixUnique]
      end
      item
        Name = 'PESSOA_IE1'
        Fields = 'NOMEFANTASIA'
      end>
    StoreDefs = True
    TableName = 'DATAPESSOA'
    Left = 600
    Top = 88
    object tDataNascIDDTPESSOA: TIntegerField
      FieldName = 'IDDTPESSOA'
      Required = True
    end
    object tDataNascIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object tDataNascSITPDATA: TIntegerField
      FieldName = 'SITPDATA'
    end
    object tDataNascDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object tDataNascIDINC: TIntegerField
      FieldName = 'IDINC'
    end
    object tDataNascDHINC: TDateTimeField
      FieldName = 'DHINC'
    end
    object tDataNascIDALT: TIntegerField
      FieldName = 'IDALT'
    end
    object tDataNascDHALT: TDateTimeField
      FieldName = 'DHALT'
    end
  end
  object tRG: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'IDIDENTFPESS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IDPESSOA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SITPIDENTF'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'IDINC'
        DataType = ftInteger
      end
      item
        Name = 'DHINC'
        DataType = ftDateTime
      end
      item
        Name = 'IDALT'
        DataType = ftInteger
      end
      item
        Name = 'DHALT'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'PESSOA_PK'
        Fields = 'IDPESSOA'
        Options = [ixUnique]
      end
      item
        Name = 'PESSOA_IE1'
        Fields = 'NOMEFANTASIA'
      end>
    StoreDefs = True
    TableName = 'IDENTFPESS'
    Left = 640
    Top = 88
    object tRGIDIDENTFPESS: TIntegerField
      FieldName = 'IDIDENTFPESS'
      Required = True
    end
    object tRGIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object tRGSITPIDENTF: TIntegerField
      FieldName = 'SITPIDENTF'
      Required = True
    end
    object tRGREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Size = 64
    end
    object tRGIDINC: TIntegerField
      FieldName = 'IDINC'
    end
    object tRGDHINC: TDateTimeField
      FieldName = 'DHINC'
    end
    object tRGIDALT: TIntegerField
      FieldName = 'IDALT'
    end
    object tRGDHALT: TDateTimeField
      FieldName = 'DHALT'
    end
  end
  object tSaldo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'IDCLI'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SLD'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 4
      end>
    IndexDefs = <
      item
        Name = 'PESSOA_PK'
        Fields = 'IDPESSOA'
        Options = [ixUnique]
      end
      item
        Name = 'PESSOA_IE1'
        Fields = 'NOMEFANTASIA'
      end>
    StoreDefs = True
    TableName = 'SLDCLI'
    Left = 528
    Top = 144
    object tSaldoIDCLI: TIntegerField
      FieldName = 'IDCLI'
      Required = True
    end
    object tSaldoSLD: TIBBCDField
      FieldName = 'SLD'
      Required = True
      Precision = 18
      Size = 4
    end
  end
end
