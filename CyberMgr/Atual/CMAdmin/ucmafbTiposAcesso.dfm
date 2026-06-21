inherited fbTiposAcesso: TfbTiposAcesso
  Left = 224
  Top = 120
  Caption = 'Tipos de Acesso'
  ClientHeight = 340
  ClientWidth = 516
  OldCreateOrder = True
  ExplicitWidth = 524
  ExplicitHeight = 367
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 516
    Height = 296
    ExplicitTop = 44
    ExplicitWidth = 516
    ExplicitHeight = 296
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 516
      Height = 296
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <
          item
            Links = <>
            SummaryItems.Separator = ', '
            SummaryItems = <
              item
                Kind = skCount
              end>
          end>
        NavigatorButtons.ConfirmDelete = False
        Filtering.MaxDropDownCount = 12
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object VNome1: TcxGridDBColumn
          Width = 192
          DataBinding.FieldName = 'Nome'
        end
      end
      object GL: TcxGridLevel
        GridView = TV
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
            Visible = True
          end
          item
            Item = cmEditar
            Visible = True
          end
          item
            Item = cmApagar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
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
        Name = 'BarraTabSheet1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
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
    Left = 104
    Top = 120
    DockControlHeights = (
      0
      0
      44
      0)
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      OnClick = cmApagarClick
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
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 136
    Top = 121
  end
  inherited CP: TdxComponentPrinter
    Left = 168
    Top = 122
  end
  object Tab: TnxTable
    Database = Dados.db
    TableName = 'TipoAcesso'
    IndexName = 'ICodigo'
    Left = 32
    Top = 123
    object TabCodigo: TWordField
      FieldName = 'Codigo'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 72
    Top = 123
  end
end
