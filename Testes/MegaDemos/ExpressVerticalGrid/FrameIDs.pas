unit FrameIDs;

interface

const

  Grid4SideBarGroupIndex = 0;
  Grid3SideBarGroupIndex = 0;
  TreeListSideBarGroupIndex = 1;
  VerticalGridSideBarGroupIndex = 2;
  EditorsSideBarGroupIndex = 3;
  ExpressControlsGroupIndex = 4;
  StandardControlsGroupIndex = 5;

  GridMasterDetailFrameID = 1;
  GridOffice11FrameID = GridMasterDetailFrameID + 1;
  GridCellSelectionFrameID = GridOffice11FrameID + 1;
  GridCellMergingFrameID = GridCellSelectionFrameID + 1;
  GridUnboundFrameID = GridCellMergingFrameID + 1;
  GridUnboundColumnsViewFrameID = GridUnboundFrameID + 1;
  GridFolderFileFrameID = GridUnboundColumnsViewFrameID + 1;
  GridStyleFrameID = GridFolderFileFrameID + 1;
  GridCardViewFrameID = GridStyleFrameID + 1;
  GridViewsFrameID = GridCardViewFrameID + 1;
  GridBandedViewFrameID = GridViewsFrameID + 1;
  GridNestedBandsFrameID = GridBandedViewFrameID + 1;
  GridFixedBandsFrameID = GridNestedBandsFrameID + 1;
  GridChartViewFrameID = GridFixedBandsFrameID + 1;
  GridAutoHeightFrameID = GridChartViewFrameID + 1;
  GridFilteringFrameID = GridAutoHeightFrameID + 1;
  GridAdvancedFilteringFrameID = GridFilteringFrameID + 1;
  GridSummaryFrameID = GridAdvancedFilteringFrameID + 1;
  GridPreviewFrameID = GridSummaryFrameID + 1;
  GridIncSearchFrameID = GridPreviewFrameID + 1;
  GridNewItemRowFrameID = GridIncSearchFrameID + 1;
  GridMultiEditorsFrameID = GridNewItemRowFrameID + 1;
  GridDragDropFrameID = GridMultiEditorsFrameID + 1;
  GridInplaceEditorsFrameID = GridDragDropFrameID + 1;
  GridInplaceEditorsVAalidationFrameID = GridInplaceEditorsFrameID + 1;
  GridBuildInNavigatorFrameID = GridInplaceEditorsVAalidationFrameID + 1;
  GridBackgroundMasterDetailFrameID = GridBuildInNavigatorFrameID + 1;

  TreeListFileTaskManagerFrameID = 50;
  TreeListFileTaskManagerCategorizedFrameID = 51;
  TreeListFileExplorerFrameID = 52;
  TreeListStyleFrameID = 53;
  TreeListIncSearchFrameID = 54;
  TreeListDragDropFrameID = 55;
  TreeListProviderFrameID = 56;
  TreeListIniFrameID = 57;
  TreeListInplaceEditorsFrameID = 58;
  TreeListBandsFrameID = 59;
  TreeListBackgroundFrameID = 60;
  TreeListIEOptionsFrameID = 61;
  TreeListCustomDrawFrameID = 62;

  VerticalGridMultiRecordFrameID = 101;
  VerticalGridStylesFrameID = 102;
  VerticalGridIncSearchFrameID = 103;
  VerticalGridFilterControlFrameID = 104;
  VerticalGridNavigatorFrameID = 105;
  VerticalGridInplaceEditorsFrameID = 106;
  VerticalGridInplaceEditorsValidationFrameID = 107;
  VerticalGridCustomDrawFrameID = 108;
  VerticalGridInspectorFrameID = 109;
  VerticalGridBackgroundFrameID = 110;

  EditorsNativeFrameID = 200;
  EditorsShadowedFrameID = 201;
  EditorsWebFrameID = 202;
  EditorsFlatFrameID = 203;
  EditorsUltraFlatFrameID = 204;
  EditorsPropertiesFrameID = 205;
  ExtEditorsPropertiesFrameID = 206;


  ExpressControlsLayoutControlIndex = 1001;
  ExpressControlsSpreadSheetIndex = 1002;
  ExpressControlsFlowChartIndex = 1003;
  ExpressControlsOrgChartIndex = 1004;
  ExpressControlsMasterViewIndex = 1005;
  ExpressControlsDBTreeViewIndex = 1006;
  ExpressControlsSchedulerIndex = 1007;
  ExpressControlsPivotGridIndex = 1008;

  StandardControlRichEditIndex = 2001;
  StandardControlStringGridIndex = 2002;
  StandardControlDrawGridIndex = 2003;
  StandardControlSimpleListBoxIndex = 2004;
  StandardControlCheckListBoxIndex = 2005;
  StandardControlTeeChartIndex = 2006;
  StandardControlTreeViewIndex = 2007;
  StandardControlListViewIndex = 2008;

  DemoInfoPS3Index = 3001;

  //Images
  GridMasterDetailImageIndex = 14;
  GridUnboundImageIndex = 11;
  GridSummaryImageIndex = 9;
  GridFilteringImageIndex = 2;
  GridAdvancedFilteringImageIndex = 27;
  GridPreviewImageIndex = 1;
  GridAutoHeightImageIndex = 6;
  GridBandedViewImageIndex = 29;
  GridFixedBandsImageIndex = 13;
  GridIncSearchImageIndex = 4;
  GridStyleImageIndex = 8;
  GridOutLookExpressReaderImageIndex = 15;
  GridNewItemRowImageIndex = 18;
  GridCardViewImageIndex = 16;
  GridViewsImageIndex = 17;
  GridMultiEditorsImageIndex = 19;
  GridWinMinerImageIndex = 24;
  GridFileFolderImageIndex = 25;
  GridDragDropImageIndex = 26;
  GridInplaceEditorsImageIndex = 28;
  GridBackgroundMasterDetailImageIndex = 31;
  GridBuildInNavigatorImageIndex = 30;
  GridCellSelectionImageIndex = 65;
  GridCellMergingImageIndex = 66;
  GridUnboundColumnsViewImageIndex = 63;
  GridNestedBandsImageIndex = 64;
  GridOffice11ImageIndex = 62;
  GridChartViewImageIndex = 70;

  TreeListFileExplorerImageIndex = 43;
  TreeListTaskManagerImageIndex = 41;
  TreeListStyleImageIndex = 33;
  TreeListFixedBandsImageIndex = 13;
  TreeListDragDropImageIndex = 34;
  TreeListProviderImageIndex = 40;
  TreeListIniFileImageIndex = 38;
  TreeListBackgroundImageIndex = 35;
  TreeListInplaceEditorsImageIndex = 39;
  TreeListBandsImageIndex = 37;
  TreeListIEOptionsImageIndex = 44;
  TreeListCustomDrawImageIndex = 45;


  VerticalGridMultiRecordImageIndex = 47;
  VerticalGridStylesImageIndex = 8;
  VerticalGridIncSearchImageIndex = 4;
  VerticalGridFilterControlImageIndex = 27;
  VerticalGridNavigatorImageIndex = 30;
  VerticalGridInplaceEditorsImageIndex = 28;
  VerticalGridInplaceEditorsValidationImageIndex = 73;
  VerticalGridCustomDrawImageIndex = 45;
  VerticalGridRTTIImageIndex = 46;
  VerticalGridBackgroundImageIndex = 35;


  EditorsPropertiesImageIndex = 12;
  ExtEditorsPropertiesImageIndex = 32;
  EditorsShadowedImageIndex = 7;
  EditorsWebImageIndex = 0;
  EditorsFlatImageIndex = 3;
  EditorsUltraFlatImageIndex = 10;
  EditorsNativeImageIndex = 5;

  ExpressControlsMasterViewImageIndex = 56;
  ExpressControlsFlowChartImageIndex = 60;
  ExpressControlsOrgChartImageIndex = 57;
  ExpressControlsLayoutControlImageIndex = 55;
  ExpressControlsSpreadSheetImageIndex = 58;
  ExpressControlsDBTreeViewImageIndex = 59;
  ExpressControlsSchedulerImageIndex = 71;
  ExpressControlsPivotGridImageIndex = 72;


  StandardControlsRichEditImageIndex = 52;
  StandardControlsStringGridImageIndex = 53;
  StandardControlsDrawGridImageIndex = 50;
  StandardControlsSimpleListBoxImageIndex = 51;
  StandardControlsCheckListBoxImageIndex = 49;
  StandardControlsTeeChartImageIndex = 54;
  StandardControlsTreeViewImageIndex = 48;
  StandardControlsListViewImageIndex = 61;

  StartFrameID = VerticalGridMultiRecordFrameID;


resourcestring
  GridMasterDetailFrameName = 'Master/Detail (updated)';
  GridUnboundModeFrameName = 'Unbound Mode';
  GridPoviderModeFrameName = 'Provider Mode';
  GridStylesFrameName = 'Grid Styles';
  GridCardViewFrameName = 'Card View (updated)';
  GridViewsFrameName = 'View Architecture';
  GridDataSummariesFrameName = 'Data Summaries (updated)';
  GridDataFilteringFrameName = 'Data Filtering (updated)';
  GridDataAdvancedFilteringFrameName = 'Advanced Data Filtering';
  GridAutoPreviewFrameName = 'Auto Preview';
  GridRowHeightFrameName = 'Row Height (updated)';
  GridFixedBandsFrameName = 'Fixed Bands';
  GridNestedBandsFrameName = 'Nested Bands (new)';
  GridUnboundColumnsFrameName = 'Unbound Columns (new)';
  GridBandedViewFrameName = 'Banded View';
  GridIncrementalSearchFrameName = 'Incremental Search';
  GridOffice11FrameName = 'Outlook 2003 Style (new)';
  GridNewItemRowFrameName = 'New Item Row';
  GridMultiEditorsFrameName = 'Multiple Editors per Row (updated)';
  GridInplaceEditorsFrameName = 'Inplace Editors (updated)';
  GridDragDropFrameName = 'Drag && Drop Rows';
  GridBuildInNavigatorFrameName = 'Data Navigation';
  GridWinMinerFrameName = 'Custom Draw';
  GridBackgroundMasterDetailFrameName = 'Background Image';
  GridCellSelectonFrameName = 'Cell Selection (new)';
  GridCellMergingFrameName = 'Cell Merging (new)';
  GridChartViewFrameName = 'Chart View (new)';

  TreeListFileExplorerName = 'File Explorer';
  TreeListTaskManagerName = 'Task Manager (Standard View)';
  TreeListTaskManagerCategorizedName = 'Task Manager (Categorized View)';
  TreeListStylesFrameName = 'TreeList Styles';
  TreeListIncrementalSearchFrameName = 'Incremental Search';
  TreeListDragDropFrameName = 'Drag && Drop';
  TreeListProviderFrameName = 'Provider Mode (100,000,000 records)';
  TreeListIniEditorName = 'Ini Editor';
  TreeListBackGroundName = 'Background Image';
  TreeListInplaceEditorsFrameName = 'Inplace Editors';
  TreeListBandsFrameName = 'Bands';
  TreeListIEOptionsName = 'IE Options';
  TreeListCustomDrawFrameName = 'Custom Draw';

  VerticalGridMultiRecordName = 'Multi Records';
  VerticalGridStylesName = 'VerticalGrid Styles';
  VerticalGridIncSearchName = 'Incremental Search';
  VerticalGridFilterControlName = 'Filter Control Support';
  VerticalGridNavigatorName = 'Navigator Control Support';
  VerticalGridInplaceEditorsName = 'Inplace Editors';
  VerticalGridInplaceEditorsValidationName = 'Inplace Editors Validation';
  VerticalGridCustomDrawName = 'Custom Draw';
  VerticalGridRTTIName = 'Object Inspector';
  VerticalGridBackgroundName = 'Background Image';

  EditorNativeFrameName = 'Native Look && Feel';
  EditorShadowedFrameName = 'Shadowed Look && Feel';
  EditorWebFrameName = 'Web Look && Feel';
  EditorFlatFrameName = 'Flat Look && Feel';
  EditorUltraFlatFrameName = 'UltraFlat Look && Feel';
  EditorPropertiesFrameName = 'Properties';
  ExtEditorPropertiesFrameName = 'Extended Editors Properties';

  ExpressControlsMasterViewName = 'ExpressMasterView';
  ExpressControlsFlowChartName = 'ExpressFlowChart';
  ExpressControlsOrgChartName = 'ExpressOrgChart';
  ExpressControlsLayoutControlName = 'ExpressLayoutControl';
  ExpressControlsSpreadSheetName = 'ExpressSpreadSheet';
  ExpressControlsDBTreeViewName = 'ExpressDBTreeView';
  ExpressControlsSchedulerName = 'ExpressScheduler';
  ExpressControlsPivotGridName = 'ExpressPivotGrid';

  StandardControlsRichEditName = 'Rich Edit';
  StandardControlsStringGridName = 'String Grid';
  StandardControlsDrawGridName = 'Draw Grid';
  StandardControlsSimpleListBoxName = 'ListBox';
  StandardControlsCheckListBoxName = 'Check ListBox';
  StandardControlsTeeChartName = 'TeeChart';
  StandardControlsTreeViewName = 'TreeView';
  StandardControlsListViewName = 'ListView';

  DemoInfoPS3Name = 'About ExpressPrintingSystem v3';

implementation

end.
