unit uCMGPri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmCompCliente, LMDControl, LMDBaseControl, jpeg,
  LMDBaseGraphicControl, LMDGraphicControl, LMDBaseMeter, ShellApi,
  LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, dxPageControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, LMDClock, LMDLEDCustomLabel, LMDLEDLabel,
  ExtCtrls, Menus, cmClassesBase, cmServRemoto, 
  LMDCustomStatusBar, LMDStatusBar, cmProtecao, cmProtecao98,
  WindowList, LMDCustomSimpleLabel, LMDSimpleLabel,
  ImgList, LMDCustomComponent, LMDStarter, LMDVersionInfo,
  madremote, IniFiles, dxBarExtItems, dxBar, LMDSysInfo, ASGCapture,
  ComCtrls, StShlCtl;

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
    tmNaoMinimiza: TTimer;
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
    procedure btnFecharClick(Sender: TObject);
    procedure tmCronometroTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CMShutdown(Sender: TObject; Operacao: Byte);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CMAoDesativar(Sender: TObject);
    procedure CMAoAtualizarMaquina(Sender: TObject);
    procedure tmNaoMinimizaTimer(Sender: TObject);
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
  private
    { Private declarations }
    FStatus : Integer;
    FslMenu : TStrings;
    FslRestr : TStrings;
    FslConfig : TStrings;
    FFundoTela : String;
    FShutOp : Integer;
    { Public declarations }
    FProgAtual: String;
    FSempreVis : Boolean;
    FFecharExp : Boolean;
    FMostraCron : Boolean;
    FNoNet : Integer;

    FSaveH, FSaveW : Integer;
    FContador: Integer;
    FCodTipo : Integer;
    FStrTipo : String;

    procedure SetStatus(Value: Integer);
    procedure TelaLogin(Mostrar: Boolean);
    procedure TelaPausa(Mostrar: Boolean);
    procedure ChecaEstadoMaq(M : TCMMaquina);
    procedure FechaProgramas;
    procedure FechaExplorer;
    procedure SetCodTipo(const Value: Integer);
    procedure RefreshRestr;
  public
    FMotivoPausa : String;
    FDesligaAviso : Boolean;
    FProt : TCMProtegeWindows;
    FMsgConn: String;

    procedure FecharCMGuard;
    function ArqUsuarios: String;
    function ArqGrupos: String;
    procedure Conectar(Reconexao: Boolean);

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

    property FundoTela: String
      read FFundoTela;  
  end;

  function IniFName: String;

  function ObtemEXE(S: String): String;
  function ObtemParams(S: String): String;

const
  stNaoCon    = 0;
  stPausaNoNet= 1;
  stConectado = 2;
  stConfig    = 3;
  stCliUsando = 4;
  stCliPausa  = 5;

  CorNormal = $00C8D0D4;
  CorPisca  = clYellow;

var
  FrmPri: TFrmPri;
  FIni : TMemIniFile = nil;
  glShutOp : Integer;
  glForceShut : Boolean;
  glPowerOff : Boolean;
  ModoManut : Boolean = False;

var
  Fechar : Boolean = False;  

implementation

uses Registry, uCMGPausa, uCMGLogin, uCMGConta, uCMGFrmAtualiza, cmIDRecursos,
  uCMGConfigDesktop, uCMGFake;

{$R *.DFM}

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
  MostraPreco : Boolean;
  Tempo, TempoCobrado : Cardinal;
begin
  if CM.Ativo then
    cmNoNet.Visible := ivNever
  else
    cmNoNet.Visible := ivAlways;

  with CM do
  if (Status > stConectado) then begin

    Maq := MaquinaObj;
    if (Maq<>nil) and ((Maq.Acesso>0) or Maq.Manutencao) and  (not Maq.AguardaPagto) then begin
      CredUsado := 0;
      if Maq.Manutencao then begin
        Tempo := Maq.NumTicks;
        Valor := 0;
        TempoCobrado := Maq.NumTicks;
        TA := nil;
        CodTipo := -1;
      end else begin
        if FFecharExp then FechaExplorer;
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

{        tmPiscaTempo.Enabled := (not FDesligaAviso) and
                          (Maq.LimiteTempo>0) and
                          (Tempo < Maq.LimiteTempo) and
                          ((DateTimeToTicks(Config.AlertaFimTempo) > Maq.LimiteTempo) or
                          (Tempo >= (Maq.LimiteTempo - DateTimeToTicks(Config.AlertaFimTempo))));

        lbQuaseTerm.Visible :=  tmPiscaTempo.Enabled or (
                                (Maq.LimiteTempo>0) and
                                (Tempo < Maq.LimiteTempo) and
                                ((DateTimeToTicks(Config.AlertaFimTempo) > Maq.LimiteTempo) or
                                (Tempo >= (Maq.LimiteTempo - DateTimeToTicks(Config.AlertaFimTempo)))));

        lbQuaseTerm.Top := panDiv.Top - 1;

        if not tmPiscaTempo.Enabled then
          lbTempo.Color := CorNormal
        else begin
          SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
          if not tmAvisoTempo.Enabled then begin
            tmAvisoTempo.Interval := DateTimeToSegundos(Config.TempoMaxAlerta) * 1000;
            if tmAvisoTempo.Interval>0 then
              tmAvisoTempo.Enabled := True;
          end;
        end;}

        if Config.MostraPrePagoDec and (Tempo<=Maq.LimiteTempo) and (Maq.CreditoCli<10000) then
          Tempo := Maq.LimiteTempo - Tempo;

        if (Maq.LimiteTempo>0) and (Tempo >= Maq.LimiteTempo) and (not Maq.Parado) then
          PararMaq(Maq.Numero, True)
        else
        if Maq.ParadoPacote then
        begin
          FMotivoPausa := 'Crédito Esgotado';
          Status := stCliPausa;
        end else
        if (not Maq.Parado) and (Status=stCliPausa) then
          Status := stCliUsando;
      end;

      cmTempo.Caption := TicksToHMSSt(Tempo);
      cmValor.Caption := FloatToStrF(Valor, ffCurrency, 10, 2);
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
    Caption := 'Cyber Manager';
    Application.Title := 'Cyber Manager';
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
var M : TCMMaquina;
begin
  CM.Maquina :=StrToIntDef(slConfig.Values['Maquina'], 0);
  CMRem.Host := slConfig.Values['Servidor'];
  CM.Programa := 'cmguard.exe';
  CM.Versao := FormataNumVersao(VI.FileVersion);
  CM.ArqDestino := ExtractFilePath(ParamStr(0))+'NCMGuard.EXE';

  cmMaq.Caption := 'Máq. ' + slConfig.Values['Maquina'] +
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
    
  if CM.BaixandoAtualizacao then begin
    FrmLogin.Exibindo := False;
    Exit;
  end;

  DeleteFile(ExtractFilePath(ParamStr(0))+'NCMGuard.EXE');

  CM.Usuarios.SalvaArquivo(ArqUsuarios);
  CM.Grupos.SalvaArquivo(ArqGrupos);

  FrmLogin.Paginas.ActivePage := FrmLogin.tsLogin;

  M := CM.MaquinaObj;
  if M<>nil then with M do begin
    slRestr.Text := Recursos;
    FFundoTela := slRestr.Values['FundoTela'];
    slMenu.Text := Menu;
    slRestr.Text := CM.Config.CMGuard;
    RefreshRestr;
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

procedure TFrmPri.FechaExplorer;
var
  I : Integer;
  S : String;
begin
  if ModoManut then Exit;
  WL.Refresh;
  for I := 0 to pred(WL.Count) do with WL.Windows[I]^ do
  if (WndClassName='EXPLOREWCLASS') and
     not wlInicio.WinExists(WL.Windows[I])
  then
    PostMessage(WinHandle, WM_CLOSE, 0, 0);
end;

procedure TFrmPri.FechaProgramas;
var I : Integer;
begin
  if not CM.Config.FecharProgramas then Exit;
  WL.Refresh;
  for I := 0 to pred(WL.Count) do with WL.Windows[I]^ do
  if WndClassName='EXPLOREWCLASS' then begin
    if (WinCaption>'') and
       (WinCaption<>'PROGRAM MANAGER') and
       (wlInicio.WindowByHWND(WinHandle)=nil) then
      PostMessage(WinHandle, WM_CLOSE, 0, 0);
  end else begin
    if (wlInicio.WindowByPID(ProcessID)=nil) and IsWindowVisible(WinHandle) then
      if Win32Platform = VER_PLATFORM_WIN32_NT then
        FechaProc(ProcessID)
      else
        FechaProcesso(ProcessID);
//      PostMessage(WinHandle, WM_Close, 0, 0);
  end;
end;

procedure TFrmPri.ChecaEstadoMaq(M : TCMMaquina);
begin
  if not CM.Ativo then Exit;

  if M = nil then Exit;

  if (M.Acesso > 0) and (not M.AguardaPagto) then begin
    if M.Parado or M.ParadoPacote then begin
      if M.Parado then
        FMotivoPausa := 'Máquina pausada pelo administrador'
      else
        FMotivoPausa := 'Crédito Esgotado';  
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

  if FShutOp in [1..2] then
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

  lvDesktop.Options := lvDesktop.Options - [loShellMenu];
  lvDesktop.Enabled := FStatus > stConectado;

  cmMaq.AllowClick := False;

  with slRestr do
  case FStatus of
    stNaoCon, stConfig :
    begin
      if FrmConta <> nil then FrmConta.Close;
      FProt.DesativaProtecao;

      if (FStatus = stConectado) and (Antes in [stCliUsando, stCliPausa]) then
        FechaProgramas;
//      lbQuaseTerm.Visible := False;
      FDesligaAviso := False;
      if CM.Ativo and (FStatus=stConfig) then  begin
        lvDesktop.Options := lvDesktop.Options + [loShellMenu];
        FProt.SetOpcaoBool(cmp_noTaskbar, False);
        FProt.AtivaProtecao;
        FProt.NoStartMenu := True;
        TFrmFake.Create(Self).ShowModal;
        FProt.NoStartMenu := False;
        FProt.DesativaProtecao;

        M := CM.MaquinaObj;
        if M=nil then
          U := nil
        else
          U := CM.Usuarios.PorUsername[M.UsuarioI];

        if (M<>nil) and (U<>nil) and CM.Permitido(U, reMaquinas, taMaqFecharCMGuard) then
          cmFechar.Visible := ivAlways
        else
          cmFechar.Visible := ivNever;

        if CM.Permitido(U, reMaquinas, taMaqConfigurar) then begin
          cmDesktop.Visible := ivAlways;
          cmMaq.AllowClick := True;
        end;  

      end;
    end;

    stConectado, stCliPausa, stPausaNoNet :
    begin
      if FrmConta <> nil then FrmConta.Close;
//      lbQuaseTerm.Visible := False;
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

      with slRestr do
      if (FStatus = stConectado) and
         (Win32Platform = VER_PLATFORM_WIN32_NT) and
         (Values['PaginaInicial']>'') then
        FProt.ForceIEStartPage(Values['PaginaInicial']);
    end;

    stCliUsando :
    begin
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
      FProt.NoStartMenu := not StringToBool(Values['MenuIniciar']);
      FProt.AtivaProtecao;

      if Antes <> stCliPausa then begin
        wlInicio.Refresh;
        Starter.Command := CM.Config.AutoExecutar;
        if Starter.Command>'' then
        try
          Starter.Execute;
        except;
        end;  
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
begin
  tmFirstConn.Enabled := True;
  try
    if FileExists(ArqUsuarios) then
      CM.Usuarios.LeArquivo(ArqUsuarios);
  except
  end;

  try
    if FileExists(ArqGrupos) then
      CM.Grupos.LeArquivo(ArqGrupos);
  except
  end;

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

  cmMaq.Caption := 'Máq. ' + slConfig.Values['Maquina'] +
                   ' | Serv. ' + slConfig.Values['Servidor'];
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
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
        FMotivoPausa := 'Máquina pausada por problemas de rede';
        Status := stPausaNoNet;
      end;  

      obBloqueioTotal  : begin
        FMotivoPausa := 'Máquina pausada por problemas de rede';
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

procedure TFrmPri.tmNAOminimizaTimer(Sender: TObject);
begin
  Height := Screen.WorkAreaHeight;
  Width := Screen.WorkAreaWidth;
  Left := 0;
  Top := 0;
  Application.Restore;
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
  if Etapa=2 then begin
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
  Maq : TCMMaquina;
begin
  if not CM.Ativo then Exit;

  WL.Refresh;
  S := WL.CaptionForeGround;
{  Inc(FContador);
  S := IntToStr(FCOntador);}
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
begin
  if FCodTipo=Value then Exit;
  FStrTipo := 'Desktop'+IntToStr(Value);
  FCodTipo := Value;
  lvDesktop.Refresh;
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
  wlInicio.Refresh;
  Status := stConectado;
  if (slConfig.Values['Servidor']='') or (slConfig.Values['Maquina']='') then
    FrmLogin.Paginas.ActivePage := FrmLogin.tsConexao
  else
    tmReconectarTimer(nil);  
end;

end.
