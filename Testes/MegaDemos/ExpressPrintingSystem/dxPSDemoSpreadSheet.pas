unit dxPSDemoSpreadSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSDemoCommon, cxSSheet, dxPScxSSLnk;

type

  { TfrSchedulerFrame }

  TfrSpreadSheetFrame = class(TdxPrintingSystemDemoFrame)
    cxSpreadSheet: TcxSpreadSheet;
    procedure FormCreate(Sender: TObject);
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}
{$R dxPSDemoSpreadSheet.res}

type

  { TdxPSSpreadSheetFrameInfo }

  TdxPSSpreadSheetFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TdxPSSpreadSheetFrameInfo }

constructor TdxPSSpreadSheetFrameInfo.Create;
begin
  inherited Create;
  Caption := 'SpreadSheet';
end;

function TdxPSSpreadSheetFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrSpreadSheetFrame;
end;

function TdxPSSpreadSheetFrameInfo.GetImageIndex: Integer;
begin
  Result := 16;
end;

{ TfrSpreadSheetFrame }

procedure TfrSpreadSheetFrame.FormCreate(Sender: TObject);
var
  AResStream: TResourceStream;
begin
  AResStream := TResourceStream.Create(HInstance, 'DXSPREATSHEET', 'DXPSDEMO');
  try
    cxSpreadSheet.LoadFromStream(AResStream);
  finally
    AResStream.Free;
  end;
end;

function TfrSpreadSheetFrame.GetReportLinkComponent: TComponent;
begin
  Result := cxSpreadSheet;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSSpreadSheetFrameInfo.Create);

end.
