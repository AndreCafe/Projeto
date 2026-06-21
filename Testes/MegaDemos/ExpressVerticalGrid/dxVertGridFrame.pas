unit dxVertGridFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, cxStyles, cxVGrid, cxControls, cxDBData,
  cxInplaceContainer, dxOperationTypes, dxPScxVGridLnk, dxPSCore, uStrsConst,
  cxExportVGLink, cxDBVGrid;

type
  TVerticalGridFrame = class(TdxFrame)
  private
    FVerticalGrid: TcxCustomVerticalGrid;
    FAddOperations: Boolean;
    procedure DoCustomizationFormVisibleChanged(Sender: TObject);
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    function GetDescription: string; override;
    function GetHint: string; override;
    function GetInspectedObject: TPersistent; override;
    function GetPrintableComponent: TComponent; override;
    procedure UpdateOperations; override;
    procedure Loaded; override;

    procedure DoInsert(AOperationType: TdxgdOperationType); virtual;
    procedure DoDelete(AOperationType: TdxgdOperationType); virtual;
    procedure DoFirst(AOperationType: TdxgdOperationType); virtual;
    procedure DoLast(AOperationType: TdxgdOperationType); virtual;
    procedure DoNext(AOperationType: TdxgdOperationType); virtual;
    procedure DoPrior(AOperationType: TdxgdOperationType); virtual;
    function HasButtonEditor: Boolean; virtual;
    function DataController: TcxDBDataController;

    procedure DoCustomization(AOperationType: TdxgdOperationType);
    procedure DoShowButtonsAlways(AOperationType: TdxgdOperationType);
    procedure DoShowGrid(AOperationType: TdxgdOperationType);
    procedure DoShowHeaders(AOperationType: TdxgdOperationType);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ChangeVisibility(AShow: Boolean); override;
    function VerticalGrid: TcxCustomVerticalGrid; virtual;
    procedure DoExport(AExportType: TSupportedExportType; const AFileName: string); override;
    function ExportFileName: string; override;
    function IsSupportExport(AExportType: TSupportedExportType): Boolean; override;
  end;

implementation

{$R *.dfm}

type
  TVerticalGridAccess = class(TcxCustomVerticalGrid);

{ TTreeListFrame }
constructor TVerticalGridFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FVerticalGrid := nil;
end;

destructor TVerticalGridFrame.Destroy;
begin
  inherited Destroy;
end;

procedure TVerticalGridFrame.DoCustomizationFormVisibleChanged(Sender: TObject);
begin
  UpdateOperations;
end;

procedure TVerticalGridFrame.Loaded;
begin
  inherited Loaded;
  if VerticalGrid <> nil then
  begin
    TVerticalGridAccess(VerticalGrid).OnCustomizationFormVisibleChanged := DoCustomizationFormVisibleChanged;
    TVerticalGridAccess(VerticalGrid).OptionsBehavior.CellHints := True;
  end;
end;

procedure TVerticalGridFrame.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
  BarList.AddBar(btFormat);
end;

procedure TVerticalGridFrame.AddOperations;

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
      AddOperation(otCustomization, DoCustomization);
      AddOperation(otShowButtonsAlways, DoShowButtonsAlways);
      AddOperation(otShowGrid, DoShowGrid);
      AddOperation(otShowHeaders, DoShowHeaders);
    end;
  end;

begin
  inherited;
  AddFileOperations;
  AddNavOperations;
  AddViewOperations;
  FAddOperations := True;
end;

function TVerticalGridFrame.GetDescription: string;
begin
  Result := sdxFrameVertGridDescription;
end;

function TVerticalGridFrame.GetHint: string;
begin
  {$IFNDEF PS3}
  Result := sdxFrameVertGridHint;
  {$ELSE}
  Result := inherited GetHint;
  {$ENDIF}
end;

procedure TVerticalGridFrame.ChangeVisibility(AShow: Boolean);
begin
  inherited ChangeVisibility(AShow);
  if not AShow then
    TVerticalGridAccess(VerticalGrid).Customizing.Visible := False;
end;


function TVerticalGridFrame.GetInspectedObject: TPersistent;
begin
  Result := VerticalGrid;
end;

function TVerticalGridFrame.GetPrintableComponent: TComponent;
begin
  Result := VerticalGrid;
end;

procedure TVerticalGridFrame.UpdateOperations;
begin
  inherited UpdateOperations;
  Operations[otStyles].Enabled := True;

  Operations[otCustomization].Enabled := True; 
  Operations[otCustomization].Down := TVerticalGridAccess(VerticalGrid).Customizing.Visible;

  Operations[otShowHeaders].Enabled := True;
  Operations[otShowHeaders].Down := TVerticalGridAccess(VerticalGrid).OptionsView.ShowHeaders;

  Operations[otShowGrid].Enabled := True;
  Operations[otShowGrid].Down := TVerticalGridAccess(VerticalGrid).OptionsView.GridLines = vglBoth;
  Operations[otShowButtonsAlways].Enabled := HasButtonEditor;
  Operations[otShowButtonsAlways].Down := TVerticalGridAccess(VerticalGrid).OptionsView.ShowEditButtons = ecsbAlways;
end;


function TVerticalGridFrame.VerticalGrid: TcxCustomVerticalGrid;
var
  I: Integer;
begin
  if FVerticalGrid = nil then
  begin
    for I := 0 to ComponentCount - 1 do
      if(Components[I] is TcxCustomVerticalGrid) then
      begin
        FVerticalGrid := Components[I] as TcxCustomVerticalGrid;
        break;
      end;
  end;
  Result := FVerticalGrid;
end;


procedure TVerticalGridFrame.DoExport(AExportType: TSupportedExportType; const AFileName: string);
begin
  case AExportType of
    exHTML:
       cxExportVGToHTML(AFileName, VerticalGrid);
    exXML:
       cxExportVGToXML(AFileName, VerticalGrid);
    exExcel:
       cxExportVGToExcel(AFileName, VerticalGrid);
    exText:
       cxExportVGToText(AFileName, VerticalGrid);
  end;
end;

function TVerticalGridFrame.ExportFileName: string;
begin
  Result := 'VerticalGrid';
end;

function TVerticalGridFrame.IsSupportExport(AExportType: TSupportedExportType): Boolean;
begin
  Result := True;
end;

procedure TVerticalGridFrame.DoInsert(AOperationType: TdxgdOperationType);
begin
  if DataController <> nil then
    DataController.Insert;
end;

procedure TVerticalGridFrame.DoDelete(AOperationType: TdxgdOperationType);
begin
  if DataController <> nil then
    DataController.DeleteFocused;
end;

procedure TVerticalGridFrame.DoFirst(AOperationType: TdxgdOperationType);
begin
  if DataController <> nil then
    DataController.GotoFirst;
end;

procedure TVerticalGridFrame.DoLast(AOperationType: TdxgdOperationType);
begin
  if DataController <> nil then
    DataController.GotoLast;
end;

procedure TVerticalGridFrame.DoNext(AOperationType: TdxgdOperationType);
begin
  if DataController <> nil then
    DataController.GotoNext;
end;

procedure TVerticalGridFrame.DoPrior(AOperationType: TdxgdOperationType);
begin
  if DataController <> nil then
    DataController.GotoPrev;
end;

function TVerticalGridFrame.HasButtonEditor: Boolean;
begin
  Result := True;
end;

var
  FInfoCustomizationWasShown: Boolean = False;

procedure TVerticalGridFrame.DoCustomization(AOperationType: TdxgdOperationType);
begin
  if not FInfoCustomizationWasShown and Operations[otCustomization].Down then
    Application.MessageBox(PChar(sdxColumnCustomizationMessageVerticalGrid),
      PChar(sdxColumnCustomizationMessageCaption), MB_ICONINFORMATION);
  TVerticalGridAccess(VerticalGrid).Customizing.Visible := Operations[AOperationType].Down;
  FInfoCustomizationWasShown := True;
end;

procedure TVerticalGridFrame.DoShowButtonsAlways(AOperationType: TdxgdOperationType);
begin
  if Operations[AOperationType].Down then
    TVerticalGridAccess(VerticalGrid).OptionsView.ShowEditButtons := ecsbAlways
  else TVerticalGridAccess(VerticalGrid).OptionsView.ShowEditButtons := ecsbNever;
end;

procedure TVerticalGridFrame.DoShowGrid(AOperationType: TdxgdOperationType);
begin
  if Operations[AOperationType].Down then
    TVerticalGridAccess(VerticalGrid).OptionsView.GridLines := vglBoth
  else TVerticalGridAccess(VerticalGrid).OptionsView.GridLines := vglNone;
end;

procedure TVerticalGridFrame.DoShowHeaders(AOperationType: TdxgdOperationType);
begin
  TVerticalGridAccess(VerticalGrid).OptionsView.ShowHeaders := Operations[AOperationType].Down;
end;

function TVerticalGridFrame.DataController: TcxDBDataController;
begin
  if (VerticalGrid <> nil) and (VerticalGrid is TcxDBVerticalGrid) then
    Result := TcxDBVerticalGrid(VerticalGrid).DataController
  else Result := nil;
end;

end.
