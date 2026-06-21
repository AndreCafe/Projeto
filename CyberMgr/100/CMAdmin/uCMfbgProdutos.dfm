inherited fbgProdutos: TfbgProdutos
  Tag = 5
  Caption = 'Produtos'
  OldCreateOrder = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMDSimplePanel1: TLMDSimplePanel
    Top = 67
    Height = 298
    inherited dxBarDockControl1: TdxBarDockControl
      Height = 0
      AllowDocking = False
      AllowZeroSizeInDesignTime = True
      SunkenBorder = False
      Visible = False
    end
    inherited panDiv1: TLMDSimplePanel
      Top = 5
      Height = 0
    end
    inherited panPri: TLMDSimplePanel
      Top = 5
      Height = 288
      inherited LMDSimplePanel2: TLMDSimplePanel
        Height = 260
        inherited Grid: TdxDBGrid
          Height = 260
          KeyField = 'Codigo'
          DataSource = dsTab
          Filter.AutoDataSetFilter = True
          Filter.Criteria = {00000000}
          object GridDescricao: TdxDBGridMaskColumn
            Width = 221
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Descricao'
          end
          object GridCodigo: TdxDBGridMaskColumn
            Width = 94
            BandIndex = 0
            RowIndex = 0
            DisableGrouping = True
            FieldName = 'Codigo'
          end
          object GridEstoqueAtual: TdxDBGridMaskColumn
            Caption = 'Estoque'
            Width = 88
            BandIndex = 0
            RowIndex = 0
            FieldName = 'EstoqueAtual'
          end
          object GridEstoqueACE: TdxDBGridMaskColumn
            Caption = 'Aguard. Entrada'
            Visible = False
            Width = 111
            BandIndex = 0
            RowIndex = 0
            FieldName = 'EstoqueACE'
          end
          object GridEstoqueACS: TdxDBGridMaskColumn
            Caption = 'Aguard. Saída'
            Visible = False
            Width = 112
            BandIndex = 0
            RowIndex = 0
            FieldName = 'EstoqueACS'
          end
          object GridUnid: TdxDBGridMaskColumn
            Width = 75
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Unid'
          end
          object GridPreco: TdxDBGridCurrencyColumn
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Preco'
            Nullable = False
          end
          object GridCategoria: TdxDBGridMaskColumn
            Width = 124
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Categoria'
          end
          object GridCustoUnitario: TdxDBGridCurrencyColumn
            Visible = False
            Width = 82
            BandIndex = 0
            RowIndex = 0
            FieldName = 'CustoUnitario'
            Nullable = False
          end
        end
      end
      inherited BarDockControl: TdxBarDockControl
        UseOwnSunkenBorder = True
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
            BeginGroup = True
            Item = cmLocalizar
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmImprimir
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
          end
          item
            BeginGroup = True
            Item = cmReprocessaEstoque
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
    Style = bmsEnhanced
    SunkenBorder = True
    DockControlHeights = (
      0
      0
      67
      0)
    inherited cmSubPeriodo: TdxBarSubItem
      Visible = ivNever
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
      LargeGlyph.Data = {
        760A0000424D760A000000000000360800002800000010000000120000000100
        1000030000004002000000000000000000000001000000000000007C0000E003
        00001F0000000000000000008000008000000080800080000000800080008080
        0000C0C0C000C0DCC000F0CAA6000020400000206000002080000020A0000020
        C0000020E00000400000004020000040400000406000004080000040A0000040
        C0000040E00000600000006020000060400000606000006080000060A0000060
        C0000060E00000800000008020000080400000806000008080000080A0000080
        C0000080E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0
        C00000A0E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0
        C00000C0E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0
        C00000E0E00040000000400020004000400040006000400080004000A0004000
        C0004000E00040200000402020004020400040206000402080004020A0004020
        C0004020E00040400000404020004040400040406000404080004040A0004040
        C0004040E00040600000406020004060400040606000406080004060A0004060
        C0004060E00040800000408020004080400040806000408080004080A0004080
        C0004080E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0
        C00040A0E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0
        C00040C0E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0
        C00040E0E00080000000800020008000400080006000800080008000A0008000
        C0008000E00080200000802020008020400080206000802080008020A0008020
        C0008020E00080400000804020008040400080406000804080008040A0008040
        C0008040E00080600000806020008060400080606000806080008060A0008060
        C0008060E00080800000808020008080400080806000808080008080A0008080
        C0008080E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0
        C00080A0E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0
        C00080C0E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0
        C00080E0E000C0000000C0002000C0004000C0006000C0008000C000A000C000
        C000C000E000C0200000C0202000C0204000C0206000C0208000C020A000C020
        C000C020E000C0400000C0402000C0404000C0406000C0408000C040A000C040
        C000C040E000C0600000C0602000C0604000C0606000C0608000C060A000C060
        C000C060E000C0800000C0802000C0804000C0806000C0808000C080A000C080
        C000C080E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0
        C000C0A0E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FB
        FF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
        0000FFFFFF0018C618C618C618C618C618C618C618C618C618C618C618C618C6
        18C618C618C618C618C618C614A514A514A514A514A514A514A514A514A518C6
        18C618C618C618C6000000000000000000000000000000000000000014A518C6
        18C618C618C618C60000E0FFFFFFFFFFFFFFE0FFFFFFFFFFFFFF000014A518C6
        18C618C618C618C60000FFFF100010001000100010001000FFFF000014A518C6
        18C618C618C618C60000FFFFFFFFE0FFFFFFFFFFFFFFE0FFFFFF000014A518C6
        18C618C618C618C60000FFFF0000000014A5100010001000FFFF000014A518C6
        18C618C618C618C60000E0FF000000000000000014A5FFFFFFFF000014A518C6
        18C618C618C618C60000FFFF14A500000000F8C60000000014A5000014A518C6
        18C618C618C618C60000FFFFFFFF0000F8C6FFFFFFFFF8C60000000014A518C6
        18C618C618C618C60000FFFF100014A50000FFFFFFFFFFFFF8C60000000018C6
        18C618C618C618C60000E0FFFFFFFFFF0000F8C6FFFFFFFFF8C6000000A50000
        18C618C618C618C60000FFFF1000100014A50000F8C6F8C60000E0FF100000A5
        000018C618C618C60000FFFFFFFFE0FFFFFF000000000000FFFFE0FFE0FF1000
        00A518C618C618C60000000000000000000000000000E0FFFFFFFFFFE0FFE0FF
        100000A518C618C618C618C618C618C618C618C618C60000E0FFFFFFFFFFE0FF
        E0FF100018C618C618C618C618C618C618C618C618C618C618C6E0FFFFFFFFFF
        E0FFE0FF18C618C618C618C618C618C618C618C618C618C618C618C618C618C6
        18C618C618C6}
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
      Glyph.Data = {
        96020000424D9602000000000000B600000028000000100000000F0000000100
        100003000000E001000000000000000000001000000000000000007C0000E003
        00001F0000000000000000008000008000000080800080000000800080008080
        000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
        0000FFFFFF0018C618C618C618C618C618C618C618C618C618C618C618C618C6
        18C618C618C60000000000000000000018C618C618C618C618C6000000000000
        0000000018C60000FFFF00000000000018C618C618C618C618C60000FFFF0000
        0000000018C60000FFFF00000000000018C618C618C618C618C60000FFFF0000
        0000000018C6000000000000000000000000000018C600000000000000000000
        0000000018C600000000FFFF000000000000000000000000FFFF000000000000
        0000000018C600000000FFFF00000000000018C600000000FFFF000000000000
        0000000018C600000000FFFF00000000000018C600000000FFFF000000000000
        0000000018C618C6000000000000000000000000000000000000000000000000
        000018C618C618C618C60000FFFF00000000000018C60000FFFF000000000000
        18C618C618C618C618C60000000000000000000018C600000000000000000000
        18C618C618C618C618C618C600000000000018C618C618C600000000000018C6
        18C618C618C618C618C618C60000FFFF000018C618C618C60000FFFF000018C6
        18C618C618C618C618C618C600000000000018C618C618C600000000000018C6
        18C618C618C618C618C618C618C618C618C618C618C618C618C618C618C618C6
        18C618C618C6}
      ItemLinks = <
        item
          Item = cmColunas
          UserGlyph.Data = {00000000}
          Visible = True
        end>
    end
    object cmReprocessaEstoque: TdxBarButton
      Caption = '&Reprocessar Estoque'
      Category = 3
      Hint = 'Reprocessar Estoque'
      Visible = ivAlways
      OnClick = cmReprocessaEstoqueClick
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
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Unid'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Preco'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Imagem'
        DataType = ftGraphic
      end
      item
        Name = 'Categoria'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EstoqueAtual'
        DataType = ftFloat
      end
      item
        Name = 'CustoUnitario'
        DataType = ftCurrency
      end
      item
        Name = 'EstoqueACE'
        DataType = ftFloat
      end
      item
        Name = 'EstoqueACS'
        DataType = ftFloat
      end>
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'ICodigo'
        Fields = 'Codigo'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IDescricao'
        Fields = 'Descricao'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IDescricao'
    SessionName = 'SesPad'
    TableName = 'Produto'
    Timeout = 10000
    Left = 56
    Top = 88
    object TabCodigo: TStringField
      DisplayLabel = 'Código'
      FieldName = 'Codigo'
      Size = 15
    end
    object TabDescricao: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'Descricao'
      Size = 40
    end
    object TabUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object TabPreco: TCurrencyField
      DisplayLabel = 'Preço'
      FieldName = 'Preco'
    end
    object TabObs: TMemoField
      DisplayLabel = 'Observação'
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object TabCategoria: TStringField
      FieldName = 'Categoria'
      LookupKeyFields = 'Descricao'
      LookupResultField = 'Descricao'
      KeyFields = 'Categoria'
      LookupCache = True
    end
    object TabEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object TabCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object TabEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object TabEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object TabEstoqueFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoqueFinal'
      Calculated = True
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 104
    Top = 88
  end
end
