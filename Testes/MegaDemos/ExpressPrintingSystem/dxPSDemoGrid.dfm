object frGridFrame: TfrGridFrame
  Left = 0
  Top = 0
  ClientHeight = 494
  ClientWidth = 825
  Color = clBtnFace
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 825
    Height = 494
    Align = alClient
    TabOrder = 0
    RootLevelOptions.DetailTabsPosition = dtpTop
    object cxGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmPrinting.dsCars
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.DataRowHeight = 100
      Preview.Column = cxGridDBTableViewHyperlink
      Preview.Visible = True
      object cxGridDBTableViewTrademark: TcxGridDBColumn
        DataBinding.FieldName = 'Trademark'
        Visible = False
        GroupIndex = 0
        SortIndex = 0
        SortOrder = soDescending
      end
      object cxGridDBTableViewModel: TcxGridDBColumn
        DataBinding.FieldName = 'Model'
        Width = 137
      end
      object cxGridDBTableViewTransmissSpeedCount: TcxGridDBColumn
        DataBinding.FieldName = 'TransmissSpeedCount'
        Width = 127
      end
      object cxGridDBTableViewTransmissAutomatic: TcxGridDBColumn
        DataBinding.FieldName = 'TransmissAutomatic'
        RepositoryItem = dmPrinting.EditRepositoryAutomatic
        Width = 106
      end
      object cxGridDBTableViewCategory: TcxGridDBColumn
        DataBinding.FieldName = 'Category'
        Width = 63
      end
      object cxGridDBTableViewHyperlink: TcxGridDBColumn
        DataBinding.FieldName = 'Hyperlink'
        Width = 130
      end
      object cxGridDBTableViewPicture: TcxGridDBColumn
        DataBinding.FieldName = 'Picture'
        RepositoryItem = dmPrinting.EditRepositoryImage
        Width = 216
      end
      object cxGridDBTableViewPrice: TcxGridDBColumn
        DataBinding.FieldName = 'Price'
        RepositoryItem = dmPrinting.EditRepositoryPrice
      end
    end
    object cxGridDBBandedTableView: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmPrinting.dsCars
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      Preview.Column = cxGridDBBandedTableViewPrice
      Preview.Visible = True
      Bands = <
        item
          Caption = 'Product'
          Width = 415
        end
        item
          Caption = 'Preview'
          Width = 126
        end
        item
          Caption = 'Others'
          Width = 318
        end>
      object cxGridDBBandedTableViewRecId: TcxGridDBBandedColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGridDBBandedTableViewTrademark: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Trademark'
        Width = 151
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGridDBBandedTableViewModel: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Model'
        Width = 119
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGridDBBandedTableViewHP: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HP'
        Width = 48
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGridDBBandedTableViewLiter: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Liter'
        Width = 49
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGridDBBandedTableViewCyl: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Cyl'
        Width = 46
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGridDBBandedTableViewTransmissSpeedCount: TcxGridDBBandedColumn
        Caption = 'Speed Count'
        DataBinding.FieldName = 'TransmissSpeedCount'
        Width = 160
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object cxGridDBBandedTableViewTransmissAutomatic: TcxGridDBBandedColumn
        Caption = 'Transmission Automatic'
        DataBinding.FieldName = 'TransmissAutomatic'
        RepositoryItem = dmPrinting.EditRepositoryAutomatic
        Width = 158
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 1
      end
      object cxGridDBBandedTableViewCategory: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Category'
        Width = 145
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGridDBBandedTableViewHyperlink: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Hyperlink'
        RepositoryItem = dmPrinting.EditRepositoryHyperLink
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object cxGridDBBandedTableViewPicture: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Picture'
        RepositoryItem = dmPrinting.EditRepositoryImage
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.LineCount = 2
        Position.RowIndex = 0
      end
      object cxGridDBBandedTableViewPrice: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Price'
        RepositoryItem = dmPrinting.EditRepositoryPrice
        Width = 129
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
    end
    object cxGridDBCardView: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmPrinting.dsCars
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CardWidth = 314
      OptionsView.CellAutoHeight = True
      object cxGridDBCardViewRecId: TcxGridDBCardViewRow
        DataBinding.FieldName = 'RecId'
        Visible = False
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewTrademark: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Trademark'
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewModel: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Model'
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewHP: TcxGridDBCardViewRow
        DataBinding.FieldName = 'HP'
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewLiter: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Liter'
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewCyl: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Cyl'
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewTransmissSpeedCount: TcxGridDBCardViewRow
        Caption = 'Speed Count'
        DataBinding.FieldName = 'TransmissSpeedCount'
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewTransmissAutomatic: TcxGridDBCardViewRow
        Caption = 'Transmission Automatic'
        DataBinding.FieldName = 'TransmissAutomatic'
        RepositoryItem = dmPrinting.EditRepositoryAutomatic
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewCategory: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Category'
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewHyperlink: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Hyperlink'
        RepositoryItem = dmPrinting.EditRepositoryHyperLink
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewPicture: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Picture'
        RepositoryItem = dmPrinting.EditRepositoryImage
        Position.BeginsLayer = True
      end
      object cxGridDBCardViewPrice: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Price'
        Position.BeginsLayer = True
      end
    end
    object cxGridDBChartView: TcxGridDBChartView
      Categories.DataBinding.FieldName = 'Model'
      DataController.DataSource = dmPrinting.dsCars
      DiagramColumn.Active = True
      object cxGridDBChartViewSeries1: TcxGridDBChartSeries
        DataBinding.FieldName = 'Price'
      end
    end
    object cxGridDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmPrinting.dsOrders
      DataController.DetailKeyFieldNames = 'Cars_ID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      Preview.Visible = True
      object cxGridDBTableView1PurchaseDate: TcxGridDBColumn
        DataBinding.FieldName = 'PurchaseDate'
      end
      object cxGridDBTableView1Orders_Time: TcxGridDBColumn
        DataBinding.FieldName = 'Orders_Time'
        PropertiesClassName = 'TcxTimeEditProperties'
        Width = 121
      end
      object cxGridDBTableView1PaymentType: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentType'
        Width = 134
      end
      object cxGridDBTableView1Quantity: TcxGridDBColumn
        DataBinding.FieldName = 'Quantity'
        Width = 84
      end
      object cxGridDBTableView1PaymentAmount: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentAmount'
        Width = 100
      end
    end
    object cxGridLevel1: TcxGridLevel
      Caption = 'Table View'
      GridView = cxGridDBTableView
      object cxGridLevel5: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object cxGridLevel2: TcxGridLevel
      Caption = 'Banded Table View'
      GridView = cxGridDBBandedTableView
    end
    object cxGridLevel3: TcxGridLevel
      Caption = 'Card View'
      GridView = cxGridDBCardView
    end
    object cxGridLevel4: TcxGridLevel
      Caption = 'Chart View'
      GridView = cxGridDBChartView
    end
  end
end
