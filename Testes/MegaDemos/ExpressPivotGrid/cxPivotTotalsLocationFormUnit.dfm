inherited frmTotalsLocation: TfrmTotalsLocation
  Tag = 13
  Caption = 'Totals Location'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 36
    Height = 284
    Groups = <
      item
        IsCaptionAssigned = True
        Caption = 'FieldsGroup 1'
      end>
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
      Area = faColumn
      AreaIndex = 0
      GroupIndex = 0
      Width = 115
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 1
      GroupIndex = 0
      GroupExpanded = False
      Width = 125
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 2
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
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbTotalsLocation: TLabel
      Left = 15
      Top = 11
      Width = 114
      Height = 13
      Caption = 'Column Totals Location:'
      Transparent = True
    end
    object Label1: TLabel
      Left = 205
      Top = 11
      Width = 101
      Height = 13
      Caption = 'Row Totals Location:'
      Transparent = True
    end
    object cbColumnTotalsLocation: TcxComboBox
      Left = 137
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Far'
        'Near')
      Properties.OnChange = cbTotalsLocationPropertiesChange
      TabOrder = 0
      Text = 'Far'
      Width = 60
    end
    object cbRowTotalsLocation: TcxComboBox
      Left = 314
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Far'
        'Near'
        'Tree')
      Properties.OnChange = cbTotalsLocationPropertiesChange
      TabOrder = 1
      Text = 'Far'
      Width = 60
    end
  end
end
