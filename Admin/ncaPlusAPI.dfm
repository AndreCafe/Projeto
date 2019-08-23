object FrmPlus: TFrmPlus
  Left = 0
  Top = 0
  Caption = 'Mensagem:'
  ClientHeight = 605
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TcxPageControl
    Left = 0
    Top = 0
    Width = 867
    Height = 605
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tsWB
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 605
    ClientRectRight = 867
    ClientRectTop = 0
    object tsWB: TcxTabSheet
      Caption = 'tsWB'
      ImageIndex = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object WB: TEmbeddedWB
        Left = 0
        Top = 0
        Width = 867
        Height = 605
        Align = alClient
        TabOrder = 0
        Silent = False
        OnDocumentComplete = WBDocumentComplete
        OnNavigateError = WBNavigateError
        DisableCtrlShortcuts = 'N'
        UserInterfaceOptions = [EnablesFormsAutoComplete, EnableThemes]
        OnGetExternal = WBGetExternal
        OnScriptError = WBScriptError
        ScriptErrorAction = eaAskUser
        About = ' EmbeddedWB http://bsalsa.com/'
        OnCloseQuery = WBCloseQuery
        PrintOptions.Margins.Left = 19.050000000000000000
        PrintOptions.Margins.Right = 19.050000000000000000
        PrintOptions.Margins.Top = 19.050000000000000000
        PrintOptions.Margins.Bottom = 19.050000000000000000
        PrintOptions.Header = '&w&bPage &p of &P'
        PrintOptions.HTMLHeader.Strings = (
          '<HTML></HTML>')
        PrintOptions.Footer = '&u&b&d'
        PrintOptions.Orientation = poPortrait
        ExplicitLeft = 3
        ExplicitTop = 3
        ControlData = {
          4C000000D0590000BC3E00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          0000000000000000010000000000000000000000000000000000000001000000
          0100000001000000010000000100000001000000010000000100000001000000
          0100000001000000010000000100000001000000010000000100000001000000
          0100000001000000010000000100000001000000010000000100000001000000
          010000000100000001000000}
      end
    end
  end
end
