object FrmCliente: TFrmCliente
  Left = 257
  Top = 171
  Width = 549
  Height = 411
  BorderWidth = 5
  Caption = 'Dados do Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000911111111000000000000000
    0000011098080808100000000000000000001000999999991000000000000000
    0000100009808089000000000000000000001000109999901000000000000000
    0000701110000000111000000000000000000099901111109990000000000000
    0000000999999999990000000000000000000001000000000100000000000000
    0000000000000000000000000000000000000000000000000000000000000088
    888888888888888C88888888000008FFFFFFFFFFFFFFFFCCCFFFFFFF800008FF
    FFFFFFFFFFFFFCCCC7FFFFFF800008FFFFFFFFFFFFFFCCCCCCFFFFFF800008FF
    FFFFFFFFFF8CCC7CCCCFFFFF8000080000000000FCCCCCFFCCCCFFFF80000807
    73BFB770F7CCCFFFFCCCCFFF800008073F797370FFCC7FFFFFCCCCFF80000803
    3BB3FB70FFFCFFFFFFFCCCC780000803BFB3BB70FFFFFFFFFFFFCCCC70000801
    FBFBFB30F70F0F0008F0FCCCCC000803B34B4310F70FFF08F08FFF7CCCC00801
    3FBFBF30F70FFF08F07FFFF7CCCC08031BFB1310F70FFF08F07FFFFF8CCC0803
    31313170F70FFF08F07FFFFF807C080733131770F70FFF08F08FFFFF80000800
    00000000F70FFF0008FFFFFF8000008888888888888888888888888800000000
    0000000000000000000000000000FFFFFFFFFFE003FFFFE003FFFF8003FFFF60
    03FFFF7007FFFF0000FFFF0000FFFF8000FFFFC001FFFFE003FFFFFFFFFFC000
    000F800000070000000300000003000000030000000300000003000000030000
    0003000000030000000300000003000000010000000000000000000000000000
    00030000000380000007C000000F280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    9111111110000110980808081000100099999999100010000980808900001000
    1099999010007011100000001110009990111110999000099999999999000001
    0000000001000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000E0030000E00300008003
    00006003000070070000000000000000000080000000C0010000E0030000FFFF
    0000FA3F0000FADF0000FADF0000FADF0000FA3F0000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TPageControl
    Left = 0
    Top = 33
    Width = 531
    Height = 341
    ActivePage = tsNome
    Align = alClient
    TabOrder = 0
    object tsNome: TTabSheet
      BorderWidth = 5
      Caption = '&Nome'
      object LMDSimplePanel1: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 513
        Height = 40
        UseDockManager = False
        Align = alTop
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmEdge
        TabOrder = 0
        object Image1: TImage
          Left = 2
          Top = 2
          Width = 32
          Height = 36
          Align = alLeft
          AutoSize = True
          Picture.Data = {
            07544269746D617076020000424D760200000000000076000000280000002000
            0000200000000100040000000000000200000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00666666666666666666666666666666666666666666666666666666666666
            6666666666666666666666666666666666666666660000000000000000066666
            66666666664CCCCCCCCCCCCCCC06666666666666664CCCCCCCCCCCCCCC066666
            666666666664CCCCCCCCCCCCC06666666666666666664CCCC000000006666666
            66666666666664000F8F8F80666666666666666666666000F8F8F88066666666
            66666666666660008F800000066666666666666666666000F808F8F8F0666666
            66666666666600008F8F8F8F8F066666666666666666000008F8F8F8F8066666
            66666666666000000F8F8F8F8F066666666666666600000008F8F8F8F8066666
            6666666666000000008F8F8F8F0006666666666666000000F8F8F8F8F8F8F066
            66666666660000008F8F8F8F8F8F80666666666666000000F8F8F8F844F00666
            66666666660000000F8F8F8F44006666666666666600000000F8F8F8F8066666
            6666666666000000000F8F8F8F00666666666666666000000000F8F8F8000666
            6666666666660000000000000000066666666666666600000000000000000666
            6666666666666000000000000000666666666666666666000000000000666666
            6666666666666666000000006666666666666666666666666666666666666666
            6666666666666666666666666666666666666666666666666666666666666666
            6666}
          Transparent = True
        end
        object Label1: TLabel
          Left = 48
          Top = 11
          Width = 261
          Height = 13
          Caption = 'Tempo acumulado anteirior ao Cyber Manager:    Horas'
        end
        object Label2: TLabel
          Left = 357
          Top = 12
          Width = 17
          Height = 13
          Caption = 'Min'
        end
        object edHoras: TOvcPictureField
          Left = 313
          Top = 8
          Width = 37
          Height = 21
          Cursor = crIBeam
          DataType = pftWord
          CaretIns.BitmapHotSpotX = 0
          CaretIns.BitmapHotSpotY = 0
          CaretIns.Shape = csVertLine
          CaretIns.Align = caLeft
          CaretIns.BlinkTime = 0
          CaretIns.CaretHeight = 10
          CaretIns.CaretWidth = 2
          CaretIns.IsGray = False
          CaretOvr.BitmapHotSpotX = 0
          CaretOvr.BitmapHotSpotY = 0
          CaretOvr.Shape = csBlock
          CaretOvr.Align = caLeft
          CaretOvr.BlinkTime = 0
          CaretOvr.CaretHeight = 10
          CaretOvr.CaretWidth = 2
          CaretOvr.IsGray = False
          Controller = OvcController1
          ControlCharColor = clRed
          Borders.BottomBorder.BorderStyle = bpsSolid
          Borders.BottomBorder.Enabled = False
          Borders.BottomBorder.PenColor = clBlack
          Borders.BottomBorder.PenStyle = psSolid
          Borders.BottomBorder.PenWidth = 2
          Borders.LeftBorder.BorderStyle = bpsSolid
          Borders.LeftBorder.Enabled = False
          Borders.LeftBorder.PenColor = clBlack
          Borders.LeftBorder.PenStyle = psSolid
          Borders.LeftBorder.PenWidth = 2
          Borders.RightBorder.BorderStyle = bpsSolid
          Borders.RightBorder.Enabled = False
          Borders.RightBorder.PenColor = clBlack
          Borders.RightBorder.PenStyle = psSolid
          Borders.RightBorder.PenWidth = 2
          Borders.TopBorder.BorderStyle = bpsSolid
          Borders.TopBorder.Enabled = False
          Borders.TopBorder.PenColor = clBlack
          Borders.TopBorder.PenStyle = psSolid
          Borders.TopBorder.PenWidth = 2
          DecimalPlaces = 0
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          Epoch = 0
          InitDateTime = False
          LabelInfo.Visible = False
          MaxLength = 5
          Options = [efoArrowIncDec, efoCaretToEnd]
          PictureMask = '99999'
          TabOrder = 0
          RangeHigh = {FFFF0000000000000000}
          RangeLow = {00000000000000000000}
        end
        object edMin: TOvcPictureField
          Left = 379
          Top = 8
          Width = 37
          Height = 21
          Cursor = crIBeam
          DataType = pftByte
          CaretIns.BitmapHotSpotX = 0
          CaretIns.BitmapHotSpotY = 0
          CaretIns.Shape = csVertLine
          CaretIns.Align = caLeft
          CaretIns.BlinkTime = 0
          CaretIns.CaretHeight = 10
          CaretIns.CaretWidth = 2
          CaretIns.IsGray = False
          CaretOvr.BitmapHotSpotX = 0
          CaretOvr.BitmapHotSpotY = 0
          CaretOvr.Shape = csBlock
          CaretOvr.Align = caLeft
          CaretOvr.BlinkTime = 0
          CaretOvr.CaretHeight = 10
          CaretOvr.CaretWidth = 2
          CaretOvr.IsGray = False
          Controller = OvcController1
          ControlCharColor = clRed
          Borders.BottomBorder.BorderStyle = bpsSolid
          Borders.BottomBorder.Enabled = False
          Borders.BottomBorder.PenColor = clBlack
          Borders.BottomBorder.PenStyle = psSolid
          Borders.BottomBorder.PenWidth = 2
          Borders.LeftBorder.BorderStyle = bpsSolid
          Borders.LeftBorder.Enabled = False
          Borders.LeftBorder.PenColor = clBlack
          Borders.LeftBorder.PenStyle = psSolid
          Borders.LeftBorder.PenWidth = 2
          Borders.RightBorder.BorderStyle = bpsSolid
          Borders.RightBorder.Enabled = False
          Borders.RightBorder.PenColor = clBlack
          Borders.RightBorder.PenStyle = psSolid
          Borders.RightBorder.PenWidth = 2
          Borders.TopBorder.BorderStyle = bpsSolid
          Borders.TopBorder.Enabled = False
          Borders.TopBorder.PenColor = clBlack
          Borders.TopBorder.PenStyle = psSolid
          Borders.TopBorder.PenWidth = 2
          DecimalPlaces = 0
          EFColors.Disabled.BackColor = clWindow
          EFColors.Disabled.TextColor = clGrayText
          EFColors.Error.BackColor = clRed
          EFColors.Error.TextColor = clBlack
          EFColors.Highlight.BackColor = clHighlight
          EFColors.Highlight.TextColor = clHighlightText
          Epoch = 0
          InitDateTime = False
          LabelInfo.Visible = False
          MaxLength = 2
          Options = [efoCaretToEnd]
          PictureMask = '99'
          TabOrder = 1
          RangeHigh = {3B000000000000000000}
          RangeLow = {00000000000000000000}
        end
      end
      object LMDSimplePanel9: TLMDSimplePanel
        Left = 0
        Top = 40
        Width = 513
        Height = 5
        UseDockManager = False
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 1
      end
      object InspNome: TdxDBInspector
        Left = 0
        Top = 45
        Width = 513
        Height = 258
        Align = alClient
        DataSource = dsCli
        DefaultFields = False
        TabOrder = 2
        DividerPos = 91
        Flat = True
        Options = [dioAutoWidth, dioBandSizing, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
        PaintStyle = ipsExtended
        Data = {
          360100000C00000008000000000000000C000000496E73704E6F6D654E6F6D65
          080000000000000010000000496E73704E6F6D65557365726E616D6508000000
          0000000010000000496E73704E6F6D654E69636B6E616D650800000000000000
          0D000000496E73704E6F6D6553656E686108000000000000000E000000496E73
          704E6F6D654973656E746F080000000000000010000000496E73704E6F6D6554
          656C65666F6E6508000000000000000B000000496E73704E6F6D6543656C0800
          0000000000000C000000496E73704E6F6D65526F773808000000000000000C00
          0000496E73704E6F6D654E61736308000000000000000C000000496E73704E6F
          6D65526F773708000000000000000B000000496E73704E6F6D654F6273080000
          00000000000D000000496E73704E6F6D65526F77313000000000}
        object InspNomeNome: TdxInspectorDBMaskRow
          FieldName = 'Nome'
        end
        object InspNomeObs: TdxInspectorDBMemoRow
          RowHeight = 50
          FieldName = 'Obs'
        end
        object InspNomeUsername: TdxInspectorDBRow
          FieldName = 'Username'
        end
        object InspNomeSenha: TdxInspectorDBRow
          PasswordChar = 'X'
          FieldName = 'Senha'
        end
        object InspNomeTelefone: TdxInspectorDBRow
          FieldName = 'Telefone'
        end
        object InspNomeRow7: TdxInspectorDBMemoRow
          Caption = 'E-mails'
          RowHeight = 50
          FieldName = 'email'
        end
        object InspNomeIsento: TdxInspectorDBPickRow
          DropDownListStyle = True
          Items.Strings = (
            'Sim'
            'Não')
          FieldName = 'Isento'
        end
        object InspNomeRow8: TdxInspectorDBRow
          FieldName = 'Rg'
        end
        object InspNomeNickname: TdxInspectorDBRow
          FieldName = 'NickName'
        end
        object InspNomeRow10: TdxInspectorDBRow
        end
        object InspNomeNasc: TdxInspectorDBDateRow
          Caption = 'Data Nasc.'
          FieldName = 'DataNasc'
        end
        object InspNomeCel: TdxInspectorDBRow
          FieldName = 'Celular'
        end
      end
    end
    object tsResidencia: TTabSheet
      BorderWidth = 5
      Caption = '&Endereço'
      ImageIndex = 1
      object LMDSimplePanel2: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 513
        Height = 40
        UseDockManager = False
        Align = alTop
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmEdge
        TabOrder = 0
        object Image2: TImage
          Left = 2
          Top = 2
          Width = 32
          Height = 36
          Align = alLeft
          AutoSize = True
          Picture.Data = {
            07544269746D617096020000424D960200000000000076000000280000002000
            0000220000000100040000000000200200000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00666666666666666666666666666666666666666666600066666666000666
            6666666666667700800077777008000777886666666000088800000000888000
            7778666666011100800111111008001107776666660B11100011111111000111
            0077666666099999999999999999999910766600000011111111111111111111
            1106660FFFF00999990EF7FEFEFE09999116660FFFFF00000000E7EFEFE77000
            0066660FFFFFF0FFF0FF0000000070666666660FFFFFF0FFB0FF099999990066
            6666660FFFFFF0FFB0FFF000000070666666660FFFFFF0FFB0FFFFFF78878066
            6666660FFFFFF00000FFFFFF788870666666660FFFFFFFFFFFFFFFFF78878066
            6666660F700007FFF700007F788870666666660F70BB07FFF70BB07F78878066
            6666660F70BB07FFF70BB07F788870666666660F700B07FFF700B07F78877066
            6666660F700007FFF700007F7887706666666607777777777777777778777066
            6666600000000000000000000007706666666088888887777788888807700066
            666666088888000007888880777770666666666088880BBB0788880778777706
            66666666088807BB088880777778706666666666008880008888077777770666
            6666666607088808888077877770666666666666077088888807777777066666
            6666666607700888808777877066666666666666000060880777777706666666
            6666666666666600000000006666666666666666666666666666666666666666
            6666}
          Transparent = True
        end
        object Label22: TLabel
          Left = 64
          Top = 12
          Width = 282
          Height = 13
          Caption = 'Entre com as informações sobre a residência deste contato.'
        end
      end
      object InspRes: TdxDBInspector
        Left = 0
        Top = 45
        Width = 513
        Height = 258
        Align = alClient
        DataSource = dsCli
        DefaultFields = False
        TabOrder = 1
        DividerPos = 87
        Flat = True
        Options = [dioAutoWidth, dioBandSizing, dioCancelOnExit, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
        PaintStyle = ipsExtended
        Data = {
          AE0000000700000008000000000000000F000000496E7370526573456E646572
          65636F08000000000000000D000000496E737052657342616972726F08000000
          0000000009000000496E7370526573554608000000000000000D000000496E73
          7052657343696461646508000000000000000A000000496E7370526573434550
          08000000000000000B000000496E7370526573526F773608000000000000000B
          000000496E7370526573526F773700000000}
        object InspResBairro: TdxInspectorDBMaskRow
          FieldName = 'Bairro'
        end
        object InspResCEP: TdxInspectorDBMaskRow
          FieldName = 'CEP'
        end
        object InspResEndereco: TdxInspectorDBMaskRow
          FieldName = 'Endereco'
        end
        object InspResUF: TdxInspectorDBPickRow
          CharCase = ecUpperCase
          DropDownListStyle = True
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          PopupBorder = pbFlat
          FieldName = 'UF'
        end
        object InspResCidade: TdxInspectorDBRow
          CharCase = ecUpperCase
          FieldName = 'Cidade'
        end
        object InspResRow6: TdxInspectorDBRow
          FieldName = 'Escola'
        end
        object InspResRow7: TdxInspectorDBCurrencyRow
          FieldName = 'Debito'
        end
      end
      object LMDSimplePanel8: TLMDSimplePanel
        Left = 0
        Top = 40
        Width = 513
        Height = 5
        UseDockManager = False
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 2
      end
    end
    object tsPedidos: TTabSheet
      BorderWidth = 5
      Caption = 'Pedidos'
      ImageIndex = 6
      object fdPedidos: TLMDFormDisplay
        Left = 0
        Top = 0
        Width = 513
        Height = 303
        Align = alClient
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 0
      end
    end
    object tsAcessos: TTabSheet
      BorderWidth = 5
      Caption = 'Acessos'
      ImageIndex = 8
      object fdAcessos: TLMDFormDisplay
        Left = 0
        Top = 0
        Width = 513
        Height = 303
        Align = alClient
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 0
      end
    end
  end
  object LMDSimplePanel5: TLMDSimplePanel
    Left = 0
    Top = 28
    Width = 531
    Height = 5
    UseDockManager = False
    Align = alTop
    Bevel.BorderSides = [fsTop]
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 1
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
        IsMainMenu = True
        ItemLinks = <
          item
            Item = cmGravar
            Visible = True
          end
          item
            Item = cmCancelar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmHistorico
            Visible = True
          end>
        MultiLine = True
        Name = 'Controles'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
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
        BorderStyle = bbsNone
        Caption = 'Tel'
        DockedDockingStyle = dsRight
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsRight
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <>
        Name = 'Tel'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = False
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 144
    Top = 296
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
      ShortCut = 16455
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
      ShortCut = 16451
      OnClick = cmCancelarClick
    end
    object cmHistorico: TdxBarButton
      Caption = 'Ver &Histórico'
      Category = 0
      Hint = 'Ver Histórico'
      Visible = ivNever
      UnclickAfterDoing = False
      OnClick = cmHistoricoClick
    end
  end
  object tCli: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftAutoInc
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nasc'
        DataType = ftDateTime
      end
      item
        Name = 'Sexo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Cpf'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Rg'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Email'
        DataType = ftMemo
      end
      item
        Name = 'CreditoM'
        DataType = ftInteger
      end
      item
        Name = 'TempoTotal'
        DataType = ftInteger
      end
      item
        Name = 'TempoInicial'
        DataType = ftInteger
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UltVisita'
        DataType = ftDateTime
      end
      item
        Name = 'Debito'
        DataType = ftCurrency
      end
      item
        Name = 'Escola'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NickName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DataNasc'
        DataType = ftDateTime
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 15
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexName = 'ICodigo'
    SessionName = 'SesPad'
    TableName = 'Contato'
    Timeout = 10000
    AfterInsert = tCliAfterInsert
    AfterEdit = tCliAfterEdit
    BeforePost = tCliBeforePost
    Left = 320
    Top = 224
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tCliNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object tCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tCliemail: TMemoField
      FieldName = 'email'
      BlobType = ftMemo
    end
    object tCliCreditoM: TIntegerField
      FieldName = 'CreditoM'
    end
    object tCliIsento: TBooleanField
      FieldName = 'Isento'
      DisplayValues = 'Sim;Não'
    end
    object tCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object tCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tCliTempoTotal: TIntegerField
      FieldName = 'TempoTotal'
    end
    object tCliTempoInicial: TIntegerField
      FieldName = 'TempoInicial'
    end
    object tCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
  end
  object dsCli: TDataSource
    DataSet = tCli
    Left = 352
    Top = 224
  end
  object GridLayouts: TdxDBGridLayoutList
    Left = 201
    Top = 296
    object layoutCidade: TdxDBGridLayout
      Data = {
        DE020000545046301054647844424772696457726170706572000542616E6473
        0E0100000D44656661756C744C61796F7574091348656164657250616E656C52
        6F77436F756E740201084B65794669656C6406064369646164650D53756D6D61
        727947726F7570730E001053756D6D617279536570617261746F7206022C200A
        44617461536F75726365070E4461646F732E64734369646164650F46696C7465
        722E43726974657269610A04000000000000000B4C6F6F6B416E644665656C07
        066C66466C61740F4F7074696F6E734265686176696F720B0E6564676F417574
        6F5365617263680C6564676F4175746F536F72740E6564676F44726167536372
        6F6C6C0B6564676F45646974696E67136564676F456E74657253686F77456469
        746F72136564676F496D6D656469617465456469746F720E6564676F54616254
        68726F7567680F6564676F566572745468726F75676800094F7074696F6E7344
        420B106564676F43616E63656C4F6E45786974116564676F43616E4E61766967
        6174696F6E116564676F436F6E6669726D44656C657465106564676F55736542
        6F6F6B6D61726B73000B4F7074696F6E73566965770B0D6564676F4175746F57
        69647468136564676F42616E6448656164657257696474680D6564676F496E64
        696361746F720D6564676F526F7753656C6563740D6564676F5573654269746D
        61700000135464784442477269644D61736B436F6C756D6E0643696461646505
        576964746803F4000942616E64496E646578020008526F77496E646578020009
        4669656C644E616D6506064369646164650000135464784442477269644D6173
        6B436F6C756D6E02554605576964746802160942616E64496E64657802000852
        6F77496E6465780200094669656C644E616D6506025546000013546478444247
        7269644D61736B436F6C756D6E03444444055769647468021E0942616E64496E
        646578020008526F77496E6465780200094669656C644E616D65060344444400
        0000}
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 201
    Top = 184
  end
  object OvcController1: TOvcController
    EntryCommands.TableList = (
      'Default'
      True
      ()
      'WordStar'
      False
      ()
      'Grid'
      False
      ())
    EntryOptions = [efoAutoSelect, efoBeepOnError, efoInsertPushes]
    Epoch = 2000
  end
  object tAux: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftAutoInc
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nasc'
        DataType = ftDateTime
      end
      item
        Name = 'Sexo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Cpf'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Rg'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Email'
        DataType = ftMemo
      end
      item
        Name = 'CreditoM'
        DataType = ftInteger
      end
      item
        Name = 'TempoTotal'
        DataType = ftInteger
      end
      item
        Name = 'TempoInicial'
        DataType = ftInteger
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UltVisita'
        DataType = ftDateTime
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'ICodigo'
        Fields = 'Codigo'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'INome'
        Fields = 'Nome'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IUsername'
        Fields = 'Username'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IRg'
        Fields = 'Rg'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IRg'
    SessionName = 'SesPad'
    TableName = 'Contato'
    Timeout = 10000
    BeforePost = tCliBeforePost
    Left = 232
    Top = 224
  end
end
