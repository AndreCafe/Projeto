inherited fbProdutos: TfbProdutos
  Left = 252
  Top = 186
  Caption = 'fbProdutos'
  ClientHeight = 360
  ClientWidth = 746
  OldCreateOrder = True
  ExplicitWidth = 762
  ExplicitHeight = 396
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 746
    Height = 360
    ExplicitWidth = 746
    ExplicitHeight = 360
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 746
      Height = 60
      ExplicitWidth = 746
      ExplicitHeight = 60
    end
    object Grid: TcxGrid
      Left = 0
      Top = 131
      Width = 746
      Height = 229
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ExplicitTop = 129
      ExplicitHeight = 231
      object TV: TcxGridDBTableView
        OnDblClick = cmEditarClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'Codigo'
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            Column = TVPrecoTotal
          end
          item
            Format = '0.00'
            Kind = skSum
            Column = TVCustoTotal
          end>
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
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVDescricao: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 40
          Properties.ReadOnly = True
          SortIndex = 0
          SortOrder = soAscending
          Width = 206
        end
        object TVCodigo: TcxGridDBColumn
          DataBinding.FieldName = 'Codigo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 15
          Properties.ReadOnly = True
          Options.Grouping = False
        end
        object TVEstoqueAtual: TcxGridDBColumn
          Caption = 'Estoque'
          DataBinding.FieldName = 'EstoqueAtual'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 88
        end
        object TVPreco: TcxGridDBColumn
          DataBinding.FieldName = 'Preco'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Nullable = False
          Properties.ReadOnly = True
        end
        object TVCustoUnitario: TcxGridDBColumn
          Caption = 'Custo Unit'#225'rio'
          DataBinding.FieldName = 'CustoUnitario'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Nullable = False
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          VisibleForCustomization = False
          Width = 88
        end
        object TVCustoTotal: TcxGridDBColumn
          Caption = 'Custo Total'
          DataBinding.FieldName = 'CustoTotal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          VisibleForCustomization = False
          Width = 81
        end
        object TVPrecoTotal: TcxGridDBColumn
          Caption = 'Pre'#231'o Total'
          DataBinding.FieldName = 'PrecoTotal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          VisibleForCustomization = False
          Width = 81
        end
        object TVCategoria: TcxGridDBColumn
          DataBinding.FieldName = 'Categoria'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 20
          Properties.ReadOnly = True
        end
        object TVFidelidade: TcxGridDBColumn
          AlternateCaption = 'Pr'#234'mio Fidelidade ?'
          Caption = 'Pr'#234'mio ?'
          DataBinding.FieldName = 'Fidelidade'
          RepositoryItem = Dados.erSimNao
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000098CD290085BBA70082B7E7007EB3ED0078
            ABBA007DB5450000000000000000000000000000000000000000000000000000
            0000000000000000000000AAE248069CCEF42AC6EAFF4BE5FFFF4BE5FFFF0EB3
            E1FF0084B8FD0083BD6E00000000000000000000000000000000000000000000
            00000000000000B6F81B08A7D7F14DE9FFFF34CAECFF25B3DAFF20ADD6FF52CA
            E1FF36DCFDFF007FB5FB0089C12A000000000000000000000000000000000000
            00000000000000B3EA7F39D2F3FF1DC3EDFF2BC0E5FF4BE6FFFF32DFFFFF18AC
            D7FF2FB1D4FF08ABDBFF0083BA87000000000000000000000000000000000000
            00000000000000B9F2AC43DFFCFF2AD7FEFF43D6F3FF57EAFFFF42E4FFFF1CC1
            EBFF73ECF9FF20C5EDFF0085BFAB000000000000000000000000000000000000
            00000000000000BFF89F42DEFBFF10C6F3FF4EDCF5FF68EFFFFF52E9FFFF24C6
            EDFF28B1D7FF1CC0EAFF008DC794000000000000000000000000000000000000
            00000000000000C8FC5532D1F2FF26DBFFFF15CBF7FF45D7F5FF34CFF2FF36CC
            EFFF5FF2FFFF03A0D1FE009DD742000000000000000000000000000000000000
            0000000000000089FF0200BEEDB941DAF7FF2ED9FEFF28D7FEFF37DCFEFF45DE
            FBFF18B8E2FF00A3D8A000000000000000000000000000000000000000000000
            0000000000000000000000CAFF0A00BFF79B0DC8F7FA26D2FAFF20CCF6FF00B2
            E8ED00A8E37C0058BF0300000000000000000000000000000000000000000000
            0000000000000000000000000000A8615D3982585ACF646871FF665662FF8130
            39D7256C0E500000000000000000000000000000000000000000000000000000
            00000000000000000000B67F7F48A36E6DF9BE7876FFC47378FF5D8F47FF0D96
            15FF0E7A15FE088A185E00000000000000000000000000000000000000000000
            000000000000C1C9C903B07B7AE1DA8786FFD58183FFAA8670FF07B529FF11AD
            25FF0B9B16FF0B7F17EB00680008000000000000000000000000000000000000
            000000000000CA909031CB8C89FFF39091FFE9888BFF939A6BFF12BA38FF18B3
            31FF14B129FF0B8516FF0F901D3A000000000000000000000000000000000000
            000000000000D59E9E23C28F8EECBB8986F9B57F7EF8A07B71F5339F48F31BA1
            3AF1189B32F1149229DA108D2021000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          HeaderGlyphAlignmentHorz = taCenter
          Width = 76
        end
        object TVFidPontos: TcxGridDBColumn
          AlternateCaption = 'Pontos necess'#225'rios'
          Caption = 'Pontos Nec.'
          DataBinding.FieldName = 'FidPontos'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000098CD290085BBA70082B7E7007EB3ED0078
            ABBA007DB5450000000000000000000000000000000000000000000000000000
            0000000000000000000000AAE248069CCEF42AC6EAFF4BE5FFFF4BE5FFFF0EB3
            E1FF0084B8FD0083BD6E00000000000000000000000000000000000000000000
            00000000000000B6F81B08A7D7F14DE9FFFF34CAECFF25B3DAFF20ADD6FF52CA
            E1FF36DCFDFF007FB5FB0089C12A000000000000000000000000000000000000
            00000000000000B3EA7F39D2F3FF1DC3EDFF2BC0E5FF4BE6FFFF32DFFFFF18AC
            D7FF2FB1D4FF08ABDBFF0083BA87000000000000000000000000000000000000
            00000000000000B9F2AC43DFFCFF2AD7FEFF43D6F3FF57EAFFFF42E4FFFF1CC1
            EBFF73ECF9FF20C5EDFF0085BFAB000000000000000000000000000000000000
            00000000000000BFF89F42DEFBFF10C6F3FF4EDCF5FF68EFFFFF52E9FFFF24C6
            EDFF28B1D7FF1CC0EAFF008DC794000000000000000000000000000000000000
            00000000000000C8FC5532D1F2FF26DBFFFF15CBF7FF45D7F5FF34CFF2FF36CC
            EFFF5FF2FFFF03A0D1FE009DD742000000000000000000000000000000000000
            0000000000000089FF0200BEEDB941DAF7FF2ED9FEFF28D7FEFF37DCFEFF45DE
            FBFF18B8E2FF00A3D8A000000000000000000000000000000000000000000000
            0000000000000000000000CAFF0A00BFF79B0DC8F7FA26D2FAFF20CCF6FF00B2
            E8ED00A8E37C0058BF0300000000000000000000000000000000000000000000
            0000000000000000000000000000A8615D3982585ACF646871FF665662FF8130
            39D7256C0E500000000000000000000000000000000000000000000000000000
            00000000000000000000B67F7F48A36E6DF9BE7876FFC47378FF5D8F47FF0D96
            15FF0E7A15FE088A185E00000000000000000000000000000000000000000000
            000000000000C1C9C903B07B7AE1DA8786FFD58183FFAA8670FF07B529FF11AD
            25FF0B9B16FF0B7F17EB00680008000000000000000000000000000000000000
            000000000000CA909031CB8C89FFF39091FFE9888BFF939A6BFF12BA38FF18B3
            31FF14B129FF0B8516FF0F901D3A000000000000000000000000000000000000
            000000000000D59E9E23C28F8EECBB8986F9B57F7EF8A07B71F5339F48F31BA1
            3AF1189B32F1149229DA108D2021000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          HeaderGlyphAlignmentHorz = taCenter
          Width = 95
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object PB: TcxProgressBar
      Left = 0
      Top = 110
      Align = alTop
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = FrmPri.cxEditStyleController1
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Visible = False
      ExplicitTop = 108
      Width = 746
    end
    object panMostrar: TPanel
      Left = 0
      Top = 60
      Width = 746
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object panBusca: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 746
        Height = 50
        Align = alClient
        Bevel.BorderSides = [fsTop]
        Bevel.Mode = bmEdge
        TabOrder = 0
        object btnAchar: TPngSpeedButton
          Left = 270
          Top = 4
          Width = 45
          Height = 42
          AllowAllUp = True
          GroupIndex = 44
          Enabled = False
          Flat = True
          OnClick = btnAcharClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
            F40000002D744558744372656174696F6E2054696D65006A65752E20352064E9
            632E20323030322031323A32313A3130202B30313030603BD286000000077449
            4D45000000000000000973942E000000097048597300000AF000000AF00142AC
            34980000069D4944415478DAED560B4C9565187EFE73403807385C0F1C8344BC
            808488C8044131D3A8405AE95A466BD15AD42A37EFABD948A9AC558AB932BB8C
            6AD56A79C30CA42C4D5D4A016A2086010107040E713FE7C0B9724ECFF743662E
            4B5BABB5F96FCFFE73FEEFF23EEFFB3EEFFB7D12FEE347BA46E0FF4A4049B8C6
            7EBBFF2D02D2AA55ABD2CD66F3F34AA532C16AB5B67476766E27BEAEA9A969E1
            B8FDEF90B940203B3BDB232A2A6AAA42A1306FDBB6AD73FDFAF501030303A90E
            8723D162B14CB7D96C712693295AA552798C1B370E1E1E1E18191981C1607091
            4CD9F0F0F0B32452C3ADAC57434426B066CD9AC55D5D5D3B683C82C6DC34502F
            49D2149D4EE7E1EFEF8F808000F8F9F94118E677B8DDBFEDEFEDED8D8A8A0A94
            96960E73EC4D46E495EEEE6E03871C5742445AB66C59323D39161414E4D5D8D8
            88E9D3A763D1A245183F7E3C86868664D8ED76D043F9CD888C2E241111059286
            AFAFAFFCBBA4A4449069618A369D3E7D7A37A79988913F25909595B5975E2ED1
            EBF558BB762D66CF9E8D8E8E8E0B06055C2E978C5F0D33E4607A60341A414DC8
            E8EBEB93E7343737A3ADADCDCD541DA663CFD5D7D7577099E572D1903232329A
            B8304A185EB060811C6AB55A2D1B11DE8A10F7F7F7A3B6B6164C938C9E9E1E99
            1835211B8D8C8CC4E4C99391909080F0F0703005A8ABABC38E1D3BEC4CDB474C
            D9D69696967ADAB35D4A444A4F4FAF763A9D335252522E2CCECCCC444848881C
            D6EDDBB7A3A9A909F1F1F1387AF4A8FC8DDA8046A3C1E0E0A04C5068AFA8A808
            3367CE84A7A7E7EF3CDCBAB510870E1D3407076BDF696D3DFFDA9123475A2FAE
            18292D2D2D9F9E3E336FDE3C141616A2B8B85836989898888D1B37CA64962F5F
            2E4746E8A1A0E019949797C3C7470DAE952BA1AAAA4A26B561C306D019040606
            CAA8AEAEC4C12F8EC33CEC85DE9E76386DED0303A6E1273EF964E72EDA360A7D
            882A0865E85F67392D5DBD7AB594979787152B56A0A1A14116634E4E8EEC95A8
            06510582F8B6AD5BD0DBDB439DD8B9F910F4FA56787979C904444A42B55A6AA4
            1BC5FBAB30397616E2664C85531580AFBF3C84CA92424BE5A91FF29892CFB959
            9F20E04144A6A6A6E633EFF7B317483E3E3EB2C0D6AD5B27879C82425858180D
            3561CFDECF617585C15B1D80BEEE9FE018ACC5C9EAB3C8CD7D00B1B1B132111F
            B537EAEBDB113235158BE74E90CBA0A51F30FB026F3FF5342A8F94EDABA8AC7A
            919FAB7F6D445EC4F514E21A7AFA083D95A2A3A321D222080404042228D0179F
            1DF816E1939290911E07D61E8CA4BEAB680FCAF7BF8A60DD04DC9E9D0D855209
            0FB7136D561DB296DC0815336D63C67BD99E0668A4F64425766D7EB4F9C47727
            9FE3DFD28B5BB1504F447272F2727AB192DE2866CD9A25873D3838100EBB031D
            D649C85D96040D67760E010656B9D51F78E9EE4C34EBDB11CF2A109A31F577C2
            F386FB11374D0BA5938706AD18A9FF41BE7FFEB10EEFE7E7FCFCEDC9EAD768EF
            834BCF02918E701ACE631A9E9C3F7FBE920D0ABAD02034195CB8E5DE07A1558F
            CAD74AAF7A58DD161550B2B9008D35C7D1D3DBCF6A998184E88940CA0A5C1FA1
            81C4F6217181956F2361AED88BF7B63C75E6CC0FE73EE536EFFED1612448E818
            811C96DAB30B172EF49A18118A6E650CD2EEC884D2363AC1CEC41A1DA304BE79
            E3051CDC5D74B8B5ADFD7C5C5C5C4C6A4A628A665A2626A42F858B55225AB7DD
            62C788C585F3FB57626771D91E36BB4A6EF3F1E54E436143CBBABE8F4D695366
            C68D9E4EDD5CDC70EB6248F49ADD573E8B87185E0BBDAB7AE91E7CF6C5E10FD9
            437E64C5346565DDF658A8463557774B01142AE6C86987DBE9C624E73778F9E5
            4D7DE7CE35EC63F97EC52D0EFED9712CCEFC90A4A4A487A6C544176843AF534E
            C9DD2C2B4A522831E270C262B623C4D981B7F297DA4F9D69789FFDA48C6B2A28
            E4F173E6CCD912E4A3488F88BB09C141C118EE3C8BBD070E98F4FAF67DECA0CD
            9C574CD4FDD57D4090D0520B8FC74E8D5CAF9E74B3C27FDA62C6DF08BB438150
            B513E7CAF251F6D589529E257522A4C45942C1484C8989897958E3AB4AB3D8EC
            AA8101630BC36EE0B1DEC1F1A38448C1E0955C480489B0254BEE5CEBE9B2AD0C
            8F4E96B49109F0761BF1FDF1621C2BFFBEAAB5ADED0C1BD031CE13CDA56BACCD
            7A8BAA226610516355D63546B011A355E9BAD21B912C4CB6E75C3F1FF55D5C37
            D16436F57475F59EEA34188C1499B8881C1ADBD87EC93A0DA11651C1E865C584
            8B2E2D577325139B8511F1043B1102850EC78C0A02FAB18DFFE8B9D88EFB7203
            57F28874B0A1C20FA3DDD339E69180E32AF7FA5B04FED2A37F8BC03FF65C2370
            8DC02F9622F3DB227A00510000000049454E44AE426082}
        end
        object rgCod: TcxRadioButton
          Left = 143
          Top = 5
          Width = 54
          Height = 17
          Caption = 'C'#243'&digo'
          TabOrder = 0
          OnClick = rgCodClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
        end
        object rgNome: TcxRadioButton
          Left = 68
          Top = 5
          Width = 65
          Height = 17
          Caption = '&Descri'#231#227'o'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = rgCodClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
        end
        object lbBusca: TcxLabel
          Left = 7
          Top = 4
          Caption = 'Busca por:'
        end
        object edBusca: TcxMaskEdit
          Left = 8
          Top = 23
          Properties.MaskKind = emkRegExpr
          Properties.MaxLength = 0
          Properties.OnChange = edBuscaPropertiesChange
          Style.BorderStyle = ebsOffice11
          Style.Color = clGray
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clWhite
          Style.TextStyle = [fsBold]
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.Color = 9855796
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleFocused.TextColor = clWhite
          StyleFocused.TextStyle = [fsBold]
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          OnKeyUp = edBuscaKeyUp
          Width = 255
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    LookAndFeel.Kind = lfStandard
    Style = bmsUseLookAndFeel
    Left = 168
    Top = 136
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          Visible = True
          ItemName = 'cmApagar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmEstoque'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'beiMostrarFin'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAtualizar'
        end
        item
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmLayout'
        end>
    end
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      OnClick = cmApagarClick
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
    end
    inherited cmExportar: TdxBarLargeButton
      LargeImageIndex = 47
      ShowCaption = False
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 7
      ShowCaption = False
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmReprocessar: TdxBarButton
      Caption = 'Reprocessar Estoque'
      Category = 0
      Hint = 'Reprocessar Estoque'
      Visible = ivAlways
      OnClick = cmReprocessarClick
    end
    object cmVendaAvulsa: TdxBarLargeButton
      Caption = '&Venda Avulsa'
      Category = 0
      Hint = 'Venda Avulsa'
      Visible = ivAlways
      LargeImageIndex = 12
      OnClick = cmVendaAvulsaClick
      AutoGrayScale = False
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmEstoque: TdxBarLargeButton
      Caption = 'Mov. Estoque'
      Category = 0
      Hint = 
        'Movimentar Estoque: Venda, Compra, Entrada e Sa'#237'da de Produtos d' +
        'o Estoque'
      Visible = ivAlways
      LargeImageIndex = 10
      OnClick = cmEstoqueClick
      AutoGrayScale = False
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmCompra: TdxBarButton
      Caption = 'Compra'
      Category = 0
      Hint = 'Compra'
      Visible = ivAlways
      OnClick = cmCompraClick
    end
    object cmEntrada: TdxBarButton
      Caption = 'Ajuste de Estoque - Entrada'
      Category = 0
      Hint = 'Ajuste de Estoque - Entrada'
      Visible = ivAlways
      OnClick = cmEntradaClick
    end
    object cmSaida: TdxBarButton
      Caption = 'Ajuste de Estoque - Sa'#237'da'
      Category = 0
      Hint = 'Ajuste de Estoque - Sa'#237'da'
      Visible = ivAlways
      OnClick = cmSaidaClick
    end
    object beiMostrarFin: TcxBarEditItem
      Caption = 'Mostrar Informa'#231#245'es Financeiras'
      Category = 0
      Hint = 'Mostrar Informa'#231#245'es Financeiras'
      Visible = ivAlways
      ShowCaption = True
      Width = 25
      OnClick = beiMostrarFinClick
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.MultiLine = True
      Properties.OnEditValueChanged = beiMostrarFinClick
      InternalEditValue = False
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 32
    Top = 73
  end
  object Tab: TnxTable
    Database = Dados.db
    Timeout = 10000
    OnCalcFields = TabCalcFields
    TableName = 'Produto'
    IndexName = 'IDescricao'
    Left = 56
    Top = 88
    object TabCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Size = 15
    end
    object TabUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object TabPreco: TCurrencyField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
    end
    object TabObs: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object TabEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object TabCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object TabEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object TabEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object TabEstoqueFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoqueFinal'
      Calculated = True
    end
    object TabDescricao: TStringField
      FieldName = 'Descricao'
      Size = 55
    end
    object TabCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object TabSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object TabPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object TabNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabPrecoTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PrecoTotal'
      Calculated = True
    end
    object TabCustoTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CustoTotal'
      Calculated = True
    end
    object TabFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object TabFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 104
    Top = 88
  end
  object pmEstoque: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmVendaAvulsa'
      end
      item
        Visible = True
        ItemName = 'cmCompra'
      end
      item
        Visible = True
        ItemName = 'cmEntrada'
      end
      item
        Visible = True
        ItemName = 'cmSaida'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmReprocessar'
      end>
    UseOwnFont = False
    Left = 248
    Top = 130
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 200
    Top = 264
  end
end
