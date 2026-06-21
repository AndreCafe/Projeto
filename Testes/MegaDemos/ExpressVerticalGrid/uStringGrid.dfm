inherited frmStringGrid: TfrmStringGrid
  object StringGrid: TStringGrid
    Left = 0
    Top = 25
    Width = 443
    Height = 207
    Align = alClient
    ColCount = 11
    Ctl3D = True
    DefaultColWidth = 60
    DefaultRowHeight = 25
    FixedColor = 10790566
    RowCount = 11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowMoving, goColMoving, goThumbTracking]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnDrawCell = StringGridDrawCell
  end
end
