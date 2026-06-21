unit uDMEmail;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  SysUtils, Classes, IdPOP3, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, ExtCtrls, DB, nxdb,
  nxsdServerEngine, nxreRemoteServerEngine, nxllTransport, nxdbBase,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent;

type

  TMetodoLogin = (lgSemSenha, lgComSenha, lgAuthPop);
  
  TdmEmail = class(TDataModule)
    Smtp: TIdSMTP;
    Msg: TIdMessage;
    Pop3: TIdPOP3;
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
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FMetodoLogin : TMetodoLogin;
    FAutenticouPop : Boolean;
    
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

// START resource string wizard section
resourcestring
  SCorpoDaMensagemNãoEncontrado = 'Corpo da mensagem não encontrado';

// END resource string wizard section


{$R *.dfm}

{ TdmEmail }

procedure TdmEmail.DataModuleCreate(Sender: TObject);
begin
  FMetodoLogin := lgSemSenha;
  FAutenticouPop := False;
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

procedure TdmEmail.ObtemDestinos(aDestino: TStrings);
begin

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
  I: Integer;
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
    tCorpo.IndexName := 'IProcessou'; // do not localize
    tCorpo.SetRange([False], [False]);
   
    while (not tCorpo.Eof) and (not TerminarProcEmail) do begin
      nxDB.StartTransactionWith([tCorpo, tEnvio]);
      try
        SL.Text := tCorpoDestino.Value;
        ObtemDestinos(SL);
        //Q := 0;
        for I := 0 to SL.Count-1 do
        if Trim(SL[I])>'' then begin
          //Inc(Q);
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
    tCorpo.IndexName := 'IID'; // do not localize
    
    tEnvio.SetRange([True], [True]);
    tEnvio.Refresh;

    AutenticouPop := False;

    while (not tEnvio.Eof) and (not TerminarProcEmail) do begin  
      try
        tEnvio.Edit;
        tEnvioTentativas.Value := tEnvioTentativas.Value + 1;
        if tCorpo.FindKey([tEnvioCorpo.Value]) then begin
          S := EnviaEmail(tEnvioDestino.Value, tCorpoAssunto.Value, tCorpoCorpo.Value, tCorpoAnexos.Value);
          if S<>'' then raise Exception.Create(S);
          
          tEnvioEnvio.Value := Now;
          tEnvioOK.Value := True;
          tEnvioEnviar.Value := False;
          DiminuiRestam;
        end else begin
          tEnvioOk.Value := False;
          tEnvioEnviar.Value := False;
          tEnvioMsgErro.Value := SCorpoDaMensagemNãoEncontrado;
        end;  
        tEnvio.Post;
      except  
        On E: EnxDatabaseError do Exit;
        On E: Exception do begin
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

