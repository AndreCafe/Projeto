unit FrameIDs;

interface

const
  NewUpdatedGroupIndex          = 0;
  HighlightedFeaturesGroupIndex = 1;
  LayoutFeaturesGroupIndex      = 2;
  DataBindingGroupIndex         = 3;
  TableBandedTableGroupIndex    = 4;
  MasterDetailGroupIndex        = 5;
  SortingGroupingGroupIndex     = 6;
  SummariesGroupIndex           = 7;
  EditingGroupIndex             = 8;
  PreviewAndViewGroupIndex      = 9;
  FilteringGroupIndex           = 10;
  AppearanceGroupIndex          = 11;
  EntertainmentGroupIndex       = 12;

  GridViewsFrameID = 1;
  GridMasterDetailFrameID = GridViewsFrameID + 1;
  GridOffice11FrameID = GridMasterDetailFrameID + 1;
  GridNewItemRowFrameID = GridOffice11FrameID + 1;
  GridFilteringFrameID = GridNewItemRowFrameID + 1;
  GridCellMergingFrameID = GridFilteringFrameID + 1;
  GridIncSearchFrameID = GridCellMergingFrameID + 1;
  GridMultiEditorsFrameID = GridIncSearchFrameID + 1;
  GridSummaryFrameID = GridMultiEditorsFrameID + 1;

  GridBandedViewFrameID = GridSummaryFrameID + 1;
  GridNestedBandsFrameID = GridBandedViewFrameID + 1;
  GridFixedBandsFrameID = GridNestedBandsFrameID + 1;
  GridCardViewFrameID = GridFixedBandsFrameID + 1;
  GridLayoutViewFrameID = GridCardViewFrameID + 1;
  GridChartViewFrameID = GridLayoutViewFrameID + 1;

  GridCellSelectionFrameID = GridChartViewFrameID + 1;
  GridUnboundFrameID = GridCellSelectionFrameID + 1;
  GridUnboundColumnsViewFrameID = GridUnboundFrameID + 1;
  GridFolderFileFrameID = GridUnboundColumnsViewFrameID + 1;
  GridStyleFrameID = GridFolderFileFrameID + 1;
  GridAutoHeightFrameID = GridStyleFrameID + 1;

  GridAdvancedFilteringFrameID = GridAutoHeightFrameID + 1;
  GridPreviewFrameID = GridAdvancedFilteringFrameID + 1;
  GridDragDropFrameID = GridPreviewFrameID + 1;
  GridInplaceEditorsFrameID = GridDragDropFrameID + 1;
  GridInplaceEditorsValidationFrameID = GridInplaceEditorsFrameID + 1;
  GridBuildInNavigatorFrameID = GridInplaceEditorsValidationFrameID + 1;
  GridBackgroundMasterDetailFrameID = GridBuildInNavigatorFrameID + 1;
  GridCustomDrawFrameID = GridBackgroundMasterDetailFrameID + 1;
  GridServerModeFrameID = GridCustomDrawFrameID + 1;
  GridServerModeQueryFrameID = GridServerModeFrameID + 1;

  EditorsNativeFrameID = 200;
  EditorsShadowedFrameID = 201;
  EditorsWebFrameID = 202;
  EditorsFlatFrameID = 203;
  EditorsUltraFlatFrameID = 204;
  EditorsSkinsFrameID = 207;
  EditorsPropertiesFrameID = 205;
  ExtEditorsPropertiesFrameID = 206;

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
  GridCustomDrawImageIndex = 71;
  GridLayoutViewImageIndex = 72;
  GridServerModeImageIndex = 73;
  GridServerModeQueryImageIndex = 74;
  GridInplaceEditorsValidationImageIndex = 75;

  EditorsPropertiesImageIndex = 12;
  ExtEditorsPropertiesImageIndex = 32;
  EditorsShadowedImageIndex = 7;
  EditorsWebImageIndex = 0;
  EditorsFlatImageIndex = 3;
  EditorsUltraFlatImageIndex = 10;
  EditorsNativeImageIndex = 5;
  EditorsSkinsImageIndex = 6;

  StartFrameID = GridLayoutViewFrameID;

resourcestring
  GridMasterDetailFrameName = 'Master/Detail';
  GridUnboundModeFrameName = 'Unbound Mode';
  GridPoviderModeFrameName = 'Provider Mode';
  GridStylesFrameName = 'Grid Styles';
  GridCardViewFrameName = 'Card View';
  GridViewsFrameName = 'View Architecture';
  GridDataSummariesFrameName = 'Data Summaries';
  GridDataFilteringFrameName = 'Data Filtering';
  GridDataAdvancedFilteringFrameName = 'Advanced Data Filtering';
  GridAutoPreviewFrameName = 'Auto Preview';
  GridRowHeightFrameName = 'Row Height';
  GridFixedBandsFrameName = 'Fixed Bands';
  GridNestedBandsFrameName = 'Nested Bands';
  GridUnboundColumnsFrameName = 'Unbound Columns';
  GridBandedViewFrameName = 'Banded View';
  GridIncrementalSearchFrameName = 'Incremental Search';
  GridOffice11FrameName = 'Outlook 2003 Style';
  GridNewItemRowFrameName = 'New Item Row';
  GridMultiEditorsFrameName = 'Multiple Editors per Row';
  GridInplaceEditorsFrameName = 'Inplace Editors';
  GridInplaceEditorsValidationFrameName = 'Inplace Editors Validation';
  GridDragDropFrameName = 'Drag && Drop Rows';
  GridBuildInNavigatorFrameName = 'Data Navigation';
  GridWinMinerFrameName = 'Custom Draw';
  GridBackgroundMasterDetailFrameName = 'Background Image';
  GridCellSelectonFrameName = 'Cell Selection';
  GridCellMergingFrameName = 'Cell Merging';
  GridChartViewFrameName = 'Chart View';
  GridCustomDrawFrameName = 'Custom Draw';
  GridLayoutViewFrameName = 'Layout View';
  GridChartStackedFrameName = 'Stacked Bars/Columns';
  GridChartStackedAreaFrameName = 'Stacked Area';
  GridChartNullPointsFrameName = 'Null points';
  GridServerModeFrameName = 'Server Mode (Table)';
  GridServerModeQueryFrameName = 'Server Mode (Query)';

  EditorNativeFrameName = 'Native Look && Feel';
  EditorShadowedFrameName = 'Shadowed Look && Feel';
  EditorWebFrameName = 'Web Look && Feel';
  EditorFlatFrameName = 'Flat Look && Feel';
  EditorUltraFlatFrameName = 'UltraFlat Look && Feel';
  EditorSkinsFrameName = 'Skinned Look && Feel';
  EditorPropertiesFrameName = 'Properties';
  ExtEditorPropertiesFrameName = 'Extended Editors Properties';

implementation

end.
