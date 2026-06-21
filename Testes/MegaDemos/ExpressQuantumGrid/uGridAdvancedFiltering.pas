unit uGridAdvancedFiltering;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGridCustomSummaries, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, ExtCtrls,
  cxLookAndFeelPainters, cxFilterControl, cxButtons, cxDataStorage,
  cxSpinEdit, cxLookAndFeels, Menus, cxContainer, cxLabel;

type
  TfrmAdvancedFilteringGrid = class(TfrmCustomGridSummaries)
    pnlFilterApply: TPanel;
    btnApply: TcxButton;
    btnReset: TcxButton;
    pnlFilter: TPanel;
    FilterControl: TcxFilterControl;
    btOpen: TcxButton;
    btSave: TcxButton;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    procedure btnApplyClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
  protected
    function GetDescription: string; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses
  FrameIDs, dxFrames, maindata, uStrsConst, cxFilterControlStrs;     


{ TfrmAdvancedFilteringGrid }

constructor TfrmAdvancedFilteringGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  OpenDialog.Title := cxGetResourceString(@cxSFilterControlDialogOpenDialogCaption);
  OpenDialog.DefaultExt := cxGetResourceString(@cxSFilterControlDialogFileExt);
  OpenDialog.Filter := cxGetResourceString(@cxSFilterControlDialogFileFilter);
  SaveDialog.Title := cxGetResourceString(@cxSFilterControlDialogSaveDialogCaption);
  SaveDialog.DefaultExt := OpenDialog.DefaultExt;
  SaveDialog.Filter := cxGetResourceString(@cxSFilterControlDialogFileFilter);

  GridDBTableView.DataController.Filter.AddItem(nil, GridDBTableViewCOPIES, foGreater, 3, '3');
  GridDBTableView.DataController.Filter.Active := True;
  FilterControl.UpdateFilter;
end;

function TfrmAdvancedFilteringGrid.GetDescription: string;
begin
  Result := sdxFrameAdvancedFilteringDescription;
end;

procedure TfrmAdvancedFilteringGrid.btnApplyClick(Sender: TObject);
begin
  FilterControl.ApplyFilter;
end;

procedure TfrmAdvancedFilteringGrid.btnResetClick(Sender: TObject);
begin
  FilterControl.UpdateFilter;
  FilterControl.FilterText
end;

procedure TfrmAdvancedFilteringGrid.btOpenClick(Sender: TObject);
begin
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
    FilterControl.LoadFromFile(OpenDialog.FileName);
end;

procedure TfrmAdvancedFilteringGrid.btSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    FilterControl.SaveToFile(SaveDialog.FileName);
end;

initialization
  dxFrameManager.RegisterFrame(GridAdvancedFilteringFrameID, TfrmAdvancedFilteringGrid, GridDataAdvancedFilteringFrameName,
    GridAdvancedFilteringImageIndex, FilteringGroupIndex, SummariesGroupIndex, -1);


end.
