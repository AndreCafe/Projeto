object FrmRecReg: TFrmRecReg
  Left = 0
  Top = 0
  ActiveControl = edEmail
  BorderStyle = bsDialog
  Caption = 'Recuperar informa'#231#245'es de registro do NexCaf'#233
  ClientHeight = 255
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 56
    Top = 47
    Width = 189
    Height = 16
    Caption = 'Informe seu endere'#231'o de e-mail:'
  end
  object rbEmail: TcxRadioButton
    Left = 24
    Top = 24
    Width = 313
    Height = 17
    Caption = '1. Obter c'#243'digo de loja pelo e-mail de registro'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object rbComputador: TcxRadioButton
    Left = 24
    Top = 113
    Width = 281
    Height = 17
    Caption = '2. Obter registro anterior desse computador'
    TabOrder = 1
  end
  object edEmail: TcxTextEdit
    Left = 55
    Top = 64
    TabOrder = 2
    Width = 249
  end
  object cxLabel1: TcxLabel
    Left = 54
    Top = 131
    AutoSize = False
    Caption = 
      'Selecione essa op'#231#227'o caso o NexCaf'#233' j'#225' tenha sido registrado par' +
      'a ser usado nesse computador anteriormente.'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = 5987163
    Style.IsFontAssigned = True
    Properties.WordWrap = True
    Height = 31
    Width = 305
  end
  object btnCancelar: TcxButton
    Left = 120
    Top = 192
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
  object btnOk: TcxButton
    Left = 24
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Ok'
    Default = True
    TabOrder = 5
    OnClick = btnOkClick
  end
end
