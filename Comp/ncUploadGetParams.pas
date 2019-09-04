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
        fActive: boolean;
        fVersion: integer;
        fIniDelayM: integer;
        fMainDelayM: integer;
        fRecordsByRequest: integer;
        fMaxRecords: integer;
        fInterBlockDelayM : integer;
        procedure Clear;
     public
        property Version: integer read fVersion;
        property Active: boolean read fActive;
        property IniDelayM: integer read fIniDelayM;
        property MainDelayM: integer read fMainDelayM;
        property RecordsByRequest: integer read fRecordsByRequest;
        property MaxRecords: integer read fMaxRecords;
        property InterBlockDelayM: integer read fInterBlockDelayM;

        procedure Assign(Source: TPersistent); override;
        procedure ReadJson(aJsonObj:TJsonObject);
        function asString:string;
        constructor Create(
          aActive : boolean = kDefActive;
          aVersion: integer = kDefVersion;
          aIniDelayM: integer = kDefIniDelayM;
          aMainDelayM: integer = kDefMainDelayM;
          aRecordsByRequest: integer = kDefRecordsByRequest;
          aMaxRecords: integer = kDefMaxRecords;
          aInterBlockDelayM: integer = kDefInterBlockDelayM );
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
        aActive : boolean = kDefActive;
        aVersion: integer = kDefVersion;
        aIniDelayM: integer = kDefIniDelayM;
        aMainDelayM: integer = kDefMainDelayM;
        aRecordsByRequest: integer = kDefRecordsByRequest;
        aMaxRecords: integer = kDefMaxRecords;
        aInterBlockDelayM: integer = kDefInterBlockDelayM );
      destructor Destroy; override;
end;



implementation

{ TGetUploadParams }

constructor TGetUploadParams.Create(
        aActive : boolean = kDefActive;
        aVersion: integer = kDefVersion;
        aIniDelayM: integer = kDefIniDelayM;
        aMainDelayM: integer = kDefMainDelayM;
        aRecordsByRequest: integer = kDefRecordsByRequest;
        aMaxRecords: integer = kDefMaxRecords;
        aInterBlockDelayM: integer = kDefInterBlockDelayM );
begin

     inherited Create;

     fParams := TUploadParams.create( aActive, aVersion, aIniDelayM, aMainDelayM, aRecordsByRequest, aMaxRecords, aInterBlockDelayM);

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
    jObj : TJsonObject;
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
             IdHTTP1.Host := 'webhooks.mongodb-stitch.com';
             IdHTTP1.Port := 80;
             IdHTTP1.OnRedirect := IdHTTP1Redirect;
             idHTTP1.AllowCookies := True;
             IdHTTP1.HandleRedirects := True;

             try
                res := IdHTTP1.Get('/api/client/v2.0/app/upcafe-mysmu/service/svc1/incoming_webhook/webhook1?secret='+fPaylodSecret);
                responseQueryDT := now;
                jObj := TJsonObject.create(res);
                try
                   GLog.Log(self,[lcDebug],'webhook1 json: '+ jObj.toString);
                   GLog.ForceLogWrite;
                   fParams.ReadJson(jObj);
                 finally
                    jObj.Free;
                end;
                fResult := true;
             except
                on E: Exception do begin
                    responseQueryDT := now;
                    GLog.Log(self,[lcExcept],'get Error:' + e.Message);
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
       fActive := TUploadParams(Source).Active;
       fVersion := TUploadParams(Source).Version;
       fIniDelayM := TUploadParams(Source).IniDelayM;
       fMainDelayM := TUploadParams(Source).MainDelayM;
       fRecordsByRequest := TUploadParams(Source).RecordsByRequest;
       fMaxRecords := TUploadParams(Source).MaxRecords;
       fInterBlockDelayM := TUploadParams(Source).InterBlockDelayM;
    end;
end;

function TUploadParams.asString: string;
begin
    result :=
        'Version: '+intToStr(fVersion) + ', '+
        'Active: '+boolToStr(fActive, true) + ', '+
        'IniDelayM: '+intToStr(fIniDelayM) + ', '+
        'MainDelayM: '+intToStr(fMainDelayM) + ', '+
        'RecordsByRequest: '+intToStr(fRecordsByRequest) + ', '+
        'MaxRecords: '+intToStr(fMaxRecords) + ', '+
        'InterBlockDelayM: '+intToStr(fInterBlockDelayM);
end;

procedure TUploadParams.Clear;
begin
    fActive := kDefActive;
    fVersion := kDefVersion;
    fIniDelayM := kDefIniDelayM;
    fMainDelayM := kDefMainDelayM;
    fRecordsByRequest := kDefRecordsByRequest;
    fMaxRecords := kDefMaxRecords;
    fInterBlockDelayM := kDefInterBlockDelayM;
end;

constructor TUploadParams.Create(
        aActive : boolean = kDefActive;
        aVersion: integer = kDefVersion;
        aIniDelayM: integer = kDefIniDelayM;
        aMainDelayM: integer = kDefMainDelayM;
        aRecordsByRequest: integer = kDefRecordsByRequest;
        aMaxRecords: integer = kDefMaxRecords;
        aInterBlockDelayM: integer = kDefInterBlockDelayM );
begin
    inherited create;

    fActive := aActive;
    fVersion := aVersion;
    fIniDelayM := aIniDelayM;
    fMainDelayM := aMainDelayM;
    fRecordsByRequest := aRecordsByRequest;
    fMaxRecords := aMaxRecords;
    fInterBlockDelayM := aInterBlockDelayM;

end;

procedure TUploadParams.ReadJson(aJsonObj: TJsonObject);
begin
    Clear;
    if aJsonObj.getBoolean('Error')=false then  begin
        fActive := aJsonObj.getBoolean('Active');
        fVersion := strtoint( aJsonObj.getJSONObject('Version').getString('$numberLong'));
        fIniDelayM := strtoint( aJsonObj.getJSONObject('IniDelayM').getString('$numberLong'));
        fMainDelayM := strtoint( aJsonObj.getJSONObject('MainDelayM').getString('$numberLong'));
        fRecordsByRequest := strtoint( aJsonObj.getJSONObject('RecordsByRequest').getString('$numberLong'));
        fMaxRecords := strtoint( aJsonObj.getJSONObject('MaxRecords').getString('$numberLong'));
        fInterBlockDelayM := strtoint( aJsonObj.getJSONObject('InterBlockDelayM').getString('$numberLong'));
    end;

end;

end.
