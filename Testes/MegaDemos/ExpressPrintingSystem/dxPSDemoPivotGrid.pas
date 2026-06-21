unit dxPSDemoPivotGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxInplaceContainer, DB, DBTables, cxTLData, cxDBTL,
  cxMaskEdit, cxMemo, cxBlobEdit, dxPSDemoCommon, cxVariants, cxClasses, cxEdit,
  cxCustomPivotGrid, cxDBPivotGrid, dxPScxPivotGridLnk;

type

  { TfrPivotGridFrame }

  TfrPivotGridFrame = class(TdxPrintingSystemDemoFrame)
    cxDBPivotGrid1: TcxDBPivotGrid;
    cxDBPivotGrid1Trademark: TcxDBPivotGridField;
    cxDBPivotGrid1Model: TcxDBPivotGridField;
    cxDBPivotGrid1TransmissSpeedCount: TcxDBPivotGridField;
    cxDBPivotGrid1TransmissAutomatic: TcxDBPivotGridField;
    cxDBPivotGrid1Category: TcxDBPivotGridField;
    cxDBPivotGrid1Price: TcxDBPivotGridField;
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}

type
  { TdxPSPivotGridFrameInfo }

  TdxPSPivotGridFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TdxPSPivotGridFrameInfo }

constructor TdxPSPivotGridFrameInfo.Create;
begin
  inherited Create;
  Caption := 'PivotGrid';
end;

function TdxPSPivotGridFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrPivotGridFrame;
end;

function TdxPSPivotGridFrameInfo.GetImageIndex: Integer;
begin
  Result := 13;
end;

{ TfrPivotGridFrame }

function TfrPivotGridFrame.GetReportLinkComponent: TComponent;
begin
  Result := cxDBPivotGrid1;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSPivotGridFrameInfo.Create);

end.
