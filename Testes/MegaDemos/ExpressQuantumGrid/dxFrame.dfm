object dxFrame: TdxFrame
  Left = 0
  Top = 0
  Width = 435
  Height = 266
  Align = alClient
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  OnResize = FrameResize
  object plTop: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnlSeparator: TPanel
    Left = 0
    Top = 57
    Width = 435
    Height = 0
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
  end
  object pnlDescription: TPanel
    Left = 0
    Top = 221
    Width = 435
    Height = 45
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BevelWidth = 4
    TabOrder = 2
    Visible = False
    object lblLeft1: TcxLabel
      Left = 0
      Top = 5
      Align = alLeft
      AutoSize = False
      Height = 35
      Width = 5
    end
    object lblRight1: TcxLabel
      Left = 430
      Top = 5
      Align = alRight
      AutoSize = False
      Height = 35
      Width = 5
    end
    object lblTop1: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Height = 5
      Width = 435
    end
    object lblBottom1: TcxLabel
      Left = 0
      Top = 40
      Align = alBottom
      AutoSize = False
      Height = 5
      Width = 435
    end
    object pnlHintInternal: TPanel
      Left = 5
      Top = 5
      Width = 425
      Height = 35
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BevelWidth = 4
      Color = clInfoBk
      ParentBackground = False
      TabOrder = 0
      object lblLeft2: TcxLabel
        Left = 0
        Top = 5
        Align = alLeft
        AutoSize = False
        Height = 25
        Width = 5
      end
      object lblRight2: TcxLabel
        Left = 420
        Top = 5
        Align = alRight
        AutoSize = False
        Height = 25
        Width = 5
      end
      object lblTop2: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Height = 5
        Width = 425
      end
      object lblBottom2: TcxLabel
        Left = 0
        Top = 30
        Align = alBottom
        AutoSize = False
        Height = 5
        Width = 425
      end
      object lblDescription: TcxLabel
        Left = 5
        Top = 5
        Align = alClient
        AutoSize = False
        Properties.WordWrap = True
        Transparent = True
        Height = 25
        Width = 415
      end
    end
  end
end
