{$I NEX.INC}

unit ncServBD;

interface

uses
  Windows, FileCtrl, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants, nxsdDataDictionary, madKernel,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport,
  nxsdServerEngine, nxsrSecurityMonitor, nxsrSqlEngineBase, nxsqlEngine,
  nxchCommandHandler, nxllComponent, nxsrServerEngine, nxdb,
  Db, nxsdSimpleMonitor,
  nxllMemoryManager,
  nxsqlProxies,
  nxllTypes, SyncObjs,
  nxsdTypes, nxlgEventLog, uObjPool,
  ExtCtrls, ncnxServerPlugin, nxllPluginBase, rtcDataSrv, rtcInfo, rtcConn,
  rtcHttpSrv, LMDCustomComponent, LMDStrList, ncDebCredSaver;
  

type
  TAndamentoConversao = procedure (Arquivo: String; Total, Atual : Integer) of Object;

  THackServerEng = class ( TnxServerEngine );

  TSessionArray = Array of TnxSessionID;

  TdmServidorBD = class(TDataModule)
    EventLog: TnxEventLog;
    ServerEngine: TnxServerEngine;
    CommandHandler: TnxServerCommandHandler;
    nxSQLEng: TnxSqlEngine;
    nxTCPIP: TnxWinsockTransport;
    nxSimpleMon: TnxSimpleMonitor;
    SecMon: TnxSecurityMonitor;
    FiltroTCPIP: TnxCustomConnectionFilter;
    sessao: TnxSession;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure nxSimpleMonRecordModify(aExtender: TnxSimpleMonitorExtender;
      aBefore: Boolean; aNewData, aOldData: PnxByteArray;
      aReleaseLock: Boolean);
    procedure nxSimpleMonRecordDelete(aExtender: TnxSimpleMonitorExtender;
      aBefore: Boolean; aOldData: PnxByteArray);
    procedure nxSimpleMonRecordInsert(aExtender: TnxSimpleMonitorExtender;
      aBefore: Boolean; aLockType: TnxLockType; aData: PnxByteArray);
    function nxTCPIPRemoveSession(aSender: TnxBaseTransport;
      aSessionID: TnxSessionID): Cardinal;
    procedure FiltroTCPIPAcceptConnection(
      aSender: TnxCustomConnectionFilter; aTransport: TnxWinsockTransport;
      const aLocalAddr, aRemoteAddr: string; var aAccept: Boolean);
  private
    { Private declarations }
    FOP : TObjectPool; 
    function CreateDMProc: TObject;
    procedure RecalcPrecoAuto(aDB: TnxServerDatabase; aMargem: Variant);
  public
    NexPlugin: TncnxServerPlugin;
    NexCmdHandler: TncnxCmdHandler;
    function ObtemDescrTran(aDB: TnxServerDatabase; aTran: Integer): String;
    procedure SalvaDebCred(aDB: TnxServerDatabase; aSaver: TncDebCredSaver);
    procedure AddRecDel(aDB: TnxServerDatabase; aTableID: Integer; aKey: String);
    function ObtemDadosComissao(aDB: TnxServerDatabase; aProduto: Variant; var aPerc: Double; var aLucro: Boolean): Boolean;
    function GetSessionIP(aSessionID: TnxSessionID): String;
    procedure TerminateSessions;
    procedure Shutdown(ShutdownServerEng: Boolean = True);
    procedure ListenClients;
    procedure GetAllSessions(var A: TSessionArray);
    { Public declarations }
  end;


  TncThreadServBD = class (TThread)
  protected
    procedure Execute; override;
  end;
  
  THackWinsock = class (TnxwinsockTransport);
  
  TThreadPopulateCategUnid = class ( TThread )
  private
    FDB : TnxDatabase;
    FSession : TnxSession;
    FQ : TnxQuery;
    FTable : TnxTable;
    procedure _Exec;
  protected
     procedure Execute; override;
  end;

  TRecVerItem = class
    rvTable: String;
    rvLast: Cardinal;
  end;

  TRecVerManager = class
  private
    FTables: TList;
    FCS : TCriticalSection;

    function Find(aTable: String): TRecVerItem;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    
    procedure StartRecVer(aTable: String; aLast: Cardinal);
    function GetRecVer(aTable: String; var aRecVer: Cardinal): Boolean;
    function ControlRecVer(aTable: String): Boolean;
  end;
  

  function CreateSession(aOwner: TComponent = nil): TnxSession;
  function CreateDB(var aSession: TnxSession; aOwner: TComponent = nil): TnxDatabase;
  procedure TableCancel(T: TnxTable);

  procedure TransfDados(F, D: TDataset);
  function GetTableAutoField(aTable: String): String;
  

  function InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean): Boolean;
  

  procedure IncPend;
  procedure DecPend;
  function GetPend: Cardinal;

  procedure IniciaServidorBD;
  procedure FinalizaServidorBD;

  
var
  dmServidorBD: TdmServidorBD = nil;
  PendingRequests : Cardinal = 0;
  csPend : TCriticalSection;
  gThreadBD : TncThreadServBD;
  dbStatus : Byte = 0;  
  dbTerm  : Boolean = False;
  dbError : String = '';
  gRecVerManager : TRecVerManager;

threadvar 
  SalvandoConfig : Boolean;

const
  dbst_inactive = 0;
  dbst_ok       = 1;
  dbst_error    = 2;

implementation

uses nxsrSystemStorage, JTimer, ncClassesBase, ncMsgCom, ncDMDBProc, ncNetMsg, ncDebug,
  uLicEXECryptor, ncServBase, ncIPAddr, ncPRConsts, uNexusDBUtils, ncTableDefs;

{$R *.DFM}

procedure IncPend;
begin
  csPend.Enter;
  try
    Inc(PendingRequests);
  finally
    csPend.Leave;
  end;
end;

procedure DecPend;
begin
  csPend.Enter;
  try
    Dec(PendingRequests);
  finally
    csPend.Leave;
  end;
end;

function GetPend: Cardinal;
begin
  csPend.Enter;
  try
    Result := PendingRequests;
  finally
    csPend.Leave;
  end;
end;

procedure TableCancel(T: TnxTable);
begin
  if T.State in [dsEdit, dsInsert] then
    T.Cancel;
end;

function GetTableAutoField(aTable: String): String;
begin
  if SameText(aTable, 'Cliente') then
    Result := 'Aniversario'
  else
  if SameText(aTable, 'Tran') then
    Result := 'TotLiq'
  else
  if SameText(aTable, 'ITran') then
    Result := 'TotLiq'
  else
  if SameText(aTable, 'Maquina') then
    Result := 'DisplayWH'
  else
  if SameText(aTable, 'Passaporte') then
    Result := 'Cartao'
  else  
    Result := '';  
end;


function InitTran(aDB: TnxDatabase;
                  const aTables : array of TnxTable;
                  aWith : Boolean): Boolean;
var I : Integer;
begin
  Result := False;
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
  Result := True;
end;

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

procedure TdmServidorBD.AddRecDel(aDB: TnxServerDatabase; aTableID: Integer; aKey: String);
var
  hcRecDel : TnxHelpCursor;
begin
  hcRecDel := TnxHelpCursor.CreateOpen('RecDel', aDB);
  try
    hcRecDel.Active := True;
    hcRecDel.SetValue('Tab', aTableID);
    hcRecDel.SetValue('Key', aKey);
    hcRecDel.InsertNewData;
  finally
    hcRecDel.Free;  
  end;
end;

function TdmServidorBD.CreateDMProc: TObject;
begin
  Result := TdmDBProc.Create(Self);
end;

procedure TdmServidorBD.DataModuleCreate(Sender: TObject);
var 
  S : String;
  SR : TSearchRec;
  IP : TLocalIPObj;
begin
{$ifdef LOJA}
  nxTCPIP.Port := 17200;
  HS.ServerPort := '17201';
{$endif}

  NexCmdHandler := TncnxCmdHandler.Create(Self);
  NexCmdHandler.EventLog := EventLog;
  NexCmdHandler.EventLogEnabled := True;

  NexPlugin := TncnxServerPlugin.Create(Self);
  NexPlugin.EventLog := EventLog;
  NexPlugin.EventLogEnabled := True;

  NexCmdHandler.CommandHandler := CommandHandler;
  NexCmdHandler.PluginEngine := NexPlugin;

  DebugMsg('TdmServidorBD.DataModuleCreate - 1');
  EventLog.Enabled := DebugAtivo;
  
  IP := TLocalIPObj.Create;
  try
    ServerEngine.ServerName := IP.HostName;
  finally
    IP.Free;
  end;
  nxTCPIP.ServerName := ServerEngine.ServerName;

  DebugMsg('TdmServidorBD.DataModuleCreate - 1');
  
  
  FOP := TObjectPool.Create;
  FOP.CreateNewPoolObj := CreateDMProc;
  dmServidorBD := Self;

  DebugMsg('TdmServidorBD.DataModuleCreate - 2');
  
  
  S := ExtractFilePath(ParamStr(0)) + 'Dados';
  if not DirectoryExists(S) then MkDir(S);

  if FileExists(S+'\Recibo.nx1') then
    DeleteFile(S+'\Recibo.nx1');

  DebugMsg('TdmServidorBD.DataModuleCreate - 3');
    

  nxSetSystemDatabaseFolder(ExtractFileDir(ParamStr(0)));

  DebugMsg('TdmServidorBD.DataModuleCreate - 4');
  

  ServerEngine.AliasHandler.Delete('NexCafe');
  ServerEngine.AliasHandler.Add('NexCafe', S, True);

  DebugMsg('TdmServidorBD.DataModuleCreate - 5');
  
  S := PRFolder('s');
  if not DirectoryExists(S) then
    ForceDirectories(S);
    
  DebugMsg('TdmServidorBD.DataModuleCreate - 6');
    

  S := PRFolder('p');
  if not DirectoryExists(S) then 
    ForceDirectories(S);

  DebugMsg('TdmServidorBD.DataModuleCreate - 7');
    

  S := ExtractFilePath(ParamStr(0)) + 'Temp';
  if not DirectoryExists(S) then 
    MkDir(S)
  else 
  if FindFirst(S+'\*.*', faAnyFile, SR)=0 then begin
    repeat
      if (SR.Attr and faDirectory) <> faDirectory then
        DeleteFile(S+'\'+ExtractFileName(SR.Name));
    until (FindNext(SR)<>0);
    FindClose(SR);
  end;  

  DebugMsg('TdmServidorBD.DataModuleCreate - 8');
  
  ServerEngine.TempStorePath := S;
  ServerEngine.TempStoreSize := 200;

  DebugMsg('TdmServidorBD.DataModuleCreate - 9');
  

  S := ExtractFilePath(ParamStr(0)) + 'Copia';
  if not DirectoryExists(S) then MkDir(S);

  DebugMsg('TdmServidorBD.DataModuleCreate - 10');
  
  S := ExtractFilePath(ParamStr(0)) + 'Email';
  if not DirectoryExists(S) then MkDir(S);
  
  DebugMsg('TdmServidorBD.DataModuleCreate - 11');

  ServerEngine.Active := True;
  SecMon.Active := True;
  try
    Sessao.Active := True;
  except
    Sessao.UserName := csAdministrator;
    Sessao.Password := csDefaultAdminPassword;
    Sessao.Active := True;
    if not Sessao.LoggedInAdministrator.UserExists(SessionUser) then
      Sessao.LoggedInAdministrator.AddUser(sessionuser, sessionpass, true, true, true) else
      Sessao.LoggedInAdministrator.SetUserPassword(sessionpass, SessionPass);
  end;
  DebugMsg('TdmServidorBD.DataModuleCreate - 12');
  
  Sessao.Active := False;

  DebugMsg('TdmServidorBD.DataModuleCreate - 13');
  
{  if SecMon.IsUser(SessionUser, SessionPass) then begin
    SecMon.ChangePassword(SessionUser, SessionPass);
    SecMon.ChangeTokens(SessionUser, [stAdmin, stRead, stWrite]);
  end else 
    SecMon.AddUser(SessionUser, SessionPass, [stAdmin, stRead, stWrite]); }
  CommandHandler.Active := True;
  DebugMsg('TdmServidorBD.DataModuleCreate - 14');
  NexPlugin.Transp := nxTCPIP;
  DebugMsg('TdmServidorBD.DataModuleCreate - 15');
  nxSqlEng.Active := True;
  DebugMsg('TdmServidorBD.DataModuleCreate - 16');
  nxSimpleMon.Active := True;
  DebugMsg('TdmServidorBD.DataModuleCreate - 17');
  nxTCPIP.Active := False;
  DebugMsg('TdmServidorBD.DataModuleCreate - 18');
  NexPlugin.Active := False;
  DebugMsg('TdmServidorBD.DataModuleCreate - 19');
  NexCmdHandler.Active := False;
  DebugMsg('TdmServidorBD.DataModuleCreate - 20');
end;

procedure ProcesshMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

function CreateSession(aOwner: TComponent = nil): TnxSession;
begin
  if dmServidorBD=nil then
    Result := nil
  else begin  
    Result := TnxSession.Create(aOwner);
    Result.ServerEngine := dmServidorBD.ServerEngine;
    Result.Timeout := 60000;
    Result.Username := SessionUser;
    Result.Password := SessionPass;
    Result.Active := True;
  end;  
end;

function CreateDB(var aSession: TnxSession; aOwner: TComponent = nil): TnxDatabase;
begin
  if dmServidorBD=nil then
    Result := nil
  else begin  
    if aSession=nil then 
      aSession := CreateSession(aOwner);
    Result := TnxDatabase.Create(aOwner);
    Result.Session := aSession;
    Result.AliasName := 'NexCafe';
    Result.Active := True;
  end;  
end;


procedure TdmServidorBD.DataModuleDestroy(Sender: TObject);
begin
  FOP.Free;
  dmServidorBD := nil;
end;

type
  THackTransp = class(TnxBasePooledTransport);

procedure TdmServidorBD.GetAllSessions(var A: TSessionArray);
var
  i       : Integer;
  H       : THackTransp;
begin
  if not nxTCPIP.Active then Exit;
  
  H := THackTransp(nxTCPIP);
  with H.btRemoteSessions, BeginRead do 
  try
    SetLength(A, Count);
    for i:= 0 to Pred(Count) do
      A[i] := TnxSessionID(Items[i]);
  finally
    EndRead;
  end;
end;

function TdmServidorBD.GetSessionIP(aSessionID: TnxSessionID): String;
var 
  HSE : THackServerEng;
  aSession : TnxAbstractSession;
begin
  Result := '';
  HSE := THackServerEng(ServerEngine);
  HSE.bseSessionsPadlock.Lock;
  try
    if HSE.SessionCount>0 then
      if HSE.bseSessionsHead.LookupByID(aSessionID, aSession)=0 then
        Result := aSession.ConnectedFrom;
  finally
    HSE.bseSessionsPadlock.Unlock;
  end;
end;

procedure TdmServidorBD.ListenClients;
begin
  DebugMsg('TdmSevidorBD.ListenClientes 1');
  NexCmdHandler.Active := True;
  DebugMsg('TdmSevidorBD.ListenClientes 2');
  NexPlugin.Active := True;
  DebugMsg('TdmSevidorBD.ListenClientes 3');
  nxTCPIP.Mode := nxtmListen;
{$ifdef LOJA}
  nxTCPIP.Port := 17200;
{$else}    
  nxTCPIP.Port := 16200;
{$endif}  
  nxTCPIP.ServerName := 'NexCafe';
  nxTCPIP.Active := True;
  DebugMsg('TdmSevidorBD.ListenClientes 4');
end;

procedure TdmServidorBD.FiltroTCPIPAcceptConnection(
  aSender: TnxCustomConnectionFilter; aTransport: TnxWinsockTransport;
  const aLocalAddr, aRemoteAddr: string; var aAccept: Boolean);
begin
  aAccept := ServidorAtivo;
end;

procedure TdmServidorBD.nxSimpleMonRecordDelete(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean;
  aOldData: PnxByteArray);

var
  aBuffer: Array[1..1024] of Byte;
  V: OleVariant;
  aTable: String;
  Key: String;
  
  St : TMemoryStream;
  
  
function LeFld(aFieldName: String): OleVariant;
begin
  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    Result := FieldByNameAsVariant[aOldData, aFieldName];
end;

begin
   if (not (aExtender.ExtendableObject is TnxServerBaseCursor)) then Exit;
   aTable := TnxServerBaseCursor(aExtender.ExtendableObject).FullName;

   if not aBefore then begin
     Key := '';
     if (not SameText(aTable, 'RecDel')) and gRecVerManager.ControlRecVer(aTable) then
       Key := GetTablePrimaryKey(aTable) else
       Key := '';
     if Key>'' then begin
       V := LeFld(Key);
       if VarIsNull(V) then V := '';
       AddRecDel(TnxServerDatabase(TnxServerBaseCursor(aExtender.ExtendableObject).Database), GetTableID(aTable), V);
     end; 
     
     Exit;
   end;
   
   if SameText(aTable, 'FiltroWeb') then begin
     V := LeFld('URL');
     if V<>null then 
       EnviaSiteBloq(CliNotifyHandle, False, V);
   end;
end;

procedure TdmServidorBD.nxSimpleMonRecordInsert(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean; aLockType: TnxLockType;
  aData: PnxByteArray);
begin
  nxSimpleMonRecordModify(aExtender, aBefore, aData, nil, False);
end;

procedure TdmServidorBD.nxSimpleMonRecordModify(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean; aNewData,
  aOldData: PnxByteArray; aReleaseLock: Boolean);
var
  vValue,
  vOldCliente,
  vNewCliente,
  vOldFator,
  vNewFator,
  vOldPontos, 
  vNewPontos,
  vCancelado, 
  vSessao, 
  vUsername, 
  vCliente,
  vID, 
  vTipo, 
  vTotal, 
  vDesconto, 
  vPago, 
  vDeb,
  vW, vH, 
  vMin, vMax, vAtual, vRepor, vAbaixoMin, vAbaixoMinDesde, vNaoControlaEstoque,
  vCaixa : OleVariant;

  vTroco: Currency;

  aRecVer: Cardinal;

  curSaldoAnt, curSaldoDepois: Boolean;

  aLen, aTipo, aW, aH: Integer;
  aTabTran: Boolean;
  aBuffer: Array[1..310] of Byte;
  S: String;
  St : TMemoryStream;
  aTable: String;
  dmProc : TdmDBProc;

  DCSaver : TncDebCredSaver;

  Ano, Mes, Dia : Word;

  aComissaoPerc : Double;
  aCusto: Currency;
  aComissaoLucro: Boolean;

function LeFld(aFieldName: String; aNew: Boolean=True): OleVariant;
var 
  aField: Integer;
  aData : PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;

  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    Result := FieldByNameAsVariant[aData, aFieldName];
end;

function LeByte(aFieldName: String; aNew: Boolean=True): Byte;
var 
  aField: Integer;
  aData : PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;

  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
  if (aData=nil) or IsRecordFieldNull(GetFieldFromName(aFieldName), aData) then
    Result := 0 else
    Result := Byte(GetRecordFieldForFilter(GetFieldFromName(aFieldName), aData)^);
end;

function LeCurrency(aFieldName: String; aNew: Boolean=True): Currency;
var 
  aField: Integer;
  aData : PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;

  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
  if (aData=nil) or IsRecordFieldNull(GetFieldFromName(aFieldName), aData) then
    Result := 0 else
    Result := Currency(GetRecordFieldForFilter(GetFieldFromName(aFieldName), aData)^);
end;

function LeDouble(aFieldName: String; aNew: Boolean=True): Double;
var 
  aField: Integer;
  aData : PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;

  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
  if (aData=nil) or IsRecordFieldNull(GetFieldFromName(aFieldName), aData) then
    Result := 0 else
    Result := Double(GetRecordFieldForFilter(GetFieldFromName(aFieldName), aData)^);
end;

function LeInteger(aFieldName: String; aNew: Boolean=True): Integer;
var 
  aField: Integer;
  aData : PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;

  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
  if (aData=nil) or IsRecordFieldNull(GetFieldFromName(aFieldName), aData) then
    Result := 0 else
    Result := Integer(GetRecordFieldForFilter(GetFieldFromName(aFieldName), aData)^);
end;

function LeBool(aFieldName: String; aNew: Boolean=True): Boolean;
var 
  aField: Integer;
  aData : PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;

  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
  if (aData=nil) or IsRecordFieldNull(GetFieldFromName(aFieldName), aData) then
    Result := False else
    Result := Boolean(GetRecordFieldForFilter(GetFieldFromName(aFieldName), aData)^);
end;

function CampoNull(aFieldName: String; aNew: Boolean=True): Boolean;
var 
  aField: Integer;
  aData : PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;

  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
  if (aData=nil) then
    Result := False else
    Result := IsRecordFieldNull(GetFieldFromName(aFieldName), aData);
end;

function DatePad(W: Word): String;
begin
  if W<10 then
    Result := '0'+IntToStr(W) else
    Result := IntToStr(W);
end;

procedure SaveFld(aFieldName: String; const Value: OleVariant; aNew: Boolean = True);
var 
  aData: PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;
    
  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    FieldByNameAsVariant[aData, aFieldName] := Value;
end;

function PodeTodosH(V: Variant): Boolean;
var P, H: Integer;
begin
  Result := False;
  if V=null then Exit;
  P := V;
  for H := 0 to 23 do if not BitIsSet(P, H) then Exit;
  Result := True;
end;

function TableNameToTPA: Integer;
begin
  Result := 255;
  if (not gConfig.FidAutoPremiar) or 
     (gConfig.FidPremioAuto=0) then Exit;
  
{  case gConfig.FidPremioAuto of
    tpaPacote :  
      if SameText('Pacote', aTable) then Result := tpaPacote;

    tpaPassaporte :  }
      if SameText('TipoPass', aTable) then Result := tpaPassaporte;
 // end;
end;

function CalcMov(A, B: Currency; aCancelado: Boolean): Currency;
begin
  if aCancelado then
    result := 0 else
    Result := A - B;
end;

procedure LoadDebCredData(aData: TncDebCredSaverData; aNew: Boolean);
begin
  aData.Cliente := LeInteger('Cliente', aNew);
  aData.Cancelado := LeBool('Cancelado', aNew);
  aData.Debito := LeCurrency('Debito', aNew);
  aData.DebitoPago := LeCurrency('DebitoPago', aNew);
  aData.Credito := LeCurrency('Credito', aNew);
  aData.CreditoUsado := LeCurrency('CreditoUsado', aNew);
end;

begin

  TnxServerBaseCursor(aExtender.ExtendableObject).Database.GetPath(S);
  if not SameText(S, ExtractFilePath(ParamStr(0))+'dados\') then Exit;

  
  aTable := TnxServerBaseCursor(aExtender.ExtendableObject).FullName;

  if aBefore and gRecVerManager.GetRecVer(aTable, aRecVer) then
    SaveFld('RecVer', aRecVer);

  if not aBefore then begin
    if not (TableNameToTPA in [{tpaPacote,} tpaPassaporte]) then Exit;
    vID := LeFld('ID');
    if (vID=null) or (vID<>gConfig.FidPremioAuto) then Exit;
    vID := LeFld('Fidelidade');
    if (vID=Null) or (vID=False) then
      gConfig.FidPontosPremioAuto := 0
    else begin
      vID := LeFld('FidPontos');
      if vID=null then vID := 0;
      gConfig.FidPontosPremioAuto := vID;
    end;  

    Exit;
  end;

  { typically, code here would check if its the
    correct table }
   if SameText(aTable, 'CHorario') then begin
     vW := LeFld('ID');
     if vW<>null then
       PostMessage(CliNotifyHandle, wm_alterouchorario, vW, 0);
     Exit;
   end else
   if SameText(aTable, 'Config') then begin
     vOldCliente := LeFld('Margem', False);
     vNewCliente := LeFld('Margem');
     if not VarSameValue(vOldCliente, vNewCliente) then
       Self.RecalcPrecoAuto(TnxServerDatabase(TnxServerBaseCursor(aExtender.ExtendableObject).Database), vNewCliente);
     Exit;  
   end else
   if SameText(aTable, 'Maquina') then begin
     vW := LeFld('DisplayW');
     vH := LeFld('DisplayH');
     if VarIsNull(vW) or VarIsNull(vH) or (vW=0) or (vH=0) then
       SaveFld('DisplayWH', '') 
     else begin
       aW := vW;
       aH := vH;
       SaveFld('DisplayWH', IntToStr(aW)+'x'+IntToStr(aH));
     end;
     Exit;
   end else
   if SameText(aTable, 'plusTran') then begin
{     vW := LeFld('OK', False);
     vH := LeFld('OK');
     if (vW=null) and (vH<>null) then
       PostMessage(CliNotifyHandle, wm_processaplus, 0, 0);}
     Exit;
   end else
   if SameText(aTable, 'Produto') then begin
     if SalvandoConfig then Exit;
     
     vID := LeFld('PrecoAuto');
     if (not VarIsNull(vID)) and (vID=True) then begin
       vID := LeFld('CustoUnitario');
       if VarIsNull(vID) then
         SaveFld('Preco', null) else 
         SaveFld('Preco', gConfig.CalcPreco(LeFld('Margem'), vID));
     end;
     
     vNaoControlaEstoque := LeFld('NaoControlaEstoque');
     if (vNaoControlaEstoque<>null) and (vNaoControlaEstoque=False) then begin
       vMin := LeFld('EstoqueMin');
       if (vMin=null) or (vMin<=0) then begin
         SaveFld('AbaixoMin', null);
         SaveFld('AbaixoMinDesde', null);
       end else begin
         vAtual := LeFld('EstoqueAtual');
         if (vAtual=null) or (vAtual<vMin) then begin
           vAbaixoMin := LeFld('AbaixoMin');
           if (vAbaixoMin=null) or (vAbaixoMin=False) then begin
             SaveFld('AbaixoMin', True);
             SaveFld('AbaixoMinDesde', Now);
           end;
           vMax := LeFld('EstoqueMax');
           if (vMax=null) or (vMax<vMin) then 
             SaveFld('EstoqueRepor', null) 
           else
           if vAtual=null then
             SaveFld('EstoqueRepor', vMax) else
             SaveFld('EstoqueRepor', vMax-vAtual);
         end else begin
           SaveFld('AbaixoMin', False);
           SaveFld('AbaixoMinDesde', null);
           SaveFld('EstoqueRepor', null);
         end;
       end;
     end else begin
       SaveFld('AbaixoMin', null);
       SaveFld('AbaixoMinDesde', null);
       SaveFld('EstoqueRepor', null);
     end;
   
     vMin := LeFld('EstoqueMin');
     vMax := LeFld('EstoqueMax');
     vAtual := LeFld('EstoqueAtual');
     
     Exit;
   end else
{   if SameText(aTable, 'Impressao') then begin
     vID := LeFld('Status');
     vTipo := LeFld('JobID');
     if (vID=null) or (vID=siRegistrou) or (vTipo=null) or (vTipo=0) then
       SaveFld('Pending', False) else
       SaveFld('Pending', True);
     Exit;  
   end else   }
   if SameText(aTable, 'FiltroWeb') and aBefore then begin
     vTipo := LeFld('URL');
     if vTipo<>null then  begin
       if SameText(Copy(vTipo, 1, 5), '#imp#') then
         SaveFld('URL', Copy(vTipo, 6, 500)) else
         EnviaSiteBloq(CliNotifyHandle, True, vTipo);
     end;
     Exit;
   end else
   if SameText(aTable, 'Passaporte') and aBefore then
   begin
     vDeb := LeFld('Senha');
     SaveFld('Cartao', (vDeb <> null) and (vDeb>''));
     Exit;
   end else
   if SameText(aTable, 'Cliente') and aBefore then begin
     vDeb := LeFld('Debito');

     if VarIsNull(LeFld('OpCHorario')) then 
       if PodeTodosH(LeFld('HP1')) and
          PodeTodosH(LeFld('HP2')) and
          PodeTodosH(LeFld('HP3')) and
          PodeTodosH(LeFld('HP4')) and
          PodeTodosH(LeFld('HP5')) and
          PodeTodosH(LeFld('HP6')) and
          PodeTodosH(LeFld('HP7')) 
       then
         SaveFld('OpCHorario', opchSemCensura) else
         SaveFld('OpCHorario', opchCensuraEsp);

     if gConfig.SalvarCodUsername then begin
       vUsername := LeFld('Username');
       vID := LeFld('ID');
       if (not VarIsNull(vID)) and (vID>0) and 
          (VarIsNull(vUsername) or (Trim(vUsername)='')) then 
       begin
         S := vID;
         SaveFld('Username', S);
       end;
     end;

     if VarIsNull(vDeb) then vDeb := 0;
     if vDeb<0.001 then
       SaveFld('TemDebito', False) else
       SaveFld('TemDebito', True);

     vW := LeFld('Minutos');
     vH := LeFld('Passaportes');
     vMin := LeFld('ValorCred');
     if ( (not VarIsNull(vW)) and  (vW>0.016)) or
        ( (not VarIsNull(vH)) and  (vH>0.016)) or
        ( (not VarIsNull(vMin)) and (vMin>=0.01)) 
     then
       SaveFld('TemCredito', True) else
       SaveFld('TemCredito', False);
     
     vDeb := LeFld('DataNasc');
     if vDeb<>null then begin
       DecodeDate(vDeb, Ano, Mes, Dia);
       SaveFld('Aniversario', DatePad(Mes)+DatePad(Dia));
     end else
       SaveFld('Aniversario', null);
      
     Exit;
   end else
   if SameText(aTable, 'MovEst') then 
   begin
     vValue := LeFld('plusID');
     SaveFld('plusTran', (not VarIsNull(vValue)) and (Trim(vValue)>''));

     if (LeByte('TipoTran')=trEstVenda) and (not LeBool('FidResgate')) then begin
       if (aOldData=nil) and VarIsNull(LeFld('ComissaoPerc')) and
          ObtemDadosComissao(TnxServerDatabase(TnxServerBaseCursor(aExtender.ExtendableObject).Database), 
                             LeFld('Produto'), 
                             aComissaoPerc, 
                             aComissaoLucro) then
       begin
         SaveFld('ComissaoPerc', aComissaoPerc);
         SaveFld('ComissaoLucro', aComissaoLucro);
       end;
  
       if (aOldData=nil) or (LeCurrency('Total') <> LeCurrency('Total', False)) or (LeCurrency('Desconto') <> LeCurrency('Desconto', False)) then 
       begin
         aComissaoPerc := LeDouble('ComissaoPerc') / 100;
         aComissaoLucro := LeBool('ComissaoLucro');
  
         if aComissaoLucro then begin
           aCusto := LeCurrency('CustoU');
           if aCusto > 0 then begin
             aCusto := LeDouble('Quant') * LeCurrency('CustoU');
             if aCusto > (LeCurrency('Total') - LeCurrency('Desconto')) then
               SaveFld('Comissao', 0) else
               SaveFld('Comissao', DuasCasas((LeCurrency('Total') - LeCurrency('Desconto') - aCusto) * aComissaoPerc));
           end;
         end else
           SaveFld('Comissao', DuasCasas((LeCurrency('Total') - LeCurrency('Desconto')) * aComissaoPerc));
       end;
     end;
     Exit;
   end else
   if SameText(aTable, 'Tran') then
     aTabTran := True 
   else
   if SameText(aTable, 'ITran') then
     aTabTran := False else
     Exit;

   vCancelado := LeFld('Cancelado');
   if aTabTran then
     vTipo := LeFld('Tipo') else
     vTipo := LeFld('TipoTran');
     
   vTotal := LeFld('Total');
   vDesconto := LeFld('Desconto');
   vPago := LeFld('Pago');
   vSessao := LeFld('Sessao');
   vCaixa := LeFld('Caixa');

   if LeBool('PagPend') then
     SaveFld('CaixaPag', 0)
   else
   if CampoNull('CaixaPag') then
     SaveFld('CaixaPag', vCaixa);

   if vTipo=null then
     aTipo := -1 else
     aTipo := vTipo;

   if aTabTran then begin

     if LeBool('Cancelado') then 
       SaveFld('PagPend', False);
     
     if (aTipo in [trEstVenda, trEstCompra, trEstEntrada, trEstSaida]) then
       SaveFld('Descr', ObtemDescrTran(TnxServerDatabase(TnxServerBaseCursor(aExtender.ExtendableObject).Database), LeFld('ID')));
     DCSaver := TncDebCredSaver.Create;
     try
       if (aOldData<>nil) then LoadDebCredData(DCSaver.Old, False);
       LoadDebCredData(DCSaver.New, True);
       SalvaDebCred(TnxServerDatabase(TnxServerBaseCursor(aExtender.ExtendableObject).Database), DCSaver);
     finally
       DCSaver.Free;
     end;
   end;

   vValue := LeFld('plusID');
   SaveFld('plusTran', (not VarIsNull(vValue)) and (Trim(vValue)>''));

   if VarIsNull(vCaixa) then vCaixa := 0;
   if VarIsNull(vCancelado) then begin
     vCancelado := False;
     SaveFld('Cancelado', False);
   end;
   if VarIsNull(vTipo) then vTipo := 0;
   if VarIsNull(vTotal) then vTotal := 0;
   if VarIsNull(vDesconto) then vDesconto := 0;
   if VarIsNull(vPago) then vPago := 0;
   if VarIsNull(vSessao) then vSessao := 0;
   if VarIsNull(vCaixa) then vCaixa := 0;

   aTipo := vTipo;

  if (vCancelado=True) or 
    (vCaixa=0) or LeBool('PagPend') or
    (aTipo in [trEstCompra, trEstEntrada, trEstSaida, trPagDebito, trCaixaEnt, trCaixaSai]) or
    ((vSessao>0) and (vTipo<>trFimSessao))
  then
    vDeb := 0 
  else begin
    vDeb := vTotal - vDesconto - vPago;
    if aTabTran then vDeb := vDeb - LeCurrency('CreditoUsado');
    if vDeb<0 then vDeb := 0;
  end;

  if aTabTran then
  if not (aTipo in [trEstCompra, trEstEntrada, trEstSaida, trPagDebito, trCaixaEnt, trCaixaSai]) then begin
    vTroco := (LeCurrency('Pago') + LeCurrency('CreditoUsado')) - (LeCurrency('Total') - LeCurrency('Desconto'));
    if (vTroco>0) and (LeCurrency('Credito')<0.00001) then
      SaveFld('Troco', vTroco) else
      SaveFld('Troco', 0);
  end;
  
  SaveFld('TotLiq', vTotal-vDesconto);
    
  SaveFld('Debito', vDeb);  
  if aTabTran and ((vCancelado=null) or (vCancelado=False)) then begin
    SaveFld('CanceladoPor', null);
    SaveFld('CanceladoEm', null);
  end;

  if aTabTran and (not LeBool('DescPorPerc')) and (LeCurrency('Desconto')>0) and (LeCurrency('Total')>0) then
    SaveFld('DescPerc', LeCurrency('Desconto') / LeCurrency('Total') * 100);

  if not aTabTran then begin
    vNewFator := LeFld('FidFator');
    vNewPontos := LeFld('FidPontos');

    if (vTipo=null) or (vNewPontos=null) or (vNewPontos=0) or (vNewFator=null) or ((vNewFator<>1) and (vNewFator<>-1)) then
      SaveFld('FidOpe', tofNenhum)
    else
    if vTipo=trAjustaFid then
      SaveFld('FidOpe', tofCorrecao)
    else
    if vNewFator=-1 then
      SaveFld('FidOpe', tofResgate) else
      SaveFld('FidOpe', tofAcumulo);

{    dmProc := TdmDBProc(FOP.GetObjFromPool); 
    try
      dmProc.AjustaPontos(vOldCliente, vNewCliente, vOldFator, vNewFator, vOldPontos, vNewPontos);
    finally
      FOP.ReleaseObj(dmProc);
    end;}
    
  end;
end;

function TdmServidorBD.nxTCPIPRemoveSession(aSender: TnxBaseTransport;
  aSessionID: TnxSessionID): Cardinal;
begin
  NexPlugin.spRemoveSession(aSessionID);
end;

function TdmServidorBD.ObtemDadosComissao(aDB: TnxServerDatabase;
  aProduto: Variant; var aPerc: Double; var aLucro: Boolean): Boolean;
var
  hcProd : TnxHelpCursor;  
begin
  Result := False;
  if aProduto=null then Exit;
  
  hcProd := TnxHelpCursor.CreateOpen('Produto', aDB);
  try
    hcProd.Active := True;
    hcProd.SelIndex('IID');
    hcProd.SetKey1('ID', aProduto);
    if hcProd.FindKey(1) then
    begin
      Result := True;
      if VarIsNull(hcProd.NewValue('ComissaoPerc', null)) then begin
        aPerc := gConfig.ComissaoPerc;
        aLucro := gConfig.ComissaoLucro;
      end else begin
        aPerc := hcProd.NewValue('ComissaoPerc', 0);
        aLucro := hcProd.NewValue('ComissaoLucro', False);
      end;
    end;
  finally
    hcProd.Free;
  end;
end;

function TdmServidorBD.ObtemDescrTran(aDB: TnxServerDatabase;
  aTran: Integer): String;
var
  hcMovEst : TnxHelpCursor;
  hcProd   : TnxHelpCursor;
  sProd : String;  

procedure getProdDescr;
begin
  hcProd.SetKey1('ID', hcMovEst.NewValue('Produto', 0));
  if hcProd.FindKey(1) then
    sProd := hcProd.NewValue('Descricao', '') else
    sProd := '[NAO ACHOU]';
end;
  
begin
  hcMovEst := TnxHelpCursor.CreateOpen('MovEst', aDB);
  hcProd   := TnxHelpCursor.CreateOpen('Produto', aDB);
  try
    hcProd.Active := True;
    hcProd.SelIndex('IID');
    hcMovEst.Active := True;
    Result := '';
    if not hcMovEst.SelIndex('ITranItem') then Exit;
    hcMovEst.SetKey1('Tran', aTran);
    hcMovEst.SetKey2('Tran', aTran);
    if not hcMovEst.SetRange(1, False) then Exit;
    
    while hcMovEst.GetNext do begin
      GetProdDescr;
      sProd := FloatToStr(hcMovEst.NewValue('Quant', 0))+ ' X ' + sProd;
      if Result>'' then
        Result := Result+', ';
      result := Result + sProd;
    end;
    Result := copy(Result, 1, 50);
  finally
    hcProd.Free;
    hcMovEst.Free;  
  end;
end;


procedure TdmServidorBD.RecalcPrecoAuto(aDB: TnxServerDatabase;
  aMargem: Variant);
var
  hcMovEst : TnxHelpCursor;
  hcProd   : TnxHelpCursor;
  sProd : String;  

  vPreco, nPreco : Variant;
  Custo : Currency;
  M : Double;
  

procedure getProdDescr;
begin
  hcProd.SetKey1('ID', hcMovEst.NewValue('Produto', 0));
  if hcProd.FindKey(1) then
    sProd := hcProd.NewValue('Descricao', '') else
    sProd := '[NAO ACHOU]';
end;
  
begin
  hcProd   := TnxHelpCursor.CreateOpen('Produto', aDB);
  try
    hcProd.Active := True;
    hcProd.SelIndex('IPrecoAutoMargem');
    hcProd.SetKey1('PrecoAuto', True);
    hcProd.SetKey1('Margem', null);
    hcProd.SetKey2('PrecoAuto', True);
    hcProd.SetKey2('Margem', null);
    if not hcProd.SetRange(2, False) then Exit;

    if aMargem=null then
      M := 0 else
      M := aMargem;
    
    SalvandoConfig := True;
    try
      while hcProd.GetNext do begin
        Custo := hcProd.NewValue('CustoUnitario', 0);
        vPreco := hcProd.NewValue('Preco', null);
        if (Custo<0.00001) or (M<0.00001) then
          nPreco := null else
          nPreco := gConfig.CalcPreco(aMargem, Custo);
  
        if not VarSameValue(vPreco, nPreco) then begin
          hcProd.SetValue('Preco', nPreco);
          hcProd.ModifyNewData;
        end;
      end;
    finally
      SalvandoConfig := False;
    end;
  finally
    hcProd.Free;
    hcMovEst.Free;  
  end;
end;

procedure TdmServidorBD.SalvaDebCred(aDB: TnxServerDatabase; aSaver: TncDebCredSaver);
var H : TnxHelpCursor;  

procedure Save(aCli: Integer; aDif: Currency);
begin
  if Abs(aDif)>0 then begin
    H.SetKey1('ID', aCli);
    if H.FindKey(1) then begin
       H.SetValue('ValorCred', H.NewValue('ValorCred', 0) + aDif);
       H.ModifyNewData;
    end;
  end; 
end;  

begin
  if (aSaver.DifCredito_Old=0) and (aSaver.DifCredito_New=0) then exit;

  H := TnxHelpCursor.CreateOpen('Cliente', aDB);
  try
    H.Active := True;
    H.SelIndex('IID');
    Save(aSaver.Old.Cliente, aSaver.DifCredito_Old);
    Save(aSaver.New.Cliente, aSaver.DifCredito_New);
  finally
    H.Free;
  end;
end;

procedure TdmServidorBD.Shutdown(ShutdownServerEng: Boolean = True);
var T: Cardinal;
begin
  DebugMsg('TdmServidorBD.Shutdown 1');
  NexPLugin.Free;
  NexCmdHandler.Free;
  nxSimpleMon.Free;
  DebugMsg('TdmServidorBD.Shutdown 2');
  if ShutdownServerEng then begin
    DebugMsg('TdmServidorBD.Shutdown 3');
    ServerEngine.Active := False;
    DebugMsg('TdmServidorBD.Shutdown 4');
    nxTCPIP.Free;
  end;
  DebugMsg('TdmServidorBD.Shutdown 5');
end;

procedure TdmServidorBD.TerminateSessions;
var 
  A : TSessionArray;
  I : Integer;
begin
  GetAllSessions(A);
  for I := 0 to High(A) do 
    nxTCPIP.TerminateConnection(0, A[i], 1000);
end;

{ TncThreadServBD }

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TncThreadServBD.Execute;
var Dummy : Integer;
begin
  try
    try
      dmServidorBD := TdmServidorBD.Create(nil);
      dbStatus := dbst_ok;
      while (not Terminated) do begin
        MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
        try
          ProcessMessages;
        except
          on E: Exception do 
            DebugMsg('TncThreadServBD - Exception: ' + E.Message);
        end;
      end;
    finally 
      FreeAndNil(dmServidorBD);
      dbStatus := dbst_inactive;
      dmServidorBD := nil;
    end;  
  except
    on e: exception do
      dbError := E.Message;
  end;
  gThreadBD := nil;
end;

procedure IniciaServidorBD;
var T: Cardinal;
begin
  if dbStatus<>dbst_ok then begin
    dbStatus := dbst_inactive;
    dbError := '';
    gThreadBD := TncThreadServBD.Create(False);
    T := GetTickCount + 5000;
    while (GetTickCount<T) and (dbStatus=dbst_inactive) do Sleep(1);
    if (dbStatus=dbst_error) then 
      raise exception.create(dbError);
  end;
end;

procedure FinalizaServidorBD;
var H, T : Cardinal;
begin
  if gThreadBD<>nil then begin
    H := gThreadBD.Handle;
    try
      T := GetTickCount + 1500;
      gThreadBD.Terminate;
      while (dbStatus=dbst_ok) and (GetTickCount<T) do Sleep(1);
      if dbStatus=dbst_ok then begin
        dbTerm := True;
        Thread(H).Terminate;
      end;
    finally
      gThreadBD := nil;
      dmServidorBD := nil;
      dbStatus := dbst_inactive;
    end;
  end;
end;

  
{ TThreadPopulateCategUnid }

procedure TThreadPopulateCategUnid.Execute;
begin
  FDB := nil;
  FSession := nil;
  FQ := nil;
  FTable := nil;
  try
    FDB := CreateDB(FSession);
    FQ := TnxQuery.Create(nil);
    FQ.Database := FDB;
    FTable := TnxTable.Create(nil);
    FTable.Database := FDB;
    _Exec;
  except
    if Assigned(FTable) then FTable.Free;
    if Assigned(FQ) then FQ.Free;
    if Assigned(FDB) then FDB.Free;
    if Assigned(FSession) then FSession.Free;
  end;

end;

procedure TThreadPopulateCategUnid._Exec;
begin
  FTable.TableName := 'categoria';
  FTable.IndexName := 'uq_categoria';
  FTable.Active := True;
  FQ.SQL.Text := 'select distinct(categoria) as descr from produto';
  FQ.Active := True;
  FQ.First;
  while not FQ.Eof do begin
    if not FTable.FindKey([FQ.FieldByName('descr').Value]) then
    begin
      FTable.Append;
      FTable.FieldByName('Descricao').Value := FQ.FieldByName('descr').Value;
      FTable.Post;
    end; 
    FQ.Next;
  end;

  FQ.Active := False;
  FTable.Active := False;
  FTable.TableName := 'unidade';
  FTable.IndexName := 'uq_unidade';
  FTable.Active := True;
  FQ.SQL.Text := 'select distinct(unid) as descr from produto';
  FQ.Active := True;
  FQ.First;
  while not FQ.Eof do begin
    if not FTable.FindKey([FQ.FieldByName('descr').Value]) then
    begin
      FTable.Append;
      FTable.FieldByName('Descricao').Value := FQ.FieldByName('descr').Value;
      FTable.Post;
    end; 
    FQ.Next;
  end;
end;

{ TRecVerManager }

procedure TRecVerManager.Clear;
begin
  FCS.Enter;
  try
    while FTables.Count>0 do begin
      TObject(FTables[0]).Free;
      FTables.Delete(0);
    end;
  finally
    FCS.Leave;
  end;
end;

function TRecVerManager.ControlRecVer(aTable: String): Boolean;
begin
  FCS.Enter;
  try
    Result := (Find(aTable)<>nil);
  finally
    FCS.Leave;
  end;
end;

constructor TRecVerManager.Create;
begin
  FCS := TCriticalSection.Create;
  FTables := TList.Create;
end;

destructor TRecVerManager.Destroy;
begin
  Clear;
  FCS.Free;
  inherited;
end;

function TRecVerManager.Find(aTable: String): TRecVerItem;
var I: Integer;
begin
  for I := 0 to FTables.Count - 1 do
    if SameText(aTable, TRecVerItem(FTables[i]).rvTable) then begin
      Result := TRecVerItem(FTables[i]);
      Exit;
    end;
  Result := nil;  
end;

function TRecVerManager.GetRecVer(aTable: String;
  var aRecVer: Cardinal): Boolean;
var I: TRecVerItem;  
begin
  FCS.Enter;
  try
    I := Find(aTable);
    if I<>nil then begin
      Inc(I.rvLast);
      aRecVer := I.rvLast;
      Result := True;
    end else
      Result := False;
  finally
    FCS.Leave;
  end;
end;

procedure TRecVerManager.StartRecVer(aTable: String; aLast: Cardinal);
var I: TRecVerItem;  
begin
  FCS.Enter;
  try
    I := Find(aTable);
    if I=nil then begin
      I := TRecVerItem.Create;
      FTables.Add(I);
    end;
    I.rvTable := aTable;
    I.rvLast := aLast;
  finally
    FCS.Leave;
  end;
end;

initialization
  gRecVerManager := TRecVerManager.Create;
  dmServidorBD := nil;
  csPend := TCriticalSection.Create;
  dmServidorBD := nil;
  dbStatus := dbst_Inactive;

finalization
  gRecVerManager.Free;
  csPend.Free;  

end.
