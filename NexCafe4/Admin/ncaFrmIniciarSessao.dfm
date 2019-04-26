object FrmIniciarSessao: TFrmIniciarSessao
  Left = 0
  Top = 0
  Caption = 'Iniciar Acesso'
  ClientHeight = 465
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 104
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object bdcAcesso: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 489
    Height = 36
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object panDiv1: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 489
    Height = 5
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 2
    object LMDLabel1: TLMDLabel
      Left = 288
      Top = 8
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 138
    Width = 489
    Height = 0
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 3
    object LMDLabel3: TLMDLabel
      Left = 288
      Top = 8
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 41
    Width = 489
    Height = 97
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 4
    object LMDLabel2: TLMDLabel
      Left = 440
      Top = 72
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
    object vgH: TcxDBVerticalGrid
      Left = 83
      Top = 0
      Width = 406
      Height = 97
      Align = alClient
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      OptionsView.CellTextMaxLineCount = 3
      OptionsView.ShowEditButtons = ecsbAlways
      OptionsView.AutoScaleBands = False
      OptionsView.PaintStyle = psDelphi
      OptionsView.GridLineColor = clBtnShadow
      OptionsView.RowHeaderMinWidth = 30
      OptionsView.RowHeaderWidth = 106
      OptionsView.RowHeight = 22
      OptionsView.ValueWidth = 92
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsBehavior.RowTracking = False
      OptionsBehavior.AllowChangeRecord = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      TabOrder = 0
      DataController.DataSource = dsMT
      Version = 1
      object vgHTipoAcesso: TcxDBEditorRow
        Properties.Caption = 'Grupo de Tarifas'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.DropDownListStyle = lsEditList
        Properties.EditProperties.DropDownRows = 7
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.KeyFieldNames = 'ID'
        Properties.EditProperties.ListColumns = <
          item
            FieldName = 'Nome'
          end>
        Properties.EditProperties.ListOptions.CaseInsensitive = True
        Properties.EditProperties.ListOptions.ShowHeader = False
        Properties.EditProperties.MaxLength = 30
        Properties.EditProperties.ReadOnly = False
        Properties.EditProperties.OnCloseUp = vgHTipoAcessoEditPropertiesCloseUp
        Properties.DataBinding.FieldName = 'NomeTipoAcesso'
        Properties.OnGetEditingProperties = vgHTipoAcessoPropertiesGetEditingProperties
        ID = 0
        ParentID = -1
        Index = 0
        Version = 1
      end
      object vgHCliCad: TcxDBEditorRow
        Properties.Caption = 'Cliente'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxPopupEditProperties'
        Properties.EditProperties.PopupAutoSize = False
        Properties.EditProperties.PopupHeight = 400
        Properties.EditProperties.PopupWidth = 679
        Properties.EditProperties.OnCloseUp = vgHCliCadEditPropertiesCloseUp
        Properties.EditProperties.OnInitPopup = vgHCliCadEditPropertiesInitPopup
        Properties.DataBinding.FieldName = 'NomeCliente'
        Properties.Options.ShowEditButtons = eisbAlways
        ID = 1
        ParentID = -1
        Index = 1
        Version = 1
      end
      object vgHAvulso: TcxDBEditorRow
        Properties.Caption = 'Cliente'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxTextEditProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.MaxLength = 40
        Properties.EditProperties.ReadOnly = False
        Properties.DataBinding.FieldName = 'NomeAvulso'
        Visible = False
        ID = 2
        ParentID = -1
        Index = 2
        Version = 1
      end
      object vgHObs: TcxDBEditorRow
        Properties.Caption = 'Observa'#231#227'o'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.DataBinding.FieldName = 'Obs'
        ID = 3
        ParentID = -1
        Index = 3
        Version = 1
      end
      object vgHDebitoCli: TcxDBEditorRow
        Properties.Caption = 'D'#233'bito Atual'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Properties.EditProperties.Nullable = False
        Properties.EditProperties.ReadOnly = True
        Properties.EditProperties.UseThousandSeparator = True
        Properties.DataBinding.FieldName = 'Debito'
        Styles.Content = cxStyle13
        Visible = False
        ID = 4
        ParentID = -1
        Index = 4
        Version = 1
      end
    end
    object panH1: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 78
      Height = 97
      Align = alLeft
      Bevel.Mode = bmEdge
      TabOrder = 1
      object btnFunc: TLMDSpeedButton
        Tag = 2
        Left = 2
        Top = 71
        Width = 74
        Height = 23
        Caption = 'Funcion'#225'rio'
        OnClick = btnCadClick
        OnMouseUp = btnFuncMouseUp
        Align = alTop
        ButtonStyle = ubsFlat
        GroupIndex = 5
        ExplicitTop = 69
      end
      object btnAvulso: TLMDSpeedButton
        Tag = 1
        Left = 2
        Top = 48
        Width = 74
        Height = 23
        Caption = 'Avulso'
        OnClick = btnCadClick
        OnMouseUp = btnAvulsoMouseUp
        Align = alTop
        ButtonStyle = ubsFlat
        GroupIndex = 5
        ExplicitTop = 46
      end
      object btnCad: TLMDSpeedButton
        Left = 2
        Top = 24
        Width = 74
        Height = 24
        Caption = 'Cadastrado'
        OnClick = btnCadClick
        Align = alTop
        ButtonStyle = ubsFlat
        GroupIndex = 5
        Pressed = True
      end
      object cxLabel1: TcxLabel
        Left = 2
        Top = 2
        Align = alTop
        AutoSize = False
        Caption = 'Tipo Cliente:'
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Edges = [bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Height = 22
        Width = 74
        AnchorX = 39
        AnchorY = 13
      end
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 78
      Top = 0
      Width = 5
      Height = 97
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 2
    end
  end
  object panTempo: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 143
    Width = 489
    Height = 322
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 9
    object cbRecibo: TcxCheckBox
      Left = 3
      Top = 10
      AutoSize = False
      Caption = 'Emitir Recibo'
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = FrmPri.cxEditStyleController1
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Transparent = True
      Visible = False
      Height = 21
      Width = 84
    end
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'Sinal')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im24
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 216
    Top = 224
    DockControlHeights = (
      0
      0
      0
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Acesso'
      CaptionButtons = <>
      DockControl = bdcAcesso
      DockedDockControl = bdcAcesso
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 67
      FloatTop = 344
      FloatClientWidth = 69
      FloatClientHeight = 44
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMaq'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmListaEspera'
        end
        item
          Visible = True
          ItemName = 'cmRecibo'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Acesso'
      OneOnRow = True
      Row = 0
      SizeGrip = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object BarMgrBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Rodap'#233' Acesso'
      CaptionButtons = <>
      DockedDockingStyle = dsBottom
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsBottom
      FloatLeft = 276
      FloatTop = 477
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmData'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmPagamento'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmFuncFim'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmFuncInicio'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'RodAcesso'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object BarMgrBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 478
      FloatTop = 452
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovoSinal'
        end>
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object BarMgrBar4: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 255
      FloatTop = 304
      FloatClientWidth = 108
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovoItem'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRemoverItem'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 2'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object cmFuncFim: TdxBarStatic
      Caption = 'Func. Fim: daniel'
      Category = 0
      Hint = 'Func. Fim: daniel'
      Visible = ivAlways
    end
    object cmData: TdxBarStatic
      Caption = 'Data: 22/05/2002'
      Category = 0
      Hint = 'Data: 22/05/2002'
      Visible = ivAlways
    end
    object cmPagamento: TdxBarStatic
      Caption = 'Pago em: 22/05/2202'
      Category = 0
      Hint = 'Pago em: 22/05/2202'
      Visible = ivAlways
    end
    object cmFuncInicio: TdxBarStatic
      Caption = 'Func.Inicio: jlborges'
      Category = 0
      Hint = 'Func.Inicio: jlborges'
      Visible = ivAlways
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
    end
    object cmNovoSinal: TdxBarButton
      Caption = '&Adicionar Novo Pagamento Antecipado'
      Category = 0
      Hint = 'Adicionar Novo Pagamento Antecipado'
      Visible = ivAlways
      ImageIndex = 0
      PaintStyle = psCaptionGlyph
    end
    object cmTituloSinal: TdxBarStatic
      Caption = 'Valores Pagos Antecipadamente'
      Category = 0
      Hint = 'Valores Pagos Antecipadamente'
      Visible = ivAlways
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
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      PaintStyle = psCaptionGlyph
      GlyphLayout = glLeft
    end
    object cmNovoItem: TdxBarButton
      Caption = 'Adicionar Novo Item'
      Category = 0
      Hint = 'Adicionar Novo Item'
      Visible = ivAlways
      ImageIndex = 0
      PaintStyle = psCaptionGlyph
    end
    object cmRemoverItem: TdxBarButton
      Caption = '&Remover Item'
      Category = 0
      Hint = 'Remover Item'
      Visible = ivAlways
      ImageIndex = 6
      PaintStyle = psCaptionGlyph
    end
    object cmRecibo: TdxBarControlContainerItem
      Align = iaRight
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cbRecibo
    end
    object cmListaEspera: TdxBarLargeButton
      Caption = 'Lista de Espera'
      Category = 0
      Hint = 'Lista de Espera'
      Visible = ivNever
      ButtonStyle = bsChecked
      LargeImageIndex = 10
      OnClick = cbListaEsperaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmMaq: TdxBarStatic
      Caption = 'M'#225'q. 1'
      Category = 0
      Hint = 'M'#225'q. 1'
      Style = FrmPri.cxStyle30
      Visible = ivAlways
      Width = 71
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 56
    Top = 256
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsStrikeOut]
      TextColor = clRed
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBackground
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TextColor = clGray
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 56
    Top = 224
    PixelsPerInch = 96
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15588572
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15588572
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
  end
  object cxStyleRepository3: TcxStyleRepository
    Left = 88
    Top = 224
    PixelsPerInch = 96
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
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
    Left = 128
    Top = 224
    object MTCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object MTNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCliente'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 50
      Lookup = True
    end
    object MTNomeAvulso: TStringField
      FieldName = 'NomeAvulso'
      Size = 50
    end
    object MTObs: TStringField
      FieldName = 'Obs'
      Size = 200
    end
    object MTDebito: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'Debito'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Debito'
      KeyFields = 'Cliente'
      Lookup = True
    end
    object MTTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object MTNomeTipoAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoAcesso'
      LookupDataSet = Dados.tbTipoAcesso
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'TipoAcesso'
      Size = 40
      Lookup = True
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 168
    Top = 224
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 360
    Top = 72
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer2Timer
    Left = 296
    Top = 72
  end
end
