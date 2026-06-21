object FrmRA: TFrmRA
  Left = 125
  Top = 174
  Caption = 'Relat'#243'rios de Atendimento'
  ClientHeight = 541
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 694
    Height = 541
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 0
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 75
      Width = 694
      Height = 32
      Align = alTop
      Bevel.BorderSides = [fsBottom]
      Bevel.Mode = bmEdge
      TabOrder = 0
      object btnImpGrid: TLMDSpeedButton
        Left = 62
        Top = 2
        Width = 92
        Height = 28
        Caption = 'Imprimir Grid'
        OnClick = btnImpGridClick
        Glyph.Data = {
          5A010000424D5A01000000000000760000002800000014000000130000000100
          040000000000E400000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007777777777777777777700007777777777777777777700007777
          0000000000077777000077707777777770707777000077000000000000070777
          0000770777777BBB770007770000770777777888770707770000770000000000
          0007707700007707777777777070707700007770000000000707007700007777
          0FFFFFFFF07070770000777770F00000F00007770000777770FFFFFFFF077777
          00007777770F00000F07777700007777770FFFFFFFF077770000777777700000
          000077770000777777777777777777770000777777777777777777770000}
        Align = alLeft
        ButtonStyle = ubsFlat
      end
      object btnExpGrid: TLMDSpeedButton
        Left = 154
        Top = 2
        Width = 72
        Height = 28
        Caption = 'Exportar'
        OnClick = btnExpGridClick
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
        Align = alLeft
        ButtonStyle = ubsFlat
      end
      object btnEditar: TLMDSpeedButton
        Left = 2
        Top = 2
        Width = 60
        Height = 28
        Caption = 'Editar'
        OnClick = btnEditarClick
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
        Align = alLeft
        ButtonStyle = ubsFlat
      end
    end
    object LMDSimplePanel2: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 694
      Height = 75
      Constraints.MinWidth = 694
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 470
        Height = 75
        Align = alLeft
        Caption = 'Filtros'
        TabOrder = 0
        object btnAplicar: TPngSpeedButton
          Left = 405
          Top = 12
          Width = 52
          Height = 55
          Caption = 'Aplicar'
          Flat = True
          Layout = blGlyphTop
          Spacing = 0
          OnClick = btnAplicarClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
            F40000002B744558744372656174696F6E2054696D6500467220323820466562
            20323030332031313A35313A3531202B303130307CE9F46F0000000774494D45
            000000000000000973942E000000097048597300000AF000000AF00142AC3498
            0000079A4944415478DA9D570B5054D719FE2FCB531E12052A83DA984E3B9A01
            7C54F330A666ACD3828FB1D31926265A67AAED8C8F890D58533A29530B663AA9
            388D09108DD0D6663A6DBA38D6304A2AF585024D8500865735A0BCDFCB735996
            DDE5F6FBAE7BD6AD11239C998F73EFD973CEF79DFFFC8F8B2653B443870EF92C
            5FBE7CB1AFAFEFB376BB3DDEE5727D43D7F5F90E8763EEE4E464B8D3E9F4C3B3
            A0778E8D8D0DA1B38C8F8F77606E13503F3A3AFAD99933676EF6F6F6DAB0DD24
            A03F8C477B7060606060754F4FCF8FBABABA3662A3F9D85403A1F8F8F888BFBF
            BF0406064A50509004040488C96432DE21D2586BB3D964787858B05E5A5B5BF5
            BB77EFF660F85F10989F9D9D7D11CF6380EBA102A0F4056CF0BBCECECEE7EFDC
            B9A30D0E0E7A0848465080EA0912F3773E53949F9F9FD1135CCB565D5D2D57AE
            5CD19B9A9A6A878686DE3E75EAD4C718B62A21860090FE026ADFAAA8A830C102
            C606B366CDF21029626F28010F8E79CF5722D89A9B9B2537375707D71FF2F2F2
            7E83A12EC0A155555525C1641F5DBE7C5953277814B13738FF6102D433AF0EBE
            618062383F333353BF74E9D23B454545C720A05DBB70E142F1F5EBD75FC45D7B
            CC3915B9BA0ED52B01EADD7B0D9F2726263C02E0C4A2699A31B66FDFBE96FCFC
            FC6408B8A29D3F7FFE064EBF926ABD053CECC4FCDD1B14A09E1F9C473246893B
            520C01C69D637CF7EEDD3D66B39916F88B06A748C3607A5959998486867EC9E1
            1E245551A004A8676F4B704C11AB9E07E49E084DC9CACA3A5B5E5EFE1904FC59
            DBBC7973CCAE5DBB0A11B771F458363AA0F7A6DEC40A9C432754EFDE73280C21
            6C909358B5D2D2523971E2444D4141C10D58E412863E6114F8E14ED640483E94
            CE696F6F37E2988B49121C1CFC7FE41C53CFEAB46A9CF3D8D3CC343941DFEAE8
            E8105CB5949494F49E3B77EE1388FB1CBCE7802F541E08C9C8C87875F5EAD539
            0B162C30218988C56291FEFE7EC37C4C42DC9C624242420C12F614C05E3DD3D3
            95F32191495D5D9DD4D4D4487D7DBDC0C28EE2E2E2BF61CF66F09D076E321F68
            5E09E98923478EFC6AC58A15AFAF5BB74E43D2E0220F98E56815E548144542F6
            24E44989EEEE6E696B6B33C473BEDB0A3AC2FDEF10C4D82F04FE030C323D7BA7
            621F98323A3D3DFDE4DAB56B13E3E3E3C56AB51A77492B904411F11D75C148BB
            CC9848B5C65C82CF04D71114DFD2D25274F5EAD5BBE0603A2E06BADDF5E14BB5
            C01716787AE7CE9DE6C4C4C46F454545191B2872059E8A27A7005A8AFDC8C888
            01258242B91629BEB6B0B0B01CCE5886FD8B8016C0396531420BDCB66DDBBA35
            6BD6FC352929298C44EA44245716E135909CA00FA893939873DC57328CAAFA31
            FA5AF7BDFF17B03FB21ABAC7429293937F1C1717F7FBAD5BB7FAF024DE66A510
            3692F30A2860EE9E5764D2C72A0EFBE4BDDA8B3F0EA76B54D3F409DB903EB2D1
            26DF674900C6BF4A801A9F9B969696015FD8BD69D326C3A9E888EA844A405F5F
            9FCC9B374F16EFF99E4425EF12B10CC0BD7A817EC022D6BE7EA9B969B53CD7AD
            BF892505CCFF8F2380CD04A79C9F9292F2A7F5EBD7BF04DF30429322083A212B
            27730605C4FD2C51225FFB89C8E91C64167FDCB28FB189654297860647EF0B9D
            93B978CD031A1F57009B5F6C6C6C3C93D4F6EDDB9F8C88883048791DCC707030
            23ECA2A3A365E51B9B644ECA6B22FF781FF14401B80388B48CBBA4B1CEDEFF4C
            9B2120D72D407F5C016C411090B074E9D20FF7EEDD1BCCD8A6084602930D633E
            262646BE93F603093D98020139F705B820D2E69296FA71CBCA6617C94FCE4400
            E784EED8B163CFA2458B7E8B4AA6F1DE99841A1B1B055F4F86051233B74AF0CF
            DF8080ECFB0260A59E31A0766C28AEC9F901F6F9602602D4BC88FDFBF7571F3B
            762C9AF5820E480BD01AE1E1E1B2EACD04094BFDA5C8D92C08F0BB2700E8B43A
            A5B3666CE4DB8DCE136E0BDC76EFA94F47009B2F42F3F3A3478F2E66180EBC9D
            2A5117B0DFBC3071D87471CE7248F08ED75162DEC5D6F84875BA0C016DC3F816
            E89DD04D030E873FBED05C434E69B5EA19CFF60BEE4A86A7234083804F0F1F3E
            BC8AC9A9A1A14102F2326589EF3591A71622669E80B744885422D5BB4C1E01E2
            7019676D197288ADCFAE7F78D3FEC7B7AC5285FDFE0DD44E4B0042B2283535F5
            BBB367CF362A1D3F34BF76FAA43C1356253E9101A86D285693083F879BD87D0D
            24B7F6D8F5F72AC7CCEF5B0549C2A807A540D77404C88103074EC30F7E48A7AB
            ADAD3504A0D0486CF1597929FAB668518122A31031719FBC6970426C9DE37A4E
            F9A8396754909D04269312A003704E4B00C87F8D227528212141505E3D025817
            E67C94D3FACAB291F95A54B026A3138605BEB03864BCC3AA1FFF74D89C3D6C90
            AB931BE4D37542D9B265CB37172E5C5872F0E0C148A663FA01FE9F30AC81702C
            5D51FECF96F4A498974D5141DAED0E7C92B58FE859A583E6E3431E729EBC53BE
            A21A3EAA056CD8B0612344BCBB6CD9B218966BE684CACA4AB975EBD6E58B172F
            DE381923E1AB9E8FFCA909E63F7EB5DF9C3D3035F94C04707E18889F5BB264C9
            CB9191912FA25E3C89D43C70EDDAB502D4850AFC5E61FEBABC5A3D26A1877B65
            04EF655391CF4480470480D89358E0296036607113B1F687024FCBBDAF9EBAA9
            C8672A40ADF373138500C8BDC28F04D462E31F4FFE1EEC9E6B9D8A9CED7FAC6D
            90DE458D6B020000000049454E44AE426082}
        end
        object cbCon: TCheckBox
          Left = 16
          Top = 19
          Width = 105
          Height = 17
          Caption = 'Por Consolida'#231#227'o'
          TabOrder = 0
        end
        object edCon: TEdit
          Left = 16
          Top = 38
          Width = 105
          Height = 21
          TabOrder = 1
        end
        object cbStatusCli: TCheckBox
          Left = 134
          Top = 19
          Width = 108
          Height = 17
          Caption = 'Por Status Cliente'
          TabOrder = 2
        end
        object edStatusCli: TComboBox
          Left = 134
          Top = 38
          Width = 124
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 3
          Text = 'Pendente'
          Items.Strings = (
            'N'#227'o Paga'
            'Pendente'
            'Aprovado'
            'Aprovado Diverg.'
            'N'#227'o Cobrar')
        end
        object edStatusTec: TComboBox
          Left = 271
          Top = 38
          Width = 124
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          Text = 'Pendente'
          Items.Strings = (
            'Pendente'
            'Aprovado'
            'Aprovado Diverg.'
            'Reprovado')
        end
        object cbStatusTec: TCheckBox
          Left = 271
          Top = 19
          Width = 116
          Height = 17
          Caption = 'Por Status T'#233'cnico'
          TabOrder = 5
        end
      end
      object GroupBox2: TGroupBox
        Left = 470
        Top = 0
        Width = 224
        Height = 75
        Align = alLeft
        Caption = 'Agrupar por'
        TabOrder = 1
        object btnNenhum: TLMDSpeedButton
          Left = 176
          Top = 15
          Width = 46
          Height = 58
          Caption = 'Nenhum'
          OnClick = btnNenhumClick
          Align = alLeft
          ButtonStyle = ubsDelphiFlat
          MultiLine = True
          ExplicitLeft = 126
        end
        object btnAgrupaTec: TLMDSpeedButton
          Left = 86
          Top = 15
          Width = 44
          Height = 58
          Caption = 'T'#233'cnico'
          OnClick = btnAgrupaTecClick
          Align = alLeft
          ButtonStyle = ubsDelphiFlat
          ExplicitLeft = 82
        end
        object btnAgrupaClienteRA: TLMDSpeedButton
          Left = 44
          Top = 15
          Width = 42
          Height = 58
          Caption = 'Cliente'#13#10'+'#13#10'RA'
          OnClick = btnAgrupaClienteRAClick
          Align = alLeft
          ButtonStyle = ubsDelphiFlat
          MultiLine = True
        end
        object btnAgrupaCliente: TLMDSpeedButton
          Left = 2
          Top = 15
          Width = 42
          Height = 58
          Caption = 'Cliente'
          OnClick = btnAgrupaClienteClick
          Align = alLeft
          ButtonStyle = ubsDelphiFlat
        end
        object btnAgrupaTecRA: TLMDSpeedButton
          Left = 130
          Top = 15
          Width = 46
          Height = 58
          Caption = 'T'#233'cnico '#13#10'+ '#13#10'RA'
          OnClick = btnAgrupaTecRAClick
          Align = alLeft
          ButtonStyle = ubsDelphiFlat
          MultiLine = True
          ExplicitLeft = 126
        end
      end
    end
    object LMDSplitterPanel1: TLMDSplitterPanel
      Left = 0
      Top = 107
      Width = 694
      Height = 434
      Bevel.Mode = bmCustom
      Bars = <
        item
          OldPosition = -1
          Position = 312
          PosPercent = 73
          Width = 6
        end>
      Orientation = spHorzDown
      Align = alClient
      TabOrder = 2
      object LMDSplitterPane1: TLMDSplitterPane
        Bevel.Mode = bmStandard
        object Grid: TcxGrid
          Left = 0
          Top = 0
          Width = 692
          Height = 310
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object tvDesp: TcxGridDBBandedTableView
            OnDblClick = btnEditarClick
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DM.dsRAItem
            DataController.Filter.MaxValueListCount = 1000
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Filter.Active = True
            DataController.KeyFieldNames = 'Tecnico;Cliente;ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Filtering.ColumnPopup.MaxDropDownItemCount = 12
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            OptionsView.Indicator = True
            Preview.AutoHeight = False
            Preview.MaxLineCount = 2
            Styles.Content = cxStyle1
            Styles.Footer = cxStyle3
            Styles.Header = cxStyle2
            Styles.Indicator = cxStyle2
            Styles.Preview = cxStyle4
            Styles.BandHeader = cxStyle5
            Bands = <
              item
              end
              item
                Caption = 'Cliente'
              end
              item
                Caption = 'T'#233'cnico'
              end>
            object tvDespNumF1: TcxGridDBBandedColumn
              Caption = 'N.Cons.'
              DataBinding.FieldName = 'NumF'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Width = 70
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object tvDespNomeCli1: TcxGridDBBandedColumn
              Caption = 'Cliente'
              DataBinding.FieldName = 'NomeCli'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownRows = 7
              Properties.ImmediateDropDown = False
              Properties.KeyFieldNames = 'ID'
              Properties.ListColumns = <
                item
                  FieldName = 'Nome'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.MaxLength = 40
              Properties.ReadOnly = False
              Width = 165
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object tvDespNomeTec1: TcxGridDBBandedColumn
              Caption = 'T'#233'cnico'
              DataBinding.FieldName = 'NomeTec'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownRows = 7
              Properties.ImmediateDropDown = False
              Properties.KeyFieldNames = 'ID'
              Properties.ListColumns = <
                item
                  FieldName = 'Nome'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.MaxLength = 40
              Properties.ReadOnly = False
              Width = 160
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object tvDespChave1: TcxGridDBBandedColumn
              Caption = 'RA'
              DataBinding.FieldName = 'Chave'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.MaxLength = 35
              Properties.ReadOnly = False
              Width = 138
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object tvDespDataI1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'Data'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DateButtons = [btnClear, btnToday]
              Properties.DateOnError = deToday
              Properties.InputKind = ikRegExpr
              HeaderAlignmentHorz = taCenter
              Width = 79
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object tvDespTipo: TcxGridDBBandedColumn
              DataBinding.FieldName = 'Tipo'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownRows = 7
              Properties.Items = <
                item
                  Description = 'KM'
                  ImageIndex = 0
                  Value = '0'
                end
                item
                  Description = 'Ped'#225'gio'
                  ImageIndex = 1
                  Value = '1'
                end
                item
                  Description = 'Alimenta'#231#227'o'
                  ImageIndex = 2
                  Value = '2'
                end
                item
                  Description = 'Hospedagem'
                  ImageIndex = 3
                  Value = '3'
                end
                item
                  Description = 'Outros'
                  ImageIndex = 4
                  Value = '4'
                end>
              Properties.ReadOnly = False
              MinWidth = 16
              Width = 100
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object tvDespValor1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'Valor'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.AssignedValues.MaxValue = True
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
              Properties.Nullable = False
              Properties.ReadOnly = False
              OnGetDisplayText = tvDespValor1GetDisplayText
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object tvDespStatusCli1: TcxGridDBBandedColumn
              Caption = 'Status'
              DataBinding.FieldName = 'StatusCli'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DropDownRows = 7
              Properties.Items = <
                item
                  Description = 'N'#227'o Paga'
                  ImageIndex = 0
                  Value = '0'
                end
                item
                  Description = 'Pendente'
                  ImageIndex = 1
                  Value = '1'
                end
                item
                  Description = 'Aprovado'
                  ImageIndex = 2
                  Value = '2'
                end
                item
                  Description = 'Aprov.Diverg.'
                  ImageIndex = 3
                  Value = '3'
                end
                item
                  Description = 'N'#227'o Cobrar'
                  ImageIndex = 4
                  Value = '4'
                end>
              Properties.ReadOnly = False
              MinWidth = 16
              Width = 87
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object tvDespValorCli1: TcxGridDBBandedColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'ValorCli'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.AssignedValues.MaxValue = True
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
              Properties.Nullable = False
              Properties.ReadOnly = False
              OnGetDisplayText = tvDespValorCli1GetDisplayText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 76
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object tvDespStatusTec1: TcxGridDBBandedColumn
              Caption = 'Status'
              DataBinding.FieldName = 'StatusTec'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DropDownRows = 7
              Properties.Items = <
                item
                  Description = 'Pendente'
                  ImageIndex = 0
                  Value = '0'
                end
                item
                  Description = 'Aprovado'
                  ImageIndex = 1
                  Value = '1'
                end
                item
                  Description = 'Aprov.Diverg.'
                  ImageIndex = 2
                  Value = '2'
                end
                item
                  Description = 'Reprovado'
                  ImageIndex = 3
                  Value = '3'
                end>
              Properties.ReadOnly = False
              MinWidth = 16
              Width = 100
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object tvDespValorTec1: TcxGridDBBandedColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'ValorTec'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.AssignedValues.MaxValue = True
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
              Properties.Nullable = False
              Properties.ReadOnly = False
              OnGetDisplayText = tvDespValorTec1GetDisplayText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Position.BandIndex = 2
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
          end
          object glDesp: TcxGridLevel
            GridView = tvDesp
          end
        end
      end
      object LMDSplitterPane2: TLMDSplitterPane
        Bevel.Mode = bmStandard
        object GridRAOS: TcxGrid
          Left = 0
          Top = 0
          Width = 692
          Height = 114
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object tvRAOS: TcxGridDBBandedTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DM.dsRAOS
            DataController.Filter.MaxValueListCount = 1000
            DataController.KeyFieldNames = 'Tecnico;Cliente;DataOS;IDOS'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Filtering.ColumnPopup.MaxDropDownItemCount = 12
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            OptionsView.Indicator = True
            Preview.AutoHeight = False
            Preview.MaxLineCount = 2
            Styles.Content = cxStyle6
            Styles.Footer = cxStyle8
            Styles.Header = cxStyle7
            Styles.Indicator = cxStyle7
            Styles.Preview = cxStyle9
            Styles.BandHeader = cxStyle10
            Bands = <
              item
                Caption = 'OS'#39's'
                HeaderAlignmentHorz = taLeftJustify
              end>
            object tvRAOSDataOS1: TcxGridDBBandedColumn
              Caption = 'Data da OS'
              DataBinding.FieldName = 'DataOS'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DateButtons = [btnClear, btnToday]
              Properties.DateOnError = deToday
              Properties.InputKind = ikRegExpr
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 120
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object tvRAOSIDOS1: TcxGridDBBandedColumn
              Caption = 'ID-OS (Hora de Inicio)'
              DataBinding.FieldName = 'IDOS'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 134
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object tvRAOSHoras1: TcxGridDBBandedColumn
              Caption = 'Tempo'
              DataBinding.FieldName = 'Horas'
              PropertiesClassName = 'TcxTimeEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.ReadOnly = False
              Properties.TimeFormat = tfHourMin
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 116
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
          end
          object glRAOS: TcxGridLevel
            GridView = tvRAOS
          end
        end
      end
    end
  end
  object dlgExp: TSaveDialog
    FileName = 'Exportar'
    Filter = 'Excel|*.xls|Html|*.htm|Texto|*.txt'
    FilterIndex = 0
    Left = 248
    Top = 225
  end
  object CP: TdxComponentPrinter
    CurrentLink = cplDesp
    PreviewOptions.Caption = 'Visualiza'#231#227'o de Impress'#227'o'
    Version = 0
    Left = 64
    Top = 202
    object cplDesp: TdxGridReportLink
      Component = Grid
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInReportLink = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
  end
end
