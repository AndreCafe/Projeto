inherited frmSortBySummary: TfrmSortBySummary
  Tag = 14
  Caption = 'Sort By Summary'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 36
    Height = 284
    Styles.OnGetFieldHeaderStyle = PivotGridStylesGetFieldHeaderStyle
    inherited pgfCountry: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfName: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 4
      Hidden = True
      Visible = False
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      AreaIndex = 5
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      AreaIndex = 6
      Hidden = True
      Visible = False
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      Width = 120
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfQuantity: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
    end
    inherited pgfDiscount: TcxDBPivotGridField
      Area = faData
      AreaIndex = 2
      IsCaptionAssigned = True
      Caption = 'Discount (Avg)'
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Order Amount'
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      SortBySummaryInfo.Field = pgfExtendedPrice
      SortOrder = soDescending
      Width = 150
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbSortBySummaryField: TLabel
      Left = 15
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Sort the:'
      Transparent = True
    end
    object Label1: TLabel
      Left = 203
      Top = 11
      Width = 36
      Height = 13
      Caption = 'field by:'
      Transparent = True
    end
    object cbFieldList: TcxComboBox
      Left = 60
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = cbFieldListPropertiesChange
      TabOrder = 0
      Width = 137
    end
    object cbSortBy: TcxComboBox
      Left = 244
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = cbSortByPropertiesChange
      TabOrder = 1
      Width = 137
    end
  end
end
