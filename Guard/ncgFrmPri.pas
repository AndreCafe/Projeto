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
  ncDebug, ncFrmMsgCli,
  StShlCtl, StdCtrls, ComCtrls, STSHRTCT, SsBase, lmdcont, LMDWaveComp,
  LMDCustomScrollBox, LMDScrollBox, lmdsplt, ncFrmChat, cxControls,
  cxContainer, cxEdit, cxLabel, pngimage, IdBaseComponent,
  IdComponent, IdTCPServer, IdCustomHTTPServer, IdHTTPServer, DdeMan,
  Sockets, cxClasses, cxGraphics, cxStyles, cxBarEditItem,
  DisplaySwitcher, ncgFormBase, ncNXServRemoto, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllSimpleCommandHandler,
  nxllComponent, nxllSimpleSession, nxllTypes, madKernel, LMDCustomParentPanel,
  LMDCustomPanelFill, LMDPanelFill, LMDPNGImage, ShlObj, cxShellCommon, 
  cxShellListView, JamSelectionList, JamDialogs, rtcPortalMod, rtcPortalCli,
  rtcPortalHttpCli, rtcpDesktopHost, ncAcessoRemoto, ncgFrmBasePanelTop,
  nxlgEventLog, nxlgEventLogDispatcher, ncgFrmTop, WinINet, cxLookAndFeels,
  cxLookAndFeelPainters, ncDosCmd, AppEvnts, uVersionInfo, IdTCPConnection,
  IdTCPClient, IdHTTP, ncPRTransfer, ncSessao;

type
  TFrmPri = class(TFormBaseGuard)
    tmCronometro: TTimer;
    WL: TWinList;
    tmPiscaTempo: TTimer;
    tmWinList: TTimer;
    tmAvisoTempo: TTimer;
    tmFirstConn: TTimer;
    TimerTaskMgr: TTimer;
    TimerDesktop: TTimer;
    TimerLogin: TTimer;
    TimerSite: TTimer;
    Imagens32x32: TcxImageList;
    mtPatro: TkbmMemTable;
    mtPatroNome: TStringField;
    mtPatroURL1: TMemoField;
    mtPatroURL2: TMemoField;
    mtPatroDominios: TMemoField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    im24: TcxImageList;
    Timer1: TTimer;
    TimerShutdown: TTimer;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxImageList1: TcxImageList;
    TimerPSStatus: TTimer;
    DispSw: TDisplaySwitcher;
    DDE: TDdeClientConv;
    nxSession: TnxSimpleSession;
    nxCmdH: TnxSimpleCommandHandler;
    nxTCPIP: TnxWinsockTransport;
    panCredRestr: TLMDPanelFill;
    lbCredRestr: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    lbFecharCred: TcxLabel;
    scTeste: TStShortcut;
    panBar: TLMDPanelFill;
    LMDSysInfo1: TLMDSysInfo;
    TimerIPConfig: TTimer;
    ApplicationEvents1: TApplicationEvents;
    TimerFirewall: TTimer;
    TimerA4: TTimer;
    KillExpTimer: TTimer;
    TimerHomePageChrome: TTimer;
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
    procedure cmFecharClick(Sender: TObject);
    procedure cmDesktopClick(Sender: TObject);
    procedure CMAoAtualizarConfig(Sender: TObject);
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
    procedure CMAoAtualizarSessao(Sender: TObject);
    procedure CMAoAtivar(Sender: TObject);
    procedure OnTimerRecriaAppBar(Sender: TObject);
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
    procedure cmTempoClick(Sender: TObject);
    procedure cmVerCreditosClick(Sender: TObject);
    procedure TimerPSStatusTimer(Sender: TObject);
    procedure CMRemProgressoArq(Perc: Integer; Etapa: Byte; NomeArq: string;
      Download: Boolean);
    procedure nxTCPIPConnectionLost(aSender: TnxBaseTransport;
      aSessionID: TnxSessionID);
    procedure CMAoPedirTela(Sender: TObject; SessionID: Integer);
    procedure lbFecharCredClick(Sender: TObject);
    procedure panTempoMouseExit(Sender: TObject);
    procedure panTempoMouseEnter(Sender: TObject);
    procedure panChatClick(Sender: TObject);
    procedure CMAoAtualizarJob(Sender: TObject);
    procedure EvLogLogDataFilter(const aLogData: InxLogData;
      var aFiltered: Boolean);
    procedure CMAoMonitorOnOff(Sender: TObject; aMaq: Word; aOn: Boolean);
    procedure TimerIPConfigTimer(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure TimerFirewallTimer(Sender: TObject);
    procedure TimerA4Timer(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure KillExpTimerTimer(Sender: TObject);
    procedure TimerHomePageChromeTimer(Sender: TObject);
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
    FContador : Cardinal;
    FFullAppOpen : Boolean;
    FPrintTransfer : TncPrintTransfer;
    FFechouExplorer : Boolean;

    FFullAppStart : Cardinal;
    FFullAppH     : HWND;

    FSaveH, FSaveW : Integer;
    FCodTipo : Integer;
    FConfigurouItensPerm: Boolean;
    FStrTipo : String;
    FEXEs    : TStrings;
    FMotivoPausa : Byte;

    FPaginasImp : Integer;
    FPrinter : String;
    FCopias : Integer;
    FJobID : Cardinal;
    FDoc : String;
    FPrintHookOk : Boolean;
    FIPCOK : Boolean;
    FWav: TLMDWaveComp;
    FBloqueioSitesAtivo : Boolean;
    FBuf : PChar;
    pInicio : IProcesses;
    FShellNex : Integer;
    FShowAD : Boolean;

    procedure OnPTProgress(Sender: TObject; Arq: TGUID; aPos, aTotal: Cardinal; aFailed: Boolean);

    procedure DownloadNexAP;
    procedure DownLoadNexPrinter;

    procedure CreateCM;
    
    procedure SetStatus(Value: Integer);
    procedure OnConfirmouImp(Sender: TObject; aInfo: TStrings); 
    procedure ChecaEstadoMaq;
    procedure FechaProgramas(aEtapa: Integer);
    procedure RefreshDesktop;
    procedure FechaExplorer(Forcar: Boolean);
    procedure SetCodTipo(const Value: Integer);
    procedure RefreshRestr;
    procedure MostraAviso;
    procedure CheckPrintServices;
    function GetMotivoPausaStr: String;
    procedure OnForcarFechamentoIE(Sender: TObject);
    procedure OnForcarFechamentoFF(Sender: TObject);
    procedure OnForcarFechamentoCH(Sender: TObject);
    procedure OnRedownload(Sender: TObject);

    procedure DelCookies;

    procedure _Conectar(Reconexao: Boolean);
    
    function  HostsFN: String;
    procedure LeHosts;
    procedure SalvaHosts;
    procedure DesbloqueiaSites(aLeHosts, aSalvaHosts: Boolean);
    procedure BloqueiaSites(aLeHosts: Boolean);

    function OnPInicio(pid: Cardinal): Boolean;

    procedure HandlePrintNotification(var Message: TMessage); message WM_USER + 777;
    procedure Capturar(var Message: TMessage); message WM_USER + 778;
    procedure SendIPConfig(var Message: TMessage); message WM_USER + 779;
    procedure wmCheckPrintServices(var Message: TMessage); message WM_USER + 780;

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

    procedure DownloadIntInfo(var Msg: TMessage);
              message wm_DownloadIntInfo;
              
    procedure SetShellNex(const Value: Integer);
    procedure SetShowAD(Value: Boolean);
    procedure CalcShowAD(aMostrar: Boolean);
    function GetToolbarType: Byte;
    procedure SetToolbarType(const Value: Byte);
    procedure OnForcarFechamento(Sender: TObject);
    procedure SetPSStatus(const Value: Byte);

    procedure StartPrintInj;
    procedure StartPrintPDF;
  public
    CMREm : TncNXServRemoto;
    CM : TClienteNexCafe;
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
    FConectando : Boolean;
    FCheckExpCnt : Cardinal;
    FAcessoRem : TarThread;
    SysInfo: TLMDSysInfo;
    FrmTop : TFrmBaseTop;
    FHomeOpened : Boolean;
    FUFechaHost : String;
    FCmd : TDosCommand;
    FslCmd : TStrings;
    FLastSCNT : Integer;
    FPSStatus : Byte;
    
    procedure RefreshToolbar;  
    procedure OnTerminateScan(Sender: TObject; ExitCode: LongWord);

    procedure OnCreatingDoc(Sender: TObject);
                  
    function SemSenha: Boolean;
    function GetNonEnumText: String;
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
    procedure CalcReconectar;
    procedure RefreshLoginG;
    procedure ObtemSiteProg;
    procedure TimerEncerrar(Sender: TObject);

    property ToolbarType: Byte
      read GetToolbarType write SetToolbarType;

    procedure Esconder; override;

    procedure ScanConfig;

    procedure FechaBrowser(aBrowser, aEtapa: Integer); 

    procedure visNoNet(aVisible: Boolean);
    procedure visValor(aVisible: Boolean);
    procedure visCreditoRestr(aVisible: Boolean);
    procedure visCredRestrCaption(aCaption: String);
    procedure visDebito(aVisible: Boolean);
    procedure visDebitoCaption(aDeb, aTot: String);
    procedure visValorCaption(aCaption: String);
    procedure visTempoCaption(aCaption: String);
    procedure visBloqBotaoDir(aBloq: Boolean);
    procedure visTempo(aVisible: Boolean);
    procedure visPontos(aVisible: Boolean);
    procedure visPontosCaption(aCaption: String);
    procedure visNumMaq(aCaption: String);
    procedure visConfig(aVisible: Boolean);
    procedure visEncerrar(aVisible: Boolean);
    procedure visFecharNex(aVisible: Boolean);
    procedure visDesktop(aVisible: Boolean);
    procedure visDesktopEnabled(aEnabled: Boolean);
    procedure visNome(aVisible: Boolean);
    procedure visNomeCaption(aCaption: String);
    procedure visAlterarSenha(aVisible: Boolean);
    procedure visSenhaCaption(aCaption: String);
    procedure visChat(aVisible: Boolean);
    procedure visDesktopColor(aColor: TColor);
    procedure visDesktopFontColor(aFontColor: TColor);
    procedure FechaHost(aHost: String);
    procedure AjustaFrmSessaoAtivo(S: TncSessao);

    procedure UpdateHomePage;

    procedure OpenHomePub(M: TncMaquina);

    function CalcStatus: Integer;
    procedure CheckExplorerRunning;
    
    function StayOnTopOFF: Boolean;

    function GetAutoServName: String;
    
    procedure AjustaTamanho;

    function IDSessao: Integer;

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

    property FullAppOpen: Boolean
      read FFullAppOpen;  

    property BloqueioSitesAtivo: Boolean
      read FBloqueioSitesAtivo write SetBloqueioSitesAtivo; 

    property FaltamM: Integer
      read FFaltamM write SetFaltamM;   

    property ShellNex: Integer
      read FShellNex write SetShellNex;  

    property doShowAD: Boolean
      read FShowAD write SetShowAD;

    property PSStatus: Byte
      read FPSStatus write SetPSStatus;  
  end;

  TThreadProgAtual = class (TThread)
  protected
    procedure Execute; override;
  end;  

  TThreadTaskMgr = class (TThread)
  protected
    procedure Execute; override;
  end;
  
  TThreadConvertJpeg = class ( TThread )
  private
    FSource, FDest : String;
  protected
    procedure Execute; override;
  public
    constructor Create(aSource, aDest: String);  
  end;

  TThreadSyncDir = class ( TThread )
  private
    FTA : Integer;
    FOper: Byte;
  protected
    procedure Execute; override;
    constructor Create(aTA : Integer; aOper: Byte);  
  end;
  
  TBoolArray = Array[1..10] of Boolean;
  PBoolArray = ^TBoolArray;

  function IniFName: String;
  function ArqImFundo: String;
  function ArqImLogin: String;

  function ObtemEXE(S: String): String;
  function ObtemParams(S: String): String;
  function ForceForegroundWindow(hwnd: THandle; aFormName: String): boolean;

  procedure ShowTaskBar;
  procedure HideTaskBar;

  procedure RemoveDriverHook;
  procedure LoadConfig;

  procedure FechaProc(ProcessID: Cardinal);
  procedure KillExplorer;

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

   ps_nenhum = 0;
   ps_off    = 1;
   ps_on_inj = 2;
   ps_on_pdf = 3;

   npZero   = 0;
   npSessao = 1;
   npManut  = 2;
   npTotal  = 3;

   tbNenhuma = 0;
   tbFree    = 1;
   tbPremium = 2;
                            
   sdoper_criar = 0;
   sdoper_excluir = 1;
  
  CorNormal = $00C8D0D4;
  CorPisca  = clYellow;

var
  LastKillExp : Cardinal;
  
  DontKillExplorer : Boolean = False;
  AvisoCreditos : Boolean = True;
  FrmPri: TFrmPri;
  FIni : TMemIniFile = nil;
  glShutOp : Integer = -1;
  glForceShut : Boolean;
  glPowerOff : Boolean;
  FrmChat : TFrmBaseChat = nil;
  csProgAtual : TCriticalSection = nil;
  csSyncDir : TCriticalSection = nil;
//  ThProgAtual : TThreadProgAtual;

  DesbloqTaskMgr : Boolean = False;
  
  SenhaCli: String;
  SenhaDig: String = '';
  StatusSenha: Byte = 0;
  USessao : Integer = 0;
  UErroStr : String = '';
  gTBURL : String = '';
  ResetPrinterPaper : Boolean = True;
  
  NoGuardIS : Boolean = False;
  NOInj : Boolean = False;
  ThinClient : Boolean = False;

  LoginGratis : Boolean = False;
  SiteG1, SiteG2 : String;
  slDominiosG  : TStrings;

  StopExtraProt : Boolean = False;
  

  SiteIE, SiteFF, 
  USite, UProg : String;
  USalvaProgs : Cardinal;
  
  ModoManut : Boolean = False;
  
  slConfig : TStrings = nil;
  slNonEnumNames : TStrings = nil;

  Fechar : Boolean = False;
  Buff : Array[1..1024] of Char; 

  MessageID: Integer;
  WProc: TFNWndProc = Nil;
  ExitProcessNext : procedure(exitCode: dword); Stdcall;
  
const
  ssObterSenha  = 0;
  ssSenhaObtida = 1;
  ssSenhaOK     = 2;

  sCLSID_MeuComp = '{20D04FE0-3AEA-1069-A2D8-08002B30309D}';
  sCLSID_Lixeira = '{645FF040-5081-101B-9F08-00AA002F954E}';

  ShellDef = -1;

  brNenhum = 0;
  brIE = 1;
  brFF = 2;
  brCh = 3;

var
  PostQuitMessageNext : procedure (nExitCode: Integer); stdcall;  
  DefBrowser: Integer;

implementation

uses 
//  cxCpu40,
  madCodeHook,
  Registry, 
  CSCClient,
  LMDSysIn,
  ncgFrmPausa, 
  ncgFrmLogin, 
  ncgFrmConta, 
  ncgFrmAtualiza, 
  ncIDRecursos,
  ncgFrmConfigDesktop, 
  ncgFrmFake, 
  ncgLVBack, 
  ncgFrmAviso,
  ncgFrmSenha, ncTarifador, ncgFrmConn, 
  ncVersoes, ncgDMArqs, ncFrmSuporteRem, MACAdress, {ncCliAtualizaLic,}
  ncFrmCreditos, ncErros, ncVersionInfo, ncShellStart, ncgFrmShellFilter,
  ncgShell, ncFrmShade, ncFrmImp, ncJob, ncgFrmPanPremium,
  ncgFrmPanFree, ncgFrmYAD, ncAppUrlLog, md5, ncgPrevLogoff,
  ncIPAddr, ncFirewall, ncgConnMgr, ncgPrintInstall, ncFrmPrintReview,
  ncgFrmPTProgress, ncgFrmFST, ncThreadedDownload, ncgBackupPrinters, ncgWatch, ncPrinterInfo8,
  ncExpandArea, ncBrowserUtils, nexUrls;

{$R *.DFM}

type
  // this is what we our dll sends us
  TPrintNotification = record
    process : array [0..MAX_PATH] of char;
    api     : array [0..MAX_PATH] of char;
    params  : array [0..MAX_PATH] of char;
    result  : array [0..MAX_PATH] of char;
  end;

function IsExplorerRunning: Boolean;
var 
  i : integer;
  C : Cardinal;
  P : Iprocesses;
begin
  result := True;
  C := GetCurrentSessionID;
  P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do 
    if P.Items[I].Session=C then Exit;   
  Result := False;  
end;  

function GetExtAssociation(const Ext : string) : string;
begin
  Result := '';
  with TRegistry.Create(KEY_EXECUTE) do begin
    try
      RootKey   := HKEY_CLASSES_ROOT;
      if OpenKeyReadOnly(Ext + '\shell\open\command') 
      then begin
        Result  := ReadString('');
        CloseKey;
      end; {if}
    finally
      Free;
    end; {try}
  end; {with}
end;

procedure RefreshDefBrowser;
var S: String;
begin
  DefBrowser := brNenhum;
  try
    S := GetExtAssociation('http');
    if Pos('firefox.exe', S)>0 then
      DefBrowser := brFF
    else
    if Pos('chrome.exe', S)>0 then
      DefBrowser := brCH
    else
    if Pos('iexplore.exe', S)>0 then
      DefBrowser := brIE;
   DebugMsg('ncgFrmPri.RefreshDefBrowser - Browser: ' + IntToStr(DefBrowser));   
  except
    on E: Exception do
      DebugMsg('ncgFrmPri.RefreshDefBrowser - Exception: ' + E.Message);
  end;
end;

procedure postContaSessao;
var 
  H : TidHttp;
  C : Byte;
begin
  C := 10;
  try
    H := TidHttp.Create(nil);
    try
      H.HandleRedirects := True;
      while (C>0) and (not Application.Terminated) do begin
        try
          DebugMsg('postContaSessao - Res: ' + H.Get(gUrls.Url('scnt', 'conta='+gConfig.Conta)));
          C := 0;
        except 
          on E: Exception do begin
            Dec(C);
            Sleep(Random(500));
            DebugMsg('postContaSessao - Exception: ' + E.Message);
          end;
        end;
      end;
    finally
      H.Free;
    end;
  except
    on E: Exception do 
      DebugMsg('postContaSessao - Exception: ' + E.Message);
  end;
end;  

type
  TThreadContaSessao = class ( TThread )
  protected
    procedure Execute; override;
  public 
    constructor Create;
  end;

 constructor TThreadContaSessao.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
  Resume;
end;

procedure TThreadContaSessao.Execute;
begin
  postContaSessao;
end;


procedure RestoreNexPrinterDefaultDim;
begin
  try
    DebugMsg('RestoreNexPrinterDefaultDim 1');
    if gConfig.PMPDF and ResetPrinterPaper then
      ChangePrinterPaper(Pchar('Impressora NexCafé'), DMPAPER_A4, 2970, 2100, DMORIENT_PORTRAIT);
  except
  end;
end;

procedure PostQuitMessageCallback(nExitCode: Integer); stdcall;
begin
  DebugMsg('PostQuitMessage - nExitCode: ' + IntToStr(nExitCode));
  PostQuitMessageNext(nExitCode);
end;  


function GetURLFromChrome: String;
var
  H: HWND;
  Buffer : array[0..1024] of Char;
  P : IProcesses;
  W : IWindows;
  i, j: Integer;
  res: Cardinal;
begin
  Result := '';
  P := Processes('chrome.exe');
  for i := 0 to P.ItemCount-1 do begin
    W :=P.Items[i].TaskbarWindows;
    for j := 0 to W.ItemCount-1 do begin
      H := FindWindowEx(W[j].Handle, 0, 'Chrome_AutocompleteEditView', nil);
      if H=0 then 
        H := FindWindowEx(W[J].Handle, 0, 'Chrome_OmniboxView', nil);
      if H <> 0 then
      begin
        FillChar(Buffer, SizeOf(Buffer), 0);
        SendMessageTimeout(H, WM_GETTEXT, 1024, integer(@Buffer), 0, 1000, Res);
        Result := Buffer;
        if Result>'' then Exit;
      end;
    end;
  end;
end;

function FechaURLChrome(aURL: String): Boolean;
var
  H: HWND;
  Buffer : array[0..1024] of Char;
  P : IProcesses;
  W : IWindows;
  i, j: Integer;
  res: Cardinal;
  S: String;
begin
  Result := False;
  P := Processes('chrome.exe');
  for i := 0 to P.ItemCount-1 do begin
    W :=P.Items[i].TaskbarWindows;
    for j := 0 to W.ItemCount-1 do begin
      H := FindWindowEx(W[j].Handle, 0, 'Chrome_AutocompleteEditView', nil);
      if H=0 then 
        H := FindWindowEx(W[J].Handle, 0, 'Chrome_OmniboxView', nil);
      if H <> 0 then
      begin
        FillChar(Buffer, SizeOf(Buffer), 0);
        SendMessageTimeout(H, WM_GETTEXT, 1024, integer(@Buffer), 0, 1000, Res);
        S := Buffer;
        if SameHost(S, aURL) then begin
          W[j].Close;
          P[i].Close;
          Result := True;
        end;
      end;
    end;
  end;
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

function GetWindowClassName(H: HWND): String;
var S : PChar;
begin
  S := AllocMem(255);
  try
    GetClassName(H, S, 255);
    Result := S;
  finally
    FreeMem(S, 255);
  end;  
end;

  
procedure KillExplorer;
var 
  P : IProcesses;
  C : Cardinal;
  I : Integer;
  H : HWND;
begin
  if dontkillexplorer then Exit;

  debugMsg('KillExplorer 1');

  LastKillExp := GetTickCount;
//  ShellStartCustom(ExtractFilePath(ParamStr(0))+'nexexp.exe', '', '', 0, 1,'open', True); 

//  Exit;
  
  C := GetCurrentSessionID;

{  H := FindWindow(pchar('Shell_TrayWnd'), nil);
  if H > 0 then  begin
    DebugMsg('KillExplorer ShellTray Cmd');
    PostMessage(h, $05B4, 0, 0);
    Sleep(500);
  end; }

//  Exit;
  

{  P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do
    if C=P.Items[I].Session then
      P.Items[I].Quit; }
  
  P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do
    if C=P.Items[I].Session then
      P.Items[I].Terminate;
      
{  P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do begin
    DebugMsg('Kill Explorer 2 - '+ P.Items[I].ExeFile);
    if C=P.Items[I].Session then
      FechaProc(P[0].ID);
  end;}
  
{  P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do
    if C=P.Items[I].Session then begin
      DebugMsg('KillExplorer Quit Cmd - '+P[I].ExeFile+' - ');
      if P.Items[I].IsStillValid then 
        P.Items[I].Quit;
      Sleep(200);  
    end;

  P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do
    if C=P.Items[I].Session then begin
      DebugMsg('KillExplorer Terminate Cmd'+P[I].ExeFile+' - ');
      if P.Items[I].IsStillValid then 
        P.Items[I].Terminate;
      Sleep(200);   
    end;
  
 P := Processes('explorer.exe');
  for I := 0 to P.ItemCount-1 do begin
    DebugMsg('Kill Explorer 2 - '+ P.Items[I].ExeFile+' - ');
    if C=P.Items[I].Session then begin
      DebugMsg('KillExplorer FechaProc Cmd');
      if P.Items[I].IsStillValid then 
        FechaProc(P[I].ID);
      Sleep(200);
    end;
  end;    }
      
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
    gTBUrl := slConfig.Values['TBUrl'];
    gConnMgr.Servidor := slConfig.Values['servidor'];
    gConnMgr.SetLastConnOk(slConfig.Values['ultimoservidor']);
    DebugAtivo := SameText(slConfig.Values['Debug'], 'S');
    ThinClient := SameText(slConfig.Values['ThinClient'], 'S');
  end;
  ResetPrinterPaper := not SameText(slConfig.Values['ResetPrinterPaper'], 'N');
  
  DontKillExplorer := SameText(slConfig.Values['DontKillExplorer'], 'S') or SameText(slConfig.Values['DontKillExplorer'], 'Y');
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

function ForceForegroundWindow(hwnd: THandle; aFormName: String): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID : DWORD;
  timeout : DWORD;
begin
  DebugMsg('ForceForeGroundWindow - aFormName: '+aFormName);
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
      if (LastKillExp>0) and (GetTickCount-LastKillExp>5000) then
        CheckExplorerRunning;
    except
    end;
    Tarifar;
  except
    on E: Exception do begin
      DebugMsg('TFrmPri.Erro Tarifação: '+E.ClassName+' - Msg: '+E.Message);
    end;
  end;
end;

procedure TFrmPri.DelCookies;
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord (*Handle*);
  dwEntrySize, dwLastError: LongWord;
  I : Integer;
  S: String;
  SL : TStrings;
begin
  if not gConfig.ExCookie then Exit;
  //Get size of first entry in dwEntrySize
  SL := TStringList.Create;
  try
    dwEntrySize := 0;
    FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);
    //Create structure that can hold entry
    GetMem(lpEntryInfo, dwEntrySize);
    //Get first cache entry and handle to retrieve next entry, output url
    hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);
    if hCacheDir <> 0 then
      // use the DeleteUrlCacheEntry line here
      SL.Add(string(lpEntryInfo^.lpszSourceUrlName));
    //free structure
    FreeMem(lpEntryInfo);
  
    //retrieve all subsequent entries
    repeat
      dwEntrySize := 0;
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      dwLastError := GetLastError();
      if GetLastError = ERROR_INSUFFICIENT_BUFFER then begin
        GetMem(lpEntryInfo, dwEntrySize);
        if FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize) then
          // use the DeleteUrlCacheEntry line here!
          SL.Add(string(lpEntryInfo^.lpszSourceUrlName));
        FreeMem(lpEntryInfo);
      end;
    until dwLastError = ERROR_NO_MORE_ITEMS;
  
    for i := 0 to SL.Count-1 do 
      if SameText(Copy(SL[i], 1, 6), 'cookie') then
        DeleteUrlCacheEntry(PAnsiChar(SL[i]));
  finally
    SL.Free;
  end;
end;


procedure TFrmPri.Tarifar;
var 
  J : TncJob;
  S : TncSessao;
  Usu : TncUsuario;
  cTempo, TempoR: Cardinal;
  ATempo, AValor, St, sPontos: String;
  dValor: Currency;
  R : TRect;
  hDesk, H : HWND;
  AClassName: String;
begin
  _Reconectar;
  visNoNet(not CM.Ativo);

  sPontos := '';  
  Caption := 'NexCafé';

  with CM do
  if FStatus in [sgSessao, sgPausaSessao] then begin
    S := CM.SessaoMaq;
    DebugMsg('TFrmPri.Tarifar');
    CalcShowAD((S<>nil) and (FStatus=sgSessao));

    if S=nil then begin
      ATempo := 'ERRO';
      AValor := 'Maq '+IntToStr(Maquina);
    end else begin
      S.AtualizaCalculo;
    
      if S.TipoCli = tcManutencao then begin
        CodTipo := -1;
//        visValor(False);
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
          visCredRestrCaption( 
            MinutosToHMSAbrev((S.Tarifador.CredTotalG-S.Tarifador.CreditoTotal.Ticks)/60/1000));
          visCreditoRestr(True);
        end else 
          visCreditoRestr(False);
          
        dValor := S.Tarifador.Valor;
        dValor := dValor + 
                  S.Transacoes.TotalPendente(trEstVenda) +
                  S.Transacoes.TotalPendente(trCredTempo) +
                  S.Transacoes.TotalPendente(trImpressao);
        AValor := Trim(FloatToStrF(dValor, ffCurrency, 10, 2));
        TempoR := 0;
        
        if gConfig.MostrarDebitoNoGuard and (S.DebitoCli>0.009) then begin
          visDebitoCaption(Trim(FloatToStrF(S.DebitoCli, ffCurrency, 10, 2)),
                           Trim(FloatToStrF(dValor + S.DebitoCli, ffCurrency, 10, 2)));
          visDebito(True);
        end else 
          visDebito(False);
        
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
          end;
        else    
          FMotivoPausa := mpNaoEstaPausado;
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

      visTempoCaption(ATempo);
      visValorCaption(AValor);
      if FMostraCron then begin
        visTempo(True); 
        visValor((S=nil) or (S.TipoCli<>tcManutencao));
      end else begin
        visTempo(False);
        visValor(False);
      end;

      if FMostraCron {and MostraPreco} then
        Application.Title := ATempo + ' = ' + AValor else
        Application.Title := 'NexCafé';
    end;
    AjustaFrmSessaoAtivo(S);

  end else 
//    Caption := 'NexCafé ' + StringStatus;
    Application.Title := 'NexCafé NexGuard';
  visPontosCaption(sPontos);
end;

procedure TFrmPri.TaskbarRecreated;
begin
  Exit;
  
  if Assigned(FrmTop) then
    FrmTopB.TaskbarRecreated;
    
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Fechar then begin
    DebugMsg('TFrmPri.FormClose 1');
    KeepMeClosed;
    Action := caFree;
    if DesbloqTaskMgr then
      FProt.BloqueiaCtrlAltDel := False;
    FProt.DesativaProtecao;
//    TFrmRemoveRestr.Create(nil).ShowModal;
  end else begin
    DebugMsg('TFrmPri.FormClose 2');
    Action := Forms.caNone;
  end;
end;

procedure TFrmPri.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  DebugMsg('TFrmPri.FormCloseQuery');
  CanClose := Fechar;
  if not Fechar then PrevLogoff;
end;

procedure TFrmPri._Conectar(Reconexao: Boolean);
var 
  M: TncMaquina;
  I: Integer;
  SaveServ, S: String;
begin
  gConnMgrStopRetry := False;

  DebugMsg('TFrmPri._Conectar - NomeMaq: '+NomeMaq);
  CM.Maquina := StrToIntDef(slConfig.Values[NomeMaq], 0);
  CM.Programa := 'nexguard.exe';
  CM.Versao := FormataNumVersao(GetVersionInfo);
  
  if FrmChat<>nil then
    FrmChat.NumMaq := CM.Maquina;

  CM.Ativo := False;
  nxTCPIP.Active := False;
  
  CMRem.Transp := nil;
  nxTCPIP.CommandHandler := nil;
  nxSession.Transport := nil;
  try nxTCPIP.Free; except end;
  FPrintTransfer.SetTransp(nil);
  nxTCPIP := TnxWinsockTransport.Create(Self);
  nxTCPIP.CallbackThreadCount := 1;
  nxTCPIP.Timeout := 3000;
  nxTCPIP.Port := 16200;
  DebugMsg('TFrmPri._Conectar 1');
  SaveServ := gConnMgr.ObtemServidor;
  nxTCPIP.ServerName := SaveServ;
  nxTCPIP.CommandHandler := nxCmdH;
  nxSession.Transport := nxTCPIP;
  CMRem.Transp := nxTCPIP;
  DebugMsg('TFrmPri._Conectar - nxTCPIP.ServerName: ' + nxTCPIP.ServerName);
  cmRem.Ativo := False;
  visNumMaq('Maq' + sLineBreak + slConfig.Values[NomeMaq]);
  
  try
    DebugMsg('TFrmPri._Conectar - CM.Ativo = True - BEFORE');
    CM.Ativo := True;
    gConnMgrStopRetry := True;
    
    FPrintTransfer.SetTransp(nxTCPIP);
    gConnMgr.Conectou(SaveServ);
    MaqAcessoRemoto := CM.Maquina;
    DebugMsg('TFrmPri._Conectar - CM.Ativo = True - OK !!!');
    UErroStr := '';
    tmCronometro.Enabled := True;
  except
    On E: Exception do begin
      gConnMgr.NaoConectou(nxTCPIP.ServerName);
      UErroStr := E.Message;
      if Pos('Server is incomp', UErroStr)>0 then
        UErroStr := 'O servidor NexCafé está em uma versão mais antiga. '+
                    'Atualize o servidor NexCafé para a versão atual ou se deseja '+
                    'voltar o NexCafé para uma versão antiga é necessário reinstalar '+
                    'o NexGuard manualmente em cada máquina.';
      Raise Exception.Create(UErroStr);
    end;  
  end;
  if CM.AtualizouAgora then begin
    S := ExtractFilePath(ParamStr(0))+'wguard.exe';
    ShellStartCustom(S, 'REMOVER SILENT', '', 0, SW_HIDE, 'open', True, 4000);
    Windows.DeleteFile(PChar(S));
    TdmArqs.NexUpd(CM.ArqDestino);
    CMShutdown(Self, operFecharNex);
    Exit;
  end;

  try

    if CM.NomeArqDesktop='' then
      TimerDesktop.Enabled := True;

    DebugMsg('Antes refreshmenu');

    RefreshMenu;

    DebugMsg('depois refreshmenu');
  

    DeleteFile(ExtractFilePath(ParamStr(0))+'NNCGuard.EXE');
    DeleteFile(ExtractFilePath(ParamStr(0))+'NNexGuard.EXE');

    DebugMsg('DeleteFiles');

    RefreshLoginG;

    DebugMsg('RefreshLoginG');
  
    RefreshRestr;

    DebugMsg('RefreshRest');

    PostMessage(Handle, wm_user + 780, 0, 0);

    try
      DebugMsg('Usuarios.SalvaArquivo - BEFORE');
    
      CM.Usuarios.SalvaArquivo(ArqUsuarios);
      DebugMsg('Salvou Usuários');
    except
      on E: Exception do 
        DebugMsg('TFrmPri._Conectar - Exception: '+E.Message);
    end;

    DebugMsg('Usuarios.SalvaArquivo - AFTER');

    if FrmChat <> nil then FrmChat.NumMaq := CM.Maquina;

  //  Caption := ' ' + Caption + ' ';
    Caption := '';

    ScanConfig;

  
  except
    on E: Exception do 
      DebugMsg('TFrmPri._Conectar - Excecao pós conexão: ' + E.Message);
  end;
  Status := CalcStatus;
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


procedure TFrmPri.FechaBrowser(aBrowser, aEtapa: Integer);
var 
  I : Integer;
  P : IProcesses;
  SessionID : Cardinal;

function BrowserFN: String;
begin
  case aBrowser of
    brIE : Result := 'iexplore.exe';
    brFF : Result := 'firefox.exe';
    brCH : Result := 'chrome.exe';
  else
    Result := '';
  end;
end;

procedure _Fechar(P: IProcess);
begin
  case aEtapa of
    0 : P.Close;
    1 : P.Quit;
    2 : P.Terminate;
  end;
end;

begin
  DebugMsg('TFrmPri.FechaBrowser - 1');

  DebugMsg('TFrmPri.FechaBrowser - 2');
  
  try
    if (aEtapa=0) and (aBrowser=brIE) then begin               
      WL.Refresh(False);
      for I := 0 to WL.Count - 1 do with WL.Windows[I]^ do 
        if SameText(WndClassName, 'CabinetWClass') or
           SameText(WndClassName, 'EXPLOREWCLASS') 
        then
          PostMessage(WinHandle, WM_CLOSE, 0, 0);
    end;   
    DebugMsg('TFrmPri.FechaBrowser - 3');
    P := Processes(BrowserFN);  
    DebugMsg('TFrmPri.FechaBrowser - 4');
    SessionID := GetCurrentSessionID;
    DebugMsg('TFrmPri.FechaBrowser - 5');
    for I := 0 to pred(P.ItemCount) do 
      if SessionID=P[I].Session then begin
        DebugMsg('TFrmPri.FechaBrowser - 6');
        _Fechar(P[I]);
      end;
    DebugMsg('TFrmPri.FechaBrowser - 7');
  finally
    if aEtapa<2 then with TTimer.Create(Self) do begin
      DebugMsg('TFrmPri.FechaBrowser - 8');
      Interval := 500;
      case aBrowser of
        brIE : OnTimer := OnForcarFechamentoIE;
        brFF : OnTimer := OnForcarFechamentoFF;
        brCH : OnTimer := OnForcarFechamentoCH;
      end;
      Enabled := True;
      Tag := aEtapa+1;
      DebugMsg('TFrmPri.FechaBrowser - 9');
    end;
  end;

//  CleanupSystemTray;   
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

procedure TFrmPri.FechaHost(aHost: String);
var S: String;
begin
  if not BloqueioSitesAtivo then begin
    debugMsg('TFrmPri.FechaHost 0 - INATIVO - aHost: ' + aHost);
    Exit;
  end;
  
  debugMsg('TFrmPri.FechaHost 1 - aHost: ' + aHost);
  try
    DDE.SetLink('IExplore', 'WWW_GetWindowInfo');
    if DDE.OpenLink then
    try
      S := DDE.RequestData( '0xFFFFFFFF, sURL, sTitle' );
      debugMsg('TFrmPri.FechaHost 2 - S: ' + S);
      
      if SameHost(aHost, S) then begin
        FechaBrowser(brIE,0);
        FUFechaHost := aHost;
      end;
    finally
      DDE.CloseLink;
    end;
  except
  end;

  try
    if FechaURLChrome(aHost) then 
      FUFechaHost := aHost;
  except
  end;

  debugMsg('TFrmPri.FechaHost 3');
  try
    DDE.SetLink('Firefox', 'WWW_GetWindowInfo');
    if DDE.OpenLink then
    try
      S := DDE.RequestData( '0xFFFFFFFF, sURL, sTitle' );
      debugMsg('TFrmPri.FechaHost 4 - S: ' + S);
      
      if SameHost(aHost, S) then begin
        FechaBrowser(brFF, 0);
        FUFechaHost := aHost;
      end;
    finally
      DDE.CloseLink;
    end;
  except
  end;
end;

procedure FecharPorWM(H: HWND; aSysMsg, aQuitMsg, aCloseMsg: Boolean);
begin
  if aSysMsg then
    PostMessage(H, WM_SYSCOMMAND, SC_CLOSE, 0);

  if aQuitMsg then begin 
    PostMessage(H, WM_ENDSESSION, 0, 0);
    PostMessage(H, WM_QUIT, 0, 0);
    DebugMsg('Postou WM_QUIT');
  end;
    
  if aCloseMsg then  
    PostMessage(H, WM_CLOSE, 0, 0);
end;

procedure TFrmPri.FechaProgramas(aEtapa: Integer);
const
  ProgramasWMQuit = '|MSNMSGR.EXE|SKYPE.EXE|GOOGLETALK.EXE|';
  SempreFechar = '|FIREFOX.EXE|IEXPLORE.EXE|MSNMSGR.EXE|SKYPE.EXE|GOOGLETALK.EXE|CHROME.EXE';
var 
  I : Integer;
  AC : PAnsiChar;
  FN : String;
  P : IProcesses;
  H : HWND;
  SessionID : Cardinal;

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

procedure UnhookProc(aProcessID: Cardinal);
var ph: dword;
begin
  Exit;
{  
  if (not FPrintHookOk) then Exit;
  if aProcessID=0 then Exit;
  
  if slUnhook.IndexOf(IntToStr(aProcessID))=-1 then begin
    slUnhook.Add(IntToStr(aProcessID));
    ph := OpenProcess(PROCESS_ALL_ACCESS, false, aProcessID);
    if ph<>0 then
    try
      if FPrintHookOk then
        UninjectLibrary(ph, 'guardprintapi.dll');
    finally
      CloseHandle(ph);
    end;
  end;}
end;

procedure _Fechar(P: IProcess);
begin
  DebugMsg('_Fechar - FN: ' + FN);
  if (FN='?') or SameText(FN, 'NEXGUARD.EXE') or SameText(FN, 'EXPLORER.EXE') or SameText(FN, 'WMPNSCFG.EXE') then Exit;
  UnhookProc(P.ID);
  case aEtapa of
    0 : P.Close;
    1 : if not SameText(FN, 'EXPLORER.EXE') then P.Quit;
    2 : if not SameText(FN, 'EXPLORER.EXE') then P.Terminate;
  end;
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
  DebugMsg('TFrmPri.FechaProgramas - 1');

  with gConfig do
  if (AposEncerrar in [1..2]) then begin
    if AposEncerrar=1 then
      CMShutDown(nil, operReboot) else
      CMShutDown(nil, operLogoff);  
    Exit;
  end;
  DebugMsg('TFrmPri.FechaProgramas - 2');

  if not gConfig.FecharProgramas then begin
    DebugMsg('TFrmPri.FechaProgramas - gConfig.FecharProgramas = False');
    if gConfig.HPOpenBef then
      OpenHomePub(CM.MaquinaObj);
    Exit;
  end;

//  if not aForcar then slUnhook.Clear;
  
  AC := @Buff;
  DebugMsg('TFrmPri.FechaProgramas - 3');
  
  try
    if aEtapa=0 then begin               
      WL.Refresh(True);
      for I := 0 to WL.Count - 1 do with WL.Windows[I]^ do 
      if not SameText('NEXGUARD.EXE', ExtractFileName(FName)) then
        if SameText(WndClassName, 'CabinetWClass') or
           SameText(WndClassName, 'EXPLOREWCLASS') 
        then
          PostMessage(WinHandle, WM_CLOSE, 0, 0);
    end;   
    DebugMsg('TFrmPri.FechaProgramas - 6');
    P := Processes;  
    DebugMsg('TFrmPri.FechaProgramas - 7');
    SessionID := GetCurrentSessionID;
    DebugMsg('TFrmPri.FechaProgramas - 8');
    for I := 0 to pred(P.ItemCount) do 
      if SessionID=P[I].Session then begin
        DebugMsg('TFrmPri.FechaProgramas - 9');
        FN := UpperCase(ExtractFileName(P[I].ExeFile));
        DebugMsg('TFrmPri.FechaProgramas - 10 - '+FN);
        if (Pos('|'+FN+'|', SempreFechar)>0) or 
           (Pos('|'+FN+'|', ProgramasWMQuit)>0) or
           (not OnPInicio(P[I].ID)) then begin
          DebugMsg('TFrmPri.FechaProgramas - 11');
          _Fechar(P[I]);
        end;
        DebugMsg('TFrmPri.FechaProgramas - 12');
      end;
    DebugMsg('TFrmPri.FechaProgramas - 13');
  finally
    if aEtapa<2 then with TTimer.Create(Self) do begin
      DebugMsg('TFrmPri.FechaProgramas - 14');
      Interval := 500;
      OnTimer := OnForcarFechamento;
      Enabled := True;
      Tag := aEtapa+1;
      DebugMsg('TFrmPri.FechaProgramas - 15');
    end;
  end;

//  CleanupSystemTray;   
end;

procedure TFrmPri.CalcShowAD(aMostrar: Boolean);
var 
  scw, sch : Integer;
  M : TncMaquina;
  S : TncSessao;
  R : TRect;
  H : HWND;
  AClassName : String;
  B, SaveFull, FFirst, IgnoreFull : Boolean;

function FullWindow: Boolean;
var I : Integer;
  W : IWindows;
begin
  Result := False;
  if not (Status  in [sgSessao, sgPausaSessao]) then Exit;
  try
    W := TaskbarWindows;
    if W=nil then Exit;
  except
    Exit;
  end;
  Result := True;
  scw := Screen.Width;
  sch := Screen.Height;
  for I := 0 to W.ItemCount-1 do 
  with W.Items[I] do 
  if (not SameText(ClassName, 'ProgMan')) and (not SameText(ClassName, 'TFRMCONN')) then begin
    R := GetRect;
    if ((R.Right-R.Left)>=scw) and
       ((R.Bottom-R.Top)>=sch) then begin
       
      H := GetHandle;
      AClassName := ClassName;
      Exit;
    end;
  end;
  Result := False;
end;  

{function FullWindow: Boolean;
var I : Integer;
begin
  Result := False;
  if not (Status  in [sgSessao, sgPausaSessao]) then Exit;
  Result := True;
  scw := Screen.Width;
  sch := Screen.Height;
  WL.Refresh(False);
  for I := 0 to WL.Count - 1 do 
  with WL.Windows[I]^ do 
  if IsVisible and (not SameText(WndClassName, 'ProgMan')) and (not SameText(WndClassName, 'TFRMCONN')) then begin
    R := WindowRect;
    if ((R.Right-R.Left)>=scw) and
       ((R.Bottom-R.Top)>=sch) then begin
      H := WinHandle;
      AClassName := WndClassName;
      Exit;
    end;
  end;
  Result := False;
end;  }


begin
  try
    DebugMsg('TFrmPri.CalcShowAD - 1');
    M := CM.MaquinaObj;
    S := CM.SessaoMaq;
    DebugMsg('TFrmPri.CalcShowAD - 2');
    
    IgnoreFull := False;

    DebugMsg('TFrmPri.CalcShowAD - 3');

    // Ajustar config para versão X211
    gConfig.PubAd := false;
    gConfig.PubToolbar := false;

    gTemAD := (M<>nil) and ((M.Direito=dmFree) or gConfig.PubAd);

    if (M<>nil) and ((M.Direito=dmFree) or gConfig.PubToolbar) then
      ToolbarType := tbFree  else 
      ToolbarType := tbPremium;

    if not IgnoreFull then begin

      SaveFull := FFullAppOpen;
      
      if (M<>nil) and ((M.Direito=dmFree) or gConfig.PubAd) then
        B := FullWindow else   
        B := False;    
        
      DebugMsg('TFrmPri.CalcShowAD - 4');
        
//      B := False;
  {    B := (not SameText(AClassName, 'PROGMAN')) and  (
           ((R.Right-R.Left)=Screen.Width) and
           ((R.Bottom-R.Top)=Screen.Height));}
           
      FFullAppOpen := B;
      B := (SaveFull<>B);
  
      FFirst := False;                
      if FFullAppOpen and (Status=sgSessao) then begin
        DebugMsg('FULLAPP - '+AClassName);
        
        if FFullAppH <> H then begin
          FFullAppStart := GetTickCount;
          FFullAppH := H;
          FFirst := True;
        end;
      end else begin
        DebugMsg('SEM FULLAPP');
        FFullAppH := 0;
      end;
    end else
      FFullAppOpen := False;

    DebugMsg('TFrmPri.CalcShowAD - 5');
      
    if (Status=sgSessao) and (not FFullAppOpen) then
      ShowTop else
      HideTop;

    DebugMsg('TFrmPri.CalcShowAD - 6');
      
      
    if aMostrar then
      if (M=nil) or ((M.Direito<>dmFree) and (not gConfig.PubAd)) or (S=nil) then
        aMostrar := False;

    DebugMsg('TFrmPri.CalcShowAD - 7');
        

    if aMostrar and FFullAppOpen then
      aMostrar := False;    

    DebugMsg('TFrmPri.CalcShowAD - 8');
      
       
    doShowAD := aMostrar;

    DebugMsg('TFrmPri.CalcShowAD - 9');
    

    Inc(FContador);

    DebugMsg('TFrmPri.CalcShowAD - 10');
    

    if (Status = sgSessao) and (not FFullAppOpen) and (B or ((FContador mod 4)=0)) then begin
      DebugMsg('TFrmPri.CalcShowAD - 11');
      if Assigned(FrmTopB) then begin
        DebugMsg('TFrmPri.CalcShowAD - 12');
        FrmTopB.TaskbarRecreated;
      end;
    end;

    DebugMsg('TFrmPri.CalcShowAD - 13');

    if not IgnoreFull then
    if (Status = sgSessao) and (FFullAppH<>0) and ((GetTickCount-FFullAppStart)<20000) then begin
      if Assigned(FrmTopB) then  begin
        DebugMsg('TFrmPri.CalcShowAD - 14');
        FrmTopB.SendBottom;
      end;
      
      DebugMsg('*** FULLAPP - ' + AClassName);
//      SetWindowPos(FFullAppH, HWND_TOPMOST, -1, -1, Screen.Width+1, Screen.Height+1, 0);
    end;   
    DebugMsg('TFrmPri.CalcShowAD - 15');
    
  except
    on E: Exception do 
      DebugMsgEsp('TFrmPri.CalcShowAD - E.Message: '+E.Message, False, True);
  end;
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


begin
  LastKillExp := GetTickCount;
  if not IsExplorerRunning then 
    ShellStart('explorer');
{    fillchar(si, sizeOf(si), 0);
    si.cb := sizeof(si);
    if CreateProcess(nil, 'explorer.exe', nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, si, pi) then 
    begin
      CloseHandle( pi.hProcess );
      CloseHandle( pi.hThread );    
    end;
  end;}
end;

procedure TFrmPri.CheckPrintServices;
var NewStatus : Integer;
begin
  try
    DebugMsg('TFrmPri.CheckPrintServices 1');
    if not CM.Ativo then Exit;
    DebugMsg('TFrmPri.CheckPrintServices 2');
    if gConfig.ControlaImp<1 then 
      NewStatus := ps_off
      
    else
      if gConfig.PMPDF then
        NewStatus := ps_on_pdf else
        NewStatus := ps_on_inj;
      
    try
      if gConfig.PMPDF then DownloadNexAP;
      DebugMsg('TFrmPri.CheckPrintServices - NewStatus: '+IntToStr(NewStatus));
      DebugMsg('TFrmPri.CheckPrintServices - Status pre: '+IntToStr(PSStatus));
      PSStatus := NewStatus; 
      DebugMsg('TFrmPri.CheckPrintServices - Status after: '+IntToStr(PSStatus));
    finally
      TimerPSStatus.Enabled := (NewStatus <> PSStatus);
    end;
  except
    on E: Exception do 
      DebugMsgEsp('TFrmPri.CheckPrintServices - E.Exception: ' + E.Message, False, True);
  end;
end;

procedure TFrmPri.FecharCMGuard;
begin
  Fechar := True;
  Close;
  glShutOp := FShutOp;
  Status := sgFechar;
end;

procedure TFrmPri.SetShellNex(const Value: Integer);
begin
  DebugMsg('TFrmPri.SetShellNex 1 - Value: '+IntToStr(Value));
  if FShellNex=Value then Exit;
  
  FShellNex := Value;

  DebugMsg('TFrmPri.SetShellNex 2 - Value: '+IntToStr(Value));
  
  
  if FShellNex=ShellDef then
    ChangeShellData(False, False)  else
    ChangeShellData(gConfig.FiltrarDesktop, gConfig.BloqMenuIniciar or gConfig.FiltrarMenuIniciar);

  DebugMsg('TFrmPri.SetShellNex 3 - Value: '+IntToStr(Value));
    
//  KillExplorer;
end;

procedure TFrmPri.SetShowAD(Value: Boolean);
begin
  if Value=FShowAD then Exit;

  FShowAD := Value;
  
  if Value then 
    ShowYAD else
    HideYAD;
end;

procedure TFrmPri.SetStatus(Value: Integer);
var
  Antes, SaveStatus, P : Integer;
  U : TncUsuario;
  S : TncSessao;
  M : TncMaquina;
begin
  SaveStatus := FStatus;
  if Value = FStatus then Exit;
  LockWindowUpdate(Handle);
  try
    DebugMsg('SetStatus - 1');
    Antes := FStatus;
    DebugMsg('SetStatus - 2');
    FStatus := Value;
//    if FStatus<>sgSessao then appBar.Docking.Height := 0;

    DebugMsg('SetStatus - 3');
    if Assigned(FrmAlteraSenha) then FrmAlteraSenha.Close;
    DebugMsg('SetStatus - 4');
    visConfig(False);
    DebugMsg('SetStatus - 5');
    S := CM.SessaoMaq;
    DebugMsg('SetStatus - 6');
    visEncerrar(FStatus = sgSessao);
  
    DebugMsg('SetStatus - 7');
    visFecharNex((FStatus=sgSessao) and (S.TipoCli=tcManutencao));
  
    DebugMsg('SetStatus - 8');
    if not (FStatus in [sgSessao, sgPausaSessao]) then begin
      StatusSenha := ssObterSenha;
      SenhaCli := '';
      SenhaDig := '';
    end;  
    DebugMsg('SetStatus - 9');
    visDesktopEnabled((FStatus = sgSessao));
    DebugMsg('SetStatus - 10');
    visNome(False);
    DebugMsg('SetStatus - 11');
    visAlterarSenha(False);
    DebugMsg('SetStatus - 12');
//    cmMaq.AllowClick := False;
    DebugMsg('SetStatus - 13');
    if Versoes.PodeUsar(idre_chat) and (gConfig.OpcaoChat<>ochDesabilitar) then begin
      DebugMsg('SetStatus - 14');
      visChat(True);
    end else begin
      DebugMsg('SetStatus - 15');
      visChat(False);
    end;

    CalcShowAD((FStatus=sgSessao));
  
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
     
      sgLoginFunc, 
      sgConfig, 
      sgConfirmaFechar  : 
      begin
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
        FFechouExplorer := False;
        if gConfig.HPOpenBef and (not FHomeOpened) then OpenHomePub(CM.MaquinaObj);
        TimerA4.Enabled := True;
        DebugMsg('SetStatus - 16');
{        spChat.Visible := (cmChat.Visible=ivAlways) and (gConfig.OpcaoChat=ochJanelaVisivel);
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
        end;}
      
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
        if (Antes in [sgSessao, sgPausaSessao]) then begin
          FechaProgramas(0);
          try DelCookies; except end;
          if ShellNex<>ShellDef then
          if (gConfig.FiltrarDesktop or ((not gConfig.BloqMenuIniciar) and gConfig.FiltrarMenuIniciar)) then
            TThreadSyncDir.Create(ShellNex, sdoper_excluir);
        end;
        DebugMsg('SetStatus - 28');
      end;
      
      sgSessao     : begin
        if (S<>nil) and (FLastSCNT <> S.ID) then begin
          FLastSCNT := S.ID;
          TThreadContaSessao.Create;
        end;
        RestoreNexPrinterDefaultDim;
        DebugMsg('SetStatus - 29');
//        lvDesktop.SpecialRootFolder := sfDesktop;
        DebugMsg('SetStatus - 30');
        ShowTaskBar;
        DebugMsg('SetStatus - 31');
        AvisoCreditos := True;
        DebugMsg('SetStatus - 32');
        FrmAtivo := FrmPri;
        DebugMsg('SetStatus - 33');
        FrmConn.LimpaLoginInfo;
        DebugMsg('SetStatus - 35');
        FrmChat.DeleteAll;
        FrmChat.Width := 345;
        FrmChat.Height := 500;
        FrmChat.Visible := False;
        FrmChat.WindowState := wsNormal;
        DebugMsg('SetStatus - 36');

  {      if spChat.Visible then begin
          P := spPri.Width - 190;
          with spPri.Bars[0] do if Position > P then Position := P;
        end;}
        DebugMsg('SetStatus - 37');
        
        CalcShowAD((S<>nil));
        
        if Assigned(FrmTop) and (S<>nil) then
          FrmTop.IDSessao := S.ID;

        if not FFechouExplorer then begin
          FFechouExplorer := True;
          KillExpTimer.Enabled := True;
        end;
        
        if (S<>nil) and (S.TipoCli=tcManutencao) then begin
          DebugMsg('SetStatus - 38');
          NivelProt := npManut;
          ShellNex := ShellDef;
          DebugMsg('SetStatus - 39');
        
          CodTipo := -1;
          DebugMsg('SetStatus - 40');
          if S=nil then
            U := nil else
            U := CM.Usuarios.PorUsername[S.FuncI];
          DebugMsg('SetStatus - 41');
          visConfig((S<>nil) and (U<>nil) and CM.Permitido(U, daMaqConfigurar));
          visFecharNex((S<>nil) and (U<>nil) and CM.Permitido(U, daMaqFecharCMGuard));
            
          DebugMsg('SetStatus - 42');
  
          if CM.Permitido(U, daMaqConfigurar) then begin
            DebugMsg('SetStatus - 43');
            visDesktop(True);
            DebugMsg('SetStatus - 44');
//            cmMaq.AllowClick := True;
          end;  
          DebugMsg('SetStatus - 45');
        end else begin
          DebugMsg('SetStatus - 46');
          NivelProt := npSessao;
          if S<>nil then
            ShellNex := S.Tarifador.IDTipoAcesso;
            
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
            visNomeCaption(S.NomeCliente);
            DebugMsg('SetStatus - 54');
            if S.UsernameLogin>'' then
              visNomeCaption(S.NomeCliente + ' (' + S.UsernameLogin + ')');
            DebugMsg('SetStatus - 55');
            visNome(True);
            DebugMsg('SetStatus - 56');
            visAlterarSenha(not gConfig.ClienteNaoAlteraSenha);
            DebugMsg('SetStatus - 57');
            SenhaCli := S.SenhaLogin;
            DebugMsg('SetStatus - 58');
            if StatusSenha = ssObterSenha then 
              StatusSenha := ssSenhaObtida;
            DebugMsg('SetStatus - 59');
            if (SenhaCli='') and (StatusSenha=ssSenhaObtida) and (not gConfig.NaoObrigarSenhaCliente) then begin
              DebugMsg('SetStatus - 60');
              visSenhaCaption('Criar Senha');
              DebugMsg('SetStatus - 61');
              if StatusSenha<>ssSenhaOK then cmAlterarSenhaClick(nil);
              DebugMsg('SetStatus - 62');
            end else
            if gConfig.ClienteNaoAlteraSenha then
              visSenhaCaption('') else
              visSenhaCaption('Alterar Senha');
            DebugMsg('SetStatus - 63');
          end; 

          M := CM.MaquinaObj;

          if (SaveStatus<>sgPausaSessao) and ((not FHomeOpened) or (not gConfig.HPOpenBef)) then
            OpenHomePub(M);
        end;  

        DebugMsg('SetStatus - 64');

        if ShellNex<>ShellDef then
        if (SaveStatus<>sgPausaSessao) and (gConfig.FiltrarDesktop or ((not gConfig.BloqMenuIniciar) and gConfig.FiltrarMenuIniciar)) then
        begin
          DebugMsg('TFrmPri.SetStatus - TThreadSyncDir.Create');
          TThreadSyncDir.Create(ShellNex, sdoper_criar);

          if gConfig.CliCongelado or (not S.DesktopSinc) then begin
            TThreadSyncDir.Create(ShellNex, sdoper_excluir);
            if not S.DesktopSinc then
              try CM.DesktopSincronizado(S.ID); except end;
          end;
        end;

        
          
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

        if ShellNex<>ShellDef then
        if (SaveStatus<>sgSessao) and (gConfig.FiltrarDesktop or ((not gConfig.BloqMenuIniciar) and gConfig.FiltrarMenuIniciar)) then
          TThreadSyncDir.Create(ShellNex, sdoper_criar);
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
  LockWindowUpdate(0);
{  if FStatus=sgSessao then begin
    if panCredRestr.Visible then
      appBar.Docking.Height := 49 else
      appBar.Docking.Height := 30;
  end;}
end;

procedure TFrmPri.SetToolbarType(const Value: Byte);
var 
  N: TFrmBaseTop;
  S: TncSessao;
begin
  if ToolbarType=Value then Exit;
  case Value of
    tbPremium : N := TFrmPanPremium.Create(Self);
    tbFree    : N := TFrmPanFree.Create(Self);
  else 
    N := nil;
  end;

  if (N<>nil) and (FrmTop<>nil) then 
    N.AssignVisFrom(FrmTop);

  if FrmTop<>nil then 
    FreeAndNil(FrmTop);

  if N<>nil then begin
    FrmTop := N;
    N.pan.Parent := panBar;
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

  if FShutOp=operFecharNex then
    DesbloqTaskMgr := True;

  KeepMeClosed;    

  Fechar := True;
    
  try FAcessoRem.Desconectar; except end;

  if FPrintHookOk then begin
    FPrintHookOk := False;
    Inject(False, 'guardprintapi.dll');
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
  R: TRegistry;
begin
  CreateCM;
  
  RefreshDefBrowser;
//  HookAPI(user32,    'PostQuitMessage',    @PostQuitMessageCallback,    @PostQuitMessageNext);  
  FLastSCNT := 0;

  Set8087CW($133f);

  FFechouExplorer := False;

  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;
    R.Access := KEY_ALL_ACCESS;
    R.OpenKey('SOFTWARE\NexCafe\', True);
    R.WriteString('Dir', ExtractFilePath(ParamStr(0)));
    R.CloseKey;    
  except
  end;
  R.Free;

  FPSStatus := ps_nenhum;
  FPrintTransfer := TncPrintTransfer.Create(ptdir_upload);
  FPrintTransfer.SetPTProgress(OnPTProgress);
  FPrintTransfer.FreeOnTerminate := True;
  FPrintTransfer.Resume;
  
  FCmd := TDosCommand.Create(nil);
  FCmd.OnTerminated := OnTerminateScan;
  FslCmd := TStringList.Create;
  FCmd.OutputLines := FslCmd;
  FCmd.CommandLine := 'ipconfig';
  
  FUFechaHost := '';
  FHomeOpened := False;
  FConectando := False;
  Left := 0;
  Top := 0;
  Width := 0;
  Height := 0;
  FFullAppStart := 0;
  FrmTop := nil;
  ToolbarType := tbPremium;
  FFullAppOpen := False;
  FContador := 0;
  FAcessoRem := TarThread.Create(False);
  FAcessoRem.FreeOnTerminate := True;
  try
    pInicio := Processes;
  except
  end;
  HookAPI(kernel32, 'ExitProcess', @ExitProcessCallback, @ExitProcessNext);
  try
    ForceDirectories(GetShellDir(sdPrograms, False, True));
    ForceDirectories(GetShellDir(sdPrograms, True, True));
    ForceDirectories(GetShellDir(sdDesktop, False, True));
    ForceDirectories(GetShellDir(sdDesktop, True, True));
  except
  end;
  FShowAD := False;
  FCopias := 1;
  
  FShellNex := ShellDef;
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
  FJobID := 0;
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
  try 
    if not SameText(Trim(slConfig.Values['Dev']), 'S') then 
      FProt.AutoStart(True); 
  except 
    on E: Exception do 
      DebugMsg('FProt.AutoStart - Exception: '+E.Message);
  end;
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
  FStayOnTopOff := SameText(slConfig.Values['StayOnTopOff'], 'S');
  DebugMsg('FormCreate 38');  
  DebugAtivo := SameText(slConfig.Values['Debug'], 'S');
  DebugMsg('FormCreate 39');
  Reply_Timeout := StrToIntDef(slConfig.Values['Timeout'], 23) * 1000;
  DebugMsg('FormCreate 40');
  if DebugAtivo then begin
    DebugMsg('FormCreate 41');
//    FStayOnTopOff := True;
  end;
    
  if FStayOnTopOff then 
    StopExtraProt := True; 
    
  DebugMsg('FormCreate 42');  
  visNumMaq('Maq' + sLineBreak + slConfig.Values[NomeMaq]);
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
  FPrintTransfer.Terminate;
  
  DebugMsg('TFrmPri.FormDestroy');

  try FAcessoRem.Terminate; except end;
  FCmd.Free;
  FslCmd.Free;
  UnhookApi(@ExitProcessNext);
  FreeMem(FBuf, 1024);
{  try
    ThProgAtual.Terminate;
  except
  end;  }
  if FPrintHookOk then
    Inject(False, 'guardprintapi.dll');

  FExes.Free;
  FslMenu.Free;
  FHosts.Free;
  if DesbloqTaskMgr then
    FProt.BloqueiaCtrlAltDel := False;
  FProt.DesativaProtecao;
  FProt.Free;
  FreeAndNil(FIni);
end;

procedure TFrmPri.CMAoDesativar(Sender: TObject);
begin
  CalcReconectar;
  if Fechar or (FNoNet=obFecharCMGuard) then
    FecharCMGuard 
  else 
  if Status<>sgSessao then
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
    if (GetTickCount - CMRem.TicksLastCom)>=5000 then begin
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
    FslMenu.SaveToFile(NexFoldersFileName);
    if TFrmDesktop.Create(Self).ConfiguraDesktop then begin
      FslMenu.LoadFromFile(NexFoldersFileName);
      CM.MaquinaObj.Menu := FslMenu.Text;
      CM.SalvaAlteracoesObj(CM.MaquinaObj, False);
      FIni.SetStrings(FslMenu);
    end;
{    except
    end;
  FIni.SetStrings(FslMenu);}
end;

procedure TFrmPri.SetCodTipo(const Value: Integer);
var 
  SI : TStShellItem;
begin
  if FCodTipo=Value then Exit;
  FStrTipo := 'Desktop'+IntToStr(Value);
  FCodTipo := Value;
  FConfigurouItensPerm := FIni.ReadBool('Geral', 'Configurado', False);
  
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

procedure TFrmPri.CMAoAtualizarConfig(Sender: TObject);
var SaveB : Boolean;
begin
  SaveB := BloqueioSitesAtivo;
  
  if Assigned(FrmPausa) and (FrmAtivo=FrmPausa) then 
    FrmPausa.AtualizaTela;
    
  RefreshRestr;

  CheckPrintServices;
  
  BloqueioSitesAtivo := gConfig.FiltrarWeb and (Status = sgSessao);

  if BloqueioSitesAtivo and (not SaveB) then begin
    uProg := '';
    uSite := '';
    CM.SalvaSiteProgAtual('', uProg, uSite);
  end;
  DebugMsg('TFrmPri.CMAoAtualizarConfig - gConfig.FiltrarWeb: ' + BoolStr[gConfig.FiltrarWeb] + ' - Status: ' + IntToStr(Status));
end;

procedure TFrmPri.CMAoAtualizarJob(Sender: TObject);
begin
  inherited;
  try
    FrmImp.AtualizaTela;
  except
  end;
end;

procedure TFrmPri.RefreshRestr;
var 
  S: TncSessao;
  M: TncMaquina;
begin
//  lvDesktop.Color := gConfig.CorDesktop;
//  lvDesktop.Font.Color := gConfig.CorFDesktop;
  DebugMsg('RefreshRestr 1');

  M := CM.MaquinaObj;

  DebugMsg('RefreshRestr 2');

  UpdateHomePage;

  DebugMsg('RefreshRestr 3');
  

  if (M<>nil) and ((M.Direito=dmFree) or gConfig.PubToolbar) then
    ToolbarType := tbFree else
    ToolbarType := tbPremium;

  DebugMsg('RefreshRestr 4');
    
  TempoSumir := gConfig.TempoSumirLogin * 1000;

  FNoNet      := gConfig.NoNet;
  FFecharExp  := gConfig.BloqMenuIniciar;
  FMostraCron := not gConfig.EsconderCronometro;
  FrmLogin.RefreshTipoAcesso;

  DebugMsg('RefreshRestr 5');
  

  S := CM.SessaoMaq;

  DebugMsg('RefreshRestr 6');
  

  if (S<>nil) then
    AjustaVisEncerrar(S.TipoCli, S.Cliente);

  DebugMsg('RefreshRestr 7');
    
end;

procedure TFrmPri.RefreshToolbar;
begin
  FrmTop.Height := 30;
  FrmTop.Width := Screen.Width;
  if assigned(FrmTop) then FrmTop.RefreshToolbar;
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
  pInicio.RefreshItems;
  
  if (slConfig.Values['Servidor']='') or (slConfig.Values[NomeMaq]='') then
    Status := sgConfig else 
    Status := sgTentaAtivar;
  DebugMsg('TFrmPri.FirstConnTimer - OK');  
end;

procedure TFrmPri.AoMinimizar(Sender: TObject);
begin
  Application.Restore;
end;

procedure TFrmPri.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  inherited;
  DebugMsg('EXCEPTION: '+E.Message);
end;

procedure TFrmPri.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if (Msg.message = WM_LBUTTONDOWN) then
    gExpandAreaList.HandleMouseClick(Msg.pt.X, Msg.pt.Y)
  else
  if (Msg.message = WM_MOUSEMOVE) or (msg.pt.x>0) or (msg.pt.y>0) then 
    gExpandAreaList.HandleMouseMove(Msg.pt.X, Msg.pt.Y)
  else
  if (MSG.message = WM_MOUSELEAVE) then 
    gExpandAreaList.HandleMouseMove(9999, 9999);
  Handled := False;
end;

procedure TFrmPri.AjustaFrmSessaoAtivo(S: TncSessao);
var J : TncJob;
begin
    if (FrmAlteraSenha=nil) and (gConfig.ControlaImp>0) and (S<>nil) and (Status=sgSessao) then begin 
      if gConfig.PMPDF then begin
        FrmPrintReview.Ativo := FrmPrintReview.TemImp;
        if FrmPrintReview.Ativo then
          FrmPrintReview.Sessao := S.ID;
      end else begin
        FrmPrintReview.Ativo := False;
        J := CM.Jobs.JobPendMaq(CM.Maquina, True);
        FrmImp.Ativo := (J<>nil) and (J.ClientPages>0) and gConfig.PMPausaAutomatica and gConfig.PMConfirmaImpCliente;
      end;
    end else begin
      FrmImp.Ativo := False;
      FrmPrintReview.Ativo := False;
    end;

    if Assigned(FrmAlteraSenha) or FrmImp.Ativo or FrmPrintReview.Ativo then 
      FrmMsgCli.Ativo := False else 
      FrmMsgCli.Ativo := (FStatus=sgSessao) and (S<>nil) and (S.MsgCliList.Count>0);
end;

procedure TFrmPri.AjustaTamanho;
begin
{  Height := Screen.WorkAreaHeight;
  Width := Screen.WorkAreaWidth;
  Left := 0;
  Top := 0;}
end;

procedure TFrmPri.AjustaVisEncerrar(aTipoCli, aCliente: Integer);
begin
  if (aTipoCli=tcManutencao) or 
     ((aCliente>0) and (not gConfig.CliCadNaoEncerra)) or 
     ((aCliente=0) and (not gConfig.CliAvulsoNaoEncerra)) 
  then
    visEncerrar(True) else
    visEncerrar(False);
end;

procedure TFrmPri.OnConfirmouImp(Sender: TObject; aInfo: TStrings);
begin
  FPrintTransfer.AddArqUpload(aInfo);
end;

procedure TFrmPri.OnCreatingDoc(Sender: TObject);
var S: TncSessao;
begin
  if FStatus=sgSessao then 
    S := CM.SessaoMaq else
    S := nil;
  if Assigned(S) then 
    AjustaFrmSessaoAtivo(S);  
end;

procedure TFrmPri.OnForcarFechamento(Sender: TObject);
begin
  try
    FechaProgramas(TTimer(Sender).Tag);
  finally
    Sender.Free;
  end;
end;

procedure TFrmPri.OnForcarFechamentoCH(Sender: TObject);
begin
  try
    FechaBrowser(brCH, TTimer(Sender).Tag);
  finally
    Sender.Free;
  end;
end;

procedure TFrmPri.OnForcarFechamentoFF(Sender: TObject);
begin
  try
    FechaBrowser(brFF, TTimer(Sender).Tag);
  finally
    Sender.Free;
  end;
end;

procedure TFrmPri.OnForcarFechamentoIE(Sender: TObject);
begin
  try
    FechaBrowser(brIE, TTimer(Sender).Tag);
  finally
    Sender.Free;
  end;
end;

function TFrmPri.OnPInicio(pid: Cardinal): Boolean;
var i: integer;
begin
  for I := 0 to pInicio.ItemCount - 1 do
    if pInicio[I].ID=pid then begin
      Result := True;
      Exit;
    end;
    
  Result := False;
end;

procedure TFrmPri.OnPTProgress(Sender: TObject; Arq: TGUID; aPos,
  aTotal: Cardinal; aFailed: Boolean);
begin
  FrmPTProgress.PB.Properties.Max := aTotal;
  FrmPTProgress.PB.Position := aPos;
  FrmPTProgress.Centraliza;
  FrmPTProgress.Show;
  FrmPTProgress.TimerHide.Enabled := aFailed or (aPos=aTotal);
end;

procedure TFrmPri.OnRedownload(Sender: TObject);
begin
  try
    case TTimer(Sender).Tag of
      0 : Self.DownloadNexAP;
      1 : Self.DownLoadNexPrinter;
    end;
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
  FrmPrintReview.OnCreatingDoc := OnCreatingDoc;
  Height := 0;
  Width := 0;
        
  AjustaTamanho;
  Application.Restore;

  FrmPrintReview.OnConfirmouImp := OnConfirmouImp;
  
  if FrmChat= nil then begin
    FrmChat := TFrmBaseChat.Create(Self);
    FrmChat.NumMaq := CM.Maquina;
    FrmChat.EnviarMsg := EnviarMsg;
    FrmChat.NaoPiscar := True;
  end;
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
{  S := UpperCase(FiltraSt(S, ':\/*?|"<>'));
  with lvDesktop.ShellItems do 
  for I := 0 to Count-1 do 
  if UpperCase(Items[I].DisplayName) = S then begin
    Result := Items[I];
    Exit;
  end;  }
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
{  Exit;
  FExes.Clear;
  SE.Execute;}
end;

procedure TFrmPri.SEEnumItem(Sender: TObject;
  ShellItem: TStShellItem; var Accept: Boolean);
var S: String;  
begin
  with ShellItem do begin
{    S := Path;
    if IsLink then begin
      SC.ShortcutFileName := S;
      if Pos('.PIF', UpperCase(S))=0 then 
        SC.ResolveShortcut;
      S := SC.FileName;
    end;
    S := UpperCase(S);
    if FExes.IndexOf(S)=-1 then
      FExes.Add(S);}
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

function TFrmPri.GetNonEnumText: String;
const
  BoolEnumStr : Array[Boolean] of Char = ('0', '1');
var 
  I, TA : Integer;
  S: TncSessao;
begin
  Result := sCLSID_MeuComp + '=' + BoolEnumStr[not gConfig.BloqMeuComputador] + sLineBreak +
            sCLSID_Lixeira + '=' + BoolEnumStr[not gConfig.BloqLixeira] + sLineBreak;
  DebugMsg('TFrmPRI.GetNonEnumText: ' + sLineBreak+sLineBreak+Result+sLineBreak);          
{  if (S=nil) or (S.TipoCli=tcManutencao) then Exit;
  TA := S.TipoAcesso;
  for I := 0 to slNonEnumNames.Count - 1 do
    Result := Result + slNonEnumNames.ValueFromIndex[I] +'=' + BoolEnumStr[
      FIni.ReadBool('TA'+IntToStr(TA)+'_WinIcons', slNonEnumNames.ValueFromIndex[I], True)] + sLineBreak;}
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
  aIgnorar: Boolean;

procedure SetCopias(I: Integer);
begin
  if I>FCopias then FCopias := I;
end;

begin
  // was it really a message from our dll?
  DebugMsg('');
  DebugMsg('----- PrintNotification -----------------------------------------------------------');
  
  if Message.lParam <> $777 then begin
    DebugMsg('PRINTAPI: INVALID MESSAGE *****************');
    Exit;
  end;

  if gConfig.PMPDF or (gConfig.ControlaImp<1) then begin
    DebugMsg('TFrmPri.HanlePrintNotification: EXIT - PMPDF ou Controle impressões OFF');
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
      SetCopias(StrToIntDef(SoDig(S), 1));
    end else
    if Pos('STARTDOC', S)=1 then begin
      P := Pos('output: "', Params);
      aIgnorar := False;
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
          aIgnorar := True;
          FIgnoreDoc := Copy(S, 1, Pos(';', S)-1);
          DebugMsg('FIgnoreDoc='+FIgnoreDoc);
        end;
      end;
      if not aIgnorar then begin
        FDoc := Copy(Params, Pos('"', Params)+1, 255);
        FDoc := Copy(FDoc, 1, Pos('"', FDoc)-1);
        SetCopias(1);
        P := StrToIntDef(Copy(Result, Pos('$', Result), 20), 0);
        FJobID := P;
        try
          if (P>0) and CM.Ativo then begin
            DebugMsg('SalvaClientPages - JobID: ' + IntToStr(P) + ' - CM.Maquina: ' + IntToStr(CM.Maquina));
            CM.SalvaClientPages(FPrinter, P, CM.Maquina, 0);
          end else
            DebugMsg('SalvaClientPages - NAO Executado - JobID: ' + IntToStr(P));
        except
          on E: Exception do 
            DebugMsg('CM.SalvaClientPages - JobID: ' + IntToStr(P) + ' - Maq: ' + IntToStr(CM.Maquina));
        end;
      end;
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
      SetCopias(StrToIntDef(SoDig(S), 1));
      DebugMsg('DOCPROP - Copias = '+IntToStr(FCopias));
    end else
    if (Pos('ENDDOC', S)=1) or (Pos('ABORTDOC', S)=1) then begin
      if Pos(FIgnoreDoc, Params)>0 then FIgnoreDoc := '';
      if (FPaginasImp>0) then
      if CM.Ativo then
      try
        DebugMsg('PaginasImpressas - JobID: ' + IntToStr(FJobID) +
                 ' - Paginas'+IntToStr(FPaginasImp*FCopias)+
                 ' - CM.Maquina: ' + IntToStr(CM.Maquina) +
                 ' - Printer: ' + FPrinter +
                 ' - Doc: ' + FDoc);
        if SameText('Curriculum.exe', ExtractFileName(Process)) then begin
          FCopias := 1;
          FPaginasImp := 1;
          DebugMsg('Curriculum.exe é sempre 1 página');
        end;
        CM.PaginasImpressas(FJobID, CM.Maquina, FPaginasImp*FCopias, FPrinter, FDoc)
      except
        on E: Exception do 
          DebugMsg('PaginasImpressas - Exception: ' + E.Message);
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

procedure TFrmPri.StartPrintInj;
begin
  if FPrintHookOk then begin
    FPSStatus := ps_on_inj;
    DebugMsg('Hook já está OK');
    Exit;
  end;

//  if (Win32Platform <> VER_PLATFORM_WIN32_NT) and (not gConfig.RegImp98) then Exit;
  // create an ipc message queue, so that our hook dll can contact us
  if not FIPCOk then
  if not CreateIpcQueue(pchar('guardPrintMonitor' + IntToStr(GetCurrentSessionId)),
                        IpcPrintMessageCallback) then begin
    DebugMsg('Falha em CreateIpcQueue');
    Exit;
  end else begin
    FIPCOk := True;
    DebugMsg('CreateIPCQueue OK');
  end;
    
  // the main work is done by our dll
  // which we inject into all processes in our session
  FPrintHookOk := Inject(True, 'guardprintapi.dll');

  if FPrintHookOk then begin
    FPSStatus := ps_on_inj;
    DebugMsg('Hook injected OK');
  end else
    DebugMsg('inject failed '+IntToStr(GetLastError));
end;

procedure TFrmPri.StartPrintPDF;
begin
  DebugMsg('TFrmPri.StartPrintPDF');
  try
    DownloadNexPrinter;
    FPSStatus := ps_on_pdf;
    RemovePrinters(False);
  except
    on E: Exception do 
     DebugMsgEsp('TFrmPri.StartPrintPDF - E.Exception: ' + E.Message, False, True);
  end;
end;

function ObtemIPLocal: String;
var 
  IP: TLocalIPObj;
  I : Integer;
begin
  IP := TLocalIPObj.Create;
  try
    if IP.IPCount>0 then
      Result := IP.GetIPFromList(0) else
      Result := '0';
  finally
    IP.Free;
  end;
end;

function TFrmPri.NomeMaq: String;
begin
  DebugMsg('TFrmPri.NomeMaq 1');
  Result := '';
  if SameText(slConfig.Values['MaqPorIP'], 'S') then 
    Result := ObtemIPLocal
  else
  if SameText(slConfig.Values['MaqPorUsuario'], 'S') then
    result := SysInfo.CurrentUser
  else begin
    DebugMsg('TFrmPri.NomeMaq 2');
    Result := SysInfo.Environment.Values['SESSIONNAME'];
    if Pos('hydrapark', Result)=0 then begin 
      Result := SysInfo.Environment.Values['CLIENTNAME'];
      DebugMsg('TFrmPri.NomeMaq 3');
    end;
  end;
  if Result='' then begin
    Result := 'Console';
    DebugMsg('TFrmPri.NomeMaq 4');
  end;
  if sameText('Console', Result) then 
    if (Trim(slConfig.Values['Console'])='') and (Trim(slConfig.Values['Maquina'])>'') then
    begin
      slConfig.Values['Console'] := slConfig.Values['Maquina'];
      slConfig.Delete(slConfig.IndexOfName('Maquina'));
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
        visSenhaCaption('Criar Senha') else
        visSenhaCaption('Alterar Senha');
    end;    
  finally
    StatusSenha := ssSenhaOK;
  end;    
end;

procedure Convert_jpeg2bmp(aSource, aDest: String);
var
  B : TBitmap;
  J : TJpegImage;
begin
  J := TjpegImage.Create;
  try
    J.LoadFromFile(aSource);
    B := TBitmap.Create;
    try
      B.Assign(J);
      B.SaveToFile(aDest);
    finally
      B.Free;
    end;
  finally
    J.Free;
  end;
end;

procedure TFrmPri.TimerDesktopTimer(Sender: TObject);

procedure AjustaFundo(aNomeArq: String);
var S: String;
begin
  S := ExtractFilePath(aNomeArq)+'wallpaper.bmp';
  TThreadConvertJpeg.Create(aNomeArq, S);
end;

begin
  TimerDesktop.Enabled := False;
  if FileExists(ArqImFundo) then begin 
    DebugMsg('TimerDesktop ' + ArqImFundo);
    AjustaFundo(ArqIMFundo);
//    SetListViewBkImage(GetDesktopListViewHandle, ArqImFundo);
  end else begin
    DebugMsg('TimerDesktop Não Existe ' + ArqImFundo);
    if (CM.NomeArqDesktop>'') then begin
      if FileExists(CM.NomeArqDesktop) then begin
        DebugMsg('TimerDesktop 2: ' + CM.NomeArqDesktop);
        AjustaFundo(CM.NomeArqDesktop);
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
        if Ativo then begin
          DebugMsgEsp('TFrmPri.TimerEncerrar - 1', False, False);
          LogoutMaq(Maquina);
        end;
      end else begin
        if Ativo then begin
          DebugMsgEsp('TFrmPri.TimerEncerrar - 2', False, False);
          PreLogoutMaq(Maquina);
        end;
      end;
    end;
  finally
    Sender.Free;
  end;
end;

procedure TFrmPri.TimerFirewallTimer(Sender: TObject);
begin
  TimerFirewall.Enabled := False;
  try
    allowexceptionsonFirewall;
    addApplicationToFirewall('NexCafé Guard', ParamStr(0));
  finally
    TimerFirewall.Interval := 60000 * 5;
    TimerFirewall.Enabled := True;
  end;
end;

procedure TFrmPri.TimerHomePageChromeTimer(Sender: TObject);
begin
  if (not KillExpTimer.Enabled) and IsExplorerRunning then begin
    try
      ShellExecute(0, 'Open', PChar(gConfig.HomePageURL(True)), nil, nil, SW_ShowMaximized);
    finally
      TimerHomePageChrome.Enabled := False;
    end;
  end;
end;

procedure TFrmPri.TimerPSStatusTimer(Sender: TObject);
begin
  CheckPrintServices;
end;

procedure TFrmPri.TimerIPConfigTimer(Sender: TObject);
begin
  inherited;
  TimerIPConfig.Enabled := False;
  FslCmd.Text:= '';
  FCmd.Execute;
end;

procedure TFrmPri.TimerLoginTimer(Sender: TObject);
begin
  TimerLogin.Enabled := False;
  FrmLogin.RefreshFundo;
end;

procedure TFrmPri.CMAoMonitorOnOff(Sender: TObject; aMaq: Word; aOn: Boolean);
begin
  inherited;
  if aMaq=CM.Maquina then
  if aOn then begin
    DebugMsg('TFrmPri.CMAoMonitorOnOff 1 - aMaq: '+ IntToStr(aMaq) + ' - aOn: ' + BoolStr[aOn]);
    SendMessage(Handle, WM_SYSCOMMAND, SC_MONITORPOWER, -1);
  end else begin
    DebugMsg('TFrmPri.CMAoMonitorOnOff 2 - aMaq: '+ IntToStr(aMaq) + ' - aOn: ' + BoolStr[aOn]);
    SendMessage(Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
  end;
end;

procedure TFrmPri.CMAoMudarFundo(Desktop: Boolean);
begin
  if Desktop then 
    TimerDesktop.Enabled := True else
    TimerLogin.Enabled := True;
end;

procedure TFrmPri.EnviarMsg(const aPara: Integer; const aTexto: String);
begin
  CM.EnviaChat(aPara, aTexto);
end;

procedure TFrmPri.Esconder;
begin
  // 
end;

procedure TFrmPri.EvLogLogDataFilter(const aLogData: InxLogData;
  var aFiltered: Boolean);
begin
  aFiltered := False;
end;

procedure TFrmPri.CMAoReceberChat(Sender: TObject; MsgID, De,
  Para: Integer; DataHora: TDateTime; Texto: String);
begin
  if FrmChat <> nil then
  begin
{    if FrmChat.Visible = False then
      cmChatClick(nil);}
    FrmChat.MsgEnv(DataHora, De, Para, Texto);
    FrmChat.Show;
    FrmChat.Restaura;
  end;
end;

procedure TFrmPri.panChatClick(Sender: TObject);
begin
  inherited;
  FrmChat.Show;
  FrmChat.Restaura;
end;

procedure TFrmPri.panHChatClick(Sender: TObject);
begin
  FrmChat.meTexto.SetFocus;
end;


procedure TFrmPri.panTempoMouseEnter(Sender: TObject);
begin
  inherited;
  TLMDSimplePanel(Sender).Color := $009D7135;
end;

procedure TFrmPri.panTempoMouseExit(Sender: TObject);
begin
  inherited;
  TLMDSimplePanel(Sender).Color := $0059401E;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  StopExtraProt := True;
end;

procedure TFrmPri.TimerA4Timer(Sender: TObject);
begin
  inherited;
  if NexPrinterInstalled then begin
    TimerA4.Enabled := False;
    RestoreNexPrinterDefaultDim;
  end;
end;

procedure TFrmPri.CMAoAtualizarSessao(Sender: TObject);
var S : TncSessao;
begin
  S := TncSessao(Sender);

  DebugMsg('TFrmPri.CMAoAtualizarSessao - CM.Maquina: ' + IntToStr(CM.Maquina) + ' - S.Maquina: ' + IntToStr(S.Maq)+' - S.ID: ' + IntToStr(S.ID));

  if S.Maq=CM.Maquina then begin
    FrmMsgCli.AtualizaTela;
    if (S.TipoCli<>tcManutencao) and 
       (Status in [sgSessao, sgPausaSessao]) then 
      TncProtege98(FProt).PermitirDownload(S.PermitirDownload, S.PermitirDownloadExe);
  end;

  if not FConectando then  
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

function TFrmPri.GetAutoServName: String;
var 
  sl : TStrings;
  i : integer;
  s : string;
begin
  DebugMsg('TFrmPri.GetAutoServName 1');

  if not SameText(slConfig.Values['Servidor'], 'auto') then begin
    Result := slConfig.Values['Servidor'];
    Exit;
  end;
  
  sl := TStringList.Create;
  try
    Result := Trim(slConfig.Values['UltimoServidor']);
    DebugMsg('TFrmPri.GetAutoServName 2');
    nxTCPIP.GetServerNames(sl, 500);
    DebugMsg('TFrmPri.GetAutoServName 3');
    sl.Text := UpperCase(sl.text);

    for i := 0 to sl.count-1 do begin
      s := sl[i];
      delete(s, 1, pos('@', s));
      sl[i] := s;
    end;
      
    if Result>'' then
      if sl.IndexOf(UpperCase(Result))=-1 then
        Result := '';

    if (Result='') and (sl.Count>0) then 
      Result := sl[0];
    DebugMsg('TFrmPri.GetAutoServName 4');
  finally
    sl.Free;
  end;
  DebugMsg('TFrmPri.GetAutoServName 5');
  
end;

procedure TFrmPri.OnTerminateScan(Sender: TObject; ExitCode: LongWord);
begin
  if ExitCode = 0 then 
    PostMessage(Handle, WM_USER + 779, 0, 0);
end;

procedure TFrmPri.OnTimerRecriaAppBar(Sender: TObject);
begin
  FrmConn.RefreshConexao;
end;

procedure TFrmPri.OpenHomePub(M: TncMaquina);
begin
   // Ajustar config para versão X211
   gConfig.PubHomePage := false;

  if (((M<>nil) and (M.Direito=dmFree)) or gConfig.PubHomePage) then begin
    FHomeOpened := True;
//    ShellExecute(0, 'Open', PChar(gConfig.HomePageURL(True)), nil, nil, SW_Maximize);
//    ShellExecute(0, 'Open', PChar(ExtractFilePath(ParamStr(0))+'nexopenhp.exe'), PChar(gConfig.HomePageURL(True)), nil, SW_Maximize);
    
    if DefBrowser<>brCH then begin
      if DefBrowser=brNenhum then
        ShellExecute(0, 'Open', PChar('iexplore.exe'), nil, nil, SW_ShowMaximized) else
        ShellExecute(0, 'Open', PChar(gConfig.HomePageURL(True)), nil, nil, SW_ShowMaximized);
    end else
      TimerHomePageChrome.Enabled := True;
  end;
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
  Exit;
  
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
  Exit;
  
  if aLeHosts then LeHosts;
  S := FHosts.Text;
  I := Pos('#inicio_nexcafe', S);
  if I > 0 then begin 
    Delete(S, I, Length(S));
    FHosts.Text := S;
    if aSalvaHosts then SalvaHosts;
  end;  
end;

procedure TFrmPri.DownloadIntInfo(var Msg: TMessage);
var DI : TncThDownloadInfo;
begin
  DI := TncThDownloadInfo(Msg.WParam);
  with DI do 
  try
    if Erro = 0 then begin
      DebugMsg('TFrmPri.DownloadIntInfo - OK');
      slConfig.Values[Arq] := IntToStr(VersaoServ);
      slConfig.SaveToFile(IniFName);

      if SameText(Arq, 'novapv.exe') then begin
        InstallNexPrinter(True);
        TimerA4.Enabled := True;
      end;
    end else 
    if Erro = ncerrFalhaDownloadInt then begin
      DebugMsg('TFrmPri.DownloadIntInfo - Falha de download: '+IntToStr(Erro)+' - VersaoServ: '+IntToStr(VersaoServ));
      with TTimer.Create(Self) do begin
        Interval := 10000+Random(10000);
        OnTimer := Self.OnRedownload;
        Enabled := True;
        if SameText('novapv.exe', Arq) then
          Tag := 1 else
          Tag := 0;
      end;
    end;
  finally
    DI.Free;
  end;
end;

procedure TFrmPri.DownloadNexAP;
{var 
  V: Integer;
  S: String;}
begin
{  V := 0;
  S := ExtractFilePath(ParamStr(0))+'nexap.exe';
  if FileExists(S) then 
    V := StrToIntDef(slConfig.Values['nexap.exe'], 0);
  TncTHDownloadInt.Create('nexap.exe', V, S, nxTCPIP, Handle).Resume;}
end;

procedure TFrmPri.DownLoadNexPrinter;
{var 
  V: Integer;
  S: String;}
begin
{  V := 0;
  S := ExtractFilePath(ParamStr(0))+'novapv.exe';
  if NexPrinterInstalled then
    V := StrToIntDef(slConfig.Values['novapv.exe'], 0) 
  else begin
    DebugMsg('TFrmPri.DownloadNexPrinter - BackupPrinters');
    BackupPrinters;
  end;
    
  TncTHDownloadInt.Create('novapv.exe', V, S, nxTCPIP, Handle).Resume;}
  if not NexPrinterInstalled then begin
    TdmArqs.Create(Self).ExtractNovaPV;
    InstallNexPrinter(True);
  end;
end;

procedure TFrmPri.cmVerCreditosClick(Sender: TObject);
begin
//  cmTempoClick(nil);
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
    DebugMsg('TFrmPri.SalvaHosts');
    FHosts.SaveToFile(HostsFN);
    DebugMsg(FHosts.Text);
    DebugMsg('TFrmPri.SalvaHosts - OK');
  except
    on E: Exception do 
      DebugMsg('TFrmPri.SalvaHosts - Exception: ' + E.Message);
  end;
end;

procedure TFrmPri.ScanConfig;
var 
  M: TncMaquina;
  I: Integer;
  SL: TStringList;
  S, sType: String;
  TotalHD, FreeHD : Cardinal;
  DI : TLMDDriveInfo;
  W : TWindowsInfo;

begin
  M := CM.MaquinaObj;
  if M=nil then Exit;

  TimerIPConfig.Enabled := True;
  
  M.AtualizaCache;
  
  M.LastScan := Now;
//  M.IP := inet_ntoa(cmRem.clicom.IPPort.Socket.RemoteAddr.sin_addr);
  try
    DebugMsg('GetMACAdress 1');
    M.MacAddress := GetMACAdress;
  except
    DebugMsg('GetMACAdress 2');
    M.MacAddress := GetMacAddress('');
  end;
  DebugMsg('GetMACAdress');
  M.LastScan := Now;
  M.DisplayW := DispSw.CurrentWidth;
  M.DisplayH := DispSw.CurrentHeight;
  M.ComputerName := SysInfo.Computername;
  DebugMsg('TFrmPri.ScanConfig - M.ComputerName 1 = ' + M.ComputerName);
  DebugMsg('TFrmPri.ScanConfig - M.ComputerName 2 = ' + M.ComputerName);
  M.RAM := SysInfo.MemPhysTotal;
  DebugMsg('TFrmPri.ScanConfig - M.ComputerName 3 = ' + M.ComputerName);
  
  M.Printers := SysInfo.AllPrinters.Text;
  W := TWindowsInfo.create;
  try
    M.OS := W.AsString;
  finally
    W.Free;
  end;

  DebugMsg('TFrmPri.ScanConfig - M.ComputerName 4 = ' + M.ComputerName);
  
  
{  try
    M.CPU := cxCPU.Processors[0].Name.AsString;
  except
    M.CPU := '';
  end;}

  DebugMsg('TFrmPri.ScanConfig - M.ComputerName 5 = ' + M.ComputerName);
  
  SL := TStringList.Create;
  try
    TotalHD := 0;
    FreeHd := 0;
    S := '';
    try
      SysInfo.GetDriveList(SL);
      for I := 0 to SL.Count - 1 do begin
        S := S + Copy(SL[I], 1, 1);
        sType := SL[I];
        if GetDriveType(PAnsiChar(sType)) = DRIVE_FIXED then begin
          DI := SysInfo.GetDriveInfo(SL[I]);
          TotalHD := TotalHD + (DI.diTotalSpace div 1024);
          FreeHD := FreeHD + (DI.diFreeSpace div 1024);
        end;
      end;
    except
    end;
    DebugMsg('TFrmPri.ScanConfig - M.ComputerName 6 = ' + M.ComputerName);
    M.Drives := S;
    DebugMsg('TFrmPri.ScanConfig - M.ComputerName 7 = ' + M.ComputerName);
    M.HDTotal := TotalHD;
    DebugMsg('TFrmPri.ScanConfig - M.ComputerName 8 = ' + M.ComputerName);
    M.HDFree := FreeHD;
    DebugMsg('TFrmPri.ScanConfig - M.ComputerName 9 = ' + M.ComputerName);
  finally
    SL.Free;
  end;
  DebugMsg('TFrmPri.ScanConfig - M.ComputerName 10 = '+M.ComputerName);
  CM.SalvaAlteracoesObj(M, False);
  DebugMsg('TFrmPri.ScanConfig - SalvaAlteracoesObj');
end;

function TFrmPri.HostsFN: String;
begin
  Result := SysInfo.WinSysPath+'\drivers\etc\hosts';
end;

procedure TFrmPri.CMAoBloquearSite(Sender: TObject; Adicionou: Boolean;
  URL: String);
begin
{  if gConfig.FiltrarWeb then begin
    BloqueioSitesAtivo := False;
    BloqueioSitesAtivo := gConfig.FiltrarWeb and (Status = sgSessao);
  end;  }
//  if not gConfig.FiltrarWeb then Exit;

  if (not Adicionou) and SameHost(FUFechaHost, URL) then 
    FUFechaHost := '';
  
  if Adicionou then 
    DebugMsg('TFrmPri.CMAoBloquearSite - Adicionou: True') else
    DebugMsg('TFrmPri.CMAoBloquearSite - Adicionou: False');
    
  if Adicionou and BloqueioSitesAtivo then 
    FechaHost(URL);
end;

procedure TFrmPri.CMAoChecaLic(Sender: TObject);
begin
{  if gConfig.CodLojaInt>0 then
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
  end;}

end;

function TFrmPri.SemSenha: Boolean;
begin
  with FrmPri.CM.Usuarios do 
  Result := (Count=0) or
            ((Count=1) and SameText(Itens[0].Username, 'admin') and (Itens[0].Senha=''));
end;

procedure TFrmPri.SendIPConfig(var Message: TMessage);
var M: TncMaquina;
begin
  M := CM.MaquinaObj;
  if M=nil then Exit;
  M.AtualizaCache;
  M.IPConfig := FslCmd.Text;
  CM.SalvaAlteracoesObj(M, False);
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


function TFrmPri.IDSessao: Integer;
var S : TncSessao;
begin
  S := CM.SessaoMaq;
  if S<>nil then
    Result := S.ID else
    Result := 0;
end;

procedure TFrmPri.KillExpTimerTimer(Sender: TObject);
begin
  KillExpTimer.Enabled := False;
  KillExplorer;
end;

procedure TFrmPri.lbFecharCredClick(Sender: TObject);
begin
  inherited;
  visCreditoRestr(False);
end;

function TFrmPri.GetFormAtivo: TFormBaseGuard;
begin
  if FrmFST.Visible then
    Result := FrmFST.ActiveForm else
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
      DebugMsg('TFrmPri.SetFormAtivo - Form: '+S);  
    except
    end;

    if (GetFormAtivo<>Value) and (GetFormAtivo=Self) and (FrmTop<>nil) then 
      if Assigned(FrmTop.OnHide) then FrmTop.OnHide(FrmTop);

    if (Value=FrmLogin) or (Value=FrmConn) or (Value=FrmPausa) then begin
      FrmFST.ActiveForm := Value;
      FrmFST.Mostrar;
      Self.Esconder;
    end else begin
      FrmFST.Esconder;
      if Value<>nil then Value.Mostrar;
    end;
  
    if Value<>Self then begin
      FrmPrintReview.Ativo := False;
      FrmImp.Ativo := False;
      FrmMsgCli.Ativo := False;
    end else 
    if (FrmTop<>nil) and Assigned(FrmTop.OnShow) then 
      FrmTop.OnShow(FrmTop);
end;

procedure TFrmPri.UpdateHomePage;
var 
  M : TncMaquina;
  S : String;
begin
  // Ajustar config para versão X211
  gConfig.PubHomePage := false;

  try
    M := CM.MaquinaObj;
    if M=nil then
      DebugMsg('TFrmPri.UpdateHomePage - M=Nil - Maq: ' + IntToStr(CM.Maquina)) else
      DebugMsg('TFrmPri.UpdateHomePage - M.Direito: ' + IntToStr(M.Direito) + ' - gConfig.PubHomePage: ' + BoolStr[gConfig.PubHomePage]);
    
    S := gConfig.HomePageURL((M=nil) or (M.Direito=dmFree) or gConfig.PubHomePage);
    if S<>'' then begin
      DebugMsg('TFrmPri.UpdateHomePage - ' + S);
      ChangeHomePage(S, gConfig.HomePage_Tab);
    end else begin
      DebugMsg('TFrmPri.UpdateHomePage - Sem HomePage');
      Chrome_Remove_NexCafe_Ext;
    end;
  except
    on E: Exception do 
      DebugMsg('TFrmPri.UpdateHomePage - Exception: ' + E.Message);
  end;
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

procedure TFrmPri.visAlterarSenha(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visAlterarSenha(aVisible);
end;

procedure TFrmPri.visBloqBotaoDir(aBloq: Boolean);
begin

end;

procedure TFrmPri.visChat(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visChat(aVisible);
end;

procedure TFrmPri.visConfig(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visConfig(aVisible);
end;

procedure TFrmPri.visCreditoRestr(aVisible: Boolean);
begin
  AvisoCreditos := False;
  panCredRestr.Visible := aVisible;
end;

procedure TFrmPri.visCredRestrCaption(aCaption: String);
begin
  lbCredRestr.Caption := aCaption;
end;

procedure TFrmPri.visDebito(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visDebito(aVisible);
end;

procedure TFrmPri.visDebitoCaption(aDeb, aTot: String);
begin
  if Assigned(FrmTop) then FrmTop.visDebitoCaption(aDeb, aTot);
end;

procedure TFrmPri.visDesktop(aVisible: Boolean);
begin

end;

procedure TFrmPri.visDesktopColor(aColor: TColor);
begin
  
end;

procedure TFrmPri.visDesktopEnabled(aEnabled: Boolean);
begin

end;

procedure TFrmPri.visDesktopFontColor(aFontColor: TColor);
begin

end;

procedure TFrmPri.visEncerrar(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visEncerrar(aVisible);
end;

procedure TFrmPri.visFecharNex(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visFecharNex(aVisible);
end;

procedure TFrmPri.visNome(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visNome(aVisible);
end;

procedure TFrmPri.visNomeCaption(aCaption: String);
begin
  if Assigned(FrmTop) then FrmTop.visNomeCaption(aCaption);
end;

procedure TFrmPri.visNoNet(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visNoNet(aVisible);
end;

procedure TFrmPri.visNumMaq(aCaption: String);
begin
  if Assigned(FrmTop) then FrmTop.visNumMaq(aCaption);
end;

procedure TFrmPri.visPontos(aVisible: Boolean);
begin
  if Assigned(FrmTop) then begin
    DebugMsg('TFrmPri.visPontos(aVisible: ' + BoolStr[aVisible] +')');
    FrmTop.visPontos(aVisible);
  end;
end;

procedure TFrmPri.visPontosCaption(aCaption: String);
begin
  if Assigned(FrmTop) then FrmTop.visPontosCaption(aCaption);
end;

procedure TFrmPri.visSenhaCaption(aCaption: String);
begin
  if Assigned(FrmTop) then FrmTop.visSenhaCaption(aCaption);
end;

procedure TFrmPri.visTempo(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visTempo(aVisible);
end;

procedure TFrmPri.visTempoCaption(aCaption: String);
begin
  if Assigned(FrmTop) then 
    FrmTop.visTempoCaption(aCaption);
end;

procedure TFrmPri.visValor(aVisible: Boolean);
begin
  if Assigned(FrmTop) then FrmTop.visValor(aVisible);
end;

procedure TFrmPri.visValorCaption(aCaption: String);
begin
  if Assigned(FrmTop) then FrmTop.visValorCaption(aCaption);
end;


procedure TFrmPri.wmCheckPrintServices(var Message: TMessage);
begin
  DebugMsg('wmCheckPrintServices');
  CheckPrintServices;
end;

procedure TFrmPri.Conectar(Reconexao: Boolean);
begin
  try
    DebugMsg('TFrmPri.Conectar - Reconexao: '+BoolStr[Reconexao]);
    FConectando := True;
    try
      _Conectar(Reconexao);
    finally
      FConectando := False;
    end;
    DebugMsg('Conectou!');
  except
    on e: exception do begin
      DebugMsg('Erro Conectar: '+E.Message);
      UErroStr := E.Message;
      Raise;
    end;
  end;
end;

procedure TFrmPri.CreateCM;
begin
  CMRem := TncNXServRemoto.Create(Self);
  CMRem.CmdHandler := nxCmdH;
  CMRem.Session := nxSession;
  CMRem.Transp := nxTCPIP;
  CMRem.OnProgressoArq := CMRemProgressoArq;

  CM := TClienteNexCafe.Create(Self);
  CM.AutoAtualizar := True;
  CM.CacheConexao := True;
  CM.Programa := 'ncguard.exe';
  CM.Senha := 'proxypass';
  CM.Servidor := CMRem;
  CM.Username := 'proxy';
  CM.AoAtivar := CMAoAtivar;
  CM.AoAtualizarConfig := CMAoAtualizarConfig;
  CM.AoAtualizarJob := CMAoAtualizarJob;
  CM.AoAtualizarMaquina := CmAoAtualizarMaquina;
  CM.AoAtualizarSessao := CMAoAtualizarSessao;
  CM.AoAtualizarTarifa := CMAoAtualizarTarifa;
  CM.AoAtualizarTipoAcesso := CmAoAtualizarTarifa;
  CM.AoBloquearSite := CmAoBloquearSite;
  CM.AoChecaLic := CMAoChecaLic;
  CM.AoDesativar := CMAoDesativar;
  CM.AoDestruirSessao := CmAoAtualizarSessao;
  CM.AoDestruirTarifa := CMAoAtualizarTarifa;
  CM.AoDestruirTipoAcesso := CMAoAtualizarTarifa;
  CM.AoFinalizaProcesso := CmAoFinalizaProcesso;
  CM.AoMonitorOnOff := CMAoMonitorOnOff;
  CM.AoMudarFundo := CMAoMudarFundo;
  CM.AoObtemProcessos := CMAoObtemProcessos;
  CM.AoPedirTela := CMAoPedirTela;
  CM.AoReceberChat := CMAoReceberChat;
  CM.AoSuporteRem := CMAoSuporteRem;
  CM.Shutdown := CMShutdown;
end;

procedure TFrmPri.SetNivelProt(const Value: Byte);
var
  S: TncSessao;
  U: TncUsuario;
begin
  if Value = FNivelProt then Exit;
  FProt.BloqueiaCtrlAltDel := gConfig.BloqCtrlAltDel;
  FProt.ClassicMenu := gConfig.ClassicStartMenu;

  case Value of
    npZero   : begin
      DebugMsg('TFrmPri.SetNivelProt(Value = npZero);');
      FProt.NoStartMenu := False;
      FProt.BloqueiaCtrlAltDel := not DesbloqTaskMgr;
      FProt.DesativaProtecao;
      BloqueioSitesAtivo := False;
    end;  
    
    npSessao : begin
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao);');

      visBloqBotaoDir(gConfig.BloqBotaoDir);
      
{      if gConfig.BloqBotaoDir then 
        lvDesktop.Options := lvDesktop.Options - [loShellMenu] else
        lvDesktop.Options := lvDesktop.Options + [loShellMenu];}
        
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 1');
      try
        RefreshDesktop;
//        lvDesktop.Refresh;
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
//      TFrmFake.Create(Self).ShowModal;
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
      if S<>nil then begin
        FProt.SetOpcaoBool(ncp_NoDownload, (not S.PermitirDownload));
        FProt.SetOpcaoBool(ncp_NoExeDownload, (not S.PermitirDownloadExe));
      end else begin
        FProt.SetOpcaoBool(ncp_NoDownload, gConfig.BloqDownload);
        FProt.SetOpcaoBool(ncp_NoExeDownload, gConfig.BloqDownloadExe);
      end;
      FProt.SetOpcaoBool(ncp_NoDocs, gConfig.BloqMeusDocumentos);
      FProt.SetOpcaoBool(ncp_NoToolbars, gConfig.BloqToolbars);
      FProt.SetOpcaoBool(ncp_NoCtrlPanel, gConfig.BloqPainelCtrl);
      FProt.SetOpcaoBool(ncp_NoRunCmd, gConfig.BloqExecutar);
      FProt.SetOpcaoBool(ncp_NoNetwork, gConfig.BloqMeusLocaisRede);
      FProt.SetOpcaoBool(ncp_NoRightClick, gConfig.BloqBotaoDir);
      FProt.NoStartMenu := gConfig.BloqMenuIniciar;
      FProt.HideDrives := gConfig.EsconderDrives;
      FProt.BloqueiaCtrlAltDel := gConfig.BloqCtrlAltDel;
      FProt.slNonEnum.Text := GetNonEnumText;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 10');
      FProt.AtivaProtecao;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - 11');
      Timer1.Enabled := True;
      DebugMsg('TFrmPri.SetNivelProt(Value = npSessao) - LAST;');
    end;
    
    npManut  : begin
     visBloqBotaoDir(False);
    
     DebugMsg('npManut');
//      TFrmFake.Create(Self).ShowModal;
      FProt.NoStartMenu := False;
      FProt.slNonEnum.Text := '';
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
      FProt.slNonEnum.Text := GetNonEnumText;
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

procedure TFrmPri.SetPSStatus(const Value: Byte);
begin
  if FPSStatus = Value then Exit;

  DebugMsg('TFrmPri.SetPSStatus - Value: '+ IntToStr(Value));

{  if (FPSStatus <> ps_on_pdf) and (FPSStatus<>ps_Nenhum) then begin
    RemovePrinters(True);
    DebugMsg('TFrmPri.SetPSStatus - RemovePrinter');
  end;}

  case Value of
    ps_off    : begin
      RestorePrinters;
      FPSStatus := ps_off;
    end;
    ps_on_inj : begin
      RestorePrinters;
      StartPrintInj;
    end;
    ps_on_pdf : StartPrintPDF;
  else
    FPSStatus := ps_Nenhum;  
  end;
end;

function TFrmPri.GetReconectar: Boolean;
begin
  Result := (FProxRecon>0);
end;

function TFrmPri.GetToolbarType: Byte;
begin
  if FrmTop=nil then
    Result := tbNenhuma else
    Result := FrmTop.ToolbarType;
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
{  lvDesktop.ViewStyle := vsList;
  lvDesktop.ViewStyle := vsIcon;}
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
        if SameText(M.Patrocinio, GetNextStrDelimCustom(S, chFldDelim)) then begin
          SiteG1 := GetNextStrDelimCustom(S, chFldDelim);
          SiteG2 := GetNextStrDelimCustom(S, chFldDelim);
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
var 
  M: TncMaquina;
  I: Integer;
  
begin
  M := CM.MaquinaObj;
  if M<>nil then
  if slMenu.Text <> M.Menu then begin
    slMenu.Text := M.Menu;
    slMenu.SaveToFile(NexFoldersFileName);
    FIni.SetStrings(FslMenu);

{    for I := 0 to gTiposAcesso.Count - 1 do
      if not FIni.ReadBool('Geral', 'TA'+IntToStr(gTiposAcesso[I].ID)+'_Configurado', False) then
      begin
        if FIni.ReadBool('Geral', 'Configurado', False) then begin
          FIni.
        end else
        
      end;}
    
    CodTipo := -1;
  end;  
end;

procedure TFrmPri.TimerShutdownTimer(Sender: TObject);
begin
  try
    try FAcessoRem.Desconectar; except end;
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
  TimerSite.Interval := 1800 + Random(1200);
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
            if (Site<>'') and SameHost(Site, FUFechaHost) and BloqueioSitesAtivo then
              FechaBrowser(brIE,0);
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
            if (Site<>'') and SameHost(Site, FUFechaHost) and BloqueioSitesAtivo then
              FechaBrowser(brFF,0);
          end;  
        finally
          DDE.CloseLink;
        end;
      except
      end;
    end else
    if sameText(S, 'chrome.exe') then begin
      S := GetURLFromChrome;
      if S<>'' then begin
        Site := FormataSiteStr(S);
        AlterouSite := True;
        if (Site<>'') and SameHost(Site, FUFechaHost) and BloqueioSitesAtivo then
          FechaBrowser(brCH, 0);
      end;
    end
    else begin
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
    ChamaSuporte('Máq.'+IntToStr(CM.Maquina), FrmLogin.VersaoStr, True);
end;

procedure LeGuardIS;
var SL: TStrings;
begin
  if FileExists(IniFName) then begin
    SL := TStringList.Create;
    try
      SL.LoadFromFile(IniFName);
      NoInj := SameText(SL.Values['NoInj'], 'S');
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


{ TThreadConvertJpeg }

constructor TThreadConvertJpeg.Create(aSource, aDest: String);
begin
  FSource := aSource;
  FDest := aDest;
  inherited Create(False);
end;

procedure TThreadConvertJpeg.Execute;
begin
  inherited;
  Convert_Jpeg2BMP(FSource, FDest);
  SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, PChar(FDest), SPIF_UPDATEINIFILE or SPIF_SENDCHANGE);
  Free;
end;

{ TThreadSyncDir }
function GetSelStateStr(aState : TJamSelectionState): String;
begin
  case aState of
    ssUnused: Result := 'ssUnused';
    JamSelectionList.ssDisabled: Result := 'ssDisabled';
    ssChecked: Result := 'ssChecked';
    ssUnChecked: Result := 'ssUnchecked';
    ssGrayed: Result := 'ssGrayed';
  end;
end;

procedure _DelFolder(aFolder: String; SL: TStrings; J: TJamSelectionList; sFrom, sTo: String);
var 
  SR : TSearchRec;
  S : String;
begin
  DebugMsg('_DelFolder - aFolder: ' + aFolder);
  SL.Add('@@@'+aFolder);
  if FindFirst(aFolder+'\*.*', faAnyFile, SR)=0 then
  try
    repeat
      if (SR.Name<>aFolder) and (SR.Name<>'.') and (SR.Name<>'..') then
      if (SR.Attr and faDirectory) = faDirectory then
        _DelFolder(aFolder+'\'+SR.Name, SL, J, sFrom, sTo)
      else begin
        S := aFolder+'\'+SR.Name;
        Delete(S, 1, Length(sFrom));
        S := sTo + S;
        if J.IsPathSelected(S) in [ssUnchecked] then
          SL.Add(aFolder+'\'+SR.Name);
      end;
    until FindNext(SR)<>0;
  finally
    FindClose(SR);
  end;
end;

procedure _DelTree(aFolder: String; J: TJamSelectionList; sTo: String);
var 
  SL : TStrings;
  I  : Integer;
  S  : String;
begin
  DebugMsg('_DelTree - aFolder: ' + aFolder + ' - sTo: ' + sTo);
  
  SL := TStringList.Create;
  try
    _DelFolder(aFolder, SL, J, aFolder, sTo);
    for I := SL.Count-1 downto 0 do begin
      S := SL[I];
      if Copy(S, 1, 3)<>'@@@' then begin
        DebugMsg('_DelTree - Windows.DeleteFile: ' + S);
        Windows.DeleteFile(PChar(S));
        SL.Delete(I);
      end;
    end;
    for I := SL.Count-1 downto 1 do begin
      S := SL[I];
      Delete(S, 1, 3);
      DebugMsg('_DelTree - RemoveDirectoty: ' + S);
      RemoveDirectory(PChar(S));
    end;
  finally
    SL.Free;
  end;
end;   


constructor TThreadSyncDir.Create(aTA: Integer; aOper: Byte);
begin
  FTA := aTA;
  FOper := aOper;
  inherited Create(False);
end;

procedure TThreadSyncDir.Execute;
var 
  J, jAtual: TJamSelectionList;
  JFO : TJamFileOperation;
  WS : WideString;
  S, sDestFolder, sFromFolder, sDest, sAnt : String;
  SD : TnexShellDir;

function SectionName(SD: TnexShellDir; aUser: Boolean): String;
begin
  case SD of
    sdDesktop: Result := '_Desktop';
    sdStartMenu: Result := '_StartMenu';
  else
    Result := '';
  end;

  if not aUser then Result := Result + 'Common';
end;

function Next(jsl: TJamSelectionList): Boolean;
begin
  WS := jsl.FindNext;
  S := WS;
  Result := (S>'');
  if Result then begin
    sDest := S;
    Delete(sDest, 1, Length(sFromFolder));
    sDest := sDestFolder + sDest;
    DebugMsg('TThreadSyncDir.NEXT' + sLineBreak + 
             '  S: ' + S + sLineBreak +
             '  sFromFolder: ' + S + sLineBreak +
             '  sDestFolder: ' + S + sLineBreak +
             '  sDest: ' + sDest);
  end;
end;

procedure SyncSD(SD: TnexShellDir);
var 
  B: Boolean;
  aState : TJamSelectionState;
  I : Integer;
begin

  for B := False to True do begin
    sDestFolder := GetShellDir(SD, B, False);
    sFromFolder := GetShellDir(SD, B, True);

    J.Clear;
    
    if FIni.ReadBool('Config', 'TA'+IntToStr(FTA)+'_OK', False) then begin
      J.LoadFromIniFile(NexFoldersFileName, 'TA'+IntToStr(FTA)+SectionName(SD, B));
      DebugMsg('TThreadSyncDir.SyncSD.Config_OK - TA: '+IntToStr(FTA));
    end else
    if SD=sdDesktop then begin
      if FIni.ReadBool('Geral', 'Configurado', False) then begin
        J.LoadFromIniFile(NexFoldersFileName, 'Desktop'+IntToStr(FTA));
        DebugMsg('TThreadSyncDir.SyncSD - LoadConfigAnterior - TA: ' + IntToStr(FTA));
      end else begin
        J.AddPathToSelection(sDestFolder);
        DebugMsg('TThreadSyncDir.SyncSD.AddPathToSelection - TA: ' + IntToStr(FTA)+' - sFromFolder: ' + sFromFolder);
      end;
    end;

    for I := J.Count - 1 downto 0 do
      if (Pos(UpperCase(sFromFolder), UpperCase(J.Path[I]))<>1) and (Pos(UpperCase(sDestFolder), UpperCase(J.Path[I]))<>1) then begin
        DebugMsg('TThreadSyncDir.SyncSD.Path Removed - Path: ' + J.Path[I]);
        DebugMsg('TThreadSyncDir.SyncSd.Path Removed - sFrom: ' + sFromFolder);
        DebugMsg('TThreadSyncDir.SyncSD.Path Removed - sDest: ' + sDestFolder);
        J.RemovePathFromSelection(J.Path[I]);
      end;

    if FOper=sdoper_excluir then begin
      DebugMsg('SyncSD - Oper = sdoper_excluir');
      DebugMsg('TThreadSyncDir.SyncSD - BEFORE _DellTree');
      _DelTree(sFromFolder, J, sDestFolder);
      DebugMsg('SyncSD.J.Paths.Text - ' + J.Paths.Text);
      
      jAtual.Clear;
      jAtual.AddPathToSelection(sFromFolder);
      jAtual.ResetFindNext;
      while Next(jAtual) do begin
        if not jAtual.IsFolder(WS) then begin
          aState := J.IsPathSelected(sDest);
          if (aState=ssUnchecked) or (aState=ssDisabled) then begin
            S := WS;
            DebugMsg('SyncSD.DeleteFile - ' + S);
            DeleteFile(S);
          end else
            DebugMsg('SyncSD.IsPathSelected - ' + GetSelStateStr(aState) + ' - ' + sDest);
        end;
      end;  
      jAtual.RemovePathFromSelection(sFromFolder);
    end;

    if FOper=sdoper_criar then begin
      DebugMsg('SyncSD - Oper = sdoper_criar');
      J.ResetFindNext;
      sDestFolder := GetShellDir(SD, B, True);
      sFromFolder := GetShellDir(SD, B, False);
      sAnt := '';
      while Next(J) do begin
        S := ExtractFilePath(sDest);
        if (S<>sAnt) and (not DirectoryExists(S)) then
          ForceDirectories(S);
        S := WS;  
        if not J.IsFolder(WS) then begin
          DebugMsg('TThreadSyncDir - CopyFile - From: ' + S + ' - To: ' + sDest);
          CopyFile(PChar(S), PChar(sDest), True);
        end else
          DebugMsg('TThreadSyncDir - IsFolder TRUE: ' + S);
      end;
    end;
    
  end;  
end;

begin
  csSyncDir.Enter;
  try
    try
      J := TJamSelectionList.Create(nil);
      jAtual := TJamSelectionList.Create(nil);
      try
        SyncSD(sdDesktop);
        SyncSD(sdStartMenu);
      finally
        jAtual.Free;
        J.Free;
      end;
    except
      on E: Exception do 
        DebugMsg('TThreadSyncDir - EXCEPTION: ' + E.Message);
    end;
  finally
    csSyncDir.Leave;
  end;  
  Free;
end;

initialization
  Randomize;
  csSyncDir := TCriticalSection.Create;

  LastKillExp := GetTickCount;
  
  slConfig := TStringList.Create;
  slNonEnumNames := TStringList.Create;

  slNonEnumNames.Add('Meu Computador={20D04FE0-3AEA-1069-A2D8-08002B30309D}');
  slNonEnumNames.Add('Lixeira={645FF040-5081-101B-9F08-00AA002F954E}');

  LoginGratis := False;
  SiteG1 := '';
  SiteG2 := '';
  slDominiosG  := TStringList.Create;
  DefBrowser := brNenhum;

  csProgAtual := TCriticalSection.Create;
  LeGuardIS;

  MessageID := RegisterWindowMessage('TaskbarCreated');
  if MessageID <>0 then
    SubClassApplication;
  

finalization
  csSyncDir.Free;
  slConfig.Free;
  slNonEnumNames.Free;
  csProgAtual.Free;
  slDominiosG.Free;

end.



