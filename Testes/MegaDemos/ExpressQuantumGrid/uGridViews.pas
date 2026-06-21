unit uGridViews;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxStyles, cxControls, cxGrid, ExtCtrls, StdCtrls,
  cxGridLevel, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDataStorage,  cxDBData, cxGridCardView, cxGridDBCardView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxLookAndFeels, cxLookAndFeelPainters,
  cxGridCustomLayoutView, cxContainer, cxLabel;

type
  TfrmViewsGrid = class(TdxGridFrame)
    GridLevel: TcxGridLevel;
    pnlViews: TPanel;
    tvViews: TcxGridTableView;
    lvViews: TcxGridLevel;
    gridViews: TcxGrid;
    clnViews: TcxGridDBColumn;
    splitterView: TSplitter;
    DBTableViewDepartments: TcxGridDBTableView;
    DBTableViewDepartmentsID: TcxGridDBColumn;
    DBTableViewDepartmentsNAME: TcxGridDBColumn;
    DBTableViewEmployee: TcxGridDBTableView;
    DBTableViewEmployeeFNAME: TcxGridDBColumn;
    DBTableViewEmployeeLNAME: TcxGridDBColumn;
    DBTableViewEmployeeEMAIL: TcxGridDBColumn;
    DBTableViewEmployeePHONE: TcxGridDBColumn;
    DBTableViewEmployeeDepartmentName: TcxGridDBColumn;
    DBCardViewEmployee: TcxGridDBCardView;
    DBCardViewEmployeeFNAME: TcxGridDBCardViewRow;
    DBCardViewEmployeeMNAME: TcxGridDBCardViewRow;
    DBCardViewEmployeeLNAME: TcxGridDBCardViewRow;
    DBCardViewEmployeeEMAIL: TcxGridDBCardViewRow;
    DBCardViewEmployeePHONE: TcxGridDBCardViewRow;
    DBCardViewEmployeeDepartmentName: TcxGridDBCardViewRow;
    DBTableViewProjects: TcxGridDBTableView;
    DBTableViewProjectsNAME: TcxGridDBColumn;
    DBTableViewProjectsMANAGERID: TcxGridDBColumn;
    DBTableViewItems: TcxGridDBTableView;
    DBTableViewItemsNAME: TcxGridDBColumn;
    DBTableViewItemsTYPE: TcxGridDBColumn;
    DBTableViewItemsPROJECTID: TcxGridDBColumn;
    DBTableViewItemsPRIORITY: TcxGridDBColumn;
    DBTableViewItemsSTATUS: TcxGridDBColumn;
    DBTableViewItemsCREATORID: TcxGridDBColumn;
    DBTableViewItemsCREATEDDATE: TcxGridDBColumn;
    DBTableViewItemsOWNERID: TcxGridDBColumn;
    DBTableViewItemsLASTMODIFIEDDATE: TcxGridDBColumn;
    DBTableViewItemsFIXEDDATE: TcxGridDBColumn;
    DBTableViewItemsDESCRIPTION: TcxGridDBColumn;
    DBCardViewItems: TcxGridDBCardView;
    DBCardViewItemsNAME: TcxGridDBCardViewRow;
    DBCardViewItemsTYPE: TcxGridDBCardViewRow;
    DBCardViewItemsPROJECTID: TcxGridDBCardViewRow;
    DBCardViewItemsPRIORITY: TcxGridDBCardViewRow;
    DBCardViewItemsSTATUS: TcxGridDBCardViewRow;
    DBCardViewItemsCREATORID: TcxGridDBCardViewRow;
    DBCardViewItemsCREATEDDATE: TcxGridDBCardViewRow;
    DBCardViewItemsOWNERID: TcxGridDBCardViewRow;
    DBCardViewItemsLASTMODIFIEDDATE: TcxGridDBCardViewRow;
    DBCardViewItemsFIXEDDATE: TcxGridDBCardViewRow;
    StyleRepository: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    procedure tvViewsFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  protected
    function GetDescription: String; override;
    function IsFooterEnabled(AView: TcxCustomGridView): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;


implementation

{$R *.dfm}

uses
  dxFrames, FrameIDs, maindata, uStrsConst;

type
  TViewDataSource = class(TcxCustomDataSource)
  private
    FGrid: TcxGrid;
  protected
    function GetRecordCount: Integer; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
  public
    constructor Create(AGrid: TcxGrid);
  end;


{ TcxStyleRepositoryDataSource }
constructor TViewDataSource.Create(AGrid: TcxGrid);
begin
  inherited Create;
  FGrid := AGrid;
end;

function TViewDataSource.GetRecordCount: Integer;
begin
  Result := FGrid.ViewCount;
end;

function TViewDataSource.GetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle): Variant;
begin
  Result := FGrid.Views[Integer(ARecordHandle)].Name;
end;

{ TfrmViewsGrid }

constructor TfrmViewsGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  tvViews.DataController.CustomDataSource := TViewDataSource.Create(Grid);
  tvViews.DataController.CustomDataSource.DataChanged;
end;

destructor TfrmViewsGrid.Destroy;
begin
  tvViews.DataController.CustomDataSource.Free;
  tvViews.DataController.CustomDataSource := nil;
  inherited Destroy;
end;

function TfrmViewsGrid.GetDescription: string;
begin
  Result := sdxFrameViewsDescription;
end; 


function TfrmViewsGrid.IsFooterEnabled(AView: TcxCustomGridView): Boolean;
begin
  Result := (AView <> DBTableViewDepartments) and (AView <> DBTableViewProjects);
end;

procedure TfrmViewsGrid.tvViewsFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if AFocusedRecord <> nil then
    GridLevel.GridView := Grid.Views[AFocusedRecord.RecordIndex];
end;

initialization
  dxFrameManager.RegisterFrame(GridViewsFrameID, TfrmViewsGrid,
    GridViewsFrameName, GridViewsImageIndex, HighlightedFeaturesGroupIndex, -1, -1);


end.
