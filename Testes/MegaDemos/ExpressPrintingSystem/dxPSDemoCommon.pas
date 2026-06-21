unit dxPSDemoCommon;

interface

uses
  Windows, SysUtils, Classes, Forms, Controls, cxClasses, cxGraphics, dxPSCore;

type

  { TdxPrintingSystemDemoFrame }

  TdxPrintingSystemDemoFrame = class(TForm)
  private
    FReportLink: TBasedxReportLink;
  protected
    function CreateReportLink(AComponentPrinter: TdxComponentPrinter): TBasedxReportLink; virtual;
    function GetReportLinkComponent: TComponent; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateEx(AComponentPrinter: TdxComponentPrinter); virtual;
    destructor Destroy; override;
    //
    property ReportLink: TBasedxReportLink read FReportLink;
    property ReportLinkComponent: TComponent read GetReportLinkComponent;
  end;
  TdxPrintingSystemDemoFrameClass = class of TdxPrintingSystemDemoFrame;

  { TdxPrintingSystemDemoFrameInfo }

  TdxPrintingSystemDemoFrameInfo = class(TObject)
  private
    FCaption: string;
    FFrame: TdxPrintingSystemDemoFrame;
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; virtual;
    function GetImageIndex: Integer; virtual;
  public
    destructor Destroy; override;
    procedure CreateFrame(AFrameHost: TWinControl; AComponentPrinter: TdxComponentPrinter);
    procedure FreeFrame;
    //
    property Caption: string read FCaption write FCaption;
    property ImageIndex: Integer read GetImageIndex;
  end;

  { TdxPrintingSystemDemoFrames }

  TdxPrintingSystemDemoFrames = class(TObject)
  private
    FItems: TcxObjectList;
    function GetCount: Integer;
    function GetFrameInfo(Index: Integer): TdxPrintingSystemDemoFrameInfo;
  public
    constructor Create;
    destructor Destroy; override;
    function IndexOf(AFrameInfo: TdxPrintingSystemDemoFrameInfo): Integer;
    procedure Register(AFrameInfo: TdxPrintingSystemDemoFrameInfo);
    procedure Unregister(AFrameInfo: TdxPrintingSystemDemoFrameInfo);
    //
    property Count: Integer read GetCount;
    property FrameInfo[Index: Integer]: TdxPrintingSystemDemoFrameInfo read GetFrameInfo; default;
  end;

function PrintingSystemDemoFrames: TdxPrintingSystemDemoFrames;
implementation

var
  FPrintingSystemDemoFrames: TdxPrintingSystemDemoFrames;

function PrintingSystemDemoFrames: TdxPrintingSystemDemoFrames;
begin
  if FPrintingSystemDemoFrames = nil then
    FPrintingSystemDemoFrames := TdxPrintingSystemDemoFrames.Create;
  Result := FPrintingSystemDemoFrames;
end;

{ TdxPrintingSystemDemoFrames }

constructor TdxPrintingSystemDemoFrames.Create;
begin
  inherited Create;
  FItems := TcxObjectList.Create;
end;

destructor TdxPrintingSystemDemoFrames.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

function TdxPrintingSystemDemoFrames.IndexOf(AFrameInfo: TdxPrintingSystemDemoFrameInfo): Integer;
begin
  Result := FItems.IndexOf(AFrameInfo);
end;

procedure TdxPrintingSystemDemoFrames.Register(AFrameInfo: TdxPrintingSystemDemoFrameInfo);
begin
  FItems.Add(AFrameInfo);
end;

procedure TdxPrintingSystemDemoFrames.Unregister(AFrameInfo: TdxPrintingSystemDemoFrameInfo);
begin
  if FItems.Remove(AFrameInfo) >= 0 then
    FreeAndNil(AFrameInfo);
end;

function TdxPrintingSystemDemoFrames.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TdxPrintingSystemDemoFrames.GetFrameInfo(Index: Integer): TdxPrintingSystemDemoFrameInfo;
begin
  Result := TdxPrintingSystemDemoFrameInfo(FItems.Items[Index]);
end;

{ TdxPrintingSystemDemoFrameInfo }

destructor TdxPrintingSystemDemoFrameInfo.Destroy;
begin
  FreeFrame;
  inherited Destroy;
end;

procedure TdxPrintingSystemDemoFrameInfo.CreateFrame(
  AFrameHost: TWinControl; AComponentPrinter: TdxComponentPrinter);
begin
  FFrame := GetFrameClass.CreateEx(AComponentPrinter);
  FFrame.Parent := AFrameHost;
  FFrame.Align := alClient;
  FFrame.Show;
end;

procedure TdxPrintingSystemDemoFrameInfo.FreeFrame;
begin
  FreeAndNil(FFrame);
end;

function TdxPrintingSystemDemoFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TdxPrintingSystemDemoFrame;
end;

function TdxPrintingSystemDemoFrameInfo.GetImageIndex: Integer;
begin
  Result := -1;
end;

{ TdxPrintingSystemDemoFrame }

constructor TdxPrintingSystemDemoFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BorderStyle := bsNone;
end;

constructor TdxPrintingSystemDemoFrame.CreateEx(AComponentPrinter: TdxComponentPrinter);
begin
  Create(nil);
  FReportLink := CreateReportLink(AComponentPrinter);
end;

destructor TdxPrintingSystemDemoFrame.Destroy;
begin
  FreeAndNil(FReportLink);
  inherited Destroy;
end;

function TdxPrintingSystemDemoFrame.CreateReportLink(
  AComponentPrinter: TdxComponentPrinter): TBasedxReportLink;
begin
  Result := AComponentPrinter.AddLink(ReportLinkComponent);
end;

initialization

finalization
  FreeAndNil(FPrintingSystemDemoFrames);

end.
