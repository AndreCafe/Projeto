object FrmAcesso: TFrmAcesso
  Left = 383
  Top = 197
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Acesso'
  ClientHeight = 372
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bdcAcesso: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 462
    Height = 44
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object panDiv1: TLMDSimplePanel
    Left = 0
    Top = 44
    Width = 462
    Height = 7
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 5
    object LMDLabel1: TLMDLabel
      Left = 288
      Top = 8
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
  end
  object PagPri: TdxPageControl
    Left = 0
    Top = 51
    Width = 462
    Height = 321
    ActivePage = tsPagNormal
    Align = alClient
    HideButtons = True
    HotTrack = False
    MultiLine = False
    OwnerDraw = False
    RaggedRight = False
    ScrollOpposite = False
    TabHeight = 0
    TabOrder = 6
    TabPosition = dxtpTop
    TabStop = True
    TabWidth = 0
    object tsPagNormal: TdxTabSheet
      Caption = 'tsPagNormal'
      object panDiv2: TLMDSimplePanel
        Left = 0
        Top = 70
        Width = 462
        Height = 7
        UseDockManager = False
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 0
        object lbNumM: TLMDLabel
          Left = 288
          Top = 8
          Width = 39
          Height = 26
          Bevel.Mode = bmCustom
          FontFX.Style = tdSunken
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentFont = False
          Visible = False
          Caption = '115'
        end
      end
      object InspCab: TdxDBInspector
        Left = 0
        Top = 0
        Width = 462
        Height = 70
        Align = alTop
        DataSource = dsTab
        DefaultFields = False
        TabOrder = 1
        DividerPos = 120
        Flat = True
        Options = [dioBandSizing, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough, dioNoCancel, dioTabs, dioTabThrough]
        PaintStyle = ipsExtended
        Data = {
          5E0000000400000008000000000000000E000000496E73705469706F41636573
          736F08000000000000000A000000496E73704176756C736F0800000000000000
          07000000496E7370436164080000000000000007000000496E73704F62730000
          0000}
        object InspTipoAcesso: TdxInspectorLookupRow
          Caption = 'Tipo de Acesso'
          FieldName = 'NomeTipoAcesso'
        end
        object InspCad: TdxInspectorLookupRow
          Caption = 'Cliente Cadastrado'
          OnEditButtonClick = InspCadEditButtonClick
          ImmediateDropDown = True
          FieldName = 'NomeContato'
          CanDeleteText = True
        end
        object InspAvulso: TdxInspectorDBRow
          Caption = 'Cliente Avulso'
          FieldName = 'Nome'
        end
        object InspObs: TdxInspectorDBMemoRow
          Caption = 'Observação'
          WantReturns = False
          FieldName = 'Obs'
        end
      end
      object Paginas: TdxPageControl
        Left = 0
        Top = 77
        Width = 462
        Height = 244
        ActivePage = tsSinal
        Align = alClient
        HideButtons = False
        HotTrack = False
        MultiLine = True
        OwnerDraw = False
        RaggedRight = True
        ScrollOpposite = False
        TabHeight = 21
        TabOrder = 2
        TabPosition = dxtpTop
        TabStop = True
        TabWidth = 110
        object tsSinal: TdxTabSheet
          Caption = '&1. Pré-Pago'
          object LMDSimplePanel3: TLMDSimplePanel
            Left = 0
            Top = 130
            Width = 462
            Height = 90
            UseDockManager = False
            Align = alTop
            Bevel.Mode = bmCustom
            TabOrder = 0
            object gbPrePago: TGroupBox
              Left = 0
              Top = 0
              Width = 222
              Height = 90
              Align = alClient
              Caption = ' P&ré-Pago '
              TabOrder = 0
              object LMDSimpleLabel2: TLMDSimpleLabel
                Left = 15
                Top = 27
                Width = 26
                Height = 15
                FocusControl = edSinal
                Caption = '&Total'
                Options = []
              end
              object lbTempo: TLMDSimpleLabel
                Left = 15
                Top = 59
                Width = 34
                Height = 15
                FocusControl = edLimiteTempo
                Caption = '&Tempo'
                Options = []
              end
              object edLimiteTempo: TOvcPictureField
                Left = 54
                Top = 56
                Width = 79
                Height = 21
                Cursor = crIBeam
                DataType = pftTime
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
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                InitDateTime = False
                LabelInfo.Visible = False
                MaxLength = 8
                Options = [efoCaretToEnd]
                ParentFont = False
                PictureMask = 'hh:mm:ss'
                TabOrder = 1
                OnChange = edLimiteTempoChange
                RangeHigh = {7F510100000000000000}
                RangeLow = {00000000000000000000}
              end
              object edSinal: TCurrencyEdit
                Left = 54
                Top = 24
                Width = 79
                Height = 21
                AutoSize = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                FormatOnEditing = True
                ParentFont = False
                TabOrder = 0
                OnChange = edSinalChange
              end
            end
            object panDivPausa: TLMDSimplePanel
              Left = 222
              Top = 0
              Width = 10
              Height = 90
              UseDockManager = False
              Align = alRight
              Bevel.Mode = bmCustom
              TabOrder = 1
            end
            object gbPausar: TGroupBox
              Left = 232
              Top = 0
              Width = 230
              Height = 90
              Align = alRight
              Caption = ' &Pausar Tempo '
              TabOrder = 2
              object Label1: TLabel
                Left = 13
                Top = 28
                Width = 32
                Height = 13
                Caption = 'T&empo'
                FocusControl = edPausaTempo
              end
              object Label2: TLabel
                Left = 13
                Top = 60
                Width = 35
                Height = 13
                Caption = '&Horário'
                FocusControl = edPausaHora
              end
              object edPausaTempo: TOvcPictureField
                Left = 53
                Top = 24
                Width = 71
                Height = 21
                Cursor = crIBeam
                DataType = pftTime
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
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                InitDateTime = True
                LabelInfo.Visible = False
                MaxLength = 8
                Options = [efoCaretToEnd]
                ParentFont = False
                PictureMask = 'hh:mm:ss'
                TabOrder = 0
                OnChange = edPausaTempoChange
                RangeHigh = {7F510100000000000000}
                RangeLow = {00000000000000000000}
              end
              object edPausaHora: TOvcPictureField
                Left = 53
                Top = 56
                Width = 71
                Height = 21
                Cursor = crIBeam
                DataType = pftTime
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
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                InitDateTime = True
                LabelInfo.Visible = False
                MaxLength = 8
                Options = [efoCaretToEnd]
                ParentFont = False
                PictureMask = 'hh:mm:ss'
                TabOrder = 1
                OnChange = edPausaHoraChange
                RangeHigh = {7F510100000000000000}
                RangeLow = {00000000000000000000}
              end
              object btnRecalc: TBitBtn
                Left = 134
                Top = 24
                Width = 72
                Height = 53
                Caption = 'Recalcular'#13#10'Pré-Pago'
                TabOrder = 2
                Visible = False
                OnClick = btnRecalcClick
              end
            end
          end
          object panGridSinal: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 462
            Height = 130
            UseDockManager = False
            Align = alTop
            Bevel.Mode = bmCustom
            TabOrder = 1
            object GridSinal: TdxDBGrid
              Left = 0
              Top = 28
              Width = 462
              Height = 102
              Bands = <
                item
                  Caption = 'Pagamentos antecipados lançados para esse acesso'
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'Numero'
              SummaryGroups = <>
              SummarySeparator = ', '
              Align = alClient
              TabOrder = 0
              DataSource = dsSinal
              DefaultRowHeight = 25
              Filter.Criteria = {00000000}
              LookAndFeel = lfFlat
              OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
              OptionsDB = [edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoInvertSelect, edgoUseBitmap]
              OnEditing = GridSinalEditing
              object GridSinalValor: TdxDBGridCurrencyColumn
                VertAlignment = tlCenter
                Width = 89
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Valor'
                SummaryFooterField = 'Valor'
                SummaryFooterFormat = 'Total = 0.00'
                MaxValue = 999999999
                Nullable = False
              end
              object GridSinalInicio: TdxDBGridDateColumn
                Caption = 'Data e Hora'
                DisableEditor = True
                TabStop = False
                VertAlignment = tlCenter
                Width = 132
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Inicio'
              end
              object GridSinalFuncI: TdxDBGridMaskColumn
                Caption = 'Funcionário'
                DisableEditor = True
                TabStop = False
                VertAlignment = tlCenter
                Width = 140
                BandIndex = 0
                RowIndex = 0
                FieldName = 'FuncI'
              end
              object GridSinalCaixa: TdxDBGridMaskColumn
                Alignment = taCenter
                DisableEditor = True
                HeaderAlignment = taCenter
                TabStop = False
                VertAlignment = tlCenter
                Width = 51
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Caixa'
              end
            end
            object bdcSinal: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 462
              Height = 28
              Align = dalTop
              BarManager = BarMgr
              SunkenBorder = True
              UseOwnSunkenBorder = True
            end
          end
        end
        object tsProdutos: TdxTabSheet
          Caption = '&2. Consumo'
          object LMDSimplePanel4: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 462
            Height = 221
            UseDockManager = False
            Align = alClient
            Bevel.Mode = bmEdge
            TabOrder = 0
            object lbTotalVendas: TLMDDBLabel
              Left = 2
              Top = 197
              Width = 458
              Height = 22
              Bevel.Mode = bmCustom
              Align = alBottom
              Alignment = agCenterRight
              AutoSize = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Options = []
              ParentFont = False
              ShowAccelChar = False
              DataField = 'Produtos'
              DataSource = dsTab
            end
            object lbVendas: TLMDLabel
              Left = 2
              Top = 2
              Width = 458
              Height = 18
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              Align = alTop
              Alignment = agCenter
              AutoSize = False
              Color = clGray
              FocusControl = gridItens
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Options = []
              ParentColor = False
              ParentFont = False
              Transparent = False
              OnClick = lbVendasClick
              Caption = 'Serviços e Produtos Consumidos'
            end
            object gridItens: TdxDBGrid
              Left = 2
              Top = 20
              Width = 458
              Height = 177
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'Item'
              SummaryGroups = <>
              SummarySeparator = ', '
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              OnEnter = gridItensEnter
              OnExit = gridItensExit
              OnKeyDown = gridItensKeyDown
              OnMouseDown = gridItensMouseDown
              DataSource = dsItens
              Filter.Criteria = {00000000}
              HideFocusRect = True
              HideSelection = True
              LookAndFeel = lfFlat
              OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoEnterThrough, edgoHorzThrough, edgoImmediateEditor]
              OptionsDB = [edgoCanDelete, edgoCanNavigation, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
              ScrollBars = ssNone
              OnChangeNodeEx = gridItensChangeNodeEx
              OnCustomDrawFooter = gridItensCustomDrawFooter
              object gridItensProduto: TdxDBGridColumn
                Caption = 'Código'
                Width = 90
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Produto'
              end
              object gridItensNomePro: TdxDBGridLookupColumn
                Caption = 'Produto'
                Width = 124
                BandIndex = 0
                RowIndex = 0
                FieldName = 'NomeProduto'
              end
              object gridItensQuant: TdxDBGridMaskColumn
                Caption = 'Quant'
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Quant'
              end
              object gridItensValor: TdxDBGridCurrencyColumn
                Color = 15588572
                HeaderAlignment = taRightJustify
                ReadOnly = True
                TabStop = False
                Width = 69
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Unitario'
                Nullable = False
              end
              object gridItensTotal: TdxDBGridMaskColumn
                Color = 15588572
                HeaderAlignment = taRightJustify
                ReadOnly = True
                TabStop = False
                Width = 63
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Total'
                SummaryFooterType = cstSum
                SummaryFooterField = 'Total'
                SummaryFooterFormat = '0.00'
              end
            end
          end
        end
        object tsAcesso: TdxTabSheet
          Caption = '&3. Totalização'
          object panAcesso: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 462
            Height = 221
            UseDockManager = False
            Align = alClient
            Bevel.StyleInner = bvLowered
            Bevel.BorderWidth = 5
            Bevel.Mode = bmStandard
            Bevel.StandardStyle = lsNone
            TabOrder = 0
            object panDivA3: TLMDSimplePanel
              Left = 0
              Top = 196
              Width = 462
              Height = 3
              UseDockManager = False
              Align = alBottom
              Bevel.Mode = bmCustom
              TabOrder = 0
            end
            object bdcAcesso2: TdxBarDockControl
              Left = 0
              Top = 199
              Width = 462
              Height = 22
              Align = dalBottom
              BarManager = BarMgr
              SunkenBorder = True
              UseOwnSunkenBorder = True
              Visible = False
            end
            object Insp: TdxDBInspector
              Left = 0
              Top = 7
              Width = 462
              Height = 189
              Align = alClient
              DataSource = dsTab
              DefaultFields = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnEnter = InspEnter
              DividerPos = 130
              Flat = True
              GridColor = clGray
              MinBandWidth = 200
              MinColumnWidth = 130
              Options = [dioDynamicColumnSizing, dioEditing, dioEnterThrough, dioNoCancel]
              PaintStyle = ipsExtended
              RowHeight = 25
              Data = {
                100100000500000008000000020000000C000000496E7370496E7465726E6574
                080000000100000010000000496E737054656D706F436F627261646F08000000
                0000000009000000496E737054656D706F08000000020000000E000000496E73
                7043726564557361646F5408000000000000000C000000496E73704372656441
                6E7454080000000000000008000000496E7370526F7736080000000000000009
                000000496E737053696E616C08000000000000000C000000496E737044657363
                6F6E746F08000000000000000C000000496E73705365727669636F7308000000
                000000000E000000496E7370546F74616C46696E616C01000000080000000CFE
                5F010E000000496E737043726564557361646F54}
              object InspInternet: TdxInspectorDBCurrencyRow
                Caption = 'Acesso'
                ReadOnly = True
                UseThousandSeparator = True
                FieldName = 'Valor'
              end
              object InspCredUsadoT: TdxInspectorDBTimeRow
                ReadOnly = True
                FieldName = 'CredUsadoT'
              end
              object InspCredAntT: TdxInspectorDBTimeRow
                ReadOnly = True
                FieldName = 'CredAntT'
              end
              object InspTempo: TdxInspectorDBTimeRow
                Caption = 'Tempo Real de Uso'
                ReadOnly = True
                FieldName = 'Tempo'
              end
              object InspTempoCobrado: TdxInspectorDBTimeRow
                Caption = 'Tempo'
                ReadOnly = True
                FieldName = 'TempoCobrado'
              end
              object InspRow6: TdxInspectorDBCheckRow
                Caption = 'Não usar créditos'
                ValueChecked = 'True'
                ValueUnchecked = 'False'
                FieldName = 'NaoUsarPacote'
              end
              object InspTotalFinal: TdxInspectorDBCurrencyRow
                Caption = 'Total Final'
                OnDrawCaption = InspTotalFinalDrawValue
                OnDrawValue = InspTotalFinalDrawValue
                FieldName = 'ValorFinal'
              end
              object InspDesconto: TdxInspectorDBCurrencyRow
                FieldName = 'Desconto'
              end
              object InspServicos: TdxInspectorDBCurrencyRow
                Caption = 'Vendas'
                ReadOnly = True
                FieldName = 'Produtos'
              end
              object InspSinal: TdxInspectorDBCurrencyRow
                Caption = 'Pré-Pago'
                ReadOnly = True
                FieldName = 'Sinal'
              end
            end
            object LMDSimplePanel1: TLMDSimplePanel
              Left = 0
              Top = 0
              Width = 462
              Height = 7
              UseDockManager = False
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 3
              object LMDLabel2: TLMDLabel
                Left = 288
                Top = 8
                Width = 39
                Height = 26
                Bevel.Mode = bmCustom
                FontFX.Style = tdSunken
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Options = []
                ParentFont = False
                Visible = False
                Caption = '115'
              end
            end
          end
        end
      end
    end
    object tsPagManut: TdxTabSheet
      Caption = 'tsPagManut'
      object InspM: TdxDBInspector
        Left = 0
        Top = 0
        Width = 462
        Height = 321
        Align = alClient
        DataSource = dsTab
        DefaultFields = False
        TabOrder = 0
        OnExit = InspMExit
        DividerPos = 117
        Flat = True
        Options = [dioAutoWidth, dioBandSizing, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough, dioNoCancel, dioTabs, dioTabThrough]
        Data = {
          9D00000007000000080000000000000009000000496E73704D44617461080000
          00000000000B000000496E73704D496E6963696F080000000000000008000000
          496E73704D46696D08000000000000000A000000496E73704D54656D706F0800
          00000000000009000000496E73704D526F773608000000000000000900000049
          6E73704D526F7737080000000000000009000000496E73704D616E7574000000
          00}
        object InspManut: TdxInspectorDBMemoRow
          RowHeight = 50
          FieldName = 'Obs'
        end
        object InspMRow6: TdxInspectorLookupRow
          Caption = 'Funcionario Inicio'
          ReadOnly = True
          FieldName = 'NomeFuncI'
        end
        object InspMRow7: TdxInspectorLookupRow
          Caption = 'Funcionario Término'
          ReadOnly = True
          FieldName = 'NomeFuncF'
        end
        object InspMData: TdxInspectorDBDateRow
          ReadOnly = True
          FieldName = 'Data'
        end
        object InspMInicio: TdxInspectorDBTimeRow
          ReadOnly = True
          FieldName = 'Inicio'
        end
        object InspMFim: TdxInspectorDBTimeRow
          ReadOnly = True
          FieldName = 'Fim'
        end
        object InspMTempo: TdxInspectorDBTimeRow
          ReadOnly = True
          FieldName = 'Tempo'
        end
      end
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
        Caption = 'Acesso'
        DockControl = bdcAcesso
        DockedDockControl = bdcAcesso
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 67
        FloatTop = 344
        FloatClientWidth = 69
        FloatClientHeight = 44
        IsMainMenu = True
        ItemLinks = <
          item
            Item = cmMaquina
            Visible = True
          end
          item
            Item = cmNumM
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmGravar
            Visible = True
          end
          item
            Item = cmCancelar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmManutencao
            Visible = True
          end>
        MultiLine = True
        Name = 'Acesso'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Rodapé Acesso'
        DockControl = bdcAcesso2
        DockedDockControl = bdcAcesso
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 477
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmData
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmPagamento
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmFuncFim
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmFuncInicio
            Visible = True
          end>
        Name = 'RodAcesso'
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
        Caption = 'Custom 1'
        DockControl = bdcSinal
        DockedDockControl = bdcSinal
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 478
        FloatTop = 452
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmNovoSinal
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmTituloSinal
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'Sinal')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    Images = ImageList1
    LargeImages = ImageList1
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 232
    Top = 211
    DockControlHeights = (
      0
      0
      0
      0)
    object cmFuncFim: TdxBarStatic
      Caption = 'Func. Fim: daniel'
      Category = 0
      Hint = 'Func. Fim: daniel'
      Visible = ivAlways
    end
    object cmData: TdxBarStatic
      Caption = 'Data: 22/05/2002'
      Category = 0
      Hint = 'Data: 22/05/2002'
      Visible = ivAlways
    end
    object cmPagamento: TdxBarStatic
      Caption = 'Pago em: 22/05/2202'
      Category = 0
      Hint = 'Pago em: 22/05/2202'
      Visible = ivAlways
    end
    object cmFuncInicio: TdxBarStatic
      Caption = 'Func.Inicio: jlborges'
      Category = 0
      Hint = 'Func.Inicio: jlborges'
      Visible = ivAlways
    end
    object cmNumM: TdxBarControlContainerItem
      Caption = 'Máquina'
      Category = 0
      Hint = 'Máquina'
      Visible = ivAlways
      Control = lbNumM
    end
    object cmMaquina: TdxBarStatic
      Caption = 'Máq:'
      Category = 0
      Hint = 'Máq:'
      Visible = ivAlways
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Gravar'
      Category = 0
      Hint = 'Gravar'
      Visible = ivAlways
      ImageIndex = 0
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 0
    end
    object cmNovoSinal: TdxBarButton
      Caption = '&Lançar Mais Pagamento'
      Category = 0
      Hint = 'Lançar Mais Pagamento'
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
      OnClick = cmNovoSinalClick
    end
    object cmTituloSinal: TdxBarStatic
      Caption = 'Valores Pagos Antecipadamente'
      Category = 0
      Hint = 'Valores Pagos Antecipadamente'
      Visible = ivAlways
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
        B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
        0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
        05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
        F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
        05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
        B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
        B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
        0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object cmManutencao: TdxBarLargeButton
      Caption = 'Liberar acesso p/ Manutenção'
      Category = 0
      Hint = 'Liberar acesso p/ Manutenção'
      Visible = ivNever
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF92635D8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598050
        4BFF00FFFF00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0
        CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080
        EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DA
        BBF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9
        BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
        93655FEED7C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC1
        89EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FF93655FEFDAC5F7E2C7F3DCBF811E00811E00811E00811E00
        811E00811E00811E00811E00811E00811E00811E00E9BD7FEABF7FE7BC7E8050
        4BFF00FFFF00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6811E00FE
        FEFEFEFEFEFEFEFEFEFEFED5DDFE1D41FBE9EDFEFEFEFEFEFEFE811E00E9BD7F
        EABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEA
        D7F6E3CE811E00FEFEFEFEFEFEFEFEFE9AADFC082AFA011FFA899EFCFEFEFEFE
        FEFE811E00E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
        986963F2E6DAFAEEDEF7E7D4811E00FEFEFEFEFEFE5674FB011FFA011FFA011F
        FA1135FAFEFEFEFEFEFE811E00E9BD81EABF7FE7BC7E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADC811E00E9EDFE1D41FB011FFA
        011FFA5674FB082AFA011FFA9AADFCFEFEFE811E00EBC188EABF82E7BB7E8050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3811E0011
        35FA011FFA082AFA9AADFCFEFEFE6681FB011FFA1135FAFEFEFE811E00EBC48E
        EBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFB
        F6FBF3EB811E00899EFC1D41FBC1CCFCFEFEFEFEFEFEE9EDFE082AFA011FFA66
        81FB811E00EDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FFFF00FF
        AC7969FAF6F4FFFFFEFEF8F3811E00FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FE899EFC011FFA011FFA631E1BEECB9CEEC996EAC18E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFB811E00FEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFE3859FB011FFA041FE5DCC1A6EECB9CEBC5928050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFF811E00FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE9EDFE1D41FB011FFA1C3AEA
        F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFF
        FFFFFFFF811E00811E00811E00811E00811E00811E00811E00811E00811E0063
        1E1B041FE5011FFA011FFACEB49180504BFF00FFFF00FFFF00FFFF00FFFF00FF
        C0896FFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EB
        DAF7E6D3F6E2CBF6DEC4F3DCBD011FFA011FFA011FFA011FFAFF00FFFF00FFFF
        00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
        FCF8F2FBF3EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9A011FFA011FFA011F
        FA011FFA011FFAFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C4A0675BA0675BA0675B
        A0675BA0675B011FFA011FFA011FFAFF00FFFF00FFFF00FFCF9674FBF7F6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B6A0
        675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        D49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
        FBFFFEF7DDC4BCA0675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDDC7C2A0675BEAB273EFA751A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CEA0675BEDB572A5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68A0
        675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = cmManutencaoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0092635D008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
        59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
        59008E5D59008E5D590080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0093655E00EFD3B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC7
        9100EEC58900EBC18200EBC08000EBC08000EBC08000EBC08000EBC08000EBC0
        8000EDC18000EABF7F0080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0093655F00EED4B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC7
        9600EDC58F00EBC18800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD
        7F00EABF7F00E7BC7E0080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0093655F00EED7C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB
        9D00EDC79600EDC58F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD
        7F00EABF7F00E7BC7E0080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0093655F00EFDAC500F7E2C700F3DCBF00811E0000811E0000811E0000811E
        0000811E0000811E0000811E0000811E0000811E0000811E0000811E0000E9BD
        7F00EABF7F00E7BC7E0080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0093656000F0DECC00F8E6CF00F6E0C600811E0000FEFEFE00FEFEFE00FEFE
        FE00FEFEFE00D5DDFE001D41FB00E9EDFE00FEFEFE00FEFEFE00811E0000E9BD
        7F00EABF7F00E7BC7E0080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0095666000F2E2D300FAEAD700F6E3CE00811E0000FEFEFE00FEFEFE00FEFE
        FE009AADFC00082AFA00011FFA00899EFC00FEFEFE00FEFEFE00811E0000E9BD
        7F00EABF7F00E7BC7E0080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0098696300F2E6DA00FAEEDE00F7E7D400811E0000FEFEFE00FEFEFE005674
        FB00011FFA00011FFA00011FFA001135FA00FEFEFE00FEFEFE00811E0000E9BD
        8100EABF7F00E7BC7E0080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF009E6E6400F4EAE100FBF2E600F8EADC00811E0000E9EDFE001D41FB00011F
        FA00011FFA005674FB00082AFA00011FFA009AADFC00FEFEFE00811E0000EBC1
        8800EABF8200E7BB7E0080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00A3726600F6EEE900FCF6ED00F8EFE300811E00001135FA00011FFA00082A
        FA009AADFC00FEFEFE006681FB00011FFA001135FA00FEFEFE00811E0000EBC4
        8E00EBC28800E7BC800080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00A7756800F8F3F000FEFBF600FBF3EB00811E0000899EFC001D41FB00C1CC
        FC00FEFEFE00FEFEFE00E9EDFE00082AFA00011FFA006681FB00811E0000EDC7
        9500EDC58F00E9BF870080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00AC796900FAF6F400FFFFFE00FEF8F300811E0000FEFEFE00FEFEFE00FEFE
        FE00FEFEFE00FEFEFE00FEFEFE00899EFC00011FFA00011FFA00631E1B00EECB
        9C00EEC99600EAC18E0080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00B17E6B00FAF6F400FFFFFF00FFFEFB00811E0000FEFEFE00FEFEFE00FEFE
        FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE003859FB00011FFA00041FE500DCC1
        A600EECB9C00EBC5920080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00B6816C00FAF6F400FFFFFF00FFFFFF00811E0000FEFEFE00FEFEFE00FEFE
        FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E9EDFE001D41FB00011FFA001C3A
        EA00F0CFA300EDC9990080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00BB846E00FAF6F400FFFFFF00FFFFFF00811E0000811E0000811E0000811E
        0000811E0000811E0000811E0000811E0000811E0000631E1B00041FE500011F
        FA00011FFA00CEB4910080504B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00C0896F00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7
        F200FBF2EA00FAEEE200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00011F
        FA00011FFA00011FFA00011FFA00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00C58C7000FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
        FB00FCF8F200FBF3EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB
        9A00011FFA00011FFA00011FFA00011FFA00011FFA00FF00FF00FF00FF00FF00
        FF00CB917300FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFEFB00FCF7F000FBF2E900FBF2E500E9D3C400A0675B00A0675B00A067
        5B00A0675B00A0675B00011FFA00011FFA00011FFA00FF00FF00FF00FF00FF00
        FF00CF967400FBF7F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFCFA00FCF7F000FFFAEF00DAC0B600A0675B00DAA16B00DD98
        4F00E2903A00EA892300A5686B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00D4987500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFCFB00FFFEF700DDC4BC00A0675B00EAB47400EFA9
        5200F6A03600A5686B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00D4987500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA7
        5100A5686B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00D4987500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A568
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
        6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800A0675B00A5686B00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 232
    Top = 243
  end
  object Tab: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
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
        Name = 'CredUsado'
        DataType = ftInteger
      end
      item
        Name = 'CredAnterior'
        DataType = ftInteger
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'DataPagto'
        DataType = ftDateTime
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'FormaPagto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'TempoCobrado'
        DataType = ftDateTime
      end
      item
        Name = 'NaoUsarPacote'
        DataType = ftBoolean
      end
      item
        Name = 'Produtos'
        DataType = ftFloat
      end
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end
      item
        Name = 'Sinal'
        DataType = ftCurrency
      end
      item
        Name = 'Manutencao'
        DataType = ftBoolean
      end>
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
    AfterInsert = TabAfterEdit
    AfterEdit = TabAfterEdit
    OnCalcFields = TabCalcFields
    Left = 200
    Top = 211
    object TabNumero: TAutoIncField
      DisplayLabel = 'Num'
      FieldName = 'Numero'
    end
    object TabAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object TabInicio: TDateTimeField
      FieldName = 'Inicio'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabFim: TDateTimeField
      FieldName = 'Fim'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabContato: TIntegerField
      FieldName = 'Contato'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabMaquina: TWordField
      DisplayLabel = 'Máquina'
      FieldName = 'Maquina'
    end
    object TabFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object TabFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object TabTempo: TDateTimeField
      FieldName = 'Tempo'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabMotivoDesc: TWordField
      FieldName = 'MotivoDesc'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object TabCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object TabIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TabData: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
      Calculated = True
    end
    object TabCredUsadoT: TDateTimeField
      DisplayLabel = 'Cred. Usado'
      FieldKind = fkCalculated
      FieldName = 'CredUsadoT'
      DisplayFormat = 'hh:mm:ss'
      Calculated = True
    end
    object TabCredAntT: TDateTimeField
      DisplayLabel = 'Cred. Anterior'
      FieldKind = fkCalculated
      FieldName = 'CredAntT'
      DisplayFormat = 'hh:mm:ss'
      Calculated = True
    end
    object TabDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object TabMotivo: TStringField
      FieldKind = fkLookup
      FieldName = 'Motivo'
      LookupDataSet = Dados.tbMotivo
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'MotivoDesc'
      Size = 30
      Lookup = True
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabValorFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFinal'
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
    object TabCreditoCli: TIntegerField
      FieldKind = fkLookup
      FieldName = 'CreditoCli'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CreditoM'
      KeyFields = 'Contato'
      Lookup = True
    end
    object TabTempoTicks: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TempoTicks'
      Calculated = True
    end
    object TabFormaPagto: TStringField
      DisplayLabel = 'Forma Pagto.'
      FieldName = 'FormaPagto'
    end
    object TabSubTotal: TCurrencyField
      DisplayLabel = 'Total'
      FieldKind = fkCalculated
      FieldName = 'SubTotal'
      Calculated = True
    end
    object TabCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object TabTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
      DisplayFormat = 'hh:mm:ss'
    end
    object TabNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object TabProdutos: TFloatField
      FieldName = 'Produtos'
      DisplayFormat = 'R$ 0.00'
    end
    object TabTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object TabSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object TabValorAcesso: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorAcesso'
      Calculated = True
    end
    object TabNomeTipoAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoAcesso'
      LookupDataSet = Dados.tbTipoAcesso
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'TipoAcesso'
      Size = 30
      Lookup = True
    end
    object TabIsentoCli: TBooleanField
      FieldKind = fkLookup
      FieldName = 'IsentoCli'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Isento'
      KeyFields = 'Contato'
      Lookup = True
    end
    object TabManutencao: TBooleanField
      FieldName = 'Manutencao'
    end
    object TabNomeFuncI: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFuncI'
      LookupDataSet = Dados.mtUsuario
      LookupKeyFields = 'Username'
      LookupResultField = 'Nome'
      KeyFields = 'FuncI'
      Size = 40
      Lookup = True
    end
    object TabNomeFuncF: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFuncF'
      LookupDataSet = Dados.mtUsuario
      LookupKeyFields = 'Username'
      LookupResultField = 'Nome'
      KeyFields = 'FuncF'
      Size = 40
      Lookup = True
    end
  end
  object dsItens: TDataSource
    DataSet = mtItens
    Left = 168
    Top = 243
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
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unitario'
        DataType = ftCurrency
      end
      item
        Name = 'Produto'
        DataType = ftString
        Size = 15
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
    Left = 168
    Top = 211
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
      OnValidate = mtItensProdutoValidate
      Size = 15
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
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IEmissor'
        Fields = 'Emissor;Serie;Numero;Item'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'iProd'
        Fields = 'Produto;Data;NumSeq'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IContato'
        Fields = 'Contato;Data'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IEmissor'
    SessionName = 'SesPad'
    TableName = 'ItensME'
    Timeout = 10000
    OnCalcFields = tItensMECalcFields
    Left = 264
    Top = 243
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
  object dstbItens: TDataSource
    DataSet = tItensME
    Left = 200
    Top = 243
  end
  object mtSinal: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
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
    BeforeDelete = mtSinalBeforeDelete
    OnCalcFields = mtSinalCalcFields
    Left = 136
    Top = 243
    object mtSinalCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object mtSinalAcessoPago: TIntegerField
      FieldName = 'AcessoPago'
    end
    object mtSinalValor: TCurrencyField
      FieldName = 'Valor'
    end
    object mtSinalFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object mtSinalNumero: TIntegerField
      FieldName = 'Numero'
    end
    object mtSinalInicio: TDateTimeField
      FieldName = 'Inicio'
      DisplayFormat = 'dd/mm/yyyy   hh:mm:ss'
    end
    object mtSinalNomeFunc: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFunc'
      LookupDataSet = Dados.mtUsuario
      LookupKeyFields = 'Username'
      LookupResultField = 'Nome'
      KeyFields = 'FuncI'
      Size = 30
      Lookup = True
    end
    object mtSinalValorCalc: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorCalc'
      Calculated = True
    end
  end
  object dsSinal: TDataSource
    DataSet = mtSinal
    Left = 136
    Top = 211
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
    Left = 264
    Top = 211
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
        Name = 'TipoAcesso'
        DataType = ftWord
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
      end
      item
        Name = 'CodPacote'
        DataType = ftWord
      end
      item
        Name = 'Sinal'
        DataType = ftCurrency
      end
      item
        Name = 'AcessoPago'
        DataType = ftInteger
      end
      item
        Name = 'ValorFinalAcesso'
        DataType = ftCurrency
      end
      item
        Name = 'DescontoProduto'
        DataType = ftCurrency
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
        Fields = 'Aberto;DataPagto;Fim'
        Options = [ixDescending, ixCaseInsensitive]
      end
      item
        Name = 'IFim'
        Fields = 'Fim'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixa'
        Fields = 'Caixa;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICodPac'
        Fields = 'CodPacote'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixaFim'
        Fields = 'Caixa;Fim'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IAcessoPago'
        Fields = 'AcessoPago'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'INumero'
    SessionName = 'SesPad'
    TableName = 'Acesso'
    Left = 296
    Top = 243
  end
  object tSinal: TffTable
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
        Name = 'TipoAcesso'
        DataType = ftWord
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
      end
      item
        Name = 'CodPacote'
        DataType = ftWord
      end
      item
        Name = 'Sinal'
        DataType = ftCurrency
      end
      item
        Name = 'AcessoPago'
        DataType = ftInteger
      end
      item
        Name = 'ValorFinalAcesso'
        DataType = ftCurrency
      end
      item
        Name = 'DescontoProduto'
        DataType = ftCurrency
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
        Fields = 'Aberto;DataPagto;Fim'
        Options = [ixDescending, ixCaseInsensitive]
      end
      item
        Name = 'IFim'
        Fields = 'Fim'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixa'
        Fields = 'Caixa;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICodPac'
        Fields = 'CodPacote'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixaFim'
        Fields = 'Caixa;Fim'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IAcessoPago'
        Fields = 'AcessoPago'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IAcessoPago'
    SessionName = 'SesPad'
    TableName = 'Acesso'
    Left = 296
    Top = 211
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 136
    Top = 288
    Bitmap = {
      494C010102000400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
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
      000000000000000000007F2B28007F2B28007F2B28007F2B2800A1828300A182
      8300A1828300A1828300A1828300A1828300A1828300A1828300A1828300A182
      8300A18283007F2B28007F2B28007F2B28007F2B280000000000000000000000
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
      0000000000007F2B2800B04E4C00C24A4A00BA4A4900B44141008B595900E2D9
      D900C9BDBD00C4AFAD00E2CFCC00F3EBE700F3EDEA00E5DEDE00DAE0DE00DAE0
      DE00B16564007A18170082212100A5393900AD4445007F2B2800000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080000000
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
      0000000000007F2B2800B4514F00C24A4A00C24E4E00BB4546008B3C3D00E2D9
      D9007916170079161700AC4E4C00F4E7E300FFFFFC00FAF6F200EFF6F300EFF6
      F300B16564007915150082202000A93A3A00B44848007F2B2800000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800B2504E00C24A4A00C04D4D00B84444008C404000E2D9
      D9007916170079161700B2535000E3D5D300FAF8F400FEF8F400FCFFFB00FCFF
      FF00B16564007915150082202000A73A3A00B24747007F2B2800000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00C0C0C0000060000000600000C0C0C000C0C0C000C0C0C000C0C0C0008080
      800080808000808080008080800080808000C0C0C000C0C0C000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800B2504E00C24A4A00C04D4D00B74343008F414100E2D9
      D9007916170079161700B2535000CFC0BF00EBEAE700FAF4F200FFFFFF00FCFF
      FF00B16564007915150082202000A73A3A00B24747007F2B2800000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800B2504E00C24A4A00C04D4D00B743430091424100E2D9
      D9007916170079161700B2535000B0A09F00D4D4D100EEE7E300FFFFFF00FCFF
      FF00B16564007814140083202000A73A3A00B24747007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800B2504E00C24A4A00C04D4D00B542420093434300E2D9
      D9007916170079161700B25350008C838200A7AFAD00D3D4D000FCFFFF00FCFF
      FF00B165640074111100801E1E00A6393900B24747007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800080808000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800B2504E00C24A4A00BF4C4C00B74444009C414100E2D9
      D900E2D9D900E2D9D900E2D9D900E2D9D900E2D9D900E2D9D900E2D9D900E2D9
      D900B1656400831C1C008C272700AB3D3D00B24647007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0008080800000000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800B2514E00C24A4A00BF4B4B00BD4A4900B7464600BF5B
      5B00CE777700D07B7B00CC747500CE6E6F00CB6C6C00C7686800C4686800C05A
      5A00B6444300B4414100B6434300BD494900B14546007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0080000000800000008000000080000000800000008000
      0000800000008000000080000000C0C0C0008080800080808000000000000000
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
      0000000000007F2B2800C24A4A00C24A4A00B2444300B74B4900BC515100BB50
      4F00BB4D4C00BB4D4D00BB4D4D00BB4D4D00BB4D4C00BB4D4C00BA4C4B00BB50
      4F00C0585700C15B5A00C1575700C14E4E00B04445007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000080000000C0C0C0008080800080808000000000000000
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
      0000000000007F2B2800C24A4A00C24A4A00CA8C8A00CA8C8A00CB8F8C00CC90
      8E00CC908E00CC908E00CC908E00CC908E00CC908E00CC908F00CC908F00CC90
      8F00CC908E00CC918F00CB908E00C0555500C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000080000000C0C0C0008080800080808000000000000000
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
      0000000000007F2B2800C24A4A00C24A4A00D7B4B100FEFCFC00FEFCFC00FFFE
      FE00FFFEFE00FFFEFE00FFFEFE00FFFEFE00FFFEFE00FFFEFE00FFFEFE00FFFE
      FE00FEFCFC00FCFBFB00DDB7B600B54B4B00C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000FF000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF00000080000000C0C0C0008080800080808000000000000000
      0000000000000000000040A02000006000000060000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800C24A4A00C24A4A00D9B8B600FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00DDB7B700B4494800C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000FF000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF00000080000000C0C0C0008080800080808000000000000000
      000000000000000000000080200040C0400040C0600000600000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800C24A4A00C24A4A00D9B6B400FEFEFE00FEFEFE00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00FEFEFE00FEFEFE00DDB7B600B4494800C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000080000000C0C0C0008080800080808000000000000000
      0000000000000000000000A0200040C0600040C0600040C06000006000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800C24A4A00C24A4A00D9B6B400FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00DDB7B600B4494800C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000080000000C0C0C0008080800080808000000000000000
      000000000000000000004080200040E0800040C0600040C0600040C060000060
      2000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800C24A4A00C24A4A00D9B6B400FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00DDB7B600B4494800C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800080808000000000000000
      0000000000000000000000A0200040E0800040C0600040E0600040C0600040E0
      6000006000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800C24A4A00C24A4A00D9B6B400FEFEFE00FEFEFE00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00FEFEFE00FEFEFE00DDB7B600B4494800C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0080808000000000000000
      000000000000000000000080200080E0800040E0600040C0600040C0600040C0
      600040C060000060000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800C24A4A00C24A4A00D9B6B400FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00DDB7B600B4494800C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00000000000000
      0000000000000000000000A0200080E0A00040E0800040E0600040E0800040E0
      600040E0600040E0800000600000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800C24A4A00C24A4A00D9B6B400FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00DDB7B600B4494800C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000A0200080E0A00040E0600040E0800040E0600040E0
      800040E0800080E0A00000802000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800C24A4A00C24A4A00D9B7B500FEFEFE00FEFEFE00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00FEFEFE00FEFEFE00DDB7B600B54A4A00C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000040A0200080E0A00040E0800040E0800040E0800040E0
      800080E0A00000A0200000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F2B2800C24A4A00C24A4A00D3B1AF00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00DDB8B600C24A4A00C24A4A007F2B2800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000080200080E0C00040E0800040E0800040E0800080E0
      A00040A020000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F2B28007F2B2800C1A09E00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00E0BAB7007F2B28007F2B280000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000040A0200080E0C00040E0800040E0800080E0A00000A0
      2000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000A02000C0DCC00040E0800080E0A000008020000000
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
      0000000000000000000040A0200080E0C00080E0C00040A02000000000000000
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
      0000000000000000000000A020000080200040A0200000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FC00007FE0001FFF0000000000000000F800003FC0000FFF0000000000000000
      F800003FC00007FF0000000000000000F800003FC00007FF0000000000000000
      F800003FC00007FF0000000000000000F800003FE00007FF0000000000000000
      F800003FF00007FF0000000000000000F800003FF0000FFF0000000000000000
      F800003FF0001FFF0000000000000000F800003FF0001FFF0000000000000000
      F800003FF0001FFF0000000000000000F800003FF0001C7F0000000000000000
      F800003FF0001C3F0000000000000000F800003FF0001C1F0000000000000000
      F800003FF0001C0F0000000000000000F800003FF0001C070000000000000000
      F800003FF8001C030000000000000000F800003FFC001C010000000000000000
      F800003FFE003C010000000000000000F800003FFFFFFC030000000000000000
      F800003FFFFFFC070000000000000000FC00007FFFFFFC0F0000000000000000
      FFFFFFFFFFFFFC1F0000000000000000FFFFFFFFFFFFFC3F0000000000000000
      FFFFFFFFFFFFFC7F0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000
      000000000000}
  end
end
