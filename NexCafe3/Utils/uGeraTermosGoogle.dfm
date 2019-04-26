object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 329
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 48
    Top = 32
    Width = 121
    Height = 153
    Lines.Strings = (
      'Gerenciador'
      'Administrador'
      'Gestor'
      'Gest'#227'o'
      'Software'
      'Gerenciamento'
      'Administra'#231#227'o'
      'Controle'
      'Controlador'
      'Tarifador'
      'Tarifa'#231#227'o')
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 0
    Top = 220
    Width = 472
    Height = 109
    Align = alBottom
    Lines.Strings = (
      'Memo2')
    TabOrder = 1
    ExplicitTop = 136
  end
  object Button1: TButton
    Left = 192
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
end
