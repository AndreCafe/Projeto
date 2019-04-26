unit ncServBD;

interface

uses
  Windows, FileCtrl, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants,
  nx1xAllEngines,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport,
  nxsdServerEngine, nxsrSecurityMonitor, nxsrSqlEngineBase, nxsqlEngine,
  nxchCommandHandler, nxllComponent, nxsrServerEngine, nxdb,
  Db, nxsdSimpleMonitor,
  nxllMemoryManager,
  nxsqlProxies,
  nxllTypes,
  nxsdTypes, nxllEventLog, uObjPool,
  ExtCtrls, ncnxServerPlugin, nxllPluginBase;
  

type
  TAndamentoConversao = procedure (Arquivo: String; Total, Atual : Integer) of Object;

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
      aSessionID: TnxSessionID): TnxResult;
  private
    { Private declarations }
    FOP : TObjectPool; 

    function CreateDMProc: TObject;
  public
    procedure Shutdown;
    { Public declarations }
  end;

  function CreateSession: TnxSession;
  procedure TableCancel(T: TnxTable);

  procedure TransfDados(F, D: TDataset);

  function InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean): Boolean;
  


var
  dmServidorBD: TdmServidorBD = nil;
  CliNotifyHandle : HWND;

implementation

uses JTimer, ncClassesBase, ncMsgCom, ncDMDBProc, ncNetMsg;

{$R *.DFM}

procedure TableCancel(T: TnxTable);
begin
  if T.State in [dsEdit, dsInsert] then
    T.Cancel;
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
  ServerEngine.AliasHandler.Add('NexCafe', S);
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
  nxTCPIP.Active := False;
  nxSimpleMon.Active := True;
  NexPlugin.Active := True;
  NexCmdHandler.Active := True;
end;

procedure ProcessMessages;
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

procedure TdmServidorBD.nxSimpleMonRecordDelete(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean;
  aOldData: PnxByteArray);

var
  aBuffer: Array[1..310] of Byte;
  V: Variant;
  S: String;
  St : TMemoryStream;
  
  
function LeFld(aFieldName: String; aFieldType: TnxFieldType): Variant;
var 
  aField: Integer;
  aNull: Boolean;
begin
  with TnxServerCursor(aExtender.ExtendableObject), Dictionary do begin
    aField := GetFieldFromName(aFieldName);
    GetRecordField(aField, @aBuffer, aNull, @aBuffer);
    if aNull then
      Result := null else
      VariantFromNative(aFieldType, @aBuffer, Result);
  end;  
end;

begin
   if not aBefore then Exit;
   if (not (aExtender.ExtendableObject is TnxServerCursor)) then Exit;
   
   
   with TnxServerCursor(aExtender.ExtendableObject), Dictionary do 
   if not SameText(Table.Name, 'FiltroWeb') then Exit;

   V := LeFld('URL', nxtNullString);
   if V<>null then begin
     St := tMemoryStream.Create;
     S := 'N'+V;
     St.WriteBuffer(S[1], Length(S));
     EnviaMsg(CliNotifyHandle, ncmc_SiteBloqueado, 0, Integer(St));
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
  vCaixa : Variant;
  
  aLen, aTipo, aW, aH: Integer;
  aTabTran: Boolean;
  aBuffer: Array[1..310] of Byte;
  S: String;
  St : TMemoryStream;
  aTable: String;
  dmProc : TdmDBProc;
  

function LeFld(aFieldName: String; aFieldType: TnxFieldType; aNew: Boolean=True): Variant;
var 
  aField: Integer;
  aNull: Boolean;
  aData : PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;
    
  with TnxServerCursor(aExtender.ExtendableObject), Dictionary do begin
    aField := GetFieldFromName(aFieldName);
    GetRecordField(aField, aData, aNull, @aBuffer);
    if aNull then
      Result := null else
      VariantFromNative(aFieldType, @aBuffer, Result);
  end;  
end;

procedure SaveFld(aFieldName: String; const Value: Variant; const FldType: TnxFieldType; aNew: Boolean = True);
var 
  aField: Integer;
  aData: PnxByteArray;
begin
  if aNew then
    aData := aNewData else
    aData := aOldData;
    
  with TnxServerCursor(aExtender.ExtendableObject), Dictionary do begin
    aField := GetFieldFromName(aFieldName);
    if VarIsNull(Value) then
      SetRecordField(aField, aData, nil) else
    begin  
      VariantToNative(FldType, Value, @aBuffer, FieldDescriptor[aField].fdLength);
      SetRecordField(aField, aData, @aBuffer);
    end;
  end;  
end;

function TableNameToTPA: Integer;
begin
  Result := 255;
  if (not gConfig.FidAutoPremiar) or 
     (gConfig.FidPremioAuto=0) then Exit;
  
  case gConfig.FidPremioAuto of
    tpaPacote :  
      if SameText('Pacote', aTable) then Result := tpaPacote;

    tpaPassaporte :  
      if SameText('TipoPass', aTable) then Result := tpaPassaporte;
  end;
end;

begin
  aTable := TnxServerCursor(aExtender.ExtendableObject).Table.Name;

  if not aBefore then begin
    if not (TableNameToTPA in [tpaPacote, tpaPassaporte]) then Exit;
    vID := LeFld('ID', nxtAutoInc);
    if (vID=null) or (vID<>gConfig.FidPremioAuto) then Exit;
    vID := LeFld('Fidelidade', nxtBoolean);
    if (vID=Null) or (vID=False) then
      gConfig.FidPontosPremioAuto := 0
    else begin
      vID := LeFld('FidPontos', nxtInt32);
      if vID=null then vID := 0;
      gConfig.FidPontosPremioAuto := vID;
    end;  

    Exit;
  end;

  { typically, code here would check if its the
    correct table }
   if SameText(aTable, 'Maquina') then begin
     vW := LeFld('DisplayW', nxtWord16);
     vH := LeFld('DisplayH', nxtWord16);
     if VarIsNull(vW) or VarIsNull(vH) or (vW=0) or (vH=0) then
       SaveFld('DisplayWH', '', nxtNullString) 
     else begin
       aW := vW;
       aH := vH;
       SaveFld('DisplayWH', IntToStr(aW)+'x'+IntToStr(aH), nxtNullString);
     end;
     Exit;
   end else
   if SameText(aTable, 'FiltroWeb') and aBefore then begin
     vTipo := LeFld('URL', nxtNullString);
     if vTipo<>null then begin
       St := tMemoryStream.Create;
       S := 'S'+vTipo;
       St.WriteBuffer(S[1], Length(S));
       EnviaMsg(CliNotifyHandle, ncmc_SiteBloqueado, 0, Integer(St));
     end;
     Exit;
   end else
   if SameText(aTable, 'Cliente') and aBefore then begin
     vDeb := LeFld('Debito', nxtCurrency);

     if gConfig.SalvarCodUsername then begin
       vUsername := LeFld('Username', nxtNullString);
       vID := LeFld('ID', nxtAutoInc);
       if (not VarIsNull(vID)) and (vID>0) and 
          (VarIsNull(vUsername) or (Trim(vUsername)='')) then 
       begin
         S := vID;
         SaveFld('Username', S, nxtNullString);
       end;
     end;

     if VarIsNull(vDeb) then vDeb := 0;
     if vDeb<0.001 then
       SaveFld('TemDebito', False, nxtBoolean) else
       SaveFld('TemDebito', True, nxtBoolean);
     Exit;
   end else
   if SameText(aTable, 'Tran') then
     aTabTran := True 
   else
   if SameText(aTable, 'ITran') then
     aTabTran := False else
     Exit;
      
   vCancelado := LeFld('Cancelado', nxtBoolean);
   if aTabTran then
     vTipo := LeFld('Tipo', nxtByte) else
     vTipo := LeFld('TipoTran', nxtByte);
     
   vTotal := LeFld('Total', nxtCurrency);
   vDesconto := LeFld('Desconto', nxtCurrency);
   vPago := LeFld('Pago', nxtCurrency);
   vSessao := LeFld('Sessao', nxtWord32);
   vCaixa := LeFld('Caixa', nxtWord32);

   if VarIsNull(vCaixa) then vCaixa := 0;
   if VarIsNull(vCancelado) then begin
     vCancelado := False;
     SaveFld('Cancelado', False, nxtBoolean);
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
    
  SaveFld('Debito', vDeb, nxtCurrency);  
  if aTabTran and ((vCancelado=null) or (vCancelado=False)) then begin
    SaveFld('CanceladoPor', null, nxtBoolean);
    SaveFld('CanceladoEm', null, nxtNullString);
  end;

  if not aTabTran then begin
    vNewFator := LeFld('FidFator', nxtInt8);
    vNewPontos := LeFld('FidPontos', nxtDouble);

    if (vTipo=null) or (vNewPontos=null) or (vNewPontos=0) or (vNewFator=null) or ((vNewFator<>1) and (vNewFator<>-1)) then
      SaveFld('FidOpe', tofNenhum, nxtByte)
    else
    if vTipo=trAjustaFid then
      SaveFld('FidOpe', tofCorrecao, nxtByte)
    else
    if vNewFator=-1 then
      SaveFld('FidOpe', tofResgate, nxtByte) else
      SaveFld('FidOpe', tofAcumulo, nxtByte);

{    dmProc := TdmDBProc(FOP.GetObjFromPool); 
    try
      dmProc.AjustaPontos(vOldCliente, vNewCliente, vOldFator, vNewFator, vOldPontos, vNewPontos);
    finally
      FOP.ReleaseObj(dmProc);
    end;}
    
  end;
end;

function TdmServidorBD.nxTCPIPRemoveSession(aSender: TnxBaseTransport;
  aSessionID: TnxSessionID): TnxResult;
begin
  NexPlugin.spRemoveSession(aSessionID);
end;

procedure TdmServidorBD.Shutdown;
begin
  nxTCPIP.OnRemoveSession := nil;
  NexCmdHandler.Active := False;
  NexPlugin.Active := False;
  ServerEngine.Active := False;
  nxTCPIP.Active := False;
end;

initialization
  dmServidorBD := nil;

end.
