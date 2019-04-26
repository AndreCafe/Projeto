inherited fbFiltroWeb: TfbFiltroWeb
  Caption = 'Bloqueio de Sites'
  ClientHeight = 381
  ClientWidth = 525
  ExplicitWidth = 533
  ExplicitHeight = 409
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 58
    Width = 525
    Height = 323
    ExplicitTop = 58
    ExplicitWidth = 525
    ExplicitHeight = 323
    object Grid: TcxGrid
      Left = 0
      Top = 30
      Width = 525
      Height = 293
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object TV: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = TVURL
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        object TVURL: TcxGridDBColumn
          Caption = 'Sites BLOQUEADOS'
          DataBinding.FieldName = 'URL'
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object tlmdsp: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 525
      Height = 30
      UseDockManager = False
      Align = alTop
      Bevel.Mode = bmEdge
      TabOrder = 1
      object btnAtivar: TLMDSpeedButton
        Left = 172
        Top = 2
        Width = 133
        Height = 26
        Caption = 'Clique aqui para Ativar'
        OnClick = btnAtivarClick
        Align = alLeft
        Style = ubsFlat
      end
      object cxLabel1: TcxLabel
        Left = 2
        Top = 2
        Align = alLeft
        Caption = 'O bloqueio de sites est'#225' '
        Properties.Alignment.Vert = taVCenter
      end
      object lbAtivo: TcxLabel
        Left = 124
        Top = 2
        Align = alLeft
        Caption = 'Inativo.'
        Properties.Alignment.Vert = taVCenter
        Style.TextColor = clRed
        Style.TextStyle = [fsBold]
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
            Item = cmApagar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmExportar
            Visible = True
          end
          item
            Item = cmImprimir
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
            Visible = True
          end
          item
            Item = cmExportar
            Visible = True
          end
          item
            Item = cmLayout
            Visible = True
          end>
        Name = 'BarraTabSheet'
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
    Top = 128
    DockControlHeights = (
      0
      0
      58
      0)
    inherited cmNovo: TdxBarLargeButton
      Caption = 'Adicionar Site'
      Hint = 'Adicionar Site'
      OnClick = cmNovoClick
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      Caption = '&Remover Site'
      Hint = 'Remover Site'
      OnClick = cmApagarClick
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      GlyphLayout = glTop
    end
    inherited cmExportar: TdxBarLargeButton
      GlyphLayout = glTop
      LargeImageIndex = 47
    end
    inherited cmImprimir: TdxBarLargeButton
      GlyphLayout = glTop
      LargeImageIndex = 50
    end
    inherited cmLayout: TdxBarLargeButton
      Align = iaRight
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Top = 113
  end
  inherited CP: TdxComponentPrinter
    Left = 136
    Top = 122
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 224
    Top = 114
  end
  object Tab: TnxTable
    Database = Dados.db
    TableName = 'FiltroWeb'
    IndexName = 'IURL'
    Left = 88
    Top = 184
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabURL: TStringField
      FieldName = 'URL'
      Size = 300
    end
    object TabLiberar: TBooleanField
      FieldName = 'Liberar'
    end
  end
  object DS: TDataSource
    DataSet = Tab
    Left = 88
    Top = 216
  end
end
