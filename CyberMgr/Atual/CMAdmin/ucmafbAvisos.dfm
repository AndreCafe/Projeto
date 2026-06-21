inherited fbAvisos: TfbAvisos
  Caption = 'Avisos de T'#233'rmino de Tempo'
  ClientWidth = 611
  OldCreateOrder = True
  ExplicitWidth = 619
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
        Filtering.ColumnPopupMaxDropDownItemCount = 12
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
          Width = 133
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
        object VTocarSom1: TcxGridDBColumn
          Caption = 'Aviso Sonoro'
          DataBinding.FieldName = 'TocarSom'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.NullStyle = nssUnchecked
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 111
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
    Left = 48
    Top = 72
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
    object TabTocarSom: TBooleanField
      FieldName = 'TocarSom'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 48
    Top = 107
  end
end
