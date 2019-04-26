object Form34: TForm34
  Left = 0
  Top = 0
  Caption = 'Form34'
  ClientHeight = 346
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 176
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 344
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object LB: TListBox
    Left = 0
    Top = 160
    Width = 758
    Height = 186
    Align = alBottom
    ItemHeight = 13
    TabOrder = 2
  end
  object Button3: TButton
    Left = 184
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Inicia'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 320
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Finaliza'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 24
    Top = 16
  end
end
