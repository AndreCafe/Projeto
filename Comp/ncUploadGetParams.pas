unit ncUploadGetParams;

interface

uses
   Windows, SysUtils, ExtCtrls, classes, controls, StdCtrls,
   IdBaseComponent, IdComponent, IdTCPConnection,  IdCookieManager,
   IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
   SyncObjs, DateUtils,IdCookie, uLogs, uJson, ncUploadConst, strutils,
   uMd5;

type

   TUploadParams = class(TPersistent)
     private

        fOid: string;
        fVersion: integer;
        fMainDelayS: integer;
        fRecordsByRequest: integer;
        fMaxRecords: integer;
        fInterBlockDelayS : integer;
        fServerQuery : string;
        fSendSummary: boolean;
        fEmail: string;
        procedure Clear;
     public
        property ServerOid: string read fOid;
        property RemoteUploadVersion: integer read fVersion;
        property MainDelayS: integer read fMainDelayS;
        property RecordsByRequest: integer read fRecordsByRequest;
        property MaxRecords: integer read fMaxRecords;
        property InterBlockDelayS: integer read fInterBlockDelayS;
        property ServerQuery: string read fServerQuery;
        property SendSummary: boolean read fSendSummary;
        property Email: string read fEmail write fEmail;
        procedure Assign(Source: TPersistent); override;
        procedure ReadJson(aJsonArr: TJsonArray);
        function asString:string;
        constructor Create(
          aOid: string = '';
          aVersion: integer = kDefVersion;
          aMainDelayS: integer = kDefMainDelayS;
          aRecordsByRequest: integer = kDefRecordsByRequest;
          aMaxRecords: integer = kDefMaxRecords;
          aInterBlockDelayS: integer = kDefInterBlockDelayS;
          aSendSummary: boolean = kDefSendSummary );
     end;

   TUpdloadParamsResponseEvent   = procedure(Sender: TObject; aResult: boolean; aParams: TUploadParams; aExecTime: int64) of object;

   TGetUploadParams = class(TObject)
    private
      fFinished: boolean;
      fResult : boolean;
      fPaylodSecret: string;
      fOnResponse   : TUpdloadParamsResponseEvent;
      fExecTime: int64;
      IdHTTP1: TIdHTTP;
      IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
      fParams : TUploadParams;
      fEmail: string;
      procedure IdHTTP1Redirect(Sender: TObject; var dest: string;
        var NumRedirect: Integer; var Handled: Boolean;
        var VMethod: TIdHTTPMethod);
   protected
      //procedure doResponse;
   public
      property Params: TUploadParams read fParams;
      property ExecTime: int64 read fExecTime;
      property Finished: boolean read fFinished;
      property PaylodSecret: string read fPaylodSecret write  fPaylodSecret;
      property OnResponse : TUpdloadParamsResponseEvent read fOnResponse write fOnResponse;
      property Email: string read fEmail write fEmail;
      function Run(aThread: TThread):boolean;
      constructor Create(
        aOid: string = '';
        aVersion: integer = kDefVersion;
        aMainDelayS: integer = kDefMainDelayS;
        aRecordsByRequest: integer = kDefRecordsByRequest;
        aMaxRecords: integer = kDefMaxRecords;
        aInterBlockDelayS: integer = kDefInterBlockDelayS;
        aSendSummary: boolean = kDefSendSummary );
      destructor Destroy; override;
end;



implementation

{ TGetUploadParams }

constructor TGetUploadParams.Create(
        aOid: string = '';
        aVersion: integer = kDefVersion;
        aMainDelayS: integer = kDefMainDelayS;
        aRecordsByRequest: integer = kDefRecordsByRequest;
        aMaxRecords: integer = kDefMaxRecords;
        aInterBlockDelayS: integer = kDefInterBlockDelayS;
        aSendSummary: boolean = kDefSendSummary );
begin

     inherited Create;

     fParams := TUploadParams.create( aOid, aVersion, aMainDelayS, aRecordsByRequest, aMaxRecords, aInterBlockDelayS, aSendSummary);
     
     GLog.Log(self,[lcDebug],'TGetUploadParams Create ');

end;

destructor TGetUploadParams.Destroy;
begin
  fParams.Free;
  inherited;
end;

function TGetUploadParams.Run(aThread: TThread):boolean;
var
    startQueryDT : TDateTime;
    responseQueryDT : TDateTime;
    res : string;
    //jObj : TJsonObject;
    jArr : TJsonArray;
    retry : integer;
begin
    inherited;

    result := true;
    fResult := false;
    retry := 0;
    startQueryDT := now;
    responseQueryDT := now;
    fParams.Email := fEmail;

    while (not(fResult) and (retry<3)) do  begin

         inc(retry);

         startQueryDT := now;

         IdSSLIOHandlerSocket1:= TIdSSLIOHandlerSocket.Create(nil);
         IdHTTP1:= TIdHTTP.Create(nil);
         IdHTTP1.IOHandler := IdSSLIOHandlerSocket1;
         try
             IdHTTP1.Host := kMongodbStichWebhooksHost;
             IdHTTP1.Port := 80;
             IdHTTP1.OnRedirect := IdHTTP1Redirect;
             idHTTP1.AllowCookies := True;
             IdHTTP1.HandleRedirects := True;

             try
                res := IdHTTP1.Get( kMongodbStichWebhooksUrl + kWebHookGetQueries + '?secret='+fPaylodSecret);
                responseQueryDT := now;

                if res<>'[]' then begin
                    jArr := TJsonArray.create(res);
                    try
                       GLog.Log(self,[lcDebug],'webHookGetQueries -> ' + kWebHookGetQueries + ': '+ jArr.toString);
                       GLog.ForceLogWrite;
                       fParams.ReadJson(jArr);
                     finally
                        jArr.Free;
                    end;
                end;
                fResult := true;

             except
                on E: Exception do begin
                    responseQueryDT := now;
                    GLog.Log(self,[lcExcept],'webHookGetQueries Error:' + e.Message);
                end;
             end;

         finally
            IdSSLIOHandlerSocket1.Free;
            IdHTTP1.Free;
         end;
    end;

    if not(fResult) then
        GLog.Log(self,[lcDebug],'Não foi possível contatar o servidor');


    fExecTime := dateutils.MilliSecondsBetween(startQueryDT, responseQueryDT);
    GLog.Log(self,[lcDebug],'Query exec time ' + inttostr( fExecTime) + ' ms');

    //doResponse;

    GLog.Log(self,[lcDebug],'TGetUploadParams Run end ');

    fFinished := true;
end;

procedure TGetUploadParams.IdHTTP1Redirect(Sender: TObject; var dest: string;
  var NumRedirect: Integer; var Handled: Boolean; var VMethod: TIdHTTPMethod);
begin
    Glog.Log(self, [lcDebug], 'redir dest '+dest);
    Glog.Log(self, [lcDebug], 'redir NumRedirect '+inttostr(NumRedirect));
    Glog.Log(self, [lcDebug], 'redir Handled '+booltostr(Handled, false));
    Glog.Log(self, [lcDebug], 'redir VMethod '+MethodString[VMethod]);
end;

//procedure TGetUploadParams.doResponse;
//begin
//    if assigned(fOnResponse) then begin
//        //GLog.Log(self,[lcDebug], inttostr(Fid) +  ' doResponse');
//        fOnResponse(self, fResult, fParams, fExecTime);
//    end;
//end;


{ TUploadParams }

procedure TUploadParams.Assign(Source: TPersistent);
begin
    if Source<>nil then begin
       fOid := TUploadParams(Source).ServerOid;
       fVersion := TUploadParams(Source).RemoteUploadVersion;
       fMainDelayS := TUploadParams(Source).MainDelayS;
       fRecordsByRequest := TUploadParams(Source).RecordsByRequest;
       fMaxRecords := TUploadParams(Source).MaxRecords;
       fInterBlockDelayS := TUploadParams(Source).InterBlockDelayS;
       fServerQuery := TUploadParams(Source).ServerQuery;
       fSendSummary := TUploadParams(Source).SendSummary;
    end;
end;

function TUploadParams.asString: string;
begin
    result :=
        'Oid: '+ fOid + ', '+
        'Version: '+intToStr(fVersion) + ', '+
        'MainDelayS: '+intToStr(fMainDelayS) + ', '+
        'RecordsByRequest: '+intToStr(fRecordsByRequest) + ', '+
        'MaxRecords: '+intToStr(fMaxRecords) + ', '+
        'InterBlockDelayS: '+intToStr(fInterBlockDelayS) + ', '+
        'Query: "'+ fServerQuery + '", '+
        'SendSummary: '+ boolToStr(fSendSummary, true);
end;

procedure TUploadParams.Clear;
begin
    fOid    := '';
    fVersion := kDefVersion;
    fMainDelayS := kDefMainDelayS;
    fRecordsByRequest := kDefRecordsByRequest;
    fMaxRecords := kDefMaxRecords;
    fInterBlockDelayS := kDefInterBlockDelayS;
    fServerQuery := '';
    fSendSummary := false;

end;

constructor TUploadParams.Create(
          aOid: string = '';
          aVersion: integer = kDefVersion;
          aMainDelayS: integer = kDefMainDelayS;
          aRecordsByRequest: integer = kDefRecordsByRequest;
          aMaxRecords: integer = kDefMaxRecords;
          aInterBlockDelayS: integer = kDefInterBlockDelayS;
          aSendSummary: boolean = kDefSendSummary );
begin
    inherited create;

    fOid := aOid;
    fVersion := aVersion;
    fMainDelayS := aMainDelayS;
    fRecordsByRequest := aRecordsByRequest;
    fMaxRecords := aMaxRecords;
    fInterBlockDelayS := aInterBlockDelayS;
    fServerQuery := '';
    fSendSummary := aSendSummary;

end;

procedure TUploadParams.ReadJson(aJsonArr: TJsonArray);
var
    jsonObj: TJsonObject;
    s : string;
    usersStringList : TStringList;
begin
    Clear;

        Glog.Log(self, [lcDebug], 'aJsonArr.length '+inttostr(aJsonArr.length));

        jsonObj := aJsonArr.getJSONObject(0);
        try
            if jsonObj.has('_Id') then
                fOid := jsonObj.getJSONObject('_Id').getString('$oid');
            if jsonObj.has('Version') then
                fVersion := strtoint( jsonObj.getJSONObject('Version').getString('$numberInt'));
            if jsonObj.has('MainDelayS') then
                fMainDelayS := strtoint( jsonObj.getJSONObject('MainDelayS').getString('$numberLong'));
            if jsonObj.has('InterBlockDelayS') then
                fInterBlockDelayS := strtoint( jsonObj.getJSONObject('InterBlockDelayS').getString('$numberLong'));
            if jsonObj.has('MaxRecords') then
                fMaxRecords := strtoint( jsonObj.getJSONObject('MaxRecords').getString('$numberLong'));
            if jsonObj.has('RecordsByRequest') then
                fRecordsByRequest := strtoint( jsonObj.getJSONObject('RecordsByRequest').getString('$numberLong'));
            if jsonObj.has('Query') then
                fServerQuery := stringReplace(jsonObj.getString('Query'),'\"','"',[rfReplaceAll]);
            if jsonObj.has('sendSummary') then
                fSendSummary := jsonObj.getBoolean('sendSummary');

            if jsonObj.has('target') then try

                    s := jsonObj.getJSONArray('target').toString;
                    s := copy(s, 2, length(s)-2);
                    usersStringList := TStringList.create;
                    try
                        usersStringList.CommaText := s;
                        if usersStringList.IndexOf(string(uMd5.H(femail)))>-1 then
                            GLog.Log(self,[lcDebug],'for me')
                        else
                            fVersion := -2;

                    finally
                        usersStringList.free;
                    end;

                except
                    on e: exception do begin
                        GLog.Log(self,[lcExcept], 'ReadJson.users: '+ e.Message);
                    end;
                end;
        except
            on e: exception do begin
                GLog.Log(self,[lcExcept], 'ReadJson: '+ e.Message);
                fVersion := -1;
            end;

        end;

end;

end.
