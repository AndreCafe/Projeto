inherited fbgMaquinas: TfbgMaquinas
  Left = 79
  Top = 167
  Width = 642
  Height = 439
  Caption = 'Máquinas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited LMDSimplePanel1: TLMDSimplePanel
    Width = 634
    Height = 389
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 624
      Height = 30
    end
    inherited panDiv1: TLMDSimplePanel
      Top = 35
      Width = 624
    end
    inherited panPri: TLMDSimplePanel
      Top = 42
      Width = 624
      Height = 342
      inherited LMDSimplePanel2: TLMDSimplePanel
        Top = 58
        Width = 622
        Height = 283
        inherited Grid: TdxDBGrid
          Width = 622
          Height = 283
          BandRowCount = 2
          DefaultLayout = False
          ShowGroupPanel = False
          ShowSummaryFooter = False
          DataSource = Dados.dsMaquina
          DefaultRowHeight = 32
          Filter.Active = False
          Filter.Criteria = {00000000}
          MaxRowLineCount = 1
          OptionsBehavior = [edgoAutoSearch, edgoAutoSort, edgoCaseInsensitive, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
          OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnMoving, edgoColumnSizing, edgoRowSizing]
          PreviewFieldName = ''
          PreviewLines = 1
          ShowRowFooter = False
          OnCustomDrawCell = GridCustomDrawCell
          object GridNumero: TdxDBGridMaskColumn
            Alignment = taCenter
            Caption = 'Maq'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            HeaderAlignment = taCenter
            VertAlignment = tlCenter
            Width = 60
            BandIndex = 0
            RowIndex = 0
            OnCustomDrawCell = GridNumeroCustomDrawCell
            FieldName = 'Numero'
          end
          object GridConectado: TdxDBGridImageColumn
            Alignment = taCenter
            Caption = 'Guard'
            HeaderAlignment = taCenter
            MinWidth = 16
            VertAlignment = tlCenter
            Width = 46
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Conectado'
            Images = ImageList1
            ImageIndexes.Strings = (
              '0'
              '1')
            Values.Strings = (
              'False'
              'True')
          end
          object GridStatus: TdxDBGridColumn
            Caption = 'Status'
            VertAlignment = tlCenter
            Width = 91
            BandIndex = 0
            RowIndex = 0
            OnGetText = GridStatusGetText
          end
          object GridTempo: TdxDBGridColumn
            Alignment = taCenter
            Caption = 'Tempo'
            HeaderAlignment = taCenter
            VertAlignment = tlCenter
            Width = 73
            BandIndex = 0
            RowIndex = 0
            FieldName = 'InicioTicks'
          end
          object GridValor: TdxDBGridColumn
            Caption = 'Valor'
            VertAlignment = tlCenter
            Width = 73
            BandIndex = 0
            RowIndex = 0
            OnGetText = GridValorGetText
          end
          object GridSinal: TdxDBGridCurrencyColumn
            VertAlignment = tlCenter
            Width = 85
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Sinal'
            Nullable = False
          end
          object GridInicio: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            VertAlignment = tlCenter
            Width = 89
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Inicio'
          end
          object GridLimiteTempo: TdxDBGridColumn
            Alignment = taCenter
            Caption = 'Tempo Limite'
            HeaderAlignment = taCenter
            VertAlignment = tlCenter
            Width = 74
            BandIndex = 0
            RowIndex = 0
            FieldName = 'LimiteTempoDT'
          end
          object GridNome: TdxDBGridMaskColumn
            Caption = 'Cliente'
            VertAlignment = tlCenter
            Width = 118
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Mostrar'
          end
          object GridNomeTipoAcesso: TdxDBGridLookupColumn
            Caption = 'Tipo Acesso'
            VertAlignment = tlCenter
            Width = 184
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NomeTipoAcesso'
          end
          object GridInicioTicks: TdxDBGridMaskColumn
            DisableCaption = True
            DisableCustomizing = True
            DisableDragging = True
            DisableEditor = True
            VertAlignment = tlCenter
            Visible = False
            Width = 29
            BandIndex = 0
            RowIndex = 0
            DisableGrouping = True
            FieldName = 'InicioTicks'
            DisableFilter = True
          end
          object GridAcesso: TdxDBGridMaskColumn
            DisableCaption = True
            DisableCustomizing = True
            DisableDragging = True
            DisableEditor = True
            VertAlignment = tlCenter
            Visible = False
            Width = 29
            BandIndex = 0
            RowIndex = 0
            DisableGrouping = True
            FieldName = 'Acesso'
            DisableFilter = True
          end
          object GridPrograma: TdxDBGridColumn
            Caption = 'Programa Atual'
            VertAlignment = tlCenter
            Width = 201
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ProgramaAtual'
          end
          object GridParado: TdxDBGridCheckColumn
            DisableCustomizing = True
            DisableDragging = True
            DisableEditor = True
            Visible = False
            Width = 61
            BandIndex = 0
            RowIndex = 0
            DisableGrouping = True
            FieldName = 'Parado'
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            DisableFilter = True
          end
          object GridObsAcesso: TdxDBGridColumn
            Caption = 'Observação'
            VertAlignment = tlCenter
            Width = 186
            BandIndex = 0
            RowIndex = 0
            HeaderMaxLineCount = 0
            FieldName = 'ObsAcesso'
            DisableFilter = True
          end
          object GridNomeComputador: TdxDBGridColumn
            Caption = 'Nome Computador'
            VertAlignment = tlCenter
            Width = 224
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ComputerName'
          end
          object GridAguardaPagto: TdxDBGridCheckColumn
            DisableCustomizing = True
            Visible = False
            Width = 105
            BandIndex = 0
            RowIndex = 0
            FieldName = 'AguardaPagto'
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
      inherited BarDockControl: TdxBarDockControl
        Width = 622
        Height = 57
      end
    end
  end
  inherited BarMgr: TdxBarManager
    AutoDockColor = True
    AutoHideEmptyBars = True
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
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
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
            Item = cmFechar
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Barra2'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
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
        Caption = 'Custom 1'
        DockControl = BarDockControl
        DockedDockControl = BarDockControl
        DockedLeft = 517
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 264
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
            Item = cmLayout
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        UseRecentItems = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 2'
        DockControl = BarDockControl
        DockedDockControl = BarDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 340
        FloatTop = 264
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmInicia
            UserDefine = [udPaintStyle]
            UserGlyph.Data = {00000000}
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmParar
            UserDefine = [udPaintStyle]
            UserGlyph.Data = {00000000}
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmFinalizar
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmEditarAcesso
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmTransferir
            UserDefine = [udPaintStyle]
            UserGlyph.Data = {00000000}
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmCapturar
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmDesligar
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmVenda
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = cmVendeTempo
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Custom 2'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = False
        Row = 0
        SizeGrip = False
        UseOwnFont = False
        UseRecentItems = False
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
    DockControlHeights = (
      0
      0
      23
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
      ShowCaption = False
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
    inherited cmFechar: TdxBarLargeButton
      GlyphLayout = glLeft
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
    inherited cmNovo: TdxBarLargeButton
      GlyphLayout = glLeft
      ShowCaption = False
    end
    inherited cmApagar: TdxBarLargeButton
      GlyphLayout = glLeft
      ShowCaption = False
    end
    inherited cmEditar: TdxBarLargeButton
      GlyphLayout = glLeft
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
    object cmInicia: TdxBarLargeButton
      Caption = 'Liberar'
      Category = 0
      Hint = 'Liberar'
      Visible = ivAlways
      Glyph.Data = {
        5E090000424D5E09000000000000360400002800000025000000210000000100
        0800000000002805000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFE00000000000000000000000000000000FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA4FF0707070707070707
        070707070707A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA4FF
        0707070707070707070707070707A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEA4FF07181807070707A4A4A4A4A40707A4A400FEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4
        00FEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEA4A4A4A4A4A4A4A4A4
        A4A4A4A4A4A407A400FEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        A4000000000000000000000000A4A40700FEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEA4FF07070707070707070707A400A4A4FEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF04040404040404040407A4A400FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF00FCFCFCFCFC
        FCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        A4FF00FCFCFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF00FCFCFCFCFC
        FCFC0407A4A400FEFE0000FEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        A4FF00000000000000000407A4A400FEFE00FA0000FEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEA4FFFFFFFFFFFFFFFFFFFFFFA4A400FEFE00FAFAFA0000FE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEFEA407070707070707070707FFA400FE
        FE00FAFAFAFAFA0000FEFEFEFEFEFE000000FEFEFEFEFEFEFEFEA40707070707
        0707070707FF00FEFE00FAFAFAFAFAFAFA0000FEFEFEFE000000FEFEFEFEFEFE
        FEFEFEA4A4A4A4A4A4A4A4A4A4A4FEFEFE00FAFAFAFAFAFAFAFAFA00FEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00FAFAFAFAFAFA
        FA0000FEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FE00FAFAFAFAFA0000FEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFE00FAFAFA0000FEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00FA0000FEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE0000FEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000}
      UnclickAfterDoing = False
      OnClick = cmIniciaClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        5E090000424D5E09000000000000360400002800000025000000210000000100
        0800000000002805000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFE00000000000000000000000000000000FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA4FF0707070707070707
        070707070707A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA4FF
        0707070707070707070707070707A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEA4FF07181807070707A4A4A4A4A40707A4A400FEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4
        00FEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEA4A4A4A4A4A4A4A4A4
        A4A4A4A4A4A407A400FEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        A4000000000000000000000000A4A40700FEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEA4FF07070707070707070707A400A4A4FEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF04040404040404040407A4A400FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF00FCFCFCFCFC
        FCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        A4FF00FCFCFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFEFE691818FEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FE
        FEFE21727318FEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF00FCFCFCFCFC
        FCFC0407A4A400FEFEFE2973737318FEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        A4FF00000000000000000407A4A400FEFEFE617C73737319FEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEA4FFFFFFFFFFFFFFFFFFFFFFA4A400FEFEFE297C737B737B
        18FEFEFEFEFEFE000000FEFEFEFEFEFEFEA407070707070707070707FFA400FE
        FEFE21BC7B7373737318FEFEFEFEFE000000FEFEFEFEFEFEFEFEA40707070707
        0707070707FF00FEFEFE29BD7C7B7C7B7B7C18FEFEFEFE000000FEFEFEFEFEFE
        FEFEFEA4A4A4A4A4A4A4A4A4A4A4FEFEFEFE29BD7B7C7B7C7CBD21FEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE69BD7C7C7C7C
        BD29FEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFE21BE7C7C7CBD69FEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFE69BE7C7CBD29FEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE29087CBD21FEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE69BEBE69FEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFE292169FEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000}
    end
    object cmFinalizar: TdxBarLargeButton
      Caption = 'Finalizar'
      Category = 0
      Hint = 'Finalizar'
      Visible = ivAlways
      Glyph.Data = {
        82060000424D820600000000000036040000280000001C000000150000000100
        0800000000004C02000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F90000000000000000000000
        FFF9F9FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9A4A4A4A4A4A4A4A4A400F9F9F9FF
        FFFFFFFFFFFFFFFFFFFFFF00F9F9070707070707070707F9F9F9FFFFFFFFFFFF
        FFFFFFFFFFFFFF00F9F9F9000000000000F9F9F9F900FFFFFFFFFFFFFFFFFFFF
        FFFFFFFF00F9F9F907070707F9F9F9F9A400FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00F9F9F90000F9F9F900A40000FFFFFFFFFFFFFFFFFFFFFFFFFFFF000707F9
        F9F9F9F9F907070000FFFFFFFF00000000FFFFFFFFFFFFFF00070000F9F9F9F9
        00000700FFFFFF0000070707070000FFFFFFFFFF000700F9F9F9F9F9F9000700
        FFFF00070707070707070700FFFFFFFF0007F9F9F9F9F9F9F9000700FF000007
        0707070707070700FFFFFFFF00F9F9F9F9F9F9F9F9000700FF00070707070007
        0707070700FFFFFFF9F9F900000000F9F9F90700FF0007070700000000000707
        00FFFFF9F9F9070707070707F9F9F900FF000707070700070707070700FFFFF9
        F90000000000000000F9F9FFFF000707070700070707070700FFFFFFFFFFFFFF
        FFFFFFFFFFF9F9F9FFFF00070707000707070700FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF9F9F9FF00070707000707070700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9
        F9FFFF0000070707070000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF}
      UnclickAfterDoing = False
      OnClick = cmFinalizarClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        5E090000424D5E09000000000000360400002800000025000000210000000100
        0800000000002805000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFE00000000000000000000000000000000FEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEA4FF0707070707070707070707
        070707A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEA4FF070707
        0707070707070707070707A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEA4FF07181807070707A4A4A4A4A40707A4A400FEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A400FEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEA4A4A4A4A4A4A4A4A4A4A4A4
        A4A4A407A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEA40000
        00000000000000000000A4A40700FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEA4FF07070707070707070707A400A4A4FEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEA4FF04040404040404040407A4A400FEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEA4FF00FCFCFCFCFCFCFC04
        07A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEA4FF00
        FCFCFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEA4FF00FCFCFCFCFCFCFC04
        07A4A400FEFE5655545555545555545554FEFEFEFEFEFE000000FEFEFEA4FF00
        000000000000000407A4A400FEFE575F575757575757575754FEFEFEFEFEFE00
        0000FEFEFEA4FFFFFFFFFFFFFFFFFFFFFFA4A400FEFE569F5757575757575757
        55FEFEFEFEFEFE000000FEFEFEFEA407070707070707070707FFA400FEFE56A7
        5F5F5F5F5F5F5F5F54FEFEFEFEFEFE000000FEFEFEFEFEA40707070707070707
        0707FF00FEFE57A75F5F9F5F9F5F9F5F54FEFEFEFEFEFE000000FEFEFEFEFEFE
        A4A4A4A4A4A4A4A4A4A4A4FEFEFE57AF9F9F5F9F5F9F5F9F54FEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE56AFA75FA75FA75FA75F
        55FEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE56EF
        A7A7A7A7A7A7A7A754FEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFE57B7AFA7AFA7AFA7AFA754FEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFE56EFEFEFEFEFEFEFEFEF55FEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE56565656565656565656
        56FEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000}
    end
    object cmCapturar: TdxBarLargeButton
      Caption = 'Capturar'
      Category = 0
      Hint = 'Capturar'
      Visible = ivAlways
      Glyph.Data = {
        FE050000424DFE05000000000000360400002800000015000000130000000100
        080000000000C801000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFF6F60808080808F6F6F6FF
        FFFFFFFFFFFFFF000000FFFF0807F7F7F7F7F7F7F7F7070708F6FFFFFFFFFF00
        0000FF079BA4A4A4A4A4A4A49B5B9BA4F7070708F6FFFF000000FFA408080707
        A40707070707A49B9B9BA4F707F6FF000000FF9B08070707A40707070807F7F7
        F7F7A45BF7F6FF000000FF9B08080707A4070707F79B52525B07079BF708FF00
        0000FF9B08070707A40707F7A4524949495B079BF708FF000000FFA408080707
        A40707F7A45292E29252F79BF708FF000000FFA408080807A4070707A452E2E2
        E252F79BF708FF000000FF9B08080807A4070707F75292E29252F79BF708FF00
        0000FF9BF6080807A407F707079B5252519B079BF708FF000000FF9BF6080707
        F7A4F7F70808F79BA407079BF708FF000000FF9BF6F6F6079BA4F7F7F7F7F707
        07F7F79BF708FF000000FFA4FFFF07A4A45B9BF7A49BA4F79B5252A4F708FF00
        0000FFF6F7A45BA4080808080807F7F79B52529B07F6FF000000FFFFFFF60807
        F7F7A4A4F70808A40808A452F6FFFF000000FFFFFFFFFFFFFFFFFFF607F7F7A4
        A4F707F6FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000}
      UnclickAfterDoing = False
      OnClick = cmCapturarClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36180000424D3618000000000000360800002800000020000000200000000100
        2000000000000010000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000FFFF
        FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080000000
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000FFFF
        FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080008080
        800000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000FFFF
        FF00C0C0C0000060000000600000C0C0C000C0C0C000C0C0C000C0C0C0008080
        800080808000808080008080800080808000C0C0C000C0C0C000808080008080
        800000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
        800000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000808080008080800080808000808080008080800080808000C0C0C0008080
        800000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000808080000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000008080800080808000C0C0
        C00000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C0008080800000000000808080008080
        8000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0080000000800000008000000080000000800000008000
        0000800000008000000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF00000000000000FFFF0000000000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF00000000000000FFFF0000000000FFFF0000FFFF0000FFFF
        000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF00000000000000FFFF0000FFFF0000000000FFFF00000000
        000000FFFF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FFFFFF00FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF000000000000FF
        FF0000FFFF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FFFFFF00FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FF
        FF0000FFFF0000FFFF0000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF00000000000000FFFF0000FFFF000000
        000000FFFF0000FFFF0000FFFF0000000000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000000000000000000000000000000000000000
        0000000000000000000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000FFFF
        00000000000000FFFF0000FFFF0000000000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080800000000000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF
        0000FFFF00000000000000FFFF0000FFFF0000000000FFFF0000FFFF0000FFFF
        0000FFFF000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF008080800000000000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF00000000000000FFFF0000000000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0000000000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000808080008080800080808000808080008080
        8000808080008080800080808000808080008080800080808000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000000000000000
        000080808000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000808080000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000080808000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000000000008080800080808000000000000000000080808000808080008080
        8000808080000000000000000000808080008080800000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000000000008080800080808000000000008080800080808000808080008080
        8000808080008080800000000000808080008080800000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        00000000000080808000808080000000000080808000C0C0C000808080008080
        8000808080008080800000000000808080008080800000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        00000000000080808000808080000000000080808000F0CAA600C0C0C0008080
        8000808080008080800000000000808080008080800000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000000000000FFFFFF00FFFFFF00000000000000000080808000808080008080
        8000808080000000000000000000FFFFFF00FFFFFF0000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
        00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF00000000000000000000FFFF00008080800000000000FFFFFF00FFFF
        FF000000000080808000FFFF00000000000000000000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000000000000000
        000080808000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000}
    end
    object cmParar: TdxBarLargeButton
      Caption = 'Pausar'
      Category = 0
      Hint = 'Pausar'
      Visible = ivAlways
      Glyph.Data = {
        2E060000424D2E06000000000000360400002800000015000000150000000100
        080000000000F801000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFF608F5ED0708F6
        FFFFFFFFFFFFFF000000FFFFFFFFFF07A49B9BA49B9B5B9BEDF6FFFFFFFFFF00
        0000FFFFFFFFF59BA4F7F7F7F7F5EDA4529B08FFFFFFFF000000FFFFFF08F7A4
        A4A4F7F7F7F7A4F7F59B9B08FFFFFF000000FFFFFFF7F7ACF509FFF75CFFFFF5
        A4F59B9BF6FFFF000000FFFFF7EDF709090909090809FFFF07A4075BF7FFFF00
        0000FF09EDED070909090909090909FFFF07F7F75BF6FF000000FF0707F50909
        0909090909090909FFFFA4F55B07FF000000FF0707F509FFFF09090909090909
        09FFF5F79BEDFF000000FF0707F5F6FFFFFF09AC9BA4A4F709F6F7ACA4F7FF00
        0000FF0708F55CF6FFFF08A45252525252075CA4A4EDFF000000FF0708F5FFFF
        FFFFFF07A452F70909FFF5F7A407FF000000FF08F607FFFFFFFFFFFFFFAC52F7
        09FFACF79BF6FF000000FFFFF60708FFFFFFFFFFFF09A452F709A4A4A4FFFF00
        0000FFFF08F6F508FFFFFFFFF6FF09F752F7F7A408FFFF000000FFFFFFF6F6F5
        08FFFF5C07FF0909F7EDAC07FFFFFF000000FFFFFFFFF6F6070707F5F5F5F5F7
        EDF707FFFFFFFF000000FFFFFFFFFFF6F6F60808070707F5ED07FFFFFFFFFF00
        0000FFFFFFFFFFFFFF0808070707F507F6FFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      UnclickAfterDoing = False
      OnClick = cmPararClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        5E090000424D5E09000000000000360400002800000025000000210000000100
        0800000000002805000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFE00000000000000000000000000000000FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA4FF0707070707070707
        070707070707A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA4FF
        0707070707070707070707070707A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEA4FF07181807070707A4A4A4A4A40707A4A400FEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4
        00FEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEA4A4A4A4A4A4A4A4A4
        A4A4A4A4A4A407A400FEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        A4000000000000000000000000A4A40700FEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEA4FF07070707070707070707A400A4A4FEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF04040404040404040407A4A400FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF00FCFCFCFCFC
        FCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        A4FF00FCFCFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FE
        FE1E13141314FEFE1E13141413FEFE000000FEFEFEFEFEFEA4FF00FCFCFCFCFC
        FCFC0407A4A400FEFE1F2F2F2F0CFEFE1F2F2F2F0BFEFE000000FEFEFEFEFEFE
        A4FF00000000000000000407A4A400FEFE1F2F2F2F14FEFE1F2F2F2F13FEFE00
        0000FEFEFEFEFEFEA4FFFFFFFFFFFFFFFFFFFFFFA4A400FEFE1E2F2F2F13FEFE
        1F2F2F2F14FEFE000000FEFEFEFEFEFEFEA407070707070707070707FFA400FE
        FE1F37372F14FEFE1F37372F13FEFE000000FEFEFEFEFEFEFEFEA40707070707
        0707070707FF00FEFE1F372F370CFEFE1F372F370BFEFE000000FEFEFEFEFEFE
        FEFEFEA4A4A4A4A4A4A4A4A4A4A4FEFEFE1F7F373714FEFE1F7F373713FEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE1E7F37370BFEFE
        1F7F37370CFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FE1F7F373714FEFE1F7F373713FEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFE277F3F3714FEFE277F3F3713FEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE1FBF7FBF14FEFE1FBF7FBF14FEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE1E1E1E1E1EFEFE
        1F1E1E1E1EFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000}
    end
    object cmTransferir: TdxBarLargeButton
      Caption = 'Transferir'
      Category = 0
      Hint = 'Transferir'
      Visible = ivAlways
      DropDownMenu = pmTransf
      Glyph.Data = {
        D2070000424DD207000000000000360400002800000029000000150000000100
        0800000000009C03000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FF00000000000000000000000000FFFFFFFFFFFFFFFF
        FFFFFF00000000000000000000000000FFFFFF000000FF0007A4A4A4A4A4A4A4
        A4A4A40000FFFFFFFFFFFFFFFFFFFF0007A4A4A4A4A4A4A4A4A4A40000FFFF00
        0000FF00070707070707070707070700A400FFFFFFFFFFFFFFFFFF0007070707
        0707070707070700A400FF000000FF00000000000000000000000000A400FFFF
        FFFFFFFFFFFFFF00000000000000000000000000A400FF000000FFFF00070707
        0707070707070700A400FFFFFFFFFFFFFFFFFFFF000707070707070707070700
        A400FF000000FFFFFF00000000000000000000A40000FFFFFFFFFF02FFFFFFFF
        FF00000000000000000000A40000FF000000FFFF000707070707070707070700
        00FFFFFFFFFFFF0202FFFFFF00070707070707070707070000FFFF000000FFFF
        000700000000000000000700FFFF0202020202020202FFFF0007000000000000
        00000700FFFFFF000000FFFF000700FEFFFFFEFFFF000700FFFF020202020202
        020202FF000700FEFFFEFFFFFF000700FFFFFF000000FFFF000700FFFEF9FCFF
        FC000700FFFF0202020202020202FFFF000700FFFEF9FCFCFF000700FFFFFF00
        0000FFFF000700FFFCFEFFFEFE000700FFFFFFFFFFFFFF0202FFFFFF000700FF
        FCFEFFFEFE000700FFFFFF000000FFFF000700000000000000000700FFFFFFFF
        FFFFFF02FFFFFFFF000700000000000000000700FFFFFF000000FFFF00070707
        0707070707070000FFFFFFFFFFFFFFFFFFFFFFFF000707070707070707070700
        FFFFFF000000FFFFFF00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00000000000000000000FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      UnclickAfterDoing = False
      OnClick = cmTransferirClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        5E090000424D5E09000000000000360400002800000025000000210000000100
        0800000000002805000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFE00000000000000000000000000000000FFFF00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF07070707070707070707
        07070707A400FF000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF0707
        070707070707070707070707A4A400000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEA4FF07181807070707A4A4A4A4A40707A4A400000000FEFEFEFE0202
        0202020202020202020202FEA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A40000
        0000FEFEFEFE02FAFAFAFAFAFAFAFAFAFAFA02FEFEA4A4A4A4A4A4A4A4A4A4A4
        A4A4A4A407A400000000FEFEFEFE02FA0202020202020202020202FEFEFEA400
        0000000000000000000000A4A40700000000FEFEFEFE02FA02FEFEFEFEFEFEFE
        FEFEFEFEFEFEA4FF07070707070707070707A400A4A4FE000000FEFEFEFE02FA
        02FEFEFEFEFEFEFEFEFEFEFEFEFEA4FF04040404040404040407A4A400FEFE00
        0000FEFE020202FA020202FEFEFEFEFEFEFEFEFEFEFEA4FF00FCFCFCFCFCFCFC
        0407A4A400FEFE000000FEFEFE02FAFAFA02FEFEFEFEFEFEFEFEFEFEFEFEA4FF
        00FCFCFCFCFCFCFC0407A4A400FEFE000000FEFEFEFE02FA02FEFEFEFEFEFEFE
        FEFEFEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFE000000FEFEFEFEFE02
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF00FCFCFCFCFCFCFC
        0407A4A400FEFE000000FE00000000000000000000000000000000FEFEFEA4FF
        00000000000000000407A4A400FEFE000000A4FF070707070707070707070707
        0707A400FEFEA4FFFFFFFFFFFFFFFFFFFFFFA4A400FEFE000000A4FF07070707
        07070707070707070707A4A400FEFEA407070707070707070707FFA400FEFE00
        0000A4FF07181807070707A4A4A4A4A40707A4A400FEFEFEA407070707070707
        070707FF00FEFE000000A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A400FEFEFE
        FEA4A4A4A4A4A4A4A4A4A4A4FEFEFE000000FEA4A4A4A4A4A4A4A4A4A4A4A4A4
        A4A407A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEA4000000
        000000000000000000A4A40700FEFEFEFEFEFEFEFEFE02FEFEFEFEFEFEFEFE00
        0000FEFEA4FF07070707070707070707A400A4A4FEFEFEFEFEFEFEFEFE02FA02
        FEFEFEFEFEFEFE000000FEFEA4FF04040404040404040407A4A400FEFEFEFEFE
        FEFEFEFE02FAFAFA02FEFEFEFEFEFE000000FEFEA4FF00FCFCFCFCFCFCFC0407
        A4A400FEFEFEFEFEFEFEFE020202FA020202FEFEFEFEFE000000FEFEA4FF00FC
        FCFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFE02FA02FEFEFEFEFEFEFE00
        0000FEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFE02FA02
        FEFEFEFEFEFEFE000000FEFEA4FF00FCFFFCFCFCFCFC0407A4A400FE02020202
        020202020202FA02FEFEFEFEFEFEFE000000FEFEA4FF00FCFCFCFCFCFCFC0407
        A4A400FE02FAFAFAFAFAFAFAFAFAFA02FEFEFEFEFEFEFE000000FEFEA4FF0000
        0000000000000407A4A400FE020202020202020202020202FEFEFEFEFEFEFE00
        0000FEFEA4FFFFFFFFFFFFFFFFFFFFFFA4A400FEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEA407070707070707070707FFA400FEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA4070707070707070707
        07FF00FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEA4
        A4A4A4A4A4A4A4A4A4A4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000}
    end
    object cmDesligar: TdxBarLargeButton
      Caption = '&Desligar'
      Category = 0
      Hint = 'Desligar'
      Visible = ivAlways
      UnclickAfterDoing = False
      OnClick = cmDesligarClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36080000424D3608000000000000360400002800000020000000200000000100
        0800000000000004000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FE000000FEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFE0000A400000007FE0000FEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFE0000A4A4A4000707FE0007FE00FEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFE0000000707A400FF000007FE0000FEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFE0007070707A4A40000FF0000FEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFE000707FF07FF07FF000000FEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFE000007FF07FF07FF07FFA400FEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFE0000FF070000000000000000FEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFE00FF0700FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFE00FF00FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFE00FF00FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFE00FF00FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00000000
        000000000000000000000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF070707
        0707070707070707070707A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF070707
        0707070707070707070707A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEA4FF071818
        07070707A4A4A4A4A40707A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEA4FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEA4A4A4A4
        A4A4A4A4A4A4A4A4A4A4A407A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA40000
        00000000000000000000A4A40700FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF07
        070707070707070707A400A4A4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF04
        040404040404040407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF00
        FCFCFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF00
        FCFCFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF00
        FCFFFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF00
        FCFFFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF00
        FCFCFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FF00
        000000000000000407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4FFFF
        FFFFFFFFFFFFFFFFFFA4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA407
        070707070707070707FFA400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA4
        07070707070707070707FF00FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        A4A4A4A4A4A4A4A4A4A4A4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE}
    end
    object cmEditarAcesso: TdxBarLargeButton
      Caption = 'Editar'
      Category = 0
      Hint = 'Editar'
      Visible = ivAlways
      UnclickAfterDoing = False
      OnClick = cmEditarAcessoClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36180000424D3618000000000000360800002800000020000000200000000100
        2000000000000010000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000FFFF
        FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080000000
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000FFFF
        FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080008080
        800000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000FFFF
        FF00C0C0C0000060000000600000C0C0C000C0C0C000C0C0C000C0C0C0008080
        800080808000808080008080800080808000C0C0C000C0C0C000808080008080
        800000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
        800000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
        8000808080008080800080808000808080008080800080808000808080008080
        8000808080008080800080808000808080008080800080808000C0C0C0008080
        800000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000808080000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000008080800080808000C0C0
        C00000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C0008080800000000000808080008080
        8000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0080000000800000008000000080000000800000008000
        0000800000008000000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000C0404000C0404000C0404000C040
        4000C0404000C0404000C0404000C0404000C0404000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000C0404000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FFFFFF00FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF00000000000000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000C0404000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FFFFFF00FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF000000000000FFFFFF008000000080000000800000008000
        00008000000080000000FFFFFF0000000000C0404000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
        0000FF000000FF00000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF000000000000FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFF
        FF00FFFFFF0000FFFF00FFFFFF0000000000C0404000FFFF0000FFFF0000FFFF
        000080808000FFFFFF0000000000000000000000000000000000000000000000
        0000000000000000000080000000C0C0C000808080008080800000000000FFFF
        0000FFFF0000FFFF000000000000FFFFFF000000000000000000C04040008000
        00008000000080000000FFFFFF0000000000C0404000FFFF0000FFFF0000FFFF
        000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080800000000000FFFF
        0000FFFF0000FFFF00000000000000FFFF000000000000000000000000000000
        0000C0404000FFFFFF00FFFFFF0000000000C0404000FFFF0000FFFF0000FFFF
        0000FFFF000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF008080800000000000FFFF
        0000FFFF0000FFFF000000000000FFFFFF00C04040000000000000000000C0C0
        80000000000000000000C040400000000000C0404000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0000000000FFFF
        0000FFFF0000FFFF000000000000FFFFFF00FFFFFF0000000000C0C08000FFFF
        FF00FFFFFF00C0C080000000000000000000C0404000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000808080008080800080808000808080008080
        8000808080008080800080808000808080008080800080808000FFFF0000FFFF
        0000FFFF0000FFFF000000000000FFFFFF0080000000C040400000000000FFFF
        FF00FFFFFF00FFFFFF00C0C080000000000000000000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF00000000000000FFFF00FFFFFF00FFFFFF0000000000C0C0
        8000FFFFFF00FFFFFF00C0C08000000000000040400000000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF000000000000FFFFFF008000000080000000C04040000000
        0000C0C08000C0C080000000000000FFFF008000000000404000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF000000000000FFFFFF00FFFFFF0000FFFF00FFFFFF000000
        00000000000000000000FFFFFF0000FFFF0000FFFF0080000000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF000000000000000000000000000000000000000000000000
        00000000000000FFFF00FFFFFF00FFFFFF0000FFFF0000FFFF00FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF00000000000000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF000000FFFF00FFFFFF00FFFFFF00FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000}
    end
    object cmMaquinasDest: TdxBarListItem
      Caption = 'Transferir Para'
      Category = 0
      Visible = ivAlways
      BarSize = 50
      OnClick = cmMaquinasDestClick
      Items.Strings = (
        'xfasdfasdf'
        'asdfasdfasdf'
        'asdfasdfasdf')
      ShowNumbers = False
    end
    object cmVenda: TdxBarLargeButton
      Caption = 'Venda'
      Category = 0
      Hint = 'Venda'
      Visible = ivAlways
      PaintStyle = psCaptionGlyph
      UnclickAfterDoing = False
      OnClick = cmVendaClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        42080000424D4208000000000000420000002800000020000000200000000100
        1000030000000008000000000000000000000000000000000000007C0000E003
        00001F000000E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FC45EB014B014B0144C0C4C0C4C0C4C0C4C0C4C0C4C0C
        4C0C4C0C4C0C4C0C4C0C4C0C4C0C4C0C4C0C4C0C4C0C4C0C4C0C4C0C4C0C4C0C
        C45EE07FE07FE07FE07F3E37D701D701D701D701D701D701D701D701D701D701
        D701D701D701D701D701D701D701D701D701D701D701D701D701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D701D7013C5BDF7BFF7FBE77DB4AD701
        D701D701D701D701D701D7015C5FDF7BFF7F9D6BBA42D701D701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7011B57FF7FFF7FBE6FFF7FFF7FDA46
        D701D701D701D701D7015D63FF7FDF7BBE6FFF7FDF7BD701D701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D701BE77FF7FBA42D7011B57FF7F5D63
        D701D701D701D701D701FF7FBE77793AD7015D63FF7F1B57D701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D701FF7FBE6FD701D701D701FF7FBE6F
        9D6B9D6B9D6B9D6B9D6B9D6B5D63D701D701D701FF7F3C5BD701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7F1B57D7015D63FF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FDF7BDA46D701BE6FFF7FDB4AD701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D701BA42DF7BFF7FFF7FFF7FDF7B3C5B
        D701D701D701D701D7015C5FFF7FFF7FFF7FFF7F9D6BD701D701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D701D7019A3EFF7FDF7B5C5F793AD701
        D701D701D701D701D701D701DA465D639D6B1B57D701D701D701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D701D701D701FF7F9D6BD701D701D701
        D701D701D701D701D701D701D701D701D701D701D701D701D701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5C5FD701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FBE6F9D6B9D6B9D6BFF7F
        DF7B9D6B9D6B9D6B9D6BBE77FF7FBE6F9D6B9D6BDF7BDF7BD701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FDA46D701D701D701FF7F
        9D6BD701D701D701D7013C5BFF7FDA46D701D7015D63FF7FFB4ED701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FDA46D701D701D701FF7F
        9D6BD701D701D701D7013C5BFF7FDA46D701D701DA46FF7F7D67D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F9A3ED701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FBE6F9D6B9D6B9D6BFF7F
        FF7FDF7BB36A166FFF7FFF7FFF7FBE6F9D6B9D6B9D6BBE6FFF7F1B57D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FDA46D701D701D701FF7F
        7D5F2469C064C064E268B266FF7FDA46D701D701D7019A3EFF7FBE77D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FDA46D701D701D701FF7F
        0369FF7FFF7FFF7FFF7FC064B36ADA46D701D701D701D7017D67FF7FBA42D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FFF7FFF7FFF7FFF7F0C6E
        FF7FFF7FFF7FFF7FFF7FFF7FA86DFF7FFF7FFF7FFF7FFF7FFF7FFF7F5D63D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FBE6F9D6B9D6B9D6BCB6D
        FF7F00000000524AFF7FFF7F45699D6B9D6B9D6B9D6B9D6B9D6B9D6B7D67D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FDA46D701D701D701EB6D
        FF7FFF7FFF7F0000FF7FFF7F4669D701D701D701D701D701D701D701D701D701
        4C0CE07FE07FE07FE07F3E37D701D701D7019D6BFF7FDA46D701D701D701676D
        FF7FFF7FFF7F0000FF7FFF7F0C6ED701D701D701D701D701D701D701D701D701
        8F10E07FE07FE07FE07F3E37D7019D6B9D6BBE77FF7FDA46D701D701D701D701
        C064FF7FFF7F0000FF7FC164D701D701D701D701D701D701D701D701D701D701
        9014E07FE07FE07FE07F3E37D701FF7FFF7FFF7FFF7FDA46D701D701D701D705
        D7012469C0640369A96DD701D705D701D701D701D701D701D701D701D701D701
        9014C07BE07FE07FE07F3E37D701D701D701D701D701D701D701D701D701D701
        D701D701D701D701D701D701D701D701D701D701D701D701D701D701D701D701
        B014E07FE07FE07FE07F23673E373E373E373E373E373E373E373E373E373E37
        3E373E373E373E373E373E373E373E373E373E373E373E373E373E373E373E37
        2367E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07FE07F
        E07FE07FE07F}
    end
    object cmVendeTempo: TdxBarLargeButton
      Caption = 'Vender Crédito'
      Category = 0
      Hint = 'Vender Crédito'
      Visible = ivAlways
      UnclickAfterDoing = False
      OnClick = cmVendeTempoClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        5E090000424D5E09000000000000360400002800000025000000210000000100
        0800000000002805000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFE00000000000000000000000000000000FEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEA4FF07070707070707070707
        07070707A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEA4FF0707
        070707070707070707070707A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEA4FF07181807070707A4A4A4A4A40707A4A400FEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A400FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEA4A4A4A4A4A4A4A4A4A4A4
        A4A4A4A407A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA400
        0000000000000000000000A4A40700FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEA4FF07070707070707070707A400A4A4FEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE000000FEFEFEFEA4FF04040404040404040407A4A400FEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA4FF00FCFCFCFCFCFCFC
        0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FEFEFEFEA4FF
        00FCFCFCFCFCFCFC0407A4A400FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000FEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFEFEFEFEFEFE00000000
        00FEFEFEFEFEFE000000FEFEFEFEA4FF00FCFFFCFCFCFCFC0407A4A400FEFEFE
        FEFE0000F9F9F9F9F90000FEFEFEFE000000FEFEFEFEA4FF00FCFCFCFCFCFCFC
        0407A4A400FEFEFEFE00F9F907FFFFFF07F9F900FEFEFE000000FEFEFEFEA4FF
        00000000000000000407A4A400FEFEFE00F9F9FFFFFFFCFFFFFFF9F900FEFE00
        0000FEFEFEFEA4FFFFFFFFFFFFFFFFFFFFFFA4A400FEFEFE00F9FFFFFFFFFFFF
        FFFCFFF900FEFE000000FEFEFEFEFEA407070707070707070707FFA400FEFE00
        F907FFFF00FFFFFFFFFFFF07F900FE000000FEFEFEFEFEFEA407070707070707
        070707FF00FEFE00F9FFFFFFFF00FFFFFFFFFFFFF900FE000000FEFEFEFEFEFE
        FEA4A4A4A4A4A4A4A4A4A4A4FEFEFE00F9FFFCFFFFFFF900000000FFF900FE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00F9FFFFFFFFFFFFFF
        FFFFFFFFF900FE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        F907FFFFFFFFFFFFFFFFFF07F900FE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFE00F9FFFCFFFFFFFFFFFCFFF900FEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00F9F9FFFFFFFCFFFFFFF9F900FEFE00
        0000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00F9F907FFFCFF
        07F9F900FEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFE0000F9F9F9F9F90000FEFEFEFE000000FEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFE0000000000FEFEFEFEFEFE000000FEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE00
        0000}
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
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 296
    Top = 195
  end
  object ImageList1: TImageList
    Height = 21
    Width = 21
    Left = 104
    Top = 179
    Bitmap = {
      494C010102000400040015001500FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000054000000150000000100200000000000901B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF000000
      FF00000000000000000084848400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484000000FF000000FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000FF000000FF000000FF0000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF000000
      FF000000FF000000FF00C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      84008484840084848400848484000000FF000000FF000000FF00848484000000
      0000000000000000000084848400FFFFFF00C6C6C6000063000000630000C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF000000FF000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00848484008484840000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000FF000000FF000000FF008484840084848400848484008484
      8400848484000000FF000000FF000000FF0084848400C6C6C600848484000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000000000000000000000FF000000
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      00008484840084848400C6C6C600000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840084848400C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C6000000FF000000FF000000FF00C6C6C6000000
      FF000000FF000000FF00C6C6C600848484000000000084848400848484000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF0084000000840000008400
      00000000FF000000FF000000FF000000FF000000FF0084000000C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0084000000840000008400000084000000840000008400
      0000840000008400000084000000C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF0000000000FF000000FF000000FF0000000000FF000000FF000000
      FF00FF00000084000000C6C6C600848484008484840000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF00000084000000C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF0000000000FF000000FF00
      00000000FF000000FF000000FF000000FF000000FF0084000000C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084000000C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF0000000000FF0000000000FF000000FF000000FF00FF0000000000
      FF000000FF000000FF00C6C6C600848484008484840000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000000000FF00
      0000FFFFFF00FF000000FF000000FF000000FF000000FF00000084000000C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00000000000000FF000000
      FF000000FF00FF000000FF000000FF0000000000FF000000FF000000FF008484
      8400848484000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000000000FF000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF00000084000000C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000FF000000FF000000FF00FF000000FF000000FF000000FF00
      0000FF0000000000FF000000FF000000FF008484840000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF00000084000000C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000FF000000FF000000FF000000
      00000000000000000000000000000000000000000000840000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084000000C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF000000FF000000FF000000
      FF0000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E00000028000000540000001500000001000100
      00000000FC0000000000000000000000000000000000000000000000FFFFFF00
      FFFFFFFFFFC000000000000080000E0001C000000000000080000C0000C00000
      0000000080000C00004000000000000080000C00004000000000000080000C00
      0040000000000000C0000E000040000000000000E0000F000040000000000000
      E0001F0000C0000000000000E0003F0001C0000000000000E0003F0001C00000
      00000000E0003F0001C0000000000000E0003F0001C0000000000000E0003F00
      01C0000000000000E0003F0001C0000000000000E0003F0001C0000000000000
      E0003F0001C0000000000000C0001F8001C000000000000088000FC001C00000
      000000009C004FE003C0000000000000FFFFFFFFFFC000000000000000000000
      000000000000000000000000000000000000}
  end
  object pmTransf: TdxBarPopupMenu
    BarManager = BarMgr
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemLinks = <
      item
        Item = cmMaquinasDest
        Visible = True
      end>
    UseOwnFont = True
    Left = 384
    Top = 210
  end
  object tAcesso: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'Aberto'
        DataType = ftBoolean
      end
      item
        Name = 'Inicio'
        DataType = ftDateTime
      end
      item
        Name = 'Fim'
        DataType = ftDateTime
      end
      item
        Name = 'DataPagto'
        DataType = ftDateTime
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Maquina'
        DataType = ftWord
      end
      item
        Name = 'Tipo'
        DataType = ftWord
      end
      item
        Name = 'FuncI'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FuncF'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Tempo'
        DataType = ftDateTime
      end
      item
        Name = 'TempoCobrado'
        DataType = ftDateTime
      end
      item
        Name = 'CredUsado'
        DataType = ftInteger
      end
      item
        Name = 'CredAnterior'
        DataType = ftInteger
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'Produtos'
        DataType = ftCurrency
      end
      item
        Name = 'MotivoDesc'
        DataType = ftWord
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'FormaPagto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NaoUsarPacote'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IAberto'
        Fields = 'Aberto;Maquina'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IContato'
        Fields = 'Contato;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IData'
        Fields = 'Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IUsuario'
        Fields = 'FuncI;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'INumero'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IPagto'
        Fields = 'Aberto;DataPagto;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IFim'
        Fields = 'Aberto;DataPagto;Fim'
        Options = [ixDescending, ixCaseInsensitive]
      end
      item
        Name = 'ICaixa'
        Fields = 'Caixa'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'INumero'
    SessionName = 'SesPad'
    TableName = 'Acesso'
    Left = 464
    Top = 194
  end
end
