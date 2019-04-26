object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Teste de Stress de REDE'
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 207
    Width = 330
    Height = 39
    Alignment = taCenter
    AutoSize = False
    Caption = '001'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object edQtd: TcxSpinEdit
    Left = 88
    Top = 33
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Value = 100
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 23
    Top = 44
    Caption = 'Threads'
  end
  object cxButton1: TcxButton
    Left = 88
    Top = 140
    Width = 209
    Height = 45
    Caption = 'Estressar!!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object edServ: TcxTextEdit
    Left = 88
    Top = 83
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Text = '127.0.0.1'
    Width = 209
  end
  object cxLabel2: TcxLabel
    Left = 23
    Top = 94
    Caption = 'Servidor'
  end
  object Timer1: TTimer
    OnTimer = ghhh
    Left = 256
    Top = 32
  end
end
