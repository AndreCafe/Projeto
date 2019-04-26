object FrmWebPopup: TFrmWebPopup
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Mensagem:'
  ClientHeight = 206
  ClientWidth = 191
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WB: TEmbeddedWB
    Left = 0
    Top = 0
    Width = 191
    Height = 206
    Align = alClient
    TabOrder = 0
    Silent = False
    OnDocumentComplete = WBDocumentComplete
    OnNavigateError = WBNavigateError
    DisableCtrlShortcuts = 'N'
    DownloadOptions = [DownloadImages, DownloadVideos, DownloadBGSounds, DownloadAndIgnoreCache]
    UserInterfaceOptions = [DontUse3DBorders, EnablesFormsAutoComplete, EnableThemes, EnableDomWindlessControls, EnableWindowedControls]
    OnShowMessage = WBShowMessage
    OnGetExternal = WBGetExternal
    About = ' EmbeddedWB http://bsalsa.com/'
    DialogBoxes.DisableAll = True
    DialogBoxes.ReplaceCaption = False
    DialogBoxes.ReplaceIcon = False
    OnCloseQuery = WBCloseQuery
    PrintOptions.Margins.Left = 19.050000000000000000
    PrintOptions.Margins.Right = 19.050000000000000000
    PrintOptions.Margins.Top = 19.050000000000000000
    PrintOptions.Margins.Bottom = 19.050000000000000000
    PrintOptions.HTMLHeader.Strings = (
      '<HTML></HTML>')
    PrintOptions.Orientation = poPortrait
    ExplicitLeft = 144
    ExplicitTop = 128
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C000000F82300000C1A00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object TimerErro: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = TimerErroTimer
    Left = 64
    Top = 48
  end
end
