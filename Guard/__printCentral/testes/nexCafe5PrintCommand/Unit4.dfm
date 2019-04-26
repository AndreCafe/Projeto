object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 499
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    562
    499)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 58
    Height = 13
    Caption = 'bytes lidos: '
  end
  object Label2: TLabel
    Left = 80
    Top = 8
    Width = 6
    Height = 13
    Caption = '0'
  end
  object cxMemo1: TcxMemo
    Left = 8
    Top = 32
    Anchors = [akLeft, akTop, akRight, akBottom]
    Properties.ReadOnly = True
    Properties.ScrollBars = ssVertical
    TabOrder = 0
    ExplicitHeight = 241
    Height = 459
    Width = 546
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 200
    Top = 56
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 240
    Top = 56
  end
end
