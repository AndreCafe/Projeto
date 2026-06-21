unit ncDebug;

interface
uses
  Windows,
  SyncObjs,
  SysUtils;

var
  AbriuArqDebug : Boolean = False;
  DebugAtivo : Boolean = False;
  arqDebug : TextFile;
  debugCS  : TCriticalSection = nil;
  nomearqdebug  : String = 'debug.txt';

  procedure DebugMsg(S: String; const aShowMsg: Boolean = False); overload;
  procedure DebugMsg(Sender:TObject; S: String; const aShowMsg: Boolean = False); overload;
  procedure DebugMsgEsp(S: String; const aShowMsg, aForcar: Boolean); overload;
  procedure DebugMsgEsp(Sender:TObject; S: String; const aShowMsg, aForcar: Boolean); overload;
  procedure DesativaDebug;
  procedure DebugEx(aObj: TObject; aFuncao: String; E: Exception; const aForcar: Boolean = True);

implementation

// *** FUNÇÃO CRÍTICA ADICIONADA ***
procedure EnsureDebugCSCreated;
begin
  if debugCS = nil then
  begin
    debugCS := TCriticalSection.Create;
  end;
end;

procedure AbreArquivo;
var S: String;
begin
  EnsureDebugCSCreated;  // ? GARANTE QUE debugCS EXISTE
  
  debugCS.Enter;
  try
    try
      S := ExtractFileName(ParamStr(0));
      S := Copy(S, 1, Pos('.', S)-1);
      
      // Cria pasta logs se não existir
      S := ExtractFilePath(ParamStr(0))+'logs\';
      if not DirectoryExists(S) then
        ForceDirectories(S);
        
      S := S + Copy(ExtractFileName(ParamStr(0)), 1, Pos('.', ExtractFileName(ParamStr(0)))-1) + 
           '_debug_' + FormatDateTime('yyyymmddhhnnss', now) + '.txt';
           
      AssignFile(arqDebug, S);
      if FileExists(S) then
        Append(arqDebug) 
      else 
        Rewrite(arqDebug);
        
      Writeln(arqDebug, '-------------------------------------------------');
      Writeln(arqDebug, '  INICIO: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      Writeln(arqDebug, '-------------------------------------------------');
    except
      on E: Exception do begin
        // Se falhar, pelo menos tenta criar arquivo básico
        try
          S := ExtractFilePath(ParamStr(0)) + 'debug_error.txt';
          AssignFile(arqDebug, S);
          Rewrite(arqDebug);
          Writeln(arqDebug, 'ERRO ao criar log: ' + E.Message);
        except
        end;
      end;
    end;
    AbriuArqDebug := True;
  finally
    debugCS.Leave;
  end;
end;

function ThreadIDStr: String;
var C : Cardinal;
begin
  C := GetCurrentThreadID;
  if C = MainThreadID then
    Result := 'main.t'
  else
    Result := IntToStr(C);
  while Length(Result) < 6 do 
    Result := '0' + Result;
end;

procedure DebugEx(aObj: TObject; aFuncao: String; E: Exception; const aForcar: Boolean = True);
var S : String;
begin
  S := '';
  if Assigned(aObj) then 
    S := aObj.ClassName + ' - ';
  if aFuncao > '' then 
    S := S + aFuncao + ' - ' + E.ClassName + ' - ' + E.Message 
  else
    S := S + E.ClassName + ' - ' + E.Message;
  DebugMsgEsp(aObj, S, False, aForcar);
end;

procedure DebugMsgEsp(S: String; const aShowMsg, aForcar: Boolean);
var 
  SaveAtivo : Boolean;
begin
  EnsureDebugCSCreated;  // ? PROTEÇÃO CRÍTICA
  
  if not Assigned(debugCS) then Exit;  // ? DOUBLE-CHECK
  
  debugCS.Enter;
  try
    try
      SaveAtivo := DebugAtivo;
      if aForcar or DebugAtivo then 
      begin
        if not AbriuArqDebug then 
          AbreArquivo;
          
        if Trim(S) > '' then
          Writeln(arqDebug, FormatDateTime('dd/mm/yyyy hh:nn:ss.zzz', Now) + 
                           ' - ' + ThreadIDStr + ' - ' + S)
        else
          Writeln(arqDebug);
          
        Flush(arqDebug);
      end;
      
      if aForcar and (not SaveAtivo) then
        DesativaDebug;
    except
      // Silenciosamente ignora erros de debug para não crashar o app
    end;
  finally
    debugCS.Leave;
  end;
end;

procedure DebugMsgEsp(Sender: TObject; S: String; const aShowMsg, aForcar: Boolean);
begin
  if Assigned(Sender) then
    DebugMsgEsp(Sender.ClassName + ' - ' + S, False, aForcar)
  else
    DebugMsgEsp(S, False, aForcar);
end;

procedure DebugMsg(S: String; const aShowMsg: Boolean = False);
begin
  DebugMsgEsp(S, aShowMsg, False);
end;

procedure DebugMsg(Sender: TObject; S: String; const aShowMsg: Boolean = False);
begin
  DebugMsgEsp(Sender, S, aShowMsg, False);
end;

procedure DesativaDebug;
begin
  if not Assigned(debugCS) then Exit;  // ? PROTEÇÃO
  
  debugCS.Enter;
  try
    DebugAtivo := False;
    if AbriuArqDebug then 
    begin
      try
        CloseFile(arqDebug);
      except
      end;
      AbriuArqDebug := False;
    end;
  finally
    debugCS.Leave;
  end;
end;

initialization
  try
    debugCS := TCriticalSection.Create;
  except
    debugCS := nil;  // Se falhar, pelo menos não fica em estado indefinido
  end;

finalization
  try
    DesativaDebug;
  except
  end;
  
  if Assigned(debugCS) then
    FreeAndNil(debugCS);

end.
