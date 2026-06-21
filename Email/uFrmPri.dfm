object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'FrmPri'
  ClientHeight = 459
  ClientWidth = 470
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
    Left = 16
    Top = 19
    Width = 40
    Height = 13
    Caption = 'Servidor'
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 16
    Top = 84
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 63
    Height = 13
    Caption = 'Autentica'#231#227'o'
  end
  object Label5: TLabel
    Left = 16
    Top = 143
    Width = 36
    Height = 13
    Caption = 'Destino'
  end
  object Label6: TLabel
    Left = 16
    Top = 203
    Width = 36
    Height = 13
    Caption = 'Anexos'
  end
  object Label7: TLabel
    Left = 16
    Top = 231
    Width = 29
    Height = 13
    Caption = 'Corpo'
  end
  object Label8: TLabel
    Left = 16
    Top = 368
    Width = 39
    Height = 13
    Caption = 'Assunto'
  end
  object edServ: TEdit
    Left = 87
    Top = 16
    Width = 146
    Height = 21
    TabOrder = 0
    Text = 'www.nextar.com.br'
  end
  object edUsername: TEdit
    Left = 87
    Top = 48
    Width = 146
    Height = 21
    TabOrder = 1
    Text = 'joao@nextar.com.br'
  end
  object edPass: TEdit
    Left = 87
    Top = 80
    Width = 146
    Height = 21
    TabOrder = 2
    Text = 'delphi'
  end
  object cbAut: TComboBox
    Left = 88
    Top = 110
    Width = 146
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      'Com senha'
      'Sem senha'
      'Autenticar POP3')
  end
  object edDestino: TMemo
    Left = 87
    Top = 142
    Width = 201
    Height = 49
    Lines.Strings = (
      'joao@nextar.com.br')
    TabOrder = 4
  end
  object edAnexos: TLMDFileOpenEdit
    Left = 87
    Top = 199
    Width = 201
    Height = 21
    Cursor = crIBeam
    BackFX.AlphaBlend.Strength = 0.600000023841857900
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    Caret.ImageIndex = 0
    Caret.ListIndex = 0
    TabOrder = 5
  end
  object meCorpo: TMemo
    Left = 87
    Top = 226
    Width = 200
    Height = 129
    TabOrder = 6
  end
  object Button1: TButton
    Left = 14
    Top = 412
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 7
    OnClick = Button1Click
  end
  object edAssunto: TEdit
    Left = 88
    Top = 368
    Width = 199
    Height = 21
    TabOrder = 8
    Text = 'Fechamento de Caixa'
  end
end
