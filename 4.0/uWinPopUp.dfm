object FormWinPopUp: TFormWinPopUp
  Left = 574
  Top = 320
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  AlphaBlend = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 252
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object WB: TEmbeddedWB
    Left = 0
    Top = 0
    Width = 302
    Height = 252
    Align = alClient
    TabOrder = 0
    DisableCtrlShortcuts = 'N'
    UserInterfaceOptions = [DontUse3DBorders, DontUseScrollBars]
    About = ' EmbeddedWB http://bsalsa.com/'
    PrintOptions.Margins.Left = 19.050000000000000000
    PrintOptions.Margins.Right = 19.050000000000000000
    PrintOptions.Margins.Top = 19.050000000000000000
    PrintOptions.Margins.Bottom = 19.050000000000000000
    PrintOptions.HTMLHeader.Strings = (
      '<HTML></HTML>')
    PrintOptions.Orientation = poPortrait
    UserAgent = 'Mozilla/4.0(Compatible-EmbeddedWB 14.59 http://bsalsa.com/ '
    ExplicitWidth = 310
    ExplicitHeight = 260
    ControlData = {
      4C000000361F00000C1A00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 96
    Top = 80
  end
end
