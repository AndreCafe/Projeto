object Form1: TForm1
  Left = 192
  Top = 133
  Width = 544
  Height = 375
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 88
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 8
    Top = 72
    Width = 273
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object cbUsuarios: TComboBox
    Left = 8
    Top = 40
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      'Todos')
  end
  object Button2: TButton
    Left = 288
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Enviar'
    Default = True
    TabOrder = 4
    OnClick = Button2Click
  end
  object LB: TListBox
    Left = 8
    Top = 168
    Width = 425
    Height = 153
    ItemHeight = 13
    TabOrder = 5
  end
  object Cliente: TCSCClient
    Host = 'localhost'
    Port = 30000
    AutoReconnect = False
    RetryConnection = False
    OnConnect = ClienteConnect
    Left = 16
    Top = 296
  end
  object MsgProc: TCSCMsgProcessor
    CustomCommBase = Cliente
    OnMsgRec = MsgProcMsgRec
    Left = 80
    Top = 296
  end
end
