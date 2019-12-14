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
    fnxUpdateQuery : TnxQuery;
    fnxSession1 : TnxSession;
    fnxDatabase1: TnxDatabase;
    fKbmMemTable1: TkbmMemTable;

    fStartDT : TDatetime;
    fEmail: string;
    fJsonStr : string;
    fIndentlevel : integer;
    fRecCount: integer;
    fRecords : TStringList;
    //    memLogFile : Textfile;
    //    memLogFileName : string;
    fParams : TUploadParams;
    fPostFatalError : boolean;
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
    function jsonFooter(var indentLevel: integer; jsonString: string): string;
    function jsonHeader(var indentLevel: integer; email: string): string;
    function recordToJson(indentlevel: integer; email:string): string;
    //procedure paramsOnResponse(Sender: TObject; aResponse:boolean; aParams:TParams; aExecTime: int64);
    procedure postOnResponse(Sender: TObject; aId,
      aResponseCode: integer; aJsonString: string; aExecTime: int64);
    function lastRecord: boolean;
    procedure SetServerEngine(se: TnxBaseServerEngine);
    procedure doUpload;
    procedure openDB;
    procedure closeDB;
    function copyTableToMem: boolean;
    procedure createNxDbOjects;
    procedure freeNxDbOjects;
    //procedure ZerarUploadVer;
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

implementation

uses  ncDMserv, strutils, ncUploadConst, ncUploadDelay;

const upload_temp_tablename = '<upload_temp>';
const RemoteCtrlResult_tablename = '<RemoteCtrlResult>';

procedure TncUploadThread.createNxDbOjects;
begin
    GLog.Log(self,[lcDebug],'createNxDbOjects start');
     fnxSession1 := TnxSession.Create(nil);
     fnxSession1.ServerEngine := fNxSE;
     fnxDatabase1 := TnxDatabase.Create(nil);
     fnxDatabase1.Session := fnxSession1;
     fnxAllRecordsTempTable := TnxTable.Create(nil);
     fnxAllRecordsTempTable.Database := fnxDatabase1;
     fnxAllRecordsTempTable.Session := fnxSession1;
     fnxServerQuery := TnxQuery.Create(nil);
     fnxServerQuery.Database := fnxDatabase1;
     fnxServerQuery.Session := fnxSession1;
     fnxUpdateQuery := TnxQuery.Create(nil);
     fnxUpdateQuery.Database := fnxDatabase1;
     fnxUpdateQuery.Session := fnxSession1;

    GLog.Log(self,[lcDebug],'createNxDbOjects end');
end;

procedure TncUploadThread.freeNxDbOjects;
begin
    GLog.Log(self,[lcDebug],'freeNxDbOjects start');
    fnxServerQuery.free;
    fnxUpdateQuery.free;
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
     fKbmMemTable1 := TKbmMemTable.Create(nil);
     fParams := TUploadParams.Create;

     Priority := tpLower;

 end;

destructor TncUploadThread.Destroy;
begin
    freeNxDbOjects;
    fRecords.free;
    fParams.Free;
    fKbmMemTable1.Free;
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
function TncUploadThread.escape(s:widestring):widestring;
var
    us: UCS4String;
    i:integer;
    rs : string;
    isE : boolean;
begin

    rs := '';
    us := WideStringToUCS4String(s);

    //GLog.Log(self,[lcDebug], '>' + s);
    isE := false;
    for i:=0 to length(us) - 1 do begin

        // if "\"
        if (us[i] = 92) then begin
            isE := true;
            rs := rs + '\';
        end else
        if isE then begin
            isE := false;
            case us[i] of
                34, 92, 47, 98, 102, 110, 114, 116 :
                    rs := rs + char(us[i]);
            else
                rs := rs + 'u'+intToHex( us[i], 4);
            end;
        end else
            if (us[i]>31) and (us[i]<128) then
                rs := rs + char( us[i])
            else
            if us[i]<>0 then
                rs := rs + '\u'+intToHex( us[i], 4);

    end;

    //GLog.Log(self,[lcDebug], '=' + rs);
    result := rs;
end;

function TncUploadThread.recordToJson(indentlevel: integer; email:string):string;
var
    jsonstr, jsonval : string;
    fldDef : TFieldDef;
    fd : TFieldDefs;
    fld : TField;
    i : integer;
    fs : TFormatSettings;
begin

    fs.DecimalSeparator := '.';
    fs.ThousandSeparator := ',';

    jsonstr := StringOfChar(' ', indentlevel * fIndentStep) + '{' + fNewLine;
    fd := fKbmMemTable1.FieldDefs;
    jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) +
                '"email": ' +  '"' + escape( email) + '",' + fNewLine;

    // Iterates fields
    for i := 0 to fd.Count - 1 do begin

        jsonval := '';
        fldDef := fd.Items[i];
        fld := fKbmMemTable1.FieldByName(fldDef.Name);

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
                ftOraTimeStamp, ftOraInterval:

                        jsonval :='"IMPLEMENTAR '+FieldTypeNames[fldDef.DataType]+'"';

           end;

        end else begin

                       jsonval := 'null';

        end;

        jsonstr := jsonstr + StringOfChar(' ', (indentlevel + 1)* fIndentStep) + '"' + fldDef.Name +'": '+jsonval;

        if i < fd.Count - 1 then
            jsonstr := jsonstr + ',';

        jsonstr := jsonstr + fNewLine;
    end;

    jsonstr := jsonstr + StringOfChar(' ', indentlevel * fIndentStep) + '}';
    recordToJson := jsonstr;

end;

function TncUploadThread.jsonHeader(var indentLevel:integer; email: string): string;
begin
//         result := '{' + fNewLine;
//
//         indentlevel := indentlevel + 1;
//         result := result + StringOfChar(' ', indentlevel * fIndentStep) + '"email": "'+ Email +'",' + fNewLine;
//         result := result + StringOfChar(' ', indentlevel * fIndentStep) + '"items":' + fNewLine;
//         result := result + StringOfChar(' ', indentlevel * fIndentStep) + '[' + fNewLine;
//
//         indentlevel := indentlevel + 1;

         result := '[' + fNewLine;

         indentlevel := indentlevel + 1;
end;

function TncUploadThread.jsonFooter(var indentLevel:integer; jsonString: string): string;
begin
         indentlevel := indentlevel - 1;
         result := jsonString + StringOfChar(' ', indentlevel * fIndentStep)  + ']'+ fNewLine;
//         result := result + '}'+ fNewLine;
end;

function sortFunc(List: TStringList; Index1, Index2: Integer): Integer;
var
    i1, i2 : Integer;
begin
    i1 := StrToIntDef(List.Strings[Index1], 0);
    i2 := StrToIntDef(List.Strings[Index2], 0);
    Result := i1 - i2
end;

function TncUploadThread.lastRecord:boolean;
var
     mr : integer;
begin
    if fKbmMemTable1.eof then begin
        result := true;
        exit;
    end;
    mr := fMaxRecords;
    if mr<1 then
        result := false
    else
        result := mr <= fRecCount;
end;

//procedure TUpload.ZerarUploadVer;
//begin
//      fnxUpdateQuery.SQL.Text := 'update produto set uploadVer=0';
//      try
//          fnxUpdateQuery.ExecSQL;
//      except
//          on e:Exception do
//              GLog.Log(self,[lcExcept], e.Message);
//      end;
//      GLog.Log(self,[lcDebug],'fRecords: '+fRecords.CommaText);
//end;

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

procedure TncUploadThread.Execute;
var
    getParams : TGetUploadParams;
begin
    try
        randomize;

        GLog.Log(self,[lcDebug],'UpLoad Thread start');


        //ZerarUploadVer;  //   <=================================

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

        GLog.Log(self,[lcDebug],'init Params: '+fParams.asString);
        getParams := TGetUploadParams.Create;
        try
            getParams.PaylodSecret := fPaylodSecret;
            //getParams.OnResponse := paramsOnResponse;
            if not getParams.Run(Self) then
                exit;
            fParams.assign(getParams.Params);
         finally
          getParams.Free;
        end;
        GLog.Log(self,[lcDebug],'getUploadParams: '+fParams.asString);


        fMaxRecords := fParams.MaxRecords;
        fInterBlockDelay := fParams.InterBlockDelayM;
        fRecordsByRequest := fParams.RecordsByRequest;
        fRemoteUploadVersion := fParams.Version;
        fServerQuery := fParams.Query;



//        if fParams.IniDelayM>0 then
//            delay(self, fParams.IniDelayM, 0.5, 'delay inicial');

        while (not Terminated) do begin

            fMaxRecords := fParams.MaxRecords;
            fInterBlockDelay := fParams.InterBlockDelayM;
            fRecordsByRequest := fParams.RecordsByRequest;
            fRemoteUploadVersion := fParams.Version;
            fServerQuery := fParams.Query;

            while (not Terminated) do begin

                 if fParams.Active then
                     doUpload;

                 if not fPostFatalError then begin

                     if not(delay(self, fParams.MainDelayM , 0.3, 'main delay')) then
                         exit;
                     break;
                 end;
            end;

            GLog.Log(self,[lcDebug],'init Params: '+fParams.asString);
            getParams := TGetUploadParams.Create;
            try
                getParams.PaylodSecret := fPaylodSecret;
                //getParams.OnResponse := paramsOnResponse;
                if not getParams.Run(Self) then
                    exit;
                fParams.assign(getParams.Params);
             finally
              getParams.Free;
            end;
            GLog.Log(self,[lcDebug],'getUploadParams: '+fParams.asString);

        end;

    finally
        GLog.Log(self,[lcDebug],'UpLoad Thread end');
    end;

end;

function TncUploadThread.copyTableToMem: boolean;

    procedure createRemoteCtrlResult;
    var
        Dict : TnxDataDictionary;
        nxQuery1 : TnxQuery;
        i: integer;
    begin
        GLog.Log(self,[lcDebug],'createRemoteCtrlResult start');

        fnxAllRecordsTempTable.TableName := RemoteCtrlResult_tablename;


        fnxServerQuery.Open;
        GLog.Log(self,[lcDebug],'fnxServerQuery recordcount '+inttostr(fnxServerQuery.RecordCount));
        fnxServerQuery.First;

        fnxDatabase1.CreateTable(true, upload_temp_tablename , '', fnxServerQuery._Dictionary,  tsTempGlobal);


        Dict := TnxDataDictionary.Create;
        try
            nxCheck(fnxDatabase1.GetDataDictionaryEx( upload_temp_tablename , '', Dict));
            with Dict.FieldsDescriptor do begin

                AddField('upload_ID', '', nxtAutoInc, 10, 0, False);

                with AddField('upload_done', '', nxtByte, 1, 0, False) do
                  with AddDefaultValue(TnxConstDefaultValueDescriptor) as TnxConstDefaultValueDescriptor do
                    AsVariant := 0;

            end;
            with Dict.EnsureIndicesDescriptor do begin

                with AddIndex('upload_IID', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                    Add(Dict.GetFieldFromName('upload_ID'));

                with AddIndex('IuploadDone', 0, idAll), KeyDescriptor as TnxCompKeyDescriptor do
                    Add(Dict.GetFieldFromName('upload_done'));

            end;

            //RestructureTable( fnxDatabase1, RemoteCtrlResult_tablename, '', Dict, nil, CancelTask);
            fnxDatabase1.CreateTable(true, RemoteCtrlResult_tablename , '', Dict,  tsTempGlobal);

        finally
            Dict.Free;
        end;

        fnxAllRecordsTempTable.Open;
        GLog.Log(self,[lcDebug],'fnxAllRecordsTempTable recordcount '+inttostr(fnxAllRecordsTempTable.RecordCount));
        //fnxAllRecordsTempTable.CopyRecordsEx(fnxServerQuery, true, 0, true);

        while not fnxServerQuery.Eof do begin
            fnxAllRecordsTempTable.Insert;
            for i:=0 to fnxServerQuery.FieldCount-1 do begin

                if fnxServerQuery.FieldList[i].isNull then continue;
                if fnxServerQuery.FieldList[i].isBlob then
                    fnxAllRecordsTempTable.FieldList[i].AsString := fnxServerQuery.FieldList[i].AsString
                else
                    fnxAllRecordsTempTable.FieldList[i].Value :=  fnxServerQuery.FieldList[i].Value;

            end;
            if (i mod 100)=0 then
               GLog.Log(self,[lcDebug],'fnxAllRecordsTempTable recordcount '+inttostr(fnxAllRecordsTempTable.RecordCount));

            fnxAllRecordsTempTable.Post;
            fnxServerQuery.Next;
        end;
        fnxServerQuery.Close;
        fnxAllRecordsTempTable.First;

        fnxDatabase1.DeleteTable( upload_temp_tablename ,'');

        GLog.Log(self,[lcDebug],'fnxAllRecordsTempTable recordcount '+inttostr(fnxAllRecordsTempTable.RecordCount));
        GLog.Log(self,[lcDebug],'createRemoteCtrlResult end');

   end;

   procedure openQuery;
    begin
        GLog.Log(self,[lcDebug],'openQuery start');

        if not fnxDatabase1.TableExists( RemoteCtrlResult_tablename ,'')  then
                createRemoteCtrlResult;

        fnxAllRecordsTempTable.Open;
        fnxAllRecordsTempTable.First;

        fKbmMemTable1.EmptyTable;
        fKbmMemTable1.CreateTableAs(fnxAllRecordsTempTable,[mtcpoStructure,mtcpoProperties]);
        fKbmMemTable1.Open;
        fKbmMemTable1.LoadFromDataSet(fnxServerQuery,[]);
        fKbmMemTable1.First;
        fnxServerQuery.Close;
        result := true;
        GLog.Log(self,[lcDebug],'openQuery end');
    end;

begin

    GLog.Log(self,[lcDebug],'copyTableToMem start');
    result := false;

    fnxServerQuery.SQL.Text := stringReplace(fServerQuery,'\"','"',[rfReplaceAll]);

    //fnxServerQuery.TableName := 'Produto';
    //fnxServerQuery.IndexName := 'IuploadVersion';
    // fnxServerQuery.Filter := 'ID=1704 or ID=3137';
    fnxAllRecordsTempTable.Filter := 'upload_done<'+inttostr(fRemoteUploadVersion);
    fnxAllRecordsTempTable.FilterType := ftSqlWhere;
    fnxAllRecordsTempTable.Filtered := true;
    try
        openQuery;
    except
       on e: EnxDatabaseError do begin
            GLog.Log(self,[lcDebug],'open table exception class: '+e.ClassName);

            closeDB;
            freeNxDbOjects;
            createNxDbOjects;

            openDB;
            openQuery;
       end;
    end;

    GLog.Log(self,[lcDebug],'copyTableToMem end');
end;

procedure TncUploadThread.doUpload;
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
            if not copyTableToMem then exit;

            fStartDT := now;
            while not lastRecord do begin


                fJsonStr := jsonHeader(fIndentlevel, fEmail);
                while RecordsInRequest < fRecordsByRequest do begin

                    if lastRecord then break;

                    fJsonStr := fJsonStr + recordToJson(fIndentlevel, fEmail);
                    fJsonStr := fJsonStr + ',' + fNewLine;

                    //GLog.Log(self,[lcDebug],'id: '+nxTable1.FieldByName('ID').AsString);
                    fRecords.Add(fKbmMemTable1.FieldByName('upload_IID').AsString);
                    fKbmMemTable1.Next;

                    RecordsInRequest := RecordsInRequest + 1;
                    fRecCount := fRecCount + 1;
                end;

                fJsonStr := copy(fJsonStr, 1, length(fJsonStr)-length(fNewLine)-1);
                fJsonStr := jsonFooter(fIndentlevel, fJsonStr);

                //GLog.Log(self,[lcDebug],'fJsonStr: '+fJsonStr);

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
                    GLog.Log(self,[lcDebug],'Fatal Error in Server Response.');
                    exit;
                end;

                if lastRecord then break;

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

//procedure TUpLoad.paramsOnResponse(Sender: TObject; aResponse: boolean; aParams:TParams; aExecTime: int64);
//begin
//    if aResponse then
//        fParams.assign(aParams);
//    GLog.Log(self,[lcDebug],'paramsOnResponse: '+ boolToStr(aResponse, true) );
//end;

procedure TncUploadThread.postOnResponse(Sender: TObject; aId:integer; aResponseCode:integer; aJsonString: string; aExecTime: int64);
var
    r1 : TJsonObject;
    insertedIds : TJsonArray;
    sdt : String;
begin

    aJsonString := stringReplace(aJsonString,'\"','"',[rfReplaceAll]);
    //aJsonString := copy(aJsonString, 2, length(aJsonString)-2);

    GLog.Log(self,[lcDebug],'postResponse  id:'+ inttostr(aId) + ' '+ aJsonString );

    sdt := formatdatetime('hh:mm:ss',fStartDT-now);

    if aResponseCode = 200 then begin

        try
            r1 := TJsonObject.create(aJsonString);
            if r1.has('Error') then begin

                if r1.getBoolean('Error')=true then begin
                    fPostFatalError := true;
                     if r1.has('ErrorMsg') then
                        GLog.Log(self,[lcDebug],'postResponse  id:'+ inttostr(aId) + ' server error: '+r1.getString('ErrorDesc') )
                    else
                        GLog.Log(self,[lcDebug],'postResponse  id:'+ inttostr(aId) + ' server error / resposta: '+aJsonString );
                    exit;
                end;
                // GLog.Log(self,[lcDebug],'postResponse  id:'+ inttostr(aId) + ' error / resposta: '+aJsonString );
            end;

            if r1.has('insertedIds') then begin
                insertedIds := r1.getJSONArray('insertedIds');
                //writeln ( memLogFile, sdt +'; '+ inttostr(aId) + '; ', inttostr(aResponseCode) + '; '+ inttostr(aExecTime) + '; ' + inttostr(insertedIds.length));
                GLog.Log(self,[lcDebug],'postResponse  id:'+ inttostr(aId) + ' '+ inttostr(aResponseCode)+ ' '+ inttostr(insertedIds.length) );

                //fnxUpdateQuery.SQL.Text := 'update produto set uploadVer='+inttostr(fRemoteUploadVersion)+' where id in ('+fRecords.CommaText+')';
                fnxUpdateQuery.SQL.Text := 'update "' + RemoteCtrlResult_tablename + '" set upload_done ='+inttostr(fRemoteUploadVersion)+' where upload_IID in ('+fRecords.CommaText+')';
                try
                    fnxUpdateQuery.ExecSQL;
                except
                    on e:Exception do
                        GLog.Log(self,[lcExcept], e.Message);
                end;
                //GLog.Log(self,[lcDebug],'fRecords: '+fRecords.CommaText);


            end else begin
                //writeln ( memLogFile, sdt +'; ' + inttostr(aId) + '; ', inttostr(aResponseCode) + '; '+ inttostr(aExecTime) + '; 0');
                GLog.Log(self,[lcDebug],'postResponse  id:'+ inttostr(aId) + ' '+ inttostr(aResponseCode)+ ' '+ inttostr(length(aJsonString)) + #13#10 + aJsonString );
            end;


        except
            on e:exception do
               GLog.Log(self,[lcExcept],'postResponse  id:'+ inttostr(aId) + ' error: '+e.Message + ' resposta: '+aJsonString );

        end;



    end else begin
        //writeln ( memLogFile, sdt +'; ' + inttostr(aId) + '; ', inttostr(aResponseCode) + '; 0; 0');
        GLog.Log(self,[lcDebug],'postResponse  id:'+ inttostr(aId) + ' '+ inttostr(aResponseCode)+ ' '+ inttostr(length(aJsonString)) + #13#10 + aJsonString );
    end;

    GLog.ForceLogWrite;

end;

end.
