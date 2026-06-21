inherited frmMenus: TfrmMenus
  Caption = 'Built-in Context Menus'
  OnCreate = FormCreate
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
    Top = 56
    ExplicitTop = 56
    ExplicitHeight = 216
    Height = 216
    inherited cxGroupBox4: TcxGroupBox
      ExplicitHeight = 205
      Height = 205
    end
    inherited cxGroupBox5: TcxGroupBox
      ExplicitHeight = 205
      Height = 205
    end
    inherited tlDB: TcxDBTreeList
      Height = 205
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
          Caption.Text = 'Gearbox'
        end
        item
          Caption.Text = 'Fuel Economy (mpg)'
        end
        item
          Caption.Text = 'Details'
        end>
      OptionsView.Footer = True
      OptionsView.GroupFooters = tlgfAlwaysVisible
      ExplicitHeight = 205
      inherited clnPrice: TcxDBTreeListColumn
        Summary.FooterSummaryItems = <
          item
            Kind = skSum
          end>
        Summary.GroupFooterSummaryItems = <
          item
            Kind = skSum
          end>
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
      56)
    Height = 56
    Width = 617
    object gbMenus: TcxGroupBox
      Left = 7
      Top = 7
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Use Built-in Menus'
      PanelStyle.Active = True
      TabOrder = 0
      Height = 49
      Width = 603
      object chkHeader: TcxCheckBox
        Left = 16
        Top = 20
        Caption = 'Column Header Context Menu'
        TabOrder = 0
        Transparent = True
        OnClick = chkHeaderClick
        Width = 169
      end
      object chkGroupFooter: TcxCheckBox
        Left = 216
        Top = 20
        Caption = 'Group Footer Context Menu'
        TabOrder = 1
        Transparent = True
        OnClick = chkGroupFooterClick
        Width = 161
      end
      object chkFooter: TcxCheckBox
        Left = 416
        Top = 20
        Caption = 'Footer Context Menu'
        TabOrder = 2
        Transparent = True
        OnClick = chkFooterClick
        Width = 129
      end
    end
  end
  object Timer: TTimer
    Interval = 500
    OnTimer = TimerTimer
    Left = 456
    Top = 128
  end
end
