object FrmTarifa: TFrmTarifa
  Left = 0
  Top = 0
  Caption = 'Tarifa'
  ClientHeight = 515
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TcxPageControl
    AlignWithMargins = True
    Left = 0
    Top = 260
    Width = 820
    Height = 255
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = cxTabSheet1
    Align = alClient
    ShowFrame = True
    Style = 6
    TabOrder = 0
    TabSlants.Kind = skCutCorner
    TabSlants.Positions = []
    Visible = False
    OnChange = PaginasChange
    ClientRectBottom = 254
    ClientRectLeft = 1
    ClientRectRight = 819
    ClientRectTop = 24
    object tsHoras: TcxTabSheet
      Caption = 'Valor por Hora'
      ImageIndex = 4
      object gridH: TcxGrid
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 318
        Height = 210
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object tvH: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = tvHCustomDrawCell
          OnEditing = tvHEditing
          OnInitEdit = tvMinInitEdit
          OnInitEditValue = tvMinInitEditValue
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnRecordChanged = tvHDataControllerRecordChanged
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.FocusRect = False
          OptionsView.CellAutoHeight = True
          OptionsView.CellTextMaxLineCount = 5
          OptionsView.ColumnAutoWidth = True
          OptionsView.ExpandButtonsForEmptyDetails = False
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Content = FrmPri.cxStyle39
          Styles.Selection = FrmPri.cxStyle38
          object tvHTempoUso: TcxGridColumn
            Caption = 'Tempo de Uso'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 40
          end
          object tvHCobrar: TcxGridColumn
            Caption = 'Cobrar (valor total)'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object tvHTarifa: TcxGridColumn
            Caption = 'Tarifa'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            VisibleForCustomization = False
            Width = 40
          end
        end
        object glH: TcxGridLevel
          GridView = tvH
        end
      end
      object LMDSimplePanel3: TLMDSimplePanel
        Left = 338
        Top = 0
        Width = 480
        Height = 230
        Align = alClient
        Bevel.Mode = bmCustom
        TabOrder = 1
        object panInfo: TLMDSimplePanel
          AlignWithMargins = True
          Left = 0
          Top = 10
          Width = 470
          Height = 39
          Margins.Left = 0
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alTop
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          TabOrder = 0
          object Image1: TImage
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 24
            Height = 36
            Margins.Bottom = 0
            Align = alLeft
            AutoSize = True
            Center = True
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              0018000000180806000000E0773DF80000002B744558744372656174696F6E20
              54696D6500446F203133204F6B7420323030352031383A30313A3239202B3031
              3030311DF4020000000774494D4507D605170D391788122EEA00000009704859
              7300000B1100000B11017F645F910000000467414D410000B18F0BFC61050000
              058C4944415478DA7D567F6C137514FFDC5DAFEB3AD8DCB28DD1C9700816300E
              1C1846102446820AA20241918026FE8A114C00892146FF20E26F060A0B6E9A18
              0D094B4640654060536453D2213FD7D1B26EC0BAD28EB26E6BB7FEEEF5CEF7ED
              B5763FC04B5E7AB97BF7F9BCF779DFF75E39DCEB5A772C13116105A4F83310F8
              591A9D58A0480AE2A1602F626133A2DEDFD1F6DB09B88FF593779C4CB91B0C37
              E6C96BA70544F51B4531BA7DB2D1306162493E32B3F55064028FC51189443170
              DB0777F71DF475BB6E23E0D88B869D3580CB4B5F4BFF4FF0BA6502FCEE3AE3A3
              93174E9F530AAD00842332AEF7C5E1F6C7E00B4890A2127849820819A21C43F0
              A603B2EBEA59588FBC07C7090BA1848767932678E5E24470837F2C7C7AF674C3
              A49C442CA63B80DD47EFFC01C0E956FDB2744006311309C9475032D0DF0774B4
              D9D0B6FF6DDC69394F5E8114894AF0944D837C67D313CBCBE7171767C347311C
              732489ED4ECC0DD8F0E1CA1214E567E2AF5B3CB69978201623E525F55726122F
              29643B770ECDEFBF0B44AED297A134C15AD307C6D9859F97CF2B859FC08FDEA4
              67BC1AC34CCB19B47E62A4BC33A0D168919129E2A29BC79C1F83C060BF9A493C
              AE923828AAF6C35568ABFE86BE6628128765CDD94201D7B562DD82DC2CCAFC60
              27155366D4C41D0A6383D88EEFD71723C66742A7D341100455DBAF28C0BE1E15
              3C4512A6E83A2DFDF87BD32644074F919B87C3AAFA37A7951B6BCAE74E41AB27
              0EAB3759164640278777DEC2D577C663FAA42C7AA84BBCDA6402F69DEA058243
              C95A248DC9E5720197AAF6C179B29A5CAF7178BEFEC8A2550B5E3090BEB53659
              054E5D8A9220414CC6A219E360180F34920A9EEE012A3C555F8E8F25E827D9AC
              271B60A9DC4B084D1C569EB8B16CFDE2D2013A82677B088CE7D2E08CACF33A49
              41910A5A4014C948223DDD532D12BAA7E46116890043E47BBDF5262E6CF99A50
              7EE1342F370696AE9EAFB7F64671C3A7A43360043C55BAB9052D1F1741E64508
              1A0DB444F0739B824A93A236708A80FD3202BF9F64EA1EC2D9372AC9E1274E78
              A921B8E4C57999E79D61784248EB9F22B8648567CFFD88516BF154E02C2D8FDD
              17157C749C80E29174F4CC187888407A1C7E98DEDA4F48351C96FF6A7F72CDC2
              920B44E08B8CEE7322B2756380082445CD801154B672D87EC8439A07479E229F
              4FAD83DDD285CBDBEA548225B547672DAD58DE15D210813C765AF57811DC550C
              892412A9063AEAE2CA2B02B61EB053B483E91E884681810195A0A3F1343AAB9A
              121261F1779B0BCAE654A2B000BDFE51044CA6A11862BB2622CE6540ABD55252
              1CF6D0C4D9FC03153FE81B290FEB035664F3B707D0676A2184C31C1EDE50C295
              AE361B2ACAB29DDEE85882B816CA978590055D029CD96E22D852DD4E04C90C58
              F44C1EE6DFD3EDC3E5AD7590A3F584F0273B322216D7ECD44F99B12D745F01CD
              AE6159B07B7D2E94CFF2FE6B32765511F6C67D568ADAABEACFC099EF2011761C
              3C84DBC73BC8AD96CCCA25E6916EAA0115DB8F730F3D52A6E8F4AA738AA0B804
              3B9ECD859C9C5C221DAC266AE29347DAD429CA2449F580CB6CC6B54FFFA1281B
              C9BB511D15EA25E281951598FCDC01941A4BA0D727BB58569B4B115490D43346
              E7A3E8037EF51903EFB5DB61D9710692DF4C0E47C96E90C5862F1C3D0A1F5F84
              07D77C81A26965C8CB4BCE23396DEC843063C564C08943401978DACDE8D87399
              C06D84C3861CA587E0E88DC6EEC741935B86A96B5F45DEDC35C8C9CD4146068D
              09214DC2160CADCD44430DD112E8A96F80FBD4103D67DBAC99E9CE56D4C88533
              9284F4C12468731F43FEBC0AE4CC3442573405C2B8BCC43791C13E04ED5DE8BF
              E082F74A184A94F61E982C97C81CC94573979539F222E1417B1306B2D2042190
              3FEC2831104F12B08B8C6634D8728D8D06BA1741EA9D2699115B06A41584E43B
              F637850D9640526B09F7F8DBF22F1365B71D4857E30A0000000049454E44AE42
              6082}
            ExplicitLeft = 4
            ExplicitTop = 4
            ExplicitHeight = 24
          end
          object cxLabel10: TcxLabel
            Left = 30
            Top = 0
            Align = alClient
            Caption = 
              'Configure o valor a ser cobrado conforme a quantidade de horas d' +
              'e acesso.'
            Style.TextColor = 4868682
            Properties.Alignment.Vert = taVCenter
            Properties.WordWrap = True
            Width = 440
            AnchorY = 20
          end
        end
        object lbErroH: TcxLabel
          Left = 0
          Top = 59
          Align = alTop
          AutoSize = False
          Caption = 
            'Aten'#231#227'o: O valor a ser cobrado n'#227'o pode ser menor que o valor do' +
            ' tempo anterior.'
          ParentColor = False
          Style.Color = 10023407
          Style.TextColor = clBlack
          Style.TextStyle = [fsBold]
          Style.TransparentBorder = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.WordWrap = True
          Visible = False
          Height = 32
          Width = 480
          AnchorX = 240
          AnchorY = 75
        end
      end
    end
    object tsMinutos: TcxTabSheet
      Caption = 'Valor dos Minutos'
      ImageIndex = 3
      object LMDSimplePanel1: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 818
        Height = 35
        Align = alTop
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 0
        object cxLabel6: TcxLabel
          AlignWithMargins = True
          Left = 10
          Top = 0
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Tarifar a cada'
          Style.TextStyle = []
          Properties.Alignment.Vert = taVCenter
          AnchorY = 18
        end
        object btnDiv: TcxButton
          AlignWithMargins = True
          Left = 85
          Top = 7
          Width = 92
          Height = 21
          Margins.Top = 7
          Margins.Bottom = 7
          Align = alLeft
          Caption = '15min.'
          TabOrder = 1
          DropDownMenu = PopupMenu1
          Glyph.Data = {
            32010000424D3201000000000000360000002800000009000000090000000100
            180000000000FC00000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF5A5A5AFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF5A5A5A5A5A5A5A5A5AFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFF5A5A5A5A5A5A5A5A5A5A5A5A5A5A5AFFFFFFFFFF
            FF00FFFFFF5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5AFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          Kind = cxbkDropDown
          Layout = blGlyphRight
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
          SpeedButtonOptions.Flat = True
        end
        object btnArr: TcxButton
          AlignWithMargins = True
          Left = 183
          Top = 7
          Width = 141
          Height = 21
          Margins.Top = 7
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Arredondar em 0,05'
          TabOrder = 2
          DropDownMenu = pmArr
          Glyph.Data = {
            32010000424D3201000000000000360000002800000009000000090000000100
            180000000000FC00000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF5A5A5AFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF5A5A5A5A5A5A5A5A5AFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFF5A5A5A5A5A5A5A5A5A5A5A5A5A5A5AFFFFFFFFFF
            FF00FFFFFF5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5AFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          Kind = cxbkDropDown
          Layout = blGlyphRight
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
          SpeedButtonOptions.Flat = True
          SpeedButtonOptions.Transparent = True
        end
      end
      object LMDSimplePanel2: TLMDSimplePanel
        Left = 0
        Top = 35
        Width = 818
        Height = 195
        Align = alClient
        Bevel.Mode = bmCustom
        TabOrder = 1
        object Grid: TcxGrid
          AlignWithMargins = True
          Left = 10
          Top = 0
          Width = 314
          Height = 185
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alLeft
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          OnMouseLeave = GridMouseLeave
          object tvMin: TcxGridTableView
            OnMouseDown = tvMinMouseDown
            OnMouseLeave = tvMinMouseLeave
            OnMouseMove = tvMinMouseMove
            NavigatorButtons.ConfirmDelete = False
            OnCanFocusRecord = tvMinCanFocusRecord
            OnCustomDrawCell = tvMinCustomDrawCell
            OnEditing = tvMinEditing
            OnInitEdit = tvMinInitEdit
            OnInitEditValue = tvMinInitEditValue
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            DataController.OnRecordChanged = tvMinDataControllerRecordChanged
            OptionsBehavior.AlwaysShowEditor = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnHorzSizing = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.CellAutoHeight = True
            OptionsView.CellTextMaxLineCount = 5
            OptionsView.ColumnAutoWidth = True
            OptionsView.ExpandButtonsForEmptyDetails = False
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.Selection = FrmPri.cxStyle38
            object tvMinHora: TcxGridColumn
              Caption = 'Hora'
              DataBinding.ValueType = 'Integer'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              OnCustomDrawCell = tvMinHoraCustomDrawCell
              OnGetDataText = tvMinHoraGetDataText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Focusing = False
              VisibleForCustomization = False
              Width = 40
            end
            object tvMinMinutos: TcxGridColumn
              Caption = 'Minutos'
              DataBinding.ValueType = 'Integer'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Vert = taVCenter
              Properties.EditMask = '99;0; '
              Properties.MaxLength = 0
              Properties.OnValidate = tvMinMinutosPropertiesValidate
              OnGetDisplayText = tvMinMinutosGetDisplayText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 40
            end
            object tvMinValor: TcxGridColumn
              Caption = 'Cobrar (Valor Total)'
              DataBinding.ValueType = 'Currency'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
            end
          end
          object GL: TcxGridLevel
            GridView = tvMin
          end
        end
        object LMDSimplePanel4: TLMDSimplePanel
          Left = 334
          Top = 0
          Width = 484
          Height = 195
          Align = alClient
          Bevel.Mode = bmCustom
          TabOrder = 1
          object LMDSimplePanel5: TLMDSimplePanel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 474
            Height = 39
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 10
            AutoSize = True
            Align = alTop
            Bevel.Mode = bmStandard
            Bevel.StandardStyle = lsNone
            TabOrder = 0
            object Image2: TImage
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 24
              Height = 36
              Margins.Bottom = 0
              Align = alLeft
              AutoSize = True
              Center = True
              Picture.Data = {
                0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
                0018000000180806000000E0773DF80000002B744558744372656174696F6E20
                54696D6500446F203133204F6B7420323030352031383A30313A3239202B3031
                3030311DF4020000000774494D45D60705170D39175CC4E99100000009704859
                7300000B1100000B11017F645F910000000467414D410000B18F0BFC61050000
                058C4944415478DA7D567F6C137514FFDC5DAFEB3AD8DCB28DD1C9700816300E
                1C1846102446820AA20241918026FE8A114C00892146FF20E26F060A0B6E9A18
                0D094B4640654060536453D2213FD7D1B26EC0BAD28EB26E6BB7FEEEF5CEF7ED
                B5763FC04B5E7AB97BF7F9BCF779DFF75E39DCEB5A772C13116105A4F83310F8
                591A9D58A0480AE2A1602F626133A2DEDFD1F6DB09B88FF593779C4CB91B0C37
                E6C96BA70544F51B4531BA7DB2D1306162493E32B3F55064028FC51189443170
                DB0777F71DF475BB6E23E0D88B869D3580CB4B5F4BFF4FF0BA6502FCEE3AE3A3
                93174E9F530AAD00842332AEF7C5E1F6C7E00B4890A2127849820819A21C43F0
                A603B2EBEA59588FBC07C7090BA1848767932678E5E24470837F2C7C7AF674C3
                A49C442CA63B80DD47EFFC01C0E956FDB2744006311309C9475032D0DF0774B4
                D9D0B6FF6DDC69394F5E8114894AF0944D837C67D313CBCBE7171767C347311C
                732489ED4ECC0DD8F0E1CA1214E567E2AF5B3CB69978201623E525F55726122F
                29643B770ECDEFBF0B44AED297A134C15AD307C6D9859F97CF2B859FC08FDEA4
                67BC1AC34CCB19B47E62A4BC33A0D168919129E2A29BC79C1F83C060BF9A493C
                AE923828AAF6C35568ABFE86BE6628128765CDD94201D7B562DD82DC2CCAFC60
                27155366D4C41D0A6383D88EEFD71723C66742A7D341100455DBAF28C0BE1E15
                3C4512A6E83A2DFDF87BD32644074F919B87C3AAFA37A7951B6BCAE74E41AB27
                0EAB3759164640278777DEC2D577C663FAA42C7AA84BBCDA6402F69DEA058243
                C95A248DC9E5720197AAF6C179B29A5CAF7178BEFEC8A2550B5E3090BEB53659
                054E5D8A9220414CC6A219E360180F34920A9EEE012A3C555F8E8F25E827D9AC
                271B60A9DC4B084D1C569EB8B16CFDE2D2013A82677B088CE7D2E08CACF33A49
                41910A5A4014C948223DDD532D12BAA7E46116890043E47BBDF5262E6CF99A50
                7EE1342F370696AE9EAFB7F64671C3A7A43360043C55BAB9052D1F1741E64508
                1A0DB444F0739B824A93A236708A80FD3202BF9F64EA1EC2D9372AC9E1274E78
                A921B8E4C57999E79D61784248EB9F22B8648567CFFD88516BF154E02C2D8FDD
                17157C749C80E29174F4CC187888407A1C7E98DEDA4F48351C96FF6A7F72CDC2
                920B44E08B8CEE7322B2756380082445CD801154B672D87EC8439A07479E229F
                4FAD83DDD285CBDBEA548225B547672DAD58DE15D210813C765AF57811DC550C
                892412A9063AEAE2CA2B02B61EB053B483E91E884681810195A0A3F1343AAB9A
                121261F1779B0BCAE654A2B000BDFE51044CA6A11862BB2622CE6540ABD55252
                1CF6D0C4D9FC03153FE81B290FEB035664F3B707D0676A2184C31C1EDE50C295
                AE361B2ACAB29DDEE85882B816CA978590055D029CD96E22D852DD4E04C90C58
                F44C1EE6DFD3EDC3E5AD7590A3F584F0273B322216D7ECD44F99B12D745F01CD
                AE6159B07B7D2E94CFF2FE6B32765511F6C67D568ADAABEACFC099EF2011761C
                3C84DBC73BC8AD96CCCA25E6916EAA0115DB8F730F3D52A6E8F4AA738AA0B804
                3B9ECD859C9C5C221DAC266AE29347DAD429CA2449F580CB6CC6B54FFFA1281B
                C9BB511D15EA25E281951598FCDC01941A4BA0D727BB58569B4B115490D43346
                E7A3E8037EF51903EFB5DB61D9710692DF4C0E47C96E90C5862F1C3D0A1F5F84
                07D77C81A26965C8CB4BCE23396DEC843063C564C08943401978DACDE8D87399
                C06D84C3861CA587E0E88DC6EEC741935B86A96B5F45DEDC35C8C9CD4146068D
                09214DC2160CADCD44430DD112E8A96F80FBD4103D67DBAC99E9CE56D4C88533
                9284F4C12468731F43FEBC0AE4CC3442573405C2B8BCC43791C13E04ED5DE8BF
                E082F74A184A94F61E982C97C81CC94573979539F222E1417B1306B2D2042190
                3FEC2831104F12B08B8C6634D8728D8D06BA1741EA9D2699115B06A41584E43B
                F637850D9640526B09F7F8DBF22F1365B71D4857E30A0000000049454E44AE42
                6082}
              ExplicitLeft = 4
              ExplicitTop = 4
              ExplicitHeight = 24
            end
            object cxLabel11: TcxLabel
              Left = 30
              Top = 0
              Align = alClient
              Caption = 
                'Fa'#231'a os ajustes necess'#225'rios nos minutos e nos valores a serem co' +
                'brados.'
              Style.TextColor = 4868682
              Properties.Alignment.Vert = taVCenter
              Properties.WordWrap = True
              Width = 444
              AnchorY = 20
            end
          end
          object lbErroM: TcxLabel
            Left = 0
            Top = 49
            Align = alTop
            AutoSize = False
            Caption = 
              'Aten'#231#227'o: O valor a ser cobrado n'#227'o pode ser menor que o valor do' +
              ' tempo anterior.'
            ParentColor = False
            Style.Color = 10023407
            Style.TextColor = clBlack
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.WordWrap = True
            Visible = False
            Height = 32
            Width = 484
            AnchorX = 242
            AnchorY = 65
          end
        end
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 2
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object panTop: TLMDSimplePanel
    Left = 0
    Top = 76
    Width = 820
    Height = 110
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 1
    object cxLabel4: TcxLabel
      Left = 329
      Top = 11
      Caption = 'minutos.'
    end
    object edTempoI: TcxSpinEdit
      Left = 276
      Top = 10
      ParentFont = False
      Properties.AssignedValues.MinValue = True
      Properties.ImmediatePost = True
      Properties.MaxValue = 60.000000000000000000
      Properties.OnChange = edValorIPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      StyleFocused.Color = 12582911
      TabOrder = 2
      OnEnter = edTempoIEnter
      Width = 51
    end
    object cxLabel3: TcxLabel
      Left = 242
      Top = 11
      Caption = 'por'
    end
    object edValorI: TcxCurrencyEdit
      Left = 149
      Top = 9
      EditValue = 0c
      Properties.Alignment.Vert = taVCenter
      Properties.OnChange = edValorIPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      StyleFocused.Color = 12582911
      TabOrder = 1
      OnEnter = edValorIEnter
      Width = 84
    end
    object cxLabel9: TcxLabel
      Left = 14
      Top = 11
      Caption = 'Valor minimo inicial:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object btnAplicar: TcxButton
      Left = 15
      Top = 67
      Width = 72
      Height = 22
      Caption = '&Aplicar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnAplicarClick
      LookAndFeel.Kind = lfFlat
    end
    object edValor1h: TcxCurrencyEdit
      Left = 149
      Top = 36
      EditValue = 0c
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.OnChange = edValorIPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleFocused.Color = 12582911
      TabOrder = 3
      OnEnter = edValor1hEnter
      Width = 84
    end
    object cxLabel1: TcxLabel
      Left = 14
      Top = 36
      Caption = 'Valor para 1h de acesso:'
      Style.TextStyle = []
    end
  end
  object panNumH: TLMDSimplePanel
    Left = 0
    Top = 186
    Width = 820
    Height = 69
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 3
    Visible = False
    object cxLabel2: TcxLabel
      Left = 14
      Top = 11
      Caption = 'Configurar tarifas para tempo de uso de at'#233':'
      Style.TextColor = clBlack
    end
    object edNumH: TcxSpinEdit
      Left = 253
      Top = 9
      Properties.ImmediatePost = True
      Properties.MaxValue = 24.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.OnChange = edNumHPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.TextStyle = [fsBold]
      StyleFocused.Color = 12582911
      TabOrder = 1
      Value = 1
      Width = 42
    end
    object cxLabel5: TcxLabel
      Left = 299
      Top = 11
      Caption = 'horas'
      Style.TextColor = clBlack
    end
    object lbComoTarifar: TcxLabel
      Left = 15
      Top = 37
      Caption = 'Como tarifar tempo de uso maior que 1h ?'
      Style.TextColor = clBlack
      Style.TextStyle = []
    end
    object edTarExtra: TcxPopupEdit
      Left = 253
      Top = 36
      Properties.ReadOnly = True
      Properties.OnInitPopup = edTarExtraPropertiesInitPopup
      Style.BorderStyle = ebsFlat
      StyleFocused.Color = 12582911
      TabOrder = 2
      Text = 'Aplicar a tarifa da 1a. hora nas demais horas'
      Width = 261
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 820
    Height = 36
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object panNome: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 820
    Height = 40
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 8
    object cxLabel7: TcxLabel
      Left = 14
      Top = 9
      Caption = 'Nome'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object edNome: TcxTextEdit
      Left = 54
      Top = 6
      ParentFont = False
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      StyleFocused.Color = 12582911
      TabOrder = 1
      Width = 179
    end
    object cxLabel8: TcxLabel
      Left = 242
      Top = 9
      Caption = 'Cor'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object edCor: TcxColorComboBox
      Left = 270
      Top = 8
      Properties.AllowSelectColor = True
      Properties.ColorBoxFrameColor = clWhite
      Properties.CustomColors = <>
      Properties.DefaultColor = clWhite
      Properties.DefaultDescription = 'Selecione uma cor'
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.ShowDescriptions = False
      Style.BorderStyle = ebsFlat
      TabOrder = 3
      Width = 117
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im24
    PopupMenuLinks = <>
    UseSystemFont = False
    Left = 464
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 614
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmSalvar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object cmTM1: TdxBarButton
      Tag = 1
      Caption = '1m'
      Category = 0
      Hint = '1m'
      Visible = ivAlways
    end
    object cmTM5: TdxBarButton
      Tag = 5
      Caption = '5m'
      Category = 0
      Hint = '5m'
      Visible = ivAlways
    end
    object cmTM10: TdxBarButton
      Tag = 10
      Caption = '10m'
      Category = 0
      Hint = '10m'
      Visible = ivAlways
    end
    object cmTM15: TdxBarButton
      Tag = 15
      Caption = '15m'
      Category = 0
      Hint = '15m'
      Visible = ivAlways
    end
    object cmTM20: TdxBarButton
      Tag = 20
      Caption = '20m'
      Category = 0
      Hint = '20m'
      Visible = ivAlways
    end
    object cmTM25: TdxBarButton
      Tag = 25
      Caption = '25m'
      Category = 0
      Hint = '25m'
      Visible = ivAlways
    end
    object cmTM30: TdxBarButton
      Tag = 30
      Caption = '30m'
      Category = 0
      Hint = '30m'
      Visible = ivAlways
    end
    object cmTM60: TdxBarButton
      Tag = 60
      Caption = '1h'
      Category = 0
      Hint = '1h'
      Visible = ivAlways
    end
    object cm1c: TdxBarButton
      Tag = 1
      Caption = '1 centavo'
      Category = 0
      Hint = '1 centavo'
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Tag = 5
      Caption = '5 centavos'
      Category = 0
      Hint = '5 centavos'
      Visible = ivAlways
    end
    object cm10c: TdxBarButton
      Tag = 10
      Caption = '10 centavos'
      Category = 0
      Hint = '10 centavos'
      Visible = ivAlways
    end
    object cm25c: TdxBarButton
      Tag = 25
      Caption = '25 centavos'
      Category = 0
      Hint = '25 centavos'
      Visible = ivAlways
    end
    object cm50c: TdxBarButton
      Tag = 50
      Caption = '50 centavos'
      Category = 0
      Hint = '50 centavos'
      Visible = ivAlways
    end
    object dxBarButton1: TdxBarButton
      Caption = 'N'#227'o arrendondar'
      Category = 0
      Hint = 'N'#227'o arrendondar'
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Repetir a mesma tarifa'#231#227'o'
      Category = 0
      Hint = 'Repetir a mesma tarifa'#231#227'o'
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton5: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton6: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton7: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton8: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton9: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton10: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton11: TdxBarButton
      Caption = '1 centavo'
      Category = 0
      Hint = '1 centavo'
      Visible = ivAlways
    end
    object dxBarButton12: TdxBarButton
      Caption = '5 centavos'
      Category = 0
      Hint = '5 centavos'
      Visible = ivAlways
    end
    object dxBarButton13: TdxBarButton
      Caption = '10 centavos'
      Category = 0
      Hint = '10 centavos'
      Visible = ivAlways
    end
    object dxBarButton14: TdxBarButton
      Caption = '25 centavos'
      Category = 0
      Hint = '25 centavos'
      Visible = ivAlways
    end
    object dxBarButton15: TdxBarButton
      Caption = '50 centavos'
      Category = 0
      Hint = '50 centavos'
      Visible = ivAlways
    end
    object cmSalvar: TdxBarLargeButton
      Caption = 'Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = 'Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object SC: TcxEditStyleController
    Style.Color = 12582911
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.Color = 12582911
    StyleFocused.TextColor = clBlack
    StyleFocused.TextStyle = [fsBold]
    Left = 368
    Top = 408
  end
  object cxEditRepository1: TcxEditRepository
    Left = 48
    Top = 128
    object tvCurEdit_ReadOnly: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Vert = taVCenter
      Properties.ReadOnly = True
      Properties.UseDisplayFormatWhenEditing = True
    end
    object tvCurEdit: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Vert = taVCenter
      Properties.UseDisplayFormatWhenEditing = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 232
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = 8750469
    end
  end
  object HC: TcxHintStyleController
    Global = False
    HintStyle.Animate = cxhaFadeIn
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'MS Sans Serif'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = ANSI_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -11
    HintStyle.Font.Name = 'Tahoma'
    HintStyle.Font.Style = [fsBold]
    HintStyle.Rounded = True
    Left = 408
    Top = 432
  end
  object PopupMenu1: TPopupMenu
    Left = 16
    Top = 288
    object porTempo1: TMenuItem
      Caption = 'por Tempo'
      object mi1m: TMenuItem
        Tag = 1
        Caption = '1 min.'
        OnClick = mi1mClick
      end
      object mi5m: TMenuItem
        Tag = 5
        Caption = '5 min.'
        OnClick = mi1mClick
      end
      object mi10m: TMenuItem
        Tag = 10
        Caption = '10 min.'
        OnClick = mi1mClick
      end
      object mi15m: TMenuItem
        Tag = 15
        Caption = '15 min'
        OnClick = mi1mClick
      end
      object mi20m: TMenuItem
        Tag = 20
        Caption = '20 min.'
        OnClick = mi1mClick
      end
      object mi30m: TMenuItem
        Tag = 30
        Caption = '30 min.'
        OnClick = mi1mClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miDigitarTempo: TMenuItem
        Caption = 'Digitar tempo'
      end
    end
    object miPorValor: TMenuItem
      Caption = 'por Valor'
    end
  end
  object pmArr: TPopupMenu
    Left = 112
    Top = 48
    object mi1c: TMenuItem
      Tag = 1
      Caption = '0,01'
      OnClick = mi1cClick
    end
    object mi5c: TMenuItem
      Tag = 5
      Caption = '0,05'
      OnClick = mi1cClick
    end
    object mi10c: TMenuItem
      Tag = 10
      Caption = '0,10'
      OnClick = mi1cClick
    end
    object mi25c: TMenuItem
      Tag = 25
      Caption = '0,25'
      OnClick = mi1cClick
    end
    object mi50c: TMenuItem
      Tag = 50
      Caption = '0,50'
      OnClick = mi1cClick
    end
  end
  object TimerLoad: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerLoadTimer
    Left = 528
    Top = 40
  end
end
