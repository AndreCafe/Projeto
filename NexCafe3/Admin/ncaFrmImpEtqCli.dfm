object FrmImpEtqCli: TFrmImpEtqCli
  Left = 218
  Top = 216
  BorderStyle = bsDialog
  Caption = 'Imprimir Etiqueta para Clientes'
  ClientHeight = 162
  ClientWidth = 385
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
  object Label2: TLabel
    Left = 16
    Top = 21
    Width = 68
    Height = 13
    Caption = 'Etiqueta inicial'
  end
  object edInicio: TcxSpinEdit
    Left = 88
    Top = 17
    ParentFont = False
    Properties.MaxValue = 1.000000000000000000
    Properties.MinValue = 18.000000000000000000
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Value = 1
    Width = 73
  end
  object btnImprimir: TcxButton
    Left = 16
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    Default = True
    TabOrder = 1
    OnClick = btnImprimirClick
    LookAndFeel.NativeStyle = True
  end
  object btnFechar: TcxButton
    Left = 104
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 2
    OnClick = btnFecharClick
    LookAndFeel.NativeStyle = True
  end
  object btnEditar: TcxButton
    Left = 208
    Top = 112
    Width = 161
    Height = 25
    Caption = 'Editar Formato de Impress'#227'o'
    TabOrder = 3
    OnClick = btnEditarClick
    LookAndFeel.NativeStyle = True
  end
  object rbAtual: TcxRadioButton
    Left = 16
    Top = 49
    Width = 169
    Height = 17
    Caption = 'Imprimir apenas para o cliente'
    Checked = True
    TabOrder = 4
    TabStop = True
    LookAndFeel.NativeStyle = True
  end
  object rbTodos: TcxRadioButton
    Left = 16
    Top = 73
    Width = 353
    Height = 17
    Caption = 'Imprimir para todos clientes'
    TabOrder = 5
    LookAndFeel.NativeStyle = True
  end
  object lbCli: TcxLabel
    Left = 182
    Top = 48
    Caption = 'lbCli'
    Style.TextStyle = [fsBold]
  end
end
