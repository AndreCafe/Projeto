object Form25: TForm25
  Left = 0
  Top = 0
  Caption = 'Form25'
  ClientHeight = 397
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 57
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 344
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 57
    Width = 472
    Height = 340
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object WL: TWinList
    Left = 152
    Top = 80
  end
end
