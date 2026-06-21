unit uGridCellSelection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxStyles, StdCtrls, cxControls, cxGrid, ExtCtrls,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridLevel, cxLookAndFeelPainters, cxLookAndFeels, cxContainer, cxLabel,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPSCore,
  dxPScxCommon;

type
  TfrmGridCellSelection = class(TdxGridFrame)
    Level: TcxGridLevel;
    TableView: TcxGridTableView;
    Panel1: TPanel;
    Label1: TcxLabel;
    Label2: TcxLabel;
    Label3: TcxLabel;
    Label4: TcxLabel;
    lblSelectedRows: TcxLabel;
    lblSelectedColumns: TcxLabel;
    lblSelectedCells: TcxLabel;
    lblSelectedSummary: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
    styleSelected: TcxStyle;
    styleNormal: TcxStyle;
    procedure TableViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure TableViewSelectionChanged(Sender: TcxCustomGridTableView);
    procedure TableViewCustomDrawIndicatorCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridIndicatorItemViewInfo;
      var ADone: Boolean);
    procedure TableViewStylesGetHeaderStyle(Sender: TcxGridTableView;
      AColumn: TcxGridColumn; out AStyle: TcxStyle);
  private
    procedure CreateSpreadSheet;
    procedure CreateColumns;
    procedure CreateRows;
    function GetColumnCaption(Index: Integer): string;
  protected
    //function GetPrintableComponent: TComponent; override;  
    procedure PrepareLink(AReportLink: TBasedxReportLink); override;
    function IsSupportGrouping: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses
  dxFrames, FrameIDs, MaskUtils;

const RecordCount = 1000;
const ColumnCount = 256;


{ TfrmGridCellSelection }

constructor TfrmGridCellSelection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CreateSpreadSheet;
  TableView.Controller.SelectCells(TableView.Columns[1], TableView.Columns[5], 2, 12);
end;

{function TfrmGridCellSelection.GetPrintableComponent: TComponent;
begin
  Result := nil;
end;}

procedure TfrmGridCellSelection.PrepareLink(AReportLink: TBasedxReportLink);
begin
  inherited;
  TdxGridReportLink(AReportLink).OptionsSelection.ProcessSelection := True;
end;

function TfrmGridCellSelection.IsSupportGrouping: Boolean;
begin
  Result := False;
end;

procedure TfrmGridCellSelection.CreateSpreadSheet;
begin
  TableView.BeginUpdate;
  try
    CreateColumns;
    CreateRows;
  finally
    TableView.EndUpdate;
  end;
end;

procedure TfrmGridCellSelection.CreateColumns;
var
  I: Integer;
  AColumn: TcxGridColumn;
begin
  for I := 0 to ColumnCount - 1 do
  begin
    AColumn := TableView.CreateColumn;
    AColumn.Caption := GetColumnCaption(I);
    AColumn.HeaderAlignmentHorz := taCenter;
    AColumn.DataBinding.ValueType := 'Integer';
  end;
end;

procedure TfrmGridCellSelection.CreateRows;
var
  I, J: Integer;
begin
  TableView.DataController.RecordCount := RecordCount;
  Randomize;
  for I := 0 to RecordCount - 1 do
    for J := 0 to ColumnCount - 1 do
      TableView.DataController.SetValue(I, J, Random(100));
end;

function TfrmGridCellSelection.GetColumnCaption(Index: Integer): string;
const
  Dif: Integer = Integer('Z') - Integer('A') + 1;
begin
  if Index div Dif > 0 then
     Result := GetColumnCaption(Index div Dif - 1)
  else Result := '';
  Result := Result + char(Integer('A') + Index mod Dif);
end;

procedure TfrmGridCellSelection.TableViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
var
  AColumnStart, AColumnEnd : TcxGridColumn;
begin
  AColumnStart := AColumn;
  AColumnEnd := AColumn;

  if(GetKeyState(VK_SHIFT) < 0) then
  begin
    if (TableView.Controller.SelectedColumnCount > 0) then
    begin
      if(TableView.Controller.SelectedColumns[0].VisibleIndex < AColumn.VisibleIndex) then
        AColumnStart := TableView.Controller.SelectedColumns[0];
      if(TableView.Controller.SelectedColumns[TableView.Controller.SelectedColumnCount - 1].VisibleIndex > AColumn.VisibleIndex) then
        AColumnEnd := TableView.Controller.SelectedColumns[TableView.Controller.SelectedColumnCount - 1];
    end else TableView.Controller.ClearCellSelection;
  end;

  TableView.Controller.SelectCells(AColumnStart, AColumnEnd, 0, TableView.DataController.RecordCount - 1);
end;

procedure TfrmGridCellSelection.TableViewSelectionChanged(
  Sender: TcxCustomGridTableView);
var
  I, J, ASum : Integer;
  val: Variant;
begin
  lblSelectedRows.Caption := FormatFloat('0,', TableView.Controller.SelectedRowCount);
  lblSelectedColumns.Caption  := FormatFloat('0,', TableView.Controller.SelectedColumnCount);
  lblSelectedCells.Caption  := FormatFloat('0,', TableView.Controller.SelectedRowCount * TableView.Controller.SelectedColumnCount);
  ASum := 0;
  for I := 0 to TableView.Controller.SelectedRowCount - 1 do
    for J := 0 to TableView.Controller.SelectedColumnCount - 1 do
    begin
      val := TableView.DataController.GetValue(TableView.Controller.SelectedRows[I].RecordIndex, TableView.Controller.SelectedColumns[J].Index);
      if not VarIsNull(val) then
        Inc(ASum,  Integer(val));
    end;
  lblSelectedSummary.Caption := FormatFloat('0,', ASum);
end;

procedure TfrmGridCellSelection.TableViewCustomDrawIndicatorCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ADone: Boolean);
var
  AIndicatorViewInfo: TcxGridIndicatorRowItemViewInfo;
  ATextRect: TRect;
  AText: String;
  ABorders: TcxBorders;
  AStyle: TcxStyle;
begin
  if AViewInfo is TcxGridIndicatorRowItemViewInfo then
  begin
    ATextRect := AViewInfo.ContentBounds;
    AIndicatorViewInfo := AViewInfo as TcxGridIndicatorRowItemViewInfo;
    AText := IntToStr(AIndicatorViewInfo.GridRecord.Index + 1);
    InflateRect(ATextRect, -2, -1);
    ABorders := cxBordersAll;
    if Sender.LookAndFeelPainter.LookAndFeelStyle = lfsUltraFlat then
      ABorders := ABorders - [bTop];
    if AIndicatorViewInfo.GridRecord.Selected then
      AStyle := styleSelected
    else AStyle := styleNormal;
    Sender.LookAndFeelPainter.DrawHeader(ACanvas, AViewInfo.ContentBounds, ATextRect, [], ABorders, cxbsNormal, taCenter, vaCenter,
      False, False, AText, AStyle.Font, AStyle.TextColor, AStyle.Color);
    ADone := True;
  end;
end;

procedure TfrmGridCellSelection.TableViewStylesGetHeaderStyle(
  Sender: TcxGridTableView; AColumn: TcxGridColumn; out AStyle: TcxStyle);
begin
  if AColumn = nil then exit;
  if AColumn.Selected then
    AStyle := styleSelected
  else AStyle := styleNormal;

end;

initialization
  dxFrameManager.RegisterFrame(GridCellSelectionFrameID, TfrmGridCellSelection, GridCellSelectonFrameName,
    GridCellSelectionImageIndex, TableBandedTableGroupIndex, -1, -1);


end.
