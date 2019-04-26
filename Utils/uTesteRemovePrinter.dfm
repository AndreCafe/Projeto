object Form33: TForm33
  Left = 0
  Top = 0
  Caption = 'Form33'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 224
    Top = 0
    Width = 411
    Height = 300
    Align = alRight
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object SI: TLMDSysInfo
    Left = 64
    Top = 144
  end
end
