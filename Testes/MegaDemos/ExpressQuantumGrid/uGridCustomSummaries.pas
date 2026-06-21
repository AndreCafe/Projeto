unit uGridCustomSummaries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxControls, cxGrid, StdCtrls, ExtCtrls,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, DB, DBTables,
  cxGridCommon, cxGridCustomView, cxGridLevel, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, cxDBData, cxClasses, cxDataStorage,
  cxSpinEdit, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxLabel;

type
  TfrmCustomGridSummaries = class(TdxGridFrame)
    GridLevel: TcxGridLevel;
    GridDBTableView: TcxGridDBTableView;
    GridDBTableViewFIRSTNAME: TcxGridDBColumn;
    GridDBTableViewLASTNAME: TcxGridDBColumn;
    GridDBTableViewCOMPANYNAME: TcxGridDBColumn;
    GridDBTableViewPAYMENTTYPE: TcxGridDBColumn;
    GridDBTableViewPRODUCTID: TcxGridDBColumn;
    GridDBTableViewCUSTOMER: TcxGridDBColumn;
    GridDBTableViewPURCHASEDATE: TcxGridDBColumn;
    GridDBTableViewPAYMENTAMOUNT: TcxGridDBColumn;
    GridDBTableViewCOPIES: TcxGridDBColumn;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses dxOperationTypes;

{$R *.dfm}

constructor TfrmCustomGridSummaries.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DoFullExpand(otFullExpand);
end;

end.
