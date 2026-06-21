unit uGridInplaceEditorsValidation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxStyles, cxControls, cxGrid, StdCtrls, ExtCtrls,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridLevel,
  cxEditRepositoryItems, cxDBEditRepository, cxDBExtLookupComboBox,
  cxDataStorage, DB, cxDBData, cxGridDBTableView, Propertiespopup,
  cxDropDownEdit, cxExtEditRepositoryItems, cxShellEditRepositoryItems,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxLabel, cxNavigator, cxTextEdit, dxScreenTip, dxCustomHint,
  cxHint, cxCheckBox, cxGroupBox;

type
  TfrmInplaceEditorsValidationGrid = class(TdxGridFrame)
    GridLevel: TcxGridLevel;
    cxGridTableView: TcxGridTableView;
    cxGridTableViewColumnAddress: TcxGridColumn;
    cxGridTableViewColumnEmail: TcxGridColumn;
    cxGridTableViewColumnFirstName: TcxGridColumn;
    cxGridTableViewColumnLastName: TcxGridColumn;
    cxGridTableViewColumnPhoneNumber: TcxGridColumn;
    cxHintStyleController: TcxHintStyleController;
    dxScreenTipRepository: TdxScreenTipRepository;
    stGrid: TdxScreenTip;
    icCustomIconList: TcxImageCollection;
    icCustomIcon1: TcxImageCollectionItem;
    cxGroupBox4: TcxGroupBox;
    cbValidationRaiseException: TcxCheckBox;
    cbValidationShowErrorIcons: TcxCheckBox;
    cbValidationAllowLoseFocus: TcxCheckBox;
    cxLabel1: TcxLabel;
    procedure cxHintStyleControllerShowHintEx(Sender: TObject; var Caption, HintStr: string; var CanShow: Boolean;
      var HintInfo: THintInfo);
    procedure cxGridTableViewColumnFirstNameValidateDrawValue(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxGridTableViewColumnFirstNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableViewColumnLastNameValidateDrawValue(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxGridTableViewColumnLastNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableViewColumnAddressValidateDrawValue(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxGridTableViewColumnAddressPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableViewColumnPhoneNumberValidateDrawValue(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxGridTableViewColumnPhoneNumberPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableViewColumnEmailValidateDrawValue(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxGridTableViewColumnEmailPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
  private
    function DoAddressValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
    function DoEmailValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
    function DoFirstNameValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
    function DoLastNameValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
    function DoPhoneNumberValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
    function GetPersonFullName(ARecord: TcxCustomGridRecord): string;
  protected
    function GetDescription: string; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    procedure InitializeEditors(Sender: TObject);
  end;


implementation

uses
  dxFrames, FrameIDs, maindata, uStrsConst, cxRegExpr, cxGridRows;

{$R *.dfm}

{ TfrmInplaceEditorsValidationGrid }

constructor TfrmInplaceEditorsValidationGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InitializeEditors(Self);
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnAddressPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DoAddressValidate(DisplayValue, ErrorText);
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnAddressValidateDrawValue(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AErrorText: TCaption;
begin
  if DoAddressValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetInfo;
    AData.ErrorText := AErrorText;
  end;
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnEmailPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DoEmailValidate(DisplayValue, ErrorText);
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnEmailValidateDrawValue(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AErrorText: TCaption;
begin
  if DoEmailValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetCustom;
    AData.ErrorIcon := icCustomIcon1.Picture.Bitmap;
    AData.ErrorText := AErrorText;
  end;
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnFirstNamePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DoFirstNameValidate(DisplayValue, ErrorText);
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnFirstNameValidateDrawValue(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AErrorText: TCaption;
begin
  if DoFirstNameValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetError;
    AData.ErrorText := AErrorText;
  end;
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnLastNamePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DoLastNameValidate(DisplayValue, ErrorText);
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnLastNameValidateDrawValue(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AErrorText: TCaption;
begin
  if DoLastNameValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetError;
    AData.ErrorText := AErrorText;
  end;
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnPhoneNumberPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  AFullName: string;
begin
  Error := DoPhoneNumberValidate(DisplayValue, ErrorText);
  AFullName := GetPersonFullName(cxGridTableView.ViewData.EditingRecord);
  if Trim(AFullName) > '' then
    ErrorText := ErrorText + ' for ' + AFullName;
end;

procedure TfrmInplaceEditorsValidationGrid.cxGridTableViewColumnPhoneNumberValidateDrawValue(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AFullName: string;
  AErrorText: TCaption;
begin
  if DoPhoneNumberValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetWarning;
    AFullName := GetPersonFullName(ARecord);
    if Trim(AFullName) > '' then
      AData.ErrorText := AErrorText + ' for ' + AFullName
    else
      AData.ErrorText := AErrorText;
  end;
end;

procedure TfrmInplaceEditorsValidationGrid.cxHintStyleControllerShowHintEx(Sender: TObject; var Caption,
  HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
  stGrid.Header.Glyph.Assign(nil);
  if cbValidationShowErrorIcons.Checked and (TObject(HintInfo.HintData) is TcxGridDataCellViewInfo) then
    case TcxGridDataCellViewInfo(HintInfo.HintData).EditViewInfo.ErrorData.ErrorType of
      eetError:
        stGrid.Header.Glyph.Assign(cxEditErrorIcon);
      eetWarning:
        stGrid.Header.Glyph.Assign(cxEditWarningIcon);
      eetInfo:
        stGrid.Header.Glyph.Assign(cxEditInfoIcon);
      eetCustom:
        stGrid.Header.Glyph := icCustomIcon1.Picture.Bitmap;
    end;
end;

function TfrmInplaceEditorsValidationGrid.GetDescription: string;
begin
  Result := sdxFrameInplaceEditorsValidation;
end;

function TfrmInplaceEditorsValidationGrid.DoAddressValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
begin
  Result := (cxGridTableViewColumnAddress.Properties as TcxComboBoxProperties).Items.IndexOf(VarToStr(AValue)) = -1;
  if Result then
    AErrorText := 'Please select an address from the list';
end;

function TfrmInplaceEditorsValidationGrid.DoEmailValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
var
  S: string;
begin
  S := VarToStr(AValue);
  Result := (S <> '') and not IsTextFullValid(S, '[A-z0-9_-]+@[A-z0-9_-]+\.[A-z0-9_-]+(\.[A-z]+)*');
  if Result then
    AErrorText := 'Please enter a valid email address';
end;

function TfrmInplaceEditorsValidationGrid.DoFirstNameValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
begin
  Result := VarToStr(AValue) = '';
  if Result then
    AErrorText := 'Please enter a value';
end;

function TfrmInplaceEditorsValidationGrid.DoLastNameValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
begin
  Result := VarToStr(AValue) = '';
  if Result then
    AErrorText := 'Please enter a value';
end;

function TfrmInplaceEditorsValidationGrid.DoPhoneNumberValidate(const AValue: Variant;
  var AErrorText: TCaption): Boolean;
var
  S: string;
begin
  S := VarToStr(AValue);
  Result := (S = '') or not IsTextValid(S, '(\(\d\d\d\)'' '')?\d\d\d-\d\d\d\d');
  if Result then
    AErrorText := 'Please enter a valid phone number';
end;

function TfrmInplaceEditorsValidationGrid.GetPersonFullName(ARecord: TcxCustomGridRecord): string;
var
  AFirstName, ALastName: string;
begin
  AFirstName := VarToStr(ARecord.Values[cxGridTableViewColumnFirstName.Index]);
  ALastName := VarToStr(ARecord.Values[cxGridTableViewColumnLastName.Index]);
  if (Trim(AFirstName) > '') and (Trim(ALastName) > '') then
    Result := Format('%s %s', [AFirstName, ALastName])
  else
    Result := AFirstName + ALastName;
end;

procedure TfrmInplaceEditorsValidationGrid.InitializeEditors(Sender: TObject);
var
  AValidationOptions: TcxEditValidationOptions;
begin
  AValidationOptions := [];
  if cbValidationRaiseException.Checked then
    Include(AValidationOptions, evoRaiseException);
  if cbValidationShowErrorIcons.Checked then
    Include(AValidationOptions, evoShowErrorIcon);
  if cbValidationAllowLoseFocus.Checked then
    Include(AValidationOptions, evoAllowLoseFocus);

  cxGridTableViewColumnFirstName.Properties.ValidationOptions := AValidationOptions;
  cxGridTableViewColumnLastName.Properties.ValidationOptions := AValidationOptions;
  cxGridTableViewColumnAddress.Properties.ValidationOptions := AValidationOptions;
  cxGridTableViewColumnPhoneNumber.Properties.ValidationOptions := AValidationOptions;
  cxGridTableViewColumnEmail.Properties.ValidationOptions := AValidationOptions;
end;

initialization
  dxFrameManager.RegisterFrame(GridInplaceEditorsValidationFrameID, TfrmInplaceEditorsValidationGrid,
    GridInplaceEditorsValidationFrameName, GridInplaceEditorsValidationImageIndex, NewUpdatedGroupIndex,
    HighlightedFeaturesGroupIndex, EditingGroupIndex);

end.
