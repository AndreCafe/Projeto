unit uListaLans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, StdCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  nxdb, nxllComponent, nxsdServerEngine, nxsrServerEngine, nxseAutoComponent,
  nxreRemoteServerEngine, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, ComCtrls;

type
  TFrmPri = class(TForm)
    nxSession1: TnxSession;
    nxDatabase1: TnxDatabase;
    tCli: TnxTable;
    tCliCodigo: TAutoIncField;
    tCliLoja: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliLicVenc: TDateField;
    tCliUObtemLic: TDateTimeField;
    Panel1: TPanel;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    TVCodigo: TcxGridDBColumn;
    TVLoja: TcxGridDBColumn;
    TVCidade: TcxGridDBColumn;
    TVUF: TcxGridDBColumn;
    nxWinsockTransport1: TnxWinsockTransport;
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    tCliAtivado: TBooleanField;
    tCliLicTipo: TWordField;
    PB: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses cxGridExportLink;

{$R *.dfm}

function EmailOk(S: String): Boolean;
begin

end;

procedure TFrmPri.Button1Click(Sender: TObject);
var
  Arq: TextFile;
begin
  Assign(Arq, 'c:\meus programas\nexcafe\lans.csv');
  Rewrite(Arq);

  pb.Max := tCli.RecordCount;
  pb.Position := 0;

  tCli.First;

  while not tCli.Eof do begin
    
    tCli.Next;
  end;
  ExportGridToExcel('c:\meus programas\nexcafe\lista_lans.xls', Grid);

  ShowMessage(IntToStr(tCli.recordCount));
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  tCli.Open;
  tCli.SetRange([5, Date-7], [5, Date+500]);
end;

end.
