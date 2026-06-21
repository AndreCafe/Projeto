object TreeListFeaturesDemoMainForm: TTreeListFeaturesDemoMainForm
  Left = 167
  Top = 113
  Caption = 'ExpressQuantumTreeList Features Demo'
  ClientHeight = 606
  ClientWidth = 952
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object nbDemos: TdxNavBar
    Left = 0
    Top = 51
    Width = 249
    Height = 555
    Align = alLeft
    ActiveGroupIndex = 0
    TabOrder = 0
    TabStop = True
    View = 11
    OptionsBehavior.Common.AllowSelectLinks = True
    OptionsBehavior.Common.DragDropFlags = []
    OptionsImage.SmallImages = ilNavBar
    OnLinkClick = nbDemosLinkClick
    object nbgNew: TdxNavBarGroup
      Caption = 'Highlighted Features'
      LargeImageIndex = 0
      SelectedLinkIndex = -1
      SmallImageIndex = 37
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiInplaceEditorsValidation
        end
        item
          Item = nbiNestedBands
        end
        item
          Item = nbiExpandableBands
        end
        item
          Item = nbiMultipleFixedBands
        end
        item
          Item = nbiQuickVisibilityCustomization
        end
        item
          Item = nbiGroupSummary
        end
        item
          Item = nbiMultipleSummary
        end
        item
          Item = nbiSummaryCalculationBase
        end
        item
          Item = nbiDifferentSizesOfImages
        end
        item
          Item = nbiImages
        end
        item
          Item = nbiNodeHeight
        end
        item
          Item = nbiNodeVisibility
        end
        item
          Item = nbiCheckGroups
        end
        item
          Item = nbiMenus
        end
        item
          Item = nbiFullVirtual
        end
        item
          Item = nbiSearch
        end>
    end
    object nbgOld: TdxNavBarGroup
      Caption = 'Samples'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiExplorer
        end
        item
          Item = nbiProviderMode
        end
        item
          Item = nbiPreview
        end
        item
          Item = nbiDragAndDrop
        end
        item
          Item = nbiIniEditor
        end
        item
          Item = nbiInplaceEditors
        end>
    end
    object nbAppearance: TdxNavBarGroup
      Caption = 'Appearance'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiCustomDraw
        end
        item
          Item = nbiStyles
        end>
    end
    object nbiHTML: TdxNavBarItem
      Tag = 17
      Caption = 'HTML'
      SmallImageIndex = 23
    end
    object nbiXML: TdxNavBarItem
      Tag = 18
      Caption = 'XML'
      SmallImageIndex = 24
    end
    object nbiExcel: TdxNavBarItem
      Tag = 19
      Caption = 'Excel'
      SmallImageIndex = 25
    end
    object nbiText: TdxNavBarItem
      Tag = 20
      Caption = 'Text'
      SmallImageIndex = 26
    end
    object nbiPrint: TdxNavBarItem
      Tag = 30
      Caption = 'Print'
      SmallImageIndex = 27
    end
    object nbiPrintPreview: TdxNavBarItem
      Tag = 32
      Caption = 'Print Preview'
      SmallImageIndex = 29
    end
    object nbiPageSetup: TdxNavBarItem
      Tag = 31
      Caption = 'Page Setup'
      SmallImageIndex = 28
    end
    object nbiNestedBands: TdxNavBarItem
      Caption = 'Nested Bands'
      SmallImageIndex = 0
    end
    object nbiExpandableBands: TdxNavBarItem
      Tag = 1
      Caption = 'Expandable Bands'
      SmallImageIndex = 1
    end
    object nbiQuickVisibilityCustomization: TdxNavBarItem
      Tag = 2
      Caption = 'Quick Visibility Customization'
      SmallImageIndex = 3
    end
    object nbiGroupSummary: TdxNavBarItem
      Tag = 4
      Caption = 'Group Summaries'
      SmallImageIndex = 4
    end
    object nbiMultipleFixedBands: TdxNavBarItem
      Tag = 3
      Caption = 'Multiple Fixed Bands'
      SmallImageIndex = 2
    end
    object nbiMultipleSummary: TdxNavBarItem
      Tag = 5
      Caption = 'Multiple Summaries'
      SmallImageIndex = 5
    end
    object nbiSummaryCalculationBase: TdxNavBarItem
      Tag = 6
      Caption = 'Customizable Summary Base'
      SmallImageIndex = 6
    end
    object nbiImages: TdxNavBarItem
      Tag = 8
      Caption = 'Overlay && Dynamic State Images'
      SmallImageIndex = 8
    end
    object nbiDifferentSizesOfImages: TdxNavBarItem
      Tag = 7
      Caption = 'Variable Node Image Sizes'
      SmallImageIndex = 7
    end
    object nbiNodeHeight: TdxNavBarItem
      Tag = 9
      Caption = 'Customizable Node Height'
      SmallImageIndex = 9
    end
    object nbiNodeVisibility: TdxNavBarItem
      Tag = 10
      Caption = 'Node Visibility'
      SmallImageIndex = 10
    end
    object nbiExplorer: TdxNavBarItem
      Tag = 28
      Caption = 'File Explorer (Unbound TreeList)'
      SmallImageIndex = 15
    end
    object nbiDragAndDrop: TdxNavBarItem
      Tag = 21
      Caption = 'Drag And Drop'
      SmallImageIndex = 16
    end
    object nbiProviderMode: TdxNavBarItem
      Tag = 22
      Caption = 'Provider Mode (Virtual TreeList)'
      SmallImageIndex = 17
    end
    object nbiIniEditor: TdxNavBarItem
      Tag = 23
      Caption = 'Ini Editor'
      SmallImageIndex = 18
    end
    object nbiInplaceEditors: TdxNavBarItem
      Tag = 24
      Caption = 'Inplace Editors'
      SmallImageIndex = 19
    end
    object nbiInplaceEditorsValidation: TdxNavBarItem
      Tag = 54
      Caption = 'Inplace Editors Validation'
      SmallImageIndex = 30
    end
    object nbiCustomDraw: TdxNavBarItem
      Tag = 25
      Caption = 'Custom Draw'
      SmallImageIndex = 20
    end
    object nbiCheckGroups: TdxNavBarItem
      Tag = 11
      Caption = 'Radio && Check Groups'
      SmallImageIndex = 11
    end
    object nbiStyles: TdxNavBarItem
      Tag = 26
      Caption = 'Styles'
      SmallImageIndex = 21
    end
    object nbiMenus: TdxNavBarItem
      Tag = 12
      Caption = 'Built-in Context Menus'
      SmallImageIndex = 12
    end
    object nbiPreview: TdxNavBarItem
      Tag = 27
      Caption = 'Preview (Bound TreeList)'
      SmallImageIndex = 22
    end
    object nbiFullVirtual: TdxNavBarItem
      Tag = 13
      Caption = 'Virtual Mode'
      SmallImageIndex = 13
    end
    object nbiSearch: TdxNavBarItem
      Tag = 14
      Caption = 'Search'
      SmallImageIndex = 14
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 249
    Top = 51
    Width = 8
    Height = 555
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 74
    Control = nbDemos
  end
  object Panel1: TcxGroupBox
    Left = 257
    Top = 51
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 6
    Height = 555
    Width = 695
    object pnTreeListSite: TcxGroupBox
      Left = 2
      Top = 55
      Align = alClient
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      TabOrder = 0
      Height = 498
      Width = 691
    end
    object pnHeaderSite: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 1
      DesignSize = (
        691
        53)
      Height = 53
      Width = 691
      object imgLogo: TImage
        Left = 471
        Top = 6
        Width = 216
        Height = 42
        Anchors = [akTop, akRight, akBottom]
        AutoSize = True
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D49484452000000D8
          0000002A0806000000D17A95FF000000017352474200AECE1CE9000000046741
          4D410000B18F0BFC61050000001974455874536F6674776172650041646F6265
          20496D616765526561647971C9653C00000F9349444154785EED9D696C15D715
          C7CDA7B063F67DB3C10BDE313B06B3987D5F535A429BB0B4614BD94A93B44968
          8B84D27EA88A82842A455550A59646AA5AA97C41AD5409A94DC5521308043060
          4C6DC0C1246149584FCF99B9777CE7CEB9B3BCF79CE6B91369E432DB9B37F7FC
          E6FCCFFFDC79CD38BDAAB4F2C36F967C706675097CB4A618CE7DBB18CEBF580C
          1FBF540C17D615C1A5F54550F3DD22B8F272215CDD5808B59B0AE0DA961170FD
          957CF8CFF7F3A17E7B1E34ECC8839BBB72E1D6AE1C68DC9D03B75F1D0EB75FCF
          863BB87CFAE36CF8FCCDA170F7ADA1707FCF10B8FF13CFF201AEAB04808C7889
          EF416B8B810C04AC01018333DF42C05E28817308D9F9EF08C0D60AC03614C1E5
          EF15226405709500DB8C806DB521ABDF660376632701966B01F60901F6DA3068
          22C07E940D9FBD916541766F0F42E6058CD635B4B61B1B7F9FF86141319051FD
          8D52388D807D88809D41C03E5A839009C0288B5DC42C56E30086590C01ABDD5C
          007594C5B636673102CCCA623F40C07E280043C8EE288059598C070CAF251E90
          F81EB4BE18C8F8F7F308D8AA52706531834CB4B29890893660235C32D1CE628A
          4C24C0844CFCEC0D5B26DEE365620C58FC806995258207B0B3241355C0A44CC4
          3A4C0266C94404AC6E0B66B0303211EB308F4CDC9B030FF657C217BF59090FFF
          BC2B062C06AC9502B6B21454997856981D548749B3C3323A48264AB343D46156
          1623B3635BBE558749B3A351CA44ACC5AC3A6CDF58B8F7EB65F0C59F76C3A37F
          BE0B4FEB8EC3B3A62B00F76F033C7D4C70C580C580B54EC04EAD2C1380A14CA4
          3ACC024C6431C5ECA89190A14CBCBA11EB30E9263232B1F1CD5170E7C04A78F0
          D7FDF0E8E23178DA542721F2FBDB2A6F705C57B5BEBA2ACA98669C5A5106B20E
          23B3C37113399928CD0EACC36C37D1363B4826DE786D3434BDB70D1EFCE377F0
          A4F16A18A0F47D58C0DAB469B31B97A362A9C1BFC02CC7C576DAB73C23CDFF3B
          B7B10C1259D2FC6BB7CECB570123A383B298ACC3C84D24997801EB30E9263A3D
          31E126DEFAE51AB8FBB777E1C9EDEB894005B76EDD8213274E1A25A201280E32
          751D81B8215D472C11B8E89874FDBEADFABA4F2DC70C26EBB05508184266D761
          6EB38300934DE7DAEDE3A1F1D0EBF0E5857F610DF524125875757570ECD83178
          E7C001D8BE7327BCB4762DAC58F97CAA0193B01D46D0BAA6DB00C680A5DB88F9
          5CEFC9656520B35835DAF5B22766359D49262A75D8E55726C227877F0E8FEA2F
          8586EAF1E3C750535303EF1D3A6401B578E93298336F1ECC5BB010162C5A048B
          962C85A5CB97B71460041AC9C7B4822C06AC150176C203986D7610604ED37943
          39DC3CF4537874B33634580D376EC0EF0F1F86AD5BB7C29469D360CAF4E930AD
          AA0AAA66CE825973E62064F361DEC205B070D162846E6954C05CC0204055B8EC
          F3919387D369C80C8055E17ADF259DBEE3FFCDB59E588A19CC2513EDA6B32513
          11B26BBF78191E5C3C151AACEAD3A761DFDB6FC38CD9B361DC84093071D22498
          5459099553A7C254846CFA8C993073D66C983D772ECC9D3F1FE62FC42CB67849
          24C04C83430687C8585C8DB6225D0695032C5DAE3DBE4EED0E1060271130C7AE
          17B33ACE6FA9823B7FFF23C0B3A7A1E03A71F2246CDFB103C68C1B0723478F86
          D163C7C298F1E361FCC4891EC8AA66226408A00DD90258809099AC4F2E2BF90D
          22C9415C9A98E36AD265F063C0D265A4425CE7F12508982A13716EE2B5775E85
          478DF5A1C0AAAEAE864D9B37C388C242282C2E86E2D252282B2F877201D95801
          59C5A4C956269B82994C4A451B32AAC716A40C30FACAE4201AE4625A58F83160
          2102375D7639BEB80CA44CAC7E01DDC123BF0D0556434303BCB5670F14141741
          6E5E3EE48D18E140563AB2CC0D194AC5091593A002E56225418635D9B4AA1958
          8F5126A37A6C5E4A01139071596C7740F6A35AEEA02633C924A17555DCB186DA
          EFB88F8CE5E077ED9F2C6078FC3EE61C4DB8CE63F6E0BA2C43CDE73C8C98EDCE
          BDC06D1B70398C4B8DD88F3E87FEEDDB26319D535CCF41E57CEC7DA7FB2B6A52
          DAF7B8723EFADFB4CE789C1C1BF159BBF1EF51E51CF43DE8DF740FFD3E9BEE5B
          F0B112B0B39BE6C3DD3368BB87F8EF0FEFBF6F49BF21D95990357C180CCFCD85
          DCFC7CC82F288082A2222B8B958E1C0923478D825163C658B2711C49C58A0A98
          3459ADC766C00C518FA54A22CA9B87814F16BD5E8BB16607EE97251AD541FDB5
          7D3A38A2EEE38E639D4B01ABBEBF0BFC1400D615CF4181AE37AC3D0F18118CBE
          FB7130E0BA72050253639C0295BD0F3EE7D4AFDB13E4020C3A775043DE335E0A
          5C0447D0F1B4DDA37A0458E18E25C03E7EED4578D8782310ADFAFA7A58B7613D
          F4EDDF1F060C1A0483860EB120CB1E3EDC0599948A2A64522AEAA64715991E28
          155B00309AD5A107B227B30840B86C6782CD03299E839B61C23EC10DFB66A9E0
          260B9878BA5366D183C095C544A0EAFB786A55E63C94A13880B9A0A38CC2654E
          7DDF1506605D8009B0C37E367D8667BC44760A0308772F3875C09DCB3EF6D2BE
          1DF0F8F34F03E1FACB9123505452023D7AF582DE7DFB42BF0108D9E041301821
          1B3A2C1BB2739A2153EB31824CD663AAE93159388BD3A693753FB3250023B9E7
          8184C94024013D990ED711A064FD73F0B9E031C8C483CC6751A60C843EE49335
          4C76E29EF24E1633642F2E63840946BF7DB8CCA9EF6FCA483A60AA1C94E720E0
          292351F073F039E32500E5AE553D87BC16D7182674ECD3875F06C2F5B3BD7BA1
          4BD7AED6D2AD470FE8D9BB37F4EED70FFA0F1C0803870C862159B6541C969303
          3979798E5424204BCAA81EB3A5E268928A548F4DAC808AC99361F214AAC7A6C2
          74ACC75A208305022620D2035E87875C493D43B99E6C0699E879FA19CC9730C1
          1726C0B9F3908C63B398217BB112DA07780A76ABFD41590A17CA9AA6ECE2CA62
          211E2214E4B4A8B52027EB5CE325AE43D683F2BB3B6361C85E2619EA9287091D
          EB4757D39D3BB07AF56A68D7BE3D74E8D4093A75E90299DDBA41F79E36647D10
          B2010899948A1664B939AE7A8C209352B15CD663A23F4690554E9962F5C7FE47
          80E9D9C993758461B282C93CAE4131483FD70019EA2F973C14C11A06A8C00C26
          CEC5491A0A543D58090CCFB5F85C0F6BE4F848B8C03A5340470685A96ED3E165
          C78BA06700B6C64B40ABDFBB50337D123AD604D8952B57602ABA7DCFB56D0BCF
          B56BE740D639331332BB13643DA1579F3E9E7ACC313D4608D3035D46DDF470EA
          3174166513FAAB068C5C41061AA38DCFECEB0A18834CD4F7D1813605692A01E3
          0C0F0A543D588D0EAB21DB181BF78627BD2B3B1ACE699C7183FBD32C16FDBE18
          C78BD9D7FA7EB89EA4A07E1E5AC73E5CB4DA38FAB11C60172F5E8422EC695970
          C98520EBD0013A74EE0C0459D7EEDDAD7ACC824CD4637626C37A8C4C8F3CE12C
          161638FD3199C9A809AD9B1E2D0098AF1D6E9087547799165D4ABA1C2A834C74
          02C6B09D0D6A2EF89269FB08E9E607ADB1AD60CA607ED76380C125990D80F9D9
          E29C3C949998FBAB7F5F6BBC02EE0501E4F7E0E08C23B50EF41EAB034613734B
          B16E72C1A540D6BE63474B2A523DD6B54777948ABD2CA9D86FC000AB1E1B9C35
          D4AEC7502A523D46FD31B2EE9BEB316C422B5271025AF724155B00306E6EE2D1
          001B3FC8A657B73BE752CEE97113956D9CAB19D6C24EFA551483BC91C1E1DB33
          4A04F8A06382B6EB001B324F944CEF8C57C0BDA073520DC7DE93C8C7AA805DBE
          7C1946E22C0C162E01595BAB1EB321CBECD66C7A1064ACE991EF353D5CFD31AA
          C710B216008C73079D8C11B2EFE5071C071807B53550F8797A5FCE4F0E790227
          990C269EDCA6BE0FDB804EB66D100450D07606B0307D2F3FE054C0483673724F
          3FDED36AC1E3A21D2B01ABADAD85126C10FBC125B7B5EBA09B1E548FF5C67ACC
          864C353D86FB981E6A133A95806130737638C1E268F61400C6D9F034D9986D22
          3376BF71A643D4E00B824F0485EEACA9C1646CC8262211C31C13F53B86C81C41
          D9CC335E42CA06816BCA645413061F4B80915B487304C3C0E5981E548FA1B3D8
          5C8F21647D85E981FD313764588F09D3A390313DA83F9662C0686A931EE8BAB5
          EED9272850C36C67DC44CA5C1CF046E72A6AF0055D179E2FCCAC0563911FF57A
          0C35982BE327704E72175D10057DEFB0DBF1BCD4CEF09C5F7C9EEFAB4E81C73E
          7BF60CD6AD5F1F1E2E472AB603AAC73AA2E921FB633DB01EA32674FF81588F0D
          B6EB316A425BFD31948AD67CC5A242ACC78A457FAC795270AA00C360E62C7582
          4D77F4B89A28E9575A1837919C43DD70091AB49449440C006EAE21F7E4F5485E
          19A01C0C1458A600C66D5C6B406FDA46FA8E868744D2E3A5496102CDD3C70B03
          AA00CD7BECAFF6EF8F0C97CC74548F49D383FA63B209CDD663D2F428E04D8F54
          002602997D5505B7E92F69B2B32AF4FDC2DC5C751F939BA865D4A81361133639
          181963D55CA290D7839C0D580360A6A6341BA4780ED7B913C860DC83829D8615
          75CC34C83C0F9FB0E7E324634626BA81A1A5A16ADBBB4C0F6C4267DA4DE86ED8
          8426EBBE0FD56383B01EA3991E6252B0E52C4AD303A5A27416C9F448143021BF
          2843D02F4F994C09D34C784E4A9239C2061AC167DAA64166FAF52B797DBE8D4D
          434007BED14CD94A0B16AEE12AFB419CE5CCBE3367B81E82D3D53FC27F9B6672
          8499DF18F81031C838673609638CD08344079BEE234966AEC1CF3D1C9C168690
          BED18E4D06AE66D3A3B91EB3667AF4529BD0B6E931D499792F667A607F4C9D79
          1F05301F9038C08CD942641BBF89BEF2E7E2E8AFBA9FAFADCDC844F5BA027FBE
          C027A0830A79759E2197A5F4C9BE9CF191AAA95BEAB5726E5C2489288C135376
          94E792D3ABE8AF2AD7D4D76B54F92A5F4D515F5731CE90D1A46FB8635301585B
          6C42BBEB31BB096D4F0A76D7633429D8EA8FA154B426058B7AAC0500232002DF
          0912355B94D9F49E7A4E7F721A64A2842CF0E7E4520418DB98D5325CE08C7B93
          23C8D52A86EB364D678A0C98B816CACA5166D3D3E7A80F1E3F3755BF26FD3DBD
          E8C72260D7530299AB1E53270593E9614F0AB69AD0ACE951423FAA68FAE1D128
          CD5FDA97E4191918A1E697891E95DF6F79709F1F9885183731943CF409E8A0EC
          E50492C1D8A0ED9C2CE28226D090F09183A1ECFFA83518634670B3EA4DF7C81A
          2F517B86B98F52FE3A3194F0B108D76C5C1A52055973135A99142CFA63AE99F7
          C2F4C097341B502AD20B6126C0FC7ED597320F6D272B3CE95FF515D98CEA32BD
          9E2368691D359243395706991808668A00E39AA8A64C629AFEA3CA2A36DB88A0
          23C9C5BD51EC3BB72F19C0147793B219D9EBBA31A1BE95ACD760EA9BC87A2694
          6F32B30EA97870C9B798C31D6B0AEC787DF4DF540FEB36A5DB7EA98021DDBE73
          CAAE3706293A48A67B96B241F99A9D28062C890189018B010B0A9F18B0A03BE4
          B33D062C062C287C62C082EE500CD857F2FF3D96C4307CAD0F8D014B6278E20C
          1667B0A0F089010BBA4371068B33581231120396C4CD8B33589CC182C227062C
          E80E99B7FF1751D1775BCF15EBD10000000049454E44AE426082}
      end
      object pbDemoHeader: TPaintBox
        Left = 8
        Top = 6
        Width = 457
        Height = 37
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 16773091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -26
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnPaint = pbDemoHeaderPaint
      end
    end
  end
  object SaveDialog: TSaveDialog
    Left = 410
    Top = 9
  end
  object dxComponentPrinter: TdxComponentPrinter
    Version = 0
    Left = 546
    Top = 9
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = imgImages
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 448
    Top = 8
    DockControlHeights = (
      0
      0
      51
      0)
    object BarManagerBar1: TdxBar
      Caption = 'MainMenu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 404
      FloatTop = 341
      FloatClientWidth = 23
      FloatClientHeight = 22
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem3'
        end
        item
          Visible = True
          ItemName = 'bsiLookAndFeel'
        end
        item
          Visible = True
          ItemName = 'bsiOptionsView'
        end
        item
          Visible = True
          ItemName = 'bsiAbout'
        end>
      MultiLine = True
      OldName = 'MainMenu'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BarManagerBar2: TdxBar
      Caption = 'Tools'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 25
      DockingStyle = dsTop
      FloatLeft = -769
      FloatTop = 379
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbPrintPreview'
        end
        item
          Visible = True
          ItemName = 'bbInspector'
        end
        item
          Visible = True
          ItemName = 'siExport'
        end>
      OldName = 'Tools'
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bsiLookAndFeel: TdxBarSubItem
      Caption = '&Look And Feel'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object bsiAbout: TdxBarSubItem
      Caption = '&Help'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object bsiOptionsView: TdxBarSubItem
      Caption = 'View &Options '
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbShowIndicator'
        end
        item
          Visible = True
          ItemName = 'bbShowRoot'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end>
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'Element Visibility'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object biShowColumnTotals: TdxBarButton
      Caption = 'ShowColumnTotals'
      Category = 0
      Hint = 'ShowColumnTotals'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowRowTotals: TdxBarButton
      Tag = 1
      Caption = 'ShowRowTotals'
      Category = 0
      Hint = 'ShowRowTotals'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowColumnGrandTotals: TdxBarButton
      Tag = 2
      Caption = 'ShowColumnGrandTotals'
      Category = 0
      Hint = 'ShowColumnGrandTotals'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowRowGrandTotals: TdxBarButton
      Tag = 3
      Caption = 'ShowRowGrandTotals'
      Category = 0
      Hint = 'ShowRowGrandTotals'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowTotalsForSingleValue: TdxBarButton
      Tag = 4
      Caption = 'ShowTotalsForSingleValue'
      Category = 0
      Hint = 'ShowTotalsForSingleValue'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowGrandTotalsForSingleValue: TdxBarButton
      Tag = 5
      Caption = 'ShowGrandTotalsForSingleValue'
      Category = 0
      Hint = 'ShowGrandTotalsForSingleValue'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowColumnFields: TdxBarButton
      Caption = 'Show Column Fields'
      Category = 0
      Hint = 'Show Column Fields'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowDataFields: TdxBarButton
      Tag = 1
      Caption = 'Show Data Fields'
      Category = 0
      Hint = 'Show Data Fields'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowFilterFields: TdxBarButton
      Tag = 2
      Caption = 'Show Filter Fields'
      Category = 0
      Hint = 'Show Filter Fields'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowFilterSeparator: TdxBarButton
      Tag = 3
      Caption = 'Show Filter Separator'
      Category = 0
      Hint = 'Show Filter Separator'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biShowRowFields: TdxBarButton
      Tag = 4
      Caption = 'Show Row Fields'
      Category = 0
      Hint = 'Show Row Fields'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object bbPrintPreview: TdxBarButton
      Tag = 2
      Caption = 'Print Preview'
      Category = 0
      Hint = 'Print Preview'
      Visible = ivAlways
      ImageIndex = 0
      OnClick = PrintCommand
    end
    object bbPrint: TdxBarButton
      Caption = 'Print'
      Category = 0
      Hint = 'Print'
      Visible = ivAlways
      ImageIndex = 2
      OnClick = PrintCommand
    end
    object dxBarButton4: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = '&File'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'siExport'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPageSetup'
        end
        item
          Visible = True
          ItemName = 'bbPrintPreview'
        end
        item
          Visible = True
          ItemName = 'bbPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton8'
        end>
    end
    object bbPageSetup: TdxBarButton
      Tag = 1
      Caption = 'Page Setup'
      Category = 0
      Hint = 'Page Set&up'
      Visible = ivAlways
      ImageIndex = 1
      OnClick = PrintCommand
    end
    object dxBarButton8: TdxBarButton
      Caption = 'Exit'
      Category = 0
      Hint = 'E&xit'
      Visible = ivAlways
      OnClick = dxBarButton8Click
    end
    object bbInspector: TdxBarButton
      Caption = 'Modify Properties...'
      Category = 0
      Hint = 'Modify Properties...'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 7
      OnClick = bbInspectorClick
    end
    object siExport: TdxBarSubItem
      Caption = 'Export To ...'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton16'
        end
        item
          Visible = True
          ItemName = 'dxBarButton17'
        end
        item
          Visible = True
          ItemName = 'dxBarButton19'
        end
        item
          Visible = True
          ItemName = 'dxBarButton18'
        end>
    end
    object dxBarButton16: TdxBarButton
      Caption = 'HTML'
      Category = 0
      Hint = 'HTML'
      Visible = ivAlways
      ImageIndex = 3
      OnClick = ExportToClick
    end
    object dxBarButton17: TdxBarButton
      Tag = 1
      Caption = 'XML'
      Category = 0
      Hint = 'XML'
      Visible = ivAlways
      ImageIndex = 4
      OnClick = ExportToClick
    end
    object dxBarButton18: TdxBarButton
      Tag = 3
      Caption = 'Text'
      Category = 0
      Hint = 'Text'
      Visible = ivAlways
      ImageIndex = 6
      OnClick = ExportToClick
    end
    object dxBarButton19: TdxBarButton
      Tag = 2
      Caption = 'Excel'
      Category = 0
      Hint = 'Excel'
      Visible = ivAlways
      ImageIndex = 5
      OnClick = ExportToClick
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
    object dxBarSubItem6: TdxBarSubItem
      Caption = 'Column'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biColumnFar'
        end
        item
          Visible = True
          ItemName = 'biColumnNear'
        end>
    end
    object dxBarSubItem7: TdxBarSubItem
      Caption = 'Row'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biRowFar'
        end
        item
          Visible = True
          ItemName = 'biRowNear'
        end>
    end
    object biColumnFar: TdxBarButton
      Caption = 'Far'
      Category = 0
      Hint = 'Far'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 3
      Down = True
    end
    object biColumnNear: TdxBarButton
      Caption = 'Near'
      Category = 0
      Hint = 'Near'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 3
    end
    object biRowFar: TdxBarButton
      Caption = 'Far'
      Category = 0
      Hint = 'Far'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      Down = True
    end
    object biRowNear: TdxBarButton
      Caption = 'Near'
      Category = 0
      Hint = 'Near'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
    end
    object dxBarSubItem8: TdxBarSubItem
      Caption = 'Selection'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem9: TdxBarSubItem
      Caption = 'Include Cells'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biCrossCells'
        end
        item
          Visible = True
          ItemName = 'biGrandTotalsCells'
        end
        item
          Visible = True
          ItemName = 'biTotalsCells'
        end>
    end
    object biCrossCells: TdxBarButton
      Caption = 'Cross Cells'
      Category = 0
      Hint = 'Cross Cells'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
    end
    object biGrandTotalsCells: TdxBarButton
      Caption = 'Grand Totals Cells'
      Category = 0
      Hint = 'Grand Totals Cells'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
    end
    object biTotalsCells: TdxBarButton
      Caption = 'Totals Cells'
      Category = 0
      Hint = 'Totals Cells'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
    end
    object dxBarButton15: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object biMultiSelect: TdxBarButton
      Caption = 'Multi select'
      Category = 0
      Hint = 'Multi select'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biHideFocus: TdxBarButton
      Caption = 'Hide Focus Rect when Inactive'
      Category = 0
      Hint = 'Hide Focus Rect when Inactive'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biHideSelection: TdxBarButton
      Caption = 'Hide Selection when Inactive'
      Category = 0
      Hint = 'Hide Selection when Inactive'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object bbShowIndicator: TdxBarButton
      Caption = 'Show Indicator'
      Category = 0
      Hint = 'Show Indicator'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      Lowered = True
      OnClick = bbShowIndicatorClick
    end
    object bbShowRoot: TdxBarButton
      Caption = 'Show Root'
      Category = 0
      Hint = 'Show Root'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = bbShowRootClick
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Grid Lines'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbGridLinesNone'
        end
        item
          Visible = True
          ItemName = 'bbGridLinesHorizontal'
        end
        item
          Visible = True
          ItemName = 'bbGridLinesVertical'
        end
        item
          Visible = True
          ItemName = 'bbGridLinesBoth'
        end>
    end
    object dxBarButton11: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object cxBarEditItem1: TcxBarEditItem
      Category = 0
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxRadioGroupProperties'
      Properties.Items = <
        item
          Caption = 'Vertical'
        end
        item
          Caption = 'Horizontal'
        end
        item
          Caption = 'Both'
        end
        item
          Caption = 'None'
        end>
    end
    object cxBarEditItem2: TcxBarEditItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxRadioGroupProperties'
      Properties.Items = <>
    end
    object bbGridLinesNone: TdxBarButton
      Caption = 'None'
      Category = 0
      Hint = 'None'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 33
      OnClick = bbGridLinesClick
    end
    object bbGridLinesHorizontal: TdxBarButton
      Tag = 1
      Caption = 'Horizontal'
      Category = 0
      Hint = 'Horizontal'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 33
      OnClick = bbGridLinesClick
    end
    object bbGridLinesVertical: TdxBarButton
      Tag = 2
      Caption = 'Vertical'
      Category = 0
      Hint = 'Vertical'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 33
      OnClick = bbGridLinesClick
    end
    object bbGridLinesBoth: TdxBarButton
      Tag = 3
      Caption = 'Both'
      Category = 0
      Hint = 'Both'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 33
      OnClick = bbGridLinesClick
    end
  end
  object dxSkinController: TdxSkinController
    OnSkinControl = dxSkinControllerSkinControl
    Left = 480
    Top = 8
  end
  object dxPSEngineController1: TdxPSEngineController
    Active = True
    PreviewDialogStyle = 'Ribbon'
    Left = 618
    Top = 11
  end
  object ilBarManager: TImageList
    Left = 584
    Top = 8
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00848400008484000084840000848400008484000084840000848400008484
      000084840000FFFFFF00FFFFFF00000000000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF0000840000848484000084000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00848400008484000084840000848400008484000084840000848400008484
      000084840000FFFFFF00FFFFFF00000000000084000084848400008400008484
      8400008400008484840000840000FFFFFF00008400008484840000840000FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000840000848484000084
      00008484840000840000FFFFFF00008400008484840000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00840000008400000084000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00000000000084000084848400008400008484
      840000840000FFFFFF0000840000848484000084000084848400C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      000084000000FFFFFF00848400008484000000840000FF00000084000000FFFF
      FF0084000000FFFF0000FFFFFF00000000000000000000840000848484000084
      0000FFFFFF000084000084848400008400008484840000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6008400
      0000FFFFFF00FFFFFF0084840000FFFF0000848400000084000084000000FFFF
      FF00FFFFFF0084000000C6C6C60000000000000000000000000000840000FFFF
      FF0000840000848484000084000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      000084000000FFFFFF0084840000FFFFFF00FFFF00008484000084000000FFFF
      FF0084000000FFFF0000FFFFFF00000000000000000000840000FFFFFF000084
      00008484840000840000848484000084000084848400C6C6C600FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF000000000000000000FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00848400008484000084840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF000000000000840000FFFFFF00008400008484
      8400008400008484840000840000848484000084000084848400C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C60000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000008484840000840000848484000084
      000084848400FFFFFF0084848400008400008484840000840000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600FFFFFF0084848400000000000084000084848400008400008484
      8400FFFFFF00FFFFFF00FFFFFF00848484000084000084848400FFFFFF00FFFF
      FF0084848400FFFFFF000000000000000000000000000000000084848400FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6008484840000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF0084848400FFFFFF0084848400FFFFFF0084848400FFFFFF008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000FF0000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      84000000000084848400000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FFFF00C6C6C600C6C6
      C6000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FFFF00C6C6C600C6C6
      C6000000000000000000000000000000000000000000FF000000000000000000
      000000000000848400008484000084840000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C600FFFF00008484
      84008484840000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400C6C6C600C6C6
      C60000000000C6C6C600000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400C6C6C600C6C6
      C60000000000C6C6C600000000000000000000848400FF00000084000000FF00
      0000FF000000FF000000FF000000FF00000084840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C60000000000848484008484840084000000FF00
      0000FF000000C6C6C600C6C6C600FF000000FF00000084840000FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFF0000C6C6C600C6C6C6008484
      8400C6C6C60000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000C6C6C60000000000848484008484840084840000FF00
      000084840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000000000000000000084848400C6C6C600FF00
      0000848400008484000084840000848400008484000084840000FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C60084848400000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C60000000000000000008400000084848400C6C6
      C60084840000FFFFFF00FFFFFF00FF000000FFFF000084840000FFFFFF00FFFF
      FF00FFFFFF00C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000840000008484
      8400C6C6C600FF000000FF000000FFFF000084840000FFFFFF00FFFFFF00FFFF
      FF00C6C6C60084848400848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000848400000000000000000000848484000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008400
      000084840000848400008484000084840000FFFFFF00FF000000FFFFFF00C6C6
      C6008484840084848400848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008484
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF008484000084840000FFFFFF00FFFFFF008484
      84000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000848400000000000000000000848484000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF0084848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF008000E000E00300008000E000C0010000
      8000E000C00100008000E000C00100008000E000C001000080000000C0010000
      80000000C001000080000000C001000080008000C00100008000C000C0010000
      80008000C001000080000000C001000080000000C001000080010001C0010000
      8003E003E00300008007E007F5570000FFFFFFFFFFFFFFFF000CC007C007E001
      000880038003E001000100010001C001000300010001A0010003000100010001
      0003000000000001000300000000000100038000800080010007C000C0008001
      000FE000E001C001000F8000E007E001000F8007F007E001001F8000F003E003
      003FF000F803E007007FF800FFFFE00F00000000000000000000000000000000
      000000000000}
  end
  object ilNavBar: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 524944
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0003000000030000000300000003000000040000000400000004000000040000
          0004000000040000000400000004000000040000000400000004000000040000
          0004000000040000000400000004000000040000000400000000000000000000
          0016000000170000001700000017000000180000001800000018000000190000
          0019000000190000001A0000001A0000001B0000001B0000001B0000001C0000
          001C0000001C0000001D0000001D0000001E0000001E00000000000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF0000000000000000DBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FF524644FFDBD6D6FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FF524644FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FF0000000000000000DED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF0000000000000000E0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF0000000000000000E2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF0000000000000000F2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF524644FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF524644FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF00000000000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF0000000000000000DAD5
          D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5
          D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5D5FFDAD5
          D5FFD9D5D5FFD9D5D5FFD9D4D4FFD9D4D4FFD9D4D4FF0000000000000000DED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF0000000000000000E0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF0000000000000000E2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF0000000000000000F2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF00000000000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF0000000000000000D8D3
          D3FFD8D3D3FFD8D3D3FFD8D3D3FFD8D3D3FFD8D3D3FFD7D2D2FFD7D2D2FFD7D2
          D2FFD7D2D2FFD7D2D2FFD7D2D2FFD7D2D2FFD7D2D2FFD6D2D2FFD6D2D2FFD6D1
          D1FFD6D1D1FFD6D1D1FFD6D1D1FFD6D1D1FFD6D1D1FF0000000000000000DED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF0000000000000000E0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF0000000000000000E2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF0000000000000000F2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF00000000000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF00000000000000000000
          0004000000040000000400000004000000040000000400000004000000040000
          0004000000050000000500000005000000050000000500000005000000050000
          0005000000050000000600000006000000060000000600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000700000010000000140000
          0014000000140000001000000008000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000061714135E4A403EEC524644FF5246
          44FF524644FF4A403EEC1714135E000000070000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000D493F3DE9B4ADADFFDBD6D6FFDBD6
          D6FFDBD6D6FFB4ADADFF493E3DEA0000000E0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000E524644FFDED9D9FFEAE6E6FFEAE6
          E6FFEAE6E6FFDED9D9FF524644FF000000100000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF524644FF524644FF524644FF0000000D524644FFE0DCDCFF524644FF5246
          44FF524644FFE0DCDCFF524644FF0000000E0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF0000000000000000000000000000000B524644FFE6E3E3FFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFF524644FF0000000D0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF000000000000000000000000000000084A3F3DEAC9C4C3FFF2F0F0FFF2F0
          F0FFF2F0F0FFC9C4C3FF4A3F3DEA000000090000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF0000000000000000000000000000000314111149413735CE524644FF5246
          44FF524644FF413736CF1411114A000000030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF000000000000000000000000000000010000000A000000140000001B0000
          001B0000001B000000150000000A000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF000000000000000000000000000000061714135E4A403EEC524644FF5246
          44FF524644FF4A403EEC1714135E000000070000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF0000000000000000000000000000000D493F3DE9B4ADADFFDBD6D6FFDBD6
          D6FFDBD6D6FFB4ADADFF493E3DEA0000000E0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF0000000000000000000000000000000E524644FFDED9D9FFEAE6E6FF5246
          44FFEAE6E6FFDED9D9FF524644FF000000100000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF524644FF524644FF524644FF0000000D524644FFE0DCDCFF524644FF5246
          44FF524644FFE0DCDCFF524644FF0000000E0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF0000000000000000000000000000000B524644FFE6E3E3FFE2DFDFFF5246
          44FFE2DFDFFFE2DFDFFF524644FF0000000D0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005246
          44FF000000000000000000000000000000084A3F3DEAC9C4C3FFF2F0F0FFF2F0
          F0FFF2F0F0FFC9C4C3FF4A3F3DEA000000090000000000000000000000000000
          0002000000020000000300000003000000030000000300000003000000035246
          44FF000000030000000300000003000000061411114B413736CF524644FF5246
          44FF524644FF413736CF1411114C000000060000000100000000000000000000
          000E0000000E0000000F0000000F0000000F0000001000000010000000100000
          0011000000110000001100000012000000130000001400000018000000190000
          001A0000001B0000001900000017000000120000000800000002000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF4A3F3DEA171413550000000400000000DBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FF524644FFDBD6D6FFDBD6D6FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFB4ADADFF493E3CE60000000600000000DED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FF0000000500000000E0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FF0000000400000000E2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FF0000000200000000F2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF524644FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFC9C4C3FF4A3F3EE700000001000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF413736C91411114000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000050000
          0012000000170000001700000017000000170000001800000018000000180000
          0018000000180000001800000018000000190000001900000019000000190000
          001900000019000000190000001A0000001A0000001400000006000000119487
          85FF948785FF948785FF948785FF948785FF948785FF948785FF948785FF9487
          85FF948785FF948785FF948785FF948785FF948785FF948785FF948785FF9487
          85FF948785FF948785FF948785FF948785FF948785FF00000013000000159487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000018000000149487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000017000000139487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000016000000129487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000015000000129487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000014000000119487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000014000000109487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF000000130000000F9487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF000000120000000E9487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF000000110000000D9487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF000000100000000C9487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF0000000F0000000C9487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF0000000E0000000B9487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF0000000D0000000A9487
          85FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFCFCCCBFFE5E3E3FFE5E3
          E3FFE5E3E3FFE5E3E3FFE5E3E3FF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF0000000D000000095246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF0000000C000000095246
          44FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FF524644FFDBD6D6FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FF524644FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FF524644FF0000000B000000085246
          44FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FF524644FFDED9D9FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FF0000000B000000075246
          44FFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FFE0DCDCFFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FF0000000A000000065246
          44FFE6E3E3FFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE6E3E3FF524644FF00000009000000064A3F
          3DE9C9C4C3FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF524644FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FF524644FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFC9C4C3FF4A3F3DEA00000008000000041411
          114A716766FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF776D6CFF1411114E00000006000000010000
          0004000000050000000500000005000000050000000500000005000000050000
          0005000000050000000500000005000000060000000600000006000000060000
          0006000000060000000600000006000000060000000500000001}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001309053C391A0FB0391A
          0FB01309053C0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000029130B8137190FAB010100035A362297985B39FF6A38
          22FF31170D970000000033180E9F2E150C900000000000000000000000050000
          0011000000150000001600000016000000160000001600000016000000160000
          0016000000164427188C965A38FF532717FF5F3823B3A16540E2B87349FF8E54
          34FF482213E25B3522A88C5133FF522616FF2E150C9000000000000000109487
          85FF948785FF948785FF948785FF948785FF948785FF948785FF948785FF9487
          85FF948785FFA87C63FFB87349FF965A38FFAB6943FFB7734AFFB87349FFAB69
          43FF925738FFB87349FFB87349FF8C5133FF33180E9F00000000000000139487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD7B098FFB87349FFBB7E58FFDCB9A4FFF3E8E1FFF3E8
          E1FFDCB9A4FFBF815CFFB87349FF5B3621A70000000000000000000000129487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFD6CCC8FFBB9886FFC18560FFB06E48FFB59889FFCBBBB4FF8A6556FFA378
          62FFE4CEC1FFDCB9A4FF925738FF482213E231170D971309053C000000129487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFB18973FFAB6943FFB67148FF854C2FFFD2C8C4FFB7876CFF9F603CFF7440
          27FFA37862FFF3E8E1FFAB6943FF8E5434FF6A3822FF391A0FB0000000119487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFCE9E81FFB87349FFB87349FF63331EFFD9CDC7FFCA9676FFB87349FF9F60
          3CFF8A6556FFF3E8E1FFB87349FFB87349FF985B39FF391A0FB0000000109487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFEEDED4FFD5AC93FFC18560FF663722FFC2A290FFE7D0C2FFCA9676FFB787
          6CFFCBBBB4FFDCB9A4FFB7734AFFA16540E15A3622971309053C0000000F9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD1A68DFF854C2FFF80513AFFCFB09EFFEFE5DFFFE8E0
          DBFFC2A697FFBD805BFFAB6943FF5F3823B101010003000000000000000E9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFFFFFFFFFBB9682FFB87349FFAE6B44FF854C2FFF663722FF63331EFF854C
          2FFFB06E48FFB87349FF965A38FF532717FF37190FAB010000030000000D9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFFFFFFFFFE0C2B0FFB87349FFB87349FFC89C82FFC18560FFB87349FFB671
          48FFC18560FFD7B098FFB87349FF965A38FF29130B7E000000000000000C9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE0C2B0FFBB9682FFE5E3E3FFD5AC93FFB87349FFAB69
          43FFBB9886FFFFFFFFFFA87C63FF4126178600000000000000000000000C9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFEEDED4FFCE9E81FFB189
          73FFD6CCC8FFFFFFFFFF948785FF0000000E00000000000000000000000B9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF948785FF0000000D00000000000000000000000A9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF948785FF0000000C0000000000000000000000095246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF0000000C0000000000000000000000095246
          44FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FF524644FFDBD6D6FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FF524644FFDBD6D6FFDBD6D6FFDBD6
          D6FFDBD6D6FFDBD6D6FF524644FF0000000B0000000000000000000000085246
          44FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FF524644FF0000000A0000000000000000000000075246
          44FFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFF524644FF000000090000000000000000000000065246
          44FFE6E3E3FFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFF524644FF000000080000000000000000000000064A3F
          3DE9C9C4C3FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF524644FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF524644FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFC9C4C3FF4A3F3DEA000000080000000000000000000000041411
          114A776D6CFF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF776D6CFF1411114D000000060000000000000000000000010000
          0004000000050000000500000005000000050000000500000005000000050000
          0005000000050000000500000005000000060000000600000006000000060000
          0006000000060000000600000005000000010000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000040000000600000007000000070000000800000008000000080000
          0008000000080000000800000008000000080000000900000009000000090000
          0007000000030000000100000000000000000000000000000000000000010000
          0007000000130000002100000027000000290000002A0000002B0000002C0000
          002C0000002D0000002E0000002E0000002F00000030000000310000002E0000
          00230000000F0000000300000000000000000000000000000000000000020000
          000B052051AC083382FF083282FF083182FF083182FF083082FF083082FF082F
          82FF082F82FF082F82FF082F82FF082F82FF082F82FF082F82FF082F82FF082E
          82FF000000220000000700000000000000000000000000000000000000010000
          00070000001B0D5499B51682F6FF1680F6FF167DF6FF167BF6FF1679F6FF1676
          F6FF1675F6FF1675F6FF1674F6FF1674F6FF1674F6FF1673F6FF1673F6FF1672
          F6FF0000002C0000000800000000000000000000000000000000000000000000
          00020000000A0000001F0E5399B61682F6FF1680F6FF167DF6FF167AF6FF1679
          F6FF1676F6FF1676F6FF1675F6FF1675F6FF1674F6FF1674F6FF1674F6FF1673
          F6FF000000280000000700000000000000000000000000000000000000000000
          0000000000020000000A0000001E0E5399B61682F6FF167FF6FF0E4E9AC20000
          0044000000310000002800000027000000270000002A00000031082B5C86115B
          C0D40000001C0000000600000000000000000000000000000000000000000000
          000000000000000000020000000A0000001C0D5399B41682F6FF1162CAFF051E
          51B800000026000000120000000900000007000000080000000C000000170726
          52700000000E0000000300000000000000000000000000000000000000000000
          0000000000000000000000000002000000090000001B0E539AB31682F6FF1162
          CAFF051F51B50000001F0000000B000000020000000000000001000000050000
          0008000000040000000100000000000000000000000000000000000000000000
          000000000000000000000000000000000002000000090000001A0E539AB31681
          F6FF1162CAFF051E51B40000001D0000000A0000000200000000000000000000
          0001000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000020000000A0000001F0E52
          99B61681F6FF1162CAFF051F51B3000000180000000700000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000002000000090000001D0B40
          7EB41683F6FF1681F6FF1161CAFF051F51AB0000000A00000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000700000014052151AF1169
          CAFF1686F6FF1683F6FF0E5099B0000000150000000600000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000010000000600000011052251AD116DCAFF168B
          F6FF1688F6FF0E539AAE00000016000000070000000200000000000000000000
          0001000000000000000000000000000000000000000000000000000000000000
          00000000000000000001000000050000000F052351AA1171CAFF1691F6FF168E
          F6FF0E5799AD0000001300000007000000010000000000000001000000030000
          0005000000030000000100000000000000000000000000000000000000000000
          000000000001000000040000000C052451A91175CAFF1696F6FF1694F6FF0D5A
          9AAC0000001400000009000000050000000400000004000000070000000D0312
          3169000000080000000200000000000000000000000000000000000000000000
          0001000000030000000A052551A7117ACAFF169CF6FF1699F6FF0E5E99AD0000
          001C000000150000001200000011000000120000001300000017031331720A3D
          87CD0000000E0000000300000000000000000000000000000000000000000000
          000200000006052651A5117DCAFF16A2F6FF169FF6FF169CF6FF1174CAFF0837
          82FF083782FF083682FF083582FF083582FF083482FF083382FF0D50ADFF136F
          DCFF000000110000000300000000000000000000000000000000000000000000
          0002052751A11181CAFF16A8F6FF16A4F6FF16A2F6FF169EF6FF169BF6FF1698
          F6FF1695F6FF1692F6FF168FF6FF168CF6FF1689F6FF1687F6FF1684F6FF1682
          F6FF0000000C0000000200000000000000000000000000000000000000000000
          0001000000020000000500000006000000070000000700000008000000090000
          00090000000A0000000B0000000B0000000C0000000D0000000E0000000E0000
          000B000000050000000100000000000000000000000000000000000000000000
          0000000000000000000100000001000000010000000100000001000000010000
          0001000000010000000200000002000000020000000200000002000000020000
          0002000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000002000000090000000D0000000E0000000F0000000F0000000F0000
          0010000000100000000F0000000A000000030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000083A3231BF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF3B3231C10000000A0000000000000000000000000000
          0001000000040000000600000007000000080000000800000008000000080000
          000800000011524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF0000000D0000000100000000000000010000
          00070000001400000021000000280000002A0000002A0000002B0000002C0000
          002C00000035524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000230000001200000005000000020000
          000C052151AD083382FF083282FF083182FF083182FF083082FF083082FF082F
          82FF082E7EFF524644FFD4D1D0FFD4D1D0FFD4D1D0FFD4D1D0FFD4D1D0FFD4D1
          D0FFD4D1D0FFD4D1D0FF524644FF524644FF3B3231C800000012000000010000
          00080000001C0E5499B61682F6FF1680F6FF167DF6FF167BF6FF1679F6FF1676
          F6FF1673F1FF42506EFF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF7F7674FFFFFFFFFF524644FF00000016000000000000
          00020000000B000000200E539AB71682F6FF1680F6FF167DF6FF167AF6FF1679
          F6FF1676F5FF1674F2FF1570EBFF524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF524644FF00000016000000000000
          0000000000020000000B0000001F0E539AB71682F6FF167FF6FF0E4E9AC30000
          0046000000320000002800000033524644FFD4D1D0FFD4D1D0FFD4D1D0FFD4D1
          D0FFD4D1D0FFD4D1D0FFD4D1D0FFD4D1D0FF524644FF00000013000000000000
          000000000000000000020000000A0000001E0E5399B61682F6FF1162CAFF051E
          51B90000002700000012000000113D3432C6524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF3D3433C70000000A000000000000
          00000000000000000000000000020000000A0000001D0D5299B41682F6FF1162
          CAFF051F51B6000000200000000D000000080000000A0000000D000000100000
          0014000000100000000E0000000D0000000D0000000900000002000000000000
          000000000000000000000000000000000002000000090000001C0D5299B41681
          F6FF1162CAFF051F51B50000001F0000000A0000000200000000000000000000
          0001000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000020000000B000000210E53
          9AB71681F6FF1162CAFF051F51B3000000190000000700000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000020000000A0000001F0B40
          7EB61683F6FF1681F6FF1161CAFF051F51AB0000000A00000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000020000000800000016052151B01169
          CAFF1686F6FF1683F6FF0E5199B1000000160000000600000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000010000000700000014052151AE116DCAFF168B
          F6FF1688F6FF0E5499B000000017000000080000000200000000000000000000
          0001000000000000000000000000000000000000000000000000000000000000
          000000000000000000010000000600000012052351AD1171CAFF1691F6FF168E
          F6FF0E579AAE0000001500000008000000020000000000000001000000030000
          0005000000030000000100000000000000000000000000000000000000000000
          000000000001000000050000000F052451AB1175CAFF1696F6FF1694F6FF0E5A
          9AAE000000160000000A000000050000000400000005000000070000000E0312
          316A000000090000000200000000000000000000000000000000000000000000
          0001000000040000000D052551A9117ACAFF169CF6FF1699F6FF0E5D99B00000
          0022000000180000001400000014000000150000001500000019031331740B3D
          87CE0000000F0000000300000000000000000000000000000000000000000000
          000200000009052551A7117DCAFF16A2F6FF169FF6FF169CF6FF1174CAFF0837
          82FF083782FF083682FF083582FF083582FF083482FF083382FF0D50ADFF136F
          DCFF000000120000000400000000000000000000000000000000000000010000
          0003052751A31181CAFF16A8F6FF16A4F6FF16A2F6FF169EF6FF169BF6FF1698
          F6FF1695F6FF1692F6FF168FF6FF168CF6FF1689F6FF1687F6FF1684F6FF1682
          F6FF0000000E0000000300000000000000000000000000000000000000000000
          00010000000400000007000000090000000A0000000B0000000B0000000C0000
          000D0000000D0000000E0000000E0000000F0000000F00000010000000100000
          000C000000050000000100000000000000000000000000000000000000000000
          0000000000010000000100000001000000010000000200000002000000020000
          0002000000020000000200000002000000020000000200000002000000030000
          0002000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000070000
          0010000000140000001400000014000000100000000800000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000061714135E4A40
          3EEC524644FF524644FF524644FF4A403EEC1714135E00000007000000000000
          0001000000040000000600000007000000080000000800000008000000080000
          0008000000080000000800000008000000080000000800000015493E3DEAB4AD
          ADFFDBD6D6FFDBD6D6FFDBD6D6FFB4ADADFF493E3DEA0000000E000000010000
          00070000001400000021000000280000002A0000002A0000002B0000002C0000
          002C0000002D0000002D0000002E0000002E0000002F0000003B524644FFDED9
          D9FFEAE6E6FF524644FFEAE6E6FFDED9D9FF524644FF00000010000000020000
          000C052151AD083382FF083282FF083182FF083182FF083082FF083082FF082F
          82FF082F82FF082F82FF082F82FF082F82FF082F82FF082D7BFF524644FFE0DC
          DCFF524644FF524644FF524644FFE0DCDCFF524644FF0000000E000000010000
          00080000001C0E5499B61682F6FF1680F6FF167DF6FF167BF6FF1679F6FF1676
          F6FF1675F6FF1675F6FF1674F6FF1674F6FF1674F6FF156EEBFF524644FFE6E3
          E3FFE2DFDFFF524644FFE2DFDFFFE2DFDFFF524644FF0000000D000000000000
          00020000000B000000200E539AB71682F6FF1680F6FF167DF6FF167AF6FF1679
          F6FF1676F6FF1676F6FF1675F6FF1675F6FF1674F6FF1570EEFF4C4951FFC9C4
          C3FFF2F0F0FFF2F0F0FFF2F0F0FFC9C4C3FF4B403EEB0000000B000000000000
          0000000000020000000B0000001F0E539AB71682F6FF167FF6FF0E4E9AC30000
          0046000000320000002800000027000000270000002A00000038293348C85045
          44FE524644FF524644FF524644FF4F4341FB25201E8D0000000A000000000000
          000000000000000000020000000A0000001E0E5399B61682F6FF1162CAFF051E
          51B9000000270000001200000009000000070000000800000019483E3CEBB0AA
          AAFFD5D0D0FFD4D0D0FFD5D0D0FFB0A9A9FF483D3CEA0000000F000000000000
          00000000000000000000000000020000000A0000001D0D5299B41682F6FF1162
          CAFF051F51B6000000200000000B000000020000000000000010524644FFDED9
          D9FFEAE6E6FF524644FFEAE6E6FFDED9D9FF524644FF00000010000000000000
          000000000000000000000000000000000002000000090000001C0D5299B41681
          F6FF1162CAFF051F51B50000001F0000000A000000020000000D524644FFE0DC
          DCFF524644FF524644FF524644FFE0DCDCFF524644FF0000000E000000000000
          000000000000000000000000000000000000000000020000000B000000210E53
          9AB71681F6FF1162CAFF051F51B300000019000000070000000C524644FFE6E3
          E3FFE2DFDFFF524644FFE2DFDFFFE2DFDFFF524644FF0000000D000000000000
          000000000000000000000000000000000000000000020000000A0000001F0B40
          7EB61683F6FF1681F6FF1161CAFF051F51AB0000000A0000000A4A3F3DEAC9C4
          C3FFF2F0F0FFF2F0F0FFF2F0F0FFC9C4C3FF4A3F3DEA00000009000000000000
          0000000000000000000000000000000000020000000800000016052151B01169
          CAFF1686F6FF1683F6FF0E5199B1000000160000000600000004141111494137
          35CE524644FF524644FF524644FF413736CF1411114A00000003000000000000
          00000000000000000000000000010000000700000014052151AE116DCAFF168B
          F6FF1688F6FF0E5499B000000017000000080000000200000000000000020000
          0006000000070000000800000007000000060000000300000000000000000000
          000000000000000000010000000600000012052351AD1171CAFF1691F6FF168E
          F6FF0E579AAE0000001500000008000000020000000000000001000000030000
          0005000000030000000100000000000000000000000000000000000000000000
          000000000001000000050000000F052451AB1175CAFF1696F6FF1694F6FF0E5A
          9AAE000000160000000A000000050000000400000005000000070000000E0312
          316A000000090000000200000000000000000000000000000000000000000000
          0001000000040000000D052551A9117ACAFF169CF6FF1699F6FF0E5D99B00000
          0022000000180000001400000014000000150000001500000019031331740B3D
          87CE0000000F0000000300000000000000000000000000000000000000000000
          000200000009052551A7117DCAFF16A2F6FF169FF6FF169CF6FF1174CAFF0837
          82FF083782FF083682FF083582FF083582FF083482FF083382FF0D50ADFF136F
          DCFF000000120000000400000000000000000000000000000000000000010000
          0003052751A31181CAFF16A8F6FF16A4F6FF16A2F6FF169EF6FF169BF6FF1698
          F6FF1695F6FF1692F6FF168FF6FF168CF6FF1689F6FF1687F6FF1684F6FF1682
          F6FF0000000E0000000300000000000000000000000000000000000000000000
          00010000000400000007000000090000000A0000000B0000000B0000000C0000
          000D0000000D0000000E0000000E0000000F0000000F00000010000000100000
          000C000000050000000100000000000000000000000000000000000000000000
          0000000000010000000100000001000000010000000200000002000000020000
          0002000000020000000200000002000000020000000200000002000000030000
          0002000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000100000001000000010000
          0001000000010000000100000001000000010000000100000000000000000000
          0000000000000000000000000000000000010000000700000010000000140000
          001400000014000000100000000800000008000000160000001C0000001D0000
          001E0000001F0000001F00000020000000210000001A00000007000000000000
          0000000000000000000000000000000000061714135E4A403EEC524644FF5246
          44FF524644FF4A403EEC1714135E0000001A524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF0000001A000000000000
          00000000000000000000000000000000000D493F3DE9B4ADADFFDBD6D6FFDBD6
          D6FFDBD6D6FFB4ADADFF493E3DEA00000026524644FFFFF2E9FFFFF2E9FFC1D9
          C1FF73BA8FFF40A66EFF42A76FFF47AA73FF524644FF00000020000000000000
          00000000000000000000000000000000000E524644FFDED9D9FFEAE6E6FF5246
          44FFEAE6E6FFDED9D9FF524644FF00000026524644FFFFEEE3FFFFEEE3FFFFEE
          E3FFE6E4D3FFA2C9A8FF61AF80FF37A065FF524644FF0000001F000000000000
          0000524644FF524644FF524644FF0000000D524644FFE0DCDCFF524644FF5246
          44FF524644FFE0DCDCFF524644FF00000024524644FFFFEADDFF21ADFFFF21AD
          FFFFFFEADDFFFFEADDFFF2E5D5FFC1D2B7FF524644FF0000001E000000000000
          0000524644FF00000000000000000000000B524644FFE6E3E3FFE2DFDFFF5246
          44FFE2DFDFFFE2DFDFFF524644FF00000021524644FFFFE7D8FF21ADFFFF21AD
          FFFFFFE7D8FFFFE7D8FFFFE7D8FFFFE7D8FF524644FF0000001D000000000000
          0000524644FF0000000000000000000000084A3F3DEAC9C4C3FFF2F0F0FFF2F0
          F0FFF2F0F0FFC9C4C3FF4A3F3DEA0000001E524644FFFFE4D2FFFFE4D2FFFFE4
          D2FFFFE4D2FFFFE4D2FFFFE4D2FFFFE4D2FF524644FF0000001C000000000000
          0000524644FF00000000000000000000000314111149413735CE524644FF5246
          44FF524644FF413736CF1411114A00000013524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF00000015000000000000
          0000524644FF0000000000000000000000000000000200000005000000070000
          0008000000070000000600000003000000040000001000000015000000160000
          0016000000170000001700000018000000190000001400000005000000000000
          0000524644FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000100000001000000010000
          0001000000010000000100000001000000010000000100000000000000000000
          0000524644FF0000000000000000000000000000000000000000000000030000
          000C000000100000001100000011000000120000001300000013000000140000
          0014000000150000001600000016000000170000001200000005000000000000
          0000524644FF00000000000000000000000000000000000000000000000B5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF00000012000000010000
          00070000001000000014000000140000001400000010000000080000000F5246
          44FF7DCCA0FF6FC494FF6BC192FF6CC291FF6EC494FF76C99AFF7ECEA1FF86D3
          A8FF8FD9AFFF98E0B8FFA3E7C1FFADEECAFF524644FF00000015000000061714
          135E4A403EEC524644FF524644FF524644FF4A403EEC1714135E000000135246
          44FFBCDEC7FF69BC8DFF55B37FFF53B37EFF56B47FFF5DB785FF66BF8EFF73C7
          98FF80CFA4FF8ED8AFFF9AE1BAFFA6E8C4FF524644FF000000140000000D493F
          3DE9B4ADADFFDBD6D6FFDBD6D6FFDBD6D6FFB4ADADFF493E3DEA000000195246
          44FFFFF5EEFFC1DBC4FF73BB90FF40A66EFF42A76FFF47AA73FF51B07BFF5DB9
          87FF6CC493FF7ECEA2FF8ED9B0FF9FE4BEFF524644FF000000130000000E5246
          44FFDED9D9FFEAE6E6FFEAE6E6FFEAE6E6FFDED9D9FF524644FF0000001A5246
          44FFFFF2E9FFFFF2E9FFE6E7D8FFA2CBACFF61B081FF37A065FF3EA46BFF4AAD
          76FF5AB682FF6CC393FF80D0A3FF94DDB4FF524644FF000000120000000D5246
          44FFE0DCDCFF524644FF524644FF524644FFE0DCDCFF524644FF000000185246
          44FFFFEEE3FFFFEEE3FFFFEEE3FFFFEEE3FFF2E9DBFFC1D5BBFF96C5A1FF78BA
          8FFF68B788FF67BB8BFF75C899FF8FD7AEFF524644FF000000110000000B5246
          44FFE6E3E3FFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FF000000155246
          44FFFFEADDFF9DCFECFF3CB4FBFF9DCFECFFFFEADDFFFFEADDFFFFEADDFFFFEA
          DDFFFFEADDFFFFEADDFFFFEADDFFFFEADDFF524644FF00000010000000084A3F
          3DEAC9C4C3FFF2F0F0FFF2F0F0FFF2F0F0FFC9C4C3FF4A3F3DEA000000115246
          44FFFFE7D8FF3CB4FAFF21ADFFFF3CB4FAFFFFE7D8FFFFE7D8FFFFE7D8FFFFE7
          D8FFFFE7D8FFFFE7D8FFFFE7D8FFFFE7D8FF524644FF0000000F000000031411
          1149413735CE524644FF524644FF524644FF413736CF1411114A0000000B5246
          44FFFFE4D2FF9DCCE6FF3CB4FAFF9DCCE6FFFFE4D2FFFFE4D2FFFFE4D2FFFFE4
          D2FFFFE4D2FFFFE4D2FFFFE4D2FFFFE4D2FF524644FF0000000E000000000000
          0002000000050000000700000008000000070000000600000003000000085246
          44FFFFE1CEFFFFE1CEFFFFE1CEFFFFE1CEFFFFE1CEFFFFE1CEFFFFE1CEFFFFE1
          CEFFFFE1CEFFFFE1CEFFFFE1CEFFFFE1CEFF524644FF0000000D000000000000
          0000000000000000000000000000000000000000000000000000000000055246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF0000000A000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0005000000070000000700000007000000080000000800000009000000090000
          00090000000A0000000A0000000A0000000B0000000900000002}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000200000005000000070000000800000008000000080000
          0008000000080000000900000009000000090000000900000009000000090000
          000A0000000A0000000700000003000000010000000000000000000000000000
          0000000000020000000A00000018000000220000002400000025000000260000
          002700000028000000290000002B0000002B0000002C0000002D0000002E0000
          002F0000002E000000220000000F000000030000000000000000000000000000
          00000000000400000016524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF00000021000000070000000100000000000000000000
          0000000000060000001E524644FF9DDAB8FF80CCA1FF7CCA9EFF7CCDA1FF7ECE
          A2FF81CFA3FF85D2A7FF8AD6ACFF91DAB1FF99E0B8FFA2E6C0FFACECC9FFB6F3
          D1FFBDF8D8FF524644FF0000002F0000000A0000000100000000000000000000
          00000000000600000020514543FFC1DCCAFF467259FF4C8666FF65B68AFF6BC0
          8FFF6EC494FF76C99AFF7ECEA1FF86D3A8FF8FD9AFFF98E0B8FFA3E7C1FFADEE
          CAFFB8F5D4FF524644FF000000320000000A0000000100000000000000000000
          0000000000060000001F4E4341FF8A8785FF112119FF0F1F17FF27523AFF4EA7
          76FF55B27EFF5DB785FF66BF8EFF73C798FF80CFA4FF8ED8AFFF9AE1BAFFA6E8
          C4FFB2F1CEFF524644FF000000310000000A0000000100000000000000000000
          000000000006000000262E2726FF112119FF67D29EFF67D29EFF0F1F17FF1E4D
          33FF3E9D68FF46A872FF51B07BFF5DB987FF6CC493FF7ECEA2FF8ED9B0FF9FE4
          BEFFACEDC8FF524644FF0000002F000000090000000100000000000000000000
          00010000000D0000007C102018FF67D29EFF75EEB3FF75EEB3FF67D29EFF0F1F
          17FF2E533DFF34975FFF3DA36AFF4AAD76FF5AB682FF6CC393FF80D0A3FF94DD
          B4FFA6E9C5FF524644FF0000002D000000090000000100000000000000010000
          00070000006C0F1F17FD67D29EFF75EEB3FF59B689FF59B689FF75EEB3FF67D2
          9EFF0F1F17FF5D665AFF8EBB99FF77B98EFF68B788FF67BB8BFF75C899FF8FD7
          AEFFAEE5C2FF524644FF0000002B000000090000000100000000000000050000
          00660F1F17FC67D29EFF75EEB3FF59B689FF070D0AFF09110FFF59B689FF75EE
          B3FF67D29EFF0F1F17FF7C726CFFF3DFD3FFFDE8DBFFFFEADDFFFFEADDFFFFEA
          DDFFFFEADDFF524644FF00000029000000080000000100000000000000620F1F
          17FC67D29EFF75EEB3FF59B689FF080D0AFF96887FFF2776A3FF061010FF59B6
          89FF75EEB3FF67D29EFF0F1F17FF7E736BFFF4DDCFFFFDE5D7FFFFE7D8FFFFE7
          D8FFFFE7D8FF524644FF00000027000000080000000000000000000000FC5BB9
          8BFF75EEB3FF59B689FF060C09FF9C8B80FFF9DFCDFF9AC8E1FF2879A8FF0A11
          0FFF59B689FF75EEB3FF67D29EFF0F1F17FF80736AFFF5DBCAFFFDE3D1FFFFE4
          D2FFFFE4D2FF524644FF000000250000000700000000000000000000006A3369
          4FFF4EA078FF060B08FC332B2AFFFCDECBFFFEE1CEFFFFE1CEFFFBDECBFFAD99
          8CFF0D120EFF59B689FF75EEB3FF67D29EFF0F1F17FF827369FFF6D9C7FFFEE0
          CDFFFFE1CEFF524644FF00000023000000070000000000000000000000010000
          0068000000FC00000068514543FFFFDFCAFFFFDFCAFFFFDFCAFFFFDFCAFFFCDC
          C8FFAE998AFF0D120EFF59B689FF75EEB3FF67D29EFF0F1F17FF847368FFF7D8
          C4FFFEDEC9FF524644FF0000001F000000060000000000000000000000000000
          0000000000030000000D524644FF524644FF524644FF524644FF524644FF5246
          44FF514543FF39302FFF080D0AFF59B689FF75EEB3FF67D29EFF0F1F17FF2B25
          24FF504442FF524644FF00000019000000050000000000000000000000000000
          000000000001000000060000000F00000016000000190000001B0000001B0000
          001D000000200000002300000065060B08F859B689FF75EEB3FF67D29EFF0F1F
          17FF0000008C000000220000000F000000030000000000000000000000000000
          0000000000000000000200000004000000060000000700000008000000080000
          0009000000090000000A0000000C00000053060B08F759B689FF75EEB3FF67D2
          9EFF0F1F17FF0000007B00000008000000020000000000000000000000000000
          0000000000000000000000000001000000010000000100000001000000010000
          0001000000010000000100000001000000020000004C060B08F659B689FF75EE
          B3FF67D29EFF0F1F17FF00000076000000040000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000049060B08F659B6
          89FF75EEB3FF67D29EFF0F1F17FF000000740000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000049060B
          08F659B689FF75EEB3FF5BB98BFF000000FF0000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0048060B08F64EA078FF33694FFF0000007F0000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000048000000F60000007E000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0002000000020000000200000002000000020000000200000002000000020000
          0002000000020000000200000002000000020000000200000002000000020000
          0002000000020000000200000002000000020000000200000000000000000000
          0012000000120000001300000013000000130000001300000013000000130000
          0014000000140000001400000014000000140000001400000015000000150000
          0015000000150000001500000015000000160000001600000000000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF0000000000000000D3CD
          CCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CD
          CCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFFCCBB
          B5FFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFFD3CDCCFF0000000000000000D6CF
          CFFFD6CFCFFFD6CFCFFFD6CFCFFFD6CFCFFFD6CFCFFFD6CFCFFFD6CFCFFFD6CF
          CFFFD6CFCFFFD6CFCFFFD6CFCFFFD6CFCFFFD6CFCFFFD6CFCFFFCFBDB7FFA75B
          3AFFCFBDB7FFD6CFCFFFD6CFCFFFD6CFCFFFD6CFCFFF0000000000000000D7D2
          D1FFD7D2D1FFD7D2D1FFD7D2D1FFD7D2D1FFD7D2D1FFD7D2D1FFD7D2D1FFD7D2
          D1FFD7D2D1FFD7D2D1FFD7D2D1FFD7D2D1FFD7D2D1FFCFBFB9FFA75B3AFFA14D
          28FFA75B3AFFCFBFB9FFD7D2D1FFD7D2D1FFD7D2D1FF0000000000000000D9D5
          D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5
          D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FFA14D
          28FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FFD9D5D4FF0000000000000000DCD7
          D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7
          D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FFA14D
          28FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FFDCD7D7FF0000000000000000DEDA
          DAFFDEDADAFFDEDADAFFDEDADAFFDEDADAFFDEDADAFFDEDADAFFDEDADAFFDEDA
          DAFFDEDADAFFDEDADAFFDEDADAFFDEDADAFFDEDADAFFDEDADAFFDEDADAFFA14D
          28FFDEDADAFFDEDADAFFDEDADAFFDEDADAFFDEDADAFF0000000000000000E0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFA14D
          28FFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF0000000000000000E1DE
          DEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DE
          DEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFA14D
          28FFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFF0000000000000000E3E0
          E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0
          E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FFA14D
          28FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FFE3E0E0FF0000000000000000E5E2
          E2FFE5E2E2FFE5E2E2FFE5E2E2FFE5E2E2FFE5E2E2FFE5E2E2FFE5E2E2FFE5E2
          E2FFE5E2E2FFE5E2E2FFE5E2E2FFE5E2E2FFE5E2E2FFDBCDC8FFA85D3CFFA14D
          28FFA85D3CFFDBCDC8FFE5E2E2FFE5E2E2FFE5E2E2FF0000000000000000E6E4
          E3FFE6E4E3FFE6E4E3FFE6E4E3FFE6E4E3FFE6E4E3FFE6E4E3FFE6E4E3FFE6E4
          E3FFE6E4E3FFE6E4E3FFE6E4E3FFE6E4E3FFE6E4E3FFE6E4E3FFDCCFC9FFA85D
          3CFFDCCFC9FFE6E4E3FFE6E4E3FFE6E4E3FFE6E4E3FF0000000000000000F3F2
          F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2
          F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFE7DB
          D5FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FF00000000000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF0000000000000000DBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FFDBD6D6FF0000000000000000DED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF0000000000000000E0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF0000000000000000E2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF0000000000000000F2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF00000000000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF00000000000000000000
          0004000000040000000400000004000000040000000400000004000000040000
          0004000000050000000500000005000000050000000500000005000000050000
          0005000000050000000600000006000000060000000600000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010000000200000003000000040000000400000004000000040000
          0003000000020000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0004000000080000000C00000011000000140000001700000017000000160000
          00130000000F0000000A00000005000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000002000000060000
          000E0000004A00000089000000BA000000DF000000F7000000F7000000DF0000
          00BC0000008C0000004F00000013000000090000000300000000000000000000
          00000000000000000000000000000000000000000001000000050000003D0000
          009E000000F0000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000F1000000A3000000430000000800000001000000000000
          0000000000000000000000000000000000000000000100000018000000AA0000
          00FF0E0E0EDC3B3B3BCD6F655DD4957154E6AA662FF7AA662FF7957153E76E65
          5CD63A3A3AD00D0D0DDE000000FF000000AE0000001C00000002000000000000
          000200000002000000020000000200000002000000030000000A191919745757
          57C2E4E4E4F8EAD6C5FFBD7B45FFAD5A17FFAD5A17FFAD5A17FFAD5A17FFBD7B
          45FFEAD6C5FFE4E4E4F8595959C71919197A0000000D00000003000000000000
          0019000000190000001A0000001A0000001A0000001C00000023929292A5FFFF
          FFFFFFFFFFFFCE9C74FFAD5A17FFC89164FFEBD6C6FFEBD6C6FFC89164FFAD5A
          17FFCE9C74FFFFFFFFFFFFFFFFFF929292A10000001000000004000000005246
          44FF524644FF524644FF524644FF524644FF504442FF322B2AFFBAB9B9FFFFFF
          FFFFFFFFFFFFB76E33FFAD5A17FFEBD6C6FFFFFFFFFFFFFFFFFFEBD6C6FFAD5A
          17FFB76E33FFFFFFFFFFFFFFFFFFB6B6B6F3000000680000000900000000D7D2
          D1FFD7D2D1FFD7D2D1FF524644FFD6D1D0FFC5C0BFFF323131FF2D2C2CFF9292
          92FFEDEDEDFFB76E33FFAD5A17FFEBD6C6FFFFFFFFFFFFFFFFFFEBD6C6FFAD5A
          17FFB76E33FFEDEDEDFF929292FF1C1C1CED000000C60000001900000000DAD5
          D5FFDAD5D5FFDAD5D5FF524644FFDAD5D5FFD8D3D3FF999696FF333232FF0000
          00FF383838FF614937FF763D10FFA97B55FFE2CEBEFFE2CEBEFFA97B55FF763D
          10FF614937FF373737FF000000FF080808CF000000520000000500000000DDD8
          D8FFDDD8D8FFDDD8D8FF524644FFDDD8D8FFDDD8D8FFDCD7D7FFAFABABFF5C5A
          5AFF100F0FFF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF0F0F0FFF585656FF0000003A000000050000000200000000DFDA
          DAFFDFDADAFFDFDADAFF524644FFDFDADAFFDFDADAFFDFDADAFFDED9D9FFDDD8
          D8FFABA8A8FF737171FF454343FF212020FF080808FF080808FF202020FF4442
          42FF716F6FFFA9A5A5FFDAD5D5FF00000003000000010000000000000000E1DD
          DDFFE1DDDDFFE1DDDDFF524644FFE1DDDDFFE1DDDDFFE1DDDDFFE1DDDDFFE1DD
          DDFFE0DCDCFFE0DCDCFFDFDBDBFFDFDBDBFFDEDADAFFDEDADAFFDEDADAFFDEDA
          DAFFDFDBDBFFDFDBDBFFE0DCDCFF00000000000000000000000000000000E2DF
          DFFFE2DFDFFFE2DFDFFF524644FFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFF00000000000000000000000000000000E4E1
          E1FFE4E1E1FFE4E1E1FF524644FFE4E1E1FFE4E1E1FFE4E1E1FFE4E1E1FFE4E1
          E1FFE4E1E1FFE4E1E1FFE4E1E1FFE4E1E1FFE4E1E1FFE4E1E1FFE4E1E1FFE4E1
          E1FFE4E1E1FFE4E1E1FFE4E1E1FF00000000000000000000000000000000E6E2
          E3FFE6E2E3FFE6E2E3FF524644FFE6E2E3FFE6E2E3FFE6E2E3FFE6E2E3FFE6E2
          E3FFE6E2E3FFE6E2E3FFE6E2E3FFE6E2E3FFE6E2E3FFE6E2E3FFE6E2E3FFE6E2
          E3FFE6E2E3FFE6E2E3FFE6E2E3FF00000000000000000000000000000000F3F2
          F2FFF3F2F2FFF3F2F2FF524644FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2
          F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2F2FFF3F2
          F2FFF3F2F2FFF3F2F2FFF3F2F2FF000000000000000000000000000000005246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF000000000000000000000000000000000000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000200000002000000000000000000000000000000000000
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
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000200000009000000140000001D00000024000000250000
          001E000000150000000A00000002000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000003000000140A09085C1A1515AA28201FDB302827F6302827F62720
          1FDC1A1515AC0B09086000000016000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0003000000171511118E3E3736EA857F7EFFC6C3C3FFEEEDEDFFEEEDEDFFC6C3
          C3FF8D8887FF443B3BEC151110940000001B0000000400000000000000000000
          0000000000000000000000000000000000000000000000000000000000020000
          00111511108B534B4AF9B3AFAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC0BDBDFF5F5857FA151111930000001500000002000000000000
          0000000000000000000000000000000000000000000000000000000000070B08
          08533C3534E8A9A4A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC0BDBDFF433C3BEB0A09085C00000009000000000000
          00000000000000000000000000000000000000000000000000000000000D1A15
          149D736B6AFFEEEDEDFFFFFFFFFFF4EBE9FFC79F92FFA15F4AFFA15F4AFFC79F
          92FFF4EBE9FFFFFFFFFFFFFFFFFF8D8887FF1A1515A600000012000000000000
          000000000000000000000000000000000000000000000000000100000012281F
          1ED29B9494FFFAFAFAFFFFFFFFFFC79F92FF8F3F26FF8F3F26FF8F3F26FF8F3F
          26FFC79F92FFFFFFFFFFFFFFFFFFC6C3C3FF27201FD700000018000000000000
          0001000000060000000E00000012000000140000001400000015000000243127
          26F3B7B2B2FFFAFAFAFFFFFFFFFFA15F4AFF8F3F26FF8F3F26FF8F3F26FF8F3F
          26FFA15F4AFFFFFFFFFFFFFFFFFFEEEDEDFF312726F40000001C000000000000
          00051714135A4A403EEC524644FF524644FF524644FF524644FF524644FF362C
          2BFFB7B2B2FFEEEDEDFFFFFFFFFFA15F4AFF8F3F26FF8F3F26FF8F3F26FF8F3F
          26FFA15F4AFFFFFFFFFFFFFFFFFFEEEDEDFF312726F30000001A000000000000
          000A4A3F3DE8CAC6C5FFFAFAFAFFF6F6F6FFF5F5F5FFFAFAFAFFFEFEFEFF665F
          5EFF9B9494FFDDDBDAFFFFFFFFFFC79F92FF8F3F26FF8F3F26FF8F3F26FF8F3F
          26FFC79F92FFFFFFFFFFFFFFFFFFC6C3C3FF271F1FD300000013000000000000
          000B524644FFF1F0F0FFEFEFEFFFDBD0CDFFDBD0CDFFEEEEEEFFF8F8F8FF9893
          93FF736B6AFFC9C6C5FFECEBEAFFF4EBE9FFC79F92FFA15F4AFFA15F4AFFC79F
          92FFF4EBE9FFFFFFFFFFFFFFFFFF857F7EFF1A15159A0000000C000000000000
          0009524644FFE2E2E2FFD6CBC8FF98513BFF97513BFFD5CAC7FFEBEBEBFFCFCD
          CDFF625A59FF979090FFD0CDCCFFECEBEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3AFAEFF3E3736E40B09084B00000005000000000000
          0007524644FFC8BCB9FF97513BFF8F3F26FF8F3F26FF97513BFFD1C7C4FFE8E8
          E8FFA8A4A3FF5D5454FF979090FFC9C6C5FFDDDBDAFFEEEDEDFFFAFAFAFFFAFA
          FAFFEEEDEDFFA9A4A3FF534B4AF61511117C0000000A00000001000000000000
          00065A4540FF954F38FF8F3F26FFA36653FFA36653FF8F3F26FF97503AFFCEC3
          C0FFE6E6E6FFA7A3A3FF625A59FF736B6AFF9B9494FFB7B2B2FFB7B2B2FF9B94
          94FF736B6AFF3D3534E1151111790000000B0000000100000000000000001208
          052588402AFF8F3F26FFA46754FFF0ECEBFFF0ECEBFFA46754FF8F3F26FF9650
          3AFFCAC0BDFFE4E4E4FFCDCBCBFF989392FF665E5EFF362C2BFF302827F0271F
          1FC81A15148D0B09084200000007000000010000000000000000130805217E38
          22E18F3F26FF9E604DFFF2EEEDFFFCFCFCFFFCFCFCFFF1EDECFFA46753FF8F3F
          26FF964F39FFC8BDBAFFE2E2E2FFF3F3F3FFFCFCFCFF524644FF0000000F0000
          00070000000500000002000000010000000000000000000000006F311EC68F3F
          26FF81412DFFD2CCCAFFFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFFF1EDECFFA366
          53FF8F3F26FF954F39FFC5BBB7FFE0E0E0FFF2F2F2FF524644FF000000070000
          00000000000000000000000000000000000000000000000000003F1C1170602A
          1AAC554643FFD8D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF0EC
          EBFFA36653FF8F3F26FF954F38FFC3B9B6FFDFDFDFFF524644FF000000060000
          0000000000000000000000000000000000000000000000000000000000000000
          0001524644FFD8D6D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDFFF0ECEBFFA36652FF8F3F26FF954F38FFC3B9B6FF524644FF000000050000
          0000000000000000000000000000000000000000000000000000000000000000
          0001524644FFD6D3D3FFF4F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDFDFDFFF0ECEBFFA36652FF8F3F26FF954F38FF5A4540FF000000040000
          0000000000000000000000000000000000000000000000000000000000000000
          00004A3F3EE7B3AEADFFD6D3D2FFD6D3D3FFD7D4D4FFD8D5D4FFD8D6D5FFDAD7
          D7FFDCD9D9FFDCDADAFFD5CFCEFF9D5F4CFF8F3F26FF873F29FC130805230000
          0000000000000000000000000000000000000000000000000000000000000000
          00001411113F413736C9524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF554643FF7D3D2AF38F3F26FF6F311EC60000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010703020D602A19AB3F1C11700000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          00000000000000000001000000050000000B0000000E0000000E0000000E0000
          000E0000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
          000E0000000E0000000E0000000B000000050000000100000000000000000000
          00000000000000000005000000170000002A0000003100000032000000320000
          0032000000320000003200000032000000320000003200000032000000320000
          003200000032000000310000002A000000170000000500000000000000000000
          000000000000171413504B403EEB524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF4A3F3DED171413730000002A0000000B00000000000000000000
          0000000000004A3F3DE5BBB7B6FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCECBCAFF493F3DEB000000310000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D
          44FFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D
          44FFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D
          44FFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D
          44FFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000320000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D44FFAB5D
          44FFFFFFFFFFFFFFFFFF524644FF000000310000000E00000000000000000000
          000000000000524644FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF524644FF000000290000000B00000000000000000000
          0000000000004A3F3EE7BFBABAFFE5E3E3FFE5E3E3FFE5E3E3FFE5E3E3FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD2CFCFFF4B403EEB000000160000000500000000000000000000
          00000000000014111140413736CA524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF413736CC14111147000000050000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0002000000050000000700000007000000070000000700000007000000070000
          0007000000070000000800000006000000020000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000020000
          000A000000190000002300000025000000260000002700000027000000280000
          002800000029000000270000001E0000000D0000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000040000
          0017524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF0000001D0000000500000000000000000000
          000000000000524644FF524644FF524644FF524644FF524644FF000000050000
          001E524644FFFBDFCCFFFADDCAFFF9DBC7FFF8D9C4FFF8D7C1FFF7D4BEFFF6D2
          BAFFF5D0B8FFF4CFB5FF524644FF000000240000000700000000000000000000
          000000000000524644FFFFFFFFFFFFFFFFFFFFFFFFFF524644FF000000050000
          001D524644FFFBE0CFFFFBDECBFFFADCC8FFF9DAC5FFF8D8C2FFF7D6BFFFF6D4
          BCFFF6D2BAFFF5D0B7FF524644FF000000240000000600000000000000000000
          000000000000524644FFFFFFFFFFFFFFFFFFFFFFFFFF524644FF524644FF5246
          44FF524644FFFCE2D1FFFBE1CEFFFADECBFFF9DCC8FFF9DAC5FFF8D7C2FFF7D5
          BEFFF6D3BBFFF5D1B9FF524644FF000000230000000600000000000000000000
          000000000000524644FFFFFFFFFFFFFFFFFFFFFFFFFF524644FF000000040000
          001A524644FFFCE4D3FFFBE2D1FFFBE0CEFFFADECBFFF9DCC8FFF8D9C4FFF7D7
          C1FFF7D5BEFFF6D3BBFF524644FF000000210000000600000000000000000000
          000000000000524644FF524644FF524644FF524644FF524644FF000000040000
          0018524644FFFDE5D5FFFDE3D3FFFCE2D0FFFBE0CDFFFBDECAFFFADCC7FFF9DA
          C4FFF8D7C1FFF7D4BEFF524644FF0000001F0000000500000000000000000000
          0000000000000000000000000000000000000000000000000000000000040000
          0016524644FFFEE6D7FFFDE5D4FFFDE3D3FFFCE1D0FFFBDFCDFFFADDCAFFFADB
          C7FFF9D9C4FFF8D7C1FF524644FF0000001D0000000500000000000000000000
          0000000000000000000000000000000000000000000000000000000000030000
          0014524644FFFEE7D8FFFEE6D6FFFDE5D5FFFCE3D2FFFCE2D0FFFBE0CDFFFADD
          CAFFF9DBC8FFF8D9C5FF524644FF0000001B0000000500000000000000000000
          000000000000524644FF524644FF524644FF524644FF524644FF000000030000
          0012524644FFFEE8DAFFFEE7D8FFFEE6D6FFFDE5D5FFFCE3D2FFFBE1D0FFFBE0
          CDFFFADECBFFFADCC8FF524644FF000000190000000400000000000000000000
          000000000000524644FFFFFFFFFFFFFFFFFFFFFFFFFF524644FF000000030000
          0010524644FFFEE9DAFFFEE8D9FFFEE7D8FFFDE6D6FFFDE4D4FFFCE3D2FFFCE1
          D0FFFBE0CDFFFADECBFF524644FF000000170000000400000000000000000000
          000000000000524644FFFFFFFFFFFFFFFFFFFFFFFFFF524644FF524644FF5246
          44FF524644FFFFEADBFFFFE9DAFFFEE8D9FFFEE7D8FFFDE6D6FFFDE5D4FFFDE3
          D2FFFCE1D0FFFBE0CEFF524644FF000000150000000400000000000000000000
          000000000000524644FFFFFFFFFFFFFFFFFFFFFFFFFF524644FF000000020000
          000D524644FFFFEADCFFFFE9DBFFFFE9DAFFFEE8D9FFFEE7D8FFFDE6D6FFFDE5
          D5FFFCE3D3FFFCE2D0FF524644FF000000130000000300000000000000000000
          000000000000524644FF524644FF524644FF524644FF524644FF000000020000
          000B524644FFFFEADCFFFFEADCFFFFE9DBFFFFE8DAFFFEE8D9FFFEE7D8FFFEE6
          D6FFFDE5D5FFFCE3D3FF524644FF000000100000000300000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0007524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF0000000B0000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000300000006000000090000000A0000000A0000000B524644FF0000000B0000
          000C0000000D0000000C0000000A000000040000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000100000001000000010000000200000002524644FF000000020000
          0002000000020000000200000002000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000524644FF524644FF524644FF524644FF5246
          44FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000524644FFFFFFFFFFFFFFFFFFFFFFFFFF5246
          44FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000524644FFFFFFFFFFFFFFFFFFFFFFFFFF5246
          44FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000524644FFFFFFFFFFFFFFFFFFFFFFFFFF5246
          44FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000524644FF524644FF524644FF524644FF5246
          44FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000030000000500000005000000020000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000020000
          0008000000140000001C000000190000000E0000000400000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000002000000090000
          001B2A160A7879411EF2542D16B71E1109550000000D00000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000002000000080000001A2C18
          0B7A884C28FD90522CFF985833FF653D25B40000001400000003000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000006000000172E1A0D789253
          2EFD9D5D37FFA86842FFB5744EFFB07552EF0000001400000003000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000020000000F1E1109589B5B36FDAA69
          41FFB87750FFC7855FFFCE8F68FB4833266D0000000C00000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000070000001C985B37F3B16F49FFC07F
          57FFCE8E66FFD2956EFB4935286E000000100000000500000001000000000000
          0000000000000000000000000000000000020000000400000005000000050000
          0005000000030000000300000005000000120504043F85583FF5C68660FFD595
          6EFFD79875FA4A362A6B0000000F000000040000000100000000000000000000
          00000000000000000002000000060000000D000000150000001A0000001B0000
          0018000000130000000F00000013050404382F2523E1584238FF9A6F57F3CD94
          72EF2F231B4B0000000D00000004000000010000000000000000000000000000
          0000000000030000000900000017110D0C6C1F1817B02B2121E0322725FB2B21
          21E01F1917AE110D0C6C0504043C2F2524E0372C2AFF2E2424DD050404340000
          0012000000090000000300000001000000000000000000000000000000000000
          0002000000090504032E251F1DA0524643FD5E514EFF645754FF5B4F4DFF5044
          42FF423634FF332826FD312725F1372C2AFF2E2523DC0504042F0000000B0000
          0004000000010000000000000000000000000000000000000000000000000000
          0005000000142D25259F6A5C5AFF7D6F6DFFB1A6A2FFDDD3CEFFFBF2EDFFDDD3
          CEFFAEA4A0FF635855FF372C2AFF312725F0050404320000000B000000030000
          0000000000000000000000000000000000000000000000000000000000010000
          000A1B1717676E605EFD807270FFCBBDB7FFFEF0E6FFFEEFE5FFFEF1E8FFFEF3
          EBFFFFF5EFFFC9BEBAFF645956FF332826FD100D0C6100000007000000010000
          0000000000000000000000000000000000000000000000000000000000020000
          000E463D3CAA726462FFB5A69EFFFDEADFFFFDEDE0FFFDECE1FFFEEDE2FFFEEE
          E4FFFEF1E7FFFEF5EDFFAFA4A0FF433835FF201817A400000007000000010000
          0000000000000000000000000000000000000000000000000000000000030000
          000F645856DD756764FFDDCABEFFFCE9DDFFFDEBDEFFFDE8DBFFFDEADDFFFDEB
          DEFFFDECE0FFFDF0E6FFDDD1CCFF544745FF2B2120DA00000007000000010000
          0000000000000000000000000000000000000000000000000000000000030000
          000E776966FB786A67FFF8E3D3FFFCEADEFFFCEEE3FFFCE8DBFFFCE6D7FFFCE7
          D8FFFCE8DAFFFDEBDFFFFAEDE5FF635654FF322725FA00000006000000010000
          0000000000000000000000000000000000000000000000000000000000020000
          000B695D5ADB7B6D6AFFDECABEFFFCEBE0FFFDF0E8FFFCF0E6FFFBE5D7FFFBE3
          D2FFFCE4D4FFFCE5D6FFDDCFC8FF6E605EFF2B2220D900000003000000010000
          0000000000000000000000000000000000000000000000000000000000010000
          00074E4443A37E6F6DFFBAA8A0FFFCEDE2FFFDF4EDFFFEF9F5FFFDF3EDFFFBE6
          D9FFFAE0CEFFFAE3D3FFB5A69FFF685B58FF1F19189E00000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00042A2524597F716EFC8F807BFFD0C1B9FFFDF5EEFFFEFBF8FFFFFFFFFFFEF8
          F4FFFCEBE0FFCDBBB2FF877874FF5A4D4BFC100D0C5300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000100000004473F3E8F827371FF90817EFFBCB0ABFFE2DAD6FFFAF7F4FFE1D9
          D5FFBAAEAAFF8A7D79FF786967FF2821208B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010C0B0B1A48403E8D827471FC837471FF827370FF80716FFF7F70
          6EFF7E706DFF7C6D6BFC322B298B050403170000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000012B2626535148469C6F6360D780726FFA6E61
          5ED74E45439C1E1A195200000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000050000
          0013000000240000002300000013000000050000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001B384C761F5B
          83E90F4364EF0000005900000039000000150000000400000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001477EA2E667B3
          E4FF46A1DDFF11476AF300000064000000360000001200000003000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000014682A9E89BCF
          F1FF6FB8E7FF4398D0FF13476AF3000000600000003200000010000000020000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000074A86
          ADEA91C3E3FF5999C3FF3D7BA2FF252D31F2000000590000002E000000100000
          0007000000070000000700000004000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          000A4481ABEA6D96B1FF7C8082FFA9A9A9FF212121F200000056000000340000
          00250000002500000024000000190000000D0000000400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010000000B747576EADCDCDCFFC9C9C9FF8D8D8DFF5B5C5CFA555555EE3636
          36FD272727FD323232ED2C2C2CB40101012E0000001200000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020000000D7B7B7CEBE3E3E3FF989898FF8D8D8DFFAAAAAAFFC5C5
          C5FFC0C0C0FF909090FF4E4E4EFF313131D40101012E0000000D000000010000
          0002000000030000000500000005000000050000000500000005000000050000
          00050000000500000008000000149D9D9EF7A7A7A7FFE5E5E5FFE0E0E0FFDCDC
          DCFFD7D7D7FFD3D3D3FFCFCFCFFF505050FF2E2E2EB40000001C000000040000
          000B0000001300000017000000190000001A0000001A0000001B0000001C0000
          001D0000001D0000001E000000236B7783E96184A9FF487CB4FF477BB2FF4A84
          B9FF8DB5D2FFDBDBDBFFD7D7D7FF959595FF343434ED000000280000000A104F
          6E9A1974A7F2116194FF116194FF116194FF116194FF116194FF116194FF1161
          94FF116194FF116194FF116194FF6C7579FF79C8ECFF74CCF6FF70CAF5FF61B5
          E4FF558EC2FFE3E3E3FFDFDFDFFFC9C9C9FF282828FD0000002D000000101A76
          AAF225AEE8FF13659AFF4DC6F7FF45C3F7FF3FC1F7FF39BEF7FF33BCF6FF30BA
          F6FF2CB8F6FF28B7F6FF25B5F6FF4F595EFF6AC2E9FF66CAF7FF63C8F6FF74CD
          F6FF497FB7FFEBEBEBFFE6E6E6FFD2D2D2FF383838FD0000002B00000012196E
          A4FF29C5FFFF166A9FFF61CEF9FF5ACCF9FF55C9F7FF4EC6F7FF47C4F7FF41C1
          F7FF3ABEF7FF37BDF7FF33BBF7FF3E6171FF67A6C0FF72CFF8FF6ECDF8FF87D4
          F8FF4D84BEFFF2F2F2FFEEEEEEFFB6B6B6FF595959EB00000022000000111A70
          A7FF29C7FFFF196FA5FF76D6FAFF70D4FAFF6AD1FAFF63CFFAFF5ECCF8FF56C9
          F8FF50C7F8FF4AC5F7FF43C2F7FF4087A5FF4C6B78FF7FD5F9FF7BD3F9FF9CDD
          FAFF508CC7FFF8F8F8FFF5F5F5FF949494FF535353AD000000150000000F1B72
          A9FF29C9FFFF1C73ABFF8BDDFBFF85DBFAFF7FD9FAFF79D7FAFF72D4FAFF6DD2
          FAFF67CFF8FF60CDF8FF5ACBF8FF53C7F7FF417286FF506C78FF75ABC1FFAADA
          EDFF5793C8FFD8D8D8FFADADADFF777777CD0101011F000000090000000E1C74
          ACFF29CBFFFF1F78B1FF9BE3FCFF97E2FBFF93E0FBFF8DDEFBFF88DCFBFF82DA
          FBFF7CD8FAFF76D5FAFF70D3FAFF6AD1F9FF64CEF8FF518EA6FF4A6671FF585C
          5EFF697076FF939393E96E6E6EA70101011C0000000A000000020000000C1E76
          AEFF29CEFFFF227DB7FFAAE8FCFFA6E7FCFFA2E5FCFF9EE4FBFF9AE2FBFF95E1
          FBFF90DFFBFF8BDDFBFF86DBFBFF80D9FBFF7BD7FAFF73D4F9FF6ED2F9FF67D0
          F9FF227DB7FF000000120000000D0000000700000002000000000000000A1F78
          B0FF29D0FFFF2582BCFFB5EBFDFFB2EBFCFFAFEAFCFFACE9FCFFA9E7FCFFA5E6
          FCFFA1E5FCFF9DE4FCFF98E2FBFF93E0FBFF8EDEFBFF89DCFBFF84DAFAFF7ED8
          FAFF2582BCFF000000020000000200000001000000000000000000000008207A
          B3FF29D2FFFF439ED1FFBCDEF0FFFEFFFFFFFDFFFFFFFCFEFFFFFBFEFFFFFAFE
          FFFFF8FDFFFFF7FDFFFFF4FCFFFFF2FBFFFFEEFAFEFFEBF9FEFFE7F8FEFFA5D6
          EEFF378EC0EF000000000000000000000000000000000000000000000007217C
          B5FF29D5FFFF4AC1EBFF45A1D4FF2A8AC6FF2A8AC6FF2A8AC6FF2A8AC6FF2A8A
          C6FF2A8AC6FF2A8AC6FF2A8AC6FF2A8AC6FF2A8AC6FF2A8AC6FF2A8AC6FF3A96
          CDFF32617B8E000000000000000000000000000000000000000000000005227E
          B7FF29D7FFFF29D6FFFF29D6FFFF29D6FFFF29D5FFFF29D5FFFF29D4FFFF29D4
          FFFF29D3FFFF29D3FFFF29D2FFFF29D2FFFF29D1FFFF29D1FFFF27BBECFF1F81
          B5F000000000000000000000000000000000000000000000000000000004237F
          BAFF29D9FFFF29D8FFFF29D8FFFF29D8FFFF28CCF6FF227EB7FF227DB7FF227D
          B7FF227CB6FF217CB6FF217CB5FF217CB5FF217BB4FF207BB4FF2084B7F01457
          748F000000000000000000000000000000000000000000000000000000022481
          BCFF28D0F7FF29DAFFFF29DAFFFF28CFF7FF2480BAFF00000006000000060000
          0006000000070000000700000008000000080000000800000006000000030000
          0001000000000000000000000000000000000000000000000000000000011B71
          92B0248AC2FB2582BDFF2582BDFF2489C0FB1A6F92B000000001000000010000
          0001000000010000000100000001000000010000000100000001000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0002000000060000000400000002000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000050000
          00110000001E000000190000000A000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000003000000100000
          0047000000DF0000009900000019000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000010000000200000002000000060000001F0000
          00B4000000FF000000B60000001A000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000001000000050000000A000000090000000F000000410101
          01F7000000FD0000005A00000011000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000030000000D1515158E0000001B0000001F0303039C0202
          02FF000000C90000002300000008000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000300000014353535FF1212129A0101013D0A0A0AF00404
          04FF000000680000001800000007000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000300000014424242FF2D2D2DFF141414C8101010FF0606
          06D80000003A0000002500000015000000080000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000003000000114F4F4FFF393939FF252525FF171717FF0C0C
          0CFF050505FF020202FF000000C10000000C0000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000020000000D5D5D5DFF454545FF303030FF1F1F1FFF1212
          12FF090909FF020202C400000018000000080000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000001000000096B6B6BFF525252FF3C3C3CFF282828FF1919
          19FF0A0A0AC20000001600000009000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          000300000007000000090000000E797979FF606060FF484848FF333333FF1717
          17C10000001A000000100000000B0000000A0000000800000004000000010000
          000000000000000000000000000000000000000000000000000000000002110F
          0E3E382F2EAF3D3433BF3D3432C0888888FF6F6F6FFF565656FF3E3B3BEE3B32
          31C23C3432C03D3433BF3D3433BF3D3433BF382F2EAF110F0E40000000030000
          000000000000000000000000000000000000000000000000000000000004372F
          2DAD878282BFA4A0A0BFA39F9FBF959595FF7C7C7CFF737373EDA09D9DC0A39F
          9FC0A3A0A0BFA4A0A0BFA4A0A0BFA4A0A0BF878282BF372F2DAD000000060000
          0000000000000000000000000000000000000000000000000000000000043D34
          33BFA6A3A3BFA6A3A3BFA6A3A3BFA0A0A0FF929191EDA6A2A2C0A6A2A2C0A6A2
          A2C1A7A3A3C2A7A3A3C2A7A3A3C2A7A3A3C2A7A3A3C23E3433C2000000130000
          000D0000000D0000000D0000000D0000000B0000000500000001000000043D34
          33BFA8A5A5BFA8A5A5BFA8A5A5BFA8A7A7EDA8A5A5BFA8A5A5C0AEAAAAD4BAB4
          B4FABCB6B6FFBCB6B6FFBCB6B6FFBCB6B6FFBCB6B6FF524644FF514543FF5246
          44FF524644FF524644FF524644FF4A3F3DEA1714135600000004000000033D34
          33BFA9A7A7BFA9A7A7BFA9A7A7BFA9A7A7BFA9A7A7BFA9A7A7C1BBB7B7F9D6D2
          D2FFE0DDDDFFE0DDDDFFE0DDDDFFE0DDDDFFE0DDDDFF746A69FFD7D2D2FFDBD6
          D6FFDBD6D6FFDBD6D6FFDBD6D6FFB4ADADFF493F3DE700000008000000013830
          2EAE979392BFB5B4B4BFB5B4B4BFB5B4B4BFB5B4B4BFB5B3B3C1CAC5C5FFEDEA
          EAFFEDEAEAFFEDEAEAFFEDEAEAFFEDEAEAFFCEC9C9FF7E7573FFDCD7D7FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FF00000009000000010F0D
          0D31312928973D3433BF3D3433BF3D3433BF3D3433BF3E3533C0524644FF766C
          6AFF766C6AFF766C6AFF766C6AFF766C6AFF8B8281FFC3BDBDFFDFDBDBFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FF00000008000000000000
          0000000000010000000100000001000000010000000100000005514644FFE1DE
          DEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE1DEDEFFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FF00000006000000000000
          00000000000000000000000000000000000000000000000000024B403EE8C9C4
          C3FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFC9C4C3FF4B403EE800000004000000000000
          0000000000000000000000000000000000000000000000000001141111414137
          36CA524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF403735CB1411114400000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000010000000200000002000000020000000200000002000000020000
          0002000000020000000200000002000000020000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000070000
          0010000000140000001400000014000000100000000800000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000061714135E4A40
          3EEC524644FF524644FF524644FF4A403EEC1714135E00000007000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D493F3DE9B4AD
          ADFFDBD6D6FFDBD6D6FFDBD6D6FFB4ADADFF493E3DEA0000000E000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000E524644FFDED9
          D9FFEAE6E6FFEAE6E6FFEAE6E6FFDED9D9FF524644FF00000010000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000524644FF524644FF524644FF524644FF0000000D524644FFE0DC
          DCFF524644FF524644FF524644FFE0DCDCFF524644FF0000000E000000010000
          0002000000050000000600000007000000070000000700000007000000070000
          000800000008524644FF00000008000000080000000800000013524644FFE6E3
          E3FFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FF0000000D000000050000
          000F0000001A0000002100000024000000250000002600000027000000270000
          002900000029524644FF0000002B0000002C0000002D000000344A3F3DEDC9C4
          C3FFF2F0F0FFF2F0F0FFF2F0F0FFC9C4C3FF4A3F3DEA000000090000000D1714
          13624A3F3DED524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF514543FF4F4342FF4F43
          41FC524644FF524644FF524644FF413736CF1411114A0000000300000014493E
          3DEABAB5B5FFE2E0DFFFE1DFDFFFE0DEDEFFDFDDDDFFDEDCDCFFDEDBDBFFDCDA
          DAFFDCD9D9FF524644FFDAD7D7FFD9D6D6FFD8D5D4FFD6D3D3FFCECBCAFFA29C
          9CFF433836EF0000003B00000021000000150000000A00000002000000165246
          44FFE7E6E5FFE7E5E5FFE6E4E4FFE5E3E3FFE4E2E2FFE3E1E1FFE3E1E0FFE1DF
          DFFFE0DEDEFF524644FFDEDCDCFFDEDBDBFFDCDADAFFD6D4D4FFA29E9CFF5A4F
          4EFF524644FF524644FF524644FF4A403EEC1714135E00000007000000155246
          44FFECEBEAFFEBEAEAFFEAE9E8FFE9E8E8FFE9E7E7FFE8E6E6FFE7E5E5FFE6E4
          E4FFE5E3E3FF524644FFE3E1E1FFE3E1E0FFE2E0DFFFD5D3D3FF5C5250FFB4AD
          ADFFDBD6D6FFDBD6D6FFDBD6D6FFB4ADADFF493E3DEA0000000E000000115246
          44FFF0EFEFFFEFEEEEFFEEEDEDFFEDECECFFEDEBEBFFECEBEAFFEBEAEAFFEBE9
          E9FFE9E8E8FF524644FFE8E6E6FFE7E6E5FFE6E4E4FFD8D6D6FF524644FFDED9
          D9FFEAE6E6FF524644FFEAE6E6FFDED9D9FF524644FF000000100000000F5246
          44FFF3F3F3FFF3F2F2FF7E4318FF7E4318FF7E4318FF7E4318FFEFEEEEFFEFEE
          EDFFEDECECFF524644FF524644FF524644FF524644FFDDDCDCFF524644FFE0DC
          DCFF524644FF524644FF524644FFE0DCDCFF524644FF0000000E0000000C5246
          44FFF7F6F6FFF6F6F5FFF6F5F5FFF5F4F4FFF4F3F3FFF3F3F3FFF3F2F2FFF2F1
          F1FFF1F0F0FF524644FFF0EFEFFFEFEEEEFFEFEEEDFFE3E3E3FF524644FFE6E3
          E3FFE2DFDFFF524644FFE2DFDFFFE2DFDFFF524644FF0000000D0000000A5246
          44FFFAFAFAFFFAF9F9FF2503CEFF2503CEFF2503CEFF2503CEFF2503CEFF2503
          CEFFF5F4F4FF524644FFF3F3F3FFF3F2F2FFF2F1F1FFEAE9E9FF5E5352FFC9C4
          C3FFF2F0F0FFF2F0F0FFF2F0F0FFC9C4C3FF4A3F3DEA00000009000000095246
          44FFFDFDFDFFFCFCFCFFFCFBFBFFFCFBFBFFFBFBFBFFFAFAFAFFFAF9F9FFF9F8
          F8FFF8F8F8FF524644FFF7F6F6FFF7F6F6FFF6F6F5FFF3F2F2FFC4C0BFFF6F66
          64FF524644FF524644FF524644FF413736CF1411114A00000003000000075246
          44FFFFFFFFFFFFFFFFFF7E4318FF7E4318FF7E4318FF7E4318FFFCFCFCFFFCFC
          FCFFFCFBFBFFFBFBFBFFFAFAFAFFFAF9F9FFF9F8F8FFF8F8F8FFF6F6F6FFF3F2
          F2FF504442FF0000001C0000000B000000060000000300000000000000065246
          44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFFFEFEFEFFFEFEFEFFFDFDFDFFFCFCFCFFFCFCFCFFFCFBFBFFFBFBFBFFFAFA
          FAFF524644FF0000001300000003000000000000000000000000000000055246
          44FFFFFFFFFFFFFFFFFF7E4318FF7E4318FF7E4318FF7E4318FF7E4318FF7E43
          18FF7E4318FF7E4318FF7E4318FF7E4318FFFEFEFEFFFEFEFEFFFEFEFEFFFDFD
          FDFF524644FF0000001000000003000000000000000000000000000000045246
          44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000000D00000002000000000000000000000000000000024B40
          3EE8D2CFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CF
          CFFF4A3F3DE90000000900000002000000000000000000000000000000011411
          1141413736CA524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF4037
          36CD141111480000000500000001000000000000000000000000000000000000
          0001000000010000000200000003000000030000000300000004000000040000
          0004000000050000000600000006000000060000000700000007000000070000
          0006000000040000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000070000001A0000001D0000
          0013000000080000000200000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000001000000160A0A0AF80C0C0CF52121
          21C919191961000000210000000D000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000013131313CF444444FF6767
          67FF333333FF464646F733312F8E0000001B0000000500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000082B2B2B77545454FFFFFF
          FFFFFFFFFFFFD0D0D0FF705B46FF794819D90000002200000006000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000020000001F747474FBE4E4
          E4FFFFFFFFFFFFFFFFFFCEB599FFB67D3EFF8A5823DD00000022000000060000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D626262ACA0A0
          A0FFFFFFFFFFE7DCCEFFD8BD97FFEAC997FFC48C4BFF905B23E2000000230000
          0006000000000000000000000000000000000000000000000000000000000000
          00000000000000000001000000010000000100000001000000030202011B968A
          7CE6CBBBA5FFE3DECBFFE8DCC1FFEAD4AEFFEACB9AFFC89253FF915D24E50403
          012A000000060000000000000000000000000000000000000000000000020000
          000900000014000000190000001B0000001B0000001C0000001D000000220000
          0039A18058E5CCB28FFFE6E5D2FFE7DFC2FFEAD5B2FFEACD9EFFCA9759FF975F
          25EB0402012B0000000700000001000000000000000000000000000000081714
          13624A3F3DED524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FFAC8C68FFCBB28DFFE4E5D4FFE7DFC5FFE8D8B4FFEACFA0FFCE9E
          62FF6A4220F204030230000000070000000100000000000000000000000F493E
          3DEABAB5B5FFE2E0DFFFE1DFDFFFE0DEDEFFDFDDDDFFDEDCDCFFDEDBDBFFDCDA
          DAFFDCD9D9FFDAD8D7FFCAAF8DFFCAAF8AFFE3E6D7FFE5DFC9FFE7D8B8FFC2AF
          8FFF6C5A4EFF4A3128EF0402032E000000070000000100000000000000115246
          44FFE7E6E5FFE7E5E5FFE6E4E4FFE5E3E3FFE4E2E2FFE3E1E1FFE3E1E0FFE1DF
          DFFFE0DEDEFFE0DEDDFFDEDCDCFFCDB596FFCAAE89FFE2E7D9FFC7C5B6FFA7A4
          9DFFB3AFABFF776A64FF581C43F10900083200000007000000010000000F5246
          44FFECEBEAFFEBEAEAFFEDECEBFFF0EFEFFFEBE9E9FFF0EFEFFFE9E7E7FFEFED
          EDFFE5E3E3FFEEEDECFFE5E3E3FFE5E3E2FFC5B098FFA18A72FFCCCBC9FFEBE9
          E5FFD5D3CFFFB18BAAFF98248CFF680D61F309010832000000070000000D5246
          44FFF0EFEFFFEFEEEEFFB0ABAAFF5D514FFFD0CCCBFF524644FFCECBCAFF5246
          44FFE9E8E8FF524644FFCCC8C7FFCBC8C6FF524644FFBAB0ADFFA59792FFF4F2
          F0FFDBBDD6FFC365C0FFCB4DC2FFAB2EA1FF6B1065F50C020B340000000B5246
          44FFF3F3F3FFF3F2F2FFDDDADAFFA7A1A0FFC7C3C3FF524644FFC7C3C2FF5246
          44FFEDECECFF524644FFC4C0BFFFC4C0BFFF524644FFE9E8E8FFC1ADB9FFA26F
          99FFDF9DE4FFE296E3FFDD83DBFFD569D0FFB441ABFF6E166AF5000000095246
          44FFF7F6F6FFF6F6F5FFF6F5F5FFF5F4F4FFCAC6C5FF524644FFC9C5C4FF5246
          44FFF2F1F1FF524644FFC7C3C2FFC7C3C2FF524644FFEEEDEDFFEDEBEBFFD3A3
          D2FFB668B5FFF4C4F5FFF1B9F2FFE8A0E8FFBF65BCFF782575F0000000075246
          44FFFAFAFAFFFAF9F9FFF9F8F8FFF8F8F8FFCCC9C8FF524644FFCBC8C7FF5246
          44FFCCC9C8FF524644FFDEDCDCFFC9C5C4FF524644FFF1F0F0FFF1F0F0FFF0EF
          EFFF95668EFFB664B3FEF6CAF7FFDCA2DCFFAB5DA9FD633063AB000000065246
          44FFFDFDFDFFFCFCFCFFFCFBFBFFFCFBFBFFD9D7D6FF524644FFD8D5D5FF5246
          44FF524644FF898180FFF7F6F6FFD6D3D2FF524644FFF6F5F5FFF5F4F4FFF4F3
          F3FF524644FF53375280B253ADFEAA5CA7EF754673AA0000000D000000055246
          44FFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFDCD9D9FFFCFCFCFFFCFC
          FCFFFCFBFBFFFBFBFBFFFAFAFAFFFAFAFAFFD9D6D6FFF8F8F8FFF8F8F8FFF8F7
          F7FF524644FF000000150000000C0000000C0000000700000002000000055246
          44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CECDFF5E5250FFFFFFFFFFFEFE
          FEFFFEFEFEFFFEFEFEFFFDFDFDFFCFCBCBFF5D5250FFFCFBFBFFFBFBFBFFFAFA
          FAFF524644FF0000000E00000001000000000000000000000000000000045246
          44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFDFD
          FDFF524644FF0000000C00000000000000000000000000000000000000035246
          44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000000A00000000000000000000000000000000000000024B40
          3EE8D2CFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CF
          CFFF4A3F3DE90000000700000000000000000000000000000000000000011411
          1141413736CA524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF4037
          36CD141111480000000300000000000000000000000000000000000000000000
          0000000000010000000100000002000000020000000200000003000000030000
          0003000000040000000400000004000000050000000500000005000000060000
          0004000000020000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000100000000000000060000
          00150000001B0000001B0000001B0000001B0000001C0000001C0000001C0000
          001C0000001D0000001D0000001D0000001D0000001D0000001E0000001E0000
          001E0000001E0000001E0000001F0000001F0000001800000007000000145353
          53FF515151FF505050FF4D4D4DFF4C4C4CFF4A4A4AFF484848FF474747FF4545
          45FF434343FF414141FF404040FF3E3E3EFF3C3C3CFF3A3A3AFF393939FF3737
          37FF353535FF343434FF323232FF303030FF2E2E2EFF00000017000000175D5D
          5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF383838FF0000001C000000166666
          66FFFFFFFFFF19C058FF19C058FFFFFFFFFF19C058FF19C058FFFFFFFFFF19C0
          58FF19C058FFFFFFFFFF19C058FF19C058FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424242FF0000001B000000156F6F
          6FFFFFFFFFFF21CA60FF21CA61FFFFFFFFFF21CA61FF21CA60FFFFFFFFFF20CA
          61FF21CA61FFFFFFFFFF21CA60FF20CA61FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4C4C4CFF00000019000000137777
          77FFFFFFFFFF42D97BFF42D97BFFFFFFFFFF42D97BFF42D97BFFFFFFFFFF42D9
          7BFF42D97BFFFFFFFFFF42D97BFF42D97BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FF00000018000000127E7E
          7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5FFF00000017000000115353
          53FF515151FF505050FF4D4D4DFF4C4C4CFF4A4A4AFF484848FF474747FF4545
          45FF434343FF414141FF404040FF3E3E3EFF3C3C3CFF3A3A3AFFBC641DFFBB63
          1BFFBB611AFFBA5F19FFBA5E18FFBA5E17FFB95B15FF000000150000000F5D5D
          5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC06B24FFF6DB
          AFFFF6DAADFFF6D9ACFFF5D8AAFFF4D7A8FFBB611AFF000000140000000E6666
          66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4742DFFF8E2
          BCFFEECC9FFFC16E27FFEDC99CFFF7DFB7FFBF6821FF000000120000000D6F6F
          6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC97E38FFF0D3
          ACFFC77933FFC67731FFC5752FFFEFCFA6FFC3702AFF000000110000000C7777
          77FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE8944FFE8C2
          96FFCC833EFFF6E0C1FFCA7F39FFE9C599FFC87A35FF000000100000000A7E7E
          7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD49451FFFCF0
          DBFFFCF0DBFFFCEFD9FFFCEFD9FFFCEED7FFCC8440FF0000000E00000009BC64
          1DFFBB631BFFBB611AFFBA5F19FFBA5E18FFBA5E17FFB95B15FF474747FF4545
          45FF434343FF414141FF404040FF3E3E3EFF3C3C3CFF3A3A3AFFD9A161FFD89D
          5DFFD69B5BFFD69857FFD49553FFD29251FFD2904DFF0000000D00000008C06B
          24FFF6DBAFFFF6DAADFFF6D9ACFFF5D8AAFFF4D7A8FFBB611AFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF383838FF0000000C00000007C474
          2DFFF8E2BCFFF8E2BBFFF7E0B9FFF7DFB8FFF7DFB7FFBF6821FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424242FF0000000B00000006C97E
          38FFFAE8C8FFC77933FFFAE7C6FFC5752FFFF9E5C3FFC3702AFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4C4C4CFF0000000A00000005CE89
          44FFFBECD3FFFBECD1FFFBEBD0FFFBEBD0FFFBEBCEFFC87A35FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF565656FF0000000900000004D494
          51FFFCF0DBFFFCF0DBFFFCEFD9FFFCEFD9FFFCEED7FFCC8440FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5FFF0000000700000002D9A1
          61FFD89D5DFFD69B5BFFD69857FFD49553FFD29251FFD2904DFF7C7C7CFF7B7B
          7BFF7A7A7AFF787878FF777777FF767676FF747474FF737373FF717171FF7070
          70FF6F6F6FFF6D6D6DFF6B6B6BFF6A6A6AFF696969FF00000005000000010000
          0002000000030000000300000003000000030000000300000003000000030000
          0004000000040000000400000004000000040000000400000004000000040000
          0004000000050000000500000005000000050000000400000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          20000000000000090000000000000000000000000000000000002A4653713662
          77B20D191E3A0000000F0000000A000000060000000200000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000066A5C3F06BAD
          CBFF4786A7FE396D86D70D181D460000001A0000001000000009000000030000
          0001000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000006CA8C4E67EBD
          DAFF93CDE9FF6EAECCFF3E7C9BFE336580D90B171D5100000023000000150000
          000B000000040000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000050607095B85
          99B172B4D3FE92CBE5FF91CCE8FF6AA9C7FF367391FE2E607ADB0B171C570000
          0027000000160000000B00000004000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000131444E5A6EAECDF57EBCD9FF99D2EBFF8FCCE7FF65A4C3FF2E6987FE2B5B
          75DB0B161C5700000027000000160000000A0000000300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000002577D8FA668ACCDFE8CC5E0FF9CD4EDFF8ECAE6FF619F
          BEFF27607FFE285771DB0A161B56000000240000001100000006000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000141B1F266BA1BADD73B3D2FF98CFE7FF9AD3
          EDFF8DCAE6FF5D9BB9FF225978FE3A525ECC050301310000001C0000000E0000
          0007000000030000000100000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000013C535E6E6BABC9F882BD
          D9FFA1D6EEFF99D1EBFF447893FEB87949FAB36E3EF9513018890000002B0000
          001E00000016000000100000000B000000050000000100000000000000000000
          0000000000000000000000000000000000000000000000000000040505085C85
          98B467A8C9FE81BAD7FFBB9679F6DB9D70FFE39C69FFC27D4BFF84512DE90C07
          03920000005E0000004000000027000000190000000B00000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00011E292E378FA2A8DDD7A783FEE3B28DFFEFB78FFF745641FF070707FF0303
          03FF000000FF000000FF000000D30000007A000000210000000C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000012A242031BB977ED3D9A682FE4B3E34FF101010FF0D0D
          0DFF080808FF030303FF000000FF000000FF000000BC0000001F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000002C190634785D4587766254F8262626FF3131
          31FF353535FF292929FF151515FF030303FF000000FF0000008B261A0F261A11
          091A0C08040C03020103030201030B07030C180F071A2B1A0B2E41270F465A36
          13637846188497571CA9BA6A1ED2DE7D21FEE69D59FFD2A880FF5B5A59FF5A5A
          5AFF565656FF525252FF4E4E4EFF363636FF080808FF030303DFB6804EB7FCAC
          60FFFBA556FFF9A14FFFF79F4CFFF59C48FFF29844FFF0953FFFEE913AFFEB8E
          36FFE98A32FFE6872DFFE38328FFE18024FFE1852EFFEDB98AFFAA9079EA7C7C
          7CFF787878FF757575FF717171FF6D6D6DFF393939FF0D0E0DFF92694393FDB1
          67FFFCAA5CFFFAA452FFF8A14FFFF69E4BFFF49B47FFF29743FFF0943EFFED91
          3AFFEA8D35FFE88931FFE5862CFFB6681FCC834A149552361B5B2C3025404C63
          558D8B968FEF969696FF939393FF909090FF7C7C7CFF151616F6553E2955E4A2
          63E5F1A55EF3F8A556FCF7A150FCEC984AF3DD8D42E5C87E39D1AF6E30B9925A
          259C72451B7B4F2F12562918082D021E0C34023E196A045F26A41C8B46E066BB
          86FF83C89DFF88C39EFF9EB3A5FBB0B0B0FFACACACFF1B1B1BD50307050A0713
          0B1A0308050C01020103000201030108040C0211081A021D0C2E022B1246033C
          186304502084056529A9067C32D207953DFE06953CFF06943CFF07933BFF0692
          3BFF189747FB397550A52C40385889899AC3C2C2C2FF1A1A1A9C010201033A91
          5AC440B76DFF36B264FF2CAF5DFF23AA56FF1BA74FFF13A349FF0D9F44FF079C
          3FFF079B3FFF079A3EFF07993DFF07983DFF07973DFF07953CFF057F34DB0455
          22930229144C0202435A34348FB18181D8FFAAAAAAE011111151000000002B62
          40824ABC74FF3FB76CFF36B364FF2CAF5DFF23AA56FF1AA64EFF13A349FF0C9F
          44FF079C3FFF079B3FFF079A3EFF067A32CC045924950236165B0211223F0303
          536C05058AB60706C0FF0808BFFF7171D7FF5252527B0101010500000000142A
          1D374CAD70E748B973FC3DB46BFC33AB5EF3279C53E51C8B46D1137839B90B63
          2C9C064D217B02351556011B0B2D020229340303556A050582A40606B0E00707
          C7FF0707C5FF0707C3FF0706B7F22424738E0808080F00000000000000000000
          000001010708000003030000030301010A0C0202161A0303272E03033B460303
          536305056E8405058DA90707ADD20808CFFE0808CFFF0808CDFF0807CBFF0808
          C9FF0707C4FB05057FA502023C4E000000000000000000000000000000000000
          00000F0F434C2C2CD5F32727DEFF2020DDFF1A1ADCFF1616DBFF1111DAFF0C0C
          D8FF0909D7FF0909D5FF0909D4FF0808D3FF0808D1FF0808CFFF0707B1DB0504
          769302023A490000000000000000000000000000000000000000000000000000
          0000000000001F1F81932F2FDFFF2828DEFF2222DDFF1B1BDCFF1717DBFF1212
          DAFF0D0DD9FF0909D7FF0909D6FF0607AACC05057B9503034B5B0101191F0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000C0C2B312B2BB1C92F2FD5F32626C7E51D1DB5D11515A0B90E0E
          869C0909697B050549560202262D000001010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000030000000A0000
          00140000001900000019000000150000000D0000000400000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000040000001404344D8B0654
          87E6064D87FA064D88F905517FDD043D5DA801090D320000000D000000030000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000300000015085480CE08629EFF0B92
          CAFF0BACE2FF0BA8DFFF0986BFFF0766A0FF054A83FB03324B90000000190000
          0006000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000010000000C0B4968A70F76AFFF18C8F7FF12C6
          F7FF0EC3F8FF0DC4F8FF0CC2F8FF0DC3F9FF0BADE5FF075B95FF065182E50108
          0C32000000080000000100000000000000000000000000000000000000000000
          0000000000000000000000000004030E12310A5D9BFE26C4F0FF21CAF6FF19C9
          F7FF12C6F7FF0DC5F7FF0EC4F8FF0DC4F8FF0DC3F9FF0CC3F9FF098DC6FF064F
          85F6010E143E0000000800000001000000000000000000000000000000000000
          000000000000000000000000000B145E81BA1D8FC4FF32CFF7FF29CDF7FF21CB
          F6FF1AC8F6FF13C6F7FF0EC4F7FF0EC4F8FF0DC2F7FF0DC0F6FF0CC2F9FF0BA0
          D7FF064F85F30006082A00000005000000000000000000000000000000000000
          000000000000000000000000000F157CB1F337BAE3FF3CD4F6FF34D1F7FF2BCD
          F7FF23CBF6FF1BC9F6FF15C8F6FF0EC5F7FF0DBCEFFF0EBCF1FF0DC0F5FF0DC3
          F8FF098AC3FF065281E00000001607131B30164364AE0D293F6D000000000000
          00000000000000000001000000110E7FBCFE4DD2F2FF48D6F6FF3FD4F6FF35D2
          F6FF2CCFF7FF24CCF5FF1DCAF6FF15BDEDFF0EB4E8FF0DB8EBFF0DBCF0FF0EC3
          F8FF0DC4F8FF07609AFF215C83DA216291FE3071A0FF1E5B8BEF000000000000
          00000000000000000001061115290F8BC7FF5DDCF6FF53D9F6FF55D9F7FF5FDB
          F7FF68DDF8FF69DDF9FF5CD3F3FF39B3DEFF2AB5E1FF16B4E5FF0EC0F2FF0EC4
          F7FF0EC4F8FF0CAFE5FF175B91FC66A1C5FC4280ACFF29638EE5000000000000
          0000000000000000000107161A2D1198D2FF68DFF6FF78E2F8FF8BE6F8FF8EE6
          F9FF85E3F9FF7BE0F8FF52B4DAFF48AED7FF46B3DCFF3FBDE6FF29CDF7FF0FC6
          F6FF0EC6F7FF0EC4F7FF0871ACFF4685AAF0355E7BB103040608000000000000
          000000000000000000010000000E0C9FD9FF8FE7F9FFAAEDFAFFA4EBFAFF9BE9
          F9FF92E7FAFF66BFDFFF48A0CBFF49A6D0FF49ADD5FF5FD3F2FF5AD9F8FF30CF
          F7FF0FC6F6FF0EC6F7FF0CAADFFF0E5990F80000001500000002000000000000
          000000000000000000000000000B1FABDEFBA2E6F6FFB7F0FAFFAFEEFAFFA7ED
          FAFF89D5EBFF4291BFFF4597C4FF479EC9FF61C1E2FF73DFF8FF68DCF8FF5CDA
          F8FF2FCEF6FF0FC6F6FF0EC6F6FF075895FF03273A6A00000006000000000000
          000000000000000000000000000934A6CDE486D9F1FFC1F2FBFFBAF0FAFF82BE
          D7FF1A5585FF104C7AFF367BA7FF4FA0C9FF85E2F7FF7FE3F9FF77E0F9FF6CDE
          F8FF56D8F8FF25CDF6FF10C7F5FF0A83BAFF06517BC50000000B000000000000
          0000000000000000000000000005387F96A958C9EEFFCBF5FBFFC4BFABFFB074
          49FFA27656FF336B8FFF306D9AFF83D0E8FF94E8F9FF8CE5F9FF83E3F9FF7BE2
          F8FF71DFF9FF49D5F6FF16C9F5FF0FA6D8FF085A93F00000000E000000000000
          00000000000000000000000000170C171A5A1A6A81FE9B6D49FFC27D4BFFE39C
          69FFDB9D70FFBB9A81FF0D4E85FFA9EDFAFFA1EBFAFF98E9F9FF91E7F9FF87E5
          F9FF7FE2F8FF70DEF8FF30CFF5FF15BDEAFF075696FD0000000F000000000000
          00000000005A000000C6000000FF000000FF030303FF070707FF745641FFEFB7
          8FFFE3B28DFFD8A884FF6699B8FFB4F0FBFFACEEFAFFA4ECFAFF9CEAF9FF94E8
          F9FF8BE5F9FF82E4F8FF51D9F6FF1FCCF4FF075395FF0000000F000000030000
          00AB000000FF000000FF030303FF080808FF0D0D0DFF101010FF4B3E34FFDAA7
          83FFE1C4ACFFD2EDEEFF9FC9D4E7BEF2FAFFB7F0FBFFB0EFFAFFA8EDFAFFA0EB
          F9FF98E9F9FF8FE7F9FF76E1F7FF2DD1F4FF075B9DFF02010014000000750000
          00FF030303FF151515FF292929FF353535FF313131FF262626FF746B61FFE1F1
          EFFFD9F8FCFFD4F6FCFFC7F2FAFFA2E3F5FFBBF0FAFFBAF1FAFFB3F0FAFFACEE
          FAFFA4ECF9FF9BEAF9FF95E8FAFF45D0EFFF096BA8FE0000000C030303D80808
          08FF363636FF4E4E4EFF525252FF565656FF5A5A5AFF565656FA38AED2F2B0EA
          FAFFE0F9FDFFBEEEF9FF28B5E7FE2BADDCF612A5DDFF51BEE5FFA2E4F5FFB7F0
          FAFFAFEEFAFFA8EDFAFF9FEBF9FF4DC1E4FF1079AEEF000000090C0C0CFC3939
          39FF6D6D6DFF717171FF757575FF787878FF7C7C7CFF33333367080F111735BC
          E6F031C5F2FF25BAEAFA1D38404C000000070305060F35778FA323A5D9FA41B3
          DFFF89D6EEFFADEBF8FFABEDFAFF33A0D1FF1159769A00000005141414F07C7C
          7CFF909090FF939393FF969696FF767676C32121213600000000000000010000
          000423414B51060A0C1100000002000000000000000100000003000000072D62
          74882F9ECCEC1196D1FF1C98D1FF2C86ADD300000008000000011B1B1BCFACAC
          ACFFB0B0B0FF767676A81A1A1A24000000000000000000000000000000000000
          0000000000010000000000000000000000000000000000000000000000010000
          0002000000050000000713262E390000000500000001000000001A1A1A93C2C2
          C2FF7171718D0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000010000000000000000000000001111114BABAB
          ABDE030303030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000050000
          0012000000170000001700000017000000170000001800000018000000180000
          0018000000180000001800000018000000190000001900000019000000190000
          001900000019000000190000001A0000001A0000001400000006000000119487
          85FF948785FF948785FF948785FF948785FF948785FF948785FF948785FF9487
          85FF948785FF948785FF948785FF948785FF948785FF948785FF948785FF9487
          85FF948785FF948785FF948785FF948785FF948785FF00000013000000159487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000018000000149487
          85FFFFFFFFFF944B2EFF944B2EFF944B2EFF944B2EFF944B2EFF944B2EFF944B
          2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000017000000139487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000016000000129487
          85FFFFFFFFFF944B2EFF944B2EFF944B2EFF944B2EFF944B2EFF944B2EFF944B
          2EFF944B2EFF944B2EFF944B2EFF944B2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000015000000129487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF00000014000000119487
          85FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5
          D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5
          D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FF948785FF00000014000000109487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAD5D4FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAD5D4FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF000000130000000F9487
          85FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5
          D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5
          D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FF948785FF000000120000000E9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF000000110000000D9487
          85FFFFFFFFFF944B2EFF944B2EFF944B2EFF944B2EFF944B2EFF944B2EFF944B
          2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF000000100000000C9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF0000000F0000000C9487
          85FFFFFFFFFF944B2EFF944B2EFF944B2EFF944B2EFF944B2EFF944B2EFF944B
          2EFF944B2EFF944B2EFF944B2EFF944B2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF0000000E0000000B9487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF0000000D0000000A9487
          85FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5
          D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5
          D4FFDAD5D4FFDAD5D4FFDAD5D4FFDAD5D4FF948785FF0000000D000000099487
          85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAD5D4FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAD5D4FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948785FF0000000C000000095246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF0000000B000000085246
          44FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FFDED9D9FFDED9
          D9FFDED9D9FFDED9D9FFDED9D9FFDED9D9FF524644FF0000000B000000075246
          44FFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FFE0DCDCFFE0DC
          DCFFE0DCDCFFE0DCDCFFE0DCDCFFE0DCDCFF524644FF0000000A000000065246
          44FFE6E3E3FFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFFE2DFDFFF524644FFE2DFDFFFE2DF
          DFFFE2DFDFFFE2DFDFFFE2DFDFFFE6E3E3FF524644FF00000009000000064A3F
          3DE9C9C4C3FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF524644FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FFF2F0F0FF524644FFF2F0F0FFF2F0
          F0FFF2F0F0FFF2F0F0FFF2F0F0FFC9C4C3FF4A3F3DEA00000008000000041411
          114A776D6CFF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF776D6CFF1411114E00000006000000010000
          0004000000050000000500000005000000050000000500000005000000050000
          0005000000050000000500000005000000060000000600000006000000060000
          0006000000060000000600000006000000060000000500000001}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0001000000020000000600000007000000080000000800000008000000080000
          0008000000080000000800000008000000080000000800000008000000080000
          0009000000070000000300000001000000000000000000000000000000000000
          00020000000C0000001D000000270000002A0000002A0000002B0000002B0000
          002C0000002C0000002C0000002D0000002D0000002E0000002E0000002F0000
          002D000000220000000E00000003000000000000000000000000000000000000
          00050000001B524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF0000002100000006000000000000000000000000000000000000
          000600000023524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000002A00000008000000000000000000000000000000000000
          000600000023524644FFFFFEFEFFFFFFFFFFFCFCFCFFF4F4F4FFF1F1F1FFF1F1
          F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1
          F1FF524644FF0000002A00000007000000000000000000000000000000000000
          000600000021524644FFFEFDFDFFFFFEFEFFF4F4F4FFD8D8D8FFCDCDCDFFCDCD
          CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
          CDFF524644FF0000002900000007000000000000000000000000000000000000
          00050000001F524644FFFEFCFBFFFEFDFDFFF1F0F0FF8E4821FF8D4820FF8C47
          20FF8B461FFF8A451EFF89441DFF88431DFF87431CFF87421BFF86411AFF8540
          1AFF844019FF833F18FF823E18FF813E17FF813D17FF00000000000000000000
          00050000001D524644FFFDFAF9FFFEFCFBFFF0EFEFFF944D25FFFFFFFFFF914B
          23FFFFFFFFFF8F4922FF8E4821FFFFFFFFFF8C4720FF8B461FFFFFFFFFFF8944
          1DFFFFFFFFFF87431CFFFFFFFFFFFFFFFFFF85401AFF00000000000000000000
          00050000001B524644FFFCF8F8FFFDFAF9FFF0EEEDFF995129FFFFFFFFFF974F
          27FFFFFFFFFF954E26FF944D25FFFFFFFFFF914B23FF904A23FFFFFFFFFF8E48
          21FFFFFFFFFF8C4720FFFFFFFFFF8A451EFF89441DFF00000000000000000000
          000400000019524644FFFCF7F6FFFCF8F8FFEFECEBFF9D552DFFFFFFFFFFFFFF
          FFFFFFFFFFFF9A522AFF995129FFFFFFFFFF974F27FF964E27FFFFFFFFFFDDC7
          BBFFFFFFFFFF914B23FFFFFFFFFF8F4922FF8E4821FF00000000000000000000
          000400000017524644FFFBF5F4FFFCF6F5FFEEEAEAFFA25830FFFFFFFFFFA057
          2FFFFFFFFFFF9E562DFF9D552DFFFFFFFFFF9C532BFF9B532AFFFFFFFFFFFFFF
          FFFFFFFFFFFF974F27FFFFFFFFFF954E26FF944D25FF00000000000000000000
          000400000015524644FFFAF2F1FFFBF4F3FFF1EBEAFFA55B32FFFFFFFFFFA45A
          32FFFFFFFFFFA25930FFFFFFFFFFFFFFFFFFFFFFFFFF9F562EFFFFFFFFFFC8A0
          89FFFFFFFFFF9C532BFFFFFFFFFF9A522AFF995129FF00000000000000000000
          000300000014524644FFF8EFEDFFFAF2F1FFF8F1F0FFA75D34FFA75D34FFA65D
          34FFA65C33FFA55C33FFA55B32FFA45B32FFA45A32FFA35A31FFA25930FFA258
          30FFA1582FFFA0572FFF9F562EFF9E562DFF9D552DFF00000000000000000000
          000300000012524644FFF3E9E7FFF7EEEDFFFAF2F1FFFBF4F3FFFBF6F5FFFCF8
          F7FFFDFAF9FFFDFBFBFFFEFCFCFFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000001900000004000000000000000000000000000000000000
          000300000010524644FFEEE2E0FFF2E8E6FFF7EEECFFFAF2F1FFFBF4F3FFFBF6
          F5FFFCF8F7FFFDF9F9FFFDFBFBFFFEFCFCFFFEFEFDFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000001800000004000000000000000000000000000000000000
          00020000000F524644FFE4D7D4FFEDE1DFFFF2E7E5FFF6EDEBFFF9F2F0FFFBF4
          F3FFFBF6F5FFFCF8F7FFFDF9F9FFFDFBFAFFFEFCFCFFFEFEFDFFFFFFFFFFFFFF
          FFFF524644FF0000001600000004000000000000000000000000000000000000
          00020000000D524644FFD6C8C5FFE2D4D2FFECE0DEFFF1E6E4FFF5ECEAFFF8F1
          EFFFFBF4F3FFFBF6F5FFFCF7F7FFFDF9F9FFFDFBFAFFFEFCFCFFFEFEFDFFFFFF
          FFFF524644FF0000001400000004000000000000000000000000000000000000
          00020000000A524644FF524644FF524644FF524644FF524644FFF0E5E3FFF4EA
          E9FFF8F0EEFFFBF4F3FFFBF6F5FFFCF7F7FFFDF9F8FFFDFBFAFFFEFCFCFFFEFD
          FDFF524644FF0000001200000003000000000000000000000000000000000000
          00010000000628232286524644FF524644FF524644FF524644FFE9DDDBFFEFE4
          E2FFF3EAE8FFF7EFEEFFFAF4F2FFFBF6F4FFFCF7F7FFFDF9F8FFFDFBFAFFFEFC
          FCFF524644FF0000001000000003000000000000000000000000000000000000
          0000000000020000000728232286524644FF524644FF524644FFDCCECCFFE6DA
          D8FFEEE3E1FFF2E9E7FFF6EEEDFFFAF3F1FFFBF6F4FFFCF7F6FFFDF9F8FFFDFB
          FAFF524644FF0000000F00000003000000000000000000000000000000000000
          000000000000000000020000000629222285524644FF524644FFCDBFBCFFDACC
          CAFFE5D9D7FFEDE2E0FFF2E8E6FFF6EDECFFF9F2F1FFFBF6F4FFFCF7F6FFFDF9
          F8FF524644FF0000000D00000002000000000000000000000000000000000000
          00000000000000000000000000020000000528232284524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF0000000800000002000000000000000000000000000000000000
          0000000000000000000000000000000000010000000300000005000000060000
          0007000000070000000700000008000000080000000900000009000000090000
          0009000000070000000300000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0001000000020000000600000007000000080000000800000008000000080000
          0008000000080000000800000008000000080000000800000008000000080000
          0009000000070000000300000001000000000000000000000000000000000000
          00020000000C0000001D000000270000002A0000002A0000002B0000002B0000
          002C0000002C0000002C0000002D0000002D0000002E0000002E0000002F0000
          002D000000220000000E00000003000000000000000000000000000000000000
          00050000001B524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF0000002100000006000000000000000000000000000000000000
          000600000023524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000002A00000008000000000000000000000000000000000000
          000600000023524644FFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCFCFCFFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1
          F1FF524644FF0000002A00000007000000000000000000000000000000000000
          000600000021524644FFFEFDFDFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF4F4F4FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
          CDFF524644FF0000002900000007000000000000000000000000000000000000
          00050000001F524644FFFEFCFBFFFEFDFDFFFFFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1F1F1FF0C14AAFF0B14A9FF0B13A8FF0B13A7FF0A13A5FF0A12A4FF0A12
          A3FF0912A2FF0911A1FF0911A0FF08119FFF08109EFF00000000000000000000
          00050000001D524644FFFDFAF9FFFEFCFBFFFEFDFDFFFFFEFEFFFFFFFFFFFFFF
          FFFFF1F1F1FF0C15ADFFFFFFFFFF0C14ABFFFFFFFFFF0B14A9FFFFFFFFFF0B13
          A7FFFFFFFFFF0A12A4FFFFFFFFFFFFFFFFFF0911A1FF00000000000000000000
          00050000001B524644FFFCF8F8FFFDFAF9FFFEFCFBFFFEFDFDFFFFFEFEFFFFFF
          FFFFF1F1F1FF0D16B1FFFFFFFFFF777CD2FFFFFFFFFF0C15ACFFFFFFFFFF0C14
          AAFFFFFFFFFF0B13A8FFFFFFFFFF0A13A5FF0A12A4FF00000000000000000000
          000400000019524644FFFCF7F6FFFCF8F8FFFDFAF9FFFEFBFBFFFEFDFDFFFFFE
          FEFFF1F1F1FF0E17B4FF4A51C6FFFFFFFFFF4A50C5FF0D16B0FFFFFFFFFFB3B6
          E5FFFFFFFFFF0C14ABFFFFFFFFFF0B14A9FF0B13A8FF00000000000000000000
          000400000017524644FFFBF5F4FFFCF6F5FFFCF8F8FFFDFAF9FFFEFBFBFFFEFD
          FDFFF1F0F0FF0F18B8FFFFFFFFFF787DD6FFFFFFFFFF0E17B3FFFFFFFFFFFFFF
          FFFFFFFFFFFF0D15AFFFFFFFFFFF0C15ACFF0C14ABFF00000000000000000000
          000400000015524644FFFAF2F1FFFBF4F3FFFCF6F5FFFCF8F7FFFDFAF9FFFEFB
          FBFFF3F2F2FF1019BBFFFFFFFFFF1018B9FFFFFFFFFF0F18B7FFFFFFFFFF787D
          D5FFFFFFFFFF0E16B2FFFFFFFFFF0D16B0FF0D15AFFF00000000000000000000
          000300000014524644FFF8EFEDFFFAF2F1FFFBF4F3FFFCF6F5FFFCF8F7FFFDFA
          F9FFFAF8F8FF111ABEFF111ABDFF1119BCFF1019BBFF1019BAFF1018B9FF0F18
          B8FF0F18B7FF0F17B6FF0E17B4FF0E17B3FF0E16B2FF00000000000000000000
          000300000012524644FFF3E9E7FFF7EEEDFFFAF2F1FFFBF4F3FFFBF6F5FFFCF8
          F7FFFDFAF9FFFDFBFBFFFEFCFCFFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000001900000004000000000000000000000000000000000000
          000300000010524644FFEEE2E0FFF2E8E6FFF7EEECFFFAF2F1FFFBF4F3FFFBF6
          F5FFFCF8F7FFFDF9F9FFFDFBFBFFFEFCFCFFFEFEFDFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000001800000004000000000000000000000000000000000000
          00020000000F524644FFE4D7D4FFEDE1DFFFF2E7E5FFF6EDEBFFF9F2F0FFFBF4
          F3FFFBF6F5FFFCF8F7FFFDF9F9FFFDFBFAFFFEFCFCFFFEFEFDFFFFFFFFFFFFFF
          FFFF524644FF0000001600000004000000000000000000000000000000000000
          00020000000D524644FFD6C8C5FFE2D4D2FFECE0DEFFF1E6E4FFF5ECEAFFF8F1
          EFFFFBF4F3FFFBF6F5FFFCF7F7FFFDF9F9FFFDFBFAFFFEFCFCFFFEFEFDFFFFFF
          FFFF524644FF0000001400000004000000000000000000000000000000000000
          00020000000A524644FF524644FF524644FF524644FF524644FFF0E5E3FFF4EA
          E9FFF8F0EEFFFBF4F3FFFBF6F5FFFCF7F7FFFDF9F8FFFDFBFAFFFEFCFCFFFEFD
          FDFF524644FF0000001200000003000000000000000000000000000000000000
          00010000000628232286524644FF524644FF524644FF524644FFE9DDDBFFEFE4
          E2FFF3EAE8FFF7EFEEFFFAF4F2FFFBF6F4FFFCF7F7FFFDF9F8FFFDFBFAFFFEFC
          FCFF524644FF0000001000000003000000000000000000000000000000000000
          0000000000020000000728232286524644FF524644FF524644FFDCCECCFFE6DA
          D8FFEEE3E1FFF2E9E7FFF6EEEDFFFAF3F1FFFBF6F4FFFCF7F6FFFDF9F8FFFDFB
          FAFF524644FF0000000F00000003000000000000000000000000000000000000
          000000000000000000020000000629222285524644FF524644FFCDBFBCFFDACC
          CAFFE5D9D7FFEDE2E0FFF2E8E6FFF6EDECFFF9F2F1FFFBF6F4FFFCF7F6FFFDF9
          F8FF524644FF0000000D00000002000000000000000000000000000000000000
          00000000000000000000000000020000000528232284524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF0000000800000002000000000000000000000000000000000000
          0000000000000000000000000000000000010000000300000005000000060000
          0007000000070000000700000008000000080000000900000009000000090000
          0009000000070000000300000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0001000000020000000600000007000000080000000800000008000000080000
          0008000000080000000800000008000000080000000800000008000000080000
          0009000000070000000300000001000000000000000000000000000000000000
          00020000000C0000001D000000270000002A0000002A0000002B0000002B0000
          002C0000002C0000002C0000002D0000002D0000002E0000002E0000002F0000
          002D000000220000000E00000003000000000000000000000000000000000000
          00050000001B524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF0000002100000006000000000000000000000000000000000000
          000600000023524644FFFFFFFFFFFFFFFFFFF3F3F3FFD5D5D5FFC9C9C9FFC9C9
          C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9
          C9FF524644FF0000002A00000008000000000000000000000000000000000000
          000600000023524644FFFFFEFEFFFFFFFFFFF1F1F1FF086821FF086821FF0868
          21FF086821FF086821FF086821FF086821FF086821FF086821FF086821FF0868
          21FF086821FF086821FF086821FF086821FF086821FF086821FF000000000000
          000600000021524644FFFEFDFDFFFFFEFEFFF1F1F1FF086821FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF086821FF000000000000
          00050000001F524644FFFEFCFBFFFEFDFDFFF1F0F0FF086821FFFFFFFFFF6BB4
          7FFF128630FF11842FFF10822DFF0F802CFF0E7E2BFF0D7D2AFF0C7728FF2B95
          47FF0A7827FF66AA78FFFFFFFFFFFFFFFFFFFFFFFFFF086821FF000000000000
          00050000001D524644FFFDFAF9FFFEFCFBFFF0EFEFFF086821FFFFFFFFFFFFFF
          FFFF6CB67FFF138831FF128630FF11842FFF10822EFF0F762AFF4BB266FF0D7D
          2AFF0C7B29FF0B7A28FF66AB78FFFFFFFFFFFFFFFFFF086821FF000000000000
          00050000001B524644FFFCF8F8FFFDFAF9FFF0EEEDFF086821FFFFFFFFFFFFFF
          FFFFFFFFFFFF6DB780FF148A33FF138831FF11702AFF6DCF86FF10832EFF0F81
          2DFF0E7F2CFF0D7D2AFF0C7C29FF67AC79FFFFFFFFFF086821FF000000000000
          000400000019524644FFFCF7F6FFFCF8F8FFEFECEBFF086821FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF6EB981FF126A29FF79D992FF138932FF128731FF6AA2
          79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF086821FF000000000000
          000400000017524644FFFBF5F4FFFCF6F5FFEEEAEAFF086821FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF6CA57BFF68CE83FF168E35FF158D34FF116928FF6CB5
          7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF086821FF000000000000
          000400000015524644FFFAF2F1FFFBF4F3FFEFE9E9FF086821FFFFFFFFFFFFFF
          FFFFFFFFFFFF6EAB7DFF55C171FF199439FF189238FF13722CFF168F36FF158D
          35FF6CB780FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF086821FF000000000000
          000300000014524644FFF8EFEDFFFAF2F1FFF1EAE9FF086821FFFFFFFFFFFFFF
          FFFF6FB281FF41B55FFF1C983CFF1B973BFF6EAE7FFF70BC84FF189338FF1891
          37FF178F36FF6EB881FFFFFFFFFFFFFFFFFFFFFFFFFF086821FF000000000000
          000300000012524644FFF3E9E7FFF7EEEDFFF6EEEDFF086821FFFFFFFFFF71B9
          84FF2FA94FFF1D9C3EFF1D9B3EFF70B582FFFFFFFFFFFFFFFFFF70BE84FF1994
          39FF199338FF189137FF6EBA82FFFFFFFFFFFFFFFFFF086821FF000000000000
          000300000010524644FFEEE2E0FFF2E8E6FFF6EDEBFF086821FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF086821FF000000000000
          00020000000F524644FFE4D7D4FFEDE1DFFFF2E7E5FF086821FF086821FF0868
          21FF086821FF086821FF086821FF086821FF086821FF086821FF086821FF0868
          21FF086821FF086821FF086821FF086821FF086821FF086821FF000000000000
          00020000000D524644FFD6C8C5FFE2D4D2FFECE0DEFFF1E6E4FFF5ECEAFFF8F1
          EFFFFBF4F3FFFBF6F5FFFCF7F7FFFDF9F9FFFDFBFAFFFEFCFCFFFEFEFDFFFFFF
          FFFF524644FF0000001400000004000000000000000000000000000000000000
          00020000000A524644FF524644FF524644FF524644FF524644FFF0E5E3FFF4EA
          E9FFF8F0EEFFFBF4F3FFFBF6F5FFFCF7F7FFFDF9F8FFFDFBFAFFFEFCFCFFFEFD
          FDFF524644FF0000001200000003000000000000000000000000000000000000
          00010000000628232286524644FF524644FF524644FF524644FFE9DDDBFFEFE4
          E2FFF3EAE8FFF7EFEEFFFAF4F2FFFBF6F4FFFCF7F7FFFDF9F8FFFDFBFAFFFEFC
          FCFF524644FF0000001000000003000000000000000000000000000000000000
          0000000000020000000728232286524644FF524644FF524644FFDCCECCFFE6DA
          D8FFEEE3E1FFF2E9E7FFF6EEEDFFFAF3F1FFFBF6F4FFFCF7F6FFFDF9F8FFFDFB
          FAFF524644FF0000000F00000003000000000000000000000000000000000000
          000000000000000000020000000629222285524644FF524644FFCDBFBCFFDACC
          CAFFE5D9D7FFEDE2E0FFF2E8E6FFF6EDECFFF9F2F1FFFBF6F4FFFCF7F6FFFDF9
          F8FF524644FF0000000D00000002000000000000000000000000000000000000
          00000000000000000000000000020000000528232284524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF0000000800000002000000000000000000000000000000000000
          0000000000000000000000000000000000010000000300000005000000060000
          0007000000070000000700000008000000080000000900000009000000090000
          0009000000070000000300000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0001000000020000000600000007000000080000000800000008000000080000
          0008000000080000000800000008000000080000000800000008000000080000
          0009000000070000000300000001000000000000000000000000000000000000
          00020000000C0000001D000000270000002A0000002A0000002B0000002B0000
          002C0000002C0000002C0000002D0000002D0000002E0000002E0000002F0000
          002D000000220000000E00000003000000000000000000000000000000000000
          00050000001B524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF0000002100000006000000000000000000000000000000000000
          000600000023524644FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000002A00000008000000000000000000000000000000000000
          000600000023524644FFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFA
          FAFFF2F2F2FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1
          F1FF524644FF0000002A00000007000000000000000000000000000000000000
          000600000021524644FFFEFDFDFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFEEEE
          EEFFD2D2D2FFCCCCCCFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
          CDFF524644FF0000002900000007000000000000000000000000000000000000
          00050000001F524644FFFEFCFBFFFEFDFDFFFFFEFEFFFFFFFFFFFFFFFFFFEAEA
          EAFF282828FF272727FF252525FF242424FF232323FF222222FF212121FF2020
          20FF1F1F1FFF1E1E1EFF1E1E1EFF1C1C1CFF1C1C1CFF00000000000000000000
          00050000001D524644FFFDFAF9FFFEFCFBFFFEFDFDFFFFFEFEFFFFFFFFFFEAEA
          EAFF2E2E2EFF2D2D2DFFFFFFFFFF2A2A2AFF292929FFFFFFFFFF272727FFFFFF
          FFFF252525FF242424FFFFFFFFFF222222FF212121FF00000000000000000000
          00050000001B524644FFFCF8F8FFFDFAF9FFFEFCFBFFFEFDFDFFFFFEFEFFEAEA
          EAFF353535FF343434FFFFFFFFFF313131FF303030FFFFFFFFFF8A8A8AFFFFFF
          FFFF2B2B2BFF2A2A2AFFFFFFFFFF282828FF272727FF00000000000000000000
          000400000019524644FFFCF7F6FFFCF8F8FFFDFAF9FFFEFBFBFFFEFDFDFFEAE9
          E9FF3C3C3CFF3C3C3CFFFFFFFFFF393939FF383838FF686868FFFFFFFFFF6767
          67FF323232FF313131FFFFFFFFFF2E2E2EFF2D2D2DFF00000000000000000000
          000400000017524644FFFBF5F4FFFCF6F5FFFCF8F8FFFDFAF9FFFEFBFBFFE9E8
          E8FF444444FF434343FFFFFFFFFF404040FF3F3F3FFFFFFFFFFF929292FFFFFF
          FFFF3A3A3AFF383838FFFFFFFFFF363636FF343434FF00000000000000000000
          000400000015524644FFFAF2F1FFFBF4F3FFFCF6F5FFFCF8F7FFFDFAF9FFEDEA
          EAFF4C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFF464646FFFFFFFFFF434343FFFFFF
          FFFF414141FFFFFFFFFFFFFFFFFFFFFFFFFF3C3C3CFF00000000000000000000
          000300000014524644FFF8EFEDFFFAF2F1FFFBF4F3FFFCF6F5FFFCF8F7FFF8F5
          F4FF525252FF515151FF505050FF4F4F4FFF4E4E4EFF4C4C4CFF4B4B4BFF4A4A
          4AFF494949FF474747FF464646FF444444FF434343FF00000000000000000000
          000300000012524644FFF3E9E7FFF7EEEDFFFAF2F1FFFBF4F3FFFBF6F5FFFCF8
          F7FFFDFAF9FFFDFBFBFFFEFCFCFFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000001900000004000000000000000000000000000000000000
          000300000010524644FFEEE2E0FFF2E8E6FFF7EEECFFFAF2F1FFFBF4F3FFFBF6
          F5FFFCF8F7FFFDF9F9FFFDFBFBFFFEFCFCFFFEFEFDFFFFFFFFFFFFFFFFFFFFFF
          FFFF524644FF0000001800000004000000000000000000000000000000000000
          00020000000F524644FFE4D7D4FFEDE1DFFFF2E7E5FFF6EDEBFFF9F2F0FFFBF4
          F3FFFBF6F5FFFCF8F7FFFDF9F9FFFDFBFAFFFEFCFCFFFEFEFDFFFFFFFFFFFFFF
          FFFF524644FF0000001600000004000000000000000000000000000000000000
          00020000000D524644FFD6C8C5FFE2D4D2FFECE0DEFFF1E6E4FFF5ECEAFFF8F1
          EFFFFBF4F3FFFBF6F5FFFCF7F7FFFDF9F9FFFDFBFAFFFEFCFCFFFEFEFDFFFFFF
          FFFF524644FF0000001400000004000000000000000000000000000000000000
          00020000000A524644FF524644FF524644FF524644FF524644FFF0E5E3FFF4EA
          E9FFF8F0EEFFFBF4F3FFFBF6F5FFFCF7F7FFFDF9F8FFFDFBFAFFFEFCFCFFFEFD
          FDFF524644FF0000001200000003000000000000000000000000000000000000
          00010000000628232286524644FF524644FF524644FF524644FFE9DDDBFFEFE4
          E2FFF3EAE8FFF7EFEEFFFAF4F2FFFBF6F4FFFCF7F7FFFDF9F8FFFDFBFAFFFEFC
          FCFF524644FF0000001000000003000000000000000000000000000000000000
          0000000000020000000728232286524644FF524644FF524644FFDCCECCFFE6DA
          D8FFEEE3E1FFF2E9E7FFF6EEEDFFFAF3F1FFFBF6F4FFFCF7F6FFFDF9F8FFFDFB
          FAFF524644FF0000000F00000003000000000000000000000000000000000000
          000000000000000000020000000629222285524644FF524644FFCDBFBCFFDACC
          CAFFE5D9D7FFEDE2E0FFF2E8E6FFF6EDECFFF9F2F1FFFBF6F4FFFCF7F6FFFDF9
          F8FF524644FF0000000D00000002000000000000000000000000000000000000
          00000000000000000000000000020000000528232284524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF0000000800000002000000000000000000000000000000000000
          0000000000000000000000000000000000010000000300000005000000060000
          0007000000070000000700000008000000080000000900000009000000090000
          0009000000070000000300000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000010000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000030000000500000006000000070000000700000007000000070000
          0007000000070000000700000007000000070000000700000007000000080000
          0008000000080000000700000006000000030000000100000000000000010000
          0005000000100000001C00000023000000250000002600000026000000270000
          0027000000270000002700000028000000280000002900000029000000290000
          002A0000002A0000002800000021000000130000000600000001000000020000
          000F15131365413D3BED474340FF46423FFF45413EFF44403DFF433F3CFF433F
          3CFF423E3BFF413D3AFF413D3AFF403C39FF403C39FF403C39FF403C39FF403C
          39FF3F3B38FF3F3B38FF393532EE1211106C0000001200000003000000040000
          0018464341EB9E9C9BFFBCBBBAFFBAB8B7FFB8B6B5FFB6B5B4FFB5B2B1FFB2B0
          AFFFB0AEACFFAFACABFFACAAA7FFAAA7A6FFA7A6A3FFA5A2A1FFA3A19EFFA19E
          9CFF9E9C9AFF9D9998FF817D7BFF393633EC0000001E00000005000000050000
          001C55524FFFC7C6C5FFC5C4C3FFD9D8D7FFC2C0BFFFD5D5D4FFBEBCBBFFBCBB
          BAFFBAB8B7FFB7B6B5FFB6B4B2FFB4B2B0FFB2B0AFFFB0AEACFFAEABAAFFABA8
          A7FFC6C6C4FFA7A5A3FFA5A29FFF403C39FF0000002300000006000000050000
          001B5D5A58FFCECDCDFFCCCCCBFF3F3B38FFC9C8C8FF3F3B38FFC6C5C4FFC5C4
          C3FFC3C2C0FFC2BFBEFFBFBEBDFFBDBCBBFFBBBAB8FFBAB7B6FFB7B6B5FFB5B4
          B2FF3F3B38FFB1B0AEFFAFACABFF423E3BFF0000002300000006000000040000
          0019666361FFD6D6D5FFD5D4D4FFD4D3D3FFD2D1D0FFD0CFCFFFCECDCCFFCCCC
          CBFFCBCAC9FFC9C8C8FFC7C6C5FFC6C5C4FFC4C3C2FFC3C0C0FFC0BFBEFFBFBD
          BCFFBDBCBBFFBBBAB7FFB8B7B6FF44403DFF0000002100000006000000040000
          00176F6C6BFFE1E0E0FFDFDEDEFF676462FF65625FFF625E5CFF5F5C5AFF5C59
          57FF5A5754FF575452FF555250FF54504DFF514D4BFF4F4B49FF4D4A47FF4C48
          46FF4A4744FFC4C3C2FFC2C0BFFF464240FF0000001F00000005000000040000
          0015777472FFECEBEBFFEAEAEAFF706D6AFFD7D6D6FFD7D6D6FFD6D5D5FFD6D5
          D5FFD5D4D4FFD4D3D3FFD3D2D2FFD2D2D2FFD2D0D0FFD1D0D0FFD0CFCFFFD0CE
          CEFF504C49FFD0D0CFFFCECDCDFF4B4744FF0000001C00000005000000030000
          00127E7B79FFF3F3F3FFF2F2F2FF777472FFE1E1E1FFE0E0E0FFE0DFDFFFDFDF
          DFFFDEDEDEFFDEDDDDFFDDDCDCFFDDDCDCFFDCDBDBFFDBDADAFFDBD9D9FFDAD9
          D9FF565351FFDCDBDAFFD9D9D9FF504C4AFF0000001900000005000000020000
          000D787575EADADAD9FFF8F8F8FF7E7B79FFEAE9E9FF797674FF777472FF7472
          70FF726F6DFF706D6BFF6E6B68FF6B6866FF696563FF666360FF63605DFFE3E2
          E2FF5E5A58FFE7E6E6FFC1C0BFFF4E4C49EB0000001200000003000000010000
          00072222224D6B6A68CF868482FF848280FFD4D4D3FF807D7BFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B6866FFCAC9
          C8FF666260FF64605EFF4C4948D2171716520000000900000001000000000000
          0002000000060000000B00000012666463C4888584FF868482FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF726F6DFF706C
          6AFF514E4DC6000000180000000F000000080000000300000000000000000000
          00000000000100000002000000050000000A00000015524644FFFFFFFFFFC3BE
          BEFFC3BEBEFFC3BEBEFFC3BEBEFFC3BEBEFFC3BEBEFFFFFFFFFF524644FF0000
          001B0000000D0000000600000003000000010000000000000000000000000000
          0000000000000000000000000001000000030000000D524644FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF524644FF0000
          0010000000040000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000020000000A524644FFFFFFFFFFC3BE
          BEFFC3BEBEFFC3BEBEFFC3BEBEFFC3BEBEFFC3BEBEFFFFFFFFFF524644FF0000
          000D000000020000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000008524644FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF524644FF0000
          000B000000020000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000007524644FFFFFFFFFFC3BE
          BEFFC3BEBEFFC3BEBEFFC3BEBEFFC3BEBEFFC3BEBEFFFFFFFFFF524644FF0000
          0009000000020000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000005524644FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF524644FF0000
          0008000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000004524644FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF524644FF0000
          0006000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000002524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF0000
          0004000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000020000
          0002000000020000000300000003000000030000000300000003000000020000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0001000000030000000500000006000000070000000700000007000000070000
          0007000000070000000700000007000000070000000700000007000000080000
          0008000000080000000700000006000000030000000100000000000000010000
          0005000000100000001C00000023000000250000002600000026000000270000
          0027000000270000002700000028000000280000002900000029000000290000
          002A0000002A0000002800000021000000130000000600000001000000020000
          000F15131365413D3BED474340FF46423FFF45413EFF44403DFF433F3CFF433F
          3CFF423E3BFF413D3AFF413D3AFF403C39FF403C39FF403C39FF403C39FF403C
          39FF3F3B38FF3F3B38FF393532EE1211106C0000001200000003000000040000
          0018464341EB9E9C9BFFBCBBBAFFBAB8B7FFB8B6B5FFB6B5B4FFB5B2B1FFB2B0
          AFFFB0AEACFFAFACABFFACAAA7FFAAA7A6FFA7A6A3FFA5A2A1FFA3A19EFFA19E
          9CFF9E9C9AFF9D9998FF817D7BFF393633EC0000001E00000005000000050000
          001C55524FFFC7C6C5FFC5C4C3FFD9D8D7FFC2C0BFFFD5D5D4FFBEBCBBFFBCBB
          BAFFBAB8B7FFB7B6B5FFB6B4B2FFB4B2B0FFB2B0AFFFB0AEACFFAEABAAFFABA8
          A7FFC6C6C4FFA7A5A3FFA5A29FFF403C39FF0000002300000006000000050000
          001B5D5A58FFCECDCDFFCCCCCBFF3F3B38FFC9C8C8FF3F3B38FFC6C5C4FFC5C4
          C3FFC3C2C0FFC2BFBEFFBFBEBDFFBDBCBBFFBBBAB8FFBAB7B6FFB7B6B5FFB5B4
          B2FF3F3B38FFB1B0AEFFAFACABFF423E3BFF0000002300000006000000040000
          0019666361FFD6D6D5FFD5D4D4FFD4D3D3FFD2D1D0FFD0CFCFFFCECDCCFFCCCC
          CBFFCBCAC9FFC9C8C8FFC7C6C5FFC6C5C4FFC4C3C2FFC3C0C0FFC0BFBEFFBFBD
          BCFFBDBCBBFFBBBAB7FFB8B7B6FF44403DFF0000002100000006000000040000
          00176F6C6BFFE1E0E0FFDFDEDEFF676462FF65625FFF625E5CFF5F5C5AFF5C59
          57FF5A5754FF575452FF555250FF54504DFF514D4BFF4F4B49FF4D4A47FF4C48
          46FF4A4744FFC4C3C2FFC2C0BFFF464240FF0000001F00000005000000040000
          0015777472FFECEBEBFFEAEAEAFF706D6AFFD7D6D6FFD7D6D6FFD6D5D5FFD6D5
          D5FFD5D4D4FFD4D3D3FFD3D2D2FFD2D2D2FFD2D0D0FFD1D0D0FFD0CFCFFFD0CE
          CEFF504C49FFD0D0CFFFCECDCDFF4B4744FF0000001C00000005000000030000
          00127E7B79FFF3F3F3FFF2F2F2FF777472FFE1E1E1FFE0E0E0FFE0DFDFFFDFDF
          DFFFDEDEDEFFDEDDDDFFDDDCDCFFDDDCDCFFDCDBDBFFDBDADAFFDBD9D9FFDAD9
          D9FF565351FFDCDBDAFFD9D9D9FF504C4AFF0000001900000005000000020000
          000D787575EADADAD9FFF8F8F8FF7E7B79FFEAE9E9FF797674FF777472FF7472
          70FF726F6DFF706D6BFF6E6B68FF6B6866FF696563FF666360FF63605DFFE3E2
          E2FF5E5A58FFE7E6E6FFC1C0BFFF4E4C49EB0000001200000003000000010000
          00072222224D6B6A68CF868482FF848280FFD4D4D3FF807D7BFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B6866FFCAC9
          C8FF666260FF64605EFF4C4948D2171716520000000900000001000000000000
          0002000000060000000B00000012666463C4888584FF868482FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EBE6FFCAB09CFFA77C5DFF834B23FF814A
          22FF734828EF381E0B7D0E08032A000000080000000300000000000000000000
          00000000000100000002000000050000000A00000015524644FFFFFFFFFFC3BE
          BEFFC3BEBEFFC3BEBEFFB7A59BFF9D7152FF8A4D20FF884B1FFF864A1EFF8548
          1DFF83481CFF82461BFF593112B11D0F063A0000000000000000000000000000
          0000000000000000000000000001000000030000000D524644FFFFFFFFFFFFFF
          FFFFFFFFFFFFF3ECE7FFB48969FF905224FF8E5023FFAA7D5CFFF7F3F0FFCFB7
          A5FF86491DFF84481CFF83471CFF5A3013B00F08031D00000000000000000000
          0000000000000000000000000000000000020000000A524644FFFFFFFFFFC3BE
          BEFFC3BEBEFFB2937EFF98582AFF955628FF935326FFC4A28AFFFFFFFFFFF7F3
          F0FF894C20FF874A1EFF86491DFF84481CFF3A1F0C7000000000000000000000
          00000000000000000000000000000000000100000008524644FFFFFFFFFFFFFF
          FFFFFFFFFFFFBC8D6AFF9E5D2DFF9B5A2BFF985829FF955627FFC5A38BFFAD7F
          5EFF8D4F22FF8B4D20FF894C1FFF874A1EFF5F3415B700000000000000000000
          00000000000000000000000000000000000100000007524644FFFFFFFFFFC3BE
          BEFFC3BEBEFFAA6C3FFFA56232FFA15F2FFF9E5C2DFF9A5A2BFFF8F4F1FFC6A4
          8CFF915325FF8F5123FF8C4F21FF8A4D20FF7D451CEA00000000000000000000
          00000000000000000000000000000000000100000005524644FFFFFFFFFFFFFF
          FFFFFFFFFFFFB67649FFAB6836FFA76534FFA46131FFA05F2FFFD8BDABFFF1E9
          E3FFC09A7EFF935426FF905224FF8E5023FF80481EEA00000000000000000000
          00000000000000000000000000000000000100000004524644FFFFFFFFFFFFFF
          FFFFFFFFFFFFCB9974FFB26D3BFFAE6A38FFB07142FFF3EAE4FFB58159FFFFFF
          FFFFFFFFFFFFCFB29CFF955628FF935426FF673A1AB700000000000000000000
          00000000000000000000000000000000000000000002524644FF524644FF5246
          44FF524644FF815C44FFBA7340FFB5703DFFB16D3AFFEFE1D7FFE2CCBCFFEDE0
          D6FFFFFFFFFFF9F4F1FF9B5B2BFF98582AFF4125117000000000000000000000
          0000000000000000000000000000000000000000000000000001000000020000
          000200000002160E0820855430B1BC7642FFB8723FFFBA794AFFDFC4B0FFF9F5
          F2FFF9F5F2FFC9A184FFA15F30FF6C3F1FB0120A051D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000002D1C1139875631B0C07845FFBC7541FFB7723EFFB46E
          3CFFB06B39FFAB6837FF744624B025160B390000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000170F091D573720708D5833B7AF6E3EEAAC6A
          3CEA83512CB74F301A70140C061D000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00040000000E0000001100000006000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000010000000100000001000000040000
          0019090909A0040404C200000024000000060000000100000001000000010000
          0001000000010000000100000000000000000000000000000000000000000000
          00000000000000000006000000150000001C0000001C0000001D000000262424
          24A54E4E4EFF242424FF040404C70000002F0000002100000021000000220000
          0022000000230000001C00000008000000000000000000000000000000000000
          00000000000000000014303030FF303030FF2F2F2FFF2E2E2EFF2E2E2EFF6363
          63FF929292FF616161FF252525FF131313FF2D2D2DFF2E2E2EFF2E2E2EFF2E2E
          2EFF2E2E2EFF2E2E2EFF0000001B000000010000000000000000000000000000
          00000000000000000018333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFD3D3D3FF9D9D9DFF666666FF262626FF595959FFFCFCFCFFFFFFFFFFFFFF
          FFFFFFFFFFFF2E2E2EFF00000021000000010000000000000000000000000000
          00000000000000000017353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD9D9D9FFA6A6A6FF6B6B6BFF282828FF595959FFFCFCFCFFFFFF
          FFFFFFFFFFFF2E2E2EFF00000029000000060000000100000000000000000000
          00000000000000000015383838FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFDEDEDEFFAFAFAFFF717171FF2F2E2DFF56504FFF786F
          6DFF574B49FF4A413FFF282221A10A09093D0000000900000001000000000000
          000000000000000000143B3B3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4FFABAAA9FF5F5756FF524644FF5246
          44FF524644FF524644FF524644FF352D2CC00A09093B00000005000000000000
          000000000000000000123E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA19B9AFF524644FF786B63FFBDB2
          A3FFF4EBDAFFBEB6ADFF786E6AFF524644FF2822219A0000000E000000000000
          00000000000000000011414141FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF796F6EFF524644FFBDAD96FFFCEB
          C9FFFDEDCEFFFDF0D7FFBDB3A5FF524644FF403735D700000015000000000000
          00000000000000000010454545FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF574B49FF524644FFF3E5CCFFFDED
          CEFFFCECCBFFFCEBCBFFF3E2C5FF524644FF4F4442FA00000017000000000000
          0000000000000000000E484848FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF796F6EFF524644FFBEB6B0FFFEF6
          E6FFFDF2DDFFFDF0D6FFBDAF9CFF524644FF403735D600000012000000000000
          0000000000000000000D4C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACA6A5FF524644FF786F6DFFBFBA
          B9FFF5F2EEFFBEB6B0FF786D68FF524644FF272221940000000B000000000000
          0000000000000000000C505050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E8E8FF8F8786FF524644FF5246
          44FF524644FF524644FF524644FF352D2CB80A09093300000004000000000000
          0000000000000000000B545454FFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7FFB7B7
          B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFAAA9A9FFACA6A5FF796F
          6EFF574B49FF4F4644FF272121930A0908320000000600000001000000000000
          00000000000000000009585858FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF484848FF00000017000000040000000100000000000000000000
          000000000000000000085D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7FFB7B7
          B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFFFFFFFFFFFFF
          FFFFFFFFFFFF4C4C4CFF00000010000000000000000000000000000000000000
          00000000000000000007616161FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF505050FF0000000F000000000000000000000000000000000000
          00000000000000000006666666FFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7FFB7B7
          B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFB7B7B7FFFFFFFFFFFFFF
          FFFFFFFFFFFF545454FF0000000E000000000000000000000000000000000000
          000000000000000000056B6B6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF585858FF0000000C000000000000000000000000000000000000
          00000000000000000004707070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF5D5D5DFF0000000B000000000000000000000000000000000000
          00000000000000000003747474FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF616161FF0000000A000000000000000000000000000000000000
          00000000000000000002797979FF787878FF767676FF757575FF747474FF7373
          73FF717171FF707070FF6F6F6FFF6D6D6DFF6C6C6CFF6B6B6BFF696969FF6969
          69FF676767FF666666FF00000007000000000000000000000000000000000000
          0000000000000000000000000002000000020000000300000003000000030000
          0004000000040000000400000005000000050000000500000006000000060000
          0006000000070000000600000002000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000020000000E00000092000000920000000E000000020000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020000000D00000093214333FF214333FF000000940000000E0000
          0002000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00020000000B00000092214333FF72E8AFFF72E8AFFF214333FF000000930000
          000D000000020000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          000A00000090214333FF72E8AFFF75EEB3FF75EEB3FF72E8AFFF214333FF0000
          00920000000C00000002000000000000000000000000000000000000000A0000
          000F000000100000001000000010000000100000001000000011000000180000
          0095214333FF72E8AFFF75EEB3FF71E6ADFF71E6ADFF75EEB3FF72E8AFFF2143
          33FF000000950000000D00000001000000000000000000000000363636FF3636
          36FF363636FF363536FF363636FF363635FF363636FF989898FF464646FF2143
          33FF72E8AFFF75EEB3FF71E6ADFF214333FF214333FF71E6ADFF75EEB3FF72E8
          AFFF214333FF000000930000000A000000010000000000000000424242FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FF000000FF6EE0
          A8FF75EEB3FF71E6ADFF214333FF747474FF747474FF214333FF71E6ADFF75EE
          B3FF72E8AFFF214333FF0000008E0000000900000001000000004F4F4FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFF797979FF2143
          33FF6DDDA6FF214333FF787878FFF8F8F8FFF8F8F8FF777777FF214333FF71E6
          ADFF75EEB3FF72E8AFFF214333FF0000008C00000008000000015D5D5DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFAFAFAFF7A7A
          7AFF000000FF7A7A7AFFFAFAFAFFFEFEFEFFFEFEFEFFF9F9F9FF787878FF2143
          33FF71E6ADFF75EEB3FF72E8AFFF214333FF0000008B000000076A6B6AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFD
          FDFFFBFBFBFFFCFCFCFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFAFAFAFF7979
          79FF214333FF71E6ADFF75EEB3FF72E8AFFF214333FF00000089767676FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFB
          FBFF5A5A5AFF214333FF71E6ADFF75EEB3FF6EE0A8FF000000FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF7D74
          72FFBDBDBDFF00000089214333FF6DDDA6FF214333FF00000084424242FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF707171FF0000000D00000082000000FF00000083000000034F4F4FFFFFFF
          FFFF19C058FF19C058FFFFFFFFFF19C058FF19C058FFFFFFFFFF19C058FF19C0
          58FFFFFFFFFF19C058FF19C058FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF4F4F4FFF0000000A000000010000000200000001000000005D5D5DFFFFFF
          FFFF21CA60FF21CA61FFFFFFFFFF21CA61FF21CA60FFFFFFFFFF20CA61FF21CA
          61FFFFFFFFFF21CA60FF20CA61FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF5D5E5DFF00000009000000000000000000000000000000006A6B6AFFFFFF
          FFFF42D97BFF42D97BFFFFFFFFFF42D97BFF42D97BFFFFFFFFFF42D97BFF42D9
          7BFFFFFFFFFF42D97BFF42D97BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF6A6B6BFF0000000800000000000000000000000000000000767676FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF767776FF0000000700000000000000000000000000000000524644FF5246
          44FF524644FF524644FF524644FF524644FF524644FF524644FF524644FF5246
          44FF524644FF524644FFBC641DFFBB631BFFBB611AFFBA5F19FFBA5E18FFBA5E
          17FFB95B15FF0000000700000000000000000000000000000000424242FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC06B24FFF6DBAFFFF6DAADFFF6D9ACFFF5D8AAFFF4D7
          A8FFBB611AFF00000006000000000000000000000000000000004F4F4FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC4742DFFF8E2BCFFEECC9FFFC16E27FFEDC99CFFF7DF
          B7FFBF6821FF00000005000000000000000000000000000000005D5D5DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC97E38FFF0D3ACFFC77933FFC67731FFC5752FFFEFCF
          A6FFC3702AFF00000005000000000000000000000000000000006A6B6AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFCE8944FFE8C296FFCC833EFFF6E0C1FFCA7F39FFE9C5
          99FFC87A35FF0000000400000000000000000000000000000000767676FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD49451FFFCF0DBFFFCF0DBFFFCEFD9FFFCEFD9FFFCEE
          D7FFCC8440FF00000003000000000000000000000000000000005D5D5DBE7E7E
          7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
          7EFF7E7E7EFF7E7E7EFFD9A161FFD89D5DFFD69B5BFFD69857FFD49553FFD292
          51FFD2904DFF0000000200000000000000000000000000000000}
      end>
  end
  object imgExplorer: TImageList
    Left = 712
    Top = 8
  end
  object imgImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 590338
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000C000000330000000C00000000858481FF8684
          82FF868482FF858481FF868482FF868482FF858382FF868482FF868482FF8584
          82FF858482FF807D7BFF000000330F121C653C4B74FF0F121C3E898684FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF3F3F3FF6E6B6AFF0F121C653C4B74FF0336DAFF3C4B74FF8C8A87FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FFE0E0E0FFD2D2D2FFD2D2D2FFE0E0
          E0FFCCCCCCFF63656EFF3C4B74FF0336DAFF3C4B74FF0F121C3E8F8D8BFFFFFF
          FFFFFFFFFFFFFFFFFFFFF2F2F2FFD5D5D5FFB99999FF9D5252FF821919FF7F19
          19FF9A5555FF3C4B74FF0336DAFF3C4B74FF0F121C3E0000000093908EFFFFFF
          FFFFFFFFFFFFFFFFFFFFE0E0E0FFBEA099FFA2432AFFB55F1FFFE1B158FFE9C2
          70FFBE7544FF882E24FF3C4B74FF0F121C3E0000000000000000969593FFFFFF
          FFFFFFFFFFFFFFFFFFFFD2D2D2FFB27152FFBC6B17FFE0B33DFFEECD64FFFCE5
          84FFFFE988FFC17544FF4C0000990000000000000000000000009B9996FFFFFF
          FFFFFFFFFFFFFFFFFFFFD2D2D2FFB25B19FFD39928FFE3BC59FFF0D999FFF5DF
          9CFFF6DC80FFE4B75CFF7A0B00E00000000000000000000000009F9D9BFFFFFF
          FFFFFFFFFFFFFFFFFFFFE0E0E0FFBB6F19FFD69F2FFFECD393FFFEFDFBFFFBF5
          E5FFEBCD7DFFD7A038FF862100E0000000000000000000000000A2A19EFFFFFF
          FFFFFFFFFFFFFFFFFFFFF2F2F2FFCB9A55FFCE8C1BFFEACE89FFFDFBF4FFF8EF
          D8FFE5C269FFC47919FF64250099000000000000000000000000A8A6A4FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7D4B5FFCC912DFFD39626FFE2BA67FFDFB4
          5AFFCC8A20FFB77223FF2D150041000000000000000000000000AAA9A7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFE5D3B3FFCFA256FFCA881AFFC785
          19FFCA9A55FFB09A7DFF00000001000000000000000000000000AEADA9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDFFF7F8F8FFE7E6E6FFD0CFCFFF565656FF5656
          56FF565656FFAFADAAFF00000000000000000000000000000000B1AFADFFFFFF
          FFFFFEFEFEFFFBFBFBFFF7F7F7FFF1F1F1FFDFDFDFFFCCCCCBFF565656FFFFFF
          FFFFB2B0AEFF0000000100000000000000000000000000000000B3B1AFFFFCFC
          FCFFF9F9F8FFF4F5F5FFF0F0EFFFEAEAEAFFDBDADAFFCBCBCAFF565656FFB3B1
          AFFF000000000000000000000000000000000000000000000000B6B3B1FFB6B3
          B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FF0000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0032000000FF000000FF000000FF000000280000000000000000000000000000
          0000000000007B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF757575FF0000
          00FF68716AFFA8B5ABFF68716AFF000000FF0000000000000000000000000000
          0000000000007B7B7BFFE7E6E6FFE7E6E6FFE7E7E6FFE7E6E6FFB3B3B2FF0000
          00FFABB8AEFFABB8AEFFABB8AEFF000000FF0000000000000000A6A2A1FFA3A0
          9EFFA09E9BFF7B7B7BFFC6C5C3FFC6C5C4FFC6C5C4FFC5C4C4FF818280FF0000
          00FFB5C1B9FFB5C1B9FFB5C1B9FF000000FF0000002600000000A9A6A4FFA7A7
          A7FFA7A7A7FF7B7B7BFFAEACABFFAEACABFFAEACABFFA8A6A5FF737271FF0000
          00FFC4CCC5FFC4CCC5FFC4CCC5FF000000FF0000004600000000ADAAA8FFC2C2
          C1FFC2C2C2FF000000FF000000FF000000FF000000FF000000FF060E0CFFB2B9
          B5FFFFFFFFFFFFFFFFFFFFFFFFFF9CA59FFF000000FF00000046B0ADABFFDBDB
          DBFFDBDBDBFF9F9E9EFF000000FF000000FF000000FF141E1DFFC1C5C4FFFFFF
          FFFFB9C1BEFF000300FFABB8AFFFFFFFFFFFA4AEA7FF000000FFB3AFADFFF0EF
          EFFFEFEFEFFFEFF0EFFFEFEFEFFFEFEFEFFFB9B9B9FF202727FFF8FEFEFFFFFF
          FFFF141D1DFFB9B9B9FF09100EFFFFFFFFFFFFFFFFFF000401FFB5B3B0FFFCFC
          FCFFFCFCFDFFFCFCFCFFFCFCFCFFFCFCFCFFC3C3C3FF17201EFFCBCFCEFFFCFF
          FFFF1E2727FFC3C3C4FF131D1CFFFFFFFFFFBCC4C2FF06100DFFB6B3B1FFFEFF
          FEFFFFFEFEFFC3C3C3FF909190FF909090FF707070FF515151FF2A3133FFCBCF
          CEFF272D2DFFC4C5C4FF1D2726FFC8CECBFF17201EFF00000026B6B3B1FFF2F1
          F1FFF2F1F1FF8A8989FF898989FF898989FF818182FF6A6B6AFF4D4E4DFF2B33
          34FF2B3334FFBABBBAFF262B2DFF212A2AFF0000004D00000000B6B3B1FFD8D9
          D8FFD9D9D9FF7B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF747474FF5F6060FF5F60
          60FF7B7B7BFFA8A8A8FFA8A7A8FF92908EFF0000000000000000B6B3B1FFB6B3
          B1FFB6B3B1FFB6B3B1FF868684FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7E
          7DFFA8A5A3FFA5A3A1FFA39F9EFFA09D9BFF0000000000000000000000000000
          000000000000000000008E8D8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8584
          84FF000000000000000000000000000000000000000000000000000000000000
          00000000000000000000969594FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8B
          8BFF000000000000000000000000000000000000000000000000000000000000
          000000000000000000009E9C9AFF9D9B99FF999796FF989795FF979593FF9594
          93FF000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000535353FF535353FF535353FF535353FF535353FF535353FF5353
          53FF535353FF535353FF535353FF000000000000000000000000000000000000
          000000000000535353FFE0DEDEFFE0DEDEFFE0E0DEFFE0DEDEFFE0E0DEFFE0DE
          DEFFE1E0DEFFE0E0DEFF535353FF0000000000000000000000008B8685FF8783
          81FF83817DFF535353FFB5B4B1FFB5B4B2FFB5B2B2FFB5B4B2FFB5B4B2FFB4B2
          B2FFB4B4B1FFB5B2B1FF535353FF635E5CFF625E5BFF625E5BFF8F8B89FF8D8D
          8DFF8D8D8DFF535353FF969392FF969392FF969392FF969392FF969392FF9693
          92FF969392FF969392FF535353FF8D8D8DFF8E8D8DFF625E5BFF94908EFFB0B0
          AEFFB0B0B0FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FFAEB0B0FFB0B0AEFF64605EFF989492FFD0D0
          D0FFD0D0D0FF828181FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF828282FFD0D0D0FFD0D0D0FF676362FF9C9794FFEBEA
          EAFFEAEAEAFFEAEBEAFFEAEAEAFFEAEAEAFFEAEAEBFFEAEBEAFFEAEBEAFF0000
          CFFF0000CFFFEAEBEAFF007D00FF007D00FFEAEAEAFF6B6764FF9F9C98FFFBFB
          FBFFFBFBFCFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFF0000
          CFFF0000CFFFFBFBFBFF007D00FF007D00FFFBFBFCFF6F6C69FFA09C9AFFFEFF
          FEFFFFFEFEFFB1B1B1FF6F706FFF6F6F6FFF6F6F6FFF6F7070FF706F6FFF6F6F
          6FFF6F6F6FFF6F6F6FFFB0B0B0FFFEFEFEFFFEFEFEFF74706DFFA09C9AFFEEED
          EDFFEEEDEDFF676565FF656565FF656565FF676565FF676765FF656567FF6565
          65FF656565FF656567FF656765FFEDEEEDFFEDEEEDFF797572FFA09C9AFFCCCE
          CCFFCECECEFF535353FF535353FF535353FF535353FF535353FF535353FF5353
          53FF535353FF535353FF535353FFCECECEFFCECCCEFF7E7A78FFA09C9AFFA09C
          9AFFA09C9AFFA09C9AFF62625FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF575756FF8E8A87FF8A8785FF878281FF83807DFF000000000000
          000000000000000000006C6B69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF605F5FFF00000000000000000000000000000000000000000000
          00000000000000000000767574FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF696868FF00000000000000000000000000000000000000000000
          00000000000000000000817E7CFF807D7AFF7D7C79FF7C7A79FF7A7876FF7978
          75FF787572FF757472FF00000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000858481FF868482FF868482FF858481FF868482FF8684
          82FF858382FF868482FF868482FF858482FF858482FF868381FF000000000000
          00000000000500000000898684FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF898684FF000000010D00
          002F010000200100001F787673FFD1D1D1FFC9C9C9FFD4D4D4FFE4E4E4FFF8F8
          F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8A87FF390000704800
          009F4C04008C731100BAAD3214FFC22F05FFCE532CFFD58367FFCDB7AEFFDBDB
          DBFFF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8C8BFF690000CB3207
          0062850B00E6BF5400FFC58029FFCA9A4FFFCC8C35FFD16400FFD96C46FFCDB7
          AEFFE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93908EFF4B000091770E
          00C0C34D00FFC98704FFCD900DFFD19710FFD69D14FFDA9E14FFDD6200FFDA86
          67FFD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969593FF1E000039B056
          4EF4B63800FFD06400FF797775FFFFFFFFFFFFFFFFFFE17300FFE46700FFEF6A
          39FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9996FF04000007EAC3
          BBFEB14D3BFFC54900FF7C7B79FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFD4D4D4FFF4F4F4FFFFFFFFFFFFFFFFFFFEFEFEFF9F9D9BFF00000000CE84
          6BDEF8ECE5FFB15B51FFC25A00FFE78E02FFEA9200FFEE9600FFF18200FFEA61
          2CFFC5ABABFFDDDDDDFFFBFBFBFFFBFAFAFFF8F7F7FFA4A19FFF00000000721F
          007BEA9042FFEFD8C1FFAD5858FFA55D5DFFBDAAAAFFDA9125FFF67C00FFB447
          36FFB26565FFC0BDBCFFE3E3E3FFE7E7E7FFE7E7E7FFA7A6A4FF000000001F09
          00209A2900A5ED8209FFE5AA62FFB1563CFFA3310FFFC14800FFBE432AFFDBBF
          B6FF8C1515FFAF9B9CFFD0CFD0FFD1D1D1FFD4D4D4FFAAA8A7FF000000000000
          00001F0900207721007BE55B26FFF64907FFD34A26FFC25644FFB5605CFFAE5D
          5DFF9D4040FFCAC2C2FF565656FF565656FF565656FFAFADAAFF000000000000
          00000000000000000000B1AFADFFFFFFFFFFFEFEFEFFF0E4E4FFECE0E0FFD3AF
          AFFFDBD5D5FFCCCCCBFF565656FFFFFFFFFFB2B0AEFF00000001000000000000
          00000000000000000000B3B1AFFFFCFCFCFFF9F9F8FFF4F5F5FFF0F0EFFFEAEA
          EAFFDBDADAFFCBCBCAFF565656FFB3B1AFFF0000000000000000000000000000
          00000000000000000000B6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3
          B1FFB6B3B1FFB6B3B1FFB6B3B1FF000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000008584
          81FF868482FF858481FF858481FF858481FF848380FF848380FF858381FF8684
          82FF858382FF868482FF868482FF858482FF858482FF868381FF000000008986
          84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF898684FF000000008C8A
          87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8A87FF000000008C8A
          87FFFFFFFFFFFFFFFFFFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFB3B2
          B2FFB3B2B2FFB3B2B2FFB3B2B2FFFFFFFFFFFFFFFFFF8C8A87FF000000008C8A
          87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8A87FF000000009390
          8EFFFFFFFFFFFFFFFFFFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFB3B2
          B2FFB3B2B2FFB3B2B2FFB3B2B2FFFFFFFFFFFFFFFFFF93908EFF000000009695
          93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969593FF000000009B99
          96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC1AAFFF64907FFF64907FFF649
          07FFFCC1AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9996FF000000009F9D
          9BFFFFFFFFFFF2D0C7FFC43107FFFFFFFFFFF64907FFE48C00FFDBAA32FFE4BF
          64FFF64907FFFFFFFFFFC43107FFF7E2DCFFFEFEFEFF9F9D9BFF00000000A2A1
          9EFFFFFFFFFFC43107FFF9E9E5FFFFFFFFFFF64907FFF6E4C4FFE48C00FFDBAA
          32FFF64907FFFEFEFEFFF5E0DAFFC43107FFF8F7F7FFA4A19FFF00000001A8A6
          A4FFFFFFFFFFF3D7CEFFC43107FFFFFFFFFFF64907FFFFFFFFFFF6E4C4FFE48C
          00FFF64907FFF1F1F0FFC43107FFE2CDC7FFE7E7E7FFA7A6A4FF00000001AAA9
          A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC1AAFFF64907FFF64907FFF649
          07FFF1B6A0FFD8D7D8FFD2D1D2FFD1D1D1FFD4D4D4FFAAA8A7FF00000000AEAD
          A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF7F8
          F8FFE7E6E6FFD0CFCFFF565656FF565656FF565656FFAFADAAFF00000000B1AF
          ADFFFFFFFFFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFF7F7F7FFF1F1
          F1FFDFDFDFFFCCCCCBFF565656FFFFFFFFFFB2B0AEFF0000000100000000B3B1
          AFFFFCFCFCFFF4F5F5FFF4F5F5FFF4F5F5FFF4F5F5FFF4F5F5FFF0F0EFFFEAEA
          EAFFDBDADAFFCBCBCAFF565656FFB3B1AFFF000000000000000000000000B6B3
          B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3
          B1FFB6B3B1FFB6B3B1FFB6B3B1FF000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000858481FF868482FF868482FF858481FF868482FF8684
          82FF858382FF868482FF868482FF858482FF858482FF868381FF000000000000
          00000000000000000000898684FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF898684FF000000000000
          0038000000380000003884827FFFFFFFFFFFF0F0F0FFC7C7C7FFC7C7C7FFC7C7
          C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8A87FF009039FF0090
          39FF009039FF00260F6C706E6CFFB1D7C0FF009039FF009039FF009039FFC7C7
          C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8C8BFF009039FF54DC
          7BFF009039FF009039FF557861FF009039FF009039FF54DC7BFF009039FFC7C7
          C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93908EFF009039FF0090
          39FF54DC7BFF009039FF009039FF009039FF54DC7BFF009039FF009039FFF0F0
          F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969593FF00260F430090
          39FF009039FF54DC7BFF009039FF54DC7BFF009039FF009039FFB1D7C0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9996FF000000000026
          0F4E009039FF009039FF54DC7BFF009039FF009039FF93B9A2FFC7C7C7FFF0F0
          F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF9F9D9BFF00260F430090
          39FF009039FF54DC7BFF009039FF54DC7BFF009039FF009039FF93B9A2FFC7C7
          C7FFFEFEFEFFFEFEFEFFFDFDFDFFFBFAFAFFF8F7F7FFA4A19FFF009039FF0090
          39FF54DC7BFF009039FF009039FF009039FF54DC7BFF009039FF009039FFC6C6
          C6FFFAFAFAFFF1F1F0FFEAEAEAFFE7E7E7FFE7E7E7FFA7A6A4FF009039FF54DC
          7BFF009039FF009039FF769B83FF009039FF009039FF54DC7BFF009039FFC6C5
          C5FFEFEFEFFFD8D7D8FFD2D1D2FFD1D1D1FFD4D4D4FFAAA8A7FF009039FF0090
          39FF009039FF00260F43AEADA9FFBCE2CBFF009039FF009039FF009039FFF7F8
          F8FFE7E6E6FFD0CFCFFF565656FF565656FF565656FFAFADAAFF000000000000
          00000000000000000000B1AFADFFFFFFFFFFFEFEFEFFFBFBFBFFF7F7F7FFF1F1
          F1FFDFDFDFFFCCCCCBFF565656FFFFFFFFFFB2B0AEFF00000001000000000000
          00000000000000000000B3B1AFFFFCFCFCFFF9F9F8FFF4F5F5FFF0F0EFFFEAEA
          EAFFDBDADAFFCBCBCAFF565656FFB3B1AFFF0000000000000000000000000000
          00000000000000000000B6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3
          B1FFB6B3B1FFB6B3B1FFB6B3B1FF000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000858481FF868482FF858481FF858481FF858481FF858481FF858481FF8684
          82FF868482FF868482FF858482FF858482FF868381FF00000000000000000000
          0000898684FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF898684FF00000000000000000000
          00008C8A87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8A87FF00000000000000000000
          00008C8A87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8A87FF00000000000000000000
          00008C8A87FFFFFFFFFFFFFFFFFF858585FF858585FF858585FF858585FF8585
          85FF858585FF858585FFFFFFFFFFFFFFFFFF8C8A87FF00000000000000000000
          000093908EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF93908EFF00000000000000000000
          0000969593FFFFFFFFFFFFFFFFFF858585FF858585FF858585FF858585FF8585
          85FF858585FF848484FFFCFCFCFFFAFAFAFF969593FF00000000000000000000
          00009B9996FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFD
          FDFFFBFBFBFFF9FAF9FFF8F7F7FFF5F5F5FF9C9996FF00000000000000000000
          0000A8A6A4FFFFFFFFFFFFFFFFFF858585FF848484FF848383FF838382FF8181
          81FF818180FF7F7F7FFFF1F1F1FFEFEEEEFFA7A6A4FF00000001000000000000
          0000AAA9A7FFFFFFFFFFFDFEFEFFFCFCFCFFFAFAFAFFF8F8F8FFF6F6F6FFF3F3
          F2FFF0F0F0FFEEEEEDFFEBEBEBFFE9E8E8FFAAA8A7FF00000001000000000000
          0000AEADA9FFFBFBFBFFFAF9F9FF818181FF808080FF7E7E7EFF7D7D7DFF7C7C
          7CFF7A7A7AFF787878FFE4E4E3FFE2E1E1FFAFADAAFF00000000000000000000
          0000B1AFADFFF6F6F6FFF2F2F2FFF0F0F0FFEDEDECFFEAEAEAFFE8E7E6FFE5E4
          E4FFE2E1E1FFDFDEDEFFDDDCDBFFDBDAD9FFAFADAAFF00000000000000000000
          0000B3B1AFFFEFEFEEFFE9E9E9FFE6E6E6FFE3E3E3FFE0E0E0FFDEDEDEFFDBDA
          DAFFD8D8D8FFD6D6D6FFD4D4D3FFD2D2D0FFAFADAAFF00000000000000000000
          0000B6B3B1FF000000FFB6B3B1FF000000FFB6B3B1FF000000FFB6B3B1FF0000
          00FFB6B3B1FF000000FFAFADAAFF000000FFAFADAAFF00000000000000000000
          0000000000FF00000000000000FF00000000000000FF00000000000000FF0000
          0001000000FF00000001000000FF00000000000000FF00000000000000000000
          000000000000000000FF00000000000000FF00000000000000FF000000000000
          00FF00000000000000FF00000000000000FF0000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000060000
          0021000000210000002100000005000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000210809
          084D232B24FF232B24FF232B24FF05060528000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFDC6E0BFF2B35
          2EFFC3CCC5FFC3CCC5FFC3CCC5FF242D26FF000000000000000000000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF000000000000000500000021333C
          36FFC5CEC7FFC5CEC7FFC5CEC7FF2B332DFF000000000000000000000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF0000000000000005040605423D43
          3FFFCCD4CFFFCCD4CFFFCCD4CFFF333C36FF040605260000000000000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF000000050000002104060542474F
          4CFFD6DCD7FFD6DCD7FFD6DCD7FF383F3CFF080B094D0000000000000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF0000002104060542535957FFCACF
          CCFFFFFFFFFFFFFFFFFFFFFFFFFFBBC1BDFF3D4542FF080B094600000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF000000215D6463FFD4D7D6FFFFFF
          FFFFCFD4D2FF4B514FFFC5CEC8FFFFFFFFFFC0C7C2FF434B47FF00000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF00000021656A6AFFFAFEFEFFFFFF
          FFFF5D6363FF00000021555A59FFFFFFFFFFFFFFFFFF4B5250FF00000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF000000095F6564FFDBDEDDFFFDFF
          FFFF646A6AFF000000215C6362FFFFFFFFFFD1D6D5FF535A58FF00000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF00000000080B094D6C7172FFDBDE
          DDFF6A6E6EFF00000021636A69FFD9DDDBFF5F6564FF0406052600000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF0000000000000000080B09466D72
          73FF6D7273FF00000000696D6EFF666C6CFF080B09460000000000000000FD7E
          0DFFFFEFDAFFFAD8B7FFFAD8B7FFF4A962FF0000000000000000000000000000
          00000000000000000000FD7E0DFF00000000000000000000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFF4A962FF0000000000000000000000000000
          00000000000000000000FD7E0DFF00000000000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFF000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000001E033C0047088E00680BD0007C0EF900680BD00047088E001E
          033C000000000000000000000000000000000000000000000000000000000000
          0000002E0565007A17E100AF38FF19CB50FF2FDF61FF19CB50FF00AF38FF128C
          29FF558258FF868482FF868482FF858482FF858482FF868381FF00000000001E
          034C007A17E30ABE46FF08BC43FF009A26FF008312FF009A26FF08BC43FF0ABE
          46FF239D3AFFC3E1C6FFFFFFFFFFFFFFFFFFFFFFFFFF898684FF0000000E0047
          08A500AF38FF08BC43FF187C24FF7BAA80FFB8C0B9FF7BAA80FF2B9038FF08BC
          43FF00AF38FF71B879FFFFFFFFFFFFFFFFFFFFFFFFFF8C8A87FF000000210068
          0BDB19CB50FF009A26FF528055FFFCFCFCFFE9E9E9FFD1D1D1FF7BAB81FF0085
          16FF008C1BFF2F983EFFFFFFFFFFFFFFFFFFFFFFFFFF8F8C8BFF00000030007D
          0EFA2FDF61FF008312FF8A8F86FFFFFFFFFFFFFFFFFFE9E9E9FFC4C4C4FFC4C4
          C4FFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93908EFF0000003A0068
          0BDB19CB50FF009A26FF5E8D61FFFFFFFFFF007F0EFFB4D9B8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969593FF000000300047
          08A800AF38FF08BC43FF22862EFF7BAA80FF007F0EFF007F0EFFB4D9B8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9996FF00000021001E
          0369007A17E40ABE46FF08BC43FF009A26FF008312FF2FDF61FF007F0EFFB4D9
          B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF9F9D9BFF0000000E0000
          0033002E0582007A17E400AF38FF19CB50FF2FDF61FF2FDF61FF2FDF61FF007F
          0EFFFEFEFEFFFEFEFEFFFDFDFDFFFBFAFAFFF8F7F7FFA4A19FFF000000000000
          001500000033001E0369397F40FF248C30FF058112FF2FDF61FF007F0EFFB3D9
          B7FFFAFAFAFFF1F1F0FFEAEAEAFFE7E7E7FFE7E7E7FFA7A6A4FF000000000000
          00000000000E000000218A8988FFC5C5C5FF007F0EFF007F0EFFA8CDACFFFEFD
          FDFFEFEFEFFFD8D7D8FFD2D1D2FFD1D1D1FFD4D4D4FFAAA8A7FF000000000000
          00000000000000000000AEADA9FFC4C4C4FF007F0EFFA8CDACFFFDFDFDFFF7F8
          F8FFE7E6E6FFD0CFCFFF565656FF565656FF565656FFAFADAAFF000000000000
          00000000000000000000B1AFADFFC4C4C4FFEDEDEDFFFBFBFBFFF7F7F7FFF1F1
          F1FFDFDFDFFFCCCCCBFF565656FFFFFFFFFFB2B0AEFF00000001000000000000
          00000000000000000000B3B1AFFFFCFCFCFFF9F9F8FFF4F5F5FFF0F0EFFFEAEA
          EAFFDBDADAFFCBCBCAFF565656FFB3B1AFFF0000000000000000000000000000
          00000000000000000000B6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3B1FFB6B3
          B1FFB6B3B1FFB6B3B1FFB6B3B1FF000000000000000000000000}
      end>
  end
end
