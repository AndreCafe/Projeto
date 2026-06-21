unit nr_autoconn;

interface

uses
  SysUtils, Classes, nxdb, nxllComponent, DB, SyncObjs;

type
  Tdm_autoconn = class(TDataModule)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    tAC: TnxTable;
    tACID: TAutoIncField;
    tACComputerName: TStringField;
    tACIPPub: TStringField;
    tACIPLocal: TnxMemoField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FList : TList;
    procedure CheckDB;
    procedure SaveList;
  public
    procedure Processa;
    function ObtemAutoconn(aIPPub: String): String;
    
    { Public declarations }
  end;

  TAutoconnInfo = class
    aciIPPub: String;
    aciIPLocal: String;
    aciComputerName: String;

    constructor Create(aPub, aLocal, aComputerName: String);
    procedure Assign(aFrom: TAutoconnInfo);
  end;

  TThread_autoconn = class ( TThread )
  protected
    procedure Execute; override;
  end;

  procedure autoconn_add(aPub, aLocal, aComputerName: String);

var
  dm_autoconn: Tdm_autoconn;
  Terminar : Boolean = False;

  

implementation

uses nr_db_conn, nrDebug;

{$R *.dfm}

var
  ac_list : TList;
  ac_CS   : TCriticalSection;

procedure Tdm_autoconn.SaveList;
var 
  C : TAutoconnInfo;
  I : Integer;

procedure _Append;
begin
  C := TAutoconnInfo(FList[I]);
  if tAC.FindKey([C.aciIPPub]) then 
    tAC.Edit 
  else begin
    tAC.Insert;
    tACIPPub.Value := C.aciIPPub;
  end;
    
  tACIPLocal.Value := C.aciIPLocal;
  tACComputerName.Value := C.aciComputerName;
  tAC.Post;
  Inc(I);
end;

procedure _Commit;
begin
  if I>0 then 
  if (I=50) or (I=FList.Count) or Terminar then begin
    nxDB.Commit;
    while I>0 do begin
      Dec(I);
      TObject(FList[I]).Free;
      FList.Delete(I);
    end;
  end;
end;

begin
  I := 0;
  try
    while (I<FList.Count) and (not Terminar) do begin
      if not nxDB.InTransaction then 
        InitTran(nxDB, [], False);
      _Append;
      _Commit;
    end;
    if Terminar and (I>0) then _Commit;
    
  finally
    if nxDB.InTransaction then begin 
      nxDB.Rollback;
      if tAC.State in [dsInsert, dsEdit] then 
        tAC.Cancel;
    end;  
  end;
end;

procedure Tdm_autoconn.CheckDB;
begin
  nxSession.Active := True;
  nxDB.Active := True;
  tAC.Active := True;
  tAC.IndexName := 'IIPPub';
end;

procedure Tdm_autoconn.DataModuleCreate(Sender: TObject);
begin
  nxDB.AliasName := 'AC';
  FList := TList.Create;
end;

procedure autoconn_Add(aPub, aLocal, aComputerName: String);
begin
  ac_CS.Enter;
  try
    ac_List.Add(TAutoconnInfo.Create(aPub, aLocal, aComputerName));
  finally
    ac_CS.Leave;
  end;
end;

function autoconn_getList(L: TList): Boolean;
begin
  ac_CS.Enter;
  try
    Result := (ac_List.Count>0);
    while ac_List.Count > 0 do begin
      L.Add(ac_List[0]);
      ac_List.Delete(0);
    end;
  finally
    ac_CS.Leave;
  end;
end;

{ TAutoconnInfo }

procedure TAutoconnInfo.Assign(aFrom: TAutoconnInfo);
begin
  aciIPPub := aFrom.aciIPPub;
  aciComputerName := aFrom.aciComputerName;
  aciIPLocal := aFrom.aciIPLocal;
end;

constructor TAutoconnInfo.Create(aPub, aLocal, aComputerName: String);
begin
  aciIPPub := aPub;
  aciIPLocal := aLocal;
  aciComputerName := aComputerName;
end;

procedure Tdm_autoconn.DataModuleDestroy(Sender: TObject);
begin
  while FList.Count > 0 do begin
    TObject(FList[0]).Free;
    FList.Delete(0);
  end;
  FList.Free;
end;

function Tdm_autoconn.ObtemAutoconn(aIPPub: String): String;
begin
  CheckDB;
  tAC.Active := True;

  if tAC.FindKey([aIPPub]) then
    Result := tACComputerName.Value + sLineBreak + tACIPLocal.Value else
    Result := '0';
end;

procedure Tdm_autoconn.Processa;
begin
  autoconn_getList(FList);
  if FList.Count=0 then Exit; 
  CheckDB;
  try
    SaveList;
    Sleep(200);
  except
    on E: Exception do begin
      DebugMsg('Tdm_autoconn.Processa - Exception: ' + E.Message);
      nxSession.Active := False;
      Sleep(500);
    end;
  end;
end;

procedure TThread_autoconn.Execute;
var DM : Tdm_autoconn;
begin
  inherited;
  DM := Tdm_autoconn.Create(nil);
  try
    while not Terminar do begin
      try
        DM.Processa;
      except 
        on E: Exception do 
          DebugMsg('TThread_autoconn.Execute - Exception: ' + E.Message);
      end;
      Sleep(5);
    end;
  finally
    DM.Free;
  end;
end;

initialization
  ac_CS := TCriticalSection.Create;
  ac_List := TList.Create;

finalization
  ac_CS.Enter;
  try
    while ac_List.Count > 0 do begin
      TObject(ac_List[0]).Free;
      ac_List.Delete(0);
    end;
    ac_List.Free;  
  finally
    ac_CS.Leave;
  end;
  ac_CS.Free;

end.
