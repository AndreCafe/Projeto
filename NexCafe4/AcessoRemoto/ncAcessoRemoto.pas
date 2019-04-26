unit ncAcessoRemoto;

interface

uses
  ncDebug,
  SysUtils,
  classes,
  Windows,
  Messages,
  ExtCtrls,
  rtcpDesktopConst,
  rtcpFileTrans, 
  rtcPortalMod, 
  rtcPortalCli, 
  rtcPortalHttpCli,
  rtcpDesktopHost;

type
  
  TarThread = class ( TThread )
  private
    FServ : String;
    FUsername : String;
    FDesconectar : Boolean;
    FDesconectou : Boolean;
    
    fClient: TRtcHttpPortalClient;
    fFileTrans: TRtcPFileTransfer;
    fDesktop: TRtcPDesktopHost;
    fTimer : TTimer;
    fTimerReload: TTimer;

    procedure LoadConfig;

    procedure CreateComps;
    procedure FreeComps;

    procedure OnTimer(Sender: TObject);
    procedure OnTimerReloadConfig(Sender: TObject);

    procedure OnClientLogIn(Sender: TAbsPortalClient);
    procedure OnClientLogout(Sender: TAbsPortalClient);
    procedure OnClientError(Sender: TAbsPortalClient; const Msg:string);
    
    
  protected 
    procedure Execute; override;
  public
    procedure Desconectar;  
  end;
    
implementation

{ TarThread }

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TarThread.CreateComps;
begin
  FDesconectar := False;
  FDesconectou := False;
  FClient := TRtcHttpPortalClient.Create(nil);
  FClient.GateAddr := 'nxjoao4';
  FClient.GatePort := '16205';
  FClient.OnLogIn := OnClientLogin;
  FClient.OnLogout := OnClientLogout;
  FClient.OnError := OnClientError;
  FClient.DataForceEncrypt := False;
  FClient.DataSecureKey := '';
  FClient.UserVisible := True;
  
  FFileTrans := TRtcPFileTransfer.Create(nil);
  FDesktop := TRtcPDesktopHost.Create(nil);
  FDesktop.GColorLimit := rdColor32bit;
  FDesktop.GColorLowLimit := rd_ColorHigh;
  FDesktop.GUseMirrorDriver := True;
  FDesktop.GFullScreen := True;
  FDesktop.GAllowControl := True;
  FDesktop.GAllowControl_Super := True;
  FDesktop.GAllowView := True;
  FDesktop.GAllowView_Super := True;
  FDesktop.GFrameRate := rdFramesMax;
  FDesktop.Client := FClient;
  FDesktop.FileTransfer := FFileTrans;
  FDesktop.AccessControl := False;
  FFileTrans.Client := FClient;
  FTimer := TTimer.Create(nil);
  FTimer.Interval := 1000;
  FTimer.OnTimer := OnTimer;
  FTimer.Enabled := True;

  FTimerReload := TTimer.Create(nil);
  FTimerReload.Interval := 10000;
  FTimerReload.OnTimer := OnTimerReloadConfig;
  FTimerReload.Enabled := False;
end;

procedure TarThread.Desconectar;
begin
  FDesconectar := True;
end;

procedure TarThread.Execute;
var Dummy : Integer;
begin
  try
    CreateComps;
    try
      while (not Terminated) do begin
        MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
        try
          if FDesconectar and (not FDesconectou) then begin
            FClient.Disconnect;
            FDesconectou := True;
          end;
          ProcessMessages;
        except
        end;
      end;
    finally
      FreeComps;
    end;
  except
  end;
end;

procedure TarThread.FreeComps;
begin
  FClient.Active := False;
  FTimer.Free;
  FDesktop.Free;
  FFileTrans.Free;
  FClient.Free;
end;

function ConfigFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'NexGuard.ini';
end;

procedure TarThread.LoadConfig;
var 
  S: String;
  sl: TStrings;
begin
  FServ := '';
  FUsername := '';
  S := ConfigFName;
  if FileExists(S) then begin
    sl := TStringList.Create;
    try
      sl.LoadFromFile(S);
      if SameText(sl.Values['Servidor'], 'auto') then begin
        FServ := sl.Values['UltimoServidor'];
        Delete(FServ, 1, Pos('@', FServ));
      end else 
        FServ := sl.Values['Servidor'];
      FUSername := sl.Values['Maquina'];
      if StrToIntDef(FUsername, 0)=0 then
        FUsername := sl.Values['Console'];
    finally
      sl.Free;
    end;
  end;
end;

procedure TarThread.OnClientError(Sender: TAbsPortalClient; const Msg: string);
var S: String;
begin
  DebugMsg('TarThread.OnClientError - Msg: '+Msg);
  S := Msg;
  S := S + '***';
  if S='yabadabadu' then
    Exit;
  FClient.Active := False;
  FTimer.Enabled := True;
  FTimerReload.Enabled := False;
end;

procedure TarThread.OnClientLogIn(Sender: TAbsPortalClient);
begin
  FTimer.Enabled := False;
  FTimerReload.Enabled := True;
  DebugMsg('TarThread.OnClientLogin');
end;

procedure TarThread.OnClientLogout(Sender: TAbsPortalClient);
begin
  FTimerReload.Enabled := False;
  if FDesconectar then Exit;
  
  DebugMsg('TarThread.OnClientLogout');
  FClient.Active := False;
  FTimer.Enabled := True;
end;

procedure TarThread.OnTimer(Sender: TObject);
begin
  try
    LoadConfig;
    DebugMsg('TarThread.OnTimer - FServ: '+FServ+' - FUsername: '+FUsername);
    if (Trim(FServ)='') or (Trim(FUsername)='') then Exit;
    DebugMsg('ConfigFName = ' + ConfigFName);
    
    FTimer.Enabled := False;
    FTimer.Interval := 5000;
    FTimerReload.Enabled := False;
    FClient.Active := False;
    FClient.GateAddr := FServ;
    FClient.GatePort := '16205';
    FClient.LoginUserName := FUsername;
    FClient.Active := True;
  except
  end;
end;

procedure TarThread.OnTimerReloadConfig(Sender: TObject);
var FSaveServ, FSaveUser: String;
begin
  FSaveServ := FServ;
  FSaveUser := FUsername;
  LoadConfig;
  if (FSaveServ=FServ) and (FUsername=FSaveUser) then Exit;
  FClient.Active := False;
  FTimer.Enabled := True;
  FTimerReload.Enabled := False;
end;

end.
