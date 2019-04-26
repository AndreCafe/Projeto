object FrmProdPesq: TFrmProdPesq
  Left = 300
  Top = 420
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Localizar Produto'
  ClientHeight = 525
  ClientWidth = 964
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 964
    Height = 525
    Margins.Left = 1
    Margins.Top = 0
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alClient
    Bevel.WidthInner = 0
    Bevel.BorderColor = 7471103
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    Color = 7471103
    TabOrder = 0
    object edBusca: TcxMaskEdit
      Left = 128
      Top = 397
      BeepOnEnter = False
      Properties.AutoSelect = False
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      Properties.ValidateOnEnter = False
      Properties.OnChange = edBuscaPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Visible = False
      OnKeyUp = edBuscaKeyUp
      Width = 245
    end
    object Paginas: TcxPageControl
      AlignWithMargins = True
      Left = 9
      Top = 8
      Width = 946
      Height = 508
      Margins.Left = 9
      Margins.Top = 8
      Margins.Right = 9
      Margins.Bottom = 9
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = tsBusca
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      ExplicitTop = 0
      ExplicitHeight = 516
      ClientRectBottom = 508
      ClientRectRight = 946
      ClientRectTop = 0
      object tsBusca: TcxTabSheet
        Caption = 'tsBusca'
        ImageIndex = 0
        ExplicitHeight = 516
        object LMDSimplePanel1: TLMDSimplePanel
          Left = 736
          Top = 0
          Width = 210
          Height = 508
          Margins.Left = 0
          Align = alRight
          Bevel.BorderColor = 7471103
          Bevel.Mode = bmCustom
          Color = 7471103
          TabOrder = 0
          ExplicitHeight = 516
          object cxDBImage1: TcxDBImage
            AlignWithMargins = True
            Left = 5
            Top = 0
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            DataBinding.DataField = 'Imagem'
            DataBinding.DataSource = dsTab
            Properties.Caption = 'Imagem do Produto'
            Properties.GraphicClassName = 'TJPEGImage'
            Properties.GraphicTransparency = gtTransparent
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.BorderStyle = ebsSingle
            Style.TextColor = clSilver
            TabOrder = 0
            Height = 164
            Width = 205
          end
        end
        object Grid: TcxGrid
          Left = 0
          Top = 0
          Width = 736
          Height = 508
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnEnter = GridEnter
          OnExit = GridExit
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          ExplicitHeight = 516
          object TV: TcxGridDBTableView
            OnDblClick = TVDblClick
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Delete.Visible = False
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Visible = False
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            OnCellClick = TVCellClick
            OnCustomDrawCell = TVCustomDrawCell
            OnFocusedRecordChanged = TVFocusedRecordChanged
            DataController.DataModeController.GridMode = True
            DataController.DataSource = dsTab
            DataController.Filter.MaxValueListCount = 1000
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Filter.Active = True
            DataController.Filter.AutoDataSetFilter = True
            DataController.Filter.SupportedLike = False
            DataController.KeyFieldNames = 'Codigo'
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
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.NoDataToDisplayInfoText = 'Nenhum produto Localizado'
            OptionsView.CellAutoHeight = True
            OptionsView.GridLineColor = 15724527
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            Preview.AutoHeight = False
            OnCustomDrawColumnHeader = TVCustomDrawColumnHeader
            object TVCodigo: TcxGridDBColumn
              DataBinding.FieldName = 'Codigo'
              PropertiesClassName = 'TcxTextEditProperties'
              Styles.Header = FrmPri.cxStyle1
              Width = 131
            end
            object TVDescricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'Descricao'
              PropertiesClassName = 'TcxTextEditProperties'
              Styles.Content = cxsNegrito
              Styles.Header = FrmPri.cxStyle1
              Width = 335
            end
            object TVUnid: TcxGridDBColumn
              DataBinding.FieldName = 'Unid'
              Visible = False
            end
            object TVPreco: TcxGridDBColumn
              Caption = 'Pre'#231'o'
              DataBinding.FieldName = 'Preco'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Styles.Header = FrmPri.cxStyle1
              Width = 132
            end
            object TVImagem: TcxGridDBColumn
              DataBinding.FieldName = 'Imagem'
              Visible = False
            end
            object TVCategoria: TcxGridDBColumn
              DataBinding.FieldName = 'Categoria'
              Visible = False
            end
            object TVFornecedor: TcxGridDBColumn
              DataBinding.FieldName = 'Fornecedor'
              Visible = False
            end
            object TVEstoqueAtual: TcxGridDBColumn
              Caption = 'Estoque'
              DataBinding.FieldName = 'EstoqueAtual'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Styles.Header = FrmPri.cxStyle1
              Width = 105
            end
            object TVCustoUnitario: TcxGridDBColumn
              DataBinding.FieldName = 'CustoUnitario'
              Visible = False
            end
          end
          object TVFor: TcxGridDBTableView
            OnDblClick = TVDblClick
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = TVFocusedRecordChanged
            DataController.DataModeController.GridMode = True
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.NoDataToDisplayInfoText = '<Ainda n'#227'o foi cadastrado nenhum fornecedor>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Header = False
            object TVForNome: TcxGridDBColumn
              DataBinding.FieldName = 'Nome'
            end
          end
          object GL: TcxGridLevel
            GridView = TV
          end
        end
      end
      object tsCadRapido: TcxTabSheet
        Caption = 'tsCadRapido'
        ImageIndex = 1
        ExplicitHeight = 516
        object panCadRapido: TLMDSimplePanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 691
          Height = 508
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Bevel.BorderColor = clGray
          Bevel.BorderSides = [fsTop]
          Bevel.BorderInnerWidth = 1
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Color = clWhite
          TabOrder = 0
          ExplicitHeight = 516
          object btnSalvar: TcxButton
            Left = 20
            Top = 203
            Width = 100
            Height = 31
            Caption = 'Salvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5723991
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnSalvarClick
            OnKeyDown = btnSalvarKeyDown
            Colors.Default = 15133420
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            SpeedButtonOptions.Flat = True
          end
          object LMDSimplePanel2: TLMDSimplePanel
            Left = 20
            Top = 93
            Width = 589
            Height = 31
            Bevel.BorderWidth = 1
            Bevel.Mode = bmCustom
            Color = clWhite
            TabOrder = 1
            object cxLabel4: TcxLabel
              Left = 1
              Top = 1
              Align = alLeft
              AutoSize = False
              Caption = ' C'#243'digo'
              ParentColor = False
              ParentFont = False
              Style.BorderStyle = ebsNone
              Style.Color = 15133420
              Style.Edges = [bRight]
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = 5592405
              Style.TextStyle = [fsBold]
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              StyleFocused.Color = clBtnFace
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              Height = 29
              Width = 64
              AnchorY = 16
            end
            object edCod: TcxTextEdit
              Left = 65
              Top = 1
              Align = alClient
              ParentFont = False
              Properties.OnChange = edCodPropertiesChange
              Properties.OnEditValueChanged = edCodPropertiesEditValueChanged
              Style.BorderColor = clSilver
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -19
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              StyleFocused.BorderStyle = ebsNone
              TabOrder = 1
              OnKeyDown = edCodKeyDown
              Width = 523
            end
          end
          object LMDSimplePanel3: TLMDSimplePanel
            Left = 20
            Top = 123
            Width = 589
            Height = 31
            Bevel.BorderWidth = 1
            Bevel.Mode = bmCustom
            Color = clWhite
            TabOrder = 2
            object cxLabel1: TcxLabel
              Left = 1
              Top = 1
              Align = alLeft
              AutoSize = False
              Caption = ' Descri'#231#227'o'
              ParentColor = False
              ParentFont = False
              Style.Color = 15133420
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = 5592405
              Style.TextStyle = [fsBold]
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              StyleFocused.Color = clBtnFace
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              Height = 29
              Width = 64
              AnchorY = 16
            end
            object edDescr: TcxTextEdit
              Left = 65
              Top = 1
              Align = alClient
              ParentFont = False
              Style.BorderColor = clSilver
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -19
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              StyleFocused.BorderStyle = ebsNone
              TabOrder = 1
              OnKeyDown = edDescrKeyDown
              Width = 523
            end
          end
          object LMDSimplePanel4: TLMDSimplePanel
            Left = 20
            Top = 153
            Width = 589
            Height = 31
            Bevel.BorderWidth = 1
            Bevel.Mode = bmCustom
            Color = clWhite
            TabOrder = 3
            object cxLabel2: TcxLabel
              Left = 1
              Top = 1
              Align = alLeft
              AutoSize = False
              Caption = ' Pre'#231'o'
              ParentColor = False
              ParentFont = False
              Style.Color = 15133420
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = 5592405
              Style.TextStyle = [fsBold]
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              StyleFocused.Color = clBtnFace
              Properties.Alignment.Vert = taVCenter
              Height = 29
              Width = 64
              AnchorY = 16
            end
            object edPreco: TcxCurrencyEdit
              Left = 65
              Top = 1
              Align = alClient
              EditValue = 0.000000000000000000
              ParentFont = False
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -19
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.HotTrack = False
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              StyleFocused.BorderStyle = ebsNone
              TabOrder = 1
              OnKeyDown = edPrecoKeyDown
              Width = 523
            end
          end
          object cxLabel3: TcxLabel
            Left = 20
            Top = 59
            Caption = 'Fa'#231'a um cadastro r'#225'pido e venda agora mesmo!'
            Style.TextColor = clBlue
            Style.TextStyle = [fsBold]
          end
          object cxLabel5: TcxLabel
            Left = 20
            Top = 19
            Caption = 'Produto n'#227'o encontrado :('
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
          end
        end
        object panImagem: TLMDSimplePanel
          Left = 691
          Top = 0
          Width = 226
          Height = 508
          Margins.Left = 0
          Align = alLeft
          Bevel.Mode = bmCustom
          Color = 7471103
          TabOrder = 1
          ExplicitHeight = 516
          object cxDBImage2: TcxDBImage
            AlignWithMargins = True
            Left = 5
            Top = 0
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            DataBinding.DataField = 'Imagem'
            DataBinding.DataSource = dsProdD
            Properties.Caption = 'Imagem do Produto'
            Properties.GraphicClassName = 'TJPEGImage'
            Properties.GraphicTransparency = gtTransparent
            Properties.ReadOnly = True
            Style.BorderColor = clSilver
            Style.BorderStyle = ebsSingle
            Style.TextColor = clSilver
            TabOrder = 0
            Height = 164
            Width = 221
          end
          object cbUsarImagem: TcxCheckBox
            Left = 4
            Top = 172
            Caption = 'Usar essa imagem'
            State = cbsChecked
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Width = 199
          end
        end
      end
    end
  end
  object Tab: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    Filter = 'Plus <> True'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'ICodigo'
    Left = 32
    Top = 288
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabCodigo: TStringField
      FieldName = 'Codigo'
      Size = 30
    end
    object TabDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object TabUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object TabPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object TabObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object TabCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object TabFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object TabSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
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
    object TabPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object TabPermiteVendaFracionada: TBooleanField
      FieldName = 'PermiteVendaFracionada'
    end
    object TabNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
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
    object TabEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
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
    object TabFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object TabFidPontos: TIntegerField
      FieldName = 'FidPontos'
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
    object TabCadastroRapido: TBooleanField
      FieldName = 'CadastroRapido'
    end
    object TabIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 64
    Top = 288
  end
  object PopupMenu1: TPopupMenu
    Left = 544
    Top = 408
  end
  object TimerSync: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerSyncTimer
    Left = 256
    Top = 168
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
    ImageOptions.LargeImages = cxImageList1
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsStandard
    UseSystemFont = True
    Left = 248
    Top = 104
    DockControlHeights = (
      0
      0
      0
      0)
    object cmCadRapido: TdxBarLargeButton
      Caption = 'Cadastro R'#225'pido de Produto'
      Category = 0
      Hint = 'Cadastro R'#225'pido de Produto'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      LargeGlyph.Data = {
        46090000424D460900000000000036000000280000001D000000140000000100
        2000000000001009000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000002020102232C16404E6231906985
        42C477974BDE77964BDD688442C24C60308D2028143B01010101000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00002029143C6D8A44CC87AB55FE88AC55FF88AC55FF88AC55FF88AC55FF88AC
        55FF89AD56FF87AB55FE6A8642C61D2412350000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003F4F277585A854FA88AC55FF88AC
        55FF88AC55FF88AC55FF88AC55FF88AC55FF88AC55FF89AD56FF87AB55FE87AB
        55FE84A753F83948246A00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00004051287887AB55FE87AB55FE88AC55FF88AC55FF88AC55FF88AC55FF88AC
        55FF88AC55FF88AC55FF89AD56FF87AB55FE87AB55FE87AB55FE87AB55FE3948
        246A000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000212A153E86A954FB87AB55FE87AB
        55FE87AB55FE87AB55FE87AB55FEA4BF7EFEFDFDFDFEFDFDFDFEA1BD79FE87AB
        55FE87AB55FE87AB55FE87AB55FE87AB55FE85A853F91C231234000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000020302036F8C46D088AC55FF88AC55FF87AB55FE89AD56FF89AD56FF89AD
        56FFA5C07EFFFFFFFFFFFFFFFFFFA2BE7AFF89AD56FF88AC55FF88AC55FF88AC
        55FF88AC55FF88AC55FF698442C4010101010000000000000000000000000000
        00000000000000000000000000000000000000000000252E174487AB55FE88AC
        55FF88AC55FF87AB55FE89AD56FF89AD56FF89AD56FFA5C07EFFFFFFFFFFFFFF
        FFFFA2BE7AFF89AD56FF88AC55FF88AC55FF88AC55FF88AC55FF88AC55FF87AB
        55FE1F27143A0000000000000000000000000000000000000000000000000000
        000000000000000000005267349888AC55FF88AC55FF88AC55FF87AB55FE89AD
        56FF89AD56FF89AD56FFA5C07EFFFFFFFFFFFFFFFFFFA2BE7AFF89AD56FF88AC
        55FF88AC55FF88AC55FF88AC55FF88AC55FF88AC55FF4A5E2F8B000000000000
        0000000000000000000000000000000000000000000000000000000000006E8B
        45CD88AC55FF88AC55FF88AC55FFA5C07FFEA6C180FFA6C180FFA6C180FFBBD0
        9EFFFFFFFFFFFFFFFFFFB9CE9BFFA6C180FFA6C180FFA6C180FFA6C180FF88AC
        55FF88AC55FF88AC55FF678241C1000000000000000000000000000000000000
        0000000000000000000000000000000000007D9D4EE888AC55FF88AC55FF88AC
        55FFFDFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88AC55FF88AC55FF88AC55FF7594
        49DB000000000000000000000000000000000000000000000000000000000000
        0000000000007D9E4FE988AC55FF88AC55FF88AC55FFFDFDFDFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF88AC55FF88AC55FF88AC55FF75944ADC00000000000000000000
        0000000000000000000000000000000000000000000000000000708E47D188AC
        55FF88AC55FF88AC55FFA1BD7AFEA2BF7AFFA2BF7AFFA2BF7AFFB8CE9AFFFFFF
        FFFFFFFFFFFFB6CC97FFA2BF7AFFA2BE7AFFA2BE7AFFA2BE7AFF88AC55FF88AC
        55FF88AC55FF698442C400000000000000000000000000000000000000000000
        0000000000000000000000000000556B359D89AD56FF89AD56FF89AD56FF87AB
        55FE89AD56FF89AD56FF89AD56FFA5C07EFFFFFFFFFFFFFFFFFFA2BE7AFF89AD
        56FF89AD56FF89AD56FF89AD56FF89AD56FF89AD56FF89AD56FF4E6231916681
        40C081A351F287AA55FD88AC55FF88AC55FF88AC55FF81A351F2000000000000
        00002A351A4D87AB55FE87AB55FE87AB55FE87AB55FE88AC55FF88AC55FF88AC
        55FFA5C07EFFFFFFFFFFFFFFFFFFA2BE79FF89AD56FF87AB55FE87AB55FE87AB
        55FE87AB55FE87AB55FE87AB55FE232C16410000000000000000000000000000
        0000000000000000000000000000000000000000000003040205739248D887AB
        55FE87AB55FE87AB55FE88AC55FF88AC55FF88AC55FFA5C07EFFFFFFFFFFFFFF
        FFFFA2BE79FF89AD56FF87AB55FE87AB55FE87AB55FE87AB55FE87AB55FE6E8B
        45CE0202010244562B80698542C57B9C4DE787AB55FE87AB55FE87AB55FE6985
        42C50000000000000000000000002832194A87AA55FD87AB55FE87AB55FE88AC
        55FF88AC55FF88AC55FFA5C07EFFFFFFFFFFFFFFFFFFA2BE79FF89AD56FF87AB
        55FE87AB55FE87AB55FE87AB55FE86A954FB222B153F00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000495D2E8987AB55FE87AB55FE88AC55FF88AC55FF88AC55FF88AC
        55FF88AC55FF88AC55FF88AC55FF89AD56FF87AB55FE87AB55FE87AB55FE87AB
        55FE4253297B000000000000000044562B80698542C57B9C4DE787AB55FE87AB
        55FE87AB55FE87AB55FE87AB55FE698542C50000000000000000020201024A5D
        2E8A87AA55FD88AC55FF88AC55FF88AC55FF88AC55FF88AC55FF88AC55FF88AC
        55FF89AD56FF87AB55FE87AB55FE86AA54FC44562B7F01010101000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000002B361B5076954ADD88AC
        55FF88AC55FF88AC55FF88AC55FF88AC55FF88AC55FF89AD56FF87AB55FE7392
        48D8273118480000000000000000000000000000000044562B80698542C57B9C
        4DE787AB55FE87AB55FE87AB55FE87AB55FE87AB55FE87AB55FE87AB55FE87AB
        55FE698542C50000000000000000040503072E3A1D55597038A675944ADC82A4
        51F381A351F2749349DA576E37A32B361B500304020500000000000000000000
        00000000000000000000}
      OnClick = cmCadRapidoClick
      GlyphLayout = glLeft
    end
    object cmBuscando: TdxBarLargeButton
      Caption = '117 produtos'
      Category = 0
      Hint = '117 produtos'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Down = True
      LargeImageIndex = 1
      OnClick = cmCadRapidoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object styleRep: TcxStyleRepository
    Left = 160
    Top = 248
    PixelsPerInch = 96
    object cxsVermelho: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 75226
    end
    object cxsVerde: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 7645480
    end
    object cxsNegrito: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 4539717
    end
  end
  object cxImageList1: TcxImageList
    Height = 20
    Width = 20
    FormatVersion = 1
    DesignInfo = 3145816
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
          000000000000000000000000000000000000000000000000000071AA22FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000071AA22FF71AA22FF71AA22FF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000071AA22FF71AA22FF71AA22FF71AA
          22FF71AA22FF0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000071AA
          22FF71AA22FF71AA22FF71AA22FF71AA22FF71AA22FF71AA22FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000071AA22FF71AA22FF71AA22FF71AA22FF71AA22FF71AA
          22FF71AA22FF71AA22FF71AA22FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000071AA22FF71AA22FF71AA
          22FF71AA22FF71AA22FF71AA22FF71AA22FF71AA22FF71AA22FF71AA22FF71AA
          22FF000000000000000000000000000000000000000000000000000000000000
          000071AA22FF71AA22FF74AC22FE71AA22FF71AA22FF71AA22FF0000000071AA
          22FF71AA22FF71AA22FF71AA22FF71AA22FF71AA22FF00000000000000000000
          000000000000000000000507010A71AA22FF74AD23FF74AD23FF71AA22FF71AA
          22FF71AA22FF00000000000000000000000071AA22FF71AA22FF71AA22FF71AA
          22FF71AA22FF71AA22FF00000000000000000000000000000000000000000000
          000071AA22FF74AD23FF71AA22FF71AA22FF0000000000000000000000000000
          00000000000071AA22FF71AA22FF71AA22FF71AA22FF71AA22FF71AA22FF0000
          0000000000000000000000000000000000000000000071AA22FF71AA22FF0000
          000000000000000000000000000000000000000000000000000071AA22FF71AA
          22FF71AA22FF71AA22FF71AA22FF71AA22FF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000071AA22FF71AA22FF71AA22FF71AA22FF71AA
          22FF71AA22FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000071AA22FF71AA22FF71AA22FF71AA22FF71AA22FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000071AA22FF71AA22FF71AA
          22FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000071AA22FF000000000000000000000000000000000000
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
          0000000000000000000000000000000002020009374001157B90011CA8C40120
          BEDE0120BDDD011CA6C20114798D0009323B0000010100000000000000000000
          00000000000000000000000000000000000000000000000000000008333C001C
          AECC0023D8FE0023D9FF0023D9FF0023D9FF0023D9FF0023D9FF0125DAFF0023
          D8FE001BA8C600072D3500000000000000000000000000000000000000000000
          000000000000001064750022D5FA0023D9FF0023D9FF0023D9FF0023D9FF0023
          D9FF0023D9FF0023D9FF0125DAFF0023D8FE0023D8FE0022D3F8000F5A6A0000
          000000000000000000000000000000000000001066780023D8FE0023D8FE0023
          D9FF0023D9FF0023D9FF0023D9FF0023D9FF0023D9FF0023D9FF0125DAFF0023
          D8FE0023D8FE0023D8FE0023D8FE000F5A6A0000000000000000000000000009
          353E0022D6FB0023D8FE0023D8FE0023D8FE0326D9FE0023D8FE0023D8FE0023
          D8FE0023D8FE0023D8FE0023D8FE0729DBFE0023D8FE0023D8FE0023D8FE0022
          D4F900072C340000000000000303001DB1D00023D9FF0023D9FF0023D8FE2847
          E3FFFFFFFFFF405BEAFF0125DAFF0125DAFF0125DAFF0125DAFF435FEAFFFFFF
          FFFF3C58E8FF0023D9FF0023D9FF0023D9FF001BA7C400000101000A3A440023
          D8FE0023D9FF0023D9FF0428D9FEFFFFFFFFFFFFFFFFFFFFFFFF405BE8FF0125
          DAFF0125DAFF435EEAFFFFFFFFFFFFFFFFFFFFFFFFFF092CDCFF0023D9FF0023
          D9FF0023D8FE0008313A011682980023D9FF0023D9FF0023D9FF0023D8FE4E69
          EDFFFFFFFFFFFFFFFFFFFFFFFFFF405BEAFF435FEAFFFFFFFFFFFFFFFFFFFFFF
          FFFF4B66EDFF0023D9FF0023D9FF0023D9FF0023D9FF0013768B011EAFCD0023
          D9FF0023D9FF0023D9FF0023D8FE0125DAFF4E69EDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF4B66EDFF0023D9FF0023D9FF0023D9FF0023
          D9FF0023D9FF001AA4C10122C6E80023D9FF0023D9FF0023D9FF0023D8FE0125
          DAFF0125DAFF4E69EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B66EDFF0023
          D9FF0023D9FF0023D9FF0023D9FF0023D9FF0023D9FF001EBADB0122C7E90023
          D9FF0023D9FF0023D9FF0023D8FE0125DAFF0125DAFF435FEAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF405BEAFF0023D9FF0023D9FF0023D9FF0023D9FF0023
          D9FF0023D9FF001EBBDC011EB3D10023D9FF0023D9FF0023D9FF0023D8FE0125
          DAFF435EEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF405B
          E8FF0023D9FF0023D9FF0023D9FF0023D9FF0023D9FF001BA7C40117869D0125
          DAFF0125DAFF0125DAFF0023D8FE435FEAFFFFFFFFFFFFFFFFFFFFFFFFFF4D66
          EDFF4E67EDFFFFFFFFFFFFFFFFFFFFFFFFFF405BEAFF0125DAFF0125DAFF0125
          DAFF0125DAFF00147B91000B424D0023D8FE0023D8FE0023D8FE0426D9FEFFFF
          FFFFFFFFFFFFFFFFFFFF4B66EDFF0023D9FF0023D9FF4E67EDFFFFFFFFFFFFFF
          FFFFFFFFFFFF0628D9FE0023D8FE0023D8FE0023D8FE0009374100010405001E
          B8D80023D8FE0023D8FE0023D8FE2D4BE4FFFFFFFFFF4B66EDFF0023D9FF0023
          D9FF0023D9FF0023D9FF4E67EDFFFFFFFFFF3654E6FE0023D8FE0023D8FE0023
          D8FE001CAFCE0000020200000000000A3F4A0023D7FD0023D8FE0023D8FE0023
          D9FF0629DAFF0023D9FF0023D9FF0023D9FF0023D9FF0023D9FF0125DAFF092B
          DBFE0023D8FE0023D8FE0023D8FE0022D6FB0009363F00000000000000000000
          0000001375890023D8FE0023D8FE0023D9FF0023D9FF0023D9FF0023D9FF0023
          D9FF0023D9FF0023D9FF0125DAFF0023D8FE0023D8FE0023D8FE0023D8FE0011
          697B00000000000000000000000000000000000002020013758A0023D7FD0023
          D9FF0023D9FF0023D9FF0023D9FF0023D9FF0023D9FF0023D9FF0125DAFF0023
          D8FE0023D8FE0023D6FC00116C7F000001010000000000000000000000000000
          00000000000000000000000B4450001EBCDD0023D9FF0023D9FF0023D9FF0023
          D9FF0023D9FF0023D9FF0125DAFF0023D8FE001EB8D8000A3D48000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          0607000C485500178DA6001EBBDC0021CFF30021CEF2001EBADA00168BA3000B
          4450000104050000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000006D44
          1BA2985E26E10101000200000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000006D441BA1AA6929FFAA6929FFA36527F5040201050000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000945C25DBAA69
          29FFAA6A2AFEAB6A2AFFA76729F9060402080000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000009E6226EDAB6A2AFFAA6A2AFEAB692AFFA869
          29FA0905020B0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00009E6127ECAB692AFFAA6A2AFEAA6929FFA86829FC0906020C000000002417
          092E633D1988835120B4895522BC71461C9B3C250F5200000000000000000000
          000000000000000000000000000000000000000000009C6126E8AA6929FFAC6B
          2BFFAC6B2BFFA46629F3965D26CDAC6B2BFFAC6B2BFFAC6B2BFFAC6B2BFFAA6B
          29FFAB6B2AFFAB6B2AFF4229105B000000000000000000000000000000000000
          00000000000000000000995F25E6AC6B2BFFAC6B2BFFAC6B2BFFAC6B2BFFAC6B
          2BFFAC6B2BFFAC6B2BFFAC6B2BFFAA6B29FFAB6B2AFFAB6B2AFFAB6B2AFF6942
          1A9D00000000000000000000000000000000000000000000000000000000915A
          24D7AC6B2BFFAC6B2BFFAC6B2BFFBD8A57EFF3E8DEFEFFFFFFFFFFFFFFFFFAF7
          F4FEDCB894FFAB6B2AFFAB6B2AFFAB6B2AFF5837167800000000000000000000
          0000000000000000000000000000905924C4AC6B2BFFAC6B2BFFD3B191F3FDFD
          FDFEFDFDFDFEFDFDFDFEFDFDFDFEFDFDFDFEFDFDFDFEF5EBE0FEAB6B2AFFAB6B
          2AFFAB6B2AFF0805020B00000000000000000000000000000000180F061FAC6B
          2BFFAC6B2BFFB07F50EFFDFDFDFEFFFFFFFFFDFDFDFEFFFFFFFFFFFFFFFFFDFD
          FDFEFFFFFFFFFFFFFFFFE4C9AFFEAB6B2AFFAB6B2AFF59361684000000000000
          0000000000000000000057361577AC6B2BFFAC6B2BFFF0E2D5FEFDFDFDFEFDFD
          FDFEFDFDFDFEFDFDFDFEFDFDFDFEFDFDFDFEFDFDFDFEFDFDFDFEFDFDFDFEAB6B
          2AFFAB6B2AFF8D5623D20000000000000000000000000000000076491DA2AC6B
          2BFFAC6B2BFFFFFFFFFFFDFDFDFEFFFFFFFFFDFDFDFEFFFFFFFFFFFFFFFFFDFD
          FDFEFFFFFFFFFFFFFFFFFDFDFDFECB9661FFAA6B29FFA86729FA000000000000
          00000000000000000000784A1EA5AC6B2BFFAC6B2BFFFFFFFFFFFDFDFDFEFFFF
          FFFFFDFDFDFEFFFFFFFFFFFFFFFFFDFDFDFEFFFFFFFFFFFFFFFFFDFDFDFECD99
          66FFAC6B2BFFA96929FE000000000000000000000000000000005F3B1782AA6B
          29FFAA6B29FFF5EDE4FEFDFDFDFEFDFDFDFEFDFDFDFEFDFDFDFEFDFDFDFEFDFD
          FDFEFDFDFDFEFDFDFDFEFDFDFDFEAE7134FFAA6929FF965D25DF000000000000
          0000000000000000000027180A35AB6B2AFFAB6B2AFFD5AB80FFFDFDFDFEFFFF
          FFFFFDFDFDFEFFFFFFFFFFFFFFFFFDFDFDFEFFFFFFFFFFFFFFFFEDDCCCFEAB6A
          2AFFAB6A2AFF68401A9B0000000000000000000000000000000000000000A064
          27EEAB6B2AFFAB6B2AFFF0DECBFEFFFFFFFFFDFDFDFEFFFFFFFFFFFFFFFFFDFD
          FDFEFFFFFFFFFFFFFFFFAE6F31FFAB6A2AFFAB6A2AFF1D120728000000000000
          00000000000000000000000000002D1C0B39AB6B2AFFAB6B2AFFAB6B2AFFDCBB
          99FEFDFDFDFEFDFDFDFEFDFDFDFEFDFDFDFEEBD9C7FEAD6E30FFAB6A2AFFAB6A
          2AFF835120B30000000000000000000000000000000000000000000000000000
          00005B3A1774AB6B2AFFAB6B2AFFAB6B2AFFAB6B2AFFC58A50FFC9915BFFAC6C
          2DFFAB6A2AFFAB6A2AFFAB6A2AFF965D25DF0000000000000000000000000000
          0000000000000000000000000000000000000000000041291052AB6B2AFFAB6B
          2AFFAB6B2AFFAA6B29FFAC6B2BFFAA6929FFAB6A2AFFAB6A2AFF7D4E1FAC0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000452A11677D4D1FBB995E26E49D6126EC8C57
          22D1603B188F170E061F00000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000434343A36868
          68FF686868FF2F2F2F7300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000636363F4666666FF666666FF4E4E4EC4000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000595959DB494949B4000000000000000000000000676767FF6767
          67FF676767FF656565FC000000000000000000000000676767FF5B5B5BE10000
          000000000000000000000000000000000000575757D6676767FF676767FF6767
          67FF36363685676767FF676767FF676767FF676767FF666666FF686868FF4141
          41A3676767FF676767FF676767FF5D5D5DE60000000000000000000000000000
          0000676767FF676767FF666666FF666666FF666666FF666666FF666666FF6565
          65FD656565FD666666FF666666FF666666FF676767FF676767FF676767FF4949
          49B40000000000000000000000000000000000000000676767FF666666FF6868
          68FF686868FF686868FF686868FF686868FF686868FF686868FF686868FF6666
          66FF676767FF676767FF676767FF000000000000000000000000000000000000
          000000000000434343A7666666FF686868FF686868FF686868FF686868FF6868
          68FF686868FF686868FF686868FF666666FF676767FF676767FF2F2F2F750000
          00000000000000000000000000000000000000000000676767FF666666FF6868
          68FF686868FF686868FF2929296300000000000000002E2E2E6E686868FF6666
          66FF676767FF676767FF676767FF0000000000000000000000002E2E2E6C4E4E
          4EBD636363F5676767FF666666FF686868FF686868FF2C2C2C6B000000000000
          000000000000000000003333337B666666FF676767FF676767FF676767FF6767
          67FF666666FC454545AA686868FF666666FF676767FF676767FF656565FD6868
          68FF686868FF0000000000000000000000000000000000000000000000006666
          66FF676767FF676767FF676767FF676767FF676767FF676767FF686868FF6666
          66FF676767FF676767FF656565FD686868FF686868FF00000000000000000000
          0000000000000000000000000000666666FF676767FF676767FF676767FF6767
          67FF676767FF676767FF454545A8646464FA666666FF666666FF666666FF6868
          68FF686868FF38383888000000000000000000000000000000004040409A6666
          66FF666666FF666666FF666666FF626262F54E4E4EC02C2C2C6E000000000000
          000000000000686868FF666666FF686868FF686868FF686868FF3E3E3E950000
          000000000000434343A0686868FF686868FF686868FF686868FF686868FF0000
          000000000000000000000000000000000000000000002A2A2A6A666666FF6666
          66FF666666FF666666FF666666FF666666FF666666FF666666FF686868FF6565
          65FD656565FD666666FF3C3C3C97000000000000000000000000000000000000
          000000000000656565FA676767FF676767FF676767FF676767FF676767FF6767
          67FF676767FF666666FF686868FF656565FD676767FE676767FF676767FF0000
          000000000000000000000000000000000000454545A7676767FF676767FF6767
          67FF676767FF676767FF676767FF676767FF676767FF666666FF686868FF6666
          66FF676767FF676767FF676767FF676767FF0000000000000000000000000000
          0000585858DA676767FF676767FF676767FF3B3B3B93676767FF676767FF6767
          67FF676767FF666666FF686868FF23232358666666FD676767FF676767FF5A5A
          5AE00000000000000000000000000000000000000000565656D5676767FF0000
          00000000000000000000606060EE676767FF676767FF666666FF000000000000
          000000000000454545A95C5C5CE5000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000004C4C4CB96767
          67FF676767FF666666FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000002B2B2B67676767FF676767FF464646AF000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object dsProdD: TDataSource
    DataSet = Dados.tbProdD
    Left = 400
    Top = 232
  end
  object tAux: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    TableName = 'Produto'
    IndexName = 'ICodigo'
    Left = 232
    Top = 272
    object tAuxCodigo: TStringField
      FieldName = 'Codigo'
      Size = 30
    end
  end
end
