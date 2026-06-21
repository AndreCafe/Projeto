object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'Teste de Ambiente Sistema Operacional'
  ClientHeight = 301
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 80
    ExplicitTop = 56
    ExplicitWidth = 185
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 467
    Height = 260
    Align = alClient
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object SI: TLMDSysInfo
    Left = 88
    Top = 128
  end
  object SaveDlg: TSaveDialog
    Left = 120
    Top = 72
  end
end
