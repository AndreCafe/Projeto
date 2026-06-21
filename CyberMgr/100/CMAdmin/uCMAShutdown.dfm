object FrmShutdown: TFrmShutdown
  Left = 352
  Top = 235
  BorderStyle = bsDialog
  Caption = 'Desligar'
  ClientHeight = 268
  ClientWidth = 273
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object rgOperacao: TRadioGroup
    Left = 24
    Top = 18
    Width = 217
    Height = 105
    Caption = 'Operaçao'
    ItemIndex = 0
    Items.Strings = (
      'Fechar CM-Guard'
      'Reiniciar a Máquina'
      'Desligar a Máquina')
    TabOrder = 0
  end
  object rgMaquina: TRadioGroup
    Left = 24
    Top = 146
    Width = 217
    Height = 57
    Caption = 'Máquina'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Máquina 0'
      'Todas')
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 227
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 167
    Top = 227
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
end
