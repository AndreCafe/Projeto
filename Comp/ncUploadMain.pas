unit ncUploadMain;

interface

uses
  SysUtils, Classes, ExtCtrls, uLogs, Messages, Windows,
  uJSON, nxdb, nxllComponent, nxsdServerEngine, nxreRemoteServerEngine, DB,
  IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  nxsdDataDictionary, nxsdTypes, IdCookieManager, IdCookie,
  ncUploadPost, dateutils, kbmMemTable, nxdbBase, ncUploadGetParams,
  nxllException, ncClassesBase, ncTableDefs;

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

    //fFisrtRemoteParametersCall : boolean;
    fStartDT : TDatetime;
    fEmail: string;
    fJsonStr : string;
    fRemoteQueryStatus : integer;
    fRemoteQueryId,
    fIndentlevel : integer;
    fFirstID,
    fLastID,
    fRecCount: integer;
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
    
    fIndentStep: integer;
    fNewLine : string;
    fPayloadSecret : string;
    fRecordsByRequest : integer;
    fMaxRecords : integer;
    fInterBlockDelay : integer;
    FTerminated: Boolean;
    fNxSE: TnxBaseServerEngine;

    function escape(s: widestring): widestring;
    //function unescape(s: widestring): widestring;
    function jsonFooter(var indentLevel: integer; jsonString: string): string;
    function jsonHeader(var indentLevel: integer; email: string): string;
    function recordToJson(indentlevel: integer; email:string): string;
    procedure postOnResponse(Sender: TObject; aId, aResponseCode: integer; aJsonQueryString, aJsonResponseString: string; aExecTime: int64);
    function lastBlockRecord: boolean;
    procedure SetServerEngine(se: TnxBaseServerEngine);
    procedure doBlockUpload;
    procedure openDB;
    procedure closeDB;
    function loadAllRecordsTempTableToMemTable: boolean;
    procedure createRemoteQuery;
    procedure createRemoteQueryResult;
    procedure populateRemoteQueryResult;
    procedure createNxDbOjects;
    procedure freeNxDbOjects;
    function newRemoteQuery: integer;
    procedure updateRemoteQuery;
    procedure updateRemoteQueryTotalRecords;
    procedure updateRemoteQueryPost(aRemoteQueryId, aFirstRecord, aLastRecord: integer; aRecords, insertedIds: string; aExecTime: dword; aUpload_err: boolean; aUploadErrorString, aJsonSource:string );
    function  checkRemoteQuery: integer;
    procedure getRemoteParameters;
    procedure setPrivateVariables;
    { Private declarations }
  protected
     procedure Execute; override;
  public
    property Email: string read fEmail write fEmail;
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

uses  ncDMserv, strutils, ncUploadConst, ncUploadDelay, DCPbase64;

//const kNothingToDo = -1;
const kCheckAgain = 0;
const kRemoteQuery_tablename = '_RemoteQuery';
const kRemoteQueryPost_tablename = '_RemoteQueryPost';
const kUploadTempTablename = '<upload_temp>';

const  kRemoteQueryStatusUnchecked = 0;
const  kRemoteQueryStatusNotFound  = 1;
const  kRemoteQueryStatusUnfinished = 2;
const  kRemoteQueryStatusUnconsistent = 3;



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

     fRemoteQueryStatus :=   kRemoteQueryStatusUnchecked;

     GLog.Log(self,[lcDebug],'createNxDbOjects end');
end;


procedure TncUploadThread.freeNxDbOjects;
begin
    GLog.Log(self,[lcDebug],'freeNxDbOjects start');
    fnxServerQuery.free;
    fnxQuery.free;
    fnxSession1.free;
    fnxDatabase1.free;
    fnxAllRecordsTempTable.free;
    GLog.Log(self,[lcDebug],'freeNxDbOjects end');
end;

constructor TncUploadThread.Create;
begin
     inherited Create(true);

     fIndentStep :=  0;    // tab value for pretty json
     fIndentStep :=  4;    // tab value for pretty json
     fNewLine := '';       // newline valur for pretty json
     fNewLine := #13#10;       // newline valur for pretty json

     fAtlasPost := TncUploadPost.Create;
     fAtlasPost.OnResponse := postOnResponse;

     fQueryItemIDsList := TStringList.Create;
     createNxDbOjects;
     fKbmMemBlockRecordsTable := TKbmMemTable.Create(nil);
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

//function TncUploadThread.unescape(s:widestring):widestring;
//var
//    us: UCS4String;
//    i:integer;
//    rs : string;
//    isE : boolean;
//begin
//
//    rs := '';
//    us := WideStringToUCS4String(s);
//
//    //GLog.Log(self,[lcDebug], '>' + s);
//    isE := false;
//    for i:=0 to length(us) - 1 do begin
//
//        // if "\"
//        if (us[i] = 92) then begin
//            isE := true;
//            rs := rs + '\';
//        end else
//        if isE then begin
//            isE := false;
//            case us[i] of
//                34, 92, 47, 98, 102, 110, 114, 116 :
//                    rs := rs + char(us[i]);
//            else
//                rs := rs + 'u'+intToHex( us[i], 4);
//            end;
//        end else
//            if (us[i]>31) and (us[i]<128) then
//                rs := rs + char( us[i])
//            else
//            if us[i]<>0 then
//                rs := rs + '\u'+intToHex( us[i], 4);
//
//    end;
//
//    //GLog.Log(self,[lcDebug], '=' + rs);
//    result := rs;
//end;

// MongoDB Extended JSON (v2)
//
function TncUploadThread.recordToJson(indentlevel: integer; email:string):string;
var
    jsonstr, jsonval, payload : string;
    fldDef : TFieldDef;
    fd : TFieldDefs;
    fld : TField;
    i : integer;
    fs : TFormatSettings;
begin

    fs.DecimalSeparator := '.';
    fs.ThousandSeparator := ',';

    fd := fKbmMemBlockRecordsTable.FieldDefs;

//    jsonstr := StringOfChar(' ', indentlevel * fIndentStep) + '{' + fNewLine;
//    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
//                '"version": ' +  inttostr( fRemoteUploadVersion ) + ',' + fNewLine;
//    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
//                '"query": ' +  '"' + escape(fServerQuery) + '",' + fNewLine;
//    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
//                '"data": {' +  fNewLine;
//    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 2)* fIndentStep) +
//                '"email": ' +  '"' + escape( email) + '",' + fNewLine;

    jsonstr := StringOfChar(' ', indentlevel * fIndentStep) + '{' + fNewLine;

//    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
//                '"_id": "' +  fServerOid + '",' + fNewLine;
//    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
//                '"version": ' +  inttostr( fRemoteUploadVersion ) + ',' + fNewLine;
//    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
//                '"user": ' +  '"' + escape( email) + '",' + fNewLine;
//    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
//                '"responses": [' +  fNewLine;

    // Iterates fields
    for i := 0 to fd.Count - 1 do begin

        jsonval := '';
        fldDef := fd.Items[i];
        
        if  not(fldDef.Name='queryItemID') and
            not(fldDef.Name='RecVer') and
            not(fldDef.Name='uploadVer')
        then begin

            fld := fKbmMemBlockRecordsTable.FieldByName(fldDef.Name);

            if fld.IsNull = false then begin

               case fldDef.DataType of

                    ftInteger, ftWord, ftSmallint, ftLargeint, ftAutoInc :
                          jsonval :=
                              //inttostr( fld.AsInteger ) ;
                              '{ "$numberLong": "'+inttostr( fld.AsInteger ) + '"}';

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

                           jsonval :=  '"' + formatdatetime('yyyymmdd', fld.AsDateTime) + '"';
                             //'{ "$date": "' + formatdatetime('yyyy-mm-dd"T"hh:nn:ss.zzz', fld.AsDateTime) + 'Z"}';
                             //'{ "$date": "' + formatdatetime('yyyy-mm-dd"T"hh:nn:ss.zzz', fld.AsDateTime) + '-03:00" }';
                             //'{ "$date": ' + inttostr(dateutils.DateTimeToUnix(fld.AsDateTime)) + '}';

                     ftTimeStamp :

                           jsonval :=
                             '"' + formatdatetime('yyyy-mm-dd hh:nn:ss.z UTC', fld.AsDateTime) + '"';

                     ftFloat, ftCurrency :

                           jsonval := //floatToStr( fld.AsFloat, fs);
                              '{ "$numberDecimal": "'+floatToStr( fld.AsFloat, fs ) + '"}';


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
                                '{ "$binary": { "base64": "' +payload+ '", "subType": "05" }}';
                    end;

               end;

            end else begin

                           jsonval := 'null';

            end;

            jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 2)* fIndentStep) + '"' + fldDef.Name +'": '+jsonval;
            jsonstr := jsonstr + ',' + fNewLine;

        end;
    end;
    jsonstr := copy( jsonstr, 1, length(jsonstr) - length( fNewLine) - 1 );

//    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1) * fIndentStep) + ']'+fNewLine;
    jsonstr := jsonstr + fNewLine + StringOfChar(' ', indentlevel * fIndentStep) + '}';
    recordToJson := jsonstr;

//    GLog.Log(self,[lcDebug], 'recordToJson' + jsonstr);
//    GLog.ForceLogWrite;
end;

function TncUploadThread.jsonHeader(var indentLevel:integer; email: string): string;
begin
    result := '{' + fNewLine;
    indentlevel := 1;
    result := result + StringOfChar(' ', (indentlevel)* fIndentStep) +
                '"_id": { "$oid":"' +  fServerOid + '"},' + fNewLine;
    result := result + StringOfChar(' ', (indentlevel)* fIndentStep) +
                '"version": ' +  inttostr( fRemoteUploadVersion ) + ',' + fNewLine;
    result := result + StringOfChar(' ', (indentlevel)* fIndentStep) +
                '"user": ' +  '"' + escape( email) + '",' + fNewLine;
    result := result + StringOfChar(' ', (indentlevel)* fIndentStep) +
                '"responses": [' +  fNewLine;
    indentlevel := 2;
end;

function TncUploadThread.jsonFooter(var indentLevel:integer; jsonString: string): string;
begin
         indentlevel := indentlevel - 1;
         result := jsonString + fNewLine + StringOfChar(' ', indentlevel * fIndentStep)  + ']'+ fNewLine;
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
      if (fRemoteQueryStatus = kCheckAgain) or
      //if (fRemoteQueryStatus = kNothingToDo) or
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

procedure TncUploadThread.getRemoteParameters;
var
    getParams : TGetUploadParams;
begin

//      if fFisrtRemoteParametersCall then
//          fFisrtRemoteParametersCall := false;

      GLog.Log(self,[lcDebug],'init Params: '+fParams.asString);
      getParams := TGetUploadParams.Create;
      try
          getParams.PaylodSecret := fPayloadSecret;
          if not getParams.Run(Self) then
              exit;
          fParams.assign(getParams.Params);

//          if (not fFisrtRemoteParametersCall) and
//             (fRemoteQueryId = kNothingToDo) then begin
//              fRemoteQueryId := kCheckAgain;
//          end;

       finally
        getParams.Free;
      end;
      GLog.Log(self,[lcDebug],'getRemoteParameters: '+fParams.asString);

end;

procedure TncUploadThread.setPrivateVariables;
begin
        fMaxRecords := fParams.MaxRecords;
        fInterBlockDelay := fParams.InterBlockDelayM;
        fRecordsByRequest := fParams.RecordsByRequest;
        fRemoteUploadVersion := fParams.Version;
        fServerQuery := stringReplace(fParams.Query,'\"','"',[rfReplaceAll]);
        fServerOid :=  fParams.Oid;
        fFirstID := 0;
        fLastID := 0;
end;



procedure TncUploadThread.Execute;
begin
    try
        randomize;

        GLog.Log(self,[lcDebug],'UpLoad Thread start');


        //   memLogFileName := '.\logs\memLog_'+formatdatetime('yyyymmdd"_"hhnnss',now)+'.log';
        //   assignfile( memLogFile, memLogFileName );
        //   if fileexists(memLogFileName) then begin
        //       append(memLogFile);
        //   end else begin
        //       rewrite(memLogFile);
        //   end;
        //   writeln ( memLogFile, '"Tempo"; "#"; "http"; "ms"; "registros"');

        if not delay(self, kDefIniDelayM, 0, 'before run delay') then
           exit;

        openDB;
        getRemoteParameters;
        setPrivateVariables;

        while (not Terminated) do begin

            checkRemoteQuery;
            if fRemoteQueryId > 0 then
                loadAllRecordsTempTableToMemTable;


            if fRemoteQueryId > 0 then
                doBlockUpload;

            if not fPostFatalError then
                 if not(delay(self, fParams.MainDelayM , 0.3, 'main delay')) then
                     exit;

            if (fRemoteQueryId>0) and (fLastID>0) and (fLastID = fAllRecordsServerQueryRecordCount) then  begin

                GLog.Log(self,[lcDebug], 'Finalização ' );

                if fnxDatabase1.TableExists(kRemoteQueryResult_tablename + intToStr(fRemoteQueryId),'') then
                    fnxDatabase1.DeleteTable(kRemoteQueryResult_tablename + intToStr(fRemoteQueryId),'');

            end;


            getRemoteParameters;
            setPrivateVariables;
        end;


    finally

        closeDB;
        freeNxDbOjects;

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
function TncUploadThread.checkRemoteQuery: integer;
var
        lastUploadVer, lastRecord, totalRecords: integer;
begin

        GLog.Log(self,[lcDebug],'checkRemoteQuery start');

        fRemoteQueryStatus :=   kRemoteQueryStatusNotFound;

        //lastUploadVer := 0;
        fRemoteQueryId := kCheckAgain;
        fAllRecordsCount := 0;
        fAllRecordsServerQueryRecordCount := 0;
        lastRecord := 0;

        try
            fnxQuery.SQL.Text := 'Select "ID", "ServerOid", "uploadVer", "lastRecord", "totalRecords" from "' + kRemoteQuery_tablename +
                                 '" order by "uploadVer" asc';
            //fnxQuery.ParamByName('ServerQuery').AsString := fServerQuery;
            //fnxQuery.ParamByName('uploadVer').AsInteger := fRemoteUploadVersion;
            fnxQuery.Open;
            try
                while not fnxQuery.Eof do begin
                    fRemoteQueryId := fnxQuery.FieldByName('ID').AsInteger;
                    fServerOid := fnxQuery.FieldByName('ServerOid').AsString;
                    lastRecord := fnxQuery.FieldByName('lastRecord').AsInteger;
                    totalRecords := fnxQuery.FieldByName('totalRecords').AsInteger;
                    lastUploadVer := fnxQuery.FieldByName('uploadVer').AsInteger;

                    GLog.Log(self,[lcDebug],'RemoteQuery? fRemoteQueryId: ' + intToStr(fRemoteQueryId) +
                                            ' lastRecord: ' + intToStr(lastRecord) +
                                            ' ServerOid: ' + fServerOid +
                                            ' totalRecords: ' + intToStr(totalRecords) +
                                            ' lastUploadVer: ' + intToStr(lastUploadVer) );

                    if (lastRecord = 0) and (totalRecords = 0) and ( lastUploadVer = 0) then begin
                        // new table entry
                        GLog.Log(self,[lcDebug],'RemoteQuery: new table entry.');
                        //remoteQueryResult_tablename := kRemoteQueryResult_tablename + intToStr(fRemoteQueryId);
                        createRemoteQueryResult;
                        populateRemoteQueryResult;
                        fRemoteQueryStatus := kRemoteQueryStatusUnfinished;
                        break;
                    end else
                    if lastRecord = totalRecords then begin
                        //fRemoteQueryId := kNothingToDo;
                        fRemoteQueryId := kCheckAgain;
                        GLog.Log(self,[lcDebug],'RemoteQuery: lastRecord = totalRecords => kCheckAgain.');
                    end else
                    if lastRecord > totalRecords then begin
                        fRemoteQueryStatus :=   kRemoteQueryStatusUnconsistent;
                        GLog.Log(self,[lcDebug],'RemoteQuery: lastRecord > totalRecords => kRemoteQueryStatusUnconsistent.');
                    end else begin
                        // achou um sem terminar
                        GLog.Log(self,[lcDebug],'RemoteQuery: achou um sem terminar.');
                        // checar E tabela RemoteQueryResult

                        if not fnxDatabase1.TableExists( kRemoteQueryResult_tablename + intToStr(fRemoteQueryId) ,'') then begin
                            //remoteQueryResult_tablename := kRemoteQueryResult_tablename + intToStr(fRemoteQueryId);
                            createRemoteQueryResult;
                            populateRemoteQueryResult;
                        end;

                        if not fnxDatabase1.TableExists( kRemoteQueryResult_tablename + intToStr(fRemoteQueryId) ,'') then begin
                            fRemoteQueryStatus :=   kRemoteQueryStatusUnconsistent;
                            GLog.Log(self,[lcDebug],'RemoteQuery: ' + kRemoteQueryResult_tablename + intToStr(fRemoteQueryId) + ' não existe => kRemoteQueryStatusUnconsistent.');
                        end else begin
                            fRemoteQueryStatus :=   kRemoteQueryStatusUnfinished;
                            GLog.Log(self,[lcDebug],'RemoteQuery fLastID: ' + intToStr(fLastID) + ' => kRemoteQueryStatusUnfinished.');
                            fLastID := lastRecord;
                            break;
                        end;
                    end;
                    fnxQuery.Next;
                end;
            finally
                fnxQuery.Close;
            end;

        except
            on e:exception do begin
                GLog.Log(self,[lcExcept], fnxQuery.SQL.Text + ' => '+e.Message);
            end;
        end;


        createRemoteQuery;

        GLog.Log(self,[lcDebug],'checkRemoteQuery end: '+ intToStr(lastRecord));
        result := lastRecord;
end;


procedure TncUploadThread.createRemoteQuery;
begin

    GLog.Log(self,[lcDebug],'createRemoteQuery start fRemoteQueryId: '+ inttostr(fRemoteQueryId));

    //if fnxDatabase1.TableExists( remoteQueryResult_tablename ,'')  then
    //    fnxDatabase1.DeleteTable(remoteQueryResult_tablename,'');

    if fRemoteQueryId = kCheckAgain then begin
        fRemoteQueryId := newRemoteQuery;

        //remoteQueryResult_tablename := kRemoteQueryResult_tablename + intToStr(fRemoteQueryId);
        //GLog.Log(self,[lcDebug],'createRemoteQuery remoteQueryResult_tablename: '+ inttostr(fRemoteQueryId) + '  ' +remoteQueryResult_tablename);
        createRemoteQueryResult;
        populateRemoteQueryResult;
    end;

//    end else
//    if fRemoteQueryId > 0 then
//        remoteQueryResult_tablename := kRemoteQueryResult_tablename + intToStr(self.fRemoteQueryId);


    GLog.Log(self,[lcDebug],'createRemoteQuery end: '+ intToStr(fRemoteQueryId));
end;

procedure TncUploadThread.createRemoteQueryResult;
var
    Dict : TnxDataDictionary;
//    i1,i2,i3: integer;
//    nxWriter : TnxWriter;
//    ss : TStringStream;
//    s, s2: string;
begin
    GLog.Log(self,[lcDebug],'createRemoteQueryResult start');

    try

        if fnxDatabase1.TableExists( kUploadTempTablename ,'')  then
             fnxDatabase1.DeleteTable( kUploadTempTablename ,'');

        // create fnxAllRecordsTempTable from fnxServerQuery Dictionary
        fnxServerQuery.SQL.Text := '#T 0 ' + #13#10 + fServerQuery;
        fnxServerQuery.Open;
        try
            GLog.Log(self,[lcDebug],'fnxServerQuery recordcount '+inttostr(fnxServerQuery.RecordCount));
            fnxServerQuery.First;

            fnxDatabase1.CreateTable(true, kUploadTempTablename , '', fnxServerQuery._Dictionary,  tsTempGlobal);
            Dict := TnxDataDictionary.Create;
            try
                nxCheck(fnxDatabase1.GetDataDictionaryEx( kUploadTempTablename , '', Dict));

               // added 30/08/2019
                with Dict.FieldsDescriptor do begin
                   AddField('queryItemID', '', nxtAutoInc, 10, 0, False);
//                   if Dict.GetFieldFromName('ID')=-1 then
//                        AddField('ID', '', nxtWord32, 10, 0, False);
                   if Dict.GetFieldFromName('RecVer')=-1 then
                        AddField('RecVer', '', nxtWord32, 0, 0, False);
                    with AddField('uploadVer', '', nxtByte, 3, 0, False) do
                      with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
                        AsVariant := 0;
                end;

                with Dict.EnsureIndicesDescriptor do begin

                    if Dict.GetFieldFromName('ID')>-1 then
                    with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                      Add(Dict.GetFieldFromName('ID'));

                    with AddIndex('IqueryItemID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                      Add(Dict.GetFieldFromName('queryItemID'));

                    with AddIndex('IuploadVer', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                        Add(Dict.GetFieldFromName( 'uploadVer' ));

                    with AddIndex('IRecVer', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                        Add(Dict.GetFieldFromName('RecVer'));

                end;

//                with Dict.FieldsDescriptor do
//                for i1 := 0 to FieldCount - 1 do begin
//                    Glog.Log(Self, [lcDebug], FieldDescriptor[i1].ToString );
//                end;
//                with Dict.IndicesDescriptor do
//                for i1 := 0 to IndexCount - 1 do begin
//                    Glog.Log(Self, [lcDebug], inttostr(IndexDescriptor[i1].Number));
//                    Glog.Log(Self, [lcDebug], IndexDescriptor[i1].Name );
//                    Glog.Log(Self, [lcDebug], IndexDescriptor[i1].IndexEngine);
//                end;
//
//                glog.ForceLogWrite;

                fnxDatabase1.CreateTable(true, kRemoteQueryResult_tablename  + intToStr(fRemoteQueryId), '', Dict,  tsPersistent);

            finally
                Dict.Free;
            end;
            fnxDatabase1.DeleteTable( kUploadTempTablename ,'');

        finally
            fnxServerQuery.Close;
        end;

    except
        on e:exception do begin
            GLog.Log(self,[lcExcept],'createRemoteQueryResult: '+e.Message);
        end;
    end;

    GLog.Log(self,[lcDebug],'createRemoteQueryResult end');
    GLog.ForceLogWrite;

end;

// copy values from fnxServerQuery to fnxAllRecordsTempTable
procedure TncUploadThread.populateRemoteQueryResult;
var
    i, lastRecord, recordCount: integer;
begin

       GLog.Log(self,[lcDebug],'populateRemoteQueryResult start fRemoteQueryId: '+intToStr(fRemoteQueryId));

//       if fnxDatabase1.TableExists( kRemoteQueryResult_tablename ,'') and
//          (not fnxDatabase1.TableExists( remoteQueryResult_tablename ,''))  then
//            fnxDatabase1.RenameTable(kRemoteQueryResult_tablename, remoteQueryResult_tablename, '');

        fnxAllRecordsTempTable.TableName := kRemoteQueryResult_tablename + intToStr(fRemoteQueryId);
        fnxAllRecordsTempTable.IndexName := 'IqueryItemID';
        fnxAllRecordsTempTable.Filter := 'uploadVer<'+inttostr(fRemoteUploadVersion)+' and queryItemID>'+inttostr(fLastID);
        fnxAllRecordsTempTable.FilterType := ftSqlWhere;
        fnxAllRecordsTempTable.Filtered := false;

        lastRecord := 0;
        //if fRemoteQueryId = kCheckAgain then begin
            try

                fnxAllRecordsTempTable.Open;
                fnxServerQuery.Open;
                try
                    recordCount := 0;
                    while not fnxServerQuery.Eof do begin

                        sleep(5);
                        if recordCount < lastRecord then begin
                            if recordCount mod 1000 = 0 then begin
                                GLog.Log(self,[lcDebug],'Skipped '+inttostr(recordCount));
                                GLog.ForceLogWrite;
                            end;
                            fnxServerQuery.Next;
                            inc(recordCount);
                            sleep(5);
                            continue;
                        end;

                        fnxAllRecordsTempTable.Insert;
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

                        if recordCount mod 1000 = 0 then begin
                            GLog.Log(self,[lcDebug],'Copiados '+inttostr(recordCount));
                            GLog.ForceLogWrite;
                        end;

                    end;

                    fAllRecordsServerQueryRecordCount := fnxServerQuery.RecordCount;
                    GLog.Log(self,[lcDebug],'Copiando tabelas fim, recordcount '+inttostr(fnxAllRecordsTempTable.RecordCount));

                finally
                    fnxAllRecordsTempTable.Close;
                    fnxServerQuery.Close;
                end;

                updateRemoteQueryTotalRecords;
            except
                on e:exception do begin
                    GLog.Log(self,[lcExcept],'fnxAllRecordsTempTable.Open '+e.Message);
                end;
            end;

        //end;

        GLog.Log(self,[lcDebug],'populateRemoteQueryResult end');


end;


function TncUploadThread.loadAllRecordsTempTableToMemTable: boolean;
begin

    GLog.Log(self,[lcDebug],'loadAllRecordsTempTableToMemTable fstart '+ kRemoteQueryResult_tablename + intToStr(fRemoteQueryId));

    try
        fnxAllRecordsTempTable.TableName := kRemoteQueryResult_tablename + intToStr(fRemoteQueryId);
        fnxAllRecordsTempTable.IndexName := 'IqueryItemID';
        fnxAllRecordsTempTable.Filter := 'uploadVer<'+inttostr(fRemoteUploadVersion)+' and queryItemID>'+inttostr(fLastID);
        fnxAllRecordsTempTable.FilterType := ftSqlWhere;
        fnxAllRecordsTempTable.Open;
        try

            fnxAllRecordsTempTable.Filtered := true;
            fnxAllRecordsTempTable.First;

            fKbmMemBlockRecordsTable.EmptyTable;
            fKbmMemBlockRecordsTable.CreateTableAs(fnxAllRecordsTempTable,[mtcpoStructure,mtcpoProperties]);
            fKbmMemBlockRecordsTable.Open;
            fKbmMemBlockRecordsTable.LoadFromDataSet(fnxAllRecordsTempTable,[]);
            fKbmMemBlockRecordsTable.First;
            result := true;
            GLog.Log(self,[lcDebug],'fKbmMemTable1 recordCount '+inttostr(fKbmMemBlockRecordsTable.recordCount));

            fAllRecordsServerQueryRecordCount := fnxAllRecordsTempTable.RecordCount + fLastID;

       finally
            fnxAllRecordsTempTable.Close;
        end;

    except
       on e: EnxDatabaseError do begin
            GLog.Log(self,[lcExcept],'open table exception class: '+e.ClassName);
            GLog.Log(self,[lcExcept],'open table exception message: '+e.Message);
//
//            closeDB;
//            freeNxDbOjects;
//            createNxDbOjects;
//
           result := false;
       end;
    end;

    GLog.Log(self,[lcDebug],'loadAllRecordsTempTableToMemTable end');
end;

procedure TncUploadThread.doBlockUpload;
var
    RecordsInRequest, PostId : integer;
begin

        GLog.Log(self,[lcDebug],'UpLoad Thread doUpload start');
        fRecCount := 0;
        fIndentlevel := 0;
        RecordsInRequest := 0;
        PostId := 0;

        try

            fStartDT := now;

             while not lastBlockRecord do begin

                fJsonStr := jsonHeader(fIndentlevel, fEmail);


                while RecordsInRequest < fRecordsByRequest do begin

                    if lastBlockRecord then break;

                    fJsonStr := fJsonStr + recordToJson(fIndentlevel, fEmail);
                    fJsonStr := fJsonStr + ',' + fNewLine;
                    fQueryItemIDsList.Add( fKbmMemBlockRecordsTable.FieldByName( 'queryItemID' ).AsString);

                    fKbmMemBlockRecordsTable.Next;

                    fAllRecordsCount := fAllRecordsCount + 1;
                    RecordsInRequest := RecordsInRequest + 1;
                    fRecCount := fRecCount + 1;

                    sleep(5);
                end;

                if fQueryItemIDsList.Count>0 then begin
                    fFirstID := strtoint(fQueryItemIDsList[0]);
                    fLastID := strtoint(fQueryItemIDsList[fQueryItemIDsList.Count-1]);
                end else begin
                    fFirstID := 0;
                    fLastID := 0;
                end;
                GLog.Log(self,[lcDebug],'fLastRecord: '+inttostr(fLastID));

                fJsonStr := copy(fJsonStr, 1, length(fJsonStr)-length(fNewLine)-1);
                fJsonStr := jsonFooter(fIndentlevel, fJsonStr);


                PostId := PostId + 1;
                fPostFatalError := false;

                fAtlasPost.PaylodSecret := fPayloadSecret;
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

                delay(self, fParams.InterBlockDelayM , 0.5, 'inter block delay');

            end;

            GLog.Log(self,[lcDebug],'MaxRecords: '+inttostr(fMaxRecords));
            GLog.Log(self,[lcDebug],'Rec Count: '+inttostr(fRecCount));

            //  closeFile(memLogFile);

        except
            on e:exception do begin
                 GLog.Log(self,[lcExcept], e.Message);
            end;
        end;


        GLog.Log(self,[lcDebug],'UpLoad Thread doUpload end');

end;

procedure TncUploadThread.postOnResponse(Sender: TObject; aId:integer; aResponseCode:integer; aJsonQueryString, aJsonResponseString: string; aExecTime: int64);
var
    jsonResponse : TJsonObject;
    insertedIds : TJsonArray;
    //sdt : String;
begin

    aJsonResponseString := stringReplace(aJsonResponseString,'\"','"',[rfReplaceAll]);
    //sdt := formatdatetime('hh:mm:ss',fStartDT-now);

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
                updateRemoteQueryPost(fRemoteQueryId, fFirstID, fLastID, fQueryItemIDsList.Text, '', aExecTime, true, fPostFatalMessage,  aJsonQueryString );

            end;
            if jsonResponse.has('insertedIds') then begin
                insertedIds := jsonResponse.getJSONArray('insertedIds');
                updateRemoteQueryPost(fRemoteQueryId, fFirstID, fLastID, fQueryItemIDsList.Text, insertedIds.toString, aExecTime, false, '', ''  );
             end;

        finally
            jsonResponse.Free;
        end;

    end else
       updateRemoteQueryPost(fRemoteQueryId, fFirstID, fLastID, fQueryItemIDsList.Text, '', aExecTime, true, aJsonResponseString, aJsonQueryString  );

    updateRemoteQuery;

    GLog.Log(self,[lcDebug],'postOnResponse remoteQueryId: ' + inttostr(fRemoteQueryId) + ': '+inttostr(fFirstID) + ',' + inttostr(fLastID)+
                            ' error: '+boolToStr(fPostFatalError,true)+' '+fPostFatalMessage);
    GLog.Log(self,[lcDebug],'postOnResponse Records: '+fQueryItemIDsList.CommaText);

    GLog.ForceLogWrite;

end;

function TncUploadThread.newRemoteQuery: integer;
begin

      result := 0;
      fnxQuery.SQL.Text :=  'insert into "' + kRemoteQuery_tablename + '"'+
          ' (datahora, ServerQuery, ServerOid) VALUES (:datahora, :ServerQuery, :ServerOid)';
      fnxQuery.ParamByName('datahora').AsDateTime := now;
      fnxQuery.ParamByName('ServerQuery').AsString := fServerQuery;
      fnxQuery.ParamByName('ServerOid').AsString := fServerOid;

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

procedure TncUploadThread.updateRemoteQuery;
begin
      fnxQuery.SQL.Text :=  '#T 0 ' + #13#10 + 'update "' + kRemoteQuery_tablename + '"'+
          ' set lastRecord=:lastRecord, uploadVer=:uploadVer '+
          ' where ID=:id';
      fnxQuery.ParamByName('lastRecord').AsInteger := fLastID;
      fnxQuery.ParamByName('uploadVer').AsInteger := fRemoteUploadVersion;
      fnxQuery.ParamByName('id').AsInteger := fRemoteQueryId;

      GLog.Log(self,[lcDebug], 'updateRemoteQuery -> ' + fnxQuery.SQL.Text );

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

      GLog.Log(self,[lcDebug], 'updateRemoteQuery -> ' + fnxQuery.SQL.Text + ' id: ' + inttostr(fRemoteQueryId));

      try
          fnxQuery.ExecSql;
      except
          on e:Exception do
              GLog.Log(self,[lcExcept], 'updateRemoteQuery ' + e.Message);
      end;

end;

procedure TncUploadThread.updateRemoteQueryPost(aRemoteQueryId, aFirstRecord,
  aLastRecord: integer; aRecords, insertedIds: string; aExecTime: dword;  aUpload_err: boolean;
  aUploadErrorString, aJsonSource: string);
begin

       fnxQuery.SQL.Text :=  'insert into "' + kRemoteQueryPost_tablename + '"'+
          ' (dataHora, fk_RemoteQuery, firstRecord, lastRecord, Records, InsertedIds, ms, upload_error, upload_errormsg, upload_jsonsource) VALUES '+
          ' (:datahora, :aRemoteQueryId, :aFirstRecord, :aLastRecord, :aRecords, :insertedIds, :aExecTime, :aUpload_err, :aUploadErrorString, :aJsonSource )';

      fnxQuery.ParamByName('datahora').AsDateTime := now;
      fnxQuery.ParamByName('aRemoteQueryId').AsInteger := aRemoteQueryId;
      fnxQuery.ParamByName('aFirstRecord').AsInteger := aFirstRecord;
      fnxQuery.ParamByName('aLastRecord').AsInteger := aLastRecord;
      fnxQuery.ParamByName('aRecords').AsString := aRecords;
      fnxQuery.ParamByName('insertedIds').AsString := insertedIds;
      fnxQuery.ParamByName('aUpload_err').AsBoolean := aUpload_err;
      fnxQuery.ParamByName('aExecTime').AsInteger := aExecTime;
      fnxQuery.ParamByName('aUploadErrorString').AsString := aUploadErrorString;
      fnxQuery.ParamByName('aJsonSource').AsString := aJsonSource;

      GLog.Log(self,[lcDebug], 'updateRemoteQueryPost -> ' + fnxQuery.SQL.Text );

      try
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
