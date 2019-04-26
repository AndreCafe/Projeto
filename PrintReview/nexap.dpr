program nexap;

uses
  ncDebug,
  registry,
  dialogs,
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
  sIni,
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
    DebugMsg('ADMIN Handle ' + sHandle + ' ArqID ' + Paramstr(3));
  end
  else begin
    Str(MySessionID, sSession);

    Admin := False;
    S := ExtractFilePath(ParamStr(0)) + 'print\pend\0\'+ExtractFileName(S);
  
    {checa se existe uma janela criada para receber mensagens de impressão nessa sessão de windows ... ou seja se tem um NexGuard aberto nessa sessão}
    H := FindWindow(PAnsiChar('FrmPrintReview_'+sSession), nil);

    if H > 0 then begin
      sIni := ParamStr(1);
      sIni := Copy(sIni, 1, Length(sIni)-3) + 'ini';
      sDir := ExtractFilePath(ParamStr(0)) + 'print\pend\1';
      if not DirectoryExists(sDir) then
        ForceDirectories(sDir);
      
      if FileExists(sIni) then begin
        MoveFile(PChar(sIni), PChar(sDir+'\'+ExtractFileName(sIni)));
        sDest := sDir+'\'+ExtractFileName(S);
        MoveFile(PChar(S), PChar(sDest));
        sIni := ExtractFileName(S);
        Delete(sIni, 1, Pos('_', sIni));
        C := StrToIntDef(Copy(sIni, 1, Pos('.', sIni)-1), 0);
      end else begin
        if C=0 then begin  
          C := GetTickCount;
          repeat
            Inc(C);
            sDest := sDir+'\'+sSession+'_'+IntToStr(C)+'.pdf';
          until (not FileExists(sDest));
          MoveFile(PChar(S), PChar(sDest));
        end;
      end;
    end else begin
      MessageBeep(MB_ICONEXCLAMATION);
      MessageBox(0, PAnsiChar('Sua impressão NÃO foi realizada. Procure o atendente da loja.'+ sLineBreak+sLineBreak+
                              'Para imprimir é necessário que o programa NexCafé NexGuard esteja em execução.'+sLineBreak+sLineBreak+
                              'A impressão foi salva em: '+ParamStr(1)), PAnsiChar('Atenção'), MB_OK or MB_ICONERROR);
//      DeleteFile(PAnsiChar(S));
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
end.
