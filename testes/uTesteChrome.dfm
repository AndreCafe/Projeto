object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 254
  ClientWidth = 853
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object C: TChromium
    Left = 0
    Top = 41
    Width = 853
    Height = 213
    Align = alClient
    TabOrder = 0
    OnRunModal = CRunModal
    OnGetDownloadHandler = CGetDownloadHandler
    Options.EncodingDetectorEnabled = True
    Options.FileAccessFromFileUrlsAllowed = True
    Options.ApplicationCacheDisabled = True
    Options.DeveloperToolsDisabled = True
    Options.FullscreenEnabled = True
    ExplicitTop = 39
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 853
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitTop = -6
    ExplicitWidth = 535
    object Edit1: TEdit
      Left = 8
      Top = 8
      Width = 417
      Height = 21
      TabOrder = 0
      Text = 'www.globo.com'
    end
    object Button1: TButton
      Left = 440
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object ChromiumOSR1: TChromiumOSR
    Left = 56
    Top = 160
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 624
    Top = 176
  end
end
