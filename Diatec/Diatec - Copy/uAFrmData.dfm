object FrmData: TFrmData
  Left = 448
  Top = 212
  ActiveControl = edData
  BorderStyle = bsDialog
  Caption = 'Data'
  ClientHeight = 152
  ClientWidth = 263
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 165
    Height = 13
    Caption = 'Incluir todos RA com data final at'#233
  end
  object btnOK: TBitBtn
    Left = 24
    Top = 104
    Width = 75
    Height = 25
    TabOrder = 0
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancelar: TBitBtn
    Left = 120
    Top = 104
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    Kind = bkCancel
  end
  object edData: TDateTimePicker
    Left = 24
    Top = 43
    Width = 177
    Height = 21
    Date = 38700.678849513890000000
    Time = 38700.678849513890000000
    TabOrder = 2
  end
end
