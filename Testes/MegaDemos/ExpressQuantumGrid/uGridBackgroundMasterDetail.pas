unit uGridBackgroundMasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGridCustomMasterDetail, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, cxGridLevel, cxGridCardView,
  cxGridDBCardView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, ExtCtrls, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters,
  cxGridCustomLayoutView, cxContainer, cxLabel;

type
  TfrmGridBackgroundMasterDetail = class(TfrmGridCustomMasterDetail)
    StyleRepository: TcxStyleRepository;
    StyleBackground_20: TcxStyle;
    StyleBackground_381068: TcxStyle;
    StyleBackground_Concept: TcxStyle;
    StyleBackground_New1: TcxStyle;
    StyleBackground_Pattern: TcxStyle;
    StyleBackground_Enter: TcxStyle;
    StyleBackground_Blue008: TcxStyle;
    StyleBackground_Blue028: TcxStyle;
    StyleBackground_Green061: TcxStyle;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses
  dxFrames, mainData, FrameIDs;

{ TfrmGridMasterDetail }

constructor TfrmGridBackgroundMasterDetail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

initialization
  dxFrameManager.RegisterFrame(GridBackgroundMasterDetailFrameID, TfrmGridBackgroundMasterDetail,
    GridBackgroundMasterDetailFrameName, GridBackgroundMasterDetailImageIndex, AppearanceGroupIndex, -1, -1);


end.
