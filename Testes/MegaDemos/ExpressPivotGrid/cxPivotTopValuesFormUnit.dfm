inherited frmTopValues: TfrmTopValues
  Tag = 15
  Caption = 'Top Values'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 65
    Height = 255
    Styles.OnGetColumnHeaderStyle = GetGroupHeaderStyle
    Styles.OnGetRowHeaderStyle = GetGroupHeaderStyle
    inherited pgfCountry: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfName: TcxDBPivotGridField
      Visible = False
      Width = 200
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      SortBySummaryInfo.Field = pgfExtendedPrice
      TopValueCount = 4
      TopValueShowOthers = True
      Width = 150
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 5
      Hidden = True
      Visible = False
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      AreaIndex = 6
      Hidden = True
      Visible = False
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      AreaIndex = 7
      Hidden = True
      Visible = False
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      AreaIndex = 8
      Hidden = True
      Visible = False
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 2
      Hidden = True
      Visible = False
    end
    inherited pgfQuantity: TcxDBPivotGridField
      AreaIndex = 3
      Hidden = True
      Visible = False
    end
    inherited pgfDiscount: TcxDBPivotGridField
      AreaIndex = 4
      Hidden = True
      Visible = False
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Order Amount'
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      SortBySummaryInfo.Field = pgfExtendedPrice
      TopValueCount = 4
      TopValueShowOthers = True
      Width = 150
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbShowTop: TLabel
      Left = 15
      Top = 11
      Width = 45
      Height = 13
      Caption = 'Show top'
      Transparent = True
    end
    object lbValuesForField: TLabel
      Left = 132
      Top = 11
      Width = 71
      Height = 13
      Caption = 'values for field:'
      Transparent = True
    end
    object cbFieldList: TcxComboBox
      Left = 214
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = cbFieldListPropertiesChange
      TabOrder = 1
      Width = 137
    end
    object speTopCount: TcxSpinEdit
      Left = 72
      Top = 8
      Properties.AssignedValues.MinValue = True
      Properties.OnChange = UpdateSettings
      TabOrder = 0
      Value = 1
      Width = 49
    end
    object cbTopValuesShowOthers: TcxCheckBox
      Left = 12
      Top = 40
      Caption = 'TopValuesShowOthers'
      Properties.OnChange = UpdateSettings
      TabOrder = 2
      Transparent = True
      OnClick = cbTopValuesShowOthersClick
      Width = 137
    end
  end
end
