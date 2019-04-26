object Form19: TForm19
  Left = 0
  Top = 0
  ActiveControl = Edit1
  Caption = 'Gerador de Senha para Token NexCaf'#233
  ClientHeight = 295
  ClientWidth = 462
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
  object Edit1: TEdit
    Left = 24
    Top = 32
    Width = 265
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Gerar >>'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object cxLabel1: TcxLabel
    Left = 24
    Top = 9
    Caption = 'Token'
  end
  object edSenha: TEdit
    Left = 24
    Top = 144
    Width = 265
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 121
    Caption = 'Senha'
  end
  object lbSenha: TcxLabel
    Left = 24
    Top = 192
    Caption = 'lbSenha'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Courier New'
    Style.Font.Style = [fsBold]
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
  end
end
