object Form6: TForm6
  Left = 0
  Top = 0
  ActiveControl = edValor
  Caption = 'Form6'
  ClientHeight = 302
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 23
  object edValor: TcxCurrencyEdit
    Left = 80
    Top = 88
    EditValue = 100.000000000000000000
    TabOrder = 0
    Width = 281
  end
  object Button1: TButton
    Left = 384
    Top = 88
    Width = 97
    Height = 31
    Caption = 'Button1'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
end
