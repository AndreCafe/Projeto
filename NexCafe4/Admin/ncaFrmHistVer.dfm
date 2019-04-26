object FrmRTF: TFrmRTF
  Left = 195
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Hist'#243'rico de Vers'#245'es'
  ClientHeight = 575
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RE: TcxRichEdit
    Left = 0
    Top = 44
    Align = alClient
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 4
    Height = 531
    Width = 794
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.NativeStyle = True
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 144
    Top = 152
    DockControlHeights = (
      0
      0
      44
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Controles'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 67
      FloatTop = 344
      FloatClientWidth = 69
      FloatClientHeight = 44
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmFechar'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object cmGravar: TdxBarButton
      Caption = '&Gravar'
      Category = 0
      Hint = 'Gravar'
      Visible = ivAlways
      ImageIndex = 27
      PaintStyle = psCaptionGlyph
      ShortCut = 16455
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      LargeImageIndex = 45
      OnClick = cmFecharClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 37
    end
  end
end
