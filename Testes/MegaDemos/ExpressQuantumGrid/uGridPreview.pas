unit uGridPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGrid, StdCtrls, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, DB, cxDBData, cxClasses, cxLookAndFeels,
  cxLookAndFeelPainters, cxDataStorage, cxContainer, cxLabel;

type
  TfrmGridPreview = class(TdxGridFrame)
    GridLevel: TcxGridLevel;
    DBTableView: TcxGridDBTableView;
    DBTableViewFIRSTNAME: TcxGridDBColumn;
    DBTableViewSECONDNAME: TcxGridDBColumn;
    DBTableViewBIRTHNAME: TcxGridDBColumn;
    DBTableViewBIOGRAPHY: TcxGridDBColumn;
    DBTableViewGENDER: TcxGridDBColumn;
    DBTableViewBirthDate: TcxGridDBColumn;
  private
    { Private declarations }
  public
    procedure ChangeVisibility(AShow: Boolean); override;
  end;

var
  frmGridPreview: TfrmGridPreview;

implementation

{$R *.dfm}

uses maindata, dxFrames, FrameIDs;


{ TfrmGridPreview }

procedure TfrmGridPreview.ChangeVisibility(AShow: Boolean);
begin
  if AShow then
    DBTableView.DataController.DataSource := dmMain.dsMovieStars
  else
  begin
    DBTableView.DataController.DataSource := nil;
    dmMain.cdsMovieStars.Filtered := False;
    dmMain.cdsMovieStars.Filter := '';
  end;
  inherited ChangeVisibility(AShow);
end;

initialization
  dxFrameManager.RegisterFrame(GridPreviewFrameID, TfrmGridPreview,
    GridAutoPreviewFrameName, GridPreviewImageIndex, PreviewAndViewGroupIndex, -1, -1);


end.
