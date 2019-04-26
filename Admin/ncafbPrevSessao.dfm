inherited fbPrevSessao: TfbPrevSessao
  Caption = 'fbPrevSessao'
  ClientHeight = 336
  ClientWidth = 364
  ExplicitWidth = 372
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 364
    Height = 336
    ExplicitWidth = 364
    ExplicitHeight = 336
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 364
      Height = 22
      SunkenBorder = False
      Visible = False
      ExplicitWidth = 364
      ExplicitHeight = 22
    end
    object Grid: TcxGrid
      Left = 0
      Top = 22
      Width = 364
      Height = 266
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataModeController.GridMode = True
        DataController.DataSource = Dados.dsPrev
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.GroupByBox = False
        object TVNumero: TcxGridDBColumn
          Caption = 'M'#225'quina'
          DataBinding.FieldName = 'Maq'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
        object TVSessaoObj: TcxGridDBColumn
          DataBinding.FieldName = 'SessaoObj'
          Visible = False
          VisibleForCustomization = False
        end
        object TVInicio: TcxGridDBColumn
          DataBinding.FieldName = 'Inicio'
          PropertiesClassName = 'TcxTimeEditProperties'
          Width = 90
        end
        object TVPrev: TcxGridDBColumn
          Caption = 'Previs'#227'o de T'#233'rmino'
          DataBinding.FieldName = 'FimPrev'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          OnCustomDrawCell = TVPrevCustomDrawCell
          OnGetDisplayText = TVPrevGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 129
        end
        object TVRestam: TcxGridDBColumn
          Caption = 'Restam'
          OnGetDisplayText = TVRestamGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object TVStatus: TcxGridDBColumn
          DataBinding.FieldName = 'Status'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object LMDSimplePanel1: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 291
      Width = 364
      Height = 45
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      Bevel.Mode = bmStandard
      Color = 11796479
      TabOrder = 2
      object Image1: TImage
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 24
        Height = 40
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
      object lbInfo: TcxLabel
        Left = 31
        Top = 1
        Align = alClient
        Caption = 
          'Utilize a lista acima para visualizar a tempo previsto para t'#233'rm' +
          'ino dos acessos em andamento. Caso o cliente esteja usando em P'#211 +
          'S-PAGO n'#227'o '#233' poss'#237'vel determinar quando a m'#225'quina vai estar disp' +
          'on'#237'vel.'
        Style.TextColor = clBlack
        Properties.WordWrap = True
        Width = 332
      end
    end
  end
  inherited BarMgr: TdxBarManager
    LookAndFeel.Kind = lfFlat
    Left = 72
    Top = 128
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      BorderStyle = bbsNone
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Top = 105
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 128
    Top = 256
  end
end
