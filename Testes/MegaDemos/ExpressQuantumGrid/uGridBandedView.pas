unit uGridBandedView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxStyles, cxControls, cxGrid, StdCtrls, ExtCtrls,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridLevel,
  cxDataStorage, DB, cxDBData, cxMemo, cxCheckBox, cxImage, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxLabel;

type
  TfrmGridBandedView = class(TdxGridFrame)
    GridLevel: TcxGridLevel;
    DBBandedTableView: TcxGridDBBandedTableView;
    DBBandedTableViewCAPTION: TcxGridDBBandedColumn;
    DBBandedTableViewYEAR: TcxGridDBBandedColumn;
    DBBandedTableViewTAGLINE: TcxGridDBBandedColumn;
    DBBandedTableViewPLOTOUTLINE: TcxGridDBBandedColumn;
    DBBandedTableViewRUNTIME: TcxGridDBBandedColumn;
    DBBandedTableViewCOLOR: TcxGridDBBandedColumn;
    DBBandedTableViewPHOTO: TcxGridDBBandedColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses maindata, dxFrames, FrameIDs;

{$R *.dfm}

initialization
  dxFrameManager.RegisterFrame(GridBandedViewFrameID, TfrmGridBandedView,
    GridBandedViewFrameName, GridBandedViewImageIndex, TableBandedTableGroupIndex,
    LayoutFeaturesGroupIndex, -1);

end.
