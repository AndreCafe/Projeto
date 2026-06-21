object FrmImp: TFrmImp
  Left = 210
  Top = 297
  BorderStyle = bsDialog
  Caption = 'Atualizando'
  ClientHeight = 107
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 156
    Height = 13
    Caption = 'Atualizando estrutura da tabela:'
  end
  object lbNomeTab: TLabel
    Left = 184
    Top = 16
    Width = 38
    Height = 13
    Caption = 'Tabela'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbImp: TLabel
    Left = 24
    Top = 64
    Width = 104
    Height = 13
    Caption = 'Importando Dados ...'
  end
  object lbPosicao: TLabel
    Left = 248
    Top = 64
    Width = 97
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0/0'
  end
  object PB: TProgressBar
    Left = 24
    Top = 40
    Width = 321
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 168
    Top = 72
  end
end
