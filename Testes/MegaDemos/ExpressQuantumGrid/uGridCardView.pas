unit uGridCardView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxStyles, cxControls, cxGrid, ExtCtrls, StdCtrls,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridCardView,
  cxGridDBCardView, cxGridLevel, cxDataStorage, cxLabel, cxContainer,
  cxCheckBox, cxLookAndFeels, cxLookAndFeelPainters, cxGridCustomLayoutView;

type
  TfrmCardViewGrid = class(TdxGridFrame)
    GridLevel: TcxGridLevel;
    DBCardView: TcxGridDBCardView;
    DBCardViewFNAME: TcxGridDBCardViewRow;
    DBCardViewLNAME: TcxGridDBCardViewRow;
    DBCardViewEMAIL: TcxGridDBCardViewRow;
    DBCardViewPHONE: TcxGridDBCardViewRow;
    DBCardViewDEPARTMENTID: TcxGridDBCardViewRow;
    StyleRepository: TcxStyleRepository;
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    DBCardViewPersonName: TcxGridDBCardViewRow;
    Panel1: TPanel;
    cbCardExpanding: TcxCheckBox;
    cbFiltering: TcxCheckBox;
    cbRowMoving: TcxCheckBox;
    procedure DBCardViewPersonNameGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cbCardExpandingPropertiesChange(Sender: TObject);
    procedure cbFilteringPropertiesChange(Sender: TObject);
    procedure cbRowMovingPropertiesChange(Sender: TObject);
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
  dxFrames, FrameIDs, maindata, uStrsConst;

{ TfrmCardViewGrid }

procedure TfrmCardViewGrid.DBCardViewPersonNameGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText := DBCardView.DataController.GetDisplayText(ARecord.Index, DBCardViewFNAME.Index) + ' '
    + DBCardView.DataController.GetDisplayText(ARecord.Index, DBCardViewLNAME.Index)
end;

procedure TfrmCardViewGrid.cbCardExpandingPropertiesChange(
  Sender: TObject);
begin
  DBCardView.OptionsCustomize.CardExpanding := cbCardExpanding.Checked;
end;

procedure TfrmCardViewGrid.cbFilteringPropertiesChange(Sender: TObject);
begin
  DBCardView.OptionsCustomize.RowFiltering := cbFiltering.Checked;
end;

procedure TfrmCardViewGrid.cbRowMovingPropertiesChange(Sender: TObject);
begin
  DBCardView.OptionsCustomize.RowMoving := cbRowMoving.Checked;
end;

function TfrmCardViewGrid.GetDescription: string;
begin
  Result := sdxFrameCardViewDescription;
end;

initialization
  dxFrameManager.RegisterFrame(GridCardViewFrameID, TfrmCardViewGrid, GridCardViewFrameName,
    GridCardViewImageIndex, LayoutFeaturesGroupIndex, -1, -1);


end.
