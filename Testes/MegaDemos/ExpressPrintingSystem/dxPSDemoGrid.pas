unit dxPSDemoGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxInplaceContainer, DB, DBTables, cxTLData, cxDBTL,
  cxMaskEdit, cxMemo, cxBlobEdit, dxPSDemoCommon, cxVariants, cxData, cxFilter,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCardView,
  cxGridDBCardView, cxGridChartView, cxGridDBChartView, dxPScxGridLnk, cxTimeEdit;

type

  { TfrGridFrame }

  TfrGridFrame = class(TdxPrintingSystemDemoFrame)
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    cxGridDBBandedTableView: TcxGridDBBandedTableView;
    cxGridDBBandedTableViewRecId: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewTrademark: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewModel: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewHP: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewLiter: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewCyl: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewTransmissSpeedCount: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewTransmissAutomatic: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewCategory: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewHyperlink: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewPicture: TcxGridDBBandedColumn;
    cxGridDBBandedTableViewPrice: TcxGridDBBandedColumn;
    cxGridLevel3: TcxGridLevel;
    cxGridDBCardView: TcxGridDBCardView;
    cxGridDBCardViewRecId: TcxGridDBCardViewRow;
    cxGridDBCardViewTrademark: TcxGridDBCardViewRow;
    cxGridDBCardViewModel: TcxGridDBCardViewRow;
    cxGridDBCardViewHP: TcxGridDBCardViewRow;
    cxGridDBCardViewLiter: TcxGridDBCardViewRow;
    cxGridDBCardViewCyl: TcxGridDBCardViewRow;
    cxGridDBCardViewTransmissSpeedCount: TcxGridDBCardViewRow;
    cxGridDBCardViewTransmissAutomatic: TcxGridDBCardViewRow;
    cxGridDBCardViewCategory: TcxGridDBCardViewRow;
    cxGridDBCardViewHyperlink: TcxGridDBCardViewRow;
    cxGridDBCardViewPicture: TcxGridDBCardViewRow;
    cxGridDBCardViewPrice: TcxGridDBCardViewRow;
    cxGridDBChartView: TcxGridDBChartView;
    cxGridLevel4: TcxGridLevel;
    cxGridDBChartViewSeries1: TcxGridDBChartSeries;
    cxGridLevel5: TcxGridLevel;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableViewTrademark: TcxGridDBColumn;
    cxGridDBTableViewModel: TcxGridDBColumn;
    cxGridDBTableViewTransmissSpeedCount: TcxGridDBColumn;
    cxGridDBTableViewTransmissAutomatic: TcxGridDBColumn;
    cxGridDBTableViewCategory: TcxGridDBColumn;
    cxGridDBTableViewHyperlink: TcxGridDBColumn;
    cxGridDBTableViewPicture: TcxGridDBColumn;
    cxGridDBTableViewPrice: TcxGridDBColumn;
    cxGridDBTableView1PurchaseDate: TcxGridDBColumn;
    cxGridDBTableView1Orders_Time: TcxGridDBColumn;
    cxGridDBTableView1PaymentType: TcxGridDBColumn;
    cxGridDBTableView1PaymentAmount: TcxGridDBColumn;
    cxGridDBTableView1Quantity: TcxGridDBColumn;
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData, uMainUnit;

{$R *.dfm}

type
  { TdxPSGridFrameInfo }

  TdxPSGridFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TdxPSGridFrameInfo }

constructor TdxPSGridFrameInfo.Create;
begin
  inherited Create;
  Caption := 'Grid';
end;

function TdxPSGridFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrGridFrame;
end;

function TdxPSGridFrameInfo.GetImageIndex: Integer;
begin
  Result := 12;
end;

{ TfrGridFrame }

function TfrGridFrame.GetReportLinkComponent: TComponent;
begin
  Result := cxGrid;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSGridFrameInfo.Create);

end.
