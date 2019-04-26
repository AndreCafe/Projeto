object FrmDontShut: TFrmDontShut
  Left = 0
  Top = 0
  Caption = 'NX Dont Shut'
  ClientHeight = 276
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 207
    Width = 330
    Height = 39
    Alignment = taCenter
    AutoSize = False
    Caption = 'Threads = 0'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Button1: TButton
    Left = 79
    Top = 88
    Width = 209
    Height = 25
    Caption = 'Click and nxServer won'#39't shutdown'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 256
    Top = 32
  end
end
