inherited fbTiposAcesso: TfbTiposAcesso
  Left = 224
  Top = 120
  Caption = 'Grupos de Tarifa'
  ClientHeight = 340
  ClientWidth = 474
  OldCreateOrder = True
  ExplicitWidth = 482
  ExplicitHeight = 367
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 474
    Height = 340
    ExplicitWidth = 474
    ExplicitHeight = 340
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 474
      Height = 36
      ExplicitWidth = 474
      ExplicitHeight = 36
    end
    object Grid: TcxGrid
      AlignWithMargins = True
      Left = 0
      Top = 41
      Width = 474
      Height = 299
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ExplicitTop = 37
      ExplicitHeight = 303
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
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        Preview.AutoHeight = False
        object VNome1: TcxGridDBColumn
          Caption = 'Grupo'
          DataBinding.FieldName = 'Nome'
          Width = 217
        end
        object TVTarifa: TcxGridDBColumn
          DataBinding.FieldName = 'Tarifa'
          PropertiesClassName = 'TcxColorComboBoxProperties'
          Properties.CustomColors = <>
          Properties.ShowDescriptions = False
          Width = 125
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.LargeImages = dmImagens.im24
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
        end>
      OldName = 'BarraTabSheet1'
    end
    inherited cmNovo: TdxBarLargeButton
      Caption = '&Novo Grupo'
      Hint = 'Novo Grupo'
      LargeImageIndex = 6
      OnClick = cmNovoClick
      ShowCaption = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      LargeImageIndex = 2
      OnClick = cmEditarClick
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      LargeImageIndex = 7
      OnClick = cmApagarClick
      ShowCaption = True
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
    OnCalcFields = TabCalcFields
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
    object TabTarifaPadrao: TIntegerField
      FieldName = 'TarifaPadrao'
    end
    object TabTarifa: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Tarifa'
      Calculated = True
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 72
    Top = 123
  end
end
