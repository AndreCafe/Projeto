inherited frameCustomEditorsProperties: TframeCustomEditorsProperties
  ExplicitWidth = 681
  ExplicitHeight = 624
  object lblSeparator: TLabel [0]
    Left = 0
    Top = 87
    Width = 3
    Height = 13
  end
  object Bevel: TBevel [1]
    Left = 0
    Top = 138
    Width = 451
    Height = 2
    Align = alTop
    Shape = bsTopLine
    ExplicitWidth = 681
  end
  inherited plTop: TPanel
    Width = 451
    ExplicitWidth = 681
  end
  inherited pnlSeparator: TPanel
    Width = 451
    ExplicitWidth = 681
  end
  inherited pnlDescription: TPanel
    Top = 259
    Width = 451
    Visible = True
    ExplicitTop = 579
    ExplicitWidth = 681
    inherited lblRight1: TLabel
      Left = 676
      ExplicitLeft = 676
    end
    inherited lblTop1: TLabel
      Width = 681
      ExplicitWidth = 681
    end
    inherited lblBottom1: TLabel
      Width = 681
      ExplicitWidth = 681
    end
    inherited pnlHintInternal: TPanel
      Width = 671
      Visible = False
      ExplicitWidth = 671
      inherited lblRight2: TLabel
        Left = 666
        ExplicitLeft = 666
      end
      inherited lblTop2: TLabel
        Width = 671
        ExplicitWidth = 671
      end
      inherited lblBottom2: TLabel
        Width = 671
        ExplicitWidth = 671
      end
      inherited lblDescription: TLabel
        Width = 661
        ExplicitWidth = 661
      end
    end
  end
  object PTitle: TPanel
    Left = 0
    Top = 56
    Width = 451
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 3
    DesignSize = (
      451
      82)
    object lbEditName: TLabel
      Left = 9
      Top = 9
      Width = 53
      Height = 13
      Caption = 'lbEditName'
    end
    object lbEditDescription: TLabel
      Left = 20
      Top = 25
      Width = 1019
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'lbEditDescription'
      WordWrap = True
    end
    object Bevel23: TBevel
      Left = 0
      Top = 0
      Width = 451
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitWidth = 681
    end
  end
  object pnlPageControl: TPanel
    Left = 0
    Top = 140
    Width = 491
    Height = 119
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitHeight = 439
    object spHint: TShape
      Left = 2
      Top = 308
      Width = 482
      Height = 69
      Brush.Color = clInfoBk
      Pen.Color = clBtnShadow
    end
    object lbHint: TLabel
      Left = 6
      Top = 312
      Width = 474
      Height = 63
      AutoSize = False
      Caption = 'Move the mouse over a control for a hint'
      Transparent = True
      WordWrap = True
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
    Top = 140
    Width = 190
    Height = 119
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 5
    ExplicitHeight = 439
  end
  object PageScroller: TPageScroller
    Left = 0
    Top = 25
    Width = 451
    Height = 31
    Align = alTop
    Control = ToolBar
    TabOrder = 6
    ExplicitWidth = 681
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
