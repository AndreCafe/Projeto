object frmMain: TfrmMain
  Left = 328
  Top = 102
  Caption = 'ExpressVerticalGrid Features Demo'
  ClientHeight = 635
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAllArea: TPanel
    Left = 0
    Top = 52
    Width = 784
    Height = 583
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 0
    ExplicitHeight = 635
    object SplitterNavBar: TcxSplitter
      Left = 171
      Top = 0
      Width = 8
      Height = 556
      HotZoneClassName = 'TcxMediaPlayer9Style'
      Control = NavBar
    end
    object plClient: TPanel
      Left = 179
      Top = 0
      Width = 605
      Height = 556
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object pnlHintContainer: TPanel
        Left = 39
        Top = 89
        Width = 483
        Height = 18
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object bvlHint: TBevel
          Left = 0
          Top = 0
          Width = 483
          Height = 18
          Align = alClient
          Style = bsRaised
        end
        object pnlHintText: TPanel
          Left = 0
          Top = 0
          Width = 483
          Height = 18
          Align = alClient
          Alignment = taLeftJustify
          BevelOuter = bvNone
          BorderWidth = 2
          Caption = 'pnlHintText'
          TabOrder = 0
        end
      end
    end
    object NavBar: TdxNavBar
      Left = 0
      Top = 0
      Width = 171
      Height = 556
      Align = alLeft
      ActiveGroupIndex = 3
      TabOrder = 2
      TabStop = True
      View = 8
      OptionsBehavior.Common.AllowSelectLinks = True
      OptionsImage.LargeImages = dmMain.NavBarLargeImages
      OptionsImage.SmallImages = dmMain.NavBarSmallImages
      OnLinkClick = NavBarLinkClick
      object nvgGrid: TdxNavBarGroup
        Caption = 'QuantumGrid 6'
        LargeImageIndex = 2
        SelectedLinkIndex = -1
        SmallImageIndex = 67
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Visible = False
        Links = <>
      end
      object nvgTreeList: TdxNavBarGroup
        Caption = 'QuantumTreeList4'
        LargeImageIndex = 5
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Visible = False
        Links = <>
      end
      object nvgVertGrid: TdxNavBarGroup
        Caption = 'ExpressVerticalGrid'
        LargeImageIndex = 6
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Visible = False
        Links = <>
      end
      object nvgEditors: TdxNavBarGroup
        Caption = 'ExpressEditors'
        LargeImageIndex = 1
        SelectedLinkIndex = -1
        SmallImageIndex = 68
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Links = <>
      end
      object nvgExpressControls: TdxNavBarGroup
        Caption = 'Express Controls'
        LargeImageIndex = 7
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Visible = False
        Links = <>
      end
      object nvgStandardControls: TdxNavBarGroup
        Caption = 'Standard Controls'
        LargeImageIndex = 4
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Visible = False
        Links = <>
      end
      object nvgExport: TdxNavBarGroup
        Caption = 'Export To...'
        LargeImageIndex = 3
        SelectedLinkIndex = -1
        SmallImageIndex = 69
        TopVisibleLinkIndex = 0
        UseSmallImages = False
        Links = <
          item
            Item = nbiExportHTML
          end
          item
            Item = nbiExportXML
          end
          item
            Item = nbiExportXLS
          end
          item
            Item = nbiExportText
          end>
      end
      object nbiExportHTML: TdxNavBarItem
        Caption = 'HTML'
        SmallImageIndex = 20
        OnClick = nbiExportHTMLClick
      end
      object nbiExportXML: TdxNavBarItem
        Caption = 'XML'
        SmallImageIndex = 21
        OnClick = nbiExportXMLClick
      end
      object nbiExportXLS: TdxNavBarItem
        Caption = 'Excel'
        SmallImageIndex = 22
        OnClick = nbiExportXLSClick
      end
      object nbiExportText: TdxNavBarItem
        Caption = 'Text'
        SmallImageIndex = 23
        OnClick = nbiExportTextClick
      end
    end
    object StatusBar: TdxStatusBar
      Left = 0
      Top = 556
      Width = 784
      Height = 27
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
          PanelStyle.Container = StatusBarContainer2
          Width = 235
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ExplicitTop = 608
      object StatusBarContainer2: TdxStatusBarContainerControl
        Left = 2
        Top = 4
        Width = 233
        Height = 21
        object dxBarDockControl: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 233
          Height = 24
          Align = dalTop
          BarManager = dxBarManager
        end
      end
    end
  end
  object dxBarManager: TdxBarManager
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'File'
      'View'
      'Options'
      'Menus'
      'Help'
      'Go'
      'DBNavigator'
      'StatusBar'
      'TreeList'
      'Font Style'
      'Diagrams')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      False
      False
      True
      True
      True)
    ImageOptions.Images = dmMain.BarManagerImages
    ImageOptions.StretchGlyphs = False
    NotDocking = [dsBottom]
    PopupMenuLinks = <>
    UseSystemFont = False
    Left = 245
    Top = 225
    DockControlHeights = (
      0
      0
      52
      0)
    object dxBarManagerBar1: TdxBar
      Caption = 'Main Menu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 555
      FloatTop = 365
      FloatClientWidth = 112
      FloatClientHeight = 19
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItemFile'
        end
        item
          Visible = True
          ItemName = 'bsiEdit'
        end
        item
          Visible = True
          ItemName = 'bsiInsert'
        end
        item
          Visible = True
          ItemName = 'biView'
        end
        item
          Visible = True
          ItemName = 'btnGo'
        end
        item
          Visible = True
          ItemName = 'biOptions'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItemHelp'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarManagerBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'DB Navigator'
      CaptionButtons = <>
      DockControl = dxBarDockControl
      DockedDockControl = dxBarDockControl
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 492
      FloatTop = 388
      FloatClientWidth = 230
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biFirst'
        end
        item
          Visible = True
          ItemName = 'biPrior'
        end
        item
          Visible = True
          ItemName = 'biNext'
        end
        item
          Visible = True
          ItemName = 'biLast'
        end
        item
          Visible = True
          ItemName = 'biInsert'
        end
        item
          Visible = True
          ItemName = 'biDelete'
        end
        item
          Visible = True
          ItemName = 'biEdit'
        end
        item
          Visible = True
          ItemName = 'biPost'
        end
        item
          Visible = True
          ItemName = 'biCancel'
        end
        item
          Visible = True
          ItemName = 'biRefresh'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'DBNavigator'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRecentItems = False
      Visible = True
      WholeRow = True
    end
    object dxBarManagerBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      BorderStyle = bbsNone
      Caption = 'Status Bar'
      CaptionButtons = <>
      DockControl = dxBarDockControl
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 23
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'StatusBar'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object dxBarManagerBar4: TdxBar
      Caption = 'Properties'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 20
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 258
      FloatTop = 183
      FloatClientWidth = 317
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biGrouping'
        end
        item
          Visible = True
          ItemName = 'biShowIndicator'
        end
        item
          Visible = True
          ItemName = 'biShowSummaryFooter'
        end
        item
          Visible = True
          ItemName = 'biShowHeaders'
        end
        item
          Visible = True
          ItemName = 'biShowBands'
        end
        item
          Visible = True
          ItemName = 'biShowGrid'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biAutoWidth'
        end
        item
          Visible = True
          ItemName = 'biAutoPreview'
        end
        item
          Visible = True
          ItemName = 'biShowButtonAlways'
        end
        item
          Visible = True
          ItemName = 'biInvertSelected'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biFullCollapse'
        end
        item
          Visible = True
          ItemName = 'biFullExpand'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biCustomization'
        end
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'biAutoFormat'
        end>
      OldName = 'Format'
      OneOnRow = False
      Row = 2
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxBarManagerBar5: TdxBar
      Caption = 'Summary Kinds'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 524
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 344
      FloatTop = 141
      FloatClientWidth = 247
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <
        item
          UserCaption = 'Footer Summary'
          UserDefine = [udCaption, udPaintStyle]
          UserPaintStyle = psCaption
          Visible = True
          ItemName = 'biShowSummaryFooter'
        end>
      OldName = 'SummaryKinds'
      OneOnRow = False
      Row = 2
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxBarManagerBar6: TdxBar
      Caption = 'Options'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 253
      FloatTop = 339
      FloatClientWidth = 319
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biAutoSearch'
        end
        item
          Visible = True
          ItemName = 'biAutoExpandOnSearch'
        end>
      OldName = 'Options'
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxBarManagerBar7: TdxBar
      Caption = 'Preview and AutoRowHeight'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 578
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 23
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <>
      OldName = 'PreviewAndAutoRowHeight'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxBarManagerBar8: TdxBar
      Caption = 'Standard'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 24
      DockingStyle = dsTop
      FloatLeft = 264
      FloatTop = 283
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biFileNew'
        end
        item
          Visible = True
          ItemName = 'biFileOpen'
        end
        item
          Visible = True
          ItemName = 'biFileSave'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biUndo'
        end
        item
          Visible = True
          ItemName = 'biRedo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biPageSetup'
        end
        item
          Visible = True
          ItemName = 'biPrintPreview'
        end
        item
          Visible = True
          ItemName = 'biPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biStyle'
        end
        item
          Visible = True
          ItemName = 'biShowInspector'
        end>
      OldName = 'Standard'
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar9: TdxBar
      Caption = 'Editing'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 433
      DockedTop = 23
      DockingStyle = dsTop
      FloatLeft = 422
      FloatTop = 315
      FloatClientWidth = 23
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biTreeListAddNode'
        end
        item
          Visible = True
          ItemName = 'biTreeListAddChildNode'
        end
        item
          Visible = True
          ItemName = 'biTreeListAddSection'
        end
        item
          Visible = True
          ItemName = 'biTreeListAddValue'
        end
        item
          Visible = True
          ItemName = 'biTreeListPost'
        end
        item
          Visible = True
          ItemName = 'biTreeListCancel'
        end
        item
          Visible = True
          ItemName = 'biTreeListDelete'
        end>
      OldName = 'TreeList'
      OneOnRow = False
      Row = 4
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxBarManagerBar10: TdxBar
      Caption = 'Font Format'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 288
      DockedTop = 23
      DockingStyle = dsTop
      FloatLeft = 484
      FloatTop = 279
      FloatClientWidth = 23
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <
        item
          UserDefine = [udWidth]
          UserWidth = 96
          Visible = True
          ItemName = 'biFontName'
        end
        item
          Visible = True
          ItemName = 'biFontColor'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 40
          Visible = True
          ItemName = 'biFontSize'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biAlignLeft'
        end
        item
          Visible = True
          ItemName = 'biAlignCenter'
        end
        item
          Visible = True
          ItemName = 'biAlignRight'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biFontItalic'
        end
        item
          Visible = True
          ItemName = 'biFontBold'
        end
        item
          Visible = True
          ItemName = 'biFontUnderLine'
        end
        item
          Visible = True
          ItemName = 'biFontStrikeOut'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biCellMerge'
        end
        item
          Visible = True
          ItemName = 'biCellUnMerge'
        end>
      OldName = 'FontFormat'
      OneOnRow = False
      Row = 4
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxBarManagerBar11: TdxBar
      Caption = 'SpreadSheet'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 51
      DockingStyle = dsTop
      FloatLeft = 484
      FloatTop = 279
      FloatClientWidth = 23
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <
        item
          UserDefine = [udWidth]
          UserWidth = 73
          Visible = True
          ItemName = 'biSelectionText'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 703
          Visible = True
          ItemName = 'biCellText'
        end>
      OldName = 'SpreadSheet'
      OneOnRow = True
      Row = 6
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxBarManagerBar12: TdxBar
      Caption = 'Diagrams'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 51
      DockingStyle = dsTop
      FloatLeft = 404
      FloatTop = 341
      FloatClientWidth = 23
      FloatClientHeight = 22
      Hidden = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biColumnDiagram'
        end
        item
          Visible = True
          ItemName = 'biBarDiagram'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biCategoriesInReverseOrder'
        end
        item
          Visible = True
          ItemName = 'biValueAxisAtMaxCategory'
        end>
      OldName = 'Diagrams'
      OneOnRow = True
      Row = 5
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object biExportTo: TdxBarSubItem
      Caption = '&Export To'
      Category = 0
      Visible = ivInCustomizing
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biExportToHTML'
        end
        item
          Visible = True
          ItemName = 'biExportToXML'
        end
        item
          Visible = True
          ItemName = 'biExportToExcel'
        end
        item
          Visible = True
          ItemName = 'biExportToText'
        end>
    end
    object biExportToHTML: TdxBarButton
      Caption = '&HTML...'
      Category = 0
      Hint = 'HTML'
      Visible = ivInCustomizing
      ImageIndex = 39
    end
    object biExportToXML: TdxBarButton
      Caption = '&XML...'
      Category = 0
      Hint = 'XML'
      Visible = ivInCustomizing
      ImageIndex = 40
    end
    object biExportToExcel: TdxBarButton
      Caption = '&Excel...'
      Category = 0
      Hint = 'Excel'
      Visible = ivInCustomizing
      ImageIndex = 41
    end
    object biExportToText: TdxBarButton
      Caption = '&Text...'
      Category = 0
      Hint = 'Text'
      Visible = ivInCustomizing
      ImageIndex = 42
    end
    object biPageSetup: TdxBarSubItem
      Caption = 'Page Set&up'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biPrintStyles'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biDefinePrintStyles'
        end>
    end
    object biPrintStyles: TdxBarListItem
      Caption = 'Print Styles'
      Category = 0
      Visible = ivInCustomizing
      ShowCheck = True
      ShowNumbers = False
    end
    object biDefinePrintStyles: TdxBarButton
      Caption = '&Define Print Styles...'
      Category = 0
      Hint = 'Define Print Styles'
      Visible = ivInCustomizing
    end
    object biPrintPreview: TdxBarButton
      Caption = 'Print Pre&view...'
      Category = 0
      Hint = 'Print Preview'
      Visible = ivAlways
      ImageIndex = 43
    end
    object biPrint: TdxBarButton
      Tag = 1
      Caption = '&Print...'
      Category = 0
      Hint = 'Print'
      Visible = ivAlways
      ImageIndex = 45
    end
    object biExit: TdxBarButton
      Caption = 'E&xit'
      Category = 0
      Hint = 'Exit'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object biFileNew: TdxBarButton
      Caption = 'New'
      Category = 0
      Hint = 'New'
      Visible = ivNever
      ImageIndex = 62
    end
    object biFileOpen: TdxBarButton
      Caption = 'Open'
      Category = 0
      Hint = 'Open'
      Visible = ivNever
      ImageIndex = 46
    end
    object biFileSave: TdxBarButton
      Caption = 'Save'
      Category = 0
      Hint = 'Save'
      Visible = ivNever
      ImageIndex = 47
    end
    object actUndo: TdxBarCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ItemIndex = -1
    end
    object actRedo: TdxBarCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ItemIndex = -1
    end
    object biUndo: TdxBarButton
      Caption = 'Undo'
      Category = 0
      Hint = 'Undo'
      Visible = ivNever
      ImageIndex = 57
    end
    object biRedo: TdxBarButton
      Caption = 'Redo'
      Category = 0
      Hint = 'Redo'
      Visible = ivNever
      ImageIndex = 58
    end
    object bsiEdit: TdxBarSubItem
      Caption = 'Edit'
      Category = 0
      Visible = ivNever
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biCut'
        end
        item
          Visible = True
          ItemName = 'biCopy'
        end
        item
          Visible = True
          ItemName = 'biPast'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biUndo'
        end
        item
          Visible = True
          ItemName = 'biRedo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biDeleteCells'
        end
        item
          Visible = True
          ItemName = 'biInsertCells'
        end>
    end
    object biCut: TdxBarButton
      Caption = 'Cut'
      Category = 0
      Hint = 'Cut'
      Visible = ivNever
      ImageIndex = 59
    end
    object biCopy: TdxBarButton
      Caption = 'Copy'
      Category = 0
      Hint = 'Copy'
      Visible = ivNever
      ImageIndex = 60
    end
    object biPast: TdxBarButton
      Caption = 'Past'
      Category = 0
      Hint = 'Past'
      Visible = ivNever
      ImageIndex = 61
    end
    object biDeleteCells: TdxBarButton
      Caption = 'Delete Cells...'
      Category = 0
      Hint = 'Delete Cells'
      Visible = ivNever
    end
    object biInsertCells: TdxBarButton
      Caption = 'Insert Cells...'
      Category = 0
      Hint = 'Insert Cells'
      Visible = ivNever
    end
    object bsiInsert: TdxBarSubItem
      Caption = 'Insert'
      Category = 0
      Visible = ivNever
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biInsertCells'
        end
        item
          Visible = True
          ItemName = 'biInsertRow'
        end
        item
          Visible = True
          ItemName = 'biInsertColumn'
        end
        item
          Visible = True
          ItemName = 'biInsertSheet'
        end>
    end
    object dxBarButton2: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object biInsertRow: TdxBarButton
      Caption = 'Row'
      Category = 0
      Hint = 'Row'
      Visible = ivNever
    end
    object biInsertColumn: TdxBarButton
      Caption = 'Column'
      Category = 0
      Hint = 'Column'
      Visible = ivNever
    end
    object biInsertSheet: TdxBarButton
      Caption = 'Sheet'
      Category = 0
      Hint = 'Sheet'
      Visible = ivNever
    end
    object biSelectionText: TdxBarCombo
      Caption = 'Selection Text'
      Category = 0
      Hint = 'Selection Text'
      Visible = ivNever
      Text = '           A1'
      ItemIndex = -1
    end
    object biCellText: TdxBarEdit
      Align = iaRight
      Caption = '     Cell text = '
      Category = 0
      Hint = '     Cell text = '
      Visible = ivNever
      ShowCaption = True
    end
    object biCellShow: TdxBarButton
      Caption = 'Show'
      Category = 0
      Hint = 'Show'
      Visible = ivNever
    end
    object biCellHide: TdxBarButton
      Caption = 'Hide'
      Category = 0
      Hint = 'Hide'
      Visible = ivNever
    end
    object biCellProperties: TdxBarButton
      Caption = 'Format cells...'
      Category = 0
      Hint = 'Format cells'
      Visible = ivNever
      ImageIndex = 63
    end
    object biGrouping: TdxBarButton
      Caption = 'Grouping'
      Category = 1
      Hint = 'Grouping'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 10
    end
    object biShowIndicator: TdxBarButton
      Caption = 'Show Indicator'
      Category = 1
      Hint = 'Show Indicator'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 11
    end
    object biShowSummaryFooter: TdxBarButton
      Caption = 'Show Summary Footer'
      Category = 1
      Hint = 'Show Summary Footer'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 12
    end
    object biShowHeaders: TdxBarButton
      Caption = 'Show Headers'
      Category = 1
      Hint = 'Show Headers'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 13
    end
    object biAutoWidth: TdxBarButton
      Caption = 'AutoWidth'
      Category = 1
      Hint = 'AutoWidth'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 14
    end
    object biShowGrid: TdxBarButton
      Caption = 'Show Grid'
      Category = 1
      Hint = 'Show Grid'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 15
    end
    object biAutoPreview: TdxBarButton
      Caption = 'AutoPreview'
      Category = 1
      Hint = 'AutoPreview'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 16
    end
    object biShowButtonAlways: TdxBarButton
      Caption = 'Always Display Buttons'
      Category = 1
      Hint = 'Always Display Buttons'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 17
    end
    object biInvertSelected: TdxBarButton
      Caption = 'Invert Selected'
      Category = 1
      Hint = 'Invert Selected'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 18
    end
    object biAutoFormat: TdxBarButton
      Caption = '&Auto Format...'
      Category = 1
      Hint = 'Auto Format'
      Visible = ivInCustomizing
      ImageIndex = 8
    end
    object biCustomization: TdxBarButton
      Caption = 'Runtime Column Customization'
      Category = 1
      Hint = 'Column Customization'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 19
    end
    object biShowBands: TdxBarButton
      Caption = 'ShowBands'
      Category = 1
      Hint = 'ShowBands'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
      ImageIndex = 20
    end
    object biFullCollapse: TdxBarButton
      Caption = 'FullCollapse'
      Category = 1
      Hint = 'FullCollapse'
      Visible = ivInCustomizing
      ImageIndex = 21
    end
    object biFullExpand: TdxBarButton
      Caption = 'FullExpand'
      Category = 1
      Hint = 'FullExpand'
      Visible = ivInCustomizing
      ImageIndex = 22
    end
    object biBestFitAll: TdxBarButton
      Tag = 1
      Caption = 'Best Fit (all columns)'
      Category = 1
      Hint = 'Best Fit (all columns)'
      Visible = ivInCustomizing
    end
    object biStyle: TdxBarSubItem
      Caption = '&Style'
      Category = 1
      Visible = ivAlways
      ItemLinks = <>
    end
    object biStyleList: TdxBarListItem
      Caption = 'Style'
      Category = 1
      Visible = ivAlways
      ItemIndex = 3
      ShowCheck = True
      ShowNumbers = False
    end
    object biNative: TdxBarButton
      Caption = 'Native'
      Category = 1
      Hint = 'Native'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
    end
    object biShowInspector: TdxBarButton
      Caption = 'Modify Properties...'
      Category = 1
      Hint = 'Modify Properties'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biAutoSearch: TdxBarButton
      Caption = 'Auto&Search'
      Category = 2
      Hint = 'AutoSearch'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
    end
    object biAutoExpandOnSearch: TdxBarButton
      Caption = 'Auto&ExpandOnSearch'
      Category = 2
      Hint = 'AutoExpandOnSearch'
      Visible = ivInCustomizing
      ButtonStyle = bsChecked
    end
    object biSearchColor: TdxBarColorCombo
      Caption = 'Search &Color'
      Category = 2
      Hint = 'Search Color'
      Visible = ivInCustomizing
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF000101A6
        000202B4000404E4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000101A6
        000202B4000404E4FFFFFFFF5201F9075202FA075204FC07FFFFFFFF070056FF
        070072FF0700D2FFFFFFFFFFFF5207FFFF5207FFFF5207FFFFFF}
      AutoColor = clNone
      Color = clNone
      ShowAutoColor = True
    end
    object biSearchTextColor: TdxBarColorCombo
      Caption = 'Search &TextColor'
      Category = 2
      Hint = 'Search TextColor'
      Visible = ivInCustomizing
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF000101A6
        000202B4000404E4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000101A6
        000202B4000404E4FFFFFFFF5201F9075202FA075204FC07FFFFFFFF070056FF
        070072FF0700D2FFFFFFFFFFFF5207FFFF5207FFFF5207FFFFFF}
      AutoColor = clNone
      Color = clNone
      ShowAutoColor = True
    end
    object dxBarSubItemFile: TdxBarSubItem
      Caption = '&File'
      Category = 3
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biFileNew'
        end
        item
          Visible = True
          ItemName = 'biFileOpen'
        end
        item
          Visible = True
          ItemName = 'biFileSave'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biExportTo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biPageSetup'
        end
        item
          Visible = True
          ItemName = 'biPrintPreview'
        end
        item
          Visible = True
          ItemName = 'biPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biExit'
        end>
    end
    object biView: TdxBarSubItem
      Tag = 2
      Caption = '&View'
      Category = 3
      Visible = ivNever
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biGrouping'
        end
        item
          Visible = True
          ItemName = 'biShowIndicator'
        end
        item
          Visible = True
          ItemName = 'biShowSummaryFooter'
        end
        item
          Visible = True
          ItemName = 'biShowHeaders'
        end
        item
          Visible = True
          ItemName = 'biShowBands'
        end
        item
          Visible = True
          ItemName = 'biShowGrid'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biAutoWidth'
        end
        item
          Visible = True
          ItemName = 'biAutoPreview'
        end
        item
          Visible = True
          ItemName = 'biShowButtonAlways'
        end
        item
          Visible = True
          ItemName = 'biInvertSelected'
        end
        item
          Visible = True
          ItemName = 'biBestFitAll'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biFullCollapse'
        end
        item
          Visible = True
          ItemName = 'biFullExpand'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biCustomization'
        end
        item
          Visible = True
          ItemName = 'biAutoFormat'
        end>
    end
    object btnGo: TdxBarSubItem
      Tag = 2
      Caption = '&Go'
      Category = 3
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biViews'
        end>
    end
    object biOptions: TdxBarSubItem
      Caption = '&Options'
      Category = 3
      Visible = ivInCustomizing
      ItemLinks = <
        item
          Visible = True
          ItemName = 'biAutoSearch'
        end
        item
          Visible = True
          ItemName = 'biAutoExpandOnSearch'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'biSearchColor'
        end
        item
          Visible = True
          ItemName = 'biSearchTextColor'
        end>
    end
    object dxBarSubItemHelp: TdxBarSubItem
      Caption = '&Help'
      Category = 3
      Visible = ivAlways
      ItemLinks = <>
    end
    object biViews: TdxBarListItem
      Caption = 'Views'
      Category = 5
      Visible = ivAlways
      OnGetData = biViewsGetData
      ShowCheck = True
      ShowNumbers = False
    end
    object biFirst: TdxBarButton
      Caption = 'First'
      Category = 6
      Hint = 'First'
      Visible = ivAlways
      ImageIndex = 24
    end
    object biPrior: TdxBarButton
      Caption = 'Prior'
      Category = 6
      Hint = 'Prior'
      Visible = ivAlways
      ImageIndex = 25
    end
    object biNext: TdxBarButton
      Caption = 'Next'
      Category = 6
      Hint = 'Next'
      Visible = ivAlways
      ImageIndex = 26
    end
    object biLast: TdxBarButton
      Caption = 'Last'
      Category = 6
      Hint = 'Last'
      Visible = ivAlways
      ImageIndex = 27
    end
    object biInsert: TdxBarButton
      Caption = 'Insert'
      Category = 6
      Hint = 'Insert'
      Visible = ivAlways
      ImageIndex = 28
    end
    object biDelete: TdxBarButton
      Caption = 'Delete'
      Category = 6
      Hint = 'Delete'
      Visible = ivAlways
      ImageIndex = 29
    end
    object biEdit: TdxBarButton
      Caption = 'Edit'
      Category = 6
      Hint = 'Edit'
      Visible = ivNever
      ImageIndex = 30
    end
    object biPost: TdxBarButton
      Caption = 'Post'
      Category = 6
      Hint = 'Post'
      Visible = ivNever
      ImageIndex = 31
    end
    object biCancel: TdxBarButton
      Caption = 'Cancel'
      Category = 6
      Hint = 'Cancel'
      Visible = ivNever
      ImageIndex = 32
    end
    object biRefresh: TdxBarButton
      Caption = 'Refresh'
      Category = 6
      Hint = 'Refresh'
      Visible = ivNever
      ImageIndex = 33
    end
    object biHintContainer: TdxBarControlContainerItem
      Align = iaClient
      Caption = 'Hint'
      Category = 7
      Hint = 'Hint'
      Visible = ivInCustomizing
      Control = pnlHintContainer
    end
    object biTreeListAddNode: TdxBarButton
      Caption = 'Add Node'
      Category = 8
      Hint = 'Add Node'
      Visible = ivInCustomizing
      ImageIndex = 55
    end
    object biTreeListAddChildNode: TdxBarButton
      Caption = 'Add Child Node'
      Category = 8
      Hint = 'Add Child Node'
      Visible = ivInCustomizing
      ImageIndex = 52
    end
    object biTreeListPost: TdxBarButton
      Caption = 'Post'
      Category = 8
      Hint = 'Post'
      Visible = ivInCustomizing
      ImageIndex = 56
    end
    object biTreeListCancel: TdxBarButton
      Caption = 'Cancel'
      Category = 8
      Hint = 'Cancel'
      Visible = ivInCustomizing
      ImageIndex = 53
    end
    object biTreeListDelete: TdxBarButton
      Caption = 'Delete'
      Category = 8
      Hint = 'Delete'
      Visible = ivInCustomizing
      ImageIndex = 54
    end
    object biTreeListAddSection: TdxBarButton
      Caption = 'Add Section'
      Category = 8
      Hint = 'Add Section'
      Visible = ivInCustomizing
      ImageIndex = 55
    end
    object biTreeListAddValue: TdxBarButton
      Caption = 'Add Value'
      Category = 8
      Hint = 'Add Value'
      Visible = ivInCustomizing
      ImageIndex = 52
    end
    object biFontName: TdxBarFontNameCombo
      Caption = 'Font Name'
      Category = 9
      Hint = 'Font Name'
      Visible = ivNever
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888444488844444488887488888744
        7888888448888744888888874888844788888888444444488888888874884478
        8888888884484488888888888744478888888888884448888888888888747888
        8888888888848888888888888888888888888888888888888888}
      Width = 160
      DropDownCount = 12
    end
    object biFontColor: TdxBarColorCombo
      Caption = 'Font Color'
      Category = 9
      Hint = 'Font Color'
      Visible = ivNever
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF000101A6
        000202B4000404E4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000101A6
        000202B4000404E4FFFFFFFF5201F9075202FA075204FC07FFFFFFFF070056FF
        070072FF0700D2FFFFFFFFFFFF5207FFFF5207FFFF5207FFFFFF}
      Color = clBlack
    end
    object biFontSize: TdxBarSpinEdit
      Caption = 'Font Size'
      Category = 9
      Hint = 'Font Size'
      Visible = ivNever
      MaxValue = 100.000000000000000000
      MinValue = 5.000000000000000000
      Value = 5.000000000000000000
    end
    object biAlignRight: TdxBarButton
      Tag = 6
      Caption = 'Right align'
      Category = 9
      Hint = 'Right align'
      Visible = ivNever
      ButtonStyle = bsChecked
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888000000000088888888888888
        8888000000000000008888888888888888888888000000000088888888888888
        8888000000000000008888888888888888888888000000000088888888888888
        8888000000000000008888888888888888888888888888888888}
    end
    object biAlignCenter: TdxBarButton
      Tag = 5
      Caption = 'Center align'
      Category = 9
      Hint = 'Center align'
      Visible = ivNever
      ButtonStyle = bsChecked
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888800000000008888888888888888
        8888000000000000008888888888888888888800000000008888888888888888
        8888000000000000008888888888888888888800000000008888888888888888
        8888000000000000008888888888888888888888888888888888}
    end
    object biAlignLeft: TdxBarButton
      Tag = 4
      Caption = 'Left align'
      Category = 9
      Hint = 'Left align'
      Visible = ivNever
      ButtonStyle = bsChecked
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888000000000000088888888888888
        8888800000000088888888888888888888888000000000000088888888888888
        8888800000000088888888888888888888888000000000000088888888888888
        8888800000000088888888888888888888888888888888888888}
    end
    object biFontItalic: TdxBarButton
      Tag = 7
      Caption = 'Italic font'
      Category = 9
      Hint = 'Italic font'
      Visible = ivNever
      ButtonStyle = bsChecked
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888000000888
        8888888880078888888888888700888888888888880078888888888888700888
        8888888888800788888888888887008888888888888800788888888888800000
        8888888888888888888888888888888888888888888888888888}
    end
    object biFontBold: TdxBarButton
      Tag = 8
      Caption = 'Bold font'
      Category = 9
      Hint = 'Bold font'
      Visible = ivNever
      ButtonStyle = bsChecked
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888000000008
        8888888800088000888888880008800088888888000880008888888800000008
        8888888800088000888888880008800088888888000880008888888000000008
        8888888888888888888888888888888888888888888888888888}
    end
    object biFontUnderLine: TdxBarButton
      Tag = 9
      Caption = 'UnderLine'
      Category = 9
      Hint = 'Underline '
      Visible = ivNever
      ButtonStyle = bsChecked
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888800000000088888888888888888888888880000088
        8888888800787008888888880088800888888888008880088888888800888008
        8888888800888008888888880088800888888888008880088888888000080000
        8888888888888888888888888888888888888888888888888888}
    end
    object biFontStrikeOut: TdxBarButton
      Tag = 10
      Caption = 'Strikeout'
      Category = 9
      Hint = 'Strikeout'
      Visible = ivNever
      ButtonStyle = bsChecked
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888000800000088800080888080880808880000000000000000880808800088
        0888880008808808088888808880880808808880880000888000888888888888
        8888888888888888888888888888888888888888888888888888}
    end
    object biCellMerge: TdxBarButton
      Tag = 11
      Caption = 'Merge cells'
      Category = 9
      Hint = 'Merge cells'
      Visible = ivNever
      Glyph.Data = {
        36010000424D3601000000000000760000002800000011000000100000000100
        040000000000C000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
        00000000000080FFFFFF0FFFFFFF0000000080FFFFFF0FFFFFFF000000008000
        0000000000000000000080FFFFFFFFFFFFFF0000000080F0FFF0000FFF0F0000
        00008000FFF0FF0FFF0000000000800000F8000F0000000000008000FFFFFF0F
        FF000000000080F0FFF0008FFF0F0000000080FFFFFFFFFFFFFF000000008000
        0000000000000000000080FFFFFF0FFFFFFF0000000080FFFFFF0FFFFFFF0000
        0000800000000000000000000000888888888888888880000000}
    end
    object biCellUnMerge: TdxBarButton
      Tag = 12
      Caption = 'Split merged cells'
      Category = 9
      Hint = 'Split merged cells'
      Visible = ivNever
      Glyph.Data = {
        36010000424D3601000000000000760000002800000011000000100000000100
        040000000000C000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
        00000000000080FFFFFF0FFFFFFF0000000080FFFFFF0FFFFFFF000000008000
        0000000000000000000080FFFFFF0FFFFFFF0000000080FFFFFF0FFFFFFF0000
        000080FFFFFF0FFFFFFF0000000080000000000000000000000080FFFFFF0FFF
        FFFF0000000080FFFFFF0FFFFFFF0000000080FFFFFF0FFFFFFF000000008000
        0000000000000000000080FFFFFF0FFFFFFF0000000080FFFFFF0FFFFFFF0000
        0000800000000000000000000000888888888888888880000000}
    end
    object biColumnDiagram: TdxBarButton
      Caption = 'Column Diagram'
      Category = 10
      Hint = 'Column Diagram'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000FFFFFF
        FFFFFF00000060C1FF000000B4835C000000FFFFFF00000060C1FF000000B483
        5C000000FFFFFFFFFFFF000000FFFFFFFFFFFF00000060C1FF000000B4835C00
        0000FFFFFF00000060C1FF000000B4835C000000FFFFFFFFFFFF000000FFFFFF
        FFFFFF00000060C1FF000000B4835C000000FFFFFF00000060C1FF000000B483
        5C000000FFFFFFFFFFFF000000FFFFFFFFFFFF00000060C1FF000000B4835C00
        0000FFFFFF00000060C1FF000000B4835C000000FFFFFFFFFFFF000000FFFFFF
        FFFFFF00000060C1FF000000B4835C000000FFFFFF00000060C1FF000000B483
        5C000000FFFFFFFFFFFF000000FFFFFFFFFFFF00000060C1FF00000000000000
        0000FFFFFF00000060C1FF000000B4835C000000FFFFFFFFFFFF000000FFFFFF
        FFFFFF00000060C1FF000000FFFFFFFFFFFFFFFFFF00000060C1FF000000B483
        5C000000FFFFFFFFFFFF000000FFFFFFFFFFFF00000060C1FF000000FFFFFFFF
        FFFFFFFFFF000000000000000000B4835C000000FFFFFFFFFFFF000000FFFFFF
        FFFFFF00000060C1FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000B483
        5C000000FFFFFFFFFFFF000000FFFFFFFFFFFF000000000000000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000B4835C000000FFFFFFFFFFFF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000B483
        5C000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000B4835C000000FFFFFFFFFFFF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      PaintStyle = psCaptionGlyph
    end
    object biBarDiagram: TdxBarButton
      Caption = 'Bar Diagram'
      Category = 10
      Hint = 'Bar Diagram'
      Visible = ivAlways
      AllowAllUp = True
      ButtonStyle = bsChecked
      GroupIndex = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000060C1FF
        60C1FF60C1FF60C1FF60C1FF60C1FF60C1FF60C1FF60C1FF60C1FF000000FFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000B4835C
        B4835CB4835CB4835CB4835CB4835C000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000060C1FF
        60C1FF60C1FF60C1FF60C1FF60C1FF60C1FF60C1FF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000FFFFFF000000B4835C
        B4835CB4835CB4835CB4835CB4835CB4835CB4835CB4835CB4835CB4835CB483
        5CB4835C000000FFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000FFFFFF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      PaintStyle = psCaptionGlyph
    end
    object biCategoriesInReverseOrder: TdxBarButton
      Caption = 'Categories in Reverse Order'
      Category = 10
      Hint = 'Categories in Reverse Order'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object biValueAxisAtMaxCategory: TdxBarButton
      Caption = 'Value Axis at Max Category'
      Category = 10
      Hint = 'Value Axis at Max Category'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
  end
  object dxComponentPrinter: TdxComponentPrinter
    PrintTitle = 'QuantumGrid3 Features'
    Version = 0
    OnEndGenerateReport = dxComponentPrinterEndGenerateReport
    OnGenerateReportProgress = dxComponentPrinterGenerateReportProgress
    OnPrintDeviceBusy = dxComponentPrinterPrintDeviceBusy
    OnPrintDeviceError = dxComponentPrinterPrintDeviceError
    OnStartGenerateReport = dxComponentPrinterStartGenerateReport
    Left = 244
    Top = 287
  end
  object dxPrintStyleManager1: TdxPrintStyleManager
    CurrentStyle = dxPrintStyleManager1Style1
    PageSetupDialog = dxPageSetupDialog1
    Version = 0
    OnChangeCurrentStyle = dxPrintStyleManager1ChangeCurrentStyle
    OnStyleListChanged = dxPrintStyleManager1StyleListChanged
    Left = 288
    Top = 287
    object dxPrintStyleManager1Style1: TdxPSPrintStyle
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 5080
      PrinterPage.Header = 2540
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[Page # of Pages #]')
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageFooter.RightTitle.Strings = (
        '')
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageHeader.LeftTitle.Strings = (
        '[Date & Time Printed]')
      PrinterPage.PageHeader.RightTitle.Strings = (
        'Printed By [User Name]')
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      StyleCaption = 'Standard'
      Left = 362
      Top = 288
      BuiltInStyle = True
    end
    object dxPrintStyleManager1Style2: TdxPSPrintStyle
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 5080
      PrinterPage.Header = 2540
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageFooter.Background.Brush.Color = clBlack
      PrinterPage.PageFooter.Background.Mode = bmBrush
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWhite
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Background.Brush.Color = clBlack
      PrinterPage.PageHeader.Background.Mode = bmBrush
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWhite
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageHeader.LeftTitle.Strings = (
        'Printed By [User Name]')
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      StyleCaption = 'Professional'
      Left = 372
      Top = 298
      BuiltInStyle = True
    end
    object dxPrintStyleManager1Style3: TdxPSPrintStyle
      PrinterPage.Background.Brush.Color = clBlack
      PrinterPage.Background.Mode = bmBrushBitmap
      PrinterPage.Background.Picture.Data = {
        42200000424D4220000000000000420000002800000040000000400000000100
        1000030000000020000000000000000000000000000000000000007C0000E003
        00001F000000F94FBF67BF67394FBF67394FBF67BF673933BF67394F39333933
        3933BF67F967BF67F9673F4F3933BF67394F394F3F4F394F3F4F394F3F4FF94F
        BF67BF679C733F4FBF67394F3F4FF94F394F3F4FF967BF67F94FBF67F967BF67
        BF673F4F3933FF7FBF673933394F39333933BF67BF673F4F394F3F4F3F4FF94F
        3F4FF94F3F4FBF675A6BFF4FBF67FF679C73394FBF67BF67394F3F4F394FBF67
        BF67BF67394F3F4FBF67BF673933FF7FFF673933394F3F4F394F3F4F394F3F4F
        BF67F9673F4FF94FBF67BF67BF67FF67BF67BF67394F3F4FBF67BF673F4FBF67
        F94FBF67394F3933BF67394F3933394FFF4FBF67394F394F394F394F394F3F4F
        394F3F4FF94FBF67FF4F394F3F4F394FFF4FBF67F94FBF67BF67F967BF67FF67
        5A6BFF4FBF67BF67F94FBF67394F394FFF7F3F4F394F3F4F394F39333F4FF94F
        BF67BF67394FBF67BF67F94FBF677B6FFF67FF7FFF67BF67394FBF67F94FBF67
        BF67394FBF67F94F3F4FBF67BF67BF67F9673F4FBF673933BF67FF7F3F4F394F
        394F3F4F394FBF67394FBF67394F3F4F394F3F4FBF675A6BFF4FBF67BF67394F
        BF67394F394F3F4F5A6BBF67BF6739333F4FFF7F3933394F3F4F394F394FBF67
        BF67F94F3F4FBF67394FBF67BF67FF4F5A6B3F4FBF67BF67F94FBF67BF673967
        F94FBF67DE7BBF67394FF94FBF675A6BBF67BF67F9673F4F3933FF7FBF673933
        3F4F394F3F4F394FFF4F394FBF673933394FBF67F94FBF67FF67394FBF67F94F
        BF67BF673F4F3933BF67F94FBF67FF673933394F3F4F393339333933BF67BF67
        BF67394FBF67394F3F4FF94F3F4F3967FF4FBF67F94FBF67BF67394FBF67FF4F
        BF673F4FBF67BF67BF67BF67BF67BF67FF4F394FBF67FF673F4F3933FF67394F
        39333933394FBF67BF67394F3F4F394F394FBF67BF67BF67394FBF67BF67BF67
        BF67F94F3F67F967BF67BF67FF67BF67FF67394F394F394F3F4FBF67F94FBF67
        394FFF4FBF67FF67394F3F4FF94F3F4F39673F4FBF67394FBF67BF67BF67394F
        3933394FFF4F394FFF4F394FFF67394FBF67FF67394FBF67BF67F94F394F394F
        3F4FFF67FF67394FBF67BF67F94FBF67BF67BF67FF67394FBF67FF4F394FFF67
        394FBF67BF67FF4F394F3F4F394F394FBF67BF67BF67BF67F967BF67BF67BF67
        BF67FF67394FFF673F4F394F3F4FF94F3F4FF94F3F4FF94F3F4FF967BF67394F
        FF673F4F394F3F4F394FBF67BF673F4F394F3F4F3967FF4F5A6BBF67BF67BF67
        FF67394F3F4F3F4FF967BF67BF67BF67F94FBF67394FBF67FF67DE7BBF673F4F
        F967BF67394FBF67BF67FF67BF67BF67394FFF4FBF67F94FBF67BF67394FFF4F
        394FBF67BF67394FFF67394F394F3F4F394F394F3F4F394FFF4FBF67BF67394F
        3F4FFF7F3933394F3F4FF967BF67F94F394F3933BF67BF673F4FF967BF67F94F
        3F4FF967BF675A6BFF4F3F67F94FBF67BF67BF673F4FF94F3F4FF967BF67394F
        BF67BF67FF4FBF67F9673F67F967BF67BF67394FBF67BF67BF67394FBF67FF7F
        BF67394FBF67BF67394FBF673F33394F3F33394F3F4F394FBF675A6BFF4FBF67
        F94F3F4F3933394FBF67BF67BF67BF67FF67BF67BF67BF67F94FBF67BF673F4F
        5A6BFF67BF67BF67BF67F967BF67394FBF67394F394F3F4F394F3F4FFF4F394F
        FF67394FBF67394FBF67FF4FBF67BF67BF67BF67394FFF67394FFF4FBF67F94F
        BF67BF67394FBF67394F3F4F394F394F3F4F394F394FFF67F9673F4F5A6B394F
        BF67BF675A6BFF67FF4F394F394F3F4F394FBF67F94FBF673967BF67F94FBF67
        3F4F394F3F4F3F4FF94F3F4FBF67BF67BF67F94F3F4FDE7B3F33394F39335A6B
        BF673F4F394FFF4F394FBF67394F3F67F94FBF67394FFF673F4F394F3F4F394F
        3F4FF94F3F4FF967BF67F94F3F4F394F393339333F4FFF673F4FFF4FFF67FF67
        394FBF67FF4FBF67394FBF67FF67FF67FF67394FBF67BF67FF4FBF67BF673F4F
        F94FFF67BF67BF67FF675A6B394FBF67FF4F7B6F3933BF67394F39333F4FBF67
        F94F394F3F4F394F3F4FF94F3F4FF94F3F67394FFF4FBF67394FBF67394F394F
        3F4F394FBF67BF67BF67BF67BF67BF67394F3F4FF967BF67394F3F4F394F3F4F
        BF67F967BF67394FBF67BF67BF67BF67BF67BF67394FBF67BF67394FBF67394F
        3F4FFF7FFF7F394FBF67BF67FF4F3967BF67BF67BF67FF4F394F3F4FF967FF67
        3F4F3F4F394F394F3F4F394F3F4F394FFF4F394FBF67BF67394FFF4FBF673933
        3933BF67FF67394FF94F3F4F394FF94FBF67FF67BF67FF67394FBF67394F3933
        BF67BF67394FFF4F394FBF67394FBF67F94F5A6BFF4F394FBF67BF67F94FBF67
        394F394FFF7F394F3F4F394FFF4FBF67BF67394FBF67394FBF67BF67BF67BF67
        394F3933FF7FBF6739333F4F394F3F4F394F3F4FF967BF67BF67394F394F3F4F
        BF67F94F3F4FBF67BF67BF67BF67BF67394F394FBF67BF675A6B3F4F394FF94F
        BF67BF67394F3F4FFF4F394FFF4F5A6B3F4FBF67BF67BF67F967394F3F4FFF67
        BF67394F3F4F3F4F394F39335A6BBF67F94F3F4FF967BF67BF67F94F3F4FF967
        BF6739333F4FFF7F3933394F3F4F394F3F33394FBF673F4FF967BF67BF67F94F
        3F4F394FBF67F967BF67BF67DE7BFF67FF7FBF67394FFF4FBF67F94FBF67BF67
        3F4FF9673F4F394F394F3F4F394F3F4FF94F3F4FF94F394FBF673F4FBF67394F
        BF67BF673933BF6739333F4FFF67394FBF67BF67BF67FF67BF67FF675A6B3F4F
        BF67F9677932FF4FFF7F3933393339335A6BFF67F967BF67BF67394F3F4FBF67
        F967BF67BF67BF67BF67F94FBF67BF67BF67FF67FF67394FBF67BF67394FFF4F
        BF67FF4F394F3F4FBF67394F3F4F394F3F4F394F3F4FBF67BF67F94FBF67BF67
        BF67F9673F4F394FBF67F9673F4FFF4F394FBF67394FBF67394FBF67BF67F94F
        BF67BF67BF67394F39333F4F394FBF67FF673F4FBF673F4F394FFF4F3F67F94F
        3F4FBF67394FBF67394FBF67FF67394FBF67BF679C73BF67394FFF673F4F394F
        394FFF67394F394FFF7F3933394F3F4F394F3F4F394FF94FBF67BF67394FFF4F
        394FBF67BF67BF67BF67BF67394F394FFF4F394FFF4F3967FF4F5A6B3F4FBF67
        394FBF67F9673F4FFF67F967BF67F9673F4F394FF94F3F4F394FBF67394FBF67
        394FBF67BF67394FFF4FBF67394FBF67FF4F5A6BFF4FBF67F9673F4F7B6F394F
        3F4FFF67BF673933BF67DE7B3933394F3F4F394FBF67BF67BF67394FBF67FF67
        BF67394FFF673F4FF94FBF67394F3F4F394F3F4F394F3F4FF94F3F4FF94F3F67
        F94FBF673F4FBF67394FBF67BF673F4F3F4F394F3F4FFF4F394F394FFF4F3F4F
        394FFF4F394F3F4FBF67394FBF673F4FF9673F4FBF67394FBF673F4FF94FBF67
        FF675A6BBF67BF673933BF673F4F39333933394FBF67FF4FBF67394FFF4F5A6B
        BF67FF673F4FBF673F67BF673933394FBF67394F3F4F394F3F4F394F3F4F394F
        FF67BF67F94FBF67BF67BF67F94F394F394F3F4F394F394F3F4FFF4F394F394F
        FF4F394F3F4FF94F3F4FF9673F4FF9673F4F5A6BFF4FBF67394FBF67BF67BF67
        394FFF4FBF67F967BF67394F3933394FBF67BF67F967BF67394F394F3F4F394F
        FF4F394FBF67BF67F94FFF673F4F3933FF7FBF6739333F4F394F3F4F3933BF67
        FF67394F3F4F3933394FFF673F4F394F3F4F394F39333F4F3933394F394F3F4F
        394F3F4FF94F3F4F394F3F4F394F3F4F394FFF4F394F3F67394FFF4FBF67394F
        BF67BF67394F3F4FFF4FBF67BF67BF67FF4F394FBF67BF67394FBF673F4F394F
        3F4F394FBF67BF67BF675A6BFF6739333933FF7F394F394F3F4F3933394FFF67
        3F4FF9673F4F394FBF67F9673F4F3933394F3F4FBF67394F3F4F394F3F4F394F
        3F4F394F3F4F394FF94F3F4FF94F3F4FF94F3F4FF94F3F4FF94FBF67394FFF67
        BF67FF7FFF675A6B394FBF67BF67F94FBF67BF67394FBF67394FF94FFF673933
        3933394FFF67394FBF67FF4F5A6BFF67394F394F3F4F39333933394FBF67BF67
        F967BF67BF67BF67BF67BF67BF6739333F4F3933FF7FFF7FFF7FBF6739333F4F
        394F394F3F4F394F3F33394F3F4F394F3F4F3F4F394F394FBF67BF675A6BBF67
        F94F3F67BF67FF67BF67394FBF67BF67394FBF67FF4FBF67FF673F4F394F394F
        3F4FBF67BF67BF67BF67394FFF4FBF67BF67BF67394FBF677B6FFF67BF67394F
        FF67394FFF4F394F394FFF67BF67394F3933394F3933FF7FFF7FFF7F394F3933
        3F4F394F39333F4F394F3F4F394F3F4F394F394F3F4FBF67BF67394FFF4F3F4F
        BF67F94FBF67BF67BF67F94FBF67394F3F4F394F394FBF67F94FBF67BF67BF67
        F967BF67394FFF4F394FBF67BF67394F3F67F94FBF67BF67FF4F394FBF67FF67
        3F4FBF677B6FFF67FF67394FBF67DE7B3F4F39337932394FFF67FF7FFF7F394F
        39333F4F394F394F3F4F394F394F3933394FBF67BF67F94FBF67FF4F394FBF67
        394FBF67394FBF67394FBF673F4FF94FBF673933BF67FF677B6F3F4FF967FF67
        3F4F394FBF67BF67BF677B6FBF67BF67F94FBF67BF67394FFF673F4FF967BF67
        394FFF4FBF67BF67BF67394FBF67F94FBF67BF67393339337932394FFF7FFF7F
        BF673933394F3F33394F3F33394FBF67BF67394FFF4F5A6BBF67394F3F4F394F
        FF4F394FFF4F394FBF67394FBF67BF67BF67F9673F67394FFF4FBF67BF67394F
        FF67BF67F967394FFF4F3F4FF94FBF673F4F5A6BFF4F394FBF67394FBF67BF67
        394F394F3F4F394F3F4FF94FBF67FF67394FBF67BF67BF67394F393339333933
        3F4F39333933394F394F394FBF67FF67394FBF67BF67394FBF673F4F394F394F
        3F4F394F3F4FF94F3F4FF94F3F4F394FBF67BF67FF4FBF67BF67394FBF67BF67
        394F3F4FBF67394F394F394F3F4F394FBF67BF67394FBF673933394FBF67BF67
        3933FF67394F394F3F4F394FBF67BF67394FBF67394FBF67BF67BF67FF67BF67
        394FFF67BF67FF4FBF67BF67F9673F4FF94FBF67BF67BF67F94FBF673933FF7F
        394F3F4F394F3F4F394F3F4F394FFF4F5A6BBF67394F3F4FF94FBF67F9673F4F
        FF67394FFF4F3F4FFF7F3F33394F3F4FF94FBF673F67FF4FBF67BF67F94FBF67
        394FFF673F4F39333933BF67BF67F9673F4F3933FF4FFF673F67F94F3F4F394F
        BF67394FBF67BF673967FF4FBF673F4F394F3F4FFF4F394FBF67BF6739333F4F
        FF7F3933394F3F4F394F3F4F394FBF67BF67F94FBF67394F3F4FBF67BF67394F
        BF67BF67394F394FFF4F394F3933394FBF67BF67F94FBF67394F3F4FBF67BF67
        FF67394F3F4F394FBF67F94F3F4FBF67BF67F967BF67394FFF4FBF67DE7BFF67
        DE7BFF4F394FF967BF67BF67F967394FBF67394F394F3F4FF967BF67BF673933
        DE7BBF6739333F4F394F3F33394FBF67F94FBF67BF67BF67F967BF67FF4FBF67
        394FFF7F3933BF675A6B394FFF4FBF67BF67394FBF67394FBF67BF67F94F3F4F
        394FBF67BF67F967BF67BF67FF4F394FBF67FF67394FBF679C73BF67BF67BF67
        FF67FF7FFF673F4F394FBF67BF67BF67394F3F4F3933394FBF67BF67BF67BF67
        3933BF67394F394F3933794EF94FBF67BF677B6F3F4FF94F3F4F394FBF67BF67
        F94F3F4FBF67BF67BF67BF67BF675A6BF94FBF67BF67FF67FF67DE7BFF67DE7B
        BF67394FBF67BF673F4F394F394FBF67BF67394FBF67BF67BF67F94FBF67F967
        BF67BF67BF679C73FF4FBF67F94FBF67BF67F94FBF67BF67FF4F394F394FFF67
        BF67393339333933394FFF4F9C73FF4F5A6BFF4FBF679C73FF67BF67394FBF67
        FF67394FBF673F4FF94FBF67F94FBF673F4FFF4F5A6BBF67394FBF67BF67BF67
        FF67BF67394FBF67F967BF67BF67BF67F94FBF673F4FF9673F4FBF67BF67BF67
        394FBF67BF67FF67394F5A6BBF673F4F394FBF67BF67BF67394FBF67BF67394F
        FF67BF67BF67FF67BF67FF67394FBF67FF67394FBF67BF67BF67FF67F9673F4F
        394FFF67394FBF67394FBF67BF67394FBF67394FFF4F3F4FBF67F94FBF67BF67
        F94FBF673F4FF94FBF673F4FF94FBF67BF67394FBF673F4FF94FBF67394FBF67
        FF4F5A6BFF4F3F67FF4FBF67F94FBF67BF67F94FBF67394FBF67BF67FF67BF67
        394FFF67394FBF67394FBF67BF67BF67394FBF67FF4F5A6BFF4F5A6BFF67FF67
        394FBF67BF67BF673F67FF4FBF67394FFF67BF67394FBF67394F3F4FF9673F4F
        BF673967BF67BF67394FBF67394FBF67BF67394FFF4F394FBF67394FFF4FBF67
        394FBF675A6BFF4F5A6BBF67394F3F4F394FBF67BF673F4FF94F3F4FF94FBF67
        394FBF67BF67FF4F7B6F3F4FF94FFF67BF67394FBF67394FBF673F4F5A6B3F4F
        BF67394FBF673F4FF94FBF67BF67394FBF67FF67394F3F4FF94F3F4F394F3F4F
        F94F3F4FF94FBF67BF67394F3F4FFF67394FFF4F394FBF67394FBF67394F3F4F
        BF67394FFF4F3967FF4FBF67394F3933394FFF67394F394F394F3F4F3F4F394F
        BF67BF67394FBF67BF67FF4F5A6B3F4F394FFF4F394FFF4F3967FF4FBF67F967
        BF67FF4F3F4F394F3F4FF967BF67BF67394FFF67394F39333F4F394F3F4FF94F
        3F4F394FBF67FF67BF67F94FBF67BF67394F3F4F394FFF4F394FFF4F394FBF67
        394FFF4F5A6B3F4FBF67F967BF67BF67BF67FF67394FBF67BF673933394F394F
        BF67F94F3F4F394F3F4F394FBF67FF4F394F3F4F394F3F4FF94F3F4F394F3F4F
        394FBF67394F394F3F4FBF67BF67F94FBF673933FF67394F3F4F394F3F4F394F
        3F4F394FBF673F4F394FBF67BF67BF67394F394F3F4F394F3F4F394F3F4FF94F
        3F4F394FFF4F394FBF67BF67394FFF67394F3F4FFF67394F3F4F394F3933BF67
        BF67BF67394FFF4F39333967FF67394F3F4F394F3F4F394F3F4FF94F3F4FF94F
        3F4FF94F3F4F394FBF67F9673F4F5A6BFF67BF673F4FBF673933394F3F4F394F
        394FBF67F94FBF67FF67394FF94FBF6739333F4F394F3F4F394FFF4F394F3F4F
        F94F3F4F394FBF67BF67F94FBF673F67FF4F5A6BFF4FBF67F9673F4FBF67BF67
        394FBF67BF67394FBF67FF677B6F3F33394F39333F4F394F394F3F4F394F3F4F
        394F3F4F394FBF67394FBF67F94F3F4F5A6BBF67394F394FBF673933394F3F33
        394FFF67BF67394F3F4FBF67BF67394F3F4F394F394F3F4F394F3F4F394F3F4F
        394F3F4F394FBF67BF67FF67BF67F94F3F4F394FBF67F9673F4FF94FBF67FF4F
        BF67BF67F94FBF67394F3F4FBF6739335A6BFF7F394F39333F4F394F3F4F394F
        3F4F394F3F4FBF67FF4FBF67BF67FF673F4FF94FBF67BF67394F3F4F3933394F
        BF67BF67394FBF673933394FBF67394F3933394F3F33394F394F3F4F394F3F4F
        394F394FBF67FF4F394F394FBF67FF67394FBF67BF673F4F7B6FFF67394F3F67
        F9673F4FBF67F967BF67BF67F9673F4F3933BF67FF7F3F4F39333F4F3933394F
        3933394FBF67BF67394F3F4FF967BF67BF67394FFF67BF67F94FBF67394FFF67
        5A6BF94FBF67394FFF4FBF67BF673933BF67BF67394F3F4F394F39333F4F394F
        3933BF67FF4F3967FF67BF67394F394FFF67BF67F94FBF67FF4FBF67BF67F94F
        BF67BF67F9673F4F394F3F4FBF67F9673F4F3933394FBF67394F3933394F3F4F
        F967BF67BF67394F394FFF4F394F3F4FF94F3F4FBF67BF675A6BBF67BF67BF67
        BF67BF67BF67BF67BF67F9673F673933FF7FBF67393339333F4F394F394F3933
        BF67BF675A6BBF67BF67BF67FF67BF67394FBF673F4F394F3F4F394FBF67394F
        BF67394FBF67FF673F4FF94FBF67FF67FF67BF67F9673F4FF94FBF67BF67BF67
        BF67BF67BF673F4FBF67394F3F4F394F394FBF67F94F3F4FBF67F94FBF67F94F
        3F4FF94F3F4F5A6BBF67BF67BF673933FF7FFF7F39333F4F394F3F33394FBF67
        BF67F94F3F4FF94FBF67394FBF67BF67F94FBF67394FFF67394F3F4F394FFF4F
        BF67BF67BF67394FBF67394F3F4F394F3F4F394FBF67BF67BF675A6BF94F3F4F
        F94FBF67394FF9673F4FFF673933394F3F4FFF67BF67FF67394FBF67BF673F4F
        5A6BBF67BF67F94F3F4FF94FBF6739333F4FFF7F394F39333933394FBF67BF67
        F94F3F4F394F3F4F394FFF4F3F4FF9673F4FF9673F4F39673F4F3933394FFF67
        5A6B3F4FF94F3F4FF967BF67FF67FF7FFF679C73FF4F394FFF4FBF673F4F394F
        BF67FF673F4FBF67394F394F3F4F394FFF67394F394F394FFF4FBF67394FBF67
        BF67BF67FF67FF7FBF673F4F5A6BFF67394F393339333F4FF967BF67F94FBF67
        BF67394F3F4F394F3F4F394F3F4F394F3F4FBF67BF67F94F3F4FF967BF67394F
        FF4F7B6FBF67BF67FF67BF67BF67F967BF67FF67FF7FFF67394FBF67FF4F394F
        BF67394F394FBF67BF67FF67BF67F967BF673F67FF4F394FBF677B6FFF4F3967
        FF4FBF67394FBF67F967BF67F94F3F4FBF67BF67F967BF67BF67BF67BF67BF67
        BF67394FBF67FF7F3933394F3F4F3933FF4F5A6BFF4F5A6BBF67BF67394FBF67
        BF67F94FBF67BF675A6BBF67BF67BF67BF67BF67BF67FF7FFF67394FBF67F967
        FF673F4F3933394FF94F3F4F394FFF4FBF67F967BF673F4FBF67F94F3F4FF967
        BF67394FBF67BF673F4FBF67FF67394FBF67F94FBF67BF67F94F3F4F394FF94F
        3F4FFF673933FF67BF673933394F394FBF67BF67BF67BF67F94F3F4FBF67BF67
        394FBF67FF4F5A6BFF4FBF67F94FBF67BF67F967BF67BF67FF67394FBF67BF67
        BF67394F3F4FBF67FF67DE7BBF67BF67394F3F4FBF67F967FF673F4F394F3F4F
        394F3F4FF94F3F4FF9673F4F5A6BFF4F394FBF67BF67BF67394FFF67DE7BFF67
        BF67394FBF67394F394F3933394FBF67BF67BF67F94FBF67BF67F94FBF67394F
        BF67BF67394FBF67394FBF67BF67394FBF67BF67BF67394FBF67FF67394FBF67
        BF67394F3933BF67BF67FF67FF67FF67FF7FFF4F394FBF67FF67394F394F3F4F
        39333F4F3F4F394FFF4F394FFF4F5A6BFF4F5A6BFF4F394FBF67BF67BF67BF67
        BF67F9673F4FFF67BF67FF67BF67BF67394F394FFF67BF67394F3F4FBF67394F
        FF4F394FBF67FF4F3967FF4F5A6BFF4F5A6B3F4FF967BF67BF67BF67394FFF67
        F94FBF673933BF67BF67394FBF675A6BBF67F967BF673F4FF9673F4F3933BF67
        BF67394F394F3F4F394F3F4F394F3F4F394FBF67BF673F67F94FBF673F4FF967
        BF67BF67FF67394FBF67394FBF67F94FBF67BF673F4FBF67394FBF67394FFF4F
        5A6B3F4FBF67394FBF673F4FFF4F3967FF4FBF67394FBF67F94FBF673F4FBF67
        BF67BF67394F3F4FF967BF67BF67FF4FBF67BF67BF67394FBF67BF67394F3933
        FF7FBF673933394F3F4F394F3F4F3933BF675A6BFF4F394FBF67394FBF673F4F
        F9673F4FFF673F4FF967BF67BF67394F3F4FF94FBF67F94F3F4FF94F3F4F394F
        F94F3F4F3967FF4F394FBF67394FBF67394FBF673F4FBF67394FBF67F94FBF67
        394FFF67BF67BF67394FFF4F394FBF67394FBF67F967FF673F4FF967BF673933
        3933FF7FBF673933394F3F4F394F394FBF67FF4FBF67394F3F4FF94F3F4FF94F
        3F4F5A6B3F4FF9673F4FBF67BF673F4F394F394FBF67BF67394F3F4F394FBF67
        3F4F394FFF4F394FBF67394FBF67394FFF4F394FBF67F94F3F4FBF67394FBF67
        BF67BF67BF67394FBF673F4FBF67394FBF673F4FBF67394F3F4FBF67BF67BF67
        39333933FF7F3F4F393339333933BF67F967BF67BF6739333F4F394F394F3F4F
        F94F3F4FF94F3F4F394FBF67F94F7B6FBF67F94FBF67BF67394F3F4F394FFF7F
        FF673F4F394F3F4FF94F3F4FF94F3F4FBF67394F3F4F3967FF4F394FBF67BF67
        394FBF67394F3F4FFF4F394FF94FBF67394FBF67394FBF67BF67F94FBF67BF67
        F967BF673933394F3933394FBF67FF673F4F394FFF67394F3F4FFF67394F3F4F
        394F3F4F394FFF4F394FBF67BF67FF4FBF67BF67BF67BF67F94F3F4F394FFF67
        FF7F394FF94F3F4F394F3F4F394FFF4F394FBF67394FFF4F5A6B3F4FF94FBF67
        BF67F94FBF67FF7F394F3F4F3F4F394FFF4F394FFF4F394F3F4FBF67394FBF67
        BF67BF67BF67BF67BF67BF67BF67394FFF67BF67BF67394F394FFF7F3F4F394F
        3F4F394F3F4F394F394FFF4F5A6BBF67394FFF4F3967BF67BF67394F3933BF67
        FF7F394F3F4F394FFF4F3F4F394F3F4F394F3F4FF94F3F4F394FFF4F394FBF67
        BF67394FFF67FF673F4F394F394FFF4F394F3F4F394FFF4F394FBF67BF67F967
        3F4FF94F3F4FF94FBF67BF67F94F3F4F394F3F67F94FBF673933394FFF7F3933
        394F3F4F394F3F4F394FBF67BF67F94FBF67DE7B3F4FF94FBF673F4F394F3F4F
        FF7F3F4F394F3F4F394F394F3F4F394FFF4F394F3F4FF94F3F4F394FBF679C73
        FF4F394F3F4F394FFF7F39333F4F3F4F394FFF4F394F3F4F394FFF4FF9673F4F
        BF679C73FF67394FBF67BF67BF67394F3F4F3933BF67BF67BF673933BF67FF67
        39333F4F394F3933BF67BF67BF67394F3F4FFF4F3F67BF67BF67394F3933394F
        FF7FBF673933394F3F4FF94F394F3F4F394F394F3F4F394F3F4F394F3F4FFF67
        394F3F4F394F394FFF673F4F394F394F394F3F4F394F394F394FBF67BF673F4F
        F94FBF67BF67BF67394FBF67F94FBF67394FBF67BF67394FBF67BF673933394F
        393339333933394FFF675A6BFF4F394FBF673933394FF94FBF67BF67394F3F33
        FF7FBF6739333F4F394F3F4F394F3F4F394FFF4F394F3F4F394F3F4FF94FBF67
        394FFF4FFF7F394F3F4FFF7F39333F4F394F3F4F394F3F4F3F4FFF67394F3F4F
        394F3F4FF94F3F4FBF67F967BF67BF67BF67F9673F4FFF67F94FBF67BF67BF67
        394F3F4FBF67FF67BF67BF67BF67BF67394F394FBF67FF67BF67F94F394F3933
        BF67FF67394F394F3F33394F3F4F3933394F3F4F3933394FFF4F394FBF67BF67
        BF67394F3F4FBF673933FF673F6739333933394F3F33394F394FBF67394FBF67
        394F3F4F394F394FBF67BF673F4FF94FBF67FF4F394F3F4F394FFF67394FBF67
        BF67F967BF67394F394F394FFF4F394FBF67FF67BF67394FBF67BF673F673933
        394FFF7F3F33394F3F4F394F394F3F4F394F3F4F394F3F4F394F394FF94FBF67
        BF67F967BF67BF67BF673933FF7F39333F4F394F3F4F3933BF67F967FF4F394F
        FF67393339333F4FF9673F4FF9673F4F5A6BBF675A6B394FBF67BF67BF67BF67
        F94F3F4FBF67BF67FF67DE7BFF67BF67394F3F4FFF67BF67F94FBF67BF673933
        3933FF7F394F3933394F3F33394F39333F4F394F394F3F33394F3F4FFF67BF67
        394F3F4FFF4FF967FF67394F394FFF67394F39333933394FBF67BF673F4FBF67
        394F3F4F394FFF67BF67BF67BF67FF673F4FF94FBF67BF67FF4F394FF967BF67
        394FBF67F94FBF67BF67BF67BF67FF7FFF67FF67394FBF67BF67394FBF67F94F
        7932BF67BF673F33394F3F4F394F3F4F394F3F33394F394F3F4F394FBF675A6B
        FF4FBF67394F3F4FBF67FF67BF67394FBF673933394FBF67BF67394FBF67F94F
        BF67F967BF67BF67394F394F3F4FF9673F4FBF67BF67F94FBF673F4FBF67BF67
        3F4F3F4F5A6BFF4F394FBF673967FF4F5A6BBF67BF67394FFF67BF67BF67BF67
        394F3933FF7F394F39333933394F3933394F394F3F4F3933394F394FFF67BF67
        394FBF67BF67}
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 5080
      PrinterPage.Header = 2540
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      StyleCaption = 'Art'
      Left = 630
      Top = 498
      BuiltInStyle = True
    end
  end
  object bpmSpreadSheet: TdxBarPopupMenu
    BarManager = dxBarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'biCellMerge'
      end
      item
        Visible = True
        ItemName = 'biCellUnMerge'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'biCut'
      end
      item
        Visible = True
        ItemName = 'biCopy'
      end
      item
        Visible = True
        ItemName = 'biPast'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'biDeleteCells'
      end
      item
        Visible = True
        ItemName = 'biInsertCells'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'biCellShow'
      end
      item
        Visible = True
        ItemName = 'biCellHide'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'biCellProperties'
      end>
    UseOwnFont = False
    Left = 273
    Top = 225
  end
  object dxPageSetupDialog1: TdxPageSetupDialog
    Left = 324
    Top = 287
  end
  object dxSkinController1: TdxSkinController
    Left = 352
    Top = 224
  end
  object alMain: TActionList
    Left = 416
    Top = 288
    object actDownloads: TAction
      Category = 'Help'
      Caption = 'Developer Express &Downloads'
      Hint = 
        'Launches the web-page with the list of available downloads of De' +
        'veloper Express products'
      OnExecute = actDownloadsExecute
    end
    object actSupport: TAction
      Category = 'Help'
      Caption = 'Develooer Express Support &Center'
      Hint = 'Launches the web-page with the Developer Express Support Center'
      OnExecute = actSupportExecute
    end
    object actDXOnTheWeb: TAction
      Category = 'Help'
      Caption = 'Developer Express on the &Web'
      Hint = 'Launches the official web-site of Developer Express'
      OnExecute = actDXOnTheWebExecute
    end
    object actProducts: TAction
      Category = 'Help'
      Caption = 'Developer Express &Products'
      Hint = 
        'Launches the web-page with the list of Developer Express product' +
        's'
      OnExecute = actProductsExecute
    end
    object actFeatures: TAction
      Category = 'Help'
      Caption = 'ExpressVerticalGrid Features'
      OnExecute = actFeaturesExecute
    end
  end
end
