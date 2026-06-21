unit ncKiteApi_SyncNexWeb;

interface

uses idHttp, windows, ncDebug, classes, nxdb, DB, sysutils, AbZipper, AbArcTyp;

type
  TncKiteApi_SyncNexWeb = class ( TThread )
  var
    FCodEquip: String;
    Fuuid: String;
    FLastSent: Integer;
    FSL : TStrings;
    FCSVs : TStrings;
    FDB : TnxDatabase;
    FSyncDT: TDateTime;
    FIDLoja: String;
    FTempZip : String;
    FSession : TnxSession;
    FMetodo: Byte; //0=DB Direto, 1=Backup
    FResultado: Byte;
    FEnviouTudo : Boolean;
  private
    function TempPath: String;
    function UploadPath(const aTemp: Boolean = False): String;
    
    procedure EnviaProximaFatia;
    procedure GetLastRecVer;
    procedure EscolheMetodo;
    procedure Backup;
    procedure DeletePath(aPath: String; const aRemoveDir: Boolean = False; const aTipos: String = '*.*');
    procedure GerarCSVs;
    procedure Zipar;
    procedure Fatiar;  
    procedure Upload;
    function BytesFatia: Cardinal;
    function TemUploadPronto: Boolean;

    procedure SyncDT_Save(aArq: String);
    procedure SyncDT_Load(aArq: String);
  protected
    procedure Execute; override;
  public
    constructor Create; 
    destructor Destroy; override;
  end;

  TSyncParameters = class
    spLastSetup           : Cardinal;
    spURL                 : String;
    spTime                : Cardinal;
    spRefreshSetupTime    : Cardinal;
    spFatia               : Cardinal;
    spExportDirectMaxRecs : Cardinal;
    spSync                : Boolean;

    function NeedRefresh: Boolean;
    function FatiarZip: Boolean;
    function SyncAgain(aLastSync: Cardinal): Boolean;
    procedure Refresh;
  end;

var
  syncPars : TSyncParameters;
    
const
  DateFormat = 'yyyy-mm-dd';
  TimeFormat = 'hh:mm:ss';
  DateTimeFormat = DateFormat + ' ' + TimeFormat;

implementation

uses ncKiteApi, ncClassesBase, ncVersionInfo, ncsDMBackup, ncServBD, uLicExecryptor,
  nexUrls;

{ TncKiteApi_SyncNexWeb }

procedure TncKiteApi_SyncNexWeb.Backup;
var 
  I: Integer;
  S: String;
begin
  S := '';
  for I := 2 to FSL.Count - 1 do begin
    if S>'' then S:=S+sLineBreak;
    S := S + FSL.Names[i];
  end;
  FSyncDT := Now;
  TDMBackup.Copiar(S, TempPath);
end;

function TncKiteApi_SyncNexWeb.BytesFatia: Cardinal;
begin
  Result := SyncPars.spFatia * 1000;
end;

constructor TncKiteApi_SyncNexWeb.Create;
begin
  inherited Create(True);
  
  with RegistroGlobal do 
    FCodEquip := GetCodEquip(GetSerialHD);
    
  FSession := nil;
  FDB := nil;
  FCSVs := TStringList.Create;
  FSL  := TStringList.Create;
  FLastSent := 0;
  FMetodo := 0; 
  FEnviouTudo := False;
  ForceDirectories(TempPath);
end;

procedure TncKiteApi_SyncNexWeb.DeletePath(aPath: String;
  const aRemoveDir: Boolean = False; const aTipos: String = '*.*');
var SR: TSearchRec;
begin
  if not DirectoryExists(aPath) then Exit;

  if FindFirst(aPath+aTipos, faAnyFile, SR)=0 then
  try
    repeat
      DeleteFile(aPath+SR.Name);
    until (FindNext(SR)<>0);
  finally
    FindClose(SR);
  end;
  if aRemoveDir then 
    RmDir(PAnsiChar(aPath));
end;

destructor TncKiteApi_SyncNexWeb.Destroy;
begin
  FCSVs.Free;
  FSL.Free;
  if Assigned(FDB) then 
    FDB.Free;

  if Assigned(FSession) then
    FSession.Free;
   
  inherited;
end;

procedure TncKiteApi_SyncNexWeb.EnviaProximaFatia;
var 
  Arq: String;
  NextTry: Cardinal;
  TryTime: Cardinal;
  UltimoArq: Boolean;

function PostOk: Boolean;
var 
  slErro: TStrings;
  s: String;
begin
  slErro := TStringList.Create;
  try
    Result := False;
    s := Arq;
    Delete(S, 1, Pos('.', S));
    if FMetodo in [0..1] then
      slErro.Text := PostUrl(nil, syncPars.spURL+'upload/?conta='+gConfig.Conta+'&codequip='+FCodEquip+'&ver='+ProgShortVer+'&fatia='+s+'&syncdatetime='+FormatDateTime(DateTimeFormat, FSyncDT), Arq, 'file', 'application/octet-stream') else
      slErro.Text := PostUrl(nil, syncPars.spURL+'upload/?conta='+gConfig.Conta+'&codequip='+FCodEquip+'&ver='+ProgShortVer+'&syncdatetime='+FormatDateTime(DateTimeFormat, FSyncDT));
    Result := (slErro.Values['erro']='0');
    if not Result then
      DebugMsg('TncKiteApi_SyncNexWeb.EnviaProximaFatia - Fatia: ' + S + ' - Post Erro = ' + UTF8ToAnsi(slErro.Values['mensagem'])) else
      DebugMsg('TncKiteApi_SyncNexWeb.EnviaProximaFatia - Fatia: ' + S + ' - Post OK');
  except
    on E: Exception do 
      DebugMsg('TncKiteApi_SyncNexWeb.EnviaProximaFatia - Post Exception: ' + E.Message);
  end;
  slErro.Free;
end;

begin
  Arq := UploadPath+FUUID+'.'+IntToStr(FLastSent+1);
  if not FileExists(Arq) then begin
    Arq := Uploadpath+FUUID+'.last';
    UltimoArq := True;
    if not FileExists(Arq) then begin
      FEnviouTudo := True;
      Exit;
    end;
  end else 
    UltimoArq := False;

  NextTry := 0;
  TryTime := 0;
  while (not Terminated) do begin
    if (GetTickCount>NextTry) and PostOk then begin
      FEnviouTudo := UltimoArq;
      Inc(FLastSent);
      Exit;
    end;
    if TryTime < (30 * 60 * 1000) then
      TryTime := TryTime + 5000;
    NextTry := GetTickCount + TryTime;  
    Sleep(100);
  end;
end;

procedure TncKiteApi_SyncNexWeb.EscolheMetodo;
var 
  I, 
  Q, 
  RecVer: Integer;
  T : TnxTable;
begin
  FDB := CreateDB(FSession);
  FDB.AliasName := 'NexCafe'; 
  FDB.Active := True;
  Q := 0;
  T := TnxTable.Create(nil);
  T.Database := FDB;
  try
    T.Active := False;
    T.IndexName := 'IRecVer';
    for I := 3 to FSL.Count - 1 do begin
      if Terminated then Exit;
      T.TableName := FSL.Names[I];
      try
        T.Open;
        RecVer := StrToIntDef(FSL.ValueFromIndex[I], 0);
        T.SetRange([RecVer], [High(Cardinal)]);
        Q := Q + T.RecordCount;
        T.Active := False;
      except
        on E: Exception do begin
          DebugMsg('ExportDirect - Table: ' + T.TableName + ' - Exception: ' + E.Message);
          Raise;
        end;
      end;
    end;
  finally
    T.Free;
  end;
  DebugMsg('ExportDirect - Registros: ' + IntToStr(Q));
  if Q=0 then begin
    FMetodo := 2;
    FSyncDT := Now;
  end else
  if (Q<SyncPars.spExportDirectMaxRecs) then
    FMetodo := 0 
  else begin
    FDB.Active := False;
    FDB.AliasPath := TempPath;
    FMetodo := 1;
  end;
end;

procedure TncKiteApi_SyncNexWeb.Fatiar;
var 
  M: Pointer;
  B, Fatia: Integer;
  F: TFileStream;

function NomeFatia: String;
begin
  if (B<BytesFatia) then 
    Result := UploadPath(True)+FUuid+'.last' else
    Result := Uploadpath(True)+FUuid+'.'+IntToStr(Fatia);
end;

procedure Save;
var S: TFileStream;
begin
  S := TFileStream.Create(NomeFatia, fmCreate);
  try
    S.Write(M^, B)
  finally
    S.Free;
  end;
end;

begin
  if not syncPars.FatiarZip then begin
    RenameFile(UploadPath(True) + 'temp.zip', UploadPath(True) + FUuid + '.last');
    Exit;
  end;
  Getmem(M, BytesFatia); 
  try
    F := TFileStream.Create(UploadPath(True)+'temp.zip', fmOpenRead);
    try
      F.Position := 0;
      Fatia := 0;
      repeat
        Inc(Fatia);
        B := F.Read(M^, BytesFatia);
        if B>0 then Save;
      until (B<BytesFatia);
    finally
      F.Free;
    end;
  finally
    FreeMem(M);
  end;
  
  DeleteFile(UploadPath(True) + 'temp.zip');
end;

function ExportFieldType(F: TFieldType): Boolean;
begin
  Result := (F in [
    ftString,
    ftSmallint,
    ftInteger,
    ftWord,
    ftBoolean,
    ftFloat,
    ftCurrency,
    ftDate,
    ftTime,
    ftDateTime,
    ftAutoInc,
    ftMemo,
    ftLargeint,
    ftGuid,
    ftTimeStamp] );
end;

function FieldToStr(F: TField): String;
begin
  Result := '';
  if F.IsNull then Exit;
  case F.DataType of
    ftString,
    ftMemo,
    ftSmallint,
    ftInteger,
    ftLargeint,
    ftAutoInc,
    ftGuid,
    ftWord : Result := F.AsString;
    ftBoolean : Result := IntToStr(Byte(F.AsBoolean));
    ftFloat,
    ftCurrency : Result := F.AsString;
    ftDate : Result := FormatDateTime(DateFormat, F.AsDateTime);
    ftTime : Result := FormatDateTime(TimeFormat, F.AsDateTime);
    ftDateTime,
    ftTimeStamp : Result := FormatDateTime(DateFormat+' '+TimeFormat, F.AsDateTime);
  end;
  Result := '"' + kapi_EncodeQuoteEnter(AnsiToUTF8(Result)) + '"'; 
end;

function RecToStr(F: TFields): String;
var i, t: integer;
begin
  result := '';
  t := 0;
  for I := 0 to F.Count-1 do 
    if ExportFieldType(F.Fields[i].DataType) then begin
      if t>0 then Result := Result + ',';
      Result := Result + FieldToStr(F.Fields[i]);
      inc(t);
    end;
end;

procedure TncKiteApi_SyncNexWeb.GerarCSVs;
var 
  I: Integer;
  S: String;
  T: TnxTable;

function GetHeader: String;
var j: integer;
begin 
  Result := 'id_loja,uuid_api'; 
  for j := 0 to T.FieldCount - 1 do
    if ExportFieldType(T.Fields[j].DataType) then begin
      if Result>'' then Result := Result + ',';
      Result := Result + T.Fields[j].FieldName;
    end;
end;  

procedure ExportTable(aName: String; aRecVer: Cardinal);
var 
  Arq: TextFile;
  First: Boolean;
  j, c: integer;

function getuuid: String;
begin
  Result := FIDLoja;
  if aName='Debito' then
    Result := Result + '-' + T.FieldByName('Cliente').AsString + '-' + 
                             T.FieldByName('Tipo').AsString + '-' +
                             T.FieldByname('ID').AsString
  else
  if aName='Usuario' then
    Result := Result + '-' + T.FieldByName('Username').AsString
  else
  if aName='Unidade' then
    Result := Result + '-' + T.FieldByName('Descricao').AsString
  else 
  if aName='Categoria' then
    Result := Result + '-' + T.FieldByName('Descricao').AsString
  else  
  if aName='Aviso' then
    Result := Result + '-' + T.FieldByName('Minutos').AsString
  else  
  if aName='Config' then
    Result := Result + '-' + T.FieldByName('NumSeq').AsString
  else  
  if aName='Maquina' then
    Result := Result + '-' + T.FieldByName('Numero').AsString
  else           
  if aName='Maq' then
    Result := Result + '-' + T.FieldByName('Numero').AsString
  else    
    Result := Result + '-' + T.FieldByName('ID').AsString;
end;  

begin
  First := True;
  T.Active := False;
  T.TableName := aName;
  T.Open;
  if FMetodo=0 then begin
    T.IndexName := 'IRecVer';
    T.SetRange([aRecVer+1], [High(Cardinal)]);
  end;
  C := 0;
  T.First;
  try
    while (not T.Eof) and (not Terminated) do begin
      if T.FieldByName('RecVer').AsInteger>aRecVer then begin
        if First then begin
          FCSVs.Add(aName);
          AssignFile(Arq, TempPath+aName+'.csv');
          Rewrite(Arq);
          Writeln(Arq, GetHeader);
          First := False;
        end;
        writeln(Arq, '"'+FIDLoja+'","'+getuuid+'",'+RecToStr(T.Fields));
        Inc(C);
      end;
      T.Next;
    end;
  finally
    if not First then CloseFile(Arq);
  end;
end;

begin
  FDB.Active := True;
  T := TnxTable.Create(nil);
  T.Database := FDB;
  try
    FCSVs.Clear;
    if FMetodo=0 then begin
      FDB.StartTransaction(True);
      FSyncDT := Now;
    end;
      
    try  
    
      for I := 3 to FSL.Count - 1 do begin
        if Terminated then Exit;
        ExportTable(FSL.Names[I], StrToIntDef(FSL.ValueFromIndex[I], 0));
      end;
      
    finally
      if FMetodo=0 then FDB.Rollback;
    end;
  finally
    T.Free;
  end;
  DeletePath(TempPath, False, '*.nx1');
end;

function httpGet(aURL: String): String;
var h: TidHttp;
begin
  H := TidHttp.Create(nil);
  try
    H.HandleRedirects := True;
    Result := H.Get(aURL);
    DebugMsg('httpGet - URL: ' + aURL + ' - Result: ' + Result);
  finally
    H.Free;
  end;
end;

procedure TncKiteApi_SyncNexWeb.GetLastRecVer;
var S: String;
begin
{  FSL.LoadFromFile('c:\meus programas\nex\simula.ini');
  FSL.Text := LowerCase(FSL.Text);     }
  S := SyncPars.spURL+'rec-version/?conta='+gConfig.Conta+'&codequip='+FCodEquip+'&ver='+progShortVer;
  FSL.Text := httpGet(S);
  FIDLoja := FSL.Values['id_loja'];
end;

procedure TncKiteApi_SyncNexWeb.SyncDT_Load(aArq: String);
var 
  sl: TStrings;
  S: String;
begin
  sl := TStringList.Create;         
  try
    sl.LoadFromFile(aArq);
    S := sl.Values['syncdatetime'];
    FSyncDT := EncodeDate(StrToInt(Copy(S, 1, 4)), StrToInt(Copy(S, 5, 2)), StrToInt(Copy(S, 7, 2))) +
               EncodeTime(StrToInt(Copy(S, 9, 2)), StrToInt(Copy(S, 11, 2)), StrToInt(Copy(S, 13, 2)), 0);
  finally
    sl.Free;
  end;
end;

procedure TncKiteApi_SyncNexWeb.SyncDT_Save(aArq: String);
var sl: TStrings;
begin
  sl := TStringList.Create;
  try
    sl.Values['syncdatetime'] := FormatDateTime('yyyymmddhhmmss', FSyncDT);
    sl.SaveToFile(aArq);
  finally
    sl.Free;
  end;
end;

procedure TncKiteApi_SyncNexWeb.Execute;
begin
  try
    syncPars.Refresh;
    if not syncPars.spSync then Exit;
    
    DeletePath(TempPath);
    DeletePath(UploadPath(True), True);

    FCSVs.Clear;
    FSL.Clear;
    
    GetLastRecVer;
    if not TemUploadPronto then begin
      FLastSent := 0;
      EscolheMetodo;
      if Terminated or (FMetodo=2) then Exit;
      
      if FMetodo=1 then begin
        Backup;
        FDB.Active := False;
        FDB.AliasPath := TempPath;
        FDB.Active := True;
      end;

      if FMetodo in [0..1] then begin
        GerarCSVs;
        if FCSVs.Count=0 then begin
          FMetodo := 2;
          Exit;
        end;
        Zipar;
      end;
      
    end;
    Upload;
  except
    on E: Exception do begin
      DebugMsg('TncKiteApi_SyncNexWeb.Execute - Exception: ' + E.Message);
    end;
  end;
end;

function TncKiteApi_SyncNexWeb.TempPath: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'sync\temp\';
end;

function TncKiteApi_SyncNexWeb.TemUploadPronto: Boolean;
var S: String;

function ZipName: String;
begin
  Result := UploadPath + Copy(S, 1, Pos('.', S)-1)+'.last';
end;

function IniName: String;
begin
  Result := UploadPath + Copy(S, 1, Pos('.', S)-1)+'.ini';
end;

begin
  S := FSL.Values['Ultimo'];
  if (Trim(S)>'') and FileExists(ZipName) and FileExists(IniName) then begin
    Result := True;
    FMetodo := 0;
    FUUID := Copy(S, 1, Pos('.', S)-1);
    Delete(S, 1, Pos('.', S));
    FLastSent := StrToIntDef(S, High(Integer))-1;
    SyncDT_Load(IniName);
  end else begin
    Result := False;
    FLastSent := 0;
    DeletePath(UploadPath, True);
  end;
end;

procedure TncKiteApi_SyncNexWeb.Upload;
begin
  FEnviouTudo := False;
  while (not FEnviouTudo) and (not Terminated) do begin
     EnviaProximaFatia;
    Sleep(5);
  end;
end;

function TncKiteApi_SyncNexWeb.UploadPath(const aTemp: Boolean=False): String;
begin
  Result := ExtractFilePath(ParamStr(0))+'sync\upload';
  if aTemp then Result := Result + '_';
  Result := Result + '\';
end;

procedure TncKiteApi_SyncNexWeb.Zipar;
var 
  z: TAbZipper;
  I: Integer;
  G: TGuid;
begin
  CreateGuid(G);
  Fuuid := GuidStringClean(GuidToString(G));
  ForceDirectories(UploadPath(True));
  SyncDT_Save(UploadPath(True)+Fuuid+'.ini');
  Z := TAbZipper.Create(nil);
  try
    if (SyncPars.spFatia>0) then
      Z.FileName := UploadPath(True) + 'temp.zip' else
      Z.FileName := UploadPath(True) + Fuuid + '.zip';
      
    Z.StoreOptions := Z.StoreOptions + [soStripPath, soReplace];
    for I := 0 to FCSVs.Count - 1 do
      Z.AddFiles(TempPath+FCSVs[I]+'.csv', faAnyFile);
    if Terminated then exit;
    Z.Save;
  finally
    Z.Free;
  end;
  if Terminated then Exit;
  for I := 0 to FCSVs.Count - 1 do 
    Windows.DeleteFile(PAnsiChar(TempPath+FCSVs[I]+'.csv'));
  Fatiar;
  RenameFile(UploadPath(True), UploadPath);
end;

{ TSyncParameters }

function TSyncParameters.FatiarZip: Boolean;
begin
  Result := (spFatia>0);
end;

function TSyncParameters.NeedRefresh: Boolean;
begin
  Result := (spLastSetup=0) or ((GetTickCount-spLastSetup) > (spRefreshSetupTime*60*1000));
end;

procedure TSyncParameters.Refresh;
var 
 SL : TStringList;
 S: String;
 CE: String;
begin

  if not NeedRefresh then Exit;

  with RegistroGlobal do
    CE := GetCodEquip(GetSerialHD);
  
  SL := TStringList.Create;
  try
    S := gUrls.Url('dbapi_setup', 'conta='+gConfig.Conta+'&codequip='+CE+'&ver='+ProgShortVer);
    sl.Text := httpGet(S);
    spLastSetup           := GetTickCount;
    spURL                 := sl.Values['url'];
    spTime                := StrToIntDef(sl.Values['synctime'], 300);
    spRefreshSetupTime    := StrToIntDef(sl.Values['refreshsetuptime'], 24 * 60);
    spFatia               := StrToIntDef(sl.Values['fatia'], 0);
    spExportDirectMaxRecs := StrToIntDef(sl.Values['exportdirectmaxrecs'], 1000);
    spSync                := (sl.Values['sync']='1');
  finally
    SL.Free;
  end;
end;

function TSyncParameters.SyncAgain(aLastSync: Cardinal): Boolean;
begin
  Result := (aLastSync=0) or ((GetTickCount-aLastSync)>=(spTime*1000));
end;

initialization
  SyncPars := TSyncParameters.Create;
  with syncPars do begin
    spLastSetup           := 0;
    spURL                 := '';
    spTime                := 300;
    spRefreshSetupTime    := 0; 
    spFatia               := 0;
    spExportDirectMaxRecs := 1000;
    spSync                := False;
  end;  

finalization
  SyncPars.Free;  


end.

0=Aviso
1=Biometria
2=Caixa
3=Categoria
4=CC
5=Chat
6=CHorario
7=Cliente
8=Config
9=Debito
10=EmailCorpo
11=EmailCriar
12=EmailEnvio
13=Espera
14=ETar
15=FiltroWeb
16=HCred
17=HPass
18=HTar
19=Impressao
20=ITran
21=Layout
22=Log
23=LogApp
24=LogNom
25=LogUrl
26=Maq
27=Maquina
28=MovEst
29=MsgCli
30=Ocupacao
31=Pacote
32=Passaporte
33=Patrocinio
34=PrintMon
35=Processos
36=Produto
37=Recibo
38=Sessao
39=Tarifa
40=Tempo
41=TipoAcesso
42=TipoImp
43=TipoPass
44=Tran
45=Usuario
46=CategFW
47=Nomes
48=plusTran
49=plusP
50=plusT
51=infoCampanha
52=prodd
53=temp
54=FilaImp
55=Post
56=Unidade
57=Especie
58=PagEspecies
59=RecDel

