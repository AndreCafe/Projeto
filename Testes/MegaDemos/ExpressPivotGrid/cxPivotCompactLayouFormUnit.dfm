inherited frmCompactLayout: TfrmCompactLayout
  Tag = 13
  Caption = 'Compact Layout'
  OnShow = FormShow
  inherited DBPivotGrid: TcxDBPivotGrid
    Left = 8
    Top = 36
    Width = 587
    Height = 284
    Customization.AvailableFieldsSorted = True
    Customization.FormStyle = cfsAdvanced
    Customization.Site = cxPivotGridDemoUnitForm.Owner
    Groups = <
      item
        IsCaptionAssigned = True
        Caption = 'FieldsGroup 1'
      end>
    OptionsView.ColumnFields = False
    OptionsView.DataFields = False
    OptionsView.FilterFields = False
    OptionsView.RowFields = False
    OptionsView.RowTotalsLocation = rtlTree
    OptionsView.TotalsForSingleValues = True
    OnCustomization = DBPivotGridCustomization
    inherited pgfCountry: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfName: TcxDBPivotGridField
      Hidden = True
      Visible = False
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      Width = 150
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 5
      Hidden = True
      Visible = False
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 2
      GroupIndex = 0
      Width = 115
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 3
      GroupIndex = 0
      GroupExpanded = False
      Width = 125
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 4
      GroupIndex = 0
      GroupExpanded = False
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
      Width = 150
    end
  end
  object pnlCustomize: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 6
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 8
      Top = 8
      Caption = 'Pivot Layout:'
      Transparent = True
    end
    object rbCompactLayout: TcxRadioButton
      Tag = 2
      Left = 80
      Top = 9
      Width = 105
      Height = 17
      Caption = 'Compact Layout'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbLayoutClick
      Transparent = True
    end
    object rbFullLayout: TcxRadioButton
      Left = 186
      Top = 9
      Width = 113
      Height = 17
      Caption = 'Full Layout'
      TabOrder = 2
      OnClick = rbLayoutClick
      Transparent = True
    end
  end
  object splCustomizationForm: TcxSplitter
    Left = 0
    Top = 36
    Width = 8
    Height = 284
    HotZoneClassName = 'TcxSimpleStyle'
    ExplicitLeft = -6
    ExplicitTop = 31
  end
end
