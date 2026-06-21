inherited fbgMovEst: TfbgMovEst
  Left = 162
  Top = 126
  Width = 719
  Height = 393
  Caption = 'Movimenta'#231#227'o de Estoque'
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMDSimplePanel1: TLMDSimplePanel
    Width = 711
    Height = 347
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 711
      Height = 5
    end
    inherited panDiv1: TLMDSimplePanel
      Top = 5
      Width = 711
      Visible = False
    end
    inherited panPri: TLMDSimplePanel
      Top = 12
      Width = 711
      Height = 335
      inherited LMDSimplePanel2: TLMDSimplePanel
        Top = 1
        Width = 709
        Height = 333
        inherited Grid: TdxDBGrid
          Width = 709
          Height = 308
          KeyField = 'NumSeq'
          ShowSummaryFooter = False
          DataSource = dsTab
          Filter.AutoDataSetFilter = True
          Filter.Criteria = {00000000}
          OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
          object GridDataMov: TdxDBGridDateColumn
            Caption = 'Data'
            Width = 99
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DataMov'
          end
          object GridTipoTran: TdxDBGridImageColumn
            Alignment = taLeftJustify
            Caption = 'Tipo Transa'#231#227'o'
            HeaderAlignment = taCenter
            MinWidth = 16
            Width = 103
            BandIndex = 0
            RowIndex = 0
            FieldName = 'TipoTran'
            Descriptions.Strings = (
              'Acesso + Venda'
              'Venda Avulsa'
              'Compra'
              'Entrada de Estoque'
              'Saida de Estoque')
            ImageIndexes.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4')
            ShowDescription = True
            Values.Strings = (
              '4'
              '7'
              '8'
              '9'
              '10')
          end
          object GridUnitario: TdxDBGridMaskColumn
            Caption = 'Vl. Unit'#225'rio'
            HeaderAlignment = taCenter
            Width = 70
            BandIndex = 0
            RowIndex = 0
            FieldName = 'UnitarioFinal'
            DisableFilter = True
          end
          object GridTotal: TdxDBGridCurrencyColumn
            Caption = 'Valor Total'
            HeaderAlignment = taCenter
            Width = 86
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Total'
            Nullable = False
            DisableFilter = True
          end
          object GridQuant: TdxDBGridMaskColumn
            HeaderAlignment = taCenter
            Width = 65
            BandIndex = 0
            RowIndex = 0
            FieldName = 'QuantFator'
            DisableFilter = True
          end
          object GridEstoquePost: TdxDBGridMaskColumn
            Caption = 'Estoque'
            HeaderAlignment = taCenter
            Width = 82
            BandIndex = 0
            RowIndex = 0
            FieldName = 'EstoquePost'
          end
          object GridContato: TdxDBGridLookupColumn
            Caption = 'Cliente'
            Width = 149
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NomeContato'
          end
        end
        inherited panNovo: TLMDSimplePanel
          Width = 709
          Visible = True
        end
      end
      inherited BarDockControl: TdxBarDockControl
        Width = 709
        Height = 0
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
        Caption = 'Barra2'
        DockControl = BarDockControl
        DockedDockControl = BarDockControl
        DockedLeft = 0
        DockedTop = 26
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 65
        FloatClientHeight = 258
        ItemLinks = <
          item
            Item = FrmBaseGrid.cmNovo
            Visible = True
          end
          item
            Item = FrmBaseGrid.cmApagar
            Visible = True
          end
          item
            Item = FrmBaseGrid.cmEditar
            Visible = True
          end
          item
            BeginGroup = True
            Item = FrmBaseGrid.cmPreviewObs
            Visible = True
          end
          item
            Item = FrmBaseGrid.cmRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = FrmBaseGrid.cmImprimir
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = FrmBaseGrid.cmFechar
            Visible = True
          end>
        Name = 'Barra2'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 1
        UseOwnFont = False
        UseRestSpace = True
        Visible = False
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'barFiltro'
        DockControl = BarDockControl
        DockedDockControl = BarDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 84
        FloatTop = 72
        FloatClientWidth = 69
        FloatClientHeight = 50
        ItemLinks = <
          item
            Item = FrmBaseGrid.cmLayout
            Visible = True
          end
          item
            BeginGroup = True
            Item = FrmBaseGrid.cmSubPeriodo
            Visible = True
          end>
        Name = 'barFiltro'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = False
        WholeRow = False
      end>
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
    inherited cmSubPeriodo: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmHoje
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmOntem
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmEstaSemana
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmEsteMes
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmEsteAno
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmAno
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmMes
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmDias
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmPeriodoTudo
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmInicio
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmFim
          Visible = True
        end>
    end
    inherited cmDias: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cm2dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm3dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm4dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm5dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm6dias
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm1semana
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm1Mes
          Visible = True
        end
        item
          Item = FrmBaseGrid.cm1ano
          Visible = True
        end>
    end
    inherited cmLayout: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmCustomizar
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmSalvarPadrao
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmResetarLayout
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmRestaurar
          Visible = True
        end>
    end
    inherited cmAno: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmAnos
          Visible = True
        end>
    end
    inherited cmMes: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmAno1
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno2
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno3
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno4
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno5
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno6
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno7
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno8
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno9
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmAno10
          Visible = True
        end>
    end
    inherited cmAno1: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmMeses
          Visible = True
        end>
    end
    inherited cmAno2: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmMeses
          Visible = True
        end>
    end
    inherited cmAno3: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmMeses
          Visible = True
        end>
    end
    inherited cmArquivo: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmImprimir
          UserDefine = [udPaintStyle]
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmExportar
          UserDefine = [udPaintStyle]
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmFechar
          Visible = True
        end>
    end
    inherited cmSubEditar: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmNovo
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmEditar
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmApagar
          Visible = True
        end
        item
          BeginGroup = True
          Item = FrmBaseGrid.cmLayout
          Visible = True
        end>
    end
    inherited cmSubExibir: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmPreviewObs
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmRefresh
          Visible = True
        end
        item
          Item = FrmBaseGrid.cmGrafico
          Visible = False
        end>
    end
    inherited cmLocalizar: TdxBarSubItem
      ItemLinks = <
        item
          Item = FrmBaseGrid.cmColunas
          Visible = True
        end>
    end
  end
  inherited pmLocalizar: TdxBarPopupMenu
    ItemLinks = <
      item
        Item = FrmBaseGrid.cmColunas
        Visible = True
      end>
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
