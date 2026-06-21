unit dxPSDemoTeeChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, dxPSDemoCommon, dxPSTCLnk, TeEngine,
  ExtCtrls, TeeProcs, Chart, Series;

type

  { TfrTeeChartFrame }

  TfrTeeChartFrame = class(TdxPrintingSystemDemoFrame)
    TeeChart: TChart;
    Series5: TBarSeries;
    Series7: TBarSeries;
    Series6: TBarSeries;
    procedure FormCreate(Sender: TObject);
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}

type
  { TfrTeeChartFrameInfo }

  TfrTeeChartFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TfrTeeChartFrameInfo }

constructor TfrTeeChartFrameInfo.Create;
begin
  inherited Create;
  Caption := 'TeeChart';
end;

function TfrTeeChartFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrTeeChartFrame;
end;

function TfrTeeChartFrameInfo.GetImageIndex: Integer;
begin
  Result := 18;
end;

{ TfrTeeChartFrame }

procedure TfrTeeChartFrame.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  Randomize;
  for I := 0 to 5 do
  begin
    Series5.Add(Random(350));
    Series6.Add(Random(350));
    Series7.Add(Random(350));
  end;
end;

function TfrTeeChartFrame.GetReportLinkComponent: TComponent;
begin
  Result := TeeChart;
end;

initialization
  PrintingSystemDemoFrames.Register(TfrTeeChartFrameInfo.Create);

end.
