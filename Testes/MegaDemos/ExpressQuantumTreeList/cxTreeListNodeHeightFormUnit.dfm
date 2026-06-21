inherited frmNodeHeight: TfrmNodeHeight
  Caption = 'Customizable Node Height'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Style.BorderStyle = ebsNone
    inherited cxGroupBox6: TcxGroupBox
      ExplicitWidth = 746
      Width = 746
      inherited pnlHintInternal: TPanel
        Width = 744
        ExplicitWidth = 744
        inherited lblRight2: TLabel
          Left = 739
          ExplicitLeft = 739
        end
        inherited lblTop2: TLabel
          Width = 744
          ExplicitWidth = 744
        end
        inherited lblBottom2: TLabel
          Width = 744
          ExplicitWidth = 744
        end
        inherited lblDescription: TLabel
          Width = 734
          ExplicitWidth = 734
        end
      end
    end
  end
  inherited gbTreeListPlace: TcxGroupBox
    Top = 44
    ExplicitTop = 44
    ExplicitHeight = 363
    Height = 363
    inherited cxGroupBox4: TcxGroupBox
      ExplicitHeight = 352
      Height = 352
    end
    inherited cxGroupBox5: TcxGroupBox
      ExplicitHeight = 352
      Height = 352
    end
    inherited tlUnbound: TcxTreeList
      Height = 352
      DefaultRowHeight = 19
      ExplicitHeight = 352
    end
  end
  object cxGroupBox3: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    DesignSize = (
      760
      44)
    Height = 44
    Width = 760
    object cxGroupBox1: TcxGroupBox
      Left = 7
      Top = 7
      Anchors = [akLeft, akTop, akRight, akBottom]
      PanelStyle.Active = True
      TabOrder = 0
      Height = 37
      Width = 746
      object cxLabel1: TcxLabel
        Left = 16
        Top = 8
        Caption = 'First Node'#39's Height:'
        Transparent = True
      end
      object seHeight: TcxSpinEdit
        Left = 120
        Top = 8
        Properties.AssignedValues.MinValue = True
        Properties.MaxValue = 1000.000000000000000000
        Properties.OnChange = cxSpinEdit1PropertiesChange
        TabOrder = 1
        Value = 20
        Width = 121
      end
      object seDefaultHeight: TcxSpinEdit
        Left = 407
        Top = 8
        Properties.AssignedValues.MinValue = True
        Properties.MaxValue = 1000.000000000000000000
        Properties.OnChange = seDefaultHeightPropertiesChange
        TabOrder = 2
        Value = 20
        Width = 121
      end
      object cxLabel2: TcxLabel
        Left = 296
        Top = 8
        Caption = 'Default Row Height:'
        Transparent = True
      end
    end
  end
  object Timer: TTimer
    Interval = 50
    OnTimer = TimerTimer
    Left = 616
    Top = 8
  end
end
