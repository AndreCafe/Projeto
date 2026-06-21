inherited frmFieldsCustomization: TfrmFieldsCustomization
  Caption = 'Fields Customization'
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 36
    Height = 284
    OnCustomization = PivotGridCustomization
    inherited pgfCountry: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 1
    end
    inherited pgfName: TcxDBPivotGridField
      AreaIndex = 0
      Visible = False
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      Width = 155
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 4
      Hidden = True
      Visible = False
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      AreaIndex = 5
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      Width = 155
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      AreaIndex = 6
      Visible = False
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 1
      Hidden = True
      Visible = False
    end
    inherited pgfQuantity: TcxDBPivotGridField
      AreaIndex = 2
      Visible = False
    end
    inherited pgfDiscount: TcxDBPivotGridField
      AreaIndex = 3
      Hidden = True
      Visible = False
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object cxbtnSetVisible: TcxButton
      Left = 16
      Top = 6
      Width = 177
      Height = 24
      Caption = 'Show Customization Form'
      TabOrder = 0
      OnClick = cxbtnSetVisibleClick
    end
  end
end
