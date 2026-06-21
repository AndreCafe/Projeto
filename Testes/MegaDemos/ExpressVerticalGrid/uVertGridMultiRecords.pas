unit uVertGridMultiRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uVertGridCustomMultiRecords, cxStyles, cxGraphics, cxEdit,
  cxImageComboBox, cxSpinEdit, cxBlobEdit, cxHyperLinkEdit, cxCurrencyEdit,
  cxImage, ImgList, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  StdCtrls, ExtCtrls;

type
  TfrmVertGridMultiRecords = class(TfrmCustomVertGridMultiRecords)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, uStrsConst;

{$R *.dfm}

{ TfrmVertGridMultiRecords }

initialization
  dxFrameManager.RegisterFrame(VerticalGridMultiRecordFrameID, TfrmVertGridMultiRecords,
    VerticalGridMultiRecordName, VerticalGridMultiRecordImageIndex, VerticalGridMultiRecordImageIndex, VerticalGridSideBarGroupIndex);

end.
