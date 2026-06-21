object FrmME: TFrmME
  Left = 214
  Top = 136
  Width = 593
  Height = 466
  BorderWidth = 5
  Caption = 'Movimentação de Estoque'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pc: TPageControl
    Left = 0
    Top = 118
    Width = 575
    Height = 311
    ActivePage = tsItens
    Align = alClient
    TabOrder = 2
    object tsItens: TTabSheet
      BorderWidth = 5
      Caption = 'I&tens'
      object panTotais: TLMDSimplePanel
        Left = 0
        Top = 198
        Width = 557
        Height = 75
        UseDockManager = False
        Align = alBottom
        Bevel.BorderInnerWidth = 2
        Bevel.Mode = bmEdge
        Bevel.StandardStyle = lsLowered
        TabOrder = 1
        object InspTotais: TdxDBInspector
          Left = 356
          Top = 4
          Width = 197
          Height = 67
          Align = alRight
          DataSource = dsME
          DefaultFields = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnEnter = InspTotaisEnter
          OnExit = InspTotaisExit
          OnKeyDown = InspTotaisKeyDown
          BandWidth = 249
          DividerPos = 79
          Flat = True
          GridColor = clBtnShadow
          Options = [dioAutoWidth, dioBandSizing, dioCancelOnExit, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
          PaintStyle = ipsCategorized
          RowHeight = 21
          Data = {
            5B0000000300000008000000000000000F000000496E7370546F74616973546F
            74616C080000000000000012000000496E7370546F74616973446573636F6E74
            6F08000000000000000E000000496E7370546F74616973526F773300000000}
          object InspTotaisTotal: TdxInspectorDBCurrencyRow
            Caption = 'Sub-Total'
            ReadOnly = True
            UseThousandSeparator = True
            FieldName = 'Total'
          end
          object InspTotaisDesconto: TdxInspectorDBCurrencyRow
            OnDrawValue = InspTotaisDescontoDrawValue
            UseThousandSeparator = True
            FieldName = 'Desconto'
          end
          object InspTotaisRow3: TdxInspectorDBCurrencyRow
            Caption = 'Total Final'
            ReadOnly = True
            OnDrawCaption = InspTotaisRow3DrawCaption
            OnDrawValue = InspTotaisRow3DrawValue
            UseThousandSeparator = True
            FieldName = 'TotalFinal'
          end
        end
        object LMDSimplePanel1: TLMDSimplePanel
          Left = 4
          Top = 4
          Width = 347
          Height = 67
          UseDockManager = False
          Align = alClient
          Bevel.Mode = bmStandard
          TabOrder = 1
          object LMDLabel1: TLMDLabel
            Left = 1
            Top = 1
            Width = 32
            Height = 65
            Bevel.BorderSides = [fsRight]
            Bevel.Mode = bmEdge
            Align = alLeft
            AutoSize = False
            FocusControl = edObs
            Options = []
            Caption = ' &Obs'
          end
          object edObs: TDBMemo
            Left = 33
            Top = 1
            Width = 313
            Height = 65
            Align = alClient
            BorderStyle = bsNone
            DataField = 'Obs'
            DataSource = dsME
            TabOrder = 0
            OnEnter = edObsEnter
            OnExit = edObsExit
          end
        end
        object LMDSimplePanel5: TLMDSimplePanel
          Left = 351
          Top = 4
          Width = 5
          Height = 67
          UseDockManager = False
          Align = alRight
          Bevel.Mode = bmCustom
          TabOrder = 2
        end
      end
      object gridItens: TdxDBGrid
        Left = 0
        Top = 0
        Width = 557
        Height = 195
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'Item'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        OnEnter = gridItensEnter
        OnExit = gridItensExit
        OnKeyDown = gridItensKeyDown
        OnMouseDown = gridItensMouseDown
        DataSource = dsItens
        Filter.Criteria = {00000000}
        LookAndFeel = lfFlat
        OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoEnterThrough, edgoHorzThrough, edgoImmediateEditor]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanNavigation, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        OnChangeNodeEx = gridItensChangeNodeEx
        object gridItensProduto: TdxDBGridColumn
          Caption = 'Código'
          Width = 102
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Produto'
        end
        object gridItensNomePro: TdxDBGridLookupColumn
          Caption = 'Produto'
          Width = 140
          BandIndex = 0
          RowIndex = 0
          OnValidate = gridItensNomeProValidate
          FieldName = 'NomeProduto'
        end
        object gridItensEstoque: TdxDBGridMaskColumn
          Caption = 'Estoque Atual'
          HeaderAlignment = taCenter
          ReadOnly = True
          TabStop = False
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'EstoqueAtual'
        end
        object gridItensQuant: TdxDBGridMaskColumn
          Width = 72
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Quant'
        end
        object gridItensValor: TdxDBGridCurrencyColumn
          Width = 77
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Unitario'
          Nullable = False
        end
        object gridItensTotal: TdxDBGridMaskColumn
          TabStop = False
          Width = 68
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Total'
        end
      end
      object LMDSimplePanel4: TLMDSimplePanel
        Left = 0
        Top = 195
        Width = 557
        Height = 3
        UseDockManager = False
        Align = alBottom
        Bevel.Mode = bmCustom
        TabOrder = 2
      end
    end
  end
  object panCab2: TLMDSimplePanel
    Left = 0
    Top = 54
    Width = 575
    Height = 59
    UseDockManager = False
    Align = alTop
    Bevel.BorderInnerWidth = 3
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 1
    object InspCab: TdxDBInspector
      Left = 3
      Top = 3
      Width = 569
      Height = 53
      Align = alClient
      DataSource = dsME
      DefaultFields = False
      TabOrder = 0
      OnEnter = InspTotaisEnter
      OnExit = InspTotaisExit
      OnKeyDown = InspCabKeyDown
      BandWidth = 251
      DividerPos = 122
      Flat = True
      Options = [dioBandSizing, dioCancelOnExit, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
      PaintStyle = ipsExtended
      Data = {
        560000000300000008000000000000000E000000496E73704361624E6F6D6543
        6C6908000000000000000E000000496E7370436162446961486F726108000000
        000000000E000000496E73704361625573756172696F00000000}
      object InspCabUsuario: TdxInspectorDBMaskRow
        ReadOnly = True
        FieldName = 'Usuario'
      end
      object InspCabNomeCli: TdxInspectorLookupRow
        Caption = 'Cliente'
        MaxLength = 40
        OnDrawValue = InspCabNomeCliDrawValue
        FieldName = 'NomeContato'
      end
      object InspCabDiaHora: TdxInspectorDBMaskRow
        Caption = 'Data'
        ReadOnly = True
        FieldName = 'DiaHora'
      end
    end
  end
  object LMDSimplePanel8: TLMDSimplePanel
    Left = 0
    Top = 22
    Width = 575
    Height = 5
    UseDockManager = False
    Align = alTop
    Bevel.BorderSides = [fsTop]
    Bevel.Mode = bmEdge
    TabOrder = 3
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 113
    Width = 575
    Height = 5
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 4
  end
  object panCab: TLMDSimplePanel
    Left = 0
    Top = 27
    Width = 575
    Height = 27
    UseDockManager = False
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 4
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object Label2: TLabel
      Left = 154
      Top = 4
      Width = 24
      Height = 13
      Caption = 'Série'
    end
    object Label3: TLabel
      Left = 225
      Top = 4
      Width = 37
      Height = 13
      Caption = 'Número'
    end
    object cbTipo: TDBComboBox
      Left = 28
      Top = 0
      Width = 115
      Height = 21
      TabStop = False
      Style = csDropDownList
      DataField = 'Tipo'
      DataSource = dsME
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnChange = cbTipoChange
      OnEnter = cbTipoEnter
      OnExit = cbTipoExit
    end
    object edSerie: TOvcDbSimpleField
      Left = 182
      Top = 0
      Width = 31
      Height = 21
      Cursor = crIBeam
      DataField = 'Serie'
      DataSource = dsME
      FieldType = ftString
      UseTFieldMask = False
      ZeroAsNull = False
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
      ControlCharColor = clRed
      Controller = OvcController1
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      LabelInfo.Visible = False
      MaxLength = 2
      ParentFont = False
      PictureMask = '!'
      TabOrder = 1
    end
    object edNumero: TOvcDbNumericField
      Left = 265
      Top = 0
      Width = 71
      Height = 21
      Cursor = crIBeam
      DataField = 'Numero'
      DataSource = dsME
      FieldType = ftInteger
      UseTFieldMask = False
      ZeroAsNull = False
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
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      LabelInfo.Visible = False
      ParentFont = False
      PictureMask = 'iiiiiiiiiii'
      TabOrder = 2
      RangeHigh = {FFFFFF7F000000000000}
      RangeLow = {00000080000000000000}
    end
  end
  object BarMgr: TdxBarManager
    AllowReset = False
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
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
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
            Item = cmImprimir
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmConfirma
            Visible = True
          end>
        MultiLine = True
        Name = 'Controles'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRecentItems = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 40
    Top = 192
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
    object cmImprimir: TdxBarButton
      Caption = '&Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Visible = ivAlways
      ShortCut = 16457
      OnClick = cmImprimirClick
    end
    object cmConfirma: TdxBarButton
      Caption = 'Confirmar Entrada'
      Category = 0
      Hint = 'Confirmar Entrada'
      Visible = ivNever
      OnClick = cmConfirmaClick
    end
  end
  object mtItens: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Item'
        DataType = ftWord
      end
      item
        Name = 'Produto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unitario'
        DataType = ftCurrency
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NomeProduto'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    SortFields = 'Item'
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    AfterInsert = mtItensAfterInsert
    BeforeDelete = mtItensBeforeDelete
    AfterDelete = mtItensAfterDelete
    OnCalcFields = mtItensCalcFields
    Left = 100
    Top = 200
    object mtItensItem: TWordField
      FieldName = 'Item'
    end
    object mtItensQuant: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'Quant'
    end
    object mtItensUnitario: TCurrencyField
      DisplayLabel = 'Valor Unitário'
      FieldName = 'Unitario'
    end
    object mtItensunidade: TStringField
      FieldKind = fkLookup
      FieldName = 'Unidade'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Unid'
      KeyFields = 'Produto'
      Lookup = True
    end
    object mtItensNomePro: TStringField
      DisplayLabel = 'Descrição'
      FieldKind = fkLookup
      FieldName = 'NomeProduto'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Produto'
      Size = 40
      Lookup = True
    end
    object mtItensTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
    object mtItensProduto: TStringField
      FieldName = 'Produto'
      OnChange = mtItensProdutoChange
      OnValidate = mtItensProdutoValidate
      Size = 15
    end
    object mtItensEstoqueAtual: TFloatField
      FieldKind = fkLookup
      FieldName = 'EstoqueAtual'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'EstoqueAtual'
      KeyFields = 'Produto'
      Lookup = True
    end
  end
  object dsItens: TDataSource
    DataSet = mtItens
    Left = 140
    Top = 192
  end
  object dsME: TDataSource
    DataSet = tME
    Left = 312
    Top = 192
  end
  object tME: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Serie'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Numero'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'DiaHora'
        DataType = ftDateTime
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Entrada'
        DataType = ftBoolean
      end
      item
        Name = 'MovEst'
        DataType = ftBoolean
      end
      item
        Name = 'Chamada'
        DataType = ftInteger
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Entregar'
        DataType = ftBoolean
      end
      item
        Name = 'Entregador'
        DataType = ftWord
      end
      item
        Name = 'Cancelado'
        DataType = ftBoolean
      end
      item
        Name = 'FormaPagto'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'EndEnt'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BaiEnt'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CidEnt'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'UFEnt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Emissor'
        DataType = ftInteger
      end
      item
        Name = 'DtMovimentacao'
        DataType = ftDateTime
      end
      item
        Name = 'Situacao'
        DataType = ftString
        Size = 20
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IChamada'
        Fields = 'Chamada'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IEmissorSerieNum'
        Fields = 'Emissor;Serie;Numero'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'IEmissao'
        Fields = 'DiaHora'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IContatoSerieNum'
        Fields = 'Contato;Serie;Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IMov'
        Fields = 'DtMovimentacao;DiaHora'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IEmissorSerieNum'
    SessionName = 'SesPad'
    TableName = 'ME'
    Timeout = 10000
    AfterInsert = tMEAfterInsert
    AfterEdit = tMEAfterEdit
    OnCalcFields = tMECalcFields
    Left = 208
    Top = 192
    object tMEDiaHora: TDateTimeField
      FieldName = 'DiaHora'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object tMEChamada: TIntegerField
      FieldName = 'Chamada'
    end
    object tMEUsuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'Usuario'
      Size = 10
    end
    object tMEEntregador: TWordField
      FieldName = 'Entregador'
    end
    object tMEFormaPagto: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FormaPagto'
      Size = 15
    end
    object tMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMEObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tMEData: TDateField
      FieldKind = fkCalculated
      FieldName = 'Data'
      Calculated = True
    end
    object tMEHora: TTimeField
      FieldKind = fkCalculated
      FieldName = 'Hora'
      Calculated = True
    end
    object tMENomeCli: TStringField
      DisplayLabel = 'Contato'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'NomeContato'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Contato'
      Size = 40
      Lookup = True
    end
    object tMETotalFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object tMESerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object tMETipo: TStringField
      FieldName = 'Tipo'
      Size = 15
    end
    object tMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMEMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object tMEContato: TIntegerField
      FieldName = 'Contato'
    end
    object tMEDtMovimentacao: TDateTimeField
      FieldName = 'DtMovimentacao'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object tMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMEEmissor: TIntegerField
      FieldName = 'Emissor'
    end
    object tMENumero: TIntegerField
      FieldName = 'Numero'
      Required = True
    end
    object tMESituacao: TStringField
      DisplayLabel = 'Situação'
      FieldName = 'Situacao'
    end
    object tMECaixa: TIntegerField
      FieldName = 'Caixa'
    end
  end
  object tItensME: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'NumSeq'
        DataType = ftAutoInc
      end
      item
        Name = 'Emissor'
        DataType = ftInteger
      end
      item
        Name = 'Serie'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Produto'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unitario'
        DataType = ftCurrency
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end
      item
        Name = 'Item'
        DataType = ftWord
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'Data'
        DataType = ftDateTime
      end
      item
        Name = 'MovEst'
        DataType = ftBoolean
      end
      item
        Name = 'Entrada'
        DataType = ftBoolean
      end
      item
        Name = 'Cancelado'
        DataType = ftBoolean
      end
      item
        Name = 'EstoqueAnt'
        DataType = ftFloat
      end
      item
        Name = 'TipoMov'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'Emissor;Serie;Numero'
    MasterFields = 'Emissor;Serie;Numero'
    MasterSource = dsME
    SessionName = 'SesPad'
    TableName = 'ItensME'
    Timeout = 10000
    OnCalcFields = tItensMECalcFields
    Left = 256
    Top = 192
    object tItensMEProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object tItensMEItem: TWordField
      FieldName = 'Item'
    end
    object tItensMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tItensMENomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeProduto'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Produto'
      Size = 40
      Lookup = True
    end
    object tItensMEEmissor: TIntegerField
      FieldName = 'Emissor'
    end
    object tItensMESerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object tItensMENumero: TIntegerField
      FieldName = 'Numero'
    end
    object tItensMEQuant: TFloatField
      FieldName = 'Quant'
    end
    object tItensMEUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tItensMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tItensMEData: TDateTimeField
      FieldName = 'Data'
    end
    object tItensMEMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object tItensMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tItensMEEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tItensMETipoMov: TStringField
      FieldName = 'TipoMov'
      Size = 15
    end
    object tItensMEContato: TIntegerField
      FieldName = 'Contato'
    end
    object tItensMENumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tItensMEFatorSaldo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FatorSaldo'
      Calculated = True
    end
    object tItensMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tItensMESaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Saldo'
      Calculated = True
    end
    object tItensMECaixa: TIntegerField
      FieldName = 'Caixa'
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    Left = 377
    Top = 177
  end
  object dbpPed: TppDBPipeline
    DataSource = dsME
    UserName = 'dbpPed'
    Left = 449
    Top = 145
  end
  object dbpItens: TppDBPipeline
    DataSource = dstbItens
    UserName = 'dbpItens'
    Left = 385
    Top = 225
    MasterDataPipelineName = 'dbpPed'
    object dbpItensppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'Emissor'
      DetailFieldName = 'Emissor'
      DetailSortOrder = soAscending
    end
    object dbpItensppMasterFieldLink2: TppMasterFieldLink
      MasterFieldName = 'Serie'
      DetailFieldName = 'Serie'
      DetailSortOrder = soAscending
    end
    object dbpItensppMasterFieldLink3: TppMasterFieldLink
      MasterFieldName = 'Numero'
      DetailFieldName = 'Numero'
      DetailSortOrder = soAscending
    end
  end
  object dstbItens: TDataSource
    DataSet = tItensME
    Left = 249
    Top = 241
  end
  object repImpressao: TppReport
    AutoStop = False
    DataPipeline = dbpItens
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\TeleManager\Pedido.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    Left = 313
    Top = 249
    Version = '6.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbpItens'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Style = bsClear
        ParentWidth = True
        Pen.Color = clGray
        StretchWithParent = True
        mmHeight = 11642
        mmLeft = 0
        mmTop = 8467
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Contato:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1165
        mmTop = 10054
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'NomeContato'
        DataPipeline = dbpPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpPed'
        mmHeight = 4233
        mmLeft = 15346
        mmTop = 10054
        mmWidth = 20638
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'DiaHora'
        DataPipeline = dbpPed
        DisplayFormat = 'dd/mm/yyyy hh:mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbpPed'
        mmHeight = 4233
        mmLeft = 164221
        mmTop = 10054
        mmWidth = 32015
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'Numero'
        DataPipeline = dbpPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpPed'
        mmHeight = 6085
        mmLeft = 46567
        mmTop = 529
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 152665
        mmTop = 10054
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Saída:'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 152665
        mmTop = 14552
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Usuário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4318
        mmLeft = 1058
        mmTop = 14552
        mmWidth = 13123
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Position = lpBottom
        Weight = 1.5
        mmHeight = 2117
        mmLeft = 0
        mmTop = 28839
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4318
        mmLeft = 1323
        mmTop = 25929
        mmWidth = 7366
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4318
        mmLeft = 12700
        mmTop = 25929
        mmWidth = 10753
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4318
        mmLeft = 45508
        mmTop = 25929
        mmWidth = 14986
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4318
        mmLeft = 113771
        mmTop = 25929
        mmWidth = 17949
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Valor Unitário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4318
        mmLeft = 144473
        mmTop = 25929
        mmWidth = 21421
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4318
        mmLeft = 188119
        mmTop = 25929
        mmWidth = 7959
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'Usuario'
        DataPipeline = dbpPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpPed'
        mmHeight = 4233
        mmLeft = 15346
        mmTop = 14552
        mmWidth = 7408
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'DtMovimentacao'
        DataPipeline = dbpPed
        DisplayFormat = 'dd/mm/yyyy hh:mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbpPed'
        mmHeight = 4233
        mmLeft = 164307
        mmTop = 14552
        mmWidth = 32015
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'Tipo'
        DataPipeline = dbpPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpPed'
        mmHeight = 6085
        mmLeft = 794
        mmTop = 529
        mmWidth = 27781
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'Serie'
        DataPipeline = dbpPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpPed'
        mmHeight = 6085
        mmLeft = 37571
        mmTop = 529
        mmWidth = 7673
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clGray
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NomeProduto'
        DataPipeline = dbpItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpItens'
        mmHeight = 4233
        mmLeft = 45508
        mmTop = 1323
        mmWidth = 66940
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'Produto'
        DataPipeline = dbpItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpItens'
        mmHeight = 4233
        mmLeft = 12435
        mmTop = 1323
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'Item'
        DataPipeline = dbpItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbpItens'
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 7938
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'Quant'
        DataPipeline = dbpItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbpItens'
        mmHeight = 4233
        mmLeft = 113771
        mmTop = 1323
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'Unitario'
        DataPipeline = dbpItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbpItens'
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 1323
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'Total'
        DataPipeline = dbpItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbpItens'
        mmHeight = 4233
        mmLeft = 167217
        mmTop = 1323
        mmWidth = 28840
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Color = clGray
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6879
        mmLeft = 10848
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Color = clGray
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6879
        mmLeft = 43921
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Color = clGray
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6879
        mmLeft = 112448
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Pen.Color = clGray
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6879
        mmLeft = 132292
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Pen.Color = clGray
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6879
        mmLeft = 166952
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 54240
      mmPrintPosition = 0
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Caption = 'Region1'
        Pen.Style = psClear
        mmHeight = 27781
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          ParentHeight = True
          Pen.Color = clGray
          mmHeight = 27781
          mmLeft = 0
          mmTop = 0
          mmWidth = 132557
          BandType = 7
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Style = bsClear
          ParentHeight = True
          Pen.Color = clGray
          mmHeight = 27781
          mmLeft = 132292
          mmTop = 0
          mmWidth = 65088
          BandType = 7
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Pago com:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Tahoma'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4318
          mmLeft = 135732
          mmTop = 22225
          mmWidth = 16595
          BandType = 7
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          AutoSize = True
          DataField = 'FormaPagto'
          DataPipeline = dbpPed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Tahoma'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'dbpPed'
          mmHeight = 4233
          mmLeft = 152665
          mmTop = 22225
          mmWidth = 18256
          BandType = 7
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Total-Final ='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Tahoma'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4318
          mmLeft = 143404
          mmTop = 14552
          mmWidth = 23114
          BandType = 7
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          Color = clWindow
          DataField = 'TotalFinal'
          DataPipeline = dbpPed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Tahoma'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbpPed'
          mmHeight = 4318
          mmLeft = 166952
          mmTop = 14552
          mmWidth = 29104
          BandType = 7
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Color = clGray
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 140494
          mmTop = 13494
          mmWidth = 55563
          BandType = 7
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          Color = clWindow
          DataField = 'Desconto'
          DataPipeline = dbpPed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Tahoma'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbpPed'
          mmHeight = 4318
          mmLeft = 166952
          mmTop = 8202
          mmWidth = 29104
          BandType = 7
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Desconto ='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Tahoma'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4318
          mmLeft = 146050
          mmTop = 8202
          mmWidth = 20574
          BandType = 7
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Sub-Total ='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Tahoma'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4318
          mmLeft = 145257
          mmTop = 2911
          mmWidth = 21336
          BandType = 7
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'Total'
          DataPipeline = dbpPed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbpPed'
          mmHeight = 4318
          mmLeft = 166952
          mmTop = 2911
          mmWidth = 29104
          BandType = 7
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 7
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Observações:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 1588
          mmTop = 1323
          mmWidth = 18796
          BandType = 7
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'Obs'
          DataPipeline = dbpPed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'dbpPed'
          mmHeight = 21696
          mmLeft = 1588
          mmTop = 5292
          mmWidth = 129911
          BandType = 7
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        Caption = 'Region2'
        ParentWidth = True
        Pen.Color = clGray
        mmHeight = 11377
        mmLeft = 0
        mmTop = 30692
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Entregar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 5821
          mmTop = 32015
          mmWidth = 10319
          BandType = 7
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          AutoSize = True
          DataField = 'EnderecoCompleto'
          DataPipeline = dbpPed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'MS Sans Serif'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'dbpPed'
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 36513
          mmWidth = 29369
          BandType = 7
        end
      end
    end
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
    EntryOptions = [efoAutoAdvanceChar, efoAutoAdvanceLeftRight, efoAutoAdvanceUpDown, efoAutoSelect, efoBeepOnError, efoInsertPushes]
    Epoch = 2000
    Left = 160
    Top = 88
  end
end
