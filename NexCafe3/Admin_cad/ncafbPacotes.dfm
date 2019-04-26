inherited fbPacotes: TfbPacotes
  Left = 224
  Top = 120
  Caption = 'fbPacotes'
  ClientHeight = 340
  ClientWidth = 516
  OldCreateOrder = True
  ExplicitWidth = 524
  ExplicitHeight = 368
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
        NavigatorButtons.ConfirmDelete = False
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
        Filtering.ColumnPopupMaxDropDownItemCount = 12
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVCodigo1: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'ID'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          Width = 106
        end
        object TVHoras1: TcxGridDBColumn
          DataBinding.FieldName = 'Minutos'
          PropertiesClassName = 'TcxMaskEditProperties'
          HeaderAlignmentHorz = taCenter
          SortIndex = 0
          SortOrder = soAscending
          Width = 99
        end
        object TVValorTotal1: TcxGridDBColumn
          DataBinding.FieldName = 'Valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MaxValue = True
          Properties.AssignedValues.MinValue = True
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 94
        end
        object TVNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'Descr'
          Width = 220
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
    TableName = 'Pacote'
    IndexName = 'IID'
    Left = 32
    Top = 123
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabDescr: TStringField
      FieldName = 'Descr'
      Size = 30
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 72
    Top = 123
  end
end
