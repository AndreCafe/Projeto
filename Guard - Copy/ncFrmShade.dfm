object FrmShade: TFrmShade
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 0
  BorderStyle = bsNone
  Caption = 'Impress'#227'o'
  ClientHeight = 439
  ClientWidth = 647
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 312
    Top = 208
  end
  object Timer2: TTimer
    Interval = 300
    OnTimer = Timer2Timer
    Left = 112
    Top = 96
  end
end
