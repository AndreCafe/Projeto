object frTeeChartFrame: TfrTeeChartFrame
  Left = 0
  Top = 0
  ClientHeight = 369
  ClientWidth = 664
  Color = clBtnFace
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TeeChart: TChart
    Left = 0
    Top = 0
    Width = 664
    Height = 369
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Color = 8454143
    BackWall.Pen.Color = clRed
    BottomWall.Size = 4
    LeftWall.Color = 16777088
    LeftWall.Size = 4
    Legend.Alignment = laTop
    Legend.ColorWidth = 22
    Legend.DividingLines.Color = clSilver
    Legend.DividingLines.Visible = True
    Title.Alignment = taRightJustify
    Title.Font.Height = -16
    Title.Text.Strings = (
      'American Charting Suppliers, Inc.'
      '1997 Production Volume')
    Frame.Color = clRed
    LeftAxis.Grid.Visible = False
    LeftAxis.Title.Caption = 'Millions of $'
    LeftAxis.Title.Font.Height = -15
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Series5: TBarSeries
      Marks.Visible = False
      SeriesColor = clNavy
      Title = 'San Francisco'
      MultiBar = mbNone
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
    object Series7: TBarSeries
      Marks.BackColor = 16777088
      Marks.Visible = False
      SeriesColor = clYellow
      Title = 'Hong Kong'
      MultiBar = mbNone
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
    object Series6: TBarSeries
      Marks.BackColor = 65408
      Marks.Visible = True
      SeriesColor = clBlue
      Title = 'Paris'
      MultiBar = mbNone
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
end
