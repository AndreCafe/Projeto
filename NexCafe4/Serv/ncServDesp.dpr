program ncServDesp;

uses
  nxReplacementMemoryManager,
  nxReplacementMove,
  Forms,
  SysUtils,
  nxseAllEngines,
  Registry,
  ncJob in '..\Comp\ncJob.pas',
  ncPrintMon in '..\Comp\ncPrintMon.pas',
  ncsFrmBackup in 'ncsFrmBackup.pas' {FrmCopia},
  ncsFrmLogin in 'ncsFrmLogin.pas' {FrmLogin},
  ncsFrmPri in 'ncsFrmPri.pas' {frmPri},
  ncAuxPassaporte in '..\Comp\ncAuxPassaporte.pas',
  ncClassesBase in '..\Comp\ncClassesBase.pas',
  ncMsgCom in '..\Comp\ncMsgCom.pas',
  ncServAtualizaLic in '..\Comp\ncServAtualizaLic.pas' {dmAtualizaLic: TDataModule},
  ncServBase in '..\Comp\ncServBase.pas',
  ncServBD in '..\Comp\ncServBD.pas' {dmServidorBD: TDataModule},
  ncTarifador in '..\Comp\ncTarifador.pas',
  ncTableDefs in '..\Comp\ncTableDefs.pas',
  ncTran in '..\Comp\ncTran.pas',
  ncDMServ in '..\Comp\ncDMServ.pas' {DM: TDataModule},
  ncPassaportes in '..\Comp\ncPassaportes.pas',
  ncSessao in '..\Comp\ncSessao.pas',
  ncCredTempo in '..\Comp\ncCredTempo.pas',
  ncImpressao in '..\Comp\ncImpressao.pas',
  ncDebito in '..\Comp\ncDebito.pas',
  ncDMCaixa in '..\Comp\ncDMCaixa.pas' {dmCaixa: TDataModule},
  ncErros in '..\Comp\ncErros.pas',
  ncDMEmail in '..\Comp\ncDMEmail.pas' {dmEmail: TDataModule},
  ncDMProcEmail in '..\Comp\ncDMProcEmail.pas' {dmProcEmail: TDataModule},
  ncListaEspera in '..\Comp\ncListaEspera.pas',
  ncLancExtra in '..\Comp\ncLancExtra.pas',
  ncDebTempo in '..\Comp\ncDebTempo.pas',
  ncImpCM in '..\Comp\ncImpCM.pas' {dmCM: TDataModule},
  ncVersoes in '..\Comp\ncVersoes.pas',
  uFrmDadosConta in 'uFrmDadosConta.pas' {FrmDadosConta},
  uFrmDadosReg in '..\..\GS\uFrmDadosReg.pas' {FrmDadosReg},
  uLicEXECryptor in '..\..\GS\uLicEXECryptor.pas',
  WindowList in 'C:\comp\WindowList\WindowList.pas',
  ncFrmSuporteRem in '..\Comp\ncFrmSuporteRem.pas' {FrmSuporte},
  ncIPAddr in '..\Comp\ncIPAddr.pas',
  EXECryptor in 'C:\Program Files\EXECryptor\SDK\Delphi\EXECryptor.pas',
  ncSyncLic in '..\Comp\ncSyncLic.pas',
  ncFrmProgress in '..\Comp\ncFrmProgress.pas' {FrmProg},
  ncsFrmSemRegistro in 'ncsFrmSemRegistro.pas' {FrmSemReg},
  ncsFrmRecuperaReg in 'ncsFrmRecuperaReg.pas' {FrmRecReg},
  uFrmCodLoja in '..\..\gs\uFrmCodLoja.pas' {FrmCodLoja},
  uWakeOnLan in '..\..\Utils\uWakeOnLan.pas',
  ncDMDBProc in '..\Comp\ncDMDBProc.pas' {dmDBProc: TDataModule},
  uObjPool in '..\..\Utils\uObjPool.pas',
  ncAppUrlLog in '..\Comp\ncAppUrlLog.pas',
  ncsRecalcPass in '..\Comp\ncsRecalcPass.pas' {dmRecalcPass: TDataModule},
  ncDebug in '..\Comp\ncDebug.pas',
  ncMovEst in '..\Comp\ncMovEst.pas',
  ncVersionInfo in '..\Comp\ncVersionInfo.pas',
  ncShellStart in '..\Comp\ncShellStart.pas',
  ncnxServerPlugin in '..\Comp\ncnxServerPlugin.pas',
  ncNetMsg in '..\Comp\ncNetMsg.pas',
  dmGateConnUnit in 'C:\Comp\Nexus\Portal\V3 Pro\Projects\Gateway\dmGateConnUnit.pas' {dmConn: TDataModule},
  rdServer in 'C:\Comp\Nexus\Portal\V3 Pro\Projects\Gateway\rdServer.pas' {rdServerModule: TDataModule},
  ncMsgCli in '..\Comp\ncMsgCli.pas',
  uFrmLojaNex in 'uFrmLojaNex.pas' {FrmLojaNex},
  uRSAss in '..\..\GS\uRSAss.pas',
  uFrmSenhaConta in 'uFrmSenhaConta.pas' {FrmSenhaConta},
  uFrmAlteraSenhaConta in 'uFrmAlteraSenhaConta.pas' {FrmAlteraSenhaConta},
  uFrmCompra in 'uFrmCompra.pas' {FrmCompra},
  uDMBol in 'uDMBol.pas' {dmBol: TDataModule},
  uFrmConsultaBoletos in 'uFrmConsultaBoletos.pas' {FrmConsultaBol},
  Windows,
  Dialogs,
  ShellApi,
  madKernel,
  uFrmContaCriada in 'uFrmContaCriada.pas' {FrmContaCriada},
  ElevationUtils in '..\Utils\ElevationUtils.pas',
  ncExeUnico in '..\Utils\ncExeUnico.pas',
  ncsDMCrypt in 'ncsDMCrypt.pas' {dmCrypt: TDataModule},
  nxtwWinsockTransport in 'C:\Comp\NexusDB3\nxtwWinsockTransport.pas',
  nxptBasePooledTransport in 'C:\Comp\NexusDB3\nxptBasePooledTransport.pas';
  
{$R *.res}


function RunAsAdmin(hWnd: HWND; filename: string; Parameters: string): Boolean;
{
    See Step 3: Redesign for UAC Compatibility (UAC)
    http://msdn.microsoft.com/en-us/library/bb756922.aspx
}
var
    sei: TShellExecuteInfo;
begin
    ZeroMemory(@sei, SizeOf(sei));
    sei.cbSize := SizeOf(TShellExecuteInfo);
    sei.Wnd := hwnd;
    sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
    sei.lpVerb := PChar('runas');
    sei.lpFile := PChar(Filename); // PAnsiChar;
    if parameters <> '' then
        sei.lpParameters := PChar(parameters); // PAnsiChar;
    sei.nShow := SW_SHOWNORMAL; //Integer;

    Result := ShellExecuteEx(@sei);
end;

procedure TermThreads;
var 
  Tick: Cardinal;
  T: IThreads;
begin
  T := CurrentProcess.Threads;
  Tick := GetTickCount+2000;
  while (GetTickCount<Tick) and (T.ItemCount>1) do begin
    Sleep(5);
    T.RefreshItems;
  end;
  T.RefreshItems;
  if T.ItemCount>0 then 
    CurrentProcess.Terminate;
end;

begin
  Application.Initialize;
  if (not SameText('NOELEV', ParamStr(1))) and (IsUACEnabled) and (not IsElevated) then begin 
    if (ParamStr(1)='ELEV') then begin
      ShowMessage('O servidor NexCafé NexServ só pode ser executado com usuário que tenha direito de Administrador no Windows.');
      Exit;
    end else
      RunAsAdmin(0, ParamStr(0), 'ELEV');
  end else begin    
    InitExeUnico;
    Application.Title := 'NexCafé - Servidor';
    NomeArqDebug := 'DebugNexServ.txt';
    if ExeJaExiste then
      ShowMessage('Já existe um servidor NexCafé sendo executado!')
    else begin
      ExtractEmailDlls;
      Application.CreateForm(TfrmPri, frmPri);
      Application.CreateForm(TdmBol, dmBol);
      Application.Run;
    end;
  end;
end.
