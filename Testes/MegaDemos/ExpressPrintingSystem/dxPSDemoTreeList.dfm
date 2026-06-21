object frTreeListFrame: TfrTreeListFrame
  Left = 0
  Top = 0
  ClientHeight = 510
  ClientWidth = 749
  Color = clBtnFace
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxDBTreeList: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 749
    Height = 510
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Product'
        Width = 396
      end
      item
        Caption.Text = 'Preview'
        Width = 125
      end
      item
        Caption.AlignHorz = taCenter
        Caption.Text = 'Others'
        Width = 316
      end>
    DataController.DataSource = dmPrinting.dsCars
    DataController.ParentField = 'ID'
    DataController.KeyField = 'ID'
    DragMode = dmAutomatic
    OptionsCustomizing.BandsQuickCustomization = True
    OptionsCustomizing.ColumnsQuickCustomization = True
    OptionsData.Inserting = True
    OptionsView.Bands = True
    OptionsView.CategorizedColumn = cxDBTreeListTrademark
    OptionsView.GridLineColor = 14916958
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.UseNodeColorForIndent = False
    PopupMenus.ColumnHeaderMenu.UseBuiltInMenu = True
    RootValue = -1
    TabOrder = 0
    object cxDBTreeListRecId: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'RecId'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListTrademark: TcxDBTreeListColumn
      DataBinding.FieldName = 'Trademark'
      Width = 141
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListModel: TcxDBTreeListColumn
      DataBinding.FieldName = 'Model'
      Width = 120
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListHP: TcxDBTreeListColumn
      DataBinding.FieldName = 'HP'
      Width = 54
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 2
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListLiter: TcxDBTreeListColumn
      DataBinding.FieldName = 'Liter'
      Width = 127
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 2
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListCyl: TcxDBTreeListColumn
      DataBinding.FieldName = 'Cyl'
      Width = 88
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 2
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListTransmissSpeedCount: TcxDBTreeListColumn
      Caption.Text = 'Speed Count'
      DataBinding.FieldName = 'TransmissSpeedCount'
      Width = 159
      Position.ColIndex = 0
      Position.RowIndex = 1
      Position.BandIndex = 2
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListTransmissAutomatic: TcxDBTreeListColumn
      RepositoryItem = dmPrinting.EditRepositoryAutomatic
      Caption.Text = 'Transmission Automatic'
      DataBinding.FieldName = 'TransmissAutomatic'
      Width = 157
      Position.ColIndex = 1
      Position.RowIndex = 1
      Position.BandIndex = 2
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListCategory: TcxDBTreeListColumn
      DataBinding.FieldName = 'Category'
      Width = 70
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListHyperlink: TcxDBTreeListColumn
      RepositoryItem = dmPrinting.EditRepositoryHyperLink
      DataBinding.FieldName = 'Hyperlink'
      Width = 396
      Position.ColIndex = 0
      Position.RowIndex = 1
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListPicture: TcxDBTreeListColumn
      RepositoryItem = dmPrinting.EditRepositoryImage
      DataBinding.FieldName = 'Picture'
      Width = 125
      Position.ColIndex = 0
      Position.LineCount = 2
      Position.RowIndex = 0
      Position.BandIndex = 1
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxDBTreeListPrice: TcxDBTreeListColumn
      RepositoryItem = dmPrinting.EditRepositoryPrice
      DataBinding.FieldName = 'Price'
      Width = 65
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
end
