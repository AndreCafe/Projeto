object FrmProg: TFrmProg
  Left = 0
  Top = 0
  Caption = 'NexCaf'#233': Verificando banco de dados'
  ClientHeight = 109
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PB: TcxProgressBar
    Left = 16
    Top = 40
    AutoSize = False
    ParentFont = False
    Properties.AnimationPath = cxapPingPong
    Properties.BarStyle = cxbsAnimation
    Properties.BeginColor = 54056
    Properties.EndColor = clGreen
    Properties.PeakValue = 100.000000000000000000
    Properties.ShowTextStyle = cxtsText
    Properties.SolidTextColor = True
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 25
    Width = 321
  end
  object lbArq: TcxLabel
    Left = 16
    Top = 17
    Caption = '. . .'
    Style.TextColor = clBlack
    Style.TextStyle = []
  end
end
