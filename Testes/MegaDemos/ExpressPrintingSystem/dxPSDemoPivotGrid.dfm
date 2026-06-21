object frPivotGridFrame: TfrPivotGridFrame
  Left = 0
  Top = 0
  ClientHeight = 369
  ClientWidth = 664
  Color = clBtnFace
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxDBPivotGrid1: TcxDBPivotGrid
    Left = 0
    Top = 0
    Width = 664
    Height = 369
    Align = alClient
    DataSource = dmPrinting.dsCars
    Groups = <>
    TabOrder = 0
    object cxDBPivotGrid1Trademark: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      DataBinding.FieldName = 'Trademark'
      Visible = True
      Width = 102
    end
    object cxDBPivotGrid1Model: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      DataBinding.FieldName = 'Model'
      Visible = True
      Width = 169
    end
    object cxDBPivotGrid1TransmissSpeedCount: TcxDBPivotGridField
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Speed Count'
      DataBinding.FieldName = 'TransmissSpeedCount'
      Visible = True
    end
    object cxDBPivotGrid1TransmissAutomatic: TcxDBPivotGridField
      AreaIndex = 2
      IsCaptionAssigned = True
      Caption = 'Transmission Automatic'
      DataBinding.FieldName = 'TransmissAutomatic'
      Visible = True
    end
    object cxDBPivotGrid1Category: TcxDBPivotGridField
      AreaIndex = 0
      DataBinding.FieldName = 'Category'
      Visible = True
    end
    object cxDBPivotGrid1Price: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      DataBinding.FieldName = 'Price'
      RepositoryItem = dmPrinting.EditRepositoryPrice
      Visible = True
    end
  end
end
