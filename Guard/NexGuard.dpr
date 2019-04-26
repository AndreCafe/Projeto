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
  ncIPAddr in '..\Comp\ncIPAddr.pas',
  ncFirewall in '..\Comp\ncFirewall.pas',
  ncgConnMgr in 'ncgConnMgr.pas',
  ncgPrintInstall in 'ncgPrintInstall.pas',
  ncFrmPrintReview in '..\PrintReview\ncFrmPrintReview.pas' {FrmPrintReview},
  ncTipoImp in '..\Comp\ncTipoImp.pas',
  uFrmComSombra in '..\..\Utils\uFrmComSombra.pas' {FrmComSombra},
  ncPRFrmPrintTipo in '..\PrintReview\ncPRFrmPrintTipo.pas' {FrmPrintTipo},
  ncImgImp in '..\Comp\ncImgImp.pas' {dmImgImp: TDataModule},
  ncPRBaseClasses in '..\PrintReview\ncPRBaseClasses.pas',
  ncPRImagesScrollBox in '..\PrintReview\ncPRImagesScrollBox.pas',
  ncPRPagesScrollBox in '..\PrintReview\ncPRPagesScrollBox.pas',
  ncPRThumbsScrollBox in '..\PrintReview\ncPRThumbsScrollBox.pas',
  ncPRConsts in '..\PrintReview\ncPRConsts.pas',
  ncPRTransfer in '..\PrintReview\ncPRTransfer.pas',
  ncgFrmPTProgress in 'ncgFrmPTProgress.pas' {FrmPTProgress},
  ncgFrmPanMsg in 'ncgFrmPanMsg.pas' {FrmPanMsg},
  ncgFrmFST in 'ncgFrmFST.pas' {FrmFST},
  ncThreadedDownload in '..\Comp\ncThreadedDownload.pas',
  ncgBackupPrinters in 'ncgBackupPrinters.pas',
  uPrinterInfo8 in '__PrintComum\uPrinterInfo8.pas',
  uPrintException in '__PrintComum\uPrintException.pas',
  uPrinterConstsAndTypes in '__PrintComum\uPrinterConstsAndTypes.pas',
  uCommonProc in '__PrintComum\uCommonProc.pas',
  ncgWatch in 'ncgWatch.pas',
  ncPRImagem in '..\printreview\ncPRImagem.pas',
  ncSyncLic in '..\comp\ncSyncLic.pas',
  ncTran in '..\comp\ncTran.pas',
  ncEspecie in '..\comp\ncEspecie.pas',
  ncPrintDoc in '..\comp\ncPrintDoc.pas',
  ncListaID in '..\comp\ncListaID.pas',
  Automation in '..\comp\Automation.pas',
  ncBrowserUtils in '..\comp\ncBrowserUtils.pas',
  ncCheckWin64 in '..\comp\ncCheckWin64.pas',
  ncChromeUtils in '..\comp\ncChromeUtils.pas',
  ncChromeExt in '..\comp\ncChromeExt.pas' {dmChromeExt: TDataModule},
  ncWBFrameExecScript in '..\comp\ncWBFrameExecScript.pas',
  ncFrmWebPopup in '..\comp\ncFrmWebPopup.pas' {FrmWebPopup},
  ncFrmDownSup in '..\comp\ncFrmDownSup.pas' {FrmDownSup},
  ncExpandArea in '..\comp\ncExpandArea.pas' {ncFrmExpandArea},
  ncToken in '..\comp\ncToken.pas',
  ncHttp in '..\comp\ncHttp.pas',
  uNR_chaveseg in '..\..\gs\uNR_chaveseg.pas',
  ncPRFrmEtapas in '..\printreview\ncPRFrmEtapas.pas' {FrmPREtapas},
  ncDeleteFiles in '..\comp\ncDeleteFiles.pas',
  ncDirUtils in '..\comp\ncDirUtils.pas',
  ncPrinterInfo8 in '..\comp\ncPrinterInfo8.pas',
  ncPrinterConstsAndTypes in '..\comp\ncPrinterConstsAndTypes.pas',
  ncPrintException in '..\comp\ncPrintException.pas',
  ncCommonProc in '..\comp\ncCommonProc.pas',
  ncgFrmExpTBY in 'ncgFrmExpTBY.pas' {FrmExpTBY},
  ncgFrmExpYAD in 'ncgFrmExpYAD.pas' {FrmExpYAD},
  nexUrls in '..\..\nxUrl\nexUrls.pas',
  ncgWebApi in 'ncgWebApi.pas',
  ncBaseWebApi in '..\comp\ncBaseWebApi.pas';

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
    DebugMsg('NexGuard Main 1 - Before ChangeShellData');
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
    DebugMsg('NexGuard Main 2 - Before ChangeShellData');
    try RemovePrinters(True); except end;
    try RestorePrinters; except end;
    try ChangeShellData(False, False); except end;
    try TncProtege98.NexCafe_Installed(False); except end;
    try RemoveDriverHook; except end;
    
    try
      ExecFile('"'+ExtractFilePath(ParamStr(0))+'guardis.exe" REMOVER SILENT');
    except
    end;

    try
      ExecFile('"'+ExtractFilePath(ParamStr(0))+'wguard.exe" REMOVER SILENT');
    except
    end; 

    try KeepMeClosed except end;   
    
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
    KeepMeRunning;

    DebugMsg('Criando dmArqs');
    dmArqs := TdmArqs.Create(nil);
    DebugMsg('Salvando dmArqs');
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
  Application.CreateForm(TdmImgImp, dmImgImp);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.CreateForm(TFrmPanMsg, FrmPanMsg);
  Application.CreateForm(TFrmFST, FrmFST);
  FrmPTProgress_Parent := FrmPri.Handle;
  
  Application.CreateForm(TFrmImp, FrmImp);
  Application.CreateForm(TFrmMsgCli, FrmMsgCli);
  Application.CreateForm(TFrmAviso, FrmAviso);
  Application.CreateForm(TFrmPrintReview, FrmPrintReview);
  Application.CreateForm(TFrmPTProgress, FrmPTProgress);
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
  FrmPanMsg.Init(FrmFST);
  FrmFST.AddForm(FrmLogin, FrmLogin.panPri);
  FrmFST.AddForm(FrmConn, FrmConn.panPri);
  FrmFST.AddForm(FrmPausa, FrmPausa.panPri);
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
    DebugMsg('NexGuard Main 3 - Before ChangeShellData');
    ChangeShellData(False, False);
    KillExplorer;
  end;  
  end;
end.
