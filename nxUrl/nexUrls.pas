unit nexUrls;

interface

uses Sysutils, Classes, SyncObjs, ExtCtrls, Windows;

type

  TnexUrlsRefresh = class ( TThread )
  protected
    procedure Execute; override;

    procedure Get;
  public
    ResOk : Boolean;
    ResString : String;
    constructor Create;
  end;
  
  TnexUrls = class ( TStringList )
  private
    FDef : TStrings;
    FForce : TStrings;
    FCS : TCriticalSection;
    FTimer : TTimer;
    FOnRefresh: TNotifyEvent;
    FRefreshTh : TnexUrlsRefresh;
    FKeepRefreshing : Boolean;
    function GetOnRefresh: TNotifyEvent;
    procedure SetOnRefresh(const Value: TNotifyEvent);

    function _Values(aName: String): String;
    function GetTextStr: String;
    procedure SetTextStr(const Value: String);

    procedure OnTimer(Sender: TObject);
    procedure OnRefreshTerminate(Sender: TObject);
  public
    function Url(aNome: String; aParams: String = ''): String;
    function CustomUrl(aNome, aSufix, aParams: String): String;
    procedure Refresh;
    constructor Create;
    destructor Destroy; override;

    procedure SetString(aValue: String);

    procedure KeepRefreshing;

    function SkyWidth(aScreenWidth: Integer): Integer;

    function AppTimeMS: Cardinal;
    function AppRetryMS: Cardinal;

    function TTLms: Cardinal;

    function AsString: String;

    property Text: String
      read GetTextStr write SetTextStr;

    property OnRefresh: TNotifyEvent
      read GetOnRefresh write SetOnRefresh;
  end;

  function AddParamUrl(aUrl, aParams: String): String;

var
  gUrls : TnexUrls;  

implementation

uses
  ncDebug, uNexTransResourceStrings_PT, ncNexcafeApi;

  threadvar 
    gUrlUsada : String;

{ TnexUrls }


const
  maxnexttry = 30 * 60 * 1000;

  incnexttry = 5000;

function TnexUrls.AppRetryMS: Cardinal;
const 
  minuto = 60 * 1000;
  hora = 60 * minuto;
begin
  Result := StrToIntDef(_Values('app_time'), 5) * minuto;
  if (Result < (5*minuto)) or (Result > (24*hora)) then
    Result := 5*minuto;
end;

function TnexUrls.AppTimeMS: Cardinal;
const 
  minuto = 60 * 1000;
  hora = 60 * minuto;
begin
  Result := StrToIntDef(_Values('app_time'), 60) * minuto;
  if (Result < (5*minuto)) or (Result > (24*hora)) then
    Result := hora;
end;

function TnexUrls.AsString: String;
begin
  FCS.Enter;
  try
    Result := Text;
  finally
    FCS.Leave;
  end;
end;

function ForceFName: String;
begin 
  Result := ExtractFilePath(ParamStr(0))+'forceurl.ini';
end;

constructor TnexUrls.Create;
begin
  inherited;
  FKeepRefreshing := False;
  
  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := OnTimer;
  FTimer.Enabled := False;

  FRefreshTh := nil;
  
  FForce := TStringList.Create;
  if FileExists(ForceFName) then
    FForce.LoadFromFile(ForceFName);
  
  FDef := TStringList.Create;
  // Endpoints ativos (fallback ate servidor novo publicar lista via /api/v1/urls)
  // contas_app_server/admin, contas_assinar, contas_obtemregistro/obtemchaveseg/
  // corrigiremail/transferir foram removidos: esses fluxos chamam o servidor novo
  // diretamente via NexcafeGet/NexcafePost (HMAC), sem passar por gUrls.Url().
  FDef.Values['contas_obteminfocampanha']  := 'http://contas.nextar.com.br/contas/obteminfocampanha';
  FDef.Values['contas_criarcontabasica']   := 'http://contas.nextar.com.br/contas/criarcontabasica';
  FDef.Values['contas_ativar']             := 'http://contas.nextar.com.br/contas/ativar';
  FDef.Values['contas_esquecisenha']       := 'http://contas.nextar.com.br/contas/esquecisenha';
  FDef.Values['contas_reenviaconfirmacao'] := 'http://contas.nextar.com.br/contas/reenviaconfirmacao';
  FDef.Values['contas_abriuadmin']         := 'http://contas.nextar.com.br/contas/abriuadmin';
  FDef.Values['kapi_emailcaixa']           := 'http://contas.nextar.com.br/kite/emailcaixa';
  FDef.Values['track']                     := 'http://contas.nextar.com.br/track';
  FDef.Values['nexmsg']                    := 'http://contas.nextar.com.br/nexmsgs';
  FDef.Values['nextabs']                   := 'http://contas.nextar.com.br/nextabs';
  FDef.Values['scnt']                      := 'http://contas.nextar.com.br/scnt';
  FDef.Values['ad_toolbar']                := 'http://ads.nexcafe.com.br/toolbar';
  FDef.Values['ad_sky']                    := 'http://ads.nexcafe.com.br/sky';
  FDef.Values['ad_home']                   := 'http://ads.nexcafe.com.br/open';
  FDef.Values['ttl']                       := '60';
  FDef.Values['app_time']                  := '60';
  FDef.Values['app_retry']                 := '5';
  
  
  FCS := TCriticalSection.Create;
  FOnRefresh := nil;
end;

function TnexUrls.CustomUrl(aNome, aSufix, aParams: String): String;
begin
  Result := FForce.Values[aNome];

  if Result='' then begin
    Result := _Values(aNome);
    if Result='' then begin
      Refresh;
      Result := _Values(aNome);
    end;
    if Result='' then
      Result := FDef.Values[aNome];
  end;

  if aSufix>'' then begin
    if Copy(Result, Length(Result), 1)<>'/' then Result := Result + '/';
    Result := Result + aSufix;
  end;
  
  Result := AddParamUrl(Result, aParams);

  DebugMsg(Self, 'Url: '+Result);

  gUrlUsada := Result;  
end;

destructor TnexUrls.Destroy;
begin
  FTimer.Free;
  FDef.Free;
  FCS.Free;
  FForce.Free;
  inherited;
end;

function TnexUrls.GetOnRefresh: TNotifyEvent;
begin
  FCS.Enter;
  try
    Result := FOnRefresh;
  finally
    FCS.Leave;
  end;
end;

function TnexUrls.GetTextStr: String;
begin
  Result := inherited Text;
end;

procedure TnexUrls.KeepRefreshing;
begin
  FKeepRefreshing := True;
  Refresh;
end;

procedure TnexUrls.OnRefreshTerminate(Sender: TObject);
var 
  ResOk: Boolean;
  ResString : String;
begin
  ResOk := FRefreshTh.ResOk;
  ResString := FRefreshTh.ResString;
  FRefreshTh := nil;
  if ResOk then begin
    DebugMsg(Self, 'OnRefreshTerminate - ResOk');
    SetString(ResString);
    if FKeepRefreshing then begin
      FTimer.Interval := TTLms;
      FTimer.Enabled := True;
    end;  
    if Assigned(FOnRefresh) then FOnRefresh(Self);
  end else 
  begin
    DebugMsg(Self, 'OnRefreshTerminate - Falhou');
    FTimer.Interval := 5000;
    FTimer.Enabled := True;        
  end;
end;

procedure TnexUrls.OnTimer(Sender: TObject);
begin
  FTimer.Enabled := False;
  Refresh;
end;

procedure TnexUrls.Refresh;
begin
  if Assigned(FRefreshTh) then Exit;
  FRefreshTh := TnexUrlsRefresh.Create;
  FRefreshTh.OnTerminate := OnRefreshTerminate;
  FREfreshTh.Resume;
end;
  
procedure TnexUrls.SetOnRefresh(const Value: TNotifyEvent);
begin
  FCS.Enter;
  try
    FOnRefresh := Value;
  finally
    FCS.Leave;
  end;
end;

procedure TnexUrls.SetString(aValue: String);
begin
  FCS.Enter;
  try
    Text := aValue;
  finally
    FCS.Leave;
  end;
end;

procedure TnexUrls.SetTextStr(const Value: String);
begin
  inherited Text := Value;
end;

type
  TSkyWidth = record
    swScreen : Integer;
    swWidth : Integer;
  end;

function StrToSkyWidth(S: String; var SW: TSkyWidth): Boolean;  
var P: Integer;
begin
  Result := False;
  P := Pos('=', S);
  if P<2 then Exit;
  sw.swScreen := StrToIntDef(Copy(S, 1, P-1), 0);
  sw.swWidth := StrToIntDef(Copy(S, P+1, 4), 0);
  Result := (sw.swScreen>0) and (sw.swWidth>0) and (sw.swWidth<sw.swScreen);
end;
  
function TnexUrls.SkyWidth(aScreenWidth: Integer): Integer;
var 
  S : String;
  P  : Integer;
  sw    : TskyWidth;
begin
  Result := 160;
  S := _Values('skysizemap');
  if S='' then Exit;

  repeat
    P := Pos('(', S);
    if P>0 then begin
      System.Delete(S, 1, P);
      P := Pos(')', S);
      if P>0 then begin
        if StrToSkyWidth(Copy(S, 1, P-1), sw) then
        if aScreenWidth<=sw.swScreen then begin
          Result := sw.swWidth;
          Exit;
        end;
        System.Delete(S, 1, P);
      end;
    end;
  until (P<1);
end;

function TnexUrls.TTLms: Cardinal;
const
  minuto = 60 * 1000;
  hora = 60 * minuto;
begin
  Result := StrToIntDef(_Values('ttl'), 60) * minuto;
  if (Result < (5*minuto)) or (Result>(24*hora))then
    Result := hora;
  DebugMsg(Self, 'TTLms: '+IntToStr(Result));  
end;

function AddParamUrl(aUrl, aParams: String): String;
begin
  Result := aUrl;
  if aParams='' then Exit;

  if Pos('?', Result)<1 then begin
    if Copy(Result, Length(Result), 1)<>'/' then
      Result := Result + '/';
    Result := Result + '?';
  end else
    Result := Result + '&';
    
  Result := Result + aParams;
end;

function TnexUrls.Url(aNome: String; aParams: String = ''): String;
begin
  Result := CustomUrl(aNome, '', aParams);
{  Result := FForce.Values[aNome];

  if Result='' then begin
    Result := _Values(aNome);
    if Result='' then begin
      Refresh;
      Result := _Values(aNome);
    end;
    if Result='' then
      Result := FDef.Values[aNome];
  end;

  if aAddLang then
  if Pos('lang=', aParams)<1 then begin
    if aParams>'' then aParams := aParams + '&';
    aParams := aParams + 'lang='+SLingua;
  end;

  Result := AddParamUrl(Result, aParams);

  DebugMsg(Self, 'Url: '+Result);

  gUrlUsada := Result; } 
end;

function TnexUrls._Values(aName: String): String;
begin
  FCS.Enter;
  try
    Result := Values[aName];
  finally
    FCS.Leave;
  end;
end;

{ TnexUrlsRefresh }

constructor TnexUrlsRefresh.Create;
begin
  inherited Create(True);
  ResOk := False;
  ResString := '';
  FreeOnTerminate := True;
end;

procedure TnexUrlsRefresh.Execute;
var NextTry : Cardinal;
begin
  NextTry := 0;
  ResOk := False;
  repeat
    try
      if GetTickCount>=NextTry then begin
        Get;
        NextTry := GetTickCount + 10000;
      end;
      Sleep(10);
    except
      On E: Exception do DebugMsg(Self, 'Execute - '+E.ClassName+' - Erro msg:'+E.Message);
    end;
  until ResOk or Terminated;
end;

procedure TnexUrlsRefresh.Get;
var
  S: String;
  st: Integer;
begin
  ResOk := False;
  // x215: HMAC + TLS via NexcafeGet (ncNexcafeApi). Sem salt/MD5.
  S := NexcafeGet(NexcafeUrl('urls'), 'urls', st);
  DebugMsg(Self, 'Get - HTTP ' + IntToStr(st) + ' - ' + S); // do not localize
  if (st = 200) and (Trim(S) <> '') then begin
    ResString := S;
    ResOk := True;
  end;
end;

initialization
  gUrls := TnexUrls.Create;

finalization
  gUrls.Free;


end.
