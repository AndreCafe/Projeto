inherited fbgCaixas: TfbgCaixas
  Tag = 8
  Left = 112
  Top = 158
  Width = 800
  Height = 471
  Caption = 'Caixa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMDSimplePanel1: TLMDSimplePanel
    Top = 67
    Width = 792
    Height = 377
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 782
      Height = 5
    end
    inherited panDiv1: TLMDSimplePanel
      Top = 10
      Width = 782
    end
    inherited panPri: TLMDSimplePanel
      Top = 17
      Width = 782
      Height = 355
      inherited LMDSimplePanel2: TLMDSimplePanel
        Width = 780
        Height = 327
        inherited Grid: TdxDBGrid
          Width = 780
          Height = 327
          DataSource = dsTab
          Filter.Criteria = {00000000}
          OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
          object GridAberto: TdxDBGridCheckColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 63
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Aberto'
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object GridNumero: TdxDBGridMaskColumn
            Alignment = taCenter
            Caption = 'Nº'
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Numero'
          end
          object GridAbertura: TdxDBGridDateColumn
            Width = 112
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Abertura'
          end
          object GridFechamento: TdxDBGridDateColumn
            Width = 112
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Fechamento'
          end
          object GridUsuario: TdxDBGridMaskColumn
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Usuario'
          end
          object GridSubTotal: TdxDBGridCurrencyColumn
            Caption = 'Sub-Total'
            Width = 80
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Subtotal'
            Nullable = False
          end
          object GridSaldoFinal: TdxDBGridCurrencyColumn
            Caption = 'Total-Final'
            Width = 84
            BandIndex = 0
            RowIndex = 0
            FieldName = 'SaldoFinal'
            Nullable = False
          end
          object GridLancExtrasE: TdxDBGridCurrencyColumn
            Caption = 'Entradas Extras'
            Width = 103
            BandIndex = 0
            RowIndex = 0
            FieldName = 'LancExtrasE'
            Nullable = False
          end
          object GridLancExtrasS: TdxDBGridCurrencyColumn
            Caption = 'Saídas Extras'
            Width = 95
            BandIndex = 0
            RowIndex = 0
            FieldName = 'LancExtrasS'
            Nullable = False
          end
          object GridInternet: TdxDBGridCurrencyColumn
            Caption = 'Máquinas'
            Width = 107
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Internet'
            Nullable = False
          end
          object GridVendas: TdxDBGridCurrencyColumn
            Width = 75
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Vendas'
            Nullable = False
          end
          object GridSaldoAnt: TdxDBGridCurrencyColumn
            Caption = 'Saldo Anterior'
            Width = 118
            BandIndex = 0
            RowIndex = 0
            FieldName = 'SaldoAnt'
            Nullable = False
          end
          object GridDescontos: TdxDBGridCurrencyColumn
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Descontos'
            Nullable = False
          end
        end
      end
      inherited BarDockControl: TdxBarDockControl
        Width = 780
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
        Caption = 'barMenu'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        IsMainMenu = True
        ItemLinks = <
          item
            Item = cmArquivo
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmSubEditar
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmSubExibir
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        MultiLine = True
        Name = 'barMenu'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = True
        UseRecentItems = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Barra2'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 23
        DockingStyle = dsTop
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmEditar
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmPreviewObs
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmRefresh
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmGrafico
            UserDefine = [udPaintStyle]
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmImprimeCaixa
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmFechar
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Barra2'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 1
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
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
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmLayout
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmSubPeriodo
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'barFiltro'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    Categories.ItemsVisibles = (
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
      True)
    DockControlHeights = (
      0
      0
      67
      0)
    inherited cmSubPeriodo: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmHoje
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmEstaSemana
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmEsteMes
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmEsteAno
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmAno
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmMes
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmDias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmPeriodoTudo
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmInicio
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmFim
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmDias: TdxBarSubItem
      ItemLinks = <
        item
          Item = cm2dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm3dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm4dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm5dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm6dias
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm1semana
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm1Mes
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cm1ano
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmLayout: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmCustomizar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmLayoutSalvar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmSalvarAtual
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmOpcoes
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmResetarLayout
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmLayouts
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmAno: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmAnos
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmMes: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmAno1
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno2
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno3
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno4
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno5
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno6
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno7
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno8
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno9
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmAno10
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmAno1: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmMeses
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmAno2: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmMeses
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmAno3: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmMeses
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmOpcoes: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmTotalizar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmSalvarPadrao
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmRestaurar
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmArquivo: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmImprimir
          UserDefine = [udPaintStyle]
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmExportar
          UserDefine = [udPaintStyle]
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmFechar
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmSubEditar: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmNovo
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmApagar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmEditar
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmLayout
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmSubPeriodo
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmEditar: TdxBarLargeButton
      Caption = '&Ver Resumo'
      Hint = 'Ver Resumo'
    end
    inherited cmSubExibir: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmPreviewObs
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmRefresh
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          Item = cmGrafico
          UserGlyph.Data = {00000000}
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmLocalizar
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    inherited cmLocalizar: TdxBarSubItem
      ItemLinks = <
        item
          Item = cmColunas
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    object cmImprimeCaixa: TdxBarLargeButton
      Caption = 'Imprimir Caixa'
      Category = 0
      Hint = 'Imprimir Caixa'
      Visible = ivAlways
      UnclickAfterDoing = False
      OnClick = cmImprimeCaixaClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        B6060000424DB606000000000000760000002800000014000000140000000100
        2000000000004006000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000080808000C0C0C00080808000C0C0C00080808000C0C0
        C00080808000C0C0C0008080800000000000808080000000000080808000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000808080000000000080808000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C00000FF
        000000FF000000FF0000C0C0C000FFFFFF000000000000000000000000008080
        8000FF00FF00FF00FF00FF00FF00FF00FF0000000000C0C0C000FFFFFF00C0C0
        C000FFFFFF00C0C0C000FFFFFF000000FF000000FF000000FF00FFFFFF00C0C0
        C00000000000808080000000000080808000FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000C0C0C000808080000000
        000080808000FF00FF00FF00FF00FF00FF0000000000C0C0C000FFFFFF00C0C0
        C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
        0000C0C0C00000000000C0C0C0000000000080808000FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FFFFFF0000000000C0C0C000000000000000
        000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
        FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000FFFFFF0000000000C0C0C00000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
        00000000000000000000FFFFFF0000000000000000000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00000000000000
        0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  inherited pmLocalizar: TdxBarPopupMenu
    ItemLinks = <
      item
        Item = cmColunas
        UserGlyph.Data = {00000000}
        Visible = True
      end>
  end
  object Tab: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Abertura'
        DataType = ftDateTime
      end
      item
        Name = 'Fechamento'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LancExtrasE'
        DataType = ftCurrency
      end
      item
        Name = 'LancExtrasS'
        DataType = ftCurrency
      end
      item
        Name = 'Descontos'
        DataType = ftCurrency
      end
      item
        Name = 'Internet'
        DataType = ftCurrency
      end
      item
        Name = 'Pacotes'
        DataType = ftCurrency
      end
      item
        Name = 'Vendas'
        DataType = ftCurrency
      end
      item
        Name = 'SaldoAnt'
        DataType = ftCurrency
      end
      item
        Name = 'Aberto'
        DataType = ftBoolean
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'AguardandoPagto'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end>
    SessionName = 'SesPad'
    TableName = 'Caixa'
    AfterInsert = TabAfterInsert
    OnCalcFields = TabCalcFields
    Left = 104
    Top = 179
    object TabNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object TabAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object TabFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object TabUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object TabDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object TabInternet: TCurrencyField
      FieldName = 'Internet'
    end
    object TabSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object TabAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object TabVendas: TCurrencyField
      FieldName = 'Vendas'
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
    object TabPacotes: TCurrencyField
      FieldName = 'Pacotes'
    end
    object TabSubtotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Subtotal'
      Calculated = True
    end
    object TabLancExtrasE: TCurrencyField
      FieldName = 'LancExtrasE'
    end
    object TabLancExtrasS: TCurrencyField
      FieldName = 'LancExtrasS'
    end
    object TabAguardandoPagto: TCurrencyField
      FieldName = 'AguardandoPagto'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 144
    Top = 179
  end
  object tAux: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Abertura'
        DataType = ftDateTime
      end
      item
        Name = 'Fechamento'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LancExtrasE'
        DataType = ftCurrency
      end
      item
        Name = 'LancExtrasS'
        DataType = ftCurrency
      end
      item
        Name = 'Descontos'
        DataType = ftCurrency
      end
      item
        Name = 'Internet'
        DataType = ftCurrency
      end
      item
        Name = 'Pacotes'
        DataType = ftCurrency
      end
      item
        Name = 'Vendas'
        DataType = ftCurrency
      end
      item
        Name = 'SaldoAnt'
        DataType = ftCurrency
      end
      item
        Name = 'Aberto'
        DataType = ftBoolean
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'AguardandoPagto'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'INumero'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IAberto'
        Fields = 'Aberto'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IDia'
        Fields = 'Abertura'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'INumero'
    SessionName = 'SesPad'
    TableName = 'Caixa'
    OnCalcFields = tAuxCalcFields
    Left = 232
    Top = 163
    object tAuxNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tAuxAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tAuxFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tAuxUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tAuxDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tAuxInternet: TCurrencyField
      FieldName = 'Internet'
    end
    object tAuxSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tAuxAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tAuxObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tAuxSaldoFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SaldoFinal'
      Calculated = True
    end
    object tAuxVendas: TCurrencyField
      FieldName = 'Vendas'
    end
    object tAuxPacotes: TCurrencyField
      FieldName = 'Pacotes'
    end
    object tAuxLancExtrasE: TCurrencyField
      FieldName = 'LancExtrasE'
    end
    object tAuxLancExtrasS: TCurrencyField
      FieldName = 'LancExtrasS'
    end
    object tAuxAguardandoPagto: TCurrencyField
      FieldName = 'AguardandoPagto'
    end
  end
end
