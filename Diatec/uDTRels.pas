unit uDTRels;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, frxExportPDF;

type
  TdmRels = class(TDataModule)
    dbRA: TfrxDBDataset;
    dbRAOS: TfrxDBDataset;
    dbRAItem: TfrxDBDataset;
    pdfExp: TfrxPDFExport;
    dbParams: TfrxDBDataset;
    frRA: TfrxReport;
    procedure dbRAOSCheckEOF(Sender: TObject; var Eof: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRels: TdmRels;

implementation

uses uDTDM, uDTFrmPri;

{$R *.dfm}

procedure TdmRels.dbRAOSCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  FrmPri.Caption := 'Checando EOF';
end;

end.
