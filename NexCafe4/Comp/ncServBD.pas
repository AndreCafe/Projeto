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
  rtcHttpSrv;
  

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
    NexPlugin: TncnxServerPlugin;
    NexCmdHandler: TncnxCmdHandler;
    FiltroTCPIP: TnxCustomConnectionFilter;
    HS: TRtcHttpServer;
    dpAjustarConta: TRtcDataProvider;
    dpAtivar: TRtcDataProvider;
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
    procedure dpAjustarContaCheckRequest(Sender: TRtcConnection);
    procedure dpAjustarContaDataReceived(Sender: TRtcConnection);
    procedure dpAtivarCheckRequest(Sender: TRtcConnection);
    procedure dpAtivarDataReceived(Sender: TRtcConnection);
  private
    { Private declarations }
    FOP : TObjectPool; 

    function CreateDMProc: TObject;
  public
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

  function CreateSession: TnxSession;
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

const
  dbst_inactive = 0;
  dbst_ok       = 1;
  dbst_error    = 2;

implementation

uses JTimer, ncClassesBase, ncMsgCom, ncDMDBProc, ncNetMsg, ncDebug,
  uLicEXECryptor, ncsFrmPri;

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

function TdmServidorBD.CreateDMProc: TObject;
begin
  Result := TdmDBProc.Create(Self);
end;

procedure TdmServidorBD.DataModuleCreate(Sender: TObject);
var 
  S : String;
  SR : TSearchRec;
begin
  FOP := TObjectPool.Create;
  FOP.CreateNewPoolObj := CreateDMProc;
  dmServidorBD := Self;
  S := ExtractFilePath(ParamStr(0)) + 'Dados';
  if not DirectoryExists(S) then MkDir(S);
  S := ExtractFilePath(ParamStr(0)) + 'Dados';
  if not DirectoryExists(S) then MkDir(S);

  ServerEngine.AliasHandler.Delete('NexCafe');
  ServerEngine.AliasHandler.Add('NexCafe', S, True);
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
  ServerEngine.TempStorePath := S;
  ServerEngine.TempStoreSize := 200;

  S := ExtractFilePath(ParamStr(0)) + 'Copia';
  if not DirectoryExists(S) then MkDir(S);

  S := ExtractFilePath(ParamStr(0)) + 'Email';
  if not DirectoryExists(S) then MkDir(S);
  
  ServerEngine.Active := True;
  SecMon.Active := True;
  if SecMon.IsUser(SessionUser) then begin
    SecMon.ChangePassword(SessionUser, SessionPass);
    SecMon.ChangeTokens(SessionUser, [stAdmin, stRead, stWrite]);
  end else 
    SecMon.AddUser(SessionUser, SessionPass, [stAdmin, stRead, stWrite]);
  CommandHandler.Active := True;
  NexPlugin.Transp := nxTCPIP;
  nxSqlEng.Active := True;
  nxSimpleMon.Active := True;
  nxTCPIP.Active := False;
  NexPlugin.Active := False;
  NexCmdHandler.Active := False;
  try HS.Listen except; end;
end;

procedure ProcesshMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

function CreateSession: TnxSession;
begin
  if dmServidorBD=nil then
    Result := nil
  else begin  
    Result := TnxSession.Create(nil);
    Result.ServerEngine := dmServidorBD.ServerEngine;
    Result.Timeout := 10000;
    Result.Username := SessionUser;
    Result.Password := SessionPass;
    Result.Active := True;
  end;  
end;

procedure TdmServidorBD.DataModuleDestroy(Sender: TObject);
begin
  FOP.Free;
  dmServidorBD := nil;
end;

procedure TdmServidorBD.dpAjustarContaCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do 
    Request.Accepted := SameText(Request.Filename, '/ajustarconta');
end;

procedure TdmServidorBD.dpAjustarContaDataReceived(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do begin
    if Request.Complete then 
    if SameText(Request.Method, 'get') then begin
      RegistroGlobal.AjustaContaSalva(Request.Query.asString['conta'], Request.Query.asString['chaves']);
      Write('<html></html>');
      PostMessage(hndFrmPri, wm_user+1, 0, 0);
    end;
  end;
end;

procedure TdmServidorBD.dpAtivarCheckRequest(Sender: TRtcConnection);
begin
  with TRTCDataServer(Sender) do 
    Request.Accepted := SameText(Request.Filename, '/ativar');
end;

procedure TdmServidorBD.dpAtivarDataReceived(Sender: TRtcConnection);
var
  aCE, aSN: String;
begin
  RegistroGlobal.CodEquipSerial(aCE, aSN);
  with TRTCDataServer(Sender) do begin
    if Request.Complete then 
    if SameText(Request.Method, 'get') then begin
      with Request.Query do 
        Write(
'<html><body><script language="javascript">window.location.href = '+QuotedStr(
'http://contas.nextar.com.br/ativar?'+
'conta='+asString['conta']+
'&codativacao='+asString['codativacao']+
'&codequip='+aCE)+';'+sLineBreak+
'</script></body></html>');
    end;
  end;
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
  NexCmdHandler.Active := True;
  NexPlugin.Active := True;
  nxTCPIP.Active := True;
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
  S: String;
  St : TMemoryStream;
  
  
function LeFld(aFieldName: String): OleVariant;
begin
  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    Result := FieldByNameAsVariant[@aBuffer, aFieldName];
end;

begin
   if not aBefore then Exit;
   if (not (aExtender.ExtendableObject is TnxServerBaseCursor)) then Exit;
   
   
   if not Sametext(TnxServerBaseCursor(aExtender.ExtendableObject).FullName, 'FiltroWeb') then Exit;


   V := LeFld('URL');
   if V<>null then 
     EnviaSiteBloq(CliNotifyHandle, False, V);
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
  
  aLen, aTipo, aW, aH: Integer;
  aTabTran: Boolean;
  aBuffer: Array[1..310] of Byte;
  S: String;
  St : TMemoryStream;
  aTable: String;
  dmProc : TdmDBProc;

  Ano, Mes, Dia : Word;
  

function LeFld(aFieldName: String; aNew: Boolean=True): OleVariant;
var 
  aField: Integer;
  aNull: Boolean;
  aData : PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;

  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    Result := FieldByNameAsVariant[aData, aFieldName];
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

begin
  aTable := TnxServerBaseCursor(aExtender.ExtendableObject).FullName;

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
   if SameText(aTable, 'Produto') then begin
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

     vDeb := LeFld('DataNasc');
     if vDeb<>null then begin
       DecodeDate(vDeb, Ano, Mes, Dia);
       SaveFld('Aniversario', DatePad(Mes)+DatePad(Dia));
     end else
       SaveFld('Aniversario', null);
      
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
    (vCaixa=0) or 
    (aTipo in [trEstCompra, trEstEntrada, trEstSaida, trPagDebito, trCaixaEnt, trCaixaSai]) or
    ((vSessao>0) and (vTipo<>trFimSessao))
  then
    vDeb := 0 else
    vDeb := vTotal - vDesconto - vPago;

  SaveFld('TotLiq', vTotal-vDesconto);
    
  SaveFld('Debito', vDeb);  
  if aTabTran and ((vCancelado=null) or (vCancelado=False)) then begin
    SaveFld('CanceladoPor', null);
    SaveFld('CanceladoEm', null);
  end;

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

  
initialization
  csPend := TCriticalSection.Create;
  dmServidorBD := nil;
  dbStatus := dbst_Inactive;

finalization
  csPend.Free;  

end.
