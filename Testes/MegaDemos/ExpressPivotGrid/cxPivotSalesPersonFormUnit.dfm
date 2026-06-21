inherited frmSalesPerson: TfrmSalesPerson
  Left = 225
  Top = 301
  Caption = 'Sales Person'
  ClientWidth = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Width = 595
    DataSource = dmPivot.dsSalesPerson
    Styles.OnGetColumnHeaderStyle = PivotGridStylesGetColumnHeaderStyle
    Styles.OnGetRowHeaderStyle = PivotGridStylesGetColumnHeaderStyle
    object pgfCountry: TcxDBPivotGridField
      AreaIndex = 0
      DataBinding.FieldName = 'Country'
      Visible = True
      Width = 100
    end
    object pgfName: TcxDBPivotGridField
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Product Name'
      DataBinding.FieldName = 'ProductName'
      Visible = True
      Width = 100
    end
    object pgfCategoryName: TcxDBPivotGridField
      AreaIndex = 2
      IsCaptionAssigned = True
      Caption = 'Category Name'
      DataBinding.FieldName = 'CategoryName'
      Visible = True
      Width = 100
      OnGetGroupImageIndex = pgfCategoryNameGetGroupImageIndex
    end
    object pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 8
      IsCaptionAssigned = True
      Caption = 'Order Date'
      DataBinding.FieldName = 'OrderDate'
      Options.Filtering = False
      Visible = True
      Width = 100
    end
    object pgfOrderYear: TcxDBPivotGridField
      AreaIndex = 9
      IsCaptionAssigned = True
      Caption = 'Order Year'
      DataBinding.FieldName = 'OrderDate'
      GroupInterval = giDateYear
      Visible = True
      Width = 100
    end
    object pgfOrderQuarter: TcxDBPivotGridField
      AreaIndex = 10
      IsCaptionAssigned = True
      Caption = 'Order Quarter'
      DataBinding.FieldName = 'OrderDate'
      GroupInterval = giDateQuarter
      Visible = True
      Width = 100
    end
    object pgfOrderMonth: TcxDBPivotGridField
      AreaIndex = 11
      IsCaptionAssigned = True
      Caption = 'Order Month'
      DataBinding.FieldName = 'OrderDate'
      GroupInterval = giDateMonth
      Visible = True
      Width = 100
    end
    object pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 3
      DataBinding.FieldName = 'UnitPrice'
      Options.Filtering = False
      Visible = True
      Width = 100
    end
    object pgfQuantity: TcxDBPivotGridField
      AreaIndex = 4
      DataBinding.FieldName = 'Quantity'
      Options.Filtering = False
      Visible = True
      Width = 100
    end
    object pgfDiscount: TcxDBPivotGridField
      AreaIndex = 5
      DataBinding.FieldName = 'Discount'
      Options.Filtering = False
      Visible = True
      Width = 100
    end
    object pgfExtendedPrice: TcxDBPivotGridField
      AreaIndex = 6
      DataBinding.FieldName = 'Extended Price'
      Options.Filtering = False
      ImageIndex = 3
      Visible = True
      Width = 100
    end
    object pgfSalesPerson: TcxDBPivotGridField
      AreaIndex = 7
      DataBinding.FieldName = 'Sales Person'
      ImageIndex = 0
      Visible = True
      Width = 100
    end
  end
end
