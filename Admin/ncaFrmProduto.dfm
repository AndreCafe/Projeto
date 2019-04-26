object FrmProduto: TFrmProduto
  Left = 282
  Top = 164
  Caption = 'Dados do Produto ou Servi'#231'o'
  ClientHeight = 673
  ClientWidth = 956
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 956
    Height = 637
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Bevel.BorderInnerWidth = 7
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 4
    object Paginas: TcxPageControl
      Left = 7
      Top = 7
      Width = 942
      Height = 623
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tsCadastro
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      Properties.Style = 6
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 623
      ClientRectRight = 942
      ClientRectTop = 0
      object tsCadastro: TcxTabSheet
        Caption = 'Dados do Produto'
        ImageIndex = 1
        object LMDSimplePanel3: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 942
          Height = 623
          Margins.Left = 0
          Margins.Top = 7
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Bevel.Mode = bmCustom
          TabOrder = 0
          object LMDSimplePanel7: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 199
            Height = 623
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 7
            Margins.Bottom = 0
            Align = alLeft
            Bevel.BorderSides = [fsRight]
            Bevel.Mode = bmStandard
            Bevel.StandardStyle = lsNone
            TabOrder = 0
            object pagFoto: TcxPageControl
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 192
              Height = 198
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 7
              Margins.Bottom = 0
              Align = alTop
              Color = clBtnFace
              ParentBackground = False
              ParentColor = False
              TabOrder = 0
              TabStop = False
              Properties.ActivePage = tsSemFoto
              Properties.CustomButtons.Buttons = <>
              Properties.HideTabs = True
              LookAndFeel.NativeStyle = False
              ClientRectBottom = 198
              ClientRectRight = 192
              ClientRectTop = 0
              object tsSemFoto: TcxTabSheet
                Caption = 'SemFoto'
                ImageIndex = 0
                object LMDSimplePanel1: TLMDSimplePanel
                  Left = 0
                  Top = 0
                  Width = 192
                  Height = 198
                  Align = alClient
                  Bevel.Mode = bmStandard
                  TabOrder = 0
                  object Image1: TImage
                    AlignWithMargins = True
                    Left = 1
                    Top = 1
                    Width = 190
                    Height = 114
                    Margins.Left = 0
                    Margins.Top = 0
                    Margins.Right = 0
                    Margins.Bottom = 26
                    Align = alClient
                    Center = True
                    Picture.Data = {
                      0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
                      0060000000460806000000336D9113000000097048597300000B1300000B1301
                      009A9C18000004B14944415478DAED5C8952E3300C55CA515A60618FFFFFC1DD
                      A5072D949692D56B6408D9D23A89233BAEDF8C86C20096F47CC8B2EC2CCF736A
                      8B2CCB06F8C272C972219F9BE09565C3F20661DDDE5A2B1738B2B604B0F3CFF8
                      CB90E59AE5DC814E70FA8A65C192C74E422B02D8F9E8EDE8F5B7D4BCD77F8535
                      CB241170E88FB30CCEFF41EE9D6FF0C432CF5DCC9381A2310132F5DC5131FD74
                      0528F7C03AAE3DF846058D0810E75FB17C53D011CE9FB19EAFCABE51411B027E
                      B29C29E9F9C8B28A91847702D8A988606C163CCCF75874478A7A42AFBF96FAF5
                      0103D3997604481C8F05153DFAD8828ADF1D5BFC9E6B602A7AD1F65407408FDF
                      C21E447870221C8A187E2C9F13BA0746F233CBD2EC5EBB0C2513F603236106A7
                      23941CFBD6E644B10501E8FD5DC6F209070002BE5311D30358996DE352AC175A
                      6168B4A81230A182041B98853BA105AA04FCB6DDEC70E88ABDC08D6F03FA8E2A
                      017F98808DD51F26029C2011608F2659CBA3A17D9F08C8F748D596AAB80476AF
                      7576E2172207113A0170F29B081CF02A627E6648303B7A4465E7228392B82003
                      A774D31ABF8F20E5F6A81F294C028CE3E16C9303CA6B0408E65C1AFB1B93E36A
                      1B323F73FBD604B00EF04D2F09308E47AE64D5F6485252E723B1119F9BE6BB4E
                      82004C3370FC13EBB175F98F25DD8E6901A3A2C968889A004C39E8F54B2A7A7D
                      2767C0A5933C6C20EB5670444B8071FE23B7AD92EF67DD47A27B1D12A22500ED
                      CDB50FDE8504D8603B1D454900DA9AD9B6E91A6C03D6031416D88C84E808C022
                      8B9EBF6AF13F5A4116E621D9159645470016DC85EFCA37D933DC947CF015A222
                      00BDFF21943213A9F0831F0EED111020CC6AFCDBB18D7F7C1180C2DBA5EFDE5F
                      B2058EBFA3C3A3209A5CD0AEC62794DE5FB26728BE502D4EF041007AD124B482
                      5B5990EFC9A2D73A6D97F40940D8F9A469A4B533B20C21E9B56A9BA44B402E6D
                      0435FD946CBA127FE8B549BA040415FDECB109D3D02F525C07B40940BA61EA3A
                      D3E9CC190501A893522BB7D1260099CE899671B59DC1A0A2EC5E6D21D626A0D6
                      6E521B420046C0A55A9B940828DB143D01A14F41EA7B011F8B70B0574F3D5CBD
                      522700E1E743C051101C8F3054EDA24ADA887DB6493D1FE42315814398A59681
                      B59C7102A90800C9B87968A3401660F8C2C57B17F6ED524A471B7B4E261D0DE0
                      3066AE69E8115BE0877B3A7E2CE9BE6D4A4792B64792DDB44D7E084034841244
                      EF2FA1C8DC8FC5D7CB45459F5511580B40C0B30FC34B76DC881D5EEE49FB2ECC
                      C21434F55C9885C3786FB73D7D1380E907E909F5B054E67D4C3DAA67C0FFE941
                      FE6B43D54910E743FF360F0CBAD185FC13001812165D16E94AB839A48FCA68EF
                      EF6384420060CAD45131B1763D1AA4F80AD56AA88AB679964705211160B07B4B
                      878A3075E3E88A12A61A732923A8E715422400787FD4888ADCD1BA0E11E27400
                      733DA61C10104CAFFFA42B85498041F58AEA463E9B9F1B47E367E64A2A7AF905
                      7DF47657D7543B41E80418942F679B91501E11E58BD983D2F7C13ABEAC781F08
                      D8877D37E57B873E131005D273359E5125A0CEDB9C08EB548FEF62447AB2CC33
                      AA8FF6D5CDCDF772E10B09E9D94ABFD8A6875BFD626A362B8866AE2991A0054C
                      F5483A2ECCE3DDE6A5298C86F47E74B74094891CD71621FF3F9EB8B2D089DB99
                      CD0000000049454E44AE426082}
                    ExplicitTop = -1
                    ExplicitWidth = 162
                    ExplicitHeight = 177
                  end
                  object lbSemFoto: TcxLabel
                    AlignWithMargins = True
                    Left = 11
                    Top = 151
                    Cursor = crHandPoint
                    Margins.Left = 10
                    Margins.Top = 10
                    Margins.Right = 10
                    Margins.Bottom = 10
                    Align = alBottom
                    Caption = 'Clique aqui para selecionar uma foto para esse produto'
                    Style.HotTrack = True
                    Style.TextColor = 10395294
                    Style.TextStyle = []
                    Style.TransparentBorder = True
                    StyleHot.BorderStyle = ebsNone
                    StyleHot.TextColor = clBlack
                    StyleHot.TextStyle = [fsUnderline]
                    Properties.Alignment.Horz = taCenter
                    Properties.Alignment.Vert = taBottomJustify
                    Properties.WordWrap = True
                    Transparent = True
                    OnClick = lbSemFotoClick
                    Width = 170
                    AnchorX = 96
                    AnchorY = 187
                  end
                end
              end
              object tsFoto: TcxTabSheet
                Caption = 'Foto'
                ImageIndex = 1
                object panFoto: TLMDSimplePanel
                  Left = 0
                  Top = 0
                  Width = 192
                  Height = 198
                  Align = alClient
                  Bevel.Mode = bmCustom
                  TabOrder = 0
                  object edFoto: TcxDBImage
                    Left = 0
                    Top = 0
                    Cursor = crHandPoint
                    TabStop = False
                    Align = alClient
                    DataBinding.DataField = 'Imagem'
                    DataBinding.DataSource = dsMT
                    Properties.GraphicClassName = 'TdxSmartImage'
                    Properties.ImmediatePost = True
                    Properties.OnEditValueChanged = edFotoPropertiesEditValueChanged
                    Style.BorderStyle = ebsFlat
                    Style.Color = clWhite
                    TabOrder = 0
                    Height = 198
                    Width = 192
                  end
                end
              end
            end
          end
          object panCampos: TLMDSimplePanel
            Left = 199
            Top = 0
            Width = 743
            Height = 623
            Margins.Left = 7
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Bevel.Mode = bmCustom
            TabOrder = 1
            object panDescr: TLMDSimplePanel
              AlignWithMargins = True
              Left = 0
              Top = 45
              Width = 743
              Height = 36
              Margins.Left = 0
              Margins.Top = 7
              Margins.Right = 0
              Margins.Bottom = 0
              Constraints.MaxWidth = 803
              Align = alTop
              Bevel.BorderColor = clSilver
              Bevel.BorderInnerWidth = 2
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              Color = clWhite
              TabOrder = 1
              object edDescr: TcxDBTextEdit
                Left = 71
                Top = 2
                Align = alClient
                OnFocusChanged = edDescrFocusChanged
                DataBinding.DataField = 'Descricao'
                DataBinding.DataSource = dsMT
                ParentFont = False
                Style.BorderColor = clWindowFrame
                Style.BorderStyle = ebsNone
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -17
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.LookAndFeel.NativeStyle = False
                Style.StyleController = FrmPri.cxEditStyleController1
                Style.TextColor = clBlack
                Style.TextStyle = [fsBold]
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.BorderStyle = ebsNone
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleFocused.TextColor = clBlack
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 0
                Width = 670
              end
              object cxLabel3: TcxLabel
                AlignWithMargins = True
                Left = 7
                Top = 2
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Descri'#231#227'o:'
                FocusControl = edDescr
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.TextColor = clBlack
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taLeftJustify
                Properties.Alignment.Vert = taVCenter
                Transparent = True
                OnClick = cxLabel3Click
                AnchorY = 18
              end
            end
            object panCodigo: TLMDSimplePanel
              Left = 0
              Top = 0
              Width = 743
              Height = 38
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 0
              object panCod: TLMDSimplePanel
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 393
                Height = 38
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alLeft
                Bevel.BorderColor = clSilver
                Bevel.BorderInnerWidth = 2
                Bevel.LightColor = clGray
                Bevel.Mode = bmStandard
                Bevel.StandardStyle = lsNone
                Color = clWhite
                TabOrder = 0
                object imgBarcodeScan: TImage
                  AlignWithMargins = True
                  Left = 2
                  Top = 2
                  Width = 56
                  Height = 34
                  Cursor = crHandPoint
                  Margins.Left = 0
                  Margins.Top = 0
                  Margins.Bottom = 0
                  Align = alLeft
                  AutoSize = True
                  Center = True
                  Constraints.MaxHeight = 64
                  Picture.Data = {
                    0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
                    00380000002008060000004703BBE8000000097048597300000EC400000EC401
                    952B0E1B000003214944415478DAED995D28A45118C7FFAF595146534A1A0985
                    B871A9A6DD213728CC4E4B3BB3DA5B1F17922B512E10427229947CC4C5984DED
                    F8261FF9986DF7464A24940BF9BAF0B1AC94F9DA739E452F6677A9113B7B9E7A
                    E73DCF73CE73CEF33BE79DF39C774682178BCBE582F4DC413C3920FF70279999
                    995431343474ADDFAABF6B7F68BB27F477BB580250000A4001280005A000F47A
                    404932DFAD5850ABDFF3BB56ABFDA52F2CDCAA97DB79CF6FAE742BD3AFA74C6E
                    FF3A3707BB8F0F955F399DD02425DDB46741E0756222E9DF6667615328A8EC23
                    B3CBFB958FFF657E1E4E4982766FEFD33D3A97CBE011C0C7B4FB9BBF7C22E4F6
                    DF01DEF80B4001F82F03BA91E7DA453FA4A5E187AFEFBD76BA8C0CB824E94FFE
                    4F972614AC0FCBF030E97A1688E32A10B95D1EB8D26683697CFCA63DDF453F8F
                    8C90FE312505DFFDFCA8CC77DB6BFB5BD6CEE906F05D7A3A6C6CC5FFF33C2800
                    05A0007CF1802F5504E0430147474731333383A2A22238597E6A6F6F477C7C3C
                    0C06037A7A7AB0BBBB8BD2D252984C26ACADAD212F2F0F76BB1D1D1D1D4861B9
                    4DA3D1A0A6A606010101282929416F6F2F36373751505080F3F3737475752121
                    21017ABD9EFA090F0F47616121F551565686EAEA6A2C2D2D6184E5C5888808E4
                    E6E67A1670676707F9F9F914241F940F18191989BABA3A0A3E3B3B1BE5E5E568
                    6868C0F1F1310537393949E056AB15131313383B3B434E4E0E8659F2AFA8A820
                    BDB8B818DBDBDB686C6C445C5C1CF9676565D1E4555656A2A5A505030303E8EB
                    EB834AA542777737FCFDFD61341A3D0B38353505B3D98CD4D454381C0E2C2F2F
                    636565856C3A9D0E4AA512CDCDCD585C5CA4D54E62EF7B7C455A5B5B61632797
                    FAFA7A3A3F72FFAAAA2A8C8D8D6170701069EC847378784890ABABABE8ECEC44
                    7F7F3FDADADA303D3D8DDADA5A582C1634353521393999E079BDE2EA9DD16380
                    070707383D3D454C4C0CFDE6BFBEBE8ED0D050040606528097979750ABD5383A
                    3AA22B3A3A1A171717D8DADAA295E1B2B1B141F7D8D858F2393939415454143D
                    F2BCBFB0B0309A28FEE8060505D1C5657F7F1FC1C1C1342EF70B090979DC7750
                    92BCF73F18AF07FC0920F21503A014DE2D0000000049454E44AE426082}
                  Transparent = True
                  OnClick = imgBarcodeScanClick
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitHeight = 42
                end
                object edCodigo: TcxDBMaskEdit
                  Left = 61
                  Top = 2
                  Align = alClient
                  OnFocusChanged = edDescrFocusChanged
                  DataBinding.DataField = 'Codigo'
                  DataBinding.DataSource = dsMT
                  ParentFont = False
                  Properties.MaxLength = 0
                  Style.BorderColor = clWindowFrame
                  Style.BorderStyle = ebsNone
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -17
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = []
                  Style.HotTrack = False
                  Style.LookAndFeel.NativeStyle = False
                  Style.StyleController = FrmPri.cxEditStyleController1
                  Style.TextColor = clBlack
                  Style.TextStyle = [fsBold]
                  Style.TransparentBorder = False
                  Style.IsFontAssigned = True
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleFocused.BorderStyle = ebsNone
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleFocused.TextColor = clBlack
                  StyleHot.LookAndFeel.NativeStyle = False
                  TabOrder = 0
                  Width = 330
                end
              end
            end
            object panPreco: TLMDSimplePanel
              AlignWithMargins = True
              Left = 0
              Top = 88
              Width = 743
              Height = 36
              Margins.Left = 0
              Margins.Top = 7
              Margins.Right = 0
              Margins.Bottom = 0
              Constraints.MaxWidth = 803
              Align = alTop
              Bevel.BorderColor = clSilver
              Bevel.BorderInnerWidth = 2
              Bevel.LightColor = clGray
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              Color = clWhite
              TabOrder = 2
              object edPreco: TcxPopupEdit
                Left = 2
                Top = 2
                Align = alClient
                OnFocusChanged = edDescrFocusChanged
                ParentFont = False
                Properties.PopupAutoSize = False
                Properties.PopupSizeable = False
                Properties.ReadOnly = True
                Properties.OnInitPopup = edPrecoPropertiesInitPopup
                Properties.OnPopup = edPrecoPropertiesPopup
                Style.BorderStyle = ebsNone
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.HotTrack = False
                Style.StyleController = FrmPri.cxEditStyleController1
                Style.TransparentBorder = False
                Style.PopupBorderStyle = epbsFrame3D
                Style.IsFontAssigned = True
                StyleFocused.BorderStyle = ebsNone
                TabOrder = 0
                OnEnter = edPrecoEnter
                Width = 739
              end
              object panInnerPreco: TLMDSimplePanel
                AlignWithMargins = True
                Left = 2
                Top = 2
                Width = 723
                Height = 32
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 16
                Margins.Bottom = 0
                Align = alClient
                Bevel.Mode = bmCustom
                ParentColor = True
                TabOrder = 1
                OnClick = panDadosPrecoClick
                object imgPreco: TImage
                  Left = 0
                  Top = 0
                  Width = 56
                  Height = 32
                  Cursor = crHandPoint
                  Margins.Left = 0
                  Margins.Top = 0
                  Margins.Bottom = 0
                  Align = alLeft
                  AutoSize = True
                  Center = True
                  Constraints.MaxHeight = 64
                  Picture.Data = {
                    0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
                    00380000002008060000004703BBE8000000097048597300000EC400000EC401
                    952B0E1B000002144944415478DAED98BF4FC24014C70B0A9A28210C6E86D998
                    C0E8220B5307E23FC07FC0CA40E02FE03F80C995BF40161712C2A22B833BB8E9
                    420C26054A79DF6AC9711E50E8D57AC56F7269937BD7DEE7DE7BF72B62599616
                    6645FE0115D7E102D66AB52B7ADC53B9A1721C40DF66549EEBF5FAAD5F804FDF
                    70818B20237E004EB5603C27157213E09F4BCE7D20950224CD09F228CC80D08C
                    2063BF06984C26B55C2EA76532196D301868AD566BA53E9D4EDBF58E7ABD9E6D
                    E75153828CFB0E08B852A9643FA17EBFBF0208E862B1F8A31D6FE727A42740C0
                    C143D06834B2BD83E2C057ABD5B56DDBEDF6D2D683260479E20B200B20F248A1
                    50588626EA60C37A1C61DA6C36BD024206419E4A0544E8B1B9250A37D4C10620
                    ACA7F876F0FCB69CC4FFF2F9FCD834CD78B7DB8D61B0383D10E49D3440FA9884
                    81FF929B7C2C97CB6F1724BCD36058E4797E3D1C539FCEA5016EF320EA514475
                    FB78B052A9BCA652A94BBC0F87C379A3D18872269F0478260D10E2731093063A
                    0B00CC9CA23C0318CAAE3998CD6627BAAEBF1B8691E8743A0941883E12A02E15
                    100288E32991F899920D6D49B328B47126F5BC0E02D2592A588972CB01041800
                    2568EB5A2865ABC6E69C032708A3E56E07A12C41AEB66C2AEE452193E05C1DE5
                    5404B4082EEAD65839C05DCF844A01CA3EF086FECA22F4974E415F1B422F0477
                    EDE503877BF1BB4EE4596C6A57A6691AE58FA041A401AAA6D0032E0028B093D0
                    7A8DAB790000000049454E44AE426082}
                  Transparent = True
                  Visible = False
                  OnClick = panDadosPrecoClick
                end
                object panDadosPreco: TLMDSimplePanel
                  Left = 56
                  Top = 0
                  Width = 667
                  Height = 32
                  Margins.Top = 0
                  Margins.Right = 20
                  Margins.Bottom = 0
                  Align = alClient
                  Bevel.Mode = bmCustom
                  ParentColor = True
                  TabOrder = 0
                  OnClick = panDadosPrecoClick
                  object lbPromptPreco: TcxLabel
                    AlignWithMargins = True
                    Left = 5
                    Top = 0
                    Margins.Left = 5
                    Margins.Top = 0
                    Margins.Right = 0
                    Margins.Bottom = 0
                    Align = alLeft
                    Caption = 'Pre'#231'o de Venda: '
                    ParentFont = False
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -13
                    Style.Font.Name = 'Tahoma'
                    Style.Font.Style = []
                    Style.TextColor = clBlack
                    Style.IsFontAssigned = True
                    Properties.Alignment.Horz = taLeftJustify
                    Properties.Alignment.Vert = taVCenter
                    Transparent = True
                    OnClick = panDadosPrecoClick
                    AnchorY = 16
                  end
                  object lbPreco: TcxLabel
                    Left = 108
                    Top = 0
                    Margins.Left = 0
                    Margins.Top = 0
                    Margins.Right = 0
                    Margins.Bottom = 0
                    Align = alLeft
                    Caption = 'R$ 0,00'
                    ParentFont = False
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -17
                    Style.Font.Name = 'Tahoma'
                    Style.Font.Style = []
                    Style.TextColor = clBlue
                    Style.TextStyle = [fsBold]
                    Style.IsFontAssigned = True
                    StyleFocused.TextColor = clBlack
                    Properties.Alignment.Horz = taLeftJustify
                    Properties.Alignment.Vert = taVCenter
                    Transparent = True
                    OnClick = panDadosPrecoClick
                    AnchorY = 16
                  end
                  object panCustoLucro: TLMDSimplePanel
                    AlignWithMargins = True
                    Left = 183
                    Top = 0
                    Width = 484
                    Height = 32
                    Margins.Left = 5
                    Margins.Top = 0
                    Margins.Right = 0
                    Margins.Bottom = 0
                    Align = alClient
                    Bevel.BorderColor = clSilver
                    Bevel.Mode = bmStandard
                    Bevel.StandardStyle = lsNone
                    ParentColor = True
                    TabOrder = 2
                    Visible = False
                    OnClick = panDadosPrecoClick
                    object lbMargem: TcxLabel
                      Left = 0
                      Top = 0
                      Margins.Left = 15
                      Margins.Top = 0
                      Margins.Right = 0
                      Margins.Bottom = 0
                      Align = alLeft
                      Caption = '(Lucro 50%)'
                      ParentFont = False
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clWindowText
                      Style.Font.Height = -17
                      Style.Font.Name = 'Tahoma'
                      Style.Font.Style = []
                      Style.TextColor = clBlack
                      Style.IsFontAssigned = True
                      Properties.Alignment.Horz = taLeftJustify
                      Properties.Alignment.Vert = taVCenter
                      Transparent = True
                      OnClick = panDadosPrecoClick
                      AnchorY = 16
                    end
                    object lbCusto: TcxLabel
                      Left = 414
                      Top = 0
                      Margins.Left = 5
                      Margins.Top = 0
                      Margins.Right = 0
                      Margins.Bottom = 0
                      Align = alRight
                      Caption = 'R$ 0,00'
                      ParentFont = False
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clWindowText
                      Style.Font.Height = -17
                      Style.Font.Name = 'Tahoma'
                      Style.Font.Style = [fsBold]
                      Style.TextColor = clBlack
                      Style.TextStyle = [fsBold]
                      Style.IsFontAssigned = True
                      Properties.Alignment.Horz = taLeftJustify
                      Properties.Alignment.Vert = taVCenter
                      Transparent = True
                      OnClick = panDadosPrecoClick
                      AnchorY = 16
                    end
                    object lbPromptCusto: TcxLabel
                      Left = 373
                      Top = 0
                      Margins.Left = 15
                      Margins.Top = 0
                      Margins.Right = 0
                      Margins.Bottom = 0
                      Align = alRight
                      Caption = 'Custo:'
                      ParentFont = False
                      Style.Font.Charset = DEFAULT_CHARSET
                      Style.Font.Color = clWindowText
                      Style.Font.Height = -13
                      Style.Font.Name = 'Tahoma'
                      Style.Font.Style = []
                      Style.TextColor = clBlack
                      Style.IsFontAssigned = True
                      Properties.Alignment.Horz = taLeftJustify
                      Properties.Alignment.Vert = taVCenter
                      Transparent = True
                      OnClick = panDadosPrecoClick
                      AnchorY = 16
                    end
                  end
                end
              end
            end
            object panCategUnid: TLMDSimplePanel
              AlignWithMargins = True
              Left = 0
              Top = 174
              Width = 743
              Height = 36
              Margins.Left = 0
              Margins.Top = 7
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Bevel.Mode = bmCustom
              TabOrder = 4
              object panCateg: TLMDSimplePanel
                Left = 0
                Top = 0
                Width = 394
                Height = 36
                Align = alLeft
                Bevel.BorderColor = clSilver
                Bevel.BorderInnerWidth = 2
                Bevel.Mode = bmStandard
                Bevel.StandardStyle = lsNone
                Color = clWhite
                TabOrder = 0
                object cxLabel6: TcxLabel
                  AlignWithMargins = True
                  Left = 7
                  Top = 2
                  Margins.Left = 5
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alLeft
                  Caption = 'Categoria:'
                  FocusControl = edCateg
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = []
                  Style.TextColor = clBlack
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  Transparent = True
                  OnClick = cxLabel6Click
                  AnchorX = 39
                  AnchorY = 18
                end
                object edCateg: TcxDBLookupComboBox
                  Left = 71
                  Top = 2
                  Align = alClient
                  OnFocusChanged = edDescrFocusChanged
                  DataBinding.DataField = 'LookupCateg'
                  DataBinding.DataSource = dsMT
                  ParentFont = False
                  Properties.ClearKey = 46
                  Properties.DropDownHeight = 200
                  Properties.DropDownRows = 50
                  Properties.ImmediateDropDownWhenActivated = True
                  Properties.ImmediatePost = True
                  Properties.KeyFieldNames = 'Descricao'
                  Properties.ListColumns = <
                    item
                      FieldName = 'Descricao'
                    end>
                  Properties.ListOptions.CaseInsensitive = True
                  Properties.ListOptions.ColumnSorting = False
                  Properties.ListOptions.FocusRowOnMouseMove = False
                  Properties.ListOptions.GridLines = glNone
                  Properties.ListOptions.ShowHeader = False
                  Properties.PostPopupValueOnTab = True
                  Properties.Revertable = True
                  Properties.OnChange = edCategPropertiesChange
                  Properties.OnInitPopup = edCategPropertiesInitPopup
                  Style.BorderStyle = ebsNone
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -17
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = []
                  Style.HotTrack = False
                  Style.Shadow = False
                  Style.StyleController = FrmPri.cxEditStyleController1
                  Style.TransparentBorder = False
                  Style.PopupBorderStyle = epbsSingle
                  Style.IsFontAssigned = True
                  StyleFocused.BorderStyle = ebsNone
                  TabOrder = 1
                  OnKeyDown = edCategKeyDown
                  Width = 321
                end
              end
              object panUnid: TLMDSimplePanel
                AlignWithMargins = True
                Left = 401
                Top = 0
                Width = 402
                Height = 36
                Margins.Left = 7
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alLeft
                Bevel.BorderColor = clSilver
                Bevel.BorderInnerWidth = 2
                Bevel.Mode = bmStandard
                Bevel.StandardStyle = lsNone
                Color = clWhite
                TabOrder = 1
                object cxLabel7: TcxLabel
                  AlignWithMargins = True
                  Left = 7
                  Top = 2
                  Margins.Left = 5
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alLeft
                  Caption = 'Unidade de Medida:'
                  FocusControl = edUnid
                  ParentColor = False
                  ParentFont = False
                  Style.Color = 16316922
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = []
                  Style.TextColor = clBlack
                  Style.TransparentBorder = False
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taLeftJustify
                  Properties.Alignment.Vert = taVCenter
                  Transparent = True
                  OnClick = cxLabel7Click
                  AnchorY = 18
                end
                object edUnid: TcxDBLookupComboBox
                  Left = 121
                  Top = 2
                  Align = alClient
                  OnFocusChanged = edDescrFocusChanged
                  DataBinding.DataField = 'LookupUnid'
                  DataBinding.DataSource = dsMT
                  ParentFont = False
                  Properties.ClearKey = 46
                  Properties.DropDownHeight = 300
                  Properties.DropDownRows = 400
                  Properties.DropDownSizeable = True
                  Properties.GridMode = True
                  Properties.ImmediateDropDownWhenActivated = True
                  Properties.ImmediatePost = True
                  Properties.KeyFieldNames = 'Descricao'
                  Properties.ListColumns = <
                    item
                      FieldName = 'Descricao'
                    end>
                  Properties.ListOptions.CaseInsensitive = True
                  Properties.ListOptions.ColumnSorting = False
                  Properties.ListOptions.FocusRowOnMouseMove = False
                  Properties.ListOptions.GridLines = glNone
                  Properties.ListOptions.ShowHeader = False
                  Properties.PostPopupValueOnTab = True
                  Properties.Revertable = True
                  Properties.OnInitPopup = edUnidPropertiesInitPopup
                  Style.BorderStyle = ebsNone
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -17
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = []
                  Style.HotTrack = False
                  Style.Shadow = False
                  Style.StyleController = FrmPri.cxEditStyleController1
                  Style.TransparentBorder = False
                  Style.PopupBorderStyle = epbsSingle
                  Style.IsFontAssigned = True
                  StyleFocused.BorderStyle = ebsNone
                  TabOrder = 1
                  OnKeyDown = edUnidKeyDown
                  Width = 279
                end
              end
            end
            object panFornecedor: TLMDSimplePanel
              AlignWithMargins = True
              Left = 0
              Top = 217
              Width = 743
              Height = 36
              Margins.Left = 0
              Margins.Top = 7
              Margins.Right = 0
              Margins.Bottom = 0
              Constraints.MaxWidth = 803
              Align = alTop
              Bevel.BorderColor = clSilver
              Bevel.BorderInnerWidth = 2
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              Color = clWhite
              TabOrder = 5
              object edFornecedor: TcxDBPopupEdit
                Left = 81
                Top = 2
                Align = alClient
                OnFocusChanged = edDescrFocusChanged
                DataBinding.DataField = 'NomeFor'
                DataBinding.DataSource = dsMT
                ParentFont = False
                Properties.MaxLength = 0
                Properties.OnCloseUp = edFornecedorPropertiesCloseUp
                Properties.OnInitPopup = edFornecedorPropertiesInitPopup
                Style.BorderColor = clWindowFrame
                Style.BorderStyle = ebsNone
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -17
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.LookAndFeel.NativeStyle = False
                Style.StyleController = FrmPri.cxEditStyleController1
                Style.TransparentBorder = False
                Style.ButtonStyle = btsSimple
                Style.ButtonTransparency = ebtInactive
                Style.PopupBorderStyle = epbsFlat
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.BorderStyle = ebsNone
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 0
                Width = 660
              end
              object cxLabel5: TcxLabel
                AlignWithMargins = True
                Left = 7
                Top = 2
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'Fornecedor:'
                FocusControl = edFornecedor
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.TextColor = clBlack
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Transparent = True
                OnClick = cxLabel5Click
                AnchorX = 44
                AnchorY = 18
              end
            end
            object panObs: TLMDSimplePanel
              AlignWithMargins = True
              Left = 0
              Top = 260
              Width = 743
              Height = 74
              Margins.Left = 0
              Margins.Top = 7
              Margins.Right = 0
              Margins.Bottom = 0
              Constraints.MaxWidth = 803
              Align = alTop
              Bevel.BorderColor = clSilver
              Bevel.BorderInnerWidth = 2
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              Color = clWhite
              TabOrder = 6
              object cxLabel9: TcxLabel
                AlignWithMargins = True
                Left = 7
                Top = 2
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Observa'#231#245'es'
                FocusControl = edObs
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.TextColor = clBlack
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                OnClick = cxLabel9Click
              end
              object edObs: TcxDBMemo
                AlignWithMargins = True
                Left = 7
                Top = 22
                Margins.Left = 5
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alClient
                OnFocusChanged = edDescrFocusChanged
                DataBinding.DataField = 'Obs'
                DataBinding.DataSource = dsMT
                ParentFont = False
                Style.BorderColor = clWindowFrame
                Style.BorderStyle = ebsNone
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -12
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.HotTrack = False
                Style.LookAndFeel.NativeStyle = False
                Style.StyleController = FrmPri.cxEditStyleController1
                Style.TextStyle = [fsBold]
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.BorderStyle = ebsNone
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 1
                Height = 50
                Width = 734
              end
              object panLookup: TLMDSimplePanel
                AlignWithMargins = True
                Left = 328
                Top = 14
                Width = 393
                Height = 26
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Bevel.BorderSides = []
                Bevel.Mode = bmStandard
                Bevel.StandardStyle = lsNone
                TabOrder = 2
                Visible = False
                object btnExcluir: TcxButton
                  Left = 164
                  Top = 0
                  Width = 82
                  Height = 26
                  Cursor = crHandPoint
                  Align = alLeft
                  Caption = 'Excluir'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnClick = btnExcluirClick
                  LookAndFeel.Kind = lfFlat
                  LookAndFeel.NativeStyle = False
                  OptionsImage.Glyph.Data = {
                    76020000424D760200000000000036000000280000000C0000000C0000000100
                    2000000000004002000000000000000000000000000000000000000000000000
                    0000000000000000005F000000BF000000EF000000DF000000AF0000005F0000
                    00000000000000000000000000000000000F000000CF000000FF000000FF0000
                    00FF000000FF000000FF000000FF000000CF0000000F00000000000000000000
                    00CF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                    00FF000000CF000000000000005F000000FF000000FF000000FF000000FF0000
                    00FF000000FF000000FF000000FF000000FF000000FF0000005F000000BF0000
                    00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                    00FF000000FF000000BF000000DF000000FF000000FF00000000000000000000
                    0000000000000000000000000000000000FF000000FF000000EF000000EF0000
                    00FF000000FF0000000000000000000000000000000000000000000000000000
                    00FF000000FF000000DF000000BF000000FF000000FF000000FF000000FF0000
                    00FF000000FF000000FF000000FF000000FF000000FF000000AF0000005F0000
                    00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                    00FF000000FF0000005F00000000000000CF000000FF000000FF000000FF0000
                    00FF000000FF000000FF000000FF000000FF000000CF00000000000000000000
                    000F000000CF000000FF000000FF000000FF000000FF000000FF000000FF0000
                    00CF0000000F000000000000000000000000000000000000005F000000BF0000
                    00DF000000EF000000BF0000005F000000000000000000000000}
                  SpeedButtonOptions.CanBeFocused = False
                  SpeedButtonOptions.Flat = True
                end
                object btnEditar: TcxButton
                  Left = 82
                  Top = 0
                  Width = 82
                  Height = 26
                  Cursor = crHandPoint
                  Align = alLeft
                  Caption = 'Editar'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnClick = btnEditarClick
                  LookAndFeel.Kind = lfFlat
                  LookAndFeel.NativeStyle = False
                  OptionsImage.Glyph.Data = {
                    0E030000424D0E0300000000000036000000280000000D0000000E0000000100
                    200000000000D8020000000000000000000000000000000000000000000F0000
                    001F000000000000000000000000000000000000000000000000000000000000
                    00000000000000000000000000000000001F000000FF000000CF0000006F0000
                    000F000000000000000000000000000000000000000000000000000000000000
                    000000000000000000CF000000FF000000CF0000001F0000000F000000000000
                    00000000000000000000000000000000000000000000000000000000006F0000
                    00CF0000001F000000CF000000CF0000000F0000000000000000000000000000
                    00000000000000000000000000000000000F0000001F000000CF000000FF0000
                    00FF000000CF0000000F00000000000000000000000000000000000000000000
                    0000000000000000000F000000CF000000FF000000FF000000FF000000CF0000
                    000F000000000000000000000000000000000000000000000000000000000000
                    000F000000CF000000FF000000FF000000FF000000CF0000000F000000000000
                    000000000000000000000000000000000000000000000000000F000000CF0000
                    00FF000000FF000000FF000000CF0000000F0000000000000000000000000000
                    00000000000000000000000000000000000F000000CF000000FF000000FF0000
                    00FF000000CF0000000F00000000000000000000000000000000000000000000
                    0000000000000000000F000000CF000000FF000000FF000000CF0000001F0000
                    000F000000000000000000000000000000000000000000000000000000000000
                    000F000000CF000000CF0000001F000000CF000000CF00000000000000000000
                    000000000000000000000000000000000000000000000000000F0000001F0000
                    00CF000000FF000000EF00000000000000000000000000000000000000000000
                    00000000000000000000000000000000000F000000CF000000EF0000002F0000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000F0000001F00000000}
                  SpeedButtonOptions.CanBeFocused = False
                  SpeedButtonOptions.Flat = True
                end
                object btnAdicionar: TcxButton
                  Left = 0
                  Top = 0
                  Width = 82
                  Height = 26
                  Cursor = crHandPoint
                  Align = alLeft
                  Caption = 'Adicionar'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnClick = btnAdicionarClick
                  LookAndFeel.Kind = lfFlat
                  LookAndFeel.NativeStyle = False
                  OptionsImage.Glyph.Data = {
                    76020000424D760200000000000036000000280000000C0000000C0000000100
                    2000000000004002000000000000000000000000000000000000000000000000
                    0000000000000000005F000000BF000000EF000000DF000000AF0000005F0000
                    00000000000000000000000000000000000F000000CF000000FF000000FF0000
                    00FF000000FF000000FF000000FF000000CF0000000F00000000000000000000
                    00CF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                    00FF000000CF000000000000005F000000FF000000FF000000FF000000FF0000
                    000000000000000000FF000000FF000000FF000000FF0000005F000000BF0000
                    00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
                    00FF000000FF000000BF000000DF000000FF000000FF00000000000000000000
                    0000000000000000000000000000000000FF000000FF000000EF000000EF0000
                    00FF000000FF0000000000000000000000000000000000000000000000000000
                    00FF000000FF000000DF000000BF000000FF000000FF000000FF000000FF0000
                    000000000000000000FF000000FF000000FF000000FF000000AF0000005F0000
                    00FF000000FF000000FF000000FF0000000000000000000000FF000000FF0000
                    00FF000000FF0000005F00000000000000CF000000FF000000FF000000FF0000
                    00FF000000FF000000FF000000FF000000FF000000CF00000000000000000000
                    000F000000CF000000FF000000FF000000FF000000FF000000FF000000FF0000
                    00CF0000000F000000000000000000000000000000000000005F000000BF0000
                    00DF000000EF000000BF0000005F000000000000000000000000}
                  SpeedButtonOptions.CanBeFocused = False
                  SpeedButtonOptions.Flat = True
                end
              end
            end
            object pgBottom: TcxPageControl
              AlignWithMargins = True
              Left = 0
              Top = 341
              Width = 743
              Height = 282
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 7
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentColor = False
              ParentFont = False
              TabOrder = 7
              Properties.ActivePage = tsTrans
              Properties.CustomButtons.Buttons = <>
              Properties.Options = [pcoAlwaysShowGoDialogButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize, pcoUsePageColorForTab]
              Properties.ShowFrame = True
              Properties.Style = 9
              Properties.TabSlants.Positions = []
              LookAndFeel.Kind = lfFlat
              LookAndFeel.NativeStyle = False
              TabSlants.Positions = []
              ClientRectBottom = 281
              ClientRectLeft = 1
              ClientRectRight = 742
              ClientRectTop = 24
              object tsTran: TcxTabSheet
                Caption = '&1. Fidelidade '
                ImageIndex = 0
                object edFidPontos: TcxDBSpinEdit
                  Left = 13
                  Top = 128
                  Cursor = crHandPoint
                  DataBinding.DataField = 'FidPontos'
                  DataBinding.DataSource = dsMT
                  ParentFont = False
                  Properties.ImmediatePost = True
                  Style.BorderColor = clWindowFrame
                  Style.BorderStyle = ebsFlat
                  Style.HotTrack = False
                  Style.LookAndFeel.NativeStyle = False
                  Style.StyleController = FrmPri.cxEditStyleController1
                  Style.ButtonStyle = btsFlat
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleFocused.Color = 11206655
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleHot.LookAndFeel.NativeStyle = False
                  TabOrder = 0
                  Width = 107
                end
                object edFidelidade: TcxDBCheckBox
                  Left = 9
                  Top = 71
                  Cursor = crHandPoint
                  Caption = 'Este produto pode ser resgatado como pr'#234'mio'
                  DataBinding.DataField = 'Fidelidade'
                  DataBinding.DataSource = dsMT
                  Style.BorderStyle = ebsFlat
                  TabOrder = 1
                  OnClick = edFidelidadeClick
                  Width = 655
                end
                object lbPontos: TcxLabel
                  Left = 10
                  Top = 103
                  Cursor = crHandPoint
                  Caption = 'Pontos necess'#225'rios para resgate:'
                  FocusControl = edFidPontos
                end
                object LMDSimplePanel4: TLMDSimplePanel
                  Left = 0
                  Top = 0
                  Width = 741
                  Height = 65
                  Align = alTop
                  Bevel.BorderSides = [fsBottom]
                  Bevel.Mode = bmEdge
                  TabOrder = 3
                  object cxLabel4: TcxLabel
                    AlignWithMargins = True
                    Left = 50
                    Top = 5
                    Align = alLeft
                    Caption = 
                      'Fideliza'#231#227'o de clientes por ac'#250'mulo de pontos e resgate de pr'#234'mi' +
                      'os: '
                    Properties.Alignment.Vert = taVCenter
                    AnchorY = 33
                  end
                  object imgFid: TMyImage
                    AlignWithMargins = True
                    Left = 5
                    Top = 5
                    Width = 39
                    Height = 55
                    Align = alLeft
                    MouseOverDrawMode = idmNormal
                    MouseOffDrawMode = idmDisabled
                    MouseDownDrawMode = idmGrayScale
                    ImageList = cxImageList1
                    ImageIndex = 0
                    Colorize = False
                  end
                  object lbOpcoesFid: TcxLabel
                    AlignWithMargins = True
                    Left = 469
                    Top = 5
                    Cursor = crHandPoint
                    Align = alLeft
                    Caption = 'Ativar sistema de fideliza'#231#227'o'
                    Style.HotTrack = True
                    Style.TextStyle = [fsUnderline]
                    StyleHot.BorderStyle = ebsNone
                    StyleHot.TextColor = clBlue
                    Properties.Alignment.Vert = taVCenter
                    OnClick = lbOpcoesFidClick
                    AnchorY = 33
                  end
                end
              end
              object tsTrans: TcxTabSheet
                Caption = '&2. Transa'#231#245'es '
                Color = clWhite
                ImageIndex = 1
                ParentColor = False
              end
            end
            object panEstoque: TLMDSimplePanel
              AlignWithMargins = True
              Left = 0
              Top = 131
              Width = 743
              Height = 36
              Margins.Left = 0
              Margins.Top = 7
              Margins.Right = 0
              Margins.Bottom = 0
              Constraints.MaxWidth = 803
              Align = alTop
              Bevel.BorderColor = clSilver
              Bevel.BorderInnerWidth = 2
              Bevel.LightColor = clBlack
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              Color = clWhite
              TabOrder = 3
              object edEstoque: TcxPopupEdit
                Left = 2
                Top = 2
                Align = alClient
                OnFocusChanged = edDescrFocusChanged
                ParentColor = True
                ParentFont = False
                Properties.PopupAutoSize = False
                Properties.PopupSizeable = False
                Properties.ReadOnly = True
                Properties.OnInitPopup = edEstoquePropertiesInitPopup
                Properties.OnPopup = edEstoquePropertiesPopup
                Style.BorderStyle = ebsNone
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.HotTrack = False
                Style.StyleController = FrmPri.cxEditStyleController1
                Style.TransparentBorder = False
                Style.PopupBorderStyle = epbsFrame3D
                Style.IsFontAssigned = True
                StyleFocused.BorderStyle = ebsNone
                StyleFocused.Color = clWhite
                TabOrder = 0
                OnEnter = edEstoqueEnter
                Width = 739
              end
              object panInnerEstoque: TLMDSimplePanel
                AlignWithMargins = True
                Left = 2
                Top = 2
                Width = 723
                Height = 32
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 16
                Margins.Bottom = 0
                Align = alClient
                Bevel.Mode = bmCustom
                ParentColor = True
                TabOrder = 1
                OnClick = lbPEstoqueClick
                object lbPEstoque: TcxLabel
                  AlignWithMargins = True
                  Left = 5
                  Top = 0
                  Margins.Left = 5
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alLeft
                  Caption = 'Estoque Atual:'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = []
                  Style.TextColor = clBlack
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  Transparent = True
                  OnClick = lbPEstoqueClick
                  AnchorX = 49
                  AnchorY = 16
                end
                object lbEstoque: TcxLabel
                  Left = 92
                  Top = 0
                  Margins.Left = 0
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alLeft
                  Caption = '(n'#227'o controlar estoque desse produto)'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -17
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.TextColor = clBlue
                  Style.TextStyle = []
                  Style.IsFontAssigned = True
                  StyleFocused.TextColor = clBlack
                  Properties.Alignment.Horz = taLeftJustify
                  Properties.Alignment.Vert = taVCenter
                  Transparent = True
                  OnClick = lbPEstoqueClick
                  AnchorY = 16
                end
                object panMinMax: TLMDSimplePanel
                  AlignWithMargins = True
                  Left = 390
                  Top = 0
                  Width = 333
                  Height = 32
                  Margins.Left = 15
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alRight
                  Bevel.Mode = bmCustom
                  ParentColor = True
                  TabOrder = 2
                  Visible = False
                  OnClick = lbPEstoqueClick
                  object lbLimites: TcxLabel
                    Left = 134
                    Top = 0
                    Align = alRight
                    Caption = 'Limites de Estoque: '
                    ParentFont = False
                    Style.Font.Charset = ANSI_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -13
                    Style.Font.Name = 'Tahoma'
                    Style.Font.Style = []
                    Style.IsFontAssigned = True
                    Properties.Alignment.Vert = taVCenter
                    OnClick = lbPEstoqueClick
                    AnchorY = 16
                  end
                  object lbMinMax: TcxLabel
                    Left = 254
                    Top = 0
                    Margins.Left = 5
                    Margins.Top = 0
                    Margins.Right = 0
                    Margins.Bottom = 0
                    Align = alRight
                    Caption = 'min / max'
                    ParentFont = False
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -17
                    Style.Font.Name = 'Tahoma'
                    Style.Font.Style = []
                    Style.TextColor = clBlack
                    Style.TextStyle = []
                    Style.IsFontAssigned = True
                    Properties.Alignment.Horz = taLeftJustify
                    Properties.Alignment.Vert = taVCenter
                    Transparent = True
                    OnClick = panDadosPrecoClick
                    AnchorY = 16
                  end
                end
              end
            end
          end
        end
      end
      object tsPlus: TcxTabSheet
        Caption = 'tsPlus'
        ImageIndex = 1
        TabVisible = False
        object panPlus: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 942
          Height = 623
          Align = alClient
          Bevel.Mode = bmEdge
          TabOrder = 0
          object Image2: TImage
            Left = 16
            Top = 71
            Width = 128
            Height = 128
            AutoSize = True
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              0080000000800806000000C33E61CB000000097048597300000EC300000EC301
              C76FA864000050324944415478DAEDBD077C1DD5B52FBCA69CDED4AB25D9967B
              C1058C6D4C0D8492845C422021046E0AB929F77E79EFF1F2EEFDF291E485C74D
              72491EA184747A09BD171B771B17DC7197552DC9EAEDF43E33FB5B6BCFCCD191
              2CD9B22D410ADBBFED399A3367CE9C59FFF55F65AFBD47804FDA3F74133EEE0B
              F8A47DBCED13009C5D1B7EDFD8C77D41E3F5433E6923B4FBEFBF5F74BBDDB365
              59BE8631B61477954A92E4D734AD29994C9E88C5626DB8EDC2ED80A228013C26
              82AF130F3FFC700A8682E3AF0E289F00E034EDD5575F9DD5DBDBFB637CF91904
              414E454585505656063E9F0F445104143C442211CDEFF7A783C16002B7B16834
              1A492412614110065455A5EE4760F4A5D3E91EDC762240BA028140573C1E0F74
              777747719B5AB56A956A7CE5470A924F00304ADBB66D9BD4D0D0701B0AF83EAF
              D75BB070E142983E7D3A173A0A12C2E130A090F9DF4EA7131C0E07582C16FE59
              1438A0500181002868181818E05B040ADF87EF31FC6C1AC110224020931CC7F3
              34E3EB46FCEC89542AD582606AFBFDEF7F3F40A7830904C5270018A1DD77DF7D
              320AFD27F8F2DFE7CE9DEB58BC7831D8ED762EC0F6F67608854280DA9D391E35
              9AFF4D9D4080E6811F4F9DFE36B7F43E8107CD03EF042202066DE99CD819EE57
              111C090405097F4B7373F363BB76EDDA73F0E0C128FEAD8DF76FFD0400C3DAAF
              7FFD6B12FE4F6D36DB0F172D5A24CF9B378FEF6F6969819E9E1EAEF1636D048C
              ECD7F459EA04103C3FEF040CF39C28746E5250FBA1BFBF1FDADADA0870116490
              77376CD8F0D3FDFBF737E361C3FD8A736A9F0060587BE69967FE1585F5C0D2A5
              4BAD3366CCE002A9ABAB03A4652E386AA4C5D44870E81872C191769390870BFD
              746DF831D920A17393C93870E0003B76ECD8D62D5BB6FC78E7CE9D7BF0B0388C
              13083E0140567BE9A5973E8514FC0A527EEEFCF9F339E5D7D7D7730193A06A6A
              6AA0A3A38383C16AB5F2CFD096ECBFCBE5E2BE80E90F50378FA1669A0953E0A7
              03077D27FA047C8BCE271C3D7A94A129D8F2E28B2FFEB0B3B3F3001E121B8FDF
              FC09008CF6F2CB2F4F461BBC096D7E156A3F177E6D6D2DD7C6D6D65640CD83EA
              EA6AA00880DE2316200A37ED3B818204465B720EE93575FABC09088FC7C3B7F4
              39934DA88D0606D36720FFA0A0A0000E1D3AA46DDAB4E93504C13D08D43A3C24
              79AEBFFB1300607BF6D9676D48B5CF5755557DE1E28B2FE69A8B379B0B002301
              387CF8305C75D55570FCF8713872E408396A09340D0328381501908BDD8ADD82
              DA2F6078481D727373B9C0E95C741E3225D4091C2470024A4E4E0E3F86C090CD
              0ED9CD04018170CA9429B06EDDBAF43BEFBC73374629CFE2DBEDA0470967DD3E
              0100B6A79F7EFA76B4B78FA1F02D18E79390B9B0287C7BEFBDF7E0E69B6F861D
              3B76903988A357BE1D5B2B3A6A31144E04359AA110ED28700752B503B71E0482
              9B8081EF15E07BB9681EDC080AC904063A995CF0C40E0404B2F5C4240404D3DC
              6437020139A026CBAC59B366FB534F3D750F82E9037C3B742EBFFD1F1E00CF3D
              F79C17B57FEFECD9B3A7AD58B1826B1ADD6C6AE813C035D75C032874D8B3674F
              1F82E13D7C3F8C423A8A6F1FC14E079206DAB17B8CEEA62D0AD3858275A17970
              23201C28743B76475E5E9E1BE9BC105F17133810344EFCDB41004170107B3002
              090230231B0200E51630148459B366110BC45E78E1857BD131FC0BBEDD02E7C0
              02FFE800109E78E2897B50183F5ABE7C39A76ED27EB2E944FB7EBF1FC8197CE5
              9557426F62C3B0AC1B3FB315FB21ECF49A6C30A92BC57132768BB1353B798176
              A33B4107880BBB170142A6C38BDD85A6C03169D2A4BC050B16DC80FE81E3DA6B
              AF05FC5BA0FC80D9882D50E0909F9F4F5109431678FEEDB7DFFE23BE65460567
              77033E6E097C9CED2F7FF9CBA2783CBE9EBC7E8CF9B9974F091A0200BE0737DE
              78236CDEBC99BDF6DA6BAFA21348F6760DF6BDD8FBB12BA73875F67D158D4E5E
              9F0912EA040E1B7607E8A0C8F9D297BE74330AFE9BC846F0E94F7F5AE8EBEBCB
              9C84CC03E505282C2453803EC0D63FFDE94F7F30AEA90FCEB2FD230340403BFA
              2C52F0AD975D7619173A79FDB4C5308B33C025975C028F3DF6582B3A896BD1DE
              6EC6CF6CC0DE05E7E878C1E07DA7AD090EEB75D75DB70229FE1504A38BBE9BB2
              8444FDFC40340304080A43C9B1DCBB77EFE1FBEFBFFF317CEB65D09DC173BA90
              7FB886A1D4120CAF36CE9B37CFB56CD9324EFDE4A1934386D40AE40FA0CDD51E
              7FFCF11771DB801F791D3BD9FE730EBD466BDFFEF6B7172120375F7EF9E59E25
              4B96F0B4B3D9C804906F429DAE13AF69CF6F7FFBDBD7F0ADE7B0B7C2592686FE
              2101F0EB5FFF4AF478BC8FBADDDEAF5F79E59502C5E594ED239A258ADDB87123
              07003A88B5C8125B510B57E3C736824EFD13363073E79D777E0AAF61D5ADB7DE
              6AC590149A9A9A32630CD4C919A52880B61B366C780D7DD2EDF8B117B1B79DED
              77FE83008009BFFBDDA65928DBCB138968281AEDEA9F3C59797CEEDCD9A5975C
              72293A5735108FEBB67FC3868D186F4F458ADD937EFEF9175E4460D4E20948D3
              EAB1A727EA0AEFBAEB2E1BFA236F22235D73DB6DB771E11318CD41277A4D6689
              8081FE480A43D7671108649656C2273EC0C8EDA1873E284A26E3574A52FC36BC
              7F1791878DF7534C26D36A3AADD81C0EAB5054E4C523A3E0F359C1ED96D1B95A
              070B16CC85B7DE7AFD2802600B1EF71E1EF03E763F4C90F6DF73CF3D2EB4F7F7
              5756567EEBCB5FFE32159F7087D41C17A0CCE381030700DFE7660101B0139DD4
              5DC8066FE0C777618F9CED77FFDD01E0AAAB1E946FB8E182F39349F52BB158FC
              F38C415971716E62F1E2529837AF0431205B43A1380B06E3527F7F1C7A7BC3D8
              23685BA3303010014D237BABA2C6F9BBFDFEBEC32E97BBDEE1F01E5394746D3C
              1E38DED757D3F9EAAB7FCA1E9A3D27507CFFFBDFF720F3FC01C3BB5BB04953A7
              4EE5C226AA279344C928D27C4A05D3DFFBF6EDEBF9F39FFFBC120143E3016F83
              9E0750CEF6FBFF2E00F0E083F78A9AF6E92AC6A2D7A7D3B1DB5229E13C8FC7AE
              CE9E5D9C5AB468925C58E8749ABF55C81EC81FA185C349E8EE0E2228424A6F6F
              54C4ADEAF727C46834C1A88603011292656BAB2068C7152551974EA71AE3F104
              BE8EB6A397EEEFE95917DCB66D8729905382E33FFFF33FAB82C1E09328FCCB6E
              B8E10681923C148990C6D36576757571DFA4BCBC9C9BA73D7BF64430247D03D9
              819CBE77B11308A2E772EFFEA60170F7DD5B1C3E9F76452C96BC9D3176852048
              39555579890B2E98245657E7D92449E4253A9AA6287575FDFE8E8E50ECCA2B67
              4CC6501F28BAA2617859D6CF45DBACF199210DCF8DC25758381CC7502C2A7475
              05B4FEFE080A2824F6F585B5783CA5A8AA1246B619604C6B9765A94555B57A45
              49D6C762B1C69E9E132754756778E5CA2B5278D51C143FF9C98F2A62B1C48B4E
              A77319E51BA8E2889C3B0AF548D3E9756363231023101BA0D79F44A7EF350CFF
              2801B51EFB0E1807A7F46F0E000F3E582FAB6AC75C49926F46C7ED66C684A979
              79CEE49C3925EAE2C5E5B2D369719096A3E7AE7476064235355D037575DDE154
              4AD50A0BBDB6DB6E5B3A2F14D20190B909C2D02D0183C040DBECD7A371472AA5
              2018820C41C1702BF4F545189A1601CD0C9A9284964A6911C6D44E594E1CC770
              BF4151D413365BFB574531B5E0739FBB1A2EBDF412147C37B4B6B6E1778968FF
              6B79BC4FC2A791C0FAFA7A95BCFE0F3EF8A01BB1488E1F79FF94863E6BEACFFC
              F68F5BA0636B4CF8E31FDF2F88C7A5CFA652895B55955D68B3596D53A716A496
              2C29974A4B3D369439E92F6A692C76E448677F6D6D77080590D205273272A6EC
              769BFC8D6F2C5B100C22816715570D07C068AF4D1098C0C806C7480D41C8A2D1
              24F7337A7A42D0D919E25B640D21144AF28C9ECD6641F61181CA090B0AA88C8C
              412050CB879E291184D18082D4BF6AF5EAD5ED28FC2DA0A7A23B601C84CF7FDB
              C72DDA53B51FFDE8A0ADB434B04C55E3B7C6E3C26719938BCACA7CC9050B4AD8
              AC594556AB55E21517A9543AD9D0D017387AB4DDDFDE1E8C0B0243810BD825F2
              A29969F6AD568B8500E0F7D31159376104000CFFFB5420A1ED48C030F78FD490
              05C0EF8F21388228E45E040639A261D4FC00CC99C3203757E643CFE8F4BDBB6A
              D52A2A1CA5913FD2FE13308EE1E85F1D003EF860A3B46B97730AA2FDC6542A72
              0B52FC2C8FC709336614288B1695C9B9B90ECA9FA3066B44F1E18307DBFB8F1F
              EF8F60B8A691D0CDB175EC6CB8BF876643FAD6B7962F1A1818190063793D1A48
              4E058C6C709C8A316A6B83F0C823AB60F972370A7FAFBA7FFF81F56FBFFDF609
              F40148F8148A92F337AE99C8BF1A00DC73CF7BAE8282BCABC2E1E8D7D06DBB14
              6F9367EAD4FCD479E7950AD5D5B956D464EEAE0583D1C8E1C31DFD75753D610C
              E790E205AEE544F123097D6813C5EF7CE7A2C57D7D62D6506BD6CD98A0D7D449
              F0E4689A4E2735642E74F6A86C3C8DAF45648430BCFFFE5EB4FD03A808DBB7BE
              F4D24B1865A477839E856C860948437FAC00208A2F2B8BCED734F1CBA954FC66
              4561654545DEF4ECD905EA8205A5568AD9E9B8783C19479A0C1C38D0EEC7983D
              6168D449147FFA2609DFFCE6F245818038C4DF1FAB0F7026C7670B3DAB34900B
              1D190B3DFC00A4D312B85C4EC3B710D191EC456F9F2A8E3EA879E4914777C5E3
              F10F41F7F81BB1272642061F030098F0873FEC2A422FFCF328F4DB315C5A88C6
              DC3A6346617AFEFC2274E8BC561428C6F59ADADADA1F40876EA0B5D51FC31BA7
              9E8EE247FCB62CAE27CFFF8E3B2E5E140A49193D1C6FAD27A193434742CFA6FA
              E6E65E3870A00D62311185EE01B7DB9E49F3D23592F7DFD8D88A11C0E1C8D34F
              FFF0B59E9E5EAAF95B85BD06CE61BCFF74ED2303C0934F1E712512F18B553574
              2BD2DDE75455F45454E4A4E7CE2D4287AEC0A478D6D7170CD7D4F4F88F1EED0A
              C6E309856ECCD8297EB08D545FA7690CFEF99F2F59148D8E2F0048D024709B6D
              682EA1B37300F6EE6D41E107C1E7CB81D2D22210C541A1673702F6C18335B075
              EBDACD2FBFFC0B2A38A1342F157B50C9D7DFE6CCA0071EA8932D96C074599628
              66FF124645D55EAF0D66CF2E5251F0724E8E83276A128964F2D8B1EE81A3473B
              031843F32A1B14FC1909FD5465D6F471FC6E3C46805B6F5DB1209994ADD9EF9D
              CD6B123A69BADDAE6FCD160E2760CF9E46D8B7AF0501E1818A8A52F078DC4659
              B80EC2E1E7A4F7F01EC1B66DFB60FDFA175FDDB8F1694AF2BC0A7A9A77DC6703
              0DB9371371D2575F6DCEEDED0D60CC1EF98AA26897A2ADB64E9D9AABCC9B570C
              55553944F11232BCD2D4D4879ADEE96F6D1D886258C4857E2E147FD28F33046F
              36BAF937DCB06CAE24399CD9C79CC96B12B6C3A16BBBB99FBE63F7EE0674DCEA
              30764FA31357056565C55CA89A917038F93A87FE4D75086BD66C81B7DFFEEDD3
              870F6FA6C2131AE5EB9D08F90CB947E375A2071FDCED7438C40B506B31668F7D
              1E7F777E6EAE4B3DEFBC426DCE9C228BC52259C8AEF7F6862228F481BABABE70
              2291504C7A1FABB69F89C0873792C575D72D99ED70B8DCE6F1C33F3FD26BA275
              123A8D2898769D2EA3B6B61D366E3C8AB6BB074A4A4A31549D8CB6DD859F6506
              E3B0CC794E3711847EFFBBEFAED75E7CF1678F7574D492F0C9F30F8E977C46BD
              67E77A82175EE898118BF57D311A8DDC885EFC792868B4E9F92A6ABB5858E8B2
              9043178B25E2870F77F6D5D57506D18B4F91968F17C59F4EE8D93F95314D58B1
              62C1E4E2E2BC82E1A71B4AC9BAD089DE49E8D95E7C575700D6AE3D04FBF737E1
              310E983B771AD7768A48F4A961FC0CD9577EFA2B336AFFDF79676DE4F9E77FFC
              8CDFDFFD0AEEDE09E738D0339676D600D8BD3B39BFA9A9E3078140FF5791E685
              9212670A355D9B3E3D8F1C3AA4788DB5B5F9433B77B6F49C383110A5D48B2C8F
              9DE2CF45D34FFE894C30CFB974E9FCAAB2B28242F3F4C3B59EA89D844E1A6FB6
              FEFE10ECD8D1089B361D428A4FA2A64F819933ABD1B6BB905554CE2CA4F574CE
              B1CC071CE9F704022158BD7A6DC773CFFDE4E5783CF43CEEDE0F13587E967D77
              CEAABDFF7EFC7F3736D6FF8B2469C52B5654C62A2B3D767DF4CD3C2513522955
              89469389DEDE70BCB3331CC61E0B8562290CFD3472C8860FB09CBB969B3F898D
              F8BBE8F44B96CCA9282F2F2AA6D7745EDA925D77BB87527C3299865DBB1A60F3
              E6A318B7F7405E5E2E3AAF33B8B65BAD325E8F6EDBF589A183E737CF99BD3DF9
              3A4E9E10DAD6D685005B5DF397BFFCEF375555A17AFF63304EF9FED3DDADB36A
              6FBDD5FA8DFEFE811FA109AF5ABAB43C904CA65414B68C9A60B5D924D9E7B35B
              8A8A7C82CB6517CD31781A56C51F97EAEB8BC5BABA42D18E8E607460209E4050
              A4392438330CBD69A6D77CB642CFBEE974AEF3CE9B5E5C5D5D514182268193E0
              4D2F9E847AE0400B6CD95283E15B13AFBE9D31632A4C9B36197273BDFCF3BA53
              C7C6785D275DC5887B89158F1D6BC0EF7D6BDB4B2FDDBF0E7F354DFB6A82098E
              00CC3B7756EDB9E70E5F954EAB0F2512A959975E5A15A0CC1C09906E10EE0714
              AAD8D3139003819864B50A7249498E545191279495E50A4E274F82084C6F6A3C
              9E4A767585A39D9DC1286D69142F1E5710121A1B7D40E5D4421FAE6524309BCD
              2AAD5831AB7CFAF48222A27AB3353676734DA7F08D46EF8A8AF251DBA71B9EBC
              857C07A38FF65D63D3F4D11A8D06EEDD7B08366C78F5ED356B1EA1019F97402F
              F49CF0E562CE1A008F3FBE75B6D59AF3B8DF1FBEF0539F9A1A440068E6E9CC89
              8E7A9E9E46BE186058289D38D12B7574F865F4FE2D4EA7559C3CB9489832A508
              C3A622C1E77399370D59424D2170D06C84081031DCA2E948288CA4C071268C3A
              CA967DD375DB0C424545AE73CE9CD2DCC993F3722C1699868EA9A803CD580DD2
              7C3D74740C201338A0BA7A325ECB14A47B1F172AD5E49F8D4D3F13B9D16FA1FB
              B475EB1E58B9F2D1E7F7EC799BBCFFB7409F7934E1EDAC01F0B39FBD965F5D3D
              E3E99E9ED035175D541171B96CA7B4577A6EDC5C098381DF1F115B5BBBE5A6A6
              6E4B4747BFAC698A54589883944B833F942F2880FC7C0F771A49F0048A9E9E70
              B4B53510EDEE0EC5FAFB63C9783CC9BD0971706CC774C484C2428F75E6CCE2DC
              99338BF29C4E1B4DCD12105418AB1F836DDBEA85D6D65E7E3D8585F9F89DD530
              6952398FDB117E59DEFCD8DAD93A7EE6E7E8F5860DDBE0B5D7EE7BBCB1712FCD
              F4598B7D601CE53CFA759CED07972EFDB6E5CE3BBFFFC7EEEEF06D175C5096C8
              CF77A6B533B458FA4A18BAD9181888486D6DBD524343A7A5B9B9CB120A45458F
              C729A01F8160288429538A61FAF462A8A8C8A7CB269648A3F949B4B505A36D6D
              01ECC15822A168B366157AE7CC29CB2F2870B928BD4C00D9B68D52ACB5D0D0D0
              45D53B02156150B266DAB42968DB73B8B0479A956B0A67A47676CCC03F697CDE
              BC07022FF95ABF7E0B3CF3CC5D7FEAEF6F7B13F4A28FF0597EC119B573C90308
              AFBFDEFCE38E8EAEFFA8AECE87CA4A5F72B4D8FA74F78ADED7C7CB45D073FF02
              FA1071F1F8F14EF9F8F12E0B9A0EB9BF3F22A652293E645050E046BA2E02DD7C
              144379791EE4E4B8E85BC83E88E868B2C387294973189DBA668A20042212AFD7
              AB4E9E5CA5CE9933DD46CC424EDFF0655DC622BCECEB3E5D0AE3D4E7D6570D89
              4663C8005B924F3CF13F1E4B24A21402D2FCC3091B001A22A373F9F08B2F1EBB
              BDBF3FF0605999C7316346516CB8673C1A00CC1069A463B36F0C0D911243900F
              110E47D17F18403F42371B7E7F482267931A3A7782C7E340A72D077C3E27ABA9
              6907A27B8C50A89A96151414281515E5498FC7A3D96C366216CFE0522D237DBF
              79DDE7A6E5239D6FF8F710D87B7BFB3104DCD2FDD45377BE80CCF624EE3E0C1F
              4108C87FF7B97CF89147765EA469E2AB5EAF2D77C182B288191B9FF20B4FAB31
              231FAB4703A2E1580A28E0A8D8DEDE27B7B676C9080CB9BBDB2F4B922CE83795
              1FCFAAAA2A13A5A5A5690CE718513C75ABD522FA7C14FC89A391FB59DD8BD1C1
              72BA14B0042D2DADE8976C38F4ECB33F5989C73F01FA2CA4090F01F97D3D970F
              FFF6B76BCA6DB6BC0D18C64C59BAB422A4036022C6978653AFCE10A6B9A0EFDC
              BDBBC6B671E341173A7282A6A96CDEBC39B1FCFC0265B86DC72800230E8F07C1
              24649F6FD41B348CC5C696DB1FFDBDA11F633C0770E4482D6CDFBE66F3EBAFFF
              6A1DEEA41C400B7C042120FF3DE7F2E11FFCE049F7CC997356A2E02FBAE492EA
              000160ECD539A35CD0305330D6869A2DFCF9CFEF7A0381889C9F9F9B3EEFBCF9
              B1E1611C857F04109FCFEB3EFBDF7E769A3E5CF0664340C28E1DFB60F3E6D7DE
              DCB8F1C94DA04FF7EE38A31F7F0EED9CA475CD3577CB37DF7CCD23F138DCBE7C
              F9D490C532980B38ED170B233987A3A7824FD58810100018D7EFB77FF0C151E7
              AC59D3E3E5E5E52902809170CA1C8BAC21E4E4785DC800635AF1F16CA97DA473
              8C34FA88660B9DD56DE8043EF3FC9E3DEF50F9D73BF011E500F8359CEBE79F7E
              FAD04FD021FBC9922553224EA77C860B279CEC149D4CB530D231C2F0632886AF
              A969B5BEFDF656F7FCF97362454545CA488B3652D62D27C7E7E6EE9770B2CF71
              B6021F4DC34FF7FB29F259BB76235BB9F2774FD6D7EFA669E81F590E80FFE673
              3DC1A38FEEF94A24127F72D1A2AA84D76B1F63BDFAA96FD068023FD5713A009A
              AD6FBDB5DD7DC1050BA314F28DF419AA2BC4D8DF7332038C1C158CA4BD2363E4
              6C1841804422850CB05979E38D7B1FEFEC6CA40C204DFE38A795BFCEA49D3300
              1E7964DBF270585B3D674E099494E4A4461E2439337396A5D963BA3E3A9E0070
              F468B3F59D77B6B9972C591C410068A32476540300F2C8673B936B65233256F6
              DFFABED117820C0643B065CBD6F04B2FFDF4E940A097EA0068BAF7B8AC023AA6
              7B77AE2778E8A157CA182BDA337972B1B7A2227758E9F299E4C44F2FF0916375
              7D4BDE745D5D339A806DC8008B23E8E89D04007D7C02341D00C3A7828EDD731F
              5B3BFD7114C5B4B575C29E3DBB075E78E147CF4622215AEEE523A903C8DCD373
              3DC1D5577FDF7EFDF5B7EC2C2AF24C9F31A33C46B9746A83932F471B021DBCB1
              63D5F4533502406D6DB3F5DD77B7B9972F5F1A763A1D6CA42C1F0D58E6E4E4B8
              CD892659FBC78DDACFE49AEBEB9B90B9F6763CFDF4FFF7422A957A06F4F50727
              6C2592E16D3C8276E10F7FD8FDBADD2E5E77DE7955116DC40181B38F684C4B7D
              BA71068B8500D08226602B0780C36167434340306B1294DC5C1F0240B69CEA7C
              A3D9FE93FD93B34F1C91D93A70E008B2C0E1138F3D76D773E9B4F234BE454BD2
              9CEB2A64636EE30280DFFD6EDBAF4451FA1F4B97CE08E9E95906A7D27C6AEA59
              FEC46CE6C86EE4DD1F3BD66C5DB9729BEBA28B9645ED76BB3652BD8009000CBF
              2C4341357ED43EE2A746B8684A62510E2012A9EB7CF4D17B9E8AC7E34F819E05
              FC9B02003CF0C0C6FF4710E4072FBE784E9046B64EF985A7F8C6B128D3689F27
              7BDAD04000D8EABAFCF24B236691E6D0F3F3BF159FCFE742FAB59EF6CBE0EC35
              7C2C61235DF3860D5BC1E5EAEA7DE8A19F3E1E8D468901EA08A467F9A567DCC6
              0500F7DEFBDED5B26C5F45006023DCB1734C0E8EA9D1CDACAF6FB6BEF7DE56D7
              65975D1A31EA08F87B43F301E403789DB22C5B4E25DBB32D0419ED63230D8CD1
              77AC5EBD09A64D4B067FF18BBB1E090402E4031CFD9B03C08F7EF4C2DCDCDCA2
              3D4B96CC48DA6C56F5ECB5E6EC1B01809CC0B56BB7710638C54F661E8FCB2ECB
              D6610C30BE834054BC640E4069BC906968C649A2278EA514D8BC693B2C5922C6
              7EFAD31FFFB9ABAB8B8A410FE139FF76A2006A77DFFD7299D399B767C1826AA7
              D7EB54B36F66765C7C26B818BD1063E4FD04000A03D7AFDFE5BCECB28BA36634
              3252733ADD56BBDD663B935A80A1D77FB26951557A40441A859A0495EA2251E8
              89740A12C904C4D369DC375869240922D8AC1648C592D0DCD4080BE7C9CA830F
              DCF74C7B7BFB738CF2008C853555F9EB1F0B30DBBFFDDBEF3D5555D3B64E9F5E
              35B5A4242FC54BF7C6E3E2CE0034E4041200D6ADDBE9BCF4D215D15369343A88
              B2DD9E5DF97FBA3632B5935093C938C4121188A1EF93B63A202EDB2108328404
              2B8415014228C7485A8324D5181A55C532A355A235B02849909331C89783ECF8
              A1BD35035DAD1BD2E1FEF5B1FE1335D1FE8EEE446420A2A462136A0EC605004B
              96FCC072F3CDD7ACAAAC2C5F3E79727182264B9CC3259DD5351926C0B269D34E
              E725975C1CA5E1747DD858AFF3339B3E155B163C68074EB764DC68EC409A1E89
              85209A8A43D2EE8280EC8080D50BAD31157A121A84D30CE22A83140A5C657A0D
              24A9046D15620B4D07834A892904971D15C6C154E665E9B8574BB481BFFD60B2
              B37E57B069CF8781B643B5317F67773A194D8D87AC4EBADBE3759EFBEEDBF078
              5E9EEF96D9B3AB626301C0C9B7FEDC5C45230CB46CD9B21701B08C269B66DE3B
              3919240A2E97CB6EB55AE53379CA17093E1C0D43301986B8DB0BA19C32A80DAA
              D08E820FA718172A9F21C4194304CA8A6BE4751A5D3585CFF463D39C15345008
              0C1C25084E7CCF8D60C88374DC9D08D6AB6D0736851B76BC1F3A71E84064E044
              9B32CE40183700DC7BEFFA7B7272DCFFB168517524FBE69FE223E3181BE8A36A
              18065ADE7F7F9F73C58AE551551D9E4C93C8A088A0A7E0058C024597CB613113
              44A76BD15818028928C43D5E68B378A0212643370A3E4593408162FA38C8D62E
              902D34929B064575413A550069251F54C5869A2F72675017B60E823431826680
              0181C0BD677A93661BE13E0B822297A513398940B3D071E8FD70FDD677FD2D7B
              76C6FC1DFD4C1B43F9D558A4305E22F8F9CF577E0769F5E10B2E981526FA1D39
              733728F43375F2463872C85F2600B66FDFEF58BE7C89510CA20B5DA77A662ED7
              C44B88686A22328048F584A70223B1993FD407897C06C1DC0668516BA1A96F0E
              04C2F3415372D19B4F82CDDE0A4ED78760771E068BA58B0320AD3A21952A8244
              A20A62F169108F57432A5990310169C31CA4556680818383A9BACD001308C40A
              364D653E2D9DF0853B8F68ADBB57056A36BCDDDFFAE1874C4D9D73C268DC0070
              CF3D6F5EE77279DEBCF0C2B9111A721D5A74393E847FF2CCDBC1BF29EEA744D0
              8E1D87EC4B969C9FA4B90160683BD2B1A0D703697AFD18F022117E059431B458
              6471247F208ECE5D98452151108116EF7AE8D1B6A1B0FCE8F15742247825F6AB
              D09BEF80BC82B730B23886D710067D16B249FB180DA81688274B9041A64230B4
              0C0281E5DC79544C00180C90E26C802040DCAA9A36080275F035FA0990A7C406
              9C3DB5DB4307DF7ED47F7CC79664B4DFFF5701801FFFF885855E6FE1CE0B2E98
              1DB75A2DDAF8E602461F4E45AF9A2AC1056400B1A9A9C5B263C77EEBD2A517A6
              15858D2A74F3219F8677CF3024A47980740AD1AC378C448310B5C62054DE05C7
              85B720047BF565DE047D2D0335351942035F00BBAD07F20BDEE50B4C0B4CCC7A
              822818948F20D0146E2A22F10A686CF80D8222C5353E9DA17F9D098C7D4C518D
              3988DA50005017F1B55753D4BC40CBBE74EDBAE77A8EAC7C2519EEEE606779C3
              C70D00FFFAAFBF29AAAC9C5B3F674E95969FEF6367377972A8D047FE4974C99A
              215C30E7170B327A81F5F5CDF2BE7D47E4458B16A31229A714BAF19AE9331469
              C53141703A9D36126E341E012507A0BD6037B4C2DB908213208BBA9FA1034006
              96461608DC004E7B17E4E4AD05913B13E2E02D657A0248E5205051C06988A75C
              E8A83E090935090985F601173A81C36481343F164180AF991E370A86D3A04F91
              5635423D3855F42E623DCD62C3C6573A3F7CF54FA97057EBD980603C93B4F27D
              F76DDE969BEB983E6BD654D00B44C728EA538CB7EBEBEAF0FD8241D319A19B7F
              1305200084DADA46F1C0811A71C18205E6F79F42E899D162DDD0E27990059C91
              4410C47207B4E56E830EE11DD0C43EB4F3020240E08297440964011DBCD81288
              F47D15DCEE3AC82B7C0DA390180780C04D80F9BB7400A8C8008AAA2000DC70AC
              F6F7904400C4D31AC4140D920A69BF6698000481FE9AD13E6E0AB8E087990455
              2550309BA66839F1812E5BE3FA977B0FBCF5A778A0A58E9D6112663C0120DC7D
              F76BFFCB6E77DFBD74E9FC30AD0B640AF0D4C21F0DB4FA8A1E834217B923879A
              2AEA765DC876EE442AAEACAD6D101000B070E1024D770207859E99359825749A
              7D6CEEC0EBB5A4D5A45D2BB1417BD136E842DA17A40017BE24EAE5E7B268050B
              FE2C89E54222F04FD83F0B0E6280C295E0701FE131BDCE02909971A4A1DDE600
              400186C3D5D0D4F20304409A03204A204869C8083A0B98402010A40D10B06CA7
              9086507510089C0D70BF45E8D60A6043B7E560F2A5EE0F57FE3119EAA83B1326
              18D7619A3BEEB877DE94290B564F9952029595E5768A6646107996F0470484A0
              375DD3F5306DA8D0696D486446D19822CE3F2749A2565FDF241C39D228CC9E3D
              9B160B1F41D3550E02324FC3EE91A86829473ACF267697ED844EF90D1051F8B2
              241AC21751F8120ADF0E560481044510EFBB0D94E8856095D2E0F21E05379A01
              8BB5172F521A0A004DE59A1CC2A861A0FF720844CA39FD93F613082229BD2789
              0DC807E009244D0703398443B45F355E337DBA94960270BD0776EFF35A71D7A7
              3AD9EEF433EDFBDE7A5849043A3F160060B3FDF087CFFD574141D1B7162C9815
              A647B40CFA0227CFABE3775EE4BFC9102C5FC59B6B3CAD2463EED781A06B7A56
              F5904602A6C99F743AF2DFEAEA9AC4BABA6671D6ACE9E804AA9AAEFD230ADD28
              0E11307810E5642A26C7ECAAE0AF6E862EEB8BE850F40E11BE24C860B3A0F68B
              1E101233418D5D0A5AEC7CD43E27EEA339094970FA7681C3BB038F4FEA737A04
              DD91A37FF16819F4F77E1E7D8B0288A5192448FB517E9C0550F86102013A0429
              DC678220C9994065945261260874EF50F709E8358B0990FB7B069ED7046F6A92
              36A9E3D2E6C096E89FBB8EAC7E5C4D45C7F41CA1F1068070EDB577CC5CB6ECF3
              2BCBCB8B1C33664C93F1D64B438740332F4543D34D674D1CAAF97C4167D1783F
              0B4034CB8B68024CEDE63C2ECB9276F0E0114B4FCF80306952458A6607E9B67F
              50E8BA4328A05C258906E4F4DFAF09FE7418E23362D06A7F0A34CB71B0C802B7
              F5FA6455B4F9A20DEFF5C5A0462F0359A9020BE4810D4D8E4D121000681A706B
              B506C0E1DB0E16570D9E54E5D9407D24508170700904FA2E85444A46CD5721AE
              E0E9741320D0369C44864075274024552E786401721013A00A7D0CDD0750D33E
              DC21EAEE0A99000E800480F71900DFA32069129425172AC57597EF6FD8B4E5FF
              064EEC5DC934E5B48B4C4DC448BDEDDFFEED816F9596CEFCD58C195581C2C242
              BB71F34167F78C500DDB0EC63E61C8BE2CA11BB65BD774DD709BCE1CDD632E7F
              8DD6A53A74E8882D1C8E0B8585F98A118A994E23095CD641C743C6CCFA7D03C1
              1E4855DAE044E9EB90B4EC404A672850192908B51FAD0C5FEB0F1DBE68E75D60
              974570A0B01D5619EC081F2BBEB6D18291B2C89D44D9D60D36DF07E84DD28AEE
              2A4115FF4F43A87F050B06CE17128AC4E269A27F46B69F2100441A288A1A0008
              9BA640F701F0C487C091F33053850E9E7788F57D15C30397C04D0167038C74EC
              DB1914FD3BEE93C11BBB94CD0C7C3391A8DDB7BA6EFBABF726032D7BD9A98645
              27080082C7535EF0CD6FDEF5AB9292A9B7CC9B3723E876FB1C148FEBFEB70900
              53E843BC7A303DF6E14237B64384AEDB755DC5698AD5F6ED7B1CB4A48BCFE7E5
              633E3413CC0014988E053987E6387D341E8664BE0DBAA66E81A0F50DD46886C2
              94B8F089FED13AE0DF48FD423E444EFC1CAC5A313850D82E0B0A1EB7363CBB0D
              056F91C841A41C013287B50F64CF6E106C6D5CFB359646E1CD67C181A5423C25
              01693C99016402164D3121C24D800A91A40A8194EE14921398E4398224D873FE
              0CB2EB1548B30108F57E8325066E1520EDD05389640EA42606657708E40F4891
              8B6172F87BAC5209FA1B3F58FF78DB81950F69A948FBA99CC289AAD591162CB8
              66D635D7DCFABBBCBCD2A5F3E7CF4AB8DD6E1B82513459C0F4F574A74FF799B2
              6DBAE1B16BC3850EBAFB3ED48343E7010120AF5BB7D9515C5C225A2C1681485E
              E3F010B8369233454237B7E9740AA25A14E273E2D096F314C8D64ED46859B7FD
              924EFFC40456D98E827680945C0CE9DE6F8095E58113016047E36FB280959E3D
              446122259A295F60F133C97D10988540108758B40A827D17432C2923ED33D0E9
              5F351D401D04088060964398427A572184FC11009BE769263AD6E0FE34C4066E
              8274FF570448E6E0DD41E5961A014AEF006E0EE2D3A130F435982B4FD2A2CD0D
              078E6D7EE757E18E836FE37D1F759EC144166BD92A2AE6CEBDFEFAEFFE9FD2D2
              A957CD9A55AD16151573738042C8AC11650A1DB79A19B6650B1DF7ABFA04DF21
              2535149649DC3917452BBE9669A9D537DF5C0D33664C1774410F6A7AB6E0F5D9
              C248B9D120D867E44253E95B90B06FE21A6D152D4033CCF5852C251EF6D92C36
              D47227382C1ED0829F01E6BF0619C082C22716A00E0C412058690D4460E662D0
              8C496181D9EA10042D088032160A9C27C4900148C086FD6786F0332C104CE866
              208E0010E406B0FB5EE01143245E8E2CF026F2C97196544088073E07ACFBBF31
              501089D6FD0C4ABE2770C7333E195CC19BD80C875DC853FDD1A68D3DCFB7EE5B
              7BBF9AF08F9A1F984800D0B9ED93264D9F7BF1C55FFAFAAC594B6FCFCBCB7356
              54941BCBB270E162BC6E6AFDC9F46E0ADD300D7C722F79EDA8DD1681427F5273
              BEC8123D6C2108EFBFBF03AAAA2A8CEA1C53E07AB58E394D9C8A5653A9240C58
              D2205C10865EF793E8C085509048F75CF3ED786C01DA0D37D86D0970DA15B4FB
              56B05B5D6055CB41E9BD15ACE929E0B48ACC8E00B09319900D675034571DE023
              BBC8D2809A1C45AF1F9D3F14BE19F645330CC0380390F04349EA1ADFC6D14750
              6100DCF90F81E45C0DD1D82488248A18B3EC42FF2004095511D48E5F32085D8E
              B6EF2040C17FA24F80BA155A0696E8F95059F83E547BDA61E0E0EC9ABAB5877E
              1D6ADBFF2AD3D2C1D18434918DCE4F0BB2552C5C78C59573E75E714D65E5EC4B
              DC6E4F8ED7EBD672727C9ADBED525C2E97462BBB689A31823E58932F9376A380
              2D246DCAD5EB021F32A984D7021C3A740CFAFAFC34B8C3859CCD00F45A670095
              3FAB271C0DE015D920B8680B24EDDB51BBD1A347DB4F363F99980781FE7F4293
              3A1972BDCD5054B41BBCBE1670D9900D442F13C2978118B80E689D73070ADE21
              0B4301C0B313FA601025775063B9C6935029F68F24750620E72F6C507E984040
              26C000410CC141E30736EF2B185A3E0BD144010C042E6716F7136812BA11048A
              90EEFC2903FF67F106447433A0524E2C0AA2671594E4EC81E94E1B089D17449B
              D6692FB57FB88558A0662416F8A89E174059C15CB4CDD38B8BA72E9E39F3C239
              53A69C373D37B7A4DA6A7515D86C0EABCB65537D3E8F929B9B4B459B167AC093
              2E70D1F00E475EA7CF742056AD5A0F1E8F272378FAAD246C53F8E67EDA46D530
              38AF70435BEE1FD179445380946EE555C405D0DBF57588062F4681DAD1D68B90
              879A545AB992E5E5370836D1C5E4F474605DDF32842FF22D3181D57004A92044
              14F4215F0AE9128A6EF3694BF63F82DA1E23CD2720267500840C0084B200409F
              156D1F82DDF30604227321143A9F790AFF2728521D24925E21DDFA0483788991
              1CA28720766038F82C80FB3DC8C76B9966F78037359975EF9E76A061DDDEFF8A
              F536ACC47B725258F8913D3002746F9CD820177B19F64AB73BB772C18225D517
              5E78C565393965B305C123C7628C2F9D9E9BEBE3EBF521202027C78D346DCBC4
              F47A72493316971261FFFEC3D0DDDDC3CBBF344D1922707D81477D4090C0944A
              C7402D00085FB00FC28EB55CF3ED16A27F1B840257427FEF978129C5181188E0
              44C1BA2C12E4E7B46B95331F15EC568691C024A6B67F4770880E6401CE000CBB
              400020079007B3548486162E650240D158026D37093E4C61A06E0658D8F00148
              E8B49FFB0059005050BB55A11FC3441FA4140773E7FD026FCE01211EBA04D49E
              6F21CA143E26C01342CE7500797FC4DFE9675ED1224CB579A040F440BC6591BF
              F6DDEE3FF5D77EF807A626DA863BD01F250078BBF7DE7B73F11A16607C7DADDD
              6EFD4C4141E1F48A8A0ADBD4A9530487C309EDED3D70FC781F0A3481941E8748
              84042A023D390CCD0686786EAEE944F5247C7AD86243C3710023F162A660F5C7
              08D2CF4B231344B007F07D3FD2E900D816CE84AE996F8160ED40EDB570003065
              1274757E03E2910B51932D1C00A4DD6E640137C68793A6BC29E4161E6016AD04
              10006017EC0800316302380004334D69147990095029E3A7D7089A3E40CC6002
              EE00A6F5088004CF4D0039810600281F90E463047CE49049523D08622728D139
              1805388C82C314DAC03A809CC7D0266DE3738A9CF8DBAB6C6E28A6E825344569
              5C9BB3A66DC7DE9F29B19E3DC3E71C7C2400B8FFFEFB659FCFB72C994C7E1135
              F3EA828282EAC99327DBE8E1885EAF1782417A566F2FC4E3716311283D0143F4
              DEDF1F46FBDE448F6945203890B27D18C2E9DA4CF301E9E18B5AA6E45A484522
              034DFDFDEDBDF9F9F205E9F4804343D663188BEBA602691935D779F51468CB7B
              14054FF44DF6DF066174A87ABB6F05962ED3433B49A776B755666E8CF3723DFD
              5050B60DECE04525FB343A86921E0A1200E8E15078BC94495FE9005078560F90
              05340E80445AAF108EE92960C1F40122D94E20BE4E2886E01563A088178A3096
              1919E4A961B4FD42A72E7CC74674B7E961A2310E001B926D053AAD251627D814
              1FEBDA3DAFAE69CD819FC57B9BDE44461C3267624201B06AD52A7B4B4BCB17D3
              E9F40F9C4EE7C2E9D3A70B73E7CE456ACF834422019D9D9DE8BDFB338B3E11F5
              93400910F4E0E4CECE0E5E885956560E8585FAD3B3BBBA3A596B6B7BAAA727DA
              859FAFADA939D61D8D4693D168448944FAB4783C92445F2374EBADB7DC84A660
              AEB96E112FE2A0D72595A05C360041F75AD45E2B07802CE4416FCF5720E0BF1A
              247070EDE7593EEC4E8BCC3C68B8BC764DF03823CC2EDA100439F859E099415B
              96FD978CD2133064A518851E092E48C61D414AFFEA6300BA39A0B18088E1FD9B
              D9403A3EA5EAA3824955AF3B54CD8A52B11744CB5E41938E31905A740790B6BC
              800438002C088072147E297607BA5FE1A625C1BA371B1F0A1E3FFA27A4BAAE6C
              3330610078F6D967E70702815F235D5FBE70E142CBBC79F3B81048D37B7A7A38
              00A8E90B36AA7C3F828583C2E170F02766D323D351B8B44F696F6FEF45501CAF
              ADAD6D6D6C6C0C8742A1249E83CAA1BA8C4EF55871631BFBFAD7BFFE8B582C76
              93B14E90FE500674BCDC0B1681FF822D18353570E1930910D4496872BE0EE1E0
              729E0CB24A14DAA9E0B485C0EBE9633E773FF85C497402DDCCA29481949A0A36
              C1C101C2C703A4C110D064008A0214A3F64F4FEF32417704356E12C80F200010
              231000F450500F11939CF29961063800F41A50F409ACDE678039560A69E8C02F
              490F0ADEEC0800197D9E32AB0E003BC8A0F4CF51EBDE8A3DDB77E8E0FF65E968
              6D767A784200F0CC33CF5C8FC27E04B5BD78FEFCF99CDA49B0A4D9A6D0D11CA0
              AD3FCE854E8F4B471301A5A5A5802121177A6B6B2BDF4F36EB85175E78B1ADAD
              2D8E4C424FCBA6872677189D46BCE8A494E94AEB3F9F6FD92DB7DCF23D3CCFC3
              FC471A0050990439572C81CE192F8224A3F76FB5180C9003D1F045908CCFE2A9
              60BB358E201C00A7A38F399C1170DA53CC6995059BE4028B5680AA3C4F609105
              20ABF9A86D0E86964890280308C664161AB1427B840C20100892697D9CDF0C05
              133C1BA86B7BD4F00BC2A6FD57F4A1E0CCA010B101F7651958ECEF336BDE2F85
              94D04AE68192059400A284B8C07FB90E028600104A2C0E28919101D01F106393
              58C3EAA2759D3B76FD428BF77F80F734535A3EEE0078E28927CA737272762C5D
              BA74126EF923D075DBAE0FADD2E3D10F1C38C059803C7CF40568354FBEBFBBBB
              9B9B00331347C793D0D1717C1DB7B48A362D9E3060089CB43D6508FDA400F18A
              2BAEB81C4DCA4653F8B4241043A728F7FA05D051F614D8D0A3B77106D0594016
              BC203037FF5E8B55C5A8238D765D41A0488C2204BBC525D8253BE33501680284
              7439485A1E08A95260F12A60A96210348B5E85C8983168479E3C7021260D8DE6
              39015E0DC474FA4FE92C402680DE33A95FEFE80CA240D3DCEEA339CAFF3908AE
              77905192824215A52C99D1FA6C169011E8C54211145BD0519563E807E4C0F10D
              730F9ED8B4F3E74AA4FD5D044026353CEE00406DFDD9E2C58B7F44CE1D69B1F1
              5C20DE77EEDCC91F873E63C60C2E746205A4766E0EC8FE9B42373F43DB818181
              DA071E78E05DA4725A40F1A821F4D356BC2C5FBEFC2AABD5BA3603004A33A267
              9CF3E56AE82978096F8CEEFDD3B02E6D3913883AF0249E1412F92A9E04001A13
              B0C90E0CF5ECCC8A60C02D58D017B008E86E216820552C24FD4B20159E0914ED
              9A8F8E31FD00DD9603F7EAE3A60950F45A80685AA7FFA8511994CE00C01C16D6
              8B44E964B21DBD7CB18DA23F81297812FB6EE0E1DF30005850E045F1ABA15072
              F0216A2702B975CB852D2DEBF7FC57CADFF402D2496611AA7105C0A38F3E3A05
              05BFF5B2CB2E2B3B71E244663F09B2A6A686876F44F1070F1EE4DAAE7BFBF249
              42CFDEE271477FF39BDFBCAA287CF58CC6B1089FDA85175EF81914E6BBA6F0F9
              EA1E9E5CF0DC5604819C55DC01B45974EDE7CE9C44237F341834C83E9201003E
              2E2059740088560E001A27C02EC8025E3FB34322B014A2BD970253ED4629D8E0
              0C205D986648A86705E38ACA1DC1A8E10724D283E560260B50812855056919CF
              1FFD26B2FB5411A42200DC6F61ECFFC010FB4F77C78AAC5418BA050AA0101CF9
              6F82D3D90E1D3BAFE83EBEF6C3FB93BD354F304DC9148B8C2B005053AFABAAAA
              7A179D3E013537B39FEC3DD97572C8366CD8C0B59F042F1B4F521E4DF8B46D6E
              6EDEF2F0C30FD31AFA3475BA79AC0040DFE333369BED5DFE238D6CA1945308EE
              AF7921ECDB0C76C9920500D9180CC26BB2C8BAF6F385AA51F89C0D24264AA260
              112DBC3804594090F96B0481803E3782208E0C10E9FE34286937BFA9146C6B46
              A167DA98274805A009556780785A019AF6C99D42B2FB8A5E04C285AF57061308
              F4EA60255316C6B8F049D8520383827BD0033D6CF800E8812426E1090A98CDD2
              271485BE0839CA5470162200DC4759CF879FEE6F5A7DF88FF1AE837F44A3D299
              1967194F0060BC7F7D6565E59BE8F10BE4C0998D1E89469E7D7D7D3DECDEBD5B
              B7B3947EB55AF9EBE120305FD37BDBB76F7F0BCDCA26D097506D1F2B0066CD9A
              B50001B68F4F1AD0CB0D402E2806CF37DC10F16C4381EB8237CD0065046D745D
              B26CD402F0BA0066B08190192216882590FE39035878B9184203E2C10510E8BC
              0E9464A13E270006A780E9DAACFB0271232C1CAC0A36627EB31E50D527889809
              2055336C09063782781C9888B7406C4687603DDA0424444DD1B53F518ADED117
              807C62876F2314866F045F7C21380A56F172B5DE83570E34AD39FA78BCE3C3DF
              228B9C981000DC75D75D17CD9C3973D392254B2C18829DF4BEDBEDE671FF962D
              5BA0BFBF9F33006A29CFEA9937D8A46CF39982184E3EB363C70E7A8E0E2DA1DA
              33D66BC130B210415783E7CD3727FDD88A2781E79B08002F024032355FE26020
              879000407FCBBAF08DC210C32FE1154206088829A844DCD07E628B6464160C74
              7C1E12D129C6E4505DF866289836337B8A3E2E9030923C839342F4AA6073CB53
              C154D94C4842E13BF21E04A09A00F4DF343E3740313281F8C3549972DB00BDB7
              0078D683CBBB1D4DC017C113BE0C1CCE0670E66D86DEFAE9C1A6B5079E8A77EC
              7B10B454CB8400E07BDFFB5EF5B469D376AC58B1A2806E94BE12963CA402977C
              00F20590DA49BBB9F74FC7D07E028869160CA1A57EF9CB5F3E89A1223D457B13
              F6C0195C8E05238CD770FB39D1586ACC5E5C01BE6FFBD0046C033BD9720AF9B8
              D065FEDA6600827201A613683292648001B2004A8090081434C6109B023DED37
              423434CF6000DD049893403371BD3258029ED6062788F279015900A0BF35559F
              312C5AEAC051FCFF822234711071CA57409F954A5FA43800FCD762507C3D08F9
              CF80C77D000A8237812B7C3938C414B8D009EC6E8F0C346D7FFEA944F7BEDF20
              03B44E0800BEF6B5AF15575454ECC21B5F894CC06D3E0DCD528C4F1A9EBD841C
              099B123D6416283A20A7906EACD3E9E400219381A663E03FFEE33F5E40FF819E
              A2852EEF19ADA029E0F93F83807A16BF3B8703A06812147CB7128279EB323E80
              D5000069BF959B027D9F8517848883264934596970897A511FF9E1D34192F14A
              E86AFF1284028B496BF5A9E1A02B695A1DF405F449A02833A665F62BC6BCC021
              53C44CFB811BC9BE13AC85F7405A38C1D3CB46DCCF32CE5FDA83C2BF194DC0A7
              41CC7B1E7C9EC39017BA019CD1F3C129267914D0DE12EA6BF9E0B9C792BD077F
              874E45FB8400E0861B6E701515156D292E2E5E44491D740879AC4F313FD97CDA
              377C5996FCFC7C0E100A09F7EEDD0B4D4D4DDC6124B38080F0BFF2CA2BCF2388
              DEAEABABDB920580B14E7C702390FE3B02E0DF3D1EAF6FD2ACF960FBD224E8CA
              7F050160CD08DF6E089D030035DDC25F23084C5360E41174ADA7D17E02B30B41
              9DC2BFD3403314E2F149D071E2163471E767A6A10CAE093098C6579839255CF7
              0B948CA3A84F1D371941D3E700308AFF25E75A90F2EF430074D2E0A699F4D19D
              3FDAA6F305E8FC2602E04A0C15EB59AEF38490A35481434545921208008D35D7
              F5F5B4ED7AEE0F697FED2318AA744D0800B089B7DD76DB4B18D77F119D41A04E
              DA3C65CA140E004AF792E693D0B914B380402028292901F21D50D870ECD8311A
              0F60F8375D2BADFA55934AA53662DF8F0039829145379A8F188224B972E54A9E
              DAFCC637BE214E9A3489CACE0A103455E864CEC5CF2FA40128BC8EAA38B30807
              CAF0FCBE3FE85E3F77FC4CED970605CF3B4505921E1672A7507F6209B194A2E4
              425FFF9568B68E438EEF10EE43872E5605274E7C0501B070D004189344330030
              7C02950DAE0B606ABF393F900040D5C48CC6F80D2D179CEB91DA7F059AD06586
              7C431920890E60DB9DE8072C001BA420DF9604B7849A6FF1A30F70026C9A15EA
              3F8CB776EE7AE5412DD2F20CA2A83F4393E30C000159E005DC7E89844BC92032
              05B4A5AC200181F693B693C09129C0CCD59BCC40BE0001848042FE01A58BE978
              3211E440A2E0E92707D19CF4212822F8F900B205FD9D46A193C35788EF1713ED
              D35A80C8489C790A0B0B211457E0E9D683B0D3FE2B902CB18CE039130C030015
              875A449D0D642A0FCF30015EABE6844070312453455090870EA57500C2E804B6
              B4DD0AC1D04C304A99B91960260B64F2023A3068C287C2B2B4DE6000A6174519
              00304E62FB10A0F06EB40527CCA48F9902D60110AF0668F911081809B8D0E6E7
              5951EBAD28FCDC6D3C0260893C68D830E948EFAE2DBF66F1AED7F09A26261184
              4DFAEC673FBB1EBFE032D39BA746B69E867E49A824100202A587290B4826A2AC
              AC0CCC5AFDC1B97A227F8FC040EC41D9C24020C0CD0945100406620BDA4F20A2
              50938E231F823E470227C113D0A8934F71BCA50D7EBD7E33BC2BA036D99B0D13
              608040D4B7B2A1FD19E14B620600B4158D890DC0AC904AE7F1EA0F9B35083DFD
              9720006E121214061A518006830CA065310033184031868C15639918627C2103
              02D5B021E404B40194DC0520D7E8B645CD02806A417558810CF07D90143B78E5
              24E4D842180AEE0547FE7A70DAFA21112C86FA5539EF07F61FBC1F5281751396
              0ABEFCF2CB1D28B89DD8E79B9EB70902FA9B8040A37C44F524581A0720207474
              7470CD470792E706A8990EA31949D0FB24583229740C099C8E212793B6747E8B
              F110605BD67361092004164A41777474C27BC7BAE035E139887A3618237F86E6
              537DBF48D180A08340D43B173CE8134465DD07607AA2C81C6402964EE70A2D1D
              5F828EEEAB69EE033063915A8D1923832A37E5BA29D0868E1398260038ED9B00
              30133F7CB1413C21CAABE021F46856D16C20C11CF4E14C902C414ABD4380C00A
              B0311572ED21E6F21C119CF96B90FE5BF860507FDB2CA5E95DFF1BB186631802
              26F74CD86010C6FF3EBCF97B917AABB373F066A78C2079FD34347CC515577081
              516D003102450934704402256090069B43C5262B989D00401A4D5BD278D38410
              28683089CE41AF4D7630F30BA9541AB6D5B4C35FFC87A025E709048A9F0FFD9A
              D44F993D91E5222B24314248718173ED1733268049660808604401024463D570
              BCED76F00716E94B44E9335B7467100C06301E38AD180EA269FFF9282F5333C3
              BA8249FF9A19051860B0EF41103C8C17DB44EC80209030764406F25F09D0F565
              10142BB82C61C8CD39048EBC0D28FC4674FE00ACC854270E9DE73FB1BAE12FE9
              AE86DFE1871B266C3878EEDCB9F9A8A17BF166570D173EDD3493F6A91100AEBD
              F65A3E444C5943D35924334191000D1393C693E9203090B0F5D9B6431FF678F2
              0A60838C63B210990A2A30A1DCC3FE9A666828BC00F6BB1AC09AB30D1C9E4360
              B524786247492C8458E432F0E07BF9B9DB910D920800AEFD8C3B8399F85FC80C
              FD6AE86977F75F0DED5D5F4080E50A26FDEBB35B58D64A6126A3EBD95CC6E70D
              824EF71C006CB0AB06FD6BDAE03E9AF8E1DA00E0D8893F6E0020950B109D0310
              58864E600EB2642FE4E4EE010FDA7DBBA315E37F8621A08C1FF3B1862D539B7A
              B61DF9030B9FA0E711744F584108867D0ED4E86DA8B98B4C4164E7F649D044C7
              A495B366CD821B6FBC11A64E9D0A3470B467CF1E6E1A4C3341F69B6CFDA14387
              F896C0402682F69B5104318839DDCB5C1B9834DFFC1EF217C8BC90EF600E3DD3
              D8FCFA661BAC494F86A8A30E5C452FA2BDDC89827640A8F73B10A139FF489D93
              2A7E036E6703D0E38465BE468024E0968926A8C182DF958FA6650974F55DC7D7
              0032269FC22008D810B9EA32D5F70983B1A2A1F186F633630D009D328C0F9A0B
              462928FC4EEC21A433378324DD870808B663E8ECEDE61189D336C069DF2EC87C
              1BECAA4A37AEB1EE081F3D743FA4B9FD1F52193CEE5100D2FB9328F07FCED67E
              6A24208AEF49E34D1ABFFEFAEBE1BAEBAEE342C3789F0B8EA206A270A4780D01
              21A0D004123885900D0D0D3C2230A99D7C03F391F564F7E99CF437990772FC88
              4D883DE83DFA3C0D4F53F5704BC80EFB73AE81E30CED7CCE5670963C85E74A41
              A4EB7F4132B21C04290D85A5CF407EE11BC80E4914442E5EFB1201BD7F0483C2
              230155F541223E19BDFF39180D94F2750141D77AF3B904A04F681C1A110C2609
              0C1064345CCB72FE460280B95208FF1B5186D7653B8AACB0032CAE8390E3EC06
              97A471A13B50F876DC5A343BB41D9E35D0BAAEFDF574672D25800E4F7451A880
              347E2BDEF067CCC998C34D8051E5C3853C6DDA34F8EE77BF0B18BB73FF201C0E
              73307CFFFBDFA739E0DB901D9A2FBAE8A26A648405284807868DB4C063E6CBB2
              CD80194ED279E93B0824E4F811E0C804987587BC2825948243D252D8C7CA2165
              EB017BC9E32023EDC7BBFE2728B1C5A861085057239455FD1F6677F440A0EF16
              E61FB81EA37DCAFDABFC448CD9F03B5D28342B83ACB5063900CC271518BE80BE
              028D69174C27C0A82036840FA6F3C73202D7ED05B18AB9548C664C08A5CFE4BE
              C1C0B35110ACADCC2DA7049F847E1155340A1243ED171CE8C02683455AE3D6E2
              DABE9D471F63D1760ACF3BD9309B39EE052168CB8BD00CAC41ED5C30DC0F2021
              91904D1B4E7F9343F8831FFC80D33F31C49D77DE498920AAF77B1E8FA17AEF56
              0C134B9019AA115CD3910DAA116025C6CCDFAC327061C8D67C8F00419D588018
              819828148E408DDF031F5897A24194412A7C11996013A47BFF15D4D885FCAE30
              D4A6BC9247C157F4260BF67D1906BAFF45E01C9D99C53EC2E343F46F1506F394
              59428741CD37A93F2B650883F96376B2FDCF98000308EE3D02943EC0A840D486
              4E6A9E6403272D62C1B55FE2DA6F45B076D54D8F34AD4B6E4CB61CF81DFEB0AD
              D9E1DF8401009B8C76FC0B76BBFDF7A86D05C34D010939DB9123109849228A02
              D06ED3DDDA808C80412FD063D4A80A88845D8CE7ABA48C1E02AC1859210F69DE
              8BB6BD1099E1523CA7982D74731CC2FC1E3209666441DFDFDC1582DDEA6238CC
              CA209DB311C4C29740F3DF042C8C5E35DE3C5A5A50B2773057EE3A5052532116
              BC9CAFFF04FA4476E3EE9D0A000C866CD93006C816BE0900761A00F0C5413182
              2BFD9D00DEF7D0800990839AEF112D5CE804003BB2801DB53F152E604DDBCB1A
              7A76D43FC742CD7FC193377D9453C3BCD86E46ADBB1399604E66D11F5A231FA9
              3E5B30A6679F058A56D4FE0DB8A5C7A7514187590340413EF13F3DF6D58B3D8F
              3A0A7F12FA12F720B072CD2FCF1E56363B858B949A36C618C01F0CC3811E07EC
              101743B7BD1600B51D92B301066EC51B9D8F6264BCBA4B90E21C7F8C390D0098
              CB0E42D67678D30659800D67011841FBB31980ACC830DB9FBD152200953F15C0
              7E84E54816F062E86A476F9FE602701050FE82A1F6D74F8B34AD4D6D4AB67CF8
              08A8F14D783FC3235DE9440180B4310FB5ED7C74CCAE44202C4220CCC3BF0B68
              3517B2F3C3433AE3EF0802E475DC3619C2A7C7A8C747B866C900840DD9C68BE1
              E48B089A65FCCD11F20F4671299C77DE799C0974B930686A1F801D916A386011
              2051FC08C6DAAD00BDDF439A5A8E529075879E879282F13C7BD027FF8169F50D
              A77FF87DE4A65F133320C8F6014C53A09AB35B35C878885A162034D3E61B3E80
              F9B71015A0F2E7E0F17200087690196ABEC0B59F9E43803E406CA058ABDF5258
              D7BFA7E66988B5D1486ACBC7313D9CEE1C696B29F6692884E908822908869908
              842528E4BC6C102065F72033ACC12DD5F8D3E35369F83700A71FF9936EBEF9E6
              DF2270BE3B92F04D005004F0A94F7D8A8792FCE26841C8681C3E6C49C056B502
              5A0A5F0596BB06402903F07F014DC16578C37D8C0FF519EB54F16BC99800D30C
              8C725583D3978521DA9FA17F1874F87456D0693F9B15463203B4B47CC9CB427E
              F92BCC215880D62CB3E982E70CC0524E76E270657FCBC6C06AA5F3D0E3E8F9EF
              C0FB1B1FEDE67D14D3C3495B9DA0D33605AEE5040804C22C1482BE9E1B637ED4
              50AAEFA7E5CD7660DF8BBD177497E9B4DF71CD35D7FC3B9EEB97C3FD0D331144
              8DF209575D75152C5BB62CE324F2670D3634C3BB8753D03A0B2386E217915768
              A0CC01D0F74D04C23FA15088FAB31880B30198490E30006ADE47F3353366A49A
              5AAFFF3D040066BE382374C3E337D88069C6C44F10069D40C61C9222E43B43E0
              A8FC2DB3BAEA051B48060388488912F4B797276AD6FA0EC48FED791CD2FE37F1
              1B7B3E8E256246FB2EA26D1AAEF5602FC03E057B89F11E55AA52D56F33E8933D
              C6BC12F615575CF15314E6DD2301407F3E6F026A6B6B2955CDF30E66BEC02C55
              DFF9E13108572C87B6D93B219EBB151DC00472CF67F1D67D5703C567DA7E2123
              70BE20A8794F45BEB8CDD02B623A10061736D30599BDA88176122806E97E9005
              06C33E048CC7926679D6A4601755B04A4966CDDB2A606736392A101384070AD2
              473615D686F61E7E01129D540D75DA95433FF2D9C1C3C040CC603EBA851E9444
              59AA31D5FD67B74B2EB9E45728EC7FE7271E81FE292B480924CA3052F6D13403
              048C77DE790743D30804550FF455CD86CEEAF59070EF03889C8F7CF4030C290A
              8D2BA693517D165EA6BD0DDDD1C3FAFEC852BCF2F291AF78100030D429CCB2F3
              8380184AFD59E1A10C5CF890634B22CDAB601154C126AACC2AA6C1E26A046BC1
              064824535AFDEE92F6CEAD1D6F43F0D8F3F8E17DA7A2FE8F1B00235DC319093D
              BB2D5FBEFCCF28E87F31F300C3014075050402A2FCAF7CE52B70FEF9E773E5A2
              54F19A356B32034551CB2468AF2C81D6A2B799626F17A0FB7B1AC4E7D0A3A951
              F069016CE89EB87732F06EC5D7189C30AAC5FB1C83EE6F225D0F790491C10019
              01EB0C30D40F18CA0019461804002D9B84821672AC29F0C869F4F015260B9A60
              45106067167A2DA6595AE8D29A3A8EF5B56E6FDFA075EFC5904FDD86A70F8EE5
              DEFD3500E09C1B0AF4BF50883F1CCD012400507690C2CF152B56C017BFF8459E
              2E265658BD7A351F5320794C9D3A0D361FEA8786FCDC4478DA46ABE26A124041
              0BA5A1D5B2760960EDA6F1DAA1772F8EA163D77790BBE603F77BB3619C4DF9E6
              968DE40C661C41FE9A52C4A4F56ED4FA5CD47AB4FBFC6F0BD77EDA6A82851800
              5FA792AADAD834D0DF72F8FDCDACEF8397414B523DC6989F21F0770180B973E7
              7E1B238C3F8D06001A4CA27430451C34D874FBEDB7F30C24E524680C82869029
              4F40FEC17FFBEF772AE9DCF9C7C4F3CF2F8B56BFEF4B7B0F884C8C99811F3BE9
              AE69A8F9816BD05FF82A46107983A19ED9B243BF6C336086865939012E78142A
              09DC87C2F7585260457B4FFB0800B260828009B865F184AAB534F7F51E3FB465
              B3D6B7EB0DD012543EDF752AA76F78FBBB00407575F57976BB7D27BEB48F0400
              1A0DA4710833F3482C70C71D7770679052D3640A683CE2F5D75FA7B98D1DC9B4
              BAC93BED5AC1BA68E1D2E4949D1529DF6E2921F945180900B43874E862BCED18
              35A44A8D7DD9EF676BBFF1E6B064908882256DB64B2AD77A2F7672F42414B64C
              25A87CCB351F6451C3BF99100A29A9A6C6AEEE8EDA6D5BB4FE5DAF8396DE06FA
              50EFC7B65CFCC7D95C0882D750D8578F04004A3F9B0342C402940D2467F0A69B
              6EE2FBE8EF7DFBF6F1310934136F62487A58902CEB72A67D66897BE6BC9BA419
              0D7313851F3823523724B41453C8566796ACB632085C2940D7ED00542266881B
              86FB00665460E40424440051B90D85EE20C15BD3CC2D2B02693CBEC7979EA763
              C8E64B5CFB1901804F14F50792C963479B1AFDC7B7BD0FA1A3AB80A9B43C88FF
              E37E60C4C7D9C4D2D2D21B6D36DB532874E7700010C51308B253CFA4FD941740
              079257293DFBECB3744C3F9A8537F1182A415F25C80ED55934EFF2BCE9CB6E29
              5FAC5DC18A0FFA628E46B15F0B40584D231854BE6E338B921F701BB0C87CC8AC
              71CC0C891B5B0A14498349E05651D77697AC80133BED93797D17459886F005FD
              35095EC2CFD132E991A8A6767405FD2DF5C71AA2AD5BDEC5506F1322F0F0581D
              BEBF670050F3141616FE18057B270ADE920D02127A3600CC6E968FD131E8086A
              F8F7ABA8FD948B7803FB410AA30451725A3CE573F2A62CBFA5724ED1A78AA745
              A65B0B1B5D718C02826A04A2AA0289B40D52FE65A0F45D0D6AAA100657A9D605
              49B46D1151830DC11300646EDB0DA70FF4DA001D00BAE04D0090DD492418EBED
              4F44DB9A9BDBFA5A0FED4B0F1CD90CE9C0FBF856EB5842BD53B5BF2700D0BD9A
              E4F3F9BE874CF075D4FC227362A8598B40F69FDAF03108A24E7C6F0F6AFF017C
              7B83D13319347E1E8BABDC9E377D4561D5CC2B27CFCE59563E2551E52DEC7281
              A34748081148A69C900ACD0335B400CDB18FE7740443FB4563EDC04C0210CCE2
              10831DCCADC900742C5E6A34015A7F7F2CD6D3D9D1D973A2A136D67B741BC43B
              7601536884B4F74CEDFD48EDEF0900D468D8B80C23824B910996D3C410D4EC05
              B88F4F0D238D1FCE0286635887EF6DC7D707F1B0F7B053E1E490274FEA8B558A
              4ED1E6AB74E44D5E9A3FA9F2E2D229B98B8A27C3E4FCA2018FC3D32F0B92066A
              BC12D4F02C64825CA0116A7379FFA1A3C0838EA1994C168C8820A5000B8635A5
              7F2016EEEB6AEF1EE86CAA8F0F34EED3A21D1F8216A7EC138D9524CEC6DE8FD4
              FEDE00408D404002A73187A928B76A04C214ECB47CC77CBC6F8554BB67089F9E
              2D7408697F3FBEAE077D10EAC8F0BAB921378C16201424B768F594DBDC05B3DD
              05258B734B0BCECB2BF34ECB2F918BBD3EE6714A3ED1AA150B02B399037FC6B2
              D866F4A78703F47494640A2096145938AA29C1602CE4EFEBF1077BDB3AA2FEB6
              FA64A8E3284B0E1C46541DC7C3E991A4D1F1D0FA21BFE7E396D60435FA5D34C1
              80D273340845E30E1528BC69C80873D02454536D3CDAFF6E04002D6440769F1C
              3F2A42098F45BBC82CE0FF7690AC7992D53BC9E2C899EAF4BAA7397DDE2A87AF
              B0CCEE2C2AB6DBDC3EABCD6617258B440FBBA2E7563055D16881A724C69AB158
              3C9988C7C389A8BF3F11ECEA4D44063A53B1408B960A3682126D45AAA7E9F034
              229A186FC167DFA8BFF766828106A1080CC5D827632F027DC08928B50E3BAD69
              133D536A359E7221713008924790AC39183D1488B2AD50926DB9A2C5EE1344AB
              4B10452BBE6F410741D5544D519554524DC7239A9A0C303539004ABC1FDF1B40
              8E20811328696C441D2FAA3FD5CDF9BB6ED9F7CF101681812A8B68FA10BD490B
              16F265E6CEF5660F3E01850F8113282C208816BED59F8C226672BFFA6C10F233
              A84AD75CE28ECFFC9B68A10FB9E68FEA8B3EAE36DABD3484051FC5CD36BF6B84
              6BFBC8043DEAB57DDC1730D1EDAFE01EFF55B74F00F00FDEFE7FA859D779D20C
              A6040000000049454E44AE426082}
          end
          object edDescrPlus: TcxDBTextEdit
            Left = 16
            Top = 35
            DataBinding.DataField = 'Descricao'
            DataBinding.DataSource = dsMT
            Properties.ReadOnly = True
            Style.BorderStyle = ebsFlat
            TabOrder = 0
            Width = 361
          end
          object cxLabel1: TcxLabel
            Left = 15
            Top = 12
            Caption = 'Produto WEB / NexCaf'#233' PLUS '
          end
          object cxLabel2: TcxLabel
            Left = 150
            Top = 71
            AutoSize = False
            Caption = 
              'Este '#233' um produto do NexCaf'#233' Plus. Para modificar op'#231#245'es desse p' +
              'roduto ou desativar sua venda, acesse o painel de controle desse' +
              ' fornecedor na aba "NexCaf'#233' Plus" da tela de m'#225'quinas do NexCaf'#233 +
              '.'
            Properties.WordWrap = True
            Height = 73
            Width = 233
          end
        end
      end
    end
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
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 232
    Top = 320
    DockControlHeights = (
      0
      0
      36
      0)
    object BarMgrBar1: TdxBar
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmClone'
        end
        item
          Visible = True
          ItemName = 'cmConfig'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object cmKardex: TdxBarButton
      Caption = '&Kardex'
      Category = 0
      Hint = 'Kardex'
      Visible = ivNever
      UnclickAfterDoing = False
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar (F2)'
      Category = 0
      Hint = 'Salvar (F2)'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 4
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmClone: TdxBarButton
      Caption = 'Cl&onar'
      Category = 0
      Hint = 'Clonar este produto e ir ao novo.'
      Visible = ivAlways
      OnClick = cmCloneClick
    end
    object cmConfig: TdxBarLargeButton
      Align = iaRight
      Caption = 'Configurar'
      Category = 0
      Hint = 'Configurar'
      Visible = ivAlways
      LargeImageIndex = 33
      OnClick = cmConfigClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
  end
  object QCat: TnxQuery
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    SQL.Strings = (
      'Select Distinct(Categoria) From Produto')
    Left = 332
    Top = 282
    object QCatCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 632
    Top = 224
  end
  object FMgr: TFormManager
    BarMgr = BarMgr
    PageControl = Paginas
    Left = 410
    Top = 273
  end
  object MT: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ComissaoPerc'
        DataType = ftFloat
      end
      item
        Name = 'ComissaoLucro'
        DataType = ftBoolean
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Fidelidade'
        DataType = ftBoolean
      end
      item
        Name = 'FidPontos'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Preco'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Imagem'
        DataType = ftGraphic
      end
      item
        Name = 'Categoria'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'CustoUnitario'
        DataType = ftCurrency
      end
      item
        Name = 'PodeAlterarPreco'
        DataType = ftBoolean
      end
      item
        Name = 'NaoControlaEstoque'
        DataType = ftBoolean
      end
      item
        Name = 'PermiteVendaFracionada'
        DataType = ftBoolean
      end
      item
        Name = 'Unid'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'EstoqueRepor'
        DataType = ftFloat
      end
      item
        Name = 'Fornecedor'
        DataType = ftInteger
      end
      item
        Name = 'EstoqueMin'
        DataType = ftFloat
      end
      item
        Name = 'EstoqueMax'
        DataType = ftFloat
      end
      item
        Name = 'CadastroRapido'
        DataType = ftBoolean
      end
      item
        Name = 'PrecoAuto'
        DataType = ftBoolean
      end
      item
        Name = 'Margem'
        DataType = ftFloat
      end>
    IndexDefs = <>
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
    AfterInsert = MTAfterInsert
    Left = 376
    Top = 280
    object MTComissaoPerc: TFloatField
      FieldName = 'ComissaoPerc'
    end
    object MTComissaoLucro: TBooleanField
      FieldName = 'ComissaoLucro'
    end
    object MTID: TIntegerField
      FieldName = 'ID'
    end
    object MTFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object MTFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object MTCodigo: TStringField
      FieldName = 'Codigo'
      Size = 30
    end
    object MTDescricao: TStringField
      DisplayWidth = 100
      FieldName = 'Descricao'
      Size = 100
    end
    object MTPreco: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Preco'
    end
    object MTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object MTImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object MTCategoria: TStringField
      DisplayWidth = 35
      FieldName = 'Categoria'
      Size = 35
    end
    object MTCustoUnitario: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'CustoUnitario'
    end
    object MTPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object MTNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object MTPermiteVendaFracionada: TBooleanField
      FieldName = 'PermiteVendaFracionada'
    end
    object MTUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object MTEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object MTFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object MTEstoqueMin: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EstoqueMin'
    end
    object MTEstoqueMax: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EstoqueMax'
    end
    object MTNomeFor: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'NomeFor'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Fornecedor'
      Size = 50
      Lookup = True
    end
    object MTCadastroRapido: TBooleanField
      FieldName = 'CadastroRapido'
    end
    object MTPrecoAuto: TBooleanField
      FieldName = 'PrecoAuto'
    end
    object MTMargem: TFloatField
      FieldName = 'Margem'
    end
    object MTLookupCateg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupCateg'
      LookupDataSet = tCateg
      LookupKeyFields = 'Descricao'
      LookupResultField = 'Descricao'
      KeyFields = 'Categoria'
      Size = 35
      Lookup = True
    end
    object MTLookupUnid: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupUnid'
      LookupDataSet = tUnid
      LookupKeyFields = 'Descricao'
      LookupResultField = 'Descricao'
      KeyFields = 'Unid'
      Size = 5
      Lookup = True
    end
  end
  object dsCAT: TDataSource
    DataSet = QCat
    Left = 472
    Top = 272
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 24
    Top = 232
    object dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel
    end
    object dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel
      ItemOptions.ControlBorderStyle = lbsFlat
    end
  end
  object qUnidade: TnxQuery
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    SQL.Strings = (
      'Select Distinct(Unid) From Produto')
    Left = 404
    Top = 338
    object qUnidadeUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    Left = 440
    Top = 64
  end
  object tCateg: TnxTable
    ActiveRuntime = True
    ActiveDesigntime = True
    Database = Dados.db
    TableName = 'Categoria'
    IndexName = 'uq_Categoria'
    Left = 496
    Top = 360
    object tCategDescricao: TStringField
      FieldName = 'Descricao'
      Size = 35
    end
  end
  object dsCateg: TDataSource
    DataSet = tCateg
    Left = 592
    Top = 352
  end
  object Q: TnxQuery
    Database = Dados.db
    Left = 328
    Top = 336
  end
  object tUnid: TnxTable
    ActiveRuntime = True
    ActiveDesigntime = True
    Database = Dados.db
    TableName = 'Unidade'
    IndexName = 'uq_Unidade'
    Left = 656
    Top = 376
    object tUnidDescricao: TStringField
      FieldName = 'Descricao'
      Size = 5
    end
  end
  object dsUnid: TDataSource
    DataSet = tUnid
    Left = 728
    Top = 392
  end
  object cxImageList1: TcxImageList
    Height = 48
    Width = 48
    FormatVersion = 1
    DesignInfo = 18874416
    ImageInfo = <
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000002000000070000000F00000015000000190000001A0000
          0018000000140000000D00000006000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          00040000001000000021000000370000004E00000060000000690000006B0000
          00680000005B00000048000000300000001C0000000C00000003000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000030000000F0000
          002900000051000C117B00212E99003246AB003E57B9003F58BB003A52B70029
          3BAA0017219E000507990000008C0000006E00000045000000220000000A0000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000050000001B0004054B0028
          3791006187CE0084B4FB0083B6FF0082B6FF0084B7FF0085B8FF0082B5FF007E
          B0FF007AACFF0071A0F5004764C2001219A000000196000000700000003A0000
          0013000000030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000070000002400222E7700719CDF0088
          BCFE008DC0FF0099CEFF08ADDEFF0CB7E7FF0CB8E8FF0AB6E6FF05AEE0FF00A5
          D7FF009CCFFF008FC2FF007EB1FF0076A8FD004D69CA00090CA1000000860000
          004D0000001A0000000400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000080001022D00405599008EC0FB008FC4FF11B2
          E0FF28D4FAFF33DFFFFF37E0FFFF39E1FFFF38E0FFFF35DFFFFF2ADBFFFF1FD7
          FFFF14C7F4FF07B2E2FF00A3D6FF0092C6FF007AADFF006897EF001721A30000
          0091000000520000001900000003000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000070005072F005470B2008FC3FE0CA6D5FF38DBFCFF43E4
          FFFF4DE7FFFF5DEDFFFF65EEFFFF69EFFFFF6DEFFFFF72F0FFFF76F2FFFF6DF0
          FFFF50EAFFFF24DBFFFF14CDF9FF04ACDEFF009FD3FF0083B6FF0072A3FB001E
          2BA6000000900000004B00000013000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000400040524005F7EBA0091C6FE23BCE4FF4CE9FFFF4AE4FFFF55E7
          FFFF50E0F8FF1BA7D2FF61ECFFFF63EDFFFF66EDFFFF6AEFFFFF6FF1FFFF7BF9
          FFFF34ABCDFF5ED6E9FF4CE7FFFF16D5FFFF0AB9E9FF00A0D4FF0088BBFF0071
          A1F900151FA30000008500000039000000090000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000011200596FA60095CAFE2FC5EAFF52EAFFFF49E4FFFF4CE4FFFF52E8
          FFFF45D7F4FF0086BCFF0E99C7FF61ECFFFF66EEFFFF68EFFFFF71F5FFFF25A2
          C9FF006FA5FF49C3DEFF85FAFFFF67EFFFFF1BD7FFFF0CBBEBFF00A0D4FF0083
          B6FF006897EF00080BA00000006D0000001F0000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00050038456C009BCDFD24BDE4FF5AECFFFF45E2FFFF46E2FFFF4AE4FFFF4EE6
          FFFF42D5F3FF1EB6DFFF26B9E0FF0791C3FF61EBFEFF6CF4FFFF1A9BC5FF109D
          CAFF12AFDCFF48C2DEFF7CF7FFFF80F7FFFF70F1FFFF16D5FFFF09B5E5FF009F
          D3FF007CAFFF004663C300000094000000420000000C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000007
          091A0089B6E20AA9D8FF60EDFFFF45E2FFFF3FE0FFFF43E1FFFF47E3FFFF4CE5
          FFFF3FD5F4FF1DB5DEFF4AEBFFFF27BCE2FF068FC1FF159BC7FF13A4D1FF2BE1
          FFFF0FAEDDFF45C2DFFF7AF5FFFF79F4FFFF82F7FFFF5DEBFFFF15D5FFFF02A8
          DBFF0094C7FF0075A9FD0010179F000000690000001A00000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000020047
          5F7C00A0D3FE49DAF4FF56E9FFFF38DEFFFF40E2FFFF43E4FFFF47E5FFFF4DE8
          FFFF40D7F6FF20B7E1FF49E6FFFF44E6FFFF2AC1E6FF1DB3DCFF33E1FFFF2BDC
          FFFF12B0DEFF46C5E1FF7DFBFFFF7EFAFFFF82FBFFFF8CFEFFFF35DFFFFF11C6
          F5FF00A1D3FF007FB2FF003E58BC000000890000002D00000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000002020B0088
          B5D80EB0DEFF6BF2FFFF3ADFFFFF34DBFEFF12B7E4FF12B6E2FF13B2E1FF14B1
          DFFF0DA9D8FF22BAE2FF4DE7FFFF44E2FFFF40E2FFFF3AE2FFFF35DEFFFF2FDE
          FFFF16B3DFFF0F8EBCFF1F9CC5FF1F9AC2FF2199C1FF2195BEFF5BDFF3FF18D7
          FFFF03A9DBFF0090C3FF006F9EF200030598000000440000000B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000001B233500A6
          D8FD3CCFEFFF60EDFFFF2DDBFFFF36DFFFFF0EB5E5FF2DC5E9FF46D8F3FF41D5
          F3FF3DD2F1FF48DDF9FF4FE6FFFF48E3FFFF43E2FFFF3DE0FFFF37DEFFFF32DD
          FFFF30D7FAFF25C3EBFF23C2EAFF20C3EAFF15B2DEFF0A83B2FF83F6FDFF2FDC
          FFFF0EBCEBFF009CD0FF007BAEFF00121A9C0000005800000012000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000041546F00A7
          DCFF62E8FBFF4AE5FFFF2CDAFFFF32DBFFFF37E0FFFF12B7E4FF62E8FCFF67EF
          FFFF60EBFFFF58E9FFFF51E6FFFF4CE4FFFF46E3FFFF41E1FFFF3BDFFFFF35DD
          FFFF30DCFFFF2ADAFFFF25DBFFFF1DD7FFFF0891C3FF73EFFBFF81F8FFFF4DE6
          FFFF16CBF8FF00A2D5FF0080B3FF002737A80000006500000017000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000617E9A00AB
          E0FF77F5FFFF3BDFFFFF29D9FFFF2EDBFFFF33DDFFFF35DCFFFF0FB4E3FF64EC
          FDFF62ECFFFF5BE9FFFF55E7FFFF4FE5FFFF4AE4FFFF45E2FFFF3FE0FFFF39DE
          FFFF34DDFFFF2EDCFFFF29DBFFFF0796C6FF65E3F5FF77F5FFFF7BF4FFFF63EC
          FFFF1ED5FFFF00A5D8FF0087BAFF00364DB30000006A0000001A000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001007192AE09B3
          E4FF7DF7FFFF2DDCFFFF28D8FFFF2BDAFFFF2FDBFFFF34DDFFFF35DBFEFF0FB2
          E1FF65EDFEFF5EECFFFF59E9FFFF53E7FFFF4EE5FFFF48E3FFFF43E2FFFF3DE0
          FFFF37DEFFFF35DEFFFF079BCCFF59DCF2FF72F5FFFF71F1FFFF76F2FFFF6EF0
          FFFF22D8FFFF01A8DAFF008ABDFF004059BB0000006900000019000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000779BB40BB6
          E7FF80F8FFFF2ADAFFFF25D7FFFF29D9FFFF2EDAFFFF33DEFFFF19C6F1FF17B9
          E4FF6AEFFFFF62ECFFFF5DEAFFFF57E8FFFF51E6FFFF4CE4FFFF46E3FFFF41E1
          FFFF3BDFFFFF36E0FFFF15ADD9FF21A9D0FF71F5FFFF6FF1FFFF73F1FFFF6EF0
          FFFF25DBFFFF02AADCFF008BBEFF003E56B70000006000000015000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000007090A706B5
          E6FF83F9FFFF2DDAFFFF21D7FFFF26D8FFFF2CDBFFFF1CCCF5FF12B9E6FF76F4
          FFFF6DF0FFFF66EDFFFF60EBFFFF5BE9FFFF55E7FFFF4FE5FFFF4AE4FFFF45E2
          FFFF3FE0FFFF39DEFFFF37E2FFFF0DA3D2FF2CB2D7FF72F6FFFF72F1FFFF67ED
          FFFF28DBFFFF01A9DBFF0089BCFF003549AD0000004F0000000F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000005E788B00B0
          E6FF81F7FFFF3CDFFFFF1FD6FFFF24D8FFFF1CD0FAFF10BDEBFF80F8FFFF7DF6
          FFFF74F3FFFF6DEFFFFF64EEFFFF5FEBFFFF59E9FFFF53E7FFFF4EE5FFFF48E3
          FFFF44E4FFFF40E3FFFF3AE2FFFF36E3FFFF099FD0FF39C0E0FF74F5FFFF5AE9
          FFFF27D8FEFF00A6D9FF0086B9FF00212D9A0000003900000007000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000003B4B5500B2
          E7FF67E9FAFF55E8FFFF19D4FFFF21D6FFFF00B7ECFF30CEF1FF3AD3F2FF35CE
          F0FF30CBEEFF4EDDF6FF6BEFFFFF62ECFFFF5DEAFFFF57E8FFFF51E6FFFF4DE5
          FFFF36D2F3FF19B5E1FF16B2DEFF13B1DEFF11AEDBFF007EB6FF5ADDF3FF4AE5
          FFFF20CDF6FF00A0D3FF0086B8FD000D12810000002400000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000011151700AF
          E4F734D0F2FF7EF7FFFF15D4FFFF1ED6FEFF1ED4FDFF20D4FBFF22D3FBFF26D5
          FCFF1DCDF6FF32CBEFFF71F2FFFF67EEFFFF62EDFFFF5CEAFEFF56E8FFFF51E7
          FFFF28C3E9FF2AC0E5FF4FDFF8FF50DFF7FF54DFF7FF58E2F7FF6CF0FFFF39DF
          FFFF13BEEBFF0095C8FF006A90DB000101590000001300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000008B
          B3B804BAECFF89F9FFFF3CE0FFFF1AD4FFFF1FD6FFFF23D7FFFF28D8FFFF2DDA
          FFFF23D2FAFF36CEF0FF76F4FFFF6FF1FFFF1BBCE5FF12B4E1FF5BEAFFFF58EA
          FFFF2BC6EAFF31C8ECFF58EAFFFF5AEAFFFF5EEBFFFF64ECFFFF55E8FFFF36DE
          FFFF00AADDFF008EC1FF0032459C0000002F0000000600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000037
          434500B8EBFD47DAF5FF7FF6FFFF16D3FFFF1DD5FFFF21D6FFFF24D7FFFF29DA
          FFFF21D2FBFF38D1F3FF7BF6FFFF14BAE7FF24CCF3FF31D6F8FF0BAFDFFF59E9
          FFFF2FC8ECFF2FC9ECFF56EAFFFF56E8FFFF5AE9FFFF5FEBFFFF42E3FFFF1DC8
          F1FF0099CDFF007EACEC00070959000000130000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000090B7BB00B8ECFF7CF4FEFF5BEAFFFF14D3FFFF1ED5FFFF22D6FFFF27D9
          FFFF20D2FAFF33D0F2FF13BFECFF22CFF6FF3CE1FFFF40E1FFFF35D8F8FF0CAF
          E0FF26C1E8FF2DC9EEFF52E8FFFF54E7FFFF5AE9FFFF4CE5FFFF39DDFDFF00A7
          DAFF0090C3FE0030408F00000023000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000021272800B0E3F112C2F0FF8AFAFFFF4CE5FFFF15D3FFFF1FD6FFFF24D7
          FFFF20D3FCFF00B6EBFF22D2FAFF34DDFFFF36DDFFFF3ADEFFFF40E2FFFF3ADB
          FCFF00A4D8FF2CCAEFFF4FE6FFFF51E6FFFF50E6FFFF46E4FFFF07B3E3FF0096
          CAFF005B79BE0002023200000009000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000046555700B5EAFA1AC7F1FF88F9FEFF5AE9FFFF18D4FFFF1FD6
          FFFF25D8FEFF24D6FEFF2DDBFFFF31DBFFFF33DCFFFF37DDFFFF3BDFFFFF41E1
          FFFF40E0FDFF45E1FEFF4BE4FFFF50E6FFFF4DE7FFFF0CB6E5FF009ACEFF0072
          99D400090D3F0000000C00000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000053646600B6EAFA10C1F0FF79F2FCFF7BF4FFFF37DE
          FFFF1BD6FFFF22D8FFFF28D9FFFF2DDAFFFF31DBFFFF35DDFFFF39DEFFFF3BDF
          FFFF40E1FFFF4AE5FFFF58EBFFFF4AE2FDFF08B1E1FF009BCFFF007199CF000E
          123D0000000B0000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000414E5000ACDDEC00B9EDFF3AD4F4FF82F6
          FEFF75F3FFFF52E7FFFF3DE0FFFF32DDFFFF32DDFFFF38DFFFFF44E2FFFF52E7
          FFFF61EEFFFF5DECFFFF28C8EEFF00A4D7FF009FD1FE005F7CA900080B280000
          0007000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000181D1E0085AAAD00B6E9FB00B8
          EBFF2CCCF1FF55E1F8FF70EDFCFF77F4FFFF76F4FFFF70F1FFFF60E8FCFF46D9
          F4FF22C1E9FF00A7DAFF00A2D5FD0080A7CF002D3B580000000E000000030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000002932340076
          969C00A3D1E500B2E7FE00B1E6FF00B2E7FF00B1E4FF00AEE2FF00ABE0FF00A8
          DAFD008FB5DA0064839C0029364B0001020F0000000300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010005050800212A33004256680050688100526C8C00475D85003343700015
          1A4B0001022C0000001D00000012000000070000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000020000
          000C0000001E000000380000005800000073020201850202018C0101008E0000
          008B000000820000006E00000052000000320000001700000006000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000060000001A0000
          00400E0909762F1C1CA0553434C6694442E6714143F2704041F56C3E3DF15D3B
          35E33B2721C11B130FA40303029B000000880000005D0000002C0000000E0000
          0002000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000001000000090000002A171010715C3A
          3AC3875555FB865354FF7D544DFF7A574CFF775249FF725145FF6D483DFF6D3D
          3AFF6F3F3CFF753B40FF673737F2052B09AD0002009E0000007B000000410000
          0014000000030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000010000000B04030337483030A4905E5EFB8F60
          5DFF9B6B64FFA6746BFFB17573FFB27273FFAE7172FFAC6F70FFAB6D70FFA366
          69FF676041FF2F5D1AFF4D4A28FF1C731FFF075F11DE010D02A10000008A0000
          004A000000150000000200000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000080A08083C694647C7966566FFA2726AFFBD7B
          78FFC07879FFBA7777FFB77474FFB37272FFB17171FFAF6F71FFA96E6EFF3C96
          36FF05AC18FF08AA17FF02900AFF017203FF0A7C14FF0A7413F4011603A30000
          008B000000450000001000000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000030B07072E795252D29C6C6AFFB57B74FFCB7E7FFFC57B
          7CFFC17979FFBE7878FFBA7676FFB77575FFB77374FFAD736FFF1BA62AFF0BAC
          1FFF0EA71EFF0DA71BFF0DA81AFF089C13FF017301FF097A13FF0A7513F60110
          03A1000000800000003100000007000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001000011624A4AB3A27171FFBE817AFFD28181FFCD7F7FFFC97D
          7DFFC57C7CFFC27A7AFFBF7878FFBD7777FFC17379FF32A339FF0FAE26FF11AA
          24FF10A922FF0FA81FFF0DA61CFF0DA71BFF0AA014FF007200FF0A7B14FF0967
          12E40004019F000000620000001A000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000004372A2A68A87778FEBB827BFFD98585FFD38282FFD08181FFCD7F
          7FFFCA7E7EFFC67C7CFFC37B7BFFC5787BFF858C60FF0CB329FF14AD2BFF13AC
          28FF12AB25FF10A923FF0FA820FF0EA71DFF0EA81CFF089911FF017001FF0C7E
          1AFF04370BB40000008E00000038000000080000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000006030316926A6ADDAE7F7BFFE08989FFDC8686FFD88585FFD58383FFD181
          81FFCE8080FFCB7E7EFFC77D7DFFCF7880FF3CA743FF16B231FF16AF2EFF15AE
          2CFF14AD29FF12AB26FF11AA24FF10A921FF0EA71EFF0EA91EFF048408FF0678
          0DFF0C7A17F90109019D0000005D000000140000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00013E2E2E63B17F7FFECE8B85FFE48A8BFFDF8888FFDC8787FFD98585FFD684
          84FFD28282FFCF8080FFCD7F7FFFD37C81FF15B635FF19B234FF18B132FF17B0
          2FFF15AE2DFF14AD2AFF13AC27FF11AA25FF10A922FF0FA91FFF0CA319FF0073
          00FF0D811BFF043009AE0000007D000000220000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001805C5DB2B48683FFEB8F8EFFE88C8CFFE48B8BFFE08989FFDD8787FFDA86
          86FFD78484FFD48282FFD18182FFC2837BFF0FB936FF1BB437FF19B235FF18B1
          33FF17B030FF16AF2EFF14AD2BFF13AC28FF12AB26FF11AA23FF10AB22FF0280
          06FF097F15FF0A6816DC000000900000002F0000000400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000201
          0106A97E7FEBC68D89FFF29091FFEB8F8FFFE88D8DFFE58B8BFFE28A8AFFDE88
          88FFDB8686FFD88585FFD88384FFB58B77FF13BA3BFF1DB63BFF1BB438FF1AB3
          36FF19B233FF18B131FF16AF2FFF15AE2CFF14AD29FF12AB27FF12AB25FF0993
          13FF077C0DFF0F801DFA010501950000003A0000000800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000110D
          0D1BBB8989FBD5938DFFF69292FFEF9191FFEC8F8FFFE98E8EFFE68C8CFFE38A
          8AFFE08989FFDC8787FFDE8486FFA59472FF17BC3EFF1EB73FFF1DB63CFF1CB5
          39FF1AB337FF19B234FF18B132FF17B030FF15AE2DFF14AD2AFF13AD29FF0EA0
          1CFF037906FF108522FE020F04950000003D0000000900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002219
          192BC08E8EFEDE9691FFFE9696FFF79494FFF49392FFF19191FFEE8F8FFFEC8E
          8DFFE78C8CFFE58A8AFFE8888CFF5AAF5CFF17BF42FF20BB42FF1FBA3FFF1FB7
          3EFF1CB63AFF1BB639FF19B335FF18B233FF17B232FF16B12EFF16B12CFF10A8
          23FF037A03FF118A26FF031805860000002C0000000500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001912
          121DC39191FAC3928FFFC2908DFFBF8E8AFFBC8B87FFBB8885FFB78682FFB483
          80FFB1817DFFAE7E7AFFA67D75FF957C6DFF8D7D68FF21AA44FF1FA940FF1EA7
          3EFF1DA43BFF1BA238FF1AA036FF199C33FF189C31FF16982FFF15972CFF1394
          28FF138D28FF118422F3020F04480000000F0000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000513C3C62866364B2856A65BE826762BF816460BF7F625EBF7D605DBF7B5D
          5ABE785957B9765754B9755453B95F5147AC1D6830A9136B2AA914692AA91367
          27A9126525A9116425A90F5C209F0E5A1F9D0F581E9D0E5D1DA70D5D1DA90E5B
          1CA90947158C031A073C00000009000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001919
          19363D3D3D814F4F4FA8575757B95C5C5CC45F5F5FCA5F5F5FC95F5F5FC95F5F
          5FCA5B5B5BC25B5B5BC25F5F5FCA5F5F5FC95F5F5FC95F5F5FCA5C5C5CC45757
          57B94F4F4FA83D3D3D8119191936000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000505050A6C6C6CE67878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7777
          77FFACACACFFACACACFF777777FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF6C6C6CE60505050A00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000005E5E5EC7787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7C7C
          7CFFD3D3D3FFD3D3D3FF7C7C7CFF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF5E5E5EC700000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF9291
          8FFFC9CDDEFFC9CDDEFF92918FFF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF9494
          8FFF8796E6FF8796E6FF94948FFF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF767676FFBEBD
          B9FF8796E6FF8796E6FFBEBDB9FF767676FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000006C6C6CE6787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF737373FFD8D7
          D4FF566AD8FF566AD8FFD8D7D4FF737373FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF6C6C6CE600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000B3783EFFB3783EFFB378
          3EFFB3783EFF00000000000000000000000000000000525252AF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF737370FFD6DA
          EAFF354DCDFF354DCDFFD6DAEAFF737370FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF525252AF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001000001B3783EFFB378
          3EFFB3783EFFB3783EFF00000000000000000000000000000000787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF777777FF7B7A76FFCDD4
          F7FF2842C9FF2842C9FFCDD4F7FF7B7A76FF777777FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF2424244C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000001000001B378
          3EFFB3783EFFB3783EFFB3783EFF000000000000000000000000000000007878
          78FF787878FF787878FF787878FF787878FF787878FF737373FFA5A5A5FFFFFF
          FFFF2E47CBFF2E47CBFFFFFFFFFFA5A5A5FF737373FF787878FF787878FF7878
          78FF787878FF787878FF787878FF656565D70000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000100
          0001B3783EFFB3783EFFB3783EFFB3783EFF0000000000000000000000000000
          0000787878FF787878FF787878FF787878FF787878FF6F6F6FFFDCDCDCFFFFFF
          FFFF4058CEFF4058CEFFFFFFFFFFDCDCDCFF6F6F6FFF787878FF787878FF7878
          78FF787878FF787878FF656565D7000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000010000011B120926332212483D29
          1557402B165BB3783EFFB3783EFFB3783EFFB3783EFF00000000000000000000
          000001010102787878FE787878FF787878FF777777FF767676FFFFFFFFFFC8CF
          F0FF1531C5FF1531C5FFC8CFF0FFFFFFFFFF767676FF777777FF787878FF7878
          78FF787878FE3131316800000000000000000000000000000000222C13417092
          3FD785AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF82AA4AFA2936174F0000
          00000000000000000000160F081F65442390A36D38E8B3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF000000000000
          0000000000000000000029292957676767DD707070FFB8B8B8FFFFFFFFFFFFFF
          FFFFB2B2B1B3B2B2B1B3FFFFFFFFFFFFFFFFB8B8B8FF707070FF676767DD2929
          295700000000000000000000000000000000000000000000000070923FD785AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF303E1B5C000000000000
          00000101000256391E7AAD743CF7B3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFAF763DFA0000
          0000000000000000000000000000000000005C5C5C9FABABABB3383838420000
          000000000000000000000000000038383842ABABABB35C5C5C9F000000000000
          000000000000030301050000000000000000000000000000000085AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF566F30A400000000000000000402
          010579512AADB3783EFFB3783EFFB3783EFFB3783EFFAF753DF9956434D4875B
          2FC1865A2EBFB3783EFFB3783EFFB3783EFFB3783EFFAF763DFA000000000000
          00000404040469696969000000000000000000000000000000002828284A6060
          60CD737371FF737371FF606060CD2828284A0000000000000000000000000507
          030A4053247A759942E10000000000000000000000000000000085AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF82A949F90B0D07130000000000000000714C
          27A1B3783EFFB3783EFFB3783EFF9D6936E0452F18630805030B000000000000
          000020160B2EB3783EFFB3783EFFB3783EFFB0763DFB00000000000000000000
          0000050505057E7E7E7E000000000000000000000000626262D3757575FF7777
          77FF787878FF787878FF777777FF757575FF626262D300000000000000000303
          0105607E36B985AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF577131A70000000000000000402B165BB378
          3EFFB3783EFFB3783EFF7B522BAF0806030C0000000000000000000000001C13
          0A28B3783EFFB3783EFFB3783EFFB0763DFB0000000000000000000000000505
          0505DBDBDBDB0707070700000000000000006D6D6DEA777777FF787878FF7878
          78FF787878FF787878FF787878FF787878FF777777FF6D6D6DEA000000000000
          00001015091F81A849F70000000000000000000000000000000085AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF242C183C00000000040301069F6A37E2B378
          3EFFB3783EFF81572DB80201010300000000000000000000000019100923B378
          3EFFB3783EFFB3783EFFB0763DFB000000000000000000000000020301048BB1
          54FF5D65537300000000000000004D4D4DA3787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF4D4D4DA30000
          000000000000526B2E9E0000000000000000000000000000000085AD4BFF85AD
          4BFF93B65FFFA1BF74FFC4D7A8FF0A0A0A0A000000003B281454B3783EFFB378
          3EFFAB733BF4130D071B000000000000000000000000150E071EB3783EFFB378
          3EFFB3783EFFB0763DFB0000000000000000000000000203010485AD4BFF85AD
          4BFF141A0B27000000000505050B787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF0505
          050B000000002A3718510000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFF0101010100000000724D28A3B3783EFFB378
          3EFF6B4825990000000000000000383838380000000000000000000000000000
          00000000000000000000000000000000000004040404BBD19BFF9FBE71FF7CA1
          46ED01010001000000003434346E787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF3434
          346E000000000B0F06160000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000946333D3B3783EFFB378
          3EFF382613500000000003030303C9C9C9C90000000000000000000000000000
          000000000000000000000000000004040404FFFFFFFFFBFCFAFFFFFFFFFFB3BB
          A6CE00000000000000004B4B4B9F787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF4B4B
          4B9F00000000000000000000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000A66F39ECB3783EFFB378
          3EFF1F150B2C000000003A3A3A3AFFFFFFFFCDDDB5FF85AD4BFF98B967FFFBFC
          FAFFFFFFFFFFC5D8AAFF88AF4FFFFDFDFCFFFFFFFFFF89AF50FFC7D9ACFFCECE
          CECE00000000000000004D4D4DA3787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF4D4D
          4DA300000000000000000000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000B3783EFFB3783EFFB378
          3EFF000000000000000091919191FFFFFFFFA5C37BFF85AD4BFFACC785FFF2F6
          ECFFE3ECD6FF85AD4BFF85AD4BFFFEFEFEFFFFFFFFFF85AD4BFF85AD4CFFE8EA
          E6EF030303030000000038383876787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF3838
          3876000000000C1007170000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
          00000000000000000000D3D3D3D3FFFFFFFF8CB256FF85AD4BFF85AD4BFF85AD
          4BFF8BB154FF85AD4BFF86AD4CFFFFFFFFFFFFFFFFFF85AD4BFFA9C580FFFEFE
          FEFF2D2D2D2E000000000A0A0A15787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF0A0A
          0A15000000002B3818530000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
          00000000000000000000FFFFFFFFFAFBF7FF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF88AF4FFFA6C37CFFFFFFFFFFFFFFFFFFEDF3E5FFFFFFFFFFFBFC
          FAFF546043790000000000000000555555B5787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF555555B50000
          000000000000556F30A30000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBF6FF85AD4BFF85AD4BFF85AD4BFF8DB2
          57FFC8DAAEFFF6F9F2FFFFFFFFFFFFFFFFFFFEFEFEFFE6EEDAFFC9DAAFFF96B8
          64FF769A43E3040502080000000000000000757575F8787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF757575F8000000000000
          000013190B2582A949F90000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CB256FF85AD4BFF86AD4CFFE6EE
          DAFFFFFFFFFFE6EEDAFFAEC887FFFDFEFCFFFDFDFCFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF4C632B92000000000000000001010103686868DD787878FF7878
          78FF787878FF787878FF787878FF787878FF686868DD01010103000000000707
          0707627F37BB85AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5C37BFF85AD4BFF98BA68FFFFFF
          FFFFFFFFFFFF8DB358FF85AD4BFFFDFDFCFFFDFDFCFF85AD4BFF8AB052FF93B6
          60FF85AD4BFF84AC4AFD2F3E1B5B000000000000000000000000272727535C5C
          5CC3787878FF787878FF5C5C5CC3272727530000000000000000010101018E8E
          8E8E85AD4BFF85AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDDDB6FF85AD4BFF8DB256FFFAFB
          F8FFFFFFFFFFADC786FF85AD4BFFFDFDFCFFFDFDFCFF85AD4BFFC5D8A9FFFFFF
          FFFFD9E5C7FF85AD4BFF83AA4AFB626A577A0404040400000000000000000000
          000000000000000000000000000000000000000000000F0F0F0FACACACACFFFF
          FFFF85AD4BFF85AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBF7FF90B45BFF85AD4BFFAFC9
          88FFFAFCF8FFFEFEFEFFE4EDD8FFFEFEFEFFFEFEFEFFE6EEDAFFFFFFFFFFF2F6
          ECFF99BA69FF85AD4BFF90B45BFFF9FBF7FFCACACACA47474747050505050000
          00000000000000000000000000001111111169696969E6E6E6E6FFFFFFFFFFFF
          FFFF85AD4BFF85AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E3C3FF85AD4BFF85AD
          4BFF92B65EFFBCD29CFFD2E1BDFFFDFDFCFFFDFEFDFFD4E2C0FFB7CF95FF8BB1
          54FF85AD4BFF85AD4BFFD6E3C3FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0F0BABA
          BABA98989898A0A0A0A0CDCDCDCDFCFCFCFCEAF1E0FFB5CD92FF96B965FF88AF
          50FF85AD4BFF85AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFF88AF50FF97B966FFBCD29DFFF5F8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2D6A5FF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFFD9E5C7FFDDE8CEFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFFC2D6A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFD0DFBAFF87AE4EFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF93B660FFF2F6EDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0DF
          B9FF8BB155FF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF8BB1
          55FFD0DFB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE9F0DEFF87AE4DFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFFB3CC90FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF5F8F0FFC5D8AAFFA3C177FF92B65EFF92B65EFFA3C177FFC5D8AAFFF5F8
          F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3CC90FF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF8DB257FFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF95B762FF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF0000000000000000000000000000000085AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFFF7F9F3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF87AE4EFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF0000000000000000000000000000000070923FD785AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF70923FD700000000000000000000000000000000222C13417092
          3FD785AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD4BFF85AD
          4BFF70923FD7222C134100000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
