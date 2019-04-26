unit ncDebug;
{
    ResourceString: Dario 12/03/13
}

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

  nomearqdebug  : String = 'debug.txt'; // do not localize

  procedure DebugMsg(S: String; const aShowMsg: Boolean = False); overload;
  procedure DebugMsg(Sender:TObject; S: String; const aShowMsg: Boolean = False); overload;
  procedure DebugMsgEsp(S: String; const aShowMsg, aForcar: Boolean); overload;
  procedure DebugMsgEsp(Sender:TObject; S: String; const aShowMsg, aForcar: Boolean); overload;
  procedure DesativaDebug;
  procedure DebugEx(aObj: TObject; aFuncao: String; E: Exception; const aForcar: Boolean = True);
  

implementation

procedure AbreArquivo;
var S: String;
begin
  debugCS.Enter;
  try
    try
      S := ExtractFileName(ParamStr(0));
      S := Copy(S, 1, Pos('.', S)-1);
      S := ExtractFilePath(ParamStr(0))+'logs\'+S+'_debug_'+FormatDateTime('yyyymmddhhnnss', now)+'.txt';
      AssignFile(arqDebug, S);
      if FileExists(S) then
        Append(arqDebug) else 
        Rewrite(arqDebug);
      Writeln(arqDebug, '-------------------------------------------------');
      Writeln(arqDebug, '  INICIO: '+FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));   // do not localize
      Writeln(arqDebug, '-------------------------------------------------');
    except
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
  if C=MainThreadID then
    Result := 'main.t' else
    Result := IntToStr(C);
  while Length(Result)<6 do Result := '0'+Result;
end;

procedure DebugEx(aObj: TObject; aFuncao: String; E: Exception; const aForcar: Boolean = True);
var S : String;
begin
  S := '';
  if Assigned(aObj) then S := aObj.ClassName + ' - ';
  if aFuncao>'' then 
    S := aFuncao + ' - ' + E.ClassName + ' - ' + E.Message else
    S := E.ClassName + ' - ' + E.Message;
  DebugMsgEsp(aObj, S, False, aForcar);
end;

procedure DebugMsgEsp(S: String; const aShowMsg, aForcar: Boolean);
var SaveAtivo : Boolean;
begin
  debugCS.Enter;
  try
    try
      SaveAtivo := DebugAtivo;
      if aForcar or DebugAtivo then begin
        if not AbriuArqDebug then AbreArquivo;
        if Trim(S)>'' then
          Writeln(arqDebug, FormatDateTime('dd/mm/yyyy hh:nn:ss.zzz', Now)+' - '+ThreadIDStr+' - '+S) else
          Writeln(arqDebug);
        Flush(arqDebug);
      end;
      if aForcar and (not SaveAtivo) then
        DesativaDebug;
    except
    end;
  finally
    debugCS.Leave;
  end;

  
{  if aForcar then
    gLog.ForceLog(nil, [lcDebug], S) else
    gLog.Log(nil, [lcDebug], S);
  gLog.ForceLogWrite;}
end;

procedure DebugMsgEsp(Sender:TObject;S: String; const aShowMsg, aForcar: Boolean);
begin
  if Assigned(Sender) then
    DebugMsgEsp(Sender.ClassName + ' - ' + S, False, aForcar) else
    DebugMsgEsp(S, False, aForcar);
    
{  if aForcar then
    gLog.ForceLog(Sender, [lcDebug], S) else
    gLog.Log(Sender, [lcDebug], S);
  gLog.ForceLogWrite;}
end;

procedure DebugMsg(S: String; const aShowMsg: Boolean = False);
begin
  DebugMsgEsp(S, aShowMsg, False);
{  gLog.Log(nil, [lcDebug], S);
  gLog.ForceLogWrite;}
end;

procedure DebugMsg(Sender:TObject;S: String; const aShowMsg: Boolean = False);
begin
  DebugMsgEsp(Sender, S, aShowMsg, False);
{  gLog.Log(Sender, [lcDebug], S);
  gLog.ForceLogWrite;}
end;

procedure DesativaDebug;
begin
  DebugCS.Enter;
  try
    DebugAtivo := False;
    if AbriuArqDebug then begin
      CloseFile(arqDebug);
      AbriuArqDebug := False;
    end;
  finally
    DebugCS.Leave;
  end;
end;

initialization
  DebugCS := TCriticalSection.Create;
  AbriuArqDebug := False;

finalization
  try
    DesativaDebug;
  except
  end;
  FreeAndNil(DebugCS);
  
  

end.

