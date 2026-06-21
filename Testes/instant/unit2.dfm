object Form2: TForm2
  Left = 175
  Top = 231
  Width = 538
  Height = 321
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 40
    Top = 16
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 40
    Top = 64
    Width = 75
    Height = 25
    Caption = 'BitBtn2'
    TabOrder = 1
    OnEnter = BitBtn2Enter
    OnExit = BitBtn2Exit
  end
  object Memo1: TMemo
    Left = 176
    Top = 56
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 40
    Top = 176
    Width = 186
    Height = 21
    CalAlignment = dtaLeft
    Date = 37635.7519433449
    Time = 37635.7519433449
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 275
    Width = 530
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Button1: TButton
    Left = 416
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Left = 336
    Top = 192
  end
end
