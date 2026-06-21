inherited frmTeeChart: TfrmTeeChart
  Width = 579
  Height = 466
  inherited plTop: TPanel
    Width = 579
  end
  inherited pnlSeparator: TPanel
    Width = 579
  end
  inherited pnlDescription: TPanel
    Top = 421
    Width = 579
    inherited lblRight1: TLabel
      Left = 574
    end
    inherited lblTop1: TLabel
      Width = 579
    end
    inherited lblBottom1: TLabel
      Width = 579
    end
    inherited pnlHintInternal: TPanel
      Width = 569
      inherited lblRight2: TLabel
        Left = 564
      end
      inherited lblTop2: TLabel
        Width = 569
      end
      inherited lblBottom2: TLabel
        Width = 569
      end
      inherited lblDescription: TLabel
        Width = 559
      end
    end
  end
  object TeeChart: TChart
    Left = 0
    Top = 25
    Width = 579
    Height = 396
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Color = 8454143
    BackWall.Pen.Color = clRed
    BottomWall.Size = 4
    LeftWall.Color = 16777088
    LeftWall.Size = 4
    Title.Alignment = taRightJustify
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -16
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      'American Charting Suppliers, Inc.'
      '1997 Production Volume')
    BackColor = 8454143
    Frame.Color = clRed
    LeftAxis.Grid.Visible = False
    LeftAxis.Title.Caption = 'Millions of $'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -15
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Alignment = laTop
    Legend.ColorWidth = 22
    Legend.DividingLines.Color = clSilver
    Legend.DividingLines.Visible = True
    Legend.ShadowColor = clGray
    Legend.ShadowSize = 5
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Series5: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clNavy
      Title = 'San Francisco'
      MultiBar = mbNone
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series7: TBarSeries
      Marks.ArrowLength = 20
      Marks.BackColor = 16777088
      Marks.Visible = False
      SeriesColor = clYellow
      Title = 'Hong Kong'
      MultiBar = mbNone
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series6: TBarSeries
      Marks.ArrowLength = 20
      Marks.BackColor = 65408
      Marks.Visible = True
      SeriesColor = clBlue
      Title = 'Paris'
      MultiBar = mbNone
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
end
