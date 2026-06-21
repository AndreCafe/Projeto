unit uStringGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, Grids, dxPSCore, dxPSStdGrLnk;

type
  TfrmStringGrid = class(TdxFrame)
    StringGrid: TStringGrid;
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    procedure SetupGrid;
  protected
    procedure AddBars; override;
    procedure AddOperations; override;

    function GetPrintableComponent: TComponent; override;
    procedure PrepareLink(AReportLink: TBasedxReportLink); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, dxOperationTypes, uStrsConst, DB, 
  dxPSBaseGridLnk;

{$R *.dfm}

const
  EvenRowColor = clWindow;
  OddRowColor = clCream;
  
constructor TfrmStringGrid.Create(AOwner: TComponent);
begin
  inherited;
  SetupGrid;
end;

procedure TfrmStringGrid.SetupGrid;
const
  FieldNames: array[0..5] of string = 
    ('FNAME', 'MNAME', 'LNAME', 'EMAIL', 'PHONE', 'DEPARTMENTNAME');
var
  i, j : Integer;
  RecordCount : Integer;
begin
  with StringGrid do
  begin
    ColCount := High(FieldNames) - Low(FieldNames);
    FixedCols := 0;
    DefaultRowHeight := 23;
    RecordCount := 1 + dmMain.atUsers.RecordCount;
    RowCount := RecordCount;
    try
      dmMain.atUsers.ControlsDisabled;
      dmMain.atUsers.First;
      for i := 1 to RecordCount - 1 do
      begin
        for j := 0 to ColCount - 1 do
        begin
          if (i = 1) then
          begin
            ColWidths[j] := dmMain.atUsers.FindField(FieldNames[j]).DisplayWidth;
            Cells[j, 0] := dmMain.atUsers.FindField(FieldNames[j]).DisplayName;
          end;
          Cells[j, i] := dmMain.atUsers.FindField(FieldNames[j]).DisplayText;
          dmMain.atUsers.Next;
        end
      end;
    finally
      dmMain.atUsers.EnableControls;
    end;  
  end;
end;


procedure TfrmStringGrid.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
end;

procedure TfrmStringGrid.AddOperations;
begin
  inherited;
  with Operations do
  begin
    AddOperation(otPrintStyles, nil);
    AddOperation(otDefinePrintStyles, nil);
    AddOperation(otPrintPreview, nil);
    AddOperation(otPrint, nil);
    AddOperation(otStyles, nil);
  end;
end;

function TfrmStringGrid.GetPrintableComponent: TComponent;
begin
  Result := StringGrid;
end;

procedure TfrmStringGrid.PrepareLink(AReportLink: TBasedxReportLink);
begin
  inherited;
  with TdxStringGridReportLink(AReportLink) do
  begin
    AutoWidth := True;
    DrawMode := gdmOddEven;
    EvenColor := EvenRowColor;
    OddColor := OddRowColor;
    OddFont := EvenFont;
    Transparent := False;
  end;  
end;

procedure TfrmStringGrid.StringGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);

  function InvertColor(AColor: TColor): TColor;
  begin
    AColor := ColorToRGB(AColor);
    Result := RGB(GetRValue(AColor) xor $FF, GetGValue(AColor) xor $FF, GetBValue(AColor) xor $FF)
  end;

const
  Colors: array[Boolean] of TColor = (OddRowColor, EvenRowColor);
begin
  with TStringGrid(Sender) do
  begin
    if not (gdFixed in State) then  
    begin
      Canvas.Brush.Color := Colors[Odd(ARow)];
      if [gdSelected, gdFocused] * State <> [] then 
        Canvas.Brush.Color := InvertColor(Canvas.Brush.Color);
      if [gdFocused] * State <> [] then 
        Canvas.Font.Color := clWindow;
    end;    
    Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[ACol, ARow]);
  end; 
end;

initialization
  dxFrameManager.RegisterFrame(StandardControlStringGridIndex, TfrmStringGrid,
    StandardControlsStringGridName, StandardControlsStringGridImageIndex, StandardControlsStringGridImageIndex, StandardControlsGroupIndex);

end.
