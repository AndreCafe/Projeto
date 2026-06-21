unit dxGridFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, ExtCtrls, Buttons,
  DBTables, Db, StdCtrls, dxBar, dxBarDBNav, cxLookAndFeels, cxGridLevel,
  dxOperationTypes,  cxControls, dxFrame, cxGrid, cxGridCustomView,
  cxGridUIHelper, cxGridPopUpMenu, cxStyles, cxGraphics, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel;

type
  TdxGridFrame = class(TdxFrame)
    plGrid: TPanel;
    Grid: TcxGrid;
  private
    FIsNodeFooter: Boolean;
    FGridOperationHelper: TcxGridOperationHelper;

    procedure DoUpdateOperations(Sender: TObject);
    procedure DoFocuseRecordChanged(Sender: TObject);
    procedure DoCustomizationFormVisibleChanged(Sender: TObject);
    procedure DoGridPopupMenuPopup(ASenderMenu: TComponent; AHitTest: TcxCustomGridHitTest;
        X,Y: Integer; var AllowPopup: Boolean);
  protected
    FGridPopupMenu: TcxGridPopUpMenu;

  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    function GetHint: string; override;
    function GetInspectedObject: TPersistent; override;
    function GetPrintableComponent: TComponent; override;
    procedure UpdateOperations; override;
    procedure UpdateNavigationOperations; virtual;
    function IsFooterEnabled(AView: TcxCustomGridView): Boolean; virtual;
    function IsFooterMenuEnabled: Boolean; virtual;
    function IsSupportGridsChanging: Boolean; virtual;
    function IsSupportGrouping: Boolean; virtual;

    procedure DoInsert(AOperationType: TdxgdOperationType); virtual;
    procedure DoDelete(AOperationType: TdxgdOperationType); virtual;
    procedure DoFirst(AOperationType: TdxgdOperationType); virtual;
    procedure DoLast(AOperationType: TdxgdOperationType); virtual;
    procedure DoNext(AOperationType: TdxgdOperationType); virtual;
    procedure DoPrior(AOperationType: TdxgdOperationType); virtual;

    function GetActiveGrid: TcxGrid; virtual;
    function GetFocusedView: TcxCustomGridView; virtual;

    procedure DoAutoPreview(AOperationType: TdxgdOperationType);
    procedure DoAutoWidth(AOperationType: TdxgdOperationType);
    procedure DoCustomization(AOperationType: TdxgdOperationType);
    procedure DoFullCollapse(AOperationType: TdxgdOperationType);
    procedure DoFullExpand(AOperationType: TdxgdOperationType);
    procedure DoGrouping(AOperationType: TdxgdOperationType);
    procedure DoInvertSelected(AOperationType: TdxgdOperationType);
    procedure DoShowBands(AOperationType: TdxgdOperationType);
    procedure DoShowButtonsAlways(AOperationType: TdxgdOperationType);
    procedure DoShowGrid(AOperationType: TdxgdOperationType);
    procedure DoShowHeaders(AOperationType: TdxgdOperationType);
    procedure DoShowIndicator(AOperationType: TdxgdOperationType);
    procedure DoShowSummaryFooter(AOperationType: TdxgdOperationType); virtual;

    property IsNodeFooter: Boolean read FIsNodeFooter write FIsNodeFooter;
    property GridOperationHelper: TcxGridOperationHelper read FGridOperationHelper;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CanDeactivate: Boolean; override;
    procedure ChangeVisibility(AShow: Boolean); override;
    procedure DoExport(AExportType: TSupportedExportType; const AFileName: string); override;
    function ExportFileName: string; override;
    function IsSupportExport(AExportType: TSupportedExportType): Boolean; override;

    property ActiveGrid: TcxGrid read GetActiveGrid;
    property FocusedView: TcxCustomGridView read GetFocusedView;
    property GridPopupMenu: TcxGridPopUpMenu read FGridPopupMenu;
  end;

implementation

{$R *.DFM}

uses
  cxGridCustomTableView, cxGridTableView, cxGridCardView, cxGridUITableHelper,
  uStrsConst, cxGridExportLink;

{ TdxmdGridFrame }

constructor TdxGridFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FGridOperationHelper := TcxGridOperationHelper.Create(self);
  FGridOperationHelper.Grid := Grid;
  FGridOperationHelper.OnUpdateOperations := DoUpdateOperations;
  FGridOperationHelper.onFocusedRecordChanged := DoFocuseRecordChanged;
  FGridOperationHelper.onCustomizationFormVisibleChanged := DoCustomizationFormVisibleChanged;

  FGridPopupMenu := TcxGridPopUpMenu.Create(self);
  FGridPopupMenu.Grid := Grid;
  FGridPopupMenu.OnPopup := DoGridPopupMenuPopup;
  LookAndFeelChanged;
end;

destructor TdxGridFrame.Destroy;
begin
  inherited Destroy;
end;

procedure TdxGridFrame.DoUpdateOperations(Sender: TObject);
begin
  UpdateOperations;
  UpdateInspectedObject;
end;

procedure TdxGridFrame.DoFocuseRecordChanged(Sender: TObject);
begin
  UpdateNavigationOperations;
end;

procedure TdxGridFrame.DoCustomizationFormVisibleChanged(Sender: TObject);
begin
  Operations[otCustomization].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWCOLUMNCUSTOMIZING];
end;

procedure TdxGridFrame.DoGridPopupMenuPopup(ASenderMenu: TComponent;
        AHitTest: TcxCustomGridHitTest; X,Y: Integer; var AllowPopup: Boolean);
begin
  if not IsFooterMenuEnabled and
    (AHitTest.HitTestCode in [htFooter, htFooterCell]) then abort;
end;

procedure TdxGridFrame.AddBars;
begin
  inherited;
//  BarList.AddBar(btDBNavigator);
  BarList.AddBar(btStandard);
  BarList.AddBar(btFormat);
end;

procedure TdxGridFrame.AddOperations;

  procedure AddFileOperations;
  begin
    with Operations do
    begin
      if IsSupportExport(exHTML) then
      begin
        AddOperation(otExportTo, nil);
        AddOperation(otExportToHTML, nil);
        AddOperation(otExportToXML, nil);
        AddOperation(otExportToExcel, nil);
        AddOperation(otExportToText, nil);
      end;
      AddOperation(otPrintStyles, nil);
      AddOperation(otDefinePrintStyles, nil);
      AddOperation(otPrintPreview, nil);
      AddOperation(otPrint, nil);
      AddOperation(otStyles, nil);
    end;
  end;

  procedure AddNavOperations;
  begin
    with Operations do
    begin
      AddOperation(otDelete, DoDelete);
      AddOperation(otFirst, DoFirst);
      AddOperation(otInsert, DoInsert);
      AddOperation(otLast, DoLast);
      AddOperation(otNext, DoNext);
      AddOperation(otPrior, DoPrior);
    end;
  end;

  procedure AddViewOperations;
  begin
    with Operations do
    begin
      AddOperation(otGridView, nil);
      AddOperation(otAutoPreview, DoAutoPreview);
      AddOperation(otAutoWidth, DoAutoWidth);
      AddOperation(otCustomization, DoCustomization);
      AddOperation(otFullCollapse, DoFullCollapse);
      AddOperation(otFullExpand, DoFullExpand);
      AddOperation(otGrouping, DoGrouping);
      AddOperation(otInvertSelected, DoInvertSelected);
      AddOperation(otShowBands, DoShowBands);
      AddOperation(otShowButtonsAlways, DoShowButtonsAlways);
      AddOperation(otShowGrid, DoShowGrid);
      AddOperation(otShowHeaders, DoShowHeaders);
      AddOperation(otShowIndicator, DoShowIndicator);
      AddOperation(otShowSummaryFooter, DoShowSummaryFooter);
    end;
  end;

begin
  inherited;
  AddFileOperations;
  AddNavOperations;
  AddViewOperations;
end;

function TdxGridFrame.GetHint: string;
begin
  {$IFNDEF PS3}
  if IsFooterMenuEnabled then
    Result := sdxGridFrameHint1
  else Result := sdxGridFrameHint2;
  {$ELSE}
  Result := inherited GetHint;
  {$ENDIF}
end;

function TdxGridFrame.GetInspectedObject: TPersistent;
begin
  Result := FocusedView;
end;

function TdxGridFrame.GetPrintableComponent: TComponent;
begin
  Result := Grid;
end;

procedure TdxGridFrame.UpdateOperations;
begin
  inherited UpdateOperations;
  UpdateNavigationOperations;

  Operations[otFullCollapse].Enabled := FocusedView is TcxCustomGridTableView;
  Operations[otFullExpand].Enabled := FocusedView is TcxCustomGridTableView;
  Operations[otStyles].Enabled := True;

  Operations[otCustomization].Enabled := GridOperationHelper.IsOperationEnabled[GROP_SHOWCOLUMNCUSTOMIZING];
  Operations[otCustomization].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWCOLUMNCUSTOMIZING];
  Operations[otGrouping].Enabled := GridOperationHelper.IsOperationEnabled[GROP_SHOWGROUPINGPANEL] and IsSupportGrouping;
  Operations[otGrouping].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWGROUPINGPANEL];

  Operations[otShowHeaders].Enabled := GridOperationHelper.IsOperationEnabled[GROP_SHOWHEADERS];
  Operations[otShowHeaders].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWHEADERS];
  Operations[otShowSummaryFooter].Enabled := IsFooterEnabled(FocusedView) and
    GridOperationHelper.IsOperationEnabled[GROP_SHOWSUMMARYFOOTER];
  Operations[otShowSummaryFooter].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWSUMMARYFOOTER];
  Operations[otShowBands].Enabled := GridOperationHelper.IsOperationEnabled[GROP_SHOWBANDS];
  Operations[otShowBands].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWBANDS];

  Operations[otShowGrid].Enabled := IsSupportGridsChanging and GridOperationHelper.IsOperationEnabled[GROP_SHOWGRID];
  if IsSupportGridsChanging then
    Operations[otShowGrid].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWGRID];
  Operations[otAutoWidth].Enabled := GridOperationHelper.IsOperationEnabled[GROP_COLUMNAUTOWIDTH];
  Operations[otAutoWidth].Down := GridOperationHelper.IsOperationShowing[GROP_COLUMNAUTOWIDTH];
  Operations[otAutoPreview].Enabled := GridOperationHelper.IsOperationEnabled[GROP_SHOWPREVIEW];
  Operations[otAutoPreview].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWPREVIEW];
  Operations[otShowButtonsAlways].Enabled := GridOperationHelper.IsOperationEnabled[GROP_SHOWEDITBUTTONS];
  Operations[otShowButtonsAlways].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWEDITBUTTONS];
  Operations[otInvertSelected].Enabled := GridOperationHelper.IsOperationEnabled[GROP_INVERTSELECT];
  Operations[otInvertSelected].Down := GridOperationHelper.IsOperationShowing[GROP_INVERTSELECT];
  Operations[otShowIndicator].Enabled := GridOperationHelper.IsOperationEnabled[GROP_SHOWINDICATOR];
  Operations[otShowIndicator].Down := GridOperationHelper.IsOperationShowing[GROP_SHOWINDICATOR];

end;

procedure TdxGridFrame.UpdateNavigationOperations;
begin
  Operations[otFirst].Enabled := GridOperationHelper.IsOperationEnabled[GROP_FIRST];
  Operations[otLast].Enabled := GridOperationHelper.IsOperationEnabled[GROP_LAST];
  Operations[otNext].Enabled := GridOperationHelper.IsOperationEnabled[GROP_NEXT];
  Operations[otPrior].Enabled := GridOperationHelper.IsOperationEnabled[GROP_PREV];
  Operations[otInsert].Enabled := GridOperationHelper.IsOperationEnabled[GROP_INSERT];
  Operations[otDelete].Enabled := GridOperationHelper.IsOperationEnabled[GROP_DELETE];
end;

function TdxGridFrame.IsFooterEnabled(AView: TcxCustomGridView): Boolean;
begin
  Result := True;
end;

function TdxGridFrame.IsFooterMenuEnabled: Boolean;
begin
  Result := True;
end;

function TdxGridFrame.IsSupportGridsChanging: Boolean; 
begin
  Result := True;
end;

function TdxGridFrame.IsSupportGrouping: Boolean;
begin
  Result := True;
end;

procedure TdxGridFrame.DoExport(AExportType: TSupportedExportType; const AFileName: string);
begin
  case AExportType of
    exHTML:
      ExportGridToHTML(AFileName, ActiveGrid);
    exXML:
      ExportGridToXML(AFileName, ActiveGrid);
    exExcel97:
      ExportGridToExcel(AFileName, ActiveGrid);
    exExcel:
      ExportGridToXLSX(AFileName, ActiveGrid);
    exText:
      ExportGridToText(AFileName, ActiveGrid);
  end;
end;

function TdxGridFrame.ExportFileName: string;
begin
  Result := 'QGridExport';
end;

function TdxGridFrame.IsSupportExport(AExportType: TSupportedExportType): Boolean;
begin
  Result := True;
end;

procedure TdxGridFrame.DoInsert(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoInsert;
end;

procedure TdxGridFrame.DoDelete(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoDelete;
end;

procedure TdxGridFrame.DoFirst(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoFirst;
end;

procedure TdxGridFrame.DoLast(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoLast;
end;

procedure TdxGridFrame.DoNext(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoNext;
end;

procedure TdxGridFrame.DoPrior(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoPrev;
end;

function TdxGridFrame.GetActiveGrid: TcxGrid;
begin
  Result := Grid;
end;

function TdxGridFrame.GetFocusedView: TcxCustomGridView;
begin
  if ActiveGrid <> nil then
    Result := ActiveGrid.FocusedView
  else Result := nil;
end;


procedure TdxGridFrame.DoAutoPreview(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoShowPreview(Operations[otAutoPreview].Down);
end;

procedure TdxGridFrame.DoAutoWidth(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoColumnAutoWidth(Operations[otAutoWidth].Down);
end;

var
  FInfoCustomizationWasShown: Boolean = False;

procedure TdxGridFrame.DoCustomization(AOperationType: TdxgdOperationType);
begin
  if not FInfoCustomizationWasShown and Operations[otCustomization].Down then
    Application.MessageBox(PChar(sdxColumnCustomizationMessage),
      PChar(sdxColumnCustomizationMessageCaption), MB_ICONINFORMATION);
  GridOperationHelper.DoShowColumnCustomizing(Operations[otCustomization].Down);
  FInfoCustomizationWasShown := True;
end;

procedure TdxGridFrame.DoFullCollapse(AOperationType: TdxgdOperationType);
var
  I: Integer;
begin
  FocusedView.DataController.Groups.FullCollapse;
  if (TcxGridLevel(FocusedView.Level).Count > 0)
    and (FocusedView is TcxGridTableView) then
  begin
      with TcxGridTableView(FocusedView) do
        for I := 0 to ViewData.RowCount - 1 do
          ViewData.Rows[I].Collapse(True);
  end;
  if FocusedView is TcxGridCardView then
    TcxGridCardView(FocusedView).ViewData.Collapse(True);
end;

procedure TdxGridFrame.DoFullExpand(AOperationType: TdxgdOperationType);
var
  I: Integer;
begin
  FocusedView.DataController.Groups.FullExpand;
  if (TcxGridLevel(FocusedView.Level).Count > 0)
  and (FocusedView is TcxGridTableView) then
  begin
    with TcxGridTableView(FocusedView) do
      for I := 0 to ViewData.RowCount - 1 do
        ViewData.Rows[I].Expand(True);
  end;
  if FocusedView is TcxGridCardView then
    TcxGridCardView(FocusedView).ViewData.Expand(True);
end;

procedure TdxGridFrame.DoGrouping(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoShowGroupingPanel(Operations[otGrouping].Down);
end;

procedure TdxGridFrame.DoInvertSelected(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoInvertSelect(Operations[otInvertSelected].Down);
end;

procedure TdxGridFrame.DoShowBands(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoShowBands(Operations[otShowBands].Down);
end;

procedure TdxGridFrame.DoShowButtonsAlways(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoShowEditButtons(Operations[otShowButtonsAlways].Down);
end;

procedure TdxGridFrame.DoShowGrid(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoShowGrid(Operations[otShowGrid].Down);
end;

procedure TdxGridFrame.DoShowHeaders(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoShowHeaders(Operations[otShowHeaders].Down);
end;

procedure TdxGridFrame.DoShowIndicator(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoShowIndicator(Operations[otShowIndicator].Down);
end;

procedure TdxGridFrame.DoShowSummaryFooter(AOperationType: TdxgdOperationType);
begin
  GridOperationHelper.DoShowSummaryFooter(Operations[otShowSummaryFooter].Down);
end;

function TdxGridFrame.CanDeactivate: Boolean;
begin
  Result := True;
  if (Grid.FocusedView <> nil) then
     try
       Grid.FocusedView.DataController.UpdateData;
     except
       CancelDrag;
       raise;
     end;
end;

procedure TdxGridFrame.ChangeVisibility(AShow: Boolean);
begin
  if not AShow then Operations[otCustomization].Down := False;
  inherited;
end;

end.
