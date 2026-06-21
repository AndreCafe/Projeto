unit uGridCustomMasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxControls, cxGrid, StdCtrls, ExtCtrls,
  cxGridLevel, cxGridCommon, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, DB, DBTables, cxGridDBDataDefinitions,
  Grids, DBGrids, cxGridCardView, cxGridDBCardView, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, cxDBData, cxClasses, cxDataStorage,
  dxPSCore, cxTextEdit, cxImage, cxCheckBox, cxLookAndFeels, cxLookAndFeelPainters,
  cxGridCustomLayoutView, cxContainer, cxLabel;

type
  TfrmGridCustomMasterDetail = class(TdxGridFrame)
    glDepartments: TcxGridLevel;
    tvDepartments: TcxGridDBTableView;
    tvDepartmentsID: TcxGridDBColumn;
    tvDepartmentsNAME: TcxGridDBColumn;
    gltEmployee: TcxGridLevel;
    tvEmployee: TcxGridDBTableView;
    tvEmployeeFNAME: TcxGridDBColumn;
    tvEmployeeLNAME: TcxGridDBColumn;
    tvEmployeeEMAIL: TcxGridDBColumn;
    tvEmployeePHONE: TcxGridDBColumn;
    tvEmployeeDepartmentName: TcxGridDBColumn;
    glcEmployee: TcxGridLevel;
    cvEmployee: TcxGridDBCardView;
    cvEmployeeFNAME: TcxGridDBCardViewRow;
    cvEmployeeMNAME: TcxGridDBCardViewRow;
    cvEmployeeLNAME: TcxGridDBCardViewRow;
    cvEmployeeEMAIL: TcxGridDBCardViewRow;
    cvEmployeePHONE: TcxGridDBCardViewRow;
    cvEmployeeDepartmentName: TcxGridDBCardViewRow;
    glProjects: TcxGridLevel;
    tvProjects: TcxGridDBTableView;
    tvProjectsNAME: TcxGridDBColumn;
    tvProjectsMANAGERID: TcxGridDBColumn;
    gltItems: TcxGridLevel;
    tvItems: TcxGridDBTableView;
    tvItemsNAME: TcxGridDBColumn;
    tvItemsTYPE: TcxGridDBColumn;
    tvItemsPROJECTID: TcxGridDBColumn;
    tvItemsPRIORITY: TcxGridDBColumn;
    tvItemsSTATUS: TcxGridDBColumn;
    tvItemsCREATORID: TcxGridDBColumn;
    tvItemsCREATEDDATE: TcxGridDBColumn;
    tvItemsOWNERID: TcxGridDBColumn;
    tvItemsLASTMODIFIEDDATE: TcxGridDBColumn;
    tvItemsFIXEDDATE: TcxGridDBColumn;
    tvItemsDESCRIPTION: TcxGridDBColumn;
    GridDBTableView: TcxGridDBTableView;
    GridDBTableViewID: TcxGridDBColumn;
    GridDBTableViewNAME: TcxGridDBColumn;
    GridDBTableViewTYPE: TcxGridDBColumn;
    GridDBTableViewPROJECTID: TcxGridDBColumn;
    GridDBTableViewPRIORITY: TcxGridDBColumn;
    GridDBTableViewSTATUS: TcxGridDBColumn;
    GridDBTableViewCREATORID: TcxGridDBColumn;
    GridDBTableViewCREATEDDATE: TcxGridDBColumn;
    GridDBTableViewOWNERID: TcxGridDBColumn;
    GridDBTableViewLASTMODIFIEDDATE: TcxGridDBColumn;
    GridDBTableViewFIXEDDATE: TcxGridDBColumn;
    GridDBTableViewDESCRIPTION: TcxGridDBColumn;
    GridDBTableViewRESOLUTION: TcxGridDBColumn;
    glcItems: TcxGridLevel;
    cvItems: TcxGridDBCardView;
    cvItemsNAME: TcxGridDBCardViewRow;
    cvItemsTYPE: TcxGridDBCardViewRow;
    cvItemsPROJECTID: TcxGridDBCardViewRow;
    cvItemsPRIORITY: TcxGridDBCardViewRow;
    cvItemsSTATUS: TcxGridDBCardViewRow;
    cvItemsCREATORID: TcxGridDBCardViewRow;
    cvItemsCREATEDDATE: TcxGridDBCardViewRow;
    cvItemsOWNERID: TcxGridDBCardViewRow;
    cvItemsLASTMODIFIEDDATE: TcxGridDBCardViewRow;
    cvItemsFIXEDDATE: TcxGridDBCardViewRow;
    cvEmployeeName: TcxGridDBCardViewRow;
    procedure cvEmployeeNameGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
  protected
    function IsFooterEnabled(AView: TcxCustomGridView): Boolean; override;
    function IsFooterMenuEnabled: Boolean; override;
    procedure PrepareLink(AReportLink: TBasedxReportLink); override;
  end;

implementation

{$R *.dfm}

uses
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, 
  dxPScxCommon;

function TfrmGridCustomMasterDetail.IsFooterEnabled(AView: TcxCustomGridView): Boolean;
begin
  Result := (AView <> tvDepartments) and (AView <> tvProjects);
end;

function TfrmGridCustomMasterDetail.IsFooterMenuEnabled: Boolean;
begin
  Result := False;
end;

procedure TfrmGridCustomMasterDetail.PrepareLink(AReportLink: TBasedxReportLink);
begin
  inherited;
  TdxGridReportLink(AReportLink).OptionsOnEveryPage.UnsetAll;
end;

procedure TfrmGridCustomMasterDetail.cvEmployeeNameGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText := ARecord.DisplayTexts[cvEmployeeFNAME.Index] + ' ' + ARecord.DisplayTexts[cvEmployeeLNAME.Index];
end;

end.
