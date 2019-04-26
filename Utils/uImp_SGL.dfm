object FrmPri: TFrmPri
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Importar dados do SGL para NexCaf'#233
  ClientHeight = 443
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 17
    Width = 202
    Height = 19
    Caption = 'Importar clientes do SGL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 250
    Height = 16
    Caption = 'O NexServ tem que estar em execu'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
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
  object LMDSysInfo1: TLMDSysInfo
    Left = 128
    Top = 96
  end
  object OpenDlg: TOpenDialog
    FileName = 'SGL.GDB'
    Filter = 'Banco de dados SGL|SGL.GDB'
    InitialDir = 'c:\meus programas\nexcafe'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Abrir arquivo SGL.GDB'
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
      end
      item
        Name = 'FORMAPOS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'GANHOUANIVER'
        DataType = ftDateTime
      end
      item
        Name = 'DIGITAL'
        DataType = ftBlob
        Size = 8
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
    Left = 440
    Top = 56
    object tFCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tFLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Size = 15
    end
    object tFSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object tFNOME: TIBStringField
      FieldName = 'NOME'
      Size = 40
    end
    object tFDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object tFENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object tFNUM: TIBStringField
      FieldName = 'NUM'
      Size = 5
    end
    object tFCOMPL: TIBStringField
      FieldName = 'COMPL'
    end
    object tFBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object tFCEP: TIBStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tFCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object tFUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object tFDATACAD: TDateTimeField
      FieldName = 'DATACAD'
    end
    object tFNIVEL: TIBStringField
      FieldName = 'NIVEL'
      FixedChar = True
      Size = 1
    end
    object tFEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object tFSTATUS: TIBStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object tFEDITAR: TIBStringField
      FieldName = 'EDITAR'
      FixedChar = True
      Size = 1
    end
    object tFTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 15
    end
    object tFDESCONTO: TIBStringField
      FieldName = 'DESCONTO'
      FixedChar = True
      Size = 5
    end
    object tFTEMPODESCONTO: TIntegerField
      FieldName = 'TEMPODESCONTO'
    end
    object tFOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object tFFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object tFTEMPOJOGO: TIntegerField
      FieldName = 'TEMPOJOGO'
    end
    object tFMONETARIO: TFloatField
      FieldName = 'MONETARIO'
    end
    object tFTEMPOCOMPRADO: TIntegerField
      FieldName = 'TEMPOCOMPRADO'
    end
    object tFCODBARRA: TIBStringField
      FieldName = 'CODBARRA'
    end
    object tFFONE: TIBStringField
      FieldName = 'FONE'
      Size = 15
    end
    object tFCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object tFTIPOCLIENTE: TIBStringField
      FieldName = 'TIPOCLIENTE'
    end
    object tFATIVO: TIBStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object tFBILHETE: TIBStringField
      FieldName = 'BILHETE'
      FixedChar = True
      Size = 1
    end
    object tFRG: TIBStringField
      FieldName = 'RG'
    end
    object tFCPF: TIBStringField
      FieldName = 'CPF'
    end
    object tFICQ: TIBStringField
      FieldName = 'ICQ'
      Size = 10
    end
    object tFEMAIL2: TIBStringField
      FieldName = 'EMAIL2'
      Size = 30
    end
    object tFESTUDANTE: TIBStringField
      FieldName = 'ESTUDANTE'
      FixedChar = True
      Size = 1
    end
    object tFSERIE: TIBStringField
      FieldName = 'SERIE'
    end
    object tFPERIODO: TIBStringField
      FieldName = 'PERIODO'
      Size = 10
    end
    object tFESCOLA: TIBStringField
      FieldName = 'ESCOLA'
      Size = 30
    end
    object tFDEL: TIBStringField
      FieldName = 'DEL'
      FixedChar = True
      Size = 1
    end
    object tFIMPRIMIU: TIBStringField
      FieldName = 'IMPRIMIU'
      FixedChar = True
      Size = 1
    end
    object tFLOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object tFVALORBILHETE: TFloatField
      FieldName = 'VALORBILHETE'
    end
    object tFNOMEPAI: TIBStringField
      FieldName = 'NOMEPAI'
      Size = 40
    end
    object tFNOMEMAE: TIBStringField
      FieldName = 'NOMEMAE'
      Size = 40
    end
    object tFHORAINI: TIBStringField
      FieldName = 'HORAINI'
      FixedChar = True
      Size = 5
    end
    object tFHORAFIM: TIBStringField
      FieldName = 'HORAFIM'
      FixedChar = True
      Size = 5
    end
    object tFDATAGANHOUVIP: TDateTimeField
      FieldName = 'DATAGANHOUVIP'
    end
    object tFBONUSVALOR: TFloatField
      FieldName = 'BONUSVALOR'
    end
    object tFLIMITECREDITO: TFloatField
      FieldName = 'LIMITECREDITO'
    end
    object tFFORMAPOS: TIBStringField
      FieldName = 'FORMAPOS'
      FixedChar = True
      Size = 1
    end
    object tFGANHOUANIVER: TDateTimeField
      FieldName = 'GANHOUANIVER'
    end
    object tFDIGITAL: TBlobField
      FieldName = 'DIGITAL'
      Size = 8
    end
  end
  object tH: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end
      item
        Name = 'TEMPOCOMPRADO'
        DataType = ftInteger
      end
      item
        Name = 'TIPOSERVICO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BONUSTEMPO'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DETCLIENTES_COD'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'DETCLIENTES_CODCLI'
        Fields = 'CODCLI'
      end>
    IndexFieldNames = 'CODCLI'
    MasterFields = 'Codigo'
    MasterSource = DataSource1
    StoreDefs = True
    TableName = 'DETCLIENTES'
    Left = 472
    Top = 56
    object tHCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tHCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object tHTEMPOCOMPRADO: TIntegerField
      FieldName = 'TEMPOCOMPRADO'
    end
    object tHTIPOSERVICO: TIBStringField
      FieldName = 'TIPOSERVICO'
    end
    object tHBONUSTEMPO: TIntegerField
      FieldName = 'BONUSTEMPO'
    end
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'localhost:C:\NexCafe\sgl.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    SQLDialect = 1
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
    AliasName = 'NexCafe'
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
end
