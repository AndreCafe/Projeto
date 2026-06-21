unit nxcCliente;

interface

uses
  Classes,
  ExtCtrls, 
  SysUtils,
  kbmMWGlobal,
  nxcKBMCli;

type

  TnxcMudouFundoEv = procedure (Desktop: Boolean) of object;

  TnxcCliente = class ( TComponent )
  private
    FkbmCli: TdmKBMCli;
    FArqDesktop: String;
    FArqLogin: String;
    FNovoDesktop: String;
    FNovoLogin: String;
    FAndamentoArq: TArqAndamentoEv;
    FAtivo : Boolean;
    FMudouFundo : TnxcMudouFundoEv;
    FTimerFundo : TTimer;
    function GetNumMaq: Integer;
    function GetServidor: String;
    procedure SetAtivo(const Value: Boolean);
    procedure SetNumMaq(const Value: Integer);
    procedure SetServidor(const Value: String);
    procedure AtivaTimerFundo;
    procedure ChecaArqFundo;
    procedure OnTimerFundo(Sender: TObject);
    procedure LimpaArqsFundo;
    procedure pRxMsg(Assunto: String; const Args: TkbmMWArrayVariant);
    procedure pAndamentoArq(NomeArq: String; Recebendo: Boolean; Percentual: Integer; var Cancelar: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LimpaFundo(const aDesktop: Boolean);
    procedure TrocaSenha(const aContato: Integer; const aNovaSenha: String);
    procedure EnviaArqFundo(const aDesktop: Boolean; const aNomeArq: String);
    function ObtemSenha(const aContato: Integer): String;
  published
    property Ativo: Boolean
      read FAtivo write SetAtivo;
      
    property NumMaq: Integer
      read GetNumMaq write SetNumMaq;

    property Servidor: String
      read GetServidor write SetServidor;

    property NomeArqDesktop: String
      read FArqDesktop;

    property NomeArqLogin: String
      read FArqLogin;    

    property OnAndamentoArq: TArqAndamentoEv
      read FAndamentoArq write FAndamentoArq;

    property OnMudouFundo: TnxcMudouFundoEv
      read FMudouFundo write FMudouFundo;   
  end;  

implementation

const
  sProcsSvc = 'procsbase';

{ TnxcCliente }

procedure TnxcCliente.ChecaArqFundo;
begin
  if (FNovoDesktop<>FArqDesktop) then begin
    if (FNovoDesktop='') then begin
      if FArqDesktop>'' then
      try
        DeleteFile(ExtractFilePath(ParamStr(0))+FArqDesktop);
      except
      end;
      FArqDesktop := '';
    end else begin
      if UpperCase(ExtractFileName(FNovoDesktop)) <>
         UpperCase(ExtractFileName(FkbmCli.NomeArq)) then
      if FileExists(ExtractFilePath(ParamStr(0))+FNovoDesktop) then
      begin
        FArqDesktop := FNovoDesktop;
        if Assigned(FMudouFundo) then
          FMudouFundo(True);
      end;
    end;
  end;

  if (FNovoLogin<>FArqLogin) then begin
    if (FNovoLogin='') then begin
      if FArqLogin>'' then
      try
        DeleteFile(ExtractFilePath(ParamStr(0))+FArqLogin);
      except
      end;
      FArqLogin := '';
    end else begin
      if UpperCase(ExtractFileName(FNovoLogin)) <>
         UpperCase(ExtractFileName(FkbmCli.NomeArq)) then
      if FileExists(ExtractFilePath(ParamStr(0))+FNovoLogin) then
      begin
        FArqLogin := FNovoLogin;
        if Assigned(FMudouFundo) then
          FMudouFundo(False);
      end;
    end;
  end;
  AtivaTimerFundo;
end;

procedure TnxcCliente.AtivaTimerFundo;
begin
  FTimerFundo.Enabled := ((FNovoDesktop<>'') and (FNovoDesktop<>FArqDesktop)) or 
                         ((FNovoLogin<>'') and (FNovoLogin<>FArqLogin));
end;

constructor TnxcCliente.Create(AOwner: TComponent);
begin
  inherited;
  FkbmCli := TdmkbmCli.Create(nil);
  FkbmCli.OnArqAndamento := pAndamentoArq;
  FkbmCli.OnMensagem := pRxMsg;
  FTimerFundo := TTimer.Create(Self);
  FTimerFundo.Interval := 1000;
  FArqDesktop := '';
  FArqLogin := '';
  FNovoDesktop := '';
  FNovoLogin := '';
  FAtivo := False;
  FAndamentoArq := nil;
  FMudouFundo := nil;
  FTimerFundo.OnTimer := OnTimerFundo;
end;

destructor TnxcCliente.Destroy;
begin
  FTimerFundo.Free;
  FkbmCli.Free;
  inherited;
end;

procedure TnxcCliente.EnviaArqFundo(const aDesktop: Boolean;
  const aNomeArq: String);
var S: String;
begin
  if aDesktop then
    S := 'desktop_cliente_'
  else
    S := 'login_cliente_';
    
  S := S + IntToStr(Random(High(Integer))) + ExtractFileExt(aNomeArq);
  
  FkbmCli.EnviaArq(aNomeArq, S);
end;

function TnxcCliente.GetNumMaq: Integer;
begin
  Result := FkbmCli.NumMaq;
end;

function TnxcCliente.GetServidor: String;
begin
  Result := FkbmCli.Servidor;
end;

procedure TnxcCliente.LimpaArqsFundo;
var SR: TSearchRec;
begin
  FindFirst(ExtractFilePath(ParamStr(0))+'DESKTOP*.*', faAnyFile, SR);
  try
    repeat
      if (Pos('DESKTOP', UpperCase(SR.Name))=1) and
         SameText(ExtractFileExt(SR.Name), '.JPG') and
         (not SameText(FNovoDesktop, SR.Name)) then
      try
        DeleteFile(SR.Name);
      except
      end;   
    until (FindNext(SR)<>0);
  finally
    FindClose(SR);
  end;

  FindFirst(ExtractFilePath(ParamStr(0))+'LOGIN*.*', faAnyFile, SR);
  try
    repeat
      if (Pos('LOGIN', UpperCase(SR.Name))=1) and
         (SameText(ExtractFileExt(SR.Name), '.JPG') or 
          SameText(ExtractFileExt(SR.Name), '.GIF')) and
         (not SameText(FNovoLogin, SR.Name)) then
      try
        DeleteFile(SR.Name);
      except
      end;   
    until (FindNext(SR)<>0);
  finally
    FindClose(SR);
  end;
end;

procedure TnxcCliente.LimpaFundo(const aDesktop: Boolean);
begin
  FkbmCli.mwCli.Request(sProcsSvc, '', 'LIMPAFUNDO', [aDesktop]);
end;

procedure TnxcCliente.OnTimerFundo(Sender: TObject);
begin
  if FkbmCli.NomeArq<>'' then Exit;
  AtivaTimerFundo;
  if FTimerFundo.Enabled then begin
    if (FNovoDesktop<>'') and (not SameText(FNovoDesktop, FArqDesktop)) then
      FkbmCli.ObtemArq(ExtractFilePath(ParamStr(0))+FNovoDesktop, FNovoDesktop)
    else
    if (FNovoLogin<>'') and (not SameText(FNovoLogin, FArqLogin)) then
      FkbmCli.ObtemArq(ExtractFilePath(ParamStr(0))+FNovoLogin, FNovoLogin);
  end;
end;

procedure TnxcCliente.pAndamentoArq(NomeArq: String; Recebendo: Boolean;
  Percentual: Integer; var Cancelar: Boolean);
var S: String;  
begin
  if (Percentual=100) then begin
    S := UpperCase(ExtractFileName(NomeArq));
    if Recebendo then begin
      if SameText(S, FNovoDesktop) then begin
        if FArqDesktop<>'' then begin
          S := ExtractFilePath(ParamStr(0))+FArqDesktop;
          if FileExists(S) then
          try
            DeleteFile(S);
          except
          end;
        end;
        
        FArqDesktop := FNovoDesktop;
        if Assigned(FMudouFundo) then FMudouFundo(True);
        AtivaTimerFundo;
      end else
      if SameText(S, FNovoLogin) then begin
        if FArqLogin<>'' then begin
          S := ExtractFilePath(ParamStr(0))+FArqLogin;
          if FileExists(S) then
          try
            DeleteFile(S);
          except
          end;
        end;
      
        FArqLogin := FNovoLogin;
        if Assigned(FMudouFundo) then FMudouFundo(False);
        AtivaTimerFundo;
      end;
    end else begin
      S := Copy(S, 1, Pos('_', S));
      if SameText(S, 'DESKTOP_') then
        FkbmCli.mwCli.Request(sProcsSvc, '', 'NOVOFUNDO', [True, NomeArq]) 
      else
      if SameText(S, 'LOGIN_') then
        FkbmCli.mwCli.Request(sProcsSvc, '', 'NOVOFUNDO', [False, NomeArq]);
    end;
  end;
  
  if Assigned(FAndamentoArq) then
    FAndamentoArq(NomeArq, Recebendo, Percentual, Cancelar);
end;

procedure TnxcCliente.pRxMsg(Assunto: String; const Args: TkbmMWArrayVariant);
begin
  if SameText(Assunto, 'MUDOUFUNDO') then begin
    FNovoDesktop := Args[0];
    FNovoLogin := Args[1];
    ChecaArqFundo;
  end;
end;

procedure TnxcCliente.SetAtivo(const Value: Boolean);
var V: Variant;
begin
  if Value = FAtivo then Exit;
  FkbmCli.Ativo := Value;
  FNovoLogin := '';
  FArqLogin := '';
  FNovoDesktop := '';
  FArqDesktop := '';
  if Value=True then begin
    V := FkbmCli.mwCli.Request(sProcsSvc, '', 'NOMEARQFUNDO', []);
    FNovoDesktop := V[0];
    FNovoLogin := V[1];
    LimpaArqsFundo;
    ChecaArqFundo;
  end;
  FAtivo := Value;
end;

procedure TnxcCliente.SetNumMaq(const Value: Integer);
begin
  FkbmCli.NumMaq := Value;
end;

procedure TnxcCliente.SetServidor(const Value: String);
begin
  FkbmCli.Servidor := Value;
end;

procedure TnxcCliente.TrocaSenha(const aContato: Integer; const aNovaSenha: String);
begin
  FkbmCli.mwCli.Request(sProcsSvc, '', 'TROCASENHA', [aContato, aNovaSenha]);
end;

function TnxcCliente.ObtemSenha(const aContato: Integer): String;
begin
  Result := FkbmCli.mwCli.Request(sProcsSvc, '', 'OBTEMSENHA', [aContato]);
end;

initialization
  Randomize;
  
end.
