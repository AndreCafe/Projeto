unit ncUploadMain;

interface

uses
  SysUtils, Classes, ExtCtrls, uLogs, Messages, Windows,
  uJSON, nxdb, nxllComponent, nxsdServerEngine, nxreRemoteServerEngine, DB,
  IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  nxsdDataDictionary, nxsdTypes, IdCookieManager, IdCookie,
  ncUploadPost, dateutils, kbmMemTable, nxdbBase, ncUploadGetParams,
  nxllException, ncClassesBase, ncTableDefs, nxsqlBase;

type

  TncUploadThread = class(TThread)
  private
    fAtlasPost : TncUploadPost;

    fnxAllRecordsTempTable : TnxTable;
    fnxServerQuery : TnxQuery;
    fnxQuery : TnxQuery;
    fnxSession1 : TnxSession;
    fnxDatabase1: TnxDatabase;
    fKbmMemBlockRecordsTable: TkbmMemTable;
    fKbmMemResultTable: TkbmMemTable;


    //fFisrtRemoteParametersCall : boolean;
    fStartDT : TDatetime;
    fEmail: string;
    fJsonStr : string;
    fRemoteQueryStatus : integer;
    fRemoteQueryId,
    fIndentlevel : integer;
    fFirstID,
    fLastRecordIDProcessed,
    fRecCount   : integer;
    fQueryItemIDsList : TStringList;
    fAllRecordsCount: integer;
    fAllRecordsServerQueryRecordCount: integer;

    //    memLogFile : Textfile;
    //    memLogFileName : string;
    fParams : TUploadParams;
    fPostFatalError : boolean;
    fPostFatalMessage: string;
    fRemoteUploadVersion :integer;
    fServerQuery : string;
    fServerOid :string;
    fServerOidToProcess :string;

    fIndentStep: integer;
    fNewLine : string;
    fPayloadSecret : string;
    fRecordsByRequest : integer;
    fMaxRecords : integer;
    fInterBlockDelay : integer;
    fSendSummary : boolean;
    FTerminated: Boolean;
    fNxSE: TnxBaseServerEngine;

    function  escape(s: widestring): widestring;
    function  jsonFooter(var indentLevel: integer; jsonString: string): string;
    function  jsonHeader(var indentLevel: integer; email: string): string;
    function  recordToJson(aKbmMemTable: TkbmMemTable; indentlevel: integer; email,injectFkUser:string; excludedFields: TStrings): string;
    procedure postOnResultsResponse(Sender: TObject; aId, aResponseCode: integer; aJsonQueryString, aJsonResponseString: string; aExecTime: int64);
    procedure postOnSummaryResponse(Sender: TObject; aId, aResponseCode: integer; aJsonQueryString, aJsonResponseString: string; aExecTime: int64);
    function  lastBlockRecord: boolean;
    procedure SetServerEngine(se: TnxBaseServerEngine);
    procedure doBlockUpload;
    procedure openDB;
    procedure closeDB;
    function  loadRemoteQueryResultToMemTable: boolean;
    function  createAndPopulateRemoteQueryResult: boolean;
    procedure createRemoteQueryResult(var aDict: TnxDataDictionary);
    procedure populateRemoteQueryResult;
    procedure createNxDbOjects;
    procedure freeNxDbOjects;
    function  newRemoteQuery: integer;
    procedure updateRemoteQuery;
    procedure updateRemoteQueryTotalRecords;
    procedure updateRemoteQueryPost(aRemoteQueryId, aFirstRecord, aLastRecord: integer; aRecords, aJsonResponseString: string; aExecTime: dword; aUpload_err: boolean; aUploadErrorString:string );
    procedure checkRemoteQuery;
    function  getRemoteParameters: boolean;
    procedure setPrivateVariables;
    function  IsNewServerOid: boolean;
    function  existsRemoteControlQuery: boolean;
    function  existsRemoteControlQueryResult: boolean;
    function  getRemoteControlQueryResultDict: TnxDataDictionary;
    procedure setRemoteQueryStatus( aRemoteQueryStatus: integer);
    function  remoteQueryStatusToString: string;
    procedure deleteRemoteControlQueryResult;
    procedure deleteFromRemoteControlQuery;
    function getRemoteControlQueryResultLastID: integer;
    procedure doResumoUpload;
    function injectFkUser: string;

    { Private declarations }
  protected
     procedure Execute; override;
  public
    //property Email: string read fEmail write fEmail;
    property NewLine: string read fNewLine write fNewLine;
    property IndentStep: integer read fIndentStep write fIndentStep;
    property PaylodSecret: string read fPayloadSecret;
    property ServerEngine: TnxBaseServerEngine write SetServerEngine;
    property Terminated: Boolean read FTerminated;

    procedure Terminate;
    constructor Create;
    destructor Destroy; override;
  { Public declarations }
  end;


const kRemoteQueryResult_tablename = '_RemoteQueryResult_';
//var remoteQueryResult_tablename: string = kRemoteQueryResult_tablename;

implementation

uses  ncDMserv, strutils, ncUploadConst, ncUploadDelay, DCPbase64, uUTC, uLicExeCryptor;

//const kNothingToDo = -1;
const kNoID = 0;
const kRemoteQuery_tablename = '_RemoteQuery';
const kRemoteQueryPost_tablename = '_RemoteQueryPost';
const kUploadTempTablename = '<upload_temp>';

const  kRemoteQueryStatusUnchecked = 0;
const  kRemoteQueryStatusNotFound  = 1;
const  kRemoteQueryStatusUnfinished = 2;
const  kRemoteQueryStatusUnconsistent = 3;
const  kRemoteQueryStatusFinished = 4;



procedure TncUploadThread.createNxDbOjects;
begin
     GLog.Log(self,[lcDebug],'createNxDbOjects start');

     fnxSession1 := TnxSession.Create(nil);
     fnxSession1.ServerEngine := fNxSE;
     fnxSession1.Name := 'fnxSession1';
     fnxDatabase1 := TnxDatabase.Create(nil);
     fnxDatabase1.Name := 'fnxDatabase1';
     fnxDatabase1.Session := fnxSession1;

     fnxAllRecordsTempTable := TnxTable.Create(nil);
     fnxAllRecordsTempTable.Name := 'fnxAllRecordsTempTable';
     fnxAllRecordsTempTable.Database := fnxDatabase1;
     fnxAllRecordsTempTable.Session := fnxSession1;

     fnxServerQuery := TnxQuery.Create(nil);
     fnxServerQuery.Name := 'fnxServerQuery';
     fnxServerQuery.Database := fnxDatabase1;
     fnxServerQuery.Session := fnxSession1;

     fnxQuery := TnxQuery.Create(nil);
     fnxQuery.Name := 'fnxQuery';
     fnxQuery.Database := fnxDatabase1;
     fnxQuery.Session := fnxSession1;

     setRemoteQueryStatus(kRemoteQueryStatusUnchecked);

     GLog.Log(self,[lcDebug],'createNxDbOjects end');
end;


procedure TncUploadThread.freeNxDbOjects;
begin
    GLog.Log(self,[lcDebug],'freeNxDbOjects start');
    fnxServerQuery.free;
    GLog.Log(self,[lcDebug],'freeNxDbOjects 1');
    fnxQuery.free;
    GLog.Log(self,[lcDebug],'freeNxDbOjects 2');
    fnxSession1.free;
    GLog.Log(self,[lcDebug],'freeNxDbOjects 3');
    fnxDatabase1.free;
    GLog.Log(self,[lcDebug],'freeNxDbOjects 4');
    fnxAllRecordsTempTable.free;
    GLog.Log(self,[lcDebug],'freeNxDbOjects end');
end;

constructor TncUploadThread.Create;
begin
     inherited Create(true);

     fIndentStep :=  kIndentStep;
     fNewLine := kNewLine; 

     fAtlasPost := TncUploadPost.Create;

     fQueryItemIDsList := TStringList.Create;
     createNxDbOjects;
     fKbmMemBlockRecordsTable := TKbmMemTable.Create(nil);
     fKbmMemResultTable := TKbmMemTable.Create(nil);
     fParams := TUploadParams.Create;
     //fFisrtRemoteParametersCall := true;
     fPayloadSecret := kMongodbStichWebhooksPayloadSecret;

     Priority := tpLower;

 end;

destructor TncUploadThread.Destroy;
begin
    fAtlasPost.Free;
    freeNxDbOjects;
    fQueryItemIDsList.free;
    fParams.Free;
    fKbmMemBlockRecordsTable.Free;
    fKbmMemResultTable.Free;
    inherited;
end;

procedure TncUploadThread.SetServerEngine(se: TnxBaseServerEngine);
begin
    if se<>FNxSE then begin
        fNxSE := se;
        fnxSession1.ServerEngine := fNxSE;
    end;
end;

procedure TncUploadThread.Terminate;
begin
    inherited;
    FTerminated := true;
end;

//---------------------------------
//  \b  Backspace (ascii code 08)
//  \f  Form feed (ascii code 0C)
//  \n  New line
//  \r  Carriage return
//  \t  Tab
//  \"  Double quote
//  \\  Backslash character
//
//  'u' hex hex hex hex

function TncUploadThread.escape(s:widestring):widestring;
var
    us: UCS4String;
    i:integer;
    rs : string;
begin

    rs := '';
    us := WideStringToUCS4String(s);

    for i:=0 to length(us) - 1 do begin

        case us[i] of
            8 : rs := rs + '\b';
            10 : rs := rs + '\n';
            13 : rs := rs + '\r';
            9 : rs := rs + '\t';
            34 : rs := rs + '\"';
            92 : rs := rs + '\\';
            47 : rs := rs + '\/';
        else
            if (us[i]>31) and (us[i]<128) then
                rs := rs + char(us[i])
            else
            if us[i]<>0 then
                rs := rs + '\u'+intToHex( us[i], 4);
        end;
    end;

    //GLog.Log(self,[lcDebug], '=' + rs);
    result := rs;
end;


// MongoDB Extended JSON (v2)
//
function TncUploadThread.recordToJson(aKbmMemTable: TkbmMemTable; indentlevel: integer; email, injectFkUser:string; excludedFields: TStrings):string;
var
    jsonstr, jsonval, payload : string;
    fldDef : TFieldDef;
    fd : TFieldDefs;
    fld : TField;
    i : integer;
    fs : TFormatSettings;
    fldDefName, thisField, fkUserRec: string;
//    sl: TStringList;
begin

    fs.DecimalSeparator := '.';
    fs.ThousandSeparator := ',';

    fd := aKbmMemTable.FieldDefs;

    jsonstr := '';

    // Iterates fields
    for i := 0 to fd.Count - 1 do begin

        jsonval := '';
        fldDef := fd.Items[i];
        thisField := '';

        if excludedFields.IndexOf(fldDef.Name)=-1 then begin
//        if  //not(fldDef.Name='queryItemID') and
//            not(fldDef.Name='RecVer') and
//            not(fldDef.Name='uploadVer')
//        then begin

            fld := aKbmMemTable.FieldByName(fldDef.Name);

            if fld.IsNull = false then begin

               case fldDef.DataType of

                    ftInteger, ftWord, ftSmallint, ftAutoInc :
                          jsonval :=
                              '{"$numberInt":"'+inttostr( fld.AsInteger ) + '"}';

                    ftLargeint :
                          jsonval :=
                              '{"$numberLong":"'+inttostr( fld.AsInteger ) + '"}';

                    ftFixedChar, ftWideString, ftString, ftFixedWideChar, ftGuid:

                          jsonval :=
                              '"' + escape( fld.AsWideString ) + '"';
                              //'"' + escape( system.UTF8Encode( fld.AsWideString )) + '"';

                    ftMemo, ftFmtMemo, ftWideMemo :

                           jsonval :=
                              '"' + escape( fld.AsWideString ) + '"';
                              //'"' + escape( system.UTF8Encode( fld.AsWideString )) + '"';

                    ftBoolean :

                           jsonval :=
                             lowercase(fld.AsString);

                     ftDate, ftTime, ftDateTime :
                           jsonval :=
                              //'{"$date":"' + formatDateTimeISO8601( LocaleToGMT( fld.AsDateTime )) + '"}';
                              '{"$date":{"$numberLong":"'+ inttostr( DateTimeToUnixMilliSecs ( fld.AsDateTime )) +'"}}'; // in millisecs

                     ftTimeStamp :

                           jsonval :=
                             //'"' + formatdatetime('yyyy-mm-dd hh:nn:ss.z UTC', fld.AsDateTime) + '"';
                             '"' + formatdatetime('yyyy-mm-dd hh:nn:ss.z UTC', fld.AsDateTime) + '"';

                     ftFloat :
                            jsonval := //floatToStr( fld.AsFloat, fs);
                              '{"$numberDouble":"'+floatToStr( fld.AsFloat, fs ) + '"}';

                     ftCurrency :
                            jsonval := //floatToStr( fld.AsFloat, fs);
                              '{"$numberDecimal":"'+floatToStr( fld.AsFloat, fs ) + '"}';


                    ftUnknown,
                    ftBCD,
                    ftBytes, ftVarBytes, ftBlob, ftGraphic,
                    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
                    ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob,
                    ftVariant, ftInterface, ftIDispatch, ftFMTBcd,
                    ftOraTimeStamp, ftOraInterval: begin

                             //jsonval :='"IMPLEMENTAR '+FieldTypeNames[fldDef.DataType]+'"';
                             payload := DCPbase64.Base64EncodeStr( fld.AsString );
                             jsonval :=
                                '{"$binary":{"base64":"' +payload+ '", "subType": "05" }}';
                    end;

               end;

            end else begin

                jsonval := 'null';

            end;

            fldDefName := fldDef.Name;
            if fldDef.Name='queryItemID' then
                fldDefName := '_uplID';

            thisField := StringOfChar(' ', (indentlevel + 2)* fIndentStep) +
                            '"' + fldDefName +'":'+jsonval +
                            ',' + fNewLine;

            if fldDef.Name='queryItemID' then
                fkUserRec := thisField
            else
               jsonStr := jsonStr + thisField;
        end;

    end;
    // tira último newline
    jsonstr := copy( jsonstr, 1, length(jsonstr) - length( fNewLine) - 1 );

    jsonstr := StringOfChar(' ', indentlevel * fIndentStep) + '{' + fNewLine +
                fkUserRec + 
                injectFkUser +
                jsonstr +
                StringOfChar(' ', indentlevel * fIndentStep) + '}';

//    sl := TStringList.Create;
//    sl.Text := fJsonStr;
//    sl.SaveToFile('c:\pp.json');
//    sl.free;

    result := jsonstr;

end;

function TncUploadThread.jsonHeader(var indentLevel:integer; email: string): string;
begin
    result := '{' + fNewLine;
    indentlevel := 1;
    result := result + StringOfChar(' ', (indentlevel)* fIndentStep) +
                '"_id": { "$oid":"' +  fServerOid + '"},' + fNewLine;
    result := result + StringOfChar(' ', (indentlevel)* fIndentStep) +
                '"version": ' +  inttostr( fRemoteUploadVersion ) + ',' + fNewLine;
//    result := result + StringOfChar(' ', (indentlevel+1)* fIndentStep) +
//                '"user": ' +  '"' + escape( email) + '",' + fNewLine;
    result := result + StringOfChar(' ', (indentlevel+1)* fIndentStep) +
                '"records": [' +  fNewLine;
    indentlevel := 2;
end;

function TncUploadThread.jsonFooter(var indentLevel:integer; jsonString: string): string;
begin
         result := jsonString;
         indentlevel := indentlevel - 1;
         result := result + fNewLine + StringOfChar(' ', indentlevel * fIndentStep)  + ']'+ fNewLine;
//         indentlevel := indentlevel - 1;
//         result := result + fNewLine + StringOfChar(' ', indentlevel * fIndentStep)  + '}'+ fNewLine;
         result := result + '}';
end;

function sortFunc(List: TStringList; Index1, Index2: Integer): Integer;
var
    i1, i2 : Integer;
begin
    i1 := StrToIntDef(List.Strings[Index1], 0);
    i2 := StrToIntDef(List.Strings[Index2], 0);
    Result := i1 - i2
end;

function TncUploadThread.lastBlockRecord:boolean;
var
     mr : integer;
begin
      if (fRemoteQueryStatus = kRemoteQueryStatusUnfinished) and
         (fKbmMemBlockRecordsTable.eof) then begin
          result := true;
          exit;
      end;
      mr := fMaxRecords;
      if mr<1 then
          result := false
      else
          result := mr <= fRecCount;
end;

procedure TncUploadThread.openDB;
begin
     GLog.Log(self,[lcDebug],'openDB start');
     fnxDatabase1.AliasName := 'nexcafe';
     fnxSession1.UserName := SessionUser;
     fnxSession1.Password := SessionPass;

     fnxSession1.Open;
     if not fnxSession1.IsConnected then begin
         GLog.Log(self,[lcDebug],'fnxSession1 is not conn');
         fnxSession1.ServerEngine.Open;
         fnxSession1.ServerEngine.Connect;
         GLog.Log(self,[lcDebug],'fnxSession1.Open');
         fnxSession1.Open;
     end;

     GLog.Log(self,[lcDebug],'openening db');
     fnxDatabase1.Open;
     GLog.Log(self,[lcDebug],'openDB end');
     GLog.ForceLogWrite;
end;

procedure TncUploadThread.closeDB;
begin
    GLog.Log(self,[lcDebug],'close db');
    fnxDatabase1.Close;
end;

function TncUploadThread.getRemoteParameters: boolean;
var
    getParams : TGetUploadParams;
begin

      GLog.Log(self,[lcDebug],'init Params: '+fParams.asString);
      getParams := TGetUploadParams.Create;
      try
          getParams.Email := fEmail;
          getParams.PaylodSecret := fPayloadSecret;
          result := getParams.Run(Self);
          if result then
              fParams.assign(getParams.Params);
      finally
          getParams.Free;
      end;
      GLog.Log(self,[lcDebug],'getRemoteParameters: '+fParams.asString);

end;

procedure TncUploadThread.setPrivateVariables;
begin
        fMaxRecords := fParams.MaxRecords;
        fInterBlockDelay := fParams.InterBlockDelayS;
        fRecordsByRequest := fParams.RecordsByRequest;
        fRemoteUploadVersion := fParams.RemoteUploadVersion;
        fServerQuery := fParams.ServerQuery;
        fServerOid :=  fParams.ServerOid;
        fServerOidToProcess := fServerOid;
        fFirstID := 0;
        fLastRecordIDProcessed := 0;
        fSendSummary := fParams.SendSummary;
end;



function TncUploadThread.remoteQueryStatusToString:string;
begin
    case fRemoteQueryStatus of
        kRemoteQueryStatusUnchecked: result := 'Unchecked';
        kRemoteQueryStatusNotFound: result := 'NotFound';
        kRemoteQueryStatusUnfinished: result := 'Unfinished';
        kRemoteQueryStatusUnconsistent: result := 'Unconsistent';
        kRemoteQueryStatusFinished: result := 'Finished';
    end;
end;

procedure TncUploadThread.setRemoteQueryStatus(aRemoteQueryStatus: integer);
begin
    if fRemoteQueryStatus <> aRemoteQueryStatus then begin
        fRemoteQueryStatus := aRemoteQueryStatus;
        GLog.Log(self,[lcDebug],'RemoteQueryStatus => ' + remoteQueryStatusToString );
    end;
end;


procedure TncUploadThread.Execute;
var
    temConta: boolean;

    function checkTemConta: boolean;
    begin
        fEmail := gconfig.Conta;
        result := gConfig.StatusConta<>scSemConta;
        GLog.Log(self,[lcDebug],'checkTemConta: '+ boolToStr(result, true));
    end;

begin
    try
        randomize;

        GLog.Log(self,[lcDebug],'UpLoad Thread start');

        temConta := checkTemConta;

        //   memLogFileName := '.\logs\memLog_'+formatdatetime('yyyymmdd"_"hhnnss',now)+'.log';
        //   assignfile( memLogFile, memLogFileName );
        //   if fileexists(memLogFileName) then begin
        //       append(memLogFile);
        //   end else begin
        //       rewrite(memLogFile);
        //   end;
        //   writeln ( memLogFile, '"Tempo"; "#"; "http"; "ms"; "registros"');

        if not delay(self, kDefIniDelayS, 0, 'before run delay') then
           exit;

        openDB;
        while not getRemoteParameters do
            if not(delay(self, fParams.MainDelayS , 0.57, 'getRemoteParameters delay')) then
                exit;
        setPrivateVariables;

        while (not Terminated) do begin
        
             if checkTemConta then begin

                if not temConta then  begin
                    temConta := true;
                    deleteFromRemoteControlQuery
                end;


                checkRemoteQuery;
                if fRemoteQueryId > kNoID then begin
                    if loadRemoteQueryResultToMemTable then begin
                        doBlockUpload;

                        if not fPostFatalError then
                             if not(delay(self, fParams.MainDelayS , 0.4, 'main delay')) then
                                 exit;

                        if (fRemoteQueryId>kNoID) and (fLastRecordIDProcessed = fAllRecordsServerQueryRecordCount) then  begin

                            GLog.Log(self,[lcDebug], 'Finalização ' );

                            if fSendSummary then
                                doResumoUpload;

                            if existsRemoteControlQueryResult then
                                deleteRemoteControlQueryResult;

                        end;
                    end else
                    if not(delay(self, fParams.MainDelayS , 0.3, 'nothing to do delay')) then
                        exit;

                end else
                if not(delay(self, fParams.MainDelayS , 0.7, 'nothing to do delay')) then
                    exit;

            end else
                if not(delay(self, fParams.MainDelayS , 0.7, 'nothing to do delay - no account')) then
                    exit;
            
            while not getRemoteParameters do
                if not(delay(self, fParams.MainDelayS , 0.57, 'getRemoteParameters delay')) then
                    exit;
            setPrivateVariables;

        end;


    finally

        closeDB;

        GLog.Log(self,[lcDebug],'UpLoad Thread end');
    end;

end;


//
//    const  kRemoteQueryStatusUnchecked = 0;
//    const  kRemoteQueryStatusNotFound
//    const  kRemoteQueryStatusUnfinished
//    const  kRemoteQueryStatusUnconsistent
//
//
procedure  TncUploadThread.checkRemoteQuery;
var
        _RemoteUploadVersion, lastRecord, totalRecords: integer;
        _RemoteQueryId : integer;
        _ServerOid : string;
        _ServerQuery : string;
        _SendSummary : boolean;
begin

        GLog.Log(self,[lcDebug],'checkRemoteQuery start');

        setRemoteQueryStatus(kRemoteQueryStatusNotFound);
        fRemoteQueryId := kNoId;

        // se deu error em getparams, exit;
        if fRemoteUploadVersion = -1 then begin
            GLog.Log(self,[lcDebug],'fRemoteUploadVersion = -1');
            exit;
        end;
        if fRemoteUploadVersion = -2 then begin
            GLog.Log(self,[lcDebug],'skip this, not for me');
            exit;
        end;

        if IsNewServerOid then
            newRemoteQuery;

        fAllRecordsCount := 0;
        fAllRecordsServerQueryRecordCount := 0;
        lastRecord := 0;
        _RemoteUploadVersion := 0;
        _SendSummary := false;
        try
            fnxQuery.SQL.Text := 'Select "ID", "ServerOid", "uploadVer", "lastRecord", "totalRecords", "ServerQuery", "send_summary" from "' + kRemoteQuery_tablename +
                                 '" order by "uploadVer" desc';
            _RemoteQueryId := kNoId;
            fnxQuery.Open;
            try
                while not fnxQuery.Eof do begin

                    _RemoteQueryId := fnxQuery.FieldByName('ID').AsInteger;
                    _ServerOid := fnxQuery.FieldByName('ServerOid').AsString;
                    _ServerQuery := fnxQuery.FieldByName('ServerQuery').AsString;
                    lastRecord := fnxQuery.FieldByName('lastRecord').AsInteger;
                    totalRecords := fnxQuery.FieldByName('totalRecords').AsInteger;
                    _RemoteUploadVersion := fnxQuery.FieldByName('uploadVer').AsInteger;
                    _SendSummary := fnxQuery.FieldByName('send_summary').AsBoolean;

                    GLog.Log(self,[lcDebug],'RemoteQuery? fRemoteQueryId: ' + intToStr(_RemoteQueryId) +
                                            ' lastRecord: ' + intToStr(lastRecord) +
                                            ' ServerOid: ' + _ServerOid +
                                            ' totalRecords: ' + intToStr(totalRecords) +
                                            ' remoteUploadVersion: ' + intToStr(_RemoteUploadVersion) );

                    if (lastRecord = 0) and (totalRecords = 0) and ( fRemoteUploadVersion>0) then begin
                        // new table entry
                        GLog.Log(self,[lcDebug],'RemoteQuery: new table entry.');
                        setRemoteQueryStatus(kRemoteQueryStatusUnfinished);
                        break;
                    end else
                    if lastRecord > totalRecords then begin
                        setRemoteQueryStatus(kRemoteQueryStatusUnconsistent);
                        GLog.Log(self,[lcDebug],'RemoteQuery: lastRecord > totalRecords');
                    end else
                    if (lastRecord = totalRecords) then begin
                        setRemoteQueryStatus(kRemoteQueryStatusFinished);
                        GLog.Log(self,[lcDebug],'RemoteQuery: lastRecord = totalRecords');
                    end else begin
                        // achou um sem terminar
                        GLog.Log(self,[lcDebug],'RemoteQuery: achou um sem terminar.');
                        setRemoteQueryStatus(kRemoteQueryStatusUnfinished);
                        fLastRecordIDProcessed := lastRecord;
                        fRecCount := lastRecord + 1;
                        break;
                    end;
                    fnxQuery.Next;
                end;
            finally

                fnxQuery.Close;
                
                if fRemoteQueryStatus = kRemoteQueryStatusUnfinished then begin
                    fRemoteQueryId := _RemoteQueryId;
                    fServerOid := _ServerOid;
                    fServerQuery := _ServerQuery;
                    fSendSummary := _SendSummary;
                    fRemoteUploadVersion := _RemoteUploadVersion;
                    if not createAndPopulateRemoteQueryResult then
                        fRemoteQueryId := kNoId;
                end;
            end;

        except
            on e:exception do begin
                GLog.Log(self,[lcExcept], 'checkRemoteQuery => '+e.Message);
            end;
        end;

        GLog.Log(self,[lcDebug],'checkRemoteQuery end: '+ intToStr(lastRecord));

end;                             

function  TncUploadThread.createAndPopulateRemoteQueryResult: boolean;
var
    dict : TnxDataDictionary;
    queryHasRecords : boolean;
begin
    GLog.Log(self,[lcDebug],'createAndPopulateRemoteQueryResult start');
    result := false;

    if fRemoteQueryId > kNoID then begin
        fnxServerQuery.SQL.Text := '#T 0 ' + #13#10 + fServerQuery;
        try
            fnxServerQuery.Open;
            try
                queryHasRecords := fnxServerQuery.RecordCount > 0;
            finally
                fnxServerQuery.Close;
            end;
        except
            on e:exception do begin
                 if e is EnxDatabaseError then
                    GLog.Log(self,[lcExcept],'createAndPopulateRemoteQueryResult SQL ERROR preparing SERVER QUERY: >'+fServerQuery+'<');
                    GLog.Log(self,[lcExcept],'createAndPopulateRemoteQueryResult SQL ERROR preparing SERVER QUERY: '+e.Message);
                 exit;
            end;
        end;

        if queryHasRecords then begin
            dict := getRemoteControlQueryResultDict;
            if dict<>nil then
            try
                createRemoteQueryResult(dict);
                populateRemoteQueryResult;
            finally
                dict.free;
            end;
            result := true;
        end;

        GLog.Log(self,[lcDebug],'createAndPopulateRemoteQueryResult ends with hasrecords: '+ boolToStr(queryHasRecords, true));
    end else
        GLog.Log(self,[lcDebug],'CAN''T createAndPopulateRemoteQueryResult fRemoteQueryId=kNoID');

end;

function TncUploadThread.existsRemoteControlQuery: boolean;
begin
    result := fnxDatabase1.TableExists( kRemoteQuery_tablename,'') = true;
    GLog.Log(self,[lcDebug],'existsRemoteControlQuery => ' + boolToStr(result, true));
end;

function TncUploadThread.existsRemoteControlQueryResult: boolean;
begin
    result := fnxDatabase1.TableExists( kRemoteQueryResult_tablename + intToStr(fRemoteQueryId) ,'') = true;
    GLog.Log(self,[lcDebug],'existsRemoteControlQueryResult for ID: '+ inttostr(fRemoteQueryId) + ' => ' + boolToStr(result, true));
end;

procedure TncUploadThread.deleteFromRemoteControlQuery;
begin
    if existsRemoteControlQuery then begin

          fnxQuery.SQL.Text :=  'delete from "' + kRemoteQuery_tablename + '"';
          try
              fnxQuery.ExecSQL;
          except
              on e:exception do
                GLog.Log(self,[lcExcept], 'deleteFromRemoteControlQuery => '+e.Message);
          end;

    end;
    GLog.Log(self,[lcDebug],'deleteFromRemoteControlQuery');

end;

procedure TncUploadThread.deleteRemoteControlQueryResult;
begin
    if fRemoteQueryId > kNoID then begin
        fnxDatabase1.DeleteTable(kRemoteQueryResult_tablename + intToStr(fRemoteQueryId),'');
        GLog.Log(self,[lcDebug],'deleteRemoteControlQueryResult for ID: '+ inttostr(fRemoteQueryId));
    end else
        GLog.Log(self,[lcDebug],'CAN''T deleteRemoteControlQueryResult fRemoteQueryId=kNoID');
end;

function TncUploadThread.getRemoteControlQueryResultLastID: integer;
begin
    result := 0;
    if existsRemoteControlQueryResult then begin

          fnxQuery.SQL.Text :=  'select max("queryItemID") from "' + kRemoteQueryResult_tablename + intToStr(fRemoteQueryId) + '"';
          try
              fnxQuery.Open;
              result := fnxQuery.Fields[0].AsInteger;
              fnxQuery.Close;
          except
              on e:exception do
                GLog.Log(self,[lcExcept], 'getRemoteControlQueryResultLastID => '+e.Message);
          end;

    end;
    GLog.Log(self,[lcDebug],'getRemoteControlQueryResultLastID for ID: '+ inttostr(fRemoteQueryId) + ' => ' + intToStr(result));
end;

function TncUploadThread.getRemoteControlQueryResultDict: TnxDataDictionary;
begin
    result := nil;
    if trim(fServerQuery)='' then begin
        GLog.Log(self,[lcDebug],'CAN''T getRemoteControlQueryResultDict NO fServerQuery');
        exit;
    end;

    fnxServerQuery.SQL.Text := '#T 0 ' + #13#10 + fServerQuery;
    fnxServerQuery.Open;
    try
        fnxServerQuery.First;
        result := TnxDataDictionary.create;
        result.assign(fnxServerQuery._Dictionary);
    finally
        fnxServerQuery.Close;
    end;


    GLog.Log(self,[lcDebug],'getRemoteControlQueryResultDict  => ' + boolToStr(result<>nil, true));
end;


procedure TncUploadThread.createRemoteQueryResult(var aDict :TnxDataDictionary);
begin
    GLog.Log(self,[lcDebug],'createRemoteQueryResult start');

    if fRemoteQueryId = kNoID then begin
        GLog.Log(self,[lcDebug],'CAN''T createRemoteQueryResult fRemoteQueryId=kNoID');
        exit;
    end;
    if aDict=nil then begin
        GLog.Log(self,[lcDebug],'CAN''T createRemoteQueryResult Dict=nil');
        exit;
    end;

    if fnxDatabase1.TableExists( kRemoteQueryResult_tablename + intToStr(fRemoteQueryId) ,'')  then begin
        GLog.Log(self,[lcDebug],kRemoteQueryResult_tablename + intToStr(fRemoteQueryId) + ' Already Exists');
        exit;
    end;



    if fnxDatabase1.TableExists( kUploadTempTablename ,'')  then
         fnxDatabase1.DeleteTable( kUploadTempTablename ,'');


    fnxServerQuery.SQL.Text := '#T 0 ' + #13#10 + fServerQuery;
    fnxServerQuery.Open;
    try
        GLog.Log(self,[lcDebug],'fnxServerQuery recordcount '+inttostr(fnxServerQuery.RecordCount));
        fnxServerQuery.First;

        fnxDatabase1.CreateTable(true, kUploadTempTablename , '', aDict,  tsTempGlobal);
        nxCheck(fnxDatabase1.GetDataDictionaryEx( kUploadTempTablename , '', aDict));

        with aDict.FieldsDescriptor do begin
           AddField('queryItemID', '', nxtAutoInc, 10, 0, False);
           if aDict.GetFieldFromName('RecVer')=-1 then
                AddField('RecVer', '', nxtWord32, 0, 0, False);
            with AddField('uploadVer', '', nxtByte, 3, 0, False) do
              with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
                AsVariant := 0;
        end;

        with aDict.EnsureIndicesDescriptor do begin

            if aDict.GetFieldFromName('ID')>-1 then
            with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
              Add(aDict.GetFieldFromName('ID'));

            with AddIndex('IqueryItemID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
              Add(aDict.GetFieldFromName('queryItemID'));

            with AddIndex('IuploadVer', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                Add(aDict.GetFieldFromName( 'uploadVer' ));

            with AddIndex('IRecVer', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                Add(aDict.GetFieldFromName('RecVer'));

        end;

        fnxDatabase1.CreateTable(true, kRemoteQueryResult_tablename  + intToStr(fRemoteQueryId), '', aDict,  tsPersistent);
        fnxDatabase1.DeleteTable( kUploadTempTablename ,'');

    except
        on e:exception do begin
            GLog.Log(self,[lcExcept],'createRemoteQueryResult: '+e.Message);
        end;
    end;
    fnxServerQuery.Close;

    GLog.Log(self,[lcDebug],'createRemoteQueryResult end');
    GLog.ForceLogWrite;

end;

// copy values from fnxServerQuery to fnxAllRecordsTempTable
procedure TncUploadThread.populateRemoteQueryResult;
var
    i, lastRecord, recordCount: integer;
begin

    GLog.Log(self,[lcDebug],'populateRemoteQueryResult start fRemoteQueryId: '+intToStr(fRemoteQueryId));

    if fLastRecordIDProcessed>0 then begin
        GLog.Log(self,[lcDebug],'populateRemoteQueryResult for fRemoteQueryId: '+intToStr(fRemoteQueryId) + ' DO NOT because of fLastRecordIDProcessed>0');
        exit;
    end;

    lastRecord := getRemoteControlQueryResultLastID;
    fnxAllRecordsTempTable.TableName := kRemoteQueryResult_tablename + intToStr(fRemoteQueryId);
    fnxAllRecordsTempTable.IndexName := 'IqueryItemID';
//    fnxAllRecordsTempTable.Filter := 'queryItemID>'+inttostr(lastRecord);
//    fnxAllRecordsTempTable.FilterType := ftSqlWhere;
//    fnxAllRecordsTempTable.Filtered := true;
    fnxAllRecordsTempTable.Filtered := false;
    fnxAllRecordsTempTable.Open;
    fnxAllRecordsTempTable.Last;

    fnxServerQuery.SQL.Text := '#T 0 ' + #13#10 + fServerQuery;
    fnxServerQuery.Open;
    try
        recordCount := 0;

        while not fnxServerQuery.Eof do begin

            sleep(5);
            if recordCount < lastRecord then begin
                if recordCount mod 500 = 0 then begin
                    GLog.Log(self,[lcDebug],'Skipped '+inttostr(recordCount));
                    GLog.ForceLogWrite;
                end;
                fnxServerQuery.Next;
                inc(recordCount);
                sleep(5);
                continue;
            end;

            fnxAllRecordsTempTable.Append;
            for i:=0 to fnxServerQuery.FieldCount-1 do begin

                if fnxServerQuery.FieldList[i].isNull then continue;
                if fnxServerQuery.FieldList[i].isBlob then
                    fnxAllRecordsTempTable.FieldList[i].AsString := fnxServerQuery.FieldList[i].AsString
                else
                    fnxAllRecordsTempTable.FieldList[i].Value :=  fnxServerQuery.FieldList[i].Value;
            end;

            fnxAllRecordsTempTable.Post;
            inc(recordCount);
            fnxServerQuery.Next;

            if recordCount mod 500 = 0 then begin
                GLog.Log(self,[lcDebug],'Copiados '+inttostr(recordCount));
                GLog.ForceLogWrite;
            end;

        end;

        fAllRecordsServerQueryRecordCount := fnxServerQuery.RecordCount;
        GLog.Log(self,[lcDebug],'Copiando tabelas fim, recordcount '+inttostr(fnxAllRecordsTempTable.RecordCount));

    except
        on e:exception do begin
            GLog.Log(self,[lcExcept],'fnxAllRecordsTempTable.Open '+e.Message);
        end;
    end;

    fnxAllRecordsTempTable.Close;
    fnxServerQuery.Close;

    updateRemoteQueryTotalRecords;

    GLog.Log(self,[lcDebug],'populateRemoteQueryResult end');

end;


function TncUploadThread.loadRemoteQueryResultToMemTable: boolean;
var
    hasTable : boolean;
begin

    GLog.Log(self,[lcDebug],'loadRemoteQueryResultToMemTable start for id: '+ intToStr(fRemoteQueryId));

    result := false;
    hasTable := existsRemoteControlQueryResult;
    if hasTable then
    try
        fnxAllRecordsTempTable.TableName := kRemoteQueryResult_tablename + intToStr(fRemoteQueryId);
        fnxAllRecordsTempTable.IndexName := 'IqueryItemID';
        fnxAllRecordsTempTable.Filter := 'uploadVer<'+inttostr(fRemoteUploadVersion)+' and queryItemID>'+inttostr(fLastRecordIDProcessed);
        fnxAllRecordsTempTable.FilterType := ftSqlWhere;
        fnxAllRecordsTempTable.Filtered := true;
        fnxAllRecordsTempTable.Open;
        try
            fnxAllRecordsTempTable.First;

            fKbmMemBlockRecordsTable.EmptyTable;
            fKbmMemBlockRecordsTable.CreateTableAs(fnxAllRecordsTempTable,[mtcpoStructure,mtcpoProperties]);
            fKbmMemBlockRecordsTable.Open;
            fKbmMemBlockRecordsTable.LoadFromDataSet(fnxAllRecordsTempTable,[]);
            fKbmMemBlockRecordsTable.First;
            result := true;
            GLog.Log(self,[lcDebug],'fKbmMemBlockRecordsTable recordCount '+inttostr(fKbmMemBlockRecordsTable.recordCount));

            fAllRecordsServerQueryRecordCount := fnxAllRecordsTempTable.RecordCount + fLastRecordIDProcessed;

       finally
            fnxAllRecordsTempTable.Close;
        end;

    except
       on e: EnxDatabaseError do begin
           GLog.Log(self,[lcExcept],'open table exception class: '+e.ClassName);
           GLog.Log(self,[lcExcept],'open table exception message: '+e.Message);
       end;
    end;

    GLog.Log(self,[lcDebug],'loadRemoteQueryResultToMemTable end with hasTable: '+boolToStr(hasTable,true));
end;

function TncUploadThread.injectFkUser: string;
begin
  result :=
     StringOfChar(' ', (findentlevel + 2)* fIndentStep) +
        '"_user":"'+ fEmail +'",' +
        fNewLine;
end;


procedure TncUploadThread.doBlockUpload;
var
    RecordsInRequest, PostId : integer;
    //sl : TStringList;
    excludedFields : TStringList;
begin
        GLog.Log(self,[lcDebug],'doBlockUpload start');
        fRecCount := 0;
        fIndentlevel := 0;
        RecordsInRequest := 0;
        PostId := 0;
        excludedFields := TStringList.create;
        excludedFields.Add('RecVer');
        excludedFields.Add('uploadVer');

        try

            fStartDT := now;

             while not lastBlockRecord do begin

                fJsonStr := jsonHeader(fIndentlevel, fEmail);


                while RecordsInRequest < fRecordsByRequest do begin

                    if lastBlockRecord then break;

                    fJsonStr := fJsonStr +
                        recordToJson(fKbmMemBlockRecordsTable, fIndentlevel, fEmail, injectFkUser, excludedFields) +
                        ',' + fNewLine;

                    fQueryItemIDsList.Add( fKbmMemBlockRecordsTable.FieldByName( 'queryItemID' ).AsString);

                    fKbmMemBlockRecordsTable.Next;

                    fAllRecordsCount := fAllRecordsCount + 1;
                    RecordsInRequest := RecordsInRequest + 1;
                    fRecCount := fRecCount + 1;

                    sleep(5);
                end;

                if fQueryItemIDsList.Count>0 then begin
                    fFirstID := strtoint(fQueryItemIDsList[0]);
                    fLastRecordIDProcessed := strtoint(fQueryItemIDsList[fQueryItemIDsList.Count-1]);
                end else begin
                    fFirstID := 0;
                    fLastRecordIDProcessed := 0;
                end;
                GLog.Log(self,[lcDebug],'fLastRecord: '+inttostr(fLastRecordIDProcessed));

                fJsonStr := copy(fJsonStr, 1, length(fJsonStr)-length(fNewLine)-1);
                fJsonStr := jsonFooter(fIndentlevel, fJsonStr);

//                sl := TStringList.Create;
//                sl.Text := fJsonStr;
//                sl.SaveToFile('c:\pp.json');
//                sl.free;

                PostId := PostId + 1;
                fPostFatalError := false;

                fAtlasPost.PaylodSecret := fPayloadSecret;
                fAtlasPost.Webhook := kWebhookPostResults;
                fAtlasPost.OnResponse := postOnResultsResponse;
                fAtlasPost.JsonString := fJsonStr;
                fAtlasPost.Run(PostId);

                RecordsInRequest := 0;
                fQueryItemIDsList.Clear;

                GLog.Log(self,[lcDebug],'RecCount: '+inttostr(fRecCount));
                GLog.ForceLogWrite;

                if fPostFatalError then begin
                    GLog.Log(self,[lcDebug],'Fatal Error in Server Response: '+ fPostFatalMessage);
                    exit;
                end;

                if lastBlockRecord then break;

                delay(self, fParams.InterBlockDelayS , 0.5, 'inter block delay');

            end;

            GLog.Log(self,[lcDebug],'MaxRecords: '+inttostr(fMaxRecords));
            GLog.Log(self,[lcDebug],'Rec Count: '+inttostr(fRecCount));

            //  closeFile(memLogFile);

        except
            on e:exception do begin
                 GLog.Log(self,[lcExcept], e.Message);
            end;
        end;
        excludedFields.Free;

        GLog.Log(self,[lcDebug],'doBlockUpload end');

end;

procedure TncUploadThread.doResumoUpload;
var
//     sl: TStringList;
     excludedFields: TStringList;
begin

        GLog.Log(self,[lcDebug],'doResumoUpload start');
        excludedFields := TStringList.create;
        excludedFields.Add('RecVer');
        excludedFields.Add('uploadVer');
        excludedFields.Add('ID');
        try

            fnxQuery.SQL.Text :=  'select '+
                                    ' "ID", "dataHora", "firstRecord", "lastRecord", "Records", "matchedCount", "modifiedCount", "upsertedId", "ms", "upload_error", "upload_errormsg"'+
                                    ' from "' + kRemoteQueryPost_tablename + '"' +
                                    ' where "fk_remoteQuery"=:fk_remoteQuery'+
                                    ' order by "ID"';
            try
                fnxQuery.ParamByName('fk_remoteQuery').AsInteger := fRemoteQueryId;
                fnxQuery.Open;

                fKbmMemResultTable.EmptyTable;
                fKbmMemResultTable.CreateTableAs(fnxQuery,[mtcpoStructure,mtcpoProperties]);
                fKbmMemResultTable.AutoIncMinValue := 1;

                with fKbmMemResultTable.FieldDefs.AddFieldDef do begin
                  Name      := 'queryItemID';
                  DataType  := ftAutoInc;
                  Size      := 0;
                  Precision := 0;
                end;

                fKbmMemResultTable.Open;
                fKbmMemResultTable.LoadFromDataSet(fnxQuery,[]);
                fKbmMemResultTable.First;
                GLog.Log(self,[lcDebug],'fKbmMemResultTable recordCount '+inttostr(fKbmMemResultTable.recordCount));

            finally
                fnxQuery.Close;
            end;

        except
           on e: EnxDatabaseError do begin
               GLog.Log(self,[lcExcept],'open table exception class: '+e.ClassName);
               GLog.Log(self,[lcExcept],'open table exception message: '+e.Message);
           end;
        end;

//        sl := TStringList.create();
        fIndentlevel := 0;
        try

            fJsonStr := jsonHeader(fIndentlevel, fEmail);

            while not fKbmMemResultTable.eof do begin

                    fJsonStr := fJsonStr +
                        recordToJson(fKbmMemResultTable, fIndentlevel, fEmail, injectFkUser, excludedFields) +
                        ',' + fNewLine;

                    fKbmMemResultTable.Next;
                    sleep(5);
            end;

            fJsonStr := copy(fJsonStr, 1, length(fJsonStr)-length(fNewLine)-1);
            fJsonStr := jsonFooter(fIndentlevel, fJsonStr);

//            sl.Text := fJsonStr;
//            sl.SaveToFile('c:\pp.json');

            fPostFatalError := false;

            fAtlasPost.PaylodSecret := fPayloadSecret;
            fAtlasPost.Webhook := kWebhookPostSummary;
            fAtlasPost.OnResponse := postOnSummaryResponse;
            fAtlasPost.JsonString := fJsonStr;
            fAtlasPost.Run(0);

            if fPostFatalError then begin
                GLog.Log(self,[lcDebug],'Fatal Error in Server Response: '+ fPostFatalMessage);
                exit;
            end;


        except
            on e:exception do begin
                 GLog.Log(self,[lcExcept], e.Message);
            end;
        end;
        //sl.free;
        excludedFields.free;
        
        GLog.Log(self,[lcDebug],'doResumoUpload end');

end;

procedure TncUploadThread.postOnSummaryResponse(Sender: TObject; aId,
  aResponseCode: integer; aJsonQueryString, aJsonResponseString: string;
  aExecTime: int64);
var
    jsonResponse : TJsonObject;
begin
    GLog.Log(self,[lcDebug],'postOnSummaryResponse ResponseCode: ' + inttostr(aResponseCode) );
    if aResponseCode = 200 then begin
        jsonResponse := TJsonObject.create(aJsonResponseString);
        try
            GLog.Log(self,[lcDebug],'postOnSummaryResponse json: ' + jsonResponse.toString(4) );
        finally
           jsonResponse.Free;
        end;
    end;
end;


procedure TncUploadThread.postOnResultsResponse(Sender: TObject; aId:integer; aResponseCode:integer; aJsonQueryString, aJsonResponseString: string; aExecTime: int64);
var
    jsonResponse : TJsonObject;
begin

    aJsonResponseString := stringReplace(aJsonResponseString,'\"','"',[rfReplaceAll]);
    GLog.Log(self,[lcDebug],'postOnResultsResponse ResponseCode: ' + inttostr(aResponseCode) );

    if aResponseCode = 200 then begin
        jsonResponse := TJsonObject.create(aJsonResponseString);
        try
            if jsonResponse.has('Error') then begin

                if jsonResponse.getBoolean('Error')=true then begin

                    fPostFatalError := true;
                     if jsonResponse.has('ErrMsg') then begin
                        fPostFatalMessage := jsonResponse.getString('ErrMsg');
                        fPostFatalMessage := stringReplace( fPostFatalMessage ,'"', '''''', [rfReplaceAll]);
                    end else begin
                        fPostFatalMessage := '';
                    end;
                end;
                updateRemoteQueryPost(fRemoteQueryId, fFirstID, fLastRecordIDProcessed, fQueryItemIDsList.CommaText, '', aExecTime, true, fPostFatalMessage );

            end else
                // Resposta bem sucedida
                updateRemoteQueryPost(fRemoteQueryId, fFirstID, fLastRecordIDProcessed, fQueryItemIDsList.CommaText, aJsonResponseString, aExecTime, false, ''  );

        finally
            jsonResponse.Free;
        end;

    end else
       updateRemoteQueryPost(fRemoteQueryId, fFirstID, fLastRecordIDProcessed, fQueryItemIDsList.CommaText, '', aExecTime, true, aJsonResponseString );

    updateRemoteQuery;

    GLog.Log(self,[lcDebug],'postOnResultsResponse remoteQueryId: ' + inttostr(fRemoteQueryId) + ' from rec '+inttostr(fFirstID) + ' to rec ' + inttostr(fLastRecordIDProcessed)+
                            ' error: '+boolToStr(fPostFatalError,true)+' '+fPostFatalMessage);
    GLog.Log(self,[lcDebug],'postOnResultsResponse Records: '+fQueryItemIDsList.CommaText);

    GLog.ForceLogWrite;

end;

function TncUploadThread.newRemoteQuery: integer;
begin

      result := kNoID;

      if trim(fServerOidToProcess)='' then begin
          GLog.Log(self,[lcDebug],'CAN''T newRemoteQuery NO fServerOidToProcess');
          exit;
      end;

      if trim(fServerQuery)='' then begin
          GLog.Log(self,[lcDebug],'CAN''T newRemoteQuery NO fServerQuery');
          exit;
      end;


        fnxServerQuery.SQL.Text := '#T 0 ' + #13#10 + fServerQuery;
        try
            fnxServerQuery.Prepare;
        except
            on e:exception do begin
                 if e is EnxDatabaseError then
                    GLog.Log(self,[lcExcept],'CAN''T newRemoteQuery SQL ERROR preparing SERVER QUERY: >'+fServerQuery+'<');
                 exit;
            end;
        end;



      fnxQuery.SQL.Text :=  'insert into "' + kRemoteQuery_tablename + '"'+
          ' (datahora, ServerQuery, ServerOid, uploadVer, send_summary) VALUES (:datahora, :ServerQuery, :ServerOid, :uploadVer, :send_summary)';
      fnxQuery.ParamByName('datahora').AsDateTime := now;
      fnxQuery.ParamByName('ServerQuery').AsString := fServerQuery;
      fnxQuery.ParamByName('ServerOid').AsString := fServerOidToProcess;
      fnxQuery.ParamByName('uploadVer').AsInteger := fRemoteUploadVersion;
      fnxQuery.ParamByName('send_summary').AsBoolean := fSendSummary;

      //GLog.Log(self,[lcDebug], 'newRemoteQuery -> ' + fnxQuery.SQL.Text );

      try
          fnxQuery.ExecSql;

          fnxQuery.SQL.Text :=  'select max("ID") from "' + kRemoteQuery_tablename + '"';
          fnxQuery.Open;

          result := fnxQuery.Fields[0].AsInteger;
          //GLog.Log(self,[lcDebug], 'insert into RemoteQuery 1d: ' + inttostr( result ));
          fnxQuery.Close;
      except
          on e:Exception do
              GLog.Log(self,[lcExcept], 'newRemoteQuery ' + e.Message);
      end;

      GLog.Log(self,[lcDebug],'newRemoteQuery id: '+ inttostr(result) );

end;


function TncUploadThread.IsNewServerOid: boolean;
begin

    result := false;
    if trim(fServerOidToProcess)='' then begin
          GLog.Log(self,[lcDebug],'IsNewServerOid? NO fServerOidToProcess');
          exit;
    end;

    fnxQuery.SQL.Text :=  'select ServerOid from "' + kRemoteQuery_tablename + '" where ServerOid=:ServerOid';
    fnxQuery.ParamByName('ServerOid').AsString := fServerOidToProcess;
    fnxQuery.Open;
    result := fnxQuery.recordcount=0;
    fnxQuery.Close;

    GLog.Log(self,[lcDebug],'IsNewServerOid? '+ boolToStr(result, true) );

end;

procedure TncUploadThread.updateRemoteQuery;
begin
      fnxQuery.SQL.Text :=  '#T 0 ' + #13#10 + 'update "' + kRemoteQuery_tablename + '"'+
          ' set lastRecord=:lastRecord '+
          ' where ID=:id';
      fnxQuery.ParamByName('lastRecord').AsInteger := fLastRecordIDProcessed;
      //fnxQuery.ParamByName('uploadVer').AsInteger := fRemoteUploadVersion;
      fnxQuery.ParamByName('id').AsInteger := fRemoteQueryId;

      GLog.Log(self,[lcDebug], 'updateRemoteQuery on id:'+inttostr(fRemoteQueryId)+' -> lastRecord: ' + inttostr(fLastRecordIDProcessed));

      try
          fnxQuery.ExecSql;
      except
          on e:Exception do
              GLog.Log(self,[lcExcept], 'updateRemoteQuery ' + e.Message);
      end;


end;

procedure TncUploadThread.updateRemoteQueryTotalRecords;
begin

      fnxQuery.SQL.Text :=  '#T 0 ' + #13#10 + 'update "' + kRemoteQuery_tablename + '"'+
          ' set totalRecords=:totalRecords '+
          ' where ID=:id';
      fnxQuery.ParamByName('totalRecords').AsInteger := fAllRecordsServerQueryRecordCount;
      fnxQuery.ParamByName('id').AsInteger := fRemoteQueryId;

      GLog.Log(self,[lcDebug], 'updateRemoteQueryTotalRecords on id:'+inttostr(fRemoteQueryId)+' -> value: ' + inttostr(fAllRecordsServerQueryRecordCount));

      try
          fnxQuery.ExecSql;
      except
          on e:Exception do
              GLog.Log(self,[lcExcept], 'updateRemoteQuery ' + e.Message);
      end;

end;

procedure TncUploadThread.updateRemoteQueryPost(aRemoteQueryId, aFirstRecord,
  aLastRecord: integer; aRecords, aJsonResponseString: string; aExecTime: dword;  aUpload_err: boolean;
  aUploadErrorString: string);
var
    matchedCount : integer;
    modifiedCount : integer;
    upsertedId : string;
    jsonObj: TJsonObject;

begin

      matchedCount := 0;
      modifiedCount := 0;
      upsertedId := '';
      if aJsonResponseString<>'' then begin
          jsonObj := TJsonObject.create(aJsonResponseString);
          try
              if jsonObj.has('matchedCount') then
                  matchedCount := strtoint( jsonObj.getJSONObject('matchedCount').getString('$numberInt'));
              if jsonObj.has('modifiedCount') then
                  modifiedCount := strtoint( jsonObj.getJSONObject('modifiedCount').getString('$numberInt'));
              if jsonObj.has('upsertedId') then
                  upsertedId := jsonObj.getJSONObject('upsertedId').getString('$oid');
          except
              on e: exception do begin
                  GLog.Log(self,[lcExcept], 'updateRemoteQueryPost ReadJson: '+ e.Message);
              end;
          end;
      end;

      GLog.Log(self,[lcDebug], 'updateRemoteQueryPost');
      try
          fnxQuery.SQL.Text :=  'insert into "' + kRemoteQueryPost_tablename + '"'+
            ' (dataHora, fk_RemoteQuery, firstRecord, lastRecord, Records, matchedCount, modifiedCount, upsertedId, ms, upload_error, upload_errormsg) VALUES '+
            ' (:datahora, :aRemoteQueryId, :aFirstRecord, :aLastRecord, :aRecords, :matchedCount, :modifiedCount, :upsertedId, :aExecTime, :aUpload_err, :aUploadErrorString )';

          fnxQuery.ParamByName('datahora').AsDateTime := now;
          fnxQuery.ParamByName('aRemoteQueryId').AsInteger := aRemoteQueryId;
          fnxQuery.ParamByName('aFirstRecord').AsInteger := aFirstRecord;
          fnxQuery.ParamByName('aLastRecord').AsInteger := aLastRecord;
          fnxQuery.ParamByName('aRecords').AsString := aRecords;

          fnxQuery.ParamByName('matchedCount').AsInteger := matchedCount;
          fnxQuery.ParamByName('modifiedCount').AsInteger := modifiedCount;
          fnxQuery.ParamByName('upsertedId').AsString := upsertedId;

          fnxQuery.ParamByName('aUpload_err').AsBoolean := aUpload_err;
          fnxQuery.ParamByName('aExecTime').AsInteger := aExecTime;
          fnxQuery.ParamByName('aUploadErrorString').AsString := aUploadErrorString;

          GLog.Log(self,[lcDebug], 'updateRemoteQueryPost -> ' + fnxQuery.SQL.Text );

          fnxQuery.ExecSql;
      except
          on e:Exception do
              GLog.Log(self,[lcExcept], 'updateRemoteQueryPost ' + e.Message);
      end;

      fnxQuery.SQL.Text :=  '#T 0 ' + #13#10 + 'update "' + kremoteQueryResult_tablename +intToStr(fRemoteQueryId)+ '"'+
                                  ' set uploadVer=:uploadVer' +
                                  ' where queryItemID' +
                                  ' in ('+fQueryItemIDsList.CommaText+')';
      fnxQuery.ParamByName('uploadVer').AsInteger := fRemoteUploadVersion;
      try
          fnxQuery.ExecSQL;
      except
          on e:Exception do
               GLog.Log(self,[lcDebug], 'updateRemoteQueryPost -> ' + e.Message);
      end;

end;




end.
