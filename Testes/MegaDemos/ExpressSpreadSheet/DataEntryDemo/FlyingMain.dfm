object FlyingMainForm: TFlyingMainForm
  Left = 151
  Top = 95
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ExpressSpreadSheet Demo : G-RSFT Load Sheet'
  ClientHeight = 640
  ClientWidth = 797
  Color = clBtnFace
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 474
    Top = 35
    Width = 319
    Height = 576
    AutoSize = True
    Transparent = True
  end
  object Pb: TPaintBox
    Left = 474
    Top = 35
    Width = 327
    Height = 576
    OnPaint = PbPaint
  end
  object Image2: TImage
    Left = 8
    Top = 457
    Width = 461
    Height = 154
    Stretch = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 25
    Width = 797
    Height = 9
    Align = alTop
    Shape = bsTopLine
    Style = bsRaised
  end
  object cxSpread: TcxSpreadSheetBook
    Left = 8
    Top = 35
    Width = 460
    Height = 421
    ScrollBars = sbsNone
    DefaultStyle.Brush.BackgroundColor = 57
    DefaultStyle.Brush.ForegroundColor = 57
    DefaultStyle.Font.Name = 'MS Sans Serif'
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    ShowCaptionBar = False
    OnActiveCellChanging = cxSpreadActiveCellChanging
    OnAfterCalculation = cxSpreadAfterCalculation
    OnSetSelection = cxSpread1SetSelection
    OnSheetPopupMenu = cxSpread1SheetPopupMenu
    OnTopLeftChanging = cxSpreadTopLeftChanging
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 621
    Width = 797
    Height = 19
    Panels = <
      item
        Width = 800
      end>
  end
  object ssPm: TPopupMenu
    Left = 152
    Top = 72
    object pmoFormat: TMenuItem
      Caption = 'Format...'
      OnClick = pmoFormatClick
    end
    object pmWizard: TMenuItem
      Caption = 'Wizard...'
      OnClick = pmWizardClick
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default'
      'File'
      'Options'
      'Menus')
    Categories.ItemsVisibles = (
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True)
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 184
    Top = 72
    DockControlHeights = (
      0
      0
      25
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Main Menu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'File1'
        end
        item
          Visible = True
          ItemName = 'mmOptions'
        end
        item
          Visible = True
          ItemName = 'mmAircraft'
        end
        item
          Visible = True
          ItemName = 'siHelp'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object File1: TdxBarSubItem
      Caption = '&File'
      Category = 3
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mmExit'
        end>
    end
    object mmOptions: TdxBarSubItem
      Caption = '&Options'
      Category = 3
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'moToday'
        end
        item
          Visible = True
          ItemName = 'moFuelTabs'
        end>
    end
    object mmExit: TdxBarButton
      Caption = 'E&xit'
      Category = 1
      Visible = ivAlways
      OnClick = mmExitClick
    end
    object moToday: TdxBarButton
      Caption = 'Todays Date'
      Category = 2
      Visible = ivAlways
      OnClick = moTodayClick
    end
    object moFuelTabs: TdxBarButton
      Caption = 'Fuel to Tabs'
      Category = 2
      Visible = ivAlways
      OnClick = moFuelTabsClick
    end
    object siHelp: TdxBarSubItem
      Caption = 'Help'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object mmAircraft: TdxBarSubItem
      Caption = '&Select Aircraft'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
  end
end
