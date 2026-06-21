unit dxPSDemoRichEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, dxPSDemoCommon, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxRichEdit, dxPSRELnk;

type

  { TfrRichEditFrame }

  TfrRichEditFrame = class(TdxPrintingSystemDemoFrame)
    cxRichEdit1: TcxRichEdit;
    procedure FormCreate(Sender: TObject);
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}
{$R dxPSDemoRichEdit.res}

type
  { TdxPSRichEditFrameInfo }

  TdxPSRichEditFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TdxPSRichEditFrameInfo }

constructor TdxPSRichEditFrameInfo.Create;
begin
  inherited Create;
  Caption := 'RichEdit';
end;

function TdxPSRichEditFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrRichEditFrame;
end;

function TdxPSRichEditFrameInfo.GetImageIndex: Integer;
begin
  Result := 19;
end;

{ TfrRichEditFrame }

procedure TfrRichEditFrame.FormCreate(Sender: TObject);
var
  AResStream: TResourceStream;
begin
  AResStream := TResourceStream.Create(HInstance, 'CXRICHEDIT', 'DXPSDEMO');
  try
    cxRichEdit1.Lines.LoadFromStream(AResStream);
  finally
    AResStream.Free;
  end;
end;

function TfrRichEditFrame.GetReportLinkComponent: TComponent;
begin
  Result := cxRichEdit1;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSRichEditFrameInfo.Create);

end.
