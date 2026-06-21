object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Serial HD'
  ClientHeight = 223
  ClientWidth = 595
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
    Left = 0
    Top = 0
    Width = 595
    Height = 25
    Align = alTop
    Caption = 'Refresh'
    TabOrder = 0
    OnClick = Button1Click
    ExplicitLeft = 32
    ExplicitTop = 32
    ExplicitWidth = 193
  end
  object Memo1: TMemo
    Left = 0
    Top = 25
    Width = 595
    Height = 198
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 88
    ExplicitWidth = 426
    ExplicitHeight = 135
  end
  object ds: TGetDiskSerial
    RegCode = 'E3MA2-LLT4Q-QSKH3-JHFF7-YJ7NN'
    DriveID = 0
    Left = 288
    Top = 24
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 376
    Top = 128
  end
end
