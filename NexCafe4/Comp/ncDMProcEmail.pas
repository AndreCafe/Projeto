unit ncDMProcEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncDMEmail, IdPOP3, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, ncDMCaixa,
  nxllComponent, nxdb, DB, ncClassesBase, ExtCtrls, nxsdServerEngine,
  nxreRemoteServerEngine, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  LMDCustomComponent, LMDBaseController, LMDCustomContainer, LMDStringList;

type

  TdmProcEmail = class(TdmEmail)
    tCriar: TnxTable;
    tCriarID: TAutoIncField;
    tCriarTipo: TIntegerField;
    tCriarParametros: TMemoField;
    tCriarDestino: TMemoField;
    slHTML: TLMDStringList;
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

uses ncServBD, ncDebug;

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
  S, sIdent: String;
  ID : Integer;
begin
  ID := StrToIntDef(tCriarParametros.Value, 0);
  if ID>0 then begin
    S := ExtractFilePath(ParamStr(0)) + 'Email\Caixa' + IntToStr(ID) + '.pdf';
    dmc.ExportaCaixa(ID, S);
    tCorpo.Insert;
    if Trim(gConfig.EmailIdent)>'' then 
      sIdent:= gConfig.EmailIdent + ' - ' else
      sIdent:= '';
    tCorpoAssunto.Value := sIdent+'Caixa n.' + tCriarParametros.Value + 
                           ' - ' + dmc.tCaixaAbertura.AsString + 
                           ' a ' + dmc.tCaixaFechamento.AsString;
    tCorpoCorpo.Value :=  slHTML.Items[1].Items.Text;
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
          on E: Exception do 
            DebugMsg('TncProcEmailThread - Exception: ' + E.Message);
        end;
      end;
    
    finally 
      FreeAndNil(dmProcEmail.dmc); 
      dmProcEmail.Smtp.Disconnect;
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
    DebugMsg('FinalizaProcEmail - 1');
    TerminarProcEmail := True;
    thProcEmail.Terminate;
    thProcEmail.WaitFor;
    FreeAndNil(thProcEmail);
    DebugMsg('FinalizaProcEmail - 2');
  end;
end;

procedure TdmProcEmail.Timer1Timer(Sender: TObject);
begin  
  Timer1.Enabled := False;
  try       
    try        
      tCriar.Active := False;                            
      tCriar.Active := True;
      tCriar.First;
      while (not tCriar.IsEmpty) do begin
        case tCriarTipo.Value of
          teFechamentoCaixa : CriaFechamentoCaixa; 
        end;
        tCriar.Delete;
      end;
    except
      on E: Exception do 
        DebugMsgEsp('TdmProcEmail.Timer1Timer - Exception: ' + E.Message, False, True);
    end;
    
    inherited;
  
  finally
    Timer1.Enabled := True;
  end;
end;

end.
