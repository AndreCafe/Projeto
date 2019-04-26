unit ncgFrmPri;

interface

uses
  Windows, CSCBase, Messages, SysUtils, SyncObjs, Classes, Graphics, Controls, Forms, Dialogs,
  ncCompCliente, LMDControl, LMDBaseControl, jpeg, Winsock,
  LMDBaseGraphicControl, LMDGraphicControl, LMDBaseMeter, ShellApi,
  LMDCustomControl, LMDCustomPanel, DB, kbmMemTable,
  LMDCustomBevelPanel, LMDSimplePanel, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, 
  ExtCtrls, Menus, ncClassesBase,
  LMDCustomStatusBar, LMDStatusBar, ncProtecao, ncProtecao98,
  WindowList, LMDCustomSimpleLabel, LMDSimpleLabel,
  ImgList, LMDCustomComponent, 
  madremote, IniFiles, dxBarExtItems, dxBar, LMDSysInfo, 
  ncDebug,
  StShlCtl, StdCtrls, ComCtrls, STSHRTCT, SsBase, lmdcont, LMDWaveComp,
  LMDCustomScrollBox, LMDScrollBox, lmdsplt, ncFrmChat, cxControls,
  cxContainer, cxEdit, cxLabel, pngimage, UDPAdvertiser, IdBaseComponent,
  IdComponent, IdTCPServer, IdCustomHTTPServer, IdHTTPServer, DdeMan,
  Sockets, cxClasses, cxGraphics, cxStyles, cxBarEditItem,
  DisplaySwitcher, ncgFormBase, ncNXServRemoto, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllSimpleCommandHandler,
  nxllComponent, nxllSimpleSession, nxllTypes;

type
  TFrmPri = class(TFormBaseGuard)
    tmCronometro: TTimer;
    wlInicio: TWinList;
    WL: TWinList;
    tmPiscaTempo: TTimer;
    tmWinList: TTimer;
    tmAvisoTempo: TTimer;
    BarMgr: TdxBarManager;
    cmEnc2: TdxBarButton;
    lvDesktop: TStShellListView;
    cmMaq: TdxBarStatic;
    tmFirstConn: TTimer;
    cmNoNet: TdxBarStatic;
    TimerTaskMgr: TTimer;
    SE: TStShellEnumerator;
    dxBarLargeButton1: TdxBarLargeButton;
    TimerDesktop: TTimer;
    TimerLogin: TTimer;
    spPri: TLMDSplitterPanel;
    spDesktop: TLMDSplitterPane;
    spChat: TLMDSplitterPane;
    panHChat: TLMDSimplePanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    TimerChat: TTimer;
    CM: TClienteNexCafe;
    TimerSite: TTimer;
    PopupMenu1: TPopupMenu;
    Imagens32x32: TcxImageList;
    mtPatro: TkbmMemTable;
    mtPatroNome: TStringField;
    mtPatroURL1: TMemoField;
    mtPatroURL2: TMemoField;
    mtPatroDominios: TMemoField;
    cmEncerrar: TdxBarLargeButton;
    cmTempo: TdxBarLargeButton;
    cmValor: TdxBarLargeButton;
    cmNomeCli: TdxBarLargeButton;
    cmAlterarSenha: TdxBarLargeButton;
    cmChat: TdxBarLargeButton;
    cmDesktop: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    panValor: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    lbDeb: TcxLabel;
    lbTotal: TcxLabel;
    lbAtual: TcxLabel;
    cmPanValor: TdxBarControlContainerItem;
    im24: TcxImageList;
    BarMgrBar2: TdxBar;
    bdcPri: TdxBarDockControl;
    dxBarStatic1: TdxBarStatic;
    Timer1: TTimer;
    TimerShutdown: TTimer;
    bmCreditos: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    cmVerCreditos: TdxBarButton;
    cxStyle2: TcxStyle;
    dxBarButton2: TdxBarButton;
    cmPromptCred: TdxBarStatic;
    cmCredRestr: TdxBarStatic;
    cxStyle3: TcxStyle;
    dxBarStatic4: TdxBarStatic;
    cxImageList1: TcxImageList;
    cmPontos: TdxBarLargeButton;
    TimerHook: TTimer;
    TimerShieldHook: TTimer;
    DispSw: TDisplaySwitcher;
    AutoIP: TUDPAdUser;
    SC: TStShortcut;
    DDE: TDdeClientConv;
    CMRem: TncNXServRemoto;
    nxSession: TnxSimpleSession;
    nxCmdH: TnxSimpleCommandHandler;
    nxTCPIP: TnxWinsockTransport;
    procedure btnFecharClick(Sender: TObject);
    procedure tmCronometroTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CMShutdown(Sender: TObject; Operacao: Byte);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CMAoDesativar(Sender: TObject);
    procedure tmWinListTimer(Sender: TObject);
    procedure ShutQueryShutdown(Sender: TObject; var CanShutdown: Boolean);
    procedure tmPiscaTempoTimer(Sender: TObject);
    procedure tmAvisoTempoTimer(Sender: TObject);
    procedure cmEnc2Click(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure cmDesktopClick(Sender: TObject);
    procedure lvDesktopFilterItem(Sender: TObject; ShellItem: TStShellItem;
      var Accept: Boolean);
    procedure CMAoAtualizarConfig(Sender: TObject);
    procedure lvDesktopItemDblClick(Sender: TObject; Item: TStShellItem;
      var DefaultAction: Boolean);
    procedure tmFirstConnTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerTaskMgrTimer(Sender: TObject);
    procedure SEEnumItem(Sender: TObject;
      ShellItem: TStShellItem; var Accept: Boolean);
    procedure cmAlterarSenhaClick(Sender: TObject);
    procedure TimerDesktopTimer(Sender: TObject);
    procedure TimerLoginTimer(Sender: TObject);
    procedure CMAoMudarFundo(Desktop: Boolean);
    procedure CMAoReceberChat(Sender: TObject; MsgID, De, Para: Integer;
      DataHora: TDateTime; Texto: String);
    procedure panHChatClick(Sender: TObject);
    procedure TimerChatTimer(Sender: TObject);
    procedure CMAoAtualizarSessao(Sender: TObject);
    procedure CMAoAtivar(Sender: TObject);
    procedure cmChatClick(Sender: TObject);
    procedure AutoIPNewAdvertiserDetected(Sender: TObject);
    procedure CMAoFinalizaProcesso(Sender: TObject; ProcessID: Integer);
    procedure CMAoObtemProcessos(Sender: TObject; IDCliente,
      Request: Integer);
    procedure CMAoBloquearSite(Sender: TObject; Adicionou: Boolean;
      URL: String);
    procedure HSCreatePostStream(ASender: TIdPeerThread;
      var VPostStream: TStream);
    procedure CMAoAtualizarMaquina(Sender: TObject);
    procedure TimerSiteTimer(Sender: TObject);
    procedure CMAoSuporteRem(Sender: TObject; Maq, Tec: Word);
    procedure CMAoChecaLic(Sender: TObject);
    procedure CMAoAtualizarTarifa(Sender: TObject);
    procedure cmEncerrarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerShutdownTimer(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure cmTempoClick(Sender: TObject);
    procedure cmVerCreditosClick(Sender: TObject);
    procedure spDesktopResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lvDesktopKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerHookTimer(Sender: TObject);
    procedure TimerShieldHookTimer(Sender: TObject);
    procedure CMRemProgressoArq(Perc: Integer; Etapa: Byte; NomeArq: string;
      Download: Boolean);
    procedure nxTCPIPConnectionLost(aSender: TnxBaseTransport;
      aSessionID: TnxSessionID);
    procedure CMAoPedirTela(Sender: TObject; SessionID: Integer);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
    FStatus : Integer;
    FslMenu : TStrings;
    FHosts  : TStrings;
    FShutOp : Integer;
    { Public declarations }
    FProgAtual: String;
    FSiteAtual: String;
    FFecharExp : Boolean;
    FPodeNavegar : Boolean;
    FMostraCron : Boolean;
    FNoNet : Integer;

    FSaveH, FSaveW : Integer;
    FCodTipo : Integer;
    FConfigurouItensPerm: Boolean;
    FStrTipo : String;
    FEXEs    : TStrings;
    FMotivoPausa : Byte;

    FPaginasImp : Integer;
    FPrinter : String;
    FCopias : Integer;
    FDoc : String;
    FPrintHookOk : Boolean;
    FIPCOK : Boolean;
    FWav: TLMDWaveComp;
    FBloqueioSitesAtivo : Boolean;
    FBuf : PChar;

    procedure OnSetFormAtivo(Sender: TObject);
    
    procedure SetStatus(Value: Integer);
    procedure ChecaEstadoMaq;
    procedure FechaProgramas(aForcar: Boolean = False);
    procedure RefreshDesktop;
    procedure FechaExplorer(Forcar: Boolean);
    procedure SetCodTipo(const Value: Integer);
    procedure RefreshRestr;
    procedure MostraAviso;
    procedure Hook;
    function GetMotivoPausaStr: String;
    procedure OnForcarFechamento(Sender: TObject);

    procedure _Conectar(Reconexao: Boolean);
    

    function  HostsFN: String;
    procedure LeHosts;
    procedure SalvaHosts;
    procedure DesbloqueiaSites(aLeHosts, aSalvaHosts: Boolean);
    procedure BloqueiaSites(aLeHosts: Boolean);

    
    procedure HandlePrintNotification(var Message: TMessage); message WM_USER + 777;
    procedure Capturar(var Message: TMessage); message WM_USER + 778;
    
    procedure SetBloqueioSitesAtivo(const Value: Boolean);
    function GetFormAtivo: TFormBaseGuard;
    procedure SetFormAtivo(const Value: TFormBaseGuard);
    procedure SetNivelProt(const Value: Byte);
    function GetReconectar: Boolean;
    procedure SetReconectar(const Value: Boolean);
    procedure SetFaltamM(const Value: Integer);
    procedure Tarifar;
    procedure _reconectar;
    procedure AjustaVisEncerrar(aTipoCli, aCliente: Integer);
    procedure TaskbarRecreated;

    procedure RefreshLic(var Msg: TMessage);
              message cscm_RefreshLic;
  public
    FDesligaAviso : Boolean;
    FProt : TncProtegeWindows;
    FMsgConn: String;
    FUAviso: Cardinal;
    FStayOnTopOff : Boolean;
    FNivelProt : Byte;
    FProxRecon: Cardinal;
    FFaltamM : Integer;
    FIgnoreDoc : String;
    FExplorerPID : Cardinal;
    FCheckExpCnt : Cardinal;
    SysInfo: TLMDSysInfo;
                
    function SemSenha: Boolean;
    function UsuarioOpOk(aUsername, aSenha: String; Op: Integer): String;
    procedure FecharCMGuard;      
    procedure RefreshMenu;
    function ArqUsuarios: String;
    function AchaDisplayName(S: String): TStShellItem;
    function NomeMaq: String;
    procedure Conectar(Reconexao: Boolean);
    procedure AoMinimizar(Sender: TObject);
    procedure OnSettingChange(Sender: TObject; Flag: Integer; const Section: string; var Result: Longint);
    procedure LoadExes;
    procedure EnviarMsg(const aPara: Integer; const aTexto: String);
    procedure MudouAtencao(Sender: TObject);
    procedure CalcReconectar;
    procedure RefreshLoginG;
    procedure ObtemSiteProg;
    procedure TimerEncerrar(Sender: TObject);


    function CalcStatus: Integer;
    procedure CheckExplorerRunning;
    
    function StayOnTopOFF: Boolean;

    function GetAutoServName: String;
    
    procedure AjustaTamanho;

    property Reconectar: Boolean
      read GetReconectar write SetReconectar;

    property NivelProt: Byte
      read FNivelProt write SetNivelProt;

    property FrmAtivo: TFormBaseGuard
      read GetFormAtivo write SetFormAtivo;

    { Public declarations }
    property Status: Integer
      read FStatus write SetStatus;

    property slMenu: TStrings
      read FslMenu;

    property ProgAtual: String
      read FProgAtual write FProgAtual;

    property SiteAtual: String
      read FSiteAtual write FSiteAtual;  

    property CodTipo: Integer
      read FCodTipo write SetCodTipo;

    function StringStatus: String;  

    property StrTipo: String
      read FStrTipo;

    property MotivoPausaStr: String
      read GetMotivoPausaStr;  

    property MotivoPausa: Byte
      read FMotivoPausa;

    property BloqueioSitesAtivo: Boolean
      read FBloqueioSitesAtivo write SetBloqueioSitesAtivo; 

    property FaltamM: Integer
      read FFaltamM write SetFaltamM;   

  end;

  TThreadProgAtual = class (TThread)
  protected
    procedure Execute; override;
  end;  

  TThreadTaskMgr = class (TThread)
  protected
    procedure Execute; override;
  end;
  
  TBoolArray = Array[1..10] of Boolean;
  PBoolArray = ^TBoolArray;

  function IniFName: String;
  function ArqImFundo: String;
  function ArqImLogin: String;

  function ObtemEXE(S: String): String;
  function ObtemParams(S: String): String;
  function ForceForegroundWindow(hwnd: THandle): boolean;

  procedure ShowTaskBar;
  procedure HideTaskBar;

  procedure RemoveDriverHook;
  procedure LoadConfig;

  procedure FechaProc(ProcessID: Cardinal);
  

const                      
   sgIniciando   = 0;
   sgInativo     = 1;
   sgTentaAtivar = 2;
   sgLoginFunc   = 3;
   sgConfig      = 4;
   sgLoginCli    = 5;
   sgSessao      = 6;
   sgPausaSessao = 7;
   sgFechar      = 8;
   sgConfirmaFechar = 9;

   npZero   = 0;
   npSessao = 1;
   npManut  = 2;
   npTotal  = 3;
  
  CorNormal = $00C8D0D4;
  CorPisca  = clYellow;

var
  AvisoCreditos : Boolean = True;
  FrmPri: TFrmPri;
  FIni : TMemIniFile = nil;
  glShutOp : Integer;
  glForceShut : Boolean;
  glPowerOff : Boolean;
  FrmChat : TFrmBaseChat = nil;
  csProgAtual : TCriticalSection = nil;
//  ThProgAtual : TThreadProgAtual;

  DesbloqTaskMgr : Boolean = False;
  
  SenhaCli: String;
  SenhaDig: String = '';
  StatusSenha: Byte = 0;
  USessao : Integer = 0;
  UErroStr : String = '';
  NoGuardIS : Boolean = False;

  LoginGratis : Boolean = False;
  SiteG1, SiteG2 : String;
  slDominiosG  : TStrings;

  StopExtraProt : Boolean = False;
  

  SiteIE, SiteFF, 
  USite, UProg : String;
  USalvaProgs : Cardinal;
  
  ModoManut : Boolean = False;
  ShieldInjOk : Boolean = False;
  InjetarShield : Boolean = False;
  
  slConfig : TStrings = nil;

  Fechar : Boolean = False;
  Buff : Array[1..1024] of Char; 

  MessageID: Integer;
  WProc: TFNWndProc = Nil;
  ExitProcessNext : procedure(exitCode: dword); Stdcall;
  
const
  ssObterSenha  = 0;
  ssSenhaObtida = 1;
  ssSenhaOK     = 2;

implementation

uses 
  madCodeHook,
  Registry, 
  CSCClient,
  ncgFrmPausa, 
  ncgFrmLogin, 
  ncgFrmConta, 
  ncgFrmAtualiza, 
  ncIDRecursos,
  ncgFrmConfigDesktop, 
  ncgFrmFake, 
  ncgLVBack, 
  ncgFrmAviso,
  ncgFrmSenha, ncSessao, ncTarifador, ncgFrmConn, 
  ncVersoes, ncgDMArqs, ncFrmSuporteRem, MACAdress, ncCliAtualizaLic,
  ncFrmCreditos, ncErros, ncVersionInfo, ncShellStart;

{$R *.DFM}

type
  // this is what we our dll sends us
  TPrintNotification = record
    process : array [0..MAX_PATH] of char;
    api     : array [0..MAX_PATH] of char;
    params  : array [0..MAX_PATH] of char;
    result  : array [0..MAX_PATH] of char;
  end;

procedure ScreenShot(DestBitmap : TBitmap);
var
  DC : HDC;
begin
  DC := GetDC (GetDesktopWindow);
  try
    DestBitmap.Width := GetDeviceCaps (DC, HORZRES);
    DestBitmap.Height := GetDeviceCaps (DC, VERTRES);
    BitBlt(DestBitmap.Canvas.Handle, 0, 0, DestBitmap.Width,
           DestBitmap.Height,DC, 0, 0, SRCCOPY);
  finally
    ReleaseDC (GetDesktopWindow, DC);
  end;
end;
  
procedure LoadConfig;
begin
  if FileExists(IniFName) then begin
    slConfig.LoadFromFile(IniFName) ;
    DebugAtivo := SameText(slConfig.Values['Debug'], 'S');
  end else
    slConfig.Values['Servidor'] := 'auto';
end;  

function GetMacAddress(const AServerName : string) : string;

type

      TNetTransportEnum = function(pszServer : PWideChar;

                                   Level : DWORD;

                                   var pbBuffer : pointer;

                                   PrefMaxLen : LongInt;

                                   var EntriesRead : DWORD;

                                   var TotalEntries : DWORD;

                                   var ResumeHandle : DWORD) : DWORD;
stdcall;



      TNetApiBufferFree = function(Buffer : pointer) : DWORD; stdcall;



      PTransportInfo = ^TTransportInfo;

      TTransportInfo = record

                        quality_of_service : DWORD;

                        number_of_vcs : DWORD;

                        transport_name : PWChar;

                        transport_address : PWChar;

                        wan_ish : boolean;

                      end;



var E,ResumeHandle,

     EntriesRead,

     TotalEntries : DWORD;

     FLibHandle : THandle;

     sMachineName,

     sMacAddr,

     Retvar : string;

     pBuffer : pointer;

     pInfo : PTransportInfo;

     FNetTransportEnum : TNetTransportEnum;

     FNetApiBufferFree : TNetApiBufferFree;

     pszServer : array[0..128] of WideChar;

     i,ii,iIdx : integer;

begin

   sMachineName := trim(AServerName);

   Retvar := '00-00-00-00-00-00';



   // Add leading \\ if missing

   if (sMachineName <> '') and (length(sMachineName) >= 2) then
begin

     if copy(sMachineName,1,2) <> '\\' then

       sMachineName := '\\' + sMachineName

   end;



   // Setup and load from DLL

   pBuffer := nil;

   ResumeHandle := 0;

   FLibHandle := LoadLibrary('NETAPI32.DLL');



   // Execute the external function

   if FLibHandle <> 0 then begin

     @FNetTransportEnum :=
GetProcAddress(FLibHandle,'NetWkstaTransportEnum');

     @FNetApiBufferFree := GetProcAddress(FLibHandle,'NetApiBufferFree');

     E :=
FNetTransportEnum(StringToWideChar(sMachineName,pszServer,129),0,


pBuffer,-1,EntriesRead,TotalEntries,Resumehandle);



     if E = 0 then begin

       pInfo := pBuffer;



       // Enumerate all protocols - look for TCPIP

       for i := 1 to EntriesRead do begin

         if pos('TCPIP',UpperCase(pInfo^.transport_name)) <> 0
then begin

           // Got It - now format result 'xx-xx-xx-xx-xx-xx'

           iIdx := 1;

           sMacAddr := pInfo^.transport_address;



           for ii := 1 to 12 do begin

             Retvar[iIdx] := sMacAddr[ii];

             inc(iIdx);

             if iIdx in [3,6,9,12,15] then inc(iIdx);

           end;

         end;



         inc(pInfo);

       end;

       if pBuffer <> nil then FNetApiBufferFree(pBuffer);

     end;



     try

       FreeLibrary(FLibHandle);

     except

       // Silent Error

     end;

   end;



   Result := Retvar;

end;
  

procedure ShowTaskBar;
var H : HWND;
begin
  H := FindWindow('Shell_TrayWnd', nil);
  ShowWindow(H, SW_SHOW);
end;

procedure HideTaskBar;
var H : HWND;
begin
  H := FindWindow('Shell_TrayWnd', nil);
  ShowWindow(H, SW_HIDE);
end;

function ArqImFundo: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'fundo.jpg';
end;

function ArqImLogin: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'login.jpg';
end;

procedure CleanupSystemTray;
var
  hTaskbar: HWND;
  hSysTray: HWND;
  R: TRect;
  iXPos: Integer;
  iYPos: Integer;

  iLeft: Integer;
  iRight: Integer;
  iTop: Integer;
  iBottom: Integer;

  iMouseFlag: Integer;
  p: TPoint;
const
  cMax = 65535;
  cXStep = 1000;
  cYStep = 100;
begin
    // find out where the system tray is located
    hTaskbar := FindWindow(PChar('Shell_TrayWnd'), nil);
    hSysTray := FindWindowEx(hTaskbar, 0, 'TrayNotifyWnd', nil);
    GetWindowRect( hSysTray, R );

    // normalize the coordinates
    
    iLeft := R.Left * cMax div Screen.Width;
    iRight := R.Right * cMax div Screen.Width;
    iTop := R.Top * cMax div Screen.Height;
    iBottom := R.Bottom * cMax div Screen.Height;

    // save the original cursor position
    GetCursorPos(p);

    // move the cursor over every icon in the system tray
    // this will cause Explorer to realize that the icon is invalid and
    // remove the icon from the system tray
    iMouseFlag := MOUSEEVENTF_MOVE + MOUSEEVENTF_ABSOLUTE;
    iXPos := iLeft;
    repeat
      iYPos := iTop;
      repeat
        mouse_event(iMouseFlag, iXPos, iYPos, 0, 0);
        iYPos := iYPos + cYStep;
      until iYPos >= iBottom;
      iXPos := iXPos + cXStep;
    until iXPos >= iRight;

    // put the cursor back where it was
    SetCursorPos(p.x, p.y);
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

procedure ExitProcessCallback(exitCode: dword); Stdcall;
begin
  SetLastError(ERROR_ACCESS_DENIED);
end; 

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

procedure FechaProc(ProcessID: Cardinal);
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
   BEGIN
       GetExitCodeProcess(ProcessHandle, ExitCode);
       TerminateProcess(ProcessHandle,ExitCode);
       CloseHandle(ProcessHandle);
   END;
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
  Result := ExtractFilePath(ParamStr(0))+'nexguard.ini';
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

procedure TFrmPri.btnFecharClick(Sender: TObject);
begin
  if CM.Ativo then begin
    Fechar := True;
    CM.Ativo := False;
  end else
    FecharCMGuard;
end;

procedure TFrmPri.tmCronometroTimer(Sender: TObject);
begin
  try
    try
//      CheckExplorerRunning;
    except
    end;
    Tarifar;
  except
    on E: Exception do begin
      DebugMsg('TFrmPri.Erro Tarifação: '+E.ClassName+' - Msg: '+E.Message);
    end;
  end;
end;

procedure TFrmPri.Tarifar;
var 
  S : TncSessao;
  Usu : TncUsuario;
  cTempo, TempoR: Cardinal;
  ATempo, AValor, St, sPontos: String;
  dValor: Currency;
begin
  _Reconectar;

  if CM.Ativo then
    cmNoNet.Visible := ivNever
  else
    cmNoNet.Visible := ivAlways;

  sPontos := '';  

  with CM do
  if FStatus in [sgSessao, sgPausaSessao] then begin
    S := CM.SessaoMaq;
    
    if S=nil then begin
      ATempo := 'ERRO';
      AValor := 'Maq '+IntToStr(Maquina);
    end else begin
      S.AtualizaCalculo;
    
      if S.TipoCli = tcManutencao then begin
        CodTipo := -1;
        cmPanValor.Visible := ivNever;
        ATempo := TicksToHMSSt(S.TempoUsado.Ticks);
        AValor := FloatToStrF(0, ffCurrency, 10, 2);
      
        Usu := Usuarios.PorUsername[S.FuncI];
        if (Usu<>nil) and (not Usu.Admin) and (Usu.MaxTempoManut>0) and ((Usu.MaxTempoManut*60000)<S.TicksTotal) then
          cmEncerrarClick(nil);
      end else begin
        CodTipo := S.TipoAcesso;
        cTempo := S.TempoUsado.Ticks;
        
        if gConfig.MostraPrePagoDec then begin
          if gConfig.ModoCredGuard=mecMostrarTotal then begin
            if (S.TempoMaximoTot.Ticks>0) and (cTempo<=S.TempoMaximoTot.Ticks) then
              cTempo := S.TempoMaximoTot.Ticks - cTempo;
          end else
            if (S.TempoMaximo.Ticks>0) and (cTempo<=S.TempoMaximo.Ticks) then
              cTempo := S.TempoMaximo.Ticks - cTempo;
        end;
            
        ATempo := TicksToHMSSt(cTempo);

        if (S.PontosCli>0.0001) and gConfig.FidAtivo and gConfig.FidMostrarSaldoGuard and Versoes.PodeUsar(idre_fidelidade) then
        begin
          Str(S.PontosCli:0:2, sPontos);
          sPontos := Copy(sPontos, 1, Pos('.', sPontos)+1);
          if (Length(sPontos)>0) and (sPontos[Length(sPontos)]='0') then
            Delete(sPontos, Pos('.', sPontos), 10);
        end;
          
        if AvisoCreditos and (gConfig.AvisoCreditos) and (S.Tarifador.CreditoTotal.Ticks<>S.Tarifador.CredTotalG) then begin
          ATempo := ATempo + '*';
          cmCredRestr.Caption := 
            MinutosToHMSAbrev((S.Tarifador.CredTotalG-S.Tarifador.CreditoTotal.Ticks)/60/1000);
          bmCreditos.Visible := True;            
        end else 
          bmCreditos.Visible := False;
          
        dValor := S.Tarifador.Valor;
        dValor := dValor + 
                  S.Transacoes.TotalPendente(trEstVenda) +
                  S.Transacoes.TotalPendente(trCredTempo) +
                  S.Transacoes.TotalPendente(trImpressao);
        AValor := Trim(FloatToStrF(dValor, ffCurrency, 10, 2));
        TempoR := 0;
        
        if gConfig.MostrarDebitoNoGuard and (S.DebitoCli>0.009) then begin
          cmPanValor.Visible := ivAlways;
          lbAtual.Caption := AValor;
          lbDeb.Caption := Trim(FloatToStrF(S.DebitoCli, ffCurrency, 10, 2));
          lbTotal.Caption := Trim(FloatToStrF(dValor + S.DebitoCli, ffCurrency, 10, 2));
          panValor.Visible := True;
        end else begin
          cmPanValor.Visible := ivNever;
          panValor.Visible := False;
        end;
        
        case S.MotivoPausa of
          mpPausaFimTempo : begin
            FMotivoPausa := mpPausaFimTempo;
            Status := sgPausaSessao;
          end;
          mpPausaAdmin : begin
            FMotivoPausa := mpPausaAdmin;
            Status := sgPausaSessao;
          end;
          mpPausaHorarioNP : begin
            FMotivoPausa := mpPausaHorarioNP;
            Status := sgPausaSessao;
          end;
          mpPausaEncerrar : begin
            FMotivoPausa := mpPausaEncerrar;
            Status := sgPausaSessao;
          end
        else    
          Status := sgSessao;
          if (S.TempoMaximo.Minutos>0) then 
            TempoR := S.TempoMaximo.Ticks - S.TempoUsado.Ticks else
            TempoR := 0;
          if TempoR<0 then TempoR := 0;  
        end;    
        
        if ((TempoR div 1000) mod 60) > 5 then 
          FaltamM := (TempoR div 60000) + 1 else
          FaltamM := TempoR div 60000;
      end;

      cmTempo.Caption := ATempo;
      cmValor.Caption := AValor;
      if FMostraCron then begin
        cmTempo.Visible := ivAlways;
        cmValor.Visible := ivAlways;
      end else begin
        cmTempo.Visible := ivNever;
        cmValor.Visible := ivNever;
      end;

      if FMostraCron {and MostraPreco} then
        Application.Title := cmTempo.Caption + ' = ' + cmValor.Caption
      else
        Application.Title := 'NexCafé';
    end;
  end else begin
//    Caption := 'NexCafé ' + StringStatus;
    Caption := '';
    Application.Title := Caption;
  end; 
  if cmPontos.Caption<>sPontos then 
    cmPontos.Caption := sPontos;

  if sPontos>'' then
    cmPontos.Visible := ivAlways else
    cmPontos.Visible := ivNever; 
end;

procedure TFrmPri.TaskbarRecreated;
var SaveNP : Byte;
begin
  SaveNP := FNivelProt;
  FNivelProt := 0;
  NivelProt := SaveNP;
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Fechar then begin
    Action := caFree;
    if DesbloqTaskMgr then
      FProt.BloqueiaCtrlAltDel := False;
    FProt.DesativaProtecao;
//    TFrmRemoveRestr.Create(nil).ShowModal;
  end else
    Action := caNone;
end;

procedure TFrmPri.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Fechar;
end;

procedure TFrmPri._Conectar(Reconexao: Boolean);
var M: TncMaquina;
begin
  DebugMsg('TFrmPri._Conectar');
  CM.Maquina := StrToIntDef(slConfig.Values[NomeMaq], 0);
  CM.Programa := 'nexguard.exe';
  CM.Versao := FormataNumVersao(GetVersionInfo);

  CM.Ativo := False;
  nxTCPIP.Active := False;
  
  CMRem.Transp := nil;
  nxTCPIP.CommandHandler := nil;
  nxSession.Transport := nil;
  try nxTCPIP.Free; except end;
  nxTCPIP := TnxWinsockTransport.Create(Self);
  nxTCPIP.CallbackThreadCount := 1;
  nxTCPIP.Timeout := 3000;
  nxTCPIP.Port := 16200;
  nxTCPIP.ServerName := GetAutoServName;
  nxTCPIP.CommandHandler := nxCmdH;
  nxSession.Transport := nxTCPIP;
  CMRem.Transp := nxTCPIP;
  DebugMsg('TFrmPri._Conectar - nxTCPIP.SernerName: ' + nxTCPIP.ServerName);
  cmRem.Ativo := False;
  cmMaq.Caption := 'Máq. ' + slConfig.Values[NomeMaq];

  try
    DebugMsg('TFrmPri._Conectar - CM.Ativo = True - BEFORE');
    CM.Ativo := True;
    DebugMsg('TFrmPri._Conectar - CM.Ativo = True - OK !!!');
    UErroStr := '';
    tmCronometro.Enabled := True;
  except
    On E: Exception do begin
      AutoIP.Active := False;
      AutoIP.Active := True;
      UErroStr := E.Message;
      Raise;
    end;  
  end;
  slConfig.Values['UltimoServidor'] := nxTCPIP.ServerName;
  slCOnfig.SaveToFile(IniFName);
  DebugMsg('slConfig.SaveToFile');
  if CM.AtualizouAgora then begin
    TdmArqs.NexUpd(CM.ArqDestino);
    CMShutdown(Self, 0);
    Exit;
  end;

  if CM.NomeArqDesktop='' then
    TimerDesktop.Enabled := True;

  DebugMsg('Antes refreshmenu');

  RefreshMenu;

  DebugMsg('depois refreshmenu');
  
  DebugMsg('transferindoArq');

  DeleteFile(ExtractFilePath(ParamStr(0))+'NNCGuard.EXE');
  DeleteFile(ExtractFilePath(ParamStr(0))+'NNexGuard.EXE');

  DebugMsg('DeleteFiles');

  RefreshLoginG;

  DebugMsg('RefreshLoginG');
  
  RefreshRestr;

  DebugMsg('RefreshRest');

  Hook;

  DebugMsg('Hook');

  try
    CM.Usuarios.SalvaArquivo(ArqUsuarios);
  except
  end;

  DebugMsg('Usuarios.SalvaArquivo');

  if FrmChat <> nil then FrmChat.NumMaq := CM.Maquina;

  Status := CalcStatus;

  DebugMsg('CalcStatus');
//  Caption := ' ' + Caption + ' ';
  Caption := '';

  M := CM.MaquinaObj;

  DebugMsg('M := CM.MaquinaObj');

  M.AtualizaCache;
//  M.IP := inet_ntoa(cmRem.clicom.IPPort.Socket.RemoteAddr.sin_addr);
  try
    DebugMsg('GetMACAdress 1');
    M.MacAddress := GetMACAdress;
  except
    DebugMsg('GetMACAdress 2');
    M.MacAddress := GetMacAddress('');
  end;
  DebugMsg('GetMACAdress');
  M.DisplayW := DispSw.CurrentWidth;
  M.DisplayH := DispSw.CurrentHeight;
  M.ComputerName := SysInfo.Computername;
  CM.SalvaAlteracoesObj(M, False);
  DebugMsg('SalvaAlteracoesObj');
end;

procedure TFrmPri._Reconectar;
begin
  CalcReconectar;
  if (not CM.Ativo) and (FProxRecon>0) and (GetTickCount > FProxRecon) then 
  begin
    Reconectar := False;
    try
      Conectar(True);
    except
    end;
    CalcReconectar;
  end;
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
  if ModoManut and (not Forcar) then Exit;

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

procedure FecharPorWM(H: HWND; aSysMsg, aQuitMsg, aCloseMsg: Boolean);
begin
  if aSysMsg then
    PostMessage(H, WM_SYSCOMMAND, SC_CLOSE, 0);

  if aQuitMsg then  
    PostMessage(H, WM_QUIT, 0, 0);
    
  if aCloseMsg then  
    PostMessage(H, WM_CLOSE, 0, 0);
end;

procedure TFrmPri.FechaProgramas(aForcar: Boolean = False);
const
  ProgramasWMQuit = '|MSNMSGR.EXE|SKYPE.EXE|GOOGLETALK.EXE|';
  SempreFechar = '|FIREFOX.EXE|IEXPLORE.EXE|MSNMSGR.EXE|SKYPE.EXE|GOOGLETALK.EXE|';
var 
  I : Integer;
  AC : PAnsiChar;
  FN : String;

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
//  Result := (S='MSNMSBLGENERIC');
end;

function NTPlat: Boolean;
begin
  Result := (Win32Platform = VER_PLATFORM_WIN32_NT);
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

  with gConfig do
  if (AposEncerrar in [1..2]) then begin
    if AposEncerrar=1 then
      CMShutDown(nil, 1)
    else
      CMShutDown(nil, 3);  
    Exit;
  end;

  if not gConfig.FecharProgramas then begin
    DebugMsg('TFrmPri.FechaProgramas - gConfig.FecharProgramas = False');
    Exit;
  end;

  AC := @Buff;

  try
    WL.Refresh(True);
    for I := 0 to pred(WL.Count) do with WL.Windows[I]^ do begin
      FN := UpperCase(ExtractFileName(FName));
      if WinCaption <> 'PROGRAM MANAGER' then
      if FN<>'REMOTEHOST.EXE' then
      if FN<>'EXPLORER.EXE' then
      if FN='IEXPLORE.EXE' then begin
        FecharPorWM(WinHandle, True, True, True);
        if aForcar then begin
          FechaProc(ProcessID);
          FechaProcesso(ProcessID);
        end;
      end else
      if aForcar then begin
        if (Pos('|'+FN+'|', SempreFechar)>0) or (wlInicio.WindowByPID(ProcessID)=nil) then
        begin
          try
            FecharPorWM(WinHandle, True, True, True);
            FechaProc(ProcessID);
            FechaProcesso(ProcessID);
          except
          end;
        end;
      end else
      if Pos('|'+FN+'|', ProgramasWMQUIT)>0 then begin
        PostMessage(WinHandle, WM_QUIT, 0, 0);
      end else  
      if NTPlat and (Pos('|'+FN+'|', SempreFechar)>0) then
        FechaProc(ProcessID) 
      else
      if (wlInicio.WindowByPID(ProcessID)=nil) then begin
        if NTPlat then 
          FechaProc(ProcessID)
        else  
        if IsOnTaskBar(WinHandle) then
          FecharPorWM(WinHandle, True, True, True)
        else
          FecharPorWM(WinHandle, False, True, False);
      end;    
    end;
  finally
    if not AForcar then with TTimer.Create(Self) do begin
      Interval := 1500;
      OnTimer := OnForcarFechamento;
      Enabled := True;
    end;
  end;

//  CleanupSystemTray;   
end;

function TFrmPri.CalcStatus: Integer;
var 
  S: TncSessao;
  MP : Integer;
begin
  if (not CM.Ativo) and (FStatus=sgTentaAtivar) then begin
    Result := sgTentaAtivar;
    Exit;
  end;
  S := CM.SessaoMaq;
  if (S=nil) or S.Encerrou then
    Result := sgLoginCli 
  else begin
    MP := S.MotivoPausa;
    if MP=mpNaoEstaPausado then
      Result := sgSessao 
    else begin
      FMotivoPausa := MP;
      Result := sgPausaSessao;
    end;    
  end;
  
  if not CM.Ativo then begin
    if (Result = sgSessao) and (S <> nil) and (not S.Encerrou) then begin
      case FNoNet of
        obPermitePrePago :
        if S.TempoMaximo.Segundos<5 then 
          Result := sgInativo;
        obBloqueioTotal  : 
          Result := sgInativo;
      end;
    end else
      Result := sgInativo;
  end;      
end;

procedure TFrmPri.Capturar(var Message: TMessage);
var
  S: TMemoryStream;
  J: TJpegImage;
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    ScreenShot(B);
    J := TjpegImage.Create;
    try
      J.Assign(B);
      J.CompressionQuality := 60;
      J.Compress;
      S := TMemoryStream.Create;
      try
        J.SaveToStream(S);
        if CM.Ativo then
        try
          CM.SalvaTela(Message.WParam, S);
        except
        end;
      finally
        S.Free;
      end;
    finally
      J.Free;
    end;
  finally
    B.Free;
  end;
end;

procedure TFrmPri.ChecaEstadoMaq;
var NewStatus: Integer;
begin
  NewStatus := CalcStatus;
  if (NewStatus in [sgInativo, sgLoginCli]) and 
     (Status in [sgLoginFunc, sgConfig, sgConfirmaFechar]) then Exit;
  Status := NewStatus;
end;

procedure TFrmPri.CheckExplorerRunning;
var si : Tstartupinfoa;
    pi : TProcessInformation;
    H : HWND;
    PID : Cardinal;
    arrCh : Array[0..255] of char;
begin
  Inc(FCheckExpCnt);
  if (FExplorerPID=0) and ((FCheckExpCnt mod 5)<>0) then Exit;
  
  if FindWindow('Shell_TrayWnd', nil) = 0 then begin
    fillchar(si, sizeOf(si), 0);
    si.cb := sizeof(si);
    if CreateProcess(nil, 'explorer.exe', nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, si, pi) then 
    begin
      FExplorerPID := pi.dwProcessId;
      CloseHandle( pi.hProcess );
      CloseHandle( pi.hThread );    
    end;
  end else
  if FExplorerPID >0 then begin
    H := FindWindow('ExploreWClass', nil);
    GetWindowThreadProcessID(H, PID);
    if PID = FExplorerPID then begin
      GetClassName(H, arrCh, 255);
      if SameText('ExploreWClass', arrCh) then begin 
        PostMessage(H, WM_CLOSE, 0, 0);
        FExplorerPID := 0;
      end;
    end;
  end;
end;

procedure TFrmPri.FecharCMGuard;
begin
  Fechar := True;
  Close;
  if FShutOp in [1..3] then
    glShutOp := FShutOp;
  Status := sgFechar;
end;

procedure TFrmPri.SetStatus(Value: Integer);
var
  Antes, SaveStatus, P : Integer;
  U : TncUsuario;
  S : TncSessao;
begin
  SaveStatus := FStatus;
  if Value = FStatus then Exit;
  try
    DebugMsg('SetStatus - 1');
    Antes := FStatus;
    DebugMsg('SetStatus - 2');
    FStatus := Value;
    DebugMsg('SetStatus - 3');
    if Assigned(FrmAlteraSenha) then FrmAlteraSenha.Close;
    DebugMsg('SetStatus - 4');
    cmDesktop.Visible := ivNever;
    DebugMsg('SetStatus - 5');
    S := CM.SessaoMaq;
    DebugMsg('SetStatus - 6');
    if FStatus = sgSessao then
      cmEncerrar.Visible := ivAlways else
      cmEncerrar.Visible := ivNever;
  
    DebugMsg('SetStatus - 7');
    if (FStatus=sgSessao) and (S.TipoCli=tcManutencao) then
      cmFechar.Visible := ivAlways else
      cmFechar.Visible := ivNever;
  
    DebugMsg('SetStatus - 8');
    if not (FStatus in [sgSessao, sgPausaSessao]) then begin
      StatusSenha := ssObterSenha;
      SenhaCli := '';
      SenhaDig := '';
    end;  
    DebugMsg('SetStatus - 9');
    lvDesktop.Enabled := (FStatus = sgSessao);
    DebugMsg('SetStatus - 10');
    cmNomeCli.Visible := ivNever;
    DebugMsg('SetStatus - 11');
    cmAlterarSenha.Visible := ivNever;
    DebugMsg('SetStatus - 12');
    cmMaq.AllowClick := False;
    DebugMsg('SetStatus - 13');
    if Versoes.PodeUsar(idre_chat) and (gConfig.OpcaoChat<>ochDesabilitar) then begin
      DebugMsg('SetStatus - 14');
      cmChat.Visible := ivAlways;
      if SameText(cmChat.Caption, 'Mostrar CHAT') then
        spChat.Visible := False else
        spChat.Visible := True;
    end else begin
      DebugMsg('SetStatus - 15');
      cmChat.Visible := ivNever;
      spChat.Visible := False;
    end;
  
    case FStatus of
      sgInativo, sgTentaAtivar : begin
        if FStatus = sgInativo then
          ProxConn := GetTickCount + 20000 else
          ProxConn := GetTickCount + 1000;
        DebugMsg('TFrmPri.SetStatus - sgInativo, sgTentaAtivar');  
        FrmAtivo := FrmConn;
        DebugMsg('TFrmPri.SetStatis - sgInativo, sgTentaAtivar 2');
        FrmConn.AtualizaTela;
        if S<>nil then
          NivelProt := npSessao else
          NivelProt := npTotal;
      end;
     
      sgLoginFunc, sgConfig, sgConfirmaFechar  : begin
        DebugMsg('TFrmPri.SetStatus - sgLoginFunc, sgConfig, sgConfirmaFechar');
        FrmAtivo := FrmConn;
        FrmConn.AtualizaTela;
        if S<>nil then
          NivelProt := npSessao else
          NivelProt := npTotal;
        case FStatus of
          sgLoginFunc : FrmConn.edUsuario.SetFocus;
          sgConfig    : FrmConn.edMaquina.SetFocus;
          sgConfirmaFechar : FrmConn.btnSim.SetFocus;
        end;
      end;
      
      sgLoginCli   : begin
        DebugMsg('SetStatus - 16');
        spChat.Visible := (cmChat.Visible=ivAlways) and (gConfig.OpcaoChat=ochJanelaVisivel);
        DebugMsg('SetStatus - 17');
        if spChat.Visible then begin
          DebugMsg('SetStatus - 18');
          cmChat.Caption := 'Esconder CHAT';
          DebugMsg('SetStatus - 19');
          cmChat.LargeImageIndex := 5;
          DebugMsg('SetStatus - 20');
        end else begin
          DebugMsg('SetStatus - 21');
          cmChat.Caption := 'Mostrar CHAT';
          cmChat.LargeImageIndex := 6;
        end;
      
        DebugMsg('SetStatus - 22');
        FrmAtivo := FrmLogin;
        DebugMsg('SetStatus - 23');
        FrmConn.LimpaLoginInfo;
        DebugMsg('SetStatus - 24');
        ShowTaskBar;
        DebugMsg('SetStatus - 25');
        NivelProt := npTotal;
        DebugMsg('SetStatus - 26');
        if (Win32Platform = VER_PLATFORM_WIN32_NT) and
           (gConfig.PaginaInicial>'') then
          FProt.ForceIEStartPage(gConfig.PaginaInicial);
        DebugMsg('SetStatus - 27');
        if (Antes in [sgSessao, sgPausaSessao]) then FechaProgramas;
        DebugMsg('SetStatus - 28');
      end;
      
      sgSessao     : begin
        DebugMsg('SetStatus - 29');
        lvDesktop.SpecialRootFolder := sfDesktop;
        DebugMsg('SetStatus - 30');
        ShowTaskBar;
        DebugMsg('SetStatus - 31');
        AvisoCreditos := True;
        DebugMsg('SetStatus - 32');
        FrmAtivo := FrmPri;
        DebugMsg('SetStatus - 33');
        FrmConn.LimpaLoginInfo;
        DebugMsg('SetStatus - 34');
        FrmChat.RV.Clear;
        DebugMsg('SetStatus - 35');
        FrmChat.RV.Reformat;
        DebugMsg('SetStatus - 36');
        

        if spChat.Visible then begin
          P := spPri.Width - 190;
          with spPri.Bars[0] do if Position > P then Position := P;
        end;
        DebugMsg('SetStatus - 37');
        
        
        if (S<>nil) and (S.TipoCli=tcManutencao) then begin
          DebugMsg('SetStatus - 38');
        
          CodTipo := -1;
          DebugMsg('SetStatus - 39');
          NivelProt := npManut;
          DebugMsg('SetStatus - 40');
          if S=nil then
            U := nil else
            U := CM.Usuarios.PorUsername[S.FuncI];
          DebugMsg('SetStatus - 41');
          if (S<>nil) and (U<>nil) and CM.Permitido(U, daMaqFecharCMGuard) then
            cmFechar.Visible := ivAlways
          else
            cmFechar.Visible := ivNever;
          DebugMsg('SetStatus - 42');
  
          if CM.Permitido(U, daMaqConfigurar) then begin
            DebugMsg('SetStatus - 43');
            cmDesktop.Visible := ivAlways;
            DebugMsg('SetStatus - 44');
            cmMaq.AllowClick := True;
          end;  
          DebugMsg('SetStatus - 45');
        end else begin 
          DebugMsg('SetStatus - 46');
          NivelProt := npSessao;
          DebugMsg('SetStatus - 47');
          
  
          if S<>nil then 
            CodTipo := S.TipoAcesso;
          DebugMsg('SetStatus - 48');
            
  
          if gConfig.FiltrarWeb then
            BloqueiaSites(True);

          DebugMsg('SetStatus - 49');
            
  
          if (S<>nil) and (USessao<>S.ID) then begin
            DebugMsg('SetStatus - 50');
          
            USessao := S.ID;
//            wlInicio.Refresh(True);
            ShellStart(gConfig.AutoExecutar);
            DebugMsg('SetStatus - 51');
          end;
          
          DebugMsg('SetStatus - 52');
  
          if (S<>nil) and (S.Cliente<>0) then begin
            DebugMsg('SetStatus - 53');
            cmNomeCli.Caption := S.NomeCliente;
            DebugMsg('SetStatus - 54');
            if S.UsernameLogin>'' then
              cmNomeCli.Caption := S.NomeCliente + ' (' + S.UsernameLogin + ')';
            DebugMsg('SetStatus - 55');
            cmNomeCli.Visible := ivAlways;
            DebugMsg('SetStatus - 56');
            if gConfig.ClienteNaoAlteraSenha then 
              cmAlterarSenha.Visible := ivNever else
              cmAlterarSenha.Visible := ivAlways;
            DebugMsg('SetStatus - 57');
            SenhaCli := S.SenhaLogin;
            DebugMsg('SetStatus - 58');
            if StatusSenha = ssObterSenha then 
              StatusSenha := ssSenhaObtida;
            DebugMsg('SetStatus - 59');
            if (SenhaCli='') and (StatusSenha=ssSenhaObtida) and (not gConfig.NaoObrigarSenhaCliente) then begin
              DebugMsg('SetStatus - 60');
              cmAlterarSenha.Caption := 'Criar Senha';
              DebugMsg('SetStatus - 61');
              if StatusSenha<>ssSenhaOK then cmAlterarSenhaClick(nil);
              DebugMsg('SetStatus - 62');
            end else
              cmAlterarSenha.Caption := 'Alterar Senha';
            DebugMsg('SetStatus - 63');
          end;    
        end;  
        DebugMsg('SetStatus - 64');
        RefreshDesktop;
        DebugMsg('SetStatus - LAST OK');
      end;
      
      sgPausaSessao: begin
        DebugMsg('TFrmPri.SetStatus - sgPausaSessao 1');  
        FrmAtivo := FrmPausa;
        DebugMsg('TFrmPri.SetStatus - sgPausaSessao 2');  
        FrmConn.LimpaLoginInfo;
        DebugMsg('TFrmPri.SetStatus - sgPausaSessao 3');  
        NivelProt := npTotal;
        DebugMsg('TFrmPri.SetStatus - sgPausaSessao 4');  
        ShowTaskBar;
        DebugMsg('TFrmPri.SetStatus - sgPausaSessao - LAST OK');  
      end;
      
      sgFechar     : begin
        DebugMsg('TFrmPri.SetStatus - sgFechar 1');  
        if FrmConta <> nil then FrmConta.Close;
        DebugMsg('TFrmPri.SetStatus - sgFechar 2');  
        NivelProt := npZero;
        DebugMsg('TFrmPri.SetStatus - sgFechar 3');  
        ShowTaskBar;
        DebugMsg('TFrmPri.SetStatus - sgFechar - LAST OK');  
      end;
    end;
  except 
    on E: Exception do begin
      DebugMsg('TFrmPri.SetStatus - E.ClassName: ' + E.ClassName + ' E.Message: ' + E.Message);
      FStatus := SaveStatus;
    end;
  end;
end;

procedure TFrmPri.CMRemProgressoArq(Perc: Integer; Etapa: Byte; NomeArq: string;
  Download: Boolean);
begin
  if (CM.TransferindoArq=taAtualizacao) then begin
    if (Etapa=2) and (Perc=100) then begin
      if Assigned(FrmConn) then begin
        FrmConn.PB.Visible := False;
        FrmConn.lbNovaVersao.Visible := False;
      end;
      if CM.Ativo then begin
        Fechar := True;
        CM.Ativo := False;
      end else
        FecharCMGuard;
//      ExecFile(ExtractFilePath(ParamStr(0))+'NNexGuard.EXE');
    end else if Assigned(FrmConn) then begin
      FrmConn.PB.Visible := False;
      FrmConn.lbNovaVersao.Visible := True;
      FrmConn.PB.Properties.Max := 100;
      FrmConn.PB.Position := Perc;
//      FrmConn.Repaint;
      FrmConn.PB.Repaint;
      FrmConn.lbNovaVersao.Repaint;
    end;  
  end;
end;

procedure TFrmPri.CMShutdown(Sender: TObject; Operacao: Byte);
begin
  FShutOp := Operacao;

  if FShutOp=0 then
    DesbloqTaskMgr := True;

  Fechar := True;

  if FPrintHookOk then begin
    FPrintHookOk := False;
    Inject(False, 'guardprintapi.dll');
  end;

  if ShieldInjOk then begin
    ShieldInjOk := False;
    Inject(False, 'guardshield.dll');
  end;

  TimerShutdown.Enabled := True;
end;

procedure TFrmPri.cmTempoClick(Sender: TObject);
var S: TncSessao;
begin
  Exit;
  
  if not gConfig.ClientePodeVerCred then Exit;
  
  S := CM.SessaoMaq;
  if S.Tarifador.TicksResPass>1000 then
    TFrmCreditos.Create(Self).Mostra(S);
end;

procedure TFrmPri.FormCreate(Sender: TObject);
var
  S : String;
  I: Integer;
begin
  if not HookAPI(kernel32, 'ExitProcess', @ExitProcessCallback, @ExitProcessNext) then begin
    I := Random(1560);
    if I=156 then Exit;
  end;
  

  GetMem(FBuf, 1024);
  FIPCOk := False;
  FExplorerPID := 0;
  DebugMsg('FormCreate 1');
  Caption := '';
  DebugMsg('FormCreate 2');
  ShowWindow(application.handle, SW_HIDE);
  DebugMsg('FormCreate 3');
  FIgnoreDoc := '';
  SysInfo := TLMDSysInfo.Create(Self);
  DebugMsg('FormCreate 4');
  SiteIE := '';
  DebugMsg('FormCreate 5');
  SiteFF := '';
  DebugMsg('FormCreate 6');
  FFaltamM := 0;
  DebugMsg('FormCreate 7');
  USalvaProgs := GetTickCount;
  DebugMsg('FormCreate 8');
  //  ThProgAtual := TThreadProgAtual.Create(False);
  FProxRecon := 0;
  DebugMsg('FormCreate 9');  FNivelProt := npZero;
  FStatus := sgIniciando;
  DebugMsg('FormCreate 10');
  try
    DebugMsg('FormCreate 11');
//    HS.Active := True;
    DebugMsg('FormCreate 12');
  except
  end;  
  DebugMsg('FormCreate 13');  FHosts := TStringList.Create;
  FWav := TLMDWaveComp.Create(Self);
  DebugMsg('FormCreate 14');
  FPrintHookOk := False;
  DebugMsg('FormCreate 15');  
  FPaginasImp := 0;
  DebugMsg('FormCreate 16');
  FCopias := 1;
  DebugMsg('FormCreate 17');
  FPrinter := '';
  DebugMsg('FormCreate 18');
  FDoc := '';
  DebugMsg('FormCreate 19');
  TimerTaskMgr.Enabled := (Win32Platform=VER_PLATFORM_WIN32_NT);
  DebugMsg('FormCreate 20');
  Application.OnMinimize := AoMinimizar;
  DebugMsg('FormCreate 21');
  Application.OnSettingChange := OnSettingChange;
  DebugMsg('FormCreate 22');
  AjustaTamanho;
  DebugMsg('FormCreate 23');
  try
    S := '';
    if FileExists(ArqUsuarios) then begin
      CM.Usuarios.LeArquivo(ArqUsuarios);
{      for I := 0 to CM.Usuarios.Count-1 do
        S := S + CM.Usuarios[I].Username + '|' + CM.Usuarios[I].Senha + '|' + sLineBreak;
      ShowMessage(S);                                                                    }
    end;  
  except
  end;
  DebugMsg('FormCreate 24');
  FStrTipo := 'Desktop';
  DebugMsg('FormCreate 25');
  FCodTipo := -1;
  DebugMsg('FormCreate 26');
  FConfigurouItensPerm := False;
  DebugMsg('FormCreate 27');
  FIni := TMemIniFile.Create('');
  DebugMsg('FormCreate 28');
  glShutOp := -1;
  DebugMsg('FormCreate 29');
  FProt := TncProtege98.Create(Self);
  DebugMsg('FormCreate 30');
  FProt.AutoStart(True);
  DebugMsg('FormCreate 31');
  FSaveH := -1;
  DebugMsg('FormCreate 33');
  FSaveW := -1;
  DebugMsg('FormCreate 34');
  FShutOp := -1;
  DebugMsg('FormCreate 35');
  FStatus := -1;
  DebugMsg('FormCreate 36');
  FslMenu     := TStringList.Create;
  FProgAtual := '';
  FSiteAtual := '';
  DebugMsg('FormCreate 37');
  FStayOnTopOff := SameText(slConfig.Values['OkEdgePlayThe'], 'blues');
  DebugMsg('FormCreate 38');  
  DebugAtivo := SameText(slConfig.Values['Debug'], 'S');
  DebugMsg('FormCreate 39');
  Reply_Timeout := StrToIntDef(slConfig.Values['Timeout'], 23) * 1000;
  DebugMsg('FormCreate 40');
  if DebugAtivo then begin
    DebugMsg('FormCreate 41');
    FStayOnTopOff := True;
  end;
    
  if FStayOnTopOff then 
    StopExtraProt := True; 
    
  DebugMsg('FormCreate 42');  
  cmMaq.Caption := 'Máq. ' + slConfig.Values[NomeMaq];
  DebugMsg('FormCreate 43');
  FExes := TStringList.Create;
  DebugMsg('FormCreate 44');
  LoadExes;
//  lvDesktop.SpecialRootFolder := sfDesktop;
  DebugMsg('FormCreate 45');
  tmFirstConn.Enabled := True;
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
  UnhookApi(@ExitProcessNext);
  FreeMem(FBuf, 1024);
{  try
    ThProgAtual.Terminate;
  except
  end;  }
  if FPrintHookOk then
    Inject(False, 'guardprintapi.dll');

  if ShieldInjOk then
    Inject(False, 'guardshield.dll');
    
  FExes.Free;
  FslMenu.Free;
  FHosts.Free;
  if DesbloqTaskMgr then
    FProt.BloqueiaCtrlAltDel := False;
  FProt.DesativaProtecao;
  FProt.Free;
  FreeAndNil(FIni);
end;

procedure TFrmPri.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not lvDesktop.Focused then Exit;
  
  if Key=37 then
    Key := 38
  else
  if Key=38 then
    Key := 37
  else
  if Key=40 then
    Key := 39
  else
  if Key=39 then
    Key := 40;   
end;

procedure TFrmPri.CMAoDesativar(Sender: TObject);
begin
  CalcReconectar;
  if Fechar or (FNoNet=obFecharCMGuard) then
    FecharCMGuard else 
    ChecaEstadoMaq;
end;

procedure TFrmPri.tmWinListTimer(Sender: TObject);
var Maq : TncMaquina;
begin
  AjustaTamanho;
  tmWinList.Enabled := False;
  try
    if not CM.Ativo then begin
      CMAoDesativar(nil);
      Exit;
    end;
    if not (Status in [sgLoginCli, sgSessao, sgPausaSessao]) then begin
      DebugMsg('TFrmPri.tmWinListTimer - ' + StringStatus);
      Exit;
    end;
  
    if (CM.AppUrlLog.Count>0) then
      CM.SalvaAppUrlLog 
    else
    if (GetTickCount - CMRem.TicksLastCom)>=9000 then begin
      if CMRem.KeepAlive<>0 then begin
        try
          CM.Ativo := False;
        finally
          CMAoDesativar(nil);
        end;
      end;
    end;
  finally
    tmWinList.Enabled := True;
  end;
end;

procedure TFrmPri.ShutQueryShutdown(Sender: TObject;
  var CanShutdown: Boolean);
begin
  CanShutdown := True;
end;

procedure TFrmPri.spDesktopResize(Sender: TObject);
begin
  RefreshDesktop;
end;

procedure TFrmPri.tmPiscaTempoTimer(Sender: TObject);
begin
{  if cmTempo.Color = CorNormal then
    cmTempo.Color := CorPisca
  else
    cmTempo.Color := CorNormal;}
end;

procedure TFrmPri.tmAvisoTempoTimer(Sender: TObject);
begin
  tmAvisoTempo.Enabled := False;
  FDesligaAviso := True;
end;

procedure TFrmPri.cmEnc2Click(Sender: TObject);
var S : TncSessao;
begin
  S := CM.SessaoMaq;

  with CM do
  if (S<>nil) and (not S.Encerrou) then begin
    if S.TipoCli=tcManutencao then begin
      if Ativo then
        LogoutMaq(Maquina);
    end else begin
      if Ativo then
        PreLogoutMaq(Maquina);
      if TFrmConta.Create(Self).Confirma(cmTempo.Caption, cmValor.Caption) then
      begin
        if Ativo then
        try
          LogoutMaq(Maquina)
        except
        end;

{       if not Ativo then 
          Status := stConectado;}
      end else
      if Ativo then
        CancLogoutMaq(Maquina);
    end;
  end;
end;

procedure TFrmPri.cmEncerrarClick(Sender: TObject);
begin
  with TTimer.Create(Self) do begin
    Interval := 100;
    OnTimer := TimerEncerrar;
    Enabled := True;
  end;
end;

procedure TFrmPri.cmFecharClick(Sender: TObject);
begin
  CM.Ativo := False;
  FProt.BloqueiaCtrlAltDel := False;
  DesbloqTaskMgr := True;
  FecharCMGuard;
end;

procedure TFrmPri.cmDesktopClick(Sender: TObject);
begin
  FslMenu.Text := TFrmDesktop.Create(Self).ConfiguraDesktop(FslMenu.Text);
  FIni.SetStrings(FslMenu);
end;

procedure TFrmPri.SetCodTipo(const Value: Integer);
var 
  SI : TStShellItem;
begin
  if FCodTipo=Value then Exit;
  FStrTipo := 'Desktop'+IntToStr(Value);
  FCodTipo := Value;
  FConfigurouItensPerm := FIni.ReadBool('Geral', 'Configurado', False);
  try lvDesktop.Refresh; except end;
  
//  SC := TStShortCut.Create(Self);
  try
    SI := AchaDisplayName('Internet Explorer');
    if SI=nil then 
      FPodeNavegar := False
    else 
      FPodeNavegar := (CodTipo<0) or (FIni=nil) or 
                      FIni.ReadBool(StrTipo, SI.Path, False) or
                      (not FIni.ReadBool('Geral', 'Configurado', False));

{    LB.Items.Clear;                      
    with lvDesktop, ShellItems do                   
    for I := 0 to pred(Count) do with ShellItems[I] do
    if IsLink then begin
      SC.ShortcutFileName := Path;
      if SC.ResolveShortcut then begin
        LB.Items.Add('Descr='+SC.Description+' Dest='+SC.DestinationDir+' FileName= '+SC.FileName);
        LB.Items.Add('');
      end;  
    end;}
    
  finally
//    SC.Free;
  end;                        
end;

procedure TFrmPri.lvDesktopFilterItem(Sender: TObject;
  ShellItem: TStShellItem; var Accept: Boolean);
var 
  ItemPode: Boolean;
  S, SPath: String;
begin
  S := StrTipo;
  SPath := ShellItem.Path;
  ItemPode := (FIni=nil) or FIni.ReadBool(S, SPath, False);
  Accept := (CodTipo<0) or ItemPode or (not FConfigurouItensPerm);
end;

procedure TFrmPri.CMAoAtualizarConfig(Sender: TObject);
begin
  RefreshRestr;
  BloqueioSitesAtivo := gConfig.FiltrarWeb and (Status = sgSessao);
end;

procedure TFrmPri.RefreshRestr;
var S: TncSessao;
begin
//  if FFundoTela='' then
  lvDesktop.Color := gConfig.CorDesktop;

  TempoSumir := gConfig.TempoSumirLogin * 1000;

  lvDesktop.Font.Color := gConfig.CorFDesktop;
  FNoNet      := gConfig.NoNet;
  FFecharExp  := gConfig.BloqMenuIniciar;
  FMostraCron := not gConfig.EsconderCronometro;
  with bdcPri do 
  case gConfig.AlinhaBarraGuard of
    0 : Align := dalTop;
    1 : Align := dalBottom;
    2 : Align := dalLeft;
    3 : Align := dalRight;
  end;
  FrmLogin.RefreshTipoAcesso;

  S := CM.SessaoMaq;

  if (S<>nil) then
    AjustaVisEncerrar(S.TipoCli, S.Cliente);
end;

procedure TFrmPri.lvDesktopItemDblClick(Sender: TObject;
  Item: TStShellItem; var DefaultAction: Boolean);
begin
  DefaultAction := False;
  Item.Execute;
end;

procedure TFrmPri.lvDesktopKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=13) and (lvDesktop.SelectedItem<>nil) then
    lvDesktop.SelectedItem.Execute;
end;

function TFrmPri.ArqUsuarios: String;
begin
  Result := SysInfo.WinSysPath + 'cmu.dat';
end;

procedure TFrmPri.tmFirstConnTimer(Sender: TObject);
begin
  if CM.Ativo then Exit;
  if not tmFirstConn.Enabled then Exit;
  DebugMsg('TFrmPri.FirstConnTimer');
  tmFirstConn.Enabled := False;
  AutoIP.Active := False;
  AutoIP.Active := True;
  wlInicio.Refresh(True);
  if wlInicio.ExeRunning('NexAdmin.Exe') then
    Caption := 'Running';
  
  if (slConfig.Values['Servidor']='') or (slConfig.Values[NomeMaq]='') then
    Status := sgConfig else 
    Status := sgTentaAtivar;
  DebugMsg('TFrmPri.FirstConnTimer - OK');  
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

procedure TFrmPri.AjustaVisEncerrar(aTipoCli, aCliente: Integer);
begin
  if (aTipoCli=tcManutencao) or 
     ((aCliente>0) and (not gConfig.CliCadNaoEncerra)) or 
     ((aCliente=0) and (not gConfig.CliAvulsoNaoEncerra)) 
  then
    cmEncerrar.Visible := ivAlways else
    cmEncerrar.Visible := ivNever;
end;

procedure TFrmPri.OnForcarFechamento(Sender: TObject);
begin
  try
    FechaProgramas(True);
  finally
    Sender.Free;
  end;
end;

procedure TFrmPri.OnSetFormAtivo(Sender: TObject);
var 
  S: String;
  Value : TFormBaseGuard;
begin
  Value := TFormBaseGuard(TTimer(Sender).Tag);
  try
    S := '';
    try
      if Value<>nil then 
        S := Value.Name else
        S := 'nil';
    except
    end;
  
    DebugMsg('FormAtivo 1');
    if Value <> FrmLogin then  FrmLogin.Esconder;
    DebugMsg('FormAtivo 2');
    if Value <> Self     then  Self.Esconder;
    DebugMsg('FormAtivo 3');
    if Value <> FrmConn  then  FrmConn.Esconder;
    DebugMsg('FormAtivo 4');
    if Value <> FrmPausa then  FrmPausa.Esconder;
    DebugMsg('FormAtivo 5');
    if Value<>nil then Value.Mostrar;
    DebugMsg('FormAtivo OK');
  finally
    Sender.Free;
  end;
end;

procedure TFrmPri.OnSettingChange(Sender: TObject; Flag: Integer;
  const Section: string; var Result: Integer);
begin
  AjustaTamanho;
end;

procedure TFrmPri.FormShow(Sender: TObject);
var 
  P: Integer;
  ExWindowStyle : Cardinal;
begin
  ExWindowStyle := GetWindowLong(Handle, GWL_EXSTYLE);
  SetWindowLong(Handle, GWL_EXSTYLE, ExWindowStyle or
      WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
        
  AjustaTamanho;
  Application.Restore;
  if FrmChat= nil then begin
    FrmChat := TFrmBaseChat.Create(Self);
    FrmChat.NumMaq := CM.Maquina;
    FrmChat.panPri.Parent := spChat;
    FrmChat.EnviarMsg := EnviarMsg;
    FrmChat.MudouAtencao := MudouAtencao;
    FrmChat.NaoPiscar := True;
  end;
  P := spPri.Width - 190;
  spPri.Bars[0].Position := P;
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
  if (CM=nil) or (CM.SessaoMaq=nil) or FProt.BloqueiaCtrlAltDel then begin
    H := FindWindow('#32770', 'Gerenciador de tarefas do Windows');
    if H = 0 then
      H := FindWindow('#32770', 'Windows Task Manager');
    if H > 0 then 
      PostMessage(H, WM_CLOSE, 0, 0) else
  end;
end;
    
procedure TFrmPri.LoadExes;
begin
  Exit;
  FExes.Clear;
  SE.Execute;
end;

procedure TFrmPri.SEEnumItem(Sender: TObject;
  ShellItem: TStShellItem; var Accept: Boolean);
var S: String;  
begin
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
  case FMotivoPausa of
    mpPausaFimTempo : Result := 'Tempo Esgotado';
    mpPausaAdmin    : Result := 'Máquina pausada pelo Administrador';
    mpPausaHorarioNP: Result := 'Máquina pausada por estar em horário de uso não permitido';
    mpPausaEncerrar : Result := 'Confirma encerramento do acesso';
  else
    Result := '';    
  end;
end;

procedure IpcPrintMessageCallback(name: pchar; messageBuf: pointer; messageLen: dword;
                                  answerBuf: pointer; answerLen: dword); stdcall;
begin
  // forward the ipc message to the form
  SendMessage(FrmPri.Handle, WM_USER + 777, integer(messageBuf), $777);
end;

function SoDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

procedure TFrmPri.HandlePrintNotification(var Message: TMessage);
var 
  S, sProc : String;
  P : Integer;
begin
  // was it really a message from our dll?
  DebugMsg('');
  DebugMsg('----- PrintNotification -----------------------------------------------------------');
  
  if Message.lParam <> $777 then begin
    DebugMsg('PRINTAPI: INVALID MESSAGE *****************');
    Exit;
  end;
  
  with TPrintNotification(pointer(Message.wParam)^) do 
  if (POS('SPOOL', UpperCase(ExtractFileName(process)))<>1) then begin
    S := UpperCase(Trim(api));
    DebugMsg('PRINTAPI/API='+S);
    DebugMsg('PRINTAPI/PROCESS='+Process);
    DebugMsg('PRINTAPI/PARAMS='+Params);
    DebugMsg('PRINTAPI/RESULT='+Result);
    sProc := UpperCase(Process);
    if Pos('CREATEDC', S)=1 then begin
      FPrinter := Copy(Params, Pos('"', Params)+1, 255);
      FPrinter := Copy(FPrinter, 1, Pos('"', FPrinter)-1);
    end else
    if Pos('STARTDOC', S)=1 then begin
      P := Pos('output: "', Params);
      if (P > 0) then begin
        S := Params;
        Delete(S, 1, P);
        Delete(S, 1, Pos('"', S));
        S := Copy(S, 1, Pos('"', S)-1);
        if (Pos('.tmp', S)>0) or 
           ((Trim(S)>'') and 
            (Pos('\SPOOL\DRIVERS\', UpperCase(Process))>0)) then 
        begin
          S := Params;
          Delete(S, 1, Pos('$', S)-1);
          FIgnoreDoc := Copy(S, 1, Pos(';', S)-1);
          DebugMsg('FIgnoreDoc='+FIgnoreDoc);
        end;
      end;
      FDoc := Copy(Params, Pos('"', Params)+1, 255);
      FDoc := Copy(FDoc, 1, Pos('"', FDoc)-1);
      FCopias := 1;
      DebugMsg('StartDOC - Copias = 1');
    end else
    if Pos('ENDPAGE', S)=1 then begin
      if (FIgnoreDoc='') or (Pos(FIgnoreDoc, Params)=0) then begin
        if Pos('EXCEL.EXE', sProc)<1 then
          Inc(FPaginasImp);
        DebugMsg('END-PAGE - PaginasImp = '+IntToStr(FPaginasImp));
      end;
    end else
    if Pos('STARTPAGE', S)=1 then begin
      if (FIgnoreDoc='') or (Pos(FIgnoreDoc, Params)=0) then begin
        if Pos('EXCEL.EXE', sProc)>0 then
          Inc(FPaginasImp);
        DebugMsg('START-PAGE - PaginasImp = '+IntToStr(FPaginasImp));
      end;
    end else
    if Pos('DOCPROP', S)=1 then begin
      FCopias := StrToIntDef(SoDig(S), 1);
      DebugMsg('DOCPROP - Copias = '+IntToStr(FCopias));
    end else
    if (Pos('ENDDOC', S)=1) or (Pos('ABORTDOC', S)=1) then begin
      if Pos(FIgnoreDoc, Params)>0 then FIgnoreDoc := '';
      if (FPaginasImp>0) then
      if CM.Ativo then
      try
        DebugMsg('PaginasImpressas = '+IntToStr(FPaginasImp*FCopias));
        CM.PaginasImpressas(CM.Maquina, FPaginasImp*FCopias, FPrinter, FDoc);
      except
      end;  
      FPaginasImp := 0;
      FDoc := '';
      FCopias := 1;
      FPrinter := '';
    end;  
  end;     
end;

procedure RemoveDriverHook;
var 
  S: String;
  SI : TLMDSysInfo;
begin
  SI := TLmdSysInfo.Create(nil);
  try
    S := SI.WinSysPath+'\hookinst.sys';
    if UninstallMadCHook and FileExists(S) then
      DeleteFile(S);
  finally
    SI.Free;
  end;      
end;

procedure TFrmPri.Hook;
begin
  if gConfig.ControlaImp<1 then begin
    DebugMsg('Configurado para não controlar impressões ' + IntToStr(gConfig.ControlaImp));
    Exit;
  end;
  if FPrintHookOk then begin
    DebugMsg('Hook já está OK');
    Exit;
  end;
  TimerHook.Enabled := False;

//  if (Win32Platform <> VER_PLATFORM_WIN32_NT) and (not gConfig.RegImp98) then Exit;
  // create an ipc message queue, so that our hook dll can contact us
  if not FIPCOk then
  if not CreateIpcQueue(pchar('guardPrintMonitor' + IntToStr(GetCurrentSessionId)),
                        IpcPrintMessageCallback) then begin
    TimerHook.Enabled := True;
    DebugMsg('Falha em CreateIpcQueue');
    Exit;
  end else begin
    FIPCOk := True;
    DebugMsg('CreateIPCQueue OK');
  end;
    
  // the main work is done by our dll
  // which we inject into all processes in our session
  FPrintHookOk := Inject(True, 'guardprintapi.dll');
  if not FPrintHookOk then begin
    TimerHook.Enabled := True;
    DebugMsg('inject failed '+IntToStr(GetLastError));
  end else
    DebugMsg('Hook injected OK');
end;

function TFrmPri.NomeMaq: String;
begin
  Result := SysInfo.Environment.Values['SESSIONNAME'];
  if Pos('hydrapark', Result)=0 then begin
    Result := SysInfo.Environment.Values['CLIENTNAME'];
    if Result='' then
      Result := 'Maquina';
  end;    
end;

procedure TFrmPri.nxTCPIPConnectionLost(aSender: TnxBaseTransport;
  aSessionID: TnxSessionID);
begin
  inherited;
  CM.Ativo := False;
end;

procedure TFrmPri.MostraAviso;
var 
  S: String;
  AvisoTexto : String;
  Tipo, TamBlob : Integer;
  PiscarAvisoTexto : Boolean;
begin     
  try                   
    if FaltamM < 1 then Exit;
    if CM.Avisos.Locate('Minutos', FaltamM, []) then begin
      FUAviso := GetTickCount;
      Tipo := Cm.Avisos.FieldByName('Tipo').AsInteger;                   
      if (Tipo in [0, 2]) and (CM.Avisos.FieldByName('AvisoTexto').AsString > '') then
        FrmAviso.Mostrar(CM.Avisos.FieldByName('AvisoTexto').AsString, 
                         CM.Avisos.FieldByName('SegAvisoTexto').AsInteger,
                         CM.Avisos.FieldByName('PiscarAvisoTexto').AsBoolean);
      if (Tipo in [1..2]) then with TBlobField(CM.Avisos.FieldByName('Som')) do begin
        TamBlob := BlobSize;
        if TamBlob > 0 then       
        try
          S := ExtractFilePath(ParamStr(0))+'temp.wav';
          SaveToFile(S);
          FWav.LoadFromFile(S);
          FWav.Play;
        except 
        end;    
      end;  
    end;
  except
  end;
end;

function TFrmPri.StayOnTopOFF: Boolean;
begin
  Result := FStayOnTopOFF;
end;

procedure TFrmPri.cmAlterarSenhaClick(Sender: TObject);
var 
  S: String;
  Sessao: TncSessao;
  Pag: Integer;
begin
  try
    Sessao := CM.SessaoMaq;

    if (SenhaCli='') and (SenhaDig>'') then begin
      Pag := 2;
      S := SenhaDig;
    end else begin
      S := SenhaCli;
      if S='' then
        Pag := 1 else
        Pag := 0;
    end;    
     
    S := TFrmAlteraSenha.Create(nil).Editar(S, Pag);
    if (Sessao<>nil) and (S<>SenhaCli) and (S>'') then begin
      CM.SalvaSenhaCli(Sessao.Cliente, S);
      SenhaDig := '';
      SenhaCli := S;
      if SenhaCli='' then
        cmAlterarSenha.Caption := 'Criar uma Senha de Acesso' else
        cmAlterarSenha.Caption := 'Alterar Senha de Acesso';
    end;    
  finally
    StatusSenha := ssSenhaOK;
  end;    
end;

procedure TFrmPri.TimerDesktopTimer(Sender: TObject);
begin
  TimerDesktop.Enabled := False;
  if FileExists(ArqImFundo) then begin 
    DebugMsg('TimerDesktop ' + ArqImFundo);
    SetListViewBkImage(lvDesktop, ArqImFundo);
  end else begin
    DebugMsg('TimerDesktop Não Existe ' + ArqImFundo);
    if (CM.NomeArqDesktop>'') then begin
      if FileExists(CM.NomeArqDesktop) then begin
        DebugMsg('TimerDesktop 2: ' + CM.NomeArqDesktop);
        SetListViewBkImage(lvDesktop, CM.NomeArqDesktop);
      end else
        DebugMsg('TFrmPri.TimerDesktopTimer - CM.NomeArqDesktop: '+CM.NomeArqDesktop+' não existe!');
    end else 
      DebugMsg('TFrmPri.TimerDesktopTime - CM.NomeArqDesktop em branco');
  end;
end;

procedure TFrmPri.TimerEncerrar(Sender: TObject);
var S : TncSessao;
begin
  try
    S := CM.SessaoMaq;

    with CM do
    if (S<>nil) and (not S.Encerrou) then begin
      if S.TipoCli=tcManutencao then begin
        if Ativo then
          LogoutMaq(Maquina);
      end else begin
        if Ativo then
          PreLogoutMaq(Maquina);
      end;
    end;
  finally
    Sender.Free;
  end;
end;

procedure TFrmPri.TimerHookTimer(Sender: TObject);
begin
  Hook;
end;

procedure TFrmPri.TimerLoginTimer(Sender: TObject);
begin
  TimerLogin.Enabled := False;
  FrmLogin.RefreshFundo;
end;

procedure TFrmPri.CMAoMudarFundo(Desktop: Boolean);
begin
  if Desktop then 
    TimerDesktop.Enabled := True
  else
    TimerLogin.Enabled := True;
end;

procedure TFrmPri.EnviarMsg(const aPara: Integer; const aTexto: String);
begin
  CM.EnviaChat(aPara, aTexto);
end;

procedure TFrmPri.CMAoReceberChat(Sender: TObject; MsgID, De,
  Para: Integer; DataHora: TDateTime; Texto: String);
begin
  if FrmChat <> nil then
  begin
    if spChat.Visible = False then
      cmChatClick(nil);
    FrmChat.MsgEnv(DataHora, De, Para, Texto);
  end;
end;

procedure TFrmPri.panHChatClick(Sender: TObject);
begin
  FrmChat.meTexto.SetFocus;
end;


procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  StopExtraProt := True;
end;

procedure TFrmPri.TimerChatTimer(Sender: TObject);
begin
  with panHChat do
  if Color=clYellow then
    Color := clBtnFace else
    Color := clYellow;
end;

procedure TFrmPri.MudouAtencao(Sender: TObject);
begin
  if FrmChat.Atencao then
    TimerChat.Enabled := True
  else begin
    TimerChat.Enabled := False;
    panHChat.Color := clBtnFace;
  end;  
end;

procedure TFrmPri.CMAoAtualizarSessao(Sender: TObject);
var S : TncSessao;
begin
  S := TncSessao(Sender);
  if (S.TipoCli<>tcManutencao) and 
     (Status in [sgSessao, sgPausaSessao]) and 
      S.PermitirDownload <> 
     (not FProt.GetOpcaoBool(ncp_NoDownload)) 
  then
    TncProtege98(FProt).PermitirDownload(S.PermitirDownload);
  ChecaEstadoMaq;
end;

procedure TFrmPri.CMAoAtualizarTarifa(Sender: TObject);
var  I : Integer;
begin
  for I := 0 to CM.Sessoes.Count-1 do begin
    CM.Sessoes[I].Tarifador.IDTipoAcesso := -1;
    CM.Sessoes[I].Tarifador.IDTipoAcesso := CM.Sessoes[I].TipoAcesso;
    CM.Sessoes[I].Tarifador.Reset;
  end;
end;

procedure TFrmPri.CMAoAtivar(Sender: TObject);
begin
  Reconectar := False;
  tmCronometro.Enabled := True;
end;

procedure TFrmPri.cmChatClick(Sender: TObject);
begin
  if spChat.Visible then begin
    spChat.Visible := False;
    cmChat.Caption := 'Mostrar CHAT';
    cmChat.LargeImageIndex := 6;
  end else begin
    spChat.Visible := True;
    cmChat.Caption := 'Esconder CHAT';
    cmChat.LargeImageIndex := 5;
  end;
end;

function TFrmPri.GetAutoServName: String;
var I : Integer;
begin
  Result := '';
  if SameText(slConfig.Values['Servidor'], 'auto') then begin
    Result := slConfig.Values['UltimoServidor'];
    if (Trim(Result)>'') then begin
      I := AutoIP.DetectedAdvertisers.IndexOfIP(Result);
      if I=-1 then
       I := AutoIP.DetectedAdvertisers.IndexOfComputerName(Result);
      if I>=0 then
        Result := AutoIP.DetectedAdvertisers[I].IPAddress else
        Result := '';
    end;
    if (Result='') and (AutoIP.DetectedAdvertisers.Count>0) then
      Result := AutoIP.DetectedAdvertisers[0].IPAddress else
      Result := Trim(slConfig.Values['UltimoServidor']);
  end else
    Result := slConfig.Values['Servidor'];
end;

procedure TFrmPri.AutoIPNewAdvertiserDetected(Sender: TObject);
begin
  FrmConn.RefreshConexao;
end;

procedure TFrmPri.CMAoFinalizaProcesso(Sender: TObject;
  ProcessID: Integer);
var I: integer;  
begin
  DebugMsg('TFrmPri.CMAoFinalizarProcesso - ProcessID = ' + IntToStr(ProcessID));
  FechaProc(ProcessID);
  WL.Refresh(False);
  for I := 0 to WL.Count-1 do 
  if WL.Windows[I]^.ProcessID=ProcessID  then 
    FecharPorWM(WL.Windows[I]^.WinHandle, True, True, True);
end;

procedure TFrmPri.CMAoObtemProcessos(Sender: TObject; IDCliente,
  Request: Integer);
var 
  SL : TStringList;  
  P : TDAProcess;
  I : Integer;
begin
  P := EnumProcesses;
  SL := TStringList.Create;
  try
    for I := 0 to High(P) do 
      SL.Add(IntToStr(P[I].id) + '=' + ExtractFileName(P[I].exeFile));
    CM.SalvaProcessos(IDCliente, Request, SL);  
  finally
    SL.Free;
  end;    
end;

procedure TFrmPri.CMAoPedirTela(Sender: TObject; SessionID: Integer);
begin
  PostMessage(Handle, WM_USER + 778, SessionID, 0);
end;

procedure TFrmPri.BloqueiaSites(aLeHosts: Boolean);
var I: integer;
begin
  if aLeHosts then LeHosts;
  DesbloqueiaSites(False, False);
  if Trim(CM.SitesBloq.Text)>'' then begin
    FHosts.Add('#inicio_nexcafe');
    for I := 0 to CM.SitesBloq.Count-1 do 
      FHosts.Add(CM.SitesBloq[I]);
    FHosts.Add('#fim_nexcafe');  
  end;
  SalvaHosts;
end;

procedure TFrmPri.DesbloqueiaSites(aLeHosts, aSalvaHosts: Boolean);
var 
  S: String;
  I: Integer;
begin
  if aLeHosts then LeHosts;
  S := FHosts.Text;
  I := Pos('#inicio_nexcafe', S);
  if I > 0 then begin 
    Delete(S, I, Length(S));
    FHosts.Text := S;
    if aSalvaHosts then SalvaHosts;
  end;  
end;

procedure TFrmPri.cmVerCreditosClick(Sender: TObject);
begin
//  cmTempoClick(nil);
end;

procedure TFrmPri.dxBarButton2Click(Sender: TObject);
begin
  AvisoCreditos := False;
  bmCreditos.Visible := False;
end;

procedure TFrmPri.LeHosts;
begin
  if FileExists(HostsFN) then 
    FHosts.LoadFromFile(HostsFN) else
    FHosts.Clear;
end;

procedure TFrmPri.SalvaHosts;
begin
  try
    FHosts.SaveToFile(HostsFN);
  except
  end;
end;

function TFrmPri.HostsFN: String;
begin
  Result := SysInfo.WinSysPath+'\drivers\etc\hosts';
end;

procedure TFrmPri.CMAoBloquearSite(Sender: TObject; Adicionou: Boolean;
  URL: String);
begin
  if gConfig.FiltrarWeb then begin
    BloqueioSitesAtivo := False;
    BloqueioSitesAtivo := gConfig.FiltrarWeb and (Status = sgSessao);
  end;  
end;

procedure TFrmPri.CMAoChecaLic(Sender: TObject);
begin
  if gConfig.CodLojaInt>0 then
  try
    clilic_versao   := FrmLogin.VersaoStr;
    clilic_codequip := gConfig.CodEquip;
    clilic_qtdlic   := gCOnfig.QtdLic;
    clilic_codloja  := gConfig.CodLojaInt;
    clilic_notifyhandle := Handle;
    with TThreadAtualizaLic.Create(True) do begin
      FreeOnTerminate := True;
      Resume;
    end;
  except
  end;

end;

function TFrmPri.SemSenha: Boolean;
begin
  with FrmPri.CM.Usuarios do 
  Result := (Count=0) or
            ((Count=1) and SameText(Itens[0].Username, 'admin') and (Itens[0].Senha=''));
end;

procedure TFrmPri.SetBloqueioSitesAtivo(const Value: Boolean);
begin
  if FBloqueioSitesAtivo = Value then Exit;
  FBloqueioSitesAtivo := Value;
  if Value then 
    BloqueiaSites(True) else
    DesbloqueiaSites(True, True);
end;

procedure TFrmPri.HSCreatePostStream(ASender: TIdPeerThread;
  var VPostStream: TStream);
begin
{  with HS.ReplyTexts[0].Text do 
  VPostStream.WriteBuffer(Text[1], Length(Text));}
end;


function TFrmPri.GetFormAtivo: TFormBaseGuard;
begin
  if Assigned(FrmLogin) and FrmLogin.Visible then
    Result := FrmLogin else
    if Assigned(FrmConn) and FrmConn.Visible then
      Result := FrmConn else
      if Assigned(FrmPausa) and FrmPausa.Visible then
        Result := FrmPausa else
        Result := Self;
end;

procedure TFrmPri.SetFormAtivo(const Value: TFormBaseGuard);
var 
  S: String;
begin
    S := '';
    try
      if Value<>nil then 
        S := Value.Name else
        S := 'nil';
    except
    end;
  
    DebugMsg('FormAtivo 1 - S: '+S);
    if Value <> FrmLogin then  FrmLogin.Esconder;
    DebugMsg('FormAtivo 2');
    if Value <> Self     then  Self.Esconder;
    DebugMsg('FormAtivo 3');
    if Value <> FrmConn  then  FrmConn.Esconder;
    DebugMsg('FormAtivo 4');
    if Value <> FrmPausa then  FrmPausa.Esconder;
    DebugMsg('FormAtivo 5');
    if Value<>nil then Value.Mostrar;
    DebugMsg('FormAtivo OK');
end;

function TFrmPri.UsuarioOpOk(aUsername, aSenha: String;
  Op: Integer): String;
var U: TncUsuario;
begin
  Result := '';
  if SemSenha then Exit;
  
  with FrmPri.CM do
  try
    U := Usuarios.PorUsername[aUsername];
    if U = nil then
      Result := 'Nome de usuário inválido'
    else begin
      if not SameText(Copy(U.Senha, 1, 10), Copy(aSenha, 1, 10)) then
        Result := 'Senha inválida' else
      if not Permitido(U, Op) then
        Result := 'Você não tem permissão para executar essa operação.'; 
    end;    
  except
    On E: Exception do 
      Result := E.Message;
  end;
end;

procedure TFrmPri.Conectar(Reconexao: Boolean);
begin
  try
    _Conectar(Reconexao);
    DebugMsg('Conectou!');
  except
    on e: exception do begin
      DebugMsg('Erro Conectar: '+E.Message);
      UErroStr := E.Message;
      Raise;
    end;
  end;
end;

procedure TFrmPri.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.X := 0;
  Params.Y := 0;
  Params.Width := Screen.Width;
  Params.Height := Screen.Height;
end;

procedure TFrmPri.SetNivelProt(const Value: Byte);
var 
  S: TncSessao;
  U: TncUsuario;
begin
  if Value = FNivelProt then Exit;
  FProt.BloqueiaCtrlAltDel := gConfig.BloqCtrlAltDel;

  case Value of
    npZero   : begin
      FProt.NoStartMenu := False;
      FProt.BloqueiaCtrlAltDel := not DesbloqTaskMgr;
      FProt.DesativaProtecao;
      BloqueioSitesAtivo := False;
    end;  
    
    npSessao : begin
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao);');
      if gConfig.BloqBotaoDir then 
        lvDesktop.Options := lvDesktop.Options - [loShellMenu] else
        lvDesktop.Options := lvDesktop.Options + [loShellMenu];
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 1');
      try
        RefreshDesktop;
        lvDesktop.Refresh;
      except
      end;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 2');
      S := CM.SessaoMaq;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 3');

      if (S<>nil) then AjustaVisEncerrar(S.TipoCli, S.Cliente);
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 4');
      FProt.NoStartMenu := gConfig.BloqMenuIniciar;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 5');
      BloqueioSitesAtivo := gConfig.FiltrarWeb;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 6');
      FUAviso := GetTickCount;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 7');
      TFrmFake.Create(Self).ShowModal;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 8');
      tmAvisoTempo.Interval := DateTimeToSegundos(gConfig.TempoMaxAlerta) * 1000;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 9');
      FProt.SetOpcaoBool(ncp_noAltTab, False);
      FProt.SetOpcaoBool(ncp_noCtrlAltDel , gConfig.BloqCtrlAltDel);
      FProt.SetOpcaoBool(ncp_noAltEsc, False);
      FProt.SetOpcaoBool(ncp_noWinkeys , gConfig.BloqBotaoDir);
      FProt.SetOpcaoBool(ncp_noTaskbar, False);
      FProt.SetOpcaoBool(ncp_noDesktop , True);
      FProt.SetOpcaoBool(ncp_noTaskLinks , True);
      FProt.SetOpcaoBool(ncp_noTaskTray , gConfig.BloqTray);
      FProt.SetOpcaoBool(ncp_NoDownload, gConfig.BloqDownload);
      FProt.SetOpcaoBool(ncp_NoCtrlPanel, gConfig.BloqPainelCtrl);
      FProt.SetOpcaoBool(ncp_NoRunCmd, gConfig.BloqExecutar);
      FProt.SetOpcaoBool(ncp_NoNetwork, gConfig.BloqMeusLocaisRede);
      FProt.SetOpcaoBool(ncp_NoRightClick, gConfig.BloqBotaoDir);
      FProt.NoStartMenu := gConfig.BloqMenuIniciar;
      FProt.HideDrives := gConfig.EsconderDrives;
      FProt.BloqueiaCtrlAltDel := gConfig.BloqCtrlAltDel;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 10');
      FProt.AtivaProtecao;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 11');
      Timer1.Enabled := True;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - LAST;');
    end;
    
    npManut  : begin
     lvDesktop.Options := lvDesktop.Options + [loShellMenu];
    
     DebugMsg('npManut');
      TFrmFake.Create(Self).ShowModal;
      FProt.NoStartMenu := False;
      if Assigned(CM) then
        S := CM.SessaoMaq else
        S := nil;
        
      U := CM.Usuarios.PorUsername[S.FuncI];
      if gConfig.BloqCtrlAltDel and (U<>nil) and (not U.Admin) and (not CM.Permitido(U, daMaqFecharCMGuard)) then begin
        FProt.BloqueiaCtrlAltDel := True;
        FProt.DesprotegeTudo;
        FProt.AtivaProtecao;
        DebugMsg('Entrou em BloquearCtrlALtDel');
      end else begin
        FProt.BloqueiaCtrlAltDel := False;
        DebugMsg('Entrou em Desbloquear Ctrl-Alt-Del');
        FProt.DesativaProtecao;
      end;
        
      Timer1.Enabled := True;
    end;
    
    npTotal  : begin
      DebugMsg('TFrmPri.SetNivelProt - 1');
      FProt.BloqueiaCtrlAltDel := (not CM.Ativo) or gConfig.BloqCtrlAltDel;
      DebugMsg('TFrmPri.SetNivelProt - 2');
      FProt.ProtegeTudo;
      DebugMsg('TFrmPri.SetNivelProt - 3');
      FProt.NoStartMenu := True;
      DebugMsg('TFrmPri.SetNivelProt - 4');
      FProt.AtivaProtecao;
      DebugMsg('TFrmPri.SetNivelProt - 5');
      Timer1.Enabled := True;
      DebugMsg('TFrmPri.SetNivelProt - 6');
    end;
  end;

  FNivelProt := Value;
end;

function TFrmPri.GetReconectar: Boolean;
begin
  Result := (FProxRecon>0);
end;

procedure TFrmPri.SetReconectar(const Value: Boolean);
begin
  if Value = GetReconectar then Exit;
  if Value then
    FProxRecon := GetTickCount + 20000 else
    FProxRecon := 0;
end;

procedure TFrmPri.CalcReconectar;
const BoolStr : Array[Boolean] of String = ('False', 'True');
begin
  if (not CM.Ativo) then begin
    DebugMsg('TFrmPri.CalcReconectar - Status: ' + StringStatus);
    case Status of 
      sgLoginCli,
      sgPausaSessao : Status := sgInativo;
      sgTentaAtivar, 
      sgSessao      : Reconectar := True;
    else
      Reconectar := False;  
    end;
  end else
    Reconectar := False;  
  DebugMsg('TFrmPri.CalcReconectar - Result: ' + BoolStr[Reconectar]);
end;

{ TThreadProgAtual }

{procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;}


procedure TThreadProgAtual.Execute;
{var 
  Ultimo: Cardinal;
  AlterouSite, AlterouProg : Boolean;
  SiteIE, SiteFF, Site, Prog, S: String;
  SP : PChar;
  H : HWND;
  DDE : TDdeClientConv;}
begin
{  Priority := tpLower;
  DDE := TDdeClientConv.Create(nil);
  DDE.ConnectMode := ddeManual;
  Ultimo := GetTickCount;
  SiteIE := '';
  SiteFF := '';
  Prog := '';
  Site := '';
  while not Terminated do begin
    try
      if (GetTickCount - Ultimo) > 2500 then begin
        H := GetForegroundWindow;
        SP := Allocmem(255);
        try
          GetWindowText(H, SP , 255);
          S := SP;
        finally
          FreeMem(SP, 255);
        end;
        AlterouSite := False;
        AlterouProg := False;
        
        if S<>Prog then begin
          Prog := S;
          AlterouProg := True;
        end;  

        DDE.SetLink('IExplore', 'WWW_GetWindowInfo');
        if DDE.OpenLink then
        try
          S := FormataSiteStr(DDE.RequestData( '0xFFFFFFFF, sURL, sTitle' ));
          if S<>SiteIE then begin
            Site := S;
            SiteIE := S;
            AlterouSite := True;
          end;  
        finally
          DDE.CloseLink;
        end;

        DDE.SetLink('Firefox', 'WWW_GetWindowInfo');
        if DDE.OpenLink then
        try
          S := FormataSiteStr(DDE.RequestData( '0xFFFFFFFF, sURL, sTitle' ));
          if S<>SiteFF then begin
            Site := S;
            SiteFF := S;
            AlterouSite := True;
          end;  
        finally
          DDE.CloseLink;
        end;

        if AlterouSite or AlterouProg then begin
          csProgAtual.Enter;
          try
            UProg := Prog;
            USite := Site;
          finally
            csProgAtual.Leave;
          end;
        end;  
      end;  
    except
    end;  
    processMessages;
    Sleep(250);
  end;
  DDE.Free;
  Free;}
end;

procedure TFrmPri.CMAoAtualizarMaquina(Sender: TObject);
begin
  RefreshMenu;
end;

procedure TFrmPri.RefreshDesktop;
begin
  lvDesktop.ViewStyle := vsList;
  lvDesktop.ViewStyle := vsIcon;
end;

procedure TFrmPri.RefreshLic(var Msg: TMessage);
begin
  try
    if CM.Ativo then
      CM.Servidor.SalvaLic(ncPString(Msg.WParam)^);
  except
  end;
  Dispose(ncPString(Msg.WParam));
end;

procedure TFrmPri.RefreshLoginG;
var 
  I : Integer;
  SL : TStrings;
  M : TncMaquina;
  S : String;
begin
  LoginGratis := False;
  SiteG1 := '';
  SiteG2 := '';
  slDominiosG.Clear;

  M := CM.MaquinaObj;

  if (M=nil) or (Trim(M.Patrocinio)='') then Exit;

  SL := TStringList.Create;
  try
    try
      CM.ObtemPatrocinios(SL);
      for I := 0 to SL.Count-1 do begin
        S := SL[I];
        if SameText(M.Patrocinio, GetNextStrDelim(S)) then begin
          SiteG1 := GetNextStrDelim(S);
          SiteG2 := GetNextStrDelim(S);
          StrToLista(S, slDominiosG);
          LoginGratis := True;
          Exit;
        end;
      end;  
    except
    end;
  finally  
    SL.Free;  
  end;  
end;

procedure TFrmPri.RefreshMenu;
var M: TncMaquina;
begin
  M := CM.MaquinaObj;
  if M<>nil then
  if slMenu.Text <> M.Menu then begin
    slMenu.Text := M.Menu;
    FIni.SetStrings(FslMenu);
    CodTipo := -1;
  end;  
end;

procedure TFrmPri.TimerShieldHookTimer(Sender: TObject);
begin
  try
    if InjetarShield and (not ShieldInjOk) then begin
      ShieldInjOk := Inject(True, 'guardshield.dll'); 
      if ShieldInjOk then begin
        DebugMsg('Shield injetado');
        TimerShieldHook.Free;
      end else
        DebugMsg('Shield inject failed '+IntToStr(GetLastError));
    end else
      TimerShieldHook.Free;
  except
  end;
end;

procedure TFrmPri.TimerShutdownTimer(Sender: TObject);
begin
  try
    TimerShutdown.Enabled := False;
    CM.Ativo := False;
    CMRem.Ativo := False;
    nxTCPIP.Active := False;
  finally
    FecharCMGuard;
    Close;
  end;
end;

procedure TFrmPri.TimerSiteTimer(Sender: TObject);
begin
  try
    TimerSite.Enabled := False;
    ObtemSiteProg;
  except
    on E: Exception do 
      DebugMsg('ObtemSiteProg Exception ' + E.ClassName + ' Msg: ' + E.Message);
  end;
  TimerSite.Enabled := True;
end;

procedure TFrmPri.ObtemSiteProg;
var 
  AlterouSite: Boolean;
  Site, Prog, S, aExe: String;
  H : HWND;
  M : TncMaquina;
  ProcID : Cardinal;
  W : PTWindowObject;
begin
  Prog := '';
  Site := '';

  H := GetForegroundWindow;
  GetWindowText(H, FBuf, 255);
  Prog := FBuf;
  GetWindowThreadProcessId(H, ProcID);
  if ProcessIdToFileName(ProcID, FBuf) then
    aExe := LowerCase(FBuf) else
    aExe := '';
      
  AlterouSite := False;
  
  if Status = sgSessao then begin
{    WL.Refresh(True);
    W := WL.WindowByHWND(H);
    if W=nil then
      aExe := '' else
      aExe := LowerCase(ExtractFileName(W^.FName));}
     
    S := ExtractFileName(aExe);  
    if SameText(S, 'iexplore.exe') then begin
      try
        DDE.SetLink('IExplore', 'WWW_GetWindowInfo');
        if DDE.OpenLink then
        try
          S := DDE.RequestData( '0xFFFFFFFF, sURL, sTitle' );
          if S<>'' then begin
            Site := FormataSiteStr(S);
            AlterouSite := True;
          end;  
        finally
          DDE.CloseLink;
        end;
      except
      end;
    end else 
    if SameText(S, 'firefox.exe') then begin
      try
        DDE.SetLink('Firefox', 'WWW_GetWindowInfo');
        if DDE.OpenLink then
        try
          S := DDE.RequestData( '0xFFFFFFFF, sURL, sTitle' );
          if S<>'' then begin
            Site := FormataSiteStr(S);
            AlterouSite := True;
          end;  
        finally
          DDE.CloseLink;
        end;
      except
      end;
    end else begin
      AlterouSite := True;
      Site := '';
    end;
  end;
  
  UProg := Prog;
  if AlterouSite then
    USite := Site;
    
  CM.SalvaSiteProgAtual(aExe, uProg, uSite);
end;

procedure TFrmPri.SetFaltamM(const Value: Integer);
begin
  if Value = FFaltamM then Exit;
  FFaltamM := Value;
  FrmAviso.Esconde;
  MostraAviso;
end;

function TFrmPri.StringStatus: String;
begin
  case FStatus of 
    sgIniciando   : Result := 'Iniciando';
    sgInativo     : Result := 'Inativo';
    sgTentaAtivar : Result := 'Tenta-Ativar';
    sgLoginFunc   : Result := 'Login-Func';
    sgConfirmaFechar : Result := 'Confirma-Fechar';
    sgConfig      : Result := 'Config';
    sgLoginCli    : Result := 'Login-Cliente';
    sgSessao      : Result := 'Sessão';
    sgPausaSessao : Result := 'Pausa-Sessão';
    sgFechar      : Result := 'Fechar';
  else
    Result := 'Erro St='+IntToStr(FStatus);
  end;    
end;

procedure TFrmPri.CMAoSuporteRem(Sender: TObject; Maq, Tec: Word);
begin
  if Maq = CM.Maquina then
    ChamaSuporte('Máq.'+IntToStr(CM.Maquina), FrmLogin.VersaoStr);
end;

procedure LeGuardIS;
var SL: TStrings;
begin
  if FileExists(IniFName) then begin
    SL := TStringList.Create;
    try
      SL.LoadFromFile(IniFName);
      NoGuardIS := SameText(SL.Values['GuardIS'], 'N') or
                   SameText(SL.Values['NoGuardIS'], 'S');
    except;
    end;
    SL.Free;
  end;  
end;

{ TThreadTaskMgr }

procedure TThreadTaskMgr.Execute;
var H : HWND;
begin
  repeat
    H := FindWindow('#32770', 'Gerenciador de tarefas do Windows');
    if H = 0 then
      H := FindWindow('#32770', 'Windows Task Manager');
    if H > 0 then 
      PostMessage(H, WM_CLOSE, 0, 0);
    Sleep(5);  
  until Terminated or StopExtraProt;
end;

function NewWndProc(Handle: HWND; Msg: Integer; wParam, lParam:
Longint): Longint; stdcall;
begin
  { If this is the registered message... }
  if Msg = MessageID then
  begin
    try
      frmPri.TaskbarRecreated;
    except  
      Result := 0;
    end;  
  end else
  { Otherwise, pass message on to old window proc }
    Result := CallWindowProc(WProc, Handle, Msg, wParam, lParam);
end;

procedure SubClassApplication;
begin
  { We subclass Application window procedure so that }
  { Application.OnMessage remains available for user. }
  WProc := TFNWndProc(SetWindowLong(Application.Handle, GWL_WNDPROC,
    Longint(@NewWndProc)));
end;


initialization
  slConfig := TStringList.Create;

  LoginGratis := False;
  SiteG1 := '';
  SiteG2 := '';
  slDominiosG  := TStringList.Create;

  csProgAtual := TCriticalSection.Create;
  LeGuardIS;

  MessageID := RegisterWindowMessage('TaskbarCreated');
  if MessageID <>0 then 
    SubClassApplication;
  

finalization
  slConfig.Free;
  csProgAtual.Free;
  slDominiosG.Free;

end.
