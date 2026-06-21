inherited frmPrefilter: TfrmPrefilter
  Caption = 'Prefilter'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBPivotGrid: TcxDBPivotGrid
    Top = 62
    Height = 258
    OptionsView.GrandTotalWidth = 736
    OnFilterChanged = DBPivotGridFilterChanged
    inherited pgfCountry: TcxDBPivotGridField
      AreaIndex = 1
    end
    inherited pgfName: TcxDBPivotGridField
      Area = faColumn
      Width = 150
    end
    inherited pgfCategoryName: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
    end
    inherited pgfOrderDate: TcxDBPivotGridField
      AreaIndex = 0
      DataBinding.ValueType = 'DateTime'
      Options.Filtering = True
    end
    inherited pgfOrderYear: TcxDBPivotGridField
      AreaIndex = 4
      Visible = False
    end
    inherited pgfOrderQuarter: TcxDBPivotGridField
      AreaIndex = 5
      Visible = False
    end
    inherited pgfOrderMonth: TcxDBPivotGridField
      AreaIndex = 6
      Visible = False
    end
    inherited pgfUnitPrice: TcxDBPivotGridField
      AreaIndex = 2
      Visible = False
    end
    inherited pgfQuantity: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
    end
    inherited pgfDiscount: TcxDBPivotGridField
      AreaIndex = 3
      Visible = False
    end
    inherited pgfExtendedPrice: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
    end
    inherited pgfSalesPerson: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 108
      Height = 13
      Caption = 'Current Active Prefilter:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object cbFilters: TcxComboBox
      Left = 120
      Top = 20
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = cbFiltersPropertiesChange
      TabOrder = 0
      Width = 353
    end
  end
end
