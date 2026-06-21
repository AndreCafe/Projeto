object FrmAtualiza: TFrmAtualiza
  Left = 221
  Top = 233
  BorderStyle = bsNone
  Caption = 'FrmAtualiza'
  ClientHeight = 110
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 288
    Height = 110
    UseDockManager = False
    Align = alClient
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsWindowBorder
    TabOrder = 0
    object LMDLabel1: TLMDLabel
      Left = 74
      Top = 18
      Width = 142
      Height = 66
      Bevel.Mode = bmCustom
      Alignment = agCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MultiLine = True
      Options = []
      ParentFont = False
      Caption = 'CM-Guard'#13#10#13#10'Atualizando versão'#13#10'Aguarde ...'
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 232
    Top = 16
  end
end
