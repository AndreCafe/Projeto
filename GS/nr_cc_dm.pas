unit nr_cc_dm;

interface

uses
  SysUtils, Classes, nxdb, nxllComponent, DB, SyncObjs, ExtCtrls, Windows;

type
  Tdm_cc = class(TDataModule)
    nxSession: TnxSession;
    nxDBcc: TnxDatabase;
    tCC: TnxTable;
    tCCDH: TDateTimeField;
    tCCVersao: TStringField;
    tCCIP: TStringField;
    tCCLoja: TIntegerField;
    tCCMaq: TWordField;
    tCCAutID: TIntegerField;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    tAut: TnxTable;
    tAutID: TAutoIncField;
    tAutEnviouCli: TBooleanField;
    tCliCodigo: TAutoIncField;
    tCliUObtemLic: TDateTimeField;
    tCliUVersao: TStringField;
    tCliXVersao: TWordField;
    tCliLastCC: TLargeintField;
    tCliLastIP: TStringField;
    tCCUpdID: TLargeintField;
    tCliNumMaq: TWordField;
    Timer1: TTimer;
    tCCAdmin: TBooleanField;
    tCliLastAdminPopup: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure _Processa;
    function OpenDB: Boolean;
  public
    procedure Processa;
    { Public declarations }
  end;

var
  Terminar : Boolean = False;
  Recs : Integer;

implementation

uses nr_db_conn, nrDebug;

{$R *.dfm}

procedure Tdm_cc._Processa;
var 
  I: Integer;
  C, C2: Cardinal;

procedure _Save;
begin
  if not tCli.FindKey([tCCLoja.Value]) then Exit;

  tCli.Edit;
  if tCCAdmin.Value then begin
    if tCliLastAdminPopup.value < tCCDH.Value then 
      tCliLastAdminPopup.Value := tCCDH.Value;
  end else
  if tCliUObtemLic.Value < tCCDH.Value then 
    tCliUObtemLic.Value := tCCDH.Value;
  tCliLastCC.Value := tCCUpdID.Value;
  
  if tCCIP.Value > '' then
    tCliLastIP.Value := tCCIP.Value;

  if tCCVersao.Value > '' then 
    tCliUVersao.Value := tCCVersao.Value;

  if tCCMaq.Value>0 then
    tCliNumMaq.Value := tCCMaq.Value;
  tCli.Post;

  if (tCCAutID.Value>0) and tAut.FindKey([tCCAutID.Value]) then begin
    tAut.Edit;
    tAutEnviouCli.Value := True;
    tAut.Post;
  end;
  Inc(I);
end;

procedure _Commit(Force: Boolean);
begin
  if I>0 then 
  if Force or (I=50) or tCC.Eof or Terminar then begin
    C2 := GetTickCount;
    nxDB.Commit;
    DebugMsg('Tdm_cc.Processa - Commit time: ' + IntToStr(GetTickCount - C2) +  ' - ' + IntToStr(I) + ' records');
    Recs := Recs + I;
    I := 0;
    Sleep(50);
  end;
end;

begin
  I := 0;
  try
    tCli.IndexName := 'ILastCC';
    tCli.Last;
    tCC.FindNearest([tCliLastCC.Value+1]);
    if tCCUpdID.Value <= tCliLastCC.Value then tCC.Next;
    tCli.IndexName := 'ICodigo';
    C := GetTickCount + 20000;
    while (not tCC.Eof) and (not Terminar) and (GetTickCount<C) do begin
      if not nxDB.InTransaction then 
        nxDB.StartTransactionWith([tCli, tAut], False);
      _Save;
      _Commit(False);
      if not Terminar then tCC.Next;
    end;
    if (I>0) then _Commit(True);
  finally
    if nxDB.InTransaction then begin 
      nxDB.Rollback;
      if tCli.State in [dsInsert, dsEdit] then 
        tCli.Cancel;
    end;  
  end;
end;

procedure Tdm_cc.DataModuleCreate(Sender: TObject);
begin
  nxDBcc.AliasName := 'CC';
  nxDB.AliasName := 'Registro';
end;

function Tdm_cc.OpenDB: Boolean;
begin
  try
    Start_DBConn(nxSession);
    nxSession.Active := True;
    nxDB.Active := True;
    nxDBcc.Active := True;
    tCC.Active := True;
    tCli.Active := True;
    tAut.Active := True;
    Result := True;
  except
    on E: Exception do begin
      DebugMsg('Tdm_cc.OpenDB - Exception: '+E.Message);
      nxSession.Active := False;
      Result := False;
    end;
  end;
end;

procedure Tdm_cc.Processa;
begin
  if not OpenDB then Exit;
  try
    _Processa;
    nxSession.Active := False;
  except
    on E: Exception do begin
      DebugMsg('Tdm_cc.Processa - Exception: ' + E.Message);
      nxSession.Active := False;
    end;
  end;
end;

procedure Tdm_cc.Timer1Timer(Sender: TObject);
var C: Cardinal;
begin
  try
    Timer1.Enabled := False;
    Recs := 0;
    C := GetTickCount;
    try
      processa;
    finally
      if Recs > 0 then 
        DebugMsg('Tdm_cc.Timer1Timer: '+IntToStr(Recs) + ' registros processados em '+IntToStr(GetTickCount-C)+'ms');
    end;
  finally
    Timer1.Enabled := True;
  end;
end;

end.
