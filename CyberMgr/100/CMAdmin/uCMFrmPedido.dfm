object FrmPedido: TFrmPedido
  Left = 82
  Top = 112
  Width = 545
  Height = 420
  BorderWidth = 5
  Caption = 'Manutenção de Pedidos'
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pc: TPageControl
    Left = 0
    Top = 135
    Width = 527
    Height = 248
    ActivePage = tsPedido
    Align = alClient
    TabOrder = 0
    OnChange = PcChange
    object tsPedido: TTabSheet
      BorderWidth = 5
      Caption = '&Pedido'
      object panTotais: TLMDSimplePanel
        Left = 0
        Top = 149
        Width = 509
        Height = 61
        UseDockManager = False
        Align = alBottom
        Bevel.BorderInnerWidth = 2
        Bevel.Mode = bmEdge
        Bevel.StandardStyle = lsLowered
        TabOrder = 1
        object InspTotais: TdxDBInspector
          Left = 308
          Top = 4
          Width = 197
          Height = 53
          Align = alRight
          DataSource = dsPed
          DefaultFields = False
          TabOrder = 0
          OnEnter = InspTotaisEnter
          OnExit = InspTotaisExit
          OnKeyDown = InspTotaisKeyDown
          BandWidth = 249
          DividerPos = 79
          Flat = True
          Options = [dioAutoWidth, dioBandSizing, dioCancelOnExit, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
          PaintStyle = ipsExtended
          Data = {
            5B0000000300000008000000000000000F000000496E7370546F74616973546F
            74616C080000000000000012000000496E7370546F74616973446573636F6E74
            6F08000000000000000E000000496E7370546F74616973526F773300000000}
          object InspTotaisTotal: TdxInspectorDBCurrencyRow
            Caption = 'Sub-Total'
            ReadOnly = True
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
          Width = 299
          Height = 53
          UseDockManager = False
          Align = alClient
          Bevel.Mode = bmStandard
          TabOrder = 1
          object LMDLabel1: TLMDLabel
            Left = 1
            Top = 1
            Width = 32
            Height = 51
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
            Width = 265
            Height = 51
            Align = alClient
            BorderStyle = bsNone
            DataField = 'Obs'
            DataSource = dsPed
            TabOrder = 0
            OnEnter = edObsEnter
            OnExit = edObsExit
          end
        end
        object LMDSimplePanel5: TLMDSimplePanel
          Left = 303
          Top = 4
          Width = 5
          Height = 53
          UseDockManager = False
          Align = alRight
          Bevel.Mode = bmCustom
          TabOrder = 2
        end
      end
      object gLinPed: TdxDBGrid
        Left = 0
        Top = 0
        Width = 509
        Height = 146
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
        OnEnter = gLinPedEnter
        OnExit = gLinPedExit
        OnKeyDown = gLinPedKeyDown
        OnMouseDown = gLinPedMouseDown
        DataSource = dsItens
        Filter.Criteria = {00000000}
        LookAndFeel = lfFlat
        OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoEnterThrough, edgoHorzThrough, edgoImmediateEditor]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanNavigation, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        OnChangeNodeEx = gLinPedChangeNodeEx
        OnCustomDrawCell = gLinPedCustomDrawCell
        object gLinPedItem: TdxDBGridMaskColumn
          Alignment = taCenter
          HeaderAlignment = taCenter
          ReadOnly = True
          Sizing = False
          TabStop = False
          Width = 34
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Item'
          OnGetText = gLinPedItemGetText
        end
        object gLinPedProduto: TdxDBGridMaskColumn
          Caption = 'Código'
          Width = 98
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Produto'
        end
        object gLinPedNomePro: TdxDBGridLookupColumn
          Width = 135
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NomePro'
        end
        object gLinPedQtde: TdxDBGridMaskColumn
          Width = 70
          BandIndex = 0
          RowIndex = 0
          OnChange = gLinPedQtdeChange
          FieldName = 'Qtde'
        end
        object gLinPedValor: TdxDBGridCurrencyColumn
          Width = 75
          BandIndex = 0
          RowIndex = 0
          OnChange = gLinPedValorChange
          FieldName = 'Valor'
          Nullable = False
        end
        object gLinPedTotal: TdxDBGridMaskColumn
          TabStop = False
          Width = 69
          BandIndex = 0
          RowIndex = 0
          OnChange = gLinPedTotalChange
          FieldName = 'Total'
        end
      end
      object LMDSimplePanel4: TLMDSimplePanel
        Left = 0
        Top = 146
        Width = 509
        Height = 3
        UseDockManager = False
        Align = alBottom
        Bevel.Mode = bmCustom
        TabOrder = 2
      end
    end
    object tsEntrega: TTabSheet
      BorderWidth = 5
      Caption = '&Entrega'
      ImageIndex = 1
      object InspEntrega: TdxDBInspector
        Left = 0
        Top = 0
        Width = 509
        Height = 210
        Align = alClient
        DataSource = dsPed
        DefaultFields = False
        TabOrder = 0
        OnEnter = InspTotaisEnter
        OnExit = InspTotaisExit
        DividerPos = 67
        Flat = True
        Options = [dioAutoWidth, dioBandSizing, dioCancelOnExit, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
        Data = {
          7B00000004000000080000000000000011000000496E7370456E747265676145
          6E64456E74080000000000000011000000496E7370456E747265676142616945
          6E74080000000000000010000000496E7370456E74726567615546456E740800
          00000000000011000000496E7370456E7472656761436964456E7400000000}
        object InspEntregaEndEnt: TdxInspectorDBMaskRow
          Caption = 'Endereço'
          FieldName = 'EndEnt'
        end
        object InspEntregaBaiEnt: TdxInspectorDBMaskRow
          Caption = 'Bairro'
          FieldName = 'BaiEnt'
        end
        object InspEntregaCidEnt: TdxInspectorDBMaskRow
          Caption = 'Cidade'
          FieldName = 'CidEnt'
        end
        object InspEntregaUFEnt: TdxInspectorDBMaskRow
          Caption = 'UF'
          FieldName = 'UFEnt'
        end
      end
    end
  end
  object LMDSimplePanel7: TLMDSimplePanel
    Left = 0
    Top = 54
    Width = 527
    Height = 76
    UseDockManager = False
    Align = alTop
    Bevel.BorderInnerWidth = 3
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 1
    object InspCab: TdxDBInspector
      Left = 3
      Top = 3
      Width = 304
      Height = 70
      Align = alClient
      DataSource = dsPed
      DefaultFields = False
      TabOrder = 0
      OnEnter = InspTotaisEnter
      OnExit = InspTotaisExit
      OnKeyDown = InspCabKeyDown
      BandWidth = 251
      DividerPos = 72
      Flat = True
      Options = [dioBandSizing, dioCancelOnExit, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
      PaintStyle = ipsExtended
      Data = {
        720000000400000008000000000000000E000000496E73704361624E6F6D6543
        6C6908000000000000000E000000496E7370436162446961486F726108000000
        000000000E000000496E73704361625573756172696F08000000000000001000
        0000496E73704361624E6F6D65456E74726500000000}
      object InspCabUsuario: TdxInspectorDBMaskRow
        ReadOnly = True
        FieldName = 'Usuario'
      end
      object InspCabNomeCli: TdxInspectorLookupRow
        MaxLength = 40
        OnDrawValue = InspCabNomeCliDrawValue
        FieldName = 'NomeCli'
      end
      object InspCabNomeEntre: TdxInspectorLookupRow
        MaxLength = 40
        ReadOnly = True
        FieldName = 'NomeEntre'
      end
      object InspCabDiaHora: TdxInspectorDBMaskRow
        Caption = 'Data'
        ReadOnly = True
        FieldName = 'DiaHora'
      end
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 307
      Top = 3
      Width = 5
      Height = 70
      UseDockManager = False
      Align = alRight
      Bevel.Mode = bmCustom
      TabOrder = 2
    end
    object InspCab2: TdxDBInspector
      Left = 312
      Top = 3
      Width = 212
      Height = 70
      Align = alRight
      DataSource = dsPed
      DefaultFields = False
      TabOrder = 1
      OnEnter = InspTotaisEnter
      OnExit = InspTotaisExit
      OnKeyDown = InspCab2KeyDown
      BandWidth = 251
      DividerPos = 99
      Flat = True
      Options = [dioBandSizing, dioCancelOnExit, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough]
      PaintStyle = ipsExtended
      Data = {
        7700000004000000080000000000000010000000496E73704361623250656E64
        656E746508000000000000000D000000496E7370436162325361696461080000
        000000000010000000496E737043616232456E74726567617208000000000000
        0012000000496E737043616232466F726D61506167746F00000000}
      object InspCab2Pendente: TdxInspectorDBCheckRow
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        FieldName = 'Pendente'
      end
      object InspCab2Saida: TdxInspectorDBDateRow
        Caption = 'Saída'
        ReadOnly = True
        FieldName = 'HoraSaida'
      end
      object InspCab2Entregar: TdxInspectorDBCheckRow
        Caption = 'Entregar'
        OnChange = InspCab2EntregarChange
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        FieldName = 'Entrega'
      end
      object InspCab2FormaPagto: TdxInspectorDBPickRow
        Caption = 'Forma de Pagto.'
        Items.Strings = (
          'Dinheiro'
          'Cartão'
          'Cheque'
          'Pendura')
        FieldName = 'FormaPagto'
      end
    end
  end
  object LMDSimplePanel8: TLMDSimplePanel
    Left = 0
    Top = 22
    Width = 527
    Height = 5
    UseDockManager = False
    Align = alTop
    Bevel.BorderSides = [fsTop]
    Bevel.Mode = bmEdge
    TabOrder = 2
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 130
    Width = 527
    Height = 5
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 5
  end
  object LMDSimplePanel6: TLMDSimplePanel
    Left = 0
    Top = 27
    Width = 527
    Height = 27
    UseDockManager = False
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 8
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
      Left = 30
      Top = 0
      Width = 113
      Height = 21
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
    object edSerie: TOvcDbSimpleField
      Left = 184
      Top = 0
      Width = 31
      Height = 21
      Cursor = crIBeam
      DataSource = dsPed
      FieldType = ftUnknown
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
      Left = 267
      Top = 0
      Width = 71
      Height = 21
      Cursor = crIBeam
      FieldType = ftUnknown
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
      Options = []
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
    Font.Name = 'Tahoma'
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
            Item = cmChamada
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
    object cmChamada: TdxBarButton
      Caption = 'C&hamada'
      Category = 0
      Hint = 'Chamada'
      Visible = ivAlways
      Glyph.Data = {
        0E030000424D0E030000000000003600000028000000120000000D0000000100
        180000000000D802000000000000000000000000000000000000BFBFBFBFBFBF
        BFBFBF0000000000000000000000000000000000000000000000000000000000
        00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF000000FFFFFF00FF
        FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF000000000000BFBFBFBF
        BFBFBFBFBFBFBFBF0000BFBFBFBFBFBF00000000FFFFFFFFFF00FFFFFFFFFF00
        FFFFFFFFFF00FFFFFFFFFF00FFFF000000007F7F000000BFBFBFBFBFBFBFBFBF
        0000BFBFBFBFBFBF0000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F000000007F7F007F7F000000BFBFBFBFBFBF0000BFBFBFBFBFBF
        00000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000
        00007F7F007F7F000000BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBF00000000FF
        FFFFFFFFFF0000FFFFFFFF0000FFFFFFFF0000FFFFFF00FFFF000000007F7F00
        0000BFBFBFBFBFBF0000BFBFBFBFBFBF00000000000000000000FFFFFFFFFFFF
        0000FFFFFFFF0000FFFFFF00FFFFFFFFFF000000000000000000BFBFBFBFBFBF
        0000BFBFBF00000000FFFFFFFFFF00FFFF00000000FFFFFFFFFF00FFFFFFFFFF
        00FFFFFFFFFF000000FFFFFF00FFFFFFFFFF000000BFBFBF0000BFBFBF000000
        FFFFFF00FFFFFFFFFF0000000000000000000000000000000000000000000000
        0000FFFFFFFFFF00FFFF000000BFBFBF0000BFBFBFBFBFBF000000FFFFFF00FF
        FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF00
        0000BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBF00000000000000FFFFFFFFFF00
        FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF000000000000BFBFBFBFBFBFBFBFBF
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000000000000000000000
        000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000}
      PaintStyle = psCaptionGlyph
      ShortCut = 16456
      OnClick = cmChamadaClick
    end
  end
  object mtItens: TkbmMemTable
    AttachedAutoRefresh = True
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
        Name = 'NomePro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Qtde'
        DataType = ftFloat
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end
      item
        Name = 'unidade'
        DataType = ftString
        Size = 20
      end>
    EnableIndexes = True
    AutoReposition = False
    IndexDefs = <>
    RecalcOnIndex = False
    RecalcOnFetch = True
    SortFields = 'Item'
    SortOptions = []
    AllDataOptions = [mtfSaveData, mtfSaveNonVisible, mtfSaveBlobs, mtfSaveFiltered, mtfSaveIgnoreRange, mtfSaveIgnoreMasterDetail, mtfSaveDeltas]
    StoreDataOnForm = False
    CommaTextOptions = [mtfSaveData]
    CSVQuote = '"'
    CSVFieldDelimiter = ','
    CSVRecordDelimiter = ','
    PersistentSaveOptions = [mtfSaveData, mtfSaveNonVisible, mtfSaveIgnoreRange, mtfSaveIgnoreMasterDetail]
    PersistentSaveFormat = mtsfBinary
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadLimit = -1
    EnableJournal = False
    EnableVersioning = False
    VersioningMode = mtvm1SinceCheckPoint
    FilterOptions = []
    Version = '2.49'
    AfterInsert = mtItensAfterInsert
    AfterDelete = mtItensAfterDelete
    Left = 100
    Top = 192
    object mtItensItem: TWordField
      FieldName = 'Item'
    end
    object mtItensProduto: TStringField
      FieldName = 'Produto'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Codigo'
      KeyFields = 'Produto'
      OnValidate = mtItensProdutoValidate
    end
    object mtItensQtde: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'Qtde'
      OnChange = mtItensQtdeChange
    end
    object mtItensValor: TCurrencyField
      DisplayLabel = 'Valor Unitário'
      FieldName = 'Valor'
      OnChange = mtItensValorChange
    end
    object mtItensTotal: TFloatField
      FieldName = 'Total'
      currency = True
    end
    object mtItensunidade: TStringField
      FieldKind = fkLookup
      FieldName = 'unidade'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Unid'
      KeyFields = 'Produto'
      Lookup = True
    end
    object mtItensNomePro: TStringField
      DisplayLabel = 'Descrição'
      FieldKind = fkLookup
      FieldName = 'NomePro'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Produto'
      Size = 40
      Lookup = True
    end
  end
  object dsItens: TDataSource
    DataSet = mtItens
    Left = 140
    Top = 192
  end
  object dsPed: TDataSource
    DataSet = tbME
    Left = 312
    Top = 192
  end
  object tbME: TffTable
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
        Name = 'Entrega'
        DataType = ftBoolean
      end
      item
        Name = 'Entregador'
        DataType = ftWord
      end
      item
        Name = 'Pendente'
        DataType = ftBoolean
      end
      item
        Name = 'Cancelado'
        DataType = ftDateTime
      end
      item
        Name = 'HoraSaida'
        DataType = ftDateTime
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
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexName = 'Sequential Access Index'
    SessionName = 'SesPad'
    TableName = 'MovimentoEstoque'
    Timeout = 10000
    AfterInsert = tbMEAfterInsert
    OnCalcFields = tbMECalcFields
    Left = 208
    Top = 192
    object tbMENumero: TAutoIncField
      FieldName = 'Numero'
      DisplayFormat = '000000'
    end
    object tbMEDiaHora: TDateTimeField
      FieldName = 'DiaHora'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object tbMEChamada: TIntegerField
      FieldName = 'Chamada'
    end
    object tbMECliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tbMEUsuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'Usuario'
      Size = 10
    end
    object tbMEEntregador: TWordField
      FieldName = 'Entregador'
    end
    object tbMEPendente: TBooleanField
      FieldName = 'Pendente'
    end
    object tbMECancelado: TDateTimeField
      FieldName = 'Cancelado'
    end
    object tbMEHoraSaida: TDateTimeField
      DisplayLabel = 'Hora da Saida'
      FieldName = 'HoraSaida'
    end
    object tbMEFormaPagto: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FormaPagto'
      Size = 15
    end
    object tbMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbMEObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbMEData: TDateField
      FieldKind = fkCalculated
      FieldName = 'Data'
      Calculated = True
    end
    object tbMEHora: TTimeField
      FieldKind = fkCalculated
      FieldName = 'Hora'
      Calculated = True
    end
    object tbMENomeCli: TStringField
      DisplayLabel = 'Contato'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'NomeCli'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'mostrar'
      KeyFields = 'Cliente'
      Size = 40
      Lookup = True
    end
    object tbMENomeEntre: TStringField
      DisplayLabel = 'Entregador'
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'NomeEntre'
      LookupDataSet = Dados.tbEntre
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Entregador'
      Size = 40
      Lookup = True
    end
    object tbMEEntrega: TBooleanField
      FieldName = 'Entrega'
    end
    object tbMEEPendente: TStringField
      FieldKind = fkCalculated
      FieldName = 'EPendente'
      Calculated = True
    end
    object tbMEEndEnt: TStringField
      FieldName = 'EndEnt'
      Size = 50
    end
    object tbMEBaiEnt: TStringField
      FieldName = 'BaiEnt'
      Size = 25
    end
    object tbMECidEnt: TStringField
      FieldName = 'CidEnt'
      Size = 25
    end
    object tbMEUFEnt: TStringField
      FieldName = 'UFEnt'
      Size = 2
    end
    object tbMETotalFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object tbMEEnderecoCompleto: TStringField
      FieldKind = fkCalculated
      FieldName = 'EnderecoCompleto'
      Size = 150
      Calculated = True
    end
  end
  object tbItensME: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Produto'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Qtde'
        DataType = ftFloat
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Item'
        DataType = ftWord
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'Pedido'
    MasterFields = 'Numero'
    MasterSource = dsPed
    SessionName = 'SesPad'
    TableName = 'LinhaPed'
    Timeout = 10000
    Left = 256
    Top = 192
    object tbItensMEPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object tbItensMEProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object tbItensMEQtde: TFloatField
      FieldName = 'Qtde'
    end
    object tbItensMEValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tbItensMEItem: TWordField
      FieldName = 'Item'
    end
    object tbItensMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbItensMENomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeProduto'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Produto'
      Size = 40
      Lookup = True
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 377
    Top = 177
  end
  object dbpPed: TppDBPipeline
    DataSource = dsPed
    UserName = 'dbpPed'
    Left = 457
    Top = 161
  end
  object dbpItens: TppDBPipeline
    DataSource = dstbItens
    UserName = 'dbpItens'
    Left = 385
    Top = 225
    MasterDataPipelineName = 'dbpPed'
    object ppDBPipeline2ppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'Numero'
      DetailFieldName = 'Pedido'
      DetailSortOrder = soAscending
    end
  end
  object dstbItens: TDataSource
    DataSet = tbItensME
    Left = 249
    Top = 241
  end
  object repPedido: TppReport
    AutoStop = False
    DataPipeline = dbpItens
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    Left = 457
    Top = 217
    Version = '6.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbpItens'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'PEDIDO Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 29369
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 15000804
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
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4318
        mmLeft = 1165
        mmTop = 10054
        mmWidth = 11938
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'NomeCli'
        DataPipeline = dbpPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbpPed'
        mmHeight = 4318
        mmLeft = 15346
        mmTop = 10054
        mmWidth = 23961
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
        mmHeight = 4318
        mmLeft = 162454
        mmTop = 10054
        mmWidth = 33782
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
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
        mmHeight = 5821
        mmLeft = 29633
        mmTop = 0
        mmWidth = 21167
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
        mmHeight = 4318
        mmLeft = 15346
        mmTop = 14552
        mmWidth = 8297
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'HoraSaida'
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
        mmHeight = 4318
        mmLeft = 162539
        mmTop = 14552
        mmWidth = 33782
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
        DataField = 'Qtde'
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
        DataField = 'Valor'
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
          Brush.Color = 15000804
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
          mmHeight = 4318
          mmLeft = 152665
          mmTop = 22225
          mmWidth = 10245
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
        object myDBCheckBox1: TmyDBCheckBox
          UserName = 'DBCheckBox1'
          BooleanFalse = 'False'
          BooleanTrue = 'True'
          DataPipeline = dbpPed
          DataField = 'Entrega'
          Transparent = True
          DataPipelineName = 'dbpPed'
          mmHeight = 6350
          mmLeft = 265
          mmTop = 30427
          mmWidth = 6350
          BandType = 7
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Entregar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3302
          mmLeft = 5556
          mmTop = 31750
          mmWidth = 10414
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
    object daDataModule1: TdaDataModule
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        444254657874374F6E466F726D61740B50726F6772616D54797065070B747450
        726F63656475726506536F75726365062970726F636564757265204442546578
        74374F6E466F726D61743B0D0A626567696E0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D65060744425465787437094576656E744E616D6506084F6E46
        6F726D6174074576656E74494402FF0000}
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
    EntryOptions = [efoAutoSelect, efoBeepOnError, efoInsertPushes]
    Epoch = 2000
    Left = 160
    Top = 88
  end
end
