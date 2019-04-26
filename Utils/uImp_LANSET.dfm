object FrmPri: TFrmPri
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Importar dados do SGL para NexCaf'#233
  ClientHeight = 628
  ClientWidth = 1127
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 282
    Height = 13
    Caption = 'Importar dados de clientes do SGL para o NexCaf'#233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 56
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
  object lbImp: TLabel
    Left = 24
    Top = 184
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
  object Button1: TButton
    Left = 24
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Importar >>'
    TabOrder = 0
    OnClick = Button1Click
  end
  object PB: TProgressBar
    Left = 24
    Top = 136
    Width = 282
    Height = 16
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 384
    Width = 1127
    Height = 244
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object LMDSysInfo1: TLMDSysInfo
    Left = 128
    Top = 96
  end
  object OpenDlg: TOpenDialog
    FileName = 'LANSET.FDB'
    Filter = 'Banco de dados LANSETL|LANSET.FDB'
    InitialDir = 'c:\meus programas\nexcafe'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Abrir arquivo LANSET.FDB'
    Left = 160
    Top = 96
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 376
    Top = 56
  end
  object tF: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LOGIN'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'COD_TIPO_CONTA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SEXO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RG'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CELULAR'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FILIACAO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DATA_CRIACAO'
        DataType = ftDate
      end
      item
        Name = 'DATA_NASC'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'EXTRA'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'MENSAGEM'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'MOSTRAR_MSG'
        DataType = ftSmallint
      end
      item
        Name = 'CODIGO_BARRAS'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VIP'
        DataType = ftSmallint
      end
      item
        Name = 'CREDITO'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'CORTESIA'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'CANCELADO'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_CONTA'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'FK_TIPO_CONTA'
        Fields = 'COD_TIPO_CONTA'
      end>
    StoreDefs = True
    TableName = 'CONTA'
    Left = 440
    Top = 56
    object tFCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tFLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Required = True
      Size = 30
    end
    object tFSENHA: TIBStringField
      FieldName = 'SENHA'
    end
    object tFNOME: TIBStringField
      FieldName = 'NOME'
      Size = 100
    end
    object tFSEXO: TIBStringField
      FieldName = 'SEXO'
      Required = True
      Size = 1
    end
    object tFRG: TIBStringField
      FieldName = 'RG'
      Size = 15
    end
    object tFTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
    end
    object tFCELULAR: TIBStringField
      FieldName = 'CELULAR'
    end
    object tFENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object tFCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object tFUF: TIBStringField
      FieldName = 'UF'
      Size = 25
    end
    object tFCEP: TIBStringField
      FieldName = 'CEP'
      Size = 15
    end
    object tFEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tFDATA_CRIACAO: TDateField
      FieldName = 'DATA_CRIACAO'
    end
    object tFDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
      Required = True
    end
    object tFCOD_TIPO_CONTA: TSmallintField
      FieldName = 'COD_TIPO_CONTA'
      Required = True
    end
    object tFPAIS: TIBStringField
      FieldName = 'PAIS'
      Size = 25
    end
    object tFFILIACAO: TIBStringField
      FieldName = 'FILIACAO'
      Size = 255
    end
    object tFEXTRA: TMemoField
      FieldName = 'EXTRA'
      BlobType = ftMemo
      Size = 8
    end
    object tFMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      BlobType = ftMemo
      Size = 8
    end
    object tFMOSTRAR_MSG: TSmallintField
      FieldName = 'MOSTRAR_MSG'
    end
    object tFCODIGO_BARRAS: TIBStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 100
    end
    object tFVIP: TSmallintField
      FieldName = 'VIP'
    end
    object tFCREDITO: TIBBCDField
      FieldName = 'CREDITO'
      Precision = 18
      Size = 2
    end
    object tFCORTESIA: TIBBCDField
      FieldName = 'CORTESIA'
      Precision = 18
      Size = 2
    end
    object tFCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'localhost:C:\Meus Programas\NexCafe\lanset.fdb'
    Params.Strings = (
      'user_name=LANSET')
    Left = 408
    Top = 56
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    Left = 440
    Top = 24
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
    Left = 472
    Top = 24
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 408
    Top = 24
  end
  object nxSession1: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 376
    Top = 24
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 400
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = tF
    Left = 464
    Top = 104
  end
  object Q: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from conta')
    Left = 496
    Top = 160
  end
end
