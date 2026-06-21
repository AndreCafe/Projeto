unit uCustomEditorsProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, ImgList, ExtDlgs, dxOperationTypes,
  ToolWin, ComCtrls,  DBCtrls, cxOI,{dxOI }Menus, cxEdit, cxGridDemoUtils, uStrsConst,
  TypInfo, cxDropDownEdit, cxLookAndFeels, cxVGrid, cxGrid, cxGridCustomView,
  cxGridDBTableView, cxGraphics, cxControls, cxLookAndFeelPainters,
  cxContainer, cxLabel;

type

  TPageInfo = class
    Caption: string;
    Description: string;
    TabSheet: TTabSheet;
    Panel: TPanel;
    Edit: TComponent;
    UpdateEditors: TNotifyEvent;
  end;

  TcxCustomEditAccessor = class(TcxCustomEdit);

  TdxEditEdition = (eeNonDB, eeDB, eeBoth, eeNone);
  TdxEditPropertiesState = (epsLoading);
  TdxEditPropertiesStates = set of TdxEditPropertiesState;

  TframeCustomEditorsProperties = class(TdxFrame)
    PTitle: TPanel;
    lbEditName: TcxLabel;
    lbEditDescription: TcxLabel;
    Bevel23: TBevel;
    pnlPageControl: TPanel;
    spHint: TShape;
    lbHint: TcxLabel;
    PageControl: TPageControl;
    Panel1: TPanel;
    pnlInspector: TPanel;
    PageScroller: TPageScroller;
    ToolBar: TToolBar;
    lblSeparator: TcxLabel;
    imgEditIcon: TImageList;
    Bevel: TBevel;
  private
    fObjectInspector: TcxRTTIInspector;
    fState: TdxEditPropertiesStates;


    procedure AssignEnterLeaveEvents;
    function GetPanelByTabSheet(ATabSheet: TTabSheet): TPanel;
    procedure InitPanelBkColor(APanel: TPanel);
    procedure InitPanelBkColors;
    function IsPropertyForbidden(const PropertyName: string): Boolean;

    procedure DoToolButtonClick(Sender: TObject);
    procedure DoPageControlChanged;
    procedure EditMouseEnter(Sender: TObject);
    procedure EditMouseLeave(Sender: TObject);
    procedure DoObjectInspectorChange(Sender: TObject);
    procedure FilterProperty(Sender: TObject; const PropertyName: string;
      var Accept: Boolean);
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    procedure UpdateOperations; override;
    procedure LookAndFeelChanged; override;

    procedure DoCreatePageInfo(AImageIndex: Integer; ACaption, ADescription: string); virtual;
    procedure CreatePageInfos; virtual; abstract;
    procedure InitForm; virtual;
    procedure InitTypInfoComboBoxes; virtual;
    procedure DestroyPageInfos; virtual;

    procedure CreatePageInfo(AImageIndex: Integer;  AEdit: TComponent; ATabSheet: TTabSheet;
      AUpdateEditors: TNotifyEvent; ACaption, ADescription: String; AEditEdition: TdxEditEdition);
    procedure CreateToolButton(ATabSheet: TTabSheet; AImageIndex: Integer; ACaption: String);
    function GetActivePageInfo: TPageInfo;
    function IsLoading: Boolean;
    procedure RefreshObjectInspector;

    property State: TdxEditPropertiesStates read fState;
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
  end;

procedure FillTypeInfoCombo(ACombo: TcxComboBox; AInstance: TObject; APropName: string);

implementation

uses
  dxOffice11;

{$R *.dfm}

procedure FillTypeInfoCombo(ACombo: TcxComboBox; AInstance: TObject; APropName: string);
var
  APropInfo: PPropInfo;
  I: Integer;
  AOldEditValueChanged: TNotifyEvent;
begin
  AOldEditValueChanged := ACombo.Properties.OnEditValueChanged;
//  ACombo.Properties.OnEditValueChanged := nil;
  ACombo.Properties.DropDownListStyle := lsFixedList;
  APropInfo := GetPropInfo(AInstance.ClassType, APropName);
  if (APropInfo <> nil) and (APropInfo.PropType <> nil) then
    for I := GetTypeData(APropInfo.PropType^)^.MinValue to GetTypeData(APropInfo.PropType^)^.MaxValue do
       ACombo.Properties.Items.Append(GetEnumName(APropInfo.PropType^, I));
  ACombo.Properties.OnEditValueChanged := AOldEditValueChanged;     
end;

constructor TframeCustomEditorsProperties.Create(AComponent: TComponent);
begin
  fState := fState + [epsLoading];
  inherited Create(AComponent);
  fObjectInspector := TcxRTTIInspector.Create(self);
  fObjectInspector.Parent := pnlInspector;
  fObjectInspector.Align := alClient;
  fObjectInspector.OptionsView.RowHeaderWidth := 140;
  fObjectInspector.onPropertyChanged := DoObjectInspectorChange;
  fObjectInspector.OnFilterProperty := FilterProperty;
  fObjectInspector.OptionsView.PaintStyle := psdotNet;
  CreatePageInfos;
  InitPanelBkColors;
  InitTypInfoComboBoxes;
  InitForm;
  DoToolButtonClick(ToolBar.Buttons[0]);
  fState := fState - [epsLoading];
end;

destructor TframeCustomEditorsProperties.Destroy;
begin
  DestroyPageInfos;
  inherited Destroy;
end;

procedure TframeCustomEditorsProperties.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
end;

procedure TframeCustomEditorsProperties.AddOperations;
  procedure AddFileOperations;
  begin
    with Operations do
    begin
      AddOperation(otExportTo, nil);
      AddOperation(otExportToHTML, nil);
      AddOperation(otExportToXML, nil);
      AddOperation(otExportToExcel, nil);
      AddOperation(otExportToText, nil);
      AddOperation(otPrintStyles, nil);
      AddOperation(otDefinePrintStyles, nil);
      AddOperation(otPrintPreview, nil);
      AddOperation(otPrint, nil);
      AddOperation(otStyles, nil);
    end;
  end;

begin
  inherited;
  AddFileOperations;
end;

procedure TframeCustomEditorsProperties.UpdateOperations;
begin
  inherited UpdateOperations;
  Operations[otStyles].Enabled := True;
end;


procedure TframeCustomEditorsProperties.AssignEnterLeaveEvents;
var
  AComponent: TComponent;
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    AComponent := Components[I];
    if (AComponent is TcxCustomEdit){ or (AComponent is TPanel))}
      and (TcxCustomEditAccessor(AComponent).Hint <> '') then
    begin
      TcxCustomEditAccessor(AComponent).OnMouseEnter := EditMouseEnter;
      TcxCustomEditAccessor(AComponent).OnMouseLeave := EditMouseLeave;
    end;
  end;
end;

function TframeCustomEditorsProperties.GetPanelByTabSheet(ATabSheet: TTabSheet): TPanel;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to ATabSheet.ControlCount - 1 do
  begin
    if (ATabSheet.Controls[i] is TPanel) and (TPanel(ATabSheet.Controls[i]).Align = alClient) then
    begin
      Result := ATabSheet.Controls[i] as TPanel;
      Result.Visible := False;
      Result.Align := alTop;
      Result.Parent := pnlPageControl;
      break;
    end;
  end;
end;

procedure TframeCustomEditorsProperties.DoCreatePageInfo(AImageIndex: Integer; ACaption, ADescription: string);
begin
end;

type
  TPanelAccessor = class(TPanel);


procedure TframeCustomEditorsProperties.InitPanelBkColor(APanel: TPanel);
var
  AColor: TColor;
  AControl: TControl;
  I: Integer;
begin
  if RootLookAndFeel.ActiveStyle in [lfsNative, lfsOffice11] then
  begin
    APanel.ParentColor := True;
    APanel.ParentBackground := True;
  end else
  begin
    APanel.ParentColor := False;
    APanel.ParentBackground := False;
    AColor := LightColor($00E0E0E0, 3, 10);
    AColor := GetNearestColor(Application.MainForm.Canvas.Handle, AColor);
    for I := 0 to APanel.ControlCount - 1 do
    begin
      AControl := APanel.Controls[I];
      if (AControl is TPanel) and
        (CompareText(Copy(AControl.Name, 1, Length(stPanelBkName)), stPanelBkName) = 0) then
      begin
        (AControl as TPanel).Color := AColor;
        Break;
      end;
    end;
  end;
end;

procedure TframeCustomEditorsProperties.InitPanelBkColors;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if ((Components[i] is TPanel) and (Pos('PANELBK', UpperCase(Components[i].Name)) > 0)) then
      InitPanelBkColor(Components[i] as TPanel);
end;

procedure TframeCustomEditorsProperties.InitForm;
var
  i: Integer;
begin
  if Screen.Fonts.IndexOf('Tahoma') = -1 then
  begin
    ResetDefaultFontName(Self);
  end;
  AssignEnterLeaveEvents;
  lbEditName.Style.Font.Style := lbEditName.Style.Font.Style + [fsBold];
  lbEditName.Style.Font.Size := 9;
  lbHint.Style.Font.Color := clInfoText;
  for i := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[i].TabVisible := False;
end;

procedure TframeCustomEditorsProperties.InitTypInfoComboBoxes;
begin
end;

procedure TframeCustomEditorsProperties.DestroyPageInfos;
var
  i: Integer;
begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    TPageInfo(PageControl.Pages[i].Tag).Free;
    PageControl.Pages[i].Tag := 0;
  end;
end;


function TframeCustomEditorsProperties.GetActivePageInfo: TPageInfo;
begin
  if PageControl.ActivePage <> nil then
     Result := TPageInfo(PageControl.ActivePage.Tag)
  else Result := nil;
end;

function TframeCustomEditorsProperties.IsLoading: Boolean;
begin
  Result := (csLoading in ComponentState) or (epsLoading in fState);
end;


procedure TframeCustomEditorsProperties.CreatePageInfo(AImageIndex: Integer; AEdit: TComponent; ATabSheet: TTabSheet;
        AUpdateEditors: TNotifyEvent;  ACaption, ADescription: string; AEditEdition: TdxEditEdition);
const
  EditEditionSts: Array[TdxEditEdition] of String = (sdxEditorNonDataAwareEdition,
                                                    sdxEditorDataAwareEdition,
                                                    sdxEditorBothEditions,
                                                    '');
begin
  ATabSheet.Tag := Integer(TPageInfo.Create);
  with TPageInfo(ATabSheet.Tag) do
  begin
    Caption := ACaption + ' ' + EditEditionSts[AEditEdition];
    Description := ADescription;
    Edit := AEdit;
    UpdateEditors := AUpdateEditors;
    Panel := GetPanelByTabSheet(ATabSheet);
  end;
  CreateToolButton(ATabSheet, AImageIndex, ACaption);
  DoCreatePageInfo(AImageIndex, ACaption, ADescription);
end;

procedure TframeCustomEditorsProperties.CreateToolButton(ATabSheet: TTabSheet; AImageIndex: Integer; ACaption: String);
var
  ToolButton: TToolButton;
begin
  ToolButton := TToolButton.Create(self);
  ToolButton.Parent := ToolBar;
  ToolButton.Hint := ACaption;
  ToolButton.ImageIndex := AImageIndex;
  ToolButton.ShowHint := True;
  ToolButton.Tag := Integer(ATabSheet);
  ToolButton.onClick := DoToolButtonClick;
  ToolButton.Grouped := True;
  ToolButton.Style := tbsCheck;
  if ToolBar.ButtonCount > 0 then
  with ToolBar.Buttons[ToolBar.ButtonCount - 1] do
  begin
    ToolBar.Width := Left + Width + ToolButton.Width;
    ToolButton.Left := Left + Width;
  end;
end;

procedure TframeCustomEditorsProperties.DoToolButtonClick(Sender: TObject);
begin
  if PageControl.ActivePage = TTabSheet(TComponent(Sender).Tag) then
    exit;
  try
    LockWindowUpdate(pnlPageControl.Handle);
    if (GetActivePageInfo <> nil) then
      GetActivePageInfo.Panel.Visible := False;
    PageControl.ActivePage := TTabSheet(TComponent(Sender).Tag);
    DoPageControlChanged;
  finally
    LockWindowUpdate(0);
    RedrawWindow(pnlPageControl.Handle, nil, 0, RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN);
  end;
end;

procedure TframeCustomEditorsProperties.DoPageControlChanged;
begin
  if (PageControl.ActivePage = nil) and (PageControl.PageCount = 0) then exit;
  fState := fState + [epsLoading];
  if (PageControl.ActivePage = nil) then
    PageControl.ActivePage := PageControl.Pages[0];
  GetActivePageInfo.Panel.Visible := True;
  lbEditName.Caption := GetActivePageInfo.Caption;
  lbEditDescription.Caption := GetActivePageInfo.Description;
  GetActivePageInfo.UpdateEditors(PageControl.ActivePage);
  fObjectInspector.InspectedObject := GetActivePageInfo.Edit;
  fState := fState - [epsLoading];
end;


procedure TframeCustomEditorsProperties.EditMouseEnter(Sender: TObject);
begin
  if (Sender is TControl) then
    lbHint.Caption := TControl(Sender).Hint;
end;

procedure TframeCustomEditorsProperties.EditMouseLeave(Sender: TObject);
begin
  lbHint.Caption := '';
end;

procedure TframeCustomEditorsProperties.DoObjectInspectorChange(Sender: TObject);
var
  oldState: TdxEditPropertiesStates;
begin
  oldState := State;
  FState := State + [epsLoading];
  if GetActivePageInfo <> nil then
    GetActivePageInfo.UpdateEditors(Sender);
  FState := OldState;  
end;

procedure TframeCustomEditorsProperties.FilterProperty(Sender: TObject;
  const PropertyName: string; var Accept: Boolean);
begin
  Accept :=
    not HasProperty(TComponent, PropertyName) and
    not IsPropertyForbidden(PropertyName);
end;

function TframeCustomEditorsProperties.IsPropertyForbidden(const PropertyName: string): Boolean;
const
  ForbiddenItemCount = 16;
  ForbiddenItems: array[0..ForbiddenItemCount - 1] of string =
    ('Buttons', 'DBGridLayout', 'FieldName', 'OEMConvert',
     'MaxDisplayLength', 'PopupControl',
     'SortBySummary', 'SummaryField', 'SummaryFooterField', 'SummaryFooterFormat',
     'SummaryFooterType', 'SummaryFormat', 'SummaryGroupName', 'SummaryType',
     'Anchors', 'Constraints');
var
  I: Integer;
begin
  Result := True;
  for I := 0 to ForbiddenItemCount - 1 do
    if SameText(PropertyName, ForbiddenItems[I]) then Exit;
  Result := False;
end;

procedure TframeCustomEditorsProperties.RefreshObjectInspector;
begin
  if (fObjectInspector <> nil) and not IsLoading then
    fObjectInspector.RefreshInspectedProperties;
end;

procedure TframeCustomEditorsProperties.LookAndFeelChanged;
begin
  inherited LookAndFeelChanged;
  InitPanelBkColors;
end;

end.
