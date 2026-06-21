inherited cxPivotProductReports: TcxPivotProductReports
  Tag = 1
  Left = 236
  Top = 478
  Caption = 'Product Reports'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 89
    Height = 231
    DataSource = dmPivot.dsProductReports
    Groups = <
      item
        IsCaptionAssigned = True
        Caption = 'FieldsGroup 1'
      end>
    object PivotGridCategoryName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Category Name'
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
        end>
      DataBinding.FieldName = 'CategoryName'
      TotalsVisibility = tvCustom
      Visible = True
      Width = 150
    end
    object PivotGridProductName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Product Name'
      DataBinding.FieldName = 'ProductName'
      Visible = True
      Width = 180
    end
    object PivotGridProductSales: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Product Sales'
      DataBinding.FieldName = 'ProductSales'
      ImageIndex = 3
      Visible = True
      Width = 150
    end
    object PivotGridShippedDate: TcxDBPivotGridField
      AreaIndex = 0
      DataBinding.FieldName = 'ShippedDate'
      Hidden = True
    end
    object pgfShippedYear: TcxDBPivotGridField
      AreaIndex = 3
      IsCaptionAssigned = True
      Caption = 'Shipped Year'
      DataBinding.FieldName = 'ShippedDate'
      GroupIndex = 0
      GroupInterval = giDateYear
      Visible = True
    end
    object pgfShippedQuarter: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Shipped Quarter'
      DataBinding.FieldName = 'ShippedDate'
      GroupInterval = giDateQuarter
      Visible = True
    end
    object pgfShippedMonth: TcxDBPivotGridField
      AreaIndex = 4
      IsCaptionAssigned = True
      Caption = 'Shipped Month'
      DataBinding.FieldName = 'ShippedDate'
      GroupIndex = 0
      GroupExpanded = False
      GroupInterval = giDateMonth
      Visible = True
    end
    object pgMinimumSale: TcxDBPivotGridField
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Minimum Sale'
      DataBinding.FieldName = 'ProductSales'
      SummaryType = stMin
    end
    object pgAverageSale: TcxDBPivotGridField
      AreaIndex = 2
      IsCaptionAssigned = True
      Caption = 'Average Sale'
      DataBinding.FieldName = 'ProductSales'
      SummaryType = stAverage
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 53
    Width = 802
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object Bevel1: TBevel
      Left = 10
      Top = 0
      Width = 776
      Height = 10
      Shape = bsTopLine
    end
    object lbOrderID: TLabel
      Left = 15
      Top = 11
      Width = 40
      Height = 13
      Caption = 'OrderID:'
      Transparent = True
    end
    object cbFilter: TcxComboBox
      Left = 64
      Top = 8
      TabOrder = 0
      Text = 'cbOrderID'
      Width = 137
    end
  end
  object pnlDemoType: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = pnlDemoTypeResize
    DesignSize = (
      802
      53)
    object rbCategorySales: TcxRadioButton
      Left = 24
      Top = 8
      Width = 97
      Height = 17
      Anchors = []
      Caption = 'Category Sales'
      TabOrder = 0
      OnClick = rbDemoSubTypeClick
      Transparent = True
    end
    object rbProductSales: TcxRadioButton
      Tag = 1
      Left = 24
      Top = 32
      Width = 89
      Height = 17
      Anchors = []
      Caption = 'Product Sales'
      TabOrder = 1
      OnClick = rbDemoSubTypeClick
      Transparent = True
    end
    object rbIntervalGrouping: TcxRadioButton
      Tag = 2
      Left = 144
      Top = 8
      Width = 105
      Height = 17
      Anchors = []
      Caption = 'Interval Grouping'
      TabOrder = 2
      OnClick = rbDemoSubTypeClick
      Transparent = True
    end
    object rbAverage: TcxRadioButton
      Tag = 4
      Left = 272
      Top = 8
      Width = 113
      Height = 17
      Anchors = []
      Caption = 'Average Sales'
      TabOrder = 4
      OnClick = rbDemoSubTypeClick
      Transparent = True
    end
    object rbMultiplySubtotals: TcxRadioButton
      Tag = 3
      Left = 143
      Top = 32
      Width = 106
      Height = 17
      Anchors = []
      Caption = 'Multiple Subtotals'
      TabOrder = 3
      OnClick = rbDemoSubTypeClick
      Transparent = True
    end
    object rbTop3Products: TcxRadioButton
      Tag = 5
      Left = 272
      Top = 32
      Width = 113
      Height = 17
      Anchors = []
      Caption = 'Top 3 Products'
      TabOrder = 5
      OnClick = rbDemoSubTypeClick
      Transparent = True
    end
  end
end
