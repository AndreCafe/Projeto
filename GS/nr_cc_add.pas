unit nr_cc_add;

interface

uses
  SysUtils, Classes, nxdb, nxllComponent, DB, SyncObjs;

type
  Tdm_cc_add = class(TDataModule)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    tCC: TnxTable;
    tCCDH: TDateTimeField;
    tCCVersao: TStringField;
    tCCIP: TStringField;
    tCCLoja: TIntegerField;
    tCCMaq: TWordField;
    tCCAutID: TIntegerField;
    tCCAdmin: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FList : TList;
    procedure SaveList;
  public
    procedure Processa;
    { Public declarations }
  end;

  TccInfo = class
    cciDH : TDateTime;
    cciVersao : String;
    cciIP: String;
    cciLoja,
    cciMaq,
    cciAutID : Integer;
    cciAdmin : Boolean;

    constructor Create(aVersao, aIP: String; aLoja, aMaq, aAutID: Integer; aAdmin: Boolean);
    procedure Assign(aFrom: TccInfo);
  end;

  TThread_cc_Add = class ( TThread )
  protected
    procedure Execute; override;
  end;

  procedure ccInfo_add(aVersao, aIP: String; aLoja, aMaq, aAutID: Integer; aAdmin: Boolean);

var
  dm_cc_add: Tdm_cc_add;
  Terminar : Boolean = False;

  

implementation

uses nr_db_conn, nrDebug;

{$R *.dfm}

var
  ccInfo_list : TList;
  ccInfo_CS   : TCriticalSection;

procedure Tdm_cc_add.SaveList;
var 
  C : TccInfo;
  I : Integer;

procedure _Append;
begin
  C := TccInfo(FList[I]);
  if tCC.FindKey([C.cciLoja]) then 
    tCC.Edit 
  else begin
    tCC.Insert;
    tCCLoja.Value := C.cciLoja;
  end;
    
  tCCDH.Value := C.cciDH;
  tCCIP.Value := C.cciIP;
  tCCVersao.Value := C.cciVersao;
  tCCMaq.Value := C.cciMaq;
  tCCAutID.Value := C.cciAutID;
  tCCAdmin.Value := C.cciAdmin;
  tCC.Post;
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
      if tCC.State in [dsInsert, dsEdit] then 
        tCC.Cancel;
    end;  
  end;
end;

procedure Tdm_cc_add.DataModuleCreate(Sender: TObject);
begin
  nxDB.AliasName := 'CC';
  FList := TList.Create;
end;

procedure ccInfo_add(aVersao, aIP: String; aLoja, aMaq, aAutID: Integer; aAdmin: Boolean);
begin
  ccInfo_CS.Enter;
  try
    ccInfo_list.Add(TccInfo.Create(aVersao, aIP, aLoja, aMaq, aAutID, aAdmin));
  finally
    ccInfo_CS.Leave;
  end;
end;

function ccInfo_getList(L: TList): Boolean;
begin
  ccInfo_CS.Enter;
  try
    Result := (ccInfo_list.Count>0);
    while ccInfo_list.Count > 0 do begin
      L.Add(ccInfo_List[0]);
      ccInfo_List.Delete(0);
    end;
  finally
    ccInfo_CS.Leave;
  end;
end;

{ TccInfo }

procedure TccInfo.Assign(aFrom: TccInfo);
begin
  cciDH := aFrom.cciDH;
  cciVersao := aFrom.cciVersao;
  cciIP := aFrom.cciIP;
  cciLoja := aFrom.cciLoja;
  cciMaq := aFrom.cciMaq;
  cciAutID := aFrom.cciAutID;
  cciAdmin := aFrom.cciAdmin;
end;

constructor TccInfo.Create(aVersao, aIP: String; aLoja,
  aMaq, aAutID: Integer; aAdmin: Boolean);
begin
  cciDH := Now;
  cciVersao := aVersao;
  cciIP := aIP;
  cciLoja := aLoja;
  cciMaq := aMaq;
  cciAutID := aAutID;
  cciAdmin := True;
end;

procedure Tdm_cc_add.DataModuleDestroy(Sender: TObject);
begin
  while FList.Count > 0 do begin
    TObject(FList[0]).Free;
    FList.Delete(0);
  end;
  FList.Free;
end;

procedure Tdm_cc_add.Processa;
begin
  ccInfo_GetList(FList);
  if FList.Count=0 then Exit; 
  nxSession.Active := True;
  nxDB.Active := True;
  tCC.Active := True;
  tCC.IndexName := 'ILoja';
  try
    SaveList;
    Sleep(200);
  except
    on E: Exception do begin
      DebugMsg('Tdm_cc_add.Processa - Exception: ' + E.Message);
      nxSession.Active := False;
      Sleep(500);
    end;
  end;
end;

{ TThread_cc_Add }

procedure TThread_cc_Add.Execute;
var DM : Tdm_cc_add;
begin
  inherited;
  DM := Tdm_cc_Add.Create(nil);
  try
    while not Terminar do begin
      try
        DM.Processa;
      except 
        on E: Exception do 
          DebugMsg('TThread_cc_add.Execute - Exception: ' + E.Message);
      end;
      Sleep(5);
    end;
  finally
    DM.Free;
  end;
end;

initialization
  ccInfo_CS := TCriticalSection.Create;
  ccInfo_List := TList.Create;

finalization
  ccInfo_CS.Enter;
  try
    while ccInfo_List.Count > 0 do begin
      TObject(ccInfo_List[0]).Free;
      ccInfo_List.Delete(0);
    end;
    ccInfo_List.Free;  
  finally
    ccInfo_CS.Leave;
  end;
  ccInfo_CS.Free;

end.
