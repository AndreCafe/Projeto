unit cxTreeListInplaceEditorsFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTreeListDataModule, cxCustomTreeListBaseFormUnit,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, ImgList,
  cxEditRepositoryItems, cxDBEditRepository, cxEdit, cxInplaceContainer,
  cxTLData, StdCtrls, ExtCtrls, cxControls, cxContainer, cxGroupBox, cxTextEdit,
  cxClasses, cxColumnsMultiEditorsDemoPopup;

type
  TfrmInplaceEditors = class(TcxCustomTreeListDemoUnitForm)
    EditRepository: TcxEditRepository;
    EditRepositoryBlobItem: TcxEditRepositoryBlobItem;
    EditRepositoryButtonItem: TcxEditRepositoryButtonItem;
    EditRepositoryCalcItem: TcxEditRepositoryCalcItem;
    EditRepositoryCheckBoxItem: TcxEditRepositoryCheckBoxItem;
    EditRepositoryComboBoxItem: TcxEditRepositoryComboBoxItem;
    EditRepositoryCurrencyItem: TcxEditRepositoryCurrencyItem;
    EditRepositoryDateItem: TcxEditRepositoryDateItem;
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
    ilMain: TImageList;
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
    stlGroupNode: TcxStyle;
    stlFixedBand: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    gbTreeListPlace: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxVirtualTreeList: TcxVirtualTreeList;
    clnEditorName: TcxTreeListColumn;
    clnSample: TcxTreeListColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure clnSampleGetEditProperties(Sender: TcxTreeListColumn;
      ANode: TcxTreeListNode; var EditProperties: TcxCustomEditProperties);
    procedure EditRepositoryButtonItemPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditRepositoryPopupItemPropertiesInitPopup(Sender: TObject);
    procedure cxVirtualTreeList1StylesGetContentStyle(Sender: TcxCustomTreeList;
      AColumn: TcxTreeListColumn; ANode: TcxTreeListNode; var AStyle: TcxStyle);
    procedure cxVirtualTreeList1StylesGetNodeIndentStyle(
      Sender: TcxCustomTreeList; ANode: TcxTreeListNode; ALevel: Integer;
      var AStyle: TcxStyle);
  private
    FPopupForm: TColumnsMultiEditorsDemoPopupForm;
    function GetNodeItemIndex(ANode: TcxTreeListNode): Integer;
    function RootCount: Integer;
    function GetVirtualTreeList: TcxVirtualTreeList;
  protected
    function GetTreeList: TcxCustomTreeList; override;
  public
    procedure ActivateDataSet; override;
    procedure FrameActivated; override;
    class function GetID: Integer; override;
    property VirtualTreeList: TcxVirtualTreeList read GetVirtualTreeList;
  end;

  TcxEditorsCategoryType = (ectStandard, ectComboBoxes, ectBlobs, ectPopups);
  TcxEditorsType = (etBlob, etButton, etCalc, etCheckBox, etComboBox, etCurrency,
    etDate, etHyperLink, etImage, etImageComboBox, etLookupComboBox, etMask,
    etMemo, etMRU, etPopup, etRadioGroup, etSpinItem, etText, etTime);
const
  EditorsCategoryNames: array[TcxEditorsCategoryType] of string =
    ('Standard Editors', 'ComboBoxes', 'Blobs', 'Popups');

type
  TColumnsMultiEditorsDemoDataSource = class(TcxTreeListCustomDataSource)
  private
    FEditRepository: TcxEditRepository;
    FValues: array[TcxEditorsType] of Variant;
    FEditorNames: array[TcxEditorsType] of string;
    FCategories: array[TcxEditorsType] of TcxEditorsCategoryType;
    FTreeList: TcxVirtualTreeList;
    function GetEditorName(AEditorsType: TcxEditorsType): string;
    function GetEditorValue(AEditorsType: TcxEditorsType): Variant;
    procedure SetEditorValue(AEditorsType: TcxEditorsType; const AValue: Variant);
  protected
    function GetRecordCount: Integer; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    procedure SetValue(ARecordHandle: TcxDataRecordHandle;
        AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
    function GetParentRecordHandle(ARecordHandle: TcxDataRecordHandle): TcxDataRecordHandle; override;
  public
    constructor Create(const ATreeList: TcxVirtualTreeList;
      const AEditRepository: TcxEditRepository);
    function RootCount: Integer;
  end;

implementation

{$R *.dfm}

uses
  cxImage, cxDropDownEdit, Jpeg, cxTreeListFeaturesDemoStrConsts;

const
  scxDefaultValueBlobItem = 'Please add text here...';
  scxDefaultValueButtonItem = 'Press me...';
  scxDefaultValueMemoItem = 'Robbins studied drama at UCLA where he graduated with honors in 1981. ' +
    'That same year, he formed the Actors'''+
    ' Gang, an experimental ensemble that expressed radical political observations through ' +
    'the European avant-garde form of theater.';
  scxDefaultValueMRUItem = 'What''s your favorite color?';
  scxDefaultValuePopupItem = 'Pop me up...';
  scxDefaultValueTextItem = 'Text';
  scxDefaultValueMRUItemClick = 'You''ve pressed the MRU Inplace Editor button.';

constructor TColumnsMultiEditorsDemoDataSource.Create(
  const ATreeList: TcxVirtualTreeList;
  const AEditRepository: TcxEditRepository);

  procedure FillEditorsNames;
  begin
    FEditorNames[etImage] := 'Graphic Editor';
    FEditorNames[etImageComboBox] := 'Image ComboBox Editor';
    FEditorNames[etLookupComboBox] := 'Lookup ComboBox Editor';
    FEditorNames[etMask] := 'Advanced Mask Editor';
  end;

  procedure FillEditorsValues;
  var
    AImage: TcxImage;
    AStream: TMemoryStream;
    Img: TGraphic;
  begin
    FValues[etBlob] := scxDefaultValueBlobItem;
    FValues[etButton] := scxDefaultValueButtonItem;
    FValues[etCalc] := 12345;
    FValues[etCheckBox] := True;
    FValues[etComboBox] := 'Green';
    FValues[etCurrency] := 555.35;
    FValues[etDate] := Date;
    FValues[etHyperLink] := 'http://www.devexpress.com';
    AImage := TcxImage.Create(nil);
    AStream := TMemoryStream.Create;
    Img := TJPEGImage.Create;
    try
      dmTreeList.atCars.Open;
      dmTreeList.atCarsPicture.SaveToStream(AStream);
      AStream.Position := 0;
      Img.LoadFromStream(AStream);
      AImage.Picture.Graphic := Img;
      FValues[etImage] := AImage.EditValue;
    finally
      AImage.Free;
      Img.Free;
      AStream.Free;
    end;
    FValues[etImageComboBox] := 2;
    dmTreeList.atBiolife.Open;
    FValues[etLookupComboBox] := dmTreeList.atBiolifeID.Value;
    FValues[etMask] := '(234)897-235';
    FValues[etMemo] := scxDefaultValueMemoItem;
    FValues[etMRU] :=  scxDefaultValueMRUItem;
    FValues[etPopup] := scxDefaultValuePopupItem;
    FValues[etRadioGroup] := 0;
    FValues[etSpinItem] := 10;
    FValues[etText] := scxDefaultValueTextItem;
    FValues[etTime] := Now;
  end;
  procedure FillEditorsCategories;
  begin
    FCategories[etBlob] := ectBlobs;
    FCategories[etButton] := ectStandard;
    FCategories[etCalc] := ectPopups;
    FCategories[etCheckBox] := ectStandard;
    FCategories[etComboBox] := ectComboBoxes;
    FCategories[etCurrency] := ectStandard;
    FCategories[etDate] := ectPopups;
    FCategories[etHyperLink] := ectStandard;
    FCategories[etImage] := ectBlobs;
    FCategories[etImageComboBox] := ectComboBoxes;
    FCategories[etLookupComboBox] := ectComboBoxes;
    FCategories[etMask] := ectStandard;
    FCategories[etMemo] := ectBlobs;
    FCategories[etMRU] := ectComboBoxes;
    FCategories[etPopup] := ectPopups;
    FCategories[etRadioGroup] := ectStandard;
    FCategories[etSpinItem] := ectStandard;
    FCategories[etText] := ectStandard;
    FCategories[etTime] := ectStandard;
  end;
begin
  FTreeList := ATreeList;
  FEditRepository := AEditRepository;
  FillEditorsNames;
  FillEditorsValues;
  FillEditorsCategories;
end;

function TColumnsMultiEditorsDemoDataSource.RootCount: Integer;
begin
  Result := Integer(High(EditorsCategoryNames)) + 1;
end;

function TColumnsMultiEditorsDemoDataSource.GetRecordCount: Integer;
begin
  Result := RootCount + Integer(High(FValues)) + 1;
end;

function TColumnsMultiEditorsDemoDataSource.GetValue(
  ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle): Variant;
var
  ARecordIndex: Integer;
begin
  ARecordIndex := Integer(ARecordHandle);
  case Integer(AItemHandle) of
    0:
      if ARecordIndex < RootCount then
        Result := EditorsCategoryNames[TcxEditorsCategoryType(ARecordIndex)]
      else
        Result := GetEditorName(TcxEditorsType(ARecordIndex - RootCount));
    1:
      if Integer(ARecordHandle) > RootCount - 1 then
        Result := GetEditorValue(TcxEditorsType(ARecordIndex - RootCount));
  end;
end;

function TColumnsMultiEditorsDemoDataSource.GetParentRecordHandle(
  ARecordHandle: TcxDataRecordHandle): TcxDataRecordHandle;
begin
  if Integer(ARecordHandle) < RootCount then
    Result := inherited GetParentRecordHandle(ARecordHandle)
  else
    Result := TcxDataRecordHandle(FCategories[
      TcxEditorsType(Integer(ARecordHandle) - RootCount)])
end;

procedure TColumnsMultiEditorsDemoDataSource.SetValue(
  ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle;
  const AValue: Variant);
var
  ARecordIndex: Integer;
begin
  ARecordIndex := Integer(ARecordHandle);
  if (ARecordIndex > RootCount - 1) and (Integer(AItemHandle) = 1) then
    SetEditorValue(TcxEditorsType(ARecordIndex - RootCount), AValue);
end;

function TColumnsMultiEditorsDemoDataSource.GetEditorName(
  AEditorsType: TcxEditorsType): string;
begin
  Result := FEditorNames[AEditorsType];
  if Result = '' then
  begin
    Result := FEditRepository.Items[Integer(AEditorsType)].Name;
    Result := Copy(Result, Length(FEditRepository.Name) + 1, Length(Result));
    Result := Copy(Result, 1, Pos('Item', Result) - 1) + ' Editor';
  end;
end;

function TColumnsMultiEditorsDemoDataSource.GetEditorValue(
  AEditorsType: TcxEditorsType): Variant;
begin
  Result := FValues[AEditorsType];
end;

procedure TColumnsMultiEditorsDemoDataSource.SetEditorValue(
  AEditorsType: TcxEditorsType; const AValue: Variant);
begin
  FValues[AEditorsType] := AValue;
end;

class function TfrmInplaceEditors.GetID: Integer;
begin
  Result := 24;
end;

procedure TfrmInplaceEditors.ActivateDataset;
begin
end;

procedure TfrmInplaceEditors.FrameActivated;
begin
  inherited FrameActivated;
end;

function TfrmInplaceEditors.GetNodeItemIndex(ANode: TcxTreeListNode): Integer;
begin
  Result := -1;
  if ANode.Level = 0 then Exit;
  Result := Integer(TcxVirtualTreeListNode(ANode).RecordHandle) - RootCount;
end;

function TfrmInplaceEditors.GetTreeList: TcxCustomTreeList;
begin
  Result := cxVirtualTreeList;
end;

function TfrmInplaceEditors.GetVirtualTreeList: TcxVirtualTreeList;
begin
  Result := cxVirtualTreeList;
end;

function TfrmInplaceEditors.RootCount: Integer;
begin
  Result := TColumnsMultiEditorsDemoDataSource(
    VirtualTreeList.DataController.CustomDataSource).RootCount;
end;

procedure TfrmInplaceEditors.clnSampleGetEditProperties(
  Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
  var EditProperties: TcxCustomEditProperties);
begin
  if GetNodeItemIndex(ANode) < 0 then Exit;
  EditProperties := EditRepository.Items[GetNodeItemIndex(ANode)].Properties;
end;

procedure TfrmInplaceEditors.cxVirtualTreeList1StylesGetContentStyle(
  Sender: TcxCustomTreeList; AColumn: TcxTreeListColumn; ANode: TcxTreeListNode;
  var AStyle: TcxStyle);
begin
  if (ANode <> nil) and (ANode.Level = 0) then
    AStyle := stlGroupNode
end;

procedure TfrmInplaceEditors.cxVirtualTreeList1StylesGetNodeIndentStyle(
  Sender: TcxCustomTreeList; ANode: TcxTreeListNode; ALevel: Integer;
  var AStyle: TcxStyle);
begin
  AStyle := cxStyle1;
end;

procedure TfrmInplaceEditors.EditRepositoryButtonItemPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowMessage('Press me...');
end;

procedure TfrmInplaceEditors.EditRepositoryPopupItemPropertiesInitPopup(
  Sender: TObject);
begin
  FPopupForm.PopupEdit := TcxPopupEdit(Sender);
end;

procedure TfrmInplaceEditors.FormCreate(Sender: TObject);
begin
  FPopupForm := TColumnsMultiEditorsDemoPopupForm.Create(nil);
  EditRepositoryPopupItem.Properties.PopupControl := FPopupForm.pnlPopup;
  VirtualTreeList.CustomDataSource :=
    TColumnsMultiEditorsDemoDataSource.Create(VirtualTreeList, EditRepository);
  TreeList.FullExpand;
end;

procedure TfrmInplaceEditors.FormDestroy(Sender: TObject);
var
  ADataSource: TObject; 
begin
  FPopupForm.Free;            
  ADataSource := VirtualTreeList.CustomDataSource;
  VirtualTreeList.CustomDataSource := nil;
  ADataSource.Free;
end;

initialization
  TfrmInplaceEditors.Register;

end.
