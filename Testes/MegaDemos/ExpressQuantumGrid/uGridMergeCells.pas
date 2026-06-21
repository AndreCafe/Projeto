unit uGridMergeCells;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxStyles, StdCtrls, cxControls, cxGrid, ExtCtrls,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGridLevel, cxGridCardView, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxLabel;

type
  TfrmGridMergeCells = class(TdxGridFrame)
    level: TcxGridLevel;
    DBTableViewItems: TcxGridDBTableView;
    DBTableViewItemsNAME: TcxGridDBColumn;
    DBTableViewItemsTYPE: TcxGridDBColumn;
    DBTableViewItemsPROJECTID: TcxGridDBColumn;
    DBTableViewItemsPRIORITY: TcxGridDBColumn;
    DBTableViewItemsSTATUS: TcxGridDBColumn;
    DBTableViewItemsCREATORID: TcxGridDBColumn;
    DBTableViewItemsCREATEDDATE: TcxGridDBColumn;
    DBTableViewItemsOWNERID: TcxGridDBColumn;
    DBTableViewItemsLASTMODIFIEDDATE: TcxGridDBColumn;
    DBTableViewItemsFIXEDDATE: TcxGridDBColumn;
    DBTableViewItemsDESCRIPTION: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
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
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
  private
    FSaveProjectAlignment: TcxEditAlignment;
    FSaveTypeAlignment: TcxEditAlignment;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ChangeVisibility(AShow: Boolean); override;
  end;

implementation

uses
  dxFrames, FrameIDs, maindata, uStrsConst;

{$R *.dfm}

{ TfrmGridMergeCells }
constructor TfrmGridMergeCells.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSaveProjectAlignment := dmMain.edrepProjectLookup.Properties.Alignment;
  FSaveTypeAlignment := dmMain.edrepTypeImageCombo.Properties.Alignment;
end;


procedure TfrmGridMergeCells.ChangeVisibility(AShow: Boolean);
begin
  inherited ChangeVisibility(AShow);
  if AShow then
  begin
    dmMain.edrepProjectLookup.Properties.Alignment.Horz := taCenter;
    dmMain.edrepProjectLookup.Properties.Alignment.Vert := taVCenter;
    dmMain.edrepTypeImageCombo.Properties.Alignment.Horz := taCenter;
    dmMain.edrepTypeImageCombo.Properties.Alignment.Vert := taVCenter;
  end else
  begin
    dmMain.edrepProjectLookup.Properties.Alignment := FSaveProjectAlignment;
    dmMain.edrepTypeImageCombo.Properties.Alignment := FSaveTypeAlignment;
  end;
end;


initialization
  dxFrameManager.RegisterFrame(GridCellMergingFrameID, TfrmGridMergeCells,
    GridCellMergingFrameName, GridCellMergingImageIndex, TableBandedTableGroupIndex, -1, -1);


end.
