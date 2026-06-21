object FrmSombra: TFrmSombra
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 50
  BorderStyle = bsNone
  Caption = 'FrmSombra'
  ClientHeight = 266
  ClientWidth = 428
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TimerFree: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerFreeTimer
    Left = 120
    Top = 112
  end
end
