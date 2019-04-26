object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar LOKAR'
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
    object btnImport: TButton
      Left = 152
      Top = 21
      Width = 153
      Height = 25
      Caption = 'Import NOW!'
      TabOrder = 0
      OnClick = btnImportClick
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
      Navigator.Buttons.CustomButtons = <>
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
      object TVCLIENTEID: TcxGridDBColumn
        DataBinding.FieldName = 'CLIENTEID'
      end
      object TVNICK: TcxGridDBColumn
        DataBinding.FieldName = 'NICK'
      end
      object TVBAIRRO: TcxGridDBColumn
        DataBinding.FieldName = 'BAIRRO'
      end
      object TVCEL: TcxGridDBColumn
        DataBinding.FieldName = 'CEL'
      end
      object TVCEP: TcxGridDBColumn
        DataBinding.FieldName = 'CEP'
      end
      object TVCIDADE: TcxGridDBColumn
        DataBinding.FieldName = 'CIDADE'
      end
      object TVNOME: TcxGridDBColumn
        DataBinding.FieldName = 'NOME'
      end
      object TVCOMPLEMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'COMPLEMENTO'
      end
      object TVCPF: TcxGridDBColumn
        DataBinding.FieldName = 'CPF'
      end
      object TVENDERECO: TcxGridDBColumn
        DataBinding.FieldName = 'ENDERECO'
      end
      object TVFIXO: TcxGridDBColumn
        DataBinding.FieldName = 'FIXO'
      end
      object TVFOTO: TcxGridDBColumn
        DataBinding.FieldName = 'FOTO'
      end
      object TVMAE: TcxGridDBColumn
        DataBinding.FieldName = 'MAE'
      end
      object TVOBS: TcxGridDBColumn
        DataBinding.FieldName = 'OBS'
      end
      object TVPAI: TcxGridDBColumn
        DataBinding.FieldName = 'PAI'
      end
      object TVPRAZOCREDITO: TcxGridDBColumn
        DataBinding.FieldName = 'PRAZOCREDITO'
      end
      object TVPRAZOPRODUTO: TcxGridDBColumn
        DataBinding.FieldName = 'PRAZOPRODUTO'
      end
      object TVRG: TcxGridDBColumn
        DataBinding.FieldName = 'RG'
      end
      object TVUF: TcxGridDBColumn
        DataBinding.FieldName = 'UF'
      end
      object TVNUMERO: TcxGridDBColumn
        DataBinding.FieldName = 'NUMERO'
      end
      object TVVALORMAXIMO: TcxGridDBColumn
        DataBinding.FieldName = 'VALORMAXIMO'
      end
      object TVEMAIL: TcxGridDBColumn
        DataBinding.FieldName = 'EMAIL'
      end
      object TVCREDITO: TcxGridDBColumn
        DataBinding.FieldName = 'CREDITO'
      end
      object TVVVENDAPRAZO: TcxGridDBColumn
        DataBinding.FieldName = 'VVENDAPRAZO'
      end
    end
    object GL: TcxGridLevel
      GridView = TV
    end
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRemoteServerEngine1
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 64
    Top = 24
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
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
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 104
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = tOdin
    Left = 424
    Top = 32
  end
  object IBDB: TIBDatabase
    DatabaseName = 'localhost:C:\NexCafe\TimerLokar.fdb'
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
    FieldDefs = <
      item
        Name = 'CLIENTEID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NICK'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CEL'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FIXO'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'FOTO'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'MAE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'PAI'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PRAZOCREDITO'
        DataType = ftInteger
      end
      item
        Name = 'PRAZOPRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'RG'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VALORMAXIMO'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CREDITO'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'VVENDAPRAZO'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CLIENTEID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TBCLIENTES'
    Left = 176
    Top = 200
    object tOdinCLIENTEID: TIntegerField
      FieldName = 'CLIENTEID'
      Required = True
    end
    object tOdinNICK: TIBStringField
      FieldName = 'NICK'
    end
    object tOdinBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object tOdinCEL: TIBStringField
      FieldName = 'CEL'
      Size = 13
    end
    object tOdinCEP: TIBStringField
      FieldName = 'CEP'
      Size = 8
    end
    object tOdinCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object tOdinNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object tOdinCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
    end
    object tOdinCPF: TIBStringField
      FieldName = 'CPF'
      Size = 13
    end
    object tOdinENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object tOdinFIXO: TIBStringField
      FieldName = 'FIXO'
      Size = 13
    end
    object tOdinFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object tOdinMAE: TIBStringField
      FieldName = 'MAE'
      Size = 50
    end
    object tOdinOBS: TIBStringField
      FieldName = 'OBS'
      Size = 2000
    end
    object tOdinPAI: TIBStringField
      FieldName = 'PAI'
      Size = 50
    end
    object tOdinPRAZOCREDITO: TIntegerField
      FieldName = 'PRAZOCREDITO'
    end
    object tOdinPRAZOPRODUTO: TIntegerField
      FieldName = 'PRAZOPRODUTO'
    end
    object tOdinRG: TIBStringField
      FieldName = 'RG'
    end
    object tOdinUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object tOdinNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object tOdinVALORMAXIMO: TIBBCDField
      FieldName = 'VALORMAXIMO'
      Precision = 18
      Size = 4
    end
    object tOdinEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object tOdinCREDITO: TIBBCDField
      FieldName = 'CREDITO'
      Precision = 18
      Size = 4
    end
    object tOdinVVENDAPRAZO: TIBBCDField
      FieldName = 'VVENDAPRAZO'
      Precision = 18
      Size = 2
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDB
    Left = 280
    Top = 112
  end
  object nxRemoteServerEngine1: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 72
    Top = 56
  end
end
