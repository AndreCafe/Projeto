inherited fbTitulos: TfbTitulos
  Left = 224
  Top = 230
  Caption = 'Pagar / Receber - T'#237'tulos'
  ClientHeight = 354
  ClientWidth = 795
  OldCreateOrder = True
  OnCreate = FormCreate
  ExplicitWidth = 803
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 795
    Height = 310
    ExplicitTop = 44
    ExplicitWidth = 795
    ExplicitHeight = 310
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 795
      Height = 310
      Align = alClient
      TabOrder = 0
      object tvFin: TcxGridDBTableView
        OnDblClick = tvFinDblClick
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        DataController.DataSource = dsQ
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Filter.SupportedLike = False
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'Valor'
            Column = tvFinValor
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'ValorPago'
            Column = tvFinValorPago
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Navigator = True
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        OptionsView.NewItemRowInfoText = 'Clique aqui para adicionar um novo item'
        Preview.Column = tvFinObs
        Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
        object tvFinNomedaLoja: TcxGridDBColumn
          DataBinding.FieldName = 'Nome da Loja'
          Width = 246
        end
        object tvFinVencimento: TcxGridDBColumn
          DataBinding.FieldName = 'Vencimento'
          Width = 82
        end
        object tvFinPagamento: TcxGridDBColumn
          DataBinding.FieldName = 'Pagamento'
          Width = 91
        end
        object tvFinValor: TcxGridDBColumn
          DataBinding.FieldName = 'Valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.UseThousandSeparator = True
          FooterAlignmentHorz = taRightJustify
        end
        object tvFinValorPago: TcxGridDBColumn
          Caption = 'Valor Pago'
          DataBinding.FieldName = 'ValorPago'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          FooterAlignmentHorz = taRightJustify
          Width = 86
        end
        object tvFinObs: TcxGridDBColumn
          DataBinding.FieldName = 'Obs'
        end
        object tvFinDoc: TcxGridDBColumn
          DataBinding.FieldName = 'Doc'
        end
        object tvFinDescricao: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
          Width = 289
        end
        object tvFinLancamento: TcxGridDBColumn
          DataBinding.FieldName = 'Lancamento'
          Width = 101
        end
        object tvFinTipo: TcxGridDBColumn
          DataBinding.FieldName = 'Tipo'
          Visible = False
          Width = 55
        end
        object tvFinPC: TcxGridDBColumn
          DataBinding.FieldName = 'PC'
          Visible = False
        end
      end
      object glFin: TcxGridLevel
        GridView = tvFin
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'BarraTabSheet'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmNovo
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmEditar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmMostrar
            UserDefine = [udWidth]
            UserWidth = 222
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            Item = cmImprimir
            Visible = True
          end
          item
            Item = cmExportar
            Visible = True
          end>
        Name = 'BarraTabSheet'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = FrmPri.im32
    DockControlHeights = (
      0
      0
      44
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
    end
    inherited cmExportar: TdxBarLargeButton
      LargeImageIndex = 47
      ShowCaption = False
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 7
      ShowCaption = False
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmMostrar: TdxBarCombo
      Caption = 'Mostrar'
      Category = 0
      Hint = 'Mostrar'
      Visible = ivAlways
      Text = 'N'#227'o pagos'
      OnChange = cmMostrarChange
      ShowCaption = True
      Width = 100
      Items.Strings = (
        'N'#227'o pagos'
        'Pagos'
        'Todos')
      ItemIndex = 0
    end
    object cmBaixar: TdxBarButton
      Caption = '&Baixar'
      Category = 0
      Hint = 'Baixar'
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = '&Editar Cliente'
      Category = 0
      Hint = 'Editar Cliente'
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 30
    end
  end
  object Q: TkbmMWClientQuery
    Client = DM.mwCli
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      
        'SELECT L.Loja as "Nome da Loja", R.*  FROM "Receber" R, "Cliente' +
        '" L ')
    Params = <>
    TransportStreamFormat = DM.BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'ID'
    TableName = 'Receber'
    OnResolveError = QResolveError
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Nome da Loja'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Loja'
        DataType = ftInteger
      end
      item
        Name = 'Vencimento'
        DataType = ftDate
      end
      item
        Name = 'Pagamento'
        DataType = ftDate
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'ValorPago'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Doc'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Lancamento'
        DataType = ftDateTime
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PC'
        DataType = ftInteger
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    VersioningMode = mtvmAllSinceCheckPoint
    FilterOptions = []
    DefaultFormat = DM.BSF
    PersistentFormat = DM.BSF
    AllDataFormat = DM.BSF
    CommaTextFormat = DM.BSF
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    BeforeInsert = QBeforeEdit
    BeforeEdit = QBeforeEdit
    BeforePost = QBeforePost
    AfterPost = QAfterPost
    Left = 80
    Top = 96
    object QNomedaLoja: TStringField
      FieldName = 'Nome da Loja'
      ProviderFlags = []
      Size = 50
    end
    object QID: TIntegerField
      FieldName = 'ID'
    end
    object QLoja: TIntegerField
      FieldName = 'Loja'
    end
    object QVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object QPagamento: TDateField
      FieldName = 'Pagamento'
    end
    object QValor: TCurrencyField
      FieldName = 'Valor'
    end
    object QValorPago: TCurrencyField
      FieldName = 'ValorPago'
    end
    object QObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object QDoc: TStringField
      FieldName = 'Doc'
      Size = 30
    end
    object QDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object QLancamento: TDateTimeField
      FieldName = 'Lancamento'
    end
    object QTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object QPC: TIntegerField
      FieldName = 'PC'
    end
  end
  object dsQ: TDataSource
    DataSet = Q
    Left = 120
    Top = 96
  end
end
