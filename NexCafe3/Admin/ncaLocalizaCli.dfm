object FrmLocalizaCli: TFrmLocalizaCli
  Left = 0
  Top = 0
  ActiveControl = edCodigo
  BorderStyle = bsDialog
  Caption = 'Localizar Cliente'
  ClientHeight = 114
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  object lbCod: TcxLabel
    Left = 16
    Top = 16
    Caption = 'C'#243'digo de Cliente'
  end
  object edCodigo: TcxTextEdit
    Left = 110
    Top = 15
    Properties.OnChange = edCodigoPropertiesChange
    Style.BorderStyle = ebsFlat
    TabOrder = 1
    Width = 121
  end
  object btnLocalizar: TcxButton
    Left = 16
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Localizar'
    Default = True
    Enabled = False
    TabOrder = 2
    OnClick = btnLocalizarClick
  end
  object btnCancelar: TcxButton
    Left = 110
    Top = 64
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
