object Form1: TForm1
  Left = 78
  Top = 170
  Caption = 'Form1'
  ClientHeight = 342
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LB: TListBox
    Left = 0
    Top = 41
    Width = 516
    Height = 301
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'salvar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object SI: TLMDSysInfo
    Left = 152
    Top = 64
  end
  object SD: TSaveDialog
    Left = 168
    Top = 24
  end
end
