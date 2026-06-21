inherited frmGridFixedBands: TfrmGridFixedBands
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      object BandedTableView: TcxGridBandedTableView
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '### ### ###'
            Kind = skSum
            Column = clTotals
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.BandMoving = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Bands = <
          item
            Caption = 'Manufacturer'
            FixedKind = fkLeft
            Styles.Content = cxStyle1
          end
          item
            Caption = 'Year'
            Width = 1615
          end
          item
            Caption = 'Totals'
            FixedKind = fkRight
            Styles.Content = cxStyle2
          end>
        object clCarModel: TcxGridBandedColumn
          Caption = 'Make'
          Options.Editing = False
          Width = 150
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object clTotals: TcxGridBandedColumn
          Caption = 'Units Sold'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 120
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
      end
      object GridLevel: TcxGridLevel
        GridView = BandedTableView
      end
    end
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 376
    Top = 40
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 12510884
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 12313056
    end
  end
end
