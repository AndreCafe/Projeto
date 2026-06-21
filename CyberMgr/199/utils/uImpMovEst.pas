unit uImpMovEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, nxdb, Db, nxllComponent, nxsdServerEngine,
  nxsrServerEngine, FileCtrl, ExtCtrls, nx1xAutoComponent,
  nxreRemoteServerEngine, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport;

type
  TFrmPri = class(TForm)
    PB: TProgressBar;
    lbConv: TLabel;
    lbArq: TLabel;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    Timer1: TTimer;
    Panel1: TPanel;
    nxWinsockTransport1: TnxWinsockTransport;
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    S: String;
    { Public declarations }
    procedure Importar;
    procedure CorrigeAutoInc;
  end;

var
  FrmPri: TFrmPri;

implementation

uses cmDMImpMovEst;

{$R *.DFM}

procedure TransfDados(F, D: TDataset);
var 
  I : Integer;
  AF : TField;
begin
  D.Append;
  for I := 0 to pred(F.FieldCount) do 
  with F.Fields[I] do
  if (FieldKind = fkData) then begin
    AF := D.FindField(FieldName);
    if AF <> nil then 
      AF.Value := Value;
  end;  
  D.Post;
end;

procedure TFrmPri.CorrigeAutoInc;
var 
  F : TField;
  I : Integer;
begin
{  try
    with nxTab do
    for I := 0 to FieldCount-1 do
    if Fields[I].DataType = ftAutoInc then begin
      try
        nxTab.IndexFieldNames := Fields[I].FieldName;
      except
      end;
      nxTab.Last;
      nxTab.SetAutoIncValue(Fields[I].AsInteger);
    end;
  except
  end;}
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
{  S :=  ExtractFileDir(ParamStr(0))+'\Dados';
  if not DirectoryExists(S) then
    MkDir(S);
  nxDB.AliasPath := S;
  nxDB.Connected := True; }
end;

procedure TFrmPri.Importar;
begin
 dmConv15.SetaDB(nxDB);
 dmConv15.ImportaMovEst;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Importar;
end;

end.
