unit uEditorsProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, ImgList, ExtDlgs,
  ToolWin, ComCtrls, 
  PropertiesPreview, Propertiespopup, DB, DBTables, dxCore, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, cxCheckBox, cxLookupEdit,
  cxDBLookupEdit, cxEditMaskEditor, cxImageComboBox, cxSpinEdit, cxMemo,
  cxCalendar, cxCalc, cxHyperLinkEdit, cxTimeEdit, cxCurrencyEdit, cxImage,
  cxBlobEdit, cxMRUEdit, cxDropDownEdit, cxTextEdit, cxButtons,
  cxLookAndFeelPainters, cxDBLookupComboBox,
  cxDBExtLookupComboBox, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDBData, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridViewLayoutEditor,
  cxListBox, cxRadioGroup, Menus, uCustomEditorsProperties, ShlObj,
  cxShellCommon, cxListView, cxTreeView, cxShellComboBox, cxShellListView,
  cxShellTreeView, cxHeader, cxSpinButton, cxSplitter, cxMCListBox,
  cxFontNameComboBox, cxCheckComboBox, cxCheckListBox, cxGroupBox,
  cxTrackBar, cxProgressBar, cxColorComboBox, cxLabel, cxHint,
  cxDataStorage, cxNavigator, cxDBNavigator, cxRichEdit, cxPC, cxLookAndFeels,
  cxPCdxBarPopupMenu;

const
  ButtonCount = 4;
type

  TframeEditorsProperties = class(TframeCustomEditorsProperties)
    tsTextEdit: TTabSheet;
    pnEdit: TPanel;
    Label9: TcxLabel;
    PanelBk1: TPanel;
    Label10: TcxLabel;
    Bevel3: TBevel;
    Label15: TcxLabel;
    Label16: TcxLabel;
    tsMaskEdit: TTabSheet;
    Panel_MaskEdit: TPanel;
    Label18: TcxLabel;
    PanelBk2: TPanel;
    Label20: TcxLabel;
    Label1: TcxLabel;
    Bevel1: TBevel;
    tsMemo: TTabSheet;
    Panel_Memo: TPanel;
    Label22: TcxLabel;
    PanelBk_Memo: TPanel;
    Label24: TcxLabel;
    Label2: TcxLabel;
    Bevel2: TBevel;
    tsDateEdit: TTabSheet;
    Panel_DateEdit: TPanel;
    Label25: TcxLabel;
    PanelBk4: TPanel;
    Label27: TcxLabel;
    Label28: TcxLabel;
    Label29: TcxLabel;
    Label30: TcxLabel;
    Label3: TcxLabel;
    Bevel4: TBevel;
    tsButtonEdit: TTabSheet;
    Panel_ButtonEdit: TPanel;
    Label32: TcxLabel;
    PanelBk5: TPanel;
    Label4: TcxLabel;
    Bevel5: TBevel;
    Label41: TcxLabel;
    tsCheckBox: TTabSheet;
    Panel_CheckEdit: TPanel;
    Label36: TcxLabel;
    PanelBk6: TPanel;
    Label38: TcxLabel;
    Label39: TcxLabel;
    Bevel7: TBevel;
    Label5: TcxLabel;
    Bevel6: TBevel;
    tsImageComboBox: TTabSheet;
    Panel_ImageEdit: TPanel;
    Label40: TcxLabel;
    PanelBk7: TPanel;
    Label43: TcxLabel;
    Label45: TcxLabel;
    Label6: TcxLabel;
    Bevel8: TBevel;
    tsSpinEdit: TTabSheet;
    Panel_SpinEdit: TPanel;
    Label46: TcxLabel;
    PanelBk8: TPanel;
    Label48: TcxLabel;
    Label49: TcxLabel;
    Label50: TcxLabel;
    Label7: TcxLabel;
    Bevel9: TBevel;
    tsComboBox: TTabSheet;
    Panel_PickEdit: TPanel;
    Label52: TcxLabel;
    PanelBk9: TPanel;
    Label55: TcxLabel;
    Label56: TcxLabel;
    Label57: TcxLabel;
    Label8: TcxLabel;
    Bevel10: TBevel;
    tsCalcEdit: TTabSheet;
    Panel_CalcEdit: TPanel;
    Label58: TcxLabel;
    PanelBk10: TPanel;
    Label61: TcxLabel;
    Label63: TcxLabel;
    Label11: TcxLabel;
    Bevel11: TBevel;
    tsHyperLinkEdit: TTabSheet;
    Panel_HyperLink: TPanel;
    Label64: TcxLabel;
    PanelBk11: TPanel;
    Bevel13: TBevel;
    Label12: TcxLabel;
    Bevel12: TBevel;
    tsTimeEdit: TTabSheet;
    Panel_TimeEdit: TPanel;
    Label67: TcxLabel;
    PanelBk12: TPanel;
    Label72: TcxLabel;
    Label13: TcxLabel;
    Bevel14: TBevel;
    tsCurrencyEdit: TTabSheet;
    Panel_CurrencyEdit: TPanel;
    Label87: TcxLabel;
    PanelBk13: TPanel;
    Label108: TcxLabel;
    Label109: TcxLabel;
    Label110: TcxLabel;
    Label111: TcxLabel;
    Label14: TcxLabel;
    Bevel15: TBevel;
    tsImage: TTabSheet;
    Panel_GraphicEdit: TPanel;
    Label89: TcxLabel;
    PanelBk14: TPanel;
    Label19: TcxLabel;
    Bevel16: TBevel;
    Label91: TcxLabel;
    Label106: TcxLabel;
    Bevel17: TBevel;
    Label92: TcxLabel;
    Label94: TcxLabel;
    tsBlobEdit: TTabSheet;
    Panel_BlobEdit: TPanel;
    Label95: TcxLabel;
    BlobImage: TImage;
    PanelBk15: TPanel;
    Label21: TcxLabel;
    Bevel18: TBevel;
    Label97: TcxLabel;
    Label98: TcxLabel;
    Label99: TcxLabel;
    Label100: TcxLabel;
    Label101: TcxLabel;
    Label107: TcxLabel;
    tsMRUEdit: TTabSheet;
    Panel_MRUEdit: TPanel;
    Label31: TcxLabel;
    PanelBk17: TPanel;
    Label33: TcxLabel;
    Label53: TcxLabel;
    Bevel20: TBevel;
    Label34: TcxLabel;
    tsPopupEdit: TTabSheet;
    Panel2: TPanel;
    Label23: TcxLabel;
    PanelBk16: TPanel;
    Label26: TcxLabel;
    Label37: TcxLabel;
    Bevel19: TBevel;
    Label47: TcxLabel;
    Label59: TcxLabel;
    Label65: TcxLabel;
    tsDBLookupComboBox: TTabSheet;
    Panel_DBLookupEditBk: TPanel;
    Label66: TcxLabel;
    PanelBk18: TPanel;
    Label68: TcxLabel;
    Label71: TcxLabel;
    Bevel21: TBevel;
    OpenPictureDialog: TOpenPictureDialog;
    OpenDialog: TOpenDialog;
    ImageListTime: TImageList;
    Image16: TImageList;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    MaskEdit: TcxMaskEdit;
    cbIgnoreMaskBlank: TcxCheckBox;
    Label73: TcxLabel;
    edMaskKind: TcxComboBox;
    DBLookupComboBox: TcxDBLookupComboBox;
    Label75: TcxLabel;
    edDropDownListStyle: TcxComboBox;
    edListFieldName: TcxTextEdit;
    cbLookupRevertable: TcxCheckBox;
    edEditMask: TcxButtonEdit;
    Edit: TcxTextEdit;
    cbAutoSelect: TcxCheckBox;
    cbEnabled: TcxCheckBox;
    cbHideSelection: TcxCheckBox;
    cbReadOnly: TcxCheckBox;
    edHAlignment: TcxImageComboBox;
    Label78: TcxLabel;
    edVAlignment: TcxImageComboBox;
    Label17: TcxLabel;
    edEchoMode: TcxComboBox;
    edMaxLength: TcxSpinEdit;
    cbDropDownAutoSize: TcxCheckBox;
    cbIncrementalFiltering: TcxCheckBox;
    Memo: TcxMemo;
    edScrollBars: TcxComboBox;
    cbWantReturns: TcxCheckBox;
    cbWantTabs: TcxCheckBox;
    cbWordWrap: TcxCheckBox;
    DateEdit: TcxDateEdit;
    edDateOnError: TcxComboBox;
    edInputKind: TcxComboBox;
    edPopupBorder: TcxComboBox;
    cbToday: TcxCheckBox;
    cbClear: TcxCheckBox;
    cbSaveTime: TcxCheckBox;
    Label79: TcxLabel;
    Bevel24: TBevel;
    ButtonEdit: TcxButtonEdit;
    Label35: TcxLabel;
    edCharCase: TcxComboBox;
    cbHideCursor: TcxCheckBox;
    CheckBox: TcxCheckBox;
    edCaption: TcxTextEdit;
    edNullStyle: TcxImageComboBox;
    cbAllowGrayed: TcxCheckBox;
    cbFullFocusRect: TcxCheckBox;
    cbMultiLine: TcxCheckBox;
    cbUseGlyph: TcxCheckBox;
    ImageComboBox: TcxImageComboBox;
    edDropDownRows: TcxSpinEdit;
    edImagePopupBorder: TcxComboBox;
    Label42: TcxLabel;
    Bevel25: TBevel;
    cbShowDescriptions: TcxCheckBox;
    SpinEdit: TcxSpinEdit;
    ComboBox: TcxComboBox;
    cbImmediateDropDown: TcxCheckBox;
    edMinValue: TcxTextEdit;
    edMaxValue: TcxTextEdit;
    cbCanEdit: TcxCheckBox;
    edValueType: TcxComboBox;
    edComboDropDownRows: TcxSpinEdit;
    cbRevertable: TcxCheckBox;
    Bevel26: TBevel;
    Label44: TcxLabel;
    edComboPopupBorder: TcxComboBox;
    edComboDropDownListStyle: TcxComboBox;
    CalcEdit: TcxCalcEdit;
    Label54: TcxLabel;
    Bevel27: TBevel;
    cbNativeStyle: TcxCheckBox;
    cbBeepOnError: TcxCheckBox;
    cbQuickClose: TcxCheckBox;
    edPrecision: TcxSpinEdit;
    edCalcPopupBorder: TcxComboBox;
    Label60: TcxLabel;
    Bevel28: TBevel;
    cbTextEditNativeStyle: TcxCheckBox;
    HyperLinkEdit: TcxHyperLinkEdit;
    cbSingleClick: TcxCheckBox;
    cbHyperLinkReadOnly: TcxCheckBox;
    TimeEdit: TcxTimeEdit;
    edTimeFormat: TcxComboBox;
    CurrencyEdit: TcxCurrencyEdit;
    edDecimalPlaces: TcxSpinEdit;
    edDisplayFormat: TcxTextEdit;
    edCurrMinValue: TcxTextEdit;
    edCurrMaxValue: TcxTextEdit;
    cbUseThousandSeparator: TcxCheckBox;
    Image: TcxImage;
    edCustomFilter: TcxComboBox;
    edTransparency: TcxComboBox;
    Label62: TcxLabel;
    edPopupAlignment: TcxComboBox;
    cbCenter: TcxCheckBox;
    cbStretch: TcxCheckBox;
    cbCut: TcxCheckBox;
    cbCopy: TcxCheckBox;
    cbPaste: TcxCheckBox;
    cbDelete: TcxCheckBox;
    cbLoadFromFile: TcxCheckBox;
    cbSaveToFile: TcxCheckBox;
    cbCustom: TcxCheckBox;
    edCustomButtonCaption: TcxTextEdit;
    edCustomButtonGlyph: TcxButtonEdit;
    BlobEdit: TcxBlobEdit;
    edBlobEditKind: TcxComboBox;
    edBlobPaintStyle: TcxComboBox;
    cbAlwaysSaveData: TcxCheckBox;
    edBlobMemoScrollBars: TcxComboBox;
    edBlobMemoMaxLength: TcxSpinEdit;
    Label80: TcxLabel;
    edBlobMemoCharCase: TcxComboBox;
    cbBlobMemoWantReturns: TcxCheckBox;
    cbBlobMemoWantTabs: TcxCheckBox;
    cbBlobMemoWordWrap: TcxCheckBox;
    edPictureFilter: TcxComboBox;
    edPictureTranparency: TcxComboBox;
    cbShowExPopupItems: TcxCheckBox;
    cbShowPicturePopup: TcxCheckBox;
    MRUEdit: TcxMRUEdit;
    seMaxItemCount: TcxSpinEdit;
    cbShowEllipsis: TcxCheckBox;
    PopupEdit: TcxPopupEdit;
    edPopUpWidth: TcxSpinEdit;
    edPopUpMinWidth: TcxSpinEdit;
    edPopUpHeight: TcxSpinEdit;
    edPopupMinHeight: TcxSpinEdit;
    pePopupAlignment: TcxComboBox;
    pePopupBorderStyle: TcxComboBox;
    cbPopupAutoSize: TcxCheckBox;
    cbPopupSizeable: TcxCheckBox;
    cbPopupClientEdge: TcxCheckBox;
    cbPopupSysPanelStyle: TcxCheckBox;
    Label81: TcxLabel;
    Bevel29: TBevel;
    Label82: TcxLabel;
    Bevel30: TBevel;
    cbShowTime: TcxCheckBox;
    tsButton: TTabSheet;
    Panel_Button: TPanel;
    Label77: TcxLabel;
    cxButton: TcxButton;
    PanelBk_Button: TPanel;
    Label83: TcxLabel;
    Label84: TcxLabel;
    Bevel31: TBevel;
    cbButtonLookAndFeel: TcxComboBox;
    cbButtonIsNative: TcxCheckBox;
    cbButtonEnabled: TcxCheckBox;
    cbButtonDefault: TcxCheckBox;
    Label85: TcxLabel;
    Label88: TcxLabel;
    Bevel33: TBevel;
    Label90: TcxLabel;
    Label96: TcxLabel;
    Label103: TcxLabel;
    Label105: TcxLabel;
    tsDBExtLookupComboBox: TTabSheet;
    tsListBox: TTabSheet;
    tsRadioGroup: TTabSheet;
    Panel_DBExtLookupComboBox: TPanel;
    Label74: TcxLabel;
    ExtLookup_PanelBk: TPanel;
    Label86: TcxLabel;
    Bevel22: TBevel;
    GridViewRepository: TcxGridViewRepository;
    GridViewRepositoryDBTableView: TcxGridDBTableView;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DBExtLookupComboBox: TcxDBExtLookupComboBox;
    Label76: TcxLabel;
    edExtLookupDropDownListStyle: TcxComboBox;
    cbExtLookupComboRevertable: TcxCheckBox;
    cbExtLookupComboDropDownAutoSize: TcxCheckBox;
    cbExtLookupComboIncrementalFiltering: TcxCheckBox;
    btnViewLayoutEdit: TcxButton;
    cbExtLookupComboFocusPopup: TcxCheckBox;
    Panel_ListBox: TPanel;
    PanelBk_ListBox: TPanel;
    Label93: TcxLabel;
    Bevel32: TBevel;
    ListBox: TcxListBox;
    Label102: TcxLabel;
    cbListBoxBorderStyle: TcxComboBox;
    Label104: TcxLabel;
    cbListBoxHotTrack: TcxCheckBox;
    cbListBoxShadow: TcxCheckBox;
    Panel_RadioGroup: TPanel;
    Label112: TcxLabel;
    PanelBk_RadioGroup: TPanel;
    Label113: TcxLabel;
    Bevel34: TBevel;
    cbRadioGroupHotTrack: TcxCheckBox;
    cbRadioGroupShadow: TcxCheckBox;
    RadioGroup: TcxRadioGroup;
    seRadioGroupColumnCount: TcxSpinEdit;
    Label114: TcxLabel;
    edTimeEditUse24HourFormat: TcxCheckBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    PopupMenuButton: TPopupMenu;
    New1: TMenuItem;
    Save1: TMenuItem;
    Delete1: TMenuItem;
    Cancel1: TMenuItem;
    N1: TMenuItem;
    Properties1: TMenuItem;
    cbShowFastButton: TcxCheckBox;
    Label115: TcxLabel;
    edSpinButtonsPosition: TcxComboBox;
    GridDBTableViewFIRSTNAME: TcxGridDBColumn;
    GridDBTableViewLASTNAME: TcxGridDBColumn;
    GridDBTableViewPAYMENTTYPE: TcxGridDBColumn;
    GridDBTableViewPRODUCTID: TcxGridDBColumn;

{Ext}
    tsLabel: TTabSheet;
    Panel_Label: TPanel;
    PanelBk_Label: TPanel;
    Label_Ext4: TcxLabel;
    Bevel_Ext5: TBevel;
    cxLabel: TcxLabel;
    tsProgressBar: TTabSheet;
    tsTrackBar: TTabSheet;
    tsCheckListBox: TTabSheet;
    tsColorComboBox: TTabSheet;
    tsFontNameComboBox: TTabSheet;
    tsCheckComboBox: TTabSheet;
    tsGroupBox: TTabSheet;
    tsMCListBox: TTabSheet;
    Panel_ProgressBar: TPanel;
    PanelBk_Progressbar: TPanel;
    Label_Ext1: TcxLabel;
    Bevel_Ext1: TBevel;
    Panel_TrackBar: TPanel;
    PanelBk_TrackBar: TPanel;
    Label_Ext2: TcxLabel;
    Bevel_Ext2: TBevel;
    Panel_CheckListBox: TPanel;
    PanelBk_CheckListBox: TPanel;
    Label_Ext3: TcxLabel;
    Bevel_Ext3: TBevel;
    Panel_ColorComboBox: TPanel;
    PanelBk_ColorComboBox: TPanel;
    Label_Ext5: TcxLabel;
    Bevel_Ext4: TBevel;
    Panel_FontNameComboBox: TPanel;
    PanelBk_FontNameComboBox: TPanel;
    Label_Ext6: TcxLabel;
    Bevel_Ext6: TBevel;
    Panel_CheckComboBoxBk: TPanel;
    PanelBk_CheckComboBox: TPanel;
    Label_Ext7: TcxLabel;
    Bevel_Ext7: TBevel;
    Panel_GroupBox: TPanel;
    PanelBk_GroupBox: TPanel;
    Label_Ext8: TcxLabel;
    Bevel_Ext8: TBevel;
    Panel_MCListBox: TPanel;
    PanelBk_MCListBox: TPanel;
    Label_Ext9: TcxLabel;
    Bevel_Ext9: TBevel;
    ProgressBar: TcxProgressBar;
    ProgressBarVert: TcxProgressBar;
    TrackBar: TcxTrackBar;
    CheckListBox: TcxCheckListBox;
    ColorComboBox: TcxColorComboBox;
    FontNameComboBox: TcxFontNameComboBox;
    CheckComboBox: TcxCheckComboBox;
    GroupBox: TcxGroupBox;
    MCListBox: TcxMCListBox;
    tsSplitter: TTabSheet;
    Panel_Splitter: TPanel;
    PanelBk_Splitter: TPanel;
    Label_Ext10: TcxLabel;
    Bevel_Ext10: TBevel;
    pnlSplitterClient: TPanel;
    Panel_Ext2: TPanel;
    Panel_Ext3: TPanel;
    Splitter: TcxSplitter;
    Label_Ext11: TcxLabel;
    Label_Ext12: TcxLabel;
    spLabelAngle: TcxSpinEdit;
    cbLabelEffect: TcxComboBox;
    Label_Ext13: TcxLabel;
    Label_Ext14: TcxLabel;
    spLabelDepth: TcxSpinEdit;
    spLabelPenWidth: TcxSpinEdit;
    Label_Ext15: TcxLabel;
    cbLabelStyle: TcxComboBox;
    Label_Ext16: TcxLabel;
    cbLabelOrientation: TcxComboBox;
    Label_Ext17: TcxLabel;
    Label_Ext18: TcxLabel;
    Label_Ext19: TcxLabel;
    Label_Ext20: TcxLabel;
    Label_Ext21: TcxLabel;
    spProgressBarPosition: TcxSpinEdit;
    cbProgressBarShowPeack: TcxCheckBox;
    cbProgressBarPeackColor: TcxColorComboBox;
    cbProgressBarStyle: TcxComboBox;
    cbProgressBarBeginColor: TcxColorComboBox;
    cbProgressBarEndColor: TcxColorComboBox;
    cbProgressBarShowText: TcxCheckBox;
    Label_Ext22: TcxLabel;
    cbProgressBarShowTextStyle: TcxComboBox;
    Label_Ext23: TcxLabel;
    TrackBarVert: TcxTrackBar;
    Label_Ext24: TcxLabel;
    spTrackBarPosition: TcxSpinEdit;
    Label_Ext25: TcxLabel;
    cbTrackBarTickType: TcxComboBox;
    cbTrackBarShowTick: TcxCheckBox;
    cbTrackBarShowTrack: TcxCheckBox;
    Label_Ext31: TcxLabel;
    cbColorComboDefaultColorStyle: TcxComboBox;
    Label_Ext32: TcxLabel;
    cbColorComboNamingConvention: TcxComboBox;
    cbColorComboShowDescription: TcxCheckBox;
    cbFontComboDropDownSizable: TcxCheckBox;
    Label_Ext35: TcxLabel;
    edCheckComboDelimiter: TcxTextEdit;
    rgSplitterHotZone: TcxRadioGroup;
    cxLabelUseGlyph: TcxCheckBox;
    imLabel: TcxImage;
    cbTrackBarAutoSize: TcxCheckBox;
    Label_Ext26: TcxLabel;
    cbTrackBarThumbColor: TcxColorComboBox;
    Label_Ext39: TcxLabel;
    cbTrackBarThumbHighLightColor: TcxColorComboBox;
    Label_Ext40: TcxLabel;
    cbTrackBarTrackColor: TcxColorComboBox;
    Label_Ext41: TcxLabel;
    spTrackBarThumbWidth: TcxSpinEdit;
    Labe_Ext42: TcxLabel;
    spTrackBarTrackWidth: TcxSpinEdit;
    Label_Ext43: TcxLabel;
    spCheckListBoxColumns: TcxSpinEdit;
    cbCheckListBoxAllowedGrayed: TcxCheckBox;
    cbCheckListBoxSorted: TcxCheckBox;
    gbCheckComboBoxLookAndFeel: TcxGroupBox;
    Label_Ext44: TcxLabel;
    cbCheckListBoxLookAndFeelKind: TcxComboBox;
    cbCheckListBoxLookAndFeelNativeStyle: TcxCheckBox;
    Label_Ext28: TcxLabel;
    icCheckComboBoxGlyph: TcxImageComboBox;
    Label_Ext27: TcxLabel;
    cbColorComboBoxColorValueFormat: TcxComboBox;
    Label_Ext45: TcxLabel;
    cbColorComboBoxColorBoxAlign: TcxComboBox;
    cbColorComboBoxDropDownSizable: TcxCheckBox;
    Label_Ext46: TcxLabel;
    edColorComboBoxDefaultDescription: TcxButtonEdit;
    imFontNameComboBoxButtonGlyph: TcxImage;
    cbFontNameComboBoxFontTypes: TcxCheckComboBox;
    Label_Ext47: TcxLabel;
    Label_Ext48: TcxLabel;
    cbFontNameComboBoxPreivewType: TcxComboBox;
    Label_Ext49: TcxLabel;
    edFontNameComboBoxPreviewText: TcxTextEdit;
    cbFontNameComboBoxPreviewShowButtons: TcxCheckBox;
    cbFontNameComboBoxPreviewVisible: TcxCheckBox;
    Label_Ext50: TcxLabel;
    cbFontNameComboBoxShowFontTypeIcon: TcxCheckComboBox;
    cbFontNameComboBoxUseOwnFont: TcxCheckBox;
    cbFontNameComboBoxButtonBitmap: TcxCheckBox;
    Label_Ext51: TcxLabel;
    cbCheckComboBoxGlyph: TcxImageComboBox;
    Label_Ext52: TcxLabel;
    edCheckListBoxEmptySelectionText: TcxTextEdit;
    cbCheckListBoxDropDownSizable: TcxCheckBox;
    gbCheckListBoxLookAndFeel: TcxGroupBox;
    Label_Ext53: TcxLabel;
    cbCheckComboBoxLookAndFeelKind: TcxComboBox;
    cbCheckComboBoxLookAndFeelNativeStyle: TcxCheckBox;
    Label_Ext36: TcxLabel;
    cbGroupBoxAlignment: TcxComboBox;
    Label_Ext54: TcxLabel;
    edGroupBoxCaption: TcxTextEdit;
    Label_Ext55: TcxLabel;
    cbGroupBoxCaptionBackColor: TcxColorComboBox;
    Label_Ext56: TcxLabel;
    cbGroupBoxColor: TcxColorComboBox;
    cbMCListBoxShowColumnLines: TcxCheckBox;
    cbCMListBoxShowEndEllipsis: TcxCheckBox;
    cbMCListBoxSorted: TcxCheckBox;
    cbMCListBoxOverflowEmptyColumn: TcxCheckBox;
    cbMCListBoxMultilines: TcxCheckBox;
    cbMCListBoxMultiSelect: TcxCheckBox;
    cbMCListBoxHeaderDragReorder: TcxCheckBox;
    Label_Ext37: TcxLabel;
    cbMCListBoxItems: TcxBlobEdit;
    Label_Ext38: TcxLabel;
    edMCListBoxDelimiter: TcxTextEdit;
    gbMCListBoxLookAndFeel: TcxGroupBox;
    Label_Ext57: TcxLabel;
    cbMCListBoxLookAndFeelKind: TcxComboBox;
    cbMCListBoxLookAndFeelNativeStyle: TcxCheckBox;
    cxMemo_Ext1: TcxMemo;
    cbSlitterAllowHotZoneDrag: TcxCheckBox;
    edSplitterHotZoneSizePercent: TcxSpinEdit;
    Label_Ext58: TcxLabel;
    cbSplitterAutoSnap: TcxCheckBox;
    cbSplitterResizeUpdate: TcxCheckBox;
    tsHintStyleController: TTabSheet;
    tsSpinButton: TTabSheet;
    tsHeader: TTabSheet;
    tsShellTreeView: TTabSheet;
    tsShellListView: TTabSheet;
    tsTreeView: TTabSheet;
    tsListView: TTabSheet;
    Panel_HintStyleController: TPanel;
    PanelBk_HitStyleController: TPanel;
    Label_Ext59: TcxLabel;
    Bevel_Ext11: TBevel;
    Panel_SpinButton: TPanel;
    PanelBk_SpinButton: TPanel;
    Label_Ext60: TcxLabel;
    Bevel_Ext12: TBevel;
    Panel_Header: TPanel;
    PanelBk_Header: TPanel;
    Label_Ext61: TcxLabel;
    Bevel_Ext13: TBevel;
    Panel_ShellTreeView: TPanel;
    PanelBk_ShellTreeView: TPanel;
    Label_Ext62: TcxLabel;
    Bevel_Ext14: TBevel;
    Panel_ShellListView: TPanel;
    PanelBk_ShellListView: TPanel;
    Label_Ext63: TcxLabel;
    Bevel_Ext15: TBevel;
    Panel_TreeView: TPanel;
    PanelBk_TreeView: TPanel;
    Label_Ext64: TcxLabel;
    Bevel_Ext16: TBevel;
    Panel_ListView: TPanel;
    PanelBk_ListView: TPanel;
    Label_Ext65: TcxLabel;
    Bevel_Ext17: TBevel;
    SpinButton: TcxSpinButton;
    edSpinButton: TcxTextEdit;
    Header: TcxHeader;
    tsShellComboBox: TTabSheet;
    Panel_ShellComboBox: TPanel;
    PanelBk_ShellComboBox: TPanel;
    Label_Ext66: TcxLabel;
    Bevel_Ext18: TBevel;
    TreeView: TcxTreeView;
    ListView: TcxListView;
    HintStyleControllerMemo: TMemo;
    Label_Ext67: TcxLabel;
    cbHintStyleControllerIconType: TcxComboBox;
    Label_Ext68: TcxLabel;
    cbHintStyleControllerIconSize: TcxComboBox;
    Label_Ext69: TcxLabel;
    cbHintStyleControllerCallOutPosition: TcxComboBox;
    Label_Ext70: TcxLabel;
    cbHintStyleControllerColor: TcxColorComboBox;
    cbHintStyleControllerStandard: TcxCheckBox;
    cbHintStyleControllerRounded: TcxCheckBox;
    Label_Ext71: TcxLabel;
    cbHintStyleControllerAnimate: TcxComboBox;
    Label_Ext72: TcxLabel;
    edSpinButtonIncrement: TcxSpinEdit;
    edSpinButtonLargeIncrement: TcxSpinEdit;
    Label_Ext73: TcxLabel;
    Label_Ext74: TcxLabel;
    cbSpinButtonPosition: TcxComboBox;
    cbSpinButtonShowFastButtons: TcxCheckBox;
    gbHeaderLookAndFeel: TcxGroupBox;
    Label_Ext75: TcxLabel;
    cbHeaderLookAndFeelKind: TcxComboBox;
    cbHeaderLookAndFeelNativeStyle: TcxCheckBox;
    cbHeaderResizeUpdate: TcxCheckBox;
    Label_Ext76: TcxLabel;
    cbShellTreeViewBrowserFolder: TcxComboBox;
    Label_Ext77: TcxLabel;
    edShellTreeViewCustomPath: TcxTextEdit;
    Label_Ext78: TcxLabel;
    cbShellTreeViewOptions: TcxCheckComboBox;
    Label_Ext79: TcxLabel;
    cbShellComboBoxBrowserFolder: TcxComboBox;
    Label_Ext80: TcxLabel;
    edShellComboBoxCustomPath: TcxTextEdit;
    cbShellCombBoxDropDownSizable: TcxCheckBox;
    cbShellCombBoxRelativeNames: TcxCheckBox;
    gbTreeViewLookAndFeel: TcxGroupBox;
    Label_Ext81: TcxLabel;
    cbTreeViewLookAndFeelKind: TcxComboBox;
    cbTreeViewLookAndFeelNativeStyle: TcxCheckBox;
    gbListViewLookAndFeel: TcxGroupBox;
    Label_Ext82: TcxLabel;
    cbListViewLookAndFeelKind: TcxComboBox;
    cbListViewLookAndFeelNativeStyle: TcxCheckBox;
    Label_Ext83: TcxLabel;
    cbListViewViewStyle: TcxComboBox;
    Label_Ext84: TcxLabel;
    cbShellListViewBrowserFolder: TcxComboBox;
    Label_Ext85: TcxLabel;
    edShellListViewCustomPath: TcxTextEdit;
    Label_Ext86: TcxLabel;
    cbShellListViewOptions: TcxCheckComboBox;
    ilCheckGlyphs: TImageList;
    Label116: TcxLabel;
    cbTextEditFont: TcxFontNameComboBox;
    Label117: TcxLabel;
    cbTextEditColor: TcxColorComboBox;
    Image1: TImage;
    Label51: TcxLabel;
    edSpinEditIncrement: TcxSpinEdit;
    Label118: TcxLabel;
    edSpinEditLargeIncrement: TcxSpinEdit;
    Label119: TcxLabel;
    cbHyperLinkEditLinkColor: TcxColorComboBox;
    edHyperLinkEditStartKey: THotKey;
    Label120: TcxLabel;
    cbDBLookupComboBoxShowHeader: TcxCheckBox;
    Label69: TcxLabel;
    cbDBLookupComboGridLines: TcxComboBox;
    cbButtonColorDefault: TcxColorComboBox;
    cbButtonColorDisabled: TcxColorComboBox;
    cbButtonColorHot: TcxColorComboBox;
    cbButtonColorNormal: TcxColorComboBox;
    cbButtonColorPressed: TcxColorComboBox;
    Label70: TcxLabel;
    cbLabelFont: TcxFontNameComboBox;
    cbCheckListBoxAssignGlyph: TcxCheckBox;
    Image2: TImage;
    cbColorComboBoxAllowSelectColor: TcxCheckBox;
    Image3: TImage;
    cbHeaderDragReorder: TcxCheckBox;
    cbHeaderAllowSort: TcxCheckBox;
    cxDBNavigator1: TcxDBNavigator;
    cxDBNavigator2: TcxDBNavigator;
    tsRichEdit: TTabSheet;
    Panel_RichEdit: TPanel;
    Label121: TcxLabel;
    PanelBk_RichEdit: TPanel;
    Label122: TcxLabel;
    Label123: TcxLabel;
    Bevel35: TBevel;
    edRichScrollBars: TcxComboBox;
    cbRichPlainText: TcxCheckBox;
    cbRichSelectionBar: TcxCheckBox;
    RichEdit: TcxRichEdit;
    pcGraphics: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    pcBlob: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;

    procedure tsMaskEditShow(Sender: TObject);
    procedure cbIgnoreMaskBlankPropertiesChange(Sender: TObject);
    procedure edMaskKIndChange(Sender: TObject);
    procedure tsDBLookupComboBoxShow(Sender: TObject);
    procedure edDropDownListStylePropertiesChange(Sender: TObject);
    procedure edListFieldNameKeyPress(Sender: TObject; var Key: Char);
    procedure cbLookupRevertablePropertiesChange(Sender: TObject);
    procedure edEditMaskPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edEditMaskKeyPress(Sender: TObject; var Key: Char);
    procedure tsTextEditShow(Sender: TObject);
    procedure cbDropDownAutoSizeChage(Sender: TObject);
    procedure cbIncrementalFilteringChange(Sender: TObject);
    procedure edHAlignmentChange(Sender: TObject);
    procedure edVAlignmentChange(Sender: TObject);
    procedure edEchoModeChange(Sender: TObject);
    procedure edMaxLengthChange(Sender: TObject);
    procedure cbAutoSelectChange(Sender: TObject);
    procedure cbEnabledChange(Sender: TObject);
    procedure cbHideSelectionChange(Sender: TObject);
    procedure cbReadOnlyChange(Sender: TObject);
    procedure BFontClick(Sender: TObject);
    procedure BColorClick(Sender: TObject);
    procedure MaskEditValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure tsMemoShow(Sender: TObject);
    procedure edScrollBarsChange(Sender: TObject);
    procedure cbWantReturnsChange(Sender: TObject);
    procedure cbWantTabsChange(Sender: TObject);
    procedure cbWordWrapChange(Sender: TObject);
    procedure tsDateEditShow(Sender: TObject);
    procedure edDateOnErrorChange(Sender: TObject);
    procedure edInputKindChange(Sender: TObject);
    procedure cbTodayChange(Sender: TObject);
    procedure cbClearChange(Sender: TObject);
    procedure cbSaveTimeChange(Sender: TObject);
    procedure edPopupBorderChange(Sender: TObject);
    procedure ButtonEditButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tsButtonEditShow(Sender: TObject);
    procedure edCharCaseChange(Sender: TObject);
    procedure cbHideCursorChange(Sender: TObject);
    procedure tsCheckBoxShow(Sender: TObject);
    procedure edCaptionChange(Sender: TObject);
    procedure edNullStyleChange(Sender: TObject);
    procedure cbAllowGrayedChange(Sender: TObject);
    procedure cbFullFocusRectChange(Sender: TObject);
    procedure cbMultiLineChange(Sender: TObject);
    procedure cbUseGlyphChange(Sender: TObject);
    procedure tsImageComboBoxShow(Sender: TObject);
    procedure edDropDownRowsChange(Sender: TObject);
    procedure cbShowDescriptionsChange(Sender: TObject);
    procedure edImagePopupBorderChange(Sender: TObject);
    procedure cbImmediateDropDownChange(Sender: TObject);
    procedure tsSpinEditShow(Sender: TObject);
    procedure edMinValueChange(Sender: TObject);
    procedure edMaxValueChange(Sender: TObject);
    procedure edValueTypeChange(Sender: TObject);
    procedure cbCanEditChange(Sender: TObject);
    procedure tsComboBoxShow(Sender: TObject);
    procedure edComboDropDownRowsChange(Sender: TObject);
    procedure edComboDropDownListStyleChange(Sender: TObject);
    procedure cbRevertableChange(Sender: TObject);
    procedure edComboPopupBorderChange(Sender: TObject);
    procedure tsCalcEditShow(Sender: TObject);
    procedure cbTextEditNativeStyleChange(Sender: TObject);
    procedure cbNativeStylePropertiesChange(Sender: TObject);
    procedure edCalcPopupBorderChange(Sender: TObject);
    procedure edPrecisionChange(Sender: TObject);
    procedure cbBeepOnErrorChange(Sender: TObject);
    procedure cbQuickCloseChange(Sender: TObject);
    procedure tsHyperLinkEditShow(Sender: TObject);
    procedure cbSingleClickChange(Sender: TObject);
    procedure cbHyperLinkReadOnlyChange(Sender: TObject);
    procedure tsTimeEditShow(Sender: TObject);
    procedure edTimeFormatChange(Sender: TObject);
    procedure tsCurrencyEditShow(Sender: TObject);
    procedure edDecimalPlacesChange(Sender: TObject);
    procedure edDisplayFormatChange(Sender: TObject);
    procedure edCurrMinValueChange(Sender: TObject);
    procedure edCurrMaxValueChange(Sender: TObject);
    procedure cbUseThousandSeparatorChange(Sender: TObject);
    procedure edPopupAlignmentChange(Sender: TObject);
    procedure ImageCustomClick(Sender: TObject);
    procedure tsImageShow(Sender: TObject);
    procedure edCustomFilterChange(Sender: TObject);
    procedure edTransparencyChange(Sender: TObject);
    procedure cbCenterChange(Sender: TObject);
    procedure cbStretchChange(Sender: TObject);
    procedure MenuItemsChange(Sender: TObject);
    procedure edCustomButtonCaptionChange(Sender: TObject);
    procedure edCustomButtonGlyphPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tsBlobEditShow(Sender: TObject);
    procedure edBlobEditKindChange(Sender: TObject);
    procedure edBlobPaintStyleChange(Sender: TObject);
    procedure cbAlwaysSaveDataChange(Sender: TObject);
    procedure edBlobMemoScrollBarsChange(Sender: TObject);
    procedure edBlobMemoMaxLengthChange(Sender: TObject);
    procedure edBlobMemoCharCaseChange(Sender: TObject);
    procedure cbBlobMemoWantReturnsChange(Sender: TObject);
    procedure cbBlobMemoWantTabsChange(Sender: TObject);
    procedure cbBlobMemoWordWrapChange(Sender: TObject);
    procedure edPictureFilterChange(Sender: TObject);
    procedure edPictureTranparencyChange(Sender: TObject);
    procedure cbShowExPopupItemsChange(Sender: TObject);
    procedure cbShowPicturePopupChange(Sender: TObject);
    procedure tsMRUEditShow(Sender: TObject);
    procedure seMaxItemCountChange(Sender: TObject);
    procedure cbShowEllipsisChange(Sender: TObject);
    procedure MRUEditButtonClick(Sender: TObject);
    procedure tsPopupEditShow(Sender: TObject);
    procedure pePopupAlignmentChange(Sender: TObject);
    procedure edPopUpWidthChange(Sender: TObject);
    procedure edPopUpHeightChange(Sender: TObject);
    procedure edPopUpMinWidthChange(Sender: TObject);
    procedure edPopupMinHeightChange(Sender: TObject);
    procedure cbPopupAutoSizeChange(Sender: TObject);
    procedure cbPopupSizeableChange(Sender: TObject);
    procedure pePopupBorderStyleChange(Sender: TObject);
    procedure cbPopupClientEdgeChange(Sender: TObject);
    procedure cbPopupSysPanelStyleChange(Sender: TObject);
    procedure cbShowTimeClick(Sender: TObject);
    procedure tsButtonShow(Sender: TObject);
    procedure cbButtonIsNativeClick(Sender: TObject);
    procedure cbButtonLookAndFeelPropertiesChange(Sender: TObject);
    procedure cbButtonEnabledClick(Sender: TObject);
    procedure cbButtonDefaultClick(Sender: TObject);
    procedure tsDBExtLookupComboBoxShow(Sender: TObject);
    procedure btnViewLayoutEditClick(Sender: TObject);
    procedure edExtLookupDropDownListStylePropertiesChange(
      Sender: TObject);
    procedure cbExtLookupComboFocusPopupClick(Sender: TObject);
    procedure cbExtLookupComboRevertableClick(Sender: TObject);
    procedure cbExtLookupComboDropDownAutoSizeClick(Sender: TObject);
    procedure cbExtLookupComboIncrementalFilteringClick(Sender: TObject);
    procedure tsListBoxShow(Sender: TObject);
    procedure edComboPopupBorderPropertiesChange(Sender: TObject);
    procedure cbListBoxBorderStylePropertiesChange(Sender: TObject);
    procedure cbListBoxHotTrackClick(Sender: TObject);
    procedure cbListBoxShadowClick(Sender: TObject);
    procedure tsRadioGroupShow(Sender: TObject);
    procedure seRadioGroupColumnCountPropertiesChange(Sender: TObject);
    procedure cbRadioGroupHotTrackClick(Sender: TObject);
    procedure cbRadioGroupShadowClick(Sender: TObject);
    procedure edTimeEditUse24HourFormatClick(Sender: TObject);
    procedure edSpinButtonsPositionPropertiesChange(Sender: TObject);
    procedure cbShowFastButtonPropertiesChange(Sender: TObject);

    procedure tsLabelShow(Sender: TObject);
    procedure tsTrackBarShow(Sender: TObject);
    procedure tsColorComboBoxShow(Sender: TObject);
    procedure tsFontNameComboBoxShow(Sender: TObject);
    procedure tsCheckComboBoxShow(Sender: TObject);
    procedure tsGroupBoxShow(Sender: TObject);
    procedure tsMCListBoxShow(Sender: TObject);
    procedure tsSplitterShow(Sender: TObject);
    procedure spAnglePropertiesEditValueChanged(Sender: TObject);
    procedure spDepthPropertiesEditValueChanged(Sender: TObject);
    procedure spPenWidthPropertiesEditValueChanged(Sender: TObject);
    procedure cbLabelEffectPropertiesEditValueChanged(Sender: TObject);
    procedure cbLabelStylePropertiesEditValueChanged(Sender: TObject);
    procedure cbOrientationPropertiesEditValueChanged(Sender: TObject);
    procedure tsProgressBarShow(Sender: TObject);
    procedure spProgressBarPositionPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbProgressBarShowPeackPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbProgressBarPeackColorPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbProgressBarStylePropertiesEditValueChanged(
      Sender: TObject);
    procedure cxColorComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure cxColorComboBox2PropertiesEditValueChanged(Sender: TObject);
    procedure cbProgressBarShowTextPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbProgressBarShowTextStylePropertiesEditValueChanged(
      Sender: TObject);
    procedure spTrackBarPositionPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbTrackBarTickTypePropertiesEditValueChanged(
      Sender: TObject);
    procedure cbTrackBarShowTickPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbTrackBarShowTrackPropertiesEditValueChanged(
      Sender: TObject);
    procedure tsCheckListBoxShow(Sender: TObject);
    procedure cbColorComboDefaultColorStylePropertiesEditValueChanged(
      Sender: TObject);
    procedure cbColorComboNamingConventionPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbColorComboShowDescriptionPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbFontComboDropDownSizablePropertiesEditValueChanged(
      Sender: TObject);
    procedure edCheckComboDelimiterPropertiesEditValueChanged(
      Sender: TObject);
    procedure rgSplitterHotZoneClick(Sender: TObject);
    procedure cxLabelUseGlyphClick(Sender: TObject);
    procedure cbTrackBarAutoSizePropertiesChange(Sender: TObject);
    procedure cbTrackBarThumbColorPropertiesChange(Sender: TObject);
    procedure cbTrackBarThumbHighLightColorPropertiesChange(
      Sender: TObject);
    procedure cbTrackBarTrackColorPropertiesChange(Sender: TObject);
    procedure spTrackBarThumbWidthPropertiesChange(Sender: TObject);
    procedure spTrackBarTrackWidthPropertiesChange(Sender: TObject);
    procedure spCheckListBoxColumnsPropertiesChange(Sender: TObject);
    procedure icCheckComboBoxGlyphPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbCheckListBoxAllowedGrayedPropertiesChange(Sender: TObject);
    procedure cbCheckListBoxSortedPropertiesChange(Sender: TObject);
    procedure cbCheckListBoxLookAndFeelKindPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbCheckListBoxLookAndFeelNativeStylePropertiesChange(
      Sender: TObject);
    procedure edColorComboBoxDefaultDescriptionPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cbColorComboBoxColorValueFormatPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbColorComboBoxColorBoxAlignPropertiesEditValueChanged(
      Sender: TObject);
    procedure edColorComboBoxDefaultDescriptionPropertiesChange(
      Sender: TObject);
    procedure cbColorComboBoxDropDownSizablePropertiesChange(
      Sender: TObject);
    procedure cbFontNameComboBoxFontTypesPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbFontNameComboBoxPreivewTypePropertiesEditValueChanged(
      Sender: TObject);
    procedure edFontNameComboBoxPreviewTextPropertiesChange(
      Sender: TObject);
    procedure cbFontNameComboBoxShowFontTypeIconPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbFontNameComboBoxPreviewShowButtonsPropertiesChange(
      Sender: TObject);
    procedure cbFontNameComboBoxPreviewVisiblePropertiesChange(
      Sender: TObject);
    procedure cbFontNameComboBoxUseOwnFontPropertiesChange(
      Sender: TObject);
    procedure cbFontNameComboBoxButtonBitmapPropertiesChange(
      Sender: TObject);
    procedure cbCheckComboBoxGlyphPropertiesEditValueChanged(
      Sender: TObject);
    procedure edCheckListBoxEmptySelectionTextPropertiesChange(
      Sender: TObject);
    procedure cbCheckListBoxDropDownSizablePropertiesChange(
      Sender: TObject);
    procedure cbGroupBoxAlignmentPropertiesEditValueChanged(
      Sender: TObject);
    procedure edGroupBoxCaptionPropertiesChange(Sender: TObject);
    procedure cbGroupBoxCaptionBackColorPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbGroupBoxColorPropertiesEditValueChanged(Sender: TObject);
    procedure cbMCListBoxShowColumnLinesPropertiesChange(Sender: TObject);
    procedure cbCMListBoxShowEndEllipsisPropertiesChange(Sender: TObject);
    procedure cbMCListBoxSortedPropertiesChange(Sender: TObject);
    procedure cbMCListBoxOverflowEmptyColumnPropertiesChange(
      Sender: TObject);
    procedure cbMCListBoxMultilinesPropertiesChange(Sender: TObject);
    procedure cbMCListBoxMultiSelectPropertiesChange(Sender: TObject);
    procedure cbMCListBoxHeaderDragReorderPropertiesChange(
      Sender: TObject);
    procedure cbMCListBoxItemsPropertiesChange(Sender: TObject);
    procedure edMCListBoxDelimiterPropertiesChange(Sender: TObject);
    procedure cbSlitterAllowHotZoneDragPropertiesChange(Sender: TObject);
    procedure edSplitterHotZoneSizePercentPropertiesChange(
      Sender: TObject);
    procedure cbSplitterAutoSnapPropertiesChange(Sender: TObject);
    procedure cbSplitterResizeUpdatePropertiesChange(Sender: TObject);
    procedure tsHintStyleControllerShow(Sender: TObject);
    procedure tsSpinButtonShow(Sender: TObject);
    procedure tsHeaderShow(Sender: TObject);
    procedure tsShellTreeViewShow(Sender: TObject);
    procedure tsShellListViewShow(Sender: TObject);
    procedure tsTreeViewShow(Sender: TObject);
    procedure tsShellComboBoxShow(Sender: TObject);
    procedure cbHintStyleControllerIconTypePropertiesEditValueChanged(
      Sender: TObject);
    procedure cbHintStyleControllerIconSizePropertiesEditValueChanged(
      Sender: TObject);
    procedure cbHintStyleControllerCallOutPositionPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbHintStyleControllerColorPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbHintStyleControllerRoundedPropertiesChange(
      Sender: TObject);
    procedure cbHintStyleControllerStandardPropertiesChange(
      Sender: TObject);
    procedure cbHintStyleControllerAnimatePropertiesEditValueChanged(
      Sender: TObject);
    procedure edSpinButtonIncrementPropertiesChange(Sender: TObject);
    procedure edSpinButtonLargeIncrementPropertiesChange(Sender: TObject);
    procedure cbSpinButtonPositionPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbSpinButtonShowFastButtonsPropertiesChange(Sender: TObject);
    procedure cbHeaderResizeUpdatePropertiesChange(Sender: TObject);
    procedure cbShellTreeViewBrowserFolderPropertiesEditValueChanged(
      Sender: TObject);
    procedure edShellTreeViewCustomPathPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbShellTreeViewOptionsPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbShellComboBoxBrowserFolderPropertiesEditValueChanged(
      Sender: TObject);
    procedure edShellComboBoxCustomPathPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbShellCombBoxDropDownSizablePropertiesChange(
      Sender: TObject);
    procedure cbShellCombBoxRelativeNamesPropertiesChange(Sender: TObject);
    procedure tsListViewShow(Sender: TObject);
    procedure cbListViewViewStylePropertiesEditValueChanged(
      Sender: TObject);
    procedure cbShellListViewBrowserFolderPropertiesEditValueChanged(
      Sender: TObject);
    procedure edShellListViewCustomPathPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbShellListViewOptionsPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbTextEditFontPropertiesEditValueChanged(Sender: TObject);
    procedure cbTextEditColorPropertiesEditValueChanged(Sender: TObject);
    procedure edSpinEditIncrementPropertiesChange(Sender: TObject);
    procedure edSpinEditLargeIncrementPropertiesChange(Sender: TObject);
    procedure cbHyperLinkEditLinkColorPropertiesEditValueChanged(
      Sender: TObject);
    procedure edHyperLinkEditStartKeyChange(Sender: TObject);
    procedure cbDBLookupComboBoxShowHeaderPropertiesChange(
      Sender: TObject);
    procedure cbDBLookupComboGridLinesPropertiesChange(Sender: TObject);
    procedure cbButtonColorDefaultPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbButtonColorDisabledPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbButtonColorHotPropertiesEditValueChanged(Sender: TObject);
    procedure cbButtonColorNormalPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbButtonColorPressedPropertiesEditValueChanged(
      Sender: TObject);
    procedure cbButtonFontPropertiesEditValueChanged(Sender: TObject);
    procedure cbCheckListBoxAssignGlyphPropertiesChange(Sender: TObject);
    procedure cbColorComboBoxAllowSelectColorPropertiesChange(
      Sender: TObject);
    procedure cbHeaderDragReorderPropertiesChange(Sender: TObject);
    procedure cbHeaderAllowSortPropertiesChange(Sender: TObject);
    procedure tsRichEditShow(Sender: TObject);
    procedure edRichScrollBarPropertiesChange(Sender: TObject);
    procedure cbRichPlainTextPropertiesChange(Sender: TObject);
    procedure cbRichSelectionBarPropertiesChange(Sender: TObject);

  private
    { Private declarations }
    fmPopupTree: TfmPopupTree;
    fmPreview: TfmPreview;
    FButtonArray: Array[0..ButtonCount-1] of TcxButton;

    FHintStyleController: TcxHintStyleController;
    FShellTreeView: TcxShellTreeView;
    FShellListView: TcxShellListView;
    FShellComboBox: TcxShellComboBox;

    procedure UpdateTrackBarThumbProperties;
    function GetHintStyle: TcxHintStyle;
    function GetRichEditText: string;
  protected
    function GetHint: string; override;
    procedure SetCaption(Value: TCaption); override;

    procedure InitForm; override;
    procedure InitTypInfoComboBoxes; override;
    procedure CreatePageInfos; override;
    procedure DoCreatePageInfo(AImageIndex: Integer; ACaption, ADescription: string); override;
    procedure LookAndFeelChanged; override;
    function HintStyleController: TcxHintStyleController;
    function ShellTreeView: TcxShellTreeView;
    function ShellListView: TcxShellListView;
    function ShellComboBox: TcxShellComboBox;

    procedure edHAligmentSetImages;
    procedure edVAligmentSetImages;

    property HintStyle: TcxHintStyle read GetHintStyle;
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}
{$R *.res}

uses
  dxFrames, FrameIDs, cxGridDemoUtils, TypInfo, maindata,
  uStrsConst, cxLookupGrid;

procedure FillTypeSetInfoCombo(ACombo: TcxCheckComboBox; AInstance: TObject; APropName: string);
var
  APropInfo: PPropInfo;
  ATypeData: PTypeData;
  ATypeInfo: PTypeInfo;
  I: Integer;
begin
  APropInfo := GetPropInfo(AInstance.ClassType, APropName);
  if (APropInfo <> nil) and (APropInfo.PropType <> nil) then
  begin
    ATypeData := GetTypeData(APropInfo.PropType^);
    if ATypeData <> nil then
    begin
      ATypeInfo := ATypeData.CompType^;
      ATypeData := GetTypeData(ATypeInfo);
      for I := ATypeData^.MinValue to ATypeData^.MaxValue do
        ACombo.Properties.Items.AddCheckItem(GetEnumName(ATypeInfo, I));
    end;
  end;
end;

procedure FillObjectBooleanInfoCombo(ACombo: TcxCheckComboBox; AInstance: TObject);
var
  APropList: PPropList;
  ACount, I: Integer;
begin
  ACount := GetPropList(AInstance, APropList);
  TypInfo.SortPropList(APropList, ACount);
  for I := 0 to ACount - 1 do
     if APropList^[I].PropType^.Kind = tkEnumeration then
       ACombo.Properties.Items.AddCheckItem(APropList^[I].Name);
end;


procedure SetCheckComboBoxValue(ACombo: TcxCheckComboBox; AObject: TObject; APropName: string);
var
  I: Integer;
  st: string;
begin
  st := GetSetProp(AObject, APropName);
  for I := 0 to ACombo.Properties.Items.Count - 1 do
     if(Pos(ACombo.Properties.Items[I].Description, st) > 0) then
       ACombo.SetItemState(I, cbsChecked)
     else ACombo.SetItemState(I, cbsUnchecked);
end;

procedure SetCheckComboBoxValueToObjectValue(ACombo: TcxCheckComboBox; AObject: TObject);
var
  I: Integer;
begin
  for I := 0 to ACombo.Properties.Items.Count - 1 do
    if( ACombo.GetItemState(I) = cbsChecked) then
      TypInfo.SetEnumProp(AObject, ACombo.Properties.Items[I].Description, 'True')
    else TypInfo.SetEnumProp(AObject, ACombo.Properties.Items[I].Description, 'False');
end;

procedure SetObjectValueToCheckComboBoxValue(ACombo: TcxCheckComboBox; AObject: TObject);
var
  I: Integer;
  ASt: string;
begin
  for I := 0 to ACombo.Properties.Items.Count - 1 do
  begin
    ASt := TypInfo.GetEnumProp(AObject, ACombo.Properties.Items[I].Description);
    if CompareText('True', ASt) = 0 then
       ACombo.SetItemState(I, cbsChecked)
     else ACombo.SetItemState(I, cbsUnchecked);
  end;
end;


procedure TframeEditorsProperties.CreatePageInfos;
begin
  CreatePageInfo(0, Edit, tsTextEdit, tsTextEditShow, 'Express Standard Edit', sdxTextEditInfo, eeBoth);
  CreatePageInfo(1, MaskEdit, tsMaskEdit, tsMaskEditShow, 'Express Mask Edit', sdxMaskEditInfo, eeBoth);
  CreatePageInfo(2, Memo, tsMemo, tsMemoShow, 'Express Memo Edit', sdxMemoEditInfo, eeBoth);
  CreatePageInfo(40, RichEdit, tsRichEdit, tsRichEditShow, 'Express RichEdit Edit', sdxRichEditInfo, eeBoth);
  CreatePageInfo(3, DateEdit, tsDateEdit, tsDateEditShow, 'Express Date Edit', sdxDateEditInfo, eeBoth);
  CreatePageInfo(4, ButtonEdit, tsButtonEdit, tsButtonEditShow, 'Express Button Edit', sdxButtonEditInfo, eeBoth);
  CreatePageInfo(5, CheckBox, tsCheckBox, tsCheckBoxShow, 'Express Check Box', sdxCheckEditInfo, eeBoth);
  CreatePageInfo(6, ImageComboBox, tsImageComboBox, tsImageComboBoxShow, 'Express Image ComboBox', sdxImageComboBxoInfo, eeBoth);
  CreatePageInfo(7, SpinEdit, tsSpinEdit, tsSpinEditShow, 'Express Spin Edit', sdxSpinEditInfo, eeBoth);
  CreatePageInfo(8, ComboBox, tsComboBox, tsComboBoxShow, 'Express Combo Box', sdxComboBoxInfo, eeBoth);
  CreatePageInfo(9, CalcEdit, tsCalcEdit, tsCalcEditShow, 'Express Calculator Edit', sdxCalculatorEditInfo, eeBoth);
  CreatePageInfo(10, HyperLinkEdit, tsHyperLinkEdit, tsHyperLinkEditShow, 'Express HyperLink Edit', sdxHyperLinkEditInfo, eeBoth);
  CreatePageInfo(11, TimeEdit, tsTimeEdit, tsTimeEditShow, 'Express Time Edit', sdxTimeEditInfo, eeBoth);
  CreatePageInfo(12, CurrencyEdit, tsCurrencyEdit, tsCurrencyEditShow, 'Express Currency Edit', sdxCurrencyEditInfo, eeBoth);
  CreatePageInfo(13, Image, tsImage, tsImageShow, 'Express Image', sdxImageEditInfo, eeBoth);
  CreatePageInfo(14, BlobEdit, tsBlobEdit, tsBlobEditShow, 'Express BLOB Edit', sdxBlobEditInfo, eeBoth);
  CreatePageInfo(15, MRUEdit, tsMRUEdit, tsMRUEditShow, 'Express MRU Edit', sdxMRUEditInfo, eeBoth);
  CreatePageInfo(16, PopupEdit, tsPopupEdit, tsPopupEditShow, 'Express Popup Edit', sdxPopupEditInfo, eeBoth);
  CreatePageInfo(17, DBLookupComboBox, tsDBLookupComboBox, tsDBLookupComboBoxShow, 'Express DB Lookup ComboBox', sdxLookupComboBoxEditInfo, eeBoth);
  CreatePageInfo(18, DBExtLookupComboBox, tsDBExtLookupComboBox, tsDBExtLookupComboBoxShow, 'Express DB ExtLookup ComboBox', sdxExtLookupComboBoxEditInfo, eeBoth);
  CreatePageInfo(19, ListBox, tsListBox, tsListBoxShow, 'Express ListBox', sdxListBoxInfo, eeNonDB);
  CreatePageInfo(20, RadioGroup, tsRadioGroup, tsRadioGroupShow, 'Express RadioGroup', sdxRadioGroupInfo, eeBoth);
  CreatePageInfo(21, cxButton, tsButton, tsButtonShow, 'Express Button', sdxButtonInfo, eeNone);

  ListView.Items.Clear;
  CreatePageInfo(22, cxLabel, tsLabel , tsLabelShow, 'Express Label', sdxLabelInfo, eeBoth);
  CreatePageInfo(23, ProgressBar, tsProgressBar , tsProgressBarShow, 'Express ProgressBar', sdxProgressBarInfo, eeBoth);
  CreatePageInfo(24, TrackBar, tsTrackBar , tsTrackBarShow, 'Express TrackBar', sdxTrackBarInfo, eeBoth);
  CreatePageInfo(25, CheckListBox, tsCheckListBox , tsCheckListBoxShow, 'Express CheckListBox', sdxCheckListBoxInfo, eeBoth);
  CreatePageInfo(26, ColorComboBox, tsColorComboBox , tsColorComboBoxShow, 'Express ColorComboBox', sdxColorComboBoxInfo, eeNonDB);
  CreatePageInfo(27, FontNameComboBox, tsFontNameComboBox , tsFontNameComboBoxShow, 'Express FontNameComboBox', sdxFontNameComboBoxInfo, eeNonDB);
  CreatePageInfo(28, CheckComboBox, tsCheckComboBox , tsCheckComboBoxShow, 'Express CheckComboBox', sdxCheckComboBoxInfo, eeBoth);
  CreatePageInfo(29, GroupBox, tsGroupBox , tsGroupBoxShow, 'Express GroupBox', sdxGroupBoxInfo, eeNonDB);
  CreatePageInfo(30, MCListBox, tsMCListBox , tsMCListBoxShow, 'Express MCListBox', sdxMCListBoxInfo, eeNonDB);
  CreatePageInfo(31, Splitter, tsSplitter , tsSplitterShow, 'Express Splitter', sdxSplitterInfo, eeNonDB);
  CreatePageInfo(32, HintStyleController, tsHintStyleController , tsHintStyleControllerShow, 'Express HintStyleController', sdxHintStyleController, eeNonDB);
  CreatePageInfo(33, SpinButton, tsSpinButton , tsSpinButtonShow, 'Express SpinButton', sdxSpinButtonInfo, eeNonDB);
  CreatePageInfo(34, Header, tsHeader , tsHeaderShow, 'Express Header', sdxHeaderInfo, eeNonDB);
  CreatePageInfo(35, nil, tsShellTreeView , tsShellTreeViewShow, 'Express ShellTreeView', sdxShellTreeViewInfo, eeNonDB);
  CreatePageInfo(36, nil, tsShellListView , tsShellListViewShow, 'Express ShellListView', sdxShellListViewInfo, eeNonDB);
  CreatePageInfo(37, nil, tsShellComboBox , tsShellComboBoxShow, 'Express ShellComboBox', sdxShellComboBoxInfo, eeBoth);
  CreatePageInfo(38, TreeView, tsTreeView , tsTreeViewShow, 'Express TreeView', sdxTreeViewInfo, eeNonDB);
  CreatePageInfo(39, ListView, tsListView , tsListViewShow, 'Express ListView', sdxListViewInfo, eeNonDB);

end;

procedure TframeEditorsProperties.DoCreatePageInfo(AImageIndex: Integer; ACaption, ADescription: string);
var
  AItem: TListItem;
begin
  AItem := ListView.Items.Add;
  AItem.ImageIndex := AImageIndex;
  AItem.Caption := ACaption;
  AItem.SubItems.Add(ADescription);
end;

procedure TframeEditorsProperties.LookAndFeelChanged;
begin
  inherited LookAndFeelChanged;
  edImagePopupBorder.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;
  edComboPopupBorder.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;
  pePopupBorderStyle.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;

  cbProgressBarBeginColor.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;
  cbProgressBarEndColor.Enabled := cbProgressBarBeginColor.Enabled;

  cbCheckListBoxLookAndFeelNativeStyle.Checked := RootLookAndFeel.NativeStyle;
  cbCheckListBoxLookAndFeelKind.ItemIndex := Integer(RootLookAndFeel.Kind);
  cbCheckListBoxLookAndFeelKind.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;

  cbCheckComboBoxLookAndFeelNativeStyle.Checked := RootLookAndFeel.NativeStyle;
  cbCheckComboBoxLookAndFeelKind.ItemIndex := Integer(RootLookAndFeel.Kind);
  cbCheckComboBoxLookAndFeelKind.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;

  cbCheckComboBoxLookAndFeelNativeStyle.Checked := RootLookAndFeel.NativeStyle;
  cbMCListBoxLookAndFeelKind.ItemIndex := Integer(RootLookAndFeel.Kind);
  cbMCListBoxLookAndFeelKind.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;

  cbMCListBoxLookAndFeelNativeStyle.Checked := RootLookAndFeel.NativeStyle;
  cbHeaderLookAndFeelKind.ItemIndex := Integer(RootLookAndFeel.Kind);
  cbHeaderLookAndFeelKind.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;

  cbHeaderLookAndFeelNativeStyle.Checked := RootLookAndFeel.NativeStyle;
  cbTreeViewLookAndFeelKind.ItemIndex := Integer(RootLookAndFeel.Kind);
  cbTreeViewLookAndFeelKind.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;

  cbTreeViewLookAndFeelNativeStyle.Checked := RootLookAndFeel.NativeStyle;
  cbTreeViewLookAndFeelKind.ItemIndex := Integer(RootLookAndFeel.Kind);
  cbTreeViewLookAndFeelKind.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;

  cbListViewLookAndFeelNativeStyle.Checked := RootLookAndFeel.NativeStyle;
  cbListViewLookAndFeelKind.ItemIndex := Integer(RootLookAndFeel.Kind);
  cbListViewLookAndFeelKind.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;
end;

type
  TcxHintStyleControllerAccess = class(TcxHintStyleController);

function TframeEditorsProperties.HintStyleController: TcxHintStyleController;
begin
  if FHintStyleController = nil then
  begin
    FHintStyleController := TcxHintStyleController.Create(Application.MainForm);
    HintStyle.Rounded := True;
    HintStyle.Animate := cxhaHide;
    HintStyle.Color := clInfoBk;
    HintStyle.CallOutPosition := cxbpAuto;
    TcxHintStyleControllerAccess(FHintStyleController).Loaded;
  end;
  Result := FHintStyleController;
end;

{ TframeEditorsProperties }

function TframeEditorsProperties.GetHint: string;
begin
  Result := sdxFrameEditorsPropertiesHint;
end;

procedure TframeEditorsProperties.SetCaption(Value: TCaption);
begin
  {$IFDEF TREELIST4}
  inherited SetCaption(sdxFrameEditorsPropertiesTreeListCaption);
  {$ELSE}
    {$IFDEF VERTICALGRID}
    inherited SetCaption(sdxFrameEditorsPropertiesVerticalGridCaption);
    {$ELSE}
    inherited SetCaption(sdxFrameEditorsPropertiesCaption);
    {$ENDIF}
  {$ENDIF}
end;

procedure TframeEditorsProperties.InitForm;
begin
  inherited InitForm;
  FButtonArray[0] := cxButton;
  FButtonArray[1] := cxButton1;
  FButtonArray[2] := cxButton2;
  FButtonArray[3] := cxButton3;

  LookAndFeelChanged;
  ColorComboBox.PrepareX11OrderedColorList(True, True);
  FontNameComboBox.FontName := 'Arial';
end;

procedure TframeEditorsProperties.InitTypInfoComboBoxes;
begin
  FillTypeInfoCombo(edEchoMode, Edit.Properties, 'EchoMode');
  FillTypeInfoCombo(edMaskKind, MaskEdit.Properties, 'MaskKind');
  FillTypeInfoCombo(edDropDownListStyle, DBLookupComboBox.Properties, 'DropDownListStyle');
  FillTypeInfoCombo(cbDBLookupComboGridLines, DBLookupComboBox.Properties.ListOptions, 'GridLines');
  FillTypeInfoCombo(edExtLookupDropDownListStyle, DBExtLookupComboBox.Properties, 'DropDownListStyle');
  FillTypeInfoCombo(edScrollBars, Memo.Properties, 'ScrollBars');
  FillTypeInfoCombo(edRichScrollBars, RichEdit.Properties, 'ScrollBars');
  FillTypeInfoCombo(edDateOnError, DateEdit.Properties, 'DateOnError');
  FillTypeInfoCombo(edInputKind, DateEdit.Properties, 'InputKind');
  FillTypeInfoCombo(edImagePopupBorder, ImageComboBox.Style, 'PopupBorderStyle');
  FillTypeInfoCombo(edPopupBorder, DateEdit.Style, 'PopupBorderStyle');
  FillTypeInfoCombo(edCharCase, ButtonEdit.Properties, 'CharCase');
  FillTypeInfoCombo(edValueType, SpinEdit.Properties, 'ValueType');
  FillTypeInfoCombo(edSpinButtonsPosition, SpinEdit.Properties.SpinButtons, 'Position');
  FillTypeInfoCombo(edComboPopupBorder, ComboBox.Style, 'PopupBorderStyle');
  FillTypeInfoCombo(cbListBoxBorderStyle, ListBox.Style, 'BorderStyle');
  FillTypeInfoCombo(edComboDropDownListStyle, ComboBox.Properties, 'DropDownListStyle');
  FillTypeInfoCombo(edCalcPopupBorder, CalcEdit.Style, 'PopupBorderStyle');
  FillTypeInfoCombo(edTimeFormat, TimeEdit.Properties, 'TimeFormat');
  FillTypeInfoCombo(edTransparency, Image.Properties, 'GraphicTransparency');
  FillTypeInfoCombo(edPopupAlignment, ComboBox.Properties, 'PopupAlignment');
  FillTypeInfoCombo(edBlobMemoScrollBars, BlobEdit.Properties, 'MemoScrollBars');
  FillTypeInfoCombo(edBlobMemoCharCase, BlobEdit.Properties, 'MemoCharCase');
  FillTypeInfoCombo(edPictureTranparency, BlobEdit.Properties, 'PictureTransparency');
  FillTypeInfoCombo(edBlobEditKind, BlobEdit.Properties, 'BlobEditKind');
  FillTypeInfoCombo(edBlobPaintStyle, BlobEdit.Properties, 'BlobPaintStyle');
  FillTypeInfoCombo(pePopupAlignment, PopupEdit.Properties, 'PopupAlignment');
  FillTypeInfoCombo(pePopupBorderStyle, PopupEdit.Style, 'PopupBorderStyle');
  FillTypeInfoCombo(cbButtonLookAndFeel, cxButton.LookAndFeel, 'Kind');

  
  FillTypeInfoCombo(cbLabelEffect, cxLabel.Properties, 'LabelEffect');
  FillTypeInfoCombo(cbLabelStyle, cxLabel.Properties, 'LabelStyle');
  FillTypeInfoCombo(cbLabelOrientation, cxLabel.Properties, 'Orientation');
  FillTypeInfoCombo(cbProgressBarStyle, ProgressBar.Properties, 'BarStyle');
  FillTypeInfoCombo(cbProgressBarShowTextStyle, ProgressBar.Properties, 'ShowTextStyle');
  FillTypeInfoCombo(cbTrackBarTickType, TrackBar.Properties, 'TickType');
  FillTypeInfoCombo(cbColorComboDefaultColorStyle, ColorComboBox.Properties, 'DefaultColorStyle');
  FillTypeInfoCombo(cbColorComboNamingConvention, ColorComboBox.Properties, 'NamingConvention');
  FillTypeInfoCombo(cbCheckListBoxLookAndFeelKind, RootLookAndFeel, 'Kind');
  FillTypeInfoCombo(cbColorComboBoxColorValueFormat, ColorComboBox.Properties, 'ColorValueFormat');
  FillTypeInfoCombo(cbColorComboBoxColorBoxAlign, ColorComboBox.Properties, 'ColorBoxAlign');
  FillTypeSetInfoCombo(cbFontNameComboBoxFontTypes, FontNameComboBox.Properties, 'FontTypes');
  FillTypeInfoCombo(cbFontNameComboBoxPreivewType, FontNameComboBox.Properties.FontPreview, 'PreviewType');
  FillTypeSetInfoCombo(cbFontNameComboBoxShowFontTypeIcon, FontNameComboBox.Properties, 'ShowFontTypeIcon');
  FillTypeInfoCombo(cbCheckComboBoxLookAndFeelKind, RootLookAndFeel, 'Kind');
  FillTypeInfoCombo(cbGroupBoxAlignment, GroupBox, 'Alignment');
  FillTypeInfoCombo(cbMCListBoxLookAndFeelKind, RootLookAndFeel, 'Kind');
  FillTypeInfoCombo(cbHintStyleControllerIconType, HintStyleController.HintStyle, 'IconType');
  FillTypeInfoCombo(cbHintStyleControllerIconSize, HintStyleController.HintStyle, 'IconSize');
  FillTypeInfoCombo(cbHintStyleControllerCallOutPosition, HintStyleController.HintStyle, 'CallOutPosition');
  FillTypeInfoCombo(cbHintStyleControllerAnimate, HintStyleController.HintStyle, 'Animate');
  FillTypeInfoCombo(cbSpinButtonPosition, SpinButton.Properties.SpinButtons, 'Position');
  FillTypeInfoCombo(cbHeaderLookAndFeelKind, RootLookAndFeel, 'Kind');
  FillTypeInfoCombo(cbListViewLookAndFeelKind, RootLookAndFeel, 'Kind');
  FillTypeInfoCombo(cbTreeViewLookAndFeelKind, RootLookAndFeel, 'Kind');
  FillTypeInfoCombo(cbListViewViewStyle, ListView, 'ViewStyle');
end;


// Form Events

constructor TframeEditorsProperties.Create(AComponent: TComponent);
begin
  inherited Create(AComponent);

  fmPopupTree := TfmPopupTree.Create(nil);
  fmPreview := TfmPreview.Create(nil);
  fmPopupTree.PopupEdit := PopupEdit;
  PopupEdit.Properties.PopupControl := fmPopupTree.pnPopupControl;
end;

destructor TframeEditorsProperties.Destroy;
begin
  fmPopupTree.Free;
  fmPreview.Free;

  inherited Destroy;
end;


procedure TframeEditorsProperties.tsMaskEditShow(Sender: TObject);
begin
  edEditMask.Text := MaskEdit.Properties.EditMask;
  cbIgnoreMaskBlank.Checked := MaskEdit.Properties.IgnoreMaskBlank;
  edMaskKind.ItemIndex := Integer(MaskEdit.Properties.MaskKind);
end;

procedure TframeEditorsProperties.cbIgnoreMaskBlankPropertiesChange(
  Sender: TObject);
begin
  MaskEdit.Properties.IgnoreMaskBlank := cbIgnoreMaskBlank.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edMaskKIndChange(Sender: TObject);
begin
  MaskEdit.Properties.MaskKind := TcxEditMaskKind(edMaskKind.ItemIndex);
  edEditMask.Text := MaskEdit.Properties.EditMask;
  RefreshObjectInspector;
end;

// TcxDBLookupComboBox

procedure TframeEditorsProperties.tsDBLookupComboBoxShow(Sender: TObject);
begin
  edListFieldName.Text := DBLookupComboBox.Properties.ListFieldNames;
  edDropDownListStyle.ItemIndex := Integer(DBLookupComboBox.Properties.DropDownListStyle);
  cbDBLookupComboGridLines.ItemIndex := Integer(DBLookupComboBox.Properties.ListOptions.GridLines);
  cbLookupRevertable.Checked := DBLookupComboBox.Properties.Revertable;
  cbDropDownAutoSize.Checked := DBLookupComboBox.Properties.DropDownAutoSize;
  cbIncrementalFiltering.Checked := DBLookupComboBox.Properties.IncrementalFiltering;
  cbDBLookupComboBoxShowHeader.Checked  := DBLookupComboBox.Properties.ListOptions.ShowHeader;
end;

procedure TframeEditorsProperties.edDropDownListStylePropertiesChange(
  Sender: TObject);
begin
  DBLookupComboBox.Properties.DropDownListStyle := TcxEditDropDownListStyle(edDropDownListStyle.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edListFieldNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
        DBLookupComboBox.Properties.ListFieldNames := edListFieldName.Text;
        RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbLookupRevertablePropertiesChange(
  Sender: TObject);
begin
  DBLookupComboBox.Properties.Revertable := cbLookupRevertable.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbDBLookupComboBoxShowHeaderPropertiesChange(
  Sender: TObject);
begin
  DBLookupComboBox.Properties.ListOptions.ShowHeader := cbDBLookupComboBoxShowHeader.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbDBLookupComboGridLinesPropertiesChange(
  Sender: TObject);
begin
  DBLookupComboBox.Properties.ListOptions.GridLines := TcxGridLines(cbDBLookupComboGridLines.ItemIndex);
  RefreshObjectInspector;
end;


procedure TframeEditorsProperties.edEditMaskPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  with TcxEditMaskEditorDlg.Create(Application) do begin
    MaskEditProperties := TcxCustomMaskEditProperties(MaskEdit.Properties);
    try
      ShowModal;
      edEditMask.Text := MaskEdit.Properties.EditMask;
      edMaskKind.ItemIndex := Integer(MaskEdit.Properties.MaskKind);
      RefreshObjectInspector;
    finally
      Free;
    end;
  end;
end;

procedure TframeEditorsProperties.edEditMaskKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then begin
    MaskEdit.Properties.EditMask := edEditMask.Text;
    RefreshObjectInspector;
  end;
end;

// TcxTextEdit

procedure TframeEditorsProperties.tsTextEditShow(Sender: TObject);
begin
  edHAlignment.EditValue := Integer(Edit.Properties.Alignment.Horz);
  edVAlignment.EditValue := Integer(Edit.Properties.Alignment.Vert);
  edEchoMode.ItemIndex := Integer(Edit.Properties.EchoMode);
  edMaxLength.Value := Edit.Properties.MaxLength;
  cbAutoSelect.Checked := Edit.Properties.AutoSelect;
  cbEnabled.Checked := Edit.Enabled;
  cbHideSelection.Checked := Edit.Properties.HideSelection;
  cbReadOnly.Checked := Edit.Properties.ReadOnly;
  edHAligmentSetImages;
  edVAligmentSetImages;
  cbTextEditNativeStyle.Checked := Edit.Style.LookAndFeel.NativeStyle;
  cbTextEditFont.FontName := Edit.Style.Font.Name;
  cbTextEditColor.ColorValue := Edit.Style.Color;
end;

procedure TframeEditorsProperties.cbTextEditFontPropertiesEditValueChanged(
  Sender: TObject);
begin
  Edit.Style.Font.Name := cbTextEditFont.FontName;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbTextEditColorPropertiesEditValueChanged(
  Sender: TObject);
begin
  Edit.Style.Color := cbTextEditColor.ColorValue;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edHAligmentSetImages;
var
  i: integer;
begin
  for i := 0 to edHAlignment.Properties.Items.Count-1 do
    edHAlignment.Properties.Items.Items[i].ImageIndex := 20 +
      3 * Integer(Edit.Properties.Alignment.Vert) +
      Integer(edHAlignment.Properties.Items.Items[i].Value);
end;

procedure TframeEditorsProperties.edVAligmentSetImages;
var
  i: integer;
begin
  for i := 0 to edVAlignment.Properties.Items.Count-1 do
    edVAlignment.Properties.Items.Items[i].ImageIndex := 20 +
      3 * Integer(edVAlignment.Properties.Items.Items[i].Value) +
      Integer(Edit.Properties.Alignment.Horz);
end;

procedure TframeEditorsProperties.cbDropDownAutoSizeChage(
  Sender: TObject);
begin
  DBLookupComboBox.Properties.DropDownAutoSize := cbDropDownAutoSize.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbIncrementalFilteringChange(
  Sender: TObject);
begin
  DBLookupComboBox.Properties.IncrementalFiltering := cbIncrementalFiltering.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edHAlignmentChange(Sender: TObject);
begin
  Edit.Properties.Alignment.Horz := TcxEditHorzAlignment(edHAlignment.EditValue);
  edVAligmentSetImages;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edVAlignmentChange(Sender: TObject);
begin
  Edit.Properties.Alignment.Vert := TcxEditVertAlignment(edVAlignment.EditValue);
  edHAligmentSetImages;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edEchoModeChange(Sender: TObject);
begin
  Edit.Properties.EchoMode := TcxEditEchoMode(edEchoMode.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edMaxLengthChange(Sender: TObject);
begin
  Edit.Properties.MaxLength := Integer(edMaxLength.Value);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbAutoSelectChange(Sender: TObject);
begin
  Edit.Properties.AutoSelect := cbAutoSelect.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbEnabledChange(
  Sender: TObject);
begin
  Edit.Enabled := cbEnabled.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHideSelectionChange(
  Sender: TObject);
begin
  Edit.Properties.HideSelection := cbHideSelection.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbReadOnlyChange(
  Sender: TObject);
begin
  Edit.Properties.ReadOnly := cbReadOnly.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.BFontClick(Sender: TObject);
begin
  FontDialog.Font := Edit.Style.Font;
  If FontDialog.Execute then
  begin
    Edit.Style.Font := FontDialog.Font;
    RefreshObjectInspector;
  end;
end;

procedure TframeEditorsProperties.BColorClick(Sender: TObject);
begin
  ColorDialog.Color := Edit.Style.Color;
  if ColorDialog.Execute then
  begin
    Edit.Style.Color := ColorDialog.Color;
    RefreshObjectInspector;
  end;
end;

procedure TframeEditorsProperties.MaskEditValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  AErrText: String;
begin
  if Error then AErrText := 'Error !'
  else AErrText := 'No Error.';
  ShowMessage(Format('OnValidate handler... %S',[AErrText]));
end;

procedure TframeEditorsProperties.tsMemoShow(Sender: TObject);
begin
  edScrollBars.ItemIndex := Integer(Memo.Properties.ScrollBars);
  cbWantReturns.Checked := Memo.Properties.WantReturns;
  cbWantTabs.Checked := Memo.Properties.WantTabs;
  cbWordWrap.Checked := Memo.Properties.WordWrap;
end;

procedure TframeEditorsProperties.tsRichEditShow(Sender: TObject);
begin
  RichEdit.EditValue := GetRichEditText;
  edRichScrollBars.ItemIndex := Integer(RichEdit.Properties.ScrollBars);
  cbRichPlainText.Checked := RichEdit.Properties.PlainText;
  cbRichSelectionBar.Checked := RichEdit.Properties.SelectionBar;
end;


procedure TframeEditorsProperties.edScrollBarsChange(
  Sender: TObject);
begin
  Memo.Properties.ScrollBars := TScrollStyle(edScrollBars.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbWantReturnsChange(
  Sender: TObject);
begin
  Memo.Properties.WantReturns := cbWantReturns.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbWantTabsChange(
  Sender: TObject);
begin
  Memo.Properties.WantTabs := cbWantTabs.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbWordWrapChange(
  Sender: TObject);
begin
  Memo.Properties.WordWrap := cbWordWrap.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsDateEditShow(Sender: TObject);
begin
  edDateOnError.ItemIndex := Integer(DateEdit.Properties.DateOnError);
  edInputKind.ItemIndex := Integer(DateEdit.Properties.InputKind);
  cbSaveTime.Checked := DateEdit.Properties.SaveTime;
  cbShowTime.Checked := DateEdit.Properties.ShowTime;
  cbToday.Checked := btnToday in DateEdit.Properties.DateButtons;
  cbClear.Checked := btnClear in DateEdit.Properties.DateButtons;
  edPopupBorder.ItemIndex := Integer(DateEdit.Style.PopupBorderStyle);
end;

procedure TframeEditorsProperties.edDateOnErrorChange(
  Sender: TObject);
begin
  DateEdit.Properties.DateOnError := TDateOnError(edDateOnError.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edInputKindChange(
  Sender: TObject);
begin
  DateEdit.Properties.InputKind := TcxInputKind(edInputKind.ItemIndex);
  RefreshObjectInspector; 
end;

procedure TframeEditorsProperties.cbTodayChange(Sender: TObject);
begin
  If cbToday.Checked then
    DateEdit.Properties.DateButtons := DateEdit.Properties.DateButtons + [btnToday]
  else
    DateEdit.Properties.DateButtons := DateEdit.Properties.DateButtons - [btnToday];
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbClearChange(Sender: TObject);
begin
  If cbClear.Checked then
    DateEdit.Properties.DateButtons := DateEdit.Properties.DateButtons + [btnClear]
  else
    DateEdit.Properties.DateButtons := DateEdit.Properties.DateButtons - [btnClear];
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbSaveTimeChange(
  Sender: TObject);
begin
  DateEdit.Properties.SaveTime := cbSaveTime.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edPopupBorderChange(
  Sender: TObject);
begin
  DateEdit.Style.PopupBorderStyle := TcxEditPopupBorderStyle(edPopupBorder.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.ButtonEditButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  function Check(const S: string): string;
  var
    Flag: Boolean;
    I: Integer;
  begin
    Result := Trim(S);
    Flag := True;
    for I := 1 to Length(Result) do
    begin
      if Flag then
      begin
        Result[I] := AnsiUpperCase(Result[I])[1];
        Flag := False;
      end;
      if Result[I] = #32 then
        Flag := True;
    end;
  end;

begin
  case AButtonIndex of
    0:
      ButtonEdit.Text := Check(ButtonEdit.Text);
    1:
      ButtonEdit.Text := '';
    2:
      begin
        MessageBox(Handle, PChar(sdxEditorsButtonEditMessage),
          'Some Dialog', MB_OK or MB_ICONINFORMATION);
        ButtonEdit.Text := '  some text';
      end;
  end;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsButtonEditShow(Sender: TObject);
begin
  edCharCase.ItemIndex := Integer(ButtonEdit.Properties.CharCase);
//  cbHideCursor.Checked := ButtonEdit.Properties.HideCursor;
end;

procedure TframeEditorsProperties.edCharCaseChange(
  Sender: TObject);
begin
  ButtonEdit.Properties.CharCase := TEditCharCase(edCharCase.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHideCursorChange(Sender: TObject);
begin
//  ButtonEdit.Properties.HideCursor := cbHideCursor.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsCheckBoxShow(Sender: TObject);
begin
  edCaption.Text := CheckBox.Properties.Caption;
  edNullStyle.EditValue := Integer(CheckBox.Properties.NullStyle);
  cbAllowGrayed.Checked := CheckBox.Properties.AllowGrayed;
  cbFullFocusRect.Checked := CheckBox.Properties.FullFocusRect;
  cbMultiLine.Checked := CheckBox.Properties.MultiLine;
end;

procedure TframeEditorsProperties.edCaptionChange(
  Sender: TObject);
begin
  CheckBox.Properties.Caption := edCaption.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edNullStyleChange(
  Sender: TObject);
begin
  CheckBox.Properties.NullStyle := TcxCheckBoxNullValueShowingStyle(edNullStyle.EditValue);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbAllowGrayedChange(
  Sender: TObject);
begin
  CheckBox.Properties.AllowGrayed := cbAllowGrayed.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbFullFocusRectChange(
  Sender: TObject);
begin
  CheckBox.Properties.FullFocusRect := cbFullFocusRect.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbMultiLineChange(
  Sender: TObject);
begin
  CheckBox.Properties.MultiLine := cbMultiLine.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbUseGlyphChange(
  Sender: TObject);
var
  B: TBitmap;
begin
  with CheckBox do
    if cbUseGlyph.Checked then
    begin
      B := TBitmap.Create;
      try
        B.LoadFromResourceName(HInstance, 'CHECK_BMP');
        Properties.Glyph.Assign(B);
      finally
        B.Free;
      end;
      Style.BorderStyle := ebsUltraFlat;
    end
    else
    begin
      Properties.Glyph.Assign(nil);
      Style.BorderStyle := ebsFlat;
    end;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsImageComboBoxShow(Sender: TObject);
begin
  edDropDownRows.Value := ImageComboBox.Properties.DropDownRows;
  cbShowDescriptions.Checked := ImageComboBox.Properties.ShowDescriptions;
  cbImmediateDropDown.Checked := ImageComboBox.Properties.ImmediateDropDown;
  edImagePopupBorder.ItemIndex := Integer(ImageComboBox.Style.PopupBorderStyle);
end;

procedure TframeEditorsProperties.edDropDownRowsChange(
  Sender: TObject);
begin
  ImageComboBox.Properties.DropDownRows := Integer(edDropDownRows.Value);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShowDescriptionsChange(
  Sender: TObject);
begin
  ImageComboBox.Properties.ShowDescriptions := cbShowDescriptions.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edImagePopupBorderChange(
  Sender: TObject);
begin
  ImageComboBox.Style.PopupBorderStyle := TcxEditPopupBorderStyle(edImagePopupBorder.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbImmediateDropDownChange(
  Sender: TObject);
begin
  ImageComboBox.Properties.ImmediateDropDown := cbImmediateDropDown.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsSpinEditShow(Sender: TObject);
begin
  edSpinEditIncrement.Value := SpinEdit.Properties.Increment;
  edSpinEditLargeIncrement.Value := SpinEdit.Properties.LargeIncrement;
  edMinValue.Text := FloatToStr(SpinEdit.Properties.MinValue);
  edMaxValue.Text := FloatToStr(SpinEdit.Properties.MaxValue);
  edValueType.ItemIndex := Integer(SpinEdit.Properties.ValueType);
  edSpinButtonsPosition.ItemIndex := Integer(SpinEdit.Properties.SpinButtons.Position);
  cbCanEdit.Checked := SpinEdit.Properties.CanEdit;
  cbShowFastButton.Checked := SpinEdit.Properties.SpinButtons.ShowFastButtons;
end;

procedure TframeEditorsProperties.edSpinEditIncrementPropertiesChange(
  Sender: TObject);
begin
  SpinEdit.Properties.Increment := edSpinEditIncrement.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edSpinEditLargeIncrementPropertiesChange(
  Sender: TObject);
begin
  SpinEdit.Properties.LargeIncrement := edSpinEditLargeIncrement.Value;
  RefreshObjectInspector;
end;


procedure TframeEditorsProperties.edMinValueChange(
  Sender: TObject);
begin
  if edMinValue.Text <> '' then
    try
      SpinEdit.Properties.MinValue := StrToFloat(edMinValue.Text);
      if edMinValue.Text <> FloatToStr(SpinEdit.Properties.MinValue) then
        edMinValue.Text := FloatToStr(SpinEdit.Properties.MinValue);
    except
    end
  else
    SpinEdit.Properties.MinValue := 0;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edMaxValueChange(
  Sender: TObject);
begin
  if edMaxValue.Text <> '' then
    try
      SpinEdit.Properties.MaxValue := StrToFloat(edMaxValue.Text);
      if edMaxValue.Text <> FloatToStr(SpinEdit.Properties.MaxValue) then
        edMaxValue.Text := FloatToStr(SpinEdit.Properties.MaxValue);
    except
    end
  else
    SpinEdit.Properties.MaxValue := 0;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edValueTypeChange(
  Sender: TObject);
begin
  SpinEdit.Properties.ValueType := TcxSpinEditValueType(edValueType.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbCanEditChange(
  Sender: TObject);
begin
  SpinEdit.Properties.CanEdit := cbCanEdit.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsComboBoxShow(Sender: TObject);
begin
  edComboDropDownRows.Value := ComboBox.Properties.DropDownRows;
  edComboDropDownListStyle.ItemIndex := Integer(ComboBox.Properties.DropDownListStyle);
  edPopupAlignment.ItemIndex := Integer(ComboBox.Properties.PopupAlignment);
  cbRevertable.Checked := ComboBox.Properties.Revertable;
  edComboPopupBorder.ItemIndex := iNTEGER(ComboBox.Style.PopupBorderStyle);
end;

procedure TframeEditorsProperties.edComboDropDownRowsChange(
  Sender: TObject);
begin
  ComboBox.Properties.DropDownRows := Integer(edComboDropDownRows.Value);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edComboDropDownListStyleChange(
  Sender: TObject);
begin
  ComboBox.Properties.DropDownListStyle := TcxEditDropDownListStyle(edComboDropDownListStyle.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edPopupAlignmentChange(
  Sender: TObject);
begin
  ComboBox.Properties.PopupAlignment := TAlignment(edPopupAlignment.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbRevertableChange(
  Sender: TObject);
begin
  ComboBox.Properties.Revertable := cbRevertable.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edComboPopupBorderChange(
  Sender: TObject);
begin
  ComboBox.Style.PopupBorderStyle := TcxEditPopupBorderStyle(edComboPopupBorder.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsCalcEditShow(Sender: TObject);
begin
  edPrecision.Value := CalcEdit.Properties.Precision;
  cbBeepOnError.Checked := CalcEdit.Properties.BeepOnError;
  cbQuickClose.Checked := CalcEdit.Properties.QuickClose;
  edCalcPopupBorder.ItemIndex := Integer(CalcEdit.Style.PopupBorderStyle);
  cbNativeStyle.Checked := CalcEdit.Style.LookAndFeel.NativeStyle;
end;

procedure TframeEditorsProperties.cbTextEditNativeStyleChange(
  Sender: TObject);
begin
    Edit.Style.LookAndFeel.NativeStyle := cbTextEditNativeStyle.Checked;
    RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbNativeStylePropertiesChange(
  Sender: TObject);
begin
    CalcEdit.Style.LookAndFeel.NativeStyle := cbNativeStyle.Checked;
    RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edCalcPopupBorderChange(
  Sender: TObject);
begin
  CalcEdit.Style.PopupBorderStyle := TcxEditPopupBorderStyle(edCalcPopupBorder.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edPrecisionChange(
  Sender: TObject);
begin
  CalcEdit.Properties.Precision := edPrecision.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbBeepOnErrorChange(
  Sender: TObject);
begin
  CalcEdit.Properties.BeepOnError := cbBeepOnError.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbQuickCloseChange(
  Sender: TObject);
begin
  CalcEdit.Properties.QuickClose := cbQuickClose.Checked;
  RefreshObjectInspector;
end;

// TcxHyperLinkEdit

procedure TframeEditorsProperties.tsHyperLinkEditShow(Sender: TObject);
begin
  cbSingleClick.Checked := HyperLinkEdit.Properties.SingleClick;
  cbHyperLinkReadOnly.Checked := HyperLinkEdit.Properties.ReadOnly;
  cbHyperLinkEditLinkColor.ColorValue := HyperLinkEdit.Properties.LinkColor;
  edHyperLinkEditStartKey.HotKey := HyperLinkEdit.Properties.StartKey;
end;

procedure TframeEditorsProperties.cbSingleClickChange(
  Sender: TObject);
begin
  HyperLinkEdit.Properties.SingleClick := cbSingleClick.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHyperLinkReadOnlyChange(
  Sender: TObject);
begin
  if cbHyperLinkReadOnly.Checked then
  begin
    HyperLinkEdit.Style.BorderStyle := ebsNone;
    HyperLinkEdit.Style.Color := clBtnFace;
  end
  else
  begin
    HyperLinkEdit.Style.BorderStyle := ebsFlat;
    HyperLinkEdit.Style.Color := clWindow;
  end;
  HyperLinkEdit.Properties.ReadOnly := cbHyperLinkReadOnly.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHyperLinkEditLinkColorPropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsLoading then exit;
  HyperLinkEdit.Properties.LinkColor := cbHyperLinkEditLinkColor.ColorValue;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edHyperLinkEditStartKeyChange(
  Sender: TObject);
begin
  if IsLoading then exit;
  HyperLinkEdit.Properties.StartKey := edHyperLinkEditStartKey.HotKey;
  RefreshObjectInspector;
end;

// TcxTimeEdit
procedure TframeEditorsProperties.tsTimeEditShow(Sender: TObject);
begin
  edTimeFormat.ItemIndex := Integer(TimeEdit.Properties.TimeFormat);
  TimeEdit.Time := Time;
  edTimeEditUse24HourFormat.Checked := TimeEdit.Properties.Use24HourFormat;

end;

procedure TframeEditorsProperties.edTimeFormatChange(
  Sender: TObject);
begin
  TimeEdit.Properties.TimeFormat := TcxTimeEditTimeFormat(edTimeFormat.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsCurrencyEditShow(Sender: TObject);
begin
  edDecimalPlaces.Value := CurrencyEdit.Properties.DecimalPlaces;
  edDisplayFormat.Text := CurrencyEdit.Properties.DisplayFormat;
  edCurrMinValue.Text := FloatToStr(CurrencyEdit.Properties.MinValue);
  edCurrMaxValue.Text := FloatToStr(CurrencyEdit.Properties.MaxValue);
  cbUseThousandSeparator.Checked := CurrencyEdit.Properties.UseThousandSeparator;
end;

procedure TframeEditorsProperties.edDecimalPlacesChange(
  Sender: TObject);
begin
  CurrencyEdit.Properties.DecimalPlaces := edDecimalPlaces.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edDisplayFormatChange(
  Sender: TObject);
begin
  CurrencyEdit.Properties.DisplayFormat := edDisplayFormat.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edCurrMinValueChange(
  Sender: TObject);
begin
  if edCurrMinValue.Text <> '' then
    try
      CurrencyEdit.Properties.MinValue := StrToFloat(edCurrMinValue.Text);
      if edCurrMinValue.Text <> FloatToStr(CurrencyEdit.Properties.MinValue) then
        edCurrMinValue.Text := FloatToStr(CurrencyEdit.Properties.MinValue);
    except
    end
  else
    CurrencyEdit.Properties.MinValue := 0;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edCurrMaxValueChange(
  Sender: TObject);
begin
  if edCurrMaxValue.Text <> '' then
    try
      CurrencyEdit.Properties.MaxValue := StrToFloat(edCurrMaxValue.Text);
      if edCurrMaxValue.Text <> FloatToStr(CurrencyEdit.Properties.MaxValue) then
        edCurrMaxValue.Text := FloatToStr(CurrencyEdit.Properties.MaxValue);
    except
    end
  else
    CurrencyEdit.Properties.MaxValue := 0;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbUseThousandSeparatorChange(
  Sender: TObject);
begin
  CurrencyEdit.Properties.UseThousandSeparator := cbUseThousandSeparator.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsImageShow(Sender: TObject);
begin
  with Image.Properties do
  begin
    LoadGraphicFilters(edCustomFilter.Properties.Items);
    edTransparency.ItemIndex := Integer(GraphicTransparency);
    cbCenter.Checked := Center;
    cbStretch.Checked := Stretch;
    cbCenter.Enabled := not Stretch;
    with PopupMenuLayout do
    begin
      cbCut.Checked := pmiCut in MenuItems;
      cbCopy.Checked := pmiCopy in MenuItems;
      cbPaste.Checked := pmiPaste in MenuItems;
      cbDelete.Checked := pmiDelete in MenuItems;
      cbLoadFromFile.Checked := pmiLoad in MenuItems;
      cbSaveToFile.Checked := pmiSave in MenuItems;
      cbCustom.Checked := pmiCustom in MenuItems;
      edCustomButtonCaption.Text := CustomMenuItemCaption;
      If CustomMenuItemGlyph.Empty then
        edCustomButtonGlyph.Text := '(Empty)'
      else
        edCustomButtonGlyph.Text := '(Assigned)';
    end;
  end;
end;

procedure TframeEditorsProperties.ImageCustomClick(
  Sender: TObject);
begin
  fmPreview.Image.Picture := Image.Picture;
  if not IsPictureEmpty(fmPreview.Image.Picture) then
  begin
    fmPreview.ClientWidth := Image.Picture.Width;
    fmPreview.ClientHeight := Image.Picture.Height;
  end;
  fmPreview.Show;
end;

procedure TframeEditorsProperties.edCustomFilterChange(
  Sender: TObject);
begin
  Image.Properties.CustomFilter := edCustomFilter.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edTransparencyChange(
  Sender: TObject);
begin
  Image.Properties.GraphicTransparency := TcxImageTransparency(edTransparency.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbCenterChange(
  Sender: TObject);
begin
  Image.Properties.Center := cbCenter.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbStretchChange(
  Sender: TObject);
begin
  Image.Properties.Stretch := cbStretch.Checked;
  cbCenter.Enabled := not Image.Properties.Stretch;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.MenuItemsChange(Sender: TObject);
begin
  with Image.Properties.PopupMenuLayout, Sender as TcxCheckBox do
  if Checked then
    MenuItems := MenuItems + [TcxPopupMenuItem(Tag)]
  else
    MenuItems := MenuItems - [TcxPopupMenuItem(Tag)];
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edCustomButtonCaptionChange(
  Sender: TObject);
begin
  Image.Properties.PopupMenuLayout.CustomMenuItemCaption := edCustomButtonCaption.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edCustomButtonGlyphPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  with Image.Properties.PopupMenuLayout.CustomMenuItemGlyph, edCustomButtonGlyph do
  begin
    With OpenPictureDialog do
    begin
      Filter := GraphicFilter(TBitmap);
      if Execute then
        LoadFromFile(FileName);
    end;
    If Empty then
      Text := '(Empty)'
    else
      Text := '(Assigned)';
  end;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsBlobEditShow(Sender: TObject);
begin
  with BlobEdit.Properties do
  begin
    edBlobEditKind.ItemIndex := Integer(BlobEditKind);
    edBlobPaintStyle.ItemIndex := Integer(BlobPaintStyle);
    cbAlwaysSaveData.Checked := AlwaysSaveData;
    edBlobMemoScrollBars.ItemIndex := Integer(MemoScrollBars);
    edBlobMemoMaxLength.Value := MemoMaxLength;
    edBlobMemoCharCase.ItemIndex := Integer(MemoCharCase);
    cbBlobMemoWantReturns.Checked := MemoWantReturns;
    cbBlobMemoWantTabs.Checked := MemoWantTabs;
    cbBlobMemoWordWrap.Checked := MemoWordWrap;
    LoadGraphicFilters(edPictureFilter.Properties.Items);
    edPictureFilter.Text := PictureFilter;
    edPictureTranparency.ItemIndex := Integer(PictureTransparency);
    cbShowExPopupItems.Checked := ShowExPopupItems;
    cbShowPicturePopup.Checked := ShowPicturePopup;
  end;
end;

procedure TframeEditorsProperties.edBlobEditKindChange(
  Sender: TObject);
var
  S: AnsiString;
begin
  with BlobEdit do
  begin
    Properties.BlobEditKind := TcxBlobEditKind(edBlobEditKind.ItemIndex);
    case Properties.BlobEditKind of
      bekMemo:
        Text := sdxEditorsBlobEditKind;
      bekPict:
        begin
          SavePicture(BlobImage.Picture, S);
          EditValue := S;
        end;
    end;
  end;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edBlobPaintStyleChange(
  Sender: TObject);
begin
  BlobEdit.Properties.BlobPaintStyle := TcxBlobPaintStyle(edBlobPaintStyle.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbAlwaysSaveDataChange(
  Sender: TObject);
begin
  BlobEdit.Properties.AlwaysSaveData := cbAlwaysSaveData.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edBlobMemoScrollBarsChange(
  Sender: TObject);
begin
  BlobEdit.Properties.MemoScrollBars := TScrollStyle(edBlobMemoScrollBars.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edBlobMemoMaxLengthChange(
  Sender: TObject);
begin
  BlobEdit.Properties.MemoMaxLength := edBlobMemoMaxLength.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edBlobMemoCharCaseChange(
  Sender: TObject);
begin
  BlobEdit.Properties.MemoCharCase := TEditCharCase(edBlobMemoCharCase.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbBlobMemoWantReturnsChange(
  Sender: TObject);
begin
  BlobEdit.Properties.MemoWantReturns := cbBlobMemoWantReturns.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbBlobMemoWantTabsChange(
  Sender: TObject);
begin
  BlobEdit.Properties.MemoWantTabs := cbBlobMemoWantTabs.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbBlobMemoWordWrapChange(
  Sender: TObject);
begin
  BlobEdit.Properties.MemoWordWrap := cbBlobMemoWordWrap.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edPictureFilterChange(
  Sender: TObject);
begin
  BlobEdit.Properties.PictureFilter := edPictureFilter.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edPictureTranparencyChange(
  Sender: TObject);
begin
  BlobEdit.Properties.PictureTransparency := TcxImageTransparency(edPictureTranparency.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShowExPopupItemsChange(
  Sender: TObject);
begin
  BlobEdit.Properties.ShowExPopupItems := cbShowExPopupItems.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShowPicturePopupChange(
  Sender: TObject);
begin
  BlobEdit.Properties.ShowPicturePopup := cbShowPicturePopup.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsMRUEditShow(Sender: TObject);
begin
  seMaxItemCount.Value := MRUEdit.Properties.MaxItemCount;
  cbShowEllipsis.Checked := MRUEdit.Properties.ShowEllipsis;
end;

procedure TframeEditorsProperties.seMaxItemCountChange(
  Sender: TObject);
begin
  MRUEdit.Properties.MaxItemCount := seMaxItemCount.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShowEllipsisChange(
  Sender: TObject);
begin
  MRUEdit.Properties.ShowEllipsis := cbShowEllipsis.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.MRUEditButtonClick(
  Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    MRUEdit.Text := ExtractFileName(OpenDialog.FileName);
    MRUEdit.AddItem(MRUEdit.Text); // Run - Time adding
  end;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsPopupEditShow(Sender: TObject);
begin
  pePopupAlignment.ItemIndex := Integer(PopupEdit.Properties.PopupAlignment);
  edPopUpWidth.Value := PopupEdit.Properties.PopupWidth;
  edPopUpHeight.Value := PopupEdit.Properties.PopupHeight;
  edPopUpMinWidth.Value := PopupEdit.Properties.PopupMinWidth;
  edPopupMinHeight.Value := PopupEdit.Properties.PopupMinHeight;
  cbPopupAutoSize.Checked := PopupEdit.Properties.PopupAutoSize;
  cbPopupSizeable.Checked := PopupEdit.Properties.PopupSizeable;
  pePopupBorderStyle.ItemIndex := Integer(PopupEdit.Style.PopupBorderStyle);
  cbPopupClientEdge.Checked := PopupEdit.Properties.PopupClientEdge;
  cbPopupSysPanelStyle.Checked := PopupEdit.Properties.PopupSysPanelStyle; 
end;

procedure TframeEditorsProperties.pePopupAlignmentChange(
  Sender: TObject);
begin
  if IsLoading then exit;
  PopupEdit.Properties.PopupAlignment := TAlignment(pePopupAlignment.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edPopUpWidthChange(
  Sender: TObject);
begin
  PopupEdit.Properties.PopupWidth := edPopUpWidth.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edPopUpHeightChange(
  Sender: TObject);
begin
  PopupEdit.Properties.PopupHeight := edPopUpHeight.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edPopUpMinWidthChange(
  Sender: TObject);
begin
  PopupEdit.Properties.PopupMinWidth := edPopUpMinWidth.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edPopupMinHeightChange(
  Sender: TObject);
begin
  PopupEdit.Properties.PopupMinHeight := edPopupMinHeight.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbPopupAutoSizeChange(
  Sender: TObject);
begin
  PopupEdit.Properties.PopupAutoSize := cbPopupAutoSize.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbPopupSizeableChange(
  Sender: TObject);
begin
  PopupEdit.Properties.PopupSizeable := cbPopupSizeable.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.pePopupBorderStyleChange(
  Sender: TObject);
begin
  PopupEdit.Style.PopupBorderStyle := TcxEditPopupBorderStyle(pePopupBorderStyle.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbPopupClientEdgeChange(
  Sender: TObject);
begin
  PopupEdit.Properties.PopupClientEdge := cbPopupClientEdge.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbPopupSysPanelStyleChange(
  Sender: TObject);
begin
  PopupEdit.Properties.PopupSysPanelStyle := cbPopupSysPanelStyle.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShowTimeClick(Sender: TObject);
begin
  DateEdit.Properties.ShowTime := cbShowTime.Checked;
  RefreshObjectInspector;
end;


// TcxButton

procedure TframeEditorsProperties.tsButtonShow(Sender: TObject);
begin
  cbButtonLookAndFeel.ItemIndex := Integer(cxButton.LookAndFeel.Kind);
  cbButtonIsNative.Checked := cxButton.LookAndFeel.NativeStyle;
  cbButtonEnabled.Checked := cxButton.Enabled;
  cbButtonDefault.Checked := cxButton.Default;
  cbButtonColorDefault.ColorValue := cxButton.Colors.Default;
  cbButtonColorNormal.ColorValue := cxButton.Colors.Normal;
  cbButtonColorHot.ColorValue := cxButton.Colors.Hot;
  cbButtonColorPressed.ColorValue := cxButton.Colors.Pressed;
  cbButtonColorDisabled.ColorValue := cxButton.Colors.Disabled;
end;

procedure TframeEditorsProperties.cbButtonIsNativeClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ButtonCount - 1 do
    FButtonArray[I].LookAndFeel.NativeStyle := cbButtonIsNative.Checked;
end;

procedure TframeEditorsProperties.cbButtonLookAndFeelPropertiesChange(
  Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ButtonCount - 1 do
    FButtonArray[I].LookAndFeel.Kind := TcxLookandFeelKind(cbButtonLookAndFeel.ItemIndex);
end;

procedure TframeEditorsProperties.cbButtonEnabledClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ButtonCount - 1 do
    FButtonArray[I].Enabled := cbButtonEnabled.Checked;
end;

procedure TframeEditorsProperties.cbButtonDefaultClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ButtonCount - 1 do
    FButtonArray[I].Default := cbButtonDefault.Checked;
end;

procedure TframeEditorsProperties.tsDBExtLookupComboBoxShow(
  Sender: TObject);
begin
  edExtLookupDropDownListStyle.ItemIndex := Integer(DBExtLookupComboBox.Properties.DropDownListStyle);
  cbExtLookupComboFocusPopup.Checked := DBExtLookupComboBox.Properties.FocusPopup;
  cbExtLookupComboRevertable.Checked := DBExtLookupComboBox.Properties.Revertable;
  cbExtLookupComboDropDownAutoSize.Checked := DBExtLookupComboBox.Properties.DropDownAutoSize;
  cbExtLookupComboIncrementalFiltering.Checked := DBExtLookupComboBox.Properties.IncrementalFiltering;
end;

procedure TframeEditorsProperties.btnViewLayoutEditClick(Sender: TObject);
begin
//TODO  ShowGridViewLayoutEditor(GridViewRepositoryDBTableView);
end;

procedure TframeEditorsProperties.edExtLookupDropDownListStylePropertiesChange(
  Sender: TObject);
begin
  DBExtLookupComboBox.Properties.DropDownListStyle := TcxEditDropDownListStyle(edExtLookupDropDownListStyle.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbExtLookupComboFocusPopupClick(
  Sender: TObject);
begin
  DBExtLookupComboBox.Properties.FocusPopup := cbExtLookupComboFocusPopup.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbExtLookupComboRevertableClick(
  Sender: TObject);
begin
  DBExtLookupComboBox.Properties.Revertable := cbExtLookupComboRevertable.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbExtLookupComboDropDownAutoSizeClick(
  Sender: TObject);
begin
  DBExtLookupComboBox.Properties.DropDownAutoSize := cbExtLookupComboDropDownAutoSize.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbExtLookupComboIncrementalFilteringClick(
  Sender: TObject);
begin
  DBExtLookupComboBox.Properties.IncrementalFiltering := cbExtLookupComboIncrementalFiltering.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsListBoxShow(Sender: TObject);
begin
  cbListBoxBorderStyle.ItemIndex := Integer(ListBox.Style.BorderStyle);
  cbListBoxHotTrack.Checked := ListBox.Style.HotTrack;
  cbListBoxShadow.Checked := ListBox.Style.Shadow;
end;

procedure TframeEditorsProperties.edComboPopupBorderPropertiesChange(
  Sender: TObject);
begin
  ComboBox.Style.PopupBorderStyle := TcxEditPopupBorderStyle(edComboPopupBorder.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbListBoxBorderStylePropertiesChange(
  Sender: TObject);
begin
  ListBox.Style.BorderStyle := TcxContainerBorderStyle(cbListBoxBorderStyle.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbListBoxHotTrackClick(Sender: TObject);
begin
  ListBox.Style.HotTrack := cbListBoxHotTrack.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbListBoxShadowClick(Sender: TObject);
begin
  ListBox.Style.Shadow := cbListBoxShadow.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.tsRadioGroupShow(Sender: TObject);
begin
  seRadioGroupColumnCount.Value := RadioGroup.Properties.Columns;
  cbRadioGroupHotTrack.Checked := RadioGroup.Style.HotTrack;
  cbRadioGroupShadow.Checked := RadioGroup.Style.Shadow;
end;

procedure TframeEditorsProperties.seRadioGroupColumnCountPropertiesChange(
  Sender: TObject);
begin
  RadioGroup.Properties.Columns := seRadioGroupColumnCount.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbRadioGroupHotTrackClick(
  Sender: TObject);
begin
  RadioGroup.Style.HotTrack := cbRadioGroupHotTrack.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbRadioGroupShadowClick(Sender: TObject);
begin
  RadioGroup.Style.Shadow := cbRadioGroupShadow.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edTimeEditUse24HourFormatClick(
  Sender: TObject);
begin
  TimeEdit.Properties.Use24HourFormat := edTimeEditUse24HourFormat.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edSpinButtonsPositionPropertiesChange(
  Sender: TObject);
begin
  SpinEdit.Properties.SpinButtons.Position := TcxSpinEditButtonsPosition(edSpinButtonsPosition.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShowFastButtonPropertiesChange(
  Sender: TObject);
begin
  SpinEdit.Properties.SpinButtons.ShowFastButtons := cbShowFastButton.Checked;
  RefreshObjectInspector;
end;

// TcxLabel

procedure TframeEditorsProperties.tsLabelShow(Sender: TObject);
begin
  cbLabelEffect.ItemIndex := Integer(cxLabel.Properties.LabelEffect);
  cbLabelStyle.ItemIndex := Integer(cxLabel.Properties.LabelStyle);
  cbLabelOrientation.ItemIndex := Integer(cxLabel.Properties.Orientation);
  spLabelAngle.Value := cxLabel.Properties.Angle;
  spLabelDepth.Value := cxLabel.Properties.Depth;
  spLabelPenWidth.Value := cxLabel.Properties.PenWidth;
  cbLabelFont.FontName := cxLabel.Style.Font.Name;
end;

procedure TframeEditorsProperties.cxLabelUseGlyphClick(
  Sender: TObject);
begin
  if cxLabelUseGlyph.Checked then
    cxLabel.Properties.Glyph.Assign(imLabel.Picture)
  else cxLabel.Properties.Glyph.Assign(nil);
end;

procedure TframeEditorsProperties.cbButtonFontPropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsLoading then exit;
  cxLabel.Style.Font.Name := cbLabelFont.FontName;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.spAnglePropertiesEditValueChanged(
  Sender: TObject);
begin
  cxLabel.Properties.Angle := spLabelAngle.Value;
  cbLabelEffect.Enabled := cxLabel.Properties.Angle = 0;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.spDepthPropertiesEditValueChanged(
  Sender: TObject);
begin
  cxLabel.Properties.Depth := spLabelDepth.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.spPenWidthPropertiesEditValueChanged(
  Sender: TObject);
begin
  cxLabel.Properties.PenWidth := spLabelPenWidth.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbLabelEffectPropertiesEditValueChanged(
  Sender: TObject);
begin
  cxLabel.Properties.LabelEffect := TcxLabelEffect(cbLabelEffect.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbLabelStylePropertiesEditValueChanged(
  Sender: TObject);
begin
  cxLabel.Properties.LabelStyle := TcxLabelStyle(cbLabelStyle.ItemIndex);
  spLabelPenWidth.Enabled := cxLabel.Properties.LabelStyle = cxlsOutLine;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbOrientationPropertiesEditValueChanged(
  Sender: TObject);
begin
  cxLabel.Properties.Orientation := TcxLabelOrientation(cbLabelOrientation.ItemIndex);
  RefreshObjectInspector;
end;

// TcxProgressBar

procedure TframeEditorsProperties.tsProgressBarShow(Sender: TObject);
begin
   spProgressBarPosition.Value := ProgressBar.Position;
   cbProgressBarShowPeack.Checked := ProgressBar.Properties.ShowPeak;
   cbProgressBarPeackColor.ColorValue := ProgressBar.Properties.PeakColor;
   cbProgressBarStyle.ItemIndex := Integer(ProgressBar.Properties.BarStyle);
   cbProgressBarBeginColor.ColorValue := ProgressBar.Properties.BeginColor;
   cbProgressBarEndColor.ColorValue := ProgressBar.Properties.EndColor;
   cbProgressBarShowText.Checked := ProgressBar.Properties.ShowText;
   cbProgressBarShowTextStyle.ItemIndex := Integer(ProgressBar.Properties.ShowTextStyle);
end;

procedure TframeEditorsProperties.spProgressBarPositionPropertiesEditValueChanged(
  Sender: TObject);
begin
  ProgressBar.Position := spProgressBarPosition.Value;
  ProgressBarVert.Position := ProgressBar.Position;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbProgressBarShowPeackPropertiesEditValueChanged(
  Sender: TObject);
begin
  ProgressBar.Properties.ShowPeak := cbProgressBarShowPeack.Checked;
  ProgressBarVert.Properties.ShowPeak := ProgressBar.Properties.ShowPeak;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbProgressBarPeackColorPropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsLoading then exit;
  ProgressBar.Properties.PeakColor := cbProgressBarPeackColor.ColorValue;
  ProgressBarVert.Properties.PeakColor := ProgressBar.Properties.PeakColor;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbProgressBarStylePropertiesEditValueChanged(
  Sender: TObject);
begin
  ProgressBar.Properties.BarStyle := TcxProgressBarBarStyle(cbProgressBarStyle.ItemIndex);
  ProgressBarVert.Properties.BarStyle := ProgressBar.Properties.BarStyle;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cxColorComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsLoading then exit;
  ProgressBar.Properties.BeginColor := cbProgressBarBeginColor.ColorValue;
  ProgressBarVert.Properties.BeginColor := ProgressBar.Properties.BeginColor;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cxColorComboBox2PropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsLoading then exit;
  ProgressBar.Properties.EndColor := cbProgressBarEndColor.ColorValue;
  ProgressBarVert.Properties.EndColor := ProgressBar.Properties.EndColor;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbProgressBarShowTextPropertiesEditValueChanged(
  Sender: TObject);
begin
  ProgressBar.Properties.ShowText := cbProgressBarShowText.Checked;
  ProgressBarVert.Properties.ShowText := ProgressBar.Properties.ShowText;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbProgressBarShowTextStylePropertiesEditValueChanged(
  Sender: TObject);
begin
  ProgressBar.Properties.ShowTextStyle := TcxProgressBarTextStyle(cbProgressBarShowTextStyle.ItemIndex);
  ProgressBarVert.Properties.ShowTextStyle := ProgressBar.Properties.ShowTextStyle;
  RefreshObjectInspector;
end;

// TcxTrackBar

procedure TframeEditorsProperties.tsTrackBarShow(Sender: TObject);
begin
  spTrackBarPosition.Value := TrackBar.Position;
  cbTrackBarTickType.ItemIndex := Integer(TrackBar.Properties.TickType);
  cbTrackBarShowTick.Checked := TrackBar.Properties.ShowTicks;
  cbTrackBarShowTrack.Checked := TrackBar.Properties.ShowTrack;
  cbTrackBarAutoSize.Checked := TrackBar.Properties.AutoSize;
  cbTrackBarThumbColor.ColorValue := TrackBar.Properties.ThumbColor;
  cbTrackBarThumbHighLightColor.ColorValue := TrackBar.Properties.ThumbHighLightColor;
  cbTrackBarTrackColor.ColorValue := TrackBar.Properties.TrackColor;
  spTrackBarThumbWidth.Value := TrackBar.Properties.ThumbWidth;
  spTrackBarTrackWidth.Value := TrackBar.Properties.TrackSize;
end;

procedure TframeEditorsProperties.UpdateTrackBarThumbProperties;
begin
  cbTrackBarThumbColor.Enabled := RootLookAndFeel.ActiveStyle <> lfsNative;
  cbTrackBarThumbHighLightColor.Enabled := cbTrackBarThumbColor.Enabled;
  cbTrackBarTrackColor.Enabled := cbTrackBarThumbColor.Enabled;
  spTrackBarThumbWidth.Enabled := not TrackBar.Properties.AutoSize and cbTrackBarThumbColor.Enabled;
  spTrackBarTrackWidth.Enabled := spTrackBarThumbWidth.Enabled;
end;

procedure TframeEditorsProperties.cbTrackBarAutoSizePropertiesChange(
  Sender: TObject);
begin
  TrackBar.Properties.AutoSize := cbTrackBarAutoSize.Checked;
  TrackBarVert.Properties.AutoSize := TrackBar.Properties.AutoSize;
  UpdateTrackBarThumbProperties;
  RefreshObjectInspector;
end;


procedure TframeEditorsProperties.spTrackBarPositionPropertiesEditValueChanged(
  Sender: TObject);
begin
  TrackBar.Position := spTrackBarPosition.Value;
  TrackBarVert.Position := TrackBar.Position;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbTrackBarTickTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  TrackBar.Properties.TickType := TcxTrackBarTickType(cbTrackBarTickType.ItemIndex);
  TrackBarVert.Properties.TickType := TrackBar.Properties.TickType;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbTrackBarShowTickPropertiesEditValueChanged(
  Sender: TObject);
begin
  TrackBar.Properties.ShowTicks := cbTrackBarShowTick.Checked;
  TrackBarVert.Properties.ShowTicks := TrackBar.Properties.ShowTicks;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbTrackBarShowTrackPropertiesEditValueChanged(
  Sender: TObject);
begin
  TrackBar.Properties.ShowTrack := cbTrackBarShowTrack.Checked;
  TrackBarVert.Properties.ShowTrack := TrackBar.Properties.ShowTrack;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbTrackBarThumbColorPropertiesChange(
  Sender: TObject);
begin
  if IsLoading then exit;
  TrackBar.Properties.ThumbColor := cbTrackBarThumbColor.ColorValue;
  TrackBarVert.Properties.ThumbColor := TrackBar.Properties.ThumbColor;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbTrackBarThumbHighLightColorPropertiesChange(
  Sender: TObject);
begin
  if IsLoading then exit;
  TrackBar.Properties.ThumbHighlightColor := cbTrackBarThumbHighLightColor.ColorValue;
  TrackBarVert.Properties.ThumbHighlightColor := TrackBar.Properties.ThumbHighlightColor;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbTrackBarTrackColorPropertiesChange(
  Sender: TObject);
begin
  if IsLoading then exit;
  TrackBar.Properties.TrackColor := cbTrackBarTrackColor.ColorValue;
  TrackBarVert.Properties.TrackColor := TrackBar.Properties.TrackColor;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.spTrackBarThumbWidthPropertiesChange(
  Sender: TObject);
begin
  TrackBar.Properties.ThumbWidth := spTrackBarThumbWidth.Value;
  TrackBarVert.Properties.ThumbWidth := TrackBar.Properties.ThumbWidth;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.spTrackBarTrackWidthPropertiesChange(
  Sender: TObject);
begin
  TrackBar.Properties.TrackSize := spTrackBarTrackWidth.Value;
  TrackBarVert.Properties.TrackSize := TrackBar.Properties.TrackSize;
  RefreshObjectInspector;
end;


// TcxCheckListBox
procedure TframeEditorsProperties.tsCheckListBoxShow(Sender: TObject);
var
  ABitmap: TBitmap;
begin
  spCheckListBoxColumns.Value := CheckListBox.Columns;
  cbCheckListBoxAllowedGrayed.Checked := CheckListBox.AllowGrayed;
  cbCheckListBoxSorted.Checked := CheckListBox.Sorted;
  ABitmap := TBitmap.Create;
  try
    ilCheckGlyphs.GetBitmap(0, ABitmap);
    Image2.Picture.Assign(ABitmap);
  finally
    ABitmap.Free;
  end;
end;

procedure TframeEditorsProperties.spCheckListBoxColumnsPropertiesChange(
  Sender: TObject);
begin
  CheckListBox.Columns := spCheckListBoxColumns.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.icCheckComboBoxGlyphPropertiesEditValueChanged(
  Sender: TObject);
var
  AImageIndex: Integer;
begin
  CheckListBox.Glyph.Assign(nil);
  AImageIndex := icCheckComboBoxGlyph.ItemIndex - 1;
  if AImageIndex > -1 then
    ilCheckGlyphs.GetBitmap(AImageIndex, CheckListBox.Glyph);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbCheckListBoxAllowedGrayedPropertiesChange(
  Sender: TObject);
begin
  CheckListBox.AllowGrayed := cbCheckListBoxAllowedGrayed.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbCheckListBoxSortedPropertiesChange(
  Sender: TObject);
begin
  CheckListBox.Sorted := cbCheckListBoxSorted.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbCheckListBoxLookAndFeelKindPropertiesEditValueChanged(
  Sender: TObject);
begin
  if (Sender as TcxComboBox).ItemIndex <> -1 then
    RootLookAndFeel.Kind := TcxLookAndFeelKind((Sender as TcxComboBox).ItemIndex);
end;

procedure TframeEditorsProperties.cbCheckListBoxLookAndFeelNativeStylePropertiesChange(
  Sender: TObject);
begin
  RootLookAndFeel.NativeStyle := (Sender as TcxCheckBox).Checked;
end;

procedure TframeEditorsProperties.cbCheckListBoxAssignGlyphPropertiesChange(
  Sender: TObject);
var
  B: TBitmap;
begin
  with CheckListBox do
    if cbCheckListBoxAssignGlyph.Checked then
    begin
      B := TBitmap.Create;
      try
        ilCheckGlyphs.GetBitmap(0, B);
        Glyph.Assign(B);
      finally
        B.Free;
      end;
    end
    else
    begin
      Glyph.Assign(nil);
    end;
  RefreshObjectInspector;
end;

// TcxColorComboBox

procedure TframeEditorsProperties.tsColorComboBoxShow(Sender: TObject);
begin
  cbColorComboDefaultColorStyle.ItemIndex := Integer(ColorComboBox.Properties.DefaultColorStyle);
  cbColorComboNamingConvention.ItemIndex := Integer(ColorComboBox.Properties.NamingConvention);
  cbColorComboShowDescription.Checked := ColorComboBox.Properties.ShowDescriptions;
  cbColorComboBoxColorValueFormat.ItemIndex := Integer(ColorComboBox.Properties.ColorValueFormat);
  cbColorComboBoxColorBoxAlign.ItemIndex := Integer(ColorComboBox.Properties.ColorBoxAlign);
  edColorComboBoxDefaultDescription.Text := ColorComboBox.Properties.DefaultDescription;
  cbColorComboBoxDropDownSizable.Checked := ColorComboBox.Properties.DropDownSizeable;
  cbColorComboBoxAllowSelectColor.Checked := ColorComboBox.Properties.AllowSelectColor;
end;

procedure TframeEditorsProperties.cbColorComboDefaultColorStylePropertiesEditValueChanged(
  Sender: TObject);
begin
  ColorComboBox.Properties.DefaultColorStyle := TcxDefaultColorStyle(cbColorComboDefaultColorStyle.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbColorComboNamingConventionPropertiesEditValueChanged(
  Sender: TObject);
begin
  ColorComboBox.Properties.NamingConvention := TcxColorNamingConvention(cbColorComboNamingConvention.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbColorComboShowDescriptionPropertiesEditValueChanged(
  Sender: TObject);
begin
  ColorComboBox.Properties.ShowDescriptions := cbColorComboShowDescription.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edColorComboBoxDefaultDescriptionPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ColorComboBox.ColorValue := clDefault;
end;

procedure TframeEditorsProperties.cbColorComboBoxColorValueFormatPropertiesEditValueChanged(
  Sender: TObject);
begin
  ColorComboBox.Properties.ColorValueFormat := TcxColorValueFormat(cbColorComboBoxColorValueFormat.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbColorComboBoxColorBoxAlignPropertiesEditValueChanged(
  Sender: TObject);
begin
  ColorComboBox.Properties.ColorBoxAlign := TcxColorBoxAlign(cbColorComboBoxColorBoxAlign.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edColorComboBoxDefaultDescriptionPropertiesChange(
  Sender: TObject);
begin
  ColorComboBox.Properties.DefaultDescription := edColorComboBoxDefaultDescription.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbColorComboBoxDropDownSizablePropertiesChange(
  Sender: TObject);
begin
  ColorComboBox.Properties.DropDownSizeable := cbColorComboBoxDropDownSizable.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbColorComboBoxAllowSelectColorPropertiesChange(
  Sender: TObject);
begin
  ColorComboBox.Properties.AllowSelectColor := cbColorComboBoxAllowSelectColor.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbButtonColorDefaultPropertiesEditValueChanged(
  Sender: TObject);
var
  I: Integer;
begin
  if IsLoading then exit;
  for I := 0 to ButtonCount - 1 do
    FButtonArray[I].Colors.Default := cbButtonColorDefault.ColorValue;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbButtonColorDisabledPropertiesEditValueChanged(
  Sender: TObject);
var
  I: Integer;
begin
  if IsLoading then exit;
  for I := 0 to ButtonCount - 1 do
    FButtonArray[I].Colors.Disabled := cbButtonColorDisabled.ColorValue;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbButtonColorHotPropertiesEditValueChanged(
  Sender: TObject);
var
  I: Integer;
begin
  if IsLoading then exit;
  for I := 0 to ButtonCount - 1 do
    FButtonArray[I].Colors.Hot := cbButtonColorHot.ColorValue;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbButtonColorNormalPropertiesEditValueChanged(
  Sender: TObject);
var
  I: Integer;
begin
  if IsLoading then exit;
  for I := 0 to ButtonCount - 1 do
    FButtonArray[I].Colors.Normal := cbButtonColorNormal.ColorValue;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbButtonColorPressedPropertiesEditValueChanged(
  Sender: TObject);
var
  I: Integer;
begin
  if IsLoading then exit;
  for I := 0 to ButtonCount - 1 do
    FButtonArray[I].Colors.Pressed := cbButtonColorPressed.ColorValue;
  RefreshObjectInspector;
end;


// TcxFontNameComboBox

procedure TframeEditorsProperties.tsFontNameComboBoxShow(
  Sender: TObject);
begin
  cbFontComboDropDownSizable.Checked := FontNameComboBox.Properties.DropDownSizeable;
  SetCheckComboBoxValue(cbFontNameComboBoxFontTypes, FontNameComboBox.Properties, 'FontTypes');
  cbFontNameComboBoxPreivewType.ItemIndex := Integer(FontNameComboBox.Properties.FontPreview.PreviewType);
  edFontNameComboBoxPreviewText.Text := FontNameComboBox.Properties.FontPreview.PreviewText;
  SetCheckComboBoxValue(cbFontNameComboBoxShowFontTypeIcon, FontNameComboBox.Properties, 'ShowFontTypeIcon');
  cbFontNameComboBoxPreviewShowButtons.Checked := FontNameComboBox.Properties.FontPreview.ShowButtons;
  cbFontNameComboBoxPreviewVisible.Checked := FontNameComboBox.Properties.FontPreview.Visible;
  cbFontNameComboBoxUseOwnFont.Checked := FontNameComboBox.Properties.UseOwnFont;
  cbFontNameComboBoxButtonBitmap.Checked := not FontNameComboBox.Properties.ButtonGlyph.Empty;
end;

procedure TframeEditorsProperties.cbFontComboDropDownSizablePropertiesEditValueChanged(
  Sender: TObject);
begin
  FontNameComboBox.Properties.DropDownSizeable := cbFontComboDropDownSizable.Checked;
  RefreshObjectInspector;
end;
procedure TframeEditorsProperties.cbFontNameComboBoxFontTypesPropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsLoading then exit;
  SetSetProp(FontNameComboBox.Properties, 'FontTypes', cbFontNameComboBoxFontTypes.EditText);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbFontNameComboBoxPreivewTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  FontNameComboBox.Properties.FontPreview.PreviewType := TcxFontPreviewType(cbFontNameComboBoxPreivewType.ItemIndex);
  edFontNameComboBoxPreviewText.Enabled := FontNameComboBox.Properties.FontPreview.PreviewType = cxfpCustom;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edFontNameComboBoxPreviewTextPropertiesChange(
  Sender: TObject);
begin
  FontNameComboBox.Properties.FontPreview.PreviewText := edFontNameComboBoxPreviewText.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbFontNameComboBoxShowFontTypeIconPropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsLoading then exit;
  SetSetProp(FontNameComboBox.Properties, 'ShowFontTypeIcon', cbFontNameComboBoxShowFontTypeIcon.EditText);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbFontNameComboBoxPreviewShowButtonsPropertiesChange(
  Sender: TObject);
begin
  FontNameComboBox.Properties.FontPreview.ShowButtons := cbFontNameComboBoxPreviewShowButtons.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbFontNameComboBoxPreviewVisiblePropertiesChange(
  Sender: TObject);
begin
  FontNameComboBox.Properties.FontPreview.Visible := cbFontNameComboBoxPreviewVisible.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbFontNameComboBoxUseOwnFontPropertiesChange(
  Sender: TObject);
begin
  FontNameComboBox.Properties.UseOwnFont := cbFontNameComboBoxUseOwnFont.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbFontNameComboBoxButtonBitmapPropertiesChange(
  Sender: TObject);
begin
  if cbFontNameComboBoxButtonBitmap.Checked then
    FontNameComboBox.Properties.ButtonGlyph.Assign(imFontNameComboBoxButtonGlyph.Picture)
  else FontNameComboBox.Properties.ButtonGlyph.Assign(nil);
  RefreshObjectInspector;
end;

// TcxCheckComboBox
procedure TframeEditorsProperties.tsCheckComboBoxShow(Sender: TObject);
begin
  edCheckComboDelimiter.Text := CheckComboBox.Properties.Delimiter;
  edCheckListBoxEmptySelectionText.Text := CheckComboBox.Properties.EmptySelectionText;
  cbCheckListBoxDropDownSizable.Checked := CheckComboBox.Properties.DropDownSizeable;
end;

procedure TframeEditorsProperties.edCheckComboDelimiterPropertiesEditValueChanged(
  Sender: TObject);
begin
  CheckComboBox.Properties.Delimiter := edCheckComboDelimiter.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbCheckComboBoxGlyphPropertiesEditValueChanged(
  Sender: TObject);
//var
//  AImageIndex: Integer;
begin
//  CheckComboBox.Properties. G.Assign(nil);
//  AImageIndex := cbCheckComboBoxGlyph.ItemIndex - 1;
//  if AImageIndex > -1 then
//    ilCheckGlyphs.GetBitmap(AImageIndex, CheckComboBox.Properties.Glyph);
//  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edCheckListBoxEmptySelectionTextPropertiesChange(
  Sender: TObject);
begin
  CheckComboBox.Properties.EmptySelectionText := edCheckListBoxEmptySelectionText.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbCheckListBoxDropDownSizablePropertiesChange(
  Sender: TObject);
begin
  CheckComboBox.Properties.DropDownSizeable := cbCheckListBoxDropDownSizable.Checked;
  RefreshObjectInspector;
end;

// TcxGroupBox
procedure TframeEditorsProperties.tsGroupBoxShow(Sender: TObject);
begin
  cbGroupBoxAlignment.ItemIndex := Integer(GroupBox.Alignment);
  edGroupBoxCaption.Text := GroupBox.Caption;
  cbGroupBoxCaptionBackColor.ColorValue := GroupBox.CaptionBkColor;
  cbGroupBoxColor.ColorValue := GroupBox.Color;
end;

procedure TframeEditorsProperties.cbGroupBoxAlignmentPropertiesEditValueChanged(
  Sender: TObject);
begin
  GroupBox.Alignment := TcxCaptionAlignment(cbGroupBoxAlignment.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edGroupBoxCaptionPropertiesChange(
  Sender: TObject);
begin
  GroupBox.Caption := edGroupBoxCaption.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbGroupBoxCaptionBackColorPropertiesEditValueChanged(
  Sender: TObject);
begin
  GroupBox.CaptionBkColor := cbGroupBoxCaptionBackColor.ColorValue;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbGroupBoxColorPropertiesEditValueChanged(
  Sender: TObject);
begin
  GroupBox.Color := cbGroupBoxColor.ColorValue;
  RefreshObjectInspector;
end;

// TcxMCListBox

procedure TframeEditorsProperties.tsMCListBoxShow(Sender: TObject);
begin
  cbMCListBoxShowColumnLines.Checked := MCListBox.ShowColumnLines;
  cbCMListBoxShowEndEllipsis.Checked := MCListBox.ShowEndEllipsis;
  cbMCListBoxSorted.Checked := MCListBox.Sorted;
  cbMCListBoxOverflowEmptyColumn.Checked := MCListBox.OverflowEmptyColumn;
  cbMCListBoxMultiLines.Checked := MCListBox.MultiLines;
  cbMCListBoxMultiSelect.Checked := MCListBox.MultiSelect;
  cbMCListBoxItems.EditValue := MCListBox.Items.Text;
  edMCListBoxDelimiter.Text := MCListBox.Delimiter;
end;

procedure TframeEditorsProperties.cbMCListBoxShowColumnLinesPropertiesChange(
  Sender: TObject);
begin
  MCListBox.ShowColumnLines := cbMCListBoxShowColumnLines.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbCMListBoxShowEndEllipsisPropertiesChange(
  Sender: TObject);
begin
  MCListBox.ShowEndEllipsis := cbCMListBoxShowEndEllipsis.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbMCListBoxSortedPropertiesChange(
  Sender: TObject);
begin
  MCListBox.Sorted := cbMCListBoxSorted.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbMCListBoxOverflowEmptyColumnPropertiesChange(
  Sender: TObject);
begin
  MCListBox.OverflowEmptyColumn := cbMCListBoxOverflowEmptyColumn.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbMCListBoxMultilinesPropertiesChange(
  Sender: TObject);
begin
  MCListBox.MultiLines := cbMCListBoxMultiLines.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbMCListBoxMultiSelectPropertiesChange(
  Sender: TObject);
begin
  MCListBox.MultiSelect := cbMCListBoxMultiSelect.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbMCListBoxHeaderDragReorderPropertiesChange(
  Sender: TObject);
begin
  MCListBox.HeaderDragReorder := cbMCListBoxHeaderDragReorder.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbMCListBoxItemsPropertiesChange(
  Sender: TObject);
begin
  MCListBox.Items.Text := cbMCListBoxItems.EditValue;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edMCListBoxDelimiterPropertiesChange(
  Sender: TObject);
begin
  if edMCListBoxDelimiter.Text <> '' then
    MCListBox.Delimiter := edMCListBoxDelimiter.Text[1]
  else MCListBox.Delimiter := ';';
  RefreshObjectInspector;
end;

//Splitter

procedure TframeEditorsProperties.tsSplitterShow(Sender: TObject);
var
  I: Integer;
begin
  for i := 0 to rgSplitterHotZone.Properties.Items.Count - 1 do
    if(rgSplitterHotZone.Properties.Items[i].Caption = Splitter.HotZoneClassName) then
    begin
      rgSplitterHotZone.ItemIndex := i;
      break;
    end;
  cbSplitterAutoSnap.Checked := Splitter.AutoSnap;
  cbSplitterResizeUpdate.Checked := Splitter.ResizeUpdate;
  cbSlitterAllowHotZoneDrag.Checked := Splitter.AllowHotZoneDrag;
  edSplitterHotZoneSizePercent.Value := Splitter.HotZone.SizePercent;  
end;

procedure TframeEditorsProperties.rgSplitterHotZoneClick(
  Sender: TObject);
begin
  if rgSplitterHotZone.ItemIndex > -1 then
    Splitter.HotZoneClassName := rgSplitterHotZone.Properties.Items[rgSplitterHotZone.ItemIndex].Caption
  else Splitter.HotZoneClassName := '';
end;


procedure TframeEditorsProperties.cbSlitterAllowHotZoneDragPropertiesChange(
  Sender: TObject);
begin
  Splitter.AllowHotZoneDrag := cbSlitterAllowHotZoneDrag.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edSplitterHotZoneSizePercentPropertiesChange(
  Sender: TObject);
begin
  Splitter.HotZone.SizePercent := edSplitterHotZoneSizePercent.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbSplitterAutoSnapPropertiesChange(
  Sender: TObject);
begin
  Splitter.AutoSnap := cbSplitterAutoSnap.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbSplitterResizeUpdatePropertiesChange(
  Sender: TObject);
begin
  Splitter.ResizeUpdate := cbSplitterResizeUpdate.Checked;
  RefreshObjectInspector;
end;

// TcxHintStyleController

procedure TframeEditorsProperties.tsHintStyleControllerShow(Sender: TObject);
begin
  HintStyle.IconType := cxhiWarning;
  cbHintStyleControllerIconType.ItemIndex := Integer(HintStyle.IconType);
  cbHintStyleControllerIconSize.ItemIndex := Integer(HintStyle.IconSize);
  cbHintStyleControllerCallOutPosition.ItemIndex := Integer(HintStyle.CallOutPosition);
  cbHintStyleControllerAnimate.ItemIndex := Integer(HintStyle.Animate);
  cbHintStyleControllerColor.ColorValue := HintStyle.Color;
  cbHintStyleControllerStandard.Checked := HintStyle.Standard;
  cbHintStyleControllerRounded.Checked := HintStyle.Rounded;
end;

procedure TframeEditorsProperties.cbHintStyleControllerIconTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  HintStyle.IconType := TcxHintIconType(cbHintStyleControllerIconType.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHintStyleControllerIconSizePropertiesEditValueChanged(
  Sender: TObject);
begin
  HintStyle.IconSize := TcxHintIconSize(cbHintStyleControllerIconSize.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHintStyleControllerCallOutPositionPropertiesEditValueChanged(
  Sender: TObject);
begin
  HintStyle.CallOutPosition := TcxCallOutPosition(cbHintStyleControllerCallOutPosition.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHintStyleControllerColorPropertiesEditValueChanged(
  Sender: TObject);
begin
  HintStyle.Color := cbHintStyleControllerColor.ColorValue;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHintStyleControllerRoundedPropertiesChange(
  Sender: TObject);
begin
  HintStyle.Rounded := cbHintStyleControllerRounded.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHintStyleControllerStandardPropertiesChange(
  Sender: TObject);
begin
  HintStyle.Standard := cbHintStyleControllerStandard.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHintStyleControllerAnimatePropertiesEditValueChanged(
  Sender: TObject);
begin
  HintStyle.Animate := TcxHintAnimate(cbHintStyleControllerAnimate.ItemIndex);
  RefreshObjectInspector;
end;

// TcxSpinButton
procedure TframeEditorsProperties.tsSpinButtonShow(Sender: TObject);
begin
  edSpinButtonIncrement.Value := SpinButton.Properties.Increment;
  edSpinButtonLargeIncrement.Value := SpinButton.Properties.LargeIncrement;
  cbSpinButtonPosition.ItemIndex := Integer(SpinButton.Properties.SpinButtons.Position);
  cbSpinButtonShowFastButtons.Checked := SpinButton.Properties.SpinButtons.ShowFastButtons;
end;

procedure TframeEditorsProperties.edSpinButtonIncrementPropertiesChange(
  Sender: TObject);
begin
  SpinButton.Properties.Increment := edSpinButtonIncrement.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edSpinButtonLargeIncrementPropertiesChange(
  Sender: TObject);
begin
  SpinButton.Properties.LargeIncrement := edSpinButtonLargeIncrement.Value;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbSpinButtonPositionPropertiesEditValueChanged(
  Sender: TObject);
begin
  SpinButton.Properties.SpinButtons.Position := TcxSpinEditButtonsPosition(cbSpinButtonPosition.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbSpinButtonShowFastButtonsPropertiesChange(
  Sender: TObject);
begin
  SpinButton.Properties.SpinButtons.ShowFastButtons := cbSpinButtonShowFastButtons.Checked;
  RefreshObjectInspector;
end;

// TcxHeader

procedure TframeEditorsProperties.tsHeaderShow(Sender: TObject);
begin
  cbHeaderResizeUpdate.Checked := Header.ResizeUpdate;
  cbHeaderDragReorder.Checked := Header.DragReorder;
  cbHeaderAllowSort.Checked := Header.AllowSort;
end;

procedure TframeEditorsProperties.cbHeaderResizeUpdatePropertiesChange(
  Sender: TObject);
begin
  Header.ResizeUpdate := cbHeaderResizeUpdate.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHeaderDragReorderPropertiesChange(
  Sender: TObject);
begin
  Header.DragReorder := cbHeaderDragReorder.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbHeaderAllowSortPropertiesChange(
  Sender: TObject);
begin
  Header.AllowSort := cbHeaderAllowSort.Checked;
  RefreshObjectInspector;
end;

// TcxShellTreeView
function TframeEditorsProperties.ShellTreeView: TcxShellTreeView;
begin
  if(FShellTreeView = nil) then
  begin
    FShellTreeView := TcxShellTreeView.Create(self);
    FShellTreeView.Parent := Panel_ShellTreeView;
    FShellTreeView.Left := 1;
    FShellTreeView.Top := 24;
    FShellTreeView.Width := 205;
    FShellTreeView.Height := 225;
    FShellTreeView.DragDropSettings.AllowDragObjects := True;
    FShellTreeView.DragDropSettings.DropEffect := [deCopy, deMove, deLink];
    FShellTreeView.DragDropSettings.DefaultDropEffect := deMove;
    FShellTreeView.Indent := 19;
    FShellTreeView.ParentColor := False;
    FShellTreeView.Root.BrowseFolder := bfDesktop;
    FShellTreeView.TabOrder := 1;

    FillTypeInfoCombo(cbShellTreeViewBrowserFolder, ShellTreeView.Root, 'BrowseFolder');
    FillObjectBooleanInfoCombo(cbShellTreeViewOptions, ShellTreeView.Options);
  end;
  Result := FShellTreeView;
end;


procedure TframeEditorsProperties.tsShellTreeViewShow(Sender: TObject);
begin
  TPageInfo(tsShellTreeView.Tag).Edit := ShellTreeView;
  cbShellTreeViewBrowserFolder.ItemIndex := Integer(ShellTreeView.Root.BrowseFolder);
  edShellTreeViewCustomPath.Text := ShellTreeView.Root.CustomPath;
  SetObjectValueToCheckComboBoxValue(cbShellTreeViewOptions, ShellTreeView.Options);
end;

procedure TframeEditorsProperties.cbShellTreeViewBrowserFolderPropertiesEditValueChanged(
  Sender: TObject);
begin
  ShellTreeView.Root.BrowseFolder := TcxBrowseFolder(cbShellTreeViewBrowserFolder.ItemIndex);
  edShellTreeViewCustomPath.Enabled := ShellTreeView.Root.BrowseFolder = bfCustomPath;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edShellTreeViewCustomPathPropertiesEditValueChanged(
  Sender: TObject);
begin
  ShellTreeView.Root.CustomPath := edShellTreeViewCustomPath.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShellTreeViewOptionsPropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsLoading then exit;
  SetCheckComboBoxValueToObjectValue(cbShellTreeViewOptions, ShellTreeView.Options);
  RefreshObjectInspector;
end;

// ShellListView
function TframeEditorsProperties.ShellListView: TcxShellListView;
begin
  if(FShellListView = nil) then
  begin
    FShellListView := TcxShellListView.Create(self);
    FShellListView.Parent := Panel_ShellListView;
    FShellListView.Left := 1;
    FShellListView.Top := 16;
    FShellListView.Width := 206;
    FShellListView.Height := 217;
    FShellListView.DragDropSettings.AllowDragObjects := True;
    FShellListView.DragDropSettings.DropEffect := [deCopy, deMove, deLink];
    FShellListView.DragDropSettings.DefaultDropEffect := deMove;
    FShellListView.ParentColor := False;
    FShellListView.Root.BrowseFolder := bfDesktop;
    FShellListView.TabOrder := 1;
    FillTypeInfoCombo(cbShellListViewBrowserFolder, ShellListView.Root, 'BrowseFolder');
    FillObjectBooleanInfoCombo(cbShellListViewOptions, ShellListView.Options);
  end;
  Result := FShellListView;
end;

procedure TframeEditorsProperties.tsShellListViewShow(Sender: TObject);
begin
  TPageInfo(tsShellListView.Tag).Edit := ShellListView;
  cbShellListViewBrowserFolder.ItemIndex := Integer(ShellListView.Root.BrowseFolder);
  edShellListViewCustomPath.Text := ShellListView.Root.CustomPath;
  SetObjectValueToCheckComboBoxValue(cbShellListViewOptions, ShellListView.Options);
end;

procedure TframeEditorsProperties.cbShellListViewBrowserFolderPropertiesEditValueChanged(
  Sender: TObject);
begin
  ShellListView.Root.BrowseFolder := TcxBrowseFolder(cbShellListViewBrowserFolder.ItemIndex);
  edShellListViewCustomPath.Enabled := ShellListView.Root.BrowseFolder = bfCustomPath;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edShellListViewCustomPathPropertiesEditValueChanged(
  Sender: TObject);
begin
  ShellListView.Root.CustomPath := edShellListViewCustomPath.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShellListViewOptionsPropertiesEditValueChanged(
  Sender: TObject);
begin
  if IsLoading then exit;
  SetCheckComboBoxValueToObjectValue(cbShellListViewOptions, ShellListView.Options);
  RefreshObjectInspector;
end;

// TcxShellComboBox
function TframeEditorsProperties.ShellComboBox: TcxShellComboBox;
begin
  if(FShellComboBox = nil) then
  begin
    FShellComboBox := TcxShellComboBox.Create(self);
    FShellComboBox.Parent := self.Panel_ShellComboBox;
    FShellComboBox.Left := 3;
    FShellComboBox.Top := 24;
    FShellComboBox.Width := 159;
    FShellComboBox.Height := 24;
    FShellComboBox.Properties.DropDownWidth := 250;
    FShellComboBox.Properties.Root.BrowseFolder := bfDesktop;
    FShellComboBox.TabOrder := 1;
    FillTypeInfoCombo(cbShellComboBoxBrowserFolder, ShellComboBox.Properties.Root, 'BrowseFolder');
  end;
  Result := FShellComboBox;
end;

procedure TframeEditorsProperties.tsShellComboBoxShow(Sender: TObject);
begin
  TPageInfo(tsShellComboBox.Tag).Edit := ShellComboBox;
  cbShellComboBoxBrowserFolder.ItemIndex := Integer(ShellComboBox.Properties.Root.BrowseFolder);
  edShellComboBoxCustomPath.Text := ShellComboBox.Properties.Root.CustomPath;
  cbShellCombBoxDropDownSizable.Checked := ShellComboBox.Properties.DropDownSizeable;
//  cbShellCombBoxRelativeNames.Checked := ShellComboBox.Properties.;
end;

procedure TframeEditorsProperties.cbShellComboBoxBrowserFolderPropertiesEditValueChanged(
  Sender: TObject);
begin
  ShellComboBox.Properties.Root.BrowseFolder := TcxBrowseFolder(cbShellComboBoxBrowserFolder.ItemIndex);
  edShellComboBoxCustomPath.Enabled := ShellComboBox.Properties.Root.BrowseFolder = bfCustomPath;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.edShellComboBoxCustomPathPropertiesEditValueChanged(
  Sender: TObject);
begin
  ShellComboBox.Properties.Root.CustomPath := edShellComboBoxCustomPath.Text;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShellCombBoxDropDownSizablePropertiesChange(
  Sender: TObject);
begin
  ShellComboBox.Properties.DropDownSizeable := cbShellCombBoxDropDownSizable.Checked;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbShellCombBoxRelativeNamesPropertiesChange(
  Sender: TObject);
begin
//  ShellComboBox.Properties.RelativeNames := cbShellCombBoxRelativeNames.Checked;
  RefreshObjectInspector;
end;


// TcxTreeView

procedure TframeEditorsProperties.tsTreeViewShow(Sender: TObject);
begin
  //TODO

end;

// TcxListView
procedure TframeEditorsProperties.tsListViewShow(Sender: TObject);
begin
  cbListViewViewStyle.ItemIndex := Integer(ListView.ViewStyle);
end;

procedure TframeEditorsProperties.cbListViewViewStylePropertiesEditValueChanged(
  Sender: TObject);
begin
  ListView.ViewStyle := TViewStyle(cbListViewViewStyle.ItemIndex);
  RefreshObjectInspector;
end;

function TframeEditorsProperties.GetHintStyle: TcxHintStyle;
begin
  Result := FHintStyleController.HintStyle as TcxHintStyle;
end;

function TframeEditorsProperties.GetRichEditText: string;
var
  AStrings: TStringList;
begin
  AStrings := TStringList.Create;
  try
    AStrings.LoadFromFile(ExtractFilePath(Application.ExeName) + 'lipsum.rtf');
    Result := AStrings.Text;
  finally
    AStrings.Free;
  end;
end;

procedure TframeEditorsProperties.edRichScrollBarPropertiesChange(Sender: TObject);
begin
  RichEdit.Properties.ScrollBars := TScrollStyle(edRichScrollBars.ItemIndex);
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbRichPlainTextPropertiesChange(
  Sender: TObject);
begin
  RichEdit.Properties.PlainText := cbRichPlainText.Checked;
  RichEdit.EditValue := GetRichEditText;
  RefreshObjectInspector;
end;

procedure TframeEditorsProperties.cbRichSelectionBarPropertiesChange(
  Sender: TObject);
begin
  RichEdit.Properties.SelectionBar := cbRichSelectionBar.Checked;
  RefreshObjectInspector;
end;

initialization
  dxFrameManager.RegisterFrame(EditorsPropertiesFrameID, TframeEditorsProperties,
    EditorPropertiesFrameName, EditorsPropertiesImageIndex, ExpressEditorsGroupIndex, -1, -1);


end.
