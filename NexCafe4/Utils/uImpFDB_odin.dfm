object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar TXT - ODIN'
  ClientHeight = 422
  ClientWidth = 912
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
    Width = 912
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 16
    Width = 912
    Height = 81
    Align = alTop
    TabOrder = 1
    object Button3: TButton
      Left = 520
      Top = 29
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 97
    Width = 912
    Height = 325
    Align = alClient
    TabOrder = 2
    object TV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      object TVENTIDADEID: TcxGridDBColumn
        DataBinding.FieldName = 'ENTIDADEID'
        Width = 82
      end
      object TVENTIDADEGRUPOID: TcxGridDBColumn
        DataBinding.FieldName = 'ENTIDADEGRUPOID'
        Width = 128
      end
      object TVUSUARIOID: TcxGridDBColumn
        DataBinding.FieldName = 'USUARIOID'
        Width = 100
      end
      object TVCODIGOBARRA: TcxGridDBColumn
        DataBinding.FieldName = 'CODIGOBARRA'
      end
      object TVNOME: TcxGridDBColumn
        DataBinding.FieldName = 'NOME'
      end
      object TVAPELIDO: TcxGridDBColumn
        DataBinding.FieldName = 'APELIDO'
        SortIndex = 0
        SortOrder = soAscending
      end
      object TVSEXO: TcxGridDBColumn
        DataBinding.FieldName = 'SEXO'
      end
      object TVDOCUMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'DOCUMENTO'
      end
      object TVTELEFONE: TcxGridDBColumn
        DataBinding.FieldName = 'TELEFONE'
      end
      object TVCELULAR: TcxGridDBColumn
        DataBinding.FieldName = 'CELULAR'
      end
      object TVENDERECO: TcxGridDBColumn
        DataBinding.FieldName = 'ENDERECO'
      end
      object TVBAIRRO: TcxGridDBColumn
        DataBinding.FieldName = 'BAIRRO'
      end
      object TVESTADO: TcxGridDBColumn
        DataBinding.FieldName = 'ESTADO'
      end
      object TVCIDADE: TcxGridDBColumn
        DataBinding.FieldName = 'CIDADE'
      end
      object TVCEP: TcxGridDBColumn
        DataBinding.FieldName = 'CEP'
      end
      object TVPAIS: TcxGridDBColumn
        DataBinding.FieldName = 'PAIS'
      end
      object TVEMAIL: TcxGridDBColumn
        DataBinding.FieldName = 'EMAIL'
      end
      object TVNASCIMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'NASCIMENTO'
      end
      object TVCADASTRO: TcxGridDBColumn
        DataBinding.FieldName = 'CADASTRO'
      end
      object TVULTIMAVISITA: TcxGridDBColumn
        DataBinding.FieldName = 'ULTIMAVISITA'
      end
      object TVENTIDADETIPO: TcxGridDBColumn
        DataBinding.FieldName = 'ENTIDADETIPO'
      end
      object TVFUNCIONARIOLIMITE: TcxGridDBColumn
        DataBinding.FieldName = 'FUNCIONARIOLIMITE'
      end
      object TVCOBRARTIPO: TcxGridDBColumn
        DataBinding.FieldName = 'COBRARTIPO'
      end
      object TVCOBRARVALORHORA: TcxGridDBColumn
        DataBinding.FieldName = 'COBRARVALORHORA'
      end
      object TVCOBRARCORTESIA: TcxGridDBColumn
        DataBinding.FieldName = 'COBRARCORTESIA'
      end
      object TVSENHA: TcxGridDBColumn
        DataBinding.FieldName = 'SENHA'
      end
      object TVPROFISSAO: TcxGridDBColumn
        DataBinding.FieldName = 'PROFISSAO'
      end
      object TVBLOQUEADO: TcxGridDBColumn
        DataBinding.FieldName = 'BLOQUEADO'
      end
      object TVMOTIVO: TcxGridDBColumn
        DataBinding.FieldName = 'MOTIVO'
      end
      object TVSALDO: TcxGridDBColumn
        DataBinding.FieldName = 'SALDO'
      end
      object TVBANCOHORA: TcxGridDBColumn
        DataBinding.FieldName = 'BANCOHORA'
        Width = 79
      end
      object TVMILHAGEM: TcxGridDBColumn
        DataBinding.FieldName = 'MILHAGEM'
      end
      object TVNOMEPAI: TcxGridDBColumn
        DataBinding.FieldName = 'NOMEPAI'
      end
      object TVNOMEMAE: TcxGridDBColumn
        DataBinding.FieldName = 'NOMEMAE'
      end
      object TVICQ: TcxGridDBColumn
        DataBinding.FieldName = 'ICQ'
      end
      object TVMSN: TcxGridDBColumn
        DataBinding.FieldName = 'MSN'
      end
      object TVESCOLA: TcxGridDBColumn
        DataBinding.FieldName = 'ESCOLA'
      end
      object TVESCOLAREGISTRO: TcxGridDBColumn
        DataBinding.FieldName = 'ESCOLAREGISTRO'
      end
      object TVAULAINICIO: TcxGridDBColumn
        DataBinding.FieldName = 'AULAINICIO'
      end
      object TVAULAFINAL: TcxGridDBColumn
        DataBinding.FieldName = 'AULAFINAL'
      end
      object TVAUTORIZACAOMENOR: TcxGridDBColumn
        DataBinding.FieldName = 'AUTORIZACAOMENOR'
      end
      object TVPERMISSOES: TcxGridDBColumn
        DataBinding.FieldName = 'PERMISSOES'
      end
      object TVDIGITAL: TcxGridDBColumn
        DataBinding.FieldName = 'DIGITAL'
      end
    end
    object GL: TcxGridLevel
      GridView = TV
    end
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
    object tCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tCliObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
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
    object tCliEmail: TnxMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tCliPassaportes: TFloatField
      FieldName = 'Passaportes'
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
    object tCliTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object tCliFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tCliFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object tCliFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object tCliAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object tCliCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object tCliCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object tCliCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object tCliSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object tCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tCliCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object tCliOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object tCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tCliHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tCliFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
    object tCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1:16200'
    Left = 104
    Top = 24
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
    Left = 64
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = tOdin
    Left = 424
    Top = 32
  end
  object IBDB: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:C:\Meus Programas\NexCafe\ODIN.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 264
    Top = 200
  end
  object tOdin: TIBTable
    Database = IBDB
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
    Left = 176
    Top = 200
    object tOdinENTIDADEID: TIntegerField
      FieldName = 'ENTIDADEID'
      Required = True
    end
    object tOdinENTIDADEGRUPOID: TIntegerField
      FieldName = 'ENTIDADEGRUPOID'
    end
    object tOdinUSUARIOID: TIntegerField
      FieldName = 'USUARIOID'
      Required = True
    end
    object tOdinCODIGOBARRA: TIBStringField
      FieldName = 'CODIGOBARRA'
    end
    object tOdinNOME: TIBStringField
      FieldName = 'NOME'
      Required = True
      Size = 70
    end
    object tOdinAPELIDO: TIBStringField
      FieldName = 'APELIDO'
    end
    object tOdinSEXO: TSmallintField
      FieldName = 'SEXO'
      Required = True
    end
    object tOdinDOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Size = 14
    end
    object tOdinTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object tOdinCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 14
    end
    object tOdinENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object tOdinBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object tOdinESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 30
    end
    object tOdinCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object tOdinCEP: TIBStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tOdinPAIS: TIBStringField
      FieldName = 'PAIS'
      Size = 30
    end
    object tOdinEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tOdinNASCIMENTO: TDateTimeField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object tOdinCADASTRO: TDateTimeField
      FieldName = 'CADASTRO'
      Required = True
    end
    object tOdinULTIMAVISITA: TDateTimeField
      FieldName = 'ULTIMAVISITA'
    end
    object tOdinENTIDADETIPO: TSmallintField
      FieldName = 'ENTIDADETIPO'
      Required = True
    end
    object tOdinFUNCIONARIOLIMITE: TIBBCDField
      FieldName = 'FUNCIONARIOLIMITE'
      Precision = 9
      Size = 2
    end
    object tOdinCOBRARTIPO: TSmallintField
      FieldName = 'COBRARTIPO'
      Required = True
    end
    object tOdinCOBRARVALORHORA: TIBBCDField
      FieldName = 'COBRARVALORHORA'
      Required = True
      Precision = 9
      Size = 2
    end
    object tOdinCOBRARCORTESIA: TIntegerField
      FieldName = 'COBRARCORTESIA'
      Required = True
    end
    object tOdinSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object tOdinPROFISSAO: TIBStringField
      FieldName = 'PROFISSAO'
      Size = 30
    end
    object tOdinBLOQUEADO: TIntegerField
      FieldName = 'BLOQUEADO'
      Required = True
    end
    object tOdinMOTIVO: TIBStringField
      FieldName = 'MOTIVO'
      Size = 200
    end
    object tOdinSALDO: TIBBCDField
      FieldName = 'SALDO'
      Required = True
      Precision = 9
      Size = 2
    end
    object tOdinBANCOHORA: TIntegerField
      FieldName = 'BANCOHORA'
      Required = True
    end
    object tOdinMILHAGEM: TIBBCDField
      FieldName = 'MILHAGEM'
      Required = True
      Precision = 9
      Size = 2
    end
    object tOdinNOMEPAI: TIBStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object tOdinNOMEMAE: TIBStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object tOdinICQ: TIBStringField
      FieldName = 'ICQ'
      Size = 15
    end
    object tOdinMSN: TIBStringField
      FieldName = 'MSN'
      Size = 50
    end
    object tOdinESCOLA: TIBStringField
      FieldName = 'ESCOLA'
      Size = 50
    end
    object tOdinESCOLAREGISTRO: TIBStringField
      FieldName = 'ESCOLAREGISTRO'
      Size = 15
    end
    object tOdinAULAINICIO: TDateTimeField
      FieldName = 'AULAINICIO'
    end
    object tOdinAULAFINAL: TDateTimeField
      FieldName = 'AULAFINAL'
    end
    object tOdinAUTORIZACAOMENOR: TSmallintField
      FieldName = 'AUTORIZACAOMENOR'
      Required = True
    end
    object tOdinPERMISSOES: TBlobField
      FieldName = 'PERMISSOES'
      Size = 8
    end
    object tOdinDIGITAL: TBlobField
      FieldName = 'DIGITAL'
      Size = 8
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDB
    Left = 280
    Top = 112
  end
  object tDeb: TnxTable
    Database = nxDB
    TableName = 'Debito'
    Exclusive = True
    Left = 240
    Top = 88
    object tDebData: TDateTimeField
      FieldName = 'Data'
    end
    object tDebCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tDebValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tDebTipo: TWordField
      FieldName = 'Tipo'
    end
    object tDebID: TIntegerField
      FieldName = 'ID'
    end
  end
  object tMovEst: TnxTable
    Database = nxDB
    TableName = 'MovEst'
    Exclusive = True
    IndexName = 'IID'
    Left = 328
    Top = 88
    object tMovEstID: TAutoIncField
      FieldName = 'ID'
    end
    object tMovEstTran: TIntegerField
      FieldName = 'Tran'
    end
    object tMovEstProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tMovEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object tMovEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tMovEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMovEstCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tMovEstItem: TWordField
      FieldName = 'Item'
    end
    object tMovEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMovEstPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tMovEstPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tMovEstDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tMovEstDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tMovEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMovEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMovEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tMovEstCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tMovEstCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tMovEstCategoria: TStringField
      FieldName = 'Categoria'
    end
    object tMovEstNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tMovEstITran: TIntegerField
      FieldName = 'ITran'
    end
    object tMovEstTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tMovEstSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tMovEstFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tMovEstFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
  end
end
