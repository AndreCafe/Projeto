unit cmServAtualizaLic;

interface

uses
  SysUtils, Classes, CSCBase, kbmMWCustomTransport, kbmMWClient,
  kbmMWTCPIPIndyTransport, Windows, Messages, ExtCtrls;

type

  TdmAtualizaLic = class(TDataModule)
    mwCli: TkbmMWSimpleClient;
    mwTransp: TkbmMWTCPIPIndyClientTransport;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    function Conecta: Boolean;
    procedure ObtemNovaLic;
    { Public declarations }
  end;

  TThreadAtualizaLic = class ( TThread )
  protected
    procedure Execute; override;
  end;

var
  dmAtualizaLic: TdmAtualizaLic;

implementation

uses
  uLicenca, cmServCom, JTimer, cmServBase;

{$R *.dfm}

const
  SvcName = 'REGISTRO';
  SvcVersion = '1.00';  
  HostRegistro = 'joaoborges.dyndns.org';
  TempoTimer = 300000;

function TdmAtualizaLic.Conecta: Boolean;
var 
  ProxyIP : String;
  ProxyPort: Integer;
begin
  try
    Result := False;
    mwTransp.Active := False;
    mwTransp.Host := HostRegistro;
    if ObtemProxy(ProxyIP, ProxyPort) then begin
      mwTransp.Port := ProxyPort;
      mwTransp.Host := ProxyIP;
      mwTransp.Params.Values['KBMMWHTTPPOSTURL'] := 'http://'+HostRegistro+':3001';
      mwTransp.StreamFormat := 'HTTP';
    end else begin
      mwTransp.Host := HostRegistro;
      mwTransp.Port := 3000;
      mwTransp.Params.Clear;
      mwTransp.StreamFormat := 'STANDARD';
    end;  
    mwTransp.Active := True;
    Result := True;
  except
  end;
end;

procedure TdmAtualizaLic.ObtemNovaLic;
var 
  V: Variant;
  Lic: TLicenca;
  S: String;
begin
  try
    Lic.AsString := LicencaGlobal.AsString;
    if not Conecta then Exit;
    V := mwCli.Request(SvcName, SvcVersion, 'OBTEMLICENCA', [Lic.liCodLoja, VersaoCMServer, Lic.liSerialHD, (not Lic.SenhaOk or Lic.Expirou)]);
    if (V[0] = 'OK') then begin
      S := V[1];
      if S <> Lic.AsString then begin
        Lic.AsString := S;
        Lic.LeSerialHD;
        Lic.SalvaArquivoPadrao;
        PostMessage(GlobalNotifyHandle, cscm_RefreshLic, 0, 0); 
      end;
    end;  
    mwTransp.Active := False;
  except
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
  DM.Timer1.Interval := TempoTimer;
  DM.Timer1.Enabled := True;
  try
    DM.Timer1Timer(nil);
    while not Terminated do begin
      MsgWaitForMultipleObjects(0, Dummy, False, 200, QS_ALLINPUT);
      try
        ProcessMessages;
      except
      end;
    end;
  finally
    DM.Free;
  end;
end;

procedure TdmAtualizaLic.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
    ObtemNovaLic;
  finally
    Timer1.Enabled := True;
  end;  
end;

end.
