inherited FrmExpYAD: TFrmExpYAD
  Caption = 'FrmExpYAD'
  ClientHeight = 600
  ClientWidth = 425
  Color = clWhite
  OnCreate = FormCreate
  ExplicitWidth = 425
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  object WB: TEmbeddedWB
    Left = 0
    Top = 0
    Width = 160
    Height = 600
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    TabOrder = 0
    RegisterAsDropTarget = False
    OnDocumentComplete = WBDocumentComplete
    OnNavigateError = WBNavigateError
    DisableCtrlShortcuts = 'N'
    UserInterfaceOptions = [DontUse3DBorders, DontUseScrollBars]
    OnShowMessage = WBShowMessage
    OnGetExternal = WBGetExternal
    About = ' EmbeddedWB http://bsalsa.com/'
    DialogBoxes.DisableAll = True
    DialogBoxes.ReplaceCaption = False
    DialogBoxes.ReplaceIcon = False
    DialogBoxes.NewCaption = 'Internet Explorer'
    HTMLCode.Strings = (
      
        '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "' +
        'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
      '<html xmlns="http://www.w3.org/1999/xhtml">'
      '<head>'
      
        '<meta http-equiv="Content-Type" content="text/html; charset=utf-' +
        '8" />'
      '<title>Untitled Document</title>'
      '<style type="text/css">'
      '<!--'
      '.style2 {color: #333333}'
      '.style3 {color: #666666}'
      '-->'
      '</style>'
      '</head>'
      ''
      '<body style="margin: 0px 0px 0px 0px;">'
      ''
      
        '<!-- BEGIN STANDARD TAG - 120 x 600 - Nextar: Run-of-site - DO N' +
        'OT MODIFY -->'
      ''
      
        '<IFRAME FRAMEBORDER=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=NO ' +
        'WIDTH=120 HEIGHT=600 SRC="http://ad.yieldmanager.com/st?ad_type=' +
        'iframe&ad_size=120x600&section=526860"></IFRAME>'
      ''
      '<!-- END TAG -->'
      ''
      '</body>'
      '</html>')
    OnShowDialog = WBShowDialog
    PrintOptions.Enabled = True
    PrintOptions.Margins.Left = 19.050000000000000000
    PrintOptions.Margins.Right = 19.050000000000000000
    PrintOptions.Margins.Top = 19.050000000000000000
    PrintOptions.Margins.Bottom = 19.050000000000000000
    PrintOptions.HTMLHeader.Strings = (
      '<HTML></HTML>')
    PrintOptions.Orientation = poPortrait
    UserAgent = 'Mozilla/4.0(Compatible-EmbeddedWB 14.59 http://bsalsa.com/ '
    ControlData = {
      4C000000361F00000C1A00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 168
    Top = 176
    Width = 185
    Height = 121
    BevelOuter = bvNone
    Color = clFuchsia
    ParentBackground = False
    TabOrder = 1
    Visible = False
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer2Timer
    Left = 64
    Top = 32
  end
  object Timer3: TTimer
    Interval = 100
    OnTimer = Timer3Timer
    Left = 96
    Top = 32
  end
end
