object FrmPri: TFrmPri
  Left = 188
  Top = 124
  Caption = 'Registro Nextar'
  ClientHeight = 544
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSplitterPanel1: TLMDSplitterPanel
    Left = 0
    Top = 28
    Width = 690
    Height = 516
    Bevel.Mode = bmCustom
    Bars = <
      item
        OldPosition = -1
        Position = 264
        PosPercent = 52
        Width = 7
      end>
    Orientation = spHorzDown
    Align = alClient
    TabOrder = 4
    object LMDSplitterPane1: TLMDSplitterPane
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      object Paginas: TcxPageControl
        Left = 0
        Top = 0
        Width = 690
        Height = 264
        Align = alClient
        LookAndFeel.Kind = lfUltraFlat
        TabOrder = 0
        ClientRectBottom = 264
        ClientRectRight = 690
        ClientRectTop = 0
      end
    end
    object LMDSplitterPane2: TLMDSplitterPane
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      object PagR: TcxPageControl
        Left = 0
        Top = 0
        Width = 690
        Height = 245
        ActivePage = cxTabSheet6
        Align = alClient
        LookAndFeel.Kind = lfUltraFlat
        Style = 9
        TabHeight = 26
        TabOrder = 0
        TabSlants.Positions = []
        ClientRectBottom = 245
        ClientRectRight = 690
        ClientRectTop = 27
        object cxTabSheet4: TcxTabSheet
          Caption = '&Financeiro'
          ImageIndex = 0
          object GridFin: TcxGrid
            Left = 0
            Top = 34
            Width = 690
            Height = 184
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object tvFin: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataModeController.GridMode = True
              DataController.DataSource = dsFin
              DataController.Filter.Options = [fcoCaseInsensitive]
              DataController.Filter.Active = True
              DataController.Filter.AutoDataSetFilter = True
              DataController.Filter.SupportedLike = False
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'Valor'
                  Column = tvFinValor
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'ValorPago'
                  Column = tvFinValorPago
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.AlwaysShowEditor = True
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.FocusFirstCellOnNewRecord = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsSelection.UnselectFocusedRecordOnExit = False
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object tvFinColumn1: TcxGridDBColumn
                Caption = 'N'#250'mero'
                DataBinding.FieldName = 'ID'
                PropertiesClassName = 'TcxSpinEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Properties.ReadOnly = True
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Editing = False
                Options.Focusing = False
                Width = 87
              end
              object tvFinLancamento: TcxGridDBColumn
                Caption = 'Lan'#231'amento'
                DataBinding.FieldName = 'Lancamento'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ReadOnly = True
                Options.Editing = False
                Options.Focusing = False
                Width = 100
              end
              object tvFinVencimento: TcxGridDBColumn
                DataBinding.FieldName = 'Vencimento'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ReadOnly = True
                Options.Editing = False
                Options.Focusing = False
                SortIndex = 0
                SortOrder = soAscending
                Width = 92
              end
              object tvFinValor: TcxGridDBColumn
                DataBinding.FieldName = 'Valor'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.ReadOnly = True
                Options.Editing = False
                Options.Focusing = False
                Width = 93
              end
              object tvFinPagamento: TcxGridDBColumn
                DataBinding.FieldName = 'Pagamento'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ReadOnly = True
                HeaderAlignmentVert = vaCenter
                Options.Editing = False
                Options.Focusing = False
                Width = 91
              end
              object tvFinValorPago: TcxGridDBColumn
                Caption = 'Valor Pago'
                DataBinding.FieldName = 'ValorPago'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.ReadOnly = True
                Options.Editing = False
                Options.Focusing = False
                Width = 94
              end
              object tvFinDoc: TcxGridDBColumn
                DataBinding.FieldName = 'Doc'
                PropertiesClassName = 'TcxMaskEditProperties'
                Properties.Alignment.Vert = taVCenter
                Properties.ReadOnly = True
                Width = 312
              end
              object tvFinDescricao: TcxGridDBColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'Descricao'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Options.Editing = False
                Options.Focusing = False
                Width = 136
              end
              object tvFinObs: TcxGridDBColumn
                DataBinding.FieldName = 'Obs'
                PropertiesClassName = 'TcxMemoProperties'
                Properties.ReadOnly = True
                Options.Editing = False
                Options.Focusing = False
                Width = 197
              end
            end
            object lvFin: TcxGridLevel
              GridView = tvFin
            end
          end
          object LMDSimplePanel7: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 690
            Height = 34
            Align = alTop
            Bevel.BorderSides = []
            Bevel.Mode = bmEdge
            TabOrder = 1
            object btnGerarBoleto: TPngSpeedButton
              Left = 213
              Top = 0
              Width = 109
              Height = 34
              Align = alLeft
              Caption = 'Gerar Boleto'
              Flat = True
              OnClick = btnGerarBoletoClick
              PngImage.Data = {
                89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
                F80000002B744558744372656174696F6E2054696D6500446920313820466562
                20323030332030313A34383A3536202B3031303039ACBE320000000774494D45
                000000000000000973942E000000097048597300000AF000000AF00142AC3498
                000003144944415478DAAD966D48535118C79F4B59A9ADB03E889888819390F0
                43120C45ED05A919324429AB651F02679A53A7B3E9B6726B6ECDA5733A595444
                6D99C84CC5971AD25CB945A492568C3024118940514B0B0BDDE9EC5C1D1AFB10
                791FF89F73EEF39CF3FCB8F7C2FD5F0A70D4F7CF27076C0F74208F07FC6A6585
                CC1E3F35CFF2F286EB1FDF669F680A93F271DB59ACDF94B779707090831BB315
                C27651B099189E5882E1F753F07670A8C7A4CC16E1D467AAE9D52FC48B0D807B
                776F83B44400269309381C0EC4C5C5019FCF07994C066C361BE4723928140A92
                53A954D0DBDB0B028100DC6E37B4B4B4901A397B3207DA6D6EA8CA8DBF8401DD
                9471E027BA9C18480E9ACD66326767670397CB058AA2C0E97442424202C4C7C7
                C3D0D010C98D8C8C804EA723FBED763B88C562525BEB71CD34088ABCC35A0CB8
                4335BE5844F949C18C02E4C6D7A02CE01830A0896AE8FF8E0A52588C02A40617
                A884890D1860A4EA9FCFA3C2A3BB190554D6BD84EA92641AA0EF9B45C2E3218C
                022A6E39405D7A8406D4D9665051EA5E4601921A3B68C4C768406DCF5754CC0D
                651450AEE903AD249506E8BABE20D1A9304601E26A1BD4549EA001359D53A834
                3D9C514099B21774F2341AA06D9F4465BC084601A2EB5D505B954E036EB64D20
                714624A380127927D429793440DD3A8EAE66ED6714502C6D07BD2A8306543F1E
                439233D1BEE26662AD4791C40AF59A2C1AA07AF411559C8DF115F3F2F2607A7A
                1AAC562B582C16E8E8E8001E8F072E978BE4BDEBBF73DEBDEB01C2F25630684F
                D3801B6637AA3C7F60C31D6466669243FE666FF8ABAD075C11354363ED391AA0
                7CF001492FC4320A2828B68051CFA7018AFBEF90ECE2419FA1A8D56A989B9B83
                909010623A0E870352525260747494E417161680C5626DC879F74A24125F8F7C
                E1436832E4D09FEB72BDA32D2A322C23F1D03E888D08DAD44B9E9E59004BB30B
                6CCFBAFB6D4F8D83C470F0109A5B69B9171A1E9DE65935F7359327A6BE6EFD2F
                F9F14F6FBCCD2771DF01629978D88615859588C5C6DA81F5BFEE8FB096B0C6B0
                9CC4F4570B5EC81EAC9D585B36F59C0056B01661F5B7E50FD8860838B338E260
                0000000049454E44AE426082}
              ExplicitLeft = 215
              ExplicitTop = 2
              ExplicitHeight = 30
            end
            object btnEditar: TPngSpeedButton
              Left = 69
              Top = 0
              Width = 69
              Height = 34
              Align = alLeft
              Caption = '&Editar'
              Flat = True
              OnClick = btnEditarClick
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
              ExplicitLeft = 71
              ExplicitTop = 2
              ExplicitHeight = 30
            end
            object btnAdd: TPngSpeedButton
              Left = 0
              Top = 0
              Width = 69
              Height = 34
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
              ExplicitLeft = 2
              ExplicitTop = 2
              ExplicitHeight = 30
            end
            object btnApagarFin: TPngSpeedButton
              Left = 138
              Top = 0
              Width = 75
              Height = 34
              Align = alLeft
              Caption = '&Apagar'
              Flat = True
              OnClick = btnApagarFinClick
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
              ExplicitLeft = 140
              ExplicitTop = 2
              ExplicitHeight = 30
            end
          end
        end
        object cxTabSheet6: TcxTabSheet
          Caption = 'Licen'#231'as'
          ImageIndex = 2
          object gridAut: TcxGrid
            Left = 0
            Top = 34
            Width = 690
            Height = 184
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object tvAut: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataModeController.GridMode = True
              DataController.DataSource = dsAut
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsSelection.HideFocusRectOnExit = False
              OptionsView.GroupByBox = False
              Preview.Column = tvAutObs
              Preview.MaxLineCount = 0
              Preview.Visible = True
              object tvAutEnviouCli: TcxGridDBColumn
                Caption = 'Enviou'
                DataBinding.FieldName = 'EnviouCli'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Properties.Items = <
                  item
                    Description = 'N'#227'o'
                    ImageIndex = 0
                    Value = False
                  end
                  item
                    Description = 'Sim'
                    Value = True
                  end>
                OnCustomDrawCell = tvAutEnviouCliCustomDrawCell
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Focusing = False
                Width = 60
              end
              object tvAutAtiva: TcxGridDBColumn
                DataBinding.FieldName = 'Ativa'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Properties.Items = <
                  item
                    Description = 'N'#227'o'
                    ImageIndex = 0
                    Value = False
                  end
                  item
                    Description = 'Sim'
                    Value = True
                  end>
                OnCustomDrawCell = tvAutAtivaCustomDrawCell
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Focusing = False
                Width = 63
              end
              object tvAutTipo: TcxGridDBColumn
                DataBinding.FieldName = 'Tipo'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
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
                    Description = 'Teste Gratuito'
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
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Focusing = False
                Width = 80
              end
              object tvAutPrograma: TcxGridDBColumn
                DataBinding.FieldName = 'Programa'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Items = <
                  item
                    Description = 'Cybermgr'
                    ImageIndex = 0
                    Value = 0
                  end
                  item
                    Description = 'NexCaf'#233
                    Value = 1
                  end>
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Focusing = False
                Width = 75
              end
              object tvAutMaquinas: TcxGridDBColumn
                Caption = 'M'#225'q'
                DataBinding.FieldName = 'Maquinas'
                PropertiesClassName = 'TcxSpinEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Focusing = False
              end
              object tvAutVencimento: TcxGridDBColumn
                DataBinding.FieldName = 'Vencimento'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Properties.ShowTime = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Focusing = False
                Width = 86
              end
              object tvAutAutorizacao: TcxGridDBColumn
                Caption = 'Autoriza'#231#227'o'
                DataBinding.FieldName = 'Autorizacao'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Properties.UseLeftAlignmentOnEditing = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
              end
              object tvAutCodigoEquip: TcxGridDBColumn
                Caption = 'Serial / Cod.Equip'
                DataBinding.FieldName = 'CodigoEquip'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.ReadOnly = True
                Properties.UseLeftAlignmentOnEditing = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 157
              end
              object tvAutCriadaEm: TcxGridDBColumn
                Caption = 'Criada Em'
                DataBinding.FieldName = 'CriadaEm'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Focusing = False
              end
              object tvAutCriadaPor: TcxGridDBColumn
                Caption = 'Criada por'
                DataBinding.FieldName = 'CriadaPor'
                Options.Focusing = False
              end
              object tvAutInativadaEm: TcxGridDBColumn
                Caption = 'Inativada Em'
                DataBinding.FieldName = 'InativadaEm'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Focusing = False
              end
              object tvAutInativadaPor: TcxGridDBColumn
                Caption = 'Inativada por'
                DataBinding.FieldName = 'InativadaPor'
                Options.Focusing = False
              end
              object tvAutObs: TcxGridDBColumn
                DataBinding.FieldName = 'Obs'
                Options.Focusing = False
              end
            end
            object glAut: TcxGridLevel
              GridView = tvAut
            end
          end
          object LMDSimplePanel14: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 690
            Height = 34
            Align = alTop
            Bevel.Mode = bmStandard
            Bevel.StandardStyle = lsNone
            TabOrder = 1
            object btnAtualizarLic: TPngSpeedButton
              Left = 69
              Top = 0
              Width = 84
              Height = 34
              Align = alLeft
              Caption = '&Atualizar'
              Flat = True
              OnClick = btnAtualizarLicClick
              PngImage.Data = {
                89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
                F80000002B744558744372656174696F6E2054696D6500446F203134204E6F76
                20323030322032333A33313A3434202B3031303084501C480000000774494D45
                000000000000000973942E000000097048597300000B1100000B11017F645F91
                000005B14944415478DA8D560B4C535718FEFAA2B405C409142CCA3614CCA61B
                F3117459E263C00C993A251999C858646433C2A6B889DBA23827A266EA1C1BE2
                D46C836D022ABE51501E8ACA23201244415094B620944281D2DB96D2EEBFF41A
                9101D94DBEA4E7DCFF3FDFF9FEF3FDE79687F19E84EAE9E8EBF9022249B08BC4
                71AAC56836183A9EDE416FEB0994249D404F4B2F4559C65B8237E69B9DEA0427
                33F3BDDF641FB1E7442184342575001CF84053732B6EDD2CAB4653FE46541FAE
                A4570682EDFF1324B7EF77173A6CF4707685C562A18585108B0001450B09CE62
                40C2B7E2C2C5824EA62A633DEE66E45156EF3012DEB3DFFF25D8DEF6A1C46AC8
                B459CC7AE3A3D272B4D7F7C249E1E2347D7EE04CBF59CE935C25801510912421
                A9B970F2DC536361F267E828BB86D08220987491D0B765A33CF63CADD6FF22C1
                A1DD7C342D6D445F6B0532563782D15151A021E8217573C1E2AF82E7044705FB
                F978C23A08C848098F141E4B492BA772ED55846CC8F872FD1269D28E1C6DCFE9
                B030CABBF322C116A502E6EE58EC7FE31EA7AE9EF09460261099683296EEDC1C
                B42A7AA5AF62126454B60924A8E2F6635C3C55ACDB971CE56AA61A266D3DFA48
                9F1F7398723247968844C383F00AB7701BC134ECBD2364DEBE78EFC7CC8475E1
                AF3B3912256588A95CED9DFD90BBCB60A371FC9AF812D41F28A0F83F4712B063
                917DB7308E614131E6C42D0B5C1E9315113A8B3F48110E02DA19DF7EAA1AAD01
                896BA34E437DB28486D9A3B9E8D9DCA8B643D83F6274742E01DFE5B783BB23BD
                252441C812509680949456AB90BA213C1DDA5B45149D6B5F2CB96F3ACC1DF130
                9BF430F7ABC0E809BD4FD0D6A1446E8C96220687E23E2E55C8044C59F0EC298A
                59BE724CF5741E2A11AB80B5B08874A7E7D4E0CC8EE5476068C9A58CA22102C9
                5E65F5A9958A0066C08246AD090F3466A8BA0D68D3996C1D0681AE43A3A9B4E5
                24ACC38CC8791111A1C7DF992B8790ACEA28B08325E1915E11B96ADBFE625B65
                6AE8610C3299B474050F5F577B2DF47753FF1DEECDBBD70E743274AA545723ED
                D944E8A3DF85B51A14A5C6264255958B05BB77C9BDDC67CB9D4513BD2649F90A
                37274CF19061B2DC190E62316262536A2C659BD8F2FC41A8E321AE7871CC22FF
                C2E8404FA87A00C662074BD2D0DE8FAA275DA8B97B5765488FC802D37D9692BA
                088110487CE138510A070F31C4EE8E107948212086D633ED3077D551CC19828A
                8798FCF5C9ABE7FFE24FF564068001926E24D7EBCC566C4939D982BCCDD7D1A3
                62601BBC4F0997094A821307EA02C808CEDC58CAF54C03A191C0F01075F9E723
                71417162910056DBF3F2B0164A2F7960BDBD67451A34F5D7D8AE6477C4260DF3
                9480036B6D21072B77F9B1FD63E361ED95BCBFE28342181A2ABB18C8E9AE3198
                ED243AEA847D4733EB703AFA5B0C18585FEBC6B4EF18F6E6B96FBAF93869CDDB
                3E9A3E2BBE4BBBD0151612F8D2DC697250BFA08F4AD6D4DA8D82EC5FCFE2CA0F
                DB487DC388CEB63FA1857BA02C49436DA29A4603C349786E1B6E757FB37A81EB
                DEACD2BEF6432BCE216497DFE79F7E32CF6A13426FB65F1E0DCD6A54E5675D42
                EDF9ED5017D7725D0E2CBAEA0E879E03549439B81A164D334DDCE5687D2E6BD9
                B148D86C1FA1E677159437B5707BAD49F2C14F49ABDE0F960F50998C167BB4B6
                5B8FBACADBFDBDCA962258F86A6A5B6F899762B1D5342031951F4A4473763385
                1513D42F28204C200410BCB9974D08885E207D2B3CF5DD9020371BB5A8D16477
                97856F779881A1818C8F8EDA8736EDA583C7713FE521E5B1675441E81979307C
                CE6A624EBA7168EC13F42EDE5CB3D57FEEC200CF575F8685F6C42A62ABD6A3E9
                475BC50DC658969A03E5B96E9A2A255CE76EDFC1D14E7E34479032E14C4C0B5D
                06F779F31DBD66F8F1F80E62A3A6A5DDD672A31EEABC2E98756CBDABB89DB3EA
                2DA32D847148D8C6F122F8117C61FF56B0BED7730DC77E901E13BA31C6BF8BF1
                089E3D42AE842C1CB992B256ECE7884C18BB37F02FC6D052D4213AC65B000000
                0049454E44AE426082}
              ExplicitLeft = 63
              ExplicitTop = -6
            end
            object btnEditarLic: TPngSpeedButton
              Left = 0
              Top = 0
              Width = 69
              Height = 34
              Align = alLeft
              Caption = '&Editar'
              Flat = True
              OnClick = btnEditarLicClick
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
              ExplicitLeft = 71
              ExplicitTop = 2
              ExplicitHeight = 30
            end
            object rbInativas: TcxRadioButton
              Left = 394
              Top = 0
              Width = 106
              Height = 34
              Align = alLeft
              Caption = 'Somente Inativas'
              TabOrder = 0
              OnClick = rbInativasClick
            end
            object rbTodas: TcxRadioButton
              Left = 330
              Top = 0
              Width = 64
              Height = 34
              Align = alLeft
              Caption = 'Todas'
              TabOrder = 1
              OnClick = rbTodasClick
            end
            object rbAtivas: TcxRadioButton
              Left = 224
              Top = 0
              Width = 106
              Height = 34
              Align = alLeft
              Caption = 'Somente Ativas'
              Checked = True
              TabOrder = 2
              TabStop = True
              OnClick = rbAtivasClick
            end
            object cxLabel3: TcxLabel
              Left = 153
              Top = 0
              Align = alLeft
              AutoSize = False
              Caption = 'Visualizar:'
              Style.TextStyle = [fsUnderline]
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Height = 34
              Width = 71
              AnchorX = 224
              AnchorY = 17
            end
          end
        end
        object tsHist: TcxTabSheet
          Caption = 'Hist'#243'rico de Contatos'
          ImageIndex = 2
          object LMDSimplePanel3: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 690
            Height = 34
            Align = alTop
            Bevel.Mode = bmStandard
            Bevel.StandardStyle = lsNone
            TabOrder = 0
            object btnEditaHC: TPngSpeedButton
              Left = 69
              Top = 0
              Width = 69
              Height = 34
              Align = alLeft
              Caption = '&Editar'
              Flat = True
              OnClick = btnEditaHCClick
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
              ExplicitLeft = 71
              ExplicitTop = 2
              ExplicitHeight = 30
            end
            object btnAddHC: TPngSpeedButton
              Left = 0
              Top = 0
              Width = 69
              Height = 34
              Align = alLeft
              Caption = '&Novo'
              Flat = True
              OnClick = btnAddHCClick
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
              ExplicitLeft = 2
              ExplicitTop = 2
              ExplicitHeight = 30
            end
            object btnApagaHC: TPngSpeedButton
              Left = 138
              Top = 0
              Width = 75
              Height = 34
              Align = alLeft
              Caption = '&Apagar'
              Flat = True
              OnClick = btnApagaHCClick
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
              ExplicitLeft = 140
              ExplicitTop = 2
              ExplicitHeight = 30
            end
          end
          object LMDSimplePanel6: TLMDSimplePanel
            Left = 0
            Top = 34
            Width = 416
            Height = 184
            Align = alLeft
            Bevel.Mode = bmCustom
            TabOrder = 1
            object gridHist: TcxGrid
              Left = 0
              Top = 0
              Width = 416
              Height = 184
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object tvHist: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataModeController.GridMode = True
                DataController.DataSource = dsHist
                DataController.KeyFieldNames = 'ID'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsSelection.CellSelect = False
                OptionsSelection.HideFocusRectOnExit = False
                OptionsSelection.UnselectFocusedRecordOnExit = False
                OptionsView.GroupByBox = False
                Preview.MaxLineCount = 5
                Preview.Visible = True
                object tvHistID: TcxGridDBColumn
                  Caption = 'N.'
                  DataBinding.FieldName = 'ID'
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Width = 55
                end
                object tvHistDataHora: TcxGridDBColumn
                  Caption = 'Data/Hora'
                  DataBinding.FieldName = 'DataHora'
                  PropertiesClassName = 'TcxDateEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  HeaderGlyphAlignmentHorz = taCenter
                  Width = 129
                end
                object tvHistTipo: TcxGridDBColumn
                  DataBinding.FieldName = 'Tipo'
                  HeaderAlignmentVert = vaCenter
                  HeaderGlyphAlignmentHorz = taCenter
                  Width = 83
                end
                object tvHistPor: TcxGridDBColumn
                  DataBinding.FieldName = 'Por'
                  Width = 83
                end
                object tvHistMeio: TcxGridDBColumn
                  DataBinding.FieldName = 'Meio'
                end
              end
              object lvHist: TcxGridLevel
                GridView = tvHist
              end
            end
          end
          object LMDSimplePanel8: TLMDSimplePanel
            Left = 423
            Top = 34
            Width = 267
            Height = 184
            Align = alClient
            Bevel.Mode = bmCustom
            TabOrder = 2
            object edHist: TcxDBRichEdit
              Left = 0
              Top = 0
              Align = alClient
              DataBinding.DataField = 'Texto'
              DataBinding.DataSource = dsHist
              Properties.ReadOnly = True
              Properties.ScrollBars = ssBoth
              Style.BorderStyle = ebsFlat
              TabOrder = 0
              Height = 184
              Width = 267
            end
          end
          object LMDSimplePanel9: TLMDSimplePanel
            Left = 416
            Top = 34
            Width = 7
            Height = 184
            Align = alLeft
            Bevel.Mode = bmCustom
            TabOrder = 3
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
      'Default'
      'Arquivo'
      'Exibir'
      'Editar')
    Categories.ItemsVisibles = (
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = im32
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 376
    Top = 96
    DockControlHeights = (
      0
      0
      28
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'MenuPri'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 23
      FloatClientHeight = 22
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmExcel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAlterarSenha'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmEmailCli'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmFechar'
        end>
      MultiLine = True
      OldName = 'MenuPri'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object BarMgrBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'BarraComum'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 26
      DockingStyle = dsTop
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <>
      OldName = 'BarraComum'
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      UseRestSpace = True
      Visible = False
      WholeRow = False
    end
    object cmFechar: TdxBarButton
      Align = iaRight
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      ImageIndex = 17
      OnClick = cmFecharClick
    end
    object cmImprimir: TdxBarButton
      Align = iaRight
      Caption = 'Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Visible = ivAlways
      ImageIndex = 22
      PaintStyle = psCaptionGlyph
    end
    object cmExcel: TdxBarButton
      Caption = 'Exportar'
      Category = 0
      Hint = 'Exportar'
      Visible = ivAlways
      ImageIndex = 7
      PaintStyle = psCaptionGlyph
      OnClick = cmExcelClick
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Alterar minha senha'
      Category = 0
      Hint = 'Alterar minha senha'
      Visible = ivAlways
    end
    object cmExibir2: TdxBarSubItem
      Caption = 'Clientes'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object cmNomeOper: TdxBarStatic
      Caption = 'Contas '#224' Pagar'
      Category = 0
      Hint = 'Contas '#224' Pagar'
      Visible = ivAlways
    end
    object cmNovoMenu: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 0
    end
    object cmEditMenu: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 8
    end
    object cmApagarMenu: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 12
    end
    object cmConfigMenu: TdxBarButton
      Caption = 'Configurar &Menu'
      Category = 0
      Hint = 'Configurar Menu'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 15
    end
    object cmVoltar: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 34
    end
    object cmAvancar: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 1
    end
    object cmAlterarSenha: TdxBarButton
      Caption = 'Alterar Senha'
      Category = 0
      Hint = 'Alterar Senha'
      Visible = ivAlways
      ImageIndex = 28
      PaintStyle = psCaptionGlyph
      OnClick = cmAlterarSenhaClick
    end
    object cmEmailCli: TdxBarButton
      Caption = 'Enviar E-mail Clientes'
      Category = 0
      Hint = 'Enviar E-mail Clientes'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Boleto'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNextar'
        end
        item
          Visible = True
          ItemName = 'cmPCPhone'
        end>
      ItemOptions.Size = misNormal
    end
    object dxBarButton2: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object cmNextar: TdxBarButton
      Caption = 'Nextar'
      Category = 0
      Hint = 'Nextar'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Down = True
    end
    object cmPCPhone: TdxBarButton
      Caption = 'PC Phone'
      Category = 0
      Hint = 'PC Phone'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object cmArquivo: TdxBarSubItem
      Caption = '&Arquivo'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmFechar'
        end>
    end
    object cmExibir: TdxBarSubItem
      Caption = 'E&xibir'
      Category = 2
      Visible = ivAlways
      ItemLinks = <>
    end
    object cmEditarSub: TdxBarSubItem
      Caption = '&Editar'
      Category = 3
      Visible = ivAlways
      ItemLinks = <>
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 308
    Top = 96
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15136253
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7346457
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = []
      TextColor = 7346457
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16436871
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8036607
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8894686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12180223
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 1262987
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8894686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8894686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 9476264
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7568529
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160664
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9476264
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7831957
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor]
      Color = 14590588
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13795663
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clYellow
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14590588
      TextColor = clWhite
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor]
      Color = 15185807
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11582091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 6184495
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15120279
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxVerticalGridStyleSheetPlumHighColor: TcxVerticalGridStyleSheet
      Caption = 'Plum (high color)'
      Styles.Background = cxStyle12
      Styles.Content = cxStyle14
      Styles.Inactive = cxStyle16
      Styles.Selection = cxStyle17
      Styles.Category = cxStyle13
      Styles.Header = cxStyle15
      BuiltIn = True
    end
    object cxVerticalGridStyleSheetDevExpress: TcxVerticalGridStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle18
      Styles.Content = cxStyle20
      Styles.Inactive = cxStyle22
      Styles.Selection = cxStyle24
      Styles.Category = cxStyle19
      Styles.Header = cxStyle21
      Styles.IncSearch = cxStyle23
      BuiltIn = True
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle25
      Styles.Content = cxStyle26
      Styles.ContentEven = cxStyle27
      Styles.ContentOdd = cxStyle28
      Styles.FilterBox = cxStyle29
      Styles.Inactive = cxStyle34
      Styles.IncSearch = cxStyle35
      Styles.Selection = cxStyle38
      Styles.Footer = cxStyle30
      Styles.Group = cxStyle31
      Styles.GroupByBox = cxStyle32
      Styles.Header = cxStyle33
      Styles.Indicator = cxStyle36
      Styles.Preview = cxStyle37
      BuiltIn = True
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <>
    AlwaysFireOnPopup = True
    Left = 240
    Top = 96
  end
  object CP: TdxComponentPrinter
    Version = 0
    Left = 272
    Top = 96
  end
  object cxGridPopupMenu2: TcxGridPopupMenu
    PopupMenus = <>
    AlwaysFireOnPopup = True
    Left = 408
    Top = 96
  end
  object dxDockingManager1: TdxDockingManager
    AutoHideInterval = 50
    AutoHideMovingInterval = 0
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LookAndFeel.NativeStyle = False
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerCanClose, doSideContainerCanAutoHide, doTabContainerCanInSideContainer]
    ViewStyle = vsNET
    Left = 257
    Top = 153
  end
  object FM: TFormManager
    BarMgr = BarMgr
    PageControl = Paginas
    OnPageControlChange = PaginasChange
    Left = 56
    Top = 129
  end
  object im32: TPngImageList
    Height = 32
    Width = 32
    PngImages = <
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D650046722031392044657A
          20323030332030313A34333A3439202B303130300F84E1980000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000004BB4944415478DAAD976D4C5B6514C7FFF7F68552188595CD042889C1A9
          B3323598E0CC34337C59641FC5E8C7F941B3988CE10871646631266AB645FDB0
          30C5282C192D8A992F6C63CC590201440371502850CA48CBA0D2A5032CA5BDEF
          9E5BBA642302B69727397DCB3D27FFE7BC3CBFA70CB6582ED76F67338CC67715
          519045915E644594154596D696A8288AC4300AB7BA1A8B07E6E6038D8D5F1F9F
          98989823576EABD8EA62B67A6066E676D8EDF6EC9C927623C7282353CFC06050
          207012384E00C78BE0441192A460373F8B8F3E3D7B626A6AEA32B9DE2113350B
          F0783C81699FD7D695F52A0A7728C8CD36C06C64101380A515018B5111F72202
          16A2C09BE265D4D49F3E1F08049CE4FA17594CAB00667070D01D5BFCDBDEC61F
          C023D980D9A4835EAF832C4A58E1144448892A642EAA474D7E2FDE3E56DBE4F3
          F9BE23DF3EB215CD027A7B7BFBCCACB8FFABB912E4E6645309001DCB4092154A
          BD8C684C42841371E71F16758F8EE1BD9A6A87DB3DFA03F976912D6916D0D9D9
          79CDB6CB72E8CCB00599B95664E8E847860135227851415C901222E669AFEFEF
          F5E39353B53FF5FD3ED046BE9D6461CD02DADBDB1DF612DB1B1F74F310B36DC8
          A00664552F19A091409CA32C50432EAC02B57B43709E3FFDEB956BD7D5125C21
          5BD02CC0E9745E78F1F9D2774E5E0D236C2A81492725BC14329132C009324D82
          9C68C2EA7D8B18709EF9E3526BDB25F25527615EAB00381C8E8FF797959E3CD5
          1E845B7E824A205109582A814C19A0611714C4E272220335CFC5B0DCFDC56443
          E3B7DF906B2BD64651D124A0A5A5E544D933F6738D377DF0EB1E43A1459F380F
          4CAC4462049868D4337522F48A086B8688EE9B1DA1739F7DDE40AE17C9FC9A05
          34343454BDFCD281EF7D931E980C2C046A3A896A2FC9129540C66A2C4619E0C0
          0B02621C8FC9C9294F7373B39AFE26B2DB9A4B50595969ADA8A8B8303C3C6C0B
          0683F1F2F2F27DF9F9F93BE9B4434F4F4F47381CBECBF33C2790328EE3E4783C
          CED3F1EC21D7ABA9F4C0664268F0602B2E2E3E48EBE9BABABAB72C164B2E9506
          37682D2D2DDD1A191919234EA81D4FAD08EA86C4F8A9DF37E341A234CCFF818D
          4EC7B07ABDA188669ECDCACA82D7EB457F7F3FAC562BEC763BCC66F38AADA8D0
          483104F24909584CAAB0B13F5B86F1F1714C4F4F8365D9C456AAAA5E2351D348
          07584CAAB0E91A189AA19D5B28F5D9D16854BC4BABBEBE7E576821684E07582A
          6C465381CD91A3D50EBFDF1F49D65BED1D895AE17026C33F990EB054D8F4A702
          9B9AE3C75A4747C75CE43C8424ED5C2ED7C55C13FB423AC05261D391266C6E24
          BB1D5A80A5C2C6A911369A80A5C2E64B8DB0D1042C663B60A32506B31DB0D112
          83D90ED86889C16C076CB4C46092B02922D8BC42B029DD02362BC903E8DE3AD8
          A41D234141527A302727E717B21D7432AAFF051E824D28140A12803E6C6A6AFA
          196B375D0EEB2E1AE9C64808181A1A3A9C9797F7634141813E1289A807CB43B0
          A1B4627979D94B3B3A9A3C0197D7B335DD18F7EF019954C74384DAD7298D4FD1
          7BD183B0999D9DF5D20E7D14F84F7AB603FF7DDB4D2BC67D01AACC3CB23D648F
          93159059C88C6BE759A266EACCDF221B4F7E5FBFD28AF1E04D48FD6C22239EC1
          4C664806556B2D266F3A2A0563D8F8A299720C6683201BAD4D6FB8E9C4F81770
          C4565983CFC23D0000000049454E44AE426082}
        Name = 'PngImage1'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002A744558744372656174696F6E2054696D650053612038204D727A20
          323030332031333A30323A3335202B303130308A646BA20000000774494D4500
          0000000000000973942E000000097048597300000B1100000B11017F645F9100
          0009614944415478DAC5570B7054D519FECEBD771F771F6143240112340D2A16
          717C1646E293A9A86DC7473BA31DADDA195BB1B533D0FA624ACB508D3A6A2DD3
          5A05468582A5DA804A0A2842020488896830649828249125C9267137D96CF675
          77F73E4EFF737757B7D571EAD469CFF0734EFE7BEFF9BEF3FDFF39E75F86FF73
          635FD1FF7535FE2F40C73857C68E276E54645C90337517B3A0589CCBBA051763
          B26C5A5CE69015CB32144B92646EC92E8B4332C1640B70702E29168DB965390D
          2EC916836C9950C0248769410E8D8C3B42A198121A1C8B8487829B3B37DFB581
          60136406EB188D95C3F4ED7098C69C5012EEB4CE148343314D0E02E686C179CE
          12637093900C8B335DE762CCC432E83DA6131343BCC33971B00A7E4666C1A4C5
          72F13163D07326BADBFB10FE60CB13A1779F5D43AF8DB2E6BEDCC6694EFDBAB6
          901248E89293A6803D59897132DB27B4330B3EE47DF4CF7E4E5CED31B82092EF
          B978867C0F22203964C42349ECDFB8FEE8C4E155BF25EF41D6D2A7479999553A
          232EBF8B5EB6C4649605BD848051244133EB3459967A8D06F63B46DE67F2FC4A
          0DD2DFA4EF4928D0FFF41D847A76D0658581D3872D2FFDA5CFECFECD3A72FD9D
          0898E35C4FB91A835EEF87298926A7C0D00762522EC15E8D493E939C429D80C2
          31CF91C6E2D932F7B824E674485065069783415500B75382878054C767460BFF
          B4E9E99871CD4D3F3ED1BAA7E955FAF365B6AB4F1FF41ADAD4FB8EF83C9BE776
          22C7DCF07ABC145403D1DE3D94691AA6569F878A591702B9090C65DC78E24839
          36DFEAB51893A4FCB406CC4C065A36870CF5D96C16E9B486642A0D2DA321954A
          6122368959B34EC79CB3CFD27F74FB6D3D6FBDBDE7359BC08E9E6C6F999CADBE
          F77DBFBAF7922EC4952A0C75BE8CF0A18731AD0AF07880581488B33A2CBCA703
          89AC81956D1E6CBA4535559743DEBAF53548C443D77552CA8441C4454FF90859
          966D733A9D765F5B5B8B993367E6EEBCF3CEEEE6E6E63788C066B6BD27D31560
          D9393F7DBFCCBDBFBE17BD3DFB31DC7C0F669C4E8F697D126D540A29FA7A8085
          CBBA01EF0C3CDCEAC4CBDF970DAFEA5242C3233680C3E1B04144AF288A6D2297
          44133DB79392637070505FB26449E7BE7DFBB6D1A357D81BDDE9F672C5B8E0DE
          4EBFBB75D118F63C351DA75598486580E9D316A2627A9D9DC9DF4014898B1E45
          D4331B0FEC013611018FDB4119913FB3186539E7FC73278E5046982021080E0D
          0D194B972EEDD8BB776F939D848DDDC9962AA779D97DEF9739B79EDF89779FBD
          0481E980C26BF09D1F3E08B8CA60A7F2A9764C54DC84F1AACBB16C97890D374A
          96DFAD48F164AA10F3B46D8944C2B6783C8E70388CFAFA7AD4D5D5D96111EAF4
          F7F7EBF7DF7F7F5B6B6BEB3F88C016F6EA91F88E2A17BFE681EE32E70BDFEC44
          3711F051EC6B2BE7E3E2FAEB2906EE7C2C4EB521727E0392DE5AFC6CBB8E0D37
          3053552CB965DFFE4F572A5410D28B90B85C2E1BB0A6A606E5E5E5766E8867BD
          BDBDFAF2E5CB5B0F1C38B0833EDBCAFEDA116B9C3145BEE9D7473C8E75976B38
          F6874A309E46CD69B371C59537E775940C20DC87C96BB7214EABBCFB0D1D2F7D
          D734037E879C48A4A1AA2ADC6EB79D8CB95CCE5E6D31EEC5C4146341ACA7A7C7
          58B162454B5B5B9B20F03ADBD83EB171669974DBAA2E55797A7E1467AB71B43C
          7735F47008B72F3C0F50FDC8C44CDCDAB5046B56DD08B75FC52D9BD378F17B86
          19F028726C32616F33217B2412C182050B6C40FBC629245E31378422C78E1D33
          56AE5CB9BBBDBD5D10D8C6D61F1A5F5B1D50EE7EE2A8AA342C88C21899C055BF
          1B80C797C463BFBA10F5F32AB0FB888EC75EF90899FE20C2DB6EC66D8D1AD62C
          CE9A01AF22B71E3864E740711B2E5AB4E8D31D208045588A3B41F8BBBABAF486
          8686B73A3A3ADE2477137BE160E49933A6BA96AE3EE6921FBC38866BEFDA89CA
          73CF80D3E746B56C60D94357D00512C48B3B83604E861B66BA3034732E9EAE8F
          E9157E9723A565EC788BC98BB920C0443804B818C76231FBB9CFE7C3E1C3878D
          C71F7F7CC77BEFBDB7935EDFCED6B4861B6AA7AACBD7F7B9E55C6F177635F7A1
          B2662AD4291E448663B8E49C72043F1E87326B3AB2E91CBCB138E65C73391EFD
          D6B81EF03A1C740DDB4022F6C59D904C26ED5D3031316187469C8EF3E6CDC3DC
          B973412B379E7CF2C9A6CECE4EA1C00EF6ECBED115B32BD447B60C7AA44D1B5A
          E04E4EC01DF0C1E5A32C561DD05239185418E8290DE958123E92F5DB3FB919AB
          2E0AEB747B39FA4F9EB2018489100805C46A852A1E3A4645828ABE387EE79D77
          0481D78F1E3D2A08BCC9FEB87B78D99955FE67B60D3AA517D634A35649E2B469
          65089479C954F86CA309A678E1F17BA0A84EBCDD1DC5735727B353BCB26B3034
          6C67B730B11384896413F117B921E4174A545656C2EBF5E2E0C183C6EAD5ABB7
          1408EC624FED1E5A3267BAFFF9E6A02499AA17B3548E78464732AD234557A396
          3328AB4DE4840A74238AEB793C6561DD75E9DC548FEC64B2C38EB3A6E52F1D61
          42FEC9C949DB27141144E6CF9F8FEAEA6A343535E96BD7AEFDDBF1E3C7771181
          3DECF76F0EDD513763CAC6FD41AA640AC5887DEF8BBBDD14B540A12F194752C0
          F38B937AC0693A0686466CF98B979068453584E47EBFDF36119693274FEAEBD7
          AF4F373636BE42DFECB40B9286ED277F70CEAC8AC64303546E1945B03C11BD38
          FE3722910CC7735726F40A1F7384C7A2B6E445F9059038F329313929C1070606
          100A8578301814C7F0081DC12DA3A3A3410217B7E187ECA14D1F5D3FA7B66267
          CFA48B65A8B8334A41CD7C65F41989FC784C93F0A7AB26B4EA805BA51AD4DE72
          24391F1E1EE674DB890B0704C269478C44A3D1FE4FA88D8C8C24C897A3708508
          B89DEC08D924BBE3E943979D7D46E581B4BF9AC5699B7D6EF57649457FDB271B
          1596945CB149030F9DD99589473F719D1A18024D6ED1D61BA184FB98C6A38497
          181B1B3348E69C00211B238B8822946CA8D027C5F9C42EBEE3CFD3CE3AB7BE7F
          EEF935BE704E65762C05A8A80F698F6B298D6B8914D36254E1D019901C4FF1E8
          443A7CA9BCE1C460687484E415603A81E905B071B27001508CE3641A59B6A437
          4A7F172897FE62EFF2805F79A46E5EAD3599B2A45894CE77DAF3A97806392D1B
          D1C67A7B27431F8C2447BB13D9E8899C9E89EB858923050B9780654AAC14ECF3
          C542C92FA08ACA05BFFCB9E4AEBA0E66DA3463273ED1C63E8C67634143CF4C66
          0B3F22C64B00C70AABD5BE0AD897111007395501A0EB0F75A282268B95C8182B
          01CB164CFFAA605F46A048C25B30D1725F00F65F037E19812FF27DAD60FF2981
          FF69FB274ACAE8377687A3A50000000049454E44AE426082}
        Name = 'PngImage2'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002A744558744372656174696F6E2054696D65004D6F2033204D727A20
          323030332030303A31333A3238202B303130305DE1AA650000000774494D4500
          0000000000000973942E000000097048597300000AF000000AF00142AC349800
          00088A4944415478DADD96696C14E719C7FFEF5C7B780F9F6B6303011F1C36E6
          70CA875012A96A522155553FA3A212A8902AF8406DF70E21AA1A829483A8488E
          CC914052B5A82A12A512F408A5AD15A442A4D8D8D8F8BE77EDD9B5BDF7CEEECE
          EE4C9F776CAC6DD31421A58AD4B1FE9A991DCFF3FB3FCFFBBCEFBC0C5FF0C1FE
          5F0D7C565CF3F33460BD7BE05B07849AB535350C428369A05E14A43AC11436D2
          7D2D3D2ECBE5F5293D9719D7F3B9D1543A35964E6BC3C3C343A377EFDD4DD2F3
          FCE30C58CF3B3B3BE55824B64110C4869C6ED4C3409D28881B0588B59A96DE68
          38B28EBC2701C34B72A790F72491E7D7F60C58C40961C901334CE788C3C05211
          8C8430FFC65BAF3F4BA1038F0CB08E8E8EA2543255A748B67A236FD65336B502
          136B392CA5696B99372D9BC56998DE144983E1491190AE8B49520E660E300C93
          CE06E87D434BE5CC4C368B744EA7DFE9390534459389B6BC50DAF9F5E8DB1D6F
          9E20EEEFD8F973177E9BD7B0279D4955191E4D60A569A044038A33304B321600
          1E0D26A300795E343A1B7426584E378D683C6946131AA2C91492D90CD27A967E
          D7992040B0C93224BA90499225CA57CEA3ECC2BEE8D9F36F9FA32817D81BA7CE
          A8CE6323E5823B6B52C1794598C9F26CF9828340010D430D87CDB9708C85A251
          339C4A103089643ACD4481090A87104C11C5559828804401488CCC0B14AC4429
          47BD6B3BD45FB8A39D17DFB940D1CFB1D75E7E5DB5FDB8DB97CDE848A7D3D0D3
          39930298FE581277A7C6118A46104E2499240BCC264904219828C14E306905C6
          0822AC881148A4FF59AFD462936D1BEAECDBD0E068C626C74E386537A6CD0738
          F352E7E2A50FDEBD641978F5C46BAAD976C74759C2C802D9AC8E1C8DDDC713F3
          66D7D43073285241566C19B20A33E0965C68501AB1C5D6887A5B33363B084867
          5DC8603CDF8F71A31793FA034CE6FA1034C6B1D1B105E9B79A42EFFFFABD4BD6
          10BCFC9393EAFEE3DFF40DE63F424FF63616B23360BA80FB534BE647B3E38C49
          3414544EE2A35A2AC356B9095B6D1CD884CD045AA76C400C618C99031825D038
          653846B045C38F72C98746470BB6D85BA8022D64AE052EC583636DDF0D5DF9CD
          95F7C8C04576E287AFA85F3A59E2AB4DEFC626E3192CC28F6EED4FB83AFCFBDC
          F87458DA6E6FC6362AE356A5095EA9849E073144B011838094E158FE0196CC30
          5CA28C46FB0E34D9397027B6DA9F468552BDDCBCBC9904C34A449444B47FBF3D
          74F5EAD565033F6AFFA9BAEB15A7AF2F771B692D85A7722DD8A17C15BEF9CDD9
          EEC15E655418C6607E102304E5E004CD374504EAE51A6CB73D8DEDCE5D046E41
          837D33B234E5AC8A897CC9A33F81F78348D5A33EA1B6E6D7BC59DBDADA42D7AE
          5D5B36D0DADAA6FEECA59FFB0CE4D09FEBC23FD2D7D197F83B7AA7178C4FA6C2
          D47180935EDC45909DB69D68B6EFA22C9BA1C08E6822428A22968C21918A5B4D
          BC77EF5E288AB20AE62A34215123B7B7B787AE5FBFBE6CE0F8F1E3EAC993277D
          B4CA519544D8443B322C810F06CEE726865469B76B37D6D8D65890489C66443C
          8C683C0A2DAD59D914CA344DECD9B367D5001707E6F37984C361EBBEA2A202AD
          ADADA11B376E2C1B3876EC987AEAD4291F7F998BBBA4D51063A3E3DA40FF0387
          6C9371FBAFB721D0D4E2C1B8FE1DC0CF4EA713C5C5C5686C6C84A669884422AB
          4AD29AC1E3363737A3AEAECE3270F3E6CD6503478F1E554F9F3E6D197874F0A0
          434343DAC0C080C36EB7E3CE9D3B56868FC69197D3ED76A3ACACCC82F2FB2C4D
          DDA5A5252C2E2E42D7752B466969292A2B2BE12BAF4445998FA6B3622549B320
          70EBD6AD5F5A068E1C39A29E3973E65F2AC021F4C9D2FAFAFA1C369B0DF7EEDD
          B38271391C0ECB642A95B280B158CCBAE726B899AAAA2A545654594087E28068
          4808B100C673DD9862F731CB684DF84179E0CF7FFBC3FBF4DABBECF0E1C3EAD9
          B3673F658057A0B7B7D732100C06914824AC72F2F23E6A280EF4F97C04AC4465
          7915EC0494984CD33288E17C3726CCFB18470F3421029B60835D56ACE57AB675
          6DE0C3AE1503875E3CA47674BCE3E30BBF61185636BCDC0F1F3E4C747777BBF8
          1074757559A63C1E8F55F68AF20A0BE8509C34496444D822068D1E8C12709480
          71BAB753B96D5C144B94452832ADA23911F901B7B970C93577ABEBC3CB968183
          075E54DFBCF8AAAFDCAC41967F36599EE631437F7F7FBCA7A7C7CD2B108BC608
          5809A7AD08D48248B028060838845E0C137091CDC341195A4051814C8B8D4440
          EA6588A122B0871E98832EE4266D99782A7A7F62666CD0EFF73F240357D8A1FD
          47D4AD97177D25D975D8617C8DE6FB3E6A2001FDBD03F19EEE1EB74B71212D6A
          E827D800FA3048C020F35B19DAC565E82A90D60C99C65C992C8132E28538E435
          735104E616FCBD8160405D5808D177D58813D84FEA237DCC0EEEFF8EBAFD52D2
          974D6790D0125637EFB43F0F73B23A79B9F75745C3D20035CE3C0141922953C5
          FA1A4A12F50A0145023BA22EB8C6CAE01C2F853CEDD6E3A944EFECFCCCD89C1A
          8853EF6408B4449A254DF35DD0CA3DEFDE04FBF6FE83FE8A6F64AB8B5FD06883
          463B98A48E6C46A38FD15CEE2F6363925D16A0089255156A039007284C324BFD
          3E78672AE099288718B385020BB3DDB37333F3C15050A7852741C1E748332B0A
          AE00F93E90763CB4ECAE6C50D973CF3EF715B7D3FB3DAFC7BBCFBD37A5B89E8F
          4228CAA06F24A8FF71725856146A1EC58437E1352B67D7A07CB60A9ED96283B6
          697DD3735323013510A5A9A853AC704196FE957B6E84B654C8AC00FFE3AED845
          6A2C292979A67173D3972B4BABF7B9776BEE40D344E693B1796983BA8E55CFAD
          853DE608FB17FCDD53FEC9006599A5C58667335F90A55A90A55698E5E376BD5C
          7C752925D5D042B3A3BEB661CFFAAAF52F64F4CC927F7E7688B28C44A3D14759
          FA0BB25C5AC99243B3CB1BB8C7433FB5ED2EB8A68983625235690BE929BE0D2D
          184F9E65B4204BFD4981FFCD40E16F0AC94D2A5A01A40AC6F289B37C52039FF5
          FC73833E8981FFF9F1851BF827CFED21A7BBB602FF0000000049454E44AE4260
          82}
        Name = 'PngImage6'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446920313620417567
          20323030352031333A35373A3530202B30313030D18698470000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009AF4944415478DAB557095494D715FE668761071561D8A546A31137ACD5
          98588E0B1A50830115978A566D533D49AAB1271E8F4B1B7B3C2E551B0FB14A34
          8A8A2DDA28CBB820A088822C56185140181C0687611B8665F6ADF79F198D1AAD
          A6E7F89F73F96798F7DEFDDEBDDFFBEE7D2CFC8CA7A2A262735B5BDB579D9D9D
          50A954E8E9E9417777B7DD7A7B7BCBCF9F3FBF8886759119DF744DD6CF019095
          95B56FC890219F0B854228954AB4B7B7A3A3A3030A8502C5C5C57557AE5CD941
          C3F2C8946F05C0912347F64F9830E1331F1F1FB4B6B6DA9D3F0170F9F2E5FAA2
          A2A2741AC698ECAD00D8B367CF6E0E87B3C1683442AD56A3BFBF1F1A8D067D7D
          7D90CBE535A5A5A5FF740278F456008485850DF6F7F79FB36CD9B27FCC983103
          F7EEDDC3D9B36721168B33880FFD56ABB592866593298E1E3D3A8A78B13E2F2F
          6F5B6E6EAE020E5ED8FE6F001919197E44C08FF57AFD6C8140F0B18B8B0BE8B3
          9D8C3299EC16A5A1A4AEAE2E972251B96BD72E2FB3D95C1C19191972F3E6CD7A
          E2C7BACACACA5BB48CE64510AF0570FCF8F1000AF9668BC5B23C242444481180
          A7A727B85C2E4C26933DFC0C0F5A5A5AD0DCDCACA51371C6D7D777ECECD9B347
          BBB9B98188098944D25E5353B3A1ACAC8C894E2F99F58D009C3E7D3A99727D30
          2A2ACA67CC983160B359686C6C407D5DBD9D03CC740F37570C1CE40F5F5F3F68
          753A544B24A8ADADC5F4E9D3EDD1E9EAEA62F801A954DA42E95A42939834F5BF
          1600857C2BED7A6B7C7C3C8BD9B1589C8B478F3B10103E1C61BF1809574F3718
          CC804A6D44ABBC11BD8A7A0C10E8201205A34BD58D82820278787880D2050ABF
          E1FAF5EBA708CC6D5A3A0BCF1C53D62B9CAF67B3D9BB13131359CC0E4E666462
          5A7C128202FDC06703169A75FF4EB9FD040C8D9E8AFADA7A58070E85BA5B8FDE
          DA3C0479726065B14104648EA8B5B0B03083F8D34E4B5F242B25EB7B25809327
          4F4E31180C058B9393B99D9D1D382F2EC0B295BF81900354575543141201A187
          3BAE646741D5D58998C415A82C2B876F64340C345F4D4B9B147730C82CA708D9
          4027C07CEEDCB9EF891B85F433636DAFE4C0DEBD7BB9A472FFA12336D27FD040
          1C3E7E062BD6AC426F9B0201A24010067BD8F564FDF44763A2CF162E34168A0A
          45467C220D3D3A2326267D0A4ECB1D78E99AD1D2AAC4A54B976A2E5CB8B099A6
          5F6330BEF21410E39750DED2E3E2E2F0DDB1EF317DFE2A887C0079930C61E1A1
          F6C14672A623001ADAAE960068E9B3950B14E75D454EFADF31FFCB6FE1355804
          35FD1EDC56008B4E8DFC82425CBD7A751791F3081C22657E2980B4B4B46B9327
          4FFE90CB65A3A8BA0509713120E2836D730C640EB09982A737399CEB999D5358
          4A6F94E06F1B972265DB0984464D424389185E21232170F784BF321F52999CA9
          23B7880B4CADB849D6F31300870E1DF221E2B5252424F07228BF51B352C0EB6E
          808B8737BC7C06D8C758C9B989CC4C8EC9BF3DEC15A577B065CD1CCC5BB505E3
          662E0447E8893EAD15AE2E6C3C243EBCAFCD473B15AE7F65661A890F9B48A018
          B97EFC44909E02A042338DC29F17F3EBA9C8F8E122662D580E2FBEC39995865A
          AC0E636671054093B41552D284DD1B53303CFA43ACD8B013614103A1D1038D94
          65130D6CD102C36D8DD037DE445E7EA1BD9A92361CA5256A9FA4E12980D4D4D4
          5501010187C78F1B8B53E212CC4B5C00AE590736CF152666C716C760FA8A837F
          DD86EBE2B3F6E902A13B36EE49C79D4E31C4F78FC36064E18BD8031099DC516D
          1221C4870F4BD559DCBA5D8E9C9C9C3452CC9334B18C4CF71C003A019F858787
          EF1F3DEA3D9CB95A855971F1D0B44BE1173C0CFD44281BC303B6E3FDC9441164
          F2C72436F9F862FD06A4E796636EEABBC85A7B0635CA6AECCADB8F70EF09583E
          75274D7043CFAD532829AF447676F671524506799153927F04B073E7CEDF53B5
          4B1D13350A3F14DF27E1990F6F4A413B950F03259CED1CC97701D6C4462179E1
          02C89BE5A8AE6FC2BE631790F0ED70EC5BBC03B26E29CC2C3DEA94B5B878B70C
          6BA7FD1953394370263313999999C7A88FC876EA81FA3900DBB76F8FA714644D
          FAD54414944A101E930CAD4C0297C1EF82C7E3D84F0228026C3285AC1127767F
          4960DC30317E25E2677C8039DF846347D24648550DE83377C368D3C0CCD1A1B4
          4E02817E30920727A3F842F129AA07FFA6950A7E0260F5EAD5A2888888475444
          B835922A605C0A94770B10F2DEFB04800F16EBC7A3C8E238C8A9E9D780251062
          C40016E67E1384AF123E854CDD480054E8B7A8A1B3F590461888BC16DCAE5662
          A4657C45FED7F90749321949EE60967B5607B85BB76E2D8E8E8EFEA59BAB0055
          6A2FF80C8DB6AB1FCBE9996573CE604E85F36430BA306220907038101B3E5A8E
          E63E29FA2C5DD058BBA127C9E753F404020E84B4A64CA1C695A2C687540F37E1
          3A2E3355F15900AC75F450140E1008A67CA26FF85268E512E8BB5A208A9E451E
          9D22EE04C06882916C7400907C34009FCF5E48009AD067EDA4CE4345CED9F6F4
          F1A98231E2C6E7F3E0C2E3625F5A49BD798F358556AA7E4E09870D1B36283636
          B664CA9429119EEE6E9076DBA08E8805DF917E580D7A3B0B1941A23AE35045B2
          C9C1404A7A20D6CD9C0FB9468A7E0260E668E0E2C225005C72CEB137307C1E0F
          AE7C2EBE3E70ADDEB6DF924A4B9E7BB11A72172D5AB4203434F4048160DBCC46
          286C7E90F94D01CF6480A6221DDE1FFC1626AD8EC4C9023E6980ABAE0D1FBCE3
          87B9C742B02E761E5A348F68F7945E9ED90E8071ECC217C0C3DD151212AF7339
          D50DB6EF6C37E8F670F7650098C78B9ACEBF50FBB5965A70162C26E8B99EA871
          9F04155B080F2A3CAEEA26F059940FFF48E8958D181B3118ABB322F1C7999FE0
          B1B68912DB490266A6DCF3E1417708039125A3B052AB38D52B463111C38A7AA7
          1654BD0C00C3BB80A4A4A41D4141414BC78F1FC7E2D12E5C29875AAF70B4F023
          203779A3D3C4B2D7036F1EB0E41D20F1B43FFE346B3114BA26E8582AD8F84678
          7BB8E1FA8326DB8D2C690932D040258861FE1D3266F7CD649A57B564B42C8263
          62627E271289FE40DC10868787C16A3683CF6153388544283EB8240A7ABA23F8
          070623EEC647D812BB12AD7ABA93B8F6A3A15B8ECC826AA5FEB4391FF7ECDD70
          0D1CFD6003990A8E7AF63F9B520644208953CC88112392060C18308DC070FDFC
          FC9E76C5740FB0B7E60410ABEA56E050D2263CD2D4E37065B64D9229CBA51B42
          17B961765A41768FAC954C8F675AF3D7B5E59471504B8248723A2130307014BD
          2368F7C154BABDA86905B56F6AE28B4A3049E059E1591AFAF041D3039C8204ED
          76ADBFEB0C79B353FBCD2F3A78938B0933862A00FC186E90853ADFBECEFF338F
          C119529ED3985C5793D59175E215B7A23705F0EC584612DC9C8E054EC2320FA3
          4F742CEC72C1760262B45E8B671AD0973DFF05C86875AD53D240040000000049
          454E44AE426082}
        Name = 'PngImage5'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446920313620417567
          20323030352031333A35373A3530202B30313030D18698470000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009DE4944415478DAB5570754546716FEDE5498A1A3220C5DC42E368C5189
          CA51232E68A22B462CD1B8EABA313146CD66351B4B34C7A0665D4F6289C61E31
          D124427454504044212244292E45508A0383940199DEF6FE3323C9AE6113F71C
          DF3977DE7BF397FBFDF77EB73C0ECF70DDBA75EB03A552F9B7A6A626B4B4B4A0
          ADAD0DADADAD36696F6FCF3B7BF6EC1C9AD64C62F8BD7B72CF02202525E51FBD
          7AF57A472291A0A1A1018D8D8D78F4E811140A05B2B3B3CB525353B7D2B43492
          86E702E0C08103BB468E1CB9D2D3D313F5F5F536E54F005CBA74A93C2B2BEB38
          4D6352FD5C00ECD8B1633B9FCF5F633018A052A9D0D1D101B55A8DC78F1FA3B6
          B6B6243737F76B078007CF05407070704F1F1F9F690B162CD83F79F264141717
          E3CC993390CBE549C4870E8BC5924FD37E20511C3A746830F162755A5ADAC6F3
          E7CF2B60E785F5FF06909494E44D047C55A7D34D158BC5AF3A3939819E6D64AC
          AEAEBE416EC8292B2B3B4F96C84F4C4C7437994CD961616181D7AF5F2F277EBC
          959F9F7F83B651FF3788DF0470F4E8515F32F90766B379616060A0842C003737
          37080402188D469BF9190FEAEAEA505353A3A18838E5E5E5356CEAD4A943A452
          298898282A2A6A2C29295973F3E64D669D7612CBEF0270F2E4C904F2F5671111
          119E43870E058FC7A1B2F21ECACBCA6D1C60CB5DA5CEE8DEC3075E5EDED068B5
          282C2A42696929264D9A64B34E737333E307AAAAAAEAC85DF368117353C76F02
          20936FA0536F888B8BE3D889E5F2F378F0F0117C43FA21B8F74038BB49A13701
          2D2A03EA6B2BD1AE284737B1163259009A5B5A919E9E0E57575790BB40E6D75F
          BD7AF52B02F3236D9D825F8429D785F2D53C1E6FFBAC59B33876821349A73131
          2E1EFE7EDE10F10033ADBA5B90678B80F0C8F1282F2D87A57B3854AD3AB497A6
          C1DF8D0F0BC703119085A82523232389F8D3485B5F20C92579DC258013274E44
          E9F5FAF4B9090982A6A647382B4FC782C5AF43C2070AEF144216180A89AB0B52
          7F48414B7313A267BD81FC9B79F00A8B849ED6AB686BA3A2003D4CB564212B28
          024CDF7EFBED11E246060D335176C9819D3B770A28CBFD442136D0A747777C71
          F414DE58B604ED4A057C657E200C36B3EB483AE8476DA467B3006A3359852C23
          3F76106D5A0346C5FF05FCBA02B86B6B5057DF808B172F962427277F40CB3319
          C62EA380183F8FFC763C3636165F1E3E8249339740E609D4DEAF467048906DB2
          81946909809A8EAB21001A7AB60880ECB4CB38777C3766AEDD0BF79E32A8683C
          40990EB356852BE919B87CF9722291F300EC49CAF4AB000E1E3C983966CC9871
          02010F59857598111B0D223E7856FB4416C026329ECE6857AE632727B3E45ECB
          C1A7EFCDC7A28DC71014311AF772E4700F1C08B18B1B7C1AAEA0AABA96D5911B
          C405562BAE93B43D0560DFBE7D9E443CE58C193384E7C8BF11318B206CBD0727
          570FB87B76B3CDB1907223898914937E9BD96FE516E0C365D3F0CA920F31FCE5
          D7C097B8E1B1C60267271E2A880F633557D04885EB9BD3A70DC4877594A0BEA1
          A5754F125227002A3413C9FC69D113C623E9FB0B8899BD10EE22BB320B4D355B
          ECC25609C4C0FDAA7A54514ED8FEDE22F48B1C87C56BB7C1DFB73B8C645C3DAD
          51D33D8F78DFCF5A090F4D1514F54A96A8CEAC5FBF3E91B6288423357702D8B3
          67CF125F5FDF2F460C1F86AFE4397865D66C084C5AF084CE30B2139BED68E915
          9F7DBC1157E5676CF8C51217FC75E771A45D6F85FC5A15B9C604B1508821BDBD
          30777E247ABA09B16B7706F22B54D01A8C268EE36B9BABCBF7A362CB278C909D
          00280256868484EC1A3278104E5DBE8398D838A81BABE01DD0171D44282BE301
          CF7EFFE32819AA6B1F52B2B98255ABD7E0C8B99B98F7EE0F38B879026A9A7410
          8A84F8F4C86DAC79731CA49C1E9B77DFC0D6B723A168D6C1C95984555B52DB1E
          9C4D58446AB33A016CDBB66D3955BB3D432306E3FBECBB947866C2835CD048E5
          434F0EE739668A9C8065532290F0DA6CD4D6D4A2B0FC3E767C998C192BCE62C5
          A248D491129E48808BE995D8FCEE0474131AB0725B265E8BEB8F865603844E62
          1C4DBAA9555D4C60AE38D60960D3A64D71E48294D12F8E427A6E1142A213A0A9
          2E8253CFFE100AF9B64800598047A2A8AEC4B1ED6B098C14A3E2162366E24B88
          5D7E06313183A1A0F8330B8428B953836DABA210E6ACC182AD39183DBA17946D
          440CB108B9E9455AF585D97B19F73B012C5DBA54161A1AFA808A88A0A4E80E30
          7C111A6EA72370D058022002C7FD1C8A1CDF4E4E75871A9C58823E5E1C62967F
          87F091E104C0001D4F80F69A06EC583B0E63C43578794B1902FB05A0BEDD0C23
          5F84E69272ADE5C2CC7DB4D5DE5FE601C1860D1BB22323235F903A8B7147E50E
          CFF0485BF6E31C9A39AB83B62C2A1C91C1F242B83710FB760AB8D020B46B2DB6
          5342A944F2A63190D61760DAE72AF0289376E8688CFA08545668716EFABEFFB0
          00D3F3165D64857F1208563EF1B8DF7C686A8BA06BAE832C3286343A92B80300
          CB090692013EC0B4D572E80383ED3B31250F1FA2F0EFBDF0E05E39A61F36C22A
          93D94F42D51115A55A7CF787A700A06FDFBE3DA64C999213151515EAE6224555
          AB15AAD02910D9DD0F8B5E6763214B485467EC599164841F10FFFE25E87BF5B6
          6FE44CB15A53830B09266AD95548F84E0A0405D943888DFDAB588BAF273F0D80
          B961CE9C39B38382828E11089ED56480C2EA8D6AEF28088D7AA86F1D87C74B7F
          8251A3A5E46486887280B356891729E627BC9F057D583FFB2EEC940420797A1B
          8A8B8AADEB4B86713600CC02D4D25359D5E2ABF1BF0A805DEED4747E44EDD70A
          6AC139988DD009DC50E2321A2D3C095CA9F038ABEE43C4913F7CC2A06BA8C480
          201F2424FE0443FF81F67CCD4E492EDC1E96636D6A6ACEFB4439712442427FB6
          4E61811687C6760980F1CE373E3E7EABBFBFFFFC1123867342EAFF9CA94069DC
          4350270A45ADD1034D46CE560F3C84647EB2FCD48D3F42377090DDCCEC941515
          58E79E5CF0F1E68D45587AE3758487DBC1B1B1FC3C2D0EBCD0250076D1B60888
          8E8EFEB34C267B93B82109090986C5648288CF83AB8B04229108024A0A3AFA46
          F0EADE13518705D00D1D6E072026C69455517A1D980481B4985B9EB5D5DABB8F
          3D8ED9581E5960EFF0A7C2F0D740F851728A1E3060407CB76EDD26121881B7B7
          7767574CDF01B6D69CDA6F2CCC0C006FCC103453CF6B2537A1B4CE8AC43EFB21
          91C95DDFB992CC1B10C0B55356B5B25D73F2DBF1F98883FFCB029DA424A19604
          61A474A49F9FDF60BA87D2E903A874BB53D30A6ADF54E1E1E1AAFA1E311EF9BC
          41FE1D1ABDD1C2272FDE4DBD868C75C5B4F6043737738DC0D3E515B3C9CC5904
          3C0B3277A7A2F8F85D1A3BFA7B3E4CD81C0A6C78336E900439EE5E8EFFD9C5DA
          41460931A399638D968429C974CC194FD2DFB1867DA0DC26B9F62C9F666C2E4B
          0952C726620761D9C5F293D9F1FEE43FF6CEFAFF56C73BB3A48B639C8DB1AEA8
          EDDFDE7A6846D043C3230000000049454E44AE426082}
        Name = 'PngImage3'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446920313620417567
          20323030352031333A35373A3530202B30313030D18698470000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          0000096C4944415478DAB55709505457163DFFF7EF856693451190A591284403
          6E384643621817A0C0880AA8131D4DA26616275395A56AA215B5A63265A1C664
          2AE3986898B862A2968A111714D44120B2388828A0A2C8DAD040D3D0DDF43EF7
          F56F8913A5D4A9CAAFBAFC06DE7BF7DC73CFBDF73587E778CACBCBD7ABD5EABF
          68341A747777A3B7B7173D3D3D4ED3E97465C78F1F5F42CBBAC8CCCF7A26F73C
          00727373B78F1E3DFACF4AA512EDEDEDE8E8E8406767275A5B5B5154545477EE
          DCB94F69593E59FB2F0260D7AE5D9F4F9D3AF53D1F1F1FB4B5B5399D3F0470F6
          ECD9FACB972FEFA365CC1A7F11005BB76EDD2291483E309BCDD06AB5E8EFEF87
          5EAF475F5F1F9A9A9A6A4A4B4BBF7301B8FF8B00080F0F1F191010306FF9F2E5
          5FCD993307376EDCC091234790979797437AE8B7DBED15B4EC24596B7676760C
          E9E2FDFCFCFC8DA74E9D6A85A80BC7FF0D202727C78F0498363030902C97CBD3
          140A05E8B3538C8D8D8DC5948692BABABA53C44445565696B7D56A2D8A8C8C0C
          BD72E54A3DE9636D454545311DA3FF3988A702D8B3674F2051BEDE66B3AD080D
          0D551203F0F2F2822008B0582C4EFA990E9A9B9BF1E0C1030355C4215F5FDF49
          C9C9C913DCDDDD41C244757575474D4DCD0757AF5E65ECE8C8ECCF04E0E0C183
          4B29D75FC6C6C6FA4C9C38113CCFE1EEDD3BA8AFAB776A806DF77477C3F01101
          F0F5F583C168C4F5EA6AD4D6D662F6ECD94E76BABABA983ED0D0D0D04CE97A93
          36B134F53F150051BE81A2DE909A9ACAB188F3F24EE17E4B270255D1087F613C
          DCBCDC61B202DD5A33DA9AEE42D75A0F7FB911C1C121E8EAEE414141013C3D3D
          41E902D16FBA74E9D20102F3231D9D8B47CA941BC2F9FB3CCF6F494F4FE75804
          FB730E63566A064605F941C60336DA75B3B2CC590163E266A2BEB61EF6E163A0
          ED1980AE361FA3BC24B0733C4880AC44ED85858539A49F0E3AFA34592959DF90
          00F6EFDF1F6F32990A7EB374A9A0D174E2785E0196BFFD5B2825C0F5AAEB080E
          8D80D2D303E74EE6A2BB4B8384F4B75071B50CBE917130D17E2D1D6D69ADC408
          6B1331E4005580F5E8D1A3DF92360AE9DFCCD4436A60DBB66D0275B96B5462E3
          03460CC7D77B0EE1AD35ABA053B72230380884C149FB00593FFDD05BE8B34D80
          DE46AC1033797B77A3D768C6B48CDF43D25C096FE30334B7B5E3CC993335274E
          9C584FDB2F328C43560129FE4DCADBBE9494147CF3AF6F317BE12A04FB004DF7
          1A11AE0A732E3693332301D053B8060260A0CF760128CA3F8F1FF6FD1D0B3FFC
          27BC4706434BFF0F5117C066D4E2424121CE9F3F9F45E2DC05B149599F0860F7
          EEDD1767CC98F19A20F0B87CBD190B521240C207EF1017B202B612790316D1F9
          008B9C6829FD77093EFB6819566EDC8BB0D8E9B8539207EFD0F1907B7821A0FD
          021A1A9BD81C29262DB0597185ACF731003B77EEF421E1A9172C5820FD81F21B
          9BB412D29E3B50780E83B78FBF738D9D9C5BC8ACE498FC3B692F2FADC4276BE6
          61FEAA4F3079EE6248945EE833D8E1A6E0719BF4F08AE1023A68707D7FF8B099
          F4F03135A8EF696BF3C38634088006CD2CA23F3FE1F599C839761A49992BE02D
          139DD969A9CD2E1ADB25C8817B0D6D68A09E70323B0B49699988894F811B8135
          5BC53409C40C552802A081557317B575B759A33ABC6EDDBA2D74C475B85AF320
          801D3B76AC0A0C0CFC7ACAE44938905782F9E99910AC46F052375858C436112D
          FD8A2FFFB61197F28E60CCD828C40B52F85FAB8454EE06BBD5EC44C9391CB0DB
          2CCE377B789B9502B182B33B4CA6DEAEAE1ABD757B16F00DEB8A8300A802DE53
          A9549F4F88790987CE5721292515FA8E06F88544A19F04C5CEA2D276BE174D0B
          4663530BA8F7A374CE6CA4E71E85F14E1D1C1A35785D27F8DE6EF0FA1E08863E
          F00306482810582DA0ED942219BE3B5CDEBA58EF78877E2D1904B079F3E6DFD1
          B4DB31313606C78A6E52E359886194820E1A1F264A38EF5A2953006B1263B174
          712654AA08D8366D42D2E64D30DEBE054EDB0189AE0B425F370406C0A88360D2
          43301B297A8B9876850C27CA7A35F37B6CDBE90F0706016CDAB4299552903BFD
          E5692828AD862A61290C8DD5508C7C1152A9C459092C049EACB5F12EF66EF910
          0BD3DE80DF675B3077FD5A98EED4424200A4C480B44F030501E00D5A382C0670
          9C4DDCC8CE9072385D65D1246B1C2C05BB0701AC5EBD3A382222E23E0D11A1A6
          BA0A98BC12EDFF2940E84BAF1000191DF253297212519C214A335A5226E2D77F
          5A096BC32D48B56AC8741D50F475529DF6D06203A9919A84C0FF44A11438576C
          D0CC55DBFF170013F7860D1B8AE2E2E27EE5EE264795D61B3E63E29CDD8F7379
          E61C2ED9B2AA207BC117D0244763E6AA4CD8EED542AE6D875CA70667A07BA9A5
          D74937A4E49C18141B0AF3C2E15261AF666693359B15DFA300B8B5F4100B5F10
          08363ED117BD0C86A66A0C743523382E89BCBA9AB80B40D4700AF48D68BCBA6C
          1EDD026BA120007C3FCD1CA386C442472B287A8544042171A580A659F169B566
          4683ED3100888A8A1A91989858121F1F1FE1E5E18E861E07B411899089E987DD
          34E054216B483467101B40672F8AC28CCC64F00F28053A9AB2864E317AA55434
          068035059606F6C879941D6BD14CADB33C0E8011B464C992CCB0B0B0BD048277
          505DB73AFCD0E8170FA9C5047DF93E0C7BF51D580C466A4E364C577940993E16
          2FA7CF250075143D0D3A6387987B0F9908402E884C3016389181AA03F734136E
          3E19007BBCE9D2F957BA7EFD91AEE01CA8A10C085EA8F1988E6E5E094F3ACB4D
          7B8F18B661D2F848782C1C8BB845732169AAA30945D10FB0B14F003CA95DBA33
          16E4220B3289580904E05676ADE6C52AF3900098EE023332323E1D356AD4B229
          5326735252B21B5168F056A159168126CB30682C1C5E0F0162DE8EC2A4058940
          CB6D121F0340F9B7EB5C0064E2DB83A1960D0AF1F6573734632A8606E02A1684
          242424BC1B1C1CFC07D28652A50AA7566BA54078787A282193C9101AA6827975
          1AA216A5816BA9170198BA4920644A414C83C743105297082568FC479526BCCC
          F458193E09441035A78471E3C665F8FBFBCF2230829F9FDFE0AD383A3A1A233E
          5E81A8D5EFD2A5A156543F63C04C00242C0D2EE7CC943251C9648D5F54B6845F
          B5EC7F1A00A728C9E84A8248723A3528282886DE11147D088D6E6F9A1DC27C89
          5932AEBE58415AB33BAC168BA9BFD72061F54A770E96728E1813887A8E8C65C0
          6A77983FBA69BA7848879BB4E8E0B37C31616B6802C08F69832CCCF5F675FD5D
          82C1D89C8F1D8FDC787EF6385CC6BE1B5C23FBF179BE9A398B88CCDDE558EE72
          CE3D620F01389E72169B4CEC56D4F75F66B03D294BBDDEE30000000049454E44
          AE426082}
        Name = 'PngImage7'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446920313620417567
          20323030352031333A35373A3530202B30313030D18698470000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009624944415478DAA557795454F715FEDECCC00C33C38C0333C2881A408D
          A208AE09DA5A8DA6AD698C36474D9A63CC1FC9497BB2B4494F6AD29EFED125A9
          B1396A34551015A3185023B88028D6045194C50575C415649901068661605698
          ED4DEF5B689253B52EEF9C7BE6F1DE7DBFEFBBF77EF7FE7E3078BC8BC9C9A97B
          D6E773AE00223F62D9F013F42B0D87034EBFDFDBE0F1F49D3099EAF61C3FFE95
          857C036491FF59E05191F3F26E4E0E873D5B7C5EF72C958A6146185550A96588
          4482703A0760B3B9780BB34197C3D1B969FBF62FFEE5F576F5D2A7C1C726909F
          7FE3C5FEFE9EDD2A955435E727A908A8E3E10D4A00A9945F30120E82F57B1072
          B4E3E6955B305BFAE076DB2A8A8BBF7CCF62B9D3442E838F4CA0A0E0D602BBBD
          FB686AB2267AC6FC0CB4F63318AB03D47280A5048758C01F067C1467BF9F909C
          BD68BF5283CB57DAD0DBDB7D72DBB64FDF0B85428D43241E8A4061A129DE6EEF
          6F4818AE4C9CF58BE9F0109066C08A24A31181B0081EA21CD3AF972A1EA07B3F
          47CA3F809B554760BA62C18D9BF59B4B4A0A36D0726D5C391E8A406EEEF9CFFC
          839E554B5F9986CEB00696EA4378FFF7BF4379F9BF919636015E2E62223248C0
          F48310817B070542ACDB8ACAC307D06975B876EDFAE2B70E87FD18B9D81F98C0
          FAF5A50A8944D591363E3E4E953609194629143260F1A2E7D16EB1A0B4FC040C
          89091820122CC9A1A1E136F2B76EC0AAD5D908503918296039771C9527EB505B
          5BB9ADBAFA64362D7BFD410948766CD9F382C36338B4F0B9143835A99892400F
          09C8D6E3C0AB2FBD8860C08FA2A3151816A74475B509EFBFF1320CC611F838A7
          08CA581D9F0D99AB05870BF7E2766363CDBE7D5FAEA775BFBD1B01C6BA1B4647
          003321C5F428609A4C86A94DFE25C6CBBDEF320B976540163B1C49B182E82414
          59F31D337EFDDA52A8D55A4C99F134CA4B8B312E6D325E7DFB8F481C3D0E0A95
          86579B22EC41697E367585D59E9BBB610D61ED631A0A9110F6E1690A667A940C
          D319065323316A638C3E9589318C81CA900265C218D4D41951734689398BA742
          173F1C3A85203ACEE4745F5E7A14D5DF9460E9D265F8CBDF3FC187FFD884C491
          A9902894089320A404A092B128D9B18E087487B3B3D7FD9308EC604C7994D1E4
          299A184332941CE0F03160246A7AC742185C2C6FB5B51A9C3E1583677E390531
          BA514850021EAA6D24C2B73FECB61E7CF8E672646466A0D713C2071F6F02CB48
          F8AE903042BFA9A57E1CDCCE11B00D6CDDBA710B3DDDC25CDC0AF3B437B78FA2
          65BE072A7468241282A7CF015F7F3F6EDC50A2AA3E030B16A6403A2213DA68B1
          046211A3E8EF0BB57568B8741E0B16BD8C617A030683428662694638A92D75C1
          4EECC9CB81D96C6E2C28C83F4C9F6D65CEE7A07AF22B7F9B25D78E041BF6C3DB
          DF078FA31F5E471F06DC1E810F13A1D652E0E8B9C5C84C57413F751E540A393F
          448608306294A05473AA0F51DA8343A92721B9B8674D15282A3A8CAB0DA6B2D3
          A72BEBC87B3753B319F9E92FFC66A5DC908E5B67AA046973A0110632450CD43A
          3D5464BA443D76EC54C2616791B52003518993385E3C3023E68D2B0797953067
          AC00AE257D747B8164D500F6E76D404BAB2572F060F1CE9E1EDB59FAE40853B9
          117F9A38EFB9D5FAC9CBD066BA8468B9124A5D3C011B208B56092189D6D119C1
          E64D4E4C98A0C6B8993F061B9B28540D02035E31620563286A39A78D01C0484D
          70F5C45E9CAA3A4B1B94F5425151F1397229223BC7947D8AE7339F9A702469FE
          5FB9D9F503C0215DB87BED70DB7BA82C56D2C1683475E8909E1E8794CC2C3024
          483FD55746EE3246102497116E1A72224DD54570EDD441549E3A0397CBE9DEBF
          FFEB831E8FE712B91C223333EBDE42C29267249631CBF747095BB6147E9F07AE
          1E3B3C761BAF89088515E172CDB2506AB43871290DCDCD3EA424C762DCC471D0
          A76482556A311810B210452434DC6A5D3751535541026E846FC0335856565664
          B55ADBC9A594EC32998F232BBB5388DA518BD64F67148968AA3945020AF21AA0
          3E8244168D587D2262E3C90C4990CAD47C8A8B0F985155D509959281411F8378
          BD16BAB8785E133E8F1716B31936BB037D5C17F9BC1DE5E5C72AECB48D72D38F
          EC3C9943501A65ECEA2E7C363A6BE51F94294BD0545B01B94A0B757C0234042C
          57E9BF93B7581297BD133E7B3B6E5CEF41DD35052C5D111A3601FE1DC384A90B
          22344B48884157CFF5EB0D55F5F5F54EDA825BC9A19AEC8A081E86B8322A3EC7
          CFD232528E27CEDF0EA10CCC0F741089B0707677A2BFBB9D07E7241E21C94BA8
          E0BA845190C78D85D52187DDEEE3A79ECC5385EB753BCFBEBBC66DA620B96DF7
          1A9949DC82DDF84EBA028189E9882DF9336EA42C2B4E92F0292650362C80DA3A
          480BDDBC0E38778640B58627A04D4C8686C634102D6626883EEB6DF2EDC2A849
          F3E0AE9DC7BEF5896D73C1311C1609F4E12EE7C2A1CD487A351F1B9367BDFE8E
          7AECEBB0B735A0ABA9E1BFD3454A3AD0E84743939882D8B8244E66627668C0F4
          D049A7BD114E5B1B1F174BFA199BF51262B531B057CE70BDFD193E28FA862761
          C77D0EA5CC81D5C89A3D537B36E1D96F195BCB45383A5AA04D20D0E1A3A1D21A
          BFA701194D481BBDBF83BECE26AAB370C694CA14D0254D40FCC8C950A869B243
          097FCB47E8BEBAB135E335BCE17482EB7DCFBD08F0B3A3B508C78D733F9F13AD
          9F23921DD2810CA1E08000DAD184C0808BDE0AD9D11852119F34913A653CB704
          E9A31D7E732E829D79ECC5ABEE73EBF7E35A49056AE9651959D7BD4AC0DF1FCF
          C6AF66668E29D0CD3E42CFBD7CC47D5DAD1469337C7D36DE89A5C6516913306C
          C478C4113051E09709D90F21D8918BEE96DACEDDC750BBB99824D4CB47DC4C76
          49EC7BE7FD32003ADC6AE998772275F6E699D18605B0B55C80ED8E891F6F5172
          3574C62729CD1369E73390B79C8EDEB7116CDF86C1F69DC19A4B81BAB58568AE
          ACA7F369185672E08EDFDCE9B75314A077A8F5EE49800B79EF1A2CFA79D6B003
          C3E6D64B0283BD7090C0B4C35310A3192D2A9E45C8F6350204DCD16232E795E0
          DCF612B87AFBF9F6E27AFD36598B283AEE99FF6EE2BB1701EE5237EC4676EA53
          2B56C63CB95E24AD00EB33F1A083ED05FE931751BDB6006DB5263AF046F8081B
          45B38A69F6891FDE13F87E04243FCDC2986D1FA174C4EC4DE3091981B69C486B
          634B73EE115CC83F0AAFD3CD83B488D17251F78AD1061E04F4FF11E02EF9AA15
          98FBCE72E49CB982A6B55FA1E372239FCAA168B9FA728AEE271BB85B6D1F9700
          5F0AB274B2E910FEA1E4D4CC8D526E8E7B1E25DA8725C0BDA3A327B41066B7E7
          71A3BDDBF51F549A464399682B160000000049454E44AE426082}
        Name = 'PngImage7'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002A744558744372656174696F6E2054696D650053612038204D727A20
          323030332031363A33373A3134202B303130300CD2793D0000000774494D4500
          0000000000000973942E000000097048597300000AF000000AF00142AC349800
          0008264944415478DAAD576B5054E7197ECE2EBBB82CD78D5C16A812954E842A
          501CAB62325EE234CE3899D4A933993A9AC98FD0D6E9AFA64E7FB43F32354349
          198CE0C43850158C4122DA44EB80998E04C70B525414083701B92CBBDCD965D9
          FB9E3D7DDFB3BBCC42B523A49FF3F27D7EE77CEFF3BCD7EFAC80A50DE105FBD2
          12F5FCB7C2C2C2C2B0C8C8C8D5369B2D8EF4E93C1E6F8C42A188A5758CE4F3D1
          8C68D12B460B82102B8AF2B36865982AE6FB8E8EF7ABAAAA1ED173FB7288CC13
          3877EE5C8CC7ED9E4C48D2879162A8D52A28552BA050F11C2EAF95E1E110541A
          28D4E1504544A1F3FE77F8E68BF2CF2E5DBAF47752D145E25C36015E9797973D
          3C70F0BD1CAD460D37D9E26111FDB3E805BC3EFFDA4B7B229D1C378CE05AD927
          8D25A5273FA5F33749A67F1081D2929253793BDFFC4D7A4606DC1E02616002F5
          4A7E995FF3CC27C280EB273E721414FEED2387C3514D3BC34B0DC382A42A2828
          389C999553B9F3ADB7E07205400380C139B8C7640435D0F48F8BF8EC7841696B
          5BFB1952D18100B765113872E4487AD6C68D5DEFE6FF5A61A368FA7C7E737C01
          9B44364FF2CF4CC045EB9ED647A8F9BCF8FAB55BF7CFB84CD30D80D9B208437A
          690234D425274EB4BFFDDE6FD3D56AB50CE622B4FE292F862D5E8C5A49E6DC98
          98F3C0E2F0C04E09E21304391682CF29397CCE9E57ADBDD57BA38723ED1E21DC
          E972753C78F0A096AAC4442F799E47663101E193C2BF56BEBE77FFA1B4F53FC6
          D41CF0658B074EB71BA95102592DC04AD929313341F287853292C3E223779989
          548BD186F7538CD895A6C4E0C8387A7A7A2CB3B3B3C5C78E1DFB9CF49B178768
          0181FAFAFAB8FEFEBE13AF24EA0FC7EA123065B662CA21C0A28E47B7A8475ADC
          0AA444A9619875C3E6F6514EB0485415FE9989D9884D539F1957DE516165A412
          76878BF54ABDBDBD554545457F26989180371612686E6ECE191B1BFB67626262
          52A456ABA44623F7821554FBE12A256C148B8F9B99BE1A9B52A3609CF52C20E1
          0990A0D4C0A8C505D13E87CABD12AC1E010A8512376EDC90EEDDBBF7697575F5
          497AC510F4844C801EE84647471F6FDBB62D252E2E4EE126978BA2088F87E26C
          B7CBEE5550F8C29512FE7857804F15811C7D248C94134ECF424F889CB19417F5
          9D6694BEE1C46B3A22A550913E2F08DC5E7DF1E2EF060606AE13EC24E7844CA0
          AEAEAE282929E90F999999547E2E8AAB5726C02EE5B5D56A9D27A124F9A0210C
          1B535742A70DC398D5030F833309D13FFBE8DC88D98D789F051FE779F1AF6FAF
          22352D034EB2F99BAFAF5CABA9A92920D856128740191AA1542A87F7EDDBA763
          10060E9D59981425924C288C926F82F2E2C85D2D0EFE341E13362FE65C215EE0
          30F09A1CF15DAB19153FEB41B6E30CF4312A34447C88AB572EDACF9E3DFB2135
          AEAB1C2DA1B2B2F2EDE4E4E4ABDBB76F978182A04161223C262626E490308908
          EA8067BA57A0CFAD4376AA1606B32700EE27C1611088E8CD762B8A72C7F086BD
          1CE9DAA77894F017D4DD7A84CA8A73279F3E7D2A372EE1F4E9D3C55BB66CF9FD
          DAB56B6580C5045878D02D89E9E9E940E61200FD7BB73E16073727527F10E1A0
          721443BCA0A03CB8DB358B3F65CF2033620239D27D74C6ED477B5B0BBE387FFE
          EB3B77EE9493AA3BC2A953A76EFC9C0625DF7CDC5F44626464445EF33B1A25F0
          D540045A6C09C848D65073F2CA964BEC3505754A72DCB57FCFA06ACF0412B5B4
          C71787CF0BF3CC342A2A2A1A6B6B6BF906BD2E949494741E3870E035EE7CC1B8
          07498492E1F5E4E4A4EC095E130694F4E7E0AD44ECCC7C85CA90AA43F261C6E1
          C5D084139D03767C9061C1E10C3B9CA2924222C8FAB9C228EC7D972F5FE6C6F4
          9570FCF871E3A14387F4C178B3F2E711E0C189C8B9C0CAF8994A21E1E1940685
          AD2BC94281724844BCDA896D096EFC729D0D091A117D43260C0C0E6266660659
          59596043A9278C5DB87081099C178A8B8BC7B76EDD1A9F9E9E2E03711E848622
          9404B337180CFE1B46E244835C155C9A5E6AD3E12A05C288D490D184BE01030C
          2346984CA3181F1F07653D366FDECCBA7D743FD43C79F2A48DD45C10F2F3F37F
          410978850084ECEC6C6CD8B041B69089700F58EC05CADE790FF0AC50B0286490
          A1A121223802EAA872B8A6A6A6E43354E6888D8DC5FAF5EBF98CA9ACACEC5BDA
          AE25B929AC5AB54A77F4E85103B947D3DEDE2E2B61576DDAB4092AFA1C6312C1
          EA6040261004E741970DA8B3C16834CAE1E14AE1E70CAAD56A919A9A0A2A7359
          1779C1D9D9D959D7D0D0F03DC79FA48BB5284B4B4BEB351ACDEBAB57AF16F860
          4747870CC48CA944111D1D3DDF23FAFAFA64421CCBDBB76F8314629062CCCFF8
          2C4B4A4A0AC830D96A3A2751E23E6B6A6A6A26BD36FA3FB760BA55D0C0ED9809
          08C43465C78E1DF9B9B9B9BFA2C36B88B5C06EEDEEEE96C9A4A5A5212F2F4FB6
          A4ABAB4BCE05B69894A2A5A54526C365BC66CD1A199CC9CCCDCD39FBFBFBEFD2
          2567A0771D8463E408B2D3023722C7C71BBC0DC3495248D1865DBB76EDA664D9
          AFD7EB5348E4F8D2558AB6B6369900790ACF9E3D93F7798E8F8FC7BA75EB6477
          13A864B158FA1B1B1B1FD0FB6C2DDFFFFD01D0C100287D65C01DFC3809FD1EA0
          4E8148127D4444C44F76EFDEFD267964FF4A1A0CC2311F1E1E86D96C96121212
          8460D97276D365E5A090DD23E061B2D619622DCB58E043C411F8AAFB9F5F4441
          22D124C914FBEC3D34E8967C47A7D34593F0F5CC31150894ADEDA5ABFCE1E3C7
          8FED64EDCC73ACB5855AFB32DF84A1FB4C2486249580732947F650AFD843F1F7
          5222B6506C8D2693C9158867A8B5961759BB1402A1CFE9E31BFCD3EC47249924
          AF06F6836E1E7E596B97436031110E4D54608F7F0BCE2DC5DA1F42E045EF2FFB
          57F17209FCDFC77F00C8AA2C07AC48B7A00000000049454E44AE426082}
        Name = 'PngImage8'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322031363A34333A3036202B30313030DB0550ED0000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          000008C64944415478DAD557795055E715FFDDB72FBCC7E64310173635A24204
          5A895A97A0A33509EA6896A91D1DB5515B97746C6CACCD184D1AAD2693898919
          C5269A880B75C325187764111159441EA2283C080F411EF81E6FDF6FCF7DEFDA
          F18F24D069A79D7EF3CEDCFBDDF77DE7FCCE727FE7BB0CFEC783F97F03F063EB
          D97EAC637F68639F003E020421ABB1DC6BC3EB7E1F643EA0472440A20050FA19
          B4E9BD389A938B03BD80E5CBDF21C56EC75BB46DBCCF07055D9F78FCA8B1BA70
          F8FDE328A3B983C4FF2F0138B41E7BC8D8F2D8416058F2C1E5028442C0476A1C
          76C06002FBA007799122344628B1314A037164242095D21A42DB4BC8DADBE1B7
          D9B077F57E7C402ABB48BCFD02707A3D26189D284D4D05C319B65A81070FC8B0
          23F8BF80908547006E375821DDC7C581118900B118E0AE9C306481035E5F0FF6
          7419FE74EC260ED2D64E125F9F000EADC66761515813113482EA2A60E1A2DF43
          33383E68BDE7314E15EC437BE72384870331317C744835A50232591004B7B7A5
          0D38528C3D855A1C26D5A409F63E011C5E83AB5183314D2E27053A6044F22C64
          4C7F83B69A291714069F2BE0C8EE9C2D01AF1313282506C0689420317E34CC16
          23A5CC01915486D4012A6C38D6F1657E79CF29DA544262EE0F801B9131C8E4BC
          696DA54258F517C83583C92532EEB0011E6B0040F5F5029469AB9110C7AD63F0
          DBB5DBC8FD10CA853258732E27FD51851D872E1D7D27B7ED083D2C24E9ED1340
          EE2A9C85182F5BAC0C349A182C58F21E19750763EC750481783DB0B5D521E7FC
          B7D0501AC6264DC6F3136691660A895C4D05406B9DE441473DBE387E257FF5BE
          EF8F93EA8B24DD7D02D8BD029BAC766C59F1D21CA8927F41C629E42CE59EA1AA
          F27848C8333F01EA694585F6222ADBCC9897B50031F1C9540C122A0039BF96D6
          E8B5F830EFDAB177F31E9D23D50524863E01BC9181B8D77E3E70D3BCAC179620
          3A3948255C95F9FD41CF38C57E02626842E5C332DCD099307F5A3606C58DE216
          D24FCC9BA08D2D1598BFB37CFFC972E3657A7081A4A74F0034C45FAD4CFCE5D2
          CCD8D3189A1ECC2723086EE30C73C281EA68C0D9FBD7D169F2223D291D696914
          2D3F1B5C2BE0007BE1A82FB446BDAD3D6C75FAF269C775124B7F0030E9A3A12E
          599556271F963A046229FF9880F8D88062AE10ADBA5AF3C1BB8DAA5005183B95
          C5B2398BF8F073E9A235861ABCF3F7D6E33B4E53A810780D1B483CFD01C00D61
          ED9BF19B535E8C7917EA24F298DFC2728CEA056B6E62677FD49657C266A7AE4B
          2D484E14E9313C14983022210852C4626DC94C7C5E966980E3F43E749EFA8A36
          EAC0B3E14F02A0440DD7033B29D33327CD8F158CC98E0624F46AF9689B8F0AD0
          6B47E9DE16F6E44DD6FDF594DD52F1D419E83A5F840D1B7F86E9E30740EEA128
          13874F8CFB1B52568C87F64CB5CFFFB87C135A72F6F145E8FB5100278117892F
          4F64CE1914963C450387C58B03EFD563DCF6DF40333C122E4924EE143D8174EF
          5F316CAC0A4DA5167CBEFC381A9CE118227462F3D659F0385C88D2C89135E653
          8C7F6B06CC8FCD68F8AEAA0777B7BC096FF735326362B006A9958B2BDB333232
          8CE0F9F92C915E3B503167D7B2D053A13A4CB479315AEC47E79D4738B8B31992
          99AF423C32119E93F918A56A43F4A830F4B6F4A2BEDA864F7634E3E19E33F8E4
          E822281422A8D532FC6AD22EA4AF9A01B7C5497CD40C73D5FE5DE83C9F43A6EE
          136DE1DAD6895B0F365C68B8929B9BABE772F30D7069E48C8159CF2D9C8B2DFE
          0A1C7136206FF02B9842DDA8F7A10EB5A7DA6031D8A18C5292F170D8A8FADD4E
          1F1E1777E1D0CCCDB8AC990256D78A3F6CCB865ED783BDDB2E23EDF517E0343B
          D0DB61427BF1998B68D9FD05D92A62B004C54A8572E8F2A1CBF7EA2BF527A61E
          3B36402515964C5D11CFC8474FC3FBBE0A88E70EC585CA6AACEC4DC26247383C
          FA46B8ECF46A9989054D1E38AC1E78686ED35B50668AC7A10DE761BAA5453779
          0B890849D3C740A692C14929F1D8DD68BD5ADA80C6CDBB08403E835FE360F4AC
          B08566ADD339D837F45A8641183679C2E44C71186053C89177EF3BA4CC1B8694
          F8213877EB36C26F58F181702CD8865A387A5DC4C6048452E4B6FAA92649798D
          191B373721D2DB0D915814E8C56E97876AD64DACED0BB4665D51B501DAB73FE3
          D89EC102AC8F981EB2233A291422A78094B0101279C86562A843E4880C57213E
          3A0A21D412A3542A347775E1E28952E478A6425EA585A3C744D1F00522E2F3B0
          30559BF0C7B525A483216103A7188E93FCD43FBC04C4A033C0DE565F837B5BBF
          25005F33988D7192344965DCA44881522845884C0E1519534AB97B1914120989
          343057D3F348991A76BF131F1F3989ED1DE31157A9875DFF884E473ED84D2ECA
          BD03EB5EF906F6B08110B25EF29AA2439171F63AE132F61A612C2E447BBE11AC
          B792009CE15E432996A220E1654D16E7B15C2C0B187E0A2070CF5DF979A84289
          28A8B0AFB610E95745C8D64A60BA77976AC18D47772D20EEEB5E99B0A6CE2B0C
          61C050D3F050E5B93A2CB0DCB7C1DA48CCE5E3BAE05D040F252D4C808C6662AA
          24455430FAA5217285400A39E731791EC21B56F240D40A056265E1385A5786A4
          422F5EAB0A4567F92D58BA3DB03EF178E8D4758D18A69DE8E70982C72E7790B7
          E1E4B9BF8B7FCE9110771E703F252225A562A93455B23D256B883C7A4018E422
          31145279300D620945468C98B03014DFBF07D7814ED7ECAB11C6A68A8AC7C417
          1D744C34D4D2B1C3163CE53492D4722D8AA75B96E7172F0FC4C5CFD967A998BB
          46622C668BD3C48BE5CF89266A62D4D210B51C1E2A9E8CE478A4240CC3EDE656
          941EF8BE58754EA5ABABAB73F05E7062E43D6BE30D1B7963CF8E3EBF0BA86F82
          CE34180919C609070AE315A10A857FA47FD09C3FA7654BA4025CC96D2ED75CD0
          D4DFAEB9DDE4F7FBAB788376DE2BCEA0830FFB0F1AEB0BC0D339F551100B2022
          705D86EC09AF8E58DF72DD5A197B29F64E4D654D93D7EBE50E95F5BCF74F3F34
          FA6DF4A7003CFB9C8B88181F629DD2A79C9B7923F366D1A5A24EDEB8966B244F
          7BC7BF33FA731EA0EE8EE749E86320D0C739CFFFD9B8FE1B00884FE9C5E7F882
          D819C19CFF478C73E31F7D1ECDDE65543BE60000000049454E44AE426082}
        Name = 'PngImage9'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004D69203134204D6169
          20323030332032333A34393A3035202B30313030402817570000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          000009BE4944415478DA9D57795094E71D7EBEBDD803586E10050F50A880078B
          22081E68D4D4644CD334D6A413D358DBD849A733763A6DFEE8D46955348D92D1
          94A0C4A8351A2F50A15EE0C12142384482801C82DCECB2B0B0B0077BF6F77E2E
          5633606CDF9967DE7DBFDDEFFD3DEFEF7D7EC7729864141414CCE8EEEE8EB7D9
          6CB31D0E47B850289CE5E6E616466BABC160D010D456AB556DB158340436AB4D
          26531FCDBD1A8D469D9595354ADBD89FD9D239911D6E3202A5A5A5C53366CC48
          723A9D1008043CF85D9CCEA73311001984D96C061987D1680411636B3B7DA767
          441F3F7EDC9E9191F1815AADEEA7D72C2F4DE0EEDDBB453425A7A6A622242404
          4AA5123E3E3EF0F7F7879F9F1F0FB6F6F2F202790662B1989FD9E8EBED454767
          27C883A8ADADB5ECDAB56B2B79EE067DD5FB7D4F4C4AA0A4A4A45022912C3B7D
          FA343C3C3CF8938E8D8DF1A765606BBA1AD0D540A15060CA9429484949815EAF
          079D9A7FCED0D5D535B463C78E74DAF218A1E5650970C5C5C5F9DEDEDEABD2D3
          D321954A7983748AE7C0AE80CDCCF5D1D1D1D8B06103743A1D4803FC268C4073
          73731779E01B5A66FE4F046EDEBC793D3434F495DDBB773F3DADDD6EE7676674
          7CCD4830026BD7AE45727232B45A2DEF058EE378DDDCBF7FFF615A5A5A16ED79
          94D0FA52046A6A6A36A9D57D9F2D51A902EA9B5B9E9EAABFBF9F37D0D7D7C75C
          8B8181019E0413DEB66DDB10131585C1A1219E3013A948240279B2EAD0A14339
          B4EDBF08ED2F2440C2139298D23DE4D2AD5EFE53B80EBD1351BE4ED81DF4169D
          D86C25632633AF05ABCD4AB38527C608CD9D3B173D3D3D7C3430E30CEC0AAE5D
          BB567CE2C4892BB4FD2942E70B09545454A4FBF9787F28F49ECAED2FB7416BB2
          21A4AF16EBD72E4461871DC95E43889B21C7A0C901B9988399C8E80D268C8E8C
          6094BC303C3C8C11FA3C3E18899C9C9CBC73E7CE5DA7E55942F7A4041A1A1ADE
          24779E8F8A8AE24E7E67C2F516C2DD4E4CB37460C5EBABA1335A907B340799A9
          6FE35AAB15EA5E2D0EAC1142269392871C7C243C7CF89089EEC9A6A401A60F32
          9E4B8311B8306918EEDDBB57909090F0203131F147CC6DC374C2CD997598E7A1
          C3FA9438FCF5D608AE9774E2AD500D421356C26019C399DC87484D36E0BD3716
          83138840A2C5F0900E32891006BB189E628A0ED318BE3A76ECFC8D5B85796426
          97A01E77CE7304CACBCB536432D90D0AA5094579E24E37A64A4791121781774E
          6A70E99E16C1BA6A34676C8053AC6059135D9478DE786D0D361F6E469B498659
          521D22C45DB85CD15AAAF588567B4E8F9449A4A27EBB497FE5DE9F558C8C8960
          E70D161515ED89898AFC93DAE9877F9619E02415FF7DA5109C5C09A5E4793266
          125E435B2F16464EE7D7838383C8CBCBA3CCE80B5FFF20C4FE4D8B99A10EF885
          4442603122C85B86B9D3BD10E22B27E13A50D2D8E7AC2C29DCD7FAE52FD2E875
          0D4F80DCF7EF941549EB534BACE8D25B70B36600F10156DA24142D7D46FC61A1
          19116121A4031B22FD45CF11A2A2C5939093160647C478F78B11C8FD8D307A45
          432117C1CF438220A518415E524C2532B3A67822F364BEB6317DDD87EC759EC0
          EDDBB72B572C4B54FDE5B6114D3A3BCE7E5D85DF6F590C8804A86AD54138D089
          C4A571E83798F1A8A507B7B687D35B123EDE49E5A094CDDFA597A714EFECEE41
          576F3B44F240D864F43C38104EB91FA4721902946E080D70475341A95E93FDB3
          7D2C37B0F7B8C2C2C2FB8B54B1F38628ECF69CAA455BDD032C7D77236AA87E65
          65D7605D9C37C2E686C340AA3EFC4D1D7A538310141ACE2BBEBEBE9E8F7796F5
          4647F490498974E57708F053A0A64D89C3393A9B6C8627B9C20F56A912228B15
          E6F26B0568CBB8C3B2234FE0C68D1B95B1B10B6339A7036E622A222221C66C4E
          1CBDF6088505F7B0E997EB90D5AE40DB632DBECDCA81F3EE4714E31256B0F8D8
          6795303F3F9FAF8C919191A8AEAEA610B4206C6630FEF8F1DE937A5BB23BE71D
          95207097FADB8DFA06747D5E06BBFE5BB29DC30808722F5D285B1013B568CC6C
          42D0D469B0D89C7C6C4B441C246211CB28C8AF1FC289B3D5D8FAE3402C4B5C40
          24DD5896E34FCFAE806A3EB66FDF8EA6A6263E4DB3B4AD50C8B17F7FDA11AA9E
          E5CC0E200E06F9C195908A59FAE172732F9D1F1506BC596608E6CE64E741E531
          809F2EF1C39A9424787AFBD3499E141D9180A3930AE1A07D989A59B1292B2BE3
          09300F5CBC781194C4F8E4333A3A8A4E0A4B22E63C78F0603ABD7FCA55079871
          A662030B20168ADCF163472A8C0B3E88331AC650DBD8872B05CDD0D47701BA5A
          AC5589B1E9D508AC4E590E774F2F58ACAC0CDB79E3AC223E78F08027C0D6AC48
          353636F20588D50AE681A0A0200BF50287C8D061C2434CD0A27147320EE60DCF
          FFE815BBDD4619CD091F85903A192DF2F36A519457098C6AA01077625D7C207E
          B22616CB572C874CEE8E11CAFDCD542999F171B0AAC94A31EB8CDCDDDD596DD1
          EEDCB9F304D961249A30415FC87D7160DF99D105BF7DDBEAA4DCCDEABB83EE9F
          7EA6A4180EF414A0BDAE11B9B9C5A82D2D83736C00C1B302F0DEEB2AFC7AE36B
          686A79F4B4E870AEDCCF4A33D30423909D9DFD98AEE00CFDE44BC2A309091C4C
          FB24C314B3E5372691E2499743E2B352FD65446CC484FC82C8201994220B746D
          CD689445A2BFF8240E6C5D8996C79DBCE1F1F2CB3E33BD304DB0ABC8CCCCAC3D
          7EFCF8453C69C7DA262490F6E9DEDDA6E8CD1F1B253E64708C4850B7EBB0D367
          EA7C1C4E9E100B491389715598147B6E0F60D1503EF6FD6A05DABBD5FFBD5017
          01960F9817283D8F90302FB4B5B5D5B84A71D7447586FBF41F9FFCDC4D19F0D5
          B0EF7C99CE23823FBDDD6E7986C838090716048AF179F11096986E236D4B127A
          3483CF9D9EB9BEB5B515972F5F6EA20C5946BD410FD9B8C5EA1D6178420204F7
          39B367272F591CB7317AFEC2570D01AA008DF77C9821869D928995C4C9BC3146
          DE085508F075C510965AEF20EDFD25D0E89EF47E6C30975355745EBD7AF516D5
          966EBACE467ACCB25D3D41F7BD08788E00FBC7A124CC94CBE5314989098B97C4
          AB56DB83E366777BC7717AA1171C36D682D9A0A028B954AD4792BD049FBD1F8B
          1193950F43D6A6936133351E17EBEAEAF4B45735A1D4253C0326F957F4B41F70
          CDACF07A1202E91EE7C4A962172F4F8C5F269A363FBE4DA912686521308D9A51
          DD3282DF0595E2AD65511049A4E8E8E8A028C9ED20C5175155EC7719AE72653B
          CB8B8C3F4BE0D935CB54EE047FC2ACD9E161AAA48445897E33E7AD6A1046B82D
          428333223C840B9B3397B5DCECBEEF105A29041FB95C5E471820D8F012837BC1
          778C889CE04398EEEBEBB32062CE9C98FA86066B5454B40F754FC9959595C555
          55554C5CB5841297CB5957EA7819E33F44607C308DB01CEE4D9842F0753D0F74
          79A9C375E7CCE5E61F72F9FF43E0D9DF4A5C60466404F66FD448D0BFACCBBF3F
          FE0324A124E77D696D0A0000000049454E44AE426082}
        Name = 'PngImage10'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446920323620417567
          20323030332031323A34343A3432202B30313030DC5AB0AA0000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          0000097F4944415478DAB557095054F71DFEDEBE7DEC2E7B02BB08CB2E8720A2
          267837E630E9A1A1B59D4C67B4B636899DB493186B6927137B59A7CD4CE331B6
          93128C75D25823D88847A21889358A068380A248242A08C8A5B2B01CCB9E6F8F
          B7EFF5F7D6752651893199BE996FF6CDEE7BBFDFF7FF9DDF32F89AD7F6EDDBBF
          15080436701C971B0A85FAE97E501084C14824E28846A33782C1E095B2B2B253
          4343433C3D1EBDFD7DE6EB383FF05EE5F7BD7ECFFEF9F3E727100188A2087208
          B7DB0DAFD71BFB1C1919C1F5EBD75B6A6B6B571C3F7EBC855E9389485F89C073
          17A65810E5BE11F60A1A3EA8D02E1878F11F3F59F86CD2C9FA8FD079B5130693
          1E292929484E4E86C160804AA58A91EAECECC4D9B3679B366EDCF82299B91427
          71FF04565D9AFB0A2BAAFEA2E10C922831E8717631D2A81A86EBD9709EE2EB42
          03A22B2929C968301853F5C93AABD164D02D5AB48891A372EAD429A9B4B4F477
          0303037BC8D4F55B51B82F02CF374F7FC3969EB92A39C98C44A4C092908DB04F
          85E6DE5338D3FEB1D8DF3AD232DC18697256F10E6BAA35E1474B97FC72D5AA5F
          E9FAFAFA505757276EDAB4A9C4EFF79791A9CB04E14B1378FDF5933A31A85DD2
          51B86EED845942AE56A3A3D0461115052824056CAA1928D03E81D2BA37F0495B
          35EC2797BD9FA34F7BA268D16346B53A8A96960B3871E2C4A1AAAA2AD9F14EC2
          952F4380D9F256E7A3A148E8B97038B078DA64BBA1C6FC4729217758A14FD002
          A108C4A8084992208821240B33B0FAD806D8FD2C76CFED8263601467CFF5D2EF
          7D524747EDB17DFBDEBD46CF9E24BB4709CE71535056D69AE1F3459667B39F2E
          CF0CD44DCEF1D4315A2E4112047DB82D7045C1246938A7DD889AEF66820DDF8C
          42142128FDF968EDEFC40FB865782869318646799C3E7D11B5B53B3F3C78B0EC
          06993E4DF888D04B88DC518415150E4330E8AA08067D0BF20AAC8A05971E66A1
          B642CA7A080C67601026C2220B349E05CE7F8CDFBEFD4D24F03C6CEA7C64791F
          85AAFB41B4DF184420C2637AFA3C28940C4E9E6CC0E6CD2B77B85C8EF3F193F7
          10429F0BF3AD9B2D5BEAAD6AB5BAEFA9A7F203CED1A0C4F4546B2DEC106B4E18
          01DC7D40D80D18D280BA36A0AF0BFB37AC81782E17AE41065EC52834A644B8F8
          612431A9C8333D089653E0830F4E889B37FFFCAD4824B88F5C9C21F8EEC8F3AD
          9B871F7E817BE699E5AEA2A20782C1B08834746B3DA323EA0E27035F540B2F1F
          412A370A9552838B0E25DCA16158F235745240C15080422C3C010FCCCA0CD8F4
          B9946011870E1D1DDDBAF517FF21F3DBE3FD2F8C4B2056745B1ADB1F7B2C2705
          8C42348803AA347650C724EAC1B20C7DA5447DCB282A8F7461C9642DBAD312E0
          D370A081002538F842A1D8144C57E5C292980E3F1FA00854B5EED8F1F221B2FD
          6F42073E3301EF4AA0B4B4F1F8AC5919B312B509823AEA576644DB8C92C10286
          4EA8502A31E68FA07CD7A7989FA5C10D1D0BB7492600700A15BC413F783E84AC
          C40760549B30E81CC2871F1E38BD77EFABFF8DB75ECF3D099494D4961514D87E
          989CA28F3034EA26061A4C48B5CBC78F45C0E58B60EFFB6D9897CE628493E034
          ABA830011609E0A33CFC9E1026996641CDA9D1D3D38B33678E9C7FE79DF572FE
          7711AEDD8B00366D3AB13E2F2FE3D71919292121CA20DB7FCEC8A55A58702A8A
          8202639E302A8F7560B685C19820C061D5D07E93C88892DA3102D7580085E647
          A928245CBAD4866BD7EA46DF7CF3D5D7A8FFE53AE8BB27818D1B0FAFB4DB6DAF
          E5E66604043A599AF7B256A753A8249319AC924EED0EE2484D17A6A588E0C778
          745A55745A162CC3C1E5F6811375C8D4E7438846D0D4D402A5F28A5451B1ED35
          1AC5DBE3D3EF8BD7F1DAB57B17D86CF6C3D3A717F8224204EAB04799E2EB566B
          223EA5C26060462535AA5BDD98CCF1F08439A95BCB22247AA94258282209620A
          9701AFCFC3783C1E6664C485C2427909D537EFD9B3676D381CAE2517DE2F2430
          61C20C5D71F15F1BA74F7FC0664A324645516245EA680AB032D1EF4468A49FBD
          DC768D4935683060CAA5512C21C0FBE1F20E4B4210124F83291C0E31244A3C85
          851AFD934F3EA4A8A8D8839A9A9A525A46FF2417576F6FC5DB4731BB74E9EFBF
          3365CAE315393976A3D99C04BD5E2B41AE41BAFAFB0719C78D21084218810015
          9D9F47281892C7B1483EBBBBBA9A5B3B3A1A871C8E2B91E79FFFD9DC952B8B67
          B6B7B7E3C081038DBB76EDDA40F66B08635F44004F3FBDCC969D5DF0778D266B
          A9566BA550F2242E64A19184E1E161B85C1EDA84544D120FB53A0C9D4E08BDF2
          CACB953CEF950D0FB02CDB5F54B430B9A0606AF1F2E5CBADDDDDDDD8BF7F7FFB
          CE9D3BB7D2EF7247DC189700B13490943A3F75EA94DCB4B409E8EDED417FBF83
          AA790C1E4F5470BB03977B7AAE5CD7E9828B048A7951D1F768E134F49697BF73
          64DEBC799F3CF2C82373341ACD53D9D9D996D9B367636C6C0C478F1E45434343
          15A5A12EDE8E7DE312D8B66DDBB3393939E5A46A505D5D1DD3734AA552AAACAC
          DC4DB22A48A2D3CB714A574141C19F87868699E2E2627475750D93FC0A646666
          DA67CC98C1646565D10CE84163632311BF06CA1CF6EDDBB79D94904CA00A3757
          F1DD09949494FC38353575777E3EB512F5F9C58B17D1D1D12191A8AC773A9D17
          6859F5582C168DCFE7FBC3C4891335E414D3A64D039D9822E4C1B973E7D0D6D6
          46B5E18F39B6DBED309BCDD28A152BFE455D20875F5EC9FE71092C5BB6AC202F
          2FEF92CD6653A4A5A5213D3D1D46A391D2D01F8B06398656AB8D39A46762DFB5
          B6B6C69C52B8254A5F179D344C727C8A2C48492DA3B9B9D95F5E5E2ECF011917
          EFD505AA850B170E994C26FDA44993A82D275017E841A7862CBB29BFB187E462
          94C32C7F92D3314A43435353D3C0E0E060888819E8F99F1211AC5BB78E744645
          FDB163C76AE304EE5848B71350CC9C39F32A9D205B0EE1EAD5AB71F8F0E1768A
          8A8688D868A4C6142EF5794C72D377D1356BD6BC4BE1ED8F4FBA0E8A909EF037
          4A612E452C4C7F5076D37BB220798FE0B8170186D82FA6C2FB13392924437E87
          C35149064688043377EEDCDF103950B151FBE940F7032FBDF4D2C1B87179DFBB
          E336F369837E9B3ED3E9DDB178FF9FBF3DFF779D0374E90933C9006D1598E306
          EAAD566B2215DEFBD4099833674E2C25BDBDBD2D070F1E3C4CBFBF4DE8446C37
          C66C26CAEFC66DC9391F889393BE0C010581642F920926DCD4700E0A3747242E
          13218B9C06393DEBD7AFDF4BB96EA2DF2B7073DDDE6E9B8DDF47EFE67C3C02E3
          1950108905949E1728E78F13895E4A81ECBC9A709C308AAF70DDEF9F531D612A
          A190904E1824C85ABF0B9F91DAFF4F02F2F36A828120F7649840B2F9F352FB7E
          AEFF0185DB965DA603016B0000000049454E44AE426082}
        Name = 'PngImage11'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004D6920313720417567
          20323030352031303A33313A3335202B3031303075E0E4250000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          00000A644944415478DA9596095494E51AC7FFC32C0CC332C30CB2E3B0858ACA
          220D64E03DE54508BD561A2DEAD1EE31974ABC9A79EE3975B2454DED605D9763
          DDD2282F0496B92264E24629285B08C53EECFBEE3030FBCC7DBE6F0642D45B77
          CE79F816DEEF7D7ECFFE72F007BF4D9B36F90E0C0CF8180C3AF3D2A55B131C1C
          1CD768B5A38E232343E54343BD395555E53F64657DDA494B0D24963FDA6FEA8F
          F3A09729292932BD4EB7C56C36AD92885D02246231C760D0A3A3AB13CECE52C4
          C525222838022D2D6DE8ECECD46BB5633FA95443B9F5F5BF5EC8C8F8B495B6D0
          FF5998FB00B66CD9B258353CFC555262827B445C0286386E18339A613418C135
          A8A16E2E46617E1E343A135EDFF416040211BABABAD1DEDE4E40AD06AD565DA8
          56DF3DDFDA5A979D99F975CB1FC1DC03B075EBD6178C06DD37EFBCB78B576394
          81C3037CC5D6450633A0A6ADDA06E9797800BD452771B3A0103BDEDD0F070711
          4C260B2B9D9D5D686C6C4043438D49A319BDADD38DE5B4B4349F3F73E644FD83
          6038932C7F64543D52BA7BDF7EE75FF4AE108F2A31EF91200C91622D455747D7
          31BA6A4CD6E7DE6E2D06F3FF8D7A6533F6EC3D00B57A9405B0D0F66633075C2E
          97401A919DFD1D0C068DC9683496A9D5AA7357AE5CFEB2B9B979C09633BF03AC
          5FBFEEBB1793973DAF9FB118412E2A3CEEEF8B8FBE4CC3D3C9C918206E8DC1BA
          5AA703480FC6E8DD40633B0A32776379F22AC4C62E8046A3652198850303C3F8
          FAEB34C864B308CA01A3A377E95D2D8686EA2A6FDEBCB54EA95456D2422DC7AA
          7CBD9B1D2C1D6FEC3C2C18E40B314706FC54701BAF2C4DC2FEAC53989FF0248C
          B4AEECE75FF0D64B8B71F07225A4523774A909E2D2E714FF667CF8E15E52640D
          839D9D1D3D7F8C610A5554D433F0F189C0E0603F79698C427315A5A5E74EE7E4
          FCF0016D59CB026CD8B061594870E0E9F0E5DB11E4C305CF0EE00A80EC73B9D8
          B5FE65BC7334033AAD0EFB37AFC586DD87B0F0C595D08F9237C8D8DE3B45B878
          7C3F32BFFD6E22AE6565E5B870A104AEAE722895D708A4091B37A61198002A95
          0A69691BDB4F9C38B98396E6B200EBD6ADFB474C54E441AFF8D710EAC3819936
          5653CC854EC0E7BB3E82A3661825254558F4CA362C787A095483D6D891A168FA
          B50AF9E97B70F0F01188C56216E0F0E163D06AA74322F1456DED49CC9A150D85
          228972837CAED52235F525E5E9D3E78ED3D2741660EDDAB5295111730FFB2E4A
          C12C5F1E951DC59C16F3EC81F29F6EA0E4FB63686DEFC03FFF93C726999EF241
          44CA75F475EB9D0AE4677E844F0E1CA278CB588037DF7C57373CDCCEF5F088E6
          F5F49460F5EA4FE0E4E4024747202FEF04D2D353CF94949495D0D26F5880356B
          D62C0990FB5E887E7E3B449EAEE090123B8E35E90442B2B24A0967891B441231
          AB9C5A02BC454033E540FFED5C5C276332B3BE65953736B6E2EDB7DFFD393BFB
          64536CECE392E9D3FDE265B240D1CC994FA2B7B7963C995D73F6EC8502AA8A2B
          B4FC120B101717E7161C1CA45CB36E93CBA09702AEB439632967BC4CECC0BA8F
          51CCF403099FBC43FFA8ED033ACEBE07B54687BD7BF7B100D7AF1760E7CE9DA7
          AE5DFB91C9F24A8944E2151E3E3746287470EFEBEB1BACA8A81C21E5B5F4BF1F
          49EAC7CB90B76AD5AA439161735EF35FF80A849ED3C083B5653045C5C08C8B84
          C222E092A523C070E92514E566E08515AB909898C86E74F2E479BCFFFE8EE355
          5515D7E9F12A095340DE248124CE24432435244D1365C818AA5028826784845C
          4E5CB470BA5DE8B310B94B2122455CDB0201AD1412D52885A04B038C5417A1EE
          5A061C9CC4D8B66D1B65BC2BBBEEC89134ECD9F3DED1CECEF60BF4984FA2623E
          27A10C00DFD60D476D8DC832B915DBC7C6C6260507057E1913354F2A9DF504F4
          9E611038D8416067B59E494CEDE008F43597D0F0CB7598086FF5EAD554EB5113
          9BECDA956A494DDDFDF9C8888A498A2292B1299DF7C1ADD876EF22974FFF6B78
          78D85B4101FE51723F5F8E8B47202C0E62984D2668FA5BD0DBDE88F6CE6ECC98
          118A0472BBA7A73BBCBD7D2636D9BE7D87F9C0817D9F994C46A6CCEED82CFEDF
          D3B0BC7C2C5AA7E36EE5720D2ED5D595575E7F3DA9DEDD5DF27878B8628944EC
          1C66311B580F38501DF9F90560EEDC30EA8432F0A863454444B04631F74C07FC
          E28BAFC6366E5C9B462FBF20A926314DD277DF54E4E4E5B53E66349AAF45477B
          0B8514E496162DB5CBDE96E2E2BC74A5B23474C182D8E572B92FCBCAE5DAB17B
          9075B0B7B7C79C3973C0E7F3C02133783C1EBD37E0E6CD1B7797342689EF3375
          33FCE96F0F9378F7006465155F5428FC137D7C5CD8CD18257ABD099595BDA8A9
          69B570382A0E79C6066F26457C7878789027FC58C51C0E03C6A173019F06CD20
          AAAB2BBA9E697DDAEB744A0A46CD5A5CFAED37A4E7173200DB6983EF495AEE01
          484FBFD1A75004B8311BD8DBF368B6F32112D9D33D9F269F11B76ED5124C3DB9
          DC11C1C172EA664E2CC864E50C349FCFA7A1D486EEEEA6A6E73A9707A4BDBA96
          FA8306F9F575385550CA001CA40F3F6306D03D00C78E5D6A0E09F1950B850C80
          00D62B9F40040422A0162AA4FEADC7D5ABB709A69420023073E65CD6628BC5C8
          4248248EEC7347470B7272CEDCFEC0ED8398A31BFE0E35F5FDABD5D5C82EBEC3
          001C267D9F4E01B07052538FFFCBDB5BBE5526939015DC0980C95747477B3A0B
          8A28347AE4E65E66E2CC428485C5B06153DC0AB82FE407D6BC042DADAFEEEAC2
          7126040FC9094E5454825F72F20BDFBABBFBCC17895CC87221986464642A8893
          93030B92967614C5C5856C82BFFAEA1B78ACF8519C49D98C013A331A9972A553
          8BC66060EF79E421019D8E987263BA6B595B1B8EDF289AC809E6BD80FA75C8E2
          C52BD6878747AF108BA5D3442229EB7EAB62AEED6A4FE3D6119999C7C81352CA
          89D9149A61CC9BE788258DF1C8D8B41EFD23233433CCD01B8DD09372A677B08A
          098239AC08A84CCB3B3A9059F87B4E8C37229A79F093C9A6291212963D357B76
          E4322727A99358EC4E8A852C0493982A553F2E5ECCA42A8882BB7B24DB1BFCFD
          5DB0AC7D36363FB5102A4A3A030188282103DDDC687819D1435075DDDDAC17F8
          04D071F72E4A946DE33971647227643C2421F1F1F4F4522C5AB434C9CF2FF06F
          2E2E9E02994C4EA1B1474F4F2D8DD40EB602FAFA1AE0E5351FF1F13178A232E2
          BE107FBCE2396828077E6E68C08F77AA1F9403F77860726714D840A6CBE5FEF3
          E3E2FEB278DA34AF45AEAE21764CB90D0E362030309E4EBAC3686B2BC3C285D1
          5486BE941F267AAEFB75E5CA95B564DB739F10C018E54261731372CA7E63149E
          9FD48868AAA06D3C071ED6A269F0424A1210141414A750CC7BD6D5D52B46AF57
          73E4F2040A8B885A2F97ED808C54559D3667657D933134345C4F00BB0EAD4CA6
          E3BB01054D4D385B52C1001CA5BD4ED91A91C506D2F33080C9204C7E4C23098E
          8C8C8C0F0D0D7D919A51A054FA2885C59D204CE495325454145CBC72E56A03AD
          3B4700792FC72AD864ACEFEF9F1CF3FBFB00FEDC8F1902744E820725258D80D9
          898181FE71CECECEC1D41BD4353575374B4A4AFB28D399DABC4CAA5A1F16734C
          ED847F126072A232BD9839E1CC247984C4D5E6CE3A58E73F135B4F9264123F1B
          FC44CC317516FC9F00E3DF3020CE3618814D0173F2B90BEB118CC91F0F5BF8C6
          7F6CCC31651AFE1722AC6998F5CB81F40000000049454E44AE426082}
        Name = 'PngImage12'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004D6F203138204E6F76
          20323030322031373A35313A3535202B30313030A08D57A60000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009CA4944415478DAAD970B7054E515C7FFF7DEDDEC23D924246183405812
          C160E4210A450323053B15B596419D16B5531F1D0AF24895FA9A7194A64A9D69
          2B5450A88345A32843958A284E4390512289608882F20E096149C83B24BBD9C7
          7DF6FFDDDDD040AC6D6DEFCCC9BD77EFBDDFF97DE7FCCF77BE48F81F8EF86798
          7B5E0D2CD0E398188FE96657AF5E5B5FD7FAFA4F5660171F4769C6BF1B43FA2E
          8EAD33F01861FF1BB168DAED7DEDCD52B42F86781C50351996926135B64436DD
          F754FCA9CE28CEF175F5FF0A605990BAF7E4BC2B4BC65CB5AF1BDD3D687FE655
          7CF8712DA23326405E32173F85A4A47F71D278AD642D56F2933334EDBB007CE3
          B39E9DAE4571C9B9CE8C87D11542CBCCC5286FEF460B1F7D496B2B9987E9F3A6
          A3545561AEDC8C87F77C8577F87B2BCDFC56277BD620C5E7C2F532300D32C6BA
          B372467AD3FDE9B233C5AD2832745D35B4B81E8A853B269BD18E2112B35BF677
          BCB779374EB59F474554C5410E131A9E8DAC0DBF46AD6C227BFF316C5BB109CF
          F3F703494D0C06787F2794318D581E939D0FFBAF9E7359F6D86970F9F2A0C723
          30E23140D760991614871346B409A6DA0487271D5052A1AB71F47506AD685773
          28DC76F6ABA653AD9F9D0862EF882C943A144C084710BCEBF728A59F0F925118
          0CB06F2D5E18923FAE64ECAD4F22DEDB8ECEE387A1F6F44071BAA0A478E04CE1
          D9E18623C58770D376C4BB6A6D6D6717FE18DE2185901D06643703E94EA140E2
          686F3C82F69327D074AC1EA15EE8F7ACC6CA988A37E8AB5E486810C0676BD032
          6DD95F72C36D419CADAA84D3E3A3333701E8D4E9E1D90B45D6A028121C5E3F61
          84A3302433C64CC521CB3A64C9A4EEF8BBE206C387DEB6BD84F3A3BDFE380E7C
          52D358775ADBF4D7DD585F7D126DF4A90F0491F6BE80D3C5256581CEE335E8AA
          3B0939C54BC72E5A2A529DA790E2EE84A186116792E37156943C1C2E6F3E3287
          5F4959C52822951004905D203D4776A0F36C0DFAC2DDF00C1906FFD83108EEDF
          852FF77C71E6F869943EBA115BE9378CE41A21ED5985BD57CF7FA4D877D91538
          B5EB034896C30E77A6A716A9BE18221D0D50233A841C6234C160488C8C6B280A
          26DFC61429843018015722020E0F9092C6A19D88F475C23B743CE7DB0CB3FD23
          546FFBC83A7C24B46EE14B782EA9095DFAE88FD8346EC60FEFC99D7413BF4F47
          F3811AA0F708327D75D043E78406613A86C1917D0B24C981DE967D686F38C845
          8720849D32E75EB83C742AF503B8136785BF317DF6BD3393F4C780BE4A546EDE
          6DBD5DD1F3BBB5DBF13201CE493B9EC3D34553A694E6144C82EC4A8377C41474
          563D0DB3A7C12E524BC9866B440973CF9932DF0EA78CDEE65A9CD8B70DAAC826
          1DCFBAEB419E9D4CCF2510221A0A21984E187D40E73B8885C2285B557E6CD17A
          3CC6AF2BA5ADBFC1FCAB2606368FBCE616E8912E96DA79F49D29E76C134B47E6
          E48760E99962BA141B152F1B4C91030DB5EF2178FC10A24CCBA871133171F66D
          7C5FBE380202C0C974387C9C3DD7A97035542EDBEB9F2B3FF2D02BD8480F5BA4
          571F43D1E422EFD763673D2069048875D421D4B4DF0690A9ECBC998FB2E43D9C
          A09B93D060500892C6B5418BE2E337574323642404CC5BB69CFE329251F02466
          AD381842CE5C65056A8CA861A2E6C33D78794BD7FBAF94A38A006F49F3A6C2FB
          C4FD6829BA7991CF8CF521DA598FCEFA2A989CB12F7B247202D771103A55C4D8
          149F3B15928795929E8DCFB76C42D38906C422C08459D371D5EC1974447148BA
          5D2144E3BD8A487737CEB7B4A23BD8886063084F6C305F3B781A9F8A054A045A
          3EF06754078AEFFC1E575DEA92B5CD62EAEB3E67576B5AE67046432851AC8851
          A62346B838AF559CA96BC389A3ADC207BCBE34CCB87512ABC58041E51A048947
          2250458E4C9D4D4CA3A4341C3DD41BFBD92ABC4EFDBC4BDF7B058054B5161B46
          4D9AF98BF4DC00975A86CC64AEF9BAC4BFE463EE0960E909003AB70138604BB0
          03FB2BCF822BB50D31E78E4278472EE4BDC5E756B27B324734CB3270BA7A252A
          F745F63FFAAA3DFBD76987ED66F4F16A3C34F28A2B57FBD9072C2E3A308C44DF
          65DC65498098761A60269CDBC60868B1383A5A43088575F49ED750383E17A981
          05C8DEB57CD09ADF72C3B3F8BAFCB758B355DDB27D9FDD9CB6D08236C0B652FC
          604C614E4560EA5C98D15E3B6422FC129200764EE3F6F26B3015A69D069513E3
          35A72F26A99359554DA48D5E6803FC6DE952F4F1FD9D870FE38D4FAAD13AF359
          EC7DFB696BD11A73635B0F2AE85658970DB06A0972BF3F09CD57DCB840166568
          A780752F3B9DEC037C85A137F468C2B11A6336541B40A85A8855044CE3B5AE53
          B8F909808D8B1E40381AC5276C4C5BAB0EA0B9F81994973DD578FF1AECA0CB37
          69EC6A88F5EF071C8736A03EAF787E9E2BD5C525DD690BC612CE54D1964374AE
          1242986E8B4CD712D7A9790F26B61516A52BC97644B22B9663C32FEF439825BB
          FBE851BCFFF941345CBB02EC0507E7DC5DFA213F28A3D5897ED00F20D5ACC38E
          82EFCFBB393D2B83CDAE859D9582632A4CC6D662F80D4ED334786F08951BF6BD
          CE73EAE825C8DCF9F8A09CFFE9E7F311E3B6E8E8B97328630A061DCB305AF483
          0B00552FE2C5FC6B8A17E78EF473B18924C2CC195AB6D3B8ED580008C7C60088
          B4C01264543C8E77972E43A716A6160C44B9438DB20CC5B5831A4A51147BEBE5
          10710F0651F6E97E01F0086FDFB9B025ABF80316E78D19F552E1D4EBA0530726
          E913CE130096ED380160EAFF84B02340804D4B16A023C45499267B840ED50636
          128E0921CA324596F1655313DEAA3E20005EE0A3F517006E2F867FF13C544D98
          7EFDE5FE61592C3146C19E858802A361A7E3E2080807FD00CBE6CC462F45A711
          C04BF116E4E440E3FBAD843AD1D26247C1498026EEB66A4E0505C05ABA7D69E0
          CED751321737DC34151B0B278E09040A47270034918A78321249005689A12523
          90BF04432A066BE0F9BBEE409451ACACAB43F9C1A3DFA4818B23903CD226E5E3
          BA85B761E9F802E54797E58F5286E70D6329D23141341BC8B848882202F65AC0
          108BB3B061954F62150122D442F5E906ECA83D2C1C6E4F6E4262893E8BE0451A
          E817238D6D0C63A61561D6EDD763D6F8006667E7A4A566E5662023D30B374B54
          949FAEE9B6C8743551FF86BD0E18C82A2C412E01D6DC7D276204AE6A68C0B69A
          43026003C715DBB1C6E49E3036B00A2E85E00E134369A37332E409B3AF758C9F
          395E2E1A91A35DABE886CFEB4B8187EB85CBE5B03728E2302D890026FC57FD0A
          81CF57E0DEE9536D319EECE81898F375B4E3037C59DFF69F911899CD1DDC8DC0
          4F0B785C4AC1B8CBDD23F273ADAC02BF954DAD0ECD4CB5B29CB2E195B81B3574
          CB2CBAF1C994690DA5FE7F95F34B00FEA3FF0DFB4BD82B3442E3AE033949CB4A
          DE7B93519393EF2B4978296917729E4CC17F0570E9FB62706E00E14E3A752601
          E501E3F5BF37F0880D10E185E31F36740EA667E096450000000049454E44AE42
          6082}
        Name = 'PngImage13'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D650046722031392044657A
          20323030332030313A34333A3439202B303130300F84E1980000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009244944415478DA9557096C14E715FEF6F0EE7AEDF581B1B1B91185A042
          8012414B68131251A21282D2844496DAD4A99A34AAA320882AA41655A92305AA
          4614DA0627E1900C98401C0201126C7CDF17185FD8C660826D7CDBF85EAFD77B
          F57B3363F081223AF2F39BF9E7CDFFBEFFDDAB8376E5E7E7DB8C46E301BD5EBF
          958F015EAFD7C17B1FAF31DE7BB8E626793471AF4EA7738FAFF1BD9B72B226B2
          4EDEBB78EFF4783C8EFEFEFEBED6D6D68CD8D8D874CA8EC8B79870E9C66F8A8B
          8B0F474545BDED728DA1AFAF0F06BDFA8A9BC1E3F62ADCEDF5C2EBF1A86B53B8
          97E49B400A4ACA3B9D4E0C0E0EFA525252DE4A4A4ABAC8E5DE89201E00282C2C
          6C58BF7EFDE2D2D2525CABA882DD6984D9A883DEA0831FC1E8F520F96012CEAF
          0C3A2FF490F7B2894F59F3E9E41F9593ABA0C80D667477DFC7B973E70E676666
          1EA7AA7292631A00BAA061C3860D8BAF9614E39B8C2AECFDDA0604FA017E2692
          C68D4695EB485EDEBBE811CF98BA9F97DC33CA357AC5E3221F4354901747FF14
          88FA867B0220893ABEA47016A96F2A005D5E5E5EC9BA75EBD6565694A3B8AC06
          3B12CC80CD4F553EAED8278ACDD8B4BE091B963622D0DC8BBAD6209CC9598D91
          AE20CA0DAA80A81C632E9868A5B40FC3517ABD0EC9C9C9DFD20249D4954CEA99
          06203B3B3B75CD9A359B1A6EDFC6AD9BD5883E48DB061A3500249719D1BFEAC1
          E95D05146F230D6807E922B5E344FAF388F9E8CFF40FE3CC4D4BB86909FB184A
          3F5D8CC2D26A646464645DBA74492C7081D4310D00059256AD5AB5BDBDBD1D77
          EA2BF0F2C734AF453B3D4DFEDEABF711FD6C17EA5A749817D189CDABCA341003
          5A5C0DA1EEF65CFCF8B7F180899670D30A7DA3284D5C83F2B20A646567979F39
          73E60405BFD24EE09B04203535F5C8F2E5CBFF601F1E467D4D192D3002BB57F3
          BBC1A072279F25EAC4FF814E94EC3F84754B09C437A4FA9FCB7F8F7F0571C75E
          E337C3C4E644DAE74FA1E56E2D01E4349D3871E273EAFA82D43C1500D2D3D3F7
          2F59B2E47D49ABBAEA32BC13DF8F9601EE6834A80084D454E057240FC96E416F
          DA5B080D68A1CFB90963CF63D7C3F81C7558FA15005FFEEB29F8461A91919933
          7CE4C89103944A20DD9D06E0CA952B7F5BB468D187FEFEFEA82A2FC1EE635DA8
          B9471798A628171ABF1CFED8F9C6791C886576D95500F067157BFE138CD8F9CD
          A00387E256232AA007C92969BE848484FD2E97EB28A56E4D0370F9F2E5F7162C
          58F09FB0B0305CBF5A848F4EB5A2A0D6301D804EFB44B8D30FBF7CFA3A520FFC
          530D05B14200FF9E3B4800622127E276AEC04F168D10403A4E9E3CF9EFE1E1E1
          6394AA1DAFAA0F005CBC78F137F3E7CF4F9C3B772EAE951420FE6C332E16F185
          65CAE975BA0916B0E0FD37BFC1FE1D8CAB7E754B1F4341FF0C0FE9CFB8181E45
          6CCC52BCF4B41129A99960101EEAECEC3C49C90A92731280F3E7CFBF3867CE9C
          6F972D5B8682FC6C247ED7885357B8A359FF68005E83120383B96FC366A156FE
          81A5E31F4737E12F877ECDF4A54F1C2EBCBE7501FEF86A080164E3ECD9B3471A
          1B1B25084BB5BEF01000EBF4CF78FA22A622B233D39192D78CFF9E6685B31AD4
          C817C51E668147A76681D183E2847DF8E9CA46D5FF5CEE6CB121F2E5BD7419F7
          F611FCA80BCFFD3C0A1FBC3B1FA969B9B870E1C2F19A9A1A2946F9A4C1490098
          224B9905F54C45E4E7E5A2A4BC19719FD0AE56F5E4FE011EFC7EEB350433FD96
          2DECC2EF5E2A553F94933356ABAE4661D53BBB1807D20B241D08C0E5C5934F84
          E0B3BD2B91969127D5F0AB9292120190A9158F8700F6ECD93363DBB66D3D0B17
          2ED4959797E3D6AD26ECF8A04DAD864AE4EB9593C7BC5282375FA8C0B2795D70
          5347757D140E9EDD80D48C9504EB503BB4746F058007B3C2ADF8EEE433045000
          76C4E49C9C9C335A39EE9E0460E3C68DC67DFBF6F5D30D01376FDE44475B13DE
          78F7FB8700944E4772F1B84E835A072491F45464E489F54C019F57A60355B9F0
          3197D23ACB4B5F433A01646565E533DB4E69E5B87D1200B9AFADAD6DB2582CF3
          1828E8EA6842744C8D167C14F3A352AB11C1C11604059810CC461548B2C91ABB
          A6CDC635AB703FBE372290EB01FE06982D3A4484E950597903B9B9B9D5EC8AD2
          92A527B4423DD24300376EDC2836994CEB3A3A3A70AFB91983C31ECC9C614568
          68006C81566E66A275BD6031E121C9DD2EB8D97E5DF4854BE16E0E2F6E38C7DC
          8A9C9B96E04CA20C266EAEB3E3369F3E7DFA3075258E97E349002A2B2B93CC66
          F3769988C40A46A35E9B70641375CA91679D36708C3F8FF3F1FBF14BCABA4C44
          027860600065656555B4C079BE3AAE95E3492E00FBF5CEE0E0E00306563EBA83
          9DD84F1DC5887E6C6C4CD948369467B99FC8E5BD90B6E6237182F30E10C4F0E8
          E8E800C7B2EEA2A2A2EF39235653D539AD234E06C0912C3C2626E63302789115
          CB74FFFE7D374BA7DDE1700C7360B5464444CC080C0C548BA0C381DEDE5EB154
          454343C30D2A7112809B003D241F81F83C6202B5E239B5C223C34395568A47A6
          0180D250319FCA9E255FCAEFFD7DAA5DDDF1F1F14F6ED9B2E505BE4333E3A3AE
          AE0ED5D5D5E0A90A98DB5214CA3505A31A39F1A0472A75DFA3AD0F419D097D8F
          022017CB1D4249410C48F3EEDDBB17AE58B162B9CD66DBB976EDDAC8A1A12170
          CC064FADB8897E6D8B8C8CFC9AC0F238F315DEBD7B77708A52DF94FD273D3F0A
          0078229328A49963096241404000A436706895115B0950393D831677EEDC4174
          74344486EFFAE98A6CBAE68BB8B8B864EDA41EFCC0F54800346F02233D86F381
          12F112587262FE7650FCDED3D3A3FC76A03284878723242404414141B05AAD4A
          B413B88FF190CBCAB7EBFA754EA4AA3B7C8F0D807E6DE1803A47FC2D4A24BAE5
          6A6B6B53400800B184E4B7C848D68C73094E0161B7DBE5DB4B8989897FE5A7B7
          35108F07806D732763EF63FADE387BF66C25F5980D0AEFEEEE56CC2F0004D8C4
          DC9767512EB24C3749C71C965E194052A0D5FEC7022041B879F3E6EDB4C2EB33
          67CEFC456868A859CC3BB12E48B51CB78E0093E01450232323F2ECA305AE3228
          2B795FC8FD2E6B19F2D800241DC3484F30EF577354FBD12C5E04328BBD2282A6
          0E636C587942BD141D02B193FA08A29DEEE9E4683F44009272F5A43CA833A0E3
          FF012097F4608E980821CD24459222346036ED9D9F26277E90D493E2D2AF99FB
          1EA9050F6BC3E307E12364C4221CB860D1B89FB6A6D3C8A791FC5C1FD314CA89
          25F0BC3FB4F9FF007C5F136C42251E4D0000000049454E44AE426082}
        Name = 'PngImage14'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D650046722031392044657A
          20323030332030313A34333A3439202B303130300F84E1980000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009534944415478DACD576B4C94571A7EBFB901A372A928772FA308881A05
          84E246F01A6DDA641363BA6B376BB27FB66E13D31FBB4D76BBCD76B36ED3B4A6
          DD58D7A566975A68579C82802008A46A6D94228A78E5A258EEC3300333CC0CCC
          FDB2CF7BE61BCAFE68B769B2D99DE4CD3973BEF39DF7799FF7763E89FEC73FE9
          FF1180F4C107776362621C5A9F4FA9F578BC6A22AFD2E70BA825C9436EB7443C
          F2AB7EBF2B100AF9FDC1A0C78BE7E472B99C53536EDFF4F494A7A5E5840F9B82
          0BCE0D7D2B80C646ABDA669B3AEAF74B878902595010150C0624B7DB4FC1A097
          1212A2C5669FCF8BFF3E280E600C5020E0C7DC8FD137FF9F9F0702C150282479
          FD7EAFDDE773F7B85C73D7ADD6E98B67CEBC7B0FC778160293DE7AAB4B959828
          35C7C62AF61614245162A296CC660F3D7D3A4703032632994C343969A65DBB12
          69CF9EED7845211BC34CB084ED502824B11E5E530044809C4E0F4D4C9871D608
          F5F70F841C0EFB6D8B65EA2FE5E5EF3561F31C24209D3AD5FECBE868E5E99D3B
          D349A552515494861E3CE8A6AEAE7E3218266876D60699A4BCBCCD74E8D0615A
          B2249642A1A0501A0C322B41F27A7D045741A10BA307FFBD58677682CC060085
          48AD56D1D898919E3C791CEAEEEEFC6D5393BE02874C49274FB69F4F4F8F3AA0
          D3C5639386B45A352D5EBC0840D4D4DB3B080666A04801FFBAC9E1700A453E9F
          0F20425457778A72733790DD3E0B2541CCB780C14C31773A9901AF6046A35141
          941413A3C65E2BB5B6D6D73637579701C04DE9C4891B573332543B9293170BEB
          A3A335C2C2A6A64E8C04504A522AC3542B950A41B142A110FEBB7DBB969E7BEE
          05BA74A919607BE9A5977E41B1B12BF03C08CAA72927279A4A4A4AE8F2E516C4
          510265676FA42B576E515B5BE3B5DADA4F2A71C445447C7BFB8A159AE2F8788D
          50B068510C7C3F4643439342395BC0CA790CCFC30078DED6F6917005D38DC8A7
          A3477F8D2C89C13944E3E3767AF9E53DD4D9D94523232374E0C00180ECA79E1E
          031868F8AABABA428F976B184087CFF7A868F5EAD5A02F054A25EAEB1B25AB75
          96D8D088E26F944B8211A55205656658B654F8372EEE19B8C747365BD81D7373
          01DABA7515DDBCD9499B376F44EC68C96834D2E8E82CD8ADBFADD77FC400CE49
          EFBF7FADA3B838B56870F00E592CB3B4654B31908E22F09C8291080311373028
          B53A8A0607FBE8EBAF1F00801671132362C4EF0F514ACA6ACACCDC2452937F2A
          95520421C70C6707EFBB78B1EE8E5E5FFE191E9F95DE7BEF4A7B7E7E52B14EB7
          1C349AE1D79B22F098568522240E888A8AC6DA380EDE8660D2C08FF5B02A938A
          8B8B450670CA71E4B38C8F8FD1F0F0380CD921148753F39B5475BBDD74E142ED
          DD73E7CAF502C0F1E3AD5F6EDD9ABA7DC58A4439E8D448173322D82D0A0EBFCC
          E8AF5F6FA3ACAC22BA76AD81F6EDFB11A5A6A60BC5FDFDFD50382C80B11B7974
          3AE7503BA6107485C820FF7CBDE011D512D953D3A5D79F390F00FF94DE79A7F9
          F3FCFCF4DD3ADD326C0E826A2582C624907279552894A0FB11C658A4A11D568E
          A028ED15F95E5E5E8E807D0296A284DF63636369DBB66D009786749B414CADC4
          5ABCA81711004EA793AAABF59D353595758281B7DF6E68292858B16FEDDA6451
          34542A052C3202804F94590EB6870F3B2829693DA25E4F478E1C16EEA9A9A9A1
          EEEEBB08BE1C581D87832769666680D2D292907AA522306362965072B20E0C06
          443CB07176BB9DF4FAB3EDB5B5672F60A94A3A76EC7C6361E1EA17B2B35345E5
          E2C063001CD10C80ABE3C387B768F9F24CEAE8B840070F1E4480CED2B1637F42
          006681E65D5450904557AF7620881F80A511CACF2F80E264A4F422CAC8C81100
          22E96BB158A8AAEAD36B0D0DD58D00A00780CFF47979BA17376CC8103E670686
          8622000202C0A3475DA88EA9704D079596EE449AF6D1B9735548AD1C2A2ADA8F
          1C7F964E9F6E42E9BE09BACDB4664DA6009098980846D6FD1B00B3D94C95951F
          7FDED27281FB41B5F4E69B9F56E6E5ADFD3940089F33034343130200071903E8
          EBBB073A9741C11D585B08BF0F507D7D2DE2211A69978F344C806523006407C5
          265ABF7E035C138BACC9A6F8F864D1FC180067D4F8B881CE9C296FBE7CF9D225
          3CA80580CAB24D9BD61C292CCC141687011845CD0F035023DF1F82CE3454B12B
          54585884223347151515708503EFA869E9D2E5501E8D750BE64B49A75B23D26F
          C78EBD00199203305C139E3E1D42F09EAEBB71E38B566CAA97DE78A3FC786EAE
          EE3725251BB0D92F5C3038180110CE8A8989018C8960E22BDAB8314B00EBEEEE
          161930336303082F7A08B391860C4815A99C9D9D83F92AB13752CCD8989E9E5E
          B8AB4CDFD5D5D12A7AC1EBAF97FD7EDDBA357FDEBF3F5F28E5B46317B8DD1100
          E2E683326A828B08D13E0A5A9F11B5815D31313121406AB55AD01E27A866DF17
          143C8B9CF7CC976F06C0CDAEA3E3167DF8E1C98ADEDE9E360068955E7BEDC4AF
          3232D2FFB67FFF6658112BAA1FBB805FE6BAC0E59359B158C60140038B8D589F
          15EBFC9C338585EB82DBED12C568FDFACDA29071D98E0060E1465757D7182A2B
          FBEBDF4D266333007C21BDFAEABB3F4E4E4EABDFB93307811645CB96A5200D0D
          F0A74B6620DC82351A351AC900C604289B81020B4697608DFDCDED76E54A1D9E
          6B852B5939BFCB7EE79AC000EEDF7F805A72E55E55D5C75FE225EE055D5271F1
          4F97EEDEBDE37E4949416A42420CA8758BC00967415044302E9EA2BC7A3CDC9C
          D4385412B473DFE7CB062BE15ACF6EE1392B66A57C873418B803727B1FF10E0F
          3FBDD1D6D63CE4F1B8EFE28506C808B709D591237FF81902E61F7BF614A9E2E2
          B4F0ED08DAB15DEE808AF946C2FF3946781E06A19857C6CFDC6E0F1A9A55DC0D
          CC6653C86CB61AC7C7871E3D7EDC6380722FDC64C7618F211DF2E88A5CCBE30E
          1D7AE595B56B37FEB1B4B440C30A390ED46A85EC3FC5BCD5615A25D1F9E6E69C
          E8FF36E4BE83B3C16FB35987A070607878C03C3A3AECC67FEEC9568801320A19
          834C422CF2ED381401C0662E2B2D7DFEC5FCFCD2DFE9742B53B8E7B355E1AB77
          40D0C90DCAED76B2621F6AC0B0D1383A68300C4F8F8D0DCD9A4C8600EE8A6E59
          212B31CAE3346456BE05BBF876BFF01B61E187093B32312929B570FBF6E77F92
          9C9C9A8BE80EE256ECB0D92C0EAB75CA61361B5D9393069FC3610D22BF59994D
          56300531C97387AC8885F7786585DFFE61B2E0C74C2C81AC82E44252384664BA
          E6E4C3EDB295365941443CB204BEEB4BE83F0188AC696420D132283ED42F8B57
          16FF822F9CEFA5ECFB02F8AEE73F58D10F05F05FFFFD0B1FDD0007495EBC6F00
          00000049454E44AE426082}
        Name = 'PngImage15'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004D692033312044657A
          20323030332031383A32383A3130202B30313030FE88380C0000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          0000093E4944415478DAAD570B5054E715FEEEBE60775976595EAB2020EF1115
          9DE0DB19A7264E6CA6D536E934CD244D9B719A46A769D2D6984C8CD524B5A915
          6B4C7D45AAA2928C68894A8B0412254482428C465114841516D807FB667761DF
          B7E75E2E11CD2429ADFFCC997BF7FEFFBDE77CE77CE7B10CEEEF62C6DDB3137D
          61C2CA3E5C0749D12C14B2123C206251229360B62A0912F912ACA47D2749E07E
          19C01C5B05D19C47502089624E348212268259DE20664AD51A955257C8C8530A
          A1CE9A07FD3F574717ADC1AF2D0ED4D27BC6719E18D3C57E9701CCEE8310AF8C
          415E9441094BC8C22C66BB0398A55027A8E252F3214F2D409C2E1FD2B83C3A2E
          2609934449E2D15BFF1B3CF552CFF6A6AB28A707ED1FA6A8D6BAA2ECCFED4E9F
          D51561CBD70327E8B99724C22BAB7B14E2A2C791170A132A4E6118B37D3E144B
          13D5F14A5D01A3D01540A12B448C2A878E8B0465E1B1F7050C52614F01DB957D
          D8F256CD91D24A94DF2A4E5FA4C89FF4BA2856CCD88C2E745F37B2BDE6A1F217
          808D74D84C1262DA0EE34B99523B539194C72826E512B26990A9B2694FC2EDDF
          A39015104B85FD087C4E3B86AC83F03A1DC899FB3D04ED37F1F1BB1B1B3F1F59
          FFE973972AD74F5A304D14748EC06C70C2D4EF44EF4D135BE71EDE7200D84B1F
          18605ADFC19539CF97CFE4AC07FC82A2B0A08C1144748F421BDC562BDD3BC0B2
          B44F718A040398B6F4075069F370EBD42BC3D6CC03A2A9A6CE58F5D137A1C8C8
          809594F7DDB66280E49AC1D5F92AD897E8839F32E7B7A3A6F8E9571F916BF304
          C4220125C3FFF6D86DF0DA9D3C4A9FDBC3DBC5B05CC459C862E450A7E8A04CD2
          419D3C0912990ADEA81837CE8991337D3ED4891A788FBF0BD1C95D08C7AA60D0
          3B60E8B6E0B33E67CB16E03829A864CEFD0DBB67ACF8E56A75CE83BC073CB641
          526AA7AB1D231E2F076ED41662A44CAE2445A95026A7D0C727412489173C15E5
          0F85E9FEAF9DFBA1B5CDC713592F403D598921DAE93B5A0E76E7268C50DAB4DD
          B20EBE381C3E4D505A68EB1473661B7E5FB464E9B6D4079E85B9EB224C9D5D60
          C4A31E902BE3A14A4A425C622A54A4988152205E745C683891F1212AEF3D02BD
          C24D676550D6CEC4B2C94F42AA16E3BABE1B5DDD5D089CA80CEEFDA8A1F27638
          D2432FD4905C65AADEC4B2929229F519CBB72314B0C0DED78FB8044E69324679
          111DC707085C182361002E8B114EE3009A2257D19E1E450ABDAB8891C2479936
          582D4756C702489422DCE8BEC9D67E5477F4465B1BC77EAE467C4EE26676FE16
          A9DF5F80BEEC9F55D3575DE3E23FA6543A0EA588C26285CB6C84DB64846FC84E
          7C606088F7A131CD83F48C2950CA64042402A7CB0B3311B6FFBA07D1E604D679
          C953DDFC49B3893E7286E41C897534B004C558894BA93FDA3343244B1010DF49
          B5686898509A88F566B8E91A8D46314A0C40AED02094AE4179A80969B959504A
          A40853D5729172ABD58BBE3E1BF4B74DE83863A8F357A18F5E6922F9844B3F21
          D546F3CC508932CDBCE756A93297F3A9E6750E6268D0426284DFEB1FE5207944
          2491419334192A5D3A34291918268F6C6EDF0E6D6E0A943132B0649BDB350C9B
          CD8D810107F47A0BD21CFDA1B39B83473D1E5CA0CFD493F40AE976A7145F3F8C
          5F24659794A72CFA0B866C37D175A10922590C1F05A55A8BF89474A853D311AB
          4C1D4B09323F8CD26B656033C5502915E42B86908FC0E11822E40EF4F458A10D
          27E3E0A23C347E505EF3D30DD82D7860E86BBD60E7EF90B972316EA53F7A8EFC
          6E87B9FB2694F15A62733AEDC60A7C181309CF87C37DC7A097F521294903A948
          0CB77B1876BB0F46A31DBDBD768407C3A8597D0809F20CB81B72A27FD8E3DFB8
          FF380E0BEE8FDC65001770F30768D02EFDFB22A9BA40E0C15711123821E32538
          62C569E3BFD12C3320234D07292386C73302A77318FDFD0E123BDC032338F5AB
          32A4A9388FA9100D74A0A7FA21E3CAD7F0FCB54E9CE5D83FD615C70C606E56E0
          E594E9CBDF4A28DE207849222895C2EF1BA45433C039A0473818C46EF5254C9F
          5744BB22521E20E5C478B38B573E40D5AEEA9932E427165236D8E132E9919CF5
          10FC3D9BD172B2B461D93ABC1C0AA14DA8FB77DAF1BE0DC8FF6109AEEB565C96
          70E9188D8460EEBC0287A51F117F80673E4BC7E35493F19AA50A4B1F9B07BF3F
          4831F7C16472F2A4EBEA30A1E2C91DC80A8B31D8D386619719914008790B7F02
          6DDA32785B67E3444D5BD9D36F602BA9BCCD65C2F87940663E816ACDE2AD0FC7
          242D81D57019FDD75A79E6C725A7419B9A8D84C93930769AD07CB51EBBE36AF1
          F0C245E837D861E8B5A1FD86017F9CF9631485C86B51968218859CC6A3E4CC62
          A44C9D2F702901FE565D64CB61CBA64DBB70906BC9E30D609AF7E189DCFC9C8A
          E425A7E9B9837A8211AAC429B41523842C82F31FB720391CC491CECBD4494E53
          F753C06AF6628DAE04CBD485104B6391985584E48C59D43BD28550CAF9AA1934
          951105B7B15F74F4372E7C0A7FA68717EE9A88B2B3A1AEDF888B531FFF57AE28
          668A90AE632414F328766CAFC088DD4A6C77D3AF30D479214CCBD56076DE5C42
          3B13CA84BCAFCE72A53CE23D8350CF568C18EA868E5D40D3F6F761E9E8267440
          335794EE1DC9C4ADFFC08BF9C5734BD525C700FEDC68C3711ABB60EBEBC091AA
          6B08FB3D904AA8E5E64E4151F16C4AD71C9EB05A6D32A5E5149EE441C30E9A08
          4BA36D7AFF95AD15683F751601A212577EBB493A48F424835F9B091F9C8BD4FD
          6BD19CBEA22E5B1C93C97BA0BDF11082FE11308C88DC1A0F834301E21D442239
          0A0BF3C9731CEA384486EA11EFD9038FB1C9FE7E033EDB51095B8F0123B46920
          E914883728A4A17FAC17DCBB24F587B06A7161C61EF9DCCB0C375DDB88908161
          0FC57506648A749E0F369B8FAE5C7BB640E53D0476E0EDC8C54E7C51FA1E3A4E
          37224433A659407B4B283E9C3B7DB8336EDD5588EE5D9ADE6A54E94AFEB45436
          E959FA392C84422A289523E23C8620C5D6D6F3A5E54803CEEF3A4E5132F3D36E
          EF38B456A1A804C655B7BBD63719205EB706735E59815ACDB2760D23124A7254
          8FC0ED6D881ACBC24DD7D0B2F53D749DBD805024F215DA4E01AD4B403B36C97E
          E3FAB63F26F28AB7F1CC6373E3DE9116EC15076EBF0E4BEFADFEFDB568D97792
          9F4B39643D8252EE6A23F17C1BDA891AC0ED25541DC05A8D08256FEC41DFB956
          84A9C69885B8726212D00EFF3768276A001F0A12AEA3CC22E16634B380D62EA0
          0DFE2F4A276200B7B852C6318FEB4C5C4A8DFD79F8BF144FC480F167EF8BD2F1
          EB3FEEA50AD8F0F543F00000000049454E44AE426082}
        Name = 'PngImage16'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000008F84944415478DAC5977B5054D71DC7BFF7EE7B97757DA03055181154
          62C199D4342D89631B02B649D068134747C7613A6D52639D69FCA31DB5D3CE58
          67A2ADED38A9260146936AAD3A38B382041505417C4111945790B7088A2EBB0B
          EC2EFBB877EFBDFD9DBB2B8628E9E81FED99397BCE9E73EFF97DCEEF75CEE5F0
          7F2EDCD7FF5CB972C5CA71DC5F24495A4D7F2DE170384055501405D48AB22C87
          A92F45FB4A749C8DC9D1E7E4E85C90FA02AD13A2E2A331B7D96C3EB779F3E6F2
          6F05B87CF972C1ECD9B3DF23080CBB5DD0EB74506419B20248B2045A9809545B
          5992A363CAE331362F459E23E1EAB8288A20080C0D0DC9369B2D73D3A64D9726
          05A8A8A8E8CACCCC4CAEAFAB4361F139703A3D741A0E3CAF4043F35A0D4F2FC8
          5415F5458E34C0B39663AD4C9557FB1C7B9E36C13612A627E7A6BC80AEEE5E08
          82F0E1B66DDB3E9E14E0C2850B9D59595929753557616FF1425AF053C4E82498
          F53CCC068E2A60A41A636442814010F08780B150A4F587648C0912824191C624
          9AA736CCE1938C87386E2F85D7EBDDB573E7CE3F4E0A70F6ECD99AECECEC1FDC
          BA518B334D0E789396C3A21108400383818751AB8189600C5AD201C743243587
          441901121C22C17E81FAD486A8F5531B101438FC0A0EBD368AE3A74A3132329A
          B76BD7AE0F2605282D2D2D5BB66CD9F29ECE7694DDECC383D904A01569D72458
          4B8249B89E5AA65EA67B667F31ACA8020361DA398104C304138AC00409E2BE0F
          38941D42F1E9120C399D760278E7DB004E2C59B264EDB06B08E76B5BD0199F03
          2B69C0A0E3D5CA84339FD0F091D7C805C8E914082434489A10983644D6271815
          40C6A057C681E50A2E9797E2CE9DBB35BB77EFCE9814A0A4A4242F2D2DED57E4
          E228ABAEC1CD196F134008465538071D016879E6943CB9A142D1A13CD602DBB9
          24ABDA60665101A87DE893F0D76C3D5AAABFC4EDCEEE9E3D7BF6244F0A70EAD4
          A98FE6CF9FBFDD669B82F28A0A54597F069B3614D93901B028A0AEEADDC44061
          C8AAA26A412400A60906138C6A8181387C32FE946986A3B10C376E3679F7EEDD
          6B63CA9B0CE07773E6CCF9736262022E967D8962FD6AD8F422747C14808FA89F
          8BBEC54CC0B4C000545348CC0CA40DC58D80C10E83AD15669387E90AA1611123
          2D128469F2DCF3BFBCD4F75400BBDDFEFE8C1933F2D3D3D371E96C118E08CB61
          336B40BE070DED9E09D746023F0AA044921409679A601A90675CC6F4B8637825
          E9154CB75871B6A30AF1361D7B08FD6E276ADA7ADD6D33FB368EBE269E7902A0
          B0B0708DD56A2DA44840E5193B3E737E1F568B8D542F538DEC9E671A88BEC8F4
          28D3AF14D50062ABB130F5B4949DB05AD32335E27C6F39B8BBDF43E54811DE4E
          9B0B8DAC8542D172A6A753BCCD0DAD5256286726009C3871224BABD55E58B162
          05AACE15615F77328CD3E2A1A5EC16713E8A3EEEB109A09A20E20792C689F8C5
          5B3D6BD3DE9BD2265C834F72E15AEF57F8B5ED007E347B291694C4232B29117C
          983D2FE39F8D4D43632671E1048063C78EBD48F9BB61C3860DA828B5635FDB77
          204F49A0D093C777CF22908B2A8E4582120508DA3E43EEEB3180398007E12E4A
          DD5A38BC2EF47458716C59A10AFAF2C5242C9E62A1C8D1A07B7004573AEEEE98
          0070E4C89124CAD73DB9B9B9A82A3B8DFDADD3E03626C3A09122005C4403AC55
          A226607EA05034689337E337CB56E2F3EE7CB40FDD236896317974B807F146FC
          1A7CBEA410A222E127D7D2311D22FC639479EBBBAE4F00C8CFCFB7D029E6DDB8
          712377E36A253EBD65408F76210CBC180588A8FF9B266010714BD60BABBF9BA9
          DF575589EB2B6BE0113D742891DF90F982B21F330D71E32EB7F6D65238FAFB71
          FDABFBAE0900B410B77FFF7EEFBA75EB2CEDCD0DC8AF9350272F849997D4F4CB
          477380BA7396031049C70C22F1876B8537535FD2173674A2F2CD4A48ECA4E422
          C60ACA41183883FA2E2B9BBB56A0AEE1DF68EE744F0460E5E8D1A3BD4B972E9D
          7BBFAF1B9F5C19867D7831CC5A495D484BB9C04A31C942D346A7A395CE88183A
          1DAD7A0EADA60D78E7C52494DFBF86BB1E27E50D50D5C0A7F8913EED55FC6BF1
          0575FD2DBD3968EDBD09479F80B66EE7F527002812AE513ACE18197661D82720
          39350D264E8085670949522F18C160880E9E109DEFD40F89947C441C1CFA02D3
          533D10E0867A5251F18B7E70FA6414A4DBD5FFBFED7F17F59DD7E1712978E8F0
          61A0CFBBFD691A389E9292B28EE5FB8EF6DBAAED59B653ED474730B337C73D7E
          4D512259D5C37BF0B17E0F5E4F8EA36358546F4523920F5B16FD1D59D3DEC2B6
          FEB5A8EDBE8AA017703D0CA0B77F6428EC95173E0170F8F0E10FE8EAF4E9A245
          8B505F5F0F1D5DCB587974BD0A0402E3D72D56599F22479D6BB434E2566295F4
          6AE21C0D5D26E9323286352F7C8881701BCADB4BE073CA181D0D61709074A311
          562A3B94734F001C3A7448EFF1780ED23D6ECDD8D8989E5D32A9F87D54341ACD
          9C8484048EED8EED9CE6E172B9188462341ADFB7582CF72AE22A16F76BBBB725
          275AA69A8C3CC2A449BF3744B721AA1E81541F70844D522E13FE442AFE26485F
          5F9FCEE1700879797961F28D1412D4BE7EFD7A8EC6D0D3D383C6C646B5FAFD7E
          C4C4C4CC3D70E0807AC8707BB9588C6113854B8E51CBCF93240E6240EA240739
          0D13F2958F9491A71E464F2B74409949036F3C78F0E0DD79F3E6ADCBC9C9A18B
          C51D0C0C0CA0B9B919ADADAD70BBDDCC54BFA7ABF74982EDFC6F6B7EBD4C0A50
          5050C0CF9C39738BD3E9FCC3AC59B362A9829C13B1B1B1201815A0A5A5050D0D
          0DAA39080E6D6D6D0A3D7F871CF80469EB1F4545451DCF0D70F2E4C9BFD1C25B
          E996CC917DC79D8FEDBEA9A909641E74757591538D22353515717171A06F0AF5
          3936DFD1D141B948F9C264326D2D2E2EF63D33C0C18307EFAE5AB52A81096736
          7EF4F1C1DADADA5ADCBB776F7CFC51A193548D1A1615CC419979E82A7EA4AAAA
          2AF79901281FFC627070302F232343BB60C10275676C51F695130C06D5C58787
          8755618FE0587E60F32454852373D0557CA4A8BABA7AF5330344FDE02582D84E
          0BBE45FE60983A752A7D1F18C673030360500C8E5526989984C29801D0579D5C
          41503FBF78F1E2C073013C2A3B76EC984AC27E4CBB7B9922228D7C2181DA789A
          8AA13E4F7D859DA2541D54BB482375648ED2F2F2F2E6E776C2FF55F90FAA186B
          0B181FD2360000000049454E44AE426082}
        Name = 'PngImage17'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004672203232204E6F76
          20323030322031313A35303A3039202B30313030349641D80000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          000009384944415478DA8D970B5054D719C7FFF7DE7D40E4250216D1C4624414
          547C0531A28CAD266A679C24D5B4266D4C44531F28E3D466121F313A6D4C1B4D
          341A01C11A8DD66A9B898D89CE34C9844E356A147928101015B0CB63D965977B
          77EFDDDDFBE877EF2E5BEC20E4CC7CF7BCEE3DE777BFEF3BDF3987C18389C9FB
          C4BE4911DC1B3520069ACA6B8A221839D0035515544D111855E1354DEB611455
          50342A539DD3D0E3D7DBFD3E3E20CB3DAA5F765959977063C7111EF846A1B135
          F49398BE95BCB38EB58AC01F50559509A8FF7B81611ECCF507DBE76382312A2A
          3812068C1220669A90D534D6126893BAFDFBAEAFCD2A83FE1380FC5080D9C71A
          AA34D634696C9C05CF8E8B81C32B43201241D620F85478FC2A7A020A95357864
          15BC5F81486D92CA40E62C48E39B11CD77A062F854708A0C86B8CCAC0ECE6A5D
          973ED97EEFC8E623344D0789D23FC0F1C66EBFCAC56D9A118FE7C7C7E287251A
          4BD5E0EA7621664E223EFDE5360C5FBE1E2EB7001F019636D28C5E406ABB5B59
          BBE3A92DF4C14512F743017C2A1B5738351ECB33E3A0280A995D3554AC1B50A5
          BA51EE238ADE11190979FE63B0D4D9F0CDA6373173E53AF8041EACE247499D86
          BFB79AA1B93B9A6B5F9FBD9FDE3E4D72BF3F0086009C3AC04602788100645936
          26D1EDAABA1C8035029AC50AD9EF37C0541D227628C4958B80CFCFC33D6604AA
          0AF7625E5E1EE44000B297471101FCA3D504B8DA9BEBB6CD3D4AF37C4472F707
          00C4C2EF0F041DCC6C81E78B33B0BDF306469437C22A89410D4444823FFE21F8
          820248A3E371635B11E63D394BF73D03304000C5B504703FA88186ED738FD33C
          7F0E0168FD02E83EB0611A0164C4429224A3838D8840DBDE5D706FDE8E6BF367
          43FC453E14AF17569A207BE76B50E9072F6D7B178B9E5B8648B3296C3A9FE046
          711D480356303D6DCD0D6FE60D02F031694066E20AA7930F108028FA8C3FE5CC
          665CAEAC84FCF37988B20948FCF725A466E7A03A270DBE1B8D285FB614A397FE
          1A79B3722089A23139436B56E25D28AA05CEB698C190066EEF1C0460D6D1860E
          49E112D791065E991C0D8F473200CC04F0ED77DFC1E213212D5C007F6A3252F2
          D7A163F356C88BE7E2EEF3AB30F1C7A33176ECE364367FD841039E1E9410C0DF
          EE59C0089DF7EFBC35E7E8800039471ADA4585495A4F1A58393906BC201A1D1C
          C7E1F2952B884F1E81F8CBE5A878F9556AA38E287A9C398F613131903C1E8C1F
          3FDE70DCDE95E327805202387DD70CCEEBB0DD792B5707287B284076693D01B0
          49053386219F34E0E6BD61802B041037341ED3A64EC18529E970557E0F76D74E
          CCDBB0114D7575A42D0FD2274C80ACDB9F56806E02DD070EDF22004303765BF3
          AE390303CC28A96FF7695C10202B1ADD2E3E0C70F5EA55242424202B2B0B9EA6
          269CF9D942647EFA19A68F1B67F4F11E2F26A4A781A9AB8038368B026EC05805
          25378153774C600587ADF50F06801E0DEFF40B30ADB8AE5D220D6C7862185613
          80230460329970FDFA75B8DD6EA4A4A440635974B4B5213A2A0A168B05CDADAD
          48199781ECADCFE0D2C4F9786CDD1630013F145140518D86BF3459C079BA6CF7
          DF9EF3514803FD034C39A4037049853313086008ECCE60C4D4D5A9DBB4A1A1C1
          58627A9D2108BD8DA59C1B9A80D4C3DB1179E2AFF872C51A4C2ED802CD274126
          8062D2C0C9061338D161B3ED9E3B3040D6C15AC3070A672662F5A40874513C37
          0291110C68220A481AA9361C92F551AC8F40FBE214980DAFC29FC8E19FEBDFC3
          8225CF2040008AE4210D0027BE272714BB6CED7F1C0460D27E0250B9A48DD943
          B18A009C3D9E2000CB51247340BAF815A29E5B0155F4181FAAE41B81CE0EF8F2
          32C15030FAD7EFF660EA82A7116DB5065782DF8B0FAB808FEB399824A7ADE34F
          830064ECBB65986063761CF2275AD0CD0797214C66042E7E09E7B3CBD15A560C
          26F951DA0F7C50228660CC1B2B606DF80FAEE4AFC1B85FADC68F86C61AFB809E
          341F015403C7EB084074DAEC7BF3060698F0DE2D3201474E18430066B8846028
          E6C8D1DACABF82BC7C39F81852C8B96F91989C0CCF81B7C17D508CFA1999E87C
          A9104B173E05914274D86C0111072B8163B5260270D81CEF0F0290BEE7A601B0
          7EFA10AC220DB8BDBEF032AC6F6985F76419620E9422B0E4279876E414AA1313
          A18E8AC68DD7F760ECA81464A4A72310086E60BA0958D98783550C8ED5B14620
          EADE376F6080B43D35ED3EC594B4766A24F233CDE811FD6180C6DBB761494882
          75CB06747CF635983149609A3A21EC7D17894FCC04EF70202323E38150CCD179
          A0984C70B8C604B3DF6D77BD9F5B3A20C0E3EF54B7F834D3C87C72C03593393A
          7A05BDDD00686C84850E1E393373703692A3754E67A19FE622F583124450F8D5
          FB7580DE338401AEFA51442628A9660D809EFD73F520A44334F50B90BABBAAC5
          A79A46AE9C64C5BA2C1378490EAD4016B7490311B42DE7E6E6E2F6C913287FE1
          45249CFB1C4B162F424D4D8D019099996998A0772F30D3F9B3A892417115078B
          DF65E70F0C0230FAF7558606569203AE99CC1A87D05E13E800D1D1D1C8C9C931
          DACACB4A31ECC95C0C1F168F9B376FC2E572219D7CA05703BA585805872A1803
          C2E273DB3D87F206067874970EC08D7C25D344000CBC012DAC01A7D3696C48C6
          8B548F207398084C173D1CA7A5A519B9120A527AB290068A69F203151C99C065
          978A060118B5B3B2452213BC9CC1622DED27A21CECD607D4C32F1B0ABF304435
          EE09A46FA3ACAA14A283B1D1B833D0AB88A4E0F49B0B0CCE3731B40A3A5B7C65
          4F9F0C3961FF002377E8001CF90083824974EE177575D272D22F224CE8131AD8
          4B8BC34121C2EE658CDC29EAE5605B1795BB3C0C3A297778E827C8592DAC06B9
          FACC39A57CF7551A413F15DD0B4FDA0700C95BAF5528AC754A6AAC86C5A355DC
          A70B99318197855D0C96BB497C7208463354101E8409D5D9703DB45F389BAA02
          A75FBA4681A99CAA1748ECFD0224FEB6BC807D24611FDDF798808CB02D99D093
          D15463E2A015B450595535BF5F5459AE5B115D2E8DEF72C363E715BE43D4844E
          51EBAC15B5D62B141C947A1AE46B12BAAAC0D72F00A5B8D8170FBF668A1FB34C
          3399A2548FBB5BF13ADDAAE0E055BECBA37A6840A1CBA7085D01CDEB50346FB7
          A2496E1532DDD534558F5A7AECF6867231542643C011527B5BA84F7B18807ED2
          4B26994E329E640849203498D867D0DE897ADBA4D05FC92151FA881CEAEBED7F
          20FD3F809EC877E96A0E4487CAEA4306EDCDD53EEDFD250D03A4FF0209B9676C
          DC8FA1610000000049454E44AE426082}
        Name = 'PngImage18'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004672203135204E6F76
          20323030322031303A30383A3239202B30313030F5A262C60000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          0000087A4944415478DAAD576B7054E5197EF6EC2D6C364B2E4B309BAB853886
          7289040CA20EC244A79658A155FA475BA7756A3B6DBDCC28EDD8D24E4BCB1FDB
          4EA7D88028C360408180D0AA25126E1564488024350648266403219B6473D9EC
          6EB2F73DA7CF77CEEE9270B1E0F40CDF9CB0DFF7BDEFF33DEFF3BEEF7774F86A
          8FEE16BF2BFF2F43373CC3F5280D84B0922E2A21639622C12EC780B882E18910
          9CFE099CEB74E1931FACC7452E8FDC2E98FF0920D48C2A9D1FAF0775FA6506DB
          D7249335177A6326249880988258248CD0840741BF1B81B17E3918087E7AA90F
          1BABD7E210B70739E25F09C07813669A42D81C32999F9C567CBFCE90318B0EB9
          3CA6A749BEA3019A1F841CF1211A0D438E2A64C30402807FB85B718F043FDEBC
          1FBFDE5E8F0E9A0BDF8A919B0288B460E1B81B07D2CBCA0A4D8EA5FC814E6571
          62DA09B502814E3AF71204AD92EC084311E5DFB1A8F68E2B160402710C0F857B
          771FC78B7FD98DA334EBBF19881B00445A511118468375F1C3597ADB1C5A33D0
          329D878FABC804A1979B80D1917CE80D46E464F4C0E1209E90E63C124980E0BA
          30F17AC6E0D9F44FFC74DBBF504FF363D783980260A2118EC018CE642D7AD0A1
          B7CD03A4349EDC4700B5080F47E16AA60597B6D6BEE21C0CD31C18399C078304
          644C07A6A573B9AC8188C5341021AAC03D8ABE5F6CC20B8D1D38C9ADBEC920A6
          00081DC3415D61E9374C05559C31F397218E9D70B701CE1340F6FCB5482F7D0D
          06AB1D3A1AD771B78E04C9A10022AEB711EA7C19E9E99AF568F41A133EBA74F6
          E3E89ADF612DA7CE27C4391540F81C568742FA7DB605CFF1B7699CE131E25BE0
          1F00DA3F02F2BF791A69B99529C7C2890A8043125624113F3FBC9F66C2689011
          8D692C081001A1D72094B73EC2FADA066CE3CADE6476A400048EE0AC71766585
          21A31CD0DB88683360F0E30223A7CF791ED9F7BF4D8BDC40474AB0178A1285DE
          9449001274EA5B6323EAAA43A06D0DE2F2B5308890B8DD5461082DAB7F8BD7E9
          EE5422141A006F032AE27AC67E1E4FAFB372D705EE3A4200C099BD80A3EA382C
          79CBA0D09864A4B1FA6C4C2FDF0183A508FEC60760AFF623EEEF873CFE05DFCD
          0877FF32A5832488FE7E9A334079A906BF697332AED43287AC02E8D98FDFCF28
          285A672978941EA8A6F137A1163366DFD90F81C2275A9196B5000A4F251194B7
          F5FB48BBEB3BD4C23DF01C2923139AACF49CD3E9359644064CD681604080D977
          12B5EFD483F4A24568410570A90E0DC5731657E96DF7D1108537BE5F752E18F8
          E2DF40CEA25AA4DFFD0CF16AE192F49A4339320C7F6B3594B14618CC1A9DC9D8
          4F1E22330606B4505C74E1C46B5B50C3A50D1C232A80EE7DE82999FB58B1CE5C
          C2F87E46FDB56BD608C04DB98C7A8BC9420F141A53144D782A10213C01860EC2
          57B72072E95544437E44A25301244320005007DDDFFB133672571D479F30A573
          EE85AF706EB55567CA63A2EF8114F74249285C00E966E1D3672D877DE95148A4
          5B495677E5DA1AC18AD81338B310E3FD2D60459EC2C0952B1A103631CFD37FC4
          DFB86B3B873305C051B6D20AE35D8CC056358612B4D44A9E768491991807D21C
          AB9096FF2C35B04A0DB6582B18480121BAF11306F5C49319703A13A00D18FBEE
          06BCC5BFDE11D157B775BC879E82B2478A24533E62433B35009256C5C2A44DB4
          5D9946E28910481C590F1E8481D5323672106945CFABAC245331DCBA02835DC7
          D402249C4F4C0057AF6A360331387FF857EC9902A0751B8E1696DEF788C9360B
          B1C1BD2A0031C66920149DC1D32E67CA15C2903E1B7A730EFC4D6B90F510C361
          71C077F85E582B6A08E2276A96084DC43B9EC3C0F9ED181ED6000C913DAF5703
          D0358853EB6A5501BE2BE4A7127CB2066F9494E4BF6ACD5B8248FF3E8D01CE08
          31458C15703C76566540C45CA4E1487D26AC0B761154097CC7CA90BE7013CC85
          3F564321B4106E7B08AE8B9FA90004635D5DDADBC81AF2C169D4ED3981D3B426
          58B8AA02D8FE07542D998D43F6594FEAC2834C7C1E255966836CA2331FEFA333
          47A2FE72C43CCC080FE78D0CC1019EFEE75A8D105532E647ACD18676DE8B42EC
          9063EC7F8383DA9CC502E5952DD8DA3B8263B4F2492A0D69DAF2C1BB682AC89B
          FF7525CC321BF54C69D1466B0966AC70A69A87AA0349C323E95209A1CE453E2F
          87A7F73FE8766AEA17A7178F9ECCF08A70FE858D605FC72E8EB3A94224ECD4BD
          811FCDC933D5D8728A74117F574AFDEA663A4BB3CD84AD7C37D2ECCB52CE263F
          72B093B15F89C050172E746A2045EA05137D4F9CFECF07B0A3A953ED8682FE9E
          5429164F26FFEDFA3B3E2EB1DB974AF2280DC82910C218EB382CBC1E98D9280D
          B605B0CCD9C19A9083D085A7A10F9F674BF6609062EB7369EB45E513C2133644
          ECFBBD685CBB0DBC4EE143213BD182AEBF0F185EFA362AD7ACC03F32A71B7318
          872927144693D467B159E62E3F05C95C00F7A122B829B6898046B9187D7D5AEA
          09E7827A59C1D0CB5B71D01B407302C0E51BDA71E2B1FCEA193CF5F862D458AD
          4857E39C709C04211CE4E6729494B3F99831D0D5882BBDDA9CC87B213859BE16
          770EFFBA9D38E074AB4E79B3C0E737BD904CFA7FE6CF56E3A9550F6043BA0576
          41DFE450245950FB80A2DD05474735E7A203A6E81477039E7CFDFBA8A77357A2
          F99C4B50AFDC0A40A20023FBE17958FEE22ABC929D8125749A5A274E278A8B68
          B322CD84D3C90CA9313741B93C88A60D7BD1E10B805254952FE2EF41AAA7DE1A
          4012042F06B8F7D947F1C4B72A519D9186B96CB5BA646D4FC65B9E648E976465
          C883F6AD87D1D27C095481FA95248A8EF836F05DEFFCCB0024E7A87BB045A26C
          FEDD58B4E81ECC2ECD43718E0D791633A68BFAEF0BC23B308A81F62B70F1D6EB
          EB1B553F42C49DAF2D01806D0921DCC987C9750FA309DE7591C391CF51C8919B
          60C89C58134EC496F71E957211F3110EC142ECCB8CDFF6C769222CC2A105EAB5
          1994A77A1D118F482991B742DD810420F9768CDE0980DBD977C79FE7FF056694
          D75022C41D670000000049454E44AE426082}
        Name = 'PngImage19'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322032333A35393A3234202B30313030B95D9F780000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          0000096B4944415478DA95576950545716FE5EB374B334611550229B8D2620C8
          8848203D98B26AC624D4940BA2A56534468D3FA253356A598E535333C66570C9
          C4DD38D11831923812C6714693D2198D960BA2201A45599A86B69BA591BDF76D
          CE7976438B5253DEAAC37DDCF7EEFDBEF3DD73EF392D60E426F09FC58B174BA3
          A2A212ED76FB78A7D399121A1A3A2E3636562195CA62CF9EFDE7D6F2F2F233F4
          99017B10833E7C44CFD365417E09700882B9DFDA0223AE40855294A18EDE59C8
          5C2F80703B7EFC78447777F764B3D99C2293C952A2A3A393C3C3C315F43C362C
          2CCC3F323252888A1A051F1FC9E0E4CB57AFDBF4ED4FBE2BAA9AD7149314B676
          F69BCA8037A39360B099D06EEA80DED483BA562D7E56B7580C5AF37E1CC62EA2
          AAA7A9B61708949494AC934824C5F3E6CD137C7C7C5E908369DBED64F4E02073
          39013FA90B738FCC744AC6744A16A4CF20D036D4F5DE87CED80E93D54A441C64
          3658E863ED933EF43C309FC311FC8E7450BBD518224032CB57AF5E7D4CA954CE
          CECFCF1F04753A86401D04EA74F72CC4E7D5DB50D5FD2F2CCC781F355D37D166
          51C3E190C040E0034CC06E83C1621595B0C28EA73A17ECB71C47F02DFE424B37
          B312829793BEC9C9C9E3172D5A7466D9F215C9B1A36361B5B981C99CCE21124C
          ACDBA6C58CF22C14CFF8043F7757A2D5A4266F2430D9C96B8B857A1B06A86F19
          68C3B6B42FF146C8047C7C773E6E5F7D62C5378E55D08263A74318A6B4940814
          E5E6E57EFDE1F29582D93AE4B148C2FDEC473BB4FBF6A7689754202D269154F8
          2FFC047F5889A5852437929968BFD4FD3A7C965E8299638BC4C5CB3A3E43E197
          7F066EF495E20276D3508D8017DB6BBFDFB0E1CCACF91FE4272A26C06677037B
          1109F607669DCEC7EC9C0CD4F7DF43536F236DA60472BF009849018BC3419EEB
          B033E31BFC66EC1C7151ADE5310A2EE7E06E7508D0D0721F5F633B0DFFF03202
          3ECB962D2BCCC8CC2A2D5AFAB160360FDB02B25019F056691256BE5D80C3F70E
          A328742D8CBE465C301C466C4024348676FC75D2091424CC11A3ACDDD288F72E
          66A34AD7053C9900E81BBA71D0CE044A5F46805BC8FAF5EBAB3FF86463922C50
          0E0AE6E762212208C83B118F3939B9503599704A799A2208D8D5B80D7BD57FC4
          E1ACBFA320B1505C486F55E1FD8B5350A9ED7A163C0D59407F750F0E390ED27F
          474722E0B36AD5AA7DF9EFCE5D999AAD1483D1E94D2010985FA6C41BA972FCD0
          78193FE6DD40823C01327F1964015280AF0A22A4B7A950E00617786EEF6B40DB
          38DA8F3B0FE8249CA5AF8E8C44004B972E9D97F68BDC6FA7CFFD688880FB18CA
          0388FA9D3FA1C2F83D3A5C7CF4808BCA4A8C91C7C32571213020009D8E26923D
          0BB7095CE212682E4D6C4A03CC46E0A6EA1FA8C02D8239F95202741FF8098230
          232030F8CCDCDF6E162C4480D680C37D2FF4B4E9E8A9114B7E2A4044B28C8E5B
          3F6283E4F851791BA3E4AF43EFA03DFF4FF620B8D345E09D5174E81474F2ABEC
          28311FC7007EA245CE8904B66FDFEE1B1818A874381CEF90E5D1D064BA8A436E
          DEB826CC5DBB1F1D1A1574EA5AB4AA1E42AFE12BDD89A9D953715D7A03A77A4F
          C22F4C2095AC488D8E4151C22C9C68F80E35BAA7431E7545003A0A3EA109CAD0
          E4EAAB9BAF5EE30024AB12F6EEDDFB362599A3946414111111888F8F7729140A
          48A55261C3860DD0B5EAE02B11209787203C3C02915151D487233838188AF10A
          ACBBB60EE73AFF0D2182AF6ADE23AF7463A478E81C0B0C44D27833946392B124
          66C9FD15CB577C4F8E9EA02F54C2EEDDBBABF2F2F23229D9C04617081B653E97
          9F9F9F934C50ABD5C2D3A74F05224424E46092949C44023CC6C76CCBD52DD875
          E57358651479BE14A136BA284C72D0003DF7C2C7D58E05536662DBAF8A5DA525
          275DA7CB4E1FAAA8A83840041E0B3B77EE5415161626522262600A280745BA73
          B0A77117E509EE057F7F7F506C88EFB8F17B17EDAFAFAF2F347D1A7C55F1152E
          D55F4273974E1C8F968663424A027E39E52D34D91B10D7331E299DA9CEF233E5
          B5C78E1DFB03275461C78E1DAAA2A2A244F2F639F0E1CF414141A2F7BCB007D8
          634C8A7B76829B67CE139D16B7840B7868B98750732C94E65FA3B7AF0757AE5C
          19D8BF7FFFA7E245C404162E5C282AE0BD30ABE1AD04F74C9249F03383F2389B
          85920E9BC96402D513A259291BDAAD76180D263A394ED81D3658ED5671CBEEDC
          B963DCB367CF3E22F037814E806AC1820589ECA1F716B041AC019E27C224E8C4
          BC00E821C1C6E06C1C4FEC0CB7FEFE7E74767642AFD73379E3BE7DFB0ED1F021
          A1B8B8584DF93F9E3FA2932046381724C3C9788CC718D868340E023398A7E779
          9EF8F006E5C66B730037353579087CC1043474EDC6F1826D6D6D686D6D15A39B
          4F059B27E83C4A706B6969415757D7A0A7DEEFFAFAFAD0D1D12102B3230CCADB
          C6CFFC2D2BF8E8D123E3810307BE1015D8BA75AB66CD9A35719E40E28578B246
          A311C9B02A54848A643CEF6B6A6A44100F28D592E21C3606F080F2E9E0EFD87A
          7A7A909898288E373434180F1E3CF88CC0962D5B3494F9E23808D9530F083766
          ACD56A417781B8C8E8D1A391909080BABA3AD1585A362A5C9FF3D4438641D931
          5634242444FC8649353737B302CF6260F3E6CD9A8D1B37C60D169F4460782072
          CFFBAD52A9583E343636C260300C1E4D26CF5BC2C6A0FC3F03F165C597570025
          275EC3133BF45DDBD1A3474F8831B069D3A68AA4A4A429D9D9D9025FC12311F1
          1C51F6F0FCF9F3D0E974E282EDEDEDE2BE8B452581321803B32AEC3DABC8A064
          76DAD2CABB77EF3650109A296E1E7095269007AFA7A6A67E3871E2C4E9246F6E
          5656962F91118FDA488A3001DE16F6968D6F48066663EFF9F831393A192EF2B6
          B6BABAFAFEE3C78F0D34D64FD33564F5649CD59A391BD2858E31648A9898988C
          A953A74E4A4949999E9191312A27270754290FAAC24418A0ACAC4CDC0EF64EAC
          5E481526C7FFD356B94811DDC3870F2B2958BB7A7B7BCD5C128AF99B920F5907
          590FA72ABE663CF5006511B0CBA14C863C1A3F895A6666660E6F0F9192301931
          F9503B75EA14EAEBEB0703953D2689FB89D475BAE548E9560B29D7E10664602E
          20BAC13FE1688A57BEC4F082C4A308A532500581E4B8B8B8F4C99327678E1B37
          EE1D22143E6DDA345CBA74490C4602B7D129B9555959D948E03652888B802637
          284BDDC597209EFD0A72BEACF819A924E371FE7D46E527C2C8E228A826A4A5A5
          4D4A4F4FCF25EF7C28981ED4D6D69A48728EC016B20632351993E031139EAF0E
          F02A04BC9BC4AD0A15F418C5AA9025B809B6B841DBC97ADD123BFE1FE8AB12F0
          FED6D7AD4AB07BCCF8B27D7D95F63FB336B788EEEB47E10000000049454E44AE
          426082}
        Name = 'PngImage20'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322031363A34333A3036202B30313030DB0550ED0000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000008E94944415478DAA557797013D719FFED4AAB5BB26C1DD8D8D8E626D804
          434B0821944242DA045220039D6967F8A3A45020D4D070940099019292C9A453
          68928684721802044AC355A00CF7158E980473D8180824BE8D6549B60E4B5A49
          BBFDDEAE202604D27176E6A75DBDF7F6FB7EEF3BDF72F8816B5B319E6D113155
          D0A248AB8541A3852F914485C100935E0BB7CCA32E2961D78437B08796B71192
          3F24B3FDC53D6A72EF9FB1B2398462B3159CD1081001F03C20CBEAB34E470298
          0419B218C7E691F3B088FE3510E23F9AC0EEF9F8BD2F8C7FA66700B4632493AA
          52BD1E30E8D53B532E088046038851E0BF17B0FC8D8FB19A5EAF23243A4CA07C
          0A349F6970DB6241AEBF05B01A0DE89ADB0D3CAD8E88AD08869AC9CE31B8DD50
          C6985518999A6654FF66198AC92527484C4B87096C2AC693111167A33160E8C0
          A118F0D4F364820433B56A7FDAF2A50B3BF14DC345381DEA10231108415EB016
          6F5EBA858DB4F23641EA10814F6663A62F88F7F2B273317ADC54202AAA2B530E
          874472792DB6ED5802978B5CA351DF8B921BD6ECC79AEDA751427FBF24443A44
          60E34CBCD5DC8A053326CD80DEDE895691060A7F858044C1108F2BB62F3DB71D
          8DDE2B2057291668A31CD876029B371CC636127392D0DA21021B66622517C7AC
          49D3DE2265647A81224EAB538924C91A89981299F5D565387AE653B00C6181C9
          5CB1F908366D3D85FF9098C3045F87087C38056F3FEECA983F64C25C3505F426
          22415A3414F271B2732C4444880445DBC143AB9540F4851A41B502EFECC0DAB3
          D77080C41C21F83B4460F670A1CFDF26F6BBCA0D1EAF7A573090051801B2739C
          148B11F5CE48B06D073D58B77F1D2859A4575661B53F8C5DF4D66784508708E4
          E7C3F0D5AC818D9A2747A79177A9E2E8D5DDCBA91890C41489A84A22E8C7F973
          A7CBDF3F575DB9E938BE22115B091504B14304E8E223EB065C32E40F2B84C14A
          AB522590D93A493B96496E3C0516132D7558B9BF6CCF9F4AAA59EA9D811A804D
          5013B74304B83BEB067CE44EEF350519B9F42FA59C2D9725350D951810D512D9
          740B133FBCB4E1DF67BCE768D14142357E4C2564D799BF178E199266DB83BC27
          3845214B4146829516E606A69CDD1371446B2E87DD732E6D0946A4DD347B8A10
          F87F943F92005DE63B1FF53FE0CEE8F634EC59EACE59C03120D51C98855BAAF0
          CEE1EADDF3D7DFBE4E039FA47CFFDD66F450573C8A00BF687CF613AF8D70EC36
          67E5BB6171A924EE5642B6FB48035A6ADB42EB3C3F3FFE45ACAF69CB09BF0443
          5A4FEA543AE88436E834D7A0891D43DDF91D285D519F22266379602C16DA58AA
          C61F4A20F2971EF9F5F5F20A5E925ECCEE61D00856960D16A504438A29B2AACA
          057C6D781E33CE65E25AD088F4BCCE70E4B8A0D769C8531C02D124EA8209E6BA
          2092FE77B175EAFB78EDEC04CAE9D7B1D8358284D47E2F81C8DB8F3F1DF24677
          694D82839713B819CE43C3883FA24BE822B878183E2E1D37BC16F43EB415C7BA
          8EC7A7D559A80C7048E80C70643BD1B7A033BAB8AC64001E7A2D8F8A3B119CAA
          25D252DB35D8DD7D20687C98EF5840AA0E710F2AEF991FF27217AC59468746CB
          21DA1AC38D66273E1FBE0406DAB9483B939A1B90FBC13C6476E6612B1A0221E7
          31B4E95D38EE49C7A6AA2C9C0D5AD125CF811706748241A78559C723481E7BF7
          4A1C7D3A1951E98B7831376315A9DBF00081F8C2DEBBC226616C9A5B8F645C42
          229A40D3352F6E9A8B10D23B20781A60BE7C0AF62E76081601624882184B5279
          10A075E5C3563008C7228558D452248A56BB6EFA10172C7A0126728B918894B6
          685052D1EAC5ABF635A46ECD7D04628BBA177843DC6547570B0F8ECE5912A792
          882510F6B4211A88C1F8933110D29DCAF1400C04200643EA9D0E03317F00317A
          D6589D68E9FD6272B2343A18B2B9ED8B07A7C16CD0C042EE38EA013EBED2DC88
          79AE0D0F10689DD96D5958AF7DDD46BBE7948C939148C8901244828824E33274
          037F8D672233957AE0E6C27053B9777321B8A4109C5200B6E62AA453D0DB7F3A
          0AD3F9F1C1324357EBF2C16674366B945672804E8C1B550225A472ED7D049A26
          E79F94DDFA613A9356C97796F212FD48A2AC10488812CC3F9B8C025F31EC1633
          D2A9437B29B182046F280EB12D8AE1F22DFC55BB0F73E22FE024DF033A130526
          B9CA4AADC441F053FDAAAC2702735DEBEF233089DACDE2DFE634A5E75B32D8CE
          3956F994949715244979822C611DFE320AFDB3F05C9E19BFCC523A32EAC3492C
          3C1FC650E936FE21EC45EDC17DF00D7A091E5336CA04D7D59223A7AEC3D1DD00
          7B8E156959E9603D764901EB9825F708DC1C6F730465AB27B387995376CF66A4
          54E9A7069424E5497247DAC897D12F300BA3F22C1849B52944E361CAF737CFB7
          2233DC88F51947201DDB8EC89D263AC909B8C89B0F2E2D2DAD246937D4120AEA
          EBA0F6AA1CDFBF4DC38BA39C7D133A6DB9BB9B99225F86D6C093725981628584
          AC10B0FFE20FE81B9C8D5FE51931C89EA453B284363189502C8E55673D3085FC
          589E791545ADA568387E1AA565374E2C8D44F6920A56F9BC044D0AAC55FBBE25
          30CC5918A3C3AEB5B389F77C13465E7F9B128072122A89A44AC0317A1A0A02C5
          701BB4A8A40253DC8FFC4BE2C244242A26B0FFE21DD454F9F0942D8071D66AF4
          377AEB9E5BBA6825A9F817AB7CDFE90B72FB2014B6F4B7BDE2E0B96582A0B1E6
          14D8EE9D4193E4689982304E245C63A6A15FCB74F8DB64F4929B703D60C4B01C
          3DFA528189913B445A5BE309A2A2BC1EDEBA6668E25139D9EA2F47A47127CA97
          AD203D41B46BD5ED09B067477F13FFCC4B4EDDB842A3F6599B49EBD451FA184C
          5464F434ADE1D069DC741435FE0EAFA65FC6C4E417581D2CC2075599640119D9
          562D6C94EFE43CC4C82DDE5A0FFC55D483427515B8F9DE46C49A8E918E7242F8
          61DD90F9C64EE84A19D3AFD0C83FD64BCB67E592DE0C199D8C929CE6ECDEC75A
          3B768EA967D9CE60D9BE7D9EAC1123E2E661A370349C257CE9379BAFDC6AA59C
          A5408BB5890854D7A0E9F46DF83F0F932FAF905C46E016AB798F6AC76C8C321C
          69CC2204FA304026C149B0A5A2589722CBDA6BB49D49D9983625834F8DB393F1
          D704960935503F56E44711683FA74929BB9B3A426A8C4FCDA74E27F73EC1F876
          32EFCEC752260FE17B8E69FF03E001E27353B7F69C0000000049454E44AE4260
          82}
        Name = 'PngImage21'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F20323020466562
          20323030332031333A32363A3335202B303130301EE473E40000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          0000077F4944415478DAAD570B5054E715FEEE3ED8E5B12CCB2EEF15D8118898
          88916889643090A9213E1A6BDA26D2D8A833ED74469D38635AA7D3366D6D26D5
          31F1ED9844256A20861171345A4114A288BC5FEE222C6F960516447617792E77
          776FCF5DB6D6A49836C03F7CB3CCFDFFF39FEF9EF39DF3FF97C1F78CE12A044E
          0E62BB48A159E5B0B3326B4F77F5D50AEC7BF72334D1B48DC061968379DA84AD
          05EB844C42BA50BD4A090800A1184E7333BAEF9EEE58F7676CAC6B8096968DCE
          96C4B404C69BB049AA58770AF23811C60701769CDCB0444288E1F6726466EB4F
          6CDD8723B4B499C0CE2901729E22F149CE63450B3DCC4603F9E410A0F6031C7C
          C49D6047ACD0977E5313F72BECA5070504F39C11B0DE85C2CB375C6BF74F559B
          9A5A28F076D8ED2C82E7C9E1E3E70176741C62891083F7F2ADAAB5D843265F11
          8C734660B2064745E19BB7776A3BE0A4371EB3336D9BDED395EC7F3F26322549
          99647D60855FB037BACA6F4D68DEC021278774326BC32C74F098C0442B62C48E
          B87AF378B8D8DA6782C85BDA17FF7A6581C532D9969D1DA3FAF9B280AD03460B
          02C23DD1535B6D51FF149F93D90942CBDC1028C6A792D8B4DFB655B54022E6B8
          B4BF18328B8B1F76D1545E5F5FDC362FA37D03AF372F4F3BB4A51D0DF1BFC115
          9A3B352711307C05AFC06875AF47D012796B5D1B2C7661F58BEB7555347575D9
          0BA82ACD8DAF6D2FEA0E8E8EF3C650BF15E72E5AAE6D3D88129ACF2474CD9A40
          EB79AC0D8F5B7AC5C978C3A0EFC1AE630F322EDF78544F53178786129609DACC
          E7462794080AB1A2B34C8F5F7F8433053528A5F9CB84FE993A7F4C409F89FDCF
          AC7879271C1368D6F63B97BF6348370F71B9892FCAEFDECE89BC25B28963A17E
          1D103F8F21E30D34E51EEDBF588693474EE32475885EDAC23E2B02ED1704799A
          1F25A45291A3ABCD3CBC604DCFD971165F8E8CAC5C6FB953B7CB573400DF402F
          40F53210BA8A2C42D0557114BAB2A2BBF7B4F8DB9FD25DD1202ED4286642A0E3
          B2B4367251F4F3B03B60F70C994C5C53F9E989B3CB9DB1C28E1D4DD5EDCCFC28
          3A17AC7628A9298B156A20F855C0EF15B0B641345DDA3DD9DE60FE3CFD3AF67F
          5DEEEA09933F44133C01A63DC7A34E13A78E83076D2E8BA54763607BCAD158D1
          0C8D861E854AD052E784878885829AA28CC0285EA068AC06A44BD1AFFF1AF557
          D28DDD7DD8B3F900B26883E1FF372DAE08D465207FF1929095BC630845181B78
          84F65616414140C07C297ABBE5282BE96F51F92250E50FB91F11F097936F3F19
          104869094EA55D5468BAF631D75A56FD4D710B76EFCD42953B2DDCFF24507818
          7F8F8AF47C5F2C7662628CC5F02327D4140C45942F1E747BA3ACC8D4BCF14354
          C8BC3070683B922282B1D45F41F344424E102922DC6949C1A8C5809A2F3E9868
          6D19FBEC6C110EDED6C184A9038B7B2A818FB7E199D5CB99526F4F4E2195D24B
          85D1F1AB90A143EBC49DA2E1CA6DC7D038320E3D2D2DF19640F8D7779096B810
          9B7C6410F3D190FB10481F8C6A19104669112F415B59162A2F64759AACF86067
          3A72C87684E09896000DC9F1F7F0C64BB1F83030041AD62980C9E0341CC846C9
          F9228C701CEED39A3BF84FDB0D7B7305566F78053B8294C288F855A918D05E03
          1F156F25A525208522C2578B37CA33F6704D158DD78B5BB1FB641EEED1C38927
          A3C13CF12B1789101F158AC4511B94C67EFE16828704DE397FF9E879C2584C08
          F8F2F73894BC66D12F42172F0247A77577CD7578B083F00FA005FE9154ADAF01
          BE291834EA70EB937F8C76F53A8F1FBB8123EDBDAEE6C53E49801F021765DA98
          E0E77E6675E3D17755AD3D8C050F6DD0A56C7C490496B61178922AE5B074522B
          6FAD7595ACAF5200C69FD2A25E4342598CFB374F23EFECA59BBFCBC4564CB570
          DB7437229E88D0FD3F9FB3699BCBEDBDC88C89F77F3B58E34F2B446425219080
          3C65B0DB3818AA4A20118C4349AFE349B5CB45A472E539A5B85DD0A5FB43260E
          D216B984FEA7DE09BF6FD41F47ECC028B4C93F91886023C70C41287193207878
          B9A261BADF8CE107460407027D7D70EA74106414E2C2E54AD741964DE89E1181
          C23D38B7E039A48584FD5B411430CEE3DB247C7CD05866728E9A2D022F199C4D
          748F360F62F8DD53C8199BC44DB2CA270CFE6002F59F20B0DF82AE9495903829
          393575189FAF819484C7707CC21811FD4948A952E7A5F3830CCB82090D0567E8
          044EDF4456413D3A68558E5BDCB6994440706607B684CFC3D16717429A7F8324
          E000939C4CB54911A1928588A4A0ABA5903780C9AF456EC27CC414D6A1EA42B9
          ABAA0A3155D274DD06371302BC8D62F38FF1D68A85D832360161CF438C44A890
          F4F62FC10804AE8C70FFBC4AF70C131AFF780635C489FF90E1DB723BA192D007
          7755CD480398AA122A343C4B78EEC0166C484A406274B4EBD3017A3D38CA39B3
          EF2232B40697735EF10398FA90F95649CF94802B15042F4D20943BD7E1D8CA64
          AC55A9A86E1DE00A28C87432D6EFCA74A99DBF3B16BB1DFFD779301B028FF750
          79226CCB7A1CFE5932D6F31D514FDF4BFB2F21A3DE88064C098E179E635AE339
          20C00F0915A1266D3576854810D566425F7699AB75E7114ADD6F3F3DFB3922E0
          224198475882297DF042ABC0D4A5D5F134A3B924C00FFE9092B9C9D830CD19F2
          DDF12F0E43ED3F282A477C0000000049454E44AE426082}
        Name = 'PngImage22'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F20323020466562
          20323030332031333A32363A3335202B303130301EE473E40000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000008344944415478DAAD570B5054E715FEEE3ED86517589697BC44B60A8A89
          A824D6A88341A7D6A2564B4C5B49AC8F4E9366147526699C4EA7366D675233A6
          2A8A55C737054D4704B59A6050681479284F179437B82CB820AF451EBBCB5DEE
          EDB99735C1B06446E51F3E66E79EFFFFCF77CFF9CEF9FFCBE007465F31FC86BA
          9020D3EA6287EDACBBB9B5A5E4EA5DECD9FE396AC86C23F078C9C18C67B0D561
          8D94997F521A1CEB0D4800A91C5C772D5AF24E37ADF933D6973F809EA60DBC2C
          09A7042C35D8A8D4AE39014DA40C962E80B5901B964848D1D77807A969D5C7B6
          ECC1419A5A4B60279400395FA2708BB9C6CA66BA741B0DE493876FB027302C44
          9C03DB6F4675C1FF4A237F83CFE84136A17BC20898F3A0557984E8ED5ECB834D
          357514783BEC7616FE933570F374013B60815C2145D7BD2CB3CF2AECA6255F10
          8C134660A81449B2904D090FF54DE0E88D07ED4CC3C68F2AF2F7EE0A0F5D12ED
          1D6D7E6C86A7BF1ACD77BEB1EADE4222C7E3242D6B80731D384B2F3FEE246B3D
          C2E5C39195DD9610B9B9CD04995AD916B5BA28BBA767A8212D2DDCE7ED79BE5B
          3A8C3DF00D71456B59494FF02F708A961D23D48DD938C909A16D08A5FFED822B
          E7046EE3A82222FEF70DC57550C8793EFE2F86D4DBB73B9BC974ADAD2D72ABCA
          685F27E84DE56A87BEA0E941D47BB842B6134E23400432121230C0599175FF3E
          526E160804FE40960B04C31802862FA0F20B0B7EE43269AEA6BEBC013D7669C9
          1B7115C564BA3AEF35141764469535DE6AF10F8B54A3B7DD8C73193D5F6DD98F
          7CB2A7129A9D1138F5C16FD16FB1E0665D2DD2F34B040207C8728450338640FD
          79AC0A897CFD0AC7A861A86EC5CE438F532E5F7F5249A68CDEDEF9F3240DDDE7
          06ACDE981460C6C3C26AFCEE739CC92E05BD162E3BC2FA6CCE93C01D7F7F13FA
          AD56E45455E14AD13D814012590E7F8F002F2EAA4EC5DEE98BDFFC10C356D4EA
          DBB9051B0C27BB7BF9CC856F68F26EA6877E23B3C92310BC1A90CF41AFF13A6A
          3293DA330A71FCE0691CA70EF188B61ED30B1237AC837568085526139285148C
          A3099140E305C935DD8FE72FA72247734377DF8C95ADC9161667FBFB97C5F5E4
          96EFF49075C0C34F05F8BC0904C6D28A0034DF4D4245E1ADBCB0E88B79D3F3E2
          765E4CD8862E5A6F1F1E86C566838565C5DF3286810B3530C1918C506A3422F9
          F6DD6F35211268BAAC2C0B9D15368756C0EE1A30B47065D1D163C90BB80869D3
          8E9A924666EA343A17CC76785353966B8301FF9F029E4BC1DABAD051F1D01E54
          B85F96BAF53D74F6F581E3380CD9ED1822E71C41744C24789E878B4482F2D656
          9C2BF84E13829D694C7729D7450647C28536778FA04783605BEFA0EA6E2D743A
          7A14A8405D390717190B2D35457702A37D8DA2B10250AE0573680EB6FD6C299E
          90E85822A092CBF1231F1FB044A49D48D5B6B58951901381D6DE5E1437189F6A
          E25F6204CA5390357B6EC032C131A4320C763C41633D8B499300DFA94A3C6AD1
          A030BFBDCEC7037E3E5ED07812012F0DF9F67407427783F977C29814EF8D5F0B
          0B6920B7BE1E5FDFAB72A6816F23809C03F8FBB450D75D723907EB208BBE271C
          822918DA691E78DCA246E12D53EDFA4F71D75D858EC404444FF1C7EB5E5AB213
          096DF8FB90A828371E3301D574D806BBA03C158B7D446090B450F0B0095F96DE
          171CFE775423E230D2C24734F0CFAD98BE620153A076E5B54A25E01744C7AFD6
          1D4D7A0EB9B7FA8AB61E4255BF05D534355FAD80F4930D885F38131BDDDC2117
          A2A171231007C6671E3079179823AB71F09DB7612521E63735E152B15E207062
          5423E21D44DA9FD6AEE2F047786B51043EF50B808EE524301938C3BE34E49FBF
          857ED20FBD027247B5DDA05F2DC68A754BB16392B7744A54EC7274E8BF821015
          75D87630170F62E3A279A218EB3A3BC59C7F62DA91FAB77F1C10C25E41187AA6
          0F389A88462643D4B4402C1CB0C1DBD82EDC42D049109C0B978F56076B81809C
          E07BF66324C6AC9CF5CBC0D9B3C0D369DD52FA3534816BA1C93D3626E5C5411F
          D832528E9E48CE45626BA71805F6D9EE255E7BA0163626783A9E991D7842B08F
          DE507F00333A6DA858B27E910C2C6D237125556A3038301B838F8D50535A946A
          068C9AFA8D7616D98371FFC65F9179E6D28D8FCF628BA385DB9C1D990211A9E3
          F7B0433063C6CDCF901A1EE5F5AEBFCE8B66508B91280824205777D86D3C0CC5
          F950482CF0A6D771A5DAE5A72CE7EFA417E0667673C51F53B19FB6C81CAD81E7
          1A958711D131007DCCCF1532D8C83143902A1C24082E2A311AA6FBB5E8A368F8
          FB01D40AB88A0A48527270E172917890A5115A5E8840CE6E9C9BF12AE203829E
          2A8802C6BB3C4BC2CD0D5585266EA0BB47A27207574347507717FAB69F40FAE0
          106ED0AA2C42D77313A83C02BFF61E342F590605353D9496C3325507A5972F18
          5E481823A33F052955C95D3ADFC55025328181E00D0F81D337F09FEC4A34D1AC
          748C88DBF62211909CD981CD219391F4CA4C28B3AE9304A8E5C7C4506D5244A8
          64212329549451C81F80C92A43E6FCA908CF2947F1853B6255E560A4A4E9BAFD
          5D193ECF10D66837FD04BF5E3C139B07AD905259F54FF141F4BBEF80A1762F64
          84FFF22ADD334CA8FAD31994F22377003AB9D1482822B4C151552FA4018C5409
          F53EBC427875DF66AC8B9E8F856161E2A703AAABC153CE993D1948D11B44E782
          E23B30F221F34C49BF280131150495CE0FDE1FAEC1A1653158450720E804E6B3
          29C82D6DA8DC992AAA5DB83BDE76381EFF56FC1283F17145D0E6381C581B8338
          A12356D3F7D2DE4B48A934E201460427086F78BC7C4EC4505011EAE257606780
          02D31A4C684B2B145BF7354281E3ED9DB39F20022209C264C25C8CE843101ADD
          BDC4237878BC4513494018C221E5EE2063839333E4FBE3FF228E5D114B96416E
          0000000049454E44AE426082}
        Name = 'PngImage24'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322031363A34333A3036202B30313030DB0550ED0000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          0000074A4944415478DAA5576B7054E5197ECEEED94B3657B2C902A2C992A2BD
          1844FCE19D716CED8F8EED541CFD5167F8D3294E4769C4A9529476C6412DA576
          2CBD4CAB5432404165A218684BD18A37105041080AC85509900D49F692BDB0E7
          FA9D3EDF3907B42110BA9CC99BEF5CBEEF7D9EEFBD7DEF2AB8C86B4D07EEC819
          B83FA4E25A554534A82263D9D8178D22165191700238690B74DFF324D673FA69
          8A7D317A958B99F4CF5F60C950111DD5B550AAAA0012402000388E771F0E5391
          D4E4C0314CACFEF6A358C0A714C5BC6402EBE6E1279912FE36AE11E08E61DB1E
          6824024423DE28C143212018040C0DF8F70EFCFAC9BF6329979FA4581513D83B
          1BC1F783385A5383966C0EA8AD8A62724B1B025C55368651280ED1CE3A1209B8
          EFA4552499E343E8FDD14274D025EF524DAE6202AB3A7063D9C0364D076EB9EE
          164CBFF97B3481254DEDD99F5BEED9F11ABE48ED4253DC7B2549E48B70E62FC3
          533D47B092338F524445045E9A8B399902FED43AA90577DE753FA019DE0ADFE1
          10D41B50B166ED13686EA66B82DE3A8D6E7861035EE8DA82E57CFC9852AE88C0
          CA395834348CF90FCC7A009186F19C4D0486BF4B4030184CD3B5FD47DBBBD09F
          FE0474956B81D3CC8135EF62F58A37B1866ADEA30C574460C51C2C514C3C34EB
          A78B0846D38718716AD82362D31A96EE46665FEF6EBCB5F555C80C9181295DB1
          7A1356BDBC19FFA09A3729998A083C371B8BAF696E9C77D33D8F782910899104
          51820C799376D68B2442128CB637FEB3D40DC44CB11FAC1578662D966DDB8F8D
          54B38992AD88C0DCDB42DF78F6DEA99F2A37CCF4BC1B8AD2029200ED6C12D828
          7BA32421B75D1844E7864E3059C4837FC5D26C09DD5CF53EA55811816412D1C3
          0F5DD71FBCF1CE7A7A971527E2EDDEF16340183E09CD2351C8E283ED5BF6FE79
          7BEF67ABDEC161AA7899B28F6254448057A0DC39BD279A9CD18E682D67FB2550
          DADAE68E1DEA357D9131913B89251B76AF7F7879AF4CBDADF00270005EE25644
          4039D539FDF9C4B8AB66A3B1854F3EB85CE6082F0DDD1830BC12397004F73ED7
          B3E295ADE9ED9CF406A517975209E5B5F50FEDDFBFA9BE6E3D5AAF575C409982
          92842C2DD20D125C8E9609EDF89E52E2E73D2F16CA621DBF6EA6E4C7D27F3187
          51F5A9E7A76D4C34B6DD8A8689DECE65C049817F38480BE78E61D1EB47BB1F5F
          D97B802F5EF27D7FE987918C830533275DFFD8EDF175D5139309D4347B24CE54
          42B9FB720AD9C3A9C2CD0B0F767DA6DBD2FCFF82771A3A63291F9340F9E929C9
          BE3EE7F701217E30694A3418AA95D950E3966008DDDDE4E73B75EC7BFD841B19
          A561736F9F6E3E3B3727D6C24B3FBB6202E5C5D7DC5A4C6BDD6A2C140F38160E
          955A91BAFD67B8A2B80B8A594246198783E91A34FF662EDA6E6876BD51CC9818
          3C54745239B3EB77BAFDD831EF48D6FF6F02E5C557268B696547EDC4AA785055
          A00DEB3838D4840F6F7B0251EEDCE052319442CB5F1EC584CB0208C6C230CB16
          2CC3816509A40E14B13FA56DFA2DD051028E9C8FC47909988F7FBDBB140BFDB0
          3E11816D0A589A8581FD691CAABE16C5481CA1C114AAF76C46C3150D08D58460
          14050CDD6661142E098775E2F827C3D853B4963F03F030C1E71825284725A02F
          F8DAD5E9A2B2273EB9260085CA84E291D02D94064F43CBEB2CFF0AAB7298609C
          7FDA22B820B8CD391C35CE356D66A883DE9EBCB914CEC31F013226FA4706E6A8
          0486E7B42D2C45D45FD571F78A9B71D2AC0E8425150B9271D87A71C7B48AA509
          77D767C1CFDCF3BDCD35D9531A3E3DA56F7C1AE01F7662446F302A81811F27DF
          73129119E198EAE6BB4C79C17F42FA575AC2F04582195F025BBE0BCEDE1BC2B5
          5CDFC192361F7884BDD96B18919EE71098C5E3E697F75D3E302E59D32877AEC8
          CAE7A6BCE38A2D816909DB05FF928875E6F97F4808D76AE913652CD3C41FB700
          9D1851A0CE217068665DBCE0D40E4E9852ADB8BB9733845FFA1958B6E5995610
          CCFC8A35BCE03BD72A82EECAA775BC93B7BA88BE0C238EE77308ECFA6ED3B7AC
          B0BA37D1564D3F3A50A301823BAEB856B01C97806D7AE6B50870D625144170AD
          6CBBF35C4B708E9EB7B03F6BBEFD14DC1E710365E8FC046634B5EB6C766B2F8B
          0506BF28A1755A9D1B808E0D8F84ED11F002D223E282FBA374DB816D59B44EAD
          635DF02C51CA99E82F583BE7B1CB23C4AB94BE0B0561E8C569750FC603CAC250
          28587BF9D575677B509BAD9743209324E468711472E481EB825BC20DD8A33B73
          684EC6901FD4E5EE9D01E1EC6677FAF16E6007F5AF1F8B807C179F160B7CE7EE
          A6F05DED55EA1D7531B5295C1D443416821AE1E7A017981250E6BFC13A50CEDB
          28E50D6805DE674DD9AA1CFB00E86143983EE9A59E2C441F52C803850BA6212F
          D903365026B3019BDA5E15F8E6556A60628B82F18D0EC65709A73E68A1CA366D
          85F81A23AAC0BE3B43A0217620C3ACBB7AC68B74E96B1E076E7B76C27F2EE12B
          3F542E7418C96FECC1512F2D42E10F034CA03451EA28EC4EA1FA7365D7A3FBCA
          733E906CC5D2F09A9282FF5D8C0632D6A5F81609FBA0111927FEBB803F47F822
          89183E183B55D70A0E2ED017FC172B4E195D282FAD640000000049454E44AE42
          6082}
        Name = 'PngImage24'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000009F74944415478DAAD570B7054D519FEEEBE926C1E9B876193AC090443
          2028845734A680104143251968403496165064EAD4716A85D6B628325367AC23
          5647C729AD8AA00353402260A43C2208142C10844082310F92CDFBB1BBD9EC7B
          F7EEF63B3737181FAD76EACD7C397777CFFDFFEFFCEF2B4522117CD7555050A0
          7DFCF1C737A5A6A63ED9DFDF0F9BCD86C1C14165B5DBED181818B8D6D3D3F353
          6EED271CE7CE9D0B7EA750F592BE2701FDAA55AB5E9B3F7FFEA346A311DDDDDD
          E8EDED455F5F1F3A3B3B71E2C4093B096DE6D68F885612F0FDD004A24A4B4BDF
          58B264C9EAA4A42474757529CA47081C3A74C8E7F57AB771EB3BC46512F0FCE0
          048A8B8B5F4D4F4F7F341008C0E170C0E572C1ED76636868081D1D1D7E7EFF1E
          B7BE495C22BC5F974152E1FF8B009567474545ADA11BD6DF73CF3DB872E50AF6
          ECD9836BD7AEB92449FA9CDB8E103B8996B973E7E6D1554F92D8A6DADADA017E
          E722022421FF4F04A858C3454B8119DCF7A056AB5D6CB1587E141D1D0D9FCFA7
          042115F8351A4D4D381CDEDEDEDEFE697E7EBE262D2D6D3FD70CBAA69BD67AAA
          ADADED9F94D347F84822F49D04A858128A67CF9E9D999C9CBCD16C36AFC8CCCC
          347245424202743A1D82C1A0627E1107542CE0696D6D3DC9DF732A2A2A6E898D
          8DC5E1C38771FAF469AFDFEFDFCCC0DD4B99DD8467B425BE414055AE5FBC78F1
          4A0A79A9A8A8C8347DFA746834129A9A1AD1F0798312037C14F1B131481D6346
          72720A3C5E2F2ED7D60A9760E1C2858A75989EB05AADC25D6E66CD4A3E749EE8
          1A6D85AF1018515E5E5EBE9927DEC0C897C489ABAA3EC4F58E3EA467E761DC84
          DB1093100B3F45D81C0174599BE0EC6CC04D515E582C9918B0D9515D5D8DF8F8
          78306670F1E2453FB3E60B5A61BF1AA46DFF8D809EA9F69B0913266C5EBE7CB9
          244EF0EECEDD58507A3F6ECE488181112193625DCD392503720BE6A1E15A03C2
          A9B970D87D705E3B829B13B4084B1A1C397244A468986E71D05DE2E43B889344
          C7B71210D58EA62BCEC9C9A97AA8A242D7DFDF87CAAA6AFCECE19FC3A865725F
          BA0C4BD67818E3E370F8C07ED806FA51BC7C0D2EFCEB1C92730AE0A70CC71010
          ECACC1989095168AD07255A1FAFAFA0E06EC76FE5C45341083DF880161FA5B6F
          BDD59897977781279F681E938AADEFECC29A756BE1ECE944BA2503E4A098DD47
          B8F8CFCD62EB93757053944CCB546DFF1B06BD0114DEFF18B4ED353079DBD0DE
          D58DCACA4A6F7373F3B3269349A46913E11E5D134608684B4A4AD6CC9831632B
          830F6FBEBD0D0BCBD7C29204585B5A312E7B2C447004A8CC4B026E1ED743021E
          DE8775C0A923477170C7AB285FFF064C691638F87B664F3564AF03C7AA3F06AD
          F0314BF573147105C3BDE21B1688E2C98F97959515EA741A7C72B91D3F595C0C
          063E341128CA85A342E4ED0B0E2BF78993D32C674F9EC1960D2BB17AD3768CCD
          2F42E3992A98B26E43545C02CCDDC7D0DC6AC5810307EC4EA7F3F714F10FA29D
          04023708CC9A354BBAE38E3B32A64D9BD6B274E952FD41FA377FD16AE8ED8D88
          8E4F8429E926656398CA8344888A45AB13663F7FB606CFAC2BC392B5CF60E6BD
          0F406B4CC090278C98680DBE603CCCF61C432F1BD7EE3D7B02CC846DB22CBF25
          AC4002EED10434F3E6CD2BE3BAAF78FE3CECDCF71116AD580593615859984797
          C3C31056D045B1D63677A19935E1C50DAB91577017CAD66D86C96C81873DF0C5
          AB45D0450F20C207591D11E68343D7FD483F38EE34FBC5F314F129611F890341
          407BF7DD773F515858F8D2AC9933F05ED5192C59BE02BA90171A7D0C82E2C4F2
          B01BF811AF3DBF0927AAF6288528CA1887557FF80B2C3953159708D76CB95284
          67963D0057C8C698F1A2D3DE861D3B4F21ED60563D09FC890F1E558B913C4240
          4F0B3CCD8AF7DCB4A953B0EBE8252C5A5C0A776F33523227C1C5801299CAD456
          D6658516B45A3B586C8EE157BF7E0A1BB79D8164606F080C67C8CB7545D8B86C
          197A7C5F306B3CE8B63113DEBF0AF381AC66D68357A8F3430CCF0CA11B0458F3
          D7D3027F9C9E3F15FB4ED5B1F09423912EE8A5A7FC3C95084671510FD695E4A3
          E28115B0B65971B9A1058F3CBF1BBA987825454586BC567727362E2F47B7EF73
          04821EF4D8FBF0FEEEAB48AFCA6A0D85425B5502D745568B50520830082BD8BD
          B615DD5988EAB3B5C82EAE80A7B516D16993A1D76B954C002DA0213A5B9BB0FD
          C5F524138BC2D287B12FEAB7F4B786FE8E2881EAF4B7E185879E40A7A75EB180
          CD69C7F6CA3348BA600EB8135D83A198802BA49183E34FE59689585062801930
          99E5B766C18205BAABB59C2766AE46F767D5C89A329B040C90A42F5351D20E07
          A7DBE5861465C42B8D13F1F48F7F09391262C086E9A630EBC320FA7C2D088602
          B4A01771FA2418A4380418579E801B6FED3F8A8C9D133688EAA864016F92E986
          4F48202F36260A971C2624E51628D54F52354B4444BD97D5CC1075E1F5E60978
          A2A402CE60AF424296434C573F42A120833740A53E7E17266405C160087B0F5F
          46D6EE496282FAAB520778133B75EAD4A7A74C99F23B1625B07462286F253CD6
          5AF806DA612958448D4C497C4940D48400F14EDB2D78ECDE65180C74D3052192
          2289B04C2B0902FE1B8A05099196814008EF93C0D8BD790729EDF51B95907DE0
          16BD5E7FFCBEFBEE4B4D888B45B33D02C7F8121886DD8FB0DFA744A1F033FBCC
          7055242A3BC6A362CE5DF47D1F842CF1A7D5498A2584427162AF37A8DC0B2221
          FAEFC3E3F5C8AE9CFC1502C2DA8913274E5CCD39E0853973E66822F45F672405
          AD2973A00FFAE13EBF0389731F41D0E3A5AF6518580362BC3DD8DA5CA2D48480
          3F006F584F5775E2174BE6C1E9B351A90CE7900FBB3EB800ED900189ED49E4CE
          2891C272DAF58CBD8A0B46BA213FB0C6C142125BB2B3B34B6FBFFD761E23089F
          2E0157E38A60D31811CFC613E3686140D11FE61CF8BA9B608B98D022DD84B458
          60EDCD3D58F94111D6AC2846D75093726A4160DFBB57917376523DE55B0931A4
          0E12CD4A108E9E07B8C47174CA665ABE4E4BDC396BD64C49CFF92F860DCA63CA
          46BB613CACC144F40725A51F24EA81DC44608AA107FA8E1AD4725C7BD9BD056B
          1E9C8B5E579BE212A7D38BE32FF50653DBC61CE3231F88A959256057D2F0EB13
          91904B8CCBC8C878962F21F37373738DD9D9E3100E8560D06A101F6784C16080
          8E45C1C77784FE01BE9E0DB9E97909757575D815FF2E1E7B64016CEE1EA536B8
          D8BB4FFEB92F30A6CDFC77CA1583492DE1C4704CCBDF36138AB83311991C2296
          72145F9592926226211DD71B53B130AF18CDC5D8C6F91F8D8D8D417E966D59FD
          5ACF6C9B5E66B0290D892963AC49F6A4B5A6BFAD8E65B5A3DF9CFEE3544CC413
          66621287CB7B49640EF7A651712C572D2185872FD1DB5DFCDCA58EDD1D6A3C89
          E7B5EA4985C93F230EA87DC0FF7DDE0B74AAA04495C8582287C810858B8856B7
          7B557F76A8FE1533BBAC3EAF530BA83871BF0AFBE8B7E7EFF366A453DD12A7BA
          26818851BF1757482521FCCA31043E9580227FD41E79641D3D13FE1B505D70DC
          262F9F730000000049454E44AE426082}
        Name = 'PngImage25'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322031363A34333A3036202B30313030DB0550ED0000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          000009314944415478DAC557695055E7197ECEDD582E8BEC8B5C5001AF884294
          282E89714D6B1A1B5299FC6862A7EDA8758CE292B834B145AD3599699AAA693B
          49742A6E31A906415CB0A288525C8A80802C62B8EC97F572E1EEEBE9FBDD738C
          128D93CEB4CD37F3700EE77CF77B9F777F0F87EF7971FFE11EFEFF42E0E60718
          3768C22AB70BA96E1E528B0B6D434694E4E4E26C6907F4B4C5F93F2350B40B73
          F4269CF1F383BF5406B84894CD26C062434B7317B6EEF83BCED35623C1FDC84F
          FD091309C18421423DC140703DCD7223085CDD8DCD7D06EC0E09855446C29DCE
          91B01209AB15B6C20AAC3D7A05A7E8273A829AF07BC24B2A95CA4BA150606868
          08FDFDFD8CC4194225E10B428F6839FE8904AEFC1631FD3668A2632073BB0581
          2EE2CEEE1D8E87FFDBEDA4DE101A567E8235E281A733323202E6CD9B477B9CD0
          E974181818406767271A1A1AD0DBDBCB08B5D2BE1584EB04D3A324BE2690BF0D
          3FE3391C0A0E1684B2F540739E17843F206236837FE728B675EAB074F1E2C553
          D56A35A45229ED71C16432C1603078ACF0808C56AB65CF6BE9C855842A91C448
          022736639BC21BBF0B0C14FCDDDAEA31372412090914189175C149E919879E0D
          8771CCE9926E78EDB5A59C8CFCC5C0969D4C346C30E2DCB9F318376E0CEC7418
          B983CEB2B2D7DB094708AD626C3C24F0D94664CB15D84E0AC0415ACE9EF90A92
          D25F02E821281D1CFD5AE8FBBB28120731D85EDBA0DE587B967EB6326D5ABA7F
          6848B0E78CE161035ADA3AA1EDD060614A388AAA7BA1F051C26E350B66040E12
          7208FF2258461038B40EEBC8F47B5C64661D25DAA6CDEF01322F525B493F26B2
          36626627584DE8ABBBA00D5F557D70C39CA831C7AAFA7EDA3B2C64E584583FBC
          981683AD999310151B822F73EFE2FDBCBB28D70C7E2D869047281633E521813F
          2F478642865373D3E6A17B488FE7E72DA5B7328104CF22D126102022BDF597BB
          225657E768DE9B3561CCB4F89F202250882B07EDB390060682D52518995CB3F3
          6FE5C8CEAF6526D84F60962B798CC0CE65480C57A2F1570B5FE5109128385B4A
          E667C580ED72120107A58045879ACAB29A94AD75A79BB7CF528F4D1A9D8960B2
          12C70B02DD22119B5BB892717AC80291D917583AFE93705C4CCD912EA025DFF7
          BAF2E7ABE74FFA8B5435550E9942202021221C3B88E026CDFA5BB0B7A0E2F4FA
          23ED37CA374D0B4D538FDE88A800C1C74C4717FD718A24EC6EE1BEC782E70F94
          1D2E6D1E609970520C42F73709B0FBA01BDB27FE213D3EEA97821524044ECC5A
          B727175DED95CEF1BFA939DCDC6DBD766459AAF98DD4C8CF111FCE797297172D
          C0843A05EDE170C1707F6828ECC34B276C2E372B5EA52C5EBFAD144B27C748E3
          F2568D3E384E153107C1E3C987DEC2C10EF2BFAE817CD97A6A67DE600B3DF932
          C21F4DF7B3165CF54B0851C35B261410B768850744FAADD85D7C3FEFDD8BF575
          2CD9088D78A4978C2470D01889762E1B52AF37B6F8EFF77BDFEF0009777A0209
          BC177ED1BD82CFB99F5C85EBBBF371378F1DD67E7E657AE60F62030F7131A324
          E0456BB94422063B5A357ACDC44F4B4BCC0ED7657A5248E87F6225C401F32CF4
          3973978C75473CA75222BF5386152A2D669DDB89965D1F832BABC6AFEB13E025
          B3A0ACC9EE447BD59F90B3780FB34DF9DBAF1C48F335FC1821140B5E1433763A
          5F6F81D1C8F18B0A9A3EBB51DFF415EDCB2534106C8FF7821C6B22FAF95B8BC2
          4DA3625D5DF0098EC1B8C8209CBE548C536F4EC16072108C55466C3C6B4751BB
          0B71760DB488E603BF3AFBF1A6E49EC992C0C8D9F1762D978136404BB27C47A1
          356A2A8E1BFD303838C81B0775B7AAEFDCC92EA545D2CC8F5B608FE3CA0F232D
          2FCC889431E2E81CB2E3E5A440ECB9D48492251658925371EB1FE5D8AF55C3E6
          2212F7CC58106BC10B5DC71113AB42EA9434E49F2DC4A217E7E059D53B28BEBB
          11750D5A28287B3ADADBA87473542587F555555559D7AE5D637540FF300B3E34
          CF524A5CA5AB26F09C4C2AD4F3965E13162485A2A8C5814CDD094C5FFB3ACE6D
          F80057A7AF81A697CA6D7313DE0A2AC194679E416B7BA7A7FE1B0C26AC5EB30C
          9C750FBA74EB517CF934F51093A711C5C5C541AFD7537F691D282C2C5CDED6D6
          76452C4414353BB57BA7C578653D1B21A54096C14F21455D63337CFD43313E31
          0CB59F7C84EDC7B2703025031D3B725170AD012BC26E637A188F7875121A1B1B
          91909080E2E2526465CD86AFED8F3877733DBABB1A3D0DAAA2A2C2F3DE2636A5
          7BF7EE5DCCCDCD7D9784B39A60E1B0A3F3C6CB89DEE9614A097C641228A8AD2A
          1572346ADA60E2FD61EA68C7BEEDD3B06FE17A9C99FF16A6C70073DB0F60EACC
          39D48265A8AEAE466A6A2ACAAE57216BA5023EB64FF1D1C937111D350A77AAAA
          E0E3E3033F1AAF2C168B675ED06834AEFCFCFC2D7D7D7D6C48E9E490ADEDCE4C
          96457893F0210B8FE8000564520E32EAB97A930D276B1DD8BB6B34B2333F47D2
          924550E92B3093AF416CBC5A6CD566D4D4D4202A3A114BE71762140AB0376F0B
          86866D502A7DE0EBEBEBD19E8111E8E9E9415959D9D1DBB76FFF95CD0644A0A3
          2D3154AA4A8994A3A5CF81D4186FAAAA9C273C5984BA6472DC2EAE843D6A2CC6
          C606205E730A33431D500606412E977B489036E8E81AC4ABE98518EF5F82B587
          DFC6447504683EF3C407D39E0D2BECDE68348282F1E6C58B17F7D1F11738CC58
          3E19E3176F46D4A41F4964F2A0A4086F84F84AE0E725815C46159668B4F59A3D
          55D9CACB319F82F2B9F840986D0E04050509A94451AEA3315A3A7C14613E1D68
          B2AD833FB99469EDA0318A5D290B3C84D97D6D6D6D47414101AB215F30257D08
          8950F8A721616E3246A74523481D0665540835236F4F55E3A9AE5A6956D6770D
          6646D5FB4D8D0F9949A59E63A3185B3C35229E88F6F6F4119101A854B1D438AD
          1EE10CCCF41D1D1D1E77747777B379B1B2A8A888CD058739B11650DB23F70121
          8468423884F1DA8F7549B166B0E26167A0A08B484949991E1A1A3A830EF56581
          C6A661360B060404782CC284B2318CC5087B4EF3214FD73A5A95948E66225D4E
          679DF96637A43A0A6F118C142B0C9247F6B8C402C2AC369606D109D1D1D17121
          2121E48DA000A5521948CFBCE8702969EE2202561A4E8729FD0C341D3BACC260
          A885F0CD7097F592A77D9A3DED9D442411205A2E54B41E1B8D7C45F212912CAB
          FDEC236680D02B3623BDF8CCF95DBE0D9FB61E588DB9C94BBCCA1FB11A2F9270
          88446CE2FD13BAE17F677DDB79DFEDD3ECFB58FF065FF261D63CD463A3000000
          0049454E44AE426082}
        Name = 'PngImage26'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000A404944415478DAAD570970D4D51DFEF6BEB2D9DCD7260434A0112121
          261252448842C30CC94029A0A9B61C22D629635550DB410A69A5B556471C67A8
          8E544029284710351C010411120C044962882107C96E36F7BD67F6EAF7361B8B
          A2B59DFA9FF9F2F2DF7DFBBEEFFDAEF77B12BFDF8F1F7AB2B2B2646BD7AEDD14
          1D1DFD544F4F0FFAFAFA3038381818FBFBFBD1DBDB5BD7D9D9F910A7F6100315
          1515EE1F5C34F848FE4B018AE5CB97BF3E67CE9C47B55A2D3A3A3AD0D5D585EE
          EE6E582C169C3973A69F828A38F508D14201CE1F5B802A3F3F7FDBC2850B5784
          8787A3BDBD3D403E26E0E8D1A34E87C3B183537712551460FFD105E4E6E6BE16
          1F1FFFE8C8C80806060660B55A61B3D9303C3C8CB6B636173FDFCDA9DB892B84
          E3DB6B5094EFFF1240F2092A956A25DDB07EDEBC79A8A9A9C1FEFDFB51575767
          9548245F715A29B187689E356B562A5DF514856DAAAEAEEEE56756628422BCFF
          9300124B39C8B86002E73D2893C916188DC69FA8D56A389DCE401092C025954A
          2B7D3EDF2EB3D97C212D2D4D1A1717779863025DD3416BAD6B6D6D3DCF75BA09
          2745787E500089258278E6CC9949111111CFC7C6C62E4B4A4AD27244686828E4
          7239DC6E77C0FC220E482C606F696939CBEF530A0B0B6FD5E974387EFC38CE9D
          3BE770B95C450CDC035CB383B0DF68899B0404C9150B162C78988BBC9C939363
          98366D1AA452091A1B1B50FF557D2006F853E8751A44C7C42222221276870355
          D5D5C225983B776EC03A4C4F984C26E12E1BB3E661FEE822D17EA315BE21608C
          7CF1E2C545DCF1338C7C89D87149C9C7B8DED68DF809A9183FF14E6842757071
          89BE8111B49B1A3164A94794CA01A33109BD7DFD3875EA14F47A3D1833B87CF9
          B28B59738D56381C0CD2D6FF2440C1547B76E2C489454B962C91881DBCBB671F
          EECF5F8AC484482819115E4AACADAC0864C0A4ACD9A8AFAB872F7A1206FA9D18
          AA2B4562A80C3E8914A5A5A522457D74CB00DD2576FE0E719668FB4E01A2DAD1
          74B929292925BF282C94F7F474E350C929FC72D5AFA09531B9AF54C138EE1668
          F52138FEE161F4F5F62077C94A5CFABC0211295970718D8161C06DA9448CC744
          0BF969B912CFD5AB57DB18B0BBF87509514F0CDE1403C2F493274FD6A6A6A65E
          E2CE6F8B8D89C69B3BF762E59AD518EAB420DE98006A0898DD4958F9C7C662EB
          F4CA61E3525E5AA664D75B18748C207BE9E390992B6170B4C2DCDE8143870E39
          9A9A9AFE603018449A3612B61B6BC29800595E5EDECA8C8C8C37197CD8FEF60E
          CC5DBC1AC670C0D4DC82F1139221826384640E0AB071BB760AB0F37F9F1CF8AC
          F4043E7AE7352C5EBF0D86382306F87D52E729781D033879EA13D00A9FB0546F
          E61235183D2B6EB2808A3B3F5D5050902D974BF16995193F5B900B063EA47E04
          C885A33CD4ED748F923BC5CE6996F2B36578E59987B162D32E24A7E5A0A1AC04
          8671774215128AD88E93F8EDC90824D4BD3AE81AB4FC9E4B1C23CC14E0FA5A40
          6666A664FAF4E909E9E9E9CD8B162D527C44FFA6CD5F01457F03D4FA3018C2A3
          02137D2477131E128BA34E98FD62792536AE29C0C2D51B71D74F1F804C1B8A61
          BB0F1AB514D7180F33ED27B1A1CC88A1BE4E282A5EDDAF749AB706AD601D0B44
          21403A7BF6EC028EC5B97366634FF111CC5FB61C06E528998F5BF7FA4621AC20
          57B1D636B5A38935E1A567562035EB5E14AC298221D608BB73D42D4A05B7C9E3
          28D5DF888DC57DC38F2FCDD2BFB9F7C4F040CDE9ADD1BDC744B936070B924708
          90DD77DF7D4F646767BF9C79570676979461E19265907B1C902A34708B1D7B47
          DDC057BCBE6513CE94EC0F1422953604CB37BC0163CA54ACF86329A2624320E3
          44854206055D29A10FA74F36E256A3011E2871F0CC355B5B59F1D6D8CE83EF72
          018B102104286881DFB1E26D4E9F3A057B4F5CC1FC05F9B075352132E97658E9
          2D91A94CEDC0F8F36C235A4C6D2C3627F1E4D3EBF0FC8E3248946AAC7EE1A86B
          D58399AAB65E37C2D432E8E8060D8568583C8668198F5F0A63A40625652DEEDA
          B31F6E8F37EFDE26440404B0E6AFA7055E98963615C59FD52273FEBDF88BF911
          14190FC145878B60140F79B0262F0D850F2C83A9D584AAFA663CB2651FE41A3D
          1EFBD3C7AEBBEF99A26AEA72C2A09543AF22B9468E108E216A394205B42A2446
          6BF0C19172DF9757CE1F886BDEF34A400083B090A7D78E9C19D9D877E124CE27
          BD8FA6EE46DB2B19169D30A7C804D00252C2D2D2885D2FADA7181DB2F357E196
          F47BE0659558FBE78F1CE3D36ED7881A21C875829CC1A05549A15329A0D32A10
          A15341E9ECC2D9CBD7BDAD951FD644769E79231003CC803B587E2B93EE4992FF
          63F0AFF87B5E1116EE5D8B0DA9F5F4A71212C9BF5351221B0D4E9BD506894A0B
          1F6BB3284EEBFEF6B15D7D4B8A96BCD073B73AF5E8EEB50A29B481DDABA1B09B
          71EE4A87CBFDC5CE3EFD70EDE75CEE684000FF894EC94DB960CDAB8FDA34E769
          6DB5BB0C1F9C2DE7992F887D4C413FB3C107194D60B10E635DEAB5405688BA20
          AAA39D82366E39009FCA0F05FD25E78A02A299D0EBB548CFBE1B326B2B2A6AFB
          ACDAAA6D36ADB3A59A5F151397840055F3BCE695F7CF4FDDFAC4CC558A72EB31
          563C37B4D02356914CA2118CF8DDF071DB3EB91D2FBE77C0B12EBD5B236AC208
          E1F08D0A103B4F0EE359DB41133B62B0795C1DCA4E976263E5E4A1CC3B4242AB
          AB2D886878DBAC1EB17C49E2F7C68E6649D4A6F0E79614CCD8F2C0B40249F950
          298998F35EB16B2F77E8E1E80BC04FA8E9CBB70F5C70FC3AA35713A88ABED1A2
          14A303227B2BD1119181D34CAEF5773AD0746227B3C5827F5629BD7E5BA74467
          6D6A5579BAAA836DDB65411E48C3A80DE1CFE617A46FC9494F91760FF7C2C3A4
          1F23BD11A264AB95326CDF77C1B632CDA453B206681C9D308419E092AB616E31
          E1922F094F4E7163F0FC6EB477F7E3E0C1629F457A9B5FEB3235A83CBD5524DC
          4B54073B23C758218AB5A45B9E9BBA34ECF1BC19539483567B8050449DC48F7F
          8B600CD00078EBDDCFADBF99723104B129707634A2CF6F40B3240A71B4C2EAC4
          4ED47E7A98C7B29D47F1113FFB091B891A882F88F709D1BC76DDD81B0A01F41C
          12BB26762D4F5EAA78AC60769ACE6673E0F0FE2A38FC9E8010D28B3F903308AD
          6E35664DBD1E307D18054DE2AFA72859EBDB2A51CD76CDE174E1D8B1E3FEA1A1
          213BAD26FC7D42443BD182D19B93EB1BA7A1A8031C430863D7B8AE45D129AA0D
          0F6D9CACDCF1EA978EF46B39FE49932669274C18CFD860319549A10FD142A954
          06C4387947E8E9E5F56CD8C61495A0B6B616959595365A6C84E4B54172715B6A
          168D883850BFDD9A074E4371C6105A22BE3BB97B6E58B2EC452FF9422FC65DD7
          6834D1313131DA848404796464E4D75DB1708B68CD45DBC6FE1F0D0D0D6EBE7B
          79473091FCAB20F9678449F400849BE437B5E037B66442048F1BC4F58CEB99E1
          0C756E4EAC492CE7FB55369713782798CEB97124D671941112DFE833228E57BE
          B7070F1861F6F3417F8B60B37E1FF97735A542845A142622894809B651C2E571
          C1F7042222384F3CE21AD62F9ACD60C0095F77064D2E2EA9DEEF23BF49C05873
          2ACE9DA04B023723D18D053F3310A1414BC9833FF104450C0549ADC1F99EEFBB
          0FDEF8FC0B5D0D4076A182C55C0000000049454E44AE426082}
        Name = 'PngImage27'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004672203138204A756E
          20323030342031353A33383A3433202B303130306272DE730000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          0000082F4944415478DAAD57095054F71DFEF6EDBD2CECCAB1C0A2B0A08868F0
          0882D6D11AEDD89AC4188F68A69DA4994C4D331DA3754CE244934E3B89462736
          5E3D74AC8D366A3D1213A51913154D33B41211A9461739E41044D805765996BD
          D8ABDF5B16759C201EF9CF7CF3DEBEF77FBFDFF7FFDD2BC1E04BC8CCCC7C4610
          84E725124921AF5AE2785555D55B7C6727FCF72163C025B9D7CB8C8C8C67C3E1
          F0FAD8D8D8DC949414E8F57A28954A98CDE6705353D34ABBDDFE29B7DD24423F
          2801A3D1680885423B552AD5DCECEC6C494242024804B4006432192C160B6A6B
          6BBF6E6C6C5CCBED6544CF0F46C060301404028123C3B868FABE4D544CB34720
          DECBE5725454540449608DC7E339C82DCD44F89109D0C4337939969B9BAB4D4C
          4CBC75EA7EE522A45269C40D548EFAFAFAA29696968DFCE602E1792402149A4D
          F39E1F376E9C4EAD56DF3A69BF52D1F4BDBDBD686E6E8EB84024C1671EC6C29B
          7EBFFF338A687B182BDC2240A5874D26D3229D4E1751D4DDDD0DFA3F4220180C
          A2AEAE0E4EA713F3E6CDC7934F3D8D444332163FB730DC6E6DFB80FBF7524435
          1178140B94516181DBED8E28154FC82C406B6B2B6A6A6A307FC102FCEA955761
          30A643D97503AAEEB358B9E5F8E9C345672EF2F38F89CA472240734EA5E22FF2
          F2F274A2E9454B30DD22AE786FED3A4C983C0D71964B88BFBA0F711A3B5C0A05
          BE3B7FA2EE95FDD86B6E0D1DA088FA4722C0A52189250A8562737E7EBE505959
          89CCAC2C6CDCB415891A398C6737233EAE1D484B06540A20613C9C964E74966C
          0E383DA1D3551DC12D8B777AFE43396E3C405D90DC759F40127F20966651F99E
          FD07A1BE7911A34BB7421893060C4D6498715B88F2253260C8482076047A1A2A
          603FB73BD86871EEFECD678EF7CC4D9180EC7D5002E29212465A61A754AE9CBD
          6BFD9B587863179419D9C0A861F49340E5E1BE588FC43B8948D5803C8641940C
          EBB94F61AEAD3D357B8B7D39B5377083EF4109884B4EB002092F2D9D183365D3
          EC614F2846E7F0F4F1F47028AA3C9A6DFDF7A1A8244D02DABFFD0A7F2B69FEE3
          DB45CEED7CD234585C0CD40B94A2254EBE90B6726A56C26BEAC9797D7EEF3F3D
          A28AC351110E17CF4A3D497108F4F4A0EEEC7F5BA7EC68FBADCD8DD3DC607B18
          02E292DD5C61FA70884EBF5C35F931DA45DE474022BA2178DB0DA2043B093459
          682506A8410F477919B69E6CDEF1FBAFED7F415F7DF03F0C0174AECCDAA889D5
          BDA19A44023286879F72D4093CADE3B61B4411DD6EF456D6C1E3E9806EC62CA0
          AB07D74F9CAD311D6F7E17BF647A0E6350AE88F48B20EEAA96F72220E9583672
          8356AF5DA59C420252BAC0CD93EA5258F53BE859CA516849CA25762BF8CE5560
          77579B6BCF486528313D4663550742F11A8D2C252E56525C73F552CB735D8B28
          F306EEEA19031338886945E5696FCD51A63E25296416E899861D3C446C2ABF62
          8C3B3A99B42692A28B435E049ADB5161ADC39FA72723D5A886462783C05455CB
          95F8A4EC7CB8ECE5EBAFA315477057E71C9040FAC9F8EA3F35A78F9C5B4D9FFF
          6814A0D531B3493E2C5A51E8AB05A21B04BA26C0673106788E1EC2078BE6C194
          3D1C43D34CE80D7A70B1EB13145FAEC499176BB6F0FC62C9BE8C3B3263400269
          C7F425DBDCD9531794D1EFE34D082B1984FE20241A15C20D6D90A427F58541A3
          15926C23B32416BD25A53838692654051330D4688437E84659F74738575D8FA3
          2F7DB71D35F827BF2827BC8312D0EDD71C7E23E7F145EFECA0897393111A128B
          B0D501E96326042E5D83CC6444582147E0722DE46359110509FC0DED382FC850
          F5F4428C30A5317154F8C6BE09E6EBADD8B7A46C17A78643145D4AB8062520EC
          14B62D9DF5E3652F7CEE40610BB74DCD85AFBC12CAFC31F0B75820D0EAD22C9E
          F2DB4B50F1B4488843589B02DFF1CFB17BF16B30E5E5202561288A1DEFA3D1D2
          81BFFEFADFFFC0371067C812C23178106EC59AE53F9DB6CEA0D0E3EDF7D9E846
          A7B2D6F8A090C9214933C07BC10CD5F85CF8DB6D90D89C908D60A98ED12258DD
          8472A6EA95279EC184B16351E2FE106D362B362C3D71085F44089CC11DC56960
          029BF1F29219851F2525A7E2C5F35AE47E7919E1892678CCD7A029C883AFFE06
          E42C4AC2880CB8CA2A1093C4F48CD721AC4F42F0F429EC99BB14590593501373
          001DCE1BF8DD8AA263381021F015D1313881F598FDF39F8CFF3223D180C733E7
          E2C955FBA115E3304E8E30A35E916382BBF47FD08CCA664204E1ABAE837AE274
          D606FAE6F2159CCC2C4060D6B3B01A4EA1DD750DABD71C290E6E0F8B31F02FC2
          323881B5183B67C6984B63920D281C3E1F4A4F10B357EC81D498089FDD0A8581
          43AB41075F552DD4B98C8FCE0E48039C13351A7092C1C7F396C13479125AF4A7
          60F15EC1EA75874BBDEB83E2E022D6829B8313781549D39F1FD13625D324E4A7
          CF8152D043ED0F61DCDF8B2167E9D599191713D9A46AAF722E1802A4B050555C
          4043BC0CA7F353D1C298491EAEA2457C9073A85DB561AFD9B6DABB076289035A
          70BB950DB026435EF8AEC9FAB39C1C7DAC32896921B0FAF6C22F0F4630B2D687
          99671CA8D5CB10B6F990DA13C0D16C15AE240A481AAA805C2BB60817BA5C6E74
          7BBC282D6FA8EB7ADDB79B92F711D707B700DF8D2B4EBBFA8BB185395E7F2FBC
          6C44BE40009E5E3FBA7D5E74F93CB0332BBA5D1E58AD3D2157B7C7064FB83DD0
          16B2FB5C0107BDECE23F472F3A3994D8D80D6D9C90DCA0B950747F2E1087AE6D
          D27754016191CF1B5206BB42F6902DEC60FCF650981B5D1468674975B2C33969
          CE60A4E58A154E2C32EEE8F5CE7B6734F844F37BEE8780B838066112319AE0EC
          1519B1EE56D0FFDB1D7D1F88426C1AFEE8B5FF59FFEFC19B517471F2441CC1A1
          2F322F06BF47B0FF8EE7DF370DDFF3DFD2FF01303C564EA8A929CA0000000049
          454E44AE426082}
        Name = 'PngImage32'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002A744558744372656174696F6E2054696D650053612038204D727A20
          323030332031333A30323A3335202B303130308A646BA20000000774494D4500
          0000000000000973942E000000097048597300000AF000000AF00142AC349800
          0009FD4944415478DAC5570B7054D519FECEBD771F7777133604488004422246
          54C6B78CC4073245B17504ABA3162B3AB58AAD30D0FA624ACB508D3A68956A0A
          D441A101410B2850C2434880002111484C524C94244D60B324E4B9D9F7EE7DF5
          3F37BB92026DA733CEF424FF9E73CF39F7FCDFF9FFEF3FE7BF0CFFE7C2FEC7FE
          EFAB18FFA2E89461483DDF06664922AE8F6B8A8DE99074C310151D36C64451D3
          0DD18028E9BA2AE982201ABA68D30D081A98A80316C310249DDA86AE5B554310
          750651D7208109164D87E8EDE8B578BD3EC9EBE9E9EE6A6FDB58BDF1C975A436
          40A2B2AA4E5F1A3457894553F3BD41D8C30A93540392A61920C586AA1A465CE7
          6D181A69527583298AC1DB8C6F83E6318590A87C8E6110063DD1CF487468B459
          83BFCC1894B886FACA66747DB5E54DEF9745AB695A272B6D8E178FB42A332BBC
          923BA008565A02E66243C42031FBB8EDB4441F06FBE8DF1C27AC661B06073258
          1B7C0C833508806011E1EF0EE250F1DABAFEE3CB7E47BD475859B3D2C7B49854
          DD6D4BB1D1649D2FA6EB508600509320686585168B511DA18639471DECD38CC1
          9DAA647F8DDE2743817EE93D70EB994E172506835E2CFBE82FCD5AFD6F3FA0AE
          BF1200ADD75042B6CD6D4E676348A0C5C931F4025FD41060EE46A33E8D3AB975
          DC92816B2D61DC93271A0E9BC0AC1601B2C860B330C81260B70A709022D97241
          68E3DF1525EC5367CC7EEA74F9FE1D9FD2E306B6B759F138D5C8F0E76B5C8E8D
          575723CEEC703A9CE454157D4DFB8969110C1F3B19E9D93700F17EB447ED78B3
          260D1B1F75EA8C09C2E0B22AB4681491581C51AA63B118C2E10882A13022D108
          42A110FA7D03C8CE1E87FC2B272A3F7D7C4EC39E2FF67F660228698835A58AB1
          B1CF9D4C910FDC5C0BBF9481F6EA0DE83AFA0A4666000E07E0EB03FC2C17539F
          AD4220A662698503EB1F9135D96611B76EFD0C02E15014852CA54125E0BC263E
          42144553AC56AB59E7E4E460CC9831F1B973E7D69796966E23001BD9CE8668AD
          9BC5F29F39996A3F54D084A686433857FA2C468FA361DA9F40814A2E45730330
          75513DE01C8D57CAADD8F0635175CA36C97BAEC35460B1584C25BC9624C914CE
          255E786D98A434E0F1789479F3E6551F3C78703B0D7DC2B6D5872BD324F5FAE7
          AA53ECE5D37BB0FFAD4C8C48D7108A029923A7223D33D764F204F42170E36BE8
          73E4E1C5FDC07A02E0B05B881183671623961B8671C989C32DC38583E000DBDB
          DBD5850B17561D3870608749C2CDF5C1B20CAB76FBF32753AD5BAFABC6974537
          C39D094846167EF8D84B802D152695CF54A23F7D367A33EEC0A2BD1AD6CD12F4
          14BB24F883A184CFC3A604020153FC7E3FBABABA50505080DCDC5CD32DDC3A2D
          2D2DCA0B2FBC50515E5EFE3702B0857D5AE32FC9B019335EAC4FB5AE99548D7A
          02E022DFE78CBA153715DC473EB00FFAE24C05BAAF2B44D099835FEC54B0EE01
          A6C9922E961D3CF4DD4EB915B8E9B94B6C369BA9302B2B0B6969692637F85853
          5393B278F1E2F2C3870F97D06B5BD9C755BECDA38789B37F53E3B07C704704A7
          DE1D0566849135220F77DEF5E0A01D0515E86AC6C0BDDBE1A75D3EBD4DC1473F
          D234778A450C04C290651976BBDD24633C1E37779BF47B9298BCCD81353434A8
          4B962C29ABA8A8E0003E67C595FDC563528539CB6A65E9ED5BFB70A5EC47D9CA
          BBA17479F1F8D4C9809C82A84FC3A3B5F3B07AD92CD853643CB2318C0FEF5735
          B743127D030133CCB8D9BBBBBB3165CA1453A179E3248897E406B7C8A953A7D4
          A54B97EEABACACE400B6B3B5477BFF3CD62D3DFD669D2C154EE983DAD18F69BF
          3F0B872B88D77F7D030AAE4DC7BE1A05AF7FF20DA22D6DE8DAFE20E66C8E60F5
          3D31CDED94C4F2C3474D0E24C370FAF4E9DF450057CCDD928C04DE5F5B5BAB14
          1616EEA9AAAADA4DDD3BD89A23DDEF8C1F6E5BB8E2944D7CE9261FEE7D721746
          5D331E56971D6345158B5EBE932E90367CB8AB0DCCCAF0C0181BDAC75C8DB70B
          7C4A7A8ACD128A444D7FF3C54D6F911B928A9391C1957390FCF9F8F1E3EA1B6F
          BC5172E2C4895D347D275B5DDE5598335C5EBCB6D92EC69B6AB1B7B419A3B286
          431EE640F7391F6EBE2A0D6DFFE885949D8958380EA7CF8FFC1977E0B55B7A15
          B7D362A16BD85C98FB9E470137F3C4BD132F09C7E6FB9A4D0ED0CED5E5CB97EF
          A8AEAEE616286145073B97E4A5CBAF6EF13884F5EBCA600FF6C3EE76C1E62216
          CB16444271A8941828A108C2BE205CB4A31FFCFC412CBBB14BA1DBCBD2D27AC6
          3C7EB970174C9A3409930F4DC6E7F3E723A447B1EFEBAFB1A1BC129ED91E73FC
          D8B1631CC0E77575751CC06EF6DEBE738BAEC8487967BBC72AAC595D8A1C2988
          112353E14E7592C87099E2806398138E140724D98A2FEAFBB0F2EE606C9853B4
          79BCE7CC9D71E191C02567670ED63EF73304231194379DC667C7AAD17A7FABE9
          8A23478EA82B56ACD84200F610803DECAD7DEDF3F233535695B60982263B912D
          1BF0471504C30A42743546E22AB15A439C5B816E447E3DF786747C30331C1FEE
          10AD0E57AAE967EE026E05EE82092513B0E6D9A710A4E7038D8DD879A20E6767
          9D3541B6B6B66A9B366DDA555454B4D504F087DDED4FE48E1E567CA88D329944
          3262DEFBFC6ED7782E90A887B4BB43C0AA7B828ADBAA5924AB8CBCDD7997F8FC
          8F731F439440357674A0985C704959407FFC1C28DCD9FAD055D9E99B8F9EA574
          4B4D2A1B04A224DB1701E98E1A587957404977318BDDE1C2B81DE3B06DFE02F4
          2A411A27AB11E3231496BC2D1141AD7407F060E47152E3F1A0F8E8710E60393D
          7EC85E5EFFCD7DF939E9BB1A066C2C4AC99D3A54A93698195D0031D8EE890878
          7F5A7F64ACDB2ECBAE14646EC9C4C7CF3F831E3A8CB89FE37410C5F96948622A
          4E84A39542B4D6EBC5A6CA6A0EE07D1A5AC59E78FBE8ED578E1F75389C3296F9
          29CC2ED9BD9952D1B379B25162490BF90654BC7C456DD4DF77DE9633210FD3FE
          3E8D2D98391D7E229D42001CC483DC112388332ACE13A8D39D9DA6152C04C03B
          3080932D1E0EA088965CC96E7AE24F23275E53D072F57559AEAEB8CCCC84822B
          E5F921E18F842246241062111F65387406047B43465F7FB8EB3671DD698FB7B3
          C3EBF506DA5F697FFA6217BFF3938788C0711C696EC617758D97E3C07BF4BBDA
          B4D06DF30F2C76A748AFE65E9BA30F8474C1D747E73BC57CC81F453C12EB8EF4
          34350D78BFEA0876D607627DA7E34AD4CF0DE227E926E9E1272D493EC930F3EA
          2CC28277094098B850D9D68A5D355F7385FCFA3D4F124DCCF798B761024FFAA8
          29BFFAA560CF98092DAC69BED3E7233D8DFE98AF4D55A203B1C447446F426152
          E9004924B1202FA9FCBE313F768AD0F8FE9C871125221E6B6DC5F693F51CC01A
          1AE379E099C497117FEF7C120027286501A0EB0FB93C8326F12594F526DA4965
          B18428177D665DF89C2B82FE64C12D26199B7A7A86FA7C15C9B7431C610CFD06
          E4209C09E1257E19654315FEFB52749939099F5F04E0B21FA143FBFEBBB2CB97
          F1240F93649B9C18E2F3840BFE2380EFA3F03C2E2351278BE9735CE08C59FE09
          9E4DDBFC71985FCB0000000049454E44AE426082}
        Name = 'PngImage29'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002A744558744372656174696F6E2054696D650053612038204D727A20
          323030332031333A30323A3335202B303130308A646BA20000000774494D4500
          0000000000000973942E000000097048597300000AF000000AF00142AC349800
          000A2C4944415478DAC5577B5455551EFEF63DE7BE012FF252C122D44C25B5C6
          C7243D2DCD6A9AB4D6AAA9AC66AD9A6C56CDE84C65CE688E4D54CB9AC9661AD3
          5E941651E08B3475045454045114885013E47901EF85CBE5DE0BF7715EF3DB87
          8B31D51FD3AAB5E62C3EF6669FB3F7F7EDEFF7DB0F18FECF0FFB81ED3FD5A3FD
          17519DA689DD67FD778902A64714C9CC5488AAA609920A336382A0A89AA04110
          555516558341D054C1AC6A302860820A1835CD20AA54D754D5246B0641651054
          052298C1A8A8109C9D3D46A7D32B3ADBBADDAEF6E6DCAADC473E205A3F416615
          5DDE782831BB8C8A3CD11980654062A2AC4154140D44ACC9B2A645545E87A610
          93AC6A4C92345E677C1AF41D934889CCBFD134D2A046DB1941854293D57867C6
          204514D49637C075AAE015E7B13737D0675DACB821B229C9242D28738A0EBF64
          30D110D0071B068DA0B771EF94681B06DBE8477F4F5AF53A342E64B0D4F83B0C
          96200106A3009F3B80839B726A7A2BD73C4FAD87594983E4614A58AC729B63CD
          F4B1CA07535548C304C84322686489060B5319A48AFE8D3CD8A668833395C97F
          85FA9351A0DFD40FDC3D3DE882C8A051C792F73F6C506A57BD4D4D9F9100A547
          93FACDF9CD76FBE97E030D4E81A10E7C50CD007D360AB529D4C8DD71881A328D
          03983F4ED06C660333190DB00A0C66238355042C26036C4464357E039AF8C547
          1AF0CAF316FEFAEBD2A2C24FE9CF8FD8DE06A9CD2E07473E7932C6963BB90A11
          6681DD66A7A0CAF09C2BA24C0B6264EA9548187B1510E9457BC882574EC623F7
          3EBBCA98C13038AC0C251442301C4188CA70388C81812002FD03088682E8EFEF
          47AFB70F63C75E8289974F90163FF840FD9E7F176DD505ECAA0F9F8B13C2A94F
          9C88B5EE9F510D9F9882F6AA8FE03AF21C9252009B0DF07A001FCBC09CC72BE0
          0FCB585D66C3E67BAD8AD56C14B66CD90A03E99024899C522093705E523E4210
          041D2693492FD3D3D33166CC98C8C30F3F5C5B5C5CBC9D04E4B29DF5A16A070B
          4FFCCD8938CBC1AC7338577F101DC58F63F425F49AE667A0854A2145433D3067
          592D601F8DE74A4DF8E86E41B65BCDA2B3A35327301A8D3A092F4551D4C17389
          3FBCD4F4A4D4D0D6D6262D59B2A4EAC081033BE8551EDB5E3B501E2FCAD39FA8
          8AB594CEED46D1ABA39098A0A03F048C4A9A838451197A265F060FFC57BF088F
          6D1C9E29023693009BC5481931B86731CA724DD3BEB3E3706738B8082EB0BDBD
          5D5EBA7469C5FEFDFB0BF524CCAF0D94A498946B9F3C1167DA32AD0AC7DE9C01
          C72840D4D270FBAF9E05CC71D053B9A51CBD090BD193721D96ED55F0C15D0635
          D6221A7C81FE68CC0774F8FD7E1D3E9F0F2E970B595959C8C8C8D0C3C2DD696C
          6C949E7EFAE9B2D2D2D2CF494001FBF4A46F578A599BF74C6D9CE9DD4955A825
          013114FBF4E459F859D66D1403CB602C5ACAE09E968D803D1DBFDD29E1835F32
          C52AAA42C981831767CA5DE0D6F39098CD669D302D2D0DF1F1F17A6EF077E7CE
          9D9356AC58517AE8D0A15DD46D0BFBB8C29B3F7A84B0F0CF276DC6B7AF0BA2EE
          F564306D006989E370FD0D8B067D34C880AB017DB7EE808F66F9E87609EFDFA1
          288E58A3E0F70FC06AB5C262B1E8C9188944F4D90EC57D2831799D0BABAFAF97
          57AE5C59525656C6056C639BCA7B378D89333CB0A6DA2ABE36CB83CBAD3E94AC
          BF0992CB8907E75C09586311F22AB8AF7A0936ACB90B96582BEECD1DC07BBF90
          15874D14BC7D7E7D9971DBDD6E3766CF9EAD13EA274E34F18672833B52575727
          AF5EBD7A5F79793917B083E51CE9D998EA101F7DA5C62A66CFF640EEECC58D2F
          B4C21613C04B7FBC0A599909D87752C24B7967106A6C866BC7223C901FC486F9
          61C5611785D24347F41C185A8673E7CEBDB80238310FCBD04AE0EDD5D5D55276
          76F69E8A8A8ADDD45CC8DE3DECFEFBA523CD4BD7D59985ECAC7EBCF3713DF634
          4720D8CC4815642C5B7E3D6A8F36D15E10469B3784D1E110DA464FC66B595E29
          21D66CEC0F86F478F3C187728193F17070725EF77ABDFAFB989818545656CA2F
          BFFCF2AEE3C78F7F419FEF641B4A5DD9E923AD2BDA649B90F0DE1A04F616A2E5
          854F9077CA8BAEF65ECCB8221E774E4BC4E8ECC7D0312D0B55197722386E2AFE
          3AA34772D88D463A8675221EFBA195100804F455D0DBDBAB8786EF8E99999998
          3C793268E6F2DAB56B0BABAAAAB803BBD89B07BA565E9B11F762DD538FB2A95D
          65705DF0A1E1E627513C69214EB405F0D42D633169F114DC92958483152E9C7A
          A312278C195873B54BA2D3CBD8D8D4A21370F0107007F86CB92B36DA467982F2
          72A87EF4E8512E605B4D4D0D17B09BFD635FC7B2DBA725BE7E223D86DDFCD074
          C013C0677BDA11FB4E116CA969E89F3B16772C4843D2A516E46D3E8FB4AF4258
          B9D38DF53705C223EC82B9CDD9A16737075F091C3CD978FC796E70FBB913C9C9
          C9B0DBED387CF8B0BC6EDDBA82A880BDECD57DED4B6ECB4CDC50734D269B3F5D
          44D2E589F8EA5013F6F52540683C83FBE7A62029CD8EA66A37F6A5CCC385DFAD
          C7CEBA7EBCBD602032D226989860D4E31C0C0E1E3A1CDCFEBEBE3EBD8D3BC285
          CC9A350BA9A9A9282C2C94366EDCF8C9D9B367F7928022F6B7DDED0F655EEAD8
          A49C3AC642CB17E2EEFBA6E8E76FD5FE265C35391E86184A2E5F10EBF7F42031
          AF1C05EE78347B54BC353F20394C8AB1B5BD53B77FE810E2CF901BDCF2D8D858
          1D3C2C4D4D4D524E4ECE407E7E7E1EF5F942BF9064EF6CBAE78AB109F936B3C9
          70E6EA04FCE1918974EC4AB46E94C18B005D1037E79D8779D55B383E7511EA3A
          C2708734ACBFC12F25C430A3ABDBA35B3E643F27E27B3E25A6464E68ADADAD70
          3A9D5A737333DF863B690B2EE9EAEA6A26727E1A9E66CB379FB96DD6A4E42FEC
          816E56FBC8022C1E2F634C2A9DC1114EAEA1B1C98FC29E4424E796A1A0A61F21
          BA0076070DF8E78DBDC15487C54A77507DC991E55A47478746A71D3F7040241A
          AD884E8FC7D378819ECECE4E3FB545285C4E222E279C24F4B137B67FB5685AA4
          73DBE9C7EEC1BC29368C9F920004C283B3D714FD18D8BAA703BEEB16415EF12F
          1436AAE8E995B17C7C75C8E7B9606E696D070DAED2D2EBA4843B4FF52EE2F377
          7777CB6473849310BA096E7E0925B447CB00DF9F98ABA76FEDF18C94E533E750
          B28DB203BC0FCDDCED0A222956D043E10EC83873A60F67A6DE832FE73FAB6D3B
          D8E2BA46C8F9BACD79A193ECE56412914951B21E822B4AC8EB3E4290101E56CA
          17FF2F781F7861CA8411AB67678D26721AC3C45071E4026ACFFBB1E8161265E5
          9FCB7087559CF8D28FE3BF7FF1F3BF3CFF273EA8333A13779470882C340CC3C9
          BE7B59E0027248F5FD0B2F8BB3380CFAF5757F7117BE8C1BDFC76EBEF5EBD49C
          7533AFFFB903492318DF6391BBDBA72C86964FFD4A09C7A2D6FECF64DF2B6067
          BCB93223CD3A73C2657128D8D5A67DA86A052534205D41BA6792A45576E19990
          41635EBFAAE6C7183F2D09482DFC26C333986FFD3F84EC7B0510C66C75984A4E
          7B23AE5583B6F224A926D447679541202D70442DAE241C25787E0CF1700166C2
          04421641892E8FD66842F1D951668296068CD1197BA3EF949F4A00A2224612D4
          2841E45BD60EFF6FF94759FEEDE73FDE51C7375FC3D33D0000000049454E44AE
          426082}
        Name = 'PngImage31'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002A744558744372656174696F6E2054696D650053612038204D727A20
          323030332031333A30323A3335202B303130308A646BA20000000774494D4500
          0000000000000973942E000000097048597300000AF000000AF00142AC349800
          000AC74944415478DAC5570B7054D519FECEBD771F77371BF280248404429087
          808282D812838F1905251514061D2C68C72A58B56045A5D2325450A6E0A31D6C
          79885288A9CAA380802224902034C19010D2342A794AB29B77B2D9D7DDDDFBEA
          7F6F164DD576A6D3CEF44CFE9CB3E79EF3FFDFF9FFFF9CF31D86FF7361FF61FF
          FFAAE8FF64A846D785EE2FFDF3041E53A3AA6C631A044DD77959838D319E5735
          9DD7C10B9AA6081AC7F1BAC6DB341D9C0AC66B8045D73941A3B6AE695645E778
          8D81D75408609C45D5C0BBDB7A2C6EB75770B7747775B6361754143CBC8BCCFA
          491456D6EE4D841A77D4A22AE3DD01D8433213141D82AAEA20C3BAA2E87A5433
          DAD055B2A4683A9365DD68336319348EC9844431C6E83A61D062FD8C44834A8B
          D58DC98C418EAAA82EAD47E7C57D1BDDE7B76CA561EDACB03EBA7B98559E73CE
          2D24F865CE4A2A602A1B243A89D967F84E8DF561A08FFECCEF84D56C4337800C
          D4BAF10D0335080067E1E1EB0AA078F73B97FA3E5BF76BEAFD9415D5CBBD4C8D
          08155D36978D066B86324D833C088072150469964959846A891AE61865A04FD5
          0756AA90FF559A4F8E02FDA77930BC67069D1718749A58F4F69FEAD5EA5F6DA7
          AE0F0880DAA3CB41DBDE66A7F3F32047CA293034C150AA733057A3529F4A9D86
          7712041D932D21DC3586D71D368E592D1C449EC166611005C06EE5E02043A2E5
          1BA1857F5DE49057B973FE23974B4E1E7E9F7EE6B3E3F5728B5391929EAC8C73
          144CAC4094D9E1743829A80A7AEB4E52A649481A711D92336F00A27D680DDBB1
          B13211050F3835C6386E40AD02351C861489224C75241241282421100C410A4B
          080683E8F3F623337324C68F1B2BFFF8A1C5B51F7F72F28009E0686DA42E9E8F
          8C587EC1259E9A5E059F908AD68A7C749E7D01C352018703F0F6023E968D998F
          97C11F51B0F69C037B1689AA68B3F0FBF71F0047386459264FA95008B851533E
          82E77953AC56AB59676565213D3D3DBA74E9D2EAC2C2C28304A0801DA90D5725
          B0C8F8C72EC4DB8B73EA50575B0C4FE1E3183E923ED3FA38DAA81452D4D70233
          575603CEE178A1C48AFCFB79C529DA04B7A7CD3460B1584C23462D088229462E
          19C5A875332975B4B4B4C8CB962DAB387DFAF421FAF41E3B581D2A4D1494A9CB
          2B5CF6923BBA7172531A8626AB088681B46133919C966D66F268F4C27FE37AF4
          3AC660D549600F0170D82D9411036716A32CD775FD3B278EE119430C1006C0D6
          D65665C58A1565A74E9D3A6C26E1DEEA4051AA55BDE5C90BF1D6FD532A707ECB
          7424A401829E817B1E7C0EB0C5C34CE5AF4AD1973C1F3DA9B958795CC5AE799C
          E6B20B9C2F108CC53C648ADFEF37C5E7F3A1B3B313393939C8CECE36C36278A7
          A1A1417EF6D967CF9594947C4800F6B1F72B7D47536DFA9DABAAE3AD6F5D5B81
          6A021047B1CF4A9981693977530CEC03B1F8EA1CBAA66C40C09985278EC8D875
          2F534541E38B4E177FBD52C30B86EB8D90D86C36D360464606121313CDDC30BE
          D5D5D5C9AB57AF2E3973E6CC519AB69FBD5BE6DD3B7C083FFFC54A87657BAE84
          9AD753C0F41032868EC1AC5BEF1BF023A7009DF5E89F7D083E5AE5A30765BC3D
          5755135C16DEEF0F411445D8ED76D3C55713F06ADC0D6086878CDF06B0DADA5A
          65CD9A3545E7CE9D3300FC85ED2EEDDB9D1ECF2D5E57250A9B67F4629CE843D1
          1F6E87DCE9C64333AF034417C25E150F542DC3D675F3607789585410C2CE3C45
          4D7008BCB7DF6F2AEF8874A0E0F3025405AAD026BBCDA8A5F269B875C4AD587C
          ED62A4DA524D40353535CADAB56B4F9496961A000EB177CEF66C1B91203CBAF1
          92286CB8B9174A5B1F6EFBCD1538E20278F91737206772324E54CA78F9BD2F10
          6E6846E7A1FBB078AF84AD7745D404A7C0D7353422DF9D8FA3FD079037FE664C
          4CCD465096D02175A24BF2E2729B1B975BDBF1D8A4E558357515CA3F2B97D7AF
          5FFF715959D94704E0307BEBD3AED74625D956BC5163E39F9BE6C5EC878F2165
          D22858E3EC18C12B58F9FC2CBA409AB1F358339895E1DE741B5AD32762738E57
          1E3ED465F9E991658824BBB1F8FA3964B41D97FBFF064FA80352344A40683719
          212077B85B7D98157F175E1CF7A2FAF4534F1F292F2F37007CC8B696746EC84A
          1257BF536FE7A37555385E588F948C2488431CE8F278317D42229A1B7B2064A6
          21128AC2E9F561FC9DB9783537A0EC6ADC265C0C16E2A1297371A9B70CED9166
          CA010E41321E3000283282743A1A9E88D269D9E3D1F170DA23BA50229CDCBE7D
          FB7E13C096D3ED6BC6248B2FED6B71707B7615C11EE8833D210EB638CA62D102
          2948538918C84109216F007114C7B9CBEFC7333735AA0B4FCFE67F3BE729D4F4
          95A34D220FD16E91145A35259D44C603545F09B463E3E49DB8367E0296553D88
          4BA51D78C6F5F3F39B7EB9299F001C64BF3FE159794DAAEBB5432D56EEADAD85
          C81202183A2C1E09F14E121171A638E018E284C3E580205AD1D4E647D290CD5A
          8FA3869B9C361A957DA760615644291923E4F2108944DBAED9EFC1EBD7E763FE
          C845E6663AD0F93A16EEFC0D6EC38D4DC52F156F334FC24D275A978D4F73FDB1
          B099E354D1894C51872F4CE84386FB548AA5427B5845D4F002DD88C6F53C31CD
          86BFF6FC485F78CB4DACCE5F8DA6FE063A0A39B82C22C23436425BF14AC08357
          A714E0DE910B4CE3EEC897C82BFE01AA2EC623DDA7F47A367BDEA4EEDDECD58F
          5A97640F1FB2BBB899984C8C8C98F7BE71B7AB061788D583DAD3463A90DF7203
          9E98350F3BAA776051C22A8484104E067760B838142DC10EBC31F55DE4652D30
          495F47A401F714CE40A5876EB5D609B0FB5A43E1DF05B610809D6CC391A60513
          3293F79EBD42744BB96A6C00887CB5FD2D20D3478BC86F9882053373D1D82461
          6F2EE5137181D71A36624BF35AEC98BE0F79A3179A2BEF8A36626EE14D2877F7
          0EB092FAE9C4062F7AB14DDD49BF76B0E7F77C71F7F8ACE463B5FD3616A66DA3
          0C36AA0E30A36F400CB427A53BF069DB3DFAC429C9EC7843313EC92945962B8B
          C8881D76D1669EDC06A02EB9117931E30651D4FA87100BBC86E251F177BC8FA3
          A607966C3E7BCBB851296742AE11CC47DBEC3BAB372915FD36691E114BDA0569
          766240DC3AED92F52CD7A9379B8CA930B71C235CA38845E970D0D1DCAD3691DB
          A7E30219E77466EA40D364201C02CA1A0FE13C3E23957F66D396BC396CECA49C
          86895332E23AA32233098561D4E08714402928E9923FC8242F311C3A03023D41
          3D128E763D7A7BB5EF95BE8DD943C78A5C20E2C770A70B9FE45E408A2B135D2A
          C5BC68C6D7C60DC28AEE61749F8CA55BAB52417E780F022821001F1997B9F0C3
          A74EAD4E70092F654FCED2FA831AE7EDF523487B3EE80B232A45BAA4EEBABA7E
          F7C5B6407BB53FD27B392A877D743B2188B96477B675892591D12E8962526A1A
          1665DD8777EB3FC0254FCF37A4A03719F04CA0846C02AA3C8771160DC64D4872
          F1EA0B2839E5E6677EC6D953E7400DA9AAF77287D4FDB92FE26D56E4707F24F6
          88303476C5A4DBEC1320E22778851FC7DDCDC88691C4D006BD7B42940FDD44AD
          0243A9FF2BBAD23D67710C75F4FD347D2D34DF05B1A19432201600BAFE906D30
          68126FCC584FAC2D91104F4224268A39CF4664290FAB90CD2F85CB6185402452
          B6D268179158E212723F8DF428B8241D4319E9D2501133DE64D088C16F400384
          332646890E32267FDFBB2E566899C8443AEEC0043AE4D230090E4BBAF9ECEB97
          DB7005F5A8213E1744BFE1721223F99A637ABFF711CAFE8DB17F552C24492459
          249469C82071C574F98C8390A42E66B837B6B8EF18FB6F0B8B79238EC4110385
          58A88231097F7B51FF0019850DF701001D2A0000000049454E44AE426082}
        Name = 'PngImage33'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446920313620417567
          20323030352031333A35373A3530202B30313030D18698470000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          00000A484944415478DA9D577B7054E515FFDD7D6577934D36219BCD12F20001
          03E1211194162329F800C73FB0D0E0941975A052AC8A506B3B0681017454702A
          ADA02D04903784142914076108100A01F222E4619E249B84249B6C36BBC96EF6
          71EFDDDBF3ED5D2158AB4CEFCC996FF7DEEF3BE777DEE7E3F000CF962D1B153C
          3F394B14879E1145CC0082A305418C06442918145DA2C8DF0E04864A05C17BFE
          B3CFD6DDA0237E22F14178733FF671D7AEB37ABF5FFFDAE0A0F30DAFD79DAA54
          725C62A20146A30E1A0D0791D0B8DD3E381C2ED86C4E701C2769B5AA7AA7D3F1
          F7FCFCBF1CEAE8E874101BE1FF02B07F7FE5BCAEAEB6ED1E8F674C7ABA05D3A7
          A720252916A2C023E0F723100840E0050822233144B75BEDA8AE69435757486E
          4D7B7B636E7EFEAE0BF4C743147C40001277F0E0C58D6D6D83B9F1F15AC5C217
          662076840E5E7700B77A94E8E35508285410150A486CBB1084D23F046DC08144
          CE062527A0AB6700578BEB30343414703AED1FE7E5FD793BEDECFB216BDC0740
          92246EEBD6633B3C1E6959D61313B927674F82141470A185834BA944523C10A9
          06D4A1BDA49214928F00D12079BDC70528FA6C18E9AF27770471BDA41E6DED3D
          1281F862CF9EBF7E4CC73ABF0FE23E009F7E7AFE7D87C39EBB60412697993916
          DD03122EDB383C9C02185580368492A22B287321ABCB9146EF3CF4C2CD1318FA
          DD69A3FDBD2588861315552D686ABA23B5B7D77FF4D55747BFA0DD5DC341DC05
          C07CDED1613D3D73669A223B7B329AC960750160BA0588A1EF5EC89A0A6112C3
          DA8B6162007851B68C445CC90B50B6942246B4E17A5923C545B7FFC285B32BAB
          AB2BFE49AC7A64D86100C78F57E89A9A3AAA8D46CD98575F9D834EA78432B71A
          4F8C02DEF9ED724C7B7C26962F5D1A726240B807E23BF28B616B0C03C438DBDD
          E492868BD0075D3877FE06EC76DBCD2347F6FD9EE7F912DAE1BE0BE0F3CF2FBE
          6DB3D93E79E3F55F20C61089E36D7ACC1C0F7C9D9787F57FFA23A59C06DB0E1F
          C5DCECD9E8670299B64CB878CF0A8C13A7248064353F9124CA96E824D4C6C67F
          A09752F5DAF50A9497DFF8B8ACEC461E9D68615EE4B66C9114C16041734A8A29
          2DE7854C5C6C8F40A45983F151647A62B0E4A597505E5C0C9FCF8B3D67CE6162
          C6043803B2B9EF6AAB00A222811D9BB6E0E925CB61888B8177888295DEBBE9BB
          A3AE1E31CE4A145D2D272BF496EFDDBB7B3D9DBA4CE4E2DE7F7F77B628EA0A17
          2DCCE4468D8CC51987099964FA183ACCC2BDA7B71F6F2D791177AC2DE0F900F6
          155D87799419435ED90220ADA375C0E677D6E09B8379D01B62B0FD5243283835
          E465BF24C783B6F2103ABAECA8FDB62E5850706C2D05FB41DAD2C66DDA74E803
          5221F7AD3767A3DE1E019721169362C3DA9105C8FA686EEDC4DBBF5E04579F1D
          0AAA01FBAE57222A5A0DAA43D05276ACFBCD0A94167E138AAB9F3D9F83651B36
          93C5081BF150912276CA0EF7CD22A8075A70AEF0324A4B6FE45555553137DCE4
          366C3870D66C8E793AE7975351DC3B02A6643D5223005F38D59885D5947FB76E
          3560DDCB8BE11FF2C0608CC3E682D3D04645E3A3D75EC1B765C508525178EEE5
          D79139F779CA040592C68E0F318862562497D91B1A11D9751597AEDE407D7DDD
          E9C2C2C25DC4FA02B77EFDBEA609132C0F65CF1A8D2B03C9189DAC41A2FA1E00
          966E01B2440499B9FCDF25F880040A3C0F476F0F151B05E2E2E329E0042C7C23
          17E933665120AA903C661C7CA4B592CEC69032DDE42EFB9D7E44341C4745751D
          1A1A1AAE9F3C797237B13FC9AD5DBBD736654A52C2CCCC2414FBC7E1A124254C
          04C04F0078495E191015F95A47817668DB4E1CDEFA216AEB1A28A2CB91B36821
          5E5C958B8CC7E64015A141D2E8D1A14C60F1A1E6EE0170F40E81ABDC8FDAC656
          2A4C4D350505055F12DBA3DCBA75BBBB3332469A673C928452311D691615CCCC
          0524D51B942D114A315AB464854BA7BEC6DF7257A1B4B212ADADAD98F7D41CBC
          F2DE2778246B2E465812C193EF0556A6E95C24034D31D245EFFA6D6E48B7F6A3
          AEC98AE6E66606E030B13CC0AD59B3A37EEC58F3F8598FA5A0521C07B3251269
          7AAAED04A09F970573E17A49ED0064752C9E9C8238632CE5BB8FB4D663FD8133
          881F6986DF271724D623589D488890C177524A3AEE7441517B02D5F54DCC05D7
          FE454F08C0BBEF6EFFDA648A993FFF9909A8F38E424C4A02221432038EBB1F00
          7BB41490CD75CD3897BF076A950ED3E6CCC3B8C98F8684522884D660B8F18E24
          97B9A94975934B1CB537A1EABC8692F24AD4D4D49CBE7CF9F285900B56AFDEBC
          49AB8D7A6FF1AFA653ABD561307112A234A1DA229749EEDEFADDA2A2EF838334
          0F787DD04747873265B870E68278D23E822C6627FFF7912507AFE62338D88392
          B272141515ED2337B042748A7BF3CD8DD90683A970E6E3A99CC5A4477DD493B0
          98B810A3EF6B7F6F62900132C1415116CA84B346C4B2865540B34E2ED9776814
          19180880BFBA1DDD8E01B4B77708070E1CD8E3F3F94ED1F122C65EBF71E3CE32
          BD9E4BCFFAF938748B09406A3AB44A5902F73F6626292C501A361BB055C1C9A6
          6759D04DC2DDF4CE59F20D14FD8DB859554BA5D87EEDD8B163D798FF89AA187B
          C5AA551FAE54A9349F66658D47AC5E85566316122818116E28C33148C3010C03
          C234D713E878ADFCBB8F02D245BE77D9EC10CBBF8463D0879656AB74E6CC997D
          1D1D1D375913266A0FF11E352A29212767656164A426237B760695D8206C9667
          618A23E6C16152878390C22EA05543263792CF99D558937290DF07D880E291E0
          BBB28D4D5AB8555583FEFE7EA67D051D3B41544C34F89D72AA9C9C65CFA5A68E
          3D664E88D14C9D9C0AAFC0A13F793E62A92F2824790C63EE10C3B1C14CAD51CA
          42950A390E58EDE827CD7DF4CDE30AC2776D27B8A01F0DCDB7290E06078E1E3D
          7A8286DC725601592382DC6EEE3E86A54B57FDC1688C5B9B9C1CCFA58F4B822F
          C0C369CE823E31015A850C84A528AB8A0C0017363D9B9458E96597019601EEF6
          36F0D5C7A9712971DB6A85D3E912CE9E3D7BA4ADADAD9DB6B0FCAF080F59F7B9
          9705B669E9D2956B0D06E3EF4CA6686E52461A82012F863454E12CD3A1893352
          EECBC2D9C0C14E4BE17EC14CEFEFB1836FA6F4765A4935359A5B5AE8DEE0118B
          8B8BF329F7D918768E8805A0E3BE916CD8A362F563C182C52B9293D3562B954A
          EDC40969888B3580A7D19BE72220442621A81D018E8A90440122523594DCDD90
          FA5B20053CD48CD470B80660B5B641108481F3E7CF9FB25AAD6C9ABB14F63B03
          72F7D6F44349C6405832321E993F6DDAA32B743AFD3483418F91546AE347C492
          F9B9503764E3BA480141B7218A0B097E1A0EFA1C0EF4F4F4B24B8BC4028E22BE
          917CCE46F12B446544BDF8B1B1FC7B2046A8D5EA8953A74E7D76D2A4A94F6934
          11D378DEAFD0E934205050A954A1E8A601135EAF177EBA2D91C50497CB554A26
          AFA754A30E803A223680361039F103F7C51FBB1BB298A0B68444A287E3E2E2A6
          582C96D10909091683C1C0C0E983348510008F932E839D9D9D8C0254E1D835CC
          4A541B164CB704F8FE3B997F1AC0706B50558291C8CC6284052B11DD8EA10933
          66093010F66F6778651A0FE1276EC90F0260F85E2690AA3C58A365A54119FEC6
          84F0614DBDE1DFD28330FD0F01800B40BDAE3E250000000049454E44AE426082}
        Name = 'PngImage32'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322032333A35393A3234202B30313030B95D9F780000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009124944415478DAAD57095454D719FEDE2CCC020CFB2220AB88C6258235
          A2A80444050D6A4E6D9203354753CD49D31A4DDC1A456D3D9AD49AA551541263
          5A8D8011AD288AC66A144DB02A484402880B71618802C1619BEDBD37FDDF9BE7
          C04C3C696CF2CEF9CEBC79EFDEFFFFEEF72FF73E068F71D90066FF268CD5B4E1
          455E86691D26EC2B3E83BF177D053DBDB63C8EAD8717F3530635ED46B4BE13BF
          FDCE846C5F8FC0D8818366C13F6E32CEEE5984F70AF5AF159FB314D3B06602F7
          8B11D017C0CBD083594613669B6C181712FD8C2C62E87380DA8FA939BD0717CA
          8A60EC36752DFC145B381E7B694ACDFFA3C20F08DCDA039FEE6EE4B675604640
          688226226E16A38E9E80EE868B4CF917BB51535509A50250BA016DDDA8585988
          D334ED1F84ABBF8802D51F61A95C3762CD13296F69210373EDAB629C3B5588B6
          964EA8548042D93BB6AC16070ABEC405BA2D24DC26D8366E856C7620B25ADA30
          FE8FDBB1A6AC02DFFF98324E04DECD836C7427EA464CD9AC79D072B7FFDE8F37
          404EAB75A3D5CAE4BDE36C948D4A2262E8C0FD962E9C365B5072AC1AA525EF60
          64B7016F2B35BA84CE6E15535DD372EE937F63617983181E13C43CFE11020D9F
          20FD7B93F7A74F6597F8EE5C952E33522CE4F25EA7C2A5D54254C2D313F0F202
          EEDD033A0C404404BA222223DC75BA018C9C26F1BC19376E34A0BAB6B9FE6039
          169654A29CA677BB92702270692B0E86C72F4EE5399D47FED635D07A800CD120
          C6EE4C702EFCB790A002313F3F40A753222C6C387C7C62E9B919566B0F58D648
          304326E3A0D737A3BABA49FFF9652C2A28C37172D3D1978483C0852D8824C3F5
          635F3AAD28FA6B96FC7EB35E94DEC7C7BEDA878E1F2226C60F8307C7D3BB3072
          6A77C8B226709CF06BA55FFB3DCDC48307EDA8A9D51B4E5661F98E13D8470FDB
          C5177D0994AEC5DB4346CE5CE6E99F24DBF1EE52440FB0AF9AA3BCB65A414601
          33453130381823860F8646EB4FEF5822C649E009167AD60B9EB74A30E3F6ED66
          7C7BCBFC60CE26502DE3BCA4442F81A36B71373D6B7B684FA709B7AE15E176C3
          19988CF6118C8CE812119F8001489EF3311E54BD0F1BDB492F95929A3689042B
          39642558D0DAAA27B48B0B696941CF8B1FE02D9AB05BA8782702C7D6A37B62EA
          0B5A9B4C0BA52E8E821B0B43532DAED796A2B1AE1C5692DD440A244F7B09D109
          9968BBB2991293A4A15AB55186DA6CBCE8D47ECFA1A3A3891C378BCA09CE8510
          9A95234D994B2AB7D0A48F08D704E60F093047D6A22B23638ED64A7A330CAD8A
          8CC8945E907BC600EE91B8FF6D35EAAA0EA3A6E232327E330FD14393D1FC4DAE
          4B23616034B6A2BDFD26858D171D0B040478858E879989B5A4FF33B2B0F3F8EA
          0F68F01502EB2070680DDA33A7FFCE8BB5B294BD4AB1A90989C55162F1BC89C8
          F840E33D08D084A3E1CA59440E1C0D05C3435F9F4BE355E4B09B92EDA6580932
          199C9C6BFCE2E1DD3F159B2EC5B2793746DF61B7C56F2407FB092D0E02C5ABD0
          3E63A640C04A0614A294420C858C7624179517C7F640EEE607358548E33712A6
          8E46345C5A07B3C52A3A168D31BDCE15EE51F08D9A89D25B615874661C145CCF
          5DEBAE142107F610EA9D084C9F3EC7CB621142C0F4492C4E22601561BFA752A3
          D21372A0A5A5565C2D2373EE9422643EF01D9085EA567FBC70340D564E06056B
          68640BA71E9014A87210D8BF82149891ED65A56C6318B958564262D96CAC546E
          F60C1749302AF06C0755869512AD56AC7FD78BB729E11D9D85366B1032FF958A
          56A3068C9B16F2C663656CD9AA8B34E48013817D6FA275FAF4E77DCD66B3A400
          A4CCE6C4AC1608D81520A93D62D1A91905796715DA1BF3C5CED777F542C67B86
          4E81CC7318B28B1350D91C4015ABC508C569EEEB5D2B05F9EB84C2235C7510F8
          6C19EE6566CE0C10626EB3F512B08373D4B6A0865BE0181CA80DC3A16F3CB071
          D25928E59C580DBCA318DC296975D870361A79955445720D86B8D722E5BBDF9B
          738F62A7D07684E64BB8EF20B07739EE65644C0B10CAD0DE1EEC0DC6550501AA
          E0142C2B89C08ECA08F4533561E5AF2E8163DC4876BB022A850DE72D49D855E1
          4FA67884A8DBB132EA1DB4DFAA30E514600719DE2595A1C941A07009EEA5A74F
          2205387B1F1015B0B9A8C08B2170F37F0A433624A3A58BCA95629D157F1B6F3C
          370C866E96D460D063B222FD3D937DCFA6929EA5DE8E6747DC84F16E65CFBC6D
          62131250EFD4880A0402539E7609814D14D659050EAA80D1F8F0732DFE726E0C
          382BA53F8976E4CF01484B8A871B6DD571AF5C444363171950E04F53BB70FFCA
          21CC4E6CC0F52B953DF3B7E243329AF7834E98BF1877264D4A0C65AD8E48BAE4
          01DF874022F28E6991F6CC5C8C5F482731959C3627333AF78CC1DF8EF660C566
          CA318D126307717833D588FF54D56372F87134548B04F22402D79D09BC4E0426
          8F0A156A5A70C671BC531EF455411D9884DC235A2C58F006BEA8E391BDE44B72
          A8C6AC6405F695D33CEA4894F4289A6B44DCB091F86C6F111275876D972A2A2F
          AC28C02932BA4322D0DBCA0FE5A0844E1953FDFDFD64FDFA0540AD7623129C08
          BBE35E15D441E3B0E58807E6BFB21851D13198B6F4244A4F35D1894588399934
          32D83CDF8621515E4899988155AB7270A7E648D1CEE2AF3BA4ADF830ECC778A7
          BD2428211ABF4E1A84A4E1FD313E28D82DAC5F3F5F26305027B65896651D84B4
          C1E3B1A5D40B2FBFBA0C515191A21966CC4EFBC191B697A9896E782DCD86D429
          33E8F4AC424E4E0EBF7EFD7AE1E07A824072E10EC1EC4A80CE3FA08E81087218
          93188B21139FC4D0D8104C08F4D778060679C2DB5B251250070A047CF087852B
          E93816264E3E79518FB4E70F411EEE81E3CB35881B3E0AA1A1E1E23B89409E24
          BD507ED6DEFDD3F912FEAB09EE043AF1A1BF27D97A7A2806A70C4542881F46F9
          FA691431F193B1FD443016BCBE1A2121218EC971598731776C0F521282317AEC
          04C77389402EDD6E2534E05167C2471011B6170D4147A08E82A8707F0C4A7B12
          4FCC7B79C19483E72D41F35F5D4A67C318B15C1FB6EFAB75D5941703A91CD58E
          525EBD7A35B76EDD3A81C0B69F4AC0950C7D1D80F21ADE846042ECB3D392B323
          060C4BE3799B9C2A86230A9C404246E0C506D67BFA36180C97F3F3F3CBA40674
          DDD5F8E35C8C942B744E8610FC518418296CC0233E3CA4671669E5C21ED0FC73
          08B812F196C8C8FFC778E19B51F8286983CB67DA7F018C999F845F4F2DCB0000
          000049454E44AE426082}
        Name = 'PngImage33'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322032333A35393A3234202B30313030B95D9F780000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000008534944415478DAAD570B5054D719FEEE2E8B2CCA224F45C02508224A89
          C1DA24D2C4C4C4046A443BB16DAA8D21C674DAA9563B794DDB283B4E9AB4D39A
          FA40626A62C7D180F1D110496C92A629A881064122E1A18B8A82EC8A4060817D
          EFDEDBFF9C7BF7052563323933FFDEBBF79C7BFEEF7EFFF7FFE71C015FA34980
          707C17166907B0565461D9B003C72A4F61C7D14F61A26ED7D799CBD7845B19D4
          7308E9A611FCEC86036B62A72466CE9EB30AF1590FE1F4E1CD78B5C2F4EBCA3A
          57250D339379BF3500A672445B6C586577E0718784EFCF487F44A5CFF9311011
          27B4541F467DCD51D8AD8ED14D07B1C72BE208BDD2F24D581807E0DA61C458AD
          281D18C68A84E43CAD3E6B9510917E2FACC6B342ED2787D0D2D4084D18A00907
          06AC68F87D05AAE9B5BF935DFC561868FE1B9E53EBE697CCBDFFE548A820747C
          5A89BAFF5460A06F04932601619AC0D89A36BC537E06F5745B41D64526FDB90C
          AAC713B1BA6F00F76CD887929A067CF955CC8400D8BE17AA3B47D03EFFE1DDDA
          A1BEEBA947DEF813D4F4B5E1F4B52A75609C446AD41010CB306EF68DA2DAE942
          D507CD3859F5172CB05AF08A46ABCB1BB14E129A5BFAEAF6FF0B9B6A8D3C3C0E
          701D7F0500E37E147CE9987AF07B6BAA620F6C2950D929166A75C0296B9191E0
          4C444501D1D1406F2F306C01F47A8CEAD3F49375BA0C414D2F89A213972F1BD1
          DC66BEF06E2D365535A2965EB78E051102E05C19DE9D79C7334B44AF6ECA5B65
          25889C029A880609B233E69CFD7711A10C585C1CA0D3699092928B98984C7AEE
          84DB6D83C763277342A5F2C26432A3B9B9C7F4E1796C2EAFC147E4663818841F
          40FD1EA4D1C41716ADAB0E3BFAC7D5EA9B6613A73E2646FE5A9F639FCD9A1587
          ECEC3BA82F859CCA0E3D1E07BC5E7675D355BEA73731343488963693E5DF4D78
          E1CD8F718C1E0EF28E600027B7E195790B563E1F159FAF7A73FB7348CF90BFDA
          4BBA76BB4193024E8A62E2F4E9989F9B0D6D643CF5790898573191CC45CF0226
          8A6EC59CE8EA32E3EA35E750F12E502EE333858900807F6EC3F582D5FB926D23
          0E5CEB388A2EE32938ECF20841457009484C42061617BF81A1A6BF42F28C50A7
          46615352407814871EC55CE8EF37910DF20FE9EB836DED4EBC4C2F1C62191F02
          E0833FC0FAC092C72225552434BA2C0A6E262C3D6DB8D476129DEDB57013ED0E
          6260F1B27548CF5B8E812F769330891ACA5589142A4922772ADF7B313CDC438E
          CD9C39E69C85D07403B6E29D788D5E7A9DAC231880F0FE368C16161647BA896F
          41A0AFA249549A68A8A3660193D370F36A33DA9BDE434BC37914FE683DD27316
          C3DC5A3AA69008B0DBFB31387885C22672C70C003396453D66D89ED881BD3490
          D925469D1FC089120C2E2F7A2ADAE3F6907A35BCA83161794958A2E8203031D0
          4E9D036867C2F8C569A4CDBE13618208D385521A3F891C5A496C577826A85408
          71CEEE995D37C1F6E42EFEF57B150602002AB76070C54A06C04D1384712A590C
          99A2FDE2A2F4F27A6C5087C7218242A48D5B00C770278CE75E82D3E5E68EF964
          42C0793000C600856062004545C5D12E170B8110242CAF02C0CD4DBEA754A3D4
          631AE8EB6BE3930BAAD04AC9CC973DBE10745D876DDDEE09001CFF1D31B0624D
          B49BD426086A9E564C5892E451D24D56783010C6527F7F1BCF7F5F9BB1C0C0AF
          A224670E131F3306A0FA6D83EDA9D209001CFB2DFA8B8A7E12EB743A1506A028
          DBCB55CD00C88EDD0A20379F7460A09D573E5F4B2200C97586718BCEA5F9069C
          3A62989881B79F47EFF2E52B1358CC2529004036AF3FB77DCE65001229FE2251
          EDE471675F3AE3BB32807F6CD8002B89F7A3D6561CACA9E300AA0F1B6CEBF74C
          00E0C80BE82D2C5C96C0D250CE4EB9C08C65211808EB1F1CBCCC4BB16FB14ACA
          3320B5DE80FDBF588751BB1D351D461CAF6D4447AE8187E0E9B20900543C8BDE
          8282A5C48057AE039C01690C0B6248A513280D35FA3504C6CBF14A8A00F5670D
          D8F7F3628C52E5FAA4BD1D5567CFC3F81D0346470577DE2325A54A2132860028
          67001EBE6F4C0824BE6684B2106082B90C4F5B8B94FF6E1917F31D6B1F838356
          AD76B319072804E3DA46A4D16FAF1FC05BCFA07BE9D2BB923D6E31645C800171
          1C00C65478DA9348FD6C2BDED9B01103EE5178880D3B09D94EA164F761248E70
          5ABB9923DADBE05C77370E9CA967009EA5BFC702007E43001E5A98CCD9945819
          154374309E052AD52A099A99EBA16FD88A43BF7A1AFD23233C4C2E4A7C174D24
          9271C70482B1194E95EAF39E1E94D73532003BA9EB357F293FF122AA6897F183
          F8F838555252022222C2796C99C98EC7B3C001E87F89DB1AB76263C1120C93E8
          DC042092F66BE9F1F17013905E0265BC7183B3A021003D160B1A2E773300BBC9
          ED9EE0B5645A5E3A1ECD9F83FCDC54DC336D7A784A5252AC9098A8E325D6E3F1
          F801F9403000E1FA0D486F2A1917E2ED3F7D1476D2C0E94B97F0E1F9F6FFA781
          5006A8D1FE0709647A7238EBAE4CCC7BE076E464CEC0BD89F1DAA8C46951983A
          759202C2C301C90C6CA6F541F2AFAB2C84F3DA0D789500D8480B75573BF1FEB9
          56E6F004131DE4CD298B6F77B0067C8DFD8F209B4C463B3EA4466991755F0EB2
          EFCF41DE8C382C8C8DD38625266A2844022FD39D9D765A8245DF964D4A5BFCD2
          B5FCAE17D376AD5E050709B1B6B313950DCD0CC03E9AEF38E48D88A400E99DE8
          64C49EB3E5454BA6238B27BB6D663CE63C783BE62ECAC2DDBA28212321412558
          2C22E5B7849B165CDCFF31EA5BBAE0A4E8AE7F227F211763477F7F70CCCB201F
          60FC49762B67435F06D19E1853C9A69365E4A621FBEED998979184B9B4E53E7B
          A6154E5A80AE50DFE7E4EABD89623E06C0AD1D4EC78C675AA17D3268BF8C14C6
          8CC2123B19B5413EA4B2F0FD90855061D21F732504DF184070532B7AA1D303DF
          9DB24307DBA9B2F3211D5D304DE9F7351E73E5EA6FFF0346B9FE202E21F75C00
          00000049454E44AE426082}
        Name = 'PngImage35'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322032333A35393A3234202B30313030B95D9F780000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000008BE4944415478DAAD57797013D71DFE7665D9920D12C2880076F081CD99
          108E1206D3C603641A48CA9196B414427081F68F1E21336DE80C0925439B5026
          A14DB8D3006D08C51087861B87803147EC54C1766C8C3136D8D8D8922DD9E83E
          565AADFA7B2BADAF608674B233DFACB4FBDEFB7DEFFB1DEFB71CBEC51501B823
          5B91A3EDC44B128FE75C017C72F412DE2DF802667A1DFC366B2917F730835A0F
          20D3ECC68B6D012C1B3C6068F6E8B18B3164CC0F71F9D02BF85BBEF9E5A3A5C1
          A334CC42087F6704CC07A177FAB0D81FC0F24004DF1F91F9233EEDB19F029A64
          AEBAF8104C170BE0F7063C6B3EC28EB0848F694AF5FFA3C23708341D82C1EBC5
          F64E17161A53A668D3C62CE634994FC15BF71557527400D5156550C701EA78A0
          D38BABAFE5A398A6FD9370F33B51A0EA1F7855A59BB461FCACB712C183ABFFE2
          284A2FE4A3D3E646420210A7EE1E7BB1069F1EBC0213FDCC273413226FEF04BF
          7C2896DA3AF183DF7E800D17AFE2DE8394E94560CB6EF0D3DDB831E9996D5A87
          ADE5D18FF76C868A761B4FBBE555DDE322148D6A22E274C16AF3A05808E24461
          154E9F780753BD4E6C526B7553DCDE04AEAADA56BAEF73AC29A993DD13801CC7
          0F2050B70F73EF05067DF4E4B213833F5C3F97F7932F54AA6EA3EC4A4C84ACC4
          C081805E0FB4B7032E279096064F5A7A5A924E97C5A968922409B87DBB0E5535
          96DA63255873A20C2534DDDB97442F02E53B716CE4E4DFCF96C2BA01FFDEB901
          8903400BD1202E6A8C1967FF83242823969C0CE8746AA4A64E84C1904DCF0584
          423E88A29F2080E7C3309B2DA8AA6A357F5689570E5EC45932E3EA49A28B8069
          07D269E1DA9C95C571057F5DAAB25ACCB2F4064374B78A6105A3462563DCB8C9
          F42E958C460D8A6200E130BB87E81EFD4D33E170D8515D63769EAFC01FF79EC3
          27F4D02EBFE849E0F4466C9A3075D1DA814366F27BB7BC8ACCACE8AEC314D7A1
          10685140202F0E1D360C93268E83367108BD13895838068910A467DD90A4500C
          029A9B2DB8D32438F2B6827219FF8D29D14DE0CC46B4CC5DFA418ACF1D40537D
          019AEB2E21E08F8EE078A24B440CC62CE4E6ED81A3E2EF88886E7AA98EA91989
          91106306C51882E8E83013ECF2466C36F85E7A0F6FD184032CE37B11287C13DE
          39B3972446F844A87563C8B9D970B6D6E056CD6934DE284188640F9002B9CFAD
          44E694F9E8BCB68D0293A4A15C8D50844622926C34FA3B0C97AB950C5B64E598
          71E642731B7C79EF61174D7A9F50DF9300776A233CF3E6E52586486F8EA35DD1
          22BC5A0FD5C05140523AAC77AA70A3E224AAAF5662DE0BAB91F9582E2CD7B7F7
          29241CFCFE0ED8ED0DE4364936CC0830B02C6AB5C0B7E25DECA6810CB798745D
          048E6F807DFE82557A312452F4AAE5A2C6022B4C8125490122638076D058403B
          1275D72E237DF474C47112CCB5DB697C0219F452B035C899C0F3E8659CFD6668
          31C3F78BADF2EE77C714E82670743DEC0B173102215A204E9692F99045745770
          517A85451F54F1C9D0908BB4C953117035A2AEFC2F108221D9B0BC18D76DBC27
          01A600B9A07F020B16E4E98341E602AE476085E5C08A46B64286528D528FC580
          CD56232FCEF1BD2B2583923D8A0B9A5BE05BB9AD1F0247D6C1BE68D91BFA70FC
          3048B64B14F5A21C582CA0980AEA61B910BD2D10EE55920A824C84A9D4D15123
          E77FDFAB67FA32B020BCDB0ADFAAEDFD10283FFE1BB7CEE44A6A38598AA70EAD
          8568FD0C11299AE709E94B50F6E22620673CC63C9F8CA0BD92080AF2AE3A3B6F
          C895AFE7EE99312506943B7BC65CD0AF029FCE9A18CCF438E2ACED2EA4E42DC0
          C8452320DAAB9090B114E79F5885A7671A51FCA515334D3BE1AADD2DBB852960
          B7DFA49D0AB2DF2529BA584FC38AFF1931A6C0EA1DFD10C8D7C64B73964F02EE
          79F09FB377F042E126243E62C0E1EC157876EEA330A66990BFBF01F3E9C070D6
          EE92AB208B13BBFDB65C8A95C34AD9AD625881A2C02F77F643E0704A7278D6F7
          8C9C71F4105CBFD48812178FC02D0B96CC1E0E636A121ABFB6A126753466BC96
          036FEBE772D1E1280D3B3A1AE5D453028F1952D097401B15A2D5BBFA2160DAB2
          DA7777CB61CD8F7F36419E5156D488C9E30DE0075043E0F2E3FDC2362C3EF63A
          95E7331005BB4C802960B335118160AFE0BB1F0146AEDDF60005AE9DDDE8285A
          F8A6EEE515448052512EFE727E49D89FDF80697F5E8EC13344043ACABB6A3DAB
          98562B658610EAA500BBF724A23CB376C804EE5F09CB0FFCC17565DD87037E92
          A5C588143AF883CC7804B71BDD28B2ABB0F8C85AB8EAF7C8D1AFD4079E8FC8E7
          3DAB1D0A81BE6E609720C84778E48E05A6750771811EED8D118896F2E3C07473
          92A664CEE3063E6B0275191E21A65B989D353872C68CA4DC2730E54FCFC2D374
          3076D48A3281D6561B1910BB825031CAFEB380A4A60A9D4E341DB884CBA67A78
          E85519E124A1AD8BC029BD26322DE711188725D1911794776EB3FA611CA8925D
          61F388A8AD7542983105E37E37169E96C22E055A5AEED12919EE32AADC7D3EDA
          8707CE635771F64C193CA2843BF4AA82709DD08258A3CA513BBB3E235BBF71FA
          CCE1649C7C1FCFE1CB2BEDA86A70E3F9A78994369A5B3641C2D56B6E4CBFB019
          B6CACDF428AA4053938B1408CB75805D2C1EFD7E844A6B71767F3175EE82FCC1
          5249B8466825B04642EC3A3FF75173FBF345193ACD20768449283AD7866316BF
          8934AADD9CC02FCF9D61E08C7A4EAEABF9851E3C59FC063CF56F43A3E168A722
          1A1BFD6450525AB648431B4AB79F427DBB130E443F569871B67B47CC70EFA6F4
          8421C19499AA9D969DA143C1C9BB917F49918222528F44BDF90CBDFF75926A53
          808F700EB724E97FB5C45425DEB46524548CD5EBB82CA391E79C4E89A4A66C70
          E2E6BE73305537CB9D6F6D4CEEDB848E98DCDF68C9951818716450FCF91B8EA0
          F5F5A844CC3FE584AF092C68282F31833088108A2D18783C0D4373C6607CD670
          8CA796FBAB2BD721481134C4E6320256023B24243CE06204A8CB47366126A29F
          566C01F695E38C4DA6E61C941A7203C8FE0B3129D9F314420641179B5383E847
          AA070FF999A6D401466270CC80E33E92DDEF239675009A181146CEDB37C01EE6
          FA1FECB2416C3C2EFFF70000000049454E44AE426082}
        Name = 'PngImage37'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004D6920323620466562
          20323030332031303A32363A3430202B30313030586F47FA0000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          0000073F4944415478DABD577B4C5C65163F775E80DDB2C020100B920E548AF2
          46454955DCB535E93FFEA1B6AB311BEB3F66D3D544AB495363B549B56A59D6C4
          5789D50AD3B5542832B653DAB2EDD642718A2D14959696679D32830A0CCC8301
          EE6BCFB98FE1CEC8D0A649FD9293EFDE3BDFF7FD7EE7F19D7386816B8C1D3B9A
          4DA5A5C5F74E4FB3E51CC715308C2E93E72115808F13040096658382303BCEB2
          73C38140E0A2D73BE6B0DB3F3FE370D8FDB81D5780B8D8F94CB41FAE5EF5E5B9
          5CC68D3E1FF784C924242F5DAA0793C900B1B17A3018F4A0D3E1E978FCDC1CC0
          CC0C0748107CBE004C4C7871F6FD86646D6E77FF676FBCF1B76E3C6E5621736D
          026EB73FD5E532ED0C0685A79393419F9A1A83C0B810578A8A2E6801099C849E
          69783CF23BAD9B9DA5737E83911137E7F57ABE3A7A74EF5BCDCDBB0770D95CA4
          45C2085CB9127C787858B72F2D4D4C4D4F8F414DE503396E1E4C3B13219A8341
          1954FD266A2006069CD0D7D7EFEAE939BDE98B2F5E6FC64F3EAD359879CDD9D5
          7D7DDC372B579A621312749289092812946602A09940C9055A8B6885D6E9F500
          93937E3877EE6C00E362537D7DE501849B504948045CAE19CBA54B70363FDF94
          9890207352B5D69A9A0E645959087821D07011719F6C8E40C00FA74F9FF63436
          56FDA3ABEBBF2DE435728784D6D9C9DA972E15D72E5F6E0C33B9AA0581D337D2
          98C0AF0DAC25CEA135797C6630265CE070B4B6EDDCF9F75711968233C8381CFE
          228E339C2B2D8DD1C5C4C800AA6FD500ABAB6B0D3DAB3ED6FA5AFB5E51F180B2
          57542CC023791EC8B253530C7CF75DBB5853F3E6D69F7EFAD68A5B9D8CCD36FA
          565656FC96952BE342DA6AB59F9E06F8F9E7B1B000D30660E4F764BC3AF3E617
          4204CC6606638187E1E111A8AFAFB6353555BD8F043A9080FB7861E1AD7FC9CC
          D487FCAA1EE6F7CFBB23123032D8A2995F25101707280CE69769686AAA1BA8AE
          FEE70E247088696C74F69597A767A7A44018019F6FDE1D767BEBEFCC1DEDF9C1
          071F90B48F2470CB2D0049493AB4A600870E35B15555CF6CC76DB5CC8103CE2B
          F7DF9F7E7B5ADABCB693933219F550B77B2CA4250D55C3859ECDE6E410B820F0
          921B5896477006962CD181D3C9C1E1C376A8AC7CAA0AB7EC62EAEA06BBCBCA32
          0B525274A18CA60D38AD8FA3F93FFC99B41742FE271273730264679BC0EBE5E0
          975F78B0D9BE663FFCF0D98F11E213A6A6E6C786D2D2ECC7E3E363A346F79123
          AD61D92DBA1B4458B56A95065C90CC6F348A9093130BBDBDD3582B021884D6FE
          BD7B37DB704B35F3D147AD2FE7E5E5FE2B2BCB1CF279E4E1A3A3E12E58CC3249
          49892170D9FF02AC586194F6F5F4046168A81FBEFCB2EA9BB6B6BAB3F8C9CA6C
          DD5A9B5350B0EAC7B2B2E54635C92C74BF238122DD41DA93E6043CEF7B013232
          0C101FAFC77A10C0AA0970F0E04176CF9E97AC3EDFF82984384C9930A6B6F682
          352BEBB627972DFB7328F8A2115898C4BCDF55B3338C08E9E9068C7E06036F06
          9310C0F7DF9F8196967D074F9CD8D38FC7D7A39C2702CC8B2F56961417AF3951
          5E9E1F4F45886EC36204C249884AE0F192C6546328EB99CD7AE937A77316EB00
          83E6EF8653A79ABB1A1BDF3D2F081C697F146554AD8671DBB6353C6FB1DC5955
          5696CB688B8F56A8B2A90589488A92A9442CDB8214687171A2A431D593A9298A
          784E22D5D1E1C07AD37AD666ABBCC071B3E71570B2C29C4A80E6A4D75EFBCF2B
          164BDE2B4545B986254B8C61EEA041B9427E1795064526A05EBFD95911139880
          D74DB6CAE0603F74759D673B3B8FD8DBDBF77BD04A3FE086FFA15CA64214D990
          A07E90BA6EDDCB4F9794ACD95456764F5A727252C81DB1B180C12427296A54D4
          C42397675E212BE2351BC7481F44F0617E68A8BBEDE4C99AA1C9C9512ABDA479
          07F53D28336A6714D992D1D1B76ED8B0EDB9356B9EDA9E9FBF422AC134B05C4B
          CBDDEE192C2803680146CA761470C12005D9248C8F8FB11ECFAF177B7B1DBD3D
          3DC7FD7EBFC7A798BA5B99C795B66CE1964CB5C4FAF55BEFBAEFBE473B57AF2E
          D707254309A83D013218C917F02AEDFDF6EAD50B2E9DCE28A04F79BF7F929B98
          1861C7C646E89DB4FB55D174106544E98066B4ADD8620468C4BCF7DEF123C5C5
          C515898989A8252B151383C108C78EB5C3071FBC503B30D0398CEB06145FF20A
          0069EC51666ACB032077C4515BF36804982D5BBE7A222565D9FE871E2A67A8E5
          A6AEC66C3661256B875DBB36EDBE7CB9E318AE3BA300890A0956117E31D0EB21
          20B97DF3E67A6B4E4ECE63797979D898042125C504274F7683D5FA4E6D7B7BC3
          7E5CD386E2BD1EA01B21A02F2CFCEB8A8A8A67F615141417E5E6E6E25D1730BA
          9DD0D050DB525FBFFD335CD3A2F8F7A610A0119399995FB476EDC6B73332B21E
          2E2C2C601212E2D102D6B14F3FDDB89DE7D9065CE3BA5E73DF0801FA1D9B29B8
          E3914736ACB7584AD66564582C5EAF0F63E1E3F72F5E3CB51B7FBB84C2DD2C02
          EA1AEC97E136BC76F9D9D925E516CBDD77EAF5A669BBFDDFD5202717FFCD24A0
          0E4A527F42C17FC6703B8A1964F3539299FA230868896062965C43D78D6EC10D
          BBE0FF65EE3D5FD1FEDFFD0000000049454E44AE426082}
        Name = 'PngImage36'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F20313320466562
          20323030332031363A34363A3338202B303130304D1330DF0000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          0000039D4944415478DACD976B48544114C7FF63566A9615F8D8D2EBEABABB15
          1111590459910411612F7429948A4A33CC348AA82CA28745DACBA8B00F7D337B
          28450FB2B2B4D78785884CA84C0823B84224259914A5DBCC9DAE7776BC57FAD2
          AD81B3337367EE9CDF9E73E6CC5C827F5C8845DB8E12E04ACFFC984FEB1D0809
          4DB345EDF7AEC778FFBC02656975B4F795013CAC4CB547796B17E0EF001EBD7A
          EB47896B0B7DD4445019086CF102E54F3EDA62004446026161401E29A6BD1A0D
          60593C50DBF2D51E80A14381D05006504E7B673580884140778F3DFAFB4A1EA9
          A0BFA7358067A925404F2FD04BA5A787D7815EEDD994961338E651B1604C97F6
          5E20C087F5A9ACDFF78AD0361B671215158E192F1218C049BADC290DE0DDBC03
          5012460503B03A4401399F85635E153E0F81C3E1D020F46171AAAC581C139F33
          F727D6410248DFC7019A9B81161578D30E14FB8041891AC0F1712AB2DC0680FE
          AF640033A03F0398B387035CA907BE7C03DA3F0145591CA0DA6703C0ACDD1CA0
          AC8A07C8874E60FF1A1AAD492017EC00985902257E245F598F3256873A412E2E
          B70160C6760EA0AFAE43300B5C5E6103C0F46D1CA0ADCD08C2FC45C0600A5093
          6DC32E48DD0A656C1450EF3782307721CD5A2E90DA1C2D0FF8BC1C40DCD7564A
          ACC67500E76D1960CA660E5079DD08C29D2B8021C9205756F601C4C5394C938C
          2E66AED1E70F0C30B988038831C0242C05E4EA2A1CF57017C4C63A82161417B6
          B2809C09D9519074470698540865CC080340AFC3DC20D756E3488A8A4C77B005
          645798A561334806907C57069858C0013A3A8C20CC4907C229C08DB52873F15D
          1013E308DA246667809962719CB9A03FC0F87C0EE07F690461F65C0AE001B949
          0192552C73055B40B484158C194478B81980378F0354351841B8290388F082DC
          CAC5E124154B93790C88A7A1D8B6522803310057BD0CE05E07C531DC38ABF538
          184601EAD6E39053C5126730809E0FCC44562E423080947B32806B4D7F002691
          E340EE6C40A9422D9044101D6D6442D90AA2322B301DC07D5F0670AE32B70003
          A82F4069828AC54E230865C5662EB1B2424404E0699001125742898BEC6F8111
          1340EE6DC4010A9091D07F17886E182836440866016FA30C109F0DC5334D0030
          9AA4A1100713552C520C00F9CC12DDA243891612DB4DDD40A65FBC13EE7DBD0B
          B1DEBD7FE5E26955AA0B2EA1F1542B6D9D639F63A3A9CCA63295791D7FFF138D
          D990DD709F5279C094D14B3AD84130F277DB8EF293CA672A9DFFC1C7E93F2EBF
          003CB6D8098963581B0000000049454E44AE426082}
        Name = 'PngImage37'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002A744558744372656174696F6E2054696D65004D692031204F6B7420
          323030332030303A30323A3133202B30313030EADFE1C00000000774494D4500
          0000000000000973942E000000097048597300000B1100000B11017F645F9100
          0004BF4944415478DAB597596F1C4510C7FFB34831091F800784E003F049102F
          483CF3C20B0F38F84251204E0212011CE770C04EB013C72202E1F888E3D82010
          20848438C31143221024183BF2B1ECCEDE3B474F375535B3B3871C7B0DBBBDEA
          9D99DE9EAE5F5755FFBBD7C2EE8AD5643FD3EA0181411AD4D40CAD6B4CE99AB6
          7E3C4ADF1B549D96037CDE3B8DA2CE9151B26469045AC3F03D0DA38DC293039D
          0CD0470DD354975B0B701C66B1671C052F0BAD15190C68C28A201454E0E14EEA
          265E7D6F0E388C21EA7D96EA6FAD04B03000BDD07B01393785ACBF4E863D28ED
          0B40D1CDC1CEA5716AEA53E008DEA4FEC3547F4713B9B02B80C59EF3C8B849D8
          FE2A7C9A7540005A07E4951CB2D9028666DA09F0067B8000BC4DD8EE4A0840F1
          D7818F929F472657C4D0D427C0D17601BC4E007D63B09D0DA43D02A010F0EC95
          F1E0B80E72F91C4E5FFE0C78B95D00AF415FEB1B15801401A80A8076E1780C40
          2198FA7F00DBC31C83BEFAC2DBB0CBEB04B02CC917E680A61094512810C02401
          BC220023D8791598AAD1931169ADB86C51AFF69C43DA5F43DAE110B8021050BB
          E316A1948F81773EBEE7BB7575B02A5631C017DDD3C893C818A2B0F8DB582C2F
          7435F21C109CA7C8D52A29004A00588C02598EAC057B3B3AF0D0038F614F621F
          252779887582925419EA1B0458CB2CE3D8D83C70A22A5621C009980FBAC69177
          4964E08BBA19CB887BE901DA62C5336234EBAEC3D525F98D8D6B4D70C69390EC
          49EC45C77DFBC4988A4214DEFB9227E9541EEF2EFCC0F662B1B2240C8394E15D
          E769F014CD705D06247B347B36ACA2AB0955CF78625C00580DE9CA605A877D18
          C8483BA2E7085E05B0D365BCBFF8237B3C4ED418E0DAF3A304F00F89CC5DC970
          F6027FF865B997419584A4629C29FDC0154F548DD78298E81E04A008A084C9C5
          9F80538D00C7A1E7BBCF21E3249172FF16D749E44D50356E42776B79D6924DBE
          F2E2F6AA615D67BC021302B8B8CC1E38DD0830C00067912AAF21E5AC4A08787D
          B0CB65B7339024E41D2F0C4D207B81B817D59973C720088D72E1F8F36F5C7CDF
          4736E36072E1E7AD01E6BA46902CAE20E92C4739C0962C49C68A8B13092B5AFF
          2A8A2DE21071552A5C67F26AF44E350401F2D90860A81180747EBE6718BF6C7C
          459BCD268D918896A0158B83655902203261EA5D1C907B7C9F00FCD0282AED15
          CF70138D93CBBA98F9700938530F00D279D38C80F43FF33819B364CD57E26C91
          873C2F805356189DFAB22A64B5A7A4C653D499FA65C8E511AA4F517D986A624B
          E13C82CEE1FDCF2199DFA0EDD78E938E27CCB12E163C5C98FD1A14CE796C7F24
          638C957A2102EEA7FA6074DD7ACF388C5B13BD4771C75E42C1B5E3ECE6D07086
          33C0F8EC377C721AA3FE33088F64F7DA8C9C7A29AE18D9AEF4438F771FC29FF6
          0D94BC7CC332D3027071F65BD6F9FFB019ED5C2C1C821EEB39803F524B24ABC5
          3819791CCEFE52D1C5C4EC772CB36D3A0F10C0C8FE6EFC65DF8443DB6F0540C4
          89965CB9E863E2CAF76D047809FA2D4AC2DBA95B721C33C68AC4275CE3A5A287
          4B73D7EB74BEB5002F429FEC7C16B7377F8D8529AC21082FC34B57AED7E97C6B
          010E421F7CFA09AC26D7C0270516194B362B4B403C37C0F44737EA64B6950020
          80A6C48A00DAF2C784CBCE62D52032AD06D849AC2A2516995603ECA67FD37FCF
          FF059F8A6063172ED4E50000000049454E44AE426082}
        Name = 'PngImage38'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F20313320466562
          20323030332031363A34363A3338202B303130304D1330DF0000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          0000052C4944415478DABD977B4C53571CC7BFF7F6016DA9852248284F29E2E6
          988F4D902D08CE67B638C9903FB665C9E216C91232B3C43F8C6E1331FE35C886
          1B2A4BB6E1DC821B9BDB7419A84CDD164DCC744607CAAB156829657DDC526879
          F5B173DB152FD7B630A99EE4472FF7DE733E9FF33BE79E7B2E8587545A12E57B
          6C1EEF6B16C661B2B9BD0DFB801FC8E951126EEE7D5488E37915FDCAD4BD943A
          E9201D2DA0CC061B34ED066F9FD1DEB00BD84F2E0F919822E1F5438F4E6D21BF
          7B410B0B23012F4D76A0F6E82AA8D62CC5243306633F83413D83BE4E23EAB77E
          840B4F6DBF8C81B65A7C50D8426E77B002BFD7AF8E0C3C4E348554AA1BE9FADB
          509C3C08695A1A4C04AEBB6BC200895E3A194D356DF8E38EF62ADECDDA4DAADC
          A450EFF5EECE01AA2F9BE7059744DBD0986B47E1AAC550C4C762B4A91EF48F75
          7045CBD1AFB5A25F33848BE25C7CF8F659203A1A28A7DE21D5BEF30994A600DF
          773A1E184E0BA6B031B70225518FE3E58C5D5024CB6027E775271BE0FDA41263
          A393B861A4B16FE7799893B201A19015A826B77CEA13900A00A7FB81F9285257
          616DEE0DC813C490353F898DC9AF42A410A05DAB418FA607E3A74FE1AB159568
          4BCDBB57A99C3A4CFE1EF109741677CD19E62573D7E3F1879B48DF9234A35DDE
          8AC4B87848A344709027ED9FD3126474164028A37147D3812756142385F49CAD
          A3504850702B9515F8983457E713B09631888B8B9BB34400DE367619274C07A0
          4A4D864C2CC6D4841B8C6D1446C6027DFB08BC5794285B5D8EC2FC92E93AECF0
          A7B7607E026C160C137751A3DD09955A0599500497CB0B1B819B4CA3D0E9CCD0
          DE1DC472E57A1CC8FF8CDC4F455660C46DC3A1F61D88CF964316258697343E6C
          73C26C1EC6C080155AED10D2B012355B4E82F208670CD9BC055C6411ABFEBB02
          DE8C11C8655208C95A66B38DC16AB5939E5BD1DB6B428C5385635B7F46142DF5
          41232AF0A5EE10B4E2BFB070612C44B400C3C34E582C0E180C16F4F559E032C9
          D050DA8218A1721A1A31810BF6469C1DFE1AA9AA451051028C8C8C81619CD0EB
          AD242C60742E1C2F3B87C4E8946970E404DC5378EBFA3A2CCB5B0A3168029F20
          7032E38D361F5CAFB1E38BD266642EC8F181222E306E1DC0EB175FC073A5F918
          1F9F2463EEC0E020E39B74DD1D461CDB760ACB13F283C2B9BFAC40C6599E8065
          3B03A532BC80A1EB4F5CB9D5802331CDD8FCCCB3D0F75BD0DF67C6ED3B7A546F
          6E40A16A93EFF10CD5FBB002A69718C4C7C7810AB323B8D2DA8444970127BA6E
          E01BEA17C8955298871CA85C5B8B6DEA576640B80201A9C0F5A82820F31C4F60
          A8C49F019A465009B691C3B5D518B76849DAED88216F3855C132E4AD5987EC84
          654141C17A1F10587C9E2730F8A25F80858712D8FFFE1E389C937863C79BC852
          3FE65BDD028D72E1C1C0DCEBEC10DC2760D8CA203636BCC099333F91D9AE4356
          D61214156D2067E9693817CCCF045F42220922A07BDEFF148413B87EFD9A4F40
          22912223438DF4F4AC196FC65040BE102B90D5CA13E8DD3CBB80D96C262B5D2F
          4422F2CE972D40525232D95788830AF0E15C095640FD2B4F40B3E1DE63184AC0
          436A9B4C26325105904A65108B253386800B0B26C5CD40F6059E40CFFAB92DC5
          1E0FBB93A6EE03737B3E5B16A45260C9459E4067F1BD210855D806B8C142FC52
          E145F8326C06722EF1049AF29DD894E97F75CE4580FB7F40842FC5CD10F7F8A6
          1328BB0ACE9EB0AAE33D2CCAA99A35FF912C8D15DFE2525D3739FA9C4DBA9244
          1189A749C420829F68A19209FF37E23512BFB130B249878244EC7FC78FA2B848
          D8480C3F948FD3FF9189470EBDAFFC0B7354B1099AF2953E0000000049454E44
          AE426082}
        Name = 'PngImage39'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000000097048597300000B1300000B1301009A9C180000047D4944415478DA
          C5976B6C536518C79FA7ED56B7DEC646B7CEB1B285F8459D2809A068BDE03733
          2F502E2666334CA32C29D12F2533C648A2A28D38757C111354E083D118011363
          02614EC2D8704CAECE206C51866C75633736D8BAAEAFFFF7F49CE6B4DB7A7138
          4FF24FDE9DC339BFDF79CFF33E6F612104FD9F078FB9B9268B69B7FC23384507
          4AAF081F86FDC8C4BC084C2CE62126726827CE84A879798F7809C3CEF990E0D0
          629EF60D4E85A865658F78713E24B87B11EF2F32D233FF95C46537379888B674
          4ED23B9E1ED1805383C8644C0029692BE6AF9666D383B752E242292FC835D01E
          A3A027E514FBAE89C0FE31FA1EC3D3C875BD801959D2E8E28687CCF478E283DA
          21F140861278EB72663A08788584D70FD34F1F0C8B660C7F407E416EE8054895
          28DF55C0FE4D56AAD12E4610A1CEC4AA3425FE70F3B26CA646DCE890F7BE0FF0
          47C3D48EE1313541F5D171029A44C9E70BD9FF9C85366B70A1FE6B29E1492171
          054BDA88252D5B8BBC2F30244E348C509B0A6E41AE2261FD3D9CF00CD40BDD0E
          89BA672D54ABC1351129F1C82C1280EF05BC4AC26F0A9AD83628DAF78DC6DEBC
          7526F84C023189D7F3B8E6553BD5DDC664D68BA04FB43CAA93B8182DB6830622
          8F84DF1014AAEE13478F8F2BC526BFFB49A47726F86C029A4451AD8DD66D5BC0
          01B32AA1E52C241E83446B09DB4B4DF429E0153AF831C0E5B437C94943AECD06
          4F26200F2352E0B3D33ACC46BD2641EA6CFC3E4967CAB26809E056091F133429
          E12DE3F4332E3752B4DA07F40597A9803CF07CCADF62A7F5AF38F85D8721DAB2
          F5C5A98337037E2213783A0231897BD1A8F615F227E89A2E3D5C8EBD4171B475
          42A9F28CE0E90A2812FE3C76D758E940BE9196EAE172FCE3387555FF2DDEC6F0
          3045AB3D2D78DA027FA2B960CBFE02455191088F7E0EA6D3216A7BBA37229BD8
          45CAA06DA714E876F36A74B66F317468F05141612CC78195662A94704DE63C56
          C753BD918CDA765281BFD0D94CEA8F153DFCF968C19DFFBAC8F0F00AB33A2B6A
          CE41624D06129C04BE17F02A3DBC2B4CD7FD03E224E0B2B31D4706BF731976DC
          954DF7EB0BF35748AC0DA627314DA0139D2D079D0DDFDBA33D50391FA6D13541
          71A47F4A69AFB2C39DA5E8AE56B6DBC9014F0E576AB521D301096F1A127102D8
          469799128A2D012ED77913F21B32A2BEB4DCC4CAB6E7B37FAD855FD0372B3913
          1B5248C404B099ACCE4A2836F9B0AE78B85CE71DC8A8FAA2DA918D9404F2796B
          A5853793EE62470A0945E0AA5A6C890D264DB876289BD87B055C5799CBB5FA0B
          C92418CBCC8B3EFFCD1CE171121BADBC716B1EBF25F78F54128C5F30DB73985E
          D3C32F01EECD1CAE977056DBD88BFD63472A093EB5887D2E23EDBC4570ED50F6
          8F4D365EEF73F087C924640D383E73F21B779868435F844C2FF78BE6BE29E547
          44D3BF844F93A8B2F19B85462A9A4982B5EF86DC8394ABC073C88539C0E324D0
          A856ED5C68D805099776E1EE6E65DF38A42D432961476C14FD4FC31072738E70
          BD84FD3E332DAF2F30EC711AA9F87298469EE8897C8CF35FA6BB1DCFF5901C2B
          7227B20229462E2147E64B4093C8459C8885A29FB7EF1F044371B0B96674AC00
          00000049454E44AE426082}
        Name = 'PngImage53'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D650046722031392044657A
          20323030332031343A35393A3435202B303130309EA896800000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          00000A764944415478DA9557097454E515FEDECC9B253321C9642564D88C6008
          1250106531808845AB476A0B8A525CB1726C29A7A2E51C5B3974C19E537A5C40
          D6200482018242892B8B948480240A02D19010B2989065F699376FDEBC375BEF
          FF666213D096FEE7DC796FDE76BF7BEF77979F4362F5F4F4983FEB4C9E2A29B1
          C91613372ED9A81DA2E3B83C8E8359ABD5E6C8E128C2E11842D118C291287C62
          D8130885FC2EBFEC707815FB159BBFD7ED953A755AA5255B2F37CFCD71362C79
          6A81833E1D49A888E10716D72D08D9B51EC3DFAC49FCFC820C2ED94417858002
          51E110D1F0F416072D076835809E27A1A3411BFF7FED8AC462B8D029A3A6C58F
          936DC148B353D7D6EEF09FCEE5BDA7A7F1C73FDAB46A45373D16EA0F86DBF845
          A86EC99DFCA4EAAFBAB1AFA61711AD11C3AC29B0E60C42568619668306C9A4D8
          A4038C7C5CB9BEBFD0350D871F5D3E298AEDA71CD87ACAA35CB6CB47E764B6BC
          FDD1AA7935742B4012E5B69E91C5E726EB4D63177F8A9B47A6634C7E3AF2B249
          79A61919692698C8E424529EC4270024BCD0A79C1DFF1B80FECB268431EBCDD6
          28D7736EF5371B1EDD4C979CDC865381BAA5538C932214A9B5EF5FC177EE2846
          E4A5C19A6B42260148D669602400A67E0074A454A7F93F0090C30585C2C63C49
          CF5B5E3CDDEBD9307509DD39C9AD3BE1D8F57061CAA2243E420A8DEAF30D5725
          F4481C429C9E94500874F11098FA3CD02F042C24B80100FE30D4EFB0657CFAD3
          1679C7FDDBE87437F7CEF18E9553470F7E3D5BA7C04BF18A10ED53499365904E
          B59E3126443F0A79881240650F23259FF0020374A3EBF4376EBCB6BB0967EAAB
          8E0895AF54D3A55DDC9B95F50F8D2D283834215D819B0084A21C318303C7F3AA
          20C6A92E37F6899E946BE220D444A09F1821A3048803A4130636100CC31708A3
          DBADE072A788FA76015E6F00755D0A6C759BF6384E9532227EC01D38706044B8
          605ECBECC112E70AF401D04043CA355AD2C8C0403DA8B16656B3239F387289F4
          93235423A85628A128C460845239042F91CE2DCAF0FA64F4BA65B85D01EC6D92
          A13DBAB4C4D9F2F5517AF5087B9FAFBC1AEA2A4E0E67391800E6EA04009E8926
          6EB92E91F751A630FA1F4031F53F294F000885620480944B617888795E128797
          00B88270BB03D8D9C6C5F81D776F91A4C03E7AF58C6A5C459BF0AF99297CB15F
          A16A17E1A1D5EAC0918F290970D1D589BD574A70556883356904665BE7A078E8
          341548DF62D5912956C211158440AEA74A098F9FC22AC8702600389D017C64D7
          B6B8DE9AF821BDF62EC9372A80BD8DBD9B26A4A63D6FD6D28B720475EED35834
          EA3ECCFD6C018E745760586E32B4E0C99D3E78CE44E1581343ABD08EB196E114
          7F2A364452995CA7B01010017C64BD2046E01115524E8ABDE405B2FE524F0067
          5B1B8FD9CB9E3C497A7792B4AA095451DFBA3CCF9CF7C6C8E430B93B09962D1C
          C6E4DD8160EA25CC1E3B09425086180EE2BBDE5E181A6E42EDB22A14554CC445
          E759543DD8803BB30B601389788A424062F09262AF3FA47AC043F1B793389C12
          AADB83B05F28DBD37D74FD2952FB3E49970AE0E0D717E7688D8587EFC89691C6
          27C1B88BC33DE3C7607A612104398823B5E7D0F0A51D112984A72CCBF1E4B4A5
          98D57E0BB62D7E16CF956EC3828C5F61DB3D9BE00E5269F3CBF00488784248E5
          808B29F7D0D12362EF2519DCB16525CEE6BA63A4F630894B05B071E3C66C4BF1
          0B3DB373835C326F44D26603CA563C8F5EC587AF2E35E3D47E1FDE2EDC8E2E67
          87CAF88EF12DB898B6033F1B371D0AC258FFF1417C7BDE897D0FD6604CEA9DB0
          F944F2403CFE2A00E2808BE2BFA3858BE9CB666C11FD7E958024625F0DE32BDA
          8257665B62C30C9C1159EB33F18765C54428E0E3135FE1FC0917D64D2EC3BD73
          1E06D101C9A506707A05BF9C3E1337E5E4E01FE50731D9F4101E2F58827119F7
          90523FB99F52D0178C0320D7D89C223EB4F16DCEB7261EEA232049B80F00B7FB
          B2E7E35916E3DC24DE80D7AAFF880B572F402351EE11A3431119F979B7E0EF4F
          AC435002F6B56D439E7714169E9C8115CF3D840EA70D5F7CE0C5F9650D68B407
          E022CB99FBDDBE84073C41347549A86D6FFCDCB16B711F015BA096B90480BD8D
          3D6F140E4AFF6D0E751C211A822BEA809F5CD9D97D0513D2A710A3BD1871F330
          B5121AA8A6730464DE8147C08D6E426E4E3A766DAE46E7CB31B4BB44B8037100
          2EE67A266E09556D12BACEBDB7C7767CDDF70444FF36B2B7BEF9F9C1A6E19B0B
          2D1CCE7B1A70EF9E71400E7312F0FBA2B5583DF125F5B999FB67A166C17168C8
          3977BC530C43610F3232537168F79738FB82089180B9FC921A7FB78FD290C2E0
          A10C28A70A8863CB4B9C97CF7C4FC001000ED5D64D53CCB79D9C610D234567C0
          ED876E8753D784D1D95654D537626EFA423C3AFA193CBD7D0EFEFCF30D583679
          2952577098FEC4282A5A1A54BFDB88D6D5541F1C54F319F912047492FB3D1E09
          258D8819CB676EF1F723E000002B57AEB4DCBA688DFD7E6B48CBDAB01C8D6078
          298FF163F3303AD74A9678696E74D2F9501C3C7E16358FB54294BDB8AF640252
          476B50647F00DB9EAD449BDD13AF805E9682EC48B9EFF0E3FD6EBED5B76E6225
          A9DA4E521FF7EDC04EAE2DBF22D5FF2453531088D0244A81EE0EF850549A89AC
          211C7E3AF52E0CB16451AB4E5667805FFFAE14CADA187E53F1323657AEC5F955
          22C234A1D8DCA20A8059CF8A909332A0A947445D7BEBE7BD3B1F1F40C06B0170
          7B9ADDFBEF4A333FA2E3599BE3D50988AA2FD656BD852DE7FF84B0D18555CBE7
          238914BDB9753FC4965474ACB1A3CB15869606039B27A0C6DDED93D4F2EB12A8
          0151081801AF9E2DDF63FBFCED0104BC1600CA1BBAFE523028FBD511C9340DC9
          D486A9DD097ECA7B627E562A90B23A1342C8098B60C5A2DB5EC403850B614C31
          C1E7F750812293A87D8741E10BF32A0798F55E0255DE1044ECF84B258EA6D303
          08781D8003F5CD8B73CCF9A553ACEC63F1964B9D156C5E64DE78E7E4BB5830E6
          1918085054CFC67756FFA136202F31DFEEF6C1E1F2A9962B511D82110D046A42
          5B9AB8A8F1BD195B898015A4E68B3E025E07E0C4D7DFCEA9F3E51F7EE96EBD1A
          216A6E08928270243E07B0F14F26EAD0BC41559286106ADFAC03CA4A0C01BAC1
          66003F3521DAACA0D7E1819DAA9F42DDF59F4E7D9B275E010710F03A00454545
          E6857F3D5C796B7EFAAC07C7C427C880C45A6D1C4C9FB0A1858162FD9F4D4041
          BAE06733009B825807648DC8CF8A9088E62E2F2EB86D553D25BF38419F2BED4F
          C0EB00B0092F6FC8D091F35F797D85F5B6798F4D199A947633F1C194C4C63402
          A2B0E1837921A6F609390140222B05293E030A62907813225E48E8A502547639
          8CB4C675651D2776D65E4BC01F02C0968164586E6EEE5DC5F39F9E3A6AC6C3E3
          2DE9B74F4CD345F583A9116518354835B299905389C7422105D910125253AFD9
          21E2425710D5AD226D7D62F2E4E0A79F7CB6F9D5ABF4CD4F48581A7AFF1700B6
          98FF89F71842929F9A9A9A6FBD659235F3A6F1E996E1B7666AD3866618CD1999
          515E6F369B9233223441BA8580E41304AFECE97568DDCDDD918E3A5B43ED2792
          CBE572D337CE91D424AC0FDF0880BE7B6CEA27BB312801288B2493249D248584
          ED65D96E468FF894CE76C241C4F77D4C31DB8C7E47D29948BDD00F29B991C525
          92C0D04FF884A734897B48902B92B092180329210A7E647BFE6F523B7DFC1E9E
          EE560000000049454E44AE426082}
        Name = 'PngImage41'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500536F203137204E6F76
          20323030322031393A31373A3436202B3031303041C0B5F10000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009864944415478DABD57697053D715FE9E165BF2BEC8B28D586C8F01435C
          A094B28C59C334A560321028A16142032593CCD01048499B615266924E4B4B12
          204002986D1816A7405ADA4C9A86403036668959BC520CB6658C2D5996B02CDB
          922CE92D3DF76AC1063393E98FDEF1997BDFD5F3FDBEFB9D73CF3D4FC0C026E0
          FFD3940180BF2F6D8CDE7DDAF56751AD7AC5E3435261AE84CDD303F088804A10
          F86B8AA2409264C88A085154E899F5126489E6692CD1589224286422CDC98A04
          AD20E1E4BD24FCAD3E1E31725F97DADB7122B166FB1F1F345C77D0A2FE0801E3
          86AAED1DED9DEBD5CD66487E110B0B52B1EFED0948CB180E954A20530FA44F64
          145926A020A8288ABC67160804A817F93BD6D666ECBDD885D20E23D45A05E686
          2E683A2A0E79CA36FF899669210B700209EBABECEEEF6E18D866451958382509
          451B27C0903E8C036A341AB8DDEE080199C099316006C4FAF0B356ABE524586B
          6FBD8F7DE52E7C55DD095DB416D1861CDCBF71D7EE3DB7723DFD7C96CC1154E0
          9D3AC5597A0D825A404012F0FCD404EC7D2BA8006B6AB51A959595E8EBEB2335
          544F385410848832269389F78C9095081495BBF18F73E5D0EBA290F083F9B057
          36C1FEE5B2F7E9F523644DDCC169BFAB955DE5154440C509144E89C39E37C721
          7D48165F9C81363636C2EFF74700B91BFA199B632E30180C118518817D97BA71
          BE0988D208D0261961AFB80BC7D9153B68993D64F72204BAAFDDE08B0414010B
          7E148F3DEBF2611C3282CF3105066B61FF87638049CF48F677C19E3217CAEC06
          4469C1221AF62B77E0B8F0CA4E7AFA94EC6E90C06F6BE5DEEBB720D00B7E59C0
          FC8931D8BD762C578035E657B3D9CC811821B6BBF0AEFBABC0E693929206B860
          5F1905A13D0D5151B4115ADF567E1B8E8BAB77D1B29F0C20E0BE594904C80514
          84F326E8B1E3B551C81C9AC3176304EAEAEAE0F3F906F57D78CC4033333379CF
          9AE541338A2EB950FAD0089D9A8EBE46858E4B4F21E0ADAA2102E00ACC1BA7C3
          B635B94837657102EC1474757545761D5620981BA4883B98E9F5FA603EA0DF2C
          0FCC3850DE8332879136410A1081F6B2DA270918DEAE917DB5B55C01760CE7E6
          6BF1E1AA1C6498B22304986F19707F02E160EB7F1459C0B2316B2C0FECBFDC8B
          4B9D19D0696861AD0AB68B75831308DCB94D8BAB48012230468DADBFCCE23110
          26D0D4D4C449F4977DB063989A9A1A19B3183870D58DF24E239D02769C55B096
          3E4501B1BE9EBB402417CCCE5361CB4B4307B8A0B5B535B2B3C7C1C3CAB07713
          1313233160A518385CE1C1656726B4740CD9316FBF583D3801B9A13E1884E4D2
          D9A304FC6179267741B8316919C8E331C0C6E1386044FB272AA7C38ECF2B9D38
          DDA04780523C236029A9199C80D2DC0876DA0314ACB3738177172522313983AE
          2D85BB865D60843780009BE38117138B2EA11BC5F5C528B594C2265AE9AE000C
          48436EDC348C495909AB231157CC3D683B4F0A940E4240B8DFC8F3804489E899
          0C05CFE5C9F0D3995442FEA59FF81D2A872E5336AB080A268DCDC217CEA3F8C6
          F5190A474FC6D8F41CB8035ED8BC1DB07BBB70D7DA863B2DED986E5C836929EB
          B06BEB05D84A563D4940D5662605C88F342381A5550626F0DDABE80C2B21F999
          8CE40CA8C8A72B679970DEBE09A6D136BC346E1E81B6E3AEAB06168F0D5E0A58
          37F9D34D59D14772B4B576235B998B9F043661EB8682C7086CAC91B5ED2D9172
          24580208FDFA47C6A460DDF4B106B8924F40955A8E15E317A0AAF32ADA7DCD44
          5C053781F7320262006E9F9F2BE18788871605B3D4AB71FECDFD831070B40415
          602CF89FC0C165414D4A28FC99A9C16ECC04BD063F9FA3C1C18E45F868FE1BA8
          7556C0EA6D66BAC04B85899B32A697C07BA96FE96DC796FC0318939087D72A97
          E3D6651BA44FFA3E46378A08FB3F2102D5B2EEA125A840043C58AFCC4869A6F0
          8E22C9B55033F750A5336A781AEAB4FF446C560BF233B271D3F92D553F519443
          64F848720F99978E6C738F05DBC61DC5A2E1CBB8B29F776CC3D203EF0165DD27
          71014C85EBC154FC9B6A39BADB460A28C1628DE3D391A445BE5CA346D6C831F0
          F438D1D3DD0D67672762130D58756D2D96CF29C0BD9E6A985D8D6049245EAB47
          1F29E0A3006AE9B5E0C3F1C7F1FCF0251CBCCD578FC292A9A8BC950034B4D450
          35F0014D7F1521A0EBB541152A13436520FCB450F1122FAC3E235EFEA01EA969
          71888ED7E15785A351D4F12CD6CE5E8CA2EA222C4BDA088FC6836FDC45C8D41B
          F0C06DC3F609C75098B584AF63F33562FEB9C9B869E9045AF3007B83137BC4AD
          84521C24403110EBB6537C8514089160C5E5FE9FD9D1D667C0EA9D16241B62A1
          4BD4E3552270B87D069616CC4493D98B93334E939B808F1AB76057F366144D3A
          85C2ECA57C25BBBF090BCEFD18156D9DC173DC3009E8B9D585BD122B480E0509
          BC5529C7F99C1C3492EA6920CA0AB64D6B823560C4C653014AB354D7C54463C9
          EC2C94F5ACC0D87106FCBBB1045F175C41567C1674513AE8F4D1E05212217BA0
          09852170DA1B645722552994E5DA6ED4E1337C416F1D0C1278A3424E5279B85C
          3CC18562409425BC975F0D9B9C8E2D979210A7A7B28A6ABB8979691836F4102E
          07CEA24369E639E3DC8C0A98E24740512988A12BD9219949F649B84EE02A4A2E
          126D06E67CA08F70AE369DC1357C474827F87E535E2D6DA15786A5256A388130
          09892EA60DA61274E9B2F1E9EDA1888D260254DD6A62F538F232F0ECA95948C9
          89A6E3D683CCD8787C3DE33A8CF1C36097C8E7E72747C065B6A0230DE8180995
          5405F988FB307A514228FFE20472176E9ADC288D3F929A919A6734C61030B864
          EC8AF975EA5928193FC4D63A1362A214AAEF35F0AAB4B8B136133BAB76605BED
          5FA04DA6522EE0C733E9195896B518C71AFE8A2ACBC3475766275DD1160A3EC1
          8C991973C5D2778F1EA4D9E36415618FC7C48E9856E0C97D7D778A297D54E688
          14AE82484CD6A55D40CEB86968F52720214E8F58BA783464CFE525D3CE64BC58
          FC22CE58FF0E81304456CDC878F4E1E5A178705069DF6BA0F9FBC84B1A89C5F1
          AFDFDCF2CE2FBE65FE27AB8F841C595C4AF6CCA9BEA12FBC2F6952A782AE4FD1
          1FC0C6397790621C8668BA6AB554DA6A2921694805853224AB117347E6E058F3
          111CBF570C511F45C11743572AF5DE783AC73A1ABBA0926D28487F419EA2FD69
          D5C79B57D70402BE6B847786958DFDCB1B368E2523AD30956C045914BEEF076B
          3CED7D223261A2FF8FD10EE1FFE70A58E903AC01B570C20D56ABF79099C9CAD8
          3D40D6F7F8E2EC996823394446F5BDC0838D95132964AC8A31714AC1F5BA5922
          24A39C0EF651EA625141E6E337FA5316FB5F3ED3859062712CA6C8B4A17956C7
          B943E60B4548E4F3FCBF8E70FF2A06E4B1550000000049454E44AE426082}
        Name = 'PngImage42'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004D6F20323920536570
          20323030332030393A31393A3037202B30313030B96B1E570000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          0000098D4944415478DA9597099014E515C7FFDD3D3D47CFCECE2E0B8BEC722C
          2041E4F0880A6AA2B12AA94A282B65C5B29460AA92B2B42A86541945448251E3
          41BC0356E430621983291334D1108C2C8ACB4244413905D69D9D9DDD999D9D9D
          636767FA9AEEE9EE2F6F7A06B38938547AEACD7774F77BBFFEBEF7BDEF7D1CC6
          5D8B9E377F5C32EDDB98C02F64B6A3F07014669765A7523247166C5BB1595961
          8E23F360B263DB32B32C7ACE962DAA03E5222B734566AB4553CE294C8BA999D7
          BA75E02FCE38336CBC4D6E7CE36BEB4DF58D9B85802D724E5F81136CEAD3CB24
          26A019806A32AA3BD0A84FA37AC920B148CA0E0973C5A0BA51E9331D663A8E65
          0B30C0822ACFACFEFE7B833792CA1C8971568059CF186ADFDD5EE9C008305C02
          DE7CFB14C6541B1EB11162C0075F4084DF2FC2EBF740F409F0891EBAC7C1E7E1
          E0F5001E126ABA4A1DFAB3E90B88D72D3776A6B4E443537E4EB7FE49923C2BC0
          CCA74B6AF41EAFF4AF148711625CB76D1BAEB9F149F0F604302B04CE09C1B1C2
          602C08CB0E8151BBCC1A603924688049FD6504C1F80026F903982A096866ED18
          1EF5614BE79036F2C8D40D64E62592C8D900B8E94FE9CAC04A9FD49D24001A81
          A776EEC435D73D0A8E35D35706E015FC1049B9CF43A32104207AFCF0F17EB7DF
          2B54EE7BE1A5FB1E5E84C07BC1F30EB2C3D7E160AC195B770F12C08C4D646753
          0D807D19E0094D89DEEB7701521AF0DCBE6E7C73F17D109C96714608C22D2532
          E6A33A9582CF6D8B6E5985F410A4C803E9E4127C1469C4D6F706B4ECE31D9B6B
          00BD670598F61B5589AC92A47D43E4032A011C3F846B2FB8031EAE85944955A3
          64C0572BBF00A988C75F85A0E77C42B5EE251F490C5E82FD9110FEB03BA665D7
          CDAC0F30759DACF4AE6CA01100E2B4A84E2945B487F72328D290D2F33CE7012F
          38E0E9270802818186BA32DC9CDBA61E782A254F2589E81130926EC7DE5E3F5E
          7DBF9F0066D507687BBCA8F4AC0C49FB6A0095471C81BC984ADBFA4FE9B0AAD8
          4EB56467EAA8D6ADDAAA3FF35CA5FD4A6754CB3F31BB3EC094C70A04D02875D3
          140C1000A3393CB1F303348A16CA5E3F0130F82FBC1C3CE3301CED8727D40083
          BEB2B2E4A6B44EC168324B41A3083BE087C9D3CBE407ADA166726202D8DDA7E5
          9F3CBF3EC0798F8C2927EF0DBB3E3050044AA4A36DEDF5F8E1D42C326915E953
          FDD8BEE21D1C0F2FC2DAD9C721D0D40C259248C47AF1E9C5ABA09E3E85B54B64
          C814B5E203033852109099BD8C962FF0C7CE8836F6D49CFA00937F9D574EAE6A
          92F6266A0034FCED8FDE829B1A63C88C9530723A863D77EFC0874D8BB122F02E
          9847442E378AE1443F1257AD41E2F33EDCD97E9A2225433A9D42DCF42331EB56
          8A21C09FDEFF9C00E69E03E0E1AC726C558BD41D070609C0A4C8167FF6615C8D
          7E5AD32278554672F923F8D43B07E1912E84282AFA2804F16505C6ECA538111F
          C50C3B0A3F4D8B979910FD0D18F2CD777DE3F5CE1EADF8EC05F501263E942180
          89D2BE7875045CE7F2D216537334A7A2A90CD7DB28E4BBCE75C6D140E1965C03
          25BBE6904ECD446DEB79FDBDD39AFCDCBCFA002D0FA695A3AB2649DD8355808A
          E258CF009A5A42B029D0DB9C0D8B0FA154286186270F5FB89176151B65534502
          D3A0F6C7B174BE08E6F7D3C6A52356B090B6A6B946B6EF39A929CFCDAF0F30E1
          5723CAE155AD52D70043BCC8D15C3AF8463083EF5E3A993ECB40B23F82CDF176
          1C883A78F7B666F775BD98C7605F0FD6659620904F63E3CDADAEB2D154025DFD
          63D89E590081ACBCF9FE679AFADB05E700589B520EAD9E2CED3C6D214F0E5071
          A6258D597CFFE216E8B28CA1780C6FE4A66377CC87CE9BC8B30411D96C0EC9C1
          08B628DF823696C3D6EB7918868391E1143ECB96F06AEEEBA02D017FFDE084A6
          AD5F581FA0F99729E51302D87EDC84EE7861D27CEA7A0A57B57BC12802314D46
          9F3305C74625CC692CB8DB31EFD8E02D0B83E509482A364544C78D865E5AC201
          8A0545ADEA1B6FED39AEE91B16D50708AF19A2116893B61D2E5104F4BB8E94CA
          1B482B162D492F1C9F888E007D78D942269541201C04EFE32907B02966846150
          DF92369B72052FE50E028E8FD14868CD14B8811D5DC734FDF98BEA0334AE4928
          0757B74B2F7DA8520212AC6435385FEBC3F2EF74809153159251AC1FECC0C188
          85AE3B27D02B3C4C791483D15EAC4E2C464B3E89CDB7B6D5D4D9D8D12363E391
          26046839FF7DCF31CDFCDD390042F70F2A1FAD9E26BDD02523140E41A6B95C3A
          790CDF5B3401A651C2502C8A5786DAF05EBF88EE9F90568A0D63D92CF9401F9E
          485F09219FC5D665136BF6CB7827A260FDA7CDA0C1C03FBA0E6BE5172EAD0F10
          BC6F4039B866BAF4F4AE02264E0CBB39E0354D09DC78A1845C4143627818BBD4
          B9E81C0EE28E7939DAF3BD28974C94741D7B8B1D14048AD8FA834657994E3BE9
          DEC1129E3DDA4A490BE5615D9F68E58D97D5079056C694036B6748EB76E63175
          723328B7449FEAD0F6CABBC985441FEDB5AB41E9346D972AED563CE58A0D010E
          CDE478615F092F5F2F42517428C5028E666D3C7D623A4452DED97D48B3365D5E
          1F20704F3F0174480FBE9DC5AC691361D232B486A25830BB8546DBA1512DE060
          B115BD511D6FFDC88F49CD12F4022DC358042B22576282CFC096ABC690530CE8
          AA82A8C2E199DE795580BD07357BF315E700B83BAAEC7F60A674FF9FD39837AB
          15C59283653346F1ED8534AF8E4981A80F1BA26DD81DE170E8A70DAE1316F2A3
          D4DF8B07C809254EC563E7F7A2502ABB005926E199F862D022C19E7D1F6BF696
          C5F501BCBFE8238059D23DAF2571F1DC3652C47043DB086EB8A409725E462619
          C7B67407FE160BA273691A45C78F5451C758A18057D30B2193E14B4219E88C7C
          C311698A244446457064654FF7471A7B71497D00F1AECF09608EF4B35712B862
          FE54F750E2E17298DBE4713799324D49CA684456E3314487952079B79F7C833F
          B3F1D065D636AD4AB3525A94469508ECE3434734F6FBC5F5B3622F01EC7B708E
          74FB8B83B8FAA2E964B09A86559CD1DDD8CEA45AF41605403A2D395034131AAD
          04CDA0E8498634A30CA3DA6686512AD925230B2D9DE1F23DC36CD77D87E9F597
          49A25F181D0700FF5D3DEA93CBA7499B77A771D985D391276792C980AA5BAE01
          8D4AA56288CE6725CB541D55CD303595E5E4E4182BC4652627285A250C26A7E8
          85113AAFD1B192D93456A01C1B72CD701749E6AC00D22DAFDD5AF6046FE71ACE
          9BCFE9F98C534C8D32355940614861725267C5A4C9945499E9393A04AA9581A6
          E30BB49A01A556576AA2D644AFCC0CAA9944E57EA156FF32005D61924B491690
          4C22B1C62952CFA2BC545366D5647CFD8CD8F8EF13F1579F8EDD7545BE455209
          67BEDAC3E59A92AF52FEBF17C3FF71FD1BA199666CC03FA14D0000000049454E
          44AE426082}
        Name = 'PngImage43'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500467220323820466562
          20323030332031313A35313A3531202B303130307CE9F46F0000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000006454944415478DAB556694C9547149D0F782C02A5AD604254A26DDA6803
          B8A44D5B8AB1A1FE009798342135D59A54FF504D4CD198FAA3A4146C9A564D4B
          A324463185C6160BC600B2847D11A895459607865A96C7BEC8036511595ECF99
          BC79F98A601F364C7232F3E6DD9973E6CEBD773E4D2CD2A2A3A31DB66CD9B2C1
          C9C9E9EDA9A9A9C0D9D9D9572D16CB9AE9E9E9957373732FCECCCC183016E867
          26262646D10D3F7EFCB807B6AD40F3D8D858CD8D1B37EA07070727B1DD1C6059
          88479B3F61369B830606063EE9EBEBDB858DD660530D84C2C1C141383B3B0B57
          5757E1E6E6265C5C5C84A3A3A3FC0D9172EDE4E4A478F8F0A1C07AD1D9D96969
          6F6F1FC0743E04A65EB870A100E3096076410150FA1E36F8BEB7B7F7DDB6B636
          6D6464C44640328202544F9098FF734C51068341F604D7B2D5D5D589E2E2624B
          6B6BAB717474F4BBC4C4C4744C8F2B21520048BF80DA6FAAABAB1DE101B9C18A
          152B6C448A580F2560FE9CDE5E8960EBE8E810972F5FB680EB4A4242C2D798EA
          03A6B5BB77EF86C365D78A8A8A3475826711EB41FB8504A831AF0EB1214131B4
          3F7BF6ACA5B0B0F0C7BCBCBC3808E8D67273734B6FDDBAB50D776D73E762E4EA
          3A54AF04A8DFFA351C3F79F2C42600412C344D9373478F1E35A5A6A6464240B1
          9695957507A77F936AF502163A31FFD78302D478BE1DC99825D64C9102E49D63
          3E222262202525851EB8AA2128A23019535959293C3D3D9F0AB8F9A42A0B9400
          35D67B82738A58F53C20F7446A8AF3E7CFA7555555D5404092B667CF9ED5870F
          1FCE46DE063062D91880FA4DF5C40AB46110AADF7A1B0A430A4B7212AB565151
          212E5EBCD898919171071E29C4540EB3C0803B09869054287DB9BBBB5BE63117
          93C4DDDDFD5FE49C5363755A354F3BF674335D4E30B67A7A7A04AE5A9497970F
          666666E6405C03783381FBAA0E78C4C6C67E1C141414BF76ED5A471411313C3C
          2C1E3C7820DDC722C4CD29C6C3C34392B0A700F66ACC4857C18742269A9A9A44
          6363A3686E6E16F0F07469696932F6EC005F1650CF7AA0E90AD24B67CE9CF972
          EBD6AD9F87848468281A5C6403AB1CBDA20289A248C89E843C29D1DFDF2FBABA
          BAA478DA5BBD6041BAFF0E41CCFD6CE04F6084E5595F8A1DE04ADF9898984BDB
          B76F0F0B0C0C14E3E3E3F22EE905922822FEC6BB20CB2E2B264AADB4253826B8
          8EA07893C994575252D20E0E96E352A0DFFA3E3CF51638C1036F1C3A7428252C
          2CECF555AB56C90D14B9024FC59353003DC5FED1A347124A0485722D4ABC313B
          3BBB0AC15889FDF3001330B3E86384E6BA7FFFFE90E0E0E0DFC2C3C35F20913A
          11C99547780D2457A00882A4CA231034949E9E9E0D31466BD0FD054C3DF335B4
          CE794446467E1A1010F0C3BE7DFB1CD4A6CAAD14C246625E01DF0FF64A00C919
          74A8B2C9F080C91A7475D64748FC970035BF322A2A2A16B110B17BF76E19540C
          44BA96229480A1A121993114A1AE02E4969A9A9A948686865EE63A705B059DBD
          02D81C11946B8E1F3FFEF38E1D3BDE476C48228A2018842465CD5022D45520E8
          0AF2F3F35BB1078B4D893EE8962280CDE0EFEF1FC82275E0C08175DEDEDE9294
          D7C10A07F7CAB4A3087A88FF61AE392D2DED8E35E872E707DD5205B0B94140E8
          A64D9B7E3972E4883B739B44CC04161BE63C7B8A81178651EB33E1A1266BD0B5
          CC0FBAE711401BCF83070F7EB67EFDFA6FF19269743985B06CE3EB49E0638641
          68B979F3E65578A3D34ACEA01BB367737B1AEDBC8F1D3B56171717E74B62A3D1
          28EEDDBBC7FB96F78F8769025F3CC9880D7E72950166B1C887E8F3086073426A
          369C3B776E03D3B0A5A5457E6651407D7D3DCBB2393E3E3E09760940B378C6BD
          3FAF000D026E9F3E7DFA2D16279E5E09E0A3832BE9C1B7DE55D85D02EEDB73FA
          250B404AE69D3A75EA032F2F2F49AA1780CCF83B2929E91AECAE00ADCB21409C
          3871E23AE2E0435F5F5F19034A009F5B6486313939F93ACC1281B6651100F2AF
          F048458786860A3CAF3601148354AC46FEA7C18C71605A16017BF7EE7DCDCFCF
          AFFCE4C9933E2CC78C03A62005A0AFC8C9C9C980D9AF40E7B2084073D9B973E7
          2E88F869F3E6CDABF95CB326D4D6D6322B8A0A0A0A98FF8C832E7B375CAA00DA
          BF00E277366EDCF8918F8FCF36BC17EB1080E6B2B2B20C14A13FF03FEB40FF72
          09B08900FC007FE015C00B1806CA815A614705FC3F02D43A03E0097800CE003F
          12CC56F2397B37FA078E7D33CC2B6E80DB0000000049454E44AE426082}
        Name = 'PngImage44'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004D69203230204E6F76
          20323030322032323A30333A3135202B30313030EBCBC3EA0000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009874944415478DAA597095454D719C7FF33CC0223B20A8428110401B723
          081A302E4763C0BA54534D2C460D319EB4564F739AE6C42EA7266DEA498D1A13
          145750E4E08AB6B65841AD6650701D700346544054966116669F79B3F67B0F1E
          4E94566DEF39DFB9F7CDBCF7FD7FF7BBDFFDDE7D02BC4C2BC63AE83004DD383D
          41B3487175D4E1C360508FEBD848FFDD412166A28DFAB568A2BB9D64DEE7B914
          BCB0F8B65922E06473F6A8A498BB6A355A343AC4868722263414D5CD2D368FDE
          7B4C1CEAB7D0E9769B70131F633B2AE8290399E7FF06385C629B526FB8BA6953
          C8D4F4D90929B0381C38A95462495A1AEC2E173C5E2F8E296E62E1F814EEBAE2
          8E9271D5B9D7613376D1E35A32D7FF045058A80B160A03BF91F9B9738F4B3F15
          36861C434268342EB5B4203C30909BBD93156C50627A52224442210464491111
          28BE76D5AB6FB41561272D9B1A8FC89DE3A5008E1EB54E54A9EC257171D6B8C9
          29320C298FC7EC9438E86D0C4EDEACC7F2291361773A71A4A606E94387222932
          1226BB1D1104F66A50100414957D0A059AEE696AB0173F43231AC8ADFDE9BCE8
          17E0C811C72FF57AD386D454BDE49508A0CBD68DB4F3E9583F7F3EB65FB88098
          B0302C4849C14E1A5B6939564E9D8A26CA0B0B6385C66AC44383160344124C1B
          968C4B0F1EA2BAA645891AFC16A53847EECDBE103F003874C82BB5DB1D3B2412
          636E4A8A0662B10052810C792DF938E3DE87ACC431D8507106DFFCF41D9CAAAF
          87FCDE3DAC9B378FA2624689A21A6E7D38DE8F59867141E3A0663458A3FC0C39
          99C3A13258F0D75B752E3CC497F80A3B484AC7E7451FC0BE7DC64156ABF35854
          9465CAA85106783C7EDCDF83FC0721BDF275CC7D2306A5D76A3135290941FEFE
          28905761FDBB3F41CDE3669C50DCC59ED422644764C1EC34C1E171C08F9EEFB0
          A990ADCCC4279933F048AF47D13505E3BEE1F91ADB283300150BC1011417DB87
          99CDB6F2B8385D625C9C096EB7881317FB89E1167830E25C3256BD390D85D5D5
          F84D7636BE385A86B50BE7A2FC4E2DC4EA049C98749CA6E3A4E5B0C2CED8E162
          7786C783305138922E27E2D7D326A255D78D6EAB15550F1E78758DD622FC195F
          9048BBA0A0C034DAE572562426AA0747465AE1F5F6CC5C48D91C200AC0C1F6C3
          38C47C8B1695018B3332B0EB9C1CAB664CC7C5D6068CB067A170C22E5CB97D19
          17AF5CA467BD9833670E4422111C941B21C2108CB93E02EF8F4FC38DF60E0C10
          8B10E22FC191AABA0E7C8A5F91D059C18E1DB6D6C848ED6BC9C9ED442E21273D
          E2028100A1D250CCAB791BE6810FE164DC3050964F1A9E009BC78A20751A8AC7
          17C2E83562CFDE3DC8CDCD45676727F6EFDF8F458B1641424968A1884CBF9B89
          D90963E0A48888256E1CBB7E07C34A461F683E5F57CB9618C1B66D564B68A858
          66B51A307A34510EF0701022A118017E0188FD3E16527F11064AFC3194F6F794
          E461F857951635D957D165ED82F28E12128904D5B43C39393930994C282F2FC7
          BC1FCD4349DB419C9314203E2C02568F19C6DA0978DBF13B3437567DBF31EFE7
          0709E01F82BC3C9365F5EA405973B31B1515164447EB909C6C825428C519ED39
          ACBCB5924BD2C11161583BFFC75855548CF6B92ADA212214EC29C0D8B1632197
          CB9142DBB2AEAE0EA1549CA2A3A391313203E9D7D2B1F8CD588474A520A4E603
          A4C6262238C283C2BDFBE5F9F99F9492DBBF09BEFB4E6FF9E8A360192536D7E4
          723339D22333C58D359A6538DB711E013209BE5DB2043B2BCBB13AEC2F7877E8
          02305E06F9F9F958B16205B7F6BB77EFC63CDA92ECD85FEC8F53EA93C8D37E8D
          8F9D85886252F1D6EC08844748A054AAB1654B917CFBF6CF8E935C2901682DCB
          9787C80203857DF5C06070A3BCAC1B95BA7FA268C02FF0794E1624027F6C2CAD
          42FBA247B87AE3321293E269CD55B47D8BB16C592EBABBF5686969465A5A2ADC
          942F9B2E5560B26711264D0BC7F011817DBE1B1A54D8BA751F01ACF97B2F808A
          00C209C0EF998A78AFC18EEA4A2D98F104E25C8BE503FF84E5F11F607B613965
          7A345E7B2D0A818156DCB85141D742646767A1B9D90B65830013D22390F146F8
          333E6FDD6AC3CE9DFBE4DBB6FD9E07E8248088BE08787B8BA4DBDD33A6C4C745
          B91A954D17302BE375DC547890942C43424200189A6973B311ADAD2624260AA9
          A7C2354886ACAC6848A54FFCD186EAEB7B00F612C01F7880360288E222C08B33
          0C9D26E83841F584FB4DC49E04CA3AE9C5EEC18285AFF439E79BCBE5C1D9B38F
          08468BA54B475354241C383B09AEDC92B01F05582A056EDF7E881D3B8A08E073
          1EE00101C4701160C55871AA219CB10E589053A7DA306C983FA64D7B36A4BE4D
          A5B2A0B4F436ED882118336608E7839F390BC0267A63E3431414EC21803FF200
          F72D1F7E38543660808813E78D1567FB93271F61C28481945C2178D176F8305B
          63FC909939964AF213808000CAAB7B2D2829D94BDBF04B1EA0D1929B1B470062
          D86C3F8C4045052B1E84D4D4E07E85F82563053C9E2763D6CE9EBD43BB428D8C
          8CC99C381F81D6D626022C2480AF78800602889749A512D0BB821366C37EFA74
          1B468E0C2007617D82AC082BCA9B6FB2F2C683B0EB5D5BDB4AA6A4E8BD45E27E
          1C404747131D767613C07A1EA0CEB274692201883900D6815CDE89E060765B45
          7289C827232FF0B4607F63B6B1B36E6A6A83425143157316828244543B1A5156
          5628DFBA75430F405EDE0DCBE2C523646C3D67675E5BAB874663C2820531DC72
          F88AFF37C1FFF41FBB83DADADAA9565463DCB877A8C835E2C489DD04B08907A8
          B1E4E48C96C9A8DC3635D95155D5466FB378CE011BDE9715ECEF9A85E8EC6CA7
          04BC42EF89785ADE2202D8CC03282CEFBD3746E6F58A71E0C07DCC9C1907994C
          C4CDFC65C2CDAF3D7FED9B0FEC44D85AF1F8B1023A5D23EAEBAFCBB76CD97CBC
          17E00AE5408AACACAC03B1B1A1183C38885B0A5F115F01DEB9AF00C378C8ACBD
          464732878DCC44C5C84CBE8C246EF78A44029DD1A857E9F55A5D5595FC7E65E5
          B98BF468199D07AA2CD1D183652E5700158FA83E715E948D0443C9C0300E7268
          25C776323A7A51A9631833CDCEEC110A0D46A3D1ADD2E9BAB45A6DA7BEABABC3
          D4D5D56ED7683A1D5AADDA6530747B9D4E277B08A58D0E0B7A3E56EAC9AED389
          48413F04CB860F8FA65D60E7047AC4D8DEE6257AFA103213B94AA3D13CEEEEEA
          7A6CD668DAAC3466D46A95DB68D478E95EF63B90E9756EEEED4DBD63B3CF6FEC
          3DECBD0EFE5E5A826B57885CD0D1D1A857AB1F99C831E75CA7EB701A0C1A8FDD
          6EA12F2FAFAF73733F8ED9DEDEEB9C3557AFF98E59F3FD4EE4E2CC9E8A5F259B
          4116D51B22DEB1C947C0F694F3A745DCBD86A7059ED75800AA59082513F73AE9
          4FC4DDCFB32F24F0BCF66F9BFF86562AF313520000000049454E44AE426082}
        Name = 'PngImage45'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002A744558744372656174696F6E2054696D650044692036204A756C20
          323030342031323A34323A3037202B30313030377F95C60000000774494D4500
          0000000000000973942E000000097048597300000B1100000B11017F645F9100
          0008B54944415478DAAD977F5054D715C7BF6F7F2B3288467ED488A243FC515B
          A7EAA4B126A62A8ED3B4139D494DD336AD8E6D358EDA1A358E5A478D0E919822
          62907488D116B56AFC157F016250400115444591200822ACB82CBBCBFE7CFBE3
          FDE8B96F57440796FC913B73F6BDB7EFDE733EF7DC73CEBD8FC30B2D3333F373
          4110664892C4D1A35614454E9665E51DFDA7A27B0D7BA67B84FE0FF661EF4509
          E038B5284AD48703FDEF14C54087C7ED3AF3C5175919D4C5412274B7C7BD08B0
          6BD72EC7ECD9B3235B5A5AA056AB15433E9F8FAE327C7E126F00744BCA05787D
          5E309B8210A01F270C5A1E6AB8C0490EE8D55EC8013B4CF6FE786489B666ECDC
          B180D4979258C302A4A7A75B66CE9C39A8B0B03004202A22081C460DBE810989
          46A8755A18F491D0E90D30687868E10427F3100501B2E4832CFAE94AA0220FBF
          D58875E756B76767FD2B93D4EF2779180E804B4B4B3312407C4971312C9D4E78
          3903541A0D645524DE1E7D0053E6AE04EAF740769541F099C908C056821CD525
          5DCF74F5F1C0C6DC0F8D5F65A733E35F91348405D8BE7D7B537272F2F0E2A222
          D8FD2ABCFA877F40F093CBE9E558C72A244D9808B17A2364BE5119CC00408602
          B4B25E32E6F5D23DAD4800911814E584CB0D6C3AB7BC3967DFE707A9E75E92C6
          E0885E00525353EB0820A988005C5E11AFFF790D441F8DA09EC33B5723E927E3
          20DE4D05F87AD4B74F47BFD85F4350C753280E83C69000E88741D2AAE079D288
          78F328D8DD2A7C9CF7C18303FFC93A44FAF791348505484949B9336BD6AC1F2B
          00BC805F2D5A47AE0E02C475ACC1F0B1C381EFB220BBEFA14D978998094BE1A7
          59FBFD2C1869E674F59307FC960AC4595E85B953878F73E7DF3F7CF0CBC3A4FF
          BF7D026CDDBAF50679E067C514031EDE8779CB375216D00B1530B0ED9F881F15
          4DABB81FB2B31A66C376448EFE485922410C022810742FD96F628869228C1D06
          A4E4FFFEDED143FBBE26FD39A120EC1D60F3E6CDE514843FBF72E5325C2E1E0B
          3EDAA200B09E03DAB6206628DD341E83E8AA8675403A74235780021EA2C706C9
          73131C5F05CE77171A6F39B4C27D34B745605BDE3BB78F1FCD391ECA82E6B000
          9B366D2A260FBCA12C81DB83651B3F512219E401FDA3140C8CA15AD2924F5950
          0DB734863CA386CA5B033517D4C63280690FD52E3418A3909AFB56D5E993874E
          D0E30192476101366CD850401E482E292981D361C7BA6D69E04300AAE6CF1031
          F03154AD9720B86E77A951D24E0E19979FA5A18AB4D73547E3D3FCE4EBE74E1F
          3D495D0FF509B07EFDFAB33366CC78EBF2E5CBB077DAF0C9CE0C783C4100B179
          17B4BA3B5099AE43A418786A5CEE06F2D438BBAA68CCDDC6979076FECDF2BCB3
          C7BFA12E2C105BC202AC5DBBF60401CC650056AB15199999F0FA8300BEA6DDA4
          F81AD41DD554796F7719ED6EBCBBA869CCCDFA18ECC87FEDCA85F3A74F51B723
          24AD7D011C9E3E7DFABB0CC062B1202B2B4B712FEBE96ADA039FA7005A7B13FC
          F6CAAE413D7941F1008DA9F82E163B0B26165FFA36EF4C08C0181660D5AA55FB
          C9037F2C2B2B230F7412C0560437301D9C4D39F038BE85D6D98200A519426008
          059ED48307CA6A8622237FCCC52B25850CE028C9E3BE00F64C9B366DE1B56BD7
          60B339697BFE13AD25698206CEE653705AAE42E76A43A0F3168461DB60F32751
          B09A90C82F0D7AAA9B17346AA0E4F6CBC8C81B75E16A79F1597A758CA42D2CC0
          8A152BB208E0838A8A0A38EC5EA4EFF805B47A9D02E069BE089BA91A3A8F115E
          29029E11E711F7921E0D4D26C8F5F311AFBDAC6CCF5D00C45D786B18769F4FC8
          AFB8567A8E949CF83E003BA74E9DFAF7AAAA2A789C01CC5B2341338036195186
          BAAD16894E2F15191378AF07F7B4C711D93F404BE581A17D235E892AA52DFC59
          16300F9CAF4CC0EEFCB8DC5B55D719004BC527E100B06CD9B2CFA64C99B2BAA6
          A6067E9788F6B917A089A613101D3546DA3BF057356D38BC892A611D9E08AFA1
          BC6526789F8859F1A93090A3741A76280AEAD2D2FDE9F211C8BE30F84CF5AD1B
          B9F4174B45535880A54B97A64C9E3C797D4343037C4E019EDF96423398FA736A
          FCC866C6FBBE288A493B028E5AA5FAB1CDC74D9B914A1B743933FA7409B4E481
          936589C82E883C555B53CD3C709AA43D2CC0E2C58B374D9A3469736B6B2B3C76
          1FFCEF564217CBCE7F1C62A92EBC675729A71FBFBD36A880342875420E1A67CF
          6C095863DE38529488BD17FB9FA8ABAD6100E7FA0458B264C9DAF1E3C76F3399
          4C705B79C8EFDD41BF045A0202184C75E11D930F2AD98580B3B12BE299125156
          6AD57399C0000E5C4C44CE45DDB186FA3A663C3704805E01162D5AB49200D2CC
          66B302A079BF1E112325B0437294A503731AAD94963E02687AAE10BD786562A0
          65D95B3012078B545F37353630803C12735880850B172E27805DAC0ABA6D3CFA
          2F788888D122F94C8D0873077E73DB084EE3A3CDA8F5B9713D41E809E0CBBC91
          38542C1D7ED4FC9001E49374F405F0B771E3C665DB6C36B83ADD18F84B3F1292
          E2D14F1E84088715AF98FF4DC12641F0B47519EB0EC171CFAE1CC54256EE281C
          2DE6739E3C79CC667F81C4121660FEFCF96FC6C5C55DD2E9749CDDEE406C4C0C
          46278D558230E06EC44F077C4A006A887C5B8F8659D12476DA4728DFAC6AD7FF
          4AA30A8B6EDA5AE8238655C272043F4E7A07A0D68F32A180CAEFEBECA38444F2
          FBFD7687C3D33EC860D47FF876C308B54A86C09BBBB2801965A76166B8B31372
          AB19D5DF5CC5DDD25AFA96119435677B37FB28611B91D017802A212161B45EAF
          9F439910EB72B9B492A41CBEBDCBE760F0C27943FEA2D3109837E84907CDC76E
          A785B5C37AE50E4ACF56C0F2D80A768260FBFE7D920708965FC2A3D3FA0BAD27
          00D6F42443498690B0AC666722FFDE95F8DD98A4015BF47A090E2ABF4E27A407
          46541C29455D651D9D4725A5CAB10F8FFAD06C99515768D6724F867A03608DB2
          98423FD89802296D3126BC1C8DBD74021E945B89CA5CDAAF6C2EC5407368B62C
          37CDA175F685E0C336AEAF0E3D782689E40D92A8D02CD98CD91EDF4942DF4110
          7B9BED0F01C0FAF7231948A20D19748566FBBD8D766FFF072699BB5DCDE485B0
          0000000049454E44AE426082}
        Name = 'PngImage46'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322032333A33313A3434202B3031303084501C480000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          000008BA4944415478DAAD5609505457163DBF17E8A6E96669D9048388FB82A3
          6692724B440DEA94CB98C5586A4CC258634C459D24E8C425D6CCA88893CC64A9
          B19468DC306A26223122082A88A22342096E6C62D81A698406BA697A5FE6BEFE
          DF48292033955F75FEF2FE7BEF9E77DFBDE73E0E7DBDE20B14F0B52D86CDB110
          2EC4009C9ADECD70582A61D65F84EEEE515C4CBC473D6D04775FA7E5FAD46BAB
          E66DB437ECF05306868D8D0841A8BF120A1920A25F16930945958DA828AFB6A2
          B3F9008AF7FE1D35B90FFA4AA47702EBDAA49035274BDDAE7786F48FE6543209
          8C342D47A324229E80B704880E0414522023BF1475A537CB519EFE01CA8F16D0
          EFCE6791E8854092085B661F5388548B0684468163D3B89CF0968A21F7E28DB3
          C162828891A18F8800A0B4F2210A2FE635A1ECFBF7712FF502FD36F446A26702
          DB7E5E27B3BB76AA646AAEDD50EBB6B535E961B73741E2A3927AFB8486058572
          83074642CA18B888089110D36C5E444EABD5E1CAE94C0D6E7EFD1E1A0B2F538F
          0EFC3E2708267D3C6C2633AA8F7C8FDA4C1DB5DBBB27B0A97600ECCDE5224864
          AEDAA20BC8D9598F96FB4EB85D7AB6ED088C9262FCBB43B9A897E74DFDED0449
          6080029CF3B1277C283ECACB6A5190FE5301AEAE5B03E5D80A8C5F9B1DF3FCA8
          17CC260BEE5DBF7A0E051FBD4F73D5774FE0CF6549701856223B691F6EA7D1EE
          E23EA194D048B01268E7118C61F32663DC1F3E9A16FB725058903FF1A398208F
          C8E9AF9F12389E7A15B53929C90818668A1A33E1C32DABA7A2A2993637614F1B
          0A57ADA339CEF4E481149CDF760D057B692DA824DC21D0509879877BB6CE9BA0
          C6F0F9D33176C5D70B17C4F9F553794326109049796FFC65FB310B27914AFEB5
          F57549338564BBDE8C2F377E7E07B7B79CA4F1877A8A018A6B8C1656CB56DF46
          7076D38F45801FA67CBA5C3E34F69F1F2C8DE5A42C0E383E26E444BFE46E23D4
          7E720C8CF0878566282B6BC4E11D7F3D87AAE43C1A7BA42702CCED0A16245D56
          DD5B20AB31E7D09ED899935E9B3571305C2E81044B5709DFC94EC6C5346B66F6
          5D9CDDB5E1DF68387D899AD3FA2644CFBEC418B5641CA25FCDFDEC93D77C9917
          98564885A0F4E420DDA4E4915DFB2EA13865ED01B495B014CDFAB508709898F4
          1C64EA8333664D9AF646DCC85FB242C2C8D0D34504BCE5C09F369F4273FACA64
          589A7EA271F98F0924E8A450E947A353AB47250949DA06339E1690A705E5DD82
          B930B4258AC5AE516306078962C74761E420B52738248236FC42C00778E3ADFD
          765C5BB90F6EC711EA728327F0E94315DC0D17A28254CFEB4C4EB7A1D34682EB
          D50487A31E0EAB063633C15A0F9B4503BBE53E5216968169FD92537258B8C6F5
          2B66AA4647CAA936D15EDB79D77B89F8A758CC07899B6E6D463B56AE48AEC1AD
          D53F52D3B784328140E5A6B94315DB3E9BDDDFF3D94993684840AB7456D4B5DB
          F0A0D50CADC18C076D1668DB8C6E93A1E330F6C66EC4F4FD90F40BABFF6AD36C
          51870950920A7A9141968AD247F582C5000525476DC5A5CDD8BAF1CB7C9427E6
          929983846A9EC0C6B2F3BB1644CEF8DD5039341D24A5844EF28183065A096C65
          ECC98819E9FDABD47CA7EBC8A215E868CCC6FC53DB653ED2B7C3FB29B9FE6A05
          824915C383151810E48BE7427CD12F40EC713F4719F0B7CFF371E9BB6DC7A0CD
          6285EA04A18127B0BEAC3E77D5B00805E54E1D89AD8302C84AB090311B19B6BB
          7832CC7869830927B2F274383C3F192E470A58B1518F9907B16C04BCD54AC843
          14F00A52C1AB5F20447E21904982FDFD9572855CC6359416DF405962115CF64C
          1A7791D0CE61F5753FC8A5BA928F7F23AE6DE3F395C122907012FBE2BA765CAE
          6844A5A6D5E96ED6DCC5E51D37A0BDC90E1FC7D92AC00B571881EA21945DE04B
          9BA08054A980442E85B989667457513B4B4126700E0EAB725E1818115C90B26C
          141A0C7CB43A5DBC7146C4453E3A5A50832BE9A9F938BFB98E4E40AD34B08650
          442821E80531927681E48927450764423F56059BC0AB2C35C467BC3375C2B003
          9FC40D428B707CB00B6EF778839E6672FDE6FD591DF861D96E74B69CA35E6CF5
          8C081BD19D4A72DD7C3F3A4238BB8E21026713974E8FD93027260C66DBE39CB5
          DAF9C0637BCF7A67DCA8457E666A3A323F4EA2CF6282E9D751B0E519A9096F4E
          7E7550B0CA63BC426B4087C9819801819E95DB88AF99C85888D4EEB42B6ECBD5
          BD5B5172683F8DD5A0FB02F53F125876F64ED21F678EF2A204A61317120EE6DA
          A89AB876C6CF9059898089BC626404C80D2D7A1B7E4CCFD2A330F943549D392D
          EC67CF67BE59D971E4F8A5C88C5B2B6C97FD69026F65777CB1E6155F563CBE38
          7513B569DB4F504A39A317AC7F73E98CD16835D248A6030E7E071B1EEA91977D
          A105D5E736A078CF4921089FF6C49C338B606BFF96B4E21B5C4F3805FE4CD1FA
          3481C527B3478E18FE8A8844FBCE7FCE172163CD2DDA8B9B587070C99469B12F
          0E8F0E87C9CAC702CB0E176D93AEB513F939971DAED6BAE3D0D7EDC3F5EDD73D
          513DEC0729224593C9836B455EE2792EA3C188828444585B98F12BE0CF154F10
          887C290AA1E3DF83B92508E56916D83AD9D12B17D173D574EEFB2E76466C44FF
          D0805F4830305DB793E3AB4AEFA1F17EB5DB66B4E8A80874C06D0D960504F928
          878CE10C15A56E6BE1EEFDA839514FF3B1CA570A21F59E4C0F76B41A408816BE
          AB09759EF7B1CB6762D0BC6F5E7C694A487864282C163E353DDE700BF9C4F18A
          69A5587153D63B48F335E7F360BE7D3A13B7FFF1B36731405E4FF1F2285F9960
          C8856F56861D42BB0A03E36231627162C4C80923464E88F1CCE0A97A824C3322
          CC1B6C6B3AA958355CCA723BEE659C41F95E2DD9BB46DD7308F55DE6EC9640CF
          59C24828FA8FC398F878848C7B3D7CF010B93A2212323F15BF7A4A0FBDF62174
          F72B60AA2A6940D5911CB41451E8A2907059F0A6AD3703CFBA581F763E8C8432
          7212C2A74C846A28159EA008AAB1DEB01A0D30D6D4A2E9AA06BA620BD55EA60F
          4CA86E11B4BD19EF2B8147FD98A6B3621321C40B8B1B7FF012CB82AB85500BBE
          C830C3C69EDCFEFF10E8DADF4BF0888FF0CEDA5C02894E01CF34FCE8FA2F6FFE
          A9F66A69F79B0000000049454E44AE426082}
        Name = 'PngImage47'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446920313820466562
          20323030332031343A31333A3137202B303130301206BEAC0000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          000007C84944415478DAB5577B5054D71DFEEE3ED80564170179490404793F04
          A32864B4A2343A9A1A9DD63893169D693393692776DAB1FF39293A4EC7F7884E
          53EC688399364C8CB1113341A506102B22886CB10BC822CB9BDDF0D8CDEE02CB
          EEDEDBDFB9BB6CC01AAA84DE996FEEBD7BCF39BFEFF7FACE590EF3B8763D4878
          67D2EC789383749DE0E01F7EF9E3A7FB308E61FA647FD9B5B8979DB05B9BF2AE
          DCA6FC606DF436CE28D7E2DFADED68FB6CE884F6D4F079FADC4D70FEDF08ECD6
          A4E64F9A9C1505EB727C56C8F371D758018BDD8CA6475A53F38181FD960E6705
          0D1B21080B4E60477362BC73CC59B73E7B7548904A4D1678A82756A176F82A0C
          C611B4D5F656B4FCC6F87B1ADA42985C5002DBBF4A50F3E0EFA6C5AF488B8B8A
          022F90839C80C5DC32B40EF6C3607F0AED139DF0A4E4EBA2A1BFDB2ED1943E82
          6B61080890ECA85C712D6C69D8F695898970B9DCEB721C07891458E2CAC2F5AE
          2B989AB4A355A3D7B7BC67F8356F460D0D312F08815D77134E2864FE07D666A6
          C3E974BA0D4B24DEBB5CA680D9A88266EC1EFA070DD0577EFDD7EEA3E6E334B5
          9D30F5BD08EC6C4ADAC75BB9BFE4656478C73D4B4022E1B0581A23DC6CFD27C6
          052BF744D735D57D7CEC80A5DE7185861B08FCBC08BCD19AB88C1FE0DBD7A6A5
          2A1572395C82E025F0AD7137A4520E4E4B8450A9BFC98D8FDBA1D70C3EECFEAD
          F977D4900D34C53A2F021BAFC706F906E04B8197AD5E12182889080E46A0BFBF
          5880FF45402685BF3440A87BD283C1F13EAE67680886ABE6E2914B937FA4A5BA
          308736CC950209E11555926247508E2233304FB966795A58DAAAF8789184DB73
          A997848C48489C41C2B57F5551CC79AEA3B3C7345464DBEFECE2E7D486FF5584
          4AC2124264F42FD43FCC288C3CBC2621C14B40242191093E3E524E422D21934A
          84F65E1BDA47749C717414DD8DC68AB1F7ED736AC38BE8001BA3482E59FC5674
          7268E9DAB878B1AA4402D48619EAED385E731CE9D151488D8E8642E6275C6F6E
          E25C70A045F75430965ADF9FBAE9FA086E6DE05F9AC0F9F3E7636CE689BD3AA5
          666F7B7A55ECBAE549AC12BD0492D41B71AEFA0C6C5353E8F9660CC9314B11AE
          0AC3E3BE2E18CC63BCED43C79F1DFFC0DF68A9878489172270F8F0617F954AB5
          8BFA7EAF42A1F841567A96D41466C01FFA7E858D2B32C564B2FC735425CB17AD
          C295A6320CDAAC48125EC31AE96BF8B8E712A426B9CB72D356AEAD6DEB76395D
          D7684A239ED311330970172E5CC8B55AADFB48ED7E929090A0CECACA4230557F
          437D23CADB3EC557311FE3F5C42CCA3B59E6DC1A10EE97802F345F60C06242B6
          EF1614A7FF09138E09E83A3BF1B8B5056D6D6DA3268BE92AADFBD1E5CB971909
          FBCC547809949494D4060505E5A5A4A4708924B97ABD1E0F1E3C8056AB85C00B
          1048FBEFC5DE404F7007E283C39016158D203F7F6ABF5054696BD16719438A7C
          2311F8000E890372A61D24DB26938991406B6B2BDFDFDF7FEBDCB973EF903923
          3C2AE92570EAD4A9893D7BF628C3C3C3C1F33C6A6A6A505D5D2DCA2FCB37EF22
          D2531CC5D0027D4C3B34C1F55005CB911D9980C6AE36E84C63389174126F2FDB
          0B5ECAC3C7C70776BB1D369B0D5353538246A3E1C821E1F4E9D33F2773AC3587
          6611387AF468FFA64D9B2299314622323252345E595989DBB76F8BCF540F502D
          526111299452EE8B76BF16DC515423124BF1EE2BEF6155FCAB805C80D3E56446
          4547C8B0F0E8D123160D8EC8D8CF9E3D7B86CC5D20E86612E08E1C39A2D9BC79
          73BA52A914958E79101A1A8AC0C0404C4C4C88249A9B9B45126C8C8FDC074A1F
          5FF81124722A48EA88C8A84844D1764DF3050A3B77FFFE7D4C4EBADBDF938E11
          EA2AD69225840E82E02570E8D0A12A22B081AA7F96D43283AC1099512A24D4D5
          D541A7D389BF33B05C4753FFC7C6C6C2D7D7171D1D1DA8ADADC5280911EB1416
          8569188D467D6969E9279E0874CE2480A2A2A2CFF2F3F37731AFD9E09932CB08
          F9F9F9212020401CCBF2CAC2CA08B082F5A73DA2B7B7578C92C16010E708A496
          6C1D7667E963CF0303038FCBCACA3EA7253E847B8FF896C0C183077F49DE9FC9
          CECE96C7C5C589219B8EC44C328C084B0FCB31F37E78785834DC496D2793C9BC
          8619D81AECDDE170301202A5F0738A4E3D992B23F43CAB03EADCDCDC1F11F6C7
          C7C7BFBA7EFD7AB074083376BF6922ECAE56AB515E5E8EA6A6A6E71A9E7E669D
          60369BF544B2B6AFAFCF4476EE10AAE0DEA06611A03242302179EBD6AD3B3232
          327E96939313929797E72E9219E7004680A5A3B8B818168BC56B7CDA307B6786
          A9006D0D0D0D1544D24ABF3FF5A8618BA7059DCF9362B605FB1222424242566F
          D9B26537E5F80D22244D4A4A12C32E4A301161044E9E3C398B00BBB331147281
          6AE2CE8D1B37BAC7C7C799E8341334845E8F1C7B0FACDFB519C9584A08319999
          999B282D8524CBA93B77EE140D334FA9E28563C78ED10968DC5B68CC6B6AB5CE
          5BB76EDD23D56386B484264FC58F7ABC9E752E986B3764DF7C084BC8EB146AD1
          37290A6F6FDBB64D555050C08C0AA41D1CEB73E63569859594AEA2B1B1D14A9F
          58B8D9EED70AF7B97012F33C904CA7C59FB03422222277C3860D6F2527271714
          1616E2E2C58B1C6983D0DDDD5D4DE1EE2512064FB819FA9F0DF77C094C5F7242
          2061F9CA952B5F27FC943C7551B8EB070707C7E9F7C79E7033EFC79E17EEEF4B
          607A3C3BA685129209A9706FAD2CD76D70EF72DF19EE8520307DB19665695179
          DEBF21D8F0827FC7665EFF012824C84E45DB583D0000000049454E44AE426082}
        Name = 'PngImage48'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004D6920313720417567
          20323030352031303A33313A3335202B3031303075E0E4250000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009964944415478DAAD570B5093D915FEFE3C4820E1694220844756509405
          44F0C556AC2FA4BAA3D6BAEDD8763BC36E9D76DDA9D5EA56F1B1A3BBADBBCCE8
          3AE3AE8FF5858BA2C2AA28E2732B0202B2A282AC2250155179058D8690049290
          F4DC3FC1D1D6119CE99D39F3FF7FEEBDE7FBCEB9E79C7BC26180B1716381D26E
          7786994C0691561B9AE8E9295D64B3F504188D5DB57A7D7B617DFD8DD33939DB
          1ED1521B8973207DFF3DB85783D6897C7C2C1F58ADBD7F16096D715E5E4E619F
          DD8E670613BF256A980641410AB4B6B6917458CDE6AE5283417FB2A1E17AE1E1
          C3FBDE88CCFF10D8BDBBFE2D9349973754EB9B181D1B846E911CE63E0E4E471F
          843633CC6DCD68B8751FDD662766CE4C81542A457BBB0E8F1EB5903CB076771B
          2E3D7BA63FDED878ABF0D4A923AD03917989C08E1DD7B436ABA56CC68C48B539
          4085677D80DA171009480BBD5B4895C102880D9D78505D81BA3A1DDE7F7F363C
          3DBDD0D7E72471A0A5A505F7EEDD4553D31DABC9642CE9EE7E56D8D878A7E0C2
          85C25792794EC0E974721B375E2C9B991695FC54A181D5F00049C3C360761030
          81F7DA5C4F9315B0D3536A31A3BEE838DA3A2C58B4E80FE8EDB5BA49384917D3
          27C0CD9B35B878F12CEC769AB5F6941A8DDD87B3B3B38E121C3B4BFB4B04BEF9
          A6F237810AE1E1A84909902B84F870CACF306AC23B589B998927046A21212EB0
          F43AE9C9C14684E4FA669CCE3D86196953317A740C91B011984B5F7373338E1E
          CD875219436B85301A9F40AFFFC96930B41DDDBFFFC0DF69490B89F50502E5E7
          26A504A5B6FABD85240DD0DAA9C76FA74CC49CF43F227DD9529809B0A9A11919
          EFA52163EF09A8B5C3E02D026E9DCA21C5BD58BAF403B7F50EF4F4D89099B919
          0E8703F1F1B3306448249E3E7D4C24CCE4955C5CBA747A7D55D5D52C827DC413
          58B2E4883822DC573F654EBCDCEAAB844A46FE11038D0DF7F09777A7E3F77F5B
          09F5D0E1D8B4F843CC4AFF18B3FFB404568A05919036DFA944DEA1026CDDBAE1
          F9B9161595A1AAEA21C46219C54331844227D2D337C34C5634345460FFFE7505
          172F166FA5A5977902DBB717299C0EBB2E717A02E7A952404E9675B350F1002E
          159EC5F582C3BC35CAD87198F7D1C7E8EE82EB3C68F8E86E227BCF016CF8622D
          BCBD65FC6F99995F13781C7D0F414DCD2ECC98F111C2C2A2C1115A5DDD6522BB
          FC447979C5715A7A8A27B06AD5414590CA4F37267514E7A10A8627113090CB39
          B2F0696727B2572FA2347460FE9A2D08080E8195E2414A3B6D44D2A7BD065944
          E00B22E0E7E78BAE2E23D6ADFBD262323D91281489029DEE472C5CB81B02CA24
          0F32E8D0A175CE7DFBBECD6A6F6F2F26E8333C81F1E3C78AE7CE5DD592326DA8
          D2A27EDBE55A16A1342B24329D2D6D1448762842426123702B65814202F41001
          CB8DB33876EC0CA5F0660211E0C68D3A6464AC395D5E7EA1232565A246A50A9C
          1C1E3E46A456C7526A96A1A2E2DC79727F23A93F4652D51F84DCE79F1FCE8B19
          E937DF3F610AEC52319F1ECF23945E1C04D647116E27D7CB88A050E02251B033
          9352D4894F3F5DC92F3D73A608AB5767E454575FB9499FFF56A9541123478E18
          27168BE44D4DCDBA3B77EE9829E5AB68EE0792B6E704962EFD6AA626447D32E9
          9D619C3D2C81B7B27F9285039D004F8245BE8408D868D25E5784BCEF8F63DEBC
          39983E7D2ABFF6BBEFF2B076EDCADD0F1F3631800AB71DA124112452064A729B
          A4F5A534A421FFE4932D59DA8880F96F8F1D0547480CBA290E080F025A25E65C
          C02C1D3DC9728F966A1CC9FD1E5E323915A285502894BC924D9BB6E3B3CF3276
          74751958C1A9243193D00EB00825BFA1F79585884D46478F8D4A4BFB554E44F8
          90C4E1315A28A2926093F9A0C7EA5A202335DE5613EE5DBF88D2D272F20C87F9
          F37F89A4A444FEFCD958B3E61FCECCCCF5DBED767B367DD6B8015FACBCAF2EC5
          EE2155288262A64E9DBB2A7268D45C854222500406C0DFDF9FB639F0B8534781
          D40C1D15A9D0D0304C9B36916EC5607A0F7DAE60F9F2D5C64D9B36ECA3D79D6E
          57F7E1358373158EA70152A94706C709E2E98EBFBE62C58292AEAECED871E326
          A56A34E153FBFA589DB7536E0B09508961C3221118A88488D2253E3E9EACE7A8
          D80828536C58BC78D9FD5DBBB61E21B5BB581062806B993B79B2D9C3E9B45C8E
          8E568FD668E4D0E9EC686CD477DDBC5979A8A2E2440FB9F7AF313123783D0C84
          A3DC64E556229160C48811F4F4701310C160784A29B8AAF6C081AC02DAC04A6D
          D3800472722EFF4EA3511E183346434A84542C84FC6D565FAFA7AAF5D069363F
          E624121B0FCAD7055AA3542AA0D184F21E608484428EBC23A2ABF81105E0FAF2
          FCFCBC33A4FB00C9830109ECD9F3C3E6E1C3C3970405F9903522BADB2524626A
          34C43C91EAEAFBB87EFD367D73D06AC3F86AC72CE6A356E002679E1189C4B87B
          B781CAF0E7E7CE9F3FCB523017AE1BEFF504B66ECDFF675858E82AA5D29727C0
          802512170146462E97F2D65754D4D02D76056A7530A2A363685E42D63BDC1E10
          90E73C505B7B155BB67C995F5656FE2FD29DEFCEF9D70E2E2363737254D4C812
          A5728888013212FD045C24C4FC397B7B7BF1448A8A4A5152528C888828C4C68E
          A139299170920744B872A518DBB67D75B0B6B696112824E91C900089E7BA75DB
          D6060787AD90C9BC053299270F2895BEEC0D265E5E12FEC6CBCB3B84F2F2629E
          506C6C32121327F131505C5C809D3BBFDEDBD4D4748EF43212FAC1106012989A
          3A67C18409D3D2030343A80BF6854C26731F09130FF28407FDE68573E78EA1A3
          C34E4D462C7540466A48D9B128909CFC2EDD03FBA8A9DDF1AD5EAF67597089C4
          3818026CB08AABA46A163379F2AC5F24274F7ECFDF3F30D4DB5B45567BB98393
          05A515274EEC25F091540746D31621D5071BA5ED7EAA88CB70E4C8665B5656D6
          6EAA820769F22A49CF6009F0410D57BD0E22D0B84993D252E3E2127EEDE313E4
          E7EF1F0E7634DDDD6DD4E1FC4484E4E8EC6C804A954401E849ADD66DC4C5A592
          0776D5E5E6E632F7EF25A987BBDE0F9640FF60DEF02609F1F30B189D92F2F399
          5AAD76AEAFAF5622930DA1DEFF1A2223D3C87213DADAAA895407C5C16C3C7972
          0FA74E65E75756FE788DF6E6903463107F4EB8D7FCCE88D0BF0284A954C1E3C7
          8D1B332724247CBACD66E2D4EA143A127F8A7C011FFDEC22BA7DFB843D27677F
          B6D1682CA63DAC103D1E08FC75045E9CA7460A0124DAE8E8E8C90909090BBCBD
          7D62FCFDE3894410813BA82BAEA182555A585252CA6A3FBB07AA492CFF0F022F
          AE63CD442095E2117401A5D1B1A450551C6EB55A4D0D0D8D655555558FA9D329
          832BFDDA06E3FE3721D03F58B7E845A22661375494DB3BECCE6F20B90257FDB7
          0D56E19B12E81F2C3EE470052BEB765893CE9A75C39B80B3F11FCF7CE596E943
          DE1A0000000049454E44AE426082}
        Name = 'PngImage49'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322032333A33313A3434202B3031303084501C480000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          000007364944415478DAED560B5054E715FEEEC2AE823C0C28A11405243E627C
          A075C558456D6BC6473134D298D6583B71DAA679D9686D48D599B62131B5B1E3
          B431138D9868306088C0607183A80BA2519E0A28B0845D76792C1B60D90516D8
          D7DDDBF3DFBDC48D469BD6B49DE9F4CE7C7BEFFEFF7FCFF9CE7FBE73FECBE1BF
          7C71FF4B04EE644BF8F711589B3F0ECE8154B8F864B8310F72F9FD70F302DCF6
          4E789C55700DAAA03B781A56C320AD767F7D0412F3E48854BC00BBEDA5FB6263
          274E9D310571311330762C30E2028C66015A6D27CCCDCD70B669F570F5BD869A
          B41C7A9311E1EF8DC0C68A780CB665DD1715AD5CBD52896F4D92215401740C00
          9DFD80C5010C51AC2E0FD04A6383163BCC654502DFADCD40D5F657C84217C1F5
          AF11D85CBE145653EEC224E584C793BE81C800A0CE04D4F7905327ED31397592
          7307BBF3DE67272940F0037ACFAA04A7F69383A84FDF4B963A46497C75025B6A
          9663C0782A397979506AC23838C881BA15E8A78899CC3C1EAF33072340730E32
          3FC27B89B0E40BE4C9947782171A0F6D87E93C4B075187C797C0E8F3EDAA7DFA
          DA6C58BBCA521F5D169A3A2700D61172AEA764D24ADEE335CEC01C59AC2E0C13
          0B2E20404CC330ED8C8BC87864F46CEC82E5CCFB15A879E9655A5A41B071D858
          148AC0E0BDC46531F12E4146F22B2C739FE76963D578F0DD556B562E8E7F3231
          548CEC9C8171BF1999D325A0A6F23A0C9A660706BAB5703BED181B11AD080B9B
          183E7D361718150507110169C5987F52F05CDEB90B039AE334D2CEE127678ECD
          7B2876D3AF564FC59EBC3A34959FF9334EEFF8AB942737B65CCE4E983671C3B3
          ABE211E20F14EBC8B7E08D5E4651198C169C57A987D07042056DC110783B4911
          5651EDE1734210BFF13B217357CC9B305F296AC25A570BDB99F44C183E7A9BD6
          D470D85CA4CB78F191B80032DE4462FAC307EA1114FF7E2BF4A505D8DA90140C
          DB899D4F28B959E15EE7624E297A3F129646DF0D75A1AA1D2569A51832D1DBB8
          4A6822F449E5160845482C127EBB7BC2F2C71705C5C661A8CB8C9EDC3D65B8B1
          EF2D9A2FE6B04955F2FA9625CBC28283601A063EEDECC3FBB945D750BC2B0D29
          870EFD3C65E9E4750F2A506904CC76DA7272CE3141F5D9F0514EA1091F3F7316
          F63E2D19BB40686032203825F5C8441231EB1EC6B4270AA6ACFFD118E790071D
          997FD2E26ADA9B3497C3E1C9DCD79257285FDEB0301A2DC43B88F29471BE098D
          0D0DCDB367CF99B66DF5031822A56BAD5E790A8257BA6F669D73790A9ECE465F
          0B534411A15E6A349E5B24CC892496BD9315B1645572607434F447FED28DCAAD
          6C078E71587FF8FBB1090F9F7A7DFD4CB4F44AA5403FBF3B598EDFAC5B885911
          1CAE99A45223F853AA4E9635A0397F5F2EAE1E613A2924544A79BF53DFE7B0F4
          C02F83A72D381091B810DAC3077A50F1DC611A3FC261C13313B1649321F3A945
          016D241F8E4C7032AFA5106AADBD43540EBC57748C5857DF30DEFB205F87FCCD
          17E071AB69F4EC684DDFB58F28D395F249F32A62BEB7062D196FE851BD239B46
          3358C0FE78A1B2F4D5C71E5AAC9007888ED836337FECCE04E791A257C881FD05
          558239EBD94C7454B4D0923C42B34FCEEF7CF2CD7C2E849B9C64895D992C6B3D
          F66A056AD33FA6D1A39C18D7F39FFC317551DC8EEF4E8FC4A0C3BB7ED4292F75
          39167D93B11F5985975CE8BD7109A1533C18335E064EAE00EF36C0DCF01654CF
          57D34AFB1D88F861557E6FD4FCF9E38D39BB0BF0E9D18B3496EDED7EBF3895F2
          E0F41979BF5EF180D8E5041F02CCB9D8F16865FF300F23A9DF8FCA40E6271359
          719C1C26F3008A2F565AA1DEB3019D65572431DE4A82C3DA53FAE088F0C983A7
          B7BD8BCFAE5CA2B1BF7909ACDD1581B9EBDB327E983066D0EE4DA62F01B74FCB
          E5A5B4B8A57EC0E6FC283505EAEBD07DB8F30D34171CA5D735F039F17C08E838
          DE314938F7D441B806580A2E8CF67F7FA45DBF98BE666A6258804214DDE8F6F3
          9E9B77B7047E5423F4B68DB27FB5B11D972BAE5990FFD3E3D4133EA4A92AC2C8
          6D041E55B5A2BFA317253F63E26522ACE73E9F4CABDEF7E305312FAE880B87DD
          FD4502A2107D64CEEED70D16546A3AA0D7EA7AD17AE1326A8FF660D84CBD12F9
          92306FDF8175AA2E684EE440F31E5B974B68BB791A6E53A7CE9D1E9FB33D7112
          069D5E026E69DBC59646296F333B7149D389724DA713EDB5E5A83BDE8A8E4A27
          9563372D6155512739B77DA9101F2B51A3F007B97058F4F48F89D0729340CADE
          48B932B93D3365863F132253BD1F6180AAA2B4A507A5CD5D82D5A06F427D762D
          1A4E0FC3D14FDF3B30480ED99DDA18D841E4B84B39DE4F984BD049EFB87CBF07
          FCB1FB46E9B66FC72C5EF0CD71B8A2B7A158FB191A5B0C3DD09CBB829AEC5E98
          75ACC43AA568991193E4944E11F1F0B9EB1730C4031941046A6F62EF10BEF841
          92BA3F099133F7536D47A1B3AE11D5C7F568AB7642E0D949A7951C3302165F23
          B887EBD64FB240C22C4222218C609622D54BCFACBEEDF8476DF71E08701289F1
          D276B17CDAFE892DBE67025F36FEB53BFD2A04FE63D7FF09FC1D3FAD6D5CDB49
          3D090000000049454E44AE426082}
        Name = 'PngImage50'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203134204E6F76
          20323030322032333A35393A3234202B30313030B95D9F780000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          000007B24944415478DA9D576B4C94571A7EBF99E1227291C141B1B3AB802089
          28525C35B0040C3FB6DBA43F76A3D868ACA9B5DBA62D36A96D09D2FD512A6405
          FA430569B359EA6A532FD44EA93656936A63B1B51057AD1650601818AEC3452E
          6518E6BAEF73F8BEE93040AA9CE4E57C73BEF39DE7799FF3BEEF3948347F93F0
          67CF9E3D413A9D2ED6E974AE71BBDD894B962C591D1313931014141C73E1C257
          250683A196A7FDCAE6A2053449793879F264D4A3478FD26C365B62707070E2B2
          65CBE2B55A6D023FFF3132323270E9D2A5924E174D6AB5CAFBF177DFFFE0F8E7
          C177F3EBEA6E7CC63F071742C24BE0D4A953EFA854AAC33B76EC90D46AF5AC89
          1E36A7938D1F5C6C1E37912A90E842EDC5F1C2B7DFCC331A8D5FF3942179EA93
          136099C3F6EFDF7F223333F3EF5959595E50B7EB37501783BAE55E90E0F72A0D
          D187C5453F979514ED77B95CB7E4ED787202DC34F1F1F16B76EFDE5DBBEFE57F
          C4C7AC8821BB43066673BBFD48C8CF1E5E617060905EDFFDDCB19F6EDEACE475
          DA20D64208A0053181DCF48CF4FFBEF8F2AB92CD3ED363DF672F11A8C03BF679
          F571F37BEFE4BDC5817A958786174A002DE2604141EDDF9E7F212B3621891CCE
          991ECF50437E76F32A7D5D9D94F77C4E594B6BEB7F788D567ACC809C8B807ADF
          BE7DDB5252379ECEDDFB8A64B3CD069DB50DDC4B0144C5AFE55EFCF28B9A0A5E
          E3C6E3C68234CF78787E7EFEED17DE288C0B0E0923876B762CF8AB429C9DDF9E
          AE6A7F3FFFB57FF1AFAFD8FAE93132623E02EABCBCBC8AACBF6E7F75EDA64C11
          8C6ECFDC4A4067A4247136DCABBBECFCA4F4DDA31A4D80E1D6AD5B0D3C6AFF3D
          12F311A0BD7BF7EE487E3AFD4CCEF6977E23A0482F4DF7C8008C3DEAB7509FA9
          894CF7EA28396E39F55B06DC636363CD56ABF5425F5F5FCDD9B3677FE125A7E6
          22332701AE070192243DB32824B476FB9B87A429870C46D37561A0BB8B7ADB1B
          A9BFA3892CA666923C0E0A0F8FA048AD96B2B3B7525252123138DDBF7F9FEAEB
          EB5DC3C3C3DF747575959F3F7FBE9E97B0619919044A4B4B35212121995C48B6
          B265F0501A97E2F09B3FDE90B6BF5D4916B3917AD8C35E63230D981F8AEF2300
          18A9255D7434F791141A1A2A7A3E2B984CB8F8AD54D4DBB76FD3952B571C9D9D
          9D55353535A54CCEC2C30E41E0D8B1637FE6DCADE60F13A2A2A268E5CA959E84
          84040A0A0A920A0A0AA8A7B787342A89C2C2C249AB8DA2A53A1DF75A5ABC7831
          454444A082CE00F4704AF07AC20480A4A2007500D9ED5374E6EC19AA6FA8379C
          3871229F5F752046A423478EFC2F232323950F1B72381CC2F8E4F3040404B8D9
          2493C9240D0D0D494C88498411482A1E634C0162E504B862BC8562C7AF5DBB46
          264D33858487528EFE59CF970683E7F295CBE557AF5EFD883F334BE5E5E5C66D
          DBB6C5F2410460B11016557A1EF7C04BEEA5C0C040B130DEA1E1BD2FE88CC63F
          BFBE7C91EA369CA421D518B559BA6997EA0D5A3394EC36D41A9A5885833CEBBA
          54565666CCCDCD8D656F6780FB3F437278AF48ECEFAD32170A4E4E4EB2E4766A
          6C6EA21B91B5341A384A7A572265DAFE42A3632374FDFAF55F2B2B2B3F6002A7
          05815DBB7609057C17861ABE4AA0074990C0B3020A9B9A9A120660BE4F080301
          A7DD49D68949CE1C37395D0EB23BED22ECB946588F1E3D8A8AF96F8933C0B873
          E7CE5878E8BB05CADEFA130109CE9859800A0918C0615043D99AF1F1711A1C1C
          A481810190B756545420063E920E1F3E6CE2F37F2526218510E188667F328A61
          0CC0C8730518604A8FEF94F8F00545C3DA08E0F6F67685C0C72060E6B2ABC782
          5CB5A8B7B7574437B202A6049DA2041AE7337171F17AEAFB8E2B20592C16010C
          47008A6DC333E642C1E6E666EBF1E3C73F160A949494980F1C38A007901260F8
          D86C360B3250852FA1828CF2FEEEDDBB024401E5BBA4F80606000554A3D18879
          B09191118A8D8D15E3ADADADD6AAAAAA6902C5C5C5663EF9F4084225979585C1
          B8BBBB9BB816884556AC5841AB56ADA2870F1F0A83B430BEB8CEF05421035038
          064551AC3007A43A3A3AA0C0740C1C3A74C85C5858A8F7A62F13F00F44F4D86F
          BE78423E6A6B6BA38989096F6A823CB6040650FC06108A158AD7A2458BC41A4A
          ECF0BCBEEAEAEA4F450C141515FD141717F7A74D9B364928C1F3115152141E5E
          BA74897A7A7AC482FDFDFD62DFD1000A30004315780F1501CAE6E42D6DB873E7
          4E2B07A18DE30627E479893DF8C3DAB56B5F5CB76E5D0ECB9BBE71E3460D9311
          A9369F2220806D81B730544800C3E0BD528C38333CEC6D131F46F71E3C7830C1
          63E328BF6C2D6C38D53A701A06B13DC596B07CF9F294CD9B376F484C4CCC4949
          4989DEB2650BF14DD9AB0A8800808F55B11DF04EDC5E581590C36FDE2A0F2BD2
          D3D8D8D8C0C13A3C3A3A8AE3B79BA66FCB46369C84236C569419E53EC0F71982
          CB4B40863D5AB3815B6A6AEA166C0F9352810C8209EDDCB973D4D2D2E20D5478
          CC128F33A91FB8CAB1D2BD53AC9C450604700F92856DC2FF96E47F2151140963
          D3B1C5EBF5FAF5696969A9AB57AFDECA84B4D9D9D9E284433032B883B3A4BEA1
          A1A18DC11DAC10FE336A97412135AEE7E3F26DC84D73B4F9AE6418C76D62315B
          249B9E832A29393979C3FAF5EBD3D93B3507D32F4D4D4D932C3922B093A6AFE2
          269AFEF70C639332E8C2EE843E4D25AB12CE160D55D856C9043B6550DC804765
          895DBF07FAA4047CE76A645542E531EB5CFBFA24EDFF618C27C7D75DB76E0000
          000049454E44AE426082}
        Name = 'PngImage51'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500446F203135204D6169
          20323030332031383A30333A3034202B30313030B7E0E7160000000774494D45
          000000000000000973942E000000097048597300000B1100000B11017F645F91
          000007734944415478DAC557096C54D715BDEFFF59B0F12E6360824DC1490334
          EE10DB3502958A5641C216440D7591588C0CA592458470588429940A81008368
          4530D01291A0A0940684E3603015486631051B5ABB103B58C50B1E6328DED7F1
          367F5ECFFDFC3F9A9871D354A17DD2D19F99FFDEBDE7EE6F04FD9F97F81FCB97
          2F9D40797979746767E7524551165AADD637841061BDBDBD558F1F3F3EB47AF5
          EA8BD8D20768DF3A819A9A9AE48E8E8EEC90909077222323ADFDFDFDDED6D656
          D5EBF5524C4C8CD2D5D545A5A5A5B959595979D8DE0C78BE150250FC162CCC09
          0F0F9F3769D224454AE9A9A8A8100C9050EC76BB183B76AC77D6AC59A2A7A747
          DBB76F5FF6392C8384F7BF220025A2ACACECEDA0A0A0ADB0F6070E8783545555
          344DF3DCBE7D9B2A2B2B55BC13369B8D2C160B210CFC5EA6A4A4D0D5AB574B33
          3232B641CC5DA0F71B11B879F36610E2BA746868E8BDC99327CF888D8D15A617
          41CA7BFFFE7D0D965BD8EA3163C610F6EA04A05C278150C8E1E161B964C992AD
          7575757FC2B1C6AF1078EAAA9FDED9EB4E1F181C0A71BBDDCD0C1CEC06426151
          4A5858D892F1E3C7C7444747BF10BE67CF9E796EDDBAA54281080E0E26EC27D3
          034C0049C924645454146567679F387FFEFC073876EFB990775D3FA3AEF65FEE
          4A0FFDF1D63487751839EAF17808961204122CA288888851BDC5D623C1C8E572
          099014AC9CC11E30DC6FEEA3091326C803070E5C3A78F0E009FC542C68C55F7F
          A104CB0F362C7488038B1CFF49FCF5270B36574B4B8B76E7CE1D058A38E17CCA
          D96A13BC9FCFC203F2ECD9B37F5FB76EDD711C2D10F4D3A26A25D6F1BAF67E02
          4B278F26F5035C3E2397BF52DE6372FAB2AACA5B5B5BAB84C34B4C80DDCE04D8
          723FF7EB9B111E595C5CDCB07CF9F23FE0EB1F05A515B85F7BF33B41FFD83D8D
          DC6ECDA7C85FD9689F59B0A60DCB0BC56514611916AFC48413A936920AAC572D
          BEF89B49C80BE194376EDC68494F4F67022705FDF0E38709B3E25FBDBFDF499D
          DDC33EE5FEAC4723C17BFABBDA28F34C0B15D62834335AA377DEB0D2CA049534
          010F58AC3E4F98216002972F5F6E4125700E9C10E4FCED26B28DDBEFBE9A26DC
          035EB8FE7908CCFA1D2D04BC2C16953AFEF9987E7E897BAB853A6040BF14F4AE
          53A14CA70D249E7BC194C5044048E6E7E7376666667E02111FB2C4C8EFFEE437
          BFDABD216DE38F926285477B1E7B8EA57FD2052260B35AA8A6B6969C27147A25
          5CA19E3E0F858458E9CD1841A7D2436988AC7A299ACAF533369B3C76EC58E5E6
          CD9B3FC7D78F58A205987024EFFD9CA4E494ACD0D050955D869E4EDC4C46CB7C
          3D9E360B5D28A9A6A5C77A89A2B097CB2DC84E998976FADDDB11E411B61742C9
          04B66CD972FDC8912357F0F513F30D9370A4A6A62E5AB56AD566A7D33919138D
          D0DFB96C740281482002F2DCE54ADAF0FB06E141BC07343B457E2F8E6EAC1F47
          E342C7906A7D8180C47C200CA4FCC2C2C2EBF87ECEDF242631EEE8D1A3BB972D
          5BB69AA7577373B3DE8CE2E2E2BED24CCC1294481897AB5E08EF1045474590CD
          6E231515E081EB150BBBDFAEC7DFAF6A24CA9556AE5CF9515555D535FC746964
          7753F3F2F2962E5EBCF8145B8E06A393E027FABEDE60FC4B10BD423E79F244F4
          F5F571A7D443C60A39EEDC3DCDCF2661AE802B57AE6830F043B4F9CFF0D3CD17
          DA6B4E4E4E1C4AA40E6150DBDADAA8BBBB9B30D7A9A1A181A64C99C28D44F782
          51AE9243857B80C054D409B0422E3D13FEBD00EFBD7BF6ECA9004AA0EA14F045
          A0FE6E459DFE6DFEFCF909AC18339CD8C2A74F9F52535313C5C7C7EBD619E190
          2CB8B1B151B00790C0BE0134B21B72F9E15624D7AE5D7B1AA3FC1E8E9F015C81
          0888E3C78F1F5DB3664D165BC71E6012FCACAEAEF642C817B367CF76B2700E01
          462CCF7F7D583101730E184A7DB30013549E3C79B265E3C68D85187017A08773
          A033E084C3AD2563C58A151F7315C0BD3E02F5F5F5B463C78E532097387DFAF4
          19B052603C23115D3A7126C021E25098961BAE977C1E03E84C4949C943ECFD14
          A8063C0109E0F2381578989494A4701E30010687E0F0E1C3A7EF616DDBB62D6B
          E2C489716C39463021BBF527136070988C162CB98A0E1D3A54BD6BD7AEDB88DA
          9FA1A21868D359072280CDA90B162CB888A4139C07B8F3992424747721517F8D
          5CE844CFD803A58EB973E72A77EFDE6565FA34640F185E90D3A64DE3DEEF5EBF
          7E7D3E8CF912E20B805AFA7797D2BD7BF7CE4C4B4B2B4F4848201C12DC133814
          EDEDEDF4E0C103EFF6EDDBF78254417272B20325BB1F16BE3A67CE1C05538EF3
          42BF8E217C5A62622221E1B44D9B367D8ACBEB13882E02CA815E5FC251E065DF
          B973672E12270388E44B28EA56E2DAD5545050701D42EBB0E734F00CFD6126CA
          F63D842B75DEBC79FA3EE486843394A2A2A28EDCDCDC8B8F1E3D6A31DC5E06B4
          93DF1F94D108F0EFE391BD733113BECF77C2818101757070902F0CAD4005500A
          7400C1403C2A63213CB268EAD4A9AF21547DB8A2555CBB76AD15849AF0FE2FC6
          198EBB3652D1688B7B6884011E8DDC8B870DF775023D461C59868D0903AF0333
          00BEB50E719D0395007BAC7BA4F2AF23E0BF47359ED2102203EC530D6F847108
          019EEB7D06D1C151CEBC943FA75FFB87F46513F846EB5F160B4A86EF7C65CC00
          00000049454E44AE426082}
        Name = 'PngImage52'
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002A744558744372656174696F6E2054696D65004D6F2033204D727A20
          323030332032323A34323A3130202B30313030FF26557B0000000774494D4500
          0000000000000973942E000000097048597300000AF000000AF00142AC349800
          0007E24944415478DAB5977B5054D71DC7BF7BF7C16B975D084884A0A0961488
          A6326AA8363EAB08A2A47662718C6D4D4D529968493256336A3AFDA7B533E943
          C52626C1D01A4028A1098A4444944779082A8C2440586001795840765779ECE3
          DEDBDFB9EC2E8F942426F132BFB9CCB9E79ECFF7F738BF735786877C1D3C98B3
          DB6432FD5E1445778BC59C5351F1F1D1E6E6921E7A642513650F137EF870E13E
          B3F9BF7F8B8A0A93A9540A5CBFFE3906077B6EE4E5FDF985BB77BB1B69CAE843
          1370E8504192D1387062DDBA284EA7734373F31D98CD23E8EDED435D5DF17B57
          AFBEFF179AA67F28025E7FFDC21E93A93F25266619A7D5AA5055D50141B083E7
          79D8ED363436D6B56567BF7188A65EFACE051C3C78FE05B3B9FFADD8D815729D
          4E859A9A4E02DB093C2EC066B3E1D6AD9B86DCDCDFBD43D3D3BF5301FBF77FFC
          2B9369E05442C22AB98F8F0AB5B55D2E28BB0B82808E8E4EB1A2223BBBA1A1A8
          8E5EC9F83201CE67E2D78127277FB46B7878E0DDAD5BD710DC8D0AAE7B8AE70C
          AED7B7880D0DE5799595E9BD2CFC6457A708484B4BE19A9A4276F0BCEDA79433
          D168EC7B2735756F193D1A21136682BFF24AF6CF4DA6A1D3DBB6AD97FBFA7AB8
          E09C5D21191370ABB95EACFBAC28AFAA2AA39F5E296770B26E9780975FAEF2E2
          387DAE5AEDB9213A3A1C562B8FCB97AB470D86FA570B0A8EE7D09421327E3A7C
          DFBEEC1D66F3505A62E2060583DFBCD923013D790D6AF94BC8118E43765F09BF
          DA90F25B7917F4F44A9903DE45667309D8BF3FF72C2DF0B3B8B8A530188C9437
          19C6C62C282B2B1F6B6CAC38505A9A7696A60D4E16B1776F56A2D93C78263171
          A3C2CFCF8BB6570F045E80875D837CDB6964714711BD2004F72CA3F8B4FB8E80
          529CC6BF904AAFD6938DBAF27CE4C8C508A3B1BF61E7CEB5B2FAFA3E6958A190
          43A9544A392C2D2D1D6D6A2AFF6D454566163DBCCB442425656CBB776FF083ED
          DBE394FEFE5EA8AFEFA5B902D4BC37CED95391251EC52F976CC472FFD5A81FBA
          8E9AC1FFA0B6A99717F2C4D75002B6CE1D383B61727246825CCE7D141BBB94F6
          E8008139C8E572701C07954A45E9B09288B2111271A0BA3A2BEBA597D2569BCD
          C6F41D3B36290302BCC973967391E05A9CB7A5E2ACF047EC5A16871FF82C43AA
          3E454A8952A184D16485E19AB11027F007C2D6920D4B02B66C3914181030A73E
          2A2AD2CF6E97139C834C269304306391B0582C28292919A1169AAED53EF68BED
          DB37A98282349473E6390FB5A0433E4F61E78FE2F965F158E8B304FF68F93B55
          2ED5AE48EB718085EAAAA976F006FE84B7099BC7A2E0AC01C5FAF549F181818F
          A745463EA1F5F4F4041D1E2E01CC58445824DADB0D58BDFA49F8F93138F31CD0
          085AE4DBDF97C2BE3B7A3322B551486B79CB0567172797A1B57508F73FB166E3
          222A682867F22E6077EFC5E109CF2C8A8839161915AE75D7A824112C1213C661
          F66C8D34DED363A2BB0C1A5187023E0DD9E4D6EEE82D88F05E8C34FD49690E83
          8B2C9272A0B5CD88E10AEB65C2B691AE42E215B37A9AE80387A10C084282B63B
          7C67785FC2E6A783E3654AAD0C3CF570A700A92B894EC532A809FE8990861CF9
          9B78F1A967F07DEF2725B8E080B31EC62938B4107CB4D25A443BE036C1ABE941
          1159876B1B4654FA475ABAC632BD941E0B6769FD5063FC0C0B2A3623D1ED0014
          BE22EC82CD25408293E76AE85028FB001F72048FDE4AF02728EC2CE70ECF1D61
          D73378B5F512D5FD6D1ABC46C357C80C641669ADF9053E73EDF72CD5EB825606
          FC3868233E355E47CF6827320C2558706D0376BA1D2611026CBC753C97F4E745
          F0CBF274FC5BF157FC3AFA27F89EF742A9E0EC4490B972CEC26EC2C804BCDAD1
          805C70494048A6F79945B3C29EDB34673332DBDFA6E569FB412155EDA53E0316
          D4ACC5F3AA23E0743CA5833A1CB4289667E29CFB31EC59FE2CE6ABC3C7AB5D1C
          2F389163BB870EFA1623C62A6D85C87579FE05B82420E08CAA3379F18BC15503
          5770DF765F5A84E590F9C17322AE7677605EED4AEC727B031AB51A45CA749CF7
          3C813DD1CF629EF7E3F867CB29D845DEE139BD475B58AF277899ED226DB41E1A
          AA72C03BA6C32501BEEFB917AF99B7648D05FD18B55B25B8D3D892028928EBEA
          4268CD2A847A87A178F6BB485AB10DA15E61E4F9299AC74FC979EB5478250D97
          CC049704685E53FCD01626E62E0A7CF451ADBB0A366A2AACD93B454895CF09B8
          71BB07D631E0374F3D87208F50F27C22E7AC3C45CA79DBE726D1524EF073E875
          C09D9E5B673A49D9BB1E5C3C6284189C5C183C2BD0DFC3135676863301938468
          555A3C1DB01E46AB09453DF9D2F90EAA17D6CC29ED686D2178A9AD00F9E89B16
          F619E14E015213C21AAC453C52C2E7CE0AF4F372878544885344F0B0D076943A
          2415A9B4D5590428E786565670F60B54707D933CEFFC2AB8EB349C22220E2961
          731E097C44ED41E9F8622444E7DD99F316A368AD257836D8315AF520F0C90226
          44FC4812716CFE3C5DB08F97E7F827D53411EC7FB6D5DAF526D15A63CFA70EC7
          E0CCF3D207814F1730216205562116274343B58F69D5EE5413BC2B1D2CE7AC29
          B6B79A40F0F3E479AFC3F30786FF3F019323B19262712278BE66AE56EB10C172
          4EAEB753C1D9AE11FC43E9A3C2B9D5BA1E143E9300E7B8064B29121B713C60AE
          5788AF9F07EC36FAAC6E338BD66AFB392A3827BCF49BC2BF4CC08488084AC80A
          BC8A002CA756324CC1BE429F95ECB3ACDA01BFFD4DE15F25C0F95C4D1646B694
          2C18E31D8DFDB0649F54DDDF06FE750438E7B893E9C83C31FEFBC04C6622B37F
          1B38BBFE0794360CC7C7E41D7C0000000049454E44AE426082}
        Name = 'PngImage53'
      end>
    Left = 152
    Top = 192
    Bitmap = {}
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 128
    Top = 88
    PixelsPerInch = 96
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
  end
  object tHist: TnxTable
    Database = DM.nxDB
    TableName = 'HistCon'
    IndexFieldNames = 'Loja'
    MasterFields = 'CodLoja'
    MasterSource = DM.dsCli
    Left = 448
    Top = 80
    object tHistID: TAutoIncField
      FieldName = 'ID'
    end
    object tHistTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object tHistLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tHistPor: TStringField
      FieldName = 'Por'
      Size = 15
    end
    object tHistDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tHistMeio: TStringField
      FieldName = 'Meio'
      Size = 10
    end
    object tHistTexto: TMemoField
      FieldName = 'Texto'
      BlobType = ftMemo
    end
  end
  object dsHist: TDataSource
    DataSet = tHist
    Left = 480
    Top = 80
  end
  object tTar: TnxTable
    Database = DM.nxDB
    TableName = 'Tarefas'
    IndexFieldNames = 'Loja'
    MasterFields = 'CodLoja'
    MasterSource = DM.dsCli
    Left = 448
    Top = 128
    object tTarID: TAutoIncField
      FieldName = 'ID'
    end
    object tTarDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tTarPor: TStringField
      FieldName = 'Por'
      Size = 10
    end
    object tTarPara: TStringField
      FieldName = 'Para'
      Size = 10
    end
    object tTarLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tTarPendente: TBooleanField
      FieldName = 'Pendente'
    end
    object tTarResolvidoEm: TDateTimeField
      FieldName = 'ResolvidoEm'
    end
    object tTarNomeLoja: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeLoja'
      LookupDataSet = DM.tCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Loja'
      KeyFields = 'Loja'
      Size = 50
      Lookup = True
    end
    object tTarRealizarEm: TDateTimeField
      FieldName = 'RealizarEm'
    end
    object tTarTexto: TMemoField
      FieldName = 'Texto'
      BlobType = ftMemo
    end
  end
  object dsTar: TDataSource
    DataSet = tTar
    Left = 480
    Top = 128
  end
  object tFin: TnxTable
    Database = DM.nxDB
    TableName = 'receber'
    IndexFieldNames = 'Loja'
    MasterFields = 'CodLoja'
    MasterSource = DM.dsCli
    Left = 448
    Top = 168
    object tFinID: TAutoIncField
      FieldName = 'ID'
    end
    object tFinLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tFinVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object tFinPagamento: TDateField
      FieldName = 'Pagamento'
    end
    object tFinValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tFinValorPago: TCurrencyField
      FieldName = 'ValorPago'
    end
    object tFinObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tFinDoc: TStringField
      FieldName = 'Doc'
      Size = 60
    end
    object tFinDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object tFinLancamento: TDateTimeField
      FieldName = 'Lancamento'
    end
    object tFinClienteLancou: TBooleanField
      FieldName = 'ClienteLancou'
    end
    object tFinPremium: TBooleanField
      FieldName = 'Premium'
    end
    object tFinPremiumDias: TWordField
      FieldName = 'PremiumDias'
    end
    object tFinCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tFinCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tFinCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
    end
    object tFinBaixou: TBooleanField
      FieldName = 'Baixou'
    end
  end
  object dsFin: TDataSource
    DataSet = tFin
    Left = 480
    Top = 168
  end
  object tAut: TnxTable
    Database = DM.nxDB
    Filter = 'Ativa = True'
    Filtered = True
    TableName = 'Autorizacao'
    IndexName = 'ILojaID'
    MasterFields = 'CodLoja'
    MasterSource = DM.dsCli
    Left = 568
    Top = 80
    object tAutID: TAutoIncField
      FieldName = 'ID'
    end
    object tAutLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tAutAutorizacao: TStringField
      FieldName = 'Autorizacao'
      Size = 30
    end
    object tAutVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object tAutCodigoEquip: TStringField
      FieldName = 'CodigoEquip'
      Size = 30
    end
    object tAutMaquinas: TWordField
      FieldName = 'Maquinas'
    end
    object tAutTipo: TWordField
      FieldName = 'Tipo'
    end
    object tAutCriadaEm: TDateTimeField
      FieldName = 'CriadaEm'
    end
    object tAutCriadaPor: TStringField
      FieldName = 'CriadaPor'
      Size = 30
    end
    object tAutInativadaEm: TDateTimeField
      FieldName = 'InativadaEm'
    end
    object tAutInativadaPor: TStringField
      FieldName = 'InativadaPor'
      Size = 30
    end
    object tAutAtiva: TBooleanField
      FieldName = 'Ativa'
    end
    object tAutObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tAutGerar: TBooleanField
      FieldName = 'Gerar'
    end
    object tAutPrograma: TWordField
      Alignment = taLeftJustify
      FieldName = 'Programa'
    end
    object tAutEnviouCli: TBooleanField
      Alignment = taCenter
      FieldName = 'EnviouCli'
    end
  end
  object dsAut: TDataSource
    DataSet = tAut
    Left = 600
    Top = 80
  end
  object FB: TFreeBoleto
    Cedente.Nome = 'NEXTAR TECNOLOGIA DE SOFTWARE LTDA'
    Cedente.CodigoBanco = '341'
    Cedente.Agencia = '0125'
    Cedente.ContaCorrente = '58079'
    Cedente.DigitoContaCorrente = '5'
    Cedente.Banco001.Convenio = '1168094'
    Sacado.Nome = 'Andr'#233' Borges'
    Sacado.Endereco = 'R. Laurindo Janu'#225'rio da Silveira 5530 sl 5'
    Sacado.Cidade = 'Florian'#243'polis'
    Sacado.Estado = 'SC'
    Sacado.Cep = '88062200'
    Sacado.Pessoa = pFisica
    Sacado.CNPJ_CPF = '16392012893'
    Vencimento = 39161.000000000000000000
    Valor = 150.000000000000000000
    NossoNumero = '115'
    LocalPagamento = 'QUALQUER BANCO AT'#201' O VENCIMENTO'
    DataDocumento = 39161.000000000000000000
    Documento = '254910'
    Especie = 'R$'
    EspecieDoc = 'DS'
    Aceite = 'N'
    Carteira = '109'
    Instrucoes.Strings = (
      'SOFTWARE NEXCAF'#201)
    Left = 336
    Top = 218
  end
  object FBI: TFreeBoletoImagem
    DestruirBoletos = False
    TrackBarDelay = 0
    Left = 368
    Top = 218
  end
end
