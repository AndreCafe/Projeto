inherited fbProdutos: TfbProdutos
  Left = 252
  Top = 186
  Caption = 'fbProdutos'
  ClientHeight = 466
  ClientWidth = 1041
  Font.Height = -13
  OldCreateOrder = True
  ExplicitWidth = 1049
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 16
  inherited panPri: TParentedPanel
    Width = 1041
    Height = 466
    ParentFont = True
    ExplicitWidth = 1041
    ExplicitHeight = 466
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 1041
      Height = 44
      ExplicitWidth = 1041
      ExplicitHeight = 44
    end
    object Grid: TcxGrid
      Left = 0
      Top = 104
      Width = 1041
      Height = 362
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = 8553090
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ExplicitTop = 101
      ExplicitHeight = 365
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
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.Column = TVprodObs
        Preview.Visible = True
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
          DataBinding.FieldName = 'Codigo'
        end
        object TVprodEstoqueAtual: TcxGridDBColumn
          Caption = 'Estoque'
          DataBinding.FieldName = 'EstoqueAtual'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 88
        end
        object TVprodPreco: TcxGridDBColumn
          DataBinding.FieldName = 'Preco'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Nullable = False
          Properties.ReadOnly = True
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
          Width = 88
        end
        object TVprodCustoTotal: TcxGridDBColumn
          Caption = 'Custo Total'
          DataBinding.FieldName = 'CustoTotal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Styles.Content = cxStyle1
          VisibleForCustomization = False
          Width = 81
        end
        object TVprodPrecoTotal: TcxGridDBColumn
          Caption = 'Pre'#231'o Total'
          DataBinding.FieldName = 'PrecoTotal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Styles.Content = cxStyle1
          VisibleForCustomization = False
          Width = 81
        end
        object TVprodCategoria: TcxGridDBColumn
          DataBinding.FieldName = 'Categoria'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 20
          Properties.ReadOnly = True
        end
        object TVprodFidelidade: TcxGridDBColumn
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
        object TVprodFidPontos: TcxGridDBColumn
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
        end
        object TVprodEstoqueMin: TcxGridDBColumn
          Caption = 'Estoque Min.'
          DataBinding.FieldName = 'EstoqueMin'
          PropertiesClassName = 'TcxMaskEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 79
        end
        object TVprodEstoqueMax: TcxGridDBColumn
          Caption = 'Estoque Max.'
          DataBinding.FieldName = 'EstoqueMax'
          PropertiesClassName = 'TcxMaskEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 91
        end
        object TVprodAbaixoMin: TcxGridDBColumn
          Caption = 'Abaixo Min.'
          DataBinding.FieldName = 'AbaixoMin'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
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
          Width = 66
        end
        object TVprodRepor: TcxGridDBColumn
          Caption = 'Repor'
          DataBinding.FieldName = 'EstoqueRepor'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
        end
        object TVprodObs: TcxGridDBColumn
          DataBinding.FieldName = 'Obs'
        end
        object TVprodUnid: TcxGridDBColumn
          DataBinding.FieldName = 'Unid'
          Width = 69
        end
      end
      object GL: TcxGridLevel
        GridView = TVprod
      end
    end
    object PB: TcxProgressBar
      Left = 0
      Top = 80
      Align = alTop
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
      Width = 1041
    end
    object panMostrar: TPanel
      Left = 0
      Top = 44
      Width = 1041
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object panBusca: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 1041
        Height = 36
        Align = alClient
        Bevel.BorderSides = [fsTop]
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object rgCod: TcxRadioButton
          Left = 158
          Top = 11
          Width = 60
          Height = 17
          Caption = 'C'#243'&digo'
          TabOrder = 0
          OnClick = rgCodClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
        end
        object rgNome: TcxRadioButton
          Left = 78
          Top = 10
          Width = 79
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
          Top = 7
          Caption = 'Busca por:'
        end
        object edBusca: TcxMaskEdit
          Left = 233
          Top = 6
          Properties.MaskKind = emkRegExpr
          Properties.MaxLength = 0
          Properties.OnChange = edBuscaPropertiesChange
          Style.BorderStyle = ebsFlat
          Style.Color = clWhite
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clWhite
          Style.TextStyle = [fsBold]
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.BorderStyle = ebsFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.TextColor = clBlack
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          OnKeyDown = edBuscaKeyDown
          OnKeyUp = edBuscaKeyUp
          Width = 168
        end
        object cbMostrarFin: TcxCheckBox
          Left = 427
          Top = 7
          Caption = 'Mostrar informa'#231#245'es financeiras'
          Style.BorderStyle = ebsFlat
          TabOrder = 4
          OnClick = beiMostrarFinClick
          Width = 225
        end
        object btnAchar: TcxButton
          Left = 372
          Top = 7
          Width = 24
          Height = 22
          Cursor = crHandPoint
          TabOrder = 5
          OnClick = btnAcharClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          OptionsImage.ImageIndex = 73
          OptionsImage.Images = dmImagens.im16
          SpeedButtonOptions.GroupIndex = 1
          SpeedButtonOptions.CanBeFocused = False
          SpeedButtonOptions.AllowAllUp = True
          SpeedButtonOptions.Flat = True
          SpeedButtonOptions.Transparent = True
        end
        object cxButton1: TcxButton
          AlignWithMargins = True
          Left = 951
          Top = 6
          Width = 87
          Height = 24
          Cursor = crHandPoint
          Margins.Top = 6
          Margins.Bottom = 6
          Align = alRight
          Caption = 'Ferramentas'
          TabOrder = 6
          DropDownMenu = pmFerramentas
          Kind = cxbkDropDown
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          SpeedButtonOptions.CanBeFocused = False
          SpeedButtonOptions.Flat = True
          SpeedButtonOptions.Transparent = True
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Left = 168
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
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
          Visible = True
          ItemName = 'cmCfg'
        end>
      UseOwnFont = True
      UseRestSpace = True
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
    object dxBarSubItem1: TdxBarSubItem
      Align = iaRight
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ImageIndex = 86
      ShowCaption = False
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmReprocessar'
        end>
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
    Left = 40
    Top = 112
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
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
    object TabuploadR: TWordField
      FieldName = 'uploadR'
    end
    object TabuploadS: TWordField
      FieldName = 'uploadS'
    end
    object Tabfk_produ: TIntegerField
      FieldName = 'fk_produ'
    end
    object TabbatchUID: TGuidField
      FieldName = 'batchUID'
      Size = 38
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
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 72
    Top = 112
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
  end
end
