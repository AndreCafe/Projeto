unit uDBTreeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, dxPSCore, dxPSdxDBTVLnk, ComCtrls,
  dxtree, dxdbtree, ImgList, dxOperationTypes;

type
  TfrmDBTreeView = class(TdxFrame)
    DBTreeView: TdxDBTreeView;
    ImageList: TImageList;
    procedure DBTreeViewGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure DBTreeViewClick(Sender: TObject);
  private
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    function GetInspectedObject: TPersistent; override;
    function GetPrintableComponent: TComponent; override;

    procedure DoFullCollapse(AOperationType: TdxgdOperationType);
    procedure DoFullExpand(AOperationType: TdxgdOperationType);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, uStrsConst;

{$R *.dfm}

{ TfrmDBTreeView }

procedure TfrmDBTreeView.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
  BarList.AddBar(btFormat);
end;

procedure TfrmDBTreeView.AddOperations;
begin
  inherited;
  with Operations do
  begin
    AddOperation(otPrintStyles, nil);
    AddOperation(otDefinePrintStyles, nil);
    AddOperation(otPrintPreview, nil);
    AddOperation(otPrint, nil);
    AddOperation(otStyles, nil);
    AddOperation(otFullCollapse, DoFullCollapse);
    AddOperation(otFullExpand, DoFullExpand);
  end;
end;

constructor TfrmDBTreeView.Create(AOwner: TComponent);
begin
  inherited;
  if DBTreeView.TopItem <> nil then
    DBTreeView.TopItem.Expand(True);
end;


procedure TfrmDBTreeView.DBTreeViewGetImageIndex(Sender: TObject;
  Node: TTreeNode);

  function CalcIndex(ANode: TTreeNode): Integer;
  var
    I, Index, LastIndex: Integer;
  begin
    LastIndex := 1;
    if (ANode.StateIndex = 1) then
      Result := 1
    else Result := 0;
    // 0 - unchecked, 1 - checked, 2 - checked grayed
    for I := 0 to ANode.Count - 1 do
    begin
      Index := CalcIndex(ANode[I]);
      if Index = 1 then
      begin
        if Result = 1 then
          Result := 1
        else Result := 2
      end
      else
      begin
        if Result <> 0 then
          Result := 2
        else Result := Index;
        LastIndex := Index;
      end;
    end;
    if (ANode.HasChildren) and (LastIndex = 1) then Result := 1;
  end;

begin
  Node.ImageIndex := CalcIndex(Node);
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfrmDBTreeView.DBTreeViewClick(Sender: TObject);
var
  pt: TPoint;
  hitTests: THitTests;
  ANode: TTreeNode;

  procedure UpdateStatus(ANode: TTreeNode; ADone: Boolean);
  var
    I: Integer;
  begin
    with DBTreeView.DataSource.DataSet do
    begin
      Locate('ID', TdxDBTreeNode(ANode).KeyFieldValue, []);
      Edit;
      FindField('DONE').AsBoolean := ADone;
      Post;
    end;
    for I := 0 to ANode.Count - 1 do
    begin
      UpdateStatus(ANode[I], ADone);
    end;
  end;

begin
  GetCursorPos(pt);
  pt := DBTreeView.ScreenToClient(pt);
  hitTests := DBTreeView.GetHitTestInfoAt(pt.X, pt.Y);
  if htOnIcon in hitTests then
  begin
    ANode := DBTreeView.GetNodeAt(pt.X, pt.Y);
    DBTreeView.DataSource.DataSet.ControlsDisabled;
    Windows.LockWindowUpdate(DBTreeView.Handle);
    try
      UpdateStatus(ANode, ANode.StateIndex = 0);
    finally
      ANode.Selected := True;
      DBTreeView.DataSource.DataSet.EnableControls;
      Windows.LockWindowUpdate(0);
      DBTreeView.Invalidate;
      ANode.ImageIndex := ANode.StateIndex;
      ANode.SelectedIndex := ANode.ImageIndex;
    end;
  end;
end;

procedure TfrmDBTreeView.DoFullCollapse(AOperationType: TdxgdOperationType);
begin
  DBTreeView.FullCollapse;
end;

procedure TfrmDBTreeView.DoFullExpand(AOperationType: TdxgdOperationType);
begin
  DBTreeView.FullExpand;
end;

function TfrmDBTreeView.GetInspectedObject: TPersistent;
begin
  Result := DBTreeView;
end;

function TfrmDBTreeView.GetPrintableComponent: TComponent;
begin
  Result := DBTreeView;
end;

initialization
  dxFrameManager.RegisterFrame(ExpressControlsDBTreeViewIndex, TfrmDBTreeView,
    ExpressControlsDBTreeViewName, ExpressControlsDBTreeViewImageIndex, 
    ExpressControlsDBTreeViewImageIndex, ExpressControlsGroupIndex);

end.
