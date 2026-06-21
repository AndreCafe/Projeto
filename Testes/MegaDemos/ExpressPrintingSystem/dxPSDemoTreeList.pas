unit dxPSDemoTreeList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, DB, DBTables, cxTLData, cxDBTL, cxInplaceContainer,
  cxMaskEdit, cxMemo, cxBlobEdit, dxPScxTLLnk, dxPSDemoCommon, cxVariants,
  cxHyperLinkEdit, cxImage, cxCurrencyEdit, cxCheckBox;

type

  { TfrTreeListFrame }

  TfrTreeListFrame = class(TdxPrintingSystemDemoFrame)
    cxDBTreeList: TcxDBTreeList;
    cxDBTreeListRecId: TcxDBTreeListColumn;
    cxDBTreeListTrademark: TcxDBTreeListColumn;
    cxDBTreeListModel: TcxDBTreeListColumn;
    cxDBTreeListHP: TcxDBTreeListColumn;
    cxDBTreeListLiter: TcxDBTreeListColumn;
    cxDBTreeListCyl: TcxDBTreeListColumn;
    cxDBTreeListTransmissSpeedCount: TcxDBTreeListColumn;
    cxDBTreeListTransmissAutomatic: TcxDBTreeListColumn;
    cxDBTreeListCategory: TcxDBTreeListColumn;
    cxDBTreeListHyperlink: TcxDBTreeListColumn;
    cxDBTreeListPicture: TcxDBTreeListColumn;
    cxDBTreeListPrice: TcxDBTreeListColumn;
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}

type
  { TdxPSTreeListFrameInfo }

  TdxPSTreeListFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

{ TdxPSTreeListFrameInfo }

constructor TdxPSTreeListFrameInfo.Create;
begin
  inherited Create;
  Caption := 'TreeList';
end;

function TdxPSTreeListFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrTreeListFrame;
end;

function TdxPSTreeListFrameInfo.GetImageIndex: Integer;
begin
  Result := 11;
end;

{ TfrTreeListFrame }

function TfrTreeListFrame.GetReportLinkComponent: TComponent;
begin
  Result := cxDBTreeList;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSTreeListFrameInfo.Create);

end.
