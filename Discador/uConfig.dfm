object FrmConfig: TFrmConfig
  Left = 0
  Top = 0
  Caption = 'Configurar '
  ClientHeight = 249
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel6: TcxLabel
    Left = 24
    Top = 147
    Caption = 'Outros'
  end
  object cxLabel5: TcxLabel
    Left = 24
    Top = 124
    Caption = 'Claro'
  end
  object cxLabel4: TcxLabel
    Left = 24
    Top = 101
    Caption = 'Vivo'
  end
  object cxLabel3: TcxLabel
    Left = 24
    Top = 78
    Caption = 'Oi'
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 55
    Caption = 'Tim'
  end
  object cxLabel1: TcxLabel
    Left = 24
    Top = 32
    Caption = 'Fixo'
  end
  object cxLabel7: TcxLabel
    Left = 74
    Top = 13
    Caption = 'Rota'
  end
  object edRFixo: TcxTextEdit
    Left = 74
    Top = 32
    TabOrder = 7
    Text = '0'
    Width = 79
  end
  object edRTim: TcxTextEdit
    Left = 74
    Top = 54
    TabOrder = 8
    Text = '82'
    Width = 79
  end
  object edROi: TcxTextEdit
    Left = 74
    Top = 77
    TabOrder = 9
    Text = '83'
    Width = 79
  end
  object edRVivo: TcxTextEdit
    Left = 74
    Top = 100
    TabOrder = 10
    Text = '84'
    Width = 79
  end
  object edRClaro: TcxTextEdit
    Left = 74
    Top = 123
    TabOrder = 11
    Text = '0'
    Width = 79
  end
  object edROutros: TcxTextEdit
    Left = 74
    Top = 146
    TabOrder = 12
    Text = '0'
    Width = 79
  end
  object edOOutros: TcxTextEdit
    Left = 156
    Top = 146
    TabOrder = 13
    Text = '21'
    Width = 79
  end
  object edOClaro: TcxTextEdit
    Left = 156
    Top = 123
    TabOrder = 14
    Text = '21'
    Width = 79
  end
  object edOVivo: TcxTextEdit
    Left = 156
    Top = 100
    TabOrder = 15
    Text = '15'
    Width = 79
  end
  object edOOi: TcxTextEdit
    Left = 156
    Top = 77
    TabOrder = 16
    Text = '14'
    Width = 79
  end
  object edOTim: TcxTextEdit
    Left = 156
    Top = 54
    TabOrder = 17
    Text = '41'
    Width = 79
  end
  object edOFixo: TcxTextEdit
    Left = 156
    Top = 32
    TabOrder = 18
    Text = '21'
    Width = 79
  end
  object cxLabel8: TcxLabel
    Left = 156
    Top = 13
    Caption = 'Operadora'
  end
  object btnSalvar: TcxButton
    Left = 31
    Top = 194
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 20
    OnClick = btnSalvarClick
  end
  object btnCancelar: TcxButton
    Left = 112
    Top = 194
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 21
    OnClick = btnCancelarClick
  end
end
