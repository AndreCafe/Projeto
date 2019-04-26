object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'VS para NexCaf'#233
  ClientHeight = 435
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 311
    Height = 13
    Caption = 'Importar dados de clientes do VS Cyber para o NexCaf'#233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 90
    Width = 303
    Height = 13
    Caption = 'Nome, Username, Cr'#233'dito de Tempo, Data de Nascimento e RG'
  end
  object Label3: TLabel
    Left = 24
    Top = 71
    Width = 90
    Height = 13
    Caption = 'Dados importados:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 127
    Width = 254
    Height = 13
    Caption = 'Aten'#231#227'o:  a senha do cliente n'#227'o '#233' importada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 146
    Width = 353
    Height = 46
    AutoSize = False
    Caption = 
      'No primeiro acesso do seu cliente com o novo sistema (NexCaf'#233') s' +
      'olicite que ele fa'#231'a login deixando a senha em branco e o pr'#243'pri' +
      'o sistema vai solicitar que ele crie uma nova senha.'
    WordWrap = True
  end
  object lbImp: TLabel
    Left = 24
    Top = 376
    Width = 265
    Height = 25
    Caption = 'Importando. Aguarde . . .'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 42
    Top = 245
    Width = 321
    Height = 59
    AutoSize = False
    Caption = 
      'Para evitar que um cliente entre na conta do outro (se souber se' +
      'u username) usando a senha em branco.'#13#10#13#10'Voc'#234' dever'#225' informar a ' +
      'cada cliente qual '#233' a senha dele.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label7: TLabel
    Left = 24
    Top = 38
    Width = 189
    Height = 13
    Caption = 'NexServ deve estar em execu'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 24
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Importar >>'
    TabOrder = 0
    OnClick = Button1Click
  end
  object cbSenhaAleat: TCheckBox
    Left = 24
    Top = 223
    Width = 345
    Height = 17
    Caption = 'Gerar uma senha aleat'#243'ria para os clientes. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    WordWrap = True
  end
  object nxSession1: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 432
    Top = 104
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 488
    Top = 96
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 560
    Top = 96
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
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 520
    Top = 96
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 408
    Top = 152
  end
  object tLogin: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
    UniDirectional = False
    Left = 376
    Top = 56
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
    BufferChunks = 1000
    CachedUpdates = False
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
    UniDirectional = False
    Left = 408
    Top = 56
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
    DatabaseName = '127.0.0.1/3050:C:\Nexcafe\VSCYBER.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 376
    Top = 96
  end
  object tDataNasc: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
        Name = 'DATAPESSOA_PK'
        Fields = 'IDDTPESSOA'
        Options = [ixUnique]
      end
      item
        Name = 'DATAPESSOA_AK1'
        Fields = 'SITPDATA;IDPESSOA'
        Options = [ixUnique]
      end
      item
        Name = 'TPDATA_DATAPESSOA'
        Fields = 'SITPDATA'
      end
      item
        Name = 'PESSOA_DATAPESSOA'
        Fields = 'IDPESSOA'
      end>
    StoreDefs = True
    TableName = 'DATAPESSOA'
    UniDirectional = False
    Left = 440
    Top = 56
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
    BufferChunks = 1000
    CachedUpdates = False
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
        Name = 'IDENTFPESS_PK'
        Fields = 'IDIDENTFPESS'
        Options = [ixUnique]
      end
      item
        Name = 'IDENTFPESS_AK1'
        Fields = 'IDPESSOA;SITPIDENTF'
        Options = [ixUnique]
      end
      item
        Name = 'PESSOA_IDENTFPESS'
        Fields = 'IDPESSOA'
      end
      item
        Name = 'TPIDENTF_IDENTFPESS'
        Fields = 'SITPIDENTF'
      end>
    StoreDefs = True
    TableName = 'IDENTFPESS'
    UniDirectional = False
    Left = 472
    Top = 56
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
    BufferChunks = 1000
    CachedUpdates = False
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
        Name = 'SLDCLI_PK'
        Fields = 'IDCLI'
        Options = [ixUnique]
      end
      item
        Name = 'CLI_SLDCLI'
        Fields = 'IDCLI'
      end>
    StoreDefs = True
    TableName = 'SLDCLI'
    UniDirectional = False
    Left = 504
    Top = 56
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
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 592
    Top = 96
  end
  object LMDSysInfo1: TLMDSysInfo
    Left = 184
    Top = 312
  end
  object OpenDlg: TOpenDialog
    FileName = 'C:\Nexcafe\VSCYBER.GDB'
    Filter = 'Banco de dados do VSCyber|vscyber.gdb; vscyber.fdb'
    InitialDir = 'C:\Arquivos de programas\Firebird\Firebird_1_5\bin'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Abrir arquivo VSCyber.GDB'
    Left = 224
    Top = 312
  end
  object tAd: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDPESSXFORMACNTT'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
      end
      item
        Name = 'IDFORMACNTT'
        DataType = ftInteger
      end
      item
        Name = 'REFERENCIA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IDLOCD'
        DataType = ftInteger
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
        Name = 'PESSXFORMACNTT_PK'
        Fields = 'IDPESSXFORMACNTT'
        Options = [ixUnique]
      end
      item
        Name = 'PESSXFORMACNTT_IE1'
        Fields = 'REFERENCIA'
      end
      item
        Name = 'LOCD_PESSXFORMACNTT'
        Fields = 'IDLOCD'
      end
      item
        Name = 'FORMACNTT_PESSXFORMACNTT'
        Fields = 'IDFORMACNTT'
      end
      item
        Name = 'PESSOA_PESSXFORMACNTT'
        Fields = 'IDPESSOA'
      end>
    StoreDefs = True
    TableName = 'PESSXFORMACNTT'
    UniDirectional = False
    Left = 536
    Top = 56
    object tAdIDPESSXFORMACNTT: TIntegerField
      FieldName = 'IDPESSXFORMACNTT'
      Required = True
    end
    object tAdIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
    end
    object tAdIDFORMACNTT: TIntegerField
      FieldName = 'IDFORMACNTT'
    end
    object tAdREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Required = True
      Size = 50
    end
    object tAdIDLOCD: TIntegerField
      FieldName = 'IDLOCD'
    end
    object tAdIDINC: TIntegerField
      FieldName = 'IDINC'
    end
    object tAdDHINC: TDateTimeField
      FieldName = 'DHINC'
    end
    object tAdIDALT: TIntegerField
      FieldName = 'IDALT'
    end
    object tAdDHALT: TDateTimeField
      FieldName = 'DHALT'
    end
  end
  object qLocD: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select  * from VLOCD')
    Left = 480
    Top = 224
    object qLocDIDLOCD: TIntegerField
      FieldName = 'IDLOCD'
      Origin = '"VLOCD"."IDLOCD"'
    end
    object qLocDESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"VLOCD"."ESTADO"'
      Size = 2
    end
    object qLocDNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"VLOCD"."NOME"'
      Size = 64
    end
    object qLocDDDD: TIntegerField
      FieldName = 'DDD'
      Origin = '"VLOCD"."DDD"'
    end
  end
  object tEnd: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDPESSXFORMACNTT'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IDBAIRRO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'ENDERECO_PK'
        Fields = 'IDPESSXFORMACNTT'
        Options = [ixUnique]
      end
      item
        Name = 'PESSXFORMACNTT_ENDERECO'
        Fields = 'IDPESSXFORMACNTT'
      end
      item
        Name = 'BAIRRO_ENDERECO'
        Fields = 'IDBAIRRO'
      end>
    StoreDefs = True
    TableName = 'ENDERECO'
    UniDirectional = False
    Left = 568
    Top = 56
    object tEndIDPESSXFORMACNTT: TIntegerField
      FieldName = 'IDPESSXFORMACNTT'
      Required = True
    end
    object tEndIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Required = True
    end
    object tEndCEP: TIBStringField
      FieldName = 'CEP'
      Size = 8
    end
  end
  object qBairro: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select  * from VBairro')
    Left = 544
    Top = 224
    object qBairroIDBAIRRO: TIntegerField
      FieldName = 'IDBAIRRO'
      Origin = '"VBAIRRO"."IDBAIRRO"'
    end
    object qBairroESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"VBAIRRO"."ESTADO"'
      Size = 2
    end
    object qBairroCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = '"VBAIRRO"."CIDADE"'
      Size = 64
    end
    object qBairroNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"VBAIRRO"."NOME"'
      Size = 64
    end
  end
  object tSexo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SEXO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'PESSOAFISICA_PK'
        Fields = 'IDPESSOA'
        Options = [ixUnique]
      end
      item
        Name = 'PESSOA_PESSOAFISICA'
        Fields = 'IDPESSOA'
      end>
    StoreDefs = True
    TableName = 'PESSOAFISICA'
    UniDirectional = False
    Left = 604
    Top = 56
    object tSexoIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Required = True
    end
    object tSexoSEXO: TIBStringField
      FieldName = 'SEXO'
      Size = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = tPessoa
    Left = 624
    Top = 200
  end
  object tAux: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    IndexName = 'IUsername'
    Left = 512
    Top = 152
    object tAuxID: TAutoIncField
      FieldName = 'ID'
    end
    object tAuxNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tAuxEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tAuxBairro: TStringField
      FieldName = 'Bairro'
    end
    object tAuxCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tAuxUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tAuxCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tAuxSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tAuxCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tAuxRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tAuxTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tAuxMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tAuxMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tAuxMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tAuxIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tAuxUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tAuxPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tAuxMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tAuxSenha: TStringField
      FieldName = 'Senha'
    end
    object tAuxUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tAuxDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tAuxEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tAuxEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tAuxEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tAuxNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tAuxDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tAuxCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tAuxTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tAuxLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tAuxFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tAuxIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tAuxAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tAuxIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tAuxAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tAuxInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tAuxTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tAuxValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
    object tAuxObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tAuxEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
  end
end
