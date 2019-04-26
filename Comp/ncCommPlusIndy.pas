unit ncCommPlusIndy;
{
    ResourceString: Dario 12/03/13
}

interface

uses
  SysUtils, Classes, SyncObjs, ExtCtrls, dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, idURI;

type
  TplusReq = class
    ptrTokenNex : TGUID;
    ptrTokenPlus : String;
    ptrURL : String;

    ptrGettingToken : Boolean;

    ptrResp: TStrings;

    FLastError : String;


  protected  
    procedure prepareRequest; virtual; 
    procedure prepare_getToken; 
    function ptrTokenNexStr: String;
    function ptrKey: String;
    destructor Destroy; virtual;

  public
    constructor Create; virtual;
    procedure Start;  

    property Resposta: TStrings read ptrResp;
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

  TplusReqUpdateAll = class ( TThread ) 
  private
    FSucesso : Boolean;
    FReqParceiros: TplusReqParceiros;
    FReqProdutos: TplusReqProdutos;
    FReqAdesoes: TplusReqAdesoes;
    FTag: Integer;
  protected
    procedure Execute; override;  

    procedure OnTimerFree(Sender: TObject); 
  public  
    constructor Create; 
//    destructor Destroy; override;

    procedure Destruir;

    procedure Executar;

    property Sucesso: Boolean read FSucesso;

    property Tag: Integer read FTag write FTag;

    property ReqParceiros: TplusReqParceiros read FReqParceiros;
    property ReqProdutos: TplusReqProdutos read FReqProdutos;
    property ReqAdesoes: TplusReqAdesoes read FReqAdesoes;
  end;
  
  
  
implementation

uses ncaK, ncClassesBase, ncShellStart, ncDebug;

const 
   BoolStr : Array[Boolean] of Char = ('0', '1');
   HostStr : String = 'http://plus.nexcafe.com.br';

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
  FLastError := '';
  ptrGettingToken := False;
  ptrResp := TStringList.Create;
  
  CreateGUID(ptrTokenNex)  
end;

destructor TplusReq.Destroy;
begin
  ptrResp.Free;
  inherited;
end;

procedure TplusReq.prepareRequest;
begin
end;

procedure TplusReq.prepare_getToken;
begin
  ptrGettingToken := True;
  ptrURL := HostStr + '/api/tokenplus/get/'; // do not localize
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
var 
  H : TidHTTP;
  S : String;
begin    
  H := TidHttp.Create(nil);
  try
    try
      H.HandleRedirects := True;
      ptrTokenPlus := '';
      ptrResp.Text := '';
      prepare_getToken;
      ptrResp.Text := H.Get(ptrURL);
      ptrGettingToken := False;
      ptrTokenPlus := ptrResp[0];
      ptrResp.Text := '';
      prepareRequest;
      S := H.Get(ptrURL);
      if S='lkjasdlkjasldkjasd' then Exit; // do not localize
      ptrResp.Text := UTF8ToANsi(S);
      DebugMsg('TplusReq.Start - Resp: ' + ptrResp.Text); // do not localize
    except 
      on E: Exception do begin
        S := ptrURL;
        if S='zzzzzzz' then Exit; // do not localize
        S := E.Message;
        if S='asdasdasdasd' then Exit; // do not localize
        Raise;
      end;
    end;
  finally
    H.Free;
  end;
end;

{ TplusPostTranReq }

constructor TplusPostTranReq.Create;
begin
  inherited;

  ptrConta := gConfig.Conta;
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
var S, sValor: String; Code: Integer;

procedure AddParam(aName, aValue: String);
begin
  if S>'' then 
    S := S + '&' else
    S := '?';
  S := S + aName+'='+TidURI.ParamsEncode(aValue);
end;

begin
  inherited;

  S := '';
  AddParam('account', ptrConta ); // do not localize
  AddParam('partner_id', ptrParceiro); // do not localize
  AddParam('transaction_partner_id', ptrIDTranParceiro); // do not localize
  AddParam('transaction_partner_datetime', FormatDateTime('yyyy-mm-dd hh:mm:ss', ptrDTTranParceiro)); // do not localize
  AddParam('transaction_nexcafe_id', ptrIDTranNex); // do not localize
  AddParam('transaction_nexcafe_datetime', FormatDateTime('yyyy-mm-dd hh:mm:ss', ptrDTTranNex)); // do not localize

  Str(ptrValor:0:2, sValor);

  AddParam('description', ptrDescr); // do not localize
  AddParam('value', S); // do not localize
  AddParam('pin', ptrPIN); // do not localize
  AddParam('success', BoolStr[ptrSucesso]); // do not localize
  AddParam('comment', ptrObs);  // do not localize
  AddParam('key', nexGetKH(1, ptrTokenPlus, '', '')); // do not localize
  AddParam('tokennex', ptrTokenNexStr); // do not localize
  AddParam('tokenplus', ptrTokenPlus); // do not localize

  ptrURL := HostStr+'/api/transacoes/salvar/'+S; // do not localize
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
var S: String;

procedure AddParam(aName, aValue: String);
begin
  if S>'' then 
    S := S + '&' else
    S := '?';
  S := S + aName+'='+TidURI.ParamsEncode(aValue);
end;

begin
  inherited;

  S := '';
  AddParam('key', nexGetKH(1, ptrTokenPlus, '', '')); // do not localize
  AddParam('tokennex', ptrTokenNexStr); // do not localize
  AddParam('tokenplus', ptrTokenPlus); // do not localize
  
  ptrURL := HostStr + '/api/produtos/' + S; // do not localize
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
var S: String;

procedure AddParam(aName, aValue: String);
begin
  if S>'' then 
    S := S + '&' else
    S := '?';
  S := S + aName+'='+TidURI.ParamsEncode(aValue);
end;

begin
  inherited;
  S := '';
  AddParam('key', nexGetKH(1, ptrTokenPlus, '', '')); // do not localize
  AddParam('tokennex', ptrTokenNexStr); // do not localize
  AddParam('tokenplus', ptrTokenPlus); // do not localize
  ptrURL := HostStr + '/api/parceiros/' + S; // do not localize
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
  S := Resposta.Values['Adesoes']; // do not localize
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
  praConta := gConfig.Conta;
end;

procedure TplusReqAdesoes.prepareRequest;
var S: String;

procedure AddParam(aName, aValue: String);
begin
  if S>'' then 
    S := S + '&' else
    S := '?';
  S := S + aName+'='+TidURI.ParamsEncode(aValue);
end;

begin
  inherited;

  S := '';
  
  AddParam('account', praConta); // do not localize
  AddParam('key', nexGetKH(1, ptrTokenPlus, '', '')); // do not localize
  AddParam('tokennex', ptrTokenNexStr); // do not localize
  AddParam('tokenplus', ptrTokenPlus); // do not localize

  ptrURL := HostStr + '/api/adesoes/' + S; // do not localize
end;

{ TplusReqUpdateAll }

constructor TplusReqUpdateAll.Create;
begin
  inherited Create(True);
  FTag := 0;
  FSucesso := False;
  FreeOnTerminate := False;

  FReqParceiros := TplusReqParceiros.Create;
  FReqProdutos := TplusReqProdutos.Create;
  FReqAdesoes := TplusReqAdesoes.Create;
end;

procedure TplusReqUpdateAll.Destruir;
begin
  if Self <> nil then
  with TTimer.Create(nil) do begin
    Interval := 50;
    OnTimer := OnTimerFree;
    Enabled := True;
  end;
end;

procedure TplusReqUpdateAll.Executar;
begin
  Resume;
end;

procedure TplusReqUpdateAll.Execute;
begin
  FSucesso := False;
  try
    FReqParceiros.Resposta.Clear;
    FReqProdutos.Resposta.Clear;
    FReqAdesoes.Resposta.Clear;
    FReqParceiros.Start;
    FReqProdutos.Start;
    FReqAdesoes.Start;
    FSucesso := True;
  except
    FSucesso := False;
  end;
end;

procedure TplusReqUpdateAll.OnTimerFree(Sender: TObject);
begin
  try
    Sender.Free;
  finally
    if Self <> nil then Free;
  end;
end;

end.



