object FrmDiscar: TFrmDiscar
  Left = 0
  Top = 0
  Caption = 'Discar'
  ClientHeight = 213
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 56
    Top = 32
    Caption = 'Tire o telefone do gancho'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = []
    Style.IsFontAssigned = True
  end
  object Button1: TButton
    Left = 128
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 56
    Top = 80
  end
end
