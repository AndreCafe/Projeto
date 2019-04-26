object FrmTestePub: TFrmTestePub
  Left = 0
  Top = 0
  ActiveControl = Edit1
  Caption = 'Teste Browser Embutido'
  ClientHeight = 613
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 21
  object WB: TWebBrowser
    Left = 0
    Top = 41
    Width = 916
    Height = 572
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 504
    ExplicitTop = 32
    ExplicitWidth = 300
    ExplicitHeight = 573
    ControlData = {
      4C000000AC5E00001E3B00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object panTop: TPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 16
    ExplicitTop = 40
    ExplicitWidth = 185
    object Button2: TButton
      AlignWithMargins = True
      Left = 816
      Top = 4
      Width = 96
      Height = 33
      Align = alRight
      Caption = 'Load URL'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 809
    end
    object Edit1: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 802
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      TabOrder = 1
      Text = 
        'https://na.ads.yahoo.com/yax/banner?ve=1&tt=3&si=250610060&asz=1' +
        '60x600&u=nexcafe.com.br'
      ExplicitWidth = 795
    end
  end
end
