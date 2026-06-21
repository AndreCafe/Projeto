unit uVertGridFilterControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxVertGridFrame, StdCtrls, ExtCtrls, cxStyles, cxGraphics,
  cxEdit, cxControls, cxInplaceContainer, cxVGrid, cxDBVGrid, cxFilter, cxData,
  cxLookAndFeelPainters, cxButtons, cxFilterControl, cxCurrencyEdit,
  cxLookAndFeels, Menus;

type
  TfrmVerticalGridFilterControl = class(TVerticalGridFrame)
    VerticalGrid: TcxDBVerticalGrid;
    VerticalGridFIRSTNAME: TcxDBEditorRow;
    VerticalGridLASTNAME: TcxDBEditorRow;
    VerticalGridCOMPANYNAME: TcxDBEditorRow;
    VerticalGridPAYMENTTYPE: TcxDBEditorRow;
    VerticalGridPRODUCTID: TcxDBEditorRow;
    VerticalGridCUSTOMER: TcxDBEditorRow;
    VerticalGridPURCHASEDATE: TcxDBEditorRow;
    VerticalGridPAYMENTAMOUNT: TcxDBEditorRow;
    VerticalGridCOPIES: TcxDBEditorRow;
    pnlFilterApply: TPanel;
    btnApply: TcxButton;
    btnReset: TcxButton;
    btOpen: TcxButton;
    btSave: TcxButton;
    pnlFilter: TPanel;
    FilterControl: TcxFilterControl;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure btnApplyClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetDescription: string; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, uStrsConst, cxClasses, cxFilterControlStrs;

{$R *.dfm}

constructor TfrmVerticalGridFilterControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OpenDialog.Title := cxGetResourceString(@cxSFilterControlDialogOpenDialogCaption);
  OpenDialog.DefaultExt := cxGetResourceString(@cxSFilterControlDialogFileExt);
  OpenDialog.Filter := cxGetResourceString(@cxSFilterControlDialogFileFilter);
  SaveDialog.Title := cxGetResourceString(@cxSFilterControlDialogSaveDialogCaption);
  SaveDialog.DefaultExt := OpenDialog.DefaultExt;
  SaveDialog.Filter := cxGetResourceString(@cxSFilterControlDialogFileFilter);

  VerticalGrid.DataController.Filter.Active := False;
  VerticalGrid.DataController.Filter.AddItem(nil,
    VerticalGrid.DataController.GetItem(VerticalGridCOPIES.Properties.ItemIndex),
    foGreater, 3, '3');
  VerticalGrid.DataController.Filter.Active := True;
  FilterControl.UpdateFilter;
end;

procedure TfrmVerticalGridFilterControl.btnApplyClick(Sender: TObject);
begin
  FilterControl.ApplyFilter;
end;

procedure TfrmVerticalGridFilterControl.btnResetClick(Sender: TObject);
begin
  FilterControl.UpdateFilter;
  FilterControl.FilterText;
end;

procedure TfrmVerticalGridFilterControl.btOpenClick(Sender: TObject);
begin
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
    FilterControl.LoadFromFile(OpenDialog.FileName);
end;

procedure TfrmVerticalGridFilterControl.btSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    FilterControl.SaveToFile(SaveDialog.FileName);
end;

function TfrmVerticalGridFilterControl.GetDescription: string;
begin
  Result := sdxFrameVerticalFilterControl;
end;

initialization
  dxFrameManager.RegisterFrame(VerticalGridFilterControlFrameID, TfrmVerticalGridFilterControl,
    VerticalGridFilterControlName, VerticalGridFilterControlImageIndex, VerticalGridFilterControlImageIndex, VerticalGridSideBarGroupIndex);


end.
