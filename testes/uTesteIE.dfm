object Form10: TForm10
  Left = 0
  Top = 0
  Caption = 'Form10'
  ClientHeight = 254
  ClientWidth = 535
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
  object W: TWebBrowser
    Left = 0
    Top = 41
    Width = 535
    Height = 213
    Align = alClient
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    ExplicitTop = 39
    ControlData = {
      4C0000004B370000041600000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126202000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Edit1: TEdit
      Left = 10
      Top = 8
      Width = 319
      Height = 21
      TabOrder = 0
      Text = 'www.globo.com'
    end
    object Button1: TButton
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
