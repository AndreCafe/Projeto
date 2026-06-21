inherited fbMovEst: TfbMovEst
  Left = 144
  Top = 157
  Width = 499
  Caption = 'fbMovEst'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 44
    Width = 491
    Height = 227
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 491
      Height = 227
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object TV: TcxGridDBTableView
        OnDblClick = TVDblClick
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'NumSeq'
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
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVDataMov: TcxGridDBColumn
          Caption = 'Data'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          Width = 99
          DataBinding.FieldName = 'DataMov'
        end
        object TVTipoTran: TcxGridDBColumn
          Caption = 'Tipo Transa'#231#227'o'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.Items = <
            item
              Description = 'Acesso + Venda'
              ImageIndex = 0
              Value = 4
            end
            item
              Description = 'Venda Avulsa'
              ImageIndex = 1
              Value = 7
            end
            item
              Description = 'Compra'
              ImageIndex = 2
              Value = 8
            end
            item
              Description = 'Entrada de Estoque'
              ImageIndex = 3
              Value = 9
            end
            item
              Description = 'Saida de Estoque'
              ImageIndex = 4
              Value = 10
            end>
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 16
          Width = 103
          DataBinding.FieldName = 'TipoTran'
        end
        object TVUnitarioFinal: TcxGridDBColumn
          Caption = 'Vl. Unit'#225'rio'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 70
          DataBinding.FieldName = 'UnitarioFinal'
        end
        object TVTotal: TcxGridDBColumn
          Caption = 'Valor Total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.Nullable = False
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 86
          DataBinding.FieldName = 'Total'
        end
        object TVQuantFator: TcxGridDBColumn
          Caption = 'Quantidade'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 65
          DataBinding.FieldName = 'QuantFator'
        end
        object TVEstoquePost: TcxGridDBColumn
          Caption = 'Estoque'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 82
          DataBinding.FieldName = 'EstoquePost'
        end
        object TVNomeContato: TcxGridDBColumn
          Caption = 'Cliente'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.ImmediateDropDown = False
          Properties.KeyFieldNames = 'Codigo'
          Properties.ListColumns = <
            item
              FieldName = 'Nome'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.MaxLength = 40
          Properties.ReadOnly = False
          Width = 149
          DataBinding.FieldName = 'NomeContato'
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
            Item = cmPeriodo
            Visible = True
          end
          item
            BeginGroup = True
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
    DockControlHeights = (
      0
      0
      44
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmExportar: TdxBarLargeButton
      LargeImageIndex = 47
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 7
    end
    inherited cmLayout: TdxBarLargeButton
      Align = iaRight
      GlyphLayout = glLeft
      ImageIndex = -1
    end
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = TabCalcFields
    TableName = 'MovEst'
    IndexName = 'IProduto'
    Left = 145
    Top = 182
    object TabNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object TabTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object TabProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object TabQuant: TFloatField
      FieldName = 'Quant'
    end
    object TabUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object TabTotal: TCurrencyField
      FieldName = 'Total'
    end
    object TabItem: TWordField
      FieldName = 'Item'
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabDataMov: TDateTimeField
      FieldName = 'DataMov'
    end
    object TabDataPag: TDateTimeField
      FieldName = 'DataPag'
    end
    object TabEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object TabCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object TabEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object TabTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object TabContato: TIntegerField
      FieldName = 'Contato'
    end
    object TabCaixaMov: TIntegerField
      FieldName = 'CaixaMov'
    end
    object TabCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object TabCategoria: TStringField
      FieldName = 'Categoria'
    end
    object TabQuantFator: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QuantFator'
      Calculated = True
    end
    object TabEstoquePost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoquePost'
      Calculated = True
    end
    object TabNomeContato: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeContato'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Contato'
      Size = 40
      Lookup = True
    end
    object TabTotalFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object TabUnitarioFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'UnitarioFinal'
      Calculated = True
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 185
    Top = 182
  end
end
