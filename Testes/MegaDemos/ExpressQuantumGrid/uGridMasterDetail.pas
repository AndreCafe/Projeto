unit uGridMasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGridCustomMasterDetail, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, cxGridLevel, cxGridCardView,
  cxGridDBCardView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, ExtCtrls, cxDataStorage, cxContainer, cxCheckBox, cxLabel,
  cxLookAndFeels, cxLookAndFeelPainters, cxGridCustomLayoutView;

type
  TfrmGridMasterDetail = class(TfrmGridCustomMasterDetail)
    Panel1: TPanel;
    cbSynhronization: TcxCheckBox;
    Label1: TcxLabel;
    procedure cbSynhronizationPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetDescription: string; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  dxFrames, mainData, FrameIDs, uStrsConst;

{ TfrmGridMasterDetail }

procedure TfrmGridMasterDetail.cbSynhronizationPropertiesChange(
  Sender: TObject);
begin
  tvEmployee.Synchronization := cbSynhronization.Checked;
  cvEmployee.Synchronization := cbSynhronization.Checked;
  tvItems.Synchronization := cbSynhronization.Checked;
  cvItems.Synchronization := cbSynhronization.Checked;
end;

function TfrmGridMasterDetail.GetDescription: string;
begin
  Result := sdxFrameMasterDetailDescription;
end;

initialization
  dxFrameManager.RegisterFrame(GridMasterDetailFrameID, TfrmGridMasterDetail,
    GridMasterDetailFrameName, GridMasterDetailImageIndex, MasterDetailGroupIndex,
    HighlightedFeaturesGroupIndex, -1);

end.
