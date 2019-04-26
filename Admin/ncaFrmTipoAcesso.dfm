object FrmTipoAcesso: TFrmTipoAcesso
  Left = 291
  Top = 231
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = 'Grupo de Tarifa'
  ClientHeight = 272
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 41
    Width = 414
    Height = 231
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    ExplicitTop = 37
    ExplicitHeight = 235
    object cxLabel1: TcxLabel
      Left = 15
      Top = 19
      Caption = '&Nome do Grupo'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object edNome: TcxTextEdit
      Left = 17
      Top = 39
      Style.BorderStyle = ebsFlat
      TabOrder = 1
      Width = 177
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 71
      Caption = '&Tarifa'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object edCor: TcxColorComboBox
      Left = 18
      Top = 92
      Properties.ColorBoxFrameColor = clWhite
      Properties.ColorComboStyle = cxccsComboList
      Properties.ColorDialogType = cxcdtCustom
      Properties.CustomColors = <>
      Properties.DefaultColor = clWhite
      Properties.DefaultDescription = 'Selecione uma Tarifa'
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.NamingConvention = cxncNone
      Properties.PrepareList = cxplNone
      Properties.ShowDescriptions = False
      Style.BorderStyle = ebsFlat
      TabOrder = 3
      Width = 176
    end
    object LMDSimplePanel1: TLMDSimplePanel
      AlignWithMargins = True
      Left = 17
      Top = 121
      Width = 380
      Height = 93
      Margins.Left = 15
      Margins.Top = 5
      Margins.Right = 15
      Margins.Bottom = 15
      Align = alBottom
      Bevel.Mode = bmEdge
      Bevel.StandardStyle = lsNone
      Color = 15987699
      TabOrder = 4
      ExplicitTop = 125
      object Image1: TImage
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 24
        Height = 86
        Margins.Bottom = 0
        Align = alLeft
        AutoSize = True
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
        ExplicitLeft = 3
        ExplicitTop = 0
        ExplicitHeight = 24
      end
      object cxLabel3: TcxLabel
        Left = 32
        Top = 2
        Align = alClient
        Caption = 
          'Para utilizar esse grupo de tarifa para um determinado cliente b' +
          'asta selecion'#225'-lo no campo "Tarifa Especial" dentro da tela de c' +
          'adastro do cliente. '#13#10#13#10'Para usar em uma m'#225'quina, configure atra' +
          'v'#233's da tela de op'#231#245'es que fica dentro de "M'#225'quinas/Configura'#231#227'o"' +
          '.'
        Style.TextColor = 4868682
        Properties.WordWrap = True
        Width = 346
      end
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 216
    Top = 88
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
      FloatLeft = 67
      FloatTop = 344
      FloatClientWidth = 69
      FloatClientHeight = 44
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      SizeGrip = False
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
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
  end
end
