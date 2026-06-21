inherited frmNodeVisibility: TfrmNodeVisibility
  Caption = 'Node Visibility'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Style.BorderStyle = ebsNone
    inherited cxGroupBox6: TcxGroupBox
      ExplicitWidth = 603
      Width = 603
      inherited pnlHintInternal: TPanel
        Width = 601
        ExplicitWidth = 601
        inherited lblRight2: TLabel
          Left = 596
          ExplicitLeft = 596
        end
        inherited lblTop2: TLabel
          Width = 601
          ExplicitWidth = 601
        end
        inherited lblBottom2: TLabel
          Width = 601
          ExplicitWidth = 601
        end
        inherited lblDescription: TLabel
          Width = 591
          ExplicitWidth = 591
        end
      end
    end
  end
  inherited gbTreeListPlace: TcxGroupBox
    Top = 44
    ExplicitTop = 44
    ExplicitHeight = 228
    Height = 228
    inherited cxGroupBox4: TcxGroupBox
      ExplicitHeight = 217
      Height = 217
    end
    inherited cxGroupBox5: TcxGroupBox
      ExplicitHeight = 217
      Height = 217
    end
    inherited tlDB: TcxDBTreeList
      Height = 217
      Bands = <
        item
          Caption.Text = 'Main Info'
        end
        item
          Caption.Text = 'Specifications'
          Visible = False
        end
        item
          Caption.Text = 'Engine'
        end
        item
          Caption.Text = 'Transmission'
        end
        item
          Caption.Text = 'Fuel Economy (mpg)'
        end
        item
          Caption.Text = 'Details'
        end>
      ExplicitHeight = 217
      inherited clnModel: TcxDBTreeListColumn
        Width = 128
      end
      inherited clnPrice: TcxDBTreeListColumn
        Width = 58
      end
      inherited clnHP: TcxDBTreeListColumn
        Width = 61
      end
      inherited clnDisplacement: TcxDBTreeListColumn
        Width = 52
      end
      inherited clnCylinders: TcxDBTreeListColumn
        Width = 34
      end
      inherited clnSpeed: TcxDBTreeListColumn
        Width = 37
      end
      inherited clnAutomatic: TcxDBTreeListColumn
        Width = 43
      end
      inherited clnHighway: TcxDBTreeListColumn
        Width = 40
      end
      inherited clnDescription: TcxDBTreeListColumn
        Width = 34
      end
      inherited clnHyperlink: TcxDBTreeListColumn
        Width = 86
      end
      inherited clnPicture: TcxDBTreeListColumn
        Width = 22
      end
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
      617
      44)
    Height = 44
    Width = 617
    object cxGroupBox1: TcxGroupBox
      Left = 7
      Top = 7
      Anchors = [akLeft, akTop, akRight, akBottom]
      PanelStyle.Active = True
      TabOrder = 0
      Height = 37
      Width = 603
      object chkManual: TcxCheckBox
        Left = 16
        Top = 10
        Caption = 'Show Cars With Manual Transmissions'
        State = cbsChecked
        TabOrder = 0
        Transparent = True
        OnClick = chkManualClick
        Width = 209
      end
      object chkAutomatic: TcxCheckBox
        Left = 255
        Top = 10
        Caption = 'Show Cars With Automatic Transmissions'
        State = cbsChecked
        TabOrder = 1
        Transparent = True
        OnClick = chkManualClick
        Width = 226
      end
    end
  end
end
