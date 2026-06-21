object FrmCli: TFrmCli
  Left = 112
  Top = 34
  Caption = 'Cliente'
  ClientHeight = 721
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PagEdicao: TcxPageControl
    Left = 0
    Top = 77
    Width = 1024
    Height = 644
    ActivePage = tsFin
    Align = alClient
    LookAndFeel.NativeStyle = True
    Style = 8
    TabOrder = 0
    ClientRectBottom = 644
    ClientRectRight = 1024
    ClientRectTop = 24
    object tsCad: TcxTabSheet
      Caption = '&1. Cadastro'
      ImageIndex = 0
      object VG: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 1024
        Height = 620
        BorderStyle = cxcbsNone
        Align = alClient
        OptionsView.RowHeaderWidth = 145
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.AllowChangeRecord = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        Styles.StyleSheet = FrmPri.cxVerticalGridStyleSheetDevExpress
        TabOrder = 0
        DataController.DataSource = dsMT
        DataController.GridMode = True
        object VGCategoryRow1: TcxCategoryRow
          Properties.Caption = 'Loja'
        end
        object VGCodigo: TcxDBEditorRow
          Properties.Caption = 'C'#243'digo'
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.DataBinding.FieldName = 'Codigo'
        end
        object VGTipoLoja: TcxDBEditorRow
          Properties.Caption = 'Tipo da Loja'
          Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
          Properties.EditProperties.Columns = 3
          Properties.EditProperties.Items = <
            item
              Caption = 'Cyber Caf'#233
              Value = 0
            end
            item
              Caption = 'Lan House'
              Value = 1
            end
            item
              Caption = 'Ambos'
              Value = 2
            end>
          Properties.DataBinding.FieldName = 'TipoLoja'
        end
        object VGLoja: TcxDBEditorRow
          Properties.Caption = 'Nome da Loja'
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.BeepOnError = True
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.EditProperties.HideSelection = False
          Properties.DataBinding.FieldName = 'Loja'
        end
        object VGProprietarios: TcxDBEditorRow
          Height = 46
          Properties.Caption = 'Propriet'#225'rios'
          Properties.DataBinding.FieldName = 'Proprietarios'
        end
        object VGNumMaq: TcxDBEditorRow
          Properties.Caption = 'Quantidade de M'#225'quinas'
          Properties.DataBinding.FieldName = 'NumMaq'
        end
        object VGSenha: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'Senha'
        end
        object VGGerente: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'Gerente'
        end
        object VGDBEditorRow1: TcxDBEditorRow
          Height = 56
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'Telefones'
        end
        object VGCategoryRow2: TcxCategoryRow
          Properties.Caption = 'Endere'#231'o'
        end
        object VGEndereco: TcxDBEditorRow
          Properties.Caption = 'Endere'#231'o'
          Properties.DataBinding.FieldName = 'Endereco'
        end
        object VGBairro: TcxDBEditorRow
          Height = 19
          Properties.DataBinding.FieldName = 'Bairro'
        end
        object VGDBMultiEditorRow1: TcxDBMultiEditorRow
          Properties.Editors = <
            item
              Caption = 'Pa'#237's'
              DataBinding.FieldName = 'Pais'
            end
            item
              EditPropertiesClassName = 'TcxComboBoxProperties'
              EditProperties.CharCase = ecUpperCase
              EditProperties.DropDownSizeable = True
              EditProperties.ImmediatePost = True
              EditProperties.ImmediateUpdateText = True
              EditProperties.Items.Strings = (
                'AC'
                'AL'
                'AM'
                'AP'
                'BA'
                'CE'
                'DF'
                'ES'
                'GO'
                'MA'
                'MG'
                'MS'
                'MT'
                'PA'
                'PB'
                'PE'
                'PI'
                'PR'
                'RJ'
                'RN'
                'RO'
                'RR'
                'RS'
                'SC'
                'SE'
                'SP'
                'TO')
              Width = 20
              DataBinding.FieldName = 'UF'
            end
            item
              DataBinding.FieldName = 'Cidade'
            end>
        end
        object VGCEP: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'CEP'
        end
        object VGCategoryRow3: TcxCategoryRow
          Properties.Caption = 'Dados NF'
        end
        object VGDBEditorRow2: TcxDBEditorRow
          Properties.Caption = 'Raz'#227'o Social'
          Properties.DataBinding.FieldName = 'RazaoSocial'
        end
        object VGDBEditorRow3: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'CNPJ'
        end
        object VGDBEditorRow4: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'IE'
        end
        object VGDBEditorRow5: TcxDBEditorRow
          Height = 69
          Properties.Caption = 'Negocia'#231#227'o'
          Properties.DataBinding.FieldName = 'FormaPagto'
        end
        object VGDescrStatus: TcxDBEditorRow
          Properties.Caption = 'Status'
          Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.EditProperties.ClearKey = 46
          Properties.EditProperties.DropDownAutoSize = True
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.ListColumns = <>
          Properties.EditProperties.ListFieldIndex = -1
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.DataBinding.FieldName = 'DescrStatus'
        end
        object VGDBEditorRow6: TcxDBEditorRow
          Properties.Caption = 'Fazer novo contato em'
          Properties.EditPropertiesClassName = 'TcxDateEditProperties'
          Properties.EditProperties.DateButtons = [btnClear, btnNow, btnToday]
          Properties.DataBinding.FieldName = 'ContatarEm'
        end
      end
    end
    object tsFin: TcxTabSheet
      Caption = '&2. Financeiro'
      ImageIndex = 6
      object GridFC: TcxGrid
        Left = 0
        Top = 40
        Width = 1024
        Height = 580
        Align = alClient
        TabOrder = 0
        object tvGridFin: TcxGridDBTableView
          OnDblClick = btnEditarClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DM.dsFinCli
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
              Column = tvGridFinValor
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'ValorPago'
              Column = tvGridFinValorPago
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.Footer = True
          OptionsView.Indicator = True
          Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
          object tvGridFinColumn1: TcxGridDBColumn
            Caption = 'N'#250'mero'
            DataBinding.FieldName = 'ID'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 87
          end
          object tvGridFinLancamento: TcxGridDBColumn
            Caption = 'Lan'#231'amento'
            DataBinding.FieldName = 'Lancamento'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 100
          end
          object tvGridFinVencimento: TcxGridDBColumn
            DataBinding.FieldName = 'Vencimento'
            SortIndex = 0
            SortOrder = soAscending
            Width = 92
          end
          object tvGridFinValor: TcxGridDBColumn
            DataBinding.FieldName = 'Valor'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 93
          end
          object tvGridFinPagamento: TcxGridDBColumn
            DataBinding.FieldName = 'Pagamento'
            HeaderAlignmentVert = vaCenter
            Width = 91
          end
          object tvGridFinValorPago: TcxGridDBColumn
            Caption = 'Valor Pago'
            DataBinding.FieldName = 'ValorPago'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 94
          end
          object tvGridFinDoc: TcxGridDBColumn
            DataBinding.FieldName = 'Doc'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Vert = taVCenter
            Properties.ReadOnly = True
            Width = 312
          end
          object tvGridFinDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
            Width = 136
          end
          object tvGridFinObs: TcxGridDBColumn
            DataBinding.FieldName = 'Obs'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 197
          end
        end
        object GridFCLevel1: TcxGridLevel
          GridView = tvGridFin
        end
      end
      object LMDSimplePanel1: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 1024
        Height = 40
        UseDockManager = False
        Align = alTop
        Bevel.Mode = bmEdge
        TabOrder = 1
        object btnApagar: TPngSpeedButton
          Left = 176
          Top = 2
          Width = 87
          Height = 36
          Align = alLeft
          Caption = '&Apagar'
          Flat = True
          OnClick = btnApagarClick
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
          ExplicitLeft = 2
        end
        object btnEditar: TPngSpeedButton
          Left = 89
          Top = 2
          Width = 87
          Height = 36
          Align = alLeft
          Caption = '&Editar'
          Flat = True
          OnClick = btnEditarClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
            F40000002A744558744372656174696F6E2054696D65004D6F2036204F6B7420
            323030332030303A30353A3230202B30313030C56D46A80000000774494D4500
            0000000000000973942E000000097048597300000AF000000AF00142AC349800
            000AD14944415478DAA5570954935716FEFE248400B245904D10D0B26801951D
            D1D6A2F6D83A3A8BD85A6D3D3D2EB5625B9719A5567BAAD35A1D2DE3818E6B9D
            D6E38A15B56871A14A9571A5DA6A09208A2C21310B49C842F6E49F9B456B676C
            CB9C79E7DCFC392FEF7FDF77EF7DF7BB2F0C684C9E3C39282323E3A0582C4ED3
            E97415010101E14EA7B3B7B5B5755F727272925AADFEA1B6B6B697963AF0F3C1
            E2574655B0EF732A937D8EC1EAB01A8193AB8173346D7A7C1FC6F5B166CD9A75
            7ABD7E794B4BCBA5A0A0A0892121213AAD562BA0EF0EABD5EA67369B25D1D1D1
            129A1B62341A7710C1587AB669349ADA8888880CA55279AEA6A6A69BB6B23D24
            F5FD88A8179516E7D1815141FC5E751FBAEF2959A5C5766C23F0172520A12596
            4704A64FFF639D4AA5B45CBE7CBD61D2A489EF49A50F4E9A4C466D5252D26C91
            A869574A4ACA141E8FE74FD1B93670E0C04902814046A4060A85422ECD310E87
            A3472412BDD2D8D8788DB63348E64DCD7AD0F8E3F9D4ECC401369B1D3D322D94
            522D5A1BA568335AAAD601EFD1BA76322BB37163DD7CAD56B65920F067783C3F
            C5F5EBBB875AAC56494464AAB4BBEB5A765F1FAF2A288819C5E1B0110D0DDFEF
            CDCFCF5ED8D525AEE2F37DB8515131D32E5FBE5491939333DD62B1DE3C77EEDC
            DA6DDBB7AB52E362EA633F5D1993981E0F7000C5032D649D2A48C8BADB95EC3E
            27DEBD08EC27025266CD9A23652929E94BC78C49700C19C2E31617BF84B8F8A1
            585C3006C51F7F80D7E7AC84C160C289135BD9E2E20D6C5DDD360EC3F0B59191
            E9E6BB774F46F8FA0E3BCBE198C20D7A49D4D56BD75657551D7D3D2276F098F8
            6E116C9F7D88C89404E87AFB20B9AF84B84309E97D154E59EDFB0F033B89C077
            CCCA9507D6656464AD292C1CEAB870611F77D5AAD5385E5D8D93FBBFC0A153DF
            40F4E32D949494E0C103198E1D3B8EF1E39FC1B469C52828188F050B5E4659D9
            019C395D8DABF517FB829FD71C5F92B76956F6984C080207C074682BB4FB2BE0
            172E848252207691B8AF746E72B0BB5B811A22F02DB374E99E151919991B0B0B
            531D0D0D07B9757517B163C70E648CCEC2AC976720373717C5C5C5A8ACAC2402
            475153730AE7CF7F8B993367203454882D5B2A3073FA0C448D0D6185F365182F
            296146478D45DAC8115019CD9055ED816DE726980CF4FD810E0714FA63475874
            12F8717704962DFBE7C2D4D451DBF2F3873B468CE0737B7A7A101A16066D0DA5
            C8C707C2893308B00E393979B87BF70ED93D2ADB17B074E9DB9837EF0D988D36
            7C58518A98522D86A624214810005E651A9E0A4B47C2B078DCEDE840676B0BD8
            AF8FA1B3B1E9D2E66E792B95491D3C252967DE7AEBB359A9A969FBF272D31CA3
            46FB713D5544C5D17006D0AA8009AF50D5DAE930D1696238E489117E01FEE8D3
            F7D1520E04017E58D8908788C441108684C2CF970FA3C90CFDA170F0DBC33140
            18802E891852B9BCE34865E5059BD57A93004E7BABC0C62C5AB4ED77C9C969D5
            6999235976680063272C27610D6AB98410F12D888A16B9ABDBE9247CE2E62463
            594FB5F388676DCFEFC189D0216E702CFC7CF8B0986DD0EA4C906B34D05C63E0
            733D020293AFFAE09143270D06C33D7872DFE415243025255BC7C5C7A75EC8CF
            CB748E290CE43C92B1FBB781CB2781D9AB08D51314D6E905A7C1A1586D6F7917
            DF596B91923C1CFE7C5F38A8E67B7B4DE8E9D1432251A353AC40EB9D4E9D7EB7
            B39A55B35D5ECF6F91E91F0A16337FFE27A3E2E39FBE999F9FEB1C3F3EF82702
            B20EE0E83F80459B3C04BC9979F83C2D3E88CFC51F202B3307FEE4394BA1D16A
            CD50A9F4904AD5E8EAEAC19DD66E4BEF17A6C3CE07AC94DE3AEB1248B2DEC725
            9C993BB73C3E3636E17E417E011B9527E498AD244FF433A7B7174FED5F8EEB0B
            77C349C172383DE1E790292DB7F1B5722AB2B2F21128F0039761DCE06AB581C0
            35E8EEEE414B8BD8A13EDC77C8DECA2ABCE00D641A78DC79349899333F084B4C
            4C9717148C65C64C1092731C86431E3284E8BFAE18D6F555E0D93C8BB934AFB7
            6931FF4A0E92D387232C38043E1C9E3BE71A4D1F69850B5C85A6E62E56556338
            6C6B702ABDA7FD0A99F23FC1DD048A8AE60BB2B327690B0B9FE1BF3059E86418
            2EC7D321682C9908764B2D91F92968732F1522744800E262A2C1E7F2A0D79B29
            EF4637B82BEFCDCD9D905FD47F65AD75C85C424356EF4AE8133AE9A36EC8AC5A
            755C939F971B1C9B1DCEDA785CC64A1E1B7D81FCD2B138BFAE1E6C9F67B1547F
            1A17CD7F465E762E7C192E0C7D1E70B95C4BE02A889A3BA0B8AAFFC6F495DD25
            34FF82A7DE5D9DCFFE4B2DDB4DA0B4F468675656666CF633916CF0003E6D4DE1
            16007E6F14C0BEE332183A175C9ABCD0B81365CACD983A6102747D4637B842A1
            757B2EBAD306461CA56F2B6FAAA6685DA22D6AC93ABD2D1ABF4A60C58AC3A2D1
            A33353271445B342A180DA2BCDFA509DCFCF876DD715705C0478C08F67B66289
            EA6F48CF4EC1A0B0813FE5BCA51D667D046619D65A377EF2D24E87C3BE8F76F8
            E161CFFF4D02CB971FBE3272645AEEB345716C60A83FD3479C0D44206EF158DC
            5C5F0F8A348803CC279661C8D3C198232A27E189A6A8F8E07EBB141AA903CDEF
            2951BEB99ADDB0F1D52D26936E372D6F7ED2A17B2281A54B0F9C4D4B7B7A4262
            4E222B080F6004A4067C7F2071C5F3D0AE3D41D2CBA73498B0BBAC0449439350
            7BA305171C7510DBA548491C89FDAF9E422CF58FCD5BCE60C38679E52A55F71E
            DAF7F6AFE5FE6704DE7E7B6FD5F0E1A97F983861189B101FEC91633A84BEA57F
            82F59D6DE0840F425B73134A57AF00D7D68B41F1239094391923F35E041BE003
            B9D1D32ADACF5CC0D6B2C55BBBBA1A5D970D97E69BFB45E09D77BEF87CD8B0E4
            3945CFA5B029C9216E027A3A747E7F9D07F1D4E550C6A4A249D484CB5F7F8929
            AF2D414C7430045496FEF47610010752BAF87CA0F2C855ACFF78C567CDCDF595
            DEDAEFEB1781458B3E2F4F4A1AB638393785E5C68531AEE6470287E1BB96C15A
            381D9C510508A4A37DE3BBEB0825F1498C4F008FE4D7356C94650DF9A9A1776E
            D4FF806D9BDFDF7BE3C6892FE927BA7541DB1F0278F3CDDDEB131212DE1D3776
            389B9D19E1AE0207EDEFB36B1D9CC346C35138C52D4672552F3A146AD87D4361
            1384A0D7CAB83B6410AD1D4484BB6EDF41D9860F8FD4D7EF7311F8864CDD2F02
            0B17EE2C8D1D1CF7F1B871696C417E3463A72AD0BBDAFF817268F921687DF635
            EAF14488E6041603C2FC7C104E0733D087F19C738EA73B8A9A2478FFFD8D3567
            CF56D095CFDD7695FD22B060C1F6929898C19FA6E7A5B321E9B18C896A8EEE15
            48A8DB8B608312CE59CBE0E79563F77D00EEBB89FB6517B08D087775A970EB56
            1B5DDBAA2F1E3DFAD14178AE5CB27E11983BB7E2B5E8E8D83DB944A0A8288161
            289F0EDA98537F125CD11558167F048624859A9E5B11E57213DAA9FE3BE896DB
            D121233152E8A9F49A65B2D6EEB6B606994271DFD5F94E91C9FB4560CE9CF269
            919151C7F3F232D829539E72570143CAC7BF7D0D8EE33BD138F3EF6827B5EBEC
            9413B0DCAED5F6B44BA5F7DA2412518F54DA6AA2FF157696650DDE90BBB4DF25
            4277C88CFD22307BF6E6E7222363CE65678F640B0B6399961609DA5DDE752958
            BAA4AA15F2EE1689B8512A9134EBE4F276BBCD6676D5B7C6EBA1C2FB741D3817
            0993B7FCCCF88DFF8E8F084C9FBE766840406095DD6E17DAED169D4C76AF83C0
            5472799B45AF57533C589DD73B9917D0F55DE7053379C15C4DC7D91FD0FF2200
            77EB4122D978B248789A48CF63DE691EF3CAECFDFDA1CCFE4F80BF44C0F5A406
            0C211989B0FBF2607ECC1EFEEBFDBFC09E34FE0D0215179687512A1900000000
            49454E44AE426082}
          ExplicitLeft = 95
          ExplicitTop = -2
        end
        object btnAdd: TPngSpeedButton
          Left = 2
          Top = 2
          Width = 87
          Height = 36
          Align = alLeft
          Caption = '&Novo'
          Flat = True
          OnClick = btnAddClick
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
        end
      end
    end
    object tsEmail: TcxTabSheet
      Caption = '&3. E-Mails'
      ImageIndex = 4
      object vgEmail: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 1024
        Height = 620
        BorderStyle = cxcbsNone
        Align = alClient
        OptionsView.RowHeaderWidth = 145
        OptionsBehavior.AllowChangeRecord = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        Styles.StyleSheet = FrmPri.cxVerticalGridStyleSheetDevExpress
        TabOrder = 0
        DataController.DataSource = dsMT
        DataController.GridMode = True
        object vgEmailReg: TcxDBEditorRow
          Height = 80
          Properties.Caption = 'E-mail de Registro'
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'EmailReg'
        end
        object vgEmailTec: TcxDBEditorRow
          Height = 69
          Properties.Caption = 'E-mail T'#233'cnico'
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'EmailTec'
        end
        object vgEmailDBEditorRow2: TcxDBEditorRow
          Height = 50
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'Messenger'
        end
        object vgEmailDBEditorRow1: TcxDBEditorRow
          Height = 49
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'ICQ'
        end
      end
    end
    object tsLic: TcxTabSheet
      Caption = '&4. Licen'#231'a de Uso'
      ImageIndex = 1
      object VGLic: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 1024
        Height = 620
        BorderStyle = cxcbsNone
        Align = alClient
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        OptionsView.RowHeaderWidth = 116
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.AllowChangeRecord = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        Styles.StyleSheet = FrmPri.cxVerticalGridStyleSheetDevExpress
        TabOrder = 0
        DataController.DataSource = dsMT
        DataController.GridMode = True
        object VGLicCategoryRow2: TcxCategoryRow
          Properties.Caption = 'Licen'#231'a'
        end
        object VGLicSerieHD: TcxDBEditorRow
          Properties.Caption = 'N'#250'mero de S'#233'rie'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.DataBinding.FieldName = 'SerieHD'
        end
        object VGLicLicMaq: TcxDBEditorRow
          Properties.Caption = 'M'#225'quinas'
          Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.FieldName = 'LicMaq'
        end
        object vgLicTipo: TcxDBEditorRow
          Properties.Caption = 'Tipo'
          Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.Items = <
            item
              Description = 'Tempor'#225'ria'
              Value = 1
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
              Description = 'Prospect'
              Value = 4
            end>
          Properties.DataBinding.FieldName = 'LicTipo'
        end
        object VGLicLicVenc: TcxDBEditorRow
          Properties.Caption = 'Vencimento'
          Properties.DataBinding.FieldName = 'LicVenc'
        end
        object VGLicCategoryRow1: TcxCategoryRow
          Properties.Caption = 'Contrato de Manuten'#231#227'o'
        end
        object VGLicManInicio: TcxDBEditorRow
          Properties.Caption = 'Inicio'
          Properties.DataBinding.FieldName = 'ManInicio'
        end
        object VGLicManVenc: TcxDBEditorRow
          Properties.Caption = 'Vencimento'
          Properties.DataBinding.FieldName = 'ManVenc'
        end
      end
    end
  end
  object panDadosPri: TPanel
    Left = 0
    Top = 44
    Width = 1024
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 5
    object edCodLoja: TcxDBTextEdit
      Left = 45
      Top = 4
      DataBinding.DataField = 'CodigoStr'
      DataBinding.DataSource = dsMT
      ParentFont = False
      Properties.HideSelection = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 0
      OnDblClick = edCodLojaDblClick
      Width = 104
    end
    object edLic: TcxDBTextEdit
      Left = 201
      Top = 4
      DataBinding.DataField = 'LicencaStr'
      DataBinding.DataSource = dsMT
      ParentFont = False
      Properties.HideSelection = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 1
      OnDblClick = edLicDblClick
      Width = 193
    end
    object cxLabel1: TcxLabel
      Left = 3
      Top = 8
      Caption = 'C'#243'digo'
      ParentFont = False
      Style.Edges = []
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 153
      Top = 8
      Caption = 'Licen'#231'a'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object lbUContato: TcxLabel
      Left = 834
      Top = 0
      Align = alRight
      Caption = '  U. Contato 10/10/2006 17:40  '
      ParentColor = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Color = clNavy
      Style.TextColor = clWhite
      Style.TextStyle = [fsBold]
      ExplicitLeft = 792
    end
    object lbDataCad: TcxLabel
      Left = 634
      Top = 0
      Align = alRight
      Caption = '  Cadastro Em 10/10/2006 17:40  '
      ParentColor = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Color = clGreen
      Style.TextColor = clWhite
      Style.TextStyle = [fsBold]
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmSalvarFechar
            Visible = True
          end
          item
            Item = cmCancelar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmBoleto
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmSalvar
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = dmImagens.Imagens
    LargeImages = FrmPri.im32
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 232
    Top = 232
    DockControlHeights = (
      0
      0
      44
      0)
    object cmSalvarFechar: TdxBarLargeButton
      Caption = '&Salvar e Fechar'
      Category = 0
      Hint = 'Salvar e Fechar'
      Visible = ivAlways
      OnClick = cmSalvarFecharClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 41
      SyncImageIndex = False
      ImageIndex = 4
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 39
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      AutoGrayScale = False
      LargeImageIndex = 37
    end
    object cmSalvar: TdxBarLargeButton
      Caption = 'S&alvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 41
    end
    object cmBoleto: TdxBarLargeButton
      Caption = 'Ver Boleto'
      Category = 0
      Hint = 'Ver Boleto'
      Visible = ivAlways
      OnClick = cmBoletoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 18
    end
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    OnCalcFields = MTCalcFields
    Left = 370
    Top = 199
    object MTCodigoStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodigoStr'
      Size = 9
      Calculated = True
    end
    object MTLicencaStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'LicencaStr'
      Size = 30
      Calculated = True
    end
    object MTSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object MTCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object MTCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object MTAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object MTAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object MTLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object MTRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object MTPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object MTCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object MTUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object MTEndereco: TMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object MTCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object MTBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object MTSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object MTNumMaq: TWordField
      Alignment = taLeftJustify
      FieldName = 'NumMaq'
    end
    object MTCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object MTIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object MTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object MTTelefones: TMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object MTEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object MTFormaPagto: TMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object MTLicMaq: TWordField
      Alignment = taLeftJustify
      FieldName = 'LicMaq'
    end
    object MTLicTipo: TWordField
      Alignment = taLeftJustify
      FieldName = 'LicTipo'
    end
    object MTLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object MTManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object MTManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object MTProprietarios: TMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object MTGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object MTTipoLoja: TWordField
      Alignment = taLeftJustify
      FieldName = 'TipoLoja'
    end
    object MTEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object MTValor: TCurrencyField
      FieldName = 'Valor'
    end
    object MTValorRec: TCurrencyField
      FieldName = 'ValorRec'
    end
    object MTEmitirNF: TBooleanField
      FieldName = 'EmitirNF'
    end
    object MTMessenger: TMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object MTICQ: TMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object MTUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object MTUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object MTCodigo: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Codigo'
    end
    object MTStatus: TIntegerField
      FieldName = 'Status'
    end
    object MTContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object MTDescrStatus: TStringField
      FieldKind = fkLookup
      FieldName = 'DescrStatus'
      LookupDataSet = DM.qStatus
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Status'
      Size = 50
      Lookup = True
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 402
    Top = 199
  end
  object FB: TFreeBoleto
    Cedente.Nome = 'Jo'#227'o Lucio Borges'
    Cedente.CodigoBanco = '001'
    Cedente.Agencia = '3185'
    Cedente.CodigoCedente = '9647'
    Cedente.ContaCorrente = '9647'
    Cedente.DigitoContaCorrente = '4'
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
    Carteira = '18'
    Instrucoes.Strings = (
      'CYBER MANAGER')
    Left = 104
    Top = 184
  end
  object FBI: TFreeBoletoImagem
    DestruirBoletos = False
    TrackBarDelay = 0
    Left = 296
    Top = 304
  end
end
