unit ncMateTls;

interface

uses
  SysUtils, Classes, ncDebug, IdBaseComponent, IdComponent, IdTCPServer,
  IdServerIOHandler, IdSSLOpenSSL, uLogs, math, IdSocketHandle, ncMateServerThread,
  SyncObjs;

type

 TMateTls = class(TThread)
  private
    fp : Pointer;
    flen : uint64;
    FOnRead: TReadEvent;
    FOnActive: TNotifyEvent;
    IdTCPServer1: TIdTCPServer;
    IdServerIOHandlerSSL1: TIdServerIOHandlerSSL;
    FMateServerThread: TMateServerThread;
    FAtivo: boolean;
    FIP: string;
    FPort: integer;
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure IdTCPServer1Execute(AThread: TIdPeerThread);
    procedure IdServerIOHandlerSSL1GetPassword(var Password: string);
    function IdServerIOHandlerSSL1VerifyPeer(Certificate: TIdX509): Boolean;
    procedure IdServerIOHandlerSSL1Status(ASender: TObject;
      const AStatus: TIdStatus; const AStatusText: string);
    procedure IdServerIOHandlerSSL1StatusInfo(Msg: string);
    procedure IdTCPServer1Exception(AThread: TIdPeerThread;
      AException: Exception);
    procedure IdTCPServer1ListenException(AThread: TIdListenerThread;
      AException: Exception);
    procedure IdTCPServer1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure SetIP(const Value: string);
    procedure SetPort(const Value: integer);
  protected
    procedure MateReadThreadOnRead(Sender: TObject; var p: Pointer; len: uint64);
    procedure SyncOnRead;
    procedure SyncOnActive;
  public
    property OnRead: TReadEvent read FOnRead write FOnRead;
    property OnActive: TNotifyEvent read FOnActive write FOnActive;
    property Ativo: boolean read FAtivo;
    property IP: string read FIP write SetIP;
    property Port: integer read FPort write SetPort;
    procedure Write(var b: Pointer; len: uint64);
    procedure Execute; override;
    constructor Create;
    destructor Destroy; override;
 end;

implementation

{ TMateTls }

constructor TMateTls.Create;
begin
    inherited Create(true);

    FMateServerThread := nil;
    IdTCPServer1 := TIdTCPServer.Create(nil);
    IdTCPServer1.ThreadClass :=  TMateServerThread;

    IdServerIOHandlerSSL1 := TIdServerIOHandlerSSL.Create(nil);

    IdTCPServer1.CommandHandlersEnabled := false;
    IdTCPServer1.IOHandler := IdServerIOHandlerSSL1;
    IdTCPServer1.ListenQueue := 0;
    IdTCPServer1.MaxConnections := 1;

    IdTCPServer1.OnConnect := IdTCPServer1Connect;
    IdTCPServer1.OnExecute := IdTCPServer1Execute;
    IdTCPServer1.OnException := IdTCPServer1Exception;
    IdTCPServer1.OnListenException := IdTCPServer1ListenException;
    IdTCPServer1.OnStatus := IdTCPServer1Status;

    IdServerIOHandlerSSL1.OnGetPassword := IdServerIOHandlerSSL1GetPassword;
    IdServerIOHandlerSSL1.OnStatus := IdServerIOHandlerSSL1Status;
    IdServerIOHandlerSSL1.OnStatusInfo := IdServerIOHandlerSSL1StatusInfo;
    IdServerIOHandlerSSL1.OnVerifyPeer := IdServerIOHandlerSSL1VerifyPeer;
    IdServerIOHandlerSSL1.SSLOptions.RootCertFile := 'root.pem';
    IdServerIOHandlerSSL1.SSLOptions.CertFile := 'cert.pem';
    IdServerIOHandlerSSL1.SSLOptions.KeyFile := 'key.pem';
    IdServerIOHandlerSSL1.SSLOptions.Method := sslvSSLv23;     // TIdSSLVersion = (sslvSSLv2, sslvSSLv23, sslvSSLv3, sslvTLSv1);

end;

destructor TMateTls.Destroy;
begin
  IdTCPServer1.Free;
  IdServerIOHandlerSSL1.Free;
  inherited;
end;

procedure TMateTls.IdServerIOHandlerSSL1GetPassword(var Password: string);
begin
     glog.Log(self,[lcDebug], 'IdServerIOHandlerSSL1GetPassword' );
     Password := 'aaaa';
end;

procedure TMateTls.IdServerIOHandlerSSL1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
     glog.Log(self,[lcDebug], 'IdServerIOHandlerSSL1Status ' +  AStatusText );
end;

procedure TMateTls.IdServerIOHandlerSSL1StatusInfo(Msg: string);
begin
     glog.Log(self,[lcDebug], 'IdServerIOHandlerSSL1StatusInfo ' +  Msg );
end;

function TMateTls.IdServerIOHandlerSSL1VerifyPeer(Certificate: TIdX509): Boolean;
begin
     glog.Log(self,[lcDebug], 'Fingerprint ' +  Certificate.FingerprintAsString );
     result := true;
end;

procedure TMateTls.IdTCPServer1Connect(AThread: TIdPeerThread);
begin
    DebugMsg('TMateTls.IdTCPServer1Connect');
end;

procedure TMateTls.IdTCPServer1Exception(AThread: TIdPeerThread;
  AException: Exception);
begin
     glog.Log(self,[lcDebug], 'IdTCPServer1Exception ' +  AException.Message );
     FMateServerThread := nil;
end;

procedure TMateTls.IdTCPServer1ListenException(AThread: TIdListenerThread;
  AException: Exception);
begin
     glog.Log(self,[lcDebug], 'IdTCPServer1ListenException ' +  AException.Message );
end;

procedure TMateTls.IdTCPServer1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
     glog.Log(self,[lcDebug], 'IdTCPServer1Status ' +  AStatusText );
end;

procedure TMateTls.Execute;
begin
    glog.Log(self,[lcDebug], 'TMateTls.Execute' );
    IdTCPServer1.DefaultPort := port;

    IdTCPServer1.Active := true;
    glog.Log(self,[lcDebug], 'TMateTls.Listen ' +  FIP + ':' + inttostr(FPort) );

    while not terminated do begin

        sleep(0);
    end;

    IdTCPServer1.Active := false;
    glog.Log(self,[lcDebug], 'TMateTls ends execution' );
 end;

procedure TMateTls.SetIP(const Value: string);
begin
  FIP := Value;
end;

procedure TMateTls.SetPort(const Value: integer);
begin
  FPort := Value;
end;

procedure TMateTls.SyncOnActive;
begin
   if assigned(FOnActive) then
       FOnActive(Self);
end;

procedure TMateTls.SyncOnRead;
begin
   if assigned(FOnRead) then begin
       FOnRead(self, fp, flen);
   end;
end;

procedure TMateTls.Write(var b: Pointer; len: uint64);
begin
    FMateServerThread.Write(b, len);
end;

procedure TMateTls.MateReadThreadOnRead(Sender: TObject; var p: Pointer; len: uint64);
begin
   glog.Log(self,[lcDebug], 'TMateTls.MateReadThreadOnRead '+inttostr(len));
    fp := p;
    flen := len;
    Synchronize(SyncOnRead);
end;

procedure TMateTls.IdTCPServer1Execute(AThread: TIdPeerThread);
begin

   glog.Log(self,[lcDebug], 'TMateTls.IdTCPServer1Execute');

   if FMateServerThread<>nil then
        raise exception.Create('2cond thread');

   FMateServerThread := TMateServerThread(AThread);
   FMateServerThread.OnRead := MateReadThreadOnRead;

   FAtivo := true;
   Synchronize(SyncOnActive);

   while not terminated do sleep(0);
   FAtivo := false;

   glog.Log(self,[lcDebug], 'TMateTls.IdTCPServer1Execute ends');

end;

end.
