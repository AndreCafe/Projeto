object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'Importar dados do HABITUS para o NexCaf'#233
  ClientHeight = 378
  ClientWidth = 693
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
    Top = 24
    Width = 311
    Height = 13
    Caption = 'Importar dados de clientes do HABITUS para o NexCaf'#233
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
    DefaultDatabase = IBDatabase1
    Left = 408
    Top = 96
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
        Name = 'CODIGO_GRUPO_CLIENTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_ULTIMA_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_ULTIMA_VENDA_AVULSA'
        DataType = ftInteger
      end
      item
        Name = 'LIXEIRA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMERO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'NOME_ABREVIADO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 254
      end
      item
        Name = 'NOME_FORMATADO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 509
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RG'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'E_MAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SEXO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COMPLEMENTO_LOGRADOURO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMERO_LOGRADOURO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ESTADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DATA_NASCIMENTO'
        DataType = ftDate
      end
      item
        Name = 'CLA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOGIN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'SALDO'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'LIMITE_DEBITO'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'AUTORIZACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME_RESPONSAVEL'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'PARENTESCO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TELEFONE_RESPONSAVEL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CELULAR_RESPONSAVEL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CPF_RESPONSAVEL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RG_RESPONSAVEL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOME_ESCOLA'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'TELEFONE_ESCOLA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TURNO_MANHA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TURNO_TARDE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TURNO_NOITE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TURNO_MADRUGADA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBSERVACOES'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'FOTO'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'DIGITAL'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'FOTO_DIGITAL'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'PONTUACAO_ACUMULADA'
        DataType = ftInteger
      end
      item
        Name = 'SALDO_MINUTOS'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_CLIENTES'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'IX_CLIE_CLA'
        Fields = 'CLA'
      end
      item
        Name = 'IX_CLIE_CPF'
        Fields = 'CPF'
      end
      item
        Name = 'IX_CLIE_LOGIN'
        Fields = 'LOGIN'
      end
      item
        Name = 'IX_CLIE_NOME'
        Fields = 'NOME'
      end
      item
        Name = 'IX_CLIE_NUMERO'
        Fields = 'NUMERO'
        Options = [ixUnique]
      end
      item
        Name = 'IX_CLIE_RG'
        Fields = 'RG'
      end
      item
        Name = 'FK_CLIE_GRUPO_CLIENTE'
        Fields = 'CODIGO_GRUPO_CLIENTE'
      end
      item
        Name = 'FK_CLIE_ULTIMA_CONEXAO'
        Fields = 'CODIGO_ULTIMA_CONEXAO'
      end
      item
        Name = 'FK_CLIE_ULTIMA_VENDA_AVULSA'
        Fields = 'CODIGO_ULTIMA_VENDA_AVULSA'
      end>
    IndexName = 'IX_CLIE_NUMERO'
    ReadOnly = True
    StoreDefs = True
    TableName = 'CLIENTES'
    Left = 376
    Top = 56
    object tFCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tFCODIGO_GRUPO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_GRUPO_CLIENTE'
      Required = True
    end
    object tFCODIGO_ULTIMA_CONEXAO: TIntegerField
      FieldName = 'CODIGO_ULTIMA_CONEXAO'
    end
    object tFCODIGO_ULTIMA_VENDA_AVULSA: TIntegerField
      FieldName = 'CODIGO_ULTIMA_VENDA_AVULSA'
    end
    object tFLIXEIRA: TIBStringField
      FieldName = 'LIXEIRA'
      Size = 1
    end
    object tFNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object tFNOME: TIBStringField
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object tFNOME_ABREVIADO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_ABREVIADO'
      ReadOnly = True
      Size = 254
    end
    object tFNOME_FORMATADO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_FORMATADO'
      ReadOnly = True
      Size = 509
    end
    object tFCPF: TIBStringField
      FieldName = 'CPF'
    end
    object tFRG: TIBStringField
      FieldName = 'RG'
    end
    object tFE_MAIL: TIBStringField
      FieldName = 'E_MAIL'
      Size = 50
    end
    object tFSEXO: TIBStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object tFLOGRADOURO: TIBStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object tFCOMPLEMENTO_LOGRADOURO: TIBStringField
      FieldName = 'COMPLEMENTO_LOGRADOURO'
    end
    object tFNUMERO_LOGRADOURO: TIBStringField
      FieldName = 'NUMERO_LOGRADOURO'
      Size = 10
    end
    object tFBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object tFCEP: TIBStringField
      FieldName = 'CEP'
      Size = 12
    end
    object tFCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object tFESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object tFTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object tFDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object tFCLA: TIBStringField
      FieldName = 'CLA'
      Size = 50
    end
    object tFLOGIN: TIBStringField
      FieldName = 'LOGIN'
    end
    object tFSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 80
    end
    object tFSALDO: TIBBCDField
      FieldName = 'SALDO'
      Precision = 18
      Size = 2
    end
    object tFLIMITE_DEBITO: TIBBCDField
      FieldName = 'LIMITE_DEBITO'
      Precision = 18
      Size = 2
    end
    object tFAUTORIZACAO: TIBStringField
      FieldName = 'AUTORIZACAO'
      Size = 1
    end
    object tFNOME_RESPONSAVEL: TIBStringField
      FieldName = 'NOME_RESPONSAVEL'
      Size = 80
    end
    object tFPARENTESCO: TIBStringField
      FieldName = 'PARENTESCO'
    end
    object tFTELEFONE_RESPONSAVEL: TIBStringField
      FieldName = 'TELEFONE_RESPONSAVEL'
      Size = 15
    end
    object tFCELULAR_RESPONSAVEL: TIBStringField
      FieldName = 'CELULAR_RESPONSAVEL'
      Size = 15
    end
    object tFCPF_RESPONSAVEL: TIBStringField
      FieldName = 'CPF_RESPONSAVEL'
    end
    object tFRG_RESPONSAVEL: TIBStringField
      FieldName = 'RG_RESPONSAVEL'
    end
    object tFNOME_ESCOLA: TIBStringField
      FieldName = 'NOME_ESCOLA'
      Size = 80
    end
    object tFTELEFONE_ESCOLA: TIBStringField
      FieldName = 'TELEFONE_ESCOLA'
      Size = 15
    end
    object tFTURNO_MANHA: TIBStringField
      FieldName = 'TURNO_MANHA'
      Size = 1
    end
    object tFTURNO_TARDE: TIBStringField
      FieldName = 'TURNO_TARDE'
      Size = 1
    end
    object tFTURNO_NOITE: TIBStringField
      FieldName = 'TURNO_NOITE'
      Size = 1
    end
    object tFTURNO_MADRUGADA: TIBStringField
      FieldName = 'TURNO_MADRUGADA'
      Size = 1
    end
    object tFOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      BlobType = ftMemo
      Size = 8
    end
    object tFFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object tFDIGITAL: TBlobField
      FieldName = 'DIGITAL'
      Size = 8
    end
    object tFFOTO_DIGITAL: TBlobField
      FieldName = 'FOTO_DIGITAL'
      Size = 8
    end
    object tFPONTUACAO_ACUMULADA: TIntegerField
      FieldName = 'PONTUACAO_ACUMULADA'
    end
    object tFSALDO_MINUTOS: TIntegerField
      FieldName = 'SALDO_MINUTOS'
    end
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'localhost:C:\NexCafe\IM.FDB'
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
    FileName = 'IM.FDB'
    Filter = 'Banco de dados Habitus|IM.FDB'
    InitialDir = 'C:\Arquivos de programas\Kairus\Odin 4\BancoDeDados'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Abrir arquivo ODIN.FDB'
    Left = 160
    Top = 264
  end
end
