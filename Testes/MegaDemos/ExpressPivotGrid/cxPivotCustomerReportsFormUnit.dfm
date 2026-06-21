inherited cxPivotCustomerReports: TcxPivotCustomerReports
  Left = 181
  Top = 357
  Caption = 'Customer Reports'
  ClientHeight = 404
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 68
    Height = 336
    DataSource = dmPivot.dsCustomerReports
    Groups = <
      item
        IsCaptionAssigned = True
        Caption = 'FieldsGroup 1'
      end>
    object PivotGridProductName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Product Name'
      DataBinding.FieldName = 'ProductName'
      Visible = True
      Width = 180
    end
    object PivotGridCompanyName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Customer'
      DataBinding.FieldName = 'CompanyName'
      ImageIndex = 2
      Visible = True
      Width = 150
    end
    object PivotGridProductAmount: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Product Amount'
      DataBinding.FieldName = 'ProductAmount'
      Visible = True
    end
    object pgfOrderYear: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Order Year'
      DataBinding.FieldName = 'OrderDate'
      GroupIndex = 0
      GroupInterval = giDateYear
      SortOrder = soDescending
      Visible = True
    end
    object pgfOrderQuarter: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Order Quarter'
      DataBinding.FieldName = 'OrderDate'
      GroupIndex = 0
      GroupExpanded = False
      GroupInterval = giDateQuarter
      Visible = True
    end
  end
  object pnlCustRep: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    OnResize = pnlCustRepResize
    object rbCustomers: TcxRadioButton
      Left = 24
      Top = 8
      Width = 73
      Height = 17
      Caption = 'Customers'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbCustomersClick
      Transparent = True
    end
    object rbProductsFiltering: TcxRadioButton
      Tag = 1
      Left = 152
      Top = 8
      Width = 105
      Height = 17
      Caption = 'Products (filtering)'
      TabOrder = 1
      OnClick = rbCustomersClick
      Transparent = True
    end
    object rbTopProd: TcxRadioButton
      Tag = 2
      Left = 280
      Top = 8
      Width = 105
      Height = 17
      Caption = 'Top 2 Products'
      TabOrder = 2
      OnClick = rbCustomersClick
      Transparent = True
    end
    object rbTopCust: TcxRadioButton
      Tag = 3
      Left = 416
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Top 10 Customers'
      TabOrder = 3
      OnClick = rbCustomersClick
      Transparent = True
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 32
    Width = 802
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
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
      Width = 25
      Height = 13
      Caption = 'Year:'
      Transparent = True
    end
    object Label1: TLabel
      Left = 231
      Top = 11
      Width = 38
      Height = 13
      Caption = 'Quarter:'
      Transparent = True
    end
    object cbYear: TcxComboBox
      Left = 64
      Top = 8
      Properties.OnChange = FilterChange
      TabOrder = 0
      Text = 'cbYear'
      Width = 137
    end
    object cbQuarter: TcxComboBox
      Tag = 1
      Left = 280
      Top = 7
      Properties.OnChange = FilterChange
      TabOrder = 1
      Text = 'cbQuarter'
      Width = 137
    end
  end
end
