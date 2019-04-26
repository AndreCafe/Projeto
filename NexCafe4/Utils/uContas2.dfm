object frmPri: TfrmPri
  Left = 0
  Top = 0
  Caption = 'Quantidade de Contas NexCaf'#233
  ClientHeight = 532
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 663
    Height = 201
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 56
      Width = 73
      Height = 13
      Caption = 'Contas Criadas'
    end
    object Label2: TLabel
      Left = 21
      Top = 80
      Width = 79
      Height = 13
      Caption = 'Contas Ativadas'
    end
    object Label3: TLabel
      Left = 21
      Top = 107
      Width = 67
      Height = 13
      Caption = 'Contas Ativas'
    end
    object Label4: TLabel
      Left = 48
      Top = 136
      Width = 40
      Height = 13
      Caption = 'Premium'
    end
    object Label5: TLabel
      Left = 48
      Top = 168
      Width = 22
      Height = 13
      Caption = 'Free'
    end
    object lbCriadas: TLabel
      Left = 117
      Top = 56
      Width = 72
      Height = 13
      Caption = 'calculando ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAtivadas: TLabel
      Left = 117
      Top = 80
      Width = 72
      Height = 13
      Caption = 'calculando ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAtivas: TLabel
      Left = 117
      Top = 107
      Width = 72
      Height = 13
      Caption = 'calculando ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPremium: TLabel
      Left = 117
      Top = 136
      Width = 72
      Height = 13
      Caption = 'calculando ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFree: TLabel
      Left = 117
      Top = 168
      Width = 72
      Height = 13
      Caption = 'calculando ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 117
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object edData: TcxDateEdit
      Left = 248
      Top = 18
      EditValue = 40402d
      Properties.ImmediatePost = True
      TabOrder = 2
      Width = 121
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 201
    Width = 663
    Height = 331
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object nxSession: TnxSession
    Timeout = 120000
    ServerEngine = nxRSE
    Left = 336
    Top = 336
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 296
    Top = 416
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    Timeout = 120000
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16300
    Left = 296
    Top = 336
  end
  object nxseAllEngines1: TnxseAllEngines
    Left = 336
    Top = 416
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 296
    Top = 456
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ILicTipoUObtemLic'
    Left = 296
    Top = 376
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliTipo: TWordField
      FieldName = 'Tipo'
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object tCliCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object tCliCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object tCliAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object tCliAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object tCliLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object tCliRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object tCliPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliEndereco: TnxMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object tCliSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object tCliCodEquip: TStringField
      FieldName = 'CodEquip'
      Size = 60
    end
    object tCliNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object tCliCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object tCliIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object tCliObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliTelefones: TnxMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object tCliEmailReg: TnxMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object tCliFormaPagto: TnxMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object tCliLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object tCliLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object tCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object tCliManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object tCliManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object tCliProprietarios: TnxMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object tCliGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object tCliTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object tCliEmailTec: TnxMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object tCliValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tCliValorRec: TCurrencyField
      FieldName = 'ValorRec'
    end
    object tCliEmitirNF: TBooleanField
      FieldName = 'EmitirNF'
    end
    object tCliMessenger: TnxMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object tCliICQ: TnxMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object tCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tCliUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object tCliNegociacao: TWordField
      FieldName = 'Negociacao'
    end
    object tCliStatus: TIntegerField
      FieldName = 'Status'
    end
    object tCliContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object tCliPrograma: TWordField
      FieldName = 'Programa'
    end
    object tCliBloqueado: TBooleanField
      FieldName = 'Bloqueado'
    end
    object tCliCliente: TBooleanField
      FieldName = 'Cliente'
    end
    object tCliAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object tCliCodAtivacao: TStringField
      FieldName = 'CodAtivacao'
      Size = 10
    end
    object tCliEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tCliAtivadoEm: TDateTimeField
      FieldName = 'AtivadoEm'
    end
    object tCliTipoConta: TWordField
      FieldName = 'TipoConta'
    end
    object tCliPremiumAte: TDateTimeField
      FieldName = 'PremiumAte'
    end
  end
  object tAut: TnxTable
    Database = nxDB
    TableName = 'Autorizacao'
    IndexName = 'IAtivaTipoVencimento'
    Left = 336
    Top = 376
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 376
    Top = 336
  end
  object Q: TnxQuery
    Database = nxDB
    SQL.Strings = (
      
        'select Data, Count(Distinct(Loja)) as Lojas, Count(Distinct(IP))' +
        ' as IPs, Sum(Qtd) as Clientes from OpenStat'
      'where data = :datai'
      'group by Data'
      'order by Data')
    Left = 136
    Top = 320
    ParamData = <
      item
        DataType = ftDate
        Name = 'datai'
        ParamType = ptInput
      end>
    object QData: TDateField
      FieldName = 'Data'
    end
    object QLojas: TLargeintField
      FieldName = 'Lojas'
    end
    object QClientes: TLargeintField
      FieldName = 'Clientes'
    end
    object QIPs: TLargeintField
      FieldName = 'IPs'
    end
  end
  object DataSource1: TDataSource
    DataSet = Q
    Left = 472
    Top = 296
  end
end
