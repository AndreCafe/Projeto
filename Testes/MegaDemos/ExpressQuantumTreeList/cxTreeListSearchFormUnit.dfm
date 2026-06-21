inherited frmSearch: TfrmSearch
  Caption = 'Search'
  ClientWidth = 668
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Style.BorderStyle = ebsNone
    ExplicitWidth = 668
    Width = 668
    inherited cxGroupBox6: TcxGroupBox
      ExplicitWidth = 654
      Width = 654
      inherited pnlHintInternal: TPanel
        Width = 652
        ExplicitWidth = 652
        inherited lblRight2: TLabel
          Left = 647
          ExplicitLeft = 647
        end
        inherited lblTop2: TLabel
          Width = 652
          ExplicitWidth = 652
        end
        inherited lblBottom2: TLabel
          Width = 652
          ExplicitWidth = 652
        end
        inherited lblDescription: TLabel
          Width = 642
          ExplicitWidth = 642
        end
      end
    end
  end
  inherited gbTreeListPlace: TcxGroupBox
    Top = 89
    ExplicitTop = 89
    ExplicitWidth = 668
    ExplicitHeight = 357
    Height = 357
    Width = 668
    inherited cxGroupBox4: TcxGroupBox
      ExplicitHeight = 346
      Height = 346
    end
    inherited cxGroupBox5: TcxGroupBox
      Left = 660
      ExplicitLeft = 660
      ExplicitHeight = 346
      Height = 346
    end
    inherited cxGroupBox2: TcxGroupBox
      ExplicitWidth = 664
      Width = 664
    end
    inherited tlUnbound: TcxTreeList
      Width = 652
      Height = 346
      OptionsView.Indicator = True
      ExplicitWidth = 652
      ExplicitHeight = 346
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
      668
      89)
    Height = 89
    Width = 668
    object cxGroupBox1: TcxGroupBox
      Left = 7
      Top = 7
      Anchors = [akLeft, akTop, akRight, akBottom]
      PanelStyle.Active = True
      TabOrder = 0
      Height = 82
      Width = 654
      object cxLabel1: TcxLabel
        Left = 16
        Top = 33
        Caption = 'Search Text:'
        Transparent = True
      end
      object chkExpandedOnly: TcxCheckBox
        Left = 256
        Top = 8
        Caption = 'Expanded Only'
        TabOrder = 5
        Transparent = True
        Width = 97
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 56
        Caption = 'Search Mode:'
        Transparent = True
      end
      object cbMode: TcxComboBox
        Left = 102
        Top = 56
        Properties.Items.Strings = (
          'Normal'
          'Like'
          'Exact')
        TabOrder = 3
        Text = 'Normal'
        Width = 121
      end
      object edtText: TcxTextEdit
        Left = 102
        Top = 32
        TabOrder = 2
        OnKeyPress = edtTextKeyPress
        Width = 121
      end
      object chkCaseSensitive: TcxCheckBox
        Left = 256
        Top = 32
        Caption = 'Case Sensitive'
        TabOrder = 6
        Transparent = True
        Width = 97
      end
      object btnFind: TcxButton
        Left = 455
        Top = 57
        Width = 75
        Height = 21
        Caption = 'Find'
        TabOrder = 11
        OnClick = btnFindClick
      end
      object chkStartFromCurrent: TcxCheckBox
        Left = 256
        Top = 56
        Caption = 'Start From the Focused Node'
        TabOrder = 7
        Transparent = True
        Width = 169
      end
      object chkForward: TcxCheckBox
        Left = 455
        Top = 10
        Caption = 'Forward'
        TabOrder = 8
        Transparent = True
        Width = 75
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 10
        Caption = 'Presets:'
        Transparent = True
      end
      object cbPreset: TcxComboBox
        Left = 102
        Top = 8
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Mars'
          '%a_u%'
          'Titan')
        Properties.OnChange = cbPresetPropertiesChange
        TabOrder = 1
        Width = 121
      end
      object chkIgnoreStart: TcxCheckBox
        Left = 455
        Top = 34
        Caption = 'Ignore the Focused Node'
        TabOrder = 9
        Transparent = True
        Width = 146
      end
    end
  end
end
