program NexGuardDesp;

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
  madKernel,
  dwlDesktop in 'C:\Comp\dwl\source-code\dwlginaSource\dwlDesktop.pas' {,
  ncDosCmd in '..\Comp\ncDosCmd.pas'},
  ncgFrmPri in 'ncgFrmPri.pas' {FrmPri},
  ncgFrmLogin in 'ncgFrmLogin.pas' {FrmLogin},
  ncgFrmPausa in 'ncgFrmPausa.pas' {FrmPausa},
  ncgFrmConta in 'ncgFrmConta.pas' {FrmConta},
  ncgFrmAtualiza in 'ncgFrmAtualiza.pas' {FrmAtualiza},
  ncgFrmConfigDesktop in 'ncgFrmConfigDesktop.pas' {FrmDesktop},
  ncgFrmFake in 'ncgFrmFake.pas' {FrmFake},
  ncgLVBack in 'ncgLVBack.pas',
  ncProtecao98 in 'ncProtecao98.pas',
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
  ncVersionInfo in '..\Comp\ncVersionInfo.pas',
  ncShellStart in '..\Comp\ncShellStart.pas',
  ncgFormBase in 'ncgFormBase.pas' {FormBaseGuard},
  ncNXServRemoto in '..\Comp\ncNXServRemoto.pas',
  ncgRemoveRestr in 'ncgRemoveRestr.pas' {FrmRemoveRestr},
  ncgFrmShellFilter in 'ncgFrmShellFilter.pas' {FrmShellFilter},
  ncgShell in 'ncgShell.pas',
  ncAcessoRemoto in '..\AcessoRemoto\ncAcessoRemoto.pas',
  ncFrmShade in 'ncFrmShade.pas' {FrmShade},
  ncJob in '..\Comp\ncJob.pas',
  ncgClassicMenu in 'ncgClassicMenu.pas',
  ncgAppBar in 'ncgAppBar.pas',
  ncgFrmBasePanelTop in 'ncgFrmBasePanelTop.pas' {FrmBaseTop},
  ncgFrmPanPremium in 'ncgFrmPanPremium.pas' {FrmPanPremium},
  ncgFrmPanFree in 'ncgFrmPanFree.pas' {FrmPanFree},
  ncFrmImp in 'ncFrmImp.pas' {FrmImp},
  ncFrmMsgCli in 'ncFrmMsgCli.pas' {FrmMsgCli},
  ncMsgCli in '..\Comp\ncMsgCli.pas',
  ncNetMsg in '..\Comp\ncNetMsg.pas',
  cadVersionInfo in '..\..\CAD\comp\cadVersionInfo.pas',
  ncgFrmTop in 'ncgFrmTop.pas' {FrmTopB},
  VCLFixPack in '..\Comp\VCLFixPack.pas',
  ncgFrmAviso in 'ncgFrmAviso.pas' {FrmAviso},
  ncAppUrlLog in '..\Comp\ncAppUrlLog.pas',
  ElevationUtils in '..\Utils\ElevationUtils.pas',
  ncgFrmYAD in 'ncgFrmYAD.pas' {FrmYAD},
  ncgLimiteTela in 'ncgLimiteTela.pas',
  ncDosCmd in '..\Comp\ncDosCmd.pas',
  md5 in '..\..\gs\md5.pas',
  ncgPrevLogoff in 'ncgPrevLogoff.pas',
  ncCommPlusIndy in '..\Comp\ncCommPlusIndy.pas';

{$R *.RES}
{$R NexGuardmanifest.res NexGuardmanifest.rc}



var
  shutdownFlags : Cardinal;
  MutexH : THandle;
  buffer : String;
  JaAbriu : Boolean;
  S, S2: String;

{ HackClass }

procedure DisableUAC;
begin
  if IsUACEnabled then
    ShellStartCustom('cmd.exe', '/c %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f', '%windir%\System32\', 0, 1, 'runas');
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
    ChangeShellData(False, False);
  
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
    ChangeShellData(False, False);
    TncProtege98.NexCafe_Installed(False);
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
  end else
    TncProtege98.NexCafe_Installed(True); 

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
//    InstallMoz;

   DisableUAC;

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
  Application.CreateForm(TFrmImp, FrmImp);
  Application.CreateForm(TFrmMsgCli, FrmMsgCli);
  Application.CreateForm(TFrmAviso, FrmAviso);
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
  
  if glShutOp in [operLogoff, operShutdown, operReboot] then begin
    case glShutOp of
      operLogoff : DebugMsg('Logoff');
      operShutDown : DebugMsg('Shutdown');
      operReboot : DebugMsg('Reboot');  
    end;
    DebugMsg('Shutdown ' + IntToStr(glShutOp));
    shutdownFlags := 0;
    if Win32Platform=VER_PLATFORM_WIN32_NT then begin
      if glShutOp=operShutdown then
        shutdownFlags := EWX_Force + EWX_POWEROFF else
        shutdownFlags := EWX_FORCE + glShutOP;
      DebugMsg('EWX_FORCE');
    end else
      shutdownFlags := glShutOp;
        
    Desliga(shutdownFlags);
  end else
  if (not DontKillExplorer) and (Win32Platform=VER_PLATFORM_WIN32_NT) then begin
    ChangeShellData(False, False);
    KillExplorer;
  end;  
  end;
end.
