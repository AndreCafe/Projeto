object FrmVendaProd: TFrmVendaProd
  Left = 0
  Top = 0
  ActiveControl = Grid
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Venda Produto'
  ClientHeight = 411
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panProd: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 42
    Width = 478
    Height = 268
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Bevel.BorderColor = 11645361
    Bevel.BorderWidth = 1
    Bevel.BorderInnerWidth = 1
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    Color = clWhite
    TabOrder = 0
    object Grid: TcxGrid
      AlignWithMargins = True
      Left = 1
      Top = 29
      Width = 476
      Height = 201
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BorderStyle = cxcbsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      RootLevelOptions.DetailFrameColor = clSilver
      object TV: TcxGridDBTableView
        OnDblClick = cmGravarClick
        OnMouseUp = TVMouseUp
        Navigator.Buttons.CustomButtons = <>
        OnCustomDrawCell = TVCustomDrawCell
        OnFocusedRecordChanged = TVFocusedRecordChanged
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsProd
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = TVDescricao
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<N'#227'o h'#225' produtos cadastrados>'
        OptionsView.ScrollBars = ssNone
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 32
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        OptionsView.IndicatorWidth = 32
        Styles.IncSearch = FrmPri.cxStyle42
        Styles.Selection = cxStyle5
        Styles.Header = FrmPri.cxStyle40
        OnColumnPosChanged = TVColumnPosChanged
        OnColumnSizeChanged = TVColumnSizeChanged
        object TVDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'Descricao'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Width = 208
        end
        object TVObs: TcxGridDBColumn
          Caption = 'Observa'#231#245'es'
          DataBinding.FieldName = 'Obs'
          Visible = False
          Width = 94
        end
        object TVCodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'Codigo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Width = 94
        end
        object TVPreco: TcxGridDBColumn
          Caption = 'Pre'#231'o de Venda'
          DataBinding.FieldName = 'Preco'
          PropertiesClassName = 'TcxMaskEditProperties'
          HeaderAlignmentHorz = taRightJustify
          Width = 71
        end
        object TVPontos: TcxGridDBColumn
          Caption = 'Pontos'
          DataBinding.FieldName = 'FidPontos'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object LMDSimplePanel2: TLMDSimplePanel
      AlignWithMargins = True
      Left = 4
      Top = 1
      Width = 470
      Height = 24
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.BorderSides = [fsLeft, fsRight, fsTop]
      Bevel.EdgeStyle = etRaisedInner
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      ParentColor = True
      TabOrder = 0
      object rgDescr: TcxRadioButton
        Left = 74
        Top = 4
        Width = 79
        Height = 17
        Cursor = crHandPoint
        Hint = 'Buscar produtos pela DESCRI'#199#195'O'
        Caption = 'Descri'#231#227'o'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9539985
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rgDescrClick
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
      end
      object rgCodigo: TcxRadioButton
        Left = 3
        Top = 4
        Width = 69
        Height = 17
        Cursor = crHandPoint
        Hint = 'Buscar produtos por C'#211'DIGO'
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9539985
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = rgCodigoClick
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
      end
      object cxLabel1: TcxLabel
        Left = 398
        Top = 3
        Caption = 'Pre'#231'o Venda'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 9539985
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
    object panQtdUnit: TLMDSimplePanel
      AlignWithMargins = True
      Left = 1
      Top = 230
      Width = 476
      Height = 37
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      Bevel.BorderSides = []
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 3
      object cxLabel4: TcxLabel
        Left = 0
        Top = 1
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Quantidade:'
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = True
        Style.TextColor = clGray
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.LookAndFeel.NativeStyle = True
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Vert = taVCenter
        OnClick = cxLabel4Click
        AnchorY = 19
      end
      object edQtd: TcxCurrencyEdit
        AlignWithMargins = True
        Left = 64
        Top = 7
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 6
        Margins.Right = 0
        Margins.Bottom = 6
        Align = alLeft
        BeepOnEnter = False
        EditValue = 1.000000000000000000
        ParentFont = False
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.OnChange = edQtdPropertiesChange
        Style.BorderColor = 11645361
        Style.BorderStyle = ebsFlat
        Style.Color = clWhite
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsSingle
        StyleFocused.Color = 11796479
        StyleHot.BorderStyle = ebsSingle
        TabOrder = 1
        OnKeyUp = FormKeyUp
        Width = 83
      end
      object panUnitario: TLMDSimplePanel
        Left = 258
        Top = 1
        Width = 218
        Height = 36
        Align = alRight
        Bevel.Mode = bmCustom
        ParentColor = True
        TabOrder = 2
        object edUnitario: TcxCurrencyEdit
          AlignWithMargins = True
          Left = 98
          Top = 6
          Cursor = crHandPoint
          Margins.Left = 0
          Margins.Top = 6
          Margins.Right = 0
          Margins.Bottom = 6
          Align = alRight
          BeepOnEnter = False
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.HideSelection = False
          Properties.ReadOnly = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = edUnitarioPropertiesChange
          Style.BorderColor = 11645361
          Style.BorderStyle = ebsNone
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          StyleDisabled.BorderColor = 11645361
          StyleDisabled.Color = clBtnFace
          StyleDisabled.TextColor = clGray
          StyleFocused.BorderStyle = ebsSingle
          StyleFocused.Color = 11796479
          StyleHot.BorderStyle = ebsSingle
          TabOrder = 0
          OnKeyUp = FormKeyUp
          Width = 120
        end
        object lbUnit: TcxLabel
          Left = 26
          Top = 0
          Cursor = crHandPoint
          Align = alRight
          Caption = 'Valor Unit'#225'rio:'
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clGray
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsNone
          StyleHot.LookAndFeel.NativeStyle = True
          StyleHot.TextColor = clBlue
          StyleHot.TextStyle = [fsUnderline]
          Properties.Alignment.Vert = taVCenter
          OnClick = lbUnitClick
          AnchorY = 18
        end
      end
      object LMDSimplePanel4: TLMDSimplePanel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 470
        Height = 1
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 3
      end
    end
    object LMDSimplePanel3: TLMDSimplePanel
      AlignWithMargins = True
      Left = 4
      Top = 25
      Width = 470
      Height = 1
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 1
    end
  end
  object panTot: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 315
    Width = 478
    Height = 96
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 1
  end
  object cbRecibo: TcxCheckBox
    Left = 259
    Top = 8
    Caption = 'Emitir Recibo'
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 6
    Visible = False
    Width = 95
  end
  object BarMgr: TdxBarManager
    AllowReset = False
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
    ImageOptions.Images = Dados.im16
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 152
    Top = 144
    DockControlHeights = (
      0
      0
      36
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Controles'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 164
      FloatTop = 132
      FloatClientWidth = 23
      FloatClientHeight = 22
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          Visible = True
          ItemName = 'cmRecibo'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Pressione CTRL+ENTER de qualquer lugar da tela para Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 28
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmRecibo: TdxBarControlContainerItem
      Align = iaRight
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cbRecibo
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 376
    Top = 176
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 32
    Top = 152
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clRed
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlue
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBtnFace
    end
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Produto'
        DataType = ftInteger
      end
      item
        Name = 'Unitario'
        DataType = ftCurrency
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'PagTotal'
        DataType = ftBoolean
      end
      item
        Name = 'Pago'
        DataType = ftCurrency
      end>
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
    AfterInsert = MTAfterInsert
    OnCalcFields = MTCalcFields
    Left = 104
    Top = 112
    object MTProduto: TIntegerField
      FieldName = 'Produto'
    end
    object MTCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldKind = fkLookup
      FieldName = 'Codigo'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'ID'
      LookupResultField = 'Codigo'
      KeyFields = 'Produto'
      Lookup = True
    end
    object MTDescr: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'Descr'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'ID'
      LookupResultField = 'Descricao'
      KeyFields = 'Produto'
      Lookup = True
    end
    object MTUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object MTQuant: TFloatField
      Alignment = taLeftJustify
      FieldName = 'Quant'
    end
    object MTUnitProd: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'UnitProd'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Preco'
      KeyFields = 'Produto'
      Lookup = True
    end
    object MTPodeAlterar: TBooleanField
      FieldKind = fkLookup
      FieldName = 'PodeAlterar'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'PodeAlterarPreco'
      KeyFields = 'Produto'
      Lookup = True
    end
    object MTID: TIntegerField
      FieldName = 'ID'
    end
    object MTTran: TIntegerField
      FieldName = 'Tran'
    end
    object MTCustoU: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CustoU'
      Calculated = True
    end
    object MTItem: TWordField
      FieldName = 'Item'
    end
    object MTDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object MTSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object MTTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object MTCategoria: TStringField
      FieldName = 'Categoria'
    end
    object MTCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object MTITran: TIntegerField
      FieldName = 'ITran'
    end
    object MTNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object MTCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object MTEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object MTCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object MTEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object MTFidPontosU: TIntegerField
      FieldName = 'FidPontosU'
    end
    object MTFidPontos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FidPontos'
      Calculated = True
    end
    object MTFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object MTTotal: TCurrencyField
      FieldName = 'Total'
    end
    object MTDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object MTPago: TCurrencyField
      FieldName = 'Pago'
    end
    object MTPermSemEstoque: TBooleanField
      FieldName = 'PermSemEstoque'
    end
  end
  object DS: TDataSource
    DataSet = MT
    Left = 184
    Top = 112
  end
  object tProd: TnxTable
    Database = Dados.db
    Filter = '(plus is null) or (plus = false)'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'IDescricao'
    Left = 248
    Top = 112
    object tProdID: TAutoIncField
      FieldName = 'ID'
    end
    object tProdCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object tProdDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tProdUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object tProdPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tProdObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProdImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tProdCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProdSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProdEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tProdCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProdEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tProdEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tProdPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProdNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProdFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tProdFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object tProdplus: TBooleanField
      FieldName = 'plus'
    end
    object tProdPrecoAuto: TBooleanField
      FieldName = 'PrecoAuto'
    end
    object tProdMargem: TFloatField
      FieldName = 'Margem'
    end
    object tProdFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tProdPermiteVendaFracionada: TBooleanField
      FieldName = 'PermiteVendaFracionada'
    end
    object tProdEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tProdEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tProdAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tProdAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object tProdEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object tProdplusURL: TnxMemoField
      FieldName = 'plusURL'
      BlobType = ftMemo
    end
    object tProdplusCodParceiro: TStringField
      FieldName = 'plusCodParceiro'
      Size = 15
    end
    object tProdplusCodProduto: TStringField
      FieldName = 'plusCodProduto'
      Size = 15
    end
    object tProdAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object tProdmd5Imagem: TStringField
      FieldName = 'md5Imagem'
      Size = 32
    end
    object tProdlastProdModif: TDateTimeField
      FieldName = 'lastProdModif'
    end
    object tProduploadR: TWordField
      FieldName = 'uploadR'
    end
    object tProduploadS: TWordField
      FieldName = 'uploadS'
    end
    object tProdfk_produ: TIntegerField
      FieldName = 'fk_produ'
    end
    object tProdbatchUID: TGuidField
      FieldName = 'batchUID'
      Size = 38
    end
    object tProdCadastroRapido: TBooleanField
      FieldName = 'CadastroRapido'
    end
    object tProdIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tProdRecVer: TIntegerField
      FieldName = 'RecVer'
    end
  end
  object MainMenu1: TMainMenu
    Left = 80
    Top = 160
  end
  object dsProd: TDataSource
    DataSet = tProd
    Left = 184
    Top = 152
  end
end
