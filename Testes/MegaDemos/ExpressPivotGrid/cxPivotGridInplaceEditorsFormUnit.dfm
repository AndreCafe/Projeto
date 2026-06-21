inherited frmInplaceEditors: TfrmInplaceEditors
  Caption = 'Inplace Editors'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    inherited pgfCountry: TcxDBPivotGridField
      Visible = False
    end
    inherited pgfName: TcxDBPivotGridField
      Visible = False
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 5
      Visible = False
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
      Area = faRow
      AreaIndex = 0
    end
    object pgfPercentsOfColumn: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Percents Of Column'
      DataBinding.FieldName = 'Extended Price'
      PropertiesClassName = 'TcxProgressBarProperties'
      SummaryVariation = svPercentOfColumn
      Visible = True
    end
  end
end
