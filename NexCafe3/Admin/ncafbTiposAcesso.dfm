inherited fbTiposAcesso: TfbTiposAcesso
  Left = 224
  Top = 120
  Caption = 'Tipos de Acesso'
  ClientHeight = 340
  ClientWidth = 516
  OldCreateOrder = True
  ExplicitWidth = 532
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 516
    Height = 340
    ExplicitWidth = 516
    ExplicitHeight = 340
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 516
      Height = 38
      ExplicitWidth = 516
      ExplicitHeight = 38
    end
    object Grid: TcxGrid
      Left = 0
      Top = 38
      Width = 516
      Height = 302
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        NavigatorButtons.ConfirmDelete = False
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
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object VNome1: TcxGridDBColumn
          DataBinding.FieldName = 'Nome'
          Width = 192
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    LookAndFeel.Kind = lfStandard
    Left = 104
    Top = 120
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          Visible = True
          ItemName = 'cmApagar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAtualizar'
        end
        item
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'cmExportar'
        end>
      OldName = 'BarraTabSheet1'
    end
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
    IndexName = 'IID'
    Left = 24
    Top = 123
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object TabID: TWordField
      FieldName = 'ID'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 72
    Top = 123
  end
end
