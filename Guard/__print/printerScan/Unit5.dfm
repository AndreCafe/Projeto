object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 281
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    562
    281)
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'cxButton1'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxMemo1: TcxMemo
    Left = 8
    Top = 39
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'cxMemo1')
    TabOrder = 1
    Height = 234
    Width = 546
  end
end
