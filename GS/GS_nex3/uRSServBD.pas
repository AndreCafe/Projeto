unit uRSServBD;

interface

uses
  Windows, FileCtrl, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants,
  EXECryptorKeyGen,
  nxseAllEngines,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport,
  nxsdServerEngine, nxsrSecurityMonitor, nxsrSqlEngineBase, nxsqlEngine,
  nxchCommandHandler, nxllComponent, nxsrServerEngine, nxdb,
  Db, nxsdSimpleMonitor,
  nxllMemoryManager,
  nxsqlProxies,
  nxllTypes,
  nxsdTypes, nxlgEventLog;
  

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
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure nxSimpleMonRecordInsert(aExtender: TnxSimpleMonitorExtender;
      aBefore: Boolean; aLockType: TnxLockType; aData: PnxByteArray);
  private
    KG : TKeyGen;
    { Private declarations }
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
  
implementation

uses JTimer, uLicEXECryptor, nrTablesDef;

{$R *.DFM}

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

procedure TdmServidorBD.DataModuleCreate(Sender: TObject);
var 
  S : String;
  SR : TSearchRec;
begin
  KG := TKeyGen.Create(ExtractFilePath(ParamStr(0)));
  
  dmServidorBD := Self;
  S := ExtractFilePath(ParamStr(0)) + 'Dados';
  if not DirectoryExists(S) then MkDir(S);
  S := ExtractFilePath(ParamStr(0)) + 'Dados';
  if not DirectoryExists(S) then MkDir(S);
  
  ServerEngine.AliasHandler.Delete('Registro');
  ServerEngine.AliasHandler.Add('Registro', S, True);
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

{  S := ExtractFilePath(ParamStr(0)) + 'Copia';
  if not DirectoryExists(S) then MkDir(S);

  S := ExtractFilePath(ParamStr(0)) + 'Email';
  if not DirectoryExists(S) then MkDir(S);}
  
  ServerEngine.Active := True;
  nxSimpleMon.Active := True;

  nxSe.Active := True;
  nxDB.Active := True;
  BuildAndEvolveDatabase(nxDB);
  
  CommandHandler.Active := True;
  nxSqlEng.Active := True;
  nxTCPIP.Active := True;
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

procedure TdmServidorBD.nxSimpleMonRecordInsert(
  aExtender: TnxSimpleMonitorExtender; aBefore: Boolean; aLockType: TnxLockType;
  aData: PnxByteArray);
var
  vGerar, vLoja, vCodEquip, vTipo, vVencimento, vMaq : Variant;
  aLen, aTipo: Integer;
  aTabTran: Boolean;
  aBuffer: Array[1..310] of Byte;
  S, S2: String;
  St : TMemoryStream;

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

   if vTipo=null then vTipo := ectcFreePremium;

   if vTipo=ectcFreePremium then begin
     if vVencimento=null then vVencimento := 0;
     S := DateToDateLic(vVencimento, True);
     S2 := S;
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

initialization
  dmServidorBD := nil;

end.
