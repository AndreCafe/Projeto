inherited fbCaixasA: TfbCaixasA
  Left = 293
  Top = 145
  Caption = 'Caixas Anteriores'
  ClientHeight = 344
  ClientWidth = 727
  OldCreateOrder = True
  ExplicitWidth = 735
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 58
    Width = 727
    Height = 286
    ExplicitTop = 58
    ExplicitWidth = 727
    ExplicitHeight = 286
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 727
      Height = 286
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      object TV: TcxGridDBTableView
        PopupMenu = pmCaixa
        OnDblClick = cmEditarClick
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Enabled = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Enabled = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Enabled = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Enabled = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.SaveBookmark.Enabled = False
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Visible = False
        NavigatorButtons.Filter.Enabled = False
        NavigatorButtons.Filter.Visible = False
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
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
        DateTimeHandling.Filters = [dtfMonths, dtfYears]
        DateTimeHandling.IgnoreTimeForFiltering = True
        DateTimeHandling.MonthFormat = 'mm'
        DateTimeHandling.YearFormat = 'yyyy'
        DateTimeHandling.DateFormat = 'dd/mm/yyyy'
        DateTimeHandling.Grouping = dtgByDate
        DateTimeHandling.HourFormat = 'hh:mm'
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Navigator = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object VNumero1: TcxGridDBColumn
          Caption = 'N'#250'm'
          DataBinding.FieldName = 'ID'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 54
        end
        object VUsuario1: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'Usuario'
          Width = 76
        end
        object VAbertura1: TcxGridDBColumn
          DataBinding.FieldName = 'Abertura'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          DateTimeGrouping = dtgByDate
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object VFechamento1: TcxGridDBColumn
          DataBinding.FieldName = 'Fechamento'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          DateTimeGrouping = dtgByDate
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object TVSaldoAnt: TcxGridDBColumn
          Caption = 'Saldo Inicial'
          DataBinding.FieldName = 'SaldoAnt'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 82
        end
        object TVTotal: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'TotalFinal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnCustomDrawCell = TVTotalCustomDrawCell
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 78
        end
        object TVSupr: TcxGridDBColumn
          Caption = 'Suprimento (+)'
          DataBinding.FieldName = 'Supr'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = TVSangriaGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Width = 95
        end
        object TVSangria: TcxGridDBColumn
          Caption = 'Sangria (-)'
          DataBinding.FieldName = 'Sangria'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = TVSangriaGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 87
        end
        object TVSaldoFinal: TcxGridDBColumn
          Caption = 'Saldo Final'
          DataBinding.FieldName = 'SaldoFinal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnCustomDrawCell = TVTotalCustomDrawCell
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 81
        end
        object TVReproc: TcxGridDBColumn
          Caption = 'Reprocessado em'
          DataBinding.FieldName = 'Reproc'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 105
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
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    Style = bmsUseLookAndFeel
    Left = 64
    Top = 96
    DockControlHeights = (
      0
      0
      58
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmCorrigeDataHora'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmTotalizar'
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
        end
        item
          Visible = True
          ItemName = 'cmLayout'
        end>
      OldName = 'BarraTabSheet1'
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      Caption = '&Ver Detalhes'
      Hint = 'Ver Detalhes'
      OnClick = cmEditarClick
      ImageIndex = -1
    end
    inherited cmApagar: TdxBarLargeButton
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
      Align = iaRight
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmTotalizar: TdxBarLargeButton
      Caption = 'Totalizar Per'#237'odo'
      Category = 0
      Hint = 'Totalizar Per'#237'odo'
      Visible = ivAlways
      OnClick = cmTotalizarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 42
    end
    object cmCorrigeDataHora: TdxBarLargeButton
      Caption = 'Corrigir Data/Hora Caixa'
      Category = 0
      Hint = 'Corrigir Data/Hora Caixa'
      Visible = ivAlways
      OnClick = cmCorrigeDataHoraClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 69
    end
    object cmReprocessar: TdxBarButton
      Caption = 'Reprocessar Caixa'
      Category = 0
      Hint = 'Reprocessar Caixa'
      Visible = ivAlways
      OnClick = cmReprocessarClick
    end
    object cmVerDet: TdxBarButton
      Caption = 'Ver Detalhes'
      Category = 0
      Hint = 'Ver Detalhes'
      Visible = ivAlways
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 24
    Top = 105
  end
  object Tab: TnxTable
    Database = Dados.db
    Filter = 'Aberto = False'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = TabCalcFields
    TableName = 'Caixa'
    IndexName = 'IID'
    Left = 104
    Top = 179
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object TabUsuario: TStringField
      FieldName = 'Usuario'
    end
    object TabAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object TabFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object TabTotalFinal: TCurrencyField
      FieldName = 'TotalFinal'
    end
    object TabDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object TabCancelamentos: TCurrencyField
      FieldName = 'Cancelamentos'
    end
    object TabSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabSaldoFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SaldoFinal'
      Calculated = True
    end
    object TabSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object TabSupr: TCurrencyField
      FieldName = 'Supr'
    end
    object TabReproc: TDateTimeField
      FieldName = 'Reproc'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 144
    Top = 179
  end
  object pmCaixa: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmEditar'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmCorrigeDataHora'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmReprocessar'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmTotalizar'
      end>
    UseOwnFont = False
    OnPopup = pmCaixaPopup
    Left = 272
    Top = 152
  end
end
