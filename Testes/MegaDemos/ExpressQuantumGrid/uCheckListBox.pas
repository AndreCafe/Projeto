unit uCheckListBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, CheckLst, dxPSCore, dxPSChLbxLnk,
  ImgList, dxPSGlbl;

type
  TfrmCheckListBox = class(TdxFrame)
    CheckListBox: TCheckListBox;
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
  maindata, dxFrames, FrameIDs, dxOperationTypes, uStrsConst;

{$R *.dfm}

constructor TfrmCheckListBox.Create(AOwner: TComponent);
var
  I: Integer;
begin
  inherited;
  for I := 0 to CheckListBox.Items.Count - 1 do
    CheckListBox.Checked[i] := Boolean(Random(2));
end;

procedure TfrmCheckListBox.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
end;

procedure TfrmCheckListBox.AddOperations;
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

function TfrmCheckListBox.GetPrintableComponent: TComponent; 
begin
  Result := CheckListBox;
end;

procedure TfrmCheckListBox.PrepareLink(AReportLink: TBasedxReportLink);
begin
  inherited;
  TdxCheckListBoxReportLink(AReportLink).AutoWidth := True;
end;

initialization
  dxFrameManager.RegisterFrame(StandardControlCheckListBoxIndex, TfrmCheckListbox,
    StandardControlsCheckListBoxName, StandardControlsCheckListBoxImageIndex, 
    StandardControlsCheckListBoxImageIndex, StandardControlsGroupIndex);

end.
