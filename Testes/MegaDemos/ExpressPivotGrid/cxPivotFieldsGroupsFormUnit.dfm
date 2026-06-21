inherited frmGroups: TfrmGroups
  Caption = 'Groups'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 36
    Height = 284
    Groups = <
      item
        IsCaptionAssigned = True
        Caption = 'FieldGroup 1'
      end
      item
        IsCaptionAssigned = True
        Caption = 'FieldGroup 2'
      end
      item
        IsCaptionAssigned = True
        Caption = 'FieldGroup 3'
      end>
    OptionsView.FilterFields = False
    OptionsView.FilterSeparator = False
    Styles.OnGetFieldHeaderStyle = PivotGridStylesGetFieldHeaderStyle
    inherited pgfName: TcxDBPivotGridField
      Area = faRow
      GroupIndex = 0
      GroupExpanded = False
      Width = 150
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      GroupIndex = 0
      Width = 150
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 2
      Hidden = True
      Visible = False
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      Caption = 'Year'
      GroupIndex = 1
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 1
      Caption = 'Quarter'
      GroupIndex = 1
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 2
      Caption = 'Month'
      GroupIndex = 1
      GroupExpanded = False
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 4
    end
    inherited pgfQuantity: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
      GroupIndex = 2
      GroupExpanded = False
    end
    inherited pgfDiscount: TcxDBPivotGridField
      AreaIndex = 3
      AllowedAreas = [faFilter]
      GroupExpanded = False
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      GroupIndex = 2
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      AreaIndex = 1
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
      Width = 130
      Height = 24
      Caption = 'Expand All Groups'
      TabOrder = 0
      OnClick = cxbtnSetVisibleClick
    end
    object cxButton1: TcxButton
      Left = 160
      Top = 6
      Width = 130
      Height = 24
      Caption = 'Collapse All Groups'
      TabOrder = 1
      OnClick = cxButton1Click
    end
  end
end
