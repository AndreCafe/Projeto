unit SimpleMonitorMain;

interface

uses
  {$IFDEF NXWINAPI}nxWinAPI{$ELSE}Windows{$ENDIF},
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  nxdb,
  nxsdServerEngine,
  nxreRemoteServerEngine,
  nxllComponent,
  nxllTransport,
  nxptBasePooledTransport,
  nxtwWinsockTransport,
  StdCtrls,
  nxsrServerEngine,
  nxseAllEngines,
  Grids,
  DBGrids,
  nxsdSimpleMonitor,
  nxllTypes,
  nxsdTypes;

type
  TForm1 = class(TForm)
    nxSession1: TnxSession;
    nxDatabase1: TnxDatabase;
    nxTable1: TnxTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    nxServerEngine1: TnxServerEngine;
    nxSimpleMonitor1: TnxSimpleMonitor;
    Label1: TLabel;
    procedure nxSimpleMonitor1RecordModify(
      aExtender: TnxSimpleMonitorExtender; aBefore: Boolean; aNewData,
      aOldData: PnxByteArray; aReleaseLock: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure nxSimpleMonitor1RecordInsert(
      aExtender: TnxSimpleMonitorExtender; aBefore: Boolean;
      aLockType: TnxLockType; aData: PnxByteArray);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.nxSimpleMonitor1RecordModify(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean; aNewData,
  aOldData: PnxByteArray; aReleaseLock: Boolean);
var
  TempDate : TnxDateTime;
begin
  { typically, code here would check if its the
    correct table }
//  with TnxServerCursor(aExtender.ExtendableObject) do
//    if Table.Name = 'sometable' then...

  { the recordbuffer fields are in internal format, not TDateTime }
  TempDate := (Now + DateDelta) * (MSecsPerDay * 1.0);

  with TnxServerBaseCursor(aExtender.ExtendableObject), TableDescriptor, FieldsDescriptor do begin
    Caption := FullName;
    SetRecordField(GetFieldFromName('Date'), aNewData,  @TempDate);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  nxSimpleMonitor1.Active := True;
  nxTable1.Active := True;
end;

procedure TForm1.nxSimpleMonitor1RecordInsert(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean;
  aLockType: TnxLockType; aData: PnxByteArray);
var
  TempDate : TnxDateTime;
begin
  { typically, code here would check if its the
    correct table }
//  with TnxServerCursor(aExtender.ExtendableObject) do
//    if Table.Name = 'sometable' then...

  { the recordbuffer fields are in internal format, not TDateTime }
  TempDate := (Now + DateDelta) * (MSecsPerDay * 1.0);

  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do begin
    SetRecordField(GetFieldFromName('Date'), aData,  @TempDate);
  end;
end;

end.
