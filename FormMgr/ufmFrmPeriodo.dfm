object FrmPeriodo: TFrmPeriodo
  Left = 343
  Top = 330
  BorderStyle = bsDialog
  Caption = 'Digite o per'#237'odo'
  ClientHeight = 164
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Left = 16
    Top = 20
    Width = 13
    Height = 13
    Caption = 'De'
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 7
    Height = 13
    Caption = 'A'
  end
  object btnOk: TcxButton
    Left = 17
    Top = 118
    Width = 73
    Height = 23
    Caption = '&Ok'
    Default = True
    TabOrder = 0
    OnClick = btnOkClick
    LookAndFeel.NativeStyle = True
  end
  object btnCancelar: TcxButton
    Left = 112
    Top = 118
    Width = 73
    Height = 23
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
    LookAndFeel.NativeStyle = True
  end
  object edInicio: TcxDateEdit
    Left = 41
    Top = 17
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 2
    Width = 99
  end
  object edFim: TcxDateEdit
    Left = 41
    Top = 49
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 4
    Width = 99
  end
  object edInicioH: TcxTimeEdit
    Left = 144
    Top = 17
    EditValue = 0
    TabOrder = 3
    Width = 70
  end
  object edFimH: TcxTimeEdit
    Left = 144
    Top = 49
    EditValue = 0.000000000000000000
    TabOrder = 5
    Width = 70
  end
end
