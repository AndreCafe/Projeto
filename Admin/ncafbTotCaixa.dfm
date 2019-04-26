inherited fbTotCaixa: TfbTotCaixa
  Caption = 'fbTotCaixa'
  ClientHeight = 630
  ClientWidth = 850
  ExplicitWidth = 858
  ExplicitHeight = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 850
    Height = 630
    ExplicitWidth = 850
    ExplicitHeight = 630
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 850
      Height = 44
      ExplicitWidth = 850
      ExplicitHeight = 44
    end
    object LMDSimplePanel1: TLMDSimplePanel
      AlignWithMargins = True
      Left = 213
      Top = 49
      Width = 209
      Height = 581
      Margins.Left = 7
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 1
      object gridCedula: TcxGrid
        Left = 0
        Top = 17
        Width = 209
        Height = 296
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        RootLevelOptions.TabsForEmptyDetails = False
        object tvCedula: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              Column = tvCedulaTotal
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.ExpandButtonsForEmptyDetails = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object tvCedulaDescr: TcxGridColumn
            Caption = 'C'#233'dula / Moeda'
            PropertiesClassName = 'TcxTextEditProperties'
            Options.Editing = False
            Options.Focusing = False
            Width = 87
          end
          object tvCedulaQuant: TcxGridColumn
            Caption = 'Quant'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.UseLeftAlignmentOnEditing = False
            OnGetDisplayText = tvCedulaQuantGetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object tvCedulaTotal: TcxGridColumn
            Caption = 'Total'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            OnGetDisplayText = tvCedulaTotalGetDisplayText
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 88
          end
          object tvCedulaValor: TcxGridColumn
            DataBinding.ValueType = 'Currency'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object glCedula: TcxGridLevel
          GridView = tvCedula
          Options.TabsForEmptyDetails = False
        end
      end
      object cxLabel1: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Contador de C'#233'dulas'
        Style.BorderStyle = ebsNone
      end
    end
    object LMDSimplePanel2: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 49
      Width = 206
      Height = 581
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 2
      object Grid: TcxGrid
        Left = 0
        Top = 17
        Width = 206
        Height = 295
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        RootLevelOptions.TabsForEmptyDetails = False
        object TV: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnCanFocusRecord = TVCanFocusRecord
          OnCustomDrawCell = TVCustomDrawCell
          DataController.DataSource = DS
          DataController.DetailKeyFieldNames = 'ID'
          DataController.KeyFieldNames = 'ID'
          DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnDetailHasChildren = TVDataControllerDetailHasChildren
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
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.ExpandButtonsForEmptyDetails = False
          OptionsView.GridLineColor = clGray
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          Styles.Background = cxStyle1
          Styles.Content = cxStyle1
          Styles.Selection = cxStyle3
          object TVID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            SortIndex = 0
            SortOrder = soAscending
            VisibleForCustomization = False
          end
          object TVDescr: TcxGridDBColumn
            Caption = 'Item'
            DataBinding.FieldName = 'Descr'
            PropertiesClassName = 'TcxTextEditProperties'
            Width = 129
          end
          object TVValor: TcxGridDBColumn
            DataBinding.FieldName = 'Valor'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            OnGetDisplayText = TVValorGetDisplayText
            HeaderAlignmentHorz = taRightJustify
            Width = 91
          end
        end
        object GL: TcxGridLevel
          GridView = TV
          Options.TabsForEmptyDetails = False
        end
      end
      object cxLabel2: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Resumo Financeiro'
        Style.BorderStyle = ebsNone
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Left = 576
    Top = 200
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end>
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Totalizar'
      Category = 0
      Hint = 'Totalizar'
      Visible = ivAlways
      LargeImageIndex = 42
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 536
    Top = 201
  end
  inherited CP: TdxComponentPrinter
    Left = 640
    Top = 202
  end
  inherited dlgExp: TSaveDialog
    Left = 608
    Top = 201
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 672
    Top = 202
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 704
    Top = 204
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 416
    Top = 128
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 16250871
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
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
    Left = 64
    Top = 144
    object MTID: TIntegerField
      FieldName = 'ID'
    end
    object MTDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object MTValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object DS: TDataSource
    DataSet = MT
    Left = 104
    Top = 144
  end
  object cxStyleRepository2: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14286847
      TextColor = clBlack
    end
  end
  object mtCedulas: TkbmMemTable
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
    Left = 64
    Top = 200
  end
end
