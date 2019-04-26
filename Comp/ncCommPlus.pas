unit ncCommPlus;

interface

uses
  SysUtils, Classes, rtcDataCli, rtcInfo, rtcConn, rtcHttpCli, ExtCtrls, dialogs;

type
  TplusReq = class
    ptrTokenNex : TGUID;
    ptrTokenPlus : String;

    ptrGettingToken : Boolean;

    ptrReq: TRTCDataRequest;
    ptrCli: TRTCHttpClient;
    ptrResp: TStrings;

    FOnResp : TNotifyEvent;
    FOnFail : TNotifyEvent;
    FLastError : String;
    FNoFreeAfterResp : Boolean;

  private
    procedure TimerAfterToken(Sender: TObject); virtual;
    procedure TimerConectar(Sender: TObject);
    procedure TimerConectado(Sender: TObject);
    
    procedure _ConnectOk(Sender: TRtcConnection);
    procedure _ConnectError(Sender: TRtcConnection; E: Exception);
    procedure _ConnectFail(Sender: TRtcConnection);    
    procedure _ConnectLost(Sender: TRtcConnection);
    procedure _ResponseReject(Sender: TRtcConnection);    
    procedure _ResponseAbort(Sender: TRtcConnection);  
    procedure _CreateRTC;  
    procedure _FreeRTC;

  protected  
    procedure _BeginRequest(Sender: TRtcConnection); virtual;
    procedure _ResponseDone(Sender: TRtcConnection); virtual;
    
    procedure prepareRequest; virtual; 
    procedure prepare_getToken; 
    function ptrTokenNexStr: String;
    function ptrKey: String;
    destructor Destroy; virtual;

  public
    constructor Create; virtual;
    procedure Start;  

    property Resposta: TStrings read ptrResp;
    property LastError: String read FLastError;

    property NoFreeAfterResp: Boolean read FNoFreeAfterResp write FNoFreeAfterResp;

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

  public  

    constructor Create; override;
  end;

  TplusReqProdutos = class ( TplusReq )
  protected
    procedure prepareRequest; override;

  public
    function ItemCount: Integer;
    function ProdutoExiste(aCodParceiro, aCodigo: String): Boolean;
    function Codigo(I: Integer): String;
    function CodParceiro(I: Integer): String;
    function Nome(I: Integer): String;
    function url_imagem(I: Integer): String;
    function url_vendas(I: Integer): String;
  end;

  TplusReqParceiros = class ( TplusReq )
  protected
    procedure prepareRequest; override;  

  public
    function ItemCount: Integer;
    function ParceiroExiste(aCodParceiro: String): Boolean;
    
    function Codigo(i: Integer): String;
    function Nome(i: Integer): String;
    function KeyIndex(i: Integer): String;
    function url_imagem(i: Integer): String;  
    function url_timeout(I: Integer): String;
  end;

  TplusReqAdesoes = class ( TplusReq )
    praConta : String;
  protected
    procedure prepareRequest; override;  
  public 
    function AdesaoExiste(aCodParceiro: String): Boolean;
    constructor Create; override;  
  end;

  TplusReqUpdateAll = class 
  private
    FEtapa : Byte;
    FSucesso : Boolean;
    FReqParceiros: TplusReqParceiros;
    FReqProdutos: TplusReqProdutos;
    FReqAdesoes: TplusReqAdesoes;
    FOnTerminar : TNotifyEvent;
    FTag: Integer;
    
    procedure _Fail(Sender: TObject);
    procedure _Resp(Sender: TObject);
    procedure OnTimerTerminar(Sender: TObject);
  public  
    constructor Create; 
    destructor Destroy; override;

    procedure Executar;

    property Sucesso: Boolean read FSucesso;

    property Tag: Integer read FTag write FTag;

    property ReqParceiros: TplusReqParceiros read FReqParceiros;
    property ReqProdutos: TplusReqProdutos read FReqProdutos;
    property ReqAdesoes: TplusReqAdesoes read FReqAdesoes;

    property OnTerminar: TNotifyEvent read FOnTerminar write FOnTerminar;
  end;
  
  
  
implementation

uses ncaK, ncClassesBase, ncShellStart;

const 
   BoolStr : Array[Boolean] of Char = ('0', '1');
   HostStr : String = 'plus.dev.nexcafe.com.br';

{ TplusReq }

function GetNStr(S: String; P: Integer): String;
begin
  while (P>1) do begin
    Delete(S, 1, Pos(';', S));
    Dec(P);
  end;
  if Pos(';', S)>0 then 
    Delete(S, Pos(';', S), 1000);
  Result := Trim(S);
end;

constructor TplusReq.Create;
begin
  FNoFreeAfterResp := False;
  
  ptrCli := nil;
  ptrReq := nil;
  
  FOnResp := nil;
  FOnFail := nil;
  FLastError := '';
  ptrGettingToken := False;
  ptrResp := TStringList.Create;
  
  CreateGUID(ptrTokenNex)  
end;

destructor TplusReq.Destroy;
begin
  _FreeRTC;
  ptrResp.Free;
  inherited;
end;

procedure TplusReq.prepareRequest;
begin
  ptrReq.Request.Host := HostStr;
  ptrReq.Request.Method := 'GET';
end;

procedure TplusReq.prepare_getToken;
begin
  with ptrReq.Request do begin
    ptrGettingToken := True;
    Method:='GET';
    FileName:='/api/tokenplus/get/';
    Host:= HostStr;
    ptrCli.ServerAddr := Host;
    ptrCli.ServerPort := '80';
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
  _CreateRTC;
  
  ptrTokenPlus := '';
  ptrResp.Text := '';
  prepare_getToken;
  try
    if not ptrCli.isConnected then  begin
      with TTimer.Create(nil) do begin
        Interval := 500;
        OnTimer :=  TimerConectar;
        Enabled := True;
      end;
    end else
      ptrReq.Post;
  except
    if Assigned(FOnFail) then FOnFail(Self);
  end;
end;

procedure TplusReq.TimerAfterToken(Sender: TObject);
begin
  Sender.Free;
  _CreateRTC;
  
  prepareRequest;
  try
    if not ptrCli.isConnected then begin
      with TTimer.Create(nil) do begin
        Interval := 500;
        OnTimer :=  TimerConectar;
        Enabled := True;
      end;
    end else
      ptrReq.Post;
  except
    if Assigned(FOnFail) then FOnFail(Self);
  end;
end;

procedure TplusReq.TimerConectado(Sender: TObject);
begin
  Sender.Free;
  ptrReq.Post;
end;

procedure TplusReq.TimerConectar(Sender: TObject);
begin
  Sender.Free;
  if not ptrCli.isConnected then
    ptrCli.Connect;
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
  if Assigned(FOnFail) then 
    FOnFail(Self);
end;

procedure TplusReq._ConnectLost(Sender: TRtcConnection);
begin
  FLastError := 'Connect Lost';
  if Assigned(FOnFail) then 
    FOnFail(Self);
end;

procedure TplusReq._ConnectOk(Sender: TRtcConnection);
begin
  with TTimer.Create(nil) do begin
    Interval := 500;
    OnTimer :=  TimerConectado;
    Enabled := True;
  end;
end;

procedure TplusReq._CreateRTC;
begin
  if ptrCli=nil then begin
    ptrCli := TRTCHTTPClient.Create(nil);
    ptrCli.OnConnect := _ConnectOk;
    ptrCli.OnConnectFail := _ConnectFail;
    ptrCli.OnResponseAbort := _ResponseAbort;
    ptrCli.OnResponseReject := _ResponseReject;
    ptrCli.OnConnectError := _ConnectError;
    ptrCli.OnConnectLost := _ConnectLost;
    ptrCli.AutoConnect := False;
    ptrCli.FixupRequest.EncodeQuery := True;
    ptrCli.ServerPort := '80';
    ptrCli.ServerAddr := HostStr;
  end;

  if ptrReq=nil then begin
    ptrReq := TRtcDataRequest.Create(nil);
    ptrReq.AutoSyncEvents := True;
    ptrReq.AutoRepost := 5;
    ptrReq.Client := ptrCli;
    ptrReq.OnBeginRequest := _BeginRequest;
    ptrReq.OnResponseDone := _ResponseDone;
  end;
end;

procedure TplusReq._FreeRTC;
begin
  if Assigned(ptrReq) then FreeAndNil(ptrReq);
  if Assigned(ptrCli) then FreeAndNil(ptrCli);
end;

procedure TplusReq._ResponseAbort(Sender: TRtcConnection);
begin
  FLastError := 'Response Abort';
  if Assigned(FOnFail) then FOnFail(Self);
end;

procedure TplusReq._ResponseDone(Sender: TRtcConnection);
var S: String;
begin
  ptrResp.Text := ptrCli.Read;
  
  if ptrGettingToken then begin 
    ptrGettingToken := False;
    ptrTokenPlus := ptrResp[0];
    ptrResp.Text := '';
    with TTimer.Create(nil) do begin
      Interval := 500;
      OnTimer := TimerAfterToken;
      Enabled := True;
    end;
  end else begin
    if not FNoFreeAfterResp then _FreeRTC;

    encodeurl(
    
    ptrResp.Text := UTF8ToAnsi(ptrResp.Text);
    if Assigned(FOnResp) then FOnResp(Self);
  end;
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

  NoFreeAfterResp := True;

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

    Query.Clear;
  
    Query.asString['account'] := ptrConta;
    Query.asString['partner_id'] := ptrParceiro;

    Query.asString['transaction_partner_id'] := ptrIDTranParceiro;
    Query.asString['transaction_partner_datetime'] := FormatDateTime('yyyy-mm-dd hh:mm:ss', ptrDTTranParceiro);
    Query.asString['transaction_nexcafe_id'] := ptrIDTranNex;
    Query.asString['transaction_nexcafe_datetime'] := FormatDateTime('yyyy-mm-dd hh:mm:ss', ptrDTTranNex);

    Str(ptrValor:0:2, S);

    Query.asString['description'] := ptrDescr;
    Query.asString['value'] := S;
    Query.asString['pin'] := ptrPIN;
    Query.asString['success'] := BoolStr[ptrSucesso];
    Query.asString['comment'] := ptrObs; 
    Query.asString['key'] := nexGetKH(1, ptrTokenPlus, '', '');
    Query.asString['tokennex'] := ptrTokenNexStr;
    Query.asString['tokenplus'] := ptrTokenPlus;
  end;

end;


{ TplusReqProdutos }

function TplusReqProdutos.Codigo(I: Integer): String;
begin
  Result := GetNStr(ptrResp[i], 1);
end;

function TplusReqProdutos.CodParceiro(I: Integer): String;
begin
  Result := GetNStr(ptrResp[i], 2);
end;

function TplusReqProdutos.ItemCount: Integer;
begin
  Result := ptrResp.Count - 1;
end;

function TplusReqProdutos.Nome(I: Integer): String;
begin
  Result := GetNStr(ptrResp[i], 3);
end;

procedure TplusReqProdutos.prepareRequest;
begin
  inherited;

  with ptrReq.Request do begin
    Method:='GET';
    FileName:='/api/produtos/';
    Host:= HostStr;
    Query.Clear;
    Query.asString['key'] := nexGetKH(1, ptrTokenPlus, '', '');
    Query.asString['tokennex'] := ptrTokenNexStr;
    Query.asString['tokenplus'] := ptrTokenPlus;
  end;
end;

function TplusReqProdutos.ProdutoExiste(aCodParceiro, aCodigo: String): Boolean;
var I: Integer;
begin
  for I := 1 to ItemCount do 
    if SameText(Codigo(I), aCodigo) and SameText(CodParceiro(I), aCodParceiro) then begin
      Result := True;
      Exit;
    end;
  Result := False;  
end;

function TplusReqProdutos.url_imagem(I: Integer): String;
begin
  Result := GetNStr(ptrResp[i], 4);
end;

function TplusReqProdutos.url_vendas(I: Integer): String;
var S: String;
begin
  S := ptrResp[i];
  Result := GetNStr(S, 5);
end;

{ TplusReqParceiros }

function TplusReqParceiros.Codigo(i: Integer): String;
begin
  Result := GetNStr(ptrResp[i], 1);
end;

function TplusReqParceiros.ItemCount: Integer;
begin
  Result := ptrResp.Count-1;
end;

function TplusReqParceiros.KeyIndex(i: Integer): String;
begin
  Result := GetNStr(ptrResp[i], 3);
end;

function TplusReqParceiros.Nome(i: Integer): String;
begin
  Result := GetNStr(ptrResp[i], 2);
end;

function TplusReqParceiros.ParceiroExiste(aCodParceiro: String): Boolean;
var I: Integer;
begin
  for I := 1 to ItemCount do 
    if SameText(Codigo(I), aCodParceiro) then begin
      Result := True;
      Exit;
    end;
  Result := False;  
end;

procedure TplusReqParceiros.prepareRequest;
begin
  inherited;

  with ptrReq.Request do begin
    Method:='GET';
    FileName:='/api/parceiros/';
    Host:= HostStr;
    Query.Clear;
    Query.asString['key'] := nexGetKH(1, ptrTokenPlus, '', '');
    Query.asString['tokennex'] := ptrTokenNexStr;
    Query.asString['tokenplus'] := ptrTokenPlus;
  end;
end;

function TplusReqParceiros.url_imagem(i: Integer): String;
begin
  Result := GetNStr(ptrResp[i], 4);
end;

function TplusReqParceiros.url_timeout(I: Integer): String;
begin
  Result := GetNStr(ptrResp[i], 5);
end;

{ TplusReqAdesoes }

function TplusReqAdesoes.AdesaoExiste(aCodParceiro: String): Boolean;
var 
  S, sCod: String;
  P: Integer;
begin
  S := Resposta.Values['Adesoes'];
  Result := False;
  while (not Result) and (Length(S)>0) do begin
    P := Pos(';', S);
    if P>0 then begin
      sCod := Trim(Copy(S, 1, P-1));
      Delete(S, 1, P);
    end else begin
      sCod := Trim(S);
      S := '';
    end;
    if SameText(aCodParceiro, sCod) then 
      Result := True;
  end;
end;

constructor TplusReqAdesoes.Create;
begin
  inherited;
  praConta := '';
end;

procedure TplusReqAdesoes.prepareRequest;
begin
  inherited;

  with ptrReq.Request do begin
    Method:='GET';
    FileName:='/api/adesoes/';
    Host:='plus.dev.nexcafe.com.br';
    Query.Clear;
    Query.asString['account'] := praConta;
    Query.asString['key'] := nexGetKH(1, ptrTokenPlus, '', '');
    Query.asString['tokennex'] := ptrTokenNexStr;
    Query.asString['tokenplus'] := ptrTokenPlus;
  end;

end;

{ TplusReqUpdateAll }

constructor TplusReqUpdateAll.Create;
begin
  inherited;
  FEtapa := 0;
  FTag := 0;
  FSucesso := False;

  FReqParceiros := TplusReqParceiros.Create;
  FReqParceiros.OnResp := _Resp;
  FReqParceiros.OnFail := _Fail;
  
  FReqProdutos := TplusReqProdutos.Create;
  FReqProdutos.OnResp := _Resp;
  FReqProdutos.OnFail := _Fail;
  
  FReqAdesoes := TplusReqAdesoes.Create;
  FReqAdesoes.OnResp := _Resp;
  FReqAdesoes.OnFail := _Fail;

  FOnTerminar := nil;
end;

destructor TplusReqUpdateAll.Destroy;
begin
  FReqParceiros.Free;
  FReqProdutos.Free;
  FReqAdesoes.Free;
  inherited;
end;

procedure TplusReqUpdateAll.Executar;
begin
  FEtapa := 1;
  FSucesso := False;
  FReqParceiros.Resposta.Clear;
  FReqProdutos.Resposta.Clear;
  FReqAdesoes.Resposta.Clear;
  FReqParceiros.Start;
end;

procedure TplusReqUpdateAll.OnTimerTerminar(Sender: TObject);
begin
  Sender.Free;
  if Assigned(FOnTerminar) then 
    FOnTerminar(Self);
end;

procedure TplusReqUpdateAll._Fail(Sender: TObject);
begin
  FSucesso := False;
  with TTimer.Create(nil) do begin
    OnTimer := OnTimerTerminar;
    Interval := 50;
    Enabled := True;
  end;
end;

procedure TplusReqUpdateAll._Resp(Sender: TObject);
begin
  Inc(FEtapa);
  case FEtapa of
    2 : FReqProdutos.Start;
    3 : begin
      FReqAdesoes.praConta := gConfig.Conta;
      FReqAdesoes.Start;
    end
  else
    FSucesso := True;
    with TTimer.Create(nil) do begin
      OnTimer := OnTimerTerminar;
      Interval := 50;
      Enabled := True;
    end;
    
  end;
end;

end.


