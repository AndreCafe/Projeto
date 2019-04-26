object FrmOpcaoRelCaixa: TFrmOpcaoRelCaixa
  Left = 258
  Top = 186
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Selecione os itens que devem ser impressos'
  ClientHeight = 160
  ClientWidth = 322
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
  object cgTipo: TCheckListBox
    Left = 0
    Top = 0
    Width = 233
    Height = 160
    Align = alLeft
    ItemHeight = 13
    Items.Strings = (
      'Resumo Financeiro'
      'Tempo de uso por M'#225'quina'
      'Tempo de uso por Hor'#225'rio'
      'Tempo de uso por Funcion'#225'rios'
      'Tempo de uso por Clientes Gr'#225'tis'
      'Vendas/Movimenta'#231#227'o de Produtos'
      'Vendas por Categoria'
      'Transa'#231#245'es'
      'Tempo de uso por Cliente'
      'Sess'#245'es'
      'Pr'#233'/P'#243's-Pago')
    TabOrder = 0
  end
  object btnTodos: TcxButton
    Left = 248
    Top = 0
    Width = 73
    Height = 23
    Caption = '&Todos'
    TabOrder = 1
    OnClick = btnTodosClick
    LookAndFeel.NativeStyle = True
  end
  object btnNenhum: TcxButton
    Left = 248
    Top = 32
    Width = 73
    Height = 23
    Caption = '&Nenhum'
    TabOrder = 2
    OnClick = btnNenhumClick
    LookAndFeel.NativeStyle = True
  end
  object btnOk: TcxButton
    Left = 248
    Top = 96
    Width = 73
    Height = 23
    Caption = '&Ok'
    Default = True
    TabOrder = 3
    OnClick = btnOkClick
    LookAndFeel.NativeStyle = True
  end
  object btnCancelar: TcxButton
    Left = 248
    Top = 128
    Width = 73
    Height = 23
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
    LookAndFeel.NativeStyle = True
  end
end
