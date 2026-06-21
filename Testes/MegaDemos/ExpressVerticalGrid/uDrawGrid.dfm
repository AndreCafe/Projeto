inherited frmDrawGrid: TfrmDrawGrid
  Width = 854
  Height = 484
  inherited plTop: TPanel
    Width = 854
  end
  inherited pnlSeparator: TPanel
    Width = 854
  end
  inherited pnlDescription: TPanel
    Top = 439
    Width = 854
    inherited lblRight1: TLabel
      Left = 849
    end
    inherited lblTop1: TLabel
      Width = 854
    end
    inherited lblBottom1: TLabel
      Width = 854
    end
    inherited pnlHintInternal: TPanel
      Width = 844
      inherited lblRight2: TLabel
        Left = 839
      end
      inherited lblTop2: TLabel
        Width = 844
      end
      inherited lblBottom2: TLabel
        Width = 844
      end
      inherited lblDescription: TLabel
        Width = 834
      end
    end
  end
  object DrawGrid: TDrawGrid
    Left = 0
    Top = 25
    Width = 854
    Height = 414
    Align = alClient
    Color = 14277853
    ColCount = 7
    Ctl3D = True
    DefaultColWidth = 109
    DefaultRowHeight = 68
    DefaultDrawing = False
    FixedColor = clGray
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowMoving, goColMoving, goRowSelect, goThumbTracking]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnDrawCell = DrawGridDrawCell
  end
end
