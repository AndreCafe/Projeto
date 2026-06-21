inherited frmSingleTotal: TfrmSingleTotal
  Tag = 10
  Caption = 'Single Total (Automatic Totals)'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 36
    Height = 284
    OptionsDataField.Area = dfaColumn
    Styles.OnGetFieldHeaderStyle = PivotGridStylesGetFieldHeaderStyle
    inherited pgfCountry: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfName: TcxDBPivotGridField
      Area = faRow
      Width = 150
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      Width = 150
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 3
      Hidden = True
      Visible = False
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 1
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      AreaIndex = 4
      Hidden = True
      Visible = False
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'UnitPrice (Max)'
    end
    inherited pgfQuantity: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Quantity (Sum)'
    end
    inherited pgfDiscount: TcxDBPivotGridField
      Area = faData
      AreaIndex = 2
      IsCaptionAssigned = True
      Caption = 'Discount (Average)'
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      AreaIndex = 1
      Hidden = True
      Visible = False
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      AreaIndex = 2
      Hidden = True
      Visible = False
    end
  end
  object pnlOptions: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel1: TBevel
      Left = 0
      Top = 34
      Width = 595
      Height = 2
      Align = alBottom
      Shape = bsTopLine
    end
    object lbField: TLabel
      Left = 15
      Top = 11
      Width = 25
      Height = 13
      Caption = 'Field:'
      Transparent = True
    end
    object lbSummaryType: TLabel
      Left = 223
      Top = 11
      Width = 73
      Height = 13
      Caption = 'Summary Type:'
      Transparent = True
    end
    object cbField: TcxComboBox
      Left = 48
      Top = 8
      Properties.OnChange = cbFieldPropertiesChange
      TabOrder = 0
      Width = 137
    end
    object cbSummaryType: TcxComboBox
      Left = 304
      Top = 7
      Properties.OnChange = cbSummaryTypePropertiesChange
      TabOrder = 1
      Width = 137
    end
  end
end
