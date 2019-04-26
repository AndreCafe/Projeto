inherited fbFiltroWeb: TfbFiltroWeb
  Caption = 'Bloqueio de Sites'
  ClientHeight = 381
  ClientWidth = 525
  ExplicitWidth = 541
  ExplicitHeight = 417
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 525
    Height = 381
    ExplicitWidth = 525
    ExplicitHeight = 381
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 525
      Height = 54
      ExplicitWidth = 525
      ExplicitHeight = 54
    end
    object Grid: TcxGrid
      Left = 0
      Top = 84
      Width = 525
      Height = 297
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
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
      Top = 54
      Width = 525
      Height = 30
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
        ButtonStyle = ubsFlat
      end
      object cxLabel1: TcxLabel
        Left = 2
        Top = 2
        Align = alLeft
        Caption = 'O bloqueio de sites est'#225' '
        Properties.Alignment.Vert = taVCenter
        AnchorY = 15
      end
      object lbAtivo: TcxLabel
        Left = 124
        Top = 2
        Align = alLeft
        Caption = 'Inativo.'
        Style.TextColor = clRed
        Style.TextStyle = [fsBold]
        Properties.Alignment.Vert = taVCenter
        AnchorY = 15
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    Left = 48
    Top = 128
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
          ItemName = 'cmApagar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAtualizar'
        end
        item
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          Visible = True
          ItemName = 'cmLayout'
        end>
    end
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
      LargeImageIndex = 47
      GlyphLayout = glTop
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 50
      GlyphLayout = glTop
    end
    inherited cmLayout: TdxBarLargeButton
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
