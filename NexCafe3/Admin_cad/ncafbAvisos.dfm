inherited fbAvisos: TfbAvisos
  Caption = 'Avisos de Tempo Acabando'
  ClientWidth = 611
  OldCreateOrder = True
  ExplicitWidth = 619
  ExplicitHeight = 289
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 611
    Height = 218
    ExplicitTop = 44
    ExplicitWidth = 611
    ExplicitHeight = 218
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 611
      Height = 218
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        NavigatorButtons.ConfirmDelete = False
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
        Preview.AutoHeight = False
        object VMinutos1: TcxGridDBColumn
          DataBinding.FieldName = 'Minutos'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 69
        end
        object TVTipo: TcxGridDBColumn
          DataBinding.FieldName = 'Tipo'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Aviso de Texto'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = 'Aviso Sonoro'
              Value = 1
            end
            item
              Description = 'Aviso de Texto e Som'
              Value = 2
            end>
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Width = 138
        end
        object VAvisoTexto1: TcxGridDBColumn
          Caption = 'Aviso de Texto'
          DataBinding.FieldName = 'AvisoTexto'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 213
        end
        object VSegAvisoTexto1: TcxGridDBColumn
          Caption = 'Tempo Aviso (Seg)'
          DataBinding.FieldName = 'SegAvisoTexto'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 120
        end
        object VPiscarAvisoTexto1: TcxGridDBColumn
          Caption = 'Piscar'
          DataBinding.FieldName = 'PiscarAvisoTexto'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 71
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
    LookAndFeel.NativeStyle = True
    Style = bmsUseLookAndFeel
    Left = 48
    Top = 72
    DockControlHeights = (
      0
      0
      44
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
    TableName = 'Aviso'
    Left = 16
    Top = 107
    object TabMinutos: TWordField
      FieldName = 'Minutos'
    end
    object TabAvisoTexto: TStringField
      FieldName = 'AvisoTexto'
      Size = 50
    end
    object TabSegAvisoTexto: TWordField
      FieldName = 'SegAvisoTexto'
    end
    object TabPiscarAvisoTexto: TBooleanField
      FieldName = 'PiscarAvisoTexto'
    end
    object TabSom: TBlobField
      FieldName = 'Som'
    end
    object TabTipo: TWordField
      Alignment = taLeftJustify
      FieldName = 'Tipo'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 48
    Top = 107
  end
end
