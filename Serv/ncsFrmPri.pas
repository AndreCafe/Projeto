unit ncsFrmPri;

interface   

{$I NEX.Inc}    

uses                 
  Windows, dxCore, Messages, dxBar, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LMDCustomComponent, LMDWndProcComponent, StdCtrls,
  ExtCtrls, LMDControl, Variants, Winsock,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, Menus, lmdcont, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomStatusBar, LMDStatusBar,
  LMDIniCtrl, ncClassesBase, ncServBase, jpeg,
  LMDCustomLabel, LMDLabel, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxLabel, cxButtons, cxPC, cxStyles, cxGraphics, cxMaskEdit,
  cxMemo, cxVGrid, cxInplaceContainer, cxSpinEdit, cxRadioGroup, 
  nxllComponent, nxdb, nxdbBackupController, Buttons, 
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, kbmMemTable,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxButtonEdit, ImgList, cxTextEdit,
  cxDropDownEdit, cxCalendar, cxGridStrs, cxGroupBox,
  ncsFrmBackup, ShellApi, LMDSysInfo, AppEvnts,
  cxCheckBox, LMDDockSpeedButton, dmGateConnUnit, rdServer, 
  LMDTrayIcon, LMDBaseController, LMDCustomContainer, LMDGenericList,
  cxLookAndFeels, OleServer, ActiveX, cxHyperLinkEdit,
  cxPCdxBarPopupMenu,
  dxNavBarCollns, dxNavBarBase, dxNavBar, PngImage, LMDPNGImage,
  dxBarBuiltInMenu, cxNavigator, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TfrmPri = class(TForm)
    ImageErro: TImage;
    ImageOk: TImage;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    Timer2: TTimer;
    btnFechar: TcxButton;
    btnMinimizar: TcxButton;
    TimerTick: TTimer;
    cxStyleRepository1: TcxStyleRepository;
    cxsNegrito: TcxStyle;
    cxsAmarelo: TcxStyle;
    cxsVerde: TcxStyle;
    cxsVermelho: TcxStyle;
    LMDSimplePanel2: TLMDSimplePanel;
    TimerLic: TTimer;
    PopupMenu1: TPopupMenu;
    Encerrar1: TMenuItem;
    N1: TMenuItem;
    Minimizar1: TMenuItem;
    Abrir1: TMenuItem;
    LMDSimplePanel6: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    Paginas: TcxPageControl;
    tsBD: TcxTabSheet;
    tsAssistencia: TcxTabSheet;
    SysInfo: TLMDSysInfo;
    panBD: TLMDSimplePanel;
    LMDSimplePanel9: TLMDSimplePanel;
    Image3: TImage;
    cxLabel11: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel12: TcxLabel;
    LMDDockSpeedButton1: TLMDDockSpeedButton;
    cxLabel3: TcxLabel;
    edPasta: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edNomeComp: TcxTextEdit;
    edIPs: TcxMemo;
    cxPageControl1: TcxPageControl;
    cxLabel19: TcxLabel;
    edCodEquip: TcxTextEdit;
    lbErroDB: TcxLabel;
    LMDSimplePanel10: TLMDSimplePanel;
    lbVersao: TcxLabel;
    lbFree: TcxLabel;
    pmConta: TPopupMenu;
    Criarumanovaconta1: TMenuItem;
    Editarosdadosdessaconta1: TMenuItem;
    Alterarasenhadaminhaconta1: TMenuItem;
    UsaroutracontaNexCaf1: TMenuItem;
    N4: TMenuItem;
    pmAnt: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    Tray: TLMDTrayIcon;
    genList: TLMDGenericList;
    SB: TdxNavBar;
    dxNavBarItem1: TdxNavBarItem;
    dxNavBarItem2: TdxNavBarItem;
    dxNavBarItem3: TdxNavBarItem;
    dxNavBarGroup1: TdxNavBarGroup;
    Timer3: TTimer;
    imgNavBar: TcxImageList;
    pgLogo: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    ImageIconeGrande: TImage;
    Image1: TImage;
    btnAssistenciaRemota: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure TrayDblClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure TimerTickTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerLicTimer(Sender: TObject);
    procedure TrayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure SBChangeSelectedItem(Sender: TObject);
    procedure imBDClick(Sender: TObject);
    procedure imRegistroClick(Sender: TObject);
    procedure btnAssistenciaRemotaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LMDDockSpeedButton1Click(Sender: TObject);
    procedure ImageIconeGrandeDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure SBLinkPress(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure Timer3Timer(Sender: TObject);
    procedure lbVersaoClick(Sender: TObject);
  private
    { Private declarations }
    FInicio : Cardinal;
    FPrimeiro : Boolean;
    FVerPri : Word;
    FSL : TStrings;

    procedure AtualizaDadosComp;
    
    procedure VeSePode(S: String);
    procedure RetiraReadOnly;
    procedure SetVerPri(const Value: Word);
    
    procedure WMQueryEndSession(var Msg: TMessage);
      message WM_QUERYENDSESSION;

    procedure WMEndSession(var Msg: TMessage);
      message WM_ENDSESSION;

    procedure WMDadosLicenca(var Msg: TMessage);
      message WM_User + 1;  

    procedure WMParPub(var Msg: TMessage);
      message WM_User + 2; 

    procedure wmabreserv(var Msg: TMessage);
      message wm_user + 3;  

    procedure wminiciar(var Msg: TMessage);
      message wm_user + 5;  

    function VersaoStr: String; 

    function VersaoCompleta: String; 

    procedure On_Error(const s:string);

  public
    Serv : TncServidor;
    SRV:TrdServerModule;
    CON:TdmConn;
    FFechar: Boolean;
    
    procedure DadosLicenca;

    procedure FreeCaption(S: String);
    
    procedure Ativar;   
    procedure Desativar;

    procedure AbreMostra(aOp: Integer);
  
    procedure AjustaIconeTray;
    procedure RecriaTray;
    property VerPri: Word
      read FVerPri write SetVerPri;
    { Public declarations }
  end;

var
  frmPri: TfrmPri = nil;
  hndFrmPri : HWND;

  MessageID: Integer;
  

implementation

uses 
  uLicExeCryptor, 
  ncIDRecursos, 
  ncsFrmLogin,
  ncVersoes, 
  ncServAtualizaLic_Indy, 
  ncFrmSuporteRem, ncIPAddr, ncSyncLic, ncDebug,
  ncVersionInfo, ncShellStart, ncFrmProgress, 
  ncPrintMon, ncMsgCom, ncJob, ncFirewall;

const
  SegMS = 1000;
  MinMS = SegMS * 60;
  HorMS = MinMS * 60;
  DiaMS = HorMS * 24;
  TempoLic = 10000;

{$R *.DFM}

function ForceForegroundWindow(hwnd: THandle): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID : DWORD;
  timeout : DWORD;
begin
  DebugMsg('ForceForeGround Window');
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);
  if GetForegroundWindow = hwnd then 
    Result := true
  else begin

  // Windows 98/2000 doesn't want to foreground a window when some other
  // window has keyboard focus
  
    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
        ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
        ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
        (Win32MinorVersion > 0)))) then
    begin
  
  // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
  // Converted to Delphi by Ray Lischner
  // Published in The Delphi Magazine 55, page 16
  
      Result := false;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow,nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd,nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, true) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, false);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then begin
  // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),  SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0,
        TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;
  
    Result := (GetForegroundWindow = hwnd);
  end;
end; { ForceForegroundWindow }


procedure TfrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (not FFechar) and Tray.Active then begin
    Action := caNone;
    PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
  end else 
    Desativar;
end;

procedure TfrmPri.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FFechar;
end;

procedure TfrmPri.btnFecharClick(Sender: TObject);
begin
  FFechar := True;
  VeSePode('Encerrar Servidor');
end;

procedure TfrmPri.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;                 
end;

function WinExecAndWait32(FileName: string; Visibility: Integer; aWait: Boolean): Longword;
var { by Pat Ritchey }
  zAppName: array[0..512] of Char;
  zCurDir: array[0..255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb          := SizeOf(StartupInfo);
  StartupInfo.dwFlags     := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil,
    zAppName, // pointer to command line string
    nil, // pointer to process security attributes
    nil, // pointer to thread security attributes
    False, // handle inheritance flag
    CREATE_NEW_CONSOLE or // creation flags
    NORMAL_PRIORITY_CLASS,
    nil, //pointer to new environment block
    nil, // pointer to current directory name
    StartupInfo, // pointer to STARTUPINFO
    ProcessInfo) // pointer to PROCESS_INF
    then Result := WAIT_FAILED
  else
  begin
    if aWait then begin
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      GetExitCodeProcess(ProcessInfo.hProcess, Result);
    end;
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
end; 

function INIFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'nexserv.ini';
  DeleteFile(ExtractFilePath(ParamStr(0))+'ncserv.ini');
end;

function SoDig(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

procedure TfrmPri.FormCreate(Sender: TObject);
var S: String;
begin
  handleFrmPri := Handle;
  FSL := TStringList.Create;
  if FileExists(IniFName) then begin
    FSL.LoadFromFile(IniFName);
    SendAutoConnInfo := not SameText(FSL.Values['SendAutoConnInfo'], 'N');
  end else begin
    FSL.Values['DesativaAutoServ'] := 'N';
    FSL.SaveToFile(IniFName);
  end;

  if SameText(FSL.Values['Debug'], 'S') then begin
    DebugAtivo := True;
    lbVersao.Style.BorderColor := clBlack;
    lbVersao.Style.TextColor := clBlack;
  end;
  
  DebugMsg('TfrmPri.FrmCreate - 1');
  MessageID := RegisterWindowMessage('TaskbarCreated');

  FreeCaption('');
  Paginas.ActivePageIndex := 0;
  
  Serv := TncServidor.Create(Self);

  DebugMsg('TfrmPri.FrmCreate - 2');
  
  ncFrmProgress.FormPri := Self;

  CON:=TdmConn.Create(nil);
  CON.AutoSyncEvents:=True;
  CON.OnError:=On_Error;

  DebugMsg('TfrmPri.FrmCreate - 3');
  

  SRV:=TrdServerModule.Create(nil);
  SRV.AutoSyncEvents:=True;
  SRV.ServerModule.Server:=CON.HttpServer;
  // Time after which the request should return even if no data.
  SRV.ResponseTimeout:=20000;
  SRV.ServerModule.ModuleFileName:='/$rdgate';

  DebugMsg('TfrmPri.FrmCreate - 4');
  
  
  FPrimeiro := True;
  NomeCompServ := SysInfo.Computername;
  RegistroGlobal.LeArqPadrao(True);

  DebugMsg('TfrmPri.FrmCreate - 5');
  
  gConfig.Conta := RegistroGlobal.Conta;

  DebugMsg('TfrmPri.FrmCreate - 6');
  edPasta.Text    := ExtractFileDir(ParamStr(0));
  DebugMsg('TfrmPri.FrmCreate - 7');
  edCodEquip.Text := RegistroGlobal.GetCodEquip(RegistroGlobal.GetSerialHD);
  DebugMsg('TfrmPri.FrmCreate - 8');
  gConfig.CodEquip := edCodEquip.Text;
  DebugMsg('TfrmPri.FrmCreate - 9');
  gConfig.FreePremium := False;
  DebugMsg('TfrmPri.FrmCreate - 10');
  gConfig.AssinaturaVenceEm := 0;
  gConfig.DataLic := 0;
  gConfig.DVA := 0;
  gConfig.PreLib := False;
  DebugMsg('TfrmPri.FrmCreate - 11');
  gConfig.Conta := RegistroGlobal.Conta;
  DebugMsg('TfrmPri.FrmCreate - 12');
  gConfig.VerPri := Versoes.Versao;
  DebugMsg('TfrmPri.FrmCreate - 13');
  
  
  S := ExtractFilePath(ParamStr(0))+'ncserv.exe';
  if FileExists(S) then
    DeleteFile(S);

  S := ExtractFilePath(ParamStr(0))+'atualiza\ncguard.exe';
  if FileExists(S) then
    DeleteFile(S);

  PreferTotalPages := SameText(FSL.Values['TotalPages'], 'S');
  CorrigeImp := StrToIntDef(FSL.Values['CorrigeImp'], 1);
  if (CorrigeImp<1) or (CorrigeImp>100) then
    CorrigeImp := 1;

  DebugMsg('TfrmPri.FrmCreate - 14');
  
  RetiraReadOnly;
  FrmCopia := TFrmCopia.Create(Self);
  FrmCopia.panPri.Parent := panBD;
  SB.Groups[0].SelectedLinkIndex := 0;
  FrmCopia.Paginas.ActivePageIndex := 0;
  
  VerProg := SelfVersion;
  FVerPri := 0;
  VerPri := StrToIntDef(Copy(SoDig(SelfVersion), 1, 3), 0); 
  FInicio := GetTickCount;

  DebugMsg('TfrmPri.FrmCreate - 15 - FIM');
end;

procedure TfrmPri.TrayDblClick(Sender: TObject);
begin
  Application.Restore;
  Application.BringToFront;
  Visible := True;
  ForceForegroundWindow(Handle);
end;

procedure TfrmPri.TrayMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
    TrayDblClick(nil);
end;

procedure TfrmPri.LMDDockSpeedButton1Click(Sender: TObject);
begin
  ShellStart(edPasta.Text);
end;

procedure TfrmPri.On_Error(const s: string);
begin
  DebugMsg('ERRO Remote Control: '+s);
end;

function TfrmPri.VersaoCompleta: String;
begin
  Result := IntToStr(FVerPri);
  Result := nomeprog + ' ' + Result[1] + '.' + Result[2] + '.' + Result[3] + Copy(SelfVersion, 6, 20);
end;

function TfrmPri.VersaoStr: String;
begin
  Result := prefixo_versao+Copy(SelfVersion, 7, 20);
end;

procedure TfrmPri.VeSePode(S: String);
var I : Integer;
begin
  if Serv.Ativo then begin
    I := TFrmLogin.Create(nil).PodeFechar(not Serv.TodosPerm(daMaqFecharCMServer), S);
    DebugMsg('TFrmPri.VeSePode 1');
    if I<0 then FFechar := False;
    if I=1 then begin
      DebugMsg('TFrmPri.VeSePode 2');
      Serv.Lock;
      try
        Serv.ShutdownMaq(0, 2);
      finally
        Serv.Unlock;
      end;
      DebugMsg('TFrmPri.VeSePode 3');
    end;
  end;
  Timer2.Enabled := (not Serv.Ativo) or (I>=0);
end;

procedure TfrmPri.wmabreserv(var Msg: TMessage);
begin
  TrayDblClick(nil);
end;

procedure TfrmPri.wmParPub(var Msg: TMessage);
var P : TmsgPubPar;
begin
  P := TmsgPubPar(Msg.WParam);
  try
    Serv.Lock;
    try
      if Serv.Ativo then
        Serv.AtualizaPubPar(P);
    finally
      Serv.Unlock;
    end;
  finally
    P.Free;
  end;
end;

procedure TfrmPri.WMDadosLicenca(var Msg: TMessage);
begin
  DadosLicenca;
end;

procedure TfrmPri.WMEndSession(var Msg: TMessage);
begin
  DebugMsg('WMEndSession 1');
//  if TWMEndSession(Msg).EndSession then begin
    FFechar := True;
    DebugMsg('WMEndSession 2');
    Close;
//  end;
end;


procedure TfrmPri.wminiciar(var Msg: TMessage);
begin
  try
    if not Serv.Ativo then Ativar;
  finally
    DadosLicenca;
  end;

  Tray.Active := True;

  if Serv.Ativo then begin
    TrayDblClick(nil);
    PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
    if SameText(ParamStr(1), 'afterinst') or SameText(ParamStr(2), 'afterinst') then begin
      ShellStart('http://www.nexcafe.com.br/download/bem-vindo');
      Sleep(1000);
      
      WinExecAndWait32(ExtractFilePath(ParamStr(0))+'NexAdmin.exe afterinst', SW_SHOWNORMAL, False);
    end;
  end;
end;

procedure TfrmPri.WMQueryEndSession(var Msg: TMessage);
begin
  Msg.Result := Integer(True);
  TWMQUERYEndSession(Msg).Result := Integer(True);
  FFechar := True;
  Close;
  DebugMsg('WMQueryEndSession');
end;

procedure TfrmPri.Timer2Timer(Sender: TObject);
begin
  DebugMsg('TFrmPri.Timer2Timer - 1');
  if InFrmProgress then Exit;
  DebugMsg('TFrmPri.Timer2Timer - 2');

  Timer2.Enabled := False;
  if FFechar then begin
    DebugMsg('TFrmPri.Timer2Timer - 3');
    Tray.Active := False;
    DebugMsg('TFrmPri.Timer2Timer - 4');
    Close;
    DebugMsg('TFrmPri.Timer2Timer - 5');
  end else begin
    DebugMsg('TFrmPri.Timer2Timer - 6');
    Desativar;
    DebugMsg('TFrmPri.Timer2Timer - 7');
  end;
end;

procedure TfrmPri.Timer3Timer(Sender: TObject);
begin
  Timer3.Enabled := False;
  try
    try
      AtualizaDadosComp;
      addApplicationToFirewall('NexCafé Servidor', ParamStr(0));
      allowexceptionsonfirewall;
    except 
    end;
  finally
    Timer3.Interval := 60000 * 3;
    Timer3.Enabled := True;
  end;
end;

procedure TfrmPri.TimerLicTimer(Sender: TObject);
begin
  if InFrmProgress then Exit;
  
  TimerLic.Enabled := False;
  TimerLic.Interval := TempoLic;
  TimerLic.Enabled := True;
  try
    DadosLicenca;
  except
  end;
end;

procedure TfrmPri.Ativar;
var
  sPath : String; 
  S: String;
begin
  try
    sPath := ExtractFilePath(ParamStr(0));
    S := sPath + 'Dados';
    if not DirectoryExists(S) then MkDir(S);

    try  
      genList[0].SaveToFile(sPath+genList[0].Description);
      genList[1].SaveToFile(sPath+genList[1].Description);
    except
    end;
      
    Serv.Ativo := True;
    CON.Connect;
  finally
    AjustaIconeTray;
  end;
end;

procedure TfrmPri.AtualizaDadosComp;
var
  IP : TLocalIPObj;
  I : Integer;
begin
  IP := TLocalIPObj.Create;
  try
    gDadosAutoconn.ComputerName := IP.HostName;
    edNomeComp.Text := IP.HostName;
    gNaoPausar.SetEsteComp(IP.HostName);
    edIPS.Lines.Text := '';
    for I := 0 to IP.IPCount-1 do
      edIPs.Lines.Add(IP.GetIPFromList(I));
    gDadosAutoconn.IPs := edIPs.Lines.Text;  
  finally
    IP.Free;
  end;
end;

procedure TfrmPri.btnMinimizarClick(Sender: TObject);
begin
  TrayDblClick(nil);
  Application.Minimize;
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfrmPri.lbVersaoClick(Sender: TObject);
begin
  ShowMessage('          '+VersaoCompleta+'          ');
end;

procedure TfrmPri.btnAssistenciaRemotaClick(Sender: TObject);
begin
  ChamaSuporte('NexServ', VersaoStr);
end;

procedure TfrmPri.TimerTickTimer(Sender: TObject);
var 
  Tempo : Cardinal;
  D, H, M, S : Word;
  St : String;
begin
  Serv.Lock;
  try
    DebugMsg('TIC-TAC');
  finally
    Serv.Unlock;
  end;
  
  if InFrmProgress then Exit;

  Tempo := GetTickCount - FInicio;
  D := Tempo div DiaMS;
  Tempo := Tempo mod DiaMS;
  H := Tempo div HorMS;
  Tempo := Tempo mod HorMS;
  M := Tempo div MinMS;
  Tempo := Tempo mod MinMS;
  S := Tempo div SegMS;
  St := '';
  if D > 0 then 
  if D > 1 then
    St := IntToStr(D) + ' dias, ' else
    St := '1 dia, ';
    
  St := St + IntToStr(H) + 'h, ' +
        IntToStr(M) + 'm, ' +
        IntToStr(S) + 's';
        
//  lbTempo.Caption := 'Tempo Execução: ' + St;
end;

procedure TfrmPri.DadosLicenca;
var 
  I, Q, T : Integer;
  Ant : Byte;
  TC : TTipoChave;
  Direito, aVenc : TDateTime;
  aCE, aSN: String;
  S : String;
  Chaves : TArrayChaveLiberacao;
  SC : TStatusConta;
begin
{$I crypt_start.inc}
  T := 0;
  Direito := EncodeDate(2050, 1, 1);
  RegistroGlobal.CodEquipSerial(aCE, aSN);
  SC := RegistroGlobal.Status;
  aVenc := 0;

//  lbBoletosPend.Visible := (RegistroGlobal.BoletosPendentes>0);

  Chaves := RegistroGlobal.CloneChaves;
  try
    if Trim(RegistroGlobal.Conta)='' then 
      SC := scSemConta else
      SC := Chaves.Status(RegistroGlobal.CodLoja, aCE, aSN, aVenc);
      
    with RegistroGlobal do
    case SC of
      scBloqueada : begin
        FreeCaption('');
        T := 0;
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scSemConta : begin
        FreeCaption('');
        S := '';
        S := S + 'N'; S := S + 'e'; S := S + 'n'; S := S + 'h'; S := S + 'u'; S := S + 'm'; S := S + 'a';
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scAtivar : begin
        FreeCaption('FREE');
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scOutroHD : begin
        FreeCaption('');
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scCybermgr : begin
        FreeCaption('');
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scTipoLicInvalida : begin
        FreeCaption('');
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      scFree, scPremium, scPremiumVenc : begin
        T := 1;
        if SC=scPremium then
          FreeCaption('PREMIUM') else
          FreeCaption('FREE');
        Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
      
      scAnt : begin
        FreeCaption('');
        for I := 0 to Chaves.Count-1 do begin
          Q := Chaves[I].ChaveValida(CodLoja, aCE, aSN, TC);
          if (Q<1) or (Q>2000) or (not (TC in [tcTemporaria, tcDefinitiva, tcTeste, tcLocacao])) then Q := 0;
          if Q > 0  then begin
            if TC=tcDefinitiva then begin
              if (Chaves[I].Vencimento<Direito) then
                Direito := Chaves[I].Vencimento;
              T := T + Q;
            end else begin
              if not Chaves[I].Venceu then begin
                T := T + Q;
                if (Chaves[I].Vencimento<Direito) then
                  Direito := Chaves[I].Vencimento;
              end;
            end;  
          end;
        end;
    
        if T > 0 then 
          Versoes.AjustaVersaoAtual(Direito) else
          Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
      end;
    end;
  finally
    Chaves.Free;
  end;
  
  Serv.Lock;
  try
    if ((T>Serv.Maquinas.Count) or 
        (gConfig.Conta <> RegistroGlobal.Conta) or 
        (gConfig.QtdLic <> T) or
        (gConfig.StatusConta <> SC) or
        (gConfig.CodEquip<>aCE)) and Serv.BDAtivo then  
      try Serv.ChecaNumMaq(T, RegistroGlobal.Conta, aCE, SC); except end;
      
    with Serv do 
    for I := 0 to Maquinas.Count-1 do with Maquinas[I] do begin
      Ant := Direito;
      AtualizaCache;
      case SC of
        scOutroHD,
        scBloqueada,
        scSemConta: Direito := dmNenhum;
        
        scAtivar, scFree, scPremiumVenc: 
        begin
          Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
          Direito := dmFree;
        end;
        
        scPremium: begin
          Direito := dmPremium;
          Versoes.AjustaVersaoAtual(EncodeDate(2050, 1, 1));
        end;
        scAnt: begin
          if T>0 then
            Direito := dmDef 
          else
          if T>-2 then
            Direito := dmParcial else
            Direito := dmNenhum;
          Dec(T);
        end;
      end;
      if Ant<>Direito then
        Notificar(tnAlteracao);
    end;
  finally
    Serv.Unlock;
  end;
  Versoes.AjustaVersaoAtual(Direito);
  VerPri := Versoes.Versao;
  if (gConfig.VerPri<>Versoes.Versao) or 
     (gConfig.Conta<>RegistroGlobal.Conta) or
     (gConfig.StatusConta<>SC) or
     (gConfig.FreePremium<>(SC in [scFree, scPremium, scPremiumVenc])) or
     (gConfig.JaFoiPremium<>RegistroGlobal.JaFoiPremium) or
     (gConfig.AssinaturaVenceEm<>aVenc) 
  then begin
    gConfig.AtualizaCache;
    gConfig.VerPri := Versoes.Versao;
    gConfig.JaFoiPremium := RegistroGlobal.JaFoiPremium or (SC=scPremiumVenc);
    gConfig.AssinaturaVenceEm := aVenc;
    gConfig.FreePremium := (SC in [scFree, scPremium, scPremiumVenc]);
    gConfig.Conta := RegistroGlobal.Conta;
    gConfig.StatusConta := SC;
    gConfig.Notificar(tnAlteracao);
  end;

{$I crypt_end.inc}
end;

procedure TfrmPri.Desativar;
begin
  DebugMsg('TfrmPri.Desativar 1');
  try
    CON.Stop;
    DebugMsg('TfrmPri.Desativar 2');
    Serv.Ativo := False;
    DebugMsg('TfrmPri.Desativar 3');
  finally
    AjustaIconeTray;
  end;
end;

procedure TfrmPri.SBChangeSelectedItem(Sender: TObject);
begin
  FrmCopia.Paginas.ActivePageIndex := SB.Groups[0].SelectedLinkIndex;
end;

procedure TfrmPri.SBLinkPress(Sender: TObject; ALink: TdxNavBarItemLink);
begin
  FrmCopia.Paginas.ActivePageIndex := ALink.Index;
end;

procedure TfrmPri.SetVerPri(const Value: Word);
begin
  if Value=FVerPri then Exit;
  FVerPri := Value;
  lbVersao.Caption := 'Versão ' + VersaoStr;
end;

procedure TfrmPri.AbreMostra(aOp: Integer);
begin
  if aOp in [0..1] then begin
    Application.Restore;
    Application.BringToFront;
    Visible := True;
    ForceForegroundWindow(Handle);
    {$IFDEF Lan}
    Paginas.ActivePageIndex := 0;
    {$ENDIF}

    {$IFDEF Loja}
    Paginas.ActivePageIndex := 1;
    {$ENDIF}
    
    
  end else 
  if aOp=10 then begin
    FFechar := True;
    Close;
  end;
end;

procedure TfrmPri.AjustaIconeTray;
begin
  if Serv.Ativo then  begin
    lbErroDB.Caption := '';
    lbErroDB.Visible := False;
  end
  else begin
    if Serv.ErroBD>'' then begin
      lbErroDB.Caption := 'Erro no banco de dados: '+'"'+Serv.ErroBD+'"';
      lbErroDB.Visible := True;
    end;
  end;
end;

procedure TfrmPri.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  Handled := False;
  if Msg.message = MessageID then begin
    RecriaTray;
    DebugMsg('TASKBAR RECREATED');
  end;
end;

procedure TfrmPri.FormDestroy(Sender: TObject);
begin
  FSL.Free;
  frmPri := nil;
end;

procedure TfrmPri.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F8 then
    btnAssistenciaRemotaClick(nil);
end;

procedure TfrmPri.FormShow(Sender: TObject);
var 
  I : Integer;
begin
  CoInitialize(nil);
  hndFrmPri := Handle;
  hndNotify := Handle;
  
  if FPrimeiro then PostMessage(Handle, wm_user+5, 0, 0);
  FPrimeiro := False;
  AtualizaDadosComp;
  {$IFDEF Lan}
  Paginas.ActivePageIndex := 0;
  {$ENDIF}
  {$IFDEF Loja}
  Paginas.ActivePageIndex := 1;
  {$ENDIF}
end;

procedure TfrmPri.FreeCaption(S: String);
begin
  lbFree.Caption := S;
  if SameText(S, 'PREMIUM') then
    lbFree.Style.TextColor := clGreen else
    lbFree.Style.TextColor := $00595959;
end;

procedure TfrmPri.ImageIconeGrandeDblClick(Sender: TObject);
begin
  DebugAtivo := not DebugAtivo;
  if not DebugAtivo then DesativaDebug;
  if DebugAtivo then begin
    lbVersao.Style.BorderColor := clBlack;
    lbVersao.Style.TextColor := clBlack;
  end else begin
    lbVersao.Style.BorderColor := $00ACACAC;
    lbVersao.Style.TextColor := $00595959;
  end;
end;

procedure TfrmPri.imBDClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := 2;
end;

procedure TfrmPri.imRegistroClick(Sender: TObject);
begin
  Paginas.ActivePageIndex := 1;
end;

procedure TfrmPri.RecriaTray;
//var A, S: Boolean;
begin
{  A := Tray.Active;
  S := Tray.ShowMinimizedIcon;
  Tray.Free;
  Tray := TLMDTrayIcon.Create(Self);
  Tray.OnClick := TrayDblClick;
  Tray.OnDblClick := TrayDblClick;
  Tray.NoClose := False;
  Tray.Hint := 'Cyber Manager - CM-Server';
  AjustaIconeTray;
  Tray.ShowMinimizedIcon := S;
  Tray.Active := A;}
//  Application.Restore;


  Tray.Active := False;
  Tray.Active := True;
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfrmPri.RetiraReadOnly;
var 
  SR : TSearchRec;
  S: String;
begin
  S := ExtractFilePath(ParamStr(0))+'dados\';
  if FindFirst(S+'*.nx1', SysUtils.faReadOnly, SR) = 0 then
  try
    repeat
      if (SR.Attr and SysUtils.faReadOnly) = SysUtils.faReadOnly then
        SetFileAttributes(Pchar(S+SR.Name), SR.Attr-SysUtils.faReadOnly);
    until FindNext(SR)<>0;
  finally
    FindClose(SR);
  end;
end;

initialization
  cxSetResourceString(@scxGridNoDataInfoText, '');


end.



