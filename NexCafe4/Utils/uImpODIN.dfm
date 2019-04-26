object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'Importar dados do ODIN para NexCaf'#233
  ClientHeight = 387
  ClientWidth = 646
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
    Width = 289
    Height = 13
    Caption = 'Importar dados de clientes do ODIN para o NexCaf'#233
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
  object Label5: TLabel
    Left = 24
    Top = 75
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
    Top = 312
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
    Top = 174
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
  object Button1: TButton
    Left = 24
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Importar >>'
    TabOrder = 0
    OnClick = Button1Click
  end
  object cbSenhaAleat: TCheckBox
    Left = 24
    Top = 152
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
    Left = 456
    Top = 96
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
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 408
    Top = 96
  end
  object tEnt: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    FieldDefs = <
      item
        Name = 'ENTIDADEID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ENTIDADEGRUPOID'
        DataType = ftInteger
      end
      item
        Name = 'USUARIOID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGOBARRA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'APELIDO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SEXO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CELULAR'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NASCIMENTO'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'CADASTRO'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'ULTIMAVISITA'
        DataType = ftDateTime
      end
      item
        Name = 'ENTIDADETIPO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'FUNCIONARIOLIMITE'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'COBRARTIPO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'COBRARVALORHORA'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'COBRARCORTESIA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PROFISSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'BLOQUEADO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MOTIVO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SALDO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'BANCOHORA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MILHAGEM'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'NOMEPAI'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOMEMAE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ICQ'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'MSN'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ESCOLA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ESCOLAREGISTRO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'AULAINICIO'
        DataType = ftDateTime
      end
      item
        Name = 'AULAFINAL'
        DataType = ftDateTime
      end
      item
        Name = 'AUTORIZACAOMENOR'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PERMISSOES'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'DIGITAL'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'PK_ENTIDADES'
        Fields = 'ENTIDADEID'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ENTIDADES2'
        Fields = 'USUARIOID'
      end
      item
        Name = 'FK_ENTIDADES1'
        Fields = 'ENTIDADEGRUPOID'
      end>
    StoreDefs = True
    TableName = 'ENTIDADES'
    Left = 376
    Top = 56
    object tEntENTIDADEID: TIntegerField
      FieldName = 'ENTIDADEID'
      Required = True
    end
    object tEntENTIDADEGRUPOID: TIntegerField
      FieldName = 'ENTIDADEGRUPOID'
    end
    object tEntUSUARIOID: TIntegerField
      FieldName = 'USUARIOID'
      Required = True
    end
    object tEntCODIGOBARRA: TIBStringField
      FieldName = 'CODIGOBARRA'
    end
    object tEntNOME: TIBStringField
      FieldName = 'NOME'
      Required = True
      Size = 70
    end
    object tEntAPELIDO: TIBStringField
      FieldName = 'APELIDO'
    end
    object tEntSEXO: TSmallintField
      FieldName = 'SEXO'
      Required = True
    end
    object tEntDOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Size = 14
    end
    object tEntTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object tEntCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 14
    end
    object tEntENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object tEntBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object tEntESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 30
    end
    object tEntCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object tEntCEP: TIBStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tEntPAIS: TIBStringField
      FieldName = 'PAIS'
      Size = 30
    end
    object tEntEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tEntNASCIMENTO: TDateTimeField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object tEntCADASTRO: TDateTimeField
      FieldName = 'CADASTRO'
      Required = True
    end
    object tEntULTIMAVISITA: TDateTimeField
      FieldName = 'ULTIMAVISITA'
    end
    object tEntENTIDADETIPO: TSmallintField
      FieldName = 'ENTIDADETIPO'
      Required = True
    end
    object tEntFUNCIONARIOLIMITE: TIBBCDField
      FieldName = 'FUNCIONARIOLIMITE'
      Precision = 9
      Size = 2
    end
    object tEntCOBRARTIPO: TSmallintField
      FieldName = 'COBRARTIPO'
      Required = True
    end
    object tEntCOBRARVALORHORA: TIBBCDField
      FieldName = 'COBRARVALORHORA'
      Required = True
      Precision = 9
      Size = 2
    end
    object tEntCOBRARCORTESIA: TIntegerField
      FieldName = 'COBRARCORTESIA'
      Required = True
    end
    object tEntSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object tEntPROFISSAO: TIBStringField
      FieldName = 'PROFISSAO'
      Size = 30
    end
    object tEntBLOQUEADO: TIntegerField
      FieldName = 'BLOQUEADO'
      Required = True
    end
    object tEntMOTIVO: TIBStringField
      FieldName = 'MOTIVO'
      Size = 200
    end
    object tEntSALDO: TIBBCDField
      FieldName = 'SALDO'
      Required = True
      Precision = 9
      Size = 2
    end
    object tEntMILHAGEM: TIBBCDField
      FieldName = 'MILHAGEM'
      Required = True
      Precision = 9
      Size = 2
    end
    object tEntNOMEPAI: TIBStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object tEntNOMEMAE: TIBStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object tEntICQ: TIBStringField
      FieldName = 'ICQ'
      Size = 15
    end
    object tEntMSN: TIBStringField
      FieldName = 'MSN'
      Size = 50
    end
    object tEntESCOLA: TIBStringField
      FieldName = 'ESCOLA'
      Size = 50
    end
    object tEntESCOLAREGISTRO: TIBStringField
      FieldName = 'ESCOLAREGISTRO'
      Size = 15
    end
    object tEntAULAINICIO: TDateTimeField
      FieldName = 'AULAINICIO'
    end
    object tEntAULAFINAL: TDateTimeField
      FieldName = 'AULAFINAL'
    end
    object tEntAUTORIZACAOMENOR: TSmallintField
      FieldName = 'AUTORIZACAOMENOR'
      Required = True
    end
    object tEntPERMISSOES: TBlobField
      FieldName = 'PERMISSOES'
      Size = 8
    end
    object tEntDIGITAL: TBlobField
      FieldName = 'DIGITAL'
      Size = 8
    end
    object tEntBANCOHORA: TIntegerField
      FieldName = 'BANCOHORA'
      Required = True
    end
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:C:\Meus Programas\NexCafe\ODIN.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 376
    Top = 96
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 592
    Top = 96
  end
  object LMDSysInfo1: TLMDSysInfo
    Left = 120
    Top = 264
  end
  object OpenDlg: TOpenDialog
    FileName = 'ODIN.FDB'
    Filter = 'Banco de dados ODIN|ODIN.FDB'
    InitialDir = 'C:\Arquivos de programas\Kairus\Odin 4\BancoDeDados'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Abrir arquivo ODIN.FDB'
    Left = 160
    Top = 264
  end
end
