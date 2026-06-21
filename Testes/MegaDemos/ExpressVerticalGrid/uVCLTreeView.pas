unit uVCLTreeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, ImgList, ComCtrls, dxPSCore, dxPSTVLnk;

type
  TfrmVCLTreeView = class(TdxFrame)
    TreeView: TTreeView;
    ImageList: TImageList;
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    function GetPrintableComponent: TComponent; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, dxOperationTypes, uStrsConst;

{$R *.dfm}

constructor TfrmVCLTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if (TreeView.TopItem <> nil) then
    TreeView.TopItem.Expand(True);
end;

{ TfrmTreeView }

procedure TfrmVCLTreeView.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
end;

procedure TfrmVCLTreeView.AddOperations;
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

function TfrmVCLTreeView.GetPrintableComponent: TComponent;
begin
  Result := TreeView;
end;

initialization
  dxFrameManager.RegisterFrame(StandardControlTreeViewIndex, TfrmVCLTreeView,
    StandardControlsTreeViewName, StandardControlsTreeViewImageIndex, 
    StandardControlsTreeViewImageIndex, StandardControlsGroupIndex);

end.
