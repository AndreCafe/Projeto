inherited frmMultipleTotals: TfrmMultipleTotals
  Tag = 11
  Caption = 'Multiple Totals'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Groups = <
      item
        IsCaptionAssigned = True
        Caption = 'FieldsGroup 1'
      end
      item
        IsCaptionAssigned = True
        Caption = 'FieldsGroup 2'
      end>
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
      CustomTotals = <
        item
          SummaryType = stAverage
        end
        item
        end
        item
          SummaryType = stMax
        end
        item
          SummaryType = stMin
        end
        item
          SummaryType = stCount
        end>
      TotalsVisibility = tvCustom
      Width = 150
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 4
      Hidden = True
      Visible = False
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      GroupIndex = 0
      Width = 120
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 1
      GroupIndex = 0
      GroupExpanded = False
      Width = 120
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      AreaIndex = 5
      Hidden = True
      Visible = False
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 1
      Hidden = True
      Visible = False
    end
    inherited pgfQuantity: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      GroupIndex = 1
    end
    inherited pgfDiscount: TcxDBPivotGridField
      AreaIndex = 2
      Hidden = True
      Visible = False
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
      GroupIndex = 1
      GroupExpanded = False
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      AreaIndex = 3
      Hidden = True
      Visible = False
    end
  end
end
