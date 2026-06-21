inherited fbProdutos: TfbProdutos
  Left = 252
  Top = 186
  Caption = 'fbProdutos'
  ClientHeight = 466
  ClientWidth = 1192
  Font.Height = -13
  OldCreateOrder = True
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 1200
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 16
  inherited panPri: TParentedPanel
    Width = 1192
    Height = 466
    ParentFont = True
    ExplicitWidth = 1192
    ExplicitHeight = 466
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 1192
      Height = 76
      ExplicitWidth = 1192
      ExplicitHeight = 76
    end
    object Grid: TcxGrid
      Left = 0
      Top = 76
      Width = 1192
      Height = 369
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = 8553090
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object TVprod: TcxGridDBTableView
        OnDblClick = cmEditarClick
        OnKeyDown = TVprodKeyDown
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'ID'
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            Column = TVprodPrecoTotal
          end
          item
            Format = '0.00'
            Kind = skSum
            Column = TVprodCustoTotal
          end
          item
            Format = '0'
            Kind = skSum
            Column = TVprodEstoqueAtual
          end
          item
            Format = '0 itens'
            Kind = skCount
            Column = TVDescr
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
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.GridLineColor = 16053492
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.Column = TVprodObs
        Preview.Visible = True
        OnColumnHeaderClick = TVprodColumnHeaderClick
        OnCustomDrawColumnHeader = TVprodCustomDrawColumnHeader
        OnCustomDrawIndicatorCell = TVprodCustomDrawIndicatorCell
        object TVprodID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
        end
        object TVDescr: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'Descricao'
          PropertiesClassName = 'TcxTextEditProperties'
          OnGetDisplayText = TVDescrGetDisplayText
          Width = 273
        end
        object TVprodDescr: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'xxx'
              ImageIndex = 83
              Value = 'web/plus'
            end>
          Visible = False
          SortIndex = 0
          SortOrder = soAscending
          VisibleForCustomization = False
          Width = 206
        end
        object TVprodCodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'Codigo'
        end
        object TVprodEstoqueAtual: TcxGridDBColumn
          Caption = 'Estoque'
          DataBinding.FieldName = 'EstoqueAtual'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object TVprodPreco: TcxGridDBColumn
          DataBinding.FieldName = 'Preco'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Nullable = False
          Properties.ReadOnly = True
          Width = 109
        end
        object TVprodCustoUnitario: TcxGridDBColumn
          Caption = 'Custo Unit'#225'rio'
          DataBinding.FieldName = 'CustoUnitario'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Nullable = False
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Styles.Content = cxStyle1
          VisibleForCustomization = False
          Width = 91
        end
        object TVprodCustoTotal: TcxGridDBColumn
          Caption = 'Custo Total'
          DataBinding.FieldName = 'CustoTotal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Styles.Content = cxStyle1
          VisibleForCustomization = False
          Width = 91
        end
        object TVprodPrecoTotal: TcxGridDBColumn
          Caption = 'Pre'#231'o Total'
          DataBinding.FieldName = 'PrecoTotal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Styles.Content = cxStyle1
          VisibleForCustomization = False
          Width = 84
        end
        object TVprodCategoria: TcxGridDBColumn
          DataBinding.FieldName = 'Categoria'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 20
          Properties.ReadOnly = True
        end
        object TVprodUnid: TcxGridDBColumn
          DataBinding.FieldName = 'Unid'
          Width = 78
        end
        object TVprodFornecedor: TcxGridDBColumn
          Caption = 'Fornecedor'
          DataBinding.FieldName = 'NomeFor'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.GridMode = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'Nome'
            end>
          Width = 189
        end
        object TVprodEstoqueMin: TcxGridDBColumn
          Caption = 'Estoque Min.'
          DataBinding.FieldName = 'EstoqueMin'
          PropertiesClassName = 'TcxMaskEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object TVprodEstoqueMax: TcxGridDBColumn
          Caption = 'Estoque Max.'
          DataBinding.FieldName = 'EstoqueMax'
          PropertiesClassName = 'TcxMaskEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object TVprodAbaixoMin: TcxGridDBColumn
          Caption = 'Abaixo Min.'
          DataBinding.FieldName = 'AbaixoMin'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Sem m'#237'nimo'
              ImageIndex = 0
            end
            item
              Description = 'N'#227'o'
              Value = False
            end
            item
              Description = 'Sim'
              Value = True
            end>
          OnCustomDrawCell = TVprodAbaixoMinCustomDrawCell
          OnGetDisplayText = TVprodAbaixoMinGetDisplayText
          Width = 77
        end
        object TVprodRepor: TcxGridDBColumn
          Caption = 'Repor'
          DataBinding.FieldName = 'EstoqueRepor'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Width = 75
        end
        object TVprodFidelidade: TcxGridDBColumn
          AlternateCaption = 'Pr'#234'mio Fidelidade ?'
          Caption = 'Pr'#234'mio ?'
          DataBinding.FieldName = 'Fidelidade'
          RepositoryItem = Dados.erSimNao
          HeaderAlignmentHorz = taCenter
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
        object TVprodFidPontos: TcxGridDBColumn
          AlternateCaption = 'Pontos necess'#225'rios'
          Caption = 'Pontos Nec.'
          DataBinding.FieldName = 'FidPontos'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
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
        object TVprodObs: TcxGridDBColumn
          DataBinding.FieldName = 'Obs'
        end
      end
      object GL: TcxGridLevel
        GridView = TVprod
      end
    end
    object PB: TcxProgressBar
      Left = 0
      Top = 445
      Align = alBottom
      ParentFont = False
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
      Width = 1192
    end
    object panBusca2: TLMDSimplePanel
      AlignWithMargins = True
      Left = 8
      Top = 219
      Width = 305
      Height = 32
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 4
      Bevel.BorderColor = clBtnShadow
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      Color = clWhite
      TabOrder = 3
      OnEnter = edBuscaEnter
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 34
        Height = 32
        Cursor = crHandPoint
        Align = alLeft
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
          000000180806000000E0773DF8000000017352474200AECE1CE9000000046741
          4D410000B18F0BFC6105000000206348524D00007A26000080840000FA000000
          80E8000075300000EA6000003A98000017709CBA513C00000009704859730000
          0B0500000B0501C98DC849000001B449444154484BAD95494B0341108567A211
          8C2108897A1335A226E8C1837B8C0BAE2022220A2E3988FA83FD1D1EBC7B18DF
          1B3AF2D2F6744F8C8147323D55F555575757E2244922D7278EE371AC4F400B50
          197A873EA04FF87C399D5C8B04A86033099D42CFD09BA5573C5F4173B65FD6B3
          1D7C3923B00DE2731B1A0A817E003066700DF488E75DA8012D42EBD08D65B31F
          82A400536B2DC901D6C61CE51BC6FA2AF422A0866F170C1E4327E27018CC2A8A
          56C4FE1EBF4732CF002F2B527796A514AC6B141560772190BA0F5017C3762878
          F73D7CD8BEDD336BF9001B62D8EC0350831FDB9690331F6027EF8159F7A52A80
          731F40B7BAD5C70E6625B13D1F809974DBEE0EBF8B7920B03B12C0920FC0DEBE
          14E3B51000B63392143B6FD43B2A60302DF5E4C1F132155C4E2678471222A01A
          9C4530DA1627760677D584A6204ED579E85812D1B1C2CB567326247DCDCBD3B2
          20AE2197B5E684F44C533397D855B71E104BA225F2EEE417C0408AA6D69BA62C
          9C55DC1DE12553B2878C247A76E20484BA48267010F267400E48DA5D03010210
          FE395506066440AE11BC9CBECB53EF3C36E6E09FF0CDCCD3E0FF0A303BE108AF
          6842DF8FC0F15C8A61DC610000000049454E44AE426082}
        OnClick = Image1Click
        ExplicitLeft = -8
        ExplicitTop = -3
      end
      object edBusca: TcxMaskEdit
        AlignWithMargins = True
        Left = 37
        Top = 3
        Align = alClient
        ParentFont = False
        Properties.MaskKind = emkRegExpr
        Properties.MaxLength = 0
        Properties.OnChange = edBuscaPropertiesChange
        Style.BorderStyle = ebsNone
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clBlack
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.BorderStyle = ebsNone
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.TextColor = clBlue
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnEnter = edBuscaEnter
        OnKeyDown = edBuscaKeyDown
        OnKeyUp = edBuscaKeyUp
        OnMouseUp = edBuscaMouseUp
        Width = 265
      end
      object lbLocalizar: TcxLabel
        Left = 43
        Top = 7
        Cursor = crHandPoint
        AutoSize = False
        Caption = 'Localizar produto por c'#243'digo ou descri'#231#227'o'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clSilver
        Style.IsFontAssigned = True
        StyleFocused.TextColor = clBlue
        Transparent = True
        OnClick = Image1Click
        Height = 17
        Width = 252
      end
    end
  end
  inherited BarMgr: TdxBarManager
    MenusShowRecentItemsFirst = False
    ShowFullMenusAfterDelay = False
    UseSystemFont = False
    Left = 168
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
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
          ItemName = 'cmEntrada'
        end
        item
          Visible = True
          ItemName = 'cmSaida'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'cmCfg'
        end>
      UseOwnFont = True
      UseRestSpace = True
    end
    object BarMgrBar2: TdxBar [1]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Busca'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 42
      FloatLeft = 555
      FloatTop = 0
      FloatClientWidth = 305
      FloatClientHeight = 60
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmBusca'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmExibir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmObs'
        end
        item
          Visible = True
          ItemName = 'cmFerramentas'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 1
      UseOwnFont = True
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
      GlyphLayout = glTop
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      GlyphLayout = glTop
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      OnClick = cmApagarClick
      GlyphLayout = glTop
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
      Caption = '&Imprimir lista de produtos'
      Hint = 'Imprimir lista de produtos'
      LargeImageIndex = 7
      ShowCaption = False
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmCfg: TdxBarLargeButton
      Align = iaRight
      OnClick = cmCfgClick
    end
    object cmReprocessar: TdxBarButton
      Caption = 'Reprocessar Estoque'
      Category = 0
      Hint = 'Reprocessar Estoque'
      Visible = ivAlways
      OnClick = cmReprocessarClick
    end
    object cmVendaAvulsa: TdxBarLargeButton
      Caption = 'Venda'
      Category = 0
      Hint = 'Venda'
      Visible = ivAlways
      LargeImageIndex = 10
      OnClick = cmVendaAvulsaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmEntrada: TdxBarLargeButton
      Caption = 'Entrada de Estoque'
      Category = 0
      Hint = 'Entrada de Estoque'
      Visible = ivAlways
      LargeImageIndex = 76
      OnClick = cmEntradaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmSaida: TdxBarLargeButton
      Caption = 'Sa'#237'da de Estoque'
      Category = 0
      Hint = 'Sa'#237'da de Estoque'
      Visible = ivAlways
      LargeImageIndex = 78
      OnClick = cmSaidaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCompra: TdxBarLargeButton
      Caption = 'Compra'
      Category = 0
      Hint = 'Compra'
      Visible = ivAlways
      LargeImageIndex = 77
      OnClick = cmCompraClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmFerramentas: TdxBarSubItem
      Align = iaRight
      Caption = 'Ferramentas'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmReprocessar'
        end>
    end
    object cmBusca: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = panBusca2
    end
    object cmObs: TdxBarButton
      Caption = 'Mostrar Observa'#231#245'es'
      Category = 0
      Hint = 'Mostrar Observa'#231#245'es'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 76
      OnClick = cmObsClick
    end
    object cmExibir: TdxBarSubItem
      Caption = 'Exibir: Todos produtos'
      Category = 0
      Style = cxStyle3
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'rgTodos'
        end
        item
          Visible = True
          ItemName = 'cmAbaixoMin'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmMostrarFin'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmObs'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'rgCodigo'
        end
        item
          Visible = True
          ItemName = 'rgNome'
        end>
    end
    object rgTodos: TdxBarButton
      Caption = 'Todos produtos'
      Category = 0
      Hint = 'Todos produtos'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Down = True
      OnClick = rgTodosClick
    end
    object cmAbaixoMin: TdxBarButton
      Caption = 'Produtos com estoque abaixo do m'#237'nimo'
      Category = 0
      Hint = 'Produtos com estoque abaixo do m'#237'nimo'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000001E71799132BDCAF833C2D0FF33C2D0FF31BC
        C9F71D6D758D0000000000000000000000000000000000000000000000000000
        0000000000000E33374332BECCFF32BECCFF32BECCFF32BECCFF12B4C4FF32BE
        CCFF32BECCFF32BECCFF0C2E313D000000000000000000000000000000000000
        00000E33374332BECCFF32BECCFF32BECCFF32BECCFF12B4C4FF12B4C4FF32BE
        CCFF32BECCFF32BECCFF32BECCFF0C2D303B0000000000000000000000000000
        000032BECCFF32BECCFF32BECCFF32BECCFF12B4C4FFFFFFFFFFFFFFFFFF12B4
        C4FF32BECCFF32BECCFF32BECCFF32BECCFF0000000000000000000000001D70
        778F32BECCFF32BECCFF32BECCFF32BECCFF12B4C4FFFFFFFFFFFFFFFFFF12B4
        C4FF32BECCFF32BECCFF32BECCFF32BECCFF1C686F88000000000000000031BC
        C9F732BECCFF32BECCFF32BECCFF32BECCFF32BECCFF07B1C1FF07B1C1FF32BE
        CCFF32BECCFF32BECCFF32BECCFF32BECCFF2FB1BEEE000000000000000033C2
        D0FF32BECCFF32BECCFF32BECCFF32BECCFF27BBC8FF7ED4DEFF7ED4DEFF27BB
        C8FF32BECCFF32BECCFF32BECCFF32BECCFF32BECCFF000000000000000033C2
        D0FF32BECCFF32BECCFF32BECCFF32BECCFF16B4C4FFFDFDFEFFFDFDFEFF16B4
        C4FF32BECCFF32BECCFF32BECCFF32BECCFF32BECCFF000000000000000031BC
        C9F732BECCFF32BECCFF32BECCFF32BECCFF15B4C4FFFFFFFFFFFFFFFFFF15B4
        C4FF32BECCFF32BECCFF32BECCFF32BECCFF2FB1BEEE00000000000000001D6D
        758D32BECCFF32BECCFF32BECCFF32BECCFF12B4C4FFFFFFFFFFFFFFFFFF12B4
        C4FF32BECCFF32BECCFF32BECCFF32BECCFF1B676F8800000000000000000000
        000032BECCFF32BECCFF32BECCFF32BECCFF11B3C3FFFFFFFFFFFFFFFFFF11B3
        C3FF32BECCFF32BECCFF32BECCFF32BECCFF0000000000000000000000000000
        00000D33364332BECCFF32BECCFF32BECCFF12B4C4FFFFFFFFFFFFFFFFFF12B4
        C4FF32BECCFF32BECCFF32BECCFF0C2C2F3B0000000000000000000000000000
        0000000000000E34384532BECCFF32BECCFF32BECCFF12B4C4FF12B4C4FF32BE
        CCFF32BECCFF32BECCFF0C2E323E000000000000000000000000000000000000
        00000000000000000000000000001D6E769131B9C6F832BECCFF32BECCFF30B7
        C5F61C6D748F0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ImageIndex = 53
      OnClick = cmAbaixoMinClick
    end
    object cmMostrarFin: TdxBarButton
      Caption = 
        'Mostrar informa'#231#245'es financeiras (Custo Total e Pre'#231'o Total em Es' +
        'toque)'
      Category = 0
      Hint = 
        'Mostrar informa'#231#245'es financeiras (Custo Total e Pre'#231'o Total em Es' +
        'toque)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = cmMostrarFinClick
    end
    object rgCodigo: TdxBarButton
      Caption = 'Ordenar por c'#243'digo'
      Category = 0
      Hint = 'Ordenar por c'#243'digo'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 11
      OnClick = rgCodigoClick
    end
    object rgNome: TdxBarButton
      Caption = 'Ordenar por descri'#231#227'o'
      Category = 0
      Hint = 'Ordenar por descri'#231#227'o'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 11
      Down = True
      OnClick = rgCodigoClick
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 32
    Top = 73
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 552
    Top = 82
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 224
    Top = 188
  end
  object Tab: TnxTable
    Database = Dados.db
    Timeout = 10000
    Filter = '(plus <> true)'
    Filtered = True
    OnCalcFields = TabCalcFields
    TableName = 'Produto'
    IndexName = 'IDescricao'
    Left = 48
    Top = 152
    object TabID: TAutoIncField
      FieldName = 'ID'
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
      Size = 100
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
    object TabPermiteVendaFracionada: TBooleanField
      FieldName = 'PermiteVendaFracionada'
    end
    object TabNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
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
    object TabEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object TabFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object TabEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object TabEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object TabAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object TabAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object TabNomeFor: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFor'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Fornecedor'
      Lookup = True
    end
    object Tabplus: TBooleanField
      FieldName = 'plus'
    end
    object TabplusURL: TnxMemoField
      FieldName = 'plusURL'
      BlobType = ftMemo
    end
    object TabplusCodParceiro: TStringField
      FieldName = 'plusCodParceiro'
      Size = 15
    end
    object TabplusCodProduto: TStringField
      FieldName = 'plusCodProduto'
      Size = 15
    end
    object TabAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object TabCadastroRapido: TBooleanField
      FieldName = 'CadastroRapido'
    end
    object Tabmd5Imagem: TStringField
      FieldName = 'md5Imagem'
      Size = 32
    end
    object TablastProdModif: TDateTimeField
      FieldName = 'lastProdModif'
    end
    object TabIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object TabPrecoAuto: TBooleanField
      FieldName = 'PrecoAuto'
    end
    object TabMargem: TFloatField
      FieldName = 'Margem'
    end
    object TabCodigo: TStringField
      FieldName = 'Codigo'
      Size = 30
    end
    object TabComissaoPerc: TFloatField
      FieldName = 'ComissaoPerc'
    end
    object TabComissaoLucro: TBooleanField
      FieldName = 'ComissaoLucro'
    end
    object TabRecVer: TIntegerField
      FieldName = 'RecVer'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 80
    Top = 168
  end
  object pmEstoque: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmReprocessar'
      end>
    UseOwnFont = False
    Left = 256
    Top = 194
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 200
    Top = 264
  end
  object pmFerramentas: TPopupMenu
    Left = 480
    Top = 192
    object ReprocessarEstoque1: TMenuItem
      Caption = 'Reprocessar Estoque'
      OnClick = ReprocessarEstoque1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 12582911
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlue
    end
  end
  object tAux: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    TableName = 'Produto'
    IndexName = 'ICodigo'
    Left = 344
    Top = 280
    object tAuxCodigo: TStringField
      FieldName = 'Codigo'
      Size = 30
    end
  end
  object TimerSelBusca: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerSelBuscaTimer
    Left = 624
    Top = 200
  end
end
