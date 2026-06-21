inherited fbCaixasA: TfbCaixasA
  Left = 293
  Top = 145
  Width = 520
  Height = 371
  Caption = 'Caixas Anteriores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 58
    Width = 512
    Height = 279
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 512
      Height = 279
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.KeyFieldNames = 'Numero'
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
        Filtering.CustomizeDialog = False
        Filtering.MaxDropDownCount = 12
        Filtering.Visible = fvNever
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object VNumero1: TcxGridDBColumn
          Caption = 'N'#250'mero'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 71
          DataBinding.FieldName = 'Numero'
        end
        object VUsuario1: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          Options.Filtering = False
          Width = 80
          DataBinding.FieldName = 'Usuario'
        end
        object VAbertura1: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          DataBinding.FieldName = 'Abertura'
        end
        object VFechamento1: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          DataBinding.FieldName = 'Fechamento'
        end
        object VSaldoFinal1: TcxGridDBColumn
          Caption = 'Total Final'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 123
          DataBinding.FieldName = 'SaldoFinal'
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
            Item = cmEditar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmTotalizar
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
          end
          item
            Item = cmLayout
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
    Left = 64
    Top = 96
    DockControlHeights = (
      0
      0
      58
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      Caption = '&Ver Detalhes'
      Hint = 'Ver Detalhes'
      OnClick = cmEditarClick
      ImageIndex = 20
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
      Caption = 'Totalizar Caixas de um Per'#237'odo'
      Category = 0
      Hint = 'Totalizar Caixas de um Per'#237'odo'
      Visible = ivAlways
      OnClick = cmTotalizarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 42
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
    IndexName = 'INumero'
    Left = 104
    Top = 179
    object TabNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object TabAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object TabUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object TabAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object TabFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object TabAcesso: TCurrencyField
      FieldName = 'Acesso'
    end
    object TabAcessoNaoPago: TCurrencyField
      FieldName = 'AcessoNaoPago'
    end
    object TabAcessoDebPago: TCurrencyField
      FieldName = 'AcessoDebPago'
    end
    object TabAcessoQuant: TCurrencyField
      FieldName = 'AcessoQuant'
    end
    object TabVenda: TCurrencyField
      FieldName = 'Venda'
    end
    object TabVendaNaoPago: TCurrencyField
      FieldName = 'VendaNaoPago'
    end
    object TabVendaDebPago: TCurrencyField
      FieldName = 'VendaDebPago'
    end
    object TabVendaQuant: TCurrencyField
      FieldName = 'VendaQuant'
    end
    object TabSuprimento: TCurrencyField
      FieldName = 'Suprimento'
    end
    object TabSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object TabSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object TabDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object TabTempoAcesso: TFloatField
      FieldName = 'TempoAcesso'
    end
    object TabTempoManutencao: TFloatField
      FieldName = 'TempoManutencao'
    end
    object TabTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
    object TabSaldoFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SaldoFinal'
      Calculated = True
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 144
    Top = 179
  end
end
