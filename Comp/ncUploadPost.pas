unit ncUploadPost;

interface

uses
   Windows, SysUtils, ExtCtrls, classes, controls, StdCtrls,
   IdBaseComponent, IdComponent, IdTCPConnection,  IdCookieManager,
   IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
   SyncObjs, DateUtils,IdCookie, uHMAC_sha256, uLogs;


 type

   TResponseEvent   = procedure(Sender: TObject; aId:integer; aResponseCode:integer; aJsonString: string; aExecTime: int64) of object;

   TncUploadPost = class(TObject)
    private
      fFinished: boolean;
      fResponseCode: integer;
      fId : integer;
      fRecords : string;
      fPaylodSecret: string;
      fJsonString : string;
      fOnResponse   : TResponseEvent;
      fExecTime: int64;
      IdHTTP1: TIdHTTP;
      IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
      procedure IdHTTP1Redirect(Sender: TObject; var dest: string;
        var NumRedirect: Integer; var Handled: Boolean;
        var VMethod: TIdHTTPMethod);
    protected
      procedure doResponse;
   public
      property ExecTime: int64 read fExecTime;
      property Finished: boolean read fFinished;
      property ID: integer read fID;
      property JsonString: string read fJsonString write  fJsonString;
      property PaylodSecret: string read fPaylodSecret write  fPaylodSecret;
      property Records: string read fRecords write fRecords;
      property ResponseCode: integer read fResponseCode;
      property OnResponse : TResponseEvent read fOnResponse write fOnResponse;
      procedure Run;
      constructor Create(id:integer);
      destructor Destroy; override;
end;


implementation

uses
    upLoadConst;
    
{ TncUploadPost }

constructor TncUploadPost.Create(id: integer);
begin

     inherited Create;

     GLog.Log(self,[lcDebug],'TncUploadPost Create '+inttostr(id));
     fId:=id;
end;

destructor TncUploadPost.Destroy;
begin
     GLog.Log(self,[lcDebug],'TncUploadPost Destroy '+inttostr(id));
     inherited;
end;


procedure TncUploadPost.Run;
var
    startQueryDT : TDateTime;
    responseQueryDT : TDateTime;
    upStream: TStringStream;
begin
    inherited;

    //GLog.Log(self,[lcDebug],'TncUploadPost Run init '+ inttostr(fid));

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


                 GLog.Log(self,[lcDebug],'trh ' + inttostr(Fid) +  ' POST '+inttostr(length(fJsonString)));
                 GLog.ForceLogWrite;

                 IdHTTP1.Request.CustomHeaders.Add(
                    'X-Hook-Signature:sha256='+
                    tHmac_sha256.calc(  fPaylodSecret , fJsonString));

                 upStream := TStringStream.Create(fJsonString);
                 fJsonString:='';
                 upStream.Seek(0,0);
                 try
                     GLog.Log(self,[lcDebug],'trh ' + inttostr(Fid) +  ' POST /api/...webhook0');
                     fJsonString := IdHTTP1.Post('/api/client/v2.0/app/upcafe-mysmu/service/svc1/incoming_webhook/webhook0', upStream);
                     responseQueryDT := now;
                     fResponseCode := 200;
                 except
                    on E: EIdHTTPProtocolException do begin
                        responseQueryDT := now;
                        fResponseCode := IdHTTP1.ResponseCode;
                        GLog.Log(self,[lcExcept],'trh ' + inttostr(Fid) +  ' Error:' + e.Message + ' '+ inttostr(idHTTP1.Response.ContentStream.Size));
                    end;
                 end;
                 upStream.free;

         finally
            IdSSLIOHandlerSocket1.Free;
            IdHTTP1.Free;
         end;

    fExecTime := dateutils.MilliSecondsBetween(startQueryDT, responseQueryDT);
    GLog.Log(self,[lcDebug],'Query exec time (' + inttostr(Fid) + ') ' + inttostr( fExecTime) + ' ms');

    doResponse();

    //GLog.Log(self,[lcDebug],'TncUploadPost Run end ' + inttostr(Fid) );

    fFinished := true;
end;

procedure TncUploadPost.IdHTTP1Redirect(Sender: TObject; var dest: string;
  var NumRedirect: Integer; var Handled: Boolean; var VMethod: TIdHTTPMethod);
begin
    Glog.Log(self, [lcDebug], 'redir dest '+dest);
    Glog.Log(self, [lcDebug], 'redir NumRedirect '+inttostr(NumRedirect));
    Glog.Log(self, [lcDebug], 'redir Handled '+booltostr(Handled, false));
    Glog.Log(self, [lcDebug], 'redir VMethod '+MethodString[VMethod]);
end;


procedure TncUploadPost.doResponse;
begin
    if assigned(fOnResponse) then begin
        //GLog.Log(self,[lcDebug], inttostr(Fid) +  ' doResponse');
        fOnResponse(self, fid, fResponseCode, fJsonString, fExecTime);
    end;
end;


end.
