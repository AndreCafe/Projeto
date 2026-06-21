inherited cxPivotOrderReports: TcxPivotOrderReports
  Tag = 2
  Left = 383
  Top = 420
  Caption = 'Order Reports'
  ClientHeight = 427
  ClientWidth = 797
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 68
    Width = 797
    Height = 359
    DataSource = dmPivot.dsOrderReports
    object PivotGridOrderID: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Order'
      DataBinding.FieldName = 'OrderID'
      Visible = True
      Width = 150
    end
    object PivotGridProductID: TcxDBPivotGridField
      AreaIndex = 0
      DataBinding.FieldName = 'ProductID'
      Options.Filtering = False
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
    object PivotGridUnitPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Unit Price'
      DataBinding.FieldName = 'UnitPrice'
      Options.Filtering = False
      SummaryType = stAverage
      Visible = True
      Width = 100
    end
    object PivotGridQuantity: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
      DataBinding.FieldName = 'Quantity'
      DisplayFormat = '0'
      Options.Filtering = False
      Visible = True
      Width = 100
    end
    object PivotGridDiscount: TcxDBPivotGridField
      Area = faData
      AreaIndex = 2
      DataBinding.FieldName = 'Discount'
      DisplayFormat = '0.00 %'
      Options.Filtering = False
      Visible = True
      Width = 100
    end
    object PivotGridExtendedPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 3
      DataBinding.FieldName = 'Extended Price'
      Options.Filtering = False
      Visible = True
      Width = 100
    end
  end
  object pnlOrder: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    OnResize = pnlOrderResize
    object rbOrder: TcxRadioButton
      Left = 24
      Top = 8
      Width = 73
      Height = 17
      Caption = 'Order'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbLayoutTypeClick
      Transparent = True
    end
    object rbOrderFilter: TcxRadioButton
      Tag = 1
      Left = 152
      Top = 8
      Width = 89
      Height = 17
      Caption = 'Order (filtering)'
      TabOrder = 1
      OnClick = rbLayoutTypeClick
      Transparent = True
    end
    object rbQuantity: TcxRadioButton
      Tag = 2
      Left = 280
      Top = 8
      Width = 81
      Height = 17
      Caption = 'Quantity'
      TabOrder = 2
      OnClick = rbLayoutTypeClick
      Transparent = True
    end
    object rbAverage: TcxRadioButton
      Tag = 3
      Left = 392
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Average Unit Price'
      TabOrder = 3
      OnClick = rbLayoutTypeClick
      Transparent = True
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 32
    Width = 797
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 797
      Height = 36
      Align = alClient
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
      Properties.OnChange = cbFilterPropertiesChange
      TabOrder = 0
      Text = 'cbOrderID'
      Width = 137
    end
  end
end
