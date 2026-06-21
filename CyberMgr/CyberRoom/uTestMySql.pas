unit uTestMySql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, mySQLDbTables, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxPC, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TForm1 = class(TForm)
    qCheck: TmySQLQuery;
    DB: TmySQLDatabase;
    DataSource1: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1idpessoajuridica: TcxGridDBColumn;
    cxGrid1DBTableView1idpessoa: TcxGridDBColumn;
    cxGrid1DBTableView1UserName: TcxGridDBColumn;
    cxGrid1DBTableView1Attribute: TcxGridDBColumn;
    cxGrid1DBTableView1op: TcxGridDBColumn;
    cxGrid1DBTableView1Value: TcxGridDBColumn;
    cxGrid1DBTableView1CheckInTime: TcxGridDBColumn;
    cxGrid1DBTableView1CheckOutTime: TcxGridDBColumn;
    qAcct: TmySQLQuery;
    qAcctRadAcctId: TLargeintField;
    qAcctAcctSessionId: TStringField;
    qAcctAcctUniqueId: TStringField;
    qAcctUserName: TStringField;
    qAcctRealm: TStringField;
    qAcctNASIPAddress: TStringField;
    qAcctNASPortId: TIntegerField;
    qAcctNASPortType: TStringField;
    qAcctAcctStartTime: TDateTimeField;
    qAcctAcctStopTime: TDateTimeField;
    qAcctAcctSessionTime: TIntegerField;
    qAcctAcctAuthentic: TStringField;
    qAcctConnectInfo_start: TStringField;
    qAcctConnectInfo_stop: TStringField;
    qAcctAcctInputOctets: TLargeintField;
    qAcctAcctOutputOctets: TLargeintField;
    qAcctCalledStationId: TStringField;
    qAcctCallingStationId: TStringField;
    qAcctAcctTerminateCause: TStringField;
    qAcctServiceType: TStringField;
    qAcctFramedProtocol: TStringField;
    qAcctFramedIPAddress: TStringField;
    qAcctAcctStartDelay: TIntegerField;
    qAcctAcctStopDelay: TIntegerField;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    DataSource2: TDataSource;
    cxGrid2DBTableView1RadAcctId: TcxGridDBColumn;
    cxGrid2DBTableView1AcctSessionId: TcxGridDBColumn;
    cxGrid2DBTableView1AcctUniqueId: TcxGridDBColumn;
    cxGrid2DBTableView1UserName: TcxGridDBColumn;
    cxGrid2DBTableView1Realm: TcxGridDBColumn;
    cxGrid2DBTableView1NASIPAddress: TcxGridDBColumn;
    cxGrid2DBTableView1NASPortId: TcxGridDBColumn;
    cxGrid2DBTableView1NASPortType: TcxGridDBColumn;
    cxGrid2DBTableView1AcctStartTime: TcxGridDBColumn;
    cxGrid2DBTableView1AcctStopTime: TcxGridDBColumn;
    cxGrid2DBTableView1AcctSessionTime: TcxGridDBColumn;
    cxGrid2DBTableView1AcctAuthentic: TcxGridDBColumn;
    cxGrid2DBTableView1ConnectInfo_start: TcxGridDBColumn;
    cxGrid2DBTableView1ConnectInfo_stop: TcxGridDBColumn;
    cxGrid2DBTableView1AcctInputOctets: TcxGridDBColumn;
    cxGrid2DBTableView1AcctOutputOctets: TcxGridDBColumn;
    cxGrid2DBTableView1CalledStationId: TcxGridDBColumn;
    cxGrid2DBTableView1CallingStationId: TcxGridDBColumn;
    cxGrid2DBTableView1AcctTerminateCause: TcxGridDBColumn;
    cxGrid2DBTableView1ServiceType: TcxGridDBColumn;
    cxGrid2DBTableView1FramedProtocol: TcxGridDBColumn;
    cxGrid2DBTableView1FramedIPAddress: TcxGridDBColumn;
    cxGrid2DBTableView1AcctStartDelay: TcxGridDBColumn;
    cxGrid2DBTableView1AcctStopDelay: TcxGridDBColumn;
    Q: TmySQLQuery;
    Button1: TButton;
    cxTabSheet3: TcxTabSheet;
    DataSource3: TDataSource;
    Panel1: TPanel;
    Memo1: TMemo;
    Button2: TButton;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  DB.Connected := True;
  qCheck.Open;
  qAcct.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Q.Active := False;
  Q.SQL.Text := Memo1.Lines.Text;
  Q.Active := True;
end;

end.
