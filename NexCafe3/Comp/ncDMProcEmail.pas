unit ncDMProcEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDMEmail, IdPOP3, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, ncDMCaixa,
  nxllComponent, nxdb, DB, ncClassesBase, ExtCtrls, nxsdServerEngine,
  nxreRemoteServerEngine, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport;

type

  TdmProcEmail = class(TdmEmail)
    tCriar: TnxTable;
    tCriarID: TAutoIncField;
    tCriarTipo: TIntegerField;
    tCriarParametros: TMemoField;
    tCriarDestino: TMemoField;
    procedure DataModuleCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    dmc : TdmCaixa;
    { Private declarations }

    procedure CriaFechamentoCaixa;
  public
    { Public declarations }
  end;

  TncProcEmailThread = class (TThread)
  private
    FMetodo      : Byte;
    FServ        : String;
    FUsername    : String;
    FSenha       : String;
    FdmProcEmail : TdmProcEmail;
  protected
    procedure Execute; override;
  public
    constructor Create(aMetodo: Byte; aServ, aUsername, aSenha: String);
  end;

  procedure InicializaProcEmail(aMetodo: Byte; aServer, aUsername, aSenha: String);
  procedure FinalizaProcEmail;

const
  // Tipos de Emaila serem criados
  teFechamentoCaixa = 1;  

var
  dmProcEmail: TdmProcEmail;
  thProcEmail: TncProcEmailThread = nil;

implementation

uses ncServBD;

{$R *.dfm}

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TdmProcEmail.CriaFechamentoCaixa;
var 
  S: String;
  ID : Integer;
begin
  ID := StrToIntDef(tCriarParametros.Value, 0);
  if ID>0 then begin
    S := ExtractFilePath(ParamStr(0)) + 'Email\Caixa' + tCriarParametros.Value + '.pdf';
    dmc.ExportaCaixa(ID, S);
    tCorpo.Insert;
    tCorpoAssunto.Value := 'Caixa n.' + tCriarParametros.Value + 
                           ' - ' + dmc.tCaixaAbertura.AsString + 
                           ' a ' + dmc.tCaixaFechamento.AsString;
    tCorpoCorpo.Value := 
      'Olá, ' + sLineBreak + sLineBreak +
      'Segue em anexo o relatório do caixa recém fechado.' + sLineBreak + sLineBreak +
      'Esse e-mail é gerado automaticamente pelo servidor NexCafé. '+
      'Caso não queira mais recebê-lo, desmarque a opção I/2 no atalho de OPÇÕES do NexAdmin';
      
    tCorpoApagarAnexosAposEnvio.Value := True;
    tCorpoDestino.Value := tCriarDestino.Value;
    tCorpoProcessou.Value := False;
    tCorpoAnexos.Value := S;
    tCorpo.Post;
  end;
end;

procedure TdmProcEmail.DataModuleCreate(Sender: TObject);
begin
  inherited;       
  nxDB.AliasPath := '';
  nxDB.AliasName := 'nexcafe';                          
  dmc := TdmCaixa.Create(Self);
  dmc.nxSession.ServerEngine := dmServidorBD.ServerEngine;
  dmc.AbreConn;

  nxSession.ServerEngine := dmServidorBD.ServerEngine;
  tCorpo.Active := True;
  tEnvio.Active := True;
  tCriar.Active := True;
end;

{ TncProcEmailThread }

constructor TncProcEmailThread.Create(aMetodo: Byte; aServ, aUsername, aSenha: String);
begin
  inherited Create(True);
  FMetodo := aMetodo;
  FServ   := aServ;
  FUsername := aUsername;
  FSenha := aSenha;
  FdmProcEmail := nil;
  TerminarProcEmail := False;
  FreeOnTerminate := False;
  Resume;
end;

procedure TncProcEmailThread.Execute;
var Dummy : Integer;
begin
  try
    try
      dmProcEmail := TdmProcEmail.Create(nil);

      with dmProcEmail do begin
        Servidor := FServ;
        Username := FUsername;
        Password := FSenha;
        MetodoLogin := TMetodoLogin(FMetodo);
        Msg.From.Address := Username;
        Msg.From.Name := 'NexCafé';
        Timer1.Enabled := True;
      end;
    except
      try
        FreeAndNil(dmProcEmail);
      except
      end;  
      Exit;
    end;  

    try
      while (not Terminated) and (not TerminarProcEmail) do begin
        MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
        try
          ProcessMessages;
        except
        end;
      end;
    
    finally 
      FreeAndNil(dmProcEmail.dmc); 
      dmProcEmail.Smtp.Disconnect;
      dmProcEmail.Pop3.Disconnect;
      dmProcEmail.nxSession.Active := False;
      FreeAndNil(dmProcEmail);
    end;  
  except
  end;
end;

procedure InicializaProcEmail(aMetodo: Byte; aServer, aUsername, aSenha: String);
begin
  if thProcEmail = nil then
    thProcEmail := TncProcEmailThread.Create(aMetodo, aServer, aUsername, aSenha);
end;

procedure FinalizaProcEmail;
begin
  if thProcEmail <> nil then begin
    TerminarProcEmail := True;
    thProcEmail.Terminate;
    thProcEmail.WaitFor;
    FreeAndNil(thProcEmail);
  end;
end;

procedure TdmProcEmail.Timer1Timer(Sender: TObject);
begin                                             
  tCriar.Active := True;
  tCriar.First;
  while (not tCriar.IsEmpty) do begin
    case tCriarTipo.Value of
      teFechamentoCaixa : CriaFechamentoCaixa; 
    end;
    tCriar.Delete;
  end;
  
  inherited;
end;

end.
