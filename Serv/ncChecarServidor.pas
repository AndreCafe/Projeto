unit ncChecarServidor;

interface

{$I ncChecarServidor.INC}

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  StdCtrls, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, uJson,
  umd5, ieopensavedlg, imageenio, DB, nxdb, nxseAutoComponent,
  nxsdServerEngine, nxsrServerEngine, nxllComponent, nxsdTypes, ncClassesBase;

Const
  {$IFNDEF TESTELOCAL}
  kHost = 'prod1.nextar.com.br';
  // intervalos em minutos
  kTimerUpdateServerInitialInterval = 5;
  kTimerUpdateServerIntervalHasWorkTodo = 1;
  kTimerUpdateServerIntervalIdle = 60; //600;
  {$ELSE}
  kHost = 'localhost';
  // intervalos em minutos
  kTimerUpdateServerInitialInterval = 1;
  kTimerUpdateServerIntervalHasWorkTodo = 1;
  kTimerUpdateServerIntervalIdle = 1;
  {$ENDIF}
  kExtraHash = 'tiririka172';


  kMaxRecordsToUpload = 100;
  kMaxUploadRetries = 5; //byte

  upStatusAEnfileirar = 0;
  upStatusEnfileirado = 1;
  upStatusEnviadoEAguardando = 2;
  upStatusEnviadoOk   = 3;

type
  TMsgEvent = procedure(Sender:TObject; aMsg:string) of object;

  TChecarServidorThread = class ( TThread )
  private
    fClientVersion : string;
    fBatchUID : string;
    fProgPath : string;
    fdbPath : string;
    fdbDownloadPath : string;
    fdbUploadPath : string;
    femailconta : string;
    fCodEquip : string;
    fsenha : string;
    fHasWorkTodo : boolean;
    fBatchUploaded : boolean;
    nxServerEngineDnld : TnxServerEngine;
    nxServerEngineUpld : TnxServerEngine;
    nxSessionDnld: TnxSession;
    nxSessionUpld: TnxSession;
    nxDatabaseDnld: TnxDatabase;
    nxDatabaseUpld: TnxDatabase;
    nxServerEngine1 : TnxServerEngine;
    nxDatabase1: TnxDatabase;
    nxSession1: TnxSession;
    nxQuery: TnxQuery;
    nxTableU: TnxTable;
    nxTableDtemp: TnxTable;
    nxTableD: TnxTable;
    nxTableProdu: TnxTable;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    fUltimoErro : string;
    fLogMsg : string;
    fOnMsg  : TMsgEvent;
    fToUpload : integer;
    fcanUpload : boolean;
    fhaveUpResponse : boolean;
    frecordsToDownload : integer;
    fisLastDownload : boolean;
    fUpResponse : TJsonObject;
    procedure msg(msg:string);
    procedure EnfileirarParaPrimerEnvio;
    function  EnfileirarParaEnvio:string;
    procedure limparTableU;
    function DownloadServidor:boolean;
    function DownloadCommands:boolean;
    function UploadServidor:boolean;
    procedure ProcessaUpload;
    function CheckServer:boolean;
    procedure ProcessUpResponse;
    procedure revertBatch(aBatchUID:string);
    function  autenticar:boolean;
    procedure IdHTTP1OnConnected(Sender:TObject);
    procedure syncLog;
    procedure nxcgProgressCallback(const aTableName : String;
      var aStatus : TnxTaskStatus;
      var aCancel : Boolean);
  protected
    procedure Execute; override;
  public
    property OnMsg: TMsgEvent read fOnMsg write fOnMsg;
    property hasWorkTodo : boolean read fHasWorkTodo;
    constructor Create(aProgPath, adbPath, adbDownloadPath, adbUploadPath: string;
       anxServerEngine1, anxServerEngineDnld, anxServerEngineUpld: TnxServerEngine;
       aCodEquip, aEmailConta, aSenha: String); reintroduce;
    destructor Destroy; override;
  end;


implementation

uses
   uLogs, ncProdD, ncProdU, ncDMProdClient, nxllTypes, uNXCompression, ncServBD,
   uVersionInfo;
   

type
  a15b = array[0..15]of byte;

function strXOR(A, B:string):string;
var
    i : integer;
    a1, b1 : array[0..15]of byte;

    function h2b(c:char):byte;
    begin
      if (c>='0')and(c<='9') then
          result := ord(c)-$30
      else
      if (c>='A')and(c<='F') then
          result := ord(c)-$41+10
      else
      if (c>='a')and(c<='f') then
          result := ord(c)-$61+10
      else
          result := 0;
    end;
begin
    for i := 0 to 15 do
        a1[i] := h2b(a[(i*2)+1])*16 + h2b(a[(i*2)+2]);
    for i := 0 to 15 do
        b1[i] := h2b(b[(i*2)+1])*16 + h2b(b[(i*2)+2]);
    for i := 0 to 15 do
      A1[i] := A1[i] xor B1[i];
    a := '';
    for i := 0 to 15 do
       a := a + inttohex(a1[i],2);
    result := lowercase(A);
end;

{ TChecarServidorThread }

constructor TChecarServidorThread.Create(aProgPath, adbPath, adbDownloadPath, adbUploadPath: string;
       anxServerEngine1, anxServerEngineDnld, anxServerEngineUpld: TnxServerEngine;
       aCodEquip, aEmailConta, aSenha: String);
begin
  inherited create(true);
  fProgPath := aProgPath;
  fdbPath := adbPath;
  fdbDownloadPath := adbDownloadPath;
  fdbUploadPath := adbUploadPath;
  fCodEquip := aCodEquip;
  fEmailConta := aEmailConta;
  fSenha := aSenha;
  nxServerEngine1 := anxServerEngine1;
  nxServerEngineDnld := anxServerEngineDnld;
  nxServerEngineUpld := anxServerEngineUpld;
  FreeOnTerminate := false;

  fClientVersion := uVersionInfo.VersionInfo.StringByName('ProductName') +
         uVersionInfo.VersionInfo.ProgramDisplayLongVersion;

end;

destructor TChecarServidorThread.Destroy;
begin
  inherited;
end;

procedure TChecarServidorThread.Execute;
var
   aguTime : integer;
   iniciou : boolean;

   procedure aguardarMinutos(m:integer);
   var
       i : integer;
   begin
       msg('aguardando '+inttostr(m)+'min.');
       i := 0;
       repeat
           sleep(100);
           inc(i);
       until terminated or (i>=600*m);
   end;

begin
    GLog.Log(self,[lcTrace], 'TChecarServidorThread.Execute start '+formatdatetime('hh:nn:ss',now) );
    msg('TChecarServidorThread.Execute start '+formatdatetime('hh:nn:ss',now));

    iniciou := false;
    nxDatabaseUpld  := TnxDatabase.create(nil);
    nxSessionUpld   := TnxSession.create(nil);
    try
        nxSessionUpld.ServerEngine := nxServerEngineUpld;
        nxDatabaseUpld.Session := nxSessionUpld;
        nxDatabaseUpld.AliasPath := fdbUploadPath;
        forcedirectories(fdbUploadPath);
        nxDatabaseUpld.open;

        while not (iniciou or terminated) do begin

            aguardarMinutos(kTimerUpdateServerInitialInterval);
            try
                ncProdU.BuildAndEvolveProduComIndices(nxDatabaseUpld, nxcgProgressCallback);
                iniciou := true;
                if terminated then exit;
            except
                on e:exception do begin
                    GLog.Log(self,[lcExcept], 'BuildAndEvolveProduComIndices '+ e.Message);
                    try
                        deletefile(fdbUploadPath+'produ.nx1');
                        deletefile(fdbUploadPath+'produ.idx');
                    except
                        on e:exception do begin
                            GLog.Log(self,[lcExcept], 'deletefile '+ e.Message);
                        end;
                    end;
                end;
            end;
        end;

        nxTableDtemp := TnxTable.create(nil);
        nxTableD     := TnxTable.create(nil);
        nxTableU     := TnxTable.create(nil);
        nxQuery      := TnxQuery.create(nil);
        nxTableProdu := TnxTable.create(nil);
        IdHTTP1      := TIdHTTP.create(nil);
        try
            idHttp1.HandleRedirects := True;
            IdHTTP1.OnConnected := IdHTTP1OnConnected;
            IdSSLIOHandlerSocket1:= TIdSSLIOHandlerSocket.create(nil);

            nxDatabaseDnld  := TnxDatabase.create(nil);
            nxSessionDnld   := TnxSession.create(nil);
            nxSessionDnld.ServerEngine := nxServerEngineDnld;
            nxDatabaseDnld.Session := nxSessionDnld;
            nxDatabaseDnld.AliasPath := fdbDownloadPath;

            if not terminated then
            repeat
                nxDatabase1  := TnxDatabase.create(nil);
                fUpResponse := nil;
                nxSession1 := nil;
                try
                    nxDatabase1.AliasName    := 'NexCafe';
                    nxDatabase1.Timeout := 30000;
                    if nxServerEngine1=nil then begin
                        nxSession1   := ncServBD.CreateSession;
                    end else begin
                        nxSession1   := TnxSession.create(nil);
                        nxSession1.ServerEngine := nxServerEngine1;
                        nxDatabase1.AliasPath := fdbPath;
                    end;

                    nxDatabase1.Session := nxSession1;
                    nxDatabase1.Open;
                    forcedirectories(fdbDownloadPath);
                    nxDatabaseDnld.open;
                    ncProdD.BuildDatabase(nxDatabaseDnld);
                    ncProdU.BuildAndEvolveProduComIndices(nxDatabaseUpld, nxcgProgressCallback);
                    if terminated then exit;

                    limparTableU;
                    EnfileirarParaPrimerEnvio;
                    fBatchUID := EnfileirarParaEnvio;
                    CheckServer;
                    if (fToUpload>0) and (not fBatchUploaded) then
                       revertBatch(fBatchUID);
                    fBatchUID := '';
                finally
                    nxDatabase1.Free;
                    if Assigned(nxSession1) then nxSession1.Free;
                    if fUpResponse <> nil then
                        fUpResponse.free;
                end;

                if fHasWorkTodo then
                    aguTime := kTimerUpdateServerIntervalHasWorkTodo
                else
                    aguTime := kTimerUpdateServerIntervalIdle;
                GLog.Log(self,[lcTrace], 'TChecarServidorThread.Execute aguardarMinutos: '+inttostr(aguTime) );
                aguardarMinutos(aguTime);

                if not GConfig.AutoCad then
                   break;

            until terminated;

        finally
            IdHTTP1.free;
            IdSSLIOHandlerSocket1.free;
            nxDatabaseDnld.Free;
            nxSessionDnld.Free;
            nxTableProdu.Free;
            nxTableU.Free;
            nxTableDtemp.Free;
            nxTableD.Free;
            nxQuery.Free;
        end;

    except
        on e:exception do begin
           GLog.Log(self,[lcExcept],'TChecarServidorThread.Execute '+e.Message);
           msg('TChecarServidorThread.Execute '+e.Message);
        end;
    end;
    nxDatabaseUpld.Free;
    nxSessionUpld.Free;

    GLog.Log(self,[lcTrace], 'TChecarServidorThread.Execute end' );
    msg( 'TChecarServidorThread.Execute end' );
end;

procedure TChecarServidorThread.IdHTTP1OnConnected(Sender: TObject);
begin
    //msg( 'IdHTTP1OnConnected: '+ TIdHTTP(sender).Host );
end;

procedure TChecarServidorThread.limparTableU;
var
    ain : TnxWord32;
begin
    nxTableU.Session  := nxSessionUpld;
    nxTableU.Database := nxDatabaseUpld;
    nxTableU.TableName := 'prodU';
    nxTableU.IndexName := '';
    nxTableU.filter := '';
    nxTableU.filtered := false;
    nxTableU.open;
    nxTableU.GetAutoIncValue(ain);
    nxTableU.close;

    nxDatabaseUpld.EmptyTable('prodU', '');

    nxTableU.open;
    nxTableU.SetAutoIncValue(ain);
    nxTableU.close;
end;

procedure TChecarServidorThread.msg(msg: string);
begin
    if assigned(fOnMsg) then begin
        fLogMsg := msg;
        synchronize(syncLog);
    end;

end;

procedure TChecarServidorThread.nxcgProgressCallback(const aTableName: String;
  var aStatus: TnxTaskStatus; var aCancel: Boolean);
begin
    aCancel := Terminated;
end;

procedure TChecarServidorThread.syncLog;
begin
    fOnMsg(self, fLogMsg);
end;

function TChecarServidorThread.autenticar: boolean;
var
    authmd5 : string;
begin
    {Mundaça : autenticacao nao eh nescesária. No envio de produtos usar CodEquip}

    try
        IdHTTP1.Port := 443;
        IdHTTP1.IOHandler := IdSSLIOHandlerSocket1;
        authmd5 := trim(IdHTTP1.Get('https://'+kHost+'/auth.php'));
        if  length(authmd5)<>32 then
           msg (authmd5)
        else begin
           //versao 2
           fUltimoErro := IdHTTP1.Get('https://'+kHost+'/auth.php?email='+fEmailConta+'&codEquip='+fCodEquip+'&hash='+strXOR(umd5.H(fEmailConta+fCodEquip+kExtraHash),authmd5)+'&cliVersion='+fClientVersion);
           // versao 1
           //fUltimoErro := IdHTTP1.Get('https://'+kHost+'/auth.php?email='+fCodEquip+'&hash='+strXOR(umd5.H(fCodEquip),authmd5));
           // versao inicial, nao usa mais
           //fUltimoErro := IdHTTP1.Get('https://'+kHost+'/auth.php?email='+emailconta+'&hash='+strXOR(umd5.H(senha),authmd5));
        end;
    except
        on e:exception do begin
            fUltimoErro := e.message;
            msg ('autenticar: '+ e.message);
        end;
    end;
    result := fUltimoErro='authenticated';
end;

function TChecarServidorThread.DownloadCommands:boolean;
var
    lastupd, ilastupd : integer;
    ms : TMemoryStream;
    resposta, codbar  : string;
    i, id_upd, cmd : integer;
    jarr : TJsonArray;
    jobj : TJsonObject;
begin
    GLog.Log(self,[lcTrace], '- DownloadCommands' );
    result := false;
    msg('- DownloadCommands' );
    if autenticar then begin
        GLog.Log(self,[lcTrace], 'autenticado' );

        IdHTTP1.Port := 443;
        IdHTTP1.IOHandler := IdSSLIOHandlerSocket1;

        lastupd := 0;
        nxTableD.Session  := nxSession1;
        nxTableD.Database := nxDatabase1;
        nxTableD.Tablename := 'temp';
        nxTableD.IndexName := '';
        nxTableD.filter := '';
        nxTableD.filtered := false;
        nxTableD.Open;
        if nxTableD.recordcount>0 then
           lastupd := nxTableD.FieldByName('last_upd_cmds').AsInteger;
        nxTableD.Close;
        ilastupd := lastupd;

        ms := TMemoryStream.create;
        try
            try
                resposta := IdHTTP1.Get('https://'+kHost+'/cmds.php?id_upd='+inttostr(lastupd));
                if copy(resposta, 1, 6)='error:' then begin
                    msg(resposta);
                    GLog.Log(self,[lcTrace], resposta );
                    exit;
                end else begin
                    msg('id_udp='+inttostr(lastupd));
                    msg(resposta);
                end;

            except
                on e:Exception do
                     GLog.Log(self,[lcExcept], 'DownloadCommands: '+e.Message );
            end;

            nxTableD.Session  := nxSession1;
            nxTableD.Database := nxDatabase1;
            nxTableD.Tablename := 'prodD';
            nxTableD.IndexName := 'pk';
            nxTableD.Open;
            jarr := TJsonArray.create(resposta);
            try
                for i:=0 to jarr.length-1 do begin
                     jobj := jarr.getJSONObject(i);
                     id_upd := jobj.getInt('id_upd');
                     cmd    := jobj.getInt('cmd');
                     codbar := jobj.getString('codbar');
                     if id_upd>lastupd then lastupd := id_upd;
                     if cmd=0 then begin
                         GLog.Log(self,[lcTrace], 'processando comando delete '+codbar );
                         msg( 'processando comando delete '+codbar );
                         if nxTableD.Locate('codbar', codbar, []) then
                             nxTableD.Delete;
                     end;
                end;
            finally
                jarr.free;
            end;
            nxTableD.Close;

            if lastupd > ilastupd then begin
                nxTableD.Session  := nxSession1;
                nxTableD.Database := nxDatabase1;
                nxTableD.Tablename := 'temp';
                nxTableD.IndexName := '';
                nxTableD.filter := '';
                nxTableD.filtered := false;
                nxTableD.Open;
                if nxTableD.recordcount>0 then begin
                    nxTableD.edit;
                    nxTableD.FieldByName('last_upd_cmds').AsInteger := lastupd;
                    nxTableD.post;
                end else
                    nxTableD.AppendRecord([lastupd]) ;
                nxTableD.Close;
            end;

        finally
            nxServerEngineDnld.Active := false;
            ms.Free;
            if fileexists(fdbDownloadPath+'prodD.compressed') then deletefile(fdbDownloadPath+'prodD.compressed');
            if fileexists(fdbDownloadPath+'prodD.nx1') then deletefile(fdbDownloadPath+'prodD.nx1');
            if fileexists(fdbDownloadPath+'nxTrans.cfg') then deletefile(fdbDownloadPath+'nxTrans.cfg');
            if directoryexists(fdbDownloadPath) then removedir(fdbDownloadPath);
            nxServerEngineDnld.Active := true;
        end;

        result := true;

    end else begin
        GLog.Log(self,[lcTrace], fUltimoErro );
        GLog.Log(self,[lcTrace], 'não autenticado' );
        msg( fUltimoErro );
        msg( 'não autenticado' );
    end;
end;

function TChecarServidorThread.DownloadServidor:boolean;
var
    fs : TFileStream;
    lastupd : integer;
    ms : TMemoryStream;
    ss : TStringStream;
    s : string;
    s1 : string;
    ok : boolean;
begin
    GLog.Log(self,[lcTrace], '- DownloadServidor' );
    msg('- DownloadServidor' );
    result := false;
    if autenticar then begin
        GLog.Log(self,[lcTrace], 'autenticado' );

        IdHTTP1.Port := 443;
        IdHTTP1.IOHandler := IdSSLIOHandlerSocket1;

        lastupd := 0;
        if nxDatabase1.TableExists('prodD','') then begin
            nxTableD.Session  := nxSession1;
            nxTableD.Database := nxDatabase1;
            nxTableD.Tablename := 'prodD';
            nxTableD.IndexName := 'ix_upd';
            nxTableD.Open;
            if nxTableD.recordcount>0 then
               lastupd := nxTableD.FieldByName('id_upd').AsInteger;
            nxTableD.Close;
        end;

        ms := TMemoryStream.create;
        try
            try
                if fileexists(fdbDownloadPath+'prodD.compressed') then deletefile(fdbDownloadPath+'prodD.compressed');
                if fileexists(fdbDownloadPath+'prodD.nx1') then deletefile(fdbDownloadPath+'prodD.nx1');
                if fileexists(fdbDownloadPath+'nxTrans.cfg') then deletefile(fdbDownloadPath+'nxTrans.cfg');

                IdHTTP1.Get('https://'+kHost+'/down.php?id_upd='+inttostr(lastupd), ms);
                msg('id_udp='+inttostr(lastupd));
                forcedirectories(fdbDownloadPath);

                fs := TFileStream.Create(fdbDownloadPath+'prodD.compressed', fmCreate);
                try
                    ms.seek(0,0);
                    fs.CopyFrom(ms,0);
                finally
                    fs.free;
                end;

                ok := false;
                ss := TStringStream.create(s);
                try
                     ms.seek(0,0);
                     ss.CopyFrom(ms,0);
                     ss.seek(0,0);
                     s1 := trim(ss.DataString);
                     if copy(s1, 1, 6)='error:' then begin
                         msg(s1);
                         GLog.Log(self,[lcTrace], s1 );
                     end else
                        ok := true;
                     //if (trim(s1)='') or (ss.DataString[1]=#0) then
                     //    s1 := kerroDnld;
                     //msg(s1);
                     //GLog.Log(self,[lcTrace], s1 )
                finally
                     ss.free;
                end;

                if ok and UncompressFile( fdbDownloadPath+'prodD.compressed', fdbDownloadPath+'prodD.nx1') then begin
                     nxDatabaseDnld.close;
                     nxDatabaseDnld.AliasPath := fdbDownloadPath;
                     nxDatabaseDnld.Open;
                     nxTableDtemp.Session := nxSessionDnld;
                     nxTableDtemp.Database := nxDatabaseDnld;

                     nxTableDtemp.TableName :=  'prodD';
                     nxTableDtemp.open;
                     nxTableDtemp.first;
                     nxTableD.Open;
                     s1 := 'processando '+inttostr(nxTableDtemp.recordcount)+' registros';
                     msg(s1);
                     GLog.Log(self,[lcTrace], s1);
                     while not nxTableDtemp.eof do begin
                         msg(nxTableDtemp.fields[0].asString + ' - ' + nxTableDtemp.FieldByName('id_upd').asString + ' - ' + nxTableDtemp.fields[2].asString);
                         if nxTableD.Locate('codbar', nxTableDtemp.fields[0].asString, [loCaseInsensitive]) then begin
                              nxTableD.Edit;
                              nxTableD.FieldByName('descricao').value  :=  nxTableDtemp.FieldByName('descricao').value;
                              nxTableD.FieldByName('unid').value       :=  nxTableDtemp.FieldByName('unid').value;
                              nxTableD.FieldByName('imagem').value     :=  nxTableDtemp.FieldByName('imagem').value;
                              nxTableD.FieldByName('md5').value        :=  nxTableDtemp.FieldByName('md5').value;
                              nxTableD.FieldByName('categoria').value  :=  nxTableDtemp.FieldByName('categoria').value;
                              nxTableD.FieldByName('id_upd').value     :=  nxTableDtemp.FieldByName('id_upd').value;
                              nxTableD.Post;
                         end else

                         nxTableD.AppendRecord([
                             nxTableDtemp.fields[0].asString, // 'codbar', '', nxtShortString, 14, 0, True
                             nil,
                             nxTableDtemp.fields[2].asString, // 'descricao', '', nxtShortString, 55, 0, False
                             nxTableDtemp.fields[3].asString, // 'unid', '', nxtShortString, 5, 0, False
                             nxTableDtemp.fields[4].asString, // 'imagem', '', nxtBLOBGraphic, 0, 0, False
                             nxTableDtemp.fields[5].asString, // 'md5', '', nxtShortString, 32, 0, False
                             nxTableDtemp.fields[6].asString, // 'categoria', '', nxtShortString, 35, 0, False
                             nxTableDtemp.fields[7].asInteger // 'id_upd', '', nxtWord32, 10, 0, True
                         ]);

                         nxTableDtemp.next;
                     end;
                     nxTableD.Close;

                     nxDatabaseDnld.Close;
                     GLog.Log(self,[lcTrace], 'feito' );
                end;
                result := true;
            except
                on e:Exception do
                     GLog.Log(self,[lcExcept], 'DownloadServidor: '+e.Message );
            end;
        finally
            nxServerEngineDnld.Active := false;
            ms.Free;
            if fileexists(fdbDownloadPath+'prodD.compressed') then deletefile(fdbDownloadPath+'prodD.compressed');
            if fileexists(fdbDownloadPath+'prodD.nx1') then deletefile(fdbDownloadPath+'prodD.nx1');
            if fileexists(fdbDownloadPath+'nxTrans.cfg') then deletefile(fdbDownloadPath+'nxTrans.cfg');
            if directoryexists(fdbDownloadPath) then removedir(fdbDownloadPath);
            nxServerEngineDnld.Active := true;
        end;


        //ReindexTable(nxTableD);

    end else begin
        GLog.Log(self,[lcTrace], fUltimoErro );
        GLog.Log(self,[lcTrace], 'não autenticado' );
        msg( fUltimoErro );
        msg( 'não autenticado' );
    end;
end;

function TChecarServidorThread.EnfileirarParaEnvio:string;
var
    s : string;
    guid : TGuid;
begin
    SysUtils.CreateGUID(guid);
    result := GUIDToString(guid);
    nxTableProdu.TableName := 'Produto';
    nxTableProdu.Session := nxSession1;
    nxTableProdu.Database := nxDatabase1;

    GLog.Log(self,[lcTrace], '- EnfileirarParaEnvio' );
    msg( '- EnfileirarParaEnvio' );

        nxTableU.Database  := nxDatabaseUpld;
        nxTableU.Session   := nxSessionUpld;
        nxTableU.TableName := 'prodU';
        nxTableU.IndexName := 'idx_codbar';
        nxTableU.filter    := '';
        nxTableU.filtered  := false;

        nxTableProdu.filter := 'uploadR>0 and uploadS='+inttostr(upStatusAEnfileirar)+' and (codigo is not NULL)';
        nxTableProdu.filtered := true;
        nxTableProdu.IndexName := 'Iupload';

        nxDatabase1.Open;
        nxDatabaseDnld.Open;
        nxTableProdu.Open;
        nxTableU.Open;
        GLog.Log(self,[lcTrace],inttostr(nxTableProdu.recordcount)+ ' registros para serem enfileirados para upload' );
        msg(inttostr(nxTableProdu.recordcount)+ ' registros para serem enfileirados para upload' );
        fToUpload := 0;
        fHasWorkTodo := nxTableProdu.RecordCount > kMaxRecordsToUpload;
        while not nxTableProdu.Eof do begin

            // checar que existe em catalogo
            if nxDatabase1.TableExists('prodD','') then begin
                nxTableD.Session  := nxSession1;
                nxTableD.Database := nxDatabase1;
                nxTableD.Tablename := 'prodD';
                nxTableD.IndexName := 'uq_codbar';
                nxTableD.Open;
                if nxTableD.Locate('codbar',nxTableProdu.FieldByName('codigo').asstring, []) then begin
                    //Se nao tiver diferenças entao pular para o proximo

                    if (
                        (not nxTableProdu.FieldByName('descricao').IsNull) and
                        (not nxTableD.FieldByName('descricao').IsNull) and
                        (nxTableD.FieldByName('descricao').value = nxTableProdu.FieldByName('descricao').value) and

                        (not nxTableProdu.FieldByName('unid').IsNull) and
                        (not nxTableD.FieldByName('unid').IsNull) and
                        (nxTableD.FieldByName('unid').value = nxTableProdu.FieldByName('unid').value) and

                        (not nxTableProdu.FieldByName('categoria').IsNull) and
                        (not nxTableD.FieldByName('categoria').IsNull) and
                        (nxTableD.FieldByName('categoria').value = nxTableProdu.FieldByName('categoria').value) and

                        (not nxTableProdu.FieldByName('md5Imagem').IsNull) and
                        (not nxTableD.FieldByName('md5').IsNull) and
                        (nxTableD.FieldByName('md5').value = nxTableProdu.FieldByName('md5Imagem').value)

                        ) then begin
                           nxTableProdu.next;
                           continue;
                        end;

                end;
                nxTableD.Close;
            end;


            // adicionar em table U
            if not nxTableU.Locate('codbar',nxTableProdu.FieldByName('codigo').asstring, []) then begin
                nxTableU.InsertRecord([
                    nil,
                    nxTableProdu.FieldByName('codigo').value,
                    nxTableProdu.FieldByName('descricao').value,
                    nxTableProdu.FieldByName('unid').value,
                    nxTableProdu.FieldByName('imagem').value,
                    nxTableProdu.FieldByName('md5Imagem').value,
                    nxTableProdu.FieldByName('categoria').value
                ]);
               inc(fToUpload);
               if s = '' then s := '('+ nxTableU.FieldByName('id').asstring+'-';
            end else begin
                nxTableU.Edit;
                nxTableU.FieldByName('descricao').value         :=  nxTableProdu.FieldByName('descricao').value;
                nxTableU.FieldByName('unid').value              :=  nxTableProdu.FieldByName('unid').value;
                nxTableU.FieldByName('categoria').value         :=  nxTableProdu.FieldByName('categoria').value;
                if (not nxTableProdu.FieldByName('md5Imagem').IsNull) and
                   (comparetext( nxTableU.FieldByName('md5').asstring,  nxTableProdu.FieldByName('md5Imagem').asstring)<>0) then
                     nxTableU.FieldByName('imagem').value       :=  nxTableProdu.FieldByName('imagem').value;
                nxTableU.FieldByName('md5').value               :=  nxTableProdu.FieldByName('md5Imagem').value;
                nxTableU.Post;
            end;
            nxTableProdu.Edit;
            nxTableProdu.FieldByName('fk_produ').value          :=  nxTableU.FieldByName('id').value;
            nxTableProdu.FieldByName('uploadS').value           :=  upStatusEnfileirado;
            nxTableProdu.FieldByName('batchUID').value          :=  result;
            nxTableProdu.Post;

            if fToUpload >= kMaxRecordsToUpload then
                break
        end;
        if s > '' then s := s + nxTableU.FieldByName('id').asstring+')';
        nxTableU.Close;
        nxTableProdu.Close;

        {nxTableProdu.filter := 'uploadR>0 and uploadS='+inttostr(upStatusEnfileirado)+' and (codigo is not NULL)';
        nxTableProdu.filtered := true;
        nxTableProdu.IndexName := 'Iupload';
        nxTableProdu.Open;
        fToUpload := nxTableProdu.RecordCount;
        nxTableProdu.Close; }
        GLog.Log(self,[lcTrace],inttostr(fToUpload)+ ' registros enfileirados para upload '+s );
        msg(inttostr(fToUpload)+ ' registros enfileirados upload '+s );

end;

procedure TChecarServidorThread.EnfileirarParaPrimerEnvio;
begin
        GLog.Log(self,[lcTrace], '- EnfileirarParaPrimerEnvio' );
        msg( '- EnfileirarParaPrimerEnvio' );

        nxQuery.Session  := nxSession1;
        nxQuery.Database := nxDatabase1;
        nxQuery.SQL.Text := 'update produto set uploadR='+inttostr(kMaxUploadRetries)+' where uploadR is NULL';
        nxQuery.ExecSQL;
        nxQuery.SQL.Text := 'update produto set uploadS='+inttostr(upStatusAEnfileirar)+' where uploadS is NULL';
        nxQuery.ExecSQL;
end;

function TChecarServidorThread.UploadServidor:boolean;
var
    fs : TFileStream;
    sResponse : string;
begin
    GLog.Log(self,[lcTrace], '- UploadServidor' );
    msg('- UploadServidor' );
    result := false;
    try

        IdHTTP1.Port := 443;
        IdHTTP1.IOHandler := IdSSLIOHandlerSocket1;

        nxTableU.Session  := nxSessionUpld;
        nxTableU.Database := nxDatabaseUpld;
        nxTableU.TableName := 'prodU';
        nxTableU.IndexName := 'idx_codbar';
        nxTableU.filter := '';
        nxTableU.filtered := false;
        nxTableU.Open;
        msg('comprimindo tabela pra up, '+inttostr(nxTableU.recordCount)+' registros');
        GLog.Log(self,[lcTrace],'comprimindo tabela pra up, '+inttostr(nxTableU.recordCount)+' registros');
        nxTableU.Close;

        msg('Restructure Produ Sem Indices');
        GLog.Log(self,[lcTrace],'Restructure Produ Sem Indices');

        ncProdU.RestructureProduSemIndices(nxDatabaseUpld, nxcgProgressCallback);
        if terminated then exit;

        forcedirectories(fProgPath+'temp');

        nxDatabaseUpld.Active := false;
        nxServerEngineUpld.Active := false;
        try
           if not terminated and
              CompressFile( fdbUploadPath+'produ.nx1', fProgPath+'temp\produ.compress') then begin

                if not terminated then begin
                    fs := TFileStream.Create(fProgPath+'temp\produ.compress', fmOpenRead  );
                    try
                        IdHTTP1.Request.ContentType := 'application/octet-stream';
                        GLog.Log(self,[lcTrace],'uploading '+inttostr((fs.size div 1024)+1)+' KB');
                        msg('uploading '+inttostr((fs.size div 1024)+1)+' KB');
                        fs.seek(0,0);
                        sResponse := IdHTTP1.Post('https://'+kHost+'/up.php?email='+femailconta+'&batchUID='+fBatchUID,fs);
                        fBatchUploaded := sametext(sResponse,'ok');
                        GLog.Log(self,[lcTrace],sResponse);
                    finally
                        fs.free;
                    end;
                end;
                deletefile(fProgPath+'temp\produ.compress');

            end;

        finally
            nxServerEngineUpld.Active := true;
            nxDatabaseUpld.Active := true;
        end;

        GLog.Log(self,[lcTrace],'Restructure Produ Com Indices');
        if terminated then exit;

        ncProdU.RestructureProduComIndices(nxDatabaseUpld, nxcgProgressCallback);
        if terminated then exit;

        PackAndReindexTable(nxTableU, nxcgProgressCallback);
        if terminated then exit;
        
        if (not terminated) and (sametext(sResponse,'ok')) then
            ProcessaUpload;

        result := true;
    except
        on e:exception do
            msg('UploadServidor error: '+e.message)
    end;

end;

procedure TChecarServidorThread.ProcessaUpload;
begin
        GLog.Log(self,[lcTrace], '- ProcessaUpload' );
        msg( '- ProcessaUpload' );

        nxDatabase1.Open;

        nxQuery.Session  := nxSession1;
        nxQuery.Database := nxDatabase1;
        nxQuery.SQL.Text := 'update produto set uploadS='+inttostr(upStatusEnviadoEAguardando)+' where uploadS='+inttostr(upStatusEnfileirado);
        nxQuery.ExecSQL;

end;

function TChecarServidorThread.CheckServer:boolean;
var
    sResponse : string;
    lastupd:integer;
begin
    GLog.Log(self,[lcTrace], '- CheckServer' );
    result := false;
    if autenticar then begin
        GLog.Log(self,[lcTrace], 'autenticado' );

        IdHTTP1.Port := 443;
        IdHTTP1.IOHandler := IdSSLIOHandlerSocket1;

        lastupd := 0;
        if nxDatabase1.TableExists('prodD','') then begin
            nxTableD.Session  := nxSession1;
            nxTableD.Database := nxDatabase1;
            nxTableD.Tablename := 'prodD';
            nxTableD.IndexName := 'ix_upd';
            nxTableD.Open;
            if nxTableD.recordcount>0 then
               lastupd := nxTableD.FieldByName('id_upd').AsInteger;
            nxTableD.Close;
        end;

        msg( '- CheckServer id_upd='+ inttostr(lastupd));
        sResponse := IdHTTP1.Get('https://'+kHost+'/getstatus.php?id_upd='+inttostr(lastupd));
        GLog.Log(self,[lcTrace],trim(sResponse));
        try
            fUpResponse := TJsonObject.create(sResponse);
            fCanUpload := fUpResponse.getInt('processes')=0;
            if fCanUpload then
                msg('sem processos')
            else
                msg('processo pendente');
            fhaveUpResponse := fUpResponse.has('response');
            if fhaveUpResponse then begin
                fHasWorkTodo := true;
                msg('resposta pendente');
            end else
                msg('sem resposta pendente');

           frecordsToDownload := fUpResponse.getInt('recordsToDownload');
           msg('recordsToDownload: '+inttostr(frecordsToDownload));
           fisLastDownload := fUpResponse.getboolean('isLastDownload');
           if fisLastDownload then
              msg('é o último.');
           fHasWorkTodo := fHasWorkTodo or not(fisLastDownload);


           if fHaveUpResponse then
               ProcessUpResponse;

           if (fCanUpload) and (fToUpload>0) then
               UploadServidor;

           if frecordsToDownload>0 then
               DownloadServidor;

           DownloadCommands;

           result := true;
        except
            on e:exception do
               msg('getstatus.php: '+e.message)
        end;

    end else begin
        GLog.Log(self,[lcTrace], fUltimoErro );
        GLog.Log(self,[lcTrace], 'não autenticado' );
        msg( fUltimoErro );
        msg( 'não autenticado' );
    end;
end;


procedure TChecarServidorThread.ProcessUpResponse;
var
      i, id : integer;
      achou : boolean;
      s, batchUID : string;
      ja : TJsonArray;
      jo, resJo : TJsonObject;
begin
      resJo := fUpResponse.getJSONObject('response');
      if resJo.getString('processStatus')='ok' then begin
        batchUID := '';
        if resJo.has('batchUID') then
            batchUID := resJo.getString('batchUID');
        if resJo.has('records') then begin
            ja := resJo.getJSONArray('records');

            if ja.length>0 then begin
               jo := ja.getJSONObject(0);
               s:= '('+jo.getString('id') +'-';
               jo := ja.getJSONObject(ja.length-1);
               s:= s+jo.getString('id')+')';
            end;
            GLog.Log(self,[lcTrace], 'ProcessUpResponse: '+inttostr(ja.length)+ ' respostas '+s );
            msg( 'ProcessUpResponse: '+inttostr(ja.length)+ ' respostas '+s );

            nxDatabase1.Open;

            {nxTableU.Session   := nxSessionUpld;
            nxTableU.Database  := nxDatabaseUpld;
            nxTableU.TableName := 'prodU';
            nxTableU.IndexName := 'pk';
            nxTableU.filter    := '';
            nxTableU.filtered  := false;
            nxTableU.Open;  }

            nxTableProdu.Session := nxSession1;
            nxTableProdu.Database := nxDatabase1;
            nxTableProdu.TableName := 'Produto';
            nxTableProdu.FilterType := ftSqlWhere;
            if batchUID<>'' then
                nxTableProdu.filter := 'uploadS='+inttostr(upStatusEnviadoEAguardando)+ ' and batchUID=GUID'''+ batchUID + ''''
            else
                nxTableProdu.filter := 'uploadS='+inttostr(upStatusEnviadoEAguardando);
            nxTableProdu.filtered := true;
            nxTableProdu.IndexName := 'fk_produ'        ;
            nxTableProdu.Open;

            for i:=0 to ja.length-1 do begin
                jo := ja.getJSONObject(i);
                id :=  jo.getInt('id');
                achou := false;
                while nxTableProdu.Locate('fk_produ', id, []) do begin
                    achou := true;
                    if nxTableProdu.FieldByName('uploadR').value>0 then begin
                        nxTableProdu.Edit;
                        if jo.getString('status')='ok' then begin
                            nxTableProdu.FieldByName('uploadR').value := 0;
                            nxTableProdu.FieldByName('uploadS').value := upStatusEnviadoOk;

                            {if nxTableU.Locate('id', id, []) then begin
                                nxTableU.Delete;
                            end else begin
                                GLog.Log(self,[lcTrace],inttostr(id)+' nao localizado em prodU');
                                msg(inttostr(id)+' nao localizado em prodU');
                            end; }
                        end else begin
                            nxTableProdu.FieldByName('uploadR').value := nxTableProdu.FieldByName('uploadR').value-1;
                            nxTableProdu.FieldByName('uploadS').value := upStatusAEnfileirar;
                        end;

                    end;
                    nxTableProdu.FieldByName('fk_produ').value := variants.null;
                    nxTableProdu.Post;
                end;
                if not achou then
                    GLog.Log(self,[lcTrace],inttostr(id)+' nao localizado em produto');

            end;
            nxTableProdu.Close;
            //nxTableU.Close;
          end;
      end;
      if resJo.getString('processStatus')='error' then begin
          s := resJo.getString('error');
          if resJo.has('error2') then
             s := s + ' ' + resJo.getString('error2');
          msg(s);
          if resJo.has('batchUID') then
              revertBatch(resJo.getString('batchUID'));
      end;
      GLog.Log(self,[lcTrace], 'ProcessUpResponse end' );
end;

procedure TChecarServidorThread.revertBatch(aBatchUID: string);
begin
    GLog.Log(self,[lcTrace], 'revertBatch: '+aBatchUID );
    msg( 'revertBatch: '+aBatchUID );
    nxQuery.Database := nxDatabase1;
    nxQuery.Session  := nxSession1;
    nxQuery.SQL.Text := 'update produto set uploadS='+inttostr(upStatusAEnfileirar)+', uploadR='+inttostr(kMaxUploadRetries)+
        ' where batchUID=GUID'''+aBatchUID+'''';
    nxQuery.ExecSQL;
    fHasWorkTodo := true;
end;

end.
