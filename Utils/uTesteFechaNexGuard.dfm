object Form1: TForm1
  Left = 192
  Top = 108
  Width = 409
  Height = 272
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
  object SE: TcxSpinEdit
    Left = 56
    Top = 32
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.Increment = 100.000000000000000000
    Properties.OnChange = SEPropertiesEditValueChanged
    Properties.OnEditValueChanged = SEPropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -32
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Value = 2000
    Width = 105
  end
  object LMDButton1: TLMDButton
    Left = 200
    Top = 96
    Width = 75
    Height = 25
    Caption = 'LMDButton1'
    TabOrder = 1
    Visible = True
    OnClick = LMDButton1Click
  end
  object WL: TWinList
    Left = 168
    Top = 112
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 64
    Top = 112
  end
  object starter: TLMDStarter
    Command = 'C:\NexCafe\NexGuard.exe'
    Left = 168
    Top = 176
  end
end
