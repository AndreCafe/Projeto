inherited FrmPrintTipo: TFrmPrintTipo
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Impress'#227'o'
  ClientHeight = 395
  ClientWidth = 404
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 430
  ExplicitHeight = 440
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel3: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 73
    Width = 404
    Height = 322
    Margins.Left = 0
    Margins.Top = 10
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Bevel.Mode = bmEdge
    Color = clWhite
    TabOrder = 0
    OnEnter = LMDSimplePanel3Enter
    object grid: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 7
      Width = 392
      Height = 279
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      object tv: TcxGridDBTableView
        OnDblClick = tvDblClick
        Navigator.Buttons.CustomButtons = <>
        OnFocusedRecordChanged = tvFocusedRecordChanged
        DataController.DataSource = dsTipo
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = tvDescr
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideSelection = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 64
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        object tvImg: TcxGridDBColumn
          DataBinding.FieldName = 'Img'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.Images = dmImgImp.ilImp
          Properties.Items = <
            item
              ImageIndex = 0
              Value = 0
            end
            item
              ImageIndex = 1
              Value = 1
            end
            item
              ImageIndex = 2
              Value = 2
            end
            item
              ImageIndex = 3
              Value = 3
            end
            item
              ImageIndex = 4
              Value = 4
            end
            item
              ImageIndex = 5
              Value = 5
            end
            item
              ImageIndex = 6
              Value = 6
            end
            item
              ImageIndex = 7
              Value = 7
            end
            item
              ImageIndex = 8
              Value = 8
            end
            item
              ImageIndex = 9
              Value = 9
            end>
          Properties.ShowDescriptions = False
          MinWidth = 56
          VisibleForCustomization = False
          Width = 60
        end
        object tvDescr: TcxGridDBColumn
          DataBinding.FieldName = 'Descr'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          OnCustomDrawCell = tvDescrCustomDrawCell
          Width = 239
        end
        object tvID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          SortIndex = 0
          SortOrder = soAscending
        end
        object tvDescr2: TcxGridDBColumn
          DataBinding.FieldName = 'Descr2'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object tv2: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.NavigatorOffset = 0
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        OptionsView.BandHeaders = False
        Preview.AutoHeight = False
        Bands = <
          item
            Options.Moving = False
            Options.Sizing = False
            Width = 72
          end
          item
            Options.Sizing = False
            Width = 312
          end>
        object tv2Img: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Img'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.Items = <
            item
              ImageIndex = 0
              Value = '0'
            end
            item
              ImageIndex = 1
              Value = 1
            end
            item
              ImageIndex = 2
              Value = 2
            end
            item
              ImageIndex = 3
              Value = 3
            end
            item
              ImageIndex = 4
              Value = 4
            end
            item
              ImageIndex = 5
              Value = 5
            end
            item
              ImageIndex = 6
              Value = 6
            end
            item
              ImageIndex = 7
              Value = 7
            end
            item
              ImageIndex = 8
              Value = 8
            end
            item
              ImageIndex = 9
              Value = 9
            end>
          MinWidth = 56
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
          Width = 56
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.LineCount = 2
          Position.RowIndex = 0
        end
        object tv2Descr: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Descr'
          Width = 173
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.LineCount = 2
          Position.RowIndex = 0
        end
      end
      object gl: TcxGridLevel
        GridView = tv
      end
    end
    object lbTot: TcxLabel
      AlignWithMargins = True
      Left = 5
      Top = 289
      Align = alBottom
      AutoSize = False
      Caption = 'pg = R$'
      ParentColor = False
      ParentFont = False
      Style.BorderColor = 14079702
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      Style.Edges = [bTop]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clRed
      Style.TextStyle = [fsBold]
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Visible = False
      Height = 28
      Width = 394
      AnchorX = 399
      AnchorY = 303
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 404
    Height = 63
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 1
    object Image2: TImage
      Left = 340
      Top = 0
      Width = 64
      Height = 63
      Align = alRight
      AutoSize = True
      Picture.Data = {
        0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
        0040000000400806000000AA6971DE000000097048597300000AEB00000AEB01
        828B0D5A00000F9C4944415478DAE55B09501557167DFD05454554560505230A
        1123A283615C2AA6488924AE281AAB663289136312B354A2711B1D5171128D8A
        6B4CA9B88CB1DCCDA813A3C618AD24465CE30228BB28A02228FBFAF93DF734FF
        7D1F4DFFCF075C9899673D7BEF7EE7DC7BCFBDFDFA23B1FFF3263DED07060606
        B6B0B5B5759365B96B6E6E6E7A5252D24DDA2DFF4F11E0E1E1A1F3F6F6760248
        1717976E5DBB76F5B1B1B1F16DDFBE7D77EA9E6E6E6EED68C97E3A79327DEF9E
        3D33E3E2E20ED06555FF7504040707B7A6C573AEAEAEDD09B04FB366CD7C1C1C
        1C7C9C9C9CBC1D1D1D69E1644B5D22C0AC6DDBB64C92748AA965FACF206369A8
        8ADEB8A1F8EB755F7D1A1B1BBB8D0EE99B1401EDDAB5938282829AEB743A0FB2
        A64F40404037B29C6FCB962D01B23B81F520A0B6B44F72767666B4CE88841AF7
        908DCE5D0D9896C67DBC339D2C6F89DE581CB5ECCBB7535252F6B3A7EC096609
        983D7BF6183F3FBF0504CA8B00DA930525B82D40B668D1C2E24D396805A400DE
        FCBA81AD5AB6387BF5CAA870D2855FD953D404B304787A7ABA4E9D3AF5FB8913
        27F6254B5B152A22708311A4B86E89888A8A1216396746FC96CD9B46969595A5
        3C7302D02876BB4744441C22127CEDECECCC9E2B0B606A81178ED745CADDACDB
        6CDA94893B4F9C38F11E6D163C7302D09E7FFEF97E0B172E3C1C1E1EEE2C5133
        075CD3BA6A0298792214EFA1BBFF74E4807EDEACA953D2D2D236B3A7A007D6B8
        B6346CD8B037C913BE460EA74D8983D7B2E2238517C09B214504FF687F155B32
        F793A44D1BD70FAFACAC4C6C0A04A0D94E9B366DCB8C19335E777276B5B16445
        8B6E6EC623D4EBA98957E5E9EFBF1175E5CAD5B9B4BBAC2910C03A77EEEC357F
        FE825FFFF2D65B1E5506496AA89B6B91226E1B8CA38A5E362F6BCD8A2F479497
        975F6A1204A08585857D14B1307279779F9EB6062B5DDBEA751591E9C957E5CF
        DE99B0F4FAF5EB11EC097A41BD08A0C2A8F5DCB97F3F3DF9834FFC0D4C2735D4
        CDB5C0D7D212FAB726E283C42DD1EB471A0C8684264100DA7012C4390B166DF4
        E911606B0D10435DA498B906EDF26F470D733E9AF8DEDDBB779F5846A8370154
        F2B6FEDB9CB917DE98FCB12FB4C05A8B1A2C80AF95118CCBE2A23C367B62E8C1
        9898B31369D7C3264100DA983163A6CFFB3CEA0B978E5ECD2CA6352B4B61315D
        8AD74AF45AB175F1D494F56B578CA543579A0C013D7AF4709F35777E5CF0F0F1
        EDAA0C8F21DE2D1072FED8AEAA8869EFFCB9A8A868377B02EF080D7D1D96A64E
        9BB677CAAC2FC6483A5BC9DAFCAEE5E606D9728864245D32447E346179525212
        B24169532180BDF4D24BAFCF5FBA764727EF5E3A73D6ADF1EACB1A269425850F
        F5FF981CF2E3B9F317DEA05D394D86007F7F7FD78FA7CF4D19143ACEDE1406CC
        B29B5BFB8628868F442AB3F283D7628E1E3DFA26ED4E6A3204E0DA79F3237F9B
        30654E90BE8AB201D376F3BA005A3C46EB3A12C223EB663E282FCA3BDEBC79F3
        B8CBD4A83ABC9A9A9A9A999B9BDBE819A4464D894D9AF4F6F249B3A23E6DD1CA
        41D252736BDDBC660154DD4A4B0AD983CC44969B91C672532FB2450B17B0070F
        1EC8F7EFDF67B76EDD32100129A40B27CF9D3BB72F2525E5744E4E4E83F4A151
        040C1D1A326ECADF96ECF6E81620D5A7C8A9719E548DBAF06136CBCD4C60F76F
        A512E844569C975D3D4049A72C57AF5ECDA822A46B6486B772F48282024624C8
        E7CF9F4F3975EAD4A60B172E6CCACCCCBCFFD4080808E8ED3D65466442C04B23
        9AD1D8EAB4AE8155BF4C575555B1BC7B192CFB7622CBB995C472B352585971BE
        0216C00052A7D329536FF6F6F64A27D1655DBB7645396E22C20482AE21E0ECE4
        C993D9478E1C59F1F3CF3F7FFDF0E1C3FC274A80A7A7A73470E040DFDE2F0EBE
        F072F8BBAD21845A791C4FD05756B0FB19C92CFB5632BB4FA01F64A5D1BE72B3
        80DBB469A3743B3B3B46716FEAB6B6B60A011D3A74604E4E4ECCC6C6A60611B8
        C7CD9B37E57DFBF6C51F3C78F063928B5346DE1B4780B7B737F3F5F575A08705
        0C1E3C388806E64F83E8EBEEEEEE71EED235FBFE63A734ABD257BB3386535A54
        48D64D60F7D2013841B1368EF069713E58806ADDBA750DC02041042D764E0EAE
        C1B92278711D1E72ECD8B1B26DDBB64552F6886216DE262573807D7C7C9C6890
        FD434242FE4837F4737171E94E566FE3E5E565D7B163C7B6C4BE1DCE8D8EDECC
        3C8286B33BA937140B67DF4E664514CF924E570DD83830581A166CD5AA950970
        CB962D1520D80F801C3CB6B18EE30E0E0E0A60AC833411AC7A29AEE379972E5D
        32AC5DBB76FD77DF7D3753AFD717D64940AF5EBD6C060D1AF46A9F3E7DDE6FDB
        B6ED1F88F102026C4BDD8506D18A3F407CE0DEBD7BD8891F4F18014B260BA0C1
        453908000678B55B8B1DC7701E2C0DD0B85EBC5F5DA0D5FB40587C7CBC61D1A2
        455F9147CCA2DD256609F8F0C30F5D030303BF25A119E0E6E626E10678B0A0BC
        320D50A6C1C918240D58F902B273E74E460AAC9C838F22008CE3000D202260D1
        C27C9BBB3527478BE4FA8016E76DF9B1989898CA88888899E4116B69B3529380
        0D1B366C24EB4FC2A03868DEF9B6B034D0797A4747471D59A9D9D9B367254A47
        CA3100B114C73C046061AC7311B416A0B97D687171712CE356063354C9F40C7B
        E6E4ECC45CDC5C301E79CF9E3D394B962C194DD9E10C135EAA4C047CF3CD3757
        48E0FC91A2D4C0CDADD352263733E0B358FBF6ED75F7EEDD936EDFBECDE8CD4D
        21019616DD1A80B14FB4F0E3004FCF659B498BF4EE454CEE53C00AEDF359B1BE
        94B5297761C36CC633EFB6DD596151A1BC6CD9B2C3870E1D4249FDA01601A498
        B1C1C1C13D4502AC25C2186F3209A502964A55A9B8B8D8A4EAB07243E3B8AE7D
        959595EC8BCF17339B91D94CDF339F151697B2C2D232EAA54A972AECD857CEFF
        64C5A5C5ECE2C58BA591919113A8A2FC377B94A54D1E10FBCA2BAF6812A0066B
        C923A001AEAEAE12F4E07100D4DA87E7619CA4EC8CCA60F6EDF9ED4CFAD31D56
        525ACE4ACACB591175802F2A2B638EFA0E6CB1D31A969D9B8DCA51A6ACB0FB97
        5F7E799719BF3CD52060C890216609A8CB03C46D348405E2BC318226AE8BA0C5
        8E77831FCE7CCFB247FDCE8A49E44BCB2B59713979405909F3A8F466EF3B7CC6
        0CF9B21296B80FD50537A2A3A3C32119B508183A74689D04D4272C9009F0BB80
        868046C358B4408B1DC7A9FA63F7F2B358815B0E2B6B59C25A496D984FB39ECC
        A38527CB2BC863858585A671517598B57CF972CC31FE508380EDDBB7C7858686
        FA594B80B54440F8F059DD1A0D805670D0886D0E9EAF8BFB3878DE2B2A2AA03D
        CA3D90FFF13C6C8BA91CEDDAB56B595151519369F5B0DA03E2860D1B566F02AC
        210224C01BCC85833596560316B7D5C7C4E7F3E7F0F5D8D8D8AC152B56681330
        62C48806135087389AD220F784FA82B644801AB41670B43212C5848484AC356B
        D6D42680D260DCE8D1A31B4D802571448AC4D21AD075595C746D4BA04B4A4A58
        6E6E2EA3024829C4683B6BDDBA75B509D8BC79735CDFBE7DFD90B7F1CA8974A6
        7E4063BD81A730C4B208B42E17B71634DF460D02D0F9F9F94A1D829FF52004A1
        0D376EDCC85AB56A556D0276EDDA953C6AD4286F5C949393A3DC041741C0B4CA
        E386120145862B5A6365EEDAD6581AF7E5A0613C8C1B19487D6E7A7AFA83A54B
        97220B1CAA41C0EEDDBBD388802E78288F51B84D7676B6A2B09880E0BF026B8C
        57DCBD7B57714B4B42660D684E26078D9A03A06134B55788D751A9FE904AE2B7
        69F55FB508080B0BEBA2D600341000AFC0E0E14654E9290FE3E9C65AF068A9A9
        A9CAC0D5D6D7D21E2DD098070468DC03A06114082C0F2F31A5C28B61C48E1D3B
        9A8E656666828049B4FA6D2D02C68E1DDBC5920872510111F00CB81A7E040932
        AC25006F6C79797935ACAD15C762D90BD03C2C0116CF1341AB951E63C3F9182B
        328FBFBF7F0D02A80ED026203C3CBC8B968A9BEB18182623611108A7BBBBBBA2
        F4E6AE47A317124C6FD7099A6B5129D5F41C342CAE051A050FCE45590CD03AE3
        E40C3A5EC87C7D7D4D0490F1B409A0F7E57422C0531C587DDCDB385FAF908249
        4B0F0F0F857DD1A3D0CE9E3DAB10A0068DF344D08865B837BC4C0B34C212C473
        CFE015A0B84407699D3A75AA41C0CA952BB50918376E9CA738A8861081D8CECA
        CA52EA73A4BBCE9D3B2B03E033B8A74F9F367900175A0081EB42B53968F1B9BC
        E1DE38171D2F376AB07C1DCFE2F38EEAF9070A0F6D022804D2C78F1FEFC984D6
        1022C48F17000522D2D2D29454EAE5E5A5BCBE62D2041E03CBC1B5D1F92CAF16
        689004D2207C6AB07C1D1DD6E6D370660455060154094ED2CA02B508108910E3
        B3BEB91F8384F05119CAAE5CB9A21C8395B5EA0B9C0BD008070E1A4DCBBDB10E
        B07C7A4D2BFD6117C2853CA6343131319944F822196503ED8FA941C0CE9D3BD3
        274C98A049809A888694C3E818F0F1E3C71595565B870B1F8802687EBE96C5F9
        F7043E55AE7E8E914499B4C49091919146A09309FC6F249017E95157A9DF63C6
        C9511301F42638BD7FFFFE7F0D0E0EF6A1B4A1E38ADB5822D46171F4E851650E
        8FDF073A71E7CE1D4DD022783EC50E4B6B1563461265CA083269444E7C7C7C32
        95BD6728D47E47F2A17E9B554F8BD7987410BF0BE0EF029EF3F4F41CD4AF5FBF
        3123478EEC1F1414D4BE5BB76E4CF513E1067B04EE73F8F061A58EE08386E223
        7BA881F3B8868B03B82866EAB8261265D293320AB104027E99EE779104F6021D
        C64F6D31F565F617665AC830DFDF8EE2D3AF57AF5EAF0E1E3CF8356A3DFBF4E9
        6303B16A0C110076E0C0011301E8884F788018E3FC230996EAFB73D004502691
        AD2241BD49A0AF538B21EBC3DAD7A8E30B7105B3A2D5F56D107F19E14E793D28
        202060EC881123060E1A34A8438F1E3D60915AD75A43C0FEFDFB953429860054
        1E2ECEBF27F06F05EA22092E4E8419E8FCEC6BD7AE250134B93B40FF6E74F152
        B58B379600DEF051AE0D81F6A13684B462E4F0E1C3FD2954ECA8FAB39A0800A3
        7A43A91EC50288C7BE58160BF7818B1B48C08AC9C393C9DA97E88DEE229D8BB8
        4EA68ECFE0062B71349800B1C12F9DA96009A410090B0909194CC2D9A577EFDE
        12AFDACC11010276ECD8612240AB0CE6A0891803B9B49EE23995402712F833E4
        F2F8E1742CF55C66A58B3F0902C46B5B93223FD7A54B9797030303C348380349
        38EDBDBDBD557F58F108E8F6EDDB95424803B4F2C98D5CBC8A5CFC6E6C6C6C0A
        013F43B5C0653A05C03359F567EEC7FA5BC1C7F57783F88CEB48A9B3F70B2FBC
        309C8433243434D4874891A81C9544B0DBB66D5308103C002EAE27EB96504C27
        185DFC12ED0668FCED1054BCC12EFEB40810EF874FBC9E54FF0FA07A622C7945
        D0C081039D209CE42DD2D6AD5B312B0317AF226B5752A19242D6BE41E0CFD236
        40C7B36A17AF6CD4489E11016283702AE994843374C08001C34838FDE85D40A2
        02258340A3423B4DEE0E17C7EF80911A1EBB8B3F4B02C48674DAD1C5C5E54522
        C487D26016853BAC9D4ABD883D41176F2A04F006AF4016D1B367F067B24D8180
        26D7FE036CD8874F8E4200390000000049454E44AE426082}
      ExplicitLeft = 318
      ExplicitTop = 1
      ExplicitHeight = 64
    end
    object lbTitulo: TcxLabel
      AlignWithMargins = True
      Left = 2
      Top = 1
      Margins.Left = 0
      Margins.Top = 5
      Margins.Bottom = 10
      Caption = 'Selecione o Tipo de Impress'#227'o'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.Shadow = False
      Style.TextColor = clRed
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      AnchorX = 119
    end
    object btnCancelar: TcxButton
      Left = 144
      Top = 37
      Width = 110
      Height = 25
      Cancel = True
      Caption = 'Cancelar impress'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
    object btnContinuar: TcxButton
      Left = 2
      Top = 35
      Width = 113
      Height = 25
      Caption = 'Continuar'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000300040000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000006B00C9000A
        0011000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000129222F01388
        24E20012001D0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000007000C00000000118C1FF146CC
        7DFF179028EC001B002B00000000000000000000000000000000000000000000
        00000D781AEE168F2AFF158E27FF158F28FF178E28FF178E27FF209D37FF4FEB
        85FF49CE7AFF1C9832F30027003C000000000000000000000000000000000000
        0000168A23F544E27EFF42DD78FF46E07BFF49E37EFF4BE681FF4BE681FF4DE7
        81FF51EE86FF4FD580FF22A03BF8003700500000000000000000000000000000
        0000148921F651E185FF40DA73FF43DD76FF46E079FF49E27CFF4CE680FF50E9
        83FF52EC85FF57F38CFF56DF89FF2CA948FC0046016700000000000000000000
        0000148B21F861E791FF3BDB70FF43DF77FF45E27AFF48E57DFF4CE880FF51EB
        85FF55EF88FF5AF38DFF67FFA0FF35C054FD024B036C00000000000000000000
        0000168F25F88CF5B4FF6AEA98FF73EE9FFF77F1A3FF7BF3A5FF7EF4A7FF67F2
        96FF59F58EFF67FFA0FF36D054FA003C00550000000000000000000000000000
        0000128B21F02BAB43FF2BAB40FF2EAD44FF2FB145FF2EAF44FF41BD58FF7AFA
        A7FF67FFA1FF2FC249F4002B003F000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000219C2CF274FF
        B1FF27B53BEE001F002E00000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001FAB31F021AB
        34E4001500200000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000007300B1000C
        0013000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000400050000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 112
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 4144959
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clGray
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
  end
  object dsTipo: TDataSource
    DataSet = mtTipo
    Left = 104
    Top = 171
  end
  object mtTipo: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'mtProdIndex1'
        Fields = 'ID'
      end>
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
    Left = 136
    Top = 171
    object mtTipoImg: TIntegerField
      FieldName = 'Img'
    end
    object mtTipoDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object mtTipoDescr2: TStringField
      FieldName = 'Descr2'
      Size = 30
    end
    object mtTipoID: TIntegerField
      FieldName = 'ID'
    end
    object mtTipoValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
end
