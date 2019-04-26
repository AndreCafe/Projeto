unit uVerSenhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxdb, nxllComponent, nxsdServerEngine, nxsrServerEngine, Grids,
  DBGrids, nxseAutoComponent;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ServerEng: TnxServerEngine;
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    Tab: TnxTable;
    DataSource1: TDataSource;
    nxseAllEngines1: TnxseAllEngines;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  nxDB.AliasPath := ExtractFileDir(ParamStr(0));
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Tab.Active := True;
end;

end.
