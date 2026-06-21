object FrmHistVer: TFrmHistVer
  Left = 195
  Top = 114
  Width = 504
  Height = 413
  Caption = 'Hist'#243'rico de Vers'#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RE: TRichEdit
    Left = 0
    Top = 40
    Width = 496
    Height = 339
    Align = alClient
    BorderStyle = bsNone
    Lines.Strings = (
      'Falha tentando ler arquivo de hist'#243'ico de vers'#245'es')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
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
    Images = FrmPri.Icones16
    LargeImages = FrmPri.Icones16
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 144
    Top = 144
    DockControlHeights = (
      0
      0
      40
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
      LargeImageIndex = 37
      SyncImageIndex = False
      ImageIndex = 37
    end
  end
end
