object FrmGrupo: TFrmGrupo
  Left = 365
  Top = 158
  Width = 518
  Height = 400
  BorderWidth = 5
  Caption = 'Grupo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 22
    Width = 500
    Height = 341
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object Paginas: TPageControl
      Left = 5
      Top = 5
      Width = 490
      Height = 331
      ActivePage = tsGrupo
      Align = alClient
      TabOrder = 0
      object tsDados: TTabSheet
        BorderWidth = 5
        Caption = '&Dados'
        object Insp: TdxDBInspector
          Left = 0
          Top = 0
          Width = 472
          Height = 293
          Align = alClient
          DataSource = dsGrupo
          DefaultFields = False
          TabOrder = 0
          DividerPos = 97
          Flat = True
          Options = [dioAutoWidth, dioBandSizing, dioCancelOnExit, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
          Data = {
            1C00000001000000080000000000000008000000496E73704E6F6D6500000000}
          object InspNome: TdxInspectorDBMaskRow
            FieldName = 'Nome'
          end
        end
      end
      object tsGrupo: TTabSheet
        BorderWidth = 5
        Caption = '&Usuários'
        ImageIndex = 1
        object LMDSplitterPanel1: TLMDSplitterPanel
          Left = 0
          Top = 0
          Width = 472
          Height = 293
          BackFX.AlphaBlend.Strength = 0.600000023841858
          Bevel.Mode = bmCustom
          Bars = <
            item
              OldPosition = -1
              Position = 127
              PosPercent = 45
              Width = 10
            end>
          Orientation = spHorzDown
          Align = alClient
          TabOrder = 0
          object LMDSplitterPane2: TLMDSplitterPane
            Bevel.Mode = bmStandard
            object LBUsuarios: TListBox
              Left = 0
              Top = 26
              Width = 470
              Height = 99
              Align = alClient
              BorderStyle = bsNone
              ItemHeight = 13
              TabOrder = 0
            end
            object dxBarDockControl1: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 470
              Height = 26
              Align = dalTop
              BarManager = BM
            end
          end
          object LMDSplitterPane1: TLMDSplitterPane
            Bevel.Mode = bmStandard
            object gridUsuarios: TdxDBGrid
              Left = 0
              Top = 26
              Width = 470
              Height = 128
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'Username'
              SummaryGroups = <>
              SummarySeparator = ', '
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DataSource = dsUsuario
              Filter.Criteria = {00000000}
              LookAndFeel = lfFlat
              OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
              ShowGrid = False
              ShowHeader = False
              object gridUsuariosNome: TdxDBGridMaskColumn
                Width = 280
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Nome'
              end
            end
            object dxBarDockControl2: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 470
              Height = 26
              Align = dalTop
              BarManager = BM
            end
          end
        end
      end
      object tsDireitos: TTabSheet
        BorderWidth = 5
        Caption = '&Acessos &Permitidos'
        ImageIndex = 2
        object LMDSplitterPanel2: TLMDSplitterPanel
          Left = 0
          Top = 0
          Width = 472
          Height = 293
          BackFX.AlphaBlend.Strength = 0.600000023841858
          Bevel.Mode = bmCustom
          Bars = <
            item
              OldPosition = -1
              Position = 133
              PosPercent = 47
              Width = 10
            end>
          Orientation = spHorzDown
          Align = alClient
          TabOrder = 0
          object LMDSplitterPane3: TLMDSplitterPane
            Bevel.Mode = bmStandard
            object dxBarDockControl3: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 470
              Height = 26
              Align = dalTop
              BarManager = BM
            end
            object gridDireito: TdxDBGrid
              Left = 0
              Top = 26
              Width = 470
              Height = 105
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'Modulo'
              SummaryGroups = <>
              SummarySeparator = ', '
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 1
              OnDblClick = cmEditarAcessoClick
              DataSource = dsAcesso
              Filter.Criteria = {00000000}
              LookAndFeel = lfFlat
              OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
              object gridDireitoModulo: TdxDBGridMaskColumn
                Caption = 'Módulo'
                VertAlignment = tlCenter
                Width = 125
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Modulo'
              end
              object gridDireitoPermissoes: TdxDBGridMemoColumn
                VertAlignment = tlCenter
                Width = 394
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Permissoes'
              end
            end
          end
          object LMDSplitterPane4: TLMDSplitterPane
            Bevel.Mode = bmStandard
            object gridModulos: TdxDBGrid
              Left = 0
              Top = 26
              Width = 470
              Height = 122
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'ID'
              SummaryGroups = <>
              SummarySeparator = ', '
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DataSource = dsModulo
              Filter.Criteria = {00000000}
              LookAndFeel = lfFlat
              OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
              ShowGrid = False
              ShowHeader = False
              object gridModulosNome: TdxDBGridMaskColumn
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Nome'
              end
            end
            object dxBarDockControl4: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 470
              Height = 26
              Align = dalTop
              BarManager = BM
            end
          end
        end
      end
    end
  end
  object BM: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'Controles'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 67
        FloatTop = 344
        FloatClientWidth = 69
        FloatClientHeight = 44
        ItemLinks = <
          item
            Item = cmGravar
            Visible = True
          end
          item
            Item = cmCancelar
            Visible = True
          end>
        Name = 'Controles'
        NotDocking = [dsNone]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Usuarios'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmUsuarios
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAdicionar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'Usuarios'
        NotDocking = [dsNone]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Usuarios 2'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 240
        FloatTop = 191
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmUsuarios2
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmRemover
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'Usuarios 2'
        NotDocking = [dsNone]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Acessos 1'
        DockControl = dxBarDockControl3
        DockedDockControl = dxBarDockControl3
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmAcessos1
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmEditarAcesso
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmRemoveAcesso
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'Acessos 1'
        NotDocking = [dsNone]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Acessos 2'
        DockControl = dxBarDockControl4
        DockedDockControl = dxBarDockControl4
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 166
        FloatTop = 168
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmAcesso2
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAddAcesso
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'Acessos 2'
        NotDocking = [dsNone]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 296
    Top = 8
    DockControlHeights = (
      0
      0
      22
      0)
    object cmGravar: TdxBarButton
      Caption = '&Gravar'
      Category = 0
      Hint = 'Gravar'
      Visible = ivAlways
      Glyph.Data = {
        02060000424D0206000000000000360400002800000013000000170000000100
        080000000000CC010000000000000000000000010000000000001C3404002434
        1C00242424001C3C0400243C0C00244404002C5C04003C5C240044543C005C5C
        54005C5C5C00646464006C6C6C0054743C007474740044840400747C74007C7C
        7C0084848400449404006C8C540054AC0400000000008C8C8C008C948C009494
        94009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC040074F404007CFC
        040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC240094EC3C0094FC
        2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC5400ACFC6400B4FC
        6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCCAC00BCC4B400BCCC
        B400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0C000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000003F3F3F3F3F3F
        191717193F3F3F3F3F3F3F3F3F003F3F3F3F3F1712111112193F3F3F3F3F3F3F
        3F003F3F3F3F19120E0C0C0E123F3F3F3F3F3F3F3F003F3F3F3F120E0C0B0B0C
        11173F3F3F3F3F3F3F003F3F3F17110C0B0A0A0B0E123F3F3F3F3F3F3F003F3F
        3F12140702010B0B0C11173F3F3F3F3F3F003F3F3F181E1E0F03100C0C0E1219
        3F3F3F3F3F003F3F3F2422231F06080C0C0C11173F3F3F3F3F003F3F2B212223
        221305170C0C0E11173F3F3F3F003F3521222323231E06090E0C0C0E12193F3F
        3F003F2B2223272726221304180E0C0C0E123F3F3F003F2926252A2F2F261F06
        08110E0C0E11173F3F0038302D232C39332E23150311110E0C0E11173F003F39
        2E28383F37312A220F0117110E0E0E1219003F3F373F3F3F3F3A30261E060917
        110E0E1117003F3F3F3F3F3F3F3F322E2315030C1712111217003F3F3F3F3F3F
        3F3F37342D2313001819171719003F3F3F3F3F3F3F3F3F3B342E231300193F3F
        3F003F3F3F3F3F3F3F3F3F3F3C3330230F011D3F3F003F3F3F3F3F3F3F3F3F3F
        3F393E31250F0D3F3F003F3F3F3F3F3F3F3F3F3F3F3F383D312320353F003F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3C2A23363F003F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F373F3F00}
      PaintStyle = psCaptionGlyph
      UnclickAfterDoing = False
      OnClick = cmGravarClick
    end
    object cmCancelar: TdxBarButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777778888887
        777770000000777885555558877770000000778555DDDD555877700000007D55
        DD7777555587700000007D5577777855558770000000D55877778555D5587000
        0000D5877778555D7D5870000000D587778555D77D5870000000D58778555D77
        7D5870000000D5878555D7777D5870000000D558555D7777D558700000007D55
        55D77777D587700000007D555877778555877000000077D55588885558777000
        0000777DD555555DD7777000000077777DDDDDD7777770000000777777777777
        777770000000}
      PaintStyle = psCaptionGlyph
      OnClick = cmCancelarClick
    end
    object cmAdicionar: TdxBarButton
      Caption = '&Adicionar'
      Category = 0
      Hint = 'Adicionar'
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
        07070707070707070707070707070707F7F7F7F7F70707070707070707070700
        00000000F70707070707070707070700FBFBFB00F70707070707070707070700
        FBFBFB00F70707070707070707070700FBFBFB00F7F7F7F7F707070000000000
        FBFBFB0000000000F7070700FBFBFBFBFBFBFBFBFBFBFB00F7070700FBFBFBFB
        FBFBFBFBFBFBFB00F7070700FBFBFBFBFBFBFBFBFBFBFB00F707070000000000
        FBFBFB00000000000707070707070700FBFBFB00070707070707070707070700
        FBFBFB00070707070707070707070700FBFBFB00070707070707070707070700
        0000000007070707070707070707070707070707070707070707}
      OnClick = cmAdicionarClick
    end
    object cmRemover: TdxBarButton
      Caption = '&Remover'
      Category = 0
      Hint = 'Remover'
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
      OnClick = cmRemoverClick
    end
    object cmUsuarios: TdxBarStatic
      Caption = 'Lista Geral de Usuários'
      Category = 0
      Hint = 'Lista Geral de Usuários'
      Visible = ivAlways
    end
    object cmUsuarios2: TdxBarStatic
      Caption = 'Usuários deste Grupo'
      Category = 0
      Hint = 'Usuários deste Grupo'
      Visible = ivAlways
    end
    object cmAddAcesso: TdxBarButton
      Caption = '&Adicionar'
      Category = 0
      Hint = 'Adicionar'
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
        07070707070707070707070707070707F7F7F7F7F70707070707070707070700
        00000000F70707070707070707070700FBFBFB00F70707070707070707070700
        FBFBFB00F70707070707070707070700FBFBFB00F7F7F7F7F707070000000000
        FBFBFB0000000000F7070700FBFBFBFBFBFBFBFBFBFBFB00F7070700FBFBFBFB
        FBFBFBFBFBFBFB00F7070700FBFBFBFBFBFBFBFBFBFBFB00F707070000000000
        FBFBFB00000000000707070707070700FBFBFB00070707070707070707070700
        FBFBFB00070707070707070707070700FBFBFB00070707070707070707070700
        0000000007070707070707070707070707070707070707070707}
      OnClick = cmAddAcessoClick
    end
    object cmRemoveAcesso: TdxBarButton
      Caption = '&Remover'
      Category = 0
      Hint = 'Remover'
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
      OnClick = cmRemoveAcessoClick
    end
    object cmAcessos1: TdxBarStatic
      Caption = 'Acessos permitidos aos usuários deste grupo'
      Category = 0
      Hint = 'Acessos permitidos aos usuários deste grupo'
      Visible = ivAlways
    end
    object cmAcesso2: TdxBarStatic
      Caption = 'Lista de módulos'
      Category = 0
      Hint = 'Lista de módulos'
      Visible = ivAlways
    end
    object cmEditarAcesso: TdxBarButton
      Caption = '&Editar permissões'
      Category = 0
      Hint = 'Editar permissões'
      Visible = ivAlways
      Glyph.Data = {
        56050000424D5605000000000000360400002800000010000000120000000100
        0800000000002001000000000000000000000001000000000000000000000000
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
        07070707070707070707070707F7F7F7F7F7F7F7F7F707070707070000000000
        0000000000F7070707070700FBFFFFFFFBFFFFFF00F7070707070700FF040404
        040404FF00F7070707070700FFFFFBFFFFFFFBFF00F7070707070700FF0000F7
        040404FF00F7070707070700FB00000000F7FFFF00F7070707070700FFF70000
        080000F700F7070707070700FFFF0008FFFF080000F7070707070700FF04F700
        FFFFFF080000070707070700FBFFFF0008FFFF08002D000707070700FF0404F7
        00080800FB042D0007070700FFFFFBFF000000FFFBFB042D0707070000000000
        0000FBFFFFFBFB042D07070707070707070700FBFFFFFBFB0407070707070707
        07070707FBFFFFFBFB0707070707070707070707070707070707}
      OnClick = cmEditarAcessoClick
    end
  end
  object dsUsuario: TDataSource
    DataSet = mtUsuario
    Left = 159
    Top = 104
  end
  object mtUsuario: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Username'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Admin'
        DataType = ftBoolean
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Grupos'
        DataType = ftMemo
      end
      item
        Name = 'Direitos'
        DataType = ftMemo
      end>
    Filtered = True
    IndexFieldNames = 'Username'
    IndexName = 'mtUsuariosIndex1'
    IndexDefs = <
      item
        Name = 'mtUsuariosIndex1'
        Fields = 'Username'
        Options = [ixPrimary, ixCaseInsensitive]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnFilterRecord = mtUsuarioFilterRecord
    Left = 127
    Top = 104
    object mtUsuarioUsername: TStringField
      FieldName = 'Username'
      Size = 10
    end
    object mtUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object mtGrupo: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 223
    Top = 109
    object mtGrupoNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object mtGrupoUsuarios: TMemoField
      FieldName = 'Usuarios'
      BlobType = ftMemo
    end
    object mtGrupoDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
  end
  object dsGrupo: TDataSource
    DataSet = mtGrupo
    Left = 271
    Top = 109
  end
  object mtDireito: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 343
    Top = 105
    object mtDireitoAcessos: TMemoField
      FieldName = 'Acessos'
      BlobType = ftMemo
      Size = 30
    end
    object mtDireitoModulo: TStringField
      FieldName = 'Modulo'
    end
    object mtDireitoPermissoes: TMemoField
      FieldName = 'Permissoes'
      BlobType = ftMemo
    end
  end
  object dsAcesso: TDataSource
    DataSet = mtDireito
    Left = 383
    Top = 105
  end
  object mtModulo: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <>
    Filtered = True
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnFilterRecord = mtModuloFilterRecord
    Left = 111
    Top = 269
    object mtModuloID: TIntegerField
      FieldName = 'ID'
    end
    object mtModuloNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object dsModulo: TDataSource
    DataSet = mtModulo
    Left = 151
    Top = 269
  end
end
