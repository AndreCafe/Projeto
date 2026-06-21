inherited fbPagRec: TfbPagRec
  Left = 274
  Top = 172
  Width = 503
  Height = 394
  Caption = 'Contas '#224' Pagar/Receber'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 495
    Height = 334
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 495
      Height = 334
      Align = alClient
      TabOrder = 0
      object tvFin: TcxGridDBTableView
        OnDblClick = tvFinDblClick
        DataController.DataSource = dsQ
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Filter.SupportedLike = False
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Navigator = True
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        OptionsView.NewItemRowInfoText = 'Clique aqui para adicionar um novo item'
        Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
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
            Item = cmBaixar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmMostrar
            UserDefine = [udWidth]
            UserWidth = 222
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
    DockControlHeights = (
      0
      0
      26
      0)
    inherited cmEditar: TdxBarButton
      OnClick = cmEditarClick
    end
    inherited cmAtualizar: TdxBarButton
      OnClick = cmAtualizarClick
    end
    object cmMostrar: TdxBarCombo
      Caption = 'Mostrar'
      Category = 0
      Hint = 'Mostrar'
      Visible = ivAlways
      Text = 'Pagar/Receber'
      OnChange = cmMostrarChange
      ShowCaption = True
      Width = 100
      Items.Strings = (
        'Pagar/Receber'
        'Pagos/Recebidos'
        'Todos')
      ItemIndex = 0
    end
    object cmBaixar: TdxBarButton
      Caption = '&Baixar'
      Category = 0
      Hint = 'Baixar'
      Visible = ivAlways
    end
  end
  object Q: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'Admin'
    QueryServiceVersion = '100'
    CacheParams = ptUnknown
    SessionName = 'mwPS'
    CacheFlags = []
    Query.Strings = (
      'select * from receber')
    Params = <>
    TransportStreamFormat = DM.BSF
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'ID'
    TableName = 'Receber'
    RequeryDetails = False
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
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
    EnableVersioning = True
    VersioningMode = mtvmAllSinceCheckPoint
    FilterOptions = []
    DefaultFormat = DM.BSF
    PersistentFormat = DM.BSF
    AllDataFormat = DM.BSF
    CommaTextFormat = DM.BSF
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    BeforePost = QBeforePost
    Left = 80
    Top = 96
  end
  object dsQ: TDataSource
    DataSet = Q
    Left = 120
    Top = 96
  end
end
