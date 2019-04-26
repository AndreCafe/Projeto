object FrmRemoveRestr: TFrmRemoveRestr
  Left = 240
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Aguarde'
  ClientHeight = 190
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 75
    Top = 52
    Width = 386
    Height = 20
    Caption = 'Removendo Restri'#231#245'es do Windows. Aguarde ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PB: TProgressBar
    Left = 40
    Top = 88
    Width = 449
    Height = 41
    Max = 20
    Smooth = True
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 56
    Top = 24
  end
end
