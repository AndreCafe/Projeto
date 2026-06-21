object frmProgress: TfrmProgress
  Left = 414
  Top = 343
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 66
  ClientWidth = 459
  Color = clBtnFace
  TransparentColorValue = clNone
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 66
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 12937777
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 7
      Width = 128
      Height = 19
      Caption = 'Inserting events...'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object pbProgress: TcxProgressBar
      Left = 14
      Top = 33
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.NativeStyle = True
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 429
    end
  end
end
