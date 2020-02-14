unit ncUploadPost;

interface

uses
   Windows, SysUtils, ExtCtrls, classes, controls, StdCtrls,
   IdBaseComponent, IdComponent, IdTCPConnection,  IdCookieManager,
   IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
   SyncObjs, DateUtils,IdCookie, uHMAC_sha256, uLogs;


 type

   TResponseEvent     = procedure(Sender: TObject; aId:integer; aResponseCode:integer; aJsonQueryString, aJsonResponseString: string; aExecTime: int64) of object;

   TncUploadPost = class(TObject)
    private
      //fFinished: boolean;
      fResponseCode: integer;
      fId : integer;
      fRecords : string;
      fPaylodSecret: string;
      fJsonQueryString : string;
      fJsonResponseString : string;
      fOnResponse   : TResponseEvent;
      fExecTime: int64;
      fIdHTTP1: TIdHTTP;
      fIdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
      procedure IdHTTP1Redirect(Sender: TObject; var dest: string;
        var NumRedirect: Integer; var Handled: Boolean;
        var VMethod: TIdHTTPMethod);
    protected
      procedure doResponse;
   public
      property ExecTime: int64 read fExecTime;
      //property Finished: boolean read fFinished;
      property ID: integer read fID;
      property JsonString: string read fJsonQueryString write  fJsonQueryString;
      property PaylodSecret: string read fPaylodSecret write  fPaylodSecret;
      property Records: string read fRecords write fRecords;
      property ResponseCode: integer read fResponseCode;
      property OnResponse : TResponseEvent read fOnResponse write fOnResponse;
      procedure Run(aPostId: integer);
      constructor Create;
      destructor Destroy; override;
end;


implementation

uses
    ncUploadConst;        
    
{ TncUploadPost }

constructor TncUploadPost.Create;
begin

     inherited Create;

     fIdSSLIOHandlerSocket1:= TIdSSLIOHandlerSocket.Create(nil);
     fIdHTTP1:= TIdHTTP.Create(nil);
     fIdHTTP1.IOHandler := fIdSSLIOHandlerSocket1;
     fIdHTTP1.Host := kMongodbStichWebhooksHost;
     fIdHTTP1.Port := 80;
     fIdHTTP1.OnRedirect := IdHTTP1Redirect;
     fidHTTP1.AllowCookies := True;
     fIdHTTP1.HandleRedirects := True;

     GLog.Log(self,[lcDebug],'TncUploadPost Create '+inttostr(id));

end;

destructor TncUploadPost.Destroy;
begin
     GLog.Log(self,[lcDebug],'TncUploadPost Destroy '+inttostr(fId));

     fIdSSLIOHandlerSocket1.Free;
     fIdHTTP1.Free;

     inherited;
end;


procedure TncUploadPost.Run(aPostId: integer);
var
    startQueryDT : TDateTime;
    responseQueryDT : TDateTime;
    upStream: TStringStream;
    sl : TStringList;
begin
     inherited;

     fId := aPostId;
     startQueryDT := now;

     try

         GLog.Log(self,[lcDebug],'trh ' + inttostr(Fid) +  ' POST '+inttostr(length(fJsonQueryString)));
         //GLog.Log(self,[lcDebug],'trh ' + inttostr(Fid) +  ' POST ' + #13#10 +fJsonQueryString);
         GLog.ForceLogWrite;

         fIdHTTP1.Request.CustomHeaders.Clear;
         fIdHTTP1.Request.CustomHeaders.Add(
            'X-Hook-Signature:sha256='+
            tHmac_sha256.calc(  fPaylodSecret , fJsonQueryString));

         upStream := TStringStream.Create(fJsonQueryString);
         fResponseCode := 0;
         try
             fJsonResponseString:='';
             upStream.Seek(0,0);
             try
                 GLog.Log(self,[lcDebug],'trh ' + inttostr(Fid) +  ' POST /api/.../'+kWebhookPostResults);
                 //raise EIdHTTPProtocolException.CreateError(401, 'Pau', 'Pau' );

                 fJsonResponseString := fIdHTTP1.Post( kMongodbStichWebhooksUrl + kWebhookPostResults, upStream);
                 fResponseCode := 200;
                 responseQueryDT := now;
             except
                on E: EIdHTTPProtocolException do begin
                    responseQueryDT := now;
                    fResponseCode := fIdHTTP1.ResponseCode;
                    if fJsonResponseString='' then
                        fJsonResponseString := 'HTTP Error ' + inttostr(fIdHTTP1.ResponseCode) + ' :' + e.Message;
                    GLog.Log(self,[lcExcept],'a trh ' + inttostr(Fid) +  ' Error(' + e.ClassName + '): '+ e.Message );
                    GLog.Log(self,[lcExcept],'a trh ' + inttostr(Fid) +  ': ' +  fJsonResponseString);

                    if e is EIdHTTPProtocolException then begin
                          sl := TStringList.create;
                          try
                            sl.Text :=  'POST https://' + kMongodbStichWebhooksHost + kMongodbStichWebhooksUrl + kWebhookPostResults;
                            sl.Add(fIdHTTP1.Request.CustomHeaders.Text);
                            sl.Add('');
                            upStream.Seek(0,0);
                            sl.Add(upStream.DataString);
                            sl.SaveToFile('c:\pp.txt');
                          finally
                            sl.free;
                          end;

                    end;
                end;
             end;

         finally
             upStream.free;
         end;

         fExecTime := dateutils.MilliSecondsBetween(startQueryDT, responseQueryDT);
         GLog.Log(self,[lcDebug],'Query exec time (' + inttostr(Fid) + ') ' + inttostr( fExecTime) + ' ms');

         try
             doResponse();
         except
            on E: Exception do begin
                GLog.Log(self,[lcExcept],'c trh ' + inttostr(Fid) +  ' Error:' + e.Message);
            end;
         end;

     except
        on E: Exception do begin
            GLog.Log(self,[lcExcept],'b trh ' + inttostr(Fid) +  ' Error:' + e.Message);
        end;
     end;

    //GLog.Log(self,[lcDebug],'TncUploadPost Run end ' + inttostr(Fid) );

    //fFinished := true;
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
        fOnResponse(self, fid, fResponseCode, fJsonQueryString, fJsonResponseString, fExecTime);
    end;
end;


end.
