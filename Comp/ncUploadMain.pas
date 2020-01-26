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
    fnxAllRecordsTempTable : TnxTable;
    fnxServerQuery : TnxQuery;
    fnxQuery : TnxQuery;
    fnxSession1 : TnxSession;
    fnxDatabase1: TnxDatabase;
    fKbmMemBlockRecordsTable: TkbmMemTable;

    fFisrtRemoteParametersCall : boolean;
    fStartDT : TDatetime;
    fEmail: string;
    fJsonStr : string;
    fRemoteQueryId,
    fIndentlevel : integer;
    fFirstRecord,
    fLastRecord,
    fRecCount: integer;
    fRecords : TStringList;
    fAllRecordsCount: integer;
    fAllRecordsServerQueryRecordCount: integer;

    //    memLogFile : Textfile;
    //    memLogFileName : string;
    fParams : TUploadParams;
    fPostFatalError : boolean;
    fPostFatalMessage: string;
    fRemoteUploadVersion :integer;
    fServerQuery : string;
    
    fIndentStep: integer;
    fNewLine : string;
    fPaylodSecret : string;
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
    function copyTableToMem: boolean;
    procedure createNxDbOjects;
    procedure freeNxDbOjects;
    procedure newRemoteQuery;
    procedure finishRemoteQuery;
    procedure updateRemoteQuery;
    procedure updateRemoteQueryPost(aRemoteQueryId, aFirstRecord, aLastRecord: integer; aRecords, insertedIds: string; aUpload_err: boolean; aUploadErrorString, aJsonSource:string );
    procedure getRemoteParameters;
    { Private declarations }
  protected
     procedure Execute; override;
  public
    property Email: string read fEmail write fEmail;
    property NewLine: string read fNewLine write fNewLine;
    property IndentStep: integer read fIndentStep write fIndentStep;
    property PaylodSecret: string read fPaylodSecret write fPaylodSecret;
    property ServerEngine: TnxBaseServerEngine write SetServerEngine;
    property Terminated: Boolean read FTerminated;

    procedure Terminate; 
    constructor Create;
    destructor Destroy; override;
  { Public declarations }
  end;

var RemoteQueryResult_tablename: string = '_RemoteQueryResult';

implementation

uses  ncDMserv, strutils, ncUploadConst, ncUploadDelay, DCPbase64;

const nothingToDo = -1;
const checkAgain = 0;
const RemoteQuery_tablename = '_RemoteQuery';
const RemoteQueryPost_tablename = '_RemoteQueryPost';
const upload_temp_tablename = '<upload_temp>';

procedure TncUploadThread.createNxDbOjects;
begin
     GLog.Log(self,[lcDebug],'createNxDbOjects start');

     fnxSession1 := TnxSession.Create(nil);
     fnxSession1.ServerEngine := fNxSE;
     fnxDatabase1 := TnxDatabase.Create(nil);
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
     fNewLine := '';       // newline valur for pretty json

     fRecords := TStringList.Create;
     createNxDbOjects;
     fKbmMemBlockRecordsTable := TKbmMemTable.Create(nil);
     fParams := TUploadParams.Create;
     fFisrtRemoteParametersCall := true;

     Priority := tpLower;

 end;

destructor TncUploadThread.Destroy;
begin
    freeNxDbOjects;
    fRecords.free;
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

    jsonstr := StringOfChar(' ', indentlevel * fIndentStep) + '{' + fNewLine;
    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
                '"version": ' +  inttostr( fRemoteUploadVersion ) + ',' + fNewLine;
    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
                '"query": ' +  '"' + escape(fServerQuery) + '",' + fNewLine;
    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
                '"data": {' +  fNewLine;
    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 2)* fIndentStep) +
                '"email": ' +  '"' + escape( email) + '",' + fNewLine;

    // Iterates fields
    for i := 0 to fd.Count - 1 do begin

        jsonval := '';
        fldDef := fd.Items[i];
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

        if i < fd.Count - 1 then
            jsonstr := jsonstr + ',';

        jsonstr := jsonstr + fNewLine;
    end;

    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1) * fIndentStep) + '}'+fNewLine;
    jsonstr := jsonstr + StringOfChar(' ', indentlevel * fIndentStep) + '}';
    recordToJson := jsonstr;

end;

function TncUploadThread.jsonHeader(var indentLevel:integer; email: string): string;
begin
         result := '[' + fNewLine;
         indentlevel := indentlevel + 1;
end;

function TncUploadThread.jsonFooter(var indentLevel:integer; jsonString: string): string;
begin
         indentlevel := indentlevel - 1;
         result := jsonString + StringOfChar(' ', indentlevel * fIndentStep)  + ']'+ fNewLine;
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
      if (fRemoteQueryId = nothingToDo) or
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

      if fFisrtRemoteParametersCall then
          fFisrtRemoteParametersCall := false;

      GLog.Log(self,[lcDebug],'init Params: '+fParams.asString);
      getParams := TGetUploadParams.Create;
      try
          getParams.PaylodSecret := fPaylodSecret;
          if not getParams.Run(Self) then
              exit;
          fParams.assign(getParams.Params);

          if (not fFisrtRemoteParametersCall) and
             (fRemoteQueryId = nothingToDo) then begin
              fRemoteQueryId := checkAgain;
          end;

       finally
        getParams.Free;
      end;
      GLog.Log(self,[lcDebug],'getRemoteParameters: '+fParams.asString);

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

        fMaxRecords := fParams.MaxRecords;
        fInterBlockDelay := fParams.InterBlockDelayM;
        fRecordsByRequest := fParams.RecordsByRequest;
        fRemoteUploadVersion := fParams.Version;
        fServerQuery := fParams.Query;
        fFirstRecord := 0;
        fLastRecord := 0;

        // if fParams.IniDelayM>0 then
        //     delay(self, fParams.IniDelayM, 0.5, 'delay inicial');

       if not copyTableToMem then exit;

       while (not Terminated) do begin

            fMaxRecords := fParams.MaxRecords;
            fInterBlockDelay := fParams.InterBlockDelayM;
            fRecordsByRequest := fParams.RecordsByRequest;
            fRemoteUploadVersion := fParams.Version;
            fServerQuery := fParams.Query;

            while (not Terminated) do begin

                 if fParams.Active then
                     doBlockUpload;

                 if not fPostFatalError then begin

                     if not(delay(self, fParams.MainDelayM , 0.3, 'main delay')) then
                         exit;
                     break;
                 end;
            end;

            finishRemoteQuery;
            getRemoteParameters;

        end;


    finally
        GLog.Log(self,[lcDebug],'UpLoad Thread end');
    end;

end;

function TncUploadThread.copyTableToMem: boolean;

    procedure createRemoteQueryResult;
    var
        Dict : TnxDataDictionary;
        i, lastRecord, recordCount, lastUploadVer: integer;
    begin
        GLog.Log(self,[lcDebug],'createRemoteQueryResult start');

        if fnxDatabase1.TableExists( upload_temp_tablename ,'')  then
             fnxDatabase1.DeleteTable( upload_temp_tablename ,'');
        if fnxDatabase1.TableExists( RemoteQueryResult_tablename ,'')  then
             fnxDatabase1.DeleteTable( RemoteQueryResult_tablename ,'');

        // create fnxAllRecordsTempTable from fnxServerQuery Dictionary
        fnxServerQuery.Open;
        try
            GLog.Log(self,[lcDebug],'fnxServerQuery recordcount '+inttostr(fnxServerQuery.RecordCount));
            fnxServerQuery.First;

            fnxDatabase1.CreateTable(true, upload_temp_tablename , '', fnxServerQuery._Dictionary,  tsTempGlobal);


            Dict := TnxDataDictionary.Create;
            try
                nxCheck(fnxDatabase1.GetDataDictionaryEx( upload_temp_tablename , '', Dict));

                // added 30/08/2019
                with Dict.FieldsDescriptor do
                    with AddField('uploadVer', '', nxtByte, 3, 0, False) do
                      with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
                        AsVariant := 0;

                with Dict.EnsureIndicesDescriptor do begin

                    with AddIndex('IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                      Add(Dict.GetFieldFromName('ID'));

                    with AddIndex('IuploadVer', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                        Add(Dict.GetFieldFromName( 'uploadVer' ));

                end;

                fnxDatabase1.CreateTable(true, RemoteQueryResult_tablename , '', Dict,  tsPersistent);

            finally
                Dict.Free;
            end;
            fnxDatabase1.DeleteTable( upload_temp_tablename ,'');


            // copy values from fnxServerQuery to fnxAllRecordsTempTable

            lastRecord := 0;
            fRemoteQueryId := checkAgain;
            fAllRecordsCount := 0;
            fAllRecordsServerQueryRecordCount := 0;

            try
                fnxQuery.SQL.Text := 'Select top 1 "ID", "uploadVer", "lastRecord" from "' + RemoteQuery_tablename + '" where ServerQuery=:ServerQuery order by "uploadVer" desc';
                fnxQuery.ParamByName('ServerQuery').AsString := stringReplace(fServerQuery,'\"','"',[rfReplaceAll]);
                //fnxQuery.ParamByName('uploadVer').AsInteger := fRemoteUploadVersion;
                fnxQuery.Open;
                if not fnxQuery.Eof then begin
                    fRemoteQueryId := fnxQuery.FieldByName('ID').AsInteger;
                    lastRecord := fnxQuery.FieldByName('lastRecord').AsInteger;
                    lastUploadVer := fnxQuery.FieldByName('uploadVer').AsInteger;
                    fnxQuery.Close;

                    if lastUploadVer = fRemoteUploadVersion then
                        fRemoteQueryId := nothingToDo;
                end;

            except
                on e:exception do begin
                    GLog.Log(self,[lcExcept], fnxQuery.SQL.Text + ' => '+e.Message);
                end;
            end;

            GLog.Log(self,[lcDebug],'Copiando tabelas início');

            fnxAllRecordsTempTable.TableName := RemoteQueryResult_tablename;
            fnxAllRecordsTempTable.IndexName := 'IuploadVer';
            fnxAllRecordsTempTable.Filter := 'uploadVer<'+inttostr(fRemoteUploadVersion);
            fnxAllRecordsTempTable.FilterType := ftSqlWhere;
            fnxAllRecordsTempTable.Filtered := false;

            if fRemoteQueryId = checkAgain then begin
                try

                    fnxAllRecordsTempTable.Open;
                    try
                        recordCount := 0;
                        while not fnxServerQuery.Eof do begin

                            sleep(0);
                            if recordCount < lastRecord then begin
                                if recordCount mod 1000 = 0 then begin
                                    GLog.Log(self,[lcDebug],'Skipped '+inttostr(recordCount));
                                    GLog.ForceLogWrite;
                                end;
                                fnxServerQuery.Next;
                                inc(recordCount);
                                sleep(0);
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

                            if recordCount mod 1000 = 0 then begin
                                GLog.Log(self,[lcDebug],'Copiados '+inttostr(recordCount));
                                GLog.ForceLogWrite;
                            end;

                            inc(recordCount);
                            fnxServerQuery.Next;
                        end;

                        fAllRecordsServerQueryRecordCount := fnxServerQuery.RecordCount;
                        GLog.Log(self,[lcDebug],'Copiando tabelas fim, recordcount '+inttostr(fnxAllRecordsTempTable.RecordCount));

                    finally
                        fnxAllRecordsTempTable.Close;
                    end;

                except
                    on e:exception do begin
                        GLog.Log(self,[lcExcept],'fnxAllRecordsTempTable.Open '+e.Message);
                    end;
                end;

                newRemoteQuery;
                fnxDatabase1.RenameTable(RemoteQueryResult_tablename, RemoteQueryResult_tablename +'_'+ intToStr(fRemoteQueryId), '');
                RemoteQueryResult_tablename := fnxAllRecordsTempTable.TableName +'_'+ intToStr(self.fRemoteQueryId)
            end;


        finally
            fnxServerQuery.Close;
        end;

        fnxAllRecordsTempTable.TableName := RemoteQueryResult_tablename;
        GLog.Log(self,[lcDebug],'fnxAllRecordsTempTable.TableName: '+ RemoteQueryResult_tablename);

        GLog.Log(self,[lcDebug],'createRemoteQueryResult end');
        GLog.ForceLogWrite;

   end;

begin

    GLog.Log(self,[lcDebug],'copyTableToMem start');

    try

        fnxServerQuery.SQL.Text := stringReplace(fServerQuery,'\"','"',[rfReplaceAll]);

        createRemoteQueryResult;

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
       finally
            fnxAllRecordsTempTable.Close;
        end;

    except
       on e: EnxDatabaseError do begin
            GLog.Log(self,[lcDebug],'open table exception class: '+e.ClassName);

            closeDB;
            freeNxDbOjects;
            createNxDbOjects;

            result := false;
       end;
    end;

    GLog.Log(self,[lcDebug],'copyTableToMem end');
end;

procedure TncUploadThread.doBlockUpload;
var
    Post : TncUploadPost;
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
                    fRecords.Add( fKbmMemBlockRecordsTable.FieldByName( 'ID' ).AsString);

                    fKbmMemBlockRecordsTable.Next;

                    fAllRecordsCount := fAllRecordsCount + 1;
                    RecordsInRequest := RecordsInRequest + 1;
                    fRecCount := fRecCount + 1;

                    sleep(0);
                end;

                if fRecords.Count>0 then begin
                    fFirstRecord := strtoint(fRecords[0]);
                    fLastRecord := strtoint(fRecords[fRecords.Count-1]);
                end else begin
                    fFirstRecord := 0;
                    fLastRecord := 0;
                end;
                GLog.Log(self,[lcDebug],'fLastRecord: '+inttostr(fLastRecord));

                fJsonStr := copy(fJsonStr, 1, length(fJsonStr)-length(fNewLine)-1);
                fJsonStr := jsonFooter(fIndentlevel, fJsonStr);


                PostId := PostId + 1;
                fPostFatalError := false;
                post := TncUploadPost.Create(PostId);
                post.PaylodSecret := fPaylodSecret;
                post.OnResponse := postOnResponse;
                try
                    post.JsonString := fJsonStr;
                    post.Run;
                    //rc := post.ResponseCode;
                finally
                    post.Free;
                end;

                RecordsInRequest := 0;
                fRecords.Clear;

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
    sdt : String;

begin

    aJsonResponseString := stringReplace(aJsonResponseString,'\"','"',[rfReplaceAll]);
    sdt := formatdatetime('hh:mm:ss',fStartDT-now);

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
                updateRemoteQueryPost(fRemoteQueryId, fFirstRecord, fLastRecord, fRecords.Text, '', true, fPostFatalMessage,  aJsonQueryString );

            end;
            if jsonResponse.has('insertedIds') then begin
                insertedIds := jsonResponse.getJSONArray('insertedIds');
                updateRemoteQueryPost(fRemoteQueryId, fFirstRecord, fLastRecord, fRecords.Text, insertedIds.toString, false, '', ''  );
             end;

        finally
            jsonResponse.Free;
        end;

    end else
        updateRemoteQueryPost(fRemoteQueryId, fFirstRecord, fLastRecord, fRecords.Text, '', true, inttostr(aResponseCode), aJsonQueryString  );

    updateRemoteQuery;

    GLog.Log(self,[lcDebug],'postOnResponse remoteQueryId: ' + inttostr(fRemoteQueryId) + ': '+inttostr(fFirstRecord) + ',' + inttostr(fLastRecord)+
                            ' error: '+boolToStr(fPostFatalError,true)+' '+fPostFatalMessage);
    GLog.Log(self,[lcDebug],'postOnResponse Records: '+fRecords.CommaText);

    GLog.ForceLogWrite;
    
end;

procedure TncUploadThread.newRemoteQuery;
begin

      fnxQuery.SQL.Text :=  'insert into "' + RemoteQuery_tablename + '"'+
          ' (datahora, totalRecords, ServerQuery) VALUES (:datahora, :totalRecords, :ServerQuery)';
      fnxQuery.ParamByName('datahora').AsDateTime := now;
      fnxQuery.ParamByName('ServerQuery').AsString := fServerQuery;
      fnxQuery.ParamByName('totalRecords').AsInteger := fAllRecordsServerQueryRecordCount;

      GLog.Log(self,[lcDebug], 'newRemoteQuery -> ' + fnxQuery.SQL.Text );

      try
          fnxQuery.ExecSql;

          fnxQuery.SQL.Text :=  'select max("ID") from "' + RemoteQuery_tablename + '"';
          fnxQuery.Open;

          fRemoteQueryId := fnxQuery.Fields[0].AsInteger;
          GLog.Log(self,[lcDebug], 'insert into RemoteQuery 1d: ' + inttostr( fRemoteQueryId ));
          fnxQuery.Close;
      except
          on e:Exception do
              GLog.Log(self,[lcExcept], 'newRemoteQuery ' + e.Message);
      end;

      GLog.Log(self,[lcDebug],'fRemoteQueryId '+ inttostr(fRemoteQueryId) );

end;

procedure TncUploadThread.updateRemoteQuery;
begin

      fnxQuery.SQL.Text :=  'update "' + RemoteQuery_tablename + '"'+
          ' set lastRecord=:lastRecord '+
          ' where ID=:id';
      fnxQuery.ParamByName('lastRecord').AsInteger := fLastRecord;
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
  aLastRecord: integer; aRecords, insertedIds: string; aUpload_err: boolean;
  aUploadErrorString, aJsonSource: string);
begin



      fnxQuery.SQL.Text :=  'insert into "' + RemoteQueryPost_tablename + '"'+
          ' (dataHora, fk_RemoteQuery, firstRecord, lastRecord, Records, InsertedIds, upload_error, upload_errormsg, upload_jsonsource) VALUES '+
          ' (:datahora, :aRemoteQueryId, :aFirstRecord, :aLastRecord, :aRecords, :insertedIds, :aUpload_err, :aUploadErrorString, :aJsonSource )';

      fnxQuery.ParamByName('datahora').AsDateTime := now;
      fnxQuery.ParamByName('aRemoteQueryId').AsInteger := aRemoteQueryId;
      fnxQuery.ParamByName('aFirstRecord').AsInteger := aFirstRecord;
      fnxQuery.ParamByName('aLastRecord').AsInteger := aLastRecord;
      fnxQuery.ParamByName('aRecords').AsString := aRecords;
      fnxQuery.ParamByName('insertedIds').AsString := insertedIds;
      fnxQuery.ParamByName('aUpload_err').AsBoolean := aUpload_err;
      fnxQuery.ParamByName('aUploadErrorString').AsString := aUploadErrorString;
      fnxQuery.ParamByName('aJsonSource').AsString := aJsonSource;

      GLog.Log(self,[lcDebug], 'updateRemoteQueryPost -> ' + fnxQuery.SQL.Text );

      try
          fnxQuery.ExecSql;
      except
          on e:Exception do
              GLog.Log(self,[lcExcept], 'updateRemoteQueryPost ' + e.Message);
      end;

      fnxQuery.SQL.Text :=  'update "' + RemoteQueryResult_tablename + '"'+
                                  ' set uploadVer=:uploadVer' +
                                  ' where ID' +
                                  ' in ('+fRecords.CommaText+')';
      fnxQuery.ParamByName('uploadVer').AsInteger := fRemoteUploadVersion;
      try
          fnxQuery.ExecSQL;
      except
          on e:Exception do
               GLog.Log(self,[lcDebug], 'updateRemoteQueryPost -> ' + e.Message);
      end;

end;

procedure TncUploadThread.finishRemoteQuery;
var
     uploadVer: integer;
begin

      fnxQuery.SQL.Text :=  'update "' + RemoteQuery_tablename + '"'+
          ' set lastRecord=:lastRecord, uploadVer=:uploadVer '+
          ' where ID=:id';
      fnxQuery.ParamByName('lastRecord').AsInteger := fLastRecord;

      if fAllRecordsCount = fAllRecordsServerQueryRecordCount then
            uploadVer := fRemoteUploadVersion
      else
            uploadVer := 0;

      fnxQuery.ParamByName('uploadVer').AsInteger := uploadVer;
      fnxQuery.ParamByName('id').AsInteger := fRemoteQueryId;

      GLog.Log(self,[lcDebug], 'finishRemoteQuery -> ' + fnxQuery.SQL.Text );

      try
          fnxQuery.ExecSql;
      except
          on e:Exception do
              GLog.Log(self,[lcExcept], 'finishRemoteQuery ' + e.Message);
      end;

end;

end.
