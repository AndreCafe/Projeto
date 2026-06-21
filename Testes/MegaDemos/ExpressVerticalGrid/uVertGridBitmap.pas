unit uVertGridBitmap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uVertGridCustomMultiRecords, cxStyles, cxGraphics, cxEdit,
  cxImageComboBox, cxSpinEdit, cxBlobEdit, cxHyperLinkEdit, cxCurrencyEdit,
  cxImage, ImgList, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  StdCtrls, ExtCtrls;

type
  TfrmVertGridBitmap = class(TfrmCustomVertGridMultiRecords)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
  private
    { Private declarations }
  protected
    function GetDescription: string; override;
  public
    { Public declarations }
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, uStrsConst, TypInfo;

{$R *.dfm}

{ TfrmVertGridBitmap }

function TfrmVertGridBitmap.GetDescription: string;
begin
  Result := sdxFrameVerticalGridBitmap;
end;

initialization
  dxFrameManager.RegisterFrame(VerticalGridBackgroundFrameID, TfrmVertGridBitmap,
    VerticalGridBackgroundName, VerticalGridBackgroundImageIndex, VerticalGridBackgroundImageIndex, VerticalGridSideBarGroupIndex);


end.
