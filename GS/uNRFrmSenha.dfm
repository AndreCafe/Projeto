object FrmAlteraSenha: TFrmAlteraSenha
  Left = 345
  Top = 245
  BorderStyle = bsDialog
  Caption = 'Contas de Usu'#225'rio'
  ClientHeight = 277
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 110
    Height = 13
    Caption = 'Altera'#231#227'o de Senha'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 40
    Caption = 'Digite sua senha atual'
    ParentFont = False
    Transparent = True
  end
  object edAtual: TcxTextEdit
    Left = 16
    Top = 56
    Properties.EchoMode = eemPassword
    TabOrder = 1
    Width = 257
  end
  object edNova: TcxTextEdit
    Left = 16
    Top = 104
    Properties.EchoMode = eemPassword
    TabOrder = 2
    Width = 257
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 88
    Caption = 'Digite uma nova senha'
    ParentFont = False
    Transparent = True
  end
  object edConfirma: TcxTextEdit
    Left = 16
    Top = 152
    Properties.EchoMode = eemPassword
    TabOrder = 4
    Width = 257
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 136
    Caption = 'Digite a nova senha novamente para confirm'#225'-la'
    ParentFont = False
    Transparent = True
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 184
    AutoSize = False
    Caption = 
      'Se voc'#234' usar letras mai'#250'sculas na sua senha, ter'#225' que us'#225'-las no' +
      'vamente toda vez que fizer logon.'
    Properties.WordWrap = True
    Transparent = True
    Height = 33
    Width = 257
  end
  object btnAlterar: TcxButton
    Left = 104
    Top = 232
    Width = 81
    Height = 23
    Caption = '&Alterar Senha'
    Default = True
    TabOrder = 7
    OnClick = btnAlterarClick
    LookAndFeel.NativeStyle = True
  end
  object btnCancelar: TcxButton
    Left = 200
    Top = 232
    Width = 73
    Height = 23
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 8
    OnClick = btnCancelarClick
    LookAndFeel.NativeStyle = True
  end
end
