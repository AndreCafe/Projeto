object FrmHoraCor: TFrmHoraCor
  Left = 259
  Top = 157
  Width = 686
  Height = 550
  BorderWidth = 5
  Caption = 'Tipo de Acesso / Tarifas'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel11: TLMDSimplePanel
    Left = 0
    Top = 255
    Width = 668
    Height = 258
    UseDockManager = False
    Align = alClient
    Bevel.BorderInnerWidth = 5
    Bevel.Mode = bmEdge
    TabOrder = 0
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 7
      Top = 7
      Width = 654
      Height = 244
      UseDockManager = False
      Align = alClient
      Bevel.Mode = bmCustom
      TabOrder = 0
      object panGrid: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 291
        Height = 244
        UseDockManager = False
        Align = alLeft
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsLoweredspb
        TabOrder = 0
        object lbInstrucao: TLMDLabel
          Left = 80
          Top = 128
          Width = 400
          Height = 50
          Bevel.Mode = bmCustom
          Alignment = agCenterLeft
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MultiLine = True
          Options = []
          ParentFont = False
          Caption = 
            '  - Cadastre seus preços e associe com os horários correspondent' +
            'es;'#13#10'  - Selecione o preço e clique no dia / hora correspondente' +
            '; '#13#10'  - Mantenha a tecla CTRL apertada para ajustar vários horár' +
            'ios de uma só vez.'
        end
        object dxBarDockControl1: TdxBarDockControl
          Left = 2
          Top = 2
          Width = 287
          Height = 26
          Align = dalTop
          BarManager = BarMgr
        end
        object Grid: TdxDBGrid
          Left = 2
          Top = 28
          Width = 287
          Height = 214
          Bands = <
            item
              Caption = 'Lista de preços'
              DisableCustomizing = True
              DisableDragging = True
              Width = 207
            end>
          DefaultLayout = False
          HeaderPanelRowCount = 1
          KeyField = 'Cor'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 1
          DataSource = dsCor
          DefaultRowHeight = 25
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsDB = [edgoCanNavigation, edgoConfirmDelete, edgoSyncSelection, edgoUseBookmarks]
          OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoIndicator, edgoRowSelect, edgoUseBitmap]
          object GridCor: TdxDBGridButtonColumn
            Alignment = taCenter
            DisableDragging = True
            HeaderAlignment = taCenter
            MinWidth = 16
            VertAlignment = tlCenter
            Width = 58
            BandIndex = 0
            RowIndex = 0
            OnCustomDrawCell = GridCorCustomDrawCell
            FieldName = 'Cor'
            Buttons = <
              item
                Default = True
              end>
          end
          object GridCorFonte: TdxDBGridButtonColumn
            Caption = 'Cor Fonte'
            DisableDragging = True
            VertAlignment = tlCenter
            Width = 59
            BandIndex = 0
            RowIndex = 0
            OnCustomDrawCell = GridCorFonteCustomDrawCell
            FieldName = 'CorFonte'
            Buttons = <
              item
                Default = True
              end>
          end
          object GridCorDescr: TdxDBGridColumn
            Caption = 'Descrição'
            VertAlignment = tlCenter
            Width = 132
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Descricao'
          end
        end
      end
      object panDiv: TLMDSimplePanel
        Left = 291
        Top = 0
        Width = 6
        Height = 244
        UseDockManager = False
        Align = alLeft
        Bevel.Mode = bmCustom
        TabOrder = 1
      end
      object panInsp: TLMDSimplePanel
        Left = 297
        Top = 0
        Width = 357
        Height = 244
        UseDockManager = False
        Align = alClient
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsLoweredspb
        TabOrder = 2
        object dxPageControl1: TdxPageControl
          Left = 2
          Top = 28
          Width = 353
          Height = 214
          ActivePage = dxTabSheet2
          Align = alClient
          HideButtons = True
          HotTrack = False
          MultiLine = False
          OwnerDraw = False
          RaggedRight = False
          ScrollOpposite = False
          TabHeight = 0
          TabOrder = 0
          TabPosition = dxtpTop
          TabStop = True
          TabWidth = 0
          object dxTabSheet1: TdxTabSheet
            Caption = 'Preço Simples'
            object Insp: TdxDBInspector
              Left = 0
              Top = 0
              Width = 353
              Height = 214
              Align = alClient
              DataSource = dsCor
              DefaultFields = False
              Enabled = False
              TabOrder = 0
              DividerPos = 30
              Flat = True
              Options = [dioAutoWidth, dioBandSizing, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough, dioNoCancel]
              PaintStyle = ipsExtended
              Data = {
                1001000004000000080000000000000009000000496E7370507265636F080000
                000000000009000000496E737054656D706F080000000300000008000000496E
                7370526F773708000000000000000A000000496E737056616C6F724908000000
                000000000A000000496E737054656D706F4908000000000000000F000000496E
                7370546F6C6572616E63696149080000000300000008000000496E7370526F77
                3808000000000000000A000000496E737056616C6F724108000000000000000A
                000000496E737054656D706F4108000000000000000F000000496E7370546F6C
                6572616E636961410200000008000000400E610108000000496E7370526F7737
                0800000060874A0208000000496E7370526F7738}
              object InspValorI: TdxInspectorDBCurrencyRow
                Caption = 'Valor'
                UseThousandSeparator = True
                FieldName = 'ValorI'
              end
              object InspValorA: TdxInspectorDBCurrencyRow
                Caption = 'Valor'
                UseThousandSeparator = True
                FieldName = 'ValorA'
              end
              object InspPreco: TdxInspectorDBCurrencyRow
                Caption = 'Tarifa'
                UseThousandSeparator = True
                FieldName = 'Preco'
              end
              object InspRow7: TdxInspectorDBRow
                Caption = 'Fração Mínima Inicial'
                IsCategory = True
              end
              object InspRow8: TdxInspectorDBRow
                Caption = 'Fração Mínima Adicional'
                IsCategory = True
              end
              object InspTempo: TdxInspectorDBTimeRow
                FieldName = 'Tempo'
              end
              object InspToleranciaI: TdxInspectorDBTimeRow
                Caption = 'Tolerância'
                FieldName = 'ToleranciaI'
              end
              object InspToleranciaA: TdxInspectorDBTimeRow
                Caption = 'Tolerância'
                FieldName = 'ToleranciaA'
              end
              object InspTempoI: TdxInspectorDBTimeRow
                Caption = 'Tempo'
                FieldName = 'TempoI'
              end
              object InspTempoA: TdxInspectorDBTimeRow
                Caption = 'Tempo'
                ReadOnly = True
                FieldName = 'TempoA'
              end
            end
          end
          object dxTabSheet2: TdxTabSheet
            Caption = 'Preço Composto'
            object GridPrecos: TdxDBGrid
              Left = 0
              Top = 0
              Width = 353
              Height = 214
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              SummaryGroups = <>
              SummarySeparator = ', '
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              DataSource = dsCorPrecos
              DefaultRowHeight = 25
              Filter.Criteria = {00000000}
              LookAndFeel = lfFlat
              OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
              OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoIndicator, edgoRowSelect, edgoUseBitmap]
              object GridPrecosValor: TdxDBGridCurrencyColumn
                VertAlignment = tlCenter
                Width = 72
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Valor'
                Nullable = False
              end
              object GridPrecosTempo: TdxDBGridTimeColumn
                Alignment = taCenter
                HeaderAlignment = taCenter
                VertAlignment = tlCenter
                Width = 77
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Tempo'
              end
              object GridPrecosTolerancia: TdxDBGridTimeColumn
                Alignment = taCenter
                Caption = 'Tolerância'
                HeaderAlignment = taCenter
                VertAlignment = tlCenter
                Width = 78
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Tolerancia'
              end
              object GridPrecosFracaoMin: TdxDBGridCurrencyColumn
                Caption = 'Valor Fração Min.'
                VertAlignment = tlCenter
                Width = 100
                BandIndex = 0
                RowIndex = 0
                FieldName = 'ValorMin'
                Nullable = False
              end
            end
            object cmNome: TEdit
              Left = 48
              Top = 104
              Width = 185
              Height = 21
              TabOrder = 1
            end
          end
        end
        object LMDSimplePanel10: TLMDSimplePanel
          Left = 2
          Top = 2
          Width = 353
          Height = 26
          UseDockManager = False
          Align = alTop
          Bevel.BorderSides = [fsBottom]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsSingleRaised
          TabOrder = 1
          object dxDBImageEdit1: TdxDBImageEdit
            Left = 2
            Top = 2
            Width = 255
            Color = clSilver
            TabOrder = 0
            DataField = 'Reinicia'
            DataSource = dsCor
            ReadOnly = True
            Descriptions.Strings = (
              'Repetir último preço/tempo'
              'Repetir todos preços/tempos')
            ImageIndexes.Strings = (
              '0'
              '1')
            Values.Strings = (
              'False'
              'True')
            StoredValues = 64
          end
        end
      end
    end
  end
  object panHorarios: TLMDSimplePanel
    Left = 0
    Top = 44
    Width = 668
    Height = 211
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 5
    object LMDSimplePanel2: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 668
      Height = 211
      UseDockManager = False
      Align = alLeft
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsSingle
      TabOrder = 0
      object LMDSimplePanel7: TLMDSimplePanel
        Tag = 7
        Left = 1
        Top = 183
        Width = 666
        Height = 27
        UseDockManager = False
        Align = alTop
        Bevel.StyleOuter = bvNormal
        Bevel.WidthInner = 0
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmCustom
        Bevel.StandardStyle = lsSingle
        TabOrder = 0
        object hora723: TLMDSpeedButton
          Tag = 23
          Left = 639
          Top = 1
          Width = 26
          Height = 25
          Caption = '23'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora722: TLMDSpeedButton
          Tag = 22
          Left = 613
          Top = 1
          Width = 26
          Height = 25
          Caption = '22'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora721: TLMDSpeedButton
          Tag = 21
          Left = 587
          Top = 1
          Width = 26
          Height = 25
          Caption = '21'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora720: TLMDSpeedButton
          Tag = 20
          Left = 561
          Top = 1
          Width = 26
          Height = 25
          Caption = '20'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora719: TLMDSpeedButton
          Tag = 19
          Left = 535
          Top = 1
          Width = 26
          Height = 25
          Caption = '19'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora718: TLMDSpeedButton
          Tag = 18
          Left = 509
          Top = 1
          Width = 26
          Height = 25
          Caption = '18'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora717: TLMDSpeedButton
          Tag = 17
          Left = 483
          Top = 1
          Width = 26
          Height = 25
          Caption = '17'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora716: TLMDSpeedButton
          Tag = 16
          Left = 457
          Top = 1
          Width = 26
          Height = 25
          Caption = '16'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora715: TLMDSpeedButton
          Tag = 15
          Left = 431
          Top = 1
          Width = 26
          Height = 25
          Caption = '15'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora714: TLMDSpeedButton
          Tag = 14
          Left = 405
          Top = 1
          Width = 26
          Height = 25
          Caption = '14'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora70: TLMDSpeedButton
          Left = 41
          Top = 1
          Width = 26
          Height = 25
          Caption = '0'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora71: TLMDSpeedButton
          Tag = 1
          Left = 67
          Top = 1
          Width = 26
          Height = 25
          Caption = '1'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora72: TLMDSpeedButton
          Tag = 2
          Left = 93
          Top = 1
          Width = 26
          Height = 25
          Caption = '2'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora73: TLMDSpeedButton
          Tag = 3
          Left = 119
          Top = 1
          Width = 26
          Height = 25
          Caption = '3'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora74: TLMDSpeedButton
          Tag = 4
          Left = 145
          Top = 1
          Width = 26
          Height = 25
          Caption = '4'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora75: TLMDSpeedButton
          Tag = 5
          Left = 171
          Top = 1
          Width = 26
          Height = 25
          Caption = '5'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora76: TLMDSpeedButton
          Tag = 6
          Left = 197
          Top = 1
          Width = 26
          Height = 25
          Caption = '6'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora77: TLMDSpeedButton
          Tag = 7
          Left = 223
          Top = 1
          Width = 26
          Height = 25
          Caption = '7'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora78: TLMDSpeedButton
          Tag = 8
          Left = 249
          Top = 1
          Width = 26
          Height = 25
          Caption = '8'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora79: TLMDSpeedButton
          Tag = 9
          Left = 275
          Top = 1
          Width = 26
          Height = 25
          Caption = '9'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora710: TLMDSpeedButton
          Tag = 10
          Left = 301
          Top = 1
          Width = 26
          Height = 25
          Caption = '10'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora711: TLMDSpeedButton
          Tag = 11
          Left = 327
          Top = 1
          Width = 26
          Height = 25
          Caption = '11'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora712: TLMDSpeedButton
          Tag = 12
          Left = 353
          Top = 1
          Width = 26
          Height = 25
          Caption = '12'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora713: TLMDSpeedButton
          Tag = 13
          Left = 379
          Top = 1
          Width = 26
          Height = 25
          Caption = '13'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object LMDLabel5: TLMDLabel
          Left = 1
          Top = 1
          Width = 40
          Height = 25
          Bevel.BorderSides = [fsRight]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Align = alLeft
          Alignment = agCenter
          AutoSize = False
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Caption = 'Sab'
        end
      end
      object LMDSimplePanel3: TLMDSimplePanel
        Tag = 6
        Left = 1
        Top = 156
        Width = 666
        Height = 27
        UseDockManager = False
        Align = alTop
        Bevel.StyleOuter = bvNormal
        Bevel.WidthInner = 0
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmCustom
        TabOrder = 1
        object hora623: TLMDSpeedButton
          Tag = 23
          Left = 639
          Top = 1
          Width = 26
          Height = 25
          Caption = '23'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora622: TLMDSpeedButton
          Tag = 22
          Left = 613
          Top = 1
          Width = 26
          Height = 25
          Caption = '22'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora621: TLMDSpeedButton
          Tag = 21
          Left = 587
          Top = 1
          Width = 26
          Height = 25
          Caption = '21'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora620: TLMDSpeedButton
          Tag = 20
          Left = 561
          Top = 1
          Width = 26
          Height = 25
          Caption = '20'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora619: TLMDSpeedButton
          Tag = 19
          Left = 535
          Top = 1
          Width = 26
          Height = 25
          Caption = '19'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora618: TLMDSpeedButton
          Tag = 18
          Left = 509
          Top = 1
          Width = 26
          Height = 25
          Caption = '18'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora617: TLMDSpeedButton
          Tag = 17
          Left = 483
          Top = 1
          Width = 26
          Height = 25
          Caption = '17'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora616: TLMDSpeedButton
          Tag = 16
          Left = 457
          Top = 1
          Width = 26
          Height = 25
          Caption = '16'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora615: TLMDSpeedButton
          Tag = 15
          Left = 431
          Top = 1
          Width = 26
          Height = 25
          Caption = '15'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora614: TLMDSpeedButton
          Tag = 14
          Left = 405
          Top = 1
          Width = 26
          Height = 25
          Caption = '14'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora60: TLMDSpeedButton
          Left = 41
          Top = 1
          Width = 26
          Height = 25
          Caption = '0'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora61: TLMDSpeedButton
          Tag = 1
          Left = 67
          Top = 1
          Width = 26
          Height = 25
          Caption = '1'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora62: TLMDSpeedButton
          Tag = 2
          Left = 93
          Top = 1
          Width = 26
          Height = 25
          Caption = '2'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora63: TLMDSpeedButton
          Tag = 3
          Left = 119
          Top = 1
          Width = 26
          Height = 25
          Caption = '3'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora64: TLMDSpeedButton
          Tag = 4
          Left = 145
          Top = 1
          Width = 26
          Height = 25
          Caption = '4'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora65: TLMDSpeedButton
          Tag = 5
          Left = 171
          Top = 1
          Width = 26
          Height = 25
          Caption = '5'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora66: TLMDSpeedButton
          Tag = 6
          Left = 197
          Top = 1
          Width = 26
          Height = 25
          Caption = '6'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora67: TLMDSpeedButton
          Tag = 7
          Left = 223
          Top = 1
          Width = 26
          Height = 25
          Caption = '7'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora68: TLMDSpeedButton
          Tag = 8
          Left = 249
          Top = 1
          Width = 26
          Height = 25
          Caption = '8'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora69: TLMDSpeedButton
          Tag = 9
          Left = 275
          Top = 1
          Width = 26
          Height = 25
          Caption = '9'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora610: TLMDSpeedButton
          Tag = 10
          Left = 301
          Top = 1
          Width = 26
          Height = 25
          Caption = '10'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora611: TLMDSpeedButton
          Tag = 11
          Left = 327
          Top = 1
          Width = 26
          Height = 25
          Caption = '11'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora612: TLMDSpeedButton
          Tag = 12
          Left = 353
          Top = 1
          Width = 26
          Height = 25
          Caption = '12'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora613: TLMDSpeedButton
          Tag = 13
          Left = 379
          Top = 1
          Width = 26
          Height = 25
          Caption = '13'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object LMDLabel1: TLMDLabel
          Left = 1
          Top = 1
          Width = 40
          Height = 25
          Bevel.BorderSides = [fsRight]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Align = alLeft
          Alignment = agCenter
          AutoSize = False
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Caption = 'Sex'
        end
      end
      object LMDSimplePanel4: TLMDSimplePanel
        Tag = 5
        Left = 1
        Top = 129
        Width = 666
        Height = 27
        UseDockManager = False
        Align = alTop
        Bevel.StyleOuter = bvNormal
        Bevel.WidthInner = 0
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmCustom
        TabOrder = 2
        object hora523: TLMDSpeedButton
          Tag = 23
          Left = 639
          Top = 1
          Width = 26
          Height = 25
          Caption = '23'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora522: TLMDSpeedButton
          Tag = 22
          Left = 613
          Top = 1
          Width = 26
          Height = 25
          Caption = '22'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora521: TLMDSpeedButton
          Tag = 21
          Left = 587
          Top = 1
          Width = 26
          Height = 25
          Caption = '21'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora520: TLMDSpeedButton
          Tag = 20
          Left = 561
          Top = 1
          Width = 26
          Height = 25
          Caption = '20'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora519: TLMDSpeedButton
          Tag = 19
          Left = 535
          Top = 1
          Width = 26
          Height = 25
          Caption = '19'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora518: TLMDSpeedButton
          Tag = 18
          Left = 509
          Top = 1
          Width = 26
          Height = 25
          Caption = '18'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora517: TLMDSpeedButton
          Tag = 17
          Left = 483
          Top = 1
          Width = 26
          Height = 25
          Caption = '17'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora516: TLMDSpeedButton
          Tag = 16
          Left = 457
          Top = 1
          Width = 26
          Height = 25
          Caption = '16'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora515: TLMDSpeedButton
          Tag = 15
          Left = 431
          Top = 1
          Width = 26
          Height = 25
          Caption = '15'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora514: TLMDSpeedButton
          Tag = 14
          Left = 405
          Top = 1
          Width = 26
          Height = 25
          Caption = '14'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora50: TLMDSpeedButton
          Left = 41
          Top = 1
          Width = 26
          Height = 25
          Caption = '0'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora51: TLMDSpeedButton
          Tag = 1
          Left = 67
          Top = 1
          Width = 26
          Height = 25
          Caption = '1'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora52: TLMDSpeedButton
          Tag = 2
          Left = 93
          Top = 1
          Width = 26
          Height = 25
          Caption = '2'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora53: TLMDSpeedButton
          Tag = 3
          Left = 119
          Top = 1
          Width = 26
          Height = 25
          Caption = '3'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora54: TLMDSpeedButton
          Tag = 4
          Left = 145
          Top = 1
          Width = 26
          Height = 25
          Caption = '4'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora55: TLMDSpeedButton
          Tag = 5
          Left = 171
          Top = 1
          Width = 26
          Height = 25
          Caption = '5'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora56: TLMDSpeedButton
          Tag = 6
          Left = 197
          Top = 1
          Width = 26
          Height = 25
          Caption = '6'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora57: TLMDSpeedButton
          Tag = 7
          Left = 223
          Top = 1
          Width = 26
          Height = 25
          Caption = '7'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora58: TLMDSpeedButton
          Tag = 8
          Left = 249
          Top = 1
          Width = 26
          Height = 25
          Caption = '8'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora59: TLMDSpeedButton
          Tag = 9
          Left = 275
          Top = 1
          Width = 26
          Height = 25
          Caption = '9'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora510: TLMDSpeedButton
          Tag = 10
          Left = 301
          Top = 1
          Width = 26
          Height = 25
          Caption = '10'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora511: TLMDSpeedButton
          Tag = 11
          Left = 327
          Top = 1
          Width = 26
          Height = 25
          Caption = '11'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora512: TLMDSpeedButton
          Tag = 12
          Left = 353
          Top = 1
          Width = 26
          Height = 25
          Caption = '12'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora513: TLMDSpeedButton
          Tag = 13
          Left = 379
          Top = 1
          Width = 26
          Height = 25
          Caption = '13'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object LMDLabel2: TLMDLabel
          Left = 1
          Top = 1
          Width = 40
          Height = 25
          Bevel.BorderSides = [fsRight]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Align = alLeft
          Alignment = agCenter
          AutoSize = False
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Caption = 'Qui'
        end
      end
      object LMDSimplePanel5: TLMDSimplePanel
        Tag = 4
        Left = 1
        Top = 102
        Width = 666
        Height = 27
        UseDockManager = False
        Align = alTop
        Bevel.StyleOuter = bvNormal
        Bevel.WidthInner = 0
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmCustom
        TabOrder = 3
        object hora423: TLMDSpeedButton
          Tag = 23
          Left = 639
          Top = 1
          Width = 26
          Height = 25
          Caption = '23'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora422: TLMDSpeedButton
          Tag = 22
          Left = 613
          Top = 1
          Width = 26
          Height = 25
          Caption = '22'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora421: TLMDSpeedButton
          Tag = 21
          Left = 587
          Top = 1
          Width = 26
          Height = 25
          Caption = '21'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora420: TLMDSpeedButton
          Tag = 20
          Left = 561
          Top = 1
          Width = 26
          Height = 25
          Caption = '20'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora419: TLMDSpeedButton
          Tag = 19
          Left = 535
          Top = 1
          Width = 26
          Height = 25
          Caption = '19'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora418: TLMDSpeedButton
          Tag = 18
          Left = 509
          Top = 1
          Width = 26
          Height = 25
          Caption = '18'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora417: TLMDSpeedButton
          Tag = 17
          Left = 483
          Top = 1
          Width = 26
          Height = 25
          Caption = '17'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora416: TLMDSpeedButton
          Tag = 16
          Left = 457
          Top = 1
          Width = 26
          Height = 25
          Caption = '16'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora415: TLMDSpeedButton
          Tag = 15
          Left = 431
          Top = 1
          Width = 26
          Height = 25
          Caption = '15'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora414: TLMDSpeedButton
          Tag = 14
          Left = 405
          Top = 1
          Width = 26
          Height = 25
          Caption = '14'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora40: TLMDSpeedButton
          Left = 41
          Top = 1
          Width = 26
          Height = 25
          Caption = '0'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora41: TLMDSpeedButton
          Tag = 1
          Left = 67
          Top = 1
          Width = 26
          Height = 25
          Caption = '1'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora42: TLMDSpeedButton
          Tag = 2
          Left = 93
          Top = 1
          Width = 26
          Height = 25
          Caption = '2'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora43: TLMDSpeedButton
          Tag = 3
          Left = 119
          Top = 1
          Width = 26
          Height = 25
          Caption = '3'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora44: TLMDSpeedButton
          Tag = 4
          Left = 145
          Top = 1
          Width = 26
          Height = 25
          Caption = '4'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora45: TLMDSpeedButton
          Tag = 5
          Left = 171
          Top = 1
          Width = 26
          Height = 25
          Caption = '5'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora46: TLMDSpeedButton
          Tag = 6
          Left = 197
          Top = 1
          Width = 26
          Height = 25
          Caption = '6'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora47: TLMDSpeedButton
          Tag = 7
          Left = 223
          Top = 1
          Width = 26
          Height = 25
          Caption = '7'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora48: TLMDSpeedButton
          Tag = 8
          Left = 249
          Top = 1
          Width = 26
          Height = 25
          Caption = '8'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora49: TLMDSpeedButton
          Tag = 9
          Left = 275
          Top = 1
          Width = 26
          Height = 25
          Caption = '9'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora410: TLMDSpeedButton
          Tag = 10
          Left = 301
          Top = 1
          Width = 26
          Height = 25
          Caption = '10'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora411: TLMDSpeedButton
          Tag = 11
          Left = 327
          Top = 1
          Width = 26
          Height = 25
          Caption = '11'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora412: TLMDSpeedButton
          Tag = 12
          Left = 353
          Top = 1
          Width = 26
          Height = 25
          Caption = '12'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora413: TLMDSpeedButton
          Tag = 13
          Left = 379
          Top = 1
          Width = 26
          Height = 25
          Caption = '13'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object LMDLabel3: TLMDLabel
          Left = 1
          Top = 1
          Width = 40
          Height = 25
          Bevel.BorderSides = [fsRight]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Align = alLeft
          Alignment = agCenter
          AutoSize = False
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Caption = 'Qua'
        end
      end
      object LMDSimplePanel6: TLMDSimplePanel
        Tag = 3
        Left = 1
        Top = 75
        Width = 666
        Height = 27
        UseDockManager = False
        Align = alTop
        Bevel.StyleOuter = bvNormal
        Bevel.WidthInner = 0
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmCustom
        TabOrder = 4
        object hora323: TLMDSpeedButton
          Tag = 23
          Left = 639
          Top = 1
          Width = 26
          Height = 25
          Caption = '23'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora322: TLMDSpeedButton
          Tag = 22
          Left = 613
          Top = 1
          Width = 26
          Height = 25
          Caption = '22'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora321: TLMDSpeedButton
          Tag = 21
          Left = 587
          Top = 1
          Width = 26
          Height = 25
          Caption = '21'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora320: TLMDSpeedButton
          Tag = 20
          Left = 561
          Top = 1
          Width = 26
          Height = 25
          Caption = '20'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora319: TLMDSpeedButton
          Tag = 19
          Left = 535
          Top = 1
          Width = 26
          Height = 25
          Caption = '19'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora318: TLMDSpeedButton
          Tag = 18
          Left = 509
          Top = 1
          Width = 26
          Height = 25
          Caption = '18'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora317: TLMDSpeedButton
          Tag = 17
          Left = 483
          Top = 1
          Width = 26
          Height = 25
          Caption = '17'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora316: TLMDSpeedButton
          Tag = 16
          Left = 457
          Top = 1
          Width = 26
          Height = 25
          Caption = '16'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora315: TLMDSpeedButton
          Tag = 15
          Left = 431
          Top = 1
          Width = 26
          Height = 25
          Caption = '15'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora314: TLMDSpeedButton
          Tag = 14
          Left = 405
          Top = 1
          Width = 26
          Height = 25
          Caption = '14'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora30: TLMDSpeedButton
          Left = 41
          Top = 1
          Width = 26
          Height = 25
          Caption = '0'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora31: TLMDSpeedButton
          Tag = 1
          Left = 67
          Top = 1
          Width = 26
          Height = 25
          Caption = '1'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora32: TLMDSpeedButton
          Tag = 2
          Left = 93
          Top = 1
          Width = 26
          Height = 25
          Caption = '2'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora33: TLMDSpeedButton
          Tag = 3
          Left = 119
          Top = 1
          Width = 26
          Height = 25
          Caption = '3'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora34: TLMDSpeedButton
          Tag = 4
          Left = 145
          Top = 1
          Width = 26
          Height = 25
          Caption = '4'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora35: TLMDSpeedButton
          Tag = 5
          Left = 171
          Top = 1
          Width = 26
          Height = 25
          Caption = '5'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora36: TLMDSpeedButton
          Tag = 6
          Left = 197
          Top = 1
          Width = 26
          Height = 25
          Caption = '6'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora37: TLMDSpeedButton
          Tag = 7
          Left = 223
          Top = 1
          Width = 26
          Height = 25
          Caption = '7'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora38: TLMDSpeedButton
          Tag = 8
          Left = 249
          Top = 1
          Width = 26
          Height = 25
          Caption = '8'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora39: TLMDSpeedButton
          Tag = 9
          Left = 275
          Top = 1
          Width = 26
          Height = 25
          Caption = '9'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora310: TLMDSpeedButton
          Tag = 10
          Left = 301
          Top = 1
          Width = 26
          Height = 25
          Caption = '10'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora311: TLMDSpeedButton
          Tag = 11
          Left = 327
          Top = 1
          Width = 26
          Height = 25
          Caption = '11'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora312: TLMDSpeedButton
          Tag = 12
          Left = 353
          Top = 1
          Width = 26
          Height = 25
          Caption = '12'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora313: TLMDSpeedButton
          Tag = 13
          Left = 379
          Top = 1
          Width = 26
          Height = 25
          Caption = '13'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object LMDLabel4: TLMDLabel
          Left = 1
          Top = 1
          Width = 40
          Height = 25
          Bevel.BorderSides = [fsRight]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Align = alLeft
          Alignment = agCenter
          AutoSize = False
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Caption = 'Ter'
        end
      end
      object LMDSimplePanel8: TLMDSimplePanel
        Tag = 2
        Left = 1
        Top = 48
        Width = 666
        Height = 27
        UseDockManager = False
        Align = alTop
        Bevel.StyleOuter = bvNormal
        Bevel.WidthInner = 0
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmCustom
        TabOrder = 5
        object hora223: TLMDSpeedButton
          Tag = 23
          Left = 639
          Top = 1
          Width = 26
          Height = 25
          Caption = '23'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora222: TLMDSpeedButton
          Tag = 22
          Left = 613
          Top = 1
          Width = 26
          Height = 25
          Caption = '22'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora221: TLMDSpeedButton
          Tag = 21
          Left = 587
          Top = 1
          Width = 26
          Height = 25
          Caption = '21'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora220: TLMDSpeedButton
          Tag = 20
          Left = 561
          Top = 1
          Width = 26
          Height = 25
          Caption = '20'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora219: TLMDSpeedButton
          Tag = 19
          Left = 535
          Top = 1
          Width = 26
          Height = 25
          Caption = '19'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora218: TLMDSpeedButton
          Tag = 18
          Left = 509
          Top = 1
          Width = 26
          Height = 25
          Caption = '18'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora217: TLMDSpeedButton
          Tag = 17
          Left = 483
          Top = 1
          Width = 26
          Height = 25
          Caption = '17'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora216: TLMDSpeedButton
          Tag = 16
          Left = 457
          Top = 1
          Width = 26
          Height = 25
          Caption = '16'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora215: TLMDSpeedButton
          Tag = 15
          Left = 431
          Top = 1
          Width = 26
          Height = 25
          Caption = '15'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora214: TLMDSpeedButton
          Tag = 14
          Left = 405
          Top = 1
          Width = 26
          Height = 25
          Caption = '14'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora20: TLMDSpeedButton
          Left = 41
          Top = 1
          Width = 26
          Height = 25
          Caption = '0'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora21: TLMDSpeedButton
          Tag = 1
          Left = 67
          Top = 1
          Width = 26
          Height = 25
          Caption = '1'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora22: TLMDSpeedButton
          Tag = 2
          Left = 93
          Top = 1
          Width = 26
          Height = 25
          Caption = '2'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora23: TLMDSpeedButton
          Tag = 3
          Left = 119
          Top = 1
          Width = 26
          Height = 25
          Caption = '3'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora24: TLMDSpeedButton
          Tag = 4
          Left = 145
          Top = 1
          Width = 26
          Height = 25
          Caption = '4'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora25: TLMDSpeedButton
          Tag = 5
          Left = 171
          Top = 1
          Width = 26
          Height = 25
          Caption = '5'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora26: TLMDSpeedButton
          Tag = 6
          Left = 197
          Top = 1
          Width = 26
          Height = 25
          Caption = '6'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora27: TLMDSpeedButton
          Tag = 7
          Left = 223
          Top = 1
          Width = 26
          Height = 25
          Caption = '7'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora28: TLMDSpeedButton
          Tag = 8
          Left = 249
          Top = 1
          Width = 26
          Height = 25
          Caption = '8'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora29: TLMDSpeedButton
          Tag = 9
          Left = 275
          Top = 1
          Width = 26
          Height = 25
          Caption = '9'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora210: TLMDSpeedButton
          Tag = 10
          Left = 301
          Top = 1
          Width = 26
          Height = 25
          Caption = '10'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora211: TLMDSpeedButton
          Tag = 11
          Left = 327
          Top = 1
          Width = 26
          Height = 25
          Caption = '11'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora212: TLMDSpeedButton
          Tag = 12
          Left = 353
          Top = 1
          Width = 26
          Height = 25
          Caption = '12'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora213: TLMDSpeedButton
          Tag = 13
          Left = 379
          Top = 1
          Width = 26
          Height = 25
          Caption = '13'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object LMDLabel6: TLMDLabel
          Left = 1
          Top = 1
          Width = 40
          Height = 25
          Bevel.BorderSides = [fsRight]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Align = alLeft
          Alignment = agCenter
          AutoSize = False
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Caption = 'Seg'
        end
      end
      object LMDSimplePanel9: TLMDSimplePanel
        Tag = 1
        Left = 1
        Top = 21
        Width = 666
        Height = 27
        UseDockManager = False
        Align = alTop
        Bevel.StyleOuter = bvNormal
        Bevel.WidthInner = 0
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmCustom
        TabOrder = 6
        object hora123: TLMDSpeedButton
          Tag = 23
          Left = 639
          Top = 1
          Width = 26
          Height = 25
          Caption = '23'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora122: TLMDSpeedButton
          Tag = 22
          Left = 613
          Top = 1
          Width = 26
          Height = 25
          Caption = '22'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora121: TLMDSpeedButton
          Tag = 21
          Left = 587
          Top = 1
          Width = 26
          Height = 25
          Caption = '21'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora120: TLMDSpeedButton
          Tag = 20
          Left = 561
          Top = 1
          Width = 26
          Height = 25
          Caption = '20'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora119: TLMDSpeedButton
          Tag = 19
          Left = 535
          Top = 1
          Width = 26
          Height = 25
          Caption = '19'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora118: TLMDSpeedButton
          Tag = 18
          Left = 509
          Top = 1
          Width = 26
          Height = 25
          Caption = '18'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora117: TLMDSpeedButton
          Tag = 17
          Left = 483
          Top = 1
          Width = 26
          Height = 25
          Caption = '17'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora116: TLMDSpeedButton
          Tag = 16
          Left = 457
          Top = 1
          Width = 26
          Height = 25
          Caption = '16'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora115: TLMDSpeedButton
          Tag = 15
          Left = 431
          Top = 1
          Width = 26
          Height = 25
          Caption = '15'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora114: TLMDSpeedButton
          Tag = 14
          Left = 405
          Top = 1
          Width = 26
          Height = 25
          Caption = '14'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora10: TLMDSpeedButton
          Left = 41
          Top = 1
          Width = 26
          Height = 25
          Caption = '0'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora11: TLMDSpeedButton
          Tag = 1
          Left = 67
          Top = 1
          Width = 26
          Height = 25
          Caption = '1'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora12: TLMDSpeedButton
          Tag = 2
          Left = 93
          Top = 1
          Width = 26
          Height = 25
          Caption = '2'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora13: TLMDSpeedButton
          Tag = 3
          Left = 119
          Top = 1
          Width = 26
          Height = 25
          Caption = '3'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora14: TLMDSpeedButton
          Tag = 4
          Left = 145
          Top = 1
          Width = 26
          Height = 25
          Caption = '4'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora15: TLMDSpeedButton
          Tag = 5
          Left = 171
          Top = 1
          Width = 26
          Height = 25
          Caption = '5'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora16: TLMDSpeedButton
          Tag = 6
          Left = 197
          Top = 1
          Width = 26
          Height = 25
          Caption = '6'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora17: TLMDSpeedButton
          Tag = 7
          Left = 223
          Top = 1
          Width = 26
          Height = 25
          Caption = '7'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora18: TLMDSpeedButton
          Tag = 8
          Left = 249
          Top = 1
          Width = 26
          Height = 25
          Caption = '8'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora19: TLMDSpeedButton
          Tag = 9
          Left = 275
          Top = 1
          Width = 26
          Height = 25
          Caption = '9'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora110: TLMDSpeedButton
          Tag = 10
          Left = 301
          Top = 1
          Width = 26
          Height = 25
          Caption = '10'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora111: TLMDSpeedButton
          Tag = 11
          Left = 327
          Top = 1
          Width = 26
          Height = 25
          Caption = '11'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora112: TLMDSpeedButton
          Tag = 12
          Left = 353
          Top = 1
          Width = 26
          Height = 25
          Caption = '12'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object hora113: TLMDSpeedButton
          Tag = 13
          Left = 379
          Top = 1
          Width = 26
          Height = 25
          Caption = '13'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = hora10Click
          OnMouseMove = hora16MouseMove
          Align = alLeft
          Style = ubsFlat
        end
        object LMDLabel7: TLMDLabel
          Left = 1
          Top = 1
          Width = 40
          Height = 25
          Bevel.BorderSides = [fsRight]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Align = alLeft
          Alignment = agCenter
          AutoSize = False
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Caption = 'Dom'
        end
      end
      object LMDSimplePanel13: TLMDSimplePanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 666
        Height = 20
        UseDockManager = False
        Align = alTop
        Bevel.StyleOuter = bvNormal
        Bevel.WidthInner = 0
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmCustom
        TabOrder = 7
        object Dia: TLMDLabel
          Left = 40
          Top = 1
          Width = 625
          Height = 18
          Bevel.BorderSides = [fsRight]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Align = alClient
          Alignment = agCenter
          AutoSize = False
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Caption = 'Horário / Cor Correspondente'
        end
        object LMDLabel11: TLMDLabel
          Left = 1
          Top = 1
          Width = 39
          Height = 18
          Bevel.BorderSides = [fsRight]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Align = alLeft
          Alignment = agCenter
          AutoSize = False
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          Caption = 'Dia'
        end
      end
    end
  end
  object dxBarDockControl2: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 668
    Height = 44
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object BarMgr: TdxBarManager
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
        Caption = 'Custom 1'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 510
        FloatTop = 506
        FloatClientWidth = 61
        FloatClientHeight = 66
        ItemLinks = <
          item
            Item = cmNovoPreco
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmEditar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmApagar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmTodos
            Visible = True
          end>
        Name = 'Custom 1'
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
        Caption = 'Custom 2'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 304
        FloatTop = 134
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmGravar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmCancelar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = stNome
            Visible = True
          end
          item
            Item = ccmNome
            Visible = True
          end>
        Name = 'Custom 2'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
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
    UseSystemFont = False
    Left = 165
    Top = 342
    DockControlHeights = (
      0
      0
      0
      0)
    object cmNovoPreco: TdxBarButton
      Caption = '&Novo'
      Category = 0
      Hint = 'Novo'
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
      OnClick = cmNovoPrecoClick
    end
    object cmApagar: TdxBarButton
      Caption = 'Apagar'
      Category = 0
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
      OnClick = cmApagarClick
    end
    object cmCancelar: TdxBarLargeButton
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
      OnClick = cmCancelarClick
      AutoGrayScale = False
      Height = 38
      LargeGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0005B70005B7FF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FF0005B7
        0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005
        B70005B7FF00FFFF00FFFF00FF0005B70005B60005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF
        0006D70005BA0005B70005B7FF00FFFF00FFFF00FFFF00FF0005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B6FF
        00FF0005B60005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0005B60006C70006C70006CE0005B4FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006C100
        05C10006DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0005B60006D70006CE0006DA0006E9FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006E50006DA0006D3FF
        00FFFF00FF0006E50006EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F80006DA0006EFFF00FFFF00FFFF00FFFF00FF0006F80006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F8FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F6FF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F6FF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F6
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Width = 52
    end
    object cmTodos: TdxBarButton
      Align = iaRight
      Caption = 'Preço único'
      Category = 0
      Hint = 'Preço único'
      Visible = ivAlways
      OnClick = cmTodosClick
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      OnClick = cmGravarClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF7F2B287F2B28A18283A18283A18283A1
        8283A18283A18283A182837A1C1C7F2B28FF00FFFF00FFFF00FFFF00FF7F2B28
        CA4D4DB64545DDD4D5791617791617DCE0E0D7DADECED5D7BDBABD76100F9A2D
        2D7F2B28FF00FFFF00FFFF00FF7F2B28C24A4BB14444E2D9D9791617791617D9
        D8DAD9DEE1D3D9DCC1BDC1761111982D2D7F2B28FF00FFFF00FFFF00FF7F2B28
        C24A4AB04242E6DCDC791617791617D5D3D5D8DEE1D7DDE0C6C2C5700F0F962C
        2C7F2B28FF00FFFF00FFFF00FF7F2B28C24A4AB04141EADEDEE7DDDDDDD4D5D7
        D3D5D5D7D9D7D8DACAC2C57E17179E31317F2B28FF00FFFF00FFFF00FF7F2B28
        BF4748B84545BA4C4CBD5757BB5756B64E4EB44949BD5251BB4B4CB54242BF4A
        4A7F2B28FF00FFFF00FFFF00FF7F2B28A33B39B1605DC68684CB918FCC9190CC
        908FCB8988C98988CB9391CC9696BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
        BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
        4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
        BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
        4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
        BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
        4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FFFF00FF
        7F2B28F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F77F2B
        28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object cmEditar: TdxBarButton
      Caption = '&Editar'
      Category = 0
      Hint = 'Editar'
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
      OnClick = cmEditarClick
    end
    object stNome: TdxBarStatic
      Caption = 'Nome'
      Category = 0
      Hint = 'Nome'
      Visible = ivAlways
    end
    object ccmNome: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cmNome
    end
  end
  object dsCor: TDataSource
    DataSet = mtCor
    Left = 70
    Top = 342
  end
  object mtCor: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end
      item
        Name = 'Cor'
        DataType = ftInteger
      end
      item
        Name = 'CorFonte'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Reinicia'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'Cor'
    IndexName = 'mtCorPrecoIndex1'
    IndexDefs = <
      item
        Name = 'mtCorPrecoIndex1'
        Fields = 'Cor'
        Options = [ixPrimary, ixUnique, ixCaseInsensitive]
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
    Left = 39
    Top = 342
    object mtCorTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object mtCorCor: TIntegerField
      FieldName = 'Cor'
    end
    object mtCorCorFonte: TIntegerField
      FieldName = 'CorFonte'
    end
    object mtCorDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object mtCorReinicia: TBooleanField
      FieldName = 'Reinicia'
    end
  end
  object mtCorPrecos: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end
      item
        Name = 'Cor'
        DataType = ftInteger
      end
      item
        Name = 'Pos'
        DataType = ftWord
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Tempo'
        DataType = ftDateTime
      end
      item
        Name = 'ValorMin'
        DataType = ftCurrency
      end
      item
        Name = 'Tolerancia'
        DataType = ftDateTime
      end>
    AutoAddIndexes = True
    IndexFieldNames = 'TipoAcesso;Cor;Pos'
    IndexName = 'mtCorPrecosIndex1'
    IndexDefs = <
      item
        Name = 'mtCorPrecosIndex1'
        Fields = 'TipoAcesso;Cor;Pos'
        Options = [ixPrimary, ixCaseInsensitive]
      end>
    SortOptions = [mtcoCaseInsensitive]
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcSearch, mtpcCopy]
    FilterOptions = []
    MasterFields = 'TipoAcesso;Cor'
    MasterSource = dsCor
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 47
    Top = 414
    object mtCorPrecosTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object mtCorPrecosCor: TIntegerField
      FieldName = 'Cor'
    end
    object mtCorPrecosPos: TWordField
      FieldName = 'Pos'
    end
    object mtCorPrecosValor: TCurrencyField
      FieldName = 'Valor'
    end
    object mtCorPrecosTempo: TDateTimeField
      FieldName = 'Tempo'
      DisplayFormat = 'hh:mm:ss'
    end
    object mtCorPrecosValorMin: TCurrencyField
      DisplayLabel = 'Valor Min.'
      FieldName = 'ValorMin'
    end
    object mtCorPrecosTolerancia: TDateTimeField
      FieldName = 'Tolerancia'
      DisplayFormat = 'hh:mm:ss'
    end
  end
  object dsCorPrecos: TDataSource
    DataSet = mtCorPrecos
    Left = 79
    Top = 414
  end
  object tAux: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftWord
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TipoCobranca'
        DataType = ftWord
      end>
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
      end>
    IndexName = 'ICodigo'
    SessionName = 'SesPad'
    TableName = 'TipoAcesso'
    Timeout = 10000
    Left = 143
    Top = 128
    object tAuxCodigo: TWordField
      FieldName = 'Codigo'
    end
    object tAuxNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
end
