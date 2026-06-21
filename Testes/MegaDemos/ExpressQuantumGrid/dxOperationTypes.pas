unit dxOperationTypes;

interface

type
  TdxgdOperationType =
    (otNone, otHint, otExit, otGoToView, otGridView,
     otLinkProducts, otLinkDownloads, otLinkForum, otLinkMain,

     otExportTo, otExportToHTML, otExportToXML, otExportToExcel, otExportToExcel2007, otExportToPDF, otExportToText, 
     otPrint, {otPageSetup, }otPrintStyles, otDefinePrintStyles, otPrintPreview,

     otShowInspector,

     otTreeListAddNode, otTreeListAddChildNode, otTreeListPost, otTreeListCancel, otTreeListDelete,
     otTreeListAddSection, otTreeListAddValue,

     otFileNew, otFileOpen, otFileSave, otUndo, otRedo,
     otEditOperations, otCut, otCopy, otPast, otDeleteCells, otInsertCells,
     otFontName, otFontColor, otFontSize, otFontItalic, otFontBold, otFontUnderLine, otFontStrikeOut,
     otAlignLeft, otAlignCenter, otAlignRight, otCellMerge, otCellUnMerge,
     otInsertOperations, otInsertRow, otInsertColumn, otInsertSheet,
     otSelectionText, otCellText, otCellShow, otCellHide, otCellProperties,

     otFirst, otPrior, otNext, otLast, otInsert, otDelete, otEdit, otPost, otCancel, otRefresh,
     otStyles, otStyleList, otNative, otGrouping, otShowIndicator, otShowSummaryFooter, otShowHeaders,
     otAutoWidth, otShowGrid, otAutoPreview, otShowButtonsAlways, otInvertSelected,
     otFullCollapse, otFullExpand, otAutoFormat, otCustomization, otShowBands,
     otOptions, otAutoSearch, otAutoExpandOnSearch, otSearchColor, otSearchTextColor,

     otColumnDiagram, otBarDiagram, otCategoriesInReverseOrder, otValueAxisAtMaxCategory);

  TdxgdBarType =
    (btMainMenu, btStandard, btFormat, btFontFormat, btOptions,
      btDBNavigator, btStatusBar, btTreeList, btHelp, btSpreadSheet, btDiagrams);

  TdxgdPopupMenuType = (pmSpreadSheet);    

implementation

end.
