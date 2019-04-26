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
    Height = 145
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 13
      Width = 73
      Height = 13
      Caption = 'Contas Criadas'
    end
    object Label2: TLabel
      Left = 213
      Top = 13
      Width = 64
      Height = 13
      Caption = 'Confirmadas:'
    end
    object Label3: TLabel
      Left = 213
      Top = 68
      Width = 74
      Height = 13
      Caption = 'Premium+Free:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 48
      Width = 40
      Height = 13
      Caption = 'Premium'
    end
    object Label5: TLabel
      Left = 13
      Top = 68
      Width = 22
      Height = 13
      Caption = 'Free'
    end
    object lbCriadas: TLabel
      Left = 123
      Top = 13
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
      Left = 291
      Top = 13
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
      Left = 291
      Top = 68
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
      Left = 123
      Top = 48
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
      Left = 123
      Top = 68
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
    object lbDef: TLabel
      Left = 123
      Top = 89
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
    object Label7: TLabel
      Left = 13
      Top = 90
      Width = 50
      Height = 13
      Caption = 'Definitivos'
    end
    object lbTotal: TLabel
      Left = 123
      Top = 113
      Width = 72
      Height = 13
      Caption = 'calculando ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 13
      Top = 113
      Width = 75
      Height = 13
      Caption = 'Base total ativa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 577
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 493
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object PB: TProgressBar
    Left = 0
    Top = 515
    Width = 663
    Height = 17
    Align = alBottom
    TabOrder = 1
  end
  object Grid: TcxGrid
    Left = 0
    Top = 145
    Width = 663
    Height = 370
    Align = alClient
    TabOrder = 2
    ExplicitTop = 216
    ExplicitHeight = 299
    object TV: TcxGridDBTableView
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      object TVDS: TcxGridDBColumn
        DataBinding.FieldName = 'DS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 78
      end
      object TVData: TcxGridDBColumn
        DataBinding.FieldName = 'Data'
        Width = 94
      end
      object TVLojas: TcxGridDBColumn
        DataBinding.FieldName = 'Lojas'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 86
      end
      object TVClientes: TcxGridDBColumn
        Caption = 'Redirs'
        DataBinding.FieldName = 'Clientes'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object tvG: TcxGridDBChartView
      DataController.DataSource = DS
      DiagramLine.Active = True
      object tvGSeries1: TcxGridDBChartSeries
        DataBinding.FieldName = 'Clientes'
      end
    end
    object GL: TcxGridLevel
      GridView = TV
    end
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
    object tCliLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object tCliLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object tCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object tCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tCliUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object tCliAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object tCliEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tCliAtivadoEm: TDateTimeField
      FieldName = 'AtivadoEm'
    end
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
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
      'select Ano, Mes, Dia, Sum(Qtd) as Clientes from OpenStatH'
      
        'where ((Ano = :ano1) and (Mes = :mes1)) or ((Ano = :ano2) and (M' +
        'es = :mes2))'
      'group by Ano, Mes, Dia'
      'order by Ano, Mes, Dia')
    Left = 136
    Top = 320
    ParamData = <
      item
        DataType = ftWord
        Name = 'ano1'
        ParamType = ptInput
      end
      item
        DataType = ftWord
        Name = 'mes1'
        ParamType = ptInput
      end
      item
        DataType = ftWord
        Name = 'ano2'
        ParamType = ptInput
      end
      item
        DataType = ftWord
        Name = 'mes2'
        ParamType = ptInput
      end>
    object QAno: TWordField
      FieldName = 'Ano'
    end
    object QMes: TWordField
      FieldName = 'Mes'
    end
    object QDia: TWordField
      FieldName = 'Dia'
    end
    object QClientes: TLargeintField
      FieldName = 'Clientes'
    end
  end
  object DS: TDataSource
    DataSet = MT
    Left = 472
    Top = 296
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 72
    Top = 336
    object MTData: TDateField
      FieldName = 'Data'
    end
    object MTLojas: TLargeintField
      FieldName = 'Lojas'
    end
    object MTClientes: TLargeintField
      FieldName = 'Clientes'
    end
    object MTDS: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS'
      Size = 3
      Calculated = True
    end
  end
  object tEstL: TnxTable
    Database = nxDB
    TableName = 'OpenStatL'
    IndexName = 'IAnoMesDiaLoja'
    Left = 184
    Top = 320
  end
end
