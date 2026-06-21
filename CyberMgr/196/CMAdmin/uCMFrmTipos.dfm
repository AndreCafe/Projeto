object FrmTipos: TFrmTipos
  Left = 258
  Top = 186
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Selecione os Tipos de Transa'#231#227'o a serem mostrados'
  ClientHeight = 289
  ClientWidth = 329
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
    Height = 289
    Align = alLeft
    ItemHeight = 13
    Items.Strings = (
      'Acesso'
      'Venda de Pacote'
      'Cr'#233'dito Tempo'
      'Manuten'#231#227'o'
      'Acesso + Venda'
      'D'#233'bito Tempo'
      'Sinal'
      'Venda Avulsa'
      'Compra'
      'Entrada Estoque'
      'Sa'#237'da Estoque'
      'Pagamento D'#233'bito'
      'Suprimento Caixa'
      'Sangria Caixa'
      'Venda Passaporte')
    TabOrder = 0
  end
  object btnTodos: TcxButton
    Left = 247
    Top = 0
    Width = 73
    Height = 23
    Caption = '&Todos'
    TabOrder = 1
    OnClick = btnTodosClick
    LookAndFeel.NativeStyle = True
    UseSystemPaint = False
  end
  object btnNenhum: TcxButton
    Left = 247
    Top = 32
    Width = 73
    Height = 23
    Caption = '&Nenhum'
    TabOrder = 2
    OnClick = btnNenhumClick
    LookAndFeel.NativeStyle = True
    UseSystemPaint = False
  end
  object btnOk: TcxButton
    Left = 247
    Top = 96
    Width = 73
    Height = 23
    Caption = '&Ok'
    Default = True
    TabOrder = 3
    OnClick = btnOkClick
    LookAndFeel.NativeStyle = True
    UseSystemPaint = False
  end
  object btnCancelar: TcxButton
    Left = 247
    Top = 128
    Width = 73
    Height = 23
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
    LookAndFeel.NativeStyle = True
    UseSystemPaint = False
  end
end
