unit uRSServBD;

interface

uses
  Windows, FileCtrl, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants, SyncObjs,
  EXECryptorKeyGen,
  nxseAllEngines,
  nxllTransport, 
  nxpvPlatformImplementation,
  nxptBasePooledTransport, nxtwWinsockTransport,
  nxsdServerEngine, nxsrSecurityMonitor, nxsrSqlEngineBase, nxsqlEngine,
  nxchCommandHandler, nxllComponent, nxsrServerEngine, nxdb,
  Db, nxsdSimpleMonitor,
  nxllMemoryManager,
  nxsqlProxies,
  nxllTypes,
  nxsdTypes, nxlgEventLog, nxtmSharedMemoryTransport, nxsdDataDictionary,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ExtCtrls;
  

type
  TAndamentoConversao = procedure (Arquivo: String; Total, Atual : Integer) of Object;

  TdmServidorBD = class(TDataModule)
    EventLog: TnxEventLog;
    ServerEngine: TnxServerEngine;
    CommandHandler: TnxServerCommandHandler;
    nxSQLEng: TnxSqlEngine;
    nxTCPIP: TnxWinsockTransport;
    nxSimpleMon: TnxSimpleMonitor;
    nxSe: TnxSession;
    nxDB: TnxDatabase;
    T: TnxTable;
    Timer1: TTimer;
    tCli: TnxTable;
    nxShMem: TnxSharedMemoryTransport;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure nxSimpleMonRecordInsert(aExtender: TnxSimpleMonitorExtender;
      aBefore: Boolean; aLockType: TnxLockType; aData: PnxByteArray);
    procedure nxSimpleMonRecordModify(aExtender: TnxSimpleMonitorExtender;
      aBefore: Boolean; aNewData, aOldData: PnxByteArray;
      aReleaseLock: Boolean);
    procedure Timer1Timer(Sender: TObject);
  private
    KG : TKeyGen;
    { Private declarations }

    procedure SalvaLicTipo(aDB: TnxServerDatabase; aLoja: Integer; aLicTipo: Integer; aVenc: Variant);
    procedure IncRedir(aDB: TnxServerDatabase; aLoja: Integer);
  public
    { Public declarations }
  end;

  function CreateSession: TnxSession;
  procedure TableCancel(T: TnxTable);

  procedure TransfDados(F, D: TDataset);

  function InitTran(aDB: TnxDatabase;
                     const aTables : array of TnxTable;
                     aWith : Boolean): Boolean;
  


var
  dmServidorBD: TdmServidorBD;

  csui : TCriticalSection;

  ui_cc,
  ui_contato,
  ui_cadastro, 
  ui_mkt,
  ui_receber : cardinal;

  DiasInativo : Integer = 5;
  DiasBounce : Integer = 2;

implementation

uses nr_consts, JTimer, uLicEXECryptor, nrTablesDef , nxFieldsUtils, nxllUtils,
  nr_status, nrDebug, nrTablesDef_cc, nrTablesDef_autoconn;

{$R *.DFM}


type
  THackFields = class(TnxFieldsDescriptor);

function FieldIsNull(aID: Integer; aBuf: PnxByteArray; aDict: TnxDataDictionary): Boolean;
begin
  with aDict, THackFields(aDict.FieldsDescriptor) do 
    Result := (aBuf = nil) or 
               nxIsBitSet(PnxByteArray(@aBuf^[fsdLogRecLenAlign]), aID);
end;

function FieldChanged(aID: Integer; aBufOld, aBufNew: PnxByteArray; aDict: TnxDataDictionary): Boolean;

var nullNew, nullOld : Boolean;

function ValueDif: Boolean;
var I : Integer;
begin
  with aDict.FieldsDescriptor.FieldDescriptor[aID] do
  for I := 0 to fdLength-1 do                              
  if aBufOld^[fdOffSet+I]<>aBufNew^[fdOffSet+I] then begin
    Result := True;
    Exit;
  end;
  Result := False;
end;

begin
  nullNew := FieldIsNull(aID, aBufNew, aDict);
  nullOld := FieldIsNull(aID, aBufOld, aDict);

  if nullNew and nullOld then 
    Result := False
  else
  if (nullNew<>nullOld) then
    Result := True
  else
    Result := ValueDif;
end;

function IsUpdateField(aFieldName: String): Boolean;
begin
  Result := SameText('UpdateContato', aFieldName) or
            SameText('UpdateMkt', aFieldName) or
            SameText('UpdateCad', aFieldName) or
            SameText('UpdateID', aFieldName);
end;

function AlterouAlgumCampo(aCampos: String; aBufOld, aBufNew: PnxByteArray; aDict: TnxDataDictionary; aCamposExcecao: Boolean): Boolean;
var I : Integer; Contem: Boolean;
begin
  Result := True;
  with aDict.FieldsDescriptor do 
  for I := 0 to High(FieldDescriptor) do
  if not IsUpdateField(FieldDescriptor[I].Name) then begin
    Contem := (Pos(';'+FieldDescriptor[I].Name+';', aCampos)>0); 
    if aCamposExcecao then Contem := not Contem;
    if Contem and FieldChanged(I, aBufOld, aBufNew, aDict) then begin
//      if aCamposExcecao then DebugMsg('AlterouCampo ' + FieldDescriptor[I].Name);
      Exit;
    end;
  end;
  Result := False;
end;

function DataBaseLic: TDateTime;
begin
  Result := EncodeDate(2003, 1, 1);
end;

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
      Sleep(Random(50));
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

procedure TdmServidorBD.DataModuleCreate(Sender: TObject);
var 
  S : String;
  SR : TSearchRec;

function GetUI(aTable: String; aField: String): Cardinal;
var V: Variant;
begin
  T.Active := False;
  T.TableName := aTable;
  T.IndexName := 'I'+aField;
  T.Active := True;
  T.Last;
  V := T.FieldByName(aField).Value;
  if V=null then
    Result := 0 else
    Result := V;
  T.Active := False;
end;  

begin
  dmServidorBD := Self;
  KG := TKeyGen.Create(ExtractFilePath(ParamStr(0)));
  
  S := ExtractFilePath(ParamStr(0)) + 'Dados';
  if not DirectoryExists(S) then MkDir(S);
  
  ServerEngine.AliasHandler.Delete('Registro');
  ServerEngine.AliasHandler.Add('Registro', S, True);
  
  S := S + '\CC';
  if not DirectoryExists(S) then MkDir(S);
  ServerEngine.AliasHandler.Delete('CC');
  ServerEngine.AliasHandler.Add('CC', S, True);

  S := ExtractFilePath(ParamStr(0)) + 'Dados\AC';
  if not DirectoryExists(S) then MkDir(S);
  ServerEngine.AliasHandler.Delete('AC');
  ServerEngine.AliasHandler.Add('AC', S, True);
  
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
  ServerEngine.TempStoreSize := 500;

{  S := ExtractFilePath(ParamStr(0)) + 'Copia';
  if not DirectoryExists(S) then MkDir(S);

  S := ExtractFilePath(ParamStr(0)) + 'Email';
  if not DirectoryExists(S) then MkDir(S);}
  
  ServerEngine.Active := True;
  nxSimpleMon.Active := True;

  nxSe.Active := True;

  nxDB.AliasName := 'CC';
  nxDB.Active := True;
  nrTablesDef_cc.BuildAndEvolveDatabase(nxDB);
  ui_cc := GetUI('checaConta', 'UpdID');
  nxDB.Active := False;

  nxDB.AliasName := 'AC';
  nxDB.Active := True;
  nrTablesDef_autoconn.BuildAndEvolveDatabase(nxDB);
  nxDB.Active := False;
  
  nxDB.AliasName := 'Registro';
  nxDB.Active := True;
  nrTablesDef.BuildAndEvolveDatabase(nxDB);

  ui_contato := GetUI('cliente', 'UpdateContato');
  ui_cadastro := GetUI('cliente', 'UpdateCad');
  ui_mkt := GetUI('cliente', 'UpdateMkt');
  
  ui_receber := GetUI('receber', 'UpdateID');

  CommandHandler.Active := True;
  nxSqlEng.Active := True;
  nxTCPIP.Active := True;
  nxShMem.Active := True;
  Timer1.Enabled := True;
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
    Result.Active := True;
  end;  
end;

procedure TdmServidorBD.DataModuleDestroy(Sender: TObject);
begin
  KG.Free;
  dmServidorBD := nil;
end;


function padroniza_cidade(S: String): String;
var I : Integer;
begin
  S := AnsiUpperCase(Trim(S));
  Result := '';
  for I := 1 to Length(S) do 
  if (S[I]<>' ') or ((I>1) and (S[I-1]<>' ')) then
    Result := Result + S[I];
end;

procedure TdmServidorBD.nxSimpleMonRecordInsert(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean; aLockType: TnxLockType;
  aData: PnxByteArray);
var
  V, vGerar, vLoja, vCodEquip, vTipo, vVencimento, vMaq, vData, vAtiva : Variant;
  aLen, aTipo: Integer;
  aTabTran: Boolean;
  aBuffer: Array[1..310] of Byte;
  S, S2: String;
  St : TMemoryStream;
  aTable: String;

  Ano, Mes, Dia, UDias : Word;
  D1, D2 : TDateTime;

  
function LeFld(aFieldName: String): OleVariant;
begin
  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    Result := FieldByNameAsVariant[aData, aFieldName];
end;
  
procedure SaveFld(aFieldName: String; const Value: OleVariant);
begin
  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    FieldByNameAsVariant[aData, aFieldName] := Value;
end;

begin
  { typically, code here would check if its the
    correct table }
  if not aBefore then Exit;
  
  aTable := TnxServerBaseCursor(aExtender.ExtendableObject).FullName;
  if SameText(aTable, 'ChecaConta') then begin
    csui.Enter;
    try
      Inc(ui_cc);
      SaveFld('UpdID', ui_cc);
    finally
      csui.Leave;
    end;
    Exit;
  end;
  if SameText(aTable, 'receber') then begin
    csui.Enter;
    try
      Inc(ui_receber);
      SaveFld('UpdateID', ui_receber);
    finally
      csui.Leave;
    end;
    Exit;
  end else
  if SameText(aTable, 'OpenStat') then begin
    vData := LeFld('Data');
    if vData<>null then begin
      DecodeDate(vData, Ano, Mes, Dia);
      SaveFld('Ano', Ano);
      SaveFld('Mes', Mes);
      SaveFld('Dia', Dia);
    end else begin
      SaveFld('Ano', null);
      SaveFld('Mes', null);
      SaveFld('Dia', null);
    end;
    vLoja := LeFld('Loja');
    if vLoja<>null then
      IncRedir(TnxServerDatabase(TnxServerBaseCursor(aExtender.ExtendableObject).Database), vLoja);
    Exit;
  end else
  if SameText(aTable, 'cliente') then begin
    csui.Enter;
    try
      Inc(ui_cadastro);
      Inc(ui_mkt);
      Inc(ui_contato);
      SaveFld('UpdateContato', ui_contato);
      SaveFld('UpdateCad', ui_cadastro);
      SaveFld('UpdateMkt', ui_mkt);
    finally
      csui.Leave;
    end;

    SaveFld('CadastroEm', Now);

    SaveFld('Status', stcNovo);
    SaveFld('StatusDesde', Now);
    SaveFld('Recente', True);
    SaveFld('Inativo', False);
    SaveFld('ParouRedir', False);
    SaveFld('Premium', False);
    SaveFld('FezRedir', False);
    SaveFld('RedirD', 0);
    SaveFld('Usou', False);
    SaveFld('Saiu', False);
    SaveFld('CCContatoOk'    , False);
    SaveFld('CCContatoFail'  , False);
    SaveFld('CCQContatoOK'   , 0);
    SaveFld('CCQContatoFail' , 0);
    
    vData := LeFld('Cidade');
    if (vData<>null) then SaveFld('Cidade', Padroniza_Cidade(vData));

    vData := LeFld('UF');
    if (vData<>null) then SaveFld('UF', UpperCase(vData));
    
    vData := LeFld('UObtemLic');
    if vData=null then begin
      SaveFld('UAno', null);
      SaveFld('UMes', null);
      SaveFld('UDia', null);
      SaveFld('UDias', null);
    end else begin
      DecodeDate(vData, Ano, Mes, Dia);
      SaveFld('UAno', Ano);
      SaveFld('UMes', Mes);
      SaveFld('UDia', Dia);
      vAtiva := LeFld('CadastroEm');
      if vAtiva <> null then begin
        D1 := vAtiva;
        D2 := vData;
        UDias := Trunc(D2-D1);
        SaveFld('UDias', UDias);
      end else
        SaveFld('UDias', null);
    end;

    vData := LeFld('CadastroEm');
    if vData=null then begin
      SaveFld('CAno', null);
      SaveFld('CMes', null);
      SaveFld('CDia', null);
    end else begin
      DecodeDate(vData, Ano, Mes, Dia);
      SaveFld('CAno', Ano);
      SaveFld('CMes', Mes);
      SaveFld('CDia', Dia);
    end;

    vData := LeFld('AtivadoEm');
    if vData=null then begin
      SaveFld('AAno', null);
      SaveFld('AMes', null);
      SaveFld('ADia', null);
    end else begin
      DecodeDate(vData, Ano, Mes, Dia);
      SaveFld('AAno', Ano);
      SaveFld('AMes', Mes);
      SaveFld('ADia', Dia);
    end;
    
    Exit;
  end else
    if not SameText(aTable, 'Autorizacao') then Exit;
    
  if not SameText(TnxServerBaseCursor(aExtender.ExtendableObject).FullName, 'Autorizacao') then Exit;
    
   vGerar := LeFld('Gerar');
   if (vGerar=null) or (vGerar=False) then Exit;
   vLoja := LeFld('Loja');
   vCodEquip := LeFld('CodigoEquip');
   vTipo := LeFld('Tipo');
   vVencimento := LeFld('Vencimento');
   vMaq := LeFld('Maquinas');
   SaveFld('Gerar', True);
   if VarIsNull(vLoja) or VarIsNull(vCodEquip) or 
      VarIsNull(vTipo) or VarIsNull(vMaq) then 
   begin
     SaveFld('Autorizacao', 'erro');
     Exit;
   end;

   vAtiva := LeFld('Ativa');
   if aBefore and (vAtiva<>null) and (vAtiva=True) and (vLoja<>null) and (vTipo<>null) then
     SalvaLicTipo(TnxServerDatabase(TnxServerBaseCursor(aExtender.ExtendableObject).Database), vLoja, vTipo, vVencimento);
   

   if vTipo=null then vTipo := ectcFreePremium;

   if vTipo=ectcFreePremium then begin
     if vVencimento=null then vVencimento := 0;
     S := DateToDateLic(vVencimento, True);
     S2 := S;
     vMaq := 1;
   end else begin
     if vVencimento=null then vVencimento := DataBaseLic+1;
     S := Trim(vLoja)+'-'+FormatDateTime('dd/mm/yyyy', vVencimento);
     S2 := DateToDateLic(vVencimento, False);
   end;  
   
   S := S2 + '-' +
        KG.CreateSerialNumberEx(ExtractFilePath(ParamStr(0))+'cm.ep2', 
                                S,
                                False, False, False, False, False, False,
                                vTipo, vMaq, vCodEquip);
   SaveFld('Autorizacao', S);
end;

procedure TdmServidorBD.nxSimpleMonRecordModify(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean; aNewData,
  aOldData: PnxByteArray; aReleaseLock: Boolean);
var
  vGerar, vLoja, vStatusAnt, vCodEquip, vTipo, vVencimento, vBool, vMaq, vAtiva, vData, vObtem, vCad, vRedirD, vRedirU1, vRedirU2: Variant;
  aTable: String;

  D1, D2, DInativo: TDateTime;

  Bounce,
  Premium,
  Inativo,
  Saiu,
  Usou, 
  ParouRedir,
  FezRedir,
  Recente : Boolean;

  Status : Byte;

  sVer: String;
  

  Dia, Mes, Ano : Word;
  UDias, RedirD : Integer;

function LeFld(aFieldName: String): OleVariant;
begin
  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    Result := FieldByNameAsVariant[aNewData, aFieldName];
end;

function LeAnt(aFieldName: String): OleVariant;
begin
  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    Result := FieldByNameAsVariant[aOldData, aFieldName];
end;

function AlterouFld(aFieldName: String): OleVariant;
begin
  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor do 
    Result := FieldChanged(GetFieldFromName(aFieldName), aNewData, aOldData, TnxServerBaseCursor(aExtender.ExtendableObject)._Dictionary);
end;
  
procedure SaveFld(aFieldName: String; const Value: OleVariant);
begin
  with TnxServerBaseCursor(aExtender.ExtendableObject).TableDescriptor, FieldsDescriptor do
    FieldByNameAsVariant[aNewData, aFieldName] := Value;
end;

function _AlterouCampos(aCampos: String; aCamposExcecao: Boolean): Boolean;
begin
  Result := AlterouAlgumCampo(aCampos, aOldData, aNewData, TnxServerBaseCursor(aExtender.ExtendableObject)._Dictionary, aCamposExcecao);
end;
  
begin
  aTable := TnxServerBaseCursor(aExtender.ExtendableObject).FullName;

  if not aBefore then Exit;

  if SameText(aTable, 'ChecaConta') then begin
    csui.Enter;
    try
      Inc(ui_cc);
      SaveFld('UpdID', ui_cc);
    finally
      csui.Leave;
    end;
    Exit;
  end;
  if SameText(aTable, 'receber') then begin
    csui.Enter;
    try
      Inc(ui_receber);
      SaveFld('UpdateID', ui_receber);
    finally
      csui.Leave;
    end;
    Exit;
  end else
  if SameText(aTable, 'OpenStat') then begin
    vData := LeFld('Data');
    if vData<>null then begin
      DecodeDate(vData, Ano, Mes, Dia);
      SaveFld('Ano', Ano);
      SaveFld('Mes', Mes);
      SaveFld('Dia', Dia);
    end else begin
      SaveFld('Ano', null);
      SaveFld('Mes', null);
      SaveFld('Dia', null);
    end;
    vLoja := LeFld('Loja');
    if vLoja<>null then
      IncRedir(TnxServerDatabase(TnxServerBaseCursor(aExtender.ExtendableObject).Database), vLoja);    
    Exit;
  end else
  if SameText(aTable, 'cliente') then begin
    vCad := LeFld('UVersao');
    if (vCad=null) or (trim(vCad)='') then
      SaveFld('XVersao', null) 
    else begin
      sVer := Trim(vCad);
      while Pos('.', sVer)>0 do Delete(sVer, 1, Pos('.', sVer));
      SaveFld('XVersao', StrToIntDef(sVer, 0));
    end;
      
    vTipo := LeFld('LicTipo');
    vVencimento := LeFld('LicVenc');
    vObtem := LeFld('UObtemLic');
    vCad := LeFld('CadastroEm');
    if (vObtem=null) then vObtem := vCad;
    vStatusAnt := LeFld('Status');
    

    Premium := (vTipo<>null) and (vTipo = 5) and (vVencimento <> null) and (vVencimento >= (Date-dias_premium));
    Recente := (vCad<>null) and (vCad > (Date-dias_recente));
    Inativo := (vObtem<>null) and (vObtem <= (Date-dias_inativo));
    Saiu    := (vObtem<>null) and (vObtem <= (Date-dias_saiu));
    SaveFld('Premium', Premium);
    SaveFld('Recente', Recente);
    SaveFld('Inativo', Inativo);
    SaveFld('Saiu', Saiu);

    if Inativo then begin
      DInativo := Int(vObtem) + dias_inativo;
      SaveFld('DInativo', DInativo);
    end else begin
      DInativo := 0;
      SaveFld('DInativo', null);
    end;

    vData := LeFld('RedirU');
    FezRedir := (vData<>null);
    ParouRedir := FezRedir and (vData <= (Date - dias_parouredir));
    SaveFld('ParouRedir', ParouRedir);
    SaveFld('FezRedir', FezRedir);

    vRedirD := LeFld('RedirD');
    if vRedirD=null then
      RedirD := 0 else
      RedirD := vRedirD;
      

    vRedirU2 := LeFld('RedirU');
    vRedirU1 := LeAnt('RedirU');

    if vRedirU2=null then 
      vRedirU2 := 0 else
      vRedirU2 := Int(vRedirU2);

    if vRedirU1=null then
      vRedirU1 := 0 else
      vRedirU1 := Int(vRedirU1);
        
    if FezRedir and (vRedirU1<>vRedirU2) then begin
      Inc(RedirD);
      SaveFld('RedirD', RedirD);
    end;
    
    SaveFld('Usou', ((vTipo<>null) and (vTipo=5) and (vVencimento<>null)) or (RedirD>=Dias_redir_usou));

    if Premium then begin
      if Inativo then
        Status := stcLimbo
      else
        Status := stcUsando;
    end else 
    if Inativo then begin
      if Saiu then
        Status := stcSaiu else
        Status := stcSaindo;
    end else
    if (not FezRedir) then begin
      if Recente then
        Status := stcNovo
      else begin
        vData := LeFld('CadastroEm');
        if vData>(date - dias_limbosemredir) then
          Status := stcLimbo
        else begin 
          vBool := LeFld('CCContatoOk');
          if (vBool<>null) and (vBool=True) then
            Status := stcEmTeste else
            Status := stcEntrante;
        end;
      end;
    end else begin
      if ParouRedir then
        Status := stcLimbo
      else
      if RedirD>=dias_redir_usou then
        Status := stcUsando else
        Status := stcEmTesteCompleto;
    end;
    
    vData := LeFld('Cidade');
    if (vData<>null) then SaveFld('Cidade', Padroniza_Cidade(vData));

    vData := LeFld('UF');
    if (vData<>null) then SaveFld('UF', UpperCase(vData));

    vObtem := LeFld('UObtemLic');
    
    UDias := -1;
    if vObtem=null then begin
      SaveFld('UAno', null);
      SaveFld('UMes', null);
      SaveFld('UDia', null);
      SaveFld('UDias', null);
    end else begin
      DecodeDate(vObtem, Ano, Mes, Dia);
      SaveFld('UAno', Ano);
      SaveFld('UMes', Mes);
      SaveFld('UDia', Dia);
      vAtiva := LeFld('CadastroEm');
      if vAtiva <> null then begin
        D1 := vAtiva;
        D2 := vObtem;
        UDias := Trunc(D2-D1);
        if UDias<0 then UDias := 0;
        
        SaveFld('UDias', UDias);
      end else
        SaveFld('UDias', null);
    end;
  
    if (not Inativo) or (UDias<0) or (UDias>DiasBounce) then begin
      SaveFld('Bounce', False);
      SaveFld('DBounce', null);
    end else begin
      SaveFld('Bounce', True);
      SaveFld('DBounce', DInativo);
    end;
    
    vData := LeFld('CadastroEm');

    if vData=null then begin
      SaveFld('CAno', null);
      SaveFld('CMes', null);
      SaveFld('CDia', null);
    end else begin
      DecodeDate(vData, Ano, Mes, Dia);
      SaveFld('CAno', Ano);
      SaveFld('CMes', Mes);
      SaveFld('CDia', Dia);
    end;

    vData := LeFld('AtivadoEm');
    if vData=null then begin
      SaveFld('AAno', null);
      SaveFld('AMes', null);
      SaveFld('ADia', null);
    end else begin
      DecodeDate(vData, Ano, Mes, Dia);
      SaveFld('AAno', Ano);
      SaveFld('AMes', Mes);
      SaveFld('ADia', Dia);
    end;

    SaveFld('Status', Status);

    if (LeFld('StatusDesde')=null) or (vStatusAnt=null) or (Status<>vStatusAnt) then
      SaveFld('StatusDesde', Now);

    if _AlterouCampos(CamposUpdateContato, False) then
    begin
      csui.Enter;
      try
        Inc(ui_contato);
        SaveFld('UpdateContato', ui_contato);
      finally
        csui.Leave;
      end;
    end;

    if _AlterouCampos(CamposUpdateContato, True) then
    begin
      csui.Enter;
      try
        Inc(ui_cadastro);
        SaveFld('UpdateCad', ui_cadastro);
      finally
        csui.Leave;
      end;
    end;

    if _AlterouCampos(CamposUpdateMkt, False) then
    begin
      csui.Enter;
      try
        Inc(ui_mkt);
        SaveFld('UpdateMkt', ui_mkt);
      finally
        csui.Leave;
      end;
    end;    
    
    Exit;
  end else
    if not SameText(aTable, 'Autorizacao') then Exit;

  vLoja := LeFld('Loja');
  if vLoja=null then Exit;
  vTipo := LeFld('Tipo');
  if vTipo=null then Exit;
  
  vVencimento := LeFld('Vencimento');
  vAtiva := LeFld('Ativa');
   
  if (vAtiva<>null) and (vAtiva=True) and (vLoja<>null) and (vTipo<>null) then
    SalvaLicTipo(TnxServerDatabase(TnxServerBaseCursor(aExtender.ExtendableObject).Database), vLoja, vTipo, vVencimento);
end;

procedure TdmServidorBD.IncRedir(aDB: TnxServerDatabase; aLoja: Integer);
var 
  HC: TnxHelpCursor;  
  V : Variant;
begin
  Exit;
  
  HC := TnxHelpCursor.CreateOpen('Cliente', aDB);
  try
    HC.Active := True;
    if HC.Active then begin
      HC.InitRecord(HC.FKeyData1);
      HC.InitRecord(HC.FOldData);
      if not HC.SelIndex('ICodigo') then Exit;
      HC.SetKey1('Codigo', aLoja);
      if HC.FindKey(1) then begin
        HC.SetValue('RedirU', Now);
        V := HC.NewValue('RedirT', 0);
        V := V + 1;
        HC.SetValue('RedirT', V);
        HC.ModifyNewData;
      end;
    end;
  finally
    HC.Free;
  end;
end;

procedure TdmServidorBD.SalvaLicTipo(aDB: TnxServerDatabase; aLoja, aLicTipo: Integer;
  aVenc: Variant);
var HC: TnxHelpCursor;  
begin
  HC := TnxHelpCursor.CreateOpen('Cliente', aDB);
  try
    HC.Active := True;
    if HC.Active then begin
      HC.InitRecord(HC.FKeyData1);
      if not HC.SelIndex('ICodigo') then Exit;
      HC.SetKey1('Codigo', aLoja);
      if HC.FindKey(1) then begin
        HC.SetValue('LicTipo', aLicTipo);
        HC.SetValue('LicVenc', aVenc);
        HC.ModifyNewData;
      end;
    end;
  finally
    HC.Free;
  end;
end;

procedure TdmServidorBD.Timer1Timer(Sender: TObject);

procedure Process(Nome: String);
var codant: Integer; I: Integer;
begin
  codant := 0; 
  I := 0;
  if tCli.IsEmpty then Exit;
  tCli.First;
  try
    while not tCli.IsEmpty do begin
      if codant = tCli.FieldByName('Codigo').AsInteger then begin
        DebugMsgEsp('TdmServidorBD.Timer1Timer.Process.' + Nome + ' - Looping infinito - Loja: ' + IntToStr(codant), False, True);
        Exit;
      end;
  
      CodAnt := tCli.FieldByName('Codigo').AsInteger;
  
      if I=0 then InitTran(nxDB, [tCli], True);
      tCli.Edit;
      tCli.FieldByName('Status').AsInteger := 99;
      tCli.Post;
      tCli.First;
      Inc(I);
      if I=10 then begin
        nxDB.Commit;
        I := 0;
        Sleep(10);
      end;
    end;
    if I>0 then nxDB.Commit;
  finally
    if nxDB.InTransaction then nxDB.Rollback;
  end;
end;


begin
  Timer1.Enabled := False;
  try
    try
      tCli.Active := True;
      
      tCli.IndexName := 'IInativo';
      tCli.SetRange([False, EncodeDate(1980, 1, 1)], [False, Date-dias_inativo]);
      Process('Inativos-1');
      tCli.SetRange([False, null, EncodeDate(1980, 1, 1)], [False, null, Date-dias_inativo]);
      Process('Inativos-2');
      
      tCli.IndexName := 'IParouRedir';
      tCli.SetRange([False, EncodeDate(1980, 1, 1)], [False, Date-dias_parouredir]);
      Process('Parou Redir');

      tCli.IndexName := 'IRecente';
      tCli.SetRange([True, EncodeDate(1980, 1, 1)], [True, Date-dias_recente]);
      Process('Recentes');

      tCli.IndexName := 'IPremium';
      tCli.SetRange([True, EncodeDate(1980, 1, 1)], [True, Date-dias_premium-1]);
      Process('Premium');

      tCli.IndexName := 'ISaiu';
      tCli.SetRange([False, EncodeDate(1980, 1, 1)], [False, Date-dias_saiu]);
      Process('Saiu-1');
      tCli.SetRange([False, null, EncodeDate(1980, 1, 1)], [False, null, Date-dias_saiu]);
      Process('Saiu-2');

      tCli.Active := False;
    except
      on E: exception do 
        DebugMsgEsp('TdmServidorBD.Timer1Timer - Exception: '+E.Message, False, True);
    end;
  finally
    Timer1.Interval := 1000 * 60 * 5;  {5 minutos}
    Timer1.Enabled := True;
  end;
end;

initialization
  dmServidorBD := nil;
  csui := TCriticalSection.Create;
  ui_contato := 0;
  ui_cadastro := 0;
  ui_mkt := 0;
  ui_receber := 0;

finalization
  csui.Free;  

end.
