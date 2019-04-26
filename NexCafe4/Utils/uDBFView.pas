unit uDBFView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, Dbf, StdCtrls, ExtCtrls, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxllComponent,
  dxSkinsCore, dxSkinOffice2007Black, dxSkinSeven, dxSkinsDefaultPainters;

type
  TForm13 = class(TForm)
    tF: TDbf;
    DataSource1: TDataSource;
    TV: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    FileOpenDialog1: TFileOpenDialog;
    Button1: TButton;
    Button2: TButton;
    nxSe: TnxSession;
    nxDatabase1: TnxDatabase;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    tUnit: TnxTable;
    tUnitID: TAutoIncField;
    tUnitUserCode: TStringField;
    tUnitBase: TIntegerField;
    tUnitStatus: TWordField;
    tUnitStatusOn: TDateTimeField;
    tUnitStatusOnGMT: TSmallintField;
    tUnitNumber: TIntegerField;
    tUnitType: TIntegerField;
    tUnitDispatch: TIntegerField;
    tUnitQueueSize: TIntegerField;
    tUnitName: TStringField;
    tUnitMDT: TIntegerField;
    tUnitEnable: TBooleanField;
    tUnitActive: TBooleanField;
    tUnitNotes: TMemoField;
    tUnitBusy: TBooleanField;
    tUnitBusyOn: TDateTimeField;
    tUnitBusyOnGMT: TSmallintField;
    tUnitLastDispatch: TIntegerField;
    tUnitGPSlogID: TIntegerField;
    tUnitGPSlogOn: TDateTimeField;
    tUnitTeam1: TIntegerField;
    tUnitTeam2: TIntegerField;
    tUnitTeam3: TIntegerField;
    tUnitTeam4: TIntegerField;
    tUnitTeam5: TIntegerField;
    tUnitUALogID: TIntegerField;
    tUnitOnBase: TBooleanField;
    tUnitImage: TGraphicField;
    tUnitReturning: TBooleanField;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.Button2Click(Sender: TObject);
var SL : TStrings;
begin
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  tF.Open;
  TV.DataController.CreateAllItems;
end;

end.
