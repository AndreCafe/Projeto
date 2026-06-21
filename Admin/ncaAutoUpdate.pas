unit ncaAutoUpdate;
// Logica centralizada de auto-update via /api/v1/update.
// Unico lugar para alterar AppKey e URL de update.
//
// Formato de resposta do servidor:
//   UPDATE-AVAILABLE:<versao>:<url>   ex: UPDATE-AVAILABLE:216:https://nexcafe.api.br/...
//   UPTODATE                          ja esta na ultima versao

interface

uses Windows, SysUtils, Classes, Forms, Controls, Dialogs, ComObj, ShellApi, uHMAC_sha256, ncDebug, ncaAutoUpdateFrm;

const
  NEXCAFE_APP_KEY = 'df0c41f50a7c5b7c2cfe5626fcc9ff7014fbc75d7324561547666c104f4652a3'; // do not localize
  NEXCAFE_UPD_URL = 'https://nexcafe.api.br/api/v1/update'; // do not localize

  // Prefixo retornado pelo servidor quando ha atualizacao disponivel
  NEXCAFE_UPD_PREFIX = 'UPDATE-AVAILABLE:'; // do not localize

// aIDLoja : gConfig.IDLoja (FrmPri) ou StrToIntDef(slConfig['IDLoja'], 0) (FrmLogin)
// aShortVer: SelfShortVer (ex: '215')
procedure DoAutoUpdate(aIDLoja: Integer; const aShortVer: String);

implementation

procedure DoAutoUpdate(aIDLoja: Integer; const aShortVer: String);
var
  aTS: Int64;
  aSig, sLoja, sParams, aResp, aUrlDown, sVerNova, sSetup: String;
  aHttp: OleVariant;
  aSysTime: TSystemTime;
  aStatusCode: Integer;
  P1: Integer;
  aMagic: Word;
  aShellResult: HINST;
  aStream: TFileStream;
  sInstallDir, sShellParams: String;
begin
  DebugMsg(Format('DoAutoUpdate - inicio IDLoja=%d versao=%s', [aIDLoja, aShortVer])); // do not localize

  if aIDLoja <= 0 then begin
    DebugMsg('DoAutoUpdate - IDLoja invalido, abortando'); // do not localize
    Beep;
    ShowMessage('Loja não registrada. Contate o suporte antes de atualizar!');
    Exit;
  end;

  sLoja := IntToStr(aIDLoja);
  try
    // --- 1. Monta HMAC e chama /update ---
    GetSystemTime(aSysTime);
    aTS  := Round((SystemTimeToDateTime(aSysTime) - EncodeDate(1970, 1, 1)) * 86400);
    aSig := tHmac_sha256.calc(NEXCAFE_APP_KEY, sLoja + '|' + IntToStr(aTS)); // do not localize

    sParams := 'loja=' + sLoja + '&versao=' + aShortVer; // do not localize
    DebugMsg('DoAutoUpdate - GET ' + NEXCAFE_UPD_URL + '?' + sParams); // do not localize
    DebugMsg('DoAutoUpdate - X-Timestamp=' + IntToStr(aTS) + ' sig=' + Copy(aSig, 1, 16) + '...'); // do not localize

    aHttp := CreateOleObject('WinHttp.WinHttpRequest.5.1'); // do not localize
    aHttp.Open('GET', NEXCAFE_UPD_URL + '?' + sParams, False); // do not localize
    aHttp.SetRequestHeader('X-NexCafe-Key', NEXCAFE_APP_KEY); // do not localize
    aHttp.SetRequestHeader('X-Timestamp',   IntToStr(aTS));   // do not localize
    aHttp.SetRequestHeader('X-Signature',   aSig);            // do not localize
    aHttp.Send('');

    aStatusCode := aHttp.Status;
    aResp := Trim(aHttp.ResponseText);
    DebugMsg(Format('DoAutoUpdate - HTTP %d resposta: [%s]', [aStatusCode, aResp])); // do not localize

    // --- 2. Interpreta resposta ---
    if SameText(aResp, 'UPTODATE') then begin // do not localize
      DebugMsg('DoAutoUpdate - ja na ultima versao'); // do not localize
      ShowMessage('Você já está na última versão.');
      Exit;
    end;

    // Aceita tanto UPDATE-AVAILABLE: (servidor atual) quanto UPDATE: (formato legado)
    if (Pos(NEXCAFE_UPD_PREFIX, aResp) <> 1) and (Pos('UPDATE:', aResp) <> 1) then begin // do not localize
      DebugMsg('DoAutoUpdate - resposta inesperada, nao e UPDATE-AVAILABLE nem UPDATE: [' + aResp + ']'); // do not localize
      ShowMessage('Não foi possível verificar atualizações agora. Resposta: ' + aResp);
      Exit;
    end;

    // Parse <prefixo>:<versao>:<url>  — P1 aponta para o ':' apos o prefixo
    P1       := Pos(':', aResp);                                       // 1o ':'
    // segundo ':' dentro do trecho apos P1
    sVerNova := Copy(aResp, P1 + 1, Pos(':', Copy(aResp, P1 + 1, MaxInt)) - 1);
    aUrlDown := Copy(aResp, P1 + Length(sVerNova) + 2, MaxInt);

    DebugMsg('DoAutoUpdate - versao nova: ' + sVerNova); // do not localize
    DebugMsg('DoAutoUpdate - url download: ' + aUrlDown); // do not localize

    if (sVerNova = '') or (aUrlDown = '') then begin
      DebugMsg('DoAutoUpdate - parse falhou: versao ou url vazios'); // do not localize
      ShowMessage('Formato de resposta inesperado do servidor: ' + aResp);
      Exit;
    end;

    // --- 3. Confirmacao do usuario ---
    if MessageDlg('Nova versão ' + sVerNova + ' disponível. Atualizar agora?' + #13#10 +
                  '(O programa sera fechado e reiniciado automaticamente.)',
                  mtConfirmation, [mbYes, mbNo], 0) <> mrYes then begin
      DebugMsg('DoAutoUpdate - usuario cancelou'); // do not localize
      Exit;
    end;

    // --- 4. Download com barra de progresso (thread separada, UI responsiva) ---
    sSetup := GetEnvironmentVariable('TEMP') + '\NexCafeSetup_' + sVerNova + '.exe'; // do not localize
    DebugMsg('DoAutoUpdate - salvando em: ' + sSetup); // do not localize
    DeleteFile(PChar(sSetup));

    if not DownloadWithProgress(aUrlDown, sSetup) then begin
      DebugMsg('DoAutoUpdate - download cancelado ou falhou'); // do not localize
      if FileExists(sSetup) then DeleteFile(PChar(sSetup));
      Exit;
    end;

    if not FileExists(sSetup) then begin
      DebugMsg('DoAutoUpdate - arquivo nao encontrado apos download: ' + sSetup); // do not localize
      ShowMessage('Arquivo de atualização não encontrado após download.');
      Exit;
    end;

    DebugMsg('DoAutoUpdate - arquivo baixado OK: ' + sSetup); // do not localize

    // --- 5. Valida que o arquivo e um PE (comeca com 'MZ') e nao HTML de erro ---
    aStream := TFileStream.Create(sSetup, fmOpenRead or fmShareDenyNone);
    try
      DebugMsg('DoAutoUpdate - tamanho do arquivo: ' + IntToStr(aStream.Size) + ' bytes'); // do not localize
      if aStream.Size < 65536 then begin
        DebugMsg('DoAutoUpdate - arquivo muito pequeno, provavelmente nao e um setup valido'); // do not localize
        ShowMessage('Arquivo baixado parece inválido (muito pequeno: ' + IntToStr(aStream.Size) + ' bytes).');
        Exit;
      end;
      aMagic := 0;
      aStream.Read(aMagic, SizeOf(aMagic));
      DebugMsg(Format('DoAutoUpdate - magic bytes: 0x%x (esperado 0x5A4D = MZ)', [aMagic])); // do not localize
      if aMagic <> $5A4D then begin
        DebugMsg('DoAutoUpdate - arquivo nao e PE/MZ, possivelmente HTML de erro'); // do not localize
        ShowMessage('Arquivo baixado não é um executável válido. O token pode ter expirado.');
        Exit;
      end;
    finally
      aStream.Free;
    end;

    // --- 6. Executa setup silencioso com runas para garantir elevacao UAC ---
    // Passa /DIR= com o diretorio do executavel atual para o Inno instalar no
    // mesmo local, independente do DefaultDirName hard-coded no .iss.
    sInstallDir := ExcludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
    sShellParams := '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /DIR="' + // do not localize
      sInstallDir + '"'; // do not localize
    DebugMsg('DoAutoUpdate - executando setup silencioso (runas) params=' + sShellParams); // do not localize
    aShellResult := ShellExecute(0, 'runas', PChar(sSetup), // do not localize
      PChar(sShellParams), nil, SW_SHOWNORMAL);
    DebugMsg(Format('DoAutoUpdate - ShellExecute resultado: %d (>32 = OK)', [aShellResult])); // do not localize

    if aShellResult <= 32 then begin
      DebugMsg('DoAutoUpdate - ShellExecute falhou codigo=' + IntToStr(aShellResult)); // do not localize
      ShowMessage('Não foi possível iniciar o instalador (erro ' + IntToStr(aShellResult) + ').');
      Exit;
    end;

    DebugMsg('DoAutoUpdate - encerrando aplicacao'); // do not localize
    Application.Terminate;

  except
    on E: Exception do begin
      DebugMsg('DoAutoUpdate - EXCECAO: ' + E.ClassName + ': ' + E.Message); // do not localize
      Beep;
      ShowMessage('Falha ao atualizar: ' + E.Message);
    end;
  end;
end;

end.
