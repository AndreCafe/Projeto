inherited frameCustomEditorsProperties: TframeCustomEditorsProperties
  object Bevel: TBevel [0]
    Left = 0
    Top = 170
    Width = 491
    Height = 2
    Align = alTop
    Shape = bsTopLine
  end
  object lblSeparator: TcxLabel [1]
    Left = 0
    Top = 87
  end
  inherited plTop: TPanel
    Width = 491
  end
  inherited pnlSeparator: TPanel
    Top = 172
    Width = 491
  end
  inherited pnlDescription: TPanel
    Top = 204
    Width = 491
    Visible = True
    inherited lblRight1: TcxLabel
      Left = 486
    end
    inherited lblTop1: TcxLabel
      Width = 491
    end
    inherited lblBottom1: TcxLabel
      Width = 491
    end
    inherited pnlHintInternal: TPanel
      Width = 481
      Visible = False
      inherited lblRight2: TcxLabel
        Left = 476
      end
      inherited lblTop2: TcxLabel
        Width = 481
      end
      inherited lblBottom2: TcxLabel
        Width = 481
      end
      inherited lblDescription: TcxLabel
        Width = 471
      end
    end
  end
  object PTitle: TPanel
    Left = 0
    Top = 88
    Width = 491
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 3
    DesignSize = (
      491
      82)
    object Bevel23: TBevel
      Left = 0
      Top = 0
      Width = 491
      Height = 2
      Align = alTop
      Shape = bsTopLine
    end
    object lbEditName: TcxLabel
      Left = 9
      Top = 9
      Caption = 'lbEditName'
    end
    object lbEditDescription: TcxLabel
      Left = 20
      Top = 25
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'lbEditDescription'
      Properties.WordWrap = True
      Height = 53
      Width = 1019
    end
  end
  object pnlPageControl: TPanel
    Left = 0
    Top = 172
    Width = 491
    Height = 32
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 4
    object spHint: TShape
      Left = 2
      Top = 308
      Width = 482
      Height = 69
      Brush.Color = clInfoBk
      Pen.Color = clBtnShadow
    end
    object lbHint: TcxLabel
      Left = 6
      Top = 312
      AutoSize = False
      Caption = 'Move the mouse over a control for a hint'
      Properties.WordWrap = True
      Transparent = True
      Height = 63
      Width = 474
    end
    object PageControl: TPageControl
      Left = 0
      Top = 3
      Width = 491
      Height = 304
      Align = alTop
      TabOrder = 0
      Visible = False
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 491
      Height = 3
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
  object pnlInspector: TPanel
    Left = 491
    Top = 172
    Width = 0
    Height = 32
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 5
  end
  object PageScroller: TPageScroller
    Left = 0
    Top = 57
    Width = 491
    Height = 31
    Align = alTop
    Control = ToolBar
    TabOrder = 6
    object ToolBar: TToolBar
      Left = 0
      Top = 0
      Width = 861
      Height = 31
      Align = alNone
      ButtonHeight = 30
      ButtonWidth = 31
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = imgEditIcon
      TabOrder = 0
    end
  end
  object imgEditIcon: TImageList
    Height = 24
    Width = 24
    Left = 186
    Top = 26
  end
end
