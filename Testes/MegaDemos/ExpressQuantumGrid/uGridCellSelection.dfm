inherited frmGridCellSelection: TfrmGridCellSelection
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      Top = 41
      Height = 123
      object TableView: TcxGridTableView
        OnSelectionChanged = TableViewSelectionChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 40
        Styles.OnGetHeaderStyle = TableViewStylesGetHeaderStyle
        OnColumnHeaderClick = TableViewColumnHeaderClick
        OnCustomDrawIndicatorCell = TableViewCustomDrawIndicatorCell
      end
      object Level: TcxGridLevel
        GridView = TableView
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TcxLabel
        Left = 4
        Top = 8
        Caption = 'Selected rows:'
        Transparent = True
      end
      object Label2: TcxLabel
        Left = 4
        Top = 24
        Caption = 'Selected columns:'
        Transparent = True
      end
      object Label3: TcxLabel
        Left = 160
        Top = 8
        Caption = 'Selected Cells:'
        Transparent = True
      end
      object Label4: TcxLabel
        Left = 160
        Top = 24
        Caption = 'Selected Summary:'
        Transparent = True
      end
      object lblSelectedRows: TcxLabel
        Left = 96
        Top = 8
        Caption = 'lblSelectedRows'
        Transparent = True
      end
      object lblSelectedColumns: TcxLabel
        Left = 96
        Top = 24
        Caption = 'lblSelectedColumns'
        Transparent = True
      end
      object lblSelectedCells: TcxLabel
        Left = 259
        Top = 8
        Caption = 'lblSelectedCells'
        Transparent = True
      end
      object lblSelectedSummary: TcxLabel
        Left = 258
        Top = 24
        Caption = 'lblSelectedSummary'
        Transparent = True
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 336
    Top = 88
    PixelsPerInch = 96
    object styleSelected: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object styleNormal: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
  end
end
