inherited dxSkinsDemoMainForm: TdxSkinsDemoMainForm
  Left = 0
  Top = 0
  Caption = 'dxSkinsDemoMainForm'
  ClientHeight = 534
  ClientWidth = 798
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxRibbonStatusBar1: TdxRibbonStatusBar
    Top = 511
    Width = 798
  end
  inherited dxRibbon: TdxRibbon
    Width = 798
    OnHelpButtonClick = dxRibbonHelpButtonClick
    inherited dxRibbonTab1: TdxRibbonTab
      Index = 0
    end
    inherited dxRibbonTab2: TdxRibbonTab
      Index = 1
    end
  end
  inherited MainContainer: TPanel
    Width = 798
    Height = 351
    inherited bvlLeftSpacer: TBevel
      Height = 335
    end
    inherited bvlTopSpacer: TBevel
      Width = 798
    end
    inherited bvlBottomSpacer: TBevel
      Top = 343
      Width = 798
    end
    inherited bvlRightSpacer: TBevel
      Left = 790
      Height = 335
    end
    inherited pcGrids: TcxPageControl
      Width = 782
      Height = 335
      ClientRectBottom = 331
      ClientRectLeft = 103
      ClientRectRight = 778
      inherited tsGrid: TcxTabSheet
        inherited Grid: TcxGrid
          Width = 667
          Height = 319
          inherited GridDBLayoutView1: TcxGridDBLayoutView
            inherited GridDBLayoutView1Group_Root: TdxLayoutGroup
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem1: TcxGridLayoutItem
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem2: TcxGridLayoutItem
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem3: TcxGridLayoutItem
              Index = 0
            end
            inherited GridDBLayoutView1LayoutItem4: TcxGridLayoutItem
              Index = 1
            end
            inherited GridDBLayoutView1LayoutItem5: TcxGridLayoutItem
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem6: TcxGridLayoutItem
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem7: TcxGridLayoutItem
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem8: TcxGridLayoutItem
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem9: TcxGridLayoutItem
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem10: TcxGridLayoutItem
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem11: TcxGridLayoutItem
              Index = -1
            end
            inherited GridDBLayoutView1LayoutItem12: TcxGridLayoutItem
              Index = 2
            end
            inherited GridDBLayoutView1LayoutItem13: TcxGridLayoutItem
              Index = 1
            end
            inherited GridDBLayoutView1LayoutItem14: TcxGridLayoutItem
              Index = 2
            end
            inherited GridDBLayoutView1LayoutItem15: TcxGridLayoutItem
              Index = 1
            end
            inherited GridDBLayoutView1LayoutItem16: TcxGridLayoutItem
              Index = 0
            end
            inherited GridDBLayoutView1Group1: TdxLayoutGroup
              Index = 0
            end
            inherited GridDBLayoutView1Group2: TdxLayoutGroup
              Index = 1
            end
            inherited GridDBLayoutView1Group4: TdxLayoutGroup
              Index = 0
            end
          end
        end
      end
      inherited tsPivotGrid: TcxTabSheet
        inherited PreviewPivotGrid: TcxPivotGrid
          Width = 667
          Height = 319
          Groups = <
            item
              IsCaptionAssigned = False
              UniqueName = ''
            end>
          inherited pgfPurchaseQuarter: TcxPivotGridField
            GroupIndex = -1
            UniqueName = 'Purchase Quarter'
          end
          inherited pgfPurchaseMonth: TcxPivotGridField
            GroupIndex = -1
            UniqueName = 'Purchase Month'
          end
          inherited pgfPaymentType: TcxPivotGridField
            UniqueName = 'Payment Type'
          end
          inherited pgfQuantity: TcxPivotGridField
            UniqueName = 'Quantity'
          end
          inherited pgfCarName: TcxPivotGridField
            UniqueName = 'Car Name'
          end
          inherited pgfUnitPrice: TcxPivotGridField
            UniqueName = 'Unit Price'
          end
          inherited pgfCompanyName: TcxPivotGridField
            UniqueName = 'Company Name'
          end
          inherited pgfPaymentAmount: TcxPivotGridField
            UniqueName = 'Payment Amount'
          end
        end
      end
      inherited tsScheduler: TcxTabSheet
        inherited Scheduler: TcxScheduler
          Width = 667
          Height = 319
          Splitters = {
            0B0200007E0000009A0200008300000006020000010000000B0200003E010000}
          StoredClientBounds = {01000000010000009A0200003E010000}
          inherited ControlBox: TPanel
            Height = 187
          end
        end
      end
      inherited tsTreeList: TcxTabSheet
        inherited cxTreeList1: TcxTreeList
          Width = 667
          Height = 319
          Data = {
            00000500720200000F00000044617461436F6E74726F6C6C6572310400000012
            000000546378537472696E6756616C7565547970651200000054637853747269
            6E6756616C75655479706512000000546378537472696E6756616C7565547970
            6512000000546378537472696E6756616C75655479706505000000445855464D
            540000040000004900740065006D00010008000000560061006C007500650020
            0023003100000A000000530075006200560061006C0075006500200031004458
            55464D540000070000005300750062004900740065006D000100080000005600
            61006C0075006500200023003200000A000000530075006200560061006C0075
            00650020003200445855464D540000070000005300750062004900740065006D
            00010008000000560061006C0075006500200023003300000A00000053007500
            6200560061006C007500650020003300445855464D5400000600000049007400
            65006D0020003200010008000000560061006C0075006500200023003400000A
            000000530075006200560061006C007500650020003400445855464D54000006
            0000004900740065006D0020003300010008000000560061006C007500650020
            0023003500000A000000530075006200560061006C0075006500200035000300
            0000000000000200010000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            010000000200010000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0200
            000008000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0300000008000000
            000000000000FFFFFFFFFFFFFFFFFFFFFFFF0400000008000000000000000000
            FFFFFFFFFFFFFFFFFFFFFFFF1A0003000000}
          inherited cxTreeList1cxTreeListColumn1: TcxTreeListColumn
            Summary.FooterSummaryItems = <
              item
                AlignHorz = taLeftJustify
                AlignVert = vaTop
                CalculatedColumn = cxTreeList1cxTreeListColumn1
                Kind = skCount
              end>
          end
          inherited cxTreeList1cxTreeListColumn3: TcxTreeListColumn
            Summary.FooterSummaryItems = <
              item
                AlignHorz = taLeftJustify
                AlignVert = vaTop
                CalculatedColumn = cxTreeList1cxTreeListColumn3
                Kind = skCount
              end>
          end
        end
      end
      inherited tsVerticalGrid: TcxTabSheet
        inherited cxVerticalGrid: TcxVerticalGrid
          Width = 667
          Height = 319
          Version = 1
          inherited cxVerticalGridEditorRow1: TcxEditorRow
            ID = 0
            ParentID = -1
            Index = 0
            Version = 1
          end
          inherited cxVerticalGridCategoryRow1: TcxCategoryRow
            ID = 1
            ParentID = -1
            Index = 1
            Version = 1
          end
          inherited cxVerticalGridEditorRow2: TcxEditorRow
            ID = 2
            ParentID = 1
            Index = 0
            Version = 1
          end
          inherited cxVerticalGridEditorRow5: TcxEditorRow
            ID = 3
            ParentID = 2
            Index = 0
            Version = 1
          end
          inherited cxVerticalGridEditorRow3: TcxEditorRow
            ID = 4
            ParentID = 2
            Index = 1
            Version = 1
          end
          inherited cxVerticalGridCategoryRow2: TcxCategoryRow
            ID = 5
            ParentID = 1
            Index = 1
            Version = 1
          end
          inherited cxVerticalGridEditorRow9: TcxEditorRow
            ID = 6
            ParentID = 5
            Index = 0
            Version = 1
          end
          inherited cxVerticalGridEditorRow7: TcxEditorRow
            ID = 7
            ParentID = 5
            Index = 1
            Version = 1
          end
          inherited cxVerticalGridEditorRow6: TcxEditorRow
            ID = 8
            ParentID = 5
            Index = 2
            Version = 1
          end
          inherited cxVerticalGridEditorRow4: TcxEditorRow
            ID = 9
            ParentID = 5
            Index = 3
            Version = 1
          end
          inherited cxVerticalGridEditorRow8: TcxEditorRow
            ID = 10
            ParentID = 1
            Index = 2
            Version = 1
          end
          inherited cxVerticalGridEditorRow10: TcxEditorRow
            ID = 11
            ParentID = -1
            Index = 2
            Version = 1
          end
          inherited cxVerticalGridEditorRow11: TcxEditorRow
            ID = 12
            ParentID = -1
            Index = 3
            Version = 1
          end
        end
      end
      inherited tsLayoutControl: TcxTabSheet
        inherited lcMain: TdxLayoutControl
          Width = 675
          Height = 327
          inherited cxDBTextEdit12: TcxDBTextEdit
            Left = 328
          end
          inherited cxDBTextEdit11: TcxDBTextEdit
            Left = 328
          end
          inherited cxDBHyperLinkEdit2: TcxDBHyperLinkEdit
            Left = 328
          end
          inherited cxDBSpinEdit1: TcxDBSpinEdit
            Left = 119
          end
          inherited cxDBSpinEdit2: TcxDBSpinEdit
            Left = 486
          end
          inherited cxDBSpinEdit3: TcxDBSpinEdit
            Left = 310
          end
          inherited cxDBSpinEdit6: TcxDBSpinEdit
            Left = 119
            Width = 525
          end
          inherited cxDBCheckBox2: TcxDBCheckBox
            Width = 596
          end
          inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
            Left = 328
          end
          inherited lcMainGroup_Root1: TdxLayoutGroup
            Index = -1
          end
          inherited lcMainGroup1: TdxLayoutGroup
            Index = 0
          end
          inherited lcMainGroup8: TdxLayoutGroup
            Index = 0
          end
          inherited lcMainItem32: TdxLayoutItem
            Index = 0
          end
          inherited lcMainSplitterItem1: TdxLayoutSplitterItem
            Index = 1
          end
          inherited lcMainGroup4: TdxLayoutGroup
            Index = 2
          end
          inherited lcMainItem21: TdxLayoutItem
            Index = 0
          end
          inherited lcMainItem22: TdxLayoutItem
            Index = 1
          end
          inherited lcMainSeparatorItem1: TdxLayoutSeparatorItem
            Index = 2
          end
          inherited lcMainItem23: TdxLayoutItem
            Index = 3
          end
          inherited lcMainItem1: TdxLayoutItem
            Index = 4
          end
          inherited lcMainGroup3: TdxLayoutGroup
            Index = 1
          end
          inherited lcMainGroup5: TdxLayoutGroup
            Index = 0
          end
          inherited lcMainGroup14: TdxLayoutGroup
            Index = 0
          end
          inherited lcMainGroup7: TdxLayoutGroup
            Index = 0
          end
          inherited lcMainItem25: TdxLayoutItem
            Index = 0
          end
          inherited lcMainItem27: TdxLayoutItem
            Index = 1
          end
          inherited lcMainItem26: TdxLayoutItem
            Index = 2
          end
          inherited lcMainItem30: TdxLayoutItem
            Index = 1
          end
          inherited lcMainItem31: TdxLayoutItem
            Index = 1
          end
          inherited lcMainGroup2: TdxLayoutGroup
            Index = 1
          end
          inherited lcMainItem28: TdxLayoutItem
            Index = 0
          end
          inherited lcMainItem29: TdxLayoutItem
            Index = 1
          end
          inherited lcMainGroup6: TdxLayoutGroup
            Index = 2
          end
          inherited lcMainItem33: TdxLayoutItem
            Index = 0
          end
          inherited lcMainItem34: TdxLayoutItem
            Index = 1
          end
        end
      end
      inherited tsEditors: TcxTabSheet
        inherited cxLabel1: TcxLabel
          AnchorX = 687
          AnchorY = 352
        end
        inherited cxDBNavigator2: TcxDBNavigator
          Width = 355
        end
      end
      inherited tsDocking: TcxTabSheet
        inherited dxDockSite: TdxDockSite
          Width = 667
          Height = 319
          DockingType = 5
          OriginalWidth = 667
          OriginalHeight = 319
          inherited dxLayoutDockSite4: TdxLayoutDockSite
            Width = 466
            Height = 319
            DockingType = 0
            OriginalWidth = 300
            OriginalHeight = 200
            inherited dxLayoutDockSite1: TdxLayoutDockSite
              Width = 466
              Height = 319
              DockingType = 0
              OriginalWidth = 300
              OriginalHeight = 200
              inherited dxLayoutDockSite3: TdxLayoutDockSite
                Width = 466
                Height = 319
                DockingType = 0
                OriginalWidth = 300
                OriginalHeight = 200
              end
              inherited dxDockMainPanel: TdxDockPanel
                Width = 466
                Height = 319
                DockingType = 0
                OriginalWidth = 636
                OriginalHeight = 459
              end
            end
            inherited dxDockPanelLeft: TdxDockPanel
              Height = 0
              AutoHidePosition = 2
              DockingType = 3
              OriginalWidth = 173
              OriginalHeight = 140
              inherited dxNavPane: TdxNavBar
                inherited dxNavBarGroup4: TdxNavBarGroup
                  Links = <
                    item
                      Item = dxNavBarItem10
                    end
                    item
                      Item = dxNavBarItem11
                    end
                    item
                      Item = dxNavBarItem12
                    end>
                end
                inherited dxNavBarGroup5: TdxNavBarGroup
                  Links = <
                    item
                      Item = dxNavBarItem16
                    end
                    item
                      Item = dxNavBarItem17
                    end
                    item
                      Item = dxNavBarItem18
                    end>
                end
                inherited dxNavBarGroup6: TdxNavBarGroup
                  Links = <
                    item
                      Item = dxNavBarItem14
                    end
                    item
                      Item = dxNavBarItem13
                    end
                    item
                      Item = dxNavBarItem15
                    end>
                end
              end
            end
          end
          inherited dxDockPanelRight: TdxDockPanel
            Height = 319
            DockingType = 1
            OriginalWidth = 173
            OriginalHeight = 249
            inherited dxNavBar: TdxNavBar
              Height = 291
              inherited dxNavBarGroup1: TdxNavBarGroup
                Links = <
                  item
                    Item = dxNavBarItem1
                  end
                  item
                    Item = dxNavBarItem2
                  end
                  item
                    Item = dxNavBarItem3
                  end>
              end
              inherited dxNavBarGroup3: TdxNavBarGroup
                Links = <
                  item
                    Item = dxNavBarItem7
                  end
                  item
                    Item = dxNavBarItem8
                  end
                  item
                    Item = dxNavBarItem9
                  end>
              end
              inherited dxNavBarGroup2: TdxNavBarGroup
                Links = <
                  item
                    Item = dxNavBarItem5
                  end
                  item
                    Item = dxNavBarItem4
                  end
                  item
                    Item = dxNavBarItem6
                  end>
              end
            end
          end
        end
      end
      inherited tsTileControl: TcxTabSheet
        inherited dxTile: TdxTileControl
          Width = 675
          Height = 327
        end
      end
    end
  end
  inherited dxBarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited tbStandard: TdxBar
      FloatClientWidth = 51
      FloatClientHeight = 130
    end
    inherited tbMain: TdxBar
      Row = 1
    end
    inherited tbFormat: TdxBar
      FloatClientWidth = 178
    end
    inherited tbStyleOptions: TdxBar
      DockedDockControl = nil
      DockedDockingStyle = dsNone
      FloatClientWidth = 116
      FloatClientHeight = 304
      ItemLinks = <
        item
          Visible = True
          ItemName = 'blBarsStyle'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'AppBtnCheck'
        end
        item
          Visible = True
          ItemName = 'btnAeroGlass'
        end
        item
          Visible = True
          ItemName = 'btnOffice2010'
        end
        item
          Visible = True
          ItemName = 'btnBackstageView'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxbLookAndFeel'
        end>
    end
    inherited QATBar: TdxBar
      DockedDockControl = nil
      DockedDockingStyle = dsNone
      DockedLeft = 403
      FloatClientWidth = 72
      FloatClientHeight = 83
    end
    inherited dxbStyle: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnSmallRibbonStyle'
        end
        item
          Visible = True
          ItemName = 'dxbLookAndFeel'
        end>
    end
    inherited dxbtnAbout: TdxBarButton
      OnClick = dxbtnAboutClick
    end
    inherited AppBtnCheck: TdxBarLargeButton
      ImageIndex = 23
    end
    inherited blBarsStyle: TdxBarLargeButton
      ImageIndex = 19
    end
    inherited btnOffice2010: TdxBarLargeButton
      ImageIndex = 22
    end
    inherited btnBackstageView: TdxBarLargeButton
      ImageIndex = 21
    end
    object dxbLookAndFeel: TdxBarSubItem
      Caption = 'Look And Feel'
      Category = 0
      Visible = ivAlways
      ImageIndex = 30
      LargeImageIndex = 12
      ItemLinks = <>
    end
  end
  inherited cxImageList1: TcxImageList
    FormatVersion = 1
  end
  inherited dxDockingManager: TdxDockingManager
    PixelsPerInch = 96
  end
  inherited AppMenuImages: TcxImageList
    FormatVersion = 1
  end
  inherited cxImageList2: TcxImageList
    FormatVersion = 1
  end
  inherited cxImageList3: TcxImageList
    FormatVersion = 1
  end
  inherited imgResources: TcxImageList
    FormatVersion = 1
  end
  inherited ilAlertWindow: TcxImageList
    FormatVersion = 1
  end
end
