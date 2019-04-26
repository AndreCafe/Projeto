unit ncDebug;

interface

uses
  SyncObjs,
  SysUtils,
  Dialogs;

var
  AbriuArqDebug : Boolean = False;
  DebugAtivo : Boolean = False;
  arqDebug : TextFile;
  debugCS  : TCriticalSection = nil;

  nomearqdebug  : String = 'debug.txt';

  procedure DebugMsg(S: String; const aShowMsg: Boolean = False);
  procedure DebugMsgEsp(S: String; const aShowMsg, aForcar: Boolean);
  procedure DesativaDebug; 

implementation

procedure AbreArquivo;
var S: String;
begin
  debugCS.Enter;
  try
    try
      S := ExtractFilePath(ParamStr(0))+nomearqdebug;
      AssignFile(arqDebug, S);
      if FileExists(S) then
        Append(arqDebug) else 
        Rewrite(arqDebug);
      Writeln(arqDebug, '-------------------------------------------------');
      Writeln(arqDebug, '  INICIO: '+FormatDateTime('dd/mm/yyyy hh:mm:ss', Now));  
      Writeln(arqDebug, '-------------------------------------------------');
    except
    end;
    AbriuArqDebug := True;
  finally
    debugCS.Leave;
  end;
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
          Writeln(arqDebug, FormatDateTime('dd/mm/yyyy hh:mm:ss - ', Now)+S) else
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
end;

procedure DebugMsg(S: String; const aShowMsg: Boolean = False);
begin
  DebugMsgEsp(S, aShowMsg, False);
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
