unit udmPrintGuard;

interface

uses
  SysUtils, Classes, nxsdServerEngine, nxsrServerEngine, DB, nxdb, nxllComponent,
  nxseAutoComponent, nxsrSqlEngineBase, nxsqlEngine;

type
  TdmPrintGuard = class(TDataModule)
    nxDatabase1: TnxDatabase;
    nxSession1: TnxSession;
    nxServerEngine1: TnxServerEngine;
    dsTablePrintList: TDataSource;
    nxSqlEngine1: TnxSqlEngine;
    nxTablePrintList: TnxTable;
    nxTablePrintListid: TAutoIncField;
    nxTablePrintListFileName: TStringField;
    nxTablePrintListmaquina: TStringField;
    nxTablePrintListIDPrinter: TSmallintField;
    nxTablePrintListpaginas: TIntegerField;
    nxTablePrintListdatahora: TDateTimeField;
    nxTableTipoImp: TnxTable;
    nxTableTipoImpID: TWordField;
    nxTableTipoImpNome: TStringField;
    nxTableTipoImpImpressora: TStringField;
    nxTableTipoImpValor: TCurrencyField;
    nxTableTipoImpContador: TIntegerField;
    nxTableTipoImpPrinterDevMode: TBlobField;
    nxTableTipoImpasJson: TnxMemoField;
    nxTableTipoImpActive: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrintGuard: TdmPrintGuard;

implementation

{$R *.dfm}


procedure TdmPrintGuard.DataModuleCreate(Sender: TObject);
begin
    nxDatabase1.open;
    nxTablePrintList.Open;
    nxTableTipoImp.Open;
end;

procedure TdmPrintGuard.DataModuleDestroy(Sender: TObject);
begin
    nxDatabase1.close;
end;

end.
