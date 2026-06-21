object Form27: TForm27
  Left = 0
  Top = 0
  Caption = 'Form27'
  ClientHeight = 245
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
    Left = 0
    Top = 49
    Width = 472
    Height = 196
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    ExplicitLeft = 48
    ExplicitTop = 24
    ExplicitWidth = 289
    ExplicitHeight = 89
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 49
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
