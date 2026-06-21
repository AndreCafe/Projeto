object Form1: TForm1
  Left = 88
  Top = 105
  Width = 394
  Height = 231
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 152
    Width = 255
    Height = 24
    Caption = 'Aguardando UPPEND.SEM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 296
    Top = 128
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 24
    Top = 64
    Width = 105
    Height = 25
    Caption = 'Simular Protheus'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edPath: TEdit
    Left = 24
    Top = 16
    Width = 241
    Height = 21
    TabOrder = 1
    Text = 'C:\Meus Programas\DiaTecServ\DBF\'
  end
  object Button2: TButton
    Left = 24
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 288
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 184
    Top = 88
  end
  object TF: TDbf
    FilePath = 'C:\Meus Programas\DiaTecServ\DBF\'
    Indexes = <>
    TableName = 'Cliente.DBF'
    Left = 240
    Top = 48
  end
  object TD: TDbf
    Indexes = <>
    Left = 240
    Top = 88
  end
end
