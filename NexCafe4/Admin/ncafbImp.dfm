inherited fbImp: TfbImp
  Caption = 'Impress'#245'es'
  ClientHeight = 512
  ClientWidth = 340
  ExplicitWidth = 348
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 340
    Height = 512
    ExplicitWidth = 340
    ExplicitHeight = 512
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 340
      Height = 5
      Visible = False
      ExplicitWidth = 340
      ExplicitHeight = 5
    end
    object Paginas: TcxPageControl
      Left = 0
      Top = 5
      Width = 340
      Height = 507
      ActivePage = cxTabSheet1
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = PaginasChange
      ClientRectBottom = 507
      ClientRectRight = 340
      ClientRectTop = 24
      object cxTabSheet1: TcxTabSheet
        Caption = 'Pausadas'
        ImageIndex = 0
        object pgPausada: TcxPageControl
          Left = 0
          Top = 0
          Width = 340
          Height = 483
          ActivePage = tsAtivo
          Align = alClient
          HideTabs = True
          TabOrder = 0
          ClientRectBottom = 483
          ClientRectRight = 340
          ClientRectTop = 0
          object tsInativo: TcxTabSheet
            Caption = 'Inativo'
            ImageIndex = 0
            object LMDScrollBox1: TLMDScrollBox
              Left = 0
              Top = 0
              Width = 340
              Height = 483
              Align = alClient
              TabOrder = 0
              object cxLabel3: TcxLabel
                AlignWithMargins = True
                Left = 3
                Top = 70
                Align = alTop
                Caption = 
                  'Evite impress'#245'es indesejadas pelos clientes ativando o recurso d' +
                  'e pausa autom'#225'tica de impress'#245'es. '#13#10#13#10'Nesse modo a impress'#227'o s'#243' ' +
                  'vai ocorrer depois de ser confirmada pelo atendente ou pelo clie' +
                  'nte sabendo antecipamente quantas p'#225'ginas ser'#227'o impressas e (opc' +
                  'ionalmente) o custo.'#13#10#13#10'Voc'#234' pode ativar esse recurso em "Op'#231#245'es' +
                  '" / "L.Impress'#245'es".'
                Style.TextColor = clGray
                Properties.WordWrap = True
                Width = 330
              end
              object LMDSimplePanel1: TLMDSimplePanel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 330
                Height = 61
                Align = alTop
                Bevel.BorderSides = [fsBottom]
                Bevel.Mode = bmStandard
                Bevel.StandardStyle = lsNone
                TabOrder = 1
                object Image1: TImage
                  Left = 0
                  Top = 0
                  Width = 48
                  Height = 61
                  Align = alLeft
                  AutoSize = True
                  Picture.Data = {
                    0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
                    00300000003008060000005702F98700000C424944415478DAD55A09708DEB19
                    FECE89ACE48A9DD84312DB157B50B51433B18C89754C1957C652C63554472D51
                    4192968BA1D4E875514BC45215FB9258422D251789354424D658431091ED9C3E
                    CFE7FFD23FC77FE220DAE937F3CEBF7DFFF7BDCFBBBFFF3926ABD52AFE9F87A9
                    3400983078183D7A74592727271F9CFBE7E6E6BAC7C4C4ECCACACA7A833D0AFE
                    E7003426C5AC59B3DC2C164B1DB3D9EC575050E087F77D9D9D9D7DBDBCBC1A80
                    BC2B57AEEC5CB56A55919F9F6F5DB972655C7C7CFC6F1F3D7A948A79B9FF3500
                    43870E756AD7AE9D3798F47DF7EE9D3F6EF992D1F2E5CB37FCE69B6F6A83510F
                    306A0209328B7BC5DEE79AC47BF5EA5511161676ECC0810353DEBE7D9B8CFBEF
                    BE3A80F4F4F496D8F058C3860D3DC1B0B942850AA252A54AA262C58A7617E11A
                    D08A3C2AE280004442428235222262CBFEFDFBE7E2561A9EE57D5500909CF3D2
                    A54B7FF2F7F7FF2E2828C89059FDF9C7083E2176EDDA655DB4685124C0FC84D7
                    1E96A64F180130D5C6183162C4DFFAF4E9F3AB0E1D3A14635C7F7484B4354564
                    6464E69A356BBE7FF2E4492C6E655A4B29FC19FA00367469D3A64DABE0E0E07F
                    8C1933C69B766E6B22B64CEACDC81620071C594C99320596B47F0E2E2F97963F
                    D88D4200E11E1212323C3030F0C7B163C79A0A0B0B1D96B8D17DFAC3C68D1B0B
                    614AD3EFDEBDBB45BC3725CBD704C0B0E93563C68C686822A865CB96C5B4C073
                    7BCC1A81E178F9F2A5983871E2BE83070F2EC0E579DC7FFBD50068209CC07C27
                    F841DCA449939CC9B43D33714433D4C2AA55AB72162C58F0FBD7AF5FEFC0AD8C
                    2FF5858F263280F0983A756A1480F40F08087048F2F6884A4D4A4A12D3A64DFB
                    EBA54B971891AE7C695875048069E4C891BD9A356BB677DCB87126645F87EDDE
                    681E7D096614BF67CF9E3FE3321EF75F7E55001CD5AA55F31C3E7CF8F9F1E3C7
                    FB32FB961491D47A46A6A609442C5FBE3C73F1E2C5E198F377F1DE993FDB8C1C
                    02405F800F2CE8DCB9F3EFBA76EDFA510025698563EFDEBDD6D0D0D005F08375
                    B84CF99268E42800D3A851A3BAFBF8F8C4DA33A34FF1036464B162C58AE8BCBC
                    BC9D4F9F3E3D9C9696F68A4AFB1C4D385C8DFAF9F995EFD5AB57DAF4E9D32B90
                    89921297BD30CA634E4E8E3875EA94C8CECE16A862C5C3870F9FE3D129148D71
                    B76FDF3E00DFB887EB7C47C17C4A39ED3461C284389418DD6AD5AA5562345283
                    E78CFD90B0B873E78E3CBE79F346B8B8B888418306899E3D7B0A989148494911
                    C9C9C9AC5E73D047C4BD78F162FDDAB56BE3B0C45BAC51F84500683E93274F2E
                    53A74E9D66A9A9A90B7BF4E8D11D65463100FAE3B367CF24A32454B692617777
                    775972B3B245852BCA962D2B5C5D5D65295EAF5E3D51A54A15790D9312972F5F
                    16274F9EB4A2F448C8C8C898BF65CB1602C9B107C410C092254BBC504576C0B3
                    CEA040D87C6B6CE609B59B988C50E415990F6B1CA85E324BA6692264C6D3D353
                    324BA6C93C41B8B9B949E2399FA3AF906078ADFC8344D3429E1028EB2D30B16D
                    C78F1F9F7BE3C68D34B096676B5A450010D65CB0D877B81E0986DBD4A851C399
                    D2A959B3A609E772CEF5EBD74554549468DEBCB9543B9946A3224DC2C3C343A8
                    DE810CF39A8C110C8F6494CFC9389FB1CC664EE0B0D5A6A67979CD88059FB976
                    EEDCB9EF2F5EBC98A09995B5188065CB9679E28583685A3AA2919192D13A482B
                    2586CDAD94264A6133CC499604644431AC97A462984CF21D822957AE9C94AABE
                    86B2F521754E605C9F918E3C5038870E1DCA8E8D8DBD0F07FF0D34721E53B315
                    08090026330E36BEB27DFBF6D20E2919557D72239EE36801A356306E82C39951
                    51CA8D9449F04886496498D78E4626350812F62FAE5CB922D7E65AA80044F5EA
                    D52DEBD6ADBB05AD5FDBBC79F36C4CBDA97A6C0960FEFCF9A1AD5AB58A68DAB4
                    6911F3AA7053B6AECE2119A90D2C2AB2B2B24C34214A9FC44D8DCCC2A819B265
                    9E92DFBE7DBBF427AE4DE76704E37AA802C483070FEEA3977041771706E7DE2D
                    B442500240CF3A0B4D7C386D9BAAB365DA080816B6227A9868467CA724A63333
                    3305C2A2644ECD5176EEEDED2DFAF6ED2B600162F5EAD52C5BC4D1A3478BD6E3
                    1CE5E4D050C1B56BD7B621522DC3E32436454500D0B884B768D1829F438AD5FC
                    4640D47D4A87A6C27068E48CEAB870E14239973D85D2AE7A86D02CEEDDBB2773
                    02931BEC5D346EDC58926DF90EE6C5D9B367334E9C38118ECBEDB8FFB40800EC
                    3F9C1BA832C1B67929492B543F6339A565AB05DE430214DDBB77170C105C5F69
                    59E58D1D3B7688BA75EB0A08516CDDBA550C193284D14F0A5301E620D0DDBB77
                    E7A1215A87CBA558FFBA04101E1E3EAB63C78EE14C507CC996797B473D110423
                    92BE1AE5E66416BDB0E8D4A9933413C594F215DA39228C7C9F7310F345EFDEBD
                    A529D9CE65CE3972E4483E00ECC56504F6BA500480260410C57C40DF073B0284
                    218FF6CA48A62768585038CC27644AAF013AEBE9D3A7056A210900F15E74EBD6
                    4D86685B0D3C7FFE5C9C3973261F09EE102EE780DE0398376FDE1F10AEE6B1C6
                    6108E4CB8CE3BA106A685646E645E650CFC8CD490480FA5F263F6A88D77A00CC
                    DCCCBAB47F94EB1200C339F38C2DD857AF5E716EFEBE7DFB08801FCACE2B0011
                    A87142E9035413891B714312A56A145A8D3482D02ACD821B2B10EBD7AF17FEFE
                    FE9229054099059FD39191244583060DE4BB6C5D191C8CC0DEBA752B1FD99900
                    E6817E9600E6CE9D1B090033899C0B7250220482F82BED9336494765B2D185D2
                    6240E8B0C89402715A3E530076EEDC298B3655B029D350BEC2F9AC5669C2F7EF
                    DF67E92ECA94292335A907CB73F0938F8CFC210084B1995C801BA8859543D2F6
                    B83099A31469CB04A4EA1915B90880D26451A75F0309482627CE27534AA25AB9
                    22D0D448C953800C958C487C4FCD55451ECF21D47C44A2FF00E03AB367CF8E40
                    B32235A02F216CA5CB674A5A3C32FED7AE5D5B32A7E69301262C66650E3AE7E1
                    C387057B697D0253C47708806B324A710FB59E7E9E6EFF7C64E30F01040505CD
                    E4775025493D10BD9DAB4DA929D643AC4A69F704421B2630D6F4D41AED9AA506
                    9F3330D02C6C9952E1919FE2693AD412C15200B673B93F4D082659DC89C3C2C2
                    229506D4D003310A9DFA39ECAA683A943E9966B42023AC52598DC6C7C7CB73FA
                    8F2D53AAA760A9CE4A808E4A007CDF480330E5BC989898D86200E6CC99138162
                    2EB45FBF7E1F3437FA4AD25E2E50402835F6BB376FDE94E7BC4FFF609C673433
                    D200E7506BCCB26DDBB6954183FE65A40102C0BC5C646E16737F02254A002121
                    21DF62839950731FC46B4F6A8211E75381683F6888C4C44479CE4846CD50435C
                    4F01D033C7F7C8347D0042B4C21F4C7A00FAB914060064A36ADD009658D0DD30
                    69D273C5850FCAE45FA02A6D8B7CF04B1F1F9F460062624C7614083741A61417
                    2E5C901BD3FE1F3F7E2CEB1D15828D34C00847ADA180B320C49A55C432D200FC
                    EED5B66DDBF859F247D02D0580DE44105EA0EA20DF264D9A0440A5ADEAD7AFDF
                    05470F3A381DB124205C860D09B32901300CD2A629DD8F01403D948AF9575007
                    F543896DB23521D5A50140161A7D025855044017DE08C419540EC41FC5EAA2CD
                    6C0AD506A0D9E902503EC815267649FAA137213A2CB5A07C804407A559D80300
                    80964D9B36FD0C13DB3778F0E03054A266230D1000E666A12B3306A01FFC0E84
                    833BA83CB5C25F2CA1E20014656D9155F9C9DD1560648BA97F8FCD081D59E501
                    8263A8A559D803909E9E5E0800D1281F360C1830E0106A32B391131300E66645
                    47477F1C808D565C406541CC46F510E69AB56EDDBA85AFAF6F57387D2D56918D
                    1A359273A90196C42A02C1A6F969C48A24E5A497AA5E7B70CC820D1B36AC445B
                    BA3E3838F81C32B1D93657A8BA8926141515A57C20F5937EA9D76985BE52032A
                    F7A7AFC0E903B169FB2E5DBA3821A29898945026DF45737E3E2929E92572CCAF
                    A13D3702501D9F1A744CBC5380A6FD2FA88437F6EFDF3F01859F5909403F5703
                    9009006B3F0B8081563C418CB7F550567C8B11809EA01CC2E81324A702ACFD98
                    9B0C1C387002CC2E90B9401567CA6F1862611689280F0E63EEDA61C3866D840F
                    B466E253DD9BF225667444AB13683BFFC9B9B877FB8BFE2BA101A1563C34AD78
                    83EA88F7812003F4009409F3AA0BFA23241CA0CD57A66141C99172ECD8B16444
                    AB445CC7C0C76AC2DC7E403FD218D766DDDC4284E4EB989B024D9CC3F51EF0FE
                    A854FEECA103E3AA81E1C63920FE946AD1EEFB810275009571E76940C954B276
                    AF9136D75BD33487559BCBAFD7FF12EF7F5778576A001C04E7A503A8864503FA
                    423B72B8812A6847DBB9FC65933F4BE5F2BBD0BF016B9FD386F3C3B049000000
                    0049454E44AE426082}
                  ExplicitLeft = 2
                  ExplicitTop = 2
                  ExplicitHeight = 48
                end
                object cxLabel4: TcxLabel
                  Left = 54
                  Top = 8
                  Caption = 'Pausa autom'#225'tica de impress'#245'es'
                end
                object cxLabel5: TcxLabel
                  Left = 54
                  Top = 32
                  Caption = 'Recurso desativado'
                  ParentFont = False
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                end
              end
            end
          end
          object tsAtivo: TcxTabSheet
            Caption = 'Ativo'
            ImageIndex = 1
            object dxBarDockControl2: TdxBarDockControl
              Left = 0
              Top = 0
              Width = 340
              Height = 36
              Align = dalTop
              BarManager = BarMgr
              SunkenBorder = True
              UseOwnSunkenBorder = True
            end
            object GridA: TcxGrid
              Left = 0
              Top = 36
              Width = 340
              Height = 447
              Margins.Left = 0
              Margins.Top = 5
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              TabOrder = 1
              OnEnter = GridEnter
              OnExit = GridExit
              LookAndFeel.Kind = lfFlat
              LookAndFeel.NativeStyle = False
              object TVA: TcxGridDBTableView
                OnDblClick = cmEditarClick
                OnMouseEnter = TVMouseEnter
                OnMouseLeave = TVMouseLeave
                NavigatorButtons.ConfirmDelete = False
                NavigatorButtons.Insert.Visible = False
                NavigatorButtons.Delete.Visible = False
                NavigatorButtons.Edit.Visible = False
                NavigatorButtons.Post.Visible = False
                NavigatorButtons.Cancel.Visible = False
                NavigatorButtons.Refresh.Visible = True
                NavigatorButtons.SaveBookmark.Visible = False
                NavigatorButtons.GotoBookmark.Visible = False
                NavigatorButtons.Filter.Visible = False
                DataController.DataModeController.GridMode = True
                DataController.DataModeController.GridModeBufferCount = 100
                DataController.DataSource = dsPM
                DataController.Filter.MaxValueListCount = 1000
                DataController.Filter.Options = [fcoCaseInsensitive]
                DataController.Filter.Active = True
                DataController.Filter.AutoDataSetFilter = True
                DataController.KeyFieldNames = 'PrinterIndex;JobID'
                DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <
                  item
                    Links = <>
                    SummaryItems.Separator = ', '
                    SummaryItems = <
                      item
                        Kind = skCount
                      end>
                  end>
                Filtering.ColumnPopup.MaxDropDownItemCount = 12
                OptionsBehavior.IncSearch = True
                OptionsCustomize.ColumnFiltering = False
                OptionsCustomize.ColumnGrouping = False
                OptionsCustomize.ColumnHidingOnGrouping = False
                OptionsCustomize.ColumnSorting = False
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsSelection.HideFocusRectOnExit = False
                OptionsSelection.UnselectFocusedRecordOnExit = False
                OptionsView.GroupByBox = False
                OptionsView.GroupFooters = gfVisibleWhenExpanded
                Preview.AutoHeight = False
                Preview.Visible = True
                object tvAMaq: TcxGridDBColumn
                  Caption = 'M'#225'q.'
                  DataBinding.FieldName = 'Maquina'
                  PropertiesClassName = 'TcxMaskEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.MaxLength = 0
                  Properties.ReadOnly = False
                  HeaderAlignmentHorz = taCenter
                  Width = 41
                end
                object tvAPag: TcxGridDBColumn
                  Caption = 'P'#225'g.'
                  DataBinding.FieldName = 'PaginasReg'
                  PropertiesClassName = 'TcxMaskEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.MaxLength = 0
                  Properties.ReadOnly = False
                  HeaderAlignmentHorz = taCenter
                  Width = 40
                end
                object tvADocumento: TcxGridDBColumn
                  Caption = 'Documento'
                  DataBinding.FieldName = 'Document'
                  PropertiesClassName = 'TcxMemoProperties'
                  Properties.Alignment = taLeftJustify
                  Properties.MaxLength = 0
                  Properties.ReadOnly = False
                  Width = 226
                end
                object tvAImp: TcxGridDBColumn
                  Caption = 'Impressora'
                  DataBinding.FieldName = 'PrinterName'
                  PropertiesClassName = 'TcxMaskEditProperties'
                  Properties.Alignment.Horz = taLeftJustify
                  Properties.MaxLength = 200
                  Properties.ReadOnly = False
                  Width = 194
                end
                object tvAComputador: TcxGridDBColumn
                  Caption = 'Computador'
                  DataBinding.FieldName = 'Computer'
                  PropertiesClassName = 'TcxMaskEditProperties'
                  Properties.Alignment.Horz = taLeftJustify
                  Properties.MaxLength = 200
                  Properties.ReadOnly = False
                  Width = 118
                end
              end
              object glA: TcxGridLevel
                GridView = TVA
              end
            end
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Registradas'
        ImageIndex = 1
        object Grid: TcxGrid
          Left = 0
          Top = 36
          Width = 340
          Height = 447
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          TabOrder = 0
          OnEnter = GridEnter
          OnExit = GridExit
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object TV: TcxGridDBTableView
            OnDblClick = cmEditarClick
            OnMouseEnter = TVMouseEnter
            OnMouseLeave = TVMouseLeave
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.Insert.Visible = False
            NavigatorButtons.Delete.Visible = False
            NavigatorButtons.Edit.Visible = False
            NavigatorButtons.Post.Visible = False
            NavigatorButtons.Cancel.Visible = False
            NavigatorButtons.Refresh.Visible = True
            NavigatorButtons.SaveBookmark.Visible = False
            NavigatorButtons.GotoBookmark.Visible = False
            NavigatorButtons.Filter.Visible = False
            DataController.DataModeController.GridMode = True
            DataController.DataModeController.GridModeBufferCount = 100
            DataController.DataSource = DataSource1
            DataController.Filter.MaxValueListCount = 1000
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Filter.Active = True
            DataController.Filter.AutoDataSetFilter = True
            DataController.KeyFieldNames = 'IDSeq'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <
              item
                Links = <>
                SummaryItems.Separator = ', '
                SummaryItems = <
                  item
                    Kind = skCount
                  end>
              end>
            Filtering.ColumnPopup.MaxDropDownItemCount = 12
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.Navigator = True
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            Preview.AutoHeight = False
            Preview.Visible = True
            object TVMaquina1: TcxGridDBColumn
              Caption = 'M'#225'q.'
              DataBinding.FieldName = 'Maquina'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Width = 41
            end
            object TVPaginas1: TcxGridDBColumn
              Caption = 'P'#225'g.'
              DataBinding.FieldName = 'Paginas'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              Width = 40
            end
            object VColumn1: TcxGridDBColumn
              Caption = 'Hora'
              DataBinding.FieldName = 'DataHora'
              PropertiesClassName = 'TcxTimeEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.TimeFormat = tfHourMin
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 39
            end
            object VColumn2: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'Total'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Vert = taVCenter
              Width = 52
            end
            object TVDocumento1: TcxGridDBColumn
              DataBinding.FieldName = 'Documento'
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taLeftJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              Width = 347
            end
            object TVResultado1: TcxGridDBColumn
              DataBinding.FieldName = 'Resultado'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownRows = 7
              Properties.Items = <
                item
                  Description = 'Imprimiu'
                  ImageIndex = 0
                  Value = '0'
                end
                item
                  Description = 'Erro'
                  ImageIndex = 1
                  Value = '1'
                end>
              Properties.ReadOnly = False
              MinWidth = 16
              Width = 88
            end
            object TVImpressora1: TcxGridDBColumn
              DataBinding.FieldName = 'Impressora'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.MaxLength = 200
              Properties.ReadOnly = False
              Width = 115
            end
            object TVAcesso1: TcxGridDBColumn
              DataBinding.FieldName = 'Acesso'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              Visible = False
              Width = 107
            end
            object TVComputador1: TcxGridDBColumn
              DataBinding.FieldName = 'Computador'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.MaxLength = 200
              Properties.ReadOnly = False
              Width = 118
            end
            object TVCaixa: TcxGridDBColumn
              DataBinding.FieldName = 'Caixa'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
            end
            object TVID: TcxGridDBColumn
              Caption = 'N'#250'mero'
              DataBinding.FieldName = 'ID'
              PropertiesClassName = 'TcxMaskEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.MaxLength = 0
              Properties.ReadOnly = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 84
            end
            object TVDataHora1: TcxGridDBColumn
              Caption = 'Data'
              DataBinding.FieldName = 'DataHora'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.DateButtons = [btnClear, btnToday]
              Properties.DateOnError = deToday
              Properties.InputKind = ikRegExpr
              Width = 105
            end
          end
          object GL: TcxGridLevel
            GridView = TV
          end
        end
        object dxBarDockControl3: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 340
          Height = 36
          Align = dalTop
          BarManager = BarMgr
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im24
    UseSystemFont = False
    Left = 288
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmJobResume'
        end
        item
          Visible = True
          ItemName = 'cmJobDelete'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end>
      OldName = 'BarraTabSheet1'
      UseOwnFont = True
      UseRestSpace = True
    end
    object BarMgrBar2: TdxBar [1]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl3
      DockedDockControl = dxBarDockControl3
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 495
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem2'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    inherited cmNovo: TdxBarLargeButton
      Hint = 'Clique aqui para lan'#231'a uma nova impress'#227'o'
      LargeImageIndex = 6
      OnClick = cmNovoClick
      AutoGrayScale = True
      ShowCaption = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      Hint = 
        'Clique aqui para Editar a impress'#227'o que est'#225' selecionada na list' +
        'a abaixo'
      LargeImageIndex = 2
      OnClick = cmEditarClick
      AutoGrayScale = True
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
    end
    inherited cmLayCustomize: TdxBarButton
      ImageIndex = -1
    end
    inherited cmLaySalvar: TdxBarButton
      Caption = '&Salvar Layout'
      Hint = 'Salvar Layout'
      ImageIndex = 34
    end
    inherited cmLayRestaurar: TdxBarButton
      ImageIndex = -1
    end
    inherited cmExportar: TdxBarLargeButton
      Caption = '&Exportar lista de impress'#245'es registradas'
      Hint = 'Exportar lista de impress'#245'es registradas'
      LargeImageIndex = 47
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    inherited cmImprimir: TdxBarLargeButton
      Caption = '&Imprimir lista de impress'#245'es registradas'
      Hint = 'Imprimir lista de impress'#245'es registradas'
      LargeImageIndex = 7
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = 22
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmJobResume: TdxBarLargeButton
      Caption = 'Liberar'
      Category = 0
      Hint = 'Liberar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmJobResumeClick
      GlyphLayout = glLeft
    end
    object cmJobDelete: TdxBarLargeButton
      Caption = 'Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmJobDeleteClick
      GlyphLayout = glLeft
    end
    object dxBarSubItem1: TdxBarSubItem
      Align = iaRight
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ImageIndex = 21
      ShowCaption = False
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
          BeginGroup = True
          Visible = True
          ItemName = 'cmLayRestaurar'
        end>
    end
    object dxBarSubItem2: TdxBarSubItem
      Align = iaRight
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ImageIndex = 21
      ShowCaption = False
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
          BeginGroup = True
          Visible = True
          ItemName = 'cmLayRestaurar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          Visible = True
          ItemName = 'cmImprimir'
        end>
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 168
    Top = 225
  end
  inherited CP: TdxComponentPrinter
    Left = 192
    Top = 290
  end
  inherited dlgExp: TSaveDialog
    Top = 257
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 320
    Top = 250
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Top = 188
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 46
    Top = 213
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    TableName = 'Impressao'
    IndexName = 'IDataHora'
    Left = 86
    Top = 213
    object TabDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object TabComputador: TStringField
      FieldName = 'Computador'
      Size = 200
    end
    object TabMaquina: TWordField
      FieldName = 'Maquina'
    end
    object TabImpressora: TStringField
      FieldName = 'Impressora'
      Size = 200
    end
    object TabDocumento: TMemoField
      FieldName = 'Documento'
      BlobType = ftMemo
    end
    object TabResultado: TWordField
      FieldName = 'Resultado'
    end
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabTran: TIntegerField
      FieldName = 'Tran'
    end
    object TabCaixa: TIntegerField
      Alignment = taCenter
      FieldName = 'Caixa'
    end
    object TabManual: TBooleanField
      FieldName = 'Manual'
    end
    object TabSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object Tabq1: TWordField
      FieldName = 'q1'
    end
    object Tabq2: TWordField
      FieldName = 'q2'
    end
    object Tabq3: TWordField
      FieldName = 'q3'
    end
    object Tabq4: TWordField
      FieldName = 'q4'
    end
    object Tabq5: TWordField
      FieldName = 'q5'
    end
    object Tabq6: TWordField
      FieldName = 'q6'
    end
    object Tabq7: TWordField
      FieldName = 'q7'
    end
    object Tabq8: TWordField
      FieldName = 'q8'
    end
    object Tabq9: TWordField
      FieldName = 'q9'
    end
    object Tabq10: TWordField
      FieldName = 'q10'
    end
    object Tabv1: TCurrencyField
      FieldName = 'v1'
    end
    object Tabv2: TCurrencyField
      FieldName = 'v2'
    end
    object Tabv3: TCurrencyField
      FieldName = 'v3'
    end
    object Tabv4: TCurrencyField
      FieldName = 'v4'
    end
    object Tabv5: TCurrencyField
      FieldName = 'v5'
    end
    object Tabv6: TCurrencyField
      FieldName = 'v6'
    end
    object Tabv7: TCurrencyField
      FieldName = 'v7'
    end
    object Tabv8: TCurrencyField
      FieldName = 'v8'
    end
    object Tabv9: TCurrencyField
      FieldName = 'v9'
    end
    object Tabv10: TCurrencyField
      FieldName = 'v10'
    end
    object TabTotal: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Total'
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object TabDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object TabPago: TCurrencyField
      FieldName = 'Pago'
    end
    object TabFunc: TStringField
      FieldName = 'Func'
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object TabPaginas: TWordField
      FieldName = 'Paginas'
    end
  end
  object Timer1: TTimer
    Interval = 60000
    Left = 240
    Top = 248
  end
  object AuxTab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    TableName = 'Impressao'
    IndexName = 'IID'
    Left = 14
    Top = 285
    object AuxTabID: TAutoIncField
      FieldName = 'ID'
    end
  end
  object dsPM: TDataSource
    DataSet = Dados.mtImp
    Left = 144
    Top = 312
  end
end
