unit uTeeChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, TeEngine, Series, TeeProcs, Chart,
  dxPSCore, dxPSTCLnk;

type
  TfrmTeeChart = class(TdxFrame)
    TeeChart: TChart;
    Series5: TBarSeries;
    Series7: TBarSeries;
    Series6: TBarSeries;
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    
    function GetPrintableComponent: TComponent; override;
    procedure PrepareLink(AReportLink: TBasedxReportLink); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  MainData, dxFrames, FrameIDs, dxOperationTypes, uStrsConst, dxPrnDev;

{$R *.dfm}

constructor TfrmTeeChart.Create(AOwner: TComponent);
var
  I: Integer;
begin
  inherited;
  with TeeChart do
  begin
    AnimatedZoom := True;
    AnimatedZoomSteps := 4;
    for I := 0 to SeriesCount - 1 do
    with Series[I] do
      FillSampleValues(NumSampleValues);
    UndoZoom;
  end;
end;

procedure TfrmTeeChart.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
end;

procedure TfrmTeeChart.AddOperations;
begin
  inherited;
  with Operations do
  begin
    AddOperation(otPrintStyles, nil);
    AddOperation(otDefinePrintStyles, nil);
    AddOperation(otPrintPreview, nil);
    AddOperation(otPrint, nil);
    AddOperation(otStyles, nil);
  end;
end;

function TfrmTeeChart.GetPrintableComponent: TComponent;
begin
  Result := TeeChart;
end;

procedure TfrmTeeChart.PrepareLink(AReportLink: TBasedxReportLink);
begin
  inherited;
  AReportLink.StyleManager := nil;
  with AReportLink.RealPrinterPage do 
  begin
    CenterOnPageH := True;
    CenterOnPageV := True;
    Orientation := poLandscape;
    FitToPagesByTall := 1;
    FitToPagesByWide := 1;
  end;  
end;

initialization
  dxFrameManager.RegisterFrame(StandardControlTeeChartIndex, TfrmTeeChart,
    StandardControlsTeeChartName, StandardControlsTeeChartImageIndex, 
    StandardControlsTeeChartImageIndex, StandardControlsGroupIndex);

end.
