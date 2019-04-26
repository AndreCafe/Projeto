inherited FrmWebTab: TFrmWebTab
  Caption = 'FrmWebTab'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Paginas: TcxPageControl
    inherited tsWB: TcxTabSheet
      inherited WB: TEmbeddedWB
        Top = 30
        Height = 575
        Silent = True
        ExplicitTop = 30
        ExplicitHeight = 577
        ControlData = {
          4C000000D0590000BC3E00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object BDC: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 867
        Height = 30
        Align = dalTop
        BarManager = BarMgr
      end
    end
  end
  object BarMgr: TdxBarManager
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
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
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
      FloatClientWidth = 51
      FloatClientHeight = 121
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
          Visible = True
          ItemName = 'cmCancelarAdesao'
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
      PropertiesClassName = 'TcxHyperLinkEditProperties'
      Properties.AutoSelect = True
      Properties.ReadOnly = True
      Properties.SingleClick = True
      InternalEditValue = nil
    end
    object cmCancelarAdesao: TdxBarLargeButton
      Caption = 'Cancelar Ades'#227'o'
      Category = 0
      Hint = 'Cancelar Ades'#227'o'
      Style = cxStyle1
      Visible = ivNever
      LargeImageIndex = 16
      OnClick = cmCancelarAdesaoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
