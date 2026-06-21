object FrmTipos: TFrmTipos
  Left = 258
  Top = 186
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Selecione os Tipos de Transa'#231#227'o a serem mostrados'
  ClientHeight = 289
  ClientWidth = 361
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
  object xpButton1: TxpButton
    Left = 247
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Todos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 0
    TabStop = True
    OnClick = xpButton1Click
  end
  object xpButton2: TxpButton
    Left = 247
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    TabOrder = 1
    TabStop = True
    Default = True
    OnClick = xpButton2Click
  end
  object xpButton3: TxpButton
    Left = 247
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 2
    TabStop = True
    OnClick = xpButton3Click
  end
  object xpButton4: TxpButton
    Left = 247
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Nenhum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 3
    TabStop = True
    OnClick = xpButton4Click
  end
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
    TabOrder = 4
  end
end
