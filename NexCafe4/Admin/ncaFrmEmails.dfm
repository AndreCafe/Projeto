object FrmEmails: TFrmEmails
  Left = 0
  Top = 0
  Caption = 'Lista de e-mails dos clientes'
  ClientHeight = 344
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 38
    Width = 447
    Height = 306
    Align = alClient
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 280
    Top = 200
    DockControlHeights = (
      0
      0
      38
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 473
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = '&Ok'
      Category = 0
      Hint = 'Ok'
      Visible = ivAlways
      LargeImageIndex = 72
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
end
