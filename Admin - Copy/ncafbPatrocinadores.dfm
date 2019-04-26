inherited fbPatrocinadores: TfbPatrocinadores
  Caption = 'Patrocinadores'
  ClientWidth = 611
  OldCreateOrder = True
  ExplicitWidth = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TLMDSimplePanel
    Width = 611
    ExplicitWidth = 611
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 611
      Height = 44
      ExplicitWidth = 611
      ExplicitHeight = 44
    end
    object Grid: TcxGrid
      Left = 0
      Top = 44
      Width = 611
      Height = 307
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'Minutos'
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
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.Column = TVDominiosPerm
        Preview.MaxLineCount = 0
        Preview.Visible = True
        object TVNome: TcxGridDBColumn
          Caption = 'Patrocinador'
          DataBinding.FieldName = 'Nome'
        end
        object TVURLArea1: TcxGridDBColumn
          Caption = 'URL Principal'
          DataBinding.FieldName = 'URLArea1'
          Width = 216
        end
        object TVURLArea2: TcxGridDBColumn
          Caption = 'URL Secund'#225'ria'
          DataBinding.FieldName = 'URLArea2'
          Width = 245
        end
        object TVDominiosPerm: TcxGridDBColumn
          DataBinding.FieldName = 'DominiosPerm'
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Left = 48
    Top = 72
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
        end>
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
    Top = 73
  end
  inherited CP: TdxComponentPrinter
    Left = 48
    Top = 146
  end
  inherited dlgExp: TSaveDialog
    Left = 16
  end
  object Tab: TnxTable
    Database = Dados.db
    TableName = 'Patrocinio'
    IndexName = 'INome'
    Left = 16
    Top = 107
    object TabNome: TStringField
      FieldName = 'Nome'
    end
    object TabURLArea1: TMemoField
      FieldName = 'URLArea1'
      BlobType = ftMemo
    end
    object TabURLArea2: TMemoField
      FieldName = 'URLArea2'
      BlobType = ftMemo
    end
    object TabDominiosPerm: TMemoField
      FieldName = 'DominiosPerm'
      BlobType = ftMemo
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 48
    Top = 107
  end
end
