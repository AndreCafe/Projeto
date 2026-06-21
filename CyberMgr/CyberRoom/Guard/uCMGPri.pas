unit uCMGPri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmCompCliente, LMDControl, LMDBaseControl, jpeg,
  LMDBaseGraphicControl, LMDGraphicControl, LMDBaseMeter, ShellApi,
  LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, LMDClock, LMDLEDCustomLabel, LMDLEDLabel,
  ExtCtrls, Menus, cmClassesBase, cmServRemoto, 
  LMDCustomStatusBar, LMDStatusBar, cmProtecao, cmProtecao98,
  WindowList, LMDCustomSimpleLabel, LMDSimpleLabel,
  ImgList, LMDCustomComponent, LMDStarter, LMDVersionInfo, 
  madremote, madcodeHook, IniFiles, dxBarExtItems, dxBar, LMDSysInfo, ASGCapture,
  StShlCtl, StdCtrls, ComCtrls, STSHRTCT, SsBase, kbmMWCustomTransport,
  kbmMWClient, kbmMWTCPIPIndyTransport;

type
  TFrmPri = class(TForm)
    tmCronometro: TTimer;
    wlInicio: TWinList;
    WL: TWinList;
    Starter: TLMDStarter;
    VI: TLMDVersionInfo;
    SysInfo: TLMDSysInfo;
    BarMgr: TdxBarManager;
    cmEncerrar: TdxBarButton;
    cmTempo: TdxBarStatic;
    lvDesktop: TStShellListView;
    tmReconectar: TTimer;
    tmFirstConn: TTimer;
    cmNoNet: TdxBarStatic;
    TimerTaskMgr: TTimer;
    SC: TStShortcut;
    SE: TStShellEnumerator;
    mwCli: TkbmMWSimpleClient;
    mwTCPIP: TkbmMWTCPIPIndyClientTransport;
    TimerKA: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ShutQueryShutdown(Sender: TObject; var CanShutdown: Boolean);
    procedure cmEncerrarClick(Sender: TObject);
    procedure lvDesktopFilterItem(Sender: TObject; ShellItem: TStShellItem;
      var Accept: Boolean);
    procedure lvDesktopItemDblClick(Sender: TObject; Item: TStShellItem;
      var DefaultAction: Boolean);
    procedure tmReconectarTimer(Sender: TObject);
    procedure tmFirstConnTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerTaskMgrTimer(Sender: TObject);
    procedure SEEnumItem(Sender: TObject;
      ShellItem: TStShellItem; var Accept: Boolean);
    procedure mwTCPIPConnectionLost(Sender: TObject);
    procedure mwTCPIPDisconnected(Sender: TObject;
      Info: TkbmMWCustomTransportInfo);
    procedure TimerKATimer(Sender: TObject);
    procedure tmCronometroTimer(Sender: TObject);
  private
    { Private declarations }
    FStatus : Integer;
    FslDesktop : TStrings;
    FslRestr : TStrings;
    FslConfig : TStrings;
    FFundoTela : String;
    { Public declarations }
    FProgAtual: String;
    FFecharExp : Boolean;
    FMostraCron : Boolean;

    FSaveH, FSaveW : Integer;
    FEXEs    : TStrings;
    FMotivoPausa : Byte;
    FConectado : Boolean;

    procedure SetStatus(Value: Integer);
    procedure TelaLogin(Mostrar: Boolean);
    procedure TelaPausa(Mostrar: Boolean);
    procedure FechaProgramas;
    procedure FechaExplorer(Forcar: Boolean);
    procedure RefreshRestr;
    function GetMotivoPausaStr: String;
    function GetAtivo: Boolean;
    procedure SetAtivo(const Value: Boolean);
    procedure SetConectado(const Value: Boolean);
  public
    FDesligaAviso : Boolean;
    FProt         : TCMProtegeWindows;
    FMsgConn      : String;
    FInicioTicks  : Cardinal;
    FFimTicks     : Cardinal;

    procedure FecharCMGuard;
    function AchaDisplayName(S: String): TStShellItem;
    procedure Conectar(Reconexao: Boolean);
    procedure AoMinimizar(Sender: TObject);
    procedure OnSettingChange(Sender: TObject; Flag: Integer; const Section: string; var Result: Longint);
    procedure KeepAlive;
    function LojaSenhaOk(L, S: String): Boolean;
    procedure UserLogin(U: String);
    
    procedure AjustaTamanho;

    { Public declarations }
    property Status: Integer
      read FStatus write SetStatus;

    property slD: TStrings
      read FslDesktop;

    property slR: TStrings
      read FslRestr;

    property ProgAtual: String
      read FProgAtual write FProgAtual;

    property FundoTela: String
      read FFundoTela;  

    property MotivoPausaStr: String
      read GetMotivoPausaStr;  

    property MotivoPausa: Byte
      read FMotivoPausa;

    property Conectado: Boolean
      read FConectado write SetConectado;  

    property Ativo: Boolean
      read GetAtivo write SetAtivo;  
  end;

  function IniFName: String;
  function DesktopFName: String;
  function RestrFName: String;

  function ObtemEXE(S: String): String;
  function ObtemParams(S: String): String;
  function ForceForegroundWindow(hwnd: THandle): boolean;
  function StrBool(S: String): Boolean;
  function BoolStr(B: Boolean): String;
  

const
  stNaoCon    = 0;
  stPausaNoNet= 1;
  stConectado = 2;
  stConfig    = 3;
  stCliUsando = 4;
  stCliPausa  = 5;

  mpNenhum     = 0;
  mpFimCred    = 1;
  mpRedeCaiu   = 2;

  NomeQS = 'CYBERROOM';
  VersaoQS = '100';
  

  StatusStr : Array[stNaoCon..stCliPausa] of String = (
    'NaoCon', 
    'PausaNoNet',
    'Conectado',
    'Config',
    'CliUsando',
    'CliPausa');

  opFecharProg      = 'FecharProg'; 
  opReiniciar       = 'Reiniciar'; 
  opAlinhamento     = 'Alinhamento';
  opCorFundoDesktop = 'CorFundoDesktop';
  opCorFonteDesktop = 'CorFonteDesktop';
  opRestrDesktop    = 'RestrDesktop';
  opMenuIniciar     = 'MenuIniciar';
  opPainelControle  = 'PainelControle';
  opCtrlAltDel      = 'CtrlAltDel';
  opCmdExec         = 'CmdExec';
  opBloqDownload    = 'BloqDownload';
  opPaginaInicial   = 'PaginaInicial';

  CorNormal = $00C8D0D4;
  CorPisca  = clYellow;

var
  FrmPri: TFrmPri;

var
   Fechar : Boolean = False;       
   Reiniciar : Boolean = False;       
  
  Buff : Array[1..1024] of Char;  

implementation

uses Registry, uCMGPausa, uCMGLogin, uCMGConta, uCMGFrmAtualiza, 
  uCMGConfigDesktop, uCMGFake, uCMLVBack, Winsock, MacAdress;

{$R *.DFM}

function GetLocalIP: String;
  type
    TaPInAddr = array [0..10] of PInAddr;
    PaPInAddr = ^TaPInAddr;
  var
    phe : PHostEnt;
    pptr : PaPInAddr;
    Buffer : array [0..63] of char;
    I : Integer;
    GInitData : TWSADATA;
    S, S2 : String;
begin
  try
    WSAStartup($101, GInitData);
    GetHostName(Buffer, SizeOf(Buffer));
    phe := GetHostByName(buffer);
    if phe = nil then Exit;
    pptr := PaPInAddr(Phe^.h_addr_list);
    I := 0;
    Result := '';
    while pptr^[I] <> nil do begin
      S := StrPas(inet_ntoa(pptr^[I]^));
      S2 := Copy(S, 1, Pos('.', S)-1);
      if (Result='') or (S2='10') or (S2='192') then 
        Result := S;
      Inc(I);
    end;
  finally 
    WSACleanup;
  end;  
end;

function StrBool(S: String): Boolean;
begin
  S := UpperCase(S);
   Result := (S='S') or (S='T') or (S='SIM') or (S='YES') or (S='Y');
end;

function BoolStr(B: Boolean): String;
begin
  if B then 
    Result := 'T'
  else
    Result := 'F';  
end;

function ForceForegroundWindow(hwnd: THandle): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID : DWORD;
  timeout : DWORD;
begin
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
      ForegroundThreadID :=
      GetWindowThreadProcessID(GetForegroundWindow,nil);
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
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),
        SPIF_SENDCHANGE);
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

function RemoteFechaProc(ExitCode: dword): dword; stdcall;
begin
  Result := 0;
  ExitProcess(ExitCode);
end;  

procedure FechaProcesso(PID: DWORD);
var ph, dummy, exitcode: dword;
begin
  // then we open the process, which is the explorer, of course
  ph := OpenProcess(PROCESS_ALL_ACCESS, false, pid);
  try
    GetExitCodeProcess(PH, ExitCode);
    RemoteExecute(ph, @RemoteFechaProc, dummy, @ExitCode, SizeOf(dword));
  finally  
    CloseHandle(ph);
  end;
end;

procedure FechaProc(ProcessID: Integer);
VAR ProcessHandle: THANDLE;
    ExitCode: DWORD;
begin
   ExitCode:= 0;
   ProcessHandle:= OpenProcess(PROCESS_CREATE_THREAD OR
                               PROCESS_VM_OPERATION
                               OR PROCESS_VM_WRITE OR PROCESS_VM_READ OR
                               PROCESS_TERMINATE,
                               FALSE,ProcessID);
   if (ProcessHandle > 0) then
   begin
     GetExitCodeProcess(ProcessHandle, ExitCode);
     TerminateProcess(ProcessHandle,ExitCode);
     CloseHandle(ProcessHandle);
   end;
end;


function ObtemEXE(S: String): String;
var P : Integer;
begin          
  P := Pos('.EXE', UpperCase(S));
  if P = 0 then
    Result := ''
  else  
    Result := Copy(S, 1, P+3);
end;

function ObtemParams(S: String): String;
var P : Integer;
begin          
  P := Pos('.EXE', UpperCase(S));
  if P = 0 then             
    Result := ''
  else  
    Result := Copy(S, P+4, Length(S));
end;

function IniFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'guard.ini';
end;

procedure KillPID(PID : DWord);
var myhandle : THandle;
begin
  myhandle := OpenProcess(PROCESS_TERMINATE, False, PID);
  TerminateProcess(myhandle, 0);
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Fechar then begin
    Action := caFree;
    FProt.DesativaProtecao;
  end else
    Action := caNone;
end;

procedure TFrmPri.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Fechar;
end;

procedure TFrmPri.Conectar(Reconexao: Boolean);
var S : String;
begin
  if mwCli.Username='' then 
  begin
    mwCli.Username := slR.Values['CodLoja'];
    mwCli.Password := slR.Values['SenhaLoja'];
  end;  
  
  try
    mwTCPIP.Active := False;
    mwCli.Location := GetMacAdress + '|' + GetLocalIP;
    mwTCPIP.Active := True;
    KeepAlive;
    Conectado := True;
  except
    On E: Exception do begin
      FrmLogin.ErroConn(E.Message);
      mwTCPIP.Active := False;
      Raise;  
    end;
  end;

  FrmLogin.ErroConn('');

  FrmLogin.edCodigo.Text := mwCli.Username;

  slR.Values['CodLoja'] := mwCli.Username;
  slR.Values['SenhaLoja'] := mwCli.Password;
  
  slR.SaveToFile(RestrFName);

  if FileExists(DesktopFName) then
    FslDesktop.LoadFromFile(DesktopFName);
      
  RefreshRestr;
  
  FrmLogin.Paginas.ActivePage := FrmLogin.tsLogin;

  FFundoTela := ExtractFilePath(ParamStr(0))+'fundo.jpg';
  if FileExists(FFundoTela) then  
    SetListViewBkImage(lvDesktop, FFundoTela)
  else
    FFundoTela := '';  
      
  if Status <> stConfig then
    Status := stConectado;
end;

function GetCaption(H: HWND): String;
begin
  if H<>0 then begin
    FillChar(Buff, SizeOf(Buff), 0);
    if GetWindowText(H, @Buff, 255) = 0 then
      Result := ''
    else  
      Result := Trim(Buff);
  end else
    Result := '';  
end;

procedure GetCaptionClassName(H: HWND; var ACaption, AClassName: String);
var S : PChar;
begin
  S := AllocMem(255);
  try
    GetClassName(H, S, 255);
    AClassName := S;
    GetWindowText(H, S, 255);
    ACaption := S;
  finally
    FreeMem(S, 255);
  end;  
end;

procedure TFrmPri.FechaExplorer(Forcar: Boolean);
var
  I : Integer;
  H : HWND;

begin
  H := FindWindow('ExploreWClass', nil);
  if H=0 then
    H := FindWindow('CabinetWClass', nil);

  if H <> 0 then begin
    WL.Refresh(False);
    for I := 0 to pred(WL.Count) do with WL.Windows[I]^ do 
      if ((WndClassName='EXPLOREWCLASS') or (WNDClassName='CABINETWCLASS')) and
         (Forcar or (AchaDisplayName(WinCaption)=nil)) then
        PostMessage(WinHandle, WM_CLOSE, 0, 0);
  end;  
end;

procedure TFrmPri.FechaProgramas;
var 
  I : Integer;
  AC : PAnsiChar;

function IsOnTaskbar(H: HWND): Boolean;
var TWI: tagWindowInfo;
begin
  Result := False;
  if GetParent(H)<>0 then Exit;
  Fillchar(TWI, SizeOf(TWI), 0);
  GetWindowInfo(H, TWI);
  if (TWI.dwStyle and WS_EX_TOOLWINDOW) <> 0 then Exit;
  Result := (GetWindow(H, GW_OWNER)=0);
end;

function IEEXP(S: String): Boolean;
begin
  Result :=
    (S='IEFRAME') or
    (S='EXPLOREWCLASS') or
    (S='CABINETWCLASS');
end;

function EMessenger(S: String): Boolean;
begin
  Result := False;
end;

procedure FecharPorWM(H: HWND; aSysMsg, aQuitMsg, aCloseMsg: Boolean);
begin
  if aSysMsg then
    PostMessage(H, WM_SYSCOMMAND, SC_CLOSE, 0);

  if aQuitMsg then  
    PostMessage(H, WM_QUIT, 0, 0);
    
  if aCloseMsg then  
    PostMessage(H, WM_CLOSE, 0, 0);
end;

begin
  keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), 0, 0);
  keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), KEYEVENTF_KEYUP, 0);
  Sleep(100);
  keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), 0, 0);
  Sleep(100);
  keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), 0, 0);
  keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), KEYEVENTF_KEYUP, 0);
  keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
  Sleep(150);

  if not StrBool(slR.Values[opFecharProg]) then Exit;

  AC := @Buff;

  WL.Refresh(True);
  for I := 0 to pred(WL.Count) do with WL.Windows[I]^ do begin
    if WinCaption <> 'PROGRAM MANAGER' then
    if IEEXP(WndClassName) then
      FecharPorWM(WinHandle, True, False, False)
    else  
    if (FName<>'MSNMSGR.EXE') and (wlInicio.WindowByPID(ProcessID)=nil) then begin
      if not WL.PIDIsIEEXP(ProcessID) then
      if (Win32Platform = VER_PLATFORM_WIN32_NT) then
        FechaProc(ProcessID)
      else  
      if IsOnTaskBar(WinHandle) then
        FecharPorWM(WinHandle, True, True, True)
      else
        FecharPorWM(WinHandle, False, True, False);
    end;    
  end;    
end;

procedure TFrmPri.FecharCMGuard;
begin
  Fechar := True;
  Status := stNaoCon;
  Close;
end;

procedure TFrmPri.SetStatus(Value: Integer);
var Antes : Integer;
begin
  if Value = FStatus then Exit;
  Antes := FStatus;
  FStatus := Value;
  TelaLogin((FStatus in [stConectado, stNaoCon]));
  TelaPausa((FStatus in [stCliPausa, stPausaNoNet]));

  if FStatus > stConectado then
    cmEncerrar.Visible := ivAlways
  else
    cmEncerrar.Visible := ivNever;

  lvDesktop.Options := lvDesktop.Options - [loShellMenu];
  lvDesktop.Enabled := (FStatus > stConectado);

  with slR do
  case FStatus of
    stConfig : begin
      TFrmDesktop.Create(Self).ConfiguraDesktop;
      Status := stConectado;
    end;   
    
    stNaoCon :
    begin
      if FrmConta <> nil then FrmConta.Close;
      FProt.DesativaProtecao;
      if (Antes in [stCliUsando, stCliPausa]) then
        FechaProgramas;
      FDesligaAviso := False;
    end;

    stConectado, stCliPausa, stPausaNoNet :
    begin
      if FrmConta <> nil then FrmConta.Close;
      FDesligaAviso := False;
      FProt.SetOpcaoBool(cmp_noAltTab, True);
      FProt.SetOpcaoBool(cmp_noCtrlAltDel , not StringToBool(Values['CtrlAltDel']));
      FProt.SetOpcaoBool(cmp_noAltEsc, True);
      FProt.SetOpcaoBool(cmp_noWinkeys, True);
      FProt.SetOpcaoBool(cmp_noTaskbar, True);
      FProt.SetOpcaoBool(cmp_noTaskLinks, False);
      FProt.SetOpcaoBool(cmp_noDesktop, True);
      FProt.SetOpcaoBool(cmp_noTaskTray, False);
      FProt.SetOpcaoBool(cmp_noCtrlEsc, True);
      FProt.NoStartMenu := not StringToBool(Values['MenuIniciar']);
      FProt.AtivaProtecao;
      if (FStatus = stConectado) and (Antes in [stCliUsando, stCliPausa]) then
        FechaProgramas;

      with slR do
      if (FStatus = stConectado) and
         (Win32Platform = VER_PLATFORM_WIN32_NT) and
         (Values[opPaginaInicial]>'') then
        FProt.ForceIEStartPage(Values[opPaginaInicial]);
    end;

    stCliUsando :
    begin
      TFrmFake.Create(Self).ShowModal;
      FProt.SetOpcaoBool(cmp_noAltTab, False);
      FProt.SetOpcaoBool(cmp_noCtrlAltDel , not StrBool(Values[opCtrlAltDel]));
      FProt.SetOpcaoBool(cmp_noAltEsc, False);
      FProt.SetOpcaoBool(cmp_noWinkeys , not StrBool(Values[opMenuIniciar]));
      FProt.SetOpcaoBool(cmp_noTaskbar, False);
      FProt.SetOpcaoBool(cmp_noDesktop , True);
      FProt.SetOpcaoBool(cmp_noTaskLinks , True);
      FProt.SetOpcaoBool(cmp_NoDownload, StrBool(Values[opBloqDownload]));
      FProt.SetOpcaoBool(cmp_NoCtrlPanel, not StrBool(Values[opPainelControle]));
      FProt.SetOpcaoBool(cmp_NoRunCmd, not StrBool(Values[opCmdExec]));
      FProt.NoStartMenu := not StrBool(Values[opMenuIniciar]);
      FProt.AtivaProtecao;
    end;  
  end;  
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  FConectado := False;
  FInicioTicks := 0;
  FFimTicks := 0;
  FStatus := -1;
  TimerTaskMgr.Enabled := (Win32Platform=VER_PLATFORM_WIN32_NT);
  Application.OnMinimize := AoMinimizar;
  Application.OnSettingChange := OnSettingChange;
  AjustaTamanho;
  tmFirstConn.Enabled := True;

  tmCronometro.Enabled := True;
  
  FProt := TCMProtege98.Create(Self);
  FProt.AutoStart(True);
  
  VI.RetrieveFileName := ParamStr(0);
  FSaveH := -1;
  FSaveW := -1;
  FStatus := -1;
  FslDesktop  := TStringList.Create;
  FslRestr    := TStringList.Create;
  
  FProgAtual := '';
  if FileExists(RestrFName) then 
    FslRestr.LoadFromFile(RestrFName);    

  FExes := TStringList.Create;
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
  FExes.Free;
  FslDesktop.Free;
  FslRestr.Free;
  FProt.DesativaProtecao;
end;

procedure TFrmPri.TelaLogin(Mostrar: Boolean);
begin
  if Mostrar then begin
    Hide;
    if FrmLogin <> nil then
      FrmLogin.Exibindo := True;
  end else
  if FrmLogin<>nil then begin
    Show;
    FrmLogin.Exibindo := False;
  end;  
end;

procedure TFrmPri.TelaPausa(Mostrar: Boolean);
begin
  if Mostrar then begin
    Hide;
    if FrmPausa=nil then begin
      FrmPausa := TFrmPausa.Create(Self);
      FrmPausa.Show;
    end;
  end else
  if FrmPausa<>nil then begin
    Show;
    FrmPausa.Fechar;
  end;  
end;

procedure TFrmPri.ShutQueryShutdown(Sender: TObject;
  var CanShutdown: Boolean);
begin
  CanShutdown := True;
end;

procedure TFrmPri.cmEncerrarClick(Sender: TObject);
begin
  if (Sender=nil) or TFrmConta.Create(Self).Confirma(cmTempo.Caption) then 
  begin
    mwCli.Request(NomeQS, VersaoQS, 'UserLogout', []);
    FInicioTicks := 0;
    FFimTicks := 0;
    Status := stConectado;

    if StrBool(slR.Values[opReiniciar]) then begin
      Fechar := True;
      Reiniciar := True;
      Close;
      Exit;
    end; 
    
  end;  
end;

procedure TFrmPri.lvDesktopFilterItem(Sender: TObject;
  ShellItem: TStShellItem; var Accept: Boolean);
var S : String;
begin
  S := ShellItem.Path;
  S := slD.Values[S];
  Accept :=  (not StrBool(slR.Values[opRestrDesktop])) or
             StrBool(S);
end;

procedure TFrmPri.RefreshRestr;
begin
  if FFundoTela='' then
    lvDesktop.Color := StrToIntDef(slR.Values[opCorFundoDesktop], clBackground);
    
  lvDesktop.Font.Color := StrToIntDef(slR.Values[opCorFonteDesktop], clBlack);
  FFecharExp  := not StrBool(slR.Values['MenuIniciar']);
  FMostraCron := True;
  with BarMgr.BarByName('Barra') do
  case StrToIntDef(slR.Values[opAlinhamento], 0) of
    0 : DockingStyle := dsTop;
    1 : DockingStyle := dsBottom;
    2 : DockingStyle := dsLeft;
    3 : DockingStyle := dsRight;
  end;
end;

procedure TFrmPri.lvDesktopItemDblClick(Sender: TObject;
  Item: TStShellItem; var DefaultAction: Boolean);
begin
  DefaultAction := False;
  Item.Execute;
end;

procedure TFrmPri.tmReconectarTimer(Sender: TObject);
begin
  tmReconectar.Enabled := False;
  try
    Conectar(True);
  except
    tmReconectar.Enabled := True;
  end;
end;

function DesktopFName: String;
begin
  Result := FrmPri.SysInfo.WinSysPath + '\cmd.dat';
end;

function RestrFName: String;
begin
  Result := FrmPri.SysInfo.WinSysPath + '\cmr.dat';
end;

procedure TFrmPri.tmFirstConnTimer(Sender: TObject);
begin
  tmFirstConn.Enabled := False;
  wlInicio.Refresh(False);
  Status := stNaoCon;
  if (slR.Values['CodLoja']='') then 
    FrmLogin.MostraConn(opConectar)
  else
    tmReconectarTimer(nil);  
end;

procedure TFrmPri.AoMinimizar(Sender: TObject);
begin
  Application.Restore;
end;

procedure TFrmPri.AjustaTamanho;
begin
  Height := Screen.WorkAreaHeight;
  Width := Screen.WorkAreaWidth;
  Left := 0;
  Top := 0;
end;

procedure TFrmPri.OnSettingChange(Sender: TObject; Flag: Integer;
  const Section: string; var Result: Integer);
begin
  AjustaTamanho;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  AjustaTamanho;
  Application.Restore;
end;

function FiltraSt(S: String; Filtro: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if Pos(S[I], Filtro)=0 then
      Result := Result + S[I];
end;

function TFrmPri.AchaDisplayName(S: String): TStShellItem;
var I : Integer;
begin
  S := UpperCase(FiltraSt(S, ':\/*?|"<>'));
  with lvDesktop.ShellItems do 
  for I := 0 to Count-1 do 
  if UpperCase(Items[I].DisplayName) = S then begin
    Result := Items[I];
    Exit;
  end;  
  Result := nil;
end;

procedure TFrmPri.TimerTaskMgrTimer(Sender: TObject);
var H : HWND;
begin
  H := FindWindow('#32770', 'Gerenciador de tarefas do Windows');
  if H > 0 then 
    PostMessage(H, WM_CLOSE, 0, 0);
end;
    
procedure TFrmPri.SEEnumItem(Sender: TObject;
  ShellItem: TStShellItem; var Accept: Boolean);
var S: String;  
begin
  Exit;
  with ShellItem do begin
    S := Path;
    if IsLink then begin
      SC.ShortcutFileName := S;
      if Pos('.PIF', UpperCase(S))=0 then 
        SC.ResolveShortcut;
      S := SC.FileName;
    end;
    S := UpperCase(S);
    if FExes.IndexOf(S)=-1 then
      FExes.Add(S);
  end;    
end;

function TFrmPri.GetMotivoPausaStr: String;
begin
  if FMotivoPausa=mpRedeCaiu then
    Result := 'Máquina pausada por problemas de rede'
  else  
    Result := 'Tempo Esgotado';
end;

procedure TFrmPri.mwTCPIPConnectionLost(Sender: TObject);
begin
  Conectado := False;
end;

procedure TFrmPri.mwTCPIPDisconnected(Sender: TObject;
  Info: TkbmMWCustomTransportInfo);
begin
  Conectado := False;
end;

function TFrmPri.GetAtivo: Boolean;
begin
  Result := (FInicioTicks>0);
end;

procedure TFrmPri.KeepAlive;
begin
  mwCli.Request(NomeQS, VersaoQS, 'KeepAlive', []);
end;

procedure TFrmPri.SetAtivo(const Value: Boolean);
begin
  if Value then begin
    FInicioTicks := GetTickCount;
    Status := stCliUsando;
    lvDesktop.Refresh;
  end else
  begin 
    FInicioTicks := 0;
    if Conectado then
      Status := stConectado
    else
      Status := stNaoCon;
  end;    
end;

procedure TFrmPri.SetConectado(const Value: Boolean);
begin
  if Value = FConectado then Exit;
  FConectado := Value;
  TimerKA.Enabled := FConectado;
  if not Value then
    Ativo := False;
  if Fechar then FecharCMGuard;
end;

function TFrmPri.LojaSenhaOk(L, S: String): Boolean;
begin
  Result := (slR.Values['CodLoja']='') or
            ((slR.Values['CodLoja']=L) and
             (UpperCase(slR.Values['SenhaLoja'])=UpperCase(S)));
end;

procedure TFrmPri.TimerKATimer(Sender: TObject);
begin
  try
    KeepAlive;  
  except
  end;  
end;

procedure TFrmPri.tmCronometroTimer(Sender: TObject);
begin
  FechaExplorer(False);
  if Conectado and Ativo then begin
    cmTempo.Caption := FormatDateTime('hh:mm:ss', TicksToDateTime(FFimTicks - GetTickCount));
    if GetTickCount > FFimTicks then  begin
      Status := stCliPausa;
      FMotivoPausa := mpFimCred;
    end;  
  end;   
end;

procedure TFrmPri.UserLogin(U: String);
var V: Variant;
begin
  if Conectado then begin 
    if Ativo then begin
      mwCli.Request(NomeQS, VersaoQS, 'UserLogout', []);
      FInicioTicks := 0;
      FFimTicks := 0;
    end;  
      
//    V := 60;
    V := mwCli.Request(NomeQS, VersaoQS, 'UserLogin', [U]);
    try
      FFimTicks := GetTickCount + (V*1000);
      FInicioTicks := GetTickCount;
      Ativo := True;
    except
      On E: Exception do 
        Raise Exception.Create(V);
    end;
  end;      
end;

end.








                                                          
