object FrmAguarde: TFrmAguarde
  Left = 188
  Top = 194
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Aguarde'
  ClientHeight = 118
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 185
    Height = 13
    Caption = 'Configurando ambiente de trabalho ...'
  end
  object lbModulo: TLabel
    Left = 16
    Top = 80
    Width = 18
    Height = 13
    Caption = '. . .'
  end
  object PB: TProgressBar
    Left = 16
    Top = 48
    Width = 297
    Height = 16
    Min = 0
    Max = 9
    Position = 4
    TabOrder = 0
  end
end
