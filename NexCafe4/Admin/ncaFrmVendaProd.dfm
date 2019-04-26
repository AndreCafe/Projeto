object FrmVendaProd: TFrmVendaProd
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Venda Produto'
  ClientHeight = 442
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panProd: TLMDSimplePanel
    Left = 0
    Top = 40
    Width = 481
    Height = 402
    Align = alClient
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    object Grid: TcxGrid
      Left = 0
      Top = 28
      Width = 481
      Height = 235
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      object TV: TcxGridDBTableView
        OnDblClick = cmGravarClick
        OnMouseUp = TVMouseUp
        NavigatorButtons.ConfirmDelete = False
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
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 32
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.Content = cxStyle5
        OnColumnPosChanged = TVColumnPosChanged
        OnColumnSizeChanged = TVColumnSizeChanged
        object TVDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'Descricao'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Vert = taVCenter
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
          Properties.Alignment.Vert = taVCenter
          Width = 94
        end
        object TVPreco: TcxGridDBColumn
          Caption = 'Pre'#231'o de Venda'
          DataBinding.FieldName = 'Preco'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Vert = taVCenter
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
    object panTot: TLMDSimplePanel
      Left = 0
      Top = 263
      Width = 481
      Height = 139
      Align = alBottom
      Bevel.BorderInnerWidth = 5
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 1
      object VG: TcxDBVerticalGrid
        Left = 248
        Top = 5
        Width = 228
        Height = 129
        Align = alRight
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 113
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.AllowChangeRecord = False
        TabOrder = 0
        OnEdited = VGEdited
        DataController.DataSource = DS
        Version = 1
        object VGUnitario: TcxDBEditorRow
          Properties.Caption = 'Valor Unit'#225'rio'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.FieldName = 'Unitario'
          ID = 0
          ParentID = -1
          Index = 0
          Version = 1
        end
        object VGPontos: TcxDBEditorRow
          Options.Focusing = False
          Properties.Caption = 'Pontos'
          Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
          Properties.DataBinding.FieldName = 'FidPontosU'
          Properties.Options.Editing = False
          Visible = False
          ID = 1
          ParentID = -1
          Index = 1
          Version = 1
        end
        object VGQuant: TcxDBEditorRow
          Properties.Caption = 'Quantidade'
          Properties.DataBinding.FieldName = 'Quant'
          ID = 2
          ParentID = -1
          Index = 2
          Version = 1
        end
        object VGTotalP: TcxDBEditorRow
          Properties.Caption = 'Total de Pontos'
          Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
          Properties.DataBinding.FieldName = 'FidPontos'
          Properties.Options.Editing = False
          Visible = False
          ID = 3
          ParentID = -1
          Index = 3
          Version = 1
        end
        object VGTotal: TcxDBEditorRow
          Options.Focusing = False
          Options.TabStop = False
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.FieldName = 'Total'
          Properties.Options.Editing = False
          ID = 4
          ParentID = -1
          Index = 4
          Version = 1
        end
        object VGDesconto: TcxDBEditorRow
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.FieldName = 'Desconto'
          Properties.OnGetEditingProperties = VGDescontoPropertiesGetEditingProperties
          Styles.Content = cxStyle1
          ID = 5
          ParentID = -1
          Index = 5
          Version = 1
        end
        object VGTotalF: TcxDBEditorRow
          Options.Focusing = False
          Options.TabStop = False
          Properties.Caption = 'Total Final'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.FieldName = 'TotalF'
          Properties.Options.Editing = False
          Styles.Content = cxStyle4
          ID = 6
          ParentID = -1
          Index = 6
          Version = 1
        end
        object VGPagTotal: TcxDBEditorRow
          Properties.Caption = 'Pagamento Total?'
          Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
          Properties.EditProperties.Columns = 2
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.Items = <
            item
              Caption = '&Sim'
              Value = True
            end
            item
              Caption = '&N'#227'o'
              Value = False
            end>
          Properties.EditProperties.OnEditValueChanged = VGPagTotalEditPropertiesEditValueChanged
          Properties.DataBinding.FieldName = 'PagTotal'
          Styles.Content = cxStyle4
          ID = 7
          ParentID = -1
          Index = 7
          Version = 1
        end
        object VGPago: TcxDBEditorRow
          Properties.Caption = 'Valor Pago'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.FieldName = 'Pago'
          ID = 8
          ParentID = -1
          Index = 8
          Version = 1
        end
      end
      object cbRecibo: TcxCheckBox
        Left = 3
        Top = 16
        AutoSize = False
        Caption = 'Emitir Recibo'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Visible = False
        Height = 21
        Width = 95
      end
    end
    object LMDSimplePanel2: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 481
      Height = 24
      Align = alTop
      Bevel.Mode = bmEdge
      Bevel.StandardStyle = lsNone
      TabOrder = 2
      object cxLabel1: TcxLabel
        Left = 3
        Top = 3
        Caption = 'Busca por:'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
      end
      object rgDescr: TcxRadioButton
        Left = 66
        Top = 4
        Width = 69
        Height = 17
        Caption = 'Descri'#231#227'o'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = rgDescrClick
        LookAndFeel.NativeStyle = True
      end
      object rgCodigo: TcxRadioButton
        Left = 141
        Top = 4
        Width = 52
        Height = 17
        Caption = 'C'#243'digo'
        TabOrder = 2
        OnClick = rgCodigoClick
        LookAndFeel.NativeStyle = True
      end
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 0
      Top = 24
      Width = 481
      Height = 4
      Align = alTop
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 3
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 481
    Height = 4
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 5
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
    ImageOptions.LargeImages = FrmPri.im24
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
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
      Hint = 'Salvar'
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
    Left = 16
    Top = 104
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWindow
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
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 7105644
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
    Left = 144
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
    object MTTotal: TCurrencyField
      Alignment = taLeftJustify
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
    object MTDesconto: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Desconto'
    end
    object MTTotalF: TCurrencyField
      Alignment = taLeftJustify
      FieldKind = fkCalculated
      FieldName = 'TotalF'
      Calculated = True
    end
    object MTPagTotal: TBooleanField
      FieldName = 'PagTotal'
    end
    object MTPago: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Pago'
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
  end
  object DS: TDataSource
    DataSet = MT
    Left = 184
    Top = 112
  end
  object tProd: TnxTable
    Database = Dados.db
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
      Size = 55
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
