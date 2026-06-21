object FrmCidade: TFrmCidade
  Left = 0
  Top = 0
  Caption = 'Corrigir Cidade'
  ClientHeight = 159
  ClientWidth = 374
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
  object Button1: TButton
    Left = 32
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 128
    Top = 104
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object lbCidade: TcxLabel
    Left = 32
    Top = 24
    Caption = 'Cidade'
  end
  object cxLabel1: TcxLabel
    Left = 32
    Top = 56
    Caption = 'UF'
  end
  object edCidade: TcxTextEdit
    Left = 80
    Top = 24
    TabOrder = 4
    Width = 257
  end
  object edUF: TcxTextEdit
    Left = 82
    Top = 55
    TabOrder = 5
    Width = 121
  end
end
