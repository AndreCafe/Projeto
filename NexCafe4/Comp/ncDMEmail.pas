unit ncDMEmail;

interface

uses
  SysUtils, ncErros, Classes, IdPOP3, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, ExtCtrls, DB, nxdb,
  nxsdServerEngine, nxreRemoteServerEngine, nxllTransport, nxdbBase,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, OleServer, ActiveX, AOSMTPLib_TLB;

type

  TMetodoLogin = (lgSemSenha, lgComSenha, lgAuthPop);
  
  TdmEmail = class(TDataModule)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    nxTCPIP: TnxWinsockTransport;
    nxRSE: TnxRemoteServerEngine;
    tCorpo: TnxTable;
    tEnvio: TnxTable;
    tCorpoID: TAutoIncField;
    tCorpoCorpo: TMemoField;
    tCorpoDestino: TMemoField;
    tCorpoAnexos: TMemoField;
    tCorpoAssunto: TStringField;
    tCorpoInclusao: TDateTimeField;
    tCorpoProcessou: TBooleanField;
    tCorpoApagarAnexosAposEnvio: TBooleanField;
    tEnvioID: TAutoIncField;
    tEnvioCorpo: TIntegerField;
    tEnvioDestino: TMemoField;
    tEnvioInclusao: TDateTimeField;
    tEnvioEnvio: TDateTimeField;
    tEnvioTentativas: TWordField;
    tEnvioEnviar: TBooleanField;
    tEnvioMsgErro: TMemoField;
    tEnvioOK: TBooleanField;
    Timer1: TTimer;
    tCorpoRestam: TIntegerField;
    tCorpoEnviarEm: TDateTimeField;
    Msg: TIdMessage;
    SMTP: TIdSMTP;
    pop: TIdPOP3;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FMetodoLogin : TMetodoLogin;
    FAutenticouPop : Boolean;
    FInicializou : Boolean;
    
    function GetPassword: String;
    function GetServidor: String;
    function GetUsername: String;
    procedure SetPassword(const Value: String);
    procedure SetServidor(const Value: String);
    procedure SetUsername(const Value: String);
    procedure SetAutenticouPop(const Value: Boolean);
    procedure SetMetodoLogin(const Value: TMetodoLogin);
    { Private declarations }
  protected
    procedure ObtemDestinos(aDestino: TStrings); virtual;   
    function Envia(aDestino, aAssunto, aCorpo, aAnexos: String): String;
    function Envia2(aDestino, aAssunto, aCorpo, aAnexos: String): String; 
  public
    function EnviaEmail(aDestino, aAssunto, aCorpo, aAnexos: String): String;
    
    property Servidor: String
      read GetServidor write SetServidor;

    property AutenticouPop: Boolean
      read FAutenticouPop write SetAutenticouPop;  

    property Username: String
      read GetUsername write SetUsername;

    property Password: String
      read GetPassword write SetPassword;

    property MetodoLogin: TMetodoLogin
      read FMetodoLogin write SetMetodoLogin;   
    { Public declarations }
  end;

var
  dmEmail: TdmEmail;
  MaxTriesEmail : Integer = 10;
  TerminarProcEmail : Boolean = False;

implementation

uses ncShellStart;

{$R *.dfm}

{ TdmEmail }

procedure TdmEmail.DataModuleCreate(Sender: TObject);
begin
  FInicializou := False;
  FMetodoLogin := lgSemSenha;
  FAutenticouPop := False;
end;

function TdmEmail.Envia(aDestino, aAssunto, aCorpo, aAnexos: String): String;
var
  Email: TIdMessage;
  Texto: TIdText;
  Html: TIdText;
  Anexo: TIdAttachment;
  SL : TStrings;
  I: Integer;
begin
  Result := '';
  try
    Email := TIdMessage.Create(nil);
    SL := TStringList.Create;
    try
      Email.Sender.Address := 'caixa@nexcafe.com.br';
      Email.From.Address := 'caixa@nexcafe.com.br';
      Email.Recipients.Add.Address := aDestino;
      Email.Priority := mpHigh;
      Email.Subject := aAssunto;
      // ...ajusta remetente, destinatário, etc...
  
      // define o tipo do conteúdo da mensagem
      Email.ContentType := 'multipart/mixed';
  
      // cria a parte texto - pode estar em branco
      Texto := TIdText.Create(Email.MessageParts);
      Texto.Body.Text :=
        'This message contains HTML and images.';
      Texto.ContentType := 'text/plain';
  
      // cria a parte HTML
      Html := TIdText.Create(Email.MessageParts);
      HTML.Body.Text := aCorpo;
      Html.ContentType := 'text/html';  
      
  
  {    Anexo := TIdAttachment.Create(
        Email.MessageParts, 'c:\meus programas\nexcafe\minha_foto.jpeg');
      Anexo.ContentType := 'image/jpg';
      Anexo.Headers.Add('Content-ID: <minha_foto.jpeg>'); }
      SL.Text := aAnexos;
  
      for I := 0 to SL.Count - 1 do
        TidAttachment.Create(Email.MessageParts, SL[I]);
      
      SMTP.Connect;
      try
        SMTP.Send(Email);
      finally
        SMTP.Disconnect;
      end;
    finally
      SL.Free;
      Email.Free;
    end;
  except
    on E: Exception do Result := E.Message;
  end;
end;

function TdmEmail.Envia2(aDestino, aAssunto, aCorpo, aAnexos: String): String;
var 
  M: TMail;
  I : Integer;
  SL : TStrings;
  S: String;
begin
  if not FInicializou then begin
    try CoInitialize(nil); except end;
    FInicializou := True;
  end;

  try
    M := TMail.Create(Self);
    try
      M.FromAddr := 'caixa@nexcafe.com.br';
      M.CodePage := 65001;
      M.Charset := 'UTF-8';
      M.AddRecipient('', aDestino, 0);
      M.Subject := aAssunto;
      M.BodyText := aCorpo;
      M.UserName := 'caixa@nexcafe.com.br';
      M.Password := ')(*&^!@#$%';
      M.BodyFormat := 1;
      M.ServerAddr := 'emailcaixa.nextar.com.br';
      M.RegisterKey := 'AM-XS1178329941-01280-E6F1D89338F5C341B5405FDC39FA0C49';
      SL := TStringList.Create;
      try
        SL.Text := aAnexos;
        for I := 0 to SL.Count-1 do
          M.AddAttachment(SL[i]);
      finally
        SL.Free;
      end;
      
      if M.SendMail=0 then
        Result := '' else
        Result := M.GetLastErrDescription;
    finally
      M.Free;
    end;
  except
    on E: Exception do 
      Result := E.Message;
  end;
end;

function TdmEmail.EnviaEmail(aDestino, aAssunto, aCorpo, aAnexos: String): String;
var 
  SL: TStrings;
  I: Integer;
begin
  Result := '';
  SL := TStringList.Create;
  try
    try
      Smtp.Connect;
      try
        if FMetodoLogin = lgAuthPop then 
          AutenticouPop := True;
        Msg.Subject := aAssunto;
        Msg.Recipients.Clear;
        SL.Text := aDestino;
        Msg.Recipients.Clear;
        for I := 0 to SL.Count-1 do 
          Msg.Recipients.Add.Address := SL[I];
        SL.Text := aAnexos;
        Msg.Body.Text := aCorpo;
        Msg.Subject := aAssunto;
        Msg.MessageParts.Clear;

        for I := 0 to SL.Count - 1 do
          TidAttachment.Create(Msg.MessageParts, SL[I]);
        Smtp.Send(Msg);
      finally
        Smtp.Disconnect;  
      end;
    except
      on E: Exception do 
        Result := E.Message
    end;
  finally
    SL.Free;
  end;
end;

function TdmEmail.GetPassword: String;
begin
  Result := Smtp.Password;
end;

function TdmEmail.GetServidor: String;
begin
  Result := Smtp.Host;
end;

function TdmEmail.GetUsername: String;
begin
  Result := Smtp.Username;
end;

function PosDelim(S: String): Integer;
begin
  for Result := 1 to Length(S) do 
    if S[Result] in [',', ';'] then Exit;

  Result := 0;
end;

procedure TdmEmail.ObtemDestinos(aDestino: TStrings);
var 
  P, I : Integer;
  S : String;
  SL : TStrings;
begin    
  SL := TStringList.Create;
  try
    S := aDestino.Text;
    SL.Text := '';
    for I := 0 to aDestino.Count - 1 do begin
      S := aDestino[I];
      while Length(S)>0 do begin 
        P := PosDelim(S);
        if P>0 then begin
          SL.Add(Trim(Copy(S, 1, P-1)));
          Delete(S, 1, P);
        end else begin
          if Trim(S)>'' then
            SL.Add(S);
          S := '';  
        end;
      end;
    end;
    aDestino.Text := SL.Text;
  finally
    SL.Free;
  end;
end;

procedure TdmEmail.SetAutenticouPop(const Value: Boolean);
begin
  if FAutenticouPop = Value then Exit;

{  if Value then begin
    Pop3.Host := Servidor;
    Pop3.Username := Username;
    Pop3.Password := Password;
    Pop3.Connect(0);
  end;}

  FAutenticouPop := Value;
end;

procedure TdmEmail.SetMetodoLogin(const Value: TMetodoLogin);
begin
{  FMetodoLogin := Value;
  if Value=lgComSenha then
    Smtp.AuthenticationType := atLogin else
    Smtp.AuthenticationType := atNone;}
end;

procedure TdmEmail.SetPassword(const Value: String);
begin
//  Smtp.Password := Value;
end;

procedure TdmEmail.SetServidor(const Value: String);
begin
//  Smtp.Host := Value;
end;

procedure TdmEmail.SetUsername(const Value: String);
begin
//  Smtp.Username := Value;
end;

procedure TdmEmail.Timer1Timer(Sender: TObject);
var 
  I, Q: Integer;
  SL: TStrings;
  S: String;
  Enviar : Boolean;

procedure DiminuiRestam;
var k: integer;
begin
  tCorpo.Edit;
  tCorpoRestam.Value := tCorpoRestam.Value-1;
  tCorpo.Post;

  if (tCorpoRestam.Value < 1) and tCorpoApagarAnexosAposEnvio.Value then begin
    SL.Text := tCorpoAnexos.Value;
    for k := 0 to SL.Count - 1 do
    try
      DeleteFile(SL[k]);
    except  
    end;
  end;  
end;
  
begin
  Timer1.Enabled := False;
  SL := TStringList.Create;
  try
    tCorpo.CancelRange;
    tCorpo.IndexName := 'IProcessou';
    tCorpo.SetRange([False], [False]);
   
    while (not tCorpo.Eof) and (not TerminarProcEmail) do begin
      nxDB.StartTransactionWith([tCorpo, tEnvio]);
      try
        SL.Text := tCorpoDestino.Value;
        ObtemDestinos(SL);
        Q := 0;
        for I := 0 to SL.Count-1 do
        if Trim(SL[I])>'' then begin
          Inc(Q);
          tEnvio.Insert;
          tEnvioCorpo.Value := tCorpoID.Value;
          tEnvioDestino.Value := Trim(SL[I]);
          tEnvioInclusao.Value := Now;
          tEnvioTentativas.Value := 0;
          tEnvioOK.Value := False;
          tEnvioEnviar.Value := True;
          tEnvio.Post;
        end;  
        tCorpo.Edit;
        tCorpoRestam.Value := SL.Count;
        tCorpoProcessou.Value := True;
        tCorpo.Post;
        nxDB.Commit;
      except
        nxDB.Rollback;
        Raise;
      end;  
    end;

    tCorpo.CancelRange;
    tCorpo.IndexName := 'IID';
    
    tEnvio.SetRange([True], [True]);
    tEnvio.Refresh;

    AutenticouPop := False;

    while (not tEnvio.Eof) and (not TerminarProcEmail) do begin  
      try
        tEnvio.Edit;
        tEnvioTentativas.Value := tEnvioTentativas.Value + 1;
        if tCorpo.FindKey([tEnvioCorpo.Value]) then begin
          S := Envia2(tEnvioDestino.Value, tCorpoAssunto.Value, tCorpoCorpo.Value, tCorpoAnexos.Value);
          if S<>'' then raise ENexCafe.Create(S);
          
          tEnvioEnvio.Value := Now;
          tEnvioOK.Value := True;
          tEnvioEnviar.Value := False;
          DiminuiRestam;
        end else begin
          tEnvioOk.Value := False;
          tEnvioEnviar.Value := False;
          tEnvioMsgErro.Value := 'Corpo da mensagem não encontrado';
        end;  
        tEnvio.Post;
      except  
        On E: EnxDatabaseError do Exit;
        On E: ENexCafe do begin
          SL.Text := tEnvioMsgErro.Value;
          SL.Add(E.Message);
          tEnvioMsgErro.Value := SL.Text;
          Enviar := (tEnvioTentativas.Value < MaxTriesEmail);
          tEnvioEnviar.Value := Enviar;
          tEnvio.Post;
          if Enviar then 
            tEnvio.Next else
            DiminuiRestam;
        end;  
      end;  
    end;
  finally
    SL.Free;
    Timer1.Enabled := True;
  end;
end;


end.
