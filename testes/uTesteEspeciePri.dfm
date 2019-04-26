object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
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
  object edValor: TcxCurrencyEdit
    Left = 120
    Top = 64
    TabOrder = 0
    Width = 121
  end
  object Button1: TButton
    Left = 120
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button1'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
end
