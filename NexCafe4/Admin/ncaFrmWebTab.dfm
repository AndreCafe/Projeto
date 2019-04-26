object FrmWEBTab: TFrmWEBTab
  Left = 0
  Top = 0
  Caption = 'WEB Tab'
  ClientHeight = 536
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 763
    Height = 536
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 168
    ExplicitWidth = 100
    ExplicitHeight = 40
    object WB: TEmbeddedWB
      Left = 0
      Top = 30
      Width = 763
      Height = 506
      Align = alClient
      TabOrder = 0
      Silent = False
      OnDocumentComplete = WBDocumentComplete
      DisableCtrlShortcuts = 'N'
      UserInterfaceOptions = [EnablesFormsAutoComplete, EnableThemes]
      About = ' EmbeddedWB http://bsalsa.com/'
      PrintOptions.HTMLHeader.Strings = (
        '<HTML></HTML>')
      PrintOptions.Orientation = poPortrait
      ExplicitTop = 27
      ControlData = {
        4C000000DC4E00004C3400000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object BDC: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 763
      Height = 30
      Align = dalTop
      BarManager = BarMgr
      SunkenBorder = False
      UseOwnSunkenBorder = True
      Visible = False
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im24
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 280
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    object barToolbar: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = BDC
      DockedDockControl = BDC
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 797
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmVoltar'
        end
        item
          Visible = True
          ItemName = 'cmAvancar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRefresh'
        end
        item
          BeginGroup = True
          UserDefine = [udWidth]
          UserWidth = 373
          Visible = True
          ItemName = 'cmURL'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object cmVoltar: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 16
      OnClick = cmVoltarClick
      ShowCaption = False
    end
    object cmAvancar: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 15
      OnClick = cmAvancarClick
      ShowCaption = False
    end
    object cmRefresh: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 26
      OnClick = cmRefreshClick
      ShowCaption = False
    end
    object cmURL: TcxBarEditItem
      Align = iaClient
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxHyperLinkEditProperties'
      Properties.AutoSelect = True
      Properties.ReadOnly = True
      Properties.SingleClick = True
      InternalEditValue = nil
    end
  end
end
