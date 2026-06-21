object FrmAut: TFrmAut
  Left = 0
  Top = 0
  Caption = 'Autoriza'#231#245'es'
  ClientHeight = 375
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  object PagEdicao: TcxPageControl
    Left = 0
    Top = 0
    Width = 402
    Height = 375
    ActivePage = tsCad
    Align = alClient
    HideTabs = True
    LookAndFeel.NativeStyle = True
    Style = 6
    TabOrder = 0
    ClientRectBottom = 375
    ClientRectRight = 402
    ClientRectTop = 0
    object tsCad: TcxTabSheet
      Caption = '&1. Cadastro'
      ImageIndex = 0
      object LMDSimplePanel1: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 402
        Height = 44
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 0
        object LMDSimplePanel2: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 402
          Height = 44
          Align = alClient
          Bevel.Mode = bmCustom
          TabOrder = 0
          object dxBarDockControl1: TdxBarDockControl
            Left = 0
            Top = 0
            Width = 402
            Height = 44
            Align = dalTop
            BarManager = BarMgr
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
        end
      end
      object LMDSimplePanel5: TLMDSimplePanel
        Left = 0
        Top = 144
        Width = 402
        Height = 231
        Align = alClient
        Bevel.Mode = bmEdge
        TabOrder = 1
        object Grid: TcxGrid
          Left = 2
          Top = 43
          Width = 398
          Height = 186
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          object TV: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsMT
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0'
                Kind = skSum
                Column = TVMaquinas
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Appending = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object TVTipo: TcxGridDBColumn
              DataBinding.FieldName = 'Tipo'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.ImmediatePost = True
              Properties.ImmediateUpdateText = True
              Properties.Items = <
                item
                  Description = 'Tempor'#225'ria'
                  ImageIndex = 0
                  Value = 0
                end
                item
                  Description = 'Definitiva'
                  Value = 2
                end
                item
                  Description = 'Teste Gratu'#237'to'
                  Value = 3
                end
                item
                  Description = 'Loca'#231#227'o'
                  Value = 4
                end
                item
                  Description = 'Free/Premium'
                  Value = 5
                end>
              Width = 115
            end
            object TVMaquinas: TcxGridDBColumn
              Caption = 'M'#225'quinas'
              DataBinding.FieldName = 'Maquinas'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.ImmediatePost = True
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 132
            end
            object TVVencimento: TcxGridDBColumn
              DataBinding.FieldName = 'Vencimento'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.ImmediatePost = True
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 131
            end
          end
          object GL: TcxGridLevel
            GridView = TV
          end
        end
        object LMDSimplePanel7: TLMDSimplePanel
          Left = 2
          Top = 7
          Width = 398
          Height = 36
          Align = alTop
          Bevel.BorderSides = [fsTop]
          Bevel.Mode = bmEdge
          TabOrder = 1
          object btnAdd: TPngSpeedButton
            Left = 2
            Top = 2
            Width = 69
            Height = 32
            Align = alLeft
            Caption = '&Novo'
            Flat = True
            OnClick = btnAddClick
            PngImage.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000002A744558744372656174696F6E2054696D65004D692031204F6B7420
              323030332030303A30363A3032202B3031303089E94A900000000774494D4500
              0000000000000973942E000000097048597300000B1100000B11017F645F9100
              0003F24944415478DAA5565B6C5455145D7748D0064A2D6000690B086230C6C4
              0F7FFD31F14B9262408856BF4C7C202520E187D657446C488C50A126F5510423
              F8C08889A0C40F0296F88308256D518294C04C1B0A3373DFE7E93EE7DC6A3174
              D4CE4DF67DCD397BEDB5F7DAFB8E870A47434F9DBE6DCA5428A500E541690D68
              F38B87942528BC102CA48761B264221F5E2580073E5FA477ACDA8640F980D450
              90E45F83AB089BF76DC3C5674737D1B22FC92E4D0AE0FEFD4DFAED95EDB89EE4
              91C81042316B85D2107A8E1CC3D517CB3B685917D9E06400BCFB3E6B521DABDA
              908F7E43C48B14390797094A41119F7CDF8BFCDA7227ADDB45761E59F2FE17C0
              B24F9BD4F627DA70253A8F5014A1A40023806270C302145EF2AB04D8D7A83AD6
              1040306001A494C422814F0CF61C3989C2BAFF0E704BA0A57BE7ABEDABDB7139
              3C8798975D0D8845392C61CFE15E8CAC0F0CC0EE0A35D0DEFC9E197AF6B4D924
              4105AD8C0C3D6892A391665DCD1DD8FCD8F3C4A01F1131109A81738984053878
              EC1404CF218729B4D6ECD36E3F11B9562AC2DFC216D2C3B0B768EF9DFAA3964E
              04D2CF586A0B6041C8221EA0100F22150131D0B60EA98C307DEA74CC9BB61492
              0211547C2152309DE2863F829D5F1C46790BB312F616F4CCD4BB5A3A304A5264
              2AB04E9596D634B14A654CCE7DEB482A7A4FCE9864F0748E62C959E7D29A8614
              025198E2C0D1D3085FE156C25ED3C7B3F47B2D6F91147F476C940207A0C9A1B9
              BACDCE39B9A7B424369D2685CE5C3A0D63238238E4D87FF41744AF722B0002A8
              D73B9FDA8A2BE120E5B94491D142CB826700342594A077E45CA6742FC739FD1B
              C05D0D80208053885F130EA0E1C37ADDF9F49B18F2FB2C00AC73179122EFD2A3
              7B691A8C67919B3A8D450F1BB5A91B6587F638062645F1EB1983C60F66EA779F
              69475FE138D5803935C015D86837E7C146EF94E59C734E6C8434B76625056277
              D835692270E0875F11BF9101CCE9AAD5B36A67204EE231E55AEA9AA6675D6D0D
              563CFC20C992DF941A960A1CFCF18C7DEF54677133A90231BD675BA52B329D16
              90AD246B34018FEF92C5DD73D76D5AB1067F140728FF2C6301B084E3EB136790
              6F2D1FC2ADC7B581BB6C654AA7DBC9E664D79BBAFCDEEEC6FE0D8FAFC6856BA7
              498E32EB0FC340E29B136771B5B5DC4DEBBE821BD7FF1C15896DB44AA3E29EEE
              06D5DADC4C007DB64B1D80612070A8F72CF2EBFD7F1F159586DD92F7EF526B9B
              97E3D2E880EB0FE91870460C8EF761786350DD345DDC354F3DB7FC510C5DBF90
              7D2EBDBF00BEFDE95CF50077EF9EAB9E7CE4218C94866DFDA574B34A527F7CF7
              733F465E0EAB0240FD3B35DAF6813009CAE44B2C3C5307EA83A44D54F5C934C7
              8412C6382962B21F7D4C2CE1B1C34A1115FEB6FC09231E0B7EBA52503A000000
              0049454E44AE426082}
            ExplicitHeight = 30
          end
          object btnEditar: TPngSpeedButton
            Left = 71
            Top = 2
            Width = 69
            Height = 32
            Align = alLeft
            Caption = '&Editar'
            Flat = True
            PngImage.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000002A744558744372656174696F6E2054696D65004D6F2036204F6B7420
              323030332030303A30383A3137202B303130307BBBF4750000000774494D4500
              0000000000000973942E000000097048597300000AF000000AF00142AC349800
              0006B74944415478DA85550B5493E7197EBE84AB5C2217C59C89055141B4112F
              D0CA04BCB4F5B46B6BA728EA5A5C6A65B3AE1D3B652B07A6B6B4D85995797A9B
              6D49ADD6314558C7F1543C53A79D975E905A2021044942424848C22D215772F9
              F706626B7B74FD4E9EF3E7FFFEEF7F9EF7FE33D0AAAAAA7A5F2E976747444434
              3B1C8E18A7D37981C7E3859BCDE62B42A130B4A1A1C140C77CF87E71B7FF5C10
              C6A41B5DBE134E8B2BCDEAF7FFF75BA0FA3820A547AEC039B661C32FB30582D8
              C6AE2E4553529250EC70D8AE4C9B96946FB7DBFB0502C1CF5C2ED7786C6CACC1
              ED763BA3A2A294B46F3F7FFEFC1EBD5E6FD2AC5F94A8558F5E9D393B31C5E3F6
              42DEA685A66FC4740AD8760DB84E0263ACB2B2BEC9E3195BE1F743DB72E363D1
              8C194B2F99CDDF2EF7FBA29A43429CB956ABEB725C5C54B6DD6E934547C7A6F9
              7C5E93DDEE549ACCE6BFD6EE2D3F3EEB93FDCB521FCC80C53806A55C07459B0E
              D251E7A57D40390974B0EAEAE6E1C2C2B582D0D03EDE96AD9BF08FD7DFC4AFF6
              96E3CDBF9C4245C51694941C804452C9E5E68A5D2D2D75FE59C9ABD4B28E26F6
              CCCE225996A8605346EB198C5F68407C7212BA3B48A05D07B5D1AAFF23F01A09
              34B1DDBB9B7AC5E22792DF78E339DE9225D9F8FA462B166466A257AD446262E2
              449C293C484848C0D0D028A64F4D46B3F103FFAA47F3587ED856969B9F03E3DB
              7B30DA78025627A0BA65E48E8D38EA9B819BF46A1D2B2FAFEF282A5A9729BA9F
              E38DFB1806AF9E83607A12E40E86D4941450BC919757809A9A4378B9ECCF28DD
              FF6B8415AB318F8C483C9B83192C1D3333E6A0E7D33AF09B4EA345A9BB7860D4
              AE22F27F13FEC3CACAEAAE3DFEE42F1ECCCA8DE579FC40B8EC6B308F13EEC505
              F08F038C51F950FD70048FDF823D8A95484E4B4552621C3C3E2FCCA7A2C17D13
              0FA7DF098D412F6D6AA86FF5FB7C5F0605B424F0F773AB1F7AF89125ABA631AF
              170851CBC0EFBF056BEE53E0E89E923F51941C5DABA4F910A646222579267C5E
              0E2693053D1A03545F0C533AA395EDF5D2EB14CE0E7AE31CA13B105D565A7AAC
              7E65C1CAC227D72593B564AFB90F68B9003C269E1420723E79F16AFBD3180857
              2173FE7C30DA379BAD50A94CE8ECD4A25BA6D3DB6ABD17E1842268B98CE008E4
              8FBDF8A24492BB3C5F3C7F6D1ADC7EC6F8560B665CAC45EFBA97C027A2083AD4
              A8AB86D2771239CBB211023E8606ADD068CC904AB5E892F68D8C1DF57CC65938
              6590BC9D60BFDD8C6CD7AE0F0F6767FFFCF7C5C519DC840781F5412550524DE6
              03ADE6CB785D2E46DEF23C4486866378C806AD761032591F641D1A87E5B8BB91
              33717D41726A6458EFEC74B673E791AA258B1FD8BDF40911E7E7F398370498FD
              7E2914DB0F23D4039C55FE0E16612716CC9987C1212B74BA610A4B1F6EB6757B
              C64E7A4FF935180892B71246EE249F10282979A74C24CA39B05DBC988B880861
              1C8F360FBD00EEA5B71170E7937FED8004E7F1F89A7CF4EB46D029D7E2EA57ED
              B8AF27F7B2FC9FD703313F4BF8823084099F7FB8D88E1D6FFD6641E6D2231BB7
              2EE3785161CC460209079F877CD77B80CD0BDFA54AD4F3BFC145C74D44864C81
              54DE879797EF43FFA753BEFCE844E919E2384D50FD68187E2FF0ECB3355BD2D3
              B3EAD66ECAE5E2E2C359186535E1C06F81CA2330F4F4E0A4641FC6C6FCB8616E
              43ECB234E4E76CC6BA458578A5EC9D2E89E4858F88E32441F7E3D07C27505C7C
              F0B17973177E26DEB682130AA3D838E580F7DA76F4FF49821B9F7F858F25EF62
              CD53C510E53C849848807E888F066AF69E30D51C7EE65DBAA5E90CCDFF11A85E
              919A22BAB2AA70253725299A79F840C62131462A8F228692DC23BB89B9B3D330
              35361636BA373B26CBA4F1BD06CFFE7D9B0E721C17F042794F818D1B5F15CD99
              737F5BF1D3ABB9F4B902E60D0542F76C83B1E21846C7C8B4411B6C4E17620409
              88E031C4D373E154A0F66F67B957F6161D763A6D1F124FD73D05D6AFAF989536
              5BA47974E31A2E262591B928C9730F3D077D692DE2C89BB8701A1F7430841F38
              4DF388BCE8D78FE274C3E734009F7F6B64447F14935F30EF5D050A0ACAA62ECE
              5A34BCA1E8613CB03489F9882DE2E01FE029A14F4654244C4627942A2375EE00
              7A7B4D3EA552A9D2EB6F11BACC0AC5358DD73B1EA8A24E82E7AE020B17CE0F5B
              BDBAC2BA79F323615959D399423904FD997A285912D7333066EE5577290C06B9
              A1BF5F6E3599343EAFD7ED0A369489A0C6E4DC37DFAD0730E974A0D96AAFF9FD
              E3A9C3C303FA81816EADDEA0183519D5E30EC768C02A0B6190600C22F09FB243
              A36D72A0D9EF159EEF040842C25AC27DC1976E139A8202813D5790D47D475371
              F889C582D7F0407963B2CCBD41325790CC1324FA49B2BBADFF019EB9209C872D
              7D730000000049454E44AE426082}
            ExplicitHeight = 30
          end
          object btnApagar: TPngSpeedButton
            Left = 140
            Top = 2
            Width = 75
            Height = 32
            Align = alLeft
            Caption = '&Apagar'
            Flat = True
            OnClick = btnApagarClick
            PngImage.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000002B744558744372656174696F6E2054696D650046722031392044657A
              20323030332031343A35393A3435202B303130309EA896800000000774494D45
              000000000000000973942E000000097048597300000AF000000AF00142AC3498
              000006A84944415478DA7D567D7013751A7E76F3D5B4699B955081D216047AA0
              8268A9F261AF7C5C614451604E1D3D15461D9DF1707450D451C73F1CE7BC9953
              4F41B44751200D52C1A34751B116DA635AA020D6969856482FFD204D93E6A3ED
              26BBD9CDC7E6DE4D1BE7B8F3FC659ED9D9CDEEFBBCBFF779DF679701ADE62169
              9ECBAB6C9C66C41D5C8EE6370C98692CC35AA4B802394188A720271544C4C458
              4890429E60D4631F0C0FF5FA46FB758AD47D7B61AAA3F685754E0A1527A42691
              5ECC979EF85B379BB5AFC483BC6620184792D5C3946B44965E8B6C3D9047C89E
              849EC5FFAC5667045F768B38E94C5DEDECF37D737B4EBFADFD2FF77D477FC904
              85397E45094D937CDC96F7ECA85A3E0B37964E41F1F47CE41B35C8A5A0396A70
              1D60D00246825E435931F8C535188AE1E1FD6EE5CAE52BEFF9F7DCF52E5D0A30
              BBCE8817B62D37969F7504D17A598489CBC1ECC27C70D91304260A6E24646927
              F06B04628292A17BE6BCDA29BBDEBEF511BAD4C2EC6C095837DC647AD4C02830
              533D120A43373290920CA8ECD051590C9A891DA80FEBB4F8D5D5779547E9EB67
              5C09EBFA5A3A3DC0BCDB38F0F2AA05D3FFCCE96288C428358D063A838E82B2E9
              921826CBC3A6D27F81A1A3924A21493A262863514E22148EA1DF1B45EB8F419C
              BD1CC2B9AEB626F9C44B67D204EF3438EE5DBCA0F4D8FCBC18C2D40329560BAD
              5E0F9632D7111F9B019D6B18B53DA8A3122948B124C46812413E06DF980C5F50
              C4F08888266718BD2D3B0F852F1E3C4B04479903F50DB3736FDCF0AF151691E1
              651D65A9435E0EE08F2A38E73D094ECFA1B2A83C9D798A08E2494C1224109512
              0810813724C11710E1191170E09200E9ABA7F78607BB4E1241932A97EE983BEE
              AE342905E7FCDD28CA29C507DD6F61BFF76D4C35E9E109C6B0D6701F3EBAC706
              3DFDA664E9119400498E812755FDA33241829708864622D86D4F2A1A5B458D2C
              8A872976BB4AC07CE6E24FAFE3722ACE8F7462FDF1322CBFA3048B4AE6E2A2D3
              898B8E41D41435E074FED7688EECC31BC587B075DE267822C04858448008BC21
              2A0F956868288C5A97E2123E2E3F4E71F7111C69025B8FAF7A1937F529410EE1
              E9C14578FCCE0DB035B7A0A4E36E70897C54CDDD881DDC7ABCB16633AA2F3460
              CC3103D6AA9310A20CBC14D8178AA64BD43510C6B7DD8E5342DDD6368A6B559B
              2ADDD1B53FF43D57CA15BD5F6CD260C611067FB8B30CB67F7C8FB5D884BA678F
              A26EE0309E697B100FAD5E0A86DAB8E3541CD5777D01363E95824728FB284682
              021A2F47D0DB6EAD1B3DBD5B15F8EF044F9AC0D6DEB996332F6CAC98C1A263D8
              099D988D61771F46A25E6CA8FA3DF4EA348F03F3EB0B71EFE605387AA80BF62D
              7E5CF284E11B15E0F513418004EE12217EF3EC5EDE75E11485FD96104A13D4D4
              D45C9FB7EC09CFC6D90C5BD9B406EDC16630D4F3F22329B8C329B47B4FE1A1F9
              BF4359F57294AC92515FDF81FEAD29FCE41B9B2851800848E09DF66452FB59E5
              DE6824A20A7C9E2064865E7BB85F72DD6D31145D1A756159E31C2C995704B74B
              C642CD2A34FDF439FCAFA450FA21871B561AE1F83A809E6762B00F05D3F51F21
              82615F18FBFA52FDC2AE25C7320213121902E6A073FCC4EA29C67579643C7F73
              D8B0A3F3513CB0B20C33B902584CB938506D47CB966E5CFF2283D756EFC2FD2B
              B6A1CFE34F13A873E018E4D168EF69E6EB1ECB08ECC2C4E84C1058BB87DFB9CD
              6CD96EC9D52297A6B6B9C78D37DB9E829B3D83EDDBD6624F6D0396441FC78E35
              7F8285E3709586C1A30AECA7560D44C8AE23B0B7EEAF0BB77DFCB3C0E9C01993
              B2FDE07A722E5752B3680A4326CE201103F24D40F95F2B604E4EC596C5CF63F1
              9C0AF0324FBD3F0A5E92104DE8E89C41885AD46A17C09F786E2FDF7BFE6781AF
              21D8F3CFF6A5795CD9B9071769415E462646FB53268C8E5E6C18A7E9A5B94294
              3C8817688279DA0189ECF68D431063F8C4497668ADDC13152247D4095605BE86
              60E6CC99C64DEFB71F7FB87CDA9AA5C52C64892C3BA1FA0ED2C718F94F5456D2
              1E3426C4112083538D2EA80ED97000D6E12CB7B0EB967A0AF529E14755E06B08
              68B1B34A661557FDF1B5ED372DDBB879F6755C61A1112830916D938D52E2943D
              3929D97390EC39382E638886EBAC8BC7577DB2A2EFF9E4B0BF797737C539A84E
              70E6BDFCDFEF2603A1886534B72E5CB1FAB68205BF2DBAEE86B2628379C67463
              B6D9C2EA8D669EB6139662CAC090CF1FF0797CD2C077FD71FB113F3FDC3B4ACF
              AA1DD49AA9FF2F11A88B5E31C8255808D3098584028299904DD04F3E47CA204A
              E0095E82FA55D14B0866CAF3FF08324B33B9233568D624B166129945854B7FAA
              90FC207F9DF892F8CF20FF06024937D95F041D620000000049454E44AE426082}
            ExplicitHeight = 30
          end
          object btnCanc: TLMDSpeedButton
            Left = 289
            Top = 2
            Width = 74
            Height = 32
            Caption = 'Cancelar'
            ParentFont = False
            OnClick = btnCancClick
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Align = alLeft
            ButtonStyle = ubsFlat
            ExplicitLeft = 215
          end
          object btnSalvar: TLMDSpeedButton
            Left = 215
            Top = 2
            Width = 74
            Height = 32
            Caption = 'Salvar'
            ParentFont = False
            OnClick = btnSalvarClick
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Align = alLeft
            ButtonStyle = ubsFlat
          end
        end
        object LMDSimplePanel4: TLMDSimplePanel
          Left = 2
          Top = 2
          Width = 398
          Height = 5
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 2
        end
      end
      object LMDSimplePanel6: TLMDSimplePanel
        Left = 0
        Top = 44
        Width = 402
        Height = 5
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 2
      end
      object LMDSimplePanel3: TLMDSimplePanel
        Left = 0
        Top = 49
        Width = 402
        Height = 95
        Align = alTop
        Bevel.StyleInner = bvRaised
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 3
        object VG: TcxVerticalGrid
          Left = 0
          Top = 0
          Width = 402
          Height = 95
          Align = alClient
          LookAndFeel.Kind = lfOffice11
          OptionsView.PaintStyle = psDelphi
          OptionsView.RowHeaderWidth = 149
          TabOrder = 0
          Version = 1
          object vgPrograma: TcxEditorRow
            Properties.Caption = 'Programa'
            Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
            Properties.EditProperties.Columns = 2
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items = <
              item
                Caption = 'Cyber Manager'
                Value = 0
              end
              item
                Caption = 'NexCaf'#233
                Value = 1
              end>
            Properties.EditProperties.OnEditValueChanged = vgProgramaEditPropertiesEditValueChanged
            Properties.DataBinding.ValueType = 'Integer'
            Properties.Value = Null
            ID = 0
            ParentID = -1
            Index = 0
            Version = 1
          end
          object vgCodEquip: TcxEditorRow
            Properties.Caption = 'C'#243'digo do Equipamento'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.CharCase = ecUpperCase
            Properties.EditProperties.EditMask = 'AAAA\-AAAA\-AAAA\-AAAA;1; '
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = Null
            ID = 1
            ParentID = -1
            Index = 1
            Version = 1
          end
          object vgSerieHD: TcxEditorRow
            Properties.Caption = 'N'#250'mero S'#233'rie'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.CharCase = ecUpperCase
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = Null
            ID = 2
            ParentID = -1
            Index = 2
            Version = 1
          end
          object vgMaq: TcxEditorRow
            Properties.Caption = 'M'#225'quinas'
            Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
            Properties.EditProperties.ImmediatePost = True
            Properties.DataBinding.ValueType = 'Integer'
            Properties.Value = Null
            ID = 3
            ParentID = -1
            Index = 3
            Version = 1
          end
          object vgManut: TcxEditorRow
            Properties.Caption = 'Contrato Manuten'#231#227'o at'#233
            Properties.EditPropertiesClassName = 'TcxDateEditProperties'
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.SaveTime = False
            Properties.EditProperties.ShowTime = False
            Properties.DataBinding.ValueType = 'DateTime'
            Properties.Value = Null
            ID = 4
            ParentID = -1
            Index = 4
            Version = 1
          end
        end
      end
    end
  end
  object BarMgr: TdxBarManager
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
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im32
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 40
    Top = 200
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
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmSalvarFechar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object cmSalvarFechar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 41
      OnClick = cmSalvarFecharClick
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
      LargeImageIndex = 39
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      LargeImageIndex = 37
      AutoGrayScale = False
    end
    object cmSalvar: TdxBarLargeButton
      Caption = 'S&alvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 41
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmBoleto: TdxBarLargeButton
      Caption = 'Ver Boleto'
      Category = 0
      Hint = 'Ver Boleto'
      Visible = ivAlways
      LargeImageIndex = 18
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    OnStateChange = dsMTStateChange
    Left = 39
    Top = 266
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Tipo'
        DataType = ftWord
      end
      item
        Name = 'Maquinas'
        DataType = ftWord
      end
      item
        Name = 'Vencimento'
        DataType = ftDate
      end
      item
        Name = 'Inativar'
        DataType = ftBoolean
      end>
    Filtered = True
    IndexName = 'MTIndex1'
    IndexDefs = <
      item
        Name = 'MTIndex1'
        Fields = 'IncID'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    Filter = 'Inativar = False'
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    AfterInsert = MTAfterInsert
    Left = 40
    Top = 232
    object MTID: TAutoIncField
      FieldName = 'ID'
    end
    object MTTipo: TWordField
      Alignment = taLeftJustify
      FieldName = 'Tipo'
    end
    object MTMaquinas: TWordField
      Alignment = taLeftJustify
      FieldName = 'Maquinas'
    end
    object MTVencimento: TDateField
      Alignment = taCenter
      FieldName = 'Vencimento'
    end
    object MTInativar: TBooleanField
      FieldName = 'Inativar'
    end
    object MTIncID: TAutoIncField
      FieldName = 'IncID'
    end
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Top = 24
  end
end
