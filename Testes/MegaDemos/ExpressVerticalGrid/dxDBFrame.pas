unit dxDBFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, dxOperationTypes, dxFrame;

type
  TdxDBFrame = class(TdxFrame)
    dsMainSource: TDataSource;
    procedure dsMainSourceDataChange(Sender: TObject; Field: TField);
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    procedure UpdateOperations; override;

    function GetDataSet: TDataSet; virtual; abstract;

    procedure DoCancel(AOperationType: TdxgdOperationType); virtual;
    procedure DoDelete(AOperationType: TdxgdOperationType); virtual;
    procedure DoEdit(AOperationType: TdxgdOperationType); virtual;
    procedure DoFirst(AOperationType: TdxgdOperationType); virtual;
    procedure DoInsert(AOperationType: TdxgdOperationType); virtual;
    procedure DoLast(AOperationType: TdxgdOperationType); virtual;
    procedure DoNext(AOperationType: TdxgdOperationType); virtual;
    procedure DoPost(AOperationType: TdxgdOperationType); virtual;
    procedure DoPrior(AOperationType: TdxgdOperationType); virtual;
    procedure DoRefresh(AOperationType: TdxgdOperationType); virtual;

    procedure DataSetStateChanged; virtual;

    property DataSet: TDataSet read GetDataSet;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

{ TdxDBFrame }
constructor TdxDBFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  dsMainSource.DataSet := DataSet;
end;

procedure TdxDBFrame.AddBars;
begin
  inherited;
  BarList.AddBar(btDBNavigator);
end;

procedure TdxDBFrame.AddOperations;
begin
  inherited;
  with Operations do
  begin
    AddOperation(otCancel, DoCancel);
    AddOperation(otDelete, DoDelete);
    AddOperation(otEdit, DoEdit);
    AddOperation(otFirst, DoFirst);
    AddOperation(otInsert, DoInsert);
    AddOperation(otLast, DoLast);
    AddOperation(otNext, DoNext);
    AddOperation(otPost, DoPost);
    AddOperation(otPrior, DoPrior);
    AddOperation(otRefresh, DoRefresh);
  end;
end;

procedure TdxDBFrame.UpdateOperations;
begin
  inherited;
  DataSetStateChanged;
end;

procedure TdxDBFrame.DoCancel(AOperationType: TdxgdOperationType);
begin
  DataSet.Cancel;
end;

procedure TdxDBFrame.DoDelete(AOperationType: TdxgdOperationType);
begin
  DataSet.Delete;
end;

procedure TdxDBFrame.DoEdit(AOperationType: TdxgdOperationType);
begin
  DataSet.Edit;
end;

procedure TdxDBFrame.DoFirst(AOperationType: TdxgdOperationType);
begin
  DataSet.First;
end;

procedure TdxDBFrame.DoInsert(AOperationType: TdxgdOperationType);
begin
  DataSet.Insert;
end;

procedure TdxDBFrame.DoLast(AOperationType: TdxgdOperationType);
begin
  DataSet.Last;
end;

procedure TdxDBFrame.DoNext(AOperationType: TdxgdOperationType);
begin
  DataSet.Next;
end;

procedure TdxDBFrame.DoPost(AOperationType: TdxgdOperationType);
begin
  DataSet.Post;
end;

procedure TdxDBFrame.DoPrior(AOperationType: TdxgdOperationType);
begin
  DataSet.Prior;
end;

procedure TdxDBFrame.DoRefresh(AOperationType: TdxgdOperationType);
begin
  DataSet.Refresh;
end;

procedure TdxDBFrame.DataSetStateChanged;
var
  CanModify, Editing: Boolean;
begin
  CanModify := DataSet.Active and DataSet.CanModify;
  Editing := DataSet.State in [dsEdit, dsInsert];

  Operations.Items[otInsert].Enabled := CanModify;
  Operations.Items[otEdit].Enabled := CanModify and not Editing;
  Operations.Items[otPost].Enabled := CanModify and Editing;
  Operations.Items[otCancel].Enabled := CanModify and Editing;
  Operations.Items[otRefresh].Enabled := CanModify;
  Operations.Items[otDelete].Enabled :=
    CanModify and not (DataSet.BOF or DataSet.EOF);

  Operations.Items[otFirst].Enabled := not DataSet.BOF;
  Operations.Items[otPrior].Enabled := not DataSet.BOF;
  Operations.Items[otNext].Enabled := not DataSet.EOF;
  Operations.Items[otLast].Enabled := not DataSet.EOF;
end;

procedure TdxDBFrame.dsMainSourceDataChange(Sender: TObject;
  Field: TField);
begin
  if Active then DataSetStateChanged;
end;

end.
