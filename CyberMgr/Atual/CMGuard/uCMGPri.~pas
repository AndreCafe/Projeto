unit uCMGPri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmCompCliente, LMDControl, LMDBaseControl, jpeg,
  LMDBaseGraphicControl, LMDGraphicControl, LMDBaseMeter, ShellApi,
  LMDCustomControl, LMDCustomPanel, DB, kbmMemTable,
  LMDCustomBevelPanel, LMDSimplePanel, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, LMDClock, LMDLEDCustomLabel, LMDLEDLabel,
  ExtCtrls, Menus, cmClassesBase, cmServRemoto, 
  LMDCustomStatusBar, LMDStatusBar, cmProtecao, cmProtecao98,
  WindowList, LMDCustomSimpleLabel, LMDSimpleLabel,
  ImgList, LMDCustomComponent, LMDStarter, LMDVersionInfo, 
  madremote, IniFiles, dxBarExtItems, dxBar, LMDSysInfo, ASGCapture,
  cmDebug,
  StShlCtl, StdCtrls, ComCtrls, STSHRTCT, SsBase, lmdcont, LMDWaveComp,
  LMDCustomScrollBox, LMDScrollBox, lmdsplt, ucmaFrmBaseChat, cxControls,
  cxContainer, cxEdit, cxLabel, pngimage;

type
  TFrmPri = class(TForm)
    CM: TClienteCyberMgr;
    tmCronometro: TTimer;
    CMRem: TCMServidorRemoto;
    wlInicio: TWinList;
    WL: TWinList;
    Starter: TLMDStarter;
    Version: TLMDVersionInfo;
    tmPiscaTempo: TTimer;
    ASG: TASGScreenCapture;
    tmCapturar: TTimer;
    VI: TLMDVersionInfo;
    tmWinList: TTimer;
    SysInfo: TLMDSysInfo;
    tmAvisoTempo: TTimer;
    BarMgr: TdxBarManager;
    cmEncerrar: TdxBarButton;
    cmTempo: TdxBarStatic;
    cmValor: TdxBarStatic;
    lvDesktop: TStShellListView;
    cmDesktop: TdxBarLargeButton;
    cmMaq: TdxBarStatic;
    cmFechar: TdxBarButton;
    tmReconectar: TTimer;
    tmFirstConn: TTimer;
    cmNoNet: TdxBarStatic;
    TimerTaskMgr: TTimer;
    SC: TStShortcut;
    SE: TStShellEnumerator;
    GenList: TLMDGenericList;
    cmNomeCli: TdxBarStatic;
    dxBarLargeButton1: TdxBarLargeButton;
    cmAlterarSenha: TdxBarButton;
    TimerDesktop: TTimer;
    TimerLogin: TTimer;
    LMDSplitterPanel1: TLMDSplitterPanel;
    spDesktop: TLMDSplitterPane;
    spChat: TLMDSplitterPane;
    panHChat: TLMDSimplePanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    TimerChat: TTimer;
    procedure btnFecharClick(Sender: TObject);
    procedure tmCronometroTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CMShutdown(Sender: TObject; Operacao: Byte);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CMAoDesativar(Sender: TObject);
    procedure CMAoAtualizarMaquina(Sender: TObject);
    procedure tmCapturarTimer(Sender: TObject);
    procedure CMAoPedirTela(Sender: TObject);
    procedure CMAoTransferirArq(Sender: TObject; Etapa: Byte; MsgID,
      TamArq, Posicao: Integer; NomeArq: String; Enviando: Boolean);
    procedure tmWinListTimer(Sender: TObject);
    procedure ShutQueryShutdown(Sender: TObject; var CanShutdown: Boolean);
    procedure tmPiscaTempoTimer(Sender: TObject);
    procedure tmAvisoTempoTimer(Sender: TObject);
    procedure cmEncerrarClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure cmDesktopClick(Sender: TObject);
    procedure lvDesktopFilterItem(Sender: TObject; ShellItem: TStShellItem;
      var Accept: Boolean);
    procedure CMAoAtualizarConfig(Sender: TObject);
    procedure lvDesktopItemDblClick(Sender: TObject; Item: TStShellItem;
      var DefaultAction: Boolean);
    procedure tmReconectarTimer(Sender: TObject);
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
  private
    { Private declarations }
    FStatus : Integer;
    FslMenu : TStrings;
    FslRestr : TStrings;
    FslConfig : TStrings;
    FShutOp : Integer;
    { Public declarations }
    FProgAtual: String;
    FSempreVis : Boolean;
    FFecharExp : Boolean;
    FPodeNavegar : Boolean;
    FMostraCron : Boolean;
    FNoNet : Integer;

    FSaveH, FSaveW : Integer;
    FContador: Integer;
    FCodTipo : Integer;
    FStrTipo : String;
    FEXEs    : TStrings;
    FMotivoPausa : Byte;

    FPaginasImp : Integer;
    FPrinter : String;
    FCopias : Integer;
    FDoc : String;
    FPrintHookOk : Boolean;
    FMaqI, FMaqF, FMaq : Byte;
    FWav: TLMDWaveComp;
    
    
    procedure SetStatus(Value: Integer);
    procedure TelaLogin(Mostrar: Boolean);
    procedure TelaPausa(Mostrar: Boolean);
    procedure ChecaEstadoMaq(M : TCMMaquina);
    procedure FechaProgramas;
    procedure FechaExplorer(Forcar: Boolean);
    procedure SetCodTipo(const Value: Integer);
    procedure RefreshRestr;
    procedure MostraAviso(TempoRes: Cardinal);
    procedure Hook;
    function GetMotivoPausaStr: String;
    
    procedure HandlePrintNotification(var Message: TMessage); message WM_USER + 777;
  public
    FDesligaAviso : Boolean;
    FProt : TCMProtegeWindows;
    FMsgConn: String;
    FUAviso: Cardinal;
    FStayOnTopOff : Boolean;

    procedure FecharCMGuard;
    function ArqUsuarios: String;
    function ArqGrupos: String;
    function AchaDisplayName(S: String): TStShellItem;
    function NomeMaq: String; 
    procedure Conectar(Reconexao: Boolean);
    procedure AoMinimizar(Sender: TObject);
    procedure OnSettingChange(Sender: TObject; Flag: Integer; const Section: string; var Result: Longint);
    procedure LoadExes;
    procedure EnviarMsg(const aPara: Integer; const aTexto: String);
    procedure MudouAtencao(Sender: TObject);
    

    function StayOnTopOFF: Boolean;
    
    procedure AjustaTamanho;

    { Public declarations }
    property Status: Integer
      read FStatus write SetStatus;

    property slMenu: TStrings
      read FslMenu;

    property slRestr: TStrings
      read FslRestr;

    property slConfig: TStrings
     read FslConfig;

    property ProgAtual: String
      read FProgAtual write FProgAtual;

    property CodTipo: Integer
      read FCodTipo write SetCodTipo;

    property StrTipo: String
      read FStrTipo;

    property MotivoPausaStr: String
      read GetMotivoPausaStr;  

    property MotivoPausa: Byte
      read FMotivoPausa;
  end;

  TBoolArray = Array[1..10] of Boolean;
  PBoolArray = ^TBoolArray;

  function IniFName: String;

  function ObtemEXE(S: String): String;
  function ObtemParams(S: String): String;
  function ForceForegroundWindow(hwnd: THandle): boolean;

const
  stNaoCon    = 0;
  stPausaNoNet= 1;
  stConectado = 2;
  stConfig    = 3;
  stCliUsando = 4;
  stCliPausa  = 5;

  mpNenhum     = 0;
  mpFimCred    = 1;
  mpPausaAdmin = 2;
  mpRedeCaiu   = 3;
  

  StatusStr : Array[stNaoCon..stCliPausa] of String = (
    'NaoCon', 
    'PausaNoNet',
    'Conectado',
    'Config',
    'CliUsando',
    'CliPausa');

  CorNormal = $00C8D0D4;
  CorPisca  = clYellow;

var
  FrmPri: TFrmPri;
  FIni : TMemIniFile = nil;
  glShutOp : Integer;
  glForceShut : Boolean;
  glPowerOff : Boolean;
  FrmChat : TFrmBaseChat = nil;
  
  SenhaCli: String;
  StatusSenha: Byte = 0;
  
  ModoManut : Boolean = False;

  Fechar : Boolean = False;
  Buff : Array[1..1024] of Char; 

const
  ssObterSenha  = 0;
  ssSenhaObtida = 1;
  ssSenhaOK     = 2;

implementation

uses madCodeHook, Registry, uCMGPausa, uCMGLogin, uCMGConta, uCMGFrmAtualiza, cmIDRecursos,
  uCMGConfigDesktop, uCMGFake, uCMLVBack, uCMGAviso,
  ucmaFrmSenha;

{$R *.DFM}

type
  // this is what we our dll sends us
  TPrintNotification = record
    process : array [0..MAX_PATH] of char;
    api     : array [0..MAX_PATH] of char;
    params  : array [0..MAX_PATH] of char;
    result  : array [0..MAX_PATH] of char;
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
  Result := ExtractFilePath(ParamStr(0))+'cmguard.ini';
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
var 
  Valor     : Double;
  Maq       : TCMMaquina;
  CredUsado : Cardinal;
  TA        : TCMTipoAcesso;
  Usu       : TCMUsuario;
  MostraPreco : Boolean;
  TempoR, TempoCobrado, Tempo : Cardinal;
begin
  if CM.Ativo then
    cmNoNet.Visible := ivNever
  else
    cmNoNet.Visible := ivAlways;

  with CM do
  if (FStatus > stConectado) then begin

    Maq := MaquinaObj;
    if Maq=nil then begin
      cmTempo.Caption := 'ERRO';
      cmValor.Caption := 'Maq '+IntToStr(Maquina);
    end;      
    
    if (Maq<>nil) and ((Maq.Acesso>0) or Maq.Manutencao) and  (not Maq.AguardaPagto) then begin
      CredUsado := 0;
      if Maq.Manutencao then begin
        Tempo := Maq.NumTicks;
        Valor := 0;
        TempoCobrado := Maq.NumTicks;
        TA := nil;
        CodTipo := -1;
        Usu := Usuarios.PorUsername[Maq.UsuarioI];
        if (Usu<>nil) and (not Usu.Admin) and (Usu.MaxTempoManut>0) and ((Usu.MaxTempoManut*60000)<Tempo) then
          cmEncerrarClick(nil);
      end else begin
        TA := TiposAcesso.PorCodigo[Maq.TipoAcesso];
        if TA=nil then begin
          Tempo := 0;
          Valor := 0;
          TempoCobrado := 0;
          CodTipo := -1;
        end else begin
          Maq.Calculo(Tempo, TempoCobrado, CredUsado, Valor, TA.PHoraCor^, CorPrecos, Config.PacoteTempoReal);
          CodTipo := Maq.TipoAcesso;
        end;  

        if TicksToHMSSt(Tempo) < '00:01:00' then
          Tempo := Tempo + 1;

        TempoR := 0;

        if (Tempo<=Maq.LimiteTempo) and (Maq.CreditoCli<10000) then begin
          TempoR := Maq.LimiteTempo - Tempo;
          if Config.MostraPrePagoDec then
            Tempo := TempoR;
        end else
          if Maq.CreditoCli>10000 then
            TempoR := Tempo;

        MostraAviso(TempoR);    

        if (Maq.LimiteTempo>0) and (Tempo >= Maq.LimiteTempo) and (not Maq.Parado) then
          PararMaq(Maq.Numero, True)
        else
        if Maq.ParadoPacote then
        begin
          FMotivoPausa := mpFimCred;
          Status := stCliPausa;
        end else
        if (not Maq.Parado) and (Status=stCliPausa) then
          Status := stCliUsando;
      end;

      cmTempo.Caption := TicksToHMSSt(Tempo);
      cmValor.Caption := FloatToStrF(Valor+Maq.Vendas, ffCurrency, 10, 2);
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
        Application.Title := 'Cyber Manager';  
{      else
      if MostraCron then
        Application.Title := cmTempo.Caption
      else
      if MostraPreco then
        Application.Title := cmValor.Caption;}
        
    end else begin
      Caption := 'Cyber Manager';
      Application.Title := 'Cyber Manager';
    end;  
  end else begin
    Caption := 'Cyber Manager ';
    Application.Title := Caption;
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
var 
  M : TCMMaquina;
  S : String;
begin
  CM.Maquina :=StrToIntDef(slConfig.Values[NomeMaq], 0);
  CMRem.Host := slConfig.Values['Servidor'];
  CM.Programa := 'cmguard.exe';
  CM.Versao := FormataNumVersao(VI.FileVersion);
  CM.ArqDestino := ExtractFilePath(ParamStr(0))+'NCMGuard.EXE';

  cmMaq.Caption := 'Máq. ' + slConfig.Values[NomeMaq] +
                   ' | Serv. ' + slConfig.Values['Servidor'];

  try
    CM.Ativo := True;
  except
    On E: Exception do begin
      FrmLogin.lbErroConn.Caption :=
        'Erro de conexão com o servidor Cyber Manager: "' + E.Message + '".' + #13 +
        'Certifique-se que as informações de conexão estão '+
        'corretas e que o servidor Cyber Manager (CM-Server) esteja ' +
        'ativado no computador informado, e clique em OK.';
      Raise;  
    end;
  end;

  FrmLogin.lbErroConn.Caption :=
    'Informe o nome de rede ou endereço TCP/IP do computador onde está '+
    'instalado o servidor Cyber Manager (CM-Server) e o número desta '+
    'máquina e depois clique OK.';
    
  if (CM.TransferindoArq=taAtualizacao) then begin
    FrmLogin.Exibindo := False;
    Exit;
  end;

  DeleteFile(ExtractFilePath(ParamStr(0))+'NCMGuard.EXE');

  FslRestr.Text := CM.Config.CMGuard;
  RefreshRestr;

  Hook;

  CM.Usuarios.SalvaArquivo(ArqUsuarios);
  CM.Grupos.SalvaArquivo(ArqGrupos);

  FrmLogin.Paginas.ActivePage := FrmLogin.tsLogin;
  if FrmChat <> nil then FrmChat.NumMaq := CM.Maquina;

  M := CM.MaquinaObj;
  if M<>nil then with M do begin
    FslMenu.Text := Menu;
    FIni.SetStrings(slMenu);
    AtualizaCache;

    ComputerName := SysInfo.Computername;
    try
      CM.SalvaAlteracoesObj(M, False);
    except
    end;
    ChecaEstadoMaq(M);
  end else
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

procedure TFrmPri.FechaProgramas;
const
  ProgramasWMQuit = '|MSNMSGR.EXE|SKYPE.EXE|';
var 
  I : Integer;
  S : String;
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
//  Result := (S='MSNMSBLGENERIC');
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

  S := slRestr.Values['AposEncerrar'];
  if (S='1') or (S='2') then begin
    if S='1' then
      CMShutDown(nil, 1)
    else
      CMShutDown(nil, 3);  
    Exit;
  end;

  if not CM.Config.FecharProgramas then Exit;

  AC := @Buff;

  WL.Refresh(True);
  for I := 0 to pred(WL.Count) do with WL.Windows[I]^ do begin
    if WinCaption <> 'PROGRAM MANAGER' then
    if IEEXP(WndClassName) then
      FecharPorWM(WinHandle, True, False, False)
    else
    if Pos('|'+ExtractFileName(FName)+'|', ProgramasWMQUIT)>0 then begin
      PostMessage(WinHandle, WM_QUIT, 0, 0);
    end else  
    if (wlInicio.WindowByPID(ProcessID)=nil) then begin
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

//  CleanupSystemTray;   
end;

procedure TFrmPri.ChecaEstadoMaq(M : TCMMaquina);
begin
  if not CM.Ativo then Exit;

  if M = nil then Exit;

  CodTipo := M.TipoAcesso;
  
  if (M.Acesso > 0) and (not M.AguardaPagto) then begin
    if M.Parado or M.ParadoPacote then begin
      if M.Parado then
        FMotivoPausa := mpPausaAdmin
      else
        FMotivoPausa := mpFimCred;
      Status := stCliPausa;
    end else
      Status := stCliUsando;
  end else
  if M.Manutencao then 
    Status := stConfig
  else
    Status := stConectado;
end;

procedure TFrmPri.FecharCMGuard;
begin
  Fechar := True;
  Status := stNaoCon;
  Close;

  if FShutOp in [1..3] then
    glShutOp := FShutOp;

end;

procedure TFrmPri.SetStatus(Value: Integer);
var
  Antes : Integer;
  U : TCMUsuario;
  M : TCMMaquina;
begin
  if Value = FStatus then Exit;
  Antes := FStatus;
  FStatus := Value;
  TelaLogin((FStatus=stConectado));
  TelaPausa((FStatus in [stCliPausa, stPausaNoNet]));
  if Assigned(FrmAlteraSenha) then FrmAlteraSenha.Close;

{  if (FStatus in [stCliPausa, stCliUsando]) and
     (Value=stConectado) and
     (slRestr.Values['Resetar']='T') then
    CMShutdown(nil, 1);}

  cmDesktop.Visible := ivNever;

  if FStatus > stConectado then
    cmEncerrar.Visible := ivAlways
  else
    cmEncerrar.Visible := ivNever;

  if FStatus <> stConfig then
    cmFechar.Visible := ivNever;

  if not (FStatus in [stCliUsando, stCliPausa, stPausaNoNet]) then begin
    StatusSenha := ssObterSenha;
    SenhaCli := '';
  end;  

  lvDesktop.Options := lvDesktop.Options - [loShellMenu];
  lvDesktop.Enabled := FStatus > stConectado;
  cmNomeCli.Visible := ivNever;
  cmAlterarSenha.Visible := ivNever;

  cmMaq.AllowClick := False;

  with slRestr do
  case FStatus of
    stNaoCon, stConfig :
    begin
      if FrmConta <> nil then FrmConta.Close;
      FProt.DesativaProtecao;

      if (FStatus = stConectado) and (Antes in [stCliUsando, stCliPausa]) then
        FechaProgramas;
      FDesligaAviso := False;
      if CM.Ativo and (FStatus=stConfig) then  begin
        lvDesktop.Options := lvDesktop.Options + [loShellMenu];
        FProt.SetOpcaoBool(cmp_noTaskbar, False);
        FProt.AtivaProtecao;
        FProt.NoStartMenu := True;
        TFrmFake.Create(Self).ShowModal;
        FProt.NoStartMenu := False;
        FProt.DesativaProtecao;
        if (FStatus = stConfig) and (not StringToBool(Values['CtrlAltDel'])) then
        begin
          FProt.SetOpcaoBool(cmp_NoCtrlAltDel, True);
          FProt.SetOpcaoBool(cmp_NoDesktop   , False);
          FProt.SetOpcaoBool(cmp_NoAltTab    , False);
          FProt.SetOpcaoBool(cmp_NoAltEsc    , False);
          FProt.SetOpcaoBool(cmp_NoWinkeys   , False);
          FProt.SetOpcaoBool(cmp_NoTaskbar   , False);
          FProt.SetOpcaoBool(cmp_NoTaskLinks , False);
          FProt.SetOpcaoBool(cmp_NoTaskTray  , False);
          FProt.SetOpcaoBool(cmp_NoCtrlEsc   , False);
          FProt.SetOpcaoBool(cmp_NoCtrlPanel , False);
          FProt.SetOpcaoBool(cmp_NoDownload  , False);
          FProt.SetOpcaoBool(cmp_NoRunCmd    , False);
          FProt.SetOpcaoBool(cmp_NoNetwork   , False);
          FProt.AtivaProtecao;
        end;  

        M := CM.MaquinaObj;
        if M=nil then
          U := nil
        else
          U := CM.Usuarios.PorUsername[M.UsuarioI];

        if (M<>nil) and (U<>nil) and CM.Permitido(U, daMaqFecharCMGuard) then
          cmFechar.Visible := ivAlways
        else
          cmFechar.Visible := ivNever;

        if CM.Permitido(U, daMaqConfigurar) then begin
          cmDesktop.Visible := ivAlways;
          cmMaq.AllowClick := True;
        end;  

      end;
    end;

    stConectado, stCliPausa, stPausaNoNet :
    begin
      if FrmConta <> nil then FrmConta.Close;
      FDesligaAviso := False;
      FProt.SetOpcaoBool(cmp_noAltTab, True);
      FProt.SetOpcaoBool(cmp_noCtrlAltDel , not StringToBool(Values['CtrlAltDel']));
      FProt.SetOpcaoBool(cmp_noNetwork , not StringToBool(Values['LiberarRede']));
      FProt.SetOpcaoBool(cmp_noAltEsc, True);
      FProt.SetOpcaoBool(cmp_noWinkeys, True);
      FProt.SetOpcaoBool(cmp_noTaskbar, True);
      FProt.SetOpcaoBool(cmp_noTaskLinks, False);
      FProt.SetOpcaoBool(cmp_noDesktop, True);
      FProt.SetOpcaoBool(cmp_noTaskTray, False);
      FProt.SetOpcaoBool(cmp_noCtrlEsc, True);
      FProt.NoStartMenu := not StringToBool(Values['MenuIniciar']);
      FProt.HideDrives := Values['EsconderDrives'];
      FProt.AtivaProtecao;
      if (FStatus = stConectado) and (Antes in [stCliUsando, stCliPausa]) then
        FechaProgramas;

      with slRestr do
      if (FStatus = stConectado) and
         (Win32Platform = VER_PLATFORM_WIN32_NT) and
         (Values['PaginaInicial']>'') then
        FProt.ForceIEStartPage(Values['PaginaInicial']);
    end;

    stCliUsando :
    begin
      FUAviso := GetTickCount;
      TFrmFake.Create(Self).ShowModal;
      tmAvisoTempo.Interval := DateTimeToSegundos(CM.Config.TempoMaxAlerta) * 1000;
      FProt.SetOpcaoBool(cmp_noAltTab, False);
      FProt.SetOpcaoBool(cmp_noCtrlAltDel , not StringToBool(Values['CtrlAltDel']));
      FProt.SetOpcaoBool(cmp_noAltEsc, False);
      FProt.SetOpcaoBool(cmp_noWinkeys , not StringToBool(Values['MenuIniciar']));
      FProt.SetOpcaoBool(cmp_noTaskbar, False);
      FProt.SetOpcaoBool(cmp_noDesktop , True);
      FProt.SetOpcaoBool(cmp_noTaskLinks , True);
      FProt.SetOpcaoBool(cmp_noTaskTray , not StringToBool(Values['Tray']));
      FProt.SetOpcaoBool(cmp_NoDownload, StringToBool(Values['BloquearDownload']));
      FProt.SetOpcaoBool(cmp_NoCtrlPanel, not StringToBool(Values['PainelControle']));
      FProt.SetOpcaoBool(cmp_NoRunCmd, not StringToBool(Values['CmdExec']));
      FProt.SetOpcaoBool(cmp_NoNetwork, not StringToBool(Values['LiberarRede']));
      FProt.NoStartMenu := not StringToBool(Values['MenuIniciar']);
      FProt.HideDrives := Values['EsconderDrives'];
      FProt.AtivaProtecao;
      FrmChat.RV.Clear;
      FrmChat.RV.Reformat;

      if Antes <> stCliPausa then begin
        wlInicio.Refresh(False);
        Starter.Command := CM.Config.AutoExecutar;
        if Starter.Command>'' then
        try
          Starter.Execute;
        except;
        end;  
      end;

      with CM.MaquinaObj do
      if Contato<>0 then begin
        cmNomeCli.Caption := NomeContato;
        cmNomeCli.Visible := ivAlways;
        cmAlterarSenha.Visible := ivAlways;
        if StatusSenha = ssObterSenha then begin
          SenhaCli := CM.ObtemSenhaCli(Contato);
          StatusSenha := ssSenhaObtida;
        end;
          
        if (SenhaCli='') then begin
          cmAlterarSenha.Caption := 'Criar uma Senha de Acesso';
          if StatusSenha<>ssSenhaOK then cmAlterarSenhaClick(nil);
        end else
          cmAlterarSenha.Caption := 'Alterar Senha de Acesso';
      end;
    end;  
  end;  
end;

procedure TFrmPri.CMShutdown(Sender: TObject; Operacao: Byte);
begin
  FShutOp := Operacao;

  Fechar := True;
  tmReconectar.Enabled := False;

  if CM.Ativo then
    CM.Ativo := False
  else
    FecharCMGuard;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
var
  R : TRegistry;
  S : String;
  I : Integer;
  P : PBoolArray;
begin
  FWav := TLMDWaveComp.Create(Self);
  FPrintHookOk := False;
  try
    genlist.Items[0].SaveToFile(ExtractFilePath(ParamStr(0))+'guardprintapi.dll');
  except
  end;  

  try
    genlist.Items[1].SaveToFile(ExtractFilePath(ParamStr(0))+'madCHook.dll');
  except
  end;  

  FPaginasImp := 0;
  FCopias := 1;
  FPrinter := '';
  FDoc := '';
  
  FStatus := -1;
  TimerTaskMgr.Enabled := (Win32Platform=VER_PLATFORM_WIN32_NT);
  Application.OnMinimize := AoMinimizar;
  Application.OnSettingChange := OnSettingChange;
  AjustaTamanho;
  tmFirstConn.Enabled := True;
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

  try
    if FileExists(ArqGrupos) then
      CM.Grupos.LeArquivo(ArqGrupos);
  except
  end;

  tmCronometro.Enabled := True;
  FStrTipo := 'Desktop';
  FCodTipo := -1;
  FIni := TMemIniFile.Create('');
  glShutOp := -1;
  if WIN32Platform = VER_PLATFORM_WIN32_NT then begin
    R := TRegistry.Create;
    try
      R.RootKey := HKEY_LOCAL_MACHINE;
      R.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon', True);
      if R.ValueExists('GinaDLL') then begin
        S := UpperCase(Trim(R.ReadString('GinaDLL')));
        if (S='DWLGINA.DLL') or (S='DGINA.DLL') OR (S='DWGINA.DLL') then
          R.DeleteValue('GinaDLL');
      end;
      R.CloseKey;  
    finally
      R.Free;
    end;
  end;
  FProt := TCMProtege98.Create(Self);
  FProt.AutoStart(True);
  
  VI.RetrieveFileName := ParamStr(0);
  FSaveH := -1;
  FSaveW := -1;
  FShutOp := -1;
  FStatus := -1;
  FslConfig   := TStringList.Create;
  FslMenu     := TStringList.Create;
  FslRestr := TStringList.Create;

  FProgAtual := '';
  if FileExists(IniFName) then
    FslConfig.LoadFromFile(IniFName);

  FStayOnTopOff := SameText(slConfig.Values['OkEdgePlayThe'], 'blues');
  DebugAtivo := SameText(slConfig.Values['Debug'], 'sim');
    
  cmMaq.Caption := 'Máq. ' + slConfig.Values[NomeMaq] + ' | Serv. ' + slConfig.Values['Servidor'];

  FExes := TStringList.Create;
  LoadExes;
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
{  if FPrintHookOk then
    UninjectLibrary(CURRENT_SESSION or SYSTEM_PROCESSES, 'guardprintapi.dll');}
  FExes.Free;
  FslMenu.Free;
  FslRestr.Free;
  FslConfig.Free;
  FProt.DesativaProtecao;
  FreeAndNil(FIni);
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

procedure TFrmPri.CMAoDesativar(Sender: TObject);
var M : TCMMaquina;
begin
  if Fechar or (FNoNet=obFecharCMGuard) then
    FecharCMGuard
  else begin
    tmReconectar.Enabled := True;
    M := CM.MaquinaObj;
    
    if (M <> nil) and (M.Acesso>0) and (not M.AguardaPagto) then
    case FNoNet of
      obPermitePrePago :
      if not M.PrePago then begin
        FMotivoPausa := mpRedeCaiu;
        Status := stPausaNoNet;
      end;  

      obBloqueioTotal  : begin
        FMotivoPausa := mpRedeCaiu;
        Status := stPausaNoNet;
      end;
    end;
  end;
end;

procedure TFrmPri.CMAoAtualizarMaquina(Sender: TObject);
begin
  if TCMMaquina(Sender).Numero = CM.Maquina then
    ChecaEstadoMaq(TCMMaquina(Sender));
end;

procedure TFrmPri.tmCapturarTimer(Sender: TObject);
var
  S: TMemoryStream;
  J: TJpegImage;
begin
  tmCapturar.Enabled := False;
  S := TMemoryStream.Create;
  J := TjpegImage.Create;
  try
    J.Assign(ASG.CaptureDesktop);
    J.CompressionQuality := 60;
    J.Compress;
    J.SaveToStream(S);
    if CM.Ativo then
    try
      CM.SalvaTela(S);
    except
    end;
  except
    tmCapturar.Enabled := False;
  end;
  J.Free;
  S.Free;
end;

procedure TFrmPri.CMAoPedirTela(Sender: TObject);
begin
  tmCapturar.Enabled := True;
end;

procedure TFrmPri.CMAoTransferirArq(Sender: TObject; Etapa: Byte; MsgID,
  TamArq, Posicao: Integer; NomeArq: String; Enviando: Boolean);
begin
  if (Etapa=2) and (CM.TransferindoArq=taAtualizacao) then begin
    if CM.Ativo then begin
      Fechar := True;
      CM.Ativo := False;
    end else
      FecharCMGuard;
    ExecFile(ExtractFilePath(ParamStr(0))+'NCMGuard.EXE');
  end;
end;

procedure TFrmPri.tmWinListTimer(Sender: TObject);
var 
  S: String;
  SP : PChar;
  Maq : TCMMaquina;
  H : HWND;
begin
  AjustaTamanho;
  if not CM.Ativo then Exit;

  H := GetForegroundWindow;
  SP := Allocmem(255);
  try
    GetWindowText(H, SP , 255);
    S := SP;
  finally
    FreeMem(SP, 255);
  end;
  
  if (S <> ProgAtual) or (Status in [stConectado, stCliPausa]) then begin
    ProgAtual := S;
    Maq := CM.MaquinaObj;
    if Maq<>nil then begin
      Maq.AtualizaCache;
      Maq.ProgramaAtual := S;
      try
        CM.SalvaAlteracoesObj(Maq, False);
      except
      end;
    end;
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
var Maq : TCMMaquina;
begin
  Maq := CM.MaquinaObj;

  with CM do
  if (Maq<>nil) and ((Status>stConectado) or (Maq.Acesso>0)) then begin
    if (Maq<>nil) then
    if Maq.Manutencao then begin
      if Ativo then
        ModoManutencao(Maquina, False);
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

        if not Ativo then begin
          Maq.ZeraInfoAcesso;
          Status := stConectado;
        end;
      end else
      if Ativo then
        CancLogoutMaq(Maquina);
    end;
  end;
end;

procedure TFrmPri.cmFecharClick(Sender: TObject);
begin
  CM.Ativo := False;
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
  SC  : TStShortcut;
  I : Integer;
begin
  if FCodTipo=Value then Exit;
  FStrTipo := 'Desktop'+IntToStr(Value);
  FCodTipo := Value;
  lvDesktop.Refresh;
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
begin
  Accept := (CodTipo<0) or ((FIni<>nil) and
            (FIni.ReadBool(StrTipo, ShellItem.Path, False) or
            (not FIni.ReadBool('Geral', 'Configurado', False))));
end;

procedure TFrmPri.CMAoAtualizarConfig(Sender: TObject);
begin
  FslRestr.Text := CM.Config.CMGuard;
  REfreshRestr;
end;

procedure TFrmPri.RefreshRestr;
begin
  if slRestr.Values['AposEncerrar']='' then
  if StringToBool(slRestr.Values['ReiniciarMaq']) then
    slRestr.Values['AposEncerrar'] := '1'
  else
    slRestr.Values['AposEncerrar'] := '0';
      
//  if FFundoTela='' then
    lvDesktop.Color := CM.Config.CorDesktop;

  TempoSumir := StrToIntDef(slRestr.Values['TempoSumir'], 15) * 1000;  

  lvDesktop.Font.Color := CM.Config.CorFDesktop;
  FNoNet      := StrToIntDef(slRestr.Values['NoNet'], 0);
  FFecharExp  := not StringToBool(slRestr.Values['MenuIniciar']);
  FMostraCron := not StringToBool(slRestr.Values['EsconderCronometro']);
  with BarMgr.BarByName('Barra') do
  case StrToIntDef(slRestr.Values['AlinhaBarra'], 0) of
    0 : DockingStyle := dsTop;
    1 : DockingStyle := dsBottom;
    2 : DockingStyle := dsLeft;
    3 : DockingStyle := dsRight;
  end;
  FrmLogin.RefreshTipoAcesso;
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

function TFrmPri.ArqUsuarios: String;
begin
  Result := SysInfo.WinSysPath + '\cmu.dat';
end;

function TFrmPri.ArqGrupos: String;
begin
  Result := SysInfo.WinSysPath + '\cmg.dat';
end;

procedure TFrmPri.tmFirstConnTimer(Sender: TObject);
begin
  tmFirstConn.Enabled := False;
  wlInicio.Refresh(False);
  Status := stConectado;
  if (slConfig.Values['Servidor']='') or (slConfig.Values[NomeMaq]='') then
    FrmLogin.Paginas.ActivePage := FrmLogin.tsConexao
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
  if FrmChat= nil then begin
    FrmChat := TFrmBaseChat.Create(Self);
    FrmChat.NumMaq := CM.Maquina;
    FrmChat.panPri.Parent := spChat;
    FrmChat.EnviarMsg := EnviarMsg;
    FrmChat.MudouAtencao := MudouAtencao;
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
  case FMotivoPausa of
    mpFimCred : Result := 'Tempo Esgotado';
    mpPausaAdmin : Result := 'Máquina pausada pelo Administrador';
    mpRedeCaiu   : Result := 'Máquina pausada por problemas de rede';
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

procedure MsgDebug(S: String);
begin
  Exit;
  ShowMessage(S);
end;

procedure TFrmPri.HandlePrintNotification(var Message: TMessage);
var S : String;
begin
  // was it really a message from our dll?
  MsgDebug('PrintNotification');
  
  if Message.lParam <> $777 then Exit;
  
  // yes it was, so extract the information and add it to our listview
  with TPrintNotification(pointer(Message.wParam)^) do 
  if (POS('SPOOL', UpperCase(ExtractFileName(process)))<>1) then begin
    S := UpperCase(Trim(api));
    MsgDebug('API='+S);
    if Pos('CREATEDC', S)=1 then begin
      FPrinter := Copy(Params, Pos('"', Params)+1, 255);
      FPrinter := Copy(FPrinter, 1, Pos('"', FPrinter)-1);
    end else
    if Pos('STARTDOC', S)=1 then begin
      FDoc := Copy(Params, Pos('"', Params)+1, 255);
      FDoc := Copy(FDoc, 1, Pos('"', FDoc)-1);
      FCopias := 1;
    end else
    if Pos('ENDPAGE', S)=1 then 
      Inc(FPaginasImp)
    else
    if Pos('DOCPROP', S)=1 then begin
      Delete(S, 1, 7);
      FCopias := StrToIntDef(S, 1);
    end else
    if (Pos('ENDDOC', S)=1) or (Pos('ABORTDOC', S)=1) then begin
      if (FPaginasImp>0) then
      if CM.Ativo then
      try
        MsgDebug('PaginasImp');
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

procedure TFrmPri.Hook;
var S: String;
begin
  if CM.Config.DesativaRegAutImp then Exit;
  
  if (Win32Platform <> VER_PLATFORM_WIN32_NT) and (not CM.Config.RegImp98) then Exit;
  if FPrintHookOk then Exit;
  // create an ipc message queue, so that our hook dll can contact us
  if not CreateIpcQueue(pchar('guardPrintMonitor' + IntToStr(GetCurrentSessionId)),
                        IpcPrintMessageCallback) then
    Exit;
  // the main work is done by our dll
  // which we inject into all processes in our session
  FPrintHookOk := InjectLibrary(CURRENT_SESSION or SYSTEM_PROCESSES, 'guardprintapi.dll');
  if not FPrintHookOk then 
    MsgDebug('inject failed '+IntToStr(GetLastError)); 
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

procedure TFrmPri.MostraAviso(TempoRes: Cardinal);
var 
  TempoS, TempoM : Cardinal;
  M : TkbmBlobStream;
  S: String;
begin                        
  if TempoRes < 10000 then Exit; 
  if (GetTickCount - FUAviso) < 55000 then Exit;
  TempoS := TempoRes div 1000;
  TempoM := TempoS div 60;
  TempoS := TempoS mod 60;
  if (TempoS<55) and (TempoS>4) then Exit;
  if TempoS>54 then Inc(TempoM);
  if CM.Avisos.Locate('Minutos', TempoM, []) then begin
    FUAviso := GetTickCount;
    if CM.Avisos.FieldByName('AvisoTexto').AsString > '' then
      TFrmAviso.Create(Self).Mostrar(CM.Avisos.FieldByName('AvisoTexto').AsString, CM.Avisos.FieldByName('SegAvisoTexto').AsInteger);
    if CM.Avisos.FieldByName('TocarSom').AsBoolean then with TBlobField(CM.Avisos.FieldByName('Som')) do
    if BlobSize > 0 then begin      
      try
        S := ExtractFilePath(ParamStr(0))+'temp.wav';
        SaveToFile(S);
        FWav.LoadFromFile(S);
        FWav.Play;
      except 
      end;    
    end;  
  end;
end;

function TFrmPri.StayOnTopOFF: Boolean;
begin
  Result := FStayOnTopOFF;
end;

procedure TFrmPri.cmAlterarSenhaClick(Sender: TObject);
var S: String;
begin
  try
    S := TFrmAlteraSenha.Create(nil).Editar(SenhaCli, cmNomeCli.Caption);
    if S<>SenhaCli then begin
      CM.SalvaSenhaCli(CM.MaquinaObj.Contato, S);
      SenhaCli := S;
      if SenhaCli='' then
        cmAlterarSenha.Caption := 'Criar uma Senha de Acesso'
      else
        cmAlterarSenha.Caption := 'Alterar Senha de Acesso';
    end;    
  finally
    StatusSenha := ssSenhaOK;
  end;    
end;

procedure TFrmPri.TimerDesktopTimer(Sender: TObject);
var S: String;
begin
  TimerDesktop.Enabled := False;
  if CM.NomeArqDesktop>'' then
  if FileExists(CM.NomeArqDesktop) then
    SetListViewBkImage(lvDesktop, CM.NomeArqDesktop);
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
    FrmChat.MsgEnv(DataHora, De, Para, Texto);
end;

procedure TFrmPri.panHChatClick(Sender: TObject);
begin
  FrmChat.meTexto.SetFocus;
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

end.

