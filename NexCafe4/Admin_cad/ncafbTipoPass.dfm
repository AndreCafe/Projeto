inherited fbTiposPass: TfbTiposPass
  Caption = 'Passaportes'
  ClientWidth = 768
  OldCreateOrder = True
  ExplicitWidth = 784
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 768
    Height = 218
    ExplicitTop = 44
    ExplicitWidth = 768
    ExplicitHeight = 218
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 768
      Height = 218
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
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
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnHorzSizing = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVNome1: TcxGridDBColumn
          DataBinding.FieldName = 'Nome'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 50
          Properties.ReadOnly = False
          MinWidth = 226
          Width = 226
        end
        object TVValor1: TcxGridDBColumn
          DataBinding.FieldName = 'Valor'
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
    Left = 32
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
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmImpCodPrePago'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarLargeButton1'
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
    object cmImpCodPrePago: TdxBarLargeButton
      Caption = 'Imprimir Cart'#245'es de Tempo'
      Category = 0
      Hint = 'Imprimir Cart'#245'es de Tempo'
      Visible = ivAlways
      OnClick = cmImpCodPrePagoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 66
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
    Database = Dados.db
    TableName = 'TipoPass'
    IndexName = 'IID'
    Left = 32
    Top = 123
    object TabID: TAutoIncField
      FieldName = 'ID'
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
