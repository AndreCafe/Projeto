inherited fbPREstat: TfbPREstat
  Left = 274
  Top = 172
  Width = 503
  Height = 394
  Caption = 'Pagar / Receber - Estat'#237'sticas'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 495
    Height = 323
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 495
      Height = 323
      Align = alClient
      TabOrder = 0
      object tvFin: TcxGridDBTableView
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
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmMostrar: TdxBarCombo
      Caption = 'Mostrar'
      Category = 0
      Hint = 'Mostrar'
      Visible = ivAlways
      Text = 'Total pago por m'#234's'
      OnChange = cmMostrarChange
      ShowCaption = True
      Width = 100
      Items.Strings = (
        'Total pago por m'#234's'
        'Total lan'#231'ado por m'#234's'
        'Total a vencer por m'#234's')
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
    Client = DM.mwCli
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
    Left = 80
    Top = 96
  end
  object dsQ: TDataSource
    DataSet = Q
    Left = 120
    Top = 96
  end
end
