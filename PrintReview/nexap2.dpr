program nexap2;

uses
//  ncDebug,
  sysutils,
  windows,
  uLogs,
  ncPRExtractImgs in 'ncPRExtractImgs.pas';

const
  WM_PR_NEWDOC = $8001;
  
var
  C    : Cardinal;
  
  S, 
  sHandle,
  sDir,
  sDest,
  sSession : String;

  Admin: Boolean;
  
  H : HWND;

function MySessionID: Integer;
 // Getting the session id from the current process
type
  TProcessIdToSessionId = function(dwProcessId: DWORD; pSessionId: DWORD): BOOL; stdcall;
var
  ProcessIdToSessionId: TProcessIdToSessionId;
  Lib : THandle;
  pSessionId : DWord;
begin
  Result := 0;
  Lib := GetModuleHandle('kernel32');
  if Lib <> 0 then
  begin
    ProcessIdToSessionId := GetProcAddress(Lib, 'ProcessIdToSessionId');
    if Assigned(ProcessIdToSessionId) then
    begin
      if ProcessIdToSessionId(GetCurrentProcessId(), DWORD(@pSessionId)) then
        Result:= pSessionId;
    end;
  end;
end;  

begin

  S := paramstr(1);
  if S[1]='"' then Delete(S, 1, 1);
  if S[Length(S)]='"' then Delete(S, Length(S), 1);


  sHandle := paramstr(2);
  if Pos('VIEWERHANDLE', sHandle)=1 then begin
    sDest := S;
    H := StrToIntDef(Copy(sHandle, 13, 20), 0);
    Admin := True;
    C := StrToIntDef(paramstr(3), 0);
    gLog.Log(nil, [lcTrace], 'ADMIN Handle ' + sHandle + ' ArqID ' + Paramstr(3));
  end
  else begin
    Str(MySessionID, sSession);

    Admin := False;
    S := ExtractFilePath(ParamStr(0)) + 'print\pend\0\'+ExtractFileName(S);
  
    {checa se existe uma janela criada para receber mensagens de impressão nessa sessão de windows ... ou seja se tem um NexGuard aberto nessa sessão}
  
    H := FindWindow(PAnsiChar('FrmPrintReview_'+sSession), nil);

    if H > 0 then begin
      sDir := ExtractFilePath(ParamStr(0)) + 'print\pend\1';
      if not DirectoryExists(sDir) then ForceDirectories(sDir);
      C := GetTickCount;
      repeat
        Inc(C);
        sDest := sDir+'\'+sSession+'_'+IntToStr(C)+'.pdf';
      until (not FileExists(sDest));
      MoveFile(PChar(S), PChar(sDest));
    end else begin
      DeleteFile(PAnsiChar(S));
      Exit;
    end;
  end;
  
  PostMessage(H, WM_PR_NEWDOC, C, 0);

  try
    with TncPDFExtractImgs.Create(sDest, C, H, Admin) do begin
      UseMMF := True;
      Processar;
      Free;
    end;
  except
    on E: Exception  do
      gLog.Log(nil, [lcExcept], 'Exception: '+E.Message);
  end;
  gLog.ForceLogWrite;
end.
