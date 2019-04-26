object Form24: TForm24
  Left = 0
  Top = 0
  Caption = 'Form24'
  ClientHeight = 670
  ClientWidth = 665
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
  object M2: TMozillaBrowser
    Left = 200
    Top = 184
    Width = 73
    Height = 129
    TabOrder = 2
    ControlData = {000300008B070000550D0000}
  end
  object M: TMozillaBrowser
    Left = 130
    Top = 10
    Width = 200
    Height = 650
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnBeforeNavigate2 = MBeforeNavigate2
    OnNewWindow2 = MNewWindow2
    OnNavigateComplete2 = MNavigateComplete2
    ControlData = {00030000AC1400002E430000}
  end
  object Button1: TButton
    Left = 368
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 368
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 376
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 384
    Top = 352
    Width = 185
    Height = 289
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
  end
  object WB: TWebBrowser
    Left = 520
    Top = 72
    Width = 300
    Height = 150
    TabOrder = 6
    ControlData = {
      4C000000021F0000810F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    Left = 72
    Top = 104
  end
end
