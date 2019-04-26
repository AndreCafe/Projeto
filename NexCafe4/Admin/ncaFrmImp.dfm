object FrmImp: TFrmImp
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Impress'#227'o'
  ClientHeight = 450
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panCab2: TLMDSimplePanel
    Left = 0
    Top = 41
    Width = 450
    Height = 103
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    ExplicitTop = 49
    object vgH: TcxDBVerticalGrid
      Left = 0
      Top = 0
      Width = 450
      Height = 103
      Align = alClient
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      OptionsView.CellTextMaxLineCount = 3
      OptionsView.ShowEditButtons = ecsbAlways
      OptionsView.AutoScaleBands = False
      OptionsView.PaintStyle = psDelphi
      OptionsView.GridLineColor = clBtnShadow
      OptionsView.RowHeaderMinWidth = 30
      OptionsView.RowHeaderWidth = 152
      OptionsView.ValueWidth = 92
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsBehavior.AllowChangeRecord = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      TabOrder = 0
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
      object vgHDebitoCli: TcxDBEditorRow
        Properties.Caption = 'D'#233'bito Atual'
        Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Properties.EditProperties.Nullable = False
        Properties.EditProperties.ReadOnly = True
        Properties.EditProperties.UseThousandSeparator = True
        Properties.DataBinding.FieldName = 'Debito'
        Visible = False
        ID = 1
        ParentID = -1
        Index = 1
        Version = 1
      end
      object vgHImpressora: TcxDBEditorRow
        Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
        Properties.DataBinding.FieldName = 'Impressora'
        ID = 2
        ParentID = -1
        Index = 2
        Version = 1
      end
      object vgHMaq: TcxDBEditorRow
        Properties.Caption = 'M'#225'quina'
        Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
        Properties.DataBinding.FieldName = 'Maq'
        ID = 3
        ParentID = -1
        Index = 3
        Version = 1
      end
      object vgHObs: TcxDBEditorRow
        Properties.Caption = 'Observa'#231#245'es'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.DataBinding.FieldName = 'Obs'
        ID = 4
        ParentID = -1
        Index = 4
        Version = 1
      end
      object vgHQuant: TcxDBEditorRow
        Properties.Caption = 'P'#225'ginas Detectadas'
        Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.ReadOnly = True
        Properties.DataBinding.FieldName = 'Quantidade'
        Styles.Header = cxStyle1
        Styles.Content = cxStyle1
        ID = 5
        ParentID = -1
        Index = 5
        Version = 1
      end
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 450
    Height = 5
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 1
    ExplicitTop = 44
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 150
    Width = 450
    Height = 300
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 2
    ExplicitTop = 158
    ExplicitHeight = 292
    object LMDLabel1: TLMDLabel
      Left = 0
      Top = 0
      Width = 450
      Height = 21
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      Align = alTop
      Alignment = agCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = []
      ParentFont = False
      Caption = 'Quantidade de p'#225'ginas por Tipo de Impress'#227'o'
      ExplicitWidth = 559
    end
    object panTotais: TLMDSimplePanel
      Left = 0
      Top = 197
      Width = 450
      Height = 103
      Align = alBottom
      Bevel.BorderInnerWidth = 5
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 0
      ExplicitTop = 189
      object vgT: TcxVerticalGrid
        Left = 216
        Top = 5
        Width = 229
        Height = 93
        Align = alRight
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 113
        TabOrder = 0
        OnEdited = vgTEdited
        OnItemChanged = vgTItemChanged
        Version = 1
        object vgTTotal: TcxEditorRow
          Properties.Caption = 'Sub-Total'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taRightJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
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
          Properties.EditProperties.OnChange = vgTPagTotalEditPropertiesChange
          Properties.EditProperties.OnEditValueChanged = vgTPagTotalEditPropertiesChange
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
      end
      object cbRecibo: TcxCheckBox
        Left = 16
        Top = 24
        AutoSize = False
        Caption = 'Emitir Recibo'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        Visible = False
        Height = 21
        Width = 84
      end
    end
    object Grid: TcxGrid
      Left = 0
      Top = 21
      Width = 450
      Height = 176
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
      ExplicitHeight = 168
      object TV: TcxGridTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skSum
            Column = TVQuant
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
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object TVTipo: TcxGridColumn
          Caption = 'Tipo de Impress'#227'o'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'Nome'
            end>
          Properties.ListSource = Dados.dsTipoImp
          Properties.ReadOnly = True
          Options.Editing = False
          Options.Focusing = False
          Width = 265
        end
        object TVQuant: TcxGridColumn
          Caption = 'Quantidade'
          DataBinding.ValueType = 'Word'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnEditValueChanged = TVQuantPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 84
        end
        object TVTotal: TcxGridColumn
          Caption = 'Valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          Properties.ReadOnly = True
          OnGetDisplayText = TVTotalGetDisplayText
          HeaderAlignmentHorz = taRightJustify
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 97
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  object LMDSimplePanel5: TLMDSimplePanel
    Left = 0
    Top = 144
    Width = 450
    Height = 6
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 3
    ExplicitTop = 152
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
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
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 208
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
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
    object MTQuantidade: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Quantidade'
    end
    object MTImpressora: TStringField
      FieldName = 'Impressora'
      Size = 200
    end
    object MTMaq: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Maq'
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 136
    Top = 208
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 72
    Top = 280
  end
end
