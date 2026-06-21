object OptionsForm: TOptionsForm
  Left = 351
  Top = 244
  BorderStyle = bsDialog
  Caption = 'OrgChart Options'
  ClientHeight = 232
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TcxGroupBox
    Left = 8
    Top = 8
    PanelStyle.Active = True
    TabOrder = 2
    Height = 185
    Width = 356
    object Label1: TLabel
      Left = 234
      Top = 19
      Width = 41
      Height = 13
      Caption = 'Indent X'
      Transparent = True
    end
    object Label2: TLabel
      Left = 234
      Top = 47
      Width = 41
      Height = 13
      Caption = 'Indent Y'
      Transparent = True
    end
    object Label3: TLabel
      Left = 234
      Top = 75
      Width = 48
      Height = 13
      Caption = 'Line width'
      Transparent = True
    end
    object cbButtons: TcxCheckBox
      Left = 18
      Top = 138
      Caption = 'Show Buttons'
      TabOrder = 0
      Transparent = True
      Width = 100
    end
    object cbCanDrag: TcxCheckBox
      Left = 121
      Top = 106
      Caption = 'Can Drag'
      TabOrder = 1
      Transparent = True
      Width = 100
    end
    object cbEdit: TcxCheckBox
      Left = 18
      Top = 154
      Caption = 'Edit'
      TabOrder = 2
      Transparent = True
      Width = 100
    end
    object cbFocus: TcxCheckBox
      Left = 18
      Top = 122
      Caption = 'Show Focus'
      TabOrder = 3
      Transparent = True
      Width = 100
    end
    object cbInsDel: TcxCheckBox
      Left = 121
      Top = 138
      Caption = 'Insert, Delete'
      TabOrder = 4
      Transparent = True
      Width = 100
    end
    object cbSelect: TcxCheckBox
      Left = 18
      Top = 106
      Caption = 'Show Select'
      TabOrder = 5
      Transparent = True
      Width = 100
    end
    object cbShowDrag: TcxCheckBox
      Left = 121
      Top = 122
      Caption = 'Show Drag'
      TabOrder = 6
      Transparent = True
      Width = 100
    end
    object cbShowImages: TcxCheckBox
      Left = 121
      Top = 154
      Caption = 'Show Images'
      TabOrder = 7
      Transparent = True
      Width = 100
    end
    object GroupBox1: TcxGroupBox
      Left = 9
      Top = 9
      Caption = ' Edit Mode '
      TabOrder = 8
      Height = 93
      Width = 217
      object cbLeft: TcxCheckBox
        Left = 9
        Top = 16
        Caption = 'Left'
        TabOrder = 0
        Transparent = True
        Width = 100
      end
      object cbCenter: TcxCheckBox
        Left = 9
        Top = 32
        Caption = 'Center'
        TabOrder = 1
        Transparent = True
        Width = 100
      end
      object cbRight: TcxCheckBox
        Left = 9
        Top = 48
        Caption = 'Right'
        TabOrder = 2
        Transparent = True
        Width = 100
      end
      object cbVCenter: TcxCheckBox
        Left = 9
        Top = 64
        Caption = 'Vert Center'
        TabOrder = 3
        Transparent = True
        Width = 100
      end
      object cbWrap: TcxCheckBox
        Left = 112
        Top = 16
        Caption = 'Wrap'
        TabOrder = 4
        Transparent = True
        Width = 100
      end
      object cbUpper: TcxCheckBox
        Left = 112
        Top = 32
        Caption = 'Upper'
        TabOrder = 5
        Transparent = True
        Width = 100
      end
      object cbLower: TcxCheckBox
        Left = 112
        Top = 48
        Caption = 'Lower'
        TabOrder = 6
        Transparent = True
        Width = 100
      end
      object cbGrow: TcxCheckBox
        Left = 112
        Top = 64
        Caption = 'Grow'
        TabOrder = 7
        Transparent = True
        Width = 100
      end
    end
    object seLineWidth: TcxSpinEdit
      Left = 286
      Top = 71
      Properties.MaxValue = 50.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 9
      Value = 1
      Width = 61
    end
    object seX: TcxSpinEdit
      Left = 286
      Top = 15
      TabOrder = 10
      Width = 61
    end
    object seY: TcxSpinEdit
      Left = 286
      Top = 43
      TabOrder = 11
      Width = 61
    end
  end
  object BitBtn1: TcxButton
    Left = 289
    Top = 199
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
  end
  object BitBtn2: TcxButton
    Left = 208
    Top = 199
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = BitBtn2Click
  end
end
