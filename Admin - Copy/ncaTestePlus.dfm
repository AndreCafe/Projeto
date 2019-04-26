object FrmTestePlus: TFrmTestePlus
  Left = 0
  Top = 0
  Caption = 'FrmTestePlus'
  ClientHeight = 254
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Edit1: TEdit
    Left = 24
    Top = 72
    Width = 425
    Height = 21
    TabOrder = 0
    Text = '1234567890123456789012345678'
  end
  object Button1: TButton
    Left = 24
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 24
    Top = 184
    Width = 425
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object edKeyIndex: TSpinEdit
    Left = 160
    Top = 120
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 3
  end
end
