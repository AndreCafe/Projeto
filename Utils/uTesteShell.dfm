object Form19: TForm19
  Left = 0
  Top = 0
  Caption = 'Form19'
  ClientHeight = 245
  ClientWidth = 615
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
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 615
    Height = 204
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    ExplicitWidth = 472
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitWidth = 472
    object Button2: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Windows'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 290
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Button4'
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button1: TButton
      Left = 209
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = 'NexCafe'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 384
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Teste'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 480
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Button6'
      TabOrder = 5
      OnClick = Button6Click
    end
  end
  object JamFileOperation1: TJamFileOperation
    Operation = otDelete
    Options = [soNoConfirmation, soSilent]
    Left = 136
    Top = 136
  end
end
