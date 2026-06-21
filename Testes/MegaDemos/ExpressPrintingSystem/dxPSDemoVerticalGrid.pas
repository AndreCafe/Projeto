unit dxPSDemoVerticalGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, DB, DBTables, cxTLData, cxDBTL, cxInplaceContainer,
  cxMaskEdit, cxMemo, cxBlobEdit, dxPScxVGridLnk, dxPSDemoCommon, cxVariants,
  cxEdit, cxVGrid, cxDBVGrid, cxImage;

type

  { TfrVerticalGridFrame }

  TfrVerticalGridFrame = class(TdxPrintingSystemDemoFrame)
    cxDBVerticalGrid: TcxDBVerticalGrid;
    cxDBVerticalGridRecId: TcxDBEditorRow;
    cxDBVerticalGridTrademark: TcxDBEditorRow;
    cxDBVerticalGridModel: TcxDBEditorRow;
    cxDBVerticalGridHP: TcxDBEditorRow;
    cxDBVerticalGridLiter: TcxDBEditorRow;
    cxDBVerticalGridCyl: TcxDBEditorRow;
    cxDBVerticalGridTransmissSpeedCount: TcxDBEditorRow;
    cxDBVerticalGridTransmissAutomatic: TcxDBEditorRow;
    cxDBVerticalGridCategory: TcxDBEditorRow;
    cxDBVerticalGridHyperlink: TcxDBEditorRow;
    cxDBVerticalGridPicture: TcxDBEditorRow;
    cxDBVerticalGridPrice: TcxDBEditorRow;
    cxDBVerticalGridCategoryRow1: TcxCategoryRow;
    cxDBVerticalGridCategoryRow2: TcxCategoryRow;
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}

type
  { TdxPSVerticalGridFrameInfo }

  TdxPSVerticalGridFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TdxPSVerticalGridFrameInfo }

constructor TdxPSVerticalGridFrameInfo.Create;
begin
  inherited Create;
  Caption := 'VerticalGrid';
end;

function TdxPSVerticalGridFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrVerticalGridFrame;
end;

function TdxPSVerticalGridFrameInfo.GetImageIndex: Integer;
begin
  Result := 14;
end;

{ TfrVerticalGridFrame }

function TfrVerticalGridFrame.GetReportLinkComponent: TComponent;
begin
  Result := cxDBVerticalGrid;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSVerticalGridFrameInfo.Create);

end.
