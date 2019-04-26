unit ncCliAtualizaLic;

interface

uses
  SysUtils, Classes, CSCBase, kbmMWCustomTransport, kbmMWClient,
  kbmMWHTTPStdTransStream,
  kbmMWTCPIPIndyClientTransport, Windows, Messages, ExtCtrls, uLicEXECryptor;

type

  TdmAtualizaLic = class(TDataModule)
    mwCli: TkbmMWSimpleClient;
    mwTransp: TkbmMWTCPIPIndyClientTransport;
  private
    { Private declarations }
  public
    function Conecta(RaiseEx: Boolean = False): Boolean;
    function ObtemNovaLic(RaiseEx: Boolean = False): String;
    { Public declarations }
  end;

  TThreadAtualizaLic = class ( TThread )
  protected
    procedure Execute; override;
  end;

var
  dmAtualizaLic: TdmAtualizaLic;
  clilic_versao   : String = 'x.x.x.x';
  clilic_codequip : String = '';
  clilic_qtdlic   : integer = 0;
  clilic_codloja  : integer = 0;
  clilic_notifyhandle : HWND = 0;

implementation

uses
  JTimer, ncClassesBase, ncErros;

{$R *.dfm}

function TdmAtualizaLic.Conecta(RaiseEx: Boolean=False): Boolean;
var 
  ProxyIP : String;
  ProxyPort: Integer;
  I : Integer;
  HostRegistro : Array of String;
begin
  Result := False;
  I := -1;
  SetLength(HostRegistro, 2);
  HostRegistro[0] := 'registro.nextar.com.br';
  HostRegistro[1] := 'joaoborges.dyndns.org';
  
  while (I <= High(HostRegistro)) and (not Result) do
  try
    Inc(I);
    mwTransp.Active := False;
    mwTransp.Host := HostRegistro[I];
    if ObtemProxy(ProxyIP, ProxyPort) then begin
      mwTransp.Port := ProxyPort;
      mwTransp.Host := ProxyIP;
      mwTransp.Params.Values['KBMMWHTTPPOSTURL'] := 'http://'+HostRegistro[I]+':3001';
      mwTransp.StreamFormat := 'HTTP';
    end else begin
      mwTransp.Host := HostRegistro[I];
      mwTransp.Port := 3000;
      mwTransp.Params.Clear;
      mwTransp.StreamFormat := 'STANDARD';
    end;  
    mwTransp.Active := True;
    Result := True;
  except
    if RaiseEx then raise;
  end;
end;

function TdmAtualizaLic.ObtemNovaLic(RaiseEx: Boolean = False): String;
var 
  V: Variant;
  P: ncPString;
begin
  try
    Result := '';
    if not Conecta(raiseex) then Exit;
    V := mwCli.Request('REGISTRO', '2.00', 'OBTEMREGISTRO', [clilic_CodLoja, clilic_versao, clilic_codequip, clilic_qtdlic]);
    if (V[0] = 'OK') then begin
      Result := V[2];
      New(P);
      P^ := Result;
      PostMessage(clilic_notifyhandle, cscm_RefreshLic, Integer(P), 0);
    end else
      if RaiseEx then Raise Exception.Create(V[0]);
    mwTransp.Active := False;
  except
    on E: Exception do begin
      if RaiseEx then
        Raise ENexCafe(E.Message);
    end;
  end;    
end;

{ TThreadAtualizaLic }

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TThreadAtualizaLic.Execute;
var 
  DM : TdmAtualizaLic;
  Dummy: Integer;
begin
  DM := TdmAtualizaLic.Create(nil);
  try
    DM.ObtemNovaLic;
  finally
    DM.Free;
  end;
end;

end.
