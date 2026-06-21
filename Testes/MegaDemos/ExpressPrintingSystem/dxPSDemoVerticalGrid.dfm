object frVerticalGridFrame: TfrVerticalGridFrame
  Left = 0
  Top = 0
  ClientHeight = 515
  ClientWidth = 648
  Color = clBtnFace
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxDBVerticalGrid: TcxDBVerticalGrid
    Left = 0
    Top = 0
    Width = 648
    Height = 515
    Align = alClient
    OptionsView.RowHeaderWidth = 151
    OptionsBehavior.CellHints = False
    TabOrder = 0
    DataController.DataSource = dmPrinting.dsCars
    Version = 1
    object cxDBVerticalGridRecId: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'RecId'
      Visible = False
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object cxDBVerticalGridCategoryRow1: TcxCategoryRow
      Properties.Caption = 'Product'
      ID = 1
      ParentID = -1
      Index = 1
      Version = 1
    end
    object cxDBVerticalGridTrademark: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Trademark'
      ID = 2
      ParentID = 1
      Index = 0
      Version = 1
    end
    object cxDBVerticalGridModel: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Model'
      ID = 3
      ParentID = 1
      Index = 1
      Version = 1
    end
    object cxDBVerticalGridCategory: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Category'
      ID = 4
      ParentID = 1
      Index = 2
      Version = 1
    end
    object cxDBVerticalGridPicture: TcxDBEditorRow
      Height = 150
      Properties.RepositoryItem = dmPrinting.EditRepositoryImage
      Properties.DataBinding.FieldName = 'Picture'
      ID = 5
      ParentID = 1
      Index = 3
      Version = 1
    end
    object cxDBVerticalGridHyperlink: TcxDBEditorRow
      Properties.RepositoryItem = dmPrinting.EditRepositoryHyperLink
      Properties.DataBinding.FieldName = 'Hyperlink'
      ID = 7
      ParentID = 1
      Index = 4
      Version = 1
    end
    object cxDBVerticalGridPrice: TcxDBEditorRow
      Properties.RepositoryItem = dmPrinting.EditRepositoryPrice
      Properties.DataBinding.FieldName = 'Price'
      ID = 8
      ParentID = 1
      Index = 5
      Version = 1
    end
    object cxDBVerticalGridCategoryRow2: TcxCategoryRow
      Properties.Caption = 'Others'
      ID = 9
      ParentID = -1
      Index = 2
      Version = 1
    end
    object cxDBVerticalGridTransmissSpeedCount: TcxDBEditorRow
      Properties.Caption = 'Speed Count'
      Properties.DataBinding.FieldName = 'TransmissSpeedCount'
      ID = 10
      ParentID = 9
      Index = 0
      Version = 1
    end
    object cxDBVerticalGridTransmissAutomatic: TcxDBEditorRow
      Properties.Caption = 'Transmission Automatic'
      Properties.RepositoryItem = dmPrinting.EditRepositoryAutomatic
      Properties.DataBinding.FieldName = 'TransmissAutomatic'
      ID = 11
      ParentID = 9
      Index = 1
      Version = 1
    end
    object cxDBVerticalGridCyl: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Cyl'
      ID = 12
      ParentID = 9
      Index = 2
      Version = 1
    end
    object cxDBVerticalGridLiter: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Liter'
      ID = 13
      ParentID = 9
      Index = 3
      Version = 1
    end
    object cxDBVerticalGridHP: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'HP'
      ID = 14
      ParentID = 9
      Index = 4
      Version = 1
    end
  end
end
