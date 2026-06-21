object FrmOpcaoRelCaixa: TFrmOpcaoRelCaixa
  Left = 258
  Top = 186
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Selecione os itens que devem ser impressos'
  ClientHeight = 160
  ClientWidth = 307
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
    Left = 223
    Top = 0
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
    Left = 223
    Top = 104
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
    Left = 223
    Top = 136
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
    Left = 223
    Top = 32
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
    Width = 209
    Height = 160
    Align = alLeft
    ItemHeight = 13
    Items.Strings = (
      'Resumo Financeiro'
      'Tempo de uso por M'#225'quina'
      'Tempo de uso por Hor'#225'rio'
      'Tempo de uso em Modo Manuten'#231#227'o'
      'Vendas por Categoria'
      'Vendas por Produto')
    TabOrder = 4
  end
end
