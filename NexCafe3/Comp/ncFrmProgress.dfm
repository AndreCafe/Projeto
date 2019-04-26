object FrmProg: TFrmProg
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'NexCaf'#233': Convertendo banco de dados'
  ClientHeight = 124
  ClientWidth = 493
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
  object PB: TcxProgressBar
    Left = 16
    Top = 40
    AutoSize = False
    ParentFont = False
    Properties.BarStyle = cxbsGradient
    Properties.PeakValue = 100.000000000000000000
    Properties.SolidTextColor = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -27
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 44
    Width = 457
  end
  object lbArq: TcxLabel
    Left = 16
    Top = 17
    Caption = '. . .'
  end
end
