unit ncUploadGetParams;

interface

uses
   Windows, SysUtils, ExtCtrls, classes, controls, StdCtrls,
   IdBaseComponent, IdComponent, IdTCPConnection,  IdCookieManager,
   IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
   SyncObjs, DateUtils,IdCookie, uLogs, uJson, ncUploadConst;

type

   TUploadParams = class(TPersistent)
     private

        fOid: string;
        fVersion: integer;
        fMainDelayS: integer;
        fRecordsByRequest: integer;
        fMaxRecords: integer;
        fInterBlockDelayS : integer;
        fQuery : string;
        procedure Clear;
     public
        property Oid: string read fOid;
        property Version: integer read fVersion;
        property MainDelayS: integer read fMainDelayS;
        property RecordsByRequest: integer read fRecordsByRequest;
        property MaxRecords: integer read fMaxRecords;
        property InterBlockDelayS: integer read fInterBlockDelayS;
        property Query: string read fQuery;

        procedure Assign(Source: TPersistent); override;
        procedure ReadJson(aJsonArr: TJsonArray);
        function asString:string;
        constructor Create(
          aOid: string = '';
          aVersion: integer = kDefVersion;
          aMainDelayS: integer = kDefMainDelayS;
          aRecordsByRequest: integer = kDefRecordsByRequest;
          aMaxRecords: integer = kDefMaxRecords;
          aInterBlockDelayS: integer = kDefInterBlockDelayS );
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
      procedure IdHTTP1Redirect(Sender: TObject; var dest: string;
        var NumRedirect: Integer; var Handled: Boolean;
        var VMethod: TIdHTTPMethod);
   protected
      procedure doResponse;
   public
      property Params: TUploadParams read fParams;
      property ExecTime: int64 read fExecTime;
      property Finished: boolean read fFinished;
      property PaylodSecret: string read fPaylodSecret write  fPaylodSecret;
      property OnResponse : TUpdloadParamsResponseEvent read fOnResponse write fOnResponse;
      function Run(aThread: TThread):boolean;
      constructor Create(
        aOid: string = '';
        aVersion: integer = kDefVersion;
        aMainDelayS: integer = kDefMainDelayS;
        aRecordsByRequest: integer = kDefRecordsByRequest;
        aMaxRecords: integer = kDefMaxRecords;
        aInterBlockDelayS: integer = kDefInterBlockDelayS );
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
        aInterBlockDelayS: integer = kDefInterBlockDelayS );
begin

     inherited Create;

     fParams := TUploadParams.create( aOid, aVersion, aMainDelayS, aRecordsByRequest, aMaxRecords, aInterBlockDelayS);

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
                //jObj := TJsonObject.create(res);
                jArr := TJsonArray.create(res);
                try
                   GLog.Log(self,[lcDebug],'webHookGetQueries -> ' + kWebHookGetQueries + ': '+ jArr.toString);
                   GLog.ForceLogWrite;
                   fParams.ReadJson(jArr);
                 finally
                    jArr.Free;
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

    doResponse;

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

procedure TGetUploadParams.doResponse;
begin
    if assigned(fOnResponse) then begin
        //GLog.Log(self,[lcDebug], inttostr(Fid) +  ' doResponse');
        fOnResponse(self, fResult, fParams, fExecTime);
    end;
end;


{ TUploadParams }

procedure TUploadParams.Assign(Source: TPersistent);
begin
    if Source<>nil then begin
       fOid := TUploadParams(Source).Oid;
       fVersion := TUploadParams(Source).Version;
       fMainDelayS := TUploadParams(Source).MainDelayS;
       fRecordsByRequest := TUploadParams(Source).RecordsByRequest;
       fMaxRecords := TUploadParams(Source).MaxRecords;
       fInterBlockDelayS := TUploadParams(Source).InterBlockDelayS;
       fQuery := TUploadParams(Source).Query;
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
        'Query: "'+ fQuery + '"';
end;

procedure TUploadParams.Clear;
begin
    fOid    := '';
    fVersion := kDefVersion;
    fMainDelayS := kDefMainDelayS;
    fRecordsByRequest := kDefRecordsByRequest;
    fMaxRecords := kDefMaxRecords;
    fInterBlockDelayS := kDefInterBlockDelayS;
    fQuery := '';

end;

constructor TUploadParams.Create(
          aOid: string = '';
          aVersion: integer = kDefVersion;
          aMainDelayS: integer = kDefMainDelayS;
          aRecordsByRequest: integer = kDefRecordsByRequest;
          aMaxRecords: integer = kDefMaxRecords;
          aInterBlockDelayS: integer = kDefInterBlockDelayS );
begin
    inherited create;

    fOid := aOid;
    fVersion := aVersion;
    fMainDelayS := aMainDelayS;
    fRecordsByRequest := aRecordsByRequest;
    fMaxRecords := aMaxRecords;
    fInterBlockDelayS := aInterBlockDelayS;
    fQuery := '';

end;

procedure TUploadParams.ReadJson(aJsonArr: TJsonArray);
var
    aJsonObj: TJsonObject;
begin
    Clear;

        Glog.Log(self, [lcDebug], 'aJsonArr.length '+inttostr(aJsonArr.length));

        aJsonObj := aJsonArr.getJSONObject(0);

        fOid := aJsonObj.getJSONObject('_Id').getString('$oid');
        fVersion := strtoint( aJsonObj.getJSONObject('Version').getString('$numberInt'));
        fMainDelayS := strtoint( aJsonObj.getJSONObject('MainDelayS').getString('$numberLong'));
        fInterBlockDelayS := strtoint( aJsonObj.getJSONObject('InterBlockDelayS').getString('$numberLong'));
        fMaxRecords := strtoint( aJsonObj.getJSONObject('MaxRecords').getString('$numberLong'));
        fRecordsByRequest := strtoint( aJsonObj.getJSONObject('RecordsByRequest').getString('$numberLong'));
        fQuery := aJsonObj.getString('Query');


end;

end.
