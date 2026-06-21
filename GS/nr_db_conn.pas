unit nr_db_conn;

interface

uses
  SysUtils, Classes, Windows, nxllTransport, nxptBasePooledTransport, SyncObjs,
  nxtwWinsockTransport, 
  nxpvPlatformImplementation,
  nxllComponent, nxsdServerEngine, nxreRemoteServerEngine,
  nxdb, nxtmSharedMemoryTransport;

type
  Tdm_conn = class(TDataModule)
    nxRSE: TnxRemoteServerEngine;
    nxShMem: TnxSharedMemoryTransport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure Start_DBConn(aSession: TnxSession; aForceRestart: Boolean = False);
  

  procedure InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean);
  

var
  dm_conn: Tdm_conn = nil;
  csConn : TCriticalSection = nil;

implementation

uses nrDebug;

procedure InitTran(aDB: TnxDatabase;
                   const aTables : array of TnxTable;
                   aWith : Boolean);
var I : Integer;
begin
  if aDB.InTransaction then Exit;
  I := 10;
  while I > 0 do begin
    try
{      if aWith then
        aDB.StartTransactionWith(aTables) else    }
        aDB.StartTransaction;
      I := 0;
    except
      Dec(I);
      Sleep(Random(50));
    end
  end;
end;

{
procedure InitTran(aDB: TnxDatabase;
                   const aTables : array of TnxTable;
                   aWith : Boolean);
var 
  T, I : Cardinal;
begin
  if aDB.InTransaction then Exit;
  T := GetTickCount;
  I := 5;
  while ((GetTickCount-T) < 6000) and (I>0) do begin
    try
      if aWith then
        aDB.StartTransactionWith(aTables)
      else
        aDB.StartTransaction;
      Break;
    except
      if (I<1) and ((GetTickCount-T)>5000) then
        Raise 
      else begin
        Sleep(100+Random(200));
        Dec(I);
      end;
    end
  end;
end;
}

procedure Start_DBConn(aSession: TnxSession; aForceRestart: Boolean = False);
begin
  csConn.Enter;
  try
    
    DebugMsg('Start_DBConn');
    try
      if dm_conn = nil then 
        dm_conn := Tdm_conn.Create(nil)
      else 
      if aForceRestart then begin
        if Assigned(aSession) then
          aSession.Active := False;
          
        dm_conn.nxRSE.Active := False;                                                           
        dm_conn.nxShMem.Active := False;
      end;
    
      if Assigned(aSession) then begin
        dm_conn.nxShMem.Active := True;

        aSession.ServerEngine := dm_conn.nxRSE;
        aSession.Open;
      end;
    except
      on E: Exception do begin
        if aSession=nil then DebugMsgEsp('Start_DBConn - aSession = NIL', False, True);
        DebugMsgEsp('Start_DBConn - E.Message: '+E.Message, False, True);
      end;
    end;
  finally
    csConn.Leave;
  end;
end;


{$R *.dfm}

initialization
  dm_conn := nil;
  csConn := TCriticalSection.Create;

finalization
  csConn.Free;
  csConn := nil;  

end.
