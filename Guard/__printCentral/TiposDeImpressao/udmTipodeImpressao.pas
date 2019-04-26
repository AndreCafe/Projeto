unit udmTipodeImpressao;

interface

uses
  SysUtils, Classes, nxsdServerEngine, nxsrServerEngine, DB, nxdb, nxllComponent,
  nxseAutoComponent, nxsrSqlEngineBase, nxsqlEngine;

type
  TdmTipodeImpressao = class(TDataModule)
    nxDatabase1: TnxDatabase;
    nxSession1: TnxSession;
    nxTableTipoImp: TnxTable;
    nxServerEngine1: TnxServerEngine;
    nxTableTipoImpID: TWordField;
    nxTableTipoImpNome: TStringField;
    nxTableTipoImpImpressora: TStringField;
    nxTableTipoImpValor: TCurrencyField;
    nxTableTipoImpContador: TIntegerField;
    nxTableTipoImpPrinterDevMode: TBlobField;
    nxTableTipoImpasJson: TnxMemoField;
    nxTableTipoImpActive: TBooleanField;
    dsTableTipoImp: TDataSource;
    dsTablePrinters: TDataSource;
    nxTablePrinters: TnxTable;
    nxTablePrintersasJson: TnxMemoField;
    nxQuery1: TnxQuery;
    nxSqlEngine1: TnxSqlEngine;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTipodeImpressao: TdmTipodeImpressao;

implementation

{$R *.dfm}


procedure TdmTipodeImpressao.DataModuleCreate(Sender: TObject);
begin
    nxDatabase1.open;
    nxTableTipoImp.Open;
    nxTablePrinters.Open;
end;

procedure TdmTipodeImpressao.DataModuleDestroy(Sender: TObject);
begin
    nxDatabase1.close;
    nxTablePrinters.close;
end;

end.
