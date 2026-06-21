object ChartNameForm: TChartNameForm
  Left = 366
  Top = 327
  ActiveControl = edChartName
  BorderStyle = bsDialog
  Caption = 'New Chart'
  ClientHeight = 145
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 265
    Height = 98
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 26
    Width = 56
    Height = 13
    Caption = 'Chart Name'
    Transparent = True
  end
  object edChartName: TEdit
    Left = 24
    Top = 45
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 198
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Button2: TButton
    Left = 117
    Top = 112
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
end
