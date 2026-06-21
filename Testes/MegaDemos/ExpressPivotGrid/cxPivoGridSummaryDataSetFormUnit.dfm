inherited frmSummaryDataSet: TfrmSummaryDataSet
  Left = 274
  Top = 149
  Caption = 'Pivot Summary && DrillDown Datasets '
  ClientHeight = 635
  ClientWidth = 826
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Width = 826
    Height = 305
    Align = alTop
    inherited pgfName: TcxDBPivotGridField
      Area = faRow
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 5
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      AreaIndex = 6
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 1
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 1
    end
    inherited pgfQuantity: TcxDBPivotGridField
      AreaIndex = 2
    end
    inherited pgfDiscount: TcxDBPivotGridField
      AreaIndex = 3
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      AreaIndex = 4
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 305
    Width = 826
    Height = 330
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    object SummaryChartView: TcxGridDBChartView
      DataController.DataSource = PivotGridSummaryDataSource
      DiagramPie.Active = True
    end
    object SummaryTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = PivotGridSummaryDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object DrillDownTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = PivotGridDrillDownDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object SummaryTableLevel: TcxGridLevel
      Caption = 'SummaryTable'
      GridView = SummaryTableView
    end
    object SummaryChartLevel: TcxGridLevel
      Tag = 1
      Caption = 'SummaryChart'
      GridView = SummaryChartView
    end
    object DrillDownTableLevel: TcxGridLevel
      Tag = 2
      Caption = 'DrillDownTable'
      GridView = DrillDownTableView
    end
  end
  object PivotGridDrillDownDataSet: TcxPivotGridDrillDownDataSet
    PivotGrid = DBPivotGrid
    SynchronizeData = True
    OnDataChanged = PivotGridSummaryDataSetDataChanged
    Left = 568
    Top = 336
  end
  object PivotGridDrillDownDataSource: TDataSource
    DataSet = PivotGridDrillDownDataSet
    Left = 624
    Top = 352
  end
  object PivotGridSummaryDataSource: TDataSource
    DataSet = PivotGridSummaryDataSet
    Left = 624
    Top = 416
  end
  object PivotGridSummaryDataSet: TcxPivotGridSummaryDataSet
    PivotGrid = DBPivotGrid
    SynchronizeData = True
    OnDataChanged = PivotGridSummaryDataSetDataChanged
    Left = 576
    Top = 400
  end
end
