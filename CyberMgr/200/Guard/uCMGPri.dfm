object FrmPri: TFrmPri
  Left = 336
  Top = 211
  Width = 292
  Height = 234
  Caption = 'FrmPri'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'TCP/IP'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Messaging'
    TabOrder = 1
    OnClick = Button2Click
  end
  object LB: TListBox
    Left = 0
    Top = 48
    Width = 284
    Height = 159
    Align = alBottom
    ItemHeight = 13
    TabOrder = 2
  end
end
