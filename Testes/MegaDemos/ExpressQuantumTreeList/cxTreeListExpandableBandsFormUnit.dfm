inherited frmExpandableBands: TfrmExpandableBands
  Caption = 'Expandable Bands'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Style.BorderStyle = ebsNone
    TabOrder = 1
    inherited cxGroupBox6: TcxGroupBox
      ExplicitWidth = 783
      Width = 783
      inherited pnlHintInternal: TPanel
        Width = 781
        ExplicitWidth = 781
        inherited lblRight2: TLabel
          Left = 776
          ExplicitLeft = 776
        end
        inherited lblTop2: TLabel
          Width = 781
          ExplicitWidth = 781
        end
        inherited lblBottom2: TLabel
          Width = 781
          ExplicitWidth = 781
        end
        inherited lblDescription: TLabel
          Width = 771
          ExplicitWidth = 771
        end
      end
    end
  end
  inherited gbTreeListPlace: TcxGroupBox
    Top = 44
    TabOrder = 0
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
      object cbExpandColumn: TcxComboBox
        Left = 113
        Top = 8
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 0
        OnClick = cbExpandColumnClick
        Width = 137
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 10
        Caption = 'Expandable Band:'
        Transparent = True
      end
    end
  end
end
