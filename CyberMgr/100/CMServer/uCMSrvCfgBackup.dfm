object FrmBackup: TFrmBackup
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Backup Automático'
  ClientHeight = 261
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 180
    Height = 13
    Caption = 'Fazer cópia das tabelas para a pasta '
  end
  object LMDLabel1: TLMDLabel
    Left = 16
    Top = 88
    Width = 369
    Height = 97
    Bevel.BorderInnerWidth = 5
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsFrameInset
    Alignment = agCenterLeft
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    Options = []
    ParentFont = False
    Caption = 
      'O backup automático é realizado toda vez que o Servidor Cyber-Ma' +
      'nager for executado. '#13#10#13#10'É recomendável que se faça uma cópia di' +
      'ária, de todos arquivos contidos na pasta destino, para um outro' +
      ' meio de armazenamento de dados para que se tenha maior seguranç' +
      'a.'
  end
  object btnOk: TBitBtn
    Left = 16
    Top = 208
    Width = 75
    Height = 25
    TabOrder = 0
    OnClick = btnOkClick
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object cbFazer: TCheckBox
    Left = 16
    Top = 16
    Width = 153
    Height = 17
    Caption = 'Fazer backup automático'
    TabOrder = 2
  end
  object edBackupDir: TLMDBrowseEdit
    Left = 16
    Top = 56
    Width = 369
    Height = 21
    Cursor = crIBeam
    BackFX.AlphaBlend.Strength = 0.600000023841858
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    Caret.ImageIndex = 0
    Caret.ListIndex = 0
    TabOrder = 3
  end
end
