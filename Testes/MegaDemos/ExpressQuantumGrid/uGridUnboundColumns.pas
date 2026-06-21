unit uGridUnboundColumns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxGridLevel,
  StdCtrls, cxGrid, ExtCtrls, cxSpinEdit, cxBlobEdit, cxCheckBox,
  cxCalendar, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxLabel;

type
  TfrmGridUnboundColumns = class(TdxGridFrame)
    Level: TcxGridLevel;
    BandedTableView: TcxGridDBBandedTableView;
    BandedTableViewFIRSTNAME: TcxGridDBBandedColumn;
    BandedTableViewLASTNAME: TcxGridDBBandedColumn;
    BandedTableViewCOMPANYNAME: TcxGridDBBandedColumn;
    BandedTableViewPAYMENTTYPE: TcxGridDBBandedColumn;
    BandedTableViewPRODUCTID: TcxGridDBBandedColumn;
    BandedTableViewCUSTOMER: TcxGridDBBandedColumn;
    BandedTableViewPURCHASEDATE: TcxGridDBBandedColumn;
    BandedTableViewPAYMENTAMOUNT: TcxGridDBBandedColumn;
    BandedTableViewCOPIES: TcxGridDBBandedColumn;
    BandedTableViewSelected: TcxGridDBBandedColumn;
    BandedTableViewSupportRequests: TcxGridDBBandedColumn;
    BandedTableViewLastSupportRequest: TcxGridDBBandedColumn;
    BandedTableViewComments: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    styleSelected: TcxStyle;
    procedure BandedTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    procedure GenerateUnboundData;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses maindata, dxFrames, FrameIDs;


{$R *.dfm}

{ TfrmGridUnboundColumns }

constructor TfrmGridUnboundColumns.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  GenerateUnboundData;
end;

procedure TfrmGridUnboundColumns.GenerateUnboundData;
var
  I: Integer;
begin
  Randomize;
  for I := 0 to BandedTableView.DataController.RecordCount - 1 do
  begin
    BandedTableView.DataController.SetValue(I, BandedTableViewSelected.Index, Random(100) mod 2 = 1);
    BandedTableView.DataController.SetValue(I, BandedTableViewSupportRequests.Index, 1 + Random(20));
    BandedTableView.DataController.SetValue(I, BandedTableViewLastSupportRequest.Index, EncodeDate(2000 + Random(4), 1 + Random(11), 1 + Random(27)));
    BandedTableView.DataController.SetValue(I, BandedTableViewComments.Index, 'Put your comments here...');
  end;
end;

procedure TfrmGridUnboundColumns.BandedTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if not ARecord.Selected and (ARecord.RecordIndex > -1)
  and (BandedTableView.DataController.GetValue(ARecord.RecordIndex, BandedTableViewSelected.Index) = True) then
    AStyle := styleSelected;
end;

initialization
  dxFrameManager.RegisterFrame(GridUnboundColumnsViewFrameID, TfrmGridUnboundColumns,
    GridUnboundColumnsFrameName, GridUnboundColumnsViewImageIndex, DataBindingGroupIndex, -1, -1);

end.
