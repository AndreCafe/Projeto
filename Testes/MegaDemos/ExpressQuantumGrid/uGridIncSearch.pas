unit uGridIncSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxControls, cxGrid, StdCtrls, ExtCtrls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, cxClasses, cxDataStorage,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxLabel;

type
  TfrmIncSearchGrid = class(TdxGridFrame)
    GridLevel: TcxGridLevel;
    DBTableView: TcxGridDBTableView;
    DBTableViewBIRTHNAME: TcxGridDBColumn;
    DBTableViewDATEOFBIRTH: TcxGridDBColumn;
    DBTableViewBIOGRAPHY: TcxGridDBColumn;
    DBTableViewGENDER: TcxGridDBColumn;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure DBTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBTableViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    fCurrentSearchStIndex: Integer;
    procedure StartSearch;
    procedure EndSearch;
    procedure InternalStartSearch;
    function GetSearchText: string;
  protected
    function GetDescription: string; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ChangeVisibility(AShow: Boolean); override;
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, uStrsConst;

{$R *.dfm}

const
  SearchSt = 'JOHN H'#0#0#0'GEORGE M'#0#0#0'FRANCIS'#0#0#0;

constructor TfrmIncSearchGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fCurrentSearchStIndex := 0;
end;

procedure TfrmIncSearchGrid.ChangeVisibility(AShow: Boolean);
begin
  inherited ChangeVisibility(AShow);
  if AShow then
    StartSearch
  else EndSearch;
end;

function TfrmIncSearchGrid.GetDescription: string;
begin
  if (Timer.Enabled) or (lblDescription.Caption = '') then
    Result := sdxFrameIncSearchGridDescription1
  else Result := sdxFrameIncSearchGridDescription2;
end;

procedure TfrmIncSearchGrid.StartSearch;
begin
  DBTableView.Controller.FocusedColumnIndex := 0;
  fCurrentSearchStIndex := 0;
  InternalStartSearch;
  Timer.Enabled := True;
  CheckDescription;
end;

procedure TfrmIncSearchGrid.EndSearch;
begin
  Timer.Enabled := False;
  CheckDescription;
end;

procedure TfrmIncSearchGrid.InternalStartSearch;
begin
  DBTableView.DataController.GotoFirst;
  DBTableView.DataController.Search.Cancel;
  DBTableView.DataController.Search.Locate(DBTableViewBIRTHNAME.ID, SearchSt[1]);
end;


function TfrmIncSearchGrid.GetSearchText: string;
var
  i: Integer;
begin
  Result := '';
  i := fCurrentSearchStIndex;
  while (i > 0) and (SearchSt[i] <> #0) do
  begin
    Result := SearchSt[i] + Result;
    Dec(i);
  end;
end;

procedure TfrmIncSearchGrid.TimerTimer(Sender: TObject);
begin
  if not Grid.HandleAllocated or not DBTableView.DataController.Search.Searching  then exit;
  Inc(fCurrentSearchStIndex);
  if (fCurrentSearchStIndex > Length(SearchSt)) then
    StartSearch;
  if ((fCurrentSearchStIndex > 1) and (SearchSt[fCurrentSearchStIndex] <> #0)
  and (SearchSt[fCurrentSearchStIndex - 1] = #0)) then
    InternalStartSearch;
  if GetSearchText <> '' then
  begin
    if GetSearchText <> DBTableView.DataController.Search.SearchText then
      DBTableView.DataController.Search.Locate(DBTableViewBIRTHNAME.ID,  GetSearchText)
    else DBTableView.DataController.Search.LocateNext(True);
  end;
end;

procedure TfrmIncSearchGrid.DBTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EndSearch;
end;

procedure TfrmIncSearchGrid.DBTableViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  EndSearch;
end;

initialization
  dxFrameManager.RegisterFrame(GridIncSearchFrameID, TfrmIncSearchGrid,
    GridIncrementalSearchFrameName, GridIncSearchImageIndex, TableBandedTableGroupIndex, -1, -1);

end.
