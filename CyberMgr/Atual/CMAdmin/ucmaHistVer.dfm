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
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RE: TcxRichEdit
    Left = 0
    Top = 44
    Align = alClient
    TabOrder = 4
    ExplicitWidth = 496
    ExplicitHeight = 342
    Height = 531
    Width = 794
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Controles'
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
            Item = cmFechar
            Visible = True
          end>
        Name = 'Controles'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        SizeGrip = False
        UseOwnFont = False
        UseRecentItems = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = FrmPri.im32
    MakeDisabledImagesFaded = True
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
      OnClick = cmFecharClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 45
      SyncImageIndex = False
      ImageIndex = 37
    end
  end
end
