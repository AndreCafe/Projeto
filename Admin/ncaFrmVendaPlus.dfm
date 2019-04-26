inherited FrmVendaPlus: TFrmVendaPlus
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = 'Plus+'
  ClientHeight = 442
  ClientWidth = 494
  KeyPreview = True
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  ExplicitWidth = 506
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited Paginas: TcxPageControl
    AlignWithMargins = True
    Top = 130
    Width = 494
    Height = 262
    Margins.Left = 0
    Margins.Top = 4
    Margins.Right = 0
    Margins.Bottom = 0
    Properties.ActivePage = tsVenda
    ExplicitTop = 130
    ExplicitWidth = 494
    ExplicitHeight = 262
    ClientRectBottom = 262
    ClientRectRight = 494
    inherited tsWB: TcxTabSheet
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 0
      ExplicitWidth = 494
      ExplicitHeight = 262
      inherited WB: TEmbeddedWB
        Width = 494
        Height = 262
        Silent = True
        ExplicitLeft = 2
        ExplicitWidth = 506
        ExplicitHeight = 225
        ControlData = {
          4C000000F82300000C1A00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object tsVenda: TcxTabSheet
      Caption = 'tsCli'
      ImageIndex = 2
      ExplicitWidth = 0
      ExplicitHeight = 0
      object panProd: TLMDSimplePanel
        AlignWithMargins = True
        Left = 0
        Top = 5
        Width = 494
        Height = 257
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Bevel.Mode = bmEdge
        Color = clWhite
        TabOrder = 0
        object cxLabel1: TcxLabel
          Left = 2
          Top = 2
          Margins.Left = 16
          Margins.Top = 14
          Align = alTop
          AutoSize = False
          Caption = '&Selecione um parceiro / produto'
          ParentColor = False
          Style.Color = clWhite
          Style.Shadow = False
          Style.TextColor = clGray
          Style.TransparentBorder = False
          Properties.Alignment.Horz = taCenter
          Height = 16
          Width = 490
          AnchorX = 247
        end
        object pgProd: TcxPageControl
          AlignWithMargins = True
          Left = 7
          Top = 18
          Width = 480
          Height = 237
          Margins.Left = 5
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 0
          Align = alClient
          TabOrder = 1
          Properties.ActivePage = tsProd
          Properties.CustomButtons.Buttons = <>
          Properties.HideTabs = True
          LookAndFeel.NativeStyle = False
          ClientRectBottom = 237
          ClientRectRight = 480
          ClientRectTop = 0
          object tsProd: TcxTabSheet
            Caption = 'tsProd'
            ImageIndex = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object gridProd: TcxGrid
              Left = 0
              Top = 0
              Width = 480
              Height = 237
              Align = alClient
              BorderStyle = cxcbsNone
              TabOrder = 0
              LookAndFeel.Kind = lfStandard
              object tvProd: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                OnCanFocusRecord = tvProdCanFocusRecord
                DataController.DataSource = dsProd
                DataController.KeyFieldNames = 'ID'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.IncSearch = True
                OptionsBehavior.IncSearchItem = tvProdDescr
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsSelection.HideFocusRectOnExit = False
                OptionsSelection.UnselectFocusedRecordOnExit = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.DataRowHeight = 64
                OptionsView.GridLines = glNone
                OptionsView.GroupByBox = False
                OptionsView.Header = False
                object tvProdImg: TcxGridDBColumn
                  DataBinding.FieldName = 'Img'
                  PropertiesClassName = 'TcxImageComboBoxProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Images = FrmPri.logos_plus
                  Properties.Items = <
                    item
                      ImageIndex = 0
                    end>
                  Properties.ShowDescriptions = False
                  MinWidth = 170
                  VisibleForCustomization = False
                  Width = 170
                end
                object tvProdDescr: TcxGridDBColumn
                  DataBinding.FieldName = 'Descr'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Width = 466
                end
                object tvProdID: TcxGridDBColumn
                  DataBinding.FieldName = 'ID'
                  Visible = False
                  SortIndex = 0
                  SortOrder = soAscending
                end
              end
              object glProd: TcxGridLevel
                GridView = tvProd
              end
            end
          end
          object tsNaoAderiu: TcxTabSheet
            Margins.Top = 0
            Margins.Bottom = 0
            Caption = 'tsNaoAderiu'
            Color = clWhite
            ImageIndex = 1
            ParentColor = False
            object LMDSimplePanel3: TLMDSimplePanel
              AlignWithMargins = True
              Left = 10
              Top = 10
              Width = 460
              Height = 217
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              Align = alClient
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsLoweredspb
              Color = clGray
              TabOrder = 0
              object cxLabel3: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 32
                Margins.Top = 30
                Align = alTop
                Caption = 'Voc'#234' ainda n'#227'o aderiu a nenhum parceiro Plus+'
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWhite
                Style.Font.Height = -15
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                AnchorX = 230
                AnchorY = 43
              end
              object cxLabel4: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 87
                Cursor = crHandPoint
                Margins.Top = 30
                Align = alTop
                Caption = 'O que '#233' o Plus+ ?'
                ParentColor = False
                ParentFont = False
                Style.Color = clGray
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWhite
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.HotTrack = True
                Style.TextColor = clWhite
                Style.TextStyle = [fsBold]
                Style.IsFontAssigned = True
                StyleHot.TextColor = clWhite
                StyleHot.TextStyle = [fsBold, fsUnderline]
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                OnClick = cxLabel4Click
                AnchorX = 230
                AnchorY = 101
              end
            end
          end
        end
      end
    end
    object tsDone: TcxTabSheet
      Caption = 'tsDone'
      ImageIndex = 2
      object panDone: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 494
        Height = 262
        Align = alClient
        Bevel.Mode = bmEdge
        Color = clWhite
        TabOrder = 0
        object LMDSimplePanel1: TLMDSimplePanel
          AlignWithMargins = True
          Left = 166
          Top = 31
          Width = 326
          Height = 229
          Margins.Left = 4
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Bevel.Mode = bmCustom
          ParentColor = True
          TabOrder = 0
          object panDetalhes: TLMDSimplePanel
            Left = 0
            Top = 105
            Width = 326
            Height = 124
            Align = alClient
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 0
            object lbObs: TcxLabel
              Left = 78
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alClient
              AutoSize = False
              Caption = 'XXXXXXX'
              ParentColor = False
              ParentFont = False
              Style.Color = clWhite
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.Shadow = False
              Style.TextColor = clBlack
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taLeftJustify
              Properties.ShowEndEllipsis = True
              Properties.WordWrap = True
              Height = 124
              Width = 248
            end
            object cxLabel7: TcxLabel
              Left = 0
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alLeft
              AutoSize = False
              Caption = 'Observa'#231#245'es'
              ParentColor = False
              Style.Color = clWhite
              Style.Shadow = False
              Style.TextColor = clGray
              Style.TransparentBorder = False
              Properties.Alignment.Horz = taLeftJustify
              Height = 124
              Width = 78
            end
          end
          object LMDSimplePanel6: TLMDSimplePanel
            Left = 0
            Top = 42
            Width = 326
            Height = 21
            Align = alTop
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 1
            object lbIDTran: TcxLabel
              Left = 78
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alClient
              AutoSize = False
              Caption = '123987129387123123'
              ParentColor = False
              ParentFont = False
              Style.Color = clWhite
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.Shadow = False
              Style.TextColor = clBlack
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 248
            end
            object cxLabel11: TcxLabel
              Left = 0
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alLeft
              AutoSize = False
              Caption = 'ID Transa'#231#227'o:'
              ParentColor = False
              Style.Color = clWhite
              Style.Shadow = False
              Style.TextColor = clGray
              Style.TransparentBorder = False
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 78
            end
          end
          object LMDSimplePanel8: TLMDSimplePanel
            Left = 0
            Top = 21
            Width = 326
            Height = 21
            Align = alTop
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 2
            object lbDataHora: TcxLabel
              Left = 78
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alClient
              AutoSize = False
              Caption = '23/11/2011   11:51:00'
              ParentColor = False
              ParentFont = False
              Style.Color = clWhite
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.Shadow = False
              Style.TextColor = clBlack
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 248
            end
            object cxLabel13: TcxLabel
              Left = 0
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alLeft
              AutoSize = False
              Caption = 'Data/Hora:'
              ParentColor = False
              Style.Color = clWhite
              Style.Shadow = False
              Style.TextColor = clGray
              Style.TransparentBorder = False
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 78
            end
          end
          object LMDSimplePanel9: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 326
            Height = 21
            Align = alTop
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 3
            object lbParceiro: TcxLabel
              Left = 78
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alClient
              AutoSize = False
              Caption = 'Paymentz'
              ParentColor = False
              ParentFont = False
              Style.Color = clWhite
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.Shadow = False
              Style.TextColor = clBlack
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 248
            end
            object cxLabel15: TcxLabel
              Left = 0
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alLeft
              AutoSize = False
              Caption = 'Parceiro:'
              ParentColor = False
              Style.Color = clWhite
              Style.Shadow = False
              Style.TextColor = clGray
              Style.TransparentBorder = False
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 78
            end
          end
          object LMDSimplePanel7: TLMDSimplePanel
            Left = 0
            Top = 63
            Width = 326
            Height = 21
            Align = alTop
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 4
            object lbDescr: TcxLabel
              Left = 78
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alClient
              AutoSize = False
              Caption = 'XYZ'
              ParentColor = False
              ParentFont = False
              Style.Color = clWhite
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.Shadow = False
              Style.TextColor = clBlack
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 248
            end
            object cxLabel16: TcxLabel
              Left = 0
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alLeft
              AutoSize = False
              Caption = 'Descri'#231#227'o'
              ParentColor = False
              Style.Color = clWhite
              Style.Shadow = False
              Style.TextColor = clGray
              Style.TransparentBorder = False
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 78
            end
          end
          object LMDSimplePanel10: TLMDSimplePanel
            Left = 0
            Top = 84
            Width = 326
            Height = 21
            Align = alTop
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 5
            object lbPIN: TcxLabel
              Left = 78
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alClient
              AutoSize = False
              Caption = 'Parceiro:'
              ParentColor = False
              ParentFont = False
              Style.Color = clWhite
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.Shadow = False
              Style.TextColor = clBlack
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 248
            end
            object cxLabel18: TcxLabel
              Left = 0
              Top = 0
              Margins.Left = 16
              Margins.Top = 14
              Align = alLeft
              AutoSize = False
              Caption = 'PIN'
              ParentColor = False
              Style.Color = clWhite
              Style.Shadow = False
              Style.TextColor = clGray
              Style.TransparentBorder = False
              Properties.Alignment.Horz = taLeftJustify
              Height = 21
              Width = 78
            end
          end
        end
        object panImg: TLMDSimplePanel
          Left = 2
          Top = 31
          Width = 160
          Height = 229
          Align = alLeft
          Bevel.Mode = bmCustom
          ParentColor = True
          TabOrder = 1
          object imgParceiro: TImage
            AlignWithMargins = True
            Left = 5
            Top = 0
            Width = 152
            Height = 54
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            AutoSize = True
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              00980000003608060000003BD450BF0000000473424954080808087C08648800
              0000097048597300000B1200000B1201D2DD7EFC0000001C74455874536F6674
              776172650041646F62652046697265776F726B732043533571B5E33600000016
              744558744372656174696F6E2054696D650031312F30382F3131DFA8C5720000
              06444944415478DAED9C31332D4D1086F7561110101010080808082412898040
              C01FF437080404041201010101818080808040F07DF56CDD57F59DBBB3BBF79C
              33C78EEAB74A5D76677B7ABADFEDEDEDE9BDBFF6F6F6FE2B1C8E44F805C17676
              76BE5B0FC70FC4C1C18113CC910E4E30475238C11C49E10473248513CC91144E
              30475238C11C49E1046BC0FBFB7BF1F1F1518C8D8D15E3E3E3DFAD4E76C88E60
              6F6F6FC5D5D555F4FCDCDC5CF93328DCDCDC14B7B7B7C5E2E262B1B4B4F4DDCB
              CF0ED911ECE5E5A5383B3B2B4647478B898989BFCE3BC1BA856C0936353555AC
              AFAF279FCF09D61F7E24C11E1E1ECA9FC9C9C9E2F1F1B1CCA188789084631717
              177F1C5B585888CE2782CDCCCC94F9188F6840945C5E5E2E65683EC67C7E7E96
              3A320FE7198F8CA7A7A7F23A7239AE85AC1CBBBBBBFB1A2B280D40F6DADA5AAD
              8CAE235B82F1785C5959F9EB3CC4132900CE989D9D2D1D2984C73636362A1FB7
              20948563211304859810C38EB17AACAEAE16A7A7A725E9B84E64E46FAE8390C7
              C7C7E5F8EDEDEDF23CB8BEBE2E75E31A6E803A1975374717902DC162D8DDDDFD
              23EA1001C0E5E5E55794098FD53DFEAA6411C9440C3B1FCEC7E9CA0125DF12C1
              DE20109BDF39061975DDD1D151496022B4A2639D8C2E235B82B5896096386D8F
              85888D393939291F5D90E0F9F9B972CCE1E1611969386EA1680739210F441459
              780C9E9F9F97D1726B6BAB958C2E235B82D5E560C32098224F1DC1F6F7F76BD7
              0239200FD1907F3737374B393662B591D16538C18640B02612D847F5FDFDFD17
              D928ECB695D15538C17A201804E0D10548CE49C8EB1EA336BFAA0263182BD87C
              AFAD8CAE225B82C572307217A2C1A00986D35596E02D8F3970388E8FC9B1C93F
              E390015920242F0AF60651620F2C99FE454617912DC16250323C68828580E038
              17C7D7C9D1E32F848D5200C2405CE411157B91D1456447301E4F2A7656810806
              C20DEAAA4DEB361BD91A035E5F5FCBF9198B7355B76A9283BE147C056A7061DD
              4DEB8A6D81B591D145644730475E70823992C209E6480A279823299C608EA470
              823992C2099611A8B78161F481517AA1F646D9A59F1D0427584618E6BEE4A03A
              879D601901A7039C3E8CB93A453085EFE9E9E972DB83CA345569C2B9AD38A3B8
              CE03FB918664F0B7AD8813AA09D9C866C175320063E94AA0F20ED083CABBADBE
              C7F4A77D591DA3E8C0F68F74A1578B1FE45BB9766EC9A1D54672B41EF4D65A34
              17E7649FF0BC644BE7F011D934573F36EA1CC16CDF92DDAE41595A4FD4EACBBE
              1A4071B63F6414367269B4C381612BB09AEE68C8C3207532309C5A8CD18379B5
              B584A162777F4C7F7E675EE4A845475B428A286A9DB672182FE7322F7A496F08
              C539E4CB8131DB5807878FC83673F56AA3CE12CC92430E09FBCFD503CF026947
              C1D02C1CD8EE4E603B3C5968930CFE66D3386C7166331ABD62FB774DFA2B4A10
              756CC4D12774DAA0961CF425D240447E97436DA7046B43065152EB628DE1BAE4
              F418C1EC5CE8A2D69F7E6CD45982D904D47619B078C813EB22D0DD65A3150BB5
              510DE335C9C0D8CC69BB1D7AD55F51259C0FE3E31039A5CAE9F6238EB02D3A84
              9DC7466EF5E3AB4B2346B0AAB9066123E4CB2FBD62680403552D2DE19DA2D614
              0CCDD8368D7D5606C65034001851B94E5D725CA57FA81BEB51C76988D0E9313B
              549518622D414213C1DACCD58B8D90DFEFF7A09D2398BA3B15F6EDDDD8C67892
              0119C9D76C6B4F9B1C2C4630E6531F1AF3F3C2816374030C8260B1AFD295F30D
              8A606D6D9415C1DA3E2281DA8495BC329EEBDA84FF309C733D8F59E53A316355
              E92FB944D3919191AF1CC57E24DBC6E96D1F914DF9CEBFCC35081BD9179A5E31
              3482E118DDEDB1E45377AF8C016C026D7BE16332F4F535249061626FA755FA2B
              9F09936CEEF43031B67AD639DD7E4769D78903D16B7E7EBEF27C9878B721D8A0
              6CD4B94A7E9B70DD54A6A8325218319A64D87CC696036CB9A44EFF985CFB6A6F
              E50A754E0FF56E2A53C44A076D0836281B75EE2DB26A9F0C25F9A44B05521DAB
              2B005A23E1D4B0E8DA2483632A88EA3C092C24AF7BA394B390630B9D36E2E9FF
              8850119973ACCFAEBB6EBFB0AAD04AF4D2FAC2F36ACDE6A74A76D35CFDD8A873
              112C77E4FEFD6157E104FB0D27581A38C17E432588AE7F67981B9C608EA47082
              3992C209E6480A279823299C608EA470823992C209E6480A27982329BE08F6DD
              8A387E2EFE07C1B1E0ED3AE807850000000049454E44AE426082}
          end
        end
        object cxLabel2: TcxLabel
          Left = 2
          Top = 2
          Margins.Left = 16
          Margins.Top = 14
          Align = alTop
          AutoSize = False
          Caption = 'Dados de Transa'#231#227'o Gerados pelo Parceiro'
          ParentColor = False
          Style.Color = clWhite
          Style.Shadow = False
          Style.TextColor = 11316396
          Style.TransparentBorder = False
          Properties.Alignment.Horz = taCenter
          Height = 29
          Width = 490
          AnchorX = 247
        end
      end
    end
  end
  object panCli: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 41
    Width = 494
    Height = 85
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 1
  end
  object cbRecibo: TcxCheckBox
    Left = 331
    Top = 8
    TabStop = False
    AutoSize = False
    Caption = 'Emitir Recibo'
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Visible = False
    Height = 21
    Width = 86
  end
  object panTot: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 397
    Width = 494
    Height = 45
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 7
    Visible = False
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 48
    Top = 339
    DockControlHeights = (
      0
      0
      36
      0)
    object barTopo: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Controles'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 164
      FloatTop = 132
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMaq'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRealizarVenda'
        end
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          Visible = True
          ItemName = 'dxBarControlContainerItem1'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Enabled = False
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 28
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      GlyphLayout = glLeft
    end
    object cmRealizarVenda: TdxBarLargeButton
      Caption = 'Realizar &Venda'
      Category = 0
      Hint = 'Realizar Venda'
      Visible = ivNever
      LargeImageIndex = 15
      OnClick = cmRealizarVendaClick
      GlyphLayout = glLeft
    end
    object cmMaq: TdxBarStatic
      Caption = 'Maq. 1'
      Category = 0
      Hint = 'Maq. 1'
      Style = FrmPri.cxStyle30
      Visible = ivAlways
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Align = iaRight
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivNever
      Control = cbRecibo
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 48
    Top = 371
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clGray
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBackground
      TextColor = clBackground
    end
  end
  object tPT: TnxTable
    Database = Dados.db
    Timeout = 10000
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = tPTCalcFields
    TableName = 'plusTran'
    IndexName = 'IID'
    Left = 80
    Top = 371
    object tPTSeq: TAutoIncField
      FieldName = 'Seq'
    end
    object tPTID: TGuidField
      FieldName = 'ID'
      Size = 38
    end
    object tPTIDTranParceiro: TStringField
      FieldName = 'IDTranParceiro'
      Size = 50
    end
    object tPTOK: TBooleanField
      FieldName = 'OK'
    end
    object tPTCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tPTDataHoraParceiro: TDateTimeField
      FieldName = 'DataHoraParceiro'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tPTDataHoraNex: TDateTimeField
      FieldName = 'DataHoraNex'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tPTcodParceiro: TStringField
      FieldName = 'codParceiro'
      Size = 15
    end
    object tPTDescr: TnxMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object tPTObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tPTFunc: TStringField
      FieldName = 'Func'
    end
    object tPTValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tPTCusto: TCurrencyField
      FieldName = 'Custo'
    end
    object tPTSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tPTCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tPTTranID: TIntegerField
      FieldName = 'TranID'
    end
    object tPTMaq: TWordField
      FieldName = 'Maq'
    end
    object tPTQuant: TFloatField
      FieldName = 'Quant'
    end
    object tPTPIN: TnxMemoField
      FieldName = 'PIN'
      BlobType = ftMemo
    end
    object tPTEmailCliente: TStringField
      FieldName = 'EmailCliente'
      Size = 100
    end
    object tPTIDProdutoParceiro: TStringField
      FieldName = 'IDProdutoParceiro'
      Size = 40
    end
    object tPTIDProdutoNex: TIntegerField
      FieldName = 'IDProdutoNex'
    end
    object tPTImg: TGraphicField
      FieldName = 'Img'
      BlobType = ftGraphic
    end
    object tPTNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tPTHoraParceiro: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'HoraParceiro'
      DisplayFormat = 'hh:mm:ss'
      Calculated = True
    end
    object tPTHoraNex: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'HoraNex'
      DisplayFormat = 'hh:mm:ss'
      Calculated = True
    end
    object tPTNomeParceiro: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeParceiro'
      LookupDataSet = tPlusP
      LookupKeyFields = 'CodParceiro'
      LookupResultField = 'NomeParceiro'
      KeyFields = 'codParceiro'
      Size = 40
      Lookup = True
    end
    object tPTSincronizado: TBooleanField
      FieldName = 'Sincronizado'
    end
    object tPTImgParceiro: TIntegerField
      FieldKind = fkLookup
      FieldName = 'ImgParceiro'
      LookupDataSet = tParceiro
      LookupKeyFields = 'CodParceiro'
      LookupResultField = 'KeyIndex'
      KeyFields = 'codParceiro'
      Lookup = True
    end
  end
  object tTran: TnxTable
    Database = Dados.db
    Timeout = 10000
    TableName = 'Tran'
    IndexName = 'IID'
    Left = 16
    Top = 339
    object tTranID: TAutoIncField
      FieldName = 'ID'
    end
    object tTranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tTranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object tTranFunc: TStringField
      FieldName = 'Func'
    end
    object tTranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tTranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tTranObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tTranCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object tTranCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tTranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tTranMaq: TWordField
      FieldName = 'Maq'
    end
    object tTranNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tTranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tTranDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object tTranDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tTranQtdTempo: TFloatField
      FieldName = 'QtdTempo'
    end
    object tTranCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object tTranFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tTranTotLiq: TCurrencyField
      FieldName = 'TotLiq'
    end
    object tTranplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tTranplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
  end
  object dsPT: TDataSource
    DataSet = tPT
    Left = 112
    Top = 371
  end
  object tPlusP: TnxTable
    Database = Dados.db
    TableName = 'plusP'
    Password = 'CEWk4jhsad3f'
    Left = 16
    Top = 371
    object tPlusPCodParceiro: TStringField
      FieldName = 'CodParceiro'
      Size = 15
    end
    object tPlusPNomeParceiro: TStringField
      FieldName = 'NomeParceiro'
      Size = 40
    end
    object tPlusPurlTimeout: TStringField
      FieldName = 'urlTimeout'
      Size = 255
    end
    object tPlusPKeyIndex: TWordField
      FieldName = 'KeyIndex'
    end
    object tPlusPAdesao: TBooleanField
      FieldName = 'Adesao'
    end
  end
  object tProd: TnxTable
    Database = Dados.db
    Timeout = 10000
    Filter = 'Ativo = True'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'IplusParceiroProd'
    Left = 80
    Top = 339
    object tProdCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Size = 15
    end
    object tProdUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object tProdPreco: TCurrencyField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
    end
    object tProdObs: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProdImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tProdEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tProdCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProdEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tProdEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tProdEstoqueFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoqueFinal'
      Calculated = True
    end
    object tProdDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tProdCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProdSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProdPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProdNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProdID: TAutoIncField
      FieldName = 'ID'
    end
    object tProdFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object tProdFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tProdFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tProdEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tProdEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tProdAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tProdAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object tProdEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object tProdplus: TBooleanField
      FieldName = 'plus'
    end
    object tProdplusURL: TnxMemoField
      FieldName = 'plusURL'
      BlobType = ftMemo
    end
    object tProdplusCodParceiro: TStringField
      FieldName = 'plusCodParceiro'
      Size = 15
    end
    object tProdplusCodProduto: TStringField
      FieldName = 'plusCodProduto'
      Size = 15
    end
    object tProdAtivo: TBooleanField
      FieldName = 'Ativo'
    end
  end
  object dsProd: TDataSource
    DataSet = mtProd
    Left = 112
    Top = 339
  end
  object mtProd: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'mtProdIndex1'
        Fields = 'ID'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 144
    Top = 371
    object mtProdImg: TIntegerField
      FieldName = 'Img'
    end
    object mtProdDescr: TStringField
      FieldName = 'Descr'
      Size = 100
    end
    object mtProdID: TIntegerField
      FieldName = 'ID'
    end
    object mtProdIDProd: TIntegerField
      FieldName = 'IDProd'
    end
  end
  object tParceiro: TnxTable
    Database = Dados.db
    Timeout = 10000
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'plusP'
    Password = 'CEWk4jhsad3f'
    IndexName = 'ICodParceiro'
    Left = 144
    Top = 339
    object tParceiroCodParceiro: TStringField
      FieldName = 'CodParceiro'
      Size = 15
    end
    object tParceiroNomeParceiro: TStringField
      FieldName = 'NomeParceiro'
      Size = 40
    end
    object tParceirourlTimeout: TStringField
      FieldName = 'urlTimeout'
      Size = 255
    end
    object tParceiroKeyIndex: TWordField
      FieldName = 'KeyIndex'
    end
    object tParceiroAdesao: TBooleanField
      FieldName = 'Adesao'
    end
  end
end
