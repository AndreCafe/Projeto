program NexGuard;

uses
  Forms,
  SysUtils,
  Windows,
  SsBase,
  StShrtCt,
  StShlCtl,
  ncgDesliga,
  Classes,
  WindowList,
  Messages,
  ncgFrmPri in 'ncgFrmPri.pas' {FrmPri},
  ncgFrmLogin in 'ncgFrmLogin.pas' {FrmLogin},
  ncgFrmPausa in 'ncgFrmPausa.pas' {FrmPausa},
  ncgFrmConta in 'ncgFrmConta.pas' {FrmConta},
  ncgFrmAtualiza in 'ncgFrmAtualiza.pas' {FrmAtualiza},
  ncgFrmConfigDesktop in 'ncgFrmConfigDesktop.pas' {FrmDesktop},
  ncgFrmFake in 'ncgFrmFake.pas' {FrmFake},
  ncgLVBack in 'ncgLVBack.pas',
  ncProtecao98 in 'ncProtecao98.pas',
  ncgFrmAviso in 'ncgFrmAviso.pas' {FrmAviso},
  ncgFrmSenha in 'ncgFrmSenha.pas' {FrmAlteraSenha},
  ncClassesBase in '..\Comp\ncClassesBase.pas',
  ncFrmChat in '..\Comp\ncFrmChat.pas' {FrmBaseChat},
  ncPassaportes in '..\Comp\ncPassaportes.pas',
  ncSessao in '..\Comp\ncSessao.pas',
  ncTarifador in '..\Comp\ncTarifador.pas',
  ncIDRecursos in '..\Comp\ncIDRecursos.pas',
  ncgFrmHide in 'ncgFrmHide.pas' {FrmHide},
  ncVersoes in '..\Comp\ncVersoes.pas',
  ncgDMArqs in 'ncgDMArqs.pas' {dmArqs: TDataModule},
  MACAdress in '..\..\Utils\MACAdress.pas',
  ncCompCliente in '..\Comp\ncCompCliente.pas',
  ncCliAtualizaLic in '..\Comp\ncCliAtualizaLic.pas' {dmAtualizaLic: TDataModule},
  uLicEXECryptor in '..\..\GS\uLicEXECryptor.pas',
  ncFrmSuporteRem in '..\Comp\ncFrmSuporteRem.pas' {FrmSuporte},
  udmLogmein in '..\Comp\udmLogmein.pas' {dmLogmein: TDataModule},
  ncDebug in '..\Comp\ncDebug.pas',
  GIFImage in '..\..\Utils\GIFImage.pas',
  ncFrmCreditos in '..\Comp\ncFrmCreditos.pas' {FrmCreditos},
  ncErros in '..\Comp\ncErros.pas',
  ncgFrmConn in 'ncgFrmConn.pas' {FrmConn},
  ncMsgCom in '..\Comp\ncMsgCom.pas',
  ncCredTempo in '..\Comp\ncCredTempo.pas',
  ncDebito in '..\Comp\ncDebito.pas',
  ncDebTempo in '..\Comp\ncDebTempo.pas',
  ncImpressao in '..\Comp\ncImpressao.pas',
  ncLancExtra in '..\Comp\ncLancExtra.pas',
  ncMovEst in '..\Comp\ncMovEst.pas',
  kbmMWZipStdTransStream in 'C:\Comp\kbmMW25\Source\kbmMWZipStdTransStream.pas',
  ncVersionInfo in '..\Comp\ncVersionInfo.pas',
  ncShellStart in '..\Comp\ncShellStart.pas',
  ncgFormBase in 'ncgFormBase.pas' {FormBaseGuard},
  ncNXServRemoto in '..\Comp\ncNXServRemoto.pas',
  ncgRemoveRestr in 'ncgRemoveRestr.pas' {FrmRemoveRestr};

{$R *.RES}

var
  shutdownFlags : Cardinal;
  MutexH : THandle;
  buffer : String;
  JaAbriu : Boolean;
  S, S2: String;

{ HackClass }

procedure KillExplorer;
var 
  I : Integer;
  WL : TWinList;
begin
  WL := TWinList.Create(nil);
  try
    WL.Refresh(True);
    for I := 0 to pred(WL.Count) do with WL.Windows[I]^ do
      if SameText('EXPLORER.EXE', ExtractFileName(FName)) then begin
        FechaProc(ProcessID);
        Exit;
      end;
  except
  end;
  
  try
    WL.Free;
  except
  end;
end;


procedure ApagaDir(str: String);
var 
  sr: TSearchRec;
  T: Cardinal;
begin
  try
    if FindFirst(str+'\*.*', faAnyFile, sr) = 0 then
    try
      repeat
        if (sr.name<>'.') and (sr.name<>'..') then
        if (sr.Attr = faDirectory) then 
          ApagaDir(str+'\'+sr.Name) 
        else begin
          T := GetTickCount;
          repeat
          until DeleteFile(pchar(str+'\'+sr.Name)) or ((GetTickCount-T)>15000);
        end;  
      until FindNext(sr) <> 0;
    finally  
      sysutils.FindClose(sr);
    end;
    rmdir(str);
  except
  end;  
end;

procedure AjustaAtalhos;
var 
  str: String;
  sc : TstShortCut;
begin
  sc := TstShortCut.Create(nil);
  try
    sc.AutoName := False;
    sc.FileName := ParamStr(0);
    sc.StartInDir := ExtractFileDir(ParamStr(0));
    sc.SpecialFolder := sfCommonPrograms;
    sc.MakePath(str);
    SetFileAttributes(pchar(str+'Cyber-Manager'), FILE_ATTRIBUTE_NORMAL);
    ApagaDir(str+'Cyber-Manager');
    Mkdir(str+'NexCafé');
    sc.Description := 'NexCafé\NexCafé NexGuard';
    sc.CreateShortcut;

    sc.SpecialFolder := sfDesktop;
    sc.MakePath(str);
    str := str+'Cyber Manager CM-Guard.lnk';
    if FileExists(str) then begin
      SetFileAttributes(pchar(str), FILE_ATTRIBUTE_NORMAL);
      DeleteFile(pchar(str));
      sc.Description := 'NexCafé NexGuard';
      sc.CreateShortcut;
    end;  
  except
  end;
  sc.Free;
end;
  
begin

  LongTimeFormat := 'hh:mm:ss';
  HideTaskBar;
  TThreadTaskMgr.Create(False).FreeOnTerminate := True;
  
//  Application.MainFormOnTaskBar := False;
  DebugMsg('Application.Initialize');
  Application.Initialize;

  LoadConfig;
  
  JaAbriu := False;
  
  S := ExtractFilePath(ParamStr(0))+'ncguard.exe';
  if FileExists(S) then
  try
    DeleteFile(PChar(S));
  except
  end;

  S := ExtractFilePath(ParamStr(0))+'nnexguard.exe';
  if FileExists(S) then
  try
    DeleteFile(PChar(S));
  except
  end;
  

  S := ExtractFilePath(ParamStr(0))+'ncguard.ini';
  S2 := ExtractFilePath(ParamStr(0))+'nexguard.ini';
  if FileExists(S) and (not FileExists(S2)) then
    RenameFile(S, S2);

  if SameText(ParamStr(1), 'REMOVE') then begin
    with TncProtege98.Create(nil) do
    try
      AutoStart(False);
      Free;
    except 
    end;  
    ShowTaskbar;
    TFrmRemoveRestr.Create(nil).ShowModal;
    Exit;
  end;

  S := Copy(ParamStr(0), 1, 3);
  if DirectoryExists(S+'cybermgr') and 
     (not DirectoryExists(S+'cybermgr\dados')) and 
     (not FileExists(S+'cybermgr\cmserver.exe')) and 
     (not FileExists(S+'cybermgr\cmadmin.exe'))
  then begin
    Apagadir(S+'cybermgr'); 
    AjustaAtalhos;
  end;  
  
  if SameText(ParamStr(1), 'REMOVEALL') then begin
    RemoveDriverHook;
    try
      ExecFile('"'+ExtractFilePath(ParamStr(0))+'guardis.exe" REMOVER SILENT');
    except
    end;
    
    with TncProtege98.Create(nil) do
    try
      AutoStart(False);
      BloqueiaCtrlAltDel := False;
      Free;
    except
    end;
    ShowTaskbar;
    TFrmRemoveRestr.Create(nil).ShowModal;
    Exit;
  end; 

  if NoGuardIS then  
    try
      ExecFile('"'+ExtractFilePath(ParamStr(0))+'guardis.exe" REMOVER SILENT');
    except
    end;
    

  buffer := 'nexcafe_nexguard';
  MutexH := CreateMutex(nil, false, PChar(buffer));
  if MutexH<>0 then
    if GetLastError=ERROR_ALREADY_EXISTS then JaAbriu := True;
  
  Application.Title := 'NexCafé - Guard';
  if (not JaAbriu) then begin

   DebugMsg('Criando dmArqs');
    dmArqs := TdmArqs.Create(nil);
    try          
      try
        dmArqs.SalvaArqs;
        DebugMsg('CheckHookDriver');
        CheckHookDriver;
      except
      end;
    finally
      dmArqs.Free;
    end;      
  DebugMsg('Iniciar Forms...');
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TFrmRemoveRestr, FrmRemoveRestr);
  DebugMsg('Criar TFrmLogin');
  Application.CreateForm(TFrmLogin, FrmLogin);
  DebugMsg('Criar TFrmHide');
  Application.CreateForm(TFrmHide, FrmHide);
  DebugMsg('Criar TFrmPausa');
  Application.CreateForm(TFrmPausa, FrmPausa);
  DebugMsg('Criar TFrmAviso');
  Application.CreateForm(TFrmAviso, FrmAviso);
  DebugMsg('Criar TFrmConn');
  Application.CreateForm(TFrmConn, FrmConn);
  DebugMsg('Criar TFrmCreditos');
  Application.CreateForm(TFrmCreditos, FrmCreditos);
  DebugMsg('Run...');
  Application.Run;
  StopExtraProt := True;
  
    if glShutOp>-1 then begin
      DebugMsg('Shutdown ' + IntToStr(glShutOp));
      shutdownFlags := 0;
      if Win32Platform=VER_PLATFORM_WIN32_NT then begin
        shutdownFlags := EWX_FORCE;
        DebugMsg('EWX_FORCE');
      end;
      case glShutOp of
        1 : begin
          shutdownFlags := shutdownFlags + EWX_REBOOT;
          DebugMsg('EWX_REBOOT');
        end;
        2 : 
        if shutdownFlags=EWX_FORCE then begin
          shutdownFlags := EWX_FORCE + EWX_POWEROFF;
          DebugMsg('EWX_POWEROFF');
          KillExplorer;
        end else begin
          shutdownFlags := EWX_SHUTDOWN;
          DebugMsg('EWX_SHUTDOWN');
        end;
      end;
      Desliga(shutdownFlags);
    end else
    if Win32Platform=VER_PLATFORM_WIN32_NT then 
      KillExplorer;
  end;
end.
