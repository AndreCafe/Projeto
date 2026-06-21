object dxFrame: TdxFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  OnResize = FrameResize
  ExplicitWidth = 443
  ExplicitHeight = 270
  object plTop: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 25
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
    Top = 25
    Width = 443
    Height = 0
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
  end
  object pnlDescription: TPanel
    Left = 0
    Top = 225
    Width = 443
    Height = 45
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BevelWidth = 4
    TabOrder = 2
    Visible = False
    object lblLeft1: TLabel
      Left = 0
      Top = 5
      Width = 5
      Height = 35
      Align = alLeft
      AutoSize = False
    end
    object lblRight1: TLabel
      Left = 438
      Top = 5
      Width = 5
      Height = 35
      Align = alRight
      AutoSize = False
    end
    object lblTop1: TLabel
      Left = 0
      Top = 0
      Width = 443
      Height = 5
      Align = alTop
      AutoSize = False
    end
    object lblBottom1: TLabel
      Left = 0
      Top = 40
      Width = 443
      Height = 5
      Align = alBottom
      AutoSize = False
    end
    object pnlHintInternal: TPanel
      Left = 5
      Top = 5
      Width = 433
      Height = 35
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BevelWidth = 4
      Color = clInfoBk
      ParentBackground = False
      TabOrder = 0
      object lblLeft2: TLabel
        Left = 0
        Top = 5
        Width = 5
        Height = 25
        Align = alLeft
        AutoSize = False
      end
      object lblRight2: TLabel
        Left = 428
        Top = 5
        Width = 5
        Height = 25
        Align = alRight
        AutoSize = False
      end
      object lblTop2: TLabel
        Left = 0
        Top = 0
        Width = 433
        Height = 5
        Align = alTop
        AutoSize = False
      end
      object lblBottom2: TLabel
        Left = 0
        Top = 30
        Width = 433
        Height = 5
        Align = alBottom
        AutoSize = False
      end
      object lblDescription: TLabel
        Left = 5
        Top = 5
        Width = 423
        Height = 25
        Align = alClient
        AutoSize = False
        Transparent = True
        WordWrap = True
      end
    end
  end
end
