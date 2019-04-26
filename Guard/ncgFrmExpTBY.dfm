inherited FrmExpTBY: TFrmExpTBY
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'NexCaf'#233
  ClientHeight = 99
  ClientWidth = 815
  Color = clFuchsia
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 815
  ExplicitHeight = 99
  PixelsPerInch = 96
  TextHeight = 13
  object WB: TEmbeddedWB
    Left = 0
    Top = 0
    Width = 300
    Height = 30
    TabOrder = 0
    Silent = False
    RegisterAsDropTarget = False
    OnDownloadComplete = WBDownloadComplete
    OnNavigateComplete2 = WBNavigateComplete2
    OnDocumentComplete = WBDocumentComplete
    OnNavigateError = WBNavigateError
    DisableCtrlShortcuts = 'N'
    UserInterfaceOptions = [DontUse3DBorders, DontUseScrollBars, EnablesFormsAutoComplete, EnableThemes]
    OnGetExternal = WBGetExternal
    About = ' EmbeddedWB http://bsalsa.com/'
    DisableErrors.EnableDDE = False
    DisableErrors.fpExceptions = False
    DisableErrors.ScriptErrorsSuppressed = False
    PrintOptions.Margins.Left = 19.050000000000000000
    PrintOptions.Margins.Right = 19.050000000000000000
    PrintOptions.Margins.Top = 19.050000000000000000
    PrintOptions.Margins.Bottom = 19.050000000000000000
    PrintOptions.HTMLHeader.Strings = (
      '<HTML></HTML>')
    PrintOptions.Orientation = poPortrait
    ControlData = {
      4C000000021F00001A0300000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object TimerNav: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TimerNavTimer
    Left = 368
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 416
  end
end
