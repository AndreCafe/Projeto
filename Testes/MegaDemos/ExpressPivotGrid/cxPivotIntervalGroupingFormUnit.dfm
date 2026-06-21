inherited frmIntervalGrouping: TfrmIntervalGrouping
  Left = 231
  Top = 256
  Caption = 'Interval Grouping'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 62
    Height = 258
    OptionsView.FilterFields = False
    OptionsView.FilterSeparator = False
    Styles.OnGetFieldHeaderStyle = PivotGridStylesGetFieldHeaderStyle
    inherited pgfCountry: TcxDBPivotGridField
      Visible = False
    end
    inherited pgfName: TcxDBPivotGridField
      Area = faRow
      Width = 150
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      AreaIndex = 1
      Visible = False
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      Caption = 'Order Date (Month)'
      Options.Filtering = True
      GroupInterval = giDateMonth
      SummaryType = stMax
      Width = 160
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      AreaIndex = 6
      Visible = False
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      AreaIndex = 7
      Visible = False
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      AreaIndex = 8
      Visible = False
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 2
      Visible = False
    end
    inherited pgfQuantity: TcxDBPivotGridField
      AreaIndex = 3
      Visible = False
    end
    inherited pgfDiscount: TcxDBPivotGridField
      AreaIndex = 4
      Visible = False
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      AreaIndex = 5
      Visible = False
    end
    object pgfProductAlphabetical: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Product Alphabetical'
      DataBinding.FieldName = 'ProductName'
      GroupInterval = giAlphabetical
      SummaryType = stAverage
      Visible = True
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbGroupIntervalType: TLabel
      Left = 15
      Top = 11
      Width = 183
      Height = 13
      Caption = 'Group Interval for then OrderDate field:'
      Transparent = True
    end
    object cbGroupType: TcxComboBox
      Left = 208
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Date'
        'DateDay'
        'DateDayOfWeek'
        'DateDayOfYear'
        'DateWeekOfMonth'
        'DateWeekOfYear'
        'DateMonth'
        'DateQuarter'
        'DateYear')
      Properties.OnChange = cbGroupTypePropertiesChange
      TabOrder = 0
      Width = 137
    end
    object cbxShowProductAlphabetically: TcxCheckBox
      Left = 15
      Top = 37
      Caption = 'Show Product Alphabetically'
      Properties.OnChange = cbxShowProductAlphabeticallyPropertiesChange
      State = cbsChecked
      TabOrder = 1
      Transparent = True
      Width = 169
    end
  end
end
