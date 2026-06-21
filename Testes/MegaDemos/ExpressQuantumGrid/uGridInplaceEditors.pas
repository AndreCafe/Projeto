unit uGridInplaceEditors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxStyles, cxControls, cxGrid, StdCtrls, ExtCtrls,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridLevel,
  cxEditRepositoryItems, cxDBEditRepository, cxDBExtLookupComboBox,
  cxDataStorage, DB, cxDBData, cxGridDBTableView, Propertiespopup,
  cxDropDownEdit, cxExtEditRepositoryItems, cxShellEditRepositoryItems,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxLabel;

type
  TfrmInplaceEditorsGrid = class(TdxGridFrame)
    GridLevel: TcxGridLevel;
    GridTableView: TcxGridTableView;
    clmName: TcxGridColumn;
    clmValue: TcxGridColumn;
    EditRepository: TcxEditRepository;
    EditRepositoryBlobItem: TcxEditRepositoryBlobItem;
    EditRepositoryButtonItem: TcxEditRepositoryButtonItem;
    EditRepositoryCalcItem: TcxEditRepositoryCalcItem;
    EditRepositoryCheckBoxItem: TcxEditRepositoryCheckBoxItem;
    EditRepositoryComboBoxItem: TcxEditRepositoryComboBoxItem;
    EditRepositoryCurrencyItem: TcxEditRepositoryCurrencyItem;
    EditRepositoryDateItem: TcxEditRepositoryDateItem;
    EditRepositoryExtLookupComboBoxItem: TcxEditRepositoryExtLookupComboBoxItem;
    EditRepositoryHyperLinkItem: TcxEditRepositoryHyperLinkItem;
    EditRepositoryImageItem: TcxEditRepositoryImageItem;
    EditRepositoryImageComboBoxItem: TcxEditRepositoryImageComboBoxItem;
    EditRepositoryLookupComboBoxItem: TcxEditRepositoryLookupComboBoxItem;
    EditRepositoryMaskItem: TcxEditRepositoryMaskItem;
    EditRepositoryMemoItem: TcxEditRepositoryMemoItem;
    EditRepositoryMRUItem: TcxEditRepositoryMRUItem;
    EditRepositoryPopupItem: TcxEditRepositoryPopupItem;
    EditRepositoryRadioGroupItem: TcxEditRepositoryRadioGroupItem;
    EditRepositorySpinItem: TcxEditRepositorySpinItem;
    EditRepositoryTextItem: TcxEditRepositoryTextItem;
    EditRepositoryTimeItem: TcxEditRepositoryTimeItem;
    EditRepositoryFontNameComboBoxItem: TcxEditRepositoryFontNameComboBox;
    EditRepositoryProgressBarItem: TcxEditRepositoryProgressBar;
    EditRepositoryShellComboBoxItem: TcxEditRepositoryShellComboBoxItem;
    EditRepositoryTrackBarItem: TcxEditRepositoryTrackBar;
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
    GridViewRepository: TcxGridViewRepository;
    GridViewRepositoryDBTableView: TcxGridDBTableView;
    GridDBTableViewFIRSTNAME: TcxGridDBColumn;
    GridDBTableViewLASTNAME: TcxGridDBColumn;
    GridDBTableViewPAYMENTTYPE: TcxGridDBColumn;
    GridDBTableViewPRODUCTID: TcxGridDBColumn;
    styleLabel: TcxStyle;
    EditRepositoryRichItem: TcxEditRepositoryRichItem;
    procedure clmValueGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure EditRepositoryButtonItemPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure EditRepositoryMRUItemPropertiesButtonClick(Sender: TObject);
    procedure EditRepositoryPopupItemPropertiesInitPopup(Sender: TObject);
    procedure GridTableViewGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
  private
    fmPopupTree: TfmPopupTree;
  protected
    function GetDescription: string; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //function GetPrintableComponent: TComponent; override;
  end;

  TInpaceDataDataSource = class(TcxCustomDataSource)
  private
    FEditRepository: TcxEditRepository;
    FValues: Array[0..50] of Variant;
    function GetEditorName(AIndex: Integer): string;
    function GetEditorValue(AIndex: Integer): Variant;
    procedure SetEditorValue(AIndex: Integer; const AValue: Variant);
    function GetRichEditText: string;
  protected
    function GetRecordCount: Integer; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    procedure SetValue(ARecordHandle: TcxDataRecordHandle;
        AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
  public
    constructor Create(const AEditRepository: TcxEditRepository);
  end;

implementation

uses
  dxFrames, FrameIDs, maindata, uStrsConst;

{$R *.dfm}

{ TfrmInplaceEditorsGrid }

constructor TfrmInplaceEditorsGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  GridTableView.DataController.CustomDataSource := TInpaceDataDataSource.Create(EditRepository);
  GridTableView.DataController.CustomDataSource.DataChanged;
  clmName.DataBinding.ValueTypeClass := TcxStringValueType;
  clmValue.DataBinding.ValueTypeClass := TcxVariantValueType;
  fmPopupTree := TfmPopupTree.Create(nil);
  EditRepositoryPopupItem.Properties.PopupControl := fmPopupTree.pnPopupControl;  
end;

destructor TfrmInplaceEditorsGrid.Destroy;
begin
  fmPopupTree.Free;
  GridTableView.DataController.CustomDataSource.Free;
  inherited Destroy;
end;

{function TfrmInplaceEditorsGrid.GetPrintableComponent: TComponent;
begin
  Result := nil;
end;}


function TfrmInplaceEditorsGrid.GetDescription: string;
begin
  Result := sdxFrameInplaceEditors;
end;


{ TInpaceDataDataSource }

constructor TInpaceDataDataSource.Create(const AEditRepository: TcxEditRepository);
begin
  FEditRepository := AEditRepository;

//EditRepositoryBlobItem: TcxEditRepositoryBlobItem;
  FValues[0] := sdxInpaceFrame_BlobItem;
//EditRepositoryButtonItem: TcxEditRepositoryButtonItem;
  FValues[1] := sdxInpaceFrame_ButtonItem;
//EditRepositoryCalcItem: TcxEditRepositoryCalcItem;
  FValues[2] := 12340;
//EditRepositoryCheckBoxItem: TcxEditRepositoryCheckBoxItem;
  FValues[3] := True;
//EditRepositoryComboBoxItem: TcxEditRepositoryComboBoxItem;
  FValues[4] := 'Green';
//EditRepositoryCurrencyItem: TcxEditRepositoryCurrencyItem;
  FValues[5] := 12345.34;
//EditRepositoryDateItem: TcxEditRepositoryDateItem;
  FValues[6] := Date;
//EditRepositoryExtLookupComboBoxItem: TcxEditRepositoryExtLookupComboBoxItem;
  FValues[7] := dmmain.cdsDXCustomers.FindField('ID').AsInteger;
//EditRepositoryHyperLinkItem: TcxEditRepositoryHyperLinkItem;
  FValues[8] := 'http://www.devexpress.com';
//EditRepositoryImageItem: TcxEditRepositoryImageItem;
  FValues[9] := dmmain.cdsMovies.FindField('Photo').Value;
//EditRepositoryImageComboBoxItem: TcxEditRepositoryImageComboBoxItem;
  FValues[10] := 2;
//EditRepositoryLookupComboBoxItem: TcxEditRepositoryLookupComboBoxItem;
  FValues[11] := dmmain.cdsDXProducts.FindField('ID').AsInteger;
//EditRepositoryMaskItem: TcxEditRepositoryMaskItem;
  FValues[12] := '(234)897-235';
//EditRepositoryMemoItem: TcxEditRepositoryMemoItem;
  FValues[13] := sdxInpaceFrame_MemoItem;
//EditRepositoryMRUItem: TcxEditRepositoryMRUItem;
  FValues[14] := sdxInpaceFrame_MRUItem;
//EditRepositoryPopupItem: TcxEditRepositoryPopupItem;
  FValues[15] := sdxInplaceFrame_PopupItem;
//EditRepositoryRadioGroupItem: TcxEditRepositoryRadioGroupItem;
  FValues[16] := 0;
//EditRepositorySpinItem: TcxEditRepositorySpinItem;
  FValues[17] := 10;
//EditRepositoryTextItem: TcxEditRepositoryTextItem;
  FValues[18] := sdxInpaceFrame_TextItem;
//EditRepositoryTimeItem: TcxEditRepositoryTimeItem;
  FValues[19] := Now;
//  EditRepositoryFontNameComboBox: TcxEditRepositoryFontNameComboBox;
  FValues[20] := 'Arial';
//  EditRepositoryProgressBar: TcxEditRepositoryProgressBar;
  FValues[21] := 60;
// EditRepositoryRich: TcxEditRepositoryRich
  FValues[22] := GetRichEditText;
//  EditRepositoryShellComboBoxItem: TcxEditRepositoryShellComboBoxItem;
  FValues[23] := 'Desktop';
//  EditRepositoryTrackBar: TcxEditRepositoryTrackBar;
  FValues[24] := 4;
end;

function TInpaceDataDataSource.GetRichEditText: string;
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

function TInpaceDataDataSource.GetRecordCount: Integer;
begin
  Result := FEditRepository.Count;
end;

function TInpaceDataDataSource.GetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle): Variant;
var
  AColumnId: Integer;
begin
  AColumnId := GetDefaultItemID(Integer(AItemHandle));
  case AColumnId of
    0: Result := GetEditorName(Integer(ARecordHandle));
    1: Result := GetEditorValue(Integer(ARecordHandle));
    else Result := Null;
  end;
end;

procedure TInpaceDataDataSource.SetValue(
  ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle;
  const AValue: Variant);
var
  AColumnId: Integer;
begin
  AColumnId := GetDefaultItemID(Integer(AItemHandle));
  if AColumnId = 1 then
    SetEditorValue(Integer(ARecordHandle), AValue);
end;

function TInpaceDataDataSource.GetEditorName(AIndex: Integer): string;
begin
  Result := FEditRepository.Items[AIndex].Name;
  Result := Copy(Result, Length(FEditRepository.Name) + 1, Length(Result));
  Result := Copy(Result, 1, Pos('Item', Result) - 1) + ' Editor';
end;

function TInpaceDataDataSource.GetEditorValue(AIndex: Integer): Variant;
begin
  Result := FValues[AIndex];
end;

procedure TInpaceDataDataSource.SetEditorValue(AIndex: Integer; const AValue: Variant);
begin
  FValues[AIndex] := AValue;
end;

procedure TfrmInplaceEditorsGrid.clmValueGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties := EditRepository.Items[ARecord.RecordIndex].Properties;
end;

procedure TfrmInplaceEditorsGrid.EditRepositoryButtonItemPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowMessage('Hi!');
end;

procedure TfrmInplaceEditorsGrid.EditRepositoryMRUItemPropertiesButtonClick(
  Sender: TObject);
begin
  ShowMessage(sdxInpaceFrame_MRUItemClick);
end;

procedure TfrmInplaceEditorsGrid.EditRepositoryPopupItemPropertiesInitPopup(
  Sender: TObject);
begin
  fmPopupTree.PopupEdit := TcxPopupEdit(Sender);
end;

procedure TfrmInplaceEditorsGrid.GridTableViewGetCellHeight(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
  if(ARecord.RecordIndex = 22) then
    AHeight := 300;

end;

initialization
  dxFrameManager.RegisterFrame(GridInplaceEditorsFrameID, TfrmInplaceEditorsGrid,
    GridInplaceEditorsFrameName, GridInplaceEditorsImageIndex, EditingGroupIndex, -1, -1);

end.
