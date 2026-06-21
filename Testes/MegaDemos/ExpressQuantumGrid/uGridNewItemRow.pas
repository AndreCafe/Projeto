unit uGridNewItemRow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGridCustomSummaries, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, DB, cxDBData, cxClasses, cxLookAndFeels, cxLookAndFeelPainters,
  cxDataStorage, cxSpinEdit, cxContainer, cxLabel;

type
  TfrmNewItemRowGrid = class(TfrmCustomGridSummaries)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
  dxFrames, FrameIDs;

initialization
  dxFrameManager.RegisterFrame(GridNewItemRowFrameID, TfrmNewItemRowGrid,
    GridNewItemRowFrameName, GridNewItemRowImageIndex, TableBandedTableGroupIndex, -1, -1);

end.
