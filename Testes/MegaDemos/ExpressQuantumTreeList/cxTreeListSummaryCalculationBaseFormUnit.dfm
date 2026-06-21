inherited frmSummaryCalculationBase: TfrmSummaryCalculationBase
  Caption = 'Customizable Summary Base'
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbTreeListPlace: TcxGroupBox
    Top = 44
    ExplicitTop = 44
    ExplicitHeight = 402
    Height = 402
    inherited cxGroupBox4: TcxGroupBox
      ExplicitHeight = 391
      Height = 391
    end
    inherited cxGroupBox5: TcxGroupBox
      ExplicitHeight = 391
      Height = 391
    end
    inherited tlUnbound: TcxTreeList
      Height = 391
      ExplicitHeight = 391
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    DesignSize = (
      797
      44)
    Height = 44
    Width = 797
    object cxGroupBox1: TcxGroupBox
      Left = 7
      Top = 7
      Anchors = [akLeft, akTop, akRight, akBottom]
      PanelStyle.Active = True
      TabOrder = 0
      Height = 37
      Width = 783
      object rbAll: TcxRadioButton
        Left = 16
        Top = 10
        Width = 135
        Height = 17
        Caption = 'All Child Nodes'
        TabOrder = 0
        OnClick = rbImmediateClick
        Transparent = True
      end
      object rbImmediate: TcxRadioButton
        Left = 167
        Top = 10
        Width = 162
        Height = 17
        Caption = 'Immediate Child Nodes Only'
        TabOrder = 1
        OnClick = rbImmediateClick
        Transparent = True
      end
    end
  end
  object Timer: TTimer
    Interval = 50
    OnTimer = TimerTimer
    Left = 416
    Top = 8
  end
end
