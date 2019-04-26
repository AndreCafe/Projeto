object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 439
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 25
    Top = 8
    Width = 59
    Height = 13
    Caption = 'Impressoras'
  end
  object Label2: TLabel
    Left = 273
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Tipos de Impres'#227'o'
  end
  object cxListBox1: TcxListBox
    Left = 25
    Top = 27
    Width = 232
    Height = 97
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListBox1Click
  end
  object cxDBListBox1: TcxDBListBox
    Left = 273
    Top = 27
    Width = 304
    Height = 97
    ItemHeight = 13
    TabOrder = 0
  end
  object cxButton1: TcxButton
    Left = 25
    Top = 120
    Width = 232
    Height = 41
    Caption = 'Selecione uma impressora'
    TabOrder = 2
    WordWrap = True
    OnClick = Button1Click
  end
  object cxMemo1: TcxMemo
    Left = 25
    Top = 167
    Lines.Strings = (
      'cxMemo1')
    TabOrder = 3
    Height = 250
    Width = 744
  end
  object cxButton2: TcxButton
    Left = 713
    Top = 107
    Width = 56
    Height = 41
    Caption = 'Selecione uma impressora'
    TabOrder = 4
    WordWrap = True
    OnClick = cxButton2Click
  end
end
