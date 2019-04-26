object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar TXT - ODIN'
  ClientHeight = 605
  ClientWidth = 711
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
    Width = 711
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 16
    Width = 711
    Height = 81
    Align = alTop
    TabOrder = 1
    object Button2: TButton
      Left = 249
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Open IB'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 168
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 97
    Width = 711
    Height = 508
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 104
    ExplicitTop = 208
    ExplicitWidth = 250
    ExplicitHeight = 200
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
  object DataSource1: TDataSource
    DataSet = tOdin
    Left = 136
    Top = 120
  end
  object IBDB: TIBDatabase
    DatabaseName = 'C:\Meus Programas\NexCafe\ODIN.FDB'
    Params.Strings = (
      'user_name=sysdba')
    Left = 264
    Top = 200
  end
  object tOdin: TIBTable
    Database = IBDB
    Transaction = IBTransaction1
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
        Name = 'FK_ENTIDADES1'
        Fields = 'ENTIDADEGRUPOID'
      end
      item
        Name = 'FK_ENTIDADES2'
        Fields = 'USUARIOID'
      end>
    StoreDefs = True
    TableName = 'ENTIDADES'
    Left = 176
    Top = 200
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDB
    Left = 280
    Top = 112
  end
  object Dbf1: TDbf
    FilePath = 'C:\Download\'
    Indexes = <>
    TableName = 'LLAM_C.DBF'
    Left = 400
    Top = 232
    object Dbf1NRO_LLAM: TFloatField
      FieldName = 'NRO_LLAM'
    end
    object Dbf1LINHA1: TStringField
      FieldName = 'LINHA1'
      Size = 40
    end
    object Dbf1LINHA2: TStringField
      FieldName = 'LINHA2'
      Size = 40
    end
    object Dbf1LINHA3: TStringField
      FieldName = 'LINHA3'
      Size = 40
    end
    object Dbf1LINHA4: TStringField
      FieldName = 'LINHA4'
      Size = 40
    end
    object Dbf1LINHA5: TStringField
      FieldName = 'LINHA5'
      Size = 40
    end
    object Dbf1LINHA6: TStringField
      FieldName = 'LINHA6'
      Size = 40
    end
    object Dbf1LINHA7: TStringField
      FieldName = 'LINHA7'
      Size = 40
    end
    object Dbf1LINHA8: TStringField
      FieldName = 'LINHA8'
      Size = 40
    end
    object Dbf1COD_MOVIL: TSmallintField
      FieldName = 'COD_MOVIL'
    end
    object Dbf1COD_ESCALA: TSmallintField
      FieldName = 'COD_ESCALA'
    end
    object Dbf1ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object Dbf1BAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object Dbf1CIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object Dbf1HORA_LLAM: TStringField
      FieldName = 'HORA_LLAM'
      Size = 5
    end
    object Dbf1HORA_ATRI: TStringField
      FieldName = 'HORA_ATRI'
      Size = 5
    end
    object Dbf1FLAG_ATRI: TStringField
      FieldName = 'FLAG_ATRI'
      Size = 1
    end
    object Dbf1HORA_AVISO: TStringField
      FieldName = 'HORA_AVISO'
      Size = 5
    end
    object Dbf1FLAG_AVISO: TStringField
      FieldName = 'FLAG_AVISO'
      Size = 1
    end
    object Dbf1HORA_SAL: TStringField
      FieldName = 'HORA_SAL'
      Size = 5
    end
    object Dbf1FLAG_SAL: TStringField
      FieldName = 'FLAG_SAL'
      Size = 1
    end
    object Dbf1HORA_CHE: TStringField
      FieldName = 'HORA_CHE'
      Size = 5
    end
    object Dbf1FLAG_CHE: TStringField
      FieldName = 'FLAG_CHE'
      Size = 1
    end
    object Dbf1HORA_ATE: TStringField
      FieldName = 'HORA_ATE'
      Size = 5
    end
    object Dbf1FLAG_ATE: TStringField
      FieldName = 'FLAG_ATE'
      Size = 1
    end
    object Dbf1HORA_SIN: TStringField
      FieldName = 'HORA_SIN'
      Size = 5
    end
    object Dbf1FLAG_SIN: TStringField
      FieldName = 'FLAG_SIN'
      Size = 1
    end
    object Dbf1HORA_LIN: TStringField
      FieldName = 'HORA_LIN'
      Size = 5
    end
    object Dbf1FLAG_LIN: TStringField
      FieldName = 'FLAG_LIN'
      Size = 1
    end
    object Dbf1HORA_FIN: TStringField
      FieldName = 'HORA_FIN'
      Size = 5
    end
    object Dbf1FLAG_FIN: TStringField
      FieldName = 'FLAG_FIN'
      Size = 1
    end
  end
end
