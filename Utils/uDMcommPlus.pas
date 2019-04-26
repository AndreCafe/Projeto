unit uDMcommPlus;

interface

uses
  SysUtils, Classes, rtcDataCli, rtcInfo, rtcConn, rtcHttpCli, ExtCtrls;

type
  TplusReq = class
    ptrTokenNex : TGUID;
    ptrTokenPlus : String;

    ptrGettingToken : Boolean;

    ptrReq: TRTCDataRequest;
    ptrCli: TRTCHttpClient;
    ptrResp: String;

    FOnResp : TNotifyEvent;
    FOnFail : TNotifyEvent;
    FLastError : String;

  private
    procedure TimerAfterToken(Sender: TObject); virtual;
    procedure _ConnectError(Sender: TRtcConnection; E: Exception);
    procedure _ConnectFail(Sender: TRtcConnection);    
    procedure _ConnectLost(Sender: TRtcConnection);
    procedure _ResponseReject(Sender: TRtcConnection);    
    procedure _ResponseAbort(Sender: TRtcConnection);    
        
  protected  
    procedure _BeginRequest(Sender: TRtcConnection); virtual;
    procedure _ResponseDone(Sender: TRtcConnection); virtual;
    
    procedure prepareRequest; virtual; 
    procedure prepare_getToken; 
    function ptrTokenNexStr: String;
    function ptrKey: String;
    constructor Create; virtual;
    destructor Destroy; virtual;

  public
    procedure Start;  

    property Resposta: String read ptrResp;

    property OnResp: TNotifyEvent read FOnResp write FOnResp;
    property OnFail: TNotifyEvent read FOnFail write FOnFail;
  end;
  
  TplusPostTranReq = class ( TplusReq )
    ptrConta : String;
    ptrParceiro : String;
    ptrIDTranParceiro : String;
    ptrIDTranNex : String;
    ptrDTTranNex : TDateTime;
    ptrDescr : String;
    
    ptrDTTranParceiro : TDateTime;
    ptrValor : Double;
    ptrPIN : String;
    ptrSucesso : Boolean;
    ptrObs : String;

  protected

    procedure prepareRequest; override;

    constructor Create; override;
  end;
  
  TDataModule1 = class(TDataModule)
  private
    { Private declarations }
    sl : TStrings;

  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses ncaK;

{$R *.dfm}

const BoolStr : Array[Boolean] of Char = ('0', '1');

{ TplusReq }

constructor TplusReq.Create;
begin
  FOnResp := nil;
  FOnFail := nil;
  FLastError := '';
  ptrGettingToken := False;
  ptrCli := TRTCHTTPClient.Create;
  
  ptrReq := TRtcDataRequest.Create(nil);
  ptrReq.Client := ptrCli;
  ptrReq.OnBeginRequest := _BeginRequest;
  ptrReq.OnResponseDone := _ResponseDone;
  
  CreateGUID(ptrTokenNex)  
end;

destructor TplusReq.Destroy;
begin
  ptrReq.Free;
  ptrCli.Free;
  inherited;
end;

procedure TplusReq.prepareRequest;
begin
  ptrReq.Request.Host := 'plus.dev.nexcafe.com.br';
  ptrReq.Request.Method := 'GET';
end;

procedure TplusReq.prepare_getToken;
begin
  with ptrReq.Request do begin
    ptrGettingToken := True;
    Method:='GET';
    FileName:='/api/tokenplus/get/';
    Host:='plus.dev.nexcafe.com.br';
    ptrCli.ServerAddr := Host;
    Query.Text := '';
  end;
end;

function TplusReq.ptrKey: String;
begin
  nexGetKH(1, ptrTokenPlus, '', '');
end;

function TplusReq.ptrTokenNexStr: String;
begin
  Result := GUIDToString(ptrTokenNex);
end;

procedure TplusReq.Start;
begin
  ptrTokenPlus := '';
  ptrResp := '';
  prepare_getToken;
  ptrReq.Post;
end;

procedure TplusReq.TimerAfterToken(Sender: TObject);
begin
  Sender.Free;
  prepareRequest;
  ptrReq.Post;
end;

procedure TplusReq._BeginRequest(Sender: TRtcConnection);
begin
  ptrReq.Client.WriteHeader;
end;

procedure TplusReq._ConnectError(Sender: TRtcConnection; E: Exception);
begin
  FLastError := 'Connect Error: '+ E.Message;
  if Assigned(FOnFail) then FOnFail(Self);
end;

procedure TplusReq._ConnectFail(Sender: TRtcConnection);
begin
  FLastError := 'Connect Fail';
  if Assigned(FOnFail) then FOnFail(Self);
end;

procedure TplusReq._ConnectLost(Sender: TRtcConnection);
begin
  FLastError := 'Connect Lost';
  if Assigned(FOnFail) then FOnFail(Self);
end;

procedure TplusReq._ResponseAbort(Sender: TRtcConnection);
begin
  FLastError := 'Response Abort';
  if Assigned(FOnFail) then FOnFail(Self);
end;

procedure TplusReq._ResponseDone(Sender: TRtcConnection);
begin
  ptrResp := Sender.Read;
  Sender.Disconnect;
  
  if ptrGettingToken then begin 
    ptrGettingToken := False;
    ptrTokenPlus := ptrResp;
    ptrResp := '';
    with TTimer.Create(nil) do begin
      Interval := 500;
      OnTimer := TimerAfterToken;
      Enabled := True;
    end;
  end else 
    if Assigned(FOnResp) then FOnResp(Self);
end;

procedure TplusReq._ResponseReject(Sender: TRtcConnection);
begin
  FLastError := 'Response Reject';
  if Assigned(FOnFail) then FOnFail(Self);
end;

{ TplusPostTranReq }

constructor TplusPostTranReq.Create;
begin
  inherited;

  ptrConta := '';
  ptrParceiro := '';
  ptrDescr := '';
  ptrIDTranParceiro := ''; 
  ptrIDTranNex := '';
  ptrDTTranParceiro := 0;
  ptrDTTranNex := 0;
  ptrValor := 0;
  ptrPIN := ''; 
  ptrSucesso := False;
  ptrObs := ''; 
end;

procedure TplusPostTranReq.prepareRequest;
var S: String; Code: Integer;
begin
  inherited;

  with ptrReq.Request do begin
    Filename := '/api/transacoes/salvar/';
  
    Query.asString['account'] := ptrConta;
    Query.asString['partner_id'] := ptrParceiro;

    Query.asString['transaction_partner_id'] := ptrIDTranParceiro;
    Query.asString['transaction_partner_datetime'] := FormatDateTime('yyyy-mm-dd hh:mm:ss', ptrDTTranParceiro);
    Query.asString['transaction_nexcafe_id'] := ptrIDTranNex;
    Query.asString['transaction_nexcafe_datetime'] := FormatDateTime('yyyy-mm-dd hh:mm:ss', ptrDTTranNex);

    Val(S, ptrValor, Code); 

    Query.asString['description'] := ptrDescr;
    Query.asString['value'] := S;
    Query.asString['pin'] := ptrPIN;
    Query.asString['success'] := BoolStr[ptrSucesso];
    Query.asString['comment'] := ptrObs;   
    Query.asString['key'] := nexGetKH(1, ptrKey, '', '');
    Query.asString['tokennex'] := ptrTokenNexStr;
    Query.asString['tokenplus'] := ptrTokenPlus;
  end;

end;


end.
