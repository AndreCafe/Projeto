unit dxPSDemoFlowChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, dxPSDemoCommon, dxorgchr,
  dxPSdxFCLnk, dxflchrt;

type

  { TfrFlowChartFrame }

  TfrFlowChartFrame = class(TdxPrintingSystemDemoFrame)
    dxFlowChart: TdxFlowChart;
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}

type
  { TdxPSFlowChartFrameInfo }

  TdxPSFlowChartFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TdxPSFlowChartFrameInfo }

constructor TdxPSFlowChartFrameInfo.Create;
begin
  inherited Create;
  Caption := 'FlowChart';
end;

function TdxPSFlowChartFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrFlowChartFrame;
end;

function TdxPSFlowChartFrameInfo.GetImageIndex: Integer;
begin
  Result := 21;
end;

{ TfrFlowChartFrame }

function TfrFlowChartFrame.GetReportLinkComponent: TComponent;
begin
  Result := dxFlowChart;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSFlowChartFrameInfo.Create);

end.
