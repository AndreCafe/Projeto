unit uVertGridIncSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxVertGridFrame, StdCtrls, ExtCtrls, cxStyles, cxGraphics,
  cxEdit, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer, cxMemo;

type
  TfrmVerticalGridIncSearch = class(TVerticalGridFrame)
    VerticalGrid: TcxDBVerticalGrid;
    VerticalGridBIRTHNAME: TcxDBEditorRow;
    VerticalGridDATEOFBIRTH: TcxDBEditorRow;
    VerticalGridBIOGRAPHY: TcxDBEditorRow;
    VerticalGridNICKNAME: TcxDBEditorRow;
    VerticalGridGENDER: TcxDBEditorRow;
    Timer: TTimer;
    VerticalGridCategoryRow1: TcxCategoryRow;
    procedure TimerTimer(Sender: TObject);
    procedure VerticalGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VerticalGridMouseUp(Sender: TObject; Button: TMouseButton;
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


{ TfrmVerticalGridIncSearch }
constructor TfrmVerticalGridIncSearch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fCurrentSearchStIndex := 0;
end;


procedure TfrmVerticalGridIncSearch.ChangeVisibility(AShow: Boolean);
begin
  inherited ChangeVisibility(AShow);
  if AShow then
    StartSearch
  else EndSearch;
end;

procedure TfrmVerticalGridIncSearch.StartSearch;
begin
  VerticalGrid.FocusedRecordIndex := 0;
  fCurrentSearchStIndex := 0;
  InternalStartSearch;
  Timer.Enabled := True;
  CheckDescription;
end;

procedure TfrmVerticalGridIncSearch.EndSearch;
begin
  Timer.Enabled := False;
  CheckDescription;
end;

function TfrmVerticalGridIncSearch.GetDescription: string;
begin
  if (Timer.Enabled) or (lblDescription.Caption = '') then
    Result := sdxFrameIncSearchVerticalGridDescription1
  else Result := sdxFrameIncSearchVerticalGridDescription2;
end;

procedure TfrmVerticalGridIncSearch.InternalStartSearch;
begin
  VerticalGrid.DataController.GotoFirst;
  VerticalGrid.DataController.Search.Cancel;
  VerticalGrid.DataController.Search.Locate(0, SearchSt[1]);
end;

function TfrmVerticalGridIncSearch.GetSearchText: string;
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

procedure TfrmVerticalGridIncSearch.TimerTimer(Sender: TObject);
begin
  if not VerticalGrid.HandleAllocated or not VerticalGrid.DataController.Search.Searching  then exit;
  Inc(fCurrentSearchStIndex);
  if (fCurrentSearchStIndex > Length(SearchSt)) then
    StartSearch;
  if ((fCurrentSearchStIndex > 1) and (SearchSt[fCurrentSearchStIndex] <> #0)
  and (SearchSt[fCurrentSearchStIndex - 1] = #0)) then
    InternalStartSearch;
  if GetSearchText <> '' then
  begin
    if GetSearchText <> VerticalGrid.DataController.Search.SearchText then
      VerticalGrid.DataController.Search.Locate(0,  GetSearchText)
    else VerticalGrid.DataController.Search.LocateNext(True);
  end;
end;

procedure TfrmVerticalGridIncSearch.VerticalGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EndSearch;
end;

procedure TfrmVerticalGridIncSearch.VerticalGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  EndSearch;
end;

initialization
  dxFrameManager.RegisterFrame(VerticalGridIncSearchFrameID, TfrmVerticalGridIncSearch,
    VerticalGridIncSearchName, VerticalGridIncSearchImageIndex, VerticalGridIncSearchImageIndex, VerticalGridSideBarGroupIndex);


end.
