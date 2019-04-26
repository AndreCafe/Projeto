object FrmZeraTempo: TFrmZeraTempo
  Left = 300
  Top = 315
  BorderStyle = bsDialog
  Caption = 'Aten'#231#227'o'
  ClientHeight = 207
  ClientWidth = 469
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
  object cxLabel1: TcxLabel
    Left = 16
    Top = 16
    Caption = 
      'Essa opera'#231#227'o vai zerar o totalizador de tempo que o cliente j'#225' ' +
      'usou na loja.'#13#10'N'#195'O se trata de cr'#233'dito de tempo, mas apenas do t' +
      'empo j'#225' utilizado.'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
  end
  object rbClienteAtual: TcxRadioButton
    Left = 16
    Top = 88
    Width = 409
    Height = 17
    Caption = 'Jo'#227'o Lucio Borges'
    Checked = True
    TabOrder = 1
    TabStop = True
    LookAndFeel.NativeStyle = True
  end
  object rbTodos: TcxRadioButton
    Left = 16
    Top = 111
    Width = 113
    Height = 17
    Caption = 'Todos os clientes'
    TabOrder = 2
    LookAndFeel.NativeStyle = True
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 68
    Caption = 'Zerar tempo acumulado de:'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
  end
  object btnZerar: TcxButton
    Left = 16
    Top = 152
    Width = 161
    Height = 25
    Caption = 'Zerar tempo acumulado'
    TabOrder = 4
    OnClick = btnZerarClick
    LookAndFeel.NativeStyle = True
  end
  object btnCancelar: TcxButton
    Left = 200
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Default = True
    TabOrder = 5
    OnClick = btnCancelarClick
    LookAndFeel.NativeStyle = True
  end
end
