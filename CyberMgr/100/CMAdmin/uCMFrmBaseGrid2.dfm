object FrmBaseGrid2: TFrmBaseGrid2
  Left = 159
  Top = 241
  Width = 554
  Height = 392
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 65
    Width = 546
    Height = 300
    UseDockManager = False
    Align = alClient
    Bevel.StyleInner = bvLowered
    Bevel.BorderWidth = 7
    Bevel.Mode = bmCustom
    TabOrder = 4
    object LMDSimplePanel2: TLMDSimplePanel
      Left = 8
      Top = 34
      Width = 530
      Height = 258
      UseDockManager = False
      Align = alClient
      Bevel.Mode = bmCustom
      TabOrder = 0
      object Grid: TdxDBGrid
        Left = 0
        Top = 0
        Width = 530
        Height = 258
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'Numero'
        ShowGroupPanel = True
        ShowSummaryFooter = True
        SummaryGroups = <
          item
            DefaultGroup = False
            SummaryItems = <
              item
                SummaryType = cstCount
              end>
            Name = 'GridSummaryGroup2'
          end>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnDblClick = GridDblClick
        OnMouseUp = GridMouseUp
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -11
        BandFont.Name = 'MS Sans Serif'
        BandFont.Style = []
        Filter.Active = True
        Filter.CaseInsensitive = True
        Filter.Criteria = {00000000}
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        IniSectionName = 'Grid'
        LookAndFeel = lfFlat
        OptionsBehavior = [edgoAutoSearch, edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoRowSelect, edgoUseBitmap]
        PreviewFieldName = 'Obs'
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -11
        PreviewFont.Name = 'MS Sans Serif'
        PreviewFont.Style = []
        PreviewLines = 3
        ShowRowFooter = True
        OnCustomDrawFooter = GridCustomDrawFooter
        OnCustomDrawFooterNode = GridCustomDrawFooterNode
        OnEndColumnsCustomizing = GridEndColumnsCustomizing
        OnColumnMoved = GridColumnMoved
        OnHideColumn = GridHideColumn
      end
    end
    object BarDockControl: TdxBarDockControl
      Left = 8
      Top = 8
      Width = 530
      Height = 26
      Align = dalTop
      AllowZeroSizeInDesignTime = True
      BarManager = BarMgr
      UseOwnColor = True
    end
  end
  object BarMgr: TdxBarManager
    AllowCallFromAnotherForm = True
    AlwaysMerge = True
    AutoDockColor = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
            Visible = True
          end
          item
            Item = cmSubEditar
            Visible = True
          end
          item
            Item = cmSubExibir
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
            Visible = True
          end
          item
            Item = cmApagar
            Visible = True
          end
          item
            Item = cmEditar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmPreviewObs
            Visible = True
          end
          item
            Item = cmRefresh
            Visible = True
          end
          item
            Item = cmGrafico
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmLocalizar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmFechar
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
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmSubPeriodo
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
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'Periodo'
      'Layout'
      'Editar'
      'Exibir')
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
    DockColor = clBtnFace
    MenusShowRecentItemsFirst = False
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = False
    Left = 192
    Top = 216
    DockControlHeights = (
      0
      0
      65
      0)
    object cmSubPeriodo: TdxBarSubItem
      Caption = 'De 01/01/2000 a 31/12/2000'
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000E0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        660060404044040406006FFFFFFFFFFFF6006FF111F1118FF6006FFF1FF8F81F
        F6006FFF1FFFFF1FF6006FFF1FF1118FF6006FF11FF1FFFFF6006FFF1FF1111F
        F6006FFFFFFFFFFFF6006F8888888888F6006000000000000600666666666666
        6600}
      ItemLinks = <
        item
          Item = cmHoje
          Visible = True
        end
        item
          Item = cmEstaSemana
          Visible = True
        end
        item
          Item = cmEsteMes
          Visible = True
        end
        item
          Item = cmEsteAno
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmAno
          Visible = True
        end
        item
          Item = cmMes
          Visible = True
        end
        item
          Item = cmDias
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmPeriodoTudo
          Visible = True
        end
        item
          Item = cmInicio
          Visible = True
        end
        item
          Item = cmFim
          Visible = True
        end>
    end
    object cmHoje: TdxBarButton
      Caption = 'Hoje'
      Category = 1
      Hint = 'Hoje'
      Visible = ivAlways
      OnClick = cmHojeClick
    end
    object cmEstaSemana: TdxBarButton
      Caption = 'Esta semana'
      Category = 1
      Hint = 'Esta semana'
      Visible = ivAlways
      OnClick = cmEstaSemanaClick
    end
    object cmPeriodoTudo: TdxBarButton
      Caption = 'Tudo'
      Category = 1
      Hint = 'Tudo'
      Visible = ivAlways
      OnClick = cmPeriodoTudoClick
    end
    object cmEsteMes: TdxBarButton
      Caption = 'Este m'#234's'
      Category = 1
      Hint = 'Este m'#234's'
      Visible = ivAlways
      OnClick = cmEsteMesClick
    end
    object cmEsteAno: TdxBarButton
      Caption = 'Este ano'
      Category = 1
      Hint = 'Este ano'
      Visible = ivAlways
      OnClick = cmEsteAnoClick
    end
    object cmInicio: TdxBarDateCombo
      Caption = 'De'
      Category = 1
      Hint = 'De'
      Visible = ivAlways
      Text = 's'#225'b 21/7/2001'
      OnChange = cmInicioChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      Width = 100
    end
    object cmFim: TdxBarDateCombo
      Caption = 'A  '
      Category = 1
      Hint = 'A  '
      Visible = ivAlways
      Text = 's'#225'b 21/7/2001'
      OnChange = cmFimChange
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      Width = 100
    end
    object cmDias: TdxBarSubItem
      Caption = 'Dias'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Item = cm2dias
          Visible = True
        end
        item
          Item = cm3dias
          Visible = True
        end
        item
          Item = cm4dias
          Visible = True
        end
        item
          Item = cm5dias
          Visible = True
        end
        item
          Item = cm6dias
          Visible = True
        end
        item
          Item = cm1semana
          Visible = True
        end
        item
          Item = cm1Mes
          Visible = True
        end
        item
          Item = cm1ano
          Visible = True
        end>
    end
    object cm2dias: TdxBarButton
      Tag = 2
      Caption = '2 dias'
      Category = 1
      Hint = '2 dias'
      Visible = ivAlways
      OnClick = cm2diasClick
    end
    object cm3dias: TdxBarButton
      Tag = 3
      Caption = '3 dias'
      Category = 1
      Hint = '3 dias'
      Visible = ivAlways
      OnClick = cm2diasClick
    end
    object cm4dias: TdxBarButton
      Tag = 4
      Caption = '4 dias'
      Category = 1
      Hint = '4 dias'
      Visible = ivAlways
      OnClick = cm2diasClick
    end
    object cm5dias: TdxBarButton
      Tag = 5
      Caption = '5 dias'
      Category = 1
      Hint = '5 dias'
      Visible = ivAlways
      OnClick = cm2diasClick
    end
    object cm6dias: TdxBarButton
      Tag = 6
      Caption = '6 dias'
      Category = 1
      Hint = '6 dias'
      Visible = ivAlways
      OnClick = cm2diasClick
    end
    object cm1semana: TdxBarButton
      Tag = 7
      Caption = '1 semana'
      Category = 1
      Hint = '1 semana'
      Visible = ivAlways
      OnClick = cm2diasClick
    end
    object cm1Mes: TdxBarButton
      Tag = 30
      Caption = '1 m'#234's'
      Category = 1
      Hint = '1 m'#234's'
      Visible = ivAlways
      OnClick = cm2diasClick
    end
    object cm1ano: TdxBarButton
      Tag = 365
      Caption = '1 ano'
      Category = 1
      Hint = '1 ano'
      Visible = ivAlways
      OnClick = cm2diasClick
    end
    object cmImprimir: TdxBarButton
      Caption = 'Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Visible = ivAlways
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDD7777777777DDDDD0000DDDD
        000000000007DDDD0000DDD07878787870707DDD0000DD0000000000000707DD
        0000DD0F8F8F8AAA8F0007DD0000DD08F8F8F999F80707DD0000DD0000000000
        0008707D0000DD08F8F8F8F8F080807D0000DDD0000000000F08007D0000DDDD
        0BFFFBFFF0F080DD0000DDDDD0F00000F0000DDD0000DDDDD0FBFFFBFF0DDDDD
        0000DDDDDD0F00000F0DDDDD0000DDDDDD0FFBFFFBF0DDDD0000DDDDDDD00000
        0000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
      OnClick = cmImprimirClick
    end
    object cmExportar: TdxBarButton
      Caption = 'Exportar'
      Category = 0
      Hint = 'Exportar'
      Visible = ivAlways
      Glyph.Data = {
        BA040000424DBA04000000000000360000002800000011000000110000000100
        2000000000008404000000000000000000000000000000000000BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000FFFF007F7F
        7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000000000FF
        FF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF000000
        0000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
        000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF0000000000BFBFBF00000000000000000000000000000000000000
        000000000000000000000000000000000000000000007F7F7F007F7F7F000000
        0000000000007F7F7F0000000000BFBFBF0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
        00007F7F7F007F7F7F0000FFFF0000000000BFBFBF0000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
        0000000000007F7F7F0000FFFF0000FFFF0000000000BFBFBF0000000000FFFF
        FF000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
        000000000000000000000000FF0000000000000000007F7F7F00BFBFBF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000BFBFBF000000FF000000FF000000FF00BFBFBF00BFBFBF00BFBF
        BF0000000000FFFFFF0000000000000000000000000000000000FFFFFF000000
        0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF00BFBF
        BF00BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000
        FF000000FF00BFBFBF0000000000FFFFFF000000000000000000FFFFFF000000
        000000000000000000000000000000000000BFBFBF000000FF000000FF000000
        FF00BFBFBF00BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000FFFFFF00FFFFFF0000000000BFBFBF00BFBFBF000000FF000000
        FF000000FF00BFBFBF00BFBFBF00BFBFBF0000000000FFFFFF0000000000BFBF
        BF00FFFFFF0000000000FFFFFF0000000000BFBFBF00BFBFBF007F7F7F000000
        FF000000FF000000FF00BFBFBF00BFBFBF00BFBFBF0000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF000000000000000000BFBFBF000000FF000000FF000000
        FF000000FF000000FF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00000000000000
        000000000000000000000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00}
      OnClick = cmExportarClick
    end
    object cmLayout: TdxBarSubItem
      Caption = 'Layout'
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
        9999900000009999999997888880999999999777777099999999978888800000
        000997888880FFF8FF09977777708888880997884444FFF8FF09978888804888
        880997777770F4F8FF0999997888848888099999777444447709999978878487
        8809999978878887880999997777777777099999999999999999}
      ItemLinks = <
        item
          Item = cmCustomizar
          Visible = True
        end
        item
          Item = cmLayoutSalvar
          Visible = True
        end
        item
          Item = cmSalvarAtual
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmOpcoes
          Visible = True
        end
        item
          Item = cmResetarLayout
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmLayouts
          Visible = True
        end>
    end
    object cmCustomizar: TdxBarButton
      Caption = 'Seletor de Colunas'
      Category = 2
      Hint = 'Seletor de Colunas'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
        9999900000009999999997888880999999999777777099999999978888800000
        000997888880FFF8FF09977777708888880997884444FFF8FF09978888804888
        880997777770F4F8FF0999997888848888099999777444447709999978878487
        8809999978878887880999997777777777099999999999999999}
      OnClick = cmCustomizarClick
    end
    object cmLayoutSalvar: TdxBarButton
      Caption = 'Salvar'
      Category = 2
      Hint = 'Salvar'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333330080880033333333008888003333333300000000000000000000
        00000FFFFFFF0FFFFFF00FFFFFFF0FFFFFF00F00F0080CCC9CC00FFFFFFFF039
        99330F0000F0F09999930FFFFFFFF99999990F00F000003999330FFFF0FF0339
        99330F08F0F0337999330FFFF003999993330000003333333333}
      OnClick = cmLayoutSalvarClick
    end
    object cmLayouts: TdxBarListItem
      Caption = 'Layouts'
      Category = 0
      Visible = ivAlways
      OnClick = cmLayoutsClick
    end
    object cmAno: TdxBarSubItem
      Caption = 'Ano'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Item = cmAnos
          Visible = True
        end>
    end
    object cmAnos: TdxBarListItem
      Caption = 'Anos'
      Category = 1
      Visible = ivAlways
      OnClick = cmAnosClick
      Items.Strings = (
        '2001'
        '2000'
        '1999'
        '1998'
        '1997'
        '1996'
        '1995'
        '1994'
        '1993'
        '1992'
        '1991')
    end
    object cmMes: TdxBarSubItem
      Caption = 'M'#234's'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Item = cmAno1
          Visible = True
        end
        item
          Item = cmAno2
          Visible = True
        end
        item
          Item = cmAno3
          Visible = True
        end
        item
          Item = cmAno4
          Visible = True
        end
        item
          Item = cmAno5
          Visible = True
        end
        item
          Item = cmAno6
          Visible = True
        end
        item
          Item = cmAno7
          Visible = True
        end
        item
          Item = cmAno8
          Visible = True
        end
        item
          Item = cmAno9
          Visible = True
        end
        item
          Item = cmAno10
          Visible = True
        end>
    end
    object cmMeses: TdxBarListItem
      Caption = 'Meses'
      Category = 1
      Visible = ivAlways
      OnClick = cmMesesClick
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object cmSalvarAtual: TdxBarButton
      Caption = 'Salvar'
      Category = 2
      Hint = 'Salvar'
      Visible = ivNever
      OnClick = cmSalvarAtualClick
    end
    object cmAno1: TdxBarSubItem
      Tag = 1
      Caption = 'Ano 1'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <
        item
          Item = cmMeses
          Visible = True
        end>
    end
    object cmAno2: TdxBarSubItem
      Tag = 2
      Caption = 'Ano 2'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <
        item
          Item = cmMeses
          Visible = True
        end>
    end
    object cmAno3: TdxBarSubItem
      Tag = 3
      Caption = 'Ano 3'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <
        item
          Item = cmMeses
          Visible = True
        end>
    end
    object cmAno4: TdxBarSubItem
      Caption = 'Ano 4'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <>
    end
    object cmAno5: TdxBarSubItem
      Caption = 'Ano 5'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <>
    end
    object cmAno6: TdxBarSubItem
      Caption = 'Ano 6'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <>
    end
    object cmAno7: TdxBarSubItem
      Caption = 'Ano 7'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <>
    end
    object cmAno8: TdxBarSubItem
      Caption = 'Ano 8'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <>
    end
    object cmAno9: TdxBarSubItem
      Caption = 'Ano 9'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <>
    end
    object cmAno10: TdxBarSubItem
      Caption = 'Ano10'
      Category = 1
      Visible = ivAlways
      OnClick = cmAno1Click
      ItemLinks = <>
    end
    object cmSalvarPadrao: TdxBarButton
      Caption = 'Salvar layout atual como Padr'#227'o'
      Category = 2
      Hint = 'Salvar layout atual como Padr'#227'o'
      Visible = ivAlways
      OnClick = cmSalvarPadraoClick
    end
    object cmOpcoes: TdxBarSubItem
      Caption = 'Op'#231#245'es'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = cmTotalizar
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmSalvarPadrao
          Visible = True
        end
        item
          Item = cmRestaurar
          Visible = True
        end>
    end
    object cmRestaurar: TdxBarButton
      Caption = 'Restaurar layout padr'#227'o de sistema'
      Category = 2
      Hint = 'Restaurar layout padr'#227'o de sistema'
      Visible = ivAlways
      OnClick = cmRestaurarClick
    end
    object cmTotalizar: TdxBarButton
      Caption = 'Totalizar'
      Category = 0
      Hint = 'Totalizar'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333300000000000000366444444444444406F6666666666
        66406E60F0F0F0FF80406F666666666666406E60F0F0F0F0F0406F6666666666
        66406E088888886666406F0FFFFFF86666406E000000006666406FEFEFEFEFEF
        EF60366666666666666333333333333333333333333333333333}
    end
    object cmResetarLayout: TdxBarButton
      Caption = 'Resetar'
      Category = 2
      Hint = 'Voltar layout padr'#227'o'
      Visible = ivAlways
      OnClick = cmResetarLayoutClick
    end
    object cmArquivo: TdxBarSubItem
      Caption = '&Arquivo'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = cmImprimir
          UserDefine = [udPaintStyle]
          Visible = True
        end
        item
          Item = cmExportar
          UserDefine = [udPaintStyle]
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmFechar
          Visible = True
        end>
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      Glyph.Data = {
        B6020000424DB602000000000000B60000002800000010000000100000000100
        1000030000000002000000000000000000001000000000000000007C0000E003
        00001F0000000000000000008000008000000080800080000000800080008080
        000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
        0000FFFFFF000084008400000000000000000000000000000000000000000000
        0084008400840084008400000080008000800080008000800080008000800000
        0084008400840084008400000080008000800080008000800080008000800000
        0084008400840084008400000080008000800080008000800080008000800000
        0084008400840084008400000080008000800080008000800080008000800000
        0084008400840084008400000080008000800080008000800080008000800000
        0084008400840084008400000080008000800080008000800080008000800000
        0084008400840084008400000080008000800080008000800080E0FF00800000
        0084008400840084008400000080008000800080008000800080008000800000
        0084008400840084008400000080008000800080008000800080008000800000
        00840084008400840084000000800080FF07FF07FF07FF07FF07008000800000
        00840084008400840084000000800080FF07FF07FF07FF07FF07008000800000
        00840084008400840084000000800080FF07FF07FF07FF07FF07008000800000
        0084008400840084008400000080008000800080008000800080008000800000
        0084008400840084008400000080008000800080008000800080008000800000
        0084008400840084008400000000000000000000000000000000000000000000
        008400840084}
      ShortCut = 27
      OnClick = cmFecharClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        0333330111111111033333011111111103333301111111110333330111111111
        0333330111111111033333011111111103333301111111B10333330111111111
        0333330111111111033333011EEEEE11033333011EEEEE11033333011EEEEE11
        0333330111111111033333011111111103333300000000000333}
    end
    object cmSubEditar: TdxBarSubItem
      Caption = '&Editar'
      Category = 3
      Visible = ivAlways
      ItemLinks = <
        item
          Item = cmNovo
          Visible = True
        end
        item
          Item = cmApagar
          Visible = True
        end
        item
          Item = cmEditar
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmLayout
          Visible = True
        end
        item
          Item = cmSubPeriodo
          Visible = True
        end>
    end
    object cmNovo: TdxBarLargeButton
      Caption = 'Novo'
      Category = 3
      Hint = 'Novo'
      Visible = ivAlways
      Glyph.Data = {
        360A0000424D360A000000000000360800002800000010000000100000000100
        1000030000000002000000000000000000000001000000000000007C0000E003
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
        18C618C618C618C618C618C618C618C618C614A514A514A514A514A518C618C6
        18C618C618C618C618C618C618C618C60000000000000000000014A518C618C6
        18C618C618C618C618C618C618C618C60000E0FFE0FFE0FF000014A518C618C6
        18C618C618C618C618C618C618C618C60000E0FFE0FFE0FF000014A518C618C6
        18C618C618C618C618C618C618C618C60000E0FFE0FFE0FF000014A514A514A5
        14A514A518C618C600000000000000000000E0FFE0FFE0FF0000000000000000
        000014A518C618C60000E0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FF
        000014A518C618C60000E0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FF
        000014A518C618C60000E0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FF
        000014A518C618C600000000000000000000E0FFE0FFE0FF0000000000000000
        000018C618C618C618C618C618C618C60000E0FFE0FFE0FF000018C618C618C6
        18C618C618C618C618C618C618C618C60000E0FFE0FFE0FF000018C618C618C6
        18C618C618C618C618C618C618C618C60000E0FFE0FFE0FF000018C618C618C6
        18C618C618C618C618C618C618C618C60000000000000000000018C618C618C6
        18C618C618C618C618C618C618C618C618C618C618C618C618C618C618C618C6
        18C618C618C6}
      ShortCut = 16429
      OnClick = cmNovoClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
        07070707070707070707070707070707F7F7F7F7F70707070707070707070700
        00000000F70707070707070707070700FBFBFB00F70707070707070707070700
        FBFBFB00F70707070707070707070700FBFBFB00F7F7F7F7F707070000000000
        FBFBFB0000000000F7070700FBFBFBFBFBFBFBFBFBFBFB00F7070700FBFBFBFB
        FBFBFBFBFBFBFB00F7070700FBFBFBFBFBFBFBFBFBFBFB00F707070000000000
        FBFBFB00000000000707070707070700FBFBFB00070707070707070707070700
        FBFBFB00070707070707070707070700FBFBFB00070707070707070707070700
        0000000007070707070707070707070707070707070707070707}
    end
    object cmApagar: TdxBarLargeButton
      Caption = 'Apagar'
      Category = 3
      Hint = 'Apagar'
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
        0707070707070707070707070707070707070707070707070707070707070707
        0707070707070707070707070707070707070707070707070707070707070707
        070707070707070707070707F7F7F7F7F7F7F7F7F7F7F7F7F707070000000000
        0000000000000000F7070700FBFBFBFBFBFBFBFBFBFBFB00F7070700FBFBFBFB
        FBFBFBFBFBFBFB00F7070700FBFBFBFBFBFBFBFBFBFBFB00F707070000000000
        0000000000000000070707070707070707070707070707070707070707070707
        0707070707070707070707070707070707070707070707070707070707070707
        0707070707070707070707070707070707070707070707070707}
      ShortCut = 16430
      OnClick = cmApagarClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
        0707070707070707070707070707070707070707070707070707070707070707
        0707070707070707070707070707070707070707070707070707070707070707
        070707070707070707070707F7F7F7F7F7F7F7F7F7F7F7F7F707070000000000
        0000000000000000F7070700FBFBFBFBFBFBFBFBFBFBFB00F7070700FBFBFBFB
        FBFBFBFBFBFBFB00F7070700FBFBFBFBFBFBFBFBFBFBFB00F707070000000000
        0000000000000000070707070707070707070707070707070707070707070707
        0707070707070707070707070707070707070707070707070707070707070707
        0707070707070707070707070707070707070707070707070707}
    end
    object cmEditar: TdxBarLargeButton
      Caption = 'Editar'
      Category = 3
      Hint = 'Editar'
      Visible = ivAlways
      Glyph.Data = {
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
      OnClick = cmEditarClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        82060000424D8206000000000000420400002800000010000000120000000100
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
    object cmSubExibir: TdxBarSubItem
      Caption = 'E&xibir'
      Category = 4
      Visible = ivAlways
      ItemLinks = <
        item
          Item = cmPreviewObs
          Visible = True
        end
        item
          Item = cmRefresh
          Visible = True
        end
        item
          Item = cmGrafico
          Visible = True
        end
        item
          BeginGroup = True
          Item = cmLocalizar
          Visible = True
        end>
    end
    object cmPreviewObs: TdxBarLargeButton
      Caption = 'Obs'
      Category = 4
      Hint = 'Ver observa'#231#245'es'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Glyph.Data = {
        B6020000424DB602000000000000B60000002800000010000000100000000100
        1000030000000002000000000000000000001000000000000000007C0000E003
        00001F0000000000000000008000008000000080800080000000800080008080
        000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
        0000FFFFFF00FF07FF07FF07FF07FF07FF07FF07FF07FF07FF07FF07FF07FF07
        FF07FF070000FF07FF07FF07FF07FF07FF07FF07FF070000000000000000FF07
        FF0700000000FF07FF07FF07FF07FF07FF0700000000FFFFFFFFFFFFFFFF0000
        000000000000FF07FF07FF07FF07FF0700001F001F001F001F001F00FFFF0000
        FF070000FF07FF07FF07FF07FF07FF070000FFFFFFFFFFFFFFFFFFFFFFFF0000
        FF070000FF07108410841084000000001F001F001F001F001F001F00FFFF0000
        FF07FF0700000000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        FF07FF0700000000FFFF1000100000001F001F001F001F001F001F00FFFF0000
        FF07FF0700000000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        FF07FF0700000000FFFF1000100010000000FFFFFFFFFFFFFFFFFFFFFFFF0000
        FF070000FF070000FFFFFFFFFFFFFFFF00001084108410841084108410841084
        FF070000FF070000FFFF100010001000100000000000FFFFFFFFFFFFFFFF0000
        00001084FF070000FFFFFFFFFFFFFFFFFFFFFFFF18C60000000000000000FFFF
        FFFF1084FF070000FFFF1000100010001000FFFF18C6FFFF1000100010001000
        10001084FF070000FFFFFFFFFFFFFFFFFFFFFFFF18C6FFFFFFFFFFFFFFFFFFFF
        FFFF1084FF070000000000000000000000000000000000000000000000000000
        00001084FF07}
      ShortCut = 16463
      OnClick = cmPreviewObsClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00EEEEEEEEEEEE
        EEE0EEEEEEEE0000EE00EEEEEE00FFFF0000EEEEE0CCCCCF0E0EEEEEE0FFFFFF
        0E0E77700CCCCCCF0EE00FFF0FFFFFFF0EE00F440CCCCCCF0EE00FFF0FFFFFFF
        0EE00F4440FFFFFF0E0E0FFFF07777777E0E0F444400FFFF007E0FFFFFF80000
        FF7E0F4444F8F444447E0FFFFFF8FFFFFF7E000000000000007E}
    end
    object cmRefresh: TdxBarLargeButton
      Caption = 'Atuali&zar'
      Category = 4
      Hint = 'Atualizar'
      Visible = ivAlways
      Glyph.Data = {
        B6020000424DB602000000000000B60000002800000010000000100000000100
        1000030000000002000000000000000000001000000000000000007C0000E003
        00001F0000000000000000008000008000000080800080000000800080008080
        000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
        0000FFFFFF0018C618C600000000000000000000000000000000000000000000
        0000000018C618C618C60000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000018C618C618C60000FFFFFFFFFFFFFFFFFFFF0004FFFFFFFFFFFFFFFF
        FFFF000018C618C618C60000FFFFFFFFFFFFFFFF00040004FFFFFFFFFFFFFFFF
        FFFF000018C618C618C60000FFFFFFFFFFFF00040004000400040004FFFFFFFF
        FFFF000018C618C618C60000FFFFFFFFFFFFFFFF00040004FFFFFFFF0004FFFF
        FFFF000018C618C618C60000FFFFFFFFFFFFFFFFFFFF0004FFFFFFFF0004FFFF
        FFFF000018C618C618C60000FFFFFFFF0004FFFFFFFFFFFFFFFFFFFF0004FFFF
        FFFF000018C618C618C60000FFFFFFFF0004FFFFFFFF0004FFFFFFFFFFFFFFFF
        FFFF000018C618C618C60000FFFFFFFF0004FFFFFFFF00040004FFFFFFFFFFFF
        FFFF000018C618C618C60000FFFFFFFFFFFF00040004000400040004FFFFFFFF
        FFFF000018C618C618C60000FFFFFFFFFFFFFFFFFFFF00040004FFFFFFFFFFFF
        FFFF000018C618C618C60000FFFFFFFFFFFFFFFFFFFF0004FFFFFFFF00000000
        0000000018C618C618C60000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        000018C618C618C618C60000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        18C618C618C618C618C6000000000000000000000000000000000000000018C6
        18C618C618C6}
      OnClick = cmRefreshClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880000000000
        0008880FFFFFFFFFFF08880FFFFF2FFFFF08880FFFF22FFFFF08880FFF22222F
        FF08880FFFF22FF2FF08880FFFFF2FF2FF08880FF2FFFFF2FF08880FF2FF2FFF
        FF08880FF2FF22FFFF08880FFF22222FFF08880FFFFF22FFFF08880FFFFF2FF0
        0008880FFFFFFFF0F088880FFFFFFFF008888800000000008888}
    end
    object cmLocalizar: TdxBarSubItem
      Caption = '&Localizar por'
      Category = 4
      Hint = 'Localizar por'
      Visible = ivAlways
      Glyph.Data = {
        62020000424D62020000000000008200000028000000100000000F0000000100
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
          Visible = True
        end>
    end
    object cmColunas: TdxBarListItem
      Caption = 'Colunas'
      Category = 4
      Visible = ivAlways
      OnClick = cmColunasClick
    end
    object cmGrafico: TdxBarLargeButton
      Caption = 'Gr'#225'fico'
      Category = 4
      Hint = 'Gr'#225'fico'
      Visible = ivAlways
      DropDownMenu = pmLocalizar
      Glyph.Data = {
        B6020000424DB602000000000000B60000002800000010000000100000000100
        1000030000000002000000000000000000001000000000000000007C0000E003
        00001F0000000000000000008000008000000080800080000000800080008080
        000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
        0000FFFFFF00FFFFFFFF1084FFFF1084FFFF1084FFFF1084FFFF1084FFFF1084
        FFFF1084FFFFFFFF000000000000000000000000000000000000000000000000
        00000000000010840000FFFF00F800F8FFFF1F001F00FFFF00040004FFFFFF07
        FF07FFFF0080FFFF0000FFFF00F800F8FFFF1F001F00FFFF00040004FFFFFF07
        FF07FFFF008010840000FFFF00F800F8FFFF1F001F00FFFF00040004FFFFFF07
        FF07FFFF0080FFFF0000FFFF00F800F8FFFF1F001F00FFFF00040004FFFFFF07
        FF07FFFFFFFF10840000FFFF00F800F8FFFF1F001F00FFFF00040004FFFFFF07
        FF07FFFFFFFFFFFF0000FFFFFFFFFFFFFFFF1F001F00FFFF00040004FFFFFF07
        FF07FFFFFFFF10840000FFFFFFFFFFFFFFFF1F001F00FFFF00040004FFFFFF07
        FF07FFFFFFFFFFFF0000FFFFFFFFFFFFFFFF1F001F00FFFF00040004FFFFFF07
        FF07FFFFFFFF10840000FFFFFFFFFFFFFFFFFFFFFFFFFFFF00040004FFFFFF07
        FF07FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF00040004FFFFFF07
        FF07FFFFFFFF10840000FFFFFFFFFFFFFFFFFFFFFFFFFFFF00040004FFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF00040004FFFFFFFF
        FFFFFFFFFFFF10840000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF}
      UnclickAfterDoing = False
      OnClick = cmGraficoClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF7F7F7F7F7F
        7F7FF00000000000000070F99FCCF22FEEF1F0F99FCCF22FEEF170F99FCCF22F
        EEF1F0F99FCCF22FEEFF70F99FCCF22FEEFFF0FFFFCCF22FEEFF70FFFFCCF22F
        EEFFF0FFFFCCF22FEEFF70FFFFFFF22FEEFFF0FFFFFFF22FEEFF70FFFFFFF22F
        FFFFF0FFFFFFF22FFFFF70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object pmLocalizar: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Item = cmColunas
        Visible = True
      end>
    UseOwnFont = False
    Left = 41
    Top = 195
  end
end
