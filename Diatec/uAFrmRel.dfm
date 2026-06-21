object FrmTipoRel: TFrmTipoRel
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio'
  ClientHeight = 252
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Left = 24
    Top = 32
    Width = 158
    Height = 13
    Caption = 'Qual relat'#243'rio deseja gerar?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 64
    Width = 313
    Height = 17
    Caption = 'Detalhamento de Despesas Ressarc'#237'veis por Cliente'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 24
    Top = 104
    Width = 313
    Height = 17
    Caption = 'Resumo de integra'#231#227'o de Clientes'
    TabOrder = 1
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 24
    Top = 144
    Width = 313
    Height = 17
    Caption = 'Resumo de Integra'#231#227'o de T'#233'cnicos'
    TabOrder = 2
    OnClick = RadioButton3Click
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 192
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 136
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
end
