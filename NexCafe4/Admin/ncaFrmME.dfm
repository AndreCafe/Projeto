object FrmME: TFrmME
  Left = 0
  Top = 0
  ActiveControl = vgT
  Caption = 'FrmME'
  ClientHeight = 494
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object panCab2: TLMDSimplePanel
    Left = 0
    Top = 40
    Width = 539
    Height = 72
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    object vgH: TcxDBVerticalGrid
      Left = 96
      Top = 0
      Width = 443
      Height = 72
      Align = alClient
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
      OptionsView.CellTextMaxLineCount = 3
      OptionsView.ShowEditButtons = ecsbAlways
      OptionsView.AutoScaleBands = False
      OptionsView.PaintStyle = psDelphi
      OptionsView.GridLineColor = clBtnShadow
      OptionsView.RowHeaderMinWidth = 30
      OptionsView.RowHeaderWidth = 98
      OptionsView.RowHeight = 22
      OptionsView.ValueWidth = 92
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsBehavior.AllowChangeRecord = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      TabOrder = 0
      OnExit = vgHExit
      OnItemChanged = vgHItemChanged
      DataController.DataSource = dsMT
      Version = 1
      object vgHCliCad: TcxDBEditorRow
        Properties.Caption = 'Cliente'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxPopupEditProperties'
        Properties.EditProperties.PopupAutoSize = False
        Properties.EditProperties.PopupHeight = 400
        Properties.EditProperties.PopupWidth = 550
        Properties.EditProperties.OnCloseUp = vgHCliCadEditPropertiesCloseUp
        Properties.EditProperties.OnInitPopup = vgHCliCadEditPropertiesInitPopup
        Properties.DataBinding.FieldName = 'NomeCliente'
        Properties.Options.ShowEditButtons = eisbAlways
        Styles.Content = FrmPri.cxStyle23
        ID = 0
        ParentID = -1
        Index = 0
        Version = 1
      end
      object vgHAvulso: TcxDBEditorRow
        Properties.Caption = 'Cliente'
        Properties.EditPropertiesClassName = 'TcxTextEditProperties'
        Properties.DataBinding.FieldName = 'NomeAvulso'
        Visible = False
        ID = 1
        ParentID = -1
        Index = 1
        Version = 1
      end
      object vgHObs: TcxDBEditorRow
        Properties.Caption = 'Observa'#231#227'o'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.DataBinding.FieldName = 'Obs'
        ID = 3
        ParentID = -1
        Index = 2
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
        Styles.Content = cxStyle2
        Visible = False
        ID = 4
        ParentID = -1
        Index = 3
        Version = 1
      end
    end
    object panHsep: TLMDSimplePanel
      Left = 91
      Top = 0
      Width = 5
      Height = 72
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 1
    end
    object panH1: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 91
      Height = 72
      Align = alLeft
      Bevel.Mode = bmEdge
      TabOrder = 2
      object btnAvulso: TLMDSpeedButton
        Tag = 1
        Left = 2
        Top = 48
        Width = 87
        Height = 23
        Caption = 'Avulso'
        OnClick = btnAvulsoClick
        Align = alTop
        ButtonStyle = ubsFlat
        GroupIndex = 5
        ExplicitLeft = 1
        ExplicitTop = 47
        ExplicitWidth = 74
      end
      object btnCad: TLMDSpeedButton
        Left = 2
        Top = 24
        Width = 87
        Height = 24
        Caption = 'Cadastrado'
        OnClick = btnCadClick
        Align = alTop
        ButtonStyle = ubsFlat
        GroupIndex = 5
        Pressed = True
        ExplicitWidth = 74
      end
      object lbTipo: TcxLabel
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
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = True
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Height = 22
        Width = 87
        AnchorX = 46
        AnchorY = 13
      end
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 539
    Height = 4
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 1
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 116
    Width = 539
    Height = 378
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 2
    ExplicitTop = 80
    ExplicitHeight = 414
    object dxBarDockControl2: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 539
      Height = 28
      Align = dalTop
      BarManager = BarMgr
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
    object panTotais: TLMDSimplePanel
      Left = 0
      Top = 265
      Width = 539
      Height = 113
      Align = alBottom
      Bevel.BorderInnerWidth = 5
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 1
      object vgT: TcxVerticalGrid
        Left = 305
        Top = 5
        Width = 229
        Height = 103
        Align = alRight
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 117
        TabOrder = 0
        Version = 1
        object vgTTotal: TcxEditorRow
          Properties.Caption = 'Sub-Total'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.ReadOnly = True
          Properties.EditProperties.UseLeftAlignmentOnEditing = False
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = 0c
          ID = 0
          ParentID = -1
          Index = 0
          Version = 1
        end
        object vgTDesconto: TcxEditorRow
          Properties.Caption = 'Desconto'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.UseLeftAlignmentOnEditing = False
          Properties.EditProperties.OnChange = vgTDescontoEditPropertiesEditValueChanged
          Properties.EditProperties.OnEditValueChanged = vgTDescontoEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = 0c
          Properties.OnGetEditingProperties = vgTDescontoPropertiesGetEditingProperties
          ID = 1
          ParentID = -1
          Index = 1
          Version = 1
        end
        object vgTTotalF: TcxEditorRow
          Options.TabStop = False
          Properties.Caption = 'Total-Final'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.ReadOnly = True
          Properties.EditProperties.UseLeftAlignmentOnEditing = False
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = 0c
          ID = 2
          ParentID = -1
          Index = 2
          Version = 1
        end
        object vgTPagTotal: TcxEditorRow
          Properties.Caption = 'Pagamento Total ?'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
          Properties.EditProperties.Columns = 2
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.Items = <
            item
              Caption = 'Sim'
              Value = True
            end
            item
              Caption = 'N'#227'o'
              Value = False
            end>
          Properties.EditProperties.OnEditValueChanged = vgTPagTotalEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'Boolean'
          Properties.Value = True
          ID = 3
          ParentID = -1
          Index = 3
          Version = 1
        end
        object vgTPago: TcxEditorRow
          Properties.Caption = 'Valor Pago'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.UseLeftAlignmentOnEditing = False
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = 0c
          ID = 4
          ParentID = -1
          Index = 4
          Version = 1
        end
        object vgTPontos: TcxEditorRow
          Options.Focusing = False
          Properties.Caption = 'Pontos Necess'#225'rios'
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.DataBinding.ValueType = 'Float'
          Properties.Options.Editing = False
          Properties.Value = 0.000000000000000000
          Visible = False
          ID = 5
          ParentID = -1
          Index = 5
          Version = 1
        end
        object vgTPontosCli: TcxEditorRow
          Options.Focusing = False
          Properties.Caption = 'Pontos Dispon'#237'veis'
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.DataBinding.ValueType = 'Float'
          Properties.Value = 0.000000000000000000
          Visible = False
          ID = 6
          ParentID = -1
          Index = 6
          Version = 1
        end
      end
      object cbRecibo: TcxCheckBox
        Left = 16
        Top = 16
        AutoSize = False
        Caption = 'Emitir Recibo'
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Visible = False
        Height = 21
        Width = 86
      end
    end
    object Grid: TcxGrid
      Left = 0
      Top = 28
      Width = 539
      Height = 237
      Align = alClient
      TabOrder = 2
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            Column = TVTotal
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = 
          '<Clique em "Adicionar Item" para informar o produto / quantidade' +
          '>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object TVCodigo: TcxGridColumn
          Caption = 'C'#243'digo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Width = 85
        end
        object TVDescr: TcxGridColumn
          Caption = 'Descri'#231#227'o'
          PropertiesClassName = 'TcxMaskEditProperties'
          Width = 151
        end
        object TVUnitario: TcxGridColumn
          Caption = 'Valor Unit'#225'rio'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taRightJustify
          HeaderAlignmentVert = vaCenter
          Width = 68
        end
        object TVFidPontos: TcxGridColumn
          Caption = 'Pontos'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taRightJustify
          Options.Editing = False
          Options.Focusing = False
          Width = 56
        end
        object TVQuant: TcxGridColumn
          Caption = 'Quantidade'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 65
        end
        object TVTotal: TcxGridColumn
          Caption = 'Total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taRightJustify
          HeaderAlignmentVert = vaCenter
          Width = 65
        end
        object TVFidPontosTotal: TcxGridColumn
          Caption = 'Total'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
          HeaderAlignmentHorz = taRightJustify
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taRightJustify
          Width = 47
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  object LMDSimplePanel5: TLMDSimplePanel
    Left = 0
    Top = 112
    Width = 539
    Height = 4
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 3
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
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im24
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 168
    Top = 208
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
          BeginGroup = True
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
    object BarMgrBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 363
      FloatTop = 333
      FloatClientWidth = 84
      FloatClientHeight = 44
      ItemLinks = <
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmNovoItem'
        end
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmApagarItem'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmNovoItem: TdxBarButton
      Caption = '&Adicionar Item'
      Category = 0
      Hint = 'Clique neste bot'#227'o para adicionar um novo item.'
      Visible = ivAlways
      ImageIndex = 0
      PaintStyle = psCaptionGlyph
      UnclickAfterDoing = False
      OnClick = cmNovoItemClick
    end
    object cmApagarItem: TdxBarButton
      Caption = '&Remover Item'
      Category = 0
      Hint = 'Clique neste bot'#227'o para apagar o item atual.'
      Visible = ivAlways
      ImageIndex = 6
      UnclickAfterDoing = False
      OnClick = cmApagarItemClick
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
    object cmEditar: TdxBarButton
      Caption = '&Editar Item'
      Category = 0
      Hint = 'Editar Item'
      Visible = ivAlways
      ImageIndex = 8
      UnclickAfterDoing = False
      OnClick = cmEditarClick
    end
    object cmRecibo: TdxBarControlContainerItem
      Align = iaRight
      Caption = 'Emitir Recibo'
      Category = 0
      Hint = 'Emitir Recibo'
      Visible = ivAlways
      Control = cbRecibo
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 208
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWindow
      TextColor = clWindowText
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
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
      AssignedValues = [svColor, svTextColor]
      Color = clWindow
      TextColor = clBlue
    end
  end
  object MT: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Cliente'
        DataType = ftInteger
      end
      item
        Name = 'Obs'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NomeAvulso'
        DataType = ftString
        Size = 40
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
    Left = 104
    Top = 208
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
    object MTNomeAvulso: TStringField
      FieldName = 'NomeAvulso'
      Size = 40
    end
    object MTFidPontos: TFloatField
      FieldKind = fkLookup
      FieldName = 'FidPontos'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'ID'
      LookupResultField = 'FidPontos'
      KeyFields = 'Cliente'
      Lookup = True
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 136
    Top = 208
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer2Timer
    Left = 208
    Top = 208
  end
end
