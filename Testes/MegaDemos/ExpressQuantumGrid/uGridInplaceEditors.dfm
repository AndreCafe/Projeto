inherited frmInplaceEditorsGrid: TfrmInplaceEditorsGrid
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      object GridTableView: TcxGridTableView
        OnGetCellHeight = GridTableViewGetCellHeight
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ShowEditButtons = gsebAlways
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        object clmName: TcxGridColumn
          Caption = 'Editor Name'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 188
        end
        object clmValue: TcxGridColumn
          Caption = 'Sample'
          OnGetProperties = clmValueGetProperties
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          Width = 298
        end
      end
      object GridLevel: TcxGridLevel
        GridView = GridTableView
      end
    end
  end
  object EditRepository: TcxEditRepository
    Left = 136
    Top = 88
    object EditRepositoryBlobItem: TcxEditRepositoryBlobItem
    end
    object EditRepositoryButtonItem: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EditRepositoryButtonItemPropertiesButtonClick
    end
    object EditRepositoryCalcItem: TcxEditRepositoryCalcItem
    end
    object EditRepositoryCheckBoxItem: TcxEditRepositoryCheckBoxItem
    end
    object EditRepositoryComboBoxItem: TcxEditRepositoryComboBoxItem
      Properties.Items.Strings = (
        'Blue'
        'Green'
        'Brown'
        'Yellow'
        'Red'
        'Black')
    end
    object EditRepositoryCurrencyItem: TcxEditRepositoryCurrencyItem
    end
    object EditRepositoryDateItem: TcxEditRepositoryDateItem
    end
    object EditRepositoryExtLookupComboBoxItem: TcxEditRepositoryExtLookupComboBoxItem
      Properties.DropDownSizeable = True
      Properties.View = GridViewRepositoryDBTableView
      Properties.KeyFieldNames = 'ID'
      Properties.ListFieldItem = GridDBTableViewLASTNAME
    end
    object EditRepositoryHyperLinkItem: TcxEditRepositoryHyperLinkItem
      Properties.SingleClick = True
    end
    object EditRepositoryImageItem: TcxEditRepositoryImageItem
      Properties.GraphicClassName = 'TJPEGImage'
    end
    object EditRepositoryImageComboBoxItem: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dmMain.imMain
      Properties.Items = <
        item
          Description = 'Cash'
          ImageIndex = 8
          Value = 1
        end
        item
          Description = 'Visa'
          ImageIndex = 9
          Value = 2
        end
        item
          Description = 'Master Card'
          ImageIndex = 10
          Value = 2
        end
        item
          Description = 'American Express'
          ImageIndex = 11
          Value = 4
        end>
    end
    object EditRepositoryLookupComboBoxItem: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Name'
        end>
      Properties.ListSource = dmMain.dsDXProducts
    end
    object EditRepositoryMaskItem: TcxEditRepositoryMaskItem
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '(\(\d\d\d\))? \d\d\d - \d\d\d\d'
    end
    object EditRepositoryMemoItem: TcxEditRepositoryMemoItem
    end
    object EditRepositoryMRUItem: TcxEditRepositoryMRUItem
      Properties.LookupItems.Strings = (
        'Blue'
        'Green'
        'Brown'
        'Yellow'
        'Red'
        'Black')
      Properties.OnButtonClick = EditRepositoryMRUItemPropertiesButtonClick
    end
    object EditRepositoryPopupItem: TcxEditRepositoryPopupItem
      Properties.OnInitPopup = EditRepositoryPopupItemPropertiesInitPopup
    end
    object EditRepositoryRadioGroupItem: TcxEditRepositoryRadioGroupItem
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = 'Cash'
          Value = 0
        end
        item
          Caption = 'Visa'
          Value = 2
        end
        item
          Caption = 'Master Card'
          Value = 1
        end>
    end
    object EditRepositorySpinItem: TcxEditRepositorySpinItem
    end
    object EditRepositoryTextItem: TcxEditRepositoryTextItem
    end
    object EditRepositoryTimeItem: TcxEditRepositoryTimeItem
    end
    object EditRepositoryFontNameComboBoxItem: TcxEditRepositoryFontNameComboBox
    end
    object EditRepositoryProgressBarItem: TcxEditRepositoryProgressBar
    end
    object EditRepositoryRichItem: TcxEditRepositoryRichItem
    end
    object EditRepositoryShellComboBoxItem: TcxEditRepositoryShellComboBoxItem
    end
    object EditRepositoryTrackBarItem: TcxEditRepositoryTrackBar
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 424
    Top = 80
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object styleLabel: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -30
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.FilterBox = cxStyle5
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object GridViewRepository: TcxGridViewRepository
    Left = 360
    Top = 48
    object GridViewRepositoryDBTableView: TcxGridDBTableView
      DataController.DataSource = dmMain.dsDXCustomers
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
        end
        item
          Kind = skSum
        end
        item
          Kind = skCount
          Position = spFooter
        end
        item
          Kind = skMax
          Position = spFooter
        end
        item
          Kind = skSum
          Position = spFooter
        end
        item
          Format = '###'
          Kind = skSum
          Position = spFooter
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
        end
        item
          Kind = skMax
        end
        item
          Kind = skCount
          Column = GridDBTableViewFIRSTNAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.DeletingConfirmation = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      object GridDBTableViewFIRSTNAME: TcxGridDBColumn
        Caption = 'First Name'
        DataBinding.FieldName = 'FIRSTNAME'
        Width = 120
      end
      object GridDBTableViewLASTNAME: TcxGridDBColumn
        Caption = 'Last Name'
        DataBinding.FieldName = 'LASTNAME'
        SortIndex = 0
        SortOrder = soAscending
        Width = 120
      end
      object GridDBTableViewPAYMENTTYPE: TcxGridDBColumn
        Caption = 'Payment Type'
        DataBinding.FieldName = 'PAYMENTTYPE'
        RepositoryItem = dmMain.edrepDXPaymentTypeImageCombo
        SortIndex = 1
        SortOrder = soAscending
        Width = 100
      end
      object GridDBTableViewPRODUCTID: TcxGridDBColumn
        Caption = 'Product'
        DataBinding.FieldName = 'PRODUCTID'
        RepositoryItem = dmMain.edrepDXProductLookup
        Width = 120
      end
    end
  end
end
