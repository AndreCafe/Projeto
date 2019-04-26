inherited fbMaquinas: TfbMaquinas
  Left = 87
  Top = 150
  Caption = 'M'#225'quinas'
  ClientHeight = 592
  ClientWidth = 950
  OldCreateOrder = True
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 958
  ExplicitHeight = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 950
    Height = 592
    ExplicitWidth = 950
    ExplicitHeight = 592
    object Image1: TImage [0]
      Left = 216
      Top = 152
      Width = 105
      Height = 105
    end
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 950
      Height = 38
      SunkenBorder = False
      ExplicitWidth = 950
      ExplicitHeight = 38
    end
    object panImpSimNao: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 43
      Width = 950
      Height = 549
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Bevel.BorderSides = [fsTop]
      Bevel.Mode = bmStandard
      TabOrder = 1
      object dxBarDockControl2: TdxBarDockControl
        AlignWithMargins = True
        Left = 1
        Top = 2
        Width = 948
        Height = 22
        Margins.Left = 0
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 0
        Align = dalTop
        BarManager = BarMgr
        Color = clWhite
        ParentColor = False
        UseOwnColor = True
      end
      object Grid: TcxGrid
        Left = 1
        Top = 164
        Width = 948
        Height = 384
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BorderStyle = cxcbsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = 16759773
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PopupMenu = pmMaq
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object CV: TcxGridDBCardView
          DragMode = dmAutomatic
          PopupMenu = pmMaq
          OnDblClick = CVDblClick
          OnDragDrop = CVDragDrop
          OnDragOver = CVDragOver
          OnMouseDown = CVMouseDown
          OnMouseLeave = CVMouseLeave
          OnMouseMove = CVMouseMove
          OnMouseUp = CVMouseUp
          OnStartDrag = CVStartDrag
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          OnCanSelectRecord = CVCanSelectRecord
          OnCustomDrawCell = CVCustomDrawCell
          OnFocusedRecordChanged = CVFocusedRecordChanged
          DataController.DataSource = Dados.dsMaquina
          DataController.KeyFieldNames = 'Numero'
          DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          LayoutDirection = ldVertical
          OptionsBehavior.DragFocusing = dfDragOver
          OptionsBehavior.ImmediateEditor = False
          OptionsBehavior.IncSearch = True
          OptionsBehavior.IncSearchItem = CVNumero
          OptionsBehavior.ExpandRowOnDblClick = False
          OptionsBehavior.RowCaptionHints = False
          OptionsCustomize.RowExpanding = False
          OptionsCustomize.RowFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellEndEllipsis = True
          OptionsView.CardBorderWidth = 1
          OptionsView.CardIndent = 7
          OptionsView.CardWidth = 220
          OptionsView.SeparatorWidth = 1
          Styles.Background = cxsAguardaPagto
          object CVNumero: TcxGridDBCardViewRow
            Caption = 'N'#250'mero'
            DataBinding.FieldName = 'Numero'
            PropertiesClassName = 'TcxTextEditProperties'
            OnCustomDrawCell = CVNumeroCustomDrawCell
            OnGetDisplayText = CVNumeroGetDisplayText
            CaptionAlignmentHorz = taCenter
            CaptionAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringMRUItemsList = False
            Options.Focusing = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
            SortIndex = 0
            SortOrder = soAscending
          end
          object CVTempo: TcxGridDBCardViewRow
            Caption = 'Tempo'
            DataBinding.FieldName = 'InicioTicks'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnGetDisplayText = CVTempoGetDisplayText
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
            Styles.Content = cxsAddMaq
          end
          object CVNomeMaq: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Nome'
            Visible = False
            Options.Editing = False
            Options.Filtering = False
            Options.Moving = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
          end
          object CVNomeCli: TcxGridDBCardViewRow
            Caption = 'Nome Cliente'
            DataBinding.ValueType = 'Boolean'
            PropertiesClassName = 'TcxTextEditProperties'
            OnCustomDrawCell = CVNomeCliCustomDrawCell
            OnGetDisplayText = CVNomeCliGetDisplayText
            Options.Editing = False
            Options.Filtering = False
            Options.Expanding = False
            Options.Moving = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
            Styles.Content = cxsPequeno
          end
          object CVPrograma: TcxGridDBCardViewRow
            Caption = 'Programa Atual'
            DataBinding.FieldName = 'ProgramaAtual'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnGetDisplayText = CVProgramaGetDisplayText
            Options.Editing = False
            Options.Filtering = False
            Options.Expanding = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
            Styles.Content = cxsPequeno
          end
          object CVObs: TcxGridDBCardViewRow
            Caption = 'Obs'
            DataBinding.FieldName = 'ObsAcesso'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = False
            OnGetDisplayText = CVObsGetDisplayText
            Options.Editing = False
            Options.Filtering = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
            Styles.Content = cxsPequeno
          end
          object CVRow1: TcxGridDBCardViewRow
            Options.Editing = False
            Options.Filtering = False
            Options.Moving = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
          end
          object CVRodape: TcxGridDBCardViewRow
            Caption = 'Rodap'#233
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taBottomJustify
            OnCustomDrawCell = CVRodapeCustomDrawCell
            Options.Editing = False
            Options.Filtering = False
            Options.ShowEditButtons = isebNever
            Options.Moving = False
            Options.ShowCaption = False
            Position.BeginsLayer = True
            Styles.Content = FrmPri.cxStyle33
          end
        end
        object GL: TcxGridLevel
          GridView = CV
        end
      end
      object panConfImp: TLMDSimplePanel
        AlignWithMargins = True
        Left = 6
        Top = 103
        Width = 938
        Height = 56
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Bevel.Mode = bmEdge
        Color = clWhite
        TabOrder = 2
        Visible = False
        object Image2: TImage
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 48
          Height = 46
          Align = alLeft
          AutoSize = True
          Picture.Data = {
            0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
            00300000003008060000005702F9870000002B744558744372656174696F6E20
            54696D6500446F203134204E6F7620323030322032333A35393A3234202B3031
            3030B95D9F780000000774494D45D60705170E062657827DCE00000009704859
            7300000AF000000AF00142AC34980000000467414D410000B18F0BFC61050000
            0F834944415478DAC55A0974546596FEAA2A550924210B614920212C6111909D
            0083E2009E0699F6D0E7F48C3D232D7894566C67A46DA0076440C07639A2C271
            7A1CA7BB4751B16957701840904D09C84E804A80AC64AF5442D6CA56CB9BEFBE
            2579555498D8A7BB7DE7DCF35EEABDFF7FDF77EF77EF7FFFAA58F0BD1D8A05FF
            B0FF5E78030FC0619FEC88B40F54FC8AC5DBE2A945ABE72A3A6E1DC185570FA3
            BEB8990FFB6540B8592C7F2634328FE5F1C71F8FB6D96CC3783DAABDBDBDD7E7
            9F7FBEA7A1A14100F8829E7EE4E20FED518D2FA60E4B1B3B70709225BA4F1414
            5F007EAF1FED5E1F1A6A9BE12A75A3A6A8BC1875E56FE0C8F20F38AAF1B679BE
            2301F5D9F5EBD74705028134ABD53AD2E7F38D541425C36EB767C4C7C70FA7A5
            242525D9FBF71F800EAF5779FB3FFFE3D0D1A3C77E51555555C0A1ED989B1385
            9486B7868F4B593A66729AC5612322AF82C25B3EB89A7C68F478D1DEEE83D5E7
            839D4E77287EB494B9E02FCA3D8C9CDFFF12E5C7AEABF398A21196C0430F3D64
            9B3E7D7A0A4166B4B5B58DE2471902342E2E6E449F3E7D5209B437815A68E8DF
            BF3FF859D0F800CD4ABB92731D9B37AC3F9A75326B5565F2A222DCB5E49319F7
            4F9C9B3A380EC48E736E20BFAC09686A2124C5647E0D5920A05933839873C989
            CBAF3D899AEC0BBCD36A90B88D405151D1A4FDFBF71F1D3162442C015B131212
            D0B76F5F242626761B9A00A7F207B4B36132BDCD0E9C397D5EC9BD7C2EEBC983
            834A673C78CF3F0E191287F60E606F89AE8723DFE089B1AD888A8B061C918888
            8A84B33E0207AAA2352F301AF07A811692746665E19B679FE107393A89B011B0
            6FDBB6EDB7A3468D5ABA60C182DB6E8A83641053B013B4A20483375B6424F0EE
            FE5CBC71B917A6CD4A57B17C56A44F26004F5EC0B55FC520A14F2F154E94DD8A
            9D39013CF5A5BCC4A71110934854570397766E47EEEFFE9D778B855E38029654
            1E8F3CF2C83B8B162D9A3B73E6CC20E07EDDBBFE50B0E8BA36138A8A00EE79F1
            3C86CC9A8484482B3E2952D0EA95B7E8AF3E7F05B9AB639118DB0B16AB552370
            DD8A15FFDB4647B769E0FD7E2D0A1D0C5D418E1BC79FFA67F89ABFE2E8DAEE92
            D83175EAD4C98B172FFE74F9F2E529A2F3508998ADBB0808C6ECE23AACD85D83
            69D38721BF01B8E8166D59BBF47EAD1085ABFA2021D68108BB83842DD89167C3
            E39FB1E8B4367711106B6FD7A270FA8D375179E86DE2BC7EA72AD4EBD1471F5D
            327D46E6DB4FFCEC094B875FCF29E5CE66261349EFBFFC491EBE55FA227D6034
            3E2D08B0EC9B5E290F9754A174751CFAB29446D8EDB0DB6D782FCF8AA53B09B4
            B5A94B428635D00B57F71D82F3B53739C3D7772220F7E2D7AE5DFBE10F7FF4E3
            0513274F56A3D82995805606EE4426C601FC64EB05448E1F0D56471C2BA517AC
            21AF7437A0921148D209C8F17E3E978AF75D4CDCC6E00888841AF959494E21BE
            FD97D7F8E8E7FFDF3A60A38C66330F0EAD58B9C6EEF3A35B298523131705CCDD
            7416E9D3C7A0B8C187DC1A25988044C0E3837B556F2431079804EAC73BB96A2C
            79B73298809C854013A3525DD184AF970981F77AB290F55EB366F5070B173FF4
            A37113A7800BE51DAB8E594A09C4346FD369A44D1D03677507CA9B95AEE455F4
            B5C8EA40CEF228F463B814DEB35B34024F7F58C1FADF104CA0AD4D5B13DC551E
            9C78F4371CFDDB9E10B02C5BB66CE1D871E3F72EFDF9B396B68EDB73A13B4242
            E09F5E3E03EBE811B84E02EE561DB4903092389261B2D3D84AC0AB2F60CC1DD4
            D76AB5DFAF279FA17F894279DE4D9C5BF9119FFAAF1EB512AC42B13F5DB2E4FC
            C32BD66424260D50DFD593448EE51AB0F58F4E9C6C8D81CB1B81DA9640F0C48A
            5E8F6F9661C2202B52936371BACE01B78752F2B66AC00D0292807575DAF5B583
            5F23EFCDA33D95909A0B2B573EF3CAB47B7EF0CBCCB90BB5640EE77D04FF2DBD
            8EB3C08D5F7C5C0247727F543686F6627C7D49090E3C9D8C3963E361B339608F
            B461D53716BC76807D46635D57F5916888898C2E6EDB89DA93A739C1A73D2560
            79ECB1C7E6A58F1879F0272BD658648EDB3C8EF0D1488E0E60FEBA2C28E96928
            ABEF089E95DE5F38A0111FFF2C153E6B1457ED4844B212596C36585EA5D6AF49
            C7A068DEBF754B1B5353D984B3CF7C8440FB5EFE75ACC7DDE8C88C8CB80716FC
            A068E9BF6E4F0057CC706B8212E6EF68CAE844763536EC2E445B5C02027E938C
            F8407ABC0505ABFBC16FEB4DEF47A995A892EB55CA2B3540E10D4D328D8D5D49
            EC7CFF5354EDCDE3E85DB49CEFD24EDB9EFEF953871EF8E9B37FDB3F6DB826CD
            70A5147A9B68D5AE1B6BEA90885AAC7DB70467BD71F0DB23BB2A90DA9F442073
            EA40BC342F0643E31DC8A2729E3CEC43F3A98B4CD836AD6C4AE2CAB3655772E0
            DC7C9ADDAAB41162EE1E55A1952B5746A4A5A58D2B2CC87F75EAFCBF9F3726F3
            3E35AA066091B2A217965BAE6AB88A9CA82ACA4175712EDA3CF588898DC3BDF3
            1661DD6E2FF2EDC95A87A7E8AB2174B6F1EC76291DB4782813AEC21DED5D5548
            CC7DB31C579E3F0C5FD3550E10F970B983372C81D75F7F3D9E3BAB99DC03DC4B
            CBE4C6658A54A2168FC7E2B1F6C1ECC50FABEB81BCDF5D514EB04E82CE416571
            0E3A08C04129C4C6C6222E3E1EF1F109EA7E81AD3992534762D57B6538E9629D
            E43DF5307A7EA3548AB7C57CFA8243D9A44434B82B8EAC3A48F0229D03B42BB4
            16DD77DAB175EB56477474F452025E46C053939393EDE9E9E91834689085D7EA
            33D7AEE5E2BF3FF81843C7CD44797E365CE2E1D616B5098B8E89467C9CB67788
            25E0DEBD7BA357AF5E6A62CA9973AB7B8AA4A47ED871D885173F70A2DA472251
            511A00A3653648B5B6220E5E3C7C5F12660D6F70ADFDD5AA8F4B4B4BFF8777CF
            D01A60DED06CDFBE3DD662B11CE00B66712343E7C473AD516F29517C015FAE88
            07DDD5D556CA89CDA485B288457C42A20A589E178066C04240C688F7636262D8
            A4D9E95085D802548A0D1DECE4F79C60093D55814BF9F5703578D57BFDA2ED18
            3F3406F3A7A5E0C7F387222EC68E7DFBF679B8C92ADFBD7BF7EA9A9A9AE3D0F6
            C75D04289927A9F1B766CC98C1E87550727ED58C17CA35CF010255280DCBB56B
            D7AC25ACDF56E9DF495000CB59008B0960F95BC6879A96BBDAB5109139C4C461
            F277617E11F28A6EA0325082366EBA32FBCDC68001C9817777BC5370E3C60DE7
            AE5DBB36720A636FAC1178E9A5979E9B3C79F20B63C78EED042FC00D33888851
            5E6A34060E1CC895BDC1D2C24413EF8B091019ABA9201004D6B80E779623C216
            81CF3EFA0CA77A5125F7D5A3B6A99951A947A0D981B7123F446965491923E1D8
            B367CFC6CACACA2F38A4125AED00B66CD9B29E9BF82D77DF7DB700BC0D743822
            04AAF4EBD7CF227B6619F3A780966B212CE3150EDDB6E315789E70A2B9CE8B3A
            366DAEE67AC4770CC0CB31BF81BBBE5A397DFA741309ECB874E9D23BB2064814
            3A096466666E99387122CBA3B7134077448CCFE5E52215D9B18512083D8B894C
            CCA0DBB9C392F7A9B265AF9E9D7D19CEC493A8E95B0E3F0BE4088CC77CFBDFA1
            D255A93E5F5858E8671EEC3C73E6CC1F386D16ADA99300F5BF65D2A4499A374C
            E0CD04BA8B8A6897D150018646C10C5AC08A99811B9F89C92AED696AE15E5E41
            4444049B462F3C6D1EEE41FCEA3CAC423E46E08F67CF9EDDC3571CA6DD52096C
            DEBC79FDAC59B3B6701FAC4D1402BEBBB3D984845424C3EB46F2877ADA7C967B
            E1CE460E86CAADB8B8D8CF6A2404A49C1E0C2220122289A01C302A514F89381C
            0EB5220940C3C2793A1CF050D0E271F9AC8E2DB4DBED466D6DADCCAD9C3A75EA
            0FE7CE9D0B26B069D3A67F1B376EDCE6C18307AB25501253EAB8A98486955538
            79993D1E0EB4716D066D785840CBE70256400B78C1230BA044979FFBBEF8E28B
            8FCE9F3F2F040EC1F85A85045E983F7FFE739203555555AA89D764909878355C
            690D17119656D4D7D787F57277A0E5BE015AC64A1B22EF15474A2E184AA8AEAE
            0EB094EED223D045E0F9E79FFF3509AC93854C2693C3E3F1A844CACBCB557D0F
            1830404D5459514DA534888880A9A8A800EB7467D21A920C052D0E32400B6959
            B18D555D40CB73AD6C275C2E97B433EA78AEC28103070E842770FFFDF7AF931C
            90898D2434F4282F2A2B2B53C18977A437124242ACB38EEBC00A0A0AE4FBD5A0
            B26A1C222D8250AD913DBE2C88F205B180964550E6906704B4106BE65A20EF98
            366D5A27812FBFFC7257A8842C1B366C7861E1C2856A04CC2D44A877E59E78F7
            E6CD9BEA59EA7F6A6AAABA2A1BCFE7E4E448BD560119A0050CC3AF46D5F8B2D8
            E8B7648C38CD784640CB58A3CD90C220FD99CC4F79050E1E3C2804F6EA49DC45
            60C18205EBE47B50C3936622669D9B5F2AFD505E5E9E2A0121327CF87095D895
            2B57D4A8092069358C24148F9BC71BD110D0462F24A04542D29AF4D1BB5AA33D
            11025F7DF5951181AE2A4402BF362260AEBB069170A5D3FC4C13774D221DF1BE
            8016790818F1B28036222939219545C8C933664F8B095891A8ACEEC6A2A89773
            45F2412278E4C891F7AF5EBDBA4F97904660E3C68D2FB0997BEEC1071FBC6D73
            63EE24BB5B0B0C2202222B2B0BEC1A3B352D0E90CA728B9B72016D785A4CAEA5
            FD166F0B78ABBAD7EE022DF26BE38686116AE222F6EDE5CB97CB5958DCBC2FDB
            49F956A25125B06CD9B2F10CF13AEA73111BBA588984549CEF4A44007095049B
            2DF55A3C269109F5B454327D9FA17E6E9A47912809687ADC4BB0E72E5EBC58C0
            A2D04E42F2B54491DE4AE7D26A60FA7D809B540C63B8FF865DE934AE07F70C1B
            366C348958264C98D06322E251AE94B870E1820A54F42F15C5D0B5785B804B62
            9AA347D0AAB7690AA39543075CCDCDCDF590886C5C4AA1ED7F6FEAA0E533F975
            C6DFB91FD0CF424236AA03691977DD75D70496AFC943870E9DC3736F4970A920
            772222044E9C3801768B2A680125DA15D0C68ECC30D95718ED06A555C64DD239
            4AA48E04045C39AD40F7B80BDA1652F6C0D2B707FDDC1ABAA997BFE53BEE189A
            FC28368415642CF36302373B73486A18D70A0BDB8EA04166091D3B764C8D8291
            0366B2F29CDE17298C4E23CBEDB7AC28158C523BEF57F3D1421D7885141D594F
            691DA1A0EF44C07CC80F89F2C3559C44457EB11C3366CC0476ACD3B8D997AFDC
            234946DD629A07B14AA8896CAC03BAB78DE6AE9D0BE2594A8CD80B3BA8EB5A68
            BF75E5EB52A9A33541DB2E06D083A347DF0BD11CB4685A122D9DABE7B82953A6
            4CCCC8C8B88F493F78F6ECD9183D7AB448C82211387EFC7827707A3BC0B27995
            A09D2CB32D949568B844072DE06F9974DDF9BD584F8FEFFA4BBD1115C9956426
            E628C915267DE690214366CC9933C7C6DEC9E2743AA5F495B05E9FCFCECEA6AC
            EB45BF86AE4526D53A689148B7FF46F09720101A95589AD4DB74B615E3794C60
            85896115A96609F4310A2E1368D984F748D77F0D02E6F11295DED0A292424B83
            560804B0785D2422FF2FD1635DFF350984CE15A993910C164DB7E14FD0F5F745
            E07B39FE0F23EAFBBD2FCDA1DB0000000049454E44AE426082}
          ExplicitHeight = 48
        end
        object panCotaDia: TLMDSimplePanel
          AlignWithMargins = True
          Left = 59
          Top = 2
          Width = 106
          Height = 52
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Bevel.BorderSides = [fsLeft]
          Bevel.Mode = bmEdge
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          Visible = False
          object cxLabel1: TcxLabel
            AlignWithMargins = True
            Left = 5
            Top = 2
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Cota di'#225'ria'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.TextColor = 4210752
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
          end
          object cxLabel2: TcxLabel
            Left = 5
            Top = 19
            Caption = 'Max.'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -9
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object lbCotaDia: TcxLabel
            Left = 5
            Top = 30
            Caption = '1500 pg'
          end
          object cxLabel4: TcxLabel
            Left = 55
            Top = 19
            Caption = 'J'#225' imprimiu'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -9
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object lbImpDia: TcxLabel
            Left = 55
            Top = 31
            Caption = '10 pg'
            Style.TextStyle = [fsBold]
          end
        end
        object panCotaMes: TLMDSimplePanel
          AlignWithMargins = True
          Left = 168
          Top = 2
          Width = 106
          Height = 52
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Bevel.BorderSides = [fsLeft]
          Bevel.Mode = bmEdge
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 1
          Visible = False
          object cxLabel6: TcxLabel
            AlignWithMargins = True
            Left = 5
            Top = 2
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Cota mensal'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.TextColor = 4210752
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
          end
          object cxLabel7: TcxLabel
            Left = 5
            Top = 19
            Caption = 'Max.'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -9
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object lbCotaMes: TcxLabel
            Left = 5
            Top = 30
            Caption = '1500 pg'
          end
          object cxLabel9: TcxLabel
            Left = 55
            Top = 19
            Caption = 'J'#225' imprimiu'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -9
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object lbImpMes: TcxLabel
            Left = 55
            Top = 31
            Caption = '10 pg'
            Style.TextStyle = [fsBold]
          end
        end
        object LMDSimplePanel2: TLMDSimplePanel
          AlignWithMargins = True
          Left = 277
          Top = 2
          Width = 341
          Height = 52
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Bevel.BorderSides = [fsLeft]
          Bevel.Mode = bmEdge
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 2
          object cxLabel11: TcxLabel
            AlignWithMargins = True
            Left = 5
            Top = 2
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Esse cliente deseja imprimir'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.TextColor = 4210752
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
          end
          object LMDSimplePanel3: TLMDSimplePanel
            AlignWithMargins = True
            Left = 5
            Top = 20
            Width = 146
            Height = 28
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 2
            Align = alLeft
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 1
            object Image3: TImage
              Left = 0
              Top = 0
              Width = 24
              Height = 28
              Align = alLeft
              AutoSize = True
              Center = True
              Picture.Data = {
                0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
                0018000000180806000000E0773DF80000002B744558744372656174696F6E20
                54696D65004D6F2031352041756720323030352031313A33313A3134202B3031
                3030D9FE197A0000000774494D45D60705170D383197D25D2D00000009704859
                7300000AF000000AF00142AC34980000000467414D410000B18F0BFC61050000
                04244944415478DAA5965B6C944514C7FFB35B13E383047C303EEC36D198F8E8
                83C6D0F0A298F82A6A24511F34D6446EDAC2DACBB6EC052DDD76BB16A8854281
                52DA0634BD8889C518029248BB6D775BAC82B6926D5604EF6C588AEEED9BF1CC
                7C97EE2EBBD1E8644F66BECB39BFF99F3333FB3118EDB5BAA3C2F9C07DC8691C
                60F4E3029C09BD1702427032BAB633FC74FDD7EB57BEFBA6FAC26707BF24D7DB
                641C651A3307EE8E31D1B2E359FC9BF6E9B979F41E1F4FC617C3B517274E9DA2
                5B8972100BD0D8362A76D76D00E46CF35E9063BAA54C46B0938270F47B0C4DC6
                91885DB9F5F517633597E63E2F0B3101AC2138C65B5D772A9069918D0BDDEC36
                8689C822CE2FFC867B1E7E049383276E2D4C9F76CD4F8F8FD26B378A2116C01D
                1CE52DAE0D2553220C55126023C0F9F0655CBBF1171E7CEC5144AF2E233C7462
                79EEEC48EDB75F9DF9B818B2A2A06D94B7D695061814680660787C06E72ECC63
                D5EA7B914C7324FFCCE0E68FF1E5D8E509D7A5C8E9917C481E608400CFFD2380
                D61132D92C52991C32190DA9541A3793B7B1B0F4333E1A3B9B1839DCB891DE9E
                224B1600EA03C33C50FFBCBA988EC4D4039912B96A7334C8CA5E2313B217D433
                68746DBBCB8E67D639090AD4FB7A7124F86633B90E92C50B0075AD1FF2B68617
                D5C5DCC5784161654009CACA3137CC80314AD9934F38D4041A3C0771A463F31E
                72ED215B2800BCB3FB246F27756A333156B082CC25AA7A212C30378A2F2DCB19
                010E1160D33EBADC4FB6281F590057CB491E746F0427CF1FAE250AF6407E4033
                6D9A05B0E121E72A643402787BD017DAD2456EDD770076BC37C43B9A5E52E998
                9C895900194C0F2A544AB85907AE3FB355D8F174552532A4C0EDE9C1D1D0E6D2
                80EDEF0EF250F3CBC890E7747429AFC8C2A8833EEB9C5578DDEC0458BFD6A114
                34FA7A702CB4B534A0D63FC0439E579026AFD968CC2AB29A755E40CD9CBDA1C4
                56612380532968A222F7BD5F264535BE01DEE125002D87E8ECCA32355361AA30
                81590366B31B0052E0F61E407FE7B632006F1F6FF7BD8A346D9E4864A9A0069A
                59D87C0546FA6C763B9EAA72AA55D4ECD98F639D6F95066CF3F4F1A09F00690D
                53332B0061CCD80CACA74DDF17E6465BBFB692D4518ABC1FA07FCFDBA5015B77
                1EE6EDFED7912240786AC93A21B4BCA5AAC9C05A9E22952202543994829D9E6E
                1CDF5B531AB0A5B997B7F9AB0990C3CCEC554B81DC1766C1B53C35AA877EF8AD
                7BDC418B83C1E7EBC2E0BEDA3280A65E1ED855AD14C00ACF54C78CA3D12CBC42
                D25F28A73B3922719A7D9A6C170186BAB697066C721FE24D0DD554836CC1216A
                0567FAAC99E1B5922EA1A79155A033D08D813229C20B6F04C49A35ABC9492B02
                30C8B9EA1F023466F4E7CFE54700236FAE3E0AE4587E0C24FEF81D9FF4FBF792
                DB81E2C34EB64AC92173C8D4E2BF35295616701845C7B56C7793DD6FF4FFA7A5
                C87E317AFC0D9455C8371D2FB47B0000000049454E44AE426082}
              ExplicitHeight = 24
            end
            object lbPaginas: TcxLabel
              Left = 24
              Top = 0
              Align = alLeft
              Caption = '2 p'#225'ginas'
              ParentFont = False
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -19
              Style.Font.Name = 'Segoe UI'
              Style.Font.Style = []
              Style.TextColor = 4210752
              Style.TextStyle = []
              Style.IsFontAssigned = True
              Properties.Alignment.Vert = taVCenter
              AnchorY = 14
            end
          end
          object cmJobResume: TcxButton
            Left = 162
            Top = 3
            Width = 51
            Height = 45
            Cursor = crHandPoint
            Caption = 'Liberar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = cmJobResumeClick
            Colors.NormalText = clBlack
            Colors.Hot = 16776176
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            OptionsImage.Glyph.Data = {
              36090000424D3609000000000000360000002800000018000000180000000100
              2000000000000009000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000010000
              0001000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000020000000C0000001C0000
              001F000000130000000400000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000020000001400000040000000700000
              007A000000560000002100000006000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000020000001400190065005E00D1027004E6002C
              00AB000000980000006000000022000000060000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000020000001400210069038707F514B02BFF14B129FF0A98
              14FE003A00B20000009B00000060000000220000000500000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000020000001400210068048B08F417B22FFF13AD2BFF12AB26FF13AF
              27FF099713FE003800B10000009B000000600000002200000005000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00020000001400220067038E08F319B535FF16B030FF15AE2CFF14AD29FF14AD
              27FF13AF29FF099713FE003800B10000009B0000005F00000022000000050000
              0000000000000000000000000000000000000000000000000000000000020000
              001300220065049109F31BB63BFF1AB435FF18B131FF16AF2FFF13AE2AFF13AD
              29FF13AD28FF14B028FF099713FE003600AF0000009A0000005E000000210000
              00050000000000000000000000000000000000000000000000000000000C0022
              0062039208F220B941FF1CB53AFF1AB336FF19B234FF17B132FF3DBE52FF27B4
              3CFF0EAC26FF13AC28FF14B02AFF099713FE003500AF0000009A0000005D0000
              00210000000500000000000000000000000000000000000000000024034B0898
              11F122BB45FF1FB840FF1DB63BFF1DB639FF1BB53AFF17B031FF0E9F17FF76D1
              86FF41BF56FF0EAC25FF14AE29FF14B029FF099613FE003300AE000000990000
              005D0000002000000005000000000000000000000000000000000A8E18DE44C7
              65FF1FBA43FF1FB841FF1EB73EFF1FB840FF1AB336FF006E00D2002500640088
              00ED72D184FF3FBF53FF0EAC26FF14AD29FF16B12BFF099613FE003200AD0000
              00990000005D00000020000000050000000000000000000000000D9D20ED76D8
              91FF17B83DFF1FBA43FF21BB44FF1CB639FF007100D2000A003F0000000B0023
              0038008900F074D285FF3DBF53FF0EAC26FF14AD2AFF15B12DFF099613FE0031
              00AC000000980000005C0000001F0000000400000000000000000750118246C1
              61FF6FD58BFF38C45BFF26BA46FF037A04D6000B00410000000C000000010000
              00000026003B008C00F174D285FF3ABD50FF10AE27FF14AD2BFF15B12CFF0996
              13FE003000AC000000980000005B0000001F0000000400000000000200020865
              159127B83DFC41BF57FF078210D3000E01340000000A00000001000000000000
              0000000000000027003C008C00F376D288FF3ABD50FF10AE28FF15AF2BFF17B3
              2EFF099613FE002E00AB000000980000005A0000001D00000004000000000000
              0000021A04200431084600070111000000040000000000000000000000000000
              0000000000000000000000290041009001F377D389FF38BC4EFF10AE29FF15AE
              2CFF17B32FFF099612FE002D00AA000000960000005100000012000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000002A0042008F02F479D48BFF35BB4CFF11AF
              2AFF15AE2DFF17B22FFF099612FE002400A6000000790000001F000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000002E0046009303F677D58BFF35BB
              4CFF11AF2BFF16B02DFF17B432FF027104E7000000730000001C000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000002E0048009305F679D4
              8CFF34BA4CFF11AF2BFF18B434FF016401D6000000480000000E000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000032004C0096
              07F874D589FF54CA6CFF069A11FD002600740000001800000003000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000000000000002D
              004B007E00DE007700DB003100660000000F0000000300000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000100000001000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
          end
          object cmJobDelete: TcxButton
            Left = 220
            Top = 3
            Width = 54
            Height = 45
            Cursor = crHandPoint
            Caption = 'Cancelar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = cmJobDeleteClick
            Colors.NormalText = clBlack
            Colors.Hot = 16776176
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            OptionsImage.Glyph.Data = {
              36090000424D3609000000000000360000002800000018000000180000000100
              2000000000000009000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000100000005000000100000
              001A000000220000002400000024000000210000001A0000000F000000050000
              0001000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000005000000150000002F000000500000
              006D000000800000008900000089000000800000006C0000004E0000002D0000
              0014000000050000000000000000000000000000000000000000000000000000
              000000000000000000010000000B000000280000075E00022E96000259BD0003
              81DF00079AF2000797F100027CDE000153BE000124A20000039B000000850000
              0058000000270000000A00000001000000000000000000000000000000000000
              0000000000010000000D0000043B0004469B000BA4F10825D4FF0E39F2FF1044
              FFFF0F45FFFF0E44FFFF0C41FFFF0933EFFF041ECEFF000697EF000133AA0000
              019D00000073000000360000000D000000010000000000000000000000000000
              00000000000A00011348000984D20B29D7FF154AFFFF1549FFFF1346FFFF0D42
              FFFF0A3FFFFF0A3EFFFF0A3FFFFF0D40FFFF0B41FFFF0B3FFFFF041ECEFF0002
              6CD1000008A10000007C000000360000000A0000000000000000000000000000
              00050001143C000D99E1133EEEFF1A4DFFFF184AFFFF0C3EFCFF0E30E1FF5568
              E0FF6E78D4FF6873CEFF5266E0FF082ADEFF0235FCFF0B3FFFFF0C41FFFF082F
              E9FF000483E0000008A100000073000000280000000400000000000000000000
              061A000C8CCF1740EEFF1E51FFFF184DFFFF1235E6FF9FA5E4FF000000000000
              0000000000000000000000000000000000009EA1E0FF072AE0FF0B40FFFF0C42
              FFFF0930EAFF000472D20000019C000000580000001400000000000000040009
              59860F31DEFF2255FFFF1E50FFFF2E4ADEFF000000170000001B0000000A0000
              00010000000000000000000000000000000000000000000000001C37D9FF0C40
              FFFF0F44FFFF0622D2FF000335AA000000850000002D0000000400010A1A0015
              BAEE2558FFFF2455FFFF1847F6FF2456FFFF0000007500000061000000330000
              001D0000000E000000010000000000000000000000000000000000000000092D
              E3FF0F42FFFF0F43FFFF010B9EEF0000049C0000004D0000000F0008486A1235
              E3FF285AFFFF2657FFFF2456FFFF1D52FFFF2456FFFF5862A2FF020513960000
              00610000003F000000240000000E000000010000000000000000000000009CA1
              E3FF063AFCFF1246FFFF0725D5FF000227A20000006A00000019000E84AE2250
              F7FF2A5BFFFF1A45F4FF1B4DFBFF2556FFFF2456FFFF1F51FFFF2456FFFF5E67
              A5FF0206158B000000790000003F000000240000001600000001000000000000
              0000092EE2FF1448FFFF0F3AF1FF00055ABC0000007D000000200015ADDA2F60
              FFFF295CFFFF566EE3FFA5ABDFFF2547E7FF1A4BFDFF2456FFFF2456FFFF1D50
              FFFF2456FFFF6873BFFF00000075000000790000003500000028000000160000
              00014D63E3FF1347FFFF1649FFFF000986DB0000008700000024011EC8F03364
              FFFF2A5CFFFF7485E2FF00000000000000009DA4E2FF274AEAFF2152FFFF2659
              FFFF2557FFFF1E52FFFF2456FFFF6873BFFF0307197300000081000000350000
              00217080E6FF1447FFFF184EFFFF010FA6EE00000087000000240120CCF03566
              FFFF2B5EFFFF7385E3FF000000000000000000000000000000007B87E1FF1C4F
              FFFF1E51FFFF2558FFFF2558FFFF2153FFFF2456FFFF808BD5FF0000008A0000
              009E7182E6FF1549FFFF1C50FFFF0010A8ED0000007D0000001F0019B9DA3767
              FFFF3262FFFF536EE7FF00000000000000000000000000000000000000000000
              00007B87E1FF1C4FFFFF1C4FFFFF2456FFFF2455FFFF184CFFFF2456FFFF4D65
              E4FF4D65E4FF1A4FFFFF1D4FFFFF000D8CD70000006800000018001492AC2C5A
              F9FF3668FFFF1D48F1FF00000000000000000000000000000000000000000000
              000000000000040B2628A0AAEDFF2045EBFF1C50FFFF2557FFFF2455FFFF1B4E
              FEFF1644F6FF2152FFFF1844F4FF000961B70000004B0000000E000C54611943
              F0FF3B6BFFFF2C5FFFFF8896E1FF000000000000000000000000000000000000
              0000000000000000000000000000040B26287B87E1FF2248EEFF1C4FFEFF2557
              FFFF2556FFFF2456FFFF0E31E1FF00052E900000002A0000000400010B0B0126
              D8ED3D6DFFFF3969FFFF214DF4FFD5D6E1FF0000000000000000000000000000
              00000000000000000000000000000000000000000000040B26287B87E1FF1C4B
              F8FF2758FFFF2556FFFF0017B1E9000005560000001300000000000000000013
              72771A45F3FF3F6FFFFF3A6AFFFF2B52F0FFD3D4E1FF00000000000000000000
              00000000000000000000000000000000000000000000182F78782B4EECFF295B
              FFFF2B5DFFFF1035E5FF000A4992000000250000000400000000000000000000
              0404001FB5C62C5BFAFF3F70FFFF3B6AFFFF224FF6FF8394E5FF000000000000
              00000000000000000000000000000000000094A0EBFF1D48F2FF2C5DFFFF2F5F
              FFFF1E4AF4FF001490C700000134000000090000000000000000000000000000
              00000004191A0022CADA2D5AFAFF4372FFFF3D6CFFFF3364FFFF1F4CF6FF2548
              B7B82548B7B82548B7B82548B7B81A46F3FF285BFFFF3162FFFF3365FFFF204D
              F4FF0018ADDA000212410000000C000000010000000000000000000000000000
              000000000000000518190020B7C41A47F6FF406FFFFF4271FFFF3E6EFFFF1F4C
              F6FF1F4CF6FF1F4CF6FF1F4CF6FF3769FFFF3867FFFF3565FFFF143EEEFF0018
              9DC7000212350000000900000001000000000000000000000000000000000000
              000000000000000000000000030300146F710029DBE91A48F7FF315FFCFF3F6F
              FFFF4170FFFF406FFFFF3B6AFEFF2D5BFBFF1742F2FF0023CEEA00105F7D0000
              0316000000040000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000010809000F535A001895A3001F
              C1D20027D8E90025D8E9001EBED300168DA7000D4C6400010817000000040000
              0001000000000000000000000000000000000000000000000000}
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
          end
          object cmJobRevisar: TcxButton
            Left = 281
            Top = 3
            Width = 49
            Height = 45
            Cursor = crHandPoint
            Hint = 'Revisar documento a ser impresso'
            Caption = 'Revisar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = cmJobRevisarClick
            Colors.NormalText = clBlack
            Colors.Hot = 16776176
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            OptionsImage.Glyph.Data = {
              36090000424D3609000000000000360000002800000018000000180000000100
              2000000000000009000000000000000000000000000000000000000000000000
              0000000000080000001F00000027000000270000002700000027000000270000
              0027000000270000002700000027000000270000002700000027000000270000
              00270000002700000027000000210000000E0000000200000000000000000000
              00000000001F0000007300000090000000920000009200000092000000920000
              0092000000920000009200000092000000920000009200000092000000920000
              009200000092000000900000007D0000003F0000000C00000000000000000000
              0000886554FF997766FF967463FF967463FF967463FF967463FF977464FF9574
              62FF957562FF967363FF947461FF937260FF94715FFF92725EFFAC9387FFBAAA
              A6FF857F74FF77716EFF0B0B0BA1000000730000001C00000000000000000000
              00019A7A69FFFEF2E4FFF9EBDDFFF9EBDDFFF9EBDDFFF9EBDDFFF9EBDEFFF9EB
              DCFFF9ECDDFFF9EADBFFF9EADCFFF9EBDBFFF8EAD8FFF8E7D5FFF0E5DEFF0645
              FFFF4E85E6FFE5DACFFF50504FD9000000770000001E00000000000000000000
              00019B7B6BFFFFFDF3FFFCF6EBFFFCF6EBFFFBF6EBFFFCF6EBFFFCF5EBFFFCF5
              ECFFFCF5EAFFFCF5EBFFFCF4E9FFFCF4E8FFFAF3E8FFF0ECEDFF0C4AFFFF469C
              FFFF64D7FFFF659DE9FF78746FEF000000490000000D00000000000000000000
              00019B7C6BFFFFFDF4FFFBF6ECFFFCF6EDFFFCF6EDFFFCF6ECFFFBF5ECFFFBF5
              ECFFFBF5EBFFFBF5EAFFFBF4EAFFFBF4E9FFEEEAEFFF0B49FFFF49A2FFFF6FD9
              FFFF57B7FFFF0F5AFFFF0A0C13910000002C0000000200000000000000000000
              00019C7D6CFFFFFEF6FFFCF7EEFFFCF7EFFFFCF7EFFFFCF7EFFFFCF6EEFFFDF8
              F2FFF8F3EDFFF6F2ECFFFCF7F1FFEFEAE2FF848286FF3B8CE1FF6EDDFFFF56B4
              FFFF195BFFFFC5BFD2FF00000092000000270000000100000000000000000000
              00019F7E6DFFFFFFF8FFFCF8F1FFFCF8F1FFFCF8F1FFFCF8F1FFCAC7C4FF8789
              8CFF7D7C79FF7F7D7AFF87888BFF9E9D99FFAEABA6FFC0C7C2FF419AE9FF1456
              FFFFE4E1EDFFC1AEA5FF00000092000000270000000100000000000000000000
              00019F7F70FFFFFFFAFFFCF9F3FFFDF9F3FFFDF9F3FFA2A3A3FFB5AA96FFF5D0
              94FFFBD293FFFBD39AFFFCD79DFFC2B5A0FF808389FFC4C0BBFF82818FFFE6E5
              F0FFFCF3E4FF927160FF00000092000000270000000100000000000000000000
              0001A38070FFFFFFFCFFFDFAF5FFFDFAF5FFDAD8D6FFAEA693FFFCD79AFFF1D1
              9BFFEFD099FFEECD91FFF0CF97FFFAD79FFFC0B49EFF999795FFE7E3DCFFFBF5
              EBFFFCF2E5FF93715FFF00000092000000270000000100000000000000000000
              0001A38171FFFFFFFEFFFDFBF7FFFDFBF7FF939496FFF4D8A2FFF5DDAAFFF1DB
              AAFFF1DBA9FFF0D4A2FFEFD097FFF0CE9AFFFEDAA3FF8E8F91FFFCF8F1FFFBF6
              ECFFFCF4E6FF957261FF00000092000000270000000100000000000000000000
              0001A48372FFFFFFFFFFFDFBF9FFFEFCFAFF828280FFFFE8B5FFF6E5BEFFF7E7
              C0FFF5E2B8FFF3DDB1FFF1D6A5FFF0D095FFFDDAA4FF868583FFFDF8F2FFFBF6
              EDFFFCF3E7FF947360FF00000092000000270000000100000000000000000000
              0001A58473FFFFFFFFFFFEFCFBFFFEFDFCFF848383FFFFF3C8FFFCF5DCFFFAF3
              D6FFF7ECC8FFF6E7BDFFF3DCADFFF0D39EFFFED9A1FF848482FFFCF7EFFFFDF7
              EEFFFEF5E8FF967362FF00000092000000270000000100000000000000000000
              0001A88574FFFFFFFFFFFEFDFDFFFEFEFDFFB4B5B5FFEFE6C5FFFFFFF0FFFEFE
              FCFFFCF6DBFFF7ECC7FFF6E1B3FFF3D7A4FFF4D8A4FF909194FFFCF7F0FFFCF7
              EFFFFDF4E9FF957361FF00000092000000270000000100000000000000000000
              0001A88675FFFFFFFFFFFEFEFEFFFFFFFFFFF3F3F3FFA5A39CFFFFFFECFFFFFF
              F7FFFDF9E5FFF9EECCFFF7E3B6FFFFE1A6FFA49D91FFD9D6D2FFFCF8F1FFFCF8
              F0FFFDF6EBFF977463FF00000091000000270000000100000000000000000000
              0001A98776FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEBFFA5A49EFFE8E3
              C7FFFFFCD3FFFFF2C2FFE9D5ABFFA29D94FFC7C6C6FFFDF9F3FFFCF8F1FFFDF8
              F0FFFDF6EBFF967463FF0000008F000000270000000000000000000000000000
              0001AC8877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FFA5A5
              A7FF808083FF808282FF999A9CFFE3E2DFFFFEFBF6FFFEFAF6FFFDFAF3FFFDFA
              F2FFFDF5ECFF987563FF0000007B0000001F0000000000000000000000000000
              0001AD8978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFEFEFFFFFEFDFCFFFFFDFBFFFAF8F5FFF6F2EDFFF3ECE7FFECE4DFFFE1D6
              D0FFC9B5A9FF7E5D4EEE000000450000000E0000000000000000000000000000
              0001AE8978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFEFEFFFFFEFDFCFFFFFFFEFFCAB5AAFF9C7A69FFAA8B78FFA8846AFFA27A
              5CFF7D5A4AF31E15126700000014000000020000000000000000000000000000
              0001AE8B7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
              FEFFFEFEFDFFFEFDFBFFFFFFFDFFD5C7BEFFCCB5A3FFFCE9C5FFF0CC92FF906C
              56F31B1311640000001400000002000000000000000000000000000000000000
              0001AF8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
              FEFFFEFDFCFFFEFCFAFFFFFEFDFFD9CAC3FFC4A384FFECC88EFF8B6751F21E16
              1366000000140000000200000000000000000000000000000000000000000000
              0000AE8979FFFFFFFFFFFEFEFFFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFD
              FCFFFEFCFBFFFEFCF9FFFFFFFCFFDACCC4FFBB9369FF8F6B54F21B1311620000
              0013000000020000000000000000000000000000000000000000000000000000
              0000AF8C7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFD1BEB4FF805B4BF11F171362000000130000
              0002000000000000000000000000000000000000000000000000000000000000
              00009E7661FFB18F7FFFAF8C7BFFAF8D7BFFAE8B7CFFAD8C7AFFAC8A7BFFAB89
              79FFA98878FFA88777FFA98A78FF846555E51E1511490000000D000000020000
              0000000000000000000000000000000000000000000000000000}
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
          end
        end
        object LMDSimplePanel1: TLMDSimplePanel
          AlignWithMargins = True
          Left = 621
          Top = 2
          Width = 315
          Height = 52
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Bevel.BorderSides = [fsLeft]
          Bevel.Mode = bmEdge
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 3
          object Image4: TImage
            Left = 7
            Top = 6
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              00100000001008060000001FF3FF610000002B744558744372656174696F6E20
              54696D6500446F203134204E6F7620323030322032333A35393A3234202B3031
              3030B95D9F780000000774494D4507D605170D322CDAED1E0500000009704859
              7300000B1100000B11017F645F910000000467414D410000B18F0BFC61050000
              02EC4944415478DA6D935D48935118C79F33D30DB739C8C6D20C9CA14C14492F
              13D33E975DCA7651576584165D9874692012082AC46CA186863A75B125749918
              751373D63641684D702EB7C9B6625BFB7AE7BEDEB7E78C19287BC66FDBFB9EF3
              FCCFF3FCCF390430969696640E87A3291E8F292A2B2BEBCF5557D7673968585F
              FBF8D6687CFF06A744912C140942BF743ADDEA2DA5B2E78C547A6C7071C5C0BE
              7A39F6D462B11AF13180B04505542A555D77F76D736FEF7D69380590CE00E4F0
              7D6939C0F3278FED33535303F8684662450530F8FD7D0F871E3D1B1E3A2DAB86
              241541055E1980E9D31A0C0F3E18F67A0F7438EFD7C92A8E044857E7E5FA3BF7
              FA7E5E51DDE531496C1847B852805DFB012C8EF4AEB31C319A4CA60FB1582C54
              10E1FE0BCCCFCF37B9DDFB5D91447A5435F0426CB77C87BD1F16F8E376401977
              0857AF2BE16C55156C6C6C785C7BAE09ED6BADAED04E96A0816B52A9F4E6F99A
              1ACE66B382D9F495D4D6CAE1625B1B343428801ACBE7F3A1043FBE801FAC360B
              A75FD64FAEBC5B9940013FD1EBF509A552591E8944209BCD72229108643219C9
              6432904EA78165D9FC6FC8F71706433DD02ABA01BC5551706474A41F05BE9085
              858504EE4279229180542A958786582C86783C0EE1701842A11030F124E41816
              FCBF7DB0B3B7C34C6A356374A7690BC98E8E0E4130180489449287AE6AB7DB81
              BEA3C2814000D03CC8E572F9765098191F1F9F4281196230180ED56A359FAEEA
              F178C0ED7603C771B0B5B5057EBF1F783C1E1042F202C96412D02FFA9FD16834
              D398324DB45AEDE7969696AEF6F67642271FC5ECEC2CB85C2E8846A320140A41
              201000FA92763A9DDF3076716C17A72DD36DAC522814EAE6E6E64E34F31A8644
              2E97C3DCDC1C78BD5EAAC56125DB9B9B9BD8959D418FE8BDD847B6111B15C0F3
              0632A4165751343636B6A22797B09A0AB3D96CC5242C22CAE0F80142577515EE
              4504618E4E22AD9DFA505110BB80D4D1EB50487422BE425202491F3B89278EF6
              29448888909242022555EC36FE03C8B862D46D91C85E0000000049454E44AE42
              6082}
          end
          object Image5: TImage
            Left = 7
            Top = 28
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              00100000001008060000001FF3FF610000002B744558744372656174696F6E20
              54696D65004D6F2031352041756720323030352031313A33313A3134202B3031
              3030D9FE197A0000000774494D4507D605170D3138EB1A99BB00000009704859
              7300000AF000000AF00142AC34980000000467414D410000B18F0BFC61050000
              02194944415478DA8D92CB6B135114C6BF891B1171EBCAF6CFF0B111E94257A1
              8B22080A22B56971D17663427D4C4AD34C04B5536B9AD6421214A1DA6228F85A
              D4A236881B71ADC4A2E842BB118AA29DC9DCEB77E6D17642150F7C9C7B2FF7FC
              EE795C03B4C2D4532DDE759BE2E044DE09FCBAE3E2EB97466AF6D6A5396ED728
              0FA11911209D3A8ABFD9E0C82CF6ECDE85FAD2C2D0D2C3729547AB11645B80D6
              1A9292A78275DABA8FBED349DC9D5FC4CB67B50BCF1F552B11440086557AA232
              BDC762AF4AA0478A520160ABD9974F24E9EAD4771F90B51794D99FDC16E011D0
              A41CD7C3DA8F5FB04B0FB43D7C26C72B52CA4A0018AB2973A0136FDE7E64209B
              C948E99FC3121C56BA4E71898E036D30F3554CE4BAC7B92D51EF62007935789D
              01F23A1791977E484666BE829BB9B337786D927AEF03CCEB35951DECC48B571F
              FCE6292D694B2654E8B59140C721666055516C050C5D9953A3E7BB507FDDF001
              ADC1520612068E1C6CC7B05521A0678227C50D40C6BAA7ACCC712C0B406F066E
              7AED67208011AB8CE2682A0E18C8DE5163E6492CD61B610941A09F0937B28600
              58428E194CE65B00FDE66D65674FE1F1F24A344434BDA0693E48075338BCBF0D
              F9421953566F1CD0939E51D3856EACFE74B7FC03F8D94413F1FF0275ED6A05D3
              565F0C807317677422914010B291440808470BED4F67074BE11462FF40AC9DEA
              A2F649BFF16F936A3E53F3D4A708B093DA1BFAFFB1DFD437F17F0046E9472767
              05FA4C0000000049454E44AE426082}
          end
          object lbImp: TcxLabel
            Left = 27
            Top = 5
            Caption = 'Nome Impressora'
            Style.TextColor = 3552822
            Style.TextStyle = [fsBold]
          end
          object lbDoc: TcxLabel
            Left = 27
            Top = 28
            Caption = 'Nome Documento'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.TextColor = 3552822
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
          end
        end
      end
      object TLMDSimplePanel
        AlignWithMargins = True
        Left = 6
        Top = 29
        Width = 938
        Height = 64
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Bevel.Mode = bmEdge
        Color = clWhite
        TabOrder = 3
        Visible = False
        object Image6: TImage
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 48
          Height = 54
          Align = alLeft
          AutoSize = True
          Picture.Data = {
            0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
            00300000003008060000005702F987000000097048597300000EC300000EC301
            C76FA864000012334944415478DAC55A0974546596BEAFF67D4965ABA448424C
            2029021190248C0406B547E3B4F638EDD1E971CE2C1CE5CCE84CB7DDCEE0D8E7
            B48378B00F0DB8E102C8268DB48AC0208A829284B04A169624C62C90952495AA
            A496D4F65ED57B6FEE7D9520704268709977CE3DAFF2EAAFFFBFDFBDDF5DFEFF
            851145117EAC8BC16BA2E7E2775082F931006CDFBE3D291C0E3F128FC78B49D9
            4824E21604C1C7F3BC7FFCCE719C2F1008B8EAEBEB874F9D3AC5E1CF843F07D8
            0F0EE0830F3EC8F3FBFDCF656464588A8B8B41A15040341A85502804080ABC5E
            2F8C8C8C80CFE7A367A43387803A5C2ED7A7AFBEFAEA399C82C367C2FF0B80F7
            DE7B2F2D180CFEBEACACCC9C939303DF7CF30DA072A0D168884E92C8643250A9
            541230FA0EBD00BDBDBDD0DADA2A7475757DB871E3C6433815218BFFA8005E7E
            F96599D1687CA1A0A0C0890255555592622CCB825EAF07FC0E6C369B7457ABD5
            1200BAD385B482C1C141A8ABABE376EDDAB5B1A9A9A91E1F8F4E44A91F0C005A
            FF1E54E4DF1E78E081CBCAA307023D3D3D17CC66B3D6603018954AA515ADAF35
            994C0C0A904C9F3E5D02353C3C0C2D2D2D505D5D5DB37BF7EE03386517EA1AFB
            5100BCF6DA5A8D4E675CB770617912CF0BD0D0D000B5B575ECB66DDBBE0A1047
            0086A5C51906D9A4512320A5D56A5521D58A162C58602F29299162032D8FBFAB
            3DBF75EBD6C338FC2CEA1AFC4101AC5B775ECBB281F92CEBFB4BB53A3C63F66C
            27B8DDDDD0D3D306070FEEAFABACAC72E1B006940114E2B402458EA22E2D2D75
            CC993367095E26F48C44210270E8D0A1932814CCA75157FFF70EE0D55757C914
            8A7B0A58367A5724122CD5EB35EA39731C328E8B33972EF9104010FCFE28C462
            5196E7E31E8C59972030FDB158D8C5B291816070B83F29C96557A914BFA9A8B8
            4F3F7DBA13CE9E3D07030303D0D6D6E67BF3CD37EB30ED1280F3DFAB07366D6A
            490E87BD8BC2617611CE61773A53C5D2D229A25AAD8886C371596AAA5987CA82
            5C9E184F20868602685902154005FDF8D98F5927220A022FCAE5715941410ED2
            CA87E286CECEAED0E6CD9BEBDC6EF720591FA56FA24C745300962F3FAAB2DB75
            F3D0BA8B43A1F0CCD4543DCC9B3705B2B3AD5C67A73BD4D0D01DF27A237C49C9
            6DB682825C0B4D4DB597641C0C664C40865C0646638687472540478EB4A1E23D
            9891BEF66DDEBCE51C06B2872C8F72112572CB5968DBB6D6DC50287017D2E44E
            54465F5C9C211417A7F1A3A35CA4BEBE33D8D3E3E54821CAE934DDAC5939D6C2
            C2DCA42B018C3711E39F2963EA74207964703082854C84F6F63E686C3C11D8B1
            63F9199FCFEF1E53BE1B1275604245AF0B60EBD626532C165F88B56571341ACE
            CACA32C567CF4EC754A78936365E0A3637F747A8F024AC2B1B2B4A8C888F3015
            665A8A8AF293AFF500591F3324783C7E4C918348290E4198B0B029F07B3972BF
            19F6EEDD72FAD8B19D441BCAFD9D28E1C95A8A0901ECD933F0CFFDFD3DF76A34
            72B466BA3875AA35DED737123E73A627E8F34504AC3997AB28292D5C53E8A74C
            49B5DC718733999E93D298DE61743484E9B40D335218B45A13A4A525138120B1
            BC88B492434D4D2DECDEFDCA91C6C6AA6FF0611D8A6FB236E2BA00B66F6F5D99
            93A3CE713A93B15F8928868743D1781C58549EF57882319F2F8C7D99205ED95C
            D2479C4A9A2F2323C55C5151941C89B0505FFF3534370FE2F77AC8CB9B8AD451
            02E944E0184680F1E5954A05A6DA6AD8B9F3852F2F5DFA86526D23CE15BE11BD
            2704B06143FDD3D9D9E692DCDC246CACE29829C28CCBE593C7629C9C6178855A
            AD128D463DABD3693854841D1A1AE506064663191926555696C53030E031D6D7
            5F944722722828C887E4649BA434AD35914119469428B46FDFE7E21FFFB8ECD0
            E8E8F0497CDC86E3D95B02F0C61B271FB3DB4D3F9D31C3CEA2A92FD305874B5C
            F67A834C6767BFBCB373508E295161B1A898FCFC0CE8EFF74247C7B030756A36
            CC9C592897CB656869529A9F6069F1B2F5C97B1C1785CF3EABE2366FFEF74A9E
            8F5541A27588C30DAE0901BCF24AE55FD96C498F979464873190AF5E564C588C
            94631819DE19CCF161D9C68D9F68B11D10E6CC29C6F69757607BA0BA7A6EF18A
            39AE7E4E061A19F161DF73CCB365CB5364FD2F51FA6FC4FFEB0258B5EA8BB926
            93F9BF172D9A16E2B8D8150B4D30018251AB35CCEEDDD56AB95C2BA6A7A7C711
            9CC26AB55C05E07A60E822237475F5611DF8A2FDC30F9753D5AD4419BAE50DCD
            8A15EF671B8D8EB577DD352348314034A03C3F3E946884DCBF0C870273CF9E23
            6A95CA20A4A6A6F00A850C6965514DA6F495DF21D730ADB622808FCF7EFAE9BA
            467C740C65F896012C59F28661E6CCE22DF3E71744E5F21B4F837D0C7CF2498D
            1AD3A360B325F308704200E375E1DBC7E26500F5F5E7500E9CFDE493F594FF89
            46BE5B06809C94BFFEFA57EF14156528753AB570A379C601188D56DE6A35D360
            C66CB6A869D3F5ADC527F6042506AA01D5D5C7313934746FD9B29A5AE713DF15
            00B36EDDC95553A7A666D86C467EE231DF2A850D1CECDF5FA3B65892788BC524
            12E570BFA2C1B698118489E290916A0076A5F899474A2AB06DAEC2793AA26FBD
            B57A6F2C163B825F78BE1380B56B8F2E7338928BA74C498E5DADC4B5912C4ADB
            C183076BD4365B0AAFD71B283EB0C596CB71EB98C8BDD26F0429DB8CCF451B1D
            7A4677AC2F70F4E869C8C91912DF7D77DB818E8E0EF2C2A55B4EA374AD5953F9
            787A7AF2DD79790E2E1EBF368F8B97BD4056C42A2A3B78F0883A3DDD81745293
            6F24FF20B745AD5623C3742BAD43CA93500FC5C663F2A85A69E714F2B42156B4
            8CC404558CE3401CF5FB235ECFE950D0BFB766EFBB1F077A6B6807C7DF7433F7
            FCF3FFBBD06A4DFA8FB2B25963B5E05B2F242C09B2447D93C9705F2BFFFCF34A
            190210150AA528D91791895460658CD4EB513A466A8931EC41CC79F6BC618DA3
            F0F86054D3EA0F809F55405C54002B04613486C6C2E2992B44215F08F672C3EE
            355FACFBDB1DB86CE0A6F60377DE79BFF1DE7B9F5C356D5AAE65CA9434A4254F
            3D257141520A959753EF93B0B4823F7CB8469E91E1C0C904E2BD8C68837333E4
            3D0E2D1B894441A666548EF9B34B4F297E93D2E15182922F834CC71AD45701AE
            E17268BFF00204636108703C8CB20824CA410ECF424EA8FFE0F97DAB9F19E93D
            DE01897322F18600D0CA8AA54B57CFCBCE2EFA657EFE6D60B7A71261643C2F32
            524B23E2362AD1223018C4B2AAAA53E88174865A0F12B2781415C03D84749402
            A87CC14F172CAC111E3629542E30C02250722590947C08045E0D31B11B4ED5EF
            87DEC028782271F045F1F72C1A1C3FEB625E707A06EA9A0FAD7C32E26A6EC235
            A3E32026DDD02008ED430FFD7AB1D359FEA8D96CD5DB6C16C164328849496606
            53A78C7E9AE0088359A41A2880A351565298AC4ED4A320A58E60C6C3F794D4AA
            1F7328D51E30C8E78136F06B04E184949C153849105CFD0F42D7C05CE84100ED
            232C0C4704F0732110C2B8EB91ED8554ED9F20B5EE579F35EDFDA765A85AFB78
            A3772300B2FBEEBB373537775A4566E6CC7B45D1849B410376A71CF6F8064040
            80607063E2C12DA10BA86A236BA4CA8D46C2BE9FC5742A80B5A8D8D164D95D12
            D5EE072382D4B83742B27C36A4EA78D069C3A04CDD0443BDF741A73B0B3AFD11
            F8DACDC2A5007234BD1C5C9D6B800F2108DB0330BFE74BB1E3E8D697DC67B76D
            C2057A51777E52003B77EEFC8B919191A50E47A6B1B0B0403A78A273CCB6B62E
            70B942B8978D21184A8F32916523A31E4FEF905C1EC8E3380F98CD7A282B2B83
            EEDE0199A2F4FE9F349BFE5A6F9097814E910FB98E0130F66E870CA30006950C
            039803579883AE11063A7C0480874B2C1663E30A708B6720D8781429B81E6659
            2E027BF2F1F6D65D4B9FC1445143C72CD70580CA3B3072D7969797D3D98D7446
            E3F178A413334AA3C3C323ACD73BDCD7DADAEA6A6D6D8BB85C43718D461D41A5
            FF46A954490753CF3DF71CEC3BDAE160EEEF2E91DBF6437F6B3524C9A64269F9
            EF20C9F714A46BD2C1A014302A0518444374FB39E8F072D0EC8EC2453FC6011B
            045EF50EB05DFF831E780CD2AD0720BF779958BBE3F0EFA3FDF55B51918BD705
            B069D3A647F3F3F31FC1B618DC6E379C3B774E02407D0B1D3C7DF4D147479B9B
            9BA33874088536E0C3D84ECBB2B3B397E318068B11AC5CB912863425736B731F
            CED663D00E5ED80E99563F14645D8054710E24EB01F44AAC095817BC111EFA46
            6370D1C7418B270A7D81188CE08628263B08826635F2B91DF418D30B60219CD8
            E2FC70F4EBF51B70CDAFAE0BE0EDB7DFFE4FDCC9CF77381CD2DF172F5EC466AB
            1E0333261DCEEEDBB7AFAAA1A181F6AEAD2874624641C56026FA435A5A5A664A
            4A8A74CE299BFBB3BB9BB2FFCE9C6570804E9502268B0FACDA3430C967822A5C
            0EDC5005F098F37D9836078271F4020B17308829138D4455A0323F0E51E10C3A
            DD0DDAE05458640338BDF989132375BF5D8FEB7D765D00CF3EFBEC9308E06EBB
            DD0EA48CC160900E5D3B3B3BA1B1B1110377882AAD1F53663BDE255E614B9182
            F34DD76834C68C8C0C282C2C84772F782A1A53FE519BA9B743B24E074AB50683
            5B0B268D198C1A06FAEA37630A1521C0C6C01D8E43AF9FEE3104244290C5E219
            6F01D1FA4B80901A74412794A50D42D3DE475B866A9E7E07D7DC755D004B962C
            A9C00AFBF8B469D324E593939331E32449814C77CAF52E974B3A024C9CD78234
            262F2F0F0834B50C44BD95479A2A9A1DFFA2B5EBEC604300468D06942A2C620A
            3968D41CB49FD904A1481A0431EDFAA23C5665DC83A3F85939C835DB20665901
            0211F5E2EFC0AA3F0CB343BF8273A7BB5B868F2D7B0F9FEEB82E80C58B17E721
            555611E79116402F28C8031413D8EB4B7B645294FE268BD2456F5E08507F7FBF
            04AAAFAF0F5A3573EE3E95FF337386261392709C15458F1BA048D489F3B541C3
            99F51200968F412426602516B09D88011B5502A35B0FA219F94F2F9C9AB64146
            3C0B9CB76D84E3EFE79E8834BE7460520073E7CE950090A29479E8F5D0C2850B
            250A91A5C92B6465EA44C70FB6A880D16B23F20EA55B7ADE2DCC2FAC9CF15461
            92D90B492A3352470546950AB40A1E8B901E2ABFAAC6C8F101C78B10C5B6231C
            13A52A8EA90949899D43D643B833480338570985339E801479088E6D70EE117A
            FE746C520A21874D369B6D037A4015894424E55E7BED35291B6DDDBAB5A9A8A8
            28E8743AB310A49D1A370293383611A52C455EA160FFBC76247E3EFDD147C233
            CAC1D35E0B7794CE049EBD03948C16065C4BD153C5D86AB210C3E2178B63C74A
            9D6F1C01B004025B2A368C40BAC198F93C14587B21747EA9F8F5FB9F6E855077
            F5A4414CBD1052E4E768E19FE3187930182450A460A4A5A5E5140EA1B3FED119
            3366A4DE7EFBED0F524B416D32A65E89720482E4F537D6D76AEE5CF55FC753DF
            4B02EF3360B2EF8480F717D441E15E920E0C62D2065B12DA231000EA7E49C80B
            F22660B2FF15A629B490A532C2B11D4FB7474EFF964E2D764D9A46C7DEE91A10
            C01CB55A5D887FE6233574E88966FCCD08245E54B83136EC982E971300A20E81
            ACA8A8808F3FFE58CA426BD7AE3D3CF5AE654E5781E6A97E0BD2B6FF4D006538
            713220ED8DF8C4D68E44B2BE20B5D309003840751AB20B9649CA7BCEFC83D8B2
            E7AB1DE093D2F7879316B2712FE00D1B11484149A34433F65517248EBCC348A5
            2C8C87350894A12026102FBEF822BCF5D65B14F8E2FAF5EB0F89A2A2A56CC9AE
            95678A1E2B677BB7212D8A01CC9FE3DD89FA9B50F938BD154E78804E87252F08
            1288A95A0E32D3AAB0153F0935DB171D86CE3FB4E1BA9FA21C9BB495B8C61374
            9AAF41518F3DA6334BEACB794CA93AA4DA06F4808E28441968F9F2E53065CA14
            7A53D97FE2C489B338F6A839AFDCE4287DF2DDF682154ECED09278B9E49F8FA6
            58878B8C260090C445C90B565508B2B541B0A9A3208604A83C3678065A5F3C87
            6089BE885E7AE1C1DFD40B8EF17F15B86A43819D1CD2E6410CF6C7687746E933
            71C09B2162AC50C3D58BC38EA3040DE9F3E666943EF99272D68105E1CC5DD8BC
            A580780E8D290FE03C71302B38B0AA23D82345C1849F8DCA185CE801F14C5DC7
            11E858D70D628C0EBDBE803FB79DBE0960062C7A73316867E2E73C7AE58474AA
            458F78F16BEC0380381B49D05155609BFDC4DF3B0A9CBF9835BBDA9E6AE520EE
            FD0960330AB49B64509D684484AE7E399C6F0FF5845A771D05EF697A3746CA63
            5B0A1728915C5EFB7B02301E2BA928F6B15851A190F5A957F249EE4E7890A898
            0932EDED6A7B5999CC5C34CD644BCDD668B496382F887E5FC01BF474F581B7D6
            0DA3ED94A2FAC694A713BBFE6B4FACBFB7D7AC63CA29C6142461C6AC1EB97633
            3E0618A3574A0C5963826D1A68C786508CB9C70CD00389941DFCCE2FF96E12CC
            A4FF46734572D08E794F33F6375DA428593A0489FDEF75CF87FE0FE01F330CFF
            A36DC30000000049454E44AE426082}
          ExplicitHeight = 48
        end
        object LMDSimplePanel5: TLMDSimplePanel
          AlignWithMargins = True
          Left = 59
          Top = 2
          Width = 877
          Height = 60
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Bevel.BorderSides = [fsLeft]
          Bevel.Mode = bmEdge
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          Visible = False
          object lbplusTit: TcxLabel
            AlignWithMargins = True
            Left = 5
            Top = 2
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Venda WEB - Pagamento pendente:'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
          end
          object lbplusDescr: TcxLabel
            Left = 119
            Top = 20
            Align = alClient
            Caption = 'R$15,00 - XXXXXXXXXXX XXXXXXXXX XXXXXXXXXX'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            Properties.Alignment.Vert = taVCenter
            Properties.WordWrap = True
            Width = 756
            AnchorY = 39
          end
          object btnplusConfirmar: TcxButton
            AlignWithMargins = True
            Left = 5
            Top = 23
            Width = 111
            Height = 32
            Cursor = crHandPoint
            Align = alLeft
            Caption = 'Salvar pagamento'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = cmJobResumeClick
            Colors.NormalText = clGreen
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            LookAndFeel.SkinName = ''
          end
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    AutoDockColor = False
    ImageOptions.UseLargeImagesForLargeIcons = True
    LookAndFeel.Kind = lfFlat
    ShowShortCutInHint = True
    UseBarHintWindow = False
    UseSystemFont = False
    Top = 240
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      BorderStyle = bbsNone
      ItemLinks = <
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmLiberar'
        end
        item
          Visible = True
          ItemName = 'cmPausar'
        end
        item
          Visible = True
          ItemName = 'cmFinalizar'
        end
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmTransferir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmTempoMaq'
        end
        item
          Visible = True
          ItemName = 'cmVendaMaq'
        end
        item
          Visible = True
          ItemName = 'cmPlusMaq'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmVenderCredAvulso'
        end
        item
          Visible = True
          ItemName = 'cmVenda'
        end
        item
          Visible = True
          ItemName = 'cmVendaPLUS'
        end>
      RotateWhenVertical = False
      UseOwnFont = True
      UseRecentItems = False
      UseRestSpace = True
      WholeRow = False
    end
    object BarMgrBar2: TdxBar [1]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      Color = clBtnFace
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 889
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmLigar'
        end
        item
          Visible = True
          ItemName = 'cmDesligar'
        end
        item
          Visible = True
          ItemName = 'cmReiniciar'
        end
        item
          Visible = True
          ItemName = 'cmDesbloquear'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmCapturar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmProcessos'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAcessoRemoto'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    inherited cmNovo: TdxBarLargeButton
      Caption = '&Nova M'#225'quina'
      Hint = 'Nova M'#225'quina'
      ImageIndex = 70
    end
    inherited cmEditar: TdxBarLargeButton
      Hint = 'Editar dados da sess'#227'o'
      OnClick = cmEditarClick
      GlyphLayout = glTop
      ImageIndex = -1
    end
    inherited cmApagar: TdxBarLargeButton
      Caption = '&Excluir M'#225'quina'
      Hint = 'Excluir M'#225'quina'
      ImageIndex = 64
    end
    inherited cmLaySalvar: TdxBarButton
      ImageIndex = 34
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmLiberar: TdxBarLargeButton
      Caption = '&Iniciar'
      Category = 0
      Hint = 
        'Iniciar um nova sess'#227'o / liberar o computador para o cliente uti' +
        'lizar'
      Visible = ivAlways
      LargeImageIndex = 3
      OnClick = cmLiberarClick
      AutoGrayScale = False
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmPausar: TdxBarLargeButton
      Caption = '&Pausar'
      Category = 0
      Hint = 'Pausar/Despausar sess'#227'o'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmPausarClick
      AutoGrayScale = False
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmFinalizar: TdxBarLargeButton
      Caption = '&Finalizar'
      Category = 0
      Enabled = False
      Hint = 'Finalizar a sess'#227'o'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmFinalizarClick
      AutoGrayScale = False
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmTransferir: TdxBarLargeButton
      Caption = '&Transferir'
      Category = 0
      Hint = 'Transferir'
      Visible = ivAlways
      LargeImageIndex = 26
      OnClick = cmTransferirClick
      AutoGrayScale = False
      ShowCaption = False
    end
    object cmVenda: TdxBarLargeButton
      Caption = 'Produto'
      Category = 0
      Hint = 
        'Vender um PRODUTO para um cliente que n'#227'o est'#225' usando um computa' +
        'dor'
      Visible = ivAlways
      LargeGlyph.Data = {
        36300000424D3630000000000000360000002800000060000000200000000100
        2000000000000030000000000000000000000000000000000000000000000000
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
        000000000000000000000404042E0E0E0E9A0B0B0BEA040404C20000000A0000
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
        0000000000000202020A252525EA262626FF1E1E1EFF929292FF1919197A0000
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
        00000000000000000000000000000000000000000000010101220101011B0000
        0000000000000A0A0A2B3C3C3CFF353535FF696969FF6E6E6EFF4D4D4DC90000
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
        000000000000000000000000000008080844171717CA0F0F0FFD1A1A1AF20101
        012A000000012222224A595959FF565656FF868686FF929292FF8C8C8CE50000
        00000000000000000000000000000000000000000000020202150202021D0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000002C2C2CDE2E2E2EFF303030FFA4A4A4FF5757
        57D47A7A7ADF8B8B8BFE8A8A8AFF828282FF787878FF7F7F7FFF8B8B8BFC0C0C
        0C1400000000000000000000000005050529151515D8121212FD060606F70101
        0139000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000001434343F2555555FF7A7A7AFF919191FF9E9E
        9EFFB3B3B3FFB8B8B8FFC1C1C1FFC1C1C1FFADADADFF8D8D8DFF797979FF6A6A
        6AEE494949991E1E1E3B0000000119191986313131FF191919FF9E9E9EFF4343
        43B7000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000F0F0F1E7C7C7CFD999999FFB1B1B1FFCACACAFFD9D9
        D9FFBFBFBFFFACACACFFA0A0A0FFABABABFFCBCBCBFFE7E7E7FFD4D4D4FFABAB
        ABFF838383FF737373FE636363D84B4B4BD04B4B4BFF525252FF8F8F8FFF5D5D
        5DF4000000010000000000000000000000000000000000000000000000000000
        0038000000710000000000000000000000000000000000000038000000710000
        0000000000000000000000000038000000AA0000008D0000001C000000000000
        001C0000008D000000AA00000038000000AA00000000000000000000008D0000
        00AA00000038000000AA000000000000001C0000008D000000AA000000380000
        001C0000008D000000AA00000038000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000033333352A6A6A6FFCCCCCCFFC8C8C8FF9C9C9CFF7777
        77FE565656B6373737702C2C2C563737376C545454F6787878FF969696FFC1C1
        C1FFE1E1E1FFD3D3D3FF9F9F9FFF777777FF6C6C6CFF6E6E6EFF8B8B8BFF9F9F
        9FFE0A0A0A0F0000000000000000000000000000000000000000000000000000
        0055000000AA0000000000000000000000000000000000000055000000AA0000
        00000000000000000038000000E20000005500000071000000E2000000000000
        008D000000AA000000550000008D000000FF000000000000008D000000AA0000
        0055000000AA000000FF000000000000008D000000AA00000055000000380000
        00E20000007100000055000000E2000000380000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000003A3A3A5BBDBDBDFFCECECEFF8A8A8AFF777777FF7B7B
        7BFE313131650B0B0B14000000000405051C2C2D2DFE181818FF858585FF6161
        61EA6C6C6CDF8E8E8EFEBFBFBFFFDEDEDEFFBEBEBEFF888888FF6B6B6BFF6D6D
        6DFF1F1F1F370000000000000000000000000000000000000000000000000000
        0055000000AA0000000000000000000000000000000000000055000000AA0000
        000000000000000000AA000000710000000000000000000000AA000000550000
        00FF000000000000000000000000000000FF00000000000000AA000000550000
        000000000000000000FF00000000000000AA0000005500000000000000550000
        00C6000000000000000000000055000000AA0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000A0A0A0D858585DCC2C3C3FFD9DBDBFFB9BCBCFFA0A2
        A2FF908585FF8D7676FB7F6565C95A474798545454FF4C5050FF959797FF595C
        5CDD010202021F1F1F394D4D4D94747474EA9C9C9CFFCFCFCFFFBFBFBFFF7979
        79FF3F3F3F940000000000000000000000000000000000000000000000000000
        0055000000E2000000AA000000AA000000380000000000000055000000AA0000
        000000000000000000AA000000550000000000000000000000AA000000550000
        00FF000000000000000000000000000000FF00000000000000AA000000550000
        000000000000000000FF00000000000000AA0000005500000000000000550000
        00AA000000000000000000000055000000AA0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000B0B0B125E5A5A9EA08484FEBA8F8FFFB17C
        7CFFBE8A8AFFCF9D9DFFBB8989FFAD7878FFAD7676FFA47575FF9E7D7DFF9988
        88F8160F0F200000000000000000020303052B2B2B566A6A6AE4D0D0D0FFAFAF
        AFFF595959D40000000000000000000000000000000000000000000000000000
        0055000000C60000005500000071000000E20000003800000055000000E20000
        001C0000000000000071000000AA000000000000001C000000E20000001C0000
        00C60000008D0000000000000000000000FF00000000000000AA000000550000
        000000000000000000FF00000000000000AA00000055000000000000001C0000
        00E20000001C00000000000000AA000000710000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000251B1B2FAE7A7AECD19F9FFCE2B3B3FCEDC0
        C0FBECC1C1FCEEC4C4FED6AAAAFFC19191FFBE8C8CFFB48282FFAC7777FFA46F
        6FFFA06C6CFD8E6060D7614141933221214F0604040B5D6060C6D1D1D1FFABAB
        ABFF545454C00000000000000000000000000000000000000000000000000000
        0055000000AA000000000000000000000055000000AA00000055000000C60000
        00C6000000FF000000000000008D000000FF000000E200000055000000000000
        001C000000C6000000FF000000E2000000FF00000000000000AA000000550000
        000000000000000000FF00000055000000FF000000FF000000FF000000550000
        0055000000E2000000FF0000008D000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000030202039C7373D4DAAEAEF2E8BEBEEEE7BEBEF2E9BF
        BFF7EBBFBFFAEBC0C0FADEB3B3FBBA8A8AFDCB9B9BFECA9999FFC79797FFC18F
        8FFFB48282FEA97777FDA36F6FFD9C6A6AFE905F5FEF9B8E8EFDD2D4D4FF7B7B
        7BFF2F2F2F680000000000000000000000000000000000000000000000000000
        0055000000AA0000000000000000000000AA0000008D00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000FF0000000000000000000000000000
        0000000000000000000000000000000000AA0000005500000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000003023233BC59696FAE9C2C2EDE3BEBEEDE3BDBDEDE3BE
        BEEDE5BDBDEEE7C0C0F2DDB6B6F8B78484FDD19F9FFBCD9C9CFBCF9F9FFDD5A4
        A4FFD2A1A1FFCE9E9EFDC89797FDBE8C8CFEB07E7EFF9F6B6BFF979999FF5757
        57C7030303050000000000000000000000000000000000000000000000000000
        0055000000FF000000FF000000FF0000008D0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000FF0000000000000000000000000000
        0000000000000000000000000000000000710000003800000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000004F3B3B62CEA2A2F7E7C3C3ECE4BFBFECE5BFBFECE4BF
        BFEDE5BFBFEDE4C0C0EDDBB5B5EFB37E7EF8CE9D9DF5D1A0A0FBDDABABFEDFAD
        ADFFDEADADFFDDACACFFDBAAAAFFD9A8A8FFD7A6A6FFA97373FF827777FE1C1C
        1C3B000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000550000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000694C4C80D3A9A9F4E6C4C4ECE4C1C1ECE4C1C1ECE3C2
        C2ECE3C2C2ECE4C4C4ECDBB7B7EFAE7D7DF7CE9F9FF1D8A8A8FDE0AFAFFFDEAE
        AEFFDEAEAEFFDEADADFFDFADADFFDEAEAEFFE0B0B0FFB88585FF7A6666EC0202
        0202000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000008160609ED9B3B3F2E5C5C5ECE4C5C5ECE4C5C5ECE4C5
        C5ECE3C5C5ECE4C6C6ECDBBABAEEAC7A7AF7CF9E9EF2DBACACFEE0B0B0FFE0B0
        B0FFDFAFAFFFDFAFAFFFDFAFAFFFDEAFAFFFE1B2B2FFC29292FF745757C30000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000009C7171BCDEBEBEEFE4C9C9EBE3C8C8EBE3C9C9EBE3C9
        C9EBE3CACAEBE6CBCBECDDC0C0EEA97878F8D09F9FF2DEAEAEFFE3B2B2FFE1B2
        B2FFE1B1B1FFE0B1B1FFE0B1B1FFDFB1B1FFE0B2B2FFCD9D9DFF775353BA0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000B28383DAE3CACAEDE5CCCCEBE5CDCDEBE4CECEEBE6CF
        CFEBE7D1D1EBE9D3D3EBC8A8A8F2A16C6CFAD3A2A2F2E2B4B4FFE4B5B5FFE2B4
        B4FFE2B3B3FFE2B3B3FFE1B3B3FFE1B3B3FFE1B4B4FFD9ABABFF885C5CD00000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000002F2F2F554E4E4E8D0000000000000000000000001010101C4E4E
        4E8D5E5E5EAA4E4E4E8D1F1F1F381F1F1F383F3F3F7100000000000000003F3F
        3F711F1F1F38000000003F3F3F715E5E5EAA3F3F3F713F3F3F711F1F1F381010
        101C4E4E4E8D5E5E5EAA1F1F1F385E5E5EAA0000000000000000000000000000
        00005E5E5EAA1010101C0000000000000000000000004E4E4E8D1F1F1F380000
        00003F3F3F713F3F3F710000000000000000000000004E4E4E8D5E5E5EAA1F1F
        1F385E5E5EAA000000003F3F3F711F1F1F381F1F1F385E5E5EAA5E5E5EAA2F2F
        2F55000000001F1F1F385E5E5EAA4E4E4E8D2F2F2F553F3F3F71000000000000
        00000000000002020202BD8F8FF4E8D5D5EBE5D0D0EBE6D2D2EBD7BDBDEEC4A6
        A6F3C2A4A4F8BA9C9CF9BA9A9AF0BEA4A4F0B68E8EFCBF8C8CFFE1B2B2FFE5B6
        B6FFE4B6B6FFE3B5B5FFE3B5B5FFE2B5B5FFE3B5B5FFE3B6B6FF9A6868EC0000
        0001000000000000000000000000000000000000000000000000000000000000
        0000000000006E6E6EC67D7D7DE21010101C00000000000000007D7D7DE24E4E
        4E8D2F2F2F553F3F3F714E4E4E8D2F2F2F555E5E5EAA00000000000000005E5E
        5EAA2F2F2F551F1F1F387D7D7DE22F2F2F553F3F3F717D7D7DE22F2F2F554E4E
        4E8D5E5E5EAA2F2F2F554E4E4E8D8D8D8DFF0000000000000000000000000000
        00005E5E5EAA3F3F3F7100000000000000001010101C8D8D8DFF000000000000
        00007D7D7DE27D7D7DE200000000000000004E4E4E8D5E5E5EAA2F2F2F555E5E
        5EAA8D8D8DFF000000005E5E5EAA2F2F2F554E4E4E8D3F3F3F712F2F2F557D7D
        7DE21F1F1F387D7D7DE23F3F3F712F2F2F556E6E6EC65E5E5EAA000000000000
        00000000000015101018CB9B9BFCECE3E3F2E1D1D1F1CBB2B2E9C9B0B0DFCAAF
        AFD4BB9797C9B18787C2B18888C2AE8787C3BF9D9DD3F3E0E0FFD0B6B6FFC59E
        9EFFD1A0A0FFE6B7B7FFE5B7B7FFE3B7B7FFE3B7B7FFE8BDBDFFA67171FD0C08
        0811000000000000000000000000000000000000000000000000000000000000
        00001010101C7D7D7DE24E4E4E8D3F3F3F71000000002F2F2F556E6E6EC60000
        00000000000000000000000000002F2F2F555E5E5EAA00000000000000005E5E
        5EAA2F2F2F555E5E5EAA2F2F2F5500000000000000005E5E5EAA2F2F2F554E4E
        4E8D5E5E5EAA1010101C000000008D8D8DFF0000000000000000000000000000
        00002F2F2F557D7D7DE25E5E5EAA5E5E5EAA6E6E6EC65E5E5EAA000000002F2F
        2F555E5E5EAA5E5E5EAA1F1F1F38000000005E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F55000000001F1F1F382F2F2F557D7D
        7DE21F1F1F387D7D7DE23F3F3F71000000002F2F2F555E5E5EAA000000000000
        0000000000000D0A0A0E987272B4C69494F9D9BABAFBDAC3C3E8C8ADADD2B088
        88C2B08787C2B08989C2AF8787C2B08787C2B58C8CCDFCE1E1FFFFE7E7FFFFF1
        F1FFF2E4E4FFD9C2C2FFD3ADADFFE0B1B1FFE4B9B9FFE9BDBDFFB07E7EFF2217
        1731000000000000000000000000000000000000000000000000000000000000
        00003F3F3F714E4E4E8D1F1F1F386E6E6EC6000000002F2F2F558D8D8DFF8D8D
        8DFF8D8D8DFF8D8D8DFF5E5E5EAA2F2F2F555E5E5EAA00000000000000005E5E
        5EAA2F2F2F555E5E5EAA2F2F2F5500000000000000005E5E5EAA2F2F2F551010
        101C4E4E4E8D7D7D7DE28D8D8DFF8D8D8DFF0000000000000000000000000000
        0000000000008D8D8DFF3F3F3F712F2F2F557D7D7DE22F2F2F55000000005E5E
        5EAA2F2F2F552F2F2F555E5E5EAA000000005E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F553F3F3F717D7D7DE25E5E5EAA1F1F
        1F38000000001F1F1F385E5E5EAA8D8D8DFF8D8D8DFF5E5E5EAA000000000000
        00000000000000000000000000001711111A63484877AE7E7ED7CCA2A2FEDAC4
        C4F6D8C3C3E0BE9C9CCAB08888C2B08888C2B68D8DCFFDEBEBFFFFE7E7FFFFE9
        E9FFFFEBEBFFFFEFEFFFFFF8F8FFF3E8E8FFE9D3D3FFE8C4C4FFBC8C8CFF5E4E
        4E9E000000010000000000000000000000000000000000000000000000000000
        00006E6E6EC61F1F1F38000000007D7D7DE21010101C1010101C7D7D7DE21010
        101C000000003F3F3F714E4E4E8D2F2F2F557D7D7DE21010101C000000006E6E
        6EC62F2F2F553F3F3F716E6E6EC61010101C000000005E5E5EAA2F2F2F551010
        101C1010101C000000001010101C8D8D8DFF0000000000000000000000000000
        0000000000005E5E5EAA2F2F2F55000000008D8D8DFF000000001010101C8D8D
        8DFF00000000000000008D8D8DFF1010101C5E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F555E5E5EAA3F3F3F71000000001010
        101C000000001F1F1F3800000000000000003F3F3F715E5E5EAA000000000000
        00000000000000000000000000000000000000000000000000013224243A7D5B
        5B9BB48484F0D1B1B1FEDCC9C9F0D4BDBDD9BE9898D5FFF3F3FFFFEFEFFFFFF4
        F4FFFFFAFAFFFFFDFDFFF8EDEDFFEADBDBFFDCC6C6FFCDB0B0FFB07C7CFF927B
        7BFE5455559F0202020300000000000000000000000000000000000000001010
        101C7D7D7DE200000000000000004E4E4E8D3F3F3F71000000002F2F2F557D7D
        7DE28D8D8DFF6E6E6EC61010101C2F2F2F556E6E6EC66E6E6EC68D8D8DFF5E5E
        5EAA00000000000000004E4E4E8D8D8D8DFF8D8D8DFF7D7D7DE22F2F2F551F1F
        1F388D8D8DFF8D8D8DFF8D8D8DFF2F2F2F550000000000000000000000000000
        0000000000002F2F2F555E5E5EAA2F2F2F555E5E5EAA000000003F3F3F714E4E
        4E8D00000000000000004E4E4E8D3F3F3F715E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F551010101C7D7D7DE28D8D8DFF6E6E
        6EC6000000004E4E4E8D8D8D8DFF8D8D8DFF7D7D7DE21010101C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000A07070B4B36365E956A6ABFC09191FDDAC0C0FEE6D2D2FFD8BABAFFCBA5
        A5FFBE9090FFAB7A7AF7966868D57C5555AF6343438F7C6868F0C0B4B4FFBDBC
        BCFF8E8E8EFF4C4C4C8F00000000000000000000000000000000000000003F3F
        3F714E4E4E8D00000000000000001F1F1F386E6E6EC600000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000005E5E5EAA2F2F2F550000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000008D8D8DFF5E5E5EAA2F2F2F5500000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005E5E5EAA2F2F2F550000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000001D15152265484882A78686FACDB6B6FFA192
        92FF555353BA03010103000000000000000000000000191919346C6D6DF3DADA
        DAFFBCBCBCFF818181FD0D0D0D16000000000000000000000000000000006E6E
        6EC61F1F1F380000000000000000000000007D7D7DE21010101C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000005E5E5EAA2F2F2F550000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005E5E5EAA8D8D8DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005E5E5EAA2F2F2F550000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000666868A0CCCDCDFFBCBD
        BDFF797A7AFD4144449746464695545454B3626262D3717171F1808080FECACA
        CAFFC2C2C2FF868686FE1111111E000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001F1F1F381010101C0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000001F1F1F381010101C0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001313131B929292EEE6E6
        E6FFADADADFF8A8A8AFF999999FFACACACFFBEBEBEFFCCCCCCFFD3D3D3FFD1D1
        D1FFADADADFF6B6B6BC600000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000003434344A9E9E
        9EF9DFDFDFFFE4E4E4FFE2E2E2FFDADADAFFCBCBCBFFBEBEBEFFAFAFAFFF9C9C
        9CFF6E6E6ECF1111111E00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000002929
        293F757575C78E8E8EEB7A7A7AD0676767B75959599F48484884393939672323
        233F010101030000000000000000000000000000000000000000000000000000
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
      LargeImageIndex = 85
      OnClick = cmVendaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmMaquinasDest: TdxBarListItem
      Caption = 'Transferir para'
      Category = 0
      Visible = ivAlways
      OnClick = cmMaquinasDestClick
      OnGetData = cmMaquinasDestGetData
      ShowNumbers = False
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Mostrar Texto'
      Category = 0
      Hint = 'Mostrar Texto'
      Visible = ivAlways
    end
    object cmSubTransf: TdxBarSubItem
      Caption = '&I. Transferir'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMaquinasDest'
        end>
    end
    object cmAddTempo: TdxBarButton
      Caption = '&A. Adicionar Tempo'
      Category = 0
      Hint = 'Adicionar Tempo (CTRL + BOT'#195'O direito do mouse)'
      Visible = ivAlways
      OnClick = cmVenderCredClick
    end
    object cmAddProduto: TdxBarButton
      Caption = '&B. Adicionar Produto'
      Category = 0
      Hint = 'Adicionar Produto (ALT + BOT'#195'O direito do mouse)'
      Visible = ivAlways
      OnClick = cmVendaAcessoClick
    end
    object cmPMIniciar: TdxBarButton
      Caption = '&E. Iniciar'
      Category = 0
      Hint = 'E. Iniciar'
      Visible = ivAlways
      OnClick = cmLiberarClick
    end
    object cmPMPausar: TdxBarButton
      Caption = 'Pausar'
      Category = 0
      Hint = 'Pa&usar'
      Visible = ivAlways
      OnClick = cmPausarClick
    end
    object cmPMFinalizar: TdxBarButton
      Caption = '&G. Finalizar'
      Category = 0
      Hint = 'G. Finalizar'
      Visible = ivAlways
      OnClick = cmFinalizarClick
    end
    object cmPMEditar: TdxBarButton
      Caption = '&H. Editar'
      Category = 0
      Hint = 'H. Editar'
      Visible = ivAlways
      OnClick = cmEditarClick
    end
    object cmVendaAvulsa: TdxBarButton
      Caption = 'Venda Avulsa'
      Category = 0
      Hint = 'Venda Avulsa'
      Visible = ivAlways
      OnClick = cmVendaClick
    end
    object cmPMDesligar: TdxBarButton
      Tag = 2
      Caption = '&1. Desligar'
      Category = 0
      Hint = '1. Desligar'
      Visible = ivAlways
      ImageIndex = 36
      OnClick = cmPMDesligarClick
    end
    object cmPMReiniciar: TdxBarButton
      Tag = 1
      Caption = '&2. Reiniciar'
      Category = 0
      Hint = '2. Reiniciar'
      Visible = ivAlways
      OnClick = cmReiniciarClick
    end
    object cmPMFecharGuard: TdxBarButton
      Caption = '&3. Desbloquear (Fechar NexGuard)'
      Category = 0
      Hint = '3. Desbloquear (Fechar NexGuard)'
      Visible = ivAlways
      OnClick = cmDesbloquearClick
    end
    object cmDownload: TdxBarButton
      Caption = '&1. Permitir download de Arquivos'
      Category = 0
      Hint = '1. Permitir download de Arquivos'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = cmDownloadClick
    end
    object cmProgUso: TdxBarButton
      Caption = '&7. Lista de Processos (Programas em uso)'
      Category = 0
      Hint = '7. Lista de Processos (Programas em uso)'
      Visible = ivAlways
      OnClick = cmProgUsoClick
    end
    object cmEnviarChat: TdxBarButton
      Caption = '&Q. Enviar mensagem (chat)'
      Category = 0
      Hint = 'Q. Enviar mensagem (chat)'
      Visible = ivAlways
      OnClick = cmEnviarChatClick
    end
    object cmBloqSite: TdxBarButton
      Caption = '&R. Bloquear Site'
      Category = 0
      Hint = 'R. Bloquear Site'
      Visible = ivAlways
      OnClick = cmBloqSiteClick
    end
    object cmPMCapturar: TdxBarButton
      Caption = '&J. Capturar'
      Category = 0
      Hint = 'J. Capturar'
      Visible = ivAlways
      OnClick = cmCapturarClick
    end
    object cmAddImp: TdxBarButton
      Caption = '&C. Adicionar Impress'#227'o'
      Category = 0
      Hint = 'C. Adicionar Impress'#227'o'
      Visible = ivAlways
      OnClick = cmAddImpClick
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = '&F. Pausar'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmPMPausar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmPausarTodas'
        end
        item
          Visible = True
          ItemName = 'cmDespausarTodas'
        end>
    end
    object cmPausarTodas: TdxBarButton
      Caption = 'Pausar Todas M'#225'quinas'
      Category = 0
      Hint = 'Pausar Todas M'#225'quinas'
      Visible = ivAlways
      OnClick = cmPausarTodasClick
    end
    object cmDespausarTodas: TdxBarButton
      Caption = 'Despausar Todas M'#225'quinas'
      Category = 0
      Hint = 'Despausar Todas M'#225'quinas'
      Visible = ivAlways
      OnClick = cmDespausarTodasClick
    end
    object cmSubMaq: TdxBarSubItem
      Caption = '&L. M'#225'quina'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmPMDesligar'
        end
        item
          Visible = True
          ItemName = 'cmPMReiniciar'
        end
        item
          Visible = True
          ItemName = 'cmPMFecharGuard'
        end
        item
          Visible = True
          ItemName = 'cmLogoffWin'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmLigarMaq'
        end
        item
          Visible = True
          ItemName = 'cmLigarTodas'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmProgUso'
        end>
    end
    object cmEditarCliente: TdxBarButton
      Caption = '&N. Editar Cliente'
      Category = 0
      Hint = 'N. Editar Cliente'
      Visible = ivAlways
      OnClick = cmEditarClienteClick
    end
    object cmCreditos: TdxBarButton
      Caption = '&P. Exibir cr'#233'ditos de tempo'
      Category = 0
      Hint = 'P. Exibir cr'#233'ditos de tempo'
      Visible = ivAlways
      OnClick = cmCreditosClick
    end
    object cmLogoffWin: TdxBarButton
      Tag = 3
      Caption = '4. Efetuar Logoff no Windows'
      Category = 0
      Hint = '4. Efetuar Logoff no Windows'
      Visible = ivAlways
      OnClick = cmLogoffWinClick
    end
    object cmLigarMaq: TdxBarButton
      Caption = '5. Ligar m'#225'q. 5'
      Category = 0
      Hint = '5. Ligar m'#225'q. 5'
      Visible = ivAlways
      ImageIndex = 35
      OnClick = cmLigarClick
    end
    object cmLigarTodas: TdxBarButton
      Caption = '&6. Ligar todas'
      Category = 0
      Hint = '6. Ligar todas'
      Visible = ivAlways
      ImageIndex = 35
      OnClick = cmLigarTodasClick
    end
    object cmLigar: TdxBarButton
      Caption = 'Ligar '
      Category = 0
      Hint = 'Ligar computador remotamente'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 58
      PaintStyle = psCaptionGlyph
      OnClick = cmLigarClick
    end
    object cmDesligar: TdxBarButton
      Caption = 'Desligar'
      Category = 0
      Hint = 'Desligar computador remotamente'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 57
      PaintStyle = psCaptionGlyph
      OnClick = cmPMDesligarClick
    end
    object cmCapturar: TdxBarButton
      Caption = 'Capturar'
      Category = 0
      Hint = 'Capturar imagem da tela do computador'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 54
      PaintStyle = psCaptionGlyph
      OnClick = cmCapturarClick
    end
    object cmAcessoRemoto: TdxBarButton
      Caption = 'Controle Remoto'
      Category = 0
      Hint = 
        'Controlar computador remotamente (ver a tela, usar o mouse, tecl' +
        'ado)'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 55
      PaintStyle = psCaptionGlyph
      OnClick = cmAcessoRemotoClick
    end
    object cmComando: TdxBarButton
      Caption = 'Comando'
      Category = 0
      Hint = 'Comando'
      Style = cxStyle1
      Visible = ivAlways
      ImageIndex = 40
      PaintStyle = psCaptionGlyph
    end
    object cmReiniciar: TdxBarButton
      Caption = 'Reiniciar'
      Category = 0
      Hint = 'Reiniciar computador remotamente'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 61
      PaintStyle = psCaptionGlyph
      OnClick = cmReiniciarClick
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Desbloquear'
      Category = 0
      Hint = 'Desbloquear'
      Style = cxStyle1
      Visible = ivAlways
      ImageIndex = 42
      PaintStyle = psCaptionGlyph
    end
    object cmProcessos: TdxBarButton
      Caption = 'Processos'
      Category = 0
      Hint = 'Exibe lista de processos da m'#225'quina cliente (programs em uso)'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 59
      PaintStyle = psCaptionGlyph
      OnClick = cmProgUsoClick
    end
    object dxBarButton5: TdxBarButton
      Align = iaRight
      Caption = 'Propriedades da M'#225'quina'
      Category = 0
      Hint = 'Propriedades da M'#225'quinas'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      DropDownEnabled = False
      ImageIndex = 69
      PaintStyle = psCaptionGlyph
    end
    object cmDesbloquear: TdxBarButton
      Tag = 3
      Caption = 'Desbloquear'
      Category = 0
      Hint = 'Desbloquear o computador'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 56
      PaintStyle = psCaptionGlyph
      OnClick = cmDesbloquearClick
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 32
      PropertiesClassName = 'TcxImageProperties'
      Properties.GraphicClassName = 'TdxPNGImage'
      InternalEditValue = {
        6701000089504E470D0A1A0A0000000D49484452000000200000001008060000
        0077007D590000012E4944415478DACD95E11182300C85C3024E000BE802E002
        4E50175007A80EA02E0003782E4027D005CA02BA004CE002EA8B17AE9E8AFD01
        627E2515FABEE4B518D086E644B4A37E6211DC01AE3D897334028483909230E1
        BCBC94545405E76AA8488D149993217336DD00E858533A499FD6A666CA82B9CA
        190239D65A0788C398ECCC72D799CDA8BA54BC8609405426632BCBBFB50E80EE
        D02504C6FBF1CB4B808906510D80E711807373D9CBADBD00D061A94BCE21B23C
        2C6BFF11628158725D3FB6C0C4002682028A486D4AABE3CA0FC09D8284EBF727
        00D4001678D480829D2CB60DFC0164121092C388496445F6114004BED55E16B8
        874B6E844CA173006CAE13CD378001EE394EBDF8F81300D77F04BC852026D339
        80D8F0EE2B8868BA86D24053ED05F0ABF80B805EFF8E6FF35B02DA49BF5F8000
        00000049454E44AE426082}
    end
    object dxBarSubItem2: TdxBarSubItem
      Align = iaRight
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ImageIndex = 71
      ShowCaption = False
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'cmApagar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton5'
        end>
    end
    object cmSubPag: TdxBarSubItem
      Caption = 'Sess'#245'es'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmConfig'
        end>
    end
    object cmConfig: TdxBarButton
      Caption = 'Ver Configura'#231#227'o'
      Category = 0
      Hint = 'Ver Configura'#231#227'o'
      Visible = ivAlways
      OnClick = cmConfigClick
    end
    object cmNumM: TdxBarStatic
      Caption = 'M'#225'quina 10'
      Category = 0
      Hint = 'M'#225'quina 10'
      Style = cxStyle9
      Visible = ivAlways
      Alignment = taLeftJustify
    end
    object cmFidelidade: TdxBarLargeButton
      Caption = 'Fidelidade'
      Category = 0
      Hint = 'Fidelidade'
      Visible = ivAlways
      LargeImageIndex = 73
      OnClick = cmFidelidadeClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmResgTempo: TdxBarButton
      Caption = 'Resgatar cr'#233'dito de tempo pr'#234'mio'
      Category = 0
      Hint = 'Resgatar cr'#233'dito de tempo pr'#234'mio'
      Visible = ivAlways
      OnClick = cmResgTempoClick
    end
    object cmResgProduto: TdxBarButton
      Caption = 'Resgatar produto pr'#234'mio'
      Category = 0
      Hint = 'Resgatar produto pr'#234'mio'
      Visible = ivAlways
      OnClick = cmResgProdutoClick
    end
    object cmSubFidelidade: TdxBarSubItem
      Caption = '&T. Fidelidade'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmResgTempo'
        end
        item
          Visible = True
          ItemName = 'cmResgProduto'
        end>
    end
    object cmPropMaq: TdxBarButton
      Caption = '&U. Propriedades da M'#225'quina'
      Category = 0
      Hint = 'U. Propriedades da M'#225'quina'
      Visible = ivAlways
      OnClick = cmPropMaqClick
    end
    object cmDesativarFW: TdxBarButton
      Caption = '&S. Desativar bloqueio de sites'
      Category = 0
      Hint = 'S. Desativar bloqueio de sites'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      GroupIndex = 789
      OnClick = cmDesativarFWClick
    end
    object cmSubMonitor: TdxBarSubItem
      Caption = 'M. Monitor'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMonitorOn'
        end
        item
          Visible = True
          ItemName = 'cmMonitorOff'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmMonitorConfig'
        end>
    end
    object cmMonitorOn: TdxBarButton
      Caption = 'Ligar'
      Category = 0
      Hint = 'Ligar'
      Visible = ivAlways
      OnClick = cmMonitorOnClick
    end
    object cmMonitorOff: TdxBarButton
      Caption = 'Desligar'
      Category = 0
      Hint = 'Desligar'
      Visible = ivAlways
      OnClick = cmMonitorOffClick
    end
    object cmMonitorConfig: TdxBarButton
      Caption = 'Configurar desligamento autom'#225'tico'
      Category = 0
      Hint = 'Configurar desligamento autom'#225'tico'
      Visible = ivAlways
      OnClick = cmMonitorConfigClick
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = '&O. Permiss'#227'o de Downloads'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmDownload'
        end
        item
          Visible = True
          ItemName = 'cmDownloadExe'
        end>
    end
    object cmDownloadExe: TdxBarButton
      Caption = '&2. Permitir download de Programas'
      Category = 0
      Hint = '2. Permitir download de Programas'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = cmDownloadExeClick
    end
    object cmVendaPLUS: TdxBarLargeButton
      Caption = 'Plus+'
      Category = 0
      Hint = 
        'Vender um produto PLUS+ para um cliente que n'#227'o est'#225' usando um c' +
        'omputador'
      Visible = ivAlways
      DropDownEnabled = False
      LargeGlyph.Data = {
        36300000424D3630000000000000360000002800000060000000200000000100
        2000000000000030000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000001010101010101030101010501010106010101070101
        0107010101070101010701010107010101070101010701010107010101070101
        0107010101070101010701010107010101070101010701010107010101070101
        0107010101060101010401010102000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000001010103020101080101010E0000001300000016000000170000
        0018000000180000001800000018000000180000001800000018000000180000
        0018000000180000001800000018000000180000001800000018000000170000
        001700000015000000100101010B010101050101010100000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000020201040403031930221880715039CA9E7150F6A57654FFA57654FFA576
        54FFA57654FFA57654FFA57654FFA57654FFA57654FFA57654FFA57654FFA576
        54FFA57654FFA57654FFA57654FFA57654FFA57654FFA57654FFA57654FF9D71
        50F6705039CC3022198603020226000000100101010701010102000000000000
        0000000000380000007100000000000000000000000000000000000000380000
        0071000000000000001C000000AA0000008D00000055000000710000001C0000
        008D000000AA0000008D00000000000000000000000000000000000000710000
        0038000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000202
        01031A140F4E936A4CE9C6A68CFFE6D4C0FFF8ECDBFFFCF0DDFFFCF0DBFFFCEF
        DAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEF
        DAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFCF0DBFFFCF0DDFFF8EC
        DAFFE6D3C0FFC5A48AFF8E6649E9140E0A590000001201010106000000000000
        000000000055000000AA00000000000000000000000000000000000000550000
        00AA00000000000000E20000007100000055000000E2000000AA000000550000
        008D00000055000000AA0000008D000000000000000000000000000000AA0000
        0055000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000010101012A20
        194BA77D5CFAE7D5C2FFFCF0DEFFFCEDD4FFFDEBCEFFFDE9CAFFFDE9C9FFFDE8
        C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8
        C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE9C9FFFDE9CAFFFDEB
        CEFFFCEDD5FFFCF0DEFFE6D3C0FFA77C5BFA130E0A560101010E000000000000
        000000000055000000AA00000000000000000000000000000000000000550000
        00AA00000000000000FF000000000000000000000055000000AA000000000000
        001C00000055000000AA0000008D000000000000000000000000000000AA0000
        0055000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000D0A0812946B
        4DE8E7D5C2FFFCEFDCFFFDEBCFFFFDE8C5FFFEE6BFFFFEE4BCFFFEE4BBFFFEE4
        BBFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4
        BAFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BBFFFEE4BBFFFEE4BCFFFEE6
        C0FFFDE8C6FFFDEBCFFFFCF0DCFFE5D3C0FF8B6448E703020221000000000000
        000000000055000000E2000000AA000000AA0000003800000000000000550000
        00AA00000000000000FF000000000000000000000055000000AA0000001C0000
        00FF000000AA000000710000000000000055000000FF000000FF000000FF0000
        00FF000000FF000000FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000503C2E77C6A6
        8CFFFCF1E0FFFDECD1FFFDE7C4FFFEE4BCFFFEE2B6FFFEE2B4FFFEE1B3FFFEE1
        B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1
        B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1B3FFFEE1B3FFFEE1B3FFFEE2B4FFFEE3
        B7FFFEE4BCFFFDE8C5FFFDECD1FFFCF1E0FFC4A389FF2C1F167D000000000000
        000000000055000000C60000005500000071000000E200000038000000550000
        00AA00000000000000FF000000000000000000000055000000AA000000550000
        00C600000000000000000000001C000000000000000000000000000000AA0000
        0055000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000007E5C44C1E6D4
        C2FFFCEFD9FFFDE9CAFFFEE5BEFFFEE3B6FFFFE1B3FFFFE0B1FFFFE0B1FFFFE0
        B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0
        B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B1FFFFE0B1FFFFE1
        B3FFFEE3B7FFFEE5BEFFFDE9CAFFFCEFD9FFE4D1BEFF674A35C1000000000000
        000000000055000000AA000000000000000000000055000000AA000000550000
        00AA00000000000000FF000000000000000000000055000000AA000000000000
        00AA000000FF000000E200000038000000000000000000000000000000AA0000
        0055000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000996D4EEEF6EB
        DCFFFDEED6FFFDE9C7FFFEE5BDFFFFE2B6FFFFE1B3FFFFE1B2FFFFE1B2FFFFE1
        B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1
        B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1
        B3FFFFE2B6FFFEE5BDFFFDE9C8FFFDEED7FFF3E7D8FF946A4BE9000000000000
        000000000055000000AA0000000000000000000000AA0000008D000000550000
        00AA000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000710000
        0038000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000009C7050F1F7ED
        DFFFFDEED8FFFEEACAFFFEE6C0FFFFE4B9FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2
        B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2
        B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2
        B6FFFFE4B9FFFEE6C0FFFDEACAFFFDEED8FFF4E9DBFF976B4DEC000000000000
        000000000055000000FF000000FF000000FF0000008D00000000000000550000
        00AA000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000835F44CAE9D9
        C9FFFCF0DDFFFDECCFFFFEE8C5FFFEE6BFFFFFE5BBFFFFE4BAFFFFE4B9FFFFE4
        B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4
        B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4BAFFFFE5
        BBFFFEE6BFFFFEE8C5FFFDECD0FFFCF0DDFFE7D7C6FF71513AC8000000000000
        00000000000000000000000000000000000000000000000000000000001C0000
        0038000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000059443482CCAF
        98FFFCF3E4FFFDEFD8FFFDEBCEFFFEE9C7FFFEE7C2FFFFE6C0FFFFE6BEFFFFE5
        BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5
        BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BEFFFFE6BFFFFFE7
        C2FFFEE9C6FFFEEBCEFFFDEFD8FFFCF3E5FFCAAC95FF4D3A2C83000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000140F0C1BA176
        55F4EEE1D3FFFCF2E2FFFDEFD8FFFEECD0FFFEEACAFFFEE9C6FFFFE8C4FFFFE7
        C2FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7
        C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C2FFFFE8C3FFFFE8C5FFFEEA
        C9FFFEECCFFFFDEFD8FFFCF2E2FFEDDFD1FF9E7354F2120F0C19000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000004132
        275CB18769FFF0E4D6FFFCF3E3FFFDF0DAFFFDEDD3FFFEEBCDFFFEEAC9FFFFE9
        C7FFFFE8C5FFFFE8C4FFFFE8C4FFFFE8C4FFFFE8C4FFFFE8C4FFFFE8C4FFFFE8
        C4FFFFE8C4FFFFE8C4FFFEE8C4FFFFE8C5FFFFE9C6FFFFE9C8FFFEEBCCFFFEEC
        D1FFFDEFD9FFFCF2E2FFEFE2D4FFAF8567FE3D30265800000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000047372B66A57B5BF8D3B9A4FFF4E7D6FFFDF1DDFFFEEED6FFFEECD0FFFFEB
        CCFFFFEACAFFFFEAC8FFFFEAC8FFFFEAC8FFFFEAC8FFFFEAC8FFFFEAC8FFFFEA
        C8FFFFEAC8FFFFEAC8FFFFEAC8FFFFEAC9FFFFEBCBFFFEECCEFFFEEDD3FFFDF0
        DAFFF3E5D3FFD2B8A2FFA47959F7423428610000000000000000000000000000
        0000000000002F2F2F554E4E4E8D0000000000000000000000001010101C4E4E
        4E8D5E5E5EAA4E4E4E8D1F1F1F381F1F1F383F3F3F7100000000000000003F3F
        3F711F1F1F38000000003F3F3F715E5E5EAA3F3F3F713F3F3F711F1F1F381010
        101C4E4E4E8D5E5E5EAA1F1F1F385E5E5EAA0000000000000000000000000000
        00005E5E5EAA1010101C0000000000000000000000004E4E4E8D1F1F1F380000
        00003F3F3F713F3F3F710000000000000000000000004E4E4E8D5E5E5EAA1F1F
        1F385E5E5EAA000000003F3F3F711F1F1F381F1F1F385E5E5EAA5E5E5EAA2F2F
        2F55000000001F1F1F385E5E5EAA4E4E4E8D2F2F2F553F3F3F71000000000000
        0000000000001C161226694F3B9A976C4DEAC3A186FFFDF1DEFFFEEFD7FFFEED
        D2FFFFECCEFFFFEBCDFFFFEBCCFFFFEBCCFFFFEBCCFFFFEBCCFFFFEBCCFFFFEB
        CDFFFFEBCDFFFFECCEFFFFECCEFFFFECCFFFFEEDD2FFFEEED6FFFDF0DCFFF0E1
        CFFF9F7352F85942319C1A151126000000000000000000000000000000000000
        0000000000006E6E6EC67D7D7DE21010101C00000000000000007D7D7DE24E4E
        4E8D2F2F2F553F3F3F714E4E4E8D2F2F2F555E5E5EAA00000000000000005E5E
        5EAA2F2F2F551F1F1F387D7D7DE22F2F2F553F3F3F717D7D7DE22F2F2F554E4E
        4E8D5E5E5EAA2F2F2F554E4E4E8D8D8D8DFF0000000000000000000000000000
        00005E5E5EAA3F3F3F7100000000000000001010101C8D8D8DFF000000000000
        00007D7D7DE27D7D7DE200000000000000004E4E4E8D5E5E5EAA2F2F2F555E5E
        5EAA8D8D8DFF000000005E5E5EAA2F2F2F554E4E4E8D3F3F3F712F2F2F557D7D
        7DE21F1F1F387D7D7DE23F3F3F712F2F2F556E6E6EC65E5E5EAA000000000000
        0000000000000000000000000000271E1836B79174FFFCF4E6FFFDF1DEFFFEEF
        D8FFFEEED4FFFFEDD1FFFFEDD0FFFFEDD0FFFFEDD0FFFFEDD1FFFFEDD1FFFFEE
        D2FFFFEED3FFFEEED4FFFEEFD6FFFEEFD7FFFEF0DAFFFDF2DFFFFDF3E5FFEFE2
        D5FF8A6347DB0302020600000000000000000000000000000000000000000000
        00001010101C7D7D7DE24E4E4E8D3F3F3F71000000002F2F2F556E6E6EC60000
        00000000000000000000000000002F2F2F555E5E5EAA00000000000000005E5E
        5EAA2F2F2F555E5E5EAA2F2F2F5500000000000000005E5E5EAA2F2F2F554E4E
        4E8D5E5E5EAA1010101C000000008D8D8DFF0000000000000000000000000000
        00002F2F2F557D7D7DE25E5E5EAA5E5E5EAA6E6E6EC65E5E5EAA000000002F2F
        2F555E5E5EAA5E5E5EAA1F1F1F38000000005E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F55000000001F1F1F382F2F2F557D7D
        7DE21F1F1F387D7D7DE23F3F3F71000000002F2F2F555E5E5EAA000000000000
        000000000000000000000000000007050409A27656F7F8F1E6FFFDF4E5FFFEF1
        DEFFFEF0D9FFFFEFD6FFFFEED4FFFFEED4FFFFEED4FFFFEFD5FFFFEFD6FFFEEF
        D8FFFEF0DAFFFEF1DCFFFEF1DEFFFDF2E0FFFDF3E3FFFCF5E8FFFCF6EDFFD4BD
        AAFF563F2E9D0202020300000000000000000000000000000000000000000000
        00003F3F3F714E4E4E8D1F1F1F386E6E6EC6000000002F2F2F558D8D8DFF8D8D
        8DFF8D8D8DFF8D8D8DFF5E5E5EAA2F2F2F555E5E5EAA00000000000000005E5E
        5EAA2F2F2F555E5E5EAA2F2F2F5500000000000000005E5E5EAA2F2F2F551010
        101C4E4E4E8D7D7D7DE28D8D8DFF8D8D8DFF0000000000000000000000000000
        0000000000008D8D8DFF3F3F3F712F2F2F557D7D7DE22F2F2F55000000005E5E
        5EAA2F2F2F552F2F2F555E5E5EAA000000005E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F553F3F3F717D7D7DE25E5E5EAA1F1F
        1F38000000001F1F1F385E5E5EAA8D8D8DFF8D8D8DFF5E5E5EAA000000000000
        000000000000000000000000000000000000755740B0D9C5B3FFFCF6EBFFFDF4
        E5FFFEF2E0FFFEF1DCFFFEF0DAFFFFF0DAFFFEF0DAFFFEF1DBFFFEF1DDFFFEF2
        DFFFFDF3E2FFF9EEDEFFF7ECDEFFFCF5EAFFFCF6EDFFFCF7F0FFE9DCD0FFA478
        59F71F19152C0000000000000000000000000000000000000000000000000000
        00006E6E6EC61F1F1F38000000007D7D7DE21010101C1010101C7D7D7DE21010
        101C000000003F3F3F714E4E4E8D2F2F2F557D7D7DE21010101C000000006E6E
        6EC62F2F2F553F3F3F716E6E6EC61010101C000000005E5E5EAA2F2F2F551010
        101C1010101C000000001010101C8D8D8DFF0000000000000000000000000000
        0000000000005E5E5EAA2F2F2F55000000008D8D8DFF000000001010101C8D8D
        8DFF00000000000000008D8D8DFF1010101C5E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F555E5E5EAA3F3F3F71000000001010
        101C000000001F1F1F3800000000000000003F3F3F715E5E5EAA000000000000
        000000000000000000000000000000000000251E1834AB8062FCF4ECE3FFFCF6
        ECFFFDF4E7FFFDF3E3FFFEF3E1FFFEF2E0FFFEF3E0FFFEF3E2FFFDF4E4FFFDF5
        E7FFFCF6EAFFCBAE97FFAD8263FFCCB09AFFD4BCAAFFC4A48DFF9B7051EE372C
        244C000000000000000000000000000000000000000000000000000000001010
        101C7D7D7DE200000000000000004E4E4E8D3F3F3F71000000002F2F2F557D7D
        7DE28D8D8DFF6E6E6EC61010101C2F2F2F556E6E6EC66E6E6EC68D8D8DFF5E5E
        5EAA00000000000000004E4E4E8D8D8D8DFF8D8D8DFF7D7D7DE22F2F2F551F1F
        1F388D8D8DFF8D8D8DFF8D8D8DFF2F2F2F550000000000000000000000000000
        0000000000002F2F2F555E5E5EAA2F2F2F555E5E5EAA000000003F3F3F714E4E
        4E8D00000000000000004E4E4E8D3F3F3F715E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F551010101C7D7D7DE28D8D8DFF6E6E
        6EC6000000004E4E4E8D8D8D8DFF8D8D8DFF7D7D7DE21010101C000000000000
        0000000000000000000000000000000000000000000058433480B89277FFF6F0
        E8FFFCF7EEFFFDF6EAFFFDF5E8FFFDF5E7FFFDF5E8FFFDF5E9FFFCF6ECFFFCF7
        EFFFD6C0AEFF8F684BDC2A221C3A513F31755E46358B46362B630E0B09120000
        0000000000000000000000000000000000000000000000000000000000003F3F
        3F714E4E4E8D00000000000000001F1F1F386E6E6EC600000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000005E5E5EAA2F2F2F550000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000008D8D8DFF5E5E5EAA2F2F2F5500000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005E5E5EAA2F2F2F550000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000005F493989B188
        6AFFE1D0C2FFFCF8F1FFFCF7F0FFFCF7EFFFFCF7EFFFFCF8F1FFF2EAE0FFC4A5
        8DFF8A6449D41A15112300000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000006E6E
        6EC61F1F1F380000000000000000000000007D7D7DE21010101C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000005E5E5EAA2F2F2F550000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005E5E5EAA8D8D8DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005E5E5EAA2F2F2F550000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000003228
        2045856046CCAF8566FFC6A891FFD0B6A3FFCCB19CFFBA967BFF9C7051F05A45
        3682070605090000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001F1F1F381010101C0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000001F1F1F381010101C0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000001A15112446372C635A473A7E5241347330261F42050403060000
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
      LargeImageIndex = 119
      OnClick = cmVendaPLUSClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
    object cmAddVendaPlus: TdxBarButton
      Caption = 'D. Vender produto PLUS+'
      Category = 0
      Hint = 'D. Vender produto PLUS+'
      Visible = ivAlways
      DropDownEnabled = False
      OnClick = cmAddVendaPlusClick
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Venda PLUS+ para cliente avulso'
      Category = 0
      Hint = 'Venda PLUS+ para cliente avulso'
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object cmVenderCredAvulso: TdxBarLargeButton
      Caption = 'Tempo'
      Category = 0
      Hint = 'Vender TEMPO para um cliente que n'#227'o est'#225' usando um computador'
      Visible = ivAlways
      LargeGlyph.Data = {
        36300000424D3630000000000000360000002800000060000000200000000100
        2000000000000030000000000000000000000000000000000000000000000000
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
        0000000000000F0F0F20282828653D3D3D994A4A4AB94F4F4FC84D4D4DC74949
        49B63B3B3B942525255E0C0C0C19000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202022828
        28535C5959C4696565FD636161FF696A6AFF737373FF777777FF767676FF7171
        71FF686868FF616161FF646464FB525252B92323234600000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001B18182F5B5454C76D65
        65FF777272FF8E8C8CFF9F9FA0FFA0A2A4FF9B9DA0FF979B9FFF95989CFF9699
        9DFF95979AFF919293FF7F8080FF6A6A6AFF646464FE515151B8101010220000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003B363666756C6CF77A7070FF9A99
        9AFFA7AAACFF9DA3A7FFA4A4A2FFBFAF9EFFD2B79CFFDBBB9DFFD9BA9CFFD1B4
        99FFB9A898FF989797FF8D9196FF929497FF848585FF666666FF616161F02626
        2651000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000004D44447E7E6F6FFE8C8484FFACAFB0FFA3A9
        AEFFBBAFA4FFEFC89FFFFFDAA5FFFFDEAAFFFFDFACFFFFDCABFFFFDDABFFFFDD
        AAFFFFDCA7FFFFD9A2FFEBC39BFFAAA096FF8B9096FF909193FF6F7070FF6464
        64FC313131640000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000003800000071000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000433A3A6A827272FE968F8FFFB1B4B7FFACAEAFFFE9C5
        9FFFFFDDA9FFFFDFB1FFFFDEB3FFFFE0BAFFFFE3BEFFFFE4C0FFFFE3C1FFFFE2
        BEFFFFE0B8FFFFDBB0FFFFDBA9FFFFDAA5FFE1BD99FF8F9194FF929396FF7374
        74FF646464FB2626264F00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000055000000AA000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000231E1E36867373F9968B8CFFB5B8BBFFB6B4B2FFFFD1A1FFFFE2
        B2FFFFE1B4FFFFE1B9FFFFE2BAFFFFE0B7FFFFE0B8FFFFE1BAFFFFE4C0FFFFE7
        C8FFFFE9CBFFFFE7C9FFFFE3C1FFFFDBB0FFFFDCA8FFFDCD9DFF989595FF9193
        96FF6F7070FF616161F010101022000000000000000000000000000000000000
        00000000000000000038000000710000000000000000000000000000001C0000
        008D000000AA0000008D00000038000000380000007100000000000000000000
        00AA0000000000000000000000710000003800000055000000C6000000AA0000
        00AA00000038000000000000000000000038000000AA0000008D0000001C0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000003030305796565D18F7D7DFFBABCBDFFB8B8B8FFFFD1A1FFFFE3B6FFFFE1
        B5FFFFE0B5FFFFE0B5FFFFE0B5FFFFE0B5FFFFE0B4FFFFDFB4FFFFDFB2FFFFDE
        B0FFFFE0B6FFFFE7C6FFFFEACEFFFFE7C9FFFFDEB7FFFFDAA9FFFECF9DFF9294
        95FF919394FF666666FF535353B9000000000000000000000000000000000000
        00000000000000000055000000AA000000000000000000000000000000E20000
        008D00000055000000710000008D00000055000000AA00000000000000000000
        00FF0000000000000000000000AA0000005500000055000000E2000000550000
        0071000000E20000003800000038000000E20000005500000071000000E20000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000413636638D7474FFB3B1B1FFB7BBC2FFF4CBA2FFFFE4B8FFFFE1B8FFFFE2
        B7FFFFE2B8FFFFE2B8FFFFE2B8FFFFE2B7FFFFE2B7FFFFE1B6FFFFE1B5FFFFE0
        B4FFFFDFB3FFFFDEB0FFFFE1BAFFFFE9CEFFFFE8CBFFFFE0B8FFFFDAA9FFEBC3
        9AFF8B9197FF838485FF646464FE232323460000000000000000000000000000
        00000000000000000055000000AA000000000000000000000055000000C60000
        000000000000000000000000000000000055000000AA00000000000000000000
        00FF0000000000000000000000AA0000005500000055000000AA000000000000
        000000000071000000AA000000AA000000710000000000000000000000AA0000
        0055000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001887272D59C8C8CFFC1C6C9FFD7C3B1FFFFE2B1FFFFE5B9FFFFE3B9FFFFE4
        BAFFFFE4BAFFFFE4BAFFFFE4BAFFFFE4BAFFFFE4BAFFFFE3B9FFFFE2B8FFFFE2
        B7FFFFE1B6FFFFE0B4FFFFDFB3FFFFE0B5FFFFEBCFFFFFE8CBFFFFDDB3FFFFDC
        A7FFB8A797FF939699FF696969FF525252B90000000000000000000000000000
        00000000000000000055000000AA000000000000000000000055000000FF0000
        00FF000000FF000000FF000000AA00000055000000AA00000000000000000000
        00FF0000000000000000000000AA0000005500000055000000AA000000000000
        000000000055000000AA000000AA000000550000000000000000000000AA0000
        0055000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000231D
        1D34967A7AFEB6B1B2FFC0C6CBFFFED2A4FFFFE7BDFFFFE5BBFFFFE5BCFFFFE6
        BDFFFFE6BDFFFFE6BDFFFFE6BDFFFFE6BDFFFFE7BCFFFFE7BEFFFFE7BCFFFFE4
        BAFFFFE2B8FFFFE1B6FFFFE0B5FFFFDFB2FFFFE1B7FFFFEACEFFFFE6C7FFFFDB
        ACFFF9CD9EFF8E9399FF808181FF646464FB0C0C0C1900000000000000000000
        00000000000000000055000000AA00000000000000000000001C000000E20000
        001C00000000000000710000008D00000055000000E20000001C0000001C0000
        00FF0000003800000000000000C60000005500000055000000C60000001C0000
        0000000000AA0000007100000071000000AA000000000000001C000000E20000
        001C000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000004B3E
        3E7C967979FFCACED0FFD3C9BDFFFFE1B0FFFFE7BCFFFFE7BEFFFFE7BFFFFFE8
        BFFFFFE8C0FFFFE9C0FFFFE9C0FFFFE9C1FFFFEFC5FFF9E2B8FFF1D9B4FFFFE7
        BEFFFFE7BCFFFFE3B9FFFFE2B7FFFFE0B5FFFFDFB1FFFFE6C5FFFFE9CCFFFFE0
        B8FFFFDBA5FFA9A198FF939496FF616161FF2626266000000000000000000000
        00000000000000000055000000AA000000000000000000000000000000550000
        00E2000000FF000000C60000001C00000055000000C6000000C6000000FF0000
        00710000008D000000FF000000C60000000000000055000000C6000000C60000
        00FF000000C600000000000000000000008D000000FF000000E2000000550000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000006F5A
        5AB3A48E8EFFCDD4D7FFE9CBAFFFFFE9BEFFFFEBC5FFFFE9C0FFFFEAC1FFFFEA
        C2FFFFEBC3FFFFEBC3FFFFEBC3FFFFF3CBFFDCCBA8FF7B7563FF847968FFCCBB
        99FFFFE8BEFFFFE7BCFFFFE3B9FFFFE2B7FFFFE0B5FFFFE0B5FFFFEBCFFFFFE4
        C3FFFFDEABFFCFB499FF979A9DFF686868FF3C3C3C9700000000000000000000
        00000000000000000055000000AA000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000866B
        6BD8B19F9FFFCFD5DAFFF4D2ABFFFFEBC2FFFFF5E2FFFFF1D5FFFFECC4FFFFEC
        C5FFFFEDC6FFFFEDC6FFFFF0C9FFFFF2CAFF1D1F21FF2E2F33FF26292CFF3030
        30FFE8D4AFFFFFEEC3FFFFE6BCFFFFE3B9FFFFE2B7FFFFE0B2FFFFE7C8FFFFE8
        C8FFFFDEAEFFE6C39CFF96999EFF727272FF494949BA00000000000000000000
        00FF000000FF000000FF000000FF000000FF000000FF00000055000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000009174
        74E8B8A9A9FFD3D9DEFFFBD6AAFFFFEFCAFFFFF6E1FFFFF2D9FFFFF0D0FFFFEE
        C8FFFFEFC8FFFFEFC9FFFFF8D1FFB5AB92FF25252AFFF6F6F6FFD6D6D6FF181A
        1EFFA4967EFFE7D3AEFFFFECC1FFFFE4BCFFFFE3B8FFFFE1B6FFFFE4C1FFFFE8
        CAFFFFE0B1FFF3C9A0FF969B9FFF777777FF515151CD00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000009574
        74E9BCABABFFD7DDE3FFFCD6AAFFFFF1CDFFFFF6E2FFFFF4DBFFFFF3D6FFFFF1
        CFFFFFF1CBFFFFF4CFFFFFFFD8FF9A937EFF212325FFFBFBFBFFC9C9C9FF1C1D
        1FFF968D77FFD8C3A2FFDECAA6FFFFEBC1FFFFE5BBFFFFE2B7FFFFE3BCFFFFEA
        CBFFFFE1B3FFF5CCA1FF989DA2FF787878FF505050CE00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000008E6F
        6FDBBBA8A8FFDCE3E8FFF9D5ADFFFFF2CEFFFFF7E6FFFFF5DEFFFFF5DAFFFFF4
        D7FFFFF5D1FFFFFED8FFCAC2A6FF2A2B2BFF252627FF0F1115FF111216FF2526
        28FF212327FF9B8F7AFFD6C4A2FFDAC7A3FFFFE9C0FFFFE4B8FFFFE3BBFFFFEA
        CAFFFFE1B2FFEEC69EFF9CA0A5FF747474FF4A4A4ABD00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000007A60
        60B8B39898FFE2EAEEFFF5D5B5FFFFF2CAFFFFF9E9FFFFF7E1FFFFF7DDFFFFF7
        DBFFFFFFE0FFD9D1B2FF303030FF252629FF373636FFECE2C0FFFAEEC8FF5A57
        50FF212427FF202225FF8B816FFFD7C4A1FFD9C3A0FFFFE7BBFFFFE3BBFFFFE8
        C7FFFFE2B1FFDABC9DFFA0A3A8FF6A6969FF3E3E3E9B00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000005946
        4683A88383FFE7F0F2FFEEDCCBFFFFE9BCFFFFFAE8FFFFF8E5FFFFF9E2FFFFFF
        E8FFE5DFC5FF393938FF252629FF29282BFFFAF1CDFFFFFFD9FFFFFBD4FFFFFF
        DCFF67635AFF202126FF1F2126FF756D5FFFFFEEC2FFFFE6BAFFFFE4BDFFFFE6
        C1FFFFE1ADFFC1B1A1FFA0A3A6FF636161FF2929296800000000000000000000
        0000000000002F2F2F554E4E4E8D0000000000000000000000001010101C4E4E
        4E8D5E5E5EAA4E4E4E8D1F1F1F381F1F1F383F3F3F7100000000000000003F3F
        3F711F1F1F38000000003F3F3F715E5E5EAA3F3F3F713F3F3F711F1F1F381010
        101C4E4E4E8D5E5E5EAA1F1F1F385E5E5EAA0000000000000000000000000000
        00005E5E5EAA1010101C0000000000000000000000004E4E4E8D1F1F1F380000
        00003F3F3F713F3F3F710000000000000000000000004E4E4E8D5E5E5EAA1F1F
        1F385E5E5EAA000000003F3F3F711F1F1F381F1F1F385E5E5EAA5E5E5EAA2F2F
        2F55000000001F1F1F385E5E5EAA4E4E4E8D2F2F2F553F3F3F71000000002821
        213EA68080FED9D4D5FFEAEEF1FFFFDCA9FFFFF8DBFFFFFAEAFFFFFFEAFFEEEA
        D4FF464543FF252628FF1F2123FFE8E3C5FFFFFFDCFFFFF6D2FFFFF3CEFFFFF6
        CEFFFFFFDCFF7A7466FF16191FFF252629FFFFE7BEFFFFE7BBFFFFE6C1FFFFE5
        BAFFFFD7A4FFA5A8ACFF918F90FF686565FD100F0F2100000000000000000000
        0000000000006E6E6EC67D7D7DE21010101C00000000000000007D7D7DE24E4E
        4E8D2F2F2F553F3F3F714E4E4E8D2F2F2F555E5E5EAA00000000000000005E5E
        5EAA2F2F2F551F1F1F387D7D7DE22F2F2F553F3F3F717D7D7DE22F2F2F554E4E
        4E8D5E5E5EAA2F2F2F554E4E4E8D8D8D8DFF0000000000000000000000000000
        00005E5E5EAA3F3F3F7100000000000000001010101C8D8D8DFF000000000000
        00007D7D7DE27D7D7DE200000000000000004E4E4E8D5E5E5EAA2F2F2F555E5E
        5EAA8D8D8DFF000000005E5E5EAA2F2F2F554E4E4E8D3F3F3F712F2F2F557D7D
        7DE21F1F1F387D7D7DE23F3F3F712F2F2F556E6E6EC65E5E5EAA000000000202
        0202977979DFC0A7A7FFF2F8FDFFF9DBBDFFFFF2C8FFFFFEEEFFFFFFFDFF5D5D
        58FF242426FF1B1C1EFFD6D4BDFFFFFFE7FFFFF9D7FFFFF6D2FFFFF4CFFFFFF2
        CCFFFFF4CCFFFFFFD8FF8A8272FFF0DDB7FFFFEFC4FFFFE5BBFFFFE7C0FFFFE5
        B4FFD8BDA2FFA9ADB1FF777373FF5B5858C50000000000000000000000000000
        00001010101C7D7D7DE24E4E4E8D3F3F3F71000000002F2F2F556E6E6EC60000
        00000000000000000000000000002F2F2F555E5E5EAA00000000000000005E5E
        5EAA2F2F2F555E5E5EAA2F2F2F5500000000000000005E5E5EAA2F2F2F554E4E
        4E8D5E5E5EAA1010101C000000008D8D8DFF0000000000000000000000000000
        00002F2F2F557D7D7DE25E5E5EAA5E5E5EAA6E6E6EC65E5E5EAA000000002F2F
        2F555E5E5EAA5E5E5EAA1F1F1F38000000005E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F55000000001F1F1F382F2F2F557D7D
        7DE21F1F1F387D7D7DE23F3F3F71000000002F2F2F555E5E5EAA000000000000
        000057444471A97F7FFFEAEAEBFFF5F7FAFFFFD9A8FFFFFFE0FF9B9B96FF1112
        15FF17181BFFC0BFAFFFFFFFF2FFFFFDE1FFFFF9DAFFFFF7D5FFFFF4D1FFFFF2
        CDFFFFF0CAFFFFF1CAFFFFF4CBFFFFEEC5FFFFE8BEFFFFE5BDFFFFE6BCFFFFD3
        A2FFACAEB2FF9D9C9DFF6C6565FF2A2828550000000000000000000000000000
        00003F3F3F714E4E4E8D1F1F1F386E6E6EC6000000002F2F2F558D8D8DFF8D8D
        8DFF8D8D8DFF8D8D8DFF5E5E5EAA2F2F2F555E5E5EAA00000000000000005E5E
        5EAA2F2F2F555E5E5EAA2F2F2F5500000000000000005E5E5EAA2F2F2F551010
        101C4E4E4E8D7D7D7DE28D8D8DFF8D8D8DFF0000000000000000000000000000
        0000000000008D8D8DFF3F3F3F712F2F2F557D7D7DE22F2F2F55000000005E5E
        5EAA2F2F2F552F2F2F555E5E5EAA000000005E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F553F3F3F717D7D7DE25E5E5EAA1F1F
        1F38000000001F1F1F385E5E5EAA8D8D8DFF8D8D8DFF5E5E5EAA000000000000
        0000080707099D7878DDB99A9AFFFBFFFFFFFAEFE5FFFFE3B2FFFFFFEEFF6566
        63FF9D9D94FFFFFFFAFFFFFFE7FFFFFBE1FFFFF9DDFFFFF7D9FFFFF5D5FFFFF3
        D1FFFFF0CAFFFFEDC7FFFFEBC4FFFFE9C1FFFFE7BEFFFFE8BEFFFFDCAAFFBFB6
        ACFFB0B4B6FF7A7171FF5C5656C9020202020000000000000000000000000000
        00006E6E6EC61F1F1F38000000007D7D7DE21010101C1010101C7D7D7DE21010
        101C000000003F3F3F714E4E4E8D2F2F2F557D7D7DE21010101C000000006E6E
        6EC62F2F2F553F3F3F716E6E6EC61010101C000000005E5E5EAA2F2F2F551010
        101C1010101C000000001010101C8D8D8DFF0000000000000000000000000000
        0000000000005E5E5EAA2F2F2F55000000008D8D8DFF000000001010101C8D8D
        8DFF00000000000000008D8D8DFF1010101C5E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F555E5E5EAA3F3F3F71000000001010
        101C000000001F1F1F3800000000000000003F3F3F715E5E5EAA000000000000
        0000000000003C2F2F47B08686FDD2BFBFFFFFFFFFFFFFECDCFFFFE6B4FFFFFF
        E8FFFFFFF7FFFFFFEEFFFFFDE8FFFFFBE4FFFFF9E0FFFFF8DDFFFFF6D9FFFFF4
        D6FFFFF2D3FFFFEEC8FFFFEBC3FFFFEAC2FFFFEBC1FFFFDDABFFCBBCAEFFB4B9
        BDFF8F8686FF766C6CF81B18182F000000000000000000000000000000001010
        101C7D7D7DE200000000000000004E4E4E8D3F3F3F71000000002F2F2F557D7D
        7DE28D8D8DFF6E6E6EC61010101C2F2F2F556E6E6EC66E6E6EC68D8D8DFF5E5E
        5EAA00000000000000004E4E4E8D8D8D8DFF8D8D8DFF7D7D7DE22F2F2F551F1F
        1F388D8D8DFF8D8D8DFF8D8D8DFF2F2F2F550000000000000000000000000000
        0000000000002F2F2F555E5E5EAA2F2F2F555E5E5EAA000000003F3F3F714E4E
        4E8D00000000000000004E4E4E8D3F3F3F715E5E5EAA2F2F2F55000000000000
        00008D8D8DFF000000005E5E5EAA2F2F2F551010101C7D7D7DE28D8D8DFF6E6E
        6EC6000000004E4E4E8D8D8D8DFF8D8D8DFF7D7D7DE21010101C000000000000
        00000000000000000000634B4B83A87D7DFEDBCDCDFFFFFFFFFFFEF1E7FFFFDA
        AAFFFFF8D1FFFFFCE1FFFFFCE9FFFFFBE9FFFFF9E6FFFFF9E2FFFFF6DFFFFFF6
        DCFFFFF5DCFFFFF1D1FFFFECC5FFFFEBBFFFFFD4A5FFCABFB5FFBABFC3FF9992
        92FF7E6E6EFE3B36366600000000000000000000000000000000000000003F3F
        3F714E4E4E8D00000000000000001F1F1F386E6E6EC600000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000005E5E5EAA2F2F2F550000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000008D8D8DFF5E5E5EAA2F2F2F5500000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005E5E5EAA2F2F2F550000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000010101016858589AA88383FED3C0C1FFFFFFFFFFFBFD
        FEFFFCDCBDFFFFDFAEFFFFF3C9FFFFF8D4FFFFF8D9FFFFF7D8FFFFF6D6FFFFF4
        D2FFFFF2CCFFFFEBBFFFFFDCA9FFE8C9ABFFC1C2C5FFBFC3C6FF988E8FFF8271
        71FE4D44447F0000000000000000000000000000000000000000000000006E6E
        6EC61F1F1F380000000000000000000000007D7D7DE21010101C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000005E5E5EAA2F2F2F550000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005E5E5EAA8D8D8DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005E5E5EAA2F2F2F550000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000100000163565682B08686FDBA9B9BFFEFEC
        EEFFF8FFFFFFF2F3F6FFF5DDC8FFF9D8B5FFFDDAAFFFFFDCACFFFFDCABFFFDD8
        ABFFF3D1AEFFE1CBB6FFCACCCEFFC6CDD1FFB8B7B8FF907E7EFF857272F9443C
        3C6C000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001F1F1F381010101C0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000001F1F1F381010101C0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003C2F2F479D7878DDA87F
        7FFFC1A7A7FFDFDBDBFFF0F6F9FFEBF2F6FFE4EBF0FFDEE5EAFFDAE0E6FFD6DD
        E2FFD3DADEFFD0D7DAFFBCB7B8FF9E8C8CFF8C7373FF786565D2231E1E360000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000080707095944
        44719F7979DFA77F7FFEA98383FFB69B9BFFBFABABFFC0B1B1FFBDAEAEFFB5A2
        A2FFA69090FF967979FF967A7AFE887272D54237376303030305000000000000
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
        0000020202022C21213D584646837B5F5FB88E6F6FDA947373E9917373E8866A
        6AD8705959B44C3E3E7C231D1D34000000010000000000000000000000000000
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
      LargeImageIndex = 120
      OnClick = cmVenderCredAvulsoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
    object cmTempoMaq: TdxBarLargeButton
      Caption = 'Tempo'
      Category = 0
      Enabled = False
      Hint = 'Adicionar tempo na m'#225'quina'
      Visible = ivNever
      LargeImageIndex = 123
      OnClick = cmVenderCredClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
    object cmPlusMaq: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Enabled = False
      Hint = 'Vender produto plus para m'#225'quina'
      Visible = ivNever
      LargeImageIndex = 121
      OnClick = cmAddVendaPlusClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
    object cmVendaMaq: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Enabled = False
      Hint = 'Vender produto para acesso em andamento'
      Visible = ivNever
      LargeImageIndex = 122
      OnClick = cmVendaAcessoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 8
    Top = 169
  end
  inherited CP: TdxComponentPrinter
    Left = 280
    Top = 170
  end
  inherited pmLay: TdxBarPopupMenu
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmLayCustomize'
      end
      item
        Visible = True
        ItemName = 'cmLaySalvar'
      end
      item
        Visible = True
        ItemName = 'cmLayRestaurar'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmNovo'
      end
      item
        Visible = True
        ItemName = 'cmApagar'
      end>
    Left = 128
    Top = 178
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 32
    Top = 180
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 240
    Top = 179
  end
  object ActionList1: TActionList
    Left = 320
    Top = 273
  end
  object pmMaq: TdxBarPopupMenu
    BarManager = BarMgr
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
        ItemName = 'cmNumM'
      end
      item
        Visible = True
        ItemName = 'cmAddTempo'
      end
      item
        Visible = True
        ItemName = 'cmAddProduto'
      end
      item
        Visible = True
        ItemName = 'cmAddImp'
      end
      item
        Visible = True
        ItemName = 'cmAddVendaPlus'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmPMIniciar'
      end
      item
        Visible = True
        ItemName = 'dxBarSubItem1'
      end
      item
        Visible = True
        ItemName = 'cmPMFinalizar'
      end
      item
        Visible = True
        ItemName = 'cmPMEditar'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmSubTransf'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmPMCapturar'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmSubMaq'
      end
      item
        Visible = True
        ItemName = 'cmSubMonitor'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmEditarCliente'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'dxBarSubItem3'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmCreditos'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmEnviarChat'
      end
      item
        Visible = True
        ItemName = 'cmBloqSite'
      end
      item
        Visible = True
        ItemName = 'cmDesativarFW'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmSubFidelidade'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmPropMaq'
      end>
    ItemOptions.Size = misNormal
    UseOwnFont = True
    OnPopup = pmMaqPopup
    Left = 488
    Top = 195
  end
  object pmTransf: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
        ItemName = 'cmMaquinasDest'
      end>
    UseOwnFont = False
    Left = 64
    Top = 179
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 152
    Top = 187
    PixelsPerInch = 96
    object cxsLivre: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clGreen
      TextColor = clWhite
    end
    object cxsPausa: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clGreen
    end
    object cxsUsoPos: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clRed
      TextColor = clWhite
    end
    object cxsAguardaPagto: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clWhite
    end
    object cxsManut: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11064319
      TextColor = clWhite
    end
    object cxsUsoPre: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxsPequeno: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = 7500402
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clGreen
      TextColor = clBackground
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = 2894892
    end
    object cxsAddMaq: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = 15000804
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clWhite
    end
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 192
    Top = 200
  end
  object Wav: TLMDWaveComp
    Wave.Data = {
      5C9C020052494646549C020057415645666D7420100000000100020022560000
      885801000400100064617461009C020000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000006000600100010001100100015001500190019001C001C001F001F00
      1A001A003400330064006400700072007C007E0098009A00AB00AF00A400AA00
      8D00930085008B007A007F00810084008B008B007A0076004C00450018000D00
      37002400A3009300F100EA00EE00ED00C100C6009A00A1007400790052005700
      47004A004400460037003A0003000700B6FFBAFF53FF54FFEFFEEDFE91FE8CFE
      15FE10FE41FD40FDCAFCB5FC35FE0AFEE9FFD5FF28011D013D02400281029302
      A302B402AB02BC02D102E002DE02EE02C602D2028D029A020B02120267016801
      A0009C00E2FFDDFF27FF23FF98FE94FE13FE16FEEDFCFEFC04FCEFFB27FEE3FD
      260008008C00760015010301CA00C5009C0093005A005800480049001E002800
      EDFFF3FFFBFF14003A005A008F00B800D100F9003F0166015D018E019001A301
      62016D017B009A00A3FEA6FEF1FFA5FFB4028102DD02C2020403DD0262024A02
      BB019C0122011401B300A90069006C00F5FF0000DCFFF1FFD5FFEEFF1E003600
      100026002E0036000100FFFFC8FFB1FF6DFF50FF98FE8DFE96FC9DFC03FDC6FC
      68003E006D017E012802380267028E025F0276029F02C002B202CA02EA020203
      A302B802900290022E021702BE018C01C7008D00DEFF8FFFCBFE85FEDEFDA9FD
      7FFD66FD5DFD58FD7BFC9CFCC8FBB3FB1AFFC6FE73014A01F201CE0163026102
      FE010A02030210029401A5013F0140017A006F00B3FF9CFF0BFFFBFE9CFE8DFE
      67FE78FE4AFE65FE79FEB0FE8AFED1FEF2FE36FF1CFF5DFFBFFE08FFEEFC36FD
      56FE4AFE1F0232029203B403AF04AE04C004A80495044C041204E50387036303
      24032A039C02BF0276029A0222024C0201021F0269018101F500E8002F001300
      93FF75FF16FF04FF9AFEA7FEC2FCFDFC95FB80FB8DFF34FF0602CB013B02DE01
      0102A60100019B006C001C00A3FF89FFCDFFDFFFEBFF39007D00E8002B019601
      E60136028002D202CD020F0317030E03830214027301C900B8FFF1FE25FD85FC
      10F9B9F8B9F95BF989FD7CFDEFFE29FF28005B008300A700DC00F600C4000701
      FC0044014A017401FB00F60086006700C1FFC8FF94FFD4FF5BFFDEFFE9FF8800
      890029017B01EF0136025A025B0259028C008800B8FE7AFE5102FA0145053905
      C605D305E305CD052205CF043D04D703EC029C023602000263014701B800C600
      4E00640026001700D9FFC0FF56FF42FF22FF40FFFEFE23FF47FF6EFF59FF98FF
      18FF5BFF83FCB9FC80FC2BFCB300FFFF13021F01AB01B700FE00B000EF00F100
      FD001801E3002B015D01AA0141015101C6007200CDFF31FFC0FE0DFE75FDFEFC
      E4FCC2FCD2FCF9FC09FD6AFDAFFD1CFE2BFE5AFE97FD8BFD70FA08FAFAFAEBF9
      91FEB9FD29FF28FF5FFFE9FF1300DE000201EF0197016902E6014F02E4013D02
      82010B028C016402050235034203C5049104F005DD05FF05A8057A042304F802
      9C02EE016E01CE0089FF59FFEFFBD6FBFDFC8AFCAF017B01FD021103FD021E03
      180376034703C9037903FC03C5030904C4036303B5022802DC01530124015100
      54009AFF73FFFDFEF0FEA2FE6AFE24FEF6FDA3FD51FD0FFDA0FC86FCA8FBF6FB
      E1F878F97EFABEFABE00AB00510344039103C103BA038104F703D30415047903
      C2022D0177001C00F6FE4BFFB3FED7FF7FFFA201C201D503B903BA05A605B306
      7006C5052E0592033E035D0234029F01DB01DE012800CA00F2FFC6FFD0041904
      1F0828076D077406720673059704DC03D50247021B0176001E0010FFC8FE62FD
      12FDEFFBF6FB47FBADFBB0FBEDFB72FC14FC32FDA3FC59FE40FD40FFB5FED600
      9B00C7016E027B0132017E0071FED3FEC20137004705F502AB03980227028601
      7200860072FF330087FF6E00A400A301F7019C0210023102F4017C01A901A100
      5901E1FF1A001EFE6FFE45FC43FC4BFA66FA2BF98EF951F9E1F91FFA6AFAF8FA
      9EF87FF95EF90DFA0BFFA2FF65012E02D9008A0177008C01FFFF8A01AE008002
      7C027C0326040803D6027500B70006FE57FEA1FDB3FD70FE7AFE27FFAFFE1D00
      86FFFB00D7FFA501F60096028002C903EE0375046402DA011000A4FEA0020900
      EA02370092FF01FDDDFC4CFB63FA25FA37F955FA13FA29FC59FC01FF63FEEF00
      0E009401DA00E901BB01EA020403F3049704A505C1051B04D503700220029202
      64028A03BB03FC051D044906A9034E0471079904D0083E04010575027302F200
      6C002AFF71FE47FD8DFDABFC81FD06FEDAFDFFFF9AFFD701B6002C024B01A402
      7C0282033A034D03BB03A6020903DA00450175FF29FF9CFE7BFE17FF31FD33FF
      F9FB74FD040009FE190292FE11FFCCFDE0FDD1FD55FDE5FD1FFD29FE4DFE72FF
      FFFF0202D1011C04E1035B05AE04560491036C033D03B702330398FF0002D4FD
      0AFF5BFD49FD7CFD02FD39FE74FDB6FF61FD82FF50FC4CFD2200B4FF2B03EE02
      E4022803D9024403E601390219010701BC006401EC01B70162026000AE019B00
      89001E000EFF340092FF6D03A2026F05BE05A807890768086308570811089907
      C207720612053403F900B8FD890191FEC702B901E70102037C025D0407035304
      6803D301800370FF030262FF0100B7FF2A009B00A1003AFFDEFE82FD6EFD92FE
      20FE1C00E8FF80025A01E0010802D3FE63FFACFCA2FCA7FA62F906F7FAF315F2
      D2F45BF4BDF8F9FAA2FA02FEE3FCA0FF31FE4EFF88FEBBFD30FE00FC9CFDE4FA
      2AFC38FB6EFB27FDC9FC55FDC8FC5CFC09FCDDFD70FD2CFF30FFEF0072004502
      7901E60349028505E003BF04B3036C00D9FEADFAFEFBCDFBF3FF03030703D505
      0B0598048D04ED04AD02EC04850340057A04FD05DC051706FF0544069206A703
      6A05B8FED900ACFC43FEDAFCBBFDE5FDFFFDB6FF36FF2D018F00410206026101
      E901A6FE21FD50F914F993F69FFBB7FBEEFDEEFFB0FE2401C5FFE9011000AE01
      8400BD01FF00F60276022106AE03170AAD06F0094B0AE103A4070802C602D203
      15037105CF04510727063007080768066606E803BF047000F5FFF3FA51F9EAF5
      63F8C4F7C6FBB9FCA8FCE4FE0DFE9EFF28FF67FF38FFB3FE5AFF99FE1A00A9FE
      62008EFECCFF32FF7C000DFE750097FBA3FDB1FC76FC4BFE32FE54004BFF2003
      2401480407034C02290317006BFFB6FEF1F901FCD1F812FF40FF5A06C805D107
      B108BB0680082206D00537044605AF039204F403C5046604D804BC053505F006
      6607980467073001F1030F00A5011CFF850049FFE8FEEDFEAEFE1AFE69FD83FC
      ECFB18FA74F766F630F4C0F338F8ADF8F6FB17FD40FD87FBC7FD66F81FFB1FF7
      68F782F77EF7DCF8CDF83DFB1CFAA7FC40FB6DFF99FCDF00C0FF7FFF72FF0100
      0EFECA0083FF8AFF3B0165FFBB007EFF14FF28FE51FE84FCB2FAFAF8B9F60AF6
      C3F8C3F912FDD5FEC8FE02FF8CFE0AFE64FDAAFC7FFC93FC96FC77FEFFFDC901
      7EFFAD056C017A08D3044B092809BC07910969062906FA067F0528080F06BA07
      94066F06AA057804CA030C01980015FC9DFA78F746FA31FAEEFDAB00E4FF6602
      A7017903A4014004CC012D037103F3011E05C802AF0336042E0274056103AD09
      FD04400B36099309070A5309C408250A270A040BCB0AC20AEF0A9506FC0AF800
      4A07C2FC06FE13F908FC3CFC1E0040022302B002AF035B00250260FCD8FF1BF9
      FEFC30F888FAD4F9C2F80DFDFFF82700E0FBE2042CFFAF071304420528068C03
      750335035702FA0189025201EF003900530083FCE0FE94F5D4F9F7F012F6E7F3
      BCF7C0FC28FA6002F6FCC9017E0027FF2401C3FEA4FEF4FFADFD980013FFEA00
      E2FF14FFDE003AFFBCFF8200B4FFB7FDCC00A6FA92FDBBFB82FA77FD05FB57FE
      8FFC11FE89FE61FCA9FDD5F86FF802F4DBF653F540FAEEFA12FC7BFD3CFD2AFE
      51FE77FF75FEB200F9FE1D027600A0044A022108A903100BF405A40A57086308
      D00A5A05B80942021E04E8034700C105D700EA05FD03ED05D4058D026D0561FC
      78000FF524FCC7F4F2FC96FB20FDAFFF59FE280139008901C6007800900022FF
      2800ABFE6BFF91FE46FE4AFED8FD87FE6CFD9B0182FD91038DFF6B01DF01BB02
      68FF62057BFFA7074103DE0AC305F908F008F2036707220133025E028703D907
      2408E307410A6E05D20A9C040A06F6002402B2FF3C00D4FF11FE8E0285FE7F04
      04005803F8028D020304C8009C030BFBAA02DCF6CFFCB1F7B9F6D6F7DDF6FFF9
      FFF791FAE8F9B5F99AF94EF8B8F5A7F7F5F841FC85FE52000001C002DF018903
      6A0122006A01B0FD85003FFE25FE6EFFC3FD7A0111FF23031E00FD0579026D09
      8E042D09B507DA06E90751056B053605DB06E4068106B106C60658042F070602
      8001BBFF8B000001D304F803C7069F037307BF0176057100D6016800B0FEDD01
      17FE260463FF0706AA018E0621045107AB05CC070F060605D5060B00AE06F9FC
      6F016AFCEFFD99FDF5FCBEFDEDFCADFA07FEFDF8AFF9E8F7D8F57AF8E5F960FE
      FFFEE102970227042805280488055301DB041CFC9904C1F97B032EF965FED2F7
      1EFBAEF82EFA84FB75F91F0160FA0402D7FCE8FE010054FE62FFB0FEE9FD16FF
      95FD54FE24FDADFC24FA6EF96CF7DEF78AFA1CFBDBFD0B00F8FF2901A500A9FE
      DE0014FBAEFF6BF826FC12F9CCF855FB17F658FDCFF607FF0BF9730118FC5705
      69FE5E067800D602ED02FB01E501450349FF600367FFF400710097FDF6FDBFFC
      9FF97CFA3AFAE2FBF3FE6F00940102030F025706EF019E05E902F8009C058EFE
      6106EDFE06029D00E6FE0E02B0FE660168006F019A028F01410122FD7A0023F9
      CFFEE0F872FA93F74EF8EAF42BF9E0F4EAF602F742F1C1F77DF290FB0FFA5701
      29FF0F046C027D06BA038906EF0328058004D903F703BB03ED02AA051902D006
      E0021B063705AD074108030873084F01B30859FCAB0854FC5E01ADFCA1FB8EF8
      9AFC15F59AFC39F5BAF602F5E5F33BF983F857FF3AFCBF01A100B202A403F201
      2E040B00F00383FF750297003100670245FE9303B8FEEA042100C706D801EB09
      D102270B1B047507E10549068F0758076705CF05FA04B306B40625097302D506
      0C030B08830A9D0D1C0D780D830DB10C1E103E0AB40E24068C0B6903D6082D01
      6704B200270114004000890004012302C9016A0506028B07AF02C603A1036DFE
      A90555FB650449F6D7FF68F3A7FD43F41DF680F314F104F4DAF52DF891F92BFB
      22FC8FFCF4FC2EFF1AFC9500E8FA0CFF9CFBC7FB96FD3AFC56FDCEFDC5FAC1FE
      E9F9B30075FC3C03DAFD9707ACFF8A0638001C00F802BDFDA206D5FB190417FA
      A40145FC37FDBDFB36F9EAFBDBFD2301A802AC056B04CF07B80561090B05CB08
      3604B505C704FB02E9053702A0040F0387020504EE01EE05DF02480800046B09
      630562054906B7FEE50605FD8F06C6FAF8FFCBF7B0FC82F850FACAF850F44EF8
      B6F6CCFC51FBE202ADFD8205DBFF7008B200D80A3501350AD00225071B06A606
      0D0889065107C50485040E05EA03EC0442033D0456022804EF02CB0172011900
      590215018102B8005D001B02BEFF6503DFFC31FF30FF44FD4F0634020D091804
      EE0691032B0384023802A1FE7F01EEFAC6016EF98600E6FAA3FCE2FB01FAB1FD
      6BFA40FFC6FC6CFF92FE2D01ED003F019200DBFEA6007DFD1B02C3FCB700B5FB
      A5FD8AF8F9F863F4C9F801F4A3FD50F81EFDB2FBFFFBCFFB9CFB68FC13FA22FD
      72FAA0FD9BFA33FC8CFBF3FC45FC20FE48FC80FCA7FADEFBFDFBF4F99CFDC8FA
      1BFD62FC51FCACFAB1FA87F9DCFC44F94EFD90FAACFB96FC50F84CFC62F61DFC
      ADFB360077FFFF021901FF015B027E01CB0111019800C1FF7BFFBFFE91FF2B00
      B4FE71031BFD8C03A2FCFFFF8AFE52FE6802D8FEFE034DFE8D0013F997FDECF3
      2DFF63F292FEA0F25FF98AF531F39BF6DDEEF3F620F24FFB25F8390062FB8F01
      4FFED60183FF06020C000602370030031D01E0043C0148054C003C03CF00DE00
      3A02D9FF550397005D02C5035900BF0481FED50158FFD001300327038C04E804
      E6001606E7FD69042B014505E906C506040ACB04B60BC3036E0A300318085100
      2F044CFDAA01DBFB90014AFDD2FD76FE7EFAB2FE8DF87DFF00FA3D00DBFBC502
      AEFC850573FD51023FFD2FFD2A000EFB8D0300FB12005EFC53F8FCFAF7F769FD
      61FBF702E3FD4D05E2FFEF05E500300566016F057E0107061502EE04FA014304
      9E02E004C603F102680364027D02D00207043F0428045F05A30322000D0469FC
      7B0658FB940A88FB6F05F1FB84FDBAF907FE3DFCEE01F6027D0373075C033C0A
      BF03340B7F04DF0AA6055C09E1079C083709AA09C109BC0A0509E3091108DB07
      21097906BB0A4D05FD0AAA060A099E02BC07E9FA280794F81609FAF8C50535FA
      BAF975F836F69CF9BAFA24FF5FFD8F0111FF9C02EBFF49030900B303BDFFAE01
      60FF6C0018FF360292FFE9007CFF68FC38FD82F771FD77F5EDFE44F612FDCDFA
      95F919FE8CF6B6FA7DF6CAF8C7FADFF8E5FECCF802FAB0F751F6B6F8FEFAD0FD
      79FC6F0145FDE304DBFEC3067EFF9407CCFEE805FCFFA2031C02C60370028703
      E901C20136FFACFEA1FE92FECDFE07FF0FFFF00153FD2E0610FCCD0334FDA900
      75FF57015D040B00130252FDBBFC7EFC79017AFFAD05AA0375045804BB048A03
      BE032602FC01340124015C0206006304C1FE210273FE92FD70FFF1F94402E0F8
      AF02DAF9D9FF6FFC62FD9C01B2FA4EFF7EFAD9F979FC6CF83F0167F81301A9F8
      D3F9BBF8EFFAB0FE9EFD23050DFDA20688FE0205E2FFC001500298FE5D04A7FB
      510500FCD00381FDC2004DFC49FD5FF777FB4DF512FC99F512FD7BF7C9FB63FE
      C1F62AFD60F573F645F6EFF4ADFA36F6C9FECCF795F6F1F636F4CAF92DF944FF
      B6FA4B010DFE010247FF6701BBFFD901D6FFE2024800E7044E00DA07D5FF8108
      09002A07A9007507B00261098F041E0C8805E0117B04AA1288059B0C09083A08
      D50C11067311CD036E0C0B01C70794044F09BB0A0A086E08D20773064A092005
      160CAD035C0D0C03DA08DD007306F900F60367FE16019FFA94FF5BF907FE21FA
      57FD58FC40FBA8007EF8E70337F7D5FF45F81CFA92FB70F854001BF89DFFF1F5
      7AFBAEF554FC19F880FC84F83DFCEDF75FFD9AF6FBFC16F609FB64F72CF82AFA
      5BF661FDC4F4D9FABBF43AF631F7D5F431FB31F631FE79FAE3FBF1FE5AF82800
      04F751FBC9F709F641FC23F6420130F825FF91F850F8CBFAD5F7DB0140F9AD07
      D3FA1A0B7DFE7D0C0401150CB303270BD2067F098B097408280AA206F1094204
      9D080203C70698030E05AB05E002E50965004B0F9DFEFF0CA6FE61049401C201
      03072F022D0A1101710767010203C7049C0283072E036E089C04E709CD05690B
      7105700C5005570A4F059408FB051B0654074B01B30948FDE90869FB440661FC
      620432FFD400780235FD38FFBBFAADF88BFB3EF629FF0CF6340094F549FC6BF6
      E7F8D0FD53F82E042DF81305DFF9E10503FD0B049E011301DC0504FFDF060BFD
      5B0751FBB50653F8B30366F5190013F559FCB5F658FA6FF9EBF70EFD26F517FE
      CEF36BFBB3F4DBFA8BF8F1FABBF925F82DF951F71DFA00FA5CFB74FCADFCCEFC
      93FC05FD12FDBDFB0CFD60FAACFBB2FBE3FBA5FDB0FBB9FE53FB1CFB22FBA8F5
      B4FCEBF4CBFE02F7400023FBBAFE72FFE2F8C8FF25F65CFBE1F679F71CFB92F8
      44FD5FF91FFCD2FAFAFB3C000FF9430439F808065FFA2B0798FD3D05FB008801
      C302D3FE0E0505FD54066CFB42056CFA09025BF727FFE5F4CCFCE7F6D1FA4BFA
      C8FA130018FA3704CCF679FFE6F5AEF7EAF95EF667FDB7F5A00024F5AD020DFA
      07FEE4FDC8F9EEFF11FA600270FBFD0342FDB6048BFD1606D7FEE606B6FF7F04
      4500B801C301B1FFBA0310008D050504AD0450083E03B30A3301290A5AFF1C05
      88000FFFD40509FEC608E1FDB10670FDED05F9037B033B0C0100030EFEFFF20C
      6A01190BC604B808D4091206550EC1034E0D9B01910900FF0C071CFD58043DFD
      2002B20087FEC5041CFC070765FAC006A6F874031EFA81FD2EFFB3FA1103F4F9
      150256F7420396F9730351FD0CFFFEFD93FDD8FF2BFD060226FD3B0305FD5504
      85FC4F0665FD5008C1FEA907CE00AB02F802B3FEC305EF00C7070B0672094709
      1C08A206F902BD012D01C8FBF10406F9430A64FA3A09D3F80F0654FC6204C502
      60FE7706FEFBBC0ACAFDC10DB2FFBC0E5702F70C61042F0A82070C08C7091506
      930A3603740A1D0140095F0177065502A4047103AC038503F4015303390192FE
      6F02B7F7190413F6C701BBF3DC0129F57104A2FA28FE3CFC91F7E8FE56F7AF02
      E1F7900671F99F060AFA3E0360FB7D0135FE84FEB10026FBA90408F9EA05EDF9
      090390FCAD00AAFD7BFE2BFC33FC07FAD3FAA0F662FBE4F4D7FD70F7D9FB4FF7
      ADF9BEFA7AFB0A03A2F8B40775F61109F9F81307CEFA9904F0FD9F02B2011C00
      210599FEA405AFFD3402E5FB0B004CFA71FEEAFB41FC91FE8DFAC5FF97F941FF
      1EF849FF7FF61DFE83F772FC63FA0CFC3DFAE0F6AAF964F53CFE07F930FF24F9
      E7FD12F9BFFEDEF9B4FC2EFBA8FB0AFDF2FA8AFF9FF9C90182F987039DF95904
      B9FA4C02C5FC0001F5FEC5029F00AF032D026801F8028AFEE5002EFA33FF85F5
      A10157F59F0136F4FBFE38F4D7FF6BFA77FDF4FD8AF703FF13F6C5FF9AF688FE
      E2F731FC6AFA5BF914FC95F826FEBBF925FF77FA5BFEE7F88EFC31FAC8F942FE
      66F8C601B6F9CE032CFB2E04C3F96E0304FAE1FDF9FDD2F93900FDF68C01B4F5
      910571FB2807E4FEC3014EFFCDFC0E01A0FCE502E1FC0C041DFE50040CFF4403
      8AFFEE01E500390214023E03D503F40592047A0943048A0B1D03D009FB029207
      6803EF05A3040202FC07ED010509B1028207DC038F08D60A9C09990DCB059F09
      D503D60598065701C70902FDB50C91FADF0D75F94A0B28FAFE06D5FBDA0109FE
      49FD660088FA020312F94405E8F8EF0351F9D2014BFA9B0139FB11FEE8FD6CFA
      A3FFBBF618FF2DF11C01E2F20A03A8F5330136F583FDB2F632FCE4F838FA0DFB
      F1F665FD58F5EE0091F48B0273F5820303F70B05CAF9140652FC65088AFF8B0A
      6A027007950373025E057A01610526FE24072CFCC2093CFC9B0880FBE606F900
      C805C406A8022809A4FD850B28FDF80C25FF6E0C4200A70A9202D308C404CE06
      B007640592093405300A5307D508C309D406210C8005FB0C1B04C30BA703500C
      8603FB09BF05E204BA075300AB0853FD490B6E00320D3005230CC9063B075A08
      2002650939012D080C01BC04F200CA00EC0106FED50390FBF60518FB7A06C4FC
      4B0556FD6F0168FD35FE12FC96FCE0F985FB21FBECFB01FBC7FCABFA9FFC14FD
      DDFA52FEF9FA3104D4FC3C0A6EFD9F09FCFB3907DFFC3A020002C8FB65065AF8
      810944F7FD09ACF6AE091CF7CB07F0F8C90168FCF2FB8CFF71F81501F6F65801
      83F69000B7F6F60165F72E0254F9CEFE4AFB4EFA93FCDAF5DDFF43F7EE0309FB
      F7055DFB9A04EAFAF3FF6CFA89FC71FA97FBDFFAD0FA6FFCE6F9FFFC1BFADEFB
      5BFAD6FB61FA92FC93FAE5FBF1FAD5FA7BFC2BFACBFC6EF87BFC12F968FCDDF8
      67FBC3F6ECF860F61AF77BF4A8F870F6FEFA86FBB4FBF5FCC2F926FEB2F673FE
      E8F61EFD8EF8C1FA75F9CAF8D0F98CF70EFB79F61EFD78F605FDEAF640FB53FA
      72F808FD55F61AFD0CF5C9FC14F5F7FC86F598FCCBF5C3F911F89CF6F6F902F3
      7CFD85F5C700C7FB08012FFE0E0018FFFFFBBEFE37F941FE4CF910FDD8FA54FC
      74FCF0FADCFD94F860FF28F84EFF57FAD8FE55FE21FE440035FE48FFDEFC73FD
      0EFBE6FD8AFA6AFE13FB45FEE2FBA600B9FB2B025DFE7506B100A20C5E01C00B
      71019908DEFF57062F0234029C0656FEE109E0FD5E0B7DFE7408D3FE1805FFFF
      D30216026DFE41043DFAAA0481F90703D2F99900F0FA5E0009FC480091FC98FE
      74FCE3FC8BFB4EFA21FE64FA7A004FFE83002300FA007E0098FEC600ECFC5001
      62FDC9021BFDD904F2FCFE06BBFC31070CFE62077FFFA909F600660B1F036D0A
      B50543074A0852013D09B0FE3D0A11FF4A0CB3FDD90B62FDD1085CFC56094EFE
      63086803B50517061D0610077A03D80609016506CF0160056803E6032305FF01
      3D061500BA07ECFE6F088DFFE90704027E067D039204F402B60248014D013C01
      A1002501020153FFD800DCFD85FFCEFB6701FDFD5103530420027D075A01E207
      9FFE610676FB9C040CFBFA00CBFC92FDAAFFDFFC3A020BFC72043FFC3D042CFD
      920220FFD1FF07000AFC63FEB8FA7DFB53FADFFA5DFA4AFDBEFB41FE9AFB5AFF
      35FADE00F5FA2F0437FC6C0A1EFB4B0D3CFC280DDDFDFE0BF6FD610905016904
      E904CEFF7E0828FECC0ADCFC5F0B16FD0D0BE3FED208A0013704A1033CFF9303
      CDFCE201AEFB7001EAFB9202A1FD0701CFFD26FDD2FCFBF93E0002FC16041200
      B4034D01C9039000DE02E5FE2FFF8FFE4EFC9EFE3AFD57FFEAFE910098FF5900
      B6FF9BFF07FF3D00A1FE8B02ADFED3027CFFFFFF0F00E6FBECFFC0F82CFFCBF7
      CCFF57F53300E9F16AFECAEFE7FE8CF0810069F54BFE01F98FFC97FB2AFB4DFD
      DEF5D4FD54F271FDC9F1FCFABBF214F95BF598F7B6F859F63AFC07F62BFEE5F8
      F2FEF8FC24FECDFE39FBBAFEA4F83FFE50F76CFEE6F6FEFCF2F622FB0FF851F9
      70FDD8F90C037CFE7003B700D70212015802060198FF2901C0FD920258FD8003
      FAFDE3040900F3054F013D06530257069A021B07B202F1077B0358075D043E05
      49055504AB057605AA06CA05C2064305490590049907A206ED0A880BD509F50B
      65090D09760AF6073D09860787070906EA071002F108EFFE5C0ABEFD88090FFD
      6607D6FDF206D2FE9005A2FF4F02D1FE0CFE85FC51FCFDFB61FB5CFCBBFB38FA
      EFFB35F657F926F21DFB77F188FE3FF44FFE87F4F1FDB9F345FE58F4D3FBD0F6
      33F8DAFA07F70FFFC2F54C0235F4AB03DCF20304F0F17C0350F3DB0338F65A04
      73FA240120FFA0FBDB02B6F97504A1FA43050AFAF404C4F8AB0292F75C0315F9
      9503AFFD9BFF430092FD6401C1FEB9021FFE97034FFBD3039BFAA703C6FA4103
      D4FB230294FD6D01C1FEF0011D0095039500FB05B20017072F003E05B0FFB603
      CEFE2E03EDFEF601F4FFB501CBFFDE028B039805E407B2092707210BB9041E09
      F6026607AA018E064200B80414025402F503F9013205E101A6060F024C05E202
      54044502520378018A01BFFFCBFE64FC52FE3CFB82FED4FCD8FEEBFC8AFFF3FB
      2EFDE1FBEDFEC5FE8F0130037CFF85031CFD3C0175FD49FFBDFEF0FEE4FDD0FE
      6FFE3DFC400079F9AD0134F9EF02FFFA3D0249FECB00210196FF040310FED103
      48FA60011AF7AAFFF1F61D000EF9BCFEBEFC3BFA63FED3F6A202CFF8920791FC
      ED0681FDAA042EFC480337FBE602DFFB27FF54FDBEFBB8FE9DFCE3FF0FFD1000
      5BFDB1FF38FC69000BFB1A026EFB020415FC7603DDFCF0FFB4FD98FEFFFD1DFF
      D9FD42FD4BFE59F8C5FD96F3EA00A4F3660487F785027EFA260187FCE70056FE
      BE006BFF07FD9FFE66F8B2FB3FF634F960F5FEF774F79FF7A2F976F72EFC8CF9
      CFFDC4FC4EFD0BFFFAFAD3FFE0F785FFF4F51C0024F5A9FEA4F490FBBAF45BFA
      13FA0EFCF600A5FEF2035BFFE203EFFED2026CFEC802D0FD11019AFC96FF05FB
      F1FF7AF98BFFCEF8120058F9650058FA4500D9FB040017FE2AFF8200E5FDCE01
      DDFBC30332FAAE06BDF8F605EDF70702EAF667FF8BF9050136FF1205F4012305
      E603870349065F04B908FC05DB077E08DD041709AE035F067D0396035903CB01
      3C010D01E800C3009202A7001A0420005E057CFE3A0311FE650036FF95FEB7FE
      7DFD86FB72FC20F9E0FD64FA1E01CBFCF0008FFCCEFF02FB6FFE30FAD8FEC5FB
      4EFF31FF9FFD4702C4FD4F0599FEE3064DFECF06B5FCF50570FB790527FCCA06
      B0FE16077E010C03600406019506F802DF06E501BF052DFE740325FBE1045CFC
      6709D6FFD2087E019E05F0024205B104AA06B106AE06E507E70391072302F805
      050286034C025301090393FF1F048CFE1B0602FF1507DCFFE5061CFFEE0598FE
      7B03200066012B01C5FFE6FF37FD6100FBFDA004C1009A0640008A046AFE0802
      61FC0F00EDFC6FFF33FF6EFE5E00B1FC5103ACFCA3056EFD1705A8FE4E03B6FF
      F90088001000350135FFA5007EFC16FFA0FA60FE46FA5D003FFADB00A9FAEFFD
      6FFA8FFCA9FCC5FF000018043300630577FF01054FFE11041AFF5703F0FF4A03
      C4FE970275FEC3FF5FFF84FDF40086FDBB0169FDD101AAFD5F02B7FD9B02CEFC
      F00165FAB2007FF8AFFDFBF9D7FBCDFA39FB79F706FA6DF5B9FB9DF8F2FD79FC
      44FD07FEA9FAF7FD1CF8C1FD72F853FE33FA7DFFBBF83300AEF7A4005BF9BD01
      7FFAA70286FBDB02A8FBF60262FCA10385FDB40310FE1201C5FEACFDF7FEE1FC
      D6FE43FB06FEA7F689FD4FF34FFF01F5BE0243F944046AFC4302DDFEB3FED1FF
      A8FCB4FF5AFBDCFE2EF818FC3BF542F883F555F65BF788F5EDF9F2F4BAFC69F6
      03FFF9F87D0078FB42FF1AFCBFFCE7FB56F948FC81F6C2FB56F432F957F265F7
      BEF43AFAAFF9F2FC26FD3BFDC0FEBBFD55FEEEFDD8FDE8FE28FE5E00E8FC2701
      4BFC140163FE1301FCFEAB01D0FECB0191FF1E0227004C0396012C05B8020306
      7303E9065703FC07E602D70660025D0358019F00050336020E06F204CF07B705
      9808F60596085206E408FA062F09CE08EF06F10920040608FC03DA059F043D05
      5B040604A00342027804F900C7061800130948FEDE0A37FC7C09ABFB2C0680FA
      CD03C1F77A0120F6160179F7CA01F8F80B01F7F98DFFB9FBFAFC36FD4FFBB1FF
      AEFB4C0319FBD40572F99F0639F9160713F99906D7F80C0565F9B20328FBB803
      75FE4704E4010702F70412008E062700CC0620FFA10589FCA90370FA9F0302FB
      7B058AFCBB06B2FD040513FF1B02E4FF2301C70061013E0232008502C5FD3701
      28FD8C002BFD320142FDA40159FEDD01CAFF6A026601A802EF017E01BD01AB00
      070027017EFD2E0180FCBE0011FDA90122FF85046D0160056E025604DA018404
      1500A604EDFEC504AAFF4A04340077036A004803380241030703F903FE010D04
      C20158038E02DF0206043E0387040803AA030E02F502470285015D018D0010FF
      E80054FE010227FF9B036AFF8F04BBFFA904EDFFC60353FFF70264FF30037E00
      5C02F2019800C2013F00D7005700A101BA009902BF001B020E009300B1FF69FE
      080021FB7B0171F82202FCF705016BF64A00CCF3C20151F41D03F8F6FE0224F9
      C60128FB48FF34FDB2FB8CFE65F9C9FFA1F9730159F8B901AAF65D012CF7EA01
      2AF89A025BF97403F5FA38040AFD0B05E9FE96069C007A06A101F6031D01BB01
      E4FF52FE2DFE0FFA04FE5CF89DFFCAF87B0166F9560470FA660628FC2D0517FD
      7A0239FEE80055FF2BFE31FF75FAA4FEAFF8F7FC2CF849FA5FF8E0F858F9C2F8
      88FA95F91EFB0AFBF1FBF4FA91FC6BFA5EFC6FFA9FFB28F97FF97EF736F8F2F7
      EAF8FAF90EFA5AFAC1FB21F95AFD81F823FDD9F72EFC59F776FC67F72AFC00F7
      C9FA6DF71EFB61F839FC21F915FC44FAC1FB42FB09FC6DFCC7FB7DFEA1FB0A00
      50FBFCFFEDF9F2FF67F86DFE59F7CFFBFEF80FFCB9FB94FDECFD67FD60007DFD
      860203FF3003650097019202FD0044052900B806A4FDC007B8FC14078BFC6505
      80FB960412FBD203E0FB5403C8FC8402F2FEA500BE0171FE90037AFDB203E2FB
      2C02F4F96C029BFABC02BAFBDA01C5FB4401DBFB3E00A0FC1CFECAFD3FFBC5FF
      13FB20029BFB1A03B4FA0704AEFA620506FB610531FB0105F4FB060500FD2705
      C9FD390545FF9404FD005F0262014F00BE00CAFDB700D0FA160220FB7E0303FC
      E50498FCA50617FEE50783FFB907BE0004052102A503EA02D602D30104003A01
      A2FE69004AFEC7FEA7FE95FED4FF5DFF5201CC00560277022C03020342041A03
      A803B403B501AF02DAFF44019BFFF201ABFFB002C8FF39025001BA00150358FF
      3804D2FEB4037DFEE3033EFE7F04D4FDA90391FE0B033C0085028900AB015300
      190061003FFFBA00F9FE2F02D2FD1E03B6FCE402DEFB4502C6FA3100D3FA37FE
      30FD4BFFA9FE57013CFF20028B002B033902160443038D0415029F05F600A506
      51002107ECFEC20747FE0107C1FEB40489FF44031A01AF027802BB02AD02CB02
      E002CE01FF0320007A052EFE3D05F6F9390442F690045AF62C041FF7B902C6F7
      6402D8F8120274FA3A0156FC72FFCDFE5AFED0006EFD5601D8FA420252F9FF02
      8CF84C0238F8EB00D3F83E0008FA48008BFB3501E3FC31024FFEAE01D0FE5E00
      BAFD93FDB0FD1AFBAFFFE1FB2F00D8FCC8FFBCFC6A00C3FCB101ABFC0D0303FD
      C40128FEDDFF26FF4EFFA3FFC9FD4A00EEFC13FFEBFC43FCBAFCA2FA29FD56FA
      AFFD67FBC0FD08FD74FDD2FD88FD61FEDBFD67FE0EFD5EFC5FFC0DFB30FC37FC
      D5FA71FDD7F9D8FD4FFA3AFD1AFC32FC53FECAFB16FF3EFC89FFB4FC170016FD
      18FF78FE05FEABFFFCFD07002DFEE4FF7DFEC1FFD4FE6600A5FFC7012500C602
      8F009B03C5005C04ACFF9B03EBFFCE037802E805B503AC06B60375052E040105
      DB04B604F1052A044F0532052D0491052E04E905C803E706FE03FD05FC048E03
      E804610196040800030572FFE80431FFDA04BBFDEE041DFCFA0400FA960482F6
      6E0432F5BC04C1F63603ECF85201E2FA5E00C2FCE7FFFDFDBAFF29FFF6FD1D01
      70FBD50135FA220241F8860383F67B04A0F67A0457F7990365F9B70223FC0602
      BCFE5002A900790287014D01490170FF270012FCF600F3F9630338FACB03B5FA
      5A03E1FA61036CFB1B0367FC650489FD750455FF96023E00EF0193004D005A01
      87FEE100E3FD47FF34FD6EFEABFCC8FE76FC8DFFFEFC7B00ADFDA70056FE4401
      85FEF201B3FD890031FE1F006FFFC90169FE6A0362FD8B04BBFDAE046DFEF103
      CDFF81027B00EA005E00E4FFB5005CFF21001900DCFEEC00D5FEB2003CFF5E00
      D3FF7800AB005901CE018802C901C0028800350249FF980026FD10FD5AFD30FB
      68FF86FBC5FF6CFBA9FF76FB080030FCB60056FDF20192FE9B025B00CA01FA01
      2B01AF03D9FFAB05BCFD2305B2FC3902F3FB81FF89FBF8FD07FCB0FDECFC12FE
      C3FDC0FD18FFA2FC900065FA380153F70903F1F5CC049CF664038CF757018EF8
      3800FDF975FF58FB7EFF2BFD4EFF83FF81FD830151FB1A0392F98304F6F74A05
      B2F739054EF8500460F9430334FB040342FD35030FFFA5023800C1005C006CFE
      6DFF86FB1600B5F9A702EAF9BA03F7F9B4031BFA250466FAA604F1FAA40578FC
      B5057EFE3D03A600D1008C029CFEB402B3FBC000BCF9D9FD61F81CFBE0F731FA
      D4F7D7FA37F836FC79F90AFD1AFB6EFDFEFC73FDEEFD35FCF6FE12FCFCFFB3FC
      E6FE8AFCB1FC1FFC8EFB19FB33FB9DF9D2FB5AF82FFD41F7C2FD13F780FE94F8
      39FEEDFAD8FC1EFD36FC56FE09FC92FE4BFCDEFE0CFCD7FF15FC560093FCCCFF
      36FC43FF40FB1DFED4F92DFDCBFAA8FED5FD15006FFFB1FF25008BFFCC00BCFF
      AA018800DB021C02520375031D022F05190186078D002C0987FF730828FF8806
      36FE180587FDE603E2FD9203ACFE5203360068029B010F01D60228FEAA03B9FA
      B405AFF95E0779FA0D0650FB7A0477FC8B03B4FD3A03B5FE7203C2FF88039000
      3D02DB001C00D30161FD6703E2F9890422F88D05F8F7C20532F9C00447FB7C04
      B6FD71052900BA0532017504AD00780155FFB0FE0600FDFDA80269FEA80428FE
      FE0595FD570637FEDC0511FF9606ADFF760732000306D200D5030E02AD01DC01
      86FEEEFECDFC75FC88FD5BFD72FECAFF6AFF55028F00C004640131061202D506
      6F02CD059E027704DF035104EF0460043A03FB0305012903F8FF1702F3FFBBFF
      440116FDEB0239FBBA0316FAD90330FA4802BDF9D3FFC9F83F01CEFAFE0250FD
      A103ACFE23040A01DA0225036A015A044AFFF8035EFDAE014CFB1BFF40FB55FE
      E6FCEBFE4EFD2AFF2FFD33FFF9FC3A0077FDE40175FE0F03420009048B001705
      32FF7406BBFCD4058FFC7205B9FE9805D6FE090444FF3A0386FF32036800F403
      0002960317034101EF031EFD5F0404F90A0612F786076BF6380653F6D80389F6
      4A02E3F750015FF9AA01D5FA6202BEFB05014DFC63FC76FBC3F9BEFB38F9B6FE
      9FF775FF73F7FDFFACF765007BF8D700ACF93B029CFB2503EBFCB402DCFCF9FF
      9DFCF7FDF2FCAAFD7DFE09FE67FE7BFDF1FD26FCA5FD10FBF2FDEEFAD8FEC2FB
      FCFFF1FC11FFC7FDA7FC34FE0BFE5C013EFE9E02C0FDB700BBFD29FFC3FC47FD
      59FCEAFCB0FB95FDFEFB85FE09FC27FFA4FCBEFE95FD4AFEC5FEB7FE4A00E8FE
      4E007FFE6DFF08FE39FE00FD7AFD21FCE9FC3FFB41FCE0F9ACFAD4F709FCE0F9
      00FFC1FE8FFE6C0035FE550107FE4502B6FEC10369FF46053EFF4606D2FF9206
      C5FF610578FFDA030AFF590306002D04DB013E0412031B04C0039E03DD031904
      5A0437062A054408F703A107E602C7064606790BFB07C10D2207580B03063807
      8C04C0025704C5001B04E1FFA3041200780596FF290661FDC006BDF90208BCF7
      060A25F8FE0AC0F87D0984F93C064CFAA80298FBB1FF5AFD79FD4FFE30FA84FB
      81FB39FCBFFE6401E5FDE1037FFBAA0523F93D0610F97B0602FA1E074FFCEC07
      0BFFA9086E013A0876021805A40133007A00E1FC5DFFE5FAC7FF90FA450011FA
      BE007BF9D4FF36F976FFCAF9DDFEE8F9BDFE4FF9CC03DDFD3A06590263044903
      3701C5025AFEF400D2FCC3FFB4FB4EFFC4FB4200B0FB4A0263FC390423FD5804
      1FFEE6039BFF99046601AE05E102F406F702DE07E00264089401E4060600BB04
      1EFD980186FD78FFED024B02A505C0048E056D05760333050502F9032802CC02
      8203E2025F054004D3041D05C4031A052C03080363022300340174FE1D0107FE
      70019CFD2A0177FDC800D9FD220032FE52FF5FFF63FDD6FF14008C033006190B
      C408150FF808730FD4060B0DA80456090E0352069201C0049E00CC0434FF1F04
      A2FEE401C6FE46FE39FF1CFB5F0090F95E0392F9D00589F90806D6F818053AF8
      460380F8440161F996FE67F8810094FA96059C00E8063104C30567059B02E604
      EBFF1E04FFFD850398FC5E034DFC540409FCAE05D6FCAF0585FE7C02FBFF87FE
      90009BFCF6015CFD150331FD860385FBA2036FF91D0391F72C02C8F68FFF5FF4
      CD0000F55506CAFAA10734FFE1042C00DB00F2FF44FD59FFE9FA9CFDABF8DFFC
      9AF736FD07F7BBFD62F64BFD56F61CFBA1F61AF991F637F8D3F737F9E1F933FA
      DCFA85FAE2FBA7FA09FCF4F932FBD5F861F869F6BAF649F43DFB1FF8E3FEA2FC
      F5FEC9FD89FD80FEE2FB74FED2FBBAFEBFFC38FF3EFF5A017800CB023A001502
      DCFF5EFF4EFF81FC07FECCFB81FDBDFCFAFD62FDF1FDA3FCDEFDD7FC7AFDDBFC
      A0FDF7FDA5FC09FEC1FA27FC0BFE7600A70327095904C50BDF01100870FEEC02
      E3FC04003FFD8700FAFE430200018103A001FE023702E500D402C7FE000417FE
      2F06B2FE51095500C60AE901820A3303F3096D051E09C107B007D40743044204
      380373016D06850356052A043B00B402CAFB57015AF8C3FEEAF61EFDBCF718FF
      80FAF302BFFCF80267FEFCFFA0FFA0FC8400C5FA0F02EDF941042EFA5B05E4F9
      D803A2F78301B8F5810019F6DFFF1EF91FFE2BF918FE36F8B30254FC5704A8FF
      1E0091FE4CFCCEFC52F9F2F94BF7BBF8CCF6B3FAD7F6F4FCE2F5E8FD3DF6B9FC
      66F806FB23FB90FB82FE2DFE2201ECFFE902C5FFE4020BFE91012AFD97FF76FC
      B4FDB2FA73FBA9F7F9FAB9F4FE00CEF87906D7FDC40649FF2106250133062A02
      62073302A308C2005F08A201A406DD0290055F014C0463FF96038FFFF203AE01
      2104E001E50381014002D301E5FF760090FD09FD30FC20FDA2F9F7FD26F835FE
      ADFD8104A903640AD003FE08AF01CC041BFF6801BBFD77FF1BFE82FE73FEAEFE
      68FE65FF00FF4EFD0F00CBF95F01BBF8850323F97206E0F9620940FB230A0BFC
      900982FD4B088EFE1B06C5FB6F0004F7C3FA71F5BDFDA4F922017DFEEAFFB600
      AFFEA70326FE3A07A4FDB4095FFD930AD8FEF3099DFF2B090A015A082A02CD05
      53015D0216019C010D02BE02910364030204D102B4033B0289021802DF013C01
      C2FF83FF05FE41FEB7025B02BB06BE073B051808D30266065E01B7031BFFED00
      42FDCF001AFE5C03E0FED105F7003D06FF02D804AE01E202BC00710110021A02
      7404B70474065106EF061C07C2057E063C03980359FE1D01CDFADEFEB5FEEC02
      DB04960A7C060F0D2E06E60DD805B10CE603670A6000E7081EFF03092AFFD909
      F6FF95080301B303CAFF38FEF6FDEFFDA2FC2E03F3FCE204E0FDE100A6FED200
      D8FEAF029DFF24051900B70798FEFA077B02990B9F0A3211710BC3110E085110
      1E07680C56056A068C020504FA02C905B90593089708DE07D20A9C06330BCD05
      9B0C81065A0F61089811960843115D07F90CD4046D0656026F006C00ACFC9E00
      DCF7D8FF36F6FBFE18FB9D036DFC8207E8F94D0907F9F90A54F947091BF8D508
      F8F7D50BBBFB380DC6FF950BD00308091605DC06C1037807AF02E305BE024C00
      3A00C1FB05FB28FA85F806FBE4F840FCE6FA8D00B5FB440466FB3804E9FEC405
      7A02E407E7FE6106DEFB3E059AFB110419F90F0205F71E047EF7F706EDF70508
      F5F750088DF80A094BFA4C0A32FD000AD6FEF407A8FEB00559FC27043BFBEF03
      ECFB1502DCFA79FF65F740FFBDF375FCACF443FCC9F925029FFBFF046CFC4C07
      15006E08A20197044EFFDB0334FDFF04F2FDB603DAFD5603ACFC42047CFD1B06
      5400CF06CC02B905BC02EC041601BC04D4009D05E601940671024A076701B307
      A4FD150550FCA001AF01990486045A085A042B0868067105E20644011B043C01
      2D017603D0011505A7038C055806570681096E07510C9F06830D0F03690CF9FE
      FC089AFC030441FABE00E9F8D1FE9DF741FE31F728FBC9F696F7D8F346F972F6
      74FC89FC4FFF6CFEBE0020017A00E6FFD6FF2EFCD7FD06FC03FEF1FA28FFEDF9
      C0FFACF8D400C4F5AFFFBDF016FBCEECCCF6D5E9D0F569E828F551EAE9F60BEC
      B1FBF5ED050041EF86FF7AEE7CFAD0EA11FA0FEC5BFB73EF4CF9EAEDB8F77EEF
      E5F625F460F950F4F4FA5FF190F87BF348F87EF65AF9C8F634FB42F416FD1CF2
      98FC0DF1B3FA3FEE29F8DEEDE4F639EFF9F728F234FAA6F44BFD94F5A2FD38F3
      FFF858EF38F8F6EFE0FBA0F49DFD2FF8B8FF5EF81601A4FB3D015FFE0202F0F9
      3402F1F5E800EFF4ADFF13F3E9FE02F35AFE9EF23BFDEBF008FBD8EF49FAB2EE
      4EF8C7F09FF4F2F4D4F490F6C0F889F7FAF89FF74DF5D0F3AEF7FFF65CFC6FFC
      90FDB3FB2F00FFFD5C01E500A2019303B9023401A30217FDD2008BFE07007FFD
      AB02BCFCB70484FDD304D7F913036BF6E1FED2F382F9ADF0E3F657F3ADF5C2F6
      7FF69EF8D1F82CFA8AF8BCF7C0FBFAF6480097FD2201C8FE020303FDAE046DFF
      BC0200FF0AFFBBFF7FFF75FBC800A6F8CEFF88FA3E01DBFDC302F8015A0489FF
      9606D4FD760747FFE905DE0069054000C3057704F3066D0CAC09030C09085E05
      A609C603D80CBE077C0B500B9C0A5D0C47095C082908A5074C069007CE06CB01
      000713000A038AFFC100DCFCA0FF49FD61FFFBFCBDFE2BFBB4FD39F954FCD4F6
      F8F917F71AF99CFC92F9E200C1FBFCFF85FC98FCE7FDA7FA8B018EFEA4008A01
      9C00A4048102FC05DC03DE071E04630B6D060807690BB3015F062D006000B000
      7603300183081404E707BB0607057E05AE040E0396029C02E400EE027D00AA03
      7E0070037FFE5EFEDEFB0BFB9BFEA5FD8C010A069002CA0A1F057C0AB507D50C
      B409780F7C0CD90AEF10F506D80E9F09570A98092D0C040AAD0E650A88103B07
      7210A102B80DF40223093C03270688048B05D3090406E508A5078105AA06D300
      030633036207770A33075E0B2B07BC0E4108280FBD07480F98067E0F5B08A008
      500B790A7C0BA709BB0A6D0375097A05A106A304AD0489FE41043AFCB1002A00
      D0FC0E0358FF94020703EE0073058C02D80289007EFF7E00A50106087603E907
      1605DA08C605640AAF06720B1C07F10AB2088304E40B2A06CA098A0893061105
      0808EE02E408FAFFCD05B5F9400278F9C1FECDFE9AFCB500F4FD0A067300070A
      53038C08A005E408470607069F0985072F0A2D0F4209DF0F0A0B4F10E30B0D15
      DD0D2A17DC0F0B113B14C20B89152E0B5C10C405B20C8605220A4A053608CCFF
      28079501FC03AF046501D9042A01BC0444011C075001B50721006603CFFC1101
      04FE2F078103320E7D07B60AEF0A2409D209370C8308C10B3D0999071B0BEE02
      B60D3301DA0993000006AB0323054C0219041DFCD101E8F8D3FC30F5D6F8B5F7
      F9F5D0F723F43EF7CFF17EFA8EEFABF6F6ED1BF34BEEF7F32FF187F93CEF2BFA
      72EC31FA20EC15FC58EC38FDD9ED7C0215F09C01D1F329FD7EF73AFCD3F661FD
      7FF43DFEBCF40B0088F59EFC37F6BAF764F76CFA45F741FE29F5C001F5F57402
      0EF73C001FF5AAF91DF59CF671F73AFCE4F675FE1EF2A2FD33EE77FA0EEE2DFA
      7DEF45FDBBEF4AFD50EF24FA8BF19DF596F03FF674EB07F362EAF3EE5DEA69F1
      95E894F1AAE545F2F8E51EF558E841F74DE949F835EAEAFBA5E979FA46EB5DF8
      F7F0BBFF11F5D30382F41C070BF37A0903F31A09DAF4EF071DF84406A6FA7B01
      CCF9E8FDFEF7CCFFB7F33D00A4EFCB0123F33D0118F57605C0F3FE07D1F58307
      BBF89F087DFA8006C0FD8806C3FB7A03E1FA8602A500A9047B010606E4003706
      28FD3B05B2FAD60351FB5D05D9FA5E0A7BFF9F070B05E603B1082B057D070106
      DB00A80400FF6C01C700DE0039FF1A01DCFD170251FDAB0543FB2E0683FC2903
      0EFEB5FF58FB9CFD05FF25FF90FF95FFCEFCD5FE65FCF1FF54F7B60159F5CC02
      67F63602FEF9F201BCF85BFD99F8CEFC7BFD390212FDEB016EFB040210FBD405
      D3FFCA050E03EA02A80222044502740374003802C400C6007C0011FCF80273FA
      C505F9F9A80459FC5A01F2FE1AFD97006DFCDA0363FCCE031800B7046B04CE04
      7F074801170CDCFC080BB2F7EC05D1F4CD0383F35A019CF44CFCD0F7E6FA83FA
      84FE79FA3101AEF8230174F93C001DFBD400A5FDB3057A009F08BA03B9099D05
      B4050E05BE02E805D2053503F706D4FE060B3EFB6E0D58F9330DECF91108E3F7
      ECFF5CF744FD9BFB14FEF601D9FE5F07AAFF810B82033E0DD206330C810C360A
      A20DAD05380B2205470FE007D610FC034E0F7B01DE0CFC0182094B0291058A03
      B004160456075F0257089AFB8509E2F53F0B92F4AF02E9F5BBFA3AF579FA05F4
      4BF77EF502F86BF6ADF61EF881F8A9FC04FCEE0034F9F000F3FAF6FE89FE8602
      44024B08E0024707EC005B05150569051106CD07DE045809A9099C0A220B180A
      830A2308B00C7D0A650F570D2A0EC6147A0B3618790C6415981145117715230C
      B8185D0C6E175B0E250ECA0936093B00440A4BFD600E65FE570A60FEF902EEFD
      0401C8FDE5FEB6FFFCFF6FFF3204F6FFBD06A2FEC6053BF81508FDF4DA08C4F2
      9B0313F07601DAED8CFB80EEA8F4BBEF5CF6DAEFAEF471F283F52CF597F80BF7
      30F444F608F97EFB46039D008C052100AB044C00FC0696FF58058D009601BEFB
      70062DF835089BF81A0752F7FB04DCF58A0251F4AFFF0AF8DFFC2EF772FF23F6
      09FEA6F9F8FB03FABEFB82F999FF8BFB56011FFDD4FB05F6FDFFC7F53E06E5FB
      590557FBDA031CFA25015DFBF5FD11FFCFFFE3009B056C021C07FD01BF08AEFC
      E70647F8E207BDF8D80AEBFB990143FDBCFF0EFCC1FF65FC61FE45FD98FEDEFE
      17FE9D0067FEBFFD79FA3EF92FFEF5F8EE01E3FDEB00FCFE8EFFFAFDADFD72FA
      69FE51F5160143F2060251EFF90069F44BFB36F659F399F075F3FDF123F861F5
      46FCB5F7A2FA55FD58FA4EFF93FB33FA19FB4FF4FCFED3F30902AEF2A7FC57EE
      20F61DEFB7F926F117FB0CF338FAE0F7C9FAB5FB0EF8FBFB96F945FCF9FC6BFE
      5AFF92FFB1041101900498FD3001A7F7C603F1F75C08DBF7B805EBF7EAFECAF9
      EBFA7BFA3BF807FBABFAA9FC44FBCCFEBDF953FCEFF9C8FD93FE2007E303D107
      7805020692073508F7093B04610A23028907FA0313090404FB0720059A07C701
      3C071FFF43061403BE09C60414079E078203130B3704810B3307210C0309150D
      B00BE70D740C910BFC0BF709140F170D8A0F040B3F0E3506C10C1703510C9DFE
      E10A28FEBF0782FB700744F8D2077EFC4007C0F91005C5F2A302CBF5BF0408F7
      6A0326F82BFBE6F939F88AFA54F7D3FE71F54EFFE5F4B2FF29F4E6FEA0F665FE
      74FE55FF8903DEFE0302DDFECC012BFE1C001700BBFF3B034A02A1034B037A02
      8604450471042307100259065C01C806B205BB0AF108320DD7055B09EB02E204
      85039D04FA01D700FD00C7FF96FEA2FEB7F9D6F827FA48FA61FBFDFB39F72EFB
      4EF573FCB2F6F0FC62F4EDFB0AF406FB77F6D4F92CF804FCEDF5FA006FF2D5FC
      ABF233F8F7F206F6F1F546F2F0F5A0F324F220F4BCF014F551EDB8F9CAEB22FC
      AAEC60FC50EBE4FC2BF0B5016BF85A0817FAF20823FAD40598FD8D047102FD04
      4204DC02AC0202012301A8025001BC05E4FF4203CBFE80FB0201D9F76806B2F6
      1107DBF7C1FEAEFA75FB7FFC65FCE3FC7BFB93FE60FBCE0080FB880025FF7701
      520412056204F106F503C005CC06B904DF062C02240659FFBF0ACDFD9D0CE1FD
      7208AA01D0038802630076FCF6FD07FA4302BCFA3F0A80FCE805C4FE12FE7CFD
      A3FB5CFF8FFC1A033BFDED0187F937FC6BFA59FEE7015D044A053105D400EF06
      B0FEB106A0FF1F044100E502EE03F200570972FFD50AC704D607920773057B03
      7101A3009A027900BF094802D0077C024C028D026902C9032A0342041E02B101
      8AFF45FCE9FDFBFD0401CA061500C70725FDCA05B0FD0E0576FEA9003B013CFE
      580433FEC9068E00BB05F6063905380BA3039804E40126FE490445FC840897F8
      3F0A37F9860297FB64FEF5FD0AFD61FF27FBBDFFCDF834FC17F5F3F706FC03FE
      1200F604A1FDFC0668FDBA055AFEEE017BFEC1FF76FFE5009A05510485033C08
      68FE8E0BCCFE64079BFD6201F9FC030248010D04D003D405B8FA7B0621F7C607
      4BFAA7086DF9F1075DF82304E7F896FE4800B5005A062701040672FC3F0216FA
      BAFE87F64BFCF7F1C1F7F1F15EF539F68EF347FB28EFE3002FEC1E016CEB76FB
      91ECEEF81BF262F8F3F81BF8D4F74EFAD9EF1CFB91EC1EFDE3EBE80063EBE3FF
      6AEB27FDAEF0A2011DF53107D9F490099BF9440C10F9410A05F87D093FFAED0B
      F8FA570D8EFE440F5702D011C201E30F26006A0A6801F909CF04510CB7096F0D
      1A0A1F0B0704B909A1FE150ABB0168093A038E054AFF19FF5D0014009F04F600
      F90399FE35FFA4FC16FDAFF86FFBBEF6F4F9FAF675F849FAE9F52FFFACF3ED03
      F7F1E004CEF1050149F3CCFDBAF630FAE8F91BF6DDFABEF43AFA25F570F56FF5
      BDF039F8F6EF6AF97CEA29F55AEA99F581F2ABF99FF4A0FA62F4AAFC6CF4B5FE
      94F4F0FCE1F698F999F92BF9F1FBD9FDEBFDED0151FBBCFF08F876FA2AF67DF5
      B2F741F54DFE58F8F501F1FA620134FB72FB86FADAFAB7FD44FA55FE76F483FC
      39F9B2003BFF5804B5001702E10555015E096A00EA0878FECC097CFDD6071CFE
      B206C6034D05A3078A01AF07BE02D606FE03CD025F051E00970906FFE10DCDFC
      800DBCFC0506EAFDAEFFCC00C2FC680111FB8DFDCC01F8FF2B08050453090403
      FF09920318071703F8073A011209F1FC440AC5F7420C5BF9260A10FEB50855FF
      070629FAFE024CF49F02B8F4FA03ECF63003F5F84401C7FDAFFC2F02D5F72603
      EAF8600004F901FB53FE0BFCFC0691FF2D0A6BFE6F0C15FE6E09A5F98B043BF4
      0F02B3F473FEB4F8D6FA73FDC0FA340333FAB70785F7AE031CFB34FBFCFE34F9
      CB0192FD3707E501A3095D04EB0339059BFA5A060DF83605DDF7200229FC5003
      B103B60AF504090EDA03CA0DB0047D0D76069A0A490629085F06C1074707C30B
      3609230DC50B660ECE077F0E3C01F30AE1017F09E405B4091E09640B100AB00C
      B707DD0E56021D1005FFB00F6AFE870DF1FF180D8106BE0FE108100ECD09C806
      780A32FEF109B1F92A093BF8F30611FA9503B0FE69FD1F0392F8A305E2F34805
      0CF4C30282F968FFDFFCC8FE9AFD90FD86FF95FF2F000F0411FB4B0518F6A903
      7BF2ADFEDAF393FF42FD3204A0014B04900360036907820109089FFED30782FE
      390729036007300A5905130DF602620C7901A60912024E04CE05AE03A9071708
      06094209050ADC0720076E08DBFF330A54FC5B0A24FC3A067DFA9FFEDAFCDFFC
      7400AEFCA003FEF78207B2F4CF0498F3B5FC48F588F7E1F7A1F1ECFD21EDEE01
      B3EEAB01D6EF590303F1B1FF0BF48BF8DDF839F82DFAE3F8B6F8CFF6C0FAC6F7
      F3F8DBF706F3E9F7B1EFEBF787ED56F8A0F070FD78F4A8FF4EF32AFF47F48100
      9DF5C20106F65105C5F80307E4FC5F04E6FEF10364001502E8023201EB030801
      0C0134FDD6FE55FCDCFF8BFB45FE58FDC0FD990102FE5D0368FB470511F9F304
      66F6FB039EFA7E0657022C0822052E060B08B9036209D1FF700A70FC720B2DFD
      130AB4019806CD03E203C1012A01540110FF7801A60003004402C6FE04043DFC
      1403C8FAF801A7FC0303A5FF980152040AFAFA01B4F3E0FBECF83FFD87FE6A00
      3A00F501C002180368032402CE02B302AB020C073803CB090803280A70013408
      7C01D504210312023705A2FCF0083CFB360A84FC950772FCE101EA00D9FE5905
      5AFCEE099BF7BA0A97F8C604ADFE2A013207F800EE0B14FFB80D69FD0D0FC2FC
      FD0D36FC8409CFFD120486FFB6FF1703CBFDAA0307FE0B0163FE9000AF038BFB
      7E08A7F76C0A89F7E10A97F7F009E0F9570894FADE0384FBBCFECAFA86FBCBF7
      E1FD98F9BA0341FFC10652027305220497027205C40109058A01E906D9022106
      6A062302A1081AFEF408EFF93D0961F8970AC6F506089FF59205A4F95E04F9F9
      42FD55FB40F9B6FEAFF94702F0F65204C9F3730283F48A0499F920063BFFEC01
      F6004EFC5B02CFF708055EF6E106E8F7490862FC7704F1FFE3FB7200EBF32F00
      91F0B301B3F01500A7F490FCDDFB1CFCBDFE82F9A4FC4DF737FCA5F650FFA3F7
      1BFD42F8D0F612F7C5F158F955F24AFDA6F679005DF90004B1FA2B041EF9ED02
      CAF92B0623FBE70963FC780E77FF9C0EE002B108D202C406D9007005DF044C04
      C80A0908FC0D9309AA0B06074D09A607DD08CB099B014107DEFB280370001502
      710333005C0363FD8207CCFBE60829FCD9064BFF0B046303A900330845FE5109
      3BFBF205ADF80E0343F95E0178FC84FCA201CCF6C705B8F6D40788F70C071AF6
      6F0425F3B303F4F243FEF5F3C3F62FF1A1F63DF234F803F650F5ABF867F343FB
      38F5F5FD3CF70A01A8F73303A4F89B01B6FB30F9E7FE07F3D0024BF0DC05B9EF
      0D07FDEEAF0883ECED05E3F0E9FF35F581FB59F7EBF532F85BF5D9FAEBF539FE
      75F273FBD7F476FC66F99F0098FC7600920034FF6D03FCFEEF0462FFD9050101
      6A083203F607D0047D0612059F076D03A2065503300533051C069E038F0AA502
      330C0A01AB0A3BFD660916FE7E090D016907DE039500E7FFBE02F4FC2A066001
      90052E0324089C03280A74020D0C54030C0A45057B070507900533097704A205
      2E07F5FFD00833FFEB089CFFCE0869FC490A38FC2C0BDBFD41090100D4030504
      C0FF2A070DFF8D0646F9A1FFF5F829FE7CFF8CFEDA015FF794066BF3190CF0F2
      EC0B8DF5F506DEFA27049BFE8BFE4302F5F6ED0394F5430377F54303D4F90D02
      0D02B8FC050A07FA0E0EE9FCDA0D8C01800B5D04BF08DF04D505ED03C50018FF
      C5FF31FDFD02AAFFFD030900740440026E07DC0542090B086B06D10AEC00C40D
      4BFF920EF9007409980378040806FA0440062206B9079805C40AFB05270B5B07
      DB078A063405450552041D0400042C04AC008A04590061065D04020A8A026209
      15029303030401FB2A0756F91B0A40FDD7093A01280966057E05A5057A00EA05
      5BFBEC095BF98B0CB2FA170AC9FCF608380009087404CF029007EFFE9B0927FF
      160B71FF2607B4FA3105CBF9E007BAFDB405A7FC2A058EF90207CBF6E20698F7
      B006B4FA5E04D8FC440053FFAEFD1801B0FDCB01AAFD61040EFEA2079AFDF805
      E6FC0604C0FF83034203AD00FD03F7FE06050C03C4073705D70592008F0185FE
      1A029BFF560092FC48FBDCF70BFD37F7260025F8BAFE9EFAD6FB88FD8CF9D7FE
      61F5D5FE62EF5CFC46EEB3FC30EFB6FE6AF181FB9CF4B4F82FF7CEF811F935F7
      1EF71BF53CF5D2F36BF57CF138F54CEBE0F466E9C2F6FDEEC0F7CBF496F52CFA
      32F25DFD34EF1FFD6FEE9CFB6FEEB8FA78EDE7F703EF42F324F4C3EC2EFADFE8
      03FFC0EA3E004BED66FFFDF0E6FA20F4ECF5DBF594F10EF68CEE4DF8F9EF68FA
      79F0E8F88CF236FC97F69A0053F847FF2EF9BAFBCAFA9FF8A2FCC5F613FFE8F6
      210342F81105D1F962031EF92E0151F61BFFF5F704FEACFCCFFD14FDA5FC51FD
      5DFB030238FC1D056FFDAA035DFB410392FB2F0280FC4CFBA9FC6EF9B3015DFD
      E90446FD24039FFE3303D102E00506060D066108CC03D90A48005B0CFFFEB909
      40007A05980034050001020816032508E105F4071607DA087807A6099B04570A
      C40065099BFFA108C9FFA5045002FB018D04AF016D066DFC670AA6F63F0C27F4
      B80CDCF5350D4CFA520C8AFF0A099C0225023804B8F9EE027FF43001EDF47E01
      08F84EFD36FDB7F9C60152F92305B6FBF50445FE97027CFE44013AFD7FFDB2F9
      4CFC15FAB4FCB3FBFFFDC1FB66019EFD17023BFF9C012E02B6015C0551022906
      6F016504EAFEF00194FE0BFEC100FBF922021AFBF801A5FAEE02EAF80F0326F8
      100262F984FFB5FE14F9CA01BBF4D902DCF3A802F4F5D10506F86C0885F7D604
      53F8B0FE10FBA6F5710070F1D80450F23608E3F5BA08D8FB1305B7FF6D01B601
      97FB640411F47609FDEFA908D3F0B2027EF46F0068F9DB0146FCAD0289FE0E01
      170095FFECFFE9FB6D01BFFD42FFE10344FB480544FD440600FFFE04E6FFC603
      C901380456021106CC024B081104DC08A006A5078407F6073C062D0C8704D00C
      3005320973055606AC05F4038606A0FFD20598FE5F05CDFFAD03D0FED2051600
      B3065102EF030302E0024B003D01D1FD010224FF87023103850256050A039206
      EF019D0556002904BFFCEC029CF9B40232FA190193FC2EFCBCFE20F82E019DF5
      B80239F5E501FBF4F5FF86F2F0FD1CEF850097F2B2FF6FFBD8F847015DF76406
      EDF5600739F44205D6F34204E3F387015AF660FBDFF9D4F5CEFEF3F13E0497EF
      0C0828F4270768F642058AF46903B7F5C3FD7DF8DEF81AFC3EF67DFDF8F18DFD
      AEF289FE9CFABC02A3FDEF066DFBC20780FCE1085DFDFC08F1FF76087305D809
      8407FA0B5908790BA807910844080006B20903067E08BA085109E1083D0BEB05
      B00AEF0521092F09B8089B0B4508350A9005C0063C033D0129084AFC8A0BC5FD
      D70880FE6F0AD8FF2F0BFC01F208F003B9081808B306A109B101C70937002F08
      3E01CE03F000BB00FCFFA60260FEC102D8FF00014E02A3018304A102C305BB03
      3A030504B8FD150386F953FF0CFFB9FD6F037FFB080118F7E50281F7E0027BF7
      7A0067F9160176FF75FFB803E5FBB1042DF9EF0285F710017EF6D3FE6BF317FC
      2CF3B3F9C9F908F879000BF8DE04CDFA89055CFF2502FB02E7FC8D027DF707FF
      6CFADAFFFDFEB70218FB0903A8F9AE026EFC2004C0FFD8090C02CA0DC800D80E
      FFFD6910CCFBE4100DFCC60FA8FC200CA4FD800A57FF4E094C01E504AA016E03
      0801130459020E0669042B0A4403660D0E01B60D7E071E0F1D093D10BF01F10C
      4BFF5E080EFF5600D30160FC1708F9FC4E0C8FFCD90C40FDFE0B1AFECA098AFE
      7906EFFE4A002F02E4F92502BCF679FE83F584FD6AF9B0FE12FEC5008B003EFF
      020074FA6EFE5DF71C0360F72C0685F7D70212F66F0142F6D502C0F67103F3F6
      B001D1F8AC00B7FC42FFD9FFB7FA68FF9DF753FFB6F7CC015DF8BF04ADF84203
      E8FA06FE01FECBFB9F0129FAE10536F87E081FFAA10611FB90025CF9860668FB
      B10967FE2B03C0FCF0FF1FFAD8FE53F76BFDFAF5C7FDAAF856FD6EFA4CFB30FA
      98F65CF9E8F256F797F35EF605F562F9B1F059FCC6EE0CFAD7F003F871F1EDF8
      9DF39CF81CF5BAF502F243F0BCED88ED2AF3B1F18CF940F619F763F874F45FFA
      DBF43FFCD9F4B500C3F2C5046FF15E0463F1BCFF8BF080FB86EFCBFA88F1F0FA
      59F36CFB43F4C0FAD2F73EF845FB9CF680FA83F789F67BF838F635FB83F6AAFC
      D7F56AFC82FAC000D3FDE302B5FAED01F0F7B7017AF7E1FF48F782FE1AF9EFFE
      43FCDDFEBEFEF0FD950064FDA7FFB5FD51FED5FFDBFC6603A7F95B053FF89B04
      C1F7C90443F7530638F8F5077DFB02096AFCAA042EFDC5FFA0050F009B0B2A00
      D708E1FEAC050D00FB05DC03AA079209F608F40EA807E31072027B1020FF9A0D
      78FF7F0974FFCA073AFFB308B9FE2B08FCFF2C069E03FD06C306C4088B09C30A
      B20A520DF407770B6005D9079C09DE06CB0B9002E205F3FCB40280FA2E0686FA
      090A5AFBD90C04FC8F0EF2FE330DD4008309FFFF77026AFE3DFDB8FF08FCD400
      44FB71FF5BFBE5FE50FDD8FF03FED10136FE24004801EAFEE40048FC06003EF9
      FE0275FC9A0650FE0A06A0FDB40258FD7F0341FE440438FEF90514FD0C0820FD
      000776FD010573FD1E04C4FC3405A4FE5505D8FF4705EFFB0C069AF76D0670F6
      0504D4F65D010CF7660130F8F7FF26F8C8FFEEF932046EFF11085E000105B0FE
      23FF98FBA9FE08F792FF3AF4040141F23402C4F25B0225F4CF03A3F5E103F1F5
      7B033DF785002CFB6CFBCFFB6BF8E5F956F766F975F631FA67F6DDFA5BF7FCFB
      22F634FBD9F62AFCD2FCE800D9007801FDFE6BFF39FB1DFD8FFB43FC95FE44FD
      4301A9FEEB01210115024603A904DC042D05E0043405B604B103F30311014E02
      1201B101BE0312006F06A6FB100797F9A70880FA37066CF9F50474FA750916FD
      8C0B18FCBE08A9F9E7043EF9B00470FBB40490FBA805AAF8010898F86B0A74FA
      E4095AFBEB04FBF9F30077F966FF08FB18FFBEF9E9FBC4F7B7FBE8F644FFD9F6
      D9FF2BF9B4FF02FC0FFDD9FA42FB30FB96FBF5FE68FAD8FDDCF77AFB9DF495FB
      79F636FD20FA6CFF69FDB5009001E3FE200402FB830409F9F600A5F8D1FD6FFC
      6DFCB7FE2EFCC7FAE0FC14F8EDFE37F7B5FE98F629FA7BF77CF636F98BF35CF9
      95F68EFC91FCEC0241FEA40337FD03049AF93B0745FAE108BDFC090863FEB205
      9500F30341018504730491061C06EE06FE05A90781066E09D50577097103F608
      CD00760AA4FE5A0BD6FD8A0DE2FF9D11CAFFFB0E2E01D7093D063709540A7206
      FF087102B302BF01E000A9037A0268062A061407120AD3095B09990E3A08D910
      D106F40F70041C0FA701820DF3FC3707B5F86C026DF8A102AEFA9A02B3FC4702
      F5FCB601F1FCF4002501FC064904430DE803950C3F01AF0934FA3A0707F6F707
      A0F5E506C3F604036AF92802A7FBD2043DFE24081D00B2077300F605DDFEE505
      74FD5F0478FC9402D1F93A0302F84702EBF7910132F73C030EF91A03E2FE0006
      CC00CB0A6A00BB091801EC0548FF4705B0FF56074F01EA073902B00772048F08
      1B060D0C09068510BB046B115A03EC12DC013D14B202350F1E04010AAD04DE07
      E104D6052A044705B4017E04F8013003290A14072410EB0D57100F12310E1714
      6F0920148B07BC130408BB104607790B0506E10671051E048207B004990B5604
      F30F98042412E3055B112504441137014A119FFE400EE1FA510ACBF8460412F8
      0000A9F6180336F9640414FCD804BDFA45068FFA40029EFD45FF3E02B1FD6E06
      25FC2407AAFCE90690FBDB09C1F9A00C01F9B60A61F89C07B1F7C10544F97602
      1FFEF0FFEE02C7FD920583FB2E0942FD0C09FFFC410691FA69098AFEB7097603
      EE06FB025A05F3FF540232FF83002701BEFE660168FCF0FCB1FA3EF896FA27F8
      96FA31FA1FFA83FADAF954F955F828F972F792F6F2F76AF509F552F7D7ED54F6
      F4EA05F582E97AF3C5E92EF446F0B2F9FDF169FCA5F0A6F913F022F872EC78FB
      D1EAE80058EC15054EED75052CEECB0102F0F1FEBFF1F8FDA5F073FC0EED55FD
      69EA0AFFE0EAECFA09F016F6DCF6C2F4C6F927F596F747F808F39AF77FF225F6
      4AF930FB9CFD6DFFA4FC200035FAFFFF5FF512007CF42400AFF686FEA1F682FB
      54F6F5F8B8F7DAFA9AF9FFFFAAFA5D01D8FAAB003AF9AD004CF67BFE8BF403FD
      E9F3EFFCC3F037FDC8EEA2FF58EFC501F4F33703DDFE87045B02AE03070144FF
      3602B1FC1EFD6BFF21F7A502CFF6130478F9CF0343FE880425011208B7FECC0B
      55FD760CD7FC140DE3F9940DDDF86D0A1CFA29075BFB4604E8FAB803C2FBB205
      00FBF904C3FC23056D06CE09A70A330B110A21070A09A602DC038D0056006800
      520141FE130391FA9E04AFF9F40547FDD207B902D00849064E07E90541034703
      B3FE13005DFDB0FF39FB1C00D2F48EFE8CF00BFE38F0A1FBBEF6B0FC5605CA03
      9C0A30050E086A01370728010403E70254019E02F80291011A036F001803EFFD
      3B0458FDC4051200F8058B01E206B703F4074B06D6078E035309BEFF210A46FC
      2408ECF84804B9F6C7FE07F1BCFFB0EE150991F57D0E8BFB0611B6FDEB123C00
      6F0F1602220D4202650C14FFAE09C4FA380557F7FEFF9DF6D6FD7AF9F0FF81FB
      BA03AFFDD9039CFD9202AFFAB904A5F8540599F5F602DDF2050004F217FB39F2
      0CFCC9F612045AFCF906A2FB590643F93207B0F991058DFCC7015FFF4BFF8700
      ACFCBC00E8FC9101D1005F056402190A0403160B5404E209AE02B308F1011305
      53060E010B0BFFFBD10D46F9E20E37F8CD0CE4F3C40D5BF4881590FACD18C0FC
      2E179AFA44164AFCAA124EFF830D98FF440B84FCD30A11F61C09CAF12608A1F1
      160825F3140892F38B07E0F380056AF3D703DEF1150451F2370446F38700C6F4
      67FA7DF6F1F53CF72AF802FC1900A701A00396FE5B027DF95B0093F8CEFCB5F9
      97FB6CFC7BFE4CFD5B00C7FAD9001FF76402F5F4210490F4ED04BFF4EE047BF5
      7703D4F5F7005EF27F02B4EFD00640F0600762F07602ECEF47FCC0ED6BFC0EF1
      0E0258F8E20499FA070527FD8B04FA0233FFFD0667FA9E0686FAE002C8FA9EFE
      72FB3CFC43FC69FDF0FC0A015DFF7C026A03B702EC04FA014305520182064D02
      62055F01A70288011EFECA0242FADC0164FD3103810542040B09BDFE1008A0FA
      B1052CFC5E0278FEDF01E6FE250557FFFC07B1002909D6012E0B6306680CB40B
      870A220C430639097602CC04FCFFFFFFB9FF4EFD75009AFB620078FC4FFE56FD
      83FABAFB0AFD66FF4D04E905FA07C908C608750B5C08AF0E66042A0D3EFEF207
      6DFB450213FAF1FBE3F90EF8EEFBEBF985FE4EFD1E02F8FDEC0447FFEC05BBFF
      4D0502FE870447FD2E0450FCC30066FD9EF65EFEB1EE7EFD34F3B6013CFCEC06
      ACFF700680FE120574FD6C0659FC020813FD2908F4FFE4061600220642FF9907
      20FF8F0A0AFF0D0E92FFFF10C0FFDB13F8FF5F134401B50D6B02790936038708
      CF03FC080C027D0792FE64044000A807FE076B0D5A0E780E3F12EE0E44134212
      E50E7315500A1B14D4094D0F6D08F8099F06D0072F07100A9D08970D120B500F
      B60D0D0E4C0EE50AA50C99081C0DF8073D0ECB03CD0CFEFD2006CFF7A5FE39F2
      E500A5F31708C5F4CC0B99F2F40B3EF43D0B22F9BA09CCFE2B081B028F066A03
      0602F50484FDEA0505FCCA08CEFAB80CAAF6B50E11F3C90D9FF2C20982F41E05
      41F9C400BEFD0EFFCD0082000802A7FF1E0329FD580702FFC00CA302EC11DE03
      39158E051F14D407EC0DF807EF05D50489021AFF540233F8E901E5F2980100F2
      410160F4080206F73F024FF7D601E2F43002F9F2C10291F2940218F29CFF17F3
      5DF6DCF28DEB6AF3AEEB67F9B9F13AFCDFF5D0F93AF7BEF961F580FBF4F2B0FC
      FBEF82FD6BEE7FFB6EEDC2F885EE65F9FFF039FC74F21D00C9F3650188F378FF
      35F335FC8CF348F82FF538F659F718F5D1F61AF598F27FF34BF061F17CF3C2F5
      7DF7B9FAA8FA29FC19FDD4FE7AFDF302A5F898053FF28604CBF000003AF06EFA
      03F018F8ABF01EFA75F048FE85F0BE00B8F0E1FE1BF1E4FA49F1EEF8EAF2C8F9
      56F675FBBBF7C1FEEBF30CFF7DEE2FFD6CF00B014EF6F1026CFABE00EDFC0701
      25FB6E0285F7CD04B8F46D06DDF4BA06A1F6FC0668F75908F1F6C10A3CF89D0E
      D0FA8F120FFABC1199F9240D34F99308C8FA9E0655FDDD0686FDC10780FBEA06
      9AF918067DFE3C0A1D04990E89078D0EF609550F50094110FF067F0D42041B09
      DE03CE02AF046CFB2D0516F8690460F9130389FB600310FE4804AFFD60054CFA
      9E0526FAA10468FCC3026BFDCDFFF7FDBBF81FFE56F06AFDBCF05EFFE9F3A201
      6FF55002B7F926050CFB45079DF96F0733F8580625F8D502F2F8DBFF28F9D700
      07FB610460FD1C0966FF580D10FFE00C67FE6F0893FFE002BD006CFD4B02CEF8
      1003E4F59D0014F4A8FC2CF3EEFFFFF7F6053EFD3109DAFDCE0B4401840C2206
      000B0109A90582095601980550FD75FFCFFA37FC8FFA67FD56FAA40002FC4103
      23FB400244FA34FFE1FB4AFF37FF39019A034D0152072300060520FD4BFEFFF9
      1BFE53FB44016CFB110446F8B5078EF82409DDFA4707CCFDDB027A0053FF6D02
      89FD11048DFE3107E101AD0CE503CC100D0472120501AE0FC4FE550891FE1F01
      F6FE64FE4E00E8FDA90105FD800264FA2E039AF7BA085BFBE40DF8FF4C100501
      B514C403FB16CF06F0134F07240C66050807FD015F05CCFAFD030FF4AE03A4F2
      88017FF428FF7DF7ECFD6FF5E7FDEEF15DFF15F3360280F5110569F765060EF9
      5A045AF88DFD47F6B9F927F86BF829FAD8F873FBBFFD8BFF3701A302C1010C03
      8AFFF50062FDC8FE6CFC21FDA9FC4DFDF1FEC1FF16013802BF016802BE008BFE
      5B000FFA9A0122F6C5044DF4A50603F37C04BBF09BFFB8ED0BFC3AEB6100C9EF
      850782F6770B78FBC90D2A02310E1E08790BC70A5D02DD09A0F90906BEF6D500
      BAF5A8FEE5F58D00ECF55D04E0F5160713F67105BCF7B501EFFA050196FFA804
      A805D606E2090B058D077F006D0026FD40FF73FF63006C00DD00E4FE6904D9FF
      9F074801EC0887029F05D102DB024C02B3036501AE03A1013803F503AB042B08
      0905860B58014D0917FFAC03F4FDD4FFA0FCE3001AFD1F03DDFDD90294FC53FF
      DCF947FCAEFBD100FFFD170720FF780AF802880D0C06370F7607110F3F04520D
      1100790A33FFA602150067FABD0021F97BFE80FB3EFC9DFCEBFB3CFA54FEDDF8
      E3004FFAD902C4FCF70425FE55064EFEF104B3FBDCFEBDF7E2FBF7F9D5F974FD
      EFF799FF96FACC02DBFDD6038B02F4020503A1004600D8FE93FF4FFEADFFE200
      D1004E074002B20C0B02120D16FFC307ACFD590386FDEB0025FE61FF94FF23FF
      DE00EEFDE4FF22FC20FD38FA7800BAFDCF048C02EB062206E10A260C230FFB0F
      6A12F6118C0D80107B05620CB00299068301AB02A802F903E60455066D061B06
      0F06E9013105B2FF4C06230157082504A20C65059511AC0485117800AF0B6EF9
      7E09A3F8AC0AF6F7E00A7EF5B70CD9F50C0FF5F56F11B4F68C0F6EF77B0BD1F8
      520AB1FA8D0A56FDD20A4F02F00A6B09B50A2E0DE4065B064301DEFCDCFC32F9
      B3FAC5F880FB5EF9A8FD8DFACFFCE0F7CDF894F14CFBFCF19B0175F86806B9FE
      940DB7058E13E508BC14D906ED0EAA022E089DFD3E0696F51B0603EE39064BEC
      C1040BEFCD01A5F3DFFE74F3D3FE25F2A7004EF3590226F5B804BCF75508AEFA
      55083AFCC9FF10F907F894F89CF373FC29EF340062F06E042BF606055AFC9A00
      C7FBABFB94F57CF83CF34AF774F3E3F907F56FFE25F60C0395F58904E5F53700
      2AF8E7FB34FBDFF88DFD41F77DFD59F7DAFBD9F611F9F5F3BFF261EE33F247EE
      93F6B5F373F71CF9ABF895005DFB3D06A6FFD20601FDE90221F44EFDD3EF19F9
      14EF3AF7EBF0D2F839F29AFBF9F026FC13F0A2F7E1F161F544F5CEF870F83BFD
      61FB320099FE560089FD81FDF8F6C4F8AEF561FA08F725FEC2F46BFF0EF30B02
      C2F3BE046BF83107FDF80208EDF32C0926F28809EEF12E0AE1F2170DC0F5D510
      F5F835112BFA380A7BF8F30432F76D0568F7F2086EF9720B31FC250BB9FDC208
      D2FCE503B7FEBC05EB03A10D1F06DF13AD07DE1821092F19DC0AF61436093110
      6E05980A2A0519017906B4F8390890F4CC0723F4AE054AF65B0221F3CC008EF1
      FE017FF4EB0344F8340741FC4C0C5EFE8A0FABFEB30A9EF90A04C4F7A6FE29FC
      71F73900BEF216053CF3CD0745F85607BDF98105B7F432036FF21A01EEF35301
      84F6A80422F934091EFA4B0B74FB2807E9FDED01A0FFA8FD380109FB6A03D8F8
      D405D1F6CC0536F65E0164F1A300A9F0F50336F7B904F3FC6B062D03850AAA07
      3911B10871117F075A079305D3FFA105CCFD220634FF9D06DDFFED0748FDE606
      E3F9AD0050F8E0FB98F8BCFBCDFA35FEC3005F017A074603AF091D0461061501
      E207F4FF560BDF012909A6029A07410476081505350C4504920B7E02A5030302
      20FE490249FE4D041A018008E803F80B41064E0A90065D0123066BFAD106FEF9
      0F0657FCBA050FFDF207CAFBBA0812FAF70438F58A03C7F2DF063BF7340864FD
      70094B04E90AA508700E8208680FDC0598083B00BD025FFACD0021F719008CF5
      39FD51F6ECF9EEF6B8F60AF382F5F4F260F7A1F7AAF854FB1BFA41FCC2FD0CFB
      0002F2FA3BFFE3F747FA1FF819F9C5FFC9F518061AF3590964F3020A79F7B907
      DCFBA602FDF8DAFDC4F519FB73F603FCE1F740006DF72D05B8F55C060AF7F900
      75FBD5FC3600DDF98001BCF62D019DF28E0320EF6004C7EDE9FF09E93DFDEAE9
      AAFF00F4F8006DFF74013A096604520F080B530FDE0D1B0B6D05560783FC2D05
      86F8220459F6E803AFF3F80417EF4E043EECC3FFE2EB4EFD4EEE6EFD9FF227FF
      D0F73801ACFE0D00CB02B5FE7300A7FA66FFBDF6A90394F87A035FFA7FFF99FA
      81FDBDFAB700B4FA9504F3FA08007CFC02FAFCFDB2F94A00EFFBBA03B0FCAF06
      9FFDAF0636FD0E0187FAE8FE59F9CB0177F9270455FA7F04BCFBA4022EFCBE00
      6BF951FBBFF8D4F7A8FD56FD020184052802130CA4030B102107A811A60AE210
      C507AD0C38032107FE016E02A60164FF6A0092FEB0FE21FD1BFD87F919FBD0F9
      D8F966FD40FAD4FF9DFC61011C025A01BE072C001B06F9FB7F025EF9A6036CFE
      E0005C035EFC840691FAD70898FCD2075001840681FFE5053CFC7A0545FDD006
      99FFDC0AE8FFCD0FDCFE4811EEFEF30CBE004308E502D604C502D1028D02DB01
      F9031BFF40059BFCA702C9F9000103FA3104A7017605650A48070010440C3913
      50130013641851114A128A0ECB09700BC106CF09000654093D05CB0A8B028C09
      7E014C030B029C00CA032703E405AA053F08EC063D0D0F0626115504AB0F2100
      720D31FBE310F9FCE7110901B00EB5015B0D2100C60FA5FD991375FDAA0F32FF
      4808F100360654030B07E8043E078C05F5079E03F00731FD7105D9F96203EAF9
      3B023EF96C01AFF98E0145FA1401E5F96EFD62F545FB5AF1280045F72C044601
      6E033D08DF03690A430728076D0B05031B0AF0FDC40584F7DB04D3F2160483F1
      190151F351FD8EF255F9A7EE5DF6ABEFD3F5FDF4B0F744F935FB72FACDFFB1F8
      B30319F8EA01EEF578FCBCF325FB93F886F9AEFE78F4130152F1470078F2DCFD
      92F59CFBF2F337F987F063F836F113FA29F3BEFD09F46D01C8F4F9013AF542FE
      E2F6BFFA87F92BF995FA1CF839FB0AF7F1FBA1F505FD77F565FA98F245F61FF0
      19F7B3F617F7F8FF4DF5520528F5110764F8EE041EFD8D01FBF916FF71F26EFE
      8CEFC5FDA4EFC6FC08F125FDEFF211FCD2F261F7C2F187F41CF13AF6D5F03CF9
      74F244FCAEF658FC04FB03FB3AFA15F7BFF75AF15FFBC6F57DFDF8FD6DF94000
      01F55A01E6F48F02AAF8E70472F785060DF38306F2F1AA063DF3B0078AF56109
      C1F76408ACF70704C3F4030202F33104D2F2CA0658F465083AF964087AFD5009
      3CFCD9076CF925040DFD48098E015D13F001EF185F027419C3040F15B8093810
      260BC60ADD0775040805B2FE5903FCF8690232F7F302DAF55A038BF3DD0296F3
      730253F5700200F8CB05A3F9130B4AF9680DC6F9330B12F9A8066CF7AA05FDFD
      4F05AC0619011C09EAFD3208FAFCFF0448FEE3017CFD4700DDF8F60038F65B04
      42F60D094BF76A0C3AF9860B96FA5B05F0FC50FF3B028BFD5506CDFCE708AEF9
      CA0AFEF5BB0BE4F311080DEFF60069EADCFFA8F0CB0151FD1403970467050508
      6B08DF08B40C53080B0C7108CD059F08F00136088AFFEA050EFD240447FCE701
      12FA9EFEFDF6FFFCBCF577FD9BF6440096FA3E0381FF3B03A9049D03B3068103
      3905C3008E082E06560C1F0FDD0B6311210AE211D7079410B7084010370A6A11
      14090012D507C811C7069B108505430F3905490B8D044005A302D60017034800
      96067B01FD09AA01F20D6FFE231205FA0813B0F42811A9EF58123CF54614D900
      E6110E08900F760B4B0F310B4412B5099B121506EA0ECA00310B83FA620792F4
      53040DF4AC0031F429FC34F459F7AFF6ADF42EFB31F31FFF10F403009AF925FF
      60005AFF8003C0FD91015CF9CD00EEFDE401FD06B6FEB60959F94909FBF4B306
      40F44104D4F65C0375F80804BBF83A0542F8F206B6F8670906FB8708BCFD2704
      62FE75FD31FF7CF8B80134F605041AF5E305B1F40B079EF3EC05C5F112026DEF
      E50184F6D0059303B007390A7E08E90DFB08DC0EC30AD50D0F0B730CF905FE0A
      DDFFA50811FB3205C6F81B0228F818FDAEF528F9AFF14FF704EF65F8BDEE21FC
      50F01BFFE5F3F3FFC7FA44FF6E014CFD5603A5F6A70531F6250955FCD008D6FD
      590600FFB20247FF10FF5FFFA0FCFB0091F9B104D5F5AF0826F42B0B51F6110D
      52FAD80935FC8203BBFABFFEF1F765FE21F72A015DF8B804E5F97406E5FB6905
      7EFB710233F86BFDD3F8950020FEE00AD1009D0FA201CB10A5028A105F04E50D
      A205B4091404F60585001702A2FCFBFC6AFB15F994FC73F59AFD1AF3BFFCA3F3
      FCFB61F72EFCDDFAE8FD05FB090159F8ED04F2F59E0741F6E303ACF6190018FD
      9701C706E9016B082D0007060BFE1B042BFD0504ACFCFF04CEFAF806F2F9700A
      3FFA140F37FBAF12D5FA47104BF9B709C5F84E01F2FA03FB80FE42F88800FBF7
      E701E3F69D0346F45503B0F28AFE10F041FC96F5C3006601A905E50623091308
      A70C5F06F6119103AA15D801D212A001F20BE1006604AEFF2A008E001FFE7500
      11FC7DFF2AFB99FECCFBE9FEADFD43FEE9FF10FC63036DF94608F6F6BF0C8FF5
      F80C31F1590D4BF37511C7FB6C12BFFE5810FFFFA60D83019A0D5F024810EC02
      CB1115054F115806890EE406640CEA07780ADE03130790FDBC02B6F8D2FE37F8
      54FCEFF9C3FBDFF9D6FDBEF609029EF1BD0560ED9C04BEE86203B7EB3D0699F7
      BA067C00EA0488045F047605530665033E0907FF1B0A35FA2109E1F33F06BAED
      8402A9EB47FFB9EA75FCEEEBE9F828EF85F582F200F33BF477F2E9F40FF69CF4
      C4FDE7F13D0471F0720171EF36FB21F316FA24FC2CFAD3FF1EF96DFFA7F61DFF
      CFF4B2FF69F61101DFF78001B8F7460198F62C027BF59F044BF55804E8F47901
      DFF372FD53F468FC85F597FEEBF6ACFF29F904FFD2FB1AFCB3FEB8F8AAFDA1F4
      46FC70F60AFE81FED8FEEE02B0FE010542FE2406B0FF70051701B20540FE9B06
      2FFB7704D5F974FFC1F983FA6BFCCCF588FE34F2C7FDA3F051FB5FF1E4F74FF4
      17F60AF8E3F7D9FAAEFC63FC280190FB6000DBF633FFD1F626033DFD55063DFF
      3F0636FEDF0127FFF8FD0802B4FD9D065CFCF20A3FFAD20CFCF7080EC1F7FB0D
      85F9DB095AFB1606A7FAAE04DCF79106F9F59E0ADAF5C90DB5F75F0E77FB1C0C
      72FF860984FE280523FDFF0392011A0A7F06640E5708FB0DC007DE0C3608470A
      B30A41066E0B2E03100B7EFFAD093EFB9E079BF6F2069AF1450735F01B071DF1
      4B067CF3B104CBF574033CF71806B4F8C30B1EFA910F5DFD760D14FFCF076702
      6106C309C407000B1C075B050D04040000007CFD8DFD47FD3EFA3EFEF2F62201
      8EF4BD06B5F2750B11F4A60B76F7CD06F7FA98FD00FF80F7C403B9F40B077DF2
      A5083EF1170A2AEFBD0AD4EE9106EBED9C00F4F0CA00D6FACE03F600F4046E02
      C6046E02EC076801990D4D01A20CE8009F07E7FF5D0444FF690073FDC5FD47FC
      D3FC64FDA9FA48FE31F8E1FF48F5E50079F52600ECF8D7FF43FE3E00AB042901
      9B052C0025048A01E1060909780AEF0DFC0B970DCB0A6E0BC409B909CD0A850A
      9309F30B7608BA0D8407420FDA04E90D7B036C0A29036B07B301E10428FF8303
      25FD060210FD82FEAFFF2FFA670576F5D30BDCF13D0C0BEFF20908F10F0B57FB
      F20BD903250C1007BC0B24096A0D5107491156024C1031FC990DECF6A20AFFF3
      BE05F9F0950007F12DFB93F379F5A6F57AEFCAF968EBC8FC80EB12FC30EF90FA
      A7F4AFF991FA0AFACDFBD3FAE3F782FC51F6FF0228F60B0780F493051FF10C06
      82ED740821ED100CC4EA260D36E98E0C98EBEE0BCBEC210AF9ED0F0974EF2B05
      DFF0E1FE0DF266FC16F4B1FC25F666FDB7F7A4FC28FA28F9E2FBCFF6AFFACBF5
      6AF8F4F9B9FB360543017B0DCE043C0FC806130FF008820F1E0C1E10FD08760D
      410335091600F903DEFBC2FC9CF854FA29F657FBEEF298FB96F01EFD27EEF4FE
      B9EC3C016FED9D0389F26E0408FB6C02A8FE51FDC2FFECFAA204DEFE6B084F02
      97070703FC043C06E001F6096BFF5C0BA0FA640B0BF6940C23F6E30CFFF53609
      DDF51505FBF7D50151FA68FF34F9410071F555030CF47305DDF45D0649F8EF05
      D5FD1704C4FF1B02A3FEB9036A00520A7603B90E4B04A00EEB03570ED004730C
      3708A209E0077E083D059408C0046106D0022701CCFFBBFE6FFE6EFD52FEEDFA
      DAFC14FA27FA5AFAA9F9F0FAC2FCF9FBDB029EFC3D0B6EFD3A0DBFFE60068300
      290135063600480A8700B90928015F0A3D02820CB703F60ED4002E0F5DFC0010
      59FC0B1125FCBD0FBEFAB40DC3FAD1072FFB48FED1FB80F81AFE37F807012DF9
      44031BFBE90513FC300944FCFC08DAFC30054FFEBA067A041A0B7D09CB0C6909
      ED0D040AE60F360BC1135C0C0412C10CFE0A120C53064409D702A505F3FFB606
      9FFF3F088D00BD06B7FF10051EFEF50398FD790146FF22FFB8034AFEA3095BFC
      D50B78FAA90A21FA760E48FEF1133303CB15B0035415FF03841304041513A703
      DF0FF703AF0BE8062F0D0E09B10F5A083110110A4C10AA0B5D0F050BCB090208
      53018104DDFBB60057FA37FC59FC2DF865004DF5B30217F5C90170F531034AF9
      6B06E3FD980510FF9303F0FF140249FD3D046AF9C30600F8D007F2F7490BD7F5
      FA0B27F1C908ABEFC204E4EF2501E3EEB9FC90ED83F844EDB2F559ED40F438ED
      0CF690EDE1F931F095FA5EF5DFF599F839F231FDDAF2DF01BCF3C4018DF49502
      6FF58103C4F5660222F39E0129EE1E0363EC87040EEB09053CE9E8062DE9F804
      D8E9CAFFB5EABEFC80ECBDFBC8EF21FBABF2B7F918F613F7B6FA83F50BFCBCF5
      D1F8F2F462F9ABF890FDB1FFADFDD701B8FC340244FF3001B40627006509B7FF
      1902F6FCDDFBCCF66AF996F0A1F765F015F823F239F97BF2D6F73FF358F5C4F4
      88F380F6D0F2BAF839F4B9F9C9F7BEF834F931F708F704F4BCF757F5C0FC7BFB
      15006BFE470079005BFE630291FC36035AFA640494F599067EF3550682F49003
      61F4EF035AF5BC0469F7280572F6DB0542F3380683F12B0518F37302B9F799FE
      2AFF01FDDE03B4FF240246012C0295059305D00BE605BC0D4405E50CC1050908
      3C087102820A6000CE09F5FFBD0BC1FCEB0D57F7CE0B8AF58708B5F4CF0526F3
      4C022BF33FFF62F476FDFAF5E3FD6CF7E002C2F8730B62FBF012A8FF9E12E4FF
      4A0EB6FF9C0B05012A09F6FE4C07B5FE5F0568FF02046DFFAA011000BDFB0501
      42F89EFF28FA7BFE4FFB5F02E6FA0802ECFA1EFD27FB33F887FDDAF3E301D4F0
      840539EE980778EC740AA4ED3E0BF0F2AF068CF5DE0408F84808F8FBAC080EFB
      AD0680FA4D05BDFC1608FFFFEE0CD901B8099F0026058DFB160561F6BF03F6F7
      C7012DFBCC00BFFCF2FE56FE6DFC7D0017FA1C03E7F8EA0538FAD90620FFC403
      ED039C00820357FCC005FEFBB00D0D03BF11350711129309F40FB60BAC0CC20B
      F309DB0BAC04880DF1013E0EB504690D250749106F089B12850ADC12E00A5E12
      4B074B10BD013F0D38FD360A29FA36088AFC59076A0174086C0101068703C903
      EA094B06FD0D8D07F10EDD06850D1C026F0D9AFB7C10EBF7F110D5F7BD0FFFF6
      5B1083F3DE0EB5F37D0BB2F3BB0963F25F086BF3E6067BF58D0444F77B01AFF8
      8AFFF9F96F005FFC92024A006900C9FFDCFCB1FF90FC7604DAFBD90688FA5307
      24F9850738F7D90787F6970914F3EF0C3AEE180F3DED2E0FCDED980F66EE7B0A
      CBF0C401D2F3D2FB4FF77FF99CFB4EFAD3FE88FBD500C3FC7C0208FF52046404
      B5029D068D010C078405D00AE707910AED08AB07AF0B8906C31134079A18D807
      1E166706F30B7200610458FAABFD36FA00F7D6FA84F45FFAD3F3C8F901F4B3FA
      3BF4A5FC2DF670FE2EFA34FFEFFE03FE160291FEACFDADFDB2F902FEBCFD4204
      1D01E508D801CC0A9101960A9EFFCF08B6FED5089AFA3009A0F59906C1F5F102
      00F7C60371F657061BF65B0792F6C606FDF4AE0418F2F500ABF2A1FDFFF627FD
      7EFDDAFF3C04BD06B9042B0A0104330B5B072D100408E5134905A9130302580E
      07021008C8053E05DB0644043B059401800559FD51055DFD960169FE30FCE0FC
      E6F720FAB0F69AF708F7AEF52EF82AF4FAFA22F43001EDF6BA09BBFC520D5BFE
      490B8BFD7C088D01C004BB050701C407EEFE940787FD3E0556FE5303B6FDB502
      BAFA4A01ADFBB1FF96FE2C022BFED6017FFBCBFC4EF855F831F7E4F584F9D3F5
      56FC4EF570FEA1F4440048F56F02C7F8F701B3FA4401E5FBFD04F0006706B503
      A6029F0432FE6306B9FD3B0829026A094F03130703FD010097F8DEF92CF94AFA
      CEF8D2FC47F881FDC1F79DFC2FF725FD80F6B0FE88F5C0FEFBF621FD8BFB2EF8
      0E02B5F3EC0457F0130636EF4F0CE4F5D611CCFD1A13D801D411E002260F2A01
      3C0E4A002D0B1C00E505D1FEEC04BCFE33086903EF0AF008CE0BDA09DD0BD406
      060A97042A04CC0430FC810403F8D502ADF7B101A4FA37013FFCA2FD99FC7CFA
      680265FCAC06B4FEAA05F7FD2B0247FB5FFF23F90A01D9F99303C6F915050CF5
      90079FEEBB09C5EADA0831E882068AE4B004B0E17D038DE2420237E69DFF81E9
      71FC65ED3AFBF8F329FC97FAB8FA52FB54F7E3F972F6AEFDB3F545023EF44002
      AAF3760080F3890047F45D0453F11D0AD2E8EC0CC9E29C0E00E2FD0F1DE24A0B
      7DE24603C0E362FD55E68EFAB0EA36FB67EFDAFB36F4EFFBD3F8C7FEA3FC8203
      7FFC87039BF9E3FF5FFBBAFF59FE5101EAFE310275000105E903FD089F0A970A
      BB0E0F09470ACB036B0348FF79FF70FF90FBE4FF23F805FF99F680FDA3F64CFD
      33F8DEFFECF86A0217F97903C5FAC403C4FC47046AFAFB02E3F6B80005FAB404
      F7001E0B4805340C9B072C0B37085E0A3108310BC4060A0D1301950C3DFC7F0C
      90FB5910FEFB441411FCCE128AFB9A0BCEFAAA0366FA25FFC4F86BFCAFF8FDFB
      5AFC8BFF5C023605C20523087805550895094C0C320EF110250D790FC40A7109
      560ACA02DE0DDBFEC512CEFB571458F70714EDF4471307F7030FDEF94A094AF9
      6E0432F6D40046F3160052F2EEFFE8F2820132F5160716FA4F0F90FE63144AFE
      A21420FB301574FC5113B200CC0C92FFB50500FBF40027F687FFCAF4F4FE59F8
      58FB77FBBFF74DFF17F9440445FB0504D6F954FE1BF6E9F728F41CF328F616F2
      00FA6AF173FD65F0440149F2FB05ACF5100897F675053DF512041DF91903D0FE
      42FDF8FF7DF92A0130FA1702D0FF6F01DA070E000D0911FBCE047DF65B029EF7
      650081FBA1FD53FE0FFC5AFF09FBA70180FB830483FA2704CEF8F1000CFA1AFC
      63FF48F877046FF52E0575F3C30803F96E0EDC01BD0F0E05E90E3E06500D8905
      B90B5804D20A6D046F0620023901FA007901510381040506EB064506C0060E05
      48051805CB03DF05BDFF6D0546FBD604B4F8C9065FFA910977FD750813FE2604
      7D023504D208D106890909042B07AEFEE40446FA3A0533F7EB07CFF3B6075FED
      EC057DE8A807CDE8A60AA6EA5A0A25EC340772ECA203F5EC55019AEF0FFF3CF2
      CEFC0AF69BFC2FFB57FF6BFF9900AD00D6FD18FFE6FC0C016EFB4D05E5F4BC05
      53EDC806C9E71A0915E4730C2CE2D31005E09111DDDC931163DDAF1136E03D0E
      A4E243076AE456FF11E775FA5CECFEFA02F176FE07F46D0478F6C30BA2FA0F10
      ACFC740DC6F97A0470FA6E0049FFAC013C0117020D032B05EC066D089F0C800A
      BB12BD0A1D127E06990B42025D062F01B602D600BEFDD5FEC8F825FC26F5E2F9
      11F560F9ECF692FB61F836FF40F9F00115FB7B032EFD800367FA38012FFBD703
      6A000F0A3101630B6C01200B1002A90A09028B0A9101060A61FE30073BF99406
      E3F6F80822F846099EF83B04E1F701FFFBF781FC75F96CFB99FA9AFB82FB65FE
      B0FCAA0489FF9A0A6602060E0102270E2B05F30F5A0B2315F60BB215B609B011
      CB07880BC807D905B30A4403CD0BC90148087802C003EC042F025905D0002A02
      21FE61FD11FCE8F909FCF3F7DFFC78F794FDC7FA14000B0163064B06C10C1B09
      E50DDD08460FCA097F11B60BC30E9E07B6093802F205D8FE5F04DCFE2A05DE01
      9C05A0029302B6044D008607020168063801B201D2FF3BFD80FD11FCB0FDAFFC
      B4FF05FDE10109FE230597005E0A0303B70E55043F0D7E02FF0A15012D0BE204
      7A0859083205820A14058D0B1807D60AE00A97093B0C43058507CA015B02F201
      1B000D0399FE5E03A8FD4F03AEFCF7019EFD3EFE68FE12FBEAFE71FA6F0127FB
      CF06FCFAE40C82F9D90CAAF6290E76F66013E7FBD4135B000512B40156113202
      23116402D811030236126EFE5B0F18FC1A0C89FE2E0DA602400EAF04A90AFC04
      CC04DE053E01B10589FF1D0431FEC203D4FDAB05B5FE010749FFF7066AFB4803
      5EFA5FFF53FF980264012205D50118033F020FFFBD01EBF73002A7F08303FEE9
      3C0302E62B022DE6930312E6CC04FBE35F04A3E15B02A5E0610055E287FF12E7
      A9FEC7EEE3FEEDF71101FCFD9F02000116FF66FFC4FC09FCE0FE81FF8FFC8D03
      C9F56B05CEEE83078AE99009B2E6BF0CE3E47C0D43E1670E16DC210FB7DA220B
      10DC2B03DCDD9CFA96DF67F57FE2F1F2DAE72EF3DFEC17F687F1D5F883F640F9
      33FA9EF992F9DAF61DFAB5F294FFA8F6630122FC1A00F2FEA8FF890084008201
      9104ED012B0982FD6B0995F929057DF83302A5F7460173F53AFFECF13FFB55F0
      10F87CF1B0F573F5EEF1CEF99AEF41FC58F133FC1BF5D1FC88F530FCABF609FB
      CEFCB900F3FF54051100D505550171066002E6077C03DE0A6703060B08001A0A
      1BFAC60884F63306FDF5D001B1F520FC0EF5AFF82EF5C3F601F691F72BF62CFB
      3BF6DBFF8CF73304AFFA12084BFB060814FD46066903A10B81064A0FDC06B30B
      020843054D0ADFFE860DFDFB980F5CF9350EFFF8ED09B8FAE007BAFA650892F8
      1E096FF465075FF1E10330F0DE0115F2DD00CCF639027AFBA006B2FDAB0C42FF
      AE0F1AFCEF1165F469165BF3E21535F5A911F1F47B0E72F5170C10F808091CFC
      8A05C1FD050197FE93FA3BFFFDF652FDCCF788F883FA7DF279FBB4EEBCFB63ED
      7CFE18EE6501DEF19D036FF7C306D6FB8C08B5FE59033CFCA9FC09F7A7FCCFF8
      2CFD3EFDABFC9BFFE9FDCD0081FFEA003A03EEFFA30746FCBF081AFA250555FC
      CD0186009500FA02E4FFC90043FE40FC16FB82FAC6F92BFC9BFAB9FEACFD0600
      35027BFEEC06AAFC8D0793F9760693F7590A38FD990CB804850BD8081B0B220B
      7B0ADF0C6C0A260D030BC709310A8A08F806A90CCB038D114002F312AD001811
      56FE260FD3FC830DEFFCB10D6AFE6C1091FFE8135C00B915D00132163DFF1213
      86FB8C0E70FD9410F5FF0F123E007C0CEF006203A40178FBA90313F8B20779F6
      180C23F7BB0CD4F95F0A25FB280AF6F9D20A23F77F091AF5570639F5E80425F9
      6A0504FF8D061D0494095B07A90D8008E30D0D06750BAA02440BF405A5073D0B
      FDFD3F0DACF3380E63EC630F8EE8B211BDE798115CE80A10E5E6240F99E5780D
      43E8DC085EEDF00044F112FC9DF263FB73F49BFD68F7210182FAAC037AFEC204
      8B03B9036B06B4FF270699FA100946FCCF0B1A01EA0A7902D7097C035D097F04
      320C3A069210E805B312E1030810E1038F0A5703E30665002D05E2FB2F029AF9
      58FB7CFB96F3F4FFBBED4A0340EC4204B9EF5103AEF58A01C7F8D3FF2AF8D5FE
      4BFB5004FDFE640BDBFD290D78FB3F0D63F91E0D17F9050C46FA7D0502FC29FE
      51FCB4FDE0F98FFF10F92D006CFB0FFF5FFD8DFDBFFCABFDE8FAC2FF8CF9A703
      B0F99307A0FA1F0ABAFC0A0B6AFDFA09E4FC2F096701ED0C3A06211147073911
      B507020FA7079F0A7A061F078902CC024CFE18FFA3FAD3FFA3F65C00BFF760FD
      69FDD9F6D10137F28D01CAF124FF6AF543FE19FC89FE1A037E01A807BD064407
      8F098C010E089AF94A08C0F6CB0B38F7A90E3CF6550FCCF5380D0BF75E0A81F9
      330616FACD017CF981FDF6F91EF806FB6CF534F90AF757F36AF935EFDBF81EEE
      7EF829F2FAFABCF9E0FD28003E0002037401B001C5FF5CFE43FCAAF94EFDCCFA
      64011201E2011D043500FF045FFD2605D2FCD4045FFF8902A60039004EFF0901
      D9FAA700D6F6D4FB56F692F52AF6F8F2F5F3A5F40DF3AFF995F4DAFDFFF6F600
      63FA2D0238FFB3FE62029BFABE0011F6D801ECF6FD05BEFC280796FF1A08D700
      6708D3013F09C603130B1B03DB0C9D01DB0D5F040A09E807E600B90800FCFD05
      DCF9520361F8F9015AF8350363FAC006A2FD8B092000570A570314094C056308
      5001B707B0FE2308BBFFC60728FE1C03B0FBC5FC08FA20F675FBF5F13400C1ED
      CC0591EA340A1FEBEF08EFEA6A0519E82A05C4E3EB05E4E2070495E5D50008ED
      FAFF35F7020109FEE5026C00F90665FFE00968FDF80731F96705E2F8210338FF
      DBFE1B0496F96507F4F2140B8CED930FA0EAD011DBE8C110CDE75D1071E43310
      ECE0930B54E20502C7E5B5F952E6CAF241E6E3EF18EA33F3ECEF04F8A0F53AFA
      36FD34FAE2025BFBE50146FB0A019FFDFE037C049D037F079201A7064700F405
      5001F0055A065804DD093102B50BDA03DF0B6D064F0AC004F60A88FF600C0AFD
      1107D8FDE8FA73009FF0260473EB810700EBD80706F1CE0578F90E0631FC5E05
      A3FDA607C403680FC507DB14E1085717D4070E189205E2158B043D113A03270E
      40045C0F6105F210BB04200E8A05A607CD06460180053BFD440156FEFFFDEC03
      F2FD8C0993FE230AA20155070E05D306C402900590027605BA08DB093C0DE20B
      610FAD08630F6E03D20CDDFEEB0B24FAC60C66F76F0F0EF9711130FA581095F7
      1D11B0F2B813F9EFDA12D3EF5F0EACF23C0A39F8DC0861FA9009C3F6CE0D4CF1
      FE13A6EE3215C9EA6215BAE86419C7EEC41BC1F47A1B7CF7FB1763FA4512EAFD
      F30C54FE9F0686FB6400D0F9B6FAEEF85FF53DF66BF456F1EBF7CEEEE2F9D4EF
      8BFAA4F5FEFCDBFD96FF23023EFEB8014BFA0BFF89F6B4FDA3EF04FB46EBECF9
      7EEFEFFF1CF4220479F67403FDF7140283FA2F01B5FF5C00910221005102C901
      9500C4006DFCB3FC2AF938F7E2F993F482FAB9F6C3F9D9FB46F93302F2F9C504
      88FB23038CFFE8FE2B0504FCDD04F8F83C0357F7920740FC590A3200710A6D01
      BF0A17047C09F8065509E906C7090406DC09AE086E07F80ADF01CB0A40FF5008
      A3FFE104F6FEBD0302FD7E0757FB840ED9FB4D1189FDF80E9E005E0B4304260A
      3F017D068FFCD7FEABFDFEFC5FFDD3FCF2FAB4F8EDF9B0F47CFA4AF3F1FDC0F2
      8D0173F2B704CDF4C50692F5C904E5F27702C6EDDD022BEA1003F1EA8902E8F0
      400277FB24039E025404D6045E07FA03900C6F03FE0AF501B4034500E3FE8304
      BEFA650856F55309ACEF610B8CE9050FC8E4A010E7E13C0F4EE19B0EAAE2E90D
      8EE2710BD9E2560592E52FFD95E643F727E632F8A1E7DAFD4BECE7FF8EF20BFF
      06FAA6FE9F01D1FFE60138FF18FFFBFDBE0297020C065F068C05D6042B05C002
      3E056D026407870298095C03C009E305520A2A06790AB7024F0957FCAB074DF8
      0703C0F85BFDD5FC50F77F0274F13E05C4EFC704C9F3A8029BFB3C03F8FC5103
      9EFAB80269FF60079704140B59052208C7041E03D70264FF330168FB9F004DFA
      9601D4FEEB03E60360039805C8007E02F10097FEB80195FCD200AEFE38FDCD03
      49FACA0492FB5904FBFE9904B1045D07A105980AEB02830B1606501088093215
      1B0943141E066F105001080C4AFE5B0648FCA201BAFBA7005AFE7900C20074FE
      D501DCF97D03ADF6E5048BF7C8046FFE9002F006E6FF460859FEA20603006D03
      8B0623019C09F5FE220A5FFBDE0EAEFCE11278FE0D1513FE421678FFA014EB02
      60116104C90DE20280096801E5055400CB017AFE00FDEAF9CAFB20F654FC13F7
      2FFD3AFE15FE1D063AFECA0773FDC30680FEB2049102A4034C025D03E3FFAE03
      C403E0097B088C0F4507EC0EE904BF0CA7035F0C3205D00A3B081B06A707B002
      950649FF2206A9FA0504BDF52203FCF3480387F7F201CAFCBDFEC10020FBEE00
      F9F912FFCCFCC5FA68047CF60D07E4F24D04DEEE3D088FF1470E44F82E1193FC
      62131E00D7130E03EB129F034511B702BE0DA603CE0AA804FB072D03020320FF
      940141FB6C03DFFAE7041A005C034B06C0FF9A0670FFBD05FD014A0468070403
      0107E401BE00F3FC1E0039FB3900EEFC3FFD66FA7BFA3DF65FF8EDF25FF80FF0
      6CFBFAEDF0FFE3ED1C0520EFB20810ED9906CCE7B70239E41C0160E69500FDEF
      BEFE64FBE8FB74004BFA54021FFB0102E70044006D0127FF3AFB48FC15F9A2FD
      F0F7AC0248F78506BAF8400B9EF8B010D4F47D13A2EE911162E8441074E4C40F
      29E4710A7AE3D6FFAAE315F429E6AFEC87E80CEDC2EA3CF1C6EDC6F2A2F114F4
      CEF552F4AAFDA0F47F0175F67DFE1FF768FF2CFB3B0143FFDEFFF5FD7AFF9EFC
      920094FE5003B7004808AE01130BCE031A0C5F05F60E9303030EA5FD8309E8F7
      AE05C5F6FE002DF93AFA79FC2EF2E3FD7FEC7FFFECEAA3FFB7EFEDFED6F33B00
      5BF3380055F8DF029EFF46088602B0095C032A097702D2082700C50651FE8004
      8EFD2505A9FE3206F601A0040703C9FFDF01D4FAB901F9F95A0146FD7AFEE300
      ECF8380101F6DD020BF71605A5FC2A079AFF9E0985FBD707ECFC2A08BF004F0C
      F8FF070C95FE7A0931FD1507A2FC30032BFF60FFFC038EFEFF08C8FEB10D6AFC
      9C0D5FF8060A38F594085CF5FC0798F743065FF8E702F3F44901E9F1D102F3EF
      0F0977EEF40D41EF5B0C19EE170E9DEFC210EEF46B11FAF7C5131FFBBD14E7FE
      E311E0FE4B0CD5FA9F0735F97104DDFA1E04F0FA100382F776FF76F37BFE4CF4
      F7FED9F9E3FD07FFD5FAD3FF19F890FE05F68FFBF4F7C4F847F9A2F9EBF4A2FA
      2AF6A3FEB2FAA704C4FA3D0544FA6803F9F96D02C3FAC1005FFE1AFEAB01C3FD
      E00165FE0603D2FC27047CFA7002C9F8ED0148FB1C029BFFA700450209FC0404
      FFF7F304FDF7460346FD4FFFAF0284FC3201F8F87B02F4F88D06E6FE81071E03
      3409B806030BBC0A300A140C3206DD0BD3010F0E2FFECD10BBFDFA1014FF6D0F
      39FEB10D25FFAB0F7E01EE13AA016916E1FD4A15EDF96512D7F9A00D8CFEE607
      3E03E003900085FEEEFF60FCEA02B200F801010220FF7D003DFB6000BDF85FFF
      D0F815FE83FBBCFEB4FF02FF4304EFFAAB0751F5EE06A2F24E062FF76A088901
      FB0AF90A5D0BC80FD909D1107F082E0F6909CA0C4D0A390C0B056B0994010908
      FA00450C32FD540FABFBD711C0FAE51563F797175FF198149AEBD71097E77D0E
      8CE6FF09DBE86C02DBE830FAC6E9F8F61AED62F896F0A5FA1DF3CDFB95F4EEFB
      72F700FC04FE9AFBC5047BFCE00411FC6205DCFB5D09CDFE780A3AFF3C0AB0FE
      6809E300EE08FD021D0B3D03870F4C049F114105A8101D03E90F8DFF230C85FC
      0207EBFDCF0329017301FD0314FECF06A9F904084AF6F107BBF61106C2F86404
      23F69F00ECF5EFFDB7FB40008AFF270126019B01F7013403FC004104D5FEDE04
      EBFCC00624FB940866FA44074FFB3703B6FA9DFEF8F960FED0FA1301F8FBCE03
      33FA01067CF6BE0778F6B209CFFAF00B2C01E80ED501AC0D33008A0B49013A0E
      A5FE060E92FB660B52F98E097AF777064FF7A101B1F927FD15FE7CFAA30158F6
      C90467F14904A0EDAF0173EF4C01E9F4A00282F923023BFCBFFFF9FC7AFF2BFD
      BC0312FC430A7EFB710B7EF80D0C39F6FC0F63F9EC107DFBF01287FC6C163DFF
      A717E0003D15B1FE8C10C4FC3F0CC4FCC807A7FAEE05B3F64D03A1F24AFE4AF3
      C1F94BF811F76CFD4EF5A70089F29B01C2F1BD01FDF4D70051FAEA0068FB5B00
      28FBAE00C1FE8604B9FF6504A2FEAB0007FE04FE81FD7FFB85FEAAF83F017BF7
      B50367F83F0411F83D068FF600075FF5D20486F71C02B4FB9CFFDEFE36FC4300
      04F79AFF3DF454FF02F703FF3CFEDCFEFE01C2FB960311F95B0906FEFA0C0F03
      900E5B058B0FA408300DD90AFE081E0A2F04EC071F0129061DFF1F03BDFE45FE
      FEFF2FFB5900C4FD2D003E03AF00C60559FF3B04FEF9A2014EF6AAFF89F7F1FD
      57FC73FD1AFE3AFAD8FD56F72A02F3FBB20392FE64028EFB920099F8BFFC93F5
      C5FA2CF2ACFC66F04F0221F0810803EE140EB8EA941015E83C0E20EA720A12F1
      8F0898F7010787FAC002F8FAADFCEEFA33FA58FAC3FC9CFAAFFCAFF87AFB04F7
      B2FD90FCC7FD520334FDA10785FEB60D09FE7011C9FA200E63F51D0959F09B05
      5AEBD70049E9EAFA9CEA5EF569EB83F3DDECFAF407F039F692F3ECF5A4F4FBF4
      E6F366F5E5F464F6F5F860F90CFB6CFB52FB35FC7EFF6502690248086102D709
      86023E0CE901560E5F023A0DEE05D50A9009E508F908A1054708AC0100081CFF
      E20559FFE502E10042001D02F2FDF702ECF86803F1F36903D7F11A01C6F28700
      C2F2DE0024F23A0178F7A10868FD68100D0122131A058215540709179C076F16
      B5064E15ED05A2140E05AF113D056A0CA607BD07FE08B506A208240A000A0C0E
      2C0B930F7F0725103E0288108400480F30035D0E3604B90B5501BC073B02850A
      9B02300E8CFF8B0C00FF570A6FFF5107B601B402E80591FE5D0B8FFA151013F4
      181364ED0815E5E7641386E59B0F9FE80F0E18ECAF0E88EC6E0E8CEB0A0E26EB
      920E5EEA0E1280EA3915C2E9AE156CE7B41874EBEC19DAF1EB173EF59318F2FA
      181AC6006B1A6801C71733004414D900E61055FF0D0E3CFBD40C46F7F20757F6
      86FFEBF937F924FE08F6CEFFF5F385FEFDF1EFFCFDEFB8FBCBF029FD26F13DFF
      E3EE1EFDE8EFE7FEB8F0A30280EE0C0155EDC600C6ECA7019FED400069F1C5FF
      ADF7270274FB99030AFC9C0223FE6500F4FF82FFF6FE860096FC4600D3FAFAFF
      CDF65E00F1F19602CEEF8D029EF25FFFFFF720FB02FAA8F4E3FEA8F45304A4F9
      0A04C0FC3503D501E002B7076601B40A22FF1A0C21FE000D5DFDEF0B86FDC409
      4C00030898035408D903130A2603FB095F045F079702D702A9FD5FFF67F9A7FC
      8FFAAFFB6FFFACFB72011BF904047BFB020659FF130351FD3DFF02FB5FFA7BF9
      3EF698F793F465F73BF6E4F941FBE6FAA100F4F8510664F6400A4DF7020AF4FC
      2108FC0133074C04D20356045D0003045EFDAF02D6FC3F00C0FF59FDF2FE9BF9
      5DFF19FD8EFE4F0582F8580769F5C0089CF4DA0BB1F3170ADAF031076EECFC07
      4EE881080FE5600723E6BA04A4EAB80339EDD2056CEDFA05A5EF87039DF2FAFF
      50F47CFE4FF499FE8DF6A50092FB040488FD0804A9008A051304C6088703A607
      B602B106F1015406930006030EFF990107010A0408040806F9027C0482029400
      21032B009101840217FFC303F7FE460410FFC102EAFDE502A3FB9F0131FA5AFD
      B5FB33FACEFAF7F5BFFB51F79200E7FDFF032301D707D103850AB406990A6A06
      D0075605AB03FF04EFFF1F0327FD78FF02FD8AFCA1FF28FF0401170559FF4609
      2901AF0BF903FE0B6703990BA4008C0A84FED20A98FF230B08009F086200590A
      AE00EC0E96FCA30EA9F7490C8AF5770972F5920321F7ECFB6AFA3AF6D3FE25F3
      BF021DF0420523EDE606E6EF340504F81801E3FE01019D0393027305AC03F804
      8B0331030E0478002408DBFD6109E0F9A80B96FA1410A701720FF6056F0F3C09
      0A12B10CDE14630A0E164705891321037C102A02DB0C36FFA307AFFA0204A9FA
      99FF1B0060F7D30472F29F0746F237082AF4250997F4B50935F56A096FFAE709
      1FFD7E0723007D06B6048608AD047C061A03EF038C015403AF01C1001604F2FE
      79081400200D1A023A0E7301070E5FFED40EC3FD4C0EDEFD790A16FD6D066CFF
      530337037F005A0679FC090686FA53025AFFB1FD8203DAF5B4070CF2CE0D38F5
      C30FB1F7691045FBC71069003C105B013D0E10FFCA0AA8FDCA07F6FBEC05D6F6
      98052FF1AD069CF1930742F6DC045FF9BF0347FB320518FCAA0442FC9002B6FC
      AA0167FE0D0576FFAD0720FC550841FBD9097BFE4B08B3FD580558FA8B0318F8
      2F02AFF6AA01FEF5B801D2F6E30391F7960698F48208C4EFAE0A23F0AB0A01F5
      F104A5F83CFEB2FB80FAD9FD6CF7D6FF55F30A01CFEE510090EEC9FF2DEFADFD
      7DF04FFE48F66904B3F7050983F5280D74F53A1002F6A20B06F69503F9F247FF
      E8EEE5FD91ECE0FBACEBBBF89EECDBF8C2EE70FB24EECBFAF5EC20F7FCEF27F2
      65F4CEEFB5F584F191F404F772F64FFED5F7D90023F97C020EFE7807E400F008
      8102AE071403B1067F027803E202A40091044200F10767005D094AFDB5081BF9
      AF08FEF9CA0740FB9303C0F860FEC5F768FA44F800F836F905F564F965F114F8
      F4F1ABF9DCF2A8FA8FF4B4FD56FB12071D003F0DFD01940F9A03ED10B104120E
      6C0515099F041D065903730548026A03A602CD005C04EF02F905D806D604C107
      D6020E078104670587053B04A5FF7604B3F727062AF6BE07E5F64F05F1F69E04
      4DF8030B0BF78510B3F36C114CF2210F15F4F7082FF836022AFD3DFD3A0483F8
      E10A85F0500E4DE9990F8BEA0D10EAEF3E0E9AF3FD0A38F5F70951F4C10A8AF2
      E60A9DF0BF084DEEFA08A4ED4A0ABDECA50B80EE4112A7F74E15E1FF68120F06
      FD10E40B8711630A9C12E4038112FBFFCE0F04FE320BCEF9E50767F5E1068BF5
      FE06CCF8F10264FA20FB90FA65F718FACCF7D6F802F7ACF79EF370F82DF3A3FB
      BBF3C4FB0AF363FA33F5A0FE74F5780272F4BF0220F64604CFF8C50475FBC204
      1AFE52067002850775057D045105DFFF4F058400B306D3020706CA021103F602
      2A00AE0334FDCA04EEF8F304B7F3A801DDF376FE1BF6AAFA21F60AF8AAF940FD
      84FD2503E1FE39071200DC0C2700990F0AFFFB1036FDF5121EFC5612FBFB510E
      67FD720A6300A20A5903590C9C03190C7201B00AE1013C08D804500674047605
      97002204CA00660351023D00C50226FD130573009F03160434FF2604E4FB7704
      EDF9800417F95204C7F83A06ECFAA8070BFED8044A014B01E504F9024707B306
      0D067E08F502020952022809090398090E02A308A7FE9A06D6FD3C06A2FE4604
      74FE5201AC00D505F1004A0CFDFBFC0F04F7E513A8F49E127EF3FA0D18F4040D
      E0F5BC0D51F6880CC1F5E00B6CF4B70C77F38F0B76F2B306BBF06D0000F343FB
      23FA9BF8EDFF7AF8D50093F96201B8FCFF010BFEAD000FFCBF02F8FD7105D8FF
      B305C6FD270546FD6D032FFC9D0289FB1503B3FD7906A8FFF6094EFF460ACEFD
      D708BFFEA50871FF7208A1FE3C069BFE470578FE3005C0FD8804ECFAC701ACF5
      610173F37D03A3F34005A4F34E0BB8F9AD0F62015C0E5105820CDD08E20A0908
      E208A805D6058C060303B707FCFF9C06BCFC1406F7FA510950FA060C7FF9A20C
      AEF7450C85F8030C29FC4F0CB1FC4B0B3AF9030980F7400776F7F60341F74D00
      4FFAC90328FB410872F67B0622F1AF0234ED9BFCF9ECECF6A3EF56F405F577F1
      E9FA7FED3DFF32EB7C034BEEAE0719F4780A12F918084BFCA90409FD580430FB
      BF0413F7EF0413F41707A0F5650ADBF8660C53F99B1193FD8C1619047A156506
      6E125C079410E30322107CFEF70E0CFC7A0C62FA52080DF97404F8F8A90173FB
      22FF3FFF00FC500189F5E4007CF06EFF42F17BFFF1F3FF0032F4D102D4F4FB04
      75F652032DF686FDF5F813FC05FD05FDAEFD3EFB06FF3AFA290049F8FD00AEF7
      8C0269F9E10557FA120A9FF9660B0EF8F1094EFA2E08CDFCA806A1FC6402FAFC
      5AFFB2FECFFD390120FBB00222F8000120F6AFFFA3F5CFFDE2F512F9F6FC88FA
      FE066BFF390CED019D0EFF04BD0E6904050DB501D308E5FF56050FFD8703D0F8
      1E0230F6DF0149F8A60114FB620239FDD30118FFA0016801890587032A095503
      67079701D803B1FF1D01CDFB60FD5AF5C9FE42F53102C5FAEC00BEFD7DFF05FD
      85FEB5F88CFEE0F40FFFD7F2660169F16A068FF04D0A96F05E0B8FF3DD09B4F6
      410988F86B0623FA8F0164FBAFFE26FCA0FB91FCCCF8B6FB10F785FB83F6C1FD
      F1F65DFDFDFB2C00D402A506B803D9089701BA0854FFBF03A3FE95FCA9FEB5F7
      B9008CF53A0281F699FFF5F8DBFBBFFB28F70DFC84F4A3FA88F184F9C5EE9BFA
      B8F0EBFB07F551FC92F8C2FD80FAD70063FA240425F8A703E3F9260511FE2708
      47FD68078AFCFB05DDFD98027CFF76007501A7007204AE01290924013E0BC4FC
      A10982FA7305A5F93E02F7F73AFEBBF6D2F918F76BF801F9A3F6B1FBE4F590FC
      59F7B2FD42FA5E01F8FB1002B6FF3E05D005730B8607B00E9F0726119507D610
      ED07A60FA5072B0F3308AC0D730A380B8D0A4709EC090A0BFC08CB0CF509D90C
      C20A580C6308650CD505760CF8042A0B2E04D0091F01D2094AFD880AEAF8C907
      F5F87E074DFCD20C98FACB1082F81210F4F7E30956F9E600B3FCA1F8E5019EF2
      0E0A82ECDF0FE6E66E135DE5CE1503E638171DE7301533E85D0FA8E8FB0AD5E7
      300921E7630AD7E7670DBEEA3B0FCDEF8C0FADF1D81235F59C1845FE231A7904
      D7180B072716B5053C133D005E0F70FA4B0DDAF6581024F5C41049F5550F68F7
      F90CBDF7550BBDF5DA08E1F27502E1F248FD8BF40BFA54F74DF825FB06F615FE
      26F2CC01D3EC140107EBC70073EE330552F0C70723F1930831F1EE06DFEF7104
      71EEB20368EF1805DFF49206BDFAF405FBFD3F068DFD680502FDCC013FFCFFFE
      1BF91CFF72F69700EAF2AB0117EFBBFF3CEB57FCB3E671FB68E495F901E8C8FA
      DDF0040281F668085CF86E0B6FF9EC0954F98E0750F845077CF7F30628FAB305
      3EFDA40381FF1204AE01EC030004AD01B106BBFFCE07DBFE3308E0FE660914FE
      A60A37FDA2083BFC810467FBECFF05F9E9FE1DFAB9020202F7014D0807FEA009
      79FA6D0662F791015AF693FF0EF79100F8FBA100190128009A02FB01D5022603
      4C035A0378037002F0019C0031FECCFED5FA7BFB48F9B2F897F8EFF83CF77BFC
      1CF49CFD21F46AFEACF7020633F8FD0CE8F6DF1066F5C21009F4E60AEAF4C206
      B3F6F50670FA1E0934FB5D0C73F66D0F41F1FF0E02EFF60CD6F0230B6CF2460A
      F6F26D0963F5A807F8F8AC06B9FBBD05BBFB470661F8650318F7FDFED1F88800
      FBF7B80259F7F903BDF84B0363FACF0073FB7201ADFB6A033FFE20042A010D04
      82028D05EA0183061D01EF025F02E1FC7302C0F8B000F7F578FE55F3ADFD8CF0
      C9FF14EFA802F3F15103C1F28E0586F30A0C23FBE60FA4042B104F0CE40F9B0E
      1A0E0C0CA40AD20954061A092F04E20950034D0B9101C20DF0FF910E87FF5E0D
      B5FF460CB4FEC10B41FD920BFAFD9D0930029D070D057A0682025504F0FC7EFE
      89F934FB73FBFBFF1BFB6B0696F59908CFEFEC0364EA99FCBBE71DF9F9E8E4F9
      D6EF3AFAA1F9CEF9CF004AFB320529FC600726FC8E079AFBC80549FC390117FE
      10FD9FFEEAFD05FFE901F5FF180630036306F9035307D703830D090A16112010
      34113012B40EDA0E300879061903E300330126002903C6014E06D7056603260A
      A5FDF109EAF8A0070AF652050BF5100590F2AF0643F212071AF7C5079EFB2708
      EEFB190984F7250683F5C60013FB7902D2FF17078001E5096702B208CF018405
      5C01AC062802040AC9069D0B8E0CEF0A2E0FFD09AD0E6108850B270599092702
      810984025206D50452013A0575FCA302E0F81DFFC8F805FFD1F8DCFCADFB13FA
      1B042DFDB60A8300010D1101E90C03FDC60AE0F53F080CF276056DF0EF03C4EF
      3A033CF18A01C6F4180170F79E037AF8F908D4F9B50E73FB5310A6FC1F0FC7FB
      F90FAAFAEB1037FB2A0E3DFDA6078DFB7903E6F80F068EFC6908E60132062803
      BA0385FEF0016BF8430179F5AA025CF51D062EF5E509D3F58B0B00FA6C0CFDFD
      7E0C0400360BF2FF5A08D9FE940126FE1DF836FD9AF254FC94F1AFFDB3F22602
      CAF2B602DCF22A00ADF817022DFD5D05C6FD3D056AFE68017DFD68FB60FCCBF7
      35FC71F888FD62FBFFFEE1FFA1FBE903C4F5340476F260021FF1070011F2B3FE
      B8F1B6FF1AF0EF0166F2AD0427F6870569F84F0548F63601E8F189FA7EF3E4FA
      82F8D3FF44FC7A02280098007A02EAFB0A0334F9DD02FDF85D0490F8060815F7
      4B09C5F68208D3F63A0688F5E202B2F38D01B3F40AFF39F8C3FA2EFAB0F98DFA
      A7FB46FA1DFF4AFCB1FF8AFC1FFECEFA7201AAFFD806D2083C0A8F0E450CCD0D
      900C9B08900BD703C4086E0186062801D406310350066A051B054F052F04FF03
      5202B70262022D023F03C3029D019A02B2015601C2024EFFB20052FE6EF906FD
      C5F11DFC1BF276016DF6DB087CF85D0947F88C0177F72FF7C9F668F035F7D3ED
      00FCE7EC1805C5ECDD0C55EDA210B9EC591234EBD31117EA2A1073EB1F0DA7EE
      0707B7EF04034CEFD503D9EFCE07A7F3FA0A52F7A50B6BF88F0FCDFC17142403
      851441042A12EC00A10D51FB170A01F66308EDF36F0929F37B0DC1F28F0EE2F1
      7D0A1CF08E0507EE65012CEC7BFE8EEBEBFBAFECF2F765F048F64AF643F7D6FB
      70F8D5FF57F7960062F404FE0DF6C4FFE0F9EB0568FA1B0887F948069FF8DE03
      A8F8A904F3F81407F7FA09083B0010073B04E6032206CC018907AAFFB10617FC
      CD05E8FA93044EFC2FFE0BFDF5F52AFD2FF170FCF6EFE9FCA9EE61FD26ED40FB
      AFEF66FE4EF44D0809F6310F90F56D0FF0F4470BF3F5AD0677F8AC037BFB4902
      92FF4802AA01E101B0026B023806EA03CF0AC804970E2105EF0F82054C0D6A05
      340A2105980A3206280CCD0749090A075602D604E2FFF6075601D70F2F01CF13
      44FF9E104AFCB909A7FADC0451F9CF0264F81D0227FB0503A60078031A05FF02
      A4085101DA0AC7FD0B0A8FFB28073BFCDEFFCBFC81F77CFDADF3E5FEE7F3A601
      99F423050FF3A00609F5920B09FB211338FFA214300237113604C40B9704FA06
      6E03D506BE02090B34030E11EC022715B7FF53157DFB0F12D2F9D40CE5F92F08
      7DFB0F06A9FBC2056CFBE8055AFD4604C2FF40006EFE86FAA1F7BCF3C4F540F3
      F7F9F4F829FC42FB7CFD66F9C3FD8AF753FD35FA41FCC1FE15FC54021500FE03
      C70482001F0941FC950D30F83F0F54F3C00D0FF1C60C91F1F20A48F28F08AFF3
      C608FBF4B00A65F6FB0B66F8EE0922F9B90A9CFE1D10BB09321322112B145D12
      FC133D108313D60D07129B0CF30EDE0C0D0CA60EC7070C0FD901EC0E25FCD60E
      ECF9EA0D3FFAA10CFFFA2A0B59FCE5073EFCE30284FCFFFFE1FD73FE24FB46FC
      FBF2C9F918EE0EFBEAEE7001ABEEDD04DEECBB02A2E928FEB4E77DFA86E8D6F8
      04ECC3F84AF38BFA9BFA26FB84FFDFFA9901AAF9B20218F85903FFF7E003A7F8
      3D0311F81F00FAF61BFF71F8E702EBFA75070AFD8F0873FDA40A4000800F2106
      7E0FFF06990B6A048E096900E307C5FB66052AFAD40329FB98028CFE2A005702
      09FB2304EEF4C90326F29C0091F17BFCDBF181FA84F28AFAB0F249FB02F46CFB
      2DF719FB1AF9FCFAC6F78CF93EF7BFFB75F9E40318F93109DEF68A0A25F69909
      47F67808E2F64F09EEF8A20942FEC1082703D3048F055201EA0687FF1507F2FC
      E004F3FBCE01C8FD0BFD3A007CF6500259F25D038BF18D02F5F3A9FF3CF49FFA
      8AF496FA6DF81001E1FADE0587FC0405F4FCF1FEB5FCD1F890FB5FF6E9F8AFF7
      28F8D5FA60F960FCDBFB6AFDC9FF76FD0B05F2FCB9090EFE7C0C3D004B0D9D01
      370C20015F0A93005B0A2E00760A0FFE120558F93B00FEF73A0130FC8A010FFF
      D90080FD3DFF1BF851FD3AF3ABFB6CF1ABF9AFF249FCD8F6190244F9430883F8
      080C01F6C00B2CF59408C8F6DA0330F9B1FF29FB7AFAFCFA69F56FFAB7F435FA
      C1F6A6FA65F78BF934FA6CF9FC018BFD9F078EFFCC09C6FE3F0BE9FC2A0C31FB
      2E0BF3FB6C0726FF78055E041E041908C5017E081FFF09069BFC2802BBFA26FF
      8CF856FF3FF71A0316F6120792F4400859F3610771F1C1055EEED80172EE23FF
      F9F3B00056F95B008BFBBFFDD4FB9AFB45FBF3FAE5FABCFC1DFB20FE8FFD49FE
      A600DFFB52017CFAF90069FB81013AFBF90075FB82FF05FD630001FFFD009F01
      64FF500466FFDD053E0164079F00F306EBFFDA06BB02D30BE905CC1062084D10
      BD09DA0B8A0A0C08A00B1A07A20B1209D70B1C0C7D0BE40D7807011084028811
      3601C411AE01D310BC02EF0DA804BC0A9C041D087C00E80688FCD807F7FB0F09
      F4F8CF06FBF59A0328F9410416FC78057AFDCE0194FF5BFAC30019F4510211F1
      9C033BF15B060FF4870A48F5A20D7FF49B0F93F275101EEF8B10E9EB8E0F0BEA
      F80E37E9420E00E9AE0A02EBC40865EEBB0BA3F3FD0D1EF8C71017FADD1578FE
      9A164C02211522025215E5FE251665F9D61640F43913F4F2FD0EACF4D30B06F6
      2E0893F76C05A2F65F0281F3B6FF09F237FC70F454F99BFA34F9FAFF56F9B802
      C3F9420413FC2607E2FBEC08D9FA6109C5FD7E0DFBFEAF12BAFC8F14FDF89712
      BEF4051022F28E0E01F1C50CD9F2DE0AF6F6F40601FAFA0379FCE90230FF8900
      A3FFDCFEFEF9A5FF99F3A701ADF1400346EE930344EB9C015EEB3F0158E89601
      54E4AE0188E52F0812E8440FDAE98F0ECBECAF08DBEFB70251F449FF41F8A5FE
      F5FBAFFFA700D0FEF0032CFF7A06DB008F094D02540CDF048A0D63061C0EA307
      B70EE9060E0D9F05020A0D063E0A1D06610996030E051B01DC031705EA02700C
      F5FF450E9AFE150A0EFC0905FBF7BD0146F52402FBF5270446FAAE00D9FF3FFA
      8203BDF64D0444F56303BCF5530123F7E4FFD0F88EFECEFAF4F973FDEAF2DE00
      8FEFB50479EE11070EF04705DFF7220607FEDB095B00500A6F02380906057607
      9A071A0803057C0D28004513ECFD9D1417FC2D1328FBA20F78FBE00A67FB1707
      85FAF605F4F9130868FB950815FC2B071BF892058BF4A20509F3380460F2A9FD
      73F6D8F918F939FB8BF634FB9DF322FA83F1CFFACDF175FCB4F326FE34F85BFE
      F6FE17FA0D04A3F4E007C4F1B70B9AEE5F0EE8EBF80C14ECDC0960EF19094FF4
      4A07CAF8C80367FBA602B7FDAA0166FDEB01F6F943074DFD6D0C21054B0F0C08
      4D11B8067C11F704C711110693112D0A3810640ED00DDD0EA209070E8C05720D
      3703E60A4F025B06EA01B80153014BFFB4002FFC12FFA9F987FB71F97BFABFFA
      06FAAAFAABF66EF8B6F5F4FAC8F5020155F320025BF213FDB7F2BBF7D0F285F5
      3AF3D1F784F432FC9DF714FC0DFB27FA01FDC1F973FEAEF967FF22F9E2FE3BF7
      A3FF9CF6B601EDF6B802EFF7CE013AFA200256FE06044B028C050302410AD903
      9D0D9408800C9408050B05047E0AB0FDF40AEEFA6608B0FEF5016204C0FC9F07
      C5F9640898F7160661F8000198F9FDFB23F92DF9E7F8DFF900FA71FA01FDECF9
      94FDE6FAE0FC6BFF1CFCAF0341FA8E0387FCE90647FE250E51FC97100BFC660E
      29FC3A0B6BFC2B0AFCFC360CCFFE400D5803A7091A078105E5088A038D0B6A01
      610C60FFA908EDFE57045D00FE013801A400AFFFB9FD1EFDA2FB29FC57F98DF9
      A3F6FBF444FA5AF6DBFE42FC36FFB8FD5CFF3CFA03FF73F53EFFADF2430087F4
      33018AF69D03D5F49A0618F49009C7F5760D1CF7D910B9F8211142FA661190FB
      96134DFB4F1589F9B21434F9B51385FAEB12EAF8C21000F5051120F6CE1025FC
      D20C6CFF4E09B5FC1E060BF8760372F5420335F7E204FAF80E082CF6EB0B14F3
      AA0DB4F1F50D57F2980C73F4DF0838F5F0060EF6700707F7B70707F78205B4F6
      CA0221F713010FF727FF73F40F03C4F56808CFFC5407EAFF0F0606FE6605A1FB
      BC05C7FB08077701430593061A02210672001205F6FE4803E8FE950031FF59FF
      ADFB11FFFFF8130127F897029AF6880270F2DF023FEE2B03DCECCEFFEDEBFDF7
      9AF08DF4FBF6FBF6A6F65AF7EDF515F55EF6C2F3E9F68CF512F8C3FA73F96CFE
      68FDD6FBF201EBF7A0042BF717077AF72609E5F7ED0849F93308B0FC58075501
      F1058C05FD019707D3FDAD0737FC6604C4FA7CFEE4FFA7FD7D075E034F08D406
      E6080F05F0091902100A3402760A3407C608BB0BCA05330C65033A0C6402A90C
      D401F50AE0007309ACFDA80750FA04060CF8E704F5F5C90282F4D10105F39E00
      1BF30AFDFFF388F8DCF832F86FFEF7FCF0FD2FFF93FC9CFB9CFCA1F780FD55F7
      7CFD2AFBD0FCEEFEF6FC16FE68FE31FBC600FEF73C039CF496055EF2B0051CF0
      D50663EF410968F0F80997F18A08E1F33306C0F6FA040DFACE0331FC770768FE
      5C0F44032C105F02510E03FBB70E5CF4AD0EFEF04C0E4EF5DE09CEFAF20239FB
      E5FDC5FA7FFAD0F8A3F8B2F528F875F39DF58DF230F425F59DF498F9A2F4A0FE
      51F6E7048FF7E909F0F7430CADF6FA0B09F99A0CD1FE5E112CFDA5126FF9C30E
      DAF7150B45F6160B7FF55C0FA0F4D20F16F6580A90F9E6036EFCE1FF8AFE82FE
      07FF13FE3BFDB0FE71FC420068FAA80076F73C011EF53402E6EF6A020DEA1403
      56E3C201C9E2800100EA9B0662EC8409C3ECDF0564EF1901BAF2480076F7BC04
      77FA7F0841FD8F083A018C086D04A7099006640BFC061D0D7705870D2F05DF0C
      DA06900B4A08820AA209810B3509430C3006500B4302C5093203CF09B106630F
      7F02F51475FBB81220F62E0D2EF40E0AB8F56F0852F61C065DF82202B9FA65FD
      F5FB09FBEEFCAFFAAEFD97FB55FC65FDDDFAEBFF26FB410359FA010695F9B508
      82F81F0A6CF6150C90F35A0D45F62D0DDEFF62110D0318140C01E210B700620C
      B5017B0A4805AB0E730723135106B31234045411BC02370FA9016D0CDF01530A
      8B014F07B1009A05A10020054DFED804FBFB4E05AFFAB902A4F745FE56F31EF9
      6EF425F468FADCF5B9F981F827F439F5F5F021F1BCEF62F120F24EF6D7F5C4F8
      E5FAF1F50703CAF1B50AB7EF6C10C1F000144BF2B014A7F3F91301F7341186FB
      940B7FFF470767006D04B6FD950276FB1700B9F8D3018AF7D50B79FE3710AC06
      CB0E1708640FBE067B1007096512D90F6B119F13270D5212F109CF0E5C086F0A
      450798074906A1058303BE032CFF790274FA620109F5190024F16BFF19EF5EFF
      28EDE6FE25EA04FDD3EC1DFBADF6ADFEE3F8110405F4D10209F1C1FEE5EF75FD
      27F161FF98F097FFD9EFDDFC0AF1CFF979F232F7C2F4B2F69AF613F764F7EEF7
      5DF832F9B2FA82FAB3FCF2FA71FEC7FA6000C7FA5A0181FCF6FE57FE91FF01FD
      2409E3FE660E6501510C90FE600A28FBEC07E4FB83067401BC04AA046F012503
      50FD650151FB9DFF57FB03FDF7FBB6F912FE0DF616FF92F598FFDEF848FE87FC
      B3FCD6FFC6FC07027FFBAE039CF60E03CDF4D0FF08FC1B026B0086078DFED508
      D8FDCF0824FE450B46FFA41024FFEC11C1FDE00D20FE32086A00E302C801A600
      ED000FFFF100DCFC9E023DFC900441FE1404A6005B01D4016AFD410242F81002
      75F1A6FE71ED03FAE5F3BFFC0DFA9E014FF94C00D2F92CFD09FC8EFE39FF7B04
      F600F3061101ED031B029EFF1804DEFC560624FC26080AFCCA09E5FBC00BDEFB
      B30DBEFCE40E48FD6D108EFDE11163FE7B11B7FE7F0C3AFCA2092AF86C1089F9
      851316FF140B00FFD301EAF9A0FD6DF52EFE2BF4F1FF90F48C0110F4CF020FF4
      520210F435023AF35A036EF1CB0509F09A09A7F0590D15F3AF0F5EF44A11CEF3
      2312A1F4EE11BEF8010EABFCA90A84FCAA0F16FFA4135F02B20FCBFEA90AC6FA
      C908E6FBBF0A4C028A0D6308FC0EB409C30E40098F0D8508120CC406CE08D503
      86057A004103C2FF2700BA01D3FAD30139F617FF2BF562FD48F552FEA8F1BEFD
      73ED92FA43F1E4FAE6F56CFE2CF3ABFD02EF5AFB9FEDD8FD25EF6204B4F12108
      3FF52C0672FBD502BC0232018E07EE01A40899013F086D00480801023D091B06
      BA078B098703EE095600B70819FF7707DFFCAB04D7FBE300B6038C03F40B740A
      800ACB0A6D075107DE073108E009C00D9A095C11F805430FDE037B0B9403DF0A
      9F03CC0BEC02450C4E00F60CF6FC7A0C1DF9A30A7AF50C06C0F3FB00B6F448FF
      7CF71BFF7BF717FDEFF7B0F8AE0281F8280E79FE330D9B0002079DFD4C027AFB
      860085FB460018FB75FFC1F7D100C6F3D403C3F1A70683F17308F7F049099EF0
      B80AB0F1510C9EF3480C1FF22D0B2CEEA20A95EDD70AC7F036079EF33903B0F0
      760A36F06715A0F41C1860F4ED15DEF208133BF4C610B8F7690EACF90B0B8EF8
      3407C1F77103F0F7100144F7DFFF62F4120059F21902E0F47C0233FB08FF95FF
      55FAD801C8F7EC0422F930084DF89B094DF40306C0F8750465011F096E02360B
      68FF410AB8FCA30B76FC410FC7FC970F16FCA40A60FCEB037DFDFBFE63FCA2FC
      14F8A8F8EBF565F41BF66FF5B0F7B8FA44F8E1FE21F43B0087ED82FF33E9FBFC
      F9E44AF950DFE7F4C2E21CF5A2EC58FB3DF0E5FD81F1E2FC18F5BBFF08F9E205
      24FB4A09E5F99306E4F86101ABFA1CFE7CFDDBFD2BFF36FE0E0142FF8604A401
      D307C0049309AE054A0A9005A70A2E08FC0BD909930A2508E603FA0226052901
      EF0C9507B409AC0A1800BB0578F978011FF70E012AF9CB01DFFAE600D9FAD1FD
      7CFAB8FA8CF950F8CFF7C8F63AF702F714F8A1F9B7F94AFEB8FB0A0101FD0602
      23FD3E0467FD34074DFC60096DF6F20615F7E70412009608E002F60858003506
      7EFE630777FF5A0B4F025F0E8704580E7F068C0D88079B0D9E06320C38042B08
      3802A804160211041F017F04FDFC520142F911FE30F765FF33F88401CAF71202
      33EFE2FC1BEBB6F604F12BF705F464F6C7F1E8F29CEF6FF3AFF0C0F84FF4D5FC
      7EF859FCB7FD1BFAC30327F8EB0821F7680A0EF50E0A50F2B20A58F2350C3FF6
      E50CA6F9AD0A8AFB7B0594FC100351FB5C03E1F95B00F2F72F02D1F85C0B1700
      110F2305850C0B053D0BDC07E50B8F0D580BC50E5709960AF8074006CA073A04
      3B088104CC069B047A04AB03C502FE02C600AA01F0FCBFFE72F788FC09F330FE
      91F29B003BF5A900ACF4A6FD91F77DFB17035F00BE07C70338014EFFB1F978FB
      B0F437FC75F212FD12F277FB5EF294F971F424F971F7F9F956F96AFA96FA47FB
      25FBDEFD0AFB6B008FFB10003CFC52FE8CFCB5FE50FD99FFCBFE1001A9FCD800
      29FC0800F205AA04F60C6507690B08043207A00297034A04A10216050C010904
      25003D025D00B201DDFF490122FF05FFD8FF84FDE9017EFEB9032D001C02A100
      44FD830110F9D8042BF8FD0770FA9C096DF7DB072DF4D20517FCA20B5B031812
      C3028012D9FFFC1345FD8B17DCFC4517D6FC8112E7FDDE0C38FF7C08DBFE2305
      EBFD8A01BDFDF6FED7FF6FFFB9031B02DF060C046306EB04B300CD04F6F9CD02
      AAF6A400F3F02CFD34ED71FA3FF57AFF7FFE48052A02D304850490058105B608
      AD046508B401D70371FF35FE670090F971034EF78C05F0F6340766F8350A91FA
      090DC6FB1D0F17FCAA0F2CFC880F43FE2010D3FEBC115AFBCD0E5DF55D0ACEF0
      740F87F4541499F907104BF7AD076DF4A90059F6C2FDDAF8F3FCB0F78FFC3AF5
      BDFC61F3FEFDB1F1B9FED0EF15019BEFD4056BF21D0B99F5C61057F70B144AF7
      F713ECF6111259F6CD1148F77E0E0EF78A087EF5950CEEFA18137E0018121901
      A30E67042F0BC709D009D20C7009CD0C4E09BC0A910A9308FD09F005F1053001
      2903D2FDBD012EFCEAFE27F915FB24F705F698F757F283FAF8F16FFE2FF43200
      61F005FD6AE678F6F0E5AFF6BCEAFDF9ECEA5FF885EA68FAA7EBF0012EF05708
      A5F53C0A47FAEA0770FE7B03A400B1FFA900B8FC6400B5FAA50112FCF60282FF
      30047F03990406074802480848FE500663FE27042EFE290286FB96FFA2010D03
      CA094707860B0706D90AB5072C08120C7D05F50DE102AA0C03FFA5086BFCB905
      FDFBF80559FA5F0631F8CB05B6F7FA0309F76D0007F613FE14F55EFEA1F41B02
      F9F5020696FA3005BCFC4CFF17FA2CF71EFFD1F79E08D5FCF30939FA5E056BF8
      BBFE78FBF3F941FE88F872FE3BF9C6FCBAFA01FB38FDABFA34FF94FA6E00A1FA
      2C02E2FABF016CF99201D4F79D0239F56C021EF2CD0094EF480212F01A035FF1
      82FFBFF0220429F64D0EEAFB9F115CFAEF0E60F9D00889FAC003A0FAE50022FA
      3EFF33FA0501BFFB3303B1FCB1014BFBDEFF5BF9FFFF83F8ADFF30F935FE43FC
      D9F9C0005BF43106DAF0CF0AE7F1200C55F3390AF3EFDB05E3F3A107DEFE860C
      44044C0B99045E0B9601DC0DDCFE160E6BFE3B0B13FFED05C1FF040013FF74FC
      A4FC02FBE3F9CAF993F902FA18FA72FA88FA0FFBD1F9FAFA54F63CFA61F0E5F8
      60EDEDF7DBECE9F8D4E943F9BAED67FE68F72E05C3FCFF0409FF330604FE610A
      33FC670C50FA6E0BC5F747074BF76803DCF8950247FBF2040CFF9808D804BC0A
      2709B10BD30B380D280DC00DD50CDE0E3D0B3C104E0AD40D5109C708A6035E02
      EC01E00273088308000C01071C09AA05E40266083CFD0E0A77F90609C0F61106
      59F5010359F4C4FF4BF3ECFEF8F3850117F892058AFC8308BEFFC50998001B08
      03FF5B06A7FC890617FC440763FC6F0878F8B80631F83F0976FFEE0E8E052B0F
      61080911140798143E05801552064313DA07680ED70A260AB10D73077C0CFF05
      FF09A104BF08CC01B705FFFEB30241FE47FF2AFEE7FB3400FAFA0D02CAFBF8FF
      A2FAAAFA47F310F2F4EFD3EE76F4A4F17AF99CF19FFD59F405FF9EFA63FEB5FD
      00FE24FC0FFFC9F7DF01D1F3AD0499F08405D7EF2A06D7EF12099BF0F20B8FF4
      EA0EE4F9B41166FD631267FE400F90FD260CE3FAC90BEAF8BD08E7F682087FFA
      1B0E0D03B9118005EC1148066E0E8A091E0AF70B1C082D0B06070609A2075607
      450874054406AD041F030A03AC0088FF06FE12FD15FCF1FD81FBEDFFABFBE803
      C1FB3A08D5FBAA064DFB5E0162F77DFA52F670F894FB0DFD010075FD0B0079FC
      C5FAE7FE68F4B700B5F03BFF95EF57FB09F125F8E7F277F5ADF47EF4C8F610F5
      56F973F6E9F973F8F4F8FBF9BDF836F82BF856F531F792F576F8BCF68FFA7CF9
      B5F9C4F94FFB94FA4F0282FE340886FD850A23FD850846FEAB0376FE01024AFF
      440365FF2806A5FF1B095EFE9307BEFBB4032EF8F302DAF51503A7F7B80113FC
      0000A4FF81FD89034DFB540878FBF5098DFC42099FFA570593FA49049DFF0B09
      1D04800A9B06480B1305360EC700A60F42FE500C36FD510596FCC1FF95FCF2FC
      99FB19FE71FA75FF69FC1BFF40FE44FF6AFEFEFE73FD31FE71FB46FD6AF7D0FC
      ADF2A5FDAAF195002BF1A40048F2AD00BFF7DA0526FDEF072B011F097402810C
      6200BD0D60FDBC0A4BFAD604A8F8E2FF3BF9BAFCD7FA08FDF6FDDAFC0D0384FA
      C3073DF9490BEAF9E50D2EFB520FF5FC8B0F9EFFE40F99FDEA0F27F8D30BB2F2
      060826F162092BF6F60BD4F7F40CA4F53D097BF5B00113F562FA34F3E4F518F1
      A3F622F0BDF8EFEF80FA55F1F3FD57F3090365F41307DFF4BA0940F49A0CD9F1
      8F0E7BEF280FF0EE790F3DEF910FBDF10C0D40F26A0C39F41A111EFDDF16E702
      471B9506191B570A6F166E0BA911320AAA0E1406EC0D3A03100F7002E30F9000
      2D0E33FC5A0BB9F86A0871F7B904B2F9BB01F3FD53FF0E0184FC180388FA3B01
      FEF758FDBFF10CF7C4EBAFF4CFEA64FBC7ED2800A5F3B9022AF8A307FCF7330B
      ADF5720B20F5CC09AEF7BA0751FA7F0595FA4304CDF88C02AAF852010DFA9E02
      8BFBFB034EFEFF044401D705350201058E00A302A3FFE10185FEF8FF7EFE4600
      600367070209B70A520B580C23090F11B10406143E003B1374FD500F93FC0F0C
      DDFA4F0996F75307CAF43D04D1F4780198F513021EF7CA04DCF9B90771FC9109
      C0FDDB0AF6FDCC06E4FD10006EFB7EF8A5FA46F2AAFE8DF53B04C3F9930A47FB
      F40C22FF660919022E0474015AFF8EFE61FEC2FB8BFFD8F89EFFDFF69700B1F5
      100356F65C0439F7B404EFF44B04F4F020029AED1101A2ECA6016CEDAA0387F0
      A20477F0CB050DEF640936F4DB0B26F8200EF1F9D70D81FDA009B3FF3A06A7FF
      1B06B5FD100883FD6A0921FEAA09CBFC6D0876FA350771F9270684FB6803AD00
      3900B806BFFD6A0B8FFA7E0FEEF721104BF7B40E3DF5320AC6F49D0532F99C08
      55FE930B0104D20C3708850FE007DF0FE704C90B9000000735FE96042AFEAB02
      CCFCD00138FAF7FF2EF8AAFC46F67BF9D3F3DDF616F212F605F13DF74FEF43FA
      D2ED85FC7AED65FE0DED1DFDFAEC16FA90F00DFDB7F5D4FF7EFA260015FEC802
      66FD830533FA9D0502F7F20372F5C00307F4D003F1F31503DDF69B01D5FB4700
      7A01FFFF8C05BA01510851058809A5084B09250B58081108CD064B020D0284FC
      42FF3CF9AF023B00D905790724098107DE0A4C06D8057105D5FC4603CDF31701
      C0EEE601F4EE4A0246F1DD009BF3F0FF89F67100DEF99B0098FC9A006CFEE300
      C7FE1F00C5FDA700D9FB6A01D9F9BA037DF6070433F52C0294FA25075C008D0C
      4505810E84090F107C091C0FED06E20B99044F07E904C8057E066805AE08BC02
      FE087701AF055B012D0229019EFEAC01FCFB170204FB9B0002F953FFC7F5BDFC
      10F446F9A0F0EBF5D1EBDEF212ED03F61EF1CBF9DCF507FAD2FB73FAAEFEAEFA
      FBFD42F9A9FB9AF6ABFBE0F5ADFCBAF558FDA3F5FFFDC9F68CFE07F8D70063F9
      0A04A1FB8307D2FD6F0ACBFD030C1FFC770B1EF92C09BAF74E053DF73802D2F6
      BF04D3FCB00820057809190A7509AE0EA90830126B0625110A04070CB2026507
      54FF590320FBA7FF23F9E2FE8DF71F0008F7AD0009F97301E0FCC40397FF8D05
      EB00A007C2008F0627FF1501B6FA6BFA6DF59FF412F685F78DF8B8FE4BFA1801
      81FD4D0206FE680385FA49019FF570FD21F37AFB49F316F932F4A6F62EF6FCF7
      03F917FBA6FB3CFC6EFCCEFCF1FAB3FDF5F6C2FC14F42CFDB8F3D4FDAAF5E8FD
      00F8C9FB14F806F73DFC8BF92A02AC00C105EF058B08250A2109210BEA07AC08
      C305E304AD059B020006BA00B3052CFD9206C1FA240606FB3704D5FCBA02BF01
      840178087800200DB2FF4C11FEFDDF12E1FD32117BFDD50D50FAD108A6FB6709
      A2FF7C0E16013010F8021110E2037A0FA7018C0D52FC0B0B51F9630AA9F91509
      DAFAF9058DFD8203D4FD90FF73FCADFBD4FA01FA14F95BFBEBF7EFFD1FF84C00
      5CFAC601C2FC3B0203FD9F01C9FB0CFF9DFED301F4035409A706490D64076D0F
      F906061195057F0E5B021A094C003B0455FFFAFE78FEA6F9FD0069F6E00418F5
      9409CFF46E0EE4F6CB1264FB871594FE4616B000F4156D006513C5FBC00ECEF6
      5D0967F28B09B5F2DC0D0EF7651049F57C12EDF1E511E9F1B70C1BF291055FF3
      7A0028F6F6FE07F76500CEF515033DF5F404D8F3F9063EF1C50838EFC60A49EE
      CB0CB7EC010EF8EC560E5DEFCE0D12F3B10C1FF7850A45F7AC0DCEFAA7155403
      6A1A9A08F51C2C0BA01D750BF81AD60816155205E20F1E02810C3AFFD909CBFC
      D80951FC850A6EFDD109CAFD7B08B6FD8F08DBFD5807C4FC07045CFCCDFE9BFB
      B1F968FAD6F536FA36EF8AF739ED41F87EF056FE20F2980040F42E01F0F60804
      7FF8E10580F74E062EF6C70674F5E5052AF495041FF4B50336F3C0FF24F201FC
      5CF3C7FB09F6B6FD2CF9BDFE48FC11FE5FFFAAFDED0120FE7F016FFE35FE96FC
      9DFFC20086040E0B9A054510D304001286039E1291025F0F0601E2099CFE6605
      B0FB6001B3F73EFFC4F54300D8F3FA00ACF2570116F49A0287F7F70361FBDA03
      42FDB303F8FD79012AFE16FB6DFDA0F579F9EFF027F928F2D8FE2BFCEA027601
      B406F901C60AB103C30A6C022F05F9FE44FF9FFB80FB72F893F966F707FA13F8
      5AFA51F7DBFBDDF633FDCBF77DFCEAF7B7FB40F659FBE4F383FA99F0B6FA1DED
      80FC16EC06FC7FEAB5FDDAED0C0456F98B07A7010808DB044E093E059A0ADE02
      1E0916006006C4FDEF036AFCC601EDFB8A0278FC2E04FBFD89036700F000D104
      D9FE460ADCFCA50DD7FA4C0F39F97D0E33F7950B7CF623096FF41F04FDF41202
      E3FBFD0732017E0AA0033509C7056E0AE105F2092802FB07D5FDB2050EFB4702
      ABF9EBFF03FB1FFE92FB31F92CF93FF4C3F613F436F504F7C5F244FA11F165FC
      6FF1FFFCC2F3E7FBB6F5E0F964F3C7F572F3CCF58EF9CDFE1EFE6F05A5FE2908
      1CFE0D0C3DFFD50D73FF2A0D16FD290B72FA1608EFF77305E2F7F60378F95602
      2BFC200287001F05370540094009E70B510B880EE10A450FA9079A0BE103D707
      CEFE2C0216FC01FFE000A9044C052307CD050B05BF05EF0619044F09AEFDE609
      45F6DE08A4F2CD06E7F1680588F4B304F3F68E034BF88102BEF907038EFAE303
      50FBB80364FB510300FAF302F2F60303ABF4FC0376F2C301BBF3D0012EFC260A
      69049A0FE408B30FC80B200F090F450C3810BF070D0EA703C70AC401ED059000
      30030D008D046DFF7E062CFDF60675FB4D0730FBA006DFFAF2034AFA5F018DFA
      2BFEFAFA08FBE1FB61F79BF82CF51CF4A5F928F625FFBAF5DE002EF15E0159F0
      43036BF18D04E0F1FB02B8F2F7008CF5F0FE9AF9E2FE91FB190094F8FB0035F4
      BF020AF31D0648F4C50983F5570C5AF5120ED9F4840E84F3A70ED0F20C0BD2F2
      A1075FF6120A0C03CA0C220D2C0D160F5D0B0A0FA70BF80B610C5A0655081600
      800204FEDDFCACFF29F9470163F70F02DAF71C0207FAF702E8FC1605DFFF6707
      300114080B01FF06DCFFAF02A8FEA8FE44FABAFAB6F57AF8C9F74FFF15FB0204
      D6FB7E0221FC9F0216FE6C016AFE16FD6CFA3AF868F74FF71DF6C7F8D4F618F9
      33F820F9BFF822F9AFF854F9B7F6A1F964F511F878F42FF417F3C1F0D6F1B1EE
      BBF1EFEE6EF1BEEFE6F296F385FAE6FF0002AF09FE05790BB207E40A7C09EF06
      580B1901AC09FFFA470653F86D0320F8C60366F80C06CEFAD40779FD4F070802
      0E052B0877040C0D5A04C20E3404790EC603EE0C7103920BDA003C0826FD3D04
      E5FECA07B702250BBB04EF0A19043D0D09026D0FA400330DADFD3D0764FAB803
      91F96C02FAFA680037FBB1FC03F977F9D6F500FAA8F3F1FC46F33400D0F40002
      7EF79C0332F9210450FB110450FAB70215F7E10117FA7B091EFFAD103F014311
      4C00111205FF021183006D0BF8FE610466FAD5FFE4F6C4FC32F7D4F990FA3AF8
      AFFEBBF8B50309FB1E09C5FE0D0F31037A13F7040914EA043C11D301C80E9AFC
      B009ABF60504F9F0E20598F3250A18F7D30C70F60A0D5FF9C00BE3FB3E0A85FA
      FB0461F738FF19F6BCFC4FF6D2FD2EF508003DF2FC00EBEE22023CEDE50354ED
      FE0576EE150803EF02096AF0F607D0F1C507E5F3EC062BF5F8052DF6540B18FF
      2713CF07E418A209F31AB409AE1AD005721B23004B199FFC36130EFDCB0BCCFF
      B7077B00180881FF2D0A8CFCF60CEFF9570D89F9F80B4CFBC30926FE5905CA00
      FBFF720229FDD5031CFBAD02C1F765FE77F8F900F0FAFE047BFB05041FFABF05
      44F855087DF94408F5F88A0763F5F70870F2160A90F1A608BBF02004DEEE07FE
      FDEDCDFB36EF6FFCF6F2B0FD7DF712FF5CFCCFFF2CFFEDFE5501C5FE5C0103FF
      29FC72FFB3FAFB079BFDD9107CFF6311F3FF7311F3FE04100800FF0A8DFF1207
      A6F9170617F20506C6EC760591EB2E0469EC350281EEB70112F197022CF4EF02
      8CF770015EF9DFFF9BF98BFD1BFA27FB3AF930F925F6D3F5AEF8E3F96BFEF800
      D4024B01EE0523024E067801B808A0FC4108DCF70303BCF5ADFF01F6F9FE4FF7
      43FF78F857FE47F876FCF7F850FB5AF8B6FBA4F4B3FC9EEEC9FD89E981FD9FE6
      2DFDCEE7CEFB3CEC73F89AEFC7FAD6F8380158029F07FF03EA0B2504EB0B5601
      870D54FC190E8EF9DE0901FAB1054BFCFB04E9FDD106B6FF450830018A08CF03
      C2065A072E04A4092D03CD0ADB01A70BE3FFA50BEF00F90B3201BF0AD4FD0305
      41FE13060602EB0AE604CD092B06A40A36036F0B63028D083F02880441FEAC01
      2CFCC600FBFC5D0059FE3FFFD6FCD6FB73F879FA87F400FB75F40EFB2DF685FB
      2BF7DBFB5FF614FA48F57CF7F1F46BF676F215F5FFF316FBF5F83305BDFCD308
      A5FFE90B04FF9B0C2D00B6086402750455FF63014DFA1CFF57F7C4FC65F7D1FB
      B4F8D3FB87FAF7FE64FDC104EF01AD096E06940C4307010EF504B30B81036E06
      12017101AAFBDEFB67FBD0FEFCFE7E077F01110AF703930C6F02F90CA802EC08
      D603940581FE3D0430F9A705FEF6400679F6F40407F73303FBF7830248F9C201
      5DFB1200EBFD59FE1AFF83FD9BFD2AFDC1FBB0FDE9F9DDFF34F6EC003CF89607
      B2FF18118B06E612920DE011800F590D641050063A1287028B0D930138066E02
      010232021E01F3FF5C0190FC87023BFBC603EBFC13048AFFD203780106028002
      A2FEB1019DFD6DFF59FD2EFC84F9AEF5EFF8DCF412FB39F896FB64F6B9FD52F6
      9CFDF7F71DFE4CF9DC0079FB9CFF6EFE37FE1E02B5FE8A031BFFA701F8FDBAFC
      C3FBC0F921FB63F953FE20F9CD035DF8670866F8D50A0BF9590BABF9410A40FC
      B904CCFD8D01AA0326038A0B8C042B0C5208130C7C09EE0B7E084A0A23074808
      450018066AF89F0439F4AA02C2F3F40012F556004AF63402FBF678040BF8AB05
      FEF929057AFB3B04CFFB1E03F8FCD2FF5AFD49FC7DF848F829F6DAF92CF91700
      A4FA620195FDA50164FE270166FDE8FEE9FF28FCC8FE74F994FBBDFAA2FAF3FC
      9BFA9BFD57F93FFD03F644FD8AF307FCBCF27BF84BF354F442F44FF206F480F3
      7EF328F6B0F2B7FAAEEF54FD1DF19502E2F9D6099F01DD0970098107950DCF02
      9E0C5DFDA40C7AFB820912FB1D05D7FC9C0279FFEE02DC010E05D503F3050F06
      0F065208AA055C0ADA04F60B11048B0D1103970EB202F20DF902250C1BFF6508
      8FFCD60927FFD70FAAFF34115D000E102100DF0C85FDA60797FC7703DCFA9201
      93F91703FCF81E0507F7320558F46E028FF131FFE9F0DDFD8EF480FD57FA43FE
      8BFE0100E9FF110115FFF10077FD8C01E5F90901B0F9010468FE690B7F018D0D
      E305D70C40089C0A8606B60655065A03F504F5FF080280FDB2FF53FAFAFF71F6
      BD0308F43B08E2F5AF0BDDF9E10E86FD73117AFF7011E7FEE30F61FC9C0E41F7
      520DC4F22509C5EF8806F1F1380942F94E0A41FC0E0DA2FB5D10B2F9740F41F5
      5B0FC4F0B50D62EEC309D8EEA506D7EF4F050FEFE404EDECFD0415EC8E0588EC
      34076BEDE00998EDC90BF1EDA60C7FEF390CE8F0480B9DF4200808F8760736FD
      340D12054312AB074218AF072F1ED0050C1E6A01911BBEFD81166DFA7E10CDF7
      4F0CD3F5940939F5BE09B2F53E0AB0F7C60996FA5309BCFC520846FD51075AFD
      1C0733FD1A07D4FBF506C9FA2D0395F854FEE4F93CFE2100A7FCA50190FB51FF
      0CFD8AFE73FB41FE4BFAF1FD06F915FE2EF790FFA9F58700A7F38DFF75F280FC
      19F18EF9EAEFE2F8E9F10FF812F793F752FC46F86F0082F96702EEFA1A02A7FC
      2BFEBFFC20FB59FEDFFC2F0536FD6509A2FFDA0A4804AC0C54045A0C0602100A
      9FFE17073DFB8204F2F73401E5F489FE9FF4FBFCA8F5B8FC47F6F7FD5EF707FF
      6FF987FF8FFB3C00E2FC2D0167FEA0FF4C0079FC17FE15F9A9FA97F852FD5EFE
      6B005C02BB03690221091402BD0965FE800727FADC05FAF8040599FA2D03B8FC
      FFFFC4FCDAFB95F9ADF7BEF484F59AF16CF54AF041F85DEFDAFA8FEFCBFAB0F0
      63F80AF18BF5A2F3EEF1C1F6CBF05CFADCF782011FFF0A05FC04F304790C4F05
      DB0E9403D90BD200030815FE7F05D7FCFA039FFD3103E9FF62034A023F035E03
      EC01A9053801AF082F01E80AE7FFBA0CAEFF380DD600F70A0B02C20815015F06
      73FECB05E9FF060AC4FF8309DCFCBE041AFE900228FEE80027FB82FF2FF97CFF
      82F99A0158F95603A7F7AC03D8F63F01E5F5CAFBEBF33DF8AAF371F6E3F685F5
      A5FAC0F6C3FCAEF804FC73F940F90DFB14F555FD33F25001A5F6F70891FA8C0C
      D4FBD70BAB006D0CD6026C0B7601E1088B001307D30047052EFF3D0212FB8A01
      5EF9CB03CFFAA906C7FC480A6CFEF80BF4FF310B38019309B30292089E03C206
      2305510510030C0629FCD60739F91E0DC0F8B01034F9DC0F3EFE1F0FD901950B
      6800630604FE4C0462FD9C0539FB410754F7AE0701F62006A5F503039DF5D200
      44F7FFFE65F9EBFC68FAE6FB46FA6AFD07F988FFF4F7A503D9F54C08E7F2880B
      05F78011E1FD1F149702C012070A4912060FCC0D6B0C75066F06FAFFC403D7FC
      93024AFE9300BD016F007D04A201E104E401B804C9012604DA03530200050A00
      3005BDFEDC05F1FC1F0672FA880413F82C015AF6A601CEF8890254FA000154F9
      0903D4FAE60587FB3304AEFA7CFF2EFB0AFD7EFD44FCA4FE65FA4CFE60F9F3FB
      97F98BF6AFF860F383F844F37EFCB1F3FB0144F5E2062DF75E08C5F6660637F6
      4803F8F693FF6BFAF0016902620600085106EB093A08C10C1B090A0D6805170A
      E20154061601C902FAFF230051FB1EFF10F73E0008F69901ACF5FE02D9F48703
      61F53303EAF6E70206F9FB02AAFA5601B7FBF3FC4FFA8CF99FF5DCF7C7F544FA
      CBF92BFEFAFBB5FEFCFFADFD0A0428FA5C0326F6A5FF90F40BFFF7F587FF32F7
      E8FA4AF6B2F5B3F48FF267F2C5EF00F2BFEF89F2A8F278F29BF4E0F273F432F4
      98F2E4F48BF1B8F537F032F7B5EDDDF802F1F1FC25F820FF6EFDAEFE2C0420FF
      660B69FD020DDFFA6B0987F943080AFA450945FDED06C8008F0344034702D903
      53021F047F025E052704E406EC05A3071A068208DD06770950087C09FD07EF09
      320529091C0489070403D004E3FE0B0201FE4D038600F504EE00420538FD6906
      CEFA2709D9FAD20ACCF8D60985F6D70689F55701B1F4DBFDB8F3E6FCB6F5D0FC
      F1F916FFC8FDF70113FF1C037BFEB30300FDD80513F900089DF9100AB6FD5E0B
      BBFDEC0A16FF9F0B9B02090B6702E00761007B030E0215FF98053CFCDB0472FA
      1702D3FA0B0210FC9803E9FCC7039BFCB3032DFCAA040FFD8206ABFEBE0889FF
      600BEAFEF50BFFFF35071400DF04DBFE6207CCFEF007B0FC5F092FFAD90C46F6
      C00D33F1680A18EF7508ECEF2D0A55F1C10883F16B0584F15A04C8F0E403C4EF
      C2040AEECA077DEBB40900EBB70A7FED060B24F15F0B8FF4980ADFF88B0674FD
      06071202CD0C5E068010D0077E1439071C197402A518EDFAB9137FF6AA1042F6
      561131FA1910DAFE170C7302930913048908CD036207AB022007410124080301
      1C09AE015F091202DC09B2015D081003EC034B044903C9044406DE06E405CE07
      F30424089E05D306EB03FC03F8FD0903F3F83D0481F8E20574F748059BF57402
      70F50AFEE7F568FB2EF550FA24F678F915FAFDFA28FED9FC14FFF9FC70FD9BFC
      93FCDBFF94F9650403F92C080AFD910DB9FD3E115FFD9C130B00B0137701DA0F
      8AFFBC0A69FE0506F6FE3802DCFC3CFFBBF7D7FE4AF422FFAFF3040038F3E400
      7AF350016AF4CB0217F62604ADF7C603C4F82D005EF955FE6BF62AFDCBF5CBFB
      C8FAE0FE01FE8400320102011507AE00070BBBFD1F0A92FB1C0719FA3D067CF8
      9303FAF59EFD79F55AF9E6F599F6E6F5FEF41FF509F77EF39FF993F394FAD5F4
      9BFA93F56BFAF5F46CFA2BF7ACF7AFF9E0F606FB10FB0CFF4EFD00011B00C501
      1F061201AB0A7BFD920AC7FAA90717FAA407B4FCFA060B00BC024F037AFFA305
      B2FEDF06D5FE380787FF4E06990134074C04560931053C0AE30579093A079F0A
      C704D5093B0299056E029A04B5FF48043AFC95040DFC940580FC9B05ABFA9906
      FDF6650899F638096EF88D07A9F70E050FF63900F4F44EFA4EF319F673F3CBF3
      FFF683F56AFBA1F92FFE39FC25FF35FDD2FED900CBFA9D03FBF65103EEF87605
      58FA8506F5F9400746FC4908ECFEB205B0FF8803C800BF03E9030504EA054403
      50032A03FFFE2402FFFB6C00D5F8FFFFEDF7800167F90005DCFADC0852FCA00B
      13FEEB0B79FF9A0DB0FB1C0E49F7510C3DF9430F6DFAC51090FA510EEFFDCB0A
      1200450559FFD3014EFC6101D1FB0A02B3FE4A01CCFD8B0041FAE3FFF5F8E8FD
      2FF901FB40FBAAF701FE28F7FAFEEDF9ADFECAFC91FD70FE95FDA20374FB7907
      E3F93C08D5FE6A0CB902510E5F04970D6606DD0943079E029206D3FDAB02DAFC
      950052001A025D04C901CF0665004F0767016C05810340028104E6FD4C0481FA
      6C04E9F827041EF8260386F73E04BBF9FE02C2FA0D0266F98D0647FC2A075EFE
      190476FEFC0263FEC20103FD8AFF84FD67FB78FF6BF8E00001F9E5FFF5F88AFF
      98F7E7FEE3F78CFB31F85FF8F0F835F59DFC3BF47D00A5F506027AF7DD028EF9
      7203B3FD1E004B0197FCDE0257FF24080702100C5D01880D8B02640E7F04450B
      6E050B0759059F0303053C011104B5FE9BFF81FD9DF93FFDADF65FFDA0F510FE
      1AF589FE8CF59EFFB4F62A0024F892FF48F9D0FC0EFB8CFB51F9FEF9EBF504F7
      9DF857FABCFBC8FEB6FC27FF2401DBFDC70535FB23083FF9BB065DF87A011BF8
      D7FEDAF736FC39F8CAF403F91EEFBAF96CEDFEF9D5EE55F94AF333FACAF7DEFB
      2DFB3CFC60FB4AFBE6F919FC88F5CEFCC3F09BFB25F45DFD6EF9F5FEC2FCF8FF
      EC0229019E096AFF3B0E1AFEF90E5EFE600C0C01C20AC70455087D07F903E908
      AE011C08AA01C7067902B40632038E08E904A00A1807E90BC507950B8B09710B
      06087709FF0281052004F405F803160702FE54076DFBD60867FA270AADF85D0B
      1CF6EE0BCCF3ED0BE5F5B90A10F9F80827F9EA05ADF7BB0170F595FEACF361FC
      20F5EFFD76F9290230FE0605EF010C065A0597079505F2070803D1059E042107
      30068909B803740AAC02A1090703B7057504A101CA06F7FDC709FDFC0F0EF0FC
      FB10F2FB8B0FADFABD0B43FA9F080EFBF905BBFBAE0329FEDF02EB00C504A502
      B5074A02AD0BBD013A0D4F00C20A09FC490B2AFB470CCAFBCF09D4F9CA09BAF6
      F30B3FF21D0ED9EE7A0FCDED620E9EEE110FC3EFA81177F02F10ABF0270CF9EF
      8B09A3EEAB087CECCE0ADDECD60DC9EE9D0F78F1E30F50F5BE0FAEF9AE0DEEFD
      9209F5FEB40BB000B51058025D114C02D911A601ED1295FDAA12F8F91D1138F9
      3F0EE9FC770C8F02CF0B2B056109E104D308B902AF0A2800F30BFEFC630CCDFB
      A50B4EFC730BBAFC110B43FC580BD3FCCF0AC1FECD076AFE930A1E0003109402
      350FEE028B0C2D03B2088302320368026FFDBD019EF60900EFF245FE84F326FC
      14F37EFA3FF22AF9E9F2B0F76DF379F536F544F5F5F6AFF8D0F757FC00F8A2FE
      BCF77E01A1F66B045DF49C04DCF63F06D9FB1C0A8FFDCA0C3AFFDF0D28007C0B
      EC00BD074702260392021EFFD9026AFC9202AAFAA7FF60FB6AFB84FD9BF8CDFF
      5DF6370092F58B009CF52F0141F65E01E7F6670049F8BEFEC1F852FD64F546FB
      E4F5ADFCB9F920002EFBD700A5FD34FF87021EFBF707D1F6640A87F4CC06D9F4
      1D01AEF66EFDF0F7B8F8E9F74AF204F7B8EDB3F57DEB53F3DAECF4F267F24DF4
      DCF7C4F534FA3CF7B5FA5EF905F848FCF1F181FB2AF1FCFAC4F556FD71F853FF
      86FB99006600F4FEB90533FCDD091CFBA00A3DFD0C08E301720598056E02A506
      22FEEA0415FCAD02DAFA7100CCFA620009FC9A0281FE38040B02F2032805E503
      0505E20401005102FFFD01006AFF6D000DFD1801B5F9640276F83503FAF7EC03
      32F8050431F7A40313F57E0217F6A0FFADF7B3FBB8F66AF658F5B2F196F366EF
      5FF4BEF1FAF766F8E0FB68FE22FF4B01D5015C037802D90564FE39053AFC4C05
      D3FD1308ADFC620934FB7F091FFB1C07AAFB5F04FAFD7002D200A8017F048201
      0F090A012E0AB202EF05FA042D000B0715FAAA0760F6840861F6870AE4F7850B
      5BF9460B0CFC880B0600C80C34FF820B74FE490BD2008B0E93FFAE0FB5FC550D
      EAFBB10878FD8B0387FFFDFFBDFFFFFE45FE5DFFF3FEEFFE80015FFEB000D4FD
      42FD0DFDF9F931FB8EF906F9E5FB38F879FDC5F8D7FC30FAF1FB9FFEA2FA4305
      1EF7C006BEF7F805C4FDE707C5FFE20932FE020A70FD5C067EFEA101AA001200
      A7015302D6004B0687FF3C08CA007A079502D0047C0403014206D2FC9A0797F9
      1E0967F8140AB8F75A0B9AF6000D49F8560D74FCE30949FD2309A9FC3C0E35FE
      8C100800F20DEA01430AF9024A071302270461FF830028FDBFFC9FFB8AFAADF9
      12FB28F938FBAFF764FB4FF423FB18F10BFB1EF138FC46F51AFDBCF98BFDCDFB
      79FE2AFE08000102D1FD6D02DEFBE10201FFFC060102690B5103CD0DB104930C
      AC068A093C0804066B091F03AE09CA00B00898FE25075FFE4E0329FFC6FEFFFF
      AAFAFBFFA2F82600BDF8DE01BDF88802FAF8710043FA08FD01FC25FA12F95AF7
      FCF532F770F81AFC60FA1E009FFB6BFFDAFFC7FBD5060EF88E0AEBF5280876F5
      16030FF636FD2AF62DFBE1F64CFA54F716F6EAF6E6F019F6B9EF31F69AF3CFF7
      9CF86CF8B5FC1BF8E9FD2BF98FFC7DFBFBF64AFA7AF212F85EF52EFAEDF8CDFD
      A6FA8300A0FC53006C01A5FDBD0642FD2709FB0043096706D405080921032208
      A701A3053800D902EFFE5F014AFE1B02AAFF5804AD016F056E04160620072109
      7D075B0C8902680AB4FE0905DA017A02BE043D03DB01670535FC4707FFF9BA08
      21FA110A39F9330B4AF8850B30F7AD09EBF779075FF9230491F842FFB7F5C2FB
      54F3E0FB88F456004BF7D203A1FA1E04E8FE92057102A9078801B20627FF7503
      FB0073023C01D5035DFDCD03EAF98001DEF922FFBEFB5DFD2BFFAAFBFF0415FB
      66091DFC050BBDFE19094401E8043F039AFF390421FCA7040EFD9305EFFE7D04
      D400CA030B049D0583080E060C09280321073EFFE208F9FE6F090B018F066500
      B40469FC160749F7E60A17F44B0B1EF3230A53F300082BF3F10765F3880AEAF3
      930AC5F2D406C8EFF7036FED3605EEEDB40744EE050A0EF0A20A0CF55B0A34FA
      6C0740FCC3045EFC8E074DFF6F08DA03F705EC058E03B902E404A8FC3609DAF9
      260A29FCED0824018905660587030B073C05F2057C078A03C608F40011095BFF
      CF09FEFE7509FDFC5309B7FBBF0A91FED20C3002580A2103BB064401B50A0C02
      B30F14070C10050BF80B6C0AB10753069703D90272FC010042F6BEFDB2F109FC
      12F133FB1DF558FAA5F88EF7E3F85DF501F670F617F48FFB5DF4DCFF38F51002
      81F7E004D5FA36072FFA7007A0F71D06BBFA240807FE2E0DC5FCA30F5FFB870D
      DFFCD7089BFF200471004F00240377FE16053FFED60381FFA00123015EFD5B02
      1DF78C033AF19F0413EF280549EEEE0280EEA60072F030005CF49AFE02F6F1FC
      20F44FFC92F6B1FEDFF9D6028AFA440398FBBD002CFF23FDAA0394FAAA04EAF9
      0704B4F98801DDF8D0FE30F880FEE1F740FD05F711F863F62DF36EF650F380F7
      25F6BCF7F2FAE1F9A8FE17FE0400340028FD2CFF09F886FAB5F9B1F8CAFDE2FB
      8EFE9AFE80FE96FE05015DFCC10632FC410ABCFE330B0201520954021B048B02
      7E01A9012D0172008FFFB9FFF3FDE3FFB6FE070184007B013E0261038C032107
      A505DD091F058E0930003B04C1012201B806F6038F0643079602B8085EFF6908
      45FF6B07D3FC730538FADB0242F8DDFF5BF676FD64F8F1FA9DFCF6F509FE88F2
      24FC72F4D9FA0AFA11FB82FE8CFC8A01A6FE7E0490011E057E01B60278FEC4FD
      EBFF15FC9802C4FF1F01AF0199FE940040FF8AFE9C020FFD900338FD7A0523FF
      0B08FE011E071A05F006CD074E065F0951023E0A30FCDB0968F7BB0828F4DD06
      E2F27308D1F4EA0CF3F8880D11FCC60C16FB4A0BEFFB860B5AFD870F98FA500F
      B2F7370AFEF7020440FCDDFE75FF4CFC880025FCDE00DAFCB4FFF2FC840000FC
      9F033AF86E024CF4B5FB59F2EBF7F7F18FF893F2BEFB77F5E4FF8FFAFA0234FF
      7E033503EEFF0A031FFF54037E0082088DFE4A0BAEFBCF0879FBB9025900E8FE
      0F043200A10420047404F0063201700555FF4E01ED011DFCF903DDF7E90344F5
      D904ABF3870665F261085DF46B0ADEF9690D4FFE400EC800E008C8FE970794FD
      A70B0202170C5305200A6505E2062A047F055F022203D5FF27FFA4FD1CFD95FB
      21FAB1FA03F93BFB0DFB33F978FAAAF60DF50EF77CF1ABF999F16FFC9EF3DAFF
      1AF7AC0397FA0C05AAFBE5042EF9AB02A2FA13029BFE4C0755FEB80AB8FC3509
      5AFDE7055C01F001260306FEBF03CAFB9806E3FAC406C7FA1405EBFB9A03DFFC
      CA0018FE41FB5BFE58F675FCA5F31BF91AF292F8B2F168FA16F339F941F5F9F7
      BFF410F79AF605F87EFAD8FE3DFABD03DDF808032BF9340006FDDAFC1801D3FA
      AA0165FA1A0106FB1BFFADFB01FD3CFCD3FD69FB2DFE23FAF9F772F941F126F9
      4AF082F941F3B8FB6BF873FFF7FC3F0104FE4302D9F908004EF8CEFD60FB4E01
      D5FA4204A6F935049EFBDE011201BDFF8B06C600B8085404D4094A084B088409
      390593085E05C706180751051206A3047D040B05240370062001950931FF910E
      ECFFF110F1021210B500DB0A95FF1006B8047608B106230C2205520D2402240D
      7EFFF60C92FDC80CEFF9980CB9F7DA0BAFF5AF0932F4CC0648F7980169FB1AFD
      4EFBEBFCA8F88F00DDF7710593F97D0929FC060C86FF5B0AEB014A06BDFFC400
      5AFF56FCF60203FFCA02AC02C000E102E600BB01FF04A2FFAB0873FE4908BBFE
      400944001A0A7802650AF5043A0C2D07490DAA08680A8807A8059C04F602ED01
      5B02090101039502D1049E01C007A0FF060748FD2006C9FAF208F3FD0A09FE00
      840747FFB10784FB790ADEF6FA0D8AF3E00E02F2C10E2CF28B0D4AF2440B2AF1
      970B51EFA80EF2EDA50D45ED4C0916EE790874F02E0BCAF3910EDEF8ED10B8FC
      AD10B8FFEF0A3B00CD05C5FF24072B04DD064907550470050804BE007E06EBFC
      780AD9FD940B63019B0A3D055608BB06C50457053004FB027607E5FFBB08D2FB
      4808D1F82E09AFF7760ABFF8F40B77FC990E6DFEF5125AFF901228FE400F2DFC
      DF10C5FF4E119E04620EB1066D0BEA0554082B0431053302A6FFDFFFD9F9E4FD
      F4F533FCBAF2C9FB33F20FFA24F479F7B8F252F77FEEA0FADBEC2CFFA0EE4C03
      4FF2D80690F601070CFAA405D1F8810257F745FF67FA9C02ADFAE80622F87406
      B5F76D0360FA3B001AFFD3FED700F2FE4102E7FF0705B20087048A01DD02A802
      BB010203C0FDAD00C1F6C2FD4BF17CFC08EF79FCBDEE85FEF8F04AFEA1F5C0FD
      0FF778FE51F6B9FD5CF80202AAF77D0773F4B0066FF29002E5F3B0FD25F9AEF9
      1BFC09F7DAFC06F64BFDC7F502FD4BF5BAFC40F485FE4BF389FD44F34AF602F6
      32F0F3F9D8EE3DFD5BF00B0134F46D020CF91503D3F8740142F74CFDA3FA78FE
      30FC1502E3FBD102D7FC5400C8FE76FC6E0241FC28038AFE9F01F500B000F802
      0AFFB003A8FD850418007703F002B900AA016B00E9FF0802A7FD5F04FAFACA07
      23FA6F081EFC31071EFDA80431FD2A00FC0161011106F60566069A06CF040A04
      AE018D0172FF0B009EFCBFFEDDF87EFE49F772FEABF7BFFEDDF838FD81FD17F9
      3F01EFF668FE4DF96DFAFEFD1FF91A0248F92E0467FACC02F7FCE100BFFCE8FD
      D3FB05FAC70072FCC803D102FB02B404D5011802B600C1FF8102BEFF2B020001
      25FF2B0365FF5805FB0011082901C70BD7035D0DD005AA0B1202D309D2FC6808
      E7F8DF07C1F6560AEEF6D20AF4FA430AB4FD780A81FD8F085B00880B5A01EE10
      22FF8B0E16FE16078AFEC2FF700234FB100645F9700648F854053AF77303DAF5
      7100E5F37EFF4EF1190165F080FEEEF29AFA43F731FBD5FA19FE4CFE6C012C00
      B8040202D0016D0325FBC701AFFA000453FA710932F8630AF0F8B10680FB7002
      0D016401E20406026E0466023B021E02C0FF6C00F0FCA1FE22FD37FB4802ECF6
      8005E0F51C071BF7810961F9D50BCAFB250EA1FBCD1133FCF213D5FC7D12AEF9
      F9126CFBBB12BE02C710DA051D10D804910FAA03A90F1803B80DF400D90786FD
      C20116FB91FE65FA95FB2DF96DF9F8F48CF980F214F64CF5DDF04BFA1DF06DFF
      CCF24F0360F7E303F1FC7103A9FE1A0233FD9CFE5700DDFF1903AA05B3012206
      A200C701E2FF93FE290307FE820789FEB508C8FE5C0A62FE2A0DA8FEAB0CD1FF
      AD0A3BFECF09FDF96A0429F78CFC41F69DF6E5F6CCF330F9ECF3BDF911F7DAF9
      B2F961FA65F9CEF832FC90FB94FD600332FAC704BDF71500C0F662FBACF927F8
      02FFEEF6A202ECF6640531F7A90735F654073DF468054FF1910565EFDA02E0F0
      B0FBF0F473F620FABFF5BCFF7DF8BE023EFE10046C01950403FF2E00BCFF5EFE
      600087026BFDC10367FB2D007DF9EAFC6EFB42FE7DFFB6015B018205B7021409
      2A043A0ACA03DA084902FF04490402019C05C0FFCA02E40194FEEA054BFBA309
      77FAED0A57FC9E0B14FF790B3C006F07E9034B075107AA0DCA07F70FBC070E0D
      9405890A9C046D09D4025A089CFE660734FBFC0667FA6E0606FB2104FAFBA2FE
      FFFF20FB4D0119FD62FD12022EFA6606DAF8600783F8F004DAF9890144FAA9FE
      55F867FA04FBD4FA7DFF400114005802B90080FEC1000BFCF90248FC0706FCFD
      7204C200C101720444018B07FB00BD0991018B09AF066E075609B504BA05CC02
      FE00810220FEDB0279FE4E02DB0143018504A701A403B6002D052302FC06A208
      75042008A8025B0045013BF92D033BF42E081FF1880AE3EEBE0AD9ED430A0CEC
      98091BEA5D08BCE9F309EEEA100C5EED63091EF15705AFF5490405F9BA05CDFA
      2508B2FCBE07D5FE5402B6FD5C00F9FDF600EB0364FF1C0645FFDE021AFF5AFF
      77009DFE93039F000F048B02470229052200C30590FD870314FB1D00FDFC29FC
      1F024DF97504FBF81E0597FAE2060BFC2709B4FCF60CF1FC72108EFC13109AF9
      FE0F9BFA4B0F4F037C0BAE088209BA084907A70899062408E406A00649030204
      D9FE9601DFFBF5FF5BF94CFE1AF507FCE6F251FB0AF281FD90EE5602A5EC1208
      C9EE170AACF2D4070DF75204C3F944013CF8DDFC54F94BFC59FDA70391FD4208
      1DFD010873FBA8071AFBFA065BFEC8053800E104B6006D05BD01C20557036B04
      3B02A9010E0125FF89FF8FFC8EF96EFCC6F24BFF11EEDC01ABECCB02D3EEA001
      94F10102DBF17801F1F331027FF63F0932F3830BC2EF4906BCED900053EE90FC
      D3F343FA2BF97EF844FD31F74200E3F45302F8F2B50248F38402BCF43A0380F6
      6700CBFA1FFA0F01A7F5100524F59A0572F8650436FD630301FE2EFFD8FED1FA
      88026EFC6E0245FC6C01CBF8EFFFACF688FEB7F6290030FA1601E3FE7500D703
      F0FE3005F3FD60036EFD230262FF3200DD04CCFE0F07F000C8030705F6FF0007
      2CFD010717FD8B054A00B604BF02FA01A1064A00ED0A6D06CC0A6809670A3706
      BD088B03A40657026E0602038F03290491FFAA0449FDE9021FFE40FF7F001DFB
      9C02B4F8870409F9F20392FBB600CFFF0FFEC7018FFC360042FD09FE6AFF66FD
      56FE42FBA3FE22F89B02E3FA4D04D7FC58043DFA25034BF9970126FA4102D3FC
      0903FC00A3021A06500184092601440BE501A10CDE03BE0B09072B0982065008
      8F01C209A3FB110B1BF81B0C3FF8BB0BEBF9620CDBF81B0C07F9490A39FCBC0E
      CFFB820F74FA2A0732F96FFECAF86BF630FCEDF08AFF5EEE00010FED3C017BEB
      7D0110ECAB016FF09D0002F4C6FFE0F468FF02F70FFD36FB5AFBAFFD4EFD47FF
      930040006702C90199FF830198FB39FF48FC540369FDC20679FE0A0438FFF900
      06FE71FE03FF92FDDAFF88FDDDFEB3FEE4FC00FF0EFAF5FD53F844FD97F889FA
      A1FB6BF65D008BF4870277F5EE0267F63F0481F73807F3F6BD0B9EF73E0D2DF8
      380EDBF77A112B004A11D9081F0F4A0A900BA9085807FD057C07A103EB06A101
      A9034500BEFF43FE3DFBFAFC9EF867FCA3F608FCFAF3FBFC59F2730035F02805
      90EECF060FEFDC0578F1D703D8F53E03B4F60D02B0F78CFF6EFD7F0316018F07
      0F02BC043201660111FF69FF3B008FFE4203C6FEFA04E7FE7805A2FC72058EF9
      8C05F2F7F704B3F53504A7F3470315F6C4FEF3FBFFF706FF3BF393FF33F37BFE
      9CF628FEE5F7E7FED4F892FE2CFBC70402F9850A8DF40107B9F03C0218EE9FFE
      71F250FC83FA8DFABE00D7F72E04CDF34A05B4F197059BF3090503F6D2037AF8
      A20272FD1EFFEF03AAF83107CEF4BC0717F649069FFA560546FD19046AFD5CFF
      27001C00B601DD03B9002102DCFF640060FEBD011DFFCC05A201CD098103BE0B
      D203CD0BFE02340A6003B30875059E065F0789045D08B005F406A6098802B60C
      F3FD780E0CFC4B0E92FE4A0EBB000B0E6101820B6205020F580716145B066E12
      4E06D00FDB044D0EDB043A0DCF04180C9C010E0A7CFD9006B4FAAD03EFFAEB01
      EEFCA1FFDFFD88FD65FECDFE1AFE0F046BFBD60611FAFA0655FAC906F2FB6E07
      85FA1E066CF7BBFF81FBD6FE0C01A201470473FFD90570FDE60390FD36022FFF
      AB03F201F30481040205010668063E079B0999073D0D4D05950EC000210F45FE
      2D0D3E002F07BD016C02C4023B0167026D030802780493024B04F5FFAD076D02
      8509660644077B01C60405FA9C0294F3BA033FEF110804EC8F0C1DE9960F98E8
      CE10FBEAE31048EE6A106EEFFD0ED3EFEB0D7DF29E0D94F8850AE7FC3B07D8FE
      2406F6FF53073E01FE06E5010C03B5FE5E0314015E06520634079904B4067201
      E7037DFF6D016DFFD401A2004203860112037101C300C6FFDCFDA9FDBBFD71FA
      83FF02F6DC0246F34E08BBF3920AC0F2B10A76F0790B2FEFAD0D7BF0640FEBF3
      230F84F66D1203007A15A40B0D13570D940F780AFA0B0A07F60942043E0B7E02
      BC0A860091057DFE72FE76FDFFF889FD39F630FDFDF233FD3CF1F4FFB5F2B505
      10F24B080EF0D805FBEE64016CF0E3FEF9F173FDA2F0D6F8E8F3AEFA65F93802
      25FB7103AFFBF0019CFA85017EFA5F02DEFC7C03CEFF7C0293019200BB0183FF
      6E0135FEA80253FCA2037DFB8102BEFC590090FF72FA57FF37F48DFDC7F14AFC
      7AF315FD27F5080048F3EEFFAFF38103E6F3AD09FBEF4406AAEBC7FEF7E80CF9
      5CEA86F4DEEF00F194F54DED26F93CEB6DFBD4ECADFC8FF195FE30F50B00D4F6
      6DFF2CFA70FF390067FDA50360F9A70332F7BA01AFF869FFA9FA85FCD7F9DEF4
      EAFB6FF314FFD1F839FFBFF933FF8BFBE3FDBBFFEAFBBE02DFFBC10363FD5003
      A5FDE30260FC54020EFB2D0252FC72014FFF29FFE9FFD0FE5C01CB027601EF05
      06FFAA0608FF40056E028E03A6045D033E02F6FF0803F1008306D60762069108
      F704D70516030304A2012403A6027E0284044601B1030700590215FF250291FF
      100363FEE103F2FB0C022EFC2C0172006B00A304C7FDEF0527FBC70458FA9C02
      C0F9FFFF70F645F906F8A4F7A7FE00FEA501A3FFED01AEFE12FFB1FFEFFA3102
      F3F92C0519FBDE07FEFC070B64FF1E0DB100D00D3D01E40BED025C089903BA07
      1104900BA402FA0DA1FDDA0D74F98C0DFDF80C0DEDF9830DD9F7BB0A2DF92B0A
      77FEE30DCEFE6D0836FC84FD0BF98AF580F799EF3CFA0FECA3FF26EB4F0371EC
      330425EF49043BF30A04BDF5060553F6C10423F9710426FF6E0481024B013103
      A0FC610397FAC202D3FA3303D8F80A0032FCF0FF00042406FB053706D7042F03
      130160021FFCE50102FA800141FBAF012AFC6D0360FA7203FDF7A50113F7E8FE
      44FA39FA2CFE62F82A02CBF9A2062BF8BE0788F5F906F5F3E00863F5C80C52FC
      390D3000010FBD036314000BF1150F0CB314ED08E2118C06D60EAB04F20DBF02
      AF0EA700450B70FF5203A4FD51FD26FDADF8B8FCC4F75FFA60F81DFB03F8C9FF
      72F77A02F6F45E0232F210023BF277018BF48F008EF352FC48F572FB1AFDB702
      2D02D40469041C02EC04C600C60345FF3C033FFCB40422F9A30581F858057EF8
      BE0514FBAB0547FD4A074BFC2908D1FC4407D0FF88053B00C8006FFE3FFB1CFE
      BBF8ECFE33F9AE016DF67B0114F4A201ADF6C0070AF6A907D3F3F100B9F458FB
      39F68BF546F8D2EF44FCCEEAAFFF30E8250131E9BE0277EEA20310F4080539F7
      F00456FC9F027B038D01F0060400670794FD690715FD9B04B8FE28018AFD08FB
      24FE77F72E04B2FEEF05950409049505FB00090634FD6304E1FB2603C7FDCA03
      A1005B0639001F0881FEF9082BFC440808FB0D045DFB930260FB890509FD1907
      1FFF2F0758FF200749FF3907EBFF260AF4FC810A3CFB800AC0FFF110CC02F812
      6103DA0FBE02830D9101E60AFB013708AB04E2049E06E001D303B3FD0C0154FB
      CCFE95FA3AFE2BF87CFF91FADDFEEE024DFE330994FD730A1EFB3F0875F9EC03
      3BF9ADFF63F5D3F817F34EF4CAF89DF9F3FD4BFDB2FE4DFC9DFC3DFD03F956FE
      51F76BFF6AFAF700E901D902B1073503620A4703140906020F0732FEBD07DAFD
      9507C10164076E048E055105EE004906F8FD920648FFF4074E00710748027805
      05098B078A0B9604B5089BFBDE04CFF40A012FF0E9FFC6ED2F024AEB050600E9
      080877E8060A16EBD60B0AEEDD0D60EFD80F80F4E40D4BFCC90A71006E070F01
      4902000141FE43FF1EFDDDFEDBFBB3FC30FD64FADD04890091081D04DA06BF02
      4C04F302FAFF04022BFDC9013DFD7B0223FF43035AFE42020EFC28FF07FAC1FA
      EAF958F46AFDB1F0F0FF86F02B0291EF9505EBEE920669F154060FF75C08BCFF
      EF077204AE073905530D800B4111840E5511CA0A670FB007EA0AF804CC070F03
      CF0718011108A3FFAE0374FE52FE87FF39FB730183FBCA0043FFF8029FFEEC07
      F8F995096BF6E507E4F243059EEFC90120EFCDFF15ED32FCC4EBA1F896F243FE
      47FA490474FE3B054901BD05A201CA03D500B301540111015403020232031104
      FE018C055B0036040FFED8FF4DFF09FEB900A7FFE50018008201A5FF21FEB101
      50F8CC04F2F4D30856F0090AEBEB75079FEE7E0A4EF1AA0BD2F0FA0442F12DFE
      93F0B3F7BFEFA5F302F159F145F58FF082F800F3E0FAE3F7E5FD64FCD9005BFE
      B904A6010F06BE056C0470063503E003AB01F8FF4DFEBBFA42FC49F8CDF974F6
      D3F811F5AAFFAAFD2B055F053804BF042202FB02A9FE07FF32FC1DFC72FC2FFC
      99FED2FD2AFFADFF0FFD890002FA440059F637FE32F764FF47FBD403CEFF7606
      5B073907F70C9307E20B2F077A095F08FA04D60799FF29048101FC0752044A0C
      5E04D70998042A07E802F3049602D7044C05E1046C0AEE02540D49FF820B4EFD
      15099DFD8C067BFD2C068801C105B707100247095600F506C100F70268FF75FD
      1DFFA7FA1CFDC0F875F94EF5ECFC9AF9B6015CFF8B01D0FEF4FF55FE4AFE6CFE
      7DFD5100F4FEDA034603A1076605FA093D04670A1003DD091D016F087F01A209
      0705F30CE9064D0EE307430D2406250C88FF010BBBFAF20A95F7F00875F52F02
      34F9270134FDB4023EFC1CFDBBF9C5F716F6C5F393F3E4EFA1F4EBEB68F98FE8
      1AFEBAE85B0093EB6002F3EFBA03FAF39D05FBF9A70699007603BF032FFE6903
      5BFB9202E7F95301CDFA3001CFFC5C0044FD45FB440269FCC307C9FFE90679FE
      02039EFE1AFEF7FD8DFAC4FD0AF9ABFE11FAC5FF89FBF50087FA06006BF906FD
      45F87BF70DF9EBF384FC81F3B0FE9BF252001BF287021CF4330126F70000DDFB
      F0FFD8FF3DFFB5FE4A058F02360D1F0966102509AC113508880F7807DC0A8106
      040716046E066C012E07F8FF3F04C7FF37001F019FFD6D0007FC4201B5FB0805
      DBF83207F5F47A0764F4C206EDF2630455F161028CEFE4FFAAEC03FA74F151FA
      22FA14FF1FFF46FD6602ADF97B03C9F71F03F3F82D029CFC310291013A026904
      AB001D039D0020001601AEFB26013DFA85033FFC0E0574FE8304E8FE20046700
      0CFF07042AF83908FEF1A70AA8ECF60787EFE1086CF6DA0B18FAA705E6FAE4FB
      4DF871F465F4E2EF92F112ED4CF225EC79F5CCEEAFF753F360FA17F84BFD29FC
      2F005D02F0028E093C03290D5001F40A410157064D0146027F004000D1FD6A00
      E6F84AFD84FB0FFF4803F6049206EF04A6055A04FF02EB03F400B9048400D207
      A001CE0BB502E90E2D010D0E98FDE60AC8F99F0659F8170573FB9A0608015B07
      A4059C064B0992064E09BF08C805A20D2C02DD120EFE9312CEFF071425054D17
      11063B1352066D0D2B0642095F042C06F0025102110421FEA20608FCA90670FD
      9903420358003408BEFE290C82FF7E0FE2006E0FC4FFEA0BAB00A506CF01DB01
      A0FF190043FC48007FF60CFDEDF5BDFDACFA5C03DEFBCF02D3FC27002EFF9EFF
      2B0326010C08E4022B0C3F03CB0E5302FC0C5600A60914FF7D072FFD9305CFFD
      E5057E005809D502040CBA03630EEA043A0DE00710083409B40431075002A2FF
      740515FC9E0B4FFEC80B14FB5E0857F5820333F038FF26EB40FDFDE5A9FE2DE3
      AE033EE5F0079DEA830B5DF1BE0EA1F63C107DFC84107F018C0E2503DB086F01
      6904F6FE450369FD920345FCD50303FC540045F8E6001AF9FF062F00200AD402
      D10902043607BB03AB048B012102A5FFD600C8FDA10157FB3601C1F610FFC1F0
      08FD2DEAB0FC67E882FE87EB450248EF8004C3F1D50621F3670A27F5D70B88F8
      510C39FD6B0BA7FDFC0DC0FF3C14480636152E070413B505B910ED04540DD803
      7F08C7010907E6FF8D0B8FFF2D101C002A119F01F40D5700C4080C00BE02BE02
      36FDC60428F6EE0477F09E02D2EF2EFF9CEEBFFC66EC79FCF4E873F9EAE913F9
      32F2A2FEF3F89DFEF6FD2EFC74019FFCC202A6FFE901E903FAFFB50525009504
      6CFF67016AFDB3FE24FDECFB2DFE5CFCE8FEBDFF19020902BA042C02F604CB01
      6A0353048FFCD50663F4A80770EDBC0317ED4A0016F4F200ACF777FBADF63EF4
      E1F221F1B2EE0CF072EC8CEF31EC3FEF0DF0DCF00AF47DF390F6B9F63DF9C7F8
      E2FBF1FB0BFE5EFFF2FFB5FE56005FFB24FE2EF97EFCCFF9BDFA0CFC05F823FF
      BFF2FEFCF1F158FB2AFBE4FF4B0324019B06AB001A0555001D012CFF16FDA5FF
      53F9F5006CF90F0292F92502FFF6140273F4160128F55A01C6F9D2020B021402
      7C092F00420C38FF6D0CE800A0095B04C704DB0822FF720834FD2A063D01EC08
      8C029608F10029060801C004AE02EE01310483FDA505E8F9560AB2F9670D10FD
      840B740310070C0733031508AD00FE08CEFFA908C5FFA506A2FE0804ACFF6A02
      1E00BE01B6FD710272F897FF7DF47BFC75F64BFF09F7FFFF63F7D9FED7F9BCFF
      C4FC7F0197FF02042FFF330600FF9F082BFE900ABDFAB30B3CF87C0ABBF87A09
      A1F92E0918FC37087C01170709055306220634084A034B086FFD200789F65504
      41F37B024EF70506AAF9820453F93FFD45F90EF6C4F81DEFDFF82CE9FDF810E6
      76FCD1E7CC0047EC790213F2740324F84504F4FE1704AD048F0227078801DD06
      6E004504D2000902E1031500AA059AFF1E0189FC8FFA40F9E3FBD8FC20FFD8FF
      4700EA0112001604CCFDA904F7FBF3056FF947065FFA65052EFD7B01B9FD8EFB
      97FC65F7E2FAF1F6B9F977F94EFA21FB7EFDE0F99EFF84F705014EF8C3022FFC
      850345023D022305020334054D0A2B094410940A0111BF084E10AC06AB0EBC03
      1A0BB50092063BFDD4079FFBC50C49FC150F5FFF2B0D730216078E046600C306
      31FB5B0786F85105C2F53C01A1F3B2FD8FF319FBA6F260FA36EF09F875ECD1F3
      15F1DBF4E5F77DF780FC1CFA07003FFFB001FF04A402F208D10172080203D805
      49057302950407FFF802ACFCB80275FC9A02B1FD6201AEFEE5024AFF7B049D00
      29033206BDFF7F0C9EFAA50FBAF5660C93F4AB0426FB8500D9000CFC2DFFD3F5
      61FA81F1DEF435EE8BF1BCEBE3EF49EA2BF2F9EB30F7EBEFAAFA0CF578FE47FB
      9A02460113069F04BA0848055F0B6205500BB10457072E05DE03F0046B029C03
      80FE0FFFFDF834F9B2FBE4FB6D035E01A508D105330B9809AD09010AB406C409
      45029F08D2FF860714FF77068AFA5604C8F6E60134F6C00063F82F01CCFCDC01
      30021103BE05DB0495053C097404AA0E14036E13C2FEEF12ACFA340D90FD940B
      25020E0A630233065301580228013DFE2E0251FC5300E2FB85FF08FE84021802
      AC033C06E3034509E502E109B301980822010706800188029E014DFE18FF78FB
      5AFDA2FA02FC7BFC61F7BFFC88F13CFAB7F06BFCA5F35EFE4BF7C6FCECFCE6FB
      B40216FC7F0646FDA10597FD9303F0FDF802FBFDE00046FD5AFEC9FC6BFD44FD
      DBFD0FFF01FE4A018C00A403B8062805500B6007F10CC309670CCB0A22066707
      65FE060075FEF9FB5202C9F88902EDF2C90030EEC3FE24EBBDFD6BE92CFDB0E9
      F7FD73ECDA01FBEF45058DF31F0886F89C0ABEFDA40AA6008008F100DB0742FF
      F00837FC0408D3FA350617FB33068BFD90034FFE07FD9AFB1DFCE3FDDF007202
      EB038404B4051A069F05AB0520045003350175FFB0FE79FA63FF7AF67BFEA3F4
      70FB74F547F8EFF783F675F9F7F76DF8C6FC90F5540347F32307ECF43008ADF9
      FA09F4FF63085203B0030C02A40410055E08B60981084C0ADC068109CC041207
      33043803CC0476FF000749FEB20DA3FF47130E03D513110702107A0846087307
      0D00F805CFF97F04D5F53E03DFF15403FEEED5039BF0280574F18102D7EEC2FA
      42F16DF91DF8F8FD07FC7D01DCFE89053801A208C1023E0978022908BA01FC06
      83037006A20337065C017307A2FFF2088CFF90094D00BE0942010F09BC039F08
      D203430B0FFF8B0E37FCF10F57F9690C17F4ED03E5F446006DF91301EEF861FF
      55F564FDC5F19CFB58EF03F905EEDCF75AEE95F8B7F2CFF95CF7D3FBCDFAF4FE
      06FEDE00ACFF7F0117001E03480012058E00910598FFFB0433FCA3023AFCD0FF
      0AFE73FB2DFBB7F42FFB8BF48400A4FA1F05ACFFF4076B039F087E049405C302
      F8FF8900BBFA5EFF25F887FFE1F622FFB5F662FFE7F84400D9FB0000A5FFC6FF
      B80371FF3307F1FFF808BA032907A208D005070D1E04FB0ED0FEC40B60FEBE0A
      9103480CFD05A008FB0595030B06B000510766FFD2075AFF9506AAFF44076E00
      8F08AB02C3085307F9083B0B62072D0B1A05BE09FE035C08D8024506F7015004
      D5FF9B026EFF1402A3FFDFFF78F99AF9FCF4B9F666F8E9F8F1FC24FADE0039FC
      4504130078052E04FC03FE07E600C80ACAFF000C1EFFDF0A4BFC9709FDF97807
      D4F9A50489FBDA0211FE050160006C0084033005ED03CD0CDA023511DB00BD0E
      FEF8BC04A1F420FDD4F7D9FAA4F98CF6E8F89FF14EF8C9ED37F895EA64F7E3E9
      CAF5C8EBBEF64FEFE2F896F47CFA7FFBD2FCED002CFD2603BEFC7C03D1FF7F02
      DC04DEFF3B0992FD840855FC2E05DAFB9F03A0FAEEFDFBF558F95AF403FBEBF8
      F7FC04FEA9FEDD029F00B105D8014D0360012FFD0D0031F8C5006CF7EA0198F7
      C2FF49F82CFC4FF8DEF82CF5F8F650F20DF90CF106FD60F249016CF7D602C3FD
      FC017203D501550613FEA303E9FC5B025D03D304FD0782031C087F00BA057FFD
      8405F2FAF10712FA010916FB4D0AA4FEDB0B0504600CFA0A510C3B0E090A780A
      19042004B0FE8DFF4EFAD9FC7CF7C3FB63F5D3FA85F39EF884F479F588F15BF1
      54EECAF154F236F8E8F62FFD7CFA85FFFAFDF200190124017903EEFF270422FE
      2406B2FC290867FB4B0643FC3C0255FD9BFF64FDE8FE1CFEF600D9FE5602CF00
      C1012006C300860CFB006F0F79044A0CDB020F0364FF63FC600004FC98FE25FA
      66F9B1F5DAF35FF10EF0C4EEA6EEB2EF78EEC0F2CAF1EFF557F83FF8B5FD85FA
      4702D8FD87059601C30527059906E7074F0765079206960440031C02D7FDEAFF
      CAFCFFFD27FB8FFAB9F8DAFAE7FBFC0150FFAE087B03E40C3A08F50D040B140A
      E10A160492052E00D7FF01FF88FD43FF80FCA60192FB850480FCBE055AFDAC06
      7DFFAD07140378094E06F70C020845107C06DA117F063C114804C10C49017208
      06058B07C10712065C0692051B03570687006007C700260830011207A601B606
      D4024D08C004CD0C89076A0F4F0AC60C6009A1090F070908FA048F072002BF07
      1C00ED072AFDAD07E7FBB906DFF7A30217F24BFFB7F6DC0048FF3402A1052802
      3E0ACE02D20A8303F708E1024C05620103032200400355FF9E02B300A0000301
      23009EFE3C01C3FB1005C9F90D0901FDCE099204000C7F0B2F0D860D0F0ED507
      610B35FC3F0493F2790323F1190496F15B020BF01700F2EE0BFE38EEA1FD54EF
      00FD89F171FE4EF3C40208F5DF069CF8D5082DFC810980FDBB0968FE480CD0FE
      820FF4FEC210F7FEEB0F8EFF590AF8FF270667FF48034EFCEAFE40F9B8FFC8FB
      CC018AFF0D038401A30566014A0716FDBD0780F86D0472F7E000F4F7320073F8
      81FFBDF8C7FD5CF66BFC43F104FC15ED67FE45EB4E0415EDBA0992F2BC0DE6F8
      E40D74FE8E0C0603070A420460056D03F4069F05BE0930079307410501058702
      E205BCFFA10AD4FDC60EA5FD091178FFF5101003F20F8B084B0FDC0A480E7F07
      420A5E04B403D502CFFD2E02EEF61F010BF2E8FD26EF7BFBDAEED0FB64EFCEFA
      F0EC0EF90EEF3BFC38F4BBFF3FF7820046F981025CFA30059FFB2207B3FB0C08
      B8FB67081EFD44085AFD3C09FCFA0909DDF8E50597F8F302DAFA8900D7FD2301
      3CFC4105B4FB950971FDD20AF0FE9007CCFFB900A3FB80FA7DF91BFAA2F8E9FA
      32F4D3F738F006F435ED28F1F3EC9CF015ED0BF2CBEDD0F264F1C3F308F5A4F8
      95F6DAFE55F77A023DF77D052EF7650584F9F1026DFAC5FFB8FA56FCF9F97DF9
      FAF8EBF65FF9F2F47BF75FF453F841FA55FACD02F9FA8A077BFEBE0899018E05
      D502FAFFDEFE4DFCECF8E5FBC4F855FD17FB2E0021FCD50167FC5B0042FB93FE
      75FA32FD3DFD29FEFAFFF201510294066A033A0A0103C00B0B0229094EFF2802
      FD00B5FFCE0438010D05880050040C005803A0FF5B0432FE9305DFFC560569FD
      A6051F0138064B087D07EB0D5D092E0EB409C00CE506250B02045A094E008F06
      CFFCC30297FB86FFC4F905FD2BF706FAFBF325F6D3F5BBF618FCB5FA100135FD
      250479000703D70315007F059DFC5C0585F95204FAF80C034CF9F802C4F7C201
      A7F5EBFC07F50CFA63F5F2FB9DF76602E3F7C00A76F730113CFACE11C4FDD90B
      C5FFDE019DFD25F7B4FC91F23CFE36F235FCF0EF2FF9D3ED34F6DAED40F5F6EF
      B8F5B9F298F502F5F3F74AF740FB3EFB5DFC47FFA6FDAD009B01D6011B069201
      B60B0A00200FDBFD8C0D88FB1C09BBF9A1038FF85FFF62F8A4FB06F753FB08FA
      EEFD35018EFE83045600480463024003630399015203C7004401BD0157015D02
      120239021E0089FFBBFCC7FA09FA69F811F9FDF8CBFB06FDFCFF8802FF022A07
      4F05060A1506530AEF0416081F029C0216032D0079065C01630697FF9B066BFC
      26083BFAEF0ACBF9DC0E31FBBD0F45FEEF0DDD02810BEA07260AB609610BB805
      D30CEAFF090B06FB400736F869023FF636FC52F584F731F751F4A6F9EAF009FB
      72EDA1F907EEC2F838F3DEFAC0F719FC60FC9FFD5A0012001503E5012D053003
      630533049E052B057906860636050506B301A0024CFF720060FEA0FF40FFF701
      F600C80686022E0AEC04750B5B083609B6095C03C90563FB5801E5F67DFE04F7
      EDF959F54DF681F1A4F498EF72F4B5F02AF621F246F7B7F293F968F568FE10FB
      2E03D50081076104000B8D06190C4E06CD0CEC04D20C1104A90A39030908F502
      D8052403A2034F038400AA013400F602BE02D60838031E0CEF04BD0BC2080109
      E20A0A045B0ADEFFF3060BFEE403EFFE7002D2029F0070054EFD670561F9DE05
      89F6A80619F76F08D0FA5B0A37FE630BBE006E0CAF02640C2502250A59FE8806
      BEFC4A06B6FDBE0950FC750B7EFA6809FDF8AA05E1F8580298FBE4FF14FE57FF
      9B00BF01C303B406C8058C0A86076C0A34094B08760893058A05D503B2013C03
      23FD7502BAF9D2015EF88B0199F6300009F56BFC8AF7F4F983FDCCFB4B02DEFD
      610499FEB4039BFFA6003E0062FD690030FAC1FF58F840FF43F9C5FF4AFA97FD
      F8F8CCF8C2F77DF7DCF769FA13FA4B0113FE09090000010C5A00050B1903C406
      FF0512FF6A058DF6410514F3F4053CF6650303F857FF35F515FCE6F295F904F3
      F4F80DF460F9FAF3E8FA19F4D3FECAF65D02C1F961059FFBA4095BFE320C5E00
      420E1D018C0F5F01070D60003D087DFF070468FED4008AFCAEFC3CF994FC1CF8
      AC007AFC72020800F701EB011E01A103BE00B70229017E016200DFFF22FE8DFE
      FAFD79FEC2FEF5FB83FEDFF615FEBFF33FFD3EF40FFE6DF75001D5FB6D0478FF
      1D06A303AB07D8069B078D073B038305850026035A019204BB00BE04BB01D801
      FC037AFF4B068AFEF9096EFF860AC1010408BC052E069F0AFA040A0D08054D0B
      B407CA0766093903F10753FF1D0392FE6BFB49FF4AF49900B1F19402AFF11503
      19EFC8FF0DEF96FBA6F3BEFCB7F7770190FBFA05BBFEF50AF9FFA60E48001910
      F4FED90E16FD370D56FD380DA2FE570B3AFE85069CFDB3025DFD830136FDEE03
      A3FF0109E7027A0C18030E0F2503C50FCC036C0C99FF3306A3FBD4002DFBFBFF
      69F8AAFE0EF5D7F96AF316F754F263F704F21CF967F1A0FBC2F0D8FEE8F20B04
      54F73D08E1FA6808A7FD2007BFFE4C046AFE67009EFF19FDBA00D2F9560083F8
      2F00C4F780006CF685FDB2F4FAFAD2F477FDC2FA17FF7A0092FF5C01A4001B00
      EB0146FCF90338F8CD05E7F648052CF93B04F5FD5804CEFF48010EFE76FCB5FC
      FEF7F5FCE2F5CAFE7AF8DF0131FD7A04F900BB06A403AE07A1059C0783024E06
      2900D403CE042A05E107E1052008A3029A07210018063DFFD3064F004908B602
      96085B07BB09FD0C4E0B4F0F140AB90DDD08490A15085206D70580036F033E02
      38008400DFFC6EFF06FCC1FEC7FE2CFD00FE11FA23FC8BF6A90041F8F40306FD
      8D0496FF09058501B904B40266040F03BA0266029F0015024AFFF602D5FE6102
      8BFC5D002DF966FF32F78701A8F6610699F8CF0A4DFB380B74FC88091FFD9A06
      5B01480068033DF81503AFF139064FF00605A0F0B7FF3DEE4FFA8EEE4CF5DFF1
      28F306F5DFF2A8F60BF33BF8D2F313FC86F798FEF9FC32FFB5029EFF6A07E6FE
      590997FD4C0937FC48071BFA8C036CF958005EF904003FF8FCFDA4F55CFBA3F2
      3BFEB2F59A0000FC9800C4FE62001200B500E0FE2803FCFAAC045FF71A04C6F6
      E102C6F9DA03F8FA4704DFF9F40248F914017FF982FE02FBC7FE64FDCA009EFF
      64022502AC03C9035406550355050B01CF0043FD6E027AFC43056DFD8005CEFB
      CD0506FBEF05D6FBCF0688FDB606B8FFE4046D026C03BF05F804840624065B04
      9A07C9FFE6093DFA8908A5F89C05B3FAD00017FCE1FA51FDCAF6BCFD36F6A4FB
      ACF3FDF6FCEE2CF128F217F10DF860F659FC4BFA55014EFDBF04CFFF6806AA01
      1B057502E6019A0331FF42063FFF5606D8FF2603B7FEA5FF1DFDD7FDDAFB05FF
      CDFEB702A90372053A071907A907AA07150665047C024FFEBFFCA8F834FD44F7
      0BFEF4F7BEFA30F5EBF76AF390F459F58DF208F80CF256F918F3BCFAFDF5F8FD
      DFFB2CFF7A0298FE5E07A0FEE80AD0FF790AC4010A099003AB077603CD043E02
      4E01630126FFCDFFD8FB28FED6F5EEFCADF6600042FB65067CFDB00759FF9506
      21006D03C6036EFF5D07A5FD8A07AEFF3905B9044D02A506B0FE2C0530F91903
      15F523029FF27302A0F4E303BFF9D005CBFDCA07FFFFE10A0C02AC0CC701A50C
      84FC9F0AB1FCAE0868000608C9FF700470FF5601D6FFE4007C017401F2036902
      B005DC04C70681097A08BB0C5809310E51074D0D3506330BA804780A0C03570B
      F100DF0B1EFDF10A51FB440ABEFDF1080B00290688FDC3011AFF6900EC022D04
      B8010C063F014A06FF0121063003D704CC027102A4FFCF0070FBFE0116F99901
      B2F9E6FE30FA11FC0BFB0BFB84FB2EFC6BFD2CFF1001D5010A04F7027B05A403
      2506EA006E0734FB220680F5930779F31E0AA1F4B40520F34C00EAF227FCC6F5
      24FAA7F7F1F925F855FAA6F897FB4AFB4BFF7FFDDD0522FFBA0AB5001D0E1B02
      310DF802350AB20296088A01F3064BFF1B0694FD420667FB08066DF80501C0F5
      63FF9AF83503CB00A90332053E037C05DE012A02D100F1FBBC0032F75E004FF7
      FAFF02FB1A00B2FB6E020DF92F03D7F5AC0206F58900BFF64FFF99F9400162FD
      3F03A90075050B04FD0763062A0A17074F070405D906DD02CB0CE303530E9202
      810D2100980C71FF910AF4FF120852024006EC06AE05CF0BE806B50CC50A6A0A
      AA0BED05970A8C01C808B4FF1A0640005103A60135FE5E0187F9C30093F7BCFF
      DAF6F3FD47F3D8FB7DF286FCCCF7D4023DFA97079AFBC60981FDDA0B5AFE4D0C
      E7FC6B0BDDF8830BAEF5CD0CD4F4AA0AB5F7D60512FA5F0056FA2BFDB2F995FD
      7CFA6B0196FD3606B6FF630848000409C9FD180638FA5B002CF668F9EEF560F4
      A3FB60F4F2FB60F3CAF713F3C5F3A8F6AFF0A6F989EF99FBF1EE7BFD48EFDFFE
      98F01AFE06F5B3FC00FAF9FBFFFD2EFC05FF22FCBBFD54FB7CFD57FA21FC7AF8
      21FA14F84BF8B3F7B6F63AF7A2F210F71BF1CCF920F69B01FAF84D05D9F97B03
      BBFABDFFDAFCE4FAF600ADF81B0355FBD7020701E9FFCE0348FDCA0224FB8200
      C0F8E0FEB3F680FE59F542FFBEF6F10085F8000385FA440623FDB108C8FF9709
      61FFCD0657FF31021C05CE01F4077A014C07C5008F06D10185053A021D05AE02
      E8044E06BB040D0C1604860E8C05F90D7A06B50B3E058F08280393063101C106
      A9004007C5FE6206E9FCCC050EFE8F043B003502E5FE33FEB0FCEBFAC8FE75FD
      6AFF19000EFFA1FF0C0169FF40035EFFB8035AFF0600A60119FBBD0521F7BC05
      57F6C50262F6F7FE87F443FCF5F1D3FC87F0780049F3A5049EF6650595F98D04
      F3FB9D01A4FC96FCD1FB4BF61EFC16F1310183F18C02D9F28EFEA0F335FA6FF6
      5AF62EF8C5F49DF88EF4B2F939F61FFC79F954FD4EFF41FD200671FDDF0A37FE
      500B61FFF607FCFF250699FF800566FD2B0561FC370592FB930469F9D60002F7
      D7FD0BF76101FAFD7704050427050C045F06DA01D2069CFDB4071CFB7E087DFE
      6F08F00420081508D408F50671099604A90726031D0407037600A703D1FFB404
      B601E104FF03B605D7066306CF092C06C309AD03F708D9FE3B0D24FE380FE6FD
      8E0C85FB90094EFAFB05E4F8E603C1F8D003E5FB89056700B20653014B08D5FE
      560ACDFB0F0AE4F8680811F86B066AFA70053FFC6C0364FB62FF4AFACAFCDFF8
      8DFC03F707FAE5F3DCF62AF13DF922F551FC87FB7FFD04FF35FF44020B011B04
      33021B055E00DD07F0FC420B23FA6E0AADFAA8057AFEBB00290101FDD50112FC
      ED017FFEDA0362025A068D044606F905D60442056102C60069FD11FA9BFA07F4
      4DFE4FF3040149F432FE34F4DCF99DF570F657F74CF512F8F2F569F881F8C2F9
      1CFC04FA4C0138FA5308E3FBDA0D63FE32107B01D10EDB039D0C1805630AD403
      1E079502A7042701E7020FFF18FFBAFD1DFCC8FDCEFF3D03BC047B08B8061608
      FC07FF05AD086802A50856FF33085A01D7067E06E902F4076BFF5B05E0FD1A02
      0EFCAB00AAF8600107F562024CF47F0447F69206C2F8B20931FB950C8AFDA60C
      DFFCD0091CFBD10315FEA601A201CF0188019EFF8400F1FD73FF1FFC83FE86FB
      24FED0FEFDFE54048DFFB8069F00BE060A0427060206FA03F1035102E1001003
      67000305DE00EA047E00CD03A1002E020B02E000110190FFAAFDBDFC25FE37FE
      4D00C201F100C8017401D501D70152013302FA00EAFF2D032EFB2006DBF55905
      16F37B00E5F428FB55F772F79DF7EEF737F73BFC59F93401DBFC300322FF0004
      76003F038B007CFF28FDC3FACBFA77F5B6FFE7F41C05A9F760050BF89A0271F8
      F6FFDFF8DDFFF1F8F5FF29FAECFF06FC650028FCB60197FB1B06A1FB820A11FC
      160B14FDEF0856FD880636FD9B0546FCE504EEFB260411FB980391F9D8FF25F9
      7BFB60F9A9FD39FE8A018003380235039E02EB00D002D3FC0803F4F82A02F4FA
      980116001B01EF01690033003501F6FD5D0170FD75FF54FE60FCAEFF28FB2201
      80FC6901D9FEB2028A0189043D0562059E06EB0472064F00C70A4FFEC60E6C00
      4E0E89FFBA0AF9FD3D05DFFC4301F8FD2CFF0F048CFF980A3B00780B21005B09
      30028B074E047D05CB0224046DFFDE0332FE7804B1FE560306FE6B025CFC0B02
      CAFC9D0155FBDF01F2F7B4FFC4F9EA0079FC5C0644FCC60835FCE20959FC770A
      4BFD360BBCFCF40DE8F955105DF78C0E8DF7C309B2FBC90481FF88001B0088FF
      8EFE2D02A9FE6706A2009708DF00150A0000650AE9FF8F0789FCB00373F6BFFD
      B5F737FB26FCB5FE8CFCAC00EDF943020DF5930324F23503DCF0A7036BF13E03
      30F37600B0F5E1FC06FBDAFAF200F8FA5F047AFCEC0352FD5A013DFDDDFE53FB
      B3FC9DF913FADFF7F9F816F559F616F501F215F5A2F567F747FD4BFC2101DAFB
      C103F1F8DD04EDF535059AF4600445F9900258FFCA004601C0FE6FFFD7FE89FD
      0DFF1EFD30FDA2FCBEF9EBFC81F691FE41F52600A7F50203B9F6C40545FA9806
      8DFD6B0638FE67027D03D8FFE909E102860B8E03EA0A4502C407EB003404DA00
      4701E1048B00EE086701170A6301BC086603CE06DE06F6041F08EE0248061703
      EB035B058502790512024904DF008F02D601A7FF6C02A5FD08FEA3F933FE11F8
      5C01DEFCC1014FFF95024BFF2B03A1FF5A045301480460059E018408BCFD6607
      62F90402A9F8E1FB97FA03F884FA3FF8E4F890FBB3F8DEFFFAFA9701CAFD7402
      ADFE5E03A4FFED00DFFE9EFCF0F923F6D8FAF9F1230153F4E5022FF6BF01F3F6
      7DFE1BF841FCBFF836FBEAF913FBF6F990FC1DFA80FC0FFA01FF21FAEC028BFB
      D504DFFC6E0421FE1B0297FFCEFF87FEDBFEBAFB17FE73F9DDFD22F679FCB6F5
      29F758F5D9F711F58BFE45F9280211FA7A05F6F83508D0F7480AFFF6300A69FB
      3C0707014D054B03FA022401FD027AFEAD0442FE59040DFF780235009F00BC01
      B80089026903BA0319070B06520AAA06130BA006B70756025908BAFC520D06FD
      C90D53FBEB0A96F7BA05A0F5FFFF39F8EAFB70FFA0FA5C03F2FCF5033CFED301
      F0FF8DFF4203BFFE17050AFDEE031AFD050172FEE5FF8DFD1600C7FB1DFF95FA
      42FF52F9450073F9DCFC79F793FB73F548FE0AFA78FDCBFD39FD57FF5DFD6601
      83FD0504BBFD3C08EFFB2D0AE4FA9F0850FA89034DFC78FE90006AFC24035AFD
      3302C900A100AF04DA003D06A601770669012408EC0053072E00FE0296FA43FC
      A4F711F705FCBCF9AFFD58FDBDFC64FD07FA8CFCEAF639FBDFF66EFB32F8F1FB
      86FB35FCEBFDFBFBE00080FCD90542FF7F090802DB0998035307EC0389044002
      8F024FFF720038FD30FEF2FA15FCA7FBEDF604FDD0F644FDDCFD0502E6FF4204
      A700090388015101640187FF3C0123028BFDB40591FA6E07BBF7410681F66F03
      05F8FA0196F86D0166F7780132F5150313F5F804D9F60A0695F8060887FA1108
      DCFC7F0786FB860492FCB4FF0A04BF01AA0723031F0851016D06350045021E01
      2EFF00065EFD040AA7FE0B0CA0FF690B17007C0A8203AE0A9608A709120BB409
      3708410CE7048F0E0F04520FF102BF0F0A03090E4704EE0BE5009808E5FDEC04
      B2006E077B017C08830151061403D005CB025B07C901390BFCFEB90BEFFB7107
      08F9B0FEC4F7DCF601FA65F4EBFCDFF58BFD4EFAAFFCFAFEBCFD5301E1FF0F01
      9A00AC01A80047004401E0FC30FE49F8D3FB18F3A20195F5A7062EFAB20803FB
      A80A44FB1909D9FB7C0621FD4C047BFC320384FA5B02ECF7F401B7F6B603E6F8
      BC0598FC6205DAFFFD0299005601C8FE3F01A9FB6C0156FAD400BEF9540028FA
      76FCF1F98BF9AEF6F4FEE0F78503DCF93305C6F8F407F9F7DB0863F7A70818FA
      200515FE89001600C9FD22FF8CFC97FD2FFF21FE3D028FFEB20241FEE6004BFE
      2C0032FE06034AFE12079000180A3802BF0C7503ED0B9E023C0AD9FD4C1086FD
      2415CCFD41147AFB5011F9FB660BF1FE500604040603B70732037A089504C206
      86041D05DC059C048C084A02C4093A00D4074E016E05F702F2043A03C9043504
      0A04B604270408059000E103F8FACDFF80FCE10087FEDA0414FD24061FFDCF07
      8FFC500AD2FB1E0E43FB0E108AFB0C0EF2FA4A0837F81F023BF801FF0BFA88FD
      98FACCFD77F94BFFA9F8FF0035F91A03D6F88A0622F80B06B1F81501ECF6C0FA
      3AF321F4FDF44AF698F8EAFB0AF913FC6AF9C1FA2EF8D1F9D7F61EFBBBF611FC
      DDF71BFB0DFA56F9F9FA3EF838FD44FAD00026FDA901B5FEF9FEDDFE4AFBEAFC
      B6F8D3F8D2F667F634F4E1F4A5F245F593F083F7EBEE84F673F4D6F878FB9DFC
      3FFE46FC560001FC1D0148FCBEFF50FF3AFCF503B3F7C706DEF4390502F44D01
      4DF6F1FF5FFA29FF89FB5EFE6EF91DFE27F789FD24F747FD5EF80600DAF95203
      2DFD2505B5FE2605ADFE2501AE04A601B80BAB04E10CBC03360B01036407D003
      AF02460899FE0B0C12FDBC0C65FE220BC5FF55097903FB0AC60A330C420F060C
      0E0DFA0CC107AF0DB103F40BBE01280ADE00CC07CB01DF054300E90478FB0A00
      4BFCB4FD710086FF7701E3FF59025A013902CC043900890889FD8A08E4FADD03
      22F994FC4EF797F61CF790F57BF907F875FADEFBD9F7ACFFE4F51E028DF69702
      84F7550474F7610552F7A30217F5FDFC27F118F5E3F261F4C9F8C7F94EFD14FB
      460172FA78025EFAC30052FCA1FEFFFC17FDACFACCFD92F7BBFD3BF5B3FCE5F7
      8AFE43FCE20013FEE900E5FD6C0090FC8200FDF90A0082F952FE21F978FD87F7
      01FC2DF7D1F865F4F3FB08F65804E5FBF709F9FE620EF000151120028C101205
      290EF807CA09B6091A051B0AA2012E099400B9092C030A0A5D05270966049608
      3204D9082907F208320A9F0ABA0A670BBA0B6409F60A2E05C107F8FB140A6EF6
      F50EE8F6B20E56F6F80A13F54B063FF58301F6F9A3FDDCFD57FC71FECFFD16FC
      76FF37F7FC00E4F5AB0439F6E9072EF6450894F70D07CBF94F0553FA1A04C1FA
      8A0210FB1603A6FAA3023FFA7FFDF3F59BFB05F5A7FD96F975FD3DFC68FC4FFE
      07FCAB016CFB5207CAFBB909B0FDA7073BFF870336FF3BFF88FE55FEC4FF21FE
      6F01FDFD88FFE3FEA7FCE901F1FB16040FFD3E05E3FD5E051EFF7F01ACFE29FB
      66FAFEF246F91BF17FFBF2F536FC9EF78FFCA6F6B2FDAFF611FF91F9F3FF8BFB
      0A015CFBB70298FAC403A1F9E60328FC510632006A09D902B6083303E8062701
      7D057EFD5004CFFB8D0254FCA302EEFDE5030E01F40073FFECFF6CFE6604E800
      14084C00070ADFFE290BA2FF9808100462039608A7FE1A0AE1FA6908BDF83E05
      89F8090406FB8703E3FC720180FAAEFE93F7A8FD39F7E3FD53F91F0181FBC104
      45FEA905D5FFE70453FD88FF25FE74FCEC03FFFEC7068EFF6F052FFE4F0231FF
      A4FEBF03ACFAE50516F80105D1F81903A1FB9900B0FFBD017706F503DC0CE204
      8F0E92068E0DF6088B09B508F70460074E01BD06BDFF350600004405ABFC81FF
      DAFB40FCE6FF8DFFAF0234019303DB007703C9016302640472FFAF0398FCEAFF
      F2FB64FB24FC1FF734FBD3F689FB71F9C6FC32FDCFFAF2FF1BF8FC016CF79002
      D1F8C8035EF98D058BF95803E4F8A2FE2AF59DF731F674F6CCFD91FDDC049F00
      6B0995FEAB0A4EFDDD0958FD9707FEFAB9043BF787033AF583017DF59AFE39F9
      1FFE98FCCC00A3FDDD015FFD9B0164FCCD012CFA4D0131F88DFF00F76BFD21F5
      CEFB20F500F848F2C9F76AF0DDFD84F5FD03F9F815085FFAFB094CFD2E0A0701
      A1077703940398056DFFD30610FB2405F0F80804E1FA2E0320FF5F019B0064FF
      DF011DFFB70421001907FF029B082F06A309F804F60918011406A7F9550448F5
      760850F9940BC7FACF0BAEF8920922FB4D06BB01F001560595FC170535FA6F02
      9AFA71FEC9FA9FFE98FC3C013F0194029D033004A9033E073C02B70810FF4309
      72FCBF09E1FB7108C2FC46076BF9950203F6E8FD28F86E00D0FA3D03E3FC9C04
      25FE1709BDFF620E2F01D30F2500A90D22FF6F09E5FDD20313FB5B0025F9CDFF
      F4F9CC01D6F8130556F6DD079FF5FE0834F7D30A7DF9160D9AFA370A21FBB303
      60F774FA91F51EF623F913FCA5FA5D0019FCFCFF02FE12011EFFCC036BFF4804
      88FDED02E9FCE30021FDFDFD2EFC2FFE5FFC6E004EFFD400580025FE9BFE53FA
      CBFCE5F59BFAE9F204F9ECF232F9B2F3F1FA1AF775F80EF706F6A6F4DEF928F7
      06FE8DF74501A7F65102DFFA280184001FFF070395FB6504C3F9990449F86B01
      A1F632FE82F7A1FB70FA6BF8B3FAE0F591F81EF634F81CF9B7F983FE74FC1A05
      BDFEB707C3001907C4FE75021EFD88FD73028A00F7061E035C083502D806F403
      BF0302082501780AA8FD870A3CFD9E0938018C07FE05A207B4094909940DFC08
      B30F8F07FB0E7A07100C900791064808B100020A02FD310814FDBA0494FB1AFF
      88F9F9F8E9FC1DFA97FFF6FBA100C7FB2801F2FE840082024300070365FE9E00
      54FE53FD41FF5BF9FDFD57F790FCA4F92CFD92FDDCFC47000CFA5A021FF8E903
      53F851055FFA1C0712FB950421FBE1FEC1F7A1F78BF528F4F2FCC9FA6004C100
      42084B01890A8A01630AB90032088BFDC1023FFA2AFE7BF8D1FB18F7FBF97DF7
      89F957FA3BFC1FFC20FF0AFB14FF66F917FE65F7B1FCD9F508FB48F607F97CF6
      FDF8FEF7F9F702F7D5F6D1F336FCA3F7CC0235FC3508E1FDF70B57018C0CC703
      DC0BD004690813060005E8068C017006D5FC28068BFBC1065CFFAB060905E405
      46091106600B3E07790B74087D0B6C09110B2507A40AA6039707F9FE6F031AF9
      EF05F0F8BE0821F9CE083AF79E075CF9F7032DFE3F00290170FA0C00F2F5F0FC
      A9F545F90FF76CF8A4F971FB3DFE3CFE6E02B0FF3C03DF017A02740379006403
      79FDDC032FFBB40261FCF90002FCB5FCE4F842F68AFA41F774FC59FB11FDD0FD
      49FF0903A1019408C6047D0B0205CE0BB903B6097503D60488008A007CFCAE00
      AAFA1A036FF94404F6F62C043EF5E40419F6410666F9B807E6FBA9055DFDFAFF
      53FB3BF935F7F2F4BAF9A6F95EFD0B0035FEDE014A00860325020205F403E204
      C2035E0337025A01F5010FFF8B00CDFE75FFEC000C01290290036B013F04E1FF
      90034AFE080301FD81030EFE40040B00A304630288012301A3FB5BFB14FBABFB
      D8FC3B0081FE8503C3000C082300C50A2DFEB70A6BFAB50AA6F6B409AAF4C506
      B6F1A40370EF3F0104F1D2FEAAF331FC49F45AFB9EF4F2FC84F6280089FA8A04
      21FE2406E500D5047B00740111FD15FC6AFF51FDFC0332021C054B037105C205
      8403A209CE004C0BAEFD940ACFFB980938FF8409D804850B9309860F0D0E4811
      66126110D812B4101B1039120B0C08130C064E13D6FF2011AFFDAC0D6EFD5208
      BDFA310065FC90FE79FFD901BCFFAA029801AC04CD02F706B80379063A042A04
      0304E20052049DFC3503A0F9A600FCFA62FF52FE36FF0A0014FD5200C6F99800
      F4F7130168F96D0238FBE101DEFC06FEA8FD1FF9F8FC68F5A40258F8BB0A0BFE
      180D17FEDA0DF4FC7F0E2FFD190E03FD420C41FC7E0880FA0A0541F8A1019FF7
      6EFE48F903FEF4F93F00FDF8F501F8F68F01FAF4A10029F3CFFFE1F2B3FE52F3
      C6FE8DF3FCFDAFF256FAA0ED9FFB8EEDAF005FF3D703D4F6DD0710FB360A60FF
      8A0AAD005D09BE012B066E020D03E00090FF63FE52FCEAFC51FEDFFC620525FD
      FE0A47FE830D7200270EE901C10E4D03110E1503330DE8002B0B9FFDF3055AF6
      4106A7F2980A0EF5CA0B2EF55D0C3DF85A0C79FEBB0AF400A80791002103E3FE
      23007CFD130165FEF3038B02A10768069D0CC407730F4C096C0EDF0AFA0BEE0A
      62099D0B23058B0BD902980965023D060AFECAFE46FC28FB88FE11FFB5FF0C02
      B303DE05CB08F309D70AF1094C09EC07D6041C050100C0026AFB4B01A4F71902
      18F5140306F4430164F260FFA8EFDFFEB8EEA1FF03F15E016FF46200D9F651FB
      A3F739F548F589EFDDF6EAEF3AFD3FF699FF39F9BBFF10FBC100B3FD500236FE
      A30278FD4B01EBFB5AFF96FA86FDD8F926FC77FAEDFB39FA32FE9DF708004FF4
      F8FF12F2EFFFE8F10A0139F4CC011EF88F01CBFA39FF6FFA98F8F2F469F4C9F2
      48F503F8C1F5F9FB7EF70300C6F9F1032DFA2E043EF95D049BF6BF04C9F31D02
      73F2B2FDF8F049FA8AF0F2F79AF447F6EDF823F62BFB80F824FD74FCC0FF8501
      B101D304C3026204B102270222FF70FC4BFFA8FA740444006106E70299068E05
      3B07AB09CE06EF0AD705950A1A053009E004AB07040696065F077108A907870B
      FF09BB0DD10C7010260DAB12EB0AFB11F70624100101A70DC3FB2C0914FB8404
      34F93FFC3EF908F75DFDA6F90BFE29FB28FE84FD23003C00E7011C003E02E2FE
      6E01E5FC03FF8BFADBFB1EF8B4F86EF99AF579FD53F56E0068F5C40175F35D02
      97F0B4023BF03D03BBF1C20264F3C2FFC5F55CFC88F5F9F8F2F738FA82FECCFF
      5601A9013301EE018F00A202FB000F015D0065FD9FFC47F8D7F760F4FCF3E0F2
      2DF354F40AF4BAF633F8C5F6B6FDA7F526004FF4FAFF25F4F8FE5AF61AFEA9F9
      FDFD0AFC98FE9FFCE1FBCAF8FAFAE1F677FFDDFBFF021E0058066A05A70AA40A
      5C0DEE0B4B0DF80C180B560E06075B0EEE03CD0C3503FE0BEC02310B1907C009
      560C4F084E0CF50759092A098207720B3B07440CD407C8084D087F028E0428F8
      5002B4F000065FF1FD0784F2ED064CF50C0687F9370511FADE02BDF70FFFCEF3
      AFFA3BF08AF80FEF43FA80F226FC36F886FF68FB000488FD9D055A005E044202
      4703EB037D0264042B009D01CCFF26FDF6FD58F5CDFBBEF0C8FE1AF5C3005CFB
      E7017D029505F407F6083D0923099608E206D5069B024605F3FD9C0277FA8300
      25F626FFD7F3C8FD02F3EDFC65F111FD6AEFFDFD32F001FF37F418FFC9F70FFC
      63FA43F822F965F48DF81DF5D8FDA4FBFA019A00C3028A03DF0298042704BB03
      C305E6011F05B1FFF3023DFEE1FFB0FC44FED0FCC3FC90FDA7FD60FD1D02CAFC
      BE0592FB820860FB470ABAFC3E0AB4FF47075A0227040903C0FEAFFF37FAE8FC
      77FC57FFE0FD9101F5FDAD045CFFE2075E017E083E02B8081B00CD08EDFB1607
      66F7C8020AF64DFF02F5C9FC74F5A9FA43F993F9AFFA4CFAD2F923FDD0F98600
      C9FBF3024DFE7E025600C300E2FE6DFCD3FCC5F8610053FB930262FED600B301
      84FFFB05930030088502F708C90230081A02F306C7003006460157086802370C
      DD04560DD4094C0C320C8A0A1A0AE3080906A9080102C3083FFDEB067EFAA203
      37F9C6FD64F8D1F83CFC92FAF4FE41FF88FED1033500F00650048F07C208AA06
      190AA303A108F5FFD8045FFC05015DFC14FDEAFF94FA17023FFA7702B3F7A901
      95F3960185F04C033AF2B605CBF6750531FC69029FFE2BFED6FDEAFB480057FF
      F9013104640206078E03030754056C03B907A1FDEE0657F84F0354F506FF18F4
      FBFB6DF53EF91EF7DBF8F1F6A7FC99F54C0010F4BA01F0F369016BF5130134F8
      3200A2F9F9FFCAF825FD16F57AF85BF178F9BCF312FBD5F94CFC4300B6FFDC04
      0D04DC05250884053C085706BF05D3072D03CF078203EA07FA04ED078E068106
      A20AFF04780CD6041F0B00064509AD0698088205F1071A009906BAF97F0275F3
      4AFD6CED6DFF20EE6903B3F26104FFF72B057EFDA406870060084201D3062400
      3003BEFFCAFF77002CFFBC03D2FF70080201230AA504440A8106C10B0405170E
      EB01630FC0FF7C0FAFFDC90B2EFB220693F8370069F6FAF91DFAFBF922FF2CFF
      970019045B02B70731045D0A7F063E0C2A07E40BD404D40948012C05D8FCAB01
      C9F7510239F4AD02C0F3610233F3FC0125F1270279EF020351F16F038AF52C01
      1DFA51FDECFBFBF9B6FAB0F7A1FE19FBA70396014D04AB0502045807D9027F07
      3503FD06AC0332059301EE021BFEBDFFD3FA4DFD50F892FC85F753FB08FCC6F9
      A10250F8FF06E1F70D0979F8C908ABFBF00527FE4A0322FD0EFFADF81CF8D7EF
      7CF6E1EBB8F5FEF099F2D5F876F2C5FFA9F48A03BBF8E803DEFA8203A9F9B402
      0EF784FF7EF577FCFFF543FBC0F619FAECF99FF94DFEAFFAF2FF11FDCDFF3A00
      3300AA03F100700425025F037901FF00CBFDDBFB11FF9FFBFD02F6002D03D305
      E4030109920666095F0BB007DF0DAF04FB0A4B038E057F0479011F083A01070D
      15030C0EF507270B620CB009C50C020B3F0AA80BCC06750BD5031107E5001A00
      EFFD5EF908FB0EF10AFDD9EE8700EBF363FF1FF9C7FE8BFC4A00BFFE4A0472FF
      E80681FEF6042CFD600145FB36FDC9FBB3F9C6FF3CF7C20161F7D7004CF871FF
      FBF697FF9FF4C1012DF53104DEF95E0375008700A4044AFDA602E8F9EE0218FC
      7E06E00168063B0410078C01B307F3FC160730F90F06C2F5F801C1F3E9FC43F2
      D8F8B0F127F6C6F24CF6AEF2C3FA30F22101D0F21A05D2F4F305BCF7930525FB
      DD0483FC4B0462FB0802CBF839FC54F39AFAB7F2C0FCA5F953FC040015FECE03
      06028C054107D1052A0B6406BD0A8B07410A6806A9092704D5086803A9077203
      E305F8044A06C8062F070E081B06DF07BA050D06AA055502CD05D7FD2B05C8F8
      B80096F054002AEC5A044EEFEA0406F4730431F8C2034CFA0A0454F94704E5F6
      C8001EF51CFC94F5E4F74CF94AF59DFFDEF4EF0391F76F053BFC7F07FBFE540A
      EDFE940BA8FD630A42FD5E05A8FDE4FFD0FC96FB99FA83F564FD60F47B03DAFA
      06054A02A9049B072F04020B2006F40BFC08E9097F076B057D039DFF73FD5DFC
      B1F6F0FC4BF175FD12EF8BFC0CF0D6FB9EF087FC8EEF00FE57EFB8FF54F23400
      E8F7430062FCFFFF2DFCCAFD39FEB3FF7C045D076306A90C6806DC0C59062C0B
      D205830803060B058004B501B7010BFE5BFE8FFBD7FAD0FAF8F926F9A3FE78F7
      550613F7860B8EF8390C5EFCD309F5017E062A064104FD05C3016D0157FCFCF8
      08F950F5A1F95FFB10F77302F1F4170670F67F077EF9AE0645FD3505B7FC7104
      48F9F2015CF500FEE2F128FBDDF0C6F86EF1CAF7E3F296F876F491FA1AF462FD
      17F3B3002FF483027BF71302EEFAB0FF06FAC1F980FA3AF7E9FF6AFD57024105
      AF03790A82052E0DD107D60CA90B040C400BF20B2E07720B3A039A0B5100F60C
      94006E0C7F03740A6F07280BF809CC0EC1083B122B06D412A203C10F31027D0A
      F3001F05C6FC06FFEAFB5BFC6E0031021301C30878FFD90AF1FFC00BD1027C0B
      D407700973091B06C6077E018E04BAFE2C00290007FC930075F9FBFE40F944FD
      01F979FCACF7E2FD62F771006CF996029DFDF003E600E0042AFE350204FCA300
      56001B05D102EA06C803C802FA05A6FEDB0748FB44095AF83F0807F6C2059EF3
      9301D2F21FFC53F3D4F75CF37DF738F3BEFBF8F3F100E1F5FA02F2F7950237FA
      95010EFC34008FFABEFEFFF6C1F9F5F106F6F1EE05F821F51EF87CFCFCF7C1FE
      DAFB0E017B0180035E083A060B0D38094E0E7C090D0E9E07C50C3A06C60B8D04
      860B7702920BB000430C50FFC10B7CFD3109CEFB39068AFA7704C5F7FC03CAF4
      7900D9EFF7FD34EC120288F1460557FA3F06D60080075105F7083806DF0BC104
      CF0C7D03660B98032F0861051E046B084A02AE0A2103200BCC06510CEC0AE90F
      580B71120009E111F705530E6604BD07D3057001B104EDFA260321F799069CFD
      6B060B07D101BF0AA3FFE50C4D01030E0F061E0CA6094F08E509ED034906F900
      04008F00E3F8C2FF79F325FD56F1C5FABBF063F9C9EE1CF9F2EB17F9E8EB8EF9
      C7EF1BF968F5B0F7D5F6EDF404F7CEF343FCFFFAFCFF4F020300120340000702
      A7005300DC00F6FD1A0071FB93FFD5F95FFDBFF937F908FACCF64CF9E6F7DCF7
      E1FDBDF7AD062FF99A0B29FAE00A58FB7A08F8FC1E05C9F9AE017EF308FBE0EC
      0AF332E8A8F0A7EEC3ED78F9A1E925FFD8E9CE0339ED9F06E2F1E00750F5F108
      9FF6B6076BF554046FF27C003CF164FDB4F3BBFB6FF78BFB90FAA0FCF1FB96FE
      01FB5A013FFA0004E9FADF02E3FC22001AFC5BFC45FAB4F807FFF4FD43053306
      F1085709520BD90A380C520B610DE90A770C1C0A8309F409EA047D0A4EFFE30A
      ACFC990B04FEC50B4802470C2E08150F0E0B7610B209820E9C072D0A4C05F201
      8D04ECFAF201CDF4F0FD79EF2F00C7F3190206FB40FF27FD4CFD22FF15FE4401
      5F013D022604830126053AFFE902D0FDC7FDDCFEACF8620090F4E80070F35701
      83F5DE015DF70703F5F6EF04ACF73107D2FB14071F01D60409018EFF71FD62FA
      D2FEBFFC7C0008008CFE09FE98FCF2FA81FCCDF842FDCCF65DFC50F432FC0CF2
      63FAFAF0E0F4EFF15EF012F438F017F694F5A6F8B5FE46FB62067AFD65091200
      810A0C02550A99FF2C09EAFB010513F805FF12F497FEB1F8EDFE63007EFC3A03
      5BFD9606D402010AD70AF30BAF11660EF8151910F5154710EC11D80F1A0DC30E
      4D09B10D6808F70B14091409E2092A07E2089E064E06010555042AFF1E04DFF7
      DF02ECEFEDFF98E74F02BDE8070622F0B40656F43907F1F63F075CF792076DF6
      11074AF5670651F56A03C0F7BFFCA6FB6FF7CDFF5CF5BA014AF7A40220FD9404
      95020D07FE03D70878038B078C0327010506E6FAFB07D2F5C80617F26F094BF7
      650C9EFF3F081B0368034905A401FA053602E1045603AA022A040AFFF501FDFB
      B4FB8AFAC0F5EEF9C6F0B9F81EEE04F8DDEE62F805F02AFA26EFBEFD8AEE2C01
      B8F0E70287F6600339FB19013CFC7DFEB7002103E305840954062009B405C305
      82058B02E90595FF040502FDAB04BAFA09058BF80902FAF62AFEA3F6E5FBACF7
      F0FD6DFAEE0439FD930A7800960ABF0436093407040869040507D0FF3B04A2FA
      7FFD53F510FB22F8D5FA85FE8CF705011EF621037DF87205BAFC16061700CD05
      70033704A7038600AFFE2CFD01F9DAFAE9F5B0F9D8F6E8F99FF9A9FA0BFB9FFC
      A2F99AFF6FF77B0193F6020010F94EFEC1FBECFCFBFA85FA93FE75FE6F058506
      88089A09DE0A780A4B0D440AF70DC008970BDC068809C603A206CE007EFF3E00
      FFF8680287F5850459F620068EFB0B08C701A10A5304D60BC103E709A2024804
      3102CDFE250237FBD1FFD4F7A6FFEDFB1A02C603E10039061AFE8D07DAFD0509
      1C00560985035607CD078002CA095FFEB506BAFDD70193FEE1FC3AFE7DF905FD
      7BF988FBEDFA42FDEFF9E202E4F7C908A4F7400CD8F8320D0BF9100ACEF5EE03
      61F6E9033AFB90078CFC780552FCBE0017FDD5FBA2FF63F7F60113F4D102BEF0
      A902DAEE8EFE89EE80F8BCEFC5F396F1B1F23CF448F707F737FE6CFA65021CFE
      8C0379FFB0033AFD300347F9070135F553FBB3F06BF814F3C0F932FBC0F79700
      6BF6B3058EF90C0B0C00040ED806F80FBF0DD20F5614510C72147B080A10F504
      F50B20010F0A76FDB20AF5FA530B86FB80083EFD5E040EFDD6001CF924FF01F4
      DCFEF4EFFCFB78ECCBFC2BF06302E4FA7B05A8022B07B2068208860853090608
      D4094C060A0B22042F0C96032B08F7043401690754FC7109BBFA490A80FD810B
      FF02A60E8805D30F3304130D3902B206EF000100640195FC2B013AFA1B010CFE
      4B016B06E1FC4E0A27F8AD0B9FF7580D36FBA50EEBFF760DEF039B081C075902
      4905DBFD530064FBEFFA6AF9ECF5E8F741F3D5F633F331F8F1F14FFB00EF27FF
      DEEDC502F3EFF703B2F4850247F63000DAF846035EFF8A0908023C0A82023407
      2D03EF04E0035E046104AF042004D0035304C701090375FF5EFFFCFD56FC12FD
      52FC52FC7600F8FB3C072AFC2C0BAEFB500BA5FA880950F8D906E3F3B302A5EF
      35FAD9EA40F356EB06F217F3E0EEC3F932EBCAFFABEB570615EFC10AE1F34D0C
      90F8D70AB8FCA70601FDBA0110FA1DFEC4F7C4FB06F89EFA4DFB9BFA2FFFAFFC
      8EFF89FF59FDBE01CFFBAF01BDFB34FFF0FC0DFD30FB20FB1DFB97FDF7001D06
      26051A0CCA07A20DF409E90DA109570DD907250BDD0690066307BC0374050B04
      EAFF83061DFA270927F8E10823FB7B08AD02BE09E808A008630A8404D109EEFD
      5D0854F69F0702F21205D9EFB402CEF1A4029EF84A0017FD8DFC24FF4BFA2B01
      30FA56020CFCC10170FF54FE990326FCEA043CFEEF01FF0121FD4604F3F8A503
      7BF73A02A9F9E5029EFCAB04EEFD3D0728FE9B08D8FEEA051D01A0FF9F00E2F8
      13FF79F8590211FD04035AFE8400F4FA0EFF47F759FE50F5290038F42C02D1F2
      05035AF2AA01A1F3C3FD30F6B9F85DF947F60DFCB9F8F4FE7D00A70124092703
      8A0D2D031A0F0300810E29FA000D18F57F07EDF046016AF0930005F6B6FECFFB
      3BFB3E009CFB0D06A5FF8B0BE505EC0E4A0CD50F7311DA0D6812590AF80DA206
      F808E0021F06CA00C705880036083F0163083C01F2043BFF3D023DFA990009F2
      380049EB01FEC6E6EDFB47E69F00A9EDCF04B7F5C40598F9850687FBC705F3FB
      010525FB5204D8F9050493FA660284FD13FD5E0112F6710567F20A0925F3E50C
      2AF84D1108FE3B12E4FFB40E43003C087A004F00E90265FBEA056CF8D60730F8
      BD09F6FBAE06D3FE4D015600C1FD1D0303FC27063CFCA206F2FCA10246FE5BFD
      D6FE40FA9EFC48F94FF857F9D8F49AF970F212FB9EF28BFD4DF437015FF34806
      BAF1490A48F2840B5DF60D0A4AF9BD06A3FAC705670068085D05E608B0064005
      B307A30190071F006C0723FF760761FD4307E2FB2906C0FB190489FC620031FD
      78FC37FE84FAE6FF26FD6700F2041A01730A5303870C1203470C1DFF390AF9F9
      0B05AFF491FDF0F184FBF7F443FA88FA56F68BFEBBF44D03FBF53A07A1F9CC07
      41FD5E0642FFAD0247FF95FE4AFCBFFB1AF63CF9E8F0F3F728EF2DF824F15EF9
      8AF454FCAFF36700E3F1AD02A9F1E50159F3A90050F50D0071F61D017FFD2107
      3D06270D620B600DEB0E7C0B900E7008D20C5304750B67017A094A0058071202
      4F02C705FBF98609E2F3BF0C89F2D10E3DF718118100AB129A0655110E09490D
      E109BF07440A80043409B003B50627044B086908CD07880D5803250EBC002B0D
      BCFEDD0B5CFF9D082C025903CE0563FE6B0939FDBD09D3FDF40515FEB2014CFE
      1CFEACFE85FCAFFF64FE560324FEFB0805FB610CEFF7210BFFF84807BEFA4703
      B1F9D200B7FCDF01CEFF96012CFFF5FB8DFE7DF560FE83F1A80043EFCE0492ED
      C90788ECB007EBEC23053FEFE8FF7DF25BF9ACF63EF5EEFA82F551FD8EFB71FF
      EF001300C602F9FC790384F7D5034FF34F0241F25EFD9DF2EBFB7CF600FC58FD
      3FF97B025FF8A607ACFAB80B4401BB0B200A4B0932113604A01412FD181547F7
      591243F43B0E7BF49D0B31F68D098AF70F0AAEF9CC0774FA3C02FEF7B6FF7EF3
      5FFF38F08CFE33F0FDFBFDF14CFF3FF95E06030456097309E30AEF0A180B590A
      720B2908490C6105370C6B02830B610199090302D0048804B6FF2708CDFD620A
      47FF300CAD05B30E0B0BFD0EDF0B790B9D0A940545092A01F4071300760568FF
      DB061301E00752060203A70910FF6A0B82FCE90BB8FC1A0996FFE102B401F0FA
      55042CF62206CEF369048DF28BFFAEF224FAA4F25DF531F317F47AF6CBF2B4FB
      E8EEC8FFB3EB9101E2EBCC004EEEC0FE77EEB3FC2AF305FD13FBBDFF44FF85FF
      EA01DBFD3D0221FDED0219FDB90474FD9D0593FC40055CFB3504CFF9B00248F8
      EDFE4BF75BFAF4F4D8F84DF2D0FE98F30C07FBF6D00A6EF7790AC7F395074AEE
      990156EADCF7B8E8CBF239ED43F239F83FEF13025DEC440A82EB5C10C9EE8611
      05F4350F81F72C0A91F9550488FAEFFE7BF9CEFAF6F5E0F84EF35EF746F322F7
      CFF72BFAECFB54FD12FA0FFEA6F7BEFD45F889FE0DF9DA0120F74A04F5F8A107
      1200870E5304CE105B061C0EDC06D8092C083D06120B3104660C7302140C2602
      BA0925029C04E803AEFC7006DDF72007DCF74C0726FEF707C2061B06310AD900
      6A0A1AFB8B0913F75807EEF6E7028DF7A00277F9B804F7FEAA00530178FB2B01
      64F8710150F84E012AFB2800B4FD1BFE3A00F2FEF602A5010504DB046A016706
      47FD040547FA6A03D9FB22043EFF3706B4FD620561FA8D02C8F991FF3CFBF5FD
      79FACFFCF5FACEFBA7FDB7FC98FB55FAE5F72AF6A6F490F4D6F38EF458F669F5
      06F9B1F534FBB1F635FBD8F80EF982FC84F4A0005CF0F10266F088030AF72804
      7201750411086E01B00A31FC490C04F76D0B1DF58805DDF4B0014BF706033801
      DE01480ADFFE6410AEFC521527FF60167605A914E109900FD90C0909A40FC904
      F611E603EA106C04BD0DF7039C09A70209084A02EC084901DD056EFD960180F7
      62005AF18DFF5BEF50FBF9EE74FA99F008002EF9D00316FF040593FFE10470FE
      D104ADFB40058AF9D10373F8450217FA19011FFE06FF3704EFF9070AF9F4FF0C
      F5F31A0FE1F83C118701E30F0406F1091D0710022408EBFA59089EF7930594F4
      1106B7F3B20B6EFA430BEB00360531048BFEF70533FAFE0493F83F0115F79BFC
      1AF7CCFA8DF8FEFA3CFAD8FC6CF956FE45F698FE8CF2ACFF90F19A023BF4B407
      5FF4520B39F25D0BA2F1D70802F3490638F3B60263F5F2FE1EFDDFFE45025BFD
      D8034CFA4804CCFA32068EFDCC09F3FF4A0AF1FF6909B8FE650717FE090492FE
      17FFDFFD28F990FCCEF5C0FC54F91CFF5403F302F50A4F02FE0C92FCA80CA5F5
      CA0961F2E50236F18BFD44F1BEFD92F840FC3D00EDF76E0543F41C0AB7F4C60A
      D4F98C0859FD80048DFF5DFF8700F5FAB1FFF8F8B0FC0FF8AEF78DF83AF3AEFA
      DAF206FE98F77B01BFF92603EFF7CE032AF8D30357FA4E060BFA890734FCED06
      C7042A0BED0AFF0B460C3607960BD5031E0CFA01470E6A01070E04009C0BE0FE
      17072E0038013E04FCF98A0936F3E20C1DF08A0EF6F2D90FFBFB6A0F3404A80B
      CE07B0051109DB00B3086601C805AC022105840296098F06620A3209C9046407
      B4FEE704D0FC5901FCFD2AFD8DFE91FAB70098FCB704FA00CE087B040F0A5405
      B0062A04B8002A0472FC000665FCCB0998FB780C2BF92D0CE2F8B90A93FA2309
      91FABE0490F964FE9EFC1CFC04FEE3F998FB59F533F9C1F231F80CF271FA72F2
      4DFC19F2A1FEECF15B00D4F3A4FEB8F7D9FA7EFBD6F506FEE5F044FF4DF02600
      A8F64002E1FD2401DC01E7FBB20362F61A0470F59A001CF730FE9CF875022300
      260500081D03860B4700140E1401F40C0107BC07C80A1801100DA3FB5C1001F9
      B812D2F8501483F8C111E5F85A0BF4F9C4055DFB8B04A1FD4305C3FC6902F4F8
      BBFFA2F54C002DF77FFE05FA96FC5CFB23010B0311066E0AF8071C0B3C097509
      A80A57061D0D3C033B0D5EFF620CDFFC1B0BE7FD3008D301A604F007B600B60D
      B3FE08118300DA12DC061113B40CF00EDD0CE507030ABF00FD0542FE22FFC5FD
      D6FB68FCA301C5008D06A10532031106D7FA2E0511F5A3021AF5E3FE9EF6E0F9
      81F9F4F65DFCD5F621FE74F769FF0AF8C7FDBDF886F85FFA58F336FDADF23903
      CEF338071CF2C806B7EFBE058FEF8C0656EFA40521F07401A0F685018FFD8203
      6200F2032D03C804A206A605C10A9405AC0CBF020E0D74FFAC0DF9FC370BF5F9
      040637F76F004AF6F1FB5AF68AFA46F7D9FFEDF975066AF99708C7F3110829EE
      F60521ED57009EEE8BF99BF04FF904F914FAB3033EF60E0AAFF1690ED1EFC50E
      BFF37C0BC9F8EC05C6FCD6FF9CFF95FBDDFFDCF799FF9AF49BFDBBF3EDF835F5
      93F4C6F8D6F528FF02FC5203A7FFA7039EFF2304C7FFCB07C4FDC50A6EFA4C09
      88FDA20AEB014F0CFA01CD09D7020B07B20536041D0A1801A10CB8FCA90C24FA
      640B69FB93076BFE6503200296FECB0484F9E7045EF72704E9FAA2036D029DFF
      4307E9F8B1085EF43A099CF527061DF88202A2F711052DFB3B087600DC046701
      60FDC900BCF7D7FFDEF73FFFD9F9D3FE84FDD200700276045305B60528081405
      93099703210767010302ADFF90FF32024A007B04E7FF0703AFFEE50074FEB2FF
      74FC25FD6EF951F797FB25F607FF04F8CCFDAEF7EEFAECF758F9E4F83AFA66F9
      E0FBE7F7EBFD3FF7D900E9F8BA0117FB0E002DFD7AFD49FF5EFAFCFFAFF872FF
      D8FC54006D048CFE730947F9D20A2EF6690BDEF8090AE9FCD806C8FDF2089802
      D90B300A6408D80DA802E20ECEFE400C8AFF680673028D000806DBFC970AD4FA
      2A0DB9F8830E3AF7710E60F7BF0A92F86404CAF901018BFBFC017CFA420243F5
      C1FFFAF067FD46F1B2FADAF270F6A5F128F8F9F48AFDE5FB3FFFCAFD080020FD
      1D013EFB230373F9D203A2F8E50285FA98012A003EFE0B0785FB470ED0FA5F13
      2EFAA7149FF9FE13B6FC26134C03D60DF6079103CB07D7FA22053AF9E1FF19FB
      50FB31FA86FF17FCF0060101C0066F029EFF4202E2F619025FF2B20084F1AFFE
      C7F1F6FED2F3C20032F57901C8F6EE01B6F83D0258F8FD02B8F4B1040DF3ED08
      2CF6140C85F8D1098CF8B80632F8EA051AF63104C2F277FFF6F405FF60FB1C03
      5AFFB4046C029305A2055606E7087305B70AD1029B0AE9FF520A92FDD50795FB
      FA02D1FAC4FEC2FA2AFD98FA0DFC7AFA75FDA9FC12034CFD8907C5F8E9080DF4
      4C099BF3740687F5D3FF58F5DCFD70F88DFF97007EFC2D06E8F6F1080AF33D09
      31F3170513F762FF62FB7BFB9AFE7AF8FEFE26F674FCBDF560F97EF76AF588FB
      BEEE440050EB0A0581EF7D07A0F5AE055FF8270447F86A06EBF6BF08C0F4A605
      CFF7DB03B6FE47073B01F1072903BB0688068304B4092001EB0A80FE6E09A8FE
      4307B7020D0340082BFEF80E76FA3C1441F8DD1554F6361535F7E8145FFD0312
      4E04250B18080C06FD09EB05B509B00757065E058708B503550EB2060E0D9307
      F806B80640FFA406D3FA85059DFC25047400DF04C104AA06F506C7060507B005
      3507DF022B07A200FF02D1017AFD79068DFDA60A3B00F8080F0124059F00FF02
      6CFE61FFD2F9FCF79BF950F3D7FDFCF3D8FD27F40BFB0CF4D8F860F410F8DFF3
      F8F8E2F2A2FAD2F212FE69F41601BEF6C60187F9E2FF84FB23FDBDFCE8F98FFD
      B0F645FF8DF81000B1FCDCFCC1FE17FA020141FBC80235FEDB0008FE86010DFE
      60072603C908C40560063E041404BA01E60212FDC904C9F8360965F6FB0DACF3
      641035F12A1066F09B0EC2F1980DF2F585096AFA9803C1FEDA012701490383FE
      42044BFBB7030EFCAC0159FEEEFD88FD1DFE33FE08044804C90778070509D305
      5F0B6C020C0D9FFE8C0DDDFC070D4AFE3B0CAE03F80A1D0A4009EE0F18087C13
      09084A13470740110F06B80FA008D40B130D80034D0E87FD270C50FDF208C8FF
      9503B5FEB2023FFC1E091CFEA20AECFE66069DFD96FF04FC05F8C8F959F544F8
      05F705F88BFAE8F803FD87F947FDFEF9DFFC24FA70FD36FBBFFB2FFDF5F6DD00
      77F58A041DF7EE02DFF6DB002BF5F40163F3510265EF44FF75EF0FFD0EF7C7FF
      0DFD6902EFFF590240020A015904CCFEC60694FBC9087FF7540A83F54309A3F5
      F6050AF61D02B4F522FF36F478FDAEF231FB3CF341FB13F5AAFE13F32400A2F0
      580046F258009CF615FC09FA0DF92CFD1AFC150511FCD40B85F7BB0D83F3A60C
      66F1BC07C9F3870101F91CFCF8FDEAF7A2FFF0F59AFD81F684F9E5F991F6F8FF
      4CF4E404B3F02B087EF1BB092EF7F4060BFC5004A2FDE30527FC87077BF76005
      80F59203F6F9AA060FFE1109B20099066A04EA01A90705FD3E09A4F9AC0943F8
      CC0947FAAC08AEFE120674035F0278071B00AC083FFF3C0746FD2906A3FD7A04
      720193FE5F0445F9B205E9F8FD05CDFB0B02A4FC27FFD2FB8C039BFF4005F803
      70011C0551FD660407F9FD0209F94D0255FD000217024103760541043806C702
      7905F5FF1906A2FEDC05DCFF2701BD032DFE990730005C05AF0138013A00B9FF
      65FD1CFE88F711FA7EF3ECF684F761F9C2FAD5FC5FFA52FD27FA9BFCC3F804FC
      7FF730FBE0F646F9A7F7BFF88EF989F93FFB35FA9CFB31FB08FA15FC11F82DFD
      21F657006FF6150551FB9A0537000004CC036C05E807D407E90625082504D606
      3D074D09D008B10BE105250AFF024E083100AE051F014502DE0668FE9C0D67FB
      1F1148F90C1061F8260CA9F98D0863FCBE0620FFB7027701C5FE39039BFF2300
      9601ABFBF20179FA6D01F8F99BFCD4F76FF887F529FCEEF8EFFFB7FD130032FD
      21007FFA69002BF90401FDFACD0162FEFE0205041E04A40A9F04460F3A03D011
      7701D6100102EA0C1D02FE085402A405DE05B2FF7908DBFA6307EEFA670649FD
      480292FD21FE3CFA2B02B6FAB20539FEB60300FFC0FF9EFFB9F9FD0096F41202
      F0F3FA01D3F6930210F959035BF9E202A8F72B027FF61B0181F727019AF67803
      93F4AE063DF66005B6F83A03CAF8EC0402F9A1060AF6670567F3F1017FF9C302
      97007A05C8024B045904D801F70499FF4305A7FC8906E5F9CF077EFA170841FC
      5C0761FC520623FB66047BF87E0223F65E00F8F63AFE85FA10FF08FA420104F8
      880132F9D10247FBDA01E6FC30FE5AFC210068FF310273042AFF05048DFBD501
      EFF7B0FF67F667FC8DF81AF96EFC15F8CCFF90F83400E1FA78FD4EFFEEF90804
      9CF8AB079AF75809CFF41F0AF9F59806B9FA5802B7FD2E017F00B80052FE1D01
      F5F83F00EFFBB50286029A0672068D04A809A400020B1EFEA90A81FD4F09B3FE
      510771037405D8090303E00E080098127EFD191369FD5B1036FFAF0DF0FFE50B
      4702F705DD05FBFFCE0691FE8C07ECFFD1048701BCFF9E007202F203FF069D0A
      8205230C0603970A83001A0826FEEE0452FEA9024901B302E9032802E10391FF
      3F0282FE7D0015FFD2001E02C601F0069901BF0AD4021909D704B5044103A502
      CD00D6FF76FBABFB14F4BDF618F5DEF68EF9BAFAB4FA14FBF2FA79FAACF912FA
      9DF7BDF8B1F6FDF5DBF657F566F8E0F635FAB0F89FFA21FB90F987FC2EF8B7FE
      DAF6D60244F55F07F2F5030708FABF0384FDF3022601E3020C039602EC00C5FE
      810384FC9208C0FE490926FE3B0821FDDE0524FCB00539F8DB0954F47E0FF1F2
      6913F2F29D1289F47F0D7BF82B0749FD3003A30169018C04EAFEB406D4FD5D04
      D1000A00E502CBFD3305C7FA5905C0F8D8FFCFF6BF0066F9F905F6FF5F07AF01
      31084C020308C603CA0701058A089606150AB209DC0C830D590E8D0F410DAF10
      750A590FCD07850AA8071B074D08C007DC081E05200B0C01C80BA7FFBE0CF0FE
      330BAEFEB6035FFAE90000F80F0231FACDFF11FA2EFCF8F9A0F724FACDF2C8F9
      27F005FA82F1FFFA3FF6E2FB4CF92DFB3FF971FAF2F786FA92F7CFFC1FF84401
      52F68A058BF3080619F4060562F48306D2F466073DF57E06CCF2AB02E8F68D01
      66FF4804F3039B033C06B10095060BFD5B06B4FA8F071CFAF40846FBDD09A9FC
      450B01FC5A0BBFF9BE0996F5220703F382034BF414000BF950FD18FB4CFDF4F9
      42FD85FA5FFDFEFBA4FEF6FE39FCDEFEB1FCDAFECA009C02DC008202BFFEEB00
      47FB00FF03F854FA0CF8F6F61FFB84F705FF1DFA96007BFD74FE84014AFBDE04
      66F96207F5F8350839F85808DCF5700442F7A6FEFFF9B6FD35FD9DFEA9001F01
      72FC1101E9FA1A008C01470213068B003008DCFC93075BF9FA04CEF697036FF7
      4E02AFFA7502C5FFFF02A703560246062001AE06D2FF7903B100C1FF7503D2FE
      77042BFC8705B4F82C05A5F81B032EFA6E0125FEC5FB7EFF5CFA98005CFFA505
      17028007320333067E0237032901EFFFAD00D1FE680188FE1105A4FED30739FF
      25074E009E04DC00FD01BB01F8025203D9051205E205B3036A05A7FF7B031FFE
      19003BFDEDFC85FC0AF6F4F916F3B0F8EAF71DFC25FC72FDE3FE3CFCAAFF8EF9
      6DFEEEF6EEFC7DF5FCFA09F52CFAD1F50CFBE5F6E0FB55F908FC4CFCC8FBDFFF
      7CFA3D0407FAF908ABFBF309EAFF11073A04DD050F072305F109D604E6075401
      AD0563FE8008BC017009D9022A08140157060DFE020632F9B808D7F4A90C9FF2
      8610EDF152115AF23C0DFFF40C06A6F899FF68FCE6FB91FE81FB7800B0FABAFE
      A1FA2FF9ACFC56F53FFED3F11F01AFF1CCFDE0F1C9F711F2FEF8AEF7C7FAE9FB
      36FB4DFDC8FA48FEB7F917000BFB8B03EEFDA107C9018E0CD204680F2805F70F
      AC03BD0D8F012B092B007F068902F80788045C0770045603D205BF015F06D100
      6706E9010D009C006EF889FD87F85D005CF8220394F7CE03B7F5950340F33703
      7DF24A0399F179028EF30202DBF60601F9F61500D1F4BEFFEAF2AD0072F2C103
      A2F44109FAF5070DD8F5A80C8FF6F00C25F7390C0FFAC40A2DFAC1067DF90202
      ACFFEF02AB043003240648004A05A5FD4003D0FCDD02BBFC86028AFCF5036FFC
      9A07C0FADB09C8F7D50831F4C605E1F1AB0118F34AFE67F874FC72FC04FCE1FC
      4FFC26FE9AFC96FE8CFEB0FEBCFD51FCC8FB2BF852FFF9FA7201B3FE3EFF66FE
      2DFB75FD6EF624FC81F46DFB6DF5A3FC06F94BFFD2FCD00194FEDA0452FE7507
      B1FCF70811FAD30878F811088CF76104E0F5CDFEDBF6D6FD73F9F3FDEAFCE9FF
      A7FBC200C9F6B7FED9F9740160006E04CB03B00323049E025B0240037D00C905
      11FFD70974FEBC0EB9FE9D113CFF401207FF8411D0FEAA0E92FEC50A4D01160A
      C905A9083407FF04BD077005020710082C06E20C0702C90EDBFBC50CB7FE650F
      BE046B11A607DD0DD90791080F067B0441056801BD03000005032A01E804C701
      BB0581019C031A01E501FD014702FE03400547063F089E065607F802DF047700
      900165FE40FF03FD1DFB02FA06F58CF521F71AF70AFCF5F810FEA4F692FEF2F3
      C0FC92F3A7FA08F452F7C3F4C8F49DF65DF483F884F558FBD9F653FED7F78501
      96F8FA041BFACE0863FDF8094BFFF1064C00C304B1006A01B502D4FD15035AFA
      68001AF68003ECF76B077BFA5B07BCF77B07DBF41308D5F28B09EDF07E0B67F1
      4C0EF2F3851022F7470FF8FBB50AE000B304D40346FF3E04E2FC320460FE7C02
      A5FF33FDE8003BF9F10203F6BC057EF5C30633F7EC02A3F8EA024E007E067108
      A107BB094007CB089306F707BE0771079F09E507040CB009870E6F0AD50F7309
      AF0ED0080D0CA00753098F05C908D1052D0C67059A0E92012A1030FF251179FD
      A710F8FCE30BDBFA8C0119F638FD69F7E5FDE6FAA2FCE9F976FBEFF70FFADBF6
      51F909F66DF8C1F502F8A3F6EDF920F851FCA6F97AFB50FB14F9FEFDE4F69502
      C9F5EF0743F7140BE6F6070AE2F52408E6F611063CFAF703ECFB190062F960FA
      B9FCE0F9760423FB700898F9F3093FF8120981F8FB06AFF8E80380F81F039EF8
      D80571F7200808F61908D7F443056EF4EE008BF6D0FC31FB76FB9AFEEBFAC3FD
      70FA4BFC3FFA11FB8EFB25FBC4FCC7FA12FAD6F7ACFB33FA9AFFEDFE75FF67FF
      0EFEB1006CFB820254F95902E7F7E7020EF99404D8FCC605E4FF8107BD001109
      C6FE74092AFB2E0807F7080636F5460420F4C7003FF32FFE28F5B2FC2FF9A4FC
      57FC09FD7BFB65FA65FC8FFB33009EFEBB0101FD1F01ECFAEAFEB8FA3FFD42FC
      18FCCCFEB1FC8501D7FEEA02E1004603CA02DE03AA0329033C0348012C02EA00
      9F04A601DE07FC00130851022A068D04B00391068DFFA606ABF70703D9F67003
      15FE5D05E1015C02F802BEFD1503C2F96603FBF71E0482F9950441FC0306A4FE
      5507160052068800610432018E03E2028F022105A003BE0632044A05BD015303
      50FE330205FC8800FBF920FD64F4EDF7A4F3CBF70BFA6DFA49FE0EF9190080F6
      DFFF74F5CAFDC0F56DFAACF74FF7EEFAF7F58BFD35F57CFF64F55701FDF50C03
      AAF68805A4F78F0849FAF80A2BFDC30ACEFFE6084B012B06DE01C50396021402
      A7FF6BFE4200D0FDF60479FFC005DEFC2306FEF9B5068BF85507BDF6BF074AF6
      A50821F83D0B16FB800CCAFE840BD501EB074C0267021C017BFCEEFF15FA40FF
      53FB8AFC6DFCE9F8D8FCD3F578FEDBF43E008FF75EFDD4F97DFB17FE3FFDDB03
      6BFD6104C9FDE60276FEFD02C3FF690484007E0671013D08180457088106C507
      9708B708F8086B08D2072B065305AA04F704A304EA0891024F0CE800D40BB900
      D6097100B20593007BFB4DFE67F44AFEFEF5BE00AAF6ACFF0FF6D4FCDBF6F6FB
      3DF8A5FC8EF9A0FC1DFAAAFCF4F983FD63F920FF9AF9390217F88306A4F5730A
      FAF29C0DF1F1EA0FBAF3F50DBEF59A098CF7420631FAD10340FD620197FBBCFC
      53FBF8FA9C01A8FDF8056AFE280803FD7509EEFB02081EFB5D04C5F9DC01DEF8
      6E022BF86D035DF62A04A3F469033BF4A50055F61AFD5AFA2DFC6CFE38FD3EFF
      59FEC6FD1FFF1BFCF2FED9F982FF00F958FCBAF688FA26F6EFFEF6FA1200B7FE
      0CFEAD0069FB5702B0F85E02EEF657017BF70F0268FCDE03D001D405F004DF07
      1F056207B602ED0496FE4E0345FB9003BCFAA2018DFBC6FD78FB9AFAF8FB54F9
      0FFF9AFBAAFE1FFDA8FDC1FE7A00AE03D3006A060401D8054901A705D500E505
      39001D06C4FE500769FF1209A9008B097302BD099F030F090503BD0629012306
      4001A6096B05E90B150A0C0CE10AB00C4608960B3D05960AACFD7907AAF88A04
      99FDA2062B0263068A031A01F90358FD540342FDAB02E3FD0D037BFE7204DBFE
      F00300FEA903B9FDFB030F002B0306038301A405AEFFF90864FFF70840008405
      DFFF370299FEBFFE3AFEEBFBA2F991F8ADF570F6CDF913F96CFDEAFAB9FD65F9
      1EFDF4F841FBC0FAA4F7D6FCCCF2D6FE8BEF49018DED1E0256EDD601F1EF5702
      92F3EF0308F66D0672F86909C5FBC20802FF4E04760102012402E6FDCA02F4FB
      0F01C0F83AFFCDF46E038DF5F70623F6500830F58F091AF6A109B1F70D09E0F8
      3608B2FBEC0957FFA20CE301D50DE9038D0C7304F10846031F035E0196FDBD00
      71FB78FE80FCA4F973FEB8F6EEFF69F7BE02D1FCF501CB013100F6032704FE07
      0606DD098506570749093806950AE406330BD306A40AA2063E0AE507850A3109
      2C0BFA09CF0CAD093B0D9906D00A9A034F089704760ADC04FD0F1502C812FAFF
      0510C5FD9D0B4AFDE00221FBA6F9E6F660FABCF7EAFB70F833FA8CF5B5F97BF4
      45F914F68FF85FF7F8F68FF8EDF5ABFBF5F489FF07F5DC03DDF578085FF46D0B
      33F1F80C70EE150F81EE3D0EB1F235098AF762058EF90203B0FB0501EEFAC8FD
      24F938FB73FFD4FDCF06ECFF8F0A11FE1A0DACFCA10CF5FB4A0AD4FA7307BDFA
      780524FC6104DCFCB7032EFCA603D4FBCF02B6FC5800F2FE09FE8602E5FD2403
      9CFFB5FEAF01A3FAD3015AF8DB004EF88CFD1DF8D4F9DEF765FDF8FD29012804
      A1009905070033064AFEE704F9FC4A02ECFC5802C1FFDE047004CC0684071F07
      B0076C05AF045403F8FE0A02DBF85B0274F5B00047F54FFA02F7C6F4E9F726F3
      54FBE4F6D8FDC9F9C3FCC8F82D005CFBAA01B2FDEAFEFBFB14FFCFFA3DFF19FA
      A9FE78F9C5FD81FA2CFD16FDDCFD2BFF02FF3A00AA00BB00A701A500E300E601
      9DFF5D074A00ED0BE2039A0AB10799081007A006A7048E05F3FF730343F9D7FE
      FAFA62FF81FFE9FFA0001FFCFE0229FABA0412FADA05AEFAE406EDFB3B08B4FD
      EB089AFED508F1FF430AFD02350A7305D7068E074F02DD0AB5FE0C0BE0FD0F05
      4C009EFF5801C4FC9200D1FBC2FD50F9A6F81AF55FFADAF55FFF6FF70701B9F6
      300239F8F90140FB1F0031FD92FCD0FE57F92F0014F7090003F607FFF1F74EFF
      9FFBAF01F8FDF2046AFED3080AFF5D0A52006B077A032A044B06F8006707E0FD
      0D06A0F97802A5F38E0446F37709BFF5620A5CF5540A62F50209BAF5410779F5
      24063CF79B06B6FA100AACFC0E0D7BFD990D40FDA40B06FC4006C0FA02FF7BFB
      40F94DFB62F6F5F62FF8E1F4C0FA4EF628FB09FBBAF907FFBEF5E6FD43F778FE
      07FCF5FF05FD4AFF00FF9500DD004D021001B502E300C80437010B089F028809
      960478093A07BF0820090B07310845050006AF085606FD0CE208C70A6D0CA808
      250C23078306B20511FE350334F4CAFD0DF2E7FC44F56EFE3CF568FC30F577FA
      45F593FAB6F581FB06F63CFEF6F5EE02D6F60D075FF6540A0AF6000D5DF6410D
      6DF4920CBCF1190E60F12D0E8EF35E0895F93A03C0FFDC008501710037008500
      74FC19FECFFDC4FE2C044C00A80737FEF30984FB2D0AB5F98B0943F875070BF7
      8203C5F6EEFF06F6FCFC5AF456FC5CF3E2FC51F40AFDFDF686FB5FFCD8FA0800
      02FC4DFDCBFE5DFA8C01CCF85701BDF8B9FD3AFA70F88FFAAAF837FED6FB3B04
      FFFAD40559F93105C4F73F04B0F781028AF99103E0FB070704004B08FF039307
      5506B106F506EC042C05E302D6004F0314FD6C0260FA83FB2CFAC6F684FD3CF8
      72FF4FFD18FFA50290FB600315FA5504E0FB570703FA2707BDF995054DFCC704
      F1FD4904B6FD10055EFCD4069DFBC207C4FB240823FD510AABFE440D5AFF3C0F
      35FE1414F3FDFC17E9FFC2137E04590FFF09B30C410B870A1B08E708C9010704
      6DFFA9018F02C7032503A4039F03F1006B044FFF010559FEF20512FEC40539FE
      9B062AFE5C0832FF4C09E90140099B0481074106CE027309E4FEF509A5FCA102
      EEFDE8FBE102A6F98F047BF9E90142F981FC52F646FAB5F56AFD0AF9B3FE80FB
      17FF7CFC3EFED8FD06FB47FED0F697FD8EF127FD50EEFDFBCAEDAFFA1CF048FB
      A2F3CFFD46F7080082F9E803ACFBBE0653FFA1027B03BBFD6E08B5F9B50A59F5
      A208E6F1C60270ED4801BBEC100636F17E07A9F331073FF4E305FEF520042AF7
      AE03B7F9110414FE3207DE00130BE0015A0D1F01C20CCCFED2095DFC6404A5FD
      72FE0B00BAF9E2FC50F88FFAB8FCCBFBDA005AFECC002F024FFE5B0261FF9901
      61065804E70AE604780CBC02940DF001D10D9202D00C6604900AC80583097D05
      8909CB03080B7002720CE2012A0D32010C0D0F04890C4107CB0C6D03160E67FF
      30110BFDF31023FA7C0AF4F78A0154F3A7FCEBF0A9FEDDF37AFFA1F441FE00F3
      F8FC00F425FBCFF676FA69FBC9F86E0071F76904AFF62107A6F5C00825F54209
      DDF5BA086DF5040B80F4FC0B6EF4D90536F533FF96FA79FC6D0076FC840108FD
      2EFF99FA4AFFB1F8AF0439FA250950FA870B1FF98E0D85F9540EEFF9F90C05FA
      8808B6FA6003B4FA21FF54F9E6FCACF8ECFC52F914FEFCFA51FDF1FEB9FA8000
      58F90BFB1EFA39F61FFEDBF5800144F817006BFC93FAA3FD0FF8D3FED5FBC003
      67FD1106F3FC310538FDAD051BFEDD057200C406BB0105098603C809F405D609
      A707DF08D806E805B2038D02D0FE6001A1F8C6FF89F31DF94AF0E8F301F3AFF3
      AAF842F628F97FFA93F5CFFAFFF34AF9F1F628FBE5F81CFB60F9D8F85EFA44F9
      DBFB77FA05FDE9FB8AFB3AFECCFAC600BDFA3703AAFB300680FD2F09F8FE4D0B
      E2FE870FE7FC47133FFCCB0FDCFDC80AA4035007F3090A04CF0838022D01A5FC
      BAFB65F861FD4EFA65000FFACB01E4F63903C2F5F20302F6B1041CF84C042CFC
      FA04C9FFFD07D902B809CD054B080308F70538097F02CE0B19FD170C1FFA8705
      EFF814FFC8FA83FB50FF00FA59FF03FA30FA98F7E4F608F7BDF884FBC1FAC6FE
      55FC51FFEEFD1C00B9FDE3FF43FCD8FE36F9B7FE6EF79DFE12F82AFEADF969FF
      F7FA9A0109FCDC036CFC620940FB300D55FA4D093DFA3403F9FCD1FD560277F9
      B104A9F7A9002DF415FEE8F0EB015CF3EF03DBF5EC0243F6BE0149F84F00E4F9
      2100F6FBAB00650090021E04CB050E05D7080E04C209B60176080500DC044002
      A0FE510479F80F01CDF373FDDDF2B0FCE0F67AFE64F9FC019EF6040240F6CEFF
      CFFBEF005800110190020FFF1B049700A005AE023508ED035808E8044E08A304
      EE08B1030E09BA035D096005210AED06920B170BC70AEF0F2C09560EEF07AD09
      54089505D10ABD01BB09E8FF200129FC76F8C9F7E0F60BF8BCF73BF8F4F7C8F7
      AAF7F1FA92F688FE03F6FE01F6F5F705B4F644084DF86009C6F92A0AF6F9410A
      BDFAE209C3FC040CB0FBE40C2BF993066FF7BCFF92F7F4FCB4FCA2FC3B0107FE
      76FE87FC03FB01FA95FD39FB59016DFCE80347FB3E0723FA7809CAF807092BF7
      AB0542F61901FBF475FD0EF33CFBDEF2B9FA35F58AFB3AF894FBE0FDD9F91403
      B4F86A014FF9A6FDD2FBE7FBD2001BFC1B045FFEC5FFC4FE95F936FDA0F934FF
      DEFA080246FA340216FBCB0339FC6B054EFDA10565FEFF064E00AC085A04E207
      3B094305860C7701E00CA5FD8C0A6EFDCD052DFE240023FB44FC73F711FC18F8
      E3FF09FDAE03EE02FFFFA804CEF9BD02B5F92D03DEFA4404EDFAF70213FC8C02
      35FD38023EFF6702C5FF920485FE6D07B8FDB109ABFC8B0BBBFCC80D1BFEFA0E
      86FF7B12B1FF06170C00FC14D802760F18085A0B990E550739130004DE0E9000
      760586FCD60201FCA40354FC6803E2F93203CCF8FD0263F8AD02ECF863013DFA
      D101A5FA210459FCDD0560FF140642025904C0036402600782FF150A33FC4606
      97FAEA008BF9E0FDB6FB4AFE29011F01810019029BFAC4008EF9F601DEFAA004
      01FBB304B0FBD203EAFA1402D8F82F00B6F54BFF65F340FFB0F282FE3EF2A4FD
      8FF2A9FEAFF383FF9BF5F90282F76106CAF931024BFCF0FADFFE3FF5FE025AF2
      1B086FF21108D7F1980300F0CE03D3F1EA0586F65E047DF8C802ADFA1002A3FD
      01025D00960216047C03090690050305A5085303330BC301620B24003C091102
      8804B904D4FEC90113FA32FC8EF73CFAFAF885FC8DFF9200E403BC0373021503
      0E0551027F092603FF0AD302A40C6203270DC403010D7B03010CE002EF09B801
      5D09DE00E20809010708B5012E094002C80A4B06B30AF90A7709E20856081202
      520826FD9E095AFA850D7DF92B0C8CF80A029EF4DFFCC5F32FFEBEF614FF7DF8
      18FFD7FAACFD86FD7FFB900093F8CB0371F6740513F5F2065EF32F0866F3DC08
      F8F43A0984F6EF0BF9F6260D7EF5990701F4400023F4F6FB8EF604FB63FE55FC
      7103F3FCE9FFD9FA3BFFB9FBFA01E6FFEE03C6010B0878023D0B1B02F20BB500
      5E0901FFF40432FDAA018FFB30FFFFFA39FE47FBB4FD00FBD5FCC7FEE3FA0E04
      11F9580269F874FDE9F8F1FB60FBFDFCA60165FF47051901C500ECFE62FF38FE
      1903F201800507040207F6048B07560560073B05930640074C0684085F07D406
      EA08AC03040A14FF3D0919FABE0616FAD901EDFB33FB20F817F634F27BF39EF0
      99F213F358F66BF607FA67F8C4F54FF6C0F315F5B0F798F857F9E8F9C7FA50FA
      4EFD13FC6CFF36FE8200D20094FF8202D6FD2704C1FBF905D2F960076DF99108
      BCF9AA0DC6F91F1498FAB913C1FC2C0EA5FFCB084A025603A107BBFFEE0B2FFD
      D10644F7ED015FF3E40311F47305C0F3210674F33806E1F52C0506FA9903C7FE
      DA03B60233061E0689072B08F407E7075E070E074E0553099002220B2A003305
      2AFD5EFC7EFA5AF899F83EF9BFFBFAFCE500B6FF29FDC1FDBDF8D2FCCDF9E1FF
      80FA9F0031FC07FFFEFE95FDAC0179FC4F037FFCE7021DFC920293FAC701C1FA
      250175FCE10013FEC4FF54034BFDE20747FBDB03E9FA12FC03FBACF64BFB9BF3
      7FFF4DF2F306C0F1CA0655EE170414EC3506B0EFD30598F28203D4F45B0231F9
      2D027AFD180292015302B5045B04D0050D0741056B098102110A66FF9D083201
      690401047DFE9600EDF8FEF90FF4AEF7FCF0C8F919F4BBFDE0FB110122FC49FD
      39F93EF80DFC2DFA45FEB6FB6A00CCFB230405FDF306ADFD1208AEFE1708D5FF
      1608FA010D070605D4052508F905750CD406DE130806BB19AA0438177F03380F
      8002FC08F90193043E04AD0082086DFE9403ADFA8AF9F0F80EF7CDFCC0F66FFF
      E1F534008CF5FA01F5F3CA0334F2380594F1EF054FF4AE0717F85809DEFB3109
      36FF6D0880000E0AB2FF740C2FFE410804FC7B007EF8B9FB54F550FAB2F676FB
      F8FDC2FC2900EEFA1DFDA7F9DEFDC7FC84FF06FECB01DBFBD80407F99006DAF5
      1A06BEF37F02ABF289FFEAF2A8FD92F31FFC10F463FB0EF774FA9EFF37F8A307
      C6F5B10613F57401D4F47BFEC7F41AFE25F894FE81FF14FFF5FF58FD7AFB11FC
      54FD4F0116FF8A0571FE6D05E2FD660693FDC70751FE8F08BAFF73081A033306
      CC06C401410AC4FC8C0CFDF9CD0C4EFD090A5B0231058A01EB01D4FDC4FE49FD
      00FBF2FF87FA2903A8FE10053EFE9102B6F898FE2AF8F8FF39F8D10170F68A02
      0BF739051DF98107D5FAC40903FB180BD2FA1D0C73F9820CE7F73B0CD0F7D10E
      9FF9C01552FC4A1CBCFFD51B770309157405DC0D5C06A70950081E06750DB502
      F80C19FD640408F78D00DBF674019CF71D02FFF6E7027EF80802A7FAE10029FC
      6F001FFD780164FF5403630111043F025004D5044004760AEC02860E6A016C0A
      1D017D0353FF4E007BFCAD00EAFBEA0293007904C4024502BEFD24FF84FBAD00
      97FADC01A1F93D0057FBE9FE32FD16FE74FE2DFD83FC17FBF5F971F957F803F8
      4DF7A6F6D6F765F7A0F894FB45F8C9FEBFF713FBFCF9D2F493FC9DF189FDE6F1
      FCFF04F33008BDF3520D3CF2580931EF9A07EEF168063AF6AB02E6F75100BAFA
      47FFE2FDEDFFE3014500AD06820153094C0318080705AF04C506AC02F0066704
      FF04180667018702EEFE35FC4AFDAFF942FC3CFC6CFEC6FFDB05E401B10B5400
      100A3DFD6409BAFEAA09A400F30720FF5408C3FDD4097EFC920BF8FBEC0B0AFC
      410C3EFC600B59FCDB09AEFCDB096000B209FF064B09700BA707DD09E7064B04
      BE0539FF840451FCDA05FAF9E30A44F9720D16F8AD0778F52B037CF79302F1FA
      DF012BFC1901EBFD10FFB6FF1DFC180110F9B6023AF8840582F9110763FAE205
      A9FA440586FB7C075BFC0A0903FC5104C9FC8BFB97FC57F555FA02F491F9C1F5
      32FE77F97804BEFB3804B3FCB9038F01630531069E0595055507AA02A5082FFF
      D308F7FBEC0618F9D003C3F54C02E4F2EC00F4F2ACFFA7F7CBFD98FF68FA9005
      0FF6C30342F3E9FDBBF1E6FA79F062FB3EF2AEFC06FA10FEF302E6FE8205D7FD
      67089100CE0B50040E0BEA04A1094C07F7065809BE04E8098C026C094601AC06
      F5015201480332FCD70576FA1C07F6FBF50443FE74008FFCA4FC1CF79EF8A0F3
      8EF3F7F4DAEF4FF72EF182F928F4B8F920F33FF63DF38DF7A9F4AAFCA6F4DEFE
      CBF5BA0025F8560267FBD00376FC1305CFFB23052AFBB60407F912053CF7A409
      EBF6ED1160F842183FFA6417E1FC311015FFA9087CFFB2023A0126FCD4069CF6
      150C7FF1810A68EB5007F6EA5B06B7EF440687F3980653F88205B7FD02051302
      4C042A053E03FB06D30201071402AE0580017C0644017008CB01D009B3002B08
      1EFF3D0348FD110004F945007FF5C5013DF694032CF94603F3F8080082F85E00
      A9F81E0373F84A028DFCB000770299FE8F0752FCC70942FB7308E0F91E062CF8
      1703BFF70A0091FA3EFD13FF7FFA590270F70F0184F624FB58F75DF677F6DCF4
      EAF5B6F356FA9CF28E0151F109044EEEF7038EF0B3032CF8AF0074FC54FE4A00
      DAFC4A0548FC070AEBFCD10DD5FDBF0E8FFF770CD40084080802F40676025607
      2B01DD0707FEAB0535FA390058F7D4FD07F554FF32F4E6FFBFF7E6FF1BFDABFE
      29FFB8F816017EF59402C9F7DE0127F8CE02D6F8F80451FBAD089EFE1C0CD301
      170DD5038A0DD905760DE007B60CC50CFF0A2A13A4088E1660056D14A302B10C
      520170042600EBFF7D00E5FDE303DCFDBD065AFE32047CFB0600C2FA05FCA9FE
      2EF8B900FAF6800106F6FB01C1F59B029AF627041CF98405C0FD3F052C026D03
      1005CF04F5053907CF05AB077B03850497FF88FC24FC74F6E6F7DBF4C2F3A6F5
      70F467F88BF8B8FADBFAF9F9C0FD13FBFFFFCBFE3AFEFAFDC0FD2DFB34FF6CF9
      7B0049F8F4005AF6580083F38DFF07F385FE0EF588FD19FB3BFCF20252FA0109
      D1F6CB090CF3050452F0E8FECCEE06FDC7EEB8FC9DF236FE57FA280043003EFE
      DD04D2FCAB07EE00BC05EA024D030C032302C503F6019303EA029B020604D900
      4505E3FEC40612FD8A097AFE670C3B02180D1406F00B5F06AB098801D805E2FD
      E600D6FDCBFB2FFEF7F9E1FDEAFB7FFDF1FC4DFBEEFEBEFBACFFD9018FFBBE05
      3DF839078BF6A00857F78E0902FA1B0A73FB7309D5FC5E09FAFDD509F0FE830E
      F600D415010490197906BE184B0842135F093A0C91089D05BD0697FF9307F5FA
      A5096CF77B08F3F11D0845EEFD07B4F1510534F544040EF7BB03C9F88403B0F9
      F602EBFA4E01EBFC28004400E3FE130371FEE80688FEF00B8DFF34106200A010
      FAFF240CD3FE2C0805FDB606F3F9F0063EF85C0830F9E608F8F8C805A1FA1304
      3BFB180702F79F0797F688042EFAFA00E3FD60FE0B00F7FA9DFFD0F59DFE33F2
      20FD90F0CAFBEDF253FA22F8CEF812FDE6F6DBFEADF5A4FBD3F562F8B9F6E1F6
      E4F82EF67BFC6CF5500147F40A0414F11C0774EF080984F4A1057EF9AF0276FE
      B000DC0403FFB20942FEC90C26FE550DC6FEA40B9CFE2A083EFF680638017506
      F702FD0606031705DD0293FF9103BEFB660491FAD3048CFBC805DCFD220814FF
      8B08E3FB100AE0F78C0B81F975062DFB3E0260FB4F023FFCDA046DFC7A097FFC
      D00B01FC430C00FCA90CCFFCA10BB50164093E0A460702115E049511F801F50B
      8600200698FFC901BEFF43FF48025EFEC2063FFE780730FBDE077BF7CE08D3FA
      FC03E9FE6D008D00CFFEF201A0FCAA0259FC3C0471FCCC048FFD69042DFE9F03
      31FE98033EFDC003BAFC0A03ACFDAB0066FE7BFB34FD7AF87DFBB9F864FAB2FB
      82F9FC0018FBE5058DFBA906B0FFD0050A06D3083E033B09B0FE080696FE1A02
      DFFF7EFDC201E5F90903A7F77403C4F7820240F97600E4FD19FE6B0441FB1409
      7DF721093FF39D0306F0B5FE11EFF1FCC7F097FD95F54AFFDDFE0E00FD0732FD
      4F11F1F9001A7AFD9B18FD00D712C901100EFA027C09AF023D063F01D00346FF
      51039BFC2C03AFF803046DF7B9057FF86A0749FAAB0718FA36051FF67E00CFF4
      B8FA17F6B1F594F7ADF1EEF838F1ABFA7EF1A6F921F40EF793FAD0FAFAF96BFF
      32F64401FAF59502CBF62F0248F9F40190FB780243FC810396FB10058BFBDF09
      D6FB6F1013FCB71457FCA1144AFCD50DB5FC8404ABFDFAFBE6FF83F6A402E9F3
      980627F3EC0771F11F0950EE200EC2F28E0C8AF9A30714FD0807EEFFAC069C00
      CE05A001DF03D6022D026B02E8006701DEFFC4035C0051085301BB0B8B024F0C
      DD02D0074300420315FC220106F91101F9F5900273F50704ECF55E0265F8D9FE
      15015700A60314016A010EFE2A0482FB58080CF8B90B1DF4430CE2F0E60A44EF
      DB072DEFBB0314F3430082F9CAFD1AFE68FCD9FE83FA6AF9FCF77EF3DDF629F0
      92F8F0EE96F99AEF05FB16F1ECFC73F15E0082F06F0863F6E009FDFE39052A04
      C702A108AC00F40A5FFFF80B82FE890CC6FE5F0BC9FEB00732FE540601FF4B07
      4A00E207BB000E0789004601D6FF05FCF7FDBEF9AFFCC3F825FB52F73FFBDBF4
      B4FCEDF085FFEFEB3007C6EED70824F6A602B6FB28006E0084011303B504E904
      0A082C06D20AC406DC0B0607A10AF90A3F08AE111205E0154A023E1644FFB011
      E3FC150C4DFBD6071CFB2105C2FBC80356FD4403F5FD6101CBFC21FDB5FFCDFE
      B6FF6E040DFA730601F8700645F96F04BFFC8102140000024C029E0130041500
      3C04E9FF7D0373010F0240026500C7019AFE4AFDF4FB70F9BDF8E6F7F2F755F8
      6CF774FAAEF5CCFCFAF489FDA3F629FB7EFE83FD120228011AFC7F00D8F8F0FD
      28FA76FA91FC92F7B2FE27F5ECFF45F40400E3F42AFE6BFA7AFB1D0318F99309
      7FF6DD0BAEF2410700EE2E0268EA4A0024EA9200DFEC0C010BF22D0017F89DFE
      63FECDF9BD08B5F89E0E65FC740A85FE17077E006D055B022C04610468035B06
      3C03EA062E045405FE03D6056C0482073807CF07A40AF006BF0A3001D107ACFC
      4503EAFB23FF42FD84FBC0FF51F97B013DF9040293F930FFBFFEB300B101F006
      D5FA2B0A18F4530B64F10E0BCCF14D0B01F53F0C4FF9B60C2CFEAB0C8902690F
      2E060515CA074619B70724199F05CE117102040AA7FFE203F7FD57FFD1FDEDFC
      AEFE9DFA3C00E8F78A014AF2B5060BF23C0A0FF87B059FFB70011DFDDD00BEFD
      B900A3FF3000C00278FF9C053AFF0708D8FE280CC9FEC6108FFF1C132B017913
      0D02650EBE011C09F4FFC2060AFEB405E4FC6F0677FA8F0777F87D07D5F76603
      5AFDE8004204E600A70073FEC0FBC0F863FCBEF1EEFFCBEC6C03E1E9160529E9
      8005D8EA6A03E7F1E1FF8EFAFBFC3D00A8FB690220F9E7FC75F55EF61CF404F3
      3DF6E6F0F5F89CEFB6FA91EEBFFCBFEECBFE55EE7D0556F2A00DCFFBDF0BA802
      F4056D06F2017D090EFE060C03FB670D9EF8CC0C61F8D909ADF83B09B7F92B0A
      BAFD9D09C1037B073A0968FFE70B0EF9400C9BF7510BAFF62609F1F6240622F7
      0604A5F6E702E2F2C40640F2170DB0F7000B7BFA56053EFA34045BF9900521F9
      BE0753F9270B89F9A50DB7FB160D7002BB0BDE0A0E0ABE11EB07F2147F05590F
      8B0286083300F30314FF4C00C6FE2FFE82FF37FC5C0112FBAF02FBF63D06E0F6
      180B30FEBE08FC02AB02C102390106009E02DCFE9303C2FEE80360FC340469F9
      3C045CF9EB0350FBE60386FDF403000053037DFE4F02F7FC330178FE1E001400
      98FF0A0292FD90039FFB4C04D2FB39012CFF73FFF405FA019805540250FFFCFF
      BBFDC9FCE8005DFA9F0400F83E061BF65706D5F6C60348FC33FF5E030AFB9507
      99F89208F3F517038DF20AFEE7F030FD7DF219FC58F778FBB6FC51FB0F0226FB
      CE0659F7870DB3F5A61619FB0D175CFF6D0F29015C092803E7055F04F3038003
      8302D600140277FDBB0083FC8DFEDFFCBCFFB6FDFB022AFF7604F6FB1E0337FA
      7AFFEDFCE4FAE7FE85F666FFB5F2CDFE46F010FEF2EE63FA86F1DEF8FCF7A8FE
      FBF8FD02A6F3CA03D0EFB3044BF03B063EF29507EBF48A06A3F978053DFD7208
      ABFE180D7EFF820F7CFFE50E63FEC207B3FCA7FF46FC2DFBA7FD8FF851FFA4F7
      4001DCF6AC03EEF6870596F34D080FF2DE0CD3F7CF0D50FC22090EFD760488FD
      38031700A00268037301700513014807FF00E10A5B008D0EADFFD310B1FFB111
      47FE760DACFB6E086BF99A0652F7A905BDF576051DF5C70537F5EE0511F7F600
      AFFD17FC910752FDC40B68FC070798F70502CBF28D02ABEF100542ED66060DEC
      A306CFEE30050AF5520212FBA0FF7BFE67FE4AFF89FBB9F936F76BF328F52BF2
      B6F460F22EF5A5F3CBF5ECF5C5F5BCF9A7F5D0FAD9F901FCC4038903AF09B409
      7B06DF0BFE00FC0D95FDED0F31FB2C10FAF8E20E1AF76B0D55F6BC0DC9F5240E
      0FF7210C24FCB60889000E01C90113FAF70071F704FF6CF592FC49F492FA33F3
      67FA5BF328FBA1F230FF70F3DD071BFB770CB1014909DE03EE03AE04EB01A404
      1E046A032D07DB00290A5201DB0BF006160B8B0ED109ED14F708071817078D13
      BE03CA0CD8FF9808FDFCCE0450FA72020FF8480022F8CBFFBBF803FDA1FB28FB
      E901DE00E3058F04E805BB017A046FFE3205D4FD5007B2FC490758FA8806AAF9
      200571FB7B03D5FD7802FAFF6C02C201BB017DFEA0FFA1F94BFE19F85EFD67F7
      9BFACAF793F7CDF93DF6B2FDFAF3C5FED4F4ABFEA3FA01037AFE51056DFC6B02
      96F75EFEECF716FB28FC3CF7BAFE53F472FF60F626FE17FD8BFB75040CF8B409
      BFF57B0C81F3ED08FBEFD40228EE2AFFBEEE07FC5CF0B1FA4AF2DAF883F50FF7
      83F8CAF321FE74F00309ECF4E71186FB0513F8FF920E64044C0BDF07F3098C08
      3F08310738060806B5036C054502B5042202110364046D02480750FF1D08C3FC
      4A07E3FE5305B1008F02D60110FFA0012CFCDA01E9F8800045F87DFE44FD7F02
      73007C0753FE1309D9F896092DF5170A03F7C20888FBA1051902C9052908DA09
      BD0B970D090DDB0F480DAF10E30AE70BE405CF043F01AD0066FEF6FCD1FDC1F9
      55FD63F6B4FF82F42F023DF1D70330EE6F087EF3D00B33FA4E0BE0FC8406E8FE
      3D024502C2010705570141064401E50851012F0D7E00CA1011FF50131AFE0E15
      4AFD4B127FFB680D1AFA4E0B81F9820A55F8820A7AF6170AF6F6B50829F76804
      5DF8A7FE63FE8FFCBD0293FA150261F5F9FC52F055FA53EDCCFE68EBAE03EDEB
      80065FF1910654F9370409FFD200D5018EFD4D02C4F927FDA0F518F5CEF3C8F0
      1CF3D1EF67F3FEF012F4C1F2D8F576F531F7CBF7B9F985F8F0010EFEF6087B05
      740A3109C1052D0C6DFFA30E54FC070F45F96F0D3AF7C90BBEF6A90AB9F8F107
      07FDE30381038F01870A16FC420ECDF4350F39F3830D4FF3DD096EF4CD0457F5
      320110F6BAFED7F59FFEB5F29A055BF4060C09F9440DB6FA270971FBE70283FC
      03032FFD380510FEF206810296080A0A3D09311001093E14BB08AD16E807D412
      0F04180B21007206EBFCE702E6FA8F0056F8C9FEDCF7C0FD52F942FCDAFAB5F9
      CE01BAFC05081900EE0AABFEEC0AB8FC4A0762FB6206FBF92906F4F77805E4F7
      D905ECFA3F06BBFE9C06DF02E6066807C605C207B6027C049C008C0347FFF302
      70FDB102F7FAA602B1FAA2039BF9FE0441F79903DDFAC704FBFEED06FEFF5A05
      74FE1E0240FBE1FEC3FC8EFBCCFF0CFA45009FFDF1FE3504F3FB1C098EF8000B
      FEF54F0B68F40D07C9F3EDFEC4F54BFAF3F82FF9A3FBFAF811FDD9F78AFF95F6
      38023AF51D04FAF1B50BBCF3C8131DFA6B176AFDF216EAFE8D1191FFF40D8EFE
      310BAEFCF00619FC4D0322FD4D01BDFD4600B5FE04002501D501FFFF500346FC
      C703AFFC7D02D4FD40FF59FED9F9C4FD0CF52FFD38F11FFD9AED55FA2DF1BFFB
      6CF6BD0115F7AB041EF64205A5F22204D7F28F01C8F6D1FF68F9C00031FCEF03
      6AFEF305D8FF900719011A0A01022D089500C002B0FE1000E4FDD1FD9EFD29FC
      D1FCCCFA45FDC7F8A0FF66F6E5FF3CF2B1047AF3910ADBF9F90AACFD9B0A1400
      8506740221036A040B035B05AF022C070403FE0A6F02B60DE2000E1053FFCD12
      C7FD6711A1FB950B11FA760734F9EF0424F9EA028DF9AA0002FCEAFE94FFAFFD
      F5FFDAF7A60421F4BC0A93F4C40A6FF28408FDEE1603DDEBC60029EAB8033BEA
      D2055FEEDB06C9F40A064FF80A0461FA2D01C4FCA4FD45FBCEFAFFF512F98EF4
      EAF75FF560F796F675F6E1F7A8F62FF9AEF785FBAEF66FFBA8FBBDFEC003F206
      5407EA0B2509F20DBF05350F1401760FFBFD4C0E14FAEA0C39F8D90A5CF8F606
      C7F92C0429FC2D02E0FF8BFC3203DBF4340504F2BC05C7F1BE04AEF2210224F4
      F5FFCFF408FF30F6E8FCDEF40A0153F6DC083EFD850A56014A095E01C0058D00
      EC023C012803300393036C0769047E0D390533122B066816B8065C1A4B061119
      2803F81177FEED0C91FA67093DF7A206C0F3A704B7F1A401AAF24AFFA7F333FB
      ACFA86FA1D05F9FE8609B4FF160DC4FC690D1CFB370AC4FA3C0833FACD050CFB
      0A04BCFDD5028FFFF20128013202800339022502AE00BEFCE7FE63FA53FC9AFA
      7DF9B9FBBBF7ADFE00F77802C9F67A05FFF3E0023DF5890046FB390252FC3501
      24FC33FD01FB4AF9CAF88AF74BFAF7F795FB35FCF0FA9102F3F8CF06DCF5C309
      F4F2570B40F195077AF02AFFC8F08AFAA5F1E3F804F2C4F773F185F7FBF1A3F6
      02F547F66FF77AF4E0FE3EF6AD0A26FE6410FD035A1305065F136A07D80E8608
      A40A730778050206FA01AB0519018E05BFFF660636FF86074800F8056F028001
      1B05F6009106B302B5058803E401B30494FDBD049AFAC404B3F525021CF62701
      AEFC1306BFFD2A094EFD7A076BFE170517FED804F4FE0405B700C006CF02F309
      E204880B9D066D0DDC0716109507890F7C05EC08E201CC0291FED3FEE8FB38FB
      08F9A6F9F6F70FF817F938F708F967F622FD8CF96105EC01B806B1065A06DD06
      E106D8069403FC07BA007509A0FF390C42FF311030FF36139CFEF41588FD5B18
      7DFCE81635FBB30F83FABB0971FA9806EEFA4D032BFC1C02F8FD7101BDFF07FF
      E5FDA8F8D4FD80F27603D3F10A05D1F04904F6EC21053BEA0A0434EA6004C2EC
      FB058DF24E06B1F8800539FB1803BFFB58FFE9FB4EFC1FFA60FA3AF575F84AF2
      0EF730F2F9F594F285F46BF490F433F6F6F63DF8D9F627F997F8B4FBA600B503
      3B04E2092605360B5307FB0B9F04BC0CA0FF740BB3FB34093FFAFA0686FB1904
      79FD8001D2FF6FFF6A03EFFB850748F54B0B37F2020D7CF3AA0B14F50608FFF6
      18043BF6E901EFF32DFE02F060FE6AEEE50637F4FA0AEAF9130A56FB3A0B69FD
      F9098D00DA060503000690066506440A10074A0C0508B90E440935127E09C912
      5807250DF4033407CEFFB60340FC78009DF869FEA7F550FBCFF523F845F61FF5
      B1FAC5F4E80410F9300A7CFA200B9FF7DA0DD3F5D40DB7F57A0B34F6700ABFF8
      190B4DFC0D0C12FF1C0C8002570B9506570AB2079D082C03050607FF480381FE
      E10086FF84FF8D021FFFB40474FF6D054EFCE2023FFA55FF14FFE2005501AF01
      72FF4DFE32FF3CFB0BFF6DFAEDFD0FFC32FE840033FFA00442FEDB05EAFBCC05
      42F92A0466F8B50020F978FA68FA57F550FC21F480FDF9F350FDF7F41BFDF6F4
      76FEB1F43BFEF7F3DEFF42F3E408D5F7B20F8CFC581141FD7E14F5FEF314BA01
      7F0FF00246089B049003DC060001B70672FE0A067EFCE10535FC2F0493FD85FF
      0F004EFDFA013DFFFF00E500F2FC9702DAF7D401E9F35D00B8EE37FE7DEB0EFC
      9BF0C5FF9CF44E0366F4D3010DF7B600D1F9AB0053F9D20047F7B002C2F6A904
      E1F626055DF8F50536FCBC088B00F9099C023D052802D9FF90005AFD1FFEA7FA
      9FFBC5F860F9E6F547F92DF409F90FF547FBC5F6C60330FCD7080E01CD077C02
      4008BE03E8083B05610600076802880A0400E40E6BFFA211EDFE40140AFE1D17
      DCFC7B1671FB830FDDF9E60788F93D0363FA2F0053FBA4FF59FDDBFDEB007BFB
      950033F7E8FE75F1CE0330F16A07F7F16D05C1EE5F04E9EAE50465E9050410EB
      540276F073029DF6670237FAEF005CFC0FFE5AFF1FFC1801CFFB6DFD9DFA26F9
      F1F9BAF756F95CF7EDF707F97EF62CFBDFF674FE4BF50B0258F23B0458F7CC09
      7FFDC10F94FE8010EF000A10B5030810E601280EDAFC860C4AFABD0B16F95A08
      F2F79A049BF62C0231F6C9FE07F9A8F8DBFD8EF49303CFF5990636F89105D5FA
      EE01AFFA10FF9CF93BFBB2F8D5F7DAF689FDFBF916041000A904B302A5065903
      76096B0436092906B7057809B003D90C0E04DF0EBF0417111D06C1141E07A716
      2507C6110B05EF0A5102B606EBFE3F02C7FACCFEBFF6E1FAB3F57CF706F622F7
      C8F6A3F696FFCFF79408CFF93E0AAEF80E0C9CF72B0F31F89F0FEDF9CE0B8BFC
      440857FEE006D6FED9053AFFC704AE017B036203A303D6FF0F03FEFBF40016FD
      ABFE68FF0AFC6101C8F9400288FA5F0286F9EC000AF534FD14F873FDB7FCB6FF
      3AFA4BFE98F77FFBBCF75FFA94F817FC32F7B20032F61A05E5F5CE0670F47C06
      46F31B0684F2C0043DF3FCFD86F3E8F633F379F4D2F29AF378F2AFF353F3FCF3
      06F785F523FA78F729FAEFF7C8000CFBAA0ACA00EF0DE20211101003B6135D04
      BE131006950DDA081B08590A3305FC08AF02EF06E000720605FFE005E3FF3602
      620228001205AC028C05DE046903A105DDFF720468FDA70231FB13018AF613FE
      30F99EFD62007F00590234014B03A5FF550606FFA70960002D08C903D3040107
      3F047C088F04F2089C05CB093107AA09E008390413085AFDC605E6FA80025EF9
      BFFE3CF81BFB6CF89CF836FA53F820FD91F788FD66FD8CFEA606560235083804
      A6079C04D2084406DE09930989067C0E7300C41209FE461535FD5E1668FCC217
      47FBE8174EFA90119DF9E6083AFA6A0581FBE8035AFBE801D4FA0000CBFB7CFD
      4DFC16FAA2F8E9F389FB67F0350452F18905CDEF0E0478ED3B0440EDDF0551F0
      F70486F602023EFB43012AFD36FFACFD4BFC58FEC7FAC1FEE9FADDFAECFA72F5
      67FADDF34CF9FBF398F74BF52DF679F8F7F5C9FCA8F5550148F2C8029FF48304
      FDFCBB0982FF930B9BFFEF09A001D907CA0461063704DE06A0FFC40543FEDC01
      02FEBAFD02FED3FB51FE74FA560059F6990452F23809D5F2EF0BA2F4F60A77F5
      A807B8F5FB0349F53F0177F54CFC58F4A2FC9CF69803AEFE8606AB029107A802
      31096C03210CA905BD0B0A0A81066B0D22041C0F8C032C10F9020F12AA029813
      5B03BC0FDD02B808DE0099046AFE760056FA72FB5BF741F818F74DF74EF8B0F8
      AFF671F7A9F9B1F5DF029FF7D405ACF77D06ABF54D0AB7F556107DF83D13D5FD
      A70F2002FC0C6104E50B1D064A0A0508A508180AE00722087706B304AB040905
      CB03FE056201FA05EBFEB5051CFE550513FE170597F91202C5F7E0FFC1FDAA02
      BFFDEB021FFA2600EEF8C7FEAAFAB20021FDC00517FB48089FF9670732F93D05
      08F87003B7F6960114F732FC99F89BF5D7F988F3F1FA73F328FB29F3E2FB66F3
      69FDB6F38EFFCCF4C8FD45F3D2FE63F29508E5F7AA0E7EFC5B112FFEA0135701
      47150705AF156A08B10FB9089E099F05F30569028502430112008F01E8FE94FF
      7DFFE7FDC6003E0008010E02CFFE9701C4FA7000FDF660FFAAF40CFF4AEFFEFB
      65EDBCF9A0F547FEBFFA6900B1FADBFDCCFAC3FC24FCC3FD99FE390180FC3703
      88FA7903BFFB950385FCAB04AFFD14071600A005C5016E0017015FFD1200FFFA
      A1FD0FF9D0F9D4F9A4F7BDFACDF7E6FCD7F556FCB5F624FA7F000AFEBD05A002
      3905EC03BA052A058E07CD0744091C0C8105600F05010E11D8FF1912C2FFB312
      31FF7A12B0FED00C9DFE0905A5FEF500C9FE78FD52FE49FA5DFE31F866FF68F6
      CB019CF5B20088F13EFF3AEC180644EC7D0998EB7B0688E8080511E83905B5EC
      EC07C5F5F0060DFDD102C4007CFFDE009FFC9AFF04FB44FFDCFAC2FB60FC64F6
      7BFDACF4DDFDFDF423FDACF606FC22FB6EFA3400C0F83B056FF48A0616F1C005
      B3F7070AC5FDFB0C22FF2D0A540122080405E108F209EE09F10744087E011604
      10FD5FFF93F9F1FB4DF83FFAACF91FF740FD0AF4630250F52E07F5F79E087AF9
      E506D9F9C50378F9830191FA1EFD8FFA39F867FAA4FDCEFF92044B04F1054F03
      680755034B09D706210CD20CE109E41001049B12C8005713E1FEB91365FE8615
      8DFFD8138701610DDC0192074B0070014EFD2EFB0FFAE7F84AF8EDF7BFF795F8
      5DF51DF816F4E3F4F1FCD9F67105D2F9D8066FF8D70879F7B10B7FF9D80FBEFD
      B30FEF00960ACA02570759041306BD060B05A70ACE036A0A4202EF05AE016903
      F2012502C2FFBE007EFC1800E8F9C5FFFEF85600EAF6ABFE1CF313FBA1F611FC
      D8FA7BFDD4F7E2FA4BF52CF91FF572FC9DF7C00225F99E051AF7770612F6FB05
      20F5DE0301F37F02C7F18AFD75F123F66AF164F223F2ECF13CF3B8F246F59AF5
      8AF789F91DFA9FFDCCF9D1FE04F7A8FC0AFD5AFF31064D04A3095E05980B7606
      DB0CD309C110070DDC117D0CC10BB8093D069E060202C704BFFE3F05ABFDA104
      C3FD18030BFFFD035F01C80564026C053A01250413FF4F027EFD570096FA15FE
      A6F692FB7AFB44FD6C03F5FFA90443FEE204A6FDCD057C0105092507480B410A
      E507320A0A0486081202030700015D0867012A081E0312044E0455015203FC00
      45005300E3FB6D0035F8FB0048F771029AF4D80222F19BFF87F7FC0079018806
      6A038C087803370ABF035F0E95046213BD044616F1FF241764FB4717D4F93516
      AEF9EB1401FBFF1075FD6D09EAFE210316FF70FF3FFE7FFBD5FC57F815FC0AF6
      4CFD66F4A7FED7F1E4FDD8ECC70228EC440AD4EDC909BBEBD5066EEA59055AEF
      7E06F2F8BC0853FFE805CF00B70019FF6DFD3FFC18FB57FB4FFAF8F83FFB1CF4
      DAFB77F1EDFB6FF26EFBD7F408FB24F93AFA7BFE4AF92503E1F621052DF21503
      4CF55603FAFD9504A7002C026D01CD005F023402C904E7035E0877026706C0FF
      B3010CFD25FF92FA0AFEB0F997FE30F7420076F31C0215F2390560F4AC07D4F6
      B907ADF8BB0536FAF303FCFAE2001AFB0EFAE8F803FB49FA070485FE770780FE
      A708D4FEB80ABF035E0D620ADA0F7A0ED30C560F55060B0E3101090D9DFE620E
      F7FDBB0D27FF1A088D00F100AD0089FBF8FF61F7B4FFFFF480FEEFF334FD8AF4
      9FFA87F5FBF41BF22EF7DCF0D60040F4840563F4B907A6F4490B75F90A0FD3FF
      AD1289032912F804EF0D8306410BD708B30A0B0CB4098A0BA5086306DF085802
      5D094401DE08DFFFA3073DFF160588FFD2025700AE00E50024FC8CFD1FFCA0FC
      6301C1FEAE0127FD81FEA7FBBCFC82FEB4FC2B0307FF1605630021040BFE3301
      2DFACCFDB5F78FFC3DF715FA85F84FF413FA30F030FBADEF39FCBEEFC0FD38F1
      D5FE01F4F5FF77F77500C5FA1EFDAAFA4BFE95FC6D07A1015D0CC0029C0C3D03
      660D0B07280F4D0AF1115909621197068B0BDA0315051D02E80031032BFE8003
      91FCC901FCFA9501A4FA680328FBA50370FA8C02EBF791FFAEF528FD83F4CFFD
      CEF063FB65F1E9F94AF901FC17FD07FB0EFC05FA4FFBE1FDD2FB70032BFF5706
      01021A076200530613FC8E05A1F821070CF70707A0F7CA020BFAE3FE1AFC94FD
      8BFB99FB59FA4BFADFF925FA6AF9DAFA68F80BFDEBF306FB38F4B2FA84FD2401
      0F030305C9039106EE04F70A0C06AF0F9E07C011BC079312E103F611E7FE8610
      5EFD49113DFEC10E7CFFB30660FF2E0063FE76FC17FE23F952FEC5F628FEACF4
      5EFE0AF361FF05F256FDDEED08FE7CEA17051CEC800839ECBB062FEDCB04D3F4
      86045EFE56053E03590544038802F100DDFC9CFDB4F89EFC88F703FBABF846F6
      38FA88F414FBFDF6ADFB62FA29FC51FFAFFBB904CBF984091DF7C10DC3F0A50C
      A6EDED08ABF477094AFCB808BBFF42066E01BC072C02EB08B10362060605C502
      85014BFFD6FA06FDFEF7C3FDAAF80BFE6DFAA8FB8BFB65FAA8FC24FC05FF2AFE
      D900050047013F0158006F01F8FD2502BAF7DDFF0EF524FD4EFCE8FE1003F2FF
      4A05DC0081067C06EA078C0D210A1211EB0B2211FD09A30F6203080EA9FE6F0F
      AAFDEC0E99FE8F07930099FF670217FBB103DBF69D0350F33D0230F288FFE3F2
      04FDCCF5F2F7BCF48FF513F297FDECF4220523F61007EBF5A708B4FACA0A9101
      EA0C40060E0F5D09A30E6B0B540A5D0CC406D40DD804EE0B0104EB04B203F6FE
      070398FC7F037FFB320432FBAA02CCFB44FF31FD30FC77FF1AF72FFE4FF3EAFA
      3CF74DFC92FA37FDAFF814FCF7F524FFD0F4E40451F6E606A6F9100523FB7C02
      18F62FFF8FF070FD0CEEB9F989ED72F2F2EE8AEEABF0A8EF6DF380F275F6FCF5
      23F907FA38FAEEFDDAFA8A029EF8C2032DF77B0183FEBE0224067F03A0087202
      580A80058E0C5109920E91092B119C07E6109405390A7C042404FE05BD01BD06
      E90088040C00960300FFDE04F5FFEE04D000C20190004FFE99FF55FCDEFEEAFB
      53FB2DFA4DF78DF685FC96F74D0493F95C072BFA870851FFB3090B05330BD806
      690D3C060D0F3405FC0A62052305A908A302970A6002E20662034402B503D3FF
      8902E5FDFD0030FC3B0035FC35FEE6FDCAFBE60035F7A600C7F2F5FE22F8F803
      100024099C02720BF802091158039D168103C5189D03E7179903AF155000B314
      64FD9314E2FD6F11A1FF920932001F02CEFED8FD63FDB9FA30FCF3F773FB49F6
      41FB25F69EFC7DF71FFCD8F58AFA19F0C1FF92EF090673F1D4066BF273058CF8
      DD03A5FF70024A02EB01AE00AC034BFD500160FA1EFBEEF951F885F88CF72DF4
      23F85FF2B2F899F4EFF96BF83CFCBAFCE8FDEF01FCFDAE0650FCD60931F7E107
      C8F0310250F42301F6FCB5008300FDFD37004AFFECFEA10122FF7100250158FD
      86044EFACE0349F8CDFF92F8ECFEFDF81D0043F71301B4F6160116FA3602A1FE
      8D04510020062300A40534FF0703B5FE45FEE1FC26F9DEF8A1FB54FA2803AEFE
      7C07A701FA082A09E209DF10EC0A5813780B9512F50B6410CE07080F45FF160F
      87F9B60C25F8E505FFF90CFF00FD2DFA4700EFF59C0228F2F702FFF05801DFF1
      24FEDEF36FF832F48CF283F12AF671F4D6FFE5F82205B5F9850758FE45090605
      910AEC094D0CB80C950FC90D4E10790E500C100F4E095E0DCC095607A30AA601
      60090400D108FAFF2D0909008A08DB00DA06E601CC040F049700A1035FFA74FE
      B2FAA4FD53FFDBFE59FF96FDC6FC5D01E9FA32067CFA27066CFA5A03BDFBE9FF
      51FBA3FDF6F5D5FC2CF229FB53F221F564F46CEF0EF6BBEEC4F74BF0D5FAD5F2
      ADFD6DF76AFFF1FC8F004F01D8FFB901F5FCEEFCF3FF73FBFB06C3FC100B95FB
      3E0DCBFEDE0DDB03510F13052211FC038A13E902B213B202D80DB80376073E05
      9503EF034C00380269FCA3021FFACD017EFA2CFFC1FBFEFCC2FCC4FAE1FC25FA
      BEF94CF99BF3CFF468F3F6F342F926F7D5FC1AF95CFEB5FE78FFDC0404017F06
      7702AB05CD0488049A05AB053A00EC07EDF90B0997F79305CDF779FF9FF73BFB
      0AF897F8EDFA68F785FDC5F8C0FD9CFB3CFD79FE93F9C0FF55F399FDBEF31700
      1CFBB505690047071C02F80A45030E0FFD036D0FF8035F0E0405CE0DD8063A0D
      2505780CBD01C60A2A0153049801ACFCC100A3F84C0055F67E0154F32E021BF1
      8F01A5F056010AF23E0077F2E6FC9BEE16FE2FEE580595F1AE0930F3DF09EEF7
      010895FDC50423FF4702BBFD8D0289FB85033EFA1300FDF963FA79FA37F8CDF7
      97F800F56AF823F7F5F839FB8AFA51006AFC69061EFDB20A89FC250C7FF9000B
      A7F30305D6F3F60047FB34013001DBFE95036BFF8203A5011502A000110144FE
      5102B3FC8A05EBFC440522FE50013200B2FF72FF27FF2AFE16FD7AFF6CFC4D01
      78FEC90110012C015D014F008B0033FF98FE01FED0F93BFACAF8DAF9DCFE62FF
      49040504D106910A1108CC101B095512E50984111D0A2C10170AF40E3505270D
      74FCE70BBFF71907BEF80BFFBFFAB9F8ECFC58F4D6FF1DF2D301FAF1AA01CBF3
      A600F1F57EFD58F6C3F6D8F3FDF472F450FB04F9ED01C5FB10057701A8066108
      CD070D0C5A08A10DAB09600DFF0B910C4F0B9C0B1007900A32053F055F05ABFE
      4C049EFC840329FD6E0444FE3F051BFF9F032E00E5006601C9FB79016CF3C6FC
      49EF0DF9A5F2A2FA8BF6B6FB4DF8F4FE2DF9A40251F9A702F0F8720061F8C7FD
      E5F81DFCC5F64FFB19F004FB38EC49F741ED14F3AAEEF9F2E6F0E9F5DAF397FB
      51F60902F2F7490776F9D80931FAF20859F75403C1F6CBFE3DFC00FF9102D9FE
      B306FC0141082B0712096F09F6092F09130BCD07940DFD06C60EE806580ABD08
      DA040C081F02A104FAFD2302D9FA430169FB2A0078FE6EFD940040FB2C01ABF9
      84FFEAF82BF9CEF55FF6ABF455FB65F929023DFDF90663026E09AA07FB0A7009
      FF0B6A0A060C770BD50C490C570C230DA906E40D7001E109ACFFC602FDFC44FD
      96FBDDFAFAFCF8FBF2FEC8FE65FFBE02AEFE3506AAFC250808F6E50697F1F006
      F3F4750BC8F90D0F1EFC0B13E2FCA2155FFD4E1570FD5F145AFEC8118901810F
      95042A0E2803940CA2FF7F0696FE0AFE19FDC2F812FCD0F61BFD50F6B7FE88F5
      75FFC2F5E8FF97F6B4FFC5F79CFB9CF41BFA2AF1AEFF16F3880612F44E0A0BF7
      8809F9FAA506D2FB3F0432FB7802CFF9CB0236F92204C6F9DA00EBFA6BFB6BF8
      83F983F4A1F823F4F3F8F4F777FA78FE5EFC7B039CFD0F06E2FDC606C8FDFA04
      B4F9B7FE7FF6DBF845F9EBF78CFD9AF72B000EF9BC0002FC4A0051FCC2FFEEFA
      FAFFB2F9CD02EBF99E0701FC80087400D7045602CB021600F00091FE4FFF8EFE
      100034FFE4016FFEE1016DFC9A0061FA420089F9D0FBC8F79BF898F7C8FC37FE
      E00228058407210B86096D0F6D0A28107A0AB10F6C094B0DDB08C709EA07B007
      5503F706DBFCD50186FAB4F9E2FAA2F270FCE6EEFAFE96EE8801DEEE190311F1
      AE02C3F3A20154F699FC5FF6F1F7F9F5B6FA62FACBFF4EFF9F03B40390059107
      F30653091708DD092508160947097208A00BD708000D8A09610BA706690A0701
      960ADAFD5C0AA8FD2A0BCBFE290C61FF400CE2FF5A0B45009C09700026032AFC
      32FC51F727FC70F97EFFABFB1E0313FEC3038500EC011A0097FF46FEC8FB3CFB
      7CFAD9F931FCEDF99AFBAFFA4BF727F8A2F43AF3D2F4B4F1A1F6E1F443F916FB
      ABFB0400BBFD89023AFFC3027801ED01F1FFECFDA8FCBEF803FF0DF9DE0301FC
      B2074400DC094A05AB0ABB08DA0A98095D0ACE07140B5F069A0D1206130E2C08
      C808A207E1016E028AFC29FF77F8BCFD08F8DCFCDAFA6DFB5DFD4EF9CCFD79F7
      F6FC89F6FFF7A4F443F22FF370F342F869F838FF04FE5204EE0104089103090A
      7704650B31037B0A5C0258091A03D20886027A08B6FDAC04C6F714FDDDF341F7
      9AF2D0F5ADF473F874F74CFBC0FA9AFECEFC0F016AFD930253FA240212F56A00
      D5F50904C6F9620835FD5A0AA5FED90B58FF7F0C1301140CF701210A79037D09
      F605D4092807B1093904EE0567006CFEFBFEF4F814FF17F7510029F7B1013DF7
      4F0223F8F00183F98B0188FA2DFE92F7E7F943F205FCBCF2800163F57F0626F8
      16080AFBC80579FCD2035AFD5400BCFC13FEBEFDC4FF9BFF2501C4004AFED0FE
      1EF9AEF949F6BBF838F5C9FCC6F5CA021FF7C70766F8B10A03FABE0A0AFD1A09
      2CFDC4048AF9E6FD45F913FC96FA72FD75FC02FF48FEF900E7FE7702CCFFDE02
      78FF4E017700E001A5035D04DE063808D405540980009F0484FCC80037FADCFF
      BAF96F00E1FAC3009CFBD10003FC3C00ECFCC2FF14FB7CFE97F75CFC73F9F8FF
      32FE6C069E02340AF405EE0B0A078C0CAA07B60B8D067F081905D206C304F605
      E704860400036A00FCFD61F88EFA3EF2B2F992EF67FB48F0D7FE60F1420227F3
      1D054FF681062CF91604F4FA30FE72FA68FCFDFDCAFEAA03CA0151067804FD07
      94050909DE06540928061108D60427089B0559092608390ADE0887084006DC02
      B004D0FE7C0488FDFF049CFD610599FD7605D0FD6204A1FDB402C1FC3FFE3FFA
      95F6C9F5CAF452F65DF846FAE3FC30FD2D0007FF52FFAFFEEFFC25FDF8F85AFB
      5AF5DEFB5FF57FFD68F77EFE29F7CDFCDFF23AF877EF37F746EF52FAEDF031FF
      2AF3FD026BF5AE047BF7AB043EFA810348FBAD00CCF841FB61FA97FA20FF00FF
      DB02A702F506CD05F8081B08AC096F088C087506F6076605D809BC05370C0607
      F30CC006D80795027101BAFE5BFE4EFCB1FD8AFBD5FE66FA6200C2F872001FF7
      3000F7F588FE4BF530FAE6F346FA00F891FE5D002C032F06D607C109760A5F0B
      3A0CB10AEB0B9F08AB0A8607740A6407B00AE106040AB70300054BFD1DFF5CF9
      ECFC93F92AFDDCFC44FEBA004800DC03E6014706A6024A0765005A075FFAC804
      1FF79E05F3F7C60A05FAEF0D23FC4D0F6EFDC80E3700660DC301410BC901DD09
      C1026509BA03AD085304F80573011500B7FD05FC50FDD8FADBFEBBFB440044FD
      C10080FE2A0065FE86FF42FD93FDA9FACEF8A0F461F8B4F2D0FC32F6D9002BF9
      6A0466FBBE0513FC4305BDFB70024DFB78FFBFFB6DFFE9FC220156FD4E027DFB
      1DFF2FF7A6F95AF6EAF688F941F789FEFCF72E038FF9F40425FC8B04AAFF9D02
      6F01FFFEEFFD0FF860FBFDF453FB64F898FBCAFA07FE74FC010039FE010122FF
      570078FF8CFFD10031019502C3038904C206B404E3054200EA00C6FCA1FDD2FB
      0DFDDAFCFAFC23FECFFDBCFEB0FE20FFF4FE51FF43FE3D0030FBDCFE21FBD000
      CFFEEA073502510CB605A80D0C078B0C6107C30972069207720422065804A704
      F004C802AB0585FECE0261F789FC10F24EF8FEEF2CF8D7F017FAFBF22FFDFAF5
      210179F9DF0491FCAE05A2FFD0001FFE07FD82FDE7FC7102DBFD3E055400B405
      0D029E05F303DD058F04F1065B033A082D04F7096506250B6909DD09F20AE704
      47099300300818FFFD086EFF11097300A3082C018B078500A50647FFEE0422FE
      A0FF26F96AFDCFF6ECFF3AFB450199FE95026FFF83021AFE150003FC87FC53FB
      C5F8B0FCEBF755FF93F94E01F1FBD2006EFBA5FC28F783F9E9F3C2F9E1F4BCFB
      09F75AFDEEF821FE20FB3DFEB0FD5FFDA9FF1AFCC4FD00F8B4FD98F6BA00CEFC
      93022A02F6055904B5089605B60980056009B1043F08D003B1089803DD09FB03
      A10B0B04AA0B54005107FBFB3902E3F92100E0F8C7FE5FF841FECDF7E8FD82F7
      1BFD24F711FC80F827F893F824F77CFAB7FA370373FDD609CA00480BE702240A
      9F036407BD032D050102DE032B018F03E100F8025A0171002B00CAFB6EFB7FF8
      2BF770F862F6A2FA28F868FD96FAECFFE6FC390277FF3203AC005C044DFC2B02
      36F8050051F8DE048EF884080FFBB9071CFEFE05460088049701CF031F016E03
      1E01BE034801DE03D20293024504F3FE1E03A6FB7B0124FB4E0243FCD703C2FC
      4F0466FC020466FB6A0316F99B0218F736FE94F2C5FB68EF9CFE3BF47E00D2F9
      CD0274FC7A0586FDA80510FEBE0334FFD2002A0016FFE30047FF7300120199FE
      3001F1FA77FDE9F834F86EFB45F630000FF7AA0377F8370534FB7605FBFD3A03
      67001C0084FE8FFA7AFB35F661FB18FAF3F924FFD3FA8D003EFEA001D4001B03
      8F02B6038F02CB03D102BF04A7039D050F053E053206AF01200423FE18FFA0FD
      1FFCCDFE35FBCD007FFB2F022BFDB70202FEFC011BFFD10101FD3A0082FBC6FE
      96FE5D043B00140A3302370A2D04350872044006590408059403F303A2031A03
      FD034D012A04DEFD5F0382F8B5FF26F4EDF900F34BF715F4E2F800F7E2FB4AFA
      CCFF25FEEF03B9004E071E02BB0430001300A8FC4BFFB6FF04FE9D037DFED003
      7300BF030402B3042E03B4063D02AD083B02CB0A84020D0CD403110B7306B606
      5D077F01CB05D0FEC70480FE3205F8FE9B04ABFEA4031EFE8C02B2FCD8013BFB
      56FEF1F7FAFA01F402FC51F7F0FB41FCA9FBD3FC11FC1CFCE6FA83FBBBF80CFD
      58F69EFF9CF53902A8F6B80324F9E9028FFA49FFCCF80EFC1CF43CFCD0F0F3FD
      8BF1840033F35D028AF5B1031EF87E039BFA4302CFFA3EFF90FAB8FBC8FD70FF
      D8FFA2048E016F057004A805B4053A06CD0546069E0437059603B1049B032405
      DF04D30469072F01F5088AFCED05E0F97401A0F8A4FF8BF854FE56F8DDFD65F8
      B4FD83F859FE55FA39FD21FC81FB38FDBCFEBC032D012D0AD102890AF6057808
      740707064F08BE041308E904530770050307B5055F06FB047305B6011B04FCFE
      370053FF6BFCE900A3FC1703CFFD7C0414FFDD058400D206E0013B075BFFA105
      DAF901038AF8B406C2F7490B66F8CD0AB6FB16098AFD970716FF8306E5FEBC05
      D6FDD50527FD0F0692FD9505AFFFA602250242FF56023BFEB30008FE020144FE
      460190FDB600F5FBC1FF6AF94FFFF4F74CFDE9F55AFA82F240FCAEF5F1FD3BFB
      33FF5CFC0C0318FC6C05E7FB310656FCE90431FDDA02D7FDB10124FEA10194FD
      E60183FADC005CF83FFD30FAC4F841FD66F8400056FA630157FCFD007DFEE1FE
      C50011FC54003AF8C2FCDAF365FCBEF604FCA8FC1CFBD1FEDDFDF6FF5500BC00
      C801E80025025B00DA0113002F029F001F035E019C049DFF5A06E7FC57051AFD
      870014FFB4FD7B0141FDB10286FDF8021EFEEA0127FF320165FE260084FB24FE
      20FD180264FF7E07F3FF900787022406E7034B04A304D8026D05C60172052300
      6B0574FEF90422FCB603F7F7DA0147F452FE1CF4A1F9C2F5A8F8F1F822FB04FC
      B0FEA2FE54029100E1053A013F06B6FFBA01D3FB7EFF42FD24FE7A014AFC4802
      45FEBD0243008F038401A804A402D90544034507EF038C08F9044E080F07EA04
      AE098200E00AA2FEB30840FE1C07AAFEFD06CBFE570602FE980593FB2C069FF9
      3F06ACF79103F6F3E603A5F5A8045BFAAC02A1FB4F02C3FB5A011BFCF0FF07FE
      4EFECC0077FC0E03FBFB440479FC40039CFD1DFF45FE42FAF9FC8DF8D6F873F9
      70F6EFFB90F7D1FD7AF9FBFE18FB42FF58FDEAFEF2FE37FE86FDECFBADFE0EFE
      4401B2027E01BF03B0031E04D705A3045006BC042406C4030E05FB0236040603
      5004B9029F05E5FFD8073EFB8408C7F8A9040EF8AAFF10F9B8FCF4F92AFB8AFA
      96FA4AFBABFBE4FCACFC03FF02FB5CFF07FC070392FEDB0771FE0F08C0FF2906
      F1005C044601F7037101260411017D04E7001505250035048BFFC100040034FD
      BCFFADFC97FC8BFDEDF945FFC5F9B900D0FADF01ADFBBC0216FDCE0270FD6002
      DBF9F5FF2AF88600D1F885038FF879030BFB8C0221FED601A8FFC8013D003D02
      62FFB703D5FE1D06E3FE4C071D00BF0515035D0204061E00710570FE7E0370FD
      56031BFC0F03E3F9F701D1F78A01FEF604014DF7F8FDEBF508FDA1F726FE98FC
      ADFD2CFF03FFEEFFB700B4FFDF01D5FF9902C8FFA901D6FF68005E009BFFA9FF
      45FF7AFD38FF31FBCFFEC4FBFAFBB6FE2FF901025EF9A903B5FA6A03BCFB1302
      5DFD6B0053FEB0FEB2FB12FC70FA49FD9DFB3202E9FABD04F3FB24052EFEAF04
      74FF34048D00FC029A00F7017800080360002E0491005F03B301D4000703E7FF
      2201F100FFFC410336FBCF041CFB6B0460FB2C031BFDFF0155FE800107FC0800
      02FBC800E0FCCA03E3FC420421FE7A027D009000F0018DFF6D0343FED90334FD
      0504D8FC8103B2FB110221F9C200E2F61900D9F7F8FD8EFA54FBA2FDC5FB6BFF
      3CFEC0FFF100FCFF6E04AEFF3507C6FE990541FC5C036FFC9202440015000803
      ADFF9404F1008D055801EB064C02340846026309D6016A0AE10170095D020506
      4C04A5011C07D8FE6C0741FDF80439FD7403E6FCEB02BDFA170288F8B90214F7
      D103F1F65D017BF518FFD0F533FFDCF928FDA8FCC5FBDBFDB0FBDEFE51FB1B01
      F1FB1703DAFB1C043DFB9204A7FA4B031EFADEFF04FAB2FB14FAA1FA23F86AFC
      73F499FFEFF2CD011CF4190277F5B2011AF8FD00B7FB9300C6FBD1FE4CFC9EFE
      B0FFB4019300EB034E017204E00242044D033D0484035C030303C101AD02A201
      CF026E0168033BFF1F058FFB9F072BF90E08C8F8E10418FAE50097FBB1FE2DFC
      B8FD0FFD78FE02FE880039FF94FFFAFEF3FE64FF87016E025102B503FA021403
      AD04AB0247050403F0058A032406580411069B0556059D050F0474033E035200
      4A0380FF1A0329001C015301A4FFA202BEFFB3023B00E7021901DB02DD017402
      89FF0C01E7FCC30032FDAE033AFCB005F3FBAC0584FD230563FED104EAFE8204
      36FE0B0567FDE60638FDF507CFFD9206E7FF46030B03B700A8043FFF1B03CDFE
      C1000EFE9BFF1DFCE1FE91FABCFE0BFA99FF07FB37FE54FA45FC44F97CFDA9FB
      15FEBEFD37FE0CFEDEFFD1FD3B01A8FDA002BEFDCA02C7FD9D01F6FD17008BFD
      6FFE77FBCEFD81F867FE5DF8ACFECAFA56FDB9FDC0FB4FFFE2FBEAFEE9FC35FE
      53FE31FD310003FD10FF79FC03FDD2FCF0FDE8FFECFDCB019EFD6F0134FF7C00
      A600D6FFE40100FF0E02C1FE02023A00E101FE0140015802B901F800FF029E00
      6203E101BF01BE0379FEAD0409FC8C03CFFBF501EFFCCD0022FF2901A6FECF00
      C5FC3000E5FDE90132FEC00259FEBD018900AB009A02D7FF2D04D8FE630430FE
      020410FE310345FD3D0135FB75FF46F9E6FE61FAE3FEE8FC0EFECCFEEBFCD1FF
      0EFD98FF5CFEAFFF4A0053FFCD02F1FECC0215FE2E0149FD1B01B6FFB3FF7D02
      49FE7703AEFECC0379FF33043D010105DC01380628025907AF02B30779027906
      25034D0307059C00E00655FFB606B0FEAB04AAFD3003BFFB5F03DEF92804A5F8
      BE05F4F85105DBF84F0356F88603C4FA8402FDFD8900E4FFF5FF220179FF8C01
      3FFFD501C2FE51021FFEB5025BFD010232FC50FFC3FBEFFB7FFCB7FAE2FCE0FB
      A3FBF2FD57F95EFFBBF760FFDBF700FFC1F930FEE3FC02FEB4FD89FD38FDBAFC
      4BFF85FED400BB001C012F0199022501C80311015004540017046BFFF70370FF
      66049DFFC40365FE590304FC6B047AFAB20550FA620562FB99022AFD24FF5FFE
      CCFDFFFE74FE53FF78003F008C00FD00A0FE000108FF40023DFFB903CCFEED03
      E4FFD203D900D5039E01D003B301A20324018303B100E702C2FF0501CDFE79FE
      1FFFAAFD21009DFE0400A4FF0BFE4000C2FBC8FF37FBA3FFBEFB22FF66FDAAFE
      96FDC2FE3BFC2DFE3BFD25FF2FFDC000FEFB5701E7FCB60113FE3D0223FF7403
      51FF2E05BBFE8F06A0FECD064AFE4A05F0FE2002580168FF1604D3FD8C0505FD
      A50431FCCA029AFAD501B5F9B101AAF9A702BEFA1702B7FB4AFF3DFBF0FE30FC
      CDFE0DFE51FD9DFEBBFDBFFEC8FEE8FEFAFF07FFD500D1FE5C01BDFE18014CFE
      46FF95FC1EFEBBFA78FEA9FA9DFF7CFCDEFFC0FE56FE830002FCCA0031FB5B00
      FFFBC3FFA1FDE2FF17FEB000A4FC9F002DFD5001ECFD830203FD70024CFD9F01
      23FE2B01F7FEFB00C1FFAE008B00A201570117033E015C03270113028A011101
      3802E6018A0274030A01BF044AFE7504CBFCA40319FDDF02B8FEEC0133FF3F01
      49FDA2FFE2FC61FE17FD7DFE9EFC26FE63FE83FDF10064FD9E0286FD0B03E2FD
      BF0256FE4A02BCFEA800A9FE07FF11FE82FE4DFE07FF4AFFF0FF99FFE2FF92FF
      FEFE23FFFDFEEDFE3200CFFE8A0288FEDF0320FF9C024EFF910247006B028D02
      DEFFFC03A8FEB10422FF59051700F6058B004106C600A4062901DA06D100D905
      FD002003600278005C04DCFEA20574FD570554FCCB03B5FACE027AF9C90212F9
      9A036BF9C60371FA9F0168FA660067FB84FF47FE47FD30009AFC44014FFD4C02
      B6FD000351FD3E03DAFC17033BFC520277FAB0004EF9E9FE78F948FE3BFA42FF
      E7FA930055FA960122F8DA0170F685013AF70301DBF99D0015FC4E0143FC8F01
      41FD7801CDFE0D0276FEC701D6FEEC0015007E00F0002E004E0136FFDB01E3FE
      8B0225FF0E02B5FE5A01AFFD7201BAFC73025AFD7203ADFE7603A8FFC10181FF
      A0FF0CFF4EFFCCFEC80074FEFC0130FFFC0054FFCD004AFFB501AE003501F201
      A701F7024A036804800467057A04C105A903D6053F035B0528021604C5003902
      63004801F900A50100026F0190020E01A301AD0003002D007CFF98FF8E00DCFE
      6801DDFFF3FFF400E8FE8001A7FEFF024CFCD003EEFA4E04A8FB9A05ABFC7206
      7FFD4B06E3FD320664FED90525FEA504DBFD8B02AAFE3A002600DEFECA01EAFD
      A00234FDBE0137FC300097FBC1FF8DFBD400A3FB7601D4FCBBFFD2FCE0FE27FC
      21FF12FDF3FDAEFDAEFD06FEB0FEA8FE98FF64FE070079FD690094FCD9008BFB
      0400ABFA29FFFCF99AFF16FA9F0063FB7B01FCFC6801A4FEDDFF8BFFB2FD0000
      06FD0D00ADFE67FF2100BCFF55FF9BFFDDFE65FE5EFF32FE43FECCFD84FD16FD
      C1FEA8FD620082FE6101CBFEBA01CCFF0A024E01CF011B0228014302C5001E02
      2201AD02D2015403E6015C03FD008D0227FFB10106FEEC0034FFC9FFAD00C4FF
      C4FFDCFED9FE11FD38FFE6FCABFE0BFDB5FE3CFD870051FE120207FF5E02EDFE
      D00145FF0501C0FFCCFFA2FF96FE17FF51FEDCFE13FF57FF3D0044FFFE00FDFE
      8B00DCFE20FFCCFE8BFEC4FEFCFF92FEAE01B8FF410167000E01EBFFFF019300
      97006F018FFEF901EDFE15032300EF031E01E703AF010F04E3011304A3013403
      3C01BA019101D1FF79023CFED003EBFC4D05BDFBD00588FAD104B4F9C103C5F9
      54043DFA420532FC41048AFD3C035FFD96032FFE6C02ECFE1A0155FF72012E00
      C901D6004B01E8001F00EC0077FFB70090FE04004EFD5AFFE3FCCCFE50FDC3FE
      1FFEFBFE65FE60FF4AFD3DFF44FB98FE01FA09FE00FB87FD2CFD86FE95FD64FF
      DBFDD4FE86FFE9FEBBFF0CFF61FFADFE9F0027FF8602B7FFB80327FFBB03CBFE
      6D031BFF9A02F8FE6801A5FE7A00A9FE140049FFAB00CEFFA501DDFF2A029EFF
      68016BFFE4FF99FFF2FF6BFFF10023000100AC00DDFE0F0064FF8B0009FF9001
      96FE870213000504D90106055102CF046E015C04AA001604A8FF5F037BFE4902
      FDFD730116FE01010BFF3500DDFF4EFFAFFF75FE1CFEAFFD76FC42FD0EFD0AFD
      0CFF4DFE11FF82FF07FE53FF5BFEE6FF72FD430171FBD40276FB730416FD3505
      85FED40429FF530460FF090420FF4103B5FEFC01B5FE970093FF73FF66017AFE
      2C03A1FDEC03D2FC32033DFCAA0163FC8801C8FC6702DDFD77014AFECDFF3BFD
      6FFF17FD5AFEABFDBCFC4DFEFBFC20FF27FE87FF18FFABFE5EFF62FDACFFECFC
      2C00B3FC0F00D3FCD5FF14FDF5FFC7FD6800E0FE81002E00BDFF7701ECFDE401
      FBFBFE0131FCF00159FECA02F3FE400337FE1B0286FE3C018AFDD20078FB9E00
      90FB250150FD3102E3FE53027CFF2F020000DF0262002B031C00F302A2FFB702
      8AFF30032600EA03A000FD038E00640395FF430295FD9101B1FC7E00D9FD6EFF
      BEFD32FEC2FCE0FBBBFD7AFA3CFE5EFABDFD35FBB8FEB7FC9F003EFEE80118FF
      A101ADFFBE007200E2FF6D00ECFEEEFF92FE6EFFCDFE65FFD3FF1EFFEC0083FE
      7B016CFE270137FE0D0059FE3600D3FEF7012F008C027201E00128018D021F01
      5602CF015D00C902ACFFD7036C00A60488018A04C901FD038901D40343013203
      E800BA01E000F7FF3F01B3FEB20262FD6204E7FB6505A5FA0405A4F9EF02C0F9
      7801C7FAF1010EFDB601CEFE55005CFE750035FE3700FFFE96FE140019FE4001
      A1FE450205FF71024CFEF20135FDDA01BFFCA20159FC3001CFFB9F00CDFB6000
      A5FC660014FD8200C8FC7F00E9FBFDFF1BFAE9FF1FF90100B4FAAF0002FC3401
      EFFB4E001BFD3FFFCBFD91FEE8FC52FE84FD78FE05001DFF8C0228FF5F03CFFE
      EE028AFF4202390044017D006C00BB00F5FFFC007500B2008C01DCFF9602F6FE
      25031FFE3D021FFEEA003BFE7901CBFEEB0150FFD70092FE4B014AFEBB0163FF
      DE00480151012103030392045704C2043E04310448032204FC01B4039C008A02
      A8FF5D015AFF0001140059004501FCFE6E021DFEDF0244FDF50102FD2C016DFD
      3E02D9FEBE02A1002401F2002400840111FF3003B8FCEE0462FBE9053EFC5706
      56FED305ACFF7D04C9FFB2038DFFE002FBFEB1013CFEAB0025FE2D005AFF7DFF
      040195FE5302CFFDE5022AFDD9015CFD4000ECFD7D0010FF0401DAFFBFFF85FE
      45FF3AFD1AFF3DFD75FDA9FDB8FC16FE60FDF5FD7BFEF4FCEDFE98FBD1FE43FB
      70FF94FB3B00BFFB5B0043FC3D0046FDA1005FFEC10087FFA1003B004400D8FF
      E1FE97FF92FDA4FF80FE3B00F1FFC20083FF95FF86FF45FE4FFF0BFE86FD5BFE
      E1FC0CFF39FE82007B008801F001AE013A026C024502F802B801A002FA009102
      B2002B03D6003803320188027D018A0185018800A300380008FFACFFF2FE53FF
      A2FFDBFEFDFEE8FC44FF61FBFAFFB3FB2FFF05FDB8FE7EFE36FF4F005A008401
      DB00C6011900280265FF4202E8FE88018CFEB200A2FE7A0050FFFCFFF9FF31FF
      6C0007FFC300F1FE32004BFF36FFF9FFF1FFE8002B01C701C10000019C004500
      A700D900B6FFF201ECFECF02F0FE6D034F0065036B018E0234012B02F2007E01
      8B003300F5FF25FF1A009FFE8A01E1FD5103EBFCC00446FC8705FDFBA504E2FC
      9C0255FE12020D0099020D01E601CAFFED0159FE780254FE8301DFFEAD006DFF
      A40022002D01A4005501A4004900120152FFB801AFFE7E0100FE0D0182FDDC00
      CFFD090009FEF4FE0EFE16FE42FE38FD31FD2BFD85FB79FD80FB15FEB5FCD3FE
      06FDE5FDCCFD8CFCF3FE6FFCA5FEC7FCCAFE47FD31005AFE7D0230FF19041FFF
      9D039FFF6002AF00EC00070186FF4701FDFEA00182FF3D016E0051006C0186FF
      8602F7FEB9022FFF8801DDFFCA00BD0022015A01950076004A0088FFD9001700
      4B006701EEFF7C024F006E0382010E04A102C603E90180038B002B033BFFD801
      F0FDAA0036FD2D0087FD33FF36FECAFDFBFED3FCF8FF37FC370038FC81FF25FD
      84FFBBFE6C005400E4FFBA0024FFDE00E5FED801B3FDEC02E0FCA403CEFC1D04
      0CFE1E04FAFF370360006D02250001029AFF4301B0FE89007DFE5C007EFFF6FF
      D700E4FE24021CFE6F038DFD9F0384FD780212FEB801EFFE06026DFF29014FFE
      2E00FCFCDBFFE1FC60FE8AFD4CFDD4FD33FDACFD32FE45FD8DFF8AFCC5FF8FFC
      110054FD7100E1FD8B0055FE58008DFF2800AF0001001401A2FF4101B1FFF900
      74FFDE0074FE290141FECB0151FF26026DFF3701F9FE1B00BBFEDEFF7AFD5300
      8BFCE30093FCA501F0FD8B02E3FFB8027A00B5028F00D6026900820201004E02
      E2FFBC024E00BE02CD00DC010001210148017F001801E6FFECFFA0FFD5FE3FFF
      FBFE37FE24FF26FC36FF8FFAE3FFB3FAB6FF42FC22FF0BFEFAFE8FFFCEFFD200
      25014F01FB00A1012F00F0015FFFAC018DFE050161FEB900F7FE5100B6FF6BFF
      670018FF63013AFFDA0173FF680114004C01F70031023B0163028D00E601E4FF
      D3012C001201390110000B026FFF7F0288FFC5029C0073020401B201E500E800
      9C00D5FFE2FFC7FEF0FF5FFE1301F9FD5202FEFC34038BFCDA0301FD8D03F6FD
      090283FFB100FD007D008D016000AF004F0070FFEB0027FFA90095FFC7FF2400
      F7FEC600E8FE7701D9FFC401B9FF0B0203FF7B0255FE84028CFD25022CFDEB01
      0DFD7101EEFC5C00C6FCBAFFDAFC7EFFA4FC54FFC2FB9EFF0BFB360071FB4C00
      EDFB45FF15FCE4FDCEFC35FD3FFD77FDC6FDF6FDABFEA2FE3700CCFF5B02D000
      BB027A010D0203020C010F02A0FFDF01FFFEE6015AFF690104003200A10048FF
      9301E3FE2F02E5FE0F0298FFC2017900E301B200D901FFFF78013AFFC1015CFF
      E5015B00B6014D018E0111020D021A035F03D403380305041402DC03BE005903
      0AFF620241FE55017CFE2D000FFFADFEBCFFDAFD1D0190FD530253FD5B02EFFD
      0D026CFFFD010E016D011A0252009002A0FF33038CFE320477FDCB04EDFCC704
      12FD750486FE950350FF85023DFFCE01F9FE420120FEB500D0FD76008CFE0600
      77FFEAFE400025FE4A01CBFDEA01BDFD740182FEB90058FF880084FF1F00B0FE
      6EFF4BFD43FFB7FCAEFECEFCBAFDB5FCF8FC5BFCF8FC28FC86FE13FCA0FF50FC
      FCFF5AFD5F0073FE43005FFF4E003300A6008700D4004000B900F8FFDA00C3FF
      070157FF8D0070FF2300B0FF59008DFF4D001BFFE9FF3FFED9FFE0FD61FF8CFE
      A2FE62FF41FE0B00BBFEF200A6008E01E8019501200294010802710116017701
      4800DE014B00AA018A00D1009D0017000F017AFF7601EFFE2B0129FFEB0049FF
      38015FFE230111FDAB00E1FBBA0005FC6200AAFD8FFF58FFD3FE820095FE9B01
      8EFF53020B007302AFFF7A0252FF1E0278FE6701E8FDC90042FE320008FFAAFF
      ADFFB6FF880004003C01F5FF0B015A00EC00C2006601A20079015800EC00A7FF
      C30084FF4A0059007EFF030125FF1C011EFF34013A00050118015900FF00ACFF
      EF00FEFE6A0060FE470021FE200117FE2C02FBFDDF024BFE6B03C9FEBD0333FF
      3803450082021A0148020501DA01710051012BFFA70139FEF3014EFE9D01B4FE
      51012EFF0C012400B30125011C02A20194011B021D012C0218009B014AFFD300
      28FFB6FF07FF5BFEB5FE88FD73FE1BFD59FED3FCCAFD6CFD5BFDF3FDA1FDF8FD
      ACFDCFFD8DFD14FD35FEAEFCF6FE1BFD49FFDCFDAEFF9DFE4800E5FFA1015C01
      6C020B020502640266015602F6FF0802EEFEBD012EFF2001EBFF2900680079FF
      AF0070FF11019CFF1D018E0035015B01C7013701AE01D800D900F7FFE00064FF
      F400EAFF9500D3005500590117000B02C700DB0231011203AB002A031700CB02
      B8FED1015CFDA10011FD5EFF81FD56FE4FFECFFD81FFC3FDCE00CEFD4601ADFE
      5701F6FF9401ED003A01AE0156009501F6FF8F0175FF400271FE0403DEFD0C03
      B8FDB7026BFE89022EFFFA0180FF6E01BBFF290116FF0C017BFEC700D8FE3A00
      C7FF50FF98008CFE50013EFEF701E0FDFE0149FECE01EFFECB01DFFE3701BCFE
      2100FEFDC5FF22FD70FF08FD7BFE3BFDD7FD38FDAFFD25FDABFE5FFDD5FFCCFD
      2C00E9FE6D004C00ECFF4B0136FFD50153FFEA01A5FFC2019AFF8701A9FF5701
      F5FFE400F0FFDD00C6FFFE00E1FF0201ACFF3D01FFFEF600E3FECC00B5FE4601
      E3FDF90158FD310240FD480221FED4022CFFE9026EFF9202C1FF250265FFB401
      A9FE7901ECFE6B018BFF0001E8FF52000000E6FFFAFF57FFCCFF4AFFC7FF2EFF
      670063FE7A00B1FDAFFFC4FCA9FF3EFCCEFF05FD53FF7BFE14FF8AFFFFFE3600
      7EFFF1000B006301E2FF9B01BDFF8301F6FE060101FE59002FFEC9FFEFFEA7FF
      A8FFEBFF690049002E0106009801D4FFE101F6FFAB02EEFFF202FFFF3802A9FF
      DA018CFF5F01450039003A0187FF730157FF0C01D7FF02019200D20025014C00
      F201A2FFE901E9FE4C0161FE470136FEAE013DFEE4019EFECE0165FFA401C9FF
      48017D00EA003C0122013E012B010D0171001F00540012FF9B00F9FE56007EFF
      1E004000DCFFED00E8FFB30132003B021B006E021B00940289FF570278FEA701
      F3FDB600ECFDBDFFB1FDEFFE58FD9CFE54FD5BFE2AFD76FEEFFCD1FE0AFDA8FE
      07FD74FE94FCE2FDF1FC6EFDE2FDD2FD3AFEC8FEC1FE9DFF7AFF2F0069005B01
      59013502A5016002BD0149020001C901A8FF43013EFFB700ACFF0900230081FF
      7D0073FFD2007BFF0001F8FF4301A90020027C00E00206008D0247FF7D0294FE
      FF02CEFEB202ACFF580268001302D600D2019401DB01540297019A0258017302
      6400C701F4FEBD0085FEB6FF05FFDBFECAFF65FE7A008CFE3001A2FEC301F9FE
      0E022A0064024F0162025D025F01D5029300C8025A002A038FFFAA03D5FE8903
      40FED902FFFD81027BFE30020EFFA601C1FF5C01ABFF1F01E6FEA900C1FE1000
      4BFF5CFFFEFFF4FE530018FF5D00DDFE4E00E0FE3C005BFF820044FFC6001DFF
      0B0079FE5FFF4DFD3DFFACFC7CFE87FCFAFD7CFC12FE69FC7EFEFEFC4BFF0BFE
      010019FFA60045009500FC00E1FF260199FF1D01F0FFB40048002F004F001A00
      5B00A2FF5B0048FF400077FF7D0036FFBE003BFF1E007CFF8FFF99FFC6FFF0FF
      8BFF7C0057FFE300ABFF13012E00C901E60042026401F901CC01A20196011901
      B600BC004F008A008B00FFFFE50081FF0B0169FF3C0114FF9401D9FEE40124FF
      4D02E1FE9E028FFEE0014DFEC300FCFD4F006EFE72FFC4FFA6FE06016CFE7301
      6FFEE301DAFE470214FF54023BFF4002E3FEC30118FE1801DFFDB60056FE9A00
      1BFFA900B7FFE5003F009700B4002B00050165007B013600EF01F7FF6A01F5FF
      8B00C0FF4A000100BAFF93001CFFAB00D7FE3B00BEFE0A0059FF04006800C8FF
      9401A9FFFE0187FF800144FF2E0106FF5201D3FEAE01FEFECC01E1FFBD016E00
      AF01CA0087018D01AE017E01FA01240165019A009A0061FFC30098FEC900ABFE
      B00059FFE1000B000401C50062016E01CF01B5015B02ED014702AC013301EB00
      E4FF1B00F5FEECFE85FEB6FD16FE44FDC7FDDAFC9CFDCBFC5BFD7CFD89FD7BFD
      52FE50FD87FE6CFD4FFE7FFDD0FEF3FD18FFC9FE20FFA9FF70FF5B00AFFF8801
      1800A6028900CE02EA009802D40008020C00450153FFBF003DFF2E00B9FFDAFF
      170031004A007F007800D6009F00840138014E011702AF004C025900F601CDFF
      060286FFC001E1FF10015C00BD006B006800BC005800440163006A0169004E01
      FAFFD000EEFE210052FE9EFF5EFE71FFF4FE63FF92FF6DFF190048FF9A003FFF
      EA00040055019300EA01FB00A20197019700DF012E000B02C0FF690207FF9102
      96FE2B0239FEED0169FEE10129FF9D01FFFF45016300EF001F006700E8FFBDFF
      3E0018FFE50087FE360182FE190171FEE90046FEA600AEFED6008FFE660150FE
      1A0151FE1A00A5FDC2FF01FDAFFFD7FC5FFFFEFC47FF45FD36FFECFD68FF11FF
      D1FF2F00560037016C000302C1FF680214FF6702C8FEEE0153FF2B01FAFFBE00
      28007E0028005000FAFF950014006700900040005600B2006EFF020136FF3201
      28FF8201CEFEEF01B9FE1B02AEFE8302BFFEDA02F2FE47024BFF79016AFFDB00
      2FFF5800FBFE0B0003FFB6FF83FF51FF08004EFF7F0060FFF0007BFF2501D6FF
      7B0176FFEB01A6FEB6012DFEE900BFFD6000A9FDFCFF5BFE64FF70FF09FF1C00
      EFFEAD0003FF5B0143FFAA01A0FFA501B8FF840142FF4801CBFEFD00BCFEDE00
      5CFFAE004B004C001601FDFFC901BCFF1D02B8FF6D0272FFEE02FBFED00236FF
      DB0196FF2B01D6FFC300400000009B0057FF9400EDFE7D0047FF7E007B006000
      BD014A0059023900180200005A019EFFB2005AFF730070FF5000FBFF2F00BC00
      230067012800FE019A0008025501DA015E01BD01B300E0005B00F5FF5A00BFFF
      32001100280089003C00FF006A00A001C9000402470114028C010302EB009D01
      BBFFDC008DFEECFFEBFDD4FEE2FDF6FDB8FDA1FD53FDB6FDE4FC16FEFAFC1FFE
      D7FD20FE4DFEB5FE09FE28FF1CFE4BFF78FEA2FF93FE1700BFFE7F000BFF5A01
      92FF4C023B005D02C60001020A019C01B00029010100A70088FF0400AAFFAAFF
      1100B4FF57000A008F007100CD00A30080014B00A002A9FF570374FF7D033DFF
      600304FFD40220FF0E0278FF5801C4FFC20028007600C700580019017A003901
      9A0033016600FA00FCFFC6009DFFBE00ACFF9E00F6FF1E002200EEFF29002100
      08009E0052003B013301A5019D0164025001F80204011E03C70054033C005E03
      63FFFF0275FEA70206FE68025BFEE6010DFF64019BFFDD00A5FF620055FFDFFF
      25FF44FF50FFC4FE82FF53FE87FF45FE72FF7BFE31FF9AFE53FF5EFE0E00FCFD
      5300FAFDE7FF8DFD84FFDBFC6BFFCAFC33FF21FDE0FE61FDB3FEDCFDBFFED2FE
      11FFA0FF9CFF6C003A0035015C00AC01ECFFD10157FF570148FF6E00DBFFA8FF
      7A0072FFB90079FF9B0055FFAB00FEFE2501A1FE4401DEFEDF0027FFC40025FF
      EB0088FFF5002800CF00A400810050014F00DC0167006B018F00B700B4002100
      A8009BFF4C0066FF0C0018FF4300BFFEEC00A9FE920138FFF301DAFF08020300
      1202DCFF58026DFF230255FF790167FFEA005AFF3000B6FF82FF53000CFFA800
      B0FE32019CFEE401B6FEF801EDFEE40125FFE10111FFB901A6FE9A0155FE6001
      9BFEEB004BFF3F00F8FFF1FF7E00F3FFAD00AFFFB7003DFF4301A6FE9D01C8FE
      2F0144FFB2004DFF580086FFF3FFC6FF66FFBBFFE7FED3FF00FF4900D5FF7000
      0C016800FD0156003302FFFFC701BFFF150185FFC3005BFFD70079FFE5002300
      E800E400D6003901E4005C019101300108020C01B1018400570172FFF800EDFE
      C10018FFEC0057FF3401D3FFA501A7003402FB00B0021C01F8022401AE029F00
      A5011500340033FFFCFEDAFD81FEC9FC76FE98FC51FEDEFC1AFEFAFC37FE3BFD
      FEFEAAFDA3FF74FE93FF47FF7AFF9DFF5FFF160016FFD400D9FE5A01A8FE0302
      D3FEDC025EFFCC02FCFF2F028B00CB01AB0061013B002C0193FFD5004BFF5800
      8FFF3C00D4FFB50018003701620014019800D40057016F00170230002F022300
      3B02A7FFF8016AFF5201A1FF9F009CFFD3FFAFFF6BFF310066FF580085FF6500
      E4FFCC0024003A01FBFFB50198FFD50166FF79018BFFC600B3FF5300CBFF4A00
      E5FF340000006400C70090009D01F6009D01A2017E01FA0146014B02D8007502
      350027023BFFC701A9FEB801C6FE570177FFA9005F002400C700A8FFB70075FF
      4C003DFFF5FFB0FEFCFF1FFEF1FF12FEBBFF59FE66FF42FE31FF2DFEBDFF2DFE
      800050FEA90063FECF000BFED6000DFE8B0071FE2A00BFFE8FFF2FFF29FF1900
      0FFFE50022FF880176FF4502C1FF9C02AEFFC3024BFF590218FF690155FFC300
      C5FF9C000B00BE00F6FFA400B0FF7400E5FF51004A006B002000B900FDFFCA00
      01000C01D6FF9C018CFFDC01F7FEEC01A2FE3E02A3FE0D0292FE2301A6FE4E00
      C3FEB2FFB2FEBFFF9EFEEDFFF2FECAFFBCFFEFFF73005B00E800B20028016200
      FD00E0FF110168FF67011BFF200123FFE300F9FEB1000AFF030062FF5CFFA0FF
      B2FE0C005CFEDE008DFE3C01B8FE200116FF1F015FFF020166FF0C0165FFD000
      91FF2A00280090FFC30020FF2C0103FF5001AEFE180157FE43012AFEB50148FE
      7701D4FE37013EFF1301B4FFAD002B0050004500C2FF5B009FFFDE0012003501
      B80019019B01EA0003029F00A9018E00E7006D0030000B00F7FFEAFFEDFF2000
      010099002000FC0003006B015B00C701FD000202FD00FA01E3003601D7008300
      8A00430057002A00270043004000C600B90038010F013B015A0137017401E900
      EF009A00D2FFFCFFC4FEC4FE3FFEC8FD0EFE68FD2DFE92FD4FFED8FD4BFE2DFE
      C7FE7CFE7FFFF6FE8AFF97FF63FFD5FF74FF1C0052FFAA0027FFFB00EBFE3B01
      E8FEE90166FF3102E7FFBD016C004E01C300E8008D00D500FEFFC500B1FF2D00
      DAFFCBFF3000CFFF9F00EAFF1B01AFFF62015FFFE1012CFFC6021FFF180347FF
      1D0315FF2E03FDFE98023AFF9B0144FF9D0040FFF6FFC9FFF1FF4C000F006B00
      8500C600230122012F019A01DB00F9015800BF01EEFF5501A7FFF40077FFBC00
      5CFF950038FFD200A3FF2101BE00550170010602A0018702C201D8025F011303
      9D00B402A6FFFD01E3FEB201D3FE6F0107FFB500AAFF1400500079FF3F0034FF
      D5FF1BFF69FFA6FE3AFF55FE27FF45FEFBFE54FED7FE2DFEA7FE17FEE3FE48FE
      BBFFB0FE43003CFFAB0020FF2201B7FEEE00A9FE4800C4FE6AFFF8FED5FEBAFF
      F5FE9D0036FF1201AFFFA1013C00FC0152000B020C00EB01BDFF3D019DFF7A00
      ABFF0D00EBFFDFFF40008BFF3C0031FF6400D0FE040199FE4201E8FE490122FF
      96017BFFA00140003A01C000A300DE001C006601E9FFB601CBFF030101001C00
      6C0059FF730025FF5F0078FFA10077FF440179FFD901D6FF2302400030024400
      D9011E007C010C009D01FFFF8B013E002F01400037010800FE00200026004E00
      22FF7A005AFE3A011AFEFA0116FEE60165FEB501EFFE74011CFF3A011BFF3A01
      1AFFF00031FF580081FFCCFFDEFF63FF1C00C6FE060073FEF8FF75FE65005FFE
      A400AEFE9A000CFFBE0077FFB6002D006C00930016007000EDFFA90017001101
      4400F200CA00C0008501960089017A0016018E00920087003400450028002800
      34005600470079002F00AB002F00F400BD001D011A012F012E01A3009601AFFF
      C40134FF740138FF0A0164FF000104007B01CC00D001E0001402B70047028800
      D9011A00F600A3FF0B00D0FE5EFFC8FDE8FE4CFDB2FE78FDEAFE9CFD11FFCAFD
      09FF2DFE55FFA4FE55FF75FF03FF14001BFF730031FF0401EFFE6F0191FE8001
      7DFED301D9FE400234FFF101B2FF6A013600FC000800BD008DFFF10034FFDA00
      31FF6C007CFF3500C0FF33001100F7FF3E00BCFF6C00BDFF1A0199FFAC019EFF
      BD018FFFF4014FFF010239FF570111FF6800E0FEBCFF53FF88FF2F00A5FF7300
      3E007D000401A2001D01F100C700B1014A003102CBFFFE018AFF820170FF1F01
      7EFFB40087FF6E00AAFF7D006200890013010C014601A2018001DA018D011302
      0901FC0140005001B8FFD400AAFFA200B6FF1200200080FFF40016FF2201C7FE
      BE00D1FE3300CBFEB4FF78FE6BFF2DFE27FF06FE16FFB4FD11FF89FD1BFF02FE
      BDFFABFE890063FF050199FF830147FFB30138FF010166FFE4FFBDFF26FF7100
      FFFE5C01EAFED6011DFF0402C9FF11021800F9010D002202D8FF0902A7FF6301
      91FFD4006EFFAD009BFF7300D6FF1D00C3FFF6FFF3FFCFFF2200F5FF11003000
      5E004400C3008B009700D200E4FFD50055FF0701FEFE4F0194FEC700A6FEF5FF
      1EFF77FF33FF6DFF33FFFAFF8FFF43001200190088001100B6003200C1001800
      B900ECFF9000F1FFCF00DFFF2701F3FF3001F3FF5501A5FF76018AFFEC00B1FF
      BCFFD3FFC6FE420068FEFE0046FE2E01C3FEEF00D1FF860062002D0085006A00
      8B00B100860072009800E2FFA9004EFFBC00A5FEA6001AFE620021FE750041FE
      CA0098FEEC0036FF1F01C0FF6E016D0058010A01DE002D016F0049015100B601
      0F00C50108009501B3004B01F100E80079000E01E8FF300196FFD90081FF9000
      6BFF980075FFB20077FFD60057FF61019AFFF401200045026C000202D7001901
      56015B003A010B009A00F5FF52001D00A4009300DD00B70018017F0096014200
      7301F0FFC000E2FF1200B3FF8AFF25FF3BFFD0FE07FFBFFE31FF76FE6DFF25FE
      3EFF52FE14FFC4FEFEFE6DFFCBFE1C00ECFE720054FFC9006EFF290132FF3801
      12FF4A0144FFC20149FFC70177FF3D0131009A006C0006002B00280025004800
      5500E4FFA3008AFFDB0050FF0C0116FF3B01E8FE540112FFB4012FFF32022EFF
      610245FF6E0223FF7502F5FE240205FF2B012BFF2D009EFFDAFF7F00C6FFEA00
      1400DE00F100C9004B01D200E800920169005802000063028FFF120214FFA601
      F4FE24011BFFB20037FFD0009BFF3C013700BF0199005B02EE0096023F01B702
      2B01D60288005C02DDFF9901B8FF2F0183FFB60069FF23000D0081FF7300CCFE
      0D00B0FE69FFBCFEE6FE79FE78FE40FE1FFE17FE2BFEDFFD67FEC8FDA2FE45FE
      39FFEDFE0D0063FF87007CFFD40000FF19019DFECA00C4FED7FF20FFF9FEB1FF
      BAFEB100B5FE5201F8FE5C01D3FF4D014C00360108007B01BDFF7E01B2FFD100
      B6FF3F00ACFFDCFFEEFF3EFF750082FEBC0039FEE4004CFE19018BFE3401F7FE
      790136FFF70179FF0A0200006A015D00950089002400EA00D0FFDC00A3FF4700
      3300DAFFB5007FFFAB00A8FFB200FCFFEB00E6FF2101F3FF2D01100029010D00
      2301F7FFDA003B00B5008E00F90080002E017E00550153007F011D0039014C00
      32007200EDFEA40045FE580111FE9F0129FE43010FFFD600D5FF5400D1FF7A00
      B8FFDF00BEFFB500C1FF5300A4FF9AFFA4FFBFFEC9FFF7FDACFFD0FDA0FF40FE
      ECFFBFFE370086FFAB0005004E0148009601B5003101DB009300B9006500F600
      3900380101002C01870022011401DF00EA00EC008E001D014600EA001200B000
      DCFF6800C9FFFFFFFAFF89FF0D00B6FF5900440003016F007E015200EC01A3FF
      7402FBFE8D0212FFFE0155FF4E0187FF33010A004A014C0044010500AE01D2FF
      D1018AFF400176FFAB0083FF59002DFF2F00FCFEE2FFDDFEB1FF8AFEC1FF2BFE
      A3FF45FE50FFDEFE11FF77FFCDFE2F00B8FEC1001BFF190180FF96016DFFDD01
      19FFDC010CFF3902F6FE6902C5FEDB0149FF6101DCFFE500C7FFAB00A0FFD700
      9BFFAE00C4FF8400F7FF4E001500E3FF4E0068FF630050FF7E0082FFEA006DFF
      300177FF490171FF800149FF800178FFF900BFFF3000FCFFCEFF8700C1FFBC00
      BDFF670056006200F0009000A5003C012C003802CEFFA6028DFFB9025BFF4702
      4EFF88019EFFCD00D8FF7600EEFFAA002D00C5008400020104013E01BC014301
      19026A01CF015F012B01E000CC008D00980056004600D4FF9C006DFF1901E8FE
      CA007EFE1F0087FE68FF6AFEE6FE48FEA0FE2DFE7EFEF5FDC5FEC3FD1BFF18FE
      6DFFEAFEF5FF8CFF5300FFFF9900E4FFF6008AFF0301A0FF6B0004007EFF9300
      FFFE6D01F6FE19020AFF0902A4FFEB013400DA010000DD01A1FF0F027FFFD901
      A1FF8E01B4FF2D019DFF8800C1FFD3FFE2FF77FFD7FF99FFDCFFB4FFE7FFCEFF
      2300D8FFAD00D6FF06010F00AA006800CFFF9A003AFFED00F7FE2201C1FEAD00
      2FFF6300F0FF27001700E9FFEAFF2500C2FF4600CDFF7000EBFF9C00E9FF8B00
      F8FF69000D0071003800B200B900B2002A01890063014E009101F6FF5C01D2FF
      9300D2FF86FFD8FFC4FE1F008CFE37009EFECDFF54FF97FF64007DFFB7009EFF
      950025007F005900830035006C0098FF1A00A4FE0100D2FD040073FDF3FFBFFD
      0E0041FE3F0003FF9300C0FF2E0127007E0193003401F80097001D0117005201
      F4FF7601BAFF5001D6FF5F015D00420167000C0119003101C0FF240185FFFC00
      62FFD80036FF9A0050FF6D0083FF9A00A5FF1A01FAFF6E014F008001B2001D01
      53018500B2013B00850115000001F2FF9400FAFF7E00FCFF6500B8FF8300BAFF
      D900D8FFBA00E8FF48003E00040047001400F1FF1A0087FFDAFF05FFA5FF8FFE
      6EFF82FE18FFD9FEE9FE36FFC4FEC1FFD0FE4A005DFFB1000500140134005C01
      E7FF5D0188FF740157FF820145FFF4008DFF7A004A00FBFFBF0068FFBF0076FF
      AB0090FFCC00A6FF0001CEFFFA008AFF050110FF1F01CDFE2F01D8FE5901E5FE
      94010AFFC70130FF23023AFF500275FFCE01E4FFFB0048003F00AF00E1FFDD00
      D4FF7D0015005D00B5007300EF00B1007A008001F4FF2002BBFF5202A9FF1E02
      72FF870168FFF0008CFFAD0082FFD20099FFF600D8FF55013400C001D600CB01
      4601CE012701BD01CA005D01730003014A008F003B00C5FF410049FF9A00CDFE
      8C0045FECDFF5AFEF7FE82FE6AFE80FE54FE91FE5DFE91FEB1FE6AFE48FF64FE
      A3FFC4FEF8FF3CFF2500C2FF2400FFFF6200CAFF9300D3FF49003600C5FFA800
      58FF430147FFC90165FFBB0193FF9901FFFF6B011E001A01CDFF29018FFF2401
      C9FFB70044002A00720091FF8700EAFE9D0091FE83009FFE8B0090FEB200B5FE
      F10005FF72012EFFCE018FFF9B012100F20079005200BE000000FE00DEFFCE00
      FFFFA2009300710013011700FB001C00A1002F007F000E00AD001500A6004300
      92004000AA005100B200A400E500BB002D01B7005E01B200880183007C017F00
      CC00B200BEFFB700D8FEAD004FFE900034FE210087FEDDFF5AFFC8FF0400B7FF
      0C000100D3FF4700C3FF1F00C0FFAEFF66FF31FF1BFFB2FE28FF5BFE53FF78FE
      A7FFB5FE17003EFF8B00EEFF1D013A0093017B005C01D800C10007013C003001
      FDFF6A01040061012300710199007D01EF004D0197005501FCFF440185FFDC00
      6EFF630073FF0B0094FF9BFFFEFF37FF560045FFAD005FFF140197FF6901C8FF
      D30192FF40027CFF3C02A5FFDA01B5FF6801C3FF0301E0FFC900C3FFA700B7FF
      E500C6FF2001DBFFD60045006C009F0054008600950021007300C9FF0E0060FF
      C8FF04FF5FFF15FF07FF2AFFE1FE8AFFCDFE470000FFC8008AFF3701CEFF9F01
      90FFC3012CFFDA01EDFE0402C1FEC001B0FE3F0123FFAD00B1FF0C00D3FFD8FF
      B4FFDBFFA4FFC9FFD8FFACFFF8FF97FFFAFF36FF1C00AAFE090094FEE9FFB5FE
      100014FF720086FF0401ACFF8701D9FF83011600F1002D0066002F0009003700
      C2FF0900B4FFF5FF1F003B008E00D2007000BC0106008102BDFFCC02D6FF9502
      D1FF2902B1FF9501BBFFE300C5FF8100EDFF2D00340010008F004C0013015800
      AE016C00DD01AD008101BD0009019B00CE006200CE00DDFFCF0068FFF40005FF
      EC00B1FE5500B2FE77FF9DFED8FE69FEBCFE5FFEC4FE9EFEE8FEBFFE5DFFB0FE
      BDFFEFFEE6FF38FF0B0099FF2400FCFF40000A007F002F0082008C002200F000
      C7FF6501A1FFDF018AFFFE0170FFE201A0FFC401E4FFBD01B8FFEA0152FFE001
      38FF7F01B7FFF4001E008E002B0038002700BBFFECFF6DFFD3FF13FF0300E3FE
      310023FF560066FF9200DEFFA60077005400BB00F3FFD400D5FFE600CDFFA700
      CFFF4F00300015008C00F1FF6E000D00F7FF2D0083FF3F0081FF6C00A9FFC100
      C6FFE8000B00B9003E00B5006C009000BE0056000F014200500109007301EFFF
      3401E6FF7600AEFFC9FF6EFF86FF4FFF5EFF1FFF5CFFFCFED6FF03FF91003AFF
      0201B8FFF6001300A4001C006F00E0FF1B00A0FFB4FF4FFF9EFFD2FE9CFFB4FE
      CEFFE1FE370046FF8E000A00D30092001301DC0023012A01BD003C0133005301
      FFFF9B010000A501F7FF9B011D009E015B008B013000850191FF5C01F5FE1301
      D0FEE700CEFEE300D7FEC3002EFF680087FF5E00D2FF7700330084007A00B200
      C6008E0041014F009E0131007701FAFF0001F5FFAE0030006B0024003B00DEFF
      7200C1FFD900E8FFFD005600C600A40084008C009A0036009800F1FF3D00C7FF
      DDFF7FFF6AFF6DFF2AFF5FFF46FF53FF5FFFD6FF77FF6500C3FFAD000F00E700
      F1FFE300A8FFCF008FFFDB0078FF8E005FFFFDFFB7FF86FF590029FFB50025FF
      A20044FF66004DFF830066FFCB0092FFEE0097FF070128FFD400DFFE9300D0FE
      B500BFFE07011DFF6A019CFFCB010F00E6018E007101C000AD00AF003300A600
      F1FF5A00B4FF0400DBFF1A00510095008500630143000B02CEFF4202B8FF2602
      A7FFF2016FFFCE0168FF74014EFF29014BFFFD0095FFBA00EAFFDB0041002201
      BA00440113016B01F7004901A400ED00A100A100CE002100B60083FF7F0036FF
      550023FFFBFF29FF5AFFF6FEC0FE9EFE9DFE80FEBDFEA4FEE8FED8FE51FFB0FE
      9AFFA0FEB3FFDDFED6FF08FFD8FF8EFFD5FF1700080046004F007D004500A700
      0900D600EBFF1101D2FFED0086FF8F0066FF5D009CFF4E00BCFF6000ADFF5600
      9EFF0B00FAFFC1FF6E009BFF840085FF7E001DFF5600ABFE4F0062FEA4000DFE
      EA004AFEF700FBFE14018AFF400115001A018700B500DB00840030017E003001
      4A00DF0052009600B2005800E3003B00AF003A004500380028004A0037007C00
      2C00C4005B00BC007D00880071007A00A1004400DB006700EF00C800EF00C100
      BE009F004A006700B1FF100055FFE2FF47FF91FF18FF20FF32FFF4FEE4FF00FF
      76005FFF8900D6FF26000900C9FF19008CFF090042FFEEFF4FFF91FF79FF20FF
      B6FF1BFF39001FFFA70073FFD2002700E600A400EC000E01BD005A0160007401
      420097017A009C017F00790187006201C0003A01A20009011E00C60070FF5D00
      2BFF060048FFCCFF7BFFA8FF070056FF81000FFFAD0018FFF100E7FE2C01E8FE
      5C0140FFB5015BFF120269FF180277FFA0018AFF3301BFFF0201B6FF9F007AFF
      5F0089FF9C00DBFFD1006500C500D2008D00C60088008F00A900580076003E00
      33001100D5FFC9FF66FFADFF5FFF7FFF8AFFBBFF92FF82008BFF0C01A0FF5F01
      9EFFAF0157FFD00126FFC10132FF7D0113FFFD0016FF8B0093FF3B00E9FF0600
      EAFFE8FFC5FFB1FFDFFF86FF24008AFF1000C0FFFFFFCCFFEBFF8AFFBBFF5CFF
      E7FF17FF5B0034FFCD00E4FF3C015400840177005C017600C3004A002D002A00
      FAFF1300B0FFF9FF8EFF2900FAFFAD0054007D0162003D0229006702E9FF2902
      C9FFCE0186FF8D017DFF4301A6FFAD00C5FF3B004400CEFFE50098FF35010500
      50015D0066017300670183003F01720038016000710143004601F8FFCE00AEFF
      A10066FF4A0036FFAFFF1EFF03FFE9FEAFFED9FEC7FE07FFD0FE39FF1DFF37FF
      7CFF03FF91FFFCFEC1FFF6FEEEFF35FFDDFFF4FFC9FF8200F1FFC6002F000201
      1C003D01E9FF7901F9FF8A01B4FF6F013DFF5E014BFF5B0179FF79019CFF9101
      A5FF4D01C0FFE20008008900160037002600D8FF320054FF0100EDFEFCFF9DFE
      1A00A6FE200065FF21001200480067006E00BD005700F4004000F1005900C600
      2B006A00DAFF3000FCFF260021004800F0FFA300A0FFD4007CFFE60098FF1101
      9EFF3801D2FF2D011900BE001C0034004500BEFFA90096FFF200F3FF13012E00
      3001FFFF1C01CCFFAD008DFF30002FFF0F00CDFEEEFF6CFEC2FF4DFE2A008AFE
      A4001AFFC600C5FFA40001005B00E3FF0F00C8FF9CFFC0FF6BFFBDFF94FF8AFF
      A6FF5DFFE7FF25FF6A00FFFEA90073FF8B0004006D005F004F00BD001300F800
      F0FF18011C003C012E004101FDFF3F0104002701EBFF190167FF2B01CBFEF200
      71FE950096FE7600DCFE820053FF8F00E1FF6B00070026003400C5FF980085FF
      CF00D1FFD4003700ED00600006017000E9007900C1007F00D1006600AF001500
      4800CCFF5900C1FF8D0006008E007A007600A7005900870066007E002F008B00
      F8FF7800E9FF3900B0FFE4FFAFFF6DFFFCFF1BFF1E006EFFF9FFE9FFE3FF2300
      E5FF5A00E4FF7000F8FF62003F004A005100FFFF1800ADFF3A005AFF820013FF
      8A0026FF800034FF920032FFB90070FF9900B8FF7900DCFF8F00ADFF690055FF
      54000CFFAE000FFF1A01B9FF4C0183007301C8007001CB0018019C00A6004A00
      6000230020000100C4FF0A00DBFF5E003800EF005700A9014600F6011200C401
      CEFF870159FF6F0114FF5F0147FF0F017BFFAA00D6FF43007700EEFFCD002600
      AD007500A2006400B8004800C3002A00D4001D00EC003700DE001F008000F1FF
      5300B8FF2C007EFFB4FF79FF40FF3DFF07FFE3FE0BFFD5FE09FF02FF24FF3AFF
      77FF49FF95FF4EFFA7FF50FFF3FF65FF1500FAFFF5FFAA00FFFFF0002100FD00
      2400EF001D00CF002300BE0010008E00B5FF4C009CFF3700DCFF5A000500B500
      1B00B200300034006700B9FF6D0075FF6C004DFF9F0014FF8B00DCFE70007CFE
      A90021FED90082FEBA004BFFA100EEFFA2007900A900E000B0001101B5002501
      A100E50054007E00480042006E003B00540083002700B9001F00B5003B00C600
      2A00E8001C00F9004F00C10044006700260018006D00DAFFC6001E00CD00A300
      CD00BC00B10082005100100004006CFFDEFFE8FECBFF7DFEA3FF40FEB2FF76FE
      F5FF0AFF0C00D1FF0D004E00F9FF5B00CCFF43006DFF2A0038FF1B0075FFE9FF
      AAFFB6FFDCFF7FFF570039FFB5008DFF980058006900E8004C0046013C008101
      5C0085018D007D01AE0041018400EF005800AA0041007A00E5FF870081FF5900
      51FF000069FFD6FF99FFD5FFDDFFD7FF580087FFA8001AFFC900B9FE180171FE
      5A01C5FE3C017EFF2901E7FF3101F4FF2401EDFF1301FAFFF9002600D7003400
      7700220036001E0045004B004A00B6004C00E1005600C10071009E005B008E00
      1F009C001C007C000B004400EAFFEFFF0D0081FF2B0098FFDCFF2A0075FFA600
      33FFF10027FF210168FF2E01B1FF3301D8FFE600B4FF5C00A8FFD4FFD8FF63FF
      D8FF53FFD3FF51FFDBFF4FFFE7FF72FFC9FFA1FF92FFD3FF9DFFBDFF99FF7EFF
      96FF33FF0100DBFE950010FFCC00CCFFD9005600D4007C0094006A0051004200
      1F002F00F8FF1E00C5FF2800D1FF62001A00D5002F007D012F00C4010B00A401
      DEFF71019DFF3A015FFF18019EFFD400010081005D001F00E10083FF480149FF
      3F0184FF0401ADFFD800BDFFBE00DFFFDA0012000C0140001F012800DB00F9FF
      7E00DFFF3100C0FFC0FFCFFF57FFC1FF13FF82FF03FF61FF0FFF52FF27FF5AFF
      78FF5AFFB9FF53FFCFFF4AFFF8FF39FF280093FF17004C00ECFFDE00E5FF1801
      D2FF1601C9FF1F01D2FF3B01D0FF3001A3FF11018DFF0401B1FF2301BDFF7001
      CAFF6501E3FFDA0019003E003200C8FF0B009DFF1C0098FF33009CFF260073FF
      370007FF580016FF3B00A8FF1E001E002C006400340093005800B1007600CD00
      6D00AB002B007A00FFFF6C00FFFF6000DAFF9700C5FFC800CCFFC300E1FFD400
      DBFFE200BDFFC300D6FF69000100FFFF2500A0FF7B0037FF000131FF3F01ADFF
      340101000E01DBFFC10056FF8800C4FE710069FE560025FE1F0013FE1E0056FE
      5600D0FE650081FF6E000E0053004C0027007200F5FF780099FF7A008CFF7200
      B6FF4500E4FF0100380087FF8D0071FF8A00EFFF4C0068000B00CB00D6FF1201
      EDFF4701340073016A0056013E001E01EBFF0E01A8FF090146FF280103FF2201
      E2FED600F4FEA8001BFF8E003CFF6000A7FF10001900ADFF540053FF870011FF
      C00057FFBE001200930092007E00AE006900950074007400A7006700D0004300
      A9001800710012005B0038003B009B003400FD00370011015700F9006B00DD00
      2D00BC001D008700390032003600CBFF40002AFF5400CDFE33000AFF02005AFF
      EEFFA0FFD8FFE9FF05001500590025008400E6FF6F0066FF510003FF4500C9FE
      1500D5FE0B001BFF210048FF3E006CFF51009DFF2100CEFF0400F5FF0B00E7FF
      1400C5FF4A0086FFB70077FFEC00F0FFE5005B00D20087009500870069005400
      5300350036002600FAFF1700F0FF45002600B10029003F011B009D01E9FFA601
      B6FFA6019CFFA1015AFF810162FF4F01C5FFF400150087006000EBFFB50076FF
      BC009BFF9100C6FF6D00E6FF48002E005D0061009F007200D6005100BC002700
      760019003A00FFFFDCFFE6FF99FFC1FF5FFF8CFF47FF71FF59FF6BFF47FF82FF
      68FF9DFFA7FF92FFC5FF8AFFF0FF68FF2E0069FF3300E4FF08004A00EDFF5B00
      BCFF4C00C1FF320001002700370012003400E4FF1A00D0FF1900D4FFF0FFE9FF
      F1FFE6FF0100A4FF170048FF450007FF2400F8FE1A0014FF4E0011FF6800F6FE
      7300D4FE8600D9FE660058FF4600E3FF590048004500B1004A00EF007D00FD00
      9A00FD007800E8003800CC001400B600D6FFB100CCFFBA00ECFFBC000800CD00
      2E00E500FDFFE500CEFFC300E9FF6F000E001A004E00D0FFB5009DFFE100DFFF
      C00015009900DDFF4C007DFF1700F2FE0F0088FE110067FEFFFF63FEEBFF92FE
      1700E7FE1E0071FF1A0010000A006700EBFF8700F6FF8100C2FF5D0092FF4F00
      BAFF3700E9FF23001A0013006600F0FF7C002F00670094005900CD002A001301
      260039015B002D019300F4009500A40062007D0039007D00E7FF9800B6FF9800
      B0FF6500ACFF2300D6FFDBFFE2FF90FF070048FF6700E8FE9C009BFECF0082FE
      0A0197FE050116FFE00099FFD000D8FF9D0008007D00180098001A00BE001B00
      AD00220071003F0065005F0043009F003600E0004800F0004F00D4007F00B000
      7200980051008F006700780066003F004800FCFF3500BBFF0200CAFFC9FF1B00
      C7FF5800A5FFAA0097FFEC00C5FFD9000000950012003500F0FFCEFFDDFF94FF
      B1FF9FFFA0FFD2FFB6FFF3FFC1FFEBFFE5FFFCFFC6FF310089FF470098FF1500
      C3FFB8FF04007EFF650066FFA700B1FFB0003800A9007B0071009B0036008700
      26003E002F000D002D00F8FF0800090024004C003000AB001B00FB0017002701
      0800480116006701FCFF5C01E8FF1A012D009F0077000100AE0082FFEC000EFF
      F100FAFEC8004BFFBC008AFF9500D3FF84000600A2000E00C6003500C8006500
      70007A0023007600C1FF68005EFF580034FF2D001BFFF0FF37FFC8FF3FFFB7FF
      48FFA3FF8CFF7BFFBBFF4AFFDDFF42FF120059FF0A00B1FFD9FF2900C2FF5A00
      89FF7E005FFFB20079FFC600C2FFBE000100AD00FFFF980008007B00FBFF7200
      DCFF6200E2FF4400E4FF10001000E0FF1B00D5FFFEFFBFFF1E00A0FF34009AFF
      2E00B8FF3400C0FF2600C7FF0F00FCFF2A0032002D008B001C00E3002600FA00
      34000C0136002901F7FF1501CEFFE400ACFFC1008EFFAD009DFFA100A5FF8B00
      C9FF9300D1FFAD00C6FF9200000054005100EEFF95008CFFEA0045FF210123FF
      13013AFFFD001BFFB900DBFE6000ACFE3A005FFE430032FE5B0033FE4A0032FE
      5B0078FE6C002CFF3E00F9FF15008E00F9FFCD00F0FFDF00C7FFD70099FF9C00
      B9FF5300E6FF0D00FFFFE2FF3000AAFF480085FF3400B7FF3D00F0FF2B002D00
      01007A00F1FF8D00F6FF88000B009500E0FFA600ACFFC20076FFEA0029FFF900
      16FFCE0019FF750041FF2F005CFF0C0072FFE0FFD1FFA7FF2E006FFF60005CFF
      900069FF9800ADFF600040004C00A6002E00B2000B00A5001F0062004A002600
      7A003B006C00590051007F003B00C4001900F700100000010500DB002A00A800
      48008500370040005400EFFF7100B4FF6A007EFF7A004EFF7F0033FF580050FF
      640075FF76008DFF6B00BAFF7100AFFF7B0083FF8A006CFF5A002CFF2E00F1FE
      1900F7FEEEFF1FFFE2FF4BFFE1FF75FFF9FFD1FFF0FF4C00C1FF7E00D6FF5D00
      080011002500D6FF5200BBFF7F00C5FF76001900820052007F00450046004500
      30001C004A00EEFF720001005B000E003F0032003B0091001700F100F3FF4401
      D9FF7901E0FF8F01DFFF8701D5FF2701080088004400F4FF560090FF6E004DFF
      830036FF68007AFF7300C2FF9600E2FF98001C009900430099005400A9007600
      8B0069004B00450015004F00C1FF690080FF59005DFF2E0063FF140072FF0600
      6DFFDDFFA9FF96FFF8FF61FF12004BFF2F0049FF43006DFF1300C2FF0900F5FF
      1B000600FBFF4400F3FF5D000D003300520015007600DEFF6B0097FF5E0089FF
      34008EFF0B0080FFE9FF6AFF00004DFF2B0045FF3A0037FF6C002EFF8B0068FF
      6800B8FF5B00D2FF6400CEFF3A00F5FF37002F005B005300480098003400CC00
      2E00D2004000F9002200FA00ECFFD900E1FFE000D1FFDB00C6FFB800B8FFA400
      C9FFAE00D4FFE000C2FFF400F6FFB5004E0045007D00CEFF9A0065FFB8002FFF
      90004EFF67005EFF620026FF240011FFF2FFF1FEF5FFA7FE1F0099FE3300A4FE
      2100D0FE26005EFF12000400E4FF7600B8FFC500B6FFF400B8FFF7009BFFC400
      BBFF7600EBFF4400E9FF3900F0FF17002200F2FF320006004F001C0092001500
      93003D0079005E0060003A006B004C006100760023007800FCFF8A00D6FF9000
      B8FF5100AFFF0700CBFFD4FFE1FFAFFFD7FF89FF0F0038FF6D00E1FE8F00BBFE
      A400C0FEC4001AFF9800C8FF6E005400790074005B00770036006D0023003C00
      2C003B002A005E001100680023009C003700DC003700DE002A00CA004800B200
      75009700710073008B0037009D000B0062000D00330006003700ECFF1200EEFF
      0000E4FF3200BAFF3400D3FF10001E00F2FF2F00FCFF3300FBFF1900CDFFC4FF
      CEFFA4FFDEFFB4FFD5FFB7FFAAFFD6FF9CFF100098FF4A0072FF540099FF1200
      F0FFB3FF0A0069FFFFFF37FF150049FF1400B4FF0B000A00340006002D000400
      06000A00FCFFCEFF2800A7FF4200C0FF3200D4FF3E00170040009C001C000401
      E0FF4401E2FF66010200500101000A013700980078000A006E0099FF4F0045FF
      4A0013FF2B0034FF210068FF750083FFA700CEFF990045006D0083005700A900
      3B00D400ECFFD200B6FFD2007EFFE40033FFB70007FF720027FF38005CFF0700
      6BFFE0FFBDFFA3FF26005CFF3D003AFF23003DFF190074FFEDFFD3FFB5FF1700
      CCFF3400CEFF5600A0FF810080FF68009DFF3500D5FF2B00E5FF120001000C00
      1A00370000003300C5FF0500C2FFDEFFFAFFCFFF1500D6FF4B00CDFF7A00D3FF
      4C0005001C001E0030001800320031001C0048003D00440047006A001500BE00
      DEFFE300D4FFEC00D2FFF400A3FFCD009CFFA200B9FF8F00BDFF6A00A7FF4800
      AFFF4800C9FF7700C0FFA000000074008900FCFFDC0072FFF600FEFE0701CCFE
      F000EDFEC100F5FECA00BBFEB7008CFE620085FE240073FE3B0066FE600094FE
      4900DDFE4F005AFF4D0019001700BA00CAFF2001A8FF5501A2FF4F017AFF1601
      A2FFAD0000003B001300FFFFFEFFE7FF0900E2FF160001001F00FFFF6500E3FF
      9200000067003B0012005400E5FF6A00CEFFA0008FFFC40074FFCF006EFFE700
      50FFDA0031FFAB0047FF6C0086FF37009BFF1900DDFFD8FF51007EFF86004BFF
      820049FF730089FF4F0029001200A6002100BA005100AE004700920015005D00
      F7FF4000F6FF5700E2FF6E00F8FF85002900C3004000DA002900A70021005800
      49002800550023008B00F2FFCE00A7FFB10096FF630097FF4A0076FF500063FF
      4A0042FF8B0005FFC5000EFFA30049FF5E0063FF380064FF140057FFC9FF2CFF
      C5FF16FFFAFF43FFFFFF82FFC8FFD0FF9BFF2F009AFF860091FFC300C2FFAD00
      2B004B004400E0FF140087FFF8FF59FFF4FF9EFFECFFF1FF2900F1FF7100F8FF
      630007003600FFFF3300FFFF48000E003300200031004C003900BE0011002901
      DAFF4B01C5FF3E01E5FF2901F1FF16011600CA00770042009700C7FF60007FFF
      300053FF1D0075FF2300A2FF6E009BFFC200D4FFCA00400098007B0071007F00
      560084000D008400DAFF7D00B7FFA20077FFBB0033FFA10020FF60005CFF1300
      90FFE1FFDDFF93FF60001EFF9800DCFE7900EAFE600014FF450082FF0F00E9FF
      0D00EDFF3800E9FF3800DDFF0B00B1FFF6FF94FF050085FF080052FF32000FFF
      5C0014FF3B002CFFEFFF0FFFC0FFE0FEE9FFE0FE10002AFF3E007DFF9000BEFF
      840001002F003E00080043000B004300F8FF4F0010002700430029003A006E00
      0F00AB00F5FFE000D7FF0C018EFF0A017BFFF00097FF0F019EFF1F0187FFEE00
      68FFBE0072FFAD007CFFB700B4FF890046000D00AC0087FFA6002CFF8300F2FE
      6A0005FF4C003BFF590010FF8200DAFE7500D0FE4900C8FE3000D5FE2F00F7FE
      170023FF1C0062FF3300EDFF19008E00E7FFDE00A3FF060186FF220178FF1901
      86FFD500EBFF6A002C000D000400E2FFE2FFB8FFFBFFB0FF2200CCFF7D00B2FF
      E500AFFFFB00E7FFB7001000560027000A004000B6FF5000A5FF4900CAFF7100
      C2FF9E00A4FF78009BFF1F00C7FFC0FFE6FF8DFF04005FFF700016FFB800DDFE
      9800E5FE6D0030FF5200D2FF26007E002300A7004E008B005000620010002600
      C9FF0500AFFF0800A5FF0C00E4FF19004F0077007C00E8008000E7006E00A600
      76007F008D007D00A7006000EF002300EA000100730005001D00E4FF1700B8FF
      1700B2FF38008EFF69007CFF6D00A5FF5400D4FF28000900F1FF2A00AAFF1200
      ACFFE4FFE5FF0100E3FF5300B4FF7B006BFF840054FF8E0061FF9D008AFF7700
      F8FF2B003800DFFF0400A3FFBDFF77FFB1FF90FFBAFFF0FFF3FF06004A00E2FF
      7D00D0FF7E00C5FF6700D6FF6C00E8FF5E00D8FF5C00D3FF69002F004100B000
      1100DB00F1FFC800F7FFC7000F00CA002E00900087002000B900ADFF670059FF
      0C0012FFF7FF0FFFF4FF5BFF210085FF6B00C0FF97003900930097005400D200
      FEFFEA007FFFD90033FFC7003AFFDE0029FF0B0111FFF90012FFB5004DFF6700
      99FF2A00D8FFE6FF44008BFF870046FF5B0027FF200026FFFBFF6BFFC2FFEEFF
      B8FF2400DFFF0D00F4FFECFFDFFFCBFFA8FFCEFF92FFE5FF92FFCEFFD8FF9CFF
      4500B1FF6200EDFF4A00E9FF1700B9FFFDFF97FF0400BBFF170004005C002A00
      7C004A002B006700DAFF5600CFFF6300D2FF9D00E6FFA30008008B001A009C00
      1E00B9000000D400D5FFEA0094FFC3007FFF9600BEFFB500DDFFE600C8FFD200
      93FF8E0077FF5B0086FF4800B4FF1E004100C8FFD00070FFEA0018FFCA00B5FE
      B30085FE8D00A4FE7D00A2FE9C0060FEAB004FFE950069FE5800A2FE290014FF
      06005DFF010086FF2700F9FF19007C00DCFFCA0096FFEC0072FFF1007AFFE800
      A5FFBE0016006E0071001E004900D4FF000077FFEBFF51FFEBFF7AFF240072FF
      7F003EFFA8004BFF950088FF4000CAFFD0FF05005CFF0B001DFF14003DFF6E00
      4EFFDA003FFFFA0042FFC60067FF7000B0FF2900F4FF00005100D8FF9400B0FF
      5D00ACFF0600C5FFDDFF1200BDFF9E00C5FFE800F0FFCB00FCFFB000EEFF9200
      B4FF710082FF7A006FFF630092FF300007004C00600084007E00810078005B00
      730022008E00FCFFAA00F5FFDB00DEFFF200C9FF9A00B6FF34006BFF2A002CFF
      43003BFF660030FF8E00F1FE9600D5FE9200E3FE650007FF190048FFC4FF5FFF
      96FF55FFC2FFACFFD3FF4200B0FF9A0076FFA60049FF870047FF67005FFF4F00
      C9FF21003A00DBFF34009EFFF5FF62FFDAFF5AFFD0FFAFFFE9FFEDFF2E00D7FF
      5800C4FF6E00D0FF6200D1FF5000F8FF3B000B002A00FDFF4800400043009600
      1900AD00ECFFAF00DEFFA400FAFF95001F00840076005000C2000100A100BBFF
      530068FF320042FF1C007EFF1700C0FF4800D7FF7E000500B0004A00A9006C00
      54009500D6FFAA0079FF96007CFFC5008EFF190189FF2B017EFFEC0091FF7200
      D6FFF5FF23009EFF810062FFD90023FFCA0001FF7A00F4FE480019FF1900A3FF
      F7FF05001400EFFF2E00B6FF390092FF210061FFE3FF53FFB1FF40FFAFFFF6FE
      0A00F2FE570036FF58005CFF2A0064FFF5FF6AFFF0FF92FF0C00F4FF4C005600
      7D007D0048008600EBFF6800DEFF4300F8FF5F0015006E004A00470060004300
      640071004B009200FAFFC10091FFD90049FFB00066FFC50097FF0F0194FF2201
      81FFFD0067FFA20069FF39008BFFEFFFEFFFC1FF760088FF9A004FFF6E0013FF
      5A00DBFE4F00F7FE4B0024FF790012FF9300F7FE8E0005FF65001DFF1C0062FF
      E5FFB0FFC9FFAFFFE3FFD1FFE9FF4700BDFFB20086FFEF0060FF000178FFEA00
      ACFFD800F7FFBC00540054006700D9FF35006CFF28001DFF380038FF5A005BFF
      B0003AFFF60038FF0D017DFFD900B6FF5B00E3FFD6FF06007AFFF2FF7CFF0B00
      91FF670086FF8E007EFF67008CFF1E00CCFFDAFF1100C6FF5600CFFF9100C5FF
      6A00D2FF0E00EEFFE6FF0400DAFF5400CFFF9D00E9FF8E000100510006002800
      FFFF0600D8FF0F00A8FF43009AFF3600EEFF3C00540092007B00BC007B00A300
      6E006C0089002300AC001200D1003900F0002C00B300F5FF4800B5FF17007DFF
      120099FF1000BAFF31008CFF51005CFF680075FF7A009DFF5400DCFF05001D00
      BCFF1800ADFF3D00B4FFAB00A4FFE0007CFFAF0048FF480034FFF0FF45FFD9FF
      8CFFEEFF0800D6FF38009BFF07006AFFDEFF2EFFD7FF33FFEAFF5BFF220052FF
      590040FF780057FF8E006EFF7D0097FF4F00E6FF2300F8FF1E00F5FF29003B00
      10007F00E6FF8800C2FF6E00D6FF4000FFFF2A002E003B00700016006C00D1FF
      2100A3FFEBFF81FFC4FFBDFF99FF2100B4FF3800F6FF3E002C005F003B007C00
      01009D009BFFC8003FFFC10033FFCD0052FF380161FF84016AFF53017BFFD900
      AEFF4F00E6FFE6FF2100B0FF72006FFF7D002FFF3A0020FF0F0024FFF6FF68FF
      DAFFC5FFDFFFDCFFECFFC2FFF0FFA6FFEBFF83FFC2FF71FF8AFF86FF7CFF7CFF
      CCFF73FF4700B6FF7D00EFFF5400EFFF0000E5FFE4FFDAFFF3FFF8FF08004000
      33005D001C005100D4FF5300BBFF5900D7FF9200F8FFCF001900AD003B006500
      4E00490051003F001E004800CBFF670087FF59007FFF5B009CFFAA00A0FFEF00
      81FFDF0057FF7F0061FF04008AFFB1FFD6FF98FF5B006DFFA60013FF8D00C6FE
      760082FE790084FE7D00C4FE8D00D0FEA100D9FE9A0012FF83004BFF550099FF
      1300EEFFD7FFFEFFC8FFF8FFE5FF3700E3FF9600B8FFC80091FFD100A5FFCD00
      D9FFD2000E00EA006000B2006E0025002800A0FFF8FF2EFFEBFF11FFF5FF34FF
      210029FF6C0022FFA2003FFF9E0065FF4800B0FFC2FF07004EFF270020FF3B00
      33FF96004FFFF10069FFF90092FFCB00E3FF7F00300048005300480076004000
      59002000F8FF0E00B1FFF0FF98FF0C009BFF6700AFFF8500CEFF7B00F0FF6400
      FCFF4100E2FF3B00B2FF42009DFF1500CEFFDAFF3800E9FF8A00100099001100
      8D00F1FFA100C3FFB500C4FFAB000200B7001C00A100E5FF4F00A0FF1F004BFF
      1F0025FF210033FF1F000CFF3400D9FE4A00E7FE55000BFF39004EFFF3FFBBFF
      A2FFFCFF6BFF440073FFBE0083FF000169FFD10044FF600049FFE4FF6AFFA3FF
      A2FFB7FF1600CDFF6500B6FF4C0099FF220069FF12005DFF08008FFF010086FF
      180069FF3F007EFF620088FF6200B6FF430010001A0033000800320029005100
      30008B000500A400DFFF8D00F5FF670039004C007A006500CD006700F1001900
      AC00DDFF5400B7FF1200B8FFDFFFF8FFCCFFFFFFEEFFDEFF3400F1FF62001000
      460056000000B900B0FFD60079FFD70086FF0401B1FF2901C5FFF600CEFF7D00
      F5FFEDFF2E0071FF5B004AFFA70036FFC60006FF7D0000FF2F0000FF0B0025FF
      060088FF0F00A2FF1E0072FF3C003EFF4200F9FE1900D7FEE3FFE9FEB4FFE7FE
      B6FFE6FE020017FF480066FF390099FFFCFFB4FFEBFFC5FFFFFFD3FF07000800
      3A002F005E001C00310019000D001F001E003A002E00850032008C004A005100
      5D00420042004700F5FF60009EFF9F0058FFB00036FFAF004AFFDB0068FF0501
      57FFF9002EFFB50038FF45005EFFD4FF89FFA6FFDFFF99FF3B0065FF4E002EFF
      4800FCFE6400EAFE760027FF640050FF540056FF5C0083FF58009CFF3400A7FF
      0E00D3FFDFFFE6FFB4FFF5FFBDFF3000CBFF8B00AAFFD10083FFE0008EFFC800
      CFFFA1000C0090004A006B008100F2FF670070FF35000EFF3200DAFE3300FBFE
      260014FF43000BFF8A002CFFAF0055FF79007FFF2100C8FFC6FFE4FF6DFFF2FF
      5AFF20007BFF5D0083FF870088FF7F00B5FF6700F3FF5B000F00750027008B00
      3E00660006002700C0FFE9FFB8FFC9FFC9FFEEFFD7FF0500EAFFE6FF0B00E0FF
      1900E1FFF4FFEEFFD3FF1D00B6FF2B00A0FF2100D8FF1F00330030005E003E00
      68002F007F001700A6000800AB002500B2004C00C80034009100FFFF4900CBFF
      3A00B4FF3600D1FF2F00D1FF4700A2FF7D00A2FF9100C5FF5D00000016006300
      CAFF9F0087FFC4007FFFEC0088FFF8006FFFE20042FF970032FF390053FFF5FF
      72FFE9FFAAFF01000B00E7FF2F0097FF12003DFF0C0006FF110017FF080023FF
      220001FF670014FF90004AFF76007DFF5600D6FF390010001200190020000800
      3C00F3FF1E000600EFFF1F00E8FF1F0013001F003C0037005D004C007D003200
      49001A00DDFF1600A1FF1E008AFF430070FF2B0084FFDBFFE0FFC1FF2900DFFF
      14002100E1FF8E00ACFFDE005FFF160150FF550175FF730172FF750164FF2E01
      84FF9C00C6FF1300F8FFC4FF1C00A3FF4A0070FF37003AFFFCFF20FFECFF2EFF
      F1FF65FFECFF81FFF0FF6FFF14006EFF34006DFF1C0054FFFFFF67FFF0FF7AFF
      D6FF7BFFF0FF98FF2900B1FF2800CBFF0400E1FFF6FFDCFF0600E1FF08001700
      0B0057002A0072001A008700E5FF9300E1FFA600F9FFD7000300C40017005E00
      49001A005E0013002D001C00F3FF4F00CBFF750092FF7D007AFF9C0084FFB000
      69FFB30042FF89004AFF10008AFF9BFFC2FF6DFFF0FF66FF450045FF7A0011FF
      6B00E3FE5E00D3FE58000CFF2D004EFF0B005AFF22007EFF4600B4FF3C00B1FF
      2800C0FF2800D8FF0300E4FFF4FF140003003A00DDFF6900A9FFA200A2FFA900
      CEFF9600FBFF97001D007F004F001C0054009BFF21002CFF0000E0FEFBFFD2FE
      ECFFC3FE00009CFE5000A9FE8E00EAFE69002AFF120097FFD6FF000092FF2F00
      7EFF6300AAFF8B00B0FFB200A2FFD200B6FFC200E2FFA900E9FFA600DFFFA400
      FAFF6700F1FF1C00B2FFF8FF8EFFFFFF8EFF3F008CFF67009DFF4400CBFF1E00
      F0FF1700DCFFF5FFAEFFEDFFB3FFFDFFBBFFD2FFEBFFA8FF56008FFF890093FF
      7E00BDFF7200CDFF8B00D8FF93000C0082002D00930005008F00D3FF6200A7FF
      53007CFF5B0075FF48005CFF2F0020FF39000BFF360053FFF4FFB1FF9EFF1500
      72FF710057FF89005DFF9A0087FF9B0085FF820060FF600055FF140077FFC1FF
      93FFACFF9EFFBEFFE0FFB4FF1C008DFF0E0063FFF9FF39FFF5FF34FFE8FF33FF
      EBFF1AFF1B001BFF4C004EFF510073FF4100B4FF45001200320024002A002300
      510027004F0030002A0051002B005200590048007F0055008F005F009F004500
      800021001E000B00D5FFFDFFC3FF0800AEFFFBFFB1FFBBFFF3FF9DFF3B00E7FF
      32004500EEFF9D00CDFFEA00B4FFEE00A8FFE800D4FFE900E9FFD200E7FFA200
      14003A006200CCFF8300A9FF6C00A5FF68007DFF690053FF3A003EFF0B002EFF
      010036FF050041FF23002FFF60001BFF86002EFF66003CFF0B004AFFD1FF78FF
      A8FF82FF8EFF87FFB5FF9EFFC9FFB2FFBDFFD2FFCCFFD1FFFDFFC9FF2200F8FF
      280036004C00430063003E0048004A002F00600032008D002300930015004700
      3500EEFF5100E6FF2B001200D3FF54009BFFA50076FFA4006BFF8B0094FF8E00
      83FF87003EFF6F002BFF2A0064FFD6FFA6FFB6FFCDFFA3FF190066FF680035FF
      70001BFF530015FF3A003DFF0B006CFFDAFF81FFEAFF8DFF1700BCFF1F00E5FF
      0B00FCFF0D00330005004A00EBFF5300ECFF6900C9FF79008FFF8A008AFF7700
      C1FF450000002A002F000B007D00B1FFB20057FF940033FF560011FF2E00F9FE
      1A00DEFE15009DFE440065FE820085FE8200E7FE480057FF1F00C9FF01000400
      D9FF3100D2FF7900AEFFB4006EFFEC0065FF0A0186FF0D019CFF24019BFF2601
      BFFFD200F0FF6B00F0FF2F00D8FF0C00CCFF0D00C5FF0400C5FFD3FFEFFFA7FF
      1100B0FFFAFFDBFFBBFFF3FF9EFF1100B1FFFEFFD8FFC7FF2A00BDFF5500CEFF
      4300DCFF4B00DAFF7B00D1FF9000F7FF7600330082002F009F001E0097002400
      8C001B0092001900820008005B00C9FF4F008CFF4200A8FF01000100A4FF4F00
      75FF9A0072FFA60081FF8900B9FF9000BCFF9F0079FF97004EFF610059FFFDFF
      72FFC6FF79FFB4FFB0FF6EFF050029FF2A00FBFE3200C6FE4500B2FE4800C5FE
      3400E3FE4500EAFE6B00FFFE750042FF560086FF3300CCFF2100DFFF2100C8FF
      4F00D0FF5400E9FF1C000A00F5FF3300EDFF5500EDFF8900DCFFC300E9FFB200
      F0FF8B00BAFF8D0081FF7A0069FF59006DFF230081FFC9FFC1FF76FF050083FF
      0400F3FFC5FF670093FFD20084FF13017EFF29019BFF4101A1FF470189FF1701
      9EFFC900DAFF720001003700F8FF06000B00A3FF2A004FFF120038FFEBFF24FF
      E4FF25FFF1FF3BFF040032FF430012FF7F001CFF750065FF2600A0FFD3FFC5FF
      A6FFBDFF98FF87FFB8FF77FFCEFF8DFFBBFF9EFFBCFFAAFFEBFFC0FF11000500
      01006E000900870022006C0016006E00120070001A0076001A005B001700FCFF
      420083FF730064FF5B00C3FF05003A00A9FF900076FF960070FF60008BFF4800
      7CFF42003DFF21002FFFEEFF67FFBAFFADFFADFFC9FFCCFFEAFFB2FF18008BFF
      0F009EFFE7FFA5FFCDFFA5FFACFFBDFF8DFFC6FFB6FFA7FF060092FF3B00C0FF
      510003004E003F004800500043003D0043004A001C007600CEFF90009EFF8500
      ACFF6300DAFF4800F8FF37003400F1FF75009BFF67007CFF3C0044FF2A00FCFE
      1900CDFE040096FE1B0055FE4B0065FE5600F4FE2F0099FF00001500EDFF5B00
      E7FF7A00EDFFA200D7FFCF0099FFD20077FFCA0088FFCD009EFFDB0094FFEF00
      A5FFB700DCFF6500E9FF5400D8FF4600C9FF3900B1FF3900A4FF0D00D6FFB6FF
      180075FF20007DFFFAFF93FFD5FF99FFDDFF86FF100062FF540061FF760077FF
      60007AFF48007BFF530086FF6000A3FF4E00E2FF6200F4FF9D00E0FF9F00FBFF
      89000F0075001600430010000400DDFFEBFF8AFFCEFF77FF92FFD4FF59FF3100
      38FF730044FF7A0077FF4500C5FF3200E2FF3F00AEFF380070FF180066FFE6FF
      7FFFC0FF83FFCCFF9BFFA8FFD8FF53FFFBFF2FFF0A000DFF1E00EFFE17000BFF
      FFFF29FF1A0003FF5A00E6FE7A0025FF6C008DFF4300F6FF2E002B004B003200
      84004800950067006C0075003D006E00280068002700670015007D0017007200
      3F003A003100350004003400F1FF1700E9FF0E00E9FFF1FF0800A3FF250089FF
      1700E6FFEAFF5D00C2FFB100BBFFBD00D9FF8900170066003F005D0031004A00
      1B0039002300370037001900280008001E00D9FF290081FF12005CFFFFFF2EFF
      170000FF28000BFF2D0015FF5200F7FE7A00EDFE65003AFF10009BFFAAFFD2FF
      63FFD2FF5DFFA5FF94FF7CFFC5FF74FFCDFF73FFD0FF79FFF3FFA2FF2500D2FF
      2F0023003500590064004300770045006C005200690048004F00390028000900
      2E00A4FF37006DFF1400C2FFD5FF3A0094FF8B0072FF9F007AFF7000A2FF4C00
      B0FF4C0086FF3F0055FF21005CFF05008FFFE8FFACFFEEFFC3FFE5FFF1FFA4FF
      FCFF8AFFDFFF89FFC9FF88FFAEFFA7FF87FFC8FFA3FFB6FFF0FFA0FF2800E6FF
      34004C001A009E000500B8000D0097003500730038005B00F8FF3400C1FFE9FF
      C4FFACFFF1FF81FF15007DFF350089FF6E0068FF7F0053FF5D003FFF490005FF
      3300D3FE1000A2FE25004CFE56001FFE650083FE4A0034FF0F00DFFFDFFF4F00
      C5FF7F00CCFFA800C5FFCC0083FFE2004EFFE0004BFFDA0070FFD2008BFFD400
      9EFFCA00D2FF8100F0FF4600E7FF2700E4FFFAFFD8FFE3FFB6FFD1FFC1FF96FF
      F1FF55FF000064FFDCFFA3FFA3FFCEFF8DFFDEFFA7FFD8FFFDFFC8FF4800B7FF
      4A00AFFF3000B1FF1C00CCFF2B00EBFF340021004500600086006700B0007500
      AD008B00A100840086007D0048005B001D000B000400D3FFD6FF030097FF6800
      70FFBC007DFFE000A2FFC700EAFFA10016009200E6FF8E009BFF670077FF2B00
      88FFEBFF9BFFBDFFAEFF8AFFE4FF26FF1600E1FE2200D3FE1D00E1FE150012FF
      F7FF39FFFBFF1FFF3600E8FE6000FBFE5C0042FF400085FF3800B8FF4500D3FF
      6F00F1FF7F00140038003800E3FF5600ACFF6A0097FF760088FF9A008AFFB700
      BDFF9000E9FF6C00E2FF5100CDFF1C00C8FFF4FFBBFFCCFFC1FF8BFFE3FF53FF
      F3FF79FFD9FFFFFFA2FF8D0092FFDE009FFFE400D6FFCF000D00BC00F3FFBB00
      C1FFB100B4FF8F00CDFF6000DFFF3900E2FF1400EDFFC9FFF3FF8EFFEFFF66FF
      FAFF44FF15004BFF130057FF230037FF540007FF5D0020FF20006BFFBFFFAAFF
      8AFFC7FF7DFFACFFAAFF88FFF6FF74FF000076FFEAFF90FFDFFFBCFFEAFFFAFF
      F0FF5300EFFF9D001700980046007D005D0059006D0019007C00F8FF6500D8FF
      4900A3FF440084FF2600B4FFE7FF24009EFF82007FFF9D0077FF73009EFF3B00
      E5FF0B00E2FFE9FFB6FFDAFF9AFFCFFF99FFD6FF9AFF05008FFF3A0099FF2400
      AAFFFDFF9AFFF3FF83FFDFFF7FFFDCFF7DFFDFFF94FFBBFFE0FF81FF28008BFF
      4300DFFF33003E0032008700400095005C008A007900760040005800DFFF3300
      A7FFF8FFA3FFB1FFB8FF9EFFD2FFB2FF12008DFF580053FF6D0018FF6700CFFE
      6300B5FE4E00B0FE39008CFE490067FE53009AFE380029FFFAFFD1FFDDFF5600
      DFFF8800F3FF900016009E00FAFFB200B9FFB20096FFA1009CFF9C00A6FFBB00
      9FFFD900B1FFB500C9FF8B00C2FF7000B8FF3700C5FF0B00C3FFE3FFCCFF96FF
      040035FF2A000BFF170022FFD7FF4EFFB0FF87FFB6FF9BFFE9FF8DFF420072FF
      64005AFF43005AFF1C0070FF180083FF2900B9FF34001900540053006E007D00
      6200A100480096003200890001007800C8FF3700B9FFCDFFACFF9CFF87FFCEFF
      57FF22004FFF620077FF5900B6FF2A00FFFF1200FCFF0500B9FFEFFF86FFCAFF
      7CFFA7FF82FFA5FF7FFFB3FF96FF79FFC1FF27FFD4FFFFFED6FFE5FEEBFFEDFE
      F3FF0AFFF5FF02FF2500DEFE5400F2FE630043FF540097FF5200EDFF69002000
      86002700B2002600A200260048001E00EEFF1000C0FFFFFFB8FF1000C1FF4B00
      F2FF680034006C0045005D003A0023003D000A0027001700F8FF0300F0FFC2FF
      FAFFA0FFF3FFD1FFD0FF2800BFFF6E00DBFF73000B0045004F002F005D004300
      2C004E0005003D00F8FF1C00FBFF1800F6FF310005000F002300CEFF20009BFF
      19006AFF260066FF240084FF11008AFF22006EFF2D005FFF0A0086FFC5FFB8FF
      94FFDDFF97FFE2FFBBFFBCFF010099FF210088FF00008AFFD7FFA5FFC5FFCBFF
      D3FF0F00E6FF6D0012009700510095006D007700700026007400E4FF5900D2FF
      1F00B4FF040075FFFBFF5AFFDBFF98FF9EFFFAFF7AFF570088FF7900ACFF5300
      EBFF2C0008001C00E3FF0000B1FFD1FF93FFA3FF88FF9EFF7CFFC6FF81FFC6FF
      9EFFB3FFA5FFA8FF96FF8FFF9BFFA1FFA3FFDBFFA2FFEAFFCBFFC9FF0800C9FF
      2400100010006E00FAFFBC001000CF003B0093007D0033008E00E0FF3E0094FF
      DDFF57FFA6FF36FFA8FF3BFFC7FF71FF040081FF4C0061FF680033FF6F00E3FE
      8700B3FE8A00BAFE6400B1FE4E0097FE3F00A8FE220011FFE4FFB6FFADFF5100
      ACFFB100BBFFCE00E7FFD200FFFFD800DDFFD400B0FFCF0093FFC1008CFFB700
      8AFFD200A5FFC800CAFFA600CCFF8C00C0FF3E00D1FFFCFFE4FFEAFFE1FFC1FF
      ECFF7AFF02003AFF000032FFDAFF57FFB4FF84FFC4FFA9FFE9FFA0FF2F0086FF
      6E0092FF5F00AEFF2300C9FFF0FFDFFFEEFF0900030065002D009C006600AA00
      7D00AC00760077006D005C004F007F0012007900EAFF3400DBFF0100C1FF2100
      8EFF6F0070FFB90096FFD400C2FFAC00F0FF770012004500FAFFF8FFD2FFA0FF
      BDFF4EFFBBFF22FFB4FF33FFBAFF33FFD0FF1FFFD3FF1DFFD3FFF3FEE8FFDBFE
      FFFF03FF030018FF1D000CFF510001FF750018FF73005BFF5E00B9FF5A000C00
      4F0030005600360054003E000100480091FF540044FF520036FF4A004FFF7E00
      7FFFC000C0FFD100E2FFB500F0FF4F00FFFFF2FFF3FFF4FFC0FFFBFF9DFFCEFF
      A0FFA9FFB1FFC9FF9EFF23007DFF83008DFFBC00ADFFB700E5FF930019007A00
      16006200EBFF4F00C2FF3F00BBFF3400C0FF5400D3FF4F00F5FF1200FFFFE3FF
      F8FF8EFF040049FF150052FF140047FF0B001BFF080003FFFBFF14FFD0FF45FF
      A5FF7FFFA9FFBDFFC0FFD2FFF3FFB6FF2D00A5FF2800ACFFEBFFBCFFA9FFD8FF
      9AFFF5FFB4FF2F00EEFF57003C0043006E001C007900C5FF81007DFF720089FF
      38008CFF0D005FFFFBFF36FFDDFF59FFA8FFB7FF7FFF1E008EFF5B00AEFF4B00
      DDFF1F000F000F0007000800CEFF01008CFF010060FF06003FFF450034FF7E00
      48FF7A0055FF6E0051FF370057FF070068FF21006EFF27008BFFF1FFC9FFBBFF
      0000C9FF11001C0013007F003600C8005900D9008000A9009500590059001000
      EAFFD0FF8EFF9DFF7CFF6EFFA5FF76FFE2FF9BFF380098FF84007EFFA30034FF
      B500E9FEB800FBFE8A0027FF57001DFF320007FF0F002CFFDFFF81FFA7FFF0FF
      A2FF5F00B5FFA100DDFFA9000F00A5000E00AB00DFFFB200AAFFAD0094FF8E00
      90FF90008EFFA9009DFFA000A5FF8900A6FF2A00C6FFA7FFF2FF6CFFFAFF44FF
      F1FF06FFF5FFDBFEFAFFD6FEECFFE9FEDAFF08FFE1FF33FFF2FF55FF270051FF
      71004AFF81005EFF510072FF0D0093FFEFFFC4FFEBFF2400EDFF98001000C700
      3400D4002B00C0002100950017008D00EAFF8800C4FF4000B4FFE2FF9EFFC5FF
      78FFDBFF5AFF0E0070FF450098FF5600C9FF3100FFFFF8FF0D00C8FFE9FF98FF
      B1FF6EFF93FF47FF84FF4EFF77FF6DFF8BFF5FFFACFF46FFBBFF13FFD4FFCFFE
      0100D9FE11001AFF1E0039FF40003DFF62005FFF7600A7FF7600F9FF7D003800
      7D0048008D001F009D00F1FF6700F5FFFFFF00009FFF0A0081FF17009BFF4200
      C6FF93001000BC006300AB00830066008B000C008300F3FF400001000800D0FF
      FDFF78FFF8FF5FFFE9FF7EFFC8FFC5FFC8FF2100DFFF56000D00440053001100
      6A00F8FF4F00F3FF2300FDFF1300040010001B000B0046001900460022003000
      04000800F0FFBDFFF8FF9FFFE8FFAEFFD8FFA2FFDBFF75FFD9FF5AFFD3FF5CFF
      C0FF70FFBEFFA0FFC8FFCDFFE9FFC1FF21009AFF2800A1FFF6FFC2FFAFFFE2FF
      9EFFF7FFC4FF2300EDFF6F00310088007800630089001C008900BBFF89007EFF
      59007AFF240061FF0B0030FFEBFF48FFCAFFA2FFA0FF0C0091FF7100A5FF9800
      CEFF7300030034000C000A00E8FFDAFFACFFA8FF7EFF94FF57FFB6FF27FF0100
      24FF320049FF430057FF370068FF050092FFEAFF95FF080098FF1400BDFFFAFF
      DBFFFEFFF4FF2000060043002A0063004A0068006C002D009000C6FF6E007AFF
      120044FFB2FF1DFF88FF11FF9BFF1FFFCAFF51FF230075FF8B0064FFB6003BFF
      C500FCFED400E3FE9B0020FF450051FF08004DFFD6FF61FFB6FFA9FF95FF0700
      8DFF6B009EFFB200CBFFBB000F009A001D009500F5FF9A00B8FF830094FF5900
      8BFF40007BFF560086FF6800AAFF5B00B5FF3700C0FFDDFFDDFF83FFD1FF62FF
      BCFF3FFFC3FF07FFC6FFEFFECFFF00FFD2FF20FFE2FF5CFFF5FFA5FF1500D0FF
      4500DDFF4300FAFF16001900D9FF2B00AFFF4700A3FF7100A0FFA600CDFFC500
      1500C5002A00B700270097003C0089002C00A20006009F00FCFF6400E7FF3C00
      CEFF4A00B4FF7200AAFFAE00BAFFCA00EAFF8E003E0015006200B1FF4C006DFF
      19002EFFEBFF0AFFC9FF0CFF99FF33FF8DFF5DFFA9FF6EFFB8FF61FFCCFF28FF
      FFFFF2FE100006FF080038FF220049FF370061FF3D009DFF3100E3FF1F002200
      1300420015003B002B0017000A000300B4FF0D0068FF16003AFF1E0032FF3900
      42FF71007AFF9D00D7FF9B00120071002A0026004300E9FF2300EAFFDBFFEFFF
      B4FFC6FF9DFFA7FF94FFB2FF8FFFD9FF94FF1700A5FF5400CCFF62001C004300
      45002C0030002D0007003400E5FF4600D5FF5D00C5FF7100CCFF6F00EBFF4F00
      ECFF1200E3FFAEFFF5FF52FFE9FF48FFC8FF59FFCDFF45FFDBFF39FFEBFF44FF
      E9FF53FFEAFF7FFFF4FFB6FF0000CBFF2E00C5FF3200C9FFFFFFD9FFCEFFD4FF
      C0FFBCFFCCFFBBFFDCFFE4FF09000B00540014007600F3FF6E00B1FF760078FF
      5C006DFF26006DFF15004EFF04004AFFE8FF8FFFC8FFF0FFB4FF5300AFFF9500
      C5FF9500FCFF6E000D004500EFFF2800C8FF1C00A4FF1F007CFF390047FF6700
      2DFF8F003BFF980045FF83004EFF510074FF0B0082FFF8FF77FF100096FF0900
      C8FF0000FAFF110023002D0046005E0065007D0081005F00A90015009000BEFF
      2C007AFFD2FF53FFA1FF42FF97FF4FFFACFF7AFFEEFFA6FF4F00B1FF9D0097FF
      C1005AFFD70024FFB2002EFF4A004FFF010043FFD9FF3CFFB2FF73FF8EFFCAFF
      8BFF2E00B0FF7F00EAFF95003B008E0063008E0040008D0008008200DFFF7000
      BDFF5C009DFF4F0099FF3B00C0FF2200DBFF0000E3FFBAFFF3FF55FFE3FF18FF
      ADFF09FF99FFEBFEA2FFD5FEB8FFE1FEDAFFF9FEFFFF20FF210063FF350097FF
      5600BEFF5400E4FF1A00FDFFDBFF2700ACFF51008FFF7E0080FFC30092FF0701
      CCFF2601F8FF0E010400D6001C00910011006400D2FF4C00B7FF0D00B4FFC8FF
      9EFFBEFF87FFDDFF7CFF10008AFF4000B9FF33000C00FAFF4000B6FF300064FF
      0B0025FFE4FFFEFEB5FFF6FE7DFF0DFF5AFF33FF75FF55FFA5FF61FFC6FF55FF
      FAFF33FF150029FF010054FF0F006BFF340075FF4400A0FF4100C2FF4300D1FF
      4800DBFF4900C6FF5B00A3FF560096FF190094FFDDFF9EFFBAFFB9FFA8FFE7FF
      ACFF2B00CCFF6E0012008B005F006D0089003200B000EBFFA700C0FF4A00B9FF
      FFFF9BFFD6FF71FFADFF75FF86FFA1FF79FFE1FF8FFF2100B9FF37000F003000
      500024004C000900310000001E0019000B003E00EFFF6700D4FF9100CFFFAB00
      D2FF9900CFFF6600E1FF2200DEFFF5FFB3FFF3FFB3FFD6FFD8FF94FFECFF70FF
      F3FF70FFFFFF81FF0B00A9FF1200C6FF2F00D6FF3500FAFF05001500D3FF2300
      C5FF2600CAFF1900D8FF1800F7FF23002B0017005600E3FF5900A1FF680064FF
      690042FF2F0042FF07003CFFFFFF3EFFE6FF85FFC0FFE4FFADFF1F00ADFF4600
      B8FF4300DCFF1800F8FFEAFFE6FFB4FFC0FF97FFAAFFA3FF98FFC2FF7AFFECFF
      55FF110049FF37005FFF470072FF400097FF1D00B4FFF6FF9BFFF8FF9BFFFBFF
      CEFFE2FF0000DBFF1A00E4FF3700E5FF4E00EEFF5200DDFF6200A4FF5D0073FF
      1B003CFFD2FF12FFB6FF0FFFB2FF24FFC2FF57FFEEFF9BFF3700C2FF8F00ACFF
      C00088FFCD0079FF9F0084FF2400A5FFC5FFACFFA2FFACFF8BFFD7FF74FF2300
      81FF5F00B1FF7D00DEFF79001D006C00550079004300780008006A00E2FF6500
      C5FF6000A9FF63009EFF5D00ACFF4C00D1FF2C00E9FFF0FF010099FFF8FF48FF
      B2FF1BFF82FF01FF93FFEAFEC1FFF6FEE6FF28FF09005AFF3000A0FF3F00E1FF
      4D0000004F00240017003900C1FF42008FFF560081FF630079FF8D007EFFC800
      A1FFE900E4FFDB001E00A7005000740065005E0039006100150057000D003700
      FCFF3200D7FF4400C1FF4A00D4FF4900F0FF28002600E1FF5E00A2FF5B0054FF
      25000BFFF7FFF2FECDFFECFE9BFFFEFE7AFF23FF7CFF4FFFA1FF72FFC8FF89FF
      FAFF8FFF21008AFF0F0090FFFDFF97FF0B00A5FF1400D1FF06000600FBFF2000
      090032000F002E001D0004002A00E9FFFCFFD6FFA8FFC2FF7BFFD5FF72FFFDFF
      67FF3C006AFF7F008AFF9A00CEFF9000140076004F004F005B00270017000900
      CEFFDEFFA0FFACFF7DFFA5FF54FFCBFF40FFF6FF6DFF2700ACFF5000F3FF6200
      33007B003A00850013006D00FFFF6000F3FF5700D1FF5B00AEFF63009DFF4B00
      A4FF2300B2FFFFFFCEFFCFFFD8FFA8FFB6FF8FFFAAFF68FFC9FF3BFF000029FF
      1F0046FF1F006DFF250093FF2300AFFF2900A7FF3800B9FF2600D2FFF2FFC4FF
      DAFFBCFFE9FFB4FFEEFFB8FFECFFC5FFF8FFB6FF150096FF320070FF52004AFF
      600033FF33002FFF04002EFFF9FF38FFF2FF70FFD5FFC8FFADFF0600A2FF3C00
      A0FF6100AAFF5400C9FF5600D1FF5900AFFF43009AFF4A009CFF4F007CFF5A00
      4EFF6E002EFF7B0028FF910031FF9C004AFF8E0068FF760059FF72004EFF6A00
      6DFF4E00A8FF3B00DDFF2D00FBFF10002400F8FF3F00E3FF4C00BAFF5800A4FF
      3B009BFFF8FF81FFD2FF81FFD1FFA7FFD1FFE3FFE6FF1900160017006600E6FF
      AB00B9FFCC00A6FFB90098FF51008FFFE7FF87FFADFF86FF93FFB1FF8AFFF0FF
      8DFF1800C5FF38000B00470045003D00770040006B00450027002100F5FF0400
      E6FFF9FFD3FFEEFFBCFFE1FFB5FFBBFFC0FF98FFCCFF7EFFD7FF52FFCFFF1AFF
      91FFEDFE5FFFC5FE68FFAEFEA2FFBDFEE0FFEDFEFFFF2AFF2F0069FF5800A4FF
      6300C4FF5E00EEFF27003600C7FF590082FF73007CFFA40089FFE1008EFF1601
      9BFF1601C6FFE800F5FFA9001B0068002C00340001001C00CDFF0100B7FFE1FF
      B3FFE3FFA8FF0D0090FF2F009EFF2F00C5FF1400F4FFD1FF2F0094FF460060FF
      230016FFF0FFF4FED2FFFCFEAFFF12FF86FF33FF6DFF4FFF72FF79FF94FFADFF
      C9FFD1FF0100D7FF0800C6FFF5FFA5FFFCFF90FF1100A0FF1800C8FF0600E7FF
      0D00EDFF2800E4FF4400B6FF6C0091FF6C0091FF37008DFF0B00A6FFFFFFEAFF
      F5FF3000EEFF5A00000059003D003D0087001900BC00F7FFC800D1FF8400AFFF
      1F0084FFD6FF55FFA3FF4FFF81FF77FF66FFA2FF8AFFC7FFDEFFEBFF2400F8FF
      63000A007A002F0059002D0035001E0026002F000D005D00E1FF8D00BAFF9800
      B4FF8A00C2FF8300D3FF7D00DEFF5700B9FF1E008AFFCDFF91FF79FFBDFF52FF
      EBFF64FFEEFF8DFFF2FFAEFF0400D0FF0700E8FF0F000C0000003B00D6FF3800
      BCFF1C00D1FF1800F5FF19000B0009001900D8FF380098FF5B0070FF730061FF
      7F005CFF550068FF1B0077FF06007EFFFFFF98FFEDFFCBFFC2FFF9FFACFF1000
      B6FF1700C4FF0400DDFFFFFFE4FF1200C9FF0600B4FFF0FFC0FFFAFFCCFF1300
      B6FF2F0088FF47006AFF570063FF67006CFF710091FF64009DFF4C0092FF2500
      A3FFEDFFC7FFD1FFE4FFDCFFE2FFD1FFE2FFA7FFF8FF84FF08005AFF1E0039FF
      270033FF080025FFE4FF29FFDEFF68FFEDFFBDFFFFFFF5FF1800F7FF5000DAFF
      9300CEFFAD00E5FFA100FBFF51000800E2FF08009AFFF4FF7AFFECFF7CFF0B00
      7DFF2A009EFF2800EBFF280033001D00690017006A0030002E003700E4FF2A00
      BCFF2E00AFFF3200A8FF1800A0FFDFFFB1FF93FFCCFF58FFD7FF4BFFE2FF38FF
      BBFF13FF7DFFEDFE76FFD0FE97FFE7FEC4FF3BFFDDFF8FFFF5FFBDFF1B00DEFF
      2800F2FF1D001700F5FF5800A7FF7A005AFF91003CFFC30049FFFE0061FF1D01
      7EFF0501B0FFCD00E9FF9A000A007F002200690010005800DAFF4700C9FF2400
      D9FF0D00ECFF2600E4FF4300DCFF3200F5FF12001900DDFF3E00A0FF480086FF
      320061FF090036FFF2FF29FFECFF36FFDBFF4DFFB4FF68FFA2FF82FFB6FFAAFF
      CFFFE9FFF5FF0C00FCFF0D00E2FF0300DFFFDEFFEAFFCCFFEFFFF4FFD3FF1B00
      BBFF1000CCFFEBFFEBFFB8FF05008AFF0A007EFFE7FF73FFB1FF86FF91FFCDFF
      8AFF23008DFF640092FF7600B8FF6500FAFF3A0029001A004F00FAFF3D00D1FF
      EEFFACFFB1FF81FF91FF68FF7FFF8AFF6CFFCCFF72FFF3FFAFFF1A00FEFF3800
      4700480068006C004E006F0015005400ECFF4700D9FF4F00C1FF5C009CFF4F00
      93FF2600ABFF0500C0FF0D00E4FF0D00E4FFEBFFB7FFB1FFADFF5EFFCFFF2CFF
      FCFF4BFF0A007CFF080084FF190089FF270094FF2100ACFF1000CEFFECFFCEFF
      BBFFC8FFA4FFD1FFB5FFDDFFDFFFE2FF0100BBFF280075FF4F003DFF54003BFF
      4F0059FF350077FF01009BFFE7FFA2FFEEFFA3FFF5FFDAFFDDFF3000BDFF5D00
      BEFF6F00D4FF6E00EBFF6C00EEFF9000D9FF9900B8FF8200A2FF66009FFF4C00
      99FF530078FF66005EFF72005AFF820052FFB20066FFD1007CFFBE0077FF8600
      92FF2200C2FFCCFFEAFFBCFFF3FFC5FFF9FFA2FF1A0072FF3B004EFF53003EFF
      62005CFF500077FF1E0098FFFBFFD9FFF5FF1800FAFF3D000400330029000800
      6800DFFF7E00DFFF7A00EFFF4F00F7FFF1FFFFFFA5FFE2FF8DFFBDFF98FFD6FF
      9CFF0E00A5FF1800DFFF120033000C007A00EFFF9A00E7FF8300D8FF4000C6FF
      0100C5FFE5FFB6FFDAFFACFFC8FF96FFC3FF5CFFD4FF27FFD2FF27FFD1FF34FF
      C7FF1EFF9CFFFBFE89FFD3FE9EFFC9FECDFF14FFF2FF82FF0800B4FF2A00D1FF
      400000003E0034001F008600E3FFC3008DFFF4004AFF310140FF510166FF5501
      92FF3401B9FFE500E2FF8300EDFF4F00F1FF4800EAFF4300B4FF43008DFF2600
      9AFFF5FFB8FFF8FFC1FF0D00C2FFECFFDAFFC0FF010094FF2E005AFF4F0047FF
      4F003BFF28002CFFFCFF31FFE2FF3BFFCFFF62FFB1FF8CFF9EFF9FFFACFFADFF
      A7FFE1FFADFF1900D3FF2100E4FF0800F1FFD2FF050099FF0F009CFFF9FFC9FF
      E0FFBBFFEFFF8EFF0B006DFF2B0047FF4B0042FF56004EFF360066FF0B00A3FF
      FCFFDAFF0D00FCFF26001200440006007500D3FF7D00BCFF6700BBFF4800AAFF
      0100A7FFBBFF8DFF96FF57FF8EFF61FF7FFFA9FF72FFD6FF99FFEFFFE6FF0D00
      340017006000350050005B0017007100DEFF9000BBFFA200A5FFB10090FFB500
      89FF9D00A8FF7200B4FF6700B6FF7600BDFF5C00A2FF1C008FFFC0FFA8FF72FF
      D6FF79FFE7FFC9FFECFFEEFF0800F0FF190006001D0001001B0000000A000500
      E2FFFFFFC0FF0A00CCFF0400FEFFE9FF3500CAFF5D0092FF810047FF77002CFF
      4F004AFF33006BFFFDFF92FFC9FFA5FFC5FF98FFDDFFA5FFD5FFD8FFB4FFEFFF
      B1FFE9FFBFFFEBFFE2FFDBFF0100DDFF0700F3FFECFFFCFFC8FF0300BDFFFAFF
      C3FFFCFFC2FF0B00B4FF0800B8FFFEFFACFF190093FF5600A8FF5D00BAFF2A00
      C0FFDEFFD1FF8CFFDFFF6DFFDAFF8BFFD0FF88FFDDFF53FFEBFF2EFF00000CFF
      1C000BFF2A0038FF170064FFFAFFADFFEBFF0000ECFF3B0005005D0033005A00
      720039007F00370057005B0032007200EEFF7600A2FF54007CFF14007DFFEEFF
      79FF010075FF0B00ABFF0000FBFF1000470016007D001F007A00320042002800
      FAFF1400C6FFF3FFADFFCDFFAFFFAAFFCEFF75FF080034FF18001DFFFAFF3FFF
      E9FF59FFCBFF56FFAAFF42FFACFF2EFFC9FF47FFD2FFA4FFC5FFEEFFD8FFF8FF
      E9FF0C00EEFF2200E6FF4600C6FF85008BFFB9004FFFF40046FF0E016FFFFA00
      AFFFDE00E9FFAD002200580032001B00190012000B000F00F5FF0800E4FFF8FF
      F3FFDDFF1D00CEFF2700DBFF0900D9FF0400C0FF0F00B8FF2900A0FF4A0087FF
      530086FF330078FFFFFF73FFE1FF76FFD1FF7AFFC8FF95FFC5FFB1FFCCFFCDFF
      C0FF06009DFF5400A7FF7E00C3FF7D00D2FF6000DDFF2F00EBFF0600E4FFFCFF
      C5FFE2FFC0FF9CFFC7FF6DFFD3FF47FFFBFF3AFF1A0067FF04009CFFCEFFE7FF
      B0FF3400ACFF5800C3FF6200F5FF4A00340006004200D6FF1D00D6FF0D00D7FF
      F8FFD0FFCDFFC3FFA7FFADFF97FFACFF82FFE6FF61FF270073FF4000B6FF5700
      F9FF66002B0076003B00910019008B00DEFF9000AEFF9A0086FF7D0077FF5F00
      90FF3700CAFF0000EBFFEBFFDFFFFFFFDAFF0800CEFFEFFFBEFFADFFC7FF5CFF
      E7FF2CFF040045FF0C0073FF23007FFF300093FF27009EFF1C00A1FF0A00BCFF
      E4FFCFFFB1FFE9FFA5FFFAFFC8FFD8FF0300AFFF480088FF880044FF8B0015FF
      4F001DFF150044FFDDFF85FFAFFFC0FFAAFFDAFFC9FFEEFFD9FF1E00BDFF4A00
      A9FF5800B2FF6800C7FF6300E9FF5200FFFF5B00E2FF5800A7FF580082FF6000
      73FF580068FF640069FF7D0081FF7F0084FF930061FFBE005AFFBB0072FF8900
      8BFF3B00AAFFE4FFC9FFA7FFD7FF98FFC7FF97FFC0FF75FFC5FF5EFFC9FF55FF
      E7FF5AFF0B0087FF0B00BDFFE9FF0800D1FF6600CCFF8E00DFFF890019007C00
      67004F0084002D005A0039003900400021003E00FCFF3400DFFF1400D2FFEEFF
      CEFFDDFFC0FFD0FFCDFFAFFF0A00A2FF51009BFF950099FFBA00ABFF980099FF
      40007CFFEBFF6FFFAFFF4DFF97FF2FFFAAFF22FFE4FF03FFFCFFF3FEDCFF06FF
      BDFF18FFA5FF22FF92FF16FF99FFFBFEB8FF03FFD2FF53FFD0FFB6FFDAFFE4FF
      FAFF0B0001004200F8FF7100E1FFAC00ADFFE0006DFF0E014FFF3B0164FF2A01
      8EFFED00CEFFB1001900630030002700FFFF2600CEFF3200B1FF3700A3FF2D00
      B0FF0B00CCFFDBFFE7FFC1FFE6FFAFFFEEFF93FF11008EFF2B008CFF45007CFF
      5B0079FF42007BFFFFFF8BFFCAFFAFFFADFFB2FF9CFFACFF9EFFCBFFB2FFE7FF
      B1FFFFFF87FF23007AFF370096FF3600BAFF1E00DFFFF3FF0100CCFF1600BBFF
      0700A6FFF3FF73FFF1FF48FFF5FF2BFF120017FF490028FF5D0050FF4F0085FF
      4800D2FF460000004800FBFF6400E4FF9A00B4FFA90089FF6D0096FF2800ACFF
      FBFFBBFFCFFFBFFFACFFA9FF97FF91FF8DFF9BFF7AFFB9FF82FFC9FFC5FFEDFF
      0D001E00480045007A006D00740089003100A000E6FFC300A6FFC00086FF8900
      9CFF5B00DAFF2C0005000D00F3FF1800D8FF1C00C1FF1A00A8FF0800A1FFDFFF
      ACFFBDFFCCFFC2FFDAFFDEFFE4FFDFFFFCFFDCFF0400E4FF0300E9FF1300F7FF
      0B000100E2FF0A00CCFF1E00D2FF1000F5FFDDFF3700BBFF880098FFAD005DFF
      7F003FFF370047FFF8FF6FFFCAFF9AFFC5FFADFFD9FFB6FFEDFFC5FFE0FFD5FF
      D1FFD4FFE4FFE2FFFFFFFDFF1C000600430009003E00060001000400CBFF1200
      AEFF1400A7FF0100C0FF0000EBFF0900FCFF1200CDFF33009DFF440094FF3900
      A7FF1900C5FFE2FFD4FFB6FFD5FFA2FFBEFF89FFA2FF55FFA1FF2EFFA5FF20FF
      B1FF1BFFDFFF33FFFFFF77FFF2FFDCFFE7FF4900E8FF9A00F5FFB5001900B600
      4F00A9006C008B00430082000D007E00EBFF7800CEFF7300B9FF5100ABFF1E00
      A4FFFAFF93FFE9FF91FFD6FFC9FFD2FF1B00E4FF6700EEFFA800F1FFAC00DDFF
      6300ADFF100090FFD1FF78FFA9FF47FFADFF25FFDDFF14FF080008FFF7FF25FF
      D2FF54FFB5FF7EFF9EFF8FFFA1FF78FFADFF72FFBAFF99FFB6FFC9FFADFFE2FF
      BDFFFFFFC0FF2D00AAFF5100A2FF76009AFFA40073FFD90058FF14015DFF2501
      7CFFF100B6FFA100FCFF5B0029001A000F00F4FFE0FFE7FFC5FFF0FFB1FF0000
      B3FFEFFFC4FFC5FFDCFFAAFFE7FFAAFFEBFFACFF0100C2FF1700E3FF2600DEFF
      4300CBFF4C00BDFF1F00BAFFECFFCAFFD0FFDAFFCAFFE0FFD1FFFBFFE6FF2800
      FFFF4400E0FF6400AFFF7D0099FF7D009AFF6F00B9FF4000D9FF0B00E8FFE6FF
      DDFFAAFFC0FF4BFFB0FF0AFFA7FFFBFEA3FF0CFFC5FF3BFFF0FF7AFFF6FFBDFF
      F3FFFCFFEDFF2400E9FF1600FFFFE6FF3200BAFF66008EFF50007EFF11008AFF
      E1FF9EFFB6FFC0FF9BFFCFFF88FFCDFF79FFD7FF68FFE4FF64FFEDFF8DFF1000
      D0FF480010006500530072007200790044007000F8FF7400BDFF7700A3FF5800
      AAFF3100D8FF19001400F8FF1500E6FFF5FFE2FFDCFFD7FFC5FFCEFFC7FFA0FF
      D9FF6DFFEFFF68FFF6FF78FFE6FF77FFE1FF7EFFE4FFA2FFDEFFC3FFE0FFE6FF
      DEFF0A00B8FF170091FF16008CFFFFFFACFFCCFFECFF97FF3F0076FF840053FF
      7A0044FF3B005EFF010092FFD1FFDCFFBDFF1400BCFF2C00BEFF4200BEFF5100
      C0FF4200D2FF4500E9FF6700F8FF6A0010005D001E005200F3FF4C00AEFF6500
      7EFF86006BFF8E0077FF82009CFF7400C7FF5D00B9FF4C0092FF4B0095FF3B00
      B1FF2800DCFFFCFFFCFFC1FFFFFFA3FFEDFF85FFCEFF50FFB7FF37FFB4FF3FFF
      B9FF3CFFD8FF53FF010099FF0B00EEFF080040000D007B0012008A0021007B00
      3B006E0065005A00640054003B0064001C006C00FFFF7B00EAFF6700DDFF2000
      CEFFE5FFC4FFB6FFC6FF7BFFEDFF61FF2F0078FF690089FF940097FFA9009AFF
      8A0078FF47005AFF03004BFFC9FF34FFAFFF19FFC0FF02FFF0FFEFFEFDFFF6FE
      E3FF18FFD3FF34FFBDFF55FFB8FF6DFFC9FF77FFE0FFA0FFF3FFD9FFEEFFF4FF
      E7FF1B00DDFF6200C9FF8E00C0FFAD00C2FFDB00A6FFF8007CFF13016EFF2201
      7CFF0501A2FFD200D5FF9D000A00670011003A00F1FF2500D6FF1300B0FF1800
      99FF1000A5FFD8FFBDFFAFFFD5FFA0FFE4FF8DFFF9FF91FF0E00B4FF1A00BDFF
      2600C5FF2D00D8FF1400DAFFE2FFE4FFBCFFF9FFA7FF0D00AAFF1E00BEFF2600
      E0FF1E00DCFF1200ADFF19009DFF1600AAFF1700D2FF19000400FBFF1E00DDFF
      2100ACFF090048FFECFFEFFEDAFFCDFEDBFFC4FEFBFFDFFE32002CFF580074FF
      5F00AEFF5900DCFF5100E0FF5B00C6FF7200AAFF8E008CFF85007DFF480089FF
      120094FFD8FFBBFFA5FFDAFF8DFFBEFF79FFA6FF6BFFACFF62FFB8FF7EFFE5FF
      BEFF39000400770037009A004F00BA003300C300F0FFBB00AEFFB4007BFF9700
      6CFF670081FF3300B2FF0300CDFFF5FFBBFF0C00ADFF23009EFF320099FF2D00
      AEFF0100CAFFDDFFDCFFDAFFD8FFCCFFDBFFC4FFECFFE7FFFCFF040009001800
      10003B0004003A00E6FF2300D6FF1500DEFFF2FF0600C4FF3B0093FF6F0061FF
      840042FF67003AFF430036FF0B0048FFDAFF6DFFCDFF7BFFCFFF8EFFD6FFB7FF
      DDFFCDFFEFFFDFFF010006000D001200160000001C00F0FF0E00D1FFEFFFC1FF
      D3FFD3FFC4FFE9FFCEFFF4FFDEFFECFFEFFFD4FFF1FFC5FFD2FFD2FFC5FFE7FF
      C9FFFFFFD1FF0D00E2FFE4FFF0FFA5FFEDFF7EFFCEFF44FFAFFF0EFFA0FF05FF
      A0FF17FFB6FF4DFFE2FFBDFF06003000160083001700C5001400E4001C00E500
      2100D2002700B0002B0095000D008E00F2FF8400D5FF8900B1FF93009FFF6B00
      98FF320099FF090099FFD2FFB5FF9EFFF0FF9DFF2800B4FF5800C6FF7A00D0FF
      7A00BBFF560094FF1B007FFFD8FF66FFB7FF49FFB6FF36FFCCFF29FFE3FF38FF
      DFFF69FFDAFF97FFCAFFBCFFB5FFDCFFB6FFD8FFC7FFC0FFD8FFB5FFD1FFB0FF
      C1FFC1FFB6FF0100A7FF4B00A2FF8600A3FFC50099FFE50087FFDE007CFFD700
      86FFB200B5FF7700F4FF37003000ECFF5D00B6FF5B00A9FF4000A5FF0F00ACFF
      DFFFB7FFD5FFA0FFE5FF83FFF6FF95FFF6FFACFFFFFFB4FF1500CCFF2800DBFF
      3100D8FF3000DDFF2000E1FF0100ECFFE5FF1700D5FF4B00DDFF7F00E8FF9600
      EBFF8100E5FF7500C2FF8300A9FF8400A7FF7D00A7FF7100B2FF4600CBFF0000
      DAFFC2FFC7FF73FFA5FF17FF96FFE6FE9AFFE3FEB7FF07FFE7FF56FF0F00A9FF
      2100DFFF2800070027000C003600F3FF4000D3FF4000A8FF45008AFF370092FF
      1F00AAFFF7FFD2FFBCFF0E0091FF1C007EFF030075FFFDFF68FFFBFF72FFFBFF
      A6FF1C00E4FF3E001C0056004400790049008B0029008B00FAFF9100C7FF7F00
      AFFF5C00B0FF3200C0FFEDFFD2FFB4FFD7FFB2FFE1FFC5FFE9FFCFFFE0FFD0FF
      DCFFAFFFE4FF82FFEAFF77FFD9FF76FFC8FF70FFCCFF8EFFD1FFCCFFD2FF0F00
      D5FF4700D2FF4F00C3FF2100B4FFF2FFB5FFC4FFD8FF99FF040081FF340062FF
      650054FF710073FF5E0092FF2C00A8FFE2FFDAFFAEFF0000A0FF0B00A7FF2700
      AAFF3A00AFFF3400C5FF4600DAFF6600E4FF7000E7FF7400E4FF6900DBFF5100
      CCFF5400BCFF6000BAFF6C00B6FF7400B1FF4A00B7FF0D00B1FF0000ACFF1000
      AFFF2500AAFF3100B3FF1400CEFFD3FFDAFFACFFB8FF92FF86FF67FF6AFF49FF
      61FF49FF74FF70FF9EFFC2FFC9FF1300EAFF3A00010065000D0093002200A900
      2B00B10028009A002D007700280079001F007E000D006B00E8FF5B00D2FF3000
      DDFFE5FFF6FFB1FFFDFF86FF01004DFF210039FF450049FF65005AFF820075FF
      830081FF63006EFF2D005AFFF5FF33FFD1FF05FFBCFFECFEB2FFCCFEBEFFBFFE
      C9FFF9FED2FF4EFFDAFF99FFCFFFDAFFC3FFEEFFCEFFCEFFE2FFC0FFD9FFD2FF
      BDFFDAFFB4FFEFFFAEFF2300A7FF5F00A2FF9F0099FFC8008CFFC3007DFFB900
      7BFFAD00A0FF8E00D5FF6B0007002A003A00E1FF5000D4FF4A00E6FF2B00DFFF
      F6FFD6FFCEFFC4FFCAFFAAFFDAFFB8FFE1FFD3FFE7FFD8FFFBFFE5FF0B000100
      120017001600330008004500E9FF3A00D1FF3900C4FF4300CCFF4300D8FF4200
      D3FF2C00D0FF0C00C4FF1800BAFF3B00BCFF4B00B3FF4F00ACFF3000C0FFE4FF
      D9FF94FFD3FF4FFFC0FFFBFEC8FFB5FEDAFFA5FEF0FFCDFE190028FF3F0086FF
      5100B6FF6200CBFF7100DDFF7A00E7FF7900EFFF6000D3FF560093FF500077FF
      410083FF230099FFE6FFC5FFA4FFE7FF7EFFDBFF81FFDAFF88FFF5FF8AFF0100
      AAFF0B00DCFF2D0009005A003A008B005100B0003A00A90012008B00E1FF6800
      BBFF4200A9FF28009DFFF9FFA8FFBCFFC0FFBAFFDEFFEBFFF6FF0F00F1FF2200
      E4FF0C00E4FFD0FFEDFFACFFE6FFACFFCCFFA9FFC2FFB6FFCCFFE1FFD6FF1F00
      ECFF6000FBFF8300ECFF7600DEFF5600DEFF3300EFFF00000E00CEFF300091FF
      580046FF78001DFF89001DFF7F002CFF48004EFF000070FFDDFF86FFE4FFAAFF
      EBFFD8FFE4FFF0FFE7FFFCFFF3FFFEFFFEFFF3FF1800F0FF2E00FCFF2500F8FF
      1A00EBFF1600EAFF1100F5FF06000E00F0FF0000E7FFC9FFE1FFC3FFD8FFFAFF
      D6FF2700C8FF3500BDFF1200C2FFC5FFD1FF92FFC6FF83FF9BFF70FF81FF53FF
      84FF4EFF93FF83FFBBFFEAFFE7FF4F00F5FF9500FFFFC5000800E6000C00FC00
      0E0000010000DB00F1FF9E00E7FF8200E4FF8B00E4FF8800D3FF7C00BBFF6000
      B7FF2600D2FFF3FFEFFFD1FFF2FFA5FFFAFF79FF120060FF32005CFF5B0078FF
      7400A5FF6200ACFF42008DFF280065FF040049FFDBFF52FFB7FF59FFAAFF47FF
      ACFF54FFBCFF94FFDBFFD6FFE3FF0300DAFFF8FFDEFFB9FFECFF9DFFECFFB3FF
      C7FFD3FFACFFEDFFA7FF0F0099FF4C008DFF9E008EFFD4007CFFC70070FF9500
      81FF6500A2FF3E00CEFF2600F8FFFCFF2300B8FF400091FF40009EFF3400B5FF
      0400C1FFBCFFC5FF93FFB4FF99FFB3FFB0FFC9FFB6FFDEFFB7FFF0FFC8FF0400
      DCFF1A00F8FF370012005B000C006F00FCFF7B00FDFF840000008A00FBFFA300
      E9FF9F00DAFF6E00CFFF5100C5FF6000C9FF6F00BDFF6A00A4FF45009BFFE7FF
      A0FF89FFA5FF49FF98FF0FFF94FFDBFEA7FFBAFEB9FFCCFEDCFF18FF070077FF
      1200B4FF1500CCFF2600D7FF3100E6FF3300F5FF2500DFFF1A00A7FF12008AFF
      0600A7FF0100D7FFE5FF0000A6FF110075FFF0FF77FFCEFF93FFC6FF9EFFC0FF
      A8FFBBFFC9FFCBFFF0FFF9FF210042004C0094004800B20027009C000B007600
      EFFF4500D2FF2100C6FFEBFFD2FFA3FFE7FF88FFFBFFB2FF1B00EEFF2A000B00
      1900FAFF0500B6FFFCFF85FFEBFF8DFFBCFFAFFF97FFC9FF95FFDDFF9CFFFAFF
      AAFF3000C0FF7100BCFF8100AAFF5D00AEFF2400BEFFE9FFDAFFCEFFFAFFB8FF
      1E008DFF3F006BFF4A007DFF5000B1FF3100E8FFE4FF1000A8FF0A009EFF0000
      A8FF1800A5FF3700A1FF4500AFFF4300C9FF3C00F0FF490017006F0017007C00
      0400620001003E00F8FF2600DFFF3400C1FF2A00ADFFFAFFADFFD5FFB0FFE4FF
      C1FF0F00D1FF2C00C6FF2E00C4FFFCFFCEFFC0FFD0FFA8FFB1FF8EFF91FF61FF
      91FF3BFF9EFF39FFC6FF6AFF0100C9FF1F0024001F006700280099002E00B300
      2700CA001300C40001008E00FCFF5300F5FF3B0002003B000C003900F3FF2F00
      E1FFF8FFF3FFB6FF190096FF220081FF140067FF19004BFF280048FF440070FF
      6200B0FF5900C1FF380091FF250052FF120027FFEFFF2CFFC9FF2CFFBEFF14FF
      C9FF12FFD9FF54FFFCFFC4FF1C0017001500300004000400FDFFD2FFF4FFE2FF
      D1FF0800ACFF1200A2FF17009AFF370099FF6900AAFFAD00B0FFCD00A5FFB000
      AAFF8900C3FF5F00D9FF4C00F0FF32001100F5FF2E00C4FF3200BAFF3300CEFF
      2600E9FFEBFFF5FFB6FFD7FFAFFFB6FFC2FFD3FFC2FF1100AFFF4100A6FF5A00
      ACFF6000C7FF6300F0FF7A0003008400F9FF6800FCFF48000B00360006004A00
      F0FF5F00E1FF4C00DFFF2A00D6FF2300D3FF3B00D8FF4200C3FF1B00B3FFB4FF
      BCFF36FFCEFFF8FED1FFE0FECEFFBDFEE2FFA7FEF9FFB3FE1700EBFE3E0055FF
      4F00B2FF4800D8FF4C00EDFF5B00EEFF5900F0FF4900E4FF3F00B1FF3E008EFF
      2F0099FF2800C6FF2700F1FFF9FF0F00C3FF0100AFFFE4FFBAFFEBFFBCFFFBFF
      A8FFFAFFA8FFFEFFB3FF1D00D1FF540000009B000E00C800F1FFAE00D2FF7100
      BDFF33009EFF120083FFFBFF82FFCFFF9BFFBAFFACFFD4FFC6FF0E00EAFF3B00
      E5FF4500D2FF0D00D0FFB4FFD5FFA2FFC4FFC9FFA5FFECFF9FFF0500A9FF2A00
      C1FF5C00E5FFA600F5FFD500E7FFAD00DFFF5C00F5FFFCFF0E00B1FF25007EFF
      48003DFF70000AFF7D0006FF7E0034FF760072FF3B009EFFF2FF91FFCEFF69FF
      CBFF72FFC5FF97FFB8FFAAFFBDFFB0FFCFFFB6FFF5FFCDFF2800F7FF45001300
      3B00FCFF2B00DDFF2400C9FF0E00CBFFE9FFD4FFCEFFBBFFCDFF9BFFC9FF95FF
      C9FFB2FFDBFFDFFFD0FFFCFFB6FFDFFFB2FF96FFBBFF7FFFB6FF8EFFAAFF8DFF
      B1FF88FFBCFF9CFFD8FFC9FF0D001F002D0095002300E8001400140114001F01
      09001F01ECFF1501DAFFCE00DFFF7D00DFFF5C00E2FF6600F7FF8200F0FF9200
      DAFF6700DCFF0B00F4FFD6FFFEFFC7FFEFFFAAFFEEFF7EFFF5FF6BFF08007DFF
      2D00B6FF3D00F0FF2E00EAFF1700C6FF0600A8FFE6FF9EFFB8FF9EFFA0FF77FF
      AAFF53FFC0FF5AFFE1FF8BFF1300D2FF2700FDFF1900E6FF0800AAFFF8FFA5FF
      D3FFCEFFA2FFECFF83FFFAFF70FF080070FF1D008EFF4A00A7FF7E00A8FF7800
      AFFF4C00CCFF1A00E9FFF3FFFFFFDAFF2300B1FF4E0090FF5E008DFF5900A0FF
      4F00C0FF1E00D8FFDBFFBEFFC0FF83FFC5FF8BFFC3FFD5FFAFFF1000A9FF2E00
      AFFF4A00CEFF60000C007E003E00A30043009D002E008E001F008A0007009700
      E2FFB000C9FF9900C6FF6C00C0FF5600B4FF5100BDFF5100BDFF4700ACFF0000
      A5FF8BFFAAFF49FFAAFF40FFA0FF2FFFA9FF0CFFB4FF05FFCCFF1DFF000053FF
      2800A5FF2F00DCFF2A00F6FF2D000C002A001C001C00280015000F001900E4FF
      0D00DBFFFAFFF1FFFDFF1000F4FF2300DAFF0600D0FFC0FFDCFFA5FFE7FFBDFF
      DDFFD1FFD6FFDFFFCCFFFBFFCFFF2400F5FF62001000A6000800A500F6FF6E00
      EFFF3000E4FFFEFFD1FFE1FFD2FFB8FFEBFF99FFFCFFA6FF0800D0FF21000B00
      26003B000B002100EFFFC8FFDBFF95FFBEFFAAFF93FFCDFF7EFFE5FF76FF0D00
      7DFF3A00A8FF6A00D0FFA200DDFFA400E0FF6F00ECFF2D00FAFFEEFFFCFFC3FF
      060096FF230070FF2E007CFF2500A6FF2100D6FF05000A00D3FF1000AAFFD3FF
      9EFFB3FF9EFFD6FF99FFFCFFA2FF1500AFFF3300CCFF4F000800690039008300
      3D00740026004E0012002A0001000700E3FFFFFFC9FFF0FFC5FFD6FFC7FFD6FF
      C5FFEBFFCEFF0D00CDFF2F00B1FF18009AFFC2FF98FF82FF99FF77FF94FF71FF
      98FF5FFF96FF66FFA0FF82FFD4FFBDFF01002D000C008B000100BB00F0FFDA00
      DAFFE000BDFFCF00B4FF9800CCFF4800E2FF1300E6FF0D00F9FF1F000A003D00
      0C0030001400DBFF270099FF330090FF270085FF160068FF01005EFFFBFF66FF
      1A007CFF3400ADFF2D00BDFF1700A2FF010083FFEDFF69FFD6FF61FFCCFF4FFF
      DBFF39FFEEFF4BFFF6FF89FF0E00D6FF20001D0010003400F3FFFCFFDDFFC9FF
      C4FFD0FF97FFE2FF77FFDFFF64FFE3FF66FFF2FF91FF0D00C0FF4900DCFF6F00
      E9FF6300ECFF4500EBFF1500EBFFE7FFF7FFBDFF15009BFF30009AFF3200BBFF
      3200E2FF28000F0004002300E9FFF7FFE1FFE1FFD6FF1900BCFF5700ACFF7800
      A4FF8C00AEFF8E00EDFF81002E008D004A008E00450073002F00710011007A00
      EEFF8100D1FF7200CAFF4800CFFF2300C5FF1C00C8FF1900D4FF1000CAFFE2FF
      BBFF6DFFB9FF0FFFC2FF03FFC9FF0BFFD8FF07FFE3FF16FFE9FF38FF10005AFF
      380099FF4000D8FF3F00EEFF3700FBFF2300FDFF1200F1FF0B00DBFF1600B8FF
      2300ACFF1900CBFF1800EFFF1C0011000B002600F0FFFDFFDEFFCEFFD8FFD8FF
      C3FFF8FFAFFF0400A0FF0B0099FF1D00C2FF2700F4FF49000B00600016004300
      10001E00FBFFFCFFE1FFE2FFD1FFD0FFD7FFB5FFE8FFAAFFEBFFC6FFF8FFEDFF
      04001300F8FF2200DFFFE9FFCFFFACFFC7FFB4FFACFFDFFF97FF09008AFF3700
      80FF6000A2FF7000DBFF8A00050093001E006500260028002100EFFF2400B8FF
      320083FF490060FF59005EFF50007AFF460096FF3900AFFF1A00C0FFF8FF8FFF
      EAFF4FFFE9FF53FFDBFF7CFFD9FFA0FFE0FFC6FFECFFF4FF26000D006E002D00
      8B0044007D00300055001C0023000300F8FFE6FFD9FFCCFFD3FFADFFE4FF9FFF
      E4FFBDFFE4FFE3FFE7FFFFFFDBFF1200C7FFDFFFBBFF9CFFBCFF98FFB5FFB7FF
      B1FFD8FFAFFFECFFAAFF0700C7FF2A00FCFF6A001800BE001C00F1000E000801
      E9FF0301CAFFE500C2FFB500CCFF7800DFFF4C00E2FF4700E9FF5900F8FF6F00
      FEFF7800020030000C00C3FF1C008DFF150089FFFFFF8DFFEFFF8FFFDEFF9FFF
      F1FFABFF1600CAFF1F00F8FF1600F4FF0400DCFFEBFFBFFFD9FF9FFFD1FF83FF
      D9FF67FFEAFF68FFF1FF94FF0600C9FF2100FCFF200022000B00FAFFF1FFB4FF
      DAFFA0FFAFFFB1FF85FFCEFF72FFE2FF66FFEDFF79FFEEFFAFFF0400E0FF3000
      010044000C003E00050017000000E2FF0500AEFF0F008EFF1A008CFF1500A1FF
      0D00B8FF0200CCFFE0FFEFFFBBFFE3FFA3FFBBFF9CFFD0FF8FFF100088FF4F00
      8FFF7C0093FF9B00B7FFA900F8FFB8002100C6002600BC000E00B700E7FFB500
      C5FFA600B2FF8400B9FF4B00D1FF1500D8FF0300DFFF0100E9FFFDFFE6FFFCFF
      D6FFC0FFC4FF5EFFBDFF2CFFB1FF20FFACFF20FFB5FF22FFB7FF30FFCCFF45FF
      FAFF6DFF1B00B6FF2300F1FF19001E00FBFF3100DCFF2B00D3FF1100DBFFEEFF
      EEFFD0FFF5FFC8FFF5FFD5FFFBFFE7FFF3FF0A00E9FFF5FFE7FFA9FFF3FF86FF
      ECFF94FFD2FFB1FFC1FFC0FFACFFD0FFB4FFDFFFD8FFFFFFF5FF320003004200
      06003800FFFF1E00F6FF0000FFFFEEFF1500DDFF3000D8FF3B00EDFF3F001000
      4200300029004E0001003200E2FFE4FFCCFFBAFFA9FFC5FF80FFF4FF6DFF2A00
      63FF58007AFF6B00C2FF6D0008007A002A007A00280071000B005100EEFF1C00
      E4FFE4FFE2FFC2FFE4FFC0FFE1FFCDFFE1FFDFFFEFFFE9FFE9FFFFFFD9FFF1FF
      CEFFB5FFC8FFA3FFB4FFC7FF9EFFFCFFA3FF2600B0FF3E00D1FF3A0011002F00
      400035004500380026003900F5FF2F00C8FF1A00B6FF0400B8FFEFFFC9FFE5FF
      CEFFF0FFC9FF0800D6FF0B00DBFFFFFFD8FFCFFFCFFF79FFCCFF4FFFC9FF5FFF
      C4FF85FFD2FFA6FFD8FFBBFFE1FFCEFF0500EBFF25002A0030006A0024009800
      FEFFA900D4FF9300C0FF6800BDFF3B00D1FF1000E5FFF8FFFCFF01001A001100
      280026002D0012003400C2FF3E0083FF2B006BFFFEFF72FFE7FF81FFDAFF94FF
      DAFFA5FFF5FFB6FF0800DAFF0B00F1FF0700F3FF0000E7FFF5FFCDFFF6FFB2FF
      0000A4FF0800A8FF0700C0FF0400EBFF1100150010003A0000003500F3FFF0FF
      F0FFB0FFDFFFA0FFB6FFB8FFA3FFDAFF93FFF8FF94FF0600C5FF080004002800
      2E00450036004500270026001200EBFF0800BAFF0000ACFFF8FFBDFFF5FFDDFF
      FAFF08000B002D0008004F00F0FF5B00DAFF3400D1FF1800C5FF2200AEFF4300
      ACFF6600B1FF8700C0FF9C00F0FF9D002500A1003E009D003100980006009200
      D8FF7D00C9FF5600D3FF2800E4FFFFFFEDFFDFFFE5FFD9FFE9FFD3FFEDFFC1FF
      E8FF9FFFE8FF57FFEBFF1BFFE9FF0AFFDDFF1BFFE6FF3DFFEEFF5AFFEFFF66FF
      08006EFF2A0099FF3700D8FF27000C0008002800E9FF1800E5FFF1FFF5FFD2FF
      1200CAFF2A00D0FF2D00EFFF32001500260034000B003B00F8FF0D00F0FFE1FF
      DDFFD6FFB4FFE1FFA2FFE7FFA7FFDDFFB1FFD6FFCEFFD6FFEBFFF5FFF8FF2200
      F8FF3D00ECFF4000D9FF2D00CEFF0900CCFFE6FFD4FFD0FFDDFFC9FFDCFFE3FF
      E1FF0800D8FF2E00BDFF4300A9FF2800A4FF04009BFFFDFF7BFF18006AFF3700
      71FF43008AFF3E00C9FF2600160020004C0028005B002A004E001E003B00F3FF
      3400B8FF2D0094FF260086FF1E007DFF1A0080FF29008AFF2D0094FF1A008FFF
      04006BFFF6FF4BFFEAFF4BFFD4FF6BFFD4FFA4FFE7FFD6FF0000F3FF3000FCFF
      60000B006F0019004F00170014000600D7FFE9FFB4FFCBFFADFFB6FFBDFFACFF
      CBFFA8FFCEFFB6FFE6FFCCFFF9FFDBFFF3FFDAFFE1FFBBFFD2FFA0FFC2FFA6FF
      A5FFD2FF9EFF0900A9FF3400B5FF4A00D7FF4F000B006800340095003C00B900
      2700CD000300C900E4FFB700D2FFA100D8FF8600EBFF6800F2FF5B0006005100
      1A0040001D002C001E00FFFF2300C8FF1C00A8FFF7FFAAFFD9FFC9FFD4FFEDFF
      D3FF0600E0FF0B00F5FF0B0003000B0004000500F9FF0100EAFFF6FFE4FFE4FF
      E7FFD8FFF2FFD5FFF9FFD3FFF3FFDEFFF8FFF6FFFCFF0400F0FFF3FFDFFFB8FF
      D8FF7EFFCBFF66FF9BFF74FF71FF98FF65FFB1FF70FFB8FF9FFFB7FFE4FFD3FF
      1D0001003400190031001C002500FFFF1700CAFF0400A0FFF8FF92FFF1FF97FF
      ECFFB8FFFFFFE6FF0F00060002001400EBFF0800E1FFFFFFDDFF0A00C8FF2300
      BBFF4A00C7FF7900D1FF9A00E4FFAB000000BB001200CC000500C800E1FFAD00
      C5FF7E00BDFF4800C6FF2100E1FF0000F3FFE9FFEEFFE9FFF3FFF4FFFCFFFAFF
      F0FFEEFFE0FFC1FFDBFF81FFDAFF4FFFC0FF49FFACFF6DFFAFFF97FFBAFFABFF
      D9FFB1FF0000D5FF1A00120019004300FDFF5600E7FF4800E4FF1E00E9FFF8FF
      FFFFE5FF1600E0FF1900F8FF2800120038001F002F001B001900FAFF1000CEFF
      0900A9FFEDFF93FFD6FF97FFD7FFAEFFD8FFBEFFDDFFC9FFE8FFE7FFF5FF0E00
      FBFF2700F9FF3800FCFF430004003E000E002F001C0023002200120012000E00
      0D0012000A002100EEFF3300C9FF2E00B3FF1C00A8FF100086FF150069FF2A00
      72FF420090FF4E00C5FF410008003B0043004300540046003800450010003A00
      ECFF1E00CCFFFFFFBDFFDBFFBDFFB5FFBEFFA8FFDDFFB5FF0300C4FF0700D6FF
      F5FFD8FFE4FFD0FFDAFFCEFFBDFFDDFFA7FFF8FFB4FF1000D7FF120000000800
      2200170034003A0027004A00FFFF4500DDFF3700CEFF2800C5FF1C00CEFF0800
      E0FFE6FFE5FFD1FFF6FFD4FF0B00D8FF0400D2FFEEFFB4FFDFFF8FFFD8FF82FF
      B9FF97FFA2FFC5FFACFFF0FFBFFFFFFFDAFFF6FFF8FF04000A00340008005B00
      EEFF6A00D0FF6E00BDFF5F00AEFF4A00B2FF4000C6FF3700D2FF3700F4FF3200
      24001B00300006001E00E4FF1500B1FF180081FFFFFF6EFFDDFF87FFD1FFB9FF
      D1FFDDFFE0FFE2FFF9FFEAFF0C0005001100120008000E00050008000C00FCFF
      0900F1FF0100F0FFF8FFE8FFDDFFE9FFD8FFF6FFE4FFF5FFE0FFE8FFD4FFBDFF
      D8FF8AFFE6FF72FFD0FF7DFFA7FF9BFF99FFB6FFA2FFC2FFBBFFBEFFE7FFC1FF
      1900CCFF3500CCFF3200C9FF1B00D0FF0400D1FFE9FFC9FFD4FFCFFFCFFFDDFF
      C5FF0000D8FF3000040044001A00490010004300FDFF3600F6FF3200DFFF3700
      CCFF4400D4FF5E00ECFF7F0008008F002300A2003400BE002D00B9000B009300
      E9FF6C00DDFF4A00D6FF2B00DBFF1100F0FFE8FFF4FFC8FFFCFFC7FF0F00CEFF
      0C00DDFFFCFFCCFFF9FF9EFF00007AFFE9FF72FFC5FF87FFC0FFA0FFD0FFADFF
      EAFFADFF0700C2FF1500FCFF0E002100FBFF2200E9FF1C00E8FF0D00EAFFF3FF
      F5FFE6FF0900DCFF0B00DDFF0F00F9FF24000C001C001900F8FF1000DDFFE9FF
      DCFFBBFFCDFF97FFB4FF8EFFBCFF98FFD3FFAAFFF0FFB2FF0800C3FF0F00F5FF
      0B00170000001D00FDFF21000B0012001100FBFF0400F3FFF8FFEAFFE3FFE7FF
      DCFFF7FFE9FF0600E4FF2200C8FF3600B1FF2F00B1FF2300A4FF170088FF1000
      8AFF0D00A3FF0E00CDFF04000600F6FF3B0001005B000D005900060043000600
      2D0002001200EBFFF7FFD7FFEEFFC0FFE9FFADFFF4FFB0FF1B00AEFF3200ACFF
      2400A7FF0E0094FF090090FFFDFFA6FFEAFFC0FFF2FFD3FF0A00E8FF2A00F0FF
      4800FDFF55001E004A0028002800140007000B00F5FF0C00E8FF0400DEFFF8FF
      EDFFDAFFF8FFC0FF0500C8FF2600D6FF2A00E4FF0F00E3FFEEFFD1FFD5FFDAFF
      AFFFFCFF83FF210081FF3A009FFF4000C8FF3700F5FF3400140059001E007D00
      1C007F000B008100FAFF8700E7FF8A00D0FF8E00D2FF7F00DAFF5600ECFF3A00
      120022001F0017000F0010000100E9FF0D00C0FF1000B6FFF4FFC9FFDFFFDEFF
      DDFFEEFFEEFFEAFF0300E2FF0600FCFFFFFF1000F1FF0500EAFFFFFFF5FF0500
      FCFF0B00F5FF1000F3FFFFFFEDFFE6FFE5FFE2FFEEFFE1FFE7FFDCFFDAFFC9FF
      CEFF97FFD3FF70FFCDFF69FFAAFF75FF9DFF86FFAFFF9EFFD8FFB6FF0B00BFFF
      3700D8FF4C00EAFF4400E3FF2C00DFFF1700DCFFFFFFCBFFDDFFC3FFC7FFCDFF
      B7FFDAFFB9FFF9FFE6FF13000600280000003F00E8FF3700DCFF2C00CEFF3400
      B3FF3F00A9FF4C00B2FF6900C9FF8300E2FF9900EAFFBC00DFFFC100C9FF9000
      BDFF5800C6FF3700D4FF2200D8FF1400E8FFFAFFF3FFD8FFF6FFD5FF0B00DCFF
      0F00DDFFFCFFCDFFEDFF9CFFE7FF7FFFD6FF96FFB1FFB6FFA3FFC9FFB4FFD2FF
      D6FFDAFFF5FFE7FFFFFF0800F9FF2300EEFF1700E1FF0500DAFFFFFFDBFFFCFF
      D2FFFCFFD8FFF0FFE7FFDFFFF3FFECFF1500F8FF2800F7FF1A00F0FFFDFFC1FF
      ECFF8CFFE3FF75FFCBFF68FFBCFF64FFC5FF6BFFDCFF79FFF4FF93FFFBFFD0FF
      F5FF1400F5FF3100FFFF3E00180049002C004A0021004A0015003D0008001900
      FAFF080003000F0000002A00E6FF4E00CCFF4D00C6FF4300C5FF5000ACFF5A00
      9EFF5400B1FF4800DAFF31000B001C002F002A003C004900340046001E003900
      02003600DFFF2E00B2FF22009EFF0900A5FFEDFFBDFFEAFFF3FFF5FF17000100
      10001000F8FFFAFFE9FFDAFFE4FFDAFFCBFFDFFFBAFFD8FFBDFFDAFFD3FFEEFF
      F1FF050000002000FBFF3400E4FF2800CEFF1500CCFF1200D9FF0C00DCFFFFFF
      E3FFE5FFEFFFC1FFF3FFB7FF0800BDFF1700C0FF0B00C9FFF8FFB6FFE9FF9CFF
      DDFFAFFFC5FFD3FFB8FFE6FFC8FFEFFFECFFEDFF1500E7FF2200FBFF16001E00
      03002200F5FF1800F5FF2200F5FF3800E9FF5100E2FF5700E9FF3B00F3FF1E00
      10000C002600FDFF1900F0FF0100C5FFF9FF95FFFAFFA1FFE7FFC5FFD6FFD9FF
      D8FFE7FFE5FFF4FFFAFF06000700280004004E00FBFF4A00FBFF3A0001004800
      04005700F3FF5400E4FF3800DAFF0500C9FFE9FFD0FFE1FFE4FFDBFFE9FFDEFF
      E9FFC3FFF3FF98FFFFFF99FFEEFFABFFD9FFACFFDFFFA7FF0100A0FF2D0096FF
      4A009EFF4A00BDFF3C00CFFF2E00CFFF2300DDFF1000F8FFEBFF1400C5FF2500
      B5FF2300C1FF2E00EFFF43001C005400220067000D005C00FCFF3500F5FF2E00
      E2FF4300D3FF4300DDFF3C00F8FF450017005D002600810018009F00FDFF8700
      EAFF4F00E4FF2A00E7FF1200E4FFFDFFE5FFE5FFF7FFC1FF0600B2FF2000BDFF
      3500C6FF2800C9FF0A00B2FFF3FF8DFFE2FF99FFC6FFBCFFB2FFC6FFBCFFC9FF
      D8FFD6FFF8FFE1FF0D00FAFF08001C00F8FF1E00F0FF0900F5FF0800FCFF1500
      FCFF1900F8FF1500FCFF0600FCFF01000B0008002100080017000500FAFFE4FF
      EAFFA5FFEEFF8AFFE9FF97FFDFFF95FFE6FF8AFFF3FF91FF0600A5FF1200C5FF
      0600F0FFF4FF0400F4FFFFFF0100060009001C00FDFF2F00E6FF2D00D3FF1200
      C0FF0200BBFF0F00C3FF2100BDFF3700B4FF3800B6FF1E00C0FF2200B6FF3B00
      A6FF3400B0FF0C00D6FFE9FF0700D5FF2B00D5FF3700ECFF3700F3FF3A00E3FF
      3400E6FF1C00F6FFF5FFFBFFD2FFECFFC8FFD1FFD3FFC5FFFBFFCCFF2900D3FF
      3700D7FF2900C5FF23009DFF230098FF1000B2FFFBFFB7FFF2FFB4FFF6FFBEFF
      0500CFFF1700E8FF13000B00F8FF1600E1FF0500E0FF0200EDFF0600EFFF0300
      EAFFF0FFEEFFCDFFF4FFB4FF0400B2FF1400C3FF0300DFFFDDFFEAFFC0FFD8FF
      ACFFE3FF92FF160082FF2F0096FF2400C5FF1700FFFF17002A002B002F005100
      1A005D000D004E000B004C000B005B0001006D00F3FF6D00F0FF5600F2FF4600
      000048001500410016002E0004000C00FAFFDCFFFCFFD5FFFCFFFFFFFCFF1000
      040004000A00010010000C00170020000E003800F8FF4000F1FF3900F9FF3C00
      0200460001004400F6FF2A00E9FFFCFFD6FFCEFFD0FFB4FFD6FFA4FFCCFFA0FF
      B8FF92FFB7FF6BFFC5FF5CFFC2FF78FFB7FF85FFC1FF7EFFE1FF81FF0B0089FF
      2D0097FF3000B8FF1D00CFFF1000C9FF0C00D3FF0100F3FFE6FF1300C3FF2400
      B6FF1F00BDFF1F00DFFF37000F004D0024005B001E004F00150025000A001900
      EBFF3E00D0FF4E00CCFF3C00D5FF3300E9FF3F00FFFF590001007400F0FF7100
      E2FF5200E5FF3A00F3FF2F00F5FF2300E9FF0C00E6FFE4FFEAFFC2FFFDFFBFFF
      1400C7FF0F00D1FFEEFFD8FFD3FFCFFFC8FFDAFFB8FF0E00AAFF3200B1FF2A00
      C5FF1D00E5FF190006001C000C002A00FBFF2A00EEFF1C00EEFF1700F8FF1B00
      F5FF2300EBFF2800ECFF1A00F1FF0A0004000800230004002F00F8FF2100D8FF
      140095FF0E0066FFFCFF70FFEAFF7FFFE9FF79FFF0FF7FFFFFFF9AFF1100C5FF
      1700000008002E0000003F0008004A00180058001700650008005E00F8FF3E00
      E2FF2300DAFF2800DDFF3F00DAFF5300CCFF5700C6FF4400D3FF4000D3FF6400
      CDFF6F00D6FF4500E9FF17000100FAFF1700EBFF1E00F2FF1400FBFF0800F8FF
      0100FFFFFAFF0B00E1FF1700C0FF1A00AEFF0B00AEFF0100C9FF1000F5FF1900
      0A000F000800F5FF0500C6FF0500A8FFF4FFBFFFDEFFDBFFD5FFDAFFD5FFDAFF
      E4FFE7FFFAFFFDFF01001C00EEFF2D00DCFF2800E3FF1E00FCFF19000E001A00
      100014001500EBFF1700BCFF1E00B0FF2600BAFF1700CBFFF8FFD2FFE0FFC0FF
      D7FFBBFFC5FFE4FFB8FF0300C5FFF0FFE3FFD3FF0100CEFF1500DDFF1200FBFF
      F9FF1500E3FF1E00E3FF2B00F3FF3B00F8FF4C00EAFF5400E1FF4200D6FF2C00
      DAFF2A00F0FF2600FCFF1500F5FFF8FFE7FFD1FFE7FFC2FFE2FFE5FFDCFF0900
      E6FF0700F2FF0100FFFF0B000D00170010003200FFFF4E00EDFF5B00ECFF6200
      FBFF5C00FBFF4F00E9FF3B00DAFF0800CCFFCEFFCCFFB4FFDDFFB2FFE2FFB6FF
      D9FFB1FFD5FF99FFDEFF86FFDDFF92FFD6FF98FFE2FF7DFFFDFF63FF1C0062FF
      32006DFF350081FF26009AFF1100ACFF0400C5FFFCFFE9FFE6FF1500C5FF3800
      B8FF3C00BCFF3B00D4FF54000000710020006F002800560023002D001C000F00
      08002000EFFF3B00EEFF3400FAFF26000D002B00210034002B003F001F004C00
      05004A00F5FF4500FCFF3B0001003100F9FF2300FFFFFCFF0A00D5FF1700D3FF
      2800E3FF2500EEFF0D00F4FFEFFFEBFFDFFFF0FFD1FF1800C1FF4300CAFF4600
      E4FF3300FEFF26000E00170011000B0004000C00F2FF0400EFFFFCFFF8FFF8FF
      FAFFF8FFE9FF0000DFFFF8FFD7FFDFFFD3FFD8FFE2FFDAFFECFFD0FFEDFFB4FF
      EEFF88FFFCFF65FFFFFF6EFFEEFF8AFFECFF8FFFF4FF8CFFFEFF97FF0C00A2FF
      1500BCFF0E00E4FF000001000000180015002A001F003A000D004300FBFF2F00
      E3FF1400CBFF1800CCFF2D00D2FF3400D6FF2E00DBFF1E00E9FF1500F0FF2000
      E7FF2A00E9FF1200FCFFEBFF1000D5FF1C00C5FF2100B9FF1E00C7FF1000DAFF
      0A00E9FF1000EFFF0900F5FFE5FF0600C9FF0F00C1FF0D00D1FF1A00FDFF2B00
      23001E00340000003300D8FF2F00B2FF2100B5FFFFFFCFFFEBFFDAFFEEFFD9FF
      FBFFE3FF0800F3FF0F000C000A002E00FAFF3700F0FF30000100280016002300
      17001E001E00FBFF2400C5FF1D00AFFF1B00C0FF0C00D7FFEFFFE6FFD0FFE9FF
      BDFFF8FFB1FF1D00A6FF3900BBFF3100E9FF1900090010001E000F0027000F00
      1E0020000A002A00FCFF320001003B000B003F0001004600F5FF4200EEFF3600
      E4FF3900EEFF4300FAFF3500F5FF1800EEFFF8FFF5FFDCFF0000E6FFFAFF0100
      FFFF0D00140004002200FCFF2300F5FF1900F8FF05001B00F1FF3D00E5FF5200
      F2FF5700FFFF4C00F1FF3C00E9FF0D00E3FFC8FFD4FF9EFFCEFF9AFFC8FF9BFF
      C1FF97FFC6FF92FFD9FF8AFFECFF92FFEBFF9EFFF1FF97FF070088FF1A0086FF
      26008AFF2C0091FF2E00AAFF2600C0FF1500DFFF0B000800FFFF2800DCFF4200
      C3FF4900BDFF4500C4FF5100E9FF67000C00650017004A00120027000C000A00
      FCFF1000D8FF2400BCFF2800BFFF2500D3FF2600EBFF2000FFFF190006002800
      FCFF3500EDFF3F00F1FF4800FFFF4300F7FF2F00F3FF0400F7FFD1FFF1FFBCFF
      F6FFCAFFFAFFD6FFECFFE2FFD6FFF5FFC8FF0700BEFF3000B0FF5700B6FF6200
      D8FF5A00F6FF490004002E000A000F0008000500FFFFFFFFEEFFF8FFEDFFFAFF
      F8FFFAFFEFFF0900E2FF1000DAFF0100CEFFF7FFDAFFF0FFF2FFCFFFFCFFA0FF
      FFFF79FF01005BFFFFFF5CFFEEFF70FFE2FF80FFF1FF8DFF01009BFF0A00AEFF
      0800C9FFFCFFFEFFF0FF2800E9FF4700F5FF67000600730004007300FBFF6500
      F2FF4900DDFF4000D1FF4F00D1FF5200CEFF4F00D3FF4E00E4FF4400F1FF4A00
      EFFF4E00EFFF3900000024000D000F000E00EFFF0800D2FF0500DBFF0100F0FF
      FAFF0500FEFF1C0005002500EEFF3300D2FF4000C6FF4700C4FF5400DDFF5D00
      0300440015001A001900F0FF1D00C5FF1500B7FFF5FFC4FFD4FFC9FFCEFFCCFF
      D6FFD3FFDDFFDCFFE1FFE4FFE3FFFDFFE5FF1100E4FF1400ECFF1A0002001000
      060000000900E3FF1500AFFF130096FF0E00A9FF0600BBFFEEFFC5FFD3FFD3FF
      CBFFD4FFCDFFDDFFCEFFE5FFDDFFDAFFFBFFDAFF1400E2FF2300DFFF2C00DDFF
      2D00EEFF230000000F00120001002D0004003400FDFF3100EFFF2B00E4FF1D00
      D5FF1E00D6FF2F00E6FF2F00EAFF2100E7FF1100ECFFFFFFF0FF0400E2FF1E00
      D3FF2800E2FF2A00FAFF2A0001001A00FFFF1000F3FF3000E8FF5800DFFF6E00
      E2FF8500F1FF8300F3FF6800F0FF3A00F1FFFAFFE3FFCEFFD5FFC9FFD8FFC2FF
      DCFFBFFFDFFFC9FFF0FFBEFFFDFFB6FFFEFFB6FF0100A1FF17008CFF2F0083FF
      38007BFF390075FF380085FF3500A0FF2400C5FF1400FCFF0E002700FCFF4400
      E9FF5800E2FF5B00E2FF6400F5FF760011006D0021004A0026002D002A001200
      2200080005000F00EBFF0400EEFFF7FF0400F4FF1300EEFF1B00E3FF1600F2FF
      0E000E000600250006004500160049001A002D00150008001400DBFF0500BBFF
      F8FFBFFFF5FFC9FFECFFD3FFDCFFEFFFD6FF0900D1FF3000C8FF5E00C9FF6900
      E1FF6500FCFF6000040048000800200004000B00FEFF0000F5FFEEFFEFFFECFF
      F7FFF1FFF5FFF2FFEEFFF2FFECFFEBFFE4FFE9FFE5FFEDFFF7FFD5FF0400A7FF
      0B008AFF15007AFF1F007CFF1B0091FF0E0094FF12008DFF1D0098FF1900A5FF
      0C00A5FF0000B8FFFAFFDDFFF8FF0000FBFF2D000500480006004C00FDFF4900
      F3FF3700DDFF2A00CAFF2F00C8FF2E00CBFF2100D1FF2200E3FF1900F8FF0800
      FCFF0400F8FFFAFFFFFFEFFF0900EBFF0800D8FF0600B3FF0A00A2FF0C00ACFF
      0600C0FFFAFFE3FFF6FF0100E9FF1000DBFF2100DAFF2D00DDFF3A00EEFF4500
      08003A001C0012002400EBFF2900C6FF2200B1FF0400BDFFE7FFC0FFE3FFC1FF
      F0FFDAFFF7FFF5FFF8FFFCFFF9FF0700F5FF1D00F2FF2A00F1FF3700FAFF3300
      010015000500EAFF0B00BDFF0300A0FFF2FFA2FFE4FFB0FFD4FFC0FFC0FFE1FF
      B8FFFBFFBBFF0700BEFF1700C8FF1000E4FF0500050015001C00230028000E00
      2C00FBFF2600FEFF1A0004000C0019000800280004002800FEFF2800FCFF2600
      EFFF2E00E4FF4900E6FF5600F0FF4400FAFF3400080024001600190012002700
      05002400090010001D000B0023000B001700080005001C00F5FF4700EDFF6300
      F1FF7100000067000B0045000B0017000100E2FFE7FFB8FFCBFFA8FFC1FFA2FF
      C4FF96FFCCFF95FFDDFF94FFF0FF92FFF3FF9EFFEAFF98FFEFFF7EFFFBFF7BFF
      FFFF88FF000086FF06008FFF0E00B1FF1300D8FF0D000D0003003E00F1FF5A00
      DAFF6900D1FF6800CFFF6600DAFF6B00F0FF5B00000036000A001F0013000B00
      1700FCFF08000100F4FFFCFFEFFFE6FFFCFFE9FF0800F3FF1000E7FF1700E4FF
      1700FFFF16001E0012003E00100049000A00340001001200FFFFE7FFF3FFC8FF
      DFFFC9FFCFFFDAFFC5FFEEFFBBFF1500B6FF4000BDFF6700C1FF9500C7FFA400
      DDFF8B00FBFF7D000A0074000D0048000B00170004000200F9FFF8FFEDFF0600
      E4FF1F00DDFF2600DCFF2000E7FF0C00EAFFFCFFE4FFFDFFEBFFF0FFF5FFC3FF
      FFFFA5FF070099FF180094FF1D00A3FF15009EFF170088FF1F0095FF1A00BDFF
      0900CFFFFBFFE1FFEFFF0B00EEFF3600F8FF6500030089000B0095000C008D00
      0D006F00FFFF5100E5FF4A00D3FF4B00C9FF4000CAFF3C00DBFF3700F5FF2300
      FFFF2100F8FF1B00F8FFFFFF0600F0FF0F00EDFF0F00D0FF0F00B4FF0D00B8FF
      0900C5FF0400E2FFFDFF0B00F1FF2800E4FF3D00E1FF4500DDFF4800D7FF5000
      DDFF4500EBFF1700FBFFECFF0B00CDFF1200B6FF0500C1FFE7FFCAFFD6FFC4FF
      DCFFD5FFE4FFF5FFEAFFF8FFFAFFF2FF06000500100017001A00230024002100
      26000B001E00F0FF1C00D1FF1600BBFF0700B6FFFFFFB6FFF6FFACFFE6FFB8FF
      DAFFD3FFDDFFE1FFE1FFEFFFE2FFEFFFEFFFDFFF0A00E4FF2000FDFF2D00F9FF
      3200DFFF2800E2FF1600EEFF01000300EFFF1E00DFFF2800D6FF2E00DEFF2D00
      E2FF2F00D8FF4600D5FF5900DAFF4C00DFFF3C00E7FF3B00F0FF3900F2FF4300
      E4FF3900DCFF1400E5FFFFFFE4FF0700DDFF0900DAFF0D00D8FF3300E1FF5300
      F0FF6800010072000C005D000D0037001000FFFF0500D0FFEBFFC4FFD9FFC3FF
      D2FFB6FFD2FFABFFDFFFA7FFF5FFA0FF06009EFF030098FF04007CFF15006FFF
      1C0083FF17008CFF150089FF1200A3FF1000C8FF0F00F0FF0D00210001004800
      F3FF6000F3FF6700F6FF6200F3FF6700F2FF6A00F5FF5200F8FF380005002300
      1900FFFF2300E2FF1700CDFF0A00B6FF0F00B1FF1000C6FF1000D4FF1700D9FF
      1E00F6FF250015002E002D0033003C002B0037001A0023000F0000000300DCFF
      EDFFD6FFDDFFEBFFD2FFFCFFC7FF1900CBFF4600DBFF6F00EBFF9A00EDFFAD00
      EFFF9D00FFFF89000B007A001200520015000D000800E3FFF2FFD1FFE1FFD1FF
      DCFFE4FFDCFFEBFFDDFFE4FFE9FFDAFFF3FFCEFFEEFFCFFFEEFFC9FFF5FFA7FF
      F9FF8DFFFEFF8FFF070092FF0F0099FF080092FFFFFF75FF070068FF060079FF
      FCFF93FFF8FFA3FFF0FFCBFFF0FFFBFFFCFF24000B004E00100065000B006C00
      0E0056001000330001002500F4FF2100ECFF0E00EBFF0300F5FF070004000800
      14000C00110008000800EEFF1200CBFF1800BBFF1500B5FF1700A8FF1200B1FF
      0800CAFF0000EBFFFBFF1900F1FF3A00E8FF4F00ECFF5800F0FF5600E8FF5A00
      E6FF5B00EBFF3B00F0FF1000FDFFF8FF0F00E8FF1600E7FF0500EDFFEEFFE8FF
      EBFFECFFEDFF0100EBFF1600F3FF1F00F8FF2F00FCFF3A000600370014003000
      12001C0001000000FAFFDDFFFAFFBCFFF5FFB2FFF0FFB7FFE7FFB6FFDAFFC1FF
      D7FFE2FFE1FFF9FFF1FF0C00FAFF1800FBFF12000D0011001C00190023001400
      2E00EEFF2F00D0FF2300C9FF1600D1FF1000EDFF08000B00FAFF2500F5FF3900
      F8FF4000F0FF4E00E8FF5E00EEFF4E00F8FF3700070033001B002A002A001F00
      280013001300FAFF0900E1FFFFFFDAFFF0FFE8FFEFFFF3FFEEFF0700EEFF2000
      F8FF3200060045000E00450008002D00040007000100DAFFEEFFC1FFD9FFC1FF
      CEFFB4FFC8FFA3FFCEFFA5FFE0FFA8FFF3FFB0FFFCFFB4FFF9FFA9FF04009EFF
      0F00A4FF0D00B6FF1200C1FF1200D2FF0D00F0FF0C0012000E00400008006200
      F5FF7100E9FF7400E5FF6700DAFF5B00D2FF5400D2FF3D00D5FF2300E7FF1700
      040001001B00ECFF2100DEFF1500C5FF1200ADFF1500ACFF0F00C3FF1300DBFF
      1A00F7FF1C000F001E001200220013001F000D000C00FFFFFCFFEBFFF9FFD7FF
      EEFFD8FFD7FFF8FFC2FF1100ADFF2800A4FF5400B0FF7800C6FF9500DDFFAB00
      E9FFA100FBFF86000D006A001000510012002B0008000800ECFFF9FFD4FFF0FF
      D1FFF5FFD9FFF7FFD8FFF3FFDCFFF5FFE8FFF0FFEAFFE9FFE6FFEAFFEBFFD8FF
      F1FFBCFFFBFFB7FF0A00B2FF1500ADFF1200A9FFFFFF96FFF5FF85FFEDFF88FF
      DCFFA9FFDAFFD5FFDDFF0800E0FF3800EFFF550004007900110095000B009800
      00008C0000006E00F8FF4C00E7FF3C00D8FF2A00CCFF1500C7FF1700CFFF1600
      E3FF1900F5FF2000FBFF0D000600EBFF1700D2FF1C00CEFF2400CEFF2800D3FF
      1D00E7FF1100FFFF0B00260007004A00F8FF5D00E7FF6400E4FF5800E2FF4700
      E0FF4200E2FF2E00E9FF0B00F8FFF6FF0F00E4FF1F00D9FF1900DDFFFCFFD8FF
      EBFFC9FFEBFFC0FFE6FFCCFFEDFFDFFFFFFFF0FF0C00FFFF1500FEFF1D000300
      1F0003000B00F2FFF1FFDCFFEBFFBBFFECFF9BFFE7FF98FFE2FFA4FFD8FFB1FF
      CEFFCEFFD4FFE4FFE7FFF2FFFBFF0400040001001200F5FF1F00F0FF1C00ECFF
      1E00E4FF1E00DDFF0F00DAFFFDFFDAFFF9FFEEFFFCFF0E00F5FF2A00E9FF4400
      EAFF5300F0FF5900EEFF6900E7FF7400E4FF6800E4FF6100EFFF5800F8FF4C00
      F5FF4C00E0FF3500CCFF0900C5FFEEFFBBFFF3FFC1FF0A00D3FF2800E5FF4000
      FAFF4800130053002B005B002F004B0021003400170017000800F5FFEDFFE4FF
      D5FFD6FFC9FFBAFFC9FFAFFFD8FFADFFF3FFB0FF0B00C4FF1300C5FF1700B2FF
      2300A7FF2200AAFF1E00B6FF1F00C8FF1700DCFF1000ECFF1700080026002C00
      230048000C006100FFFF6E00F7FF6100EBFF5800E8FF5000EBFF3000F6FF0C00
      1100E9FF2F00D1FF3B00CEFF3400C1FF2D00A2FF2E0091FF24009CFF1E00C0FF
      2700EBFF2C0006002C0004002F00000032000600230000000500F9FFF5FFEEFF
      EEFFDFFFDFFFEAFFD2FF0800C5FF1E00B8FF3F00BDFF6400D1FF8700E5FFAC00
      EDFFB000F0FF8E00F5FF6700F0FF4300EDFF1900EEFFF8FFE1FFE4FFD1FFD3FF
      D3FFD2FFE9FFDFFFFAFFE5FFF8FFE9FFFFFFE9FF1000DCFF1500D7FF1400DDFF
      1500D3FF1500C9FF1700BBFF1A00A5FF19009DFF0F008CFF07006DFF0B0063FF
      060077FFFCFFA0FFFCFFDBFF00000B00050021001200330026004B0026005B00
      15005B000F004A00130024000C000A00FFFF0800EFFF0000DBFFF4FFD6FFEDFF
      E9FFEBFF0300F5FF1100EDFF1900C8FF2300AAFF2500A5FF2200B2FF2400D0FF
      1E00ECFF0D00FCFF070018000D00400005005B00E9FF6800D5FF6700D1FF5500
      CEFF4700D1FF4400D8FF3000E3FF1400FCFFFCFF1900F0FF2300FEFF15000400
      0100F6FFF7FFECFFECFFECFFE3FFFBFFE9FF1400F2FF2300F5FF1900FAFF0500
      0400F8FF0600F0FFF3FFECFFE6FFDCFFE9FFB9FFE9FFA1FFE7FFACFFDFFFC0FF
      D6FFD3FFD8FFE7FFE7FFFDFFF9FF1F000100300004001B000B00FAFF0D00DEFF
      0D00CCFF1300CCFF1400D1FF0B00C7FF0800CCFF1000F0FF10001A00F7FF4000
      E5FF5600EBFF5400F0FF5400F5FF6200FFFF5E0008005000160044001E003B00
      1C003D0008002F00F5FFFFFFF1FFD8FFEEFFC9FFEBFFD7FFF3FF030000002E00
      08003B0015003C002D003E0038003A0026002E00150017000C00EEFFFAFFC6FF
      E1FFBBFFC8FFB1FFB4FFA5FFB1FF9DFFC4FFA0FFDDFFB7FFECFFCBFFF9FFC1FF
      0A00B1FF1200AFFF1000C0FF0900E6FFFCFF0B00EEFF1200EBFF1900FBFF3500
      00005600E9FF6C00CBFF6C00C1FF4F00C4FF3800CCFF3800D9FF2D00E8FF1100
      0100F0FF2000D6FF3900D6FF4000D2FF3D00B5FF37009BFF290099FF1900ACFF
      1400D3FF1900F5FF1F00F2FF2700E4FF3700E6FF3D00F0FF2400010004000D00
      F5FF0B00E9FF1000D8FF2C00C3FF4C00B0FF6500ACFF7A00C0FF9000E0FFB000
      F5FFC300FDFFB0000400870000005D00F6FF3400F0FF1C00EEFF1400E5FFFDFF
      DFFFEDFFEBFFF8FFF7FF0F00ECFF2300E1FF2900E8FF1700F3FF0500F8FF0800
      FCFF0600FCFFF7FFFFFFDFFF0100C6FF0000BDFFF3FFBDFFE5FFA8FFE1FF92FF
      DDFF95FFD8FFB1FFE1FFEDFFF0FF300000004C001000570029006C0036007F00
      230087000A007A0000005300FBFF2A00F1FF1A00DFFF0D00CBFFF9FFC5FFEDFF
      D4FFF0FFF1FF02000B000E001C00F1FF2F00C5FF3800AEFF3700B1FF2E00CEFF
      1F00F5FF0D000400000005000400170008002F00F6FF4000DBFF4900D2FF3E00
      D5FF2A00D6FF2800DAFF2300E0FF1200EEFF00000100E9FF1400E6FF1500F3FF
      0800ECFF0100D5FFFCFFCAFFFAFFCEFFFBFFEBFF0000140005001B000B000200
      1F00F0FF3300ECFF2800F3FF0B00F2FFFBFFD7FFF9FFB9FFF5FFBEFFEFFFD2FF
      E4FFDBFFE1FFE1FFEFFFE9FF040001001200190014000D001A00E8FF1800CDFF
      0D00C8FF0300D0FFFBFFE1FFF8FFDEFFFAFFD6FF0800EEFF1000180000004000
      E4FF6200DAFF6F00E2FF6E00EAFF7600EFFF7700E9FF6E00E3FF6500DEFF5300
      DCFF4300D5FF3700C9FF1B00CAFFF4FFCEFFE2FFD4FFE1FFE3FFF8FFF4FF2600
      06003E00170034002F002F00410032003400340017002A0003000100FBFFD2FF
      F0FFBDFFE2FFBBFFD1FFB6FFCCFFACFFD8FFA7FFF3FFB8FF0B00DAFF1700DFFF
      2600BEFF2F00A8FF2B00AFFF2100C9FF1600EEFF1000FDFF1100FAFF1B001000
      1F003B000A005D00EAFF6800DAFF5900DAFF3E00E2FF3700EEFF3300F7FF1E00
      FEFF01000E00E4FF2400D3FF3000D2FF2E00C2FF2E009EFF27008DFF170096FF
      0B00B6FF0600E4FF0B00FEFF1400F7FF2300EEFF2F00F1FF1F00000004001200
      F3FF1400EFFF0D00E7FF1F00DAFF4000C8FF6000BFFF7900CBFF8900DFFFA200
      EAFFBC00E5FFB200E4FF7C00E4FF3F00DFFF1200DFFFF9FFE4FFF0FFEEFFE4FF
      FCFFC7FF1100BEFF2000D3FF1A00E9FF0400F3FFF6FFE9FFFCFFD8FF0100D9FF
      0500DEFF0400D6FFFFFFC6FF0000ACFF04009BFF04009EFFF5FF99FFEEFF82FF
      F0FF7EFFEFFF9BFFF3FFC8FFFAFFFCFF0400210015002400320028004A003B00
      48004C002F00510019003A000F00170006000500FDFFF5FFECFFDFFFDFFFCEFF
      E4FFC9FFFAFFD5FF1300EDFF2300EFFF3300D0FF4200B5FF3C00B9FF2E00D3FF
      1E00FCFF10001B00080022000A002F0010004E0000006C00E3FF7D00CCFF7600
      C3FF5700CAFF4500DCFF3D00EBFF3200F5FF23000400100015000B001D001E00
      0F00280002001400F9FFFFFFE4FFFAFFD3FF0400CAFF1C00CFFF2A00E1FF1800
      FDFF00001700FEFF1C0003000C00FFFF0000E4FFFCFFC2FFF8FFB9FFECFFC3FF
      DBFFCCFFD2FFD6FFDAFFDEFFEFFFEDFF01000400070005001500E1FF2A00BFFF
      2800B5FF1E00B7FF1800C2FF1900D2FF2100D7FF2E00DFFF3300FFFF22002600
      03004A00F0FF5C00F5FF5B0007005F00170064001700600008005500FCFF3B00
      F8FF1D00F9FF0B00EBFFF8FFE3FFD3FFEDFFB8FFF2FFBBFFF9FFD8FF01000400
      08002800120028002700180035001A00290025000E002500FBFF0B00F3FFE1FF
      E9FFCFFFDCFFD3FFC2FFD2FFACFFCAFFB1FFC0FFCDFFC8FFEFFFE7FF0000FFFF
      1200F4FF2800E5FF2800EEFF1900060009002100FCFF3300F5FF3000F5FF2D00
      FCFF4100F5FF6000E2FF6E00D5FF6200D6FF4300E7FF28000100190012000800
      1900F0FF2100D6FF2E00C1FF3B00C0FF3600C1FF2C00AAFF28008BFF190085FF
      0B0094FF0800B4FF1200DAFF2600E7FF3C00DCFF4C00E2FF4500FEFF27001C00
      08002600F6FF1C00E4FF2400D3FF4000C5FF5A00BBFF7000C4FF8200D8FF9500
      E6FFAB00E4FFAC00E2FF7F00EEFF4000EBFF1500E3FF0000E6FFF9FFF0FFF7FF
      FFFFF1FF0E00EDFF190000000D001B00F4FF2500E4FF1C00E4FF0700EEFF0200
      FAFF0D00FDFF0C00F8FFFCFFF0FFE7FFEDFFD7FFE9FFD2FFD6FFD1FFCAFFBDFF
      D6FFACFFDEFFBCFFE1FFE4FFEBFF1000F7FF40000800580023005B0034006500
      2C00720010006E00F7FF5400EBFF2D00E5FF1600E1FF1000D8FF0100CAFFEDFF
      CEFFDFFFE5FFDEFF0600F0FF1A00FFFF2800ECFF3B00CBFF3B00BFFF2600D0FF
      1000EEFF04000B00FFFF1700050014001200230012004A00FFFF6800ECFF6800
      E4FF5200E4FF4000EDFF3E00EFFF3300EBFF1800F0FFFFFF0000F0FF1700F3FF
      1A00FFFF1500F4FF1200D8FF0400C9FFE9FFCBFFDBFFD6FFDEFFE5FFECFFEAFF
      0800DFFF2200E2FF2A00F5FF1C00FCFF0D00F5FF0200DCFFF1FFCEFFE1FFD3FF
      D1FFD6FFC5FFDAFFCAFFE6FFDFFFF3FFF8FF0100000008000400F8FF1000DAFF
      0E00C6FF0000C0FFFEFFC4FF0700D1FF1500E5FF2300F0FF2A00080018003300
      F8FF5800DFFF6B00DAFF6900E2FF6700ECFF7000EFFF6F00E8FF6500DFFF5900
      DBFF4800DCFF3800D6FF2B00D2FF1000E5FFE9FFF8FFDBFFFFFFE9FF06000200
      0F001C001C0026002E001B00370017002B00240015002600080011000800EFFF
      0500E1FFFCFFECFFEBFFEDFFD8FFE4FFD1FFE1FFDCFFE7FFF3FFF3FF03000100
      0E00FCFF2600E7FF3200DDFF2700E7FF1900F8FF100004000600080006000200
      0B000D0005002F00F3FF4500E5FF4200E9FF2D00F3FF1C000400190010000D00
      1200F0FF1500D5FF1E00C0FF2D00B6FF2D00BDFF2600BBFF2D00A5FF2B0094FF
      170099FF0600B6FF0400DDFF0D00F5FF2300EFFF3B00EAFF3E00FFFF2C001600
      14001E0004001800F1FF1900DBFF2F00C7FF4300B8FF4E00BAFF5F00C6FF6F00
      D6FF7A00D9FF8500D6FF7600DFFF4300E1FF1000D9FFF2FFDFFFE0FFF7FFD5FF
      1000CEFF2800C9FF3300D3FF2800EFFF0B000000F3FFFCFFEFFFEDFFF6FFE7FF
      0100F5FF0C00FAFF1000EEFF1500E2FF1600D9FF1500CEFF0600CCFFF3FFC9FF
      F3FFBDFFFAFFBCFFFAFFC9FF0000E1FF1000FFFF250019003F00240053002A00
      510036003B003500240020001E0005001B00F5FF1000F6FF0100F2FFF1FFE1FF
      EAFFD7FFF0FFD8FF0400DCFF1400E6FF1F00E4FF3400CDFF3F00C2FF2F00CFFF
      1800EDFF0B00080005001900050021000800340000005B00EBFF7400D8FF6D00
      DDFF5300E5FF4300E9FF4800ECFF4200EBFF2700F0FF1100F7FF0C0001001000
      04001A00FBFF1800FDFF0100FBFFEEFFE7FFE9FFD5FFF0FFD5FFFAFFE4FFFAFF
      0100F3FF2100F0FF2F00FAFF2A00FBFF1C00ECFF1200D7FF0400C9FFEBFFCCFF
      D3FFD2FFC2FFD3FFC5FFDCFFD9FFE9FFF8FFF0FF0B00FBFF1200FFFF2100EAFF
      2800D0FF1D00C2FF1200C2FF1200CCFF1900D8FF2500DEFF2C00F0FF21001500
      04003A00E7FF4F00E6FF5200F1FF5400F8FF5E00FAFF6000FAFF5300F8FF4300
      F3FF3400F0FF2400E9FF1A00DFFF0B00EAFFEDFFFFFFD8FF0B00D8FF1000EAFF
      1A0001002700100030001400370017002D00200014001E00FCFF1000F6FFFBFF
      F7FFF1FFEBFFF1FFDBFFEBFFCCFFDDFFC5FFDAFFC9FFE9FFDAFFF4FFECFF0000
      F3FF0B0001000B000B000D0006000E00F8FF1100EEFF1600E9FF1600E7FF1A00
      E9FF2E00E6FF4A00D8FF5600D0FF4E00DFFF3700F5FF2000FFFF150005000500
      0600E7FF0C00C7FF1500B4FF2200ADFF2700B4FF2200BBFF2800ADFF31009BFF
      2A0094FF1A00A5FF1600C4FF2300D8FF3600DEFF4A00EBFF4E0006003D001C00
      240023001500230006002D00EAFF4500CEFF5900C0FF5D00C4FF6300D2FF7100
      E5FF7A00F0FF8400EBFF7D00ECFF5900F0FF3300EBFF1800E4FF0900EBFF0000
      FFFFF7FF1300F5FF1E00050017002100FBFF3400DDFF3900D9FF3200E9FF2B00
      EEFF3200EBFF3700E6FF2A00E4FF1700E5FF0400E4FFEDFFDDFFDDFFCBFFDDFF
      C6FFDCFFD1FFDBFFDBFFDDFFE1FFE9FFEAFF0700FCFF220010002A0022002D00
      280033001B0030000900260008001A0012000E000D000B0001000500FAFFF2FF
      F6FFDCFFFAFFD3FF0600D7FF1400E1FF1A00E7FF2700DEFF3300D8FF2E00DEFF
      1D00E9FF1000FAFF0F00010010000100140012001200310003004300F3FF4300
      F5FF3D00FDFF3900FAFF3800F0FF2B00E7FF1000E4FFFAFFE9FFF8FFF6FFFBFF
      0100FCFF0100FBFF0600E9FF0B00DAFF0400D3FFF3FFD5FFEBFFE2FFF6FFEEFF
      0B00F5FF200003002D0012002B0011001F0004001A00F8FF1600EFFFFFFFF3FF
      DFFFF8FFC9FFF5FFCCFFF1FFDEFFF8FFF5FF0600020011000100150006000100
      1000E4FF0F00CEFF0900C6FF0B00CCFF1A00D7FF2900E2FF2900FEFF17002C00
      F8FF4900D5FF5000CEFF5400E0FF5400E9FF5C00E9FF6700E8FF6300EBFF5100
      EFFF4300EDFF3700E6FF2700D6FF1600D6FFFAFFE9FFE2FFFBFFD8FF0600D8FF
      1000E4FF1E00F6FF2C00FCFF3400010032000E0023000C001000FFFF0C00FAFF
      1700F7FF1300F9FF0000F7FFEEFFF0FFE2FFE9FFE5FFE8FFF3FFEDFF0200F4FF
      060001001000090021000800260002001E00F6FF1500EAFF1300E9FF1500EEFF
      1200040008002B00FBFF4000EDFF3E00F1FF360005002700100018000B000A00
      0500F2FF0300D3FF0500C3FF0D00C2FF1500C6FF1200CCFF1200C5FF1600BBFF
      0F00B4FFFFFFB1FFF5FFBCFFFCFFCCFF0F00D6FF1F00E9FF28000D0026001F00
      1700230009002F0000004000E7FF4D00C6FF5000B4FF4800B9FF4200CBFF4E00
      DFFF6900EEFF7D00EFFF7A00F1FF5B00F8FF3200F4FF0E00EBFFEFFFF0FFD6FF
      0400C9FF1E00C5FF2F00C9FF2B00E4FF1400F9FFF8FFFCFFF3FF010005000400
      110006000D000B00040008000300FBFF0600ECFF0500E0FFFCFFD8FFE6FFD9FF
      D8FFD4FFDFFFCBFFEBFFC9FFF3FFD2FFFEFFE4FF0D00FAFF2100FFFF3200FBFF
      350004002D0004002000FBFF2200FCFF31000100320009001F000B000800FCFF
      FCFFE1FFFDFFCDFF0300CEFF0D00D6FF1300DFFF1A00E4FF2900ECFF2F00FAFF
      2A0006001F00100014001C000B00240006002D00FFFF4800F6FF5400ECFF4F00
      EDFF5300FDFF560005005000FDFF4000EAFF2F00DDFF1E00DBFF1400E1FF1500
      EBFF1800ECFF1C00EFFF1900F7FF1400F8FF1200F0FF0800EBFFFFFFF2FFFFFF
      0200FDFF1200FAFF17000500160004000D00F0FF0800DFFF0800D3FFFBFFD2FF
      DEFFD8FFC8FFDAFFCBFFD5FFDFFFD1FFF6FFDAFF0800E9FF1000F2FF1400E7FF
      1B00D4FF1A00C5FF1300BAFF1700B2FF2200B6FF3200C5FF3900DEFF2E000A00
      18002900FFFF2A00F5FF280005002A00130035001100460007004F0004004800
      05003D0002003300F8FF2400E4FF0F00DAFFF3FFE9FFD7FF0000C8FF0F00C7FF
      1700D3FF1E00E9FF2A00FAFF3400FBFF2800080012000E00F8FF0100EAFF0000
      F5FF0000FCFFFFFFF0FFFFFFDBFFFDFFCFFFFBFFD1FFFAFFD8FF0100E2FF1500
      E5FF2B00EAFF3600F8FF37000100330003002A00040022000400230006002800
      0800290003003E00FCFF5000F2FF4800F1FF3B0005002B001700180019000000
      0D00E3FF0500C4FF0A00AFFF1700ADFF2700B8FF2E00C7FF3000C7FF3800BBFF
      3800B4FF2C00B1FF2000AFFF1C00B4FF2300C0FF2F00C8FF3200E5FF31000500
      280012001C00260017003A0005004300E6FF3F00CAFF3100C5FF2600D4FF2D00
      E4FF4800F0FF6400F0FF7400F0FF6700F0FF4500EBFF2300E4FF0500E8FFF0FF
      F6FFE9FF0800EDFF1500F5FF11000D0004002D00F5FF3600EBFF3800F8FF3B00
      04003A00FFFF3900EEFF3500E5FF2800E7FF1200E7FF0300E1FFFCFFD1FFFEFF
      C5FFFCFFC9FFF5FFD6FFF5FFE0FFFBFFE9FFFFFFF8FF01000B0006001C000000
      1C000A0012001C000A001800080013001B001400280011001C000A000400FBFF
      F2FFE4FFEDFFCEFFF0FFC0FFF5FFBDFFF5FFCCFFFBFFDCFF0900EBFF1800FDFF
      1E000B001E0015001E00180018001B00140018000B001F0004003400FDFF3900
      F8FF3D00040045001400440010003900FDFF2A00EAFF1700E4FF0100E7FFF5FF
      F1FFF0FFF7FFF8FFFAFFFFFF0500FDFF0D00FAFF0800F7FF0100F2FF0100EDFF
      0700ECFF1200E7FF1500EDFF1000FEFF0B00FCFF0200F8FF0500FBFF0600F8FF
      F5FFF5FFDCFFF3FFCEFFF0FFD0FFEDFFD9FFF2FFE7FFFCFFF0FF0B00F1FF0B00
      F4FFF8FFF4FFE4FFF3FFD7FFFBFFD3FF0B00DAFF1700F0FF1C00000012001700
      01003500F0FF3E00E4FF3E00ECFF4800FDFF4F0002005400FCFF5800F8FF5300
      FBFF4800FAFF3B00F5FF2F00E4FF2100D4FF0B00DBFFEAFFF0FFD1FF0400CBFF
      1500D5FF2800E5FF3700FAFF4200FCFF3E00F8FF2B000000190001000B000100
      0F000B0016000F000B000D00F5FF0D00E2FF0E00DCFF0B00E0FF0C00EBFF1300
      F3FF2300F9FF2D00040021001000100014000800130005001500010012000300
      0D00FDFF0500FFFFF7FF1500EDFF1C00EAFF1300F9FF08000F00FCFF1500ECFF
      0800DCFFFAFFCAFFFAFFBAFF0400B4FF1200B7FF1800C7FF1700D5FF1900D1FF
      1E00C8FF1A00C4FF1000C0FF0D00BBFF0C00C0FF1200CCFF1700DCFF16000100
      130021000C0034000A00430006003E00F5FF2B00DFFF1D00D2FF1900D3FF1900
      DDFF2600EBFF3700F5FF4800F5FF4C00F6FF3300F6FF0A00F2FFE6FFF3FFCFFF
      FFFFC2FF0B00C5FF1700C9FF1F00D5FF1A00F9FF100015000B00210014002800
      23002600210023001500230005001F00FAFF1200F6FF0600F3FFFFFFE9FF0100
      DCFF0600DEFFFFFFEEFFF5FFFBFFF1FF0800EBFF1A00E0FF2B00E0FF3800E2FF
      3A00E2FF2F00F1FF2700FCFF27000000320007003F0008003F00FCFF2F00F1FF
      1900E6FF0800D8FFFFFFD1FFFFFFCDFF0100D7FF0500F0FF1000FAFF1D000100
      230010001F0021001B0027001200280008001F00FDFF1300F0FF1B00E9FF2A00
      E9FF3700F5FF460006004C000A004400FFFF3400ECFF2000DFFF0800DFFFFFFF
      E6FF0000EBFF1000EBFF2700F3FF290001001D0006001000030006000600F4FF
      0B00E6FF0F00DBFF1200D0FF0F00D6FF0800E1FF0400E9FF0900F0FF1200EEFF
      0F00E2FF0600DEFFFCFFDFFFF5FFDAFFF6FFDAFF0000E1FF0800F0FF06000100
      0300FCFF0500E9FF0500DFFF0700DFFF1300E1FF1F00E8FF2600EBFF2500EBFF
      1900FBFF0900120001002300040032000D0039000F00380008003900FEFF3B00
      F5FF3500F3FF2E00F2FF2100EBFF1400DDFF0F00DCFFFFFFEFFFEAFF0500E1FF
      1800E4FF2A00EAFF3300F8FF320005002A0001001700FFFF01000400F5FF0800
      F0FF0F00F4FF0D00F5FF0500EEFF0800E1FF1500D4FF1700D0FF1800D6FF1700
      E1FF1E00E5FF3300EDFF3700FAFF2E00FFFF2B00FDFF30000100310004002900
      00001C00FAFF0F00F0FF1200E7FF1B00E6FF1900EFFF1300FFFF08000900F4FF
      0800E2FF0400D5FFFFFFC5FF0400C0FF1400C0FF2100C8FF2300DAFF2600DDFF
      2E00D7FF2B00D2FF2000CEFF1A00C5FF1800C3FF1500CEFF1700D8FF1900EEFF
      1A000F001A002B001B003B001C0038001500270008001E00FAFF2100EEFF2400
      EBFF2D00F0FF3600F3FF4300F0FF5300F2FF4700FAFF2100F8FF0200F3FFFBFF
      F8FFFFFF0100060008000F000900120002002400F8FF4000F1FF5700F2FF6300
      F8FF5D00FAFF4F00F2FF4800E3FF4200D4FF3300C9FF2800C4FF2100BEFF1C00
      B6FF2100B8FF1700C7FF0300D8FFF4FFE7FFEBFFFCFFE2FF0D00DEFF1400E2FF
      1400DFFF1000E1FF0D00EDFF0B00FAFF120001002100FAFF2B00E6FF2800D6FF
      1A00D2FF0800CDFFFBFFC8FFFCFFC6FF0400CCFF0800E5FF0F00F9FF1E00FEFF
      2B0008002A001A0029002300280021001C0018000B000400FDFFFCFFF8FF0800
      F8FF1C00FFFF2D000A003000100026000F00170005000800F8FFF4FFEEFFECFF
      EEFFEFFFF0FFFAFFF2FF1500F8FF210002001700060008000600FDFF0B00EEFF
      1000E4FF0F00E4FF0800E6FF0300F0FF0100040000001A000000240005001D00
      08000B0005000200FAFF0100ECFFFBFFE2FFF8FFE4FFFCFFEAFF0300EBFF1200
      F0FF1700F9FF0800FDFFF9FFFFFFF6FF0900F8FF1800FBFF1F0000001E00FCFF
      160003000D001A000400340001004C00070054000B00480006003A00FFFF3300
      F6FF2600ECFF1C00E5FF1000E0FF0100D8FFFFFFDAFFF9FFECFFE7FF0400DAFF
      1900D9FF2F00DEFF3F00E9FF4000F3FF3700E9FF2B00DDFF2000E1FF1100F3FF
      0800050009000D000B000D000B00120001001C00F5FF1B00EBFF1200ECFF0B00
      F8FF0500FFFF100008001C00180017002300120020001B001C001E001B001500
      150007000B00F0FF0200E2FFFDFFE9FFFAFFFCFFFCFF0D000800110012000300
      1600F3FF1100E9FF0500DDFFF9FFD9FFF5FFDDFFFAFFDCFFFCFFE7FFFFFFF2FF
      0200EDFF0400E2FFFFFFDCFFFFFFD8FF0000DAFFFEFFE0FFFAFFDBFFF8FFE0FF
      FCFFFDFFFFFF220000003B0006003B000B00280009001C0001001D00F8FF1E00
      EEFF1A00EBFF1900F0FF1700F3FF2300F8FF240000000B000400EBFF0100DCFF
      0400DCFF0F00E3FF1700ECFF1900EAFF1700EEFF1900040019001E0019002F00
      1E0030001E00240015001C0008001D00FAFF1C00E9FF1C00DAFF1D00D5FF1600
      D0FF1400D1FF1000DEFFFDFFF0FFE7FFFFFFDAFF1000D7FF2100DDFF2600E9FF
      2400E5FF1C00DAFF1600DBFF1000E8FF1300F5FF1F00F5FF2900EBFF2D00E6FF
      2800EEFF1B00F1FF0B00F0FF0100EEFFFFFFEBFFFFFFFAFF010010000A001700
      140019001200230010002F00120036000C00320003001B00FAFF0700FBFF0D00
      FFFF2400020037000B003B0010003200100025000F001A0006000D00F9FF0500
      ECFF0B00E9FF1700ECFF2F00EFFF4300F3FF3B00FAFF2300FAFF0B00FBFFF9FF
      FFFFEBFFFDFFE8FFFAFFDDFFF8FFD8FFFDFFE9FF00000100FFFF130005001200
      0C00FFFF1000EAFF1000DBFF0700CDFFF8FFC9FFECFFCEFFECFFD2FFF0FFE3FF
      F8FFF5FF0400F4FF0B00E4FF0800DAFF0B00DBFF1700E1FF2300E5FF2700DCFF
      2600D8FF2600EDFF250012002100340022003E001E002E001700190010000F00
      08000A00FBFF0A00EBFF0D00E5FF0900E6FF0C00E9FF1000F8FF01000700EDFF
      1200E4FF1D00E4FF2600EDFF2300F9FF1700F3FF0900E5FFFFFFE9FFF4FFF8FF
      EAFF0A00EDFF1500F3FF1500F6FF1B00F8FF2500F4FF2700EBFF2400E3FF2000
      E6FF1900EEFF2300F8FF370002003F000B0040000B0042000700400006003A00
      03002F00FCFF1100F3FFF1FFF0FFE8FFF3FFF5FFF7FF0B000400150012000B00
      1A00FCFF2200F2FF2300E7FF1B00DDFF1000DAFF1000D3FF1500D7FF1800E7FF
      1F00EBFF2500E7FF2400E4FF2200E2FF2100E5FF1B00EAFF1200DFFF0C00D3FF
      0B00E3FF0D00FFFF0F001900160026001C0021001B001B0018001A000F001200
      FDFF0800EBFF0500E4FF0000E4FF0900E9FF1A00F4FF1900FFFF0D0001000600
      01000900080012000B001E0009001E000400180000002600FFFF3E00F9FF4E00
      F8FF5000F7FF4300F3FF3500EEFF3100EAFF3000E2FF3200D2FF3600CCFF3000
      CBFF2E00CEFF2E00DDFF1A00F0FFFCFFFFFFEBFF0900E5FF1300EBFF1700F8FF
      1700F1FF1300DDFF0B00DAFF0500E5FF0000F0FF0500F5FF1000E8FF1500DCFF
      1800DFFF1800E6FF0F00EAFF0100EDFFFFFFE8FF0000F0FF030004000B000900
      1400070013000C000F001900100026000D003000080023000700080006000400
      07001300080020000B0024001200190012000B00140008001500070009000A00
      F8FF1200EDFF1200E9FF1700E7FF2200EEFF1C00FBFF0C000200FDFF0600F1FF
      0B00ECFF0900F5FF0800F8FF0600F0FF0100F7FF00000D00FCFF2000FAFF2A00
      FEFF2100FFFF0C00FFFFFBFFF9FFEBFFEAFFE4FFD8FFE7FFCFFFEAFFD3FFF6FF
      DFFF0B00F0FF1100FEFF0800FDFF0000FCFFFFFF01000100080008000E000300
      1100F9FF1200080014002900120045000F004F000D00430006002A00FFFF1900
      F8FF0D00EDFF0400DFFF0400DAFF0400E1FF0800EBFF1000000009001900F8FF
      2800F0FF3000ECFF3500EDFF3200F1FF2A00EAFF2000D8FF1300DAFF0A00EEFF
      04000100050012000B001E000B0021000900260005002600FCFF1E00F1FF1700
      EEFF0F00F5FF1100FDFF26000A0030001600290017002100100018000B001200
      06000F000100FEFFFEFFDCFFFAFFCCFFF9FFD8FFFBFFEEFFFFFFFCFF0800FAFF
      0F00EBFF1100E4FF0F00E2FF0300DFFFF3FFE2FFE9FFDDFFE6FFDCFFE8FFE7FF
      F0FFEAFFFDFFE6FF0600E4FF0A00E5FF0F00EBFF1000F3FF0F00F1FF0C00E1FF
      0800DFFF0700F5FF07000B000B001D00130023001A001B001C00130018000B00
      0900FFFFF5FFF3FFE8FFE8FFE4FFE3FFE9FFEEFFF5FFF3FF0600F3FF0D00F8FF
      0F00FCFF1700FEFF1A0006001A0008001700FFFF140000001600100017001C00
      17002300150026001000200009001C0004001E00FAFF2300E9FF2A00DAFF2900
      D6FF2300DAFF2100E9FF14000000FEFF0D00F1FF1300EEFF1B00EFFF1E00F5FF
      1E00F2FF1E00DDFF1900CFFF1600D7FF1600E4FF1A00ECFF2300F3FF2B00F3FF
      3100F7FF3300FDFF2F00FCFF2300FCFF1200FBFF0700FFFF01000F0004001700
      0B0012000900120004001900FFFF1E00FCFF2400FDFF1E00030008000700FFFF
      0B000B000C0017000E001A001000170012000C00110005000D00090006000D00
      FBFF1400EFFF1800E8FF1900E6FF1F00EBFF1C00F8FF0D00FFFF0100FFFFF5FF
      0100EBFF0400EEFF0800F5FF0B00EDFF0E00E5FF0F00F2FF0B00030009000D00
      0D001000170003001D00EEFF1D00DFFF1300D4FF0000D5FFF1FFD8FFEDFFDFFF
      F5FFF3FF0400FCFF1200F6FF1500F4FF1000F5FF1000F5FF1300FBFF1500FFFF
      1700F8FF1900F5FF1A00080018001A001500210015001E001500120010000300
      0800FBFFFEFFF8FFF0FF0100E2FF0B00E2FF0D00EEFF0F0000000C0012000400
      1B00040017000700120003000E0000000600FDFFFFFFF2FFF5FFECFFEEFFF8FF
      EBFF0700EEFF1400F6FF2500FCFF2F00FEFF3200FCFF3200FCFF2900F8FF2100
      F1FF1C00F0FF1A00F5FF2800000034000B00310010002F0008002E0000002600
      FAFF1F00F5FF1400F7FFFBFFF9FFE7FFFAFFE9FFFCFFF5FF0100FBFF0B000000
      1400FEFF1500F8FF1200F6FF0D00EFFF0300E9FFF9FFE5FFF3FFE0FFF1FFE7FF
      F8FFEEFF0700EBFF1500F0FF1500F8FF1300F5FF1000F3FF0B00F3FF0B00EBFF
      0C00E5FF0B00F1FF0800040008000E00100017001A0017001F0010001E000600
      1900F8FF0C00F0FFFCFFEFFFF2FFEFFFF0FFFAFFF9FF060008000D0012001800
      100023000F0026000C002B0005003600FFFF3800FAFF3700F4FF3F00EEFF4500
      E9FF4300E7FF4300E7FF3C00E7FF3300E6FF3000E3FF2F00DAFF3400CEFF3B00
      C9FF3700D1FF2F00E0FF2100F4FF06000100F5FFFFFFEFFFFCFFE7FFFBFFE2FF
      FAFFDEFFFEFFCEFF0100C1FF0100C3FFFFFFC9FF0200CEFF0C00D8FF1600E6FF
      1C00EEFF2000F0FF2200EBFF1C00E9FF0F00F0FF0500F4FF0400FAFF0B000000
      1700FAFF1D00FFFF120011000700190005001900050017000A000C000E000000
      0F0000000D0004000E0003001300040015000500140003000D00050006000800
      FBFF0F00F0FF1700E9FF1100E7FF0B00ECFF0A00F9FF01000600010008000500
      080003000B0001000B0005000B0004000B00010006000900FCFF1900F4FF2400
      F5FF2A00FCFF290000001C00FFFF0B00FAFFF6FFF0FFE9FFE4FFEAFFDFFFF1FF
      E4FF0000F1FF0E000400100012001200110019000D0015000D000C000B000B00
      0D000B0014000D0019001C001900280018002600190021001700180012000A00
      0800FEFF0000F5FFF5FFF8FFE9FF0300E7FF0400F0FFFFFFFFFFFCFF1200F4FF
      2200F3FF2300FAFF1F00F3FF1C00E6FF1300E1FF0B00DFFF0600DFFF0300E7FF
      FCFFF3FFFCFFFBFF040006000B0015000C001E000B0022000A001C0006001400
      FFFF1000FAFF0B00FBFF0B0001001200100010001D000A001C000D0017000E00
      15000B000F000800100001001300F6FF1500F3FF1000F5FF0D00F3FF1000F4FF
      1000FCFF0D0003000A00060002000300F6FFFFFFE9FFFFFFDDFFFBFFD7FFF6FF
      D8FFF5FFE7FFEEFFFAFFEEFFFFFFFCFF000003000300FDFF0600F8FF0B00F0FF
      0F00EBFF0D00EFFF0400FAFFFCFF00000400070010000F0017000D0018000100
      1500EFFF0D00DFFF0000DBFFF7FFDAFFF4FFDDFFFAFFE9FF0900F3FF1800FFFF
      1A00110015001C0012001A000E0019000B0019000E00150010001A000D002100
      080021000B001E000D001C000B00190005001700FBFF1500EEFF1500E2FF2000
      E0FF2700E7FF2400F1FF1E00FFFF0B000C00F8FF0C00F4FF0400F0FF0100E4FF
      FFFFDAFF0300D2FF0B00D0FF0F00D8FF0B00E2FF0600E7FF0E00ECFF1700FBFF
      190008001C000D001B000A00160007000C000D0002001200FBFF1000FAFF1000
      FEFF0B0004000D0000001800F8FF1F00F8FF1900FCFF120004000F000D000D00
      17000E001B000F001B00080020000000210001001A00060012000B0008001000
      FCFF1500F4FF1B00EFFF1800EDFF0F00EFFF0800F6FF02000100FEFF03000600
      01000D0003000600030000000300FCFF0400FCFF03000100FCFF0600F7FF0300
      FFFF03000B0006000E0008000D0001000800ECFF0100D8FFF5FFCEFFEBFFD0FF
      E7FFD6FFECFFDFFFFEFFE6FF1200EDFF1A00FBFF160002001200FCFF0D00F3FF
      0A00F3FF0E00F7FF1700FFFF1A000600180004001E000100240000002100FDFF
      1A00FAFF0F00F8FF0000FCFFF3FF0600EEFF0D00F2FF0B00FAFF090006000600
      100004001100090006000B00FDFF0000F3FFF4FFEEFFEDFFEEFFEBFFF0FFF3FF
      F0FF0000EEFF0B00F6FF1900030026000A002F000B00320009002A0004001E00
      FFFF1B00FCFF1900FCFF1600FEFF1800060017000F001300100015000A001C00
      05001C0001001900020015000800120010000F0011000B000B0001000900FDFF
      0D0000000D0006000E000A000E00090007000600FDFF0800F6FF0800F1FFFFFF
      F0FFF5FFFAFFEDFF0900EBFF1100F6FF110002001400FFFF1800F6FF1A00F0FF
      1A00EDFF1700EFFF0D00F1FF0200F0FF0400F4FF1100FBFF1A00FCFF1D00F9FF
      1E00EEFF1600E2FF0B00DEFF0000DEFFFAFFDFFFFAFFEBFF0000FAFF0B000800
      10001C000B002F000500340000003100FBFF2D00F9FF2D00F9FF3400F5FF3A00
      EEFF3400EEFF2800F7FF2100FBFF2100F8FF2700F3FF2A00ECFF2600EAFF2500
      EEFF2800F3FF2600FBFF1E00040012000D0002000E00FDFF0400FCFFFAFFEFFF
      F3FFDBFFF4FFD0FFFAFFD0FF0100D9FF0400E2FF0400E4FF0A00EBFF1300F9FF
      1500040011000A000E000800080002000200FFFF0000FEFF0000F8FF0300F8FF
      0700FEFF0E0004000D000E0005001900010017000100120004000E000A000C00
      14000D001A000F0018000800140000001400FCFF1200FCFF0A00050002000D00
      F9FF1000F1FF1400F0FF1500F2FF1000F4FF0700F8FFFFFF0000F8FF06000100
      060012000800150009000C000900080005000B00FFFF1200F6FF1500EEFF1200
      EBFF1400F3FF1E00FAFF2200FBFF1D00FCFF0D00F9FFF7FFF3FFEBFFECFFECFF
      EBFFEEFFF1FFF0FFFEFFF5FF0E00FBFF150007000F0014000900150004000D00
      FFFF0800FFFF0A00060012000C0019000D00150010000E0014000A0015000400
      0D00040004000500F9FF0300EDFF0600E9FF0B00F0FF0A00FAFF04000700FAFF
      1700F3FF1E00F7FF1A0000001200FEFF0B00F0FF0500E6FF0200E4FF0300EAFF
      0400F6FF0000FFFF040007001000140019001C00150022000D00210006001600
      FDFF0E00FAFF0C00FAFF0600FDFF0100020000000C00FCFF1200FFFF10000600
      0B0007000800040007000100080004000C0006000E0006000800FFFF0100F6FF
      FDFFF5FFFAFFF6FFF5FFFEFFF0FF0400EBFF0200E5FF0200E2FF0400E1FFFFFF
      E2FFF3FFE7FFECFFF3FFEBFFFDFFF4FF0400FDFF0B00FCFF1200F2FF1400EAFF
      1200EAFF1100F0FF0D00F5FF0400F5FF0100F6FF0A00FCFF1600FCFF1900F8FF
      1900F3FF1400E4FF0800D9FF0100D7FFFFFFD7FF0100DBFF0500E7FF0E00F3FF
      1500040012001900100021000F0021000E001B000D0019000C001D000C002400
      08002100070015000D000D0012000A000A00100001001600FAFF1300F2FF1300
      F0FF1900F3FF1C00FCFF170003000D000B0001000E00FCFF0800FCFF0400F5FF
      0100E5FF0000D8FF0000D8FF0400DEFF0900E9FF0B00F5FF0D00010015001100
      1C00190019001D0014001F00100019000800100004000E000300080004000100
      060000000800FDFF0A00020005000D0003001300040012000A000B0012000100
      1A00FFFF1F0001001B00FEFF1500F7FF1500F5FF1400F7FF0B00FFFF01000900
      FAFF0B00F4FF0B00F3FF1000F5FF0D00F8FF0200FBFFF5FF0100EEFF0600F6FF
      0600060006000D00080008000700010003000000FFFF0000FEFF0300FEFF0200
      0000010009000800140010001600100015000B001100FBFF0800EEFF0000E9FF
      FFFFE5FF0100E2FF0500E5FF0B00E7FF1400EEFF1500FAFF120003000E000400
      0A0001000800FFFF0B00010012000900150008001400FFFF1600F6FF1900F3FF
      1400FAFF0A00050000000B00F5FF0D00EFFF1500F2FF1900FAFF150002000D00
      070006000900050004000A00FEFF0900F8FF0100F2FFF8FFEEFFF3FFEEFFF8FF
      F3FF0400F9FF0D00FFFF130008001E000E0026000C0028000800260003001E00
      FCFF1500FAFF1200FCFF0E0003000600080001000C00FFFF0D00000009000800
      06000F00070010000A0014000C0015000D0015000E0015000B00100006000400
      0600FCFF0600FDFF03000100FDFF0700F9FF0800F5FF0900EEFF0E00ECFF0D00
      EDFF0300EFFFF8FFF4FFF0FFFCFFF1FF0100FAFF0600FEFF0A00FAFF0B00F3FF
      0900F0FF0600EEFF0400F2FF0100F5FF0200F6FF0B00FAFF1700FCFF1E00FAFF
      1C00F5FF1500EBFF0B00E2FF0400E2FF0100E9FF0400EEFF0700F7FF0B00FFFF
      0D000A000C001D0008002D000600340001003300FEFF2D00FBFF2900F9FF2F00
      F5FF3200F4FF2A00F8FF2300FCFF2100FCFF1E00F7FF1E00F0FF1C00E9FF1A00
      E7FF1C00EEFF1C00FAFF170003000D00040001000300F7FF0000F3FFFAFFEBFF
      F7FFE0FFF0FFD7FFEBFFD1FFECFFD0FFF5FFD7FF0000E4FF0800F1FF0C00FFFF
      0E0008000D000A00080009000400060000000100FEFFFBFFFFFFF6FF0600F0FF
      0B00F0FF0C00F3FF0C00F8FF0900040006000E00080011000C000F0010000800
      130001001200FFFF1000FDFF0C00F7FF0A00F5FF0800F8FF0400FEFFFFFF0800
      FBFF0F00F9FF1000F5FF1500F4FF1500F8FF0D00FDFF04000000FCFF0400FEFF
      05000900070012000B0015000900130001000F00F8FF0C00F1FF0F00EEFF1200
      EEFF1200F5FF1700FCFF1E000200220004001F0002001600FFFF0800FDFFFCFF
      FEFFF5FF0200EEFF0600ECFF0800EEFF0D00F0FF1000FBFF0E0008000C001000
      0A001300090010000C000B000F000C0011000F0013000900160002001A00FEFF
      1900FCFF1100000004000400F8FF0600F1FF0800F3FF0800FEFF05000B00FFFF
      0F00F6FF0F00EEFF0B00F0FF0500F5FF0100F5FFFCFFF3FFF5FFEEFFF5FFEBFF
      F8FFF0FF0000FAFF080000000D00080010000D0010000D000D000B0006000800
      00000500FBFF0300FEFF03000700FDFF1000F6FF1000F0FF0D00EDFF0900F4FF
      080000000E000A0015001200190014001900100017000E0013000E000D000B00
      06000800FFFF0900F8FF0900F1FF0A00EBFF0E00E9FF1200E7FF1400E5FF1500
      E9FF0D00EEFF0200F3FFF7FFF7FFECFFFCFFECFF0100F1FF0600F5FF0900F5FF
      0800F1FF0400EDFF0000EEFF0100F5FF0800FAFF0E00FCFF1600FFFF1C00FCFF
      1E00F7FF1A00F0FF1500E9FF0D00E4FF0800E4FF0800E5FF0A00E9FF0B00EEFF
      0C00F4FF0D0002000D0014000D0020000C0026000900250005001E0003001900
      000019000200170005001400080011000B000B0008000600FEFF0600F4FF0800
      F0FF0B00F1FF0F00FCFF0D0007000B000B0006000B00FCFF0A00F7FF0600F1FF
      0100EAFFFBFFE4FFF4FFDFFFF1FFDDFFF5FFE2FFFFFFF2FF080002000D001000
      0D0019000B001C0006001B0000001900FAFF1400F6FF0E00F5FF0800FCFF0400
      04000100050000000400FFFF010001000200080009000D0013000C0019000600
      1A00FCFF1900F5FF1700F3FF1400F3FF1000F6FF0B00FCFF0800000007000400
      04000A00FFFF0D00FAFF0E00F8FF1000FEFF0D00060004000800FDFF0800F8FF
      0500FAFF0400040005000C0005001000FFFF0F00F6FF0600EFFFFFFFEDFF0100
      F1FF0800F8FF100001001500080014000B0010000B000900070002000300F8FF
      0000EBFF0000E2FF0400DDFF0400DAFF0400D8FF0500DDFF0700E9FF0B00F8FF
      10000400100006000D00FEFF0D00F3FF0D00F1FF1000F5FF1000F8FF1200FAFF
      1200FAFF0E00FDFF06000300FCFF0A00F5FF0E00F1FF1200F8FF120004000E00
      08000900070000000300FBFFFDFFFEFFF8FF0100F3FF0200EDFF0000EBFFFBFF
      F0FFF8FFFAFFFEFF04000A000A0017000F002100100021000E001C000A001500
      04001000FFFF0B00FFFF0800060001001000FAFF1200F4FF0F00F2FF0900F6FF
      060000000A000D0010001A00110020000D001C000B0013000800100006001200
      02001200FFFF1200FCFF0F00F8FF0D00F8FF1200F4FF1800F0FF1A00EEFF1A00
      F1FF1700F9FF1000FEFF04000000F2FF0300E7FF0500E8FF0800EDFF0C00F1FF
      0B00F1FF0500EDFF0300E8FF0400ECFF0800F3FF0C00F7FF1200F8FF1700F5FF
      1900F4FF1800F3FF1200F2FF0900F0FF0100EEFF0000EFFF0400F1FF0500F7FF
      0400FCFF0100020000000F0002001E0006002A000400300000002A00FCFF1C00
      FAFF1500FAFF1700FCFF1A00010019000600120005000C00FFFF0D00F8FF1000
      F3FF1300F4FF1500FCFF15000B001000120008001200FFFF0F00F4FF0700EEFF
      0200EEFFFFFFF0FFF8FFF1FFF2FFEEFFF2FFE9FFF8FFF0FFFDFFFEFF01000B00
      040015000400170000001400FEFF0F00FBFF0A00F7FF0600F5FF0400FAFF0000
      0400FCFF0800FBFF0700FAFF0400FBFF060001000D000600160009001A000800
      190001001600F4FF1300EEFF0F00F2FF0A00F9FF060000000300050000000600
      FFFF0800FBFF0A00F6FF0E00F3FF1300F5FF1700FCFF150001000F0001000400
      0100FCFFFFFFFFFFFEFF0600FFFF1000FBFF1400F4FF1000EEFF0600EDFF0600
      F0FF1200F4FF1D00FBFF24000100230006001E000A0019000B00110007000600
      0200FCFF0100F4FF0600ECFF0900E9FF0800E6FF0700E7FF0600EEFF0800FCFF
      0D000B000D00120008000D000600FFFF0800FAFF0B00FFFF0B0004000C000600
      0B00060006000500FFFF0600F6FF0900EEFF0D00EBFF0F00F1FF0E0000000900
      0B0002000E00FAFF0C00F3FF0600F0FF0000F3FFFCFFF8FFFAFFFCFFF6FFFAFF
      F8FFF0FF0000ECFF0600F5FF0B0000000F00090010000C000F0009000E000600
      0B00050005000400000001000100FCFF0A00F4FF0F00F0FF0B00F0FF0500F1FF
      0100FAFF03000800090015000F001A000E0015000A0009000600030000000700
      FBFF0D00F8FF1100F5FF1200F2FF1300F0FF1500EDFF1500E9FF1300E7FF1200
      EAFF0E00F3FF0600FAFFFAFFFDFFEBFF0000E0FF0300DDFF0500E2FF0800EAFF
      0800EFFF0400EEFFFFFFE8FF0000E7FF0400EEFF0800F5FF1000FAFF1800FDFF
      1C00FCFF1E00FBFF1B00F8FF1200F4FF0600EFFF0000EBFF0100EAFF0400EEFF
      0400F3FF0500F8FF060001000A0011001000240012002F000D002B0008001A00
      06000B000500090006000B000A0008000E0001000D00FCFF0800FAFF0100FCFF
      FBFF0100F7FF0800FAFF0E0006000E0010000900110000000E00F3FF0800EBFF
      0200EDFFFDFFF3FFF8FFF9FFF3FFFAFFF2FFF6FFF6FFF8FFFCFF040000001000
      01001A0004001F0002001F0001001C000300170001001200FEFF0E00FFFF0A00
      060003000B00FCFF0B00F8FF0A00F3FF0A00F3FF0D00F6FF1600FFFF1E000200
      1F00FEFF1C00F3FF1900EBFF1300EBFF0C00F2FF0600F9FF0400FFFF01000400
      0100060001000600FEFF0800FAFF0C00FAFF0E0000000B00050004000500FAFF
      0400F0FF0100EEFFFFFFF6FFFFFF0200FFFF0A00FAFF0800F5FF0000F3FFFEFF
      F6FF0600F9FF1300FFFF1A0009001C0012001900190013001C0009001800FFFF
      1000F6FF0A00F0FF0A00EBFF0A00E8FF0800E8FF0700E7FF0600ECFF0800F8FF
      0B0004000F000B000D0008000A00FFFF0800F8FF0900F9FF0700FFFF06000400
      090006000700080001000900FCFF0A00F6FF0D00F1FF1200F4FF150001001400
      0C00100010000A000D0001000700FBFFFFFFF8FFFAFFFAFFF8FFFDFFF5FFFBFF
      F5FFF5FFFAFFF4FF0000FCFF03000A00050015000A001A000B0019000B001500
      0A000D0005000700FFFF01000000FEFF0700FAFF0D00F6FF0E00F5FF0B00F5FF
      0700FBFF06000600080014000C001C000D001A000B0011000900080005000800
      00000D00FBFF1200FAFF1500FAFF1900FAFF1B00F9FF1B00F6FF1900F2FF1900
      F2FF1500F8FF0C00FDFF0000FFFFF2FFFFFFE4FFFEFFDEFFFDFFE1FFFFFFE9FF
      0100F1FFFFFFF3FFFBFFEFFFFAFFEBFFFCFFEEFFFFFFF5FF0100FBFF09000000
      1000040015000600150004001000FFFF0600F9FFFEFFF5FFFDFFF3FFFEFFF5FF
      FEFFFAFF0000FDFF0200040004001200070023000A002D0008002B0005001D00
      03000D000300060003000600030008000600090009000A0006000A0001000800
      FCFF0900F6FF0C00F6FF1000FFFF0E00080007000D00FCFF0E00F0FF0A00E8FF
      0300EAFFFCFFF3FFF8FFFAFFF2FFF9FFEEFFF5FFF0FFF3FFF2FFFAFFF3FF0400
      F4FF0B00F9FF0F00FDFF1000FFFF0F0000000B00FFFF0600FCFF0200FBFF0100
      0000FFFF0500FBFF0500F8FF0500F3FF0800F0FF0A00F3FF0F00FAFF1500FFFF
      1600FFFF1500F8FF1200F1FF0F00F1FF0700F5FFFFFFFAFFFCFF0000FBFF0600
      FCFF0B00FCFF1000FAFF1200F5FF1600F4FF1A00FAFF1A000100150004000B00
      0400FEFF0300F5FF0000F6FFFEFF0000FEFF0800FBFF0900F8FF0600F6FF0400
      F5FF0900F5FF1200F5FF1800FDFF1A0008001A00100017001500100014000600
      0D00FEFF0500FAFF0200F5FF0400F1FF0500EEFF0600ECFF0700EEFF0800F7FF
      0B00040010000D0012000E000F0009000D0004000D0000000B00000007000000
      07000200060006000400080000000900FAFF0800F5FF0700F5FF0A00FCFF0B00
      050009000A0006000B00FEFF0800F6FF0300F4FFFEFFF5FFFBFFF6FFF8FFF3FF
      F8FFECFFFCFFE9FFFFFFEEFFFFFFF5FFFFFFFDFF02000300080005000B000600
      0B0002000800FCFF0600F6FF0300F5FF0600F6FF0900F7FF0800F8FF0600F7FF
      0600FAFF0600020008000E000C0016000E0015000E000D000F0006000D000600
      06000C00FEFF1300F8FF1900F8FF1F00FAFF2100FAFF2000F7FF1C00F3FF1500
      F0FF1000F5FF0900FBFFFFFFFDFFF5FFFDFFEAFFFEFFE1FFFFFFE0FF0000E6FF
      0100EBFF0000EDFFFFFFEBFF0000EAFF0400EEFF0500F4FF0600FBFF0B000100
      140004001B0006001C0004001700FFFF0F00F8FF0600F4FF0100F2FF0000F0FF
      0000F3FF0100F8FF0500FFFF07000B000A001C000D0028000D0029000B001E00
      0B000E000B0001000800FBFF0500F8FF0400F8FF0600FAFF0600FFFF04000000
      01000100FCFF0400FAFF0800FFFF0C00080009000C0001000E00F7FF0C00EEFF
      0600F0FFFDFFF8FFF8FFFCFFF3FFFDFFF3FFFAFFF6FFFAFFFAFFFFFFF9FF0500
      F8FF0B00FAFF1000FFFF1600040019000400180000001200FCFF0B00FAFF0600
      FDFF01000300FBFF0400F8FF0400F4FF0700F1FF0A00F2FF0C00F8FF1000FFFF
      120000001400FAFF1600F3FF1500F1FF0E00F3FF0600F6FF0100FAFF02000000
      0500080005000E0002001100FEFF0F00FAFF0C00FBFF0C000000090001000400
      0100FBFF0200F1FF0200F1FF0100FAFF00000200FCFF0600F8FF0600F8FF0500
      F8FF0900F7FF0F00F6FF1200FCFF13000600120010000E00170006001500FDFF
      0F00F5FF0600F2FF0100F0FF0100EEFF0100ECFF0100EBFF0400EBFF0600F0FF
      0800F9FF0C0001000C0004000A0003000A00FDFF0800F9FF0600F8FF0200F9FF
      0000FBFF010000000200060000000B00FBFF0D00F8FF0D00F6FF1000F9FF1400
      0000120004000E00060006000600FCFF0300F7FFFFFFF8FFFCFFF8FFF9FFF5FF
      F8FFF3FFFAFFF3FFFCFFFAFFFCFF0100FCFF05000100090008000E000F001200
      12000F00100008000D0000000A00FCFF0900FDFF0B00FDFF0A00FBFF0800F8FF
      0700F8FF0700FFFF08000B00090014000A00150009000F000B0008000B000600
      04000B00FBFF0F00F5FF1400F5FF1C00F9FF2100FDFF2300FDFF1F00FCFF1700
      FAFF1000FAFF0A00FCFF0400FCFFFBFFFCFFF1FFFCFFE7FFFDFFE4FFFFFFE7FF
      0100EBFF0100ECFF0100EBFF0400EBFF0400EFFF0100F5FFFFFFFAFFFFFFFDFF
      050001000D00060012000700100004000B00FFFF0400FAFFFFFFF9FFFDFFF9FF
      FCFFFCFFFCFF0100FFFF050002000B000500150006001D0006001D0006001500
      090009000A00FFFF0800F9FF0400F6FF0000F8FF0100FEFF0400050006000700
      0400070000000700FFFF080001000B0008000B000E0005001100FCFF1000F5FF
      0B00F3FF0400F9FFFEFFFDFFF8FFFFFFF5FF0000F6FF0000F7FF0400F5FF0800
      F2FF0A00F3FF0A00F8FF0F00FEFF140001001400FFFF1000FBFF0B00FAFF0500
      FCFF00000000FCFF0300F8FF0200F4FF0400F0FF0600F0FF0800F6FF0B00FCFF
      0D00FCFF0F00FAFF1200F5FF1300F3FF0E00F7FF0600FAFFFFFFFCFFFCFF0200
      FEFF0C00FEFF1300FBFF1600F8FF1400F5FF1000F6FF1000FBFF1000FFFF0B00
      FFFF0300FFFFFAFFFFFFF8FFFEFFFEFFFCFF0400FAFF0600F8FF0600F7FF0600
      F8FF0800F7FF0D00F6FF1000FAFF1000010012000B00130012000F0014000800
      0F0000000800F9FF0400F5FF0300F3FF0400F1FF0600F0FF0A00EFFF0E00F3FF
      1000FCFF12000500100009000D0008000B0002000A00FEFF0500FEFFFFFFFCFF
      FBFFFCFFFCFF0000FFFF070000000D00FDFF1000F9FF0F00F6FF0D00F6FF0E00
      FAFF1100FFFF1000010008000300FEFF0400F7FF0200F6FF0000F5FFFDFFEEFF
      FBFFEAFFFCFFEAFFFEFFEEFFFCFFF4FFFAFFF6FFFBFFF7FF0000FCFF08000400
      0E0006000E0004000B00FFFF0800FAFF0500FAFF0500FCFF0400FEFF0100FCFF
      0100FBFF0400FDFF0600060007000D000700100007000D00090008000B000600
      06000800FCFF0C00F4FF0F00F3FF1400F6FF1B00FCFF1E00FFFF1C00FCFF1500
      F9FF0B00F8FF0400F9FF0000FBFFFAFFFCFFF1FFFCFFE7FFFFFFE2FF0100E5FF
      0400E9FF0600E9FF0600EAFF0600ECFF0700F1FF0400F8FFFFFFFCFFFDFFFCFF
      0100FFFF080004000F000600110004000D0000000700FAFF0200F8FF0000F8FF
      FFFFFBFFFEFFFFFFFFFF010002000800060014000A001B000C0019000D001200
      0F0008001100FEFF0F00F7FF0800F2FF0200EFFF0200F2FF0600FAFF0800FFFF
      0800010005000100030004000200070005000B0007000900080003000600FAFF
      0400F7FF0000FAFFFBFFFEFFF8FFFCFFF6FFFCFFF8FFFEFFFAFF0100FAFF0800
      F8FF0C00F6FF0D00FAFF1000FFFF1400040015000400120001000C0000000400
      0100FCFF0600FAFF0800F7FF0800F3FF0700EEFF0800EEFF0B00F4FF0D00FAFF
      0F00FAFF1000F6FF1400F3FF1700F3FF1500F7FF0D00FBFF0400FCFF01000000
      0100070002000D0001001000FEFF0E00FAFF0900FAFF0700FBFF0600FDFF0500
      FEFFFFFFFFFFF8FFFFFFF4FFFFFFF9FFFFFFFFFFFDFF0200FBFF0400FAFF0600
      FCFF0800FCFF0B00FCFF0C00FCFF0B0001000800090009001200080017000400
      1500FEFF1000F8FF0A00F5FF0700F5FF0500F7FF0500F8FF0600F9FF0800FAFF
      0A0000000B0006000A00080007000500060001000700FCFF0600FBFF0000FBFF
      FBFFFAFFFBFFFCFFFEFF050000000E0000001300FDFF1400FAFF1100FAFF1000
      FCFF100000000F0004000900060000000700F9FF0600F8FF0400F8FF0000F4FF
      FCFFF1FFFBFFF1FFFCFFF5FFFCFFFAFFFBFFFDFFFCFFFDFF0100FFFF08000400
      0F000800100008000D000500080000000500FCFF0400FCFF0300FEFF0100FFFF
      0000FDFF0100FFFF0500060006000E000800100007000E0008000B000A000900
      07000B00FFFF0D00F8FF0F00F5FF1100F8FF1500FFFF18000200180001001200
      FFFF0A00FCFF0400FCFF0000FEFFFDFFFCFFF6FFFBFFEEFFFAFFE9FFFBFFEBFF
      FDFFF0FFFFFFF2FF0000F2FF0000F3FF0000F6FFFFFFFCFFFAFF0000F6FF0100
      F8FF0000FFFF0200060006000A00070009000600060001000100000000000000
      FFFF0100FDFF0100FEFF01000000040004000C00080013000B0012000C000D00
      0C0005000C00FDFF0A00F8FF0500F6FFFFFFF5FFFFFFF6FF0100FCFF06000200
      0A0007000A00080007000700050008000500080006000700050004000300FCFF
      0000F8FFFFFFF8FFFBFFFCFFF8FF0000F5FF0000F5FF0000F7FF0300F7FF0600
      F4FF0A00F2FF0A00F3FF0800F9FF0B00FFFF0E0001000F0001000B0000000300
      FFFFFCFF0100F8FF0200F6FF0100F3FF0000F0FF0100F0FF0400F3FF0600FAFF
      0800FAFF0900F9FF0B00F8FF0D00F8FF0B00FCFF06000000FEFF0200FAFF0500
      FAFF0A00FBFF1000FCFF1300FBFF1200FAFF1000FAFF0B00FCFF0A0000000800
      01000600FFFF0000FFFFFBFFFFFFFCFFFFFFFFFF00000000FFFF0100FFFF0100
      010003000200060001000800FDFF0800FDFF060002000600080007000C000600
      0D0002000A00FCFF0700F8FF0600F6FF0600F7FF0600F8FF0500F9FF0600FAFF
      0800FFFF0B0006000B0008000900080008000400070000000600FFFF0100FEFF
      FCFFFCFFFAFFFCFFFCFF01000000070002000D0001000F00FFFF0F00FCFF0D00
      FDFF0D0000000B0001000800010000000100F9FF0100F5FF0000F5FF0000F3FF
      FFFFF0FFFFFFEEFFFFFFEDFFFEFFF0FFFCFFF6FFFAFFF9FFFCFFFAFF0100FDFF
      070001000900030009000200060000000300FDFF0100FCFF0100FCFF0100FEFF
      0000FFFF0100FFFF050003000700090008000D0008000C00090009000A000600
      0A0006000600080000000B00FCFF0D00FEFF1000010013000400150002001300
      FFFF0E00FBFF0700FAFF0100FCFFFDFFFDFFF9FFFEFFF4FFFFFFEFFF0100EEFF
      0200F0FF0400F3FF0500F5FF0500F5FF0400F7FF0200FBFFFFFFFFFFFBFF0100
      FBFF000000000100060003000A0004000C0002000A0000000600FDFF0400FCFF
      0300FEFF01000000FFFF0200FFFF05000100090005000D0009000D000B000800
      0B0001000A00FAFF0900F5FF0600F2FF0100F1FFFEFFF1FF0000F4FF0400FCFF
      060003000800080006000A000300090001000900020008000100060000000400
      FFFFFDFFFEFFFBFFFDFFFCFFFCFFFFFFFCFFFFFFFCFFFFFFFCFF0000FCFF0200
      FAFF0600F8FF0800F9FF0800FDFF080002000A0005000B000600090006000400
      0400FDFF0100F9FF0100F6FF0100F5FFFFFFF3FF0000F3FF0200F4FF0600F8FF
      0A00FBFF0D00FBFF1000FAFF1000FAFF0E00FAFF0A00FEFF03000100FEFF0300
      FDFF0500FFFF080000000A0000000C00FFFF0B00FCFF0700FDFF040000000100
      0100FFFFFFFFFCFFFDFFFAFFFDFFFAFFFDFFFCFFFFFF00000000030000000400
      010003000100030000000400FDFF0500FCFF030000000100050000000A00FFFF
      0D00FEFF0D00FCFF0900FAFF0500FAFF0400FAFF0400FCFF0100FEFF0000FFFF
      01000100030005000500060006000400070000000600FDFF0600FAFF0300FBFF
      FFFFFCFFFAFFFEFFFAFF0100FDFF0600FFFF0B0000000E0000000F00FEFF0E00
      FDFF0D0000000B000100060001000100FFFFFCFFFFFFF8FFFDFFF7FFFEFFF7FF
      FFFFF6FFFFFFF6FFFFFFF6FF0000F8FFFFFFFCFFFFFFFFFF0000000004000100
      080001000B0003000B00040009000400060001000300FFFF0300FEFF0400FFFF
      010000000100010004000300060006000800080008000A0008000A0007000800
      0500080002000900FEFF0B00FAFF0B00FAFF0A00FCFF0B00FFFF0B00FFFF0C00
      FFFF0A00FCFF0500FCFF0000FFFFFDFFFFFFFBFFFDFFFAFFFCFFF7FFFCFFF4FF
      FCFFF5FFFDFFF6FFFFFFF8FF0000F9FF0000FAFFFFFFFAFFFDFFFCFFFCFFFFFF
      FAFF0100FDFF0100010002000500030006000400060005000300040000000100
      010001000100010001000300000005000100060004000800080008000B000500
      0B0001000800FCFF0600F8FF0300F6FFFFFFF7FFFEFFF8FF0000FAFF0400FFFF
      080003000A0008000A000B0008000A0005000800040007000300050001000300
      FFFF0000FFFFFEFFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FCFF0100
      FAFF0500F7FF0800F6FF0900F9FF0A00FCFF0A00000009000300080003000600
      01000100FFFFFCFFFEFFF9FFFFFFF7FFFEFFF6FFFDFFF7FFFFFFF8FF0100FBFF
      0400FFFF07000000090000000A00FFFF0800FEFF0400FFFFFFFF0300FBFF0600
      FAFF0700FCFF0800FDFF0B00FDFF0D00FCFF0E00FCFF0B00FCFF0700FFFF0400
      00000100FFFFFFFFFCFFFDFFFCFFFBFFFDFFFCFFFFFFFFFF0100000003000000
      040000000300000001000100FFFF0300FCFF0200FCFF01000000010004000100
      080001000B0001000B00FFFF0800FCFF0800FCFF0700FBFF0600FCFF0300FEFF
      0200000003000300050005000700050008000400080001000600FEFF0200FCFF
      FFFFFCFFFCFFFCFFFAFFFFFFFCFF0400FEFF0700FFFF0B0000000E0000000E00
      FEFF0C00FFFF0A00FFFF0600FFFF0100FCFFFCFFFCFFF8FFFCFFF5FFFCFFF5FF
      0000F5FF0100F5FF0100F5FF0000F5FFFDFFF8FFFCFFFBFFFCFFFCFFFFFFFDFF
      0100FEFF0500FFFF0600010006000200040001000100FFFF0000FFFF0100FFFF
      0100010001000200030004000400050006000700070007000800060008000500
      060004000400050001000600FFFF0700FEFF0700FFFF0800FFFF0800FEFF0A00
      FCFF0A00FCFF0600FBFF0200FEFF00000100FCFF0200FAFF0100F8FF0100F5FF
      0100F5FF0100F5FF0200F8FF0300FAFF0200FBFF0100FCFFFFFFFDFFFDFF0000
      FBFF0100FCFF0100FFFF01000300FFFF06000000060001000400010001000100
      0100010002000300020005000000070000000800010007000400060007000400
      0A00FFFF0B00FAFF0900F6FF0600F5FF0300F6FF0000F8FF0000FAFF0200FDFF
      0500010006000500070008000600090004000800010006000100040000000100
      FFFF0000FCFFFFFFFCFFFFFFFDFFFFFFFFFFFFFF0000FFFF00000000FEFF0000
      FCFF0100FAFF0400FBFF0500FCFF060000000600040005000600040007000300
      0500FFFF0100FBFFFFFFF8FFFFFFF6FFFFFFF7FFFFFFF8FF0100F8FF0400F9FF
      0700FBFF0B00FDFF0D00FEFF0D00FDFF0B00FCFF0700FDFF02000000FFFF0300
      FDFF0400FEFF0600FFFF0600FFFF0800FFFF0A00FEFF0700FFFF040000000100
      0100FFFF0100FDFFFFFFFCFFFEFFFCFFFCFFFDFFFDFFFFFFFFFF010001000100
      01000100010000000100FFFFFFFF0000FFFF0100FFFF00000100FFFF0500FFFF
      080000000A00020009000100080000000600FFFF0600FFFF0500FFFF02000100
      010002000100040001000400040004000600040007000200060000000400FEFF
      0100FFFFFEFF0000FCFF0100FCFF0400FFFF06000000090001000C0001000D00
      01000B00010008000100040001000000FFFFFCFFFDFFF8FFFCFFF7FFFDFFF7FF
      FFFFF8FF0200FAFF0400FAFF0300FAFF0100FAFFFFFFFDFFFFFFFFFFFFFFFFFF
      0100FFFF0400FFFF05000000050003000300030001000200FFFF010000000100
      0100000001000100010003000300040004000600050007000600060006000600
      060006000300060000000600FFFF0600FEFF0600FEFF0500FFFF0400FFFF0400
      FFFF0400FFFF0400FFFF0200FFFF0100010000000100FFFFFFFFFCFFFFFFFAFF
      FEFFF8FFFEFFF8FFFFFFFAFFFFFFFBFFFFFFFCFFFFFFFDFFFDFFFDFFFCFF0000
      FBFF0200FBFF0300FDFF02000000010001000100020002000100020001000100
      0100010002000100020002000100040001000300010002000200020004000100
      0600FFFF0700FCFF0600FAFF0500F8FF0300FAFF0100FCFF0100FDFF0200FFFF
      04000100060004000700060006000800040008000200070001000500FFFF0300
      FDFF0100FCFF0000FCFFFFFFFCFFFFFFFFFFFFFF00000000FFFF0000FDFF0000
      FCFF0000FAFF0200F9FF0500FAFF0600FCFF0600FFFF05000100030003000100
      0200FFFF0000FCFFFFFFFAFFFFFFFAFFFEFFFAFFFEFFFCFFFFFFFDFFFFFFFFFF
      010000000200000004000000060000000500FFFF0300FFFF00000100FDFF0400
      FCFF0500FCFF0700FCFF0900FDFF0A00FEFF0B00FDFF0A00FDFF0800FFFF0500
      01000200010000000100FFFF0100FDFF0000FDFF0000FFFF0100FFFF0300FFFF
      0400FFFF0400FEFF0300FDFF0100FFFFFFFF0100FFFF0000000000000200FFFF
      0500FFFF0700FFFF080000000700FFFF0600FFFF0600FFFF0400FFFF01000000
      00000100FFFF0100FFFF0200010004000400040005000200050000000400FFFF
      0100FFFFFFFFFFFFFCFF0000FCFF0100FDFF0400FFFF06000000080000000800
      0000080000000500FFFF0200FFFFFFFFFFFFFCFFFEFFF9FFFEFFF7FFFEFFF8FF
      FFFFFAFF0100FBFF0100FBFF0100FBFF0000FAFFFEFFFCFFFCFFFEFFFCFFFFFF
      FFFFFFFF0100FFFF0300FFFF0400FFFF0200010000000100FFFF0100FFFF0100
      FFFF010000000100010003000200040004000500060005000700040008000400
      0700040006000200040002000300040001000400010004000000040000000400
      00000400FFFF0400FFFF040000000200020001000300FFFF0300FDFF0200FBFF
      0100FAFF0100FBFF0100FCFF0100FDFF0000FEFF0000FFFFFFFF0000FFFF0100
      FEFF0200FDFF0200FFFF01000100010002000000040000000400000004000100
      030001000300030002000300010003000100020000000100000000000100FFFF
      0400FCFF0600FAFF0600FAFF0500FAFF0400FBFF0100FCFFFFFFFEFFFFFFFFFF
      01000000020001000400040003000600020006000100060000000500FFFF0400
      FDFF0200FDFF0000FDFFFFFFFFFFFFFFFFFF0000010000000100FFFF0100FFFF
      0000FFFFFFFFFFFFFEFF0100FEFF01000000010003000100050000000500FFFF
      0400FFFF0200FEFF0000FCFFFFFFFCFFFFFFFCFFFFFFFCFF0000FDFF0100FDFF
      0400FEFF0500FFFF0600FFFF0600FFFF0600FFFF0400FFFF01000000FFFF0100
      FDFF0300FDFF0400FEFF0500FFFF0500FFFF0400FFFF0400FFFF0400FFFF0200
      01000100010000000100FFFF0100FEFF0000FDFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FEFF0100FCFF0100FCFF0100FEFF0100FFFF000001000000010001000100
      030000000400FFFF0400FFFF0400000003000000030001000100010001000100
      00000100FFFF0100FFFF01000000030001000300040001000400010004000000
      0300000001000000FFFF0100FFFF0100FFFF0200000004000100050001000500
      010005000100040000000200FFFF0000FFFFFEFFFEFFFCFFFEFFFAFFFFFFFAFF
      FFFFFCFF0100FDFF0100FDFF0200FDFF0100FDFF0100FFFFFFFF0000FFFF0100
      FFFF000001000000030000000400000003000100010002000000020000000200
      0000010000000100010001000200010003000300040004000400040004000300
      04000200030001000100010001000100FFFF0100FFFF0100FFFF010000000200
      FFFF0300FFFF0400FFFF0300FFFF0200FFFF010000000100000000000000FEFF
      0000FCFFFFFFFCFFFFFFFDFFFFFFFEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF0000
      FEFF0100FDFF0200FEFF0100FFFF010000000100010000000100000001000000
      01000000010001000100010001000100010000000100FFFF0100FFFF0100FFFF
      0100FFFF0300FDFF0400FCFF0400FCFF0400FCFF0200FFFF0100FFFF00000000
      0100010002000200030004000300040002000500010005000100050000000400
      FFFF0300FFFF0100FFFFFFFFFFFFFFFF0000000000000100010000000100FFFF
      0100FFFFFFFF0000FFFF0100FDFF0200FEFF0100FFFF0100010000000100FFFF
      0100FFFF0100FFFF0000FFFFFFFF0000FFFF0000FEFF0000FFFF0000FFFF0000
      000000000100010001000100020000000200FFFF010000000100010000000200
      FEFF0300FDFF0400FEFF0400FFFF0500FFFF0500FFFF0500FFFF0400FFFF0300
      00000200010001000100FFFF0100FEFF0100FCFF0100FDFF0100FFFF0000FFFF
      0000FDFF0100FCFF0100FDFF0100FFFF00000000000001000000000001000000
      0200FFFF0400FFFF0400FFFF0400FFFF04000000030001000200010001000100
      0000010000000000000000000000010001000100020001000300000003000000
      0200000001000100FFFF0100FFFF0100FFFF0100FFFF0300FFFF0400FFFF0400
      FFFF0300FFFF0200FFFF0100FFFF0000FFFFFFFFFFFFFEFFFFFFFCFFFFFFFCFF
      FFFFFEFFFFFFFEFF0000FDFF0000FCFF0000FCFF0000FEFFFFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFF0100FFFF01000000010000000100010000000100FFFF0100
      0000010000000100010001000100010003000100040001000400010004000100
      040000000400FFFF030000000100000000000100FFFF0100FFFF010000000100
      00000200FFFF0200FFFF0100000001000000010001000100010000000100FFFF
      0100FEFF0100FEFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      FFFF0100FFFF0100FFFF0100FFFF000000000000010000000100000001000000
      01000100010001000100020001000100000001000000FFFF0100FFFF01000000
      010000000100FFFF0200FFFF0300FEFF0300FFFF0200FFFF0100FFFF00000000
      0000000001000100010001000100020001000300000003000000040000000300
      FFFF0100FFFF0100FFFFFFFF0000FFFF00000000000000000100FFFF0100FFFF
      0100FFFF0100FFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF0100FFFF0200FFFF
      0100FFFF0100FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0100FFFF0200000002000000010000000100FFFF0100FFFF0100000000000100
      FFFF0100FFFF0100FFFF01000000010000000100000001000000010000000100
      000001000000010001000100010000000100FFFF0000FFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFFEFF0000FFFF0000FFFF00000100000001000000010000000000
      010000000100FFFF0100FFFF0100000001000000010001000100010001000100
      0000010000000000000000000000010001000100010001000100000002000000
      02000000010001000100010000000100FFFF0100000001000000010000000100
      000001000000010000000100FFFF0100FFFF0000FFFFFFFFFFFFFFFF0000FEFF
      0000FFFF0100FFFF0100FFFF0100FFFF0100FFFF0100FFFF00000000FFFF0000
      FFFF0000FFFF0000000000000100000001000000010000000000010000000100
      FFFF010000000100000001000000000001000100010001000100010001000100
      010000000100FFFF0100FFFF0100000000000000000001000000010000000100
      000001000000010000000100FFFF010000000100000001000000000000000000
      0000FFFF0000FFFF0000FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      00000100FFFF0100FFFF01000000000000000000000000000000000000000000
      00000000010000000100000000000000000000000000FFFF0000FFFF00000000
      000000000100FFFF0100FFFF0100FFFF0100FFFF0100FFFF0100000000000000
      0000000000000100010001000100010000000100000001000000010000000100
      0000010000000100000000000000FFFF00000000000000000000000000000000
      000000000000000000000000FFFF0000FFFF0000FFFFFFFF0000FFFF0100FFFF
      01000000000000000000000000000000FFFF0100FFFF0100FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000100
      FFFF0100FFFF0100FFFF01000000010000000100000001000000010000000100
      000001000000010000000000000000000100FFFF0100FFFF0100FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0100FFFF0100FFFF010000000100000001000000010000000000010000000100
      0000000000000000000000000000000000000000000000000000000001000000
      0100000001000000000001000000010000000000000000000000000000000000
      0000000000000000000000000000000000000000FFFF0000FFFF00000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010000000100000000000000000000000000010000000100000001000000
      0100000001000000010000000100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000004C49535428000000494E464F49434F50
      1B00000031393938204D6963726F736F667420436F72706F726174696F6E0000}
    Left = 392
    Top = 296
  end
  object TimerWav: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerWavTimer
    Left = 384
    Top = 168
  end
  object pmFidelidade: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmResgTempo'
      end
      item
        Visible = True
        ItemName = 'cmResgProduto'
      end>
    UseOwnFont = False
    Left = 208
    Top = 272
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer3Timer
    Left = 104
    Top = 264
  end
  object LMDSysInfo1: TLMDSysInfo
    Left = 264
    Top = 352
  end
  object cxHint: TcxHintStyleController
    Global = False
    HintStyleClassName = 'TcxHintStyle'
    HintStyle.Animate = cxhaNone
    HintStyle.CallOutPosition = cxbpTopLeft
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -13
    HintStyle.CaptionFont.Name = 'Tahoma'
    HintStyle.CaptionFont.Style = [fsBold]
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -13
    HintStyle.Font.Name = 'Tahoma'
    HintStyle.Font.Style = []
    HintStyle.IconType = cxhiInformation
    HintStyle.Rounded = True
    HintPause = 50
    LookAndFeel.NativeStyle = False
    Left = 328
    Top = 216
  end
  object imRod: TcxImageList
    Height = 20
    Width = 20
    FormatVersion = 1
    DesignInfo = 13632040
    ImageInfo = <
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000001000000040000000C000000130000
          001700000017000000130000000B000000050000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000030000
          000B000000200000003B000000500000005A000000590000004E000000380000
          001D000000090000000200000000000000000000000000000000000000000000
          000000000000000000030000001001020437070A1C6B0D14368B1119489E1119
          479E0B12318A050815720000016D000000570000002E0000000D000000020000
          000000000000000000000000000000000000000000010000000C0608184E141B
          54A31A1E69B21B1D6DB21A1E69B2181F67B2181F63B2161F5EB2111A459F0304
          0A710000005F0000002E0000000A000000000000000000000000000000000000
          00000000000407091C47181E64AF1D1D75B21C1D73B21C1E75B23A3789B2514D
          95B21F1E7CB2181F66B2181E61B2141E52AB03040A70000000570000001D0000
          0004000000000000000000000000000000000203081A191F5EA61F1D78B21D1D
          77B21D1D76B24A4984B2B0AEACB2B2B2B2B2A5A1ADB21D1E77B2191D69B2181E
          62B2111A469F0000016D000000380000000B0000000000000000000000000000
          00000B0F2F612C2C7CB21F1E7AB21F1D7AB21F1D7AB244477AB2AFADA7B2B1AE
          ACB29C9AABB21D1F78B21B1D6FB2191E67B2161F5EB2050815730000004E0000
          001300000000000000000000000000000000181C5594363485B2221F7DB2221F
          7DB2211F7EB21D1F79B2242672B237387DB21D1F77B21C1D74B21B1D72B21B1D
          6FB2181E64B20C13338B0000005A000000170000000000000000000000000000
          000023266DAE3B3789B2231F80B2241F81B2231F80B2332D8AB27A75A3B27772
          A1B2625A9CB21D1D79B21C1C74B21C1D72B2191D68B2111A499F0000005A0000
          001700000000000000000000000000000000262871AF474291B2262085B22620
          85B2252084B2393687B2B1B0AFB2B2B2B2B28E8BA8B21E1E7AB21D1D76B21C1C
          74B21A1D6CB2121A4BA000000050000000130000000000000000000000000000
          0000191C5C97595499B2282188B2282289B2282289B2363382B2B0AFACB2B1B1
          B1B28A86A7B21E1E7DB21D1D77B21C1C75B21B1D6FB20D14398D0000003B0000
          000C000000000000000000000000000000000E1139644F4A93B2423B93B22A22
          8DB22A228EB232317EB2ACACA5B2AAABA7B2817FA0B21F1F7DB21F1D79B21D1D
          76B21A1D6BB2070A1E6C00000020000000040000000000000000000000000000
          000003040D15252672AA60599CB2362D90B22B228EB2313277B2ACAC9FB2ACAB
          A1B2807F97B21F1E7DB21F1D7AB21D1D78B2151A55A4010104370000000B0000
          000100000000000000000000000000000000000000000B0D2D43323180B16059
          9CB2413793B21D1D78B2242573B2252577B225237AB2211F7EB2201E7CB2191C
          66AF0608194E0000001000000002000000000000000000000000000000000000
          000000000000000000000B0D2C43252673AA504B95B2574E98B2423B93B2352F
          8CB2312C87B228267DB2171C5FA607091D470000000C00000003000000000000
          0000000000000000000000000000000000000000000000000000000000000304
          0D150E1139641A1D5E97262772AF242670AE181C56940B0F30610203081A0000
          0004000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000000000000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000280000002C000000360000003F0000
          0044000000440000003F000000350000002B0000002800000027000000270000
          00270000002700000027000000270000002700000027000000270000002A0000
          00350000004E0000006F000000880000009400000093000000860000006C0000
          004B000000330000002900000027000000270000002700000027000000270000
          0027000000270000002A0000003A0002086A000733A9000F62D0001282E70014
          80E7000F58CF000725B2000103AB000000910000005F00000037000000290000
          002700000027000000270000002700000027000000280000003600052B860011
          97ED000ABDFF0006C4FF000BBEFF000EB8FF0010B2FF0013A8FF00147EE80004
          13B00000009A0000005F00000034000000270000002700000027000000270000
          00270000002D0006337D000EB4FC0000D4FF0001D0FF0005D2FF3028EDFF574D
          F8FF0100DFFF000EB7FF0010AFFF001695F7000413AF000000910000004B0000
          002A0000002700000027000000270000002700020E470611A7F10300D9FF0100
          D7FF0002D5FF4F4EDAFFFFF9F4FFFFFFFFFFEAE1FFFF0003D7FF000ABCFF0010
          B0FF00157EE8000103AB0000006C000000350000002700000027000000270000
          00270009549D1A19D9FF0300DDFF0400DCFF0200DCFF484FCAFFFFFBECFFFFF9
          F5FFD8D5FEFF0003D9FF0005C8FF000CB9FF0013A9FF000725B3000000860000
          003F00000027000000270000002700000027070F96DB2A23E8FF0700E2FF0700
          E2FF0600E3FF0003DAFF1013CAFF2E2FD6FF0005D8FF0002D1FF0002CDFF0005
          C8FF000EB4FF000F5BD000000094000000440000002700000027000000270000
          00271218BFFA3328EDFF0900E8FF0A00E9FF0900E8FF2315F3FF9F93FFFF9A8E
          FEFF7562FFFF0000DBFF0000D1FF0002CEFF000ABBFF001383E8000000950000
          004400000027000000270000002700000027131AC7FC453AF6FF0C00EFFF0D00
          EFFF0C00EEFF2F27EAFFFFFCFBFFFFFFFFFFC1B8FFFF0001DDFF0000D5FF0000
          D1FF0007C2FF001186E9000000880000003F0000002700000027000000270000
          0027070DA3DE6559FCFF1000F5FF1000F7FF0F00F7FF2A24E1FFFFFCF4FFFFFD
          FDFFB9B1FFFF0000E1FF0100D7FF0000D2FF0005C8FF000F66D20000006F0000
          003600000027000000270000002700000027000866A05348F6FF3C2BFEFF1300
          FDFF1200FEFF2422DAFFFAFBEAFFF6F7EEFFADA7F5FF0100E2FF0300DAFF0000
          D5FF0008C1FF000736AA0000004E0000002C0000002700000027000000270000
          0027000217411113CAF67360FFFF2713FEFF1300FFFF2528CEFFFEFDDEFFFBFA
          E3FFADABE4FF0100E1FF0400DCFF0100D9FF000F99EE0001086A000000350000
          00280000002700000027000000270000002700000027000652792421DFFE7260
          FFFF3B24FFFF0000D9FF0E12CDFF0F0FD4FF0E0ADAFF0500E3FF0500E0FF0009
          B7FC00062E860000003A00000029000000270000002700000027000000270000
          00270000002700000027000551791112CCF65548FAFF624DFEFF3C2BFDFF2617
          F6FF1F14EEFF130FDEFF010BABF10005347D000000360000002A000000270000
          0027000000270000002700000027000000270000002700000027000000270002
          1741000867A0070DA6DE1316CAFC1115C7FB070F9ADB0007569D00020E470000
          002D000000280000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000000000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000004000000110000
          001B000000100000000300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000040000
          000F0000001100000017000000490000006A000000430000000F000000010000
          0001000000020000000100000000000000000000000000000000000000000000
          000000000000000000010000001500000047000000520D0D0D851A1A1AE41111
          119E00000073000000260000000E0000001F000000220000000B000000010000
          00000000000000000000000000000000000000000000000000080B0B0B810C0C
          0CA70101019C3C3C3CDA727272FF4F4F4FC9000000960000005A0000004B0000
          0076000000720000002800000004000000000000000000000000000000000000
          000000000000070707223E3E3EFF8C8C8CFF828282F7AFAFAFFFAEAEAEFF8282
          82EF1C1C1CA1030303921B1B1BE2474747FA0202029300000040000000090000
          000000000000000000000000000000000000000000002929295FBDBDBDFFB2B2
          B2FF616161C2717171BC444545D59C9C9CFFAFAFAFFDA8A8A8F7797979FD8686
          86FF0F0F0F940000005800000013000000000000000000000000000000000000
          0000000000000F10102F8E8E8EDDB5A6A6FF9F7F7EF2826161D5745B5BEA7573
          73FF565857B45F6060B6696A6AC79E9E9EFD373737A900000052000000120000
          00000000000000000000000000000000000000000000291F1F45C39292F1D2A1
          A1FCE1B0AFFADFB2B2FCCD9898FEBC898BFFA57777F2725151D0261B1BA69FA2
          A2F6393939A40000002F00000006000000000000000000000000000000000000
          000000000000A17A7ACDE0BBBAEFDBB8B8EEDDB9B9F0DFB7B7F5DBA9A9F9E5B4
          B4FEE1B3B3FCD19F9FFBB48181FE655B5BD40202027D00000020000000010000
          00000000000000000000000000000000000000000000BD9090E9DFBFBEEDD9BA
          BAEDD9BABAEDDCBBBBEFE2B2B2FAEDBEBEFEE4B8B8F9E6B8B8FAC89898FF6750
          50CF000000820000002200000001000000000000000000000000000000000000
          000000000000CD9E9EF6E0C7C6ECD9C2C2ECD9C3C3ECE1CACAF0E9BABAFCECC1
          C1FBE6BABAF7E6BCBCF8D5A4A5FE7A5D5DDC0000008C0000002A000000020000
          00000000000000000000000000000000000000000000D5A8A8FCF2EEEFF8DAC9
          C9E8C8B1B1DFC0A6A6DDEFD9D9FCF5D9D9FCEAC7C7F7E9C0C0F6F8C8CAFD9874
          74F300000096000000440000000C000000000000000000000000000000000000
          0000000000005C49495EBA8F8ECDDBB7B7F1D8B7B7EAC5A8A8D8E7D2D2FBE8DF
          DFF4E5DFDFF0F5E4E4F9FCE4E7FDA57F7FFE0B0C0C980000006D0000001B0000
          0000000000000000000000000000000000000000000000000000000000000B08
          080C523F3F5D9F7979B7E0B7B7FDCAA0A0F48E6B6BD1634545B9654245B89786
          86F1616262D20000006B0000001C000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000989999C9878A
          8AEC4C4E4EBB6F7373D7AAABACE0BBBDBDF87B7B7BE10000002F0000000A0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000D0D0D1F7B7779D2959495F6848484DB686868B14545
          45890E0E0E300000000800000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000000000000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          002700000027000000270000002700000027000000270000002A000000350000
          003E000000350000002A00000027000000270000002700000027000000270000
          00270000002700000027000000270000002700000027000000270000002A0000
          0034000000350000003A00000065000000810000006000000034000000280000
          0028000000290000002800000027000000270000002700000027000000270000
          0027000000270000002800000039000000630000006C0D0D0D981A1A1AE81111
          11AD000000880000004700000033000000410000004400000030000000280000
          002700000027000000270000002700000027000000270000002E0A0A0A940D0D
          0DB4010101AB3C3C3CE0727272FF4F4F4FD1000000A600000073000000670000
          008B00000088000000490000002A000000270000002700000027000000270000
          002700000027070707443E3E3EFF8C8C8CFF818181F8AFAFAFFFAEAEAEFF8282
          82F11C1C1CAF030303A31B1B1BE6474747FB030303A40000005D0000002F0000
          0027000000270000002700000027000000270000002729292977BDBDBDFFB2B2
          B2FF606060CB717171C6454646DB9C9C9CFFAFAFAFFDA7A7A7F8797979FD8686
          86FF0F0F0FA40000007200000037000000270000002700000027000000270000
          0027000000270F10104F8E8E8EE2B5A6A6FFA07F7EF4836161DB735B5BED7573
          73FF565857BF5F5F5FC1686A6AD09E9E9EFD373737B60000006C000000360000
          00270000002700000027000000270000002700000027291F1F61C29393F3D2A1
          A1FCE0B0AEFBDFB2B2FCCD9898FEBC898BFFA67777F4725151D7251C1CB49FA2
          A2F7393939B20000004F0000002C000000270000002700000027000000270000
          002700000027A07A7AD5E0BAB9F1DBB8B8F1DDB9B9F2DFB6B6F7DBA9A9FAE5B4
          B4FEE1B3B3FCD19F9FFCB48181FE655B5BDB0202029100000042000000280000
          00270000002700000027000000270000002700000027BD9090ECDFBFBDF0D8BA
          BAF0D9BABAF0DCBABAF1E2B2B2FBEDBEBEFEE4B7B7FAE6B8B8FBC89898FF6750
          50D6000000950000004400000028000000270000002700000027000000270000
          002700000027CD9E9EF7E0C7C6EFD9C2C2EFD9C3C3EFE1CACAF2E9BABAFCECC1
          C1FCE6BABAF8E6BBBBF9D5A4A5FE7A5E5EE10000009E0000004B000000290000
          00270000002700000027000000270000002700000027D5A8A8FCF2EEEFF9DAC9
          C9ECC8B1B1E4C0A7A7E2EFD9D9FCF5D9D9FCEAC6C6F8E9C0C0F7F8C8CAFD9874
          74F5000000A60000006100000031000000270000002700000027000000270000
          0027000000275C494977B98F8ED5DBB7B7F3D8B6B6EDC6A8A8DEE7D2D2FCE8DF
          DFF6E5DFDFF2F5E4E4FAFCE4E7FDA57F7FFE0B0C0CA8000000830000003E0000
          0027000000270000002700000027000000270000002700000027000000270B08
          0831523F3F769F7878C2E0B7B7FDCAA0A0F68D6B6BD8624545C4654345C39886
          86F3616262D9000000820000003F000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027989999D1878A
          8AEF4C4E4EC56F7272DDABACACE5BBBCBCF97B7B7BE60000004F0000002F0000
          0027000000270000002700000027000000270000002700000027000000270000
          002700000027000000270E0D0D417B7779D9949394F7848484E1686868BD4545
          459B0D0D0D500000002E00000028000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000000000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000005000000100000001C0000
          001F000000140000000900000002000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000002000000090000
          00170000002E0000005100000073000000780000005D0000003A000000210000
          0012000000070000000100000000000000000000000000000000000000000000
          0000000000060000001D0000003D030303651D1D1D965A5A5AD0626262DE2626
          26AB0909099D000000930000007800000054000000330000001C0000000D0000
          000300000000000000000000000000000000000000191111116E393939AD9292
          92F0DEDEDEFFFFFFFFFF9C9C9CFF808080FF7F7F7FFE555555D0202020A60404
          049C0000008E0000006F000000410000000F0000000000000000000000000000
          00006E6E6EBEC1C1C1FEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF7A7A
          7AFF6C6C6CFF777777FF7F7F7FFF777777F9434343C31515159F0000007B0000
          002000000000000000000000000000000000A5A5A5F8FFFFFFFFFFFFFFFFE2E2
          E2FFC4C4C4FFC3C3C3FF929292FF7A7A7AFF7C7C7CFF7D7D7DFF707070FF6767
          67FF7C7C7CFF6B6B6BF50000008D000000250000000000000000000000000000
          00009E9E9EF7E0E0E0FFCDCDCDFFDCDCDCFFEBEBEBFFE9E9E9FFBFBFBFFFACAC
          ACFFA1A1A1FF8A8A8AFF7D7D7DFF7A7A7AFF818181FF707070F50000008C0000
          0025000000000000000000000000000000009B9B9BF5F5F5F5FFEAEAEAFFE3E3
          E3FFDCDCDCFFDCDCDCFFE9E9E9FFDDDDDDFFCCCCCCFFBABABAFFB1AEB0FFAFA4
          ADFF968E95FF6B686AF50000007F000000210000000000000000000000000000
          0000A0A0A0F5EEEEEEFFDFDFDFFFDADADAFEE6E6E6FEFEFEFEFFF9F9F9FFF3F3
          F3FFF1F1F1FFEBEBEBFFDBD2D9FF2DC04BFF72CC7CFF757075EC000000540000
          001300000000000000000000000000000000767676B9B8B8B8FFD3D3D4FEA0A1
          A2FE65686BFF86888BFFB8BABBFFE0E0E1FFF5F5F5FFFCFCFCFFFFFCFFFFE7E5
          E6FFB2B2B2FE333233900000001C000000040000000000000000000000000000
          0000000000001B1B1B2B3637376B75716DF2FFE7C7FFCAB39DFF96887BFF6E6A
          66FF66696CFFADADAEFFC6C6C6FF7D7D7DE22F2E2F6E00000011000000040000
          000000000000000000000000000000000000000000000000000109090A26A49E
          98FDFFF3DAFFFFEAD0FFFFEBCCFFFFF0CBFFE4C6A7FF333535BA1C1C1C650101
          0115000000030000000100000000000000000000000000000000000000000000
          0000000000000000000734353583E5DBD1FFFFF2E3FFFFEBDAFFFFE8D4FFFFEE
          D6FFB8AA9CFF0D0E0E7F00000022000000020000000000000000000000000000
          000000000000000000000000000000000000000000000B0B0B22919090EAFFFF
          FFFFFFF8EEFFFFF3E8FFFFF3E5FFFFFDEAFF585856D5000000450000000D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000006F6F6FADEAEAEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A4
          A0FD1616166E0000001900000002000000000000000000000000000000000000
          000000000000000000000000000000000000000000000F0F0F17202020422E2F
          2F6A4949498F6E6F70B4858584DA282828780000001200000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000000000000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000280000002B000000350000003F0000
          0041000000380000002F00000029000000270000002700000027000000270000
          00270000002700000027000000270000002700000027000000290000002F0000
          003A0000004E0000006C000000880000008D0000007600000058000000430000
          00360000002D0000002800000027000000270000002700000027000000270000
          00270000002C000000400000005B0303037D1D1D1DA6595959D7626262E32626
          26B8090909AC000000A40000008D0000006E000000520000003F000000320000
          002A000000270000002700000027000000270000003C11111184393939BA9292
          92F2DEDEDEFFFFFFFFFF9C9C9CFF808080FF7F7F7FFE555555D7202020B40404
          04AB0000009F000000850000005E000000340000002700000027000000270000
          00276F6F6FC8C1C1C1FEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF7A7A
          7AFF6C6C6CFF777777FF7F7F7FFF787878FA424242CC141414AE0000008F0000
          004200000027000000270000002700000027A5A5A5F9FFFFFFFFFFFFFFFFE2E2
          E2FFC4C4C4FFC3C3C3FF929292FF7A7A7AFF7C7C7CFF7D7D7DFF707070FF6767
          67FF7C7C7CFF6B6B6BF70000009E000000460000002700000027000000270000
          00279E9E9EF8E0E0E0FFCDCDCDFFDCDCDCFFEBEBEBFFE9E9E9FFBFBFBFFFACAC
          ACFFA1A1A1FF8A8A8AFF7D7D7DFF7A7A7AFF818181FF707070F70000009E0000
          0046000000270000002700000027000000279B9B9BF7F5F5F5FFEAEAEAFFE3E3
          E3FFDCDCDCFFDCDCDCFFE9E9E9FFDDDDDDFFCCCCCCFFBABABAFFB1AEB0FFAFA4
          ADFF968E95FF6B686AF700000093000000430000002700000027000000270000
          0027A1A1A1F7EEEEEEFFDFDFDFFFDADADAFEE6E6E6FEFEFEFEFFF9F9F9FFF3F3
          F3FFF1F1F1FFEBEBEBFFDBD2D9FF2DC04BFF72CC7CFF747074EF0000006E0000
          003700000027000000270000002700000027767676C4B8B8B8FFD3D3D4FEA0A1
          A2FE65686BFF86888BFFB8BABBFFE0E0E1FFF5F5F5FFFCFCFCFFFFFCFFFFE7E5
          E6FFB2B2B2FE333233A10000003F0000002A0000002700000027000000270000
          0027000000271B1B1B4B3637378275716DF4FFE7C7FFCAB39DFF96887BFF6E6A
          66FF66696CFFADADAEFFC6C6C6FF7D7D7DE62F2E2F84000000350000002A0000
          002700000027000000270000002700000027000000270000002809090947A49E
          98FDFFF3DAFFFFEAD0FFFFEBCCFFFFF0CBFFE4C6A7FF333535C51C1C1C7D0101
          01390000002A0000002800000027000000270000002700000027000000270000
          0027000000270000002D34353696E5DBD1FFFFF2E3FFFFEBDAFFFFE8D4FFFFEE
          D6FFB8AA9CFF0D0E0E9300000044000000290000002700000027000000270000
          002700000027000000270000002700000027000000270B0B0B44919090EDFFFF
          FFFFFFF8EEFFFFF3E8FFFFF3E5FFFFFDEAFF585856DB00000061000000320000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000276F6F6FBAEAEAEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A4
          A0FD161616840000003C00000029000000270000002700000027000000270000
          002700000027000000270000002700000027000000270F0F0F3A2020205F2E2F
          2F81494949A06E6F70BF868684E02728288D000000360000002A000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000000000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000005000000100000001C0000
          001F000000140000000900000002000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000002000000090000
          00170000002E0000005100000073000000780000005D0000003A000000210000
          0012000000070000000100000000000000000000000000000000000000000000
          0000000000060000001D0000003D030303651D1D1D965A5A5AD0626262DE2626
          26AB0909099D000000930000007800000054000000330000001C0000000D0000
          000300000000000000000000000000000000000000191111116E393939AD9292
          92F0DEDEDEFFFFFFFFFF9C9C9CFF808080FF7F7F7FFE555555D0202020A60404
          049C0000008E0000006F000000410000000F0000000000000000000000000000
          00006E6E6EBEC1C1C1FEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF7A7A
          7AFF6C6C6CFF777777FF7F7F7FFF777777F9434343C31515159F0000007B0000
          002000000000000000000000000000000000A5A5A5F8FFFFFFFFFFFFFFFFE2E2
          E2FFC4C4C4FFC3C3C3FF929292FF7A7A7AFF7C7C7CFF7D7D7DFF707070FF6767
          67FF7C7C7CFF6B6B6BF50000008D000000250000000000000000000000000000
          00009E9E9EF7E0E0E0FFCDCDCDFFDCDCDCFFEBEBEBFFE9E9E9FFC0C0C0FFC5C5
          C5FFD1D1D1FFCDCDCDFFBFBFBFFFA0A0A0FF838383FF707070F50000008D0000
          0025000000000000000000000000000000009B9B9BF5F5F5F5FFEAEAEAFFE3E3
          E3FFDCDCDCFFDDDDDDFFF3EFEDFFCA987AFFB65F24FFAA450AFFAB5523FFBD8B
          75FFCDC5C7FF6E6C6EF50000008B000000250000000000000000000000000000
          0000A0A0A0F5EEEEEEFFDFDFDFFFDADADAFEE6E6E6FEFCF8F6FFC7773AFFCF68
          00FFD36900FFEA9D40FFD26E04FFB14A00FFA96633FFB9B4B5F5000000860000
          002300000000000000000000000000000000767676B9B8B8B8FFD3D3D4FEA0A1
          A2FE949698FFC28F68FFDA7705FFD97100FFD9A067FFFAFFFFFFFFF4CEFFC65A
          00FFB24D00FF9A6D55E500000085000000220000000000000000000000000000
          0000000000001B1B1B2B3637376B75716DF2FFF4E4FFD07F33FFE57D00FFE27C
          00FFD97000FFDC994DFFE1810BFFCF6700FFC35D00FF7D3000DB000000880000
          002400000000000000000000000000000000000000000000000109090A26A49E
          98FDFFFAF0FFD7832BFFEE8700FFEC8500FFF1A136FFFFFFF9FFFFCE86FFD56A
          00FFCE6800FFA04000F50000007B0000001F0000000000000000000000000000
          0000000000000000000734353583E5DBD1FFFFF9F2FFDC8E3CFFF99E18FFF88F
          00FFE89A38FFF9FFFFFFFCD297FFDA6E00FFD46E00FF863800DD000000570000
          001300000000000000000000000000000000000000000B0B0B22919090EAFFFF
          FFFFFFFAF3FFE1A979FFFFBC4EFFFF9800FFDD9137FFE5F7FFFFE9C494FFDE74
          00FFD46E00FF4219009A00000027000000050000000000000000000000000000
          0000000000006F6F6FADEAEAEBFFFFFFFFFFFFFFFFFFFCF8F4FFE09749FFFFBD
          4BFFEB8E17FFDD8218FFE2810BFFE07A00FF873D00CA0502002E000000080000
          000000000000000000000000000000000000000000000F0F0F17202020422E2F
          2F6A49494990767676B8C7C2BDEFB78354E4C0751EE2DB8321FDB46210E1592A
          028A0602001B0000000600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000000000000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000280000002B000000350000003F0000
          0041000000380000002F00000029000000270000002700000027000000270000
          00270000002700000027000000270000002700000027000000290000002F0000
          003A0000004E0000006C000000880000008D0000007600000058000000430000
          00360000002D0000002800000027000000270000002700000027000000270000
          00270000002C000000400000005B0303037D1D1D1DA6595959D7626262E32626
          26B8090909AC000000A40000008D0000006E000000520000003F000000320000
          002A000000270000002700000027000000270000003C11111184393939BA9292
          92F2DEDEDEFFFFFFFFFF9C9C9CFF808080FF7F7F7FFE555555D7202020B40404
          04AB0000009F000000850000005E000000340000002700000027000000270000
          00276F6F6FC8C1C1C1FEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF7A7A
          7AFF6C6C6CFF777777FF7F7F7FFF787878FA424242CC141414AE0000008F0000
          004200000027000000270000002700000027A5A5A5F9FFFFFFFFFFFFFFFFE2E2
          E2FFC4C4C4FFC3C3C3FF929292FF7A7A7AFF7C7C7CFF7D7D7DFF707070FF6767
          67FF7C7C7CFF6B6B6BF70000009E000000460000002700000027000000270000
          00279E9E9EF8E0E0E0FFCDCDCDFFDCDCDCFFEBEBEBFFE9E9E9FFC0C0C0FFC5C5
          C5FFD1D1D1FFCDCDCDFFBFBFBFFFA0A0A0FF838383FF707070F70000009E0000
          0046000000270000002700000027000000279B9B9BF7F5F5F5FFEAEAEAFFE3E3
          E3FFDCDCDCFFDDDDDDFFF3EFEDFFCA987AFFB65F24FFAA450AFFAB5523FFBD8B
          75FFCDC5C7FF6E6C6DF70000009D000000460000002700000027000000270000
          0027A1A1A1F7EEEEEEFFDFDFDFFFDADADAFEE6E6E6FEFCF8F6FFC7773AFFCF68
          00FFD36900FFEA9D40FFD26E04FFB14A00FFA96633FFB9B3B4F7000000990000
          004500000027000000270000002700000027767676C4B8B8B8FFD3D3D4FEA0A1
          A2FE949698FFC28F68FFDA7705FFD97100FFD9A067FFFAFFFFFFFFF4CEFFC65A
          00FFB24D00FF9A6D55E900000098000000440000002700000027000000270000
          0027000000271B1B1B4B3637378275716DF4FFF4E4FFD07F33FFE57D00FFE27C
          00FFD97000FFDC994DFFE1810BFFCF6700FFC35D00FF7C3100E10000009A0000
          004500000027000000270000002700000027000000270000002809090947A49E
          98FDFFFAF0FFD7832BFFEE8700FFEC8500FFF1A136FFFFFFF9FFFFCE86FFD56A
          00FFCE6800FFA14000F70000008F000000410000002700000027000000270000
          0027000000270000002D34353696E5DBD1FFFFF9F2FFDC8E3CFFF99E18FFF88F
          00FFE89A38FFF9FFFFFFFCD297FFDA6E00FFD46E00FF873900E2000000710000
          003700000027000000270000002700000027000000270B0B0B44919090EDFFFF
          FFFFFFFAF3FFE1A979FFFFBC4EFFFF9800FFDD9137FFE5F7FFFFE9C494FFDE74
          00FFD46E00FF421900A9000000480000002B0000002700000027000000270000
          0027000000276F6F6FBAEAEAEBFFFFFFFFFFFFFFFFFFFCF8F4FFE09749FFFFBD
          4BFFEB8E17FFDD8218FFE2810BFFE07A00FF873D00D20502004E0000002E0000
          002700000027000000270000002700000027000000270F0F0F3A2020205F2E2F
          2F81494949A1767777C3C6C2BDF1B78354E8C0751EE6DB8321FDB46210E6592A
          029C0602003E0000002C00000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000000000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003030
          3045191919B0191919B02828283E0000000000000000000000002B2B2B3F1919
          19B0191919B02B2B2B3F00000000000000000000000000000000000000000000
          0000000000000000000000000000000000960000009600000096000000960000
          0000000000000000000000000096000000960000009600000096000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0096000000960000009600000096000000000000000000000000000000960000
          0096000000960000009600000000000000000000000000000000000000000000
          00000000000000000000000000004242426A0000009600000096000000280000
          000000000000000000001111113900000096000000961F1F1F47000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000096000000960000009600000096000000960000
          009600000096000000960000009600000096101010AD00000096000000250000
          000000000000000000000000000000000000000000000000009E000000650000
          0012000000650000001200000065000000120000006500000012000000650000
          0012000000650000001200000096000000000000000000000000000000000000
          00004343437E0000009E00000012000000650000000000000065000000000000
          0065000000000000006500000000000000650000000000000065000000960000
          0000000000000000000000000000000000000D0D0DAC00000012000000650000
          0000000000650000000000000065000000000000006500000000000000650000
          0000000000650000001200000096000000000000000000000000000000000000
          00000D0D0DAC0000006500000000000000650000000000000065000000000000
          0065000000000000006500000000000000650000000000000065000000960000
          0000000000000000000000000000000000000D0D0DAC00000012000000650000
          0000000000650000000000000065000000000000006500000000000000650000
          0000000000650000001200000096000000000000000000000000000000000000
          0000000000960000006500000000000000650000000000000065000000000000
          0065000000000000006500000000000000650000000000000065000000960000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000096000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000F0F0F9A0000
          0092000000000000000000000000000000000000000000000000000000000000
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
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A000000000000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A2B2B
          2B69181818B8181818B8242424640000001A0000001A0000001A262626651818
          18B8181818B8262626650000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A000000A1000000A1000000A1000000A10000
          001A0000001A0000001A000000A1000000A1000000A1000000A10000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          00A1000000A1000000A1000000A10000001A0000001A0000001A000000A10000
          00A1000000A1000000A10000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A3B3B3B87000000A1000000A10000003E0000
          001A0000001A0000001A0F0F0F5F000000A1000000A11B1B1B6B0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A000000A1000000A1000000A1000000A1000000A10000
          00A1000000A1000000A1000000A1000000A10F0F0FB5000000A10000003B0000
          001A0000001A0000001A0000001A0000001A0000001A000000A8000000750000
          002A000000750000002A000000750000002A000000750000002A000000750000
          002A000000750000002A000000A10000001A0000001A0000001A0000001A0000
          001A4242428B000000A80000002A000000750000001A000000750000001A0000
          00750000001A000000750000001A000000750000001A00000075000000A10000
          001A0000001A0000001A0000001A0000001A0D0D0DB40000002A000000750000
          001A000000750000001A000000750000001A000000750000001A000000750000
          001A000000750000002A000000A10000001A0000001A0000001A0000001A0000
          001A0D0D0DB4000000750000001A000000750000001A000000750000001A0000
          00750000001A000000750000001A000000750000001A00000075000000A10000
          001A0000001A0000001A0000001A0000001A0D0D0DB40000002A000000750000
          001A000000750000001A000000750000001A000000750000001A000000750000
          001A000000750000002A000000A10000001A0000001A0000001A0000001A0000
          001A000000A1000000750000001A000000750000001A000000750000001A0000
          00750000001A000000750000001A000000750000001A00000075000000A10000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A000000A10000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0E0E0EA40000
          009D0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A000000000000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
          001A0000001A0000001A0000001A0000001A0000001A00000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000001E1E1EB21E1E1EB21B1B1BB21B1B
          1BB21B1B1BB21B1B1BB21E1E1EB21E1E1EB20000000000000000000000000000
          0000000000000000000000000000080808081A1A1A1A2C2C2C2C3E3E3E3E0000
          00001D1D1DB24747474747474747474747474747474747474747474747471D1D
          1DB2000000003E3E3E3E2C2C2C2C1A1A1A1A0808080800000000000000003F3F
          3F543737376F2F2F2F89222222A5000000001B1B1BB21B1B1BB2181818B21818
          18B2181818B2181818B21B1B1BB21B1B1BB200000000222222A52F2F2F893737
          376F4040405400000000000000001D1D1DB2232323B2232323B21D1D1DB20000
          0000171717B24747474747474747474747474747474747474747474747471717
          17B2000000001D1D1DB2222222B2202020B21C1C1CB200000000000000001B1B
          1BB2212121B2212121B21D1D1DB200000000141414B2161616B2161616B21616
          16B2161616B2161616B2161616B2141414B2000000001D1D1DB21E1E1EB21B1B
          1BB2181818B200000000000000001B1B1BB21F1F1FB21F1F1FB21B1B1BB24747
          4747474747474747474747474747474747474747474747474747474747474747
          4747474747471B1B1BB21C1C1CB247474747181818B200000000000000001919
          19B21E1E1EB21B1B1BB2181818B2181818B2191919B2191919B2191919B21919
          19B2191919B2191919B2191919B2191919B2181818B2181818B2191919B21919
          19B2161616B20000000000000000171717B21C1C1CB2191919B21D1D1D462D2D
          2D7C2F2F2F7C2F2F2F7C2F2F2F7C2F2F2F7C2F2F2F7C2F2F2F7C2F2F2F7C2F2F
          2F7C2D2D2D7C1D1D1D46181818B247474747161616B200000000000000001414
          14B2191919B2181818B21C1C1C6B181818B21B1B1BB21B1B1BB21B1B1BB21B1B
          1BB21B1B1BB21B1B1BB21B1B1BB21B1B1BB2181818B21C1C1C6B181818B21919
          19B2141414B200000000000000000D0D0D9D131313B2131313B21A1A1A6B1414
          14B2161616B2151515B2151515B2151515B2151515B2151515B2151515B21616
          16B2141414B21A1A1A6B131313B2131313B20E0E0E9D00000000000000000101
          01210909099C0C0C0CB2040404580F0F0FB20D0D0DB20C0C0CB20C0C0CB20C0C
          0CB20C0C0CB20C0C0CB20C0C0CB20D0D0DB20F0F0FB2040404580C0C0CB20909
          099C010101210000000000000000000000000000000000000000000000002828
          287C000000000000000000000000000000000000000000000000000000000000
          00002828287C0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000D0D0DB20000000000000000000000000000
          0000000000000000000000000000000000000D0D0DB200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000D0D
          0DB2000000000000000000000000000000000000000000000000000000000000
          00000D0D0DB20000000000000000000000000000000000000000000000000000
          00000000000000000000000000000A0A0AB24747474747474747474747474747
          4747474747474747474747474747474747470A0A0AB200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000202
          0259080808B2080808B2080808B2080808B2080808B2080808B2080808B20808
          08B2020202590000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
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
          0000000000990000009900000099000000990000009900000099000000990000
          0099000000990000009900000099000000990000009900000099000000990000
          0099000000000000000000000000000000000000009900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000990000000000000000000000000000
          0000000000990000000000000099000000990000009900000099000000990000
          0099000000990000009900000099000000990000009900000099000000000000
          0099000000000000000000000000000000000000009900000000000000990000
          0099000000990000009900000099000000990000009900000099000000990000
          0099000000990000009900000000000000990000000000000000000000000000
          0000000000990000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0099000000000000000000000000000000000000009900000099000000990000
          0099000000990000009900000099000000990000009900000099000000990000
          0099000000990000009900000099000000990000000000000000000000000000
          0000000000000000000000000000000000990000000000000000000000000000
          0000000000000000000000000000000000000000009900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0099000000000000000000000000000000000000000000000000000000000000
          0000000000990000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000990000000000000000323232992E2E
          2E992E2E2E992E2E2E9932323299000000000000009900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0099000000000000000000000000000000000000000000000000000000000000
          0000000000990000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000009900000000232323992E2E2E992E2E
          2E992E2E2E992E2E2E9923232399000000000000009900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0099000000000000000000000000000000000000000000000000000000000000
          0000000000990000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000990000009900000099000000990000
          0099000000990000009900000099000000990000009900000000000000000000
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
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000002323232347474747232323230000000000000000000000000000
          0000000000000000000023232323474747472323232300000000000000000000
          000000000000000000000000000000000000000000002F2F2F7C242424B23131
          317C0000000000000000000000000000000000000000000000003131317C2626
          26B23030307C0000000000000000000000000000000000000000000000000000
          000000000000171717B21D1D1DB21D1D1DB24747474747474747474747474747
          474747474747474747471D1D1DB2202020B21D1D1DB200000000000000000000
          0000000000000000000000000000000000000000000005050559111111B21111
          11B2111111B2111111B2111111B2121212B2131313B2141414B2151515B21919
          19B21A1A1AB20000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000404
          0404111111111E1E1E1E2727272735353535191919B200000000000000000000
          0000000000000000000000000000000000000000000004040404111111111E1E
          1E1E2727272735353535434343434343434D2B2B2B54303030761414146D2424
          24971B1B1BAB0000000000000000000000000000000000000000000000000000
          00000D0D0D0D4343434D393939622525256B2A2A2A831515158B191919AB1616
          16B220202097151515B235353569161616B2161616B200000000000000000000
          00000000000000000000000000000000000025252545161616B2141414B21F1F
          1F97141414B234343469121212B247474747121212B247474747121212B24747
          4747141414B20000000000000000000000000000000000000000000000000404
          040425252589141414B247474747111111B247474747111111B2474747471111
          11B247474747111111B247474747131313B2131313B200000000000000000000
          00000000000000000000000000002121212C141414B23131316F0F0F0FB24747
          47470F0F0FB2474747470F0F0FB2474747470F0F0FB2474747470F0F0FB24747
          4747111111B20000000000000000000000000000000000000000000000002626
          2678141414AC0F0F0FB2474747470E0E0EB2474747470E0E0EB2474747470E0E
          0EB2474747470E0E0EB2474747470F0F0FB20F0F0FB200000000232323234747
          474723232323000000001A1A1A1A171717A5101010B2474747470F0F0FB24747
          47470F0F0FB2474747470F0F0FB2474747470F0F0FB2474747470F0F0FB24747
          4747101010B2000000002B2B2B7C121212B22A2A2A7C00000000242424640D0D
          0DB23B3B3B5B0D0D0DB2474747470D0D0DB2474747470D0D0DB2474747470D0D
          0DB2474747470D0D0DB2474747470E0E0EB20E0E0EB2474747470E0E0EB20E0E
          0EB20C0C0CB20000000005050585080808B2080808B2080808B2080808B20808
          08B2080808B2080808B2080808B2080808B2080808B2080808B2080808B20808
          08B2080808B2080808B2080808B2080808B20202025900000000000000000000
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
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000010000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000004000000120000001F0000
          0021000000160000000700000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          000B0000002700000053000000790000007E00000060000000320000000F0000
          0002000000000000000000000000000000000000000000000000000000000000
          00000000000000000003000000140000003E0D0D0D92272727E0262626EA0909
          09B20101019F0000007F0000003F0000000C0000000000000000000000000000
          000000000000000000000000000000000000000000040000001B0606065F3131
          31D15D5D5DFF545454FF4C4C4CFF3B3B3BFF171717EA010101A0000000730000
          001C000000000000000000000000000000000000000000000000000000000000
          00020000001A1313137C5C5C5CF2797979FF5F5F5FFF575757FF515151FF4B4B
          4BFF373737FF131313E1000000780000001E0000000000000000000000000000
          00000000000000000000000000000000000A2828288A8F8F8FFD8C8C8CFF6969
          69FF626262FF5C5C5CFF565656FF4F4F4FFF4C4C4CFF1B1B1BE20000004E0000
          0011000000000000000000000000000000000000000000000000000000001616
          1648A9A9A9FE989898FF757575FF757575FF989898FF808080FF5A5A5AFF5656
          56FF474747FE0A0A0A840000001D000000040000000000000000000000000000
          00000000000000000000000000003333337CBABABAFF828282FF777777FFC5C5
          C5FFC8C8C8FFA3A3A3FF606060FF565656FE151515970000001F000000050000
          0000000000000000000000000000000000000000000200000007000000071312
          0D3B76756BEE97958CFF878782FFA9A9A7FFAAAAAAFF787878FF5D5D5DFE1A1A
          1A960000001E0000000400000000000000000000000000000000000000000000
          00000000010E000000270000042400020A3A07070746475EA6EC383A6BFE8686
          7FFF7A7A7AFF5F5F5FF91919197D000000170000000400000000000000000000
          0000000000000000000000000000000000000010495B000000520014618A0004
          1A6000116A930002154F02020E362525216F3030308D0E0E0E3C000000090000
          0002000000000000000000000000000000000000000000000000000000000000
          00000028D5D900041C61001771A3001681B1000B3C7900082E59000000130000
          0002000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000001D90930026DBED000B4582000B
          3780000B3D7D000105350000000B000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000010606001C8B8E002AE0E90022C3D6000D47620000010F000000030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0001000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000000000000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000028000000280000002800000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002A00000036000000410000
          00430000003A0000002D00000028000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000280000
          0030000000480000006D0000008D000000920000007800000051000000340000
          0029000000270000002700000027000000270000002700000027000000270000
          0027000000270000002A000000380000005C0D0D0DA3272727E5252525ED0909
          09BE010101AE000000930000005C000000310000002700000027000000270000
          0027000000270000002700000027000000270000002A0000003E070707773131
          31D85D5D5DFF545454FF4C4C4CFF3B3B3BFF171717ED010101AF000000880000
          003F000000270000002700000027000000270000002700000027000000270000
          00290000003D131313905C5C5CF4797979FF5F5F5FFF575757FF515151FF4B4B
          4BFF373737FF131313E60000008D000000400000002700000027000000270000
          00270000002700000027000000270000002F2828289C8F8F8FFD8C8C8CFF6969
          69FF626262FF5C5C5CFF565656FF4F4F4FFF4C4C4CFF1A1A1AE6000000690000
          0035000000270000002700000027000000270000002700000027000000271616
          1664A9A9A9FE989898FF757575FF757575FF989898FF808080FF5A5A5AFF5656
          56FF474747FE0A0A0A97000000400000002A0000002700000027000000270000
          002700000027000000270000002733333390BABABAFF828282FF777777FFC5C5
          C5FFC8C8C8FFA3A3A3FF606060FF565656FE151515A7000000410000002B0000
          002700000027000000270000002700000027000000290000002D0000002D1312
          0D5975746CF197958CFF878782FFA9A9A7FFAAAAAAFF787878FF5D5D5DFE1B1B
          1BA6000000400000002A00000027000000270000002700000027000000270000
          002700000133000000480000044500020A5807070762475FA6EF383A6BFE8686
          7FFF7A7A7AFF5F5F5FFA1A1A1A910000003A0000002A00000027000000270000
          002700000027000000270000002700000027001049740000006C0014619C0004
          1A7800116AA40002156A02020E55262621853030309E0E0E0E5A0000002F0000
          0029000000270000002700000027000000270000002700000027000000270000
          00270028D5DF00041C79001771B1001681BD000B3C8D00082E72000000370000
          0029000000270000002700000027000000270000002700000027000000270000
          002700000027000000270000002700000027001D90A40026DBF0000B4595000A
          3793000B3D910001055400000030000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          00270001062C001C8B9F002AE0EC0022C3DC000D477A000001340000002A0000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000280000
          0028000000280000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000000000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000027000000270000
          0027000000270000002700000027000000270000002700000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D000000000000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005E0000005E0000005E0000005E0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005F000000650000006F0000
          0074000000740000006F000000660000005F0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          00600000006E00000089000000A4000000B3000000B3000000A4000000890000
          006E000000600000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005E0000006E000632A8000B82DC0A21BCF70A21
          BCF7000A7DDD000523C3000000BA000000950000006E0000005E0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D00000065000E
          6BB8163BE3FE6799FDFF93C8FFFF96CBFFFF6C9DFDFF183DE3FE000B50CA0000
          00B800000088000000650000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D00093C910D36EAFE5084FFFF6497FFFF74A7FFFF76A9
          FFFF679AFFFF5488FFFF0E37E9FE000522C3000000A20000006E0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D00199ED02254
          FDFF3C6FFFFF4E81FFFF5A8DFFFF5A8DFFFF5083FFFF3F73FFFF2657FDFF0015
          85DA000000B0000000730000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0027D8F01549FFFF275AFFFF3669FFFF3D71FFFF3F72
          FFFF386BFFFF2A5DFFFF194DFFFF0026CDF1000000B0000000730000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0028DCEE0134
          FEFF1C4DFEFF3664FFFF426FFFFF426FFFFF3462FFFF184BFFFF0237FFFF0027
          D0F0000000A00000006E0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0020A9CC103DF9FF486CFEFF5D7FFFFF6D8BFEFF6B8A
          FEFF5B7DFFFF4368FEFF0B39FAFF001B90D600000086000000650000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D000C3C840032
          FCFE526FF8FF7991FCFF899EFDFF869CFDFF758EFBFF4F6DF8FF0032FAFE000A
          2DA30000006C0000005E0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D001870A50030FAFE4867F7FF91A2F7FF8FA1
          F8FF4969F7FF0233FBFE001462B20000006C000000600000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D000C3C84001FABCC0025E1EF0025E2EF0020A7CE000C388D000000650000
          005E0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005E0000
          005E0000005E0000005E0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D000000000000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D00000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000010000000100000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000300000007000000110000
          0015000000150000001100000008000000030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00040000000F0000002A000000440000005200000052000000440000002A0000
          0010000000040000000000000000000000000000000000000000000000000000
          00000000000000000000000000020000000F001500470039007904590693045A
          06940037007B000F006100000059000000350000000F00000002000000000000
          000000000000000000000000000000000000000000000000000000000007012E
          04570E6A169A318E4A9B3F9B5E9B3F9B5F9B328F4B9B0E6A169A012302680000
          0057000000280000000700000000000000000000000000000000000000000000
          00000000000000000000021A05320F6C199A2F8C479B328F4B9B3592509B3693
          519B328F4D9B318E489B106B1A9A010F0361000000410000000F000000000000
          000000000000000000000000000000000000000000000000000006450E6E217E
          329B29863D9B2C89439B308D489B2F8C489B2E8B449B2A873F9B227F339B053A
          0C770000004F0000001400000000000000000000000000000000000000000000
          000000000000000000000D60198C217E319B2481369B28853B9B29863D9B2986
          3E9B28853C9B2481379B217E329B0C5B198E0000004F00000014000000000000
          00000000000000000000000000000000000000000000000000000E621D8B1B79
          299B257E349B2F823D9B3384439B3484439B2D823D9B227D319B1C7A2A9B0D5C
          1C8C000000400000000F00000000000000000000000000000000000000000000
          000000000000000000000C4B196A1E752A9B3F81479B4A85539B5088599B5088
          599B4885519B3D80469B1D75289B0A4016730000002700000007000000000000
          0000000000000000000000000000000000000000000000000000051C0A251471
          279A3F7E459B56865B9B5E89649B5D89629B5386599B3E7E439B1570279A0416
          08430000000E0000000200000000000000000000000000000000000000000000
          00000000000000000000000000000B3917451572299A387B3F9B5E86609B5E86
          619B397B409B16722A9A093214510000000E0000000400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000061D0C250F4F216A1167288C1168288C0F4D206C051C0C2E000000070000
          0002000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0001000000010000000100000000000000000000000000000000000000000000
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
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D000000000000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005F0000005F0000005F0000005F0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005F000000650000006F0000
          0074000000740000006F000000660000005F0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          00600000006E00000089000000A4000000B3000000B3000000A4000000890000
          006E000000600000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005E0000006E002300A8005F00DC07920BF70793
          0BF7005B00DD001800C3000000BA000000950000006E0000005E0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D00000065024C
          06B817AE24FE50E979FF67FF9AFF68FF9DFF52EB7CFF18AF25FE023904CA0000
          00B800000088000000650000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D032B079119B22AFE4EE774FF53EC7CFF58F184FF59F2
          85FF53EC7EFF50E976FF1AB12BFE021805C3000000A20000006E0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0B7218D036CF
          53FF43DC65FF49E26FFF4FE876FF4EE776FF4BE470FF45DE68FF38D154FF095F
          13DA000000B0000000730000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D159D29F037D050FF3BD459FF41DA61FF43DD65FF43DD
          66FF41DA62FF3CD55AFF37D053FF139529F1000000B0000000730000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D17A131EE2DC7
          44FF3DCF55FF4ED665FF54D96FFF55D96EFF4AD665FF38CE51FF2EC845FF1698
          2EF0000000A00000006E0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D137B29CC32C145FF67D575FF79DB88FF84DF93FF83DF
          92FF77DB86FF64D373FF30C142FF116924D600000086000000650000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0830118421B9
          41FE67CF71FF8DDC95FF9AE1A4FF99E1A1FF88DC92FF66CF6FFF22B841FE0623
          0DA30000006C0000005E0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D115E26A523BB44FE5CCA68FF9BDD9EFF9BDD
          9FFF5DCA6AFF25BB45FE0F5322B20000006C000000600000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D09311484188237CC1CAA41EF1CAB41EF187E35CE092E148D000000650000
          005E0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005F0000
          005F0000005F0000005F0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D000000000000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D0000005D0000005D0000
          005D0000005D0000005D0000005D0000005D0000005D00000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
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
          0000000000990000009900000099000000990000009900000099000000990000
          0099000000990000009900000099000000990000009900000099000000990000
          0099000000000000000000000000000000000000009900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000990000000000000000000000000000
          0000000000990000000000000099000000990000009900000099000000990000
          0099000000990000009900000099000000990000009900000099000000000000
          0099000000000000000000000000000000000000009900000000000000990000
          0099000000990000009900000099000000990000009900000099000000990000
          0099000000990000009900000000000000990000000000000000000000000000
          0000000000990000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0099000000000000000000000000000000000000009900000099000000990000
          0099000000990000009900000099000000997C5239EBA24D15F99B3900FB782B
          00F12E1000DD0000009900000099000000990000000000000000000000000000
          000000000000000000000000000000000099000000000000000000000000BB6B
          2DFFCF6800FFD36900FFEA9D40FFD26E04FFB14A00FF622300CB000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00990000000000000000D9A67EFFDA7705FFD97100FFD9A067FFFAFFFFFFFFF4
          CEFFC65A00FFB24D00FF744D37CA000000000000000000000000000000000000
          0000000000000000000000000000000000990000000000000000D18136FFE57D
          00FFE27C00FFD97000FFDC994DFFE1810BFFCF6700FFC35D00FFA7511CFD0000
          0000000000000000000000000000000000000000000000000000000000000000
          00990000000000000000D7832BFFEE8700FFEC8500FFF1A136FFFFFFF9FFFFCE
          86FFD56A00FFCE6800FFAD4A07FF000000000000000000000000000000000000
          0000000000000000000000000000000000990000000023232399DC8F3EFFF99E
          18FFF88F00FFE89A38FFF9FFFFFFFCD297FFDA6E00FFD46E00FFB15B1DFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          00990000000000000000E1AB7DFFFFBC4EFFFF9800FFDD9137FFE5F7FFFFE9C4
          94FFDE7400FFD46E00FFB48061FE000000000000000000000000000000000000
          000000000000000000000000000000000099000000990000009900000099D78D
          40FFFFBD4BFFEB8E17FFDD8218FFE2810BFFE07A00FFC0702EFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000052565068D19B6BFFE0933BFFDD8523FFD27F
          2BFF9F7754CE0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000A1A1A1A10A0A
          0A680A0A0A680A0A0A680A0A0A680A0A0A680A0A0A680A0A0A680A0A0A680A0A
          0A680A0A0A680A0A0A680A0A0A680A0A0A680A0A0A680A0A0A680A0A0A680A0A
          0A680A0A0A6806060639C2C2C2C2000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000A0A0A68C2C2C2C20000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000A0A0A68C2C2C2C2000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000A0A0A68C2C2C2C20000
          0000000000990000009900000099000000990000009900000099000000990000
          0099000000990000009900000099000000990000009900000099000000990000
          0099000000000A0A0A68C2C2C2C2000000000000009900000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000099000000000A0A0A68C2C2C2C20000
          0000000000990000000000000099000000990000009900000099000000990000
          0099000000990000009900000099000000990000009900000099000000000000
          0099000000000A0A0A68C2C2C2C2000000000000009900000000000000990000
          0099000000990000009900000099000000990000009900000099000000990000
          009900000099000000990000000000000099000000000A0A0A68C2C2C2C20000
          0000000000990000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0099000000000A0A0A68C2C2C2C2000000000000009900000099000000990000
          0099000000990000009900000099000000997C5239EBA24D15F99B3900FB782B
          00F12E1000DD000000990000009900000099000000000A0A0A68C2C2C2C20000
          000000000000000000000000000000000099000000000000000000000000BB6B
          2DFFCF6800FFD36900FFEA9D40FFD26E04FFB14A00FF622300CB000000000000
          0000000000000A0A0A68C2C2C2C2000000000000000000000000000000000000
          00990000000000000000D9A67EFFDA7705FFD97100FFD9A067FFFAFFFFFFFFF4
          CEFFC65A00FFB24D00FF744D37CA00000000000000000A0A0A68C2C2C2C20000
          0000000000000000000000000000000000990000000000000000D18136FFE57D
          00FFE27C00FFD97000FFDC994DFFE1810BFFCF6700FFC35D00FFA7511CFD0000
          0000000000000A0A0A68C2C2C2C2000000000000000000000000000000000000
          00990000000000000000D7832BFFEE8700FFEC8500FFF1A136FFFFFFF9FFFFCE
          86FFD56A00FFCE6800FFAD4A07FF00000000000000000A0A0A68C2C2C2C20000
          0000000000000000000000000000000000990000000023232399DC8F3EFFF99E
          18FFF88F00FFE89A38FFF9FFFFFFFCD297FFDA6E00FFD46E00FFB15B1DFF0000
          0000000000000A0A0A68C2C2C2C2000000000000000000000000000000000000
          00990000000000000000E1AB7DFFFFBC4EFFFF9800FFDD9137FFE5F7FFFFE9C4
          94FFDE7400FFD46E00FFB48061FE00000000000000000A0A0A68C2C2C2C20000
          000000000000000000000000000000000099000000990000009900000099D78D
          40FFFFBD4BFFEB8E17FFDD8218FFE2810BFFE07A00FFC0702EFF000000000000
          0000000000000A0A0A68C2C2C2C2000000000000000000000000000000000000
          000000000000000000000000000052565068D19B6BFFE0933BFFDD8523FFD27F
          2BFF9F7754CE000000000000000000000000000000000A0A0A68B8B8B8B80000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000A0A0A68CCCCCCCCC2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
          C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
          C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2A1A1A1A1}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000404042600000099000000990404
          0426000000000000000004040426000000990000009904040426000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000990000009900000099000000990000000000000000000000990000
          0099000000990000009903000303000000000000000000000000000000000000
          0000000000000000000000000000000000000000009900000099000000990000
          0099000000000000000000000099000000990000009900000099080008080000
          0000000000000000000000000000000000000000000000000000000000000000
          0000040404260000009900000099040404260000000000000000040404260000
          0099000000990404042600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000404
          0426000000990000009900000099000000990000009900000099000000990000
          0099000000990000009904040426000000000000000000000000000000000000
          0000000000000000000004040426000000990000000000000099000000000000
          0000000000990000000000000000000000990000000000000000000000990000
          0000000000000000000000000000000000000000000000000000000000990000
          0000000000000000009900000000000000000000009900000000000000000000
          0099000000000000000000000099000000000000000000000000000000000000
          0000000000000000000000000099000000990000009900000099000000990000
          0099000000990000009900000099000000990000009900000099000000990000
          0000000000000000000000000000000000000000000000000000000000990000
          0000000000000000009900000000000000000000009900000000000000000000
          0099000000000000000000000099000000000000000000000000000000000000
          0000000000000000000000000099000000000000000000000099000000000000
          0000000000990000000000000000000000990000000000000000000000990000
          0000000000000000000000000000000000000000000000000094000000990000
          0099000000990000009900000099000000990000009900000099000000990000
          0099000000990000009900000099000000000000000000000000000000000000
          0099000000990000009900000000000000000000000000000000000000000000
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
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101010102C2C2C2C2C2C2C2C2C2C
          2C2C2C2C2C2C2C2C2C2C2C2C2C2C1B1B1B1B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001010
          1010222222451818187018181870161616701616167018181870181818701D1D
          1D561B1B1B1B0000000000000000000000000000000000000000000000000000
          0000000000000000000010101010222222451717177018181870161616701111
          1170111111701616167018181870171717701D1D1D561B1B1B1B000000000000
          0000000000000000000000000000000000000000000010101010212121451616
          16701616167016161670141414700808081B0808081B14141470161616701616
          1670161616701C1C1C561B1B1B1B000000000000000000000000000000000000
          0000000000002020204515151570151515701515157015151570141414702626
          26392626263914141470151515701515157015151570151515701A1A1A560000
          0000000000000000000000000000000000000000000011111170141414701414
          1470141414701414147013131370121212701212127013131370141414701414
          1470141414701414147011111170000000000000000000000000000000000000
          00000000000010101070131313701313137013131370121212700F0F0F700B0B
          0B700B0B0B700F0F0F7012121270131313701313137013131370101010700000
          000000000000000000000000000000000000000000000E0E0E70121212701212
          127012121270101010700E0E0E6600000000000000000E0E0E66101010701212
          127012121270121212700E0E0E70000000000000000000000000000000000000
          0000000000000E0E0E701111117011111170111111700F0F0F700B0B0B4C0000
          0000000000000B0B0B4C0F0F0F701111117011111170111111700E0E0E700000
          000000000000000000000000000000000000000000000C0C0C700F0F0F700F0F
          0F700F0F0F700D0D0D700505052D00000000000000000505052D0D0D0D700F0F
          0F700F0F0F700F0F0F700C0C0C70000000000000000000000000000000000000
          000000000000090909700C0C0C700E0E0E700E0E0E700D0D0D700A0A0A170000
          0000000000000A0A0A170D0D0D700E0E0E700E0E0E700D0D0D70090909700000
          000000000000000000000000000000000000000000000101012A080808700B0B
          0B700D0D0D700C0C0C701A1A1A3400000000000000001A1A1A340C0C0C700D0D
          0D700C0C0C700909097003030345000000000000000000000000000000000000
          000000000000000000000101012A080808700A0A0A700B0B0B701313135F2C2C
          2C2C2C2C2C2C1313135F0B0B0B700B0B0B700808087003030345000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          012A070707700808087009090970090909700909097009090970090909700808
          0870030303450000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000101012A05050570050505700505
          0570050505700505057005050570020202450000000000000000000000000000
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
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003E3E
          3E58202020DF202020DF3434344F000000000000000000000000373737512020
          20DF202020DF3737375000000000000000000000000000000000000000000000
          0000000000000000000000000000000000BF000000BF000000BF000000BF0000
          00000000000000000000000000BF000000BF000000BF000000BF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00BF000000BF000000BF000000BF000000000000000000000000000000BF0000
          00BF000000BF000000BF00000000000000000000000000000000000000000000
          000000000000000000000000000054545487000000BF000000BF000000330000
          0000000000000000000016161649000000BF000000BF2727275A000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000BF000000BF000000BF000000BF000000BF0000
          00BF000000BF000000BF000000BF000000BF151515DC000000BF000000300000
          00000000000000000000000000000000000000000000000000C8000000810000
          0018000000810000001800000081000000180000008100000018000000810000
          00180000008100000018000000BF000000000000000000000000000000000000
          0000555555A0000000C800000018000000810000000000000081000000000000
          0081000000000000008100000000000000810000000000000081000000BF0000
          000000000000000000000000000000000000121212DA00000018000000810000
          0000000000810000000000000081000000000000008100000000000000810000
          00000000008100000018000000BF000000000000000000000000000000000000
          0000121212DA0000008100000000000000810000000000000081000000000000
          0081000000000000008100000000000000810000000000000081000000BF0000
          000000000000000000000000000000000000121212DA00000018000000810000
          0000000000810000000000000081000000000000008100000000000000810000
          00000000008100000018000000BF000000000000000000000000000000000000
          0000000000BF0000008100000000000000810000000000000081000000000000
          0081000000000000008100000000000000810000000000000081000000BF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000BF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000141414C30000
          00BA000000000000000000000000000000000000000000000000000000000000
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
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000004000000110000
          001B000000100000000300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000040000
          000F0000001100000017000000490000006A000000430000000F000000010000
          0001000000020000000100000000000000000000000000000000000000000000
          000000000000000000010000001500000047000000520D0D0D851A1A1AE41111
          119E00000073000000260000000E0000001F000000220000000B000000010000
          00000000000000000000000000000000000000000000000000080B0B0B810C0C
          0CA70101019C3C3C3CDA727272FF4F4F4FC9000000960000005A0000004B0000
          0076000000720000002800000004000000000000000000000000000000000000
          000000000000070707223E3E3EFF8C8C8CFF828282F7AFAFAFFFAEAEAEFF8282
          82EF1C1C1CA1030303921B1B1BE2474747FA0202029300000040000000090000
          000000000000000000000000000000000000000000002929295FBDBDBDFFB2B2
          B2FF616161C2717171BC444545D59C9C9CFFAFAFAFFDA8A8A8F7797979FD8686
          86FF0F0F0F940000005800000013000000000000000000000000000000000000
          0000000000000F10102F8E8E8EDDB5A6A6FF9F7F7EF2826161D5745B5BEA7573
          73FF565857B45F6060B6696A6AC79E9E9EFD373737A900000052000000120000
          00000000000000000000000000000000000000000000291F1F45C39292F1D2A1
          A1FCE1B0AFFADFB2B2FCCD9898FEBC898BFFA57777F2725151D0261B1BA69FA2
          A2F6393939A40000002F00000006000000000000000000000000000000000000
          000000000000A17A7ACDE0BBBAEFDBB8B8EEDDB9B9F0DFB7B7F5DBA9A9F9E5B4
          B4FEE1B3B3FCD19F9FFBB48181FE655B5BD40202027D00000020000000010000
          00000000000000000000000000000000000000000000BD9090E9DFBFBEEDD9BA
          BAEDD9BABAEDDCBBBBEFE2B2B2FAEDBEBEFEE4B8B8F9E6B8B8FAC89898FF6750
          50CF000000820000002200000001000000000000000000000000000000000000
          000000000000CD9E9EF6E0C7C6ECD9C2C2ECD9C3C3ECE1CACAF0E9BABAFCECC1
          C1FBE6BABAF7E6BCBCF8D5A4A5FE7A5D5DDC0000008C0000002A000000020000
          00000000000000000000000000000000000000000000D5A8A8FCF2EEEFF8DAC9
          C9E8C8B1B1DFC0A6A6DDEFD9D9FCF5D9D9FCEAC7C7F7E9C0C0F6F8C8CAFD9874
          74F300000096000000440000000C000000000000000000000000000000000000
          0000000000005C49495EBA8F8ECDDBB7B7F1D8B7B7EAC5A8A8D8E7D2D2FBE8DF
          DFF4E5DFDFF0F5E4E4F9FCE4E7FDA57F7FFE0B0C0C980000006D0000001B0000
          0000000000000000000000000000000000000000000000000000000000000B08
          080C523F3F5D9F7979B7E0B7B7FDCAA0A0F48E6B6BD1634545B9654245B89786
          86F1616262D20000006B0000001C000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000989999C9878A
          8AEC4C4E4EBB6F7373D7AAABACE0BBBDBDF87B7B7BE10000002F0000000A0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000D0D0D1F7B7779D2959495F6848484DB686868B14545
          45890E0E0E300000000800000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000001000000040000000C000000130000
          001700000017000000130000000B000000050000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000030000
          000B000000200000003B000000500000005A000000590000004E000000380000
          001D000000090000000200000000000000000000000000000000000000000000
          0000000000000000000300000010030303371111116B2121218B2C2C2C9E2B2B
          2B9E1E1E1E8A0D0D0D720000006D000000570000002E0000000D000000020000
          000000000000000000000000000000000000000000010000000C0F0F0F4E3333
          33A3414141B2434343B2414141B23E3E3EB23D3D3DB2393939B22A2A2A9F0606
          06710000005F0000002E0000000A000000000000000000000000000000000000
          000000000004111111473D3D3DAF484848B2474747B2474747B25F5F5FB27070
          70B24C4C4CB23E3E3EB23B3B3BB2323232AB06060670000000570000001D0000
          0004000000000000000000000000000000000505051A3B3B3BA6494949B24949
          49B2494949B2666666B2AEAEAEB2B2B2B2B2A7A7A7B2494949B2404040B23B3B
          3BB22A2A2A9F0000006D000000380000000B0000000000000000000000000000
          00001D1D1D61535353B24B4B4BB24B4B4BB24B4B4BB25E5E5EB2AAAAAAB2AFAF
          AFB2A3A3A3B2494949B2444444B23F3F3FB2393939B20D0D0D730000004E0000
          001300000000000000000000000000000000353535945B5B5BB24D4D4DB24D4D
          4DB24D4D4DB24A4A4AB24A4A4AB2595959B2494949B2474747B2464646B24444
          44B23D3D3DB21F1F1F8B0000005A000000170000000000000000000000000000
          0000484848AE5F5F5FB24F4F4FB24F4F4FB24F4F4FB25B5B5BB28C8C8CB28989
          89B27A7A7AB24B4B4BB2474747B2464646B2404040B22C2C2C9F0000005A0000
          0017000000000000000000000000000000004A4A4AAF696969B2525252B25252
          52B2515151B25E5E5EB2B0B0B0B2B2B2B2B29A9A9AB24B4B4BB2494949B24747
          47B2424242B22E2E2EA000000050000000130000000000000000000000000000
          000039393997767676B2545454B2545454B2545454B2595959B2AEAEAEB2B1B1
          B1B2969696B24C4C4CB2494949B2474747B2444444B22222228D0000003B0000
          000C00000000000000000000000000000000232323646E6E6EB2676767B25757
          57B2575757B2565656B2A9A9A9B2A9A9A9B28F8F8FB24D4D4DB24A4A4AB24949
          49B2424242B21212126C00000020000000040000000000000000000000000000
          0000080808154B4B4BAA797979B25E5E5EB2585858B2535353B2A5A5A5B2A6A6
          A6B28A8A8AB24C4C4CB24B4B4BB2494949B2343434A4030303370000000B0000
          000100000000000000000000000000000000000000001C1C1C43585858B17979
          79B2656565B2494949B24B4B4BB24D4D4DB24D4D4DB24D4D4DB24C4C4CB23E3E
          3EAF0F0F0F4E0000001000000002000000000000000000000000000000000000
          000000000000000000001B1B1B434B4B4BAA707070B2727272B2676767B25D5D
          5DB2595959B2515151B23A3A3AA6121212470000000C00000003000000000000
          0000000000000000000000000000000000000000000000000000000000000808
          0815232323643B3B3B974B4B4BAF494949AE373737941D1D1D610505051A0000
          0004000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000C0000001C0000001F1E1E1E67262626810E0E0E3D0000001F0000
          001C00000010000000100000001000000010000000100000000C000000000000
          0000000000000000000000000000000000000000000000000000000000003E3E
          3E937B7B7B994040409419191930000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000002020203464646999797979986868699444444951A1A
          1A38000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000B0B0B113A3A3A6D4A4A4A954949
          499997979799929292998A8A8A99494949993D3D3D993D3D3D993D3D3D993D3D
          3D993D3D3D993B3B3B942B2B2B680707070D0000000000000000000000000000
          000043434373757575999494949997979799949494998D8D8D99929292999797
          9799979797999797979997979799979797999797979993939399666666992C2C
          2C6A000000000000000000000000000000005A5A5A97959595998F8F8F998E8E
          8E998E8E8E998E8E8E998E8E8E998E8E8E998E8E8E998E8E8E998E8E8E998E8E
          8E998E8E8E998F8F8F99949494993B3B3B940000000000000000000000000000
          00005F5F5F99979797998F8F8F998F8F8F998F8F8F998F8F8F998F8F8F998F8F
          8F998F8F8F998F8F8F998F8F8F998F8F8F998F8F8F998F8F8F99979797993D3D
          3D99000000000000000000000000000000006161619997979799909090995D5D
          5D995D5D5D995D5D5D995D5D5D995D5D5D997777779991919199919191999191
          91999191919991919199979797993D3D3D990000000000000000000000000000
          0000616161999797979992929299929292999292929992929299929292999292
          9299929292999292929992929299929292999292929992929299979797993D3D
          3D99000000000000000000000000000000006161619997979799939393995D5D
          5D995D5D5D995D5D5D995D5D5D995D5D5D995D5D5D995D5D5D995D5D5D995D5D
          5D995E5E5E999494949997979799404040990000000000000000000000000000
          0000616161999797979995959599959595999595959995959599959595999595
          9599959595999595959995959599959595999595959995959599979797994343
          4399000000000000000000000000000000006161619997979799949494996060
          6099606060996060609960606099606060996060609960606099606060996060
          6099616161999595959997979799474747990000000000000000000000000000
          00005F5F5F979595959995959599959595999595959995959599959595999595
          9599959595999595959995959599959595999595959995959599949494994949
          499400000000000000000000000000000000484848717A7A7A99959595999797
          9799979797999797979997979799979797999797979997979799979797999797
          97999797979994949499747474993C3C3C6D0000000000000000000000000000
          00000C0C0C114646466E5D5D5D95626262996262629962626299626262996262
          6299626262996262629962626299616161995F5F5F99585858944040406C0B0B
          0B10000000000000000000000000000000000000000000000000030303040505
          0507050505070505050705050507050505070505050705050507050505070505
          0507050505070303030400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000150000002F000000353A332FAC4B423BD71A181666000000350000
          002F0000001C0000001C0000001C0000001C0000001C00000015000000000000
          000000000000000000000000000000000000000000000000000000000000796A
          5FF5D2CECAFF7B6D63F82D2A2750000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000202020386766AFFFBFBFBFFE3E0DEFF80746BFA312C
          295E000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000001413111D71635AB7907D71F98E7C
          70FFFBFBFBFFFCF5F1FFE9E6E5FF897C72FF76675DFF75675CFF75675CFF7567
          5CFF75675CFF716459F7534A43AE0D0C0B160000000000000000000000000000
          0000817166C0CEC4BDFFF8F8F7FFFBFBFBFFFBF8F6FFFEEDE3FFFCF4EFFFFBFB
          FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFF6F6F5FFB3ABA5FF554C
          45B100000000000000000000000000000000AE988AFCFAF9F9FFFDF0E7FFFEEF
          E5FFFEEFE5FFFEEFE5FFFEEFE5FFFEEFE5FFFEEFE5FFFEEFE5FFFEEFE5FFFEEF
          E5FFFEEFE5FFFDF0E8FFF7F7F6FF726459F80000000000000000000000000000
          0000B7A092FFFBFBFBFFFEF1E8FFFEF1E8FFFEF1E8FFFEF1E8FFFEF1E8FFFEF1
          E8FFFEF1E8FFFEF1E8FFFEF1E8FFFEF1E8FFFEF1E8FFFEF1E8FFFBFBFBFF7567
          5CFF00000000000000000000000000000000BAA394FFFBFBFBFFFEF2EAFFE9A8
          67FFE9A867FFE9A867FFE9A867FFE9A867FFF3CEABFFFEF3ECFFFEF3ECFFFEF3
          ECFFFEF3ECFFFEF3ECFFFBFBFBFF75675CFF0000000000000000000000000000
          0000BBA395FFFBFBFBFFFFF5EFFFFFF5EFFFFFF5EFFFFFF5EFFFFFF5EFFFFFF5
          EFFFFFF5EFFFFFF5EFFFFFF5EFFFFFF5EFFFFFF5EFFFFFF5EFFFFBFBFBFF7668
          5DFF00000000000000000000000000000000BBA395FFFBFBFBFFFEF6F1FFE9A8
          67FFE9A867FFE9A867FFE9A867FFE9A867FFE9A867FFE9A867FFE9A867FFE9A8
          67FFE9A969FFFFF7F3FFFBFBFBFF7C6C61FF0000000000000000000000000000
          0000BBA395FFFBFBFBFFFFF9F6FFFFF9F6FFFFF9F6FFFFF9F6FFFFF9F6FFFFF9
          F6FFFFF9F6FFFFF9F6FFFFF9F6FFFFF9F6FFFFF9F6FFFFF9F6FFFBFBFBFF8272
          67FF00000000000000000000000000000000BBA395FFFBFBFBFFFEF8F5FFEAAC
          6EFFEAAC6EFFEAAC6EFFEAAC6EFFEAAC6EFFEAAC6EFFEAAC6EFFEAAC6EFFEAAC
          6EFFEAAD70FFFFFAF7FFFBFBFBFF8A796DFF0000000000000000000000000000
          0000B8A091FCFAFAF9FFFEFAF7FFFFFAF7FFFFFAF7FFFFFAF7FFFFFAF7FFFFFA
          F7FFFFFAF7FFFFFAF7FFFFFAF7FFFFFAF7FFFFFAF7FFFEFAF7FFF8F8F7FF8F7C
          71F8000000000000000000000000000000008B7A6FBDDACEC6FFF9F9F8FFFBFB
          FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFBFBFBFFF8F8F7FFCDC3BBFF73655CB60000000000000000000000000000
          00001715131D87766CB8B69E90F9BCA597FFBCA597FFBCA597FFBCA597FFBCA5
          97FFBCA597FFBCA597FFBCA597FFBAA495FFB7A193FFAA9588F77A6C62B41513
          121C000000000000000000000000000000000000000000000000030303040A09
          090D0A09090D0A09090D0A09090D0A09090D0A09090D0A09090D0A09090D0A09
          090D0A09080D0303030400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object ilChat: TcxImageList
    Height = 20
    Width = 42
    FormatVersion = 1
    DesignInfo = 18874824
    ImageInfo = <
      item
        Image.Data = {
          560D0000424D560D00000000000036000000280000002A000000140000000100
          200000000000200D000000000000000000000000000000000000000000000000
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
          00000000000000000000000000000000000000000000131313132C2C2C2C1C1C
          1C1C030303030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000303
          0330151515732323235E2D2D2D34090909090000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000141414591919197F1B1B1B7A2C2C2C41333333333333
          3333262626261616161603030303000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000090909091D1D1D541818187F1919197F1818
          187F1717177F1616167F1E1E1E6C262626542D2D2D340C0C0C0C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000030303032626263C1C1C1C711818
          187F1818187F1515157F1010107F1010107F1515157F1818187F1818187A2A2A
          2A46101010100000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001818181F1919
          19761717177F1717177F1717177F1414147F0909091F0909091F1414147F1717
          177F1717177F1616167F25252548030303030000000000000000000000000000
          000E00000063000000550000005500000063000000000000002A000000550000
          0000000000000000007F00000000000000550000006300000055000000630000
          002A0000000000000055000000630000001C0000000000000000000000000000
          0000191919521414147F1515157F1515157F1515157F1313137F2B2B2B412B2B
          2B411313137F1515157F1515157F1515157F1616167A1B1B1B22000000000000
          00000000000E000000630000000E00000000000000000000000E000000000000
          002A0000005500000000000000000000007F000000000000007F000000000000
          0000000000630000002A000000000000007F0000000000000000000000000000
          000000000000000000001818186C1414147F1414147F1414147F1414147F1111
          117F0C0C0C7F0C0C0C7F1111117F1414147F1414147F1414147F1313137F1818
          1858000000000000000000000046000000460000000000000000000000000000
          0000000000000000002A0000005500000000000000000000007F000000000000
          0055000000630000002A000000630000002A000000000000007F000000000000
          0000000000000000000000000000000000000E0E0E7F1212127F1313137F1313
          137F1111117F0E0E0E7300000000000000000E0E0E731111117F1313137F1313
          137F1212127F1717176C0000000000000000000000550000002A000000000000
          00000000000000000000000000000000002A0000005500000000000000000000
          007F0000000000000000000000000000002A000000630000002A000000000000
          007F0000000000000000000000000000000000000000000000000F0F0F661010
          107F1111117F1111117F0F0F0F7F0909094C00000000000000000909094C0F0F
          0F7F1111117F1111117F1111117F0D0D0D7F0000000000000000000000550000
          002A00000000000000000000000000000000000000000000002A000000710000
          00380000004600000063000000000000002A000000380000002A000000710000
          000E0000002A0000007F0000002A0000000E0000000000000000000000000000
          0000050505490D0D0D7F1010107F1010107F0E0E0E7F0B0B0B22000000000000
          00000B0B0B220E0E0E7F1010107F1010107F0F0F0F7F0E0E0E66000000000000
          00000000001C0000006300000000000000000000000000000000000000000000
          002A000000550000000E0000002A0000000000000000000000000000001C0000
          002A0000000E000000000000002A0000007F0000002A0000000E000000000000
          0000000000000000000000000008090909780C0C0C7F0E0E0E7F0E0E0E7F1E1E
          1E3C00000000000000001E1E1E3C0E0E0E7F0F0F0F7F0E0E0E7F0B0B0B7F0404
          044100000000000000000000000000000055000000550000000E000000000000
          000E000000000000002A00000055000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000071000000000000
          00000000000000000000000000000000000000000000010101280808087F0A0A
          0A7F0C0C0C7F1616166C33333333333333331616166C0D0D0D7F0C0C0C7F0A0A
          0A7F0808087000000008000000000000000000000000000000000000001C0000
          00550000005500000055000000000000002A0000005500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000001010120060606770808087F0909097F0A0A0A7F0A0A0A7F0A0A0A7F0909
          097F0808087F0505056700000018000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000801010138030303600606067F0606
          067F0606067F0404046701010138000000000000000000000000000000000000
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
      end
      item
        Image.Data = {
          560D0000424D560D00000000000036000000280000002A000000140000000100
          200000000000200D000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000026262626595959593939
          3939060606060000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000606
          06602A2A2AE7454545BC5B5B5B69131313130000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000282828B2323232FF373737F559595982666666666666
          66664C4C4C4C2C2C2C2C06060606000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000131313133B3B3BA9313131FF333333FF3131
          31FF2E2E2EFF2D2D2DFF3C3C3CD94C4C4CA95B5B5B6919191919000000000000
          00000000000000000000000000C6000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00C600000000000000000000000000000000060606064C4C4C78383838E23030
          30FF303030FF2B2B2BFF212121FF212121FF2B2B2BFF303030FF313131F55353
          538C202020200000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000003030303F3131
          31EC2E2E2EFF2E2E2EFF2E2E2EFF292929FF1212123F1212123F292929FF2E2E
          2EFF2E2E2EFF2D2D2DFF4A4A4A91060606060000000000000000000000000000
          001C000000C6000000AA000000AA000000C60000000000000055000000AA0000
          000000000000000000FF00000000000000AA000000C6000000AA000000C60000
          005500000000000000AA000000C6000000380000000000000000000000000000
          0000333333A5292929FF2B2B2BFF2B2B2BFF2B2B2BFF272727FF565656835656
          5683272727FF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BF536363645000000000000
          00000000001C000000C60000001C00000000000000000000001C000000000000
          0055000000AA0000000000000000000000FF00000000000000FF000000000000
          0000000000C60000005500000000000000FF0000000000000000000000000000
          00000000000000000000313131D9282828FF292929FF292929FF282828FF2222
          22FF191919FF191919FF222222FF282828FF292929FF292929FF272727FF3030
          30B000000000000000000000008D0000008D0000000000000000000000000000
          00000000000000000055000000AA0000000000000000000000FF000000000000
          00AA000000C600000055000000C60000005500000000000000FF000000000000
          0000000000000000000000000000000000001D1D1DFF242424FF262626FF2626
          26FF232323FF1D1D1DE700000000000000001D1D1DE7232323FF262626FF2626
          26FF252525FF2F2F2FD90000000000000000000000AA00000055000000000000
          000000000000000000000000000000000055000000AA00000000000000000000
          00FF00000000000000000000000000000055000000C600000055000000000000
          00FF0000000000000000000000000000000000000000000000001E1E1ECD2020
          20FF232323FF232323FF1F1F1FFF111111980000000000000000111111981F1F
          1FFF232323FF232323FF222222FF1A1A1AFF0000000000000000000000AA0000
          0055000000000000000000000000000000000000000000000055000000E20000
          00710000008D000000C600000000000000550000007100000055000000E20000
          001C00000055000000FF000000550000001C0000000000000000000000000000
          00000A0A0A921A1A1AFF202020FF212121FF1D1D1DFF16161645000000000000
          0000161616451D1D1DFF212121FF212121FF1E1E1EFF1C1C1CCC000000000000
          000000000038000000C600000000000000000000000000000000000000000000
          0055000000AA0000001C00000055000000000000000000000000000000380000
          00550000001C0000000000000055000000FF000000550000001C000000000000
          0000000000000000000000000010121212F1191919FF1D1D1DFF1C1C1CFF3C3C
          3C7900000000000000003C3C3C791C1C1CFF1E1E1EFF1C1C1CFF171717FF0909
          0982000000000000000000000000000000AA000000AA0000001C000000000000
          001C0000000000000055000000AA000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000E2000000000000
          0000000000000000000000000000000000000000000002020250111111FF1515
          15FF181818FF2B2B2BD966666666666666662C2C2CD91A1A1AFF181818FF1414
          14FF101010E10000001000000000000000000000000000000000000000380000
          00AA000000AA000000AA0000000000000055000000AA00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010101400C0C0CEF111111FF131313FF141414FF151515FF141414FF1313
          13FF111111FF0A0A0ACF01010130000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000001003030370070707C00C0C0CFF0C0C
          0CFF0C0C0CFF080808CF03030370000000000000000000000000000000000000
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
      end
      item
        Image.Data = {
          560D0000424D560D00000000000036000000280000002A000000140000000100
          200000000000200D000000000000000000000000000000000000000000000000
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
          000000000000000000000000000000000000000000000B0B0B0B1A1A1A1A1111
          1111010101010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000202
          021C0C0C0C45151515381B1B1B1F050505050000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000C0C0C350F0F0F4C101010491A1A1A261E1E1E1E1E1E
          1E1E161616160D0D0D0D01010101000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000005050505111111320F0F0F4C0F0F0F4C0F0F
          0F4C0E0E0E4C0D0D0D4C12121241161616321B1B1B1F07070707000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000101010117171724111111430E0E
          0E4C0E0E0E4C0D0D0D4C0A0A0A4C0A0A0A4C0D0D0D4C0E0E0E4C0F0F0F491919
          192A090909090000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000E0E0E120F0F
          0F460E0E0E4C0E0E0E4C0E0E0E4C0C0C0C4C05050512050505120C0C0C4C0E0E
          0E4C0E0E0E4C0D0D0D4C1616162B010101010000000000000000000000000000
          00080000003B00000032000000320000003B0000000000000019000000320000
          0000000000000000004C00000000000000320000003B000000320000003B0000
          001900000000000000320000003B000000100000000000000000000000000000
          00000F0F0F310C0C0C4C0D0D0D4C0D0D0D4C0D0D0D4C0C0C0C4C1A1A1A271A1A
          1A270C0C0C4C0D0D0D4C0D0D0D4C0D0D0D4C0D0D0D4910101014000000000000
          0000000000080000003B00000008000000000000000000000008000000000000
          00190000003200000000000000000000004C000000000000004C000000000000
          00000000003B00000019000000000000004C0000000000000000000000000000
          000000000000000000000F0F0F410C0C0C4C0C0C0C4C0C0C0C4C0C0C0C4C0A0A
          0A4C0707074C0707074C0A0A0A4C0C0C0C4C0C0C0C4C0C0C0C4C0C0C0C4C0E0E
          0E3400000000000000000000002A0000002A0000000000000000000000000000
          000000000000000000190000003200000000000000000000004C000000000000
          00320000003B000000190000003B00000019000000000000004C000000000000
          0000000000000000000000000000000000000909094C0B0B0B4C0B0B0B4C0B0B
          0B4C0A0A0A4C090909450000000000000000090909450A0A0A4C0B0B0B4C0B0B
          0B4C0B0B0B4C0E0E0E4100000000000000000000003200000019000000000000
          0000000000000000000000000000000000190000003200000000000000000000
          004C000000000000000000000000000000190000003B00000019000000000000
          004C0000000000000000000000000000000000000000000000000909093D0A0A
          0A4C0A0A0A4C0A0A0A4C0909094C0505052D00000000000000000505052D0909
          094C0A0A0A4C0A0A0A4C0A0A0A4C0808084C0000000000000000000000320000
          0019000000000000000000000000000000000000000000000019000000430000
          00210000002A0000003B00000000000000190000002100000019000000430000
          0008000000190000004C00000019000000080000000000000000000000000000
          00000303032B0808084C0A0A0A4C0A0A0A4C0909094C06060614000000000000
          0000060606140909094C0A0A0A4C0A0A0A4C0909094C0808083D000000000000
          0000000000100000003B00000000000000000000000000000000000000000000
          0019000000320000000800000019000000000000000000000000000000100000
          00190000000800000000000000190000004C0000001900000008000000000000
          0000000000000000000000000004050505480707074C0909094C0808084C1212
          12240000000000000000121212240808084C0909094C0808084C0707074C0303
          0326000000000000000000000000000000320000003200000008000000000000
          0008000000000000001900000032000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000043000000000000
          00000000000000000000000000000000000000000000000000180505054C0606
          064C0707074C0D0D0D411E1E1E1E1E1E1E1E0D0D0D410808084C0707074C0606
          064C050505430000000400000000000000000000000000000000000000100000
          0032000000320000003200000000000000190000003200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000013040404470505054C0606064C0606064C0606064C0606064C0606
          064C0505054C0303033E0000000E000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000401010121020202390404044C0404
          044C0404044C0202023E01010121000000000000000000000000000000000000
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
  object TimerRealinha: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerRealinhaTimer
    Left = 432
    Top = 360
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton2'
      end
      item
        Visible = True
        ItemName = 'dxBarButton4'
      end>
    UseOwnFont = False
    Left = 608
    Top = 248
  end
  object imRod32: TcxImageList
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 24117384
    ImageInfo = <
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001313132C222222572424245C212121541D1D
          1D4B191919421616163A131313310F0F0F280C0C0C1F080808160505050E0202
          0206010101020000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000111111272A2A2A652929296628282866272727662727
          2766272727662727276627272766272727662626266626262666262626662525
          2565232323612323235A1F1F1F511B1B1B481818183F141414361111112E0B0B
          0B1D010101040000000000000000000000000000000000000000000000000000
          00000000000000000000222222522A2A2A6631313166424242663B3B3B663737
          3766323232662E2E2E662A2A2A66262626662424246624242466242424662424
          2466242424662424246624242466242424662424246624242466242424662424
          24661D1D1D500202020600000000000000000000000000000000000000000000
          000000000000000000002626265A292929664040406658585866545454665454
          546654545466545454665454546655555566525252664E4E4E66494949664545
          4566414141663C3C3C6638383866333333662E2E2E662A2A2A66252525662222
          2266242424661414143A00000000000000000000000000000000000000000000
          000000000000000000002727275A2A2A2A664040406658585866565656665656
          5666565656665656566657575766565656665656566656565666565656665555
          5566555555665454546654545466545454665454546655555566575757663434
          3466232323661F1F1F5800000000000000000000000000000000000000000000
          000000000000000000002727275A2B2B2B664141416659595966565656665656
          566657575766505050663A3A3A663A3A3A663A3A3A663E3E3E663F3F3F664141
          4166434343665252526655555566545454665353536653535366545454663C3C
          3C66242424662121215D00000000000000000000000000000000000000000000
          000000000000000000002828285A2C2C2C66424242665A5A5A66575757665757
          5766585858664A4A4A664F4F4F66666666666666666642424266555555665E5E
          5E664C4C4C664646466656565666545454665454546653535366545454663C3C
          3C66242424662222225D00000000000000000000000000000000000000000000
          000000000000000000002929295A2C2C2C66434343665C5C5C66585858665858
          5866595959664A4A4A664E4E4E66666666664848486612121266474747666666
          6666545454664545456657575766555555665454546654545466545454663C3C
          3C66252525662323235D00000000000000000000000000000000000000000000
          000000000000000000002929295A2D2D2D66444444665C5C5C66595959665858
          58665A5A5A664B4B4B664E4E4E66646464661616166614141466272727665454
          5466545454664646466657575766555555665555556655555566545454663C3C
          3C66262626662323235D00000000000000000000000000000000000000000000
          000000000000000000002B2B2B5D2E2E2E66464646665D5D5D66595959665959
          59665A5A5A664C4C4C66525252662D2D2D66151515661E1E1E66161616663C3C
          3C664E4E4E664747476658585866565656665555556655555566545454663D3D
          3D66262626662424245D00000000000000000000000000000000000000000000
          000000000000000000002C2C2C5D2E2E2E66474747665E5E5E665A5A5A665A5A
          5A665B5B5B664E4E4E6633333366171717662C2C2C665F5F5F66171717661E1E
          1E663B3B3B664848486658585866565656665656566655555566545454663C3C
          3C66282828662424245A00000000000000000000000000000000000000000000
          000000000000000000002C2C2C5D2E2E2E6649494966606060665B5B5B665B5B
          5B665D5D5D6648484866191919661A1A1A664E4E4E6658585866383838661A1A
          1A66232323663C3C3C665A5A5A66575757665656566656565666555555663C3C
          3C66282828662424245A00000000000000000000000000000000000000000000
          000000000000000000002D2D2D5D2F2F2F664A4A4A66616161665C5C5C665C5C
          5C665C5C5C664B4B4B6618181866414141664848486646464666484848662626
          26661C1C1C663232326651515166585858665757576657575766545454663D3D
          3D66282828662525255A00000000000000000000000000000000000000000000
          000000000000000000002E2E2E5D303030664B4B4B66626262665C5C5C665C5C
          5C665C5C5C6658585866464646665F5F5F665C5C5C665D5D5D665D5D5D665656
          56661F1F1F66202020663A3A3A66545454665858586657575766555555663D3D
          3D66292929662525255A00000000000000000000000000000000000000000000
          000000000000000000002F2F2F5D303030664C4C4C66646464665D5D5D665D5D
          5D665D5D5D665D5D5D665F5F5F665E5E5E665D5D5D665C5C5C665C5C5C665E5E
          5E664848486620202066242424663B3B3B665A5A5A6658585866555555663E3E
          3E662A2A2A662626265A00000000000000000000000000000000000000000000
          000000000000000000002F2F2F5D313131664D4D4D66656565665E5E5E665E5E
          5E665E5E5E665E5E5E664E4E4E664D4D4D664E4E4E664E4E4E664E4E4E664E4E
          4E66545454663A3A3A6622222266353535665A5A5A6658585866555555663E3E
          3E662A2A2A662626265A00000000000000000000000000000000000000000000
          000000000000000000003030305D323232664D4D4D66656565665E5E5E665E5E
          5E66606060664C4C4C66464646665050506651515166474747664C4C4C664E4E
          4E66424242665151516630303066373737665A5A5A6658585866555555663E3E
          3E662C2C2C662727275A00000000000000000000000000000000000000000000
          000000000000000000003030305D333333664E4E4E66656565665F5F5F665F5F
          5F66606060664B4B4B6653535366666666665B5B5B661E1E1E66555555666666
          6666505050664C4C4C665C5C5C66505050665A5A5A6659595966555555663E3E
          3E662C2C2C662828285A00000000000000000000000000000000000000000000
          000000000000000000003131315D333333664E4E4E6665656566606060666060
          6066616161664B4B4B6652525266666666662323236614141466393939666060
          6066505050664C4C4C665C5C5C665B5B5B66595959665A5A5A66555555663F3F
          3F662D2D2D662828285A00000000000000000000000000000000000000000000
          000000000000000000003232325D343434664E4E4E6665656566616161666161
          6166626262664C4C4C6655555566474747661515156616161666191919664949
          4966505050664C4C4C665C5C5C665A5A5A665A5A5A6659595966555555663F3F
          3F662E2E2E662929295A00000000000000000000000000000000000000000000
          000000000000000000003232325D353535664E4E4E6666666666626262666161
          6166636363664D4D4D664C4C4C66181818662020206640404066161616662A2A
          2A663F3F3F664E4E4E665D5D5D665A5A5A665A5A5A665A5A5A66565656664040
          40662E2E2E662929295A00000000000000000000000000000000000000000000
          000000000000000000003434345F363636665050506666666666626262666262
          626664646466505050661E1E1E66191919665252526666666666282828661A1A
          1A662A2A2A66464646665E5E5E665B5B5B665A5A5A665A5A5A66565656663F3F
          3F662F2F2F662929295800000000000000000000000000000000000000000000
          000000000000000000003434345F363636665050506666666666636363666363
          6366656565664242426619191966262626663E3E3E663B3B3B66393939661C1C
          1C661C1C1C6639393966595959665C5C5C665B5B5B665A5A5A66565656664040
          4066303030662A2A2A5800000000000000000000000000000000000000000000
          000000000000000000003434345F363636665050506666666666646464666363
          6366646464664E4E4E6629292966636363666262626661616166646464664747
          47661C1C1C6624242466424242665B5B5B665B5B5B665A5A5A66565656664040
          4066303030662A2A2A5800000000000000000000000000000000000000000000
          000000000000000000003434345F363636665050506666666666646464666464
          6466646464665F5F5F66616161666262626660606066606060665F5F5F666363
          6366353535662020206628282866434343665C5C5C665B5B5B66575757664141
          4166313131662B2B2B5800000000000000000000000000000000000000000000
          000000000000000000003434345F363636665050506666666666656565666464
          6466646464666363636662626266626262666262626661616166616161666060
          6066626262662C2C2C66222222663B3B3B665E5E5E6659595966585858664343
          4366323232662B2B2B5800000000000000000000000000000000000000000000
          000000000000000000003434345F363636665151516666666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          6666656565665E5E5E66282828663939396656565666505050664D4D4D663939
          3966343434662828285000000000000000000000000000000000000000000000
          000000000000000000002D2D2D533838386640404066545454664F4F4F664C4C
          4C664A4A4A664646466644444466414141663E3E3E663B3B3B66383838663636
          3666343434663535356635353566323232663434346633333366333333663434
          3466343434651414142400000000000000000000000000000000000000000000
          000000000000000000001919192A373737653737376636363666363636663636
          3666373737663737376637373766373737663838386638383866383838663838
          3866383838663838386638383866373737663636366635353565363636653232
          325A1919192A0000000000000000000000000000000000000000000000000000
          00000000000000000000000000011A1A1A2D3131315A343434603131315A2E2E
          2E552C2C2C502828284A26262645232323402020203A1C1C1C341919192F1717
          172A131313241111111F0E0E0E1A0B0B0B140808080F05050509030303050000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000633B0A6FB46812DABD6F11E8AD6310D39B59
          0DBD894E0AA7774309916439077B522E06654124044F2F1A02391D1001230C06
          000F020100020000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000059350A63D47E17FED27D14FFD2790FFFD1780EFFD178
          0EFFD1780FFFD2780FFFD07710FFD07610FFD0750FFFCF740EFFCF730EFFCC71
          0DFDC56B0BF4C56B0AE1B46106CB9F5406B58C4B069F783F0389653402734121
          0149030100040000000000000000000000000000000000000000000000000000
          00000000000000000000AA6715CDD37E16FFD28D38FFD0AD83FFCFA067FFCF98
          54FFD18E42FFD0852DFFD07D1AFFD07509FFD07102FFD07002FFD16F02FFCF6F
          02FFCF6F03FFCF6F03FFD06E04FFCE6E04FFCE6E06FFCE6E06FFCD6D07FFCD6D
          06FFA45805C80E08001100000000000000000000000000000000000000000000
          00000000000000000000BD7419E3D37E14FFD4AC77FFD2DAE4FFCED1D7FFCCD0
          D6FFCCD1D8FFCCD2DAFFCCD1DAFFCCD3DAFFCCCDD0FFCCC5BDFFCDBBA8FFCDB3
          95FFCDAA83FFCDA06EFFCD985BFFCD8F47FFCE8433FFCE7B1DFFCE700AFFCE6B
          01FFCD6D07FF773F039300000000000000000000000000000000000000000000
          00000000000000000000BD761BE3D48015FFD6AB76FFD6DBE0FFD7D7D7FFD7D7
          D7FFD6D6D6FFD7D7D7FFD9D9D9FFD8D8D8FFD7D7D8FFD5D6D8FFD5D7D9FFD3D5
          D9FFD1D4D9FFCED2D7FFCDD2D8FFCCD2D8FFCCD2DAFFCCD4DCFFCCD8E5FFCD90
          4DFFCE6D04FFB26007DE00000000000000000000000000000000000000000000
          00000000000000000000BE761CE3D48217FFD8AE79FFD9DDE2FFD8D8D8FFD8D8
          D8FFDADADAFFC8C8C8FF919191FF919191FF939392FF9C9C9AFF9F9F9EFFA2A2
          A2FFA8A8A8FFCECECEFFD4D4D4FFD1D1D1FFD0D0D0FFD0D0D0FFCCD0D6FFCDA0
          6FFFD06E03FFBC6608E900000000000000000000000000000000000000000000
          00000000000000000000BE781DE3D58419FFDAB17CFFDCE0E5FFDADADAFFDADA
          DAFFDDDDDDFFB9B9B9FFC6C6C6FFFFFFFFFFFFFFFFFF9B9CC0FFD8D7D3FFEAEA
          EAFFBEBEBEFFAEAEAEFFD6D6D6FFD2D2D2FFD1D1D1FFD0D0D0FFCDD2D6FFCEA0
          6DFFCF7005FFBC670BE900000000000000000000000000000000000000000000
          00000000000000000000BE7B1FE3D5861BFFDCB47EFFE0E4E9FFDCDCDCFFDCDC
          DCFFDEDEDEFFBABABAFFC2C2C2FFFFFFFFFFA4A5DBFF00009CFFB5B4B0FFFFFF
          FFFFD2D2D2FFADADADFFD9D9D9FFD4D4D4FFD2D2D2FFD1D1D1FFCDD1D6FFCEA1
          6EFFD17207FFBD6A0DE900000000000000000000000000000000000000000000
          00000000000000000000BF7C21E3D6881DFFDEB681FFE1E5EAFFDEDEDEFFDDDD
          DDFFE0E0E0FFBBBBBBFFC4C4C1FFFDFCFAFF0005ABFF0000ACFF3D44A9FFD7D7
          CBFFD3D3D3FFAEAEAEFFD9D9D9FFD5D5D5FFD4D4D4FFD4D4D4FFCED2D7FFCEA2
          6FFFD07409FFBD6C0EE900000000000000000000000000000000000000000000
          00000000000000000000C48324E9D78A1FFFE0BC89FFE5E8EDFFDFDFDFFFDFDF
          DFFFE2E2E2FFBEBEBDFFD4D2C3FF424DCAFF0000B3FF1623B4FF0000B5FF8C8E
          A9FFC4C4BEFFB1B1B1FFDCDCDCFFD6D6D6FFD5D5D5FFD4D4D4FFCED1D7FFCEA3
          70FFD2760BFFBF6E10E900000000000000000000000000000000000000000000
          00000000000000000000C48325E9D78A1FFFE2BE8BFFE8EBF0FFE1E1E1FFE1E1
          E1FFE4E4E4FFC7C6BCFF646CB2FF0000C0FF434FBBFFEBEDEEFF0002C0FF0D1F
          BEFF9A988DFFB5B5B2FFDDDDDDFFD8D8D8FFD7D7D7FFD5D5D5FFCED1D7FFCFA2
          6CFFD1790EFFB96D11E300000000000000000000000000000000000000000000
          00000000000000000000C58427E9D88C21FFE6C28FFFEBEFF3FFE3E3E3FFE3E3
          E3FFE9E9E6FFA6AACDFF0004C9FF0012BCFFC7C6BEFFE0DFD3FF6773C8FF0006
          CBFF2C3BA3FF9C9A8DFFE3E3E2FFD9D9D9FFD8D8D8FFD8D8D8FFCFD3D8FFCFA3
          6DFFD3790FFFBB6D13E300000000000000000000000000000000000000000000
          00000000000000000000C58628E9D88E23FFE8C592FFEEF2F6FFE5E5E5FFE5E5
          E5FFEAE9E5FFA6AEE0FF0000CEFF999DB1FFB7B6B2FFB0B0AEFFBBB8ABFF1B32
          CEFF000CD5FF69709EFFCFCDC5FFDEDEDDFFD9D9D9FFD9D9D9FFCFD2D8FFCFA4
          6EFFD27B11FFBB6F14E300000000000000000000000000000000000000000000
          00000000000000000000C6872BE9D99025FFEAC794FFF2F5F9FFE7E7E7FFE6E6
          E6FFE9E8E6FFD6D9E5FF939EDDFFF3F1E9FFE8E8E7FFE8E8E8FFEBEBE6FFD4D5
          E1FF0015DAFF0019DBFF8D8F9DFFD5D5CFFFDCDCDCFFDADADAFFD0D4D9FFD0A5
          6FFFD37D13FFBC7216E300000000000000000000000000000000000000000000
          00000000000000000000C68A2DE9D89227FFEDCA97FFF5F8FDFFE9E9E9FFE8E8
          E8FFE8E8E8FFEAEAE8FFF0EFEBFFEBEBEAFFE8E8E8FFE7E7E7FFE7E7E6FFF1EE
          E5FF99A4E4FF0012E5FF0327DFFF92939AFFE3E2E0FFDBDBDBFFD0D3D8FFD0A6
          70FFD57F15FFBD7317E300000000000000000000000000000000000000000000
          00000000000000000000C78C2EE9DA9429FFEECC99FFF9FCFFFFEAEAEAFFEAEA
          EAFFEBEBEBFFEAEAEAFFC4C4C4FFC1C1C1FFC2C2C2FFC4C4C3FFC3C3C2FFC5C5
          C4FFD9D6C7FF5771E9FF0016F2FF6976AEFFE4E3DDFFDCDCDCFFD0D3D8FFD0A7
          71FFD48117FFBD751AE300000000000000000000000000000000000000000000
          00000000000000000000C78E30E9D9962BFFECCC99FFF9FCFFFFECECECFFECEC
          ECFFF0F0F0FFBDBDBDFFAEAEAEFFC9C9C9FFCBCBC8FFB2B2B1FFBEBEBEFFC4C4
          C4FFA7A7A5FFD2CEC0FF234AF7FF6877BDFFE3E2DCFFDDDDDDFFD1D4DAFFD0A7
          72FFD68419FFBE761CE300000000000000000000000000000000000000000000
          00000000000000000000C88F31E9DB992EFFEECE9BFFFBFEFFFFEEEEEEFFEEEE
          EEFFF1F1F1FFBBBBBBFFCFCFCFFFFFFFFFFFDCDCF4FF25289FFFD8D8CBFFFFFF
          FFFFC9C9C9FFBFBEBCFFE5E6E6FFB3BDE7FFE3E2DEFFDEDEDEFFD1D4D9FFD1A8
          73FFD5861BFFBE771CE300000000000000000000000000000000000000000000
          00000000000000000000C89033E9DA992EFFEDCE9BFFFAFDFFFFF0F0F0FFF0F0
          F0FFF3F3F3FFBCBCBCFFCECDCCFFFFFFFFFF2730B7FF0000A7FF8283A9FFF1F1
          EBFFC8C8C8FFBDBDBDFFE7E7E5FFE4E4E1FFDFDFDFFFE0E0E0FFD1D4D9FFD1A9
          74FFD7891EFFBE7A1EE300000000000000000000000000000000000000000000
          00000000000000000000CA9235E9DB9B30FFEDCF9CFFFBFEFFFFF2F2F2FFF2F2
          F2FFF5F5F5FFBEBEBDFFD8D7CFFF999FE1FF0000AFFF0003B2FF030FB2FFBABA
          B2FFC8C8C5FFBDBDBDFFE6E6E6FFE2E2E2FFE0E0E0FFDFDFDFFFD1D4D9FFD1AA
          75FFD6891FFFBF7C21E300000000000000000000000000000000000000000000
          00000000000000000000CB9536EADD9D32FFEFD09DFFFCFFFFFFF4F4F4FFF3F3
          F3FFF8F8F8FFC3C3BFFFBABCC5FF0005BDFF1927B7FF848BD2FF0000BBFF3F4B
          B7FFA4A296FFC4C3C3FFE8E8E8FFE2E2E2FFE1E1E1FFE0E0E0FFD2D5DBFFD2AB
          75FFD88B21FFBD7C22E100000000000000000000000000000000000000000000
          00000000000000000000CF9B39EFDCA035FFEED4A5FFFDFFFFFFF6F6F6FFF5F5
          F5FFFAFAF8FFCACAC0FF0C1EBCFF0004C8FFC6C8DDFFFFFFFFFF2538D1FF0007
          CAFF555D8BFFB3B2ABFFECECEBFFE3E3E3FFE1E1E1FFE2E2E2FFD2D5DAFFD2AB
          72FFD78D23FFBA7A23DD00000000000000000000000000000000000000000000
          00000000000000000000CF9A39EFDEA136FFF0D4A4FFFFFFFFFFF7F7F7FFF7F7
          F7FFFFFFF9FF828DE0FF0002D1FF3C479DFFA09F94FF969591FF898B98FF000D
          CFFF0011CDFF8C8E93FFE2E1DDFFE6E6E6FFE3E3E3FFE1E1E1FFD2D5DAFFD2AC
          73FFD98F25FFBA7D24DD00000000000000000000000000000000000000000000
          00000000000000000000CF9A39EFDDA135FFEFD3A4FFFEFFFFFFF9F9F9FFF8F8
          F8FFFEFDF8FFA9B3EDFF233CD3FFFEFDEDFFF5F5F4FFF4F4F3FFFDFCF2FF939F
          E5FF000CD8FF122CD0FFAAA99FFFE4E4E1FFE3E3E3FFE1E1E1FFD4D7DCFFD3AD
          75FFD89127FFBB7F25DD00000000000000000000000000000000000000000000
          00000000000000000000CF9A39EFDDA135FFEFD3A4FFFFFFFFFFFBFBFBFFFAFA
          FAFFFBFAF8FFE8EAF6FFF0F1F6FFF7F7F5FFF1F1F1FFEFEFEFFFEEEEEDFFFFFD
          ECFF4960E3FF0015E3FF1A38D4FFA8A8A5FFE8E8E7FFE3E3E3FFD6D9DFFFD5B0
          77FFD99329FFBB7F28DD00000000000000000000000000000000000000000000
          00000000000000000000CF9A39EFDDA135FFEFD3A5FFFFFFFFFFFCFCFCFFFAFA
          FAFFF9F9F9FFF9F9F8FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFF2F2F2FFF2F1
          EFFFFBFAEFFF1A3FEBFF0016F1FF7F88B1FFEAEBE9FFDDDFE2FFD7DCE4FFD6B3
          7EFFDB962BFFBD8229DD00000000000000000000000000000000000000000000
          00000000000000000000CF9A39EFDEA136FFF0D6A8FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFF
          FFFFFBFDFFFFEBECEFFF002AFDFF7D83ADFFE9DDC4FFDDCEB4FFDAC8ADFFDAA3
          49FFDA9932FFAB7626C800000000000000000000000000000000000000000000
          00000000000000000000B48632D0DEA43BFFE4B460FFF2DBB2FFEED19FFFECCC
          93FFEBC887FFE9C17BFFE7BB70FFE4B662FFE3AF56FFE1AB4BFFDEA53EFFDC9F
          35FFDD9D2DFFE3A029FFC4934FFFAD865CFFDF9D2AFFDB9A2DFFDB992EFFDB9B
          33FFDC9B34FE543C135B00000000000000000000000000000000000000000000
          00000000000000000000644A1B69DFA43DFEDEA33BFFDEA136FFDEA136FFDEA1
          37FFDEA238FFDEA239FFDEA33AFFDEA33BFFDEA43BFFDEA43DFFDEA43EFFDEA4
          3EFFDDA33DFFDDA43DFFE0A43BFFE1A439FFDCA13AFFDB9E39FED9A039FDC398
          35E3674B1A690000000000000000000000000000000000000000000000000000
          00000000000000000000000000016B4F1D72C59037E2D19939F0C69236E3B989
          33D6AD8030C8A2782CBA976F29AD8B6726A07F5E239273552084684C1D775C44
          196A503B165C4432134E392A0F412D210C3421180826150F05180B09030D0100
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000606060605A5A5A5A5A5A5A5A5A5A5A5A5A5A
          5A5A5A5A5A5A6060606000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000505050C101010281818183D1E1E1E4A202020501F1F1F4F1D1D
          1D481717173B0F0F0F250404040A5A5A5A5A2222226622222266222222662222
          2266222222665A5A5A5A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101021010
          10212323234E28282865272727662A2A2A662E2E2E66303030662F2F2F662D2D
          2D662A2A2A6627272766282828645E5E5E62222222663E3E3E663C3C3C663232
          3266222222665A5A5A5A00000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000090909122121214F2828
          28662E2E2E663838386640404066414141663F3F3F663E3E3E663D3D3D663D3D
          3D663C3C3C663A3A3A663333336660606066222222664D4D4D664A4A4A663A3A
          3A66222222665A5A5A5A00000000000000000000000000000000000000000000
          000000000000000000000000000000000000151515282B2B2B622D2D2D663D3D
          3D66444444664141416641414166444444664747476648484866484848666464
          646662626266626262666161616664646466222222664C4C4C66494949663939
          396622222266606060605A5A5A5A5A5A5A5A5A5A5A5A60606060000000000000
          00000000000000000000000000001B1B1B322C2C2C6535353566464646664444
          4466454545664D4D4D6652525266545454665454546654545466545454666464
          646622222266222222662222226622222266222222664C4C4C66494949663838
          386622222266222222662222226622222266222222665A5A5A5A000000000000
          000000000000000000001717172A2E2E2E653939396648484866464646664C4C
          4C66545454665555556655555566565656665858586658585866585858666464
          646622222266434343663F3F3F663E3E3E66404040664A4A4A66484848664242
          426637373766383838663A3A3A6632323266222222665A5A5A5A000000000000
          0000000000000C0C0C152F2F2F63383838664A4A4A6648484866505050665656
          5666565656665656566657575766565656665656566656565666585858666464
          646622222266545454664E4E4E664D4D4D664B4B4B664A4A4A66484848664848
          486649494966494949664A4A4A663D3D3D66222222665A5A5A5A000000000000
          00000202020529292953333333664B4B4B664A4A4A6650505066565656665656
          5666565656665656566656565666565656665656566655555566555555666464
          6466222222665656566652525266505050664D4D4D664B4B4B664A4A4A664A4A
          4A664C4C4C664C4C4C664C4C4C663E3E3E66222222665A5A5A5A000000000000
          0000161616272F2F2F66474747664B4B4B664E4E4E6657575766565656665656
          5666565656665656566656565666565656665656566656565666565656666464
          646622222266222222662222226622222266222222664E4E4E664B4B4B663F3F
          3F6622222266222222662222226622222266222222665A5A5A5A000000000000
          00012E2E2E55383838664F4F4F664C4C4C665656566657575766575757665757
          5766575757665757576657575766575757665757576657575766565656666565
          65666464646664646466646464666565656622222266515151664E4E4E663A3A
          3A662222226664646466606060665E5E5E625A5A5A5A60606060000000000B0B
          0B1432323265474747664F4F4F66505050665858586658585866585858665858
          5866585858665858586658585866585858665858586658585866585858665757
          57665656566656565666565656666464646622222266525252664E4E4E663C3C
          3C66222222666161616633333366282828640404040A00000000000000001919
          193132323266525252664F4F4F66555555665858586658585866585858665959
          5966595959665959596659595966595959665B5B5B6656565666535353665858
          5866585858665757576656565666646464662222226656565666535353663F3F
          3F6622222266626262663B3B3B66272727660F0F0F2600000000000000002424
          24473A3A3A66555555664F4F4F66595959665A5A5A66595959665A5A5A665A5A
          5A665A5A5A665A5A5A665A5A5A665D5D5D664E4E4E662D2D2D662F2F2F664747
          4766595959665858586657575766646464662222226622222266222222662222
          226622222266616161663E3E3E662A2A2A661818183C00000000000000002C2C
          2C564040406655555566515151665A5A5A66606060665E5E5E665A5A5A665A5A
          5A665B5B5B665B5B5B665C5C5C665C5C5C660C0C0C6613131366101010661313
          1366515151665B5B5B6658585866646464666464646664646466646464666464
          646664646466636363663E3E3E662E2E2E661D1D1D4A00000000000000002F2F
          2F5C4444446657575766525252665C5C5C66606060665E5E5E665D5D5D665B5B
          5B665C5C5C665C5C5C665F5F5F66424242660F0F0F6662626266565656660A0A
          0A663A3A3A66515151665A5A5A66585858665757576656565666585858665A5A
          5A66555555664D4D4D663E3E3E66303030662020205200000000000000003030
          305D4545456659595966525252665C5C5C66606060665F5F5F665E5E5E665D5D
          5D665C5C5C665E5E5E6661616166383838660E0E0E6664646466505050660C0C
          0C66363636664B4B4B664D4D4D665A5A5A665858586656565666575757665B5B
          5B66565656664E4E4E663F3F3F66303030662020205200000000000000002D2D
          2D57444444665B5B5B66525252665D5D5D6661616166606060665F5F5F665E5E
          5E665E5E5E66616161664A4A4A66111111660F0F0F6607070766080808660F0F
          0F660E0E0E66373737664B4B4B664C4C4C665959596657575766575757665A5A
          5A66565656664C4C4C66404040662E2E2E661D1D1D4B00000000000000002727
          27493E3E3E665E5E5E66535353665C5C5C666262626660606066606060666060
          60666262626650505066131313660F0F0F6616161666565656665B5B5B662222
          22660E0E0E660E0E0E66323232664B4B4B664B4B4B6658585866575757665A5A
          5A665656566649494966424242662A2A2A661919193E00000000000000001D1D
          1D34363636666060606656565666595959666262626661616166616161666363
          636656565666161616660F0F0F66101010665C5C5C6661616166606060666262
          6266262626660E0E0E660E0E0E662A2A2A665A5A5A6658585866585858665858
          5866555555664646466641414166272727661010102900000000000000000D0D
          0D1835353565555555665F5F5F66535353666060606662626266636363665B5B
          5B661B1B1B660F0F0F660D0D0D6657575766626262665E5E5E665D5D5D665E5E
          5E66626262662D2D2D660A0A0A660F0F0F665858586658585866585858665858
          5866525252664343436639393966282828650606060D00000000000000000101
          0102313131594444446663636366555555665C5C5C6664646466666666662424
          24660E0E0E660B0B0B665252526663636366606060665E5E5E665E5E5E665D5D
          5D665D5D5D666161616632323266545454665B5B5B6658585866595959665757
          57664A4A4A66454545662E2E2E662323234E0000000000000000000000000000
          00001C1C1C2D343434665E5E5E666363636652525266626262663D3D3D660707
          07660A0A0A664A4A4A666464646662626266606060665F5F5F665E5E5E665D5D
          5D665C5C5C665C5C5C665D5D5D665B5B5B665959596658585866585858665050
          5066464646663E3E3E6628282866101010220000000000000000000000000000
          000002020203313131583F3F3F66666666665F5F5F6656565666646464662828
          28663E3E3E66656565666363636661616166606060665F5F5F665E5E5E665E5E
          5E665C5C5C665B5B5B665A5A5A66595959665858586659595966545454664848
          4866484848662E2E2E6622222250010101020000000000000000000000000000
          0000000000001313131C373737654D4D4D66666666665D5D5D66575757666363
          63666565656664646466626262666262626661616166606060665F5F5F665E5E
          5E665E5E5E665B5B5B665A5A5A665A5A5A665A5A5A66545454664A4A4A664A4A
          4A66363636662B2B2B6309090912000000000000000000000000000000000000
          000000000000000000001F1F1F34333333655252526666666666606060665353
          53665F5F5F666262626662626266626262666262626661616166606060666060
          60665F5F5F665D5D5D665A5A5A665A5A5A66515151664C4C4C664C4C4C663A3A
          3A662C2C2C651515152800000000000000000000000000000000000000000000
          00000000000000000000010101012323233D363636654E4E4E66666666666565
          656656565666545454665C5C5C665F5F5F66606060665F5F5F665F5F5F665E5E
          5E665D5D5D665A5A5A66535353664E4E4E664E4E4E664E4E4E66393939662E2E
          2E651B1B1B320000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000123232334373737653F3F3F665E5E
          5E66666666666161616657575766545454665454546654545466545454665252
          52665151516650505066525252665252526649494966333333662E2E2E631818
          182B000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001313131C313131583434
          3466444444665858586662626266616161665E5E5E665C5C5C665A5A5A665858
          5866575757665656566649494966393939662F2F2F66292929540C0C0C150000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000020202031C1C
          1C2D3232325934343465363636663F3F3F664545456647474766464646664242
          42663A3A3A6632323266323232652E2E2E551616162702020205000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010101020D0D0D181C1C1C34272727492E2E2E572F2F2F5D2F2F2F5C2B2B
          2B5624242448191919310B0B0B14000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000F0F0F0F0E3E3E3E3E3E3E3E3E3E3E3E3E3E3
          E3E3E3E3E3E3F0F0F0F000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000E0E0E20282828653D3D3D994A4A4AB94F4F4FC84D4D4DC74949
          49B63B3B3B942525255E0B0B0B19E3E3E3E3009300FF009300FF009300FF0093
          00FF009300FFE3E3E3E300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101022827
          27535C5959C4696565FD636161FF696A6AFF737373FF777777FF767676FF7171
          71FF686868FF616161FF636363FBECECECF7009300FF35CE5FFF31CA59FF1DB6
          34FF009300FFE3E3E3E300000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001A18182F5B5454C76D65
          65FF777272FF8E8C8CFF9F9FA0FFA0A2A4FF9B9DA0FF979B9FFF95989CFF9699
          9DFF95979AFF919293FF7F8080FFEFEFEFFF009300FF54ED92FF4FE88AFF2EC7
          50FF009300FFE3E3E3E300000000000000000000000000000000000000000000
          0000000000000000000000000000000000003A363666756C6CF77A7070FF9A99
          9AFFA7AAACFF9DA3A7FFA4A4A2FFBFAF9EFFD2B79CFFDBBB9DFFD9BA9CFFFCFB
          F9FFF7F5F4FFF4F4F4FFF2F3F3FFF9F9F9FF009300FF53EC8EFF4CE584FF2BC5
          4BFF009300FFF0F0F0F0E3E3E3E3E3E3E3E3E3E3E3E3F0F0F0F0000000000000
          00000000000000000000000000004D44447E7E6F6FFE8C8484FFACAFB0FFA3A9
          AEFFBBAFA4FFEFC89FFFFFDAA5FFFFDEAAFFFFDFACFFFFDCABFFFFDDABFFFFFB
          F6FF009300FF009300FF009300FF009300FF009300FF53EC8DFF4DE684FF29C2
          47FF009300FF009300FF009300FF009300FF009300FFE3E3E3E3000000000000
          00000000000000000000433A3A6A827272FE968F8FFFB1B4B7FFACAEAFFFE9C5
          9FFFFFDDA9FFFFDFB1FFFFDEB3FFFFE0BAFFFFE3BEFFFFE4C0FFFFE3C1FFFFFC
          F8FF009300FF42DB6DFF39D25FFF37D05AFF3CD564FF50E986FF4CE581FF3FD8
          6AFF27C044FF2AC34AFF2CC54FFF1DB634FF009300FFE3E3E3E3000000000000
          000000000000231E1E36867373F9968B8CFFB5B8BBFFB6B4B2FFFFD1A1FFFFE2
          B2FFFFE1B4FFFFE1B9FFFFE2BAFFFFE0B7FFFFE0B8FFFFE1BAFFFFE4C0FFFFFC
          F9FF009300FF65FEA4FF58F190FF56EF8EFF52EB88FF4FE882FF4CE580FF4CE5
          81FF4DE685FF4CE584FF4EE78AFF33CC5AFF009300FFE3E3E3E3000000000000
          000002020205786565D18F7D7DFFBABCBDFFB8B8B8FFFFD1A1FFFFE3B6FFFFE1
          B5FFFFE0B5FFFFE0B5FFFFE0B5FFFFE0B5FFFFE0B4FFFFDFB4FFFFDFB2FFFFFB
          F6FF009300FF6DFFAFFF61FA9CFF5EF798FF57F08FFF52EB86FF4FE882FF50E9
          86FF53EC8CFF53EC8DFF53EC91FF36CF5FFF009300FFE3E3E3E3000000000000
          0000413636638D7474FFB3B1B1FFB7BBC2FFF4CBA2FFFFE4B8FFFFE1B8FFFFE2
          B7FFFFE2B8FFFFE2B8FFFFE2B8FFFFE2B7FFFFE2B7FFFFE1B6FFFFE1B5FFFFFC
          F7FF009300FF009300FF009300FF009300FF009300FF58F190FF52EB88FF39D2
          5FFF009300FF009300FF009300FF009300FF009300FFE3E3E3E3000000000000
          0001887272D59C8C8CFFC1C6C9FFD7C3B1FFFFE2B1FFFFE5B9FFFFE3B9FFFFE4
          BAFFFFE4BAFFFFE4BAFFFFE4BAFFFFE4BAFFFFE4BAFFFFE3B9FFFFE2B8FFFFFD
          FBFFFFFCF7FFFFFCF7FFFFFBF7FFFFFDFBFF009300FF60F99BFF58F18FFF2FC8
          4DFF009300FFF9F9F9FFEFEFEFFFECECECF7E3E3E3E3F0F0F0F000000000231D
          1D34967A7AFEB6B1B2FFC0C6CBFFFED2A4FFFFE7BDFFFFE5BBFFFFE5BCFFFFE6
          BDFFFFE6BDFFFFE6BDFFFFE6BDFFFFE6BDFFFFE7BCFFFFE7BEFFFFE7BCFFFFE4
          BAFFFFE2B8FFFFE1B6FFFFE0B5FFFFFBF7FF009300FF62FB9EFF59F292FF33CD
          53FF009300FFF3F3F4FF808181FF636363FB0B0B0B1900000000000000004B3E
          3E7C967979FFCACED0FFD3C9BDFFFFE1B0FFFFE7BCFFFFE7BEFFFFE7BFFFFFE8
          BFFFFFE8C0FFFFE9C0FFFFE9C0FFFFE9C1FFFFEFC5FFF9E2B8FFF1D9B4FFFFE7
          BEFFFFE7BCFFFFE3B9FFFFE2B7FFFFFCF7FF009300FF6CFFAEFF64FDA3FF39D2
          5DFF009300FFF6F5F4FF939496FF616161FF2626266000000000000000006F5A
          5AB3A48E8EFFCDD4D7FFE9CBAFFFFFE9BEFFFFEBC5FFFFE9C0FFFFEAC1FFFFEA
          C2FFFFEBC3FFFFEBC3FFFFEBC3FFFFF3CBFFDCCBA8FF7B7563FF847968FFCCBB
          99FFFFE8BEFFFFE7BCFFFFE3B9FFFFFCF7FF009300FF009300FF009300FF0093
          00FF009300FFF8F4F1FF979A9DFF686868FF3C3C3C970000000000000000866B
          6BD8B19F9FFFCFD5DAFFF4D2ABFFFFEBC2FFFFF5E2FFFFF1D5FFFFECC4FFFFEC
          C5FFFFEDC6FFFFEDC6FFFFF0C9FFFFF2CAFF1D1F21FF2E2F33FF26292CFF3030
          30FFE8D4AFFFFFEEC3FFFFE6BCFFFFFCF8FFFFFBF5FFFFFCF7FFFFFCF9FFFFFC
          F9FFFFFBF6FFFDF9F5FF96999EFF727272FF494949BA00000000000000009274
          74E8B8A9A9FFD3D9DEFFFBD6AAFFFFEFCAFFFFF6E1FFFFF2D9FFFFF0D0FFFFEE
          C8FFFFEFC8FFFFEFC9FFFFF8D1FFB5AB92FF25252AFFF6F6F6FFD6D6D6FF181A
          1EFFA4967EFFE7D3AEFFFFECC1FFFFE4BCFFFFE3B8FFFFE1B6FFFFE4C1FFFFE8
          CAFFFFE0B1FFF3C9A0FF969B9FFF777777FF515151CD00000000000000009574
          74E9BCABABFFD7DDE3FFFCD6AAFFFFF1CDFFFFF6E2FFFFF4DBFFFFF3D6FFFFF1
          CFFFFFF1CBFFFFF4CFFFFFFFD8FF9A937EFF212325FFFBFBFBFFC9C9C9FF1C1D
          1FFF968D77FFD8C3A2FFDECAA6FFFFEBC1FFFFE5BBFFFFE2B7FFFFE3BCFFFFEA
          CBFFFFE1B3FFF5CCA1FF989DA2FF787878FF505050CE00000000000000008E6F
          6FDBBBA8A8FFDCE3E8FFF9D5ADFFFFF2CEFFFFF7E6FFFFF5DEFFFFF5DAFFFFF4
          D7FFFFF5D1FFFFFED8FFCAC2A6FF2A2B2BFF252627FF0F1115FF111216FF2526
          28FF212327FF9B8F7AFFD6C4A2FFDAC7A3FFFFE9C0FFFFE4B8FFFFE3BBFFFFEA
          CAFFFFE1B2FFEEC69EFF9CA0A5FF747474FF494949BD00000000000000007A60
          60B8B39898FFE2EAEEFFF5D5B5FFFFF2CAFFFFF9E9FFFFF7E1FFFFF7DDFFFFF7
          DBFFFFFFE0FFD9D1B2FF303030FF252629FF373636FFECE2C0FFFAEEC8FF5A57
          50FF212427FF202225FF8B816FFFD7C4A1FFD9C3A0FFFFE7BBFFFFE3BBFFFFE8
          C7FFFFE2B1FFDABC9DFFA0A3A8FF6A6969FF3E3E3E9B00000000000000005946
          4683A88383FFE7F0F2FFEEDCCBFFFFE9BCFFFFFAE8FFFFF8E5FFFFF9E2FFFFFF
          E8FFE5DFC5FF393938FF252629FF29282BFFFAF1CDFFFFFFD9FFFFFBD4FFFFFF
          DCFF67635AFF202126FF1F2126FF756D5FFFFFEEC2FFFFE6BAFFFFE4BDFFFFE6
          C1FFFFE1ADFFC1B1A1FFA0A3A6FF636161FF2929296800000000000000002821
          213EA68080FED9D4D5FFEAEEF1FFFFDCA9FFFFF8DBFFFFFAEAFFFFFFEAFFEEEA
          D4FF464543FF252628FF1F2123FFE8E3C5FFFFFFDCFFFFF6D2FFFFF3CEFFFFF6
          CEFFFFFFDCFF7A7466FF16191FFF252629FFFFE7BEFFFFE7BBFFFFE6C1FFFFE5
          BAFFFFD7A4FFA5A8ACFF918F90FF686565FD100E0E2100000000000000000201
          0102977979DFC0A7A7FFF2F8FDFFF9DBBDFFFFF2C8FFFFFEEEFFFFFFFDFF5D5D
          58FF242426FF1B1C1EFFD6D4BDFFFFFFE7FFFFF9D7FFFFF6D2FFFFF4CFFFFFF2
          CCFFFFF4CCFFFFFFD8FF8A8272FFF0DDB7FFFFEFC4FFFFE5BBFFFFE7C0FFFFE5
          B4FFD8BDA2FFA9ADB1FF777373FF5B5858C50000000000000000000000000000
          000057444471A97F7FFFEAEAEBFFF5F7FAFFFFD9A8FFFFFFE0FF9B9B96FF1112
          15FF17181BFFC0BFAFFFFFFFF2FFFFFDE1FFFFF9DAFFFFF7D5FFFFF4D1FFFFF2
          CDFFFFF0CAFFFFF1CAFFFFF4CBFFFFEEC5FFFFE8BEFFFFE5BDFFFFE6BCFFFFD3
          A2FFACAEB2FF9D9C9DFF6C6565FF2A2727550000000000000000000000000000
          0000070606099D7878DDB99A9AFFFBFFFFFFFAEFE5FFFFE3B2FFFFFFEEFF6566
          63FF9D9D94FFFFFFFAFFFFFFE7FFFFFBE1FFFFF9DDFFFFF7D9FFFFF5D5FFFFF3
          D1FFFFF0CAFFFFEDC7FFFFEBC4FFFFE9C1FFFFE7BEFFFFE8BEFFFFDCAAFFBFB6
          ACFFB0B4B6FF7A7171FF5B5656C9010101020000000000000000000000000000
          0000000000003C2F2F47B18686FDD2BFBFFFFFFFFFFFFFECDCFFFFE6B4FFFFFF
          E8FFFFFFF7FFFFFFEEFFFFFDE8FFFFFBE4FFFFF9E0FFFFF8DDFFFFF6D9FFFFF4
          D6FFFFF2D3FFFFEEC8FFFFEBC3FFFFEAC2FFFFEBC1FFFFDDABFFCBBCAEFFB4B9
          BDFF8F8686FF766C6CF81A18182F000000000000000000000000000000000000
          00000000000000000000634A4A83A87D7DFEDBCDCDFFFFFFFFFFFEF1E7FFFFDA
          AAFFFFF8D1FFFFFCE1FFFFFCE9FFFFFBE9FFFFF9E6FFFFF9E2FFFFF6DFFFFFF6
          DCFFFFF5DCFFFFF1D1FFFFECC5FFFFEBBFFFFFD4A5FFCABFB5FFBABFC3FF9992
          92FF7E6E6EFE3A36366600000000000000000000000000000000000000000000
          00000000000000000000010101016858589AA88383FED3C0C1FFFFFFFFFFFBFD
          FEFFFCDCBDFFFFDFAEFFFFF3C9FFFFF8D4FFFFF8D9FFFFF7D8FFFFF6D6FFFFF4
          D2FFFFF2CCFFFFEBBFFFFFDCA9FFE8C9ABFFC1C2C5FFBFC3C6FF988E8FFF8271
          71FE4D44447F0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000100000163565682B18686FDBA9B9BFFEFEC
          EEFFF8FFFFFFF2F3F6FFF5DDC8FFF9D8B5FFFDDAAFFFFFDCACFFFFDCABFFFDD8
          ABFFF3D1AEFFE1CBB6FFCACCCEFFC6CDD1FFB8B7B8FF907E7EFF857272F9443C
          3C6C000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000003C2F2F479D7878DDA87F
          7FFFC1A7A7FFDFDBDBFFF0F6F9FFEBF2F6FFE4EBF0FFDEE5EAFFDAE0E6FFD6DD
          E2FFD3DADEFFD0D7DAFFBCB7B8FF9E8C8CFF8C7373FF786565D2231E1E360000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000070606095944
          44719F7979DFA77F7FFEA98383FFB69B9BFFBFABABFFC0B1B1FFBDAEAEFFB5A2
          A2FFA69090FF967979FF967A7AFE887272D54237376302020205000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010101022B21213D584646837B5F5FB88E6F6FDA947373E9917373E8866A
          6AD8705959B44C3E3E7C231D1D34000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000565656565050505050505050505050505050
          5050505050505656565600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000020202120606063D0404045D0101014D000000040000
          0000000000000000000000000000505050502222226622222266222222662222
          2266222222665050505000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000040F0F0F5D0F0F0F660C0C0C663A3A3A660A0A0A300000
          000000000000000000000000000050505050222222663E3E3E663C3C3C663232
          3266222222665050505000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D0000000A0000
          0000000000000404041118181866151515662A2A2A662C2C2C661E1E1E500000
          000000000000000000000000000050505050222222664D4D4D664A4A4A663A3A
          3A66222222665050505000000000000000000000000000000000000000000000
          00000000000000000000000000000303031B09090950060606650A0A0A600000
          0010000000010D0D0D1D2424246622222266363636663A3A3A663838385B5656
          565650505050505050505050505056565656222222664C4C4C66494949663939
          3966222222665D5D5D5D50505050505050505050505056565656000000000000
          0000000000000000000000000000111111581212126613131366424242662323
          2354313131593737376537373766343434663030306633333366373737645A5A
          5A5A22222266222222662222226622222266222222664C4C4C66494949663838
          3866222222662222226622222266222222662222226650505050000000000000
          00000000000000000000000000011A1A1A6022222266313131663A3A3A663F3F
          3F66484848664A4A4A664D4D4D664D4D4D664545456638383866303030665E5E
          5E6522222266434343663F3F3F663E3E3E66404040664A4A4A66484848664242
          426637373766383838663A3A3A66323232662222226650505050000000000000
          000000000000000000000606060C323232653D3D3D6647474766515151665757
          57664C4C4C66454545664040406644444466515151665C5C5C66555555666262
          626622222266545454664E4E4E664D4D4D664B4B4B664A4A4A66484848664848
          486649494966494949664A4A4A663D3D3D662222226650505050000000000000
          00000000000000000000141414204242426652525266505050663E3E3E662F2F
          2F65222222481515152C111111221616162B21212162303030663C3C3C666363
          6366222222665656566652525266505050664D4D4D664B4B4B664A4A4A664A4A
          4A664C4C4C664C4C4C664C4C4C663E3E3E662222226650505050000000000000
          00000000000000000000171717244C4C4C665252526637373766303030663131
          31651313132804040408000000000202020B111111650A0A0A66353535665D5D
          5D6422222266222222662222226622222266222222664E4E4E664B4B4B663F3F
          3F66222222662222226622222266222222662222226650505050000000000000
          0000000000000000000004040405353535584E4E4E66575757664B4B4B664040
          40663636366630303064292929501D1D1D3C22222266202020663C3C3C665F5F
          5F64585858585A5A5A5B5C5C5C606161616522222266515151664E4E4E663A3A
          3A66222222665656565650505050505050505050505056565656000000000000
          0000000000000000000000000000040404072424243F363636653B3B3B663434
          3466393939664141416639393966323232663232326631313166333333663737
          37630606060C00000000000000005959595922222266525252664E4E4E663C3C
          3C66222222665050505000000000000000000000000000000000000000000000
          00000000000000000000000000000B0B0B123333335E41414164494949644E4E
          4E644E4E4E6450505065464646663C3C3C663A3A3A6636363666323232662F2F
          2F662D2D2D65282828561B1B1B3A5959595C2222226656565666535353663F3F
          3F66222222665050505000000000000000000000000000000000000000000000
          00000000000000000000010101032F2F2F54474747604E4E4E5F4D4D4D604E4E
          4E624E4E4E644F4F4F644949496439393965404040653F3F3F663E3E3E663B3B
          3B6636363665323232652E2E2E655E5E5E662222226622222266222222662222
          2266222222665050505000000000000000000000000000000000000000000000
          000000000000000000000E0E0E173E3E3E644F4F4F5E4D4D4D5E4D4D4D5E4D4D
          4D5E4D4D4D5F4E4E4E604A4A4A63373737654141416440404064414141654444
          446642424266414141653E3E3E65626262665F5F5F665E5E5E66616161665D5D
          5D63595959595656565600000000000000000000000000000000000000000000
          0000000000000000000018181827424242624F4F4F5E4E4E4E5E4E4E4E5E4D4D
          4D5E4D4D4D5E4E4E4E5E4949495F353535634141416242424264464646654747
          4766474747664747476646464666454545664444446630303066303030650B0B
          0B17000000000000000000000000000000000000000000000000000000000000
          0000000000000000000020202033454545615050505E4F4F4F5E4F4F4F5E4F4F
          4F5E4F4F4F5E4F4F4F5E4B4B4B5F333333624141416045454565484848664848
          48664848486647474766474747664848486648484866373737662929295E0101
          0102000000000000000000000000000000000000000000000000000000000000
          000000000000000000002828283F494949605050505E5050505E5050505E5050
          505E5050505E5050505E4C4C4C5F323232624141416047474765484848664848
          486648484866484848664848486648484866494949663C3C3C662424244E0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000002F2F2F4B4D4D4D5F5151515E5151515E5151515E5151
          515E5252525E5252525E4E4E4E5F323232634141416048484866494949664949
          49664949496649494966494949664949496649494966414141662222224A0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000363636575151515E5353535E5353535E5353535E5454
          545E5454545E5555555E444444602D2D2D64424242604A4A4A664A4A4A664A4A
          4A664A4A4A664A4A4A664A4A4A664A4A4A664A4A4A6646464666272727530000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000010101023B3B3B615656565E5454545E5555555E4D4D4D5F4343
          4361434343633F3F3F633F3F3F60434343603A3A3A643A3A3A66494949664B4B
          4B664B4B4B664A4A4A664A4A4A664A4A4A664A4A4A664B4B4B662B2B2B5E0000
          0001000000000000000000000000000000000000000000000000000000000000
          00000000000006060609404040645B5B5B60545454604848485D474747594646
          46543E3E3E503838384D3838384D3737374E404040545A5A5A664A4A4A664141
          4166424242664B4B4B664B4B4B664B4B4B664B4B4B664D4D4D66303030650303
          0306000000000000000000000000000000000000000000000000000000000000
          000000000000030303052F2F2F483D3D3D634B4B4B644E4E4E5C464646543838
          384D3838384D3838384D3737374D3838384D3A3A3A525B5B5B665D5D5D666161
          61665C5C5C664E4E4E6647474766494949664C4C4C664E4E4E66343434660909
          0913000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000707070A1D1D1D2F34343456424242654F4F
          4F624E4E4E593F3F3F503838384D3838384D3A3A3A525F5F5F665D5D5D665E5E
          5E665F5F5F6660606066636363665D5D5D6655555566505050663A3A3A662020
          203F000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000010F0F0F172626
          263E3737376048484865515151604C4C4C563E3E3E5562626266606060666262
          626664646466656565665F5F5F66585858665050506648484866343434663232
          32652121213F0101010300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000003030304161616252C2C2C4C3C3C3C654D4D4D65555555664C4C4C664444
          44663C3C3C66323232622B2B2B55232323461C1C1C392A2A2A60484848664B4B
          4B66393939661E1E1E3900000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000808080D1E1E1E34373737644A4A4A663B3B
          3B662121214A010101030000000000000000000000000A0A0A142B2B2B615757
          57664B4B4B663333336505050508000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000029292940525252664B4B
          4B66303030651B1B1B3C1C1C1C3B21212147272727542D2D2D60333333655151
          51664E4E4E66353535650707070C000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000707070A3A3A3A5F5C5C
          5C6645454566373737663D3D3D66454545664C4C4C6652525266545454665454
          5466454545662B2B2B4F00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001414141D3F3F
          3F63595959665B5B5B665A5A5A6657575766515151664C4C4C66464646663E3E
          3E662C2C2C520707070C00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001010
          10192E2E2E4F3939395E31313153292929492323233F1C1C1C34171717290E0E
          0E19010101030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000D8D8D8D8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8D8D8D8D800000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000404042E0E0E0E9A0B0B0BEA030303C20000000A0000
          0000000000000000000000000000C8C8C8C8009300FF009300FF009300FF0093
          00FF009300FFC8C8C8C800000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000101010A252525EA262626FF1E1E1EFF929292FF1919197A0000
          0000000000000000000000000000C8C8C8C8009300FF35CE5FFF31CA59FF1DB6
          34FF009300FFC8C8C8C800000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000010101220101011B0000
          0000000000000909092B3C3C3CFF353535FF696969FF6E6E6EFF4C4C4CC90000
          0000000000000000000000000000C8C8C8C8009300FF54ED92FF4FE88AFF2EC7
          50FF009300FFC8C8C8C800000000000000000000000000000000000000000000
          000000000000000000000000000008080844161616CA0F0F0FFD1A1A1AF20101
          012A000000012222224A595959FF565656FF868686FF929292FF8C8C8CE5D8D8
          D8D8C8C8C8C8C8C8C8C8C8C8C8C8D8D8D8D8009300FF53EC8EFF4CE584FF2BC5
          4BFF009300FFE9E9E9E9C8C8C8C8C8C8C8C8C8C8C8C8D8D8D8D8000000000000
          00000000000000000000000000002C2C2CDE2E2E2EFF303030FFA4A4A4FF5757
          57D47A7A7ADF8B8B8BFE8A8A8AFF828282FF787878FF7F7F7FFF8B8B8BFCE0E0
          E0E1009300FF009300FF009300FF009300FF009300FF53EC8DFF4DE684FF29C2
          47FF009300FF009300FF009300FF009300FF009300FFC8C8C8C8000000000000
          0000000000000000000000000001424242F2555555FF7A7A7AFF919191FF9E9E
          9EFFB3B3B3FFB8B8B8FFC1C1C1FFC1C1C1FFADADADFF8D8D8DFF797979FFECEC
          ECFD009300FF42DB6DFF39D25FFF37D05AFF3CD564FF50E986FF4CE581FF3FD8
          6AFF27C044FF2AC34AFF2CC54FFF1DB634FF009300FFC8C8C8C8000000000000
          000000000000000000000E0E0E1E7C7C7CFD999999FFB1B1B1FFCACACAFFD9D9
          D9FFBFBFBFFFACACACFFA0A0A0FFABABABFFCBCBCBFFE7E7E7FFD4D4D4FFF4F4
          F4FF009300FF65FEA4FF58F190FF56EF8EFF52EB88FF4FE882FF4CE580FF4CE5
          81FF4DE685FF4CE584FF4EE78AFF33CC5AFF009300FFC8C8C8C8000000000000
          0000000000000000000033333352A6A6A6FFCCCCCCFFC8C8C8FF9C9C9CFF7777
          77FE565656B6363636702C2C2C563737376C545454F6787878FF969696FFF7F7
          F7FF009300FF6DFFAFFF61FA9CFF5EF798FF57F08FFF52EB86FF4FE882FF50E9
          86FF53EC8CFF53EC8DFF53EC91FF36CF5FFF009300FFC8C8C8C8000000000000
          000000000000000000003939395BBDBDBDFFCECECEFF8A8A8AFF777777FF7B7B
          7BFE303131650B0B0B14000000000404041C2C2D2DFE181818FF858585FFEAEA
          EAFC009300FF009300FF009300FF009300FF009300FF58F190FF52EB88FF39D2
          5FFF009300FF009300FF009300FF009300FF009300FFC8C8C8C8000000000000
          000000000000000000000909090D858585DCC2C3C3FFD9DBDBFFB9BCBCFFA0A2
          A2FF908585FF8D7676FB7F6565C95A474798545454FF4C5050FF959797FFF0F0
          F0FCDEDEDEDEE1E1E1E5E8E8E8F1F2F2F2FD009300FF60F99BFF58F18FFF2FC8
          4DFF009300FFD8D8D8D8C8C8C8C8C8C8C8C8C8C8C8C8D8D8D8D8000000000000
          00000000000000000000000000000A0B0B125E5A5A9EA08484FEBA8F8FFFB17C
          7CFFBE8A8AFFCF9D9DFFBB8989FFAD7878FFAD7676FFA47575FF9E7D7DFF9988
          88F8160F0F200000000000000000DFDFDFDF009300FF62FB9EFF59F292FF33CD
          53FF009300FFC8C8C8C800000000000000000000000000000000000000000000
          0000000000000000000000000000251B1B2FAE7A7AECD29F9FFCE2B3B3FCEDC0
          C0FBECC2C2FCEEC4C4FED6AAAAFFC19191FFBE8C8CFFB48282FFAC7777FFA46F
          6FFFA06C6CFD8E6060D761414193E4E2E2E8009300FF6CFFAEFF64FDA3FF39D2
          5DFF009300FFC8C8C8C800000000000000000000000000000000000000000000
          00000000000000000000020101039C7373D4DAAFAFF2E8BEBEEEE8BEBEF2E9BF
          BFF7EBBFBFFAEBC0C0FADEB3B3FBBB8A8AFDCB9B9BFECA9999FFC79797FFC18F
          8FFFB48282FEAA7777FDA36F6FFDF2ECECFF009300FF009300FF009300FF0093
          00FF009300FFC8C8C8C800000000000000000000000000000000000000000000
          000000000000000000003023233BC59696FAE9C2C2EDE4BFBFEDE4BEBEEDE4BF
          BFEDE6BDBDEEE8C1C1F2DEB6B6F8B88484FDD29F9FFBCE9D9DFBCF9F9FFDD5A4
          A4FFD2A1A1FFCE9E9EFDC89797FDF9F4F4FFF5EEEEFFF2ECECFFF2F2F2FFE9E9
          E9F8DFDFDFDFD8D8D8D800000000000000000000000000000000000000000000
          000000000000000000004F3B3B62CEA2A2F7E7C3C3ECE5C0C0ECE6C0C0ECE5BF
          BFEDE6BFBFEDE5C0C0EDDBB5B5EFB37E7EF8CF9E9EF5D2A0A0FBDDABABFEDFAD
          ADFFDEADADFFDDACACFFDBAAAAFFD9A8A8FFD7A6A6FFA97373FF827777FE1B1C
          1C3B000000000000000000000000000000000000000000000000000000000000
          00000000000000000000694C4C80D3A9A9F4E6C4C4ECE5C1C1ECE5C1C1ECE4C2
          C2ECE4C2C2ECE5C4C4ECDBB8B8EFAE7D7DF7CE9F9FF1D8A8A8FDE0AFAFFFDEAE
          AEFFDEAEAEFFDEADADFFDFADADFFDEAEAEFFE0B0B0FFB88585FF7A6666EC0101
          0102000000000000000000000000000000000000000000000000000000000000
          00000000000000000000815F5F9ED9B3B3F2E6C5C5ECE5C5C5ECE5C5C5ECE5C5
          C5ECE4C5C5ECE5C6C6ECDBBABAEEAC7A7AF7CF9E9EF2DBACACFEE0B0B0FFE0B0
          B0FFDFAFAFFFDFAFAFFFDFAFAFFFDEAFAFFFE1B2B2FFC29292FF745757C30000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000009C7171BCDEBEBEEFE5C9C9EBE4C8C8EBE4C9C9EBE4C9
          C9EBE4CBCBEBE6CCCCECDDC0C0EEA97878F8D19F9FF2DEAEAEFFE3B2B2FFE1B2
          B2FFE1B1B1FFE0B1B1FFE0B1B1FFDFB1B1FFE0B2B2FFCD9D9DFF775252BA0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000B28383DAE4CBCBEDE5CDCDEBE5CECEEBE5CECEEBE6CF
          CFEBE7D1D1EBE9D3D3EBC8A8A8F2A16C6CFAD4A2A2F2E2B4B4FFE4B5B5FFE2B4
          B4FFE2B3B3FFE2B3B3FFE1B3B3FFE1B3B3FFE1B4B4FFD9ABABFF885C5CD00000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000002010102BD9090F4E8D5D5EBE5D0D0EBE6D2D2EBD8BDBDEEC4A6
          A6F3C3A4A4F8BB9C9CF9BA9A9AF0BEA4A4F0B68E8EFCBF8C8CFFE1B2B2FFE5B6
          B6FFE4B6B6FFE3B5B5FFE3B5B5FFE2B5B5FFE3B5B5FFE3B6B6FF9B6868EC0000
          0001000000000000000000000000000000000000000000000000000000000000
          000000000000140F0F18CC9B9BFCECE4E4F2E1D2D2F1CBB2B2E9C9B0B0DFCAAF
          AFD4BB9797C9B18787C2B18888C2AE8787C3BF9D9DD3F3E0E0FFD0B6B6FFC59E
          9EFFD1A0A0FFE6B7B7FFE5B7B7FFE3B7B7FFE3B7B7FFE8BDBDFFA67171FD0B08
          0811000000000000000000000000000000000000000000000000000000000000
          0000000000000D09090E987272B4C69494F9DABABAFBDAC4C4E8C8ADADD2B188
          88C2B08787C2B08989C2AF8787C2B08787C2B58C8CCDFCE1E1FFFFE7E7FFFFF1
          F1FFF2E4E4FFD9C2C2FFD3ADADFFE0B1B1FFE4B9B9FFE9BDBDFFB07E7EFF2216
          1631000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001711111A63484877AE7E7ED7CCA2A2FEDAC4
          C4F6D8C3C3E0BE9C9CCAB08888C2B08888C2B78D8DCFFDEBEBFFFFE7E7FFFFE9
          E9FFFFEBEBFFFFEFEFFFFFF8F8FFF3E8E8FFE9D3D3FFE8C4C4FFBC8C8CFF5E4E
          4E9E000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000013224243A7D5B
          5B9BB58484F0D1B1B1FEDCC9C9F0D4BDBDD9BE9898D5FFF3F3FFFFEFEFFFFFF4
          F4FFFFFAFAFFFFFDFDFFF8EDEDFFEADBDBFFDCC6C6FFCDB0B0FFB07C7CFF927B
          7BFE5455559F0101010300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000907070B4B36365E956A6ABFC09191FDDAC0C0FEE6D2D2FFD8BABAFFCBA5
          A5FFBE9090FFAB7A7AF7966868D57C5454AF6343438F7C6868F0C0B4B4FFBDBC
          BCFF8E8E8EFF4C4C4C8F00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001C14142265474782A78686FACDB6B6FFA192
          92FF555252BA02010103000000000000000000000000191919346C6D6DF3DADA
          DAFFBCBCBCFF818181FD0D0D0D16000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000666868A0CCCDCDFFBCBD
          BDFF797A7AFD4144449746464695545454B3626262D3707070F1808080FECACA
          CAFFC2C2C2FF868686FE1111111E000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001212121B939393EEE6E6
          E6FFADADADFF8A8A8AFF999999FFACACACFFBEBEBEFFCCCCCCFFD3D3D3FFD1D1
          D1FFADADADFF6B6B6BC600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000003434344A9E9E
          9EF9DFDFDFFFE4E4E4FFE2E2E2FFDADADAFFCBCBCBFFBEBEBEFFAFAFAFFF9C9C
          9CFF6E6E6ECF1111111E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002828
          283F757575C78E8E8EEB7A7A7AD0676767B75959599F48484884393939672222
          223F010101030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000005A5A5A5A2222226622222266222222662222
          2266222222665A5A5A5A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000005A5A5A5A222222663E3E3E663C3C3C663232
          3266222222665A5A5A5A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000005A5A5A5A222222664D4D4D664A4A4A663A3A
          3A66222222665A5A5A5A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005C5C
          5C5C5A5A5A5A5A5A5A5A5A5A5A5A5C5C5C5C222222664C4C4C66494949663939
          396622222266606060605A5A5A5A5A5A5A5A5A5A5A5A60606060000000000000
          0000000000000000000000000001000000030000000500000002000000020000
          0002000000020000000200000002000000020000000200000002000000025B5B
          5B5B22222266222222662222226622222266222222664C4C4C66494949663838
          386622222266222222662222226622222266222222665A5A5A5A000000000000
          0000000000000101010300000003000000050000000700000008000000090000
          0009000000090000000900000009000000090000000900000009000000095B5B
          5B5C22222266434343663F3F3F663E3E3E66404040664A4A4A66484848664242
          426637373766383838663A3A3A6632323266222222665A5A5A5A000000000000
          0000010101040101010A0D0D0D331E1E1E502B2B2B622D2D2D662D2D2D662D2D
          2D662D2D2D662D2D2D662D2D2D662D2D2D662D2D2D662D2D2D662D2D2D666060
          606622222266545454664E4E4E664D4D4D664B4B4B664A4A4A66484848664848
          486649494966494949664A4A4A663D3D3D66222222665A5A5A5A000000000101
          01030707071F2828285D40404066535353665D5D5D665E5E5E665E5E5E665E5E
          5E665E5E5E665E5E5E665E5E5E665E5E5E665E5E5E665E5E5E665E5E5E666565
          6566222222665656566652525266505050664D4D4D664B4B4B664A4A4A664A4A
          4A664C4C4C664C4C4C664C4C4C663E3E3E66222222665B5B5B5B000000010C0C
          0C1E30303064545454665E5E5E665C5C5C665B5B5B665A5A5A665A5A5A665A5A
          5A665A5A5A665A5A5A665A5A5A665A5A5A665A5A5A665A5A5A665A5A5A666464
          646622222266222222662222226622222266222222664E4E4E664B4B4B663F3F
          3F6622222266222222662222226622222266222222665A5A5A5B040404072828
          285C545454665E5E5E665B5B5B66595959665858586658585866575757665757
          5766575757665757576657575766575757665757576657575766575757666262
          62666363636661616166626262666464646622222266515151664E4E4E663A3A
          3A66222222666565656665656566646464665E5E5E644646464A1717172F4040
          40665F5F5F665C5C5C6659595966585858665656566656565666565656665656
          5666565656665656566656565666565656665656566656565666565656665656
          56665656566656565666565656666363636622222266525252664E4E4E663C3C
          3C6622222266646464665C5C5C665F5F5F663F3F3F660C0C0C322323234D5353
          53665D5D5D665A5A5A6658585866565656665656566655555566555555665555
          5566555555665555556655555566555555665555556655555566555555665555
          5566555555665555556655555566636363662222226656565666535353663F3F
          3F6622222266646464665A5A5A665D5D5D66525252661C1C1C4D2A2A2A5F5C5C
          5C665D5D5D665A5A5A6658585866565656665656566656565666565656665656
          5666565656665656566656565666565656665656566656565666565656665656
          5666565656665656566656565666626262662222226622222266222222662222
          226622222266646464665A5A5A665D5D5D665B5B5B662828285D2B2B2B605D5D
          5D665D5D5D665A5A5A6658585866575757665656566656565666565656665656
          5666565656665656566656565666565656665656566656565666565656665656
          5666565656665656566656565666616161666464646664646466646464666464
          646664646466656565665A5A5A665D5D5D665C5C5C662929295E242424505656
          56665E5E5E665C5C5C665A5A5A66585858665858586657575766575757665757
          5766575757665757576657575766575757665757576657575766575757665757
          5766575757665757576657575766575757665757576657575766575757665858
          5866585858665A5A5A665C5C5C665E5E5E66545454661F1F1F501A1A1A344444
          4466606060665D5D5D665B5B5B665A5A5A665959596658585866585858665858
          5866585858665858586658585866585858665858586658585866585858665858
          5866585858665858586658585866585858665858586658585866585858665959
          59665A5A5A665B5B5B665D5D5D666060606643434366161616340505050A2D2D
          2D61595959665F5F5F665D5D5D665C5C5C665A5A5A665A5A5A66595959665959
          5966595959665959596659595966595959665959596659595966595959665959
          59665959596659595966595959665959596659595966595959665A5A5A665A5A
          5A665C5C5C665D5D5D665F5F5F66585858662C2C2C600505050A000000001313
          1324343434665A5A5A66606060665E5E5E665C5C5C665B5B5B665A5A5A665A5A
          5A665A5A5A665959596659595966595959665959596659595966595959665959
          59665959596659595966595959665A5A5A665A5A5A665A5A5A665B5B5B665C5C
          5C665E5E5E665F5F5F6659595966333333651212122300000000000000000000
          0000151515282F2F2F63484848665B5B5B665E5E5E665D5D5D665C5C5C665B5B
          5B665A5A5A665A5A5A665A5A5A665A5A5A665A5A5A665A5A5A665A5A5A665A5A
          5A665A5A5A665A5A5A665A5A5A665A5A5A665B5B5B665C5C5C665C5C5C665E5E
          5E665A5A5A66484848662E2E2E62131313260000000000000000000000000000
          0000000000000808080F1E1E1E3D2929295D3E3E3E665E5E5E665D5D5D665C5C
          5C665C5C5C665B5B5B665B5B5B665B5B5B665B5B5B665B5B5B665B5B5B665B5B
          5B665B5B5B665C5C5C665C5C5C665C5C5C665C5C5C665D5D5D665E5E5E665858
          58662C2C2C631919193E0808080F000000000000000000000000000000000000
          00000000000000000000000000000B0B0B1538383866606060665E5E5E665D5D
          5D665D5D5D665C5C5C665C5C5C665C5C5C665C5C5C665C5C5C665C5C5C665C5C
          5C665C5C5C665D5D5D665D5D5D665D5D5D665E5E5E665F5F5F66606060665959
          5966262626570101010200000000000000000000000000000000000000000000
          0000000000000000000000000000020202032D2D2D625F5F5F66606060665E5E
          5E665E5E5E665D5D5D665D5D5D665D5D5D665D5D5D665D5D5D665D5D5D665D5D
          5D665E5E5E665E5E5E665E5E5E665F5F5F666060606660606066616161664A4A
          4A661818183E0101010300000000000000000000000000000000000000000000
          000000000000000000000000000000000000212121464D4D4D66616161666060
          60665F5F5F665E5E5E665E5E5E665E5E5E665E5E5E665E5E5E665E5E5E665F5F
          5F66606060665E5E5E665D5D5D66616161666161616662626266575757662E2E
          2E62090909110000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000B0B0B14313131645E5E5E666161
          616660606066606060665F5F5F665F5F5F665F5F5F6660606066606060666060
          6066616161664444446632323266454545664A4A4A66404040662B2B2B5F1111
          111E000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001A1A1A33393939665F5F
          5F66626262666161616661616166606060666161616661616166616161666262
          62664C4C4C66282828580D0D0D171818182E1B1B1B3714141427040404070000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001C1C1C363434
          34665252526662626266626262666262626662626266626262665C5C5C664040
          4066262626540808080E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000F0F
          0F1B25252551333333664242426648484866454545663A3A3A662B2B2B601B1B
          1B34020202030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000808080E151515271B1B1B321919192E0E0E0E1A010101020000
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
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000E3E3E3E3009300FF009300FF009300FF0093
          00FF009300FFE3E3E3E300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000E3E3E3E3009300FF35CE5FFF31CA59FF1DB6
          34FF009300FFE3E3E3E300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000E3E3E3E3009300FF54ED92FF4FE88AFF2EC7
          50FF009300FFE3E3E3E300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000E7E7
          E7E7E3E3E3E3E3E3E3E3E3E3E3E3E7E7E7E7009300FF53EC8EFF4CE584FF2BC5
          4BFF009300FFF0F0F0F0E3E3E3E3E3E3E3E3E3E3E3E3F0F0F0F0000000000000
          0000000000000000000000000001000000030000000500000006000000070000
          000700000007000000070000000700000007000000070000000700000007E3E3
          E3E4009300FF009300FF009300FF009300FF009300FF53EC8DFF4DE684FF29C2
          47FF009300FF009300FF009300FF009300FF009300FFE3E3E3E3000000000000
          00000000000001010003010101080000000E0000001300000016000000170000
          001800000018000000180000001800000018000000180000001800000018E3E3
          E3E6009300FF42DB6DFF39D25FFF37D05AFF3CD564FF50E986FF4CE581FF3FD8
          6AFF27C044FF2AC34AFF2CC54FFF1DB634FF009300FFE3E3E3E3000000000000
          0000020101040403021930221880705039CA9E7150F6A57654FFA57654FFA576
          54FFA57654FFA57654FFA57654FFA57654FFA57654FFA57654FFA57654FFF5F0
          ECFF009300FF65FEA4FF58F190FF56EF8EFF52EB88FF4FE882FF4CE580FF4CE5
          81FF4DE685FF4CE584FF4EE78AFF33CC5AFF009300FFE3E3E3E3000000000201
          01031A130E4E936A4CE9C6A68CFFE6D4C0FFF8ECDBFFFCF0DDFFFCF0DBFFFCEF
          DAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFCEFDAFFFFFD
          FBFF009300FF6DFFAFFF61FA9CFF5EF798FF57F08FFF52EB86FF4FE882FF50E9
          86FF53EC8CFF53EC8DFF53EC91FF36CF5FFF009300FFE3E3E3E4010000012920
          194BA87D5CFAE7D5C2FFFCF0DEFFFCEDD4FFFDEBCEFFFDE9CAFFFDE9C9FFFDE8
          C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFDE8C8FFFFFC
          F9FF009300FF009300FF009300FF009300FF009300FF58F190FF52EB88FF39D2
          5FFF009300FF009300FF009300FF009300FF009300FFE3E3E3E50C090712946A
          4CE8E7D5C2FFFCEFDCFFFDEBCFFFFDE8C5FFFEE6BFFFFEE4BCFFFEE4BBFFFEE4
          BBFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BAFFFEE4BAFFFFF7
          EAFFF8F8F7FFF7F3F0FFF8F6F5FFFBFBFBFF009300FF60F99BFF58F18FFF2FC8
          4DFF009300FFFFFDFAFFFFFDFBFFFCFAF8FFF2EEEBFCB1B1B1BA4F3C2D77C6A6
          8CFFFCF1E0FFFDECD1FFFDE7C4FFFEE4BCFFFEE2B6FFFEE2B4FFFEE1B3FFFEE1
          B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1B3FFFFE1
          B3FFFFE1B3FFFFE1B3FFFFE1B3FFF8F9F9FF009300FF62FB9EFF59F292FF33CD
          53FF009300FFFFFCF9FFFDECD1FFFCF1E0FFC4A389FF2C1F167D7E5C43C1E6D4
          C2FFFCEFD9FFFDE9CAFFFEE5BEFFFEE3B6FFFFE1B3FFFFE0B1FFFFE0B1FFFFE0
          B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0B0FFFFE0
          B0FFFFE0B0FFFFE0B0FFFFE0B0FFF8F8F8FF009300FF6CFFAEFF64FDA3FF39D2
          5DFF009300FFFFFCF8FFFDE9CAFFFCEFD9FFE4D1BEFF674934C1996D4DEEF6EB
          DCFFFDEED6FFFDE9C7FFFEE5BDFFFFE2B6FFFFE1B3FFFFE1B2FFFFE1B2FFFFE1
          B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1B2FFFFE1
          B2FFFFE1B2FFFFE1B2FFFFE1B2FFF8F5F3FF009300FF009300FF009300FF0093
          00FF009300FFFFFCF8FFFDE9C8FFFDEED7FFF3E7D8FF946A4BE99C704FF1F7ED
          DFFFFDEED8FFFEEACAFFFEE6C0FFFFE4B9FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2
          B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFE2
          B6FFFFE2B6FFFFE2B6FFFFE2B6FFFFF6E8FFFFFCF7FFFFFCF7FFFFFCF7FFFFFC
          F7FFFFFCF7FFFFFDF9FFFDEACAFFFDEED8FFF4E9DBFF976B4DEC835F44CAE9D9
          C9FFFCF0DDFFFDECCFFFFEE8C5FFFEE6BFFFFFE5BBFFFFE4BAFFFFE4B9FFFFE4
          B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4
          B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4B9FFFFE4BAFFFFE5
          BBFFFEE6BFFFFEE8C5FFFDECD0FFFCF0DDFFE7D7C6FF715139C859433382CCAF
          98FFFCF3E4FFFDEFD8FFFDEBCEFFFEE9C7FFFEE7C2FFFFE6C0FFFFE6BEFFFFE5
          BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5
          BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BDFFFFE5BEFFFFE6BFFFFFE7
          C2FFFEE9C6FFFEEBCEFFFDEFD8FFFCF3E5FFCAAC95FF4D3A2C83130F0C1BA176
          55F4EEE1D3FFFCF2E2FFFDEFD8FFFEECD0FFFEEACAFFFEE9C6FFFFE8C4FFFFE7
          C2FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7
          C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C1FFFFE7C2FFFFE8C3FFFFE8C5FFFEEA
          C9FFFEECCFFFFDEFD8FFFCF2E2FFEDDFD1FF9E7354F2120E0C19000000004132
          275CB18769FFF0E4D6FFFCF3E3FFFDF0DAFFFDEDD3FFFEEBCDFFFEEAC9FFFFE9
          C7FFFFE8C5FFFFE8C4FFFFE8C4FFFFE8C4FFFFE8C4FFFFE8C4FFFFE8C4FFFFE8
          C4FFFFE8C4FFFFE8C4FFFEE8C4FFFFE8C5FFFFE9C6FFFFE9C8FFFEEBCCFFFEEC
          D1FFFDEFD9FFFCF2E2FFEFE2D4FFAF8567FE3D2F255800000000000000000000
          000047362A66A57B5AF8D3B9A4FFF4E7D6FFFDF1DDFFFEEED6FFFEECD0FFFFEB
          CCFFFFEACAFFFFEAC8FFFFEAC8FFFFEAC8FFFFEAC8FFFFEAC8FFFFEAC8FFFFEA
          C8FFFFEAC8FFFFEAC8FFFFEAC8FFFFEAC9FFFFEBCBFFFEECCEFFFEEDD3FFFDF0
          DAFFF3E5D3FFD2B8A2FFA47959F7423328610000000000000000000000000000
          0000000000001C161226684F3B9A976C4DEAC3A186FFFDF1DEFFFEEFD7FFFEED
          D2FFFFECCEFFFFEBCDFFFFEBCCFFFFEBCCFFFFEBCCFFFFEBCCFFFFEBCCFFFFEB
          CDFFFFEBCDFFFFECCEFFFFECCEFFFFECCFFFFEEDD2FFFEEED6FFFDF0DCFFF0E1
          CFFF9F7352F85942319C19141026000000000000000000000000000000000000
          0000000000000000000000000000261E1836B79174FFFCF4E6FFFDF1DEFFFEEF
          D8FFFEEED4FFFFEDD1FFFFEDD0FFFFEDD0FFFFEDD0FFFFEDD1FFFFEDD1FFFFEE
          D2FFFFEED3FFFEEED4FFFEEFD6FFFEEFD7FFFEF0DAFFFDF2DFFFFDF3E5FFEFE2
          D5FF8A6346DB0202020600000000000000000000000000000000000000000000
          000000000000000000000000000006050409A27656F7F8F1E6FFFDF4E5FFFEF1
          DEFFFEF0D9FFFFEFD6FFFFEED4FFFFEED4FFFFEED4FFFFEFD5FFFFEFD6FFFEEF
          D8FFFEF0DAFFFEF1DCFFFEF1DEFFFDF2E0FFFDF3E3FFFCF5E8FFFCF6EDFFD4BD
          AAFF563F2E9D0201010300000000000000000000000000000000000000000000
          000000000000000000000000000000000000755740B0D9C5B3FFFCF6EBFFFDF4
          E5FFFEF2E0FFFEF1DCFFFEF0DAFFFFF0DAFFFEF0DAFFFEF1DBFFFEF1DDFFFEF2
          DFFFFDF3E2FFF9EEDEFFF7ECDEFFFCF5EAFFFCF6EDFFFCF7F0FFE9DCD0FFA478
          59F71F19142C0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000251D1734AB8062FCF4ECE3FFFCF6
          ECFFFDF4E7FFFDF3E3FFFEF3E1FFFEF2E0FFFEF3E0FFFEF3E2FFFDF4E4FFFDF5
          E7FFFCF6EAFFCBAE97FFAD8263FFCCB09AFFD4BCAAFFC4A48DFF9B7051EE372C
          234C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000058433480B89277FFF6F0
          E8FFFCF7EEFFFDF6EAFFFDF5E8FFFDF5E7FFFDF5E8FFFDF5E9FFFCF6ECFFFCF7
          EFFFD6C0AEFF8F684BDC2A221C3A513F31755E46358B45362B630D0B09120000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000005F493889B188
          6AFFE1D0C2FFFCF8F1FFFCF7F0FFFCF7EFFFFCF7EFFFFCF8F1FFF2EAE0FFC4A5
          8DFF8A6448D41A15112300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003227
          2045856046CCAF8566FFC6A891FFD0B6A3FFCCB19CFFBA967BFF9C7051F05A45
          3682070605090000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001A14102446372B635A47397E524134732F261F42040403060000
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
