unit cmDMServ;

interface

uses
  SysUtils, Classes, Windows, nxllComponent, nxsdServerEngine, nxsrServerEngine,
  kbmMWCustomMessagingTransport, kbmMWCustomTransport, kbmMWServer,
  kbmMWTCPIPIndyMessagingTransport, nxllTransport, nxchCommandHandler,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllEventLog, kbmmwSecurity,
  nxsrSqlEngineBase, nxsqlEngine, nxdb, cmsStrings, cmsConst, cmConst,cmClassesBase,
  SyncObjs,
  IdTCPServer, kbmMemTable, DB, kbmMWTCPIPIndyTransport;

type

  TDadosConn = class
  private
    FProg      : Integer;
    FMaq       : Word;
    FThreadID  : Cardinal;
    FInicio    : Cardinal;
    FLog       : Cardinal;
    FOnDestroy : TNotifyEvent;
  public
    constructor Create;
    
    destructor Destroy; override;

    function DuracaoM: Double;

    property Prog: Integer
      read FProg write FProg;

    property Maq: Word
      read FMaq write FMaq;  

    property Log: Cardinal
      read FLog write FLog;

    property Inicio: Cardinal
      read FInicio;  

    property ThreadID: Cardinal
      read FThreadID;    

    property OnDestroy: TNotifyEvent
      read FOnDestroy write FOnDestroy; 
  end;     

  TDMServ = class(TDataModule)
    nxSE: TnxServerEngine;
    nxSQL: TnxSqlEngine;
    nxEvLov: TnxEventLog;
    nxTCPIP: TnxWinsockTransport;
    nxCmdH: TnxServerCommandHandler;
    mwServ: TkbmMWServer;
    msgQIn: TkbmMWMemoryMessageQueue;
    msgQOut: TkbmMWMemoryMessageQueue;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    tConexao: TnxTable;
    tConexaoNumSeq: TAutoIncField;
    tConexaoMaq: TWordField;
    tConexaoThreadID: TIntegerField;
    tConexaoUsername: TStringField;
    tConexaoDireitos: TMemoField;
    tConexaoIP: TStringField;
    tUsuario: TnxTable;
    tUsuarioID: TAutoIncField;
    tUsuarioUsername: TStringField;
    tUsuarioNome: TStringField;
    tUsuarioAdmin: TBooleanField;
    tUsuarioSenha: TStringField;
    tUsuarioDireitos: TMemoField;
    tLogProg: TnxTable;
    tLogProgNumSeq: TAutoIncField;
    tLogProgInicio: TDateTimeField;
    tLogProgTermino: TDateTimeField;
    tLogProgMaquina: TWordField;
    tLogProgUsuario: TStringField;
    tLogProgPrograma: TWordField;
    tLogProgTempo: TFloatField;
    tLogProgThreadID: TIntegerField;
    tMaq: TnxTable;
    tMaqNumero: TWordField;
    tMaqNomeRede: TStringField;
    tMaqUltimoIP: TStringField;
    tMaqInativa: TBooleanField;
    tMaqObs: TMemoField;
    tMaqSessao: TIntegerField;
    tMaqRecursos: TMemoField;
    tMaqGrupo: TStringField;
    tMaqThreadID: TIntegerField;
    tConexaoPrograma: TWordField;
    tConexaoInicio: TIntegerField;
    tLogProgNomeRede: TStringField;
    tLogProgIP: TStringField;
    mwTCPIP: TkbmMWTCPIPIndyServerTransport;
    mwTCPIPmsg: TkbmMWTCPIPIndyMessagingServerTransport;
    procedure mwServAuthenticate(Sender: TObject;
      ClientIdent: TkbmMWClientIdentity;
      var Perm: TkbmMWAccessPermissions);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FDadosConn : TDadosConn;
    { Private declarations }
    procedure OnDadosConDestroy(Sender: TObject);

    procedure DropConn(aThreadID: Cardinal);
    procedure AjustaConn(aThreadID: Cardinal; aDC: TDadosConn);
  public
    { Public declarations }
  end;

  function CriaSessaoNX: TnxSession;
  function CriaDB(aSessao: TnxSession): TnxDatabase;
  procedure InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean);

var
  DMServ: TDMServ;
  CSLog : TCriticalSection;

implementation

uses cmmwsGuard;

{$R *.dfm}

procedure InitTran(aDB: TnxDatabase;
                   const aTables : array of TnxTable;
                   aWith : Boolean);
var I : Integer;
begin
  if aDB.InTransaction then Exit;
  I := 10;
  while I > 0 do begin
    try
      if aWith then
        aDB.StartTransactionWith(aTables)
      else
        aDB.StartTransaction;
      I := 0;
    except
      Dec(I);
      Random(500);
    end
  end;
end;


function CriaSessaoNX: TnxSession;
begin
  Result := TnxSession.Create(nil);
  Result.ServerEngine := DMServ.nxSE;
  Result.Active := True;
end;

function CriaDB(aSessao: TnxSession): TnxDatabase;
begin
  if aSessao = nil then
    aSessao := CriaSessaoNX;
    
  Result := TnxDatabase.Create(nil);
  Result.Session := aSessao;
  Result.AliasPath := ExtractFilePath(ParamStr(0)) + 'Dados';
  Result.Active := True;  
end;

procedure TDMServ.mwServAuthenticate(Sender: TObject;
  ClientIdent: TkbmMWClientIdentity; var Perm: TkbmMWAccessPermissions);
var
  ThID : Cardinal;
  DC : TDadosConn;

procedure AddLog(Programa: Integer);
begin
  tLogProg.Insert;
  tLogProgInicio.Value := Now;
  tLogProgPrograma.Value := Programa;
  tLogProgMaquina.Value := DC.FMaq;
  tLogProgThreadID.Value := ThID;
  tLogProgNomeRede.Value := ClientIdent.ClientLocation;
  tLogProgIP.Value := ClientIdent.RemoteLocation;
  tLogProg.Post;
end;
  
begin
  ThID := GetCurrentThreadID;
  DC := nil;

  with ClientIdent do
  if Token = IntToStr(ThID) then 
    Perm := [mwapRead,mwapWrite,mwapDelete,mwapExecute]
  else begin
    CSLog.Enter;
    try
      InitTran(nxDB, [tUsuario, tMaq, tLogProg, tConexao], True);
      try
        if Username = cm_GuardUsername then begin
          if not tMaq.FindKey([Password]) then
            Raise Exception.Create(cm_MaquinaInexistente+' Nº'+Password);

          if tConexao.Locate('Maq', Password, []) then 
            DropConn(tConexaoThreadID.Value);

          DC := TDadosConn.Create;
          DC.Maq := tMaqNumero.Value;
          DC.Prog  := prGuard;

          AddLog(prGuard);
          DC.Log := tLogProgNumSeq.Value;
          
          tMaq.Edit;
          tMaqUltimoIP.Value := RemoteLocation;
          tMaqThreadID.Value := ThID;
          tMaqNomeRede.Value := ClientLocation;
          tMaq.Post;
          tConexao.Insert;
        end else begin
          if tUsuario.FindKey([Username]) then begin
            if not SameText(tUsuario.FieldByName('Senha').AsString, Password) then 
              Raise Exception.Create(cm_SenhaIncorreta);
          end else
            Raise Exception.Create(cm_UsuarioInexistente);
            
          DC := TDadosConn.Create;
          DC.Prog  := prAdmin;
          AddLog(prAdmin);
          DC.Log := tLogProgNumSeq.Value;
          tConexao.Insert;
          tConexaoUsername.Value := Username;
          tConexaoDireitos.Value := tUsuarioDireitos.Value;
        end;

        tConexaoPrograma.Value := DC.Prog;
        tConexaoThreadID.Value := ThID;
        tConexaoMaq.Value := DC.Maq;
        tConexaoInicio.Value := DC.Inicio;
        tConexaoIP.Value := RemoteLocation;
        tConexao.Post;

        nxDB.Commit;
        DC.OnDestroy := OnDadosConDestroy;
        AjustaConn(ThID, DC);
        Token := IntToStr(ThID);
        Perm := [mwapRead,mwapWrite,mwapDelete,mwapExecute]
      except
        if DC<>nil then DC.Free;
        if tConexao.State in [dsEdit, dsInsert] then
          tConexao.Cancel;
        nxDB.Rollback;
        Raise;
      end;
    finally
      CSLog.Leave;
    end;
  end;  
end;

{ TDadosConn }

constructor TDadosConn.Create;
begin
  FProg      := -1;
  FOnDestroy := nil; 
  FMaq       := 0;
  FInicio    := GetTickCount;
  FLog       := 0;
  FThreadID  := GetCurrentThreadID;
end;

destructor TDadosConn.Destroy;
begin
  if Assigned(FOnDestroy) then
    FOnDestroy(Self);
    
  inherited;
end;

procedure TDMServ.DataModuleCreate(Sender: TObject);
begin
  FDadosConn := TDadosConn.Create;
  FDadosConn.Prog := prServer;
  
  CSLog.Enter;
  try
    nxSE.Active := True;
    nxSession.Active := True;
    nxSession.DeleteAliasEx('Cybermgr');
    nxSession.AddAliasEx('Cybermgr', ExtractFilePath(ParamStr(0))+'Dados');
    nxDB.AliasName := 'Cybermgr';
    nxDB.Active := True;

    tConexao.Open;
    nxDB.CreateTable(True, '<conexao>', tConexao.Dictionary);
    tConexao.Close;
    tConexao.TableName := '<conexao>';
    tConexao.Open;

    tUsuario.Open;
    tMaq.Open;
    tLogProg.Open;

    tLogProg.Insert;
    tLogProgPrograma.Value := prServer;
    tLogProgInicio.Value := Now;
    tLogProg.Post;
    
    FDadosConn.Log := tLogProgNumSeq.Value;
    FDadosConn.OnDestroy := OnDadosConDestroy;
    mwServ.RegisterServiceByName('Guard', TmwsGuard, False);

    mwTCPIP.Listen;
    mwTCPIPmsg.Listen;
    mwServ.Active := True;
    
  finally
    CSLog.Leave;
  end;  
end;

procedure TDMServ.DataModuleDestroy(Sender: TObject);
begin
  mwTCPIP.Close;
  mwTCPIPmsg.Close;
  FDadosConn.Free;
end;

function TDadosConn.DuracaoM: Double;
begin
  Result := (GetTickCount - FInicio) / 1000 / 60;
end;

procedure TDMServ.DropConn(aThreadID: Cardinal);
var I : Integer;
begin
  with mwTCPIP.IdTCPServer.Threads, LockList do
  try
    for I := 0 to pred(Count) do with TIdPeerThread(Items[I]) do
      if ThreadID = aThreadID then begin
        if Data <> nil then Data.Free;
        Data := nil;
        Connection.Disconnect;
        Exit;
      end;  
  finally
    UnlockList;
  end;      
end;

procedure TDMServ.OnDadosConDestroy(Sender: TObject);
var NewTran: Boolean;
begin
  with TDadosConn(Sender) do begin
    CSLog.Enter;
    try
      if not nxDB.InTransaction then begin
        InitTran(nxDB, [tMaq, tLogProg, tConexao], True);
        NewTran := True;
      end else
        NewTran := False;
        
      try
        if tConexao.FindKey([ThreadID]) then
          tConexao.Delete;

        if tLogProg.FindKey([Log]) then begin
          tLogProg.Edit;
          tLogProgTermino.Value := Now;
          tLogProgTempo.Value := DuracaoM;
          tLogProg.Post;
        end;    
      
        if (Maq > 0) and tMaq.FindKey([Maq]) and (tMaqThreadID.Value = ThreadID) then begin
          tMaq.Edit;
          tMaqThreadID.Value := 0;
          tMaq.Post;
        end;
        
        if NewTran then
          nxDB.Commit;      
      except
        if NewTran then
          nxDB.Rollback;
        Raise;
      end;    
    finally
      CSLog.Leave;
    end;  
  end;
end;

procedure TDMServ.AjustaConn(aThreadID: Cardinal; aDC: TDadosConn);
var I : Integer;
begin
  with mwTCPIP.IdTCPServer.Threads, LockList do
  try
    for I := 0 to pred(Count) do with TIdPeerThread(Items[I]) do
    if ThreadID = aThreadID then begin
      Data := aDC;
      Exit;
    end;  
  finally
    UnlockList;
  end;    
end;

initialization
  CSLog := TCriticalSection.Create;

finalization
  CSLog.Free;
    
end.
