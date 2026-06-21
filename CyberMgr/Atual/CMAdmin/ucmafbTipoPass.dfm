inherited fbTiposPass: TfbTiposPass
  Caption = 'Passaportes'
  ClientWidth = 768
  OldCreateOrder = True
  ExplicitWidth = 776
  ExplicitHeight = 289
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 768
    Height = 218
    ExplicitTop = 44
    ExplicitWidth = 584
    ExplicitHeight = 218
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 768
      Height = 218
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      ExplicitWidth = 584
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.KeyFieldNames = 'Codigo'
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
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnHorzSizing = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVNome1: TcxGridDBColumn
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 50
          Properties.ReadOnly = False
          MinWidth = 226
          Width = 226
          DataBinding.FieldName = 'Nome'
        end
        object TVValor1: TcxGridDBColumn
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MaxValue = True
          Properties.AssignedValues.MinValue = True
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 127
          Width = 127
          DataBinding.FieldName = 'Valor'
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
            Item = cmImpCodPrePago
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
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
    Left = 32
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
    object cmImpCodPrePago: TdxBarLargeButton
      Caption = 'Imprimir Cart'#245'es de Tempo'
      Category = 0
      Hint = 'Imprimir Cart'#245'es de Tempo'
      Visible = ivAlways
      OnClick = cmImpCodPrePagoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 50
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Lista de Passaportes'
      Category = 0
      Hint = 'Lista de Passaportes'
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Consultar passaportes'
      Category = 0
      Hint = 'Consultar passaportes'
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 48
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 72
    Top = 73
  end
  inherited CP: TdxComponentPrinter
    Left = 112
    Top = 74
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 64
    Top = 123
  end
  object Tab: TnxTable
    ActiveDesigntime = True
    Database = Dados.db
    TableName = 'TipoPass'
    IndexName = 'ICodigo'
    Left = 32
    Top = 123
    object TabCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object TabTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object TabExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object TabMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object TabDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object TabDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object TabDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object TabDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object TabDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object TabDia7: TIntegerField
      FieldName = 'Dia7'
    end
  end
end
