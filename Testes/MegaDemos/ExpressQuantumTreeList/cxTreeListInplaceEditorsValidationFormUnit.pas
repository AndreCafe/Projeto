unit cxTreeListInplaceEditorsValidationFormUnit;

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
  cxClasses, cxColumnsMultiEditorsDemoPopup, cxLookAndFeels, dxBevel, cxDropDownEdit, dxScreenTip, dxCustomHint, cxHint,
  Menus, cxLabel, cxButtons, cxCheckBox;

type
  TfrmInplaceEditorsValidation = class(TcxCustomTreeListDemoUnitForm)
    cxGroupBox5: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxTreeList1: TcxTreeList;
    cxTreeList1ColumnFirstName: TcxTreeListColumn;
    cxTreeList1ColumnLastName: TcxTreeListColumn;
    cxTreeList1ColumnAddress: TcxTreeListColumn;
    cxTreeList1ColumnPhoneNumber: TcxTreeListColumn;
    cxTreeList1ColumnEmail: TcxTreeListColumn;
    icCustomIconList: TcxImageCollection;
    icCustomIcon1: TcxImageCollectionItem;
    cxHintStyleController: TcxHintStyleController;
    dxScreenTipRepository: TdxScreenTipRepository;
    stGrid: TdxScreenTip;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cbValidationRaiseException: TcxCheckBox;
    cbValidationShowErrorIcons: TcxCheckBox;
    cbValidationAllowLoseFocus: TcxCheckBox;
    cxLabel1: TcxLabel;
    procedure cxTreeList1ColumnAddressValidateDrawValue(Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
      const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxTreeList1ColumnLastNameValidateDrawValue(Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
      const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxTreeList1ColumnFirstNameValidateDrawValue(Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
      const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxTreeList1ColumnPhoneNumberValidateDrawValue(Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
      const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxTreeList1ColumnEmailValidateDrawValue(Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
      const AValue: Variant; AData: TcxEditValidateInfo);
    procedure cxHintStyleControllerShowHintEx(Sender: TObject; var Caption, HintStr: string; var CanShow: Boolean;
      var HintInfo: THintInfo);
    procedure cxTreeList1ColumnEmailPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxTreeList1ColumnPhoneNumberPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxTreeList1ColumnAddressPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxTreeList1ColumnLastNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure cxTreeList1ColumnFirstNamePropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
  private
    function DoAddressValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
    function DoEmailValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
    function DoFirstNameValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
    function DoLastNameValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
    function DoPhoneNumberValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
  protected
    function GetTreeList: TcxCustomTreeList; override;
  public
    procedure ActivateDataSet; override;
    procedure FrameActivated; override;
    class function GetID: Integer; override;
  published
    procedure InitializeEditors(Sender: TObject);
  end;

implementation

{$R *.dfm}

uses
  cxRegExpr;

procedure TfrmInplaceEditorsValidation.InitializeEditors(Sender: TObject);
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

  cxTreeList1ColumnFirstName.Properties.ValidationOptions := AValidationOptions;
  cxTreeList1ColumnLastName.Properties.ValidationOptions := AValidationOptions;
  cxTreeList1ColumnAddress.Properties.ValidationOptions := AValidationOptions;
  cxTreeList1ColumnPhoneNumber.Properties.ValidationOptions := AValidationOptions;
  cxTreeList1ColumnEmail.Properties.ValidationOptions := AValidationOptions;
end;

procedure TfrmInplaceEditorsValidation.FrameActivated;
begin
  inherited FrameActivated;
  InitializeEditors(Self);
end;

class function TfrmInplaceEditorsValidation.GetID: Integer;
begin
  Result := 54;
end;

function TfrmInplaceEditorsValidation.GetTreeList: TcxCustomTreeList;
begin
  Result := cxTreeList1;
end;

procedure TfrmInplaceEditorsValidation.ActivateDataSet;
begin
end;

procedure TfrmInplaceEditorsValidation.cxHintStyleControllerShowHintEx(Sender: TObject; var Caption, HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  stGrid.Header.Glyph.Assign(nil);
  if cbValidationShowErrorIcons.Checked and (TObject(HintInfo.HintData) is TcxTreeListEditCellViewInfo) then
    case TcxTreeListEditCellViewInfo(HintInfo.HintData).EditViewInfo.ErrorData.ErrorType of
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

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnAddressPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DoAddressValidate(DisplayValue, ErrorText);
end;

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnAddressValidateDrawValue(Sender: TcxTreeListColumn;
  ANode: TcxTreeListNode; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AErrorText: TCaption;
begin
  if DoAddressValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetInfo;
    AData.ErrorText := AErrorText;
  end;
end;

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnEmailPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DoEmailValidate(DisplayValue, ErrorText);
end;

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnEmailValidateDrawValue(Sender: TcxTreeListColumn;
  ANode: TcxTreeListNode; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AErrorText: TCaption;
begin
  if DoEmailValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetCustom;
    AData.ErrorIcon := icCustomIconList.Items[0].Picture.Bitmap;
    AData.ErrorText := AErrorText;
  end;
end;

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnFirstNamePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DoFirstNameValidate(DisplayValue, ErrorText);
end;

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnFirstNameValidateDrawValue(Sender: TcxTreeListColumn;
  ANode: TcxTreeListNode; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AErrorText: TCaption;
begin
  if DoFirstNameValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetError;
    AData.ErrorText := AErrorText;
  end;
end;

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnLastNamePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DoLastNameValidate(DisplayValue, ErrorText);
end;

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnLastNameValidateDrawValue(Sender: TcxTreeListColumn;
  ANode: TcxTreeListNode; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AErrorText: TCaption;
begin
  if DoLastNameValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetError;
    AData.ErrorText := AErrorText;
  end;
end;

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnPhoneNumberPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DoPhoneNumberValidate(DisplayValue, ErrorText);
end;

procedure TfrmInplaceEditorsValidation.cxTreeList1ColumnPhoneNumberValidateDrawValue(Sender: TcxTreeListColumn;
  ANode: TcxTreeListNode; const AValue: Variant; AData: TcxEditValidateInfo);
var
  AErrorText: TCaption;
begin
  if DoPhoneNumberValidate(AValue, AErrorText) then
  begin
    AData.ErrorType := eetWarning;
    AData.ErrorText := AErrorText;
  end;
end;

function TfrmInplaceEditorsValidation.DoAddressValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
begin
  Result := VarToStr(AValue) = '';
  if Result then
    AErrorText := 'Please select an address from the list';
end;

function TfrmInplaceEditorsValidation.DoEmailValidate(const AValue: Variant;
  var AErrorText: TCaption): Boolean;
var
  S: string;
begin
  S := VarToStr(AValue);
  Result := (S <> '') and not IsTextFullValid(S, '[A-z0-9_-]+@[A-z0-9_-]+\.[A-z0-9_-]+(\.[A-z]+)*');
  if Result then
    AErrorText := 'Please enter a valid email';
end;

function TfrmInplaceEditorsValidation.DoFirstNameValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
begin
  Result := VarToStr(AValue) = '';
  if Result then
    AErrorText := 'Please enter a value';
end;

function TfrmInplaceEditorsValidation.DoLastNameValidate(const AValue: Variant;
  var AErrorText: TCaption): Boolean;
begin
  Result := VarToStr(AValue) = '';
  if Result then
    AErrorText := 'Please enter a value';
end;

function TfrmInplaceEditorsValidation.DoPhoneNumberValidate(const AValue: Variant; var AErrorText: TCaption): Boolean;
var
  S: string;
begin
  S := VarToStr(AValue);
  Result := (S = '') or not IsTextValid(S, '(\(\d\d\d\)'' '')?\d\d\d-\d\d\d\d');
  if Result then
    AErrorText := 'Please enter a valid phone number';
end;

initialization
  TfrmInplaceEditorsValidation.Register;

end.
