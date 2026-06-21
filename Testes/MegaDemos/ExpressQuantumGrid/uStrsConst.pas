unit uStrsConst;

interface

resourcestring
  //Module hints, description and full names
  sdxFramePSHint = 'Press the Print Preview toolbar button to render the active visual control.';
  sdxFrameVertGridHint = 'Use the Style Toolbar Button to apply global style changes to the component. Use the Modify Properties button to make changes to control Properties.';
  sdxFrameEditorHint = 'Use the Style Controller Properties to apply global changes to all editors.';
  sdxFrameEditorsPropertiesHint = 'Properties for the edit control are set via the Properties member of the corresponding editor.';
  sdxFrameEditorsPropertiesCaption = 'ExpressEditors Library - over 60 data edit controls (included in the QuantumGrid Suite)';
  sdxFrameEditorsPropertiesTreeListCaption = 'ExpressEditors Library - Over 60 data edit and multi-purpose components (included in the QuantumTreeList Suite)';
  sdxFrameEditorsPropertiesVerticalGridCaption = 'ExpressEditors Library - Over 60 data edit and multi-purpose components (included in the ExpressVerticalGrid Suite)';
  sdxFrameExtEditorsPropertiesCaption = 'Extended ExpressEditors Library - 21 data edit controls (included in the QuantumGrid Suite)';
  sdxFrameAdvancedFilteringDescription = 'The most advanced grid also includes ultra advanced data filtering capabilities. ' +
    'Try it - specify a filter and press the Apply button to see your results!';
  sdxFrameMasterDetailDescription = 'Without Equal - the ExpressQuantumGrid Suite is the most comprehensive product library of its kind for the Delphi/C++Builder.' +
    ' But you don''t have to take our word for it…review its features and the scope and breadth of the individual components which make up the ExpressEditors Library' +
    ' (included in the QuantumGrid Suite) and decide for yourself. We think you will agree with us when we say that nothing comes close to ExpressQuantumGrid Suite v5.';
  sdxFrameDragDropDescription = 'ExpressQuantumGrid Suite v5 includes full drag and drop support. ' +
    'Give it a shot - drag one or more rows from one grid to another and see it in action.';
  sdxFrameFileExplorerDescription = 'The ExpressQuantumGrid Suite is powered by our advanced Data Controller. ' +
    'This demonstration illustrates the power behind this technology. ' +
    'Via our Provider Mode, you can populate the ExpressQuantumGrid with information without caching ANY data! ' +
    'Browse your hard drive and see the speed with which the QuantumGrid obtains information and ' +
    'use the incremental search feature to locate any record within a given folder ' +
    '(enter one ore more letters to locate the appropriate file name).';
  sdxFrameLayoutViewDescription = 'This demo illustrates the basic features provided by Layout Views (runtime field customization in cards, card collapsing, multiple selection and runtime record layout customization).';
  sdxFrameCardViewDescription = 'With version 5, we have added powerful new features to our Card View - whether you are using it standalone or embedded as part of a Master/Detail relationship.' +
  ' Cards can now be individually collapsed and filtering can be executed for each individual field. In addition, you now have full column customization at your disposal.';
  sdxFrameFilteringDescription = 'ExpressQuantumGrid Suite was the very first grid control to provide you with on the fly filtering capabilities via column headers and give you advanced display of filter status.' +
  ' With version 5, we extend these features by providing you with the ability to display the most recently executed filters both at a column and table view level. In addition, you can now display the filter status pane at the bottom or top of your Grid.';
  sdxFrameIncSearchGridDescription1 = 'Auto-Incremental Search against QuantumGrid columns: Press ANY key to Stop.';
  sdxFrameIncSearchGridDescription2 = 'Auto-Incremental Searching is available against any QuantumGrid column WITHOUT ' +
    'writing any source code! With its blinding fast speed, your users can find information quickly ' +
    'when large amounts of data are displayed within the QuantumGrid. ' +
    'Use Ctrl+Down to find the next match and Ctrl+Up to find the previous match.';
  sdxFrameIncSearchTreeListDescription1 = 'Auto-Incremental Search against QuantumTreeList columns: Press ANY key to Stop.';
  sdxFrameIncSearchTreeListDescription2 = 'Auto-Incremental Searching is available against any QuantumTreeList column WITHOUT ' +
    'writing any source code! With its blinding fast speed, your users can find information quickly ' +
    'when large amounts of data are displayed within the QuantumTreeList. ' +
    'Use Ctrl+Down to find the next match and Ctrl+Up to find the previous match.';
  sdxFrameInplaceEditors = 'The ExpressQuantumGrid Suite is not just a grid control - but a collection of over 60 individual components. ' +
    'The ExpressEditors Library which ships with the QuantumGrid Suite gives you the ability to use the most advanced data editors available today as standalone field controls or as individual cell editors. Version 5 now includes a Rich Text Editor!';
  sdxFrameInplaceEditorsValidation = 'This demo shows how to validate data input in-place using the built-in validation capabilities. ' +
    'Edit cell values and move focus or press the Enter key in order to validate the input. Correct input ' +
    'errors based on the requirements displayed in error hints. Try various validation options to customize ' +
    'validation error display.';
  sdxNestedBandsDescription = 'With the ExpressQuantumGrid Suite v5, we introduce nested band support as demonstrated in the example above. In addition to nested bands, this example shows how you can mix both bound and unbound data in a single Grid View!';
  sChartViewDescription =
    'With the ExpressQuantumGrid Suite v5.5 we''ve introduced a new ChartView with allows you to visualize data using 2 different diagrams - Columns and Bars. ' +
    'This example demonstrates how the ChartView can be used to build charts based on data from a database (Yearly Sales) or in-memory source (Sales By Quarter). ' +
    'Also at the "Orders by Customer" level, you can see how the ChartView can be used to show data from a detail dataset for each master row.';
  sdxFrameTreeListInpaceEditors = 'The QuantumTreeList Suite ships with the ExpressEditors Library, the most advanced ' +
    'data editors available for Delphi and C++Builder. Note that the QuantumTreeList allows you to display different editor ' +
    'types within the same column, as demonstrated above!';
  sdxFrameMultiEditorsDescription = 'Flexibility is at the heart of the ExpressQuantumGrid Suite v4+. ' +
    'Via our Multi-Editor support, you can display multiple editors for the same grid ' +
    'column with ease…Just take a look at the Grade column, each row contains a different data editor!';
  sdxFrameStyleDescription = 'The ExpressQuantumGrid Suite is without doubt the most advanced visual control ever created ' +
    'for Delphi/C++ Builder and Kylix. ' +
    'With our new Styles technology, you can easily assign Styles to the QuantumGrid and display information ' +
    'to your end-users in a format that meets your specific business needs and requirements. '+
    'Give it a shot…select a Style, Modify a Style, or Create a Style from scratch…it''s as easy as 1-2-3.';
  sdxFrameSummariesDescription = 'The ExpressQuantumGrid was the first grid control for Delphi/C++ Builder ' +
    'to make data summaries available for footers, grouped nodes, and grouped rows. ' +
    'With version 4+, we take this capability to the next level by introducing data summaries ' +
    'for any level displayed within the QuantumGrid (Master-Detail levels)…With LIGHTNING FAST SPEED!';
  sdxFrameUnboundDescription = 'The ExpressQuantumGrid Suite in Unbound Mode: 30,000 records have been loaded at '+
    'lightning speed for you - the data stored within the ExpressDataController. ' +
    'Give it a shot, group/sort by any record to see how fast ExpressQuantumGrid works with data. ' +
    'It simply has no equal in the marketplace… Guaranteed.';
  sdxFrameViewsDescription = 'Among the newest features introduced into the ExpressQuantumGrid Suite v4+ is our View-Based Technology. ' +
   'With it, you can alter the view of information displayed within the QuantumGrid by changing a single property ' +
   'at design time - You do not have to modify ANYTHING else!';
  sdxFrameBuildInNavigatorDescription = 'You can display or hide the built in data navigator by setting a single property at design or runtime.' +
  ' The QuantumGrid Suite gives you dozens of additional properties to help you customize the appearance and functionality of the data navigator as your needs dictate.';
  sdxFrameTreeListDragDropDescription = 'The QuantumTreeList of course fully supports drag & drop operations - against a single or multiple nodes. Give it a try. Select one or more tree nodes (you can multi-select using the CTRL or SHIFT keys) and drag them to a new position.';
  sdxFrameTreeListFolderDescription = 'The ExpressQuantumTreeList Suite By Developer Express is an advanced and feature complete Tree/List control AND it includes the ExpressEditors Library, ' +
    'a collection of nearly 50 all purpose data editors. With the QuantumTreeList, you can build highly elegant and easy to understand User Interfaces that will leave your competitors in the dust and your end-users fully satisfied! ' +
    'In this demo, we use the QuantumTreeList to build a Windows® Explorer like interface and have enabled the Incremental Search feature that is part of the component library. ' +
    'Give it a shot - enter a few characters on your keyboard to seek out a specific file on your hard drive.';
  sdxFrameTreeListTaskManager = 'The QuantumTreeList is a powerhouse data editing and visualization system. It includes 2 different paint styles - Standard, displayed here - and Categorized. ' +
    'Take a look at the ProgressBar cell editor…if you click within this cell, the QuantumTreeList will change editor type to a SpinEdit, thus giving you different way in which to present and edit data all within the same cell';
  sdxFrameTreeListTaskManagerCategorized = 'The QuantumTreeList is a powerhouse data editing and visualization system. It includes 2 different paint styles - Categorized, displayed here - and Standard. ' +
    'Take a look at the ProgressBar cell editor…if you click within this cell, the QuantumTreeList will change editor type to a SpinEdit, thus giving you different way in which to present and edit data all within the same cell!';
  sdxFrameTreeListBands = 'With Bands, you can better organize information for your end users. The QuantumTreeList also allows you to enable runtime band/column resizing with ease - go ahead, give it a try…';
  sdxFrameTreeListIEOptions = 'The QuantumTreeList Suite gives you an unrivaled platform from which to build advanced and compelling User Interfaces. In this example, we simulate the Internet Explorer Options dialog - ' +
    'as you can see, nodes can be drawn with checkboxes or with radio buttons.';
  sdxFrameTreeListBackgroundImage = 'The QuantumTreeList Suite allows you to customize your UI by embedding background images within the component - And with it''s StyleSheet and CustomDraw capabilities, you can create the appropriate look and feel for your projects.';
  sdxFrameTreeListProviderMode = 'FAST FAST FAST FAST - 100 MILLION tree nodes available to you at the blink of an eye via our virtual provider mode. ' +
    'And not just fast - the ExpressQuantumTreeList gives you a massive feature set including the most comprehensive set of data editors available on the market today!';
  sdxFrameTreeListCustomDraw = 'The ExpressQuantumTreeList includes comprehensive custom draw facilities to help you articulate your application''s vision with ease.';
  sdxFrameVertGridDescription = 'Flexibility and Power - The ExpressVerticalGrid is an "inverted" grid control with numerous usability features giving you the ability to deliver unrivaled capabilities to your end-users with ease.';


  sdxFrameVertGridStylesDescription = 'Like the ExpressQuantumGrid Suite, ExpressVerticalGrid was designed to give you options.' +
  ' With our Styles technology, you can easily assign Styles to the ExpressVerticalGrid and display information to your end-users in a format that meets your specific business needs and requirements.' +
  ' Give it a shot…select a Style, Modify a Style or Create a Style from scratch. It''s as easy as 1-2-3.';
  sdxFrameIncSearchVerticalGridDescription1 = 'Auto-Incremental Search against ExpressVerticalGrid rows: Press ANY key to Stop.';
  sdxFrameIncSearchVerticalGridDescription2 = 'Auto-Incremental Searching is available against any ExpressVerticalGrid row WITHOUT ' +
    'writing any source code! With its blinding fast speed, your users can find information quickly ' +
    'when large amounts of data are displayed within the ExpressVerticalGrid. ' +
    'Use Ctrl+Down to find the next match and Ctrl+Up to find the previous match.';
  sdxFrameVerticalFilterControl = 'The ExpressVerticalGrid also includes ultra advanced data filtering capabilities. ' +
    'Try it - specify a filter and press the Apply button to see your results!';
  sdxFrameVerticalGridNavigator = 'Want to quickly add an advanced navigation bar to help users scroll/add/edit/ and rollback changes to a dataset? With ExpressVerticalGrid, it''s no problem!';
  sdxFrameVerticalGridInplaceEditors = 'The ExpressVerticalGrid Suite ships with the ExpressEditors Library, the most advanced ' +
    'data editors available for Delphi and C++Builder. Note that the QuantumTreeList allows you to display different editor ' +
    'types within the same column, as demonstrated above!';
  sdxFrameVerticalGridCustomDraw =  'The ExpressVerticalGrid includes comprehensive custom draw facilities to help you articulate your application''s vision with ease.';
  sdxFrameVerticalGridRTTI = 'With the RTTI Aware Edition of the ExpressVerticalGrid, you can create UIs and customization capabilities similar to Borland® Delphi and C++Builder.' +
    'Give it a try…select a component from the control selector combo and make the desired modifications to its Properties via the ExpressVerticalGrid.';
  sdxFrameVerticalGridBitmap = 'The ExpressVerticalGrid Suite allows you to customize your UI by embedding background images within the component - And with it''s StyleSheet and CustomDraw capabilities, you can create the appropriate look and feel for your projects.';


  //dxFrames
  sdxCannotCreateSecondInstance = 'Can not create the second instance of the object %s';
  sdxAccessCodeIsIllegal = 'The access code %d is illegal';

  //dxGridFrame
  sdxGridFrameHint1 = 'Right click individual column headers and footers to activate the ExpressQuantumGrid Suite popup menu.';
  sdxGridFrameHint2 = 'Right click individual column headers to activate the ExpressQuantumGrid Suite popup menu.';

  //Main
  sdxColumnCustomizationMessage = 'The QuantumGrid fully supports runtime ' +
    'column selection. This feature is available to you without writing ' +
    'a single line of code! Try it, drag any column you wish to remove ' +
    'from display away from the column header and drop it.';
  sdxColumnCustomizationMessageTreeList = 'The QuantumTreeList fully supports runtime ' +
    'column selection. This feature is available to you without writing ' +
    'a single line of code! Try it, drag any column you wish to remove ' +
    'from display away from the column header and drop it.';
  sdxColumnCustomizationMessageVerticalGrid = 'The ExpressVerticalGrid fully supports runtime ' +
    'rows selection. This feature is available to you without writing ' +
    'a single line of code! Try it, drag any row you wish to remove ' +
    'from display away from the row header and drop it.';

  sdxColumnCustomizationMessageCaption =  'Column/Band Customization';
  sdxExportGridMessage = 'In order to Export data to an HTML, XML, Excel or text file,' +
    ' you must first select a grid demo. Select the QuantumGrid demo of choice,' +
    ' then return to this group and press the appropriate Export button.';
  sdxExportGridMessageCaption = 'Information';
  sdxOpenFile = 'Open file';
  sdxConfirm = 'Confirm';
  sdxPrinterIsBusy = 'Printer currently is busy.';
  sdxPrinterError = 'An error has been encountered during printing.';
  sdxExpressPrintingMessage = 'The ExpressPrinting System allows you to render and ' +
    'print the contents of the QuantumGrid, as well as a number of' +
    ' other Developer Express controls. This component library is not part of ' +
    'the QuantumGrid Suite and can be acquired separately via our site at: www.devexpress.com.';
  sdxExpressPrintingMessageTreeList = 'The ExpressPrinting System allows you to render and ' +
    'print the contents of the QuantumTreeList, as well as a number of' +
    ' other Developer Express controls. This component library is not part of ' +
    'the QuantumTreeList Suite and can be acquired separately via our site at: www.devexpress.com.';
  sdxExpressPrintingMessageVerticalGrid = 'The ExpressPrinting System allows you to render and ' +
    'print the contents of the ExpressVerticalGrid, as well as a number of' +
    ' other Developer Express controls. This component library is not part of ' +
    'the ExpressVerticalGrid Suite and can be acquired separately via our site at: www.devexpress.com.';

  //uGridStyles
  sdxDeletePresentationStyle = 'Delete "%s" Style Sheet?';
  sdxCopyOf = 'Copy of ';
  sdxNewStyleSheet = 'New StyleSheet';

  //uEditorsProperties
  sdxEditorNonDataAwareEdition = '(Non-Data Aware Edition)';
  sdxEditorDataAwareEdition = '(Data Aware Edition)';
  sdxEditorBothEditions = '(Non-Data Aware and Data Aware Editions)';

  //Editor descriptions
  sdxTextEditInfo = 'TcxTextEdit is an improved version of the Windows single-line edit control.';
  sdxMaskEditInfo = 'TcxMaskEdit is an improved version of a standard edit box with mask support for data validation.';
  sdxMemoEditInfo = 'TcxMemo is an edit control allowing you to edit BLOB data.';
  sdxRichEditInfo = 'TcxRichEdit is an edit control allowing you to customize the standard text layout with font attributes and paragraph formatting variations.';
  sdxDateEditInfo = 'TcxDateEdit is an edit control with a dropdown calendar. The DateEdit supports Smart data Input: please type "TODAY", "TODAY+1" to see this in action...';
  sdxButtonEditInfo = 'TcxButtonEdit is a standard edit box with embedded command button(s).';
  sdxCheckEditInfo = 'TcxCheckBox is a check box edit control.';
  sdxImageComboBxoInfo = 'TcxImageComboBox is a button editor with a dropdown control, which can include both an image and a description for a specific value.';
  sdxSpinEditInfo = 'TcxSpinEdit is an editor with spin buttons to increment or decrement numeric values.';
  sdxComboBoxInfo = 'TcxComboBox is a button editor with an associated dropdown list box control, which contains a set of predefined values.';
  sdxCalculatorEditInfo = 'TcxCalcEdit is a button edit control with a dropdown calculator.';
  sdxHyperLinkEditInfo = 'TcxHyperLinkEdit is a hyperlink (URL) editor, which can activate the default web-browser.';
  sdxTimeEditInfo = 'TcxTimeEdit is an editor for time values.';
  sdxCurrencyEditInfo = 'TcxCurrencyEdit displays and edits currency values based upon regional settings.';
  sdxImageEditInfo = 'TcxImage is an editor that allows you to display images.';
  sdxBlobEditInfo = 'TcxBlobEdit is a button type editor with the ability to display and edit BLOB data. The contents of BLOB fields are displayed within a resizable dropdown window.';
  sdxMRUEditInfo = 'TcxMRUEdit is a button type editor with the ability to display and edit a list of most recently used (MRU) items.';
  sdxPopupEditInfo = 'TcxPopupEdit is a button type editor with a dropdown window which can display another control.';
  sdxLookupComboBoxEditInfo = 'TcxDBLookupComboBox is a component with a linked dropdown lookup list.';
  sdxExtLookupComboBoxEditInfo = 'Express DB ExtLookup ComboBox';  //TODO
  sdxListBoxInfo = 'Express ListBox';  //TODO
  sdxRadioGroupInfo = 'Express RadioGroup';  //TODO
  sdxButtonInfo = 'ExpressButton is included as part of the ExpressQuantumGrid Suite v5. Though it will appear as a single control on your component palette, '+
    'it can be considered a 4 in 1 component. You can display a standard button, a glyph button, a button with a drop down, or a menu button - all within a single control. ' +
    'And of course, like all of the controls in the QuantumGrid Suite, the ExpressButton offers built-in XP Theme support - without the need for any external theme managers or manifests.';

  stPanelBkName = 'PanelBk';
  stDefaultHintText = 'Move the mouse over a control for a hint';
  sdxEditorsButtonEditMessage = 'You can call here some dialogs and manipulations...';
  sdxEditorsBlobEditKind = 'This example blob edit with memo text (BlobEditKind = bekMemo)';

  // Ext Editors Description
  sdxCheckComboBoxInfo = 'A TcxCheckComboBox control represents a combo box which can display items with checkboxes within the dropdown window.  This can be useful when the end-user needs to select several options from the dropdown at once.';
  sdxCheckListBoxInfo = 'The TcxCheckListBox is similar to the standard list box control, but it also displays a check box for every item, thus allowing a user to select and unselect items.';
  sdxColorComboBoxInfo = 'The Express ComboComboBox allows you to select a color from a series of predefined.';
  sdxFontNameComboBoxInfo = 'The Express FontComboBox allows you to select a font from the list of available system fonts.';
  sdxGroupBoxInfo = 'Use the TcxGroupBox control to place a group box onto the form.  The control provides features such as caption text position and alignment, background color and XP painting. ' +
    ' It even has a centered caption allowing it to replace a TPanel in your palette as well as a TGroupBox.';
  sdxHeaderInfo = 'TcxHeader represents a header object that supports several header sections with borders.  Users may resize the sections and specify the sorting mode for each individual section.';
  sdxHintStyleController = 'A component which controls the appearance and behavior of hints in the application.';
  sdxLabelInfo = 'The TcxLabel object provides an advanced label control that supports various visual effects.';
  sdxMCListBoxInfo = 'The TcxMCListBox control represents a list box that is capable of displaying data across several columns.';
  sdxProgressBarInfo = 'Use the TcxProgressBar control to place a progress bar onto the form.';
  sdxSpinButtonInfo = 'The TcxSpinButton class represents the spin button control.  A spin button can be connected to a TWinControl to enable editing of the control’s value and for performing navigation using the keyboard or the spin buttons.';
  sdxSplitterInfo = 'Use the TcxSplitter control to add a splitter control to the form.  This control enables end users to resize controls at runtime using drag and drop operations or by using the hot zone.';
  sdxTrackBarInfo = 'Use TcxTrackBar to put a track bar with advanced features on a form. The control displays a thumb that can be dragged by end users in order to modify the edit value.';
  sdxShellTreeViewInfo = 'The ExpressShell TreeView is an ultra fast TreeView for navigating the Shell namespace, supporting WinXP themes, Context Menus, Drag and Drop, and even Delphi 4.';
  sdxShellListViewInfo = 'The ExpressShell ListView is an ultra fast ListView for navigating the Shell namespace, supporting WinXP themes, Context Menus, Drag and Drop, and even Delphi 4.';
  sdxShellComboBoxInfo = 'The ExpressShell ComboBox is an ultra fast shell combo box control with WinXP theme support, Context Menus, Drag and Drop and resizable drop down window support.';
  sdxTreeViewInfo = 'The ExpressTreeView is a simple TreeView descendant that participates in the Developer Express Look and Feel behaviors, and allows a developer to show hierarchical collapsible data.';
  sdxListViewInfo = ' The ExpressListView is a simple ListView descendant that participates in the Developer Express Look and Feel behaviors, and allows a developer to show data in the form of Icon List, reports.';

  //Inplace editors module
  sdxInpaceFrame_BlobItem = 'Please add text here...';
  sdxInpaceFrame_ButtonItem = 'Press me...';
  sdxInpaceFrame_MemoItem = 'Robbins studied drama at UCLA where he graduated with honors in 1981. ' +
    'That same year, he formed the Actors'''+
    ' Gang, an experimental ensemble that expressed radical political observations through ' +
    'the European avant-garde form of theater.';
  sdxInpaceFrame_MRUItem = 'What''s your favorite color?';
  sdxInplaceFrame_PopupItem = 'Pop me up...';
  sdxInpaceFrame_TextItem = 'Text';
  sdxInpaceFrame_MRUItemClick = 'You''ve pressed the MRU Inplace Editor button.';

  //Multiple editors module
  sdxMultipleEditorsFrame_Programming = 'Programming Experience (in years)';
  sdxMultipleEditorsFrame_PrimaryLanguage = 'Primary Language';
  sdxMultipleEditorsFrame_SecondaryLanguage = 'Secondary Language';
  sdxMultipleEditorsFrame_Communication = 'Communication';
  sdxMultipleEditorsFrame_StartWork = 'Start working from';
  sdxMultipleEditorsFrame_CustomInformation = 'Custom Information';
  sdxMultipleEditorsFrame_PutInformation =  'Put additional information here';

  //Auto Preview module
  sdxFramePreview_DescriptionText1 = 'This is a description for ';
  sdxFramePreview_DescriptionText2 = 'Notice the Auto Preview Feature';


implementation

end.
