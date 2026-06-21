object FrmUsuario: TFrmUsuario
  Left = 185
  Top = 108
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Usuário'
  ClientHeight = 370
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 28
    Width = 473
    Height = 342
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object Paginas: TPageControl
      Left = 5
      Top = 5
      Width = 463
      Height = 332
      ActivePage = tsDados
      Align = alClient
      TabOrder = 0
      object tsDados: TTabSheet
        BorderWidth = 5
        Caption = '&Dados'
        object Insp: TdxDBInspector
          Left = 0
          Top = 0
          Width = 445
          Height = 294
          Align = alClient
          DataSource = dsUsuario
          DefaultFields = False
          TabOrder = 0
          DividerPos = 133
          Flat = True
          Options = [dioAutoWidth, dioBandSizing, dioCancelOnExit, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
          Data = {
            A30000000400000008000000000000000C000000496E7370557365726E616D65
            080000000000000008000000496E73704E6F6D65080000000000000009000000
            496E737041646D696E080000000200000008000000496E7370526F7739080000
            000000000009000000496E737053656E6861080000000000000011000000496E
            7370436F6E6669726D6153656E6861010000000800000018ED5B070800000049
            6E7370526F7739}
          object InspUsername: TdxInspectorDBMaskRow
            FieldName = 'Username'
          end
          object InspNome: TdxInspectorDBMaskRow
            FieldName = 'Nome'
          end
          object InspAdmin: TdxInspectorDBCheckRow
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            FieldName = 'Admin'
          end
          object InspSenha: TdxInspectorDBMaskRow
            PasswordChar = 'X'
            FieldName = 'Senha'
          end
          object InspConfirmaSenha: TdxInspectorDBMaskRow
            Caption = 'Confirmação'
            MaxLength = 10
            PasswordChar = 'X'
            FieldName = 'ConfirmaSenha'
          end
          object InspRow9: TdxInspectorComplexRow
            Caption = 'Senha'
            IsCategory = True
            Items = <>
          end
        end
      end
      object tsGrupo: TTabSheet
        BorderWidth = 5
        Caption = 'Membro de'
        ImageIndex = 1
        object LMDSplitterPanel1: TLMDSplitterPanel
          Left = 0
          Top = 0
          Width = 445
          Height = 294
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
            object LBGrupos: TListBox
              Left = 0
              Top = 26
              Width = 443
              Height = 99
              Align = alClient
              BorderStyle = bsNone
              ItemHeight = 13
              TabOrder = 0
            end
            object dxBarDockControl1: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 443
              Height = 26
              Align = dalTop
              BarManager = BarMgr
              SunkenBorder = False
              UseOwnSunkenBorder = True
            end
          end
          object LMDSplitterPane1: TLMDSplitterPane
            Bevel.Mode = bmStandard
            object gridGrupos: TdxDBGrid
              Left = 0
              Top = 26
              Width = 443
              Height = 129
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'Nome'
              SummaryGroups = <>
              SummarySeparator = ', '
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DataSource = dsGrupo
              Filter.Criteria = {00000000}
              LookAndFeel = lfFlat
              OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
              ShowGrid = False
              ShowHeader = False
              object gridGruposNome: TdxDBGridMaskColumn
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Nome'
              end
            end
            object dxBarDockControl2: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 443
              Height = 26
              Align = dalTop
              BarManager = BarMgr
              SunkenBorder = False
              UseOwnSunkenBorder = True
            end
          end
        end
      end
    end
  end
  object BarMgr: TdxBarManager
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
        Caption = 'Grupo 1'
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
            Item = dxBarStatic1
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmRemover
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'Grupo 1'
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
        Caption = 'Grupo 2'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 257
        FloatTop = 214
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmGrupo2
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAdicionar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'Grupo 2'
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
    SunkenBorder = True
    UseSystemFont = True
    Left = 296
    Top = 8
    DockControlHeights = (
      0
      0
      28
      0)
    object cmGravar: TdxBarButton
      Caption = '&Gravar'
      Category = 0
      Hint = 'Gravar'
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007F2B28007F2B2800A1828300A1828300A1828300A1828300A1828300A182
        8300A18283007A1C1C007F2B2800FF00FF00FF00FF00FF00FF00FF00FF007F2B
        2800CA4D4D00B6454500DDD4D5007916170079161700DCE0E000D7DADE00CED5
        D700BDBABD0076100F009A2D2D007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800C24A4B00B1444400E2D9D9007916170079161700D9D8DA00D9DEE100D3D9
        DC00C1BDC10076111100982D2D007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800C24A4A00B0424200E6DCDC007916170079161700D5D3D500D8DEE100D7DD
        E000C6C2C500700F0F00962C2C007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800C24A4A00B0414100EADEDE00E7DDDD00DDD4D500D7D3D500D5D7D900D7D8
        DA00CAC2C5007E1717009E3131007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800BF474800B8454500BA4C4C00BD575700BB575600B64E4E00B4494900BD52
        5100BB4B4C00B5424200BF4A4A007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800A33B3900B1605D00C6868400CB918F00CC919000CC908F00CB898800C989
        8800CB939100CC969600BD4B4C007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800BD4B4C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
        F700F7F7F700F7F7F700BD4B4C007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800BD4B4C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
        F700F7F7F700F7F7F700BD4B4C007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800BD4B4C00F7F7F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00F7F7F700BD4B4C007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800BD4B4C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
        F700F7F7F700F7F7F700BD4B4C007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800BD4B4C00F7F7F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00F7F7F700BD4B4C007F2B2800FF00FF00FF00FF00FF00FF007F2B
        2800BD4B4C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
        F700F7F7F700F7F7F700BD4B4C007F2B2800FF00FF00FF00FF00FF00FF00FF00
        FF007F2B2800F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
        F700F7F7F700F7F7F7007F2B2800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      PaintStyle = psCaptionGlyph
      OnClick = cmGravarClick
    end
    object cmCancelar: TdxBarButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000005B7000005B700FF00FF000005
        B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000005B7000005B700FF00FF00FF00FF000005
        B7000005B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000005B7000005B700FF00FF00FF00FF00FF00FF000005
        B7000005B6000005B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000005B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000006D7000005BA000005B7000005B700FF00FF00FF00FF00FF00FF00FF00
        FF000005B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000005B7000005B7000005B600FF00FF000005B6000005
        B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000005B6000006C7000006C7000006CE000005
        B400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000006C1000005C1000006DA00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000005B6000006D7000006CE000006DA000006
        E900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000006E5000006DA000006D300FF00FF00FF00FF000006
        E5000006EF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000006F8000006DA000006EF00FF00FF00FF00FF00FF00FF00FF00
        FF000006F8000006F600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000006F6000006F6000006F800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000006F6000006F600FF00FF00FF00FF00FF00FF00FF00FF000006
        F6000006F6000006F600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000006F600FF00FF00FF00FF000006F6000006
        F6000006F600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000006F6000006
        F600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      PaintStyle = psCaptionGlyph
      OnClick = cmCancelarClick
    end
    object dxBarStatic1: TdxBarStatic
      Caption = 'Membro de'
      Category = 0
      Hint = 'Membro de'
      Visible = ivAlways
    end
    object cmGrupo2: TdxBarStatic
      Caption = 'Lista Geral Grupos'
      Category = 0
      Hint = 'Lista Geral Grupos'
      Visible = ivAlways
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
    Left = 56
    Top = 136
    object mtUsuarioUsername: TStringField
      FieldName = 'Username'
      Required = True
      Size = 10
    end
    object mtUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object mtUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object mtUsuarioSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object mtUsuarioConfirmaSenha: TStringField
      FieldName = 'ConfirmaSenha'
    end
    object mtUsuarioGrupos: TMemoField
      FieldName = 'Grupos'
      BlobType = ftMemo
    end
    object mtUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
    object mtUsuarioNumClientes: TIntegerField
      FieldName = 'NumClientes'
    end
  end
  object dsUsuario: TDataSource
    DataSet = mtUsuario
    Left = 96
    Top = 136
  end
  object mtGrupo: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Usuarios'
        DataType = ftMemo
      end
      item
        Name = 'Direitos'
        DataType = ftMemo
      end>
    Filtered = True
    IndexFieldNames = 'Nome'
    IndexName = 'mtGrupoIndex1'
    IndexDefs = <
      item
        Name = 'mtGrupoIndex1'
        Fields = 'Nome'
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
    OnFilterRecord = mtGrupoFilterRecord
    Left = 263
    Top = 99
    object mtGrupoNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object dsGrupo: TDataSource
    DataSet = mtGrupo
    Left = 303
    Top = 100
  end
end
