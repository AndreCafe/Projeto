inherited fmPivotGridChartConnection: TfmPivotGridChartConnection
  Left = 232
  Top = 213
  Caption = 'Charts Integration'
  ClientHeight = 529
  ClientWidth = 971
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 37
    Width = 971
    Height = 203
    DataSource = dmPivot.dsSalesReports
    object pgfProductName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Product Name'
      DataBinding.FieldName = 'ProductName'
      Visible = True
    end
    object pgfOrderDate: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Order Year'
      DataBinding.FieldName = 'OrderDate'
      GroupInterval = giDateYear
      Visible = True
    end
    object pgfQuantity: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      DataBinding.FieldName = 'Quantity'
      Visible = True
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 240
    Width = 971
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salBottom
    Control = cxGroupBox2
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    Height = 37
    Width = 971
    object cxLabel1: TcxLabel
      Left = 8
      Top = 9
      Caption = 'Source Data:'
      Transparent = True
    end
    object cbSourceData: TcxComboBox
      Left = 79
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'All Cells'
        'Only Selected Cells')
      Properties.OnChange = cbSourceDataPropertiesChange
      TabOrder = 1
      Text = 'All Cells'
      Width = 121
    end
    object cxLabel3: TcxLabel
      Left = 208
      Top = 9
      Caption = 'Source For Categorites:'
      Transparent = True
    end
    object cbSourceForCategorites: TcxComboBox
      Left = 331
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Column'
        'Row')
      Properties.OnChange = cbSourceForCategoritesPropertiesChange
      TabOrder = 3
      Text = 'Row'
      Width = 121
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 248
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    Style.Edges = []
    Style.TransparentBorder = False
    TabOrder = 3
    Height = 281
    Width = 971
    object Label1: TLabel
      Left = 0
      Top = 257
      Width = 971
      Height = 13
      Align = alBottom
      Caption = 
        'Note: This chart was created using the ExpressQuantumGrid. It is' +
        ' not included as part of the ExpressPivotGrid Suite, and must be' +
        ' purchased separately. You can learn more at:'
      Transparent = True
      WordWrap = True
    end
    object lblURL: TLabel
      Left = 0
      Top = 270
      Width = 971
      Height = 11
      Cursor = crHandPoint
      Align = alBottom
      Caption = 'http://www.devexpress.com/Products/VCL/ExQuantumGrid'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = True
      OnClick = lblURLClick
    end
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 971
      Height = 257
      Align = alClient
      TabOrder = 0
      object ChartView: TcxGridChartView
        DiagramColumn.Active = True
        ToolBox.CustomizeButton = True
        ToolBox.DiagramSelector = True
      end
      object GridLevel: TcxGridLevel
        GridView = ChartView
      end
    end
  end
  object ChartConnection: TcxPivotGridChartConnection
    GridChartView = ChartView
    PivotGrid = DBPivotGrid
    Left = 808
    Top = 48
  end
end
