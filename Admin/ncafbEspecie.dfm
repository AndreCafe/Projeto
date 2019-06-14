inherited fbEspecie: TfbEspecie
  Caption = 'Formas de Pagamentos'
  ClientWidth = 611
  OldCreateOrder = True
  ExplicitWidth = 619
  ExplicitHeight = 378
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
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
        DataController.KeyFieldNames = 'ID'
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
        Preview.AutoHeight = False
        object TVNome: TcxGridDBColumn
          DataBinding.FieldName = 'Nome'
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
  inherited pmLay: TdxBarPopupMenu
    Left = 192
    Top = 74
  end
  object Tab: TnxTable
    Database = Dados.db
    TableName = 'Especie'
    Left = 16
    Top = 107
    object TabID: TWordField
      FieldName = 'ID'
    end
    object TabTipo: TWordField
      FieldName = 'Tipo'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabPermiteTroco: TBooleanField
      FieldName = 'PermiteTroco'
    end
    object TabPermiteVarios: TBooleanField
      FieldName = 'PermiteVarios'
    end
    object TabPermiteCred: TBooleanField
      FieldName = 'PermiteCred'
    end
    object TabImg: TWordField
      FieldName = 'Img'
    end
    object TabRecVer: TIntegerField
      FieldName = 'RecVer'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 48
    Top = 107
  end
end
