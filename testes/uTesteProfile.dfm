object Form20: TForm20
  Left = 0
  Top = 0
  Caption = 'Form20'
  ClientHeight = 254
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object P: TLMDPrinterComboBox
    Left = 32
    Top = 72
    Width = 249
    Height = 20
    Color = clWhite
    Options = [poStartWithActive]
    TabOrder = 0
  end
  object Save: TButton
    Left = 32
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 1
    OnClick = SaveClick
  end
  object Restore: TButton
    Left = 32
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Restore'
    TabOrder = 2
    OnClick = RestoreClick
  end
  object Button1: TButton
    Left = 256
    Top = 128
    Width = 75
    Height = 25
    Caption = 'A4'
    TabOrder = 3
    OnClick = Button1Click
  end
end
