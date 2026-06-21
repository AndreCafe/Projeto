object Form17: TForm17
  Left = 0
  Top = 0
  Caption = 'Form17'
  ClientHeight = 459
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 248
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EW: TEmbeddedWB
    Left = 96
    Top = 240
    Width = 300
    Height = 150
    TabOrder = 1
    Silent = False
    DisableCtrlShortcuts = 'N'
    UserInterfaceOptions = [EnablesFormsAutoComplete, EnableThemes]
    About = ' EmbeddedWB http://bsalsa.com/'
    DisableErrors.EnableDDE = False
    DisableErrors.fpExceptions = False
    DisableErrors.ScriptErrorsSuppressed = False
    PrintOptions.HTMLHeader.Strings = (
      '<HTML></HTML>')
    PrintOptions.Orientation = poPortrait
    ControlData = {
      4C000000021F0000810F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object ProgressBar1: TProgressBar
    Left = 88
    Top = 16
    Width = 361
    Height = 17
    TabOrder = 2
  end
  object T: TnxWinsockTransport
    DisplayCategory = 'Transports'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 56
    Top = 56
  end
  object H: TIdHTTP
    MaxLineAction = maException
    Host = 
      'https://secure.logmeinrescue.com/Customer/Download.aspx?EntryID=' +
      '1856965867'
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 176
    Top = 128
  end
  object IdIOHandlerStream1: TIdIOHandlerStream
    StreamType = stReadWrite
    Left = 136
    Top = 64
  end
  object WU: TWebUpdater
    About = 'Application Updater by bsalsa : bsalsa@bsalsa.com'
    AbortMessage = 'Aborted! (User request).'
    AppCurrentVer = 0.001000000000000000
    BackupFolder = 'Backup\'
    Caption = 'Checking for updates... Please wait.'
    ErrorMessage = 'An error occurred while '
    LogAddTime = True
    LogFileName = 'Updater.txt'
    SuccessMessageText = 'Update is done.'
    UpdatesFolder = 'Updates\'
    WebInfoFileName = 'Updates.xml'
    WebURL = 
      'https://secure.logmeinrescue.com/Customer/Download.aspx?EntryID=' +
      '1856965867'
    Left = 48
    Top = 136
  end
  object IED: TIEDownload
    AdditionalHeader.Strings = (
      'Content-Type: application/x-www-form-urlencoded ')
    DefaultProtocol = 'https://'
    DefaultUrlFileName = 
      'secure.logmeinrescue.com/Customer/Download.aspx?EntryID=18569658' +
      '67'
    DownloadDir = 'c:\meus programas'
    PutFileName = 'logmein.exe'
    Left = 152
    Top = 176
  end
end
