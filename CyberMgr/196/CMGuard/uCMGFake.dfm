object FrmFake: TFrmFake
  Left = 342
  Top = 255
  BorderStyle = bsNone
  Caption = 'Configurando '
  ClientHeight = 58
  ClientWidth = 196
  Color = clBackground
  TransparentColorValue = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 163
    Height = 13
    Caption = 'Configurando '#225'rea de trabalho ...'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clInfoBk
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 120
  end
end
