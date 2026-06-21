unit cmServBD;

interface

uses
  Windows, FileCtrl, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  nx1xAllEngines,
  nxptZipCompressor,
  nxptRleCompressor,
  nxptZlib,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport,
  nxsdServerEngine, nxsrSecurityMonitor, nxsrSqlEngineBase, nxsqlEngine,
  nxchCommandHandler, nxllComponent, nxsrServerEngine, nxllEventLog, nxdb,
  Db;

type
  TAndamentoConversao = procedure (Arquivo: String; Total, Atual : Integer) of Object;

  TdmServidorBD = class(TDataModule)
    EventLog: TnxEventLog;
    ServerEngine: TnxServerEngine;
    CommandHandler: TnxServerCommandHandler;
    nxSQLEng: TnxSqlEngine;
    nxTCPIP: TnxWinsockTransport;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCMServidorBD = class (TThread)
  private
    FRunning : Integer;
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
    
    property Running: Integer
      read FRunning;   

    property Terminated;    
  end;

  function CreateSession: TnxSession;

  procedure TransfDados(F, D: TDataset);


var
  dmServidorBD: TdmServidorBD;

implementation

uses VocTimer;

{$R *.DFM}

procedure TransfDados(F, D: TDataset);
var 
  I : Integer;
  AF : TField;
begin
  D.Append;
  for I := 0 to pred(F.FieldCount) do 
  with F.Fields[I] do
  if (FieldKind = fkData) then begin
    AF := D.FindField(FieldName);
    if AF <> nil then 
      AF.Value := Value;
  end;  
  D.Post;
end;

procedure TdmServidorBD.DataModuleCreate(Sender: TObject);
var S : String;
begin
  S := ExtractFilePath(ParamStr(0)) + 'Dados';
  if not DirectoryExists(S) then MkDir(S);
  ServerEngine.AliasHandler.Delete('Cybermgr');
  ServerEngine.AliasHandler.Add('Cybermgr', S);
  ServerEngine.Active := True;
  CommandHandler.Active := True;
  nxSqlEng.Active := True;
  nxTCPIP.Active := True;
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

constructor TCMServidorBD.Create;
begin
  FRunning := 0; 
  dmServidorBD := nil;
     
  inherited Create(False);
end;

destructor TCMServidorBD.Destroy;
begin
  if not Terminated then begin
    Terminate;
    WaitFor;
  end;  
  inherited;
end;

procedure TCMServidorBD.Execute;
var 
  VT: TVocTimer;
  Dummy: Integer;
begin
  try
    try
      dmServidorBD := TdmServidorBD.Create(nil);
    except
      try
        FreeAndNil(dmServidorBD);
      except
      end;  
      FRunning := -1;
      Exit;
    end;  
    try
      FRunning := 1;
    
      while not Terminated do begin
        MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
        try
          ProcessMessages;
        except
        end;
      end;
    
      VTInicia(VT, 1000);
      while not VTExpirou(VT) do begin
        ProcessMessages;
        Sleep(1);
      end; 
    finally  
      FreeAndNil(dmServidorBD);
    end;  
  except
  end;
end;

function CreateSession: TnxSession;
begin
  if dmServidorBD=nil then
    Result := nil
  else begin  
    Result := TnxSession.Create(nil);
    Result.ServerEngine := dmServidorBD.ServerEngine;
    Result.Active := True;
  end;  
end;

initialization
  dmServidorBD := nil;

end.
