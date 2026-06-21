inherited frmSummaryVariation: TfrmSummaryVariation
  Tag = 12
  Caption = 'Summary Variation'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 36
    Height = 284
    OptionsView.FilterFields = False
    Styles.OnGetContentStyle = PivotGridStylesGetContentStyle
    inherited pgfCountry: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfName: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      Width = 120
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
      Area = faColumn
      AreaIndex = 1
      Width = 120
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 2
      Hidden = True
      Visible = False
    end
    inherited pgfQuantity: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
    end
    inherited pgfDiscount: TcxDBPivotGridField
      AreaIndex = 3
      Hidden = True
      Visible = False
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      AreaIndex = 4
      Hidden = True
      Visible = False
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      Width = 200
    end
    object pgfVariation: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Absolute Variation'
      DataBinding.FieldName = 'Quantity'
      SummaryVariation = svAbsolute
      Visible = True
      Width = 100
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
    object lbVariationType: TLabel
      Left = 15
      Top = 11
      Width = 117
      Height = 13
      Caption = 'Summary Variation Type:'
      Transparent = True
    end
    object cbVariationType: TcxComboBox
      Left = 136
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'None'
        'Absolute'
        'Percent'
        'PercentOfColumn'
        'PercentOfRow')
      Properties.OnChange = cbVariationTypePropertiesChange
      TabOrder = 0
      Text = 'Absolute'
      Width = 137
    end
  end
end
