object PivotGridFeaturesDemoMainForm: TPivotGridFeaturesDemoMainForm
  Left = 214
  Top = 129
  Caption = 'ExpressPivotGrid Features demo'
  ClientHeight = 696
  ClientWidth = 969
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object nbDemos: TdxNavBar
    Left = 0
    Top = 51
    Width = 209
    Height = 645
    Align = alLeft
    ActiveGroupIndex = 0
    TabOrder = 0
    View = 11
    OptionsBehavior.Common.AllowSelectLinks = True
    OptionsBehavior.Common.DragDropFlags = []
    OptionsImage.SmallImages = imgLinkImages
    OnLinkClick = nbDemosLinkClick
    object nbgNew: TdxNavBarGroup
      Caption = 'New && Updated Demos'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiCompactLayout
        end>
    end
    object nbgHighlighted: TdxNavBarGroup
      Caption = 'Highlighted Features'
      LargeImageIndex = 0
      SelectedLinkIndex = -1
      SmallImageIndex = 37
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiChartConnection
        end
        item
          Item = nbiOLAPBrowser
        end
        item
          Item = nbiSummaryVariation
        end
        item
          Item = nbiTopValues
        end
        item
          Item = nbiOLAPDrillDown
        end
        item
          Item = nbiMultipleTotals
        end>
    end
    object nbgSampleReports: TdxNavBarGroup
      Caption = 'Sample reports'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiCustomerReports
        end
        item
          Item = nbiProductReports
        end
        item
          Item = nbiOrderReports
        end>
    end
    object nbgSummary: TdxNavBarGroup
      Caption = 'Summary'
      LargeImageIndex = 1
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiSingleTotal
        end
        item
          Item = nbiMultipleTotals
        end
        item
          Item = nbiSummaryVariation
        end
        item
          Item = nbiTotalsLocation
        end
        item
          Item = nbiSortBySummary
        end
        item
          Item = nbiTopValues
        end>
    end
    object nbDataShaping: TdxNavBarGroup
      Caption = 'Data Shaping Features'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiIntervalGrouping
        end
        item
          Item = nbiChartConnection
        end
        item
          Item = nbiGroups
        end
        item
          Item = nbiPrefilter
        end
        item
          Item = nbiSummaryDataSet
        end
        item
          Item = nbiFieldsCustomization
        end>
    end
    object nbOLAPFeatures: TdxNavBarGroup
      Caption = 'OLAP Features'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiOLAPBrowser
        end
        item
          Item = nbiOLAPMultipleTotals
        end
        item
          Item = nbiOLAPDrillDown
        end>
    end
    object nbAppearance: TdxNavBarGroup
      Caption = 'Appearance'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiStyles
        end
        item
          Item = nbiCustomDraw
        end
        item
          Item = nbiCompactLayout
        end>
    end
    object nbgEditing: TdxNavBarGroup
      Caption = 'nbgEditing'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiInplaceEditors
        end>
    end
    object nbgCharts: TdxNavBarGroup
      Caption = 'nbgCharts'
      SelectedLinkIndex = -1
      TopVisibleLinkIndex = 0
      Links = <
        item
          Item = nbiChartConnection
        end>
    end
    object nbiCustomerReports: TdxNavBarItem
      Caption = 'Customer Reports'
      SmallImageIndex = 2
    end
    object nbiProductReports: TdxNavBarItem
      Tag = 1
      Caption = 'Product Reports'
      SmallImageIndex = 3
    end
    object nbiOrderReports: TdxNavBarItem
      Tag = 2
      Caption = 'Order Reports'
      SmallImageIndex = 4
    end
    object nbiSingleTotal: TdxNavBarItem
      Tag = 3
      Caption = 'Single Total'
      SmallImageIndex = 5
    end
    object nbiMultipleTotals: TdxNavBarItem
      Tag = 4
      Caption = 'Multiple Totals'
      SmallImageIndex = 6
    end
    object nbiSummaryVariation: TdxNavBarItem
      Tag = 5
      Caption = 'Summary Variation'
      SmallImageIndex = 30
    end
    object nbiTotalsLocation: TdxNavBarItem
      Tag = 6
      Caption = 'Totals Location'
      SmallImageIndex = 31
    end
    object nbiSortBySummary: TdxNavBarItem
      Tag = 7
      Caption = 'Sort By Summary'
      SmallImageIndex = 9
    end
    object nbiTopValues: TdxNavBarItem
      Tag = 8
      Caption = 'Top Values'
      SmallImageIndex = 10
    end
    object nbiIntervalGrouping: TdxNavBarItem
      Tag = 9
      Caption = 'Interval Grouping'
      SmallImageIndex = 32
    end
    object nbiFieldsCustomization: TdxNavBarItem
      Tag = 10
      Caption = 'Fields Customization'
      SmallImageIndex = 12
    end
    object nbiGroups: TdxNavBarItem
      Tag = 15
      Caption = 'Groups'
      SmallImageIndex = 17
    end
    object nbiStyles: TdxNavBarItem
      Tag = 14
      Caption = 'Styles'
      SmallImageIndex = 16
    end
    object nbiCustomDraw: TdxNavBarItem
      Tag = 16
      Caption = 'Custom Draw'
      SmallImageIndex = 18
    end
    object nbiHTML: TdxNavBarItem
      Tag = 17
      Caption = 'HTML'
      SmallImageIndex = 19
    end
    object nbiXML: TdxNavBarItem
      Tag = 18
      Caption = 'XML'
      SmallImageIndex = 20
    end
    object nbiExcel: TdxNavBarItem
      Tag = 19
      Caption = 'Excel'
      SmallImageIndex = 21
    end
    object nbiText: TdxNavBarItem
      Tag = 20
      Caption = 'Text'
      SmallImageIndex = 22
    end
    object nbiPrint: TdxNavBarItem
      Tag = 21
      Caption = 'Print'
      SmallImageIndex = 23
    end
    object nbiPrintPreview: TdxNavBarItem
      Tag = 23
      Caption = 'Print Preview'
      SmallImageIndex = 25
    end
    object nbiPageSetup: TdxNavBarItem
      Tag = 22
      Caption = 'Page Setup'
      SmallImageIndex = 24
    end
    object nbiChartConnection: TdxNavBarItem
      Tag = 24
      Caption = 'Charts Integration'
      SmallImageIndex = 1
    end
    object nbiPrefilter: TdxNavBarItem
      Tag = 25
      Caption = 'Prefilter'
      SmallImageIndex = 29
    end
    object nbiInplaceEditors: TdxNavBarItem
      Tag = 26
      Caption = 'InplaceEditors'
      SmallImageIndex = 28
    end
    object nbiOLAPBrowser: TdxNavBarItem
      Tag = 27
      Caption = 'OLAP Browser'
      SmallImageIndex = 0
    end
    object nbiSummaryDataSet: TdxNavBarItem
      Tag = 28
      Caption = 'Summary DataSet'
      SmallImageIndex = 27
    end
    object nbiOLAPDrillDown: TdxNavBarItem
      Tag = 34
      Caption = 'OLAP Drill Down'
      SmallImageIndex = 34
    end
    object nbiOLAPMultipleTotals: TdxNavBarItem
      Tag = 33
      Caption = 'OLAP Multiple Totals'
      SmallImageIndex = 33
    end
    object nbiCompactLayout: TdxNavBarItem
      Tag = 35
      Caption = 'Compact Layout'
      SmallImageIndex = 35
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 209
    Top = 51
    Width = 8
    Height = 645
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 74
    Control = nbDemos
  end
  object Panel1: TPanel
    Left = 217
    Top = 51
    Width = 752
    Height = 645
    Align = alClient
    Caption = 'Panel1'
    FullRepaint = False
    TabOrder = 4
    object pnPivotSite: TPanel
      Left = 1
      Top = 66
      Width = 750
      Height = 578
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 8
      TabOrder = 0
    end
    object pnHeaderSite: TPanel
      Left = 1
      Top = 1
      Width = 750
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        750
        65)
      object pbDemoHeader: TPaintBox
        Left = 8
        Top = 8
        Width = 505
        Height = 49
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 16773091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        OnPaint = pbDemoHeaderPaint
      end
      object imgLogo: TImage
        Left = 524
        Top = 8
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
    end
  end
  object BarManager: TdxBarManager
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
    ImageOptions.Images = imgImages
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
      Tag = 2
      Caption = 'View &Options '
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem5'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem2'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem8'
        end>
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Totals Visibility'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biShowColumnTotals'
        end
        item
          Visible = True
          ItemName = 'biShowRowTotals'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biShowColumnGrandTotals'
        end
        item
          Visible = True
          ItemName = 'biShowRowGrandTotals'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biShowTotalsForSingleValue'
        end
        item
          Visible = True
          ItemName = 'biShowGrandTotalsForSingleValue'
        end>
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'Element Visibility'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biShowColumnFields'
        end
        item
          Visible = True
          ItemName = 'biShowDataFields'
        end
        item
          Visible = True
          ItemName = 'biShowFilterFields'
        end
        item
          Visible = True
          ItemName = 'biShowFilterSeparator'
        end
        item
          Visible = True
          ItemName = 'biShowRowFields'
        end>
    end
    object biShowColumnTotals: TdxBarButton
      Caption = 'ShowColumnTotals'
      Category = 0
      Hint = 'ShowColumnTotals'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnTotalsVisibilityItemClick
    end
    object biShowRowTotals: TdxBarButton
      Tag = 1
      Caption = 'ShowRowTotals'
      Category = 0
      Hint = 'ShowRowTotals'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnTotalsVisibilityItemClick
    end
    object biShowColumnGrandTotals: TdxBarButton
      Tag = 2
      Caption = 'ShowColumnGrandTotals'
      Category = 0
      Hint = 'ShowColumnGrandTotals'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnTotalsVisibilityItemClick
    end
    object biShowRowGrandTotals: TdxBarButton
      Tag = 3
      Caption = 'ShowRowGrandTotals'
      Category = 0
      Hint = 'ShowRowGrandTotals'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnTotalsVisibilityItemClick
    end
    object biShowTotalsForSingleValue: TdxBarButton
      Tag = 4
      Caption = 'ShowTotalsForSingleValue'
      Category = 0
      Hint = 'ShowTotalsForSingleValue'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnTotalsVisibilityItemClick
    end
    object biShowGrandTotalsForSingleValue: TdxBarButton
      Tag = 5
      Caption = 'ShowGrandTotalsForSingleValue'
      Category = 0
      Hint = 'ShowGrandTotalsForSingleValue'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnTotalsVisibilityItemClick
    end
    object biShowColumnFields: TdxBarButton
      Caption = 'Show Column Fields'
      Category = 0
      Hint = 'Show Column Fields'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnItemVisibilityClick
    end
    object biShowDataFields: TdxBarButton
      Tag = 1
      Caption = 'Show Data Fields'
      Category = 0
      Hint = 'Show Data Fields'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnItemVisibilityClick
    end
    object biShowFilterFields: TdxBarButton
      Tag = 2
      Caption = 'Show Filter Fields'
      Category = 0
      Hint = 'Show Filter Fields'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnItemVisibilityClick
    end
    object biShowFilterSeparator: TdxBarButton
      Tag = 3
      Caption = 'Show Filter Separator'
      Category = 0
      Hint = 'Show Filter Separator'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnItemVisibilityClick
    end
    object biShowRowFields: TdxBarButton
      Tag = 4
      Caption = 'Show Row Fields'
      Category = 0
      Hint = 'Show Row Fields'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = OnItemVisibilityClick
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
    object dxBarButton3: TdxBarButton
      Caption = 'Print'
      Category = 0
      Hint = 'Print'
      Visible = ivAlways
      ImageIndex = 2
      PaintStyle = psCaptionGlyph
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
          ItemName = 'dxBarButton5'
        end
        item
          Visible = True
          ItemName = 'bbPrintPreview'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton8'
        end>
    end
    object dxBarButton5: TdxBarButton
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
      OnClick = ExitClick
    end
    object bbInspector: TdxBarButton
      Caption = 'Modify Properties...'
      Category = 0
      Hint = 'Modify Properties'
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
    object dxBarSubItem5: TdxBarSubItem
      Caption = 'Totals Location'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem6'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem7'
        end>
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
        end
        item
          Visible = True
          ItemName = 'biRowTree'
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
      OnClick = biTotalsLocationClick
    end
    object biColumnNear: TdxBarButton
      Caption = 'Near'
      Category = 0
      Hint = 'Near'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 3
      OnClick = biTotalsLocationClick
    end
    object biRowFar: TdxBarButton
      Caption = 'Far'
      Category = 0
      Hint = 'Far'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      Down = True
      OnClick = biTotalsLocationClick
    end
    object biRowNear: TdxBarButton
      Tag = 1
      Caption = 'Near'
      Category = 0
      Hint = 'Near'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      OnClick = biTotalsLocationClick
    end
    object dxBarSubItem8: TdxBarSubItem
      Caption = 'Selection'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem9'
        end
        item
          Visible = True
          ItemName = 'biMultiSelect'
        end
        item
          Visible = True
          ItemName = 'biHideFocus'
        end
        item
          Visible = True
          ItemName = 'biHideSelection'
        end>
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
      OnClick = biSelectionOptionsClick
    end
    object biGrandTotalsCells: TdxBarButton
      Caption = 'Grand Totals Cells'
      Category = 0
      Hint = 'Grand Totals Cells'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = biSelectionOptionsClick
    end
    object biTotalsCells: TdxBarButton
      Caption = 'Totals Cells'
      Category = 0
      Hint = 'Totals Cells'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = biSelectionOptionsClick
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
      OnClick = biSelectionOptionsClick
    end
    object biHideFocus: TdxBarButton
      Caption = 'Hide Focus Rect when Inactive'
      Category = 0
      Hint = 'Hide Focus Rect when Inactive'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = biSelectionOptionsClick
    end
    object biHideSelection: TdxBarButton
      Caption = 'Hide Selection when Inactive'
      Category = 0
      Hint = 'Hide Selection when Inactive'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = biSelectionOptionsClick
    end
    object biRowTree: TdxBarButton
      Tag = 2
      Caption = 'Tree'
      Category = 0
      Hint = 'Tree'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      OnClick = biTotalsLocationClick
    end
  end
  object SaveDialog: TSaveDialog
    Left = 410
    Top = 9
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = dxComponentPrinterPivotReportLink
    Version = 0
    Left = 546
    Top = 9
    object dxComponentPrinterPivotReportLink: TcxPivotGridReportLink
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.GrayShading = True
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      BuiltInReportLink = True
    end
  end
  object dxPSEngineController1: TdxPSEngineController
    Active = True
    PreviewDialogStyle = 'Ribbon'
    Left = 618
    Top = 11
  end
  object dxSkinController: TdxSkinController
    OnSkinControl = dxSkinControllerSkinControl
    Left = 480
    Top = 8
  end
  object imgLinkImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 590338
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000FD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF000000000000
          00000000000000000000FD7E0DFFF0CDADFFEAC8A8FFF4A962FFFFFFFFFFFFFF
          FFFFFFFFFFFFBFBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF000000000000
          00000000000000000000FD7E0DFFF3D0B0FFEDCAAAFFF4A962FFFFFFFFFFFFFF
          FFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFCFDFCFFFD7E0DFF00000000021A
          4856034BD5FF034BD5FF034BD5FF034BD5FF034BD5FFA58A88FFFFFFFFFFFFFF
          FFFFFFFFFFFFB3B2B2FFFFFFFFFFFCFDFCFFFAF9F9FFFD7E0DFF034BD5FF0A56
          DCFF3E98F1FF65C6FEFF5BBDFEFF4CAEFEFF2882F1FF034BD5FF034BD5FFB3B2
          B2FFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFBEBDBDFFFD7E0DFF034BD5FF42A5
          FDFF5BBEFEFF65C6FEFF5BBDFEFF4CAEFEFF3A9DFEFF2A8EFEFF034BD5FFFFFF
          FFFFFFFFFFFFB3B2B2FFFAF9F9FFF7F5F5FFF2F2F1FFFD7E0DFF034BD5FF3A9D
          FEFF000000FF000000FF000000FF000000FF000000FF2A8EFEFF034BD5FFFFFF
          FFFFFCFDFCFFB3B2B2FFF6F6F6FFF2F1F1FFEEEDEDFFFD7E0DFF034BD5FF399C
          FEFF000000FF000000FF000000FF000000FF000000FF2A8EFEFF034BD5FFF9F9
          F9FFF6F6F5FFBDBCBCFFEDEDECFFE9E8E7FFE4E3E2FFFD7E0DFF034BD5FF399C
          FEFF3D81AFFF000000FF3F82AFFF4BAEFEFF3A9DFEFF2A8DFEFF034BD5FFF4A9
          62FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFFD7E0DFF034BD5FF399C
          FEFF58BBFEFF4689AFFF000000FF4BAEFEFF3A9DFEFF2A8EFEFF034BD5FFFAD8
          B7FFFAD8B7FFF4A962FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFF034BD5FF399C
          FEFF3D81AFFF000000FF3F82AFFF4CAEFEFF399DFEFF298FFEFF034BD5FFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF034BD5FF399C
          FEFF000000FF000000FF000000FF000000FF000000FF2A8DFEFF034BD5FF0000
          0000000000000000000000000000000000000000000000000000034BD5FF3A9D
          FEFF000000FF000000FF000000FF000000FF000000FF2A8EFEFF034BD5FF0000
          000000000000000000FF000000FF000000FF0000000000000000034BD5FF42A5
          FDFF5BBEFEFF65C6FEFF5BBDFEFF4BAEFEFF399EFEFF2A8EFEFF034BD5FF0000
          0000000000000000003E000000FF000000FF00000000000000000A56DCFF0A56
          DCFF3C96F1FF65C6FEFF5BBDFEFF4BAEFEFF2783F1FF034BD5FF034BD5FF0000
          00000000003E000000FF0000003E000000FF000000000000000001020404021A
          4856034BD5FF034BD5FF034BD5FF034BD5FF034BD5FF01194654000000000000
          0000000000FF0000003E00000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000686868FF686868FF686868FF686868FF686868FF6868
          68FF686868FF686868FF686868FF686868FF686868FF686868FF000000000000
          00000000000000000000686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF000000000000
          00000000000000000000686868FFFFFFFFFF894717FF894717FFFFFFFFFF0580
          FEFF0580FEFFFFFFFFFF190FB5FF190FB5FFFFFFFFFF686868FF000000000000
          00000000000000000000686868FFFFFFFFFF894717FF894717FFFFFFFFFF0580
          FEFF0580FEFFFFFFFFFF190FB5FF190FB5FFFFFFFFFF686868FF000000000000
          00000000000000000000686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0580
          FEFF0580FEFFFFFFFFFF190FB5FF190FB5FFFFFFFFFF686868FFFD7E0DFFFD7E
          0DFFFD7E0DFFDD6E0CFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0580
          FEFF0580FEFFFFFFFFFF190FB5FF190FB5FFFFFFFFFF686868FFFD7E0DFFFAD8
          B7FFFAD8B7FFD59356FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF190FB5FF190FB5FFFFFFFFFF686868FFFD7E0DFFFAD8
          B7FFFAD8B7FFD59356FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF190FB5FF190FB5FFFFFFFFFF686868FFFD7E0DFFFFEF
          DAFFFFEFDAFFD59356FF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFD7E0DFFF4A9
          62FFF4A962FFD59356FF686868FF686868FF686868FF686868FF686868FF6868
          68FF686868FF686868FF686868FF686868FF686868FF686868FFFD7E0DFFFAD8
          B7FFFAD8B7FFD59356FFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDEDEFFDEDE
          DEFFDD6E0CFF0000000000000000000000000000000000000000FD7E0DFFFFEF
          DAFFFFEFDAFFF4A962FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFD7E0DFF0000000000000000000000000000000000000000FD7E0DFFF4A9
          62FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A9
          62FFFD7E0DFF0000000000000000000000000000000000000000FD7E0DFFFEB5
          6EFFFEB56EFFF4A962FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8
          B7FFFD7E0DFF0000000000000000000000000000000000000000FD7E0DFFFEB5
          6EFFFEB56EFFF4A962FFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEF
          DAFFFD7E0DFF0000000000000000000000000000000000000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFF0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001000000020000000000000000000000C7000000FF000000FF000000FF050C
          0FFF000000FF000000FF000000FF030303DF0000000000000000000000000000
          000000000000000000020000000B0101019D000000FF000000FF071216FF53D2
          FEFF205D72FF000000FF0D0D0DFF292929B30000000000000000000000005D5C
          5BFF4D4F52FF47576DFF425E8BFF333C5BFF222121FF020507FF53D2FEFF53D2
          FEFF53D2FEFF0C1820FF1F1F1FC8364271D9242A479D00000000000000009391
          90FF92908EFF8D8C8EFF70809AFF4969A6FF224177FF37465DFF223F9FFF163A
          B3FF1C3A9AFF334265F72F4166F5393F6CE42428449E00000000000000009795
          94FF969393FFE4E9F1FFBBC7DAFF7792C1FF3A4D7AFF4F5E91FF5AB8F7FF5FBA
          F7FF59B8F7FF122155CB343F63FA373D66DD171F326300000000000000009B9A
          99FF9A9897FFF6F8FAFFA6B6CFFF7A92B8FF3D5180FF4389CDFF6DC0F8FF86CB
          F9FF68BEF8FF449DEEFF343F64FA324068D01B293F700000000000000000A09E
          9DFF9E9D9CFFFFFFFFFFD6DDE8FF8399BDFF3E4F7BFF57A6E0FFA0D6FAFFD9EF
          FDFF79C5F9FF4FA7E6FF364670FC334C7BD90D141F380000010100000000A5A4
          A1FFA3A1A0FFFFFFFFFFE1E6EEFF9AACC8FF405380FF4882B7FF7DC7F9FFA1D7
          FBFF63BCF8FF4083BFFF3B4A73FE21324E9B070A0F1C0000010100000000A9A8
          A7FFA8A6A5FFFFFFFFFFF1F3F4FFABB9CEFF4F6EA9FF3C4F7AFF4C94CDFF56AF
          ECFF509BD5FF3C5381FF3C5080FA0B111B4B010102040000000000000000AEAC
          AAFFACABA9FFFFFFFFFFECECECFFCCD1DAFF5B7DBCFF3E5FA0FF3B4E7DFF3B49
          73FF3B4E7DFF3C5C97FE3C5084EF02030425000000010000000000000000B3B1
          AFFFB1AFAEFFFFFFFFFFE0DFDFFFCF6013FF9A624BFF407ED7FF478AFFFF3E7F
          EEFF3E81F7FF4268ADFD1B26418600000112000000010000000000000000B7B5
          B4FFB5B4B1FFFFFFFFFFD06012FFFC8C26FFEC8830FF96614EFF417AD0FF4579
          DCFF4975CBFF33589ACD0000011A00000105000000010000000000000000BBB8
          B7FFBAB8B5FFD06012FFFEBF76FFFEBF76FFFEBE76FFFEBE76FFD06012FFB0AE
          ADFFAEADABFF000000000000000000000001000000000000000000000000BEBC
          BAFFBDBBB9FFD06012FFFFF1C7FFFFF1C7FFFFF1C7FFFFF1C7FFD06012FFB4B2
          B0FFB2B1AFFF0000000000000000000000000000000000000000000000000000
          000000000000D06012FFD06012FFD06012FFD06012FFD06012FFD06012FF0000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000064010101FF0000
          008B000000000000000000000064010101FF0000008B00000000000000000000
          000500000007000000070000000E0000000C0000001E010101FF010101FF0101
          01FF0000000700000016010101FF010101FF010101FF00000000000000000000
          0045000000450000004500000045000000450000006E000000B8010101FF0000
          00AC00000045000000380000009E010101FF0000006400000000000000005D5C
          5BFF4E4D4DFF4B4A49FF4B4A49FF4B4A49FF2B2B2BFF252525FF1E1E1EFF1818
          18FF131313FF0E0E0EFF00000038000000160000000000000000000000009391
          90FF92908EFF908E8DFF8F8C8BFF6E6C6CFF323232FFBEBEBEFF979797FF9797
          97FF979797FF131313FF00000000000000000000000000000000000000009795
          94FF969393FFFFFFFFFFFFFFFFFFC7C7C7FF393939FFB3B3B3FF808080FF6F6F
          6FFF6F6F6FFF1A1A1AFF141414FF000000000000000000000000000000009B9A
          99FF9A9897FFFFFFFFFFFFFFFFFFC7C7C7FF404040FFB4B4B4FF868686FF7676
          76FF626262FF606060FF1A1A1AFF00000000000000000000000000000000A09E
          9DFF9E9D9CFFFFFFFFFFFFFFFFFFC7C7C7FF474747FFC2C2C2FF9D9D9DFFA6A6
          A6FF929292FF848484FF222222FF1B1B1BFF161616FF0000000000000000A5A4
          A1FFA3A1A0FFFFFFFFFFFFFFFFFFC5C5C4FF4C4C4CFFD0D0D0FFC5C5C5FFC8C8
          C8FFC4C4C4FFC1C1C1FFC1C1C1FFC1C1C1FF1C1C1CFF0000000000000000A9A8
          A7FFA8A6A5FFFFFFFFFFF7F8F7FFBDBEBDFF515151FF4C4C4CFF484848FF4242
          42FF3C3C3CFF383838FF2F2F2FFF484848FF232323FF0000000000000000AEAC
          AAFFACABA9FFFFFFFFFFEDECECFFB4B3B3FFAEAEADFFA9A9A8FFC7C7C7FF7E7D
          7CFF7D7C7AFF0000003800000038000000382A2A2AFF0000000000000000B3B1
          AFFFB1AFAEFFFFFFFFFFE0DFDFFFD06012FFD06012FFCBCACAFFFFFFFFFFA7A5
          A3FFA5A3A1FF000000000000000000000038323232FF2B2B2BFF00000000B7B5
          B4FFB5B4B1FFFFFFFFFFD06012FFFD8C25FFFD8C25FFD06012FFFFFFFFFFABAA
          A8FFA9A8A6FF000000000000000000000038000000380000000000000000BBB8
          B7FFBAB8B5FFD06012FFFEBF76FFFEBF76FFFEBE76FFFEBE76FFD06012FFB0AE
          ADFFAEADABFF000000000000000000000000000000000000000000000000BEBC
          BAFFBDBBB9FFD06012FFFFF1C7FFFFF1C7FFFFF1C7FFFFF1C7FFD06012FFB4B2
          B0FFB2B1AFFF0000000000000000000000000000000000000000000000000000
          000000000000D06012FFD06012FFD06012FFD06012FFD06012FFD06012FF0000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000CB680DFFC5640DFFBD610DFFB65E0CFFB05A0BFFAA57
          0BFFA5540BFFA0520BFF9C500AFF9B4F0AFF0000000000000000000000000000
          00050000000700000010D56D0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF9D500AFF0000000000000000000000000000
          0045000000450000004CDE710FFFFFFFFFFFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
          B3FFFFFFFFFFFFFFFFFFFFFFFFFFA4530AFFC77A31FFC67932FF000000005D5C
          5BFF4E4D4DFF484746FFE67610FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFAC580BFFDDDBDAFFC87A31FF000000009391
          90FF92908EFF8B8988FFEC7910FFFFFFFFFFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
          B3FFB3B3B3FFB3B3B3FFFFFFFFFFB45C0CFFD6D5D3FFCE7A30FF000000009795
          94FF969393FFDBDBDBFFEE7A10FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFBD610DFFD0CFCDFFD57F31FF000000009B9A
          99FF9A9897FFDBDBDBFFEE7A10FFEE7A10FFEE7A10FFEB790FFFE6760FFFE174
          0FFFDB700EFFD56D0EFFCF690EFFC7660DFFC9C8C7FFDC8230FF00000000A09E
          9DFF9E9D9CFFDBDBDBFFDBDBDBFFDBDBDBFFFF983CFFF2F2F0FFEEEDEBFFE8E8
          E5FFE1E1DFFFDAD9D7FFD2D1D0FFCBCAC8FFC4C2C2FFE4852FFF00000000A5A4
          A1FFA3A1A0FFFFFFFFFFFFFFFFFFD8D8D8FFFF983CFFFF983CFFFF983CFFFF99
          38FFFF9635FFFF9231FFFF902DFFF98F2EFFF38B2EFFEC892EFF00000000A9A8
          A7FFA8A6A5FFFFFFFFFFF7F8F7FFD0D1D0FFCBCBCBFFC6C5C5FFDBDBDBFF9796
          95FF969593FF000000090000000900000009000000090000000000000000AEAC
          AAFFACABA9FFFFFFFFFFEDECECFFE7E6E6FFDFDFDEFFD8D8D7FFFFFFFFFFA2A0
          9FFFA09F9CFF000000000000000000000000000000000000000000000000B3B1
          AFFFB1AFAEFFFFFFFFFFE0DFDFFFD06012FFD06012FFCBCACAFFFFFFFFFFA7A5
          A3FFA5A3A1FF000000000000000000000000000000000000000000000000B7B5
          B4FFB5B4B1FFFFFFFFFFD06012FFFD8C25FFFD8C25FFD06012FFFFFFFFFFABAA
          A8FFA9A8A6FF000000000000000000000000000000000000000000000000BBB8
          B7FFBAB8B5FFD06012FFFEBF76FFFEBF76FFFEBE76FFFEBE76FFD06012FFB0AE
          ADFFAEADABFF000000000000000000000000000000000000000000000000BEBC
          BAFFBDBBB9FFD06012FFFFF1C7FFFFF1C7FFFFF1C7FFFFF1C7FFD06012FFB4B2
          B0FFB2B1AFFF0000000000000000000000000000000000000000000000000000
          000000000000D06012FFD06012FFD06012FFD06012FFD06012FFD06012FF0000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000011A4B5A0349D4FF0349D4FF0349D4FF0349D4FF0349D4FF0349
          D4FF0349D4FF0349D4FF0349D4FF01163F4C0000000000000000000000000000
          0000000000000349D4FF50B3FEFF5FC1FEFF6ACCFEFF72D3FEFF75D6FEFF74D5
          FEFF70D2FEFF66C7FEFF5ABDFEFF0349D4FF0000000000000000000000000000
          000000000000034CD2FF47A8F7FF54B4F7FF5EBEF7FF65C4F7FF68C7F7FF67C6
          F7FF63C2F7FF5AB9F7FF50B0F8FF034BD2FF0000000000000000000000000000
          0000000000000350D7FF40A4FEFF4BAEFEFF0250D7FF0350D7FF0350D7FF0350
          D7FF0350D7FF0350D7FF0350D7FF011A4A5A0000000000000000000000000000
          000000000000010E272E0252D8FF40A4FEFF47AAFEFF0353D9FF010D262E0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000010E272E0358DAFF3C9FFEFF3FA3FEFF0357DBFF010D
          262E000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000010E272E035CDCFF3296FDFF3296FDFF025B
          DCFF010D262E0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000010E272E035FDEFF2A8DFDFF298E
          FDFF0260DEFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000010E272E0263E0FF2286FDFF2387FDFF0364
          E0FF010D262E0000000000000000000000000000000000000000000000000000
          00000000000000000000010E272E0263E0FF1C81FDFF1C81FDFF0267E2FF010D
          262E000000000000000000000000000000000000000000000000000000000000
          000000000000010E272E026BE3FF1A7EFDFF1B7EFDFF026BE3FF010D262E0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000026EE5FF197EFDFF197EFDFF026DE5FF036EE5FF036DE5FF026D
          E5FF026DE4FF026DE5FF026FE4FF0121444C0000000000000000000000000000
          0000000000000271E6FF187DFDFF187DFDFF187DFDFF197EFDFF197EFDFF197E
          FDFF197EFDFF187DFDFF187DFDFF0270E6FF0000000000000000000000000000
          0000000000000274E7FF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AF
          FEFF73AFFEFF73AFFEFF73AFFEFF0274E7FF0000000000000000000000000000
          000000000000012A525A0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276
          E8FF0276E8FF0276E8FF0276E8FF012A525A0000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000412003739148
          07FF8F4708FF8D4708FF8C4607FF8A4507FF884507FF41200373011A4B5A0349
          D4FF0349D4FF0349D4FF0349D4FF0349D4FF0349D4FF023CAEFF9D4E08FFFD8E
          29FFFE8D26FFFD8B24FFFD8A22FFFD8920FFFD881EFF904707FF0349D4FF50B3
          FEFF5FC1FEFF6ACCFEFF72D3FEFF75D6FEFF74D5FEFF5CACD0FFA85509FFFD96
          35FFA45208FFA25108FFA05008FF9E4F08FF9C4E08FF41200373034CD2FF47A8
          F7FF54B4F7FF5EBEF7FF65C4F7FF68C7F7FF67C6F7FF519FCAFF6C94A8FFB45A
          0AFFFD9D40FFAE5709FF412003730000000000000000000000000350D7FF40A4
          FEFF4BAEFEFF0250D7FF0350D7FF0350D7FF0350D7FF0350D7FF0242B0FF324D
          92FFBF5E0AFFFDA44BFFB95D0AFF000000000000000000000000010E272E0252
          D8FF40A4FEFF47AAFEFF0353D9FF010D262E0000000000000000000000005229
          0454CB660AFFFDAE5CFFC6630AFF00000000000000000000000000000000010E
          272E0358DAFF3C9FFEFF3FA3FEFF0357DBFF010D262E0000000052290454DA6D
          0CFFFEBB6FFFD76B0BFF52290454000000000000000000000000000000000000
          0000010E272E035CDCFF3296FDFF3296FDFF025BDCFF010D262EE9740CFFFEC7
          84FFE4710BFF7038067300000000000000000000000000000000000000000000
          000000000000010E272E035FDEFF2A8DFDFF298EFDFF0260DEFFF3790DFFFED2
          95FFEF770CFFED760CFFEB750CFFEA740CFFE7730CFF70380673000000000000
          0000010E272E0263E0FF2286FDFF2387FDFF0364E0FF010D262EFB7D0DFFFFDC
          A5FFFED9A2FFFED79EFFFED59BFFFED397FFFED193FFF0770DFF00000000010E
          272E0263E0FF1C81FDFF1C81FDFF0267E2FF010D262E0000000070380673FD7E
          0DFFFD7E0DFFFD7E0DFFFC7E0DFFFB7D0DFFF97C0DFF70380673010E272E026B
          E3FF1A7EFDFF1B7EFDFF026BE3FF010D262E0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000026EE5FF197E
          FDFF197EFDFF026DE5FF036EE5FF036DE5FF026DE5FF026DE4FF026DE5FF026F
          E4FF0121444C00000000000000000000000000000000000000000271E6FF187D
          FDFF187DFDFF187DFDFF197EFDFF197EFDFF197EFDFF197EFDFF187DFDFF187D
          FDFF0270E6FF00000000000000000000000000000000000000000274E7FF73AF
          FEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AF
          FEFF0274E7FF0000000000000000000000000000000000000000012A525A0276
          E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276
          E8FF012A525A0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000E0F
          0E32444B45FF444B45FF444B45FF0A0B0A280000000000000000011A4B5A0349
          D4FF0349D4FF0349D4FF0349D4FF0349D4FF0349D4FF0349D4FF0349D4FF4B53
          4DFFD0D8D2FFD0D8D2FFD0D8D2FF454C46FF00000000000000000349D4FF50B3
          FEFF5FC1FEFF6ACCFEFF72D3FEFF75D6FEFF74D5FEFF70D2FEFF66C7FEFF5159
          54FFD8DED9FFD8DED9FFD8DED9FF4B514CFF0000000000000000034CD2FF47A8
          F7FF54B4F7FF5EBEF7FF65C4F7FF68C7F7FF67C6F7FF63C2F7FF56A8DCFF5A5F
          5CFFE3E7E4FFE3E7E4FFE3E7E4FF515954FF090B0A26000000000350D7FF40A4
          FEFF4BAEFEFF0250D7FF0350D7FF0350D7FF0350D7FF0350D7FF0C4FC1FF6269
          67FFEEF0EEFFEEF0EEFFEDF0EEFF565C59FF11141246000000000252D8FF40A4
          FEFF47AAFEFF0353D9FF010D262E0000000000000000090B0A266D7270FFEFF1
          F0FFF7F9F8FFF6F8F7FFF4F6F4FFEBEDECFF5A615EFF11141246010E272E0358
          DAFF3C9FFEFF3FA3FEFF0357DBFF010D262E00000000757B7AFFF7F8F8FFFCFD
          FDFFF7F7F7FF666B69FFF5F6F5FFFAFBFAFFF4F5F4FF5F6662FF00000000010E
          272E035CDCFF3296FDFF3296FDFF025BDCFF010D262E7C8080FFFFFFFFFFFFFF
          FFFF757A7AFF000000006E7372FFFDFEFEFFFDFEFDFF666C6AFF000000000000
          0000010E272E035FDEFF2A8DFDFF298EFDFF0260DEFF777C7BFFFFFFFFFFFFFF
          FFFF7B8080FF00000000747A79FFFFFFFFFFFFFFFFFF6D7371FF00000000010E
          272E0263E0FF2286FDFF2387FDFF0364E0FF010D262E11141246828687FFFFFF
          FFFF808484FF000000007A807FFFFFFFFFFF777C7BFF090B0A26010E272E0263
          E0FF1C81FDFF1C81FDFF0267E2FF010D262E0000000000000000111412468387
          88FF838788FF000000007F8384FF7D8282FF1114124600000000026BE3FF1A7E
          FDFF1B7EFDFF026BE3FF010D262E000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000026EE5FF197E
          FDFF197EFDFF026DE5FF036EE5FF036DE5FF026DE5FF026DE4FF026DE5FF026F
          E4FF0121444C00000000000000000000000000000000000000000271E6FF187D
          FDFF187DFDFF187DFDFF197EFDFF197EFDFF197EFDFF197EFDFF187DFDFF187D
          FDFF0270E6FF00000000000000000000000000000000000000000274E7FF73AF
          FEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AF
          FEFF0274E7FF0000000000000000000000000000000000000000012A525A0276
          E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276
          E8FF012A525A0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000022E7F97034ED6FF034D
          D6FF034CD6FF034CD5FF034BD5FF034AD5FF034AD4FF01246A7F000000000000
          000000000000000000000000000000000000000000000252D8FF66C7FEFF66C7
          FEFF66C7FEFF66C7FEFF66C7FEFF66C7FEFF66C7FEFF034CD5FF000000000000
          000000000000000000000000000000000000000000000357DAFF66C7FEFF66C9
          FEFF0253D9FF0252D8FF0251D8FF0350D7FF0350D7FF012E7F97000000000000
          00000000000000000000000000000000000000000000000C2026025BDCFF5CBF
          FEFF5DBEFEFF0355DAFF000C2026000000000000000000000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFEE770CFFFD7E0DFFFD7E0DFFCB712AFF035D
          DDFF52B4FEFF52B4FDFF0358DAFF000C20260000000000000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFBDBCBCFFFFFFFFFFFAF9FAFFB8B6B6FFECEBEBFFC2CD
          E1FF0260DEFF47A9FEFF46AAFDFF035CDCFF0000000000000000FD7E0DFFFFFF
          FFFFF0F0F0FFFFFFFFFFBDBCBCFFFFFFFFFFF3F2F2FFB6B4B4FFE5E3E4FFBEC8
          DCFF0365E1FF3B9EFDFF3B9EFDFF0261DFFF0000000000000000FD7E0DFFEBEB
          EBFFBDBCBCFFBDBCBCFFBDBCBCFFBDBCBCFFB6B4B4FFB3B2B2FF97A1B5FF0369
          E2FF3194FEFF3094FDFF0267E1FF000C20260000000000000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFBDBCBCFFFCFBFBFFE6E5E6FF97A1B5FF026FE4FF278A
          FDFF278BFDFF026CE3FF000C2026000000000000000000000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFBCBBBBFFE8E7E7FFE1DFDFFF0271E6FF1F83FEFF1F84
          FEFF0270E6FF0270E6FF036EE4FF026DE4FF026CE4FF01408697FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0275E8FF73AFFEFF73AF
          FEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF026FE6FFFD7E0DFFFED0
          9CFFFED09CFFFDCF9CFFFED09CFFFED09DFFFDD09DFF799EC6FF0276E8FF0276
          E8FF0274E7FF0274E7FF0274E7FF0274E7FF0273E7FF01448997FD7E0DFFFDB5
          6FFFFDB66EFFFEB56EFFFEB66FFFFEB56EFFFEB66FFFFEB66EFFFEB66EFFFEB5
          6EFFFEB56FFFFD7E0DFF00000000000000000000000000000000FD7E0DFFFD9B
          41FFFE9B40FFFD9C41FFFD9B40FFFE9B41FFFD9B40FFFD9B40FFFD9B41FFFD9B
          40FFFE9B41FFFD7E0DFF00000000000000000000000000000000FD7E0DFFFEC3
          8EFFFEC38EFFFEC38EFFFEC38EFFFEC38EFFFEC38EFFFEC38EFFFEC38EFFFEC3
          8EFFFEC38EFFFD7E0DFF00000000000000000000000000000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFF00000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000072026010EBFFF000720260000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000072026010EBFFF478EFEFF010EBFFF0007202600000000022E7F97034E
          D6FF034DD6FF034CD6FF034CD5FF034BD5FF034AD5FF034AD4FF01246A7F0000
          00000412C0FF478EFEFF478EFEFF478EFEFF010EBFFF000000000252D8FF66C7
          FEFF66C7FEFF66C7FEFF66C7FEFF66C7FEFF66C7FEFF66C7FEFF034CD5FF0000
          0000000000000817C2FF478EFEFF0313C1FF00000000000000000357DAFF66C7
          FEFF66C9FEFF0253D9FF0252D8FF0251D8FF0350D7FF0350D7FF012E7F970000
          0000000000000E21C4FF478EFEFF091AC3FF0000000000000000000C2026025B
          DCFF5CBFFEFF5DBEFEFF0355DAFF000C20260000000000000000000000000000
          0000000000001F39CCFF1B35CBFF1930C9FF000000000000000000000000000C
          2026035DDDFF52B4FEFF52B4FDFF0359DBFF000C202600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000C20260260DEFF47A9FEFF46AAFDFF035CDCFF00000000000000000000
          000000000000258A3EFF258A3EFF258A3EFF0000000000000000000000000000
          0000000C20260365E1FF3B9EFDFF3B9EFDFF0261DFFF00000000000000000000
          000000000000258A3EFF03CC87FF258A3EFF000000000000000000000000000C
          20260369E2FF3194FEFF3094FDFF0267E1FF000C202600000000000000000000
          000000000000258A3EFF03CC87FF258A3EFF0000000000000000000C2026026F
          E4FF278AFDFF278BFDFF026CE3FF000C20260000000000000000000000000000
          0000258A3EFF03CC87FF03CC87FF03CC87FF258A3EFF000000000271E6FF1F83
          FEFF1F84FEFF0270E6FF0270E6FF036EE4FF026DE4FF026CE4FF014086970000
          000006150926258A3EFF03CC87FF258A3EFF06150926000000000275E8FF73AF
          FEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF026FE6FF0000
          00000000000006150926258A3EFF0A2611460000000000000000114986970276
          E8FF0276E8FF0274E7FF0274E7FF0274E7FF0274E7FF0273E7FF014489970000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0000000000000000FD7E
          0DFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFDDDCDCFFFBFBFBFFF9F8F8FFF7F7F6FFFD7E0DFF0000000000000000FD7E
          0DFFFFFFFFFFFFFFFFFFFFFFFFFFBDBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9
          FAFFB8B6B6FFECEBEBFFE4E3E3FFF5F4F4FFFD7E0DFF0000000000000000FD7E
          0DFFFFFFFFFFFFFFFFFFFFFFFFFFBDBCBCFFFFFFFFFFFFFFFFFFFAFAF9FFF3F2
          F2FFB6B4B4FFE5E3E4FFDFDDDDFFF3F3F2FFFD7E0DFF0000000000000000FD7E
          0DFFDDDDDDFFBDBCBCFFBDBCBCFFBDBCBCFFBDBCBCFFBCBABAFFB9B7B7FFB6B4
          B4FFB3B2B2FFB1AFAFFFAEACACFFD8D8D8FFFD7E0DFF0000000000000000FD7E
          0DFFFFFFFFFFFFFFFFFFFFFFFFFFBDBCBCFFFCFBFBFFF4F4F4FFEEEEEDFFE6E5
          E6FFB1AFAFFFD9D7D7FFD2D1D1FFF0F0EFFFFD7E0DFF0000000000000000FD7E
          0DFFFFFFFFFFFFFFFFFFFFFFFFFFBCBBBBFFF6F5F5FFF0EEEEFFE8E7E7FFE1DF
          DFFFAFADADFFD4D2D2FFCECBCBFFEFEEEEFFFD7E0DFF0000000000000000FD7E
          0DFFFFFFFFFFFFFFFFFFFEFEFEFFD3D3D3FFFBFAFAFFF8F8F8FFF6F6F6FFF4F4
          F4FFD9D8D8FFF0F0F0FFEFEEEEFFEEEDEDFFFD7E0DFF0000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFFE9D6FFFFE9D6FFFD7E0DFFFD7E0DFFFD7E0DFF0000000000000000FD7E
          0DFFFED09CFFFED09CFFFDCF9CFFFED09CFFFED09DFFFED09CFFFED09CFFFFF7
          EEFF000000FF000000FFFFF7EEFFFED09CFFFD7E0DFF0000000000000000FD7E
          0DFFFDB56FFFFDB66EFFFEB56EFFFEB66FFFFEB56EFFFDB66EFFFFF3E7FF0000
          00FF000000FF000000FF000000FFFFF3E7FFFD7E0DFF0000000000000000FD7E
          0DFFFD9B41FFFE9B40FFFD9C41FFFD9B40FFFE9B41FFFD9B40FFFED6B1FFFED6
          B0FF000000FF000000FFFEDEC0FFFFD6B1FFFD7E0DFF0000000000000000FD7E
          0DFFFEC38EFFFEC38EFFFEC38EFFFEC38EFFFEC38EFFFEC38EFFFEC38EFFFFE6
          D0FF000000FF000000FFFFEBDAFFFEC38EFFFD7E0DFF0000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0000000000000000FD7E
          0DFFF0CDADFFEDCAAAFFEAC8A8FFF4A962FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFBFBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000000000000000FD7E
          0DFFF3D0B0FFF0CEADFFEDCAAAFFF4A962FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB3B2B2FFFFFFFFFFFFFFFFFFFCFDFCFFFD7E0DFF0000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFF4A962FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB3B2B2FFFFFFFFFFFCFDFCFFFAF9F9FFFD7E0DFF0000000000000000FD7E
          0DFFF4A962FFF4A962FFF4A962FFF4A962FFC9C9C9FFBFBEBEFFB3B2B2FFB3B2
          B2FFB3B2B2FFB3B2B2FFB3B2B2FFBEBDBDFFFD7E0DFF0000000000000000FD7E
          0DFFFBD9B8FFF8D7B5FFF6D4B3FFF4A962FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB3B2B2FFFAF9F9FFF7F5F5FFF2F2F1FFFD7E0DFF0000000000000000FD7E
          0DFFFDDBBAFFFBDAB8FFF8D7B6FFF4A962FFFFFFFFFFFFFFFFFFFFFFFFFFFCFD
          FCFFB3B2B2FFF6F6F6FFF2F1F1FFEEEDEDFFFD7E0DFF0000000000000000FD7E
          0DFFFFDDBCFFFDDCBAFFFBD9B8FFF4A962FFFFFFFFFFFFFFFFFFFDFDFDFFF9FA
          F9FFB3B2B2FFF2F1F1FFEDEDECFFE9E8E7FFFD7E0DFF0000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFF4A962FFFFFFFFFFFDFCFCFFF9F9F9FFF6F6
          F5FFBDBCBCFFEDEDECFFE9E8E7FFE4E3E2FFFD7E0DFF0000000000000000FD7E
          0DFFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A9
          62FFF4A962FFF4A962FFF4A962FFF4A962FFFD7E0DFF0000000000000000FD7E
          0DFFFEB56EFFFEB56EFFFEB56EFFF4A962FFF2D1B0FFF2D0B0FFF2D0B0FFF3D0
          B0FFF4A962FFF2D1B0FFF2D0B0FFF2D1B0FFFD7E0DFF0000000000000000FD7E
          0DFFFEB56EFFFEB56EFFFEB56EFFF4A962FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8
          B7FFF4A962FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFF0000000000000000FD7E
          0DFFFEB56EFFFEB56EFFFEB56EFFF4A962FFFFEFDAFFFFEFDAFFFFEFDAFFFFEF
          DAFFF4A962FFFFEFDAFFFFEFDAFFFFEFDAFFFD7E0DFF0000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000007090832232B
          24FF232B24FF232B24FF05060528000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002B352EFFC3CC
          C5FFC3CCC5FFC3CCC5FF242D26FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000333C36FFC5CE
          C7FFC5CEC7FFC5CEC7FF2B332DFF000000000000000000000000000000000000
          00000000000000000000000000000000000000000000040605263D433FFFCCD4
          CFFFCCD4CFFFCCD4CFFF333C36FF040605260000000000000000000000000000
          0000000000000000000000000000000000000000000004060526474F4CFFD6DC
          D7FFD6DCD7FFD6DCD7FF383F3CFF080B0946000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFDC7110FF535957FFCACFCCFFFFFF
          FFFFFFFFFFFFFFFFFFFFBBC1BDFF3D4542FF080B09460000000000000000FD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FF5D6463FFD4D7D6FFFFFFFFFFCFD4
          D2FF4B514FFFC5CEC8FFFFFFFFFFC0C7C2FF434B47FF0000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFF656A6AFFFAFEFEFFFFFFFFFF5D63
          63FF00000000555A59FFFFFFFFFFFFFFFFFF4B5250FF0000000000000000FD7E
          0DFFF4A962FFF4A962FFF4A962FFF4A962FF5F6564FFDBDEDDFFFDFFFFFF646A
          6AFF000000005C6362FFFFFFFFFFD1D6D5FF535A58FF0000000000000000FD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFBDA88EFF6C7172FFDBDEDDFF6A6E
          6EFF00000000636A69FFD9DDDBFF5F6564FF040605260000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFC1B8A7FF6D7273FF6D72
          73FF00000000696D6EFF666C6CFF080B0946000000000000000000000000FD7E
          0DFFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFFD7E0DFF0000
          000000000000000000000000000000000000000000000000000000000000FD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFF0000
          000000000000000000000000000000000000000000000000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFD7E0DFF0000
          000000000000000000000000000000000000000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001C6699FF113C5B970511192A000101020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000C2B406B1C6699FF1C6699FF1C6699FF0C2739620305060E000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001C6699FF79C4F8FF1C6699FF216492FF09883BFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000D2F46751F6395FF79CFF5FF009039FF009D2EFF009039FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001030508206694FF157D3EFF1FCC67FF009D2EFF009D2EFF0090
          39FF00000000000000000000000000000000000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFF009039FF1FCC67FF54DC7BFF1FCC67FF009D2EFF009D
          2EFF009039FF000000000000000000000000000000000000000000000000FD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FF009039FF1FCC67FF54DC7BFF1FCC67FF009D
          2EFF009D2EFF009039FF0000000000000000000000000000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFF4A962FF009039FF1FCC67FF54DC7BFF1FCC
          67FF00C55CFF009D2EFF009039FF00000000000000000000000000000000FD7E
          0DFFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FF009039FF1FCC67FF54DC
          7BFF1FCC67FF00C55CFF0336DAFF0336DAFF000000000000000000000000FD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFF4A962FFFFFFFFFFFAD8B7FF009039FF1FCC
          67FF54DC7BFF0336DAFF0336DAFF66B1FEFF0336DAFF0000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFF4A962FFFFFFFFFFFFFFFFFFFFEFDAFF0090
          39FF0336DAFF0336DAFF66B1FEFF1F63FEFF034DE4FF0336DAFF00000000FD7E
          0DFFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFFD7E
          0DFF0336DAFF66B1FEFF66B1FEFF3B82FDFF0A42E4FF0336DAFF00000000FD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E
          0DFF000000000336DAFF3B82FDFF1E57E4FF0336DAFF0000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFD7E
          0DFF00000000000000000336DAFF0336DAFF000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFF000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010000000100000001000000000000000000000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0000
          0000FD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFCBCACAFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFD7E0DFFFD7E0DFFCBCA
          CAFFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFCBCACAFFFD7E0DFF0000
          0000FD7E0DFFF4A962FFF4A962FFF4A962FFF4A962FFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFD7E0DFFFD7E0DFFCBCA
          CAFFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFCBCACAFFFD7E0DFF0000
          0000FD7E0DFFF4A962FFF4A962FFF4A962FFF4A962FFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFCBCACAFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000
          0000FD7E0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0000
          0000FD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001000000010000000100000000000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0000000000000000FD7E
          0DFFFEE2C6FFFDC996FFFDCA96FFFEE3C6FFFD7E0DFF00000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000000000000000FD7E
          0DFFFEECDAFFFDDDBAFFFEDCBAFFFEECDAFFFD7E0DFF00000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000000000000000FD7E
          0DFFFEF2E5FFFFE7CFFFFEE7CFFFFEF2E5FFFD7E0DFF00000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000000000000000FD7E
          0DFFFEF8F0FFFFF1E2FFFEF1E3FFFEF8F0FFFD7E0DFF00000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000000000000000FD7E
          0DFFFEFCF9FFFFFCF9FFFFFCF9FFFFFCF9FFFD7E0DFF00000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF0000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0000000000000000FD7E
          0DFFFEC48EFFFEC48EFFFEC48EFFFEC48EFFFD7E0DFF00000000FD7E0DFFFEE7
          D0FFFDCA96FFFDCA96FFFDCA96FFFEE7D0FFFD7E0DFF0000000000000000FD7E
          0DFFFEC48EFFFEC48EFFFEC48EFFFEC48EFFFD7E0DFF00000000FD7E0DFFFEEC
          DAFFFEDCBAFFFEDCBAFFFEDDBBFFFEECDAFFFD7E0DFF0000000000000000FD7E
          0DFFFEC48EFFFEC48EFFFEC48EFFFEC48EFFFD7E0DFF00000000FD7E0DFFFEF2
          E5FFFEE6CFFFFEE7CFFFFFE6CFFFFEF2E5FFFD7E0DFF0000000000000000FD7E
          0DFFFEC48EFFFEC48EFFFEC48EFFFEC48EFFFD7E0DFF00000000FD7E0DFFFEF8
          F0FFFEF8F0FFFFF8F0FFFEF8F0FFFEF8F0FFFD7E0DFF0000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFC7E0DFFFC7E0DFFFC7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000FD7E
          0DFF2E73FEFF2E73FEFF2D73FEFF2D73FEFF2E73FEFF2D73FEFFF4A962FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF00000000FD7E
          0DFF438AFEFF428AFEFF438AFEFF438AFEFF428AFEFF428AFEFFF4A962FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF00000000FD7E
          0DFF58A2FEFF57A1FEFF57A2FEFF57A1FEFF57A1FEFF58A1FEFFF4A962FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF00000000FD7E
          0DFFA9D3FEFFA9D3FEFFA9D3FEFFA9D3FEFFA9D3FEFFA9D3FEFFF4A962FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF00000000FD7E
          0DFFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A9
          62FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFFD7E0DFF00000000FD7E
          0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A962FFFFBD
          5EFFFFBD5EFFFFBE5DFFFFBD5EFFFFBD5EFFFFBD5EFFFD7E0DFF00000000FD7E
          0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A962FFFFC2
          73FFFFC273FFFFC274FFFFC273FFFFC273FFFFC273FFFD7E0DFF00000000FD7E
          0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A962FFFFC8
          89FFFFC889FFFFC889FFFFC88AFFFFC889FFFFC889FFFD7E0DFF00000000FD7E
          0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A962FFFFE2
          C5FFFFE2C5FFFFE2C5FFFFE2C5FFFFE2C5FFFFE2C5FFFD7E0DFF00000000FD7E
          0DFFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A9
          62FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFFD7E0DFF00000000FD7E
          0DFF04D48FFF04D48FFF04D48FFF04D48FFF04D48FFF05D48FFFF4A962FF57E9
          FFFF57E8FFFF57E8FFFF57E8FFFF57E8FFFF57E8FFFFFD7E0DFF00000000FD7E
          0DFF06E09BFF06DF9BFF07DF9BFF06E09BFF07E09BFF06DF9AFFF4A962FF67EB
          FFFF67EBFFFF67EBFFFF67EAFFFF67EAFFFF67EBFFFFFD7E0DFF00000000FD7E
          0DFF08EBA6FF09EBA6FF08EBA7FF09EBA6FF08EBA6FF08EBA7FFF4A962FF57E8
          FFFF57E8FFFF57E8FFFF57E8FFFF57E8FFFF57E8FFFFFD7E0DFF00000000FD7E
          0DFF76F8D2FF76F8D2FF76F8D2FF76F8D2FF75F8D2FF75F8D2FFF4A962FFB9F5
          FFFFB9F5FFFFB9F5FFFFB9F5FFFFB9F5FFFFB9F5FFFFFD7E0DFF00000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8
          B7FFFD7E0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8
          B7FFFD7E0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
          FFFF3D3D3DFF383838FF323232FFFD7E0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8
          B7FFFD7E0DFF0F0F0FFF0B0B0BFF080808FFFFFFFFFF0000000000000000FFFF
          FFFF464646FFFFFFFFFFFFFFFFFFFD7E0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEF
          DAFFFD7E0DFFFFFFFFFFFFFFFFFF0D0D0DFFFFFFFFFF0000000000000000FFFF
          FFFF505050FFFFFFFFFFFFFFFFFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFFFFFFFFFFFFFFFF131313FFFFFFFFFF0000000000000000FFFF
          FFFF595959FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF1A1A1AFFFFFFFFFF0000000000000000FFFF
          FFFF595959FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF313131FFFFFFFFFF0000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFFFFFFFFFFFFFFFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0000000000000000FD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFFFFFFFFFFFFFFFFFD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFF0000000000000000FD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFFFFFFFFFFFFFFFFFD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFF0000000000000000FD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFFFFFFFFFFFFFFFFFFFD7E
          0DFFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFF0000000000000000FD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFD7E0DFF868686FF7F7F7FFFFD7E
          0DFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFD7E0DFF0000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFFFFFFFFFFFFFFFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000303
          03571C6699FF113C5B9D0511192B000101020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          01250E2C429D1C6699FF1C6699FF1C6699FF0C2739650305060E000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000030303571C6699FF79C4F8FF1C6699FF216492FF09883BFF000000000000
          0000000000000000000000000000000000000000000000000000FD7E0DFFFD7E
          0DFFD76B0CFF685D4CFF1F6395FF79CFF5FF009039FF009D2EFF009039FFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFF000000000000000000000000FD7E0DFF96BD
          FEFF93BBFBFF637FAAFF206694FF157D3EFF1FCC67FF009D2EFF009D2EFF0090
          39FFFFFFFFFFFFFFFFFFFD7E0DFF000000000000000002000003FD7E0DFF58A2
          FEFF57A1FEFF3C6DAAFF009039FF1FCC67FF54DC7BFF1FCC67FF009D2EFF009D
          2EFF009039FFFFFFFFFFFD7E0DFF000000000000000009000011FD7E0DFF66B1
          FEFF66B1FEFF66B1FEFF4677AAFF009039FF1FCC67FF54DC7BFF1FCC67FF009D
          2EFF009D2EFF009039FFFD7E0DFF000000000000000002000004FD7E0DFFF4A9
          62FFF4A962FFF4A962FFF4A962FFA37243FF009039FF1FCC67FF54DC7BFF1FCC
          67FF00C55CFF009D2EFF009039FF000000000000000000000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA37243FF009039FF1FCC67FF54DC
          7BFF1FCC67FF00C55CFF0336DAFF0336DAFF0000000000000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A962FFAB967FFF009039FF1FCC
          67FF54DC7BFF0336DAFF0336DAFF66B1FEFF0336DAFF00000000FD7E0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A962FFFFCC98FFAB8967FF0090
          39FF0336DAFF0336DAFF66B1FEFF1F63FEFF034DE4FF0336DAFFFD7E0DFFF4A9
          62FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFA372
          43FF0336DAFF66B1FEFF66B1FEFF3B82FDFF0A42E4FF0336DAFFFD7E0DFF04D4
          8FFF04D48FFF04D48FFF04D48FFF05D48FFFF4A962FF57E9FFFF57E8FFFF57E8
          FFFF3C9CABFF0336DAFF3B82FDFF1E57E4FF0336DAFF00000000FD7E0DFF08EB
          A6FF09EBA6FF09EBA6FF08EBA6FF08EBA7FFF4A962FF57E8FFFF57E8FFFF57E8
          FFFF57E8FFFF3C9CABFF0336DAFF0336DAFF0000000000000000FD7E0DFF76F8
          D2FF76F8D2FF76F8D2FF75F8D2FF75F8D2FFF4A962FFB9F5FFFFB9F5FFFFB9F5
          FFFFB9F5FFFFB9F5FFFFFD7E0DFF000000000000000000000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFF000000000000000000000000}
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
          00000000000000000000FD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF000000000000
          00000000000000000000FD7E0DFFF0CDADFFEAC8A8FFF4A962FFFFFFFFFFFFFF
          FFFFFFFFFFFFBFBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E0DFF000000000000
          00000000000000000000FD7E0DFFF3D0B0FFEDCAAAFFF4A962FFFFFFFFFFFFFF
          FFFFFFFFFFFFB3B2B2FFFFFFFFFFFFFFFFFFFCFDFCFFFD7E0DFF00000000021A
          4856034BD5FF034BD5FF034BD5FF034BD5FF034BD5FFA58A88FFFFFFFFFFFFFF
          FFFFFFFFFFFFB3B2B2FFFFFFFFFFFCFDFCFFFAF9F9FFFD7E0DFF034BD5FF0A56
          DCFF3E98F1FF65C6FEFF5BBDFEFF4CAEFEFF2882F1FF034BD5FF034BD5FFB3B2
          B2FFB3B2B2FFB3B2B2FFB3B2B2FFB3B2B2FFBEBDBDFFFD7E0DFF034BD5FF42A5
          FDFF5BBEFEFF65C6FEFF5BBDFEFF4CAEFEFF3A9DFEFF2A8EFEFF034BD5FFFFFF
          FFFFFFFFFFFFB3B2B2FFFAF9F9FFF7F5F5FFF2F2F1FFFD7E0DFF034BD5FF3A9D
          FEFF000000FF000000FF000000FF000000FF000000FF2A8EFEFF034BD5FFFFFF
          FFFFFCFDFCFFB3B2B2FFF6F6F6FFF2F1F1FFEEEDEDFFFD7E0DFF034BD5FF399C
          FEFF000000FF000000FF000000FF000000FF000000FF2A8EFEFF034BD5FFF9F9
          F9FFF6F6F5FFBDBCBCFFEDEDECFFE9E8E7FFE4E3E2FFFD7E0DFF034BD5FF399C
          FEFF3D81AFFF000000FF3F82AFFF4BAEFEFF3A9DFEFF2A8DFEFF034BD5FFF4A9
          62FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFFD7E0DFF034BD5FF399C
          FEFF58BBFEFF4689AFFF000000FF4BAEFEFF3A9DFEFF2A8EFEFF034BD5FFFAD8
          B7FFFAD8B7FFF4A962FFFAD8B7FFFAD8B7FFFAD8B7FFFD7E0DFF034BD5FF399C
          FEFF3D81AFFF000000FF3F82AFFF4CAEFEFF399DFEFF298FFEFF034BD5FFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF034BD5FF399C
          FEFF000000FF000000FF000000FF000000FF000000FF2A8DFEFF034BD5FF0000
          0000000000000000000000000000000000000000000000000000034BD5FF3A9D
          FEFF000000FF000000FF000000FF000000FF000000FF2A8EFEFF034BD5FF0000
          000000000000000000000000003E000000FF0000000000000000034BD5FF42A5
          FDFF5BBEFEFF65C6FEFF5BBDFEFF4BAEFEFF399EFEFF2A8EFEFF034BD5FF0000
          0000000000FF0000003E000000FF0000003E00000000000000000A56DCFF0A56
          DCFF3C96F1FF65C6FEFF5BBDFEFF4BAEFEFF2783F1FF034BD5FF034BD5FF0000
          0000000000FF000000FF0000003E00000000000000000000000001020404021A
          4856034BD5FF034BD5FF034BD5FF034BD5FF034BD5FF01194654000000000000
          0000000000FF000000FF000000FF000000000000000000000000}
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
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000817
          C2FF0817C2FF0817C2FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000817
          C2FF86EEFFFF0817C2FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000817
          C2FF7BE0FFFF0817C2FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000B1A
          C3FF6FD4FFFF0C1BC3FF00000000000000000000000000000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF794235FF192E
          CAFF78CFFFFF233DCFFF05082F3D000000000000000000000000FD7E0DFFFAD8
          B7FFFAD8B7FFF4A962FFFFFFFFFFFFFFFFFFFFFFFFFFB3B7DFFF1322C5FF68BE
          FFFF89D2FFFF5FB6FFFF1839D1FF03062E3C0000000000000000FD7E0DFFFAD8
          B7FFFAD8B7FFF4A962FFFFFFFFFFFFFFFFFFB3B7DEFF0C1BC3FF51ABFFFF77C3
          FFFF9DDFFFFF5DB2FFFF409EFFFF0E25C8FF02052D3B00000000FD7E0DFFFFEF
          DAFFFFEFDAFFF4A962FFFFFFFFFFE7E7E7FF0918C2FF3D9BFFFF58ADFFFF9FDF
          FFFF99DBFFFF65B8FFFF3797FFFF3493FFFF0817C2FF00000000FD7E0DFFF4A9
          62FFF4A962FFF4A962FFFFFFFFFF999999FF0817C2FF3490FFFF58A9FFFF8BCD
          FFFF84CAFFFF4DA3FFFF2F8CFFFF2B8AFFFF0817C2FF00000000FD7E0DFFFAD8
          B7FFFAD8B7FFF4A962FFFFFFFFFF999999FF0817C2FF0B1AC3FF1321C5FF1E2C
          C7FF1E2FC9FF0B1AC3FF0817C2FF0817C2FF0817C2FF00000000FD7E0DFFFFEF
          DAFFFFEFDAFFF4A962FFFFFFFFFF999999FF999999FF999999FF999999FF9A9A
          9AFF984D09FF0000000000000000000000000000000000000000FD7E0DFFF4A9
          62FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A962FFF4A9
          62FFFD7E0DFF0000000000000000000000000000000000000000FD7E0DFFFEB5
          6EFFFEB56EFFF4A962FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8B7FFFAD8
          B7FFFD7E0DFF0000000000000000000000000000000000000000FD7E0DFFFEB5
          6EFFFEB56EFFF4A962FFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEFDAFFFFEF
          DAFFFD7E0DFF0000000000000000000000000000000000000000FD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFF0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000FD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFA7D0DFF011A4B5A0349
          D4FF0349D4FF0349D4FF0344C7FF40497EFFE87A1DFFFAB375FFFFBC7EFFFFBC
          7EFFFFBC7FFFFFBC7EFFFFBC7EFFFAB271FBE77510EA3E1F03410349D4FF50B3
          FEFF5FC1FEFF6ACCFEFF72D3FEFF5EACCCFFD5883AFFEA984BFFFFC792FFFFC7
          92FFFFC792FFFFC792FFFFC792FFE28837E8BF5F0AC100000000034CD2FF47A8
          F7FF54B4F7FF5EBEF7FF65C4F7FF63BEEBFF6E9098FFF98015FFFACFA6FFFFD3
          AAFFFFD3A9FFFFD3AAFFF9CCA2FBF77D11F930180230000000000350D7FF40A4
          FEFF4BAEFEFF0250D7FF0350D7FF0350D7FF0240ABFFC8712DFFE89B5AFFFFE1
          C2FFFFE1C2FFFFE1C2FFE7964BEDC7630AC900000000000000000252D8FF40A4
          FEFF47AAFEFF0353D9FF010D262E000000000000000021100221FB7E0FFDFCE6
          CFFCFFEDD8FFFCE6CFFCFB7E0FFD211002210000000000000000010E272E0358
          DAFF3C9FFEFF3FA3FEFF0357DBFF010D262E0000000000000000C2610AC4E59E
          5CE6FFF8ECFFE59E5CE6C2610AC400000000000000000000000000000000010E
          272E035CDCFF3296FDFF3296FDFF025BDCFF010D262E00000000341A0334EA7A
          16ECFFF5E8FFEA7A16EC341A0334000000000000000000000000000000000000
          0000010E272E035FDEFF2A8DFDFF298EFDFF0260DEFF0000000000000000BE5F
          0AC0FB8E2DFCBE5F0AC00000000000000000000000000000000000000000010E
          272E0263E0FF2286FDFF2387FDFF0364E0FF010D262E00000000000000003F20
          0340FC7E0DFE3F20034000000000000000000000000000000000010E272E0263
          E0FF1C81FDFF1C81FDFF0267E2FF010D262E0000000000000000000000000000
          0000753A06760000000000000000000000000000000000000000026BE3FF1A7E
          FDFF1B7EFDFF026BE3FF010D262E000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000026EE5FF197E
          FDFF197EFDFF026DE5FF036EE5FF036DE5FF026DE5FF026DE4FF026DE5FF026F
          E4FF0121444C00000000000000000000000000000000000000000271E6FF187D
          FDFF187DFDFF187DFDFF197EFDFF197EFDFF197EFDFF197EFDFF187DFDFF187D
          FDFF0270E6FF00000000000000000000000000000000000000000274E7FF73AF
          FEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AF
          FEFF0274E7FF0000000000000000000000000000000000000000012A525A0276
          E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276E8FF0276
          E8FF012A525A0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF0000000000000000FD7E
          0DFF4CE7FFFF4CE7FFFF4CE7FFFFCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFCCCCCCFF4CE7FFFF4CE7FFFF4CE7FFFFFD7E0DFF0000000000000000FD7E
          0DFF4CE7FFFF4CE7FFFF4CE7FFFFAEAEAEFFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
          F8FFAEAEAEFF4CE7FFFF4CE7FFFF4CE7FFFFFD7E0DFF0000000000000000FD7E
          0DFF429DEAFF429DEAFF429DEAFFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
          B3FFB3B3B3FF429DEAFF429DEAFF429DEAFFFD7E0DFF0000000000000000FD7E
          0DFF4CE7FFFF4CE7FFFF4CE7FFFFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB1B1B1FF4CE7FFFF4CE7FFFF4CE7FFFFFD7E0DFF0000000000000000FD7E
          0DFF4CE7FFFF4CE7FFFF4CE7FFFFCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
          FDFFC5C4C4FF4CE7FFFF4CE7FFFF4CE7FFFFFD7E0DFF0000000000000000FD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000443FBFF0241FBFF013FFBFF003FFBFF003F
          FBFF003FFBFF0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000B4BFBFF0948FBFF0747FBFF0544FBFF0443
          FBFF0240FCFF00000000000000000000000000000000000000000000002E0000
          00FF0000002E0000000000000000072060611150FCFF0F4FFBFF031035360000
          00000000000000000000000000000000002E000000FF0000002E000000FF0000
          00FF000000FF0000000000000000000000000A235F611758FCFF1557FCFF0000
          0000000000000000000000000000000000FF000000FF000000FF000000000000
          00FF000000000000000000000000000000000D2760612063FCFF1E61FCFF0000
          000000000000000000000000000000000000000000FF00000000000000000000
          00FF000000000000000000000000122D60612E72FCFF2B6FFCFF081735360000
          000000000000000000000000000000000000000000FF00000000000000000000
          00FF000000FF00000000000000003C82FDFF387DFDFF367AFCFF3379FCFF3074
          FDFF2D72FCFF0000000000000000000000FF000000FF00000000000000000000
          0000000000000000000000000000013FFBFF013FFBFF013FFBFF013FFBFF013F
          FBFF013FFBFF0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000032BD5FF032B
          D5FF032BD5FF032BD5FF032BD5FF032BD5FF032BD5FF032BD5FF032BD5FF032B
          D5FF032BD5FF032BD5FF032BD5FF032BD5FF032BD5FF032BD5FF032BD5FF0000
          0000000000000000000000000000032BD5FF0000000000000000000000000000
          0000032BD5FF00000000000000000000000000000000032BD5FF032BD5FF0000
          0000000000000000000000000000032BD5FF0000000000000000000000000000
          0000032BD5FF00000000000000000000000000000000032BD5FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000303831FF2E3630FF2D342EFF000000000000000000000000000000000000
          000000000000242C25FF232C24FF232B24FF0000000000000000000000000000
          0000353D37FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000252E26FF0000000000000000000000000000
          00003C433EFF00000000FD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFF0000000000000000000000002A312BFF0000000000000000000000000000
          00000000000000000000FD7E0DFFFFEFDBFFFFEFDBFFFFEFDBFFFFEFDBFFFD7E
          0DFF000000000000000000000000000000000000000000000000000000000000
          00000000000000000000FD7E0DFFFFEFDBFFFFEFDBFFFFEFDBFFFFEFDBFFFD7E
          0DFFE4A069FFE4A069FF00000000000000000000000000000000000000000000
          00000000000000000000FD7E0DFFFFEFDBFFFFEFDBFFFFEFDBFFFFEFDBFFFD7E
          0DFFFFF4E6FFE4A069FF00000000000000000000000000000000000000000000
          00000000000000000000FD7E0DFFFFEFDBFFFFEFDBFFFFEFDBFFFFEFDBFFFD7E
          0DFFFFF4E6FFE4A069FF00000000000000000000000000000000000000000000
          00000000000000000000FD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E0DFFFD7E
          0DFFFFF4E6FFE4A069FF00000000000000000000000000000000000000000000
          000000000000000000000000000000000000E4A069FFFFF4E6FFFFF4E6FFFFF4
          E6FFFFF4E6FFE4A069FF00000000000000000000000000000000000000000000
          0000656A6BFF000000000000000000000000E4A069FFE4A069FFE4A069FFE4A0
          69FFE4A069FFE4A069FF00000000535857FF0000000000000000000000000000
          00006A6E6FFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000595E5DFF0000000000000000000000000000
          00006D7173FF6C7172FF6B7071FF000000000000000000000000000000000000
          000000000000626767FF606565FF5F6464FF0000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000210
          4856032BD5FF032BD5FF032BD5FF032BD5FF010E465400000000000000000000
          0000000000000000000000000000000000000000000000000000032BD5FF0A36
          DCFF3E7DF1FF65AFFEFF4C93FEFF2864F1FF032BD5FF032BD5FF000000000000
          0000000000000000000000000000000000000000000000000000032BD5FF4289
          FDFF5BA5FEFF65AFFEFF4C93FEFF3A80FEFF2A6EFEFF032BD5FF000000000000
          0000000000000000000000000000000000000000000000000000032BD5FF3A80
          FEFF000000FF000000FF000000FF000000FF2A6EFEFF032BD5FF022E7F97034E
          D6FF034DD6FF034CD6FF034CD5FF034BD5FF034AD5FF034AD4FF033AD5FF397E
          FEFF3F72AFFF000000FF3465AFFF3A80FEFF2A6EFEFF032BD5FF0252D8FF66C7
          FEFF66C7FEFF66C7FEFF66C7FEFF66C7FEFF66C7FEFF66C7FEFF034CD5FF397E
          FEFF5BA5FEFF4679AFFF000000FF3A80FEFF296FFEFF032BD5FF0357DAFF66C7
          FEFF66C9FEFF0253D9FF0252D8FF0251D8FF0350D7FF0350D7FF0240D6FF397E
          FEFF3F72AFFF000000FF3465AFFF3A80FEFF2A6DFEFF032BD5FF000C2026025B
          DCFF5CBFFEFF5DBEFEFF0355DAFF000C20260000000000000000032BD5FF3A80
          FEFF000000FF000000FF000000FF000000FF2A6EFEFF032BD5FF00000000000C
          2026035DDDFF52B4FEFF52B4FDFF0359DBFF000C202600000000032BD5FF4289
          FDFF5BA5FEFF65AFFEFF4B93FEFF3981FEFF2A6EFEFF032BD5FF000000000000
          0000000C20260260DEFF47A9FEFF46AAFDFF035CDCFF000000000A36DCFF0A36
          DCFF3C7BF1FF65AFFEFF4B93FEFF2765F1FF032BD5FF032BD5FF000000000000
          0000000C20260365E1FF3B9EFDFF3B9EFDFF0261DFFF00000000010204040210
          4856032BD5FF032BD5FF032BD5FF032BD5FF010E46540000000000000000000C
          20260369E2FF3194FEFF3094FDFF0267E1FF000C202600000000000000000000
          0000000000000000000000000000000000000000000000000000000C2026026F
          E4FF278AFDFF278BFDFF026CE3FF000C20260000000000000000000000000000
          00000000000000000000000000000000000000000000000000000271E6FF1F83
          FEFF1F84FEFF0270E6FF0270E6FF036EE4FF026DE4FF026CE4FF014086970000
          00000000000000000000000000000000000000000000000000000275E8FF73AF
          FEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF73AFFEFF026FE6FF0000
          0000000000000000000000000000000000000000000000000000114986970276
          E8FF0276E8FF0274E7FF0274E7FF0274E7FF0274E7FF0273E7FF014489970000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000210
          4856032BD5FF032BD5FF032BD5FF032BD5FF010E465400000000000000000000
          0000000000000000000000000000000000000000000000000000032BD5FF0A36
          DCFF3E7DF1FF65AFFEFF4C93FEFF2864F1FF032BD5FF032BD5FF000000000000
          00000000000000000000000201030000000011351D4600A241FF032BD5FF4289
          FDFF5BA5FEFF65AFFEFF4C93FEFF3A80FEFF2A6EFEFF032BD5FF000000000000
          00000000000000000000000000000037165700A241FF3EC16BFF032BD5FF3A80
          FEFF000000FF000000FF000000FF000000FF2A6EFEFF032BD5FF000000000000
          000000000000000000000037165700A241FF3EC16CFF3EC16BFF032BD5FF397E
          FEFF3F72AFFF000000FF3465AFFF3A80FEFF2A6EFEFF032BD5FF000000000000
          0000000000000037165700A241FF4BC876FF4BC776FF4BC876FF032BD5FF397E
          FEFF5BA5FEFF4679AFFF000000FF3A80FEFF296FFEFF032BD5FF000000000000
          00000037165700A241FF5ACC80FF5ACC80FF59CC80FF5ACD80FF032BD5FF397E
          FEFF3F72AFFF000000FF3465AFFF3A80FEFF2A6DFEFF032BD5FF000000000037
          165700A241FF68D48DFF69D38DFF68D38DFF68D38DFF69D38DFF032BD5FF3A80
          FEFF000000FF000000FF000000FF000000FF2A6EFEFF032BD5FF0037165700A2
          41FF76DB9AFF77DA9AFF77DB9AFF77DB9AFF77DA9AFF77DB9AFF032BD5FF4289
          FDFF5BA5FEFF65AFFEFF4B93FEFF3981FEFF2A6EFEFF032BD5FF00A241FF00A2
          41FF00A241FF00A241FF00A54AFF85E3A6FF85E1A6FF85E2A7FF0A36DCFF0A36
          DCFF3C7BF1FF65AFFEFF4B93FEFF2765F1FF032BD5FF032BD5FF000000000000
          0000000000000000000000A241FF93E9B2FF93E9B2FF93E9B3FF92E7B4FF63A9
          BFFF032BD5FF032BD5FF032BD5FF032BD5FF010E465400000000000000000000
          0000000000000000000000A241FF9FEFBDFF9EEFBDFF9EEFBDFF9EEFBDFF9FEF
          BDFF00A241FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000A241FFA9F4C7FFA9F4C8FFA9F3C7FFA9F3C7FFA9F3
          C8FF00A241FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000A241FFB2FACEFFB2FACEFFB2F9CEFFB2F9CEFFB3F9
          CFFF00A241FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000A241FFB9FDD4FFB9FDD4FFB9FDD4FFB9FDD4FFB9FD
          D4FF00A241FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000A241FF00A241FF00A241FF00A241FF00A241FF00A2
          41FF00A241FF0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000872DFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000008B2EFC000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000011061B00852FDB009635FF30B860FF008D2FFF007A
          29E4001407270000000000000000000000000000000000000000000000000000
          00000000000000000000000000000011061B0E953EE34CD07DFF0C8B38E20011
          061E000000000000000000000000000000000000000000000000000000130000
          001F0000002100000023000000240000002500130740007229C50010063F0000
          00290000002A0000002B0000002C0000002B0000001C00000007A66931C8E68F
          40FFE3893BFFE08537FFDD7F31FFDA7A2CFFD87426FFD57022FFD36C1EFFD069
          1BFFCF6618FFCF6618FFCF6618FFCF6618FF954911D40000001AEB994BFFFEF6
          EDFFFFEEDCFFFEEEDCFFFEEEDCFFFFEEDCFFFEEEDCFFFEEEDCFFFEEEDCFFFEEE
          DCFFFEEEDCFFFEEEDCFFFEEEDCFFFEEEDCFFCF6618FF00000023EE9D4FFFFFF8
          F1FFFFF1E1FFFEF0E2FFFEF0E1FFFFF1E1FFFFF0E1FFFFF0E1FFFFF1E1FFFEF0
          E1FFFEF0E1FFFEF0E1FFFFF0E2FFFEF1E1FFCF6618FF0000001DEE9D4FFFFFFA
          F5FFFFF3E7FFFFF3E7FFFFF3E7FFFFF3E7FFFFF3E7FFFFF3E7FFFFF3E7FFFFF3
          E7FFFFF3E7FFFFF3E7FFFFF3E7FFFEF3E7FFD06719FF00000019EE9D4FFFFFFB
          F8FFFFFBF7FFFFFBF6FFFFFAF5FFFFF9F4FFFFFAF4FFFFF9F3FFFFF8F2FFFFF9
          F1FFFFF8F1FFFFF8F0FFFFF8EFFFFEF6EFFFD26C1EFF00000012B1743BBEEE9D
          4FFFEE9D4FFFEE9D4FFFEE9D4FFFED9C4EFFEC994BFFE99547FFE89143FFE48C
          3EFFE18639FFDE8133FFDB7C2FFFD97729FF9E551AC600000009000000000000
          00000000000000000000000000010000000200130626006423C4000F05220000
          0005000000050000000600000007000000080000000600000002000000000000
          0000000000000000000000000000001407240F8B39E84CCC7BFF0C8035E50011
          0621000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000160724008530E4009031FF30B65FFF00882DFF0077
          28E4001106210000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000008F30FC000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000009735FF000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object imgImages: TcxImageList
    FormatVersion = 1
    DesignInfo = 3736050
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
