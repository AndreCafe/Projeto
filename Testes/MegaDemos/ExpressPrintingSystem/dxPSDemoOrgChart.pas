unit dxPSDemoOrgChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, dxPSDemoCommon, dxorgchr,
  dxPSdxOCLnk;

type

  { TfrOrgChartFrame }

  TfrOrgChartFrame = class(TdxPrintingSystemDemoFrame)
    dxOrgChart: TdxOrgChart;
    procedure FormShow(Sender: TObject);
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}

type
  { TdxPSOrgChartFrameInfo }

  TdxPSOrgChartFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TdxPSOrgChartFrameInfo }

constructor TdxPSOrgChartFrameInfo.Create;
begin
  inherited Create;
  Caption := 'OrgChart';
end;

function TdxPSOrgChartFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrOrgChartFrame;
end;

function TdxPSOrgChartFrameInfo.GetImageIndex: Integer;
begin
  Result := 20;
end;

{ TfrOrgChartFrame }

procedure TfrOrgChartFrame.FormShow(Sender: TObject);
begin
  dxOrgChart.FullExpand;
end;

function TfrOrgChartFrame.GetReportLinkComponent: TComponent;
begin
  Result := dxOrgChart;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSOrgChartFrameInfo.Create);

end.
